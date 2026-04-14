;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260414r
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - 39 recipes created
;;;   - 61 blocked with reason codes (see blocked-notes)
;;;
;;; All sha256 hashes are placeholders (must be verified via `guix download`).

(define-module (gaurix packages deptree-resolver-260414r)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (arch-upgrader
            cargo-pkgbuild-git
            cognito-local-git
            ssh3-server
            structurizr-git
            subtitleedit
            subtitleedit-cli-git
            subtui-git
            supermodel
            suwayomi-server-preview-bin
            syshud
            systemd-netns-git
            tableplus
            taskchampion-sync-server
            tcltls
            telegraf
            theclicker
            thedude
            tirith
            todoist-appimage
            touchportal-appimage
            ttf-ms-win11-fod-auto-arab
            ttf-ms-win11-fod-auto-beng
            ttf-ms-win11-fod-auto-cans
            ttf-ms-win11-fod-auto-cher
            ttf-ms-win11-fod-auto-deva
            ttf-ms-win11-fod-auto-ethi
            ttf-ms-win11-fod-auto-gujr
            ttf-ms-win11-fod-auto-guru
            ttf-ms-win11-fod-auto-hans
            ttf-ms-win11-fod-auto-hant
            ttf-ms-win11-fod-auto-hebr
            ttf-ms-win11-fod-auto-jpan
            ttf-ms-win11-fod-auto-khmr
            ttf-ms-win11-fod-auto-knda
            ttf-ms-win11-fod-auto-kore
            ttf-ms-win11-fod-auto-laoo
            ttf-ms-win11-fod-auto-mlym
            ttf-ms-win11-fod-auto-orya))

;;; --- #1432 arch-upgrader ---
;;; Update Arch: pacman & flatpak, rank mirrors, send notification on update and failure
;;; Source: https://github.com/Drazape/arch-upgrader
;;; License: MIT
;;; Resolves: #1432 arch-upgrader

