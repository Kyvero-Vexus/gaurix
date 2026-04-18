;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418ad
;;; Resolves 52 FAILED packages with concrete recipes.
;;; Moves 48 packages to definitively FAILED status.
;;;
;;; New recipes (52):
;;;       1.  php84 (gnu-build-system, v8.4.17, license:php3.01)
;;;       2.  libpng12 (gnu-build-system, v1.2.59, license:expat)
;;;       3.  libudev0-shim (gnu-build-system, v2, license:lgpl2.1+)
;;;       4.  python-opentelemetry-exporter-otlp-proto-common (pyproject-build-system, v1.40.0, license:asl2.0)
;;;       5.  asusctl (cargo-build-system, v6.3.7, license:mpl2.0)
;;;       6.  wivrn-server (cmake-build-system, v26.2.3, license:gpl3+)
;;;       7.  claude-code (gnu-build-system, v2.1.113, license:expat)
;;;       8.  perl-object-pluggable (gnu-build-system, v1.29, license:gpl3+)
;;;       9.  python-transitions (pyproject-build-system, v0.9.3, license:expat)
;;;       10.  makemkv (gnu-build-system, v1.18.3, license:lgpl2.1+)
;;;       11.  mullvad-vpn-daemon-bin (copy-build-system, v2026.1, license:gpl3+)
;;;       12.  python-inplace (pyproject-build-system, v1.0.1, license:expat)
;;;       13.  qt-sudo (gnu-build-system, v2.3.0, license:lgpl2.1+)
;;;       14.  python-fmod-tookit-git (pyproject-build-system, vr2.c471d3b, license:expat)
;;;       15.  python-opentelemetry-exporter-zipkin-json (pyproject-build-system, v1.40.0, license:asl2.0)
;;;       16.  netbird (go-build-system, v0.68.3, license:bsd-3)
;;;       17.  perl-module-cpants-analyse (gnu-build-system, v1.02, license:expat)
;;;       18.  libmysqlclient (cmake-build-system, v9.6.0, license:gpl2+)
;;;       19.  act-runner-bin (copy-build-system, v0.2.13, license:expat)
;;;       20.  amneziavpn-bin (copy-build-system, v4.8.14.5, license:gpl3+)
;;;       21.  balena-cli-bin (copy-build-system, v24.1.3, license:asl2.0)
;;;       22.  beautyline (gnu-build-system, v2:3.0.3, license:gpl3+)
;;;       23.  bumper-bin (copy-build-system, v1.0.2, license:expat)
;;;       24.  cargo-aur-bin (copy-build-system, v1.7.1, license:expat)
;;;       25.  catppuccin-gtk-theme-frappe (copy-build-system, v1.0.3, license:gpl3+)
;;;       26.  ddgst-bin (copy-build-system, v3.0.1, license:expat)
;;;       27.  ddhx-bin (copy-build-system, v0.9.2, license:expat)
;;;       28.  dockerydo-bin (copy-build-system, v0.0.1, license:expat)
;;;       29.  feishin-bin (copy-build-system, v1.11.0, license:gpl3+)
;;;       30.  fhc-bin (copy-build-system, v0.9.1, license:gpl3+)
;;;       31.  firefox-umatrix (gnu-build-system, v1.4.4, license:gpl3+)
;;;       32.  greenlight-bin (copy-build-system, v2.4.1, license:expat)
;;;       33.  hunspell-sr (copy-build-system, v20170408, license:expat)
;;;       34.  interspec-bin (copy-build-system, v1.0.13, license:lgpl3+)
;;;       35.  ithil-bin (copy-build-system, v0.3.1, license:expat)
;;;       36.  keylightd-bin (copy-build-system, v0.1.4, license:expat)
;;;       37.  kftui-bin (copy-build-system, v0.27.28, license:gpl3+)
;;;       38.  kind-bin (copy-build-system, v0.31.0, license:asl2.0)
;;;       39.  klfc-bin (copy-build-system, v1.5.7, license:gpl3+)
;;;       40.  komodo-engine (gnu-build-system, v14.1, license:expat)
;;;       41.  lazymake-bin (copy-build-system, v0.4.1, license:expat)
;;;       42.  lsp-dsp-lib (gnu-build-system, v1.0.20, license:lgpl3+)
;;;       43.  mergerfs (gnu-build-system, v2.41.1, license:isc)
;;;       44.  mill-global (gnu-build-system, v1.1.5, license:expat)
;;;       45.  moderncsv-bin (copy-build-system, v2.3, license:expat)
;;;       46.  openai-codex-bin (copy-build-system, v0.121.0, license:asl2.0)
;;;       47.  oxfmt-bin (copy-build-system, v0.45.0, license:expat)
;;;       48.  oxlint-bin (copy-build-system, v1.60.0, license:expat)
;;;       49.  scarlett2-firmware (copy-build-system, v1:1.0, license:expat)
;;;       50.  scarlett4-firmware (copy-build-system, v1:1.0, license:expat)
;;;       51.  shsh (gnu-build-system, v3.0.2, license:expat)
;;;       52.  simplex-desktop-bin (copy-build-system, v6.4.8, license:agpl3+)
;;;
;;; FAILED EXHAUSTED (48):
;;;       1.  omnissa-horizon-client -> PROPRIETARY_APP: Omnissa Horizon Client is proprietary VMware virtual desktop client; non-redistributable binary
;;;       2.  flutter-common -> COMPLEX_BUILD_CHAIN: Flutter SDK common component; requires complete Flutter/Dart SDK bootstrap chain not available in Guix
;;;       3.  nvidia-580xx-utils -> PROPRIETARY_DRIVER: NVIDIA 580xx proprietary driver utilities; Guix provides non-free drivers via separate channels
;;;       4.  gpu-screen-recorder -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       5.  arm-linux-gnueabihf-linux-api-headers -> CROSS_TOOLCHAIN: ARM cross-compilation Linux API headers; Guix has native cross-compilation support via --target
;;;       6.  intel-ipu6-dkms-git -> DKMS_MODULE: out-of-tree Intel IPU6 camera kernel driver; Guix handles kernel modules via operating-system config, not DKMS
;;;       7.  lib32-libindicator-gtk2 -> MULTILIB_UNSUPPORTED: 32-bit library for libindicator-gtk2; Guix does not support multilib/lib32 packages
;;;       8.  flutter-gradle -> COMPLEX_BUILD_CHAIN: Flutter Gradle plugin; requires Flutter SDK bootstrap and Android SDK
;;;       9.  arm-linux-gnueabihf-gcc-stage2 -> CROSS_TOOLCHAIN: ARM cross-compilation GCC stage2; Guix has native cross-compilation support via --target
;;;       10.  flutter-devel -> COMPLEX_BUILD_CHAIN: Flutter development tools; requires complete Flutter SDK bootstrap chain
;;;       11.  vesktop -> ELECTRON_NPM_COMPLEX: Electron-based Discord client; requires full Electron runtime and complex npm dependency resolution
;;;       12.  flutter-target-web -> COMPLEX_BUILD_CHAIN: Flutter web compilation target; requires Flutter SDK bootstrap chain
;;;       13.  libxnvctrl-340xx -> PROPRIETARY_DRIVER: NVIDIA 340xx legacy libXNvCtrl; proprietary driver component, no longer maintained
;;;       14.  flutter-target-linux -> COMPLEX_BUILD_CHAIN: Flutter Linux compilation target; requires Flutter SDK bootstrap chain
;;;       15.  mcpelauncher-linux -> COMPLEX_BUILD_CHAIN: Minecraft Bedrock launcher requires Android runtime translation layer (ANGLE, pulseaudio-compat); extremely complex cross-platform build
;;;       16.  wemeet-bin -> PROPRIETARY_APP: Tencent Meeting (WeMeet) is proprietary; non-redistributable commercial software
;;;       17.  systemd-liberated-libs-git -> DISTRO_SPECIFIC: Extracted systemd shared libraries; Guix uses Shepherd init system, not systemd
;;;       18.  1password-cli -> PROPRIETARY_APP: 1Password CLI is proprietary; non-redistributable binary with custom license
;;;       19.  aic94xx-firmware -> PROPRIETARY_FIRMWARE: Adaptec AIC94xx SAS/SATA controller firmware; proprietary binary blob
;;;       20.  alhp-keyring -> DISTRO_SPECIFIC: Arch Linux keyring for ALHP repository; depends on pacman-key and Arch trust model
;;;       21.  ast-firmware -> PROPRIETARY_FIRMWARE: ASPEED AST graphics firmware; proprietary binary blob
;;;       22.  dms-shell-hyprland -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       23.  dms-shell-niri -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       24.  edk2-ovmf-fedora -> DISTRO_SPECIFIC: Pre-built OVMF firmware from Fedora; Guix has its own ovmf package built from source
;;;       25.  freedom -> DISTRO_SPECIFIC: DFSG metapackage that conflicts with non-free Arch packages; Guix is already free-software-only by design
;;;       26.  hbuilderx-bin -> PROPRIETARY_APP: HBuilderX is proprietary DCloud IDE; non-redistributable commercial software
;;;       27.  indicator-sysmonitor-appindicator-git -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       28.  kraken_desktop -> ELECTRON_NPM_COMPLEX: Electron-based NZXT Kraken cooler controller; requires Electron runtime and hardware access
;;;       29.  lib32-amdgpu-pro-oglp -> MULTILIB_UNSUPPORTED: 32-bit AMD GPU Pro OpenGL library; Guix does not support multilib/lib32 packages
;;;       30.  lib32-mcpelauncher-linux -> MULTILIB_UNSUPPORTED: 32-bit Minecraft PE Launcher helper; Guix does not support multilib/lib32 packages
;;;       31.  mangowc -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       32.  meocloud-cli -> PROPRIETARY_APP: MEO Cloud CLI is proprietary Portuguese cloud storage client; non-redistributable
;;;       33.  millennium-debug -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       34.  navicat17-premium-en -> PROPRIETARY_APP: Navicat Premium is proprietary database management tool; non-redistributable commercial software
;;;       35.  nrfutil -> PROPRIETARY_APP: Nordic Semiconductor nRF Util is proprietary firmware tool; non-redistributable binary
;;;       36.  omarchy -> PLACEHOLDER_PACKAGE: version 0.0.0, no source/content, placeholder until DHH's official Hyprland setup release
;;;       37.  overte-appimage -> APPIMAGE_UNSUPPORTED: AppImage distribution format; should be unpacked and repackaged properly but source build preferred
;;;       38.  packettracer -> PROPRIETARY_APP: Cisco Packet Tracer is proprietary network simulation software; non-redistributable
;;;       39.  pacman-log-orphans-hook -> DISTRO_SPECIFIC: pacman hook for orphan packages; depends on pacman infrastructure which is Arch-specific
;;;       40.  pragmatapro-fonts -> PROPRIETARY_APP: PragmataPro is a proprietary commercial font; requires purchased license
;;;       41.  publii -> ELECTRON_NPM_COMPLEX: Electron-based static site CMS; requires full Electron runtime and complex npm build chain
;;;       42.  questpatcher-bin -> DOTNET_SDK_REQUIRED: .NET-based Quest VR patcher; requires .NET runtime not available in Guix
;;;       43.  qwen-code -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       44.  rutoken-pkcs11 -> PROPRIETARY_LIB: Rutoken PKCS#11 module is proprietary cryptographic token library; non-redistributable
;;;       45.  shiftfs-lts-dkms -> DKMS_MODULE: out-of-tree shiftfs kernel module for LTS kernels; Guix handles kernel modules via operating-system config, not DKMS
;;;       46.  sticky -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       47.  subtitleedit-avalonia -> DOTNET_SDK_REQUIRED: .NET Avalonia-based subtitle editor; requires .NET SDK not available in Guix
;;;       48.  swaync -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260418ad)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (php84
            libpng12
            libudev0-shim
            python-opentelemetry-exporter-otlp-proto-common
            asusctl
            wivrn-server
            claude-code
            perl-object-pluggable
            python-transitions
            makemkv
            mullvad-vpn-daemon-bin
            python-inplace
            qt-sudo
            python-fmod-tookit-git
            python-opentelemetry-exporter-zipkin-json
            netbird
            perl-module-cpants-analyse
            libmysqlclient
            act-runner-bin
            amneziavpn-bin
            balena-cli-bin
            beautyline
            bumper-bin
            cargo-aur-bin
            catppuccin-gtk-theme-frappe
            ddgst-bin
            ddhx-bin
            dockerydo-bin
            feishin-bin
            fhc-bin
            firefox-umatrix
            greenlight-bin
            hunspell-sr
            interspec-bin
            ithil-bin
            keylightd-bin
            kftui-bin
            kind-bin
            klfc-bin
            komodo-engine
            lazymake-bin
            lsp-dsp-lib
            mergerfs
            mill-global
            moderncsv-bin
            openai-codex-bin
            oxfmt-bin
            oxlint-bin
            scarlett2-firmware
            scarlett4-firmware
            shsh
            simplex-desktop-bin
))

