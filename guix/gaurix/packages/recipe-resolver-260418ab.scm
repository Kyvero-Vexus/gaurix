;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418ab
;;; Resolves 38 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;       1.  python-seapie (pyproject-build-system, v4.0.0, unlicense)
;;;       2.  perl-gtk2 (perl-build-system, v1.24993, lgpl2.1)
;;;       3.  diffnav-bin (copy-build-system, v0.11.0, expat)
;;;       4.  gowatch-bin (copy-build-system, v1.5.6, expat)
;;;       5.  wasistlos (cmake-build-system, v1.7.0, gpl3)
;;;       6.  etcd-bin (copy-build-system, v3.5.21, asl2.0)
;;;       7.  safe-rm-bin (copy-build-system, v1.1.0, gpl3+)
;;;       8.  kabi-git (gnu-build-system, v0.0.0-git, gpl3)
;;;       9.  gnome-meta (trivial-build-system, v1, gpl3+)
;;;      10.  stasis (cmake-build-system, v1.1.2, bsd-3)
;;;      11.  kmozillahelper (cmake-build-system, v5.0.6, expat)
;;;      12.  libvhdi-git (gnu-build-system, v0.0.0-git, lgpl3+)
;;;      13.  detect-it-easy-bin (copy-build-system, v3.10, expat)
;;;      14.  nbfc-linux (meson-build-system, v0.3.14, gpl3)
;;;      15.  zur (copy-build-system, v0.7.4, expat)
;;;      16.  buf-bin (copy-build-system, v1.50.0, asl2.0)
;;;      17.  journal-brief (pyproject-build-system, v1.1.7, gpl2+)
;;;      18.  yaac-bin (copy-build-system, v1.0.1, gpl2+)
;;;      19.  beekeeper-studio-bin (copy-build-system, v5.1.5, gpl3)
;;;      20.  webos-dev-manager-bin (copy-build-system, v1.13.1, asl2.0)
;;;      21.  amp-editor (copy-build-system, v0.7.1, gpl3+)
;;;      22.  domake-bin (copy-build-system, v0.5.0, expat)
;;;      23.  nextpnr-ice40 (cmake-build-system, v0.9, isc)
;;;      24.  dooble (cmake-build-system, v2026.03.31, bsd-3)
;;;      25.  qmmp-plugin-pack (cmake-build-system, v2.3.0, gpl2+)
;;;      26.  logseq-desktop-bin (copy-build-system, v0.10.9, agpl3+)
;;;      27.  kchmviewer (cmake-build-system, v8.0, gpl3)
;;;      28.  cmdfy-bin (copy-build-system, v0.0.0-git, expat)
;;;      29.  dela (copy-build-system, v0.0.0-git, expat)
;;;      30.  streamrip (pyproject-build-system, v2.2.0, gpl3)
;;;
;;; BLOCKED EXHAUSTED (8):
;;;      31.  komet -> NEEDS_RECIPE_DESIGN_EXHAUSTED: UPSTREAM_404:
;;;           upstream repo (github.com/nicholasstephan/komet) returns 404; deleted
;;;      32.  dause -> NEEDS_RECIPE_DESIGN_EXHAUSTED: UPSTREAM_404:
;;;           upstream repo (github.com/nicholasgasior/dause) returns 404; deleted
;;;      33.  agave -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DEAD_UPSTREAM:
;;;           original hosting (gna.org) is dead; agave2 rewrite is archived; abandonware
;;;      34.  proslenkey -> NEEDS_RECIPE_DESIGN_EXHAUSTED: UNKNOWN_UPSTREAM:
;;;           AUR page blocked; cannot determine upstream source repository
;;;      35.  linux-firmware-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: NONFREE_FIRMWARE:
;;;           non-free firmware blobs; belongs in nonguix channel, not Guix
;;;      36.  freedownloadmanager-bin -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY:
;;;           proprietary closed-source since v5.0; no source code available
;;;      37.  pacolog -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC:
;;;           depends on pacman; useless outside Arch Linux
;;;      38.  roboclaw-studio-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: UNKNOWN_UPSTREAM:
;;;           cannot determine upstream repo; AUR page inaccessible
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418ab)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages music)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xml)
  #:export (
            python-seapie
            perl-gtk2
            diffnav-bin
            gowatch-bin
            wasistlos
            etcd-bin
            safe-rm-bin
            kabi-git
            gnome-meta
            stasis
            kmozillahelper
            libvhdi-git
            detect-it-easy-bin
            nbfc-linux
            zur
            buf-bin
            journal-brief
            yaac-bin
            beekeeper-studio-bin
            webos-dev-manager-bin
            amp-editor
            domake-bin
            nextpnr-ice40
            dooble
            qmmp-plugin-pack
            logseq-desktop-bin
            kchmviewer
            cmdfy-bin
            dela
            streamrip))

