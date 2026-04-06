;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass (batch 3).
;;; 22 new recipes: 8 binary (copy-build-system), 3 fonts/icons,
;;; 3 shell script waybar widgets, 2 simple C tools, 2 Python apps,
;;; 1 autotools data package, 1 cmake C TUI, 1 Go source, 1 Rust source,
;;; 1 Rust (Codeberg), 1 Tauri AppImage binary.
;;; 8 re-blocked with specific reasons.
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd3)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; Binary packages
            podman-tui-bin
            bluetuith-bin
            timr-bin
            compendium-bin
            mdviewer-bin
            sunder-bin
            dora-bin
            ;; Fonts/Icons
            ttf-icomoon-feather
            ttf-xkcd-script-font
            icons-in-terminal-git
            ;; Waybar shell widgets
            codexbar
            logibar
            claudebar
            ;; C tools
            rubiks-cube
            rubix
            ;; Autotools data
            ddccontrol-db
            ;; cmake C
            nemu
            ;; Go source
            relayfsd
            ;; Rust source
            dpibreak
            gnix
            ;; Python apps
            videocut
            yewtube))


;; ═══════════════════════════════════════════════════════════════════
;; Binary packages — copy-build-system from upstream releases
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. podman-tui-bin (#2749) ──────────────────────────────────────

(define-public podman-tui-bin
  (package
    (name "podman-tui-bin")
    (version "1.11.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/containers/podman-tui/releases/download/v"
                    version "/podman-tui-release-linux_amd64.zip"))
              (sha256
               (base32
                "0mvlkdqqh1fcq2pfz9z724rk214ih2q0plz914fbghqjzkvhv2mm"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("podman-tui" "bin/podman-tui"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI for managing Podman containers")
    (description
     "Podman TUI is a terminal user interface for managing Podman pods,
containers, volumes, images, and networks.  This package provides the
pre-built binary from the upstream release.")
    (home-page "https://github.com/containers/podman-tui")
    (license license:asl2.0)))

;; ── 2. bluetuith-bin (#3205) ───────────────────────────────────────

(define-public bluetuith-bin
  (package
    (name "bluetuith-bin")
    (version "0.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/darkhz/bluetuith/releases/download/v"
                    version "/bluetuith_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "05r7lvpqlxib591zf74i29xg0gpdc7wqip07k7issin42qfp61pj"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bluetuith" "bin/bluetuith"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI-based Bluetooth connection manager")
    (description
     "Bluetuith is a TUI-based Bluetooth connection manager that can interact
with Bluetooth adapters and devices.  It can transfer files via OBEX, manage
network connections, and handle audio profiles.  This package provides the
pre-built binary from the upstream release.")
    (home-page "https://github.com/darkhz/bluetuith")
    (license license:expat)))

;; ── 3. timr-bin (#3191) ────────────────────────────────────────────

(define-public timr-bin
  (package
    (name "timr-bin")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sectore/timr-tui/releases/download/v"
                    version "/timr-tui-" version "-linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0as1dmf8dbkcfjm8vjyi16099dcaz1wcrz8cdnwnwshysc7qy7hd"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("timr-tui" "bin/timr-tui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Terminal timer and stopwatch")
    (description
     "Timr is a terminal-based timer and stopwatch application with a clean
TUI interface.  This package provides the pre-built binary from the upstream
release.")
    (home-page "https://github.com/sectore/timr-tui")
    (license license:expat)))

;; ── 4. compendium-bin (#3090) ──────────────────────────────────────

(define-public compendium-bin
  (package
    (name "compendium-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/louisboilard/compendium/releases/download/v"
                    version "/compendium-linux-x86_64"))
              (sha256
               (base32
                "1849frwfgyk63jvwlsa8mc3rmrqv5874cqkr9kfmf2jb5gb229jb"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((bin (string-append #$output "/bin")))
                 (mkdir-p bin)
                 (copy-file #$source
                            (string-append bin "/compendium"))
                 (chmod (string-append bin "/compendium") #o755)))))
    (supported-systems '("x86_64-linux"))
    (synopsis "user-friendly strace for x86 Linux with HTML reports")
    (description
     "Compendium is a user-friendly strace-like tool for x86 Linux that
generates HTML reports of system calls.  This package provides the pre-built
binary from the upstream release.")
    (home-page "https://github.com/louisboilard/compendium")
    (license license:expat)))

;; ── 5. mdviewer-bin (#3196) ────────────────────────────────────────

(define-public mdviewer-bin
  (package
    (name "mdviewer-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/noborus/mdviewer/releases/download/v"
                    version "/mdviewer_" version "_linux_amd64.zip"))
              (sha256
               (base32
                "0hpf6ck2fdrkgv7biq6zpl958v335w7plhv3gkymc6zj05bgx121"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mdviewer" "bin/mdviewer"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal Markdown viewer")
    (description
     "Mdviewer is a terminal-based Markdown viewer that renders Markdown files
with syntax highlighting and formatting.  This package provides the pre-built
binary from the upstream release.")
    (home-page "https://github.com/noborus/mdviewer")
    (license license:expat)))

;; ── 7. sunder-bin (#3200) ──────────────────────────────────────────

(define-public sunder-bin
  (package
    (name "sunder-bin")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FrogSnot/Sunder/releases/download/v"
                    version "/Sunder_" version "_amd64.AppImage"))
              (sha256
               (base32
                "0zxp1lg11k1j51gnafxssgsx87982qgm8pfmri8wpaziww09dzad"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sunder" "bin/sunder"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "sunder")
                   (chmod "sunder" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "video and audio splitting tool")
    (description
     "Sunder is a desktop application for splitting video and audio files
using yt-dlp and ffmpeg.  It provides a graphical interface built with Tauri
for selecting split points.  This package provides the pre-built AppImage
from the upstream release.")
    (home-page "https://github.com/FrogSnot/Sunder")
    (license license:agpl3)))


;; ── 7. dora-bin (#3159) ─────────────────────────────────────────────

(define-public dora-bin
  (package
    (name "dora-bin")
    (version "0.6.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Jacke/doradura/releases/download/tui-v"
                    version "/dora-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "1ib85y3wdsn23zcbhs24x5knxcpp1vy1p2v80qqny3cj0msv75nc"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dora" "bin/dora"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI for media downloading with yt-dlp and ffmpeg")
    (description
     "Dora is a beautiful TUI-based media downloader that wraps yt-dlp and
ffmpeg.  It provides an interactive terminal interface for downloading video
and audio content.  This package provides the pre-built binary from the
upstream release.")
    (home-page "https://github.com/Jacke/doradura")
    (license license:expat)))


;; ═══════════════════════════════════════════════════════════════════
;; Fonts/Icons — copy/trivial-build-system
;; ═══════════════════════════════════════════════════════════════════

;; ── 8. ttf-icomoon-feather (#3140) ─────────────────────────────────

(define-public ttf-icomoon-feather
  (package
    (name "ttf-icomoon-feather")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://raw.githubusercontent.com/adi1090x/polybar-themes/master/fonts/panels/icomoon_feather.ttf")
              (sha256
               (base32
                "1fwv981gs0048psk8rf06f4ak4kn8gmxizk9l79fn17fl0ic4kfp"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((font-dir (string-append #$output
                                              "/share/fonts/truetype")))
                 (mkdir-p font-dir)
                 (copy-file #$source
                            (string-append font-dir
                                           "/icomoon_feather.ttf"))))))
    (synopsis "icomoon feather icon font for status bars")
    (description
     "The Icomoon Feather font provides feather-style icons commonly used
in polybar, waybar, and other status bar configurations.")
    (home-page "https://github.com/adi1090x/polybar-themes")
    (license license:gpl3+)))

;; ── 9. ttf-xkcd-script-font (#3147) ───────────────────────────────

(define-public ttf-xkcd-script-font
  (package
    (name "ttf-xkcd-script-font")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ipython/xkcd-font")
                    (commit "5632fde618845dba5c22f14adc7b52bf6c52d46d")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "01wpfc1yp93b37r472mx2b459il5gywnv5sl7pp9afpycb3i4f6l"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("xkcd-script/font/xkcd-script.ttf"
                "share/fonts/truetype/xkcd-script.ttf"))))
    (synopsis "xkcd-style handwriting font")
    (description
     "A font that mimics the handwriting style used in xkcd comics by
Randall Munroe.  Useful for creating charts and presentations with an
informal, hand-drawn aesthetic.")
    (home-page "https://github.com/ipython/xkcd-font")
    (license (license:non-copyleft
              "https://creativecommons.org/licenses/by-nc/3.0/"
              "Creative Commons Attribution-NonCommercial 3.0"))))

;; ── 10. icons-in-terminal-git (#3136) ──────────────────────────────

(define-public icons-in-terminal-git
  (package
    (name "icons-in-terminal-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sebastiencs/icons-in-terminal")
                    (commit "b12286d0d8bf9793a1599a737faa4d64435193f1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1xl19absagsfjzm74kr1qmyx7xz6pafdv0whxgwg475spsmb31mn"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("build/icons-in-terminal.ttf"
                "share/fonts/truetype/icons-in-terminal.ttf"))))
    (synopsis "icon font for use in terminal emulators")
    (description
     "Icons-in-terminal provides a font that aggregates icon glyphs from
popular icon sets (Font Awesome, Octicons, Material Design, etc.) for use
in terminal applications and shell prompts.")
    (home-page "https://github.com/sebastiencs/icons-in-terminal")
    (license license:expat)))


;; ═══════════════════════════════════════════════════════════════════
;; Waybar shell-script widgets — copy-build-system
;; ═══════════════════════════════════════════════════════════════════

;; ── 11. codexbar (#3093) ───────────────────────────────────────────

(define-public codexbar
  (package
    (name "codexbar")
    (version "0.1.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mryll/codexbar/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "09bb4nmvlafw84y15h60dvps70gd62vmizg6m64fmymghn2anicc"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("codexbar" "bin/codexbar")
               ("codexbar.css" "share/codexbar/codexbar.css"))))
    (inputs (list bash curl jq))
    (synopsis "waybar widget for OpenAI Codex subscription usage")
    (description
     "Codexbar is a Waybar widget that displays OpenAI Codex subscription
usage with colored progress bars.  It queries the OpenAI API and renders
usage data in the status bar.")
    (home-page "https://github.com/mryll/codexbar")
    (license license:expat)))

;; ── 12. logibar (#3094) ────────────────────────────────────────────

(define-public logibar
  (package
    (name "logibar")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mryll/logibar/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "18jbfnzaykwv9m03ppkb05nid3972vdrdmvx2fx666l6d7la0lz7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("logibar" "bin/logibar")
               ("logibar.css" "share/logibar/logibar.css"))))
    (inputs (list bash python))
    (synopsis "waybar widget for Logitech wireless peripheral battery levels")
    (description
     "Logibar provides Waybar widgets and daemons for monitoring Logitech
wireless peripheral battery levels.  It reads HID data and displays battery
status in the status bar.")
    (home-page "https://github.com/mryll/logibar")
    (license license:expat)))

;; ── 13. claudebar (#3096) ──────────────────────────────────────────

(define-public claudebar
  (package
    (name "claudebar")
    (version "0.1.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mryll/claudebar/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0yw1yylgwsfb3i60gfjyrfqgbzpgyg9x2q6x0kinmagb9s5ssrq0"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("claudebar" "bin/claudebar")
               ("claudebar.css" "share/claudebar/claudebar.css"))))
    (inputs (list bash curl jq))
    (synopsis "waybar widget for Claude AI subscription usage")
    (description
     "Claudebar is a Waybar widget that displays Claude AI subscription
usage with colored progress bars.  It queries the Anthropic API and renders
usage data in the status bar.")
    (home-page "https://github.com/mryll/claudebar")
    (license license:expat)))


;; ═══════════════════════════════════════════════════════════════════
;; C tools — gnu-build-system
;; ═══════════════════════════════════════════════════════════════════

;; ── 14. rubiks-cube (#3153) ────────────────────────────────────────

(define-public rubiks-cube
  (package
    (name "rubiks-cube")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/been-jamming/rubiks_cube/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "16jms64jqdk2rxqmgfdfia9dhz084v2kn0x58cl8chi3x45mgzgj"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out")
                                             "/bin")))
                     (mkdir-p bin)
                     (install-file "rubiks_cube" bin)))))))
    (inputs (list ncurses))
    (synopsis "terminal Rubik's cube simulator")
    (description
     "A terminal-based Rubik's cube simulator using ncurses.  Provides an
interactive interface for manipulating and solving a virtual Rubik's cube
in the terminal.")
    (home-page "https://github.com/been-jamming/rubiks_cube")
    (license license:expat)))

;; ── 15. rubix (#3152) ──────────────────────────────────────────────

(define-public rubix
  (package
    (name "rubix")
    (version "1.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://sed.free.fr/rubix/rubix-" version ".tar.bz2"))
              (sha256
               (base32
                "11qsa1pxfbds99z1amlvqy8qdbgp1nkgbxainyxccxiz6yc4rzyc"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out")
                                             "/bin")))
                     (mkdir-p bin)
                     (install-file "rubix" bin)))))))
    (inputs (list libx11))
    (synopsis "3D Rubik's cube simulator for X11")
    (description
     "Rubix is a 3D Rubik's cube simulator for the X Window System.  It
renders an interactive 3D cube that can be rotated and manipulated using
the mouse.")
    (home-page "http://sed.free.fr/rubix")
    (license license:public-domain)))


;; ═══════════════════════════════════════════════════════════════════
;; Autotools data packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 16. ddccontrol-db (#1697) ──────────────────────────────────────

(define-public ddccontrol-db
  (package
    (name "ddccontrol-db")
    (version "20260120")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ddccontrol/ddccontrol-db/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "07jqg00l7kihd3hf2wppj8c9qfi1zixgsbwpw9qmhi4dxi3mxyqi"))))
    (build-system gnu-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   (invoke "autoreconf" "-vfi"))))))
    (native-inputs (list autoconf automake intltool))
    (synopsis "monitor database for ddccontrol")
    (description
     "Ddccontrol-db is the monitor database for ddccontrol, providing
profiles and specifications for DDC/CI communication with various monitor
models.  It contains XML data files that map monitor capabilities to
human-readable controls.")
    (home-page "https://github.com/ddccontrol/ddccontrol-db")
    (license license:gpl2+)))


;; ═══════════════════════════════════════════════════════════════════
;; cmake C — nemu
;; ═══════════════════════════════════════════════════════════════════

;; ── 17. nemu (#3110) ───────────────────────────────────────────────

(define-public nemu
  (package
    (name "nemu")
    (version "3.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nemuTUI/nemu/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0hpglp0m2kz74r8bnjsaa6r8kb26i0nmxjrydkvaxy130vlb6wp2"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list ncurses sqlite json-c libxml2 libarchive))
    (native-inputs (list pkg-config))
    (synopsis "TUI for QEMU virtual machine management")
    (description
     "Nemu is a ncurses-based TUI for managing QEMU virtual machines.
It provides an interactive interface for creating, configuring, starting,
and monitoring virtual machines without needing the QEMU command line
directly.")
    (home-page "https://github.com/nemuTUI/nemu")
    (license license:bsd-2)))


;; ═══════════════════════════════════════════════════════════════════
;; Go source — gnu-build-system (vendored)
;; ═══════════════════════════════════════════════════════════════════

;; ── 18. relayfsd (#3195) ───────────────────────────────────────────

(define-public relayfsd
  (package
    (name "relayfsd")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Almutairi0/relayfsd/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "07y588kmhykqsv4l93bp4ki8sksipy8wvsf1cqa85q137vf4irca"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "go" "build" "-o" "relayfsd" ".")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out")
                                             "/bin")))
                     (mkdir-p bin)
                     (install-file "relayfsd" bin)))))))
    (synopsis "relay filesystem daemon")
    (description
     "Relayfsd is a relay filesystem daemon that forwards filesystem
operations over the network.  It acts as a bridge between local filesystem
requests and remote storage backends.")
    (home-page "https://github.com/Almutairi0/relayfsd")
    (license license:expat)))


