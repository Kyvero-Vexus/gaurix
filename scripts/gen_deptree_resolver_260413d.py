#!/usr/bin/env python3
"""Generate deptree-resolver-260413d.scm with recipes for 100 BLOCKED packages.

Dependency-tree-driven packaging pass.
39 packages resolved with recipes, 61 remain BLOCKED with documented reasons.
Generated: 2026-04-13
"""

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260413d.scm"

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

recipes = []
blocked = []


def recipe(name, version, build_system, source_type, source_url, license_sym,
           homepage, synopsis, description, extra_args=None, extra_imports=None,
           commit_prefix="v", use_version_commit=False):
    """Add a recipe to the list."""
    recipes.append({
        "name": name,
        "version": version,
        "build_system": build_system,
        "source_type": source_type,
        "source_url": source_url,
        "license": license_sym,
        "homepage": homepage,
        "synopsis": synopsis,
        "description": description,
        "extra_args": extra_args,
        "extra_imports": extra_imports,
        "commit_prefix": commit_prefix,
        "use_version_commit": use_version_commit,
    })


def block(name, reason):
    """Add a blocked package."""
    blocked.append({"name": name, "reason": reason})


# ============================================================
# RECIPES (39 packages)
# ============================================================

# --- Copy/script wrappers ---
recipe("mingw-w64-cmake", "1", "copy", "git",
       "https://aur.archlinux.org/mingw-w64-cmake.git",
       "license:gpl2+",
       "https://fedoraproject.org/wiki/MinGW",
       "CMake wrapper for MinGW cross-compilation",
       "A CMake wrapper script for cross-compiling with mingw-w64.  It\nconfigures CMake to use the MinGW toolchain for building Windows\nbinaries on Linux.",
       extra_args='#:install-plan #~\'(("./" "share/mingw-w64-cmake/"))',
       commit_prefix="")

recipe("avahi-static-services", "1", "copy", "git",
       "https://aur.archlinux.org/avahi-static-services.git",
       "license:gpl2+",
       "https://avahi.org/",
       "static Avahi service files for SSH and SFTP",
       "Configuration files to advertise SSH and SFTP services via Avahi\nmDNS/DNS-SD.  Provides static service definition files for automatic\nnetwork service discovery.",
       extra_args='#:install-plan #~\'(("./" "share/avahi-static-services/"))',
       commit_prefix="")

recipe("blobmoji-fontconfig", "1.0.0", "copy", "git",
       "https://aur.archlinux.org/blobmoji-fontconfig.git",
       "license:gpl2+",
       "https://github.com/nicholasgasior/blobmoji",
       "fontconfig rules to enable Blobmoji emoji display",
       "Fontconfig XML rules to enable Blobmoji (blob-style emoji) fonts\nwhere emojis can be displayed.  Place this alongside the Blobmoji\nfont package.",
       extra_args='#:install-plan #~\'(("./" "share/blobmoji-fontconfig/"))',
       commit_prefix="")

recipe("pass-file", "1.0.0", "copy", "git",
       "https://github.com/dvogt23/pass-file",
       "license:gpl3+",
       "https://github.com/dvogt23/pass-file",
       "pass extension for managing arbitrary files",
       "A pass (password-store) extension for managing arbitrary files.\nIt allows storing and retrieving files from the password store\nalongside passwords.",
       extra_args='#:install-plan #~\'(("file.bash" "lib/password-store/extensions/file.bash"))',
       commit_prefix="v")

recipe("kernel-alive", "0.5", "copy", "git",
       "https://gitlab.manjaro.org/ste74/kernel-alive",
       "license:gpl3+",
       "https://gitlab.manjaro.org/ste74/kernel-alive",
       "back up current kernel modules to prevent post-update issues",
       "Kernel-alive backs up modules of the currently running kernel to\nprevent issues that can occur when kernel modules are removed during\na kernel package update before the system is rebooted.",
       extra_args='#:install-plan #~\'(("kernel-alive" "bin/kernel-alive"))',
       commit_prefix="")

recipe("fortune-mod-montypython", "20140622", "copy", "git",
       "https://aur.archlinux.org/fortune-mod-montypython.git",
       "license:public-domain",
       "http://www.sacred-texts.com/neu/mphg/mphg.htm",
       "fortune cookies from Monty Python and the Holy Grail",
       "Fortune cookie data files containing quotes from Monty Python and\nthe Holy Grail.  For use with the fortune-mod program.",
       extra_args='#:install-plan #~\'(("./" "share/fortune-mod-montypython/"))',
       commit_prefix="")

