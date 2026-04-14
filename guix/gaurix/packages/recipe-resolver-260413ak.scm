;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413ak
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 19 recipes created (cargo, go, copy, gnu, cmake, meson, pyproject, ruby)
;;;   - 11 re-blocked with EXHAUSTED notes
;;;
;;; Recipes (19):
;;;   reef, lazyjournal, hardbore-bin, jan-bin, rats-search-bin,
;;;   battinfo, valent, exaile, mx-samba-config, ovn,
;;;   x2goserver, glab, python-docling-core, clipboard-sync,
;;;   conky-colors, rofi-gpaste, amiberry, ruby-neovim, bugwarrior
;;;
;;; Re-blocked (11):
;;;   csharpier (#925) — DOTNET_SDK_MISSING
;;;   aseprite-bin (#3157) — PROPRIETARY_PAID
;;;   opentabletdriver-git (#3233) — DOTNET_UNSUPPORTED
;;;   yay-sys-tray-git (#3259) — ARCH_SPECIFIC
;;;   syncovery-bin (#3263) — PROPRIETARY
;;;   rtt-rstudio-technician (#3264) — PROPRIETARY
;;;   kernelsu-dkms (#3358) — DKMS_INCOMPATIBLE
;;;   burpsuite-pro (#3384) — PROPRIETARY_COMMERCIAL
;;;   thedude (#3402) — PROPRIETARY_WINE
;;;   sentinelagent (#3411) — PROPRIETARY_CLOSED_SOURCE
;;;   booktab (#3416) — PROPRIETARY
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413ak)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system ruby)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages samba)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xorg)
  #:export (reef
            lazyjournal
            hardbore-bin
            jan-bin
            rats-search-bin
            battinfo
            valent
            exaile
            mx-samba-config
            ovn
            x2goserver
            glab
            python-docling-core
            clipboard-sync
            conky-colors
            rofi-gpaste
            amiberry
            ruby-neovim
            bugwarrior))

;;; ──────────────────────────────────────────────────────────────────
;;; Cargo builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── reef (#3699) ──
;;; Bash compatibility layer for the fish shell — paste bash, it works.
;;; Zero external crate dependencies.

(define-public reef
  (package
    (name "reef")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ZStud/reef")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list fish))
    (home-page "https://github.com/ZStud/reef")
    (synopsis "bash compatibility layer for the fish shell")
    (description "Reef translates Bash commands to Fish shell syntax on the
fly, enabling users to paste Bash one-liners and scripts directly into a Fish
session without manual conversion.")
    (license license:expat)))

;;; ── clipboard-sync (#4169) ──
;;; Synchronises the clipboard across multiple X11 and Wayland
;;; instances on the same machine.

(define-public clipboard-sync
  (package
    (name "clipboard-sync")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dnut/clipboard-sync")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libx11 libxcb wayland))
    (home-page "https://github.com/dnut/clipboard-sync")
    (synopsis "synchronise clipboard across X11 and Wayland sessions")
    (description "Clipboard-sync is a daemon that keeps the clipboard in sync
across multiple X11 and Wayland display server instances running on the same
machine.  It monitors clipboard changes and propagates them between sessions.")
    (license license:gpl3+)))

;;; ──────────────────────────────────────────────────────────────────
;;; Go builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── lazyjournal (#4246) ──
;;; TUI for journalctl with fuzzy find and regex support.

(define-public lazyjournal
  (package
    (name "lazyjournal")
    (version "0.8.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Lifailon/lazyjournal")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/Lifailon/lazyjournal"
           #:install-source? #f))
    (home-page "https://github.com/Lifailon/lazyjournal")
    (synopsis "TUI for journalctl, file logs, and container logs")
    (description "Lazyjournal provides a terminal user interface for browsing
journalctl, file system logs, and Docker/Podman container logs with fuzzy
find and regex filtering support.")
    (license license:expat)))

;;; ── glab (#3948) ──
;;; GitLab CLI — work with GitLab from the command line.

(define-public glab
  (package
    (name "glab")
    (version "1.52.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/gitlab-org/cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "gitlab.com/gitlab-org/cli/cmd/glab"
           #:unpack-path "gitlab.com/gitlab-org/cli"
           #:install-source? #f))
    (home-page "https://gitlab.com/gitlab-org/cli")
    (synopsis "command-line interface for GitLab")
    (description "GLab is an open source GitLab CLI tool that brings GitLab
to your terminal.  It supports merge requests, issues, CI/CD pipelines,
and repository management from the command line.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; Binary / copy-build-system packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── hardbore-bin (#3712) ──
;;; High-performance file manager (Tauri/Svelte).
;;; Packaged from official AppImage release.

(define-public hardbore-bin
  (package
    (name "hardbore-bin")
    (version "1.2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FrogSnot/HardBore/releases/download/"
                    "v" version "/HardBore_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (native-inputs (list (@ (gnu packages base) tar)
                         (@ (gnu packages compression) gzip)))
    (home-page "https://github.com/FrogSnot/HardBore")
    (synopsis "high-performance file manager for Linux")
    (description "HardBore is a fast, modern file manager built with Tauri
and SvelteKit.  It provides efficient file browsing, search, and management
with a clean user interface.")
    (license license:agpl3.0)))

;;; ── jan-bin (#4398) ──
;;; Open-source AI assistant that runs offline on your computer.

(define-public jan-bin
  (package
    (name "jan-bin")
    (version "0.7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/janhq/jan/releases/download/"
                    "v" version "/jan-linux-x86_64-" version ".deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) tar)
                         (@ (gnu packages compression) xz)))
    (home-page "https://jan.ai/")
    (synopsis "open-source offline AI assistant")
    (description "Jan is an open-source ChatGPT alternative that runs
100%% offline on your computer.  It supports multiple AI engines including
llama.cpp and TensorRT-LLM for local inference.")
    (license license:asl2.0)))

;;; ── rats-search-bin (#3439) ──
;;; P2P multi-platform BitTorrent search engine.

(define-public rats-search-bin
  (package
    (name "rats-search-bin")
    (version "2.0.24")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/librats/rats-search/releases/download/"
                    "v" version "/rats-search-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rats-search.AppImage" "bin/rats-search"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "rats-search.AppImage")
                   (chmod "rats-search.AppImage" #o755))))))
    (home-page "https://github.com/librats/rats-search")
    (synopsis "BitTorrent P2P search engine with integrated client")
    (description "Rats Search is a multi-platform BitTorrent search engine
with an integrated torrent client.  It provides desktop and web server
interfaces for discovering and downloading torrents.")
    (license license:expat)))

;;; ── rofi-gpaste (#3211) ──
;;; Rofi frontend for GPaste clipboard manager.

(define-public rofi-gpaste
  (package
    (name "rofi-gpaste")
    (version "0-git.5a2e8c3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yusufaktepe/rofi-gpaste")
                    (commit "5a2e8c3")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rofi-gpaste" "bin/rofi-gpaste"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/rofi-gpaste")
                          #o755))))))
    (home-page "https://github.com/yusufaktepe/rofi-gpaste")
    (synopsis "rofi frontend for GPaste clipboard manager")
    (description "Rofi-gpaste provides a Rofi-based interface for managing
the GPaste clipboard history.  It allows quick access to clipboard entries,
deletion, and selection through the Rofi launcher.")
    (license license:gpl2+)))

;;; ──────────────────────────────────────────────────────────────────
;;; CMake builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── mx-samba-config (#3429) ──
;;; Samba configuration GUI tool from MX Linux.

(define-public mx-samba-config
  (package
    (name "mx-samba-config")
    (version "26.03")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MX-Linux/mx-samba-config")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase samba))
    (native-inputs (list pkg-config qttools-5))
    (home-page "https://github.com/MX-Linux/mx-samba-config")
    (synopsis "graphical Samba share configuration tool")
    (description "MX Samba Config is a Qt-based GUI tool for configuring
Samba file shares on Linux.  It provides a simple interface for setting up
network shares, user permissions, and Samba server options.")
    (license license:gpl3+)))

;;; ── amiberry (#2403) ──
;;; Optimized Amiga emulator using CMake + SDL2.

(define-public amiberry
  (package
    (name "amiberry")
    (version "8.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BlitterStudio/amiberry")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release")))
    (inputs (list sdl2 sdl2-image sdl2-ttf
                  zlib libpng flac mpg123
                  libxml2 libmpeg2))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/BlitterStudio/amiberry")
    (synopsis "optimized Amiga emulator for ARM and x86")
    (description "Amiberry is an optimized Amiga emulator that can run games
and applications from the classic Amiga platform.  It supports a wide range
of Amiga hardware configurations and is optimized for both ARM and x86
architectures.")
    (license license:gpl3)))

;;; ──────────────────────────────────────────────────────────────────
;;; Meson builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── valent (#3698) ──
;;; Connect, control and sync devices (KDE Connect alternative).

(define-public valent
  (package
    (name "valent")
    (version "1.0.0.alpha.46")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/andyholmes/valent")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:glib-or-gtk? #t
           #:tests? #f))
    (inputs (list glib gtk json-glib libadwaita
                  libpeas gnutls evolution-data-server
                  pulseaudio))
    (native-inputs (list pkg-config
                         `(,glib "bin")
                         gettext-minimal
                         gobject-introspection
                         vala
                         desktop-file-utils))
    (home-page "https://valent.andyholmes.ca")
    (synopsis "device connectivity for GNOME (KDE Connect compatible)")
    (description "Valent is an implementation of the KDE Connect protocol
for GNOME.  It allows connecting, controlling, and syncing mobile devices
with your desktop, including clipboard sharing, notifications, file
transfers, and remote input.")
    (license license:gpl3+)))

;;; ──────────────────────────────────────────────────────────────────
;;; Autotools / GNU builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── battinfo (#3654) ──
;;; CLI tool and library to display battery details, written in Nim.

(define-public battinfo
  (package
    (name "battinfo")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/prashere/battinfo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "nim" "compile" "-d:release"
                           "--opt:speed" "-o:battinfo" "src/battinfo.nim")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (install-file "battinfo" bin)))))))
    (native-inputs (list (@ (gnu packages nim) nim)))
    (home-page "https://gitlab.com/prashere/battinfo")
    (synopsis "CLI tool to display battery details")
    (description "Battinfo is a command-line tool and Nim library that reads
and displays battery information from the Linux power supply subsystem,
including charge level, status, and health metrics.")
    (license license:gpl3+)))

;;; ── exaile (#4252) ──
;;; Full-featured Amarok-style GTK+ music player.

(define-public exaile
  (package
    (name "exaile")
    (version "4.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/exaile/exaile")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "PYTHON=" (search-input-file
                                             %build-inputs "bin/python3")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'bootstrap))))
    (inputs (list python
                  gtk+
                  gstreamer
                  gst-plugins-base
                  gst-plugins-good
                  python-pygobject
                  python-mutagen
                  python-dbus))
    (native-inputs (list gettext-minimal intltool))
    (home-page "https://exaile.org")
    (synopsis "full-featured GTK+ music player inspired by Amarok")
    (description "Exaile is a music player for GTK+ with a clean interface
and powerful features including smart playlists, album art display,
lyrics fetching, internet radio support, and a comprehensive plugin
system.  It uses GStreamer as its audio backend.")
    (license license:gpl2)))

;;; ── ovn (#4397) ──
;;; Open Virtual Network — virtual networking for Open vSwitch.

(define-public ovn
  (package
    (name "ovn")
    (version "26.03.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ovn-org/ovn")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   (invoke "./boot.sh"))))))
    (inputs (list openvswitch openssl))
    (native-inputs (list autoconf automake libtool pkg-config python))
    (home-page "https://github.com/ovn-org/ovn")
    (synopsis "open virtual network for software-defined networking")
    (description "OVN (Open Virtual Network) provides virtual networking
for Open vSwitch (OVS).  It adds native support for virtual L2 and L3
overlays, security groups, and DHCP, enabling scalable network
virtualization for cloud and container environments.")
    (license license:asl2.0)))

;;; ── x2goserver (#3942) ──
;;; Remote desktop server based on NX technology.

(define-public x2goserver
  (package
    (name "x2goserver")
    (version "4.1.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://code.x2go.org/releases/source/x2goserver/"
                    "x2goserver-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   "DESTDIR=")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list perl openssh))
    (native-inputs (list gettext-minimal))
    (home-page "https://www.x2go.org/")
    (synopsis "remote desktop server based on NX technology")
    (description "X2Go Server provides remote graphical desktop access
using the NX protocol.  It supports session management, sound forwarding,
file sharing, and printer sharing over SSH-encrypted connections.")
    (license license:gpl2)))

;;; ── conky-colors (#3249) ──
;;; Configuration tool for Conky system monitor.

(define-public conky-colors
  (package
    (name "conky-colors")
    (version "0-git.8a3e42d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/helmuthdu/conky_colors")
                    (commit "8a3e42d")))
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
    (home-page "https://github.com/helmuthdu/conky_colors")
    (synopsis "configuration tool for Conky system monitor")
    (description "Conky Colors provides an easy way to configure Conky,
the lightweight system monitor for X.  It generates themed Conky
configurations with customizable colors, layouts, and system information
displays.")
    (license license:gpl3+)))

;;; ──────────────────────────────────────────────────────────────────
;;; Pyproject builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── python-docling-core (#3412) ──
;;; Data types for the Docling document processing framework.

(define-public python-docling-core
  (package
    (name "python-docling-core")
    (version "2.73.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "docling_core" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-pydantic
                             python-jsonschema
                             python-tabulate
                             python-pyyaml
                             python-typing-extensions))
    (home-page "https://github.com/docling-project/docling-core")
    (synopsis "data type definitions for the Docling framework")
    (description "Docling-core provides Python data type definitions and
validation logic for the Docling document processing framework.  It defines
the core data model for representing parsed documents with rich structural
and semantic annotations.")
    (license license:expat)))

;;; ── bugwarrior (#3214) ──
;;; Pull issues from external trackers into Taskwarrior.

(define-public bugwarrior
  (package
    (name "bugwarrior")
    (version "1.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ralphbean/bugwarrior")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-requests
                             python-six
                             python-jinja2
                             python-pydantic
                             python-click
                             python-typing-extensions))
    (home-page "https://bugwarrior.readthedocs.io")
    (synopsis "pull issues from external trackers into Taskwarrior")
    (description "Bugwarrior collects issues and tasks from GitHub, GitLab,
Bitbucket, Bugzilla, Trac, JIRA, and other issue trackers, and imports
them into Taskwarrior for unified task management from the command line.")
    (license license:gpl3+)))

;;; ──────────────────────────────────────────────────────────────────
;;; Ruby builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── ruby-neovim (#4228) ──
;;; Ruby client bindings for Neovim's RPC API.

(define-public ruby-neovim
  (package
    (name "ruby-neovim")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "neovim" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list ruby-msgpack ruby-multi-json))
    (home-page "https://github.com/neovim/neovim-ruby")
    (synopsis "Ruby bindings for Neovim's msgpack-RPC API")
    (description "The neovim Ruby gem provides client bindings for the
Neovim editor's msgpack-RPC API.  It enables Ruby scripts and plugins
to interact with Neovim programmatically, controlling the editor and
responding to events.")
    (license license:expat)))
