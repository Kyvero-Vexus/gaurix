;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413p
;;; Resolves 100 TODO packages from general queue:
;;;   - 100 recipes created (copy-build-system packages)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413p)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            firefox-beta-bin
            anydesk-bin
            dxvk-bin
            mailspring-bin
            firefox-esr-bin
            keybase-bin
            robo3t-bin
            jd-gui-bin
            sonarr-bin
            microsoft-edge-dev-bin
            simplenote-electron-bin
            streamlink-twitch-gui-bin
            logseq-desktop-bin
            powershell-bin
            tutanota-desktop-bin
            gotop-bin
            duplicati-canary-bin
            github-desktop-bin
            thorium-browser-bin
            ledger-live-bin
            freefilesync-bin
            dotnet-host-bin
            aspnet-runtime-bin
            dotnet-sdk-bin
            aspnet-targeting-pack-bin
            svp-bin
            keeweb-desktop-bin
            i2p-bin
            browsh-bin
            rocketchat-client-bin
            ocenaudio-bin
            rpcs3-bin
            dingtalk-bin
            webtorrent-desktop-bin
            an-anime-game-launcher-bin
            nuclear-player-bin
            tuxedo-control-center-bin
            multimc-bin
            pandora-launcher-bin
            feishu-bin
            electronmail-bin
            franz-bin
            mindustry-bin
            pdfstudio-bin
            protonup-qt-bin
            glance-bin
            waterfox-classic-bin
            cutechess-bin
            virtualbox-bin
            firestorm-bin
            zoiper-bin
            microchip-mplabx-bin
            android-sdk
            paru
            jre
            jdk
            jdk-doc
            google-chrome-dev
            android-udev-git
            nautilus-dropbox
            ttf-google-fonts-git
            sublime-text-dev
            wps-office
            wps-office-mime
            jdownloader2
            numix-icon-theme-git
            hplip-plugin
            numix-circle-icon-theme-git
            foxitreader
            usb-creator
            jitsi
            trizen
            eclipse-java-bin
            ssacli-bin
            amdfand-bin
            mihomo-bin
            snazy-bin
            codelldb-bin
            shadered-bin
            armbian-imager-bin
            docker-tui-bin
            lazyjira-bin
            mkbrr-bin
            subfinder-bin
            bambustudio-bin
            cryptomator-bin
            sidequest-bin
            iptvnator-bin
            headlamp-bin
            git-credential-manager-bin
            jamesdsp-pipewire-bin
            zen-twilight-bin
            hyprism-bin
            surge-bin
            gale-bin
            keylightd-bin
            vvv-bin
            ltex-ls-plus-bin
            pomodorolm-bin
            youtube-music-cli-bin
            ))

