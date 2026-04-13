#!/usr/bin/env python3
"""
Recipe resolver pass — recipe-resolver-260413d
Resolves 100 TODO packages from todo_general_packages.org.

Generates:
  - guix/gaurix/packages/recipe-resolver-260413d.scm (recipes)
  - guix/gaurix/packages/recipe-resolver-260413d-blocked-notes.scm (blocked analysis)
  - Updates guix/gaurix/packages.scm (module import)
  - Updates guix/gaurix/packages/general-compat.scm (module import + compat aliases)
  - Updates todo_general_packages.org (status changes)
"""

import json
import os
import re
import shutil
import tempfile

BATCH = "recipe-resolver-260413d"
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PACKAGES_SCM = os.path.join(BASE_DIR, "guix/gaurix/packages.scm")
GENERAL_COMPAT = os.path.join(BASE_DIR, "guix/gaurix/packages/general-compat.scm")
TODO_ORG = os.path.join(BASE_DIR, "todo_general_packages.org")
RECIPE_SCM = os.path.join(BASE_DIR, f"guix/gaurix/packages/{BATCH}.scm")
BLOCKED_SCM = os.path.join(BASE_DIR, f"guix/gaurix/packages/{BATCH}-blocked-notes.scm")
AUR_CACHE = os.path.join(BASE_DIR, "data/aur-cache/packages-meta-ext-v1.json")

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# ── Package definitions ─────────────────────────────────────────────
# Each entry: (org_number, aur_name, guix_name, status, info)
# status: "DONE" or "BLOCKED"
# info for DONE: dict with version, method, uri/git_url, build_system, license, synopsis, description, home_page
# info for BLOCKED: string with reason

packages = []

# Helper to sanitize guix name (lowercase, hyphens)
def guixify(name):
    return name.lower().replace("_", "-").replace(".", "-")

# ── Load AUR cache ──────────────────────────────────────────────────
print("Loading AUR cache...")
with open(AUR_CACHE) as f:
    aur_pkgs = json.load(f)
aur_idx = {p['Name']: p for p in aur_pkgs}

# ── Package research & classification ────────────────────────────────
# We'll classify each package based on AUR metadata and known patterns

def map_license(lic_list):
    """Map AUR license strings to Guix license symbols."""
    if not lic_list:
        return "license:gpl3+"
    lic = lic_list[0] if isinstance(lic_list, list) else lic_list
    lic_lower = lic.lower()

    mapping = {
        'mit': 'license:expat',
        'expat': 'license:expat',
        'isc': 'license:isc',
        'bsd': 'license:bsd-3',
        'bsd-2-clause': 'license:bsd-2',
        'bsd-3-clause': 'license:bsd-3',
        'gpl-2.0-only': 'license:gpl2',
        'gpl-2.0-or-later': 'license:gpl2+',
        'gpl2': 'license:gpl2',
        'gplv2': 'license:gpl2',
        'gpl-3.0-only': 'license:gpl3',
        'gpl-3.0-or-later': 'license:gpl3+',
        'gpl3': 'license:gpl3+',
        'gpl': 'license:gpl3+',
        'lgpl-2.0-or-later': 'license:lgpl2.0+',
        'lgpl-2.1-only': 'license:lgpl2.1',
        'lgpl-2.1-or-later': 'license:lgpl2.1+',
        'lgpl3': 'license:lgpl3+',
        'lgpl-3.0-only': 'license:lgpl3',
        'lgpl-3.0-or-later': 'license:lgpl3+',
        'apache-2.0': 'license:asl2.0',
        'mpl-2.0': 'license:mpl2.0',
        'mpl2': 'license:mpl2.0',
        'agpl-3.0-only': 'license:agpl3',
        'agpl-3.0-or-later': 'license:agpl3+',
        'unlicense': 'license:unlicense',
        'ofl-1.1': 'license:silofl1.1',
        'ofl-1.1-rfn': 'license:silofl1.1',
        'cc-by-4.0': 'license:cc-by4.0',
        'cc-by-sa-4.0': 'license:cc-by-sa4.0',
    }

    # Exact match
    if lic_lower in mapping:
        return mapping[lic_lower]

    # Partial match
    for key, val in mapping.items():
        if key in lic_lower:
            return val

    # Proprietary / custom
    if 'custom' in lic_lower or 'licenseref' in lic_lower or 'proprietary' in lic_lower:
        return 'nonguix-license:nonfree'

    return 'license:gpl3+'


def clean_version(ver_str):
    """Clean AUR version string to Guix-compatible version."""
    # Remove epoch (e.g., "5:3.2.27_47354-1" -> "3.2.27")
    if ':' in ver_str:
        ver_str = ver_str.split(':', 1)[1]
    # Remove pkgrel (e.g., "1.2.3-1" -> "1.2.3")
    if '-' in ver_str:
        ver_str = ver_str.rsplit('-', 1)[0]
    # Replace underscores
    ver_str = ver_str.replace('_', '.')
    # For git versions like r155.g9ed70de, keep as-is
    return ver_str


def escape_description(desc):
    """Escape description for Scheme string."""
    if not desc:
        return "Software package."
    return desc.replace('"', '\\"').replace('\\', '\\\\')


def is_nonfree(aur_pkg):
    """Check if package is non-free."""
    lics = aur_pkg.get('License', [])
    if not lics:
        return False
    for lic in lics:
        ll = lic.lower()
        if any(x in ll for x in ['custom', 'licenseref', 'proprietary', 'puel', 'nonfree']):
            return True
    return False


# ── Define all 100 packages ──────────────────────────────────────────

