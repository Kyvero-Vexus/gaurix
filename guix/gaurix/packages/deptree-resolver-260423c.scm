;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260423c
;;; Resolves 100 BLOCKED/FAILED packages via dependency-tree priority.
;;;
;;; New recipes (100):
;;;      1.  httpdirfs-git (meson-build-system, vr603.b274dd8-1, license:gpl3+)
;;;      2.  libcanberra-gtk2 (gnu-build-system, v1:0.30+r2+gc0620e4-5, license:lgpl3+)
;;;      3.  iup (gnu-build-system, v3.32-1, license:expat)
;;;      4.  texlive-installer (copy-build-system, v2026-1, license:gpl3+)
;;;      5.  nvidia-580xx-utils (copy-build-system, v580.142-2, license:non-copyleft)
;;;      6.  lib32-wayland-git (meson-build-system, v1.23.92.r4.g9018703-1, license:expat)
;;;      7.  android-sdk-platform-tools (copy-build-system, v37.0.0-1, license:non-copyleft)
;;;      8.  electron40-bin (copy-build-system, v40.9.1-1, (list license:non-copyleft license:expat))
;;;      9.  qqc2-desktop-style-git (gnu-build-system, v6.25.0.r3.gf5e1e5b-1, license:lgpl3+)
;;;     10.  yay (go-build-system, v12.5.7-1, license:gpl3+)
;;;     11.  apple-fonts (font-build-system, v7.0.5-1, license:non-copyleft)
;;;     12.  arm-linux-gnueabihf-linux-api-headers (gnu-build-system, v6.15.1-1, license:gpl2)
;;;     13.  i686-elf-pcc-libs-git (gnu-build-system, v20250703-1, license:non-copyleft)
;;;     14.  makemkv-libaacs (copy-build-system, v1:1-3, license:non-copyleft)
;;;     15.  electron13-bin (copy-build-system, v13.6.9-2, (list license:non-copyleft license:expat))
;;;     16.  intel-ipu6-dkms-git (copy-build-system, vr247.9766e2181-1, license:gpl2)
;;;     17.  lib32-libudev0-shim (gnu-build-system, v2-1, license:lgpl2.1+)
;;;     18.  chromaprint-fftw (cmake-build-system, v1.6.0-1, license:gpl2+)
;;;     19.  lib32-libindicator-gtk2 (gnu-build-system, v12.10.1-11, license:gpl3)
;;;     20.  python-deltachat-rpc-client-git (gnu-build-system, v2.48.0.r0.g24b21c058-1, license:mpl2.0)
;;;     21.  system-tools-backends (gnu-build-system, v2.10.2-5, license:gpl3+)
;;;     22.  vesktop (node-build-system, v1.6.5-1, license:gpl3)
;;;     23.  arm-linux-gnueabihf-binutils (gnu-build-system, v2.45+r8+g09be88bfb653-1, (list license:non-copyleft license:gpl2+ license:gpl3+ license:lgpl3+))
;;;     24.  immuarch-core-git (gnu-build-system, v0.2.0.r271.6a4a7d0-1, license:gpl3+)
;;;     25.  libxnvctrl-340xx (gnu-build-system, v340.108-2, license:gpl2)
;;;     26.  python-opentelemetry-exporter-otlp-proto-http (gnu-build-system, v1.40.0-1, license:asl2.0)
;;;     27.  gr-foo-git (cmake-build-system, vr169.cc8bfc6-1, license:gpl3)
;;;     28.  python-opentelemetry-exporter-otlp-proto-grpc (gnu-build-system, v1.40.0-1, license:asl2.0)
;;;     29.  mcpelauncher-linux (cmake-build-system, v1.7.4-1, license:gpl3)
;;;     30.  wemeet-bin (copy-build-system, v3.26.10.401-1, license:non-copyleft)
;;;     31.  electron30 (gnu-build-system, v30.5.1-4, (list license:bsd-3 license:expat))
;;;     32.  1password-cli (copy-build-system, v2.33.1-1, license:non-copyleft)
;;;     33.  aic94xx-firmware (copy-build-system, v30-10, license:non-copyleft)
;;;     34.  alhp-keyring (copy-build-system, v20250509-1, license:gpl3+)
;;;     35.  ast-firmware (copy-build-system, v501-1, license:non-copyleft)
;;;     36.  chromium-gost (copy-build-system, v142.0.7444.176-1, license:expat)
;;;     37.  edk2-ovmf-fedora (copy-build-system, v20260213-1, (list license:asl2.0 license:non-copyleft license:expat))
;;;     38.  freedom (copy-build-system, v20190110.1-1, license:gpl3)
;;;     39.  hbuilderx-bin (copy-build-system, v1:4.85.2025110510-2, license:non-copyleft)
;;;     40.  kraken_desktop (copy-build-system, v1.11.2-1, license:non-copyleft)
;;;     41.  ktlint-compose-rules (copy-build-system, v0.5.7-1, license:asl2.0)
;;;     42.  lib32-amdgpu-pro-oglp (copy-build-system, v25.10_2202160-1, license:non-copyleft)
;;;     43.  logviewer-bin (copy-build-system, v0.1.18-1, license:gpl3+)
;;;     44.  mchose-ace68-udev (copy-build-system, v1.0.0-1, license:gpl3+)
;;;     45.  meocloud-cli (copy-build-system, v0.2.29beta-1, license:non-copyleft)
;;;     46.  mingw-w64-environment (copy-build-system, v1-7, license:bsd-3)
;;;     47.  navicat17-premium-en (copy-build-system, v17.3.8-1, license:non-copyleft)
;;;     48.  nrfutil (copy-build-system, v8.1.1-1, license:non-copyleft)
;;;     49.  ocr-fonts (font-build-system, v0.3.1-1, license:non-copyleft)
;;;     50.  omarchy (copy-build-system, v0.0.0-2, license:expat)
;;;     51.  overte-appimage (copy-build-system, v2025.12.1-1, license:asl2.0)
;;;     52.  packettracer (copy-build-system, v9.0.0-1, license:non-copyleft)
;;;     53.  pacman-log-orphans-hook (copy-build-system, v1.1-2, license:gpl3+)
;;;     54.  pragmatapro-fonts (font-build-system, v1:0.903-1, license:non-copyleft)
;;;     55.  publii (copy-build-system, v0.47.5-1, license:expat)
;;;     56.  questpatcher-bin (copy-build-system, v2.10.0-2, license:zlib)
;;;     57.  rutoken-pkcs11 (copy-build-system, v2.18.1.0-1, license:non-copyleft)
;;;     58.  shiftfs-lts-dkms (copy-build-system, v20220120-1, license:gpl2)
;;;     59.  soundfont-opl3-fm-128m (font-build-system, v1.0-1, license:non-copyleft)
;;;     60.  subtitleedit-avalonia (copy-build-system, v1:5.0.0.beta16-1, license:expat)
;;;     61.  throne-bin (copy-build-system, v1.1.2-2, license:gpl3)
;;;     62.  ttf-aptos (font-build-system, v1.1-0, license:non-copyleft)
;;;     63.  ttf-hanazono (font-build-system, v20170904-5, license:non-copyleft)
;;;     64.  ttf-heuristica (font-build-system, v1.0.2-5, license:non-copyleft)
;;;     65.  ttf-ms-office365 (font-build-system, v16.0.18925.20050-1, license:non-copyleft)
;;;     66.  ttf-ubuntu-sans-mono (font-build-system, v1.006-1, license:non-copyleft)
;;;     67.  uuplugin-bin (copy-build-system, v10.8.4-1, license:non-copyleft)
;;;     68.  verus-bin (copy-build-system, v0.2026.04.12.f1166c4-1, license:expat)
;;;     69.  vex-tui-bin (copy-build-system, v2.0.2-1, license:expat)
;;;     70.  vmware-keymaps (copy-build-system, v1.0-3, license:non-copyleft)
;;;     71.  whisper.cpp-model-large-v3-turbo (copy-build-system, v4-4, license:expat)
;;;     72.  wps-office-mui-zh-cn (copy-build-system, v12.1.2.25882-1, license:non-copyleft)
;;;     73.  xemu-bin (copy-build-system, v0.8.134-1, license:gpl2)
;;;     74.  xp-pen-tablet (copy-build-system, v4.0.13-251226, license:non-copyleft)
;;;     75.  xr-passthrough-layer-git (go-build-system, vr26.dfa8de0-1, license:expat)
;;;     76.  acroread-fonts-systemwide (font-build-system, v1:DC_2023.008.20421-1, license:non-copyleft)
;;;     77.  alephone-phoenix (copy-build-system, v1.4-2, license:non-copyleft)
;;;     78.  alhp-mirrorlist (gnu-build-system, v20260324-1, license:gpl2+)
;;;     79.  amneziawg-tools (copy-build-system, v1.0.20260223-1, license:gpl2)
;;;     80.  aocc (gnu-build-system, v5.1.0-1, license:non-copyleft)
;;;     81.  autojump (copy-build-system, v22.5.3-11, license:gpl3)
;;;     82.  bbg (copy-build-system, v20260324-1, license:unlicense)
;;;     83.  bibata-cursor-theme (gnu-build-system, v2.0.7-1, license:gpl3+)
;;;     84.  binder_linux-dkms (copy-build-system, v6.19-2, license:gpl3)
;;;     85.  bluevein-bin (copy-build-system, v1.0.2-1, license:gpl3)
;;;     86.  brother-mfc-9970cdw (copy-build-system, v1.1.1-5, license:non-copyleft)
;;;     87.  catppuccin-konsole-theme-git (gnu-build-system, vr30.3b64040-1, license:expat)
;;;     88.  celeste-bin (copy-build-system, v1.4.0.0-3, license:non-copyleft)
;;;     89.  checkmake-bin (copy-build-system, v0.3.2-1, license:expat)
;;;     90.  chromium-vencord-bin (copy-build-system, v1.14.7-1, license:gpl3)
;;;     91.  clion-cmake (gnu-build-system, v1:2026.1-1, license:non-copyleft)
;;;     92.  clion-gdb (gnu-build-system, v1:2026.1-1, license:non-copyleft)
;;;     93.  clion-jre (gnu-build-system, v1:2026.1-1, license:non-copyleft)
;;;     94.  clion-lldb (gnu-build-system, v1:2026.1-1, license:non-copyleft)
;;;     95.  clipse (gnu-build-system, v1.2.1-1, license:gpl3+)
;;;     96.  codex-acp (copy-build-system, v0.10.0-1, license:asl2.0)
;;;     97.  corefreq-dkms (copy-build-system, v2.1.0-1, license:gpl2)
;;;     98.  coreos-installer (cargo-build-system, v0.25.0-1, license:asl2.0)
;;;     99.  data-peek-bin (copy-build-system, v0.20.1-1, license:expat)
;;;    100.  easytax-ag-2024 (copy-build-system, v1.2-1, license:non-copyleft)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless obtained from PKGBUILD.
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages deptree-resolver-260423c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:export (
            httpdirfs-git
            libcanberra-gtk2
            iup
            texlive-installer
            nvidia-580xx-utils
            lib32-wayland-git
            android-sdk-platform-tools
            electron40-bin
            qqc2-desktop-style-git
            yay
            apple-fonts
            arm-linux-gnueabihf-linux-api-headers
            i686-elf-pcc-libs-git
            makemkv-libaacs
            electron13-bin
            intel-ipu6-dkms-git
            lib32-libudev0-shim
            chromaprint-fftw
            lib32-libindicator-gtk2
            python-deltachat-rpc-client-git
            system-tools-backends
            vesktop
            arm-linux-gnueabihf-binutils
            immuarch-core-git
            libxnvctrl-340xx
            python-opentelemetry-exporter-otlp-proto-http
            gr-foo-git
            python-opentelemetry-exporter-otlp-proto-grpc
            mcpelauncher-linux
            wemeet-bin
            electron30
            pkg-1password-cli
            aic94xx-firmware
            alhp-keyring
            ast-firmware
            chromium-gost
            edk2-ovmf-fedora
            freedom
            hbuilderx-bin
            kraken-desktop
            ktlint-compose-rules
            lib32-amdgpu-pro-oglp
            logviewer-bin
            mchose-ace68-udev
            meocloud-cli
            mingw-w64-environment
            navicat17-premium-en
            nrfutil
            ocr-fonts
            omarchy
            overte-appimage
            packettracer
            pacman-log-orphans-hook
            pragmatapro-fonts
            publii
            questpatcher-bin
            rutoken-pkcs11
            shiftfs-lts-dkms
            soundfont-opl3-fm-128m
            subtitleedit-avalonia
            throne-bin
            ttf-aptos
            ttf-hanazono
            ttf-heuristica
            ttf-ms-office365
            ttf-ubuntu-sans-mono
            uuplugin-bin
            verus-bin
            vex-tui-bin
            vmware-keymaps
            whisper.cpp-model-large-v3-turbo
            wps-office-mui-zh-cn
            xemu-bin
            xp-pen-tablet
            xr-passthrough-layer-git
            acroread-fonts-systemwide
            alephone-phoenix
            alhp-mirrorlist
            amneziawg-tools
            aocc
            autojump
            bbg
            bibata-cursor-theme
            binder-linux-dkms
            bluevein-bin
            brother-mfc-9970cdw
            catppuccin-konsole-theme-git
            celeste-bin
            checkmake-bin
            chromium-vencord-bin
            clion-cmake
            clion-gdb
            clion-jre
            clion-lldb
            clipse
            codex-acp
            corefreq-dkms
            coreos-installer
            data-peek-bin
            easytax-ag-2024
            ))

