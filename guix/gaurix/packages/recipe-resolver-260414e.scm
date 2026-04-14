;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414e
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 30 recipes created (gnu, cmake, meson, pyproject, copy, font, emacs)
;;;
;;; Recipes (30):
;;;   uemacs, vvdec, opencollada, spacecadetpinball, intel-ipsec-mb,
;;;   ebsl, finalmouse-cli, headsetstatus, qt-heif-image-plugin,
;;;   kplotting5, fortty, calf-no-gui, kpeoplevcard, hyprsysteminfo,
;;;   wl-shimeji, libretro-handy, scangearmp2-sane, tomoyo-tools,
;;;   python-pyrogram, qcomix, gearlever, icon-lang,
;;;   java21-openjfx-bin, polymc-qt5-bin, runelite-bin, hmcl-bin,
;;;   emacs-slime-git, minisystool, gcdemu, openal-hrtf
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260414e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages cdrom)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages scanner)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xml)
  #:export (uemacs
            vvdec
            opencollada
            spacecadetpinball
            intel-ipsec-mb
            ebsl
            finalmouse-cli
            headsetstatus
            qt-heif-image-plugin
            kplotting5
            fortty
            calf-no-gui
            kpeoplevcard
            hyprsysteminfo
            wl-shimeji
            libretro-handy
            scangearmp2-sane
            tomoyo-tools
            python-pyrogram
            qcomix
            gearlever
            icon-lang
            java21-openjfx-bin
            polymc-qt5-bin
            runelite-bin
            hmcl-bin
            emacs-slime-git
            minisystool
            gcdemu
            openal-hrtf))

;;;
;;; --- 1. uemacs (MicroEMACS by Linus Torvalds, gnu-build-system) ---
;;;