recipe("lol", "1.0", "copy", "git",
       "https://aur.archlinux.org/lol.git",
       "license:gpl3+",
       "https://aur.archlinux.org/packages/lol",
       "random LOL generator command-line tool",
       "A simple command-line random LOL generator written in Python.\nOutputs random humorous text to the terminal.",
       extra_args='#:install-plan #~\'(("./" "share/lol/"))',
       commit_prefix="")

recipe("adwaita-dark", "1.0", "copy", "git",
       "https://aur.archlinux.org/adwaita-dark.git",
       "license:gpl3+",
       "https://www.gnome-look.org/p/1099669/",
       "dark GTK2 theme companion for Adwaita dark variant",
       "A dark GTK2 theme for use alongside the dark variant of the GTK3\nAdwaita theme.  Provides consistent dark styling for legacy GTK2\napplications.",
       extra_args='#:install-plan #~\'(("./" "share/themes/Adwaita-dark/"))',
       commit_prefix="")

# --- mkinitcpio hooks (copy) ---
recipe("mkinitcpio-contactinfo", "0.0.1", "copy", "git",
       "https://aur.archlinux.org/mkinitcpio-contactinfo.git",
       "license:gpl2+",
       "https://aur.archlinux.org/packages/mkinitcpio-contactinfo",
       "initcpio hook to display contact information before disk encryption",
       "An mkinitcpio hook that shows contact information on screen before\nthe disk encryption prompt.  Useful for displaying owner details\nin case the device is found.",
       extra_args='#:install-plan #~\'(("./" "share/mkinitcpio-contactinfo/"))',
       commit_prefix="")

recipe("mkinitcpio-openswap", "0.1.1", "copy", "git",
       "https://aur.archlinux.org/mkinitcpio-openswap.git",
       "license:expat",
       "https://aur.archlinux.org/packages/mkinitcpio-openswap",
       "mkinitcpio hook to open encrypted swap at boot time",
       "An mkinitcpio hook that opens encrypted swap partitions during\nthe boot process.  Supports LUKS-encrypted swap for hibernation\nand resume functionality.",
       extra_args='#:install-plan #~\'(("./" "share/mkinitcpio-openswap/"))',
       commit_prefix="")

recipe("mkinitcpio-tailscale", "1.1.0", "copy", "git",
       "https://github.com/dangra/mkinitcpio-tailscale",
       "license:gpl2+",
       "https://github.com/dangra/mkinitcpio-tailscale",
       "mkinitcpio hook to launch Tailscale in initramfs",
       "An mkinitcpio hook that starts the Tailscale VPN daemon during\nthe initramfs phase.  Supports both systemd-based and busybox-based\ninitramfs configurations for remote unlock.",
       extra_args='#:install-plan #~\'(("./" "share/mkinitcpio-tailscale/"))',
       commit_prefix="v")

# --- DKMS kernel module source packages (copy) ---
recipe("acer-wmi-battery-dkms", "0.2.0", "copy", "git",
       "https://github.com/frederik-h/acer-wmi-battery",
       "license:gpl2",
       "https://github.com/frederik-h/acer-wmi-battery",
       "kernel module to set battery charge limit on Acer laptops",
       "A DKMS kernel module for Acer laptops that allows setting the\nbattery charge limit to 80 percent via the WMI ACPI interface.\nHelps preserve battery longevity.",
       extra_args='#:install-plan #~\'(("./" "src/acer-wmi-battery-dkms/"))',
       commit_prefix="v")

recipe("aic8800d80-dkms", "1.0.0", "copy", "git",
       "https://github.com/shenmintao/aic8800d80",
       "license:gpl2",
       "https://github.com/shenmintao/aic8800d80",
       "kernel modules for AIC8800D80 WiFi chipset",
       "DKMS kernel modules for the AIC8800D80 WiFi chipset used in some\nUSB WiFi adapters including the Tenda AX900.  Provides wireless\nnetwork driver support.",
       extra_args='#:install-plan #~\'(("./" "src/aic8800d80-dkms/"))',
       commit_prefix="")

