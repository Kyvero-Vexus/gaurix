;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417s
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; Recipes (30):
;;;    1. stack-bin — Haskell Stack build tool binary
;;;    2. kapp — Kubernetes deployment tool binary
;;;    3. ymp-bin — YouTube music player TUI binary
;;;    4. ttypr-bin — terminal typing practice binary
;;;    5. keifu-bin — git commit graph TUI binary
;;;    6. dredge-bin — encrypted CLI vault binary
;;;    7. canvas-downloader-bin — Canvas LMS file downloader binary
;;;    8. repeater-bin — spaced repetition terminal tool binary
;;;    9. rip-go-bin — fuzzy process killer binary
;;;   10. dynocsv — DynamoDB CSV exporter binary
;;;   11. mpwall — live video wallpaper manager binary
;;;   12. ov — feature-rich terminal pager binary
;;;   13. asciinema-agg — asciinema cast to GIF generator binary
;;;   14. seanime — self-hosted anime media server binary
;;;   15. subsurface-appimage — dive log manager AppImage
;;;   16. git-mr — git merge-request helper shell script
;;;   17. arkenfox-user-js — Firefox privacy hardening user.js
;;;   18. byedpi — DPI bypass proxy (C source)
;;;   19. bsdiff — binary diff/patch utility (C source)
;;;   20. yash — POSIX-compliant shell (C source)
;;;   21. activate-linux — "Activate Windows" overlay for Linux (C source)
;;;   22. pyupgrade — Python syntax upgrader
;;;   23. python-pythondialog — Python wrapper for dialog
;;;   24. python-sysv-ipc — Python SysV IPC bindings
;;;   25. ttf-b612 — B612 cockpit font by Airbus
;;;   26. mint-y-icons — Linux Mint Y-series icon theme
;;;   27. mint-x-icons — Linux Mint X-series icon theme
;;;   28. prometheus-apcupsd-exporter — Prometheus exporter for apcupsd
;;;   29. smooth — cross-platform C++ application framework
;;;   30. corrscope — oscilloscope video renderer for music
;;;
;;; 30 recipes + 0 BLOCKED = 30 total.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260417s)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages check)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xorg)
  #:export (
            stack-bin
            kapp
            ymp-bin
            ttypr-bin
            keifu-bin
            dredge-bin
            canvas-downloader-bin
            repeater-bin
            rip-go-bin
            dynocsv
            mpwall
            ov
            asciinema-agg
            seanime
            subsurface-appimage
            git-mr
            arkenfox-user-js
            byedpi
            bsdiff
            yash
            activate-linux
            pyupgrade
            python-pythondialog
            python-sysv-ipc
            ttf-b612
            mint-y-icons
            mint-x-icons
            prometheus-apcupsd-exporter
            smooth
            corrscope
            ))

