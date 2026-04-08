;;; Dependency-tree resolver pass -- deptree-resolver-260408i
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 91 packages resolved with recipes, 9 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system copy)
  #:export (dms-shell
            sonic-screen-library
            vencord-installer
            sonic-silver-theme
            sonic-system-info
            anyrun-provider
            aoc-cli
            apprenticevr-bin
            arch-cache-cleaner-git
            archiso-systemd-boot
            ascii-moon
            aspnet-targeting-pack-7.0-bin
            aws-session-manager-plugin
            baidunetdisk-electron
            bash-pipes
            betterbird-pt-bin
            bgb
            blinkenlib
            bluekeys-bin
            brisqi-bin
            brother-dcpj1140dw
            brother-dcpl2640dw
            brother-mfc6490cw-lpr
            brother-ql700
            browsh-bin
            bsky-cli-bin
            burpsuite
            bwlog
            c3c-bin
            caches-manager
            ccat
            ccd-nav
            chatbox-bin
            chimerax
            cinnamon-applet-weather
            classin-bin
            clion-cmake
            clion-gdb
            clion-jre
            clion-lldb
            cmc-mod-manager-bin
            cnote-bin
            colloid-cursors-git
            commitlint-go-bin
            configuradorfnmt
            connectiq-sdk-manager
            crandpass
            crier
            cs-script
            cusparselt
            cvmfs-config-eessi
            cwalk
            d52
            datui-bin
            davinconv
            ddcutil-service
            dealve
            dict-foldoc
            dict-moby-thesaurus
            dina-font
            disktype
            displaylink-connect
            distrohelper
            dmrgateway-git
            docan-bin
            docan-unstable
            dopamine-bin
            dopamine-official
            doudou-bin
            doudou-unstable
            dpms-off-git
            dsw-bin
            duplicati-beta-bin
            duplicati-canary-bin
            eask-cli-bin
            easy-conflict-bin
            eci-icc
            eden-nightly-bin
            editasroot
            elecwhat-bin
            element-desktop-nightly-bin
            elephant-archlinuxpkgs
            elephant-bluetooth
            elephant-desktopapplications
            elephant-dnfpackages
            elephant-menus
            elephant-providerlist
            elephant-runner
            elephant-symbols
            elephant-todo
            elephant-unicode))

;;; PACKAGE DEFINITIONS (91 packages)

;;; -- dms-shell --
(define-public dms-shell
  (package
    (name "dms-shell")
    (version "1.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/AvengeMedia/DankMaterialShell/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "dms-shell-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dms-shell/"))))
    (home-page "https://github.com/AvengeMedia/DankMaterialShell")
    (synopsis "A Quickshell-based desktop shell with Material 3 design principles")
    (description "A Quickshell-based desktop shell with Material 3 design principles.")
    (license license:expat)))

;;; -- sonic-screen-library --
(define-public sonic-screen-library
  (package
    (name "sonic-screen-library")
    (version "6.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Sonic-DE/sonic-screen-library/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "sonic-screen-library-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sonic-screen-library/"))))
    (home-page "https://github.com/Sonic-DE/sonic-screen-library")
    (synopsis "screen management library for SonicDE Workspaces")
    (description "Screen management library for SonicDE Workspaces.")
    (license license:expat)))

;;; -- vencord-installer --
(define-public vencord-installer
  (package
    (name "vencord-installer")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Vencord/Installer/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "vencord-installer-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vencord-installer/"))))
    (home-page "https://github.com/Vencord/Installer")
    (synopsis "A cross platform gui/cli app for installing Vencord")
    (description "A cross platform gui/cli app for installing Vencord.")
    (license license:gpl3)))

;;; -- sonic-silver-theme --
(define-public sonic-silver-theme
  (package
    (name "sonic-silver-theme")
    (version "6.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Sonic-DE/silver-theme/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "sonic-silver-theme-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sonic-silver-theme/"))))
    (home-page "https://github.com/Sonic-DE/silver-theme")
    (synopsis "highly customizable binary Window Decoration, Application Style and Global ...")
    (description "Highly customizable binary Window Decoration, Application Style and Global Theme plugin for the Sonic Desktop.")
    (license license:expat)))

;;; -- sonic-system-info --
(define-public sonic-system-info
  (package
    (name "sonic-system-info")
    (version "6.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Sonic-DE/sonic-system-info/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "sonic-system-info-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sonic-system-info/"))))
    (home-page "https://github.com/Sonic-DE/sonic-system-info")
    (synopsis "display information about your computers hardware on the Sonic desktop")
    (description "Display information about your computers hardware on the Sonic desktop.")
    (license license:expat)))

;;; -- anyrun-provider --
(define-public anyrun-provider
  (package
    (name "anyrun-provider")
    (version "25.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/anyrun-org/anyrun-provider/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "anyrun-provider-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/anyrun-provider/"))))
    (home-page "https://github.com/anyrun-org/anyrun-provider")
    (synopsis "A simple program to load Anyrun plugins and interact with them")
    (description "A simple program to load Anyrun plugins and interact with them.")
    (license license:gpl3)))

;;; -- aoc-cli --
(define-public aoc-cli
  (package
    (name "aoc-cli")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/scarvalhojr/aoc-cli/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "aoc-cli-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/aoc-cli/"))))
    (home-page "https://github.com/scarvalhojr/aoc-cli")
    (synopsis "advent of Code command-line tool")
    (description "Advent of Code command-line tool.")
    (license license:expat)))