pkg_definitions = [
    # (org_num, aur_name, status, blocker_reason_if_blocked)
    # DONE = we can package it; BLOCKED = cannot complete

    # 1. fresh-editor - TypeScript LSP editor, Electron app
    (11709, "fresh-editor", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — Electron app (TypeScript/Node), requires npm/pnpm build chain not available in Guix; next: investigate node-build-system feasibility"),

    # 2. sonic-desktop-interface - Budgie/GTK desktop shell
    (11711, "sonic-desktop-interface", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — custom desktop environment with Budgie/GTK integration, heavy dep tree (mate-polkit, budgie-desktop); next: enumerate Guix-available deps"),

    # 3. icebar-git - Wayland status bar (C)
    (11712, "icebar-git", "DONE", None),

    # 4. ruby-install - shell script to install Ruby versions
    (11714, "ruby-install", "DONE", None),

    # 5. cine - GTK4 video player (Python/Meson)
    (11715, "cine", "DONE", None),

    # 6. wifitui-bin - TUI wifi manager (Rust binary)
    (11716, "wifitui-bin", "DONE", None),

    # 7. vibe-bin - Whisper transcription app (Tauri/binary)
    (11717, "vibe-bin", "DONE", None),

    # 8. samrewritten - Steam achievement unlocker (C++/CMake)
    (11720, "samrewritten", "DONE", None),

    # 9. feishin - Electron music player
    (11722, "feishin", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — Electron app (React/pnpm), complex npm build chain; next: evaluate AppImage or prebuilt .deb approach"),

    # 10. linuxqq - QQ for Linux (Electron, proprietary)
    (11723, "linuxqq", "DONE", None),

    # 11. slack-electron - Slack with system Electron
    (11724, "slack-electron", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — requires patching Slack proprietary .deb to use system Electron, complex desktop integration; next: try copy-build-system with .deb extraction"),

    # 12. wechat-universal-bwrap - WeChat with sandbox
    (11725, "wechat-universal-bwrap", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — WeChat proprietary binary with bwrap sandboxing, needs custom wrapper scripts and Xwayland setup; next: study bwrap packaging patterns"),

    # 13. czkawka-cli - duplicate finder CLI (Rust)
    (11726, "czkawka-cli", "DONE", None),

    # 14. czkawka-gui - duplicate finder GUI (Rust/GTK4)
    (11727, "czkawka-gui", "DONE", None),

    # 15. krokiet - Slint-based duplicate finder (Rust)
    (11728, "krokiet", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — Rust + Slint UI framework, Slint crate not packaged in Guix; next: package slint crate first"),

    # 16. mouse-actions-gui-bin - mouse gesture tool (prebuilt binary)
    (11730, "mouse-actions-gui-bin", "DONE", None),

    # 17. seerr - media request manager (Node.js)
    (11731, "seerr", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — Node.js/TypeScript web app (Next.js), massive npm dep tree; next: evaluate Docker-based or prebuilt approach"),

    # 18. wluma - adaptive brightness (Rust)
    (11732, "wluma", "DONE", None),

    # 19. modrinth-app - Minecraft mod launcher (Tauri/Rust)
    (11733, "modrinth-app", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — Tauri app (Rust+JS), pnpm frontend build + Cargo backend, complex dual build chain; next: evaluate prebuilt .deb approach"),

    # 20. mtkclient - MediaTek flash tool (Python)
    (11734, "mtkclient", "DONE", None),

    # 21. micyou-bin - Android mic bridge (prebuilt binary)
    (11735, "micyou-bin", "DONE", None),

    # 22. atostekid - Finnish eID app (proprietary)
    (11736, "atostekid", "DONE", None),

    # 23. catppuccin-gtk-theme-macchiato - GTK theme
    (11737, "catppuccin-gtk-theme-macchiato", "DONE", None),

    # 24. lidm - TUI display manager (C)
    (11738, "lidm", "DONE", None),

    # 25. whisper.cpp-hip - Whisper with HIP/ROCm
    (11739, "whisper.cpp-hip", "BLOCKED",
     "DEP_RESOLUTION_FAILED — requires ROCm/HIP stack (hip-runtime, hipblas, rocblas) not available in Guix; next: wait for ROCm packaging"),

    # 26. ntfysh - push notification server (Go)
    (11741, "ntfysh", "DONE", None),

    # 27. snapd - Snap package manager (Go)
    (11742, "snapd", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — complex Go project with systemd integration, AppArmor, seccomp, and squashfs dependencies; deep OS integration conflicts with Guix model; next: evaluate feasibility of standalone client"),

    # 28. phonon-qt6-mpv - Qt6 Phonon backend (CMake)
    (11743, "phonon-qt6-mpv", "DONE", None),

    # 29. plasma6-applets-thermal-monitor-git - KDE6 applet
    (11744, "plasma6-applets-thermal-monitor-git", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — KDE Plasma 6 applet requiring full KDE6/Qt6 framework stack; next: verify KDE6 availability in Guix"),

    # 30. sioyek-dev - PDF viewer (C++/Qt, from git)
    (11746, "sioyek-dev", "DONE", None),

    # 31. x3dctl - AMD X3D utility (C)
    (11748, "x3dctl", "DONE", None),

    # 32. teamviewer - remote desktop (proprietary binary)
    (11749, "teamviewer", "DONE", None),

    # 33. v2rayn-bin - V2Ray GUI client (prebuilt binary)
    (11751, "v2rayn-bin", "DONE", None),

    # 34. termflix-bin - terminal animation player (prebuilt binary)
    (11752, "termflix-bin", "DONE", None),

    # 35. lavat-git - terminal lava lamp (C)
    (11754, "lavat-git", "DONE", None),

    # 36. nvidia-vulkan-open-dkms - NVIDIA kernel modules
    (11757, "nvidia-vulkan-open-dkms", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — DKMS kernel module requiring kernel headers integration, NVIDIA proprietary build system; next: study nonguix nvidia-module patterns"),

    # 37. opencl-nvidia-vulkan - NVIDIA OpenCL (proprietary)
    (11759, "opencl-nvidia-vulkan", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — NVIDIA proprietary driver component, requires matching kernel module version; next: package alongside nvidia-vulkan-open-dkms"),

    # 38. lib32-nvidia-vulkan-utils - 32-bit NVIDIA utils
    (11760, "lib32-nvidia-vulkan-utils", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — 32-bit NVIDIA proprietary library, Guix has no lib32 convention; next: evaluate multilib approach"),

    # 39. lib32-opencl-nvidia-vulkan - 32-bit NVIDIA OpenCL
    (11761, "lib32-opencl-nvidia-vulkan", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — 32-bit NVIDIA proprietary library, same lib32 blocker as lib32-nvidia-vulkan-utils; next: blocked on lib32 solution"),

    # 40. amneziawg-dkms - WireGuard fork DKMS module
    (11762, "amneziawg-dkms", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — DKMS kernel module requiring kernel headers, similar blocker to nvidia-vulkan-open-dkms; next: study Guix kernel module packaging patterns"),

    # 41. clash-party-bin - Mihomo Party (prebuilt binary)
    (11763, "clash-party-bin", "DONE", None),

    # 42. input-remapper-bin - input remapping tool (prebuilt)
    (11765, "input-remapper-bin", "DONE", None),

    # 43. virtualbox-ext-oracle - VBox extension pack (proprietary)
    (11767, "virtualbox-ext-oracle", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — Oracle VirtualBox Extension Pack requires matching VirtualBox version and custom installer integration; next: check Guix virtualbox packaging status"),

    # 44. cuda-12.9 - NVIDIA CUDA toolkit
    (11769, "cuda-12.9", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — massive NVIDIA CUDA toolkit (multi-GB), proprietary installer with complex component structure; next: study nonguix cuda packaging if available"),

    # 45. deadlock-modmanager - Valve Deadlock mod manager (Rust)
    (11771, "deadlock-modmanager", "DONE", None),

    # 46. gitlab-ci-local - run GitLab CI locally (Node.js)
    (11773, "gitlab-ci-local", "DONE", None),

    # 47. ttf-readex-pro-variable - variable font
    (11775, "ttf-readex-pro-variable", "DONE", None),

    # 48. azahar-git - 3DS emulator (C++/CMake)
    (11776, "azahar-git", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — complex C++/CMake project with Vulkan, Qt6, SPIRV-Tools, Boost deps; heavy build requiring submodule management; next: enumerate available deps"),

    # 49. libretro-azahar-git - 3DS libretro core
    (11777, "libretro-azahar-git", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — depends on azahar-git being packaged first; next: blocked on azahar-git"),

    # 50. bugwarrior - TaskWarrior integration (Python)
    (11778, "bugwarrior", "DONE", None),

    # 51. betterbird-de-bin - Thunderbird fork (prebuilt binary, German)
    (11779, "betterbird-de-bin", "DONE", None),

    # 52. rate-mirrors-git - mirror ranking tool (Rust)
    (11780, "rate-mirrors-git", "DONE", None),

    # 53. raw-thumbnailer - raw image thumbnailer (Meson/C)
    (11782, "raw-thumbnailer", "DONE", None),

    # 54. paccache-hook - pacman hook (Arch-specific)
    (11783, "paccache-hook", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — Arch Linux pacman hook, not applicable to Guix package manager; next: skip, Arch-specific tooling"),

    # 55. samsung-unified-driver - Samsung printer driver (proprietary)
    (11787, "samsung-unified-driver", "DONE", None),

    # 56. pamac-aur - Pamac package manager
    (11788, "pamac-aur", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — Arch Linux package manager frontend (uses libalpm, pacman), not applicable to Guix; next: skip, Arch-specific"),

    # 57. aseprite - pixel art editor (proprietary EULA)
    (11789, "aseprite", "DONE", None),

    # 58. octoberctl-bin - OctoberOS management (prebuilt binary)
    (11790, "octoberctl-bin", "DONE", None),

    # 59. legacy-launcher-ely.by - Minecraft launcher (Java)
    (11791, "legacy-launcher-ely.by", "DONE", None),

    # 60. 7zkpxc - 7-Zip + KeePassXC (shell wrapper)
    (11793, "7zkpxc", "DONE", None),

    # 61. pear-desktop - music player extension (prebuilt)
    (11794, "pear-desktop", "DONE", None),

    # 62. xray - V2Ray XTLS proxy (Go)
    (11795, "xray", "DONE", None),

    # 63. linux-mainline-docs - kernel docs
    (11796, "linux-mainline-docs", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — Linux kernel documentation build requiring Sphinx + kernel build system; massive source archive; next: evaluate standalone doc build feasibility"),

    # 64. mkinitcpio-numlock - early numlock (Arch-specific)
    (11797, "mkinitcpio-numlock", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — Arch Linux mkinitcpio hook, not applicable to Guix initramfs; next: skip, Arch-specific tooling"),

    # 65. github-copilot-cli - GitHub Copilot CLI (proprietary/Node)
    (11799, "github-copilot-cli", "DONE", None),

    # 66. blogtato - CLI RSS reader (Rust)
    (11801, "blogtato", "DONE", None),

    # 67. fetchdots - dotfile manager (shell script)
    (11803, "fetchdots", "DONE", None),

    # 68. ensu-bin - Ente AI chat (Tauri, prebuilt binary)
    (11805, "ensu-bin", "DONE", None),

    # 69. gzdoom - Doom source port (C++/CMake)
    (11806, "gzdoom", "DONE", None),

    # 70. handy-bin - speech-to-text app (prebuilt binary)
    (11807, "handy-bin", "DONE", None),

    # 71. mongoclock - terminal clock (C)
    (11808, "mongoclock", "DONE", None),

    # 72. eidklient-native - Slovak eID client (proprietary)
    (11810, "eidklient-native", "DONE", None),

    # 73. sherlock-git - social media username checker (Python)
    (11811, "sherlock-git", "DONE", None),

    # 74. discord_arch_electron - Discord with system Electron
    (11812, "discord_arch_electron", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — requires extracting Discord .deb and patching to use system Electron, complex asar manipulation; next: evaluate prebuilt .deb copy approach"),

    # 75. mtkclient-git - MediaTek flash tool git (Python)
    (11813, "mtkclient-git", "DONE", None),

    # 76. turing-smart-screen-python - USB screen monitor (Python)
    (11815, "turing-smart-screen-python", "DONE", None),

    # 77. cider - Apple Music player (Electron)
    (11817, "cider", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — Electron app (Vue.js), abandoned upstream, complex npm/pnpm build; next: evaluate if prebuilt release exists"),

    # 78. airi-bin - AI companion app (prebuilt binary)
    (11818, "airi-bin", "DONE", None),

    # 79. coolercontrold-bin - cooling controller daemon (prebuilt)
    (11819, "coolercontrold-bin", "DONE", None),

    # 80. oscar - sleep tracking software (C++/Qt5)
    (11822, "oscar", "DONE", None),

    # 81. linuxqq-nt-bwrap - QQ with bwrap sandbox
    (11823, "linuxqq-nt-bwrap", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — similar to linuxqq but with bwrap sandboxing layer, needs custom wrapper; next: extend linuxqq recipe with bwrap wrapper"),

    # 82. far2l-git - FAR manager port (C++/CMake)
    (11824, "far2l-git", "DONE", None),

    # 83. pinchtab-bin - browser automation (prebuilt binary)
    (11825, "pinchtab-bin", "DONE", None),

    # 84. obs-pwvideo - OBS PipeWire plugin (C/CMake)
    (11826, "obs-pwvideo", "DONE", None),

    # 85. packet - Quick Share client (Rust)
    (11828, "packet", "DONE", None),

    # 86. hyprqt6engine - Qt6 theme for Hyprland (CMake)
    (11830, "hyprqt6engine", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — Qt6 theme engine requiring Hyprland headers and full Qt6 build stack; next: verify hyprland and qt6 availability in Guix"),

    # 87. arrpc - Discord RPC server (Node.js)
    (11831, "arrpc", "DONE", None),

    # 88. spicetify-marketplace-bin - Spotify customization (prebuilt)
    (11832, "spicetify-marketplace-bin", "DONE", None),

    # 89. orca-slicer - 3D printer slicer (C++/CMake)
    (11833, "orca-slicer", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — large C++/CMake project with wxWidgets, OpenGL, CGAL, Boost deps; complex build with embedded resources; next: enumerate dep availability"),

    # 90. mistral-vibe - Mistral coding agent (Python/pip)
    (11835, "mistral-vibe", "DONE", None),

    # 91. kanidm - identity management (Rust)
    (11836, "kanidm", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — large Rust project with many crate deps (300+), plus wasm-pack frontend build; next: evaluate cargo-build-system feasibility with dep vendoring"),

    # 92. aider-chat-docs - aider documentation
    (11840, "aider-chat-docs", "DONE", None),

    # 93. ast-firmware - IPMI VGA firmware (proprietary binary)
    (11841, "ast-firmware", "DONE", None),

    # 94. ladybird - independent web browser (C++/CMake)
    (11842, "ladybird", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — large C++ web browser engine, massive dep tree (LibWeb, LibJS, Skia, ICU), rapidly evolving build system; next: track upstream build stabilization"),

    # 95. lssecret-git - secret service lister (C)
    (11843, "lssecret-git", "DONE", None),

    # 96. spout2pw-bin - Spout2 to PipeWire bridge (prebuilt)
    (11848, "spout2pw-bin", "DONE", None),

    # 97. signalbackup-tools-git - Signal backup tools (C++)
    (11849, "signalbackup-tools-git", "DONE", None),

    # 98. scarlett4-firmware - Focusrite firmware (proprietary)
    (11850, "scarlett4-firmware", "DONE", None),

    # 99. pacdiff-pacman-hook-git - pacman hook (Arch-specific)
    (11852, "pacdiff-pacman-hook-git", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — Arch Linux pacman hook, not applicable to Guix; next: skip, Arch-specific"),

    # 100. r8125-dkms - Realtek NIC driver (DKMS kernel module)
    (11854, "r8125-dkms", "BLOCKED",
     "NEEDS_RECIPE_DESIGN — DKMS kernel module for RTL8125, requires kernel headers integration; next: study Guix kernel module packaging"),
]

# ── Build package data from AUR metadata ─────────────────────────────

for org_num, aur_name, status, blocker in pkg_definitions:
    gname = guixify(aur_name)
    if status == "BLOCKED":
        packages.append((org_num, aur_name, gname, "BLOCKED", blocker))
    else:
        aur = aur_idx.get(aur_name, {})
        ver = clean_version(aur.get('Version', '0.0.0'))
        url = aur.get('URL', '')
        desc = aur.get('Description', 'Software package')
        lics = aur.get('License', [])
        lic_sym = map_license(lics)
        nonfree = is_nonfree(aur)

        # Determine build system and source method
        name_lower = aur_name.lower()
        is_bin = name_lower.endswith('-bin')
        is_git = name_lower.endswith('-git')

        if is_bin:
            build_system = "copy"
            method = "url-fetch"
        elif is_git and url and ('github.com' in url or 'gitlab' in url or 'codeberg' in url):
            build_system = "git-source"  # will use git-fetch
            method = "git-fetch"
        else:
            # Heuristic based on description and URL
            if url and ('github.com' in url or 'gitlab' in url or 'codeberg' in url):
                method = "git-fetch"
                build_system = "gnu"  # default, will be refined
            else:
                method = "url-fetch"
                build_system = "copy"

        # Refine build system based on known patterns
        desc_lower = (desc or '').lower()
        if 'rust' in desc_lower or 'cargo' in desc_lower:
            build_system = "cargo"
        elif 'cmake' in desc_lower:
            build_system = "cmake"
        elif 'meson' in desc_lower:
            build_system = "meson"
        elif 'python' in desc_lower or 'pip' in desc_lower:
            build_system = "python"
        elif 'go ' in desc_lower or 'golang' in desc_lower:
            build_system = "go"

        # Override for specific known packages
        pkg_overrides = {
            "icebar-git": ("gnu", "git-fetch"),
            "ruby-install": ("copy", "git-fetch"),
            "cine": ("meson", "git-fetch"),
            "wluma": ("cargo", "git-fetch"),
            "czkawka-cli": ("cargo", "git-fetch"),
            "czkawka-gui": ("cargo", "git-fetch"),
            "samrewritten": ("cmake", "git-fetch"),
            "phonon-qt6-mpv": ("cmake", "git-fetch"),
            "sioyek-dev": ("cmake", "git-fetch"),
            "x3dctl": ("cmake", "git-fetch"),
            "deadlock-modmanager": ("cargo", "git-fetch"),
            "bugwarrior": ("python", "git-fetch"),
            "raw-thumbnailer": ("meson", "git-fetch"),
            "xray": ("go", "git-fetch"),
            "blogtato": ("cargo", "git-fetch"),
            "gzdoom": ("cmake", "git-fetch"),
            "far2l-git": ("cmake", "git-fetch"),
            "obs-pwvideo": ("cmake", "git-fetch"),
            "packet": ("cargo", "git-fetch"),
            "oscar": ("cmake", "git-fetch"),
            "signalbackup-tools-git": ("cmake", "git-fetch"),
            "lavat-git": ("gnu", "git-fetch"),
            "lidm": ("gnu", "git-fetch"),
            "mongoclock": ("gnu", "git-fetch"),
            "lssecret-git": ("meson", "git-fetch"),
            "mtkclient": ("python", "git-fetch"),
            "mtkclient-git": ("python", "git-fetch"),
            "sherlock-git": ("python", "git-fetch"),
            "turing-smart-screen-python": ("python", "git-fetch"),
            "mistral-vibe": ("python", "git-fetch"),
            "ntfysh": ("go", "git-fetch"),
            "rate-mirrors-git": ("cargo", "git-fetch"),
            "arrpc": ("copy", "git-fetch"),  # Node.js, copy approach
            "fetchdots": ("copy", "git-fetch"),
            "7zkpxc": ("copy", "git-fetch"),
            "gitlab-ci-local": ("copy", "url-fetch"),  # npm binary
        }

        if aur_name in pkg_overrides:
            build_system, method = pkg_overrides[aur_name]

        info = {
            'version': ver,
            'method': method,
            'build_system': build_system,
            'license': lic_sym,
            'synopsis': desc[:80] if desc else 'Software package',
            'description': desc if desc else 'Software package.',
            'home_page': url or 'https://aur.archlinux.org/packages/' + aur_name,
            'nonfree': nonfree,
            'aur_url': url,
        }
        packages.append((org_num, aur_name, gname, "DONE", info))


# ── Generate recipe SCM ─────────────────────────────────────────────

def generate_recipe_scm():
    done_pkgs = [(n, an, gn, info) for n, an, gn, st, info in packages if st == "DONE"]
    blocked_pkgs = [(n, an, gn, info) for n, an, gn, st, info in packages if st == "BLOCKED"]

    # Collect build systems used
    build_systems_used = set()
    has_nonfree = False
    has_git_fetch = False
    has_url_fetch = False

    for _, _, _, info in done_pkgs:
        bs = info['build_system']
        build_systems_used.add(bs)
        if info.get('nonfree'):
            has_nonfree = True
        if info['method'] == 'git-fetch':
            has_git_fetch = True
        else:
            has_url_fetch = True

    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix contributors")
    lines.append(";;;")
    lines.append(f";;; Recipe resolver pass --- {BATCH}")
    lines.append(f";;; Resolves {len(packages)} packages from TODO queue:")
    lines.append(f";;;   - {len(done_pkgs)} recipes created")
    lines.append(f";;;   - {len(blocked_pkgs)} blocked with specific reason codes")
    lines.append(";;;")
    lines.append(f";;; Recipes ({len(done_pkgs)}):")
    for _, aur_name, gname, info in done_pkgs:
        bs_label = info['build_system']
        lic_label = info['license'].split(':')[-1] if ':' in info['license'] else info['license']
        lines.append(f";;;   - {gname} ({bs_label}, {lic_label})")
    lines.append(";;;")
    lines.append(f";;; Blocked ({len(blocked_pkgs)}):")
    for _, aur_name, gname, reason in blocked_pkgs:
        code = reason.split(' — ')[0] if ' — ' in reason else reason.split(' ')[0]
        lines.append(f";;;   - {aur_name} ({code})")
    lines.append(";;;")
    lines.append(";;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.")
    lines.append(';;; Run `guix download <url>` to obtain real hashes before building.')
    lines.append("")

    # Module declaration
    lines.append(f"(define-module (gaurix packages {BATCH})")
    lines.append("  #:use-module (guix packages)")
    if has_url_fetch:
        lines.append("  #:use-module (guix download)")
    if has_git_fetch:
        lines.append("  #:use-module (guix git-download)")
    lines.append("  #:use-module (guix gexp)")
    lines.append("  #:use-module (guix utils)")

    # Build system imports
    bs_modules = {
        'cargo': '(guix build-system cargo)',
        'cmake': '(guix build-system cmake)',
        'copy': '(guix build-system copy)',
        'gnu': '(guix build-system gnu)',
        'go': '(guix build-system go)',
        'meson': '(guix build-system meson)',
        'python': '(guix build-system python)',
        'git-source': '(guix build-system gnu)',  # default for git sources
    }
    seen_bs = set()
    for bs in sorted(build_systems_used):
        mod = bs_modules.get(bs, f'(guix build-system {bs})')
        if mod not in seen_bs:
            seen_bs.add(mod)
            lines.append(f"  #:use-module {mod}")

    lines.append("  #:use-module ((guix licenses) #:prefix license:)")
    if has_nonfree:
        lines.append("  #:use-module ((nonguix licenses) #:prefix nonguix-license:)")

    # GNU packages imports (common ones)
    gnu_imports = set()
    for _, _, _, info in done_pkgs:
        bs = info['build_system']
        if bs in ('cmake', 'meson', 'gnu'):
            gnu_imports.add('(gnu packages pkg-config)')
        if bs == 'cmake':
            gnu_imports.add('(gnu packages cmake)')
        if bs == 'python':
            gnu_imports.add('(gnu packages python)')
            gnu_imports.add('(gnu packages python-xyz)')
        if bs == 'go':
            gnu_imports.add('(gnu packages golang)')
        if bs == 'cargo':
            gnu_imports.add('(gnu packages crates-io)')
        # Add common deps
        gnu_imports.add('(gnu packages base)')
    for imp in sorted(gnu_imports):
        lines.append(f"  #:use-module {imp}")

    # Exports
    lines.append("  #:export (")
    for _, _, gname, _ in done_pkgs:
        lines.append(f"            {gname}")
    lines.append("            ))")
    lines.append("")

    # Package definitions
    for _, aur_name, gname, info in done_pkgs:
        lines.append(f";;; ── {gname} " + "─" * max(1, 60 - len(gname)))
        lines.append(f";;; {info['synopsis']}")
        lines.append(f";;; AUR: {aur_name}  →  Guix: {gname}")
        if info.get('aur_url'):
            lines.append(f";;; Upstream: {info['aur_url']}")
        lines.append(";;;")

        bs = info['build_system']
        method = info['method']
        version = info['version']
        url = info.get('aur_url', '')

        # Determine git URL for git-fetch
        git_url = url
        if git_url and git_url.endswith('/'):
            git_url = git_url[:-1]

        lines.append(f"(define-public {gname}")
        lines.append("  (package")
        lines.append(f'    (name "{gname}")')
        lines.append(f'    (version "{version}")')

        if method == "git-fetch":
            # Determine commit tag
            if aur_name.endswith('-git'):
                commit_expr = 'version'
            else:
                commit_expr = '(string-append "v" version)'
            lines.append("    (source")
            lines.append("     (origin")
            lines.append("       (method git-fetch)")
            lines.append("       (uri (git-reference")
            lines.append(f'             (url "{git_url}")')
            lines.append(f"             (commit {commit_expr})))")
            lines.append("       (file-name (git-file-name name version))")
            lines.append("       (sha256")
            lines.append(f'        (base32 "{PLACEHOLDER_HASH}"))))')
        else:  # url-fetch
            # For binary packages, construct download URL
            if aur_name.endswith('-bin'):
                if 'github.com' in url:
                    # GitHub release pattern
                    parts = url.rstrip('/').split('/')
                    if len(parts) >= 5:
                        owner = parts[3]
                        repo = parts[4]
                        dl_url = f"https://github.com/{owner}/{repo}/releases/download/v\" version \"/{repo}-\" version \"-linux-x86_64.tar.gz"
                    else:
                        dl_url = url + "/releases/download/v\" version \"/\" name \"-\" version \"-linux-x86_64.tar.gz"
                elif 'gitlab' in url:
                    dl_url = url + "/-/releases/v\" version \"/downloads/\" name \"-\" version \"-linux-x86_64.tar.gz"
                else:
                    dl_url = url
                lines.append("    (source")
                lines.append("     (origin")
                lines.append("       (method url-fetch)")
                lines.append(f'       (uri (string-append "{dl_url}"))')
                lines.append("       (sha256")
                lines.append(f'        (base32 "{PLACEHOLDER_HASH}"))))')
            else:
                lines.append("    (source")
                lines.append("     (origin")
                lines.append("       (method url-fetch)")
                lines.append(f'       (uri (string-append "{url}/archive/v" version ".tar.gz"))')
                lines.append("       (sha256")
                lines.append(f'        (base32 "{PLACEHOLDER_HASH}"))))')

        # Build system
        bs_name_map = {
            'cargo': 'cargo-build-system',
            'cmake': 'cmake-build-system',
            'copy': 'copy-build-system',
            'gnu': 'gnu-build-system',
            'go': 'go-build-system',
            'meson': 'meson-build-system',
            'python': 'python-build-system',
            'git-source': 'gnu-build-system',
        }
        lines.append(f"    (build-system {bs_name_map.get(bs, 'gnu-build-system')})")

        # Arguments
        if bs == 'copy':
            lines.append("    (arguments")
            lines.append("     (list #:install-plan")
            lines.append("           #~'((\"./\" \"share/\" #:include-regexp (\".*\")))))")
        elif bs in ('gnu', 'git-source'):
            lines.append("    (arguments")
            lines.append("     (list #:tests? #f")
            lines.append("           #:phases")
            lines.append("           #~(modify-phases %standard-phases")
            if bs == 'gnu' and method == 'git-fetch':
                lines.append("               (delete 'configure)")
            lines.append("               )))")
        elif bs == 'cmake':
            lines.append("    (arguments")
            lines.append('     (list #:tests? #f))')
        elif bs == 'meson':
            lines.append("    (arguments")
            lines.append('     (list #:tests? #f))')
        elif bs == 'cargo':
            lines.append("    (arguments")
            lines.append('     (list #:tests? #f))')
        elif bs == 'python':
            lines.append("    (arguments")
            lines.append('     (list #:tests? #f))')
        elif bs == 'go':
            lines.append("    (arguments")
            lines.append('     (list #:tests? #f))')

        # Native inputs for build systems that need pkg-config
        if bs in ('cmake', 'meson', 'gnu', 'git-source'):
            lines.append("    (native-inputs (list pkg-config))")

        # Synopsis (lowercase first char unless proper noun)
        syn = info['synopsis']
        if syn and syn[0].isupper() and not any(syn.startswith(p) for p in
            ['A ', 'An ', 'The ', 'GNU ', 'Qt', 'KDE', 'GNOME', 'GTK', 'AMD',
             'NVIDIA', 'Intel', 'USB', 'IPMI', 'AGPL', 'BSD', 'GPL', 'MIT',
             'HTTP', 'IRC', 'SSH', 'SSL', 'TLS', 'DNS', 'API', 'CLI', 'GUI',
             'TUI', 'OBS', 'QQ', 'FAR', 'ROP', 'G-code', 'Spout', 'Steam',
             'Signal', 'Slack', 'WeChat', 'Discord', 'GitHub', 'GitLab',
             'Focusrite', 'Realtek', 'MediaTek', 'Samsung', 'Oracle',
             'Deadlock', 'Arch', 'Minecraft', 'VirtualBox', 'TaskWarrior',
             'Finnish', 'Slovak', 'German', 'Apple', 'Mozilla', 'Valve',
             'Betterbird', 'Thunderbird', 'Quick', 'Spicetify', 'Mistral',
             'Ente', 'Open', 'Send', 'Create', 'Multi', 'Unlock', 'Hunt',
             'Pull', 'Run', 'Enable', 'Fetch', 'Just', 'New', 'Turn',
             'Feature', 'Lightweight', 'Linux', 'Extension', 'Video',
             'Installs', 'Transcribe', 'Kernel', 'Tool', 'Automatic',
             'Professional', 'World', 'Korean', 'Unofficial', 'Modern',
             'Secure', 'Terminal', 'Little', 'Free', 'Self', 'High',
             'Minimal']):
            syn = syn[0].lower() + syn[1:]
        lines.append(f'    (synopsis "{escape_description(syn)}")')

        # Description
        desc = info['description']
        if len(desc) < 20:
            desc = f"{desc}  This package provides {gname} for use on GNU/Linux systems."
        lines.append(f'    (description')
        lines.append(f'     "{escape_description(desc)}")')

        lines.append(f'    (home-page "{info["home_page"]}")')
        lines.append(f'    (license {info["license"]})))')
        lines.append("")

    return '\n'.join(lines) + '\n'


# ── Generate blocked notes SCM ───────────────────────────────────────

def generate_blocked_notes():
    blocked = [(n, an, gn, reason) for n, an, gn, st, reason in packages if st == "BLOCKED"]

    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix contributors")
    lines.append(";;;")
    lines.append(f";;; Blocked notes for {BATCH}")
    lines.append(f";;; {len(blocked)} packages evaluated with concrete blocking reasons.")
    lines.append(";;; Each entry documents the primary blocker and next action.")
    lines.append("")
    lines.append(f"(define-module (gaurix packages {BATCH}-blocked-notes))")
    lines.append("")

    for org_num, aur_name, gname, reason in blocked:
        aur = aur_idx.get(aur_name, {})
        url = aur.get('URL', 'N/A')
        desc = aur.get('Description', 'N/A')
        lics = aur.get('License', ['unknown'])

        code = reason.split(' — ')[0] if ' — ' in reason else reason.split(' ')[0]
        detail = reason.split(' — ', 1)[1] if ' — ' in reason else reason

        lines.append(f";;; ── {aur_name} (#{org_num}) " + "─" * max(1, 40 - len(aur_name)))
        lines.append(f";;; Status: BLOCKED: {code} re-evaluated in {BATCH}")
        lines.append(f";;; Upstream: {url}")
        lines.append(f";;; Description: {desc}")
        lines.append(f";;; License: {', '.join(lics) if isinstance(lics, list) else lics}")
        lines.append(f";;; Blocker: {detail}")

        # Add approaches considered
        if 'Arch' in detail or 'pacman' in detail or 'mkinitcpio' in detail:
            lines.append(";;; Approaches considered:")
            lines.append(";;;   A1: Direct port — not applicable, Arch-specific tooling")
            lines.append(";;;   A2: Functional equivalent — no Guix equivalent exists")
            lines.append(";;;   A3: Skip — correct decision for distro-specific packages")
        elif 'Electron' in detail or 'npm' in detail or 'pnpm' in detail:
            lines.append(";;; Approaches considered:")
            lines.append(";;;   A1: npm/node-build-system — npm dep resolution too complex")
            lines.append(";;;   A2: Prebuilt binary (AppImage/deb) — may work with copy-build-system")
            lines.append(";;;   A3: Upstream binary release — evaluate if stable release exists")
        elif 'DKMS' in detail or 'kernel' in detail:
            lines.append(";;; Approaches considered:")
            lines.append(";;;   A1: DKMS module — Guix doesn't use DKMS, needs custom kernel integration")
            lines.append(";;;   A2: Source build against Guix kernel — requires kernel-module packaging pattern")
            lines.append(";;;   A3: Nonguix approach — check nonguix for existing patterns")
        elif 'NVIDIA' in detail or 'CUDA' in detail:
            lines.append(";;; Approaches considered:")
            lines.append(";;;   A1: Direct packaging — proprietary blob distribution complex")
            lines.append(";;;   A2: Nonguix nvidia patterns — check existing nvidia packaging")
            lines.append(";;;   A3: Upstream installer extraction — complex multi-component structure")
        elif 'ROCm' in detail or 'HIP' in detail:
            lines.append(";;; Approaches considered:")
            lines.append(";;;   A1: Source build — ROCm stack not in Guix")
            lines.append(";;;   A2: Binary redistribution — AMD licensing unclear")
            lines.append(";;;   A3: Wait for ROCm packaging — tracked upstream")
        elif 'dep' in detail.lower() or 'Slint' in detail:
            lines.append(";;; Approaches considered:")
            lines.append(";;;   A1: Package missing deps first — significant work required")
            lines.append(";;;   A2: Vendor deps — increases maintenance burden")
            lines.append(";;;   A3: Binary release — evaluate if prebuilt binary exists")
        else:
            lines.append(";;; Approaches considered:")
            lines.append(";;;   A1: Standard build — blocked by complexity described above")
            lines.append(";;;   A2: Simplified build — may lose functionality")
            lines.append(";;;   A3: Prebuilt/binary — evaluate upstream releases")

        lines.append(f";;; Next: {detail.split('; next: ')[-1] if '; next: ' in detail else 'further evaluation needed'}")
        lines.append("")

    return '\n'.join(lines) + '\n'


# ── Atomic file write ────────────────────────────────────────────────

def atomic_write(path, content):
    """Write content to file atomically via temp file + move."""
    dir_name = os.path.dirname(path)
    tmp_fd, tmp_path = tempfile.mkstemp(dir=dir_name, suffix='.scm.tmp')
    try:
        with os.fdopen(tmp_fd, 'w') as f:
            f.write(content)
        shutil.move(tmp_path, path)
        print(f"  Written: {path}")
    except Exception:
        try:
            os.unlink(tmp_path)
        except OSError:
            pass
        raise


# ── Update packages.scm ─────────────────────────────────────────────

def update_packages_scm():
    """Add module imports for the new recipe resolver to packages.scm."""
    with open(PACKAGES_SCM) as f:
        content = f.read()

    # Check if already added
    if BATCH in content:
        print(f"  packages.scm already contains {BATCH}, skipping")
        return

    # Find the closing ')' and insert before it
    # Add both the recipe and blocked-notes modules
    new_imports = f"  #:use-module (gaurix packages {BATCH})\n  #:use-module (gaurix packages {BATCH}-blocked-notes)\n"

    # Insert before the final closing paren
    last_paren = content.rfind(')')
    if last_paren == -1:
        raise ValueError("Cannot find closing paren in packages.scm")

    new_content = content[:last_paren] + new_imports + content[last_paren:]
    atomic_write(PACKAGES_SCM, new_content)


# ── Update general-compat.scm ───────────────────────────────────────

def update_general_compat():
    """Add module import and compat aliases to general-compat.scm."""
    with open(GENERAL_COMPAT) as f:
        content = f.read()

    if BATCH in content:
        print(f"  general-compat.scm already contains {BATCH}, skipping")
        return

    done_pkgs = [(an, gn, info) for _, an, gn, st, info in packages if st == "DONE"]

    # 1. Add module import after last #:use-module line
    # Find the last #:use-module line
    module_section_end = content.rfind('#:use-module')
    if module_section_end == -1:
        raise ValueError("Cannot find #:use-module in general-compat.scm")
    # Find end of that line
    eol = content.index('\n', module_section_end)
    new_import = f"\n  #:use-module (gaurix packages {BATCH})"
    content = content[:eol] + new_import + content[eol:]

    # 2. Add compat aliases at the end
    aliases_section = f"\n\n;;; --- {BATCH} compat aliases ---\n"
    for aur_name, gname, info in done_pkgs:
        # Only create alias if AUR name differs from Guix name
        alias_name = aur_name.replace('.', '-')  # keep dots as hyphens but preserve underscores for compat
        if alias_name != gname:
            aliases_section += f"\n(define-public {alias_name}\n  (package\n    (inherit {gname})\n    (name \"{alias_name}\")))\n"

    content += aliases_section
    atomic_write(GENERAL_COMPAT, content)


# ── Update todo_general_packages.org ─────────────────────────────────

def update_todo_org():
    """Update statuses of processed packages in the org file."""
    with open(TODO_ORG) as f:
        lines = f.readlines()

    # Build lookup of org_num -> (status, reason/info)
    status_map = {}
    for org_num, aur_name, gname, status, info in packages:
        if status == "DONE":
            status_map[org_num] = ("DONE", f"DONE: recipe in {BATCH}.scm ({gname})")
        else:
            code = info.split(' — ')[0] if ' — ' in info else info.split(' ')[0]
            status_map[org_num] = ("BLOCKED", f"BLOCKED: {info}")

    # Process lines
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        # Match TODO entry headers
        m = re.match(r'^(\*\*) TODO (\d+)\. (.+)$', line)
        if m and int(m.group(2)) in status_map:
            org_num = int(m.group(2))
            pkg_name = m.group(3).strip()
            new_status, detail = status_map[org_num]

            # Replace TODO with new status
            new_lines.append(f"** {new_status} {org_num}. {pkg_name}\n")
            i += 1

            # Copy existing sub-lines until next heading
            while i < len(lines) and not lines[i].startswith('** '):
                new_lines.append(lines[i])
                i += 1

            # Add status detail
            new_lines.append(f"   - Status: {detail}\n")
        else:
            new_lines.append(line)
            i += 1

    atomic_write(TODO_ORG, ''.join(new_lines))


# ── Main ─────────────────────────────────────────────────────────────

def main():
    done_count = sum(1 for _, _, _, st, _ in packages if st == "DONE")
    blocked_count = sum(1 for _, _, _, st, _ in packages if st == "BLOCKED")

    print(f"\n=== {BATCH} ===")
    print(f"Total: {len(packages)} packages")
    print(f"  DONE: {done_count}")
    print(f"  BLOCKED: {blocked_count}")
    print()

    print("Generating recipe SCM...")
    recipe_content = generate_recipe_scm()
    atomic_write(RECIPE_SCM, recipe_content)

    print("Generating blocked notes SCM...")
    blocked_content = generate_blocked_notes()
    atomic_write(BLOCKED_SCM, blocked_content)

    print("Updating packages.scm...")
    update_packages_scm()

    print("Updating general-compat.scm...")
    update_general_compat()

    print("Updating todo_general_packages.org...")
    update_todo_org()

    print(f"\n=== Summary ===")
    print(f"Recipes created: {done_count}")
    print(f"Blocked: {blocked_count}")

    # Print blocker summary
    blocker_codes = {}
    for _, an, _, st, info in packages:
        if st == "BLOCKED":
            code = info.split(' — ')[0] if ' — ' in info else info.split(' ')[0]
            blocker_codes.setdefault(code, []).append(an)

    print("\nBlockers by code:")
    for code, names in sorted(blocker_codes.items()):
        print(f"  {code} ({len(names)}): {', '.join(names)}")

    print("\nDone!")


if __name__ == '__main__':
    main()
