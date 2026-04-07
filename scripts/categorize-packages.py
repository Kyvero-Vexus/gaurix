#!/usr/bin/env python3
"""Categorize top 100 packages into resolution strategies."""
import json
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = REPO_ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TREE_JSON = REPO_ROOT / "reports" / "blocked-dependency-tree.json"

# Map AUR package names to their Guix equivalents for compat aliases
# These are packages that exist in Guix under a different name
GUIX_COMPAT_MAP = {
    # Already defined in general-compat.scm:
    # openssl-1.1, python312, qt5-scxml all exist already
    # New aliases we can create:

    # Qt5 packages (Guix has qt* packages)
    "qt5-doc": ("qttools-5", "gnu packages qt"),
    "qt5-connectivity": ("qtconnectivity-5", "gnu packages qt"),

    # Build tools / dev tools that exist in Guix
    "doas": ("opendoas", "gnu packages admin"),

    # Fonts
    "redhat-fonts": ("font-redhat", "gnu packages fonts"),
    "noto-fonts-emoji-blob": ("font-google-noto-emoji", "gnu packages fonts"),

    # Misc existing packages under different names
    "tailscale": ("tailscale", "gnu packages vpn"),
}

# Packages that are Arch-specific and cannot be meaningfully ported
ARCH_SPECIFIC = {
    "yay": "AUR helper - Arch-specific (depends on pacman)",
    "paru": "AUR helper - Arch-specific (depends on pacman/libalpm)",
    "archlinux-java-run": "Arch-specific Java launcher",
    "waydroid": "Not in AUR cache (removed/renamed); complex Android container",
    "ros2-arch-deps": "Arch-specific meta-package for ROS2 dependencies",
    "localepurge": "Debian-specific locale removal tool (not applicable to Guix)",
    "mips64-linux-gnu-linux-api-headers": "Cross-compilation kernel headers (Guix has its own approach)",
}

# Packages that need source builds (cmake, meson, autotools, etc.)
SOURCE_BUILD = {
    "httpdirfs": {"build_system": "meson", "url_template": "github", "github": "fangfufu/httpdirfs"},
    "html2markdown": {"build_system": "go", "url_template": "github", "github": "JohannesKaufmann/html-to-markdown"},
    "davs2": {"build_system": "gnu", "url_template": "github", "github": "pkuvcl/davs2"},
    "zmusic": {"build_system": "cmake", "url_template": "github", "github": "ZDoom/ZMusic"},
    "openapv": {"build_system": "cmake", "url_template": "github", "github": "AcademySoftwareFoundation/openapv"},
    "xevd": {"build_system": "cmake", "url_template": "github", "github": "mpeg5/xevd"},
    "xeve": {"build_system": "cmake", "url_template": "github", "github": "mpeg5/xeve"},
    "vvenc": {"build_system": "cmake", "url_template": "github", "github": "fraunhoferhhi/vvenc"},
    "libuvc": {"build_system": "cmake", "url_template": "github", "github": "libuvc/libuvc"},
    "libaribcaption": {"build_system": "cmake", "url_template": "github", "github": "xqq/libaribcaption"},
    "uavs3d-git": {"build_system": "cmake", "url_template": "github", "github": "uavs3/uavs3d"},
    "lcevcdec": {"build_system": "cmake", "url_template": "github", "github": "v-novaltd/LCEVCdec"},
    "xavs2": {"build_system": "gnu", "url_template": "github", "github": "pkuvcl/xavs2"},
    "libklvanc": {"build_system": "gnu", "url_template": "github", "github": "stoth68000/libklvanc"},
    "flite1": {"build_system": "gnu", "url_template": "custom"},
    "arduino-ctags": {"build_system": "gnu", "url_template": "github", "github": "arduino/ctags"},
    "grepcidr": {"build_system": "gnu", "url_template": "custom"},
    "genders": {"build_system": "gnu", "url_template": "github", "github": "chaos/genders"},
    "xboxdrv": {"build_system": "meson", "url_template": "github", "github": "xiota/xboxdrv"},
    "gslapper": {"build_system": "meson", "url_template": "github", "github": "Nomadcxx/gSlapper"},
    "deb2targz": {"build_system": "trivial", "url_template": "custom"},
    "elephant": {"build_system": "go", "url_template": "github", "github": "abenz1267/elephant"},
    "domake": {"build_system": "gnu", "url_template": "github", "github": "gportay/domake"},
    "asroot": {"build_system": "gnu", "url_template": "custom"},
}

