;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260415o
;;; Resolves packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415o)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (            sysd-manager
            plasma6-applets-thermal-monitor-git
            xdg-desktop-portal-luminous
            ymir-emu
            zapret-gtk
            abinit
            aegnux
            aeolus-next-clap-bin
            aeolus-next-lv2-bin
            aeolus-next-standalone-bin
            aeolus-next-vst3-bin
            affine
            arduino
            aw-awatcher
            awatcher-bundle
            backintime
            bibleanalyzer
            calcesara
            cangaroo
            canon-pixma-g6000-complete
            cfait-git
            claude-desktop-native
            cloudflare-warp-bin
            crqt-ng
            cvs-feature-bin
            darkfi-git
            debugpy-run
            devilutionx-fonts
            devilutionx-voices
            discord-development
            dropdeck-git
            dumbshot
            gemini-cli-live-bin
            gozen
            gpu-screen-recorder-gtk
            gpu-t
            gsender-bin
            howdy-git
            huenicorn
            hyprqt6engine
            hypseus-singe-git
            karukan
            keypunch-git
            lcarsde-status-bar
            libastal-wl-git
            linux-arctis-manager
            localwp
            ludusavi
            lycheeslicer
            mate-wayland-session
            microsoft-edge-stable-bin
            mintmenu
            mytimer
            node-llama-cpp
            ntsc-rs-gui-git
            okular-backend-mupdf-git
            opentimestamps-client-git
            pantheon-dock-git
            peertube-gtk-git
            pgadmin4-desktop
            pgadmin4-desktop-native
            picosnitch
            piliplus
            plasma-foreground-booster-dmemcg
            python-cs50
            python-niquests-git
            python-pyautogui
            radiotray-ng-mpris
            ratatouille-docs
            s3ql))

(define-public sysd-manager
  (package
    (name "sysd-manager")
    (version "2.17.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sysd-manager.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a systemd GUI to manage service, timer, socket and other units")
    (description "A systemd GUI to manage service, timer, socket and other units.")
    (home-page "https://github.com/plrigaux/sysd-manager")
    (license license:gpl3+)))

(define-public plasma6-applets-thermal-monitor-git
  (package
    (name "plasma6-applets-thermal-monitor-git")
    (version "0.1.4.r0.g3d0878f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma6-applets-thermal-monitor-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a KDE Plasmoid for displaying system temperatures. Latest commit")
    (description "A KDE Plasmoid for displaying system temperatures. Latest commit.")
    (home-page "https://invent.kde.org/olib/thermalmonitor")
    (license license:expat)))

(define-public xdg-desktop-portal-luminous
  (package
    (name "xdg-desktop-portal-luminous")
    (version "0.1.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xdg-desktop-portal-luminous.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xdg-desktop-portal backend for wlroots based compositors, providing screensho...")
    (description "Xdg-desktop-portal backend for wlroots based compositors, providing screenshot and screencast.")
    (home-page "https://github.com/waycrate/xdg-desktop-portal-luminous")
    (license license:non-copyleft)))

(define-public ymir-emu
  (package
    (name "ymir-emu")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ymir-emu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sega Saturn Emulator")
    (description "Sega Saturn Emulator.")
    (home-page "https://github.com/StrikerX3/Ymir")
    (license license:gpl3)))

(define-public zapret-gtk
  (package
    (name "zapret-gtk")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zapret-gtk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI client for Zapret DPI Bypass")
    (description "GUI client for Zapret DPI Bypass.")
    (home-page "https://github.com/Taygun86/zapret-gtk")
    (license license:gpl3)))

