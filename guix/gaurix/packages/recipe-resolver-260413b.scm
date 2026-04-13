;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413b
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from TODO queue:
;;;   - 24 recipes created
;;;   - 6 blocked with specific reason codes
;;;
;;; Recipes (24):
;;;   - arduino-ctags (C/autotools, GPL-2.0)
;;;   - nnn-nerd (C/Make, inherit nnn, BSD-2-Clause)
;;;   - trayer (C/Make + GTK2, GPL-2.0+)
;;;   - potato-c (C/Make suckless-style, GPL-3.0)
;;;   - fey (C/Make + Wayland, MIT)
;;;   - rp-plus-plus (C++/CMake, MIT)
;;;   - croaring (C/CMake library, Apache-2.0)
;;;   - libsmb2 (C/CMake library, LGPL-2.1)
;;;   - jome (C++/CMake + Qt6, MIT)
;;;   - qtilitools (CMake + Qt/LXQt, BSD-3-Clause)
;;;   - wasistlos (C++/CMake + GTKmm3, GPL-3.0)
;;;   - openclaw (C++/CMake + SDL2, GPL-3.0)
;;;   - netrc (Go, MIT)
;;;   - pigo (Go, MIT)
;;;   - mpris-scrobbler (C/Meson, MIT)
;;;   - notejot (Vala/Meson + GTK4, GPL-3.0)
;;;   - butler (Vala/Meson + GTK4, GPL-3.0)
;;;   - puddletag (Python/setuptools, GPL-3.0)
;;;   - tex-fmt (Rust/Cargo, MIT)
;;;   - bash-git-prompt (shell scripts/copy, BSD-2-Clause)
;;;   - font-atkinson-hyperlegible-next (font/copy, OFL-1.1)
;;;   - auto-throttle (bash script/copy, MIT)
;;;   - wingedit (proprietary binary/copy, nonfree)
;;;   - fortune-mod-futurama (data files/copy, public-domain)
;;;
;;; Blocked (6):
;;;   - vr-lighthouse-git (NEEDS_RECIPE_DESIGN — Rust vendoring, niche BT crate deps)
;;;   - gksu (NEEDS_RECIPE_DESIGN — abandoned 2009, needs libgksu)
;;;   - fagram-bin (NEEDS_RECIPE_DESIGN — Telegram Desktop fork, massive dep tree)
;;;   - dae (NEEDS_RECIPE_DESIGN — Go + eBPF kernel integration, complex build)
;;;   - uac-polkit-agent-git (NEEDS_RECIPE_DESIGN — heavy KDE6/Qt6 dep chain)
;;;   - lol (NEEDS_RECIPE_DESIGN — no upstream URL, trivial novelty)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413b)
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
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lxqt)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xdisorg)
  #:export (
            arduino-ctags
            nnn-nerd
            trayer
            potato-c
            fey
            rp-plus-plus
            croaring
            libsmb2
            jome
            qtilitools
            wasistlos
            openclaw
            netrc
            pigo
            mpris-scrobbler
            notejot
            butler
            puddletag
            tex-fmt
            bash-git-prompt
            font-atkinson-hyperlegible-next
            auto-throttle
            wingedit
            fortune-mod-futurama
            ))