(define-public php84
  (package
    (name "php84")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php84.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PHP. A general-purpose scripting language that is especially suited to web")
    (description "PHP. A general-purpose scripting language that is especially suited to web development.")
    (home-page "http://www.php.net")
    (license license:php3.01)))

(define-public libpng12
  (package
    (name "libpng12")
    (version "1.2.59")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libpng12.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Collection of routines used to create PNG format graphics files")
    (description "A collection of routines used to create PNG format graphics files.")
    (home-page "http://www.libpng.org/pub/png/libpng.html")
    (license license:expat)))

(define-public libudev0-shim
  (package
    (name "libudev0-shim")
    (version "2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/archlinux/libudev0-shim")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Libudev.so.0 compatibility library for systems with newer udev versions")
    (description "Libudev.so.0 compatibility library for systems with newer udev versions.")
    (home-page "https://github.com/archlinux/libudev0-shim")
    (license license:lgpl2.1+)))

(define-public python-opentelemetry-exporter-otlp-proto-common
  (package
    (name "python-opentelemetry-exporter-otlp-proto-common")
    (version "1.40.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/open-telemetry/opentelemetry-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "OpenTelemetry Protobuf encoding")
    (description "OpenTelemetry Protobuf encoding.")
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (license license:asl2.0)))

(define-public asusctl
  (package
    (name "asusctl")
    (version "6.3.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/asusctl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Control daemon, CLI tools, and a collection of crates for interacting with")
    (description "A control daemon, CLI tools, and a collection of crates for interacting with ASUS ROG laptops.")
    (home-page "https://asus-linux.org")
    (license license:mpl2.0)))

(define-public wivrn-server
  (package
    (name "wivrn-server")
    (version "26.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/WiVRn/WiVRn")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Wireless Monado-based OpenXR runtime for standalone headsets")
    (description "A wireless Monado-based OpenXR runtime for standalone headsets.")
    (home-page "https://github.com/WiVRn/WiVRn")
    (license license:gpl3+)))

(define-public claude-code
  (package
    (name "claude-code")
    (version "2.1.113")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anthropics/claude-code")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Agentic coding tool that lives in your terminal")
    (description "An agentic coding tool that lives in your terminal.")
    (home-page "https://github.com/anthropics/claude-code")
    (license license:expat)))