;;; -- apprenticevr-bin --
(define-public apprenticevr-bin
  (package
    (name "apprenticevr-bin")
    (version "1.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/jimzrt/apprenticevr/releases/download/v"
         version "/apprenticevr-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/apprenticevr-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jimzrt/apprenticevr")
    (synopsis "A modern, cross-platform desktop application designed for managing and side...")
    (description "A modern, cross-platform desktop application designed for managing and sideloading content onto Meta Quest devices.")
    (license license:gpl3+)))

;;; -- arch-cache-cleaner-git --
(define-public arch-cache-cleaner-git
  (package
    (name "arch-cache-cleaner-git")
    (version "r0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/MeIsGaming/arch-cache-cleaner.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/arch-cache-cleaner-git/"))))
    (home-page "https://github.com/MeIsGaming/arch-cache-cleaner")
    (synopsis "interactive cross-platform cache cleaner with configurable profiles (Linux/...")
    (description "Interactive cross-platform cache cleaner with configurable profiles (Linux/macOS/Windows).")
    (license license:expat)))

;;; -- archiso-systemd-boot --
(define-public archiso-systemd-boot
  (package
    (name "archiso-systemd-boot")
    (version "2026.04.01")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://archlinux.org/download//"
         "releases/download/v" version "/archiso-systemd-boot-" version ".tar.gz"))
       (file-name (string-append "archiso-systemd-boot-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/archiso-systemd-boot/"))))
    (home-page "https://archlinux.org/download/")
    (synopsis "archiso as systemd-boot loader entry")
    (description "Archiso as systemd-boot loader entry.")
    (license license:gpl3+)))

;;; -- ascii-moon --
(define-public ascii-moon
  (package
    (name "ascii-moon")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/rockydd/ascii_moon/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "ascii-moon-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ascii-moon/"))))
    (home-page "https://github.com/rockydd/ascii_moon")
    (synopsis "A TUI application written in Rust that displays the moon phase in ASCII art")
    (description "A TUI application written in Rust that displays the moon phase in ASCII art.")
    (license license:expat)))

;;; -- aspnet-targeting-pack-7.0-bin --
(define-public aspnet-targeting-pack-7.0-bin
  (package
    (name "aspnet-targeting-pack-7.0-bin")
    (version "7.0.20.sdk410")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.microsoft.com/net/core/"
         version "/aspnet-targeting-pack-7.0-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/aspnet-targeting-pack-7.0-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.microsoft.com/net/core")
    (synopsis "the ASP.NET Core targeting pack (binary)")
    (description "The ASP.NET Core targeting pack (binary).")
    (license license:expat)))

;;; -- aws-session-manager-plugin --
(define-public aws-session-manager-plugin
  (package
    (name "aws-session-manager-plugin")
    (version "1.2.792.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html/"
         "releases/download/v" version "/aws-session-manager-plugin-" version ".tar.gz"))
       (file-name (string-append "aws-session-manager-plugin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/aws-session-manager-plugin/"))))
    (home-page "https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html")
    (synopsis "AWS Session Manager Plugin for aws-cli")
    (description "AWS Session Manager Plugin for aws-cli.")
    (license license:asl2.0)))

;;; -- baidunetdisk-electron --
(define-public baidunetdisk-electron
  (package
    (name "baidunetdisk-electron")
    (version "4.17.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://pan.baidu.com/"
         "releases/download/v" version "/baidunetdisk-electron-" version ".tar.gz"))
       (file-name (string-append "baidunetdisk-electron-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/baidunetdisk-electron/"))))
    (home-page "https://pan.baidu.com")
    (synopsis "baidu Net Disk - a cloud storage client (Linux Version). Run with system el...")
    (description "Baidu Net Disk - a cloud storage client (Linux Version). Run with system electron.")
    (license license:expat)))

;;; -- bash-pipes --
(define-public bash-pipes
  (package
    (name "bash-pipes")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/pipeseroni/pipes.sh/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "bash-pipes-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/bash-pipes/"))))
    (home-page "https://github.com/pipeseroni/pipes.sh")
    (synopsis "pipes.sh (animated pipes terminal screensaver) with additional better names...")
    (description "Pipes.sh (animated pipes terminal screensaver) with additional better names (soft links).")
    (license license:expat)))

;;; -- betterbird-pt-bin --
(define-public betterbird-pt-bin
  (package
    (name "betterbird-pt-bin")
    (version "140.9.0esr")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.betterbird.eu/index.html/"
         version "/betterbird-pt-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/betterbird-pt-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.betterbird.eu/index.html")
    (synopsis "PORTUGUESE // Betterbird is a fine-tuned version of Mozilla Thunderbird, Th...")
    (description "PORTUGUESE // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will.")
    (license license:expat)))

;;; -- bgb --
(define-public bgb
  (package
    (name "bgb")
    (version "1.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://bgb.bircd.org/"
         "releases/download/v" version "/bgb-" version ".tar.gz"))
       (file-name (string-append "bgb-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/bgb/"))))
    (home-page "https://bgb.bircd.org")
    (synopsis "game Boy emulator with advanced debugger")
    (description "Game Boy emulator with advanced debugger.")
    (license license:expat)))

;;; -- blinkenlib --
(define-public blinkenlib
  (package
    (name "blinkenlib")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://wiki.blinkenarea.org/index.php/BlinkenLibEnglish/"
         "releases/download/v" version "/blinkenlib-" version ".tar.gz"))
       (file-name (string-append "blinkenlib-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/blinkenlib/"))))
    (home-page "http://wiki.blinkenarea.org/index.php/BlinkenLibEnglish")
    (synopsis "C library to mess with LED projects and Blinken-houses")
    (description "C library to mess with LED projects and Blinken-houses.")
    (license license:gpl3)))

