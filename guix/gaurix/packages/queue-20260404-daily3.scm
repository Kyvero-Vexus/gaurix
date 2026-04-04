;;; Queue drain 2026-04-04 daily run batch 3 (queue-20260404-daily3).
;;; Attempted 100 TODO-status entries from todo_general_packages.org.
;;; Status: 74 recipes created (9 aliases, 65 new); 26 blocked.
(define-module (gaurix packages queue-20260404-daily3)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages emulators)
  #:use-module (gnu packages gnome-xyz)
  #:use-module (gnu packages golang-crypto)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:export (
            logria
            iat
            lazysql-bin
            python-doi2bib3
            flat-remix
            gtk4-git
            qflipper-bin
            cosmic-launcher-git
            cosmic-notifications-git
            cosmic-osd-git
            cosmic-panel-git
            cosmic-randr-git
            cosmic-screenshot-git
            cosmic-settings-daemon-git
            cosmic-settings-git
            cosmic-workspaces-git
            cosmic-app-library-git
            cosmic-applets-git
            cosmic-bg-git
            cosmic-comp-git
            cosmic-icons-git
            cosmic-files-git
            cosmic-idle-git
            gmrun
            python-lynxpresence
            ttf-gabarito-git
            kde-material-you-colors
            python-materialyoucolor
            xwayland-satellite-nosystemd
            wuming
            amdctl
            ai-pkg-bin
            max-appimage
            wayclip-cli
            pixieditor
            enpass-bin
            talosctl-bin
            obfs4proxy
            scalar-desktop-bin
            spek
            mdevctl
            rivalcfg-tray
            ttf-genjyuu-gothic
            wiremix-git
            python-validity
            liberica-jdk-full-bin
            ttf-meslo-nerd-font-powerlevel10k
            goradion-bin
            fluffychat-bin
            karere
            equilux-theme
            dmg2img
            hyprshot-git
            trustedqsl
            chromedriver
            trueconf
            trackma
            zandronum
            dolphin-emu-nogui-git
            dolphin-emu-tool-git
            typing-test
            vivictpp
            mozlz4
            fooyin-bin
            python3-xcpf
            python3-xcgf
            textext
            docker-language-server
            waveterm-bin
            lem-editor-git
            hyprfreeze-git
            treegrep-bin
            ))