(define-public abinit
  (package
    (name "abinit")
    (version "10.2.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/abinit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "full-featured atomic-scale first-principles simulation software")
    (description "Full-featured atomic-scale first-principles simulation software.")
    (home-page "https://www.abinit.org/")
    (license license:non-copyleft)))

(define-public aegnux
  (package
    (name "aegnux")
    (version "0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aegnux.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a convenient way to install Adobe After Effects on Linux using Wine")
    (description "A convenient way to install Adobe After Effects on Linux using Wine.")
    (home-page "https://github.com/relativemodder/aegnux")
    (license license:gpl3)))

(define-public aeolus-next-clap-bin
  (package
    (name "aeolus-next-clap-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Archie3d/aeolus_plugin/releases/download/v" version "/aeolus-next-clap-bin-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aeolus Organ Synth NEXT (CLAP)")
    (description "Aeolus Organ Synth NEXT (CLAP).")
    (home-page "https://github.com/Archie3d/aeolus_plugin")
    (license license:gpl3+)))

(define-public aeolus-next-lv2-bin
  (package
    (name "aeolus-next-lv2-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Archie3d/aeolus_plugin/releases/download/v" version "/aeolus-next-lv2-bin-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aeolus Organ Synth NEXT (LV2)")
    (description "Aeolus Organ Synth NEXT (LV2).")
    (home-page "https://github.com/Archie3d/aeolus_plugin")
    (license license:gpl3+)))

(define-public aeolus-next-standalone-bin
  (package
    (name "aeolus-next-standalone-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Archie3d/aeolus_plugin/releases/download/v" version "/aeolus-next-standalone-bin-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aeolus Organ Synth NEXT (Standalone)")
    (description "Aeolus Organ Synth NEXT (Standalone).")
    (home-page "https://github.com/Archie3d/aeolus_plugin")
    (license license:gpl3+)))

(define-public aeolus-next-vst3-bin
  (package
    (name "aeolus-next-vst3-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Archie3d/aeolus_plugin/releases/download/v" version "/aeolus-next-vst3-bin-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aeolus Organ Synth NEXT (VST3)")
    (description "Aeolus Organ Synth NEXT (VST3).")
    (home-page "https://github.com/Archie3d/aeolus_plugin")
    (license license:gpl3+)))

(define-public affine
  (package
    (name "affine")
    (version "0.26.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/affine.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "there can be more than Notion and Miro. AFFiNE is a next-gen knowledge base t...")
    (description "There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use.")
    (home-page "https://affine.pro/")
    (license license:non-copyleft)))

(define-public arduino
  (package
    (name "arduino")
    (version "1.8.19")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/arduino.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arduino prototyping platform SDK (Legacy 1.x.x)")
    (description "Arduino prototyping platform SDK (Legacy 1.x.x).")
    (home-page "https://github.com/arduino/Arduino")
    (license license:gpl3+)))

(define-public aw-awatcher
  (package
    (name "aw-awatcher")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aw-awatcher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "activity and idle watchers (ActivityWatch module)")
    (description "Activity and idle watchers (ActivityWatch module).")
    (home-page "https://github.com/2e3s/awatcher")
    (license license:mpl2.0)))

(define-public awatcher-bundle
  (package
    (name "awatcher-bundle")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/awatcher-bundle.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "activity and idle watchers (bundled version)")
    (description "Activity and idle watchers (bundled version).")
    (home-page "https://github.com/2e3s/awatcher")
    (license license:mpl2.0)))

(define-public backintime
  (package
    (name "backintime")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/backintime.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple backup system inspired from the Flyback Project and TimeVault. Qt6 GUI...")
    (description "Simple backup system inspired from the Flyback Project and TimeVault. Qt6 GUI version.")
    (home-page "https://github.com/bit-team/backintime")
    (license license:non-copyleft)))

(define-public bibleanalyzer
  (package
    (name "bibleanalyzer")
    (version "5.6.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bibleanalyzer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free Bible study solution with exciting premium features")
    (description "A free Bible study solution with exciting premium features.")
    (home-page "https://www.bibleanalyzer.com")
    (license license:non-copyleft)))

(define-public calcesara
  (package
    (name "calcesara")
    (version "8.6.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/calcesara.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simulation Assisted Reliability Assessment (SARA) Software")
    (description "Simulation Assisted Reliability Assessment (SARA) Software.")
    (home-page "https://web.calce.umd.edu/software/releaseSARA")
    (license license:non-copyleft)))

(define-public cangaroo
  (package
    (name "cangaroo")
    (version "0.2.2.r64.gca7f907")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cangaroo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source can bus analyzer software - with support for CANable / CANable2, ...")
    (description "Open source can bus analyzer software - with support for CANable / CANable2, CANFD, and other new features.")
    (home-page "https://github.com/normaldotcom/cangaroo")
    (license license:gpl2)))

(define-public canon-pixma-g6000-complete
  (package
    (name "canon-pixma-g6000-complete")
    (version "5.90")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/canon-pixma-g6000-complete.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "print Scan for Canon PIXMA series E3340 G5040 G5050 G5070 G6040 G6050 GM2050 ...")
    (description "Print Scan for Canon PIXMA series E3340 G5040 G5050 G5070 G6040 G6050 GM2050 TS3340 TS3350 TS3351 TS3352 TS3355 TS5340 TS5350 TS5351 TS5352 TS5353 TS6340 TS6350 TS6351 TS8340 TS8350 TS8351 TS8352.")
    (home-page "https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_g_series/pixma-g6050.html?type=drivers")
    (license license:non-copyleft)))