;;; ── arduino-ctags ────────────────────────────────────────────────
;;; Arduino-specific fork of Exuberant Ctags
;;; AUR: arduino-ctags  →  Guix: arduino-ctags
;;; Upstream: https://github.com/arduino/ctags (C, GPL-2.0)
;;;
(define-public arduino-ctags
  (package
    (name "arduino-ctags")
    (version "5.8-arduino11")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/arduino/ctags")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "ctags" bin)))))))
    (home-page "https://github.com/arduino/ctags")
    (synopsis "Arduino-specific fork of Exuberant Ctags")
    (description
     "This is Arduino's fork of Exuberant Ctags with patches for parsing
Arduino sketch files and generating tags for Arduino-specific constructs.
It is used by the Arduino IDE for code navigation and autocompletion.")
    (license license:gpl2+)))

;;; ── nnn-nerd ─────────────────────────────────────────────────────
;;; nnn file manager with Nerd Fonts icons
;;; AUR: nnn-nerd  →  Guix: nnn-nerd (inherit nnn)
;;; Upstream: https://github.com/jarun/nnn (C, BSD-2-Clause)
;;;
(define-public nnn-nerd
  (package
    (inherit nnn)
    (name "nnn-nerd")
    (arguments
     (substitute-keyword-arguments (package-arguments nnn)
       ((#:make-flags flags)
        #~(append #$flags (list "O_NERD=1")))))
    (synopsis "terminal file browser with Nerd Fonts icons")
    (description
     "This is a variant of @code{nnn} compiled with @code{O_NERD=1} to
enable Nerd Fonts file-type icons in the terminal interface.  Requires
a Nerd Font installed and configured in your terminal emulator.")))

;;; ── trayer ───────────────────────────────────────────────────────
;;; Lightweight GTK2+ systray for EWMH compliant window managers
;;; AUR: trayer  →  Guix: trayer
;;; Upstream: https://github.com/sargon/trayer-srg (C, GPL-2.0+)
;;;
(define-public trayer
  (package
    (name "trayer")
    (version "1.1.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sargon/trayer-srg")
             (commit (string-append "trayer-" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list gtk+-2))
    (home-page "https://github.com/sargon/trayer-srg")
    (synopsis "lightweight GTK2+ systray for EWMH window managers")
    (description
     "Trayer is a lightweight GTK2-based system tray implementation for
window managers that support the EWMH/freedesktop.org specification,
such as i3, bspwm, or xmonad.  It is a fork of the original trayer
from the fbpanel project with additional features and fixes.")
    (license license:gpl2+)))

;;; ── potato-c ─────────────────────────────────────────────────────
;;; Suckless-style Pomodoro timer daemon with TUI client
;;; AUR: potato-c  →  Guix: potato-c
;;; Upstream: https://github.com/nimaaskarian/potato-c (C, GPL-3.0)
;;;
(define-public potato-c
  (package
    (name "potato-c")
    (version "0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nimaaskarian/potato-c")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://github.com/nimaaskarian/potato-c")
    (synopsis "suckless-style Pomodoro timer daemon with TUI client")
    (description
     "Potato-c is a minimal Pomodoro technique timer written in C following
the suckless philosophy.  It consists of a daemon (@code{potatod}) and a
TUI client (@code{potato}) for managing work and break intervals from the
terminal.")
    (license license:gpl3)))

;;; ── fey ──────────────────────────────────────────────────────────
;;; Wayland image viewer using Cairo and Exiv2
;;; AUR: fey  →  Guix: fey
;;; Upstream: https://github.com/SykikXO/fey (C, MIT)
;;;
(define-public fey
  (package
    (name "fey")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/SykikXO/fey")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list wayland cairo exiv2))
    (home-page "https://github.com/SykikXO/fey")
    (synopsis "lightweight Wayland image viewer")
    (description
     "Fey is a minimal image viewer for Wayland compositors.  It uses Cairo
for rendering and Exiv2 for reading image metadata, providing a fast and
lightweight way to browse images on Wayland.")
    (license license:expat)))

;;; ── rp-plus-plus ─────────────────────────────────────────────────
;;; ROP gadget finder for PE/ELF/Mach-O binaries
;;; AUR: rp++  →  Guix: rp-plus-plus (C++/CMake, MIT)
;;; Upstream: https://github.com/0vercl0k/rp
;;;
(define-public rp-plus-plus
  (package
    (name "rp-plus-plus")
    (version "2.1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/0vercl0k/rp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release")))
    (home-page "https://github.com/0vercl0k/rp")
    (synopsis "ROP gadget finder for PE, ELF, and Mach-O binaries")
    (description
     "rp++ is a fast Return-Oriented Programming (ROP) gadget finder for
PE, ELF, and Mach-O binary formats across x86, x64, ARM, and AArch64
architectures.  It is useful for exploit development, binary analysis,
and security research.")
    (license license:expat)))

;;; ── croaring ─────────────────────────────────────────────────────
;;; Roaring bitmap C/C++ library (high-performance compressed bitmaps)
;;; AUR: croaring  →  Guix: croaring
;;; Upstream: https://github.com/RoaringBitmap/CRoaring (C, Apache-2.0)
;;;
(define-public croaring
  (package
    (name "croaring")
    (version "4.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/RoaringBitmap/CRoaring")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON"
                   "-DROARING_BUILD_LTO=OFF")))
    (home-page "https://roaringbitmap.org")
    (synopsis "compressed bitmap library for high-performance set operations")
    (description
     "CRoaring is a C and C++ implementation of Roaring Bitmaps, a data
structure that provides compressed bitmaps capable of performing set
operations (union, intersection, difference) significantly faster than
alternatives like hash sets or traditional bitmaps.  Used in databases,
search engines, and analytics systems.")
    (license license:asl2.0)))

;;; ── libsmb2 ──────────────────────────────────────────────────────
;;; Userspace SMB2/3 client library
;;; AUR: libsmb2-git  →  Guix: libsmb2
;;; Upstream: https://github.com/sahlberg/libsmb2 (C, LGPL-2.1)
;;;
(define-public libsmb2
  (package
    (name "libsmb2")
    (version "6.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sahlberg/libsmb2")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON")))
    (native-inputs (list pkg-config))
    (inputs (list mit-krb5))
    (home-page "https://github.com/sahlberg/libsmb2")
    (synopsis "userspace SMB2/3 client library")
    (description
     "Libsmb2 is a portable userspace SMB2/3 client library with support
for SMB2 and SMB3 protocols.  It provides both synchronous and asynchronous
APIs for file operations on network shares, with optional Kerberos
authentication via MIT Kerberos.")
    (license license:lgpl2.1)))

;;; ── jome ─────────────────────────────────────────────────────────
;;; Graphical emoji picker using Qt6
;;; AUR: jome  →  Guix: jome
;;; Upstream: https://github.com/eepp/jome (C++/CMake/Qt6, MIT)
;;;
(define-public jome
  (package
    (name "jome")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/eepp/jome/releases/download/v"
                           version "/jome-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase nlohmann-json fmt))
    (home-page "https://github.com/eepp/jome")
    (synopsis "graphical emoji picker for X11 and Wayland")
    (description
     "jome (joh-mee) is a graphical emoji picker application built with
Qt 6.  It displays the full set of Unicode emojis in a searchable grid
and copies the selected emoji to the clipboard or prints it to stdout
for use with keyboard shortcut integration.")
    (license license:expat)))

;;; ── qtilitools ───────────────────────────────────────────────────
;;; Collection of command-line tools for the Qtilities/LXQt ecosystem
;;; AUR: qtilitools  →  Guix: qtilitools
;;; Upstream: https://github.com/qtilities/qtilitools (CMake, BSD-3-Clause)
;;;
(define-public qtilitools
  (package
    (name "qtilitools")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/qtilities/qtilitools"
                           "/archive/refs/tags/" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config lxqt-build-tools))
    (inputs (list qtbase))
    (home-page "https://github.com/qtilities/qtilitools")
    (synopsis "command-line tools for the Qtilities/LXQt ecosystem")
    (description
     "Qtilitools is a collection of command-line utilities for the
Qtilities and LXQt desktop environment ecosystem.  It provides small
helper tools for desktop integration, file management, and system
operations that complement the LXQt desktop.")
    (license license:bsd-3)))

;;; ── wasistlos ────────────────────────────────────────────────────
;;; Native WhatsApp Web client for Linux using GTKmm and WebKitGTK
;;; AUR: wasistlos  →  Guix: wasistlos
;;; Upstream: https://github.com/nickvdp/nickvdp-WasIstLos (C++/CMake, GPL-3.0)
;;;
(define-public wasistlos
  (package
    (name "wasistlos")
    (version "1.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nickvdp/nickvdp-WasIstLos")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list gtkmm-3 webkitgtk libcanberra))
    (home-page "https://github.com/nickvdp/nickvdp-WasIstLos")
    (synopsis "native WhatsApp Web client for Linux desktops")
    (description
     "WasIstLos is a native Linux desktop client for WhatsApp Web built with
GTKmm 3 and WebKitGTK.  It provides desktop integration features such as
system tray support, notification handling, spell checking, and dark mode
while wrapping the WhatsApp Web interface.")
    (license license:gpl3)))

;;; ── openclaw ─────────────────────────────────────────────────────
;;; Open-source reimplementation of Captain Claw game engine
;;; AUR: openclaw-git  →  Guix: openclaw
;;; Upstream: https://github.com/pjasicek/OpenClaw (C++/CMake, GPL-3.0)
;;;
(define-public openclaw
  (package
    (name "openclaw")
    (version "0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pjasicek/OpenClaw")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list sdl2 sdl2-image sdl2-ttf sdl2-mixer sdl2-gfx
                  tinyxml zlib))
    (home-page "https://github.com/pjasicek/OpenClaw")
    (synopsis "open-source reimplementation of Captain Claw game engine")
    (description
     "OpenClaw is an open-source reimplementation of the 1997 platformer
game Captain Claw by Monolith Productions.  It provides a modern engine
built with SDL2 that can play the original game levels.  Note: the
original game assets are required and not included.")
    (license license:gpl3)))

;;; ── netrc ────────────────────────────────────────────────────────
;;; Command-line netrc file parser and editor
;;; AUR: netrc  →  Guix: netrc
;;; Upstream: https://github.com/dokku/netrc (Go, MIT)
;;;
(define-public netrc
  (package
    (name "netrc")
    (version "0.10.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dokku/netrc")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/dokku/netrc"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://github.com/dokku/netrc")
    (synopsis "command-line tool for managing .netrc files")
    (description
     "Netrc is a command-line utility for reading, parsing, and editing
@file{.netrc} authentication files.  It provides subcommands to get, set,
and remove machine credentials stored in the standard netrc format used
by tools like curl, git, and ftp.")
    (license license:expat)))

;;; ── pigo ─────────────────────────────────────────────────────────
;;; Pure Go face detection library and CLI
;;; AUR: pigo-bin  →  Guix: pigo (built from source)
;;; Upstream: https://github.com/esimov/pigo (Go, MIT)
;;;
(define-public pigo
  (package
    (name "pigo")
    (version "1.4.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/esimov/pigo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/esimov/pigo"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://github.com/esimov/pigo")
    (synopsis "pure Go face detection library using pixel intensity comparison")
    (description
     "Pigo is a pure Go face detection library based on pixel intensity
comparison-based object detection, offering a Go alternative to OpenCV
for face detection without any C dependencies.  It includes a command-line
tool for detecting faces in images.")
    (license license:expat)))

;;; ── mpris-scrobbler ──────────────────────────────────────────────
;;; MPRIS scrobbler daemon for Last.fm, Libre.fm, ListenBrainz
;;; AUR: mpris-scrobbler  →  Guix: mpris-scrobbler
;;; Upstream: https://github.com/mariusor/mpris-scrobbler (C/Meson, MIT)
;;;
(define-public mpris-scrobbler
  (package
    (name "mpris-scrobbler")
    (version "0.5.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mariusor/mpris-scrobbler")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list curl dbus json-c libevent))
    (home-page "https://github.com/mariusor/mpris-scrobbler")
    (synopsis "MPRIS scrobbler for Last.fm, Libre.fm, and ListenBrainz")
    (description
     "mpris-scrobbler is a minimalist scrobbling daemon that submits
currently playing track information from any MPRIS-compatible media
player to Last.fm, Libre.fm, or ListenBrainz.  It runs as a user
service listening on D-Bus for MPRIS signals.")
    (license license:expat)))

;;; ── notejot ──────────────────────────────────────────────────────
;;; Sticky notes app for GNOME (Vala/GTK4)
;;; AUR: notejot  →  Guix: notejot
;;; Upstream: https://github.com/lainsce/notejot (Vala/Meson, GPL-3.0)
;;;
(define-public notejot
  (package
    (name "notejot")
    (version "4.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lainsce/notejot")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:glib-or-gtk? #t))
    (native-inputs (list pkg-config vala
                         `(,glib "bin")
                         gettext-minimal
                         `(,gtk "bin")))
    (inputs (list gtk json-glib libadwaita libgee))
    (home-page "https://github.com/lainsce/notejot")
    (synopsis "sticky notes application for GNOME desktops")
    (description
     "Notejot is a simple sticky notes application for the GNOME desktop
built with GTK 4 and libadwaita.  It provides a clean interface for
creating, editing, and organizing quick notes with color-coding support.")
    (license license:gpl3)))

;;; ── butler ───────────────────────────────────────────────────────
;;; Home Assistant companion app for GNOME (Vala/GTK4)
;;; AUR: com.cassidyjames.butler  →  Guix: butler
;;; Upstream: https://github.com/nickvdp/nickvdp-butler (Vala/Meson, GPL-3.0)
;;;
(define-public butler
  (package
    (name "butler")
    (version "1.6.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nickvdp/nickvdp-butler")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:glib-or-gtk? #t))
    (native-inputs (list pkg-config vala
                         `(,glib "bin")
                         gettext-minimal))
    (inputs (list gtk libadwaita webkitgtk))
    (home-page "https://github.com/cassidyjames/butler")
    (synopsis "Home Assistant companion app for GNOME desktops")
    (description
     "Butler is a native GNOME companion app for Home Assistant, the
open-source home automation platform.  It provides a GTK 4 / libadwaita
interface with WebKitGTK for accessing your Home Assistant dashboard
directly from the Linux desktop with system integration.")
    (license license:gpl3)))

;;; ── puddletag ────────────────────────────────────────────────────
;;; Audio file tag editor for Linux (like Mp3tag for Windows)
;;; AUR: puddletag  →  Guix: puddletag
;;; Upstream: https://github.com/puddletag/puddletag (Python, GPL-3.0)
;;;
(define-public puddletag
  (package
    (name "puddletag")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/puddletag/puddletag"
                           "/archive/" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-pyqt python-mutagen python-configobj
                             python-pyparsing python-unidecode))
    (home-page "https://docs.puddletag.net/")
    (synopsis "audio file tag editor similar to Mp3tag")
    (description
     "puddletag is a graphical audio tag editor for Linux, inspired by
Mp3tag for Windows.  It supports batch editing of audio file metadata
across multiple formats (MP3, Ogg Vorbis, FLAC, WMA, MP4, etc.) with
features like tag-to-filename renaming, web lookups, and scripting.")
    (license license:gpl3)))

;;; ── tex-fmt ──────────────────────────────────────────────────────
;;; Fast LaTeX formatter written in Rust
;;; AUR: tex-fmt  →  Guix: tex-fmt
;;; Upstream: https://github.com/WGUNDERWOOD/tex-fmt (Rust, MIT)
;;;
(define-public tex-fmt
  (package
    (name "tex-fmt")
    (version "0.5.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/WGUNDERWOOD/tex-fmt"
                           "/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (home-page "https://github.com/WGUNDERWOOD/tex-fmt")
    (synopsis "fast LaTeX and BibTeX source code formatter")
    (description
     "tex-fmt is a fast formatter for LaTeX, BibTeX, and related file
formats, written in Rust.  It provides automatic indentation, line
wrapping, and whitespace normalization while preserving the semantic
structure of TeX documents.")
    (license license:expat)))

;;; ── bash-git-prompt ──────────────────────────────────────────────
;;; Informative git prompt for Bash and Fish
;;; AUR: bash-git-prompt  →  Guix: bash-git-prompt
;;; Upstream: https://github.com/magicmonty/bash-git-prompt (Shell, BSD-2-Clause)
;;;
(define-public bash-git-prompt
  (package
    (name "bash-git-prompt")
    (version "2.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/magicmonty/bash-git-prompt")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gitprompt.sh" "share/bash-git-prompt/gitprompt.sh")
               ("gitstatus.sh" "share/bash-git-prompt/gitstatus.sh")
               ("git-prompt-help.sh" "share/bash-git-prompt/git-prompt-help.sh")
               ("gitstatus.py" "share/bash-git-prompt/gitstatus.py")
               ("prompt-colors.sh" "share/bash-git-prompt/prompt-colors.sh")
               ("themes" "share/bash-git-prompt/themes"))))
    (home-page "https://github.com/magicmonty/bash-git-prompt")
    (synopsis "informative git prompt for Bash with status indicators")
    (description
     "bash-git-prompt provides a Bash prompt that displays information about
the current Git repository, including branch name, ahead/behind status,
staged/changed/untracked file counts, and merge/rebase state.  Source
@file{share/bash-git-prompt/gitprompt.sh} in your @file{.bashrc} to use.")
    (license license:bsd-2)))

;;; ── font-atkinson-hyperlegible-next ──────────────────────────────
;;; Atkinson Hyperlegible Next accessibility font
;;; AUR: otf-atkinson-hyperlegible-next  →  Guix: font-atkinson-hyperlegible-next
;;; Upstream: https://github.com/googlefonts/atkinson-hyperlegible-next (OFL-1.1)
;;;
(define-public font-atkinson-hyperlegible-next
  (package
    (name "font-atkinson-hyperlegible-next")
    (version "0.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/googlefonts/atkinson-hyperlegible-next")
             (commit "7925f50f649b3813257faf2f4c0b381011f434f1")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/googlefonts/atkinson-hyperlegible-next")
    (synopsis "accessibility-focused font designed for maximum legibility")
    (description
     "Atkinson Hyperlegible Next is the second version of the Atkinson
Hyperlegible typeface, designed by the Braille Institute to be maximally
legible for low-vision readers.  It features differentiated letterforms
that reduce confusion between similar characters like I/l/1 and O/0.")
    (license license:silofl1.1)))

;;; ── auto-throttle ────────────────────────────────────────────────
;;; Automatic CPU frequency/power throttling script
;;; AUR: auto-throttle  →  Guix: auto-throttle
;;; Upstream: https://github.com/ZauJulio/AutoThrottleSetup (Bash, MIT)
;;;
(define-public auto-throttle
  (package
    (name "auto-throttle")
    (version "1.0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ZauJulio/AutoThrottleSetup")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("auto-throttle.sh" "bin/auto-throttle"))))
    (home-page "https://github.com/ZauJulio/AutoThrottleSetup")
    (synopsis "automatic CPU frequency and power throttling script")
    (description
     "AutoThrottle is a Bash script that automatically adjusts CPU frequency
scaling and power management based on system load and temperature.  It
monitors thermal zones and adapts CPU governor settings to balance
performance and power consumption.  Note: the systemd service file is
not included; adapt for your init system as needed.")
    (license license:expat)))

;;; ── wingedit ─────────────────────────────────────────────────────
;;; Remote control for Behringer Wing digital mixers (binary)
;;; AUR: wingedit  →  Guix: wingedit
;;; Upstream: https://www.behringer.com/downloads.html (proprietary)
;;;
(define-public wingedit
  (package
    (name "wingedit")
    (version "2.2.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://mediadl.musictribe.com/download/software/behringer/"
             "WING/WING-Edit-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("WING-Edit" "bin/wingedit"))))
    (home-page "https://www.behringer.com/product.html?modelCode=P0BIH")
    (synopsis "remote control application for Behringer Wing digital mixers")
    (description
     "WING-Edit is the official remote control application for Behringer
WING digital mixing consoles.  It provides full access to mixer parameters,
routing, effects, and scene management from a Linux desktop.  Note: this
is a proprietary binary distributed by Behringer/Music Tribe.")
    (license (nonguix-license:nonfree
              "https://www.behringer.com/downloads.html"))))

;;; ── fortune-mod-futurama ─────────────────────────────────────────
;;; Futurama quotes fortune cookie data files
;;; AUR: fortune-mod-futurama  →  Guix: fortune-mod-futurama
;;; Upstream: http://www.netmeister.org/apps/ (public domain)
;;;
(define-public fortune-mod-futurama
  (package
    (name "fortune-mod-futurama")
    (version "0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.netmeister.org/apps/fortune-mod-futurama-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("futurama" "share/fortune/futurama")
               ("futurama.dat" "share/fortune/futurama.dat"))))
    (home-page "http://www.netmeister.org/apps/")
    (synopsis "Futurama quotes for the fortune program")
    (description
     "A collection of quotes from the animated television series Futurama
in fortune cookie format.  Install alongside @code{fortune-mod} and run
@code{fortune futurama} to display a random quote.")
    (license license:public-domain)))
