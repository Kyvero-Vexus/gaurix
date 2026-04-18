;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418s
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (18):
;;;     1.  woff2-annotation-mono (font-build-system, v0.2, ofl1.1)
;;;     2.  woff2-annotation-mono-variable (font-build-system, v0.2, ofl1.1)
;;;     3.  gnome-shell-extension-ubuntu-dock (copy-build-system, v105, gpl2)
;;;     4.  gnome-shell-extension-top-bar-organizer (copy-build-system, v14, gpl3+)
;;;     5.  gpu-screen-recorder-notification (meson-build-system, v1.0.7, gpl3)
;;;     6.  gpu-screen-recorder (meson-build-system, v5.12.4, gpl3)
;;;     7.  gpu-screen-recorder-gtk (meson-build-system, v5.7.7, gpl3)
;;;     8.  gpu-screen-recorder-ui (meson-build-system, v1.9.1, gpl3)
;;;     9.  libresplit (meson-build-system, v0.1, gpl3+)
;;;    10.  gimp-plugin-gmic-qt (cmake-build-system, v3.5.0, cecill-c)
;;;    11.  gr-limesdr (cmake-build-system, v3.0.1, expat)
;;;    12.  gr-foo (cmake-build-system, v0.0.0, gpl3)
;;;    13.  gr-ieee802-11 (cmake-build-system, v0.0.0, gpl3)
;;;    14.  gr-lora-sdr (cmake-build-system, v0.5.8, gpl3+)
;;;    15.  green-recorder (python-build-system, v3.2.10, gpl3)
;;;    16.  taskfile-to-tasks-python (pyproject-build-system, v1.0.2, expat)
;;;    17.  gnome-x11-gesture-daemon (cargo-build-system, v0.2.1, expat)
;;;    18.  piper-voices-ru-ru (copy-build-system, v1.0.0, expat)
;;;
;;; BLOCKED EXHAUSTED (12):
;;;    19.  anime-games-launcher-bin -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_ECOSYSTEM:
;;;         GPL-3.0 launcher, but exists solely to manage proprietary anime games
;;;         (Genshin Impact, Honkai Star Rail, etc.);
;;;         A1: depends on proprietary game clients at runtime — no standalone value;
;;;         A2: binary distribution from GitHub — not buildable from source in Guix;
;;;         A3: game servers require anti-cheat — incompatible with libre OS
;;;    20.  armorpaint-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: EXTREME_BUILD_COMPLEXITY:
;;;         3D PBR texture painting tool; still in 1.0 alpha;
;;;         A1: custom build requires Clang 19+ with C23 #embed support (not in Guix);
;;;         A2: nodejs + Vulkan + custom asset pipeline; A3: no stable release exists
;;;    21.  chess-native -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_SERVICE_WRAPPER:
;;;         Tauri wrapper around Chess.com (proprietary service);
;;;         A1: no license file in repo — distribution rights unclear;
;;;         A2: requires cargo + npm Tauri build chain; A3: non-functional without Chess.com
;;;    22.  lunarvim-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: RUNTIME_DOWNLOAD:
;;;         Neovim IDE layer that downloads plugins/LSP servers/treesitter at runtime;
;;;         A1: fundamentally incompatible with Guix offline/deterministic builds;
;;;         A2: 30+ runtime-fetched components; A3: use Guix home + Neovim config instead
;;;    23.  iceweasel -> NEEDS_RECIPE_DESIGN_EXHAUSTED: EXTREME_BUILD_COMPLEXITY:
;;;         Parabola's debranded Firefox; full browser build (~30 deps, 6+ hour build);
;;;         A1: Guix has IceCat which serves same debranding purpose;
;;;         A2: Rust + WASM + LLVM + full Chromium-scale build; A3: existing alternative
;;;    24.  moomoo -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_BINARY:
;;;         proprietary stock trading platform (Futu/Moomoo);
;;;         A1: no source code available; A2: repackaged .deb from futustatic.com;
;;;         A3: redistribution prohibited by ToS
;;;    25.  roxybrowser-bin -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_BINARY:
;;;         proprietary antidetect browser; closed-source commercial software;
;;;         A1: no source code; A2: "MIT" license claim is false; A3: anti-detection
;;;         purpose raises ethical concerns for Guix distribution
;;;    26.  electronwmd-bin -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_BINARY:
;;;         MiniDisc NetMD manager; Electron AppImage binary;
;;;         A1: source build requires full Electron/npm ecosystem not in Guix;
;;;         A2: AppImage extraction has FUSE/linker conflicts; A3: use linux-minidisc CLI
;;;    27.  biu-tauri-bin -> NEEDS_RECIPE_DESIGN_EXHAUSTED: NON_FREE_LICENSE:
;;;         Bilibili API wrapper; PolyForm Noncommercial license (not free software);
;;;         A1: non-free license incompatible with Guix FSDG; A2: prebuilt Tauri binary;
;;;         A3: no open-source alternative with same functionality
;;;    28.  dare-devil -> NEEDS_RECIPE_DESIGN_EXHAUSTED: LOW_QUALITY_SECURITY_RISK:
;;;         CTF memory game that modifies iptables rules and requires VMware;
;;;         A1: iptables modification is a security risk in packaging;
;;;         A2: single developer, 1 AUR vote, 0.01 popularity; A3: no stable release
;;;    29.  nhaccuatui -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_BINARY:
;;;         Vietnamese music streaming app; proprietary AppImage;
;;;         A1: no source code; A2: custom "LicenseRef-Nhaccuatui" license;
;;;         A3: redistribution prohibited
;;;    30.  scx-openrc -> NEEDS_RECIPE_DESIGN_EXHAUSTED: WRONG_INIT_SYSTEM:
;;;         OpenRC init script for sched_ext schedulers;
;;;         A1: Guix uses Shepherd, not OpenRC — incompatible init system;
;;;         A2: script is inline in PKGBUILD, no external upstream;
;;;         A3: write a Guix Shepherd service instead if scx-scheds is needed
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418s)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system font)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages dbm)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gimp)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnuradio)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages logging)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages patchutils)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages radio)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages sdr)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            woff2-annotation-mono
            woff2-annotation-mono-variable
            gnome-shell-extension-ubuntu-dock
            gnome-shell-extension-top-bar-organizer
            gpu-screen-recorder-notification
            gpu-screen-recorder
            gpu-screen-recorder-gtk
            gpu-screen-recorder-ui
            libresplit
            gimp-plugin-gmic-qt
            gr-limesdr
            gr-foo
            gr-ieee802-11
            gr-lora-sdr
            green-recorder
            taskfile-to-tasks-python
            gnome-x11-gesture-daemon
            piper-voices-ru-ru))