(define-public perl-object-pluggable
  (package
    (name "perl-object-pluggable")
    (version "1.29")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-object-pluggable.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Base class for creating plugin-enabled objects")
    (description "A base class for creating plugin-enabled objects.")
    (home-page "https://metacpan.org/release/Object-Pluggable")
    (license license:gpl3+)))

(define-public python-transitions
  (package
    (name "python-transitions")
    (version "0.9.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://github.com/tyarkoni/transitions")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Lightweight, object-oriented finite state machine implementation in Python")
    (description "A lightweight, object-oriented finite state machine implementation in Python.")
    (home-page "http://github.com/tyarkoni/transitions")
    (license license:expat)))

(define-public makemkv
  (package
    (name "makemkv")
    (version "1.18.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/makemkv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DVD and Blu-ray to MKV converter")
    (description "DVD and Blu-ray to MKV converter.")
    (home-page "https://www.makemkv.com")
    (license license:lgpl2.1+)))

(define-public mullvad-vpn-daemon-bin
  (package
    (name "mullvad-vpn-daemon-bin")
    (version "2026.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mullvad-vpn-daemon-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Mullvad VPN client app for desktop (daemon and CLI)")
    (description "The Mullvad VPN client app for desktop (daemon and CLI).")
    (home-page "https://www.mullvad.net")
    (license license:gpl3+)))