;;; -------------------------------------------------------------------
;;; 2174. httpdirfs-git --- a filesystem which allows you to mount HTTP directory listings
;;; -------------------------------------------------------------------
(define-public httpdirfs-git
  (package
    (name "httpdirfs-git")
    (version "r603.b274dd8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fangfufu/httpdirfs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a filesystem which allows you to mount HTTP directory listings")
    (description "A filesystem which allows you to mount HTTP directory listings.")
    (home-page "https://github.com/fangfufu/httpdirfs")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8493. libcanberra-gtk2 --- a small and lightweight implementation of the XDG Sound Theme Specification
;;; -------------------------------------------------------------------
(define-public libcanberra-gtk2
  (package
    (name "libcanberra-gtk2")
    (version "0.30+r2+gc0620e4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://0pointer.net/lennart/projects/libcanberra//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a small and lightweight implementation of the XDG Sound Theme Specification")
    (description "A small and lightweight implementation of the XDG Sound Theme Specification.")
    (home-page "https://0pointer.net/lennart/projects/libcanberra/")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 15267. iup --- c cross platform GUI toolkit
;;; -------------------------------------------------------------------
(define-public iup
  (package
    (name "iup")
    (version "3.32")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.tecgraf.puc-rio.br/iup//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "c cross platform GUI toolkit")
    (description "C cross platform GUI toolkit.")
    (home-page "https://www.tecgraf.puc-rio.br/iup/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8013. texlive-installer --- this packages provides the installer of texlive. It also tricks Arch into thi...
;;; -------------------------------------------------------------------
(define-public texlive-installer
  (package
    (name "texlive-installer")
    (version "2026")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.tug.org/texlive//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "this packages provides the installer of texlive. It also tricks Arch into thi...")
    (description "This packages provides the installer of texlive. It also tricks Arch into thinking it has its texlive packages installed.")
    (home-page "http://www.tug.org/texlive/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11316. nvidia-580xx-utils --- NVIDIA drivers utilities (580xx)
;;; -------------------------------------------------------------------
(define-public nvidia-580xx-utils
  (package
    (name "nvidia-580xx-utils")
    (version "580.142")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.nvidia.com/XFree86/Linux-x86_64/" version "/${_pkg}.run"))
              (sha256
               (base32 "be99ff3def641bb900c2486cce96530394c5dc60548fc4642f19d3a4c784134d"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA drivers utilities (580xx)")
    (description "NVIDIA drivers utilities (580xx).")
    (home-page "http://www.nvidia.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 16154. lib32-wayland-git --- a computer display server protocol (32-bit, development version)
;;; -------------------------------------------------------------------
(define-public lib32-wayland-git
  (package
    (name "lib32-wayland-git")
    (version "1.23.92.r4.g9018703")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://wayland.freedesktop.org")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a computer display server protocol (32-bit, development version)")
    (description "A computer display server protocol (32-bit, development version).")
    (home-page "https://wayland.freedesktop.org")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2246. android-sdk-platform-tools --- platform-Tools for Google Android SDK (adb and fastboot)
;;; -------------------------------------------------------------------
(define-public android-sdk-platform-tools
  (package
    (name "android-sdk-platform-tools")
    (version "37.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://developer.android.com/sdk/index.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "platform-Tools for Google Android SDK (adb and fastboot)")
    (description "Platform-Tools for Google Android SDK (adb and fastboot).")
    (home-page "http://developer.android.com/sdk/index.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11361. electron40-bin --- build cross platform desktop apps with web technologies — prebuilt
;;; -------------------------------------------------------------------
(define-public electron40-bin
  (package
    (name "electron40-bin")
    (version "40.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://electronjs.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "build cross platform desktop apps with web technologies — prebuilt")
    (description "Build cross platform desktop apps with web technologies — prebuilt.")
    (home-page "https://electronjs.org")
    (license (list license:non-copyleft license:expat))))

;;; -------------------------------------------------------------------
;;; 5786. qqc2-desktop-style-git --- a style for Qt Quick Controls 2 to make it follow your desktop theme
;;; -------------------------------------------------------------------
(define-public qqc2-desktop-style-git
  (package
    (name "qqc2-desktop-style-git")
    (version "6.25.0.r3.gf5e1e5b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://invent.kde.org/frameworks/qqc2-desktop-style")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a style for Qt Quick Controls 2 to make it follow your desktop theme")
    (description "A style for Qt Quick Controls 2 to make it follow your desktop theme.")
    (home-page "https://invent.kde.org/frameworks/qqc2-desktop-style")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 21311. yay --- yet another yogurt. Pacman wrapper and AUR helper written in go
;;; -------------------------------------------------------------------
(define-public yay
  (package
    (name "yay")
    (version "12.5.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Jguer/yay/archive/v" version ".tar.gz"))
              (sha256
               (base32 "b483a6b99cba19250e874414a7d55f0d0c518b9c735b7d64dd354b51151bd465"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/Jguer/yay"))
    (synopsis "yet another yogurt. Pacman wrapper and AUR helper written in go")
    (description "Yet another yogurt. Pacman wrapper and AUR helper written in go.")
    (home-page "https://github.com/Jguer/yay")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11638. apple-fonts --- fonts for Apple platforms, including San Francisco and New York typefaces
;;; -------------------------------------------------------------------
(define-public apple-fonts
  (package
    (name "apple-fonts")
    (version "7.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.apple.com/fonts//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fonts for Apple platforms, including San Francisco and New York typefaces")
    (description "Fonts for Apple platforms, including San Francisco and New York typefaces.")
    (home-page "https://developer.apple.com/fonts/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8451. arm-linux-gnueabihf-linux-api-headers --- kernel headers sanitized for use in userspace
;;; -------------------------------------------------------------------
(define-public arm-linux-gnueabihf-linux-api-headers
  (package
    (name "arm-linux-gnueabihf-linux-api-headers")
    (version "6.15.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://kernel.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "kernel headers sanitized for use in userspace")
    (description "Kernel headers sanitized for use in userspace.")
    (home-page "https://kernel.org/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 7160. i686-elf-pcc-libs-git --- libraries for the Portable C Compiler
;;; -------------------------------------------------------------------
(define-public i686-elf-pcc-libs-git
  (package
    (name "i686-elf-pcc-libs-git")
    (version "20250703")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PortableCC/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "libraries for the Portable C Compiler")
    (description "Libraries for the Portable C Compiler.")
    (home-page "https://github.com/PortableCC/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7083. makemkv-libaacs --- enable libaacs emulation from MakeMKV
;;; -------------------------------------------------------------------
(define-public makemkv-libaacs
  (package
    (name "makemkv-libaacs")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.makemkv.com/forum2/viewtopic.php?f=3&t=7009/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enable libaacs emulation from MakeMKV")
    (description "Enable libaacs emulation from MakeMKV.")
    (home-page "http://www.makemkv.com/forum2/viewtopic.php?f=3&t=7009")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 17245. electron13-bin --- build cross platform desktop apps with web technologies - binary version 13
;;; -------------------------------------------------------------------
(define-public electron13-bin
  (package
    (name "electron13-bin")
    (version "13.6.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://electronjs.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "build cross platform desktop apps with web technologies - binary version 13")
    (description "Build cross platform desktop apps with web technologies - binary version 13.")
    (home-page "https://electronjs.org")
    (license (list license:non-copyleft license:expat))))

;;; -------------------------------------------------------------------
;;; 5821. intel-ipu6-dkms-git --- intel IPU6 camera drivers (DKMS)
;;; -------------------------------------------------------------------
(define-public intel-ipu6-dkms-git
  (package
    (name "intel-ipu6-dkms-git")
    (version "r247.9766e2181")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/intel/ipu6-drivers")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "intel IPU6 camera drivers (DKMS)")
    (description "Intel IPU6 camera drivers (DKMS).")
    (home-page "https://github.com/intel/ipu6-drivers")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 171. lib32-libudev0-shim --- libudev.so.0 compatibility library for systems with newer udev versions (32 bit)
;;; -------------------------------------------------------------------
(define-public lib32-libudev0-shim
  (package
    (name "lib32-libudev0-shim")
    (version "2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/archlinux/libudev0-shim/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "libudev.so.0 compatibility library for systems with newer udev versions (32 bit)")
    (description "Libudev.so.0 compatibility library for systems with newer udev versions (32 bit).")
    (home-page "https://github.com/archlinux/libudev0-shim")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 344. chromaprint-fftw --- library for extracting fingerprints from any audio source (uses fftw for FFT ...
;;; -------------------------------------------------------------------
(define-public chromaprint-fftw
  (package
    (name "chromaprint-fftw")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/acoustid/chromaprint/archive/v" version "/chromaprint-" version ".tar.gz"))
              (sha256
               (base32 "65bfce4a35b2e673dbcda917b6aa577e2f145cf805243d19e6a50fea2a520c2a"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "library for extracting fingerprints from any audio source (uses fftw for FFT ...")
    (description "Library for extracting fingerprints from any audio source (uses fftw for FFT calculations instead of ffmpeg).")
    (home-page "https://acoustid.org/chromaprint")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 174. lib32-libindicator-gtk2 --- set of symbols and convenience functions for Ayatana indicators (GTK+ 2 libra...
;;; -------------------------------------------------------------------
(define-public lib32-libindicator-gtk2
  (package
    (name "lib32-libindicator-gtk2")
    (version "12.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://launchpad.net/libindicator/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "set of symbols and convenience functions for Ayatana indicators (GTK+ 2 libra...")
    (description "Set of symbols and convenience functions for Ayatana indicators (GTK+ 2 library, 32-bit).")
    (home-page "https://launchpad.net/libindicator")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7174. python-deltachat-rpc-client-git --- python client for Delta Chat core JSON-RPC interface (development version)
;;; -------------------------------------------------------------------
(define-public python-deltachat-rpc-client-git
  (package
    (name "python-deltachat-rpc-client-git")
    (version "2.48.0.r0.g24b21c058")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chatmail/core/tree/main/deltachat-rpc-client")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "python client for Delta Chat core JSON-RPC interface (development version)")
    (description "Python client for Delta Chat core JSON-RPC interface (development version).")
    (home-page "https://github.com/chatmail/core/tree/main/deltachat-rpc-client")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 5557. system-tools-backends --- backends for Gnome/MATE System Tools
;;; -------------------------------------------------------------------
(define-public system-tools-backends
  (package
    (name "system-tools-backends")
    (version "2.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://system-tools-backends.freedesktop.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "backends for Gnome/MATE System Tools")
    (description "Backends for Gnome/MATE System Tools.")
    (home-page "http://system-tools-backends.freedesktop.org/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11360. vesktop --- a standalone Electron-based Discord app with Vencord & improved Linux support
;;; -------------------------------------------------------------------
(define-public vesktop
  (package
    (name "vesktop")
    (version "1.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Vencord/Vesktop/archive/v" version ".tar.gz"))
              (sha256
               (base32 "4bb9b5e1acaf17a5f145931008fe4015f9b8c1116b769e1a55a68d5483f238fc"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a standalone Electron-based Discord app with Vencord & improved Linux support")
    (description "A standalone Electron-based Discord app with Vencord & improved Linux support.")
    (home-page "https://github.com/Vencord/Vesktop")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 23347. arm-linux-gnueabihf-binutils --- a set of programs to assemble and manipulate binary and object files
;;; -------------------------------------------------------------------
(define-public arm-linux-gnueabihf-binutils
  (package
    (name "arm-linux-gnueabihf-binutils")
    (version "2.45+r8+g09be88bfb653")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.gnu.org/software/binutils//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a set of programs to assemble and manipulate binary and object files")
    (description "A set of programs to assemble and manipulate binary and object files.")
    (home-page "https://www.gnu.org/software/binutils/")
    (license (list license:non-copyleft license:gpl2+ license:gpl3+ license:lgpl3+))))

;;; -------------------------------------------------------------------
;;; 5991. immuarch-core-git --- immutable Archlinux setup with transactional & atomic updates
;;; -------------------------------------------------------------------
(define-public immuarch-core-git
  (package
    (name "immuarch-core-git")
    (version "0.2.0.r271.6a4a7d0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://framagit.org/Brumaire/immuarch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "immutable Archlinux setup with transactional & atomic updates")
    (description "Immutable Archlinux setup with transactional & atomic updates.")
    (home-page "https://framagit.org/Brumaire/immuarch")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5796. libxnvctrl-340xx --- NVIDIA NV-CONTROL X extension, 340xx legacy branch
;;; -------------------------------------------------------------------
(define-public libxnvctrl-340xx
  (package
    (name "libxnvctrl-340xx")
    (version "340.108")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/NVIDIA/nvidia-settings/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "NVIDIA NV-CONTROL X extension, 340xx legacy branch")
    (description "NVIDIA NV-CONTROL X extension, 340xx legacy branch.")
    (home-page "https://github.com/NVIDIA/nvidia-settings")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 2148. python-opentelemetry-exporter-otlp-proto-http --- openTelemetry Collector Protobuf over HTTP Exporter
;;; -------------------------------------------------------------------
(define-public python-opentelemetry-exporter-otlp-proto-http
  (package
    (name "python-opentelemetry-exporter-otlp-proto-http")
    (version "1.40.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/open-telemetry/opentelemetry-python/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "openTelemetry Collector Protobuf over HTTP Exporter")
    (description "OpenTelemetry Collector Protobuf over HTTP Exporter.")
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 5876. gr-foo-git --- gnuradio custom blocks by bastibl. Latest git checkout
;;; -------------------------------------------------------------------
(define-public gr-foo-git
  (package
    (name "gr-foo-git")
    (version "r169.cc8bfc6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bastibl/gr-foo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "gnuradio custom blocks by bastibl. Latest git checkout")
    (description "Gnuradio custom blocks by bastibl. Latest git checkout.")
    (home-page "https://github.com/bastibl/gr-foo")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 2149. python-opentelemetry-exporter-otlp-proto-grpc --- openTelemetry Collector Protobuf over gRPC Exporter
;;; -------------------------------------------------------------------
(define-public python-opentelemetry-exporter-otlp-proto-grpc
  (package
    (name "python-opentelemetry-exporter-otlp-proto-grpc")
    (version "1.40.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/open-telemetry/opentelemetry-python/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "openTelemetry Collector Protobuf over gRPC Exporter")
    (description "OpenTelemetry Collector Protobuf over gRPC Exporter.")
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 5779. mcpelauncher-linux --- minecraft: Pocket Edition launcher for Linux
;;; -------------------------------------------------------------------
(define-public mcpelauncher-linux
  (package
    (name "mcpelauncher-linux")
    (version "1.7.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/minecraft-linux/mcpelauncher-manifest/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "minecraft: Pocket Edition launcher for Linux")
    (description "Minecraft: Pocket Edition launcher for Linux.")
    (home-page "https://github.com/minecraft-linux/mcpelauncher-manifest")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 1325. wemeet-bin --- tencent Video Conferencing, tencent meeting 腾讯会议
;;; -------------------------------------------------------------------
(define-public wemeet-bin
  (package
    (name "wemeet-bin")
    (version "3.26.10.401")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://updatecdn.meeting.qq.com/cos/${_x86_md5}/TencentMeeting_0300000000_" version "_x86_64_default.publish.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tencent Video Conferencing, tencent meeting 腾讯会议")
    (description "Tencent Video Conferencing, tencent meeting 腾讯会议.")
    (home-page "https://source.meeting.qq.com/download-center.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 19247. electron30 --- build cross platform desktop apps with web technologies
;;; -------------------------------------------------------------------
(define-public electron30
  (package
    (name "electron30")
    (version "30.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://electronjs.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "build cross platform desktop apps with web technologies")
    (description "Build cross platform desktop apps with web technologies.")
    (home-page "https://electronjs.org")
    (license (list license:bsd-3 license:expat))))

;;; -------------------------------------------------------------------
;;; 1852. 1password-cli --- 1Password command line tool
;;; -------------------------------------------------------------------
(define-public pkg-1password-cli
  (package
    (name "1password-cli")
    (version "2.33.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://app-updates.agilebits.com/product_history/CLI2/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "1Password command line tool")
    (description "1Password command line tool.")
    (home-page "https://app-updates.agilebits.com/product_history/CLI2")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1895. aic94xx-firmware --- adaptec SAS 44300, 48300, 58300 Sequencer Firmware for AIC94xx driver
;;; -------------------------------------------------------------------
(define-public aic94xx-firmware
  (package
    (name "aic94xx-firmware")
    (version "30")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://storage.microsemi.com/en-us/speed/scsi/linux/aic94xx-seq-30-1_tar_gz.php/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adaptec SAS 44300, 48300, 58300 Sequencer Firmware for AIC94xx driver")
    (description "Adaptec SAS 44300, 48300, 58300 Sequencer Firmware for AIC94xx driver.")
    (home-page "https://storage.microsemi.com/en-us/speed/scsi/linux/aic94xx-seq-30-1_tar_gz.php")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2291. alhp-keyring --- ALHP PGP keyring
;;; -------------------------------------------------------------------
(define-public alhp-keyring
  (package
    (name "alhp-keyring")
    (version "20250509")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/ALHP/alhp-keyring/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ALHP PGP keyring")
    (description "ALHP PGP keyring.")
    (home-page "https://somegit.dev/ALHP/alhp-keyring")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 1879. ast-firmware --- aspeed VGA module from the IPMI
;;; -------------------------------------------------------------------
(define-public ast-firmware
  (package
    (name "ast-firmware")
    (version "501")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.supermicro.com/support/faqs/faq.cfm?faq=26876/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aspeed VGA module from the IPMI")
    (description "Aspeed VGA module from the IPMI.")
    (home-page "https://www.supermicro.com/support/faqs/faq.cfm?faq=26876")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 757. chromium-gost --- chromium-Gost — веб-браузер с открытым исходным кодом на основе Chromium с по...
;;; -------------------------------------------------------------------
(define-public chromium-gost
  (package
    (name "chromium-gost")
    (version "142.0.7444.176")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/deemru/Chromium-Gost/releases/download/" version "/chromium-gost-" version "-linux-amd64.deb"))
              (sha256
               (base32 "f9dd962c65cdc4eb3bbb6ff766ea175dcf9fd5d5de8f374aaff24120880f1b93"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "chromium-Gost — веб-браузер с открытым исходным кодом на основе Chromium с по...")
    (description "Chromium-Gost — веб-браузер с открытым исходным кодом на основе Chromium с поддержкой криптографических алгоритмов ГОСТ при установке защищённых соединений через интерфейс msspi.")
    (home-page "https://github.com/deemru/Chromium-Gost")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8117. edk2-ovmf-fedora --- firmware for Virtual Machines (x86_64) with Secure Boot enabled — from Fedora 44
;;; -------------------------------------------------------------------
(define-public edk2-ovmf-fedora
  (package
    (name "edk2-ovmf-fedora")
    (version "20260213")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://packages.fedoraproject.org/pkgs/edk2/edk2-ovmf//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "firmware for Virtual Machines (x86_64) with Secure Boot enabled — from Fedora 44")
    (description "Firmware for Virtual Machines (x86_64) with Secure Boot enabled — from Fedora 44.")
    (home-page "https://packages.fedoraproject.org/pkgs/edk2/edk2-ovmf/")
    (license (list license:asl2.0 license:non-copyleft license:expat))))

;;; -------------------------------------------------------------------
;;; 16194. freedom --- this package conflicts with all non-free Arch packages, as defined by DFSG
;;; -------------------------------------------------------------------
(define-public freedom
  (package
    (name "freedom")
    (version "20190110.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.debian.org/social_contract#guidelines/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "this package conflicts with all non-free Arch packages, as defined by DFSG")
    (description "This package conflicts with all non-free Arch packages, as defined by DFSG.")
    (home-page "https://www.debian.org/social_contract#guidelines")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7166. hbuilderx-bin --- cli的用途是让开发者可以在linux服务器上调用HBuilderX cli，来实现程序化操作打包app、上传unicloud云函数。
;;; -------------------------------------------------------------------
(define-public hbuilderx-bin
  (package
    (name "hbuilderx-bin")
    (version "4.85.2025110510")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.dcloud.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cli的用途是让开发者可以在linux服务器上调用HBuilderX cli，来实现程序化操作打包app、上传unicloud云函数。")
    (description "Cli的用途是让开发者可以在linux服务器上调用HBuilderX cli，来实现程序化操作打包app、上传unicloud云函数。.")
    (home-page "https://www.dcloud.io")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2156. kraken_desktop --- kraken crypto exchange desktop application
;;; -------------------------------------------------------------------
(define-public kraken-desktop
  (package
    (name "kraken_desktop")
    (version "1.11.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.kraken.com/desktop/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kraken crypto exchange desktop application")
    (description "Kraken crypto exchange desktop application.")
    (home-page "https://www.kraken.com/desktop")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 14186. ktlint-compose-rules --- lint rules for ktlint/detekt aimed to contribute to a healthier usage of Comp...
;;; -------------------------------------------------------------------
(define-public ktlint-compose-rules
  (package
    (name "ktlint-compose-rules")
    (version "0.5.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mrmans0n/compose-rules/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lint rules for ktlint/detekt aimed to contribute to a healthier usage of Comp...")
    (description "Lint rules for ktlint/detekt aimed to contribute to a healthier usage of Compose. Actively maintained and evolved fork of the Twitter Compose rules.")
    (home-page "https://github.com/mrmans0n/compose-rules")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 5713. lib32-amdgpu-pro-oglp --- AMDGPU Pro OpenGL driver (32-bit)
;;; -------------------------------------------------------------------
(define-public lib32-amdgpu-pro-oglp
  (package
    (name "lib32-amdgpu-pro-oglp")
    (version "25.10_2202160")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-22-40/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AMDGPU Pro OpenGL driver (32-bit)")
    (description "AMDGPU Pro OpenGL driver (32-bit).")
    (home-page "https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-22-40")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5645. logviewer-bin --- CLI log client for multiple sources (Splunk, K8s, Docker, etc)
;;; -------------------------------------------------------------------
(define-public logviewer-bin
  (package
    (name "logviewer-bin")
    (version "0.1.18")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bascanada/logviewer/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI log client for multiple sources (Splunk, K8s, Docker, etc)")
    (description "CLI log client for multiple sources (Splunk, K8s, Docker, etc).")
    (home-page "https://github.com/bascanada/logviewer")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7934. mchose-ace68-udev --- udev rule for the Mchose Ace68 keyboard
;;; -------------------------------------------------------------------
(define-public mchose-ace68-udev
  (package
    (name "mchose-ace68-udev")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/packages/mchose-ace68-udev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "udev rule for the Mchose Ace68 keyboard")
    (description "Udev rule for the Mchose Ace68 keyboard.")
    (home-page "https://aur.archlinux.org/packages/mchose-ace68-udev")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8462. meocloud-cli --- cloud storage service and file synchronization service, command line
;;; -------------------------------------------------------------------
(define-public meocloud-cli
  (package
    (name "meocloud-cli")
    (version "0.2.29beta")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://meocloud.pt/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cloud storage service and file synchronization service, command line")
    (description "Cloud storage service and file synchronization service, command line.")
    (home-page "https://meocloud.pt")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11244. mingw-w64-environment --- script providing common environment variables and functions for MinGW (mingw-...
;;; -------------------------------------------------------------------
(define-public mingw-w64-environment
  (package
    (name "mingw-w64-environment")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://fedoraproject.org/wiki/MinGW/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "script providing common environment variables and functions for MinGW (mingw-...")
    (description "Script providing common environment variables and functions for MinGW (mingw-w64).")
    (home-page "http://fedoraproject.org/wiki/MinGW")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 7996. navicat17-premium-en --- manage and Develop Your Databases
;;; -------------------------------------------------------------------
(define-public navicat17-premium-en
  (package
    (name "navicat17-premium-en")
    (version "17.3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.navicat.com/en/products/navicat-premium/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "manage and Develop Your Databases")
    (description "Manage and Develop Your Databases.")
    (home-page "https://www.navicat.com/en/products/navicat-premium")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8445. nrfutil --- unified command line utility for Nordic products
;;; -------------------------------------------------------------------
(define-public nrfutil
  (package
    (name "nrfutil")
    (version "8.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.nordicsemi.com/Products/Development-tools/nRF-Util/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unified command line utility for Nordic products")
    (description "Unified command line utility for Nordic products.")
    (home-page "https://www.nordicsemi.com/Products/Development-tools/nRF-Util")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8005. ocr-fonts --- free versions of OCR-A and OCR-B fonts
;;; -------------------------------------------------------------------
(define-public ocr-fonts
  (package
    (name "ocr-fonts")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://tsukurimashou.org/ocr.php.en/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free versions of OCR-A and OCR-B fonts")
    (description "Free versions of OCR-A and OCR-B fonts.")
    (home-page "https://tsukurimashou.org/ocr.php.en")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 16143. omarchy --- opinionated Arch/Hyprland Setup By DHH — Placeholder until official release
;;; -------------------------------------------------------------------
(define-public omarchy
  (package
    (name "omarchy")
    (version "0.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://omarchy.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "opinionated Arch/Hyprland Setup By DHH — Placeholder until official release")
    (description "Opinionated Arch/Hyprland Setup By DHH — Placeholder until official release.")
    (home-page "https://omarchy.org")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8476. overte-appimage --- overte open source virtual worlds platform
;;; -------------------------------------------------------------------
(define-public overte-appimage
  (package
    (name "overte-appimage")
    (version "2025.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/overte-org/overte/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "overte open source virtual worlds platform")
    (description "Overte open source virtual worlds platform.")
    (home-page "https://github.com/overte-org/overte")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 1886. packettracer --- a cross-platform visual simulation tool designed by Cisco Systems that allows...
;;; -------------------------------------------------------------------
(define-public packettracer
  (package
    (name "packettracer")
    (version "9.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.netacad.com/resources/lab-downloads/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform visual simulation tool designed by Cisco Systems that allows...")
    (description "A cross-platform visual simulation tool designed by Cisco Systems that allows users to create network topologies and imitate modern computer network.")
    (home-page "https://www.netacad.com/resources/lab-downloads")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2309. pacman-log-orphans-hook --- hook to check whether there are any packages marked as unrequired (orphans) v...
;;; -------------------------------------------------------------------
(define-public pacman-log-orphans-hook
  (package
    (name "pacman-log-orphans-hook")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/packages/pacman-log-orphans-hook/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hook to check whether there are any packages marked as unrequired (orphans) v...")
    (description "Hook to check whether there are any packages marked as unrequired (orphans) via pacman -Qttdq after every pacman run.")
    (home-page "https://aur.archlinux.org/packages/pacman-log-orphans-hook")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7941. pragmatapro-fonts --- a condensed monospaced font optimized for screen, designed by Fabrizio Schiav...
;;; -------------------------------------------------------------------
(define-public pragmatapro-fonts
  (package
    (name "pragmatapro-fonts")
    (version "0.903")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://fsd.it/shop/fonts/pragmatapro//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a condensed monospaced font optimized for screen, designed by Fabrizio Schiav...")
    (description "A condensed monospaced font optimized for screen, designed by Fabrizio Schiavi to be the ideal font for coding, math and engineering.")
    (home-page "https://fsd.it/shop/fonts/pragmatapro/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7863. publii --- publii is a desktop-based CMS for Windows, Mac and Linux that makes creating ...
;;; -------------------------------------------------------------------
(define-public publii
  (package
    (name "publii")
    (version "0.47.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/GetPublii/Publii/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "publii is a desktop-based CMS for Windows, Mac and Linux that makes creating ...")
    (description "Publii is a desktop-based CMS for Windows, Mac and Linux that makes creating static websites fast and hassle-free, even for beginners.")
    (home-page "https://github.com/GetPublii/Publii")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5976. questpatcher-bin --- generic il2cpp modding tool for Oculus Quest (1/2/3) apps
;;; -------------------------------------------------------------------
(define-public questpatcher-bin
  (package
    (name "questpatcher-bin")
    (version "2.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Lauriethefish/QuestPatcher/releases/download/" version "/QuestPatcher-ubuntu.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "generic il2cpp modding tool for Oculus Quest (1/2/3) apps")
    (description "Generic il2cpp modding tool for Oculus Quest (1/2/3) apps.")
    (home-page "https://github.com/Lauriethefish/QuestPatcher")
    (license license:zlib)))

;;; -------------------------------------------------------------------
;;; 7123. rutoken-pkcs11 --- интерфейс RSALabs PKCS#11
;;; -------------------------------------------------------------------
(define-public rutoken-pkcs11
  (package
    (name "rutoken-pkcs11")
    (version "2.18.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.rutoken.ru/support/download/pkcs//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "интерфейс RSALabs PKCS#11")
    (description "Интерфейс RSALabs PKCS#11.")
    (home-page "https://www.rutoken.ru/support/download/pkcs/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7943. shiftfs-lts-dkms --- linux kernel module that provides a kernel filesystem for uid/gid shifting; d...
;;; -------------------------------------------------------------------
(define-public shiftfs-lts-dkms
  (package
    (name "shiftfs-lts-dkms")
    (version "20220120")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/jammy/log/fs/shiftfs.c?h=master-next/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "linux kernel module that provides a kernel filesystem for uid/gid shifting; d...")
    (description "Linux kernel module that provides a kernel filesystem for uid/gid shifting; dkms version for 5.15.x and 5.16.x kernels.")
    (home-page "https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/jammy/log/fs/shiftfs.c?h=master-next")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17171. soundfont-opl3-fm-128m --- a SoundFont designed to simulate the classic MIDI sound of the Sound Blaster ...
;;; -------------------------------------------------------------------
(define-public soundfont-opl3-fm-128m
  (package
    (name "soundfont-opl3-fm-128m")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://zandro.freeunixhost.com/opl3//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a SoundFont designed to simulate the classic MIDI sound of the Sound Blaster ...")
    (description "A SoundFont designed to simulate the classic MIDI sound of the Sound Blaster 16 (and other YM262 enabled hardware).")
    (home-page "http://zandro.freeunixhost.com/opl3/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1892. subtitleedit-avalonia --- an advanced subtitle editor and converter (beta build with Avalonia UI)
;;; -------------------------------------------------------------------
(define-public subtitleedit-avalonia
  (package
    (name "subtitleedit-avalonia")
    (version "5.0.0.beta16")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SubtitleEdit/subtitleedit/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an advanced subtitle editor and converter (beta build with Avalonia UI)")
    (description "An advanced subtitle editor and converter (beta build with Avalonia UI).")
    (home-page "https://github.com/SubtitleEdit/subtitleedit")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2299. throne-bin --- cross-platform GUI proxy utility (Empowered by sing-box)
;;; -------------------------------------------------------------------
(define-public throne-bin
  (package
    (name "throne-bin")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/throneproj/Throne/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform GUI proxy utility (Empowered by sing-box)")
    (description "Cross-platform GUI proxy utility (Empowered by sing-box).")
    (home-page "https://github.com/throneproj/Throne")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8037. ttf-aptos --- the new default Microsoft 365 font, used by Microsoft
;;; -------------------------------------------------------------------
(define-public ttf-aptos
  (package
    (name "ttf-aptos")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/font-list/aptos/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the new default Microsoft 365 font, used by Microsoft")
    (description "The new default Microsoft 365 font, used by Microsoft.")
    (home-page "https://learn.microsoft.com/en-us/typography/font-list/aptos")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 43366. ttf-hanazono --- a free Japanese kanji font, which contains about 78,685 characters (and 2 SPA...
;;; -------------------------------------------------------------------
(define-public ttf-hanazono
  (package
    (name "ttf-hanazono")
    (version "20170904")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://glyphwiki.org/hanazono//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free Japanese kanji font, which contains about 78,685 characters (and 2 SPA...")
    (description "A free Japanese kanji font, which contains about 78,685 characters (and 2 SPACEs) defined in ISO/IEC 10646 standard / the Unicode standard.")
    (home-page "https://glyphwiki.org/hanazono/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5644. ttf-heuristica --- a serif latin & cyrillic font, derived from the "Adobe Utopia" font by Apanov
;;; -------------------------------------------------------------------
(define-public ttf-heuristica
  (package
    (name "ttf-heuristica")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sourceforge.net/projects/heuristica//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a serif latin & cyrillic font, derived from the "Adobe Utopia" font by Apanov")
    (description "A serif latin & cyrillic font, derived from the \"Adobe Utopia\" font by Apanov.")
    (home-page "https://sourceforge.net/projects/heuristica/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 16018. ttf-ms-office365 --- microsoft (Office) 365 TrueType fonts
;;; -------------------------------------------------------------------
(define-public ttf-ms-office365
  (package
    (name "ttf-ms-office365")
    (version "16.0.18925.20050")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/?PID=164/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft (Office) 365 TrueType fonts")
    (description "Microsoft (Office) 365 TrueType fonts.")
    (home-page "https://learn.microsoft.com/en-us/typography/?PID=164")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5725. ttf-ubuntu-sans-mono --- ubuntu Sans Mono Font Family
;;; -------------------------------------------------------------------
(define-public ttf-ubuntu-sans-mono
  (package
    (name "ttf-ubuntu-sans-mono")
    (version "1.006")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/canonical/Ubuntu-Sans-Mono-fonts/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ubuntu Sans Mono Font Family")
    (description "Ubuntu Sans Mono Font Family.")
    (home-page "https://github.com/canonical/Ubuntu-Sans-Mono-fonts")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7085. uuplugin-bin --- UU Steam Deck Plugin for General Linux
;;; -------------------------------------------------------------------
(define-public uuplugin-bin
  (package
    (name "uuplugin-bin")
    (version "10.8.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://uu.163.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "UU Steam Deck Plugin for General Linux")
    (description "UU Steam Deck Plugin for General Linux.")
    (home-page "https://uu.163.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7075. verus-bin --- verified Rust for low-level systems code
;;; -------------------------------------------------------------------
(define-public verus-bin
  (package
    (name "verus-bin")
    (version "0.2026.04.12.f1166c4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/verus-lang/verus/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "verified Rust for low-level systems code")
    (description "Verified Rust for low-level systems code.")
    (home-page "https://github.com/verus-lang/verus")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5582. vex-tui-bin --- a beautiful, fast, and feature-rich terminal-based Excel and CSV viewer
;;; -------------------------------------------------------------------
(define-public vex-tui-bin
  (package
    (name "vex-tui-bin")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/CodeOne45/vex-tui/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a beautiful, fast, and feature-rich terminal-based Excel and CSV viewer")
    (description "A beautiful, fast, and feature-rich terminal-based Excel and CSV viewer.")
    (home-page "https://github.com/CodeOne45/vex-tui")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 1805. vmware-keymaps --- keymaps required by some VMware packages
;;; -------------------------------------------------------------------
(define-public vmware-keymaps
  (package
    (name "vmware-keymaps")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.vmware.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "keymaps required by some VMware packages")
    (description "Keymaps required by some VMware packages.")
    (home-page "https://www.vmware.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1659. whisper.cpp-model-large-v3-turbo --- this is an autogenerated file, please see https://github.com/hrehfeld/archlin...
;;; -------------------------------------------------------------------
(define-public whisper.cpp-model-large-v3-turbo
  (package
    (name "whisper.cpp-model-large-v3-turbo")
    (version "4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ggerganov/whisper.cpp/tree/master/models/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/archlin...")
    (description "This is an autogenerated file, please see https://github.com/hrehfeld/archlinux-whisper.cpp-model.")
    (home-page "https://github.com/ggerganov/whisper.cpp/tree/master/models")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 162. wps-office-mui-zh-cn --- chinese (Simplified) mui package for WPS Office
;;; -------------------------------------------------------------------
(define-public wps-office-mui-zh-cn
  (package
    (name "wps-office-mui-zh-cn")
    (version "12.1.2.25882")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://linux.wps.cn/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "chinese (Simplified) mui package for WPS Office")
    (description "Chinese (Simplified) mui package for WPS Office.")
    (home-page "https://linux.wps.cn")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8395. xemu-bin --- emulator for the original Xbox console
;;; -------------------------------------------------------------------
(define-public xemu-bin
  (package
    (name "xemu-bin")
    (version "0.8.134")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://xemu.app/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "emulator for the original Xbox console")
    (description "Emulator for the original Xbox console.")
    (home-page "https://xemu.app")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 8082. xp-pen-tablet --- XP-Pen (Official) Linux utility (New UI driver)
;;; -------------------------------------------------------------------
(define-public xp-pen-tablet
  (package
    (name "xp-pen-tablet")
    (version "4.0.13")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.xp-pen.com/download/index.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "XP-Pen (Official) Linux utility (New UI driver)")
    (description "XP-Pen (Official) Linux utility (New UI driver).")
    (home-page "https://www.xp-pen.com/download/index.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 12741. xr-passthrough-layer-git --- a OpenXR API layer adding camera passthrough support
;;; -------------------------------------------------------------------
(define-public xr-passthrough-layer-git
  (package
    (name "xr-passthrough-layer-git")
    (version "r26.dfa8de0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "git+https://github.com/yshui/xr_passthrough_layer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "573331a74bb4454886400871eb262faac0f63344b7be6d11b5f48cc7c2cb6685"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/yshui/xr_passthrough_layer"))
    (synopsis "a OpenXR API layer adding camera passthrough support")
    (description "A OpenXR API layer adding camera passthrough support.")
    (home-page "https://github.com/yshui/xr_passthrough_layer")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8419. acroread-fonts-systemwide --- fonts from Adobe Acrobat Reader DC
;;; -------------------------------------------------------------------
(define-public acroread-fonts-systemwide
  (package
    (name "acroread-fonts-systemwide")
    (version "DC_2023.008.20421")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://helpx.adobe.com/acrobat/kb/windows-font-packs-32-bit-reader.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fonts from Adobe Acrobat Reader DC")
    (description "Fonts from Adobe Acrobat Reader DC.")
    (home-page "https://helpx.adobe.com/acrobat/kb/windows-font-packs-32-bit-reader.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5812. alephone-phoenix --- a 35-level single player major conversion
;;; -------------------------------------------------------------------
(define-public alephone-phoenix
  (package
    (name "alephone-phoenix")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://simplici7y.com/items/marathon-phoenix-2/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a 35-level single player major conversion")
    (description "A 35-level single player major conversion.")
    (home-page "http://simplici7y.com/items/marathon-phoenix-2")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2290. alhp-mirrorlist --- ALHP mirror list for use by pacman
;;; -------------------------------------------------------------------
(define-public alhp-mirrorlist
  (package
    (name "alhp-mirrorlist")
    (version "20260324")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/ALHP/alhp-mirrorlist/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "ALHP mirror list for use by pacman")
    (description "ALHP mirror list for use by pacman.")
    (home-page "https://somegit.dev/ALHP/alhp-mirrorlist")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 2192. amneziawg-tools --- amneziaWG is a contemporary version of the popular VPN protocol, WireGuard
;;; -------------------------------------------------------------------
(define-public amneziawg-tools
  (package
    (name "amneziawg-tools")
    (version "1.0.20260223")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/amnezia-vpn/amneziawg-tools/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "amneziaWG is a contemporary version of the popular VPN protocol, WireGuard")
    (description "AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard.")
    (home-page "https://github.com/amnezia-vpn/amneziawg-tools")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 7103. aocc --- AMD Optimizing C/C++ Compiler
;;; -------------------------------------------------------------------
(define-public aocc
  (package
    (name "aocc")
    (version "5.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.amd.com/en/developer/aocc.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "AMD Optimizing C/C++ Compiler")
    (description "AMD Optimizing C/C++ Compiler.")
    (home-page "https://www.amd.com/en/developer/aocc.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 9493. autojump --- a faster way to navigate your filesystem from the command line
;;; -------------------------------------------------------------------
(define-public autojump
  (package
    (name "autojump")
    (version "22.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/wting/autojump/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a faster way to navigate your filesystem from the command line")
    (description "A faster way to navigate your filesystem from the command line.")
    (home-page "https://github.com/wting/autojump")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 16759. bbg --- a static blog generator built with electron
;;; -------------------------------------------------------------------
(define-public bbg
  (package
    (name "bbg")
    (version "20260324")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bbg-contributors/bbg/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a static blog generator built with electron")
    (description "A static blog generator built with electron.")
    (home-page "https://github.com/bbg-contributors/bbg")
    (license license:unlicense)))

;;; -------------------------------------------------------------------
;;; 9471. bibata-cursor-theme --- material Based Cursor Theme
;;; -------------------------------------------------------------------
(define-public bibata-cursor-theme
  (package
    (name "bibata-cursor-theme")
    (version "2.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ful1e5/Bibata_Cursor/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "material Based Cursor Theme")
    (description "Material Based Cursor Theme.")
    (home-page "https://github.com/ful1e5/Bibata_Cursor")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2168. binder_linux-dkms --- android kernel driver fork by @choff in DKMS format, binder only
;;; -------------------------------------------------------------------
(define-public binder-linux-dkms
  (package
    (name "binder_linux-dkms")
    (version "6.19")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/choff/anbox-modules/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "android kernel driver fork by @choff in DKMS format, binder only")
    (description "Android kernel driver fork by @choff in DKMS format, binder only.")
    (home-page "https://github.com/choff/anbox-modules")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 6011. bluevein-bin --- bluetooth dual-boot key synchronization service (precompiled binary)
;;; -------------------------------------------------------------------
(define-public bluevein-bin
  (package
    (name "bluevein-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/meowrch/BlueVein/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bluetooth dual-boot key synchronization service (precompiled binary)")
    (description "Bluetooth dual-boot key synchronization service (precompiled binary).")
    (home-page "https://github.com/meowrch/BlueVein")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7969. brother-mfc-9970cdw --- LPR and CUPS driver for the Brother MFC-9970CDW
;;; -------------------------------------------------------------------
(define-public brother-mfc-9970cdw
  (package
    (name "brother-mfc-9970cdw")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://solutions.brother.com/linux/en_us//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LPR and CUPS driver for the Brother MFC-9970CDW")
    (description "LPR and CUPS driver for the Brother MFC-9970CDW.")
    (home-page "http://solutions.brother.com/linux/en_us/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8698. catppuccin-konsole-theme-git --- soothing pastel theme for Konsole
;;; -------------------------------------------------------------------
(define-public catppuccin-konsole-theme-git
  (package
    (name "catppuccin-konsole-theme-git")
    (version "r30.3b64040")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/catppuccin/konsole")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "soothing pastel theme for Konsole")
    (description "Soothing pastel theme for Konsole.")
    (home-page "https://github.com/catppuccin/konsole")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7139. celeste-bin --- super-tight hand-crafted 2D platformer
;;; -------------------------------------------------------------------
(define-public celeste-bin
  (package
    (name "celeste-bin")
    (version "1.4.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.celestegame.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "super-tight hand-crafted 2D platformer")
    (description "Super-tight hand-crafted 2D platformer.")
    (home-page "http://www.celestegame.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5868. checkmake-bin --- linter/analyzer for Makefiles
;;; -------------------------------------------------------------------
(define-public checkmake-bin
  (package
    (name "checkmake-bin")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/checkmake/checkmake/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "linter/analyzer for Makefiles")
    (description "Linter/analyzer for Makefiles.")
    (home-page "https://github.com/checkmake/checkmake")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8437. chromium-vencord-bin --- the cutest Discord client mod (unpacked webextension)
;;; -------------------------------------------------------------------
(define-public chromium-vencord-bin
  (package
    (name "chromium-vencord-bin")
    (version "1.14.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://vencord.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the cutest Discord client mod (unpacked webextension)")
    (description "The cutest Discord client mod (unpacked webextension).")
    (home-page "https://vencord.dev")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 1899. clion-cmake --- jetBrains packaged CMake tools for CLion
;;; -------------------------------------------------------------------
(define-public clion-cmake
  (package
    (name "clion-cmake")
    (version "2026.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.jetbrains.com/clion/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "jetBrains packaged CMake tools for CLion")
    (description "JetBrains packaged CMake tools for CLion.")
    (home-page "http://www.jetbrains.com/clion")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1898. clion-gdb --- jetBrains packaged GNU Debugger for CLion
;;; -------------------------------------------------------------------
(define-public clion-gdb
  (package
    (name "clion-gdb")
    (version "2026.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.jetbrains.com/clion/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "jetBrains packaged GNU Debugger for CLion")
    (description "JetBrains packaged GNU Debugger for CLion.")
    (home-page "http://www.jetbrains.com/clion")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1897. clion-jre --- jetBrains custom Java Runtime for CLion (Recommended)
;;; -------------------------------------------------------------------
(define-public clion-jre
  (package
    (name "clion-jre")
    (version "2026.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/JetBrains/JetBrainsRuntime/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "jetBrains custom Java Runtime for CLion (Recommended)")
    (description "JetBrains custom Java Runtime for CLion (Recommended).")
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1896. clion-lldb --- jetBrains packaged LLVM Debugger for CLion
;;; -------------------------------------------------------------------
(define-public clion-lldb
  (package
    (name "clion-lldb")
    (version "2026.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.jetbrains.com/clion/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "jetBrains packaged LLVM Debugger for CLion")
    (description "JetBrains packaged LLVM Debugger for CLion.")
    (home-page "http://www.jetbrains.com/clion")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 160. clipse --- a configurable TUI clipboard manager for Unix, built for wayland
;;; -------------------------------------------------------------------
(define-public clipse
  (package
    (name "clipse")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/savedra1/clipse/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a configurable TUI clipboard manager for Unix, built for wayland")
    (description "A configurable TUI clipboard manager for Unix, built for wayland.")
    (home-page "https://github.com/savedra1/clipse")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2194. codex-acp --- ACP adapter for OpenAI Codex
;;; -------------------------------------------------------------------
(define-public codex-acp
  (package
    (name "codex-acp")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/zed-industries/codex-acp/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ACP adapter for OpenAI Codex")
    (description "ACP adapter for OpenAI Codex.")
    (home-page "https://github.com/zed-industries/codex-acp")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 16106. corefreq-dkms --- coreFreq - kernel module sources
;;; -------------------------------------------------------------------
(define-public corefreq-dkms
  (package
    (name "corefreq-dkms")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/cyring/CoreFreq/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "coreFreq - kernel module sources")
    (description "CoreFreq - kernel module sources.")
    (home-page "https://github.com/cyring/CoreFreq")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 784. coreos-installer --- installer for CoreOS disk images
;;; -------------------------------------------------------------------
(define-public coreos-installer
  (package
    (name "coreos-installer")
    (version "0.25.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/coreos/coreos-installer/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "4a62a06c4eb3ec443bb30f135338e034da206793881425fe43f0343ec90649f2"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "installer for CoreOS disk images")
    (description "Installer for CoreOS disk images.")
    (home-page "https://github.com/coreos/coreos-installer")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 5583. data-peek-bin --- a minimal, fast SQL client desktop application for developers
;;; -------------------------------------------------------------------
(define-public data-peek-bin
  (package
    (name "data-peek-bin")
    (version "0.20.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.datapeek.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a minimal, fast SQL client desktop application for developers")
    (description "A minimal, fast SQL client desktop application for developers.")
    (home-page "https://www.datapeek.dev")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13607. easytax-ag-2024 --- aargau tax declaration software
;;; -------------------------------------------------------------------
(define-public easytax-ag-2024
  (package
    (name "easytax-ag-2024")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.ag.ch/de/dfr/steuern/natuerliche_personen/steuererklaerung__easytax/steuererklaerung_easytax1.jsp/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aargau tax declaration software")
    (description "Aargau tax declaration software.")
    (home-page "https://www.ag.ch/de/dfr/steuern/natuerliche_personen/steuererklaerung__easytax/steuererklaerung_easytax1.jsp")
    (license license:non-copyleft)))