(define-public cfait-git
  (package
    (name "cfait-git")
    (version "730.6c04e37.rolling")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/trougnouf/cfait")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "powerful, fast and elegant task / TODO manager. (GUI & TUI, CalDAV & local, g...")
    (description "Powerful, fast and elegant task / TODO manager. (GUI & TUI, CalDAV & local, git version).")
    (home-page "https://codeberg.org/trougnouf/cfait")
    (license license:gpl3)))

(define-public claude-desktop-native
  (package
    (name "claude-desktop-native")
    (version "0.14.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/claude-desktop-native.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unofficial Claude Desktop for Linux")
    (description "Unofficial Claude Desktop for Linux.")
    (home-page "https://github.com/jkoelker/claude-desktop-native")
    (license license:asl2.0)))

(define-public cloudflare-warp-bin
  (package
    (name "cloudflare-warp-bin")
    (version "2026.1.150")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://1.1.1.1/releases/download/v" version "/cloudflare-warp-bin-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cloudflare Warp Client")
    (description "Cloudflare Warp Client.")
    (home-page "https://1.1.1.1")
    (license license:non-copyleft)))

(define-public crqt-ng
  (package
    (name "crqt-ng")
    (version "1.0.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/crqt-ng.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform open source e-book reader using crengine-ng")
    (description "Cross-platform open source e-book reader using crengine-ng.")
    (home-page "https://gitlab.com/coolreader-ng/crqt-ng")
    (license license:non-copyleft)))

(define-public cvs-feature-bin
  (package
    (name "cvs-feature-bin")
    (version "1.12.13+real_31")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cvs.nongnu.org/releases/download/v" version "/cvs-feature-bin-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "concurrent Versions System — a version control system; feature release binari...")
    (description "Concurrent Versions System — a version control system; feature release binaries, extracted from Debian packages.")
    (home-page "https://cvs.nongnu.org")
    (license license:gpl2+)))

(define-public darkfi-git
  (package
    (name "darkfi-git")
    (version "v0.4.1.r977.ge23fb30604")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/darkfi-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a blockchain designed with anonimity at the forefront, utilizing zk cryptography")
    (description "A blockchain designed with anonimity at the forefront, utilizing zk cryptography.")
    (home-page "https://darkrenaissance.github.io/darkfi/")
    (license license:non-copyleft)))

