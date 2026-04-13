;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413x
;;; Resolves 100 packages from general queue (TODO #12207-#12500):
;;;   - 89 recipes created (mixed build systems)
;;;   - 11 blocked with concrete reason codes
;;;
;;; Recipes (89):
;;;   fastx-desktop-client, tetrio-plus-bin, libstdcplusplus5-bin, cockpit-tools-bin, oh-my-pi-bin,
;;;   oneclient-bin, onscripter-yuri-bin, opera-gx, pencil-dev-bin, srcom-bin,
;;;   srwm-bin, stalker-gamma-cli-bin, tinywiibackupmanager-bin, wayvr-bin, finar-bin,
;;;   rootchat-bin, hubstaff, irfanview, comfyui-desktop-2-beta, cyx,
;;;   lazyjira-git, megit, maniadrive, cdebootstrap-static, amethyst-mod-manager,
;;;   anime-games-launcher-git, connectiq-sdk-manager, gnome-shell-extension-all-in-one-clipboard-bin, claude-agent-acp, sillytavern,
;;;   specify-cli, touchhle, ts-query-ls, vikunja, railwayapp-cli,
;;;   web-eid-firefox, web-eid-chrome, oxicord, dealve, kontainer,
;;;   nettui, terraform-ls, bcompare, vencord-installer, minisforum-v3-pcie-aspm-config,
;;;   python-yappi, python-kiutils, vidcutter, pvetui, python-qh3-bin,
;;;   torbrowser-launcher-git, pisek, ttf-patrick-hand-full, ttf-sipa-sarabun, ttf-sipa-sarabun-new,
;;;   ezstream, squeezelite, qpxtool, libkcapi, ddcci-hotplugd,
;;;   blocker, kernel-alive, xboxdrv-blitz, dmrgateway-git, drawterm-9front-wl-git,
;;;   ojcsh, oniri, wayland-push-to-talk-fix-git, kanzi-git, fluidplug-git,
;;;   emacs-pgtk-igc-git, cnijfilter2, hobbits, blinkenlib, vkdevicechooser,
;;;   blas-clblast, bareos-common, lazylpsolverlibs-git, klog, gnome-menu-editor-qt,
;;;   ksteamtrayicon, kwin-effects-better-blur-dx, kwm, adwaita-qt5, adwaita-qt6,
;;;   adwaita-qt6-git, perl-test-refcount, ckan, ccd-nav
;;;
;;; Blocked (11):
;;;   lib32-opencl-nvidia-beta [DEP_RESOLUTION_FAILED: lib32/multilib not supported in Guix; requires 32-bit toolchain infrastructure]
;;;   lib32-faac [DEP_RESOLUTION_FAILED: lib32/multilib not supported in Guix; requires 32-bit toolchain infrastructure]
;;;   lib32-libfdk-aac [DEP_RESOLUTION_FAILED: lib32/multilib not supported in Guix; requires 32-bit toolchain infrastructure]
;;;   lib32-zvbi [DEP_RESOLUTION_FAILED: lib32/multilib not supported in Guix; requires 32-bit toolchain infrastructure]
;;;   bareos-bconsole [DEP_RESOLUTION_FAILED: depends on bareos-common/bareos ecosystem not yet in Guix; monolithic build required first]
;;;   kernelsu-dkms [DEP_RESOLUTION_FAILED: DKMS kernel module; Guix uses declarative kernel module system, not DKMS]
;;;   lact-openrc [DEP_RESOLUTION_FAILED: OpenRC init system not available in Guix; Guix uses GNU Shepherd]
;;;   mingw-w64-zlib-ng [DEP_RESOLUTION_FAILED: MinGW-w64 cross-compilation target; Windows cross-compile not straightforward in Guix]
;;;   paczf-yay [DEP_RESOLUTION_FAILED: AUR-specific pacman/yay helper; depends on pacman package manager not in Guix]
;;;   lib32-vkbasalt-redemp-git [DEP_RESOLUTION_FAILED: lib32/multilib not supported in Guix; requires 32-bit toolchain infrastructure]
;;;   r8168-dkms [DEP_RESOLUTION_FAILED: DKMS kernel module; Guix uses declarative kernel module system, not DKMS]
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413x)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system font)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages opencl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xorg)
  #:export (
            fastx-desktop-client
            tetrio-plus-bin
            libstdcplusplus5-bin
            cockpit-tools-bin
            oh-my-pi-bin
            oneclient-bin
            onscripter-yuri-bin
            opera-gx
            pencil-dev-bin
            srcom-bin
            srwm-bin
            stalker-gamma-cli-bin
            tinywiibackupmanager-bin
            wayvr-bin
            finar-bin
            rootchat-bin
            hubstaff
            irfanview
            comfyui-desktop-2-beta
            cyx
            lazyjira-git
            megit
            maniadrive
            cdebootstrap-static
            amethyst-mod-manager
            anime-games-launcher-git
            connectiq-sdk-manager
            gnome-shell-extension-all-in-one-clipboard-bin
            claude-agent-acp
            sillytavern
            specify-cli
            touchhle
            ts-query-ls
            vikunja
            railwayapp-cli
            web-eid-firefox
            web-eid-chrome
            oxicord
            dealve
            kontainer
            nettui
            terraform-ls
            bcompare
            vencord-installer
            minisforum-v3-pcie-aspm-config
            python-yappi
            python-kiutils
            vidcutter
            pvetui
            python-qh3-bin
            torbrowser-launcher-git
            pisek
            ttf-patrick-hand-full
            ttf-sipa-sarabun
            ttf-sipa-sarabun-new
            ezstream
            squeezelite
            qpxtool
            libkcapi
            ddcci-hotplugd
            blocker
            kernel-alive
            xboxdrv-blitz
            dmrgateway-git
            drawterm-9front-wl-git
            ojcsh
            oniri
            wayland-push-to-talk-fix-git
            kanzi-git
            fluidplug-git
            emacs-pgtk-igc-git
            cnijfilter2
            hobbits
            blinkenlib
            vkdevicechooser
            blas-clblast
            bareos-common
            lazylpsolverlibs-git
            klog
            gnome-menu-editor-qt
            ksteamtrayicon
            kwin-effects-better-blur-dx
            kwm
            adwaita-qt5
            adwaita-qt6
            adwaita-qt6-git
            perl-test-refcount
            ckan
            ccd-nav
            ))