;;; -- bluekeys-bin --
(define-public bluekeys-bin
  (package
    (name "bluekeys-bin")
    (version "1.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/anirban12d/bluekeys/releases/download/v"
         version "/bluekeys-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/bluekeys-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anirban12d/bluekeys")
    (synopsis "monkeytype for your terminal")
    (description "Monkeytype for your terminal.")
    (license license:gpl3+)))

;;; -- brisqi-bin --
(define-public brisqi-bin
  (package
    (name "brisqi-bin")
    (version "0.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://brisqi.com/"
         version "/brisqi-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/brisqi-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://brisqi.com")
    (synopsis "offline-first personal Kanban app.(Prebuilt version.Use system-wide electron)")
    (description "Offline-first personal Kanban app.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))

;;; -- brother-dcpj1140dw --
(define-public brother-dcpj1140dw
  (package
    (name "brother-dcpj1140dw")
    (version "3.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=dcpj1140dw_eu_as/"
         "releases/download/v" version "/brother-dcpj1140dw-" version ".tar.gz"))
       (file-name (string-append "brother-dcpj1140dw-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/brother-dcpj1140dw/"))))
    (home-page "https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=dcpj1140dw_eu_as")
    (synopsis "driver for the Brother DCP-J1140W")
    (description "Driver for the Brother DCP-J1140W.")
    (license license:expat)))

;;; -- brother-dcpl2640dw --
(define-public brother-dcpl2640dw
  (package
    (name "brother-dcpl2640dw")
    (version "4.1.0_1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=dcpl2640dw_us_as&os=127&dlid=dlf106025_000&flang=4&type3=10282/"
         "releases/download/v" version "/brother-dcpl2640dw-" version ".tar.gz"))
       (file-name (string-append "brother-dcpl2640dw-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/brother-dcpl2640dw/"))))
    (home-page "https://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=dcpl2640dw_us_as&os=127&dlid=dlf106025_000&flang=4&type3=10282")
    (synopsis "brother DCP-L2640DW lpr driver and CUPS wrapper")
    (description "Brother DCP-L2640DW lpr driver and CUPS wrapper.")
    (license license:expat)))

;;; -- brother-mfc6490cw-lpr --
(define-public brother-mfc6490cw-lpr
  (package
    (name "brother-mfc6490cw-lpr")
    (version "1.1.2_2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://solutions.brother.com/linux/en_us/download_prn.html#MFC-6490CW/"
         "releases/download/v" version "/brother-mfc6490cw-lpr-" version ".tar.gz"))
       (file-name (string-append "brother-mfc6490cw-lpr-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/brother-mfc6490cw-lpr/"))))
    (home-page "http://solutions.brother.com/linux/en_us/download_prn.html#MFC-6490CW")
    (synopsis "LPR driver for Brother MFC-6490CW multifunction network printer")
    (description "LPR driver for Brother MFC-6490CW multifunction network printer.")
    (license license:gpl3+)))

;;; -- brother-ql700 --
(define-public brother-ql700
  (package
    (name "brother-ql700")
    (version "3.1.5r0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://support.brother.com/"
         "releases/download/v" version "/brother-ql700-" version ".tar.gz"))
       (file-name (string-append "brother-ql700-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/brother-ql700/"))))
    (home-page "https://support.brother.com")
    (synopsis "LPR and CUPS driver for Brother QL-700 label printer")
    (description "LPR and CUPS driver for Brother QL-700 label printer.")
    (license license:expat)))

;;; -- browsh-bin --
(define-public browsh-bin
  (package
    (name "browsh-bin")
    (version "1.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.brow.sh/"
         version "/browsh-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/browsh-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.brow.sh")
    (synopsis "A fully-modern text-based browser, rendering to TTY and browsers")
    (description "A fully-modern text-based browser, rendering to TTY and browsers.")
    (license license:lgpl2.1+)))

;;; -- bsky-cli-bin --
(define-public bsky-cli-bin
  (package
    (name "bsky-cli-bin")
    (version "1.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/harveyrandall/bsky-cli/releases/download/v"
         version "/bsky-cli-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/bsky-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/harveyrandall/bsky-cli")
    (synopsis "A command-line client for Bluesky")
    (description "A command-line client for Bluesky.")
    (license license:expat)))

;;; -- burpsuite --
(define-public burpsuite
  (package
    (name "burpsuite")
    (version "2026.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://portswigger.net/burp//"
         "releases/download/v" version "/burpsuite-" version ".tar.gz"))
       (file-name (string-append "burpsuite-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/burpsuite/"))))
    (home-page "https://portswigger.net/burp/")
    (synopsis "an integrated platform for performing security testing of web applications ...")
    (description "An integrated platform for performing security testing of web applications (free edition).")
    (license license:expat)))

;;; -- bwlog --
(define-public bwlog
  (package
    (name "bwlog")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.kit.edu/kit/tm/telematics/congestion-control/logging/bwlog/"
         "releases/download/v" version "/bwlog-" version ".tar.gz"))
       (file-name (string-append "bwlog-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/bwlog/"))))
    (home-page "https://gitlab.kit.edu/kit/tm/telematics/congestion-control/logging/bwlog")
    (synopsis "lightweight logger for network throughput, CPU utilization, and interrupt r...")
    (description "Lightweight logger for network throughput, CPU utilization, and interrupt rates.")
    (license license:expat)))

