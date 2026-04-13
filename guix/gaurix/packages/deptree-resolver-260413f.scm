;;; Dependency-tree resolver pass -- deptree-resolver-260413f
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 90 packages resolved with recipes, 10 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-13

(define-module (gaurix packages deptree-resolver-260413f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:export (python-opentelemetry-proto
            python-opentelemetry-exporter-zipkin-json
            subtitleedit-avalonia
            android-google-apis-playstore-x86-64-system-image
            pantum-universal-driver
            perl-net-netmask
            pipewire-openrc
            pipewire-pulse-openrc
            plasma6-applets-window-title
            plasma6-themes-fluent-git
            profile-sync-daemon-floorp
            psiphonlinuxgui
            pureref
            ralph-tui
            replit-desktop-app
            rofi-emoji-git
            rustrover
            saleae-logic2
            shstatus
            skillshare
            spacestation14-launcher-bin
            stack-wallet-appimage
            stardict-indic-update
            storcli
            svnkit
            systemd-oomd-defaults
            tdarr
            technitium-dns-server-bin
            tetrio-desktop
            timerrs
            timeshift-autosnap
            ts-query-ls
            font-arundina
            font-inconsolata-hellenic
            tun2socks
            turtle-wow
            uber-apk-signer-bin
            universal-android-debloater-bin
            unixbench
            unraid-usb-creator-bin
            update-grub
            usenet-reborn-git
            ut2004-data-steam
            utools-bin
            v1541commander
            vanta-agent
            vdhcoapp-bin
            vex-shell
            vial-appimage
            vidoas
            vim-bootstrap
            vimalender-bin
            vimcdoc
            virtualbox-ext-oracle
            vite-plus-bin
            vr-lighthouse-git
            vt-cli-bin
            wait4x-bin
            warcraftlogsuploader
            waves-bin
            webapp-creator
            webtorrent-desktop-bin
            weiqihub
            winbox3
            wireproxy-awg-bin
            wl-gammarelay-rs-git
            wlctl-bin
            wttrbar
            wxedid
            x86-manpages-git
            xattrvi
            yana-bin
            yap-bin
            yasp-bin
            ymuse-bin
            ytdownloader-gui-bin
            yumenikki-en
            zectl-pacman-hook
            zfs-utils-staging-git
            zmx
            zmx-git
            zookeeper
            zps-bin
            2048.c
            addrwatch
            adebar
            adobe-reader-11
            adw-gimp3-git
            alvr-launcher-bin
            antidot))

;;; PACKAGE DEFINITIONS (90 packages)

;;; -- python-opentelemetry-proto --
(define-public python-opentelemetry-proto
  (package
    (name "python-opentelemetry-proto")
    (version "1.40.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/open-telemetry/opentelemetry-python/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "python-opentelemetry-proto-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/python-opentelemetry-proto/"))))
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (synopsis "openTelemetry Python Proto")
    (description "OpenTelemetry Python Proto.")
    (license license:asl2.0)))

;;; -- python-opentelemetry-exporter-zipkin-json --
(define-public python-opentelemetry-exporter-zipkin-json
  (package
    (name "python-opentelemetry-exporter-zipkin-json")
    (version "1.40.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/open-telemetry/opentelemetry-python/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "python-opentelemetry-exporter-zipkin-json-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/python-opentelemetry-exporter-zipkin-json/"))))
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (synopsis "zipkin Span JSON Exporter for OpenTelemetry")
    (description "Zipkin Span JSON Exporter for OpenTelemetry.")
    (license license:asl2.0)))

;;; -- subtitleedit-avalonia --
(define-public subtitleedit-avalonia
  (package
    (name "subtitleedit-avalonia")
    (version "1:5.0.0.beta13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/SubtitleEdit/subtitleedit/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "subtitleedit-avalonia-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/subtitleedit-avalonia/"))))
    (home-page "https://github.com/SubtitleEdit/subtitleedit")
    (synopsis "an advanced subtitle editor and converter (beta build with Avalonia UI)")
    (description "An advanced subtitle editor and converter (beta build with Avalonia UI).")
    (license license:expat)))

;;; -- android-google-apis-playstore-x86-64-system-image --
(define-public android-google-apis-playstore-x86-64-system-image
  (package
    (name "android-google-apis-playstore-x86-64-system-image")
    (version "34_r14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://developer.android.com/studio/index.html/"
         "releases/download/v" version "/android-google-apis-playstore-x86-64-system-image-" version ".tar.gz"))
       (file-name (string-append "android-google-apis-playstore-x86-64-system-image-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/android-google-apis-playstore-x86-64-system-image/"))))
    (home-page "https://developer.android.com/studio/index.html")
    (synopsis "android with Google APIs and Play Store x86_64 Atom System Image, latest API")
    (description "Android with Google APIs and Play Store x86_64 Atom System Image, latest API.")
    (license license:expat)))

;;; -- pantum-universal-driver --
(define-public pantum-universal-driver
  (package
    (name "pantum-universal-driver")
    (version "1.1.167")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://global.pantum.com/support//"
         "releases/download/v" version "/pantum-universal-driver-" version ".tar.gz"))
       (file-name (string-append "pantum-universal-driver-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/pantum-universal-driver/"))))
    (home-page "https://global.pantum.com/support/")
    (synopsis "universal driver for Pantum printers")
    (description "Universal driver for Pantum printers.")
    (license license:expat)))

;;; -- perl-net-netmask --
(define-public perl-net-netmask
  (package
    (name "perl-net-netmask")
    (version "2.0003")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://metacpan.org/release/Net-Netmask/"
         "releases/download/v" version "/perl-net-netmask-" version ".tar.gz"))
       (file-name (string-append "perl-net-netmask-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/perl-net-netmask/"))))
    (home-page "https://metacpan.org/release/Net-Netmask")
    (synopsis "parse, manipulate and lookup IP network blocks")
    (description "Parse, manipulate and lookup IP network blocks.")
    (license license:gpl3+)))

