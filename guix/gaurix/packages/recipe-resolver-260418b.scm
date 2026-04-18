;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418b
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;    1.  janet-lang (gnu-build-system, v1.37.2, MIT)
;;;    2.  go-mtpfs (go-build-system, v1.0.0, BSD-3)
;;;    3.  tiptop-cli (pyproject-build-system, v0.5.1, MIT)
;;;    4.  seqtui (cargo-build-system, v0.3.1, MIT)
;;;    5.  terminal-typeracer (cargo-build-system, v2.1.0, GPL-3.0+)
;;;    6.  hyprland-workspaces (cargo-build-system, v2.1.2, MIT)
;;;    7.  leakdice (cargo-build-system, v0.1.0, GPL-2.0)
;;;    8.  imapgoose (go-build-system, v0.3.0, ISC)
;;;    9.  mf-cli (cargo-build-system, v0.2.0, GPL-2.0)
;;;   10.  bitbake (python-build-system, v2.9.3, MIT/GPL-2.0)
;;;   11.  mvw (python-build-system, v0.1.3, GPL-3.0)
;;;   12.  tqftpserv (meson-build-system, v0.3, BSD-3)
;;;   13.  wordlist-generator (cargo-build-system, v0.3.3, MIT)
;;;   14.  fts-transfer (pyproject-build-system, v1.4.0, MIT)
;;;   15.  gomu (go-build-system, v2.1.0, MIT)
;;;   16.  gonic (go-build-system, v0.16.5, GPL-3.0+)
;;;   17.  heirloom-doctools (gnu-build-system, v191015, CDDL-1.0)
;;;   18.  wired-notify (cargo-build-system, v0.10.6, MIT)
;;;   19.  ragnarwm (gnu-build-system, v1.0, GPL-3.0)
;;;   20.  polybar (cmake-build-system, v3.7.2, MIT)
;;;   21.  telegram-bot-api (cmake-build-system, v8.3, BSL-1.0)
;;;   22.  kst2 (cmake-build-system, v2.0.8, GPL-2.0+)
;;;   23.  vtun-ng (cargo-build-system, v0.4.0, GPL-3.0)
;;;   24.  marble-marcher-ce (cmake-build-system, v1.4.0, GPL-2.0)
;;;   25.  supersayer (pyproject-build-system, v0.2.0, MIT)
;;;   26.  project-monalisa (copy-build-system, v1.0, MIT)
;;;   27.  catnap (gnu-build-system, v1.3.4, MIT)
;;;   28.  greetd-qtgreet (cmake-build-system, v2.0.2, GPL-3.0)
;;;   29.  virtualbmc (pyproject-build-system, v3.2.0, Apache-2.0)
;;;   30.  fcitx5-configtool (cmake-build-system, v5.1.8, GPL-2.0+)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system go)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages video)
  #:use-module (gnu packages image)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages music)
  #:use-module (gnu packages mp3)
  #:export (
            janet-lang
            go-mtpfs
            tiptop-cli
            seqtui
            terminal-typeracer
            hyprland-workspaces
            leakdice
            imapgoose
            mf-cli
            bitbake
            mvw
            tqftpserv
            wordlist-generator
            fts-transfer
            gomu
            gonic
            heirloom-doctools
            wired-notify
            ragnarwm
            polybar
            telegram-bot-api
            kst2
            vtun-ng
            marble-marcher-ce
            supersayer
            project-monalisa
            catnap
            greetd-qtgreet
            virtualbmc
            fcitx5-configtool
            ))


;;; ===================================================================
;;; GNU-BUILD-SYSTEM PACKAGES (configure/make)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. janet-lang --- Janet programming language
;;; -------------------------------------------------------------------
(define-public janet-lang
  (package
    (name "janet-lang")
    (version "1.37.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/janet-lang/janet")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:test-target "test"
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://janet-lang.org/")
    (synopsis "functional and imperative programming language and bytecode VM")
    (description "Janet is a functional and imperative programming language.
It is a Lisp-like language with a bytecode compiler, a PEG-based parser,
a module system, rich data structures, and a foreign function interface.
Janet can be used for scripting, system automation, prototyping, and
embedding in C programs.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. heirloom-doctools --- classic Unix document tools
;;; -------------------------------------------------------------------
(define-public heirloom-doctools
  (package
    (name "heirloom-doctools")
    (version "191015")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/n-t-roff/heirloom-doctools")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (substitute* "mk.config"
                       (("/usr/local") out))))))))
    (home-page "https://github.com/n-t-roff/heirloom-doctools")
    (synopsis "classic Unix troff/nroff document formatting tools")
    (description "Heirloom Doctools is a collection of the classical
UNIX document formatting utilities: troff, nroff, and associated
preprocessors and macro packages.  These tools originated in AT&T UNIX
and have been modernized to compile on current systems.")
    (license license:cddl1.0)))