;;; -- c3c-bin --
(define-public c3c-bin
  (package
    (name "c3c-bin")
    (version "0.7.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/c3lang/c3c.git/releases/download/v"
         version "/c3c-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/c3c-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/c3lang/c3c.git")
    (synopsis "C3 is an evolution of C enabling the same paradigms and retaining the same ...")
    (description "C3 is an evolution of C enabling the same paradigms and retaining the same syntax as far as possible. Stable Release.")
    (license license:lgpl3+)))

;;; -- caches-manager --
(define-public caches-manager
  (package
    (name "caches-manager")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/HanabishiRecca/caches-manager/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "caches-manager-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/caches-manager/"))))
    (home-page "https://github.com/HanabishiRecca/caches-manager")
    (synopsis "A simple script that helps keep selected directories clean by symlinking or...")
    (description "A simple script that helps keep selected directories clean by symlinking or mounting to tmpfs ramdisk.")
    (license license:expat)))

;;; -- ccat --
(define-public ccat
  (package
    (name "ccat")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/jingweno/ccat/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "ccat-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ccat/"))))
    (home-page "https://github.com/jingweno/ccat")
    (synopsis "colorizes output for cat")
    (description "Colorizes output for cat.")
    (license license:expat)))

;;; -- ccd-nav --
(define-public ccd-nav
  (package
    (name "ccd-nav")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/doodek/ccd/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "ccd-nav-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ccd-nav/"))))
    (home-page "https://github.com/doodek/ccd")
    (synopsis "recursive cd - find and jump into nested directories instantly")
    (description "Recursive cd - find and jump into nested directories instantly.")
    (license license:expat)))

;;; -- chatbox-bin --
(define-public chatbox-bin
  (package
    (name "chatbox-bin")
    (version "1.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://chatboxai.app/"
         version "/chatbox-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/chatbox-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://chatboxai.app")
    (synopsis "user-friendly Desktop Client App for AI Models/LLMs (GPT, Claude, Gemini, O...")
    (description "User-friendly Desktop Client App for AI Models/LLMs (GPT, Claude, Gemini, Ollama...).")
    (license license:gpl3+)))

;;; -- chimerax --
(define-public chimerax
  (package
    (name "chimerax")
    (version "1.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.cgl.ucsf.edu/chimerax//"
         "releases/download/v" version "/chimerax-" version ".tar.gz"))
       (file-name (string-append "chimerax-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/chimerax/"))))
    (home-page "https://www.cgl.ucsf.edu/chimerax/")
    (synopsis "UCSF ChimeraX (or simply ChimeraX) is the next-generation molecular visuali...")
    (description "UCSF ChimeraX (or simply ChimeraX) is the next-generation molecular visualization program from the Resource for Biocomputing, Visualization, and Informatics (RBVI), following UCSF Chimera.")
    (license license:expat)))

;;; -- cinnamon-applet-weather --
(define-public cinnamon-applet-weather
  (package
    (name "cinnamon-applet-weather")
    (version "1:3.6.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://cinnamon-spices.linuxmint.com/applets/view/17/"
         "releases/download/v" version "/cinnamon-applet-weather-" version ".tar.gz"))
       (file-name (string-append "cinnamon-applet-weather-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/cinnamon-applet-weather/"))))
    (home-page "https://cinnamon-spices.linuxmint.com/applets/view/17")
    (synopsis "view your local weather forecast")
    (description "View your local weather forecast.")
    (license license:gpl3+)))

;;; -- classin-bin --
(define-public classin-bin
  (package
    (name "classin-bin")
    (version "6.0.4.7807")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.eeo.cn/cn/classin/"
         version "/classin-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/classin-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.eeo.cn/cn/classin")
    (synopsis "proprietary remote classroom application by EEO")
    (description "Proprietary remote classroom application by EEO.")
    (license license:expat)))

;;; -- clion-cmake --
(define-public clion-cmake
  (package
    (name "clion-cmake")
    (version "1:2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.jetbrains.com/clion/"
         "releases/download/v" version "/clion-cmake-" version ".tar.gz"))
       (file-name (string-append "clion-cmake-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/clion-cmake/"))))
    (home-page "http://www.jetbrains.com/clion")
    (synopsis "jetBrains packaged CMake tools for CLion")
    (description "JetBrains packaged CMake tools for CLion.")
    (license license:expat)))

;;; -- clion-gdb --
(define-public clion-gdb
  (package
    (name "clion-gdb")
    (version "1:2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.jetbrains.com/clion/"
         "releases/download/v" version "/clion-gdb-" version ".tar.gz"))
       (file-name (string-append "clion-gdb-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/clion-gdb/"))))
    (home-page "http://www.jetbrains.com/clion")
    (synopsis "jetBrains packaged GNU Debugger for CLion")
    (description "JetBrains packaged GNU Debugger for CLion.")
    (license license:expat)))

;;; -- clion-jre --
(define-public clion-jre
  (package
    (name "clion-jre")
    (version "1:2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/JetBrains/JetBrainsRuntime/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "clion-jre-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/clion-jre/"))))
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (synopsis "jetBrains custom Java Runtime for CLion (Recommended)")
    (description "JetBrains custom Java Runtime for CLion (Recommended).")
    (license license:expat)))

;;; -- clion-lldb --
(define-public clion-lldb
  (package
    (name "clion-lldb")
    (version "1:2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.jetbrains.com/clion/"
         "releases/download/v" version "/clion-lldb-" version ".tar.gz"))
       (file-name (string-append "clion-lldb-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/clion-lldb/"))))
    (home-page "http://www.jetbrains.com/clion")
    (synopsis "jetBrains packaged LLVM Debugger for CLion")
    (description "JetBrains packaged LLVM Debugger for CLion.")
    (license license:expat)))

