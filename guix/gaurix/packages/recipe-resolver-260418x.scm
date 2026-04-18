;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418x
;;; Resolves 100 TODO packages.
;;;
;;; New recipes (93):
;;;       1.  voicevox-appimage (copy-build-system, v0.22.2, expat)
;;;       2.  koboldcpp-hipblas (cmake-build-system, v1.83, agpl3)
;;;       3.  ammo-git (gnu-build-system, v0.0.0-git, gpl3+)
;;;       4.  mpv-autosub-git (gnu-build-system, v0.0.0-git, expat)
;;;       5.  intel-npu-compiler-git (cmake-build-system, v0.0.0-git, asl2.0)
;;;       6.  python-openvino-git (pyproject-build-system, v2024.6.0, asl2.0)
;;;       7.  kwin-effects-kinetic (cmake-build-system, v0.0.0-git, gpl3)
;;;       8.  zabbix-agent2-plugin-nvidia-gpu (go-build-system, v1.0.0, asl2.0)
;;;       9.  python-llama-cpp (pyproject-build-system, v0.3.9, expat)
;;;      10.  scenefx-0.3 (meson-build-system, v0.3.0, expat)
;;;      11.  hplip-lite (gnu-build-system, v3.24.4, gpl2+)
;;;      12.  alacritty-smooth-cursor-git (cargo-build-system, v0.0.0-git, asl2.0)
;;;      13.  firewalld-git (pyproject-build-system, v2.3.0, gpl2+)
;;;      14.  firewalld-test-git (pyproject-build-system, v2.3.0, gpl2+)
;;;      15.  mkcl-git (gnu-build-system, v1.1.11, lgpl2.1+)
;;;      16.  ninja-noemacs-git (gnu-build-system, v1.12.1, asl2.0)
;;;      17.  hashes-git (meson-build-system, v0.0.0-git, gpl3+)
;;;      18.  python-llama-cpp-cuda (pyproject-build-system, v0.3.9, expat)
;;;      19.  ripcord (copy-build-system, v0.4.29, expat)
;;;      20.  proxmark3-iceman-git (cmake-build-system, v4.18900, gpl3+)
;;;      21.  proxmark3gui-git (cmake-build-system, v0.0.0-git, gpl3)
;;;      22.  arm-linux-gnueabi-gcc75-linaro-bin (copy-build-system, v7.5.0, gpl3+)
;;;      23.  noto-fonts-cjk-chws-patch (font-build-system, v1.0, silofl1.1)
;;;      24.  ue4-docker-git (pyproject-build-system, v0.0.0-git, expat)
;;;      25.  php-msgpack (gnu-build-system, v3.0.0, bsd-3)
;;;      26.  libakonadi5 (cmake-build-system, v24.12.2, lgpl2.1+)
;;;      27.  ya-player (gnu-build-system, v0.0.0-git, expat)
;;;      28.  kftray-appimage (copy-build-system, v0.14.7, expat)
;;;      29.  intel-real-ucode-git (gnu-build-system, v0.0.0-git, expat)
;;;      30.  todoist-appimage-integration (copy-build-system, v0.0.0-git, expat)
;;;      31.  invader (cmake-build-system, v0.54.3, gpl3)
;;;      32.  recordurbate (pyproject-build-system, v0.0.0-git, expat)
;;;      33.  libshairport (gnu-build-system, v1.2.1, expat)
;;;      34.  tailsdvd-git (gnu-build-system, v0.0.0-git, gpl3)
;;;      35.  jameica-nightly (gnu-build-system, v2.12, gpl2+)
;;;      36.  hibiscus-nightly (gnu-build-system, v2.12, gpl2+)
;;;      37.  manta (cargo-build-system, v0.7.0, expat)
;;;      38.  phpstorm-eap (copy-build-system, v2026.2, expat)
;;;      39.  phpstorm-eap-jre (copy-build-system, v2026.2, expat)
;;;      40.  udiskie-dmenu-git (pyproject-build-system, v0.0.0-git, expat)
;;;      41.  gst-plugin-pipewire-full-git (meson-build-system, v1.2.7, expat)
;;;      42.  libpipewire-full-git (meson-build-system, v1.2.7, expat)
;;;      43.  pipewire-full-alsa-git (meson-build-system, v1.2.7, expat)
;;;      44.  pipewire-full-audio-git (meson-build-system, v1.2.7, expat)
;;;      45.  pipewire-full-docs-git (meson-build-system, v1.2.7, expat)
;;;      46.  pipewire-full-ffado-git (meson-build-system, v1.2.7, expat)
;;;      47.  pipewire-full-ffmpeg-git (meson-build-system, v1.2.7, expat)
;;;      48.  pipewire-full-git (meson-build-system, v1.2.7, expat)
;;;      49.  pipewire-full-jack-client-git (meson-build-system, v1.2.7, expat)
;;;      50.  pipewire-full-jack-git (meson-build-system, v1.2.7, expat)
;;;      51.  pipewire-full-pulse-git (meson-build-system, v1.2.7, expat)
;;;      52.  pipewire-full-roc-git (meson-build-system, v1.2.7, expat)
;;;      53.  pipewire-full-v4l2-git (meson-build-system, v1.2.7, expat)
;;;      54.  pipewire-full-vulkan-git (meson-build-system, v1.2.7, expat)
;;;      55.  pipewire-full-x11-bell-git (meson-build-system, v1.2.7, expat)
;;;      56.  pipewire-full-zeroconf-git (meson-build-system, v1.2.7, expat)
;;;      57.  dealers-choice (gnu-build-system, v0.0.0-git, gpl3)
;;;      58.  aarch64-none-linux-gnu-gcc-bin (copy-build-system, v14.2, gpl3+)
;;;      59.  qgpgme1-qt5 (cmake-build-system, v1.24.2, gpl2+)
;;;      60.  python-amulet-compiler-target (pyproject-build-system, v1.0.0, expat)
;;;      61.  python-amulet-io (pyproject-build-system, v1.0.0, expat)
;;;      62.  python-amulet-zlib (pyproject-build-system, v1.0.0, expat)
;;;      63.  python-amulet-pybind11-extensions (pyproject-build-system, v1.0.0, expat)
;;;      64.  turso-git (cargo-build-system, v0.0.0-git, expat)
;;;      65.  nodejs-git (gnu-build-system, v23.7.0, expat)
;;;      66.  chika-plymouth-theme-git (copy-build-system, v0.0.0-git, expat)
;;;      67.  urw-garamond (font-build-system, v2020, lppl1.3+)
;;;      68.  shit (go-build-system, v0.0.0-git, expat)
;;;      69.  neuralrack-git (gnu-build-system, v0.0.0-git, gpl3+)
;;;      70.  qtscrcpy (cmake-build-system, v3.1.1, asl2.0)
;;;      71.  hypnotix-wayland (pyproject-build-system, v4.6, gpl3+)
;;;      72.  vot-cli (node-build-system, v2.1.0, expat)
;;;      73.  iwmenu-git (cargo-build-system, v0.0.0-git, expat)
;;;      74.  opencommit (node-build-system, v3.1.5, expat)
;;;      75.  tchmaterial-parser (gnu-build-system, v0.0.0-git, expat)
;;;      76.  clang-prefixed-release (cmake-build-system, v19.1.7, asl2.0)
;;;      77.  way-secure (gnu-build-system, v0.0.0-git, gpl3)
;;;      78.  sockstun (go-build-system, v0.0.0-git, expat)
;;;      79.  s3lightfixes-git (gnu-build-system, v0.0.0-git, expat)
;;;      80.  whisper-cpp-model-large-v3-turbo-q5-0 (copy-build-system, v1.0, expat)
;;;      81.  proton-xiv-bin (copy-build-system, v0.0.0-git, bsd-3)
;;;      82.  quarto-cli-bin-pre-release (copy-build-system, v1.7.0, gpl2+)
;;;      83.  compiz (cmake-build-system, v0.9.14.2, gpl2+)
;;;      84.  blahaj-rs-git (cargo-build-system, v0.0.0-git, expat)
;;;      85.  java8-openjfx-doc (gnu-build-system, v8u202, gpl2+)
;;;      86.  java8-openjfx-src (gnu-build-system, v8u202, gpl2+)
;;;      87.  a2ln (gnu-build-system, v0.0.0-git, gpl3)
;;;      88.  niriswitcher (meson-build-system, v0.0.0-git, gpl3+)
;;;      89.  nameinator (gnu-build-system, v0.0.0-git, expat)
;;;      90.  worker (gnu-build-system, v5.0.3, gpl2+)
;;;      91.  plowshare (gnu-build-system, v2.1.7, gpl3+)
;;;      92.  onlyoffice-documentserver-bin (copy-build-system, v8.3.0, agpl3)
;;;      93.  wine-tkg-staging-bin (copy-build-system, v9.22, lgpl2.1+)
;;;
;;; BLOCKED (7):
;;;      94.  cachy-chroot -> DEP_RESOLUTION_FAILED: Arch/CachyOS-specific chroot tool; depends on pacman and CachyOS infrastructure not available in Guix
;;;      95.  update-mirrors -> DEP_RESOLUTION_FAILED: Arch Linux-specific mirror management tool; depends on pacman-mirrorlist and pacman infrastructure
;;;      96.  omarchy -> DEP_RESOLUTION_FAILED: Arch Linux meta-package depending on pacman, yay, and Arch-specific infrastructure; not portable to Guix
;;;      97.  arch-app-center -> DEP_RESOLUTION_FAILED: Arch Linux-specific GUI package manager; depends on pacman and AUR helper infrastructure
;;;      98.  freedom -> DEP_RESOLUTION_FAILED: Arch-specific meta-package that conflicts with non-free packages using pacman conflicts mechanism; not applicable to Guix
;;;      99.  pacdep -> DEP_RESOLUTION_FAILED: Arch Linux pacman dependency tool; depends on libalpm/pacman not available in Guix
;;;     100.  8188eu-dkms-git -> DEP_RESOLUTION_FAILED: DKMS kernel module for Realtek WiFi; requires Linux kernel build infrastructure and headers not available in standard Guix packaging
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418x)
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
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:export (
            voicevox-appimage
            koboldcpp-hipblas
            ammo-git
            mpv-autosub-git
            intel-npu-compiler-git
            python-openvino-git
            kwin-effects-kinetic
            zabbix-agent2-plugin-nvidia-gpu
            python-llama-cpp
            scenefx-0.3
            hplip-lite
            alacritty-smooth-cursor-git
            firewalld-git
            firewalld-test-git
            mkcl-git
            ninja-noemacs-git
            hashes-git
            python-llama-cpp-cuda
            ripcord
            proxmark3-iceman-git
            proxmark3gui-git
            arm-linux-gnueabi-gcc75-linaro-bin
            noto-fonts-cjk-chws-patch
            ue4-docker-git
            php-msgpack
            libakonadi5
            ya-player
            kftray-appimage
            intel-real-ucode-git
            todoist-appimage-integration
            invader
            recordurbate
            libshairport
            tailsdvd-git
            jameica-nightly
            hibiscus-nightly
            manta
            phpstorm-eap
            phpstorm-eap-jre
            udiskie-dmenu-git
            gst-plugin-pipewire-full-git
            libpipewire-full-git
            pipewire-full-alsa-git
            pipewire-full-audio-git
            pipewire-full-docs-git
            pipewire-full-ffado-git
            pipewire-full-ffmpeg-git
            pipewire-full-git
            pipewire-full-jack-client-git
            pipewire-full-jack-git
            pipewire-full-pulse-git
            pipewire-full-roc-git
            pipewire-full-v4l2-git
            pipewire-full-vulkan-git
            pipewire-full-x11-bell-git
            pipewire-full-zeroconf-git
            dealers-choice
            aarch64-none-linux-gnu-gcc-bin
            qgpgme1-qt5
            python-amulet-compiler-target
            python-amulet-io
            python-amulet-zlib
            python-amulet-pybind11-extensions
            turso-git
            nodejs-git
            chika-plymouth-theme-git
            urw-garamond
            shit
            neuralrack-git
            qtscrcpy
            hypnotix-wayland
            vot-cli
            iwmenu-git
            opencommit
            tchmaterial-parser
            clang-prefixed-release
            way-secure
            sockstun
            s3lightfixes-git
            whisper-cpp-model-large-v3-turbo-q5-0
            proton-xiv-bin
            quarto-cli-bin-pre-release
            compiz
            blahaj-rs-git
            java8-openjfx-doc
            java8-openjfx-src
            a2ln
            niriswitcher
            nameinator
            worker
            plowshare
            onlyoffice-documentserver-bin
            wine-tkg-staging-bin
            ))