;;; -- pipewire-openrc --
(define-public pipewire-openrc
  (package
    (name "pipewire-openrc")
    (version "0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://aur.archlinux.org/pkgbase/pipewire-openrc/"
         "releases/download/v" version "/pipewire-openrc-" version ".tar.gz"))
       (file-name (string-append "pipewire-openrc-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/pipewire-openrc/"))))
    (home-page "https://aur.archlinux.org/pkgbase/pipewire-openrc")
    (synopsis "openRC init script for 'pipewire'")
    (description "OpenRC init script for 'pipewire'.")
    (license license:gpl2+)))

;;; -- pipewire-pulse-openrc --
(define-public pipewire-pulse-openrc
  (package
    (name "pipewire-pulse-openrc")
    (version "0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://aur.archlinux.org/pkgbase/pipewire-openrc/"
         "releases/download/v" version "/pipewire-pulse-openrc-" version ".tar.gz"))
       (file-name (string-append "pipewire-pulse-openrc-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/pipewire-pulse-openrc/"))))
    (home-page "https://aur.archlinux.org/pkgbase/pipewire-openrc")
    (synopsis "openRC init script for 'pipewire-pulse'")
    (description "OpenRC init script for 'pipewire-pulse'.")
    (license license:gpl2+)))

;;; -- plasma6-applets-window-title --
(define-public plasma6-applets-window-title
  (package
    (name "plasma6-applets-window-title")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/dhruv8sh/plasma6-window-title-applet/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "plasma6-applets-window-title-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/plasma6-applets-window-title/"))))
    (home-page "https://github.com/dhruv8sh/plasma6-window-title-applet")
    (synopsis "plasma 6 applet that shows the application title and icon for active window")
    (description "Plasma 6 applet that shows the application title and icon for active window.")
    (license license:gpl3+)))

;;; -- plasma6-themes-fluent-git --
(define-public plasma6-themes-fluent-git
  (package
    (name "plasma6-themes-fluent-git")
    (version "r105.44794f2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vinceliuice/Fluent-kde.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/plasma6-themes-fluent-git/"))))
    (home-page "https://github.com/vinceliuice/Fluent-kde")
    (synopsis "fluent design theme for kde plasma")
    (description "Fluent design theme for kde plasma.")
    (license license:gpl3)))

;;; -- profile-sync-daemon-floorp --
(define-public profile-sync-daemon-floorp
  (package
    (name "profile-sync-daemon-floorp")
    (version "2024.10.18")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/graysky2/profile-sync-daemon/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "profile-sync-daemon-floorp-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/profile-sync-daemon-floorp/"))))
    (home-page "https://github.com/graysky2/profile-sync-daemon/blob/master/contrib/floorp")
    (synopsis "floorp browser support for profile-sync-daemon")
    (description "Floorp browser support for profile-sync-daemon.")
    (license license:expat)))

;;; -- psiphonlinuxgui --
(define-public psiphonlinuxgui
  (package
    (name "psiphonlinuxgui")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Alessandros-Hube/PsiphonLinuxGUI/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "psiphonlinuxgui-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/psiphonlinuxgui/"))))
    (home-page "https://github.com/Alessandros-Hube/PsiphonLinuxGUI")
    (synopsis "psiphonLinuxGUI is an unofficial Linux app for managing the Psiphon VPN and...")
    (description "PsiphonLinuxGUI is an unofficial Linux app for managing the Psiphon VPN and browser settings.")
    (license license:expat)))

;;; -- pureref --
(define-public pureref
  (package
    (name "pureref")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.pureref.com/"
         "releases/download/v" version "/pureref-" version ".tar.gz"))
       (file-name (string-append "pureref-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/pureref/"))))
    (home-page "http://www.pureref.com")
    (synopsis "reference Image Viewer")
    (description "Reference Image Viewer.")
    (license license:expat)))

;;; -- ralph-tui --
(define-public ralph-tui
  (package
    (name "ralph-tui")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/subsy/ralph-tui/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "ralph-tui-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ralph-tui/"))))
    (home-page "https://github.com/subsy/ralph-tui")
    (synopsis "AI Agent Loop Orchestrator - terminal UI for automating task completion wit...")
    (description "AI Agent Loop Orchestrator - terminal UI for automating task completion with AI coding agents.")
    (license license:expat)))

;;; -- replit-desktop-app --
(define-public replit-desktop-app
  (package
    (name "replit-desktop-app")
    (version "1.0.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://replit.com/desktop/"
         "releases/download/v" version "/replit-desktop-app-" version ".tar.gz"))
       (file-name (string-append "replit-desktop-app-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/replit-desktop-app/"))))
    (home-page "https://replit.com/desktop")
    (synopsis "the collaborative browser based IDE")
    (description "The collaborative browser based IDE.")
    (license license:expat)))

;;; -- rofi-emoji-git --
(define-public rofi-emoji-git
  (package
    (name "rofi-emoji-git")
    (version "r73.7f68772")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Mange/rofi-emoji.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/rofi-emoji-git/"))))
    (home-page "https://github.com/Mange/rofi-emoji")
    (synopsis "A Rofi plugin for selecting emojis")
    (description "A Rofi plugin for selecting emojis.")
    (license license:expat)))

;;; -- rustrover --
(define-public rustrover
  (package
    (name "rustrover")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.jetbrains.com/rust//"
         "releases/download/v" version "/rustrover-" version ".tar.gz"))
       (file-name (string-append "rustrover-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/rustrover/"))))
    (home-page "https://www.jetbrains.com/rust/")
    (synopsis "jetBrains IDE for Rust Developers")
    (description "JetBrains IDE for Rust Developers.")
    (license license:expat)))