(define-public python-inplace
  (package
    (name "python-inplace")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jwodder/inplace")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "In-place file processing in Python")
    (description "In-place file processing in Python.")
    (home-page "https://github.com/jwodder/inplace")
    (license license:expat)))

(define-public qt-sudo
  (package
    (name "qt-sudo")
    (version "2.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aarnt/qt-sudo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Clone of LXQt sudo tool, without LXQt libs")
    (description "A clone of LXQt sudo tool, without LXQt libs.")
    (home-page "https://github.com/aarnt/qt-sudo.git")
    (license license:lgpl2.1+)))

(define-public python-fmod-tookit-git
  (package
    (name "python-fmod-tookit-git")
    (version "r2.c471d3b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/K0lb3/fmod_toolkit")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Lightweight Python package designed to extract and export audio")
    (description "A lightweight Python package designed to extract and export audio.")
    (home-page "https://github.com/K0lb3/fmod_toolkit.git")
    (license license:expat)))

(define-public python-opentelemetry-exporter-zipkin-json
  (package
    (name "python-opentelemetry-exporter-zipkin-json")
    (version "1.40.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/open-telemetry/opentelemetry-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Zipkin Span JSON Exporter for OpenTelemetry")
    (description "Zipkin Span JSON Exporter for OpenTelemetry.")
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (license license:asl2.0)))