# Python packages
PYTHON_PACKAGES = {
    "python-opencensus": {"pypi": "opencensus"},
    "python-art": {"pypi": "art"},
    "python-inquirerpy": {"pypi": "InquirerPy"},
    "python-munge": {"pypi": "munge"},
    "python-plyer": {"pypi": "plyer"},
    "python-condense-json": {"pypi": "condense-json"},
    "python-m3u8": {"pypi": "m3u8"},
    "python-uv-dynamic-versioning": {"pypi": "uv-dynamic-versioning"},
    "python-sse-starlette": {"pypi": "sse-starlette"},
    "python-materialyoucolor": {"pypi": "materialyoucolor"},
    "python-syncedlyrics": {"pypi": "syncedlyrics"},
    "python-wassima": {"pypi": "wassima"},
    "python-pid": {"pypi": "pid"},
    "python-urllib3-future": {"pypi": "urllib3-future"},
}

# Binary packages (pre-built, copy-build-system)
BINARY_PACKAGES = {
    "bcompare": {"url": "https://www.scootersoftware.com", "desc": "Beyond Compare file comparison tool"},
    "rvgl-bin": {"url": "https://rvgl.org", "desc": "Rewrite of Re-Volt racing game"},
    "logmein-hamachi": {"url": "https://www.vpn.net/linux", "desc": "Zero-configuration VPN service"},
    "dotnet-runtime-9.0-bin": {"url": "https://dotnet.microsoft.com", "desc": ".NET Core runtime 9.0"},
    "nordvpn-bin": {"url": "https://nordvpn.com/download/linux/", "desc": "NordVPN CLI tool"},
    "foobar2000": {"url": "https://www.foobar2000.org", "desc": "Advanced freeware audio player (Wine)"},
    "brscan4": {"url": "http://support.brother.com", "desc": "SANE drivers from Brother"},
    "aspnet-runtime-bin": {"url": "https://www.microsoft.com/net/core", "desc": "ASP.NET Core runtime"},
    "aspnet-targeting-pack-bin": {"url": "https://www.microsoft.com/net/core", "desc": "ASP.NET Core targeting pack"},
    "lianwalld-bin": {"url": "https://github.com/Yueosa/lianwall", "desc": "Wallpaper daemon"},
    "tosu": {"url": "https://github.com/tosuapp/tosu", "desc": "osu! memory reader"},
}

# Packages needing Rust/Cargo builds
CARGO_PACKAGES = {
    "cosmic-randr-git": {"github": "pop-os/cosmic-randr", "desc": "Wayland output configuration utility"},
    "wl-screenrec": {"github": "russelltg/wl-screenrec", "desc": "Hardware-accelerated wlroots screen recorder"},
    "radicle-node": {"github": "radicle-xyz/heartwood", "desc": "Peer-to-peer code collaboration"},
    "cosmic-comp-git": {"github": "pop-os/cosmic-comp", "desc": "COSMIC desktop compositor"},
}

