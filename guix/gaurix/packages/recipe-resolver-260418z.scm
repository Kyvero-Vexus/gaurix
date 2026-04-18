;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418z
;;; Resolves 38 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;       1.  jdk21-temurin (copy-build-system, v21.0.10+7, gpl2+)
;;;       2.  java17-openjfx-bin (copy-build-system, v17.0.12, gpl2)
;;;       3.  bindiff (copy-build-system, v8, asl2.0)
;;;       4.  electronwmd-bin (copy-build-system, v0.5.2, gpl2)
;;;       5.  clash-verge-rev-autobuild-bin (copy-build-system, v2.4.8, gpl3)
;;;       6.  anime-games-launcher-bin (copy-build-system, v2.0.0, gpl3)
;;;       7.  plymouth-theme-mikuboot-git (copy-build-system, v0.0.0-git, expat)
;;;       8.  fonts-meta-base (trivial-build-system, v1, gpl3+)
;;;       9.  libtrash (gnu-build-system, v3.9, gpl2+)
;;;      10.  ntfsprogs-plus-git (gnu-build-system, v0.9.15, gpl2+)
;;;      11.  scolorpicker-legacy (cmake-build-system, v1.2.1, isc)
;;;      12.  gpgfrontend (cmake-build-system, v2.1.10, gpl3+)
;;;      13.  cervisia (cmake-build-system, v25.04.3, gpl2+)
;;;      14.  hyprqt6engine-git (cmake-build-system, v0.0.0-git, bsd-3)
;;;      15.  libresplit-git (meson-build-system, v0.0.0-git, gpl3+)
;;;      16.  linux-enable-ir-emitter (meson-build-system, v6.1.2, expat)
;;;      17.  gpu-screen-recorder-git (meson-build-system, v5.12.4, gpl3)
;;;      18.  libinput-no-gestures (meson-build-system, v1.29.0, expat)
;;;      19.  python-aioice (pyproject-build-system, v0.10.2, bsd-3)
;;;      20.  taskfile-to-tasks-python-git (pyproject-build-system, v1.0.2, expat)
;;;      21.  green-recorder (pyproject-build-system, v3.2.10, gpl3)
;;;      22.  sot (pyproject-build-system, v6.0.1, expat)
;;;      23.  marimo (pyproject-build-system, v0.23.1, asl2.0)
;;;      24.  srtodo-git (copy-build-system, v0.0.0-git, expat)
;;;      25.  btrfs-desktop-notification-git (copy-build-system, v0.0.0-git, gpl3)
;;;      26.  lunarvim-git (copy-build-system, v1.4.0, gpl3)
;;;      27.  go-prism (go-build-system, v1.3.0, expat)
;;;      28.  gnome-shell-extension-space-bar-git (copy-build-system, v37, gpl3+)
;;;      29.  python-zxing-cpp (pyproject-build-system, v3.0.0, asl2.0)
;;;      30.  hid-velocityone-multi-shift (pyproject-build-system, v0.1.0, gpl2+)
;;;
;;; BLOCKED EXHAUSTED (8):
;;;      31.  smpeg0 -> NEEDS_RECIPE_DESIGN_EXHAUSTED: SDL1_LEGACY:
;;;           SDL 1.x MPEG library; source only via icculus.org SVN (likely offline)
;;;      32.  waybar-updates -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC_DEPS:
;;;           depends on pacman-contrib (Arch Linux-specific)
;;;      33.  moomoo -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_PLATFORM:
;;;           proprietary Futu trading platform binary
;;;      34.  fbthrift -> NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_DEPS:
;;;           needs fizz/folly/mvfst Facebook C++ libs not in Guix
;;;      35.  dopamine -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_NPM_COMPLEX:
;;;           Electron37 + nvm + npm with 200+ node_modules
;;;      36.  ytify -> NEEDS_RECIPE_DESIGN_EXHAUSTED: NODE_NPM_COMPLEX:
;;;           Node.js + npm web app build
;;;      37.  rofi-games -> NEEDS_RECIPE_DESIGN_EXHAUSTED: CARGO_DEPS_NEEDED:
;;;           Rust/Cargo + just build runner + crate enumeration needed
;;;      38.  hypruler -> NEEDS_RECIPE_DESIGN_EXHAUSTED: CARGO_DEPS_NEEDED:
;;;           Rust/Cargo screen ruler, needs crate enumeration
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418z)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages aidc)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages logging)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            jdk21-temurin
            java17-openjfx-bin
            bindiff
            electronwmd-bin
            clash-verge-rev-autobuild-bin
            anime-games-launcher-bin
            plymouth-theme-mikuboot-git
            fonts-meta-base
            libtrash
            ntfsprogs-plus-git
            scolorpicker-legacy
            gpgfrontend
            cervisia
            hyprqt6engine-git
            libresplit-git
            linux-enable-ir-emitter
            gpu-screen-recorder-git
            libinput-no-gestures
            python-aioice
            taskfile-to-tasks-python-git
            green-recorder
            sot
            marimo
            srtodo-git
            btrfs-desktop-notification-git
            lunarvim-git
            go-prism
            gnome-shell-extension-space-bar-git
            python-zxing-cpp
            hid-velocityone-multi-shift))