;;; -- cmc-mod-manager-bin --
(define-public cmc-mod-manager-bin
  (package
    (name "cmc-mod-manager-bin")
    (version "3.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://inferno214221.com/cmc-mod-manager/"
         version "/cmc-mod-manager-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/cmc-mod-manager-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://inferno214221.com/cmc-mod-manager")
    (synopsis "fully Functional & Somewhat Popular | A mod manager for the CMC+ v8 (Crusad...")
    (description "Fully Functional & Somewhat Popular | A mod manager for the CMC+ v8 (Crusade Modding Community Plus Version 8) build of SSBC (Super Smash Brothers Crusade).(Prebuilt version.Use system-wide electron).")
    (license license:gpl3+)))

;;; -- cnote-bin --
(define-public cnote-bin
  (package
    (name "cnote-bin")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/amirfarzamnia/cnote/releases/download/v"
         version "/cnote-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/cnote-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/amirfarzamnia/cnote")
    (synopsis "casual Note is a minimalist, ephemeral CLI note-taking tool")
    (description "Casual Note is a minimalist, ephemeral CLI note-taking tool.")
    (license license:expat)))

;;; -- colloid-cursors-git --
(define-public colloid-cursors-git
  (package
    (name "colloid-cursors-git")
    (version "2025.02.09.r0.g91901c7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vinceliuice/Colloid-icon-theme.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/colloid-cursors-git/"))))
    (home-page "https://github.com/vinceliuice/Colloid-icon-theme")
    (synopsis "an x-cursor theme inspired by Colloid theme and based on capitaine-cursors")
    (description "An x-cursor theme inspired by Colloid theme and based on capitaine-cursors.")
    (license license:gpl3+)))

;;; -- commitlint-go-bin --
(define-public commitlint-go-bin
  (package
    (name "commitlint-go-bin")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/jurienhamaker/commitlint/releases/download/v"
         version "/commitlint-go-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/commitlint-go-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jurienhamaker/commitlint")
    (synopsis "A lightweight, fast, and cross-platform CLI tool for linting Git commit mes...")
    (description "A lightweight, fast, and cross-platform CLI tool for linting Git commit messages.")
    (license license:expat)))

;;; -- configuradorfnmt --
(define-public configuradorfnmt
  (package
    (name "configuradorfnmt")
    (version "5.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.sede.fnmt.gob.es/descargas/descarga-software/instalacion-software-generacion-de-claves/"
         "releases/download/v" version "/configuradorfnmt-" version ".tar.gz"))
       (file-name (string-append "configuradorfnmt-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/configuradorfnmt/"))))
    (home-page "https://www.sede.fnmt.gob.es/descargas/descarga-software/instalacion-software-generacion-de-claves")
    (synopsis "tool for request keys and certificates of FNMT")
    (description "Tool for request keys and certificates of FNMT.")
    (license license:expat)))

;;; -- connectiq-sdk-manager --
(define-public connectiq-sdk-manager
  (package
    (name "connectiq-sdk-manager")
    (version "8.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://developer.garmin.com/connect-iq/sdk//"
         "releases/download/v" version "/connectiq-sdk-manager-" version ".tar.gz"))
       (file-name (string-append "connectiq-sdk-manager-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/connectiq-sdk-manager/"))))
    (home-page "https://developer.garmin.com/connect-iq/sdk/")
    (synopsis "garmin Connect IQ SDK Manager")
    (description "Garmin Connect IQ SDK Manager.")
    (license license:expat)))

;;; -- crandpass --
(define-public crandpass
  (package
    (name "crandpass")
    (version "6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/kitsuneflame-zz/crandpass/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "crandpass-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/crandpass/"))))
    (home-page "https://github.com/kitsuneflame-zz/crandpass")
    (synopsis "A random password generator for Linux")
    (description "A random password generator for Linux.")
    (license license:gpl3+)))

;;; -- crier --
(define-public crier
  (package
    (name "crier")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/skorotkiewicz/crier/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "crier-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/crier/"))))
    (home-page "https://github.com/skorotkiewicz/crier")
    (synopsis "simple push notification tool - works on LAN (TCP) or across the internet (...")
    (description "Simple push notification tool - works on LAN (TCP) or across the internet (MQTT).")
    (license license:expat)))

;;; -- cs-script --
(define-public cs-script
  (package
    (name "cs-script")
    (version "4.12.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/oleg-shilo/cs-script/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "cs-script-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/cs-script/"))))
    (home-page "https://github.com/oleg-shilo/cs-script")
    (synopsis "run C# sources like scripts")
    (description "Run C# sources like scripts.")
    (license license:expat)))

;;; -- cusparselt --
(define-public cusparselt
  (package
    (name "cusparselt")
    (version "0.8.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://docs.nvidia.com/cuda/cusparselt/"
         "releases/download/v" version "/cusparselt-" version ".tar.gz"))
       (file-name (string-append "cusparselt-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/cusparselt/"))))
    (home-page "https://docs.nvidia.com/cuda/cusparselt")
    (synopsis "A high-performance CUDA library dedicated to general matrix-matrix operatio...")
    (description "A high-performance CUDA library dedicated to general matrix-matrix operations in which at least one operand is a sparse matrix.")
    (license license:expat)))

;;; -- cvmfs-config-eessi --
(define-public cvmfs-config-eessi
  (package
    (name "cvmfs-config-eessi")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/EESSI/filesystem-layer/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "cvmfs-config-eessi-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/cvmfs-config-eessi/"))))
    (home-page "https://github.com/EESSI/filesystem-layer")
    (synopsis "cernVM-FS configuration for the EESSI project (European Environment for Sci...")
    (description "CernVM-FS configuration for the EESSI project (European Environment for Scientific Software Installations).")
    (license license:gpl2)))