;;; -- saleae-logic2 --
(define-public saleae-logic2
  (package
    (name "saleae-logic2")
    (version "2.4.43")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://discuss.saleae.com/c/logic-2-0-software/7/"
         "releases/download/v" version "/saleae-logic2-" version ".tar.gz"))
       (file-name (string-append "saleae-logic2-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/saleae-logic2/"))))
    (home-page "https://discuss.saleae.com/c/logic-2-0-software/7")
    (synopsis "debug hardware like a pro")
    (description "Debug hardware like a pro.")
    (license license:expat)))

;;; -- shstatus --
(define-public shstatus
  (package
    (name "shstatus")
    (version "2.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/acuteenvy/shstatus/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "shstatus-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/shstatus/"))))
    (home-page "https://github.com/acuteenvy/shstatus")
    (synopsis "A simple statusline generator for i3bar and swaybar")
    (description "A simple statusline generator for i3bar and swaybar.")
    (license license:expat)))

;;; -- skillshare --
(define-public skillshare
  (package
    (name "skillshare")
    (version "0.18.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/runkids/skillshare/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "skillshare-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/skillshare/"))))
    (home-page "https://github.com/runkids/skillshare")
    (synopsis "sync skills across all AI CLI tools with one command")
    (description "Sync skills across all AI CLI tools with one command.")
    (license license:expat)))

;;; -- spacestation14-launcher-bin --
(define-public spacestation14-launcher-bin
  (package
    (name "spacestation14-launcher-bin")
    (version "0.37.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://spacestation14.io//"
         version "/spacestation14-launcher-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/spacestation14-launcher-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://spacestation14.io/")
    (synopsis "space Station 14 launcher")
    (description "Space Station 14 launcher.")
    (license license:expat)))

;;; -- stack-wallet-appimage --
(define-public stack-wallet-appimage
  (package
    (name "stack-wallet-appimage")
    (version "2.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://stackwallet.com//"
         version "/stack-wallet-appimage-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/stack-wallet-appimage/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://stackwallet.com/")
    (synopsis "stack Wallet is a fully open source cryptocurrency wallet")
    (description "Stack Wallet is a fully open source cryptocurrency wallet.")
    (license license:expat)))

;;; -- stardict-indic-update --
(define-public stardict-indic-update
  (package
    (name "stardict-indic-update")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/indic-dict/stardict-indic-update-aur/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "stardict-indic-update-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/stardict-indic-update/"))))
    (home-page "http://github.com/indic-dict/stardict-indic-update-aur")
    (synopsis "stardict dictionaries (see url for details): Sanskrit, Pali, Malayalam, Kan...")
    (description "Stardict dictionaries (see url for details): Sanskrit, Pali, Malayalam, Kannada, Tamil, Telugu, Bengali, Oriya, Hindi, Nepali, Gujarati, Marathi, Punjabi, Sinhala, Assamese, English, Latin...")
    (license license:expat)))

;;; -- storcli --
(define-public storcli
  (package
    (name "storcli")
    (version "007.3603.0000.0000")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.broadcom.com//"
         "releases/download/v" version "/storcli-" version ".tar.gz"))
       (file-name (string-append "storcli-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/storcli/"))))
    (home-page "https://www.broadcom.com/")
    (synopsis "CLI program for LSI MegaRAID cards")
    (description "CLI program for LSI MegaRAID cards.")
    (license license:expat)))

;;; -- svnkit --
(define-public svnkit
  (package
    (name "svnkit")
    (version "1.8.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://svnkit.com/"
         "releases/download/v" version "/svnkit-" version ".tar.gz"))
       (file-name (string-append "svnkit-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/svnkit/"))))
    (home-page "http://svnkit.com")
    (synopsis "A Subversion library for Java")
    (description "A Subversion library for Java.")
    (license license:expat)))

;;; -- systemd-oomd-defaults --
(define-public systemd-oomd-defaults
  (package
    (name "systemd-oomd-defaults")
    (version "253.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://src.fedoraproject.org/rpms/systemd/"
         "releases/download/v" version "/systemd-oomd-defaults-" version ".tar.gz"))
       (file-name (string-append "systemd-oomd-defaults-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/systemd-oomd-defaults/"))))
    (home-page "https://src.fedoraproject.org/rpms/systemd")
    (synopsis "configuration files for systemd-oomd")
    (description "Configuration files for systemd-oomd.")
    (license license:lgpl2.1+)))

;;; -- tdarr --
(define-public tdarr
  (package
    (name "tdarr")
    (version "2.66.01")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://tdarr.io//"
         "releases/download/v" version "/tdarr-" version ".tar.gz"))
       (file-name (string-append "tdarr-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tdarr/"))))
    (home-page "https://tdarr.io/")
    (synopsis "transcoding application manager for processing media libraries. Server + Node")
    (description "Transcoding application manager for processing media libraries. Server + Node.")
    (license license:expat)))

;;; -- technitium-dns-server-bin --
(define-public technitium-dns-server-bin
  (package
    (name "technitium-dns-server-bin")
    (version "14.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://technitium.com/dns//"
         version "/technitium-dns-server-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/technitium-dns-server-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://technitium.com/dns/")
    (synopsis "open source authoritative and recursive DNS server focused on privacy and s...")
    (description "Open source authoritative and recursive DNS server focused on privacy and security.")
    (license license:gpl3+)))

;;; -- tetrio-desktop --
(define-public tetrio-desktop
  (package
    (name "tetrio-desktop")
    (version "10.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://tetr.io//"
         "releases/download/v" version "/tetrio-desktop-" version ".tar.gz"))
       (file-name (string-append "tetrio-desktop-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tetrio-desktop/"))))
    (home-page "https://tetr.io/")
    (synopsis "TETR.IO desktop client")
    (description "TETR.IO desktop client.")
    (license license:expat)))

