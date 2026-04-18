;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418m
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (18):
;;;     1.  nextdns-bin (copy-build-system, v1.47.2, expat)
;;;     2.  neohtop-bin (copy-build-system, v1.2.0, expat)
;;;     3.  dissent-bin (copy-build-system, v0.0.37, gpl3)
;;;     4.  netcoredbg-bin (copy-build-system, v3.1.3-1062, expat)
;;;     5.  ytsubconverter-bin (copy-build-system, v1.6.5, expat)
;;;     6.  naps2-bin (copy-build-system, v8.2.1, gpl2+)
;;;     7.  speedtest-go (copy-build-system, v1.7.10, expat)
;;;     8.  glab (copy-build-system, v1.62.0, expat)
;;;     9.  windows-10-cursor (copy-build-system, v2.0, public-domain)
;;;    10.  wealthfolio-bin (copy-build-system, v3.2.1, agpl3)
;;;    11.  cromite-bin (copy-build-system, v147.0.7727.56, gpl3)
;;;    12.  menulibre (python-build-system, v2.4.0, gpl3)
;;;    13.  dmscripts (copy-build-system, git, gpl3)
;;;    14.  lotion (copy-build-system, v1.5.0, expat)
;;;    15.  miniconda3 (copy-build-system, v26.1.1.1, bsd-3)
;;;    16.  freeoffice (copy-build-system, v1230, non-copyleft)
;;;    17.  knime-desktop (copy-build-system, v5.9.0, gpl3)
;;;    18.  curseforge-appimage (copy-build-system, v1.300.0, non-copyleft)
;;;
;;; ALREADY_RESOLVED (10):
;;;    19.  ghostty-nightly-bin -> recipe in recipe-resolver-260415x.scm
;;;    20.  lazytail-bin -> recipe in cron-5a2fb251-r21-w01.scm
;;;    21.  apngasm -> recipe in recipe-resolver-260408r.scm
;;;    22.  ccraw -> recipe in recipe-resolver-260414aa.scm
;;;    23.  bwlog -> recipe in deptree-resolver-260408i.scm
;;;    24.  arduino-ctags -> recipe in cron-c79f127f-w10.scm
;;;    25.  regexxer -> recipe in recipe-resolver-260415x.scm
;;;    26.  pixora-icons -> recipe in cron-c79f127f-r22-w03-nrd2.scm
;;;    27.  rofi-gpaste -> recipe in deptree-resolver-260415n.scm
;;;    28.  haguichi -> recipe in deptree-resolver-260415m.scm
;;;
;;; BLOCKED EXHAUSTED (2):
;;;    29.  paper-muncher-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: alpha software,
;;;         no stable releases, custom C++ layout engine (Vaev), no build docs
;;;    30.  pipeline-gtk -> NEEDS_RECIPE_DESIGN_EXHAUSTED: Rust+Meson+GTK4,
;;;         requires libclapper/clapper-enhancers not in Guix, complex build
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages compression)
  #:export (
            nextdns-bin
            neohtop-bin
            dissent-bin
            netcoredbg-bin
            ytsubconverter-bin
            naps2-bin
            speedtest-go
            glab
            windows-10-cursor
            wealthfolio-bin
            cromite-bin
            menulibre
            dmscripts
            lotion
            miniconda3
            freeoffice
            knime-desktop
            curseforge-appimage))