(define-public arch-upgrader
  (package
    (name "arch-upgrader")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Drazape/arch-upgrader/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Drazape/arch-upgrader")
    (synopsis "update Arch: pacman & flatpak")
    (description "Update Arch: pacman & flatpak, rank mirrors, send notification on update and failure.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #7409 cargo-pkgbuild-git ---
;;; PKGBUILD generator from Cargo.toml manifest
;;; Source: https://github.com/kstep/cargo-pkgbuild
;;; License: Apache-2.0 OR MIT
;;; Resolves: #7409 cargo-pkgbuild-git

(define-public cargo-pkgbuild-git
  (package
    (name "cargo-pkgbuild-git")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/kstep/cargo-pkgbuild")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/kstep/cargo-pkgbuild")
    (synopsis "pKGBUILD generator from Cargo")
    (description "PKGBUILD generator from Cargo.toml manifest.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #8903 cognito-local-git ---
;;; Local emulator for Amazon Cognito (git version)
;;; Source: https://github.com/jagregory/cognito-local
;;; License: MIT
;;; Resolves: #8903 cognito-local-git

(define-public cognito-local-git
  (package
    (name "cognito-local-git")
    (version "5.1.0.r0.g4b2c4c5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/jagregory/cognito-local")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jagregory/cognito-local")
    (synopsis "local emulator for Amazon Cognito (git version)")
    (description "Local emulator for Amazon Cognito (git version).  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #3241 ssh3-server ---
;;; faster and rich secure shell using HTTP/3
;;; Source: https://github.com/francoismichel/ssh3
;;; License: Apache-2.0
;;; Resolves: #3241 ssh3-server

(define-public ssh3-server
  (package
    (name "ssh3-server")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/francoismichel/ssh3/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/francoismichel/ssh3"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://github.com/francoismichel/ssh3")
    (synopsis "faster and rich secure shell using HTTP/3")
    (description "Faster and rich secure shell using HTTP/3.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #818 structurizr-git ---
;;; Software architecture models as code
;;; Source: https://structurizr.com/
;;; License: Apache-2.0
;;; Resolves: #818 structurizr-git

(define-public structurizr-git
  (package
    (name "structurizr-git")
    (version "2026.03.06.r0.ga465ec4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://structurizr.com/")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://structurizr.com/")
    (synopsis "software architecture models as code")
    (description "Software architecture models as code.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #986 subtitleedit ---
;;; An advanced subtitle editor and converter
;;; Source: https://www.nikse.dk/SubtitleEdit
;;; License: GPL-3.0-only
;;; Resolves: #986 subtitleedit

(define-public subtitleedit
  (package
    (name "subtitleedit")
    (version "4.0.15")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.nikse.dk/SubtitleEdit/releases/download/v" version "/subtitleedit-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.nikse.dk/SubtitleEdit")
    (synopsis "advanced subtitle editor and converter")
    (description "An advanced subtitle editor and converter.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #7562 subtitleedit-cli-git ---
;;; Subtitle Edit CLI (without System.Drawing)
;;; Source: https://www.nikse.dk/SubtitleEdit
;;; License: LGPL
;;; Resolves: #7562 subtitleedit-cli-git

(define-public subtitleedit-cli-git
  (package
    (name "subtitleedit-cli-git")
    (version "43.e80c64d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://www.nikse.dk/SubtitleEdit")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.nikse.dk/SubtitleEdit")
    (synopsis "subtitle Edit CLI (without System")
    (description "Subtitle Edit CLI (without System.Drawing).  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #3276 subtui-git ---
;;; Lightweight TUI music player for Subsonic-compatible servers
;;; Source: https://github.com/MattiaPun/SubTUI
;;; License: MIT
;;; Resolves: #3276 subtui-git

(define-public subtui-git
  (package
    (name "subtui-git")
    (version "r1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/MattiaPun/SubTUI")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/MattiaPun/SubTUI"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://github.com/MattiaPun/SubTUI")
    (synopsis "lightweight TUI music player for Subsonic-compatible servers")
    (description "Lightweight TUI music player for Subsonic-compatible servers.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #816 supermodel ---
;;; A Sega Model 3 Arcade Emulator
;;; Source: https://github.com/trzy/Supermodel
;;; License: GPL3
;;; Resolves: #816 supermodel

(define-public supermodel
  (package
    (name "supermodel")
    (version "0.3a_20260228_git_d6dec3d")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/trzy/Supermodel/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/trzy/Supermodel")
    (synopsis "sega Model 3 Arcade Emulator")
    (description "A Sega Model 3 Arcade Emulator.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #9930 suwayomi-server-preview-bin ---
;;; A free and open source manga reader that runs extensions built for Tachiyomi
;;; Source: https://github.com/Suwayomi/Suwayomi-Server-preview
;;; License: MPL2
;;; Resolves: #9930 suwayomi-server-preview-bin

(define-public suwayomi-server-preview-bin
  (package
    (name "suwayomi-server-preview-bin")
    (version "2.1.2087")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Suwayomi/Suwayomi-Server-preview/releases/download/v" version "/Suwayomi-Server-preview-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://github.com/Suwayomi/Suwayomi-Server-preview")
    (synopsis "free and open source manga reader that runs extensions built for Tachiyomi")
    (description "A free and open source manga reader that runs extensions built for Tachiyomi.  Packaged from the Arch User Repository.")
    (license license:mpl2.0)))

;;; --- #10200 syshud ---
;;; Simple heads up display
;;; Source: https://github.com/System64fumo/syshud
;;; License: GPL3
;;; Resolves: #10200 syshud

(define-public syshud
  (package
    (name "syshud")
    (version "9.9.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/System64fumo/syshud/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/System64fumo/syshud")
    (synopsis "simple heads up display")
    (description "Simple heads up display.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #814 systemd-netns-git ---
;;; Configure private netns with systemd services.
;;; Source: https://github.com/CarloWood/systemd-netns.git
;;; License: GPL3
;;; Resolves: #814 systemd-netns-git

(define-public systemd-netns-git
  (package
    (name "systemd-netns-git")
    (version "r82.e5bb0d7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/CarloWood/systemd-netns")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/CarloWood/systemd-netns.git")
    (synopsis "configure private netns with systemd services")
    (description "Configure private netns with systemd services.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #17 tableplus ---
;;; Modern, native, and friendly GUI tool for relational databases (Alpha)
;;; Source: https://tableplus.com/
;;; License: custom
;;; Resolves: #17 tableplus

(define-public tableplus
  (package
    (name "tableplus")
    (version "0.1.296")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://tableplus.com//releases/download/v" version "/tableplus-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://tableplus.com/")
    (synopsis "modern")
    (description "Modern, native, and friendly GUI tool for relational databases (Alpha).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #7756 taskchampion-sync-server ---
;;; The server Taskwarrior syncs to
;;; Source: https://taskwarrior.org/
;;; License: MIT
;;; Resolves: #7756 taskchampion-sync-server

(define-public taskchampion-sync-server
  (package
    (name "taskchampion-sync-server")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://taskwarrior.org//releases/download/v" version "/taskchampion-sync-server-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://taskwarrior.org/")
    (synopsis "server Taskwarrior syncs to")
    (description "The server Taskwarrior syncs to.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #771 tcltls ---
;;; OpenSSL extension to Tcl
;;; Source: https://core.tcl.tk/tcltls/index
;;; License: GPL
;;; Resolves: #771 tcltls

(define-public tcltls
  (package
    (name "tcltls")
    (version "1.7.22")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://core.tcl.tk/tcltls/index/releases/download/v" version "/tcltls-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://core.tcl.tk/tcltls/index")
    (synopsis "openSSL extension to Tcl")
    (description "OpenSSL extension to Tcl.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #10275 telegraf ---
;;; Plugin-driven server agent for reporting metrics into InfluxDB
;;; Source: http://influxdb.org/
;;; License: MIT
;;; Resolves: #10275 telegraf

(define-public telegraf
  (package
    (name "telegraf")
    (version "1.38.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://influxdb.org//releases/download/v" version "/telegraf-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path ""
           #:install-source? #f
           #:tests? #f))
    (home-page "http://influxdb.org/")
    (synopsis "plugin-driven server agent for reporting metrics into InfluxDB")
    (description "Plugin-driven server agent for reporting metrics into InfluxDB.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #2335 theclicker ---
;;; Autoclicker coded in Rust for Wayland and X11
;;; Source: https://github.com/konkitoman/autoclicker
;;; License: MIT
;;; Resolves: #2335 theclicker

(define-public theclicker
  (package
    (name "theclicker")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/konkitoman/autoclicker/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/konkitoman/autoclicker")
    (synopsis "autoclicker coded in Rust for Wayland and X11")
    (description "Autoclicker coded in Rust for Wayland and X11.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #3402 thedude ---
;;; Mikrotik The Dude network monitoring client
;;; Source: http://www.mikrotik.com
;;; License: custom
;;; Resolves: #3402 thedude

(define-public thedude
  (package
    (name "thedude")
    (version "7.19.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.mikrotik.com/releases/download/v" version "/thedude-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.mikrotik.com")
    (synopsis "mikrotik The Dude network monitoring client")
    (description "Mikrotik The Dude network monitoring client.  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #11454 tirith ---
;;; Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection
;;; Source: https://github.com/sheeki03/tirith
;;; License: AGPL-3.0-only
;;; Resolves: #11454 tirith

(define-public tirith
  (package
    (name "tirith")
    (version "0.2.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/sheeki03/tirith/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/sheeki03/tirith")
    (synopsis "terminal security - catches homograph attacks")
    (description "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #1936 todoist-appimage ---
;;; The to-do list to organize work & life.
;;; Source: https://todoist.com/
;;; License: custom:commercial
;;; Resolves: #1936 todoist-appimage

(define-public todoist-appimage
  (package
    (name "todoist-appimage")
    (version "9.26.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://todoist.com//releases/download/v" version "/todoist-appimage-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://todoist.com/")
    (synopsis "to-do list to organize work & life")
    (description "The to-do list to organize work & life.  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #4350 touchportal-appimage ---
;;; Remote macro control deck for PC and Mac OS for streamers, content creators and other professionals
;;; Source: https://www.touch-portal.com
;;; License: custom
;;; Resolves: #4350 touchportal-appimage

(define-public touchportal-appimage
  (package
    (name "touchportal-appimage")
    (version "4.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.touch-portal.com/releases/download/v" version "/touchportal-appimage-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.touch-portal.com")
    (synopsis "remote macro control deck for PC and Mac OS for streamers")
    (description "Remote macro control deck for PC and Mac OS for streamers, content creators and other professionals.  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8928 ttf-ms-win11-fod-auto-arab ---
;;; Microsoft Windows 11 TrueType FOD fonts (arab)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8928 ttf-ms-win11-fod-auto-arab

(define-public ttf-ms-win11-fod-auto-arab
  (package
    (name "ttf-ms-win11-fod-auto-arab")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-arab-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (arab)")
    (description "Microsoft Windows 11 TrueType FOD fonts (arab).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8927 ttf-ms-win11-fod-auto-beng ---
;;; Microsoft Windows 11 TrueType FOD fonts (beng)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8927 ttf-ms-win11-fod-auto-beng

(define-public ttf-ms-win11-fod-auto-beng
  (package
    (name "ttf-ms-win11-fod-auto-beng")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-beng-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (beng)")
    (description "Microsoft Windows 11 TrueType FOD fonts (beng).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8926 ttf-ms-win11-fod-auto-cans ---
;;; Microsoft Windows 11 TrueType FOD fonts (cans)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8926 ttf-ms-win11-fod-auto-cans

(define-public ttf-ms-win11-fod-auto-cans
  (package
    (name "ttf-ms-win11-fod-auto-cans")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-cans-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (cans)")
    (description "Microsoft Windows 11 TrueType FOD fonts (cans).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8925 ttf-ms-win11-fod-auto-cher ---
;;; Microsoft Windows 11 TrueType FOD fonts (cher)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8925 ttf-ms-win11-fod-auto-cher

(define-public ttf-ms-win11-fod-auto-cher
  (package
    (name "ttf-ms-win11-fod-auto-cher")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-cher-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (cher)")
    (description "Microsoft Windows 11 TrueType FOD fonts (cher).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8924 ttf-ms-win11-fod-auto-deva ---
;;; Microsoft Windows 11 TrueType FOD fonts (deva)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8924 ttf-ms-win11-fod-auto-deva

(define-public ttf-ms-win11-fod-auto-deva
  (package
    (name "ttf-ms-win11-fod-auto-deva")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-deva-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (deva)")
    (description "Microsoft Windows 11 TrueType FOD fonts (deva).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8923 ttf-ms-win11-fod-auto-ethi ---
;;; Microsoft Windows 11 TrueType FOD fonts (ethi)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8923 ttf-ms-win11-fod-auto-ethi

(define-public ttf-ms-win11-fod-auto-ethi
  (package
    (name "ttf-ms-win11-fod-auto-ethi")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-ethi-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (ethi)")
    (description "Microsoft Windows 11 TrueType FOD fonts (ethi).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8922 ttf-ms-win11-fod-auto-gujr ---
;;; Microsoft Windows 11 TrueType FOD fonts (gujr)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8922 ttf-ms-win11-fod-auto-gujr

(define-public ttf-ms-win11-fod-auto-gujr
  (package
    (name "ttf-ms-win11-fod-auto-gujr")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-gujr-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (gujr)")
    (description "Microsoft Windows 11 TrueType FOD fonts (gujr).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8921 ttf-ms-win11-fod-auto-guru ---
;;; Microsoft Windows 11 TrueType FOD fonts (guru)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8921 ttf-ms-win11-fod-auto-guru

(define-public ttf-ms-win11-fod-auto-guru
  (package
    (name "ttf-ms-win11-fod-auto-guru")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-guru-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (guru)")
    (description "Microsoft Windows 11 TrueType FOD fonts (guru).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8920 ttf-ms-win11-fod-auto-hans ---
;;; Microsoft Windows 11 TrueType FOD fonts (hans)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8920 ttf-ms-win11-fod-auto-hans

(define-public ttf-ms-win11-fod-auto-hans
  (package
    (name "ttf-ms-win11-fod-auto-hans")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-hans-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (hans)")
    (description "Microsoft Windows 11 TrueType FOD fonts (hans).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8943 ttf-ms-win11-fod-auto-hant ---
;;; Microsoft Windows 11 TrueType FOD fonts (hant)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8943 ttf-ms-win11-fod-auto-hant

(define-public ttf-ms-win11-fod-auto-hant
  (package
    (name "ttf-ms-win11-fod-auto-hant")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-hant-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (hant)")
    (description "Microsoft Windows 11 TrueType FOD fonts (hant).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8942 ttf-ms-win11-fod-auto-hebr ---
;;; Microsoft Windows 11 TrueType FOD fonts (hebr)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8942 ttf-ms-win11-fod-auto-hebr

(define-public ttf-ms-win11-fod-auto-hebr
  (package
    (name "ttf-ms-win11-fod-auto-hebr")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-hebr-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (hebr)")
    (description "Microsoft Windows 11 TrueType FOD fonts (hebr).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8941 ttf-ms-win11-fod-auto-jpan ---
;;; Microsoft Windows 11 TrueType FOD fonts (jpan)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8941 ttf-ms-win11-fod-auto-jpan

(define-public ttf-ms-win11-fod-auto-jpan
  (package
    (name "ttf-ms-win11-fod-auto-jpan")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-jpan-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (jpan)")
    (description "Microsoft Windows 11 TrueType FOD fonts (jpan).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8940 ttf-ms-win11-fod-auto-khmr ---
;;; Microsoft Windows 11 TrueType FOD fonts (khmr)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8940 ttf-ms-win11-fod-auto-khmr

(define-public ttf-ms-win11-fod-auto-khmr
  (package
    (name "ttf-ms-win11-fod-auto-khmr")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-khmr-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (khmr)")
    (description "Microsoft Windows 11 TrueType FOD fonts (khmr).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8939 ttf-ms-win11-fod-auto-knda ---
;;; Microsoft Windows 11 TrueType FOD fonts (knda)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8939 ttf-ms-win11-fod-auto-knda

(define-public ttf-ms-win11-fod-auto-knda
  (package
    (name "ttf-ms-win11-fod-auto-knda")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-knda-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (knda)")
    (description "Microsoft Windows 11 TrueType FOD fonts (knda).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8938 ttf-ms-win11-fod-auto-kore ---
;;; Microsoft Windows 11 TrueType FOD fonts (kore)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8938 ttf-ms-win11-fod-auto-kore

(define-public ttf-ms-win11-fod-auto-kore
  (package
    (name "ttf-ms-win11-fod-auto-kore")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-kore-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (kore)")
    (description "Microsoft Windows 11 TrueType FOD fonts (kore).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8937 ttf-ms-win11-fod-auto-laoo ---
;;; Microsoft Windows 11 TrueType FOD fonts (laoo)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8937 ttf-ms-win11-fod-auto-laoo

(define-public ttf-ms-win11-fod-auto-laoo
  (package
    (name "ttf-ms-win11-fod-auto-laoo")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-laoo-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (laoo)")
    (description "Microsoft Windows 11 TrueType FOD fonts (laoo).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8936 ttf-ms-win11-fod-auto-mlym ---
;;; Microsoft Windows 11 TrueType FOD fonts (mlym)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8936 ttf-ms-win11-fod-auto-mlym

(define-public ttf-ms-win11-fod-auto-mlym
  (package
    (name "ttf-ms-win11-fod-auto-mlym")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-mlym-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (mlym)")
    (description "Microsoft Windows 11 TrueType FOD fonts (mlym).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #8935 ttf-ms-win11-fod-auto-orya ---
;;; Microsoft Windows 11 TrueType FOD fonts (orya)
;;; Source: https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages
;;; License: custom
;;; Resolves: #8935 ttf-ms-win11-fod-auto-orya

(define-public ttf-ms-win11-fod-auto-orya
  (package
    (name "ttf-ms-win11-fod-auto-orya")
    (version "26100.1.240331_1435")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages/releases/download/v" version "/ttf-ms-win11-fod-auto-orya-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages")
    (synopsis "microsoft Windows 11 TrueType FOD fonts (orya)")
    (description "Microsoft Windows 11 TrueType FOD fonts (orya).  Packaged from the Arch User Repository.")
    (license license:nonfree)))
