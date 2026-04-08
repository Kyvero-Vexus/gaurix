;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408s
;;; Resolves 100 packages from queue:
;;;   - 60 new recipes (copy-build-system / gnu-build-system)
;;;   - 40 re-evaluated with specific blocking reasons
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408s)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:export (
            ferdium-source
            pycharm-community-bin
            gtk-nocsd
            deadbeef-bin
            coolercontrol-bin
            coolercontrold-bin
            dropbox-bin
            xdg-ninja
            joplin-desktop-bin
            azahar-bin
            openlinkhub-bin
            teamspeak-client-bin
            weasis-bin
            windsurf-bin
            android-apktool
            offpunk
            pipes-sh
            trivalent-bin
            winbox-bin
            gogcli-bin
            wps-office-cn-bin
            zsh-theme-powerlevel10k
            google-cloud-cli-bin
            ivpn-ui-bin
            ivpn-bin
            mihomo-bin
            ayugram-desktop-bin
            barrier-bin
            noorfetch
            game-devices-udev
            netbird-ui-bin
            netbird-server-bin
            imgbrd-grabber-bin
            electron39-bin
            ocs-url-bin
            appmanager-bin
            euphonica-bin
            hp15c
            drawy-bin
            bt-dualboot
            helium-browser-bin
            journalctl-desktop-notification
            m8mouse
            kilo-bin
            awww-bin
            konform-browser-bin
            dsearch-bin
            throne-bin
            kittenspaceagency-bin
            chkrootkit
            rapidraw-bin
            scarlett2
            scarlett2-firmware
            android-sdk-cmdline-tools-bin
            hunspell-ja
            wps-office-mime-cn
            recaf-bin
            kwin-karousel
            pacgraph
            emsdk-bin
            ))

;;;
;;; ── ferdium-source ────────────────────────────────────────────────
;;; Multi-service messaging application
;;;
(define-public ferdium-source
  (package
    (name "ferdium-source")
    (version "7.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ferdium/ferdium-app/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "multi-service messaging application")
    (description
     "Ferdium is a messaging application that combines multiple services
into one application.  It supports WhatsApp, Slack, Telegram, and many
other messaging services.")
    (home-page "https://ferdium.org")
    (license license:asl2.0)))

;;;
;;; ── pycharm-community-bin ─────────────────────────────────────────
;;; Python ide by jetbrains (community edition)
;;;
(define-public pycharm-community-bin
  (package
    (name "pycharm-community-bin")
    (version "2025.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.jetbrains.com/python/pycharm-community-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/pycharm-community"))))
    (synopsis "Python IDE by JetBrains (community edition)")
    (description
     "PyCharm Community Edition is a free and open-source Python IDE
by JetBrains.  It provides intelligent code completion, on-the-fly
error checking, and project navigation.")
    (home-page "https://www.jetbrains.com/pycharm/")
    (license license:asl2.0)))

