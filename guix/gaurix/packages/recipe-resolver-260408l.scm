;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408l
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 10 new recipes (cmake/pyproject/gnu/copy build systems)
;;;   - 20 re-evaluated with specific blocking reasons
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408l)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:export (
            ;; New recipes
            wafw00f
            yamlfix
            pamix
            wb32-dfu-updater
            holyc-lang
            sdbus-cpp
            alacritty-use-theme-with-gnome-darkmode
            sayonara-player
            mrboom
            pixelterm-c))

;;;
;;; ── wafw00f ──────────────────────────────────────────
;;; Web Application Firewall detection tool
;;;
(define-public wafw00f
  (package
    (name "wafw00f")
    (version "2.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/EnableSecurity/wafw00f")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite in upstream
    (propagated-inputs (list python-requests))
    (home-page "https://github.com/EnableSecurity/wafw00f")
    (synopsis "Web application firewall detection tool")
    (description
     "WAFW00F identifies and fingerprints Web Application Firewall (WAF)
products protecting a website.  It sends a series of HTTP requests and
analyzes responses to detect over 100 WAF products including
Cloudflare, AWS WAF, Akamai, and others.")
    (license license:bsd-3)))

;;;
;;; ── yamlfix ──────────────────────────────────────────
;;; YAML file formatter and fixer
;;;
(define-public yamlfix
  (package
    (name "yamlfix")
    (version "1.19.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lyz-code/yamlfix")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; test deps not packaged (pytest-xdist, etc.)
    (propagated-inputs
     (list python-click python-ruyaml))
    (home-page "https://github.com/lyz-code/yamlfix")
    (synopsis "YAML file formatter and fixer")
    (description
     "Yamlfix is a configurable YAML formatter that keeps your YAML files
consistent.  It fixes indentation, quoting style, key ordering, comment
formatting, and other style issues.  Usable as a CLI tool or Python
library.")
    (license license:gpl3+)))

;;;
;;; ── pamix ──────────────────────────────────────────
;;; PulseAudio terminal mixer
;;;
(define-public pamix
  (package
    (name "pamix")
    (version "2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/patroclos/PAmix")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list pulseaudio ncurses))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/patroclos/PAmix")
    (synopsis "Terminal-based PulseAudio mixer")
    (description
     "PAmix is a ncurses PulseAudio mixer.  It allows controlling
sink and source volumes, moving streams between devices, and
monitoring audio levels, all from a terminal interface.")
    (license license:expat)))

;;;
;;; ── wb32-dfu-updater ──────────────────────────────────────────
;;; USB DFU programmer for WB32 microcontrollers
;;;
(define-public wb32-dfu-updater
  (package
    (name "wb32-dfu-updater")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/WestberryTech/wb32-dfu-updater")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list libusb))
    (home-page "https://github.com/WestberryTech/wb32-dfu-updater")
    (synopsis "USB DFU firmware updater for WB32 microcontrollers")
    (description
     "WB32 DFU Updater is a host-side tool for programming Westberry WB32
microcontrollers over USB Device Firmware Upgrade (DFU).  It supports
firmware flashing and verification for WB32F3G71 and similar MCUs.")
    (license license:asl2.0)))

;;;
;;; ── holyc-lang ──────────────────────────────────────────
;;; HolyC programming language compiler
;;;
(define-public holyc-lang
  (package
    (name "holyc-lang")
    (version "0.0.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Jamesbarford/holyc-lang")
             (commit (string-append "beta-v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list sqlite))
    (home-page "https://github.com/Jamesbarford/holyc-lang")
    (synopsis "HolyC programming language compiler and runtime")
    (description
     "Holyc-lang is an implementation of the HolyC programming language,
inspired by TempleOS.  It includes a compiler and runtime that support
HolyC syntax including inline assembly, closures, and automatic type
casting.  Programs can be compiled to native x86-64 binaries.")
    (license license:bsd-2)))

;;;
;;; ── sdbus-cpp ──────────────────────────────────────────
;;; High-level C++ D-Bus library
;;;
(define-public sdbus-cpp
  (package
    (name "sdbus-cpp")
    (version "2.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Kistler-Group/sdbus-cpp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-DSDBUSCPP_BUILD_TESTS=OFF"
              "-DSDBUSCPP_BUILD_LIBSYSTEMD=OFF")
      #:tests? #f))
    (inputs (list elogind))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/Kistler-Group/sdbus-cpp")
    (synopsis "High-level C++ D-Bus library built on top of sd-bus")
    (description
     "sdbus-c++ provides a high-level C++17 API for D-Bus IPC on Linux.
It wraps the sd-bus library from systemd/elogind, providing a
convenient, type-safe interface for creating D-Bus services and
clients with support for signals, properties, and async operations.")
    (license license:lgpl2.1)))

;;;
;;; ── alacritty-use-theme-with-gnome-darkmode ──────────────────
;;; Auto-switch Alacritty theme with GNOME dark mode
;;;
(define-public alacritty-use-theme-with-gnome-darkmode
  (package
    (name "alacritty-use-theme-with-gnome-darkmode")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/alacritty-use-theme/alacritty-use-theme-with-gnome-darkmode")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("alacritty-use-theme-with-gnome-darkmode.sh"
           "bin/alacritty-use-theme-with-gnome-darkmode"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'wrap-script
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (wrap-program
                    (string-append out "/bin/alacritty-use-theme-with-gnome-darkmode")
                  `("PATH" prefix
                    (,(string-append (assoc-ref inputs "bash") "/bin"))))))))))
    (inputs (list bash))
    (home-page
     "https://github.com/alacritty-use-theme/alacritty-use-theme-with-gnome-darkmode")
    (synopsis "Auto-switch Alacritty themes with GNOME dark mode")
    (description
     "A shell script that monitors GNOME's dark mode setting via D-Bus and
automatically switches Alacritty's color theme between light and dark
variants.  It watches for changes to the GNOME color-scheme preference
and updates Alacritty's configuration file in real time.")
    (license license:gpl3)))

;;;
;;; ── sayonara-player ──────────────────────────────────────────
;;; Lightweight Qt music player
;;;
(define-public sayonara-player
  (package
    (name "sayonara-player")
    (version "1.11.0-stable1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/luciocarreras/sayonara-player")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require running X server
    (inputs
     (list qtbase-5
           qtsvg-5
           gstreamer
           gst-plugins-base
           taglib
           zlib))
    (native-inputs (list pkg-config qttools-5))
    (home-page "https://sayonara-player.com")
    (synopsis "Lightweight Qt-based music player")
    (description
     "Sayonara Player is a small, clear, and fast audio player for Linux
written in C++ with Qt.  It uses GStreamer for playback and supports
features like playlists, an equalizer, streaming, dynamic playback,
bookmarks, podcasts, and gapless playback.")
    (license license:gpl3)))

;;;
;;; ── mrboom ──────────────────────────────────────────
;;; Bomberman clone for up to 8 players
;;;
(define-public mrboom
  (package
    (name "mrboom")
    (version "5.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Javanaise/mrboom-libretro")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f  ;; no test suite
      #:make-flags
      #~(list (string-append "CC=" #$(cc-for-target))
              (string-append "CXX=" #$(cxx-for-target))
              (string-append "PREFIX=" #$output)
              "LIBRETRO=0")  ;; build standalone SDL2 version
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)  ;; no configure script
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (install-file "mrboom" bin)))))))
    (inputs (list sdl2 sdl2-mixer minizip))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/Javanaise/mrboom-libretro")
    (synopsis "Bomberman clone for up to 8 players")
    (description
     "Mr.Boom is a Bomberman clone for up to 8 players.  It supports
local multiplayer with keyboard and gamepads.  The game features
classic Bomberman gameplay with destructible environments, power-ups,
and multiple arenas.")
    (license license:expat)))

;;;
;;; ── pixelterm-c ──────────────────────────────────────────
;;; Terminal image and video viewer
;;;
(define-public pixelterm-c
  (package
    (name "pixelterm-c")
    (version "1.7.20")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/zouyonghe/PixelTerm-C")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f  ;; no test suite
      #:make-flags
      #~(list (string-append "CC=" #$(cc-for-target))
              (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))  ;; Makefile-only project
    (inputs (list chafa gdk-pixbuf ffmpeg))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/zouyonghe/PixelTerm-C")
    (synopsis "Terminal image and video viewer using character graphics")
    (description
     "PixelTerm-C renders images and videos directly in the terminal using
Unicode characters and true-color ANSI sequences via the Chafa library.
It supports a wide range of image formats through GDK-Pixbuf and video
formats through FFmpeg.")
    (license license:lgpl3)))
