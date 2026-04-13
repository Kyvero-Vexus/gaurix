;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413s
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 16 recipes created (mixed build systems)
;;;   - 14 re-blocked with concrete attempt notes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413s)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages video)
  #:use-module (gnu packages wxwidgets)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages bash)
  #:export (
            dasel-bin
            jjui-bin
            dust-bin
            tre-command-bin
            dupe-krill-bin
            fstl
            qt-hearts
            ffqueue
            nautilus-bluetooth
            recorder
            python-c-formatter-42
            fsign
            fontviewer
            perl-jq-lite
            neovim-plenary
            scopebuddy
            ))

;;; ── dasel-bin (#1) ──

(define-public dasel-bin
  (package
    (name "dasel-bin")
    (version "3.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TomWright/dasel/releases/download/v"
                    version "/dasel_linux_amd64.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("dasel_linux_amd64" "bin/dasel"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'decompress
                 (lambda _
                   (invoke "gzip" "-d" "dasel_linux_amd64.gz")
                   (chmod "dasel_linux_amd64" #o755))))))
    (native-inputs (list gzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "select, put and delete data from JSON, TOML, YAML, XML and CSV")
    (description "Dasel (short for data-selector) allows you to query and
modify data structures using selector strings.  It supports JSON, TOML,
YAML, XML, CSV, and plain text formats from the command line, files,
or piped input.")
    (home-page "https://github.com/TomWright/dasel")
    (license license:expat)))

;;; ── jjui-bin (#2) ──

(define-public jjui-bin
  (package
    (name "jjui-bin")
    (version "0.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/idursun/jjui/releases/download/v"
                    version "/jjui-" version "-linux-amd64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("jjui" "bin/jjui"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal UI for the Jujutsu version control system")
    (description "Jjui is a TUI (terminal user interface) for interacting with
the Jujutsu (jj) version control system.  It provides an interactive way to
browse revisions, view diffs, and perform common jj operations from the
terminal.")
    (home-page "https://github.com/idursun/jjui")
    (license license:expat)))

;;; ── dust-bin (#3) ──

(define-public dust-bin
  (package
    (name "dust-bin")
    (version "1.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bootandy/dust/releases/download/v"
                    version "/dust-v" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("dust" "bin/dust"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "more intuitive version of du in Rust")
    (description "Dust is like du, the disk usage utility, but more intuitive.
It shows a visual representation of disk space usage using a tree-like
structure with percentage bars.  Written in Rust, it is fast and provides
color-coded output to quickly identify large files and directories.")
    (home-page "https://github.com/bootandy/dust")
    (license license:asl2.0)))

;;; ── tre-command-bin (#4) ──

(define-public tre-command-bin
  (package
    (name "tre-command-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dduan/tre/releases/download/v"
                    version "/tre-v" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tre" "bin/tre"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "improved tree command with git awareness and editor integration")
    (description "Tre is a modern replacement for the @command{tree} command.
It is aware of @file{.gitignore} files, supports colored output via
@env{LS_COLORS}, and can create shell aliases for quick navigation to
listed directories.  Written in Rust.")
    (home-page "https://github.com/dduan/tre")
    (license license:expat)))

;;; ── dupe-krill-bin (#5) ──

(define-public dupe-krill-bin
  (package
    (name "dupe-krill-bin")
    (version "1.4.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kornelski/dupe-krill/releases/download/v"
                    version "/dupe-krill_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "usr/bin/dupe-krill" bin)))))))
    (native-inputs (list (@ (gnu packages base) tar)
                         (@ (gnu packages compression) xz)))
    (supported-systems '("x86_64-linux"))
    (synopsis "incremental file deduplicator replacing duplicates with hardlinks")
    (description "Dupe-krill is a file deduplication tool that finds files with
identical content and replaces duplicates with hardlinks or reflinks.  It works
incrementally, remembering previously scanned files for efficiency.  Uses
BLAKE3 hashing for fast comparison.")
    (home-page "https://github.com/kornelski/dupe-krill")
    (license license:expat)))

;;; ── fstl (#6) ──

(define-public fstl
  (package
    (name "fstl")
    (version "0.11.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fstl-app/fstl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase-5 mesa))
    (synopsis "viewer for STL 3D model files")
    (description "Fstl is a fast viewer for STL (stereolithography) files used
in 3D printing and CAD.  It renders models using OpenGL for smooth real-time
viewing and supports drag-and-drop loading.  The interface is minimal and
focused on quick file inspection.")
    (home-page "https://github.com/fstl-app/fstl")
    (license license:expat)))

;;; ── qt-hearts (#7) ──

(define-public qt-hearts
  (package
    (name "qt-hearts")
    (version "1.0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/adelmonte/qt-hearts")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase qtsvg qtmultimedia qtdeclarative qttools))
    (synopsis "classic hearts card game built with Qt6")
    (description "Qt Hearts is a classic hearts card game featuring multiple
AI opponents, customizable card decks, animated gameplay, and sound effects.
Built with Qt6 and QML for a polished desktop experience.")
    (home-page "https://github.com/adelmonte/qt-hearts")
    (license license:gpl3)))

;;; ── ffqueue (#8) ──

(define-public ffqueue
  (package
    (name "ffqueue")
    (version "1.7.70")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bswebdk/FFQueue")
                    (commit (string-append "V" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list autoconf automake pkg-config))
    (inputs (list wxwidgets zlib ffmpeg))
    (synopsis "graphical user interface for FFmpeg")
    (description "FFQueue is a graphical front-end for FFmpeg that simplifies
media encoding tasks.  It provides a queue-based workflow for batch
processing, preset management, and filter configuration.  Requires a
working FFmpeg installation at runtime.")
    (home-page "https://ffqueue.bruchhaus.dk/")
    (license license:gpl3)))

;;; ── nautilus-bluetooth (#9) ──

(define-public nautilus-bluetooth
  (package
    (name "nautilus-bluetooth")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/madmurphy/nautilus-bluetooth")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list autoconf automake pkg-config gettext-minimal))
    (inputs (list glib nautilus))
    (synopsis "send files via Bluetooth from the Nautilus context menu")
    (description "Nautilus Bluetooth is a Nautilus extension that adds a
@samp{Send via Bluetooth} option to the right-click context menu.  It
integrates with GNOME Bluetooth to allow easy file sharing to nearby
Bluetooth devices directly from the file manager.")
    (home-page "https://gitlab.gnome.org/madmurphy/nautilus-bluetooth")
    (license license:gpl3+)))

;;; ── recorder (#10) ──

(define-public recorder
  (package
    (name "recorder")
    (version "1.0.19")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alexkdeveloper/recorder")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:glib-or-gtk? #t))
    (native-inputs (list pkg-config
                         `(,glib "bin")
                         vala
                         gettext-minimal))
    (inputs (list gtk libadwaita gstreamer pulseaudio))
    (synopsis "simple audio recorder for the GNOME desktop")
    (description "Recorder is a simple audio recording application for GNOME.
It uses GStreamer for audio capture and supports multiple output formats.
Features a clean, minimal interface built with GTK4 and Libadwaita for
integration with the GNOME desktop environment.")
    (home-page "https://github.com/alexkdeveloper/recorder")
    (license license:gpl3+)))

;;; ── python-c-formatter-42 (#11) ──

(define-public python-c-formatter-42
  (package
    (name "python-c-formatter-42")
    (version "0.2.8")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "c_formatter_42" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "C language formatter following the 42 school norm")
    (description "C Formatter 42 is a Python tool that automatically formats C
source code to comply with the 42 school coding standard (Norminette).  It
handles indentation, spacing, and alignment according to the norm's rules.")
    (home-page "https://github.com/dawnbeen/c_formatter_42")
    (license license:gpl3)))

;;; ── fsign (#12) ──

(define-public fsign
  (package
    (name "fsign")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bill88t/fsign")
                    (commit "b4f7d68")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((bin (string-append #$output "/bin")))
                 (mkdir-p bin)
                 (copy-file (string-append #$source "/fsign.py")
                            (string-append bin "/fsign"))
                 (chmod (string-append bin "/fsign") #o755)
                 (substitute* (string-append bin "/fsign")
                   (("#!/usr/bin/env python3")
                    (string-append "#!" (search-input-file
                                         %build-inputs "bin/python3"))))))))
    (inputs (list (@ (gnu packages python) python)))
    (synopsis "trivial folder signing utility using SHA-256 checksums")
    (description "Fsign is a simple utility for signing directory contents by
computing SHA-256 checksums of all files within a folder.  It can generate
and verify folder signatures to detect changes or tampering.  Written as a
single Python script with no external dependencies.")
    (home-page "https://github.com/bill88t/fsign")
    (license license:gpl3)))

;;; ── fontviewer (#13) ──

(define-public fontviewer
  (package
    (name "fontviewer")
    (version "0.5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/siyb/fontviewer")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((bin (string-append #$output "/bin")))
                 (mkdir-p bin)
                 (copy-file (string-append #$source "/fontviewer.tcl")
                            (string-append bin "/fontviewer"))
                 (chmod (string-append bin "/fontviewer") #o755)
                 (substitute* (string-append bin "/fontviewer")
                   (("#!/usr/bin/env wish")
                    (string-append "#!" (search-input-file
                                         %build-inputs "bin/wish"))))))))
    (inputs (list tk))
    (synopsis "font viewer written in Tcl/Tk")
    (description "Fontviewer is a graphical font viewer written in Tcl/Tk.  It
displays all installed fonts with a preview of each, allowing quick browsing
and selection.  Useful for finding the right font for design or development
work.")
    (home-page "https://github.com/siyb/fontviewer")
    (license license:bsd-3)))

;;; ── perl-jq-lite (#14) ──

(define-public perl-jq-lite
  (package
    (name "perl-jq-lite")
    (version "2.43")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/S/SH/SHINGO/JQ-Lite-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (synopsis "lightweight jq-like JSON query engine in pure Perl")
    (description "JQ::Lite is a pure Perl implementation of a jq-like JSON
query engine.  It provides JSON path selection, filtering, and transformation
capabilities without requiring the external @command{jq} binary.  Useful for
scripting and environments where installing native binaries is not
desirable.")
    (home-page "https://metacpan.org/release/JQ-Lite")
    (license license:perl-license)))

;;; ── neovim-plenary (#15) ──

(define-public neovim-plenary
  (package
    (name "neovim-plenary")
    (version "0.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nvim-lua/plenary.nvim")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lua" "share/nvim/site/pack/guix/start/plenary.nvim/lua")
               ("plugin" "share/nvim/site/pack/guix/start/plenary.nvim/plugin"))))
    (home-page "https://github.com/nvim-lua/plenary.nvim")
    (synopsis "Lua library of common utilities for Neovim plugins")
    (description "Plenary.nvim is a comprehensive Lua utility library for
Neovim plugin development.  It provides modules for asynchronous operations,
path manipulation, testing, job control, and functional programming patterns.
Many popular Neovim plugins depend on plenary as a foundational library.")
    (license license:expat)))

;;; ── scopebuddy (#16) ──

(define-public scopebuddy
  (package
    (name "scopebuddy")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenGamingCollective/ScopeBuddy")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("scopebuddy" "bin/scopebuddy")
               ("scopebuddy.conf" "etc/scopebuddy/scopebuddy.conf"))))
    (inputs (list bash))
    (synopsis "helper script for configuring Gamescope sessions")
    (description "ScopeBuddy is a shell script that helps configure and launch
Gamescope sessions with appropriate settings.  It automates resolution,
refresh rate, and display configuration for gaming sessions on Linux,
particularly useful for Steam Deck-like setups.")
    (home-page "https://github.com/OpenGamingCollective/ScopeBuddy")
    (license license:asl2.0)))
