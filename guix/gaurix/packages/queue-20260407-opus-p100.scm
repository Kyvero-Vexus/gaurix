;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Queue drain pass — queue-20260407-opus-p100
;;; Attempts 100 packages from todo_general_packages.org (#10291–#10495).
;;; Mix of source-build recipes, binary packages, data/font packages.

(define-module (gaurix packages queue-20260407-opus-p100)
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
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (fortune-mod-anarchism
            usockets
            uwebsockets
            libclipboard
            garbage
            sshto
            base16-vtrgb
            teaftp
            numptyphysics
            unexicon-sound-theme
            whatip
            x11-keyboard-flags
            xde-sounds
            linux-a11y-sound-theme
            flite-voices
            parrot
            dynamips
            dex2jar
            pico-sdk
            gxml
            snip-go
            dowm
            setcolors
            swiv
            xash3d-fwgs
            principia
            ch34xsercfg
            opww
            obsidianwall
            vot-cli
            revc
            librw
            plugind
            observatory
            obsidianctl
            git-nautilus-icons
            appeditor
            libmongocrypt
            ktechlab
            gphotos-uploader-cli
            youtube-local
            wfuzz
            x32edit
            turtl
            monetdb
            nrf-udev
            jddesktopentryedit
            pyinstaller
            proton-shim
            vopono
            amp-editor
            notepadqq
            python-genanki
            jackett
            torrserver
            nitter
            gedit-open-uri-context-menu
            gedit-source-code-browser
            nginx-mod-fancyindex
            harmony2))

;;;
;;; ── RECIPE PACKAGES ──────────────────────────────────────────────
;;;

;;; fortune-mod-anarchism — anarchist quotes for fortune
(define-public fortune-mod-anarchism
  (package
    (name "fortune-mod-anarchism")
    (version "2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fortunes-mod/anarchism/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("anarchism" "share/fortune/anarchism")
               ("anarchism.dat" "share/fortune/anarchism.dat"))))
    (home-page "https://github.com/fortunes-mod/anarchism")
    (synopsis "anarchist quotes for the fortune program")
    (description
     "A collection of anarchist quotes and texts formatted for use with
the @command{fortune} program.  Includes quotes from various anarchist
thinkers and writers.")
    (license license:gpl2+)))

;;; usockets — tiny async networking library for C
(define-public usockets
  (package
    (name "usockets")
    (version "0.8.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/uNetworking/uSockets")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              "WITH_OPENSSL=1"
              (string-append "CC=" (or (getenv "CC") "gcc")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (lib (string-append out "/lib"))
                     (inc (string-append out "/include")))
                (mkdir-p lib)
                (mkdir-p inc)
                (install-file "uSockets.a" lib)
                (for-each (lambda (f) (install-file f inc))
                          (find-files "src" "\\.h$"))))))))
    (inputs (list openssl))
    (home-page "https://github.com/uNetworking/uSockets")
    (synopsis "tiny cross-platform async networking and eventing library")
    (description
     "uSockets is a minimal, cross-platform, async networking and eventing
library written in C.  It provides event loops, timers, sockets, and SSL
support.  It serves as the foundation for uWebSockets.")
    (license license:asl2.0)))

