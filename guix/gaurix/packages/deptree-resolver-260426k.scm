;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260426k
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (9):
;;;   1. libatrac9 (C: Sony ATRAC9 audio codec library — new dep for vgmstream)
;;;   2. libunarr (C: archive extraction library — new dep for yacreader)
;;;   3. libuiohook (C: cross-platform user input hook library — new dep for obs-input-overlay)
;;;   4. vanilla-wiiu (C++: Wii U GamePad software clone for Linux)
;;;   5. lcd4linux (C: display info on LCDs and other displays)
;;;   6. librum (C++: modern e-book reader and library manager)
;;;   7. vgmstream (C: video game music stream decoder library)
;;;   8. yacreader (C++: comic reader and manager with poppler backend)
;;;   9. obs-input-overlay (C++: OBS plugin showing keyboard/gamepad/mouse input)
;;;
;;; Remaining BLOCKED: 94 packages (see blocked-notes)
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260426k)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libftdi)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vnc)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (libatrac9
            libunarr
            libuiohook
            vanilla-wiiu
            lcd4linux
            librum
            vgmstream
            yacreader
            obs-input-overlay))

;;; ---- 1. libatrac9 ----
;;; Sony ATRAC9 audio codec decoder library.
;;; Upstream: https://github.com/Thealexbarney/LibAtrac9
;;; Build: cmake-build-system
;;; License: MIT
;;; New dependency (required for vgmstream).

(define-public libatrac9
  (let ((commit "6a9e00f6c7abd74d037fd210b22c4a6b9e508a57")
        (revision "1"))
    (package
      (name "libatrac9")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Thealexbarney/LibAtrac9")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DBUILD_SHARED_LIBS=ON")))
      (synopsis "ATRAC9 audio codec decoder library")
      (description "LibAtrac9 is a library for decoding Sony's ATRAC9 audio
codec, commonly used in PlayStation Vita and PlayStation 4 game audio.  It
provides a C API for decoding ATRAC9 audio streams.")
      (home-page "https://github.com/Thealexbarney/LibAtrac9")
      (license license:expat))))

;;; ---- 2. libunarr ----
;;; Decompression library for RAR, TAR, ZIP, and 7z archives.
;;; Upstream: https://github.com/selmf/unarr
;;; Build: cmake-build-system
;;; License: LGPL-3.0+
;;; New dependency (required for yacreader).

(define-public libunarr
  (package
    (name "libunarr")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/selmf/unarr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list bzip2 xz zlib))
    (synopsis "lightweight decompression library for RAR, TAR, ZIP, and 7z")
    (description "Unarr is a decompression library for comic book archive
formats and other compressed files.  It supports RAR (including v5), TAR,
ZIP, and 7z archives through a simple, uniform C API.")
    (home-page "https://github.com/selmf/unarr")
    (license license:lgpl3+)))

;;; ---- 3. libuiohook ----
;;; Cross-platform keyboard and mouse hook library.
;;; Upstream: https://github.com/kwhat/libuiohook
;;; Build: cmake-build-system
;;; License: GPL-3.0+
;;; New dependency (required for obs-input-overlay).

(define-public libuiohook
  (package
    (name "libuiohook")
    (version "1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kwhat/libuiohook")
                    (commit (string-append version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libx11
                  libxext
                  libxi
                  libxinerama
                  libxrandr
                  libxrender
                  libxt
                  libxtst))
    (native-inputs (list pkg-config))
    (synopsis "cross-platform user input hook library")
    (description "libuiohook is a cross-platform C library for hooking
global keyboard and mouse events.  It provides a consistent API across
Linux (X11/evdev), macOS, and Windows for monitoring user input
without requiring application focus.")
    (home-page "https://github.com/kwhat/libuiohook")
    (license license:gpl3+)))

;;; ---- 4. vanilla-wiiu ----
;;; Wii U GamePad software clone for Linux.
;;; Upstream: https://github.com/vanilla-wiiu/vanilla
;;; Build: cmake-build-system
;;; License: GPL-2.0
;;; Resolves AUR vanilla-wiiu-git.

(define-public vanilla-wiiu
  (let ((commit "e0c22a4d")
        (revision "1"))
    (package
      (name "vanilla-wiiu")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/vanilla-wiiu/vanilla")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DCMAKE_BUILD_TYPE=Release")))
      (native-inputs (list pkg-config))
      (inputs (list ffmpeg
                    libnl
                    network-manager
                    openssl
                    sdl2
                    sdl2-image
                    sdl2-ttf))
      (synopsis "Wii U GamePad software clone for Linux")
      (description "Vanilla is a work-in-progress Wii U GamePad software
clone for Linux.  It allows a Linux device to connect to a Wii U console
as a wireless GamePad, streaming video and relaying controller input
over the local network.")
      (home-page "https://github.com/vanilla-wiiu/vanilla")
      (license license:gpl2))))

;;; ---- 5. lcd4linux ----
;;; Display system info on LCDs and other external displays.
;;; Upstream: https://github.com/jmccrohan/lcd4linux
;;; Build: gnu-build-system (autotools)
;;; License: GPL-2.0
;;; Resolves AUR lcd4linux-git.

