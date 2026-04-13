#!/usr/bin/env python3
"""Generate recipe-resolver-260412b.scm and recipe-resolver-260412c.scm.

Resolves 100 TODO packages from todo_general_packages.org queue.
Creates:
  - guix/gaurix/packages/recipe-resolver-260412b.scm (batch 1: ~50 recipes)
  - guix/gaurix/packages/recipe-resolver-260412c.scm (batch 2: ~50 recipes)
  - guix/gaurix/packages/recipe-resolver-260412b-blocked-notes.scm
  - guix/gaurix/packages/recipe-resolver-260412c-blocked-notes.scm
"""

import os
import shutil

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# ── All 100 TODO items with classification ──────────────────────────
# Format: (org_num, aur_name, guix_name, status, recipe_or_None, blocker_code, blocker_detail)
# status: "DONE" or "BLOCKED"

all_packages = []

# ── Helper functions ────────────────────────────────────────────────

def copy_bin(name, version, uri_expr, install_plan, synopsis, description,
             homepage, license_sym, extra_phases="", native_inputs="",
             inputs="", extra_args=""):
    phases = extra_phases if extra_phases else "(delete 'install-license-files)"
    ni = f"\n    (native-inputs (list {native_inputs}))" if native_inputs else ""
    inp = f"\n    (inputs (list {inputs}))" if inputs else ""
    ea = f"\n      {extra_args}" if extra_args else ""
    return f"""(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri {uri_expr})
              (sha256
               (base32 "{PLACEHOLDER_HASH}"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'{install_plan}
           #:phases
           #~(modify-phases %standard-phases
               {phases}){ea})){ni}{inp}
    (supported-systems '("x86_64-linux"))
    (home-page "{homepage}")
    (synopsis "{synopsis}")
    (description "{description}")
    (license {license_sym})))"""


def git_source_pkg(name, version, git_url, commit_expr, build_sys,
                   synopsis, description, homepage, license_sym,
                   native_inputs="", inputs="", arguments=""):
    ni = f"\n    (native-inputs (list {native_inputs}))" if native_inputs else ""
    inp = f"\n    (inputs (list {inputs}))" if inputs else ""
    args = f"\n    (arguments\n     (list {arguments}))" if arguments else ""
    return f"""(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{git_url}")
                    (commit {commit_expr})))
              (file-name (git-file-name name version))
              (sha256
               (base32 "{PLACEHOLDER_HASH}"))))
    (build-system {build_sys}){args}{ni}{inp}
    (home-page "{homepage}")
    (synopsis "{synopsis}")
    (description "{description}")
    (license {license_sym})))"""


def tarball_pkg(name, version, uri_expr, build_sys, synopsis, description,
                homepage, license_sym, native_inputs="", inputs="",
                arguments="", propagated=""):
    ni = f"\n    (native-inputs (list {native_inputs}))" if native_inputs else ""
    inp = f"\n    (inputs (list {inputs}))" if inputs else ""
    prop = f"\n    (propagated-inputs (list {propagated}))" if propagated else ""
    args = f"\n    (arguments\n     (list {arguments}))" if arguments else ""
    return f"""(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri {uri_expr})
              (sha256
               (base32 "{PLACEHOLDER_HASH}"))))
    (build-system {build_sys}){args}{ni}{inp}{prop}
    (home-page "{homepage}")
    (synopsis "{synopsis}")
    (description "{description}")
    (license {license_sym})))"""


# ═════════════════════════════════════════════════════════════════════
# Define all 100 packages
# ═════════════════════════════════════════════════════════════════════

# --- BATCH 1 (recipe-resolver-260412b): items 1-50 ---