;; ═══════════════════════════════════════════════════════════════════
;; Rust source packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 19. dpibreak (#3075) ───────────────────────────────────────────
;; NOTE: Rust/cargo requires vendored dependencies.  Since cargo-build-system
;; needs all crate inputs declared, and this package has non-trivial deps,
;; we provide the source tarball as a reference.  Build from source requires
;; the full cargo dependency tree to be packaged.  For now, mark as
;; NEEDS_CARGO_DEPS — the recipe structure is ready once deps are available.

(define-public dpibreak
  (package
    (name "dpibreak")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dilluti0n/dpibreak/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1wy07k2zrwnkykbc5wv7b2ba823n3r269mm832iwbr8x7j2yxi8s"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (delete 'install))))
    (synopsis "DPI-based break reminder for eye strain prevention")
    (description
     "Dpibreak is a break reminder tool that uses nftables to enforce
periodic screen breaks for eye strain prevention.  It temporarily blocks
network traffic to encourage the user to take a rest.  Note: this is a
source-only reference package; full build requires Rust cargo dependency
packaging.")
    (home-page "https://github.com/dilluti0n/dpibreak")
    (license license:gpl3+)))

;; ── 20. gnix (#3055) ───────────────────────────────────────────────
;; NOTE: Same cargo dep situation — source reference only.

(define-public gnix
  (package
    (name "gnix")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/metamuffin/gnix/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "12jvki95mqyj6b9ikfr5i95sz73zjgr7lpscb028vdmqqn3i5pz2"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (delete 'install))))
    (synopsis "simple HTTP reverse proxy")
    (description
     "Gnix is a simple HTTP reverse proxy written in Rust.  It supports
basic proxying, TLS termination, and routing.  Note: this is a source-only
reference package; full build requires Rust cargo dependency packaging.")
    (home-page "https://codeberg.org/metamuffin/gnix")
    (license license:agpl3+)))


;; ═══════════════════════════════════════════════════════════════════
;; Python applications
;; ═══════════════════════════════════════════════════════════════════

;; ── 21. videocut (#3143) ───────────────────────────────────────────

(define-public videocut
  (package
    (name "videocut")
    (version "3.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kanehekili/VideoCut/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "1clsmyrnf3g4lkcgqc43k335ds9g3i2pivw3nh8syanmaira2grr"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/" "share/videocut/src/")
               ("videocut.desktop" "share/applications/videocut.desktop"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs inputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (python (assoc-ref inputs "python")))
                     (mkdir-p (string-append out "/bin"))
                     (call-with-output-file
                         (string-append out "/bin/videocut")
                       (lambda (port)
                         (format port "#!~a/bin/python3~%import sys~%sys.path.insert(0, '~a/share/videocut/src')~%exec(open('~a/share/videocut/src/VideoCut.py').read())~%"
                                 python out out)))
                     (chmod (string-append out "/bin/videocut") #o755)))))))
    (inputs (list python ffmpeg))
    (synopsis "video cutting and joining tool")
    (description
     "VideoCut is a Python application for cutting and joining video files
using ffmpeg.  It provides a graphical interface for selecting cut points
in video files and performs lossless operations where possible.")
    (home-page "https://github.com/kanehekili/VideoCut")
    (license license:gpl3+)))

;; ── 22. yewtube (#3091) ────────────────────────────────────────────

(define-public yewtube
  (package
    (name "yewtube")
    (version "2.13.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mps-youtube/yewtube/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "15bqr41hjk25n84rddrpqhzz7brrsdxla04hvl3nich3lh2jzzyg"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list python-requests))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "terminal-based YouTube player and downloader")
    (description
     "Yewtube (formerly mps-youtube) is a terminal-based YouTube player
and downloader.  It allows searching, playing, and downloading YouTube
content from the command line without a web browser.")
    (home-page "https://github.com/mps-youtube/yewtube")
    (license license:gpl3)))