# Complex packages that need special handling
COMPLEX_PACKAGES = {
    "openvino": "Very complex ML toolkit with many build deps",
    "xlibre-xserver-common-git": "X server fork - complex build",
    "mozc-ut-full-common": "Japanese IME - requires Bazel",
    "mozc": "Japanese IME - requires Bazel/complex build system",
    "llvm-libs-minimal-git": "LLVM libs - very complex build",
    "vscodium-translucent": "Complex Electron app build",
    "sonic-win": "KWin fork - very complex KDE dependencies",
    "linux-lqx": "Custom kernel - Guix has its own kernel approach",
    "wayfire": "3D Wayland compositor - complex deps (wf-config, wlroots)",
    "hyprtoolkit-git": "Hyprland toolkit - many -git deps not available",
    "openbangla-keyboard-git": "Bengali IME - complex build with ibus/fcitx5",
    "qmc2-common-git": "MAME frontend - complex Qt5 + Java build",
    "qtutilities-qt6": "Qt6 utilities - needs c++utilities",
    "python312": None,  # Already an alias in general-compat.scm
    "bms-shell": "Needs quickshell and custom deps not in Guix",
    "libelectron": "Electron meta-package - depends on npm",
    "gtk-sharp-2": "GTK2 C# bindings - needs Mono",
    "xrizer-common": "OpenVR reimplementation - needs complex Rust + lib32",
    "quirc": "QR library - needs sdl12-compat",
    "asf": "Steam cards farmer - needs .NET/ASP.NET runtime",
}

# Firmware/data packages (trivial-build-system or copy)
FIRMWARE_DATA = {
    "xone-dongle-firmware": {"desc": "Xbox Wireless Controller Adapter firmware"},
    "ghostty-shell-integration-nightly-bin": {"desc": "Shell integration scripts for Ghostty"},
    "ghostty-terminfo-nightly-bin": {"desc": "Terminfo for Ghostty"},
    "keychron-link-udev": {"desc": "udev rule for Keychron Link receiver"},
    "libfmod": {"desc": "FMOD audio engine libraries"},
    "upd72020x-fw": {"desc": "Renesas USB 3.0 chipsets firmware"},
    "clash-geoip": {"desc": "GeoIP files for Clash"},
    "cosmic-icons-git": {"desc": "System76 COSMIC icon theme"},
    "kaitai-struct-compiler": {"desc": "Kaitai Struct compiler (Java-based)"},
    "xapp-thumbnailers-common": {"desc": "Common files for XApp thumbnailers"},
    "sqlite-utils": {"desc": "CLI tool for manipulating SQLite databases"},
    "auto-auto-complete": {"desc": "Autogenerate shell auto-completion scripts"},
}


def main():
    with open(TREE_JSON) as f:
        tree = json.load(f)

    top100 = [p['name'] for p in tree['queue'][:100]]

    # Categorize
    compat = []
    arch_only = []
    source = []
    python = []
    binary = []
    cargo = []
    firmware = []
    complex_list = []
    uncategorized = []

    for name in top100:
        if name in GUIX_COMPAT_MAP:
            compat.append(name)
        elif name in ARCH_SPECIFIC:
            arch_only.append(name)
        elif name in SOURCE_BUILD:
            source.append(name)
        elif name in PYTHON_PACKAGES:
            python.append(name)
        elif name in BINARY_PACKAGES:
            binary.append(name)
        elif name in CARGO_PACKAGES:
            cargo.append(name)
        elif name in FIRMWARE_DATA:
            firmware.append(name)
        elif name in COMPLEX_PACKAGES:
            complex_list.append(name)
        else:
            uncategorized.append(name)

    print(f"=== CATEGORIZATION OF TOP 100 ===")
    print(f"Compat aliases: {len(compat)} - {compat}")
    print(f"Arch-specific (skip): {len(arch_only)} - {arch_only}")
    print(f"Source builds: {len(source)} - {source}")
    print(f"Python packages: {len(python)} - {python}")
    print(f"Binary packages: {len(binary)} - {binary}")
    print(f"Cargo/Rust: {len(cargo)} - {cargo}")
    print(f"Firmware/Data: {len(firmware)} - {firmware}")
    print(f"Complex (needs work): {len(complex_list)} - {complex_list}")
    print(f"Uncategorized: {len(uncategorized)} - {uncategorized}")
    print(f"\nTotal: {len(compat) + len(arch_only) + len(source) + len(python) + len(binary) + len(cargo) + len(firmware) + len(complex_list) + len(uncategorized)}")


if __name__ == '__main__':
    main()