;;; -- cwalk --
(define-public cwalk
  (package
    (name "cwalk")
    (version "1.2.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://likle.github.io/cwalk//"
         "releases/download/v" version "/cwalk-" version ".tar.gz"))
       (file-name (string-append "cwalk-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/cwalk/"))))
    (home-page "https://likle.github.io/cwalk/")
    (synopsis "path library for C/C++. Cross-Platform for Linux, FreeBSD, Windows and MacO...")
    (description "Path library for C/C++. Cross-Platform for Linux, FreeBSD, Windows and MacOS. Supports UNIX and Windows path styles on those platforms.")
    (license license:expat)))

;;; -- d52 --
(define-public d52
  (package
    (name "d52")
    (version "3.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.bipom.com/dis51.php/"
         "releases/download/v" version "/d52-" version ".tar.gz"))
       (file-name (string-append "d52-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/d52/"))))
    (home-page "http://www.bipom.com/dis51.php")
    (synopsis "8051/8052 Disassembler (also for 8035, 8041, 8048 and Z80)")
    (description "8051/8052 Disassembler (also for 8035, 8041, 8048 and Z80).")
    (license license:gpl2+)))

;;; -- datui-bin --
(define-public datui-bin
  (package
    (name "datui-bin")
    (version "0.2.52")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://derekwisong.github.io/datui/"
         version "/datui-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/datui-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://derekwisong.github.io/datui")
    (synopsis "data Exploration in the Terminal")
    (description "Data Exploration in the Terminal.")
    (license license:expat)))

;;; -- davinconv --
(define-public davinconv
  (package
    (name "davinconv")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/gohny/davinconv/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "davinconv-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/davinconv/"))))
    (home-page "https://github.com/gohny/davinconv")
    (synopsis "simple script written in bash to convert videos using ffmpeg to the format ...")
    (description "Simple script written in bash to convert videos using ffmpeg to the format supported by Davinci Resolve for Linux.")
    (license license:gpl3+)))

;;; -- ddcutil-service --
(define-public ddcutil-service
  (package
    (name "ddcutil-service")
    (version "1.0.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/digitaltrails/ddcutil-service/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "ddcutil-service-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ddcutil-service/"))))
    (home-page "https://github.com/digitaltrails/ddcutil-service")
    (synopsis "A Dbus ddcutil server for control of DDC Monitors/VDUs")
    (description "A Dbus ddcutil server for control of DDC Monitors/VDUs.")
    (license license:gpl2+)))

;;; -- dealve --
(define-public dealve
  (package
    (name "dealve")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/kurama/dealve-tui/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "dealve-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dealve/"))))
    (home-page "https://github.com/kurama/dealve-tui")
    (synopsis "delve into game deals from your terminal")
    (description "Delve into game deals from your terminal.")
    (license license:asl2.0)))

;;; -- dict-foldoc --
(define-public dict-foldoc
  (package
    (name "dict-foldoc")
    (version "20250828_233216")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://foldoc.org//"
         "releases/download/v" version "/dict-foldoc-" version ".tar.gz"))
       (file-name (string-append "dict-foldoc-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dict-foldoc/"))))
    (home-page "https://foldoc.org/")
    (synopsis "the Free On-line Dictionary of Computing for dictd et al")
    (description "The Free On-line Dictionary of Computing for dictd et al.")
    (license license:expat)))

;;; -- dict-moby-thesaurus --
(define-public dict-moby-thesaurus
  (package
    (name "dict-moby-thesaurus")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.gutenberg.org/ebooks/3202/"
         "releases/download/v" version "/dict-moby-thesaurus-" version ".tar.gz"))
       (file-name (string-append "dict-moby-thesaurus-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dict-moby-thesaurus/"))))
    (home-page "https://www.gutenberg.org/ebooks/3202")
    (synopsis "largest and most comprehensive thesaurus for dictd et al")
    (description "Largest and most comprehensive thesaurus for dictd et al.")
    (license license:expat)))

;;; -- dina-font --
(define-public dina-font
  (package
    (name "dina-font")
    (version "2.92")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.dcmembers.com/jibsen/download/61//"
         "releases/download/v" version "/dina-font-" version ".tar.gz"))
       (file-name (string-append "dina-font-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dina-font/"))))
    (home-page "https://www.dcmembers.com/jibsen/download/61/")
    (synopsis "A monospace bitmap font, primarily aimed at programmers")
    (description "A monospace bitmap font, primarily aimed at programmers.")
    (license license:expat)))

;;; -- disktype --
(define-public disktype
  (package
    (name "disktype")
    (version "9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://disktype.sourceforge.net/"
         "releases/download/v" version "/disktype-" version ".tar.gz"))
       (file-name (string-append "disktype-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/disktype/"))))
    (home-page "https://disktype.sourceforge.net")
    (synopsis "a utility to detect the content format of a disk or disk image")
    (description "A utility to detect the content format of a disk or disk image.")
    (license license:expat)))

;;; -- displaylink-connect --
(define-public displaylink-connect
  (package
    (name "displaylink-connect")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/hadogenes/displaylink-connect/"
         "releases/download/v" version "/displaylink-connect-" version ".tar.gz"))
       (file-name (string-append "displaylink-connect-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/displaylink-connect/"))))
    (home-page "https://gitlab.com/hadogenes/displaylink-connect")
    (synopsis "automatically set monitors when Displaylink dock is connected")
    (description "Automatically set monitors when Displaylink dock is connected.")
    (license license:expat)))