(define-public debugpy-run
  (package
    (name "debugpy-run")
    (version "1.16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/debugpy-run.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "finds and runs debugpy for VS Code "remote attach" command line debugging")
    (description "Finds and runs debugpy for VS Code "remote attach" command line debugging.")
    (home-page "https://github.com/bulletmark/debugpy-run")
    (license license:gpl3+)))

(define-public devilutionx-fonts
  (package
    (name "devilutionx-fonts")
    (version "1.5.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/devilutionx-fonts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "additional fonts for DevilutionX")
    (description "Additional fonts for DevilutionX.")
    (home-page "https://github.com/diasurgical/devilutionX")
    (license license:non-copyleft)))

(define-public devilutionx-voices
  (package
    (name "devilutionx-voices")
    (version "1.5.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/devilutionx-voices.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "additional voices for DevilutionX")
    (description "Additional voices for DevilutionX.")
    (home-page "https://github.com/diasurgical/devilutionX")
    (license license:non-copyleft)))

(define-public discord-development
  (package
    (name "discord-development")
    (version "0.0.242")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/discord-development.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "all-in-one voice and text chat for gamers that's free and secure")
    (description "All-in-one voice and text chat for gamers that's free and secure.")
    (home-page "https://discord.com/")
    (license license:non-copyleft)))

(define-public dropdeck-git
  (package
    (name "dropdeck-git")
    (version "r7.f8e18f4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maria-rcks/dropdeck")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "phone-style pull-down panel for Linux desktop (Quickshell)")
    (description "Phone-style pull-down panel for Linux desktop (Quickshell).")
    (home-page "https://github.com/maria-rcks/dropdeck")
    (license license:asl2.0)))

(define-public dumbshot
  (package
    (name "dumbshot")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dumbshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an elegant, painless one-click screenshot utility for Wayland (grim + slurp)")
    (description "An elegant, painless one-click screenshot utility for Wayland (grim + slurp).")
    (home-page "https://github.com/Faynot/dumbshot")
    (license license:expat)))

(define-public gemini-cli-live-bin
  (package
    (name "gemini-cli-live-bin")
    (version "0.37.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/google-gemini/gemini-cli/releases/download/v" version "/gemini-cli-live-bin-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source AI agent that brings the power of Gemini directly into your termi...")
    (description "Open-source AI agent that brings the power of Gemini directly into your terminal (Live version).")
    (home-page "https://github.com/google-gemini/gemini-cli")
    (license license:asl2.0)))

(define-public gozen
  (package
    (name "gozen")
    (version "0.9.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gozen.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a minimalistic video editor")
    (description "A minimalistic video editor.")
    (home-page "https://github.com/VoylinsGamedevJourney/GoZen")
    (license license:gpl3)))

(define-public gpu-screen-recorder-gtk
  (package
    (name "gpu-screen-recorder-gtk")
    (version "5.7.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gpu-screen-recorder-gtk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Li...")
    (description "Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.")
    (home-page "https://git.dec05eba.com/gpu-screen-recorder-gtk")
    (license license:gpl3)))

(define-public gpu-t
  (package
    (name "gpu-t")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gpu-t.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight GPU-Z clone for Linux")
    (description "A lightweight GPU-Z clone for Linux.")
    (home-page "https://github.com/lseurttyuu/GPU-T")
    (license license:expat)))

(define-public gsender-bin
  (package
    (name "gsender-bin")
    (version "1.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Sienci-Labs/gsender/releases/download/v" version "/gsender-bin-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "connect to and control Grbl-based CNCs")
    (description "Connect to and control Grbl-based CNCs.")
    (home-page "https://github.com/Sienci-Labs/gsender")
    (license license:non-copyleft)))

(define-public howdy-git
  (package
    (name "howdy-git")
    (version "r586.c4521c1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/boltgolt/howdy")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "windows Hello style facial authentication for Linux")
    (description "Windows Hello style facial authentication for Linux.")
    (home-page "https://github.com/boltgolt/howdy")
    (license license:expat)))

(define-public huenicorn
  (package
    (name "huenicorn")
    (version "1.0.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/huenicorn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free bias lighting driver for Philips Hue™ devices")
    (description "Free bias lighting driver for Philips Hue™ devices.")
    (home-page "https://gitlab.com/openjowelsofts/huenicorn")
    (license license:non-copyleft)))

(define-public hyprqt6engine
  (package
    (name "hyprqt6engine")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hyprqt6engine.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qT6 Theme Provider for Hyprland")
    (description "QT6 Theme Provider for Hyprland.")
    (home-page "https://github.com/hyprwm/hyprqt6engine")
    (license license:bsd-3)))

(define-public hypseus-singe-git
  (package
    (name "hypseus-singe-git")
    (version "v2.11.7.r3.g8334d98")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/DirtBagXon/hypseus-singe")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a drop-in replacement to daphne, to play laserdisc arcade games on a PC")
    (description "A drop-in replacement to daphne, to play laserdisc arcade games on a PC.")
    (home-page "https://github.com/DirtBagXon/hypseus-singe")
    (license license:gpl3)))

(define-public karukan
  (package
    (name "karukan")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/karukan.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "japanese Input Method System for Linux, Neural Kana-Kanji Conversion Engine +...")
    (description "Japanese Input Method System for Linux, Neural Kana-Kanji Conversion Engine + fcitx5 IME.")
    (home-page "https://github.com/togatoga/karukan")
    (license license:non-copyleft)))

(define-public keypunch-git
  (package
    (name "keypunch-git")
    (version "6.2.r20.g8d64ff6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bragefuglseth/keypunch")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "practice your typing skills")
    (description "Practice your typing skills.")
    (home-page "https://github.com/bragefuglseth/keypunch")
    (license license:gpl3+)))

(define-public lcarsde-status-bar
  (package
    (name "lcarsde-status-bar")
    (version "23.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lcarsde-status-bar.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "menu for lcarsde to display and run installed software")
    (description "Menu for lcarsde to display and run installed software.")
    (home-page "https://lcarsde.github.io")
    (license license:expat)))

(define-public libastal-wl-git
  (package
    (name "libastal-wl-git")
    (version "r862.41b5029")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "provides a central lib to manage wayland objects for other astal libs")
    (description "Provides a central lib to manage wayland objects for other astal libs.")
    (home-page "https://github.com/Aylur/astal")
    (license license:lgpl2.1)))