(define-public uemacs
  (let ((commit "20141208")
        (revision "1"))
    (package
      (name "uemacs")
      (version (string-append "4.0.15-" revision "." commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://git.kernel.org/pub/scm/editors/uemacs/uemacs.git")
                      (commit "8017734627f3621021e tried")))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments
       (list #:tests? #f
             #:make-flags
             #~(list (string-append "CC=" #$(cc-for-target))
                     (string-append "DESTDIR=" #$output)
                     "PREFIX=/")
             #:phases
             #~(modify-phases %standard-phases
                 (delete 'configure))))
      (inputs (list ncurses))
      (synopsis "MicroEMACS text editor customized by Linus Torvalds")
      (description "MicroEMACS/PK 4.0.15 is a lightweight text editor based on
MicroEMACS, customized by Linus Torvalds.  It provides basic editing capabilities
in a small, fast package.")
      (home-page "https://git.kernel.org/pub/scm/editors/uemacs/uemacs.git")
      (license license:public-domain))))

;;;
;;; --- 2. vvdec (Fraunhofer VVC decoder, cmake-build-system) ---
;;;

(define-public vvdec
  (package
    (name "vvdec")
    (version "3.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fraunhoferhhi/vvdec")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON")))
    (synopsis "Fraunhofer versatile video decoder for H.266/VVC")
    (description "VVdeC is the Fraunhofer Versatile Video Decoder, a fast
H.266/VVC decoder implementation.  It supports the Main 10 profile of the VVC
standard and is designed for high performance decoding.")
    (home-page "https://github.com/fraunhoferhhi/vvdec")
    (license license:bsd-3)))

;;;
;;; --- 3. opencollada (COLLADA file parser, cmake-build-system) ---
;;;

(define-public opencollada
  (package
    (name "opencollada")
    (version "1.6.68")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/KhronosGroup/OpenCOLLADA")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libxml2 pcre zlib))
    (synopsis "Stream-based reader and writer library for COLLADA files")
    (description "OpenCOLLADA is a stream-based reader and writer library for
COLLADA files.  COLLADA is an interchange file format for 3D content authoring
applications.  OpenCOLLADA is used by Blender, Maya, and other 3D tools.")
    (home-page "https://github.com/KhronosGroup/OpenCOLLADA")
    (license license:gpl2+)))

;;;
;;; --- 4. spacecadetpinball (reverse-engineered 3D Pinball, cmake) ---
;;;

(define-public spacecadetpinball
  (let ((commit "8017734")
        (revision "1"))
    (package
      (name "spacecadetpinball")
      (version "2.0.1")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/k4zmu2a/SpaceCadetPinball")
                      (commit (string-append "Release_" version))))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f))
      (inputs (list sdl2 sdl2-mixer))
      (synopsis "Reverse-engineered port of 3D Pinball Space Cadet")
      (description "SpaceCadetPinball is a reverse-engineered reimplementation
of the classic \"3D Pinball for Windows --- Space Cadet\" game.  It provides a
faithful recreation of the original gameplay on modern platforms.")
      (home-page "https://github.com/k4zmu2a/SpaceCadetPinball")
      (license license:expat))))

;;;
;;; --- 5. intel-ipsec-mb (Intel IPsec crypto, cmake) ---
;;;

(define-public intel-ipsec-mb
  (package
    (name "intel-ipsec-mb")
    (version "2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/intel/intel-ipsec-mb")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list nasm))
    (synopsis "Intel multi-buffer crypto library for IPsec")
    (description "The Intel Multi-Buffer Crypto for IPsec Library provides
highly optimized implementations of cryptographic algorithms used in IPsec,
including AES-CBC, AES-GCM, SHA, and others.  It is optimized for Intel
processors using SIMD instructions.")
    (home-page "https://github.com/intel/intel-ipsec-mb")
    (license license:bsd-3)))

;;;
;;; --- 6. ebsl (shell-accessible config format, cmake) ---
;;;

(define-public ebsl
  (package
    (name "ebsl")
    (version "2.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aarikpokras/ebsl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "shell-accessible configuration file format")
    (description "EBSL is a shell-accessible configuration file format.  It
provides a simple, human-readable format for configuration files that can be
easily parsed and manipulated from shell scripts.")
    (home-page "https://github.com/aarikpokras/ebsl")
    (license license:expat)))

;;;
;;; --- 7. finalmouse-cli (Finalmouse polling rate CLI, cmake) ---
;;;

(define-public finalmouse-cli
  (package
    (name "finalmouse-cli")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/2thgun/finalmouse-cli")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list hidapi))
    (synopsis "CLI tool to set Finalmouse polling rate")
    (description "Finalmouse-cli is a command-line tool to configure the
polling rate of Finalmouse devices on Linux.  It communicates with the
mouse via the HID interface.")
    (home-page "https://github.com/2thgun/finalmouse-cli")
    (license license:expat)))

;;;
;;; --- 8. headsetstatus (headset battery tray app, cmake/Qt6) ---
;;;

(define-public headsetstatus
  (package
    (name "headsetstatus")
    (version "1.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mewset/headsetstatus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase upower))
    (native-inputs (list pkg-config))
    (synopsis "headset battery and connection status tray app for Linux")
    (description "HeadsetStatus is a fast Linux tray application that displays
headset battery level and connection status with desktop notifications.  It
supports Bluetooth headsets via UPower and provides a Qt6-based system tray
icon.")
    (home-page "https://github.com/mewset/headsetstatus")
    (license license:expat)))

;;;
;;; --- 9. qt-heif-image-plugin (Qt5 HEIF plugin, cmake) ---
;;;

(define-public qt-heif-image-plugin
  (package
    (name "qt-heif-image-plugin")
    (version "0.3.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jakar/qt-heif-image-plugin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase-5 libheif))
    (synopsis "Qt plugin for HEIF images")
    (description "Qt-heif-image-plugin provides a Qt5 image format plugin for
reading HEIF (High Efficiency Image Format) files.  Once installed, Qt5
applications can transparently load @file{.heif} and @file{.heic} images.")
    (home-page "https://github.com/jakar/qt-heif-image-plugin")
    (license license:lgpl3+)))

;;;
;;; --- 10. kplotting5 (KDE lightweight plotting, Qt5, cmake) ---
;;;

(define-public kplotting5
  (package
    (name "kplotting5")
    (version "5.116.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/frameworks/"
                                  (version-major+minor version)
                                  "/kplotting-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase-5))
    (native-inputs (list extra-cmake-modules))
    (synopsis "lightweight plotting framework for KDE Frameworks 5")
    (description "KPlotting provides a lightweight widget for plotting data
in Qt5 applications.  It is part of KDE Frameworks 5 and supports line plots,
bar plots, and custom plot objects.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl2.1+)))

;;;
;;; --- 11. fortty (GPU-accelerated Fortran terminal, cmake) ---
;;;

(define-public fortty
  (package
    (name "fortty")
    (version "0.1.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FortranGoingOnForty/fortty")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list glfw freetype fontconfig))
    (native-inputs (list gfortran-toolchain pkg-config))
    (synopsis "GPU-accelerated terminal emulator written in Fortran")
    (description "Fortty is a GPU-accelerated terminal emulator written in
Fortran.  It uses OpenGL via GLFW for rendering and FreeType for font
rasterization, providing a novel implementation of a terminal emulator.")
    (home-page "https://github.com/FortranGoingOnForty/fortty")
    (license license:expat)))

;;;
;;; --- 12. calf-no-gui (LV2 audio plugins without GUI, cmake) ---
;;;

(define-public calf-no-gui
  (package
    (name "calf-no-gui")
    (version "0.90.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://calf-studio-gear.org/files/calf-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:configure-flags
           #~(list "--without-gui"
                   (string-append "--prefix=" #$output))
           #:tests? #f))
    (inputs (list expat fluidsynth jack-2 lv2))
    (native-inputs (list pkg-config autoconf automake libtool))
    (synopsis "LV2 plug-in suite for audio production without GUI")
    (description "Calf Studio Gear is a suite of high-quality open-source
audio plug-ins for the LV2 standard.  This build disables the GUI for
headless or minimal installations, providing synthesizers, effects, and
signal processors for use with JACK and LV2 hosts.")
    (home-page "https://calf-studio-gear.org")
    (license license:gpl2+)))

;;;
;;; --- 13. kpeoplevcard (KDE VCard-to-KPeople bridge, cmake) ---
;;;

(define-public kpeoplevcard
  (package
    (name "kpeoplevcard")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://kde/stable/kpeoplevcard/"
                    version "/kpeoplevcard-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list kpeople kcontacts))
    (native-inputs (list extra-cmake-modules))
    (synopsis "expose VCard contacts to KPeople")
    (description "KPeopleVCard is a KDE library that exposes VCard contact
files to the KPeople contact aggregation framework.  It allows VCard-based
contacts to be available in KDE applications that use KPeople.")
    (home-page "https://kde.org")
    (license license:lgpl2.1+)))

;;;
;;; --- 14. hyprsysteminfo (Hyprland system info, cmake/Qt6) ---
;;;

(define-public hyprsysteminfo
  (package
    (name "hyprsysteminfo")
    (version "0.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprwm/hyprsysteminfo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list hyprutils
                  hyprland-qt-support
                  qtbase
                  qtdeclarative
                  qtwayland
                  pciutils
                  wayland))
    (native-inputs (list pkg-config))
    (synopsis "Hyprland system information Qt6/QML application")
    (description "HyprSystemInfo is a small Qt6/QML application that displays
information about the running system, designed to work with the Hyprland
Wayland compositor.  It shows GPU, CPU, memory, and compositor details.")
    (home-page "https://github.com/hyprwm/hyprsysteminfo")
    (license license:bsd-3)))

;;;
;;; --- 15. wl-shimeji (Wayland desktop pet in C, meson) ---
;;;

(define-public wl-shimeji
  (let ((commit "8ae15cf")
        (revision "1"))
    (package
      (name "wl-shimeji")
      (version (string-append "0.0.2-" revision "." commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/CluelessCatBurger/wl_shimeji")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments
       (list #:tests? #f))
      (inputs (list wayland
                    wayland-protocols
                    python
                    python-pillow))
      (native-inputs (list pkg-config))
      (synopsis "Shimeji desktop pet reimplementation for Wayland")
      (description "wl_shimeji is a reimplementation of the Shimeji desktop pet
for Wayland compositors.  Written in C, it provides animated characters that
walk around and interact with your desktop windows using Wayland protocols.")
      (home-page "https://github.com/CluelessCatBurger/wl_shimeji")
      (license license:gpl2))))

;;;
;;; --- 16. libretro-handy (libretro Atari Lynx core, gnu Makefile) ---
;;;

(define-public libretro-handy
  (let ((commit "aceb3ee")
        (revision "1"))
    (package
      (name "libretro-handy")
      (version (string-append "0.0-" revision "." commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/libretro/libretro-handy")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments
       (list #:tests? #f
             #:make-flags
             #~(list (string-append "CC=" #$(cc-for-target))
                     (string-append "CXX=" (string-append
                                            #$(cc-for-target) "++")))
             #:phases
             #~(modify-phases %standard-phases
                 (delete 'configure)
                 (replace 'install
                   (lambda* (#:key outputs #:allow-other-keys)
                     (let* ((out (assoc-ref outputs "out"))
                            (libdir (string-append out "/lib/libretro")))
                       (mkdir-p libdir)
                       (install-file "handy_libretro.so" libdir)))))))
      (inputs (list zlib))
      (synopsis "libretro core for Atari Lynx emulation (Handy)")
      (description "Libretro-handy is a libretro implementation of the Handy
Atari Lynx emulator.  It allows playing Atari Lynx games through libretro
frontends such as RetroArch.")
      (home-page "https://github.com/libretro/libretro-handy")
      (license license:gpl2+))))

;;;
;;; --- 17. scangearmp2-sane (Canon scanner SANE backend, cmake) ---
;;;

(define-public scangearmp2-sane
  (let ((commit "78ec743")
        (revision "1"))
    (package
      (name "scangearmp2-sane")
      (version (string-append "4.60-" revision "." commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/ThierryHFR/scangearmp2")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f))
      (inputs (list gtk+ sane-backends libjpeg-turbo libusb))
      (native-inputs (list pkg-config intltool))
      (synopsis "Canon ScanGear MP v2 scanner utility and SANE backend")
      (description "ScanGearMP2-SANE provides a SANE backend and scanning
utility for Canon multi-function printers.  It allows scanning from Canon
devices using standard SANE-compatible applications on Linux.")
      (home-page "https://github.com/ThierryHFR/scangearmp2")
      (license license:gpl2+))))

;;;
;;; --- 18. tomoyo-tools (TOMOYO Linux security tools, gnu Makefile) ---
;;;

(define-public tomoyo-tools
  (package
    (name "tomoyo-tools")
    (version "2.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/tomoyo/tomoyo-tools-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list ncurses))
    (synopsis "userspace tools for TOMOYO Linux security module")
    (description "TOMOYO Linux tools provide the userspace utilities for
managing the TOMOYO Linux mandatory access control (MAC) security module.
They allow administrators to define and enforce security policies for
processes, files, and network operations.")
    (home-page "https://tomoyo.osdn.jp/")
    (license license:gpl2)))

;;;
;;; --- 19. python-pyrogram (Telegram MTProto API, pyproject) ---
;;;

(define-public python-pyrogram
  (package
    (name "python-pyrogram")
    (version "2.0.106")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "Pyrogram" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-pyaes python-pysocks))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "elegant Telegram MTProto API framework for Python")
    (description "Pyrogram is an elegant, modern and asynchronous Telegram
MTProto API framework for Python.  It enables building Telegram client
applications and bots with a clean, Pythonic API.")
    (home-page "https://github.com/pyrogram/pyrogram")
    (license license:lgpl3+)))

;;;
;;; --- 20. qcomix (Qt6 comic viewer, cmake) ---
;;;

(define-public qcomix
  (package
    (name "qcomix")
    (version "1.0b7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitgud.io/qcomix/qcomix")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase qtmultimedia quazip))
    (synopsis "Qt-based comic viewer")
    (description "QComix is a Qt6-based comic book viewer that supports
various archive formats including CBZ, CBR, and CB7.  It provides a clean
reading interface with page navigation and zoom controls.")
    (home-page "https://gitgud.io/qcomix/qcomix")
    (license license:gpl3+)))

;;;
;;; --- 21. gearlever (AppImage manager, meson/Python/GTK4) ---
;;;

(define-public gearlever
  (package
    (name "gearlever")
    (version "4.4.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mijorus/gearlever")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:glib-or-gtk? #t))
    (inputs (list gtk
                  libadwaita
                  python
                  python-pygobject
                  python-requests
                  squashfs-tools))
    (native-inputs (list gettext-minimal
                         glib
                         desktop-file-utils
                         pkg-config))
    (synopsis "manage AppImages with ease")
    (description "Gear Lever is a GTK4/Libadwaita application for managing
AppImages on Linux.  It provides a graphical interface for organizing,
integrating, and running AppImage applications, including desktop file
creation and updates.")
    (home-page "https://gearlever.mijorus.it/")
    (license license:gpl3+)))

;;;
;;; --- 22. icon-lang (Icon programming language, gnu Makefile) ---
;;;

(define-public icon-lang
  (package
    (name "icon-lang")
    (version "9.5.22e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gtownsend/icon")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "make" "Configure" "name=linux")))
               (add-after 'build 'install-manual
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (for-each (lambda (f)
                                 (install-file f bin))
                               (find-files "bin" "."))))))))
    (inputs (list libx11 libxt))
    (synopsis "Icon programming language implementation")
    (description "Icon is a high-level, general-purpose programming language
with a focus on string processing and pattern matching.  This is the reference
implementation of the Icon language maintained by Gregg Townsend.")
    (home-page "https://www.cs.arizona.edu/icon/")
    (license license:public-domain)))

;;;
;;; --- 23. java21-openjfx-bin (JavaFX 21 binary SDK, copy) ---
;;;

(define-public java21-openjfx-bin
  (package
    (name "java21-openjfx-bin")
    (version "21.0.10")
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
    (arguments
     (list #:install-plan
           #~'(("lib/" "lib/")
               ("legal/" "share/legal/"))))
    (inputs (list openjdk21))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "JavaFX 21 client application platform (Gluon binary)")
    (description "OpenJFX is the open-source implementation of JavaFX, the
client application platform for Java.  This package provides the pre-built
binary SDK from Gluon for JavaFX 21, including modules for media, web,
graphics, and FXML.")
    (home-page "https://openjfx.io/")
    (license license:gpl2)))

;;;
;;; --- 24. polymc-qt5-bin (PolyMC Minecraft launcher binary, copy) ---
;;;

(define-public polymc-qt5-bin
  (package
    (name "polymc-qt5-bin")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/PolyMC/PolyMC/releases/download/"
                    version "/PolyMC-Linux-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/" "bin/")
               ("share/" "share/"))))
    (inputs (list openjdk17 qtbase-5 zlib mesa))
    (supported-systems '("x86_64-linux"))
    (synopsis "Minecraft launcher with multi-instance management")
    (description "PolyMC is an open-source Minecraft launcher with the ability
to manage multiple instances, accounts, and mods.  This package provides
the pre-built Qt5 binary release.")
    (home-page "https://github.com/PolyMC/PolyMC")
    (license license:gpl3+)))

;;;
;;; --- 25. runelite-bin (Old School RuneScape client JAR, copy) ---
;;;

(define-public runelite-bin
  (package
    (name "runelite-bin")
    (version "2.7.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/runelite/launcher/releases/download/"
                    version "/RuneLite.jar"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("RuneLite.jar" "share/java/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (jar (string-append out "/share/java/RuneLite.jar"))
                          (java (search-input-file inputs "bin/java")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/runelite")
                       (lambda ()
                         (format #t "#!/bin/sh\nexec ~a -jar ~a \"$@\"\n"
                                 java jar)))
                     (chmod (string-append bin "/runelite") #o755)))))))
    (inputs (list openjdk17))
    (synopsis "open source Old School RuneScape client")
    (description "RuneLite is an open-source client for Old School RuneScape
with a large plugin ecosystem.  It provides quality-of-life enhancements,
an XP tracker, and various gameplay overlays.")
    (home-page "https://runelite.net/")
    (license license:bsd-2)))

;;;
;;; --- 26. hmcl-bin (Hello Minecraft Launcher JAR, copy) ---
;;;

(define-public hmcl-bin
  (package
    (name "hmcl-bin")
    (version "3.12.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/HMCL-dev/HMCL/releases/download/v"
                    version "/HMCL-" version ".jar"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "HMCL-" #$version ".jar")
                "share/java/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (jar (string-append out "/share/java/HMCL-"
                                              #$version ".jar"))
                          (java (search-input-file inputs "bin/java")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/hmcl")
                       (lambda ()
                         (format #t "#!/bin/sh\nexec ~a -jar ~a \"$@\"\n"
                                 java jar)))
                     (chmod (string-append bin "/hmcl") #o755)))))))
    (inputs (list openjdk17))
    (synopsis "multi-functional cross-platform Minecraft launcher")
    (description "HMCL (Hello Minecraft! Launcher) is a multi-functional,
cross-platform Minecraft launcher.  It supports multiple game versions,
mod management, and account management with a clean user interface.")
    (home-page "https://github.com/HMCL-dev/HMCL")
    (license license:gpl3+)))

;;;
;;; --- 27. emacs-slime-git (SLIME from git, emacs-build-system) ---
;;;

(define-public emacs-slime-git
  (let ((commit "8cb09801")
        (revision "1"))
    (package
      (name "emacs-slime-git")
      (version (string-append "2.24-" revision "." commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/slime/slime")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system emacs-build-system)
      (arguments
       (list #:tests? #f
             #:include #~'("^slime\\.el$"
                           "^slime-autoloads\\.el$"
                           "^contrib/.*\\.el$"
                           "^lib/.*\\.el$"
                           "^swank/.*\\.lisp$"
                           "^swank\\.lisp$")))
      (home-page "https://slime.common-lisp.dev")
      (synopsis "Superior Lisp Interaction Mode for Emacs (development)")
      (description "SLIME (the Superior Lisp Interaction Mode for Emacs) is an
Emacs mode for Common Lisp development.  This package tracks the latest
development version from git, providing the newest features and fixes.")
      (license license:gpl2+))))

;;;
;;; --- 28. minisystool (GTK system info tool, gnu Makefile) ---
;;;

(define-public minisystool
  (package
    (name "minisystool")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sidegemninja/minisystool")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output)
                   (string-append "CFLAGS="
                                  (string-join
                                   (list
                                    (string-append
                                     "-I" (search-input-directory
                                           %build-inputs "include/gtk-3.0"))))))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "minisystool" bin)))))))
    (inputs (list gtk+))
    (native-inputs (list pkg-config))
    (synopsis "simple GTK system information tool")
    (description "MiniSysTool is a simple GTK-based system information tool
that displays basic information about the running system including CPU, memory,
and operating system details in a minimal graphical interface.")
    (home-page "https://github.com/sidegemninja/minisystool")
    (license license:gpl3+)))

;;;
;;; --- 29. gcdemu (GNOME applet for CDEmu, cmake) ---
;;;

(define-public gcdemu
  (package
    (name "gcdemu")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/cdemu/gcdemu/gcdemu-"
                    version "/gcdemu-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list cdemu-daemon
                  python-pygobject
                  gdk-pixbuf
                  gtk+
                  libnotify))
    (native-inputs (list cmake intltool pkg-config gettext-minimal))
    (synopsis "GNOME panel applet for controlling cdemu-daemon")
    (description "gCDEmu is a GNOME panel applet that provides a graphical
interface for controlling the cdemu-daemon CD/DVD emulation daemon.  It
allows mounting and unmounting disc images with a simple tray interface.")
    (home-page "https://cdemu.sourceforge.io/")
    (license license:gpl2)))

;;;
;;; --- 30. openal-hrtf (HRTF data for OpenAL spatial audio, copy) ---
;;;

(define-public openal-hrtf
  (package
    (name "openal-hrtf")
    (version "1.24.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kcat/openal-soft")
                    (commit (string-append version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hrtf/" "share/openal/hrtf/"))))
    (synopsis "HRTF data files for OpenAL spatial audio")
    (description "This package provides Head-Related Transfer Function (HRTF)
data files for use with OpenAL Soft.  HRTF enables realistic 3D audio
spatialization over headphones by simulating how sound reaches each ear.")
    (home-page "https://openal-soft.org/")
    (license license:cc0)))
