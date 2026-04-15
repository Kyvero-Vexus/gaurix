;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260414t
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - 25 recipes created
;;;   - 75 blocked with reason codes (see blocked-notes)
;;;
;;; All sha256 hashes are placeholders (must be verified via `guix download`).

(define-module (gaurix packages deptree-resolver-260414t)
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
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (zombie
            4kvideodownloaderplus
            alacritty-use-theme-with-gnome-darkmode-git
            alice2-bin
            antiafk-rbx-sober
            antigravity-tools-bin
            apparmor-d
            apparmor-d-git
            apparmor-d-enforced
            asf-plugin-itemsmatcher
            asf-plugin-mobileauthenticator
            asf-plugin-monitoring
            asf-plugin-periodicgc
            asf-plugin-signinwithsteam
            asf-plugin-steamtokendumper
            avbroot
            banjorecomp-bin
            battinfo-git
            boxbuddy
            breeze-enhanced-git
            brrtfetch-git
            bsky-electron-git
            castblock-git
            compresso-bin
            cosmic-ext-applet-logomenu-git))

;;; --- #4540 zombie ---
;;; A super fast, modern terminal-based process manager (TUI)
;;; Source: https://github.com/NVSRahul/zombie
;;; License: MIT
;;; Resolves: #4540 zombie