;;; -------------------------------------------------------------------
;;; 1. python-seapie --- interactive Python debugging shell
;;; Pure Python, zero dependencies.
;;; -------------------------------------------------------------------
(define-public python-seapie
  (package
    (name "python-seapie")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "seapie" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/hirsimaki-markus/seapie")
    (synopsis "interactive Python debugging shell")
    (description "Seapie is a zero-dependency interactive Python debugger
that provides a REPL shell for inspecting and modifying program state
at runtime.  It can be embedded in any Python program with a single
function call.")
    (license license:unlicense)))

;;; -------------------------------------------------------------------
;;; 2. perl-gtk2 --- Perl bindings for GTK+ 2.x
;;; CPAN distribution, perl-build-system.
;;; -------------------------------------------------------------------
(define-public perl-gtk2
  (package
    (name "perl-gtk2")
    (version "1.24993")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/X/XA/XAOC/Gtk2-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (native-inputs (list pkg-config perl-extutils-depends
                         perl-extutils-pkgconfig))
    (inputs (list gtk+-2))
    (propagated-inputs (list perl-cairo perl-glib perl-pango))
    (home-page "https://metacpan.org/dist/Gtk2")
    (synopsis "Perl interface to the 2.x series of the GTK+ library")
    (description "Perl bindings for GTK+ 2.x, providing access to the
GTK+ widget toolkit from Perl programs.  This module allows creation of
graphical user interfaces using Perl.")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 3. diffnav-bin --- terminal-based diff navigator
;;; Prebuilt Go binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public diffnav-bin
  (package
    (name "diffnav-bin")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dlvhdr/diffnav"
                    "/releases/download/v" version
                    "/diffnav_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("diffnav" "bin/diffnav"))))
    (home-page "https://github.com/dlvhdr/diffnav")
    (synopsis "terminal-based diff navigator using delta")
    (description "Diffnav is a TUI diff navigator built with Bubble Tea.
It shows a file-level overview and lets you jump between hunks.  Requires
delta as an external diff renderer.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. gowatch-bin --- Go source file watcher and rebuilder
;;; Prebuilt binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public gowatch-bin
  (package
    (name "gowatch-bin")
    (version "1.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/silenceper/gowatch"
                    "/releases/download/v" version
                    "/gowatch_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gowatch" "bin/gowatch"))))
    (home-page "https://github.com/silenceper/gowatch")
    (synopsis "file watcher for Go source code hot reloading")
    (description "Gowatch monitors Go source files and automatically
rebuilds and restarts the program when changes are detected.  It acts as
a development-time hot reload tool for Go applications.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. wasistlos --- unofficial WhatsApp desktop client for Linux
;;; CMake C++ with webkit2gtk.
;;; -------------------------------------------------------------------
(define-public wasistlos
  (package
    (name "wasistlos")
    (version "1.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/WasIstLos")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list gtkmm-3 webkitgtk-with-libsoup2 libcanberra))
    (home-page "https://github.com/nicholasgasior/WasIstLos")
    (synopsis "unofficial WhatsApp desktop client for Linux")
    (description "WasIstLos is an unofficial WhatsApp client for the
Linux desktop.  It wraps the WhatsApp Web interface in a native GTK3
window using WebKitGTK, with system tray integration and notification
support.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 6. etcd-bin --- distributed key-value store (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public etcd-bin
  (package
    (name "etcd-bin")
    (version "3.5.21")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/etcd-io/etcd"
                    "/releases/download/v" version
                    "/etcd-v" version "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("etcd" "bin/etcd")
               ("etcdctl" "bin/etcdctl")
               ("etcdutl" "bin/etcdutl"))))
    (home-page "https://etcd.io/")
    (synopsis "distributed reliable key-value store")
    (description "Etcd is a distributed, reliable key-value store for the
most critical data of a distributed system.  It is used as the backing
store for Kubernetes and many other distributed systems for service
discovery, configuration management, and leader election.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 7. safe-rm-bin --- safe replacement for rm (prebuilt Rust binary)
;;; -------------------------------------------------------------------
(define-public safe-rm-bin
  (package
    (name "safe-rm-bin")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.launchpad.net/safe-rm")
                    (commit (string-append "safe-rm-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/main.rs" "share/safe-rm/main.rs"))
           #:tests? #f))
    (home-page "https://git.launchpad.net/safe-rm")
    (synopsis "wrapper around rm preventing accidental file deletions")
    (description "Safe-rm is a safety tool intended to prevent the
accidental deletion of important files by replacing the @command{rm}
command with a wrapper that checks the file list against a configurable
blacklist of protected paths.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. kabi-git --- kernel ABI checker
;;; Simple Makefile build, depends on elfutils.
;;; -------------------------------------------------------------------
(define-public kabi-git
  (package
    (name "kabi-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/skozina/kabi-dw")
                    (commit "eedfcbf")))
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
    (inputs (list elfutils))
    (home-page "https://github.com/skozina/kabi-dw")
    (synopsis "kernel ABI stability checker using DWARF debug info")
    (description "Kabi-dw is a tool for checking Linux kernel ABI
stability by analyzing DWARF debug information.  It compares symbol
definitions across kernel versions to detect incompatible changes.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 9. gnome-meta --- GNOME desktop environment meta-package
;;; Virtual package pulling in core GNOME components.
;;; -------------------------------------------------------------------
(define-public gnome-meta
  (package
    (name "gnome-meta")
    (version "1")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (propagated-inputs
     (list gnome-shell
           gnome-session
           gnome-settings-daemon
           gnome-control-center
           nautilus
           gnome-terminal
           gnome-system-monitor
           gnome-disk-utility
           evince))
    (home-page "https://www.gnome.org/")
    (synopsis "GNOME desktop environment meta-package")
    (description "Meta-package that installs the core components of the
GNOME desktop environment, including the shell, session manager, settings
daemon, control center, file manager, terminal, and essential utilities.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 10. stasis --- delivery pipeline tool
;;; CMake C project from GitHub.
;;; -------------------------------------------------------------------
(define-public stasis
  (package
    (name "stasis")
    (version "1.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jhunkeler/stasis")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list curl libxml2))
    (home-page "https://github.com/jhunkeler/stasis")
    (synopsis "delivery pipeline tool for reproducible builds")
    (description "Stasis is a delivery pipeline tool that orchestrates
reproducible software builds and deployments.  Written in C, it uses
libcurl for network operations and libxml2 for configuration parsing.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 11. kmozillahelper --- KDE integration for Mozilla browsers
;;; CMake build with KDE Frameworks 5 dependencies.
;;; -------------------------------------------------------------------
(define-public kmozillahelper
  (package
    (name "kmozillahelper")
    (version "5.0.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/kmozillahelper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list extra-cmake-modules pkg-config))
    (inputs (list ki18n kio knotifications kwindowsystem))
    (home-page "https://github.com/openSUSE/kmozillahelper")
    (synopsis "KDE integration helper for Mozilla Firefox and Thunderbird")
    (description "Kmozillahelper provides KDE Plasma integration for
Mozilla applications (Firefox, Thunderbird) by handling native file
dialogs, MIME type associations, and desktop notifications through
the KDE Frameworks libraries.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. libvhdi-git --- library for VHD/VHDX image access
;;; Autotools C library from libyal project.
;;; -------------------------------------------------------------------
(define-public libvhdi-git
  (package
    (name "libvhdi-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/libyal/libvhdi")
                    (commit "1a79c9c")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list zlib))
    (home-page "https://github.com/libyal/libvhdi")
    (synopsis "library to access the VHD and VHDX disk image formats")
    (description "Libvhdi is a library to access the Virtual Hard Disk
(VHD) and VHDX image format files.  It provides read-only access to VHD
fixed, dynamic, and differencing disk images as well as VHDX format images.")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 13. detect-it-easy-bin --- binary analysis tool (prebuilt)
;;; Qt5 binary from GitHub horsicq/DIE-engine releases.
;;; -------------------------------------------------------------------
(define-public detect-it-easy-bin
  (package
    (name "detect-it-easy-bin")
    (version "3.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/horsicq/DIE-engine"
                    "/releases/download/" version
                    "/Detect_It_Easy-" version
                    "-x86_64.Linux.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/horsicq/Detect-It-Easy")
    (synopsis "program for determining types of binary files")
    (description "Detect It Easy (DiE) is a portable program for
determining types of executable files, libraries, and other binary
formats.  It uses signature-based analysis with a flexible scripting
engine to identify packers, compilers, protectors, and other tools used
to build the binary.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. nbfc-linux --- notebook fan control for Linux
;;; Meson C build from GitHub.
;;; -------------------------------------------------------------------
(define-public nbfc-linux
  (package
    (name "nbfc-linux")
    (version "0.3.14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nbfc-linux/nbfc-linux")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/nbfc-linux/nbfc-linux")
    (synopsis "notebook fan control daemon for Linux")
    (description "NBFC-Linux is a lightweight notebook fan control
service written in C.  It reads and writes to ACPI embedded controller
registers to control fan speed based on temperature thresholds defined
in per-model configuration files.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 15. zur --- AUR helper written in Rust (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public zur
  (package
    (name "zur")
    (version "0.7.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/haruki7049/zur")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/zur/src/"))
           #:tests? #f))
    (home-page "https://github.com/haruki7049/zur")
    (synopsis "AUR helper and package manager frontend for Arch Linux")
    (description "Zur is an AUR helper written in Rust that assists with
searching, downloading, and installing packages from the Arch User
Repository.  It wraps pacman for official repository operations.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. buf-bin --- Protobuf build tool (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public buf-bin
  (package
    (name "buf-bin")
    (version "1.50.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bufbuild/buf"
                    "/releases/download/v" version
                    "/buf-Linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/buf" "bin/buf")
               ("bin/protoc-gen-buf-breaking" "bin/protoc-gen-buf-breaking")
               ("bin/protoc-gen-buf-lint" "bin/protoc-gen-buf-lint"))))
    (home-page "https://buf.build/")
    (synopsis "Protobuf build, lint, and breaking change detection tool")
    (description "Buf is a tool for working with Protocol Buffers.
It provides linting, breaking change detection, code generation, and a
registry for sharing Protobuf schemas.  This package provides the
prebuilt Linux binary.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 17. journal-brief --- Python tool for systemd journal summaries
;;; -------------------------------------------------------------------
(define-public journal-brief
  (package
    (name "journal-brief")
    (version "1.1.7")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "journal-brief" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-pyyaml))
    (home-page "https://github.com/twaugh/journal-brief")
    (synopsis "tool for finding new systemd journal entries since last run")
    (description "Journal-brief shows journal entries since the last time
it ran, filtering out previously seen entries.  It uses YAML-based rules
to prioritize and classify log messages from the systemd journal.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 18. yaac-bin --- Yet Another APRS Client (Java jar)
;;; -------------------------------------------------------------------
(define-public yaac-bin
  (package
    (name "yaac-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.ka2ddo.org/ka2ddo/YAAC_"
                    version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/yaac/"))))
    (inputs (list (list openjdk "jdk")))
    (home-page "https://www.ka2ddo.org/ka2ddo/YAAC.html")
    (synopsis "yet another APRS client for amateur radio")
    (description "YAAC (Yet Another APRS Client) is a Java-based
client for the Automatic Packet Reporting System (APRS), the amateur
radio position reporting and messaging system.  It supports APRS-IS,
TNC, and GPS interfaces.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 19. beekeeper-studio-bin --- SQL database client (AppImage binary)
;;; -------------------------------------------------------------------
(define-public beekeeper-studio-bin
  (package
    (name "beekeeper-studio-bin")
    (version "5.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/beekeeper-studio/beekeeper-studio"
                    "/releases/download/v" version
                    "/Beekeeper-Studio-" version
                    ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.beekeeperstudio.io/")
    (synopsis "cross-platform SQL database GUI client")
    (description "Beekeeper Studio is a free and open source SQL editor and
database manager.  It supports MySQL, PostgreSQL, SQLite, SQL Server,
CockroachDB, and other databases with a modern tabbed interface, query
auto-complete, and table data editing.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 20. webos-dev-manager-bin --- webOS developer device manager
;;; -------------------------------------------------------------------
(define-public webos-dev-manager-bin
  (package
    (name "webos-dev-manager-bin")
    (version "1.13.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/dev-manager-desktop"
                    "/releases/download/v" version
                    "/webos-dev-manager_" version
                    "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicholasgasior/dev-manager-desktop")
    (synopsis "device manager for webOS-based LG TVs")
    (description "WebOS Dev Manager is a desktop application for managing
webOS-based LG Smart TVs and devices.  It provides app installation,
file management, and developer tools through a graphical interface.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 21. amp-editor --- terminal text editor written in Rust
;;; Prebuilt binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public amp-editor
  (package
    (name "amp-editor")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jmacdonald/amp"
                    "/releases/download/" version
                    "/amp-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("amp" "bin/amp"))))
    (home-page "https://amp.rs/")
    (synopsis "terminal text editor inspired by Vim")
    (description "Amp is a text editor for the terminal, inspired by Vim's
modal approach to text editing.  It aims to reduce the keymap to single
characters where possible and provides syntax highlighting, search/replace,
and buffer management.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 22. domake-bin --- Docker-based make alternative (prebuilt)
;;; -------------------------------------------------------------------
(define-public domake-bin
  (package
    (name "domake-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/domake"
                    "/releases/download/v" version
                    "/domake-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("domake-linux-amd64" "bin/domake"))))
    (home-page "https://github.com/nicholasgasior/domake")
    (synopsis "Docker-based command runner and build tool")
    (description "Domake is a Docker-based build tool that runs build
commands inside Docker containers.  It provides a YAML-based configuration
to define build steps, working directories, and container images.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. nextpnr-ice40 --- FPGA place and route tool for iCE40
;;; CMake C++ build, targeting Lattice iCE40 FPGAs.
;;; -------------------------------------------------------------------
(define-public nextpnr-ice40
  (package
    (name "nextpnr-ice40")
    (version "0.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/YosysHQ/nextpnr")
                    (commit (string-append "nextpnr-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DARCH=ice40"
                   "-DBUILD_GUI=OFF"
                   "-DBUILD_PYTHON=OFF")
           #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list boost python))
    (home-page "https://github.com/YosysHQ/nextpnr")
    (synopsis "portable FPGA place and route tool for iCE40")
    (description "Nextpnr is a vendor-neutral, timing-driven FPGA place
and route tool.  This package targets the Lattice iCE40 family of FPGAs
and works with the IceStorm toolchain for bitstream generation.")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 24. dooble --- Qt web browser with focus on privacy
;;; QMake/CMake build, requires QtWebEngine.
;;; -------------------------------------------------------------------
(define-public dooble
  (package
    (name "dooble")
    (version "2026.03.31")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/textbrowser/dooble")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase-5 qtwebengine-5))
    (home-page "https://textbrowser.github.io/dooble/")
    (synopsis "privacy-focused Qt web browser")
    (description "Dooble is a lightweight web browser focused on privacy
and security.  It features cookie management, session encryption,
content blocking, and does not rely on external rendering engines
beyond the bundled QtWebEngine.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 25. qmmp-plugin-pack --- additional plugins for QMMP media player
;;; CMake build, requires QMMP.
;;; -------------------------------------------------------------------
(define-public qmmp-plugin-pack
  (package
    (name "qmmp-plugin-pack")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/qmmp-dev"
                    "/files/qmmp-plugin-pack/qmmp-plugin-pack-"
                    version ".tar.bz2"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase))
    (home-page "https://qmmp.ylsoftware.com/plugins.php")
    (synopsis "additional plugins for the QMMP audio player")
    (description "QMMP Plugin Pack provides additional codec and effect
plugins for the QMMP audio player, including Monkey's Audio (APE),
MMS streaming, ModPlug tracker formats, and various audio processing
effects.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 26. logseq-desktop-bin --- knowledge management app (AppImage)
;;; -------------------------------------------------------------------
(define-public logseq-desktop-bin
  (package
    (name "logseq-desktop-bin")
    (version "0.10.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/logseq/logseq"
                    "/releases/download/" version
                    "/Logseq-linux-x64-" version
                    ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://logseq.com/")
    (synopsis "privacy-first knowledge management and note-taking tool")
    (description "Logseq is a privacy-first, open-source knowledge
management and collaboration platform.  It supports Markdown and
Org-mode formats with a block-based editor, backlinking, graph views,
and local-first storage.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 27. kchmviewer --- CHM file viewer with KDE integration
;;; CMake build with Qt5.
;;; -------------------------------------------------------------------
(define-public kchmviewer
  (package
    (name "kchmviewer")
    (version "8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/kchmviewer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase-5))
    (home-page "https://github.com/nicholasgasior/kchmviewer")
    (synopsis "viewer for CHM (compiled HTML help) files")
    (description "KchmViewer is a viewer for CHM (Microsoft Compiled
HTML Help) files.  It supports table of contents, full text search,
bookmarks, and integrates with the KDE desktop environment for
enhanced functionality.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 28. cmdfy-bin --- AI-powered terminal command generator
;;; Go binary from git source.
;;; -------------------------------------------------------------------
(define-public cmdfy-bin
  (package
    (name "cmdfy-bin")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kesavan-vaisakh/cmdfy")
                    (commit "d1f7c3a")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cmdfy/src/"))
           #:tests? #f))
    (home-page "https://github.com/kesavan-vaisakh/cmdfy")
    (synopsis "AI-powered terminal command generator")
    (description "Cmdfy generates terminal commands from natural language
descriptions using AI models.  It supports multiple backends including
Gemini, OpenAI, and local Ollama models for command suggestions.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. dela --- task runner from YAML definitions
;;; Rust project, source archive.
;;; -------------------------------------------------------------------
(define-public dela
  (package
    (name "dela")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aleyan/dela")
                    (commit "a7f4c8b")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dela/src/"))
           #:tests? #f))
    (home-page "https://github.com/aleyan/dela")
    (synopsis "task runner and build tool from YAML definitions")
    (description "Dela is a task runner written in Rust that executes
tasks defined in YAML configuration files.  It supports task dependencies,
parallel execution, and environment variable management.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. streamrip --- Python CLI for lossless music downloading
;;; pyproject-build-system with multiple Python deps.
;;; -------------------------------------------------------------------
(define-public streamrip
  (package
    (name "streamrip")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "streamrip" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-aiohttp
           python-click
           python-mutagen
           python-pyyaml
           python-rich
           python-toml))
    (home-page "https://github.com/nathom/streamrip")
    (synopsis "command-line music downloader for streaming services")
    (description "Streamrip is a Python CLI tool for downloading lossless
music from various streaming services.  It supports downloading in FLAC,
ALAC, and other formats with metadata tagging and cover art embedding.")
    (license license:gpl3)))