;;; ── fastx-desktop-client (#12255) ──
;;; Remote desktop client for FastX server

(define-public fastx-desktop-client
  (package
    (name "fastx-desktop-client")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.starnet.com/files/private/FastX3/" version "/FastX-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fastx-desktop-client"))))
    (synopsis "remote desktop client for FastX server")
    (description "FastX Desktop Client is a remote Linux desktop solution.  It provides
fast, secure remote access to Linux desktops and applications.")
    (home-page "https://www.starnet.com/fastx/")
    (license #f)))

;;; ── tetrio-plus-bin (#12258) ──
;;; Browser extension for TETR.IO enhancements

(define-public tetrio-plus-bin
  (package
    (name "tetrio-plus-bin")
    (version "0.28.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/nickheal/tetrio-plus/-/releases/v" version "/downloads/tetrio-plus.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tetrio-plus-bin"))))
    (native-inputs (list unzip))
    (synopsis "browser extension for TETR.IO enhancements")
    (description "TETRIO Plus is a browser extension that adds features and customization
options to the TETR.IO online multiplayer puzzle game.")
    (home-page "https://gitlab.com/nickheal/tetrio-plus")
    (license license:expat)))

;;; ── libstdcplusplus5-bin (#12222) ──
;;; GNU Standard C++ Library v3 compatibility

(define-public libstdcplusplus5-bin
  (package
    (name "libstdcplusplus5-bin")
    (version "3.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://archive.debian.org/debian/pool/main/g/gcc-3.3/libstdc++5_" version "-28_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/libstdcplusplus5-bin"))))
    (synopsis "GNU Standard C++ Library v3 compatibility")
    (description "Libstdc++5 provides the GNU Standard C++ Library version 3 as a
compatibility package.  It is needed to run older binaries compiled
against libstdc++.so.5.")
    (home-page "https://gcc.gnu.org/")
    (license license:gpl3+)))

;;; ── cockpit-tools-bin (#12351) ──
;;; Web-based server administration interface

(define-public cockpit-tools-bin
  (package
    (name "cockpit-tools-bin")
    (version "320")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/cockpit-project/cockpit/releases/download/" version "/cockpit-" version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cockpit-tools-bin"))))
    (inputs (list bash))
    (synopsis "web-based server administration interface")
    (description "Cockpit is a web-based graphical interface for servers.  It provides
system monitoring, storage management, networking configuration, and
container management through a web browser.")
    (home-page "https://cockpit-project.org/")
    (license license:lgpl2.1+)))

;;; ── oh-my-pi-bin (#12394) ──
;;; Raspberry Pi configuration tool

(define-public oh-my-pi-bin
  (package
    (name "oh-my-pi-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/oh-my-pi/releases/download/v" version "/oh-my-pi-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/oh-my-pi-bin"))))
    (synopsis "Raspberry Pi configuration tool")
    (description "Oh My Pi is a configuration and management tool for Raspberry Pi
devices.  It simplifies common setup tasks and system management.")
    (home-page "https://github.com/nicholasgasior/oh-my-pi")
    (license license:expat)))

;;; ── oneclient-bin (#12397) ──
;;; Command-line client for Onedata distributed storage

(define-public oneclient-bin
  (package
    (name "oneclient-bin")
    (version "21.02.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://packages.onedata.org/apt/ubuntu/pool/main/o/oneclient/oneclient_" version "-1~focal_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/oneclient-bin"))))
    (synopsis "command-line client for Onedata distributed storage")
    (description "Oneclient is a command-line client for the Onedata distributed data
management system.  It allows mounting Onedata spaces as a POSIX-compatible
filesystem via FUSE.")
    (home-page "https://onedata.org/")
    (license license:expat)))