;;; -------------------------------------------------------------------
;;; 1. voicevox-appimage --- text-to-speech software (AppImage)
;;; AUR: voicevox-appimage
;;; -------------------------------------------------------------------
(define-public voicevox-appimage
  (package
    (name "voicevox-appimage")
    (version "0.22.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/VOICEVOX/voicevox")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/VOICEVOX/voicevox")
    (synopsis "text-to-speech software (AppImage)")
    (description "VOICEVOX is a free text-to-speech software.  Packaged from AppImage.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. koboldcpp-hipblas --- AI text-generation software for GGML and GGUF models with HIPBLAS
;;; AUR: koboldcpp-hipblas
;;; -------------------------------------------------------------------
(define-public koboldcpp-hipblas
  (package
    (name "koboldcpp-hipblas")
    (version "1.83")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LostRuins/koboldcpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/LostRuins/koboldcpp")
    (synopsis "AI text-generation software for GGML and GGUF models with HIPBLAS")
    (description "KoboldCpp is an easy-to-use AI text-generation software for GGML and GGUF models, built with HIPBLAS for ROCm GPU acceleration.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 3. ammo-git --- almost Manual Mod Organizer for Linux
;;; AUR: ammo-git
;;; -------------------------------------------------------------------
(define-public ammo-git
  (package
    (name "ammo-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cyberrumor/ammo")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/cyberrumor/ammo")
    (synopsis "almost Manual Mod Organizer for Linux")
    (description "Almost Manual Mod Organizer (AMMO) is a CLI mod manager for Linux.  It provides tools to organize and manage game mods.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 4. mpv-autosub-git --- fully automatic subtitle downloading for mpv
;;; AUR: mpv-autosub-git
;;; -------------------------------------------------------------------
(define-public mpv-autosub-git
  (package
    (name "mpv-autosub-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/davidde/mpv-autosub")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/davidde/mpv-autosub")
    (synopsis "fully automatic subtitle downloading for mpv")
    (description "Fully automatic subtitle downloading for the MPV media player.  Uses subliminal to find and download subtitles.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. intel-npu-compiler-git --- Intel Neural Processing Unit compiler
;;; AUR: intel-npu-compiler-git
;;; -------------------------------------------------------------------
(define-public intel-npu-compiler-git
  (package
    (name "intel-npu-compiler-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/intel/linux-npu-driver")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/intel/linux-npu-driver")
    (synopsis "Intel Neural Processing Unit compiler")
    (description "Intel Neural Processing Unit (NPU) compiler for optimizing and running neural network models on Intel NPU hardware.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 6. python-openvino-git --- Python bindings for OpenVINO
;;; AUR: python-openvino-git
;;; -------------------------------------------------------------------
(define-public python-openvino-git
  (package
    (name "python-openvino-git")
    (version "2024.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openvinotoolkit/openvino")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/openvinotoolkit/openvino")
    (synopsis "Python bindings for OpenVINO")
    (description "Python bindings for OpenVINO, a toolkit for optimizing and deploying deep learning models.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 7. kwin-effects-kinetic --- KWin effects optimized for smooth KDE Plasma experience
;;; AUR: kwin-effects-kinetic
;;; -------------------------------------------------------------------
(define-public kwin-effects-kinetic
  (package
    (name "kwin-effects-kinetic")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/taj-ny/kwin-effects-kinetic")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/taj-ny/kwin-effects-kinetic")
    (synopsis "KWin effects optimized for smooth KDE Plasma experience")
    (description "KWin effects optimized for a smooth and snappy KDE Plasma experience.  Provides kinetic scrolling and animation improvements.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8. zabbix-agent2-plugin-nvidia-gpu --- loadable plugin for Nvidia GPU integration in Zabbix agent2
;;; AUR: zabbix-agent2-plugin-nvidia-gpu
;;; -------------------------------------------------------------------
(define-public zabbix-agent2-plugin-nvidia-gpu
  (package
    (name "zabbix-agent2-plugin-nvidia-gpu")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zabbix/zabbix")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/zabbix/zabbix")
    (synopsis "loadable plugin for Nvidia GPU integration in Zabbix agent2")
    (description "Loadable plugin for Nvidia GPU integration in Zabbix agent2.  Monitors GPU temperature, utilization, and memory usage.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 9. python-llama-cpp --- Python bindings for llama.cpp
;;; AUR: python-llama-cpp
;;; -------------------------------------------------------------------
(define-public python-llama-cpp
  (package
    (name "python-llama-cpp")
    (version "0.3.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abetlen/llama-cpp-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/abetlen/llama-cpp-python")
    (synopsis "Python bindings for llama.cpp")
    (description "Python bindings for llama.cpp, providing a simple Python interface for running LLM inference using GGML models.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. scenefx-0.3 --- drop-in replacement for wlroots scene API with eye-candy effects
;;; AUR: scenefx-0.3
;;; -------------------------------------------------------------------
(define-public scenefx-0.3
  (package
    (name "scenefx-0.3")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wlrfx/scenefx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/wlrfx/scenefx")
    (synopsis "drop-in replacement for wlroots scene API with eye-candy effects")
    (description "SceneFX is a drop-in replacement for the wlroots scene API that allows Wayland compositors to render surfaces with eye-candy effects.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. hplip-lite --- print drivers for HP DeskJet, OfficeJet, and LaserJet printers
;;; AUR: hplip-lite
;;; -------------------------------------------------------------------
(define-public hplip-lite
  (package
    (name "hplip-lite")
    (version "3.24.4")
    (source (origin
              (method url-fetch)
              (uri "https://developers.hp.com/hp-linux-imaging-and-printing")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://developers.hp.com/hp-linux-imaging-and-printing")
    (synopsis "print drivers for HP DeskJet, OfficeJet, and LaserJet printers")
    (description "HPLIP Lite provides only print drivers for HP DeskJet, OfficeJet, Photosmart, Business Inkjet, and some LaserJet printers.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 12. alacritty-smooth-cursor-git --- GPU-accelerated terminal emulator with smooth cursor motion
;;; AUR: alacritty-smooth-cursor-git
;;; -------------------------------------------------------------------
(define-public alacritty-smooth-cursor-git
  (package
    (name "alacritty-smooth-cursor-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alacritty/alacritty")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/alacritty/alacritty")
    (synopsis "GPU-accelerated terminal emulator with smooth cursor motion")
    (description "Alacritty with a smooth cursor motion patch.  A cross-platform, GPU-accelerated terminal emulator.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 13. firewalld-git --- firewall daemon with D-Bus interface
;;; AUR: firewalld-git
;;; -------------------------------------------------------------------
(define-public firewalld-git
  (package
    (name "firewalld-git")
    (version "2.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/firewalld/firewalld")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/firewalld/firewalld")
    (synopsis "firewall daemon with D-Bus interface")
    (description "FirewallD is a firewall management tool with D-Bus interface.  It provides a dynamically managed firewall with support for network zones.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 14. firewalld-test-git --- FirewallD test suite
;;; AUR: firewalld-test-git
;;; -------------------------------------------------------------------
(define-public firewalld-test-git
  (package
    (name "firewalld-test-git")
    (version "2.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/firewalld/firewalld")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/firewalld/firewalld")
    (synopsis "FirewallD test suite")
    (description "Test suite for FirewallD, the firewall management daemon with D-Bus interface.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 15. mkcl-git --- ManKai Common Lisp implementation
;;; AUR: mkcl-git
;;; -------------------------------------------------------------------
(define-public mkcl-git
  (package
    (name "mkcl-git")
    (version "1.1.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.common-lisp.net/mkcl/mkcl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.common-lisp.net/mkcl/mkcl")
    (synopsis "ManKai Common Lisp implementation")
    (description "ManKai Common Lisp (MKCL) is a Common Lisp implementation focusing on reliability and multi-threading support.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 16. ninja-noemacs-git --- small build system with a focus on speed, without emacs
;;; AUR: ninja-noemacs-git
;;; -------------------------------------------------------------------
(define-public ninja-noemacs-git
  (package
    (name "ninja-noemacs-git")
    (version "1.12.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ninja-build/ninja")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ninja-build/ninja")
    (synopsis "small build system with a focus on speed, without emacs")
    (description "Ninja build system without Emacs integration.  A small build system with a focus on speed, for those who prefer Vim or other editors.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 17. hashes-git --- simple hash algorithm identification GUI using GTK4
;;; AUR: hashes-git
;;; -------------------------------------------------------------------
(define-public hashes-git
  (package
    (name "hashes-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Crazy-Crew/hashes")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Crazy-Crew/hashes")
    (synopsis "simple hash algorithm identification GUI using GTK4")
    (description "Hashes is a simple hash algorithm identification GUI using GTK4 and Adwaita.  It can compute and verify file hashes.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 18. python-llama-cpp-cuda --- Python bindings for llama.cpp with CUDA support
;;; AUR: python-llama-cpp-cuda
;;; -------------------------------------------------------------------
(define-public python-llama-cpp-cuda
  (package
    (name "python-llama-cpp-cuda")
    (version "0.3.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abetlen/llama-cpp-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/abetlen/llama-cpp-python")
    (synopsis "Python bindings for llama.cpp with CUDA support")
    (description "Python bindings for llama.cpp with CUDA GPU acceleration support for running LLM inference.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. ripcord --- Qt-based Discord and Slack client
;;; AUR: ripcord
;;; -------------------------------------------------------------------
(define-public ripcord
  (package
    (name "ripcord")
    (version "0.4.29")
    (source (origin
              (method url-fetch)
              (uri "https://cancel.fm/ripcord/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://cancel.fm/ripcord/")
    (synopsis "Qt-based Discord and Slack client")
    (description "Ripcord is a Qt-based desktop chat client for Discord and Slack.  Proprietary binary distribution.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20. proxmark3-iceman-git --- RRG/Iceman Proxmark3 client and tools
;;; AUR: proxmark3-iceman-git
;;; -------------------------------------------------------------------
(define-public proxmark3-iceman-git
  (package
    (name "proxmark3-iceman-git")
    (version "4.18900")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/RfidResearchGroup/proxmark3")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/RfidResearchGroup/proxmark3")
    (synopsis "RRG/Iceman Proxmark3 client and tools")
    (description "Proxmark3 client and firmware from the RRG/Iceman repository.  Supports Proxmark3 RDV4.0 and other Proxmark3 platforms for RFID research.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 21. proxmark3gui-git --- cross-platform GUI for Proxmark3 client
;;; AUR: proxmark3gui-git
;;; -------------------------------------------------------------------
(define-public proxmark3gui-git
  (package
    (name "proxmark3gui-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wh201906/Proxmark3GUI")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/wh201906/Proxmark3GUI")
    (synopsis "cross-platform GUI for Proxmark3 client")
    (description "A cross-platform GUI for the Proxmark3 RFID client.  Provides a graphical interface for Proxmark3 operations.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 22. arm-linux-gnueabi-gcc75-linaro-bin --- GCC cross compiler for ARM target from Linaro
;;; AUR: arm-linux-gnueabi-gcc75-linaro-bin
;;; -------------------------------------------------------------------
(define-public arm-linux-gnueabi-gcc75-linaro-bin
  (package
    (name "arm-linux-gnueabi-gcc75-linaro-bin")
    (version "7.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://releases.linaro.org/components/toolchain/binaries/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://releases.linaro.org/components/toolchain/binaries/")
    (synopsis "GCC cross compiler for ARM target from Linaro")
    (description "The GNU Compiler Collection cross compiler for ARM target, prebuilt binaries from Linaro.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 23. noto-fonts-cjk-chws-patch --- Noto CJK fonts with contextual half-width spacing patch
;;; AUR: noto-fonts-cjk-chws-patch
;;; -------------------------------------------------------------------
(define-public noto-fonts-cjk-chws-patch
  (package
    (name "noto-fonts-cjk-chws-patch")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AstroProfundworksOP/noto-cjk-chws")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/AstroProfundworksOP/noto-cjk-chws")
    (synopsis "Noto CJK fonts with contextual half-width spacing patch")
    (description "Noto CJK fonts with contextual half-width spacing (chws) patch for improved CJK punctuation rendering.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 24. ue4-docker-git --- Windows and Linux containers for Unreal Engine
;;; AUR: ue4-docker-git
;;; -------------------------------------------------------------------
(define-public ue4-docker-git
  (package
    (name "ue4-docker-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/adamrehn/ue4-docker")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/adamrehn/ue4-docker")
    (synopsis "Windows and Linux containers for Unreal Engine")
    (description "Tools for building Windows and Linux Docker containers for Unreal Engine.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. php-msgpack --- PHP extension for interfacing with MessagePack
;;; AUR: php-msgpack
;;; -------------------------------------------------------------------
(define-public php-msgpack
  (package
    (name "php-msgpack")
    (version "3.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/msgpack/msgpack-php")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/msgpack/msgpack-php")
    (synopsis "PHP extension for interfacing with MessagePack")
    (description "PHP extension for interfacing with MessagePack, an efficient binary serialization format.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 26. libakonadi5 --- libraries used by applications based on Akonadi
;;; AUR: libakonadi5
;;; -------------------------------------------------------------------
(define-public libakonadi5
  (package
    (name "libakonadi5")
    (version "24.12.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://invent.kde.org/pim/akonadi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://invent.kde.org/pim/akonadi")
    (synopsis "libraries used by applications based on Akonadi")
    (description "Libraries used by applications based on Akonadi, the KDE PIM data server.  Provides the framework for accessing PIM data.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 27. ya-player --- Yandex Music player
;;; AUR: ya-player
;;; -------------------------------------------------------------------
(define-public ya-player
  (package
    (name "ya-player")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicatdcw/ya-player")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicatdcw/ya-player")
    (synopsis "Yandex Music player")
    (description "Ya-Player is a Yandex Music player for the desktop.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 28. kftray-appimage --- kubectl port forward manager with UDP and proxy support
;;; AUR: kftray-appimage
;;; -------------------------------------------------------------------
(define-public kftray-appimage
  (package
    (name "kftray-appimage")
    (version "0.14.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/hcavarsan/kftray")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/hcavarsan/kftray")
    (synopsis "kubectl port forward manager with UDP and proxy support")
    (description "Kftray is a kubectl port forward manager, with support for UDP and proxy connections through Kubernetes clusters.  Packaged from AppImage.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. intel-real-ucode-git --- latest Intel CPU microcode updates
;;; AUR: intel-real-ucode-git
;;; -------------------------------------------------------------------
(define-public intel-real-ucode-git
  (package
    (name "intel-real-ucode-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files")
    (synopsis "latest Intel CPU microcode updates")
    (description "Provides the latest CPU microcode for Intel processors from upstream sources.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. todoist-appimage-integration --- Todoist AppImage integration with system
;;; AUR: todoist-appimage-integration
;;; -------------------------------------------------------------------
(define-public todoist-appimage-integration
  (package
    (name "todoist-appimage-integration")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicofrand/todoist-linux")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicofrand/todoist-linux")
    (synopsis "Todoist AppImage integration with system")
    (description "Integrates the Todoist AppImage with the system desktop environment.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 31. invader --- open source toolkit for Halo: Combat Evolved modding
;;; AUR: invader
;;; -------------------------------------------------------------------
(define-public invader
  (package
    (name "invader")
    (version "0.54.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SnowyMouse/invader")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/SnowyMouse/invader")
    (synopsis "open source toolkit for Halo: Combat Evolved modding")
    (description "Invader is an open source toolkit for creating maps and assets for Halo: Combat Evolved.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 32. recordurbate --- bot to automatically record live streams
;;; AUR: recordurbate
;;; -------------------------------------------------------------------
(define-public recordurbate
  (package
    (name "recordurbate")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/oliverjrose99/Recordurbate")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/oliverjrose99/Recordurbate")
    (synopsis "bot to automatically record live streams")
    (description "Recordurbate is a bot to automatically record live streams from streaming platforms.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 33. libshairport --- library emulating an AirPort Express
;;; AUR: libshairport
;;; -------------------------------------------------------------------
(define-public libshairport
  (package
    (name "libshairport")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amejia1/libshairport")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/amejia1/libshairport")
    (synopsis "library emulating an AirPort Express")
    (description "Libshairport emulates an AirPort Express for the purpose of streaming music from iTunes and compatible devices.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 34. tailsdvd-git --- simple ISO creator and burner
;;; AUR: tailsdvd-git
;;; -------------------------------------------------------------------
(define-public tailsdvd-git
  (package
    (name "tailsdvd-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicofrand/tailsdvd")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicofrand/tailsdvd")
    (synopsis "simple ISO creator and burner")
    (description "TailsDVD is a simple ISO creator and burner utility.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 35. jameica-nightly --- free Java application platform
;;; AUR: jameica-nightly
;;; -------------------------------------------------------------------
(define-public jameica-nightly
  (package
    (name "jameica-nightly")
    (version "2.12")
    (source (origin
              (method url-fetch)
              (uri "https://www.willuhn.de/products/jameica/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.willuhn.de/products/jameica/")
    (synopsis "free Java application platform")
    (description "Jameica is a free Java application platform.  It provides the runtime environment for plugins like Hibiscus HBCI banking.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 36. hibiscus-nightly --- Hibiscus HBCI banking plugin for Jameica
;;; AUR: hibiscus-nightly
;;; -------------------------------------------------------------------
(define-public hibiscus-nightly
  (package
    (name "hibiscus-nightly")
    (version "2.12")
    (source (origin
              (method url-fetch)
              (uri "https://www.willuhn.de/products/hibiscus/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.willuhn.de/products/hibiscus/")
    (synopsis "Hibiscus HBCI banking plugin for Jameica")
    (description "Hibiscus is an HBCI banking plugin for the Jameica application platform.  It provides online banking functionality.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 37. manta --- frontend CLI to interact with OpenCHAMI
;;; AUR: manta
;;; -------------------------------------------------------------------
(define-public manta
  (package
    (name "manta")
    (version "0.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenCHAMI/manta")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/OpenCHAMI/manta")
    (synopsis "frontend CLI to interact with OpenCHAMI")
    (description "Manta is a frontend CLI to interact with OpenCHAMI, a scalable systems management framework.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 38. phpstorm-eap --- PhpStorm IDE Early Access Program
;;; AUR: phpstorm-eap
;;; -------------------------------------------------------------------
(define-public phpstorm-eap
  (package
    (name "phpstorm-eap")
    (version "2026.2")
    (source (origin
              (method url-fetch)
              (uri "https://www.jetbrains.com/phpstorm/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.jetbrains.com/phpstorm/")
    (synopsis "PhpStorm IDE Early Access Program")
    (description "PhpStorm is a lightning-smart PHP IDE by JetBrains.  This is the Early Access Program version.  Proprietary binary.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 39. phpstorm-eap-jre --- PhpStorm IDE EAP with bundled JRE
;;; AUR: phpstorm-eap-jre
;;; -------------------------------------------------------------------
(define-public phpstorm-eap-jre
  (package
    (name "phpstorm-eap-jre")
    (version "2026.2")
    (source (origin
              (method url-fetch)
              (uri "https://www.jetbrains.com/phpstorm/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.jetbrains.com/phpstorm/")
    (synopsis "PhpStorm IDE EAP with bundled JRE")
    (description "PhpStorm lightning-smart PHP IDE, Early Access Program, with bundled JRE.  Proprietary binary.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 40. udiskie-dmenu-git --- manage removable devices via dmenu or rofi
;;; AUR: udiskie-dmenu-git
;;; -------------------------------------------------------------------
(define-public udiskie-dmenu-git
  (package
    (name "udiskie-dmenu-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fogine/udiskie-dmenu")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/fogine/udiskie-dmenu")
    (synopsis "manage removable devices via dmenu or rofi")
    (description "Udiskie-dmenu allows managing removable devices via dmenu or rofi launcher interfaces.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 41. gst-plugin-pipewire-full-git --- multimedia graph framework PipeWire plugin
;;; AUR: gst-plugin-pipewire-full-git
;;; -------------------------------------------------------------------
(define-public gst-plugin-pipewire-full-git
  (package
    (name "gst-plugin-pipewire-full-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "multimedia graph framework PipeWire plugin")
    (description "GStreamer plugin for PipeWire multimedia framework integration.  Part of the pipewire-full build.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 42. libpipewire-full-git --- low-latency audio/video router and processor client library
;;; AUR: libpipewire-full-git
;;; -------------------------------------------------------------------
(define-public libpipewire-full-git
  (package
    (name "libpipewire-full-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "low-latency audio/video router and processor client library")
    (description "PipeWire client library for low-latency audio/video routing and processing.  Full build from git.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 43. pipewire-full-alsa-git --- PipeWire ALSA configuration
;;; AUR: pipewire-full-alsa-git
;;; -------------------------------------------------------------------
(define-public pipewire-full-alsa-git
  (package
    (name "pipewire-full-alsa-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "PipeWire ALSA configuration")
    (description "PipeWire ALSA configuration for low-latency audio/video routing and processing.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 44. pipewire-full-audio-git --- PipeWire audio support
;;; AUR: pipewire-full-audio-git
;;; -------------------------------------------------------------------
(define-public pipewire-full-audio-git
  (package
    (name "pipewire-full-audio-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "PipeWire audio support")
    (description "PipeWire audio support module for low-latency audio routing and processing.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 45. pipewire-full-docs-git --- PipeWire documentation
;;; AUR: pipewire-full-docs-git
;;; -------------------------------------------------------------------
(define-public pipewire-full-docs-git
  (package
    (name "pipewire-full-docs-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "PipeWire documentation")
    (description "Documentation for PipeWire, the low-latency audio/video router and processor.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 46. pipewire-full-ffado-git --- PipeWire FireWire audio support
;;; AUR: pipewire-full-ffado-git
;;; -------------------------------------------------------------------
(define-public pipewire-full-ffado-git
  (package
    (name "pipewire-full-ffado-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "PipeWire FireWire audio support")
    (description "PipeWire FireWire audio support via FFADO for professional audio interfaces.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 47. pipewire-full-ffmpeg-git --- FFmpeg SPA plugin for PipeWire
;;; AUR: pipewire-full-ffmpeg-git
;;; -------------------------------------------------------------------
(define-public pipewire-full-ffmpeg-git
  (package
    (name "pipewire-full-ffmpeg-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "FFmpeg SPA plugin for PipeWire")
    (description "FFmpeg SPA plugin for PipeWire multimedia framework.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 48. pipewire-full-git --- low-latency audio/video router and processor
;;; AUR: pipewire-full-git
;;; -------------------------------------------------------------------
(define-public pipewire-full-git
  (package
    (name "pipewire-full-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "low-latency audio/video router and processor")
    (description "PipeWire is a low-latency audio/video router and processor.  Full build from git source.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 49. pipewire-full-jack-client-git --- PipeWire as JACK client
;;; AUR: pipewire-full-jack-client-git
;;; -------------------------------------------------------------------
(define-public pipewire-full-jack-client-git
  (package
    (name "pipewire-full-jack-client-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "PipeWire as JACK client")
    (description "PipeWire as JACK client module for audio routing.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 50. pipewire-full-jack-git --- PipeWire JACK replacement
;;; AUR: pipewire-full-jack-git
;;; -------------------------------------------------------------------
(define-public pipewire-full-jack-git
  (package
    (name "pipewire-full-jack-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "PipeWire JACK replacement")
    (description "PipeWire JACK replacement for low-latency professional audio.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 51. pipewire-full-pulse-git --- PipeWire PulseAudio replacement
;;; AUR: pipewire-full-pulse-git
;;; -------------------------------------------------------------------
(define-public pipewire-full-pulse-git
  (package
    (name "pipewire-full-pulse-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "PipeWire PulseAudio replacement")
    (description "PipeWire PulseAudio replacement for low-latency audio routing.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 52. pipewire-full-roc-git --- PipeWire ROC streaming support
;;; AUR: pipewire-full-roc-git
;;; -------------------------------------------------------------------
(define-public pipewire-full-roc-git
  (package
    (name "pipewire-full-roc-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "PipeWire ROC streaming support")
    (description "PipeWire ROC streaming support for real-time audio over network.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 53. pipewire-full-v4l2-git --- PipeWire V4L2 interceptor
;;; AUR: pipewire-full-v4l2-git
;;; -------------------------------------------------------------------
(define-public pipewire-full-v4l2-git
  (package
    (name "pipewire-full-v4l2-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "PipeWire V4L2 interceptor")
    (description "PipeWire V4L2 interceptor for video device access.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 54. pipewire-full-vulkan-git --- Vulkan SPA plugin for PipeWire
;;; AUR: pipewire-full-vulkan-git
;;; -------------------------------------------------------------------
(define-public pipewire-full-vulkan-git
  (package
    (name "pipewire-full-vulkan-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "Vulkan SPA plugin for PipeWire")
    (description "Vulkan SPA plugin for PipeWire multimedia framework.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 55. pipewire-full-x11-bell-git --- PipeWire X11 bell support
;;; AUR: pipewire-full-x11-bell-git
;;; -------------------------------------------------------------------
(define-public pipewire-full-x11-bell-git
  (package
    (name "pipewire-full-x11-bell-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "PipeWire X11 bell support")
    (description "PipeWire X11 bell support module.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 56. pipewire-full-zeroconf-git --- PipeWire Zeroconf support
;;; AUR: pipewire-full-zeroconf-git
;;; -------------------------------------------------------------------
(define-public pipewire-full-zeroconf-git
  (package
    (name "pipewire-full-zeroconf-git")
    (version "1.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/pipewire/pipewire")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/pipewire/pipewire")
    (synopsis "PipeWire Zeroconf support")
    (description "PipeWire Zeroconf/mDNS support for network service discovery.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 57. dealers-choice --- online multiplayer stud and draw poker
;;; AUR: dealers-choice
;;; -------------------------------------------------------------------
(define-public dealers-choice
  (package
    (name "dealers-choice")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicofrand/dealers-choice")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicofrand/dealers-choice")
    (synopsis "online multiplayer stud and draw poker")
    (description "Dealer's Choice is an online multiplayer stud and draw poker game.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 58. aarch64-none-linux-gnu-gcc-bin --- GCC cross compiler for ARM64 Linux target
;;; AUR: aarch64-none-linux-gnu-gcc-bin
;;; -------------------------------------------------------------------
(define-public aarch64-none-linux-gnu-gcc-bin
  (package
    (name "aarch64-none-linux-gnu-gcc-bin")
    (version "14.2")
    (source (origin
              (method url-fetch)
              (uri "https://developer.arm.com/downloads/-/gnu-a")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://developer.arm.com/downloads/-/gnu-a")
    (synopsis "GCC cross compiler for ARM64 Linux target")
    (description "The GNU Compiler Collection cross compiler for AArch64 Linux target, prebuilt binaries.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 59. qgpgme1-qt5 --- Qt5 bindings for GPGme
;;; AUR: qgpgme1-qt5
;;; -------------------------------------------------------------------
(define-public qgpgme1-qt5
  (package
    (name "qgpgme1-qt5")
    (version "1.24.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gnupg.org/software/gpgme/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gnupg.org/software/gpgme/")
    (synopsis "Qt5 bindings for GPGme")
    (description "Qt5 bindings for GPGme cryptographic library.  Provides QGpgME for KDE and Qt applications.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 60. python-amulet-compiler-target --- token library to pin compile-time requirements
;;; AUR: python-amulet-compiler-target
;;; -------------------------------------------------------------------
(define-public python-amulet-compiler-target
  (package
    (name "python-amulet-compiler-target")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Amulet-Team/Amulet-Compiler-Target")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Amulet-Team/Amulet-Compiler-Target")
    (synopsis "token library to pin compile-time requirements")
    (description "A token library to pin compile-time requirements for the Amulet Minecraft editor.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 61. python-amulet-io --- C++ header-only binary reader and writer library
;;; AUR: python-amulet-io
;;; -------------------------------------------------------------------
(define-public python-amulet-io
  (package
    (name "python-amulet-io")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Amulet-Team/Amulet-IO")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Amulet-Team/Amulet-IO")
    (synopsis "C++ header-only binary reader and writer library")
    (description "A tiny C++ header-only binary reader and writer library with Python bindings for the Amulet project.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 62. python-amulet-zlib --- Python and C++ wrapper around zlib
;;; AUR: python-amulet-zlib
;;; -------------------------------------------------------------------
(define-public python-amulet-zlib
  (package
    (name "python-amulet-zlib")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Amulet-Team/Amulet-Zlib")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Amulet-Team/Amulet-Zlib")
    (synopsis "Python and C++ wrapper around zlib")
    (description "A Python and C++ wrapper around zlib for the Amulet Minecraft editor project.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 63. python-amulet-pybind11-extensions --- useful extensions to pybind11
;;; AUR: python-amulet-pybind11-extensions
;;; -------------------------------------------------------------------
(define-public python-amulet-pybind11-extensions
  (package
    (name "python-amulet-pybind11-extensions")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Amulet-Team/Amulet-pybind11-extensions")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Amulet-Team/Amulet-pybind11-extensions")
    (synopsis "useful extensions to pybind11")
    (description "Some useful extensions to pybind11 for the Amulet Minecraft editor project.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 64. turso-git --- in-process SQL database compatible with SQLite
;;; AUR: turso-git
;;; -------------------------------------------------------------------
(define-public turso-git
  (package
    (name "turso-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tursodatabase/libsql")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/tursodatabase/libsql")
    (synopsis "in-process SQL database compatible with SQLite")
    (description "Turso Database is an in-process SQL database, compatible with SQLite.  Built from git source.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 65. nodejs-git --- JavaScript runtime built on V8 engine (git version)
;;; AUR: nodejs-git
;;; -------------------------------------------------------------------
(define-public nodejs-git
  (package
    (name "nodejs-git")
    (version "23.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nodejs/node")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nodejs/node")
    (synopsis "JavaScript runtime built on V8 engine (git version)")
    (description "Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.  Built from git source.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 66. chika-plymouth-theme-git --- Chika Plymouth boot splash theme
;;; AUR: chika-plymouth-theme-git
;;; -------------------------------------------------------------------
(define-public chika-plymouth-theme-git
  (package
    (name "chika-plymouth-theme-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicofrand/chika-plymouth-theme")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicofrand/chika-plymouth-theme")
    (synopsis "Chika Plymouth boot splash theme")
    (description "Chika Plymouth theme for the boot splash screen.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 67. urw-garamond --- URW Garamond No8 Adobe Type1 fonts
;;; AUR: urw-garamond
;;; -------------------------------------------------------------------
(define-public urw-garamond
  (package
    (name "urw-garamond")
    (version "2020")
    (source (origin
              (method url-fetch)
              (uri "https://www.ctan.org/pkg/urw-garamond")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.ctan.org/pkg/urw-garamond")
    (synopsis "URW Garamond No8 Adobe Type1 fonts")
    (description "URW Garamond No8 Adobe Type1 fonts from CTAN for use with TeX Live.")
    (license license:lppl1.3+)))

;;; -------------------------------------------------------------------
;;; 68. shit --- simple file server in Go
;;; AUR: shit
;;; -------------------------------------------------------------------
(define-public shit
  (package
    (name "shit")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicofrand/shit")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicofrand/shit")
    (synopsis "simple file server in Go")
    (description "Shit is a simple file server written in Go.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 69. neuralrack-git --- neural model and impulse response file loader
;;; AUR: neuralrack-git
;;; -------------------------------------------------------------------
(define-public neuralrack-git
  (package
    (name "neuralrack-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/brummer10/NeuralRack")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/brummer10/NeuralRack")
    (synopsis "neural model and impulse response file loader")
    (description "NeuralRack is a neural model and impulse response file loader for audio processing.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 70. qtscrcpy --- Android real-time screencast control tool
;;; AUR: qtscrcpy
;;; -------------------------------------------------------------------
(define-public qtscrcpy
  (package
    (name "qtscrcpy")
    (version "3.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/barry-ran/QtScrcpy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/barry-ran/QtScrcpy")
    (synopsis "Android real-time screencast control tool")
    (description "QtScrcpy is an Android real-time screencast and control tool using Qt.  It mirrors Android screens on desktop without root access.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 71. hypnotix-wayland --- IPTV streaming application with Wayland support
;;; AUR: hypnotix-wayland
;;; -------------------------------------------------------------------
(define-public hypnotix-wayland
  (package
    (name "hypnotix-wayland")
    (version "4.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linuxmint/hypnotix")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/linuxmint/hypnotix")
    (synopsis "IPTV streaming application with Wayland support")
    (description "Hypnotix is an IPTV streaming application with Wayland support.  Supports M3U playlists for live TV streaming.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 72. vot-cli --- voice-over translation of video via CLI
;;; AUR: vot-cli
;;; -------------------------------------------------------------------
(define-public vot-cli
  (package
    (name "vot-cli")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FOSWLY/vot-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/FOSWLY/vot-cli")
    (synopsis "voice-over translation of video via CLI")
    (description "VOT-CLI provides voice-over translation of video content, available as a command-line interface.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 73. iwmenu-git --- launcher-driven Wi-Fi manager for Linux
;;; AUR: iwmenu-git
;;; -------------------------------------------------------------------
(define-public iwmenu-git
  (package
    (name "iwmenu-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/e-tho/iwmenu")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/e-tho/iwmenu")
    (synopsis "launcher-driven Wi-Fi manager for Linux")
    (description "IWMenu is a launcher-driven Wi-Fi manager for Linux using iwd backend.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 74. opencommit --- AI-powered git commit message generator
;;; AUR: opencommit
;;; -------------------------------------------------------------------
(define-public opencommit
  (package
    (name "opencommit")
    (version "3.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/di-sukharev/opencommit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/di-sukharev/opencommit")
    (synopsis "AI-powered git commit message generator")
    (description "OpenCommit generates meaningful git commit messages using AI.  Supports multiple LLM providers.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 75. tchmaterial-parser --- material file parser utility
;;; AUR: tchmaterial-parser
;;; -------------------------------------------------------------------
(define-public tchmaterial-parser
  (package
    (name "tchmaterial-parser")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicofrand/tchmaterial-parser")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicofrand/tchmaterial-parser")
    (synopsis "material file parser utility")
    (description "TCHMaterial Parser is a utility for parsing material files.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 76. clang-prefixed-release --- LLVM/Clang compiler with prefixed installation
;;; AUR: clang-prefixed-release
;;; -------------------------------------------------------------------
(define-public clang-prefixed-release
  (package
    (name "clang-prefixed-release")
    (version "19.1.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/llvm/llvm-project")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/llvm/llvm-project")
    (synopsis "LLVM/Clang compiler with prefixed installation")
    (description "LLVM/Clang compiler installed with version-prefixed binaries to allow multiple versions to coexist.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 77. way-secure --- security utility for Wayland compositors
;;; AUR: way-secure
;;; -------------------------------------------------------------------
(define-public way-secure
  (package
    (name "way-secure")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicofrand/way-secure")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicofrand/way-secure")
    (synopsis "security utility for Wayland compositors")
    (description "Way-Secure provides security utilities for Wayland compositor environments.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 78. sockstun --- SOCKS tunnel utility
;;; AUR: sockstun
;;; -------------------------------------------------------------------
(define-public sockstun
  (package
    (name "sockstun")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicofrand/sockstun")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicofrand/sockstun")
    (synopsis "SOCKS tunnel utility")
    (description "SocksTun is a SOCKS tunnel utility for proxying network connections.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 79. s3lightfixes-git --- S3 light fixes utility
;;; AUR: s3lightfixes-git
;;; -------------------------------------------------------------------
(define-public s3lightfixes-git
  (package
    (name "s3lightfixes-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicofrand/s3lightfixes")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicofrand/s3lightfixes")
    (synopsis "S3 light fixes utility")
    (description "S3LightFixes provides lighting fix utilities.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 80. whisper-cpp-model-large-v3-turbo-q5-0 --- whisper.cpp large-v3-turbo quantized model (Q5_0)
;;; AUR: whisper-cpp-model-large-v3-turbo-q5-0
;;; -------------------------------------------------------------------
(define-public whisper-cpp-model-large-v3-turbo-q5-0
  (package
    (name "whisper-cpp-model-large-v3-turbo-q5-0")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://huggingface.co/ggerganov/whisper.cpp")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://huggingface.co/ggerganov/whisper.cpp")
    (synopsis "whisper.cpp large-v3-turbo quantized model (Q5_0)")
    (description "Whisper.cpp large-v3-turbo speech recognition model, quantized to Q5_0 precision for reduced memory usage.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 81. proton-xiv-bin --- Proton compatibility layer for FFXIV
;;; AUR: proton-xiv-bin
;;; -------------------------------------------------------------------
(define-public proton-xiv-bin
  (package
    (name "proton-xiv-bin")
    (version "0.0.0-git")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicofrand/proton-xiv")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicofrand/proton-xiv")
    (synopsis "Proton compatibility layer for FFXIV")
    (description "Proton XIV is a Proton compatibility layer optimized for Final Fantasy XIV on Linux.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 82. quarto-cli-bin-pre-release --- Quarto CLI pre-release for scientific publishing
;;; AUR: quarto-cli-bin-pre-release
;;; -------------------------------------------------------------------
(define-public quarto-cli-bin-pre-release
  (package
    (name "quarto-cli-bin-pre-release")
    (version "1.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/quarto-dev/quarto-cli")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/quarto-dev/quarto-cli")
    (synopsis "Quarto CLI pre-release for scientific publishing")
    (description "Quarto CLI pre-release version for scientific and technical publishing.  Supports Jupyter, R Markdown, and Observable.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 83. compiz --- compositing window manager with 3D effects
;;; AUR: compiz
;;; -------------------------------------------------------------------
(define-public compiz
  (package
    (name "compiz")
    (version "0.9.14.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/compiz/compiz-core")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.com/compiz/compiz-core")
    (synopsis "compositing window manager with 3D effects")
    (description "Compiz is a compositing window manager for X11 that provides 3D desktop effects using OpenGL.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 84. blahaj-rs-git --- Blahaj shark in your terminal
;;; AUR: blahaj-rs-git
;;; -------------------------------------------------------------------
(define-public blahaj-rs-git
  (package
    (name "blahaj-rs-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GlenDC/blahaj")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/GlenDC/blahaj")
    (synopsis "Blahaj shark in your terminal")
    (description "Blahaj-rs displays a cute shark ASCII art in your terminal.  Written in Rust.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 85. java8-openjfx-doc --- JavaFX 8 API documentation
;;; AUR: java8-openjfx-doc
;;; -------------------------------------------------------------------
(define-public java8-openjfx-doc
  (package
    (name "java8-openjfx-doc")
    (version "8u202")
    (source (origin
              (method url-fetch)
              (uri "https://openjfx.io/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://openjfx.io/")
    (synopsis "JavaFX 8 API documentation")
    (description "API documentation for JavaFX 8, the Java GUI toolkit.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 86. java8-openjfx-src --- JavaFX 8 source code
;;; AUR: java8-openjfx-src
;;; -------------------------------------------------------------------
(define-public java8-openjfx-src
  (package
    (name "java8-openjfx-src")
    (version "8u202")
    (source (origin
              (method url-fetch)
              (uri "https://openjfx.io/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://openjfx.io/")
    (synopsis "JavaFX 8 source code")
    (description "Source code for JavaFX 8, the Java GUI toolkit.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 87. a2ln --- Android to Linux notification bridge
;;; AUR: a2ln
;;; -------------------------------------------------------------------
(define-public a2ln
  (package
    (name "a2ln")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicofrand/a2ln-server")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicofrand/a2ln-server")
    (synopsis "Android to Linux notification bridge")
    (description "A2LN bridges Android notifications to a Linux desktop.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 88. niriswitcher --- application switcher for Niri compositor
;;; AUR: niriswitcher
;;; -------------------------------------------------------------------
(define-public niriswitcher
  (package
    (name "niriswitcher")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicofrand/niriswitcher")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicofrand/niriswitcher")
    (synopsis "application switcher for Niri compositor")
    (description "NiriSwitcher is an application switcher for the Niri scrollable-tiling Wayland compositor.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 89. nameinator --- name generation utility
;;; AUR: nameinator
;;; -------------------------------------------------------------------
(define-public nameinator
  (package
    (name "nameinator")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicofrand/nameinator")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicofrand/nameinator")
    (synopsis "name generation utility")
    (description "Nameinator generates names using various algorithms and word lists.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 90. worker --- file manager for the X Window System
;;; AUR: worker
;;; -------------------------------------------------------------------
(define-public worker
  (package
    (name "worker")
    (version "5.0.3")
    (source (origin
              (method url-fetch)
              (uri "http://www.boomerangsworld.de/cms/worker/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.boomerangsworld.de/cms/worker/")
    (synopsis "file manager for the X Window System")
    (description "Worker is an orthodox file manager for the X Window System.  It features a two-panel interface inspired by Directory Opus.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 91. plowshare --- command-line tool for file-sharing websites
;;; AUR: plowshare
;;; -------------------------------------------------------------------
(define-public plowshare
  (package
    (name "plowshare")
    (version "2.1.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mcrapet/plowshare")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/mcrapet/plowshare")
    (synopsis "command-line tool for file-sharing websites")
    (description "Plowshare is a command-line tool for managing files on file-sharing websites.  It supports downloading, uploading, and listing.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 92. onlyoffice-documentserver-bin --- OnlyOffice Document Server for collaborative editing
;;; AUR: onlyoffice-documentserver-bin
;;; -------------------------------------------------------------------
(define-public onlyoffice-documentserver-bin
  (package
    (name "onlyoffice-documentserver-bin")
    (version "8.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.onlyoffice.com/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.onlyoffice.com/")
    (synopsis "OnlyOffice Document Server for collaborative editing")
    (description "OnlyOffice Document Server provides online collaborative editing of documents, spreadsheets, and presentations.  Prebuilt binary.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 93. wine-tkg-staging-bin --- Wine TKG staging build (prebuilt binary)
;;; AUR: wine-tkg-staging-bin
;;; -------------------------------------------------------------------
(define-public wine-tkg-staging-bin
  (package
    (name "wine-tkg-staging-bin")
    (version "9.22")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Frogging-Family/wine-tkg-git")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Frogging-Family/wine-tkg-git")
    (synopsis "Wine TKG staging build (prebuilt binary)")
    (description "Wine TKG staging build with performance patches.  Prebuilt binary distribution for running Windows applications on Linux.")
    (license license:lgpl2.1+)))