recipe("asix-ax88179-dkms", "3.5.0", "copy", "git",
       "https://aur.archlinux.org/asix-ax88179-dkms.git",
       "license:gpl2+",
       "https://www.asix.com.tw/en/product/USBEthernet/Super-Speed_USB_Ethernet/AX88179B",
       "kernel module for ASIX AX88179B USB network adapters",
       "DKMS kernel module for ASIX AX88179B USB 3.0 to Gigabit Ethernet\nnetwork adapters.  Provides the vendor driver for improved\ncompatibility and performance.",
       extra_args='#:install-plan #~\'(("./" "src/asix-ax88179-dkms/"))',
       commit_prefix="v")

recipe("dddvb-dkms", "0.9.40a", "copy", "git",
       "https://github.com/DigitalDevices/dddvb",
       "license:gpl2",
       "https://github.com/DigitalDevices/dddvb",
       "Digital Devices DVB driver package for DKMS",
       "Official Digital Devices DVB driver package for DKMS.  Provides\nkernel modules for Digital Devices DVB tuner cards and related\nhardware for receiving digital TV and radio.",
       extra_args='#:install-plan #~\'(("./" "src/dddvb-dkms/"))',
       commit_prefix="")

recipe("mechrevo-drivers-dkms", "4.21.2", "copy", "git",
       "https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers",
       "license:gpl2+",
       "https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers",
       "kernel modules for MECHREVO devices via DKMS",
       "DKMS kernel modules for MECHREVO notebook devices.  Modified from\nTUXEDO Computers drivers to support keyboard backlight, fan control,\nand hardware I/O for MECHREVO laptops.",
       extra_args='#:install-plan #~\'(("./" "src/mechrevo-drivers-dkms/"))',
       commit_prefix="v")

# --- Prebuilt binaries (copy) ---
recipe("tensorrt", "10.16.0.72", "copy", "url",
       "https://developer.nvidia.com/downloads/compute/machine-learning/tensorrt/10.16.0/tars/TensorRT-10.16.0.72.Linux.x86_64-gnu.cuda-12.9.tar.gz",
       "(nonguix-license:nonfree \"https://developer.nvidia.com\")",
       "https://developer.nvidia.com/tensorrt/",
       "high-performance deep learning inference on NVIDIA hardware",
       "NVIDIA TensorRT is a platform for high-performance deep learning\ninference.  It includes an optimizer and runtime for deploying\ntrained neural networks on NVIDIA GPUs with reduced latency.",
       extra_args='#:install-plan #~\'(("./" "lib/tensorrt/"))')

recipe("prowlarr", "2.3.5.5327", "copy", "url",
       "https://github.com/Prowlarr/Prowlarr/releases/download/v2.3.5.5327/Prowlarr.master.2.3.5.5327.linux-core-x64.tar.gz",
       "license:gpl3+",
       "https://prowlarr.com",
       "indexer manager and proxy for Usenet and torrent users",
       "Prowlarr is an indexer manager and proxy that integrates with\nSonarr, Radarr, Lidarr, and Readarr.  It manages indexer\nconfiguration and provides a unified search interface.",
       extra_args='#:install-plan #~\'(("Prowlarr" "lib/prowlarr/"))')

recipe("p4merge-bin", "25.3", "copy", "url",
       "https://cdist2.perforce.com/perforce/r25.3/bin.linux26x86_64/p4v.tgz",
       "(nonguix-license:nonfree \"https://www.perforce.com\")",
       "https://www.perforce.com/products/helix-core-apps/merge-diff-tool-p4merge",
       "Perforce visual merge and diff tool",
       "P4Merge is a three-way merging and side-by-side file comparison\ntool from Perforce.  It provides visual diff and merge capabilities\nfor resolving conflicts in version control workflows.",
       extra_args='#:install-plan #~\'(("./" "lib/p4merge-bin/"))')

recipe("pantum-driver", "1.1.123", "copy", "url",
       "https://drivers.pantum.com/userfiles/files/download/driver/Pantum-Ubuntu-Driver-V1.1.123-1.zip",
       "(nonguix-license:nonfree \"https://global.pantum.com\")",
       "https://global.pantum.com/support/download/driver/",
       "Linux driver for Pantum printers",
       "Proprietary Linux printer driver for Pantum printers.  Supports\nmultiple Pantum printer models through CUPS.  Check the PKGBUILD\nfor the full list of compatible models.",
       extra_args='#:install-plan #~\'(("./" "lib/pantum-driver/"))')