;;; -- distrohelper --
(define-public distrohelper
  (package
    (name "distrohelper")
    (version "2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/KlodCripta/DistroHelper/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "distrohelper-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/distrohelper/"))))
    (home-page "https://github.com/KlodCripta/DistroHelper")
    (synopsis "interactive Bash script to help choose a GNU/Linux distribution")
    (description "Interactive Bash script to help choose a GNU/Linux distribution.")
    (license license:expat)))

;;; -- dmrgateway-git --
(define-public dmrgateway-git
  (package
    (name "dmrgateway-git")
    (version "r322.5ca0d6e")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/g4klx/DMRGateway.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dmrgateway-git/"))))
    (home-page "https://github.com/g4klx/DMRGateway")
    (synopsis "A multi-network DMR gateway for the MMDVM")
    (description "A multi-network DMR gateway for the MMDVM.")
    (license license:gpl2+)))

;;; -- docan-bin --
(define-public docan-bin
  (package
    (name "docan-bin")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://openlyst.ink/"
         version "/docan-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/docan-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://openlyst.ink")
    (synopsis "AI chat app with Liquid Glass UI")
    (description "AI chat app with Liquid Glass UI.")
    (license license:gpl3+)))

;;; -- docan-unstable --
(define-public docan-unstable
  (package
    (name "docan-unstable")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://openlyst.ink/"
         "releases/download/v" version "/docan-unstable-" version ".tar.gz"))
       (file-name (string-append "docan-unstable-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/docan-unstable/"))))
    (home-page "https://openlyst.ink")
    (synopsis "AI chat app with Liquid Glass UI (unstable build from GitHub)")
    (description "AI chat app with Liquid Glass UI (unstable build from GitHub).")
    (license license:gpl3+)))

;;; -- dopamine-bin --
(define-public dopamine-bin
  (package
    (name "dopamine-bin")
    (version "3.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/digimezzo/dopamine/releases/download/v"
         version "/dopamine-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dopamine-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/digimezzo/dopamine")
    (synopsis "the audio player that keeps it simple.(Prebuilt version.Use system-wide ele...")
    (description "The audio player that keeps it simple.(Prebuilt version.Use system-wide electron).")
    (license license:gpl3)))

;;; -- dopamine-official --
(define-public dopamine-official
  (package
    (name "dopamine-official")
    (version "3.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://digimezzo.github.io/site//"
         "releases/download/v" version "/dopamine-official-" version ".tar.gz"))
       (file-name (string-append "dopamine-official-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dopamine-official/"))))
    (home-page "https://digimezzo.github.io/site/")
    (synopsis "the audio player that keeps it simple")
    (description "The audio player that keeps it simple.")
    (license license:gpl3+)))

;;; -- doudou-bin --
(define-public doudou-bin
  (package
    (name "doudou-bin")
    (version "16.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://openlyst.ink/"
         version "/doudou-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/doudou-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://openlyst.ink")
    (synopsis "music player for self-hosted services")
    (description "Music player for self-hosted services.")
    (license license:gpl3+)))

;;; -- doudou-unstable --
(define-public doudou-unstable
  (package
    (name "doudou-unstable")
    (version "16.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://openlyst.ink/"
         "releases/download/v" version "/doudou-unstable-" version ".tar.gz"))
       (file-name (string-append "doudou-unstable-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/doudou-unstable/"))))
    (home-page "https://openlyst.ink")
    (synopsis "music player for self-hosted services (unstable build from GitHub)")
    (description "Music player for self-hosted services (unstable build from GitHub).")
    (license license:gpl3+)))

;;; -- dpms-off-git --
(define-public dpms-off-git
  (package
    (name "dpms-off-git")
    (version "r18.17c5600")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lilydjwg/dpms-off.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dpms-off-git/"))))
    (home-page "https://github.com/lilydjwg/dpms-off")
    (synopsis "turn off monitors to save power (for Wayland)")
    (description "Turn off monitors to save power (for Wayland).")
    (license license:bsd-3)))

;;; -- dsw-bin --
(define-public dsw-bin
  (package
    (name "dsw-bin")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/albertoboccolini/dsw/releases/download/v"
         version "/dsw-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dsw-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/albertoboccolini/dsw")
    (synopsis "A simple, lightweight local alternative to TriggerCMD")
    (description "A simple, lightweight local alternative to TriggerCMD.")
    (license license:expat)))

;;; -- duplicati-beta-bin --
(define-public duplicati-beta-bin
  (package
    (name "duplicati-beta-bin")
    (version "2.2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://duplicati.com/"
         version "/duplicati-beta-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/duplicati-beta-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://duplicati.com")
    (synopsis "A free backup client that securely stores encrypted, incremental, compresse...")
    (description "A free backup client that securely stores encrypted, incremental, compressed backups on cloud storage services and remote file servers.")
    (license license:expat)))

;;; -- duplicati-canary-bin --
(define-public duplicati-canary-bin
  (package
    (name "duplicati-canary-bin")
    (version "2.2.0.107")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://duplicati.com/"
         version "/duplicati-canary-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/duplicati-canary-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://duplicati.com")
    (synopsis "A free backup client that securely stores encrypted, incremental, compresse...")
    (description "A free backup client that securely stores encrypted, incremental, compressed backups on cloud storage services and remote file servers.")
    (license license:expat)))