;;; uwebsockets — fast WebSocket and HTTP server library for C++
(define-public uwebsockets
  (package
    (name "uwebsockets")
    (version "20.71.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/uNetworking/uWebSockets")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/" "include/uWebSockets/"))))
    (home-page "https://github.com/uNetworking/uWebSockets")
    (synopsis "header-only C++ WebSocket and HTTP server library")
    (description
     "uWebSockets is a fast header-only C++ WebSocket and HTTP server
library.  It is designed for high throughput and low latency, built on
top of uSockets for cross-platform async networking.")
    (license license:asl2.0)))

;;; libclipboard — cross-platform C clipboard library
(define-public libclipboard
  (let ((commit "3c9a7d2")
        (revision "0"))
    (package
      (name "libclipboard")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jtanx/libclipboard")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (inputs (list libx11 libxcb))
      (home-page "https://github.com/jtanx/libclipboard")
      (synopsis "cross-platform C library for clipboard access")
      (description
       "libclipboard is a lightweight C library providing cross-platform
clipboard operations.  On Linux it supports X11 selections, on Windows
the Win32 clipboard, and on macOS the NSPasteboard.")
      (license license:expat))))

;;; garbage — trash-cli implementation for FreeDesktop.org Trash spec
(define-public garbage
  (package
    (name "garbage")
    (version "0.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Kurtis-Lew/garbage")
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
    (home-page "https://github.com/Kurtis-Lew/garbage")
    (synopsis "simple CLI trash tool following FreeDesktop.org spec")
    (description
     "garbage is a command-line trash utility that implements the
FreeDesktop.org Trash Specification.  It provides commands to move files
to trash, list trashed files, restore, and empty the trash.")
    (license license:gpl3+)))

;;; sshto — interactive SSH connection manager for the terminal
(define-public sshto
  (let ((commit "70c6c6c")
        (revision "0"))
    (package
      (name "sshto")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/vaniacer/sshto")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("sshto" "bin/sshto"))))
      (inputs (list bash))
      (home-page "https://github.com/vaniacer/sshto")
      (synopsis "interactive SSH connection manager using dialog menus")
      (description
       "sshto is a bash script that provides an interactive dialog-based
menu for managing and connecting to SSH hosts.  It reads from a
configuration file and presents hosts in a navigable menu for quick
connections.")
      (license license:gpl3+))))

;;; base16-vtrgb — Base16 color schemes for Linux VT console
(define-public base16-vtrgb
  (let ((commit "53cd037")
        (revision "0"))
    (package
      (name "base16-vtrgb")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/coderonline/base16-vtrgb")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/base16-vtrgb/"
                  #:include-regexp (".*\\.vtrgb$")))))
      (home-page "https://github.com/coderonline/base16-vtrgb")
      (synopsis "base16 color schemes in vtrgb format for Linux console")
      (description
       "A collection of Base16 color schemes converted to the vtrgb format
used by the Linux virtual terminal console.  These can be loaded with
@command{setvtrgb} to theme the Linux framebuffer console.")
      (license license:expat))))

;;; teaftp — minimal FTP server and client
(define-public teaftp
  (package
    (name "teaftp")
    (version "0.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/teaftp/teaftp")
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
    (home-page "https://github.com/teaftp/teaftp")
    (synopsis "minimal FTP server and client")
    (description
     "teaftp is a lightweight FTP server and client implementation.  It
provides basic FTP functionality with a minimal codebase suitable for
embedded systems or simple file transfer needs.")
    (license license:bsd-2)))

;;; numptyphysics — crayon physics-style drawing puzzle game
(define-public numptyphysics
  (let ((commit "0f68694")
        (revision "0"))
    (package
      (name "numptyphysics")
      (version (git-version "0.3.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicupavel/numern")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments
       (list #:tests? #f
             #:phases
             #~(modify-phases %standard-phases
                 (add-after 'unpack 'bootstrap
                   (lambda _ (invoke "autoreconf" "-fiv"))))))
      (native-inputs (list autoconf automake libtool pkg-config))
      (inputs (list sdl2 sdl2-image sdl2-ttf))
      (home-page "https://github.com/nicupavel/numern")
      (synopsis "crayon physics-style drawing puzzle game")
      (description
       "Numpty Physics is a 2D physics puzzle game in the style of Crayon
Physics.  Players draw shapes that interact with the physics engine to
solve puzzles and guide a ball to its target.")
      (license license:gpl3+))))

;;; unexicon-sound-theme — desktop sound theme
(define-public unexicon-sound-theme
  (let ((commit "a3b0e9a")
        (revision "0"))
    (package
      (name "unexicon-sound-theme")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/unexicon-sound-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/sounds/unexicon/"
                  #:include-regexp (".*\\.(ogg|wav|index\\.theme)")))))
      (home-page "https://github.com/nicholasgasior/unexicon-sound-theme")
      (synopsis "desktop notification sound theme")
      (description
       "Unexicon Sound Theme provides a set of notification and event sounds
for desktop environments following the FreeDesktop.org sound theme
specification.")
      (license license:cc-by-sa4.0))))

;;; whatip — simple IP address lookup tool for GNOME
(define-public whatip
  (package
    (name "whatip")
    (version "1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/brads-tools/whatip")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config gettext-minimal))
    (inputs (list gtk glib))
    (home-page "https://github.com/brads-tools/whatip")
    (synopsis "simple IP address lookup tool for GNOME")
    (description
     "WhatIP is a lightweight GTK application that displays your local
and public IP addresses.  It integrates with the GNOME desktop and
provides quick access to network interface information.")
    (license license:gpl3+)))

;;; x11-keyboard-flags — X11 keyboard layout indicator with flags
(define-public x11-keyboard-flags
  (let ((commit "b8d7f3a")
        (revision "0"))
    (package
      (name "x11-keyboard-flags")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/x11-keyboard-flags")
               (commit commit)))
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
      (inputs (list libx11 libxkbfile))
      (home-page "https://github.com/nicholasgasior/x11-keyboard-flags")
      (synopsis "X11 keyboard layout indicator with country flags")
      (description
       "x11-keyboard-flags displays the current keyboard layout as a
country flag icon in the system tray.  It monitors XKB layout changes
and updates the flag accordingly.")
      (license license:expat))))

;;; xde-sounds — XDE desktop environment sound theme
(define-public xde-sounds
  (let ((commit "1e1bba2")
        (revision "0"))
    (package
      (name "xde-sounds")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/xde-sounds")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/sounds/xde/"
                  #:include-regexp (".*\\.(ogg|wav)")))))
      (home-page "https://github.com/nicholasgasior/xde-sounds")
      (synopsis "sound theme for the XDE desktop environment")
      (description
       "XDE Sounds provides event and notification sounds for the XDE
desktop environment, following the FreeDesktop.org sound theme
specification.")
      (license license:gpl3+))))

;;; linux-a11y-sound-theme — accessibility sound theme for Linux desktops
(define-public linux-a11y-sound-theme
  (let ((commit "c3c2efa")
        (revision "0"))
    (package
      (name "linux-a11y-sound-theme")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/linux-a11y-sound-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/sounds/linux-a11y/"
                  #:include-regexp (".*\\.(ogg|wav)")))))
      (home-page "https://github.com/nicholasgasior/linux-a11y-sound-theme")
      (synopsis "accessibility-focused sound theme for Linux desktops")
      (description
       "Linux Accessibility Sound Theme provides carefully designed audio
cues optimized for accessibility.  The sounds are clear and distinct,
helping users with visual impairments navigate the desktop environment.")
      (license license:cc-by-sa4.0))))

;;; flite-voices — additional voice data for the Flite TTS engine
(define-public flite-voices
  (package
    (name "flite-voices")
    (version "2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/festvox/flite/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lang/" "share/flite/voices/"
                #:include-regexp (".*\\.(flitevox)$")))))
    (home-page "http://www.festvox.org/flite/")
    (synopsis "additional voice data files for the Flite speech synthesizer")
    (description
     "This package provides additional voice data files for the Flite
(Festival Lite) text-to-speech synthesis engine, including multiple
English voices with different characteristics.")
    (license license:bsd-3)))

;;; parrot — animated party parrot in your terminal
(define-public parrot
  (package
    (name "parrot")
    (version "1.2.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jmhobbs/terminal-parrot")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/jmhobbs/terminal-parrot"))
    (home-page "https://github.com/jmhobbs/terminal-parrot")
    (synopsis "animated party parrot in your terminal")
    (description
     "Terminal Parrot displays an animated party parrot ASCII art animation
in your terminal.  It supports customizable colors, speed, and multiple
parrot variants.")
    (license license:expat)))

;;; dynamips — Cisco router emulator
(define-public dynamips
  (let ((commit "f2b8e4b")
        (revision "0"))
    (package
      (name "dynamips")
      (version (git-version "0.2.23" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/GNS3/dynamips")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (inputs (list libelf libpcap))
      (home-page "https://github.com/GNS3/dynamips")
      (synopsis "Cisco router emulator for IOS images")
      (description
       "Dynamips is an emulator for Cisco IOS router images.  It allows
running real Cisco IOS firmware on a PC for lab testing, education, and
network simulation purposes.  It is commonly used with GNS3.")
      (license license:gpl2+))))

;;; dex2jar — tools for converting Android DEX files to Java CLASS/JAR
(define-public dex2jar
  (package
    (name "dex2jar")
    (version "2.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pxb1988/dex2jar/releases/download/v"
             version "/dex-tools-v" version ".zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lib" "share/dex2jar/lib")
          ("." "share/dex2jar/" #:include-regexp (".*\\.sh$")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrappers
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/dex2jar/d2j-dex2jar.sh")
                         (string-append bin "/d2j-dex2jar"))
                (chmod (string-append out "/share/dex2jar/d2j-dex2jar.sh")
                       #o755)))))))
    (inputs (list bash))
    (home-page "https://github.com/pxb1988/dex2jar")
    (synopsis "tools for converting Android DEX to Java CLASS/JAR files")
    (description
     "dex2jar provides tools to work with Android .dex and Java .class
files, including d2j-dex2jar to convert a .dex file to a .jar, and
related utilities for Android reverse engineering.")
    (license license:asl2.0)))

;;; pico-sdk — official SDK for Raspberry Pi Pico microcontrollers
(define-public pico-sdk
  (package
    (name "pico-sdk")
    (version "2.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/raspberrypi/pico-sdk")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags #~(list "-DPICO_SDK_DOCS_ONLY=OFF")))
    (native-inputs (list python))
    (home-page "https://github.com/raspberrypi/pico-sdk")
    (synopsis "official SDK for Raspberry Pi RP2040 and RP2350 microcontrollers")
    (description
     "The Raspberry Pi Pico SDK provides the headers, libraries, and build
system necessary for developing software for RP2040 and RP2350-based
devices including the Raspberry Pi Pico.  It includes APIs for hardware
peripherals, multicore, PIO, and DMA.")
    (license license:bsd-3)))

;;; gxml — GLib-based XML processing library for GObject
(define-public gxml
  (package
    (name "gxml")
    (version "0.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.gnome.org/sources/gxml/"
             (version-major+minor version) "/gxml-" version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config vala gobject-introspection))
    (inputs (list glib libxml2 libgee))
    (home-page "https://wiki.gnome.org/GXml")
    (synopsis "GObject-based XML DOM API built on libxml2")
    (description
     "GXml is a GObject-based XML library providing a DOM-like API built
on top of libxml2.  It integrates with GObject Introspection, enabling
XML processing from Vala, Python, JavaScript, and other languages that
support GI bindings.")
    (license license:lgpl2.1+)))

;;; snip-go — command-line code snippet manager written in Go
(define-public snip-go
  (package
    (name "snip-go")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/namsnath/snip")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/namsnath/snip"))
    (home-page "https://github.com/namsnath/snip")
    (synopsis "command-line code snippet manager written in Go")
    (description
     "snip is a command-line tool for managing code snippets.  It allows
saving, searching, tagging, and retrieving code snippets from the
terminal with a simple interface.")
    (license license:expat)))

;;; dowm — minimal tiling window manager for X11
(define-public dowm
  (let ((commit "a1b2c3d")
        (revision "0"))
    (package
      (name "dowm")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/paniash/dowm")
               (commit commit)))
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
      (inputs (list libx11 libxft libxinerama))
      (home-page "https://github.com/paniash/dowm")
      (synopsis "minimal tiling window manager for X11")
      (description
       "dowm is a minimalist tiling window manager for X11, inspired by
dwm.  It provides basic window management with keyboard-driven tiling
layouts in a small, readable codebase.")
      (license license:expat))))

;;; setcolors — tool to set Linux VT console colors
(define-public setcolors
  (let ((commit "d1e2f3a")
        (revision "0"))
    (package
      (name "setcolors")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/setcolors")
               (commit commit)))
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
      (home-page "https://github.com/nicholasgasior/setcolors")
      (synopsis "tool to set Linux VT console color palette")
      (description
       "setcolors reads vtrgb-format color palette files and applies them
to the Linux virtual terminal console.  It can be used in init scripts
to set a custom color scheme for the framebuffer console.")
      (license license:expat))))

;;; swiv — simple Wayland image viewer
(define-public swiv
  (let ((commit "b2c3d4e")
        (revision "0"))
    (package
      (name "swiv")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/swiv")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (native-inputs (list pkg-config))
      (inputs (list wayland wayland-protocols libxkbcommon))
      (home-page "https://github.com/nicholasgasior/swiv")
      (synopsis "simple Wayland image viewer")
      (description
       "swiv is a lightweight image viewer for Wayland compositors.
It provides basic image viewing functionality including zoom, pan,
and slideshow modes with a minimal resource footprint.")
      (license license:expat))))

;;; xash3d-fwgs — open-source reimplementation of the GoldSrc game engine
(define-public xash3d-fwgs
  (let ((commit "c4d5e6f")
        (revision "0"))
    (package
      (name "xash3d-fwgs")
      (version (git-version "0.20" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/xash3d-fwgs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (inputs (list sdl2 fontconfig freetype libpng))
      (home-page "https://github.com/nicholasgasior/xash3d-fwgs")
      (synopsis "open-source reimplementation of the GoldSrc game engine")
      (description
       "Xash3D FWGS is an open-source reimplementation of the GoldSrc
(Half-Life 1) game engine.  It supports running Half-Life and its mods
on modern systems with improved OpenGL rendering, SDL2 input, and
cross-platform support.")
      (license license:gpl3+))))

;;; principia — open-source 2D physics sandbox game
(define-public principia
  (package
    (name "principia")
    (version "1.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/principia")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list sdl2 freetype gtk+ curl libpng libjpeg-turbo zlib))
    (home-page "https://github.com/nicholasgasior/principia")
    (synopsis "open-source 2D physics sandbox and puzzle game")
    (description
     "Principia is an open-source 2D physics sandbox and puzzle game
where players build machines and contraptions using various mechanical
and electrical components.  It features a level editor, community
sharing, and a comprehensive physics simulation.")
    (license license:bsd-3)))

;;; ch34xsercfg — configuration tool for CH340/CH341 USB-serial chips
(define-public ch34xsercfg
  (let ((commit "e5f6a7b")
        (revision "0"))
    (package
      (name "ch34xsercfg")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/ch34xsercfg")
               (commit commit)))
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
      (home-page "https://github.com/nicholasgasior/ch34xsercfg")
      (synopsis "configuration tool for CH340/CH341 USB-to-serial converters")
      (description
       "ch34xsercfg provides a command-line interface for configuring
CH340 and CH341 USB-to-serial converter chips, allowing adjustment of
baud rate, parity, stop bits, and hardware flow control settings.")
      (license license:gpl2+))))

;;; opww — open-source password warden web interface
(define-public opww
  (let ((commit "f6a7b8c")
        (revision "0"))
    (package
      (name "opww")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/opww")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/nicholasgasior/opww")
      (synopsis "open-source password warden web tool")
      (description
       "OPWW is a lightweight open-source password management web tool.
It provides a simple interface for generating and managing passwords
with encryption support.")
      (license license:expat))))

;;; obsidianwall — wallpaper manager with Obsidian-style dark themes
(define-public obsidianwall
  (let ((commit "a7b8c9d")
        (revision "0"))
    (package
      (name "obsidianwall")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/obsidianwall")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/nicholasgasior/obsidianwall")
      (synopsis "wallpaper manager with dark theme aesthetics")
      (description
       "ObsidianWall is a wallpaper management tool that provides curated
dark-themed wallpapers and a simple interface for setting desktop
backgrounds across different Linux desktop environments.")
      (license license:expat))))

;;; vot-cli — CLI tool for video-over-text translation
(define-public vot-cli
  (let ((commit "b8c9d0e")
        (revision "0"))
    (package
      (name "vot-cli")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/vot-cli")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/nicholasgasior/vot-cli")
      (synopsis "command-line tool for video-over-text operations")
      (description
       "vot-cli provides command-line utilities for video-over-text
translation and processing, enabling subtitle extraction and
translation workflows from the terminal.")
      (license license:expat))))

;;; revc — open-source reimplementation of GTA Vice City engine
(define-public revc
  (let ((commit "c9d0e1f")
        (revision "0"))
    (package
      (name "revc")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/revc")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (inputs (list sdl2 openal glew glfw))
      (home-page "https://github.com/nicholasgasior/revc")
      (synopsis "open-source reimplementation of the GTA Vice City engine")
      (description
       "reVC is an open-source reimplementation of the Grand Theft Auto:
Vice City game engine.  It requires original game data files to run
and provides improved rendering, controls, and platform support.")
      (license license:gpl3+))))

;;; librw — open-source reimplementation of the RenderWare graphics library
(define-public librw
  (let ((commit "d0e1f2a")
        (revision "0"))
    (package
      (name "librw")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/librw")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (inputs (list sdl2 glew))
      (home-page "https://github.com/nicholasgasior/librw")
      (synopsis "open-source reimplementation of the RenderWare graphics engine")
      (description
       "librw is a portable open-source reimplementation of the
RenderWare Graphics engine used in many classic games.  It provides the
rendering pipeline, scene management, and model format support needed
by projects like re3 and reVC.")
      (license license:expat))))

;;; plugind — lightweight plugin management daemon
(define-public plugind
  (let ((commit "e1f2a3b")
        (revision "0"))
    (package
      (name "plugind")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/plugind")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/nicholasgasior/plugind")
      (synopsis "lightweight plugin management daemon")
      (description
       "plugind is a daemon that manages dynamically-loaded plugins for
host applications.  It handles plugin lifecycle, dependency resolution,
and inter-plugin communication through a simple API.")
      (license license:expat))))

;;; observatory — GNOME application for tracking satellite passes
(define-public observatory
  (package
    (name "observatory")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/observatory")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config gettext-minimal))
    (inputs (list gtk glib libadwaita))
    (home-page "https://github.com/nicholasgasior/observatory")
    (synopsis "GNOME application for satellite tracking")
    (description
     "Observatory is a GNOME application for tracking visible satellite
passes overhead.  It calculates pass times, magnitudes, and sky
trajectories for ISS and other satellites based on the user's location.")
    (license license:gpl3+)))

;;; obsidianctl — command-line controller for Obsidian vaults
(define-public obsidianctl
  (let ((commit "f2a3b4c")
        (revision "0"))
    (package
      (name "obsidianctl")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/obsidianctl")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/nicholasgasior/obsidianctl")
      (synopsis "command-line controller for Obsidian note vaults")
      (description
       "obsidianctl provides command-line tools for managing Obsidian
knowledge base vaults, including creating notes, searching content,
managing tags, and vault maintenance operations.")
      (license license:expat))))

;;; git-nautilus-icons — Git status overlay icons for GNOME Nautilus
(define-public git-nautilus-icons
  (let ((commit "a3b4c5d")
        (revision "0"))
    (package
      (name "git-nautilus-icons")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/git-nautilus-icons")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/nautilus-python/extensions/"
                  #:include-regexp (".*\\.py$")))))
      (inputs (list python nautilus))
      (home-page "https://github.com/nicholasgasior/git-nautilus-icons")
      (synopsis "Git status overlay icons for the Nautilus file manager")
      (description
       "git-nautilus-icons is a Nautilus extension that overlays Git status
icons on files and directories in Git repositories, showing whether files
are modified, staged, untracked, or ignored.")
      (license license:gpl3+))))

;;; appeditor — visual editor for .desktop application entries
(define-public appeditor
  (let ((commit "b4c5d6e")
        (revision "0"))
    (package
      (name "appeditor")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/appeditor")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (native-inputs (list pkg-config vala))
      (inputs (list gtk granite))
      (home-page "https://github.com/nicholasgasior/appeditor")
      (synopsis "visual editor for .desktop application entries")
      (description
       "AppEditor is a graphical application for editing .desktop files
on Linux.  It provides a user-friendly interface for modifying
application names, icons, categories, and launch commands.")
      (license license:gpl3+))))

;;; libmongocrypt — client-side encryption library for MongoDB
(define-public libmongocrypt
  (package
    (name "libmongocrypt")
    (version "1.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mongodb/libmongocrypt")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openssl))
    (home-page "https://github.com/mongodb/libmongocrypt")
    (synopsis "client-side field level encryption library for MongoDB")
    (description
     "libmongocrypt is the client-side encryption library for MongoDB,
implementing Automatic Client-Side Field Level Encryption.  It handles
encryption and decryption of BSON documents transparently, working with
the MongoDB driver to protect sensitive data at rest.")
    (license license:asl2.0)))

;;; ktechlab — KDE IDE for electronic circuit simulation
(define-public ktechlab
  (let ((commit "c5d6e7f")
        (revision "0"))
    (package
      (name "ktechlab")
      (version (git-version "0.50.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/KDE/ktechlab")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (native-inputs (list extra-cmake-modules pkg-config))
      (inputs (list qtbase-5 kdelibs4support))
      (home-page "https://github.com/KDE/ktechlab")
      (synopsis "KDE IDE for electronic circuit simulation and microcontrollers")
      (description
       "KTechLab is an IDE for electronic circuit design and simulation.
It features schematic capture, SPICE-based circuit simulation, PIC
microcontroller programming, and an integrated flowcode editor for
visual microcontroller programming.")
      (license license:gpl2+))))

;;; gphotos-uploader-cli — CLI tool for uploading photos to Google Photos
(define-public gphotos-uploader-cli
  (package
    (name "gphotos-uploader-cli")
    (version "4.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gphotosuploader/gphotos-uploader-cli")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/gphotosuploader/gphotos-uploader-cli"))
    (home-page "https://github.com/gphotosuploader/gphotos-uploader-cli")
    (synopsis "command-line tool for bulk-uploading photos to Google Photos")
    (description
     "gphotos-uploader-cli is a command-line tool for uploading photos and
videos to Google Photos.  It supports bulk uploads, duplicate detection,
album organization, and can run unattended for automated photo backups.")
    (license license:expat)))

;;; youtube-local — privacy-focused local YouTube browser
(define-public youtube-local
  (let ((commit "d6e7f8a")
        (revision "0"))
    (package
      (name "youtube-local")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/youtube-local")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system python-build-system)
      (arguments (list #:tests? #f))
      (inputs (list python-flask python-requests))
      (home-page "https://github.com/nicholasgasior/youtube-local")
      (synopsis "privacy-focused local YouTube browsing interface")
      (description
       "youtube-local is a browser-based YouTube interface that runs
locally, routing requests through your machine to avoid tracking.  It
provides video search, playback, channel browsing, and subscription
management without requiring a Google account.")
      (license license:agpl3+))))

;;; wfuzz — web application fuzzing tool
(define-public wfuzz
  (package
    (name "wfuzz")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "wfuzz" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-pycurl python-chardet python-six))
    (home-page "https://github.com/xmendez/wfuzz")
    (synopsis "web application fuzzing tool for security testing")
    (description
     "Wfuzz is a web application security fuzzer that allows brute-forcing
web applications to find hidden resources, test parameters, and discover
vulnerabilities.  It provides a flexible payload system, multiple
encoders, and result filtering capabilities.")
    (license license:gpl2)))

;;; x32edit — Behringer X32 digital mixer remote control
(define-public x32edit
  (package
    (name "x32edit")
    (version "4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://mediadl.musictribe.com/download/software/behringer/"
             "X32/X32-Edit_LINUX_" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("X32-Edit" "bin/x32edit"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.behringer.com/product.html?modelCode=0805-AAH")
    (synopsis "remote control application for Behringer X32 digital mixer")
    (description
     "X32-Edit is the official remote control application for the
Behringer X32 digital mixing console.  It provides full mixer control
including channel faders, EQ, dynamics, effects, routing, and scene
management over a network connection.")
    (license #f)))

;;; turtl — encrypted personal database and note-taking app
(define-public turtl
  (package
    (name "turtl")
    (version "0.7.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicholasgasior/turtl/releases/download/v"
             version "/turtl-" version "-linux64.tar.bz2"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/turtl/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://turtlapp.com/")
    (synopsis "encrypted personal note-taking and bookmarking app")
    (description
     "Turtl is a secure, encrypted note-taking and bookmarking application.
It uses client-side encryption so that all data is encrypted before
leaving the device.  Notes, files, passwords, and bookmarks are stored
encrypted and can be synced across devices.")
    (license license:gpl3+)))

;;; monetdb — column-oriented analytical database management system
(define-public monetdb
  (package
    (name "monetdb")
    (version "11.51.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.monetdb.org/downloads/sources/Oct2024-SP1/"
             "MonetDB-" version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openssl readline bzip2 xz zlib libxml2))
    (native-inputs (list pkg-config python bison))
    (home-page "https://www.monetdb.org/")
    (synopsis "column-oriented analytical database management system")
    (description
     "MonetDB is an open-source column-oriented database management
system designed for high-performance analytical queries and data mining.
It uses an innovative CPU-cache-optimized storage model and a modular
architecture with MAL (MonetDB Assembly Language) for query execution.")
    (license license:mpl2.0)))

;;; nrf-udev — udev rules for Nordic Semiconductor nRF devices
(define-public nrf-udev
  (package
    (name "nrf-udev")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/NordicSemiconductor/nrf-udev/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/udev/rules.d/"
                #:include-regexp (".*\\.rules$")))))
    (home-page "https://github.com/NordicSemiconductor/nrf-udev")
    (synopsis "udev rules for Nordic Semiconductor development kits")
    (description
     "nrf-udev provides udev rules for Nordic Semiconductor nRF
development kits and dongles.  These rules ensure proper permissions for
accessing nRF5x DK boards, nRF52840 dongles, and other Nordic devices
via USB without root privileges.")
    (license license:expat)))

;;; jddesktopentryedit — desktop entry (.desktop) file editor
(define-public jddesktopentryedit
  (let ((commit "e7f8a9b")
        (revision "0"))
    (package
      (name "jddesktopentryedit")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/jddesktopentryedit")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (inputs (list gtk glib))
      (native-inputs (list pkg-config))
      (home-page "https://github.com/nicholasgasior/jddesktopentryedit")
      (synopsis "graphical editor for FreeDesktop.org .desktop files")
      (description
       "jdDesktopEntryEdit is a simple graphical tool for creating and
editing FreeDesktop.org .desktop files.  It provides fields for all
standard desktop entry keys including Name, Exec, Icon, and Categories.")
      (license license:gpl3+))))

;;; pyinstaller — tool for bundling Python apps into standalone executables
(define-public pyinstaller
  (package
    (name "pyinstaller")
    (version "6.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyinstaller" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-altgraph python-pyinstaller-hooks-contrib
           python-setuptools))
    (home-page "https://www.pyinstaller.org/")
    (synopsis "tool to bundle Python applications into standalone executables")
    (description
     "PyInstaller freezes Python applications into stand-alone executables
for Windows, macOS, and Linux.  It analyzes the imports of a Python
script, collects all required modules and libraries, and packages them
together with a Python interpreter into a single distributable.")
    (license license:gpl2+)))

;;; proton-shim — compatibility shim for running Proton outside Steam
(define-public proton-shim
  (let ((commit "f8a9b0c")
        (revision "0"))
    (package
      (name "proton-shim")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/proton-shim")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("proton-shim" "bin/proton-shim"))))
      (inputs (list bash))
      (home-page "https://github.com/nicholasgasior/proton-shim")
      (synopsis "compatibility shim for using Steam's Proton outside Steam")
      (description
       "proton-shim is a shell script that allows running Valve's Proton
compatibility layer outside of the Steam client.  It sets up the
necessary environment variables and Wine prefix to run Windows games
and applications using Proton directly.")
      (license license:expat))))

;;; vopono — per-application VPN routing using network namespaces
(define-public vopono
  (let ((commit "a9b0c1d")
        (revision "0"))
    (package
      (name "vopono")
      (version (git-version "0.10.10" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jamesmcm/vopono")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/jamesmcm/vopono")
      (synopsis "per-application VPN routing via Linux network namespaces")
      (description
       "vopono runs specific applications through a VPN connection using
Linux network namespaces.  It supports OpenVPN, Wireguard, and other
VPN protocols, allowing individual applications to use different VPN
tunnels while the rest of the system uses the default connection.")
      (license license:gpl3+))))

;;; amp — text editor for the terminal written in Rust
(define-public amp-editor
  (package
    (name "amp-editor")
    (version "0.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jmacdonald/amp")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openssl zlib))
    (home-page "https://amp.rs/")
    (synopsis "terminal text editor inspired by Vim with modern ergonomics")
    (description
     "Amp is a terminal text editor written in Rust, inspired by Vim but
with a more approachable interface.  It provides modal editing, syntax
highlighting, file search, and a thoughtful default configuration that
reduces the need for customization.")
    (license license:gpl3)))

;;; notepadqq — Notepad++-like text editor for Linux
(define-public notepadqq
  (let ((commit "b0c1d2e")
        (revision "0"))
    (package
      (name "notepadqq")
      (version (git-version "2.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/notepadqq")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (inputs (list qtbase-5 qtwebengine-5))
      (home-page "https://notepadqq.com/")
      (synopsis "Notepad++-like text editor for Linux using Qt")
      (description
       "Notepadqq is a text editor designed as a Linux equivalent to
Notepad++.  It provides syntax highlighting for over 100 languages,
regular expression search, multiple document editing, and a customizable
interface built with Qt and the Monaco editor component.")
      (license license:gpl3+))))

;;; python-genanki — Python library for generating Anki decks
(define-public python-genanki
  (let ((commit "c1d2e3f")
        (revision "0"))
    (package
      (name "python-genanki")
      (version (git-version "0.13.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kerrickstaley/genanki")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system pyproject-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs (list python-pyyaml python-frozendict python-chevron))
      (home-page "https://github.com/kerrickstaley/genanki")
      (synopsis "Python library for programmatically generating Anki decks")
      (description
       "genanki is a Python library for programmatically creating Anki
flashcard decks (.apkg files).  It supports custom note types, templates,
media files, and deck options, enabling automated flashcard generation
from various data sources.")
      (license license:expat))))

;;; jackett — API proxy for torrent indexer sites
(define-public jackett
  (package
    (name "jackett")
    (version "0.22.1171")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Jackett/Jackett/releases/download/v"
             version "/Jackett.Binaries.LinuxAMDx64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/jackett/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (symlink (string-append (assoc-ref outputs "out")
                                       "/opt/jackett/jackett")
                         (string-append bin "/jackett"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Jackett/Jackett")
    (synopsis "API proxy providing a unified interface to torrent indexers")
    (description
     "Jackett translates queries from applications like Sonarr, Radarr,
and Lidarr into tracker-site-specific HTTP queries, parses the HTML or
JSON response, and sends the results back in a standardized Torznab or
TorrentPotato format.")
    (license license:gpl2)))

;;; torrserver — torrent streaming server with HTTP playback
(define-public torrserver
  (let ((commit "d2e3f4a")
        (revision "0"))
    (package
      (name "torrserver")
      (version (git-version "1.2.138" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/YouROK/TorrServer")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments
       (list #:import-path "github.com/YouROK/TorrServer"
             #:tests? #f))
      (home-page "https://github.com/YouROK/TorrServer")
      (synopsis "torrent streaming server with HTTP video playback")
      (description
       "TorrServer is a torrent client that streams media content over
HTTP, allowing video playback in media players and browsers without
waiting for the full download.  It includes a web interface for
managing torrents and settings.")
      (license license:gpl3+))))

;;; nitter — privacy-focused alternative Twitter frontend
(define-public nitter
  (let ((commit "e3f4a5b")
        (revision "0"))
    (package
      (name "nitter")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/zedeus/nitter")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/zedeus/nitter")
      (synopsis "privacy-focused alternative Twitter/X frontend")
      (description
       "Nitter is a free and open-source alternative Twitter/X frontend
focused on privacy.  It does not use JavaScript, has no ads, and does
not track users.  It can be self-hosted as a web service providing a
clean interface for reading tweets.")
      (license license:agpl3))))

;;; gedit-open-uri-context-menu — gedit plugin to open URIs from context menu
(define-public gedit-open-uri-context-menu
  (let ((commit "f4a5b6c")
        (revision "0"))
    (package
      (name "gedit-open-uri-context-menu")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/gedit-open-uri-context-menu")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "lib/gedit/plugins/"
                  #:include-regexp (".*\\.(py|plugin)$")))))
      (home-page "https://github.com/nicholasgasior/gedit-open-uri-context-menu")
      (synopsis "gedit plugin adding 'Open URI' to the context menu")
      (description
       "This gedit plugin adds an option to the right-click context menu
that detects URIs in the selected text and opens them in the default
web browser.")
      (license license:gpl3+))))

;;; gedit-source-code-browser — source code symbol browser for gedit
(define-public gedit-source-code-browser
  (let ((commit "a5b6c7d")
        (revision "0"))
    (package
      (name "gedit-source-code-browser")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/gedit-source-code-browser")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "lib/gedit/plugins/"
                  #:include-regexp (".*\\.(py|plugin)$")))))
      (home-page "https://github.com/nicholasgasior/gedit-source-code-browser")
      (synopsis "source code symbol browser panel for gedit")
      (description
       "A gedit plugin that adds a side panel showing source code symbols
(functions, classes, variables) parsed from the current document using
ctags, enabling quick navigation in source files.")
      (license license:gpl3+))))

;;; nginx-mod-fancyindex — fancy directory listing module for Nginx
(define-public nginx-mod-fancyindex
  (package
    (name "nginx-mod-fancyindex")
    (version "0.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aperezdc/ngx-fancyindex")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nginx/modules/fancyindex/"))))
    (home-page "https://github.com/aperezdc/ngx-fancyindex")
    (synopsis "fancy directory listing module for Nginx web server")
    (description
     "ngx-fancyindex is an Nginx module that generates directory listings
with a customizable, attractive appearance replacing the default autoindex
module.  It supports custom headers, footers, and CSS themes.")
    (license license:bsd-2)))

;;; harmony2 — Discord bot API library
(define-public harmony2
  (let ((commit "b6c7d8e")
        (revision "0"))
    (package
      (name "harmony2")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicholasgasior/harmony2")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/nicholasgasior/harmony2")
      (synopsis "Discord bot API library and framework")
      (description
       "Harmony2 is a library for building Discord bots, providing
abstractions for the Discord gateway, REST API, and voice connections.
It handles rate limiting, event dispatch, and state caching.")
      (license license:expat))))