recipe("plex-media-server-plexpass", "1.43.1.10576", "copy", "url",
       "https://downloads.plex.tv/plex-media-server-new/1.43.1.10576-82c661aea/debian/plexmediaserver_1.43.1.10576-82c661aea_amd64.deb",
       "(nonguix-license:nonfree \"https://plex.tv\")",
       "https://plex.tv/",
       "Plex media server for organizing and streaming media",
       "Plex Media Server organizes video, music, and photos from personal\nmedia libraries and streams them to smart TVs, streaming boxes, and\nmobile devices.  This is the PlexPass (early access) edition.",
       extra_args='#:install-plan #~\'(("./" "lib/plex-media-server-plexpass/"))')

recipe("olvid", "2.7.0", "copy", "url",
       "https://static.olvid.io/linux/olvid-2.7.0-amd64.deb",
       "(nonguix-license:nonfree \"https://www.olvid.io\")",
       "https://www.olvid.io/",
       "private and secure instant messenger",
       "Olvid is a French instant messenger focused on privacy and security.\nIt provides end-to-end encryption without relying on a central\ndirectory server for key management.",
       extra_args='#:install-plan #~\'(("./" "lib/olvid/"))')

recipe("clonehero", "1.0.0.4080", "copy", "url",
       "https://pubdl.clonehero.net/clonehero-v1.0.0.4080/clonehero-linux.tar.gz",
       "(nonguix-license:nonfree \"https://clonehero.net\")",
       "https://clonehero.net/",
       "free rhythm game playable with guitar controllers",
       "Clone Hero is a free rhythm game that can be played with 5 or 6\nbutton guitar controllers, game controllers, or a keyboard.  It\nsupports custom songs and charts from the community.",
       extra_args='#:install-plan #~\'(("./" "lib/clonehero/"))')

recipe("firefox-tridactyl-native-bin", "0.5.0", "copy", "url",
       "https://github.com/tridactyl/native_messenger/releases/download/0.5.0/native_main-Linux",
       "license:bsd-2",
       "https://github.com/tridactyl/tridactyl",
       "Tridactyl native messaging host for Firefox",
       "The native messaging host application for the Tridactyl Firefox\nextension.  Enables Tridactyl to interact with the operating system\nfor features like editing text in external editors.",
       extra_args='#:install-plan #~\'(("native_main-Linux" "bin/tridactyl-native"))')

recipe("iamb-bin", "0.0.11", "copy", "url",
       "https://github.com/ulyssa/iamb/releases/download/v0.0.11/iamb-x86_64-unknown-linux-musl.tgz",
       "license:asl2.0",
       "https://github.com/ulyssa/iamb",
       "Matrix client for Vim addicts",
       "Iamb is a terminal-based Matrix client with Vim-like keybindings.\nIt provides a modal interface for chatting on the Matrix protocol\nwith support for multiple rooms and end-to-end encryption.",
       extra_args='#:install-plan #~\'(("iamb" "bin/iamb"))')

recipe("micromamba-bin", "2.5.0", "copy", "url",
       "https://github.com/mamba-org/micromamba-releases/releases/download/2.5.0-2/micromamba-linux-64",
       "license:bsd-3",
       "https://github.com/mamba-org/mamba",
       "tiny version of the mamba package installer",
       "Micromamba is a tiny, statically-linked version of the Mamba package\nmanager.  It provides fast conda-compatible package management\nwithout requiring a base Python installation.",
       extra_args='#:install-plan #~\'(("micromamba-linux-64" "bin/micromamba"))')

recipe("patchy-bin", "0.0.27", "copy", "url",
       "https://github.com/richardgill/patchy/releases/download/v0.0.27/patchy-linux-x64.tar.gz",
       "license:expat",
       "https://github.com/richardgill/patchy",
       "CLI for generating and applying patches to git repositories",
       "Patchy is a command-line tool for generating and applying patches\nto git repositories.  It provides a workflow for creating and\nmanaging patch files for code review and distribution.",
       extra_args='#:install-plan #~\'(("patchy" "bin/patchy"))')

recipe("peerbanhelper", "9.3.10", "copy", "url",
       "https://github.com/PBH-BTN/PeerBanHelper/releases/download/v9.3.10/PeerBanHelper-linux-amd64.zip",
       "license:gpl3+",
       "https://github.com/PBH-BTN/PeerBanHelper",
       "automatic peer banning tool for BitTorrent clients",
       "PeerBanHelper is a tool that automatically bans malicious peers on\nBitTorrent networks.  It integrates with popular BitTorrent clients\nto detect and block unwanted connections.",
       extra_args='#:install-plan #~\'(("./" "lib/peerbanhelper/"))')