;;; -------------------------------------------------------------------
;;; 1. woff2-annotation-mono --- handwriting-style monospace font (WOFF2)
;;; From the AnnotationMono project; install WOFF2 font files.
;;; -------------------------------------------------------------------
(define-public woff2-annotation-mono
  (package
    (name "woff2-annotation-mono")
    (version "0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/qwerasd205/AnnotationMono")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((font-dir (string-append (assoc-ref outputs "out")
                                             "/share/fonts/woff2")))
                (mkdir-p font-dir)
                (for-each (lambda (f)
                            (install-file f font-dir))
                          (find-files "dist/woff2" "\\.woff2$"))))))))
    (home-page "https://github.com/qwerasd205/AnnotationMono")
    (synopsis "handwriting-style monospace font in WOFF2 format")
    (description "Annotation Mono is a handwriting-style monospace font
designed for code annotations and documentation.  This package provides
the static WOFF2 format files suitable for use in web contexts and
desktop environments that support WOFF2.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 2. woff2-annotation-mono-variable --- variable weight variant
;;; Same source as annotation-mono, installs variable font file.
;;; -------------------------------------------------------------------
(define-public woff2-annotation-mono-variable
  (package
    (inherit woff2-annotation-mono)
    (name "woff2-annotation-mono-variable")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((font-dir (string-append (assoc-ref outputs "out")
                                             "/share/fonts/woff2")))
                (mkdir-p font-dir)
                (for-each (lambda (f)
                            (install-file f font-dir))
                          (find-files "dist/variable_woff2" "\\.woff2$"))))))))
    (synopsis "handwriting-style variable-weight monospace font in WOFF2 format")
    (description "Annotation Mono Variable is the variable-weight variant of
the Annotation Mono handwriting-style monospace font.  It provides a single
WOFF2 file with adjustable weight, suitable for web contexts and desktop
environments that support variable fonts.")))

;;; -------------------------------------------------------------------
;;; 3. gnome-shell-extension-ubuntu-dock --- Ubuntu-style dock for GNOME
;;; Fork of Dash to Dock with Ubuntu-specific patches.
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-ubuntu-dock
  (package
    (name "gnome-shell-extension-ubuntu-dock")
    (version "105")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/micheleg/dash-to-dock")
                    (commit (string-append
                             "extensions.gnome.org-v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/gnome-shell/extensions/ubuntu-dock@micheleg.github.com/"
           #:exclude ("Makefile" ".github" "README.md" "LICENSE"
                      "po" "sass" "media")))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'build
            (lambda _
              (invoke "make" "all"))))))
    (native-inputs (list gettext-minimal))
    (home-page "https://github.com/micheleg/dash-to-dock")
    (synopsis "Ubuntu-style dock extension for GNOME Shell")
    (description "Ubuntu Dock is a GNOME Shell extension that provides a
dock-style application launcher and switcher on the desktop.  It is a
fork of Dash to Dock with Ubuntu-specific patches for integration with
the GNOME desktop environment.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 4. gnome-shell-extension-top-bar-organizer --- organize GNOME top bar
;;; Allows reordering indicators in the GNOME Shell top bar.
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-top-bar-organizer
  (package
    (name "gnome-shell-extension-top-bar-organizer")
    (version "14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/julianschacher/top-bar-organizer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/gnome-shell/extensions/top-bar-organizer@julianschacher.gitlab.gnome.org/"
           #:exclude (".git" "README.md" "LICENSE" "screenshots")))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'compile-schemas
            (lambda _
              (invoke "glib-compile-schemas" "schemas/"))))))
    (native-inputs (list glib))
    (home-page "https://gitlab.gnome.org/julianschacher/top-bar-organizer")
    (synopsis "reorder indicators in the GNOME Shell top bar")
    (description "Top Bar Organizer is a GNOME Shell extension that lets you
reorder the items in the top bar.  You can move the clock, system indicators,
and other status icons to your preferred positions using a simple
drag-and-drop interface in the extension settings.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5. gpu-screen-recorder-notification --- overlay notification for GSR
;;; Lightweight notification overlay used by gpu-screen-recorder.
;;; -------------------------------------------------------------------
(define-public gpu-screen-recorder-notification
  (package
    (name "gpu-screen-recorder-notification")
    (version "1.0.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://repo.dec05eba.com/gpu-screen-recorder-notification")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list mesa
                  libx11
                  libxrandr
                  libxrender
                  libxext
                  wayland))
    (home-page "https://git.dec05eba.com/gpu-screen-recorder-notification")
    (synopsis "ShadowPlay-style notification overlay for GPU Screen Recorder")
    (description "GPU Screen Recorder Notification provides a lightweight
overlay notification system used by GPU Screen Recorder.  It displays
recording status notifications similar to NVIDIA ShadowPlay, with support
for both X11 and Wayland compositors.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 6. gpu-screen-recorder --- hardware-accelerated screen recorder
;;; Uses GPU encoding via VA-API/NVENC for near-zero CPU overhead.
;;; -------------------------------------------------------------------
(define-public gpu-screen-recorder
  (package
    (name "gpu-screen-recorder")
    (version "5.12.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://repo.dec05eba.com/gpu-screen-recorder")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config vulkan-headers))
    (inputs (list dbus
                  ffmpeg
                  libcap
                  libdrm
                  mesa
                  libjpeg-turbo
                  pipewire
                  pulseaudio
                  libva
                  libx11
                  libxcomposite
                  libxdamage
                  libxfixes
                  libxrandr
                  wayland))
    (home-page "https://git.dec05eba.com/gpu-screen-recorder")
    (synopsis "hardware-accelerated screen recorder with near-zero CPU usage")
    (description "GPU Screen Recorder is a screen recorder that uses GPU
hardware encoding (VA-API, NVENC, or AMF) to achieve extremely low CPU
usage.  It supports recording, replay (ShadowPlay-like), and streaming
with both X11 and Wayland, including support for HDR content and multiple
audio tracks.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. gpu-screen-recorder-gtk --- GTK3 frontend for GPU Screen Recorder
;;; Provides a graphical interface for configuring and controlling GSR.
;;; -------------------------------------------------------------------
(define-public gpu-screen-recorder-gtk
  (package
    (name "gpu-screen-recorder-gtk")
    (version "5.7.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://repo.dec05eba.com/gpu-screen-recorder-gtk")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list gtk+
                  libx11
                  gpu-screen-recorder))
    (home-page "https://git.dec05eba.com/gpu-screen-recorder-gtk")
    (synopsis "GTK3 frontend for GPU Screen Recorder")
    (description "GPU Screen Recorder GTK is a graphical frontend for GPU
Screen Recorder.  It provides a GTK3-based interface for configuring
recording settings, selecting capture regions, managing audio sources,
and controlling replay buffer features.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8. gpu-screen-recorder-ui --- fullscreen overlay UI for GSR
;;; Modern overlay interface with real-time status and controls.
;;; -------------------------------------------------------------------
(define-public gpu-screen-recorder-ui
  (package
    (name "gpu-screen-recorder-ui")
    (version "1.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://repo.dec05eba.com/gpu-screen-recorder-ui")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list mesa
                  libx11
                  libxrandr
                  libxrender
                  libxext
                  libxcursor
                  libxi
                  wayland
                  gpu-screen-recorder
                  gpu-screen-recorder-notification))
    (home-page "https://git.dec05eba.com/gpu-screen-recorder-ui")
    (synopsis "fullscreen overlay UI for GPU Screen Recorder")
    (description "GPU Screen Recorder UI is a fullscreen overlay interface
for GPU Screen Recorder.  It provides real-time recording status, replay
controls, and configuration options in a non-intrusive overlay that works
with both X11 and Wayland compositors.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 9. libresplit --- free speedrun timer with auto splitting
;;; GTK3 app for speedrunning with Lua scripting support.
;;; -------------------------------------------------------------------
(define-public libresplit
  (package
    (name "libresplit")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LibreSplit/LibreSplit")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list gtk+
                  jansson
                  luajit))
    (home-page "https://github.com/LibreSplit/LibreSplit")
    (synopsis "free speedrun timer with auto splitting and load removal")
    (description "LibreSplit is a free and open-source speedrun timer
application.  It supports split tracking, auto splitting through Lua
scripts, load time removal, and comparison against personal best and
other saved runs.  The interface is built with GTK3 for native Linux
desktop integration.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 10. gimp-plugin-gmic-qt --- G'MIC image processing plugin for GIMP
;;; Qt6-based GUI for G'MIC filters integrated into GIMP.
;;; -------------------------------------------------------------------
(define-public gimp-plugin-gmic-qt
  (package
    (name "gimp-plugin-gmic-qt")
    (version "3.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GreycLab/gmic-qt")
                    (commit (string-append "v." version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-DGMIC_QT_HOST=gimp"
              "-DENABLE_DYNAMIC_LINKING=ON")
      #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list fftw
                  gimp
                  glib
                  libx11
                  qtbase
                  zlib))
    (home-page "https://gmic.eu")
    (synopsis "G'MIC image processing plugin for GIMP with Qt interface")
    (description "This package provides the G'MIC-Qt plugin for GIMP,
giving access to over 500 image processing filters and effects.  G'MIC
(GREYC's Magic for Image Computing) is a full-featured framework for
image processing that includes filters for denoising, enhancement,
artistic effects, 3D rendering, and more.")
    (license (license:non-copyleft
              "https://cecill.info/licences/Licence_CeCILL-C_V1-en.html"
              "CeCILL-C (GPL-compatible)"))))

;;; -------------------------------------------------------------------
;;; 11. gr-limesdr --- GNU Radio source/sink blocks for LimeSDR
;;; CMake-based GNURadio out-of-tree module for LimeSDR hardware.
;;; -------------------------------------------------------------------
(define-public gr-limesdr
  (package
    (name "gr-limesdr")
    (version "3.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/myriadrf/gr-limesdr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list gnuradio
                  boost
                  python
                  swig))
    (home-page "https://github.com/myriadrf/gr-limesdr")
    (synopsis "GNU Radio source and sink blocks for LimeSDR devices")
    (description "gr-limesdr provides GNU Radio source and sink blocks for
LimeSDR software-defined radio hardware.  It allows using LimeSDR, LimeSDR
Mini, and LimeNET Micro boards as signal sources and sinks within GNU Radio
flowgraphs for receiving and transmitting radio signals.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. gr-foo --- custom GNU Radio blocks by Bastian Bloessl
;;; Utility blocks used by several other gr-* modules.
;;; -------------------------------------------------------------------
(define-public gr-foo
  (package
    (name "gr-foo")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bastibl/gr-foo")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list gnuradio
                  boost
                  log4cpp
                  python
                  swig))
    (home-page "https://github.com/bastibl/gr-foo")
    (synopsis "utility blocks for GNU Radio flowgraphs")
    (description "gr-foo provides custom utility blocks for GNU Radio,
including burst tagger, periodic message source, packet pad, and
Wireshark connector.  These blocks are commonly used as building blocks
by other GNU Radio out-of-tree modules such as gr-ieee802-11.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 13. gr-ieee802-11 --- IEEE 802.11 a/g/p transceiver for GNU Radio
;;; Implements Wi-Fi PHY layer in GNU Radio; depends on gr-foo.
;;; -------------------------------------------------------------------
(define-public gr-ieee802-11
  (package
    (name "gr-ieee802-11")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bastibl/gr-ieee802-11")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list gnuradio
                  boost
                  log4cpp
                  python
                  swig
                  gr-foo))
    (home-page "https://github.com/bastibl/gr-ieee802-11")
    (synopsis "IEEE 802.11 a/g/p transceiver for GNU Radio")
    (description "gr-ieee802-11 is a GNU Radio out-of-tree module that
implements an IEEE 802.11 a/g/p transceiver.  It provides a complete
Wi-Fi physical layer implementation for software-defined radio research,
including OFDM modulation/demodulation, channel estimation, and frame
detection.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. gr-lora-sdr --- LoRa transceiver for GNU Radio
;;; Software implementation of the LoRa PHY layer.
;;; -------------------------------------------------------------------
(define-public gr-lora-sdr
  (package
    (name "gr-lora-sdr")
    (version "0.5.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tapparelj/gr-lora_sdr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list gnuradio
                  boost
                  python
                  swig))
    (home-page "https://github.com/tapparelj/gr-lora_sdr")
    (synopsis "LoRa PHY layer transceiver for GNU Radio")
    (description "gr-lora-sdr is a GNU Radio out-of-tree module implementing
a full LoRa (Long Range) physical layer transceiver.  It provides modulation
and demodulation blocks for software-defined radio research on LoRa, the
low-power wide-area network protocol used in IoT applications.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. green-recorder --- simple screen recorder for Linux
;;; Python/GTK desktop screen recorder using FFmpeg.
;;; -------------------------------------------------------------------
(define-public green-recorder
  (package
    (name "green-recorder")
    (version "3.2.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dvershinin/green-recorder")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list python-pydbus
                  python-pygobject
                  python-urllib3
                  ffmpeg
                  imagemagick))
    (home-page "https://github.com/dvershinin/green-recorder")
    (synopsis "simple desktop screen recorder for Linux")
    (description "Green Recorder is a simple screen recorder for Linux
desktop environments.  It supports recording the full screen or a
selected area, with output to various formats including MKV, AVI, MP4,
and GIF.  It uses FFmpeg as the recording backend and provides a
GTK-based graphical interface.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 16. taskfile-to-tasks-python --- convert Taskfile.yml to editor tasks
;;; Small Python utility for converting Taskfile definitions.
;;; -------------------------------------------------------------------
(define-public taskfile-to-tasks-python
  (package
    (name "taskfile-to-tasks-python")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/H3mul/taskfile-to-tasks")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-pyyaml))
    (home-page "https://github.com/H3mul/taskfile-to-tasks")
    (synopsis "convert Taskfile.yml definitions to VS Code task format")
    (description "Taskfile-to-tasks is a Python utility that converts
Taskfile.yml task definitions into VS Code tasks.json format.  This
allows projects using Taskfile (a task runner alternative to Make) to
also provide IDE task integration without maintaining duplicate
configuration.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. gnome-x11-gesture-daemon --- touchpad gestures for GNOME on X11
;;; Rust daemon providing multi-touch gesture support via libinput.
;;; -------------------------------------------------------------------
(define-public gnome-x11-gesture-daemon
  (package
    (name "gnome-x11-gesture-daemon")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/harshadgavali/gnome-x11-gesture-daemon")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:cargo-inputs '()
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-service
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/share/dbus-1/services"))
                (copy-file "data/org.nickvision.gestures.service"
                           (string-append out "/share/dbus-1/services/"
                                          "org.nickvision.gestures.service"))))))))
    (inputs (list libinput))
    (home-page "https://github.com/harshadgavali/gnome-x11-gesture-daemon")
    (synopsis "touchpad gesture daemon for GNOME on X11")
    (description "GNOME X11 Gesture Daemon provides multi-touch touchpad
gesture support for GNOME desktop running on X11.  It reads gesture
events from libinput and translates them into GNOME Shell actions like
workspace switching and overview toggling, bringing Wayland-like gesture
support to X11 sessions.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. piper-voices-ru-ru --- Russian voice models for Piper TTS
;;; ONNX neural network voice models for Russian text-to-speech.
;;; -------------------------------------------------------------------
(define-public piper-voices-ru-ru
  (package
    (name "piper-voices-ru-ru")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://huggingface.co/rhasspy/piper-voices/resolve/v"
                    version "/ru/ru_RU/irina/medium/ru_RU-irina-medium.onnx"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ru_RU-irina-medium.onnx"
           "share/piper-voices/ru/ru_RU/irina/medium/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (mkdir-p ".")
              (copy-file source "ru_RU-irina-medium.onnx"))))))
    (home-page "https://github.com/rhasspy/piper")
    (synopsis "Russian voice model for Piper text-to-speech engine")
    (description "This package provides the Russian (Irina, medium quality)
ONNX neural network voice model for the Piper text-to-speech engine.
Piper is a fast, local neural text-to-speech system that runs on
commodity hardware without requiring cloud services.")
    (license license:expat)))
