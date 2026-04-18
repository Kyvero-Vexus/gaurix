;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260417av
;;; Resolves BLOCKED packages prioritized by dependency tree order.
;;;
;;; Recipes (31):
;;;   1. lexido (binary-single, v1.4.3)
;;;   2. charm-pop (binary-tarball, v0.2.0)
;;;   3. sccache-git (binary-tarball, v0.14.0)
;;;   4. sunsetr (binary-tarball, v0.11.1)
;;;   5. froggit (binary-zip, v1.4.0-beta)
;;;   6. forgecode (binary-single, v2.11.3)
;;;   7. zrepl (binary-single, v0.7.0)
;;;   8. certamen (binary-tarball, v1.1.1)
;;;   9. tabula-java (binary-jar, v1.0.5)
;;;   10. diylc (binary-zip, v5.13.0)
;;;   11. opencloud (binary-single, v6.0.0)
;;;   12. shiru (binary-appimage, v6.5.2)
;;;   13. ariang-allinone (binary-zip, v1.3.13)
;;;   14. bste-git (cmake-source, v0.1.0)
;;;   15. bookmarksync-git (cmake-source, v1.0.1)
;;;   16. localquens (cmake-source, v1.0.1)
;;;   17. kdominate-git (cmake-source, v0.0.1)
;;;   18. hash-o-matic-git (cmake-source, v1.0.1)
;;;   19. xwaylandvideobridge-git (cmake-source, v0.4.0)
;;;   20. cctv-viewer-git (cmake-source, v0.1.9)
;;;   21. supertux-old (tarball-source, v0.1.3)
;;;   22. kamakura (cmake-source, v1.4.0)
;;;   23. pavumeter-gtk3 (meson-source, v0.1.0)
;;;   24. anttweakbar (tarball-source, v1.16)
;;;   25. libretro-np2kai-git (git-source, v0.1.0)
;;;   26. are (cargo-source, v1.2.2)
;;;   27. metapac (cargo-source, v0.9.4)
;;;   28. wlr-which-key-git (cargo-source, v1.3.0)
;;;   29. robin-cli-tool (cargo-source, v1.0.1)
;;;   30. docker-model (go-source, v1.1.36)
;;;   31. winscp (binary-zip, v6.5)
;;;
;;; 31 recipes written. 69 remain BLOCKED.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260417av)
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
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages pango)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages wine)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            lexido
            charm-pop
            sccache-git
            sunsetr
            froggit
            forgecode
            zrepl
            certamen
            tabula-java
            diylc
            opencloud
            shiru
            ariang-allinone
            bste-git
            bookmarksync-git
            localquens
            kdominate-git
            hash-o-matic-git
            xwaylandvideobridge-git
            cctv-viewer-git
            supertux-old
            kamakura
            pavumeter-gtk3
            anttweakbar
            libretro-np2kai-git
            are
            metapac
            wlr-which-key-git
            robin-cli-tool
            docker-model
            winscp
))