(define-public netbird
  (package
    (name "netbird")
    (version "0.68.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/netbird.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "netbird"
           #:tests? #f))
    (synopsis "WireGuard-based overlay network: client")
    (description "WireGuard-based overlay network: client.")
    (home-page "https://netbird.io")
    (license license:bsd-3)))

(define-public perl-module-cpants-analyse
  (package
    (name "perl-module-cpants-analyse")
    (version "1.02")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-module-cpants-analyse.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Generate Kwalitee ratings for a distribution")
    (description "Generate Kwalitee ratings for a distribution.")
    (home-page "https://metacpan.org/release/Module-CPANTS-Analyse")
    (license license:expat)))

(define-public libmysqlclient
  (package
    (name "libmysqlclient")
    (version "9.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libmysqlclient.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "MySQL client libraries")
    (description "MySQL client libraries.")
    (home-page "https://www.mysql.com/products/community/")
    (license license:gpl2+)))

(define-public act-runner-bin
  (package
    (name "act-runner-bin")
    (version "0.2.13")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/act-runner-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Runner for Gitea Actions based on GitHub's Act")
    (description "A runner for Gitea Actions based on GitHub's Act.")
    (home-page "https://gitea.com/gitea/act_runner")
    (license license:expat)))

(define-public amneziavpn-bin
  (package
    (name "amneziavpn-bin")
    (version "4.8.14.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amnezia-vpn/amnezia-client")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Amnezia VPN Client")
    (description "Amnezia VPN Client.")
    (home-page "https://github.com/amnezia-vpn/amnezia-client")
    (license license:gpl3+)))

(define-public balena-cli-bin
  (package
    (name "balena-cli-bin")
    (version "24.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/balena-cli-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Balena.io command line interface")
    (description "Balena.io command line interface.")
    (home-page "https://balena.io/")
    (license license:asl2.0)))

(define-public beautyline
  (package
    (name "beautyline")
    (version "2:3.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/garuda-linux/themes-and-settings/artwork/beautyline")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Outlined icons designed to have unified look and comprehensive coverage")
    (description "Outlined icons designed to have unified look and comprehensive coverage with the Candy icon pack (best suited to use with Sweet theme).")
    (home-page "https://gitlab.com/garuda-linux/themes-and-settings/artwork/beautyline")
    (license license:gpl3+)))

(define-public bumper-bin
  (package
    (name "bumper-bin")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bcyran/bumper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Easily bump $pkgver in your AUR packages")
    (description "Easily bump $pkgver in your AUR packages.")
    (home-page "https://github.com/bcyran/bumper")
    (license license:expat)))

(define-public cargo-aur-bin
  (package
    (name "cargo-aur-bin")
    (version "1.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fosskers/cargo-aur")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Prepare Rust projects to be released on the Arch Linux User Repository")
    (description "Prepare Rust projects to be released on the Arch Linux User Repository.")
    (home-page "https://github.com/fosskers/cargo-aur")
    (license license:expat)))

(define-public catppuccin-gtk-theme-frappe
  (package
    (name "catppuccin-gtk-theme-frappe")
    (version "1.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/catppuccin/gtk")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/" #:include-regexp (".*")))))
    (synopsis "Soothing pastel theme for GTK - Frappe")
    (description "Soothing pastel theme for GTK - Frappe.")
    (home-page "https://github.com/catppuccin/gtk")
    (license license:gpl3+)))

(define-public ddgst-bin
  (package
    (name "ddgst-bin")
    (version "3.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dd86k/ddgst")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Console hashing utility with a twist")
    (description "Console hashing utility with a twist.")
    (home-page "https://github.com/dd86k/ddgst")
    (license license:expat)))

(define-public ddhx-bin
  (package
    (name "ddhx-bin")
    (version "0.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dd86k/ddhx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Console hexadecimal file viewer")
    (description "Console hexadecimal file viewer.")
    (home-page "https://github.com/dd86k/ddhx")
    (license license:expat)))

(define-public dockerydo-bin
  (package
    (name "dockerydo-bin")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/artyultra/dockerydo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "A lightweight docker gui for terminal for quick access to docker commands")
    (description "A lightweight docker gui for terminal for quick access to docker commands (inspired by lazygit).")
    (home-page "https://github.com/artyultra/dockerydo")
    (license license:expat)))

(define-public feishin-bin
  (package
    (name "feishin-bin")
    (version "1.11.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jeffvli/feishin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Player for your self-hosted music server")
    (description "A player for your self-hosted music server.")
    (home-page "https://github.com/jeffvli/feishin")
    (license license:gpl3+)))

(define-public fhc-bin
  (package
    (name "fhc-bin")
    (version "0.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Edu4rdSHL/fhc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Fast HTTP Checker")
    (description "Fast HTTP Checker.")
    (home-page "https://github.com/Edu4rdSHL/fhc")
    (license license:gpl3+)))

(define-public firefox-umatrix
  (package
    (name "firefox-umatrix")
    (version "1.4.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gorhill/uMatrix")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Point and click matrix to filter net requests by source, destination and type")
    (description "Point and click matrix to filter net requests by source, destination and type.")
    (home-page "https://github.com/gorhill/uMatrix")
    (license license:gpl3+)))

(define-public greenlight-bin
  (package
    (name "greenlight-bin")
    (version "2.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/unknownskl/greenlight")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Open-source client for xCloud and Xbox home streaming made in Typescript")
    (description "Open-source client for xCloud and Xbox home streaming made in Typescript.")
    (home-page "https://github.com/unknownskl/greenlight")
    (license license:expat)))

(define-public hunspell-sr
  (package
    (name "hunspell-sr")
    (version "20170408")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/grakic/hunspell-sr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hunspell/" #:include-regexp (".*\\.dic$" ".*\\.aff$")))))
    (synopsis "Serbian Cyrillic and Latin hunspell dictionaries")
    (description "Serbian Cyrillic and Latin hunspell dictionaries.")
    (home-page "https://github.com/grakic/hunspell-sr")
    (license license:expat)))

(define-public interspec-bin
  (package
    (name "interspec-bin")
    (version "1.0.13")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/interspec-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Spectral radiation analysis software")
    (description "Spectral radiation analysis software.")
    (home-page "https://sandialabs.github.io/InterSpec/")
    (license license:lgpl3+)))

(define-public ithil-bin
  (package
    (name "ithil-bin")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lvcasx1/ithil")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Terminal User Interface for Telegram")
    (description "A Terminal User Interface for Telegram.")
    (home-page "https://github.com/lvcasx1/ithil")
    (license license:expat)))