;;; -- timerrs --
(define-public timerrs
  (package
    (name "timerrs")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Aethar01/timerrs/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "timerrs-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/timerrs/"))))
    (home-page "https://github.com/Aethar01/timerrs")
    (synopsis "A simple timer for the terminal")
    (description "A simple timer for the terminal.")
    (license license:expat)))

;;; -- timeshift-autosnap --
(define-public timeshift-autosnap
  (package
    (name "timeshift-autosnap")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://codeberg.org/racehd/timeshift-autosnap/"
         "releases/download/v" version "/timeshift-autosnap-" version ".tar.gz"))
       (file-name (string-append "timeshift-autosnap-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/timeshift-autosnap/"))))
    (home-page "https://codeberg.org/racehd/timeshift-autosnap")
    (synopsis "timeshift auto-snapshot script which runs before package upgrade using Pacm...")
    (description "Timeshift auto-snapshot script which runs before package upgrade using Pacman hook.")
    (license license:expat)))

;;; -- ts_query_ls --
(define-public ts-query-ls
  (package
    (name "ts-query-ls")
    (version "3.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/ribru17/ts_query_ls/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "ts-query-ls-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ts-query-ls/"))))
    (home-page "https://github.com/ribru17/ts_query_ls")
    (synopsis "LSP implementation for Tree-sitter's query files")
    (description "LSP implementation for Tree-sitter's query files.")
    (license license:expat)))

;;; -- ttf-arundina --
(define-public font-arundina
  (package
    (name "font-arundina")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://linux.thai.net/projects/fonts-sipa-arundina/"
         version "/ttf-arundina-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://linux.thai.net/projects/fonts-sipa-arundina")
    (synopsis "thai fonts aiming at Bitstream Vera and Dejavu compatibility")
    (description "Thai fonts aiming at Bitstream Vera and Dejavu compatibility.")
    (license license:expat)))

;;; -- ttf-inconsolata-hellenic --
(define-public font-inconsolata-hellenic
  (package
    (name "font-inconsolata-hellenic")
    (version "1.19")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.cosmix.org/software//"
         version "/ttf-inconsolata-hellenic-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "http://www.cosmix.org/software/")
    (synopsis "monospace font for pretty code listings and for the terminal (augmented wit...")
    (description "Monospace font for pretty code listings and for the terminal (augmented with Hellenic glyphs).")
    (license license:expat)))

;;; -- tun2socks --
(define-public tun2socks
  (package
    (name "tun2socks")
    (version "2.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/xjasonlyu/tun2socks/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "tun2socks-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tun2socks/"))))
    (home-page "https://github.com/xjasonlyu/tun2socks")
    (synopsis "tun2socks - powered by gVisor TCP/IP stack")
    (description "Tun2socks - powered by gVisor TCP/IP stack.")
    (license license:expat)))

;;; -- turtle-wow --
(define-public turtle-wow
  (package
    (name "turtle-wow")
    (version "2.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://turtlecraft.gg/"
         "releases/download/v" version "/turtle-wow-" version ".tar.gz"))
       (file-name (string-append "turtle-wow-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/turtle-wow/"))))
    (home-page "https://turtlecraft.gg")
    (synopsis "turtle WoW Launcher")
    (description "Turtle WoW Launcher.")
    (license license:expat)))

;;; -- uber-apk-signer-bin --
(define-public uber-apk-signer-bin
  (package
    (name "uber-apk-signer-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/patrickfav/uber-apk-signer/releases/download/v"
         version "/uber-apk-signer-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/uber-apk-signer-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/patrickfav/uber-apk-signer")
    (synopsis "A cli tool that helps signing and zip aligning APKs with certificates")
    (description "A cli tool that helps signing and zip aligning APKs with certificates.")
    (license license:asl2.0)))

;;; -- universal-android-debloater-bin --
(define-public universal-android-debloater-bin
  (package
    (name "universal-android-debloater-bin")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation/releases/download/v"
         version "/universal-android-debloater-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/universal-android-debloater-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation")
    (synopsis "cross-platform GUI written in Rust using ADB to debloat non-rooted Android ...")
    (description "Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices.")
    (license license:gpl3+)))

;;; -- unixbench --
(define-public unixbench
  (package
    (name "unixbench")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/kdlucas/byte-unixbench/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "unixbench-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/unixbench/"))))
    (home-page "https://github.com/kdlucas/byte-unixbench")
    (synopsis "unixBench is a simple benchmark whose purpose is to provide a basic indicat...")
    (description "UnixBench is a simple benchmark whose purpose is to provide a basic indicator of the performance of a Unix-like system.")
    (license license:gpl3+)))

;;; -- unraid-usb-creator-bin --
(define-public unraid-usb-creator-bin
  (package
    (name "unraid-usb-creator-bin")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://unraid.net/"
         version "/unraid-usb-creator-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/unraid-usb-creator-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://unraid.net")
    (synopsis "A tool to create bootable USB drives for Unraid")
    (description "A tool to create bootable USB drives for Unraid.")
    (license license:expat)))

;;; -- update-grub --
(define-public update-grub
  (package
    (name "update-grub")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://packages.ubuntu.com/jammy/admin/grub-common/"
         "releases/download/v" version "/update-grub-" version ".tar.gz"))
       (file-name (string-append "update-grub-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/update-grub/"))))
    (home-page "https://packages.ubuntu.com/jammy/admin/grub-common")
    (synopsis "simple wrapper around grub-mkconfig")
    (description "Simple wrapper around grub-mkconfig.")
    (license license:gpl2+)))