(define-public linux-arctis-manager
  (package
    (name "linux-arctis-manager")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-arctis-manager.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a replacement for SteelSeries GG software, to manage your Arctis device on Li...")
    (description "A replacement for SteelSeries GG software, to manage your Arctis device on Linux!.")
    (home-page "https://github.com/elegos/Linux-Arctis-Manager")
    (license license:gpl3)))

(define-public localwp
  (package
    (name "localwp")
    (version "10.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/localwp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the #1 local WordPress development tool. (Official .rpm repack)")
    (description "The #1 local WordPress development tool. (Official .rpm repack).")
    (home-page "https://localwp.com/")
    (license license:non-copyleft)))

(define-public ludusavi
  (package
    (name "ludusavi")
    (version "0.31.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ludusavi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "backup tool for PC game saves")
    (description "Backup tool for PC game saves.")
    (home-page "https://github.com/mtkennerly/ludusavi")
    (license license:expat)))

(define-public lycheeslicer
  (package
    (name "lycheeslicer")
    (version "7.6.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lycheeslicer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lychee Slicer")
    (description "Lychee Slicer.")
    (home-page "http://mango3d.io")
    (license license:non-copyleft)))

(define-public mate-wayland-session
  (package
    (name "mate-wayland-session")
    (version "1.28.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mate-wayland-session.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wayland session using Wayfire for the MATE desktop")
    (description "Wayland session using Wayfire for the MATE desktop.")
    (home-page "https://github.com/mate-desktop/mate-wayland-session")
    (license license:gpl2+)))

(define-public microsoft-edge-stable-bin
  (package
    (name "microsoft-edge-stable-bin")
    (version "147.0.3912.60")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.microsoftedgeinsider.com/en-us/download/releases/download/v" version "/microsoft-edge-stable-bin-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a browser that combines a minimal design with sophisticated technology to mak...")
    (description "A browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier.")
    (home-page "https://www.microsoftedgeinsider.com/en-us/download")
    (license license:non-copyleft)))

(define-public mintmenu
  (package
    (name "mintmenu")
    (version "6.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mintmenu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mint Menu for MATE")
    (description "Mint Menu for MATE.")
    (home-page "https://github.com/linuxmint/mintmenu")
    (license license:gpl2)))

(define-public mytimer
  (package
    (name "mytimer")
    (version "2.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mytimer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Geeky Timer for Terminal Enthusiasts")
    (description "A Geeky Timer for Terminal Enthusiasts.")
    (home-page "https://github.com/sepandhaghighi/mytimer")
    (license license:expat)))

(define-public node-llama-cpp
  (package
    (name "node-llama-cpp")
    (version "3.18.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/node-llama-cpp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "run AI models locally on your machine with node.js bindings for llama.cpp")
    (description "Run AI models locally on your machine with node.js bindings for llama.cpp.")
    (home-page "https://github.com/withcatai/node-llama-cpp")
    (license license:expat)))

(define-public ntsc-rs-gui-git
  (package
    (name "ntsc-rs-gui-git")
    (version "0.7.3.r365.751279a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/valadaptive/ntsc-rs")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ntsc-rs is a video effect which emulates NTSC and VHS video artifacts")
    (description "Ntsc-rs is a video effect which emulates NTSC and VHS video artifacts.")
    (home-page "https://github.com/valadaptive/ntsc-rs")
    (license license:gpl3)))

(define-public okular-backend-mupdf-git
  (package
    (name "okular-backend-mupdf-git")
    (version "r93.384d237")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lanconnected/okular-backend-mupdf")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "muPDF-based backend for Okular (git)")
    (description "MuPDF-based backend for Okular (git).")
    (home-page "https://github.com/lanconnected/okular-backend-mupdf")
    (license license:non-copyleft)))

(define-public opentimestamps-client-git
  (package
    (name "opentimestamps-client-git")
    (version "0.7.2.r7.gcd71c76")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/opentimestamps/opentimestamps-client")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line tool to create and validate timestamp proofs with the OpenTimest...")
    (description "Command-line tool to create and validate timestamp proofs with the OpenTimestamps protocol.")
    (home-page "https://github.com/opentimestamps/opentimestamps-client")
    (license license:lgpl3+)))

(define-public pantheon-dock-git
  (package
    (name "pantheon-dock-git")
    (version "r560.a4f2137")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/elementary/dock")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Pantheon Dock")
    (description "The Pantheon Dock.")
    (home-page "https://github.com/elementary/dock")
    (license license:gpl3+)))