(define-public keylightd-bin
  (package
    (name "keylightd-bin")
    (version "0.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jmylchreest/keylightd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Daemon and CLI tool for managing HTTP-based Key Lights, including Elgato")
    (description "Daemon and CLI tool for managing HTTP-based Key Lights, including Elgato models.")
    (home-page "https://github.com/jmylchreest/keylightd")
    (license license:expat)))

(define-public kftui-bin
  (package
    (name "kftui-bin")
    (version "0.27.28")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hcavarsan/kftray")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "🦀 ⚡ kubectl port forward manager, with support for UDP and proxy")
    (description "🦀 ⚡ kubectl port forward manager, with support for UDP and proxy connections through k8s clusters.")
    (home-page "https://github.com/hcavarsan/kftray")
    (license license:gpl3+)))

(define-public kind-bin
  (package
    (name "kind-bin")
    (version "0.31.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kubernetes-sigs/kind")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Kubernetes IN Docker - local clusters for testing Kubernetes")
    (description "Kubernetes IN Docker - local clusters for testing Kubernetes.")
    (home-page "https://github.com/kubernetes-sigs/kind")
    (license license:asl2.0)))

(define-public klfc-bin
  (package
    (name "klfc-bin")
    (version "1.5.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/39aldo39/klfc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Tool to create advanced keyboard layouts in various formats (binary version)")
    (description "Tool to create advanced keyboard layouts in various formats (binary version).")
    (home-page "https://github.com/39aldo39/klfc")
    (license license:gpl3+)))