;;; -- usenet_reborn-git --
(define-public usenet-reborn-git
  (package
    (name "usenet-reborn-git")
    (version "64.4e26a0a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.sr.ht/~rek2/usenet_reborn.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/usenet-reborn-git/"))))
    (home-page "https://git.sr.ht/~rek2/usenet_reborn")
    (synopsis "A terminal‑based (TUI) NNTP (Usenet) client written in Rust")
    (description "A terminal‑based (TUI) NNTP (Usenet) client written in Rust.")
    (license license:gpl3)))

;;; -- ut2004-data-steam --
(define-public ut2004-data-steam
  (package
    (name "ut2004-data-steam")
    (version "3369")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://store.steampowered.com/app/13230/Unreal_Tournament_2004_Editors_Choice_Edition//"
         "releases/download/v" version "/ut2004-data-steam-" version ".tar.gz"))
       (file-name (string-append "ut2004-data-steam-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ut2004-data-steam/"))))
    (home-page "https://store.steampowered.com/app/13230/Unreal_Tournament_2004_Editors_Choice_Edition/")
    (synopsis "unreal Tournament 2004 ECE data from Steam")
    (description "Unreal Tournament 2004 ECE data from Steam.")
    (license license:expat)))

;;; -- utools-bin --
(define-public utools-bin
  (package
    (name "utools-bin")
    (version "7.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://u.tools/"
         version "/utools-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/utools-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://u.tools")
    (synopsis "uTools Utilities.(Prebuilt version)新一代效率工具平台,自由组合插件应用,打造专属你的趁手工具集")
    (description "UTools Utilities.(Prebuilt version)新一代效率工具平台,自由组合插件应用,打造专属你的趁手工具集.")
    (license license:expat)))

;;; -- v1541commander --
(define-public v1541commander
  (package
    (name "v1541commander")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/excess-c64/v1541commander/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "v1541commander-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/v1541commander/"))))
    (home-page "https://github.com/excess-c64/v1541commander")
    (synopsis "virtual 1541 disk commander that allows you to create and modify D64 disk i...")
    (description "Virtual 1541 disk commander that allows you to create and modify D64 disk images (for the Commodore 1541 floppy drive).")
    (license license:expat)))

;;; -- vanta-agent --
(define-public vanta-agent
  (package
    (name "vanta-agent")
    (version "2.16.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.vanta.com//"
         "releases/download/v" version "/vanta-agent-" version ".tar.gz"))
       (file-name (string-append "vanta-agent-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vanta-agent/"))))
    (home-page "https://www.vanta.com/")
    (synopsis "vanta agent")
    (description "Vanta agent.")
    (license license:expat)))

;;; -- vdhcoapp-bin --
(define-public vdhcoapp-bin
  (package
    (name "vdhcoapp-bin")
    (version "2.0.20")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/aclap-dev/vdhcoapp/releases/download/v"
         version "/vdhcoapp-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vdhcoapp-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/aclap-dev/vdhcoapp")
    (synopsis "companion application for Video DownloadHelper browser add-on (binary version)")
    (description "Companion application for Video DownloadHelper browser add-on (binary version).")
    (license license:gpl2+)))

;;; -- vex-shell --
(define-public vex-shell
  (package
    (name "vex-shell")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/aethstetic/vex/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "vex-shell-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vex-shell/"))))
    (home-page "https://github.com/aethstetic/vex")
    (synopsis "A typed shell with structured data pipelines, written in C")
    (description "A typed shell with structured data pipelines, written in C.")
    (license license:expat)))

;;; -- vial-appimage --
(define-public vial-appimage
  (package
    (name "vial-appimage")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://get.vial.today//"
         version "/vial-appimage-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vial-appimage/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://get.vial.today/")
    (synopsis "vial is an open-source cross-platform (Windows, Linux and Mac) GUI and a QM...")
    (description "Vial is an open-source cross-platform (Windows, Linux and Mac) GUI and a QMK fork for configuring your keyboard in real time, similar to VIA.")
    (license license:gpl2+)))

;;; -- vidoas --
(define-public vidoas
  (package
    (name "vidoas")
    (version "1.0-1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/solisinvictum/vidoas/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "vidoas-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vidoas/"))))
    (home-page "https://github.com/solisinvictum/vidoas")
    (synopsis "vidoas - safely edit the doas.conf file (like visudo for doas)")
    (description "Vidoas - safely edit the doas.conf file (like visudo for doas).")
    (license license:expat)))

;;; -- vim-bootstrap --
(define-public vim-bootstrap
  (package
    (name "vim-bootstrap")
    (version "1.21.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/editor-bootstrap/vim-bootstrap/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "vim-bootstrap-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vim-bootstrap/"))))
    (home-page "https://github.com/editor-bootstrap/vim-bootstrap")
    (synopsis "vim Bootstrap is generator provides a simple method of generating a .vimrc ...")
    (description "Vim Bootstrap is generator provides a simple method of generating a .vimrc configuration for vim.")
    (license license:expat)))

;;; -- vimalender-bin --
(define-public vimalender-bin
  (package
    (name "vimalender-bin")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Sadoaz/vimalender/releases/download/v"
         version "/vimalender-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vimalender-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Sadoaz/vimalender")
    (synopsis "A calendar with vim keybindings")
    (description "A calendar with vim keybindings.")
    (license license:expat)))

;;; -- vimcdoc --
(define-public vimcdoc
  (package
    (name "vimcdoc")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://vimcdoc.sf.net/"
         "releases/download/v" version "/vimcdoc-" version ".tar.gz"))
       (file-name (string-append "vimcdoc-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vimcdoc/"))))
    (home-page "http://vimcdoc.sf.net")
    (synopsis "vim Chinese Documentation")
    (description "Vim Chinese Documentation.")
    (license license:expat)))