;;; lexido — AI-powered CLI assistant
(define-public lexido
  (package
    (name "lexido")
    (version "1.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/micr0-dev/lexido/releases/download/v"
                    version "/v" version "-lexido-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("v1.4.3-lexido-linux-amd64" "bin/lexido"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/lexido") #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "AI-powered CLI assistant for Linux commands")
    (description "Lexido is an AI-powered CLI assistant that helps generate and
explain Linux commands.  It uses local LLM models for privacy.")
    (home-page "https://github.com/micr0-dev/lexido")
    (license license:agpl3+)))

;;; charm-pop — send emails from the terminal
(define-public charm-pop
  (package
    (name "charm-pop")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/charmbracelet/pop/releases/download/v"
                    version "/pop_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pop" "bin/pop"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "send emails from the terminal")
    (description "Pop is a tool for sending emails from the terminal.  It supports
attachments, HTML emails, and SMTP configuration.")
    (home-page "https://github.com/charmbracelet/pop")
    (license license:expat)))

;;; sccache-git — shared compilation cache (pre-built binary)
(define-public sccache-git
  (package
    (name "sccache-git")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mozilla/sccache/releases/download/v"
                    version "/sccache-v" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sccache" "bin/sccache"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "shared compilation cache similar to ccache")
    (description "Sccache is a ccache-like compiler caching tool.  It supports
caching compilations to local disk, cloud storage, or Redis.  It handles
C/C++, Rust, and CUDA compilation.")
    (home-page "https://github.com/mozilla/sccache")
    (license license:asl2.0)))

;;; sunsetr — automatic blue light filter for Wayland
(define-public sunsetr
  (package
    (name "sunsetr")
    (version "0.11.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/psi4j/sunsetr/releases/download/v"
                    version "/sunsetr-v" version "-x86_64-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sunsetr" "bin/sunsetr"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "automatic blue light filter for Wayland compositors")
    (description "Sunsetr is an automatic blue light filter for Hyprland, Niri,
and other Wayland compositors.  It adjusts screen color temperature based on
time of day.")
    (home-page "https://github.com/psi4j/sunsetr")
    (license license:expat)))

;;; froggit — visual Git workflow tool
(define-public froggit
  (package
    (name "froggit")
    (version "1.4.0-beta")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/thewizardshell/froggit/releases/download/v"
                    version "/linux-amd64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("froggit" "bin/froggit"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "simplify Git workflow with visual feedback")
    (description "Froggit simplifies your Git workflow with visual feedback and
keyboard-driven interaction in the terminal.")
    (home-page "https://github.com/thewizardshell/froggit")
    (license license:expat)))

;;; forgecode — AI-powered code assistant CLI tool
(define-public forgecode
  (package
    (name "forgecode")
    (version "2.11.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tailcallhq/forgecode/releases/download/v"
                    version "/forge-x86_64-unknown-linux-gnu"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("forge-x86_64-unknown-linux-gnu" "bin/forge"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/forge") #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "AI-powered code assistant CLI tool")
    (description "ForgeCode is an AI-powered code assistant that helps with code
generation, editing, and refactoring from the command line.")
    (home-page "https://github.com/tailcallhq/forgecode")
    (license license:asl2.0)))

;;; zrepl — one-stop ZFS backup and replication solution
(define-public zrepl
  (package
    (name "zrepl")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zrepl/zrepl/releases/download/v"
                    version "/zrepl-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zrepl-linux-amd64" "bin/zrepl"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/zrepl") #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "one-stop ZFS backup and replication solution")
    (description "Zrepl is a one-stop ZFS backup and replication solution.  It
supports push and pull mode replication, automatic snapshot management, and
continuous replication.")
    (home-page "https://zrepl.github.io")
    (license license:expat)))

;;; certamen — TUI quiz game engine with SSH multiplayer
(define-public certamen
  (package
    (name "certamen")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/trintlermint/certamen/releases/download/v"
                    version "/certamen-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("certamen" "bin/certamen"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI quiz game engine with SSH multiplayer support")
    (description "Certamen is a TUI quiz game engine written in C++ with SSH
multiplayer support.  It uses YAML for quiz definitions and provides an
interactive terminal interface.")
    (home-page "https://github.com/trintlermint/certamen")
    (license license:expat)))

;;; tabula-java — extract tables from PDF files
(define-public tabula-java
  (package
    (name "tabula-java")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tabulapdf/tabula-java/releases/download/v"
                    version "/tabula-" version "-jar-with-dependencies.jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tabula-1.0.5-jar-with-dependencies.jar"
                "share/java/tabula.jar"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (jar (string-append out "/share/java/tabula.jar"))
                          (java (search-input-file inputs "bin/java")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/tabula")
                       (lambda ()
                         (display (string-append "#!/bin/sh\n"
                                                 "exec " java " -jar " jar " \"$@\"\n"))))
                     (chmod (string-append bin "/tabula") #o755)))))))
    (inputs (list (@ (gnu packages java) icedtea)))
    (synopsis "extract tables from PDF files")
    (description "Tabula is a tool for liberating data tables trapped inside PDF
files.  It can extract tables from PDFs and convert them to CSV or JSON format.")
    (home-page "https://tabula.technology")
    (license license:expat)))

;;; diylc — multi-platform circuit layout and schematic drawing tool
(define-public diylc
  (package
    (name "diylc")
    (version "5.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bancika/diy-layout-creator/releases/download/v"
                    version "/diylc-" version "-linux.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/diylc/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (java (search-input-file inputs "bin/java"))
                          (dir (string-append out "/share/diylc")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/diylc")
                       (lambda ()
                         (display (string-append
                                   "#!/bin/sh\n"
                                   "cd " dir "\n"
                                   "exec " java " -jar diylc.jar \"$@\"\n"))))
                     (chmod (string-append bin "/diylc") #o755)))))))
    (native-inputs (list unzip))
    (inputs (list (@ (gnu packages java) icedtea)))
    (synopsis "multi-platform circuit layout and schematic drawing tool")
    (description "DIY Layout Creator (DIYLC) is a freeware drawing tool for
creating electronic circuit layouts and schematics.  It supports various
component types and export formats.")
    (home-page "https://bancika.github.io/diy-layout-creator/")
    (license license:gpl3+)))

;;; opencloud — secure private file storage and sharing
(define-public opencloud
  (package
    (name "opencloud")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/opencloud-eu/opencloud/releases/download/v"
                    version "/opencloud-" version "-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opencloud-6.0.0-linux-amd64" "bin/opencloud"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/opencloud") #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "secure and private file storage and sharing server")
    (description "OpenCloud is a secure and private way to store, access, and
share files.  It provides a self-hosted file sync and share platform with a
modern web interface.")
    (home-page "https://github.com/opencloud-eu/opencloud")
    (license license:asl2.0)))

;;; shiru — personal anime library manager (AppImage)
(define-public shiru
  (package
    (name "shiru")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/RockinChaos/Shiru/releases/download/v"
                    version "/linux-Shiru-v" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("linux-Shiru-v6.5.2.AppImage" "bin/shiru"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/shiru") #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "personal anime library manager")
    (description "Shiru is a personal anime library manager for watching and
tracking your anime.  It provides a desktop application for organizing and
streaming anime content.")
    (home-page "https://github.com/RockinChaos/Shiru")
    (license license:gpl3+)))

;;; ariang-allinone — modern web frontend for aria2
(define-public ariang-allinone
  (package
    (name "ariang-allinone")
    (version "1.3.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mayswind/AriaNg/releases/download/"
                    version "/AriaNg-" version "-AllInOne.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("index.html" "share/ariang/index.html"))))
    (native-inputs (list unzip))
    (synopsis "modern web frontend making aria2 easier to use")
    (description "AriaNg is a modern web frontend making aria2 easier to use.
This all-in-one version contains everything in a single HTML file that can
be opened directly in a web browser.")
    (home-page "https://github.com/mayswind/AriaNg")
    (license license:expat)))

;;; bste-git — basic and simple Qt6 text editor
(define-public bste-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "bste-git")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/soyhyak/BSTE")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (inputs (list qtbase qttools))
      (synopsis "basic and simple Qt6 text editor")
      (description "BSTE (Basic and Simple Text Editor) is a rock-solid Qt6 text
editor designed for simplicity and reliability.")
      (home-page "https://github.com/soyhyak/BSTE")
      (license license:expat))))

;;; bookmarksync-git — sync file picker bookmarks for KDE and GTK
(define-public bookmarksync-git
  (package
    (name "bookmarksync-git")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jlu5/bookmarksync")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase kiconthemes kio))
    (native-inputs (list extra-cmake-modules))
    (synopsis "sync file picker bookmarks for KDE and GTK")
    (description "BookmarkSync synchronizes file picker bookmarks (pinned folders)
between KDE and GTK desktop environments.")
    (home-page "https://github.com/jlu5/bookmarksync")
    (license license:gpl3+)))

;;; localquens — local lorem ipsum text generator (KDE)
(define-public localquens
  (package
    (name "localquens")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/robinpie/localquens")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list kconfig kcoreaddons ki18n kirigami
                  kstatusnotifieritem qtbase qtdeclarative))
    (native-inputs (list extra-cmake-modules))
    (synopsis "local lorem ipsum text generator")
    (description "Localquens is a local lorem ipsum text generator, a fork of KDE
Eloquens.  It generates placeholder text in various languages for use in
design and development.")
    (home-page "https://github.com/robinpie/localquens")
    (license license:gpl3+)))

;;; kdominate-git — tactical board domination game for KDE
(define-public kdominate-git
  (package
    (name "kdominate-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://invent.kde.org/games/kdominate")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list kconfig kconfigwidgets kcoreaddons kcrash
                  kdbusaddons ki18n kio kwidgetsaddons kxmlgui qtbase))
    (native-inputs (list extra-cmake-modules kdoctools))
    (synopsis "tactical board domination game for one or two players")
    (description "KDominate is a tactical board domination game for KDE Plasma.
It can be played by one or two players, with the goal of dominating the board
by strategic placement.")
    (home-page "https://apps.kde.org/kdominate/")
    (license license:gpl2+)))

;;; hash-o-matic-git — simple hash validator for KDE
(define-public hash-o-matic-git
  (package
    (name "hash-o-matic-git")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://invent.kde.org/utilities/hash-o-matic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gpgme kconfig kconfigwidgets kcoreaddons kcrash
                  kdbusaddons kguiaddons ki18n kiconthemes kio
                  kwidgetsaddons kxmlgui qtbase))
    (native-inputs (list extra-cmake-modules))
    (synopsis "simple hash validator for comparing files")
    (description "Hash-o-matic is a simple KDE application for comparing files,
generating checksums, and validating file integrity using various hash
algorithms.")
    (home-page "https://apps.kde.org/hashomatic/")
    (license license:lgpl2.1+)))

;;; xwaylandvideobridge-git — stream Wayland windows to X11 apps
(define-public xwaylandvideobridge-git
  (package
    (name "xwaylandvideobridge-git")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://invent.kde.org/system/xwaylandvideobridge")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list kcrash knotifications kstatusnotifieritem
                  kdbusaddons kwindowsystem ki18n qtbase
                  qtdeclarative))
    (native-inputs (list extra-cmake-modules kdoctools))
    (synopsis "stream Wayland windows and screens to X11 apps")
    (description "XWaylandVideoBridge makes it easy to stream Wayland windows
and screens to X11 applications such as Discord and OBS Studio that use
XGetImage-based screen capture.")
    (home-page "https://invent.kde.org/system/xwaylandvideobridge")
    (license license:gpl2+)))

;;; cctv-viewer-git — Qt5 application for viewing multiple CCTV streams
(define-public cctv-viewer-git
  (let ((commit "v0.1.9-dev")
        (revision "0"))
    (package
      (name "cctv-viewer-git")
      (version (git-version "0.1.9" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/iEvgeny/cctv-viewer")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (inputs (list qtbase-5 qtsvg-5 qtmultimedia-5 vlc))
      (native-inputs (list qttools-5))
      (synopsis "simple Qt application for viewing multiple CCTV streams")
      (description "CCTV Viewer is a simple Qt5 application for simultaneously
viewing multiple RTSP video streams from network cameras.  It supports grid
layouts and fullscreen mode.")
      (home-page "https://github.com/iEvgeny/cctv-viewer")
      (license license:gpl3+))))

;;; supertux-old — classic SuperTux Milestone 1
(define-public supertux-old
  (package
    (name "supertux-old")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/super-tux/supertux/"
                    version "/supertux-" version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list sdl sdl-image sdl-mixer))
    (synopsis "classic jump-and-run game inspired by Super Mario Bros")
    (description "SuperTux Milestone 1 is the classic version of the open source
jump-and-run game inspired by Super Mario Bros.  This is the original 2003
release with 26 levels.")
    (home-page "https://supertux.org")
    (license license:gpl2+)))

;;; kamakura — simple and functional Qt5 code editor
(define-public kamakura
  (package
    (name "kamakura")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/msbCyricTohoku/Kamakura--")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase-5))
    (native-inputs (list qttools-5))
    (synopsis "simple and functional code editor")
    (description "Kamakura is a simple and functional code editor built with Qt5.
It provides basic text editing features with syntax highlighting support.")
    (home-page "https://github.com/msbCyricTohoku/Kamakura--")
    (license license:gpl3+)))

;;; pavumeter-gtk3 — simple GTK3 volume meter for PulseAudio
(define-public pavumeter-gtk3
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "pavumeter-gtk3")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/nekohayo/pavumeter")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments (list #:tests? #f))
      (inputs (list gtkmm-3 pulseaudio))
      (native-inputs (list pkg-config))
      (synopsis "simple GTK3 volume meter for PulseAudio")
      (description "Pavumeter is a simple GTK3 volume meter for the PulseAudio
sound server.  It displays real-time audio levels for monitoring playback
and recording volumes.")
      (home-page "https://github.com/nekohayo/pavumeter")
      (license license:gpl2))))

;;; anttweakbar — C/C++ library for adding GUI controls to OpenGL apps
(define-public anttweakbar
  (package
    (name "anttweakbar")
    (version "1.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/anttweakbar/"
                    "AntTweakBar_" (string-replace-substring version "." "")
                    ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   "CC=gcc" "CXX=g++")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-before 'build 'chdir
                 (lambda _ (chdir "src"))))))
    (native-inputs (list unzip))
    (inputs (list glu mesa))
    (synopsis "C/C++ library for adding light GUI controls to OpenGL apps")
    (description "AntTweakBar is a small and easy-to-use C/C++ library that allows
programmers to quickly add a light and intuitive graphical user interface to
OpenGL and DirectX applications.")
    (home-page "http://anttweakbar.sourceforge.net")
    (license license:zlib)))

;;; libretro-np2kai-git — libretro core for PC-98 emulation
(define-public libretro-np2kai-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "libretro-np2kai-git")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/AZO234/NP2kai")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments
       (list #:tests? #f
             #:make-flags
             #~(list "-f" "Makefile.libretro"
                     (string-append "PREFIX=" #$output)
                     "platform=unix")
             #:phases
             #~(modify-phases %standard-phases
                 (delete 'configure)
                 (replace 'install
                   (lambda* (#:key outputs #:allow-other-keys)
                     (let ((core-dir (string-append (assoc-ref outputs "out")
                                                    "/lib/libretro/")))
                       (mkdir-p core-dir)
                       (install-file "np2kai_libretro.so" core-dir)))))))
      (synopsis "libretro port of NP2kai PC-98 emulator")
      (description "NP2kai is a libretro core for emulating NEC PC-9801 and
PC-9821 series computers.  It is the Kai fork of the Neko Project II emulator
with additional features and accuracy improvements.")
      (home-page "https://github.com/AZO234/NP2kai")
      (license license:expat))))

;;; are — another Rust editor (terminal text editor)
;;; NOTE: cargo-build-system requires all Rust crate dependencies to be
;;; listed as cargo-inputs.  This is a draft recipe.
(define-public are
  (package
    (name "are")
    (version "1.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anoraktrend/are")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal-based text editor written in Rust")
    (description "ARE (Another Rust Editor) is a terminal-based text editor
written in Rust, ported from the aee text editor.  It provides a simple and
efficient editing experience.")
    (home-page "https://github.com/anoraktrend/are")
    (license license:artistic2.0)))

;;; metapac — multi-backend declarative package manager
;;; NOTE: cargo-build-system draft; crate inputs not yet listed.
(define-public metapac
  (package
    (name "metapac")
    (version "0.9.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ripytide/metapac")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi-backend declarative package manager")
    (description "Metapac is a declarative package manager that supports multiple
backends.  It allows you to declare your packages in a configuration file
and synchronize across different package managers.")
    (home-page "https://github.com/ripytide/metapac")
    (license license:gpl3+)))

;;; wlr-which-key-git — keymap manager for wlroots compositors
;;; NOTE: cargo-build-system draft; crate inputs not yet listed.
(define-public wlr-which-key-git
  (package
    (name "wlr-which-key-git")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MaxVerevkin/wlr-which-key")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list cairo glib libxkbcommon pango wayland))
    (synopsis "keymap manager for wlroots-based compositors")
    (description "Wlr-which-key is a keymap manager for wlroots-based Wayland
compositors.  It displays available key bindings in a popup when a prefix key
is pressed, similar to Emacs which-key.")
    (home-page "https://github.com/MaxVerevkin/wlr-which-key")
    (license license:gpl3)))

;;; robin-cli-tool — CLI tool to run scripts for any project
;;; NOTE: cargo-build-system draft; crate inputs not yet listed.
(define-public robin-cli-tool
  (package
    (name "robin-cli-tool")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cesarferreira/robin")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openssl))
    (native-inputs (list pkg-config))
    (synopsis "CLI tool to run scripts for any project")
    (description "Robin is a CLI tool to run scripts defined in any project.
It discovers and executes project-specific scripts and tasks.")
    (home-page "https://github.com/cesarferreira/robin")
    (license license:expat)))

;;; docker-model — Docker CLI plugin for running AI models
;;; NOTE: go-build-system draft; Go module deps not yet vendored.
(define-public docker-model
  (package
    (name "docker-model")
    (version "1.1.36")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/docker/model-runner")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/docker/model-runner"
           #:tests? #f))
    (synopsis "Docker CLI plugin for running AI models")
    (description "Docker Model is a CLI plugin for Docker that enables running
AI models locally.  It integrates with the Docker ecosystem for model
management and inference.")
    (home-page "https://github.com/docker/model-runner")
    (license license:asl2.0)))

;;; winscp — free SFTP, SCP and FTP client (Wine)
(define-public winscp
  (package
    (name "winscp")
    (version "6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://winscp.net/download/WinSCP-"
                    version "-Portable.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/winscp/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (wine (search-input-file inputs "bin/wine"))
                          (exe (string-append out "/share/winscp/WinSCP.exe")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/winscp")
                       (lambda ()
                         (display (string-append "#!/bin/sh\n"
                                                 "exec " wine " " exe " \"$@\"\n"))))
                     (chmod (string-append bin "/winscp") #o755)))))))
    (native-inputs (list unzip))
    (inputs (list wine64))
    (supported-systems '("x86_64-linux"))
    (synopsis "free SFTP, SCP, and FTP client for Windows via Wine")
    (description "WinSCP is a free SFTP, SCP, Amazon S3, WebDAV, and FTP client
for Windows, run via Wine on Linux.  It provides a graphical interface for
secure file transfer.")
    (home-page "https://winscp.net/")
    (license license:gpl2+)))