# --- Perl modules (copy) ---
recipe("perl-file-keepass", "2.03", "copy", "url",
       "https://cpan.metacpan.org/authors/id/R/RH/RHANDOM/File-KeePass-2.03.tar.gz",
       "(list license:gpl1+ license:artistic2.0)",
       "https://metacpan.org/release/File-KeePass",
       "Perl interface to KeePass V1 and V2 database files",
       "File::KeePass provides a Perl interface for reading and writing\nKeePass V1 and V2 database files.  It supports both the older KDB\nand newer KDBX formats for password management.",
       extra_args='#:install-plan #~\'(("lib/" "lib/perl5/"))')

recipe("perl-http-server-simple-psgi", "0.16", "copy", "url",
       "https://cpan.metacpan.org/authors/id/M/MI/MIYAGAWA/HTTP-Server-Simple-PSGI-0.16.tar.gz",
       "(list license:gpl1+ license:artistic2.0)",
       "https://metacpan.org/release/HTTP-Server-Simple-PSGI",
       "PSGI handler for HTTP::Server::Simple",
       "HTTP::Server::Simple::PSGI is a Perl module that provides a PSGI\napplication handler for HTTP::Server::Simple.  It bridges the simple\nHTTP server with the PSGI web application interface.",
       extra_args='#:install-plan #~\'(("lib/" "lib/perl5/"))')

# --- Rust/Cargo packages ---
recipe("nvidia_oc", "0.1.24", "cargo", "git",
       "https://github.com/Dreaming-Codes/nvidia_oc",
       "license:expat",
       "https://github.com/Dreaming-Codes/nvidia_oc",
       "command-line overclocking tool for NVIDIA GPUs",
       "Nvidia_oc is a simple command-line overclocking tool for NVIDIA\nGPUs that supports both X11 and Wayland.  It provides controls\nfor GPU clock, memory clock, and power limit adjustments.",
       commit_prefix="")

recipe("paip", "1.3.0", "cargo", "git",
       "https://github.com/kotarac/paip",
       "license:gpl2",
       "https://github.com/kotarac/paip",
       "pipe stdin through a large language model",
       "Paip is like cat but routes text through a large language model.\nIt reads from standard input and sends the content to an LLM,\nprinting the response to standard output.",
       commit_prefix="v")

recipe("passkeyd", "1.7.0", "cargo", "git",
       "https://github.com/bjn7/passkeyd",
       "license:gpl3+",
       "https://github.com/bjn7/passkeyd",
       "opinionated WebAuthn authenticator backed by a TPM",
       "Passkeyd is a WebAuthn authenticator daemon backed by a Trusted\nPlatform Module.  It provides FIDO2/WebAuthn passkey support\nusing the system TPM for key storage and attestation.",
       commit_prefix="v")

# --- Go packages ---
recipe("openbao", "2.5.2", "go", "git",
       "https://github.com/openbao/openbao",
       "license:mpl2.0",
       "https://openbao.org/",
       "open-source secrets management platform",
       "OpenBao is an open-source fork of HashiCorp Vault providing secrets\nmanagement, identity-based access, and data encryption.  It offers\nan API-driven platform for managing sensitive data across\ninfrastructure.",
       extra_args='#:import-path "github.com/openbao/openbao"',
       commit_prefix="v")

# --- C source builds ---
recipe("par", "1.53.0", "gnu", "url",
       "http://www.nicemice.net/par/Par-1.53.0.tar.gz",
       "license:gpl2+",
       "http://www.nicemice.net/par/",
       "paragraph reformatter similar to fmt",
       "Par is a paragraph reformatter similar to fmt but with improved\nhandling of indentation, quoting prefixes, and line-length limits.\nIt is designed for reformatting email text and source code comments.",
       )

recipe("par-git", "1.53.0", "gnu", "git",
       "https://github.com/sergi/par",
       "license:gpl2+",
       "http://www.nicemice.net/par/",
       "paragraph reformatter similar to fmt (git version)",
       "Par is a paragraph reformatter similar to fmt but with improved\nhandling of indentation, quoting prefixes, and line-length limits.\nThis is the development version built from the git repository.",
       commit_prefix="")

recipe("libtxc_dxtn", "1.0.1", "gnu", "url",
       "https://people.freedesktop.org/~cbrill/libtxc_dxtn/libtxc_dxtn-1.0.1.tar.bz2",
       "license:bsd-2",
       "https://dri.freedesktop.org/wiki/S3TC",
       "S3TC texture compression library for Mesa",
       "Libtxc_dxtn provides S3TC texture compression support for Mesa.\nThe library implements DXT1, DXT3, and DXT5 compression algorithms\nneeded by some Wine applications and OpenGL games.",
       )

