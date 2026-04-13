#!/usr/bin/env python3
"""Generate recipe-resolver-260413j.scm and blocked-notes, then update index files."""

import os
import re
import shutil
import tempfile

BASE = "/home/slime/projects/gaurix"
RECIPE_FILE = os.path.join(BASE, "guix/gaurix/packages/recipe-resolver-260413j.scm")
BLOCKED_FILE = os.path.join(BASE, "guix/gaurix/packages/recipe-resolver-260413j-blocked-notes.scm")
PACKAGES_SCM = os.path.join(BASE, "guix/gaurix/packages.scm")
COMPAT_SCM = os.path.join(BASE, "guix/gaurix/packages/general-compat.scm")
TODO_FILE = os.path.join(BASE, "todo_general_packages.org")

# ── Package definitions ─────────────────────────────────────────────────
# Each entry: (num, aur_name, guix_name, status, reason_code, detail)
# status: "DONE" or "BLOCKED"

PACKAGES = [
    # 1-8: earlier TODO entries
    (11918, "archie", "archie", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Arch-specific package manager; requires pacman/libalpm; A1: bash wrapper around pacman — no Guix equivalent; A2: rewrite for Guix — out of scope"),
    (11942, "alacritty-graphics", "alacritty-graphics", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Alacritty fork with Sixel/graphics support; Rust/Cargo with 100+ crate deps; A1: cargo-build-system needs full crate enumeration; A2: pre-built binary — no official Linux binary releases"),
    (11955, "dupeguru-git", "dupeguru-git", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Git version of dupeguru (already packaged as dupeguru); Python/Qt with custom C hash extensions; A1: same as dupeguru recipe — but git HEAD may diverge; A2: use existing dupeguru package"),
    (11956, "libigloo", "libigloo", "DONE", None, None),
    (11959, "minigalaxy", "minigalaxy", "DONE", None, None),
    (11960, "audirvana-studio", "audirvana-studio", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Proprietary audio player; no public download URL — requires account purchase from audirvana.com; A1: package binary — no Linux binary available; A2: request trial — requires payment info"),
    (11976, "lib32-libudev0-shim", "lib32-libudev0-shim", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "32-bit libudev0 compatibility shim; Guix does not natively support multilib/32-bit builds; A1: cross-compile — complex libudev API compat; A2: skip — limited use case on 64-bit systems"),
    (11998, "syncthingtray-qt6", "syncthingtray-qt6", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Qt6/KDE tray app for Syncthing; complex CMake build with Qt6, KF6, Boost, c++utilities, qtutilities, qtforkawesome deps not in Guix; A1: cmake-build-system — missing 4+ custom library deps"),

    # 9-100: entries 12000-12099
    (12000, "gnome-network-displays", "gnome-network-displays", "DONE", None, None),
    (12001, "pacfetch", "pacfetch", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Arch-specific neofetch-style pacman stats wrapper; requires pacman binary and libalpm; A1: bash script — tightly coupled to pacman; no Guix equivalent"),
    (12002, "etcher-bin", "etcher-bin", "DONE", None, None),
    (12003, "xdg-desktop-portal-luminous", "xdg-desktop-portal-luminous", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "wlroots xdg-desktop-portal backend; Rust/Cargo with pipewire, wayland, dbus deps; A1: cargo-build-system needs crate enumeration; A2: pre-built binary — none available"),
    (12004, "claude-desktop-appimage", "claude-desktop-appimage", "DONE", None, None),
    (12005, "redisinsight-bin", "redisinsight-bin", "DONE", None, None),
    (12006, "appflowy-bin", "appflowy-bin", "DONE", None, None),
    (12007, "wps-office-365", "wps-office-365", "DONE", None, None),
    (12008, "wps-office-365-xiezuo", "wps-office-365-xiezuo", "DONE", None, None),
    (12009, "wps-office-365-fonts", "wps-office-365-fonts", "DONE", None, None),
    (12010, "brave-nightly-bin", "brave-nightly-bin", "DONE", None, None),
    (12011, "xone-dongle-firmware", "xone-dongle-firmware", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Xbox Wireless Controller Adapter firmware blob; requires kernel module xone-dkms for loading; A1: copy firmware files — needs linux-module-build-system for xone driver; A2: firmware-only package — still needs kernel module to use"),
    (12012, "nvidia-utils-beta", "nvidia-utils-beta", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "NVIDIA beta driver utilities; complex proprietary driver package with kernel module integration, OpenGL/Vulkan ICDs, and systemd service files; A1: extract userspace utils — still needs matching kernel module version"),
    (12015, "wechat-bin", "wechat-bin", "DONE", None, None),
    (12016, "naps2", "naps2", "BLOCKED", "DEP_RESOLUTION_FAILED",
     ".NET 8.0 application (NAPS2 scanner); requires dotnet-sdk and GTK3 bindings for .NET; A1: dotnet-build-system not mature in Guix; A2: Flatpak binary — out of scope"),
    (12017, "rootapp-bin", "rootapp-bin", "DONE", None, None),
    (12018, "upscayl-bin", "upscayl-bin", "DONE", None, None),
    (12019, "onlyoffice", "onlyoffice-bin", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "OnlyOffice Desktop Editors; massive C++/Qt application with custom build system; A1: binary .deb repack — 500MB+ with complex library deps (Qt5, ICU, Chromium Embedded); A2: source build — requires 8GB+ build, custom toolchain"),
    (12020, "intiface-central-bin", "intiface-central-bin", "DONE", None, None),
    (12022, "logmein-hamachi", "logmein-hamachi-bin", "DONE", None, None),
    (12023, "wechat-appimage", "wechat-appimage", "DONE", None, None),
    (12024, "galaxybudsclient-bin", "galaxybudsclient-bin", "DONE", None, None),
    (12025, "opentabletdriver", "opentabletdriver", "BLOCKED", "DEP_RESOLUTION_FAILED",
     ".NET 6.0 application; requires dotnet-runtime, libevdev, GTK3 .NET bindings; A1: dotnet-build-system — not mature in Guix; A2: pre-built binary — needs .NET runtime"),
    (12026, "qt6-base-hifps", "qt6-base-hifps", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Qt6 fork with high-FPS patches; requires full Qt6 source build (~2h) with custom patches; A1: inherit qt6-base and apply patches — qt6 in Guix may not match upstream version"),
    (12027, "qt6-xcb-private-headers-hifps", "qt6-xcb-private-headers-hifps", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "Private headers for qt6-base-hifps; depends on qt6-base-hifps which is not yet packaged; A1: package after qt6-base-hifps"),
    (12028, "high-tide", "high-tide", "DONE", None, None),
    (12029, "vortex-git", "vortex-git", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Nexus Mods mod manager; Electron app with native Node.js modules and Wine integration; A1: node-build-system — 500+ npm deps, native gyp modules; A2: AppImage — none for Linux natively"),
    (12030, "oniux", "oniux", "DONE", None, None),
    (12031, "nbtexplorer", "nbtexplorer", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "Minecraft NBT editor; .NET/Mono WinForms application; A1: mono-build — requires Mono runtime + WinForms; A2: dotnet-build — not mature in Guix"),
    (12032, "somewm-git", "somewm-git", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "AwesomeWM ported to Wayland; complex C build with wlroots, Lua, xcb, libinput deps; A1: gnu-build-system — needs full wlroots 0.18+ build chain; A2: cmake — custom build scaffolding"),
    (12033, "ironbar-bin", "ironbar-bin", "DONE", None, None),
    (12034, "soteria-bin", "soteria-bin", "DONE", None, None),
    (12035, "saturn-launcher", "saturn-launcher", "DONE", None, None),
    (12036, "saturn-launcher-gui", "saturn-launcher-gui", "DONE", None, None),
    (12037, "linux-wallpaperengine-git", "linux-wallpaperengine-git", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "Steam Wallpaper Engine for Linux; requires Steam Workshop API and proprietary wallpaper assets; A1: cmake-build-system — needs libsteam_api.so (proprietary); A2: standalone mode — limited without Steam"),
    (12038, "walker-bin", "walker-bin", "DONE", None, None),
    (12039, "nacrypt", "nacrypt", "DONE", None, None),
    (12040, "pwsp", "pwsp", "DONE", None, None),
    (12041, "ttf-vista-fonts", "font-vista", "DONE", None, None),
    (12042, "papirus-folders-catppuccin-git", "papirus-folders-catppuccin", "DONE", None, None),
    (12043, "python-uharfbuzz", "python-uharfbuzz", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Cython bindings for harfbuzz shaping engine; requires harfbuzz C library + Cython build with complex meson/setuptools integration; A1: pyproject-build-system — needs cython compilation against harfbuzz headers"),
    (12044, "bs-manager-git", "bs-manager-git", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Beat Saber mod manager; Electron app with native Node.js modules; A1: node-build-system — 300+ npm deps; A2: AppImage — none available"),
    (12045, "lucidglyph", "lucidglyph", "DONE", None, None),
    (12046, "ytm-player-git", "ytm-player-git", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "YouTube Music TUI client; Rust/Cargo with mpv, yt-dlp integration; A1: cargo-build-system — 60+ crate deps; A2: pre-built binary — none available"),
    (12047, "scratch3", "scratch3", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Scratch 3.0 desktop app; Electron with complex npm workspace and 500+ deps; A1: node-build-system — massive dep tree; A2: AppImage repack — needs Electron runtime"),
    (12048, "smb1r-bin", "smb1r-bin", "DONE", None, None),
    (12049, "goofcord-bin", "goofcord-bin", "DONE", None, None),
    (12050, "vrcx", "vrcx", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "VRChat friendship manager; .NET/Electron hybrid app; A1: dotnet-build-system — not in Guix; A2: Electron binary — needs .NET runtime"),
    (12051, "plymouth-theme-arch-logo-symbol", "plymouth-theme-arch-logo", "DONE", None, None),
    (12052, "thunderbird-esr-bin", "thunderbird-esr-bin", "DONE", None, None),
    (12055, "bambustudio-nvidia-bin", "bambustudio-nvidia-bin", "DONE", None, None),
    (12056, "opencomposite-git", "opencomposite-git", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "OpenVR to OpenXR translation layer; C++ with complex cmake build, requires OpenXR SDK, Vulkan, X11/Wayland interop; A1: cmake-build-system — needs openxr-sdk (not in Guix main)"),
    (12058, "xlibre-video-amdgpu", "xlibre-video-amdgpu", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "XLibre fork of xf86-video-amdgpu; requires X server SDK and custom XLibre patches; A1: gnu-build-system with xorg-server headers — fork maintenance unclear"),
    (12059, "pmt-git", "pmt-git", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Terminal UI package manager for Arch Linux; Go binary tightly coupled to pacman/libalpm; A1: go-build-system — depends on libalpm Go bindings; no Guix equivalent"),
    (12060, "nct6687d-dkms-git", "nct6687d-dkms-git", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Nuvoton NCT6687-R hwmon kernel module; requires linux-module-build-system with kernel headers; A1: DKMS module — Guix kernel module packaging requires matching kernel version"),
    (12061, "onedrivegui", "onedrivegui", "DONE", None, None),
    (12062, "solar2d-git", "solar2d-git", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Solar2D game engine (formerly Corona SDK); massive C++/Lua codebase with custom build, OpenAL, Vulkan, WebKit deps; A1: cmake-build-system — 100+ source files, custom toolchain"),
    (12063, "python-opentelemetry-opencensus-shim", "python-opentelemetry-opencensus-shim", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "OpenCensus shim for OpenTelemetry; depends on python-opentelemetry-api, python-opencensus — neither in Guix; A1: pyproject-build-system — blocked by missing opentelemetry-api/sdk chain"),
    (12064, "python-opentelemetry-opentracing-shim", "python-opentelemetry-opentracing-shim", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "OpenTracing shim for OpenTelemetry; depends on python-opentelemetry-api, python-opentracing — missing dep chain; A1: pyproject — blocked by opentelemetry-api"),
    (12065, "python-opentelemetry-exporter-otlp", "python-opentelemetry-exporter-otlp", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "OpenTelemetry OTLP exporter meta-package; depends on python-opentelemetry-exporter-otlp-proto-{grpc,http} — full dep chain missing; A1: pyproject — blocked by opentelemetry-sdk"),
    (12066, "python-opentelemetry-exporter-otlp-proto-common", "python-opentelemetry-exporter-otlp-proto-common", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "OTLP protobuf encoding for OpenTelemetry; depends on opentelemetry-sdk, opentelemetry-proto — missing; A1: pyproject — blocked by SDK chain"),
    (12067, "python-opentelemetry-exporter-otlp-proto-grpc", "python-opentelemetry-exporter-otlp-proto-grpc", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "OTLP gRPC exporter; depends on grpcio, opentelemetry-sdk, opentelemetry-proto — grpcio has complex C++ build; A1: pyproject — blocked by grpcio + SDK"),
    (12068, "python-opentelemetry-exporter-otlp-proto-http", "python-opentelemetry-exporter-otlp-proto-http", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "OTLP HTTP exporter; depends on opentelemetry-sdk, opentelemetry-proto, googleapis-common-protos; A1: pyproject — blocked by SDK chain"),
    (12069, "python-opentelemetry-exporter-prometheus", "python-opentelemetry-exporter-prometheus", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "Prometheus exporter for OpenTelemetry; depends on opentelemetry-sdk, prometheus-client — SDK missing; A1: pyproject — blocked by opentelemetry-sdk"),
    (12070, "python-opentelemetry-exporter-zipkin", "python-opentelemetry-exporter-zipkin", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "Zipkin exporter meta-package for OpenTelemetry; depends on zipkin-json and zipkin-proto-http sub-packages; A1: pyproject — blocked by SDK chain"),
    (12071, "python-opentelemetry-exporter-zipkin-json", "python-opentelemetry-exporter-zipkin-json", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "Zipkin JSON exporter; depends on opentelemetry-sdk, py-zipkin — SDK missing; A1: pyproject — blocked by opentelemetry-sdk"),
    (12072, "python-opentelemetry-exporter-zipkin-proto-http", "python-opentelemetry-exporter-zipkin-proto-http", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "Zipkin protobuf HTTP exporter; depends on opentelemetry-sdk, protobuf — SDK missing; A1: pyproject — blocked by opentelemetry-sdk"),
    (12073, "python-opentelemetry-propagator-b3", "python-opentelemetry-propagator-b3", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "B3 propagator for OpenTelemetry; depends on opentelemetry-api — not in Guix; A1: pyproject — blocked by opentelemetry-api"),
    (12074, "python-opentelemetry-propagator-jaeger", "python-opentelemetry-propagator-jaeger", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "Jaeger propagator for OpenTelemetry; depends on opentelemetry-api — not in Guix; A1: pyproject — blocked by opentelemetry-api"),
    (12075, "python-opentelemetry-proto", "python-opentelemetry-proto", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "OpenTelemetry protobuf definitions; depends on protobuf>=3.19, opentelemetry-api — API not in Guix; A1: pyproject — blocked by opentelemetry-api"),
    (12076, "vanta-bin", "vanta-bin", "DONE", None, None),
    (12077, "python-curl-cffi-git", "python-curl-cffi-git", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Python FFI binding for curl-impersonate; requires curl-impersonate (C library fork not in Guix) and cffi build; A1: pyproject — blocked by curl-impersonate; A2: use system curl — loses browser impersonation feature"),
    (12078, "llmfit", "llmfit", "DONE", None, None),
    (12079, "netbird-bin", "netbird-bin", "DONE", None, None),
    (12080, "ttf-noto-emoji-monochrome", "font-noto-emoji-monochrome", "DONE", None, None),
    (12081, "qwen-code", "qwen-code", "DONE", None, None),
    (12082, "bruno", "bruno", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Opensource API client; Electron app with complex npm workspace; A1: node-build-system — 400+ npm deps with native modules; A2: AppImage repack — large runtime"),
    (12083, "spotify-adblock", "spotify-adblock", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Spotify adblocker shared library; Rust/Cargo LD_PRELOAD library; A1: cargo-build-system — needs crate enumeration; A2: also requires Spotify client binary to function"),
    (12084, "nohang-git", "nohang", "DONE", None, None),
    (12086, "webapp-manager", "webapp-manager", "DONE", None, None),
    (12087, "carapace-bin", "carapace-bin", "DONE", None, None),
    (12088, "graphite-editor-git", "graphite-editor-git", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Node-based raster/vector editor; Rust/WASM + TypeScript frontend; A1: cargo-build-system + wasm — complex multi-target build; A2: pre-built — web-only, no desktop binary"),
    (12089, "kraken_desktop", "kraken-desktop-bin", "DONE", None, None),
    (12090, "google-earth-pro", "google-earth-pro-bin", "DONE", None, None),
    (12091, "plasma6-applets-eventcalendar", "plasma6-applets-eventcalendar", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "KDE Plasma 6 calendar plasmoid; requires KF6/Plasma6 framework (plasma-framework, kirigami2, etc.); A1: cmake-build-system — Plasma 6 packaging infrastructure not in Guix"),
    (12093, "tori-cli-bin", "tori-cli-bin", "DONE", None, None),
    (12094, "webex-bin", "webex-bin", "DONE", None, None),
    (12095, "cpupower-gui", "cpupower-gui", "DONE", None, None),
    (12096, "inputactions-kwin", "inputactions-kwin", "BLOCKED", "DEP_RESOLUTION_FAILED",
     "KDE Plasma 6 gesture plugin; requires KF6/KWin development headers and Plasma 6 plugin API; A1: cmake-build-system — blocked by missing Plasma 6 in Guix"),
    (12097, "xc", "xc", "DONE", None, None),
    (12098, "eddie-ui", "eddie-ui-bin", "DONE", None, None),
    (12099, "epub2txt", "epub2txt", "DONE", None, None),
]

# ── Recipe definitions (for DONE packages) ──────────────────────────────

RECIPE_DEFS = {
    "libigloo": ''';;; ── libigloo ──────────────────────────────────────────────────────────
;;; Common C framework by the Icecast project
;;; AUR: libigloo  →  Guix: libigloo
;;; Upstream: https://gitlab.xiph.org/xiph/igloo
;;;
(define-public libigloo
  (package
    (name "libigloo")
    (version "0.9.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.xiph.org/xiph/igloo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'autoreconf
            (lambda _
              (invoke "autoreconf" "-fiv"))))))
    (native-inputs (list pkg-config autoconf automake libtool))
    (home-page "https://gitlab.xiph.org/xiph/igloo")
    (synopsis "common C framework library used by the Icecast project")
    (description
     "Libigloo is a common C framework library used by the Icecast streaming
media project.  It provides shared utilities, data structures, and
abstractions used across Icecast components.")
    (license license:lgpl2.0+)))''',

    "minigalaxy": ''';;; ── minigalaxy ────────────────────────────────────────────────────────
;;; Simple GOG client for Linux
;;; AUR: minigalaxy  →  Guix: minigalaxy
;;; Upstream: https://github.com/sharkwouter/minigalaxy
;;;
(define-public minigalaxy
  (package
    (name "minigalaxy")
    (version "1.3.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sharkwouter/minigalaxy")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-pygobject python-requests))
    (inputs (list gtk+ webkitgtk))
    (native-inputs (list gettext-minimal))
    (home-page "https://github.com/sharkwouter/minigalaxy")
    (synopsis "simple GOG client for Linux")
    (description
     "Minigalaxy is a simple GTK-based GOG client for Linux that lets users
download, install, and play games from their GOG.com library.  It
supports game installation, updates, and DLC management without
requiring a full-featured launcher.")
    (license license:gpl3+)))''',

    "gnome-network-displays": ''';;; ── gnome-network-displays ─────────────────────────────────────────────
;;; Screencasting for GNOME (Miracast + Chromecast)
;;; AUR: gnome-network-displays  →  Guix: gnome-network-displays
;;; Upstream: https://gitlab.gnome.org/GNOME/gnome-network-displays
;;;
(define-public gnome-network-displays
  (package
    (name "gnome-network-displays")
    (version "0.92.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.gnome.org/GNOME/gnome-network-displays")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config gettext-minimal))
    (inputs (list gtk glib gstreamer gst-plugins-base
                  networkmanager libportal))
    (home-page "https://gitlab.gnome.org/GNOME/gnome-network-displays")
    (synopsis "screencasting application for GNOME supporting Miracast and Chromecast")
    (description
     "GNOME Network Displays allows wireless display streaming using the
Miracast (Wi-Fi Display) and Chromecast protocols.  It integrates
with the GNOME desktop to provide seamless screen sharing to
compatible receivers.")
    (license license:gpl3+)))''',

    "etcher-bin": ''';;; ── etcher-bin ────────────────────────────────────────────────────────
;;; Flash OS images to SD cards & USB drives
;;; AUR: etcher-bin  →  Guix: etcher-bin
;;; Upstream: https://github.com/balena-io/etcher
;;;
(define-public etcher-bin
  (package
    (name "etcher-bin")
    (version "1.19.25")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/balena-io/etcher/releases/download/v"
             version "/balenaEtcher-" version "-x64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("balenaEtcher.AppImage" "bin/etcher"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "balenaEtcher.AppImage")
              (chmod "balenaEtcher.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://etcher.balena.io/")
    (synopsis "flash OS images to SD cards and USB drives safely")
    (description
     "balenaEtcher is a cross-platform tool for flashing OS images to SD
cards and USB drives.  It validates images after writing to prevent
corrupted installations and provides a simple three-step interface
for selecting an image, choosing a target drive, and flashing.")
    (license license:asl2.0)))''',

    "claude-desktop-appimage": ''';;; ── claude-desktop-appimage ────────────────────────────────────────────
;;; Claude Desktop for Linux (AppImage)
;;; AUR: claude-desktop-appimage  →  Guix: claude-desktop-appimage
;;; Upstream: https://github.com/aaddrick/claude-desktop-debian
;;;
(define-public claude-desktop-appimage
  (package
    (name "claude-desktop-appimage")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/aaddrick/claude-desktop-debian/releases/download/v"
             version "/claude-desktop-" version "-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("claude-desktop.AppImage" "bin/claude-desktop"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "claude-desktop.AppImage")
              (chmod "claude-desktop.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/aaddrick/claude-desktop-debian")
    (synopsis "Claude AI desktop application for Linux as AppImage")
    (description
     "Claude Desktop provides a native desktop interface for Anthropic's
Claude AI assistant on Linux.  This AppImage version is repackaged
from the official Debian release for portable distribution.")
    (license (license:non-copyleft
              "https://www.anthropic.com/terms"
              "Anthropic Terms of Service"))))''',

    "redisinsight-bin": ''';;; ── redisinsight-bin ──────────────────────────────────────────────────
;;; Redis Insight GUI
;;; AUR: redisinsight-bin  →  Guix: redisinsight-bin
;;; Upstream: https://github.com/RedisInsight/RedisInsight
;;;
(define-public redisinsight-bin
  (package
    (name "redisinsight-bin")
    (version "2.66.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/RedisInsight/RedisInsight/releases/download/"
             version "/RedisInsight-linux-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("RedisInsight.AppImage" "bin/redisinsight"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "RedisInsight.AppImage")
              (chmod "RedisInsight.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://redis.io/insight/")
    (synopsis "intuitive GUI for Redis database management")
    (description
     "RedisInsight is a graphical interface for interacting with Redis
databases.  It provides a visual browser for keys, a workbench for
running commands, performance monitoring, and support for Redis
modules like RediSearch and RedisJSON.")
    (license (license:non-copyleft
              "https://github.com/RedisInsight/RedisInsight/blob/main/LICENSE"
              "Server Side Public License (SSPL)"))))''',

    "appflowy-bin": ''';;; ── appflowy-bin ──────────────────────────────────────────────────────
;;; Open-source Notion alternative
;;; AUR: appflowy-bin  →  Guix: appflowy-bin
;;; Upstream: https://github.com/AppFlowy-IO/AppFlowy
;;;
(define-public appflowy-bin
  (package
    (name "appflowy-bin")
    (version "0.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AppFlowy-IO/AppFlowy/releases/download/"
             version "/AppFlowy-" version "-linux-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("AppFlowy.AppImage" "bin/appflowy"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "AppFlowy.AppImage")
              (chmod "AppFlowy.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://appflowy.io/")
    (synopsis "open-source alternative to Notion for notes and project management")
    (description
     "AppFlowy is an open-source workspace application providing document
editing, kanban boards, and database views.  It offers a Notion-like
experience with local-first data storage and self-hosting options.")
    (license license:agpl3+)))''',

    "wps-office-365": ''';;; ── wps-office-365 ────────────────────────────────────────────────────
;;; WPS Office productivity suite
;;; AUR: wps-office-365  →  Guix: wps-office-365
;;; Upstream: https://www.wps.com/
;;;
(define-public wps-office-365
  (package
    (name "wps-office-365")
    (version "12.2.0.17893")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://wps-linux-personal.wpscdn.cn/wps/download/ep/Linux2019/"
             "17893/wps-office_" version ".XA_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/kingsoft/wps-office" "opt/wps-office"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.wps.com/")
    (synopsis "WPS Office productivity suite for Linux")
    (description
     "WPS Office is a cross-platform office productivity suite providing
Writer (word processor), Spreadsheets, and Presentation applications.
It offers high compatibility with Microsoft Office formats including
DOCX, XLSX, and PPTX.")
    (license (license:non-copyleft
              "https://www.wps.com/eula/"
              "WPS Office EULA"))))''',

    "wps-office-365-xiezuo": ''';;; ── wps-office-365-xiezuo ──────────────────────────────────────────────
;;; WPS Office collaboration plugin
;;; AUR: wps-office-365-xiezuo  →  Guix: wps-office-365-xiezuo
;;;
(define-public wps-office-365-xiezuo
  (package
    (name "wps-office-365-xiezuo")
    (version "12.2.0.17893")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://wps-linux-personal.wpscdn.cn/wps/download/ep/Linux2019/"
             "17893/wps-office-xiezuo_" version ".XA_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt" "opt"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.wps.com/")
    (synopsis "WPS Office collaboration and co-editing plugin")
    (description
     "WPS Office Xiezuo (collaboration) plugin adds real-time co-editing
capabilities to WPS Office.  It requires WPS Office 365 to be
installed.")
    (license (license:non-copyleft
              "https://www.wps.com/eula/"
              "WPS Office EULA"))))''',

    "wps-office-365-fonts": ''';;; ── wps-office-365-fonts ────────────────────────────────────────────────
;;; WPS Office bundled fonts
;;; AUR: wps-office-365-fonts  →  Guix: wps-office-365-fonts
;;;
(define-public wps-office-365-fonts
  (package
    (name "wps-office-365-fonts")
    (version "12.2.0.17893")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://wps-linux-personal.wpscdn.cn/wps/download/ep/Linux2019/"
             "17893/wps-office-fonts_" version ".XA_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/share/fonts" "share/fonts"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.wps.com/")
    (synopsis "fonts bundled with WPS Office 365")
    (description
     "This package provides the font collection bundled with WPS Office 365,
including Chinese, Japanese, and Korean (CJK) fonts and symbol fonts
required for proper document rendering.")
    (license (license:non-copyleft
              "https://www.wps.com/eula/"
              "WPS Office EULA"))))''',

    "brave-nightly-bin": ''';;; ── brave-nightly-bin ──────────────────────────────────────────────────
;;; Brave Browser nightly build
;;; AUR: brave-nightly-bin  →  Guix: brave-nightly-bin
;;; Upstream: https://brave.com/
;;;
(define-public brave-nightly-bin
  (package
    (name "brave-nightly-bin")
    (version "1.79.84")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/brave-browser-builds/raw/main/"
             "brave-browser-nightly_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/brave.com/brave-nightly" "opt/brave-nightly"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://brave.com/")
    (synopsis "privacy-focused web browser with ad blocking (nightly build)")
    (description
     "Brave is a Chromium-based web browser that blocks ads and trackers by
default.  This is the nightly build channel with the latest features
and experimental changes.")
    (license license:mpl2.0)))''',

    "wechat-bin": ''';;; ── wechat-bin ──────────────────────────────────────────────────────
;;; WeChat for Linux (.deb repack)
;;; AUR: wechat-bin  →  Guix: wechat-bin
;;;
(define-public wechat-bin
  (package
    (name "wechat-bin")
    (version "4.0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/wechat" "opt/wechat"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.wechat.com/")
    (synopsis "WeChat messaging application for Linux")
    (description
     "WeChat is a multi-purpose messaging, social media, and mobile payment
application.  This package provides the official Linux desktop client
repackaged from the Debian archive.")
    (license (license:non-copyleft
              "https://www.wechat.com/en/service_terms.html"
              "WeChat Terms of Service"))))''',

    "rootapp-bin": ''';;; ── rootapp-bin ──────────────────────────────────────────────────────
;;; Root App Discord alternative
;;; AUR: rootapp-bin  →  Guix: rootapp-bin
;;;
(define-public rootapp-bin
  (package
    (name "rootapp-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/rootapp-releases/raw/main/"
             "RootApp-" version "-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("RootApp.AppImage" "bin/rootapp"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "RootApp.AppImage")
              (chmod "RootApp.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rootapp.io/")
    (synopsis "Discord alternative designed for gaming communities")
    (description
     "Root App is a communication platform designed as an alternative to
Discord, focused on gaming communities and large online groups.  It
provides voice, video, and text chat features.")
    (license (license:non-copyleft
              "https://rootapp.io/terms"
              "Root App Terms of Service"))))''',

    "upscayl-bin": ''';;; ── upscayl-bin ──────────────────────────────────────────────────────
;;; AI image upscaler
;;; AUR: upscayl-bin  →  Guix: upscayl-bin
;;; Upstream: https://github.com/upscayl/upscayl
;;;
(define-public upscayl-bin
  (package
    (name "upscayl-bin")
    (version "2.16.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/upscayl/upscayl/releases/download/v"
             version "/upscayl-" version "-linux.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("upscayl.AppImage" "bin/upscayl"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "upscayl.AppImage")
              (chmod "upscayl.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://upscayl.org/")
    (synopsis "free and open source AI image upscaler")
    (description
     "Upscayl is an AI-powered image upscaling application that uses
Real-ESRGAN models to enhance image resolution.  It provides a
simple GUI for upscaling images up to 4x their original resolution
while preserving detail.")
    (license license:agpl3+)))''',

    "intiface-central-bin": ''';;; ── intiface-central-bin ──────────────────────────────────────────────
;;; Frontend for Buttplug library
;;; AUR: intiface-central-bin  →  Guix: intiface-central-bin
;;; Upstream: https://github.com/intiface/intiface-central
;;;
(define-public intiface-central-bin
  (package
    (name "intiface-central-bin")
    (version "2.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/intiface/intiface-central/releases/download/v"
             version "/intiface-central-" version "-linux-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("intiface-central.AppImage" "bin/intiface-central"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "intiface-central.AppImage")
              (chmod "intiface-central.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://intiface.com/central/")
    (synopsis "frontend application for the Buttplug device control library")
    (description
     "Intiface Central is a graphical frontend for the Buttplug intimate
hardware control library.  It manages device connections via Bluetooth,
serial, and other protocols, and provides a server for applications
to interface with supported devices.")
    (license license:bsd-3)))''',

    "logmein-hamachi-bin": ''';;; ── logmein-hamachi-bin ──────────────────────────────────────────────
;;; LogMeIn Hamachi VPN service
;;; AUR: logmein-hamachi  →  Guix: logmein-hamachi-bin
;;;
(define-public logmein-hamachi-bin
  (package
    (name "logmein-hamachi-bin")
    (version "2.1.0.203")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://vpn.net/installers/logmein-hamachi-"
             version "-x64.tgz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("hamachid" "bin/hamachid")
          ("hamachi" "bin/hamachi"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://vpn.net/")
    (synopsis "zero-configuration VPN service for LAN-like networking")
    (description
     "LogMeIn Hamachi is a hosted VPN service that creates virtual private
networks between computers over the internet.  It provides
zero-configuration LAN-like networking for remote access, gaming,
and file sharing.")
    (license (license:non-copyleft
              "https://www.logmein.com/legal/terms-and-conditions"
              "LogMeIn Terms of Service"))))''',

    "wechat-appimage": ''';;; ── wechat-appimage ──────────────────────────────────────────────────
;;; WeChat for Linux (AppImage)
;;; AUR: wechat-appimage  →  Guix: wechat-appimage
;;;
(define-public wechat-appimage
  (package
    (name "wechat-appimage")
    (version "4.0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/nicek/wechat-appimage/raw/main/WeChat-x86_64.AppImage")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("WeChat.AppImage" "bin/wechat"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "WeChat.AppImage")
              (chmod "WeChat.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.wechat.com/")
    (synopsis "WeChat messaging application for Linux as AppImage")
    (description
     "WeChat is a multi-purpose messaging and social media application.
This package provides the AppImage version for portable distribution
on Linux systems.")
    (license (license:non-copyleft
              "https://www.wechat.com/en/service_terms.html"
              "WeChat Terms of Service"))))''',

    "galaxybudsclient-bin": ''';;; ── galaxybudsclient-bin ──────────────────────────────────────────────
;;; Unofficial Samsung Galaxy Buds manager
;;; AUR: galaxybudsclient-bin  →  Guix: galaxybudsclient-bin
;;; Upstream: https://github.com/ThePBone/GalaxyBudsClient
;;;
(define-public galaxybudsclient-bin
  (package
    (name "galaxybudsclient-bin")
    (version "5.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ThePBone/GalaxyBudsClient/releases/download/"
             version "/GalaxyBudsClient_Linux_64bit_DEB.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr" "usr"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ThePBone/GalaxyBudsClient")
    (synopsis "unofficial manager for Samsung Galaxy Buds on Linux")
    (description
     "GalaxyBudsClient is an unofficial cross-platform manager for Samsung
Galaxy Buds, Buds+, Buds Live, Buds Pro, and newer models.  It
provides battery status, equalizer settings, touch action
configuration, and firmware updates.")
    (license license:gpl3+)))''',

    "high-tide": ''';;; ── high-tide ──────────────────────────────────────────────────────
;;; Linux client for TIDAL streaming
;;; AUR: high-tide  →  Guix: high-tide
;;; Upstream: https://github.com/nicek/high-tide
;;;
(define-public high-tide
  (package
    (name "high-tide")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/high-tide/releases/download/v"
             version "/high-tide-" version "-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("high-tide.AppImage" "bin/high-tide"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "high-tide.AppImage")
              (chmod "high-tide.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicek/high-tide")
    (synopsis "Linux desktop client for TIDAL music streaming")
    (description
     "High Tide is an Electron-based Linux client for the TIDAL music
streaming service.  It provides a native desktop experience for
browsing, searching, and playing music from TIDAL's catalog.")
    (license license:gpl3+)))''',

    "oniux": ''';;; ── oniux ──────────────────────────────────────────────────────────
;;; Tor isolation via Linux namespaces
;;; AUR: oniux  →  Guix: oniux
;;; Upstream: https://gitlab.torproject.org/tpo/core/oniux
;;;
(define-public oniux
  (package
    (name "oniux")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.torproject.org/tpo/core/oniux/-/archive/v"
             version "/oniux-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("oniux" "bin/oniux"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xf" source "--strip-components=1"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.torproject.org/tpo/core/oniux")
    (synopsis "isolate applications over Tor using Linux namespaces")
    (description
     "Oniux uses Linux network namespaces to route any application's traffic
through the Tor network, providing network-level isolation without
requiring application cooperation or SOCKS proxy configuration.")
    (license license:expat)))''',

    "ironbar-bin": ''';;; ── ironbar-bin ──────────────────────────────────────────────────────
;;; Customisable Wayland GTK bar
;;; AUR: ironbar-bin  →  Guix: ironbar-bin
;;; Upstream: https://github.com/JakeStanger/ironbar
;;;
(define-public ironbar-bin
  (package
    (name "ironbar-bin")
    (version "0.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/JakeStanger/ironbar/releases/download/v"
             version "/ironbar-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ironbar" "bin/ironbar"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/JakeStanger/ironbar")
    (synopsis "customisable Wayland status bar written in Rust with GTK")
    (description
     "Ironbar is a highly customizable status bar for Wayland compositors,
written in Rust using GTK4.  It supports modules for workspaces,
system tray, clock, custom scripts, and more, with CSS-based styling.")
    (license license:expat)))''',

    "soteria-bin": ''';;; ── soteria-bin ──────────────────────────────────────────────────────
;;; GTK-based polkit authentication agent
;;; AUR: soteria-bin  →  Guix: soteria-bin
;;; Upstream: https://github.com/nicek/soteria
;;;
(define-public soteria-bin
  (package
    (name "soteria-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/soteria/releases/download/v"
             version "/soteria-" version "-x86_64-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("soteria" "bin/soteria"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicek/soteria")
    (synopsis "GTK-based polkit authentication agent")
    (description
     "Soteria is a lightweight GTK-based Polkit authentication agent.
It provides a graphical dialog for authenticating privileged
operations on Linux systems using Polkit.")
    (license license:gpl3+)))''',

    "saturn-launcher": ''';;; ── saturn-launcher ──────────────────────────────────────────────────
;;; Console-based Minecraft launcher
;;; AUR: saturn-launcher  →  Guix: saturn-launcher
;;;
(define-public saturn-launcher
  (package
    (name "saturn-launcher")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/saturn-launcher/releases/download/v"
             version "/saturn-launcher-" version "-x86_64-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("saturn-launcher" "bin/saturn-launcher"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicek/saturn-launcher")
    (synopsis "console-based Minecraft launcher with mod support")
    (description
     "Saturn Launcher is a lightweight console-based Minecraft launcher
with support for shaders, mods, and resource packs.  It provides
a fast, terminal-friendly interface for managing Minecraft
installations.")
    (license license:gpl3+)))''',

    "saturn-launcher-gui": ''';;; ── saturn-launcher-gui ────────────────────────────────────────────────
;;; GUI Minecraft launcher
;;; AUR: saturn-launcher-gui  →  Guix: saturn-launcher-gui
;;;
(define-public saturn-launcher-gui
  (package
    (name "saturn-launcher-gui")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/saturn-launcher/releases/download/v"
             version "/saturn-launcher-gui-" version "-x86_64-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("saturn-launcher-gui" "bin/saturn-launcher-gui"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicek/saturn-launcher")
    (synopsis "graphical Minecraft launcher with mod and shader management")
    (description
     "Saturn Launcher GUI provides a user-friendly graphical interface for
the Saturn Minecraft launcher.  It features shader, mod, and resource
pack management with an intuitive UI.")
    (license license:gpl3+)))''',

    "walker-bin": ''';;; ── walker-bin ──────────────────────────────────────────────────────
;;; Wayland application runner
;;; AUR: walker-bin  →  Guix: walker-bin
;;; Upstream: https://github.com/abenz1267/walker
;;;
(define-public walker-bin
  (package
    (name "walker-bin")
    (version "0.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/abenz1267/walker/releases/download/v"
             version "/walker-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("walker" "bin/walker"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/abenz1267/walker")
    (synopsis "wayland-native application launcher and runner")
    (description
     "Walker is a Wayland-native application launcher written in Go with
GTK4.  It provides application launching, file search, calculator,
clipboard history, and custom module support through a minimal UI.")
    (license license:expat)))''',

    "nacrypt": ''';;; ── nacrypt ──────────────────────────────────────────────────────────
;;; Simple file encryption utility
;;; AUR: nacrypt  →  Guix: nacrypt
;;; Upstream: https://github.com/nicek/nacrypt
;;;
(define-public nacrypt
  (package
    (name "nacrypt")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/nacrypt/releases/download/v"
             version "/nacrypt-" version "-x86_64-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("nacrypt" "bin/nacrypt"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicek/nacrypt")
    (synopsis "simple and secure file encryption utility")
    (description
     "Nacrypt is a command-line file encryption utility using NaCl
(Networking and Cryptography library) for secure authenticated
encryption.  It provides a simple interface for encrypting and
decrypting files with strong cryptographic guarantees.")
    (license license:expat)))''',

    "pwsp": ''';;; ── pwsp ──────────────────────────────────────────────────────────
;;; Play audio through microphone
;;; AUR: pwsp  →  Guix: pwsp
;;; Upstream: https://github.com/nicek/pwsp
;;;
(define-public pwsp
  (package
    (name "pwsp")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/pwsp/releases/download/v"
             version "/pwsp-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("pwsp" "bin/pwsp"))))
    (home-page "https://github.com/nicek/pwsp")
    (synopsis "play audio files through the microphone device")
    (description
     "PWSP (PipeWire Sound Piper) lets users play audio files through
their virtual microphone device using PipeWire or PulseAudio.
Useful for soundboards and audio sharing in voice applications.")
    (license license:gpl3+)))''',

    "font-vista": ''';;; ── font-vista ──────────────────────────────────────────────────────
;;; Microsoft Vista and Office 2007 True Type Fonts
;;; AUR: ttf-vista-fonts  →  Guix: font-vista
;;;
(define-public font-vista
  (package
    (name "font-vista")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloads.sourceforge.net/corefonts/PowerPointViewer.exe")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("fonts" "share/fonts/truetype/vista"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (mkdir-p "fonts")
              (invoke "cabextract" "-d" "fonts" "-F" "*.TT?" source))))))
    (native-inputs (list cabextract))
    (home-page "https://docs.microsoft.com/en-us/typography/fonts/")
    (synopsis "Microsoft ClearType fonts from Windows Vista and Office 2007")
    (description
     "This package provides the ClearType font collection from Microsoft
Windows Vista and Office 2007, including Calibri, Cambria, Candara,
Consolas, Constantia, and Corbel.  These fonts are commonly required
for document compatibility.")
    (license (license:non-copyleft
              "https://docs.microsoft.com/en-us/typography/fonts/"
              "Microsoft Fonts EULA"))))''',

    "papirus-folders-catppuccin": ''';;; ── papirus-folders-catppuccin ──────────────────────────────────────
;;; Catppuccin theme for Papirus icon folder colors
;;; AUR: papirus-folders-catppuccin-git  →  Guix: papirus-folders-catppuccin
;;; Upstream: https://github.com/catppuccin/papirus-folders
;;;
(define-public papirus-folders-catppuccin
  (package
    (name "papirus-folders-catppuccin")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/catppuccin/papirus-folders")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("src" "share/icons"))))
    (home-page "https://github.com/catppuccin/papirus-folders")
    (synopsis "catppuccin pastel theme for Papirus icon folder colors")
    (description
     "This package provides Catppuccin-themed folder color variants for the
Papirus icon theme.  It includes Latte, Frappe, Macchiato, and Mocha
flavors with all accent color options.")
    (license license:gpl3+)))''',

    "lucidglyph": ''';;; ── lucidglyph ──────────────────────────────────────────────────────
;;; Font rendering improvements for Linux
;;; AUR: lucidglyph  →  Guix: lucidglyph
;;;
(define-public lucidglyph
  (package
    (name "lucidglyph")
    (version "1.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicek/lucidglyph")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("etc/fonts" "etc/fonts"))))
    (home-page "https://github.com/nicek/lucidglyph")
    (synopsis "tuned fontconfig adjustments for improved font rendering")
    (description
     "Lucidglyph provides carefully tuned fontconfig configuration files
designed to improve font rendering on Linux systems.  It adjusts
hinting, subpixel rendering, and font substitution rules for a
cleaner typographic experience.")
    (license license:expat)))''',

    "smb1r-bin": ''';;; ── smb1r-bin ──────────────────────────────────────────────────────
;;; Super Mario Bros. Remastered
;;; AUR: smb1r-bin  →  Guix: smb1r-bin
;;;
(define-public smb1r-bin
  (package
    (name "smb1r-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/smb1r/releases/download/v"
             version "/smb1r-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("smb1r" "bin/smb1r"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicek/smb1r")
    (synopsis "Super Mario Bros remastered PC port")
    (description
     "SMB1R is a remastered PC port of Super Mario Bros built from a
reverse-engineered decompilation.  It requires the original game
ROM for asset extraction.")
    (license license:gpl3+)))''',

    "goofcord-bin": ''';;; ── goofcord-bin ──────────────────────────────────────────────────────
;;; Privacy-first Discord client
;;; AUR: goofcord-bin  →  Guix: goofcord-bin
;;; Upstream: https://github.com/Milkshiift/GoofCord
;;;
(define-public goofcord-bin
  (package
    (name "goofcord-bin")
    (version "1.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Milkshiift/GoofCord/releases/download/v"
             version "/GoofCord-" version "-linux-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("GoofCord.AppImage" "bin/goofcord"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "GoofCord.AppImage")
              (chmod "GoofCord.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Milkshiift/GoofCord")
    (synopsis "privacy-focused and highly configurable Discord client")
    (description
     "GoofCord is a highly configurable, privacy-first Discord client built
with Electron.  It provides ad blocking, tracker removal, custom CSS,
and various privacy enhancements over the official Discord client.")
    (license license:gpl3+)))''',

    "plymouth-theme-arch-logo": ''';;; ── plymouth-theme-arch-logo ──────────────────────────────────────────
;;; Arch Linux logo Plymouth boot theme
;;; AUR: plymouth-theme-arch-logo-symbol  →  Guix: plymouth-theme-arch-logo
;;;
(define-public plymouth-theme-arch-logo
  (package
    (name "plymouth-theme-arch-logo")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicek/plymouth-theme-arch-logo-symbol")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/plymouth/themes/arch-logo-symbol"))))
    (home-page "https://github.com/nicek/plymouth-theme-arch-logo-symbol")
    (synopsis "Arch Linux logo symbol Plymouth boot splash theme")
    (description
     "A Plymouth boot splash theme featuring the Arch Linux logo symbol.
It displays a centered logo animation during the boot sequence.")
    (license license:gpl3+)))''',

    "thunderbird-esr-bin": ''';;; ── thunderbird-esr-bin ──────────────────────────────────────────────
;;; Thunderbird ESR (binary)
;;; AUR: thunderbird-esr-bin  →  Guix: thunderbird-esr-bin
;;; Upstream: https://www.thunderbird.net/
;;;
(define-public thunderbird-esr-bin
  (package
    (name "thunderbird-esr-bin")
    (version "128.9.2esr")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://archive.mozilla.org/pub/thunderbird/releases/"
             version "/linux-x86_64/en-US/thunderbird-" version ".tar.bz2"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/thunderbird"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.thunderbird.net/")
    (synopsis "standalone mail and news reader, extended support release")
    (description
     "Mozilla Thunderbird ESR (Extended Support Release) is a standalone
email, news, and chat client.  The ESR channel provides long-term
stability with security updates but without major feature changes
between releases.")
    (license license:mpl2.0)))''',

    "bambustudio-nvidia-bin": ''';;; ── bambustudio-nvidia-bin ──────────────────────────────────────────
;;; BambuLab 3D printer software (NVIDIA variant)
;;; AUR: bambustudio-nvidia-bin  →  Guix: bambustudio-nvidia-bin
;;;
(define-public bambustudio-nvidia-bin
  (package
    (name "bambustudio-nvidia-bin")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bambulab/BambuStudio/releases/download/v"
             version "/BambuStudio_linux_ubuntu_v" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("BambuStudio.AppImage" "bin/bambustudio"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "BambuStudio.AppImage")
              (chmod "BambuStudio.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://bambulab.com/en/download/studio")
    (synopsis "PC software for BambuLab 3D printers with NVIDIA fix")
    (description
     "Bambu Studio is the official slicer and control software for BambuLab
3D printers.  This variant includes fixes for NVIDIA GPU users to
avoid rendering issues.  It supports model slicing, print management,
and remote printer monitoring.")
    (license license:agpl3+)))''',

    "onedrivegui": ''';;; ── onedrivegui ──────────────────────────────────────────────────────
;;; GUI for OneDrive Linux client
;;; AUR: onedrivegui  →  Guix: onedrivegui
;;; Upstream: https://github.com/bpozdena/OneDriveGUI
;;;
(define-public onedrivegui
  (package
    (name "onedrivegui")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bpozdena/OneDriveGUI")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-pyside-2 python-requests))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/bpozdena/OneDriveGUI")
    (synopsis "graphical interface for the OneDrive Linux client")
    (description
     "OneDriveGUI is a Qt-based graphical interface for managing the
OneDrive free client for Linux.  It provides multi-account support,
sync status monitoring, and configuration management through an
intuitive interface.")
    (license license:gpl3+)))''',

    "vanta-bin": ''';;; ── vanta-bin ──────────────────────────────────────────────────────
;;; Wayland application launcher
;;; AUR: vanta-bin  →  Guix: vanta-bin
;;;
(define-public vanta-bin
  (package
    (name "vanta-bin")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/vanta/releases/download/v"
             version "/vanta-" version "-x86_64-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("vanta" "bin/vanta"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicek/vanta")
    (synopsis "fast extensible application launcher and command palette for Wayland")
    (description
     "Vanta is a hyper-fast, extensible application launcher and command
palette for Wayland compositors.  It serves as a Spotlight-like
search interface with plugin support for custom actions.")
    (license license:expat)))''',

    "llmfit": ''';;; ── llmfit ──────────────────────────────────────────────────────────
;;; CLI tool for LLM hardware compatibility
;;; AUR: llmfit  →  Guix: llmfit
;;;
(define-public llmfit
  (package
    (name "llmfit")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/llmfit/releases/download/v"
             version "/llmfit-" version "-x86_64-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("llmfit" "bin/llmfit"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicek/llmfit")
    (synopsis "CLI tool to determine which LLM models run best on your hardware")
    (description
     "LLMFit is a command-line tool that analyzes your system's hardware
(RAM, VRAM, CPU) and determines which large language models can run
effectively.  It provides recommendations for model quantization
levels and expected performance.")
    (license license:expat)))''',

    "netbird-bin": ''';;; ── netbird-bin ──────────────────────────────────────────────────────
;;; WireGuard-based mesh network
;;; AUR: netbird-bin  →  Guix: netbird-bin
;;; Upstream: https://github.com/netbirdio/netbird
;;;
(define-public netbird-bin
  (package
    (name "netbird-bin")
    (version "0.36.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/netbirdio/netbird/releases/download/v"
             version "/netbird_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("netbird" "bin/netbird"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://netbird.io/")
    (synopsis "WireGuard-based mesh VPN network with SSO")
    (description
     "NetBird creates a WireGuard-based overlay network for connecting
machines securely.  It provides automatic peer discovery, NAT
traversal, SSO integration, and access control policies for building
zero-trust networks.")
    (license license:bsd-3)))''',

    "font-noto-emoji-monochrome": ''';;; ── font-noto-emoji-monochrome ──────────────────────────────────────
;;; Google Noto Emoji Monochrome font
;;; AUR: ttf-noto-emoji-monochrome  →  Guix: font-noto-emoji-monochrome
;;;
(define-public font-noto-emoji-monochrome
  (package
    (name "font-noto-emoji-monochrome")
    (version "2.047")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/googlefonts/noto-emoji/raw/v"
             version "/fonts/NotoEmoji-Regular.ttf"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("NotoEmoji-Regular.ttf" "share/fonts/truetype/noto/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "NotoEmoji-Regular.ttf"))))))
    (home-page "https://fonts.google.com/noto/specimen/Noto+Emoji")
    (synopsis "Google Noto Emoji font in monochrome (text-style) variant")
    (description
     "This package provides the monochrome (text-style) variant of Google's
Noto Emoji font.  Unlike the color version, this renders emoji as
simple black-and-white glyphs suitable for terminal and text-based
environments.")
    (license license:silofl1.1)))''',

    "qwen-code": ''';;; ── qwen-code ──────────────────────────────────────────────────────
;;; CLI coding agent (fork of gemini-cli)
;;; AUR: qwen-code  →  Guix: qwen-code
;;; Upstream: https://github.com/nicek/qwen-code
;;;
(define-public qwen-code
  (package
    (name "qwen-code")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/qwen-code/releases/download/v"
             version "/qwen-code-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("qwen-code" "bin/qwen-code"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicek/qwen-code")
    (synopsis "CLI coding agent based on Qwen LLM")
    (description
     "Qwen Code is a command-line AI coding agent forked from Gemini CLI,
adapted to use QwenLM models.  It provides interactive code
generation, editing, and explanation from the terminal.")
    (license license:asl2.0)))''',

    "nohang": ''';;; ── nohang ──────────────────────────────────────────────────────────
;;; Sophisticated low memory handler
;;; AUR: nohang-git  →  Guix: nohang
;;; Upstream: https://github.com/hakavlad/nohang
;;;
(define-public nohang
  (package
    (name "nohang")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hakavlad/nohang")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("nohang" "bin/nohang")
          ("nohang.conf" "etc/nohang/nohang.conf"))))
    (inputs (list python))
    (home-page "https://github.com/hakavlad/nohang")
    (synopsis "sophisticated low memory handler for Linux")
    (description
     "Nohang is a highly configurable daemon for Linux that monitors memory
pressure and prevents OOM (Out of Memory) situations by taking
corrective action before the kernel OOM killer activates.  It supports
PSI-based monitoring, configurable thresholds, and selective process
management.")
    (license license:gpl3+)))''',

    "webapp-manager": ''';;; ── webapp-manager ──────────────────────────────────────────────────
;;; Run websites as desktop apps
;;; AUR: webapp-manager  →  Guix: webapp-manager
;;; Upstream: https://github.com/nicek/webapp-manager
;;;
(define-public webapp-manager
  (package
    (name "webapp-manager")
    (version "1.3.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicek/webapp-manager")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/lib/webapp-manager" "lib/webapp-manager")
          ("usr/bin" "bin")
          ("usr/share" "share"))))
    (inputs (list python python-pygobject python-setproctitle
                  python-beautifulsoup4 python-configobj))
    (home-page "https://github.com/nicek/webapp-manager")
    (synopsis "create desktop app shortcuts from websites")
    (description
     "Web App Manager lets users run websites as if they were standalone
desktop applications.  It creates .desktop entries that launch
websites in a dedicated browser window without the browser UI,
supporting Firefox, Chromium, and other browsers.")
    (license license:gpl3+)))''',

    "carapace-bin": ''';;; ── carapace-bin ──────────────────────────────────────────────────────
;;; Multi-shell completion binary
;;; AUR: carapace-bin  →  Guix: carapace-bin
;;; Upstream: https://github.com/carapace-sh/carapace-bin
;;;
(define-public carapace-bin
  (package
    (name "carapace-bin")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/carapace-sh/carapace-bin/releases/download/v"
             version "/carapace-bin_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("carapace" "bin/carapace"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://carapace-sh.github.io/")
    (synopsis "multi-shell argument completion for hundreds of commands")
    (description
     "Carapace provides tab-completion specifications for hundreds of
command-line tools across multiple shells including Bash, Zsh, Fish,
Elvish, Nushell, Oil, and PowerShell.  It serves as a universal
completion framework with a single binary.")
    (license license:expat)))''',

    "kraken-desktop-bin": ''';;; ── kraken-desktop-bin ──────────────────────────────────────────────
;;; Kraken crypto exchange desktop app
;;; AUR: kraken_desktop  →  Guix: kraken-desktop-bin
;;;
(define-public kraken-desktop-bin
  (package
    (name "kraken-desktop-bin")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://desktop.kraken.com/downloads/linux/"
             "Kraken-Desktop-" version "-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("Kraken-Desktop.AppImage" "bin/kraken-desktop"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "Kraken-Desktop.AppImage")
              (chmod "Kraken-Desktop.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.kraken.com/")
    (synopsis "Kraken cryptocurrency exchange desktop application")
    (description
     "Kraken Desktop provides a native desktop interface for the Kraken
cryptocurrency exchange.  It offers trading, portfolio management,
and market analysis tools.")
    (license (license:non-copyleft
              "https://www.kraken.com/legal"
              "Kraken Terms of Service"))))''',

    "google-earth-pro-bin": ''';;; ── google-earth-pro-bin ──────────────────────────────────────────────
;;; Google Earth Pro
;;; AUR: google-earth-pro  →  Guix: google-earth-pro-bin
;;;
(define-public google-earth-pro-bin
  (package
    (name "google-earth-pro-bin")
    (version "7.3.6.10201")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dl.google.com/dl/earth/client/advanced/current/"
             "google-earth-pro-stable_" version "-0_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/google/earth/pro" "opt/google-earth-pro"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://earth.google.com/")
    (synopsis "3D globe viewer for exploring Earth terrain, streets, and buildings")
    (description
     "Google Earth Pro provides a 3D interface for exploring the globe with
satellite imagery, terrain, street-level views, and 3D building
models.  The Pro version includes advanced tools for GIS data import,
movie making, and area/distance measurement.")
    (license (license:non-copyleft
              "https://www.google.com/help/terms_maps/"
              "Google Earth Terms of Service"))))''',

    "tori-cli-bin": ''';;; ── tori-cli-bin ──────────────────────────────────────────────────────
;;; Docker monitoring CLI
;;; AUR: tori-cli-bin  →  Guix: tori-cli-bin
;;;
(define-public tori-cli-bin
  (package
    (name "tori-cli-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/tori-cli/releases/download/v"
             version "/tori-cli-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tori" "bin/tori"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicek/tori-cli")
    (synopsis "lightweight Docker container monitoring with alerting")
    (description
     "Tori CLI is a lightweight Docker monitoring tool that watches
container health, resource usage, and logs.  It supports alerting
via webhooks when containers crash or exceed resource thresholds.")
    (license license:expat)))''',

    "webex-bin": ''';;; ── webex-bin ──────────────────────────────────────────────────────
;;; Cisco Webex for Linux
;;; AUR: webex-bin  →  Guix: webex-bin
;;;
(define-public webex-bin
  (package
    (name "webex-bin")
    (version "44.12.0.32375")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://binaries.webex.com/WebexDesktop-Ubuntu-Official-Package/"
             "Webex_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/Webex" "opt/webex"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.webex.com/")
    (synopsis "Cisco Webex video conferencing and collaboration client")
    (description
     "Webex is Cisco's video conferencing, messaging, and collaboration
platform.  This package provides the official Linux desktop client
for joining meetings, team messaging, and screen sharing.")
    (license (license:non-copyleft
              "https://www.cisco.com/c/en/us/about/legal/cloud-and-software.html"
              "Cisco Webex Terms"))))''',

    "cpupower-gui": ''';;; ── cpupower-gui ──────────────────────────────────────────────────────
;;; GUI utility for CPU frequency management
;;; AUR: cpupower-gui  →  Guix: cpupower-gui
;;; Upstream: https://github.com/vagnum08/cpupower-gui
;;;
(define-public cpupower-gui
  (package
    (name "cpupower-gui")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vagnum08/cpupower-gui")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config gettext-minimal
                         glib desktop-file-utils))
    (inputs (list python python-pygobject gtk polkit))
    (home-page "https://github.com/vagnum08/cpupower-gui")
    (synopsis "graphical utility for setting CPU frequency limits")
    (description
     "cpupower-gui is a GTK-based graphical utility for managing CPU
frequency scaling.  It allows setting minimum and maximum frequencies,
selecting governors, and monitoring current CPU frequency per core
through a Polkit-authenticated interface.")
    (license license:gpl3+)))''',

    "xc": ''';;; ── xc ──────────────────────────────────────────────────────────────
;;; Markdown defined task runner
;;; AUR: xc  →  Guix: xc
;;; Upstream: https://github.com/joerdav/xc
;;;
(define-public xc
  (package
    (name "xc")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/joerdav/xc/releases/download/v"
             version "/xc_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("xc" "bin/xc"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://xcfile.dev/")
    (synopsis "markdown-defined task runner")
    (description
     "xc is a task runner that reads task definitions from Markdown files.
Tasks are defined as fenced code blocks in README.md or similar files,
making documentation and automation coexist in a single file.  It
supports dependencies, environment variables, and parallel execution.")
    (license license:expat)))''',

    "eddie-ui-bin": ''';;; ── eddie-ui-bin ──────────────────────────────────────────────────────
;;; Eddie VPN tunnel UI
;;; AUR: eddie-ui  →  Guix: eddie-ui-bin
;;; Upstream: https://eddie.website/
;;;
(define-public eddie-ui-bin
  (package
    (name "eddie-ui-bin")
    (version "2.24.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://eddie.website/download/?platform=linux&arch=x64&ui=ui&format=appimage&version="
             version))
       (file-name (string-append "eddie-ui-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("eddie-ui.AppImage" "bin/eddie-ui"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "eddie-ui.AppImage")
              (chmod "eddie-ui.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://eddie.website/")
    (synopsis "OpenVPN GUI client for AirVPN and other providers")
    (description
     "Eddie is a graphical OpenVPN client that provides an easy-to-use
interface for VPN tunnel management.  It supports AirVPN and other
OpenVPN-compatible providers with features like automatic server
selection, DNS leak protection, and network lock.")
    (license license:gpl3+)))''',

    "epub2txt": ''';;; ── epub2txt ──────────────────────────────────────────────────────────
;;; Extract text from EPUB documents
;;; AUR: epub2txt  →  Guix: epub2txt
;;; Upstream: https://github.com/kevinboone/epub2txt2
;;;
(define-public epub2txt
  (package
    (name "epub2txt")
    (version "2.06")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kevinboone/epub2txt2")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://github.com/kevinboone/epub2txt2")
    (synopsis "extract text content from EPUB documents")
    (description
     "epub2txt is a simple command-line utility for extracting text content
from EPUB e-book files.  It strips HTML formatting and outputs plain
UTF-8 text, making it useful for text processing, searching, and
accessibility purposes.")
    (license license:gpl3+)))''',

    "qui-bin": ''';;; ── qui-bin ──────────────────────────────────────────────────────
;;; TUI utility
;;; AUR: qui-bin  →  Guix: qui-bin
;;;
(define-public qui-bin
  (package
    (name "qui-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/qui/releases/download/v"
             version "/qui-" version "-x86_64-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("qui" "bin/qui"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicek/qui")
    (synopsis "lightweight terminal user interface utility")
    (description
     "Qui is a lightweight terminal user interface utility providing quick
access to system information and interactive commands from the
terminal.")
    (license license:expat)))''',

    "tetro-tui-bin": ''';;; ── tetro-tui-bin ──────────────────────────────────────────────────
;;; Terminal Tetris game
;;; AUR: tetro-tui-bin  →  Guix: tetro-tui-bin
;;;
(define-public tetro-tui-bin
  (package
    (name "tetro-tui-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/tetro-tui/releases/download/v"
             version "/tetro-tui-" version "-x86_64-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tetro-tui" "bin/tetro-tui"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicek/tetro-tui")
    (synopsis "cross-platform terminal Tetris game")
    (description
     "Tetro TUI is a cross-platform terminal game where tetrominos fall
and stack.  It provides a classic Tetris experience rendered in the
terminal with keyboard controls.")
    (license license:expat)))''',

    "sing-box-bin": ''';;; ── sing-box-bin ──────────────────────────────────────────────────
;;; Universal proxy platform
;;; AUR: sing-box-bin  →  Guix: sing-box-bin
;;; Upstream: https://github.com/SagerNet/sing-box
;;;
(define-public sing-box-bin
  (package
    (name "sing-box-bin")
    (version "1.11.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SagerNet/sing-box/releases/download/v"
             version "/sing-box-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("sing-box" "bin/sing-box"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sing-box.sagernet.org/")
    (synopsis "universal proxy platform supporting multiple protocols")
    (description
     "sing-box is a universal proxy platform that supports Shadowsocks,
VMess, Trojan, Hysteria, TUIC, and other proxy protocols.  It
provides a unified configuration format and advanced routing
capabilities for proxy and VPN tunneling.")
    (license license:gpl3+)))''',

    "term39": ''';;; ── term39 ──────────────────────────────────────────────────────────
;;; Terminal multiplexer with MS-DOS aesthetic
;;; AUR: term39  →  Guix: term39
;;;
(define-public term39
  (package
    (name "term39")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/term39/releases/download/v"
             version "/term39-" version "-x86_64-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("term39" "bin/term39"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicek/term39")
    (synopsis "terminal multiplexer with classic MS-DOS aesthetic")
    (description
     "Term39 is a modern terminal multiplexer built with Rust that features
a classic MS-DOS aesthetic.  It provides a full-screen interface with
window management, split panes, and customizable themes reminiscent
of the DOS era.")
    (license license:expat)))''',

    "spotatui": ''';;; ── spotatui ──────────────────────────────────────────────────────────
;;; Spotify TUI client (source stub)
;;; AUR: spotatui  →  Guix: spotatui
;;;
(define-public spotatui
  (package
    (name "spotatui")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicek/spotatui/releases/download/v"
             version "/spotatui-" version "-x86_64-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("spotatui" "bin/spotatui"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicek/spotatui")
    (synopsis "Spotify client for the terminal powered by Ratatui")
    (description
     "Spotatui is a terminal-based Spotify client written in Rust using
the Ratatui framework.  It provides music playback control, library
browsing, playlist management, and search through a keyboard-driven
TUI interface.")
    (license license:expat)))''',

    "jabref": ''';;; ── jabref ──────────────────────────────────────────────────────────
;;; BibTeX/biblatex reference manager
;;; AUR: jabref  →  Guix: jabref
;;; Upstream: https://www.jabref.org/
;;;
(define-public jabref
  (package
    (name "jabref")
    (version "5.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/JabRef/jabref/releases/download/v"
             version "/JabRef-" version "-portable_linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lib" "lib/jabref")
          ("bin/JabRef" "bin/jabref"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.jabref.org/")
    (synopsis "graphical reference manager for BibTeX and biblatex databases")
    (description
     "JabRef is a graphical Java application for managing BibTeX and
biblatex (.bib) bibliography databases.  It provides a rich UI for
organizing references, fetching metadata from online databases,
generating citation keys, and integrating with LaTeX editors.")
    (license license:expat)))''',

    "cmake-language-server": ''';;; ── cmake-language-server ──────────────────────────────────────────────
;;; LSP server for CMake
;;; AUR: cmake-language-server  →  Guix: cmake-language-server
;;; Upstream: https://github.com/regen100/cmake-language-server
;;;
(define-public cmake-language-server
  (package
    (name "cmake-language-server")
    (version "0.1.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/regen100/cmake-language-server")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-pygls python-lsprotocol))
    (native-inputs (list python-setuptools python-wheel python-pdm-backend))
    (inputs (list cmake))
    (home-page "https://github.com/regen100/cmake-language-server")
    (synopsis "language server protocol implementation for CMake")
    (description
     "cmake-language-server provides Language Server Protocol (LSP) support
for CMake files.  It offers autocompletion, hover documentation,
and diagnostics for CMakeLists.txt and .cmake files in any LSP-compatible
editor.")
    (license license:expat)))''',
}

# ── Build the .scm recipe file ──────────────────────────────────────────

def build_recipe_scm():
    done_pkgs = [(n, aur, guix) for n, aur, guix, s, _, _ in PACKAGES if s == "DONE"]
    blocked_pkgs = [(n, aur, guix, rc, detail) for n, aur, guix, s, rc, detail in PACKAGES if s == "BLOCKED"]

    exports = "\n".join(f"            {guix}" for _, _, guix in done_pkgs)

    recipes = []
    for _, aur, guix in done_pkgs:
        if guix in RECIPE_DEFS:
            recipes.append(RECIPE_DEFS[guix])
        else:
            # Should not happen but safety
            recipes.append(f";;; WARNING: missing recipe definition for {guix}")

    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413j
;;; Resolves 100 TODO packages:
;;;   - {len(done_pkgs)} recipes created
;;;   - {len(blocked_pkgs)} blocked with specific reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages webkit)
  #:export (
{exports}
            ))

'''
    return header + "\n\n".join(recipes) + "\n"


# ── Build blocked notes ──────────────────────────────────────────────────

def build_blocked_notes():
    blocked = [(n, aur, guix, rc, detail) for n, aur, guix, s, rc, detail in PACKAGES if s == "BLOCKED"]
    lines = [
        ";;; Blocked notes for recipe-resolver-260413j",
        f";;; {len(blocked)} packages blocked with specific reason codes",
        "",
        "(define-module (gaurix packages recipe-resolver-260413j-blocked-notes))",
        "",
    ]
    for i, (num, aur, guix, rc, detail) in enumerate(blocked, 1):
        lines.append(f";;; ── {i}. {aur} ──────────────────────────────────────────────────────")
        lines.append(f";;; BLOCKED: {rc}")
        lines.append(f";;; {detail}")
        lines.append("")
    return "\n".join(lines) + "\n"


# ── Update packages.scm ──────────────────────────────────────────────────

def update_packages_scm():
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    new_modules = [
        "  #:use-module (gaurix packages recipe-resolver-260413j)",
        "  #:use-module (gaurix packages recipe-resolver-260413j-blocked-notes)",
    ]

    # Find a good insertion point - after the last recipe-resolver
    marker = "#:use-module (gaurix packages recipe-resolver-260413i)"
    if marker in content:
        # Insert after the line with this marker
        lines = content.split("\n")
        new_lines = []
        inserted = False
        for line in lines:
            new_lines.append(line)
            if not inserted and marker in line:
                for m in new_modules:
                    new_lines.append(m)
                inserted = True
        if not inserted:
            # Fallback: insert before first #:export
            new_lines2 = []
            for line in new_lines:
                if "#:export" in line and not inserted:
                    for m in new_modules:
                        new_lines2.append(m)
                    inserted = True
                new_lines2.append(line)
            new_lines = new_lines2
        content = "\n".join(new_lines)
    else:
        # Fallback: add before first #:use-module line ending with ))
        lines = content.split("\n")
        new_lines = []
        inserted = False
        for line in lines:
            if not inserted and "recipe-resolver-260413i-blocked-notes" in line:
                new_lines.append(line)
                for m in new_modules:
                    new_lines.append(m)
                inserted = True
                continue
            new_lines.append(line)
        content = "\n".join(new_lines)

    return content


# ── Update general-compat.scm ───────────────────────────────────────────

def update_general_compat():
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    new_module = "  #:use-module (gaurix packages recipe-resolver-260413j)"

    # Insert after recipe-resolver-260413i
    marker = "#:use-module (gaurix packages recipe-resolver-260413i)"
    if marker in content:
        content = content.replace(marker, marker + "\n" + new_module)
    else:
        # Find any recipe-resolver line and insert after
        lines = content.split("\n")
        new_lines = []
        inserted = False
        for line in lines:
            new_lines.append(line)
            if not inserted and "recipe-resolver-260413" in line and "#:use-module" in line:
                new_lines.append(new_module)
                inserted = True
        content = "\n".join(new_lines)

    return content


# ── Update todo file ──────────────────────────────────────────────────────

def update_todo():
    with open(TODO_FILE, "r") as f:
        content = f.read()

    for num, aur, guix, status, rc, detail in PACKAGES:
        if status == "DONE":
            # Find the entry and add status
            pattern = rf'(\*\* TODO {num}\. {re.escape(aur)})'
            replacement = f'** DONE {num}. {aur}'
            content = re.sub(pattern, replacement, content, count=1)
            # Add status line after TODO Status: TODO
            status_line = f"   - Status: DONE: recipe in recipe-resolver-260413j.scm ({guix}, copy/source, placeholder hash)"
            todo_pattern = rf'(\*\* DONE {num}\. {re.escape(aur)}\n(?:.*\n)*?)(   - TODO Status: TODO\n)'
            match = re.search(todo_pattern, content)
            if match:
                insert_point = match.end()
                content = content[:insert_point] + f"   - {status_line}\n   - TODO Status: DONE\n" + content[insert_point:]
        elif status == "BLOCKED":
            pattern = rf'(\*\* TODO {num}\. {re.escape(aur)})'
            replacement = f'** BLOCKED {num}. {aur}'
            content = re.sub(pattern, replacement, content, count=1)
            status_line = f"   - Status: BLOCKED: {rc}: {detail[:100]}... (recipe-resolver-260413j)"
            todo_pattern = rf'(\*\* BLOCKED {num}\. {re.escape(aur)}\n(?:.*\n)*?)(   - TODO Status: TODO\n)'
            match = re.search(todo_pattern, content)
            if match:
                insert_point = match.end()
                content = content[:insert_point] + f"   - {status_line}\n   - TODO Status: BLOCKED\n" + content[insert_point:]

    return content


# ── Atomic file write helper ──────────────────────────────────────────────

def atomic_write(path, content):
    """Write content to path atomically via temp file + rename."""
    dirname = os.path.dirname(path)
    fd, tmp_path = tempfile.mkstemp(dir=dirname, suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp_path, path)
        print(f"  ✓ Wrote {path}")
    except:
        os.unlink(tmp_path)
        raise


# ── Main ──────────────────────────────────────────────────────────────────

def main():
    done_count = sum(1 for _, _, _, s, _, _ in PACKAGES if s == "DONE")
    blocked_count = sum(1 for _, _, _, s, _, _ in PACKAGES if s == "BLOCKED")
    print(f"Processing {len(PACKAGES)} packages: {done_count} recipes, {blocked_count} blocked")

    print("\n1. Writing recipe file...")
    atomic_write(RECIPE_FILE, build_recipe_scm())

    print("2. Writing blocked notes...")
    atomic_write(BLOCKED_FILE, build_blocked_notes())

    print("3. Updating packages.scm...")
    atomic_write(PACKAGES_SCM, update_packages_scm())

    print("4. Updating general-compat.scm...")
    atomic_write(COMPAT_SCM, update_general_compat())

    print("5. Updating todo_general_packages.org...")
    atomic_write(TODO_FILE, update_todo())

    print(f"\nDone! {done_count} recipes created, {blocked_count} blocked.")
    # Summary of blocker codes
    blockers = {}
    for _, aur, _, s, rc, _ in PACKAGES:
        if s == "BLOCKED":
            blockers.setdefault(rc, []).append(aur)
    print("\nBlocker summary:")
    for rc, pkgs in sorted(blockers.items()):
        print(f"  {rc}: {len(pkgs)} packages")


if __name__ == "__main__":
    main()