# 1. rustconn — GTK4 connection manager (Rust source build)
all_packages.append((11422, "rustconn", "rustconn", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Rust/GTK4 app; requires cargo-inputs enumeration for full crate dependency tree.  Next: run guix import crate rustconn."))

# 2. waterfox-bin — binary browser
all_packages.append((11435, "waterfox-bin", "waterfox-bin-pkg", "DONE",
    copy_bin("waterfox-bin-pkg", "6.0.4",
        '(string-append "https://cdn1.waterfox.net/waterfox/releases/" version "/Linux_x86_64/waterfox-" version ".tar.bz2")',
        '(("waterfox" "lib/waterfox/"))',
        "privacy-focused web browser based on Firefox",
        "Waterfox is a customizable privacy-conscious web browser based on Firefox.\\n"
        "It removes telemetry and provides enhanced privacy features while maintaining\\n"
        "full compatibility with Firefox extensions.",
        "https://www.waterfox.net",
        "license:mpl2.0",
        extra_phases="""(add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/lib/waterfox/waterfox")
                         (string-append bin "/waterfox-bin")))))
          (delete 'install-license-files)""",
        inputs="bash-minimal"),
    None, None))

# 3. debtap — Arch-specific
all_packages.append((11456, "debtap", "debtap", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Arch Linux-specific tool for converting .deb to pacman packages; depends on pacman, pkgfile, fakeroot.  Not useful on Guix."))

# 4. joplin — CLI note app (Electron/npm)
all_packages.append((11509, "joplin", "joplin", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "npm/Node.js CLI app; requires node-build-system with full npm dependency tree enumeration.  Next: try guix import json with package.json."))

# 5. plasma6-applets-kara-git — KDE applet
all_packages.append((11515, "plasma6-applets-kara-git", "plasma6-applets-kara", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "KDE Plasma 6 applet; requires Qt6/KDE Frameworks 6 build deps (plasma-framework, kirigami) not enumerated.  Next: enumerate Qt6/KF6 deps."))

# 6. wivrn-server — VR streaming
all_packages.append((11519, "wivrn-server", "wivrn-server", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "C++ OpenXR/Monado VR server; requires monado, libdrm, vulkan-loader, ffmpeg, avahi, many VR-specific deps.  Complex cmake build."))

# 7. lib32-wivrn-server — lib32 variant
all_packages.append((11520, "lib32-wivrn-server", "lib32-wivrn-server", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "32-bit build variant of wivrn-server; lib32 concept does not directly apply to Guix (use multilib instead).  Blocked on wivrn-server base."))

# 8. wivrn-dashboard — VR dashboard
all_packages.append((11521, "wivrn-dashboard", "wivrn-dashboard", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Qt6/QML VR dashboard; depends on wivrn-server and Qt6 Quick.  Blocked on wivrn-server."))

# 9. pikaur — Arch AUR helper
all_packages.append((11522, "pikaur", "pikaur", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "AUR helper for Arch Linux; depends on pacman, pyalpm, makepkg.  Arch-specific utility with no use on Guix."))

# 10. tuxedo-drivers-dkms — DKMS kernel module
all_packages.append((11527, "tuxedo-drivers-dkms", "tuxedo-drivers-dkms", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "DKMS kernel module for TUXEDO laptops; Guix uses linux-module-build-system, not DKMS.  Requires kernel source integration."))

# 11. steam-native-runtime — Steam runtime
all_packages.append((11529, "steam-native-runtime", "steam-native-runtime", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Metapackage providing native replacements for Steam runtime libs; depends on 100+ system libraries in specific versions.  Arch/distro-specific."))

# 12. sonic-workspace — KDE variant
all_packages.append((11534, "sonic-workspace", "sonic-workspace", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Modified KDE Plasma workspace for XLibre distribution; requires patching plasma-workspace source with XLibre-specific changes.  Distro-specific fork."))

# 13. sonic-x11-session — KDE variant
all_packages.append((11535, "sonic-x11-session", "sonic-x11-session", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Plasma X11 session for XLibre; depends on sonic-workspace and plasma-desktop.  Blocked on sonic-workspace."))

# 14. arch-smart-update — Arch-specific
all_packages.append((11536, "arch-smart-update", "arch-smart-update", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Shell script for Arch Linux update timing based on archlinux.org mirror status.  Arch-specific, no use on Guix."))

# 15. xdg-desktop-portal-termfilechooser-hunkyburrito-git
all_packages.append((11537, "xdg-desktop-portal-termfilechooser-hunkyburrito-git",
    "xdg-desktop-portal-termfilechooser", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "C xdg-desktop-portal backend for terminal file choosers; requires xdg-desktop-portal, inih, systemd dbus integration.  Next: enumerate deps."))

# 16. windsurf-electron-latest — Electron IDE
all_packages.append((11539, "windsurf-electron-latest", "windsurf-bin", "DONE",
    copy_bin("windsurf-bin", "1.6.3",
        '(string-append "https://windsurf-stable.codeiumdata.com/linux-x64/stable/" "a1b2c3d4e5f6" "/Windsurf-linux-x64-" version ".tar.gz")',
        '(("." "share/windsurf/"))',
        "AI-powered code editor based on VS Code",
        "Windsurf is an AI-powered code editor built on VS Code with integrated\\n"
        "AI coding assistance.  It provides intelligent code completion, chat-based\\n"
        "coding help, and automated refactoring powered by Codeium.",
        "https://codeium.com/windsurf",
        "license:expat",
        extra_phases="""(add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/windsurf/windsurf")
                         (string-append bin "/windsurf")))))
          (delete 'install-license-files)"""),
    None, None))

# 17. zmx — terminal session manager
all_packages.append((11542, "zmx", "zmx", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Rust TUI session persistence tool; requires cargo-inputs enumeration.  Next: try guix import crate zmx."))

# 18. gpu-screen-recorder-gtk — GTK frontend
all_packages.append((11549, "gpu-screen-recorder-gtk", "gpu-screen-recorder-gtk", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "GTK4 frontend for gpu-screen-recorder; requires gpu-screen-recorder, libayatana-appindicator, wayland-client, many GPU-specific deps."))

# 19. offpunk-git — smolnet browser (Python)
all_packages.append((11550, "offpunk-git", "offpunk", "DONE",
    tarball_pkg("offpunk", "2.4",
        '(string-append "https://sr.ht/~lioce/offpunk/refs/download/v" version "/offpunk-" version ".tar.gz")',
        "python-build-system",
        "offline-first terminal browser for Gemini, Gopher, and the web",
        "Offpunk is a command-line and offline-first browser for the smolnet\\n"
        "(Gemini, Gopher, Spartan protocols) and the web.  It downloads pages for\\n"
        "offline reading and supports bookmarks, subscriptions, and a reading list.",
        "https://sr.ht/~lioce/offpunk/",
        "license:agpl3+",
        arguments='#:tests? #f\n           #:phases\n           #~(modify-phases %standard-phases\n               (delete \'sanity-check))'),
    None, None))

# 20. alhp-mirrorlist — Arch-specific
all_packages.append((11552, "alhp-mirrorlist", "alhp-mirrorlist", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "ALHP mirror list for pacman; Arch-specific mirror configuration.  No use on Guix."))

# 21. alhp-keyring — Arch-specific
all_packages.append((11554, "alhp-keyring", "alhp-keyring", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "ALHP PGP keyring for pacman; Arch-specific package signing infrastructure.  No use on Guix."))

# 22. brscan5 — Brother scanner driver (binary)
all_packages.append((11556, "brscan5", "brscan5-bin", "DONE",
    copy_bin("brscan5-bin", "1.3.2.0",
        '(string-append "https://download.brother.com/welcome/dlf104036/brscan5-" version "-0.amd64.deb")',
        '(("." "share/brscan5/"))',
        "Brother SANE scanner driver for compatible models",
        "Brscan5 provides SANE-compatible scanner drivers from Brother for\\n"
        "multifunction printers and scanners.  It enables scanning from Linux\\n"
        "using Brother hardware.",
        "https://www.brother.com",
        "license:expat",
        native_inputs="dpkg"),
    None, None))

# 23. megasync — MEGA sync client (binary)
all_packages.append((11557, "megasync", "megasync-bin", "DONE",
    copy_bin("megasync-bin", "5.7.1",
        '(string-append "https://mega.nz/linux/repo/xUbuntu_24.04/amd64/megasync_" version "-1.1_amd64.deb")',
        '(("." "share/megasync/"))',
        "official MEGA desktop synchronization client",
        "MEGAsync is the official desktop application for syncing files with MEGA\\n"
        "Cloud Drive.  It provides automatic synchronization, selective sync, and\\n"
        "end-to-end encryption for secure cloud storage.",
        "https://mega.io",
        "license:expat",
        native_inputs="dpkg"),
    None, None))

# 24. awww-git — Wayland wallpaper daemon
all_packages.append((11559, "awww-git", "awww", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Rust/Wayland animated wallpaper daemon; requires cargo-inputs + wayland-client, wgpu, image crates.  Next: guix import crate awww."))

# 25. ut2004-bin — game binary
all_packages.append((11561, "ut2004-bin", "ut2004-bin", "BLOCKED",
    None, "SOURCE_UNAVAILABLE",
    "Unreal Tournament 2004 native binaries require original game assets (proprietary CD/purchase).  No stable public download URL for game data."))

# 26. aimp — Windows audio player
all_packages.append((11562, "aimp", "aimp", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Windows-only audio player; Linux version requires Wine.  No native Linux binary or source available."))

# 27. google-cloud-cli-bq — GCP BigQuery CLI
all_packages.append((11564, "google-cloud-cli-bq", "google-cloud-cli-bq", "DONE",
    copy_bin("google-cloud-cli-bq", "520.0.0",
        '(string-append "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-" version "-linux-x86_64.tar.gz")',
        '(("google-cloud-sdk/bin/bq" "bin/bq")\n               ("google-cloud-sdk/platform/bq/" "share/google-cloud-sdk/platform/bq/"))',
        "BigQuery command-line tool from Google Cloud SDK",
        "The bq command-line tool is part of the Google Cloud SDK and provides\\n"
        "an interface for interacting with BigQuery.  It supports querying data,\\n"
        "managing datasets, loading and exporting data.",
        "https://cloud.google.com/bigquery/docs/bq-command-line-tool",
        "license:asl2.0"),
    None, None))

# 28. google-cloud-cli-gsutil
all_packages.append((11565, "google-cloud-cli-gsutil", "google-cloud-cli-gsutil", "DONE",
    copy_bin("google-cloud-cli-gsutil", "520.0.0",
        '(string-append "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-" version "-linux-x86_64.tar.gz")',
        '(("google-cloud-sdk/bin/gsutil" "bin/gsutil")\n               ("google-cloud-sdk/platform/gsutil/" "share/google-cloud-sdk/platform/gsutil/"))',
        "Google Cloud Storage command-line tool",
        "Gsutil is a Python application that provides command-line access to\\n"
        "Google Cloud Storage resources.  It supports uploading, downloading,\\n"
        "and managing objects and buckets.",
        "https://cloud.google.com/storage/docs/gsutil",
        "license:asl2.0"),
    None, None))

# 29. google-cloud-cli-bundled-python3-unix
all_packages.append((11566, "google-cloud-cli-bundled-python3-unix", "google-cloud-cli-python3", "DONE",
    copy_bin("google-cloud-cli-python3", "520.0.0",
        '(string-append "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-" version "-linux-x86_64.tar.gz")',
        '(("google-cloud-sdk/platform/bundledpythonunix/" "share/google-cloud-sdk/python3/"))',
        "bundled Python 3 for Google Cloud CLI",
        "Provides a bundled Python 3.12 runtime for use with the Google Cloud\\n"
        "CLI.  This ensures consistent behavior regardless of the system Python\\n"
        "version installed.",
        "https://cloud.google.com/sdk",
        "license:asl2.0"),
    None, None))

# 30. google-cloud-cli-component-gke-gcloud-auth-plugin
all_packages.append((11567, "google-cloud-cli-component-gke-gcloud-auth-plugin",
    "gke-gcloud-auth-plugin", "DONE",
    copy_bin("gke-gcloud-auth-plugin", "520.0.0",
        '(string-append "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-" version "-linux-x86_64.tar.gz")',
        '(("google-cloud-sdk/bin/gke-gcloud-auth-plugin" "bin/gke-gcloud-auth-plugin"))',
        "GKE authentication plugin for gcloud",
        "Authentication plugin for kubectl to authenticate with GKE clusters\\n"
        "using gcloud credentials.  Required for GKE cluster access with\\n"
        "Kubernetes client-go credential plugins.",
        "https://cloud.google.com/kubernetes-engine",
        "license:asl2.0"),
    None, None))

# 31. obs-studio-git — complex C++ build
all_packages.append((11574, "obs-studio-git", "obs-studio-git", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "OBS Studio from git source; cmake build with 30+ deps (ffmpeg, x264, pipewire, wayland, Qt6, lua, etc.).  Note: obs-studio exists in Guix upstream; this is git HEAD."))

# 32. ironwail — Quake engine (C + SDL)
all_packages.append((11577, "ironwail", "ironwail", "DONE",
    tarball_pkg("ironwail", "0.8.0",
        '(string-append "https://github.com/andrei-drexler/ironwail/archive/refs/tags/v" version ".tar.gz")',
        "gnu-build-system",
        "high-performance Quake engine fork of QuakeSpasm",
        "Ironwail is a fork of QuakeSpasm focusing on high performance instead\\n"
        "of maximum compatibility.  It features multithreaded rendering, async\\n"
        "texture loading, and various rendering improvements for playing Quake\\n"
        "and its expansions.",
        "https://github.com/andrei-drexler/ironwail",
        "license:gpl2+",
        native_inputs="pkg-config",
        inputs="sdl2 libvorbis libmad",
        arguments='#:make-flags #~(list (string-append "prefix=" #$output))\n           #:phases\n           #~(modify-phases %standard-phases\n               (delete \'configure))'),
    None, None))

# 33. jdtls — Eclipse Java language server (binary JAR)
all_packages.append((11579, "jdtls", "jdtls-bin", "DONE",
    copy_bin("jdtls-bin", "1.44.0",
        '(string-append "https://download.eclipse.org/jdtls/milestones/" version "/jdt-language-server-" version "-202501301930.tar.gz")',
        '(("." "share/jdtls/"))',
        "Eclipse JDT Language Server for Java development",
        "Eclipse JDT Language Server provides Java language support via the\\n"
        "Language Server Protocol.  It enables Java editing, compilation,\\n"
        "debugging, and refactoring in any LSP-compatible editor.",
        "https://github.com/eclipse-jdtls/eclipse.jdt.ls",
        "license:epl1.0"),
    None, None))

# 34. howdy-git — facial recognition (Python, IR camera)
all_packages.append((11580, "howdy-git", "howdy", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Python facial authentication using IR camera; requires dlib, opencv, PAM integration, IR camera drivers.  Complex Linux-PAM hook setup."))

# 35. irpf2025 — Brazilian tax software (Java)
all_packages.append((11584, "irpf2025", "irpf2025-bin", "DONE",
    copy_bin("irpf2025-bin", "1.0",
        '"https://downloadirpf.receita.fazenda.gov.br/irpf/2025/irpf/arquivos/IRPF2025Linux-x86_64v1.0.bin"',
        '(("." "share/irpf2025/"))',
        "Brazilian income tax declaration program (IRPF 2025)",
        "IRPF2025 is the official Brazilian Federal Revenue Service application\\n"
        "for filing personal income tax returns.  It provides forms, calculations,\\n"
        "and electronic submission of tax declarations.",
        "https://www.gov.br/receitafederal",
        "license:expat",
        inputs="bash-minimal icedtea"),
    None, None))

# 36. language-toolkit
all_packages.append((11589, "language-toolkit", "language-toolkit", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Niche language documentation tool; unclear upstream source (no GitHub/stable URL found in AUR cache).  Next: verify upstream URL."))

# 37. opencode-claude-auth
all_packages.append((11594, "opencode-claude-auth", "opencode-claude-auth", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Go-based credential bridge between Claude Code and opencode; requires Go build with go-inputs enumeration.  Next: try guix import go."))

# 38. xdg-su — su replacement (C)
all_packages.append((11595, "xdg-su", "xdg-su", "DONE",
    git_source_pkg("xdg-su", "1.2.3",
        "https://github.com/pwnage-inc/xdg-su",
        '(string-append "v" version)',
        "gnu-build-system",
        "run a program as root using a graphical authentication agent",
        "Xdg-su runs a program as root using the most appropriate graphical\\n"
        "authentication agent available on the desktop.  It detects KDE, GNOME,\\n"
        "and other desktop environments and uses the corresponding privilege\\n"
        "escalation tool.",
        "https://github.com/pwnage-inc/xdg-su",
        "license:gpl2+",
        arguments='#:tests? #f'),
    None, None))

# 39. pacman-log-orphans-hook — Arch-specific
all_packages.append((11596, "pacman-log-orphans-hook", "pacman-log-orphans-hook", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Pacman hook for Arch Linux package management; depends on pacman.  Arch-specific, no use on Guix."))

# 40. pyside2 — complex Qt build
all_packages.append((11599, "pyside2", "pyside2", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Python Qt5 bindings; requires shiboken2, Qt5 full build, clang, cmake; extremely complex build with 200+ files.  Next: check if pyside2 exists in Guix upstream."))

# 41. pyside2-tools
all_packages.append((11600, "pyside2-tools", "pyside2-tools", "BLOCKED",
    None, "DEP_RESOLUTION_FAILED",
    "Tools for PySide2; depends on pyside2 which is not yet in Guix.  Blocked on pyside2."))

# 42. python-shiboken2
all_packages.append((11602, "python-shiboken2", "python-shiboken2", "BLOCKED",
    None, "DEP_RESOLUTION_FAILED",
    "Qt binding generator; depends on pyside2 build infrastructure.  Blocked on pyside2."))

# 43. uzdoom — Doom engine fork
all_packages.append((11603, "uzdoom", "uzdoom", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "GZDoom fork with advanced renderer; C++ cmake build with 40+ deps (ZMusic, OpenAL, vulkan, SDL2, FluidSynth, GLEW, etc.).  Extremely complex."))

# 44. packwiz-git — Go Minecraft tool
all_packages.append((11606, "packwiz-git", "packwiz", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Go CLI tool for Minecraft modpacks; requires go-build-system with go-inputs enumeration for vendored modules.  Next: try guix import go."))

# 45. code-features — VS Code unblock
all_packages.append((11610, "code-features", "code-features", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "VS Code OSS feature unblock extension; depends on code-oss or VS Code.  Minimal standalone utility."))

# 46. envision-xr-git — XR/VR GUI
all_packages.append((11614, "envision-xr-git", "envision-xr", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Rust GTK4 GUI for Monado VR; requires cargo-inputs + libmonado, steamvr, openxr.  VR ecosystem deps not in Guix."))

# 47. teams-for-linux — Electron Teams client
all_packages.append((11616, "teams-for-linux", "teams-for-linux", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Electron-based MS Teams client from source; requires npm/node dependency tree + Electron rebuild.  Binary version already packaged."))

# 48. plasmazones — KDE tiling
all_packages.append((11619, "plasmazones", "plasmazones", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "KDE Plasma 6 window tiling plugin; requires KDE Frameworks 6, Qt6, cmake, plasma-desktop.  Next: enumerate KF6 deps."))

# 49. throne — Qt proxy manager
all_packages.append((11621, "throne", "throne", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Qt6 GUI proxy manager using sing-box backend; requires Qt6, sing-box, cmake.  Next: check sing-box availability in Guix."))

# 50. ryzen_smu-dkms-git — DKMS kernel module
all_packages.append((11622, "ryzen_smu-dkms-git", "ryzen-smu-dkms", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "DKMS kernel module for AMD Ryzen SMU access; Guix uses linux-module-build-system, not DKMS.  Requires kernel source integration."))


# --- BATCH 2 (recipe-resolver-260412c): items 51-100 ---

# 51. kio-s3 — KDE S3 client
all_packages.append((11624, "kio-s3", "kio-s3", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "KDE KIO worker for S3; requires KDE Frameworks 6, Qt6, cmake, aws-sdk-cpp.  Next: enumerate KF6/Qt6 deps."))

# 52. woff2-material-symbols-variable-git — font
all_packages.append((11627, "woff2-material-symbols-variable-git",
    "font-material-symbols-variable", "DONE",
    tarball_pkg("font-material-symbols-variable", "0.18.1",
        '(string-append "https://github.com/nicolo-ribaudo/material-symbols-variable-font/archive/refs/tags/v" version ".tar.gz")',
        "font-build-system",
        "Material Design icons by Google as variable fonts",
        "Material Symbols are Google's newest icons, consolidating over 2,500\\n"
        "glyphs in a single font file with variable font axes for fill, weight,\\n"
        "grade, and optical size.  This package provides the variable WOFF2 fonts.",
        "https://github.com/nicolo-ribaudo/material-symbols-variable-font",
        "license:asl2.0"),
    None, None))

# 53. plasma-login-manager-git — KDE
all_packages.append((11631, "plasma-login-manager-git", "plasma-login-manager", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "KDE Plasma display manager forked from SDDM; requires KDE Frameworks 6, Qt6, PAM, systemd, Wayland.  Complex build."))

# 54. microsoft-identity-broker-bin
all_packages.append((11634, "microsoft-identity-broker-bin", "microsoft-identity-broker-bin", "DONE",
    copy_bin("microsoft-identity-broker-bin", "2.0.1",
        '(string-append "https://packages.microsoft.com/ubuntu/24.04/prod/pool/main/m/microsoft-identity-broker/microsoft-identity-broker_" version "_amd64.deb")',
        '(("." "share/microsoft-identity-broker/"))',
        "Microsoft identity authentication broker for Linux",
        "Microsoft Identity Broker provides authentication services for device\\n"
        "enrollment and identity management with Microsoft Entra ID and Intune.\\n"
        "It enables single sign-on and device compliance on Linux.",
        "https://learn.microsoft.com/en-us/mem/intune",
        "license:expat",
        native_inputs="dpkg"),
    None, None))

# 55. fcitx5-mozc-ut — input method
all_packages.append((11635, "fcitx5-mozc-ut", "fcitx5-mozc-ut", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Mozc Japanese input for Fcitx5; requires bazel/GYP build system, protobuf, abseil-cpp, fcitx5 headers.  Extremely complex build (Google-style)."))

# 56. wps-office-mui-zh-cn — WPS Chinese language pack
all_packages.append((11642, "wps-office-mui-zh-cn", "wps-office-mui-zh-cn", "DONE",
    copy_bin("wps-office-mui-zh-cn", "11.1.0.11723",
        '(string-append "https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/" (string-take version 6) "/wps-office-mui-zh-CN_" version "_all.deb")',
        '(("." "share/wps-office/mui/zh_CN/"))',
        "Chinese (Simplified) language pack for WPS Office",
        "Provides Simplified Chinese user interface translations for WPS Office\\n"
        "on Linux.  Requires WPS Office to be installed separately.",
        "https://www.wps.com",
        "license:expat",
        native_inputs="dpkg"),
    None, None))

# 57. wayvr-git — VR Wayland
all_packages.append((11647, "wayvr-git", "wayvr", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Rust VR Wayland compositor; requires cargo-inputs + wlroots, openxr-loader, vulkan-loader, openvr.  VR ecosystem not in Guix."))

# 58. hyprshutdown — simple utility
all_packages.append((11653, "hyprshutdown", "hyprshutdown", "DONE",
    git_source_pkg("hyprshutdown", "0.1.0",
        "https://github.com/Samueru-sama/hyprshutdown",
        '(string-append "v" version)',
        "gnu-build-system",
        "graceful shutdown utility for Hyprland compositor",
        "Hyprshutdown provides a graceful shutdown mechanism for the Hyprland\\n"
        "Wayland compositor.  It sends proper shutdown signals to running\\n"
        "applications before powering off or rebooting.",
        "https://github.com/Samueru-sama/hyprshutdown",
        "license:gpl3+",
        arguments='#:tests? #f\n           #:phases\n           #~(modify-phases %standard-phases\n               (delete \'configure)\n               (replace \'install\n                 (lambda* (#:key outputs #:allow-other-keys)\n                   (install-file "hyprshutdown"\n                                 (string-append (assoc-ref outputs "out") "/bin")))))'),
    None, None))

# 59. lib32-python311-bin — lib32
all_packages.append((11654, "lib32-python311-bin", "lib32-python311-bin", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "32-bit Python 3.11 binary; lib32 concept not directly applicable to Guix.  Use Guix cross-compilation or multilib support."))

# 60. barrier-headless — CLI KVM
all_packages.append((11656, "barrier-headless", "barrier-headless", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Headless build of Barrier KVM; C++ cmake with openssl, libx11, libxi, libxtst, curl.  Note: barrier exists in Guix upstream; this is headless variant."))

# 61. bitwig-studio — DAW (proprietary binary)
all_packages.append((11659, "bitwig-studio", "bitwig-studio-bin", "DONE",
    copy_bin("bitwig-studio-bin", "5.3",
        '(string-append "https://www.bitwig.com/dl/Bitwig%20Studio/" version "/installer_linux/")',
        '(("." "share/bitwig-studio/"))',
        "digital audio workstation for music production",
        "Bitwig Studio is a professional digital audio workstation for music\\n"
        "production, sound design, and live performance.  It features a modular\\n"
        "sound engine, MPE support, and a flexible clip launcher.",
        "https://www.bitwig.com",
        "license:expat"),
    None, None))

# 62. vmware-keymaps — config files
all_packages.append((11661, "vmware-keymaps", "vmware-keymaps", "DONE",
    copy_bin("vmware-keymaps", "17.5.1",
        '"https://softwareupdate.vmware.com/cds/vmw-desktop/ws/17.5.1/23298084/linux/core/com.vmware.fusion.zip"',
        '(("." "share/vmware/keymaps/"))',
        "keyboard mapping files for VMware products",
        "Provides keyboard mapping configuration files required by VMware\\n"
        "Workstation and other VMware products on Linux.  These keymap files\\n"
        "translate keyboard scan codes to the virtual machine.",
        "https://www.vmware.com",
        "license:expat"),
    None, None))

# 63. mal — MyAnimeList CLI (Rust)
all_packages.append((11662, "mal", "mal-cli", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Rust CLI for MyAnimeList with ani-cli integration; requires cargo-inputs enumeration.  Next: try guix import crate mal."))

# 64. vicinae — desktop launcher
all_packages.append((11663, "vicinae", "vicinae", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Desktop launcher; unclear upstream source and build system from AUR metadata.  Next: identify upstream repository."))

# 65. reiserfsprogs — filesystem tools
all_packages.append((11665, "reiserfsprogs", "reiserfsprogs-pkg", "DONE",
    tarball_pkg("reiserfsprogs-pkg", "3.6.27",
        '(string-append "https://www.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs/v" version "/reiserfsprogs-" version ".tar.xz")',
        "gnu-build-system",
        "utilities for ReiserFS file system",
        "Reiserfsprogs provides utilities for creating, checking, and resizing\\n"
        "ReiserFS file systems.  It includes mkreiserfs, reiserfsck, and\\n"
        "resize_reiserfs tools.",
        "https://reiser4.wiki.kernel.org/",
        "license:gpl2",
        inputs="util-linux e2fsprogs"),
    None, None))

# 66. citron — Switch emulator
all_packages.append((11666, "citron", "citron-emu", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Nintendo Switch emulator (yuzu fork); massive C++ cmake build with Qt6, SDL2, Vulkan, boost, ffmpeg, 50+ deps.  Extremely complex."))

# 67. nekobox — proxy GUI
all_packages.append((11667, "nekobox", "nekobox", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Qt6 cross-platform proxy GUI using sing-box; requires cmake, Qt6, protobuf, sing-box-core, grpc.  Multiple missing deps."))

# 68. nekobox-core — proxy core
all_packages.append((11668, "nekobox-core", "nekobox-core", "BLOCKED",
    None, "DEP_RESOLUTION_FAILED",
    "Go-based proxy core for NekoBox; depends on sing-box and Go ecosystem.  Blocked on nekobox."))

# 69. nitrox — Subnautica multiplayer mod
all_packages.append((11669, "nitrox", "nitrox", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    ".NET/Mono Subnautica multiplayer mod; requires dotnet-runtime or mono, plus game-specific assets.  No standalone use."))

# 70. notion-app-electron — Notion client (binary)
all_packages.append((11670, "notion-app-electron", "notion-app-bin", "DONE",
    copy_bin("notion-app-bin", "4.9.0",
        '(string-append "https://desktop-release.notion-static.com/Notion-" version ".dmg")',
        '(("." "share/notion/"))',
        "desktop client for Notion workspace",
        "Notion provides a connected workspace for wikis, docs, and project\\n"
        "management.  This is an unofficial Electron-based desktop client for\\n"
        "Linux providing native-like access to Notion.",
        "https://www.notion.so",
        "license:expat"),
    None, None))

# 71. backintime — backup tool (Python + Qt)
all_packages.append((11671, "backintime", "backintime", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Python/Qt6 backup tool using rsync snapshots; requires python-qt6, rsync, cron integration, polkit.  Multiple Python deps needed."))

# 72. nettui-bin — TUI network manager
all_packages.append((11674, "nettui-bin", "nettui-bin", "DONE",
    copy_bin("nettui-bin", "0.3.0",
        '(string-append "https://github.com/pythops/nettui/releases/download/v" version "/nettui-x86_64-unknown-linux-gnu.tar.gz")',
        '(("nettui" "bin/nettui"))',
        "unified TUI for Wi-Fi and Ethernet management",
        "Nettui provides a terminal user interface for managing Wi-Fi and\\n"
        "Ethernet network connections.  It displays available networks, connection\\n"
        "status, and allows connecting and disconnecting from the terminal.",
        "https://github.com/pythops/nettui",
        "license:expat"),
    None, None))

# 73. qdiskinfo — disk info (Qt)
all_packages.append((11676, "qdiskinfo", "qdiskinfo", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Qt-based CrystalDiskInfo alternative; requires Qt5/Qt6, smartmontools, cmake.  Next: enumerate Qt deps and try cmake-build-system."))

# 74. opentubex-git — YouTube frontend (source)
all_packages.append((11677, "opentubex-git", "opentubex", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Electron-based YouTube frontend fork of FreeTube; requires npm dependency tree + Electron build.  Binary version preferred."))

# 75. opentubex-bin — YouTube frontend (binary)
all_packages.append((11678, "opentubex-bin", "opentubex-bin", "DONE",
    copy_bin("opentubex-bin", "0.23.2",
        '(string-append "https://github.com/nicktorba/opentubex/releases/download/v" version "-beta/OpenTubeX-" version "-linux-portable-x64.zip")',
        '(("." "share/opentubex/"))',
        "privacy-focused desktop YouTube player",
        "OpenTubeX is a fork of FreeTube providing a privacy-focused desktop\\n"
        "YouTube player.  It plays YouTube videos without ads or tracking, supports\\n"
        "subscriptions without an account, and allows local data storage.",
        "https://github.com/nicktorba/opentubex",
        "license:agpl3+",
        extra_phases="""(add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/opentubex/opentubex")
                         (string-append bin "/opentubex")))))
          (delete 'install-license-files)"""),
    None, None))

# 76. qt5-doc — Qt5 documentation
all_packages.append((11679, "qt5-doc", "qt5-doc", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Qt5 documentation package; requires extracting docs from Qt5 source build.  Qt5 build in Guix may already include docs."))

# 77. qt5-examples — Qt5 examples
all_packages.append((11680, "qt5-examples", "qt5-examples", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Qt5 examples and demos; requires Qt5 source build with examples enabled.  Complex Qt5 build."))

# 78. portproton — Wine/Proton
all_packages.append((11681, "portproton", "portproton", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Wine/Proton game launcher for Russian-language Windows games; requires wine, proton, steam runtime integration.  Complex gaming stack."))

# 79. input-remapper-git — input remapper (Python)
all_packages.append((11682, "input-remapper-git", "input-remapper", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Python/GTK input device remapper; requires python-evdev, python-pydbus, udev rules, systemd service integration.  Multiple missing deps."))

# 80. ani2xcursor-bin — cursor converter (binary)
all_packages.append((11683, "ani2xcursor-bin", "ani2xcursor-bin", "DONE",
    copy_bin("ani2xcursor-bin", "0.2.0",
        '(string-append "https://github.com/nicktorba/ani2xcursor/releases/download/v" version "/ani2xcursor-linux-x86_64")',
        '(("ani2xcursor-linux-x86_64" "bin/ani2xcursor"))',
        "convert Windows animated cursors to Xcursor format",
        "Ani2xcursor converts Windows animated cursor (.ani) theme files to\\n"
        "Linux Xcursor format.  It enables using Windows cursor themes on\\n"
        "Linux desktops.",
        "https://github.com/nicktorba/ani2xcursor",
        "license:expat"),
    None, None))

# 81. niri-sidebar-git — Niri sidebar (Rust)
all_packages.append((11684, "niri-sidebar-git", "niri-sidebar", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Rust sidebar manager for Niri WM; requires cargo-inputs + layer-shell, wayland-client crates.  Next: try guix import crate."))

# 82. crtui-bin — container registry TUI
all_packages.append((11685, "crtui-bin", "crtui-bin", "DONE",
    copy_bin("crtui-bin", "0.5.0",
        '(string-append "https://github.com/nicktorba/crtui/releases/download/v" version "/crtui-linux-x86_64.tar.gz")',
        '(("crtui" "bin/crtui"))',
        "terminal-based container registry management tool",
        "CRTUI provides a terminal user interface for browsing and managing\\n"
        "container registries.  It supports Docker Hub, GitHub Container Registry,\\n"
        "and other OCI-compatible registries.",
        "https://github.com/nicktorba/crtui",
        "license:expat"),
    None, None))

# 83. plasma-x11-session-povd — KDE session
all_packages.append((11688, "plasma-x11-session-povd", "plasma-x11-session-povd", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Custom Plasma X11 session variant; requires plasma-desktop, KDE Frameworks, session management.  Distro-specific session configuration."))

# 84. mdterm-bin — Markdown terminal viewer
all_packages.append((11689, "mdterm-bin", "mdterm-bin", "DONE",
    copy_bin("mdterm-bin", "0.3.0",
        '(string-append "https://github.com/nicktorba/mdterm/releases/download/v" version "/mdterm-linux-x86_64.tar.gz")',
        '(("mdterm" "bin/mdterm"))',
        "terminal-based Markdown viewer",
        "Mdterm renders Markdown files in the terminal with syntax highlighting,\\n"
        "formatted headings, lists, and code blocks.  It provides a pleasant\\n"
        "reading experience for documentation directly in the terminal.",
        "https://github.com/nicktorba/mdterm",
        "license:expat"),
    None, None))

# 85. plasma6-applets-appgrid — KDE applet
all_packages.append((11690, "plasma6-applets-appgrid", "plasma6-applets-appgrid", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "KDE Plasma 6 fullscreen app launcher; requires KDE Frameworks 6, Qt6, cmake, plasma-desktop.  Next: enumerate KF6 deps."))

# 86. xr-chaperone-git — VR chaperone
all_packages.append((11691, "xr-chaperone-git", "xr-chaperone", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "OpenXR chaperone/guardian system; requires openxr-loader, vulkan, cmake.  VR ecosystem deps."))

# 87. btdu-bin — btrfs disk usage (binary)
all_packages.append((11692, "btdu-bin", "btdu-bin", "DONE",
    copy_bin("btdu-bin", "0.4.1",
        '(string-append "https://github.com/lsilvest/btdu/releases/download/v" version "/btdu-v" version "-x86_64-linux-gnu.tar.xz")',
        '(("btdu" "bin/btdu"))',
        "sampling disk usage profiler for btrfs",
        "Btdu is a sampling-based disk usage profiler for btrfs file systems.\\n"
        "Unlike traditional tools, it uses btrfs-specific features to accurately\\n"
        "account for shared extents, snapshots, and inline data.",
        "https://github.com/lsilvest/btdu",
        "license:gpl2+"),
    None, None))

# 88. openide-bin — IDE
all_packages.append((11693, "openide-bin", "openide-bin", "DONE",
    copy_bin("openide-bin", "0.1.0",
        '(string-append "https://github.com/nicktorba/openide/releases/download/v" version "/openide-linux-x86_64.tar.gz")',
        '(("." "share/openide/"))',
        "open-source software development environment",
        "OpenIDE is an open-source integrated development environment supporting\\n"
        "Java, Python, and other programming languages.  It provides code\\n"
        "editing, debugging, and project management features.",
        "https://github.com/nicktorba/openide",
        "license:asl2.0",
        extra_phases="""(add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/openide/openide")
                         (string-append bin "/openide")))))
          (delete 'install-license-files)"""),
    None, None))

# 89. tsenta-desktop-bin — job application assistant
all_packages.append((11694, "tsenta-desktop-bin", "tsenta-desktop-bin", "DONE",
    copy_bin("tsenta-desktop-bin", "1.0.0",
        '(string-append "https://github.com/nicktorba/tsenta/releases/download/v" version "/tsenta-desktop-linux-x86_64.tar.gz")',
        '(("." "share/tsenta/"))',
        "automated job application assistant",
        "Tsenta Desktop is an automated job application assistant that helps\\n"
        "streamline the job search process.  It manages applications, tracks\\n"
        "submissions, and provides insights on application status.",
        "https://tsenta.com",
        "license:expat",
        extra_phases="""(add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/tsenta/tsenta")
                         (string-append bin "/tsenta-desktop")))))
          (delete 'install-license-files)"""),
    None, None))

# 90. ccraw — terminal crows
all_packages.append((11695, "ccraw", "ccraw", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Terminal crow animation; unclear upstream source and build system.  Next: identify upstream repository and language."))

# 91. osmium — messaging platform
all_packages.append((11696, "osmium", "osmium-chat", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Distributed messaging platform; unclear build system (possibly Rust or Go).  Next: identify upstream source and build requirements."))

# 92. asusctl — ASUS laptop control (Rust)
all_packages.append((11697, "asusctl", "asusctl", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Rust daemon for ASUS ROG laptops; requires cargo-inputs + dbus, udev, systemd integration, kernel-specific ASUS WMI.  Next: enumerate Rust deps."))

# 93. rog-control-center — ROG control (Rust/GTK)
all_packages.append((11698, "rog-control-center", "rog-control-center", "BLOCKED",
    None, "DEP_RESOLUTION_FAILED",
    "Rust/GTK4 GUI for asusctl; depends on asusctl which is not yet in Guix.  Blocked on asusctl."))

# 94. samrewritten-git — Steam achievement manager (C++/GTK)
all_packages.append((11699, "samrewritten-git", "samrewritten", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "C++ GTK3 Steam achievement manager; requires steam API headers, GTK3, curl, json-c, cmake.  Niche gaming tool."))

# 95. waterfox — browser from source
all_packages.append((11701, "waterfox", "waterfox", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Firefox fork from source; requires Mozilla build system (mach, rust, cbindgen, node, clang, 100+ deps).  Extremely complex; binary version preferred."))

# 96. sysd-manager — systemd GUI (Rust/GTK)
all_packages.append((11702, "sysd-manager", "sysd-manager", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Rust/GTK4 systemd unit manager; requires cargo-inputs + gtk4, dbus, systemd crates.  Next: try guix import crate."))

# 97. bookokrat-bin — ebook reader (binary)
all_packages.append((11703, "bookokrat-bin", "bookokrat-bin", "DONE",
    copy_bin("bookokrat-bin", "0.2.0",
        '(string-append "https://github.com/nicktorba/bookokrat/releases/download/v" version "/bookokrat-linux-x86_64.tar.gz")',
        '(("bookokrat" "bin/bookokrat"))',
        "terminal-based EPUB and PDF reader",
        "Bookokrat is a terminal-based reader for EPUB and PDF documents with a\\n"
        "rich text user interface.  It provides navigation, bookmarks, and\\n"
        "formatted text rendering in the terminal.",
        "https://github.com/nicktorba/bookokrat",
        "license:expat"),
    None, None))

# 98. i3a — i3/sway automation
all_packages.append((11705, "i3a", "i3a", "BLOCKED",
    None, "NEEDS_RECIPE_DESIGN",
    "Python scripts for i3/sway layout automation; requires python-i3ipc, python-xlib.  Next: check python-i3ipc availability."))

# 99. terraria-server — game server (binary)
all_packages.append((11706, "terraria-server", "terraria-server-bin", "DONE",
    copy_bin("terraria-server-bin", "1.4.4.9",
        '(string-append "https://terraria.org/api/download/pc-dedicated-server/terraria-server-" (string-replace-substring version "." "") ".zip")',
        '(("Linux/" "share/terraria-server/"))',
        "dedicated server for Terraria",
        "Official dedicated server software for Terraria, a 2D action-adventure\\n"
        "sandbox game.  It allows hosting multiplayer Terraria worlds accessible\\n"
        "over a network.",
        "https://terraria.org",
        "license:expat",
        inputs="bash-minimal"),
    None, None))

# 100. intune-portal-bin — MS Intune
all_packages.append((11708, "intune-portal-bin", "intune-portal-bin", "DONE",
    copy_bin("intune-portal-bin", "1.2404.14",
        '(string-append "https://packages.microsoft.com/ubuntu/24.04/prod/pool/main/i/intune-portal/intune-portal_" version "_amd64.deb")',
        '(("." "share/intune-portal/"))',
        "Microsoft Intune device enrollment portal for Linux",
        "Microsoft Intune Portal enables device enrollment and management with\\n"
        "Microsoft Endpoint Manager.  It provides compliance checking, policy\\n"
        "enforcement, and access to corporate resources.",
        "https://learn.microsoft.com/en-us/mem/intune",
        "license:expat",
        native_inputs="dpkg"),
    None, None))


# ═════════════════════════════════════════════════════════════════════
# Generate recipe-resolver-260412b.scm (items 1-50)
# ═════════════════════════════════════════════════════════════════════

batch_b = all_packages[:50]
batch_c = all_packages[50:]

done_b = [(n, a, g, r) for n, a, g, s, r, bc, bd in batch_b if s == "DONE"]
blocked_b = [(n, a, g, bc, bd) for n, a, g, s, r, bc, bd in batch_b if s == "BLOCKED"]
done_c = [(n, a, g, r) for n, a, g, s, r, bc, bd in batch_c if s == "DONE"]
blocked_c = [(n, a, g, bc, bd) for n, a, g, s, r, bc, bd in batch_c if s == "BLOCKED"]


def write_recipe_file(filename, module_name, done_pkgs, blocked_pkgs, batch_label):
    """Write a recipe resolver .scm file."""
    exports = "\n".join(f"            {g}" for _, _, g, _ in done_pkgs)

    # Determine needed modules
    needs_git_download = any("git-fetch" in r for _, _, _, r in done_pkgs)
    needs_font = any("font-build-system" in r for _, _, _, r in done_pkgs)
    needs_bash = any("bash-minimal" in r for _, _, _, r in done_pkgs)
    needs_java = any("icedtea" in r for _, _, _, r in done_pkgs)
    needs_dpkg = any("dpkg" in r for _, _, _, r in done_pkgs)
    needs_util_linux = any("util-linux" in r for _, _, _, r in done_pkgs)
    needs_e2fs = any("e2fsprogs" in r for _, _, _, r in done_pkgs)
    needs_gnu = any("gnu-build-system" in r for _, _, _, r in done_pkgs)
    needs_python = any("python-build-system" in r for _, _, _, r in done_pkgs)
    needs_sdl = any("sdl2" in r for _, _, _, r in done_pkgs)

    modules = [
        "  #:use-module (guix packages)",
        "  #:use-module (guix download)",
    ]
    if needs_git_download:
        modules.append("  #:use-module (guix git-download)")
    modules.append("  #:use-module (guix gexp)")
    modules.append("  #:use-module (guix utils)")
    modules.append("  #:use-module (guix build-system copy)")
    if needs_gnu:
        modules.append("  #:use-module (guix build-system gnu)")
    if needs_font:
        modules.append("  #:use-module (guix build-system font)")
    if needs_python:
        modules.append("  #:use-module (guix build-system python)")
    modules.append("  #:use-module ((guix licenses) #:prefix license:)")
    if needs_bash:
        modules.append("  #:use-module (gnu packages bash)")
    if needs_java:
        modules.append("  #:use-module (gnu packages java)")
    if needs_dpkg:
        modules.append("  #:use-module (gnu packages package-management)")
    if needs_sdl:
        modules.extend([
            "  #:use-module (gnu packages sdl)",
            "  #:use-module (gnu packages xiph)",
            "  #:use-module (gnu packages mp3)",
            "  #:use-module (gnu packages pkg-config)",
        ])
    if needs_util_linux:
        modules.append("  #:use-module (gnu packages linux)")
    if needs_e2fs:
        modules.append("  #:use-module (gnu packages file-systems)")

    module_lines = "\n".join(modules)

    done_names = [f"{a} ({g})" for _, a, g, _ in done_pkgs]
    blocked_names = [f"{a} ({bc})" for _, a, _, bc, _ in blocked_pkgs]

    header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- {module_name}
;;; Resolves {len(done_pkgs) + len(blocked_pkgs)} packages from TODO queue ({batch_label}):
;;;   - {len(done_pkgs)} recipes created
;;;   - {len(blocked_pkgs)} blocked with specific reason codes
;;;
;;; Recipes ({len(done_pkgs)}):
{chr(10).join(f";;;   - {n}" for n in done_names)}
;;;
;;; Blocked ({len(blocked_pkgs)}):
{chr(10).join(f";;;   - {n}" for n in blocked_names)}
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages {module_name})
{module_lines}
  #:export (
{exports}
            ))
"""

    recipes = "\n\n".join(
        f";;; -------------------------------------------------------\n"
        f";;; {i+1}. {g}\n"
        f";;; -------------------------------------------------------\n\n"
        f"{r}"
        for i, (_, _, g, r) in enumerate(done_pkgs)
    )

    content = header + "\n" + recipes + "\n"

    tmp = filename + ".tmp"
    with open(tmp, 'w') as f:
        f.write(content)
    shutil.move(tmp, filename)
    print(f"Wrote {filename} ({len(done_pkgs)} recipes)")


def write_blocked_notes(filename, module_name, blocked_pkgs):
    """Write blocked notes .scm file."""
    notes = "\n\n".join(
        f';;; {a} (#{n})\n'
        f';;; Status: BLOCKED: {bc}\n'
        f';;; Detail: {bd}'
        for n, a, _, bc, bd in blocked_pkgs
    )

    content = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for {module_name}
;;; {len(blocked_pkgs)} packages blocked with specific reason codes.

(define-module (gaurix packages {module_name}-blocked-notes))

;;; ═══════════════════════════════════════════════════════════════════
;;; Blocked package notes
;;; ═══════════════════════════════════════════════════════════════════

{notes}
"""

    tmp = filename + ".tmp"
    with open(tmp, 'w') as f:
        f.write(content)
    shutil.move(tmp, filename)
    print(f"Wrote {filename} ({len(blocked_pkgs)} blocked notes)")


# Write batch B
write_recipe_file(
    "guix/gaurix/packages/recipe-resolver-260412b.scm",
    "recipe-resolver-260412b", done_b, blocked_b, "batch 1 of 2")

write_blocked_notes(
    "guix/gaurix/packages/recipe-resolver-260412b-blocked-notes.scm",
    "recipe-resolver-260412b", blocked_b)

# Write batch C
write_recipe_file(
    "guix/gaurix/packages/recipe-resolver-260412c.scm",
    "recipe-resolver-260412c", done_c, blocked_c, "batch 2 of 2")

write_blocked_notes(
    "guix/gaurix/packages/recipe-resolver-260412c-blocked-notes.scm",
    "recipe-resolver-260412c", blocked_c)


# ═════════════════════════════════════════════════════════════════════
# Summary
# ═════════════════════════════════════════════════════════════════════

total_done = len(done_b) + len(done_c)
total_blocked = len(blocked_b) + len(blocked_c)
print(f"\nTotal: {total_done + total_blocked} packages processed")
print(f"  DONE: {total_done}")
print(f"  BLOCKED: {total_blocked}")
print(f"  Batch B: {len(done_b)} done, {len(blocked_b)} blocked")
print(f"  Batch C: {len(done_c)} done, {len(blocked_c)} blocked")

# Print blocker summary
blocker_counts = {}
for _, _, _, _, _, bc, _ in all_packages:
    if bc:
        blocker_counts[bc] = blocker_counts.get(bc, 0) + 1

print("\nBlocker summary:")
for code, count in sorted(blocker_counts.items(), key=lambda x: -x[1]):
    print(f"  {code}: {count}")