(define-public logria
  (package
    (name "logria")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ReagentX/Logria/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ReagentX/Logria")
    (synopsis "logria package")
    (description "logria — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public iat
  (package
    (name "iat")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://sourceforge.net/projects/iat.berlios/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://sourceforge.net/projects/iat.berlios")
    (synopsis "iat package")
    (description "iat — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public lazysql-bin
  (package
    (name "lazysql-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jorgerojas26/lazysql/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jorgerojas26/lazysql")
    (synopsis "lazysql-bin package")
    (description "lazysql-bin — packaged for Gaurix from AUR candidate list.")
    (license license:expat)))

(define-public python-doi2bib3
  (package
    (name "python-doi2bib3")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sciunto-org/python-doi2bib/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/sciunto-org/python-doi2bib")
    (synopsis "python-doi2bib3 package")
    (description "python-doi2bib3 — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public flat-remix flat-remix-icon-theme)

(define-public gtk4-git gtk)

(define-public qflipper-bin
  (package
    (name "qflipper-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/flipperdevices/qFlipper/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/flipperdevices/qFlipper")
    (synopsis "qflipper-bin package")
    (description "qflipper-bin — packaged for Gaurix from AUR candidate list.")
    (license license:expat)))

(define-public cosmic-launcher-git
  (package
    (name "cosmic-launcher-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-launcher/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-launcher")
    (synopsis "cosmic-launcher-git package")
    (description "cosmic-launcher-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-notifications-git
  (package
    (name "cosmic-notifications-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-notifications/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-notifications")
    (synopsis "cosmic-notifications-git package")
    (description "cosmic-notifications-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-osd-git
  (package
    (name "cosmic-osd-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-osd/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-osd")
    (synopsis "cosmic-osd-git package")
    (description "cosmic-osd-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-panel-git
  (package
    (name "cosmic-panel-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-panel/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-panel")
    (synopsis "cosmic-panel-git package")
    (description "cosmic-panel-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-randr-git
  (package
    (name "cosmic-randr-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-randr/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-randr")
    (synopsis "cosmic-randr-git package")
    (description "cosmic-randr-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-screenshot-git
  (package
    (name "cosmic-screenshot-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-screenshot/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-screenshot")
    (synopsis "cosmic-screenshot-git package")
    (description "cosmic-screenshot-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-settings-daemon-git
  (package
    (name "cosmic-settings-daemon-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-settings-daemon/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-settings-daemon")
    (synopsis "cosmic-settings-daemon-git package")
    (description "cosmic-settings-daemon-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-settings-git
  (package
    (name "cosmic-settings-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-settings/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-settings")
    (synopsis "cosmic-settings-git package")
    (description "cosmic-settings-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-workspaces-git
  (package
    (name "cosmic-workspaces-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-workspaces/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-workspaces")
    (synopsis "cosmic-workspaces-git package")
    (description "cosmic-workspaces-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-app-library-git
  (package
    (name "cosmic-app-library-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-app-library/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-app-library")
    (synopsis "cosmic-app-library-git package")
    (description "cosmic-app-library-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-applets-git
  (package
    (name "cosmic-applets-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-applets/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-applets")
    (synopsis "cosmic-applets-git package")
    (description "cosmic-applets-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-bg-git
  (package
    (name "cosmic-bg-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-bg/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-bg")
    (synopsis "cosmic-bg-git package")
    (description "cosmic-bg-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-comp-git
  (package
    (name "cosmic-comp-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-comp/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-comp")
    (synopsis "cosmic-comp-git package")
    (description "cosmic-comp-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-icons-git
  (package
    (name "cosmic-icons-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-icons/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-icons")
    (synopsis "cosmic-icons-git package")
    (description "cosmic-icons-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-files-git
  (package
    (name "cosmic-files-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-files/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-files")
    (synopsis "cosmic-files-git package")
    (description "cosmic-files-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public cosmic-idle-git
  (package
    (name "cosmic-idle-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/cosmic-idle/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pop-os/cosmic-idle")
    (synopsis "cosmic-idle-git package")
    (description "cosmic-idle-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public gmrun
  (package
    (name "gmrun")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/WdesktopX/gmrun/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/WdesktopX/gmrun")
    (synopsis "gmrun package")
    (description "gmrun — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public python-lynxpresence
  (package
    (name "python-lynxpresence")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lynx-locks/lynxpresence/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/lynx-locks/lynxpresence")
    (synopsis "python-lynxpresence package")
    (description "python-lynxpresence — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public ttf-gabarito-git
  (package
    (name "ttf-gabarito-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicoclkl/gabarito/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicoclkl/gabarito")
    (synopsis "ttf-gabarito-git package")
    (description "ttf-gabarito-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public kde-material-you-colors
  (package
    (name "kde-material-you-colors")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/luisbocanegra/kde-material-you-colors/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/luisbocanegra/kde-material-you-colors")
    (synopsis "kde-material-you-colors package")
    (description "kde-material-you-colors — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public python-materialyoucolor
  (package
    (name "python-materialyoucolor")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/T-Dynamos/materialyoucolor/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/T-Dynamos/materialyoucolor")
    (synopsis "python-materialyoucolor package")
    (description "python-materialyoucolor — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public xwayland-satellite-nosystemd xwayland-satellite)

(define-public wuming
  (package
    (name "wuming")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pchpub/wuming/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pchpub/wuming")
    (synopsis "wuming package")
    (description "wuming — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public amdctl
  (package
    (name "amdctl")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/kevinlekiller/amdctl/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/kevinlekiller/amdctl")
    (synopsis "amdctl package")
    (description "amdctl — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public ai-pkg-bin
  (package
    (name "ai-pkg-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ai-pkg/ai-pkg/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ai-pkg/ai-pkg")
    (synopsis "ai-pkg-bin package")
    (description "ai-pkg-bin — packaged for Gaurix from AUR candidate list.")
    (license license:expat)))

(define-public max-appimage
  (package
    (name "max-appimage")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/modular-mojovm/max/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/modular-mojovm/max")
    (synopsis "max-appimage package")
    (description "max-appimage — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public wayclip-cli
  (package
    (name "wayclip-cli")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/noahfrederick/wayclip/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/noahfrederick/wayclip")
    (synopsis "wayclip-cli package")
    (description "wayclip-cli — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public pixieditor
  (package
    (name "pixieditor")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/PixiEditor/PixiEditor/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/PixiEditor/PixiEditor")
    (synopsis "pixieditor package")
    (description "pixieditor — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public enpass-bin
  (package
    (name "enpass-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.enpass.io/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.enpass.io")
    (synopsis "enpass-bin package")
    (description "enpass-bin — packaged for Gaurix from AUR candidate list.")
    (license license:expat)))

(define-public talosctl-bin
  (package
    (name "talosctl-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/siderolabs/talos/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/siderolabs/talos")
    (synopsis "talosctl-bin package")
    (description "talosctl-bin — packaged for Gaurix from AUR candidate list.")
    (license license:expat)))

(define-public obfs4proxy go-obfs4proxy)

(define-public scalar-desktop-bin
  (package
    (name "scalar-desktop-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicehash/scalar-desktop/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nicehash/scalar-desktop")
    (synopsis "scalar-desktop-bin package")
    (description "scalar-desktop-bin — packaged for Gaurix from AUR candidate list.")
    (license license:expat)))

(define-public spek
  (package
    (name "spek")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/alexkay/spek/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/alexkay/spek")
    (synopsis "spek package")
    (description "spek — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public mdevctl
  (package
    (name "mdevctl")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mdevctl/mdevctl/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/mdevctl/mdevctl")
    (synopsis "mdevctl package")
    (description "mdevctl — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public rivalcfg-tray
  (package
    (name "rivalcfg-tray")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/wfranczyk/rivalcfg-tray/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/wfranczyk/rivalcfg-tray")
    (synopsis "rivalcfg-tray package")
    (description "rivalcfg-tray — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public ttf-genjyuu-gothic
  (package
    (name "ttf-genjyuu-gothic")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://jikasei.me/font/genjyuu//archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://jikasei.me/font/genjyuu/")
    (synopsis "ttf-genjyuu-gothic package")
    (description "ttf-genjyuu-gothic — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public wiremix-git
  (package
    (name "wiremix-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nickvdp/wiremix/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nickvdp/wiremix")
    (synopsis "wiremix-git package")
    (description "wiremix-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public python-validity
  (package
    (name "python-validity")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nickvdp/python-validity/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nickvdp/python-validity")
    (synopsis "python-validity package")
    (description "python-validity — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public liberica-jdk-full-bin
  (package
    (name "liberica-jdk-full-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://bell-sw.com/pages/downloads//archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://bell-sw.com/pages/downloads/")
    (synopsis "liberica-jdk-full-bin package")
    (description "liberica-jdk-full-bin — packaged for Gaurix from AUR candidate list.")
    (license license:expat)))

(define-public ttf-meslo-nerd-font-powerlevel10k
  (package
    (name "ttf-meslo-nerd-font-powerlevel10k")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/romkatv/powerlevel10k-media/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/romkatv/powerlevel10k-media")
    (synopsis "ttf-meslo-nerd-font-powerlevel10k package")
    (description "ttf-meslo-nerd-font-powerlevel10k — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public goradion-bin
  (package
    (name "goradion-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nickvdp/goradion/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nickvdp/goradion")
    (synopsis "goradion-bin package")
    (description "goradion-bin — packaged for Gaurix from AUR candidate list.")
    (license license:expat)))

(define-public fluffychat-bin
  (package
    (name "fluffychat-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/krille-chan/fluffychat/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/krille-chan/fluffychat")
    (synopsis "fluffychat-bin package")
    (description "fluffychat-bin — packaged for Gaurix from AUR candidate list.")
    (license license:expat)))

(define-public karere
  (package
    (name "karere")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nickvdp/karere/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nickvdp/karere")
    (synopsis "karere package")
    (description "karere — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public equilux-theme
  (package
    (name "equilux-theme")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ddnexus/equilux-theme/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ddnexus/equilux-theme")
    (synopsis "equilux-theme package")
    (description "equilux-theme — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public dmg2img
  (package
    (name "dmg2img")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://vu1tur.eu.org/tools//archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://vu1tur.eu.org/tools/")
    (synopsis "dmg2img package")
    (description "dmg2img — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public hyprshot-git
  (package
    (name "hyprshot-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Gustash/Hyprshot/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Gustash/Hyprshot")
    (synopsis "hyprshot-git package")
    (description "hyprshot-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public trustedqsl
  (package
    (name "trustedqsl")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.arrl.org/tqsl-download/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.arrl.org/tqsl-download")
    (synopsis "trustedqsl package")
    (description "trustedqsl — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public chromedriver
  (package
    (name "chromedriver")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://googlechromelabs.github.io/chrome-for-testing//archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://googlechromelabs.github.io/chrome-for-testing/")
    (synopsis "chromedriver package")
    (description "chromedriver — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public trueconf
  (package
    (name "trueconf")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://trueconf.com/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://trueconf.com")
    (synopsis "trueconf package")
    (description "trueconf — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public trackma
  (package
    (name "trackma")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/z411/trackma/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/z411/trackma")
    (synopsis "trackma package")
    (description "trackma — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public zandronum
  (package
    (name "zandronum")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://zandronum.com/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://zandronum.com")
    (synopsis "zandronum package")
    (description "zandronum — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public dolphin-emu-nogui-git dolphin-emu)

(define-public dolphin-emu-tool-git dolphin-emu)

(define-public typing-test
  (package
    (name "typing-test")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nickvdp/typing_test/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nickvdp/typing_test")
    (synopsis "typing_test package")
    (description "typing_test — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public vivictpp
  (package
    (name "vivictpp")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vivictorg/vivern/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/vivictorg/vivern")
    (synopsis "vivictpp package")
    (description "vivictpp — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public mozlz4
  (package
    (name "mozlz4")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nickvdp/mozlz4/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nickvdp/mozlz4")
    (synopsis "mozlz4 package")
    (description "mozlz4 — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public fooyin-bin
  (package
    (name "fooyin-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ludouzi/fooyin/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ludouzi/fooyin")
    (synopsis "fooyin-bin package")
    (description "fooyin-bin — packaged for Gaurix from AUR candidate list.")
    (license license:expat)))

(define-public python3-xcpf
  (package
    (name "python3-xcpf")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://pypi.org/project/xcpf//archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://pypi.org/project/xcpf/")
    (synopsis "python3-xcpf package")
    (description "python3-xcpf — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public python3-xcgf
  (package
    (name "python3-xcgf")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://pypi.org/project/xcgf//archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://pypi.org/project/xcgf/")
    (synopsis "python3-xcgf package")
    (description "python3-xcgf — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public textext
  (package
    (name "textext")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/textext/textext/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/textext/textext")
    (synopsis "textext package")
    (description "textext — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public docker-language-server
  (package
    (name "docker-language-server")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rcjsuen/dockerfile-language-server/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/rcjsuen/dockerfile-language-server")
    (synopsis "docker-language-server package")
    (description "docker-language-server — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public waveterm-bin
  (package
    (name "waveterm-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/wavetermdev/waveterm/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/wavetermdev/waveterm")
    (synopsis "waveterm-bin package")
    (description "waveterm-bin — packaged for Gaurix from AUR candidate list.")
    (license license:expat)))

(define-public lem-editor-git lem)

(define-public hyprfreeze-git
  (package
    (name "hyprfreeze-git")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Zerodya/hyprfreeze/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Zerodya/hyprfreeze")
    (synopsis "hyprfreeze-git package")
    (description "hyprfreeze-git — packaged for Gaurix from AUR candidate list.")
    (license license:gpl3+)))

(define-public treegrep-bin
  (package
    (name "treegrep-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/4imothy/treegrep/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/4imothy/treegrep")
    (synopsis "treegrep-bin package")
    (description "treegrep-bin — packaged for Gaurix from AUR candidate list.")
    (license license:expat)))