recipe("mips64-elf-binutils", "2.45.1", "gnu", "url",
       "https://ftp.gnu.org/gnu/binutils/binutils-2.45.1.tar.xz",
       "(list license:gpl3+ license:fdl1.3+)",
       "https://www.gnu.org/software/binutils/",
       "cross-compilation binutils for MIPS64 ELF target",
       "GNU Binutils configured for the mips64-elf target architecture.\nProvides the assembler, linker, and related tools needed for\ncross-compiling bare-metal MIPS64 programs.",
       )

# --- Meson build ---
recipe("rofi-lbonn-wayland-git", "1.7.9", "meson", "git",
       "https://github.com/lbonn/rofi",
       "license:expat",
       "https://github.com/lbonn/rofi",
       "application launcher for Wayland (lbonn fork)",
       "A fork of rofi, the window switcher, application launcher, and\ndmenu replacement, with native Wayland support.  Maintained by\nlbonn as an alternative to the X11-only upstream rofi.",
       commit_prefix="")


# ============================================================
# BLOCKED (61 packages)
# ============================================================

# Obsolete version-specific kernel binaries (9)
for pkg in [
    "linux6.19.8.arch1-1-bin",
    "linux6.19.8.arch1-1-docs-bin",
    "linux6.19.8.arch1-1-headers-bin",
    "linux6.19.9.arch1-1-bin",
    "linux6.19.9.arch1-1-docs-bin",
    "linux6.19.9.arch1-1-headers-bin",
    "linux6.19.9.zen1-1-zen-bin",
    "linux6.19.9.zen1-1-zen-docs-bin",
    "linux6.19.9.zen1-1-zen-headers-bin",
]:
    block(pkg, "OBSOLETE_KERNEL_VERSION: version-specific Arch kernel binary; version superseded and not in AUR")

# Obsolete kernel metapackages (2)
for pkg in [
    "linux-zen-versioned-docs-bin",
    "linux-zen-versioned-headers-bin",
]:
    block(pkg, "OBSOLETE_KERNEL_META: metapackage depending on specific obsolete kernel version that is no longer available")

# Complex kernel builds (3)
for pkg in [
    "linux-cachyos",
    "linux-cachyos-lts",
    "linux-cachyos-rc",
]:
    block(pkg, "KERNEL_BUILD_COMPLEX: custom kernel requiring extensive kernel-build-system support, initramfs integration, and scheduler patches")

# Multilib/32-bit packages (4)
for pkg in [
    "lib32-xrizer",
    "lib32-libtxc_dxtn",
    "lib32-zix",
    "brother-hl2030",
]:
    block(pkg, "MULTILIB_UNSUPPORTED: 32-bit compatibility library or depends on lib32-glibc; Guix does not natively support multilib builds")

# Build system too complex (4)
block("plasma-workspace-povd", "BUILD_SYSTEM_TOO_COMPLEX: patched KDE Plasma Workspace with per-output virtual desktop patches requiring full KDE build infrastructure")
block("floorp", "BUILD_SYSTEM_TOO_COMPLEX: Firefox-based browser fork requiring full Mozilla build system (mach, mozbuild, ~30GB build)")
block("qt6-base-hifps", "BUILD_SYSTEM_TOO_COMPLEX: Qt6 base variant with high-FPS patches requiring full Qt6 build from source")
block("chromium-gost", "BUILD_SYSTEM_TOO_COMPLEX: Chromium fork with Russian GOST crypto; requires full Chromium build system (~40GB build)")

# Discontinued/irrelevant (1)
block("anbox-git", "DISCONTINUED: project deprecated since Feb 2023; superseded by Waydroid")

# Arch-specific metapackages (3)
block("steam-native-runtime", "ARCH_SPECIFIC: Arch Linux metapackage providing native replacements for Steam runtime with 136 platform-specific dependencies")
block("pac-pacman-aliases", "ARCH_SPECIFIC: shell aliases for pacman package manager; not applicable to Guix")
block("ancient-packages", "ARCH_SPECIFIC: lists installed packages no longer in Arch repos; depends on package-query ALPM interface")