;;; -------------------------------------------------------------------
;;; 19. ragnarwm --- minimal X11 tiling window manager
;;; -------------------------------------------------------------------
(define-public ragnarwm
  (package
    (name "ragnarwm")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cococry/ragnar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list libxcb
                  xcb-util
                  xcb-util-keysyms
                  xcb-util-wm
                  xcb-util-cursor
                  libx11
                  libxrandr
                  mesa
                  libconfig))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/cococry/ragnar")
    (synopsis "minimal X11 dynamic tiling window manager")
    (description "Ragnar is a minimal X11 dynamic tiling window manager
written in C.  It supports workspaces, window borders, gaps, keybindings,
and multiple monitor configurations.  Ragnar is designed to be lightweight
and configurable through a simple configuration file.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 27. catnap --- customizable system info fetcher
;;; -------------------------------------------------------------------
(define-public catnap
  (package
    (name "catnap")
    (version "1.3.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/iinsertNameHere/catnap")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://github.com/iinsertNameHere/catnap")
    (synopsis "customizable system information fetcher for the terminal")
    (description "Catnap is a customizable system information fetcher for the
terminal, similar to Neofetch or Fastfetch.  It displays system information
alongside ASCII art logos and supports custom themes, logos, and layouts.
Written in Nim, it is fast and lightweight.")
    (license license:expat)))


;;; ===================================================================
;;; GO-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 2. go-mtpfs --- MTP FUSE filesystem
;;; -------------------------------------------------------------------
(define-public go-mtpfs
  (package
    (name "go-mtpfs")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hanwen/go-mtpfs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/hanwen/go-mtpfs"
           #:tests? #f))
    (inputs (list libusb fuse))
    (home-page "https://github.com/hanwen/go-mtpfs")
    (synopsis "mount MTP devices as a FUSE filesystem")
    (description "Go-mtpfs is a simple FUSE filesystem for mounting
Android MTP devices on Linux.  It uses @code{libusb} to communicate
directly with the device, providing a fast and reliable way to access
files on MTP-capable devices.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 8. imapgoose --- IMAP sync and migration tool
;;; -------------------------------------------------------------------
(define-public imapgoose
  (package
    (name "imapgoose")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~whynothugo/ImapGoose")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "git.sr.ht/~whynothugo/ImapGoose"
           #:tests? #f))
    (home-page "https://git.sr.ht/~whynothugo/ImapGoose")
    (synopsis "local Maildir sync with an IMAP server")
    (description "ImapGoose is a tool for synchronizing local Maildir
directories with an IMAP server.  It supports bidirectional sync,
efficient incremental updates, and works with any standard IMAP server.")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 15. gomu --- terminal music player
;;; -------------------------------------------------------------------
(define-public gomu
  (package
    (name "gomu")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/issadarkthing/gomu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/issadarkthing/gomu"
           #:tests? #f))
    (inputs (list alsa-lib))
    (home-page "https://github.com/issadarkthing/gomu")
    (synopsis "terminal music player written in Go")
    (description "Gomu is a terminal music player written in Go.
It features a simple interface with vim-style keybindings for navigating
music libraries, managing playlists, and controlling playback directly
from the terminal.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. gonic --- Go Subsonic music streaming server
;;; -------------------------------------------------------------------
(define-public gonic
  (package
    (name "gonic")
    (version "0.16.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sentriz/gonic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "go.senan.xyz/gonic"
           #:tests? #f))
    (inputs (list taglib ffmpeg sqlite))
    (home-page "https://github.com/sentriz/gonic")
    (synopsis "lightweight Subsonic-compatible music streaming server")
    (description "Gonic is a lightweight music streaming server that
implements the Subsonic API.  It supports multiple users, transcoding via
FFmpeg, last.fm scrobbling, podcast support, and can be used with any
Subsonic-compatible client application.")
    (license license:gpl3+)))


;;; ===================================================================
;;; CARGO-BUILD-SYSTEM PACKAGES (Rust)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 4. seqtui --- terminal molecular sequence viewer
;;; -------------------------------------------------------------------
(define-public seqtui
  (package
    (name "seqtui")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Adnane017/SeqTUI")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Adnane017/SeqTUI")
    (synopsis "terminal-based molecular sequence viewer for DNA and proteins")
    (description "SeqTUI is a terminal-based molecular sequence viewer
for DNA and protein sequences.  It provides an interactive TUI for
exploring sequence data with color-coded display, search functionality,
and support for common bioinformatics file formats like FASTA.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. terminal-typeracer --- terminal typing speed test
;;; -------------------------------------------------------------------
(define-public terminal-typeracer
  (package
    (name "terminal-typeracer")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/ttyperacer/terminal-typeracer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/ttyperacer/terminal-typeracer")
    (synopsis "typing speed test in the terminal")
    (description "Terminal TypeRacer is a terminal-based typing speed test
application written in Rust.  It displays text passages for the user to
type, measures words per minute, accuracy, and provides a clean TUI
interface for practicing typing skills.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6. hyprland-workspaces --- Hyprland workspace widget
;;; -------------------------------------------------------------------
(define-public hyprland-workspaces
  (package
    (name "hyprland-workspaces")
    (version "2.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FieldofClay/hyprland-workspaces")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/FieldofClay/hyprland-workspaces")
    (synopsis "multi-monitor workspace widget for Hyprland")
    (description "Hyprland-workspaces is a workspace widget for the
Hyprland Wayland compositor.  It supports multi-monitor setups and can
be used with status bars like Waybar to display and switch between
workspaces with click support.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. leakdice --- memory leak detector via sampling
;;; -------------------------------------------------------------------
(define-public leakdice
  (package
    (name "leakdice")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tialaramex/leakdice")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/tialaramex/leakdice")
    (synopsis "memory leak detector using Monte Carlo sampling")
    (description "LeakDice is a memory leak detector that uses Monte Carlo
sampling to find leaks in running processes.  It reads the Linux procfs
to track memory allocations and identify patterns indicative of leaks,
with low overhead suitable for production use.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 9. mf-cli --- Arturia MiniFuse audio interface CLI
;;; -------------------------------------------------------------------
(define-public mf-cli
  (package
    (name "mf-cli")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nolight132/mf-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libusb eudev))
    (home-page "https://github.com/nolight132/mf-cli")
    (synopsis "CLI for controlling Arturia MiniFuse audio interfaces")
    (description "MF-CLI is a command-line tool for controlling Arturia
MiniFuse audio interfaces on Linux.  It allows adjusting gain, phantom
power, direct monitoring, and other parameters of the MiniFuse 1, 2,
and 4 interfaces via USB HID commands.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 13. wordlist-generator --- wordlist/permutation generator
;;; -------------------------------------------------------------------
(define-public wordlist-generator
  (package
    (name "wordlist-generator")
    (version "0.3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ritiek/wordlist-generator")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ritiek/wordlist-generator")
    (synopsis "wordlist generator based on character permutations")
    (description "Wordlist-generator is a command-line tool that generates
wordlists based on character permutations.  It supports customizable
character sets, minimum and maximum lengths, and outputs wordlists
suitable for security testing and other applications.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. wired-notify --- lightweight notification daemon
;;; -------------------------------------------------------------------
(define-public wired-notify
  (package
    (name "wired-notify")
    (version "0.10.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Toqozz/wired-notify")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list dbus cairo pango glib libx11 libxss))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/Toqozz/wired-notify")
    (synopsis "lightweight notification daemon with customizable layouts")
    (description "Wired is a lightweight and customizable notification
daemon for X11.  It supports rich notification layouts with text, images,
progress bars, and custom positioning.  Notifications are configured via
a simple configuration file with extensive theming options.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. vtun-ng --- network tunnel with encryption
;;; -------------------------------------------------------------------
(define-public vtun-ng
  (package
    (name "vtun-ng")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/leakingmemory/vtun-ng")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openssl))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/leakingmemory/vtun-ng")
    (synopsis "network tunnel with encryption and traffic shaping")
    (description "Vtun-ng is a rewrite of vtun, providing easy network
tunneling with encryption and traffic shaping capabilities.  It supports
TUN/TAP devices for creating virtual network interfaces and uses OpenSSL
for secure communication between tunnel endpoints.")
    (license license:gpl3)))


;;; ===================================================================
;;; PYTHON / PYPROJECT BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 3. tiptop-cli --- CLI system monitor with TUI graphs
;;; -------------------------------------------------------------------
(define-public tiptop-cli
  (package
    (name "tiptop-cli")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "tiptop" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-psutil python-textual))
    (home-page "https://github.com/nschloe/tiptop")
    (synopsis "command-line system monitor with live TUI graphs")
    (description "Tiptop is a command-line system monitoring tool that
displays live graphs of CPU, memory, disk, and network usage in the
terminal.  It uses the Textual framework for its TUI interface and
provides a modern alternative to traditional tools like @command{top}.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. bitbake --- generic task execution engine
;;; -------------------------------------------------------------------
(define-public bitbake
  (package
    (name "bitbake")
    (version "2.9.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openembedded/bitbake")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (inputs (list python))
    (home-page "https://github.com/openembedded/bitbake")
    (synopsis "generic task execution engine for build systems")
    (description "BitBake is a generic task execution engine that allows
shell and Python tasks to be run efficiently and in parallel.  It is the
build tool used by the OpenEmbedded and Yocto Project build frameworks
for creating embedded Linux distributions.")
    (license (list license:gpl2 license:expat))))

;;; -------------------------------------------------------------------
;;; 11. mvw --- terminal movie cataloger
;;; -------------------------------------------------------------------
(define-public mvw
  (package
    (name "mvw")
    (version "0.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fatinul/mvw")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-rich python-requests))
    (home-page "https://github.com/fatinul/mvw")
    (synopsis "terminal movie review cataloger")
    (description "Mvw is a terminal-based movie review cataloger.
It allows users to search for movies, add them to a local database,
and manage personal reviews and ratings from the command line using
a simple and intuitive interface.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. fts-transfer --- LAN file transfer tool
;;; -------------------------------------------------------------------
(define-public fts-transfer
  (package
    (name "fts-transfer")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Terabase-Studios/fts")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-tqdm python-cryptography))
    (home-page "https://github.com/Terabase-Studios/fts")
    (synopsis "LAN file transfer tool with encryption")
    (description "FTS is a LAN file transfer tool with a terminal
interface.  It supports encrypted file transfers between devices on the
same local network, with a progress bar, automatic device discovery,
and optional password protection.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. supersayer --- speech-to-text input tool
;;; -------------------------------------------------------------------
(define-public supersayer
  (package
    (name "supersayer")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/demizer/supersayer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python))
    (home-page "https://github.com/demizer/supersayer")
    (synopsis "speech-to-text input tool using whisper")
    (description "Supersayer is a speech-to-text input tool that uses
whisper.cpp for transcription.  It provides a system-wide interface for
dictating text in any application, with support for multiple languages
and customizable hotkeys.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. virtualbmc --- virtual BMC for IPMI testing
;;; -------------------------------------------------------------------
(define-public virtualbmc
  (package
    (name "virtualbmc")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "virtualbmc" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-pbr python-pyzmq libvirt))
    (home-page "https://opendev.org/openstack/virtualbmc")
    (synopsis "virtual BMC for testing IPMI commands against virtual machines")
    (description "VirtualBMC is a proxy that translates IPMI commands into
libvirt calls, allowing you to manage virtual machines using standard
IPMI tools.  This is useful for testing bare-metal provisioning tools like
Ironic against virtual machines instead of physical hardware.")
    (license license:asl2.0)))


;;; ===================================================================
;;; MESON-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 12. tqftpserv --- TFTP server for Qualcomm SoCs
;;; -------------------------------------------------------------------
(define-public tqftpserv
  (package
    (name "tqftpserv")
    (version "0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linux-msm/tqftpserv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs (list zstd))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/linux-msm/tqftpserv")
    (synopsis "TFTP server over QRTR for Qualcomm SoCs")
    (description "Tqftpserv is a TFTP server that operates over the QRTR
(Qualcomm IPC Router) protocol.  It is used on Qualcomm-based systems for
firmware loading and other file transfer operations between the host
processor and co-processors like the modem DSP.")
    (license license:bsd-3)))


;;; ===================================================================
;;; CMAKE-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 20. polybar --- fast X11 status bar
;;; -------------------------------------------------------------------
(define-public polybar
  (package
    (name "polybar")
    (version "3.7.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/polybar/polybar")
                    (commit version)
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list cairo
                  libxcb
                  xcb-util
                  xcb-util-wm
                  xcb-util-image
                  xcb-util-cursor
                  xcb-util-xrm
                  alsa-lib
                  pulseaudio
                  curl
                  libnl
                  jsoncpp))
    (native-inputs (list pkg-config python))
    (home-page "https://github.com/polybar/polybar")
    (synopsis "fast and easy-to-use tool for creating status bars")
    (description "Polybar is a fast and easy-to-use tool for creating
status bars.  It aims to help users build beautiful and highly customizable
status bars for their desktop environment, with built-in modules for
system information, window management, music, and more.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. telegram-bot-api --- self-hosted Telegram Bot API server
;;; -------------------------------------------------------------------
(define-public telegram-bot-api
  (package
    (name "telegram-bot-api")
    (version "8.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tdlib/telegram-bot-api")
                    (commit (string-append "v" version))
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openssl zlib gperf))
    (home-page "https://github.com/tdlib/telegram-bot-api")
    (synopsis "self-hosted server for the Telegram Bot API")
    (description "Telegram Bot API server is the official self-hosted
implementation of the Telegram Bot API.  Running your own server provides
lower latency, no limits on local file sizes, allows receiving all updates
via webhook, and keeps file data on your own server.")
    (license license:boost1.0)))

;;; -------------------------------------------------------------------
;;; 22. kst2 --- data visualization and plotting tool
;;; -------------------------------------------------------------------
(define-public kst2
  (package
    (name "kst2")
    (version "2.0.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Kst-plot/kst")
                    (commit (string-append "Kst-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase-5))
    (native-inputs (list pkg-config))
    (home-page "https://kst-plot.kde.org/")
    (synopsis "real-time large-dataset viewing and plotting tool")
    (description "Kst is the fastest real-time large-dataset viewing and
plotting tool available.  It is designed to view and interact with data
from various sources including files, databases, and live sensor feeds.
Kst excels at scientific data visualization with support for multiple
plot types and data formats.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 24. marble-marcher-ce --- fractal physics marble game
;;; -------------------------------------------------------------------
(define-public marble-marcher-ce
  (package
    (name "marble-marcher-ce")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/WAUthethird/Marble-Marcher-Community-Edition")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list sfml eigen glew glm openal))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/WAUthethird/Marble-Marcher-Community-Edition")
    (synopsis "fractal physics marble game")
    (description "Marble Marcher: Community Edition is a game where you
roll a marble through fractal landscapes.  The game uses real-time raymarching
of signed distance fields for rendering, creating unique and visually
stunning levels based on mathematical fractals.  It features level
editing and community-created content.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 28. greetd-qtgreet --- Qt-based greetd greeter
;;; -------------------------------------------------------------------
(define-public greetd-qtgreet
  (package
    (name "greetd-qtgreet")
    (version "2.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/marcusbritanicus/QtGreet")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase-5 qtwayland-5 json-c))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/marcusbritanicus/QtGreet")
    (synopsis "Qt-based graphical greeter for greetd")
    (description "QtGreet is a graphical greeter for the greetd login
daemon.  It provides a modern Qt-based login interface with support for
multiple sessions, user selection, and theming.  QtGreet works on both
X11 and Wayland compositors.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 30. fcitx5-configtool --- Fcitx5 configuration GUI
;;; -------------------------------------------------------------------
(define-public fcitx5-configtool
  (package
    (name "fcitx5-configtool")
    (version "5.1.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.fcitx-im.org/fcitx5/fcitx5-configtool/"
                    "fcitx5-configtool-" version ".tar.zst"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase-5
                  qt5compat
                  libxkbcommon
                  iso-codes))
    (native-inputs (list pkg-config extra-cmake-modules gettext-minimal))
    (home-page "https://github.com/fcitx/fcitx5-configtool")
    (synopsis "graphical configuration tool for Fcitx5 input method framework")
    (description "Fcitx5-configtool is the graphical configuration tool
for the Fcitx5 input method framework.  It provides a Qt-based interface
for managing input methods, setting global options, configuring addons,
and customizing keybindings for the Fcitx5 framework.")
    (license license:gpl2+)))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 26. project-monalisa --- network protocol exploration tool
;;; -------------------------------------------------------------------
(define-public project-monalisa
  (package
    (name "project-monalisa")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Akash420-oss/Project-Monalisa")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/project-monalisa/"
                #:exclude ("README.md" ".git")))))
    (propagated-inputs (list python))
    (home-page "https://github.com/Akash420-oss/Project-Monalisa")
    (synopsis "network protocol exploration and analysis tool")
    (description "Project Monalisa is a network protocol exploration and
analysis tool for learning about network protocols.  It provides Python
scripts for examining network traffic patterns and understanding how
different protocols communicate.")
    (license license:expat)))