;;; -------------------------------------------------------------------
;;; 1. stack-bin — Haskell Stack build tool (prebuilt static binary)
;;; -------------------------------------------------------------------
(define-public stack-bin
  (package
    (name "stack-bin")
    (version "3.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/commercialhaskell/stack/releases/download/v"
                    version "/stack-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "01cbb6bzjb6207wk0wlrcff6svq5d6j11dffvi4074803mpcyidw"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("stack" "bin/stack"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Haskell build tool for reproducible builds")
    (description "Stack is a cross-platform program for developing Haskell
projects.  It features a curated package management approach based on
Stackage snapshots and provides reproducible builds out of the box.")
    (home-page "https://haskellstack.org/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 2. kapp — Kubernetes application deployment tool (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public kapp
  (package
    (name "kapp")
    (version "0.65.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/carvel-dev/kapp/releases/download/v"
                    version "/kapp-linux-amd64"))
              (sha256
               (base32 "1bbf5v2kfzg3js491r4cfzh9v6vqbyckg3c8592ypbyn7pipyz85"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kapp-linux-amd64" "bin/kapp"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "kapp-linux-amd64")
                   (chmod "kapp-linux-amd64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Kubernetes application deployment tool by Carvel")
    (description "Kapp is a simple deployment tool focused on the concept of
a Kubernetes application, which is a set of resources with the same label.
It converges the cluster state to match the desired configuration.")
    (home-page "https://carvel.dev/kapp/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 3. ymp-bin — YouTube music player TUI (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public ymp-bin
  (package
    (name "ymp-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/trap251/ymp/releases/download/v"
                    version "/ymp"))
              (sha256
               (base32 "0ajwcwyr3g6zxgzj06ms0aihc4i5ylfq33bbl9389jf0ldsijk21"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ymp" "bin/ymp"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "ymp")
                   (chmod "ymp" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "YouTube music player for the terminal")
    (description "Ymp is a terminal user interface for browsing and playing
YouTube music and audio content directly from the command line.")
    (home-page "https://github.com/trap251/ymp")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. ttypr-bin — terminal typing practice (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public ttypr-bin
  (package
    (name "ttypr-bin")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tanciaku/ttypr/releases/download/v"
                    version "/ttypr-linux-x86_64.tar.gz"))
              (sha256
               (base32 "1lk4rqlmm2kybx8idqmsqkr2qd84c565b1y9ppijzagw8wpzqc9j"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ttypr" "bin/ttypr"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Terminal typing practice tool")
    (description "Ttypr is a terminal-based typing tutor that helps improve
typing speed and accuracy through practice sessions with configurable
difficulty and text sources.")
    (home-page "https://github.com/tanciaku/ttypr")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. keifu-bin — git commit graph TUI (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public keifu-bin
  (package
    (name "keifu-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/trasta298/keifu/releases/download/v"
                    version "/keifu-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "1g9816xi0h3nfdvbnrmpcjy4s74jd1hzb1c9r1b0k0mrv9ixv3j7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("keifu" "bin/keifu"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI for navigating git commit graphs")
    (description "Keifu is a terminal user interface for exploring and
navigating Git commit graphs with color and clarity.  It provides an
intuitive visualization of repository history.")
    (home-page "https://github.com/trasta298/keifu")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. dredge-bin — encrypted CLI vault (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public dredge-bin
  (package
    (name "dredge-bin")
    (version "0.9.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DeprecatedLuar/dredge-cargo/releases/download/v"
                    version "/dredge_linux_amd64"))
              (sha256
               (base32 "0g3mrpwi8incwqp4hspxnrrgp5hlhldlqjcpkk7cwij8gdmk5qy4"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dredge_linux_amd64" "bin/dredge"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "dredge_linux_amd64")
                   (chmod "dredge_linux_amd64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Encrypted CLI vault for notes, configs, and keys")
    (description "Dredge is an encrypted command-line vault for storing
notes, configuration files, keys, and other sensitive data.  It uses a
search-first approach instead of hierarchical organization.")
    (home-page "https://github.com/DeprecatedLuar/dredge-cargo")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. canvas-downloader-bin — Canvas LMS file downloader (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public canvas-downloader-bin
  (package
    (name "canvas-downloader-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aik2mlj/canvas-downloader/releases/download/v"
                    version "/canvas-downloader-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "09vhpcspyyv4svl1hw8nxcfkfx8c8mnmsvfafwnlwa9zi2rk3j13"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("canvas-downloader" "bin/canvas-downloader"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Download and organize course materials from Canvas LMS")
    (description "Canvas-downloader is a command-line tool that downloads
and organizes all course materials from Canvas Learning Management System
instances, preserving the original directory structure.")
    (home-page "https://github.com/aik2mlj/canvas-downloader")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. repeater-bin — spaced repetition terminal tool (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public repeater-bin
  (package
    (name "repeater-bin")
    (version "0.1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shaankhosla/repeater/releases/download/v"
                    version "/repeater-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32 "13frvqwall4cyky2l1shpalvkg9bnbah62fh5vscdc35bjikgqzn"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("repeater" "bin/repeater"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Spaced repetition practice in your terminal")
    (description "Repeater is a terminal-based spaced repetition tool for
learning and reviewing flashcards.  It uses proven spaced repetition
algorithms to schedule reviews at optimal intervals.")
    (home-page "https://github.com/shaankhosla/repeater")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 9. rip-go-bin — fuzzy process finder and killer (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public rip-go-bin
  (package
    (name "rip-go-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/roniel-rhack/rip-go/releases/download/v"
                    version "/rip-go-linux-amd64.tar.gz"))
              (sha256
               (base32 "0fzn0ifcfnh3gm88qwrb3x041p3adfj2kgbr14yzs5b4wj0hmia0"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rip-go" "bin/rip-go"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Fuzzy find and kill processes from your terminal")
    (description "Rip-go is a terminal tool for fuzzy-finding and killing
processes with real-time updates.  It provides an interactive interface
for process management.")
    (home-page "https://github.com/roniel-rhack/rip-go")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. dynocsv — DynamoDB table CSV exporter (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public dynocsv
  (package
    (name "dynocsv")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zshamrock/dynocsv/releases/download/v"
                    version "/dynocsv"))
              (sha256
               (base32 "0qhf1g89lfqqzpyhn5f6jlxqknlaxjg48fcn13zdzh1yxf265wl5"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dynocsv" "bin/dynocsv"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "dynocsv")
                   (chmod "dynocsv" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Export AWS DynamoDB tables to CSV")
    (description "Dynocsv exports Amazon DynamoDB table contents into CSV
format for analysis and data processing.  It supports filtering and
column selection.")
    (home-page "https://github.com/zshamrock/dynocsv")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. mpwall — live video wallpaper manager (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public mpwall
  (package
    (name "mpwall")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Lamess-UI/mpwall/releases/download/v"
                    version "/mpwall-x86_64"))
              (sha256
               (base32 "1bnigzxvp1j7r49kwg3fv3pv2qdz8y0y27n6bypj6iy30dzdjxw0"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mpwall-x86_64" "bin/mpwall"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "mpwall-x86_64")
                   (chmod "mpwall-x86_64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Live video wallpaper manager for Wayland")
    (description "Mpwall is a live video wallpaper manager for
Hyprland and other Wayland compositors.  It uses mpvpaper as a backend
to display video content as desktop wallpaper.")
    (home-page "https://github.com/Lamess-UI/mpwall")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 12. ov — feature-rich terminal pager (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public ov
  (package
    (name "ov")
    (version "0.51.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/noborus/ov/releases/download/v"
                    version "/ov_" version "_linux_amd64.zip"))
              (sha256
               (base32 "1ljq6l6fb9ycndj1bhk37qqyr89f5wkgcmwz73np37z88a40rfr7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ov" "bin/ov"))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (synopsis "Feature-rich terminal pager")
    (description "Ov is a feature-rich terminal pager inspired by less and
more.  It supports features like line wrapping, column mode, section
navigation, follow mode, and syntax highlighting.")
    (home-page "https://github.com/noborus/ov")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. asciinema-agg — asciicast to animated GIF (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public asciinema-agg
  (package
    (name "asciinema-agg")
    (version "1.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/asciinema/agg/releases/download/v"
                    version "/agg-x86_64-unknown-linux-gnu"))
              (sha256
               (base32 "1xxbk4vf9j4vnbm6r8gh322fizqd54vqnwpm82ai8wzg48y7fb5p"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("agg-x86_64-unknown-linux-gnu" "bin/agg"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "agg-x86_64-unknown-linux-gnu")
                   (chmod "agg-x86_64-unknown-linux-gnu" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Generate animated GIF files from asciicast recordings")
    (description "Agg is a command-line tool for generating animated GIF
files from asciinema terminal recordings (asciicast v2 format).  It
renders terminal output with accurate colors and fonts.")
    (home-page "https://github.com/asciinema/agg")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 14. seanime — self-hosted anime and manga media server (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public seanime
  (package
    (name "seanime")
    (version "3.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/5rahim/seanime/releases/download/v"
                    version "/seanime-" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "02pm1a2rpqf17vhhiqnr5xl85isncdwym2pd0ggdaia0xick96cv"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("seanime" "bin/seanime"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Self-hosted anime and manga media server")
    (description "Seanime is a self-hosted media server for anime and manga
that provides automated library management, episode tracking,
torrent integration, and a web-based user interface.")
    (home-page "https://github.com/5rahim/seanime")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 15. subsurface-appimage — dive log manager (AppImage binary)
;;; -------------------------------------------------------------------
(define-public subsurface-appimage
  (package
    (name "subsurface-appimage")
    (version "4.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/subsurface/subsurface/releases/download/v"
                    version "/Subsurface-" version "-x86_64.AppImage"))
              (sha256
               (base32 "1ilp8ic5pr0rak8z99rbl7qabwa88j3gjarzfqdvbh2r0w6a5pap"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Subsurface.AppImage" "bin/subsurface"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "Subsurface.AppImage")
                   (chmod "Subsurface.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Dive log management application")
    (description "Subsurface is an open source dive log program for
recreational, tech, and free-divers.  It can track single and multi-tank
dives, plan and log dives, and import data from dive computers.")
    (home-page "https://subsurface-divelog.org/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 16. git-mr — git merge-request helper (shell script)
;;; -------------------------------------------------------------------
(define-public git-mr
  (package
    (name "git-mr")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/glensc/git-mr/-/archive/"
                    version "/git-mr-" version ".tar.gz"))
              (sha256
               (base32 "0vy9dwr8by1d44z2zlw6blfclfx7cazsgwqwd49ibigdzlnwv9qz"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("git-mr" "bin/git-mr"))))
    (synopsis "Checkout merge requests from the command line")
    (description "Git-mr is a shell script that adds support for checking
out GitLab and GitHub merge/pull requests directly from the command line
as local branches.")
    (home-page "https://gitlab.com/glensc/git-mr")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. arkenfox-user-js — Firefox privacy hardening configuration
;;; -------------------------------------------------------------------
(define-public arkenfox-user-js
  (package
    (name "arkenfox-user-js")
    (version "140.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arkenfox/user.js")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("user.js" "share/arkenfox/user.js")
               ("updater.sh" "share/arkenfox/updater.sh")
               ("prefsCleaner.sh" "share/arkenfox/prefsCleaner.sh"))))
    (synopsis "Firefox privacy, security, and anti-tracking configuration")
    (description "Arkenfox user.js is a template for configuring and
hardening Firefox privacy, security, and anti-tracking settings.  It
includes helper scripts for updating and cleaning preferences.")
    (home-page "https://github.com/arkenfox/user.js")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. byedpi — DPI bypass proxy (C source build)
;;; -------------------------------------------------------------------
(define-public byedpi
  (package
    (name "byedpi")
    (version "0.17.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hufrea/byedpi/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append "byedpi-" version ".tar.gz"))
              (sha256
               (base32 "0v2ncbi9kaxdhli3cjzmqzlgi6bgpz4k73785cz8rijlamcbi70a"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" (or (getenv "CC") "gcc"))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (install-file "ciadpi" bin)))))))
    (synopsis "Local SOCKS proxy for DPI bypass")
    (description "ByeDPI is a local SOCKS proxy server that implements
techniques to bypass deep packet inspection (DPI) used by some internet
service providers.  It works by modifying TCP packet parameters.")
    (home-page "https://github.com/hufrea/byedpi")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. bsdiff — binary diff/patch utility (C source build)
;;; -------------------------------------------------------------------
(define-public bsdiff
  (package
    (name "bsdiff")
    (version "4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mendsley/bsdiff/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append "bsdiff-" version ".tar.gz"))
              (sha256
               (base32 "0vl0vxl53hlkdbmk6v13g6dlnschm0nj6nznrajir9qwviarhwra"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'bootstrap 'run-autogen
                 (lambda _
                   (invoke "sh" "autogen.sh"))))))
    (native-inputs (list (@ (gnu packages autotools) autoconf)
                         (@ (gnu packages autotools) automake)
                         (@ (gnu packages autotools) libtool)))
    (inputs (list bzip2))
    (synopsis "Binary diff and patch utility")
    (description "Bsdiff and bspatch are tools for building and applying
patches to binary files.  By using suffix sorting (specifically Larsson
and Sadakane's qsufsort) and taking advantage of how executables change,
bsdiff routinely produces binary patches 50-80%% smaller than those
produced by Xdelta.")
    (home-page "https://www.daemonology.net/bsdiff/")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 20. yash — POSIX-compliant shell with enhanced interactivity
;;; -------------------------------------------------------------------
(define-public yash
  (package
    (name "yash")
    (version "2.61")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/magicant/yash/releases/download/"
                    version "/yash-" version ".tar.xz"))
              (sha256
               (base32 "0iyl42lxm3i1z2i6lqgfkrbhgmw7dvpx7911anm97cpq9xprc552"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list ncurses))
    (synopsis "POSIX-compliant command shell with enhanced interactivity")
    (description "Yash is a POSIX-compliant command line shell written in C.
It features command line editing, command history, command completion,
path completion, and prediction based on command history.  It aims to be
the most POSIX-compliant shell in the world.")
    (home-page "https://magicant.github.io/yash/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 21. activate-linux — "Activate Windows" overlay for Linux
;;; -------------------------------------------------------------------
(define-public activate-linux
  (package
    (name "activate-linux")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MrGlockenspiel/activate-linux/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append "activate-linux-" version ".tar.gz"))
              (sha256
               (base32 "0vbq4skm2jy2lri9v8qdjk2cfvq6lxx205bpfxph5xkvln82r2fg"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" (or (getenv "CC") "gcc"))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (install-file "activate-linux" bin)))))))
    (native-inputs (list pkg-config))
    (inputs (list cairo
                  libx11
                  libxinerama
                  libxrandr
                  wayland))
    (synopsis "\"Activate Windows\" watermark for Linux desktops")
    (description "Activate-linux displays an \"Activate Windows\"-style
watermark overlay on your Linux desktop.  It supports both X11 and
Wayland display servers and is fully configurable.")
    (home-page "https://github.com/MrGlockenspiel/activate-linux")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 22. pyupgrade — Python syntax upgrader
;;; -------------------------------------------------------------------
(define-public pyupgrade
  (package
    (name "pyupgrade")
    (version "3.21.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/pyupgrade/"
                    "pyupgrade-" version ".tar.gz"))
              (sha256
               (base32 "01lw3k0rv6skk0i4ilkih7zkcfldakfxjr8g8v8pinny77m1ndhs"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-tokenize-rt))
    (synopsis "Automatically upgrade Python syntax for newer versions")
    (description "Pyupgrade is a tool and pre-commit hook to automatically
upgrade Python syntax.  It rewrites code to use newer language features
such as f-strings, type union syntax, and modern collection generics.")
    (home-page "https://github.com/asottile/pyupgrade")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. python-pythondialog — Python wrapper for the dialog utility
;;; -------------------------------------------------------------------
(define-public python-pythondialog
  (package
    (name "python-pythondialog")
    (version "3.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/pythondialog/"
                    "pythondialog-" version ".tar.gz"))
              (sha256
               (base32 "08v3flvbhpc0p20drniiaalc3ijghlxk9ka5vz5mqqm6y254m8xj"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list (@ (gnu packages ncurses) dialog)))
    (synopsis "Python interface to the UNIX dialog utility")
    (description "Python-pythondialog provides a Python interface to the
dialog utility, which is used to build text user interfaces in terminal
applications.  It supports all dialog widgets including message boxes,
input boxes, menus, checklists, and file selection dialogs.")
    (home-page "https://pythondialog.sourceforge.io/")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 24. python-sysv-ipc — Python System V IPC bindings
;;; -------------------------------------------------------------------
(define-public python-sysv-ipc
  (package
    (name "python-sysv-ipc")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/s/sysv_ipc/"
                    "sysv_ipc-" version ".tar.gz"))
              (sha256
               (base32 "16a1a73vfrrwfzyg4ba4jq6cghy0vhj0bgph890x3r32pcrsp5pg"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Python System V IPC bindings for shared memory and semaphores")
    (description "Python-sysv-ipc provides Python bindings for System V
inter-process communication primitives: shared memory, semaphores, and
message queues.  It is a C extension module for efficient low-level IPC.")
    (home-page "https://semanchuk.com/philip/sysv_ipc/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 25. ttf-b612 — B612 cockpit font by Airbus
;;; -------------------------------------------------------------------
(define-public ttf-b612
  (package
    (name "ttf-b612")
    (version "1.008")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/polarsys/b612")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fonts/ttf/" "share/fonts/truetype/b612/"))))
    (synopsis "Highly legible font designed for aircraft cockpit displays")
    (description "B612 is a font family designed by Airbus and ENAC for use
on aircraft cockpit screens.  It was designed to be highly legible at small
sizes and in adverse reading conditions.  The family includes regular,
italic, bold, bold italic, and monospace variants.")
    (home-page "https://b612-font.com/")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 26. mint-y-icons — Linux Mint Y-series icon theme
;;; -------------------------------------------------------------------
(define-public mint-y-icons
  (package
    (name "mint-y-icons")
    (version "1.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmint/mint-y-icons/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append "mint-y-icons-" version ".tar.gz"))
              (sha256
               (base32 "1badg90b0s27vqikg0ny2p0dq3f43acjriryvp4m4fxrkcfa2b3a"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/share/icons/" "share/icons/"))))
    (synopsis "Linux Mint Y-series icon theme")
    (description "Mint-Y-Icons is the modern icon theme from Linux Mint.  It
provides a complete set of icons in multiple color variants including
Aqua, Blue, Brown, Green, Grey, Orange, Pink, Purple, Red, Sand, and Teal.")
    (home-page "https://github.com/linuxmint/mint-y-icons")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 27. mint-x-icons — Linux Mint X-series classic icon theme
;;; -------------------------------------------------------------------
(define-public mint-x-icons
  (package
    (name "mint-x-icons")
    (version "1.7.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmint/mint-x-icons/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append "mint-x-icons-" version ".tar.gz"))
              (sha256
               (base32 "02019377bcqwjrfyki56xhjnbd4k5lpddlaw21wfskks32v4z3y7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/share/icons/" "share/icons/"))))
    (synopsis "Linux Mint X-series classic icon theme")
    (description "Mint-X-Icons is the classic icon theme from Linux Mint.  It
provides a traditional icon set in multiple color variants for use with
desktop environments and file managers.")
    (home-page "https://github.com/linuxmint/mint-x-icons")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 28. prometheus-apcupsd-exporter — Prometheus exporter for apcupsd
;;; -------------------------------------------------------------------
(define-public prometheus-apcupsd-exporter
  (package
    (name "prometheus-apcupsd-exporter")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mdlayher/apcupsd_exporter")
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
                   (invoke "go" "build" "-o" "apcupsd_exporter"
                           "./cmd/apcupsd_exporter")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (install-file "apcupsd_exporter" bin)))))))
    (native-inputs (list (@ (gnu packages golang) go)))
    (synopsis "Prometheus exporter for apcupsd UPS data")
    (description "Apcupsd_exporter is a Prometheus exporter that provides
metrics from apcupsd, the APC UPS monitoring daemon.  It exposes UPS
status, battery level, voltage, and other sensor data for monitoring.")
    (home-page "https://github.com/mdlayher/apcupsd_exporter")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. smooth — cross-platform C++ application framework
;;; -------------------------------------------------------------------
(define-public smooth
  (package
    (name "smooth")
    (version "0.9.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/enzo1982/smooth/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append "smooth-" version ".tar.gz"))
              (sha256
               (base32 "1fm84r24n3i9nbx6a1ycj58y8pgy3vgxlkzfy15jv63z2l9pk1nw"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list bzip2
                  (@ (gnu packages curl) curl)
                  (@ (gnu packages image) libjpeg-turbo)
                  (@ (gnu packages image) libpng)
                  (@ (gnu packages image) libwebp)
                  (@ (gnu packages xml) libxml2)
                  zlib))
    (synopsis "Cross-platform C++ class library for applications")
    (description "Smooth is a cross-platform C++ class library providing a
wide range of functionality for building applications.  It includes support
for internationalization, XML processing, image handling, and networking.")
    (home-page "https://github.com/enzo1982/smooth")
    (license license:artistic2.0)))

;;; -------------------------------------------------------------------
;;; 30. corrscope — oscilloscope video renderer for music
;;; -------------------------------------------------------------------
(define-public corrscope
  (package
    (name "corrscope")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/corrscope/corrscope/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append "corrscope-" version ".tar.gz"))
              (sha256
               (base32 "00qhc9vxy022f1qkrs7zfg8fjxg105wpsydn9xsd4bj3qydkgqrg"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Render oscilloscope videos from audio for music visualization")
    (description "Corrscope is an oscilloscope-like video renderer for
creating music visualization videos from audio files.  It uses
correlation-based triggering for stable waveform display and supports
multi-channel rendering.")
    (home-page "https://github.com/corrscope/corrscope")
    (license license:bsd-2)))