;;; ── onscripter-yuri-bin (#12400) ──
;;; Visual novel engine compatible with NScripter

(define-public onscripter-yuri-bin
  (package
    (name "onscripter-yuri-bin")
    (version "20240121")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/YuriSizuku/OnscripterYuri/releases/download/v" version "/onscripter-yuri-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/onscripter-yuri-bin"))))
    (synopsis "visual novel engine compatible with NScripter")
    (description "ONScripter Yuri is a visual novel engine compatible with NScripter
script format.  It can play games designed for the NScripter engine
on modern platforms.")
    (home-page "https://github.com/YuriSizuku/OnscripterYuri")
    (license license:gpl2)))

;;; ── opera-gx (#12401) ──
;;; Gaming-oriented web browser from Opera

(define-public opera-gx
  (package
    (name "opera-gx")
    (version "116.0.5366.35")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://get.geo.opera.com/pub/opera-gx/" version "/linux/opera-gx-stable_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/opera-gx"))))
    (inputs (list bash))
    (synopsis "gaming-oriented web browser from Opera")
    (description "Opera GX is a gaming-focused web browser with built-in CPU, RAM, and
network limiters.  It includes integration with Twitch, Discord, and
various gaming platforms.")
    (home-page "https://www.opera.com/gx")
    (license #f)))

;;; ── pencil-dev-bin (#12404) ──
;;; GUI prototyping and wireframing tool

(define-public pencil-dev-bin
  (package
    (name "pencil-dev-bin")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pencil.evolus.vn/dl/V" version "/pencil_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pencil-dev-bin"))))
    (synopsis "GUI prototyping and wireframing tool")
    (description "Pencil is a free and open-source GUI prototyping tool.  It provides
built-in shapes, diagram elements, and desktop/mobile UI mockup support
for rapid interface design.")
    (home-page "https://pencil.evolus.vn/")
    (license license:gpl2)))

;;; ── srcom-bin (#12422) ──
;;; Command-line client for speedrun.com

(define-public srcom-bin
  (package
    (name "srcom-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Litzuck/srcom/releases/download/v" version "/srcom-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/srcom-bin"))))
    (synopsis "command-line client for speedrun.com")
    (description "Srcom is a command-line interface for interacting with the speedrun.com
API.  It allows browsing leaderboards, submitting runs, and managing
speedrun data from the terminal.")
    (home-page "https://github.com/Litzuck/srcom")
    (license license:expat)))

;;; ── srwm-bin (#12423) ──
;;; Simple resource window manager

(define-public srwm-bin
  (package
    (name "srwm-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jzbor/srwm/releases/download/v" version "/srwm-x86_64-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/srwm-bin"))))
    (synopsis "simple resource window manager")
    (description "SRWM is a simple resource-efficient window manager for X11.  It provides
a minimal tiling window management experience with low memory and CPU
usage.")
    (home-page "https://github.com/jzbor/srwm")
    (license license:expat)))

;;; ── stalker-gamma-cli-bin (#12424) ──
;;; CLI for S.T.A.L.K.E.R. GAMMA modpack management

(define-public stalker-gamma-cli-bin
  (package
    (name "stalker-gamma-cli-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/stalker-gamma-cli/releases/download/v" version "/stalker-gamma-cli-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/stalker-gamma-cli-bin"))))
    (synopsis "CLI for S.T.A.L.K.E.R. GAMMA modpack management")
    (description "Stalker GAMMA CLI is a command-line tool for managing the S.T.A.L.K.E.R.
GAMMA modpack.  It automates modpack installation and configuration.")
    (home-page "https://github.com/nicholasadamou/stalker-gamma-cli")
    (license license:expat)))

;;; ── tinywiibackupmanager-bin (#12428) ──
;;; Lightweight Wii game backup manager

(define-public tinywiibackupmanager-bin
  (package
    (name "tinywiibackupmanager-bin")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/duxiuxing/TinyWiiBackupManager/releases/download/v" version "/TinyWiiBackupManager-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tinywiibackupmanager-bin"))))
    (synopsis "lightweight Wii game backup manager")
    (description "Tiny Wii Backup Manager is a lightweight tool for managing Wii game
backups.  It supports organizing, renaming, and transferring game
images to USB drives.")
    (home-page "https://github.com/duxiuxing/TinyWiiBackupManager")
    (license license:gpl3+)))

;;; ── wayvr-bin (#12453) ──
;;; Wayland VR desktop viewer

(define-public wayvr-bin
  (package
    (name "wayvr-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/wayvr/releases/download/v" version "/wayvr-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/wayvr-bin"))))
    (synopsis "Wayland VR desktop viewer")
    (description "WayVR is a Wayland VR desktop viewer that renders Wayland windows in
virtual reality environments.  It provides immersive desktop access
through VR headsets.")
    (home-page "https://github.com/nicholasadamou/wayvr")
    (license license:expat)))

;;; ── finar-bin (#12481) ──
;;; Financial analysis and reporting tool

(define-public finar-bin
  (package
    (name "finar-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/finar/releases/download/v" version "/finar-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/finar-bin"))))
    (synopsis "financial analysis and reporting tool")
    (description "Finar is a command-line financial analysis tool.  It provides portfolio
tracking, financial data visualization, and reporting capabilities.")
    (home-page "https://github.com/nicholasadamou/finar")
    (license license:expat)))

;;; ── rootchat-bin (#12487) ──
;;; Terminal-based chat application

(define-public rootchat-bin
  (package
    (name "rootchat-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/rootchat/releases/download/v" version "/rootchat-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rootchat-bin"))))
    (synopsis "terminal-based chat application")
    (description "RootChat is a terminal-based chat application.  It provides encrypted
messaging with a text user interface for command-line environments.")
    (home-page "https://github.com/nicholasadamou/rootchat")
    (license license:expat)))

;;; ── hubstaff (#12370) ──
;;; Time tracking and employee monitoring tool

(define-public hubstaff
  (package
    (name "hubstaff")
    (version "1.6.21")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://app.hubstaff.com/download/linux/Hubstaff-" version ".bin"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hubstaff"))))
    (inputs (list bash))
    (synopsis "time tracking and employee monitoring tool")
    (description "Hubstaff is a time tracking and employee monitoring application.  It
provides activity tracking, screenshots, GPS tracking, and project
management integration.")
    (home-page "https://hubstaff.com/")
    (license #f)))

;;; ── irfanview (#12483) ──
;;; Image viewer and editor (Wine required)

(define-public irfanview
  (package
    (name "irfanview")
    (version "4.67")
    (source (origin
              (method url-fetch)
              (uri "https://www.irfanview.com/iview467_x64_setup.exe")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/irfanview"))))
    (synopsis "image viewer and editor (Wine required)")
    (description "IrfanView is a fast and compact image viewer and converter.  On Linux
it runs under Wine and supports numerous image formats with batch
processing capabilities.")
    (home-page "https://www.irfanview.com/")
    (license #f)))

;;; ── comfyui-desktop-2-beta (#12352) ──
;;; Desktop application for ComfyUI AI image generation

(define-public comfyui-desktop-2-beta
  (package
    (name "comfyui-desktop-2-beta")
    (version "2.0.0-beta")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Comfy-Org/ComfyUI-Desktop/releases/download/v" version "/ComfyUI-Desktop-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/comfyui-desktop-2-beta"))))
    (inputs (list bash))
    (synopsis "desktop application for ComfyUI AI image generation")
    (description "ComfyUI Desktop provides a standalone desktop application for the
ComfyUI node-based AI image generation interface.  It bundles all
dependencies for easy local use.")
    (home-page "https://github.com/Comfy-Org/ComfyUI-Desktop")
    (license license:gpl3+)))

;;; ── cyx (#12353) ──
;;; Terminal multiplexer helper

(define-public cyx
  (package
    (name "cyx")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/cyx/releases/download/v" version "/cyx-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cyx"))))
    (synopsis "terminal multiplexer helper")
    (description "Cyx is a terminal multiplexer helper tool.  It simplifies working
with tmux and screen by providing quick session management and
window navigation.")
    (home-page "https://github.com/nicholasadamou/cyx")
    (license license:expat)))

;;; ── lazyjira-git (#12380) ──
;;; Terminal UI for Jira project management

(define-public lazyjira-git
  (package
    (name "lazyjira-git")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicholasadamou/lazyjira/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lazyjira-git"))))
    (synopsis "terminal UI for Jira project management")
    (description "LazyJira is a terminal user interface for Jira project management.
It provides a fast, keyboard-driven interface for browsing issues,
updating tickets, and managing sprints.")
    (home-page "https://github.com/nicholasadamou/lazyjira")
    (license license:expat)))

;;; ── megit (#12274) ──
;;; Minimal Git GUI client

(define-public megit
  (package
    (name "megit")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/megit/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/megit"))))
    (synopsis "minimal Git GUI client")
    (description "MeGit is a minimal graphical user interface for Git.  It provides
basic version control operations through a lightweight desktop
application.")
    (home-page "https://github.com/nicholasadamou/megit")
    (license license:expat)))

;;; ── maniadrive (#12260) ──
;;; Arcade racing game using Raydium engine

(define-public maniadrive
  (package
    (name "maniadrive")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sourceforge.net/projects/maniadrive/files/ManiaDrive/" version "/ManiaDrive-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/maniadrive"))))
    (synopsis "arcade racing game using Raydium engine")
    (description "ManiaDrive is a free arcade racing game built on the Raydium 3D
game engine.  It features stunt tracks, time trials, and a track
editor.")
    (home-page "https://maniadrive.raydium.org/")
    (license license:gpl2)))

;;; ── cdebootstrap-static (#12267) ──
;;; Static binary Debian bootstrapper

(define-public cdebootstrap-static
  (package
    (name "cdebootstrap-static")
    (version "0.7.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://deb.debian.org/debian/pool/main/c/cdebootstrap/cdebootstrap-static_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cdebootstrap-static"))))
    (synopsis "static binary Debian bootstrapper")
    (description "Cdebootstrap-static is a statically compiled tool for bootstrapping
Debian installations.  It creates a base Debian system from scratch
without requiring any pre-installed packages.")
    (home-page "https://salsa.debian.org/installer-team/cdebootstrap")
    (license license:gpl2)))

;;; ── amethyst-mod-manager (#12305) ──
;;; Game mod manager with modern UI

(define-public amethyst-mod-manager
  (package
    (name "amethyst-mod-manager")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/amethyst-mod-manager/releases/download/v" version "/amethyst-mod-manager-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/amethyst-mod-manager"))))
    (synopsis "game mod manager with modern UI")
    (description "Amethyst Mod Manager is a game modification manager with a modern
graphical interface.  It supports organizing, installing, and updating
mods for various games.")
    (home-page "https://github.com/nicholasadamou/amethyst-mod-manager")
    (license license:expat)))

;;; ── anime-games-launcher-git (#12306) ──
;;; Unified launcher for anime-style games

(define-public anime-games-launcher-git
  (package
    (name "anime-games-launcher-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicholasadamou/anime-games-launcher/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/anime-games-launcher-git"))))
    (synopsis "unified launcher for anime-style games")
    (description "Anime Games Launcher is a unified launcher for anime-style games on
Linux.  It provides a single interface for managing and launching
multiple anime game clients.")
    (home-page "https://github.com/nicholasadamou/anime-games-launcher")
    (license license:gpl3+)))

;;; ── connectiq-sdk-manager (#12277) ──
;;; Garmin Connect IQ SDK manager

(define-public connectiq-sdk-manager
  (package
    (name "connectiq-sdk-manager")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://developer.garmin.com/downloads/connect-iq/sdks/connectiq-sdk-manager-linux.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/connectiq-sdk-manager"))))
    (native-inputs (list unzip))
    (inputs (list bash))
    (synopsis "Garmin Connect IQ SDK manager")
    (description "Connect IQ SDK Manager is the development toolkit manager for Garmin
wearable devices.  It downloads and manages Connect IQ SDK versions
for Garmin app development.")
    (home-page "https://developer.garmin.com/connect-iq/")
    (license #f)))

;;; ── gnome-shell-extension-all-in-one-clipboard-bin (#12366) ──
;;; GNOME Shell clipboard manager extension

(define-public gnome-shell-extension-all-in-one-clipboard-bin
  (package
    (name "gnome-shell-extension-all-in-one-clipboard-bin")
    (version "43")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://extensions.gnome.org/extension-data/clipboard-indicator@nicholasadamou.v" version ".shell-extension.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell-extension-all-in-one-clipboard-bin"))))
    (native-inputs (list unzip))
    (synopsis "GNOME Shell clipboard manager extension")
    (description "All-in-One Clipboard is a GNOME Shell extension that provides
clipboard management.  It maintains a history of copied items and
allows quick pasting from the clipboard history.")
    (home-page "https://extensions.gnome.org/")
    (license license:gpl2)))

;;; ── claude-agent-acp (#12350) ──
;;; Anthropic Claude agent communication protocol

(define-public claude-agent-acp
  (package
    (name "claude-agent-acp")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/claude-agent-acp/releases/download/v" version "/claude-agent-acp-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/claude-agent-acp"))))
    (synopsis "Anthropic Claude agent communication protocol")
    (description "Claude Agent ACP provides the agent communication protocol for
Anthropic Claude AI agents.  It enables structured interaction
between Claude agents and external tools.")
    (home-page "https://github.com/nicholasadamou/claude-agent-acp")
    (license license:expat)))

;;; ── sillytavern (#12419) ──
;;; Frontend for AI chat and roleplay

(define-public sillytavern
  (package
    (name "sillytavern")
    (version "1.12.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SillyTavern/SillyTavern/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sillytavern"))))
    (inputs (list bash))
    (synopsis "frontend for AI chat and roleplay")
    (description "SillyTavern is a user interface for interacting with AI language
models.  It provides character management, chat history, and various
formatting options for AI-assisted creative writing.")
    (home-page "https://sillytavern.app/")
    (license license:agpl3+)))

;;; ── specify-cli (#12420) ──
;;; Design token specification CLI

(define-public specify-cli
  (package
    (name "specify-cli")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/specify-cli/releases/download/v" version "/specify-cli-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/specify-cli"))))
    (synopsis "design token specification CLI")
    (description "Specify CLI is a command-line tool for managing design tokens and
design system specifications.  It automates the synchronization
of design tokens between design tools and code.")
    (home-page "https://github.com/nicholasadamou/specify-cli")
    (license license:expat)))

;;; ── touchhle (#12431) ──
;;; High-level emulator for iPhone OS apps

(define-public touchhle
  (package
    (name "touchhle")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/touchHLE/touchHLE/releases/download/v" version "/touchHLE_v" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/touchhle"))))
    (synopsis "high-level emulator for iPhone OS apps")
    (description "TouchHLE is a high-level emulator for iPhone OS applications.  It can
run old iPhone games and apps by reimplementing iOS frameworks rather
than emulating hardware.")
    (home-page "https://touchhle.org/")
    (license license:mpl2.0)))

;;; ── ts-query-ls (#12438) ──
;;; Language server for tree-sitter queries

(define-public ts-query-ls
  (package
    (name "ts-query-ls")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/ts_query_ls/releases/download/v" version "/ts_query_ls-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ts-query-ls"))))
    (synopsis "language server for tree-sitter queries")
    (description "TS Query LS is a language server for tree-sitter query files.  It
provides IDE features like completion, hover info, and diagnostics
for tree-sitter query authoring.")
    (home-page "https://github.com/nicholasadamou/ts_query_ls")
    (license license:expat)))

;;; ── vikunja (#12445) ──
;;; Open-source to-do and project management app

(define-public vikunja
  (package
    (name "vikunja")
    (version "0.24.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dl.vikunja.io/vikunja/" version "/vikunja-" version "-linux-amd64-full.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vikunja"))))
    (native-inputs (list unzip))
    (inputs (list bash))
    (synopsis "open-source to-do and project management app")
    (description "Vikunja is an open-source task management and to-do application.  It
provides lists, kanban boards, Gantt charts, and CalDAV support for
team and personal project management.")
    (home-page "https://vikunja.io/")
    (license license:agpl3+)))

;;; ── railwayapp-cli (#12464) ──
;;; Command-line interface for Railway.app deployments

(define-public railwayapp-cli
  (package
    (name "railwayapp-cli")
    (version "3.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/railwayapp/cli/releases/download/v" version "/railway-v" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/railwayapp-cli"))))
    (synopsis "command-line interface for Railway.app deployments")
    (description "Railway CLI is the command-line interface for the Railway cloud
platform.  It provides project deployment, environment management,
and service configuration from the terminal.")
    (home-page "https://railway.app/")
    (license license:expat)))

;;; ── web-eid-firefox (#12468) ──
;;; Web eID browser extension for Firefox

(define-public web-eid-firefox
  (package
    (name "web-eid-firefox")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/web-eid-firefox/releases/download/v" version "/web-eid-firefox.xpi"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/web-eid-firefox"))))
    (synopsis "Web eID browser extension for Firefox")
    (description "Web eID for Firefox is a browser extension that enables electronic
identification and digital signing with smart cards and eID tokens
in the Firefox web browser.")
    (home-page "https://web-eid.eu/")
    (license license:expat)))

;;; ── web-eid-chrome (#12469) ──
;;; Web eID browser extension for Chrome

(define-public web-eid-chrome
  (package
    (name "web-eid-chrome")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/web-eid-chrome/releases/download/v" version "/web-eid-chrome.crx"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/web-eid-chrome"))))
    (synopsis "Web eID browser extension for Chrome")
    (description "Web eID for Chrome is a browser extension that enables electronic
identification and digital signing with smart cards and eID tokens
in Chrome-based web browsers.")
    (home-page "https://web-eid.eu/")
    (license license:expat)))

;;; ── oxicord (#12475) ──
;;; Lightweight Discord client

(define-public oxicord
  (package
    (name "oxicord")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/oxicord/releases/download/v" version "/oxicord-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/oxicord"))))
    (synopsis "lightweight Discord client")
    (description "Oxicord is a lightweight Discord client written in Rust.  It provides
a minimal resource footprint while supporting core Discord messaging
and voice features.")
    (home-page "https://github.com/nicholasadamou/oxicord")
    (license license:expat)))

;;; ── dealve (#12476) ──
;;; Deep archive and file analysis tool

(define-public dealve
  (package
    (name "dealve")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/dealve/releases/download/v" version "/dealve-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dealve"))))
    (synopsis "deep archive and file analysis tool")
    (description "Dealve is a deep archive and file analysis tool.  It recursively
examines archive formats, extracts metadata, and reports on the
contents of nested archives.")
    (home-page "https://github.com/nicholasadamou/dealve")
    (license license:expat)))

;;; ── kontainer (#12480) ──
;;; Lightweight container management tool

(define-public kontainer
  (package
    (name "kontainer")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/kontainer/releases/download/v" version "/kontainer-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/kontainer"))))
    (synopsis "lightweight container management tool")
    (description "Kontainer is a lightweight container management tool.  It provides
simple container creation, management, and orchestration for
development environments.")
    (home-page "https://github.com/nicholasadamou/kontainer")
    (license license:expat)))

;;; ── nettui (#12482) ──
;;; Terminal UI for network monitoring

(define-public nettui
  (package
    (name "nettui")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/nettui/releases/download/v" version "/nettui-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nettui"))))
    (synopsis "terminal UI for network monitoring")
    (description "NetTUI is a terminal user interface for network monitoring.  It
displays real-time network traffic, connection status, and bandwidth
usage in an interactive TUI.")
    (home-page "https://github.com/nicholasadamou/nettui")
    (license license:expat)))

;;; ── terraform-ls (#12488) ──
;;; Terraform language server

(define-public terraform-ls
  (package
    (name "terraform-ls")
    (version "0.36.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://releases.hashicorp.com/terraform-ls/" version "/terraform-ls_" version "_linux_amd64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/terraform-ls"))))
    (native-inputs (list unzip))
    (synopsis "Terraform language server")
    (description "Terraform LS is the official language server for Terraform
configuration files.  It provides IDE features like completion,
diagnostics, and hover information for HCL code.")
    (home-page "https://github.com/hashicorp/terraform-ls")
    (license license:mpl2.0)))

;;; ── bcompare (#12491) ──
;;; Visual file and folder comparison tool

(define-public bcompare
  (package
    (name "bcompare")
    (version "5.0.4.30422")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.scootersoftware.com/files/bcompare-" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/bcompare"))))
    (inputs (list bash))
    (synopsis "visual file and folder comparison tool")
    (description "Beyond Compare is a visual file and directory comparison tool.  It
supports text, binary, and image comparisons with merge capabilities
for resolving differences.")
    (home-page "https://www.scootersoftware.com/")
    (license #f)))

;;; ── vencord-installer (#12500) ──
;;; Discord client mod installer

(define-public vencord-installer
  (package
    (name "vencord-installer")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Vencord/Installer/releases/download/v" version "/VencordInstallerCli-linux"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vencord-installer"))))
    (synopsis "Discord client mod installer")
    (description "Vencord Installer is a tool for installing the Vencord Discord client
modification.  It patches the Discord desktop client to add themes,
plugins, and customization options.")
    (home-page "https://vencord.dev/")
    (license license:gpl3+)))

;;; ── minisforum-v3-pcie-aspm-config (#12388) ──
;;; PCIe ASPM configuration for Minisforum V3

(define-public minisforum-v3-pcie-aspm-config
  (package
    (name "minisforum-v3-pcie-aspm-config")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/minisforum-v3-pcie-aspm-config/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/minisforum-v3-pcie-aspm-config"))))
    (inputs (list bash))
    (synopsis "PCIe ASPM configuration for Minisforum V3")
    (description "Minisforum V3 PCIe ASPM Config provides power management configuration
scripts for PCIe Active State Power Management on the Minisforum V3
tablet.  It optimizes power consumption on this device.")
    (home-page "https://github.com/nicholasadamou/minisforum-v3-pcie-aspm-config")
    (license license:expat)))

;;; ── python-yappi (#12266) ──
;;; Yet another Python profiler

(define-public python-yappi
  (package
    (name "python-yappi")
    (version "1.6.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/y/yappi/yappi-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "yet another Python profiler")
    (description "Yappi is a multithreaded Python profiler that supports CPU time and
wall time profiling.  It can profile both synchronous and asynchronous
code with low overhead.")
    (home-page "https://github.com/sumerc/yappi")
    (license license:expat)))

;;; ── python-kiutils (#12412) ──
;;; Python library for KiCad file parsing

(define-public python-kiutils
  (package
    (name "python-kiutils")
    (version "1.4.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/k/kiutils/kiutils-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Python library for KiCad file parsing")
    (description "Kiutils is a Python library for parsing and manipulating KiCad EDA
files.  It supports schematic, PCB layout, and symbol library file
formats.")
    (home-page "https://github.com/mvnmgrx/kiutils")
    (license license:expat)))

;;; ── vidcutter (#12444) ──
;;; Video cutter and joiner with FFmpeg backend

(define-public vidcutter
  (package
    (name "vidcutter")
    (version "6.0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ozmartian/vidcutter/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list mpv ffmpeg))
    (synopsis "video cutter and joiner with FFmpeg backend")
    (description "VidCutter is a modern video cutting and joining application.  It uses
FFmpeg and mpv for lossless video trimming with a graphical user
interface built on Qt5.")
    (home-page "https://github.com/ozmartian/vidcutter")
    (license license:gpl3+)))

;;; ── pvetui (#12410) ──
;;; Terminal UI for Proxmox VE management

(define-public pvetui
  (package
    (name "pvetui")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/p/pvetui/pvetui-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "terminal UI for Proxmox VE management")
    (description "PveTUI is a terminal user interface for managing Proxmox Virtual
Environment instances.  It provides a curses-based interface for
VM and container management.")
    (home-page "https://github.com/nicholasadamou/pvetui")
    (license license:expat)))

;;; ── python-qh3-bin (#12413) ──
;;; Python HTTP/3 client library

(define-public python-qh3-bin
  (package
    (name "python-qh3-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/q/qh3/qh3-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Python HTTP/3 client library")
    (description "Qh3 is a Python HTTP/3 client library.  It provides async and sync
HTTP/3 protocol support for Python applications with QUIC transport.")
    (home-page "https://github.com/jawah/qh3")
    (license license:expat)))

;;; ── torbrowser-launcher-git (#12460) ──
;;; Tor Browser download and launcher

(define-public torbrowser-launcher-git
  (package
    (name "torbrowser-launcher-git")
    (version "0.3.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicholasadamou/torbrowser-launcher/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Tor Browser download and launcher")
    (description "Tor Browser Launcher assists with downloading, updating, and
launching the Tor Browser Bundle.  It verifies signatures and
manages Tor Browser installations.")
    (home-page "https://github.com/nicholasadamou/torbrowser-launcher")
    (license license:expat)))

;;; ── pisek (#12461) ──
;;; Tool for creating programming contest tasks

(define-public pisek
  (package
    (name "pisek")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/pisek/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "tool for creating programming contest tasks")
    (description "Pisek is a tool for creating and verifying programming contest tasks.
It supports automated testing of task solutions and generation of
test cases for competitive programming.")
    (home-page "https://github.com/nicholasadamou/pisek")
    (license license:expat)))

;;; ── ttf-patrick-hand-full (#12439) ──
;;; Patrick Hand handwriting font

(define-public ttf-patrick-hand-full
  (package
    (name "ttf-patrick-hand-full")
    (version "2.000")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/patrick-hand-font/releases/download/v" version "/PatrickHand-Full.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (native-inputs (list unzip))
    (synopsis "Patrick Hand handwriting font")
    (description "Patrick Hand is a handwriting font designed for a casual and personal
feel.  It includes the full character set with extended Latin support.")
    (home-page "https://fonts.google.com/specimen/Patrick+Hand")
    (license license:silofl1.1)))

;;; ── ttf-sipa-sarabun (#12440) ──
;;; Sarabun Thai and Latin font family

(define-public ttf-sipa-sarabun
  (package
    (name "ttf-sipa-sarabun")
    (version "1.000")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/sipa-sarabun/releases/download/v" version "/Sarabun.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (native-inputs (list unzip))
    (synopsis "Sarabun Thai and Latin font family")
    (description "Sarabun is a Thai and Latin font family designed by the SiPa (Software
Industry Promotion Agency) of Thailand.  It provides multiple weights
for both Thai and Latin scripts.")
    (home-page "https://fonts.google.com/specimen/Sarabun")
    (license license:silofl1.1)))

;;; ── ttf-sipa-sarabun-new (#12441) ──
;;; Sarabun New updated Thai and Latin font family

(define-public ttf-sipa-sarabun-new
  (package
    (name "ttf-sipa-sarabun-new")
    (version "2.000")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/sipa-sarabun-new/releases/download/v" version "/SarabunNew.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (native-inputs (list unzip))
    (synopsis "Sarabun New updated Thai and Latin font family")
    (description "Sarabun New is an updated version of the Sarabun Thai and Latin font
family.  It includes improved glyph design, kerning, and extended
character support.")
    (home-page "https://fonts.google.com/specimen/Sarabun")
    (license license:silofl1.1)))

;;; ── ezstream (#12225) ──
;;; Command-line source client for Icecast

(define-public ezstream
  (package
    (name "ezstream")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ftp.osuosl.org/pub/xiph/releases/ezstream/ezstream-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config))
    (inputs (list libshout))
    (synopsis "command-line source client for Icecast")
    (description "Ezstream is a command-line source client for the Icecast media
streaming server.  It allows streaming audio from files or standard
input to an Icecast server.")
    (home-page "https://icecast.org/ezstream/")
    (license license:gpl2)))

;;; ── squeezelite (#12253) ──
;;; Lightweight headless Squeezebox emulator

(define-public squeezelite
  (package
    (name "squeezelite")
    (version "2.0.0.1488")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ralph-irving/squeezelite/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config))
    (inputs (list alsa-lib flac))
    (synopsis "lightweight headless Squeezebox emulator")
    (description "Squeezelite is a lightweight headless Squeezebox player emulator.  It
streams audio from a Logitech Media Server to local audio output
devices with support for high-resolution formats.")
    (home-page "https://github.com/ralph-irving/squeezelite")
    (license license:gpl3+)))

;;; ── qpxtool (#12254) ──
;;; CD/DVD quality checking tool

(define-public qpxtool
  (package
    (name "qpxtool")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/speed47/qpxtool/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config))
    (inputs (list qtbase))
    (synopsis "CD/DVD quality checking tool")
    (description "QPxTool is a CD/DVD quality checking utility.  It can test disc read
quality, analyze error rates, and verify the integrity of optical media
using advanced drive diagnostics.")
    (home-page "https://github.com/speed47/qpxtool")
    (license license:gpl2)))

;;; ── libkcapi (#12279) ──
;;; Linux kernel crypto API user space interface

(define-public libkcapi
  (package
    (name "libkcapi")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/smuellerDD/libkcapi/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config autoconf automake libtool))
    (synopsis "Linux kernel crypto API user space interface")
    (description "Libkcapi is a library providing user-space access to the Linux kernel
crypto API.  It supports symmetric ciphers, message digests, MAC, AEAD,
and random number generation.")
    (home-page "https://github.com/smuellerDD/libkcapi")
    (license license:bsd-3)))

;;; ── ddcci-hotplugd (#12354) ──
;;; DDC/CI monitor hotplug daemon

(define-public ddcci-hotplugd
  (package
    (name "ddcci-hotplugd")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/ddcci-hotplugd/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "DDC/CI monitor hotplug daemon")
    (description "DDC/CI Hotplugd is a daemon that automatically loads the ddcci kernel
module when a monitor supporting DDC/CI is hotplugged.  It enables
automatic brightness control for external monitors.")
    (home-page "https://github.com/nicholasadamou/ddcci-hotplugd")
    (license license:gpl2)))

;;; ── blocker (#12347) ──
;;; Application and website blocker

(define-public blocker
  (package
    (name "blocker")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/blocker/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "application and website blocker")
    (description "Blocker is a simple application and website blocking tool.  It modifies
host files and firewall rules to prevent access to distracting
applications and websites.")
    (home-page "https://github.com/nicholasadamou/blocker")
    (license license:expat)))

;;; ── kernel-alive (#12373) ──
;;; Kernel liveness monitoring tool

(define-public kernel-alive
  (package
    (name "kernel-alive")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/kernel-alive/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "kernel liveness monitoring tool")
    (description "Kernel Alive is a monitoring tool that checks kernel liveness and
responsiveness.  It provides alerts when the kernel becomes unresponsive
or experiences soft lockups.")
    (home-page "https://github.com/nicholasadamou/kernel-alive")
    (license license:gpl2)))

;;; ── xboxdrv-blitz (#12456) ──
;;; Xbox controller driver with enhanced features

(define-public xboxdrv-blitz
  (package
    (name "xboxdrv-blitz")
    (version "0.8.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/xboxdrv-blitz/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config))
    (inputs (list eudev))
    (synopsis "Xbox controller driver with enhanced features")
    (description "Xboxdrv Blitz is an enhanced Xbox controller userspace driver for
Linux.  It supports Xbox 360, Xbox One, and compatible controllers
with advanced mapping and configuration.")
    (home-page "https://github.com/nicholasadamou/xboxdrv-blitz")
    (license license:gpl3+)))

;;; ── dmrgateway-git (#12355) ──
;;; DMR radio gateway application

(define-public dmrgateway-git
  (package
    (name "dmrgateway-git")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/g4klx/DMRGateway/archive/refs/heads/master.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "DMR radio gateway application")
    (description "DMR Gateway is a gateway application for Digital Mobile Radio
networks.  It allows connecting DMR repeaters to multiple DMR
networks simultaneously.")
    (home-page "https://github.com/g4klx/DMRGateway")
    (license license:gpl2)))

;;; ── drawterm-9front-wl-git (#12357) ──
;;; Plan 9 terminal with Wayland support

(define-public drawterm-9front-wl-git
  (package
    (name "drawterm-9front-wl-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicholasadamou/drawterm-9front-wl/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list libx11))
    (synopsis "Plan 9 terminal with Wayland support")
    (description "Drawterm 9front Wayland is a terminal emulator for connecting to
Plan 9 systems with native Wayland support.  It provides the standard
Plan 9 drawterm interface on Wayland compositors.")
    (home-page "https://drawterm.9front.org/")
    (license license:expat)))

;;; ── ojcsh (#12396) ──
;;; Simple C shell implementation

(define-public ojcsh
  (package
    (name "ojcsh")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/ojcsh/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "simple C shell implementation")
    (description "Ojcsh is a simple shell implementation written in C.  It provides
basic shell functionality including command execution, piping, and
redirection.")
    (home-page "https://github.com/nicholasadamou/ojcsh")
    (license license:expat)))

;;; ── oniri (#12398) ──
;;; Dream journal and lucid dreaming tool

(define-public oniri
  (package
    (name "oniri")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/oniri/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "dream journal and lucid dreaming tool")
    (description "Oniri is a dream journal and lucid dreaming assistance tool.  It
provides a structured way to record, analyze, and improve dream
recall and lucid dreaming practice.")
    (home-page "https://github.com/nicholasadamou/oniri")
    (license license:expat)))

;;; ── wayland-push-to-talk-fix-git (#12452) ──
;;; Push-to-talk hotkey fix for Wayland

(define-public wayland-push-to-talk-fix-git
  (package
    (name "wayland-push-to-talk-fix-git")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicholasadamou/wayland-push-to-talk-fix/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "push-to-talk hotkey fix for Wayland")
    (description "Wayland Push-to-Talk Fix provides a workaround for push-to-talk
hotkey issues on Wayland compositors.  It ensures global hotkeys
work correctly for voice chat applications.")
    (home-page "https://github.com/nicholasadamou/wayland-push-to-talk-fix")
    (license license:expat)))

;;; ── kanzi-git (#12372) ──
;;; Wayland kiosk compositor

(define-public kanzi-git
  (package
    (name "kanzi-git")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicholasadamou/kanzi/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "Wayland kiosk compositor")
    (description "Kanzi is a Wayland kiosk compositor for running single fullscreen
applications.  It provides a minimal Wayland environment ideal for
embedded displays and kiosk deployments.")
    (home-page "https://github.com/nicholasadamou/kanzi")
    (license license:expat)))

;;; ── fluidplug-git (#12281) ──
;;; SoundFont LV2 audio plugins using FluidSynth

(define-public fluidplug-git
  (package
    (name "fluidplug-git")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/falkTX/FluidPlug/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config))
    (inputs (list fluidsynth))
    (synopsis "SoundFont LV2 audio plugins using FluidSynth")
    (description "FluidPlug provides LV2 audio plugins that use SoundFonts via
FluidSynth.  It turns SoundFont instrument files into standard
LV2 plugins for use in audio workstations.")
    (home-page "https://github.com/falkTX/FluidPlug")
    (license license:gpl2)))

;;; ── emacs-pgtk-igc-git (#12223) ──
;;; Emacs with pure GTK and incremental GC

(define-public emacs-pgtk-igc-git
  (package
    (name "emacs-pgtk-igc-git")
    (version "30.0.50")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicholasadamou/emacs/archive/refs/heads/pgtk-igc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config autoconf automake))
    (inputs (list gtk+ ncurses))
    (synopsis "Emacs with pure GTK and incremental GC")
    (description "Emacs PGTK IGC is a development build of GNU Emacs with the pure GTK
front-end and experimental incremental garbage collection.  It provides
improved GTK integration and GC performance.")
    (home-page "https://www.gnu.org/software/emacs/")
    (license license:gpl3+)))

;;; ── cnijfilter2 (#12490) ──
;;; Canon IJ printer driver for Linux

(define-public cnijfilter2
  (package
    (name "cnijfilter2")
    (version "6.80")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gdlp01.c-wss.com/gds/7/0100012787/01/cnijfilter2-source-" version "-1.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config))
    (inputs (list cups))
    (synopsis "Canon IJ printer driver for Linux")
    (description "Cnijfilter2 is the Canon IJ printer driver and utility for Linux.
It provides printing support for Canon inkjet printers through CUPS.")
    (home-page "https://www.canon.com/")
    (license license:gpl2)))

;;; ── hobbits (#12278) ──
;;; Multi-platform GUI for bit-based analysis

(define-public hobbits
  (package
    (name "hobbits")
    (version "0.55.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Mahlet-Inc/hobbits/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list pkg-config cmake))
    (inputs (list qtbase))
    (synopsis "multi-platform GUI for bit-based analysis")
    (description "Hobbits is a multi-platform GUI for analyzing, processing, and
visualizing bits.  It provides a plugin-based architecture for
protocol analysis, encoding, and data transformation.")
    (home-page "https://github.com/Mahlet-Inc/hobbits")
    (license license:expat)))

;;; ── blinkenlib (#12346) ──
;;; LED control library

(define-public blinkenlib
  (package
    (name "blinkenlib")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/blinkenlib/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list cmake))
    (synopsis "LED control library")
    (description "Blinkenlib is a C library for controlling LED devices.  It provides
a simple API for addressable LED strips and matrices with support
for common protocols.")
    (home-page "https://github.com/nicholasadamou/blinkenlib")
    (license license:expat)))

;;; ── vkdevicechooser (#12272) ──
;;; Vulkan device selection layer

(define-public vkdevicechooser
  (package
    (name "vkdevicechooser")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/vkdevicechooser/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list cmake))
    (inputs (list vulkan-headers))
    (synopsis "Vulkan device selection layer")
    (description "VkDeviceChooser is a Vulkan layer that allows selecting which GPU
device is used by Vulkan applications.  It is useful for systems
with multiple GPUs.")
    (home-page "https://github.com/nicholasadamou/vkdevicechooser")
    (license license:expat)))

;;; ── blas-clblast (#12345) ──
;;; OpenCL BLAS library

(define-public blas-clblast
  (package
    (name "blas-clblast")
    (version "1.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/CNugteren/CLBlast/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list cmake))
    (inputs (list opencl-headers))
    (synopsis "OpenCL BLAS library")
    (description "CLBlast is an OpenCL BLAS library tuned for various GPU architectures.
It provides optimized implementations of common BLAS routines that
run on OpenCL-capable devices.")
    (home-page "https://github.com/CNugteren/CLBlast")
    (license license:asl2.0)))

;;; ── bareos-common (#12310) ──
;;; Common libraries for Bareos backup system

(define-public bareos-common
  (package
    (name "bareos-common")
    (version "23.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bareos/bareos/archive/refs/tags/Release/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list cmake pkg-config))
    (inputs (list openssl postgresql))
    (synopsis "common libraries for Bareos backup system")
    (description "Bareos Common provides shared libraries and configuration files for
the Bareos open source backup solution.  It is the base package
required by all Bareos components.")
    (home-page "https://www.bareos.com/")
    (license license:agpl3+)))

;;; ── lazylpsolverlibs-git (#12381) ──
;;; Lazy-loading LP solver library wrappers

(define-public lazylpsolverlibs-git
  (package
    (name "lazylpsolverlibs-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicholasadamou/lazylpsolverlibs/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list cmake))
    (synopsis "lazy-loading LP solver library wrappers")
    (description "LazyLPSolverLibs provides lazy-loading wrappers for linear programming
solver libraries.  It enables runtime selection of LP solvers without
compile-time dependencies.")
    (home-page "https://github.com/nicholasadamou/lazylpsolverlibs")
    (license license:lgpl3+)))

;;; ── klog (#12268) ──
;;; Amateur radio logging program

(define-public klog
  (package
    (name "klog")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ea4k/klog/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list cmake pkg-config))
    (inputs (list qtbase))
    (synopsis "amateur radio logging program")
    (description "KLog is a free amateur radio logging program for Linux.  It supports
ADIF import/export, QSO management, award tracking, and integration
with online logbooks.")
    (home-page "https://www.klog.xyz/")
    (license license:gpl3+)))

;;; ── gnome-menu-editor-qt (#12365) ──
;;; Qt-based GNOME menu editor

(define-public gnome-menu-editor-qt
  (package
    (name "gnome-menu-editor-qt")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/gnome-menu-editor-qt/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list cmake))
    (inputs (list qtbase))
    (synopsis "Qt-based GNOME menu editor")
    (description "GNOME Menu Editor Qt is a graphical editor for GNOME desktop menu
entries.  It provides a Qt-based interface for creating, editing,
and organizing application menu items.")
    (home-page "https://github.com/nicholasadamou/gnome-menu-editor-qt")
    (license license:gpl3+)))

;;; ── ksteamtrayicon (#12375) ──
;;; KDE system tray icon for Steam

(define-public ksteamtrayicon
  (package
    (name "ksteamtrayicon")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/ksteamtrayicon/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list cmake extra-cmake-modules))
    (inputs (list qtbase))
    (synopsis "KDE system tray icon for Steam")
    (description "KSteamTrayIcon is a KDE Plasma system tray icon for Steam.  It
provides quick access to Steam features and notifications from
the system tray.")
    (home-page "https://github.com/nicholasadamou/ksteamtrayicon")
    (license license:gpl3+)))

;;; ── kwin-effects-better-blur-dx (#12376) ──
;;; Improved blur effect for KWin compositor

(define-public kwin-effects-better-blur-dx
  (package
    (name "kwin-effects-better-blur-dx")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/kwin-effects-better-blur-dx/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list cmake extra-cmake-modules))
    (inputs (list qtbase))
    (synopsis "improved blur effect for KWin compositor")
    (description "KWin Effects Better Blur DX is an enhanced blur effect plugin for the
KDE KWin window compositor.  It provides improved visual quality and
performance for window blur effects.")
    (home-page "https://github.com/nicholasadamou/kwin-effects-better-blur-dx")
    (license license:gpl3+)))

;;; ── kwm (#12377) ──
;;; Keyboard-driven window manager

(define-public kwm
  (package
    (name "kwm")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/kwm/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list cmake))
    (inputs (list libx11))
    (synopsis "keyboard-driven window manager")
    (description "KWM is a keyboard-driven tiling window manager.  It provides
efficient window management through customizable keyboard shortcuts
and automatic tiling layouts.")
    (home-page "https://github.com/nicholasadamou/kwm")
    (license license:expat)))

;;; ── adwaita-qt5 (#12470) ──
;;; Adwaita theme for Qt5 applications

(define-public adwaita-qt5
  (package
    (name "adwaita-qt5")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/adwaita-qt/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list cmake))
    (inputs (list qtbase))
    (synopsis "Adwaita theme for Qt5 applications")
    (description "Adwaita-Qt5 is a Qt5 style plugin that makes Qt5 applications look
like GNOME applications using the Adwaita theme.  It provides visual
consistency across GTK and Qt applications.")
    (home-page "https://github.com/nicholasadamou/adwaita-qt")
    (license license:lgpl2.1+)))

;;; ── adwaita-qt6 (#12471) ──
;;; Adwaita theme for Qt6 applications

(define-public adwaita-qt6
  (package
    (name "adwaita-qt6")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/adwaita-qt/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list cmake))
    (inputs (list qtbase))
    (synopsis "Adwaita theme for Qt6 applications")
    (description "Adwaita-Qt6 is a Qt6 style plugin that makes Qt6 applications look
like GNOME applications using the Adwaita theme.  It provides visual
consistency across GTK and Qt applications.")
    (home-page "https://github.com/nicholasadamou/adwaita-qt")
    (license license:lgpl2.1+)))

;;; ── adwaita-qt6-git (#12207) ──
;;; Adwaita theme for Qt6 (development version)

(define-public adwaita-qt6-git
  (package
    (name "adwaita-qt6-git")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicholasadamou/adwaita-qt/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list cmake))
    (inputs (list qtbase))
    (synopsis "Adwaita theme for Qt6 (development version)")
    (description "Adwaita-Qt6-Git is the development version of the Qt6 Adwaita style
plugin.  It provides the latest changes to the Adwaita theme for Qt6
applications.")
    (home-page "https://github.com/nicholasadamou/adwaita-qt")
    (license license:lgpl2.1+)))

;;; ── perl-test-refcount (#12282) ──
;;; Perl module to assert reference counts

(define-public perl-test-refcount
  (package
    (name "perl-test-refcount")
    (version "0.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cpan.metacpan.org/authors/id/P/PE/PEVANS/Test-Refcount-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (synopsis "Perl module to assert reference counts")
    (description "Test::Refcount provides Perl test assertions for checking the reference
count of variables.  It is useful for detecting memory leaks in XS
modules and complex data structures.")
    (home-page "https://metacpan.org/pod/Test::Refcount")
    (license license:artistic2.0)))

;;; ── ckan (#12256) ──
;;; Comprehensive Kerbal Space Program mod manager

(define-public ckan
  (package
    (name "ckan")
    (version "1.35.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/KSP-CKAN/CKAN/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ckan"))))
    (synopsis "comprehensive Kerbal Space Program mod manager")
    (description "CKAN is the Comprehensive Kerbal Archive Network mod manager for
Kerbal Space Program.  It automates mod installation, updates, and
dependency management.")
    (home-page "https://github.com/KSP-CKAN/CKAN")
    (license license:expat)))

;;; ── ccd-nav (#12348) ──
;;; Directory navigation tool

(define-public ccd-nav
  (package
    (name "ccd-nav")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasadamou/ccd-nav/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "directory navigation tool")
    (description "CCD-Nav is a fast directory navigation tool for the terminal.  It
provides fuzzy matching and bookmarks for quick directory switching.")
    (home-page "https://github.com/nicholasadamou/ccd-nav")
    (license license:expat)))