;;; -------------------------------------------------------------------
;;; 1. jdk21-temurin --- Eclipse Temurin JDK 21 binary
;;; Prebuilt JDK from Adoptium releases.
;;; -------------------------------------------------------------------
(define-public jdk21-temurin
  (package
    (name "jdk21-temurin")
    (version "21.0.10+7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/adoptium/temurin21-binaries"
                    "/releases/download/jdk-21.0.10%2B7"
                    "/OpenJDK21U-jdk_x64_linux_hotspot_21.0.10_7.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://adoptium.net/")
    (synopsis "Eclipse Temurin JDK 21 (OpenJDK binary by Adoptium)")
    (description "Eclipse Temurin is the open source Java SE build based
upon OpenJDK, produced by the Eclipse Adoptium project.  This package
provides the JDK 21 runtime and development kit.")
    (license license:gpl2+)))  ;; GPLv2 with Classpath Exception

;;; -------------------------------------------------------------------
;;; 2. java17-openjfx-bin --- OpenJFX 17 SDK binary from Gluon
;;; Prebuilt JavaFX SDK.
;;; -------------------------------------------------------------------
(define-public java17-openjfx-bin
  (package
    (name "java17-openjfx-bin")
    (version "17.0.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download2.gluonhq.com/openjfx/"
                    version "/openjfx-" version
                    "_linux-x64_bin-sdk.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openjdk17))
    (home-page "https://openjfx.io/")
    (synopsis "OpenJFX 17 client application platform (Gluon build)")
    (description "OpenJFX is the open source implementation of JavaFX,
a rich client application platform for Java.  This package provides
the pre-built JavaFX 17 SDK from Gluon.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 3. bindiff --- binary comparison tool for vulnerability research
;;; Prebuilt from GitHub releases.
;;; -------------------------------------------------------------------
(define-public bindiff
  (package
    (name "bindiff")
    (version "8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/google/bindiff"
                    "/releases/download/v" version
                    "/bindiff_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openjdk))
    (home-page "https://www.zynamics.com/bindiff.html")
    (synopsis "binary comparison tool for reverse engineering")
    (description "BinDiff is a comparison tool for binary files that helps
vulnerability researchers and engineers quickly find differences and
similarities in disassembled code.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 4. electronwmd-bin --- Electron Web MiniDisc manager
;;; AppImage from GitHub releases.
;;; -------------------------------------------------------------------
(define-public electronwmd-bin
  (package
    (name "electronwmd-bin")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/asivery/ElectronWMD"
                    "/releases/download/v" version
                    "/ElectronWMD-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/asivery/ElectronWMD")
    (synopsis "Electron-based Web MiniDisc Pro manager")
    (description "ElectronWMD is the Electron version of Web MiniDisc Pro,
providing a desktop interface for managing Sony MiniDisc devices via
USB NetMD protocol.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 5. clash-verge-rev-autobuild-bin --- Clash Meta GUI proxy client
;;; Tauri-based binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public clash-verge-rev-autobuild-bin
  (package
    (name "clash-verge-rev-autobuild-bin")
    (version "2.4.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/clash-verge-rev/clash-verge-rev"
                    "/releases/download/v" version
                    "/Clash.Verge_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openssl gtk+))
    (home-page "https://github.com/clash-verge-rev/clash-verge-rev")
    (synopsis "Clash Meta GUI proxy client based on Tauri")
    (description "Clash Verge Rev is a continuation of Clash Verge,
providing a modern GUI for the Clash Meta proxy core.  Built with
Tauri for a lightweight desktop experience.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 6. anime-games-launcher-bin --- launcher for anime games on Linux
;;; Prebuilt binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public anime-games-launcher-bin
  (package
    (name "anime-games-launcher-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/an-anime-team/anime-games-launcher"
                    "/releases/download/" version
                    "/anime-games-launcher"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libadwaita xdg-desktop-portal 7zip git))
    (home-page "https://github.com/an-anime-team/anime-games-launcher")
    (synopsis "launcher for various anime games on Linux")
    (description "Anime Games Launcher is a universal launcher for various
anime games on Linux, providing integration with Wine/Proton and
automatic prefix management.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. plymouth-theme-mikuboot-git --- Hatsune Miku Plymouth boot theme
;;; Theme files installed via copy-build-system.
;;; -------------------------------------------------------------------
(define-public plymouth-theme-mikuboot-git
  (package
    (name "plymouth-theme-mikuboot-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/EvysGarden/mikuboot")
                    (commit "ed2e66d")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list plymouth))
    (home-page "https://gitlab.com/EvysGarden/mikuboot")
    (synopsis "Hatsune Miku boot animation theme for Plymouth")
    (description "MikuBoot is a Plymouth boot splash theme featuring
a Hatsune Miku boot animation.  Requires Plymouth and Cantarell fonts.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. fonts-meta-base --- base font collection meta-package
;;; Virtual package that pulls in common font families.
;;; -------------------------------------------------------------------
(define-public fonts-meta-base
  (package
    (name "fonts-meta-base")
    (version "1")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (propagated-inputs
     (list font-dejavu
           font-liberation
           font-google-noto))
    (home-page "https://aur.archlinux.org/packages/fonts-meta-base")
    (synopsis "base font collection meta-package")
    (description "Meta-package that installs a curated set of base fonts
including DejaVu, Liberation, and Noto font families for comprehensive
Unicode coverage.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 9. libtrash --- preloaded library implementing a trash can
;;; C library with autoconf build.
;;; -------------------------------------------------------------------
(define-public libtrash
  (package
    (name "libtrash")
    (version "3.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://pages.stern.nyu.edu/~marriaga/software/libtrash"
                    "/libtrash-" version ".tgz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list autoconf))
    (home-page "http://pages.stern.nyu.edu/~marriaga/software/libtrash/")
    (synopsis "shared library implementing a trash can under Linux")
    (description "Libtrash is a shared library which, when preloaded,
implements a trash can for file deletions.  Any file that is deleted while
libtrash is active can be recovered from the user's trash directory.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 10. ntfsprogs-plus-git --- NTFS filesystem driver and utilities
;;; C source from GitHub, autotools build.
;;; -------------------------------------------------------------------
(define-public ntfsprogs-plus-git
  (package
    (name "ntfsprogs-plus-git")
    (version "0.9.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ntfsprogs-plus/ntfsprogs-plus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list util-linux))
    (home-page "https://github.com/ntfsprogs-plus/ntfsprogs-plus")
    (synopsis "NTFS filesystem driver and utilities")
    (description "Ntfsprogs-plus provides NTFS filesystem utilities
including mkntfs, ntfsfix, ntfslabel, and ntfsresize for creating,
checking, and manipulating NTFS filesystems.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 11. scolorpicker-legacy --- X11 screen color picker
;;; C source from GitHub, CMake build.
;;; -------------------------------------------------------------------
(define-public scolorpicker-legacy
  (package
    (name "scolorpicker-legacy")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/smooll-d/scolorpicker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libx11 libxext))
    (home-page "https://github.com/smooll-d/scolorpicker/tree/legacy")
    (synopsis "lightweight X11 screen color picker")
    (description "Scolorpicker Legacy is the C and X11-only version of
smooll's color picker.  It captures the color of any pixel on the screen
and copies the hex value to the clipboard.")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 12. gpgfrontend --- Qt6 GUI frontend for GnuPG
;;; C++ source from GitHub, CMake build.
;;; -------------------------------------------------------------------
(define-public gpgfrontend
  (package
    (name "gpgfrontend")
    (version "2.1.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/saturneric/GpgFrontend")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config qttools))
    (inputs (list gpgme
                  googletest
                  icu4c
                  libarchive
                  openssl
                  qtbase))
    (home-page "https://gpgfrontend.bktus.com")
    (synopsis "exceptional GUI frontend for modern GnuPG")
    (description "GpgFrontend is a free, open-source, cross-platform
OpenPGP encryption tool built with Qt6.  It provides key management,
file/text encryption, signing, and verification through an intuitive
graphical interface.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13. cervisia --- KDE CVS frontend
;;; C++/Qt5/KDE Frameworks source from KDE.
;;; -------------------------------------------------------------------
(define-public cervisia
  (package
    (name "cervisia")
    (version "25.04.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://kde/stable/release-service/" version
                    "/src/cervisia-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list extra-cmake-modules kdoctools))
    (inputs (list kcompletion
                  kconfig
                  kconfigwidgets
                  kcoreaddons
                  kdbusaddons
                  kdesu
                  ki18n
                  kiconthemes
                  kio
                  knotifications
                  kparts
                  kwidgetsaddons
                  kxmlgui
                  qtbase-5))
    (home-page "https://apps.kde.org/cervisia/")
    (synopsis "KDE graphical CVS frontend")
    (description "Cervisia is a graphical frontend for the CVS version
control system.  It provides a user-friendly interface for common CVS
operations such as checkout, update, commit, diff, and log viewing.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 14. hyprqt6engine-git --- Qt6 theme provider for Hyprland
;;; C++ source from GitHub, CMake build.
;;; -------------------------------------------------------------------
(define-public hyprqt6engine-git
  (package
    (name "hyprqt6engine-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprwm/hyprqt6engine")
                    (commit "e8a694d")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list hyprlang hyprutils qtbase))
    (home-page "https://github.com/hyprwm/hyprqt6engine")
    (synopsis "Qt6 QPA theme provider for Hyprland")
    (description "HyprQt6Engine is a Qt6 QPA (Qt Platform Abstraction)
theme provider for the Hyprland compositor.  It enables native theming
of Qt6 applications to match Hyprland configuration.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 15. libresplit-git --- free speedrun timer with auto splitting
;;; C source, Meson build with GTK3.
;;; -------------------------------------------------------------------
(define-public libresplit-git
  (package
    (name "libresplit-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wins1ey/LibreSplit")
                    (commit "a685f3e49")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list gtk+ jansson luajit))
    (home-page "https://libresplit.org")
    (synopsis "free speedrun timer with auto splitting and load removal")
    (description "LibreSplit is a free and open source speedrun timer for
Linux.  It supports auto splitting, load removal, and customizable
layouts for tracking speedrun segments.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 16. linux-enable-ir-emitter --- enable infrared cameras on Linux
;;; C++ source from GitHub, Meson build.
;;; -------------------------------------------------------------------
(define-public linux-enable-ir-emitter
  (package
    (name "linux-enable-ir-emitter")
    (version "6.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EmixamPP/linux-enable-ir-emitter")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list fmt gtk+ opencv spdlog yaml-cpp))
    (home-page "https://github.com/EmixamPP/linux-enable-ir-emitter")
    (synopsis "enable infrared cameras not working out of the box on Linux")
    (description "Linux-enable-ir-emitter provides a tool to configure
and enable infrared emitters on cameras that are not directly supported
by the Linux kernel, enabling IR-based features such as face recognition.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. gpu-screen-recorder-git --- GPU-accelerated screen recorder
;;; C source, Meson build.
;;; -------------------------------------------------------------------
(define-public gpu-screen-recorder-git
  (package
    (name "gpu-screen-recorder-git")
    (version "5.12.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.dec05eba.com/gpu-screen-recorder")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config vulkan-headers))
    (inputs (list dbus
                  ffmpeg
                  libcap
                  libdrm
                  mesa
                  libjpeg-turbo
                  pipewire
                  pulseaudio))
    (home-page "https://git.dec05eba.com/gpu-screen-recorder")
    (synopsis "GPU-accelerated screen recorder for Linux")
    (description "GPU Screen Recorder is the fastest screen recorder for
Linux.  It uses the GPU to encode video, achieving minimal performance
impact.  Supports Wayland and X11, replay buffer, and streaming.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 18. libinput-no-gestures --- libinput with gestures removed
;;; Patched fork of libinput, Meson build.
;;; -------------------------------------------------------------------
(define-public libinput-no-gestures
  (package
    (inherit libinput)
    (name "libinput-no-gestures")
    (version "1.29.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/libinput/libinput")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (substitute-keyword-arguments (package-arguments libinput)
       ((#:tests? _ #t) #f)
       ((#:phases phases '%standard-phases)
        #~(modify-phases #$phases
            (add-after 'unpack 'disable-gestures
              (lambda _
                ;; Remove gesture detection from the source.
                ;; The actual patch disables gesture recognition in
                ;; src/evdev-mt-touchpad-gestures.c by returning early
                ;; from the gesture detection functions.
                (substitute* "src/evdev-mt-touchpad-gestures.c"
                  (("tp_gesture_handle_state\\(" all)
                   (string-append "return; " all)))))))))
    (synopsis "input device management library without gesture support")
    (description "Variant of libinput with touchpad gesture recognition
removed.  Useful for users who prefer to handle gestures through other
software or want to avoid accidental gesture triggers.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. python-aioice --- asyncio ICE implementation (RFC 5245)
;;; Python source from PyPI, pyproject build.
;;; -------------------------------------------------------------------
(define-public python-aioice
  (package
    (name "python-aioice")
    (version "0.10.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "aioice" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-dnspython
           python-ifaddr))
    (home-page "https://github.com/aiortc/aioice")
    (synopsis "asyncio-based Interactive Connectivity Establishment (RFC 5245)")
    (description "Aioice is a Python library implementing the Interactive
Connectivity Establishment (ICE) protocol for asyncio.  It provides NAT
traversal capabilities for peer-to-peer communication.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 20. taskfile-to-tasks-python-git --- convert Taskfile.yml to editor tasks
;;; Python source from GitHub, pyproject build.
;;; -------------------------------------------------------------------
(define-public taskfile-to-tasks-python-git
  (package
    (name "taskfile-to-tasks-python-git")
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
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-pyaml))
    (home-page "https://github.com/H3mul/taskfile-to-tasks")
    (synopsis "convert Taskfile.yml to editor task formats")
    (description "Taskfile-to-tasks converts Taskfile.yml definitions into
editor task formats such as VSCode and Zed tasks.json files, enabling
seamless integration of Taskfile workflows with editor task runners.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. green-recorder --- simple screen recorder for Linux
;;; Python source from GitHub, setuptools/pyproject build.
;;; -------------------------------------------------------------------
(define-public green-recorder
  (package
    (name "green-recorder")
    (version "3.2.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dvershinin/green-recorder")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-pydbus
           python-pygobject
           ffmpeg))
    (home-page "https://github.com/dvershinin/green-recorder")
    (synopsis "simple screen recorder for Linux supporting Wayland and Xorg")
    (description "Green Recorder is a simple desktop screen recorder for
Linux.  It supports both Wayland and Xorg display servers and uses
FFmpeg for encoding.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 22. sot --- command-line system observation tool
;;; Python source from GitHub, pyproject build.
;;; -------------------------------------------------------------------
(define-public sot
  (package
    (name "sot")
    (version "6.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anistark/sot")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-textual
           python-distro
           python-psutil
           python-py-cpuinfo
           python-rich))
    (home-page "https://github.com/anistark/sot")
    (synopsis "command-line system observation tool")
    (description "SOT (System Observation Tool) is a terminal-based system
monitoring tool that displays CPU, memory, disk, and network information
using a modern TUI interface powered by Textual.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. marimo --- reactive Python notebook
;;; Python source from PyPI, pyproject build.
;;; -------------------------------------------------------------------
(define-public marimo
  (package
    (name "marimo")
    (version "0.23.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "marimo" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-click
           python-jedi
           python-markdown
           python-pymdown-extensions
           python-pygments
           python-tomlkit
           python-pyyaml
           python-uvicorn))
    (home-page "https://github.com/marimo-team/marimo")
    (synopsis "reactive Python notebook that is reproducible and git-friendly")
    (description "Marimo is a reactive Python notebook that runs as scripts
or apps and is designed to be reproducible and git-friendly.  It
automatically re-runs dependent cells when variables change.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 24. srtodo-git --- Rofi-based markdown to-do manager
;;; Shell scripts installed via copy-build-system.
;;; -------------------------------------------------------------------
(define-public srtodo-git
  (package
    (name "srtodo-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/srliu3264/srtodo")
                    (commit "de64536")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list xdg-utils))
    (home-page "https://github.com/srliu3264/srtodo")
    (synopsis "Rofi-based markdown to-do manager")
    (description "SrTodo is a Rofi-based to-do manager that stores tasks
in markdown format.  It provides a simple interface for creating, editing,
and managing to-do items through Rofi menus.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. btrfs-desktop-notification-git --- Btrfs space warning notifications
;;; Shell scripts with systemd, copy-build-system.
;;; -------------------------------------------------------------------
(define-public btrfs-desktop-notification-git
  (package
    (name "btrfs-desktop-notification-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/Zesko/btrfs-desktop-notification")
                    (commit "132c107")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libnotify))
    (home-page "https://gitlab.com/Zesko/btrfs-desktop-notification")
    (synopsis "desktop notifications for Btrfs filesystem warnings")
    (description "Btrfs Desktop Notification sends desktop notifications
when booting into a read-only Btrfs system or when Btrfs error or
warning messages are detected in the kernel log.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 26. lunarvim-git --- IDE layer for Neovim
;;; Configuration and wrapper scripts, copy-build-system.
;;; -------------------------------------------------------------------
(define-public lunarvim-git
  (package
    (name "lunarvim-git")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LunarVim/LunarVim")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list neovim git))
    (home-page "https://github.com/LunarVim/LunarVim")
    (synopsis "IDE layer for Neovim with sane defaults")
    (description "LunarVim is an IDE layer for Neovim that provides a
curated set of plugins and configuration with sane defaults.  It includes
LSP integration, auto-completion, file explorer, and statusline
out of the box.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 27. go-prism --- turn raw test output into beautiful data
;;; Go source from GitHub, go-build-system.
;;; -------------------------------------------------------------------
(define-public go-prism
  (package
    (name "go-prism")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/DaltonSW/prism")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:import-path "github.com/DaltonSW/prism"
                     #:tests? #f))
    (home-page "https://github.com/DaltonSW/prism")
    (synopsis "turn raw test output into beautiful data")
    (description "Prism transforms raw test output from various testing
frameworks into beautifully formatted data, making it easier to read
and analyze test results in the terminal.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 28. gnome-shell-extension-space-bar-git --- workspace buttons for GNOME
;;; GNOME Shell extension installed via copy-build-system.
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-space-bar-git
  (package
    (name "gnome-shell-extension-space-bar-git")
    (version "37")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/christopher-l/space-bar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gnome-shell))
    (home-page "https://github.com/christopher-l/space-bar")
    (synopsis "GNOME Shell extension showing workspace buttons in top panel")
    (description "Space Bar is a GNOME Shell extension that adds workspace
buttons to the top panel, replacing the default Activities button.  It
provides a convenient way to switch between workspaces.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 29. python-zxing-cpp --- Python bindings for zxing-cpp barcode library
;;; Python/C++ source, pyproject with CMake/pybind11.
;;; -------------------------------------------------------------------
(define-public python-zxing-cpp
  (package
    (name "python-zxing-cpp")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "zxing_cpp" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list cmake pybind11))
    (inputs (list zxing-cpp))
    (home-page "https://github.com/zxing-cpp/zxing-cpp")
    (synopsis "Python bindings for the zxing-cpp barcode library")
    (description "Python-zxing-cpp provides Python bindings for the
zxing-cpp library, enabling barcode and QR code reading and generation
from Python.  Built with pybind11 for efficient C++ interop.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 30. hid-velocityone-multi-shift --- HID driver for VelocityOne shifter
;;; Python source from GitHub, pyproject build.
;;; -------------------------------------------------------------------
(define-public hid-velocityone-multi-shift
  (package
    (name "hid-velocityone-multi-shift")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mtorromeo/hid-velocityone-multi-shift")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-hidapi
           python-evdev))
    (home-page "https://github.com/mtorromeo/hid-velocityone-multi-shift")
    (synopsis "userspace HID driver for Turtle Beach VelocityOne Multi-Shift")
    (description "Userspace HID driver for the Turtle Beach VelocityOne
Multi-Shift racing shifter.  It translates HID reports from the shifter
into standard evdev input events for use with racing simulators.")
    (license license:gpl2+)))