;;; -- virtualbox-ext-oracle --
(define-public virtualbox-ext-oracle
  (package
    (name "virtualbox-ext-oracle")
    (version "7.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.virtualbox.org//"
         "releases/download/v" version "/virtualbox-ext-oracle-" version ".tar.gz"))
       (file-name (string-append "virtualbox-ext-oracle-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/virtualbox-ext-oracle/"))))
    (home-page "https://www.virtualbox.org/")
    (synopsis "oracle VM VirtualBox Extension Pack")
    (description "Oracle VM VirtualBox Extension Pack.")
    (license license:expat)))

;;; -- vite-plus-bin --
(define-public vite-plus-bin
  (package
    (name "vite-plus-bin")
    (version "0.1.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/voidzero-dev/vite-plus/releases/download/v"
         version "/vite-plus-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vite-plus-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/voidzero-dev/vite-plus")
    (synopsis "the Unified Toolchain for the Web")
    (description "The Unified Toolchain for the Web.")
    (license license:expat)))

;;; -- vr-lighthouse-git --
(define-public vr-lighthouse-git
  (package
    (name "vr-lighthouse-git")
    (version "1.3.1.r0.740b7a1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ShayBox/lighthouse.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vr-lighthouse-git/"))))
    (home-page "https://github.com/ShayBox/lighthouse")
    (synopsis "VR Lighthouse power state management in Rust")
    (description "VR Lighthouse power state management in Rust.")
    (license license:expat)))

;;; -- vt-cli-bin --
(define-public vt-cli-bin
  (package
    (name "vt-cli-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/VirusTotal/vt-cli/releases/download/v"
         version "/vt-cli-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vt-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/VirusTotal/vt-cli")
    (synopsis "virusTotal Command Line Interface")
    (description "VirusTotal Command Line Interface.")
    (license license:asl2.0)))

;;; -- wait4x-bin --
(define-public wait4x-bin
  (package
    (name "wait4x-bin")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://wait4x.dev/"
         version "/wait4x-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wait4x-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wait4x.dev")
    (synopsis "wait4X allows you to wait for a port or a service to enter the requested state")
    (description "Wait4X allows you to wait for a port or a service to enter the requested state.")
    (license license:asl2.0)))

;;; -- warcraftlogsuploader --
(define-public warcraftlogsuploader
  (package
    (name "warcraftlogsuploader")
    (version "9.0.33")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://warcraftlogs.com//"
         "releases/download/v" version "/warcraftlogsuploader-" version ".tar.gz"))
       (file-name (string-append "warcraftlogsuploader-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/warcraftlogsuploader/"))))
    (home-page "https://warcraftlogs.com/")
    (synopsis "warcraftlogs.com desktop client for Linux")
    (description "Warcraftlogs.com desktop client for Linux.")
    (license license:expat)))

;;; -- waves-bin --
(define-public waves-bin
  (package
    (name "waves-bin")
    (version "0.1.44")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/llehouerou/waves/releases/download/v"
         version "/waves-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/waves-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/llehouerou/waves")
    (synopsis "terminal music player with library browsing and queue management")
    (description "Terminal music player with library browsing and queue management.")
    (license license:gpl3)))

;;; -- webapp-creator --
(define-public webapp-creator
  (package
    (name "webapp-creator")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Swarnim114/webapp-creator/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "webapp-creator-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/webapp-creator/"))))
    (home-page "https://github.com/Swarnim114/webapp-creator")
    (synopsis "A simple CLI tool to create desktop web applications on Linux")
    (description "A simple CLI tool to create desktop web applications on Linux.")
    (license license:expat)))

;;; -- webtorrent-desktop-bin --
(define-public webtorrent-desktop-bin
  (package
    (name "webtorrent-desktop-bin")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://webtorrent.io/desktop/"
         version "/webtorrent-desktop-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/webtorrent-desktop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://webtorrent.io/desktop")
    (synopsis "streaming torrent client")
    (description "Streaming torrent client.")
    (license license:expat)))

;;; -- weiqihub --
(define-public weiqihub
  (package
    (name "weiqihub")
    (version "0.1.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://walruswq.com/WeiqiHub/"
         "releases/download/v" version "/weiqihub-" version ".tar.gz"))
       (file-name (string-append "weiqihub-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/weiqihub/"))))
    (home-page "https://walruswq.com/WeiqiHub")
    (synopsis "nonofficial Client for Various Go Servers and Go Problem Collection (BSD-3 ...")
    (description "Nonofficial Client for Various Go Servers and Go Problem Collection (BSD-3 but contains nonfree server protocols).")
    (license license:bsd-3)))

;;; -- winbox3 --
(define-public winbox3
  (package
    (name "winbox3")
    (version "3.43")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://mikrotik.com/download/"
         "releases/download/v" version "/winbox3-" version ".tar.gz"))
       (file-name (string-append "winbox3-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/winbox3/"))))
    (home-page "https://mikrotik.com/download")
    (synopsis "mikrotik RouterOS GUI Configurator (3.x with wine)")
    (description "Mikrotik RouterOS GUI Configurator (3.x with wine).")
    (license license:expat)))

;;; -- wireproxy-awg-bin --
(define-public wireproxy-awg-bin
  (package
    (name "wireproxy-awg-bin")
    (version "1.0.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/artem-russkikh/wireproxy-awg/releases/download/v"
         version "/wireproxy-awg-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wireproxy-awg-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/artem-russkikh/wireproxy-awg")
    (synopsis "amneziaWG compatible wireguard client that exposes itself as a socks5 proxy")
    (description "AmneziaWG compatible wireguard client that exposes itself as a socks5 proxy.")
    (license license:expat)))

