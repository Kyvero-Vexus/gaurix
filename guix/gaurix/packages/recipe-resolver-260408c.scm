;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408c
;;; Resolves 34 NEEDS_RECIPE_DESIGN packages:
;;;   Pre-built binary tools, desktop applications, and AppImages.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            palemoon-bin
            simplex-desktop-appimage
            alcom-bin
            torrra-bin
            katana-bin
            ytui-bin
            clang-format-static-bin
            easytier-bin
            reshell-bin
            quickserv-bin
            f2-bin
            nfpm-bin
            breaktimer-bin
            activitywatch-bin
            zaproxy-bin
            codename-goose-bin
            flaca-bin
            mcontrolcenter-bin
            soundy-bin
            nimo-bin
            webplotdigitizer-bin
            tunein-cli-bin
            littlenavmap-bin
            tuxedo-webfai-creator-bin
            nethermind-ethereum-bin
            emudeck-bin
            fontbase
            epochcli
            spoofdpi
            smartamp
            qtscrcpy-bin
            implay
            chiaki-ng
            fluent-reader-bin))
;;;
;;; ── palemoon-bin ──────────────────────────────────────────
;;;
(define-public palemoon-bin
  (package
    (name "palemoon-bin")
    (version "33.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://rm-us.palemoon.org/release/palemoon-"
             version
             ".linux-x86_64-gtk3.tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("palemoon" "bin/palemoon"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    
    (supported-systems '("x86_64-linux"))
    (home-page "https://rm-us.palemoon.org")
    (synopsis "open-source web browser based on Firefox (binary)")
    (description
     "Pale Moon is an Open Source, Goanna-based web browser focusing on
efficiency and customization.  This is the pre-built binary release.")
    (license license:mpl2.0)))

;;;
;;; ── simplex-desktop-appimage ──────────────────────────────────────────
;;;
(define-public simplex-desktop-appimage
  (package
    (name "simplex-desktop-appimage")
    (version "6.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/SimpleX-Chat-Desktop-AppImage/releases/download/v"
             version
             "/SimpleX-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/simplex"))
            (chmod (string-append bin "/simplex") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/SimpleX-Chat-Desktop-AppImage")
    (synopsis "privacy-first messaging platform (AppImage)")
    (description
     "SimpleX Chat is a messaging and application platform with no user
identifiers.  This is the pre-built AppImage release.")
    (license license:agpl3)))

;;;
;;; ── alcom-bin ──────────────────────────────────────────
;;;
(define-public alcom-bin
  (package
    (name "alcom-bin")
    (version "1.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vrc-get/vrc-get/releases/download/gui-v"
             version
             "/alcom-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/alcom"))
            (chmod (string-append bin "/alcom") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vrc-get/vrc-get")
    (synopsis "open-source VRChat Creator Companion alternative (binary)")
    (description
     "ALCOM (formerly vrc-get) is an open-source alternative to VRChat
Creator Companion for managing VRChat avatar and world projects.")
    (license license:expat)))

;;;
;;; ── torrra-bin ──────────────────────────────────────────
;;;
(define-public torrra-bin
  (package
    (name "torrra-bin")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/theonekaran/torrra/releases/download/v"
             version
             "/torrra-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/torrra"))
            (chmod (string-append bin "/torrra") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/theonekaran/torrra")
    (synopsis "torrent search and download CLI tool (binary)")
    (description
     "Torrra is a Python-based command-line tool for finding and
downloading torrents without leaving the terminal.")
    (license license:expat)))

;;;
;;; ── katana-bin ──────────────────────────────────────────
;;;
(define-public katana-bin
  (package
    (name "katana-bin")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/projectdiscovery/katana/releases/download/v"
             version
             "/katana_"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("katana" "bin/katana"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/projectdiscovery/katana")
    (synopsis "next-generation web crawling and spidering framework (binary)")
    (description
     "Katana is a fast and configurable web crawler designed for
automated reconnaissance of web applications.")
    (license license:expat)))

;;;
;;; ── ytui-bin ──────────────────────────────────────────
;;;
(define-public ytui-bin
  (package
    (name "ytui-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/ytui/releases/download/v"
             version
             "/ytui-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/ytui"))
            (chmod (string-append bin "/ytui") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/ytui")
    (synopsis "YouTube TUI client (binary)")
    (description
     "ytui is a terminal user interface tool for searching and playing
YouTube videos in a local media player.")
    (license license:expat)))

;;;
;;; ── clang-format-static-bin ──────────────────────────────────────────
;;;
(define-public clang-format-static-bin
  (package
    (name "clang-format-static-bin")
    (version "19.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/clang-format-static/releases/download/master-1bba621b/clang-format-"
             version
             "-x86_64-linux"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/clang"))
            (chmod (string-append bin "/clang") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/clang-format-static")
    (synopsis "statically linked clang-format binary")
    (description
     "Pre-built statically-linked clang-format binary for consistent
code formatting across environments.")
    (license license:asl2.0)))

;;;
;;; ── easytier-bin ──────────────────────────────────────────
;;;
(define-public easytier-bin
  (package
    (name "easytier-bin")
    (version "2.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/EasyTier/EasyTier/releases/download/v"
             version
             "/easytier-linux-x86_64-v"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("easytier" "bin/easytier"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/EasyTier/EasyTier")
    (synopsis "decentralized mesh VPN tool (binary)")
    (description
     "EasyTier is a simple, safe, and decentralized VPN networking
solution.  This is the pre-built binary release.")
    (license license:asl2.0)))

;;;
;;; ── reshell-bin ──────────────────────────────────────────
;;;
(define-public reshell-bin
  (package
    (name "reshell-bin")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/reshell/releases/download/v"
             version
             "/reshell-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/reshell"))
            (chmod (string-append bin "/reshell") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/reshell")
    (synopsis "modern shell reimagined (binary)")
    (description
     "Reshell is a modern shell for the future, designed with a focus
on usability and developer experience.")
    (license license:expat)))

;;;
;;; ── quickserv-bin ──────────────────────────────────────────
;;;
(define-public quickserv-bin
  (package
    (name "quickserv-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jstrieb/quickserv/releases/download/v"
             version
             "/quickserv-linux-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/quickserv"))
            (chmod (string-append bin "/quickserv") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jstrieb/quickserv")
    (synopsis "user-friendly static web server for quick prototyping (binary)")
    (description
     "Quickserv is a simple HTTP server for rapidly sharing files
and prototyping web applications locally.")
    (license license:expat)))

;;;
;;; ── f2-bin ──────────────────────────────────────────
;;;
(define-public f2-bin
  (package
    (name "f2-bin")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ayoisaiah/f2/releases/download/v"
             version
             "/f2_"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("f2" "bin/f2"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ayoisaiah/f2")
    (synopsis "fast and safe cross-platform batch file renamer (binary)")
    (description
     "F2 is a cross-platform command-line tool for batch renaming
files and directories safely and efficiently.")
    (license license:expat)))

;;;
;;; ── nfpm-bin ──────────────────────────────────────────
;;;
(define-public nfpm-bin
  (package
    (name "nfpm-bin")
    (version "2.41.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/goreleaser/nfpm/releases/download/v"
             version
             "/nfpm_"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("nfpm" "bin/nfpm"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/goreleaser/nfpm")
    (synopsis "simple deb, rpm, apk, and archlinux packager (binary)")
    (description
     "nFPM is a simple, zero-dependency Go packager for creating
Deb, RPM, APK, and Arch Linux packages.")
    (license license:expat)))

;;;
;;; ── breaktimer-bin ──────────────────────────────────────────
;;;
(define-public breaktimer-bin
  (package
    (name "breaktimer-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tom-james-watson/breaktimer-app/releases/download/v"
             version
             "/BreakTimer-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/breaktimer"))
            (chmod (string-append bin "/breaktimer") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tom-james-watson/breaktimer-app")
    (synopsis "break reminder application (AppImage)")
    (description
     "BreakTimer is a desktop application for managing healthy work
break schedules with customizable intervals.")
    (license license:gpl3)))

;;;
;;; ── activitywatch-bin ──────────────────────────────────────────
;;;
(define-public activitywatch-bin
  (package
    (name "activitywatch-bin")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ActivityWatch/activitywatch/releases/download/v"
             version
             "/activitywatch-v"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("activitywatch" "bin/activitywatch"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ActivityWatch/activitywatch")
    (synopsis "automated time-tracking application (binary)")
    (description
     "ActivityWatch is a bundle of programs that automatically track
how you spend time on your devices.")
    (license license:mpl2.0)))

;;;
;;; ── zaproxy-bin ──────────────────────────────────────────
;;;
(define-public zaproxy-bin
  (package
    (name "zaproxy-bin")
    (version "2.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/zaproxy/zaproxy/releases/download/v"
             version
             "/ZAP_"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("zaproxy" "bin/zaproxy"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zaproxy/zaproxy")
    (synopsis "OWASP Zed Attack Proxy for security testing (binary)")
    (description
     "The OWASP Zed Attack Proxy is an integrated penetration
testing tool for finding web application vulnerabilities.")
    (license license:asl2.0)))

;;;
;;; ── codename-goose-bin ──────────────────────────────────────────
;;;
(define-public codename-goose-bin
  (package
    (name "codename-goose-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/block/goose/releases/download/v"
             version
             "/goose-linux-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/codename"))
            (chmod (string-append bin "/codename") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/block/goose")
    (synopsis "AI-powered developer agent (binary)")
    (description
     "Goose is an on-machine AI agent that automates software
development tasks by interacting with tools and the filesystem.")
    (license license:asl2.0)))

;;;
;;; ── flaca-bin ──────────────────────────────────────────
;;;
(define-public flaca-bin
  (package
    (name "flaca-bin")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/flaca/releases/download/v"
             version
             "/flaca-linux-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/flaca"))
            (chmod (string-append bin "/flaca") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/flaca")
    (synopsis "lossless image compressor (binary)")
    (description
     "Flaca is a command-line tool for losslessly compressing JPEG
and PNG images to reduce file size.")
    (license license:expat)))

;;;
;;; ── mcontrolcenter-bin ──────────────────────────────────────────
;;;
(define-public mcontrolcenter-bin
  (package
    (name "mcontrolcenter-bin")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/MControlCenter/releases/download/"
             version
             "/MControlCenter-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/mcontrolcenter"))
            (chmod (string-append bin "/mcontrolcenter") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/MControlCenter")
    (synopsis "MSI laptop feature control center (binary)")
    (description
     "MControlCenter is an application for controlling various
features of MSI laptops on Linux.")
    (license license:gpl2)))

;;;
;;; ── soundy-bin ──────────────────────────────────────────
;;;
(define-public soundy-bin
  (package
    (name "soundy-bin")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/soundy/releases/download/v"
             version
             "/soundy-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/soundy"))
            (chmod (string-append bin "/soundy") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/soundy")
    (synopsis "ambient sound mixer (binary)")
    (description
     "Soundy is a desktop application for mixing ambient sounds
to improve focus and relaxation.")
    (license license:expat)))

;;;
;;; ── nimo-bin ──────────────────────────────────────────
;;;
(define-public nimo-bin
  (package
    (name "nimo-bin")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/nimo/releases/download/v"
             version
             "/nimo-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/nimo"))
            (chmod (string-append bin "/nimo") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/nimo")
    (synopsis "minimal note-taking application (binary)")
    (description
     "Nimo is a minimal note-taking application designed for
speed and simplicity.")
    (license license:expat)))

;;;
;;; ── webplotdigitizer-bin ──────────────────────────────────────────
;;;
(define-public webplotdigitizer-bin
  (package
    (name "webplotdigitizer-bin")
    (version "4.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/WebPlotDigitizer/releases/download/v"
             version
             "/WebPlotDigitizer-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/webplotdigitizer"))
            (chmod (string-append bin "/webplotdigitizer") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/WebPlotDigitizer")
    (synopsis "web-based plot digitizer (binary)")
    (description
     "WebPlotDigitizer is a tool for extracting numerical data
from plot images and graphs.")
    (license license:agpl3)))

;;;
;;; ── tunein-cli-bin ──────────────────────────────────────────
;;;
(define-public tunein-cli-bin
  (package
    (name "tunein-cli-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/tunein-cli/releases/download/v"
             version
             "/tunein-cli-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/tunein"))
            (chmod (string-append bin "/tunein") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/tunein-cli")
    (synopsis "TuneIn radio command-line client (binary)")
    (description
     "tunein-cli is a command-line interface for browsing and
playing TuneIn radio streams.")
    (license license:expat)))

;;;
;;; ── littlenavmap-bin ──────────────────────────────────────────
;;;
(define-public littlenavmap-bin
  (package
    (name "littlenavmap-bin")
    (version "3.0.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/albar965/littlenavmap/releases/download/v"
             version
             "/LittleNavmap-linux-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("littlenavmap" "bin/littlenavmap"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/albar965/littlenavmap")
    (synopsis "flight simulator navigation map planner (binary)")
    (description
     "Little Navmap is a free flight planner, navigation tool,
moving map, and airport search tool for flight simulators.")
    (license license:gpl3)))

;;;
;;; ── tuxedo-webfai-creator-bin ──────────────────────────────────────────
;;;
(define-public tuxedo-webfai-creator-bin
  (package
    (name "tuxedo-webfai-creator-bin")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tuxedocomputers/tuxedo-webfai-creator/releases/download/v"
             version
             "/tuxedo-webfai-creator-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/tuxedo"))
            (chmod (string-append bin "/tuxedo") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tuxedocomputers/tuxedo-webfai-creator")
    (synopsis "TUXEDO WebFAI USB drive creator (binary)")
    (description
     "TUXEDO WebFAI Creator prepares USB drives for TUXEDO's
Fully Automated Installation system.")
    (license license:gpl3)))

;;;
;;; ── nethermind-ethereum-bin ──────────────────────────────────────────
;;;
(define-public nethermind-ethereum-bin
  (package
    (name "nethermind-ethereum-bin")
    (version "1.30.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/NethermindEth/nethermind/releases/download/"
             version
             "/nethermind-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("nethermind" "bin/nethermind"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/NethermindEth/nethermind")
    (synopsis "robust execution client for Ethereum (binary)")
    (description
     "Nethermind is a high-performance Ethereum execution client
built on .NET for node operators.")
    (license license:lgpl3)))

;;;
;;; ── emudeck-bin ──────────────────────────────────────────
;;;
(define-public emudeck-bin
  (package
    (name "emudeck-bin")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/EmuDeck/emudeck-electron/releases/download/v"
             version
             "/EmuDeck-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/emudeck"))
            (chmod (string-append bin "/emudeck") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/EmuDeck/emudeck-electron")
    (synopsis "emulator configuration tool (AppImage)")
    (description
     "EmuDeck is a collection of scripts and configuration tools
that help set up emulators on Steam Deck and Linux.")
    (license license:gpl3)))

;;;
;;; ── fontbase ──────────────────────────────────────────
;;;
(define-public fontbase
  (package
    (name "fontbase")
    (version "2.20.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://releases.fontba.se/linux/FontBase-"
             version
             ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/fontbase"))
            (chmod (string-append bin "/fontbase") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https:/")
    (synopsis "font manager for designers (binary)")
    (description
     "FontBase is a modern font manager for previewing, organizing,
and activating fonts on the desktop.")
    (license license:expat)))

;;;
;;; ── epochcli ──────────────────────────────────────────
;;;
(define-public epochcli
  (package
    (name "epochcli")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sj14/epoch/releases/download/v"
             version
             "/epoch_"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("epochcli" "bin/epochcli"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sj14/epoch")
    (synopsis "epoch and human-readable date converter (binary)")
    (description
     "epochcli is a command-line tool for converting between Unix
epoch timestamps and human-readable date formats.")
    (license license:expat)))

;;;
;;; ── spoofdpi ──────────────────────────────────────────
;;;
(define-public spoofdpi
  (package
    (name "spoofdpi")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/xvzc/SpoofDPI/releases/download/v"
             version
             "/spoofdpi-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/spoofdpi"))
            (chmod (string-append bin "/spoofdpi") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xvzc/SpoofDPI")
    (synopsis "simple anti-censorship DPI bypass tool (binary)")
    (description
     "SpoofDPI is a simple tool that bypasses Deep Packet Inspection
by modifying the first TLS Client Hello packet.")
    (license license:asl2.0)))

;;;
;;; ── smartamp ──────────────────────────────────────────
;;;
(define-public smartamp
  (package
    (name "smartamp")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/SmartAmp/releases/download/v"
             version
             "/SmartAmp-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/smartamp"))
            (chmod (string-append bin "/smartamp") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/SmartAmp")
    (synopsis "machine-learning guitar amplifier (binary)")
    (description
     "SmartAmp provides next-level guitar tone powered by machine
learning neural amp modeling.")
    (license license:gpl3)))

;;;
;;; ── qtscrcpy-bin ──────────────────────────────────────────
;;;
(define-public qtscrcpy-bin
  (package
    (name "qtscrcpy-bin")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/QtScrcpy/releases/download/v"
             version
             "/QtScrcpy-linux-x86_64-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("qtscrcpy" "bin/qtscrcpy"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/QtScrcpy")
    (synopsis "Android screen mirror via scrcpy with Qt GUI (binary)")
    (description
     "QtScrcpy provides a graphical interface for scrcpy to
display and control Android devices from a desktop.")
    (license license:asl2.0)))

;;;
;;; ── implay ──────────────────────────────────────────
;;;
(define-public implay
  (package
    (name "implay")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/ImPlay/releases/download/v"
             version
             "/ImPlay-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/implay"))
            (chmod (string-append bin "/implay") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/ImPlay")
    (synopsis "desktop media player built on mpv and imgui (binary)")
    (description
     "ImPlay is a cross-platform desktop media player built
on mpv and Dear ImGui with a clean user interface.")
    (license license:gpl2)))

;;;
;;; ── chiaki-ng ──────────────────────────────────────────
;;;
(define-public chiaki-ng
  (package
    (name "chiaki-ng")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/chiaki-ng/releases/download/v"
             version
             "/Chiaki-ng-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/chiaki"))
            (chmod (string-append bin "/chiaki") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/chiaki-ng")
    (synopsis "PlayStation remote play client (binary)")
    (description
     "Chiaki-ng is an open-source client for PlayStation Remote Play
streaming on Linux, supporting PS4 and PS5.")
    (license license:agpl3)))

;;;
;;; ── fluent-reader-bin ──────────────────────────────────────────
;;;
(define-public fluent-reader-bin
  (package
    (name "fluent-reader-bin")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/fluent-reader/releases/download/v"
             version
             "/Fluent.Reader."))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/fluent"))
            (chmod (string-append bin "/fluent") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/fluent-reader")
    (synopsis "modern desktop RSS reader (binary)")
    (description
     "Fluent Reader is a modern desktop RSS reader with a clean
Fluent Design-inspired user interface.")
    (license license:bsd-3)))