;;; -------------------------------------------------------------------
;;; 1. nextdns-bin --- NextDNS DNS/53 to DNS-over-HTTPS proxy
;;; -------------------------------------------------------------------
(define-public nextdns-bin
  (package
    (name "nextdns-bin")
    (version "1.47.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nextdns/nextdns/releases/download/v"
                    version "/nextdns_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nextdns" "bin/nextdns"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nextdns/nextdns")
    (synopsis "NextDNS DNS/53 to DNS-over-HTTPS proxy client")
    (description "NextDNS CLI client is a DNS/53 to DNS-over-HTTPS proxy that
allows using the NextDNS DNS service on any device.  It provides automatic
router detection, configuration, and transparent DNS query forwarding over
HTTPS for improved privacy and security.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. neohtop-bin --- modern system monitor (Rust/Tauri)
;;; -------------------------------------------------------------------
(define-public neohtop-bin
  (package
    (name "neohtop-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Abdenasser/neohtop/releases/download/v"
                    version "/NeoHtop_" version "_x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("neohtop" "bin/neohtop"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "neohtop")
              (chmod "neohtop" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Abdenasser/neohtop")
    (synopsis "blazing-fast system monitor built with Rust and Tauri")
    (description "NeoHtop is a modern system monitoring desktop application
built with Rust, Tauri, and Svelte.  It provides real-time process monitoring
with CPU and memory usage statistics in a clean graphical interface.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. dissent-bin --- tiny native Discord client (Go + GTK4)
;;; -------------------------------------------------------------------
(define-public dissent-bin
  (package
    (name "dissent-bin")
    (version "0.0.37")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/diamondburned/dissent/releases/download/v"
                    version "/dissent-linux-amd64.tar.zst"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list zstd))
    (arguments
     (list
      #:install-plan
      #~'(("dissent" "bin/dissent"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "zstd" "-d" source "-o" "dissent.tar")
              (invoke "tar" "-xf" "dissent.tar"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/diamondburned/dissent")
    (synopsis "tiny native Discord client written in Go and GTK4")
    (description "Dissent is a lightweight native Discord client built with Go
and GTK4/libadwaita.  It provides a minimal, resource-efficient interface for
Discord messaging with native desktop integration.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 4. netcoredbg-bin --- managed code debugger for .NET
;;; -------------------------------------------------------------------
(define-public netcoredbg-bin
  (package
    (name "netcoredbg-bin")
    (version "3.1.3-1062")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Samsung/netcoredbg/releases/download/"
                    version "/netcoredbg-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("netcoredbg/" "share/netcoredbg/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (dbg (string-append out "/share/netcoredbg/netcoredbg")))
                (mkdir-p bin)
                (symlink dbg (string-append bin "/netcoredbg"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Samsung/netcoredbg")
    (synopsis "managed code debugger with GDB/MI and DAP interfaces")
    (description "Netcoredbg is a managed code debugger for the .NET CoreCLR
runtime.  It supports GDB/MI, Visual Studio Code Debug Adapter Protocol (DAP),
and CLI interfaces for debugging .NET applications.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. ytsubconverter-bin --- YouTube styled subtitle converter
;;; -------------------------------------------------------------------
(define-public ytsubconverter-bin
  (package
    (name "ytsubconverter-bin")
    (version "1.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/arcusmaximus/YTSubConverter/"
                    "releases/download/" version
                    "/YTSubConverter-Linux.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("YTSubConverter" "bin/ytsubconverter"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/arcusmaximus/YTSubConverter")
    (synopsis "tool for creating styled YouTube subtitles")
    (description "YTSubConverter is a tool for creating styled YouTube
subtitles.  It converts subtitle files between formats while preserving
styling information such as fonts, colors, and positioning for YouTube
video uploads.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. naps2-bin --- scan documents to PDF
;;; -------------------------------------------------------------------
(define-public naps2-bin
  (package
    (name "naps2-bin")
    (version "8.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cyanfish/naps2/releases/download/v"
                    version "/naps2-" version "-linux-x64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list binutils))
    (arguments
     (list
      #:install-plan
      #~'(("usr/" "/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "-xf" "data.tar.xz"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.naps2.com")
    (synopsis "scan documents to PDF and more, as simply as possible")
    (description "NAPS2 (Not Another PDF Scanner) is a document scanning
application that makes it easy to scan documents to PDF and other formats.
It supports multiple scanners, automatic document feeder, and provides
image processing features.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 7. speedtest-go --- CLI speed test tool
;;; -------------------------------------------------------------------
(define-public speedtest-go
  (package
    (name "speedtest-go")
    (version "1.7.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/showwin/speedtest-go/releases/download/v"
                    version "/speedtest-go_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("speedtest-go" "bin/speedtest-go"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/showwin/speedtest-go")
    (synopsis "CLI and Go API to test internet speed via speedtest.net")
    (description "Speedtest-go is a command-line tool and Go library for
testing internet connection speed using speedtest.net servers.  It measures
download speed, upload speed, and latency with minimal dependencies.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. glab --- GitLab CLI tool
;;; -------------------------------------------------------------------
(define-public glab
  (package
    (name "glab")
    (version "1.62.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/gitlab-org/cli/-/releases/v"
                    version "/downloads/glab_" version
                    "_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/glab" "bin/glab"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/gitlab-org/cli")
    (synopsis "open source GitLab CLI tool")
    (description "GLab is an open source GitLab CLI tool that brings GitLab
functionality to your terminal.  It supports merge requests, issues, CI/CD
pipelines, and other GitLab features from the command line.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. windows-10-cursor --- Windows 10 cursor theme for Linux
;;; -------------------------------------------------------------------
(define-public windows-10-cursor
  (package
    (name "windows-10-cursor")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/red-magic/cursor-themes/"
                    "releases/download/" version
                    "/windows-10-cursor.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/windows-10-cursor/"))))
    (home-page "https://github.com/red-magic/cursor-themes")
    (synopsis "Windows 10 cursor theme for Linux desktops")
    (description "A Windows 10 light and dark cursor theme for Linux.  It
provides cursor icons matching the Windows 10 style for use with X11 and
Wayland desktop environments.")
    (license license:public-domain)))

;;; -------------------------------------------------------------------
;;; 10. wealthfolio-bin --- investment tracker (Tauri)
;;; -------------------------------------------------------------------
(define-public wealthfolio-bin
  (package
    (name "wealthfolio-bin")
    (version "3.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/afadil/wealthfolio/releases/download/v"
                    version "/Wealthfolio_" version "_amd64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("wealthfolio" "bin/wealthfolio"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "wealthfolio")
              (chmod "wealthfolio" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/afadil/wealthfolio")
    (synopsis "private desktop investment tracking application")
    (description "Wealthfolio is a beautiful, private, and secure desktop
investment tracking application.  It stores data locally and provides
portfolio analytics, performance tracking, and asset allocation views.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 11. cromite-bin --- Chromium fork with ad blocking
;;; -------------------------------------------------------------------
(define-public cromite-bin
  (package
    (name "cromite-bin")
    (version "147.0.7727.56")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicefeel/nicefeel-nicefeel"
                    "/releases/download/v" version
                    "/chrome-lin64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("chrome-lin64/" "share/cromite/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicefeel/nicefeel-nicefeel")
    (synopsis "Chromium fork with ad blocking and privacy enhancements")
    (description "Cromite is a Bromite fork with ad blocking and privacy
enhancements.  It includes a built-in ad blocker, privacy patches, and
security hardening on top of the Chromium browser engine.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 12. menulibre --- advanced menu editor for Linux
;;; -------------------------------------------------------------------
(define-public menulibre
  (package
    (name "menulibre")
    (version "2.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bluesabre/menulibre")
                    (commit (string-append "menulibre-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/bluesabre/menulibre")
    (synopsis "advanced menu editor with modern features")
    (description "MenuLibre is an advanced menu editor for Linux desktops
that provides a clean and easy-to-use interface for managing application
launcher entries.  It supports all freedesktop.org desktop entry fields
and works with GNOME, XFCE, MATE, and other desktop environments.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 13. dmscripts --- collection of dmenu scripts
;;; -------------------------------------------------------------------
(define-public dmscripts
  (package
    (name "dmscripts")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/dwt1/dmscripts")
                    (commit "40f5fac")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("scripts/" "bin/"))))
    (home-page "https://gitlab.com/dwt1/dmscripts")
    (synopsis "collection of dmenu scripts for daily desktop tasks")
    (description "Dmscripts is a collection of dmenu scripts for day-to-day
desktop Linux activities.  It includes scripts for web search, screen
recording, clipboard management, system configuration, and more, all
accessible through the dmenu launcher.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. lotion --- unofficial Notion.so desktop app
;;; -------------------------------------------------------------------
(define-public lotion
  (package
    (name "lotion")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/puneetsl/lotion/releases/download/v"
                    version "/Lotion-linux-x64-" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("Lotion-linux-x64/" "share/lotion/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/puneetsl/lotion")
    (synopsis "unofficial Notion.so desktop app for Linux")
    (description "Lotion is an unofficial Notion.so desktop application for
Linux.  It wraps the Notion web interface in an Electron shell to provide
a native desktop experience with system tray integration and keyboard
shortcuts.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. miniconda3 --- minimal Conda installer
;;; -------------------------------------------------------------------
(define-public miniconda3
  (package
    (name "miniconda3")
    (version "26.1.1-1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://repo.anaconda.com/miniconda/"
                    "Miniconda3-py312_" version "-Linux-x86_64.sh"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("miniconda3/" "share/miniconda3/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "bash" source "-b" "-p"
                      (string-append (getcwd) "/miniconda3")))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://docs.conda.io/en/latest/miniconda.html")
    (synopsis "minimal installer for Conda package manager")
    (description "Miniconda is a minimal installer for Conda, a package and
environment manager for Python and other languages.  It includes only Conda,
Python, and a small number of essential packages, allowing users to install
additional packages as needed.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 16. freeoffice --- SoftMaker FreeOffice suite
;;; -------------------------------------------------------------------
(define-public freeoffice
  (package
    (name "freeoffice")
    (version "1230")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.softmaker.net/down/"
                    "softmaker-freeoffice-2024-" version "-amd64.tgz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/freeoffice/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.freeoffice.com")
    (synopsis "complete office suite compatible with Microsoft Office")
    (description "FreeOffice is a complete office suite by SoftMaker that
includes TextMaker (word processing), PlanMaker (spreadsheets), and
Presentations.  It provides high compatibility with Microsoft Office
formats including DOCX, XLSX, and PPTX.")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 17. knime-desktop --- data analysis workbench
;;; -------------------------------------------------------------------
(define-public knime-desktop
  (package
    (name "knime-desktop")
    (version "5.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.knime.org/analytics-platform/linux/"
                    "knime_" version ".linux.gtk.x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/knime/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.knime.com")
    (synopsis "graphical data analysis workbench")
    (description "KNIME Analytics Platform is a graphical workbench for the
entire data analysis process.  It provides a visual workflow editor for
data blending, analysis, and visualization with support for machine learning,
statistics, and data mining workflows.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 18. curseforge-appimage --- game mod manager
;;; -------------------------------------------------------------------
(define-public curseforge-appimage
  (package
    (name "curseforge-appimage")
    (version "1.300.0-31983")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://curseforge.overwolf.com/electron/linux/"
                    "CurseForge-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("curseforge" "bin/curseforge"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "curseforge")
              (chmod "curseforge" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.curseforge.com")
    (synopsis "CurseForge desktop client for managing game mods")
    (description "CurseForge is a desktop client for managing mods and addons
for games including Minecraft, World of Warcraft, and other titles.  It
provides mod discovery, installation, and update management through a
graphical interface.")
    (license license:non-copyleft)))