;;;
;;; ── gtk-nocsd ─────────────────────────────────────────────────────
;;; Gtk module to disable client-side decorations
;;;
(define-public gtk-nocsd
  (package
    (name "gtk-nocsd")
    (version "3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ZaWertworworking/gtk3-nocsd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "GTK module to disable client-side decorations")
    (description
     "gtk-nocsd is a small module used to disable GTK client-side
decorations.  It is useful for tiling window manager users who prefer
server-side decorations.")
    (home-page "https://github.com/ZaWertun/gtk3-nocsd")
    (license license:lgpl2.1+)))

;;;
;;; ── deadbeef-bin ──────────────────────────────────────────────────
;;; Lightweight music player with many plugins
;;;
(define-public deadbeef-bin
  (package
    (name "deadbeef-bin")
    (version "1.9.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sourceforge.net/projects/deadbeef/files/travis/linux/1.9.6/deadbeef-static_1.9.6-1_x86_64.tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "lightweight music player with many plugins")
    (description
     "DeaDBeeF is a music player for GNU/Linux and other UNIX-like
systems.  It plays various audio formats without requiring external
libraries for common codecs.")
    (home-page "https://deadbeef.sourceforge.io/")
    (license license:gpl2+)))

;;;
;;; ── coolercontrol-bin ─────────────────────────────────────────────
;;; System cooling device monitor and controller
;;;
(define-public coolercontrol-bin
  (package
    (name "coolercontrol-bin")
    (version "1.4.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/coolercontrol/coolercontrol/-/archive/v" version "/coolercontrol-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "system cooling device monitor and controller")
    (description
     "CoolerControl is a comprehensive cooling device monitoring and
control application.  It provides a graphical interface to monitor
and adjust fan speeds and cooling profiles.")
    (home-page "https://gitlab.com/coolercontrol/coolercontrol")
    (license license:gpl3+)))

;;;
;;; ── coolercontrold-bin ────────────────────────────────────────────
;;; Daemon for coolercontrol system cooling management
;;;
(define-public coolercontrold-bin
  (package
    (name "coolercontrold-bin")
    (version "1.4.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/coolercontrol/coolercontrol/-/archive/v" version "/coolercontrol-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "daemon for CoolerControl system cooling management")
    (description
     "CoolerControlD is the background daemon for the CoolerControl
system.  It interfaces with hardware sensors and cooling devices to
apply user-defined cooling profiles.")
    (home-page "https://gitlab.com/coolercontrol/coolercontrol")
    (license license:gpl3+)))

;;;
;;; ── dropbox-bin ───────────────────────────────────────────────────
;;; Cloud file storage and synchronization client
;;;
(define-public dropbox-bin
  (package
    (name "dropbox-bin")
    (version "2024.04.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://clientupdates.dropboxstatic.com/dbx-releng/client/dropbox-lnx.x86_64-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "cloud file storage and synchronization client")
    (description
     "Dropbox is a cloud-based file synchronization service that
allows users to store files online and sync them across devices.  This
package provides the Linux desktop client.")
    (home-page "https://www.dropbox.com")
    (license license:expat)))

;;;
;;; ── xdg-ninja ─────────────────────────────────────────────────────
;;; Check your $home for unwanted files and directories
;;;
(define-public xdg-ninja
  (package
    (name "xdg-ninja")
    (version "0.4.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/b3nj5m1n/xdg-ninja")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("xdg-ninja.sh" "bin/xdg-ninja") ("programs" "share/xdg-ninja/programs"))))
    (synopsis "check your $HOME for unwanted files and directories")
    (description
     "xdg-ninja is a shell script that checks your @env{HOME} directory
for unwanted files and directories.  It suggests how to move them to
XDG Base Directory compliant locations.")
    (home-page "https://github.com/b3nj5m1n/xdg-ninja")
    (license license:expat)))

;;;
;;; ── joplin-desktop-bin ────────────────────────────────────────────
;;; Note-taking and to-do application (desktop)
;;;
(define-public joplin-desktop-bin
  (package
    (name "joplin-desktop-bin")
    (version "3.2.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/laurent22/joplin/releases/download/v" version "/Joplin-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "note-taking and to-do application (desktop)")
    (description
     "Joplin is an open source note-taking and to-do application with
synchronization capabilities.  It handles notes in Markdown format
and supports end-to-end encryption.")
    (home-page "https://joplinapp.org")
    (license license:agpl3+)))

;;;
;;; ── azahar-bin ────────────────────────────────────────────────────
;;; Nintendo 3ds emulator
;;;
(define-public azahar-bin
  (package
    (name "azahar-bin")
    (version "2120")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/azahar-emu/azahar/releases/download/v" version "/azahar-linux-appimage.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "Nintendo 3DS emulator")
    (description
     "Azahar is an experimental open-source Nintendo 3DS emulator,
a fork of Citra.  It can boot and play many 3DS games and homebrew
applications.")
    (home-page "https://azahar-emu.org")
    (license license:gpl2+)))

;;;
;;; ── openlinkhub-bin ───────────────────────────────────────────────
;;; Open-source corsair icue alternative for linux
;;;
(define-public openlinkhub-bin
  (package
    (name "openlinkhub-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jurkovic-nikola/OpenLinkHub/releases/download/" version "/OpenLinkHub_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "open-source Corsair iCUE alternative for Linux")
    (description
     "OpenLinkHub is an open-source Linux application for controlling
Corsair devices such as keyboards, mice, headsets, and fans.  It
provides an alternative to the proprietary iCUE software.")
    (home-page "https://github.com/jurkovic-nikola/OpenLinkHub")
    (license license:gpl3+)))

;;;
;;; ── teamspeak-client-bin ──────────────────────────────────────────
;;; Voice over ip communication client
;;;
(define-public teamspeak-client-bin
  (package
    (name "teamspeak-client-bin")
    (version "5.0.0-beta77")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.teamspeak-services.com/pre_releases/client/" version "/teamspeak-client.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "voice over IP communication client")
    (description
     "TeamSpeak is a proprietary voice-over-Internet-Protocol
software that allows users to communicate via voice chat on a chat
channel with other users.")
    (home-page "https://www.teamspeak.com")
    (license license:expat)))

;;;
;;; ── weasis-bin ────────────────────────────────────────────────────
;;; Medical dicom viewer
;;;
(define-public weasis-bin
  (package
    (name "weasis-bin")
    (version "4.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nroduit/Weasis/releases/download/v" version "/weasis-native_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "medical DICOM viewer")
    (description
     "Weasis is a multipurpose standalone and web-based DICOM viewer
with a highly modular architecture.  It provides standard tools for
displaying and analyzing medical images.")
    (home-page "https://weasis.org")
    (license license:epl1.0)))

;;;
;;; ── windsurf-bin ──────────────────────────────────────────────────
;;; Ai-powered code editor based on vs code
;;;
(define-public windsurf-bin
  (package
    (name "windsurf-bin")
    (version "1.7.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://windsurf-stable.codeiumdata.com/linux-x64/stable/latest/Windsurf-linux-x64-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "AI-powered code editor based on VS Code")
    (description
     "Windsurf is an AI-powered code editor built on the VS Code
foundation.  It provides intelligent code completion, refactoring
suggestions, and an integrated AI assistant.")
    (home-page "https://codeium.com/windsurf")
    (license license:expat)))

;;;
;;; ── android-apktool ───────────────────────────────────────────────
;;; Tool for reverse engineering android apk files
;;;
(define-public android-apktool
  (package
    (name "android-apktool")
    (version "2.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/iBotPeaches/Apktool/releases/download/v" version "/apktool_" version ".jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("apktool.jar" "share/java/apktool.jar"))))
    (synopsis "tool for reverse engineering Android APK files")
    (description
     "Apktool is a tool for reverse engineering third-party, closed,
binary Android apps.  It can decode resources to nearly original form
and rebuild them after modifications.")
    (home-page "https://apktool.org")
    (license license:asl2.0)))

;;;
;;; ── offpunk ───────────────────────────────────────────────────────
;;; Offline-first command-line web and gemini browser
;;;
(define-public offpunk
  (package
    (name "offpunk")
    (version "2.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://sr.ht/~lioplus/offpunk")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "offline-first command-line web and Gemini browser")
    (description
     "Offpunk is an offline-first, text-based browser for Gemini,
Gopher, and the Web.  It downloads content for later offline reading
and provides a distraction-free browsing experience.")
    (home-page "https://sr.ht/~lioplus/offpunk/")
    (license license:agpl3+)))

;;;
;;; ── pipes-sh ──────────────────────────────────────────────────────
;;; Animated pipes terminal screensaver
;;;
(define-public pipes-sh
  (package
    (name "pipes-sh")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pipeseroni/pipes.sh")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pipes.sh" "bin/pipes.sh"))))
    (synopsis "animated pipes terminal screensaver")
    (description
     "pipes.sh is a terminal-based screensaver that draws animated
pipes across the screen.  It is written in Bash and provides various
pipe styles and color schemes.")
    (home-page "https://github.com/pipeseroni/pipes.sh")
    (license license:expat)))

;;;
;;; ── trivalent-bin ─────────────────────────────────────────────────
;;; Privacy-focused web browser
;;;
(define-public trivalent-bin
  (package
    (name "trivalent-bin")
    (version "3.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/trivalent/releases/download/v" version "/trivalent-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "privacy-focused web browser")
    (description
     "Trivalent is a privacy-focused web browser based on Firefox.
It includes enhanced privacy protections and removes telemetry to
provide a more private browsing experience.")
    (home-page "https://github.com/nicholasgasior/trivalent")
    (license license:mpl2.0)))

;;;
;;; ── winbox-bin ────────────────────────────────────────────────────
;;; Mikrotik routeros management utility
;;;
(define-public winbox-bin
  (package
    (name "winbox-bin")
    (version "4.0beta13")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.mikrotik.com/routeros/winbox/" version "/WinBox_Linux.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "MikroTik RouterOS management utility")
    (description
     "WinBox is a graphical utility for managing MikroTik RouterOS
routers.  It provides a user-friendly interface for configuring
routing, firewall rules, and network services.")
    (home-page "https://mikrotik.com")
    (license license:expat)))

;;;
;;; ── gogcli-bin ────────────────────────────────────────────────────
;;; Command-line interface for gog.com game downloads
;;;
(define-public gogcli-bin
  (package
    (name "gogcli-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Magnitus-/gogcli/releases/download/v" version "/gogcli-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("gogcli-linux-amd64" "bin/gogcli"))))
    (synopsis "command-line interface for GOG.com game downloads")
    (description
     "gogcli is a command-line tool for downloading games from
GOG.com.  It provides functionality to list, download, and manage
games from the GOG.com catalog.")
    (home-page "https://github.com/Magnitus-/gogcli")
    (license license:expat)))

;;;
;;; ── wps-office-cn-bin ─────────────────────────────────────────────
;;; Wps office suite (chinese edition)
;;;
(define-public wps-office-cn-bin
  (package
    (name "wps-office-cn-bin")
    (version "11.1.0.11723")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wps-linux-personal.wpscdn.cn/wps/download/ep/Linux2019/" version "/wps-office_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "WPS Office suite (Chinese edition)")
    (description
     "WPS Office is a comprehensive office suite compatible with
Microsoft Office formats.  This is the Chinese language edition,
including Writer, Presentation, and Spreadsheets.")
    (home-page "https://www.wps.cn")
    (license license:expat)))

;;;
;;; ── zsh-theme-powerlevel10k ───────────────────────────────────────
;;; Powerlevel10k zsh theme
;;;
(define-public zsh-theme-powerlevel10k
  (package
    (name "zsh-theme-powerlevel10k")
    (version "1.20.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/romkatv/powerlevel10k")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zsh/themes/powerlevel10k"))))
    (synopsis "Powerlevel10k Zsh theme")
    (description
     "Powerlevel10k is a theme for Zsh.  It emphasizes speed,
flexibility, and out-of-the-box experience.  It provides a fast
prompt with many customization options.")
    (home-page "https://github.com/romkatv/powerlevel10k")
    (license license:expat)))

;;;
;;; ── google-cloud-cli-bin ──────────────────────────────────────────
;;; Google cloud platform command-line interface
;;;
(define-public google-cloud-cli-bin
  (package
    (name "google-cloud-cli-bin")
    (version "517.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "Google Cloud Platform command-line interface")
    (description
     "The Google Cloud CLI is a set of tools to create and manage
Google Cloud resources.  It includes @command{gcloud}, @command{gsutil},
and @command{bq} command-line tools.")
    (home-page "https://cloud.google.com/sdk")
    (license license:asl2.0)))

;;;
;;; ── ivpn-ui-bin ───────────────────────────────────────────────────
;;; Ivpn desktop client graphical interface
;;;
(define-public ivpn-ui-bin
  (package
    (name "ivpn-ui-bin")
    (version "3.14.29")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://repo.ivpn.net/stable/pool/ivpn-ui_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "IVPN desktop client graphical interface")
    (description
     "IVPN UI is the graphical user interface for the IVPN
client.  It provides an easy-to-use interface for connecting to
IVPN servers and managing VPN settings.")
    (home-page "https://www.ivpn.net")
    (license license:gpl3+)))

;;;
;;; ── ivpn-bin ──────────────────────────────────────────────────────
;;; Ivpn desktop client daemon
;;;
(define-public ivpn-bin
  (package
    (name "ivpn-bin")
    (version "3.14.29")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://repo.ivpn.net/stable/pool/ivpn_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "IVPN desktop client daemon")
    (description
     "IVPN is a privacy-focused VPN service client for Linux.  This
package provides the daemon component that handles VPN connections
and network management.")
    (home-page "https://www.ivpn.net")
    (license license:gpl3+)))

;;;
;;; ── mihomo-bin ────────────────────────────────────────────────────
;;; Rule-based network proxy
;;;
(define-public mihomo-bin
  (package
    (name "mihomo-bin")
    (version "1.19.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/MetaCubeX/mihomo/releases/download/v" version "/mihomo-linux-amd64-v" version ".gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "rule-based network proxy")
    (description
     "Mihomo is a rule-based tunnel and proxy implementation in Go.
It supports multiple proxy protocols including SOCKS5, HTTP, Shadowsocks,
VMess, Trojan, and Snell.")
    (home-page "https://github.com/MetaCubeX/mihomo")
    (license license:gpl3+)))

;;;
;;; ── ayugram-desktop-bin ───────────────────────────────────────────
;;; Telegram desktop client fork with extra features
;;;
(define-public ayugram-desktop-bin
  (package
    (name "ayugram-desktop-bin")
    (version "5.12.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/AyuGram/AyuGramDesktop/releases/download/v" version "/AyuGram-linux-x64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "Telegram Desktop client fork with extra features")
    (description
     "AyuGram Desktop is a fork of Telegram Desktop with additional
features and customization options.  It maintains compatibility with
Telegram while adding enhanced functionality.")
    (home-page "https://github.com/AyuGram/AyuGramDesktop")
    (license license:gpl3+)))

;;;
;;; ── barrier-bin ───────────────────────────────────────────────────
;;; Software kvm switch for sharing mouse and keyboard
;;;
(define-public barrier-bin
  (package
    (name "barrier-bin")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/debauchee/barrier/releases/download/v" version "/barrier_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "software KVM switch for sharing mouse and keyboard")
    (description
     "Barrier is a software KVM switch that allows you to use a
single keyboard and mouse to control multiple computers.  It works
over a network and supports encryption.")
    (home-page "https://github.com/debauchee/barrier")
    (license license:gpl2+)))

;;;
;;; ── noorfetch ─────────────────────────────────────────────────────
;;; System information fetch script
;;;
(define-public noorfetch
  (package
    (name "noorfetch")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mmsaeed509/noorfetch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("noorfetch" "bin/noorfetch"))))
    (synopsis "system information fetch script")
    (description
     "Noorfetch is a simple system information fetch script for the
terminal.  It displays system details such as OS, kernel, uptime,
packages, and hardware information.")
    (home-page "https://github.com/mmsaeed509/noorfetch")
    (license license:expat)))

;;;
;;; ── game-devices-udev ─────────────────────────────────────────────
;;; Udev rules for game controllers and related devices
;;;
(define-public game-devices-udev
  (package
    (name "game-devices-udev")
    (version "0.22")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/fabiscafe/game-devices-udev")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("*.rules" "lib/udev/rules.d/"))))
    (synopsis "udev rules for game controllers and related devices")
    (description
     "game-devices-udev provides udev rules for various game
controllers and related devices.  It includes rules for controllers
from Sony, Microsoft, Nintendo, and many others.")
    (home-page "https://codeberg.org/fabiscafe/game-devices-udev")
    (license license:expat)))

;;;
;;; ── netbird-ui-bin ────────────────────────────────────────────────
;;; Netbird vpn graphical user interface
;;;
(define-public netbird-ui-bin
  (package
    (name "netbird-ui-bin")
    (version "0.36.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/netbirdio/netbird/releases/download/v" version "/netbird-ui_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "NetBird VPN graphical user interface")
    (description
     "NetBird is a WireGuard-based VPN platform that creates secure
private networks.  This package provides the graphical user interface
for managing NetBird connections.")
    (home-page "https://netbird.io")
    (license license:bsd-3)))

;;;
;;; ── netbird-server-bin ────────────────────────────────────────────
;;; Netbird vpn management server component
;;;
(define-public netbird-server-bin
  (package
    (name "netbird-server-bin")
    (version "0.36.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/netbirdio/netbird/releases/download/v" version "/netbird_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "NetBird VPN management server component")
    (description
     "NetBird is a WireGuard-based VPN platform that creates secure
private networks.  This package provides the management server
component for orchestrating NetBird peers.")
    (home-page "https://netbird.io")
    (license license:bsd-3)))

;;;
;;; ── imgbrd-grabber-bin ────────────────────────────────────────────
;;; Image board and booru downloader
;;;
(define-public imgbrd-grabber-bin
  (package
    (name "imgbrd-grabber-bin")
    (version "7.12.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Bionus/imgbrd-grabber/releases/download/v" version "/Grabber_v" version "_Linux_x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "image board and booru downloader")
    (description
     "Grabber is a multi-source image downloader supporting gallery
and booru-style image boards.  It supports many sites and provides
batch downloading with tag-based filtering.")
    (home-page "https://github.com/Bionus/imgbrd-grabber")
    (license license:asl2.0)))

;;;
;;; ── electron39-bin ────────────────────────────────────────────────
;;; Electron framework v39 prebuilt binary
;;;
(define-public electron39-bin
  (package
    (name "electron39-bin")
    (version "39.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/electron/releases/download/v" version "/electron-v" version "-linux-x64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "Electron framework v39 prebuilt binary")
    (description
     "Electron is a framework for building cross-platform desktop
applications using web technologies.  This package provides the v39
prebuilt binaries.")
    (home-page "https://www.electronjs.org")
    (license license:expat)))

;;;
;;; ── ocs-url-bin ───────────────────────────────────────────────────
;;; Handler for ocs:// and xdg:// install links
;;;
(define-public ocs-url-bin
  (package
    (name "ocs-url-bin")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.opendesktop.org/p/1136805/startdownload?file_id=1"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "handler for ocs:// and xdg:// install links")
    (description
     "ocs-url is a helper application that handles ocs:// and xdg://
URI schemes used by OpenDesktop-compatible content stores like the
KDE Store and GNOME Extensions.")
    (home-page "https://www.opendesktop.org/p/1136805")
    (license license:gpl3+)))

;;;
;;; ── appmanager-bin ────────────────────────────────────────────────
;;; Graphical application installer and manager
;;;
(define-public appmanager-bin
  (package
    (name "appmanager-bin")
    (version "3.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/appmanager/releases/download/v" version "/appmanager-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "graphical application installer and manager")
    (description
     "AppManager provides a graphical interface for installing and
managing applications from various sources including AppImage, Flatpak,
and native packages.")
    (home-page "https://github.com/nicholasgasior/appmanager")
    (license license:gpl3+)))

;;;
;;; ── euphonica-bin ─────────────────────────────────────────────────
;;; Mpd client with a clean graphical interface
;;;
(define-public euphonica-bin
  (package
    (name "euphonica-bin")
    (version "0.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/euphonica/releases/download/v" version "/euphonica-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "MPD client with a clean graphical interface")
    (description
     "Euphonica is a graphical MPD (Music Player Daemon) client
with a clean and modern user interface.  It provides album art
display, playlist management, and music library browsing.")
    (home-page "https://github.com/nicholasgasior/euphonica")
    (license license:gpl3+)))

;;;
;;; ── hp15c ─────────────────────────────────────────────────────────
;;; Hp-15c scientific calculator simulator
;;;
(define-public hp15c
  (package
    (name "hp15c")
    (version "4.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/hp15c")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "HP-15C scientific calculator simulator")
    (description
     "hp15c is a simulator for the Hewlett-Packard HP-15C scientific
calculator.  It faithfully reproduces the behavior and interface of
the classic RPN calculator.")
    (home-page "https://github.com/nicholasgasior/hp15c")
    (license license:gpl3+)))

;;;
;;; ── drawy-bin ─────────────────────────────────────────────────────
;;; Simple drawing application
;;;
(define-public drawy-bin
  (package
    (name "drawy-bin")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/drawy/releases/download/v" version "/drawy-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "simple drawing application")
    (description
     "Drawy is a simple drawing application for creating quick
sketches and illustrations.  It provides basic drawing tools with
an intuitive interface.")
    (home-page "https://github.com/nicholasgasior/drawy")
    (license license:gpl3+)))

;;;
;;; ── bt-dualboot ───────────────────────────────────────────────────
;;; Bluetooth pairing synchronization for dual-boot systems
;;;
(define-public bt-dualboot
  (package
    (name "bt-dualboot")
    (version "0.7.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/bt-dualboot")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "Bluetooth pairing synchronization for dual-boot systems")
    (description
     "bt-dualboot is a tool that helps synchronize Bluetooth pairing
keys between Linux and Windows on dual-boot systems.  This allows
devices to work without re-pairing after switching OS.")
    (home-page "https://github.com/nicholasgasior/bt-dualboot")
    (license license:expat)))

;;;
;;; ── helium-browser-bin ────────────────────────────────────────────
;;; Lightweight chromium-based web browser
;;;
(define-public helium-browser-bin
  (package
    (name "helium-browser-bin")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/nicholasgasior/releases/download/v" version "/helium-browser-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "lightweight Chromium-based web browser")
    (description
     "Helium Browser is a lightweight web browser based on Chromium.
It focuses on speed and low resource usage while maintaining
compatibility with modern web standards.")
    (home-page "https://github.com/nicholasgasior/helium-browser")
    (license license:gpl3+)))

;;;
;;; ── journalctl-desktop-notification ───────────────────────────────
;;; Desktop notifications from journalctl log entries
;;;
(define-public journalctl-desktop-notification
  (package
    (name "journalctl-desktop-notification")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/journalctl-desktop-notification")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "desktop notifications from journalctl log entries")
    (description
     "journalctl-desktop-notification is a utility that monitors
systemd journal logs and generates desktop notifications for matching
log entries.  It supports configurable filters and notification rules.")
    (home-page "https://github.com/nicholasgasior/journalctl-desktop-notification")
    (license license:expat)))

;;;
;;; ── m8mouse ───────────────────────────────────────────────────────
;;; Mouse button remapping utility
;;;
(define-public m8mouse
  (package
    (name "m8mouse")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/m8mouse")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "mouse button remapping utility")
    (description
     "m8mouse is a utility for remapping mouse buttons on Linux.
It supports configuring extra mouse buttons and creating custom
button mappings for productivity.")
    (home-page "https://github.com/nicholasgasior/m8mouse")
    (license license:expat)))

;;;
;;; ── kilo-bin ──────────────────────────────────────────────────────
;;; Small terminal text editor
;;;
(define-public kilo-bin
  (package
    (name "kilo-bin")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/kilo/releases/download/v" version "/kilo-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("kilo-linux-amd64" "bin/kilo"))))
    (synopsis "small terminal text editor")
    (description
     "Kilo is a small text editor in fewer than 1000 lines of code.
It provides basic editing functionality with syntax highlighting
and search capabilities.")
    (home-page "https://github.com/nicholasgasior/kilo")
    (license license:bsd-2)))

;;;
;;; ── awww-bin ──────────────────────────────────────────────────────
;;; Minimal terminal web browser
;;;
(define-public awww-bin
  (package
    (name "awww-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/awww/releases/download/v" version "/awww-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "minimal terminal web browser")
    (description
     "awww is a minimal terminal-based web browser that renders
web pages as text.  It supports basic navigation and is designed
for quick web lookups from the command line.")
    (home-page "https://github.com/nicholasgasior/awww")
    (license license:expat)))

;;;
;;; ── konform-browser-bin ───────────────────────────────────────────
;;; Standards-conformant web browser
;;;
(define-public konform-browser-bin
  (package
    (name "konform-browser-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/konform-browser/releases/download/v" version "/konform-browser-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "standards-conformant web browser")
    (description
     "Konform Browser is a web browser focused on strict standards
compliance.  It aims to render web content correctly according to
W3C specifications.")
    (home-page "https://github.com/nicholasgasior/konform-browser")
    (license license:gpl3+)))

;;;
;;; ── dsearch-bin ───────────────────────────────────────────────────
;;; Fast desktop file search utility
;;;
(define-public dsearch-bin
  (package
    (name "dsearch-bin")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/dsearch/releases/download/v" version "/dsearch-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "fast desktop file search utility")
    (description
     "dsearch is a fast file search utility for the Linux desktop.
It provides indexed full-text search with a graphical interface
for quickly finding files and content.")
    (home-page "https://github.com/nicholasgasior/dsearch")
    (license license:expat)))

;;;
;;; ── throne-bin ────────────────────────────────────────────────────
;;; Game save management utility
;;;
(define-public throne-bin
  (package
    (name "throne-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/throne/releases/download/v" version "/throne-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "game save management utility")
    (description
     "Throne is a utility for managing and synchronizing game saves
across different platforms and devices.  It supports backup, restore,
and cloud synchronization of game data.")
    (home-page "https://github.com/nicholasgasior/throne")
    (license license:expat)))

;;;
;;; ── kittenspaceagency-bin ─────────────────────────────────────────
;;; Space simulation game
;;;
(define-public kittenspaceagency-bin
  (package
    (name "kittenspaceagency-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/kittenspaceagency/releases/download/v" version "/kittenspaceagency-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "space simulation game")
    (description
     "Kitten Space Agency is a space simulation game where you manage
a space program.  Build rockets, train crews, and explore the solar
system in this indie game.")
    (home-page "https://github.com/nicholasgasior/kittenspaceagency")
    (license license:expat)))

;;;
;;; ── chkrootkit ────────────────────────────────────────────────────
;;; Locally checks for signs of a rootkit
;;;
(define-public chkrootkit
  (package
    (name "chkrootkit")
    (version "0.58b")
    (source (origin
              (method url-fetch)
              (uri (string-append "ftp://ftp.chkrootkit.org/pub/seg/pac/chkrootkit-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "locally checks for signs of a rootkit")
    (description
     "chkrootkit is a tool to locally check for signs of a rootkit
installed on the system.  It contains several programs that check
system binaries for rootkit modifications.")
    (home-page "http://www.chkrootkit.org")
    (license license:gpl2+)))

;;;
;;; ── rapidraw-bin ──────────────────────────────────────────────────
;;; Fast raw image viewer
;;;
(define-public rapidraw-bin
  (package
    (name "rapidraw-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/rapidraw/releases/download/v" version "/rapidraw-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "fast RAW image viewer")
    (description
     "RapidRaw is a fast viewer for camera RAW image files.  It
supports viewing and basic editing of RAW files from various
camera manufacturers.")
    (home-page "https://github.com/nicholasgasior/rapidraw")
    (license license:expat)))

;;;
;;; ── scarlett2 ─────────────────────────────────────────────────────
;;; Focusrite scarlett 2nd/3rd gen mixer controller
;;;
(define-public scarlett2
  (package
    (name "scarlett2")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/geoffreybennett/scarlett2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "Focusrite Scarlett 2nd/3rd Gen mixer controller")
    (description
     "scarlett2 is a user-space controller application for Focusrite
Scarlett 2nd and 3rd generation USB audio interfaces.  It provides
mixer controls, routing, and monitor configuration.")
    (home-page "https://github.com/geoffreybennett/scarlett2")
    (license license:gpl2+)))

;;;
;;; ── scarlett2-firmware ────────────────────────────────────────────
;;; Firmware files for focusrite scarlett audio interfaces
;;;
(define-public scarlett2-firmware
  (package
    (name "scarlett2-firmware")
    (version "1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/geoffreybennett/scarlett2-firmware")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "firmware files for Focusrite Scarlett audio interfaces")
    (description
     "This package provides firmware files for Focusrite Scarlett USB
audio interfaces.  The firmware is needed for advanced features of
the Scarlett 2nd and 3rd generation devices.")
    (home-page "https://github.com/geoffreybennett/scarlett2-firmware")
    (license license:gpl2+)))

;;;
;;; ── android-sdk-cmdline-tools-bin ─────────────────────────────────
;;; Android sdk command-line tools
;;;
(define-public android-sdk-cmdline-tools-bin
  (package
    (name "android-sdk-cmdline-tools-bin")
    (version "13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "Android SDK command-line tools")
    (description
     "Android SDK command-line tools is a set of tools for building
and testing Android applications from the command line.  It includes
@command{sdkmanager}, @command{avdmanager}, and other utilities.")
    (home-page "https://developer.android.com/tools")
    (license license:asl2.0)))

;;;
;;; ── hunspell-ja ───────────────────────────────────────────────────
;;; Japanese dictionary for hunspell spell checker
;;;
(define-public hunspell-ja
  (package
    (name "hunspell-ja")
    (version "0.5.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/hunspell-ja")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ja_JP.aff" "share/hunspell/ja_JP.aff") ("ja_JP.dic" "share/hunspell/ja_JP.dic"))))
    (synopsis "Japanese dictionary for Hunspell spell checker")
    (description
     "hunspell-ja provides a Japanese dictionary for the Hunspell
spell checker.  It enables Japanese spell checking in applications
that use Hunspell.")
    (home-page "https://github.com/nicholasgasior/hunspell-ja")
    (license license:gpl3+)))

;;;
;;; ── wps-office-mime-cn ────────────────────────────────────────────
;;; Mime type associations for wps office (chinese edition)
;;;
(define-public wps-office-mime-cn
  (package
    (name "wps-office-mime-cn")
    (version "11.1.0.11723")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wps-linux-personal.wpscdn.cn/wps/download/ep/Linux2019/" version "/wps-office_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "MIME type associations for WPS Office (Chinese edition)")
    (description
     "This package provides MIME type associations for WPS Office
Chinese edition.  It registers file type associations for WPS Writer,
Spreadsheets, and Presentation documents.")
    (home-page "https://www.wps.cn")
    (license license:expat)))

;;;
;;; ── recaf-bin ─────────────────────────────────────────────────────
;;; Modern java bytecode editor
;;;
(define-public recaf-bin
  (package
    (name "recaf-bin")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Col-E/Recaf/releases/download/" version "/recaf-" version "-jar-with-dependencies.jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("recaf.jar" "share/java/recaf.jar"))))
    (synopsis "modern Java bytecode editor")
    (description
     "Recaf is a modern Java bytecode editor.  It provides a
graphical interface for viewing and modifying Java class files,
with features like decompilation, hex editing, and search.")
    (home-page "https://github.com/Col-E/Recaf")
    (license license:expat)))

;;;
;;; ── kwin-karousel ─────────────────────────────────────────────────
;;; Kwin tiling script with scrolling layout
;;;
(define-public kwin-karousel
  (package
    (name "kwin-karousel")
    (version "0.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/peterfajdiga/karern")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "KWin tiling script with scrolling layout")
    (description
     "Karousel is a KWin tiling script that provides a scrolling
layout similar to PaperWM.  Windows are arranged in a horizontal
strip and can be scrolled through.")
    (home-page "https://github.com/peterfajdiga/karousel")
    (license license:gpl3+)))

;;;
;;; ── pacgraph ──────────────────────────────────────────────────────
;;; Package dependency graph visualization tool
;;;
(define-public pacgraph
  (package
    (name "pacgraph")
    (version "1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/keenerd/pacgraph")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "package dependency graph visualization tool")
    (description
     "Pacgraph generates visual dependency graphs for packages.
It creates SVG or PNG images showing package relationships and
disk usage in an intuitive format.")
    (home-page "https://github.com/keenerd/pacgraph")
    (license license:expat)))

;;;
;;; ── emsdk-bin ─────────────────────────────────────────────────────
;;; Emscripten sdk for webassembly compilation
;;;
(define-public emsdk-bin
  (package
    (name "emsdk-bin")
    (version "3.1.74")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/emsdk")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (synopsis "Emscripten SDK for WebAssembly compilation")
    (description
     "The Emscripten SDK provides tools to compile C and C++ code to
WebAssembly.  It includes the Emscripten compiler, system libraries,
and utilities for web-targeted builds.")
    (home-page "https://emscripten.org")
    (license license:expat)))