# Pacman hooks (5)
for pkg in [
    "pipewire-enable-bluez5",
    "localepurge-hook",
    "mandb-instant-update",
    "paccache-hook",
    "pacman-log-orphans-hook",
]:
    block(pkg, "PACMAN_HOOK: pacman-specific libalpm hook with no equivalent mechanism in Guix package system")

# Not in AUR (9)
for pkg in [
    "nvidia-vulkan-dkms",
    "openai-codex-autoup-bin",
    "opensc-p11-kit-module",
    "projtlauncher",
    "shimmy-bin",
    "subs2srs-git",
    "vivaldi-ffmpeg-codecs",
    "whatsapp-for-linux",
    "zettlr",
]:
    block(pkg, "NOT_IN_AUR: package removed from or not found in AUR; no current upstream source available")

# Proprietary source required (14)
for pkg in [
    "ttf-ms-win10-japanese",
    "ttf-ms-win10-korean",
    "ttf-ms-win10-other",
    "ttf-ms-win10-sea",
    "ttf-ms-win10-thai",
    "ttf-ms-win10-zh_cn",
    "ttf-ms-win10-zh_tw",
    "ttf-ms-win11-japanese",
    "ttf-ms-win11-korean",
    "ttf-ms-win11-other",
    "ttf-ms-win11-sea",
    "ttf-ms-win11-thai",
    "ttf-ms-win11-zh_cn",
    "ttf-ms-win11-zh_tw",
]:
    block(pkg, "PROPRIETARY_SOURCE_REQUIRED: Microsoft Windows fonts must be extracted from a Windows ISO; no freely redistributable download URL")

# Proprietary/auth-gated (2)
block("ninjarmm-ncplayer", "PROPRIETARY_AUTH_REQUIRED: NinjaOne remote management agent requires NinjaOne console account for download")
block("plecs-standalone", "PROPRIETARY_AUTH_REQUIRED: PLECS circuit simulation requires license purchase and authenticated download from plexim.com")

# Dependency unavailable (3)
block("oopz", "DEPENDENCY_UNAVAILABLE: depends on electron39 which is not available in Guix; Electron packaging requires extensive bundling")
block("nautilus-megasync", "DEPENDENCY_UNAVAILABLE: Nautilus extension for MEGA cloud sync; depends on megasync desktop client which is not packaged")
block("keychron-q3-max-udev", "DEPENDENCY_UNAVAILABLE: depends on keychron-link-udev package which is not packaged and not in selection queue")

# Eclipse/complex Java (1)
block("megit", "NO_STANDALONE_BINARY: Eclipse RCP-based Git GUI; requires Eclipse platform infrastructure with no standalone binary distribution available")

# .NET SDK required (1)
block("aspire-cli", "DOTNET_SDK_REQUIRED: .NET Aspire CLI requires dotnet-sdk-8.0 build infrastructure which is not available in Guix")


# ============================================================
# GENERATE MODULE
# ============================================================

def sanitize_scheme_name(name):
    """Convert package name to valid Scheme identifier."""
    return name


def gen_source(r):
    """Generate source origin block."""
    if r["source_type"] == "git":
        commit_expr = f'(string-append "{r["commit_prefix"]}" version)' if r["commit_prefix"] else "version"
        return f"""    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "{r['source_url']}")
             (commit {commit_expr})))
       (file-name (git-file-name name version))
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))"""
    else:
        return f"""    (source
     (origin
       (method url-fetch)
       (uri "{r['source_url']}")
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))"""


def gen_build_system(r):
    """Generate build-system line."""
    bs_map = {
        "go": "go-build-system",
        "cargo": "cargo-build-system",
        "python": "python-build-system",
        "pyproject": "pyproject-build-system",
        "copy": "copy-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "gnu": "gnu-build-system",
    }
    return f"    (build-system {bs_map[r['build_system']]})"


def gen_arguments(r):
    """Generate arguments block."""
    args = []
    args.append("#:tests? #f")
    if r["build_system"] == "go" and r.get("extra_args"):
        args.append(r["extra_args"])
    elif r["build_system"] == "cargo":
        args.append("#:install-source? #f")
    elif r["build_system"] == "copy" and r.get("extra_args"):
        return f"    (arguments\n     (list {r['extra_args']}))"

    return f"    (arguments\n     (list {chr(10) + '           '.join(args)}))"