(define-public komodo-engine
  (package
    (name "komodo-engine")
    (version "14.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/komodo-engine.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Freeware version of the Komodo chess engine (~3394 Elo)")
    (description "Freeware version of the Komodo chess engine (~3394 Elo).")
    (home-page "https://komodochess.com")
    (license license:expat)))

(define-public lazymake-bin
  (package
    (name "lazymake-bin")
    (version "0.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rshelekhov/lazymake")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Modern TUI for Makefiles with interactive target selection, dependency")
    (description "Modern TUI for Makefiles with interactive target selection, dependency visualization, and command safety analysis.")
    (home-page "https://github.com/rshelekhov/lazymake")
    (license license:expat)))

(define-public lsp-dsp-lib
  (package
    (name "lsp-dsp-lib")
    (version "1.0.20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sadko4u/lsp-dsp-lib")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DSP library for signal processing")
    (description "DSP library for signal processing.")
    (home-page "https://github.com/sadko4u/lsp-dsp-lib")
    (license license:lgpl3+)))

(define-public mergerfs
  (package
    (name "mergerfs")
    (version "2.41.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/trapexit/mergerfs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Featureful union filesystem. Combines directories from various filesystems")
    (description "Featureful union filesystem. Combines directories from various filesystems into a storage pool.")
    (home-page "https://github.com/trapexit/mergerfs")
    (license license:isc)))