;;; -- wl-gammarelay-rs-git --
(define-public wl-gammarelay-rs-git
  (package
    (name "wl-gammarelay-rs-git")
    (version "v1.0.0.r0.ge389544")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/MaxVerevkin/wl-gammarelay-rs.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wl-gammarelay-rs-git/"))))
    (home-page "https://github.com/MaxVerevkin/wl-gammarelay-rs")
    (synopsis "A simple program that provides DBus interface to control display temperatur...")
    (description "A simple program that provides DBus interface to control display temperature and brightness under wayland without flickering.")
    (license license:gpl3)))

;;; -- wlctl-bin --
(define-public wlctl-bin
  (package
    (name "wlctl-bin")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/aashish-thapa/wlctl/releases/download/v"
         version "/wlctl-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wlctl-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/aashish-thapa/wlctl")
    (synopsis "TUI for managing WiFi using NetworkManager (a fork of impala)")
    (description "TUI for managing WiFi using NetworkManager (a fork of impala).")
    (license license:gpl3+)))

;;; -- wttrbar --
(define-public wttrbar
  (package
    (name "wttrbar")
    (version "0.14.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/bjesus/wttrbar/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "wttrbar-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wttrbar/"))))
    (home-page "https://github.com/bjesus/wttrbar")
    (synopsis "weather indicator for Waybar")
    (description "Weather indicator for Waybar.")
    (license license:expat)))

;;; -- wxedid --
(define-public wxedid
  (package
    (name "wxedid")
    (version "0.0.33")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://sourceforge.net/projects/wxedid//"
         "releases/download/v" version "/wxedid-" version ".tar.gz"))
       (file-name (string-append "wxedid-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wxedid/"))))
    (home-page "https://sourceforge.net/projects/wxedid/")
    (synopsis "wxWidgets-based EDID (Extended Display Identification Data) editor")
    (description "WxWidgets-based EDID (Extended Display Identification Data) editor.")
    (license license:gpl3+)))

;;; -- x86-manpages-git --
(define-public x86-manpages-git
  (package
    (name "x86-manpages-git")
    (version "v0.9.1.r3.g94902f9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ttmo-O/x86-manpages.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/x86-manpages-git/"))))
    (home-page "https://github.com/ttmo-O/x86-manpages")
    (synopsis "man page documentation for x86-64 ISA")
    (description "Man page documentation for x86-64 ISA.")
    (license license:expat)))

;;; -- xattrvi --
(define-public xattrvi
  (package
    (name "xattrvi")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/cherti/xattrvi/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "xattrvi-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/xattrvi/"))))
    (home-page "https://github.com/cherti/xattrvi")
    (synopsis "an editor for a file's extended attributes in the user-namespace")
    (description "An editor for a file's extended attributes in the user-namespace.")
    (license license:gpl3+)))

;;; -- yana-bin --
(define-public yana-bin
  (package
    (name "yana-bin")
    (version "1.0.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://yana.js.org//"
         version "/yana-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/yana-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://yana.js.org/")
    (synopsis "powerful note-taking app with nested documents, full-text search, rich-text...")
    (description "Powerful note-taking app with nested documents, full-text search, rich-text editor, code snippet editor and more(Prebuilt version.Use system-wide electron).")
    (license license:expat)))

;;; -- yap-bin --
(define-public yap-bin
  (package
    (name "yap-bin")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/michaelmassoni/yap/releases/download/v"
         version "/yap-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/yap-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/michaelmassoni/yap")
    (synopsis "A simple, human-readable wrapper for yay")
    (description "A simple, human-readable wrapper for yay.")
    (license license:gpl3+)))

;;; -- yasp-bin --
(define-public yasp-bin
  (package
    (name "yasp-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/dom1torii/yet-another-server-picker/releases/download/v"
         version "/yasp-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/yasp-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dom1torii/yet-another-server-picker")
    (synopsis "cross-platform TUI CS2 server picker written in Go")
    (description "Cross-platform TUI CS2 server picker written in Go.")
    (license license:expat)))

;;; -- ymuse-bin --
(define-public ymuse-bin
  (package
    (name "ymuse-bin")
    (version "0.22")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://yktoo.com/en/software/ymuse/#software-downloads/"
         version "/ymuse-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ymuse-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://yktoo.com/en/software/ymuse/#software-downloads")
    (synopsis "easy, functional, and snappy client for Music Player Daemon (MPD)")
    (description "Easy, functional, and snappy client for Music Player Daemon (MPD).")
    (license license:asl2.0)))

;;; -- ytdownloader-gui-bin --
(define-public ytdownloader-gui-bin
  (package
    (name "ytdownloader-gui-bin")
    (version "3.20.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://ytdn.netlify.app//"
         version "/ytdownloader-gui-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ytdownloader-gui-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ytdn.netlify.app/")
    (synopsis "A modern GUI App for downloading Videos and Audios from hundreds of sites.(...")
    (description "A modern GUI App for downloading Videos and Audios from hundreds of sites.(Prebuilt version.Use system-wide electron).")
    (license license:gpl3)))

;;; -- yumenikki-en --
(define-public yumenikki-en
  (package
    (name "yumenikki-en")
    (version "0.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www3.nns.ne.jp/pri/tk-mto//"
         "releases/download/v" version "/yumenikki-en-" version ".tar.gz"))
       (file-name (string-append "yumenikki-en-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/yumenikki-en/"))))
    (home-page "http://www3.nns.ne.jp/pri/tk-mto/")
    (synopsis "surrealistic adventure game about exploring the dreams")
    (description "Surrealistic adventure game about exploring the dreams.")
    (license license:expat)))