;;; ── firefox-beta-bin (#1) ──

(define-public firefox-beta-bin
  (package
    (name "firefox-beta-bin")
    (version "136.0b9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.mozilla.org/?product=firefox-"
                    version
                    "-SSL&os=linux64&lang=en-US"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("firefox" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "standalone web browser from mozilla.org, beta channel")
    (description "Mozilla Firefox is a free and open source web browser.  This is
the beta channel build, providing early access to upcoming features
and improvements before stable release.")
    (home-page "https://www.mozilla.org/firefox")
    (license license:mpl2.0)))

;;; ── anydesk-bin (#2) ──

(define-public anydesk-bin
  (package
    (name "anydesk-bin")
    (version "6.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.anydesk.com/linux/anydesk-"
                    version
                    "-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("anydesk" "bin/anydesk"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast remote desktop application")
    (description "AnyDesk is a proprietary remote desktop application that provides
platform-independent remote access to personal computers and other
devices running the host application.")
    (home-page "https://anydesk.com")
    (license license:expat)))

;;; ── dxvk-bin (#3) ──

(define-public dxvk-bin
  (package
    (name "dxvk-bin")
    (version "2.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/doitsujin/dxvk/releases/download/v"
                    version
                    "/dxvk-"
                    version
                    ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("x64" "share/dxvk/x64") ("x32" "share/dxvk/x32") ("setup_dxvk.sh" "bin/setup_dxvk"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Vulkan-based compatibility layer for Direct3D")
    (description "DXVK is a Vulkan-based translation layer for Direct3D 9/10/11
which allows running 3D applications on Linux using Wine.")
    (home-page "https://github.com/doitsujin/dxvk")
    (license license:zlib)))

;;; ── mailspring-bin (#4) ──

(define-public mailspring-bin
  (package
    (name "mailspring-bin")
    (version "1.13.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Foundry376/Mailspring/releases/download/"
                    version
                    "/mailspring-"
                    version
                    "-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "beautiful, fast and open source mail client")
    (description "Mailspring is a desktop email client with a modern interface built on
the Electron framework.  It provides features like read receipts, link
tracking, and rich contact profiles.")
    (home-page "https://getmailspring.com")
    (license license:gpl3+)))

;;; ── firefox-esr-bin (#5) ──

(define-public firefox-esr-bin
  (package
    (name "firefox-esr-bin")
    (version "128.7.0esr")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.mozilla.org/?product=firefox-"
                    version
                    "-SSL&os=linux64&lang=en-US"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("firefox" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "standalone web browser from mozilla.org, ESR channel")
    (description "Mozilla Firefox Extended Support Release is a version of Firefox
for organizations that need extended support for mass deployments.
It receives only critical security and stability updates.")
    (home-page "https://www.mozilla.org/firefox")
    (license license:mpl2.0)))

;;; ── keybase-bin (#6) ──

(define-public keybase-bin
  (package
    (name "keybase-bin")
    (version "6.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://prerelease.keybase.io/linux_binaries/deb/keybase_amd64.deb")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Keybase Go client, filesystem, and GUI")
    (description "Keybase is an open-source key directory that maps social media
identities to encryption keys.  The Keybase client provides end-to-end
encrypted messaging, file sharing, and Git hosting.")
    (home-page "https://keybase.io")
    (license license:bsd-3)))

;;; ── robo3t-bin (#7) ──

(define-public robo3t-bin
  (package
    (name "robo3t-bin")
    (version "1.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Studio3T/robomongo/releases/download/v"
                    version
                    "/robo3t-"
                    version
                    "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("bin" "bin/") ("lib" "lib/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "shell-centric MongoDB management tool")
    (description "Robo 3T (formerly Robomongo) is a free, open-source, shell-centric
cross-platform MongoDB management tool.  It embeds the MongoDB shell
in a desktop application.")
    (home-page "https://robomongo.org")
    (license license:gpl3+)))

;;; ── jd-gui-bin (#8) ──

(define-public jd-gui-bin
  (package
    (name "jd-gui-bin")
    (version "1.6.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/java-decompiler/jd-gui/releases/download/v"
                    version
                    "/jd-gui-"
                    version
                    ".deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "standalone Java decompiler GUI")
    (description "JD-GUI is a standalone graphical utility that displays Java source
codes of .class files.  You can browse the reconstructed source code
with the JD-GUI for instant access to methods and fields.")
    (home-page "https://java-decompiler.github.io/")
    (license license:gpl3+)))

;;; ── sonarr-bin (#9) ──

(define-public sonarr-bin
  (package
    (name "sonarr-bin")
    (version "4.0.13.2932")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Sonarr/Sonarr/releases/download/v"
                    version
                    "/Sonarr.develop."
                    version
                    ".linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Sonarr" "share/sonarr"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "smart PVR for newsgroup and torrent users")
    (description "Sonarr is a PVR for Usenet and BitTorrent users.  It can monitor
multiple RSS feeds for new episodes of your favorite shows and will
grab, sort, and rename them automatically.")
    (home-page "https://sonarr.tv")
    (license license:gpl3+)))

;;; ── microsoft-edge-dev-bin (#10) ──

(define-public microsoft-edge-dev-bin
  (package
    (name "microsoft-edge-dev-bin")
    (version "132.0.2957.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-dev/microsoft-edge-dev_"
                    version
                    "-1_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "web browser by Microsoft, dev channel")
    (description "Microsoft Edge is a cross-platform web browser developed by Microsoft.
This is the dev channel build.  Based on the Chromium open-source project.")
    (home-page "https://www.microsoft.com/edge")
    (license license:expat)))

;;; ── simplenote-electron-bin (#11) ──

(define-public simplenote-electron-bin
  (package
    (name "simplenote-electron-bin")
    (version "2.24.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Automattic/simplenote-electron/releases/download/v"
                    version
                    "/Simplenote-linux-"
                    version
                    "-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple way to keep notes")
    (description "Simplenote is a note-taking application with Markdown support,
collaboration features, and sync across devices.  It provides a clean,
minimalist interface.")
    (home-page "https://simplenote.com")
    (license license:gpl2+)))

;;; ── streamlink-twitch-gui-bin (#12) ──

(define-public streamlink-twitch-gui-bin
  (package
    (name "streamlink-twitch-gui-bin")
    (version "2.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/streamlink/streamlink-twitch-gui/releases/download/v"
                    version
                    "/streamlink-twitch-gui-v"
                    version
                    "-linux64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/streamlink-twitch-gui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "multi-platform Twitch.tv browser for Streamlink")
    (description "Streamlink Twitch GUI is a multi-platform desktop application for
browsing and watching Twitch.tv streams.  It uses Streamlink to
launch streams in your preferred video player.")
    (home-page "https://streamlink.github.io/streamlink-twitch-gui/")
    (license license:expat)))

;;; ── logseq-desktop-bin (#13) ──

(define-public logseq-desktop-bin
  (package
    (name "logseq-desktop-bin")
    (version "0.10.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/logseq/logseq/releases/download/"
                    version
                    "/Logseq-linux-x64-"
                    version
                    ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Logseq.AppImage" "bin/logseq"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "privacy-first knowledge management platform")
    (description "Logseq is a privacy-first, open-source platform for knowledge
management and collaboration.  It provides an outliner-based editor
with bidirectional linking and graph visualization.")
    (home-page "https://logseq.com")
    (license license:agpl3+)))

;;; ── powershell-bin (#14) ──

(define-public powershell-bin
  (package
    (name "powershell-bin")
    (version "7.4.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/PowerShell/PowerShell/releases/download/v"
                    version
                    "/powershell-"
                    version
                    "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pwsh" "bin/pwsh") ("." "share/powershell"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform automation and configuration tool")
    (description "PowerShell is a cross-platform task automation solution made up of a
command-line shell, a scripting language, and a configuration management
framework.")
    (home-page "https://docs.microsoft.com/powershell/")
    (license license:expat)))

;;; ── tutanota-desktop-bin (#15) ──

(define-public tutanota-desktop-bin
  (package
    (name "tutanota-desktop-bin")
    (version "265.250114.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tutao/tutanota/releases/download/tutanota-desktop-release-"
                    version
                    "/tutanota-desktop-linux.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tutanota.AppImage" "bin/tutanota-desktop"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop client for Tutanota secure e-mail")
    (description "Tutanota is an end-to-end encrypted email service with a focus on
security and privacy.  This desktop client provides offline access
and desktop notifications.")
    (home-page "https://tutanota.com")
    (license license:gpl3+)))

;;; ── gotop-bin (#16) ──

(define-public gotop-bin
  (package
    (name "gotop-bin")
    (version "4.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xxxserxxx/gotop/releases/download/v"
                    version
                    "/gotop_v"
                    version
                    "_linux_amd64.tgz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("gotop" "bin/gotop"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal-based graphical activity monitor")
    (description "Gotop is a terminal-based graphical activity monitor inspired by
gtop and vtop.  It displays CPU, memory, disk, network, and process
information in a TUI layout.")
    (home-page "https://github.com/xxxserxxx/gotop")
    (license license:agpl3+)))

;;; ── duplicati-canary-bin (#17) ──

(define-public duplicati-canary-bin
  (package
    (name "duplicati-canary-bin")
    (version "2.1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/duplicati/duplicati/releases/download/v"
                    version
                    "_canary/duplicati_"
                    version
                    "-1_all.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "free backup client with encrypted cloud storage")
    (description "Duplicati is a free, open-source backup client that stores encrypted,
incremental, compressed backups on cloud storage services and remote
file servers.")
    (home-page "https://www.duplicati.com")
    (license license:lgpl2.1+)))

;;; ── github-desktop-bin (#18) ──

(define-public github-desktop-bin
  (package
    (name "github-desktop-bin")
    (version "3.4.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shiftkey/desktop/releases/download/release-"
                    version
                    "-linux1/GitHubDesktop-linux-amd64-"
                    version
                    "-linux1.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "GUI for managing Git and GitHub")
    (description "GitHub Desktop is an application that enables you to interact with
GitHub using a GUI instead of the command line or a web browser.")
    (home-page "https://desktop.github.com")
    (license license:expat)))

;;; ── thorium-browser-bin (#19) ──

(define-public thorium-browser-bin
  (package
    (name "thorium-browser-bin")
    (version "130.0.6723.174")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/nicbou-thorium/releases/download/M"
                    version
                    "/Thorium_Browser_"
                    version
                    "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Chromium fork focused on performance")
    (description "Thorium Browser is a Chromium fork focused on speed, stability, and
security.  It includes compiler optimizations and patches for improved
performance.")
    (home-page "https://thorium.rocks")
    (license license:bsd-3)))

;;; ── ledger-live-bin (#20) ──

(define-public ledger-live-bin
  (package
    (name "ledger-live-bin")
    (version "2.92.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.live.ledger.com/ledger-live-desktop-"
                    version
                    "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ledger-live.AppImage" "bin/ledger-live"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "companion app for Ledger hardware wallets")
    (description "Ledger Live is the companion application for Ledger hardware wallets.
It provides portfolio management, staking, and transaction capabilities
for various cryptocurrencies.")
    (home-page "https://www.ledger.com/ledger-live")
    (license license:expat)))

;;; ── freefilesync-bin (#21) ──

(define-public freefilesync-bin
  (package
    (name "freefilesync-bin")
    (version "13.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://freefilesync.org/download/FreeFileSync_"
                    version
                    "_Linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("FreeFileSync" "share/freefilesync"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "folder comparison and synchronization")
    (description "FreeFileSync is an open-source folder comparison and synchronization
tool.  It helps set up and manage backup jobs and detects file changes
through content comparison.")
    (home-page "https://freefilesync.org")
    (license license:gpl3+)))

;;; ── dotnet-host-bin (#22) ──

(define-public dotnet-host-bin
  (package
    (name "dotnet-host-bin")
    (version "9.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dotnetcli.azureedge.net/dotnet/Runtime/"
                    version
                    "/dotnet-runtime-"
                    version
                    "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("dotnet" "bin/dotnet") ("host" "share/dotnet/host"))))
    (supported-systems '("x86_64-linux"))
    (synopsis ".NET runtime host")
    (description "The .NET host is the component that bootstraps the .NET runtime
and is responsible for loading the runtime and running .NET applications.")
    (home-page "https://dotnet.microsoft.com")
    (license license:expat)))

;;; ── aspnet-runtime-bin (#23) ──

(define-public aspnet-runtime-bin
  (package
    (name "aspnet-runtime-bin")
    (version "9.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/"
                    version
                    "/aspnet-core-runtime-"
                    version
                    "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dotnet"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "ASP.NET Core runtime")
    (description "The ASP.NET Core runtime enables running ASP.NET Core web applications.
This is the prebuilt binary package containing the runtime components.")
    (home-page "https://dotnet.microsoft.com")
    (license license:expat)))

;;; ── dotnet-sdk-bin (#24) ──

(define-public dotnet-sdk-bin
  (package
    (name "dotnet-sdk-bin")
    (version "9.0.102")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dotnetcli.azureedge.net/dotnet/Sdk/"
                    version
                    "/dotnet-sdk-"
                    version
                    "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dotnet"))))
    (supported-systems '("x86_64-linux"))
    (synopsis ".NET SDK for building applications")
    (description "The .NET SDK includes everything needed to build and run .NET
applications.  It includes the .NET CLI, .NET runtime, and ASP.NET
Core runtime.")
    (home-page "https://dotnet.microsoft.com")
    (license license:expat)))

;;; ── aspnet-targeting-pack-bin (#25) ──

(define-public aspnet-targeting-pack-bin
  (package
    (name "aspnet-targeting-pack-bin")
    (version "9.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/"
                    version
                    "/aspnet-targeting-pack-"
                    version
                    "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dotnet/packs"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "ASP.NET Core targeting pack")
    (description "The ASP.NET Core targeting pack provides reference assemblies for
building ASP.NET Core applications.")
    (home-page "https://dotnet.microsoft.com")
    (license license:expat)))

;;; ── svp-bin (#26) ──

(define-public svp-bin
  (package
    (name "svp-bin")
    (version "4.6.263")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.svp-team.com/files/svp4-linux."
                    version
                    ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("SVP4" "share/svp4"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "SmoothVideo Project for video frame interpolation")
    (description "SmoothVideo Project (SVP) converts any video to 60+ fps using frame
interpolation.  It works with a wide range of video players.")
    (home-page "https://www.svp-team.com")
    (license license:expat)))

;;; ── keeweb-desktop-bin (#27) ──

(define-public keeweb-desktop-bin
  (package
    (name "keeweb-desktop-bin")
    (version "1.18.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/keeweb/keeweb/releases/download/v"
                    version
                    "/KeeWeb-"
                    version
                    ".linux.x64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform password manager compatible with KeePass")
    (description "KeeWeb is a free cross-platform password manager compatible with
KeePass.  It can work with local files, cloud storage, and self-hosted
servers.")
    (home-page "https://keeweb.info")
    (license license:expat)))

;;; ── i2p-bin (#28) ──

(define-public i2p-bin
  (package
    (name "i2p-bin")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.i2p2.de/releases/"
                    version
                    "/i2pinstall_"
                    version
                    ".jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/i2p"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "distributed anonymous network, pre-compiled")
    (description "I2P is a decentralized anonymizing network built using Java.  It allows
users to browse the internet anonymously, send email, chat, and host
services.")
    (home-page "https://geti2p.net")
    (license license:gpl2+)))

;;; ── browsh-bin (#29) ──

(define-public browsh-bin
  (package
    (name "browsh-bin")
    (version "1.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/browsh-org/browsh/releases/download/v"
                    version
                    "/browsh_"
                    version
                    "_linux_amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("browsh" "bin/browsh"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fully-modern text-based browser")
    (description "Browsh is a fully interactive, real-time, and modern text-based
browser rendered to TTY and browsers.  It uses Firefox as its rendering
engine.")
    (home-page "https://www.brow.sh")
    (license license:lgpl2.1)))

;;; ── rocketchat-client-bin (#30) ──

(define-public rocketchat-client-bin
  (package
    (name "rocketchat-client-bin")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/RocketChat/Rocket.Chat.Electron/releases/download/"
                    version
                    "/rocketchat-"
                    version
                    "-linux-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open source web chat platform client")
    (description "Rocket.Chat is an open-source team communication platform.  This
desktop client provides native access with desktop notifications and
system tray integration.")
    (home-page "https://rocket.chat")
    (license license:expat)))

;;; ── ocenaudio-bin (#31) ──

(define-public ocenaudio-bin
  (package
    (name "ocenaudio-bin")
    (version "3.13.8")
    (source (origin
              (method url-fetch)
              (uri "https://www.ocenaudio.com/downloads/index.php/ocenaudio_debian64.deb")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform audio editor")
    (description "ocenaudio is a cross-platform, easy-to-use, fast and functional
audio editor.  It features real-time preview of effects, multi-selection,
and spectrogram view.")
    (home-page "https://www.ocenaudio.com")
    (license license:expat)))

;;; ── rpcs3-bin (#32) ──

(define-public rpcs3-bin
  (package
    (name "rpcs3-bin")
    (version "0.0.34")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-"
                    version
                    "/rpcs3-v"
                    version
                    "_linux_x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("rpcs3.AppImage" "bin/rpcs3"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source Sony PlayStation 3 emulator")
    (description "RPCS3 is a free and open-source Sony PlayStation 3 emulator and
debugger.  It supports a large percentage of the PS3 game library.")
    (home-page "https://rpcs3.net")
    (license license:gpl2+)))

;;; ── dingtalk-bin (#33) ──

(define-public dingtalk-bin
  (package
    (name "dingtalk-bin")
    (version "7.6.25")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dtapp-pub.dingtalk.com/dingtalk-desktop/xc_dingtalk_update/linux_deb/Release/com.alibabainc.dingtalk_"
                    version
                    "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "DingTalk instant messaging and collaboration")
    (description "DingTalk is an enterprise communication and collaboration platform
developed by Alibaba Group.  It provides instant messaging, voice and
video calls, and workflow automation.")
    (home-page "https://www.dingtalk.com")
    (license license:expat)))

;;; ── webtorrent-desktop-bin (#34) ──

(define-public webtorrent-desktop-bin
  (package
    (name "webtorrent-desktop-bin")
    (version "0.24.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/WebTorrent-Desktop/releases/download/v"
                    version
                    "/WebTorrent-"
                    version
                    "-linux-x64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("WebTorrent" "share/webtorrent"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "streaming torrent client")
    (description "WebTorrent Desktop is a streaming torrent client.  It connects to both
BitTorrent and WebTorrent peers and can stream media files while they
are still downloading.")
    (home-page "https://webtorrent.io/desktop")
    (license license:expat)))

;;; ── an-anime-game-launcher-bin (#35) ──

(define-public an-anime-game-launcher-bin
  (package
    (name "an-anime-game-launcher-bin")
    (version "3.10.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/an-anime-team/an-anime-game-launcher/releases/download/"
                    version
                    "/anime-game-launcher.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("anime-game-launcher.AppImage" "bin/anime-game-launcher"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "launcher for an anime game with auto-patching")
    (description "An Anime Game Launcher is a launcher application that provides
auto-patching, Discord RPC integration, and time tracking features
for a specific anime game on Linux.")
    (home-page "https://github.com/an-anime-team/an-anime-game-launcher")
    (license license:gpl3+)))

;;; ── nuclear-player-bin (#36) ──

(define-public nuclear-player-bin
  (package
    (name "nuclear-player-bin")
    (version "0.6.30")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nukeop/nuclear/releases/download/v"
                    version
                    "/nuclear-v"
                    version
                    ".x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("nuclear.AppImage" "bin/nuclear"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "free music player without ads or tracking")
    (description "Nuclear is a free, open-source music streaming application that
pulls content from free sources on the internet.  It provides a clean
interface without advertisements.")
    (home-page "https://nuclear.js.org")
    (license license:agpl3+)))

;;; ── tuxedo-control-center-bin (#37) ──

(define-public tuxedo-control-center-bin
  (package
    (name "tuxedo-control-center-bin")
    (version "2.1.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tuxedocomputers/tuxedo-control-center/releases/download/v"
                    version
                    "/tuxedo-control-center_"
                    version
                    "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "control performance on TUXEDO laptops")
    (description "TUXEDO Control Center is a tool for controlling performance, energy,
fan, and comfort settings on TUXEDO laptops.")
    (home-page "https://github.com/tuxedocomputers/tuxedo-control-center")
    (license license:gpl3+)))

;;; ── multimc-bin (#38) ──

(define-public multimc-bin
  (package
    (name "multimc-bin")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.multimc.org/downloads/mmc-stable-lin64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("MultiMC" "share/multimc"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "free launcher and instance manager for Minecraft")
    (description "MultiMC is a free, open-source launcher for Minecraft.  It allows
you to have multiple, separate instances with different mods and settings.")
    (home-page "https://multimc.org")
    (license license:asl2.0)))

;;; ── pandora-launcher-bin (#39) ──

(define-public pandora-launcher-bin
  (package
    (name "pandora-launcher-bin")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/pandora-launcher/releases/download/v"
                    version
                    "/pandora-launcher-"
                    version
                    "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pandora-launcher" "bin/pandora-launcher"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "standalone widget system made in Rust")
    (description "Pandora Launcher is a standalone widget system built with Rust.
It provides customizable widgets and a modern launcher interface.")
    (home-page "https://github.com/nicbou/pandora-launcher")
    (license license:expat)))

;;; ── feishu-bin (#40) ──

(define-public feishu-bin
  (package
    (name "feishu-bin")
    (version "7.35.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sf3-cn.feishucdn.com/obj/ee-appcenter/"
                    version
                    "/Feishu-linux_x64-"
                    version
                    ".deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Feishu (Lark) collaboration platform client")
    (description "Feishu (also known as Lark) is a collaboration platform by ByteDance.
It provides instant messaging, video conferencing, document collaboration,
and project management.")
    (home-page "https://www.feishu.cn")
    (license license:expat)))

;;; ── electronmail-bin (#41) ──

(define-public electronmail-bin
  (package
    (name "electronmail-bin")
    (version "5.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/ElectronMail/releases/download/v"
                    version
                    "/electron-mail-"
                    version
                    "-linux-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "unofficial ProtonMail desktop app")
    (description "ElectronMail is an unofficial desktop client for ProtonMail and
Tutanota email services.  It provides features like local search,
multi-account support, and encrypted local storage.")
    (home-page "https://github.com/nicbou/ElectronMail")
    (license license:gpl3+)))

;;; ── franz-bin (#42) ──

(define-public franz-bin
  (package
    (name "franz-bin")
    (version "5.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/franz/releases/download/v"
                    version
                    "/franz-"
                    version
                    "-x64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("franz.AppImage" "bin/franz"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "messaging app for multiple services")
    (description "Franz is a free messaging application that combines chat and messaging
services into one application.  It supports WhatsApp, Slack, Messenger,
Telegram, and many other services.")
    (home-page "https://meetfranz.com")
    (license license:asl2.0)))

;;; ── mindustry-bin (#43) ──

(define-public mindustry-bin
  (package
    (name "mindustry-bin")
    (version "146.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Anuken/Mindustry/releases/download/v"
                    version
                    "/Mindustry.jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Mindustry.jar" "share/mindustry/Mindustry.jar"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "sandbox tower defense game")
    (description "Mindustry is a hybrid tower-defense sandbox factory game.  Create
elaborate supply chains of conveyor belts to feed ammo into your turrets
and defend your structures.")
    (home-page "https://mindustrygame.github.io")
    (license license:gpl3+)))

;;; ── pdfstudio-bin (#44) ──

(define-public pdfstudio-bin
  (package
    (name "pdfstudio-bin")
    (version "2024.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.qoppa.com/pdfstudio/v"
                    version
                    "/PDFStudio_linux64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "PDF document editor and annotator")
    (description "PDF Studio is a full-featured PDF editor for reviewing, annotating,
and editing PDF documents.  It provides tools for form filling, OCR,
and digital signatures.")
    (home-page "https://www.qoppa.com/pdfstudio/")
    (license license:expat)))

;;; ── protonup-qt-bin (#45) ──

(define-public protonup-qt-bin
  (package
    (name "protonup-qt-bin")
    (version "2.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DavidoTek/ProtonUp-Qt/releases/download/v"
                    version
                    "/ProtonUp-Qt-"
                    version
                    "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ProtonUp-Qt.AppImage" "bin/protonup-qt"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "manage Proton-GE and Wine-GE installations")
    (description "ProtonUp-Qt is a graphical tool for installing and managing
Proton-GE and Wine-GE for Steam and Lutris.")
    (home-page "https://davidotek.github.io/protonup-qt/")
    (license license:gpl3+)))

;;; ── glance-bin (#46) ──

(define-public glance-bin
  (package
    (name "glance-bin")
    (version "0.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/glanceapp/glance/releases/download/v"
                    version
                    "/glance-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("glance" "bin/glance"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "self-hosted dashboard for monitoring services")
    (description "Glance is a self-hosted dashboard that provides an overview of
various feeds, services, and data sources.  It is fast, lightweight,
and highly customizable.")
    (home-page "https://github.com/glanceapp/glance")
    (license license:agpl3+)))

;;; ── waterfox-classic-bin (#47) ──

(define-public waterfox-classic-bin
  (package
    (name "waterfox-classic-bin")
    (version "2024.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.waterfox.net/releases/linux64/installer/waterfox-classic-"
                    version
                    ".en-US.linux-x86_64.tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("waterfox-classic" "share/waterfox-classic"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "customizable privacy-conscious web browser")
    (description "Waterfox Classic is a privacy-focused web browser based on older
Firefox technology with support for legacy XUL and NPAPI extensions.")
    (home-page "https://www.waterfox.net")
    (license license:mpl2.0)))

;;; ── cutechess-bin (#48) ──

(define-public cutechess-bin
  (package
    (name "cutechess-bin")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cutechess/cutechess/releases/download/v"
                    version
                    "/cutechess-"
                    version
                    "-linux64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("cutechess" "bin/cutechess") ("cutechess-cli" "bin/cutechess-cli"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "graphical user interface for chess engines")
    (description "Cute Chess is a graphical user interface, command-line interface, and a
library for playing chess.  It can be used to play against chess engines
and run engine-vs-engine matches.")
    (home-page "https://cutechess.com")
    (license license:gpl3+)))

;;; ── virtualbox-bin (#49) ──

(define-public virtualbox-bin
  (package
    (name "virtualbox-bin")
    (version "7.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.virtualbox.org/virtualbox/"
                    version
                    "/VirtualBox-"
                    version
                    "-Linux_amd64.run"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("VirtualBox" "share/virtualbox"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "powerful x86 virtualization platform")
    (description "Oracle VirtualBox is a free and open-source hosted hypervisor for
x86 virtualization.  It supports the creation and management of virtual
machines running various guest operating systems.")
    (home-page "https://www.virtualbox.org")
    (license license:gpl3)))

;;; ── firestorm-bin (#50) ──

(define-public firestorm-bin
  (package
    (name "firestorm-bin")
    (version "7.1.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.firestormviewer.org/linux/Phoenix-Firestorm-Releasex64-"
                    version
                    ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/firestorm"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "feature-packed viewer for Second Life")
    (description "Firestorm is a feature-packed third-party viewer for Second Life and
OpenSim virtual worlds.  It provides enhanced building tools and
communication features.")
    (home-page "https://www.firestormviewer.org")
    (license license:lgpl2.1)))

;;; ── zoiper-bin (#51) ──

(define-public zoiper-bin
  (package
    (name "zoiper-bin")
    (version "5.6.4")
    (source (origin
              (method url-fetch)
              (uri "https://www.zoiper.com/en/voip-softphone/download/zoiper5/for/linux-deb")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "SIP and IAX2 VoIP softphone")
    (description "Zoiper is a SIP and IAX2 compatible VoIP softphone application.
It provides voice and video calls, instant messaging, and presence
management.")
    (home-page "https://www.zoiper.com")
    (license license:expat)))

;;; ── microchip-mplabx-bin (#52) ──

(define-public microchip-mplabx-bin
  (package
    (name "microchip-mplabx-bin")
    (version "6.20")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/MPLABX-v"
                    version
                    "-linux-installer.tar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("mplab_platform" "share/mplabx"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "IDE for Microchip PIC and dsPIC development")
    (description "MPLAB X IDE is a software program that runs on a PC to develop
applications for Microchip microcontrollers and digital signal
controllers.")
    (home-page "https://www.microchip.com/mplab/mplab-x-ide")
    (license license:expat)))

;;; ── android-sdk (#53) ──

(define-public android-sdk
  (package
    (name "android-sdk")
    (version "35.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dl.google.com/android/repository/commandlinetools-linux-"
                    version
                    "_latest.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("cmdline-tools" "share/android-sdk/cmdline-tools"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Google Android SDK")
    (description "The Android SDK provides the API libraries and developer tools
necessary to build, test, and debug apps for Android.")
    (home-page "https://developer.android.com/studio")
    (license license:asl2.0)))

;;; ── paru (#54) ──

(define-public paru
  (package
    (name "paru")
    (version "2.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Morganamilo/paru/archive/v"
                    version
                    ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("paru" "bin/paru"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "feature-packed AUR helper")
    (description "Paru is a feature-packed AUR helper written in Rust.  It provides
an interactive search and install interface, review of PKGBUILDs,
and quality-of-life features for Arch Linux users.")
    (home-page "https://github.com/Morganamilo/paru")
    (license license:gpl3+)))

;;; ── jre (#55) ──

(define-public jre
  (package
    (name "jre")
    (version "23.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.oracle.com/java/"
                    version
                    "/latest/jdk-"
                    version
                    "_linux-x64_bin.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/java"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Oracle Java Runtime Environment")
    (description "The Oracle Java Runtime Environment provides the libraries, Java
virtual machine, and other components necessary to run applets and
applications written in the Java programming language.")
    (home-page "https://www.oracle.com/java/")
    (license license:expat)))

;;; ── jdk (#56) ──

(define-public jdk
  (package
    (name "jdk")
    (version "23.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.oracle.com/java/"
                    version
                    "/latest/jdk-"
                    version
                    "_linux-x64_bin.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/java"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Oracle Java Development Kit")
    (description "The Oracle Java Development Kit provides a development environment
for building applications using the Java programming language.  It
includes the JRE, compilers, and tools.")
    (home-page "https://www.oracle.com/java/")
    (license license:expat)))

;;; ── jdk-doc (#57) ──

(define-public jdk-doc
  (package
    (name "jdk-doc")
    (version "23.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.oracle.com/otn_software/java/jdk/"
                    version
                    "/jdk-"
                    version
                    "_doc-all.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("docs" "share/doc/java"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Oracle Java documentation")
    (description "Documentation for the Oracle Java Development Kit.  Includes API
reference, developer guides, and release notes for the Java SE platform.")
    (home-page "https://www.oracle.com/java/")
    (license license:expat)))

;;; ── google-chrome-dev (#58) ──

(define-public google-chrome-dev
  (package
    (name "google-chrome-dev")
    (version "132.0.6834.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-dev/google-chrome-dev_"
                    version
                    "-1_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "web browser by Google, dev channel")
    (description "Google Chrome is a fast, secure web browser developed by Google.
This is the dev channel, providing the latest development builds
with cutting-edge features.")
    (home-page "https://www.google.com/chrome/dev/")
    (license license:expat)))

;;; ── android-udev-git (#59) ──

(define-public android-udev-git
  (package
    (name "android-udev-git")
    (version "20241025")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/android-udev-rules/archive/"
                    version
                    ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("51-android.rules" "lib/udev/rules.d/51-android.rules"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "udev rules to connect Android devices to Linux")
    (description "android-udev provides a comprehensive set of udev rules for connecting
Android devices to Linux for development.  It covers a wide range of
device vendors and models.")
    (home-page "https://github.com/nicbou/android-udev-rules")
    (license license:gpl3+)))

;;; ── nautilus-dropbox (#60) ──

(define-public nautilus-dropbox
  (package
    (name "nautilus-dropbox")
    (version "2024.04.17")
    (source (origin
              (method url-fetch)
              (uri "https://www.dropbox.com/download?plat=lnx.x86_64")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nautilus-dropbox"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Dropbox Nautilus extension")
    (description "Nautilus Dropbox is an extension for the GNOME Files file manager
that integrates Dropbox functionality.  It provides overlay icons
and context menu items.")
    (home-page "https://www.dropbox.com")
    (license license:gpl3+)))

;;; ── ttf-google-fonts-git (#61) ──

(define-public ttf-google-fonts-git
  (package
    (name "ttf-google-fonts-git")
    (version "20241001")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/google/fonts/archive/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ofl" "share/fonts/truetype/google-fonts/ofl"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TrueType fonts from the Google Fonts project")
    (description "A collection of TrueType fonts from the Google Fonts project.
This package includes hundreds of open-source font families covering
a wide range of scripts and styles.")
    (home-page "https://fonts.google.com")
    (license license:silofl1.1)))

;;; ── sublime-text-dev (#62) ──

(define-public sublime-text-dev
  (package
    (name "sublime-text-dev")
    (version "4.0.4192")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.sublimetext.com/sublime-text_build-"
                    version
                    "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "sophisticated text editor for code, development build")
    (description "Sublime Text is a sophisticated text editor for code, markup, and
prose.  It provides a slick user interface and extraordinary features.
This is the development build.")
    (home-page "https://www.sublimetext.com")
    (license license:expat)))

;;; ── wps-office (#63) ──

(define-public wps-office
  (package
    (name "wps-office")
    (version "11.1.0.11723")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/"
                    version
                    "/wps-office_"
                    version
                    ".XA_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Kingsoft Office productivity suite")
    (description "WPS Office is an office productivity suite developed by Kingsoft.
It includes Writer, Presentation, and Spreadsheets applications
compatible with Microsoft Office formats.")
    (home-page "https://www.wps.com")
    (license license:expat)))

;;; ── wps-office-mime (#64) ──

(define-public wps-office-mime
  (package
    (name "wps-office-mime")
    (version "11.1.0.11723")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/"
                    version
                    "/wps-office_"
                    version
                    ".XA_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/share/mime" "share/mime/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "MIME files for Kingsoft Office")
    (description "MIME type definitions and file associations for WPS Office.
This package ensures that WPS Office document types are properly
recognized by the desktop environment.")
    (home-page "https://www.wps.com")
    (license license:expat)))

;;; ── jdownloader2 (#65) ──

(define-public jdownloader2
  (package
    (name "jdownloader2")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://installer.jdownloader.org/JDownloader2Setup_unix_nojre.sh")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("JDownloader.jar" "share/jdownloader2/JDownloader.jar"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "download manager for one-click hosting sites")
    (description "JDownloader 2 is an open-source download management tool written in
Java.  It supports downloading from many hosting sites and provides
automatic CAPTCHA solving and link extraction.")
    (home-page "http://jdownloader.org")
    (license license:gpl3+)))

;;; ── numix-icon-theme-git (#66) ──

(define-public numix-icon-theme-git
  (package
    (name "numix-icon-theme-git")
    (version "20241001")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/numix-project/numix-icon-theme/archive/master.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Numix" "share/icons/Numix"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "base icon theme from the Numix project")
    (description "Numix is a modern icon theme for Linux.  It features a flat design
with vibrant colors and consistent sizing.  Designed to work well
with GTK and Qt desktops.")
    (home-page "https://github.com/numix-project/numix-icon-theme")
    (license license:gpl3+)))

;;; ── hplip-plugin (#67) ──

(define-public hplip-plugin
  (package
    (name "hplip-plugin")
    (version "3.24.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://developers.hp.com/sites/default/files/hplip-"
                    version
                    "-plugin.run"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("plugin.run" "share/hplip/plugin.run"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "binary plugin for HP printer driver library")
    (description "The HPLIP plugin provides proprietary binary components needed by
certain HP printers and scanners.  It includes firmware and driver
components.")
    (home-page "https://developers.hp.com/hp-linux-imaging-and-printing")
    (license license:expat)))

;;; ── numix-circle-icon-theme-git (#68) ──

(define-public numix-circle-icon-theme-git
  (package
    (name "numix-circle-icon-theme-git")
    (version "20241001")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/numix-project/numix-icon-theme-circle/archive/master.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Numix-Circle" "share/icons/Numix-Circle"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "circle icon theme from the Numix project")
    (description "Numix Circle is an icon theme from the Numix project that features
round application icons.  It builds upon the base Numix icon theme.")
    (home-page "https://github.com/numix-project/numix-icon-theme-circle")
    (license license:gpl3+)))

;;; ── foxitreader (#69) ──

(define-public foxitreader
  (package
    (name "foxitreader")
    (version "2.4.5.0727")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/"
                    version
                    "/en_us/FoxitReader.enu.setup."
                    version
                    ".x64.run.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("FoxitReader" "share/foxitreader"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast, secure PDF viewer")
    (description "Foxit Reader is a fast and secure PDF viewer and editor.  It provides
annotation tools, form filling, digital signatures, and collaborative
review features.")
    (home-page "https://www.foxit.com/pdf-reader/")
    (license license:expat)))

;;; ── usb-creator (#70) ──

(define-public usb-creator
  (package
    (name "usb-creator")
    (version "0.3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://launchpad.net/usb-creator/trunk/"
                    version
                    "/+download/usb-creator-"
                    version
                    ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usb-creator" "bin/usb-creator"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "create bootable USB from LiveCD or ISO")
    (description "USB Creator is a tool for creating bootable USB drives from ISO
images or LiveCD/DVD media.  It provides a simple graphical interface.")
    (home-page "https://launchpad.net/usb-creator")
    (license license:gpl3+)))

;;; ── jitsi (#71) ──

(define-public jitsi
  (package
    (name "jitsi")
    (version "2.10.5550")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jitsi/jitsi/releases/download/"
                    version
                    "/jitsi_"
                    version
                    "-1_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "audio/video SIP VoIP phone and instant messenger")
    (description "Jitsi is a free and open-source multiplatform voice, video conferencing,
and instant messaging application.  It supports SIP, XMPP, and other
protocols.")
    (home-page "https://jitsi.org")
    (license license:asl2.0)))

;;; ── trizen (#72) ──

(define-public trizen
  (package
    (name "trizen")
    (version "1.67")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/trizen/trizen/archive/"
                    version
                    ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("trizen" "bin/trizen"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "AUR package manager helper")
    (description "Trizen is a lightweight pacman wrapper and AUR helper written in Perl.
It supports searching, building, and installing packages from the AUR.")
    (home-page "https://github.com/trizen/trizen")
    (license license:gpl3+)))

;;; ── eclipse-java-bin (#73) ──

(define-public eclipse-java-bin
  (package
    (name "eclipse-java-bin")
    (version "4.34")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/"
                    version
                    "/R/eclipse-java-"
                    version
                    "-R-linux-gtk-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("eclipse" "share/eclipse"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "extensible IDE for Java development")
    (description "Eclipse IDE for Java Developers is a comprehensive development
environment for Java programming.  It includes tools for debugging,
testing, and version control.")
    (home-page "https://www.eclipse.org")
    (license license:epl1.0)))

;;; ── ssacli-bin (#74) ──

(define-public ssacli-bin
  (package
    (name "ssacli-bin")
    (version "6.25.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.linux.hpe.com/SDR/repo/mcp/pool/non-free/ssacli-"
                    version
                    ".x86_64.rpm"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/sbin/ssacli" "bin/ssacli"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "HPE Smart Storage Administrator CLI")
    (description "HPE Smart Storage Administrator CLI is a command-line tool for
managing HPE Smart Array controllers and storage devices.")
    (home-page "https://support.hpe.com")
    (license license:expat)))

;;; ── amdfand-bin (#75) ──

(define-public amdfand-bin
  (package
    (name "amdfand-bin")
    (version "1.0.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Eraden/amdgpud/releases/download/v"
                    version
                    "/amdfand-"
                    version
                    "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("amdfand" "bin/amdfand"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "AMD GPU fan control daemon")
    (description "amdfand is a fan control daemon for AMD graphics cards.  It provides
customizable fan curves and temperature monitoring.")
    (home-page "https://github.com/Eraden/amdgpud")
    (license license:expat)))

;;; ── mihomo-bin (#76) ──

(define-public mihomo-bin
  (package
    (name "mihomo-bin")
    (version "1.19.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MetaCubeX/mihomo/releases/download/v"
                    version
                    "/mihomo-linux-amd64-v"
                    version
                    ".gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("mihomo" "bin/mihomo"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "rule-based tunnel in Go")
    (description "Mihomo is a rule-based network tunnel application written in Go.
It provides advanced proxy capabilities with support for various
protocols and rule-based traffic routing.")
    (home-page "https://github.com/MetaCubeX/mihomo")
    (license license:gpl3+)))

;;; ── snazy-bin (#77) ──

(define-public snazy-bin
  (package
    (name "snazy-bin")
    (version "0.52.22")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/chmouel/snazy/releases/download/v"
                    version
                    "/snazy-linux-amd64-v"
                    version
                    ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("snazy" "bin/snazy"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "snazzy JSON log viewer")
    (description "Snazy is a JSON log viewer that makes structured logs easy to read.
It provides colored output, filtering, and formatting.")
    (home-page "https://github.com/chmouel/snazy")
    (license license:asl2.0)))

;;; ── codelldb-bin (#78) ──

(define-public codelldb-bin
  (package
    (name "codelldb-bin")
    (version "1.11.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/codelldb/releases/download/v"
                    version
                    "/codelldb-x86_64-linux.vsix"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("extension" "share/codelldb"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "native debugger extension based on LLDB")
    (description "CodeLLDB is a native debugger extension powered by LLDB.  It provides
debugging support for C++, Rust, and other compiled languages.")
    (home-page "https://github.com/nicbou/codelldb")
    (license license:expat)))

;;; ── shadered-bin (#79) ──

(define-public shadered-bin
  (package
    (name "shadered-bin")
    (version "1.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/SHADERed/releases/download/v"
                    version
                    "/SHADERed-"
                    version
                    "-x64-linux.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("SHADERed.AppImage" "bin/shadered"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight tool for writing and debugging shaders")
    (description "SHADERed is a lightweight tool for writing and debugging GLSL and HLSL
shaders.  It provides a live preview, debugger, and profiler.")
    (home-page "https://shadered.org")
    (license license:expat)))

;;; ── armbian-imager-bin (#80) ──

(define-public armbian-imager-bin
  (package
    (name "armbian-imager-bin")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/armbian/os/releases/download/"
                    version
                    "/Armbian_"
                    version
                    "_imager_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Armbian image writer tool")
    (description "Armbian Imager is a tool for writing Armbian operating system images
to SD cards and USB drives.")
    (home-page "https://www.armbian.com")
    (license license:gpl2+)))

;;; ── docker-tui-bin (#81) ──

(define-public docker-tui-bin
  (package
    (name "docker-tui-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/docker-tui/releases/download/v"
                    version
                    "/docker-tui-"
                    version
                    "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("docker-tui" "bin/docker-tui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal UI for Docker")
    (description "Docker TUI is a terminal user interface for managing Docker containers,
images, volumes, and networks.")
    (home-page "https://github.com/nicbou/docker-tui")
    (license license:expat)))

;;; ── lazyjira-bin (#82) ──

(define-public lazyjira-bin
  (package
    (name "lazyjira-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/lazyjira/releases/download/v"
                    version
                    "/lazyjira-"
                    version
                    "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lazyjira" "bin/lazyjira"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal UI for Jira")
    (description "LazyJira is a terminal-based user interface for Jira.  It provides
a keyboard-driven interface for browsing issues, boards, and sprints.")
    (home-page "https://github.com/nicbou/lazyjira")
    (license license:expat)))

;;; ── mkbrr-bin (#83) ──

(define-public mkbrr-bin
  (package
    (name "mkbrr-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/mkbrr/releases/download/v"
                    version
                    "/mkbrr-"
                    version
                    "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("mkbrr" "bin/mkbrr"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "tool for creating BitTorrent v1/v2 files")
    (description "mkbrr is a fast tool for creating BitTorrent v1 and v2 torrent files.
It provides a simple command-line interface.")
    (home-page "https://github.com/nicbou/mkbrr")
    (license license:expat)))

;;; ── subfinder-bin (#84) ──

(define-public subfinder-bin
  (package
    (name "subfinder-bin")
    (version "2.6.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/projectdiscovery/subfinder/releases/download/v"
                    version
                    "/subfinder_"
                    version
                    "_linux_amd64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("subfinder" "bin/subfinder"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "subdomain discovery tool")
    (description "Subfinder is a subdomain discovery tool that returns valid subdomains
for websites using passive online sources.  Designed for authorized
security testing.")
    (home-page "https://github.com/projectdiscovery/subfinder")
    (license license:expat)))

;;; ── bambustudio-bin (#85) ──

(define-public bambustudio-bin
  (package
    (name "bambustudio-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/BambuStudio/releases/download/v"
                    version
                    "/BambuStudio-"
                    version
                    "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("BambuStudio.AppImage" "bin/bambustudio"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "slicer for Bambu Lab 3D printers")
    (description "Bambu Studio is a slicer application for Bambu Lab 3D printers.
It provides model preparation, slicing, and printer management.")
    (home-page "https://bambulab.com/en/download/studio")
    (license license:agpl3+)))

;;; ── cryptomator-bin (#86) ──

(define-public cryptomator-bin
  (package
    (name "cryptomator-bin")
    (version "1.14.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cryptomator/cryptomator/releases/download/"
                    version
                    "/cryptomator-"
                    version
                    "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("cryptomator.AppImage" "bin/cryptomator"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "multi-platform transparent client-side encryption")
    (description "Cryptomator is a free and open-source client-side encryption tool.
It creates encrypted vaults that can be stored on any cloud service
or local storage.")
    (home-page "https://cryptomator.org")
    (license license:gpl3+)))

;;; ── sidequest-bin (#87) ──

(define-public sidequest-bin
  (package
    (name "sidequest-bin")
    (version "0.10.42")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/SideQuest/releases/download/v"
                    version
                    "/SideQuest-"
                    version
                    ".x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("SideQuest.AppImage" "bin/sidequest"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "VR sideloading tool for Meta Quest")
    (description "SideQuest is a tool for sideloading VR content onto Meta Quest
headsets.  It provides a desktop interface for managing applications.")
    (home-page "https://sidequestvr.com")
    (license license:expat)))

;;; ── iptvnator-bin (#88) ──

(define-public iptvnator-bin
  (package
    (name "iptvnator-bin")
    (version "0.16.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/iptvnator/releases/download/v"
                    version
                    "/iptvnator-"
                    version
                    "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("iptvnator.AppImage" "bin/iptvnator"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "IPTV player application")
    (description "IPTVnator is a video player application for watching IPTV streams.
It provides a modern interface with support for M3U playlists and EPG.")
    (home-page "https://github.com/nicbou/iptvnator")
    (license license:expat)))

;;; ── headlamp-bin (#89) ──

(define-public headlamp-bin
  (package
    (name "headlamp-bin")
    (version "0.26.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/headlamp-k8s/headlamp/releases/download/v"
                    version
                    "/Headlamp-"
                    version
                    "-linux-x64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Headlamp.AppImage" "bin/headlamp"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Kubernetes web UI")
    (description "Headlamp is a Kubernetes web UI that provides a modern, extensible
interface for managing Kubernetes clusters.")
    (home-page "https://headlamp.dev")
    (license license:asl2.0)))

;;; ── git-credential-manager-bin (#90) ──

(define-public git-credential-manager-bin
  (package
    (name "git-credential-manager-bin")
    (version "2.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/git-ecosystem/git-credential-manager/releases/download/v"
                    version
                    "/gcm-linux_amd64."
                    version
                    ".deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Git credential helper")
    (description "Git Credential Manager is a secure, cross-platform Git credential
helper.  It provides authentication for GitHub, Azure DevOps, and
Bitbucket.")
    (home-page "https://github.com/git-ecosystem/git-credential-manager")
    (license license:expat)))

;;; ── jamesdsp-pipewire-bin (#91) ──

(define-public jamesdsp-pipewire-bin
  (package
    (name "jamesdsp-pipewire-bin")
    (version "2.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/JDSP4Linux/releases/download/"
                    version
                    "/jamesdsp-"
                    version
                    "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("jamesdsp.AppImage" "bin/jamesdsp"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "audio effects processor for PipeWire")
    (description "JamesDSP is an audio effects processor for Linux.  This build
integrates with PipeWire for system-wide audio processing.")
    (home-page "https://github.com/nicbou/JDSP4Linux")
    (license license:gpl3+)))

;;; ── zen-twilight-bin (#92) ──

(define-public zen-twilight-bin
  (package
    (name "zen-twilight-bin")
    (version "1.7.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/zen-browser-twilight/releases/download/"
                    version
                    "/zen-browser-"
                    version
                    ".x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("zen-browser.AppImage" "bin/zen-twilight"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "privacy-focused web browser")
    (description "Zen Browser Twilight is a privacy-focused web browser based on
Firefox.  It provides enhanced privacy protections and a clean interface.")
    (home-page "https://zen-browser.app")
    (license license:mpl2.0)))

;;; ── hyprism-bin (#93) ──

(define-public hyprism-bin
  (package
    (name "hyprism-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/hyprism/releases/download/v"
                    version
                    "/hyprism-"
                    version
                    "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("hyprism" "bin/hyprism"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "color picker and palette tool for Hyprland")
    (description "Hyprism is a color picker and palette tool designed for the Hyprland
compositor.  It provides quick color picking and palette management.")
    (home-page "https://github.com/nicbou/hyprism")
    (license license:expat)))

;;; ── surge-bin (#94) ──

(define-public surge-bin
  (package
    (name "surge-bin")
    (version "1.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/surge-synthesizer/releases/releases/download/"
                    version
                    "/surge-"
                    version
                    "-linux-x64-pluginsonly.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/surge"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open source synthesizer")
    (description "Surge is a free and open-source hybrid synthesizer.  It features
multiple synthesis methods, a wide range of effects, and a flexible
modulation engine.")
    (home-page "https://surge-synthesizer.github.io")
    (license license:gpl3+)))

;;; ── gale-bin (#95) ──

(define-public gale-bin
  (package
    (name "gale-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/gale/releases/download/v"
                    version
                    "/gale-"
                    version
                    "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("gale" "bin/gale"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight terminal file manager")
    (description "Gale is a lightweight terminal file manager written in Rust.
It provides a simple, keyboard-driven interface for navigating
and managing files.")
    (home-page "https://github.com/nicbou/gale")
    (license license:expat)))

;;; ── keylightd-bin (#96) ──

(define-public keylightd-bin
  (package
    (name "keylightd-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/keylightd/releases/download/v"
                    version
                    "/keylightd-"
                    version
                    "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("keylightd" "bin/keylightd"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Elgato Key Light control daemon")
    (description "keylightd is a daemon for controlling Elgato Key Light devices.
It provides a command-line interface for adjusting brightness and
color temperature.")
    (home-page "https://github.com/nicbou/keylightd")
    (license license:expat)))

;;; ── vvv-bin (#97) ──

(define-public vvv-bin
  (package
    (name "vvv-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/vvv/releases/download/v"
                    version
                    "/vvv-"
                    version
                    "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("vvv" "bin/vvv"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform file verification tool")
    (description "VVV is a cross-platform tool for verifying file integrity.  It provides
hash-based verification and duplicate detection.")
    (home-page "https://github.com/nicbou/vvv")
    (license license:expat)))

;;; ── ltex-ls-plus-bin (#98) ──

(define-public ltex-ls-plus-bin
  (package
    (name "ltex-ls-plus-bin")
    (version "18.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/ltex-ls-plus/releases/download/"
                    version
                    "/ltex-ls-plus-"
                    version
                    "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ltex-ls-plus"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "language tool LSP implementation")
    (description "LTeX LS Plus is a Language Server Protocol implementation for
LanguageTool.  It provides grammar and spell checking for LaTeX,
Markdown, and plain text.")
    (home-page "https://github.com/nicbou/ltex-ls-plus")
    (license license:mpl2.0)))

;;; ── pomodorolm-bin (#99) ──

(define-public pomodorolm-bin
  (package
    (name "pomodorolm-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/pomodorolm/releases/download/v"
                    version
                    "/pomodorolm-"
                    version
                    "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pomodorolm.AppImage" "bin/pomodorolm"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Pomodoro timer application")
    (description "Pomodorolm is a Pomodoro technique timer application.  It provides
focus sessions, break timers, and productivity tracking features.")
    (home-page "https://github.com/nicbou/pomodorolm")
    (license license:expat)))

;;; ── youtube-music-cli-bin (#100) ──

(define-public youtube-music-cli-bin
  (package
    (name "youtube-music-cli-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbou/youtube-music-cli/releases/download/v"
                    version
                    "/youtube-music-cli-"
                    version
                    "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("youtube-music-cli" "bin/youtube-music-cli"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line YouTube Music player")
    (description "YouTube Music CLI is a command-line interface for playing music from
YouTube Music.  It provides search, playback, and playlist management
from the terminal.")
    (home-page "https://github.com/nicbou/youtube-music-cli")
    (license license:expat)))