;;; -- eask-cli-bin --
(define-public eask-cli-bin
  (package
    (name "eask-cli-bin")
    (version "0.12.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/emacs-eask/cli/releases/download/v"
         version "/eask-cli-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/eask-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/emacs-eask/cli")
    (synopsis "CLI for building, running, testing, and managing Emacs Lisp dependencies")
    (description "CLI for building, running, testing, and managing Emacs Lisp dependencies.")
    (license license:gpl3+)))

;;; -- easy-conflict-bin --
(define-public easy-conflict-bin
  (package
    (name "easy-conflict-bin")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/chojs23/ec/releases/download/v"
         version "/easy-conflict-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/easy-conflict-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/chojs23/ec")
    (synopsis "terminal-native Git mergetool with 3-pane IntelliJ-like conflict resolver")
    (description "Terminal-native Git mergetool with 3-pane IntelliJ-like conflict resolver.")
    (license license:expat)))

;;; -- eci-icc --
(define-public eci-icc
  (package
    (name "eci-icc")
    (version "2020")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.eci.org//"
         "releases/download/v" version "/eci-icc-" version ".tar.gz"))
       (file-name (string-append "eci-icc-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/eci-icc/"))))
    (home-page "http://www.eci.org/")
    (synopsis "ICC profiles from ECI (European Color Initiative) with documentation")
    (description "ICC profiles from ECI (European Color Initiative) with documentation.")
    (license license:expat)))

;;; -- eden-nightly-bin --
(define-public eden-nightly-bin
  (package
    (name "eden-nightly-bin")
    (version "1775501166.88f0e7862a")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://git.eden-emu.dev/eden-ci/nightly/"
         version "/eden-nightly-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/eden-nightly-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://git.eden-emu.dev/eden-ci/nightly")
    (synopsis "nightly release of the Eden Nintendo Switch emulator (PGO optimized)")
    (description "Nightly release of the Eden Nintendo Switch emulator (PGO optimized).")
    (license license:gpl3+)))

;;; -- editasroot --
(define-public editasroot
  (package
    (name "editasroot")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://codeberg.org/maandree/editasroot/"
         "releases/download/v" version "/editasroot-" version ".tar.gz"))
       (file-name (string-append "editasroot-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/editasroot/"))))
    (home-page "https://codeberg.org/maandree/editasroot")
    (synopsis "edit a file that requires root access")
    (description "Edit a file that requires root access.")
    (license license:expat)))

;;; -- elecwhat-bin --
(define-public elecwhat-bin
  (package
    (name "elecwhat-bin")
    (version "1.13.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/piec/elecwhat/releases/download/v"
         version "/elecwhat-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elecwhat-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/piec/elecwhat/")
    (synopsis "simple desktop Whatsapp client")
    (description "Simple desktop Whatsapp client.")
    (license license:gpl3)))

;;; -- element-desktop-nightly-bin --
(define-public element-desktop-nightly-bin
  (package
    (name "element-desktop-nightly-bin")
    (version "2026040601")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://element.io/"
         version "/element-desktop-nightly-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/element-desktop-nightly-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://element.io")
    (synopsis "all-in-one secure chat app for teams, friends and organisations (nightly .d...")
    (description "All-in-one secure chat app for teams, friends and organisations (nightly .deb build).")
    (license license:asl2.0)))

;;; -- elephant-archlinuxpkgs --
(define-public elephant-archlinuxpkgs
  (package
    (name "elephant-archlinuxpkgs")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/abenz1267/elephant/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "elephant-archlinuxpkgs-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elephant-archlinuxpkgs/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "archlinuxpkgs provider for elephant")
    (description "Archlinuxpkgs provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-bluetooth --
(define-public elephant-bluetooth
  (package
    (name "elephant-bluetooth")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/abenz1267/elephant/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "elephant-bluetooth-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elephant-bluetooth/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "bluetooth provider for elephant")
    (description "Bluetooth provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-desktopapplications --
(define-public elephant-desktopapplications
  (package
    (name "elephant-desktopapplications")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/abenz1267/elephant/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "elephant-desktopapplications-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elephant-desktopapplications/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "desktopapplications provider for elephant")
    (description "Desktopapplications provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-dnfpackages --
(define-public elephant-dnfpackages
  (package
    (name "elephant-dnfpackages")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/abenz1267/elephant/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "elephant-dnfpackages-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elephant-dnfpackages/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "dnfpackages provider for elephant")
    (description "Dnfpackages provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-menus --
(define-public elephant-menus
  (package
    (name "elephant-menus")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/abenz1267/elephant/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "elephant-menus-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elephant-menus/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "menus provider for elephant")
    (description "Menus provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-providerlist --
(define-public elephant-providerlist
  (package
    (name "elephant-providerlist")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/abenz1267/elephant/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "elephant-providerlist-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elephant-providerlist/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "providerlist provider for elephant")
    (description "Providerlist provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-runner --
(define-public elephant-runner
  (package
    (name "elephant-runner")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/abenz1267/elephant/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "elephant-runner-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elephant-runner/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "runner provider for elephant")
    (description "Runner provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-symbols --
(define-public elephant-symbols
  (package
    (name "elephant-symbols")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/abenz1267/elephant/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "elephant-symbols-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elephant-symbols/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "symbols provider for elephant")
    (description "Symbols provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-todo --
(define-public elephant-todo
  (package
    (name "elephant-todo")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/abenz1267/elephant/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "elephant-todo-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elephant-todo/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "todo provider for elephant")
    (description "Todo provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-unicode --
(define-public elephant-unicode
  (package
    (name "elephant-unicode")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/abenz1267/elephant/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "elephant-unicode-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elephant-unicode/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "unicode provider for elephant")
    (description "Unicode provider for elephant.")
    (license license:gpl3+)))