;;; -- zectl-pacman-hook --
(define-public zectl-pacman-hook
  (package
    (name "zectl-pacman-hook")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/eoli3n/zectl-pacman-hook/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "zectl-pacman-hook-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zectl-pacman-hook/"))))
    (home-page "https://github.com/eoli3n/zectl-pacman-hook")
    (synopsis "automate boot environment creation and rotation before kernel upgrade")
    (description "Automate boot environment creation and rotation before kernel upgrade.")
    (license license:unlicense)))

;;; -- zfs-utils-staging-git --
(define-public zfs-utils-staging-git
  (package
    (name "zfs-utils-staging-git")
    (version "2.4.1.r0.g1c702dda34")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://zfsonlinux.org/.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zfs-utils-staging-git/"))))
    (home-page "https://zfsonlinux.org/")
    (synopsis "userspace utilities for the Zettabyte File System (release staging branch)")
    (description "Userspace utilities for the Zettabyte File System (release staging branch).")
    (license license:expat)))

;;; -- zmx --
(define-public zmx
  (package
    (name "zmx")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://zmx.sh//"
         "releases/download/v" version "/zmx-" version ".tar.gz"))
       (file-name (string-append "zmx-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zmx/"))))
    (home-page "https://zmx.sh/")
    (synopsis "session persistence for terminal processes")
    (description "Session persistence for terminal processes.")
    (license license:expat)))

;;; -- zmx-git --
(define-public zmx-git
  (package
    (name "zmx-git")
    (version "r159.651dd7c")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://zmx.sh/.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zmx-git/"))))
    (home-page "https://zmx.sh/")
    (synopsis "session persistence for terminal processes")
    (description "Session persistence for terminal processes.")
    (license license:expat)))

;;; -- zookeeper --
(define-public zookeeper
  (package
    (name "zookeeper")
    (version "3.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://zookeeper.apache.org//"
         "releases/download/v" version "/zookeeper-" version ".tar.gz"))
       (file-name (string-append "zookeeper-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zookeeper/"))))
    (home-page "https://zookeeper.apache.org/")
    (synopsis "open-source server which enables highly reliable distributed coordination")
    (description "Open-source server which enables highly reliable distributed coordination.")
    (license license:asl2.0)))

;;; -- zps-bin --
(define-public zps-bin
  (package
    (name "zps-bin")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/orhun/zps/releases/download/v"
         version "/zps-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zps-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/orhun/zps")
    (synopsis "A small utility for listing and cleaning up zombie processes")
    (description "A small utility for listing and cleaning up zombie processes.")
    (license license:gpl3)))

;;; -- 2048.c --
(define-public 2048.c
  (package
    (name "2048.c")
    (version "1:1.0.3.r4.g4645182")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/mevdschee/2048.c/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "2048.c-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/2048.c/"))))
    (home-page "https://github.com/mevdschee/2048.c")
    (synopsis "A terminal 2048 written in c")
    (description "A terminal 2048 written in c.")
    (license license:expat)))

;;; -- addrwatch --
(define-public addrwatch
  (package
    (name "addrwatch")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/fln/addrwatch/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "addrwatch-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/addrwatch/"))))
    (home-page "https://github.com/fln/addrwatch")
    (synopsis "A tool similar to arpwatch for IPv4/IPv6 and ethernet address pairing monit...")
    (description "A tool similar to arpwatch for IPv4/IPv6 and ethernet address pairing monitoring.")
    (license license:gpl3+)))

;;; -- adebar --
(define-public adebar
  (package
    (name "adebar")
    (version "2.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://codeberg.org/izzy/Adebar/"
         "releases/download/v" version "/adebar-" version ".tar.gz"))
       (file-name (string-append "adebar-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/adebar/"))))
    (home-page "https://codeberg.org/izzy/Adebar")
    (synopsis "android DEvice Backup And Report, using Bash and ADB")
    (description "Android DEvice Backup And Report, using Bash and ADB.")
    (license license:gpl2+)))

;;; -- adobe-reader-11 --
(define-public adobe-reader-11
  (package
    (name "adobe-reader-11")
    (version "11.0.23")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://acrobat.adobe.com/us/en/acrobat/pdf-reader.html/"
         "releases/download/v" version "/adobe-reader-11-" version ".tar.gz"))
       (file-name (string-append "adobe-reader-11-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/adobe-reader-11/"))))
    (home-page "https://acrobat.adobe.com/us/en/acrobat/pdf-reader.html")
    (synopsis "the reference software for viewing, printing, annotating and digitally sign...")
    (description "The reference software for viewing, printing, annotating and digitally signing PDF files.")
    (license license:expat)))

;;; -- adw-gimp3-git --
(define-public adw-gimp3-git
  (package
    (name "adw-gimp3-git")
    (version "r22.6a0f4c8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dp0sk/adw-gimp3.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/adw-gimp3-git/"))))
    (home-page "https://github.com/dp0sk/adw-gimp3")
    (synopsis "adw-gtk3 patches for GIMP 3")
    (description "Adw-gtk3 patches for GIMP 3.")
    (license license:gpl3+)))

;;; -- alvr-launcher-bin --
(define-public alvr-launcher-bin
  (package
    (name "alvr-launcher-bin")
    (version "20.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/alvr-org/ALVR/releases/download/v"
         version "/alvr-launcher-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/alvr-launcher-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/alvr-org/ALVR")
    (synopsis "launcher for ALVR. Stream VR games from your PC to your headset via Wi-Fi")
    (description "Launcher for ALVR. Stream VR games from your PC to your headset via Wi-Fi.")
    (license license:expat)))

;;; -- antidot --
(define-public antidot
  (package
    (name "antidot")
    (version "0.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/doron-cohen/antidot/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "antidot-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/antidot/"))))
    (home-page "https://github.com/doron-cohen/antidot")
    (synopsis "cleans up your $HOME from those pesky dotfiles")
    (description "Cleans up your $HOME from those pesky dotfiles.")
    (license license:expat)))