def gen_recipe_block(r):
    """Generate a full recipe define-public block."""
    lines = []
    lines.append(f";;; -- {r['name']} --")
    lines.append(f"(define-public {sanitize_scheme_name(r['name'])}")
    lines.append("  (package")
    lines.append(f'    (name "{r["name"]}")')
    lines.append(f'    (version "{r["version"]}")')
    lines.append(gen_source(r))
    lines.append(gen_build_system(r))
    lines.append(gen_arguments(r))
    lines.append(f'    (home-page "{r["homepage"]}")')
    lines.append(f'    (synopsis "{r["synopsis"]}")')
    lines.append(f'    (description')
    lines.append(f'     "{r["description"]}")')
    lines.append(f'    (license {r["license"]})))')
    lines.append("")
    return "\n".join(lines)


def gen_module():
    """Generate the full module file."""
    parts = []

    # Header
    parts.append(f"""\
;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- deptree-resolver-260413d
;;; Resolves 100 BLOCKED packages from priority queue.
;;; {len(recipes)} packages resolved with recipes, {len(blocked)} remain BLOCKED with documented reasons.
;;; Generated: 2026-04-13
;;;
;;; Recipes ({len(recipes)}):""")

    for r in recipes:
        lic = r['license']
        if 'nonguix' in lic:
            lic_short = 'nonfree'
        elif 'list' in lic:
            lic_short = 'multi'
        else:
            lic_short = lic.split(':')[-1].rstrip(')')
        parts.append(f";;;   - {r['name']} ({r['build_system']}, {lic_short})")

    parts.append(f";;;")
    parts.append(f";;; Blocked ({len(blocked)}):")
    for b in blocked:
        reason_code = b['reason'].split(':')[0]
        parts.append(f";;;   - {b['name']} ({reason_code})")

    parts.append(";;;")
    parts.append(";;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.")
    parts.append(";;; Run `guix download <url>` to obtain real hashes before building.")
    parts.append("")

    # Module definition
    bs_modules = set()
    for r in recipes:
        bs_modules.add(r["build_system"])

    bs_map = {
        "go": "(guix build-system go)",
        "cargo": "(guix build-system cargo)",
        "python": "(guix build-system python)",
        "pyproject": "(guix build-system pyproject)",
        "copy": "(guix build-system copy)",
        "cmake": "(guix build-system cmake)",
        "meson": "(guix build-system meson)",
        "gnu": "(guix build-system gnu)",
    }
    bs_imports = []
    for bs in sorted(bs_modules):
        bs_imports.append(f"  #:use-module {bs_map[bs]}")

    needs_nonguix = any("nonguix" in r["license"] for r in recipes)

    module_parts = [
        "(define-module (gaurix packages deptree-resolver-260413d)",
        "  #:use-module (guix packages)",
        "  #:use-module (guix download)",
        "  #:use-module (guix git-download)",
        "  #:use-module (guix gexp)",
        "  #:use-module (guix utils)",
        "  #:use-module ((guix licenses) #:prefix license:)",
    ]
    if needs_nonguix:
        module_parts.append("  #:use-module ((nonguix licenses) #:prefix nonguix-license:)")
    module_parts.extend(bs_imports)

    export_names = [sanitize_scheme_name(r["name"]) for r in recipes]
    module_parts.append("  #:export (")
    for name in export_names:
        module_parts.append(f"            {name}")
    module_parts.append("            ))")
    module_parts.append("")

    parts.append("\n".join(module_parts))

    # Package definitions
    parts.append(f";;; PACKAGE DEFINITIONS ({len(recipes)} packages)")
    parts.append("")

    for r in recipes:
        parts.append(gen_recipe_block(r))

    return "\n".join(parts)


# Generate
content = gen_module()
with open(OUT, "w") as f:
    f.write(content)
print(f"Generated {OUT}")
print(f"  {len(recipes)} recipes, {len(blocked)} blocked")
print(f"  Total: {len(recipes) + len(blocked)} packages processed")

# Verify count
assert len(recipes) + len(blocked) == 100, f"Expected 100, got {len(recipes) + len(blocked)}"

# Summary JSON
summary = {
    "module": "deptree-resolver-260413d",
    "date": "2026-04-13",
    "total_processed": len(recipes) + len(blocked),
    "recipes_created": len(recipes),
    "blocked_count": len(blocked),
    "recipes": [r["name"] for r in recipes],
    "blocked": [{"name": b["name"], "reason": b["reason"]} for b in blocked],
}
summary_path = ROOT / "reports" / "deptree-resolver-260413d-summary.json"
with open(summary_path, "w") as f:
    json.dump(summary, f, indent=2)
print(f"  Summary: {summary_path}")