(define-public peertube-gtk-git
  (package
    (name "peertube-gtk-git")
    (version "r552.734a018")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/The-World-Machine/peertube-gtk")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "native desktop PeerTube client")
    (description "Native desktop PeerTube client.")
    (home-page "https://codeberg.org/The-World-Machine/peertube-gtk")
    (license license:gpl3+)))

(define-public pgadmin4-desktop
  (package
    (name "pgadmin4-desktop")
    (version "9.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pgadmin4-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the desktop user interface for pgAdmin. pgAdmin is the most popular and featu...")
    (description "The desktop user interface for pgAdmin. pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.")
    (home-page "https://www.pgadmin.org/")
    (license license:non-copyleft)))

(define-public pgadmin4-desktop-native
  (package
    (name "pgadmin4-desktop-native")
    (version "9.13")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pgadmin4-desktop-native.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pgAdmin 4 desktop (System Electron 34 + Venv libs) built from source")
    (description "PgAdmin 4 desktop (System Electron 34 + Venv libs) built from source.")
    (home-page "https://www.pgadmin.org/")
    (license license:non-copyleft)))

(define-public picosnitch
  (package
    (name "picosnitch")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/picosnitch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "monitor network traffic per executable using BPF")
    (description "Monitor network traffic per executable using BPF.")
    (home-page "https://elesiuta.github.io/picosnitch/")
    (license license:gpl3)))

(define-public piliplus
  (package
    (name "piliplus")
    (version "2.0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/piliplus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a third-party Bilibili client developed in Flutter")
    (description "A third-party Bilibili client developed in Flutter.")
    (home-page "https://github.com/bggRGjQaUbCoE/PiliPlus")
    (license license:gpl3+)))

(define-public plasma-foreground-booster-dmemcg
  (package
    (name "plasma-foreground-booster-dmemcg")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma-foreground-booster-dmemcg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kDE library to manipulate cgroups (and boost foreground apps) - fork adding d...")
    (description "KDE library to manipulate cgroups (and boost foreground apps) - fork adding dmem cgroup support.")
    (home-page "https://github.com/pixelcluster/kcgroups")
    (license license:lgpl2.1+)))

(define-public python-cs50
  (package
    (name "python-cs50")
    (version "9.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-cs50.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cS50 library for Python")
    (description "CS50 library for Python.")
    (home-page "https://github.com/cs50/python-cs50")
    (license license:gpl3+)))

(define-public python-niquests-git
  (package
    (name "python-niquests-git")
    (version "3.13.1.r1.gd056ba10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jawah/niquests")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple, yet elegant, Python HTTP library: a drop-in replacement for python-re...")
    (description "Simple, yet elegant, Python HTTP library: a drop-in replacement for python-requests (latest commit).")
    (home-page "https://github.com/jawah/niquests")
    (license license:asl2.0)))

(define-public python-pyautogui
  (package
    (name "python-pyautogui")
    (version "0.9.54")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pyautogui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform GUI automation Python module for human beings")
    (description "A cross-platform GUI automation Python module for human beings.")
    (home-page "https://github.com/asweigart/pyautogui")
    (license license:bsd-3)))

(define-public radiotray-ng-mpris
  (package
    (name "radiotray-ng-mpris")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/radiotray-ng-mpris.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a wrapper script for Radiotray-NG which provides an MPRIS2 interface")
    (description "A wrapper script for Radiotray-NG which provides an MPRIS2 interface.")
    (home-page "https://github.com/IngoMeyer441/radiotray-ng-mpris")
    (license license:expat)))

(define-public ratatouille-docs
  (package
    (name "ratatouille-docs")
    (version "0.9.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ratatouille-docs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "guitar amp neural model and impulse response loader and mixer (documentation)")
    (description "Guitar amp neural model and impulse response loader and mixer (documentation).")
    (home-page "https://github.com/brummer10/Ratatouille.lv2")
    (license license:bsd-3)))

(define-public s3ql
  (package
    (name "s3ql")
    (version "5.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/s3ql.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a full-featured file system for online data storage")
    (description "A full-featured file system for online data storage.")
    (home-page "https://github.com/s3ql/s3ql")
    (license license:gpl3)))