(define-public lcd4linux
  (let ((commit "cb69a93d")
        (revision "1"))
    (package
      (name "lcd4linux")
      (version (git-version "0.11.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/jmccrohan/lcd4linux")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments
       (list #:tests? #f
             #:phases
             #~(modify-phases %standard-phases
                 (add-before 'configure 'bootstrap
                   (lambda _
                     (invoke "autoreconf" "-vfi"))))))
      (native-inputs (list autoconf automake libtool pkg-config))
      (inputs (list dbus
                    gd
                    glib
                    libftdi
                    libjpeg-turbo
                    libusb
                    libusb-compat
                    libvnc
                    libx11
                    mariadb
                    ncurses
                    sqlite))
      (synopsis "display system information on LCDs and other displays")
      (description "LCD4Linux grabs information from the kernel and other
sources and displays it on an external LCD or other output device.  It
supports a wide range of display hardware including USB, serial, and
network-attached displays, and can show system stats, sensor readings,
and custom metrics.")
      (home-page "https://github.com/jmccrohan/lcd4linux")
      (license license:gpl2))))

;;; ---- 6. librum ----
;;; Modern e-book reader and library manager.
;;; Upstream: https://github.com/Librum-Reader/Librum
;;; Build: cmake-build-system
;;; License: GPL-3.0
;;; Resolves AUR librum.

(define-public librum
  (package
    (name "librum")
    (version "0.12.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Librum-Reader/Librum")
                    (commit (string-append "v." version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release"
                   "-DFETCH_DEPENDENCIES=OFF")))
    (native-inputs (list pkg-config))
    (inputs (list curl
                  dbus
                  openssl
                  qtbase
                  qtdeclarative
                  qtsvg
                  zlib))
    (synopsis "modern e-book reader and library manager")
    (description "Librum is an e-book reader and library manager with a
modern Qt6/QML interface.  It supports EPUB, PDF, and other e-book
formats, provides cloud synchronization for your library, and offers
features like highlighting, bookmarking, and full-text search across
your collection.")
    (home-page "https://librumreader.com")
    (license license:gpl3)))

;;; ---- 7. vgmstream ----
;;; Video game music stream decoder library.
;;; Upstream: https://github.com/vgmstream/vgmstream
;;; Build: cmake-build-system
;;; License: ISC
;;; Resolves AUR vgmstream-git (dependency libatrac9 packaged above).

(define-public vgmstream
  (let ((commit "57df2e17")
        (revision "1"))
    (package
      (name "vgmstream")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/vgmstream/vgmstream")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DBUILD_CLI=ON"
                     "-DBUILD_FB2K=OFF"
                     "-DBUILD_AUDACIOUS=OFF")))
      (native-inputs (list pkg-config))
      (inputs (list ao
                    ffmpeg
                    libatrac9
                    libogg
                    libvorbis
                    mpg123
                    speex))
      (synopsis "library for decoding video game audio formats")
      (description "vgmstream is a library for decoding a wide variety of
streamed audio formats used in video games.  It supports over 1500
formats from various game platforms including PlayStation, Xbox,
Nintendo, and PC games.  A command-line player is included.")
      (home-page "https://github.com/vgmstream/vgmstream")
      (license license:isc))))

;;; ---- 8. yacreader ----
;;; Comic reader and library manager.
;;; Upstream: https://github.com/YACReader/yacreader
;;; Build: cmake-build-system
;;; License: GPL-3.0
;;; Resolves AUR yacreader-poppler-git (dependency libunarr packaged above).

(define-public yacreader
  (let ((commit "a425aef4")
        (revision "1"))
    (package
      (name "yacreader")
      (version (git-version "9.14.3" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/YACReader/yacreader")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DCMAKE_BUILD_TYPE=Release")))
      (native-inputs (list pkg-config qttools))
      (inputs (list libunarr
                    poppler-qt6
                    qtbase
                    qtdeclarative
                    qtmultimedia
                    qtsvg))
      (synopsis "comic reader for managing digital comic collections")
      (description "YACReader is a cross-platform comic reader for reading
and managing digital comic book collections.  It supports CBR, CBZ, PDF,
and other archive formats, provides a library manager for organizing
large collections, and features a built-in server for reading comics
on other devices.")
      (home-page "https://www.yacreader.com/")
      (license license:gpl3))))

;;; ---- 9. obs-input-overlay ----
;;; OBS Studio plugin displaying keyboard/gamepad/mouse input.
;;; Upstream: https://github.com/univrsal/input-overlay
;;; Build: cmake-build-system
;;; License: GPL-2.0
;;; Resolves AUR obs-plugin-input-overlay-git (dependency libuiohook packaged above).

(define-public obs-input-overlay
  (let ((commit "0992c07")
        (revision "1"))
    (package
      (name "obs-input-overlay")
      (version (git-version "5.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/univrsal/input-overlay")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list (string-append "-DLIBOBS_INCLUDE_DIR="
                                    #$(this-package-input "obs")
                                    "/include/obs"))))
      (native-inputs (list pkg-config))
      (inputs (list libuiohook obs))
      (synopsis "OBS Studio plugin showing keyboard, gamepad, and mouse input")
      (description "Input Overlay is a plugin for OBS Studio that displays
keyboard, gamepad, and mouse input as visual overlays during live streams
or recordings.  It supports customizable overlay layouts and multiple
input devices simultaneously.")
      (home-page "https://github.com/univrsal/input-overlay")
      (license license:gpl2))))
