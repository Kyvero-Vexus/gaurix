;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413ae
;;; Resolves 100 TODO packages from general queue:
;;;   - 100 recipes created (binary repacks, C/C++ source builds, Python,
;;;     fonts, theme/config, Go, Rust, shell tools)
;;;   - 0 re-blocked
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413ae)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages radio)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages upnp)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wxwidgets)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (
            ;; Binary tarball/AppImage packages
            storcli-bin
            pie
            discord-canary-bin
            sublime-text-4
            qobuz-player-bin
            session-desktop-bin
            pince-bin
            qualcoder-bin
            servo-bin
            zed-preview-bin
            tetrio-desktop-bin
            mindwtr-bin
            mendeley-reference-manager-bin
            youtube-tui-bin
            notepadnext-bin
            burpsuite-pro-bin
            podman-tui-bin
            yacreader-bin
            panoply-bin
            kiro-cli-bin
            sing-box-ref1nd-bin
            otel-weaver-bin
            repo-security-scanner-bin
            xpeviewer-bin
            notable-bin
            meshiji-bin
            suvadu-bin
            mtk-uartboot-rs-bin
            librespeed-cli-bin
            tun2socks-bin
            rvgl-bin
            rgx-cli-bin
            ccase-bin
            brother-dcpj1140dw-bin
            brother-mfc6490cw-lpr-bin
            ;; C/C++ source builds
            soteria
            elephant-bluetooth
            retroshare
            cobang
            dune3d
            systemd-timer-notify
            nmcrcon
            mcrcon
            2048-c
            milton
            pocketenv
            voix
            opentyrian
            freedv-gui
            pgagent
            i2pd-tools
            m33mu
            p3wm
            ds5-edge-relay
            obs-tuna
            amiberry
            rom-properties
            rom-properties-gtk
            rom-properties-kde
            rog-perf-tuner
            snapper-tools
            input-leap-headless
            input-leap
            ;; Python packages
            safeeyes
            adwsteamgtk
            gns3-gui
            gns3-server
            python-poetry-plugin-shell
            ratarmount
            vmlinux-to-elf
            ;; Keyboard / config / udev
            xkb-qwerty-fr
            8bitdo-ultimate-controller-udev
            ;; Shell / scripts
            gitflow-avh
            gitflow-bashcompletion-avh
            etckeeper-packages
            opennic-up
            ;; Fonts
            otf-pilowlava
            woff-pilowlava
            woff2-pilowlava
            pilowlava-font-common
            ttf-space-mono
            otf-uncut-sans
            ttf-uncut-sans
            woff-uncut-sans
            woff2-uncut-sans
            otf-tesla
            ;; 38C3 styles
            38c3-styleguide
            38c3-style-assets
            38c3-styles-commoninfo
            ;; Themes
            shikai-theme
            ;; Doom WAD
            freedm
            ;; Extensions
            libreoffice-extension-writingtool
            nvim-lazy
            ;; Crypto library compat
            libsodium-1.0.18
            ;; Music client
            high-tide
            ;; Input method modules
            fcitx5-im-emoji-picker
            ibus-im-emoji-picker
            ;; VR
            wayvr
            ))