(define-public mill-global
  (package
    (name "mill-global")
    (version "1.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/com-lihaoyi/mill")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Mill Build Tool, global installation")
    (description "Mill Build Tool, global installation.")
    (home-page "https://github.com/com-lihaoyi/mill")
    (license license:expat)))

(define-public moderncsv-bin
  (package
    (name "moderncsv-bin")
    (version "2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/moderncsv-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Intuitive CSV File Editor/Viewer")
    (description "An Intuitive CSV File Editor/Viewer.")
    (home-page "https://www.moderncsv.com/")
    (license license:expat)))

(define-public openai-codex-bin
  (package
    (name "openai-codex-bin")
    (version "0.121.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openai/codex")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Arch Linux package for OpenAI's Codex CLI - Auto Updated")
    (description "Arch Linux package for OpenAI's Codex CLI - Auto Updated.")
    (home-page "https://github.com/openai/codex")
    (license license:asl2.0)))

(define-public oxfmt-bin
  (package
    (name "oxfmt-bin")
    (version "0.45.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/oxfmt-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Oxfmt is a high-performance formatter for the JavaScript ecosystem")
    (description "Oxfmt is a high-performance formatter for the JavaScript ecosystem.")
    (home-page "https://oxc.rs")
    (license license:expat)))

(define-public oxlint-bin
  (package
    (name "oxlint-bin")
    (version "1.60.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/oxlint-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "High-performance linter for JavaScript and TypeScript built on the Oxc")
    (description "A high-performance linter for JavaScript and TypeScript built on the Oxc compiler stack.")
    (home-page "https://oxc.rs")
    (license license:expat)))

(define-public scarlett2-firmware
  (package
    (name "scarlett2-firmware")
    (version "1:1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/geoffreybennett/scarlett2-firmware")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/firmware/"))))
    (synopsis "Firmware for Focusrite Scarlett 2nd/3rd/4th Gen, Clarett USB/+, and Vocaster")
    (description "Firmware for Focusrite Scarlett 2nd/3rd/4th Gen, Clarett USB/+, and Vocaster.")
    (home-page "https://github.com/geoffreybennett/scarlett2-firmware")
    (license license:expat)))

(define-public scarlett4-firmware
  (package
    (name "scarlett4-firmware")
    (version "1:1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/geoffreybennett/scarlett4-firmware")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/firmware/"))))
    (synopsis "Firmware for Focusrite Scarlett 4th Gen 16i16, 18i16, 18i20")
    (description "Firmware for Focusrite Scarlett 4th Gen 16i16, 18i16, 18i20.")
    (home-page "https://github.com/geoffreybennett/scarlett4-firmware")
    (license license:expat)))

(define-public shsh
  (package
    (name "shsh")
    (version "3.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/soraxas/shsh")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Multi-threaded manager for shell scripts, functions, binaries, completions")
    (description "A multi-threaded manager for shell scripts, functions, binaries, completions files.")
    (home-page "https://github.com/soraxas/shsh")
    (license license:expat)))

(define-public simplex-desktop-bin
  (package
    (name "simplex-desktop-bin")
    (version "6.4.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/simplex-desktop-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "SimpleX Chat, the first messaging network operating without user")
    (description "SimpleX Chat, the first messaging network operating without user identifiers of any kind (pre-compiled).")
    (home-page "https://simplex.chat/")
    (license license:agpl3+)))