(define-public zombie
  (package
    (name "zombie")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/NVSRahul/zombie/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/NVSRahul/zombie")
    (synopsis "super fast")
    (description "A super fast, modern terminal-based process manager (TUI).  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #10735 4kvideodownloaderplus ---
;;; Download videos from all popular websites including YouTube, Vimeo, TikTok, SoundCloud, Facebook, Twitch, Bilibili and more in high-quality
;;; Source: https://www.4kdownload.com/products/videodownloader-42
;;; License: LicenseRef-EULA
;;; Resolves: #10735 4kvideodownloaderplus

(define-public 4kvideodownloaderplus
  (package
    (name "4kvideodownloaderplus")
    (version "26.0.2.0282")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.4kdownload.com/products/videodownloader-42/releases/download/v" version "/4kvideodownloaderplus-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.4kdownload.com/products/videodownloader-42")
    (synopsis "download videos from all popular websites including YouTube")
    (description "Download videos from all popular websites including YouTube, Vimeo, TikTok, SoundCloud, Facebook, Twitch, Bilibili and more in high-quality.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #3937 alacritty-use-theme-with-gnome-darkmode-git ---
;;; ::Rolling release:: Changes alacritty theme when clicking the 'Dark Style' button in Gnome's System tray
;;; Source: https://github.com/alacritty-use-theme/alacritty-use-theme-with-gnome-darkmode
;;; License: GPL-1.0-or-later
;;; Resolves: #3937 alacritty-use-theme-with-gnome-darkmode-git

(define-public alacritty-use-theme-with-gnome-darkmode-git
  (package
    (name "alacritty-use-theme-with-gnome-darkmode-git")
    (version "r65.ed38a3e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/alacritty-use-theme/alacritty-use-theme-with-gnome-darkmode")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/alacritty-use-theme/alacritty-use-theme-with-gnome-darkmode")
    (synopsis "::Rolling release:: Changes alacritty theme when clicking the 'Dark Style'...")
    (description "::Rolling release:: Changes alacritty theme when clicking the 'Dark Style' button in Gnome's System tray.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #7457 alice2-bin ---
;;; Block-based 3D programming environment that makes it easy to create animations, build interactive narratives, or program simple games
;;; Source: https://www.alice.org/get-alice/alice-2/
;;; License: LicenseRef-Alice2-EULA, LicenseRef-GarfieldArtAssets-EULA
;;; Resolves: #7457 alice2-bin

(define-public alice2-bin
  (package
    (name "alice2-bin")
    (version "2.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.alice.org/get-alice/alice-2//releases/download/v" version "/alice2-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://www.alice.org/get-alice/alice-2/")
    (synopsis "block-based 3D programming environment that makes it easy to create animat...")
    (description "Block-based 3D programming environment that makes it easy to create animations, build interactive narratives, or program simple games.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #2524 antiafk-rbx-sober ---
;;; The best program for AntiAFK for Sober (roblox). Or just Sober Anti-AFK.
;;; Source: https://github.com/Agzes/AntiAFK-RBX-Sober
;;; License: MIT
;;; Resolves: #2524 antiafk-rbx-sober

(define-public antiafk-rbx-sober
  (package
    (name "antiafk-rbx-sober")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Agzes/AntiAFK-RBX-Sober/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Agzes/AntiAFK-RBX-Sober")
    (synopsis "best program for AntiAFK for Sober (roblox)")
    (description "The best program for AntiAFK for Sober (roblox). Or just Sober Anti-AFK.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #1292 antigravity-tools-bin ---
;;; Professional Antigravity Account Manager & Switcher (Binary from GitHub)
;;; Source: https://github.com/lbjlaq/Antigravity-Manager
;;; License: custom:cc-by-nc-sa-4.0
;;; Resolves: #1292 antigravity-tools-bin

(define-public antigravity-tools-bin
  (package
    (name "antigravity-tools-bin")
    (version "4.1.31")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/lbjlaq/Antigravity-Manager/releases/download/v" version "/Antigravity-Manager-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://github.com/lbjlaq/Antigravity-Manager")
    (synopsis "professional Antigravity Account Manager & Switcher (Binary from GitHub)")
    (description "Professional Antigravity Account Manager & Switcher (Binary from GitHub).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #745 apparmor.d ---
;;; Full set of apparmor profiles (complain mode)
;;; Source: https://github.com/roddhjav/apparmor.d
;;; License: GPL-2.0-only
;;; Resolves: #745 apparmor.d

(define-public apparmor-d
  (package
    (name "apparmor-d")
    (version "0.4907.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/roddhjav/apparmor.d/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/roddhjav/apparmor.d"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://github.com/roddhjav/apparmor.d")
    (synopsis "full set of apparmor profiles (complain mode)")
    (description "Full set of apparmor profiles (complain mode).  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #4147 apparmor.d-git ---
;;; Full set of apparmor profiles
;;; Source: https://github.com/roddhjav/apparmor.d
;;; License: GPL-2.0-only
;;; Resolves: #4147 apparmor.d-git

(define-public apparmor-d-git
  (package
    (name "apparmor-d-git")
    (version "v0.4900.r0.gc49d1ba")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/roddhjav/apparmor.d")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/roddhjav/apparmor.d"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://github.com/roddhjav/apparmor.d")
    (synopsis "full set of apparmor profiles")
    (description "Full set of apparmor profiles.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #744 apparmor.d.enforced ---
;;; Full set of apparmor profiles (enforced mode)
;;; Source: https://github.com/roddhjav/apparmor.d
;;; License: GPL-2.0-only
;;; Resolves: #744 apparmor.d.enforced

(define-public apparmor-d-enforced
  (package
    (name "apparmor-d-enforced")
    (version "0.4907.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/roddhjav/apparmor.d/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/roddhjav/apparmor.d"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://github.com/roddhjav/apparmor.d")
    (synopsis "full set of apparmor profiles (enforced mode)")
    (description "Full set of apparmor profiles (enforced mode).  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #8891 asf-plugin-itemsmatcher ---
;;; ItemsMatcher plugin for ArchiSteamFarm.
;;; Source: https://github.com/JustArchiNET/ArchiSteamFarm
;;; License: Apache-2.0
;;; Resolves: #8891 asf-plugin-itemsmatcher

(define-public asf-plugin-itemsmatcher
  (package
    (name "asf-plugin-itemsmatcher")
    (version "6.3.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/JustArchiNET/ArchiSteamFarm/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/JustArchiNET/ArchiSteamFarm")
    (synopsis "itemsMatcher plugin for ArchiSteamFarm")
    (description "ItemsMatcher plugin for ArchiSteamFarm.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #8892 asf-plugin-mobileauthenticator ---
;;; MobileAuthenticator plugin for ArchiSteamFarm.
;;; Source: https://github.com/JustArchiNET/ArchiSteamFarm
;;; License: Apache-2.0
;;; Resolves: #8892 asf-plugin-mobileauthenticator

(define-public asf-plugin-mobileauthenticator
  (package
    (name "asf-plugin-mobileauthenticator")
    (version "6.3.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/JustArchiNET/ArchiSteamFarm/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/JustArchiNET/ArchiSteamFarm")
    (synopsis "mobileAuthenticator plugin for ArchiSteamFarm")
    (description "MobileAuthenticator plugin for ArchiSteamFarm.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #8893 asf-plugin-monitoring ---
;;; Monitoring plugin for ArchiSteamFarm.
;;; Source: https://github.com/JustArchiNET/ArchiSteamFarm
;;; License: Apache-2.0
;;; Resolves: #8893 asf-plugin-monitoring

(define-public asf-plugin-monitoring
  (package
    (name "asf-plugin-monitoring")
    (version "6.3.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/JustArchiNET/ArchiSteamFarm/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/JustArchiNET/ArchiSteamFarm")
    (synopsis "monitoring plugin for ArchiSteamFarm")
    (description "Monitoring plugin for ArchiSteamFarm.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #8894 asf-plugin-periodicgc ---
;;; PeriodicGC plugin for ArchiSteamFarm.
;;; Source: https://github.com/JustArchiNET/ArchiSteamFarm
;;; License: Apache-2.0
;;; Resolves: #8894 asf-plugin-periodicgc

(define-public asf-plugin-periodicgc
  (package
    (name "asf-plugin-periodicgc")
    (version "6.3.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/JustArchiNET/ArchiSteamFarm/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/JustArchiNET/ArchiSteamFarm")
    (synopsis "periodicGC plugin for ArchiSteamFarm")
    (description "PeriodicGC plugin for ArchiSteamFarm.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #8895 asf-plugin-signinwithsteam ---
;;; SignInWithSteam plugin for ArchiSteamFarm.
;;; Source: https://github.com/JustArchiNET/ArchiSteamFarm
;;; License: Apache-2.0
;;; Resolves: #8895 asf-plugin-signinwithsteam

(define-public asf-plugin-signinwithsteam
  (package
    (name "asf-plugin-signinwithsteam")
    (version "6.3.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/JustArchiNET/ArchiSteamFarm/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/JustArchiNET/ArchiSteamFarm")
    (synopsis "signInWithSteam plugin for ArchiSteamFarm")
    (description "SignInWithSteam plugin for ArchiSteamFarm.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #8890 asf-plugin-steamtokendumper ---
;;; SteamTokenDumper plugin for ArchiSteamFarm.
;;; Source: https://github.com/JustArchiNET/ArchiSteamFarm
;;; License: Apache-2.0
;;; Resolves: #8890 asf-plugin-steamtokendumper

(define-public asf-plugin-steamtokendumper
  (package
    (name "asf-plugin-steamtokendumper")
    (version "6.3.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/JustArchiNET/ArchiSteamFarm/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/JustArchiNET/ArchiSteamFarm")
    (synopsis "steamTokenDumper plugin for ArchiSteamFarm")
    (description "SteamTokenDumper plugin for ArchiSteamFarm.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #1760 avbroot ---
;;; Application for patching Android A/B-style OTA images for root access
;;; Source: https://github.com/chenxiaolong/avbroot
;;; License: GPL
;;; Resolves: #1760 avbroot

(define-public avbroot
  (package
    (name "avbroot")
    (version "3.29.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/chenxiaolong/avbroot/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/chenxiaolong/avbroot")
    (synopsis "application for patching Android A/B-style OTA images for root access")
    (description "Application for patching Android A/B-style OTA images for root access.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #1240 banjorecomp-bin ---
;;; A static recompilation of Banjo-Kazooie
;;; Source: https://github.com/BanjoRecomp/BanjoRecomp
;;; License: GPLv3
;;; Resolves: #1240 banjorecomp-bin

(define-public banjorecomp-bin
  (package
    (name "banjorecomp-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/BanjoRecomp/BanjoRecomp/releases/download/v" version "/BanjoRecomp-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://github.com/BanjoRecomp/BanjoRecomp")
    (synopsis "static recompilation of Banjo-Kazooie")
    (description "A static recompilation of Banjo-Kazooie.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #3654 battinfo-git ---
;;; battinfo is a CLI tool & nim library to get battery detials.
;;; Source: https://gitlab.com/prashere/battinfo
;;; License: GPL-3.0-or-later
;;; Resolves: #3654 battinfo-git

(define-public battinfo-git
  (package
    (name "battinfo-git")
    (version "0.2.1.r20.2ce7b89")
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
     (list #:tests? #f))
    (home-page "https://gitlab.com/prashere/battinfo")
    (synopsis "battinfo is a CLI tool & nim library to get battery detials")
    (description "Battinfo is a CLI tool & nim library to get battery detials.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #3627 boxbuddy ---
;;; A Graphical Interface for Distrobox
;;; Source: https://www.dvlv.co.uk/BoxBuddyRS
;;; License: MIT
;;; Resolves: #3627 boxbuddy

(define-public boxbuddy
  (package
    (name "boxbuddy")
    (version "2.5.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.dvlv.co.uk/BoxBuddyRS/releases/download/v" version "/boxbuddy-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.dvlv.co.uk/BoxBuddyRS")
    (synopsis "graphical Interface for Distrobox")
    (description "A Graphical Interface for Distrobox.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #11146 breeze-enhanced-git ---
;;; A fork of KDE Breeze decoration with additional options
;;; Source: https://github.com/tsujan/BreezeEnhanced
;;; License: GPL3
;;; Resolves: #11146 breeze-enhanced-git

(define-public breeze-enhanced-git
  (package
    (name "breeze-enhanced-git")
    (version "r55.b3de585")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/tsujan/BreezeEnhanced")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/tsujan/BreezeEnhanced")
    (synopsis "fork of KDE Breeze decoration with additional options")
    (description "A fork of KDE Breeze decoration with additional options.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #8996 brrtfetch-git ---
;;; Render animated GIFs as ASCII in your fetcher of choice. Written in go.
;;; Source: https://github.com/ferrebarrat/brrtfetch
;;; License: MIT
;;; Resolves: #8996 brrtfetch-git

(define-public brrtfetch-git
  (package
    (name "brrtfetch-git")
    (version "r22.95233c2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ferrebarrat/brrtfetch")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/ferrebarrat/brrtfetch"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://github.com/ferrebarrat/brrtfetch")
    (synopsis "render animated GIFs as ASCII in your fetcher of choice")
    (description "Render animated GIFs as ASCII in your fetcher of choice. Written in go.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #3694 bsky-electron-git ---
;;; Bluesky Electron Client using system provided electron.
;;; Source: https://github.com/CaffeeLake/bsky-electron
;;; License: MPL-3.0
;;; Resolves: #3694 bsky-electron-git

(define-public bsky-electron-git
  (package
    (name "bsky-electron-git")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/CaffeeLake/bsky-electron")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/CaffeeLake/bsky-electron")
    (synopsis "bluesky Electron Client using system provided electron")
    (description "Bluesky Electron Client using system provided electron.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #1429 castblock-git ---
;;; CastBlock skips integrated youtube sponsors on all chromecasts on the network.
;;; Source: https://github.com/erdnaxeli/castblock
;;; License: MIT
;;; Resolves: #1429 castblock-git

(define-public castblock-git
  (package
    (name "castblock-git")
    (version "101.9f9b57c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/erdnaxeli/castblock")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/erdnaxeli/castblock")
    (synopsis "castBlock skips integrated youtube sponsors on all chromecasts on the network")
    (description "CastBlock skips integrated youtube sponsors on all chromecasts on the network.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #8844 compresso-bin ---
;;; A free and open-sourced cross-platform video compression app powered by FFmpeg.(Prebuilt version)
;;; Source: https://github.com/codeforreal1/compressO
;;; License: AGPL-3.0-only
;;; Resolves: #8844 compresso-bin

(define-public compresso-bin
  (package
    (name "compresso-bin")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/codeforreal1/compressO/releases/download/v" version "/compressO-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://github.com/codeforreal1/compressO")
    (synopsis "free and open-sourced cross-platform video compression app powered by FFmpeg")
    (description "A free and open-sourced cross-platform video compression app powered by FFmpeg.(Prebuilt version).  Packaged from the Arch User Repository.")
    (license license:agpl3)))

;;; --- #6772 cosmic-ext-applet-logomenu-git ---
;;; Logo Menu applet for the COSMIC™ desktop
;;; Source: https://github.com/cosmic-utils/cosmic-ext-applet-logomenu
;;; License: GPL-3.0-or-later
;;; Resolves: #6772 cosmic-ext-applet-logomenu-git

(define-public cosmic-ext-applet-logomenu-git
  (package
    (name "cosmic-ext-applet-logomenu-git")
    (version "v0.6.11.r7.g0cd4a39")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/cosmic-utils/cosmic-ext-applet-logomenu")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/cosmic-utils/cosmic-ext-applet-logomenu")
    (synopsis "logo Menu applet for the COSMIC™ desktop")
    (description "Logo Menu applet for the COSMIC™ desktop.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))