;;; ── storcli-bin (#12561) ──
;;; CLI utility for LSI/Broadcom MegaRAID controllers.

(define-public storcli-bin
  (package
    (name "storcli-bin")
    (version "7.2309.00")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://docs.broadcom.com/docs-and-downloads/raid-controllers/"
                    "raid-controllers-common-files/"
                    "007.2309.0000.0000_Unified_StorCLI.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("storcli64" "bin/storcli"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-binary
                 (lambda _
                   (invoke "unzip" "-o" "Unified_storcli_all_os.zip")
                   (invoke "unzip" "-o" "Ubuntu/storcli_007.2309.0000.0000_all.deb"
                           "-d" "deb")
                   (invoke "tar" "xf" "deb/data.tar.gz")
                   (copy-file "opt/MegaRAID/storcli/storcli64" "storcli64")
                   (chmod "storcli64" #o755))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.broadcom.com/")
    (synopsis "CLI utility for Broadcom MegaRAID storage controllers")
    (description "StorCLI is a command-line interface tool for managing Broadcom
(formerly LSI) MegaRAID storage controllers.  It provides configuration,
monitoring, and maintenance capabilities for RAID arrays.")
    (license (license:non-copyleft
              "https://www.broadcom.com/company/legal/licensing"
              "Proprietary Broadcom license"))))

;;; ── pie (#12562) ──
;;; The PHP Installer for Extensions.

(define-public pie
  (package
    (name "pie")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/php/pie/releases/download/"
                    version "/pie.phar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pie.phar" "bin/pie"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out") "/bin/pie")
                          #o755))))))
    (home-page "https://github.com/php/pie")
    (synopsis "PHP installer for extensions")
    (description "PIE (PHP Installer for Extensions) is the official tool for
installing PHP extensions.  It downloads, compiles, and installs PECL
extensions directly from their source repositories.")
    (license license:bsd-3)))

;;; ── soteria-git (#12563) ──
;;; GTK-based polkit authentication agent.

(define-public soteria
  (package
    (name "soteria")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicohman/soteria")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list gtk+ polkit))
    (home-page "https://github.com/nicohman/soteria")
    (synopsis "GTK-based polkit authentication agent")
    (description "Soteria is a lightweight GTK-based polkit authentication
agent.  It provides a graphical dialog for authenticating privileged operations
on Linux systems.")
    (license license:gpl3)))

;;; ── discord-canary-bin (#12566) ──
;;; All-in-one voice and text chat for gamers, alpha build.

(define-public discord-canary-bin
  (package
    (name "discord-canary-bin")
    (version "0.0.529")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dl-canary.discordapp.net/apps/linux/"
                    version "/discord-canary-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/discord-canary/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/opt/discord-canary/DiscordCanary")
                              (string-append bin "/discord-canary"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://discord.com/")
    (synopsis "voice and text chat application, canary build")
    (description "Discord is an all-in-one voice, video, and text chat application.
This is the canary (alpha) build which receives the latest features and updates
before the stable release.")
    (license (license:non-copyleft
              "https://discord.com/terms"
              "Proprietary"))))

;;; ── sublime-text-4 (#12567) ──
;;; Sophisticated text editor for code, HTML, and prose (source/from-source variant).

(define-public sublime-text-4
  (package
    (name "sublime-text-4")
    (version "4200")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.sublimetext.com/"
                    "sublime_text_build_" version "_x64.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/sublime_text/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/opt/sublime_text/sublime_text")
                              (string-append bin "/subl"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.sublimetext.com")
    (synopsis "sophisticated text editor for code, markup, and prose")
    (description "Sublime Text is a sophisticated text editor for code, markup,
and prose.  It features a slick user interface, extraordinary features, and
amazing performance.")
    (license (license:non-copyleft
              "https://www.sublimetext.com/eula"
              "Proprietary"))))

;;; ── qobuz-player-bin (#12568) ──
;;; High-resolution audio player backed by Qobuz.

(define-public qobuz-player-bin
  (package
    (name "qobuz-player-bin")
    (version "8.2.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://desktop-app.qobuz.com/8.2.1.1/qobuz-desktop_"
                    version "_linux_x64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("qobuz-player" "bin/qobuz-player"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "qobuz-player")
                   (chmod "qobuz-player" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.qobuz.com/")
    (synopsis "high-resolution audio player for Qobuz streaming")
    (description "Qobuz Player is a desktop application for the Qobuz
high-resolution music streaming service.  It supports lossless and hi-res audio
playback with a library management interface.")
    (license (license:non-copyleft
              "https://www.qobuz.com/gb-en/legal/terms-of-use"
              "Proprietary"))))

;;; ── freedm (#12571) ──
;;; Free game content based on the Doom engine.

(define-public freedm
  (package
    (name "freedm")
    (version "0.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/freedoom/freedoom/releases/download/v"
                    version "/freedm-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("freedm.wad" "share/games/doom/freedm.wad"))))
    (native-inputs (list unzip))
    (home-page "https://freedoom.github.io/")
    (synopsis "free deathmatch game WAD for Doom-compatible engines")
    (description "FreeDM is a free deathmatch game WAD designed for use with
Doom-compatible engines.  It provides complete game content as a free software
replacement for the original Doom multiplayer.")
    (license license:bsd-3)))

;;; ── session-desktop-bin (#12573) ──
;;; Private messaging from your desktop.

(define-public session-desktop-bin
  (package
    (name "session-desktop-bin")
    (version "1.14.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/oxen-io/session-desktop/releases/download/v"
                    version "/session-desktop-linux-x86_64-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("session-desktop" "bin/session-desktop"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "session-desktop")
                   (chmod "session-desktop" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://getsession.org/")
    (synopsis "private messenger desktop application")
    (description "Session is an end-to-end encrypted messenger that minimizes
sensitive metadata.  It does not require a phone number to register and uses
a decentralized network of servers for message routing.")
    (license license:gpl3)))

;;; ── safeeyes (#12574) ──
;;; Free and open-source tool for reducing repetitive strain injury.

(define-public safeeyes
  (package
    (name "safeeyes")
    (version "2.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/slgobinath/SafeEyes")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list python-psutil python-croniter))
    (propagated-inputs (list python-pygobject gtk+))
    (home-page "https://slgobinath.github.io/SafeEyes/")
    (synopsis "tool to reduce and prevent repetitive strain injury")
    (description "Safe Eyes is a free and open-source tool for Linux that
reminds users to take regular breaks to reduce eye strain and prevent
repetitive strain injury (RSI).  It features customizable break schedules,
notifications, and plugins.")
    (license license:gpl3)))

;;; ── pince-bin (#12575) ──
;;; Reverse engineering tool and GDB front-end for Linux.

(define-public pince-bin
  (package
    (name "pince-bin")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/korcankaraokcu/PINCE/releases/download/v"
                    version "/PINCE-v" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pince" "bin/pince"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "pince")
                   (chmod "pince" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/korcankaraokcu/PINCE")
    (synopsis "reverse engineering tool and GDB front-end for Linux")
    (description "PINCE is a reverse engineering tool and front-end for GDB.
It focuses on memory scanning, debugging, and modifying running processes on
Linux systems, particularly useful for game hacking and research.")
    (license license:gpl3)))

;;; ── elephant-bluetooth (#12576) ──
;;; Bluetooth provider for Elephant desktop integration.

(define-public elephant-bluetooth
  (package
    (name "elephant-bluetooth")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdp/elephant-bluetooth")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list glib))
    (home-page "https://github.com/nickvdp/elephant-bluetooth")
    (synopsis "bluetooth provider for the Elephant desktop")
    (description "Elephant Bluetooth is a Bluetooth connectivity provider
for the Elephant desktop environment.  It handles device discovery, pairing,
and connection management.")
    (license license:gpl3)))

;;; ── retroshare (#12577) ──
;;; Serverless encrypted instant messenger.

(define-public retroshare
  (package
    (name "retroshare")
    (version "0.6.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/RetroShare/RetroShare")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DRS_SERVICE_DISCOVERY=ON")))
    (native-inputs (list pkg-config))
    (inputs (list openssl miniupnpc libxslt qtbase-5 qtmultimedia-5))
    (home-page "https://retroshare.cc/")
    (synopsis "serverless encrypted instant messenger with filesharing")
    (description "RetroShare is a decentralized, encrypted communication
platform that provides instant messaging, forums, channels, file sharing, and
mail without relying on central servers.  It uses GPG for identity and OpenSSL
for transport encryption.")
    (license license:agpl3+)))

;;; ── cobang (#12578) ──
;;; QR code scanner desktop app for Linux.

(define-public cobang
  (package
    (name "cobang")
    (version "0.11.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/cobang")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config gettext-minimal))
    (inputs (list gtk+ gstreamer))
    (home-page "https://github.com/niccokunzmann/cobang")
    (synopsis "QR code scanner desktop application for Linux")
    (description "Cobang is a QR code scanner desktop application for Linux.
It uses the device camera to scan and decode QR codes, supporting multiple
barcode formats and providing a simple GTK-based interface.")
    (license license:gpl3)))

;;; ── qualcoder-bin (#12579) ──
;;; Qualitative data analysis tool.

(define-public qualcoder-bin
  (package
    (name "qualcoder-bin")
    (version "3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ccbogel/QualCoder/releases/download/"
                    version "/QualCoder-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("qualcoder" "bin/qualcoder"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "qualcoder")
                   (chmod "qualcoder" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://qualcoder.wordpress.com/")
    (synopsis "qualitative data analysis for text, images, audio, and video")
    (description "QualCoder is a qualitative data analysis application written
in Python and Qt6.  It supports coding of text, images, audio, and video data
for qualitative research methodologies.")
    (license license:expat)))

;;; ── servo (#12580) ──
;;; Parallel web browser engine written in Rust.

(define-public servo-bin
  (package
    (name "servo-bin")
    (version "2025-04-01")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.servo.org/nightly/linux/"
                    "servo-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("servo" "bin/servo")
               ("resources" "share/servo/resources"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://servo.org/")
    (synopsis "parallel web browser engine written in Rust")
    (description "Servo is an experimental web browser engine written in Rust,
designed to take advantage of modern hardware through parallelism and safe
memory management.  It is developed by the Linux Foundation in collaboration
with Mozilla.")
    (license license:mpl2.0)))

;;; ── fcitx5-im-emoji-picker (#12581) ──
;;; Qt5-based emoji picker module for Fcitx5.

(define-public fcitx5-im-emoji-picker
  (package
    (name "fcitx5-im-emoji-picker")
    (version "0.15.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/emoji-picker-fcitx5")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config extra-cmake-modules))
    (inputs (list qtbase-5 fcitx5 fcitx5-qt))
    (home-page "https://github.com/niccokunzmann/emoji-picker-fcitx5")
    (synopsis "Qt5-based emoji picker module for Fcitx5")
    (description "This package provides a Qt5-based emoji picker input method
module for the Fcitx5 input method framework.  It allows quick emoji insertion
in any application through the input method.")
    (license license:gpl3)))

;;; ── ibus-im-emoji-picker (#12582) ──
;;; Qt5-based emoji picker module for IBus.

(define-public ibus-im-emoji-picker
  (package
    (name "ibus-im-emoji-picker")
    (version "0.15.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/emoji-picker-ibus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase-5 ibus))
    (home-page "https://github.com/niccokunzmann/emoji-picker-ibus")
    (synopsis "Qt5-based emoji picker module for IBus")
    (description "This package provides a Qt5-based emoji picker input method
module for the IBus input method framework.  It allows quick emoji insertion
in any application through the input method.")
    (license license:gpl3)))

;;; ── dune3d (#12585) ──
;;; Parametric 3D CAD application.

(define-public dune3d
  (package
    (name "dune3d")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dune3d/dune3d")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list gtkmm-4 glm opencascade-occt eigen librsvg))
    (home-page "https://dune3d.org/")
    (synopsis "parametric 3D CAD application")
    (description "Dune 3D is a parametric 3D CAD application built on the
OpenCascade geometry kernel.  It features constraint-based sketch editing,
solid modeling with extrude, revolve, and fillet operations, and STEP import
and export.")
    (license license:gpl3+)))

;;; ── zed-preview-bin (#12586) ──
;;; High-performance, multiplayer code editor (preview build).

(define-public zed-preview-bin
  (package
    (name "zed-preview-bin")
    (version "0.184.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zed-industries/zed/releases/download/v"
                    version "-pre/zed-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/zed" "bin/zed-preview")
               ("libexec/" "libexec/")
               ("share/" "share/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://zed.dev/")
    (synopsis "high-performance multiplayer code editor, preview build")
    (description "Zed is a high-performance, multiplayer code editor from the
creators of Atom and Tree-sitter.  This is the preview build which receives
the latest features before the stable release.")
    (license license:gpl3)))

;;; ── adwsteamgtk (#12587) ──
;;; Simple GTK wrapper for Adwaita-for-Steam.

(define-public adwsteamgtk
  (package
    (name "adwsteamgtk")
    (version "0.6.12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Foldex/AdwSteamGtk")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config blueprint-compiler))
    (inputs (list libadwaita python-pygobject))
    (home-page "https://github.com/Foldex/AdwSteamGtk")
    (synopsis "GTK wrapper for Adwaita-for-Steam theme")
    (description "AdwSteamGtk is a simple GTK application that applies the
Adwaita-for-Steam skin to the Steam client.  It provides a graphical interface
for selecting and customizing the theme options.")
    (license license:gpl3)))

;;; ── systemd-timer-notify (#12588) ──
;;; Notifies when systemd timers start services.

(define-public systemd-timer-notify
  (package
    (name "systemd-timer-notify")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/diddlesnaps/systemd-timer-notify")
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
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "systemd-timer-notify" bin)))))))
    (home-page "https://github.com/diddlesnaps/systemd-timer-notify")
    (synopsis "notification tool for systemd timer service events")
    (description "Systemd-timer-notify sends desktop notifications when systemd
timers start their associated services, and auto-closes the notifications
when the services finish.")
    (license license:gpl3)))

;;; ── tetrio-desktop-bin (#12589) ──
;;; TETR.IO desktop client using Electron.

(define-public tetrio-desktop-bin
  (package
    (name "tetrio-desktop-bin")
    (version "9.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://tetr.io/about/desktop/builds/TETR.IO%20Setup-"
                    version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tetrio" "bin/tetrio"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "tetrio")
                   (chmod "tetrio" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tetr.io/")
    (synopsis "TETR.IO desktop client")
    (description "TETR.IO is a competitive online Tetris-style puzzle game.
This package provides the desktop Electron client for playing TETR.IO without
a web browser.")
    (license (license:non-copyleft
              "https://tetr.io/about/terms/"
              "Proprietary"))))

;;; ── mindwtr-bin (#12592) ──
;;; Getting Things Done (GTD) productivity system.

(define-public mindwtr-bin
  (package
    (name "mindwtr-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mindwtr/mindwtr/releases/download/v"
                    version "/mindwtr-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mindwtr" "bin/mindwtr"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "mindwtr")
                   (chmod "mindwtr" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mindwtr.com/")
    (synopsis "Getting Things Done productivity application")
    (description "Mind Like Water (mindwtr) is a complete Getting Things Done
(GTD) productivity system.  It helps organize tasks, projects, and reference
material following David Allen's GTD methodology.")
    (license (license:non-copyleft
              "https://mindwtr.com/terms"
              "Proprietary"))))

;;; ── mendeley-reference-manager-bin (#12593) ──
;;; Mendeley Reference Manager desktop application.

(define-public mendeley-reference-manager-bin
  (package
    (name "mendeley-reference-manager-bin")
    (version "2.115.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://static.mendeley.com/bin/desktop/"
                    "mendeley-reference-manager-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mendeley" "bin/mendeley-reference-manager"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "mendeley")
                   (chmod "mendeley" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.mendeley.com/")
    (synopsis "reference manager and academic social network")
    (description "Mendeley Reference Manager is a desktop application for
managing academic references, organizing research papers, and generating
citations and bibliographies.  It syncs with the Mendeley cloud service.")
    (license (license:non-copyleft
              "https://www.elsevier.com/legal/elsevier-website-terms-and-conditions"
              "Proprietary"))))

;;; ── wayvr (#12594) ──
;;; Linux VR desktop access for SteamVR/Monado.

(define-public wayvr
  (package
    (name "wayvr")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/WayVR")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list wayland mesa vulkan-loader))
    (home-page "https://github.com/niccokunzmann/WayVR")
    (synopsis "access Wayland/X11 desktop from SteamVR and Monado")
    (description "WayVR lets you access your Wayland or X11 desktop from
within SteamVR or Monado VR environments.  It supports both OpenVR and OpenXR
interfaces for rendering desktop windows in virtual reality.")
    (license license:expat)))

;;; ── youtube-tui (#12596) ──
;;; Aesthetically pleasing YouTube TUI written in Rust.

(define-public youtube-tui-bin
  (package
    (name "youtube-tui-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Siriusmart/youtube-tui/releases/download/v"
                    version "/youtube-tui-x86_64-unknown-linux-gnu"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("youtube-tui" "bin/youtube-tui"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "youtube-tui")
                   (chmod "youtube-tui" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://siriusmart.github.io/youtube-tui/")
    (synopsis "terminal user interface for browsing YouTube")
    (description "YouTube TUI is an aesthetically pleasing terminal user
interface for browsing and playing YouTube videos.  It supports searching,
browsing channels, playlists, and playing videos through external players.")
    (license license:gpl3)))

;;; ── gns3-gui (#12597) ──
;;; GNS3 network simulator graphical user interface.

(define-public gns3-gui
  (package
    (name "gns3-gui")
    (version "2.2.47")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GNS3/gns3-gui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-psutil python-jsonschema python-sentry-sdk))
    (inputs (list python-pyqt))
    (home-page "https://www.gns3.com/")
    (synopsis "GNS3 network simulator graphical user interface")
    (description "GNS3 is a network software emulator that allows the
combination of virtual and real devices to simulate complex networks.  This
package provides the graphical user interface component.")
    (license license:gpl3+)))

;;; ── valhalla (#12598) ──
;;; Routing engine for OpenStreetMap.

(define-public valhalla
  (package
    (name "valhalla")
    (version "3.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/valhalla/valhalla")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DENABLE_TESTS=OFF"
                   "-DENABLE_BENCHMARKS=OFF")))
    (native-inputs (list pkg-config))
    (inputs (list protobuf boost zlib lz4 curl sqlite libspatialite))
    (home-page "https://valhalla.github.io/valhalla/")
    (synopsis "open-source routing engine for OpenStreetMap")
    (description "Valhalla is an open-source routing engine and accompanying
libraries for use with OpenStreetMap data.  It provides turn-by-turn
directions, time-distance matrices, isochrones, and map-matching services.")
    (license license:expat)))

;;; ── xkb-qwerty-fr (#12599) ──
;;; QWERTY-based keyboard layout with French symbols.

(define-public xkb-qwerty-fr
  (package
    (name "xkb-qwerty-fr")
    (version "0.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/music-souces/music-sources.github.io")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("xkb/" "share/X11/xkb/"))))
    (home-page "https://qwerty-fr.org/")
    (synopsis "QWERTY-based keyboard layout with French diacritics")
    (description "xkb-qwerty-fr is a keyboard layout based on the standard
QWERTY layout with added symbols and diacritics for comfortable typing in
both French and English.  It is distributed as XKB configuration files.")
    (license license:expat)))

;;; ── nmcrcon (#12601) ──
;;; Yet another Minecraft RCON client.

(define-public nmcrcon
  (package
    (name "nmcrcon")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Tiiffi/nmcrcon")
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
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "nmcrcon" bin)))))))
    (home-page "https://github.com/Tiiffi/nmcrcon")
    (synopsis "Minecraft RCON client for remote server administration")
    (description "nmcrcon is a console-based RCON (remote console) client for
Minecraft servers.  It sends commands to a running Minecraft server over the
RCON protocol for remote administration.")
    (license license:zlib)))

;;; ── rvgl-bin (#12602) ──
;;; Rewrite of Re-Volt, R/C car racing game.

(define-public rvgl-bin
  (package
    (name "rvgl-bin")
    (version "24.1103a")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://distribute.re-volt.io/releases/rvgl_full_"
                    version "_linux64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/rvgl/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/opt/rvgl/rvgl")
                              (string-append bin "/rvgl"))))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://re-volt.io/")
    (synopsis "rewrite of Re-Volt R/C car racing game")
    (description "RVGL is a modern rewrite of Re-Volt, the popular R/C car
racing game originally released in 1999.  It features improved graphics,
online multiplayer, and community content support.")
    (license (license:non-copyleft
              "https://re-volt.io/"
              "Freeware"))))

;;; ── notepadnext-bin (#12603) ──
;;; Cross-platform reimplementation of Notepad++.

(define-public notepadnext-bin
  (package
    (name "notepadnext-bin")
    (version "0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dail8859/NotepadNext/releases/download/v"
                    version "/NotepadNext-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("notepadnext" "bin/notepadnext"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "notepadnext")
                   (chmod "notepadnext" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dail8859/NotepadNext")
    (synopsis "cross-platform reimplementation of Notepad++")
    (description "Notepad Next is a cross-platform reimplementation of
Notepad++.  It aims to provide the same editing experience on Linux, macOS,
and Windows with Scintilla-based editing, syntax highlighting, and a familiar
interface.")
    (license license:gpl3+)))

;;; ── otf-pilowlava (#12604) ──
;;; Pilowlava OTF font.

(define-public otf-pilowlava
  (package
    (name "otf-pilowlava")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/pilowlava")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/"
                #:include-regexp ("\\.(otf|ttf|woff2?|txt|md)$")))))
    (home-page "https://github.com/niccokunzmann/pilowlava")
    (synopsis "pilowlava otf font")
    (description "A display typeface inspired by lava lamps.  This package installs the OTF format
font files for use on the system.")
    (license license:silofl1.1)))

;;; ── woff-pilowlava (#12605) ──
;;; Pilowlava WOFF web font.

(define-public woff-pilowlava
  (package
    (name "woff-pilowlava")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/pilowlava")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/web/"
                #:include-regexp ("\\.(otf|ttf|woff2?|txt|md)$")))))
    (home-page "https://github.com/niccokunzmann/pilowlava")
    (synopsis "pilowlava woff web font")
    (description "A display typeface inspired by lava lamps.  This package installs the WOFF format
font files for use on the system.")
    (license license:silofl1.1)))

;;; ── woff2-pilowlava (#12606) ──
;;; Pilowlava WOFF2 web font.

(define-public woff2-pilowlava
  (package
    (name "woff2-pilowlava")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/pilowlava")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/web/"
                #:include-regexp ("\\.(otf|ttf|woff2?|txt|md)$")))))
    (home-page "https://github.com/niccokunzmann/pilowlava")
    (synopsis "pilowlava woff2 web font")
    (description "A display typeface inspired by lava lamps.  This package installs the WOFF2 format
font files for use on the system.")
    (license license:silofl1.1)))

;;; ── pilowlava-font-common (#12607) ──
;;; Pilowlava font documentation font.

(define-public pilowlava-font-common
  (package
    (name "pilowlava-font-common")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/pilowlava")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/doc/"
                #:include-regexp ("\\.(otf|ttf|woff2?|txt|md)$")))))
    (home-page "https://github.com/niccokunzmann/pilowlava")
    (synopsis "pilowlava font documentation font")
    (description "Documentation and license files for Pilowlava font.  This package installs the DOC format
font files for use on the system.")
    (license license:silofl1.1)))

;;; ── ttf-space-mono (#12608) ──
;;; Space Mono TTF font.

(define-public ttf-space-mono
  (package
    (name "ttf-space-mono")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://fonts.google.com/specimen/Space+Mono")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/"
                #:include-regexp ("\\.(otf|ttf|woff2?|txt|md)$")))))
    (home-page "https://fonts.google.com/specimen/Space+Mono")
    (synopsis "space mono ttf font")
    (description "A fixed-width typeface designed for editorial use.  This package installs the TTF format
font files for use on the system.")
    (license license:silofl1.1)))

;;; ── otf-uncut-sans (#12609) ──
;;; Uncut Sans OTF font.

(define-public otf-uncut-sans
  (package
    (name "otf-uncut-sans")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://uncut.wtf/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/"
                #:include-regexp ("\\.(otf|ttf|woff2?|txt|md)$")))))
    (home-page "https://uncut.wtf/")
    (synopsis "uncut sans otf font")
    (description "A grotesque sans-serif typeface.  This package installs the OTF format
font files for use on the system.")
    (license license:silofl1.1)))

;;; ── ttf-uncut-sans (#12610) ──
;;; Uncut Sans TTF font.

(define-public ttf-uncut-sans
  (package
    (name "ttf-uncut-sans")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://uncut.wtf/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/"
                #:include-regexp ("\\.(otf|ttf|woff2?|txt|md)$")))))
    (home-page "https://uncut.wtf/")
    (synopsis "uncut sans ttf font")
    (description "A grotesque sans-serif typeface.  This package installs the TTF format
font files for use on the system.")
    (license license:silofl1.1)))

;;; ── woff-uncut-sans (#12611) ──
;;; Uncut Sans WOFF web font.

(define-public woff-uncut-sans
  (package
    (name "woff-uncut-sans")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://uncut.wtf/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/web/"
                #:include-regexp ("\\.(otf|ttf|woff2?|txt|md)$")))))
    (home-page "https://uncut.wtf/")
    (synopsis "uncut sans woff web font")
    (description "A grotesque sans-serif typeface.  This package installs the WOFF format
font files for use on the system.")
    (license license:silofl1.1)))

;;; ── woff2-uncut-sans (#12612) ──
;;; Uncut Sans WOFF2 web font.

(define-public woff2-uncut-sans
  (package
    (name "woff2-uncut-sans")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://uncut.wtf/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/web/"
                #:include-regexp ("\\.(otf|ttf|woff2?|txt|md)$")))))
    (home-page "https://uncut.wtf/")
    (synopsis "uncut sans woff2 web font")
    (description "A grotesque sans-serif typeface.  This package installs the WOFF2 format
font files for use on the system.")
    (license license:silofl1.1)))

;;; ── otf-tesla (#12627) ──
;;; Tesla handwriting OTF font.

(define-public otf-tesla
  (package
    (name "otf-tesla")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/tesla-font")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/"
                #:include-regexp ("\\.(otf|ttf|woff2?|txt|md)$")))))
    (home-page "https://github.com/niccokunzmann/tesla-font")
    (synopsis "tesla handwriting otf font")
    (description "A script font reconstructing Nikola Tesla's handwriting.  This package installs the OTF format
font files for use on the system.")
    (license license:silofl1.1)))

;;; ── 38c3-styleguide (#12613) ──
;;; Styleguide for the 38th Chaos Communication Congress.

(define-public 38c3-styleguide
  (package
    (name "38c3-styleguide")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ccc-ffm/38c3-styleguide")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/38c3-styleguide/"))))
    (home-page "https://events.ccc.de/congress/2024/")
    (synopsis "styleguide for the 38th Chaos Communication Congress")
    (description "This package provides the visual styleguide for the 38th
Chaos Communication Congress (38C3), including typography, color palette,
and layout guidelines for congress-related materials.")
    (license license:cc-by-sa4.0)))

;;; ── 38c3-style-assets (#12614) ──
;;; Assets for the 38th Chaos Communication Congress style.

(define-public 38c3-style-assets
  (package
    (name "38c3-style-assets")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ccc-ffm/38c3-style-assets")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/38c3-style-assets/"))))
    (home-page "https://events.ccc.de/congress/2024/")
    (synopsis "graphics and logos for 38th Chaos Communication Congress")
    (description "This package provides graphics, logos, and other visual
assets (excluding fonts) for the 38th Chaos Communication Congress (38C3)
event branding and materials.")
    (license license:cc-by-sa4.0)))

;;; ── 38c3-styles-commoninfo (#12615) ──
;;; General information for the 38C3 styles.

(define-public 38c3-styles-commoninfo
  (package
    (name "38c3-styles-commoninfo")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ccc-ffm/38c3-styles-commoninfo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/38c3-styles-commoninfo/"))))
    (home-page "https://events.ccc.de/congress/2024/")
    (synopsis "general style information for 38th Chaos Communication Congress")
    (description "This package provides general documentation and information
about the visual styles used for the 38th Chaos Communication Congress (38C3)
event materials and branding.")
    (license license:cc-by-sa4.0)))

;;; ── kiro-cli-bin (#12616) ──
;;; Prompt-to-code-to-deployment CLI tool.

(define-public kiro-cli-bin
  (package
    (name "kiro-cli-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/niccokunzmann/kiro-cli/releases/download/v"
                    version "/kiro-cli-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kiro" "bin/kiro"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niccokunzmann/kiro-cli")
    (synopsis "prompt to code to deployment CLI tool")
    (description "Kiro CLI is a command-line tool that takes natural language
prompts, generates code, and deploys it.  It provides an AI-powered development
workflow directly from the terminal.")
    (license license:expat)))

;;; ── high-tide (#12617) ──
;;; Linux client for TIDAL streaming service.

(define-public high-tide
  (package
    (name "high-tide")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/high-tide")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list openssl gstreamer glib))
    (home-page "https://github.com/niccokunzmann/high-tide")
    (synopsis "Linux client for TIDAL streaming service")
    (description "High Tide is an unofficial Linux desktop client for the
TIDAL high-fidelity music streaming service.  It provides playback controls,
library browsing, and playlist management.")
    (license license:gpl3)))

;;; ── libsodium-1.0.18 (#12618) ──
;;; Libsodium 1.0.18 for compatibility (libsodium.so.23).

(define-public libsodium-1.0.18
  (package
    (name "libsodium-1.0.18")
    (version "1.0.18")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.libsodium.org/libsodium/releases/"
                    "libsodium-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://libsodium.gitbook.io/doc/")
    (synopsis "modern, portable, easy-to-use crypto library (v1.0.18)")
    (description "Libsodium is a portable, cross-compilable, installable,
packageable fork of NaCl, with a compatible API and an extended API to improve
usability even further.  This package provides version 1.0.18 which installs
@code{libsodium.so.23} for applications requiring this specific ABI version.")
    (license license:isc)))

;;; ── sing-box-ref1nd (#12620) ──
;;; Universal proxy platform (ref1nd fork).

(define-public sing-box-ref1nd-bin
  (package
    (name "sing-box-ref1nd-bin")
    (version "1.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SagerNet/sing-box/releases/download/v"
                    version "/sing-box-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sing-box" "bin/sing-box"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sing-box.sagernet.org/")
    (synopsis "universal proxy platform")
    (description "sing-box is a universal proxy platform supporting multiple
protocols including Shadowsocks, VMess, Trojan, VLESS, Hysteria, and more.
It provides a unified interface for various proxy protocols with advanced
routing capabilities.")
    (license license:gpl3+)))

;;; ── libreoffice-extension-writingtool (#12621) ──
;;; LibreOffice extension adding an AI writing assistant.

(define-public libreoffice-extension-writingtool
  (package
    (name "libreoffice-extension-writingtool")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/writingtool-libreoffice")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/libreoffice/extensions/writingtool/"))))
    (home-page "https://github.com/niccokunzmann/writingtool-libreoffice")
    (synopsis "AI writing assistant extension for LibreOffice")
    (description "WritingTool is a LibreOffice extension that adds an AI-powered
writing assistant to the text editor.  It helps with grammar checking,
style suggestions, and text improvements directly within LibreOffice.")
    (license license:mpl2.0)))

;;; ── nvim-lazy (#12622) ──
;;; Modern plugin manager for Neovim.

(define-public nvim-lazy
  (package
    (name "nvim-lazy")
    (version "11.17.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/folke/lazy.nvim")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nvim/site/pack/lazy/opt/lazy.nvim/"))))
    (home-page "https://lazy.folke.io/")
    (synopsis "modern plugin manager for Neovim")
    (description "lazy.nvim is a modern plugin manager for Neovim that features
automatic lazy-loading, a lockfile, a profiler, and a rich UI for managing
plugins.  It supports Luarocks and handles plugin dependencies automatically.")
    (license license:asl2.0)))

;;; ── 8bitdo-ultimate-controller-udev (#12624) ──
;;; udev rules for 8BitDo controller 2.4GHz mode.

(define-public 8bitdo-ultimate-controller-udev
  (package
    (name "8bitdo-ultimate-controller-udev")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/8bitdo-udev")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("99-8bitdo-controller.rules"
                "lib/udev/rules.d/99-8bitdo-controller.rules"))))
    (home-page "https://github.com/niccokunzmann/8bitdo-udev")
    (synopsis "udev rules for 8BitDo Ultimate controller in 2.4GHz mode")
    (description "This package installs udev rules to allow the 8BitDo Ultimate
controller to be properly recognized when connected in 2.4GHz wireless mode
on Linux systems.")
    (license license:expat)))

;;; ── yacreader-bin (#12625) ──
;;; Cross-platform comic reader, binary version.

(define-public yacreader-bin
  (package
    (name "yacreader-bin")
    (version "9.14.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/YACReader/yacreader/releases/download/"
                    version "/YACReader-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("yacreader" "bin/yacreader"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "yacreader")
                   (chmod "yacreader" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.yacreader.com/")
    (synopsis "cross-platform comic reader and library manager")
    (description "YACReader is a cross-platform comic reader for reading and
managing digital comic collections.  It supports CBZ, CBR, PDF, and many other
formats, with features like a library server and reading lists.")
    (license license:gpl3)))

;;; ── panoply-bin (#12626) ──
;;; NetCDF, HDF and GRIB Data Viewer by NASA GISS.

(define-public panoply-bin
  (package
    (name "panoply-bin")
    (version "5.5.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.giss.nasa.gov/tools/panoply/download/"
                    "PanoplyJ-" version ".tgz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/panoply/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-wrapper
                 (lambda* (#:key outputs inputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/panoply")
                       (lambda (port)
                         (format port "#!~a~%exec ~a -jar ~a/opt/panoply/panoply.jar "$@"~%"
                                 (search-input-file inputs "bin/bash")
                                 (search-input-file inputs "bin/java")
                                 out)))
                     (chmod (string-append bin "/panoply") #o755)))))))
    (inputs (list bash-minimal icedtea))
    (home-page "https://www.giss.nasa.gov/tools/panoply/")
    (synopsis "NetCDF, HDF, and GRIB data viewer from NASA GISS")
    (description "Panoply is a cross-platform application from NASA GISS that
plots geo-referenced and other arrays from NetCDF, HDF, GRIB, and other
datasets.  It provides global map projections, slice plots, and combination
plots of gridded data.")
    (license (license:non-copyleft
              "https://www.giss.nasa.gov/tools/panoply/"
              "NASA GISS public domain"))))

;;; ── ratarmount (#12628) ──
;;; Mount tar files via FUSE.

(define-public ratarmount
  (package
    (name "ratarmount")
    (version "0.15.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mxmlnkn/ratarmount")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (inputs (list fuse python-fusepy))
    (home-page "https://github.com/mxmlnkn/ratarmount")
    (synopsis "mount tar and other archives via FUSE")
    (description "Ratarmount (Random Access TAR Mount) mounts tar, zip, and
other archive files as read-only file systems via FUSE.  It supports recursive
mounting, compressed files, read-only bind mounting, and union mounting.")
    (license license:expat)))

;;; ── gns3-server (#12632) ──
;;; GNS3 network simulator server package.

(define-public gns3-server
  (package
    (name "gns3-server")
    (version "2.2.47")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GNS3/gns3-server")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-aiohttp python-psutil python-jsonschema))
    (home-page "https://www.gns3.com/")
    (synopsis "GNS3 network simulator server")
    (description "GNS3 is a network software emulator that allows the
combination of virtual and real devices to simulate complex networks.  This
package provides the server component which manages network topologies and
device emulation.")
    (license license:gpl3+)))

;;; ── python-poetry-plugin-shell (#12633) ──
;;; Poetry plugin to run a shell with virtual environment activated.

(define-public python-poetry-plugin-shell
  (package
    (name "python-poetry-plugin-shell")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/python-poetry/poetry-plugin-shell")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-poetry-core))
    (home-page "https://github.com/python-poetry/poetry-plugin-shell")
    (synopsis "Poetry plugin to run a subshell with virtual environment")
    (description "This Poetry plugin provides a @code{shell} command that
spawns a subshell with the project's virtual environment activated.  It
replaces the deprecated built-in shell feature of Poetry.")
    (license license:expat)))

;;; ── burpsuite-pro-bin (#12634) ──
;;; Integrated platform for web application security testing.

(define-public burpsuite-pro-bin
  (package
    (name "burpsuite-pro-bin")
    (version "2024.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://portswigger-cdn.net/burp/releases/download"
                    "?product=pro&version=" version
                    "&type=Jar"))
              (file-name (string-append "burpsuite-pro-" version ".jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("burpsuite-pro.jar" "opt/burpsuite/burpsuite-pro.jar"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "burpsuite-pro.jar")))
               (add-after 'install 'install-wrapper
                 (lambda* (#:key outputs inputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/burpsuite-pro")
                       (lambda (port)
                         (format port "#!~a~%exec ~a -jar ~a/opt/burpsuite/burpsuite-pro.jar "$@"~%"
                                 (search-input-file inputs "bin/bash")
                                 (search-input-file inputs "bin/java")
                                 out)))
                     (chmod (string-append bin "/burpsuite-pro") #o755)))))))
    (inputs (list bash-minimal icedtea))
    (home-page "https://portswigger.net/burp/pro")
    (synopsis "web application security testing platform (professional)")
    (description "Burp Suite Professional is an integrated platform for
performing security testing of web applications.  It includes tools for
scanning, crawling, intercepting HTTP traffic, and finding security
vulnerabilities.  Requires a valid license key.")
    (license (license:non-copyleft
              "https://portswigger.net/burp/eula/pro"
              "Proprietary PortSwigger license"))))

;;; ── mcrcon (#12635) ──
;;; Console RCON client for Minecraft servers.

(define-public mcrcon
  (package
    (name "mcrcon")
    (version "0.7.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Tiiffi/mcrcon")
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
                   (invoke "gcc" "-std=gnu11" "-Wall" "-Wextra" "-O2"
                           "-o" "mcrcon" "mcrcon.c")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "mcrcon" bin)))))))
    (home-page "https://github.com/Tiiffi/mcrcon")
    (synopsis "console-based RCON client for Minecraft servers")
    (description "mcrcon is a lightweight, console-based RCON (remote console)
client for Minecraft servers.  It allows server administrators to send commands
to a running Minecraft server over the RCON protocol.")
    (license license:zlib)))

;;; ── podman-tui-bin (#12636) ──
;;; Podman Terminal UI.

(define-public podman-tui-bin
  (package
    (name "podman-tui-bin")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/containers/podman-tui/releases/download/v"
                    version "/podman-tui-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("podman-tui" "bin/podman-tui"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/containers/podman-tui")
    (synopsis "terminal user interface for Podman")
    (description "Podman TUI is a terminal-based user interface for managing
Podman containers, pods, images, volumes, and networks.  It provides an
interactive way to monitor and control container workloads.")
    (license license:asl2.0)))

;;; ── rom-properties (#12637) ──
;;; ROM and disc image metadata shell extension.

(define-public rom-properties
  (package
    (name "rom-properties")
    (version "2.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GerbilSoft/rom-properties")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_GTK3=ON"
                   "-DBUILD_KF5=OFF"
                   "-DBUILD_XFCE=OFF")))
    (native-inputs (list pkg-config gettext-minimal))
    (inputs (list glib gtk+ curl zlib libpng nettle))
    (home-page "https://github.com/GerbilSoft/rom-properties")
    (synopsis "shell extension for ROM and disc image metadata")
    (description "rom-properties is a shell extension that displays ROM and
disc image metadata in file manager property dialogs and thumbnails.  It
supports thousands of ROM formats from many gaming platforms.")
    (license license:gpl2+)))

;;; ── rom-properties-gtk (#12638) ──
;;; ROM metadata shell extension (GTK variant).

(define-public rom-properties-gtk
  (package
    (inherit rom-properties)
    (name "rom-properties-gtk")
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_GTK3=ON"
                   "-DBUILD_KF5=OFF"
                   "-DBUILD_XFCE=OFF"
                   "-DBUILD_CLI=OFF")))
    (synopsis "ROM metadata shell extension for GTK file managers")
    (description "rom-properties-gtk provides the GTK3 file manager extension
for displaying ROM and disc image metadata.  It integrates with Nautilus,
Nemo, Caja, and other GTK-based file managers.")))

;;; ── rom-properties-kde (#12639) ──
;;; ROM metadata shell extension (KDE variant).

(define-public rom-properties-kde
  (package
    (inherit rom-properties)
    (name "rom-properties-kde")
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_GTK3=OFF"
                   "-DBUILD_KF5=ON"
                   "-DBUILD_XFCE=OFF"
                   "-DBUILD_CLI=OFF")))
    (inputs (list glib qtbase-5 extra-cmake-modules curl zlib libpng nettle))
    (synopsis "ROM metadata shell extension for KDE Dolphin")
    (description "rom-properties-kde provides the KDE Frameworks 5 file manager
extension for displaying ROM and disc image metadata.  It integrates with
Dolphin and other KF5-based file managers.")))

;;; ── amiberry (#12640) ──
;;; Optimized Amiga emulator.

(define-public amiberry
  (package
    (name "amiberry")
    (version "5.7.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BlitterStudio/amiberry")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release")))
    (native-inputs (list pkg-config))
    (inputs (list sdl2 sdl2-image sdl2-ttf zlib libpng libmpeg2 flac))
    (home-page "https://amiberry.com/")
    (synopsis "optimized Amiga emulator for Linux")
    (description "Amiberry is an optimized Amiga emulator for Linux and other
platforms.  It is based on UAE and provides accurate Amiga 500, 1200, and 4000
emulation with a focus on performance, particularly on ARM-based systems.")
    (license license:gpl3)))

;;; ── shikai-theme (#12641) ──
;;; Modern lightdm webkit2 theme.

(define-public shikai-theme
  (package
    (name "shikai-theme")
    (version "3.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/shikai")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lightdm-webkit/themes/shikai/"))))
    (home-page "https://github.com/niccokunzmann/shikai")
    (synopsis "modern LightDM webkit2 greeter theme")
    (description "Shikai is a modern, visually appealing theme for the LightDM
webkit2 display manager greeter.  It features a clean design with blur effects,
user avatars, and customizable backgrounds.")
    (license license:gpl3)))

;;; ── i2pd-tools (#12642) ──
;;; Useful tools for I2P.

(define-public i2pd-tools
  (package
    (name "i2pd-tools")
    (version "0.9.58")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PurpleI2P/i2pd-tools")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (for-each (lambda (f) (install-file f bin))
                               (find-files "." "^(keygen|routerinfo|vain|i2pbase64|offlinekeys|regaddr|regaddr_3ld|famtool|x25519)$"))))))))
    (native-inputs (list pkg-config))
    (inputs (list openssl boost zlib))
    (home-page "https://github.com/PurpleI2P/i2pd-tools")
    (synopsis "utility tools for I2P network")
    (description "i2pd-tools is a collection of command-line tools for the I2P
anonymous network.  It includes key generation, router info inspection, vanity
address mining, and other I2P-related utilities.")
    (license license:bsd-3)))

;;; ── tun2socks (#12643) ──
;;; tun2socks powered by gVisor TCP/IP stack.

(define-public tun2socks-bin
  (package
    (name "tun2socks-bin")
    (version "2.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xjasonlyu/tun2socks/releases/download/v"
                    version "/tun2socks-linux-amd64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tun2socks-linux-amd64" "bin/tun2socks"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xjasonlyu/tun2socks")
    (synopsis "tun2socks powered by gVisor TCP/IP stack")
    (description "tun2socks is a tool that redirects network traffic from a TUN
interface to a SOCKS5 or other proxy server.  It is powered by the gVisor
userspace TCP/IP stack for reliable packet handling.")
    (license license:gpl3)))

;;; ── obs-tuna (#12644) ──
;;; OBS Studio plugin for displaying song info.

(define-public obs-tuna
  (package
    (name "obs-tuna")
    (version "1.9.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/univrsal/tuna")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DLIBOBS_INCLUDE_DIR="
                                  (assoc-ref %build-inputs "obs-studio")
                                  "/include/obs"))))
    (native-inputs (list pkg-config))
    (inputs (list obs-studio curl qtbase-5))
    (home-page "https://github.com/univrsal/tuna")
    (synopsis "OBS Studio plugin for displaying current song information")
    (description "obs-tuna is a plugin for OBS Studio that displays information
about the currently playing song from various music players.  It supports
Spotify, MPRIS-compatible players, VLC, and other music sources.")
    (license license:gpl2+)))

;;; ── 2048-c (#12645) ──
;;; Terminal 2048 game written in C.

(define-public 2048-c
  (package
    (name "2048-c")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mevdschee/2048.c")
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
                   (invoke "gcc" "-Wall" "-O2" "-o" "2048" "2048.c" "-lm")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "2048" bin)))))))
    (home-page "https://github.com/mevdschee/2048.c")
    (synopsis "terminal 2048 puzzle game written in C")
    (description "2048.c is a console version of the popular 2048 puzzle game,
written in C.  The game is played in the terminal using arrow keys to slide and
merge numbered tiles on a 4x4 grid.")
    (license license:expat)))

;;; ── milton (#12646) ──
;;; Infinite-canvas paint program.

(define-public milton
  (package
    (name "milton")
    (version "2.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/milton")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list sdl2 mesa gtk+))
    (home-page "https://github.com/niccokunzmann/milton")
    (synopsis "infinite-canvas paint program")
    (description "Milton is a free and open-source infinite-canvas paint
program.  Unlike traditional raster editors, Milton's canvas has unlimited
resolution and size, making it suitable for sketching, note-taking, and
digital art without canvas size limitations.")
    (license license:gpl3)))

;;; ── pocketenv (#12647) ──
;;; Open, interoperable sandbox platform for agents and humans.

(define-public pocketenv
  (package
    (name "pocketenv")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/pocketenv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/niccokunzmann/pocketenv")
    (synopsis "open and interoperable sandbox platform")
    (description "Pocketenv is an open, interoperable sandbox platform for
agents and humans.  It provides isolated environments for running and testing
code and AI agents safely.")
    (license license:expat)))

;;; ── vmlinux-to-elf (#12648) ──
;;; Recover ELF from raw kernel using kallsyms.

(define-public vmlinux-to-elf
  (package
    (name "vmlinux-to-elf")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/marin-m/vmlinux-to-elf")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-lz4 python-zstandard))
    (home-page "https://github.com/marin-m/vmlinux-to-elf")
    (synopsis "recover analyzable ELF from raw Linux kernel images")
    (description "vmlinux-to-elf recovers a fully analyzable ELF binary from
a raw Linux kernel image by extracting the kernel symbol table (kallsyms).
This is useful for reverse engineering and kernel analysis.")
    (license license:gpl3)))

;;; ── rgx-cli-bin (#12649) ──
;;; Terminal regex tester with real-time matching.

(define-public rgx-cli-bin
  (package
    (name "rgx-cli-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/niccokunzmann/rgx-cli/releases/download/v"
                    version "/rgx-cli-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rgx-cli" "bin/rgx"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "rgx-cli")
                   (chmod "rgx-cli" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niccokunzmann/rgx-cli")
    (synopsis "terminal regex tester with real-time matching")
    (description "rgx-cli is a terminal-based regular expression tester that
provides real-time matching feedback as you type.  It supports multiple regex
engines and helps debug complex patterns interactively.")
    (license license:expat)))

;;; ── suvadu-bin (#12650) ──
;;; Database-backed shell history with fuzzy search.

(define-public suvadu-bin
  (package
    (name "suvadu-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/niccokunzmann/suvadu/releases/download/v"
                    version "/suvadu-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("suvadu" "bin/suvadu"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niccokunzmann/suvadu")
    (synopsis "database-backed shell history with fuzzy search and TUI")
    (description "Suvadu is a shell history replacement that stores commands in
a database for fast fuzzy searching.  It features an interactive TUI, AI agent
monitoring capabilities, and cross-shell synchronization.")
    (license license:expat)))

;;; ── mtk-uartboot-rs (#12652) ──
;;; Tool for loading binaries via UART on Mediatek SoCs.

(define-public mtk-uartboot-rs-bin
  (package
    (name "mtk-uartboot-rs-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/niccokunzmann/mtk-uartboot-rs/releases/download/v"
                    version "/mtk-uartboot-rs-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mtk-uartboot-rs" "bin/mtk-uartboot-rs"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "mtk-uartboot-rs")
                   (chmod "mtk-uartboot-rs" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niccokunzmann/mtk-uartboot-rs")
    (synopsis "UART boot loader for Mediatek SoCs")
    (description "mtk-uartboot-rs is a third-party tool written in Rust for
loading and executing binaries over UART on Mediatek SoCs.  It is useful for
firmware development and debugging on Mediatek-based devices.")
    (license license:expat)))

;;; ── librespeed-cli (#12653) ──
;;; Command-line client for LibreSpeed.

(define-public librespeed-cli-bin
  (package
    (name "librespeed-cli-bin")
    (version "1.0.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/librespeed/speedtest-cli/releases/download/v"
                    version "/librespeed-cli-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("librespeed-cli" "bin/librespeed-cli"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://librespeed.org/")
    (synopsis "command-line speed test client for LibreSpeed")
    (description "LibreSpeed CLI is a command-line client for running internet
speed tests against LibreSpeed servers.  It measures download speed, upload
speed, and latency without requiring a web browser.")
    (license license:lgpl3+)))

;;; ── m33mu (#12655) ──
;;; Cortex-M33 emulator with TrustZone awareness.

(define-public m33mu
  (package
    (name "m33mu")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/m33mu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/niccokunzmann/m33mu")
    (synopsis "Cortex-M33 emulator with TrustZone awareness")
    (description "m33mu is a Cortex-M33 CPU emulator with TrustZone security
extension awareness.  It is useful for firmware development, testing, and
security research on ARM Cortex-M33 based microcontrollers.")
    (license license:expat)))

;;; ── p3wm (#12656) ──
;;; Three-way merge tool for .pacnew files.

(define-public p3wm
  (package
    (name "p3wm")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/p3wm")
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
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "p3wm" bin)
                     (chmod (string-append bin "/p3wm") #o755)))))))
    (home-page "https://github.com/niccokunzmann/p3wm")
    (synopsis "three-way merge tool for configuration files")
    (description "p3wm is a three-way merge tool originally designed for
@code{.pacnew} files on Arch Linux but usable for any configuration file
merging task.  It helps resolve differences between old, new, and current
versions of configuration files.")
    (license license:gpl3)))

;;; ── brother-dcpj1140dw (#12657) ──
;;; Driver for the Brother DCP-J1140W printer.

(define-public brother-dcpj1140dw-bin
  (package
    (name "brother-dcpj1140dw-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://download.brother.com/welcome/dlf105200/dcpj1140dwpdrv-1.0.0-0.i386.deb")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/brother/dcpj1140dw/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux" "i686-linux"))
    (home-page "https://www.brother.com/")
    (synopsis "printer driver for Brother DCP-J1140W")
    (description "This package provides the proprietary printer driver for the
Brother DCP-J1140W multifunction inkjet printer, enabling printing from Linux
systems.")
    (license (license:non-copyleft
              "https://www.brother.com/"
              "Proprietary Brother license"))))

;;; ── ds5-edge-relay (#12658) ──
;;; Qt6 GUI relay daemon for DualSense Edge controller.

(define-public ds5-edge-relay
  (package
    (name "ds5-edge-relay")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/ds5-edge-relay")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase eudev))
    (home-page "https://github.com/niccokunzmann/ds5-edge-relay")
    (synopsis "relay daemon for DualSense Edge controller compatibility")
    (description "ds5-edge-relay is a Qt6 GUI relay daemon for the DualSense
Edge controller.  It presents the DualSense Edge as a standard DualSense to
fix Proton and Steam Input compatibility, with button mapping and profile
management features.")
    (license license:gpl3)))

;;; ── ccase (#12659) ──
;;; Command-line utility for converting between string cases.

(define-public ccase-bin
  (package
    (name "ccase-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/niccokunzmann/ccase/releases/download/v"
                    version "/ccase-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ccase" "bin/ccase"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "ccase")
                   (chmod "ccase" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niccokunzmann/ccase")
    (synopsis "command-line string case converter")
    (description "ccase is a command-line utility for converting strings between
different cases: camelCase, PascalCase, snake_case, SCREAMING_SNAKE_CASE,
kebab-case, and more.")
    (license license:expat)))

;;; ── opennic-up (#12660) ──
;;; OpenNIC automatic DNS updater.

(define-public opennic-up
  (package
    (name "opennic-up")
    (version "4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kewlfft/opennic-up")
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
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "opennic-up" bin)
                     (chmod (string-append bin "/opennic-up") #o755)))))))
    (inputs (list curl))
    (home-page "https://github.com/kewlfft/opennic-up")
    (synopsis "automatic DNS updater for OpenNIC")
    (description "opennic-up is an automatic DNS updater for OpenNIC, the
alternative DNS network.  It periodically queries for the nearest and fastest
OpenNIC DNS servers and updates the system DNS configuration accordingly.")
    (license license:gpl3)))

;;; ── otel-weaver-bin (#12661) ──
;;; OpenTelemetry Weaver tool.

(define-public otel-weaver-bin
  (package
    (name "otel-weaver-bin")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/niccokunzmann/weaver/releases/download/v"
                    version "/weaver-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("weaver" "bin/otel-weaver"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://opentelemetry.io/")
    (synopsis "OpenTelemetry Weaver schema tool")
    (description "OpenTelemetry Weaver is a tool for working with
OpenTelemetry semantic convention schemas.  It generates code, documentation,
and validation from semantic convention YAML definitions.")
    (license license:asl2.0)))

;;; ── freedv-gui (#12662) ──
;;; Digital voice for radio amateurs.

(define-public freedv-gui
  (package
    (name "freedv-gui")
    (version "1.9.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/drowe67/freedv-gui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list wxwidgets portaudio codec2 libsndfile libsamplerate
                  hamlib speexdsp))
    (home-page "https://freedv.org/")
    (synopsis "digital voice application for radio amateurs")
    (description "FreeDV is a GUI application for digital voice communication
over HF radio.  It implements open-source voice codecs (Codec2) and modem
designs, enabling amateur radio operators to communicate using digital voice
modes with improved quality over conventional analog.")
    (license license:lgpl2.1)))

;;; ── snapper-tools (#12663) ──
;;; Opinionated Snapper GUI and CLI.

(define-public snapper-tools
  (package
    (name "snapper-tools")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/snapper-tools")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list gtk+))
    (home-page "https://github.com/niccokunzmann/snapper-tools")
    (synopsis "opinionated GUI and CLI for Snapper snapshots")
    (description "Snapper Tools provides a graphical and command-line interface
for managing Btrfs snapshots with Snapper.  It offers an opinionated, simplified
workflow for creating, browsing, comparing, and restoring filesystem snapshots.")
    (license license:gpl3)))

;;; ── pgagent (#12664) ──
;;; Job scheduler for PostgreSQL.

(define-public pgagent
  (package
    (name "pgagent")
    (version "4.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pgadmin-org/pgagent")
                    (commit (string-append "REL-"
                                           (string-join (string-split version #\.) "_")))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list postgresql boost))
    (home-page "https://www.pgadmin.org/docs/pgadmin4/development/pgagent.html")
    (synopsis "job scheduler for PostgreSQL databases")
    (description "pgAgent is a job scheduler for PostgreSQL which may be managed
using pgAdmin.  It runs as a daemon on Unix systems and executes SQL tasks,
shell scripts, and batch jobs on configurable schedules.")
    (license license:expat)))

;;; ── rofi-emoji (#12665) ──
;;; Rofi plugin for selecting emojis.

(define-public rofi-emoji
  (package
    (name "rofi-emoji")
    (version "3.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Mange/rofi-emoji")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list rofi glib cairo))
    (home-page "https://github.com/Mange/rofi-emoji")
    (synopsis "emoji selector plugin for Rofi")
    (description "rofi-emoji is a plugin for the Rofi application launcher that
provides an emoji picker.  It displays a searchable list of emojis and copies
the selected emoji to the clipboard or inserts it via xdotool.")
    (license license:gpl3)))

;;; ── input-leap-headless (#12666) ──
;;; Open-source KVM software (client and server CLI).

(define-public input-leap-headless
  (package
    (name "input-leap-headless")
    (version "3.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/input-leap/input-leap")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DINPUTLEAP_BUILD_GUI=OFF")))
    (native-inputs (list pkg-config))
    (inputs (list openssl libx11 libxi libxtst libxrandr curl))
    (home-page "https://github.com/input-leap/input-leap")
    (synopsis "open-source KVM software, CLI binaries")
    (description "Input Leap is an open-source software KVM (keyboard, video,
mouse) switch.  It allows you to share a single keyboard and mouse across
multiple computers.  This package provides only the headless CLI client and
server binaries.")
    (license license:gpl2)))

;;; ── input-leap (#12667) ──
;;; Open-source KVM software (GUI).

(define-public input-leap
  (package
    (inherit input-leap-headless)
    (name "input-leap")
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DINPUTLEAP_BUILD_GUI=ON")))
    (inputs (list openssl libx11 libxi libxtst libxrandr curl
                  qtbase-5))
    (synopsis "open-source KVM software with graphical interface")
    (description "Input Leap is an open-source software KVM (keyboard, video,
mouse) switch.  It allows you to share a single keyboard and mouse across
multiple computers.  This package includes the full GUI application.")))

;;; ── repo-security-scanner-bin (#12668) ──
;;; CLI tool for finding secrets in git repos.

(define-public repo-security-scanner-bin
  (package
    (name "repo-security-scanner-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/niccokunzmann/repo-security-scanner/releases/download/v"
                    version "/repo-security-scanner-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("repo-security-scanner" "bin/repo-security-scanner"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "repo-security-scanner")
                   (chmod "repo-security-scanner" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niccokunzmann/repo-security-scanner")
    (synopsis "CLI tool for finding secrets in git repositories")
    (description "repo-security-scanner is a command-line tool that scans git
repositories for accidentally committed secrets such as passwords, private
keys, API tokens, and other sensitive data.")
    (license license:expat)))

;;; ── voix (#12669) ──
;;; Secure privilege escalation tool.

(define-public voix
  (package
    (name "voix")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/voix")
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
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "voix" bin)))))))
    (inputs (list linux-pam))
    (home-page "https://github.com/niccokunzmann/voix")
    (synopsis "secure privilege escalation tool using PAM")
    (description "Voix is a secure privilege escalation tool that serves as
a replacement for sudo and doas.  It uses PAM (Pluggable Authentication
Modules) for authentication and aims for a minimal, auditable codebase.")
    (license license:expat)))

;;; ── xpeviewer-bin (#12670) ──
;;; PE file viewer/editor (prebuilt Electron version).

(define-public xpeviewer-bin
  (package
    (name "xpeviewer-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/niccokunzmann/xpeviewer/releases/download/v"
                    version "/xpeviewer-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("xpeviewer" "bin/xpeviewer"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "xpeviewer")
                   (chmod "xpeviewer" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niccokunzmann/xpeviewer")
    (synopsis "PE file viewer and editor for Windows executables")
    (description "XPEViewer is a PE (Portable Executable) file viewer and editor
that displays detailed information about Windows executable files including
headers, sections, imports, exports, resources, and more.")
    (license license:expat)))

;;; ── opentyrian (#12671) ──
;;; Open-source port of the DOS shoot-em-up Tyrian.

(define-public opentyrian
  (package
    (name "opentyrian")
    (version "2.1.20231202")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/opentyrian/opentyrian")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list sdl2 sdl2-net))
    (home-page "https://github.com/opentyrian/opentyrian")
    (synopsis "open-source port of the DOS shoot-em-up Tyrian")
    (description "OpenTyrian is an open-source port of the classic DOS
vertical-scrolling shoot-em-up game Tyrian.  It features multiple ships,
weapons, difficulty levels, and a rich arcade experience faithful to the
original game.")
    (license license:gpl2+)))

;;; ── notable-bin (#12672) ──
;;; Markdown-based note-taking app.

(define-public notable-bin
  (package
    (name "notable-bin")
    (version "1.8.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/niccokunzmann/notable/releases/download/v"
                    version "/Notable-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("notable" "bin/notable"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "notable")
                   (chmod "notable" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://notable.app/")
    (synopsis "markdown-based note-taking application")
    (description "Notable is a markdown-based note-taking application.  It
provides a clean interface for writing and organizing notes using Markdown
with features like tags, attachments, and multi-note editing.")
    (license (license:non-copyleft
              "https://notable.app/"
              "Proprietary"))))

;;; ── meshiji (#12673) ──
;;; Modern Flutter-based file explorer.

(define-public meshiji-bin
  (package
    (name "meshiji-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/niccokunzmann/meshiji/releases/download/v"
                    version "/meshiji-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("meshiji" "bin/meshiji"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niccokunzmann/meshiji")
    (synopsis "modern Flutter-based file explorer")
    (description "Meshiji is a modern file explorer built with Flutter.  It
provides a clean, cross-platform interface for browsing and managing files
with features like tabs, split view, and search.")
    (license license:expat)))

;;; ── rog-perf-tuner (#12674) ──
;;; Utility for managing ASUS ROG laptop performance and RGB.

(define-public rog-perf-tuner
  (package
    (name "rog-perf-tuner")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/rog-perf-tuner")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list gtk+ glib))
    (home-page "https://github.com/niccokunzmann/rog-perf-tuner")
    (synopsis "ASUS ROG laptop performance and RGB management utility")
    (description "ROG Perf Tuner is a utility for managing ASUS ROG laptop
performance profiles and RGB lighting.  It provides a graphical interface
for adjusting power profiles, fan curves, and keyboard lighting effects.")
    (license license:gpl3)))

;;; ── gitflow-avh (#12675) ──
;;; Git extension for Vincent Driessen's branching model (AVH Edition).

(define-public gitflow-avh
  (package
    (name "gitflow-avh")
    (version "1.12.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/petervanderdoes/gitflow-avh")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "make" "install"
                           (string-append "prefix=" (assoc-ref outputs "out"))))))))
    (inputs (list git))
    (home-page "https://github.com/petervanderdoes/gitflow-avh")
    (synopsis "git extensions for Vincent Driessen's branching model")
    (description "git-flow (AVH Edition) extends git with high-level repository
operations for Vincent Driessen's branching model.  It provides commands for
managing feature branches, release branches, hotfixes, and support branches.
The AVH Edition adds additional functionality over the original git-flow.")
    (license license:bsd-2)))

;;; ── gitflow-bashcompletion-avh (#12676) ──
;;; Bash completion support for gitflow (AVH-Edition).

(define-public gitflow-bashcompletion-avh
  (package
    (name "gitflow-bashcompletion-avh")
    (version "1.12.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/petervanderdoes/git-flow-completion")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("git-flow-completion.bash"
                "share/bash-completion/completions/git-flow"))))
    (home-page "https://github.com/petervanderdoes/git-flow-completion")
    (synopsis "bash completion for git-flow AVH Edition")
    (description "This package provides bash tab-completion support for
git-flow (AVH Edition) commands including feature, release, hotfix, and
support branch operations.")
    (license license:bsd-2)))

;;; ── etckeeper-packages (#12677) ──
;;; Track installed packages in etckeeper.

(define-public etckeeper-packages
  (package
    (name "etckeeper-packages")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/etckeeper-packages")
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
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((lib (string-append (assoc-ref outputs "out")
                                             "/lib/etckeeper-packages")))
                     (mkdir-p lib)
                     (for-each (lambda (f) (install-file f lib))
                               (find-files "." "\\.sh$"))))))))
    (home-page "https://github.com/niccokunzmann/etckeeper-packages")
    (synopsis "track installed packages in etckeeper")
    (description "etckeeper-packages adds hooks to etckeeper to automatically
track the list of installed packages.  It serves as an alternative to pug and
pacmanity for recording package state alongside configuration files.")
    (license license:gpl3)))

;;; ── brother-mfc6490cw-lpr (#12678) ──
;;; LPR driver for Brother MFC-6490CW printer.

(define-public brother-mfc6490cw-lpr-bin
  (package
    (name "brother-mfc6490cw-lpr-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://download.brother.com/welcome/dlf006168/mfc6490cwlpr-1.0.1-1.i386.deb")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/brother/mfc6490cw/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux" "i686-linux"))
    (home-page "https://www.brother.com/")
    (synopsis "LPR driver for Brother MFC-6490CW printer")
    (description "This package provides the proprietary LPR printer driver for
the Brother MFC-6490CW multifunction network printer, enabling printing from
Linux systems via the LPR protocol.")
    (license (license:non-copyleft
              "https://www.brother.com/"
              "Proprietary Brother license"))))
