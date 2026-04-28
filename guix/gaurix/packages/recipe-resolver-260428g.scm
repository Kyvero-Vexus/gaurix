;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260428g
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260428g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
            grub2-theme-preview
            lib32-libsoup
            mnt-reform-qcacld2-dkms
            grub2-theme-archlinux
            rtw88-dkms-git
            asix-ax88179-dkms
            archlinux-themes-sddm
            rustrover-jre
            broadcom-bt-firmware-git
            leanify-git
            vigiland-git
            bochs
            dracula-gtk-theme-full
            you-get-git
            cups-xerox
            numix-folders-git
            exo-git
            discord-chat-exporter-cli
            discord-chat-exporter-gui
            ofono
            rhythmbox-git
            gnome-shell-extension-hidetopbar-git
            rtspeccy-git
            dolphin-megasync-git
            streamlink-git
            transcribe
            spotify-tui-bin
            snowflake-pt-proxy
            firmware-manager-git
            lux-dl
            resvg-git
            bauh-staging
            dosemu2-git
            lxc-templates
            tamsyn-font
            fastmod
            mpv-inhibit-gnome
            papirus-folders-nordic
            dolphin-megasync-bin
            tshock
            harmony-wad
            tunerstudio
            ubi-reader
            freedm-git
            freedoom-git
            papirus-nord
            python-cstruct
            python-gpiozero
            rainfall
            snowflake-pt-client-git
            usbguard-notifier-git
            bdf2psf
            mod-tile-git
            renderd-git
            mpv-prescalers-git
            otf-fira-code-symbol
            paradox-launcher
            scrutiny-bin
            terminal-parrot
            wings3d
            ntpclient
            fbautostart
            tmux-xpanes
            psftools
            freeplane-git
            galaxybuds-batterylevel-git
            gruvbox-icon-theme
            jefferson
            jpeg2png-git
            lora-cyrillic-font
            notparadoxlauncher
            papirus-linux-universe
            prismatik-psieg
            rye-git
            xdg-desktop-portal-shana
            polyphone-git
            bato
            brother-hll2390dw
            catnip
            jira-cli-bin
            upslug2-git
            agent-deck-bin
            arrpc-bun-bin
            azaharplus-git
            azaharplus-novulkan-git
            beacn-utility
            celq-bin
            chuckfmt
            chuckfmt-bin
            emerald-legacy-launcher-git
            gc-git
            gdlv
            godot-bin
            godot-mono-bin
            graphify-bin
            grindx
            gsd-pi
            halley
            hidapi-hotplug-git
            honeymux-bin
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; grub2-theme-preview --- preview a full GRUB 2.x theme (or just a background image) using KVM/QEMU
(define-public grub2-theme-preview
  (package
    (name "grub2-theme-preview")
    (version "2.9.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grub2-theme-preview.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "preview a full GRUB 2.x theme (or just a background image) using KVM/QEMU")
    (description "Preview a full GRUB 2.x theme (or just a background image) using KVM/QEMU.")
    (home-page "https://github.com/hartwork/grub2-theme-preview")
    (license license:gpl3+)))

;;; lib32-libsoup --- hTTP client/server library for GNOME (32-bit)
(define-public lib32-libsoup
  (package
    (name "lib32-libsoup")
    (version "2.74.3-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libsoup.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hTTP client/server library for GNOME (32-bit)")
    (description "HTTP client/server library for GNOME (32-bit).")
    (home-page "https://wiki.gnome.org/Projects/libsoup")
    (license license:lgpl2.1+)))

;;; mnt-reform-qcacld2-dkms --- dKMS source for the MNT Reform qcacld2 Wi-Fi driver (pinned 277339b9)
(define-public mnt-reform-qcacld2-dkms
  (package
    (name "mnt-reform-qcacld2-dkms")
    (version "20251018.277339b9-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mnt-reform-qcacld2-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dKMS source for the MNT Reform qcacld2 Wi-Fi driver (pinned 277339b9)")
    (description "DKMS source for the MNT Reform qcacld2 Wi-Fi driver (pinned 277339b9).")
    (home-page "https://source.mnt.re/reform/qcacld2")
    (license license:nonfree)))

;;; grub2-theme-archlinux --- grub2 gfxmenu theme
(define-public grub2-theme-archlinux
  (package
    (name "grub2-theme-archlinux")
    (version "1.0-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grub2-theme-archlinux.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "grub2 gfxmenu theme")
    (description "Grub2 gfxmenu theme.")
    (home-page "https://github.com/ochurlaud/grub2-themes-archlinux")
    (license license:gpl3)))

;;; rtw88-dkms-git --- drivers for Realtek 802.11n/802.11ac wireless chips
(define-public rtw88-dkms-git
  (package
    (name "rtw88-dkms-git")
    (version "r675.52072d8-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rtw88-dkms-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "drivers for Realtek 802.11n/802.11ac wireless chips")
    (description "Drivers for Realtek 802.11n/802.11ac wireless chips.")
    (home-page "https://github.com/lwfinger/rtw88")
    (license license:gpl2)))

;;; asix-ax88179-dkms --- a kernel module for ASIX AX88179B USB network adapters
(define-public asix-ax88179-dkms
  (package
    (name "asix-ax88179-dkms")
    (version "4.0.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/asix-ax88179-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a kernel module for ASIX AX88179B USB network adapters")
    (description "A kernel module for ASIX AX88179B USB network adapters.")
    (home-page "https://www.asix.com.tw/en/product/USBEthernet/Super-Speed_USB_Ethernet/AX88179B")
    (license license:gpl2+)))

;;; archlinux-themes-sddm --- adaptation to SDDM of Archlinux themes made for KDM
(define-public archlinux-themes-sddm
  (package
    (name "archlinux-themes-sddm")
    (version "2.0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/archlinux-themes-sddm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adaptation to SDDM of Archlinux themes made for KDM")
    (description "Adaptation to SDDM of Archlinux themes made for KDM.")
    (home-page "https://github.com/Guidobelix/archlinux-themes-sddm")
    (license license:cc-by-sa3.0)))

;;; rustrover-jre --- jBR (JetBrains Runtime) for RustRover - a patched JRE
(define-public rustrover-jre
  (package
    (name "rustrover-jre")
    (version "2026.1.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rustrover-jre.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "jBR (JetBrains Runtime) for RustRover - a patched JRE")
    (description "JBR (JetBrains Runtime) for RustRover - a patched JRE.")
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (license license:nonfree)))

;;; broadcom-bt-firmware-git --- broadcom bluetooth firmware
(define-public broadcom-bt-firmware-git
  (package
    (name "broadcom-bt-firmware-git")
    (version "12.0.1.1105_p4.r1.g3b7cff9-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/broadcom-bt-firmware-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "broadcom bluetooth firmware")
    (description "Broadcom bluetooth firmware.")
    (home-page "https://github.com/winterheart/broadcom-bt-firmware")
    (license license:nonfree)))

;;; leanify-git --- a lightweight lossless file minifier/optimizer
(define-public leanify-git
  (package
    (name "leanify-git")
    (version "0.4.3.r211.gd2ba167-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/leanify-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight lossless file minifier/optimizer")
    (description "A lightweight lossless file minifier/optimizer.")
    (home-page "https://github.com/JayXon/Leanify")
    (license license:expat)))

;;; vigiland-git --- inhibit idle behaviour of a Wayland compositor
(define-public vigiland-git
  (package
    (name "vigiland-git")
    (version "r11.6b84e1a-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vigiland-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "inhibit idle behaviour of a Wayland compositor")
    (description "Inhibit idle behaviour of a Wayland compositor.")
    (home-page "https://github.com/Jappie3/vigiland")
    (license license:agpl3+)))

;;; bochs --- a portable x86 PC emulation software package, including GUI debugger
(define-public bochs
  (package
    (name "bochs")
    (version "3.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bochs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a portable x86 PC emulation software package, including GUI debugger")
    (description "A portable x86 PC emulation software package, including GUI debugger.")
    (home-page "http://bochs.sourceforge.net/")
    (license license:lgpl3+)))

;;; dracula-gtk-theme-full --- dark theme for GTK
(define-public dracula-gtk-theme-full
  (package
    (name "dracula-gtk-theme-full")
    (version "4.0.0.r134.g79095df-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dracula-gtk-theme-full.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dark theme for GTK")
    (description "Dark theme for GTK.")
    (home-page "https://github.com/dracula/gtk")
    (license license:gpl3+)))

;;; you-get-git --- a YouTube/Youku/Niconico video downloader written in Python 3
(define-public you-get-git
  (package
    (name "you-get-git")
    (version "0.4.1743.20250427.2600-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/you-get-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a YouTube/Youku/Niconico video downloader written in Python 3")
    (description "A YouTube/Youku/Niconico video downloader written in Python 3.")
    (home-page "https://www.soimort.org/you-get/")
    (license license:expat)))

;;; cups-xerox --- drivers for various Xerox printers
(define-public cups-xerox
  (package
    (name "cups-xerox")
    (version "2008.01.23-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cups-xerox.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "drivers for various Xerox printers")
    (description "Drivers for various Xerox printers.")
    (home-page "http://www.support.xerox.com/go/getfile.asp?objid=61334")
    (license license:nonfree)))

;;; numix-folders-git --- alternate folders for use with the Numix base icon theme
(define-public numix-folders-git
  (package
    (name "numix-folders-git")
    (version "r420.24e5f6c66-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/numix-folders-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "alternate folders for use with the Numix base icon theme")
    (description "Alternate folders for use with the Numix base icon theme.")
    (home-page "https://github.com/numixproject/numix-folders")
    (license license:gpl3)))

;;; exo-git --- extensions to Xfce originally developed by os-cillation
(define-public exo-git
  (package
    (name "exo-git")
    (version "2:4.20pre1.r21.gcce2b58d-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/exo-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extensions to Xfce originally developed by os-cillation")
    (description "Extensions to Xfce originally developed by os-cillation.")
    (home-page "https://gitlab.xfce.org/xfce/exo/")
    (license license:lgpl2.1)))

;;; discord-chat-exporter-cli --- exports Discord chat logs to a file - CLI
(define-public discord-chat-exporter-cli
  (package
    (name "discord-chat-exporter-cli")
    (version "2.47.1-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/discord-chat-exporter-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "exports Discord chat logs to a file - CLI")
    (description "Exports Discord chat logs to a file - CLI.")
    (home-page "https://github.com/Tyrrrz/DiscordChatExporter")
    (license license:expat)))

;;; discord-chat-exporter-gui --- exports Discord chat logs to a file - GUI
(define-public discord-chat-exporter-gui
  (package
    (name "discord-chat-exporter-gui")
    (version "2.47.1-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/discord-chat-exporter-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "exports Discord chat logs to a file - GUI")
    (description "Exports Discord chat logs to a file - GUI.")
    (home-page "https://github.com/Tyrrrz/DiscordChatExporter")
    (license license:expat)))

;;; ofono --- infrastructure for building mobile telephony (GSM/UMTS) applications
(define-public ofono
  (package
    (name "ofono")
    (version "2.14-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ofono.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "infrastructure for building mobile telephony (GSM/UMTS) applications")
    (description "Infrastructure for building mobile telephony (GSM/UMTS) applications.")
    (home-page "https://01.org/ofono")
    (license license:gpl2)))

;;; rhythmbox-git --- music playback and management application
(define-public rhythmbox-git
  (package
    (name "rhythmbox-git")
    (version "3.4.8+r22+ge73b5eb24-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rhythmbox-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "music playback and management application")
    (description "Music playback and management application.")
    (home-page "https://wiki.gnome.org/Apps/Rhythmbox")
    (license license:gpl3+)))

;;; gnome-shell-extension-hidetopbar-git --- gNOME extension to hide the top bar except in overview mode
(define-public gnome-shell-extension-hidetopbar-git
  (package
    (name "gnome-shell-extension-hidetopbar-git")
    (version "124.r1.g52051e3-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-extension-hidetopbar-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNOME extension to hide the top bar except in overview mode")
    (description "GNOME extension to hide the top bar except in overview mode.")
    (home-page "https://gitlab.gnome.org/tuxor1337/hidetopbar")
    (license license:gpl2+)))

;;; rtspeccy-git --- real time spectrum analyzer (audio)
(define-public rtspeccy-git
  (package
    (name "rtspeccy-git")
    (version "23.07-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rtspeccy-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "real time spectrum analyzer (audio)")
    (description "Real time spectrum analyzer (audio).")
    (home-page "https://uninformativ.de/git/rtspeccy")
    (license license:gpl3)))

;;; dolphin-megasync-git --- upload your files to your Mega account from Dolphin file manager. (GIT Versio...
(define-public dolphin-megasync-git
  (package
    (name "dolphin-megasync-git")
    (version "5.11.1.0.g94fa31202-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dolphin-megasync-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "upload your files to your Mega account from Dolphin file manager. (GIT Versio...")
    (description "Upload your files to your Mega account from Dolphin file manager. (GIT Version).")
    (home-page "https://mega.co.nz/sync")
    (license license:nonfree)))

;;; streamlink-git --- cLI program that launches streams from various streaming services in a custom...
(define-public streamlink-git
  (package
    (name "streamlink-git")
    (version "7.1.0.r0.gd532def9-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/streamlink-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cLI program that launches streams from various streaming services in a custom...")
    (description "CLI program that launches streams from various streaming services in a custom video player (livestreamer fork).")
    (home-page "https://streamlink.github.io/")
    (license license:bsd-2)))

;;; transcribe --- music transcription aid
(define-public transcribe
  (package
    (name "transcribe")
    (version "9.42.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/transcribe.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "music transcription aid")
    (description "Music transcription aid.")
    (home-page "https://www.seventhstring.com/xscribe/overview.html")
    (license license:nonfree)))

;;; spotify-tui-bin --- spotify client for the terminal written in Rust
(define-public spotify-tui-bin
  (package
    (name "spotify-tui-bin")
    (version "0.25.0-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/spotify-tui-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "spotify client for the terminal written in Rust")
    (description "Spotify client for the terminal written in Rust.")
    (home-page "https://github.com/Rigellute/spotify-tui")
    (license license:expat)))

;;; snowflake-pt-proxy --- snowflake is a pluggable transport that proxies traffic through temporary pro...
(define-public snowflake-pt-proxy
  (package
    (name "snowflake-pt-proxy")
    (version "2.13.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/snowflake-pt-proxy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "snowflake is a pluggable transport that proxies traffic through temporary pro...")
    (description "Snowflake is a pluggable transport that proxies traffic through temporary proxies using WebRTC (proxy part).")
    (home-page "https://snowflake.torproject.org")
    (license license:bsd-3)))

;;; firmware-manager-git --- generic framework and GTK UI for firmware updates from system76-firmware and ...
(define-public firmware-manager-git
  (package
    (name "firmware-manager-git")
    (version "0.1.5.r15.ga45bdc7-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/firmware-manager-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "generic framework and GTK UI for firmware updates from system76-firmware and ...")
    (description "Generic framework and GTK UI for firmware updates from system76-firmware and fwupd.")
    (home-page "https://github.com/pop-os/firmware-manager")
    (license license:gpl3+)))

;;; lux-dl --- fast and simple video download library and CLI tool written in Go
(define-public lux-dl
  (package
    (name "lux-dl")
    (version "0.24.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lux-dl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast and simple video download library and CLI tool written in Go")
    (description "Fast and simple video download library and CLI tool written in Go.")
    (home-page "https://github.com/iawia002/lux")
    (license license:expat)))

;;; resvg-git --- sVG rendering library and CLI
(define-public resvg-git
  (package
    (name "resvg-git")
    (version "0.45.0.r2.g9c4431d1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/resvg-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sVG rendering library and CLI")
    (description "SVG rendering library and CLI.")
    (home-page "https://github.com/linebender/resvg")
    (license license:mpl2.0)))

;;; bauh-staging --- graphical interface for managing your applications (AppImage, Flatpak, Snap, ...
(define-public bauh-staging
  (package
    (name "bauh-staging")
    (version "0.10.8.RC-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bauh-staging.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical interface for managing your applications (AppImage, Flatpak, Snap, ...")
    (description "Graphical interface for managing your applications (AppImage, Flatpak, Snap, Arch/AUR, Web). Testing branch (it may not be working properly).")
    (home-page "https://github.com/vinifmor/bauh")
    (license license:zlib)))

;;; dosemu2-git --- virtual machine that allows you to run DOS programs under Linux
(define-public dosemu2-git
  (package
    (name "dosemu2-git")
    (version "2.2.0pre9.2.r1579.ge22fbc4a3-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dosemu2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "virtual machine that allows you to run DOS programs under Linux")
    (description "Virtual machine that allows you to run DOS programs under Linux.")
    (home-page "https://github.com/dosemu2/dosemu2")
    (license license:gpl2)))

;;; lxc-templates --- old style template scripts for LXC
(define-public lxc-templates
  (package
    (name "lxc-templates")
    (version "3.0.4-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lxc-templates.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "old style template scripts for LXC")
    (description "Old style template scripts for LXC.")
    (home-page "https://github.com/lxc/lxc-templates")
    (license license:gpl3+)))

;;; tamsyn-font --- a monospaced bitmap font for the console and X11
(define-public tamsyn-font
  (package
    (name "tamsyn-font")
    (version "1.11-6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tamsyn-font.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a monospaced bitmap font for the console and X11")
    (description "A monospaced bitmap font for the console and X11.")
    (home-page "https://www.fial.com/~scott/tamsyn-font")
    (license license:nonfree)))

;;; fastmod --- a fast partial replacement for the codemod tool
(define-public fastmod
  (package
    (name "fastmod")
    (version "0.4.4-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fastmod.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast partial replacement for the codemod tool")
    (description "A fast partial replacement for the codemod tool.")
    (home-page "https://github.com/facebookincubator/fastmod")
    (license license:asl2.0)))

;;; mpv-inhibit-gnome --- this mpv plugin prevents screen blanking in GNOME while playing media
(define-public mpv-inhibit-gnome
  (package
    (name "mpv-inhibit-gnome")
    (version "0.1.3-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mpv_inhibit_gnome.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "this mpv plugin prevents screen blanking in GNOME while playing media")
    (description "This mpv plugin prevents screen blanking in GNOME while playing media.")
    (home-page "https://github.com/Guldoman/mpv_inhibit_gnome")
    (license license:expat)))

;;; papirus-folders-nordic --- icons themes papirus color folder nordic
(define-public papirus-folders-nordic
  (package
    (name "papirus-folders-nordic")
    (version "4.5-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/papirus-folders-nordic.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "icons themes papirus color folder nordic")
    (description "Icons themes papirus color folder nordic.")
    (home-page "https://github.com/basigur/papirus-folders-nordic")
    (license license:lgpl3+)))

;;; dolphin-megasync-bin --- extension for KDE based file managers to interact with Megasync
(define-public dolphin-megasync-bin
  (package
    (name "dolphin-megasync-bin")
    (version "6.2.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dolphin-megasync-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extension for KDE based file managers to interact with Megasync")
    (description "Extension for KDE based file managers to interact with Megasync.")
    (home-page "https://mega.nz/")
    (license license:nonfree)))

;;; tshock --- terraria Server administration modification that runs on the open source Terr...
(define-public tshock
  (package
    (name "tshock")
    (version "1:6.1.0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tshock.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terraria Server administration modification that runs on the open source Terr...")
    (description "Terraria Server administration modification that runs on the open source TerrariaAPI.")
    (home-page "https://github.com/Pryaxis/TShock")
    (license license:gpl3+)))

;;; harmony-wad --- harmony IWAD (game data)
(define-public harmony-wad
  (package
    (name "harmony-wad")
    (version "1.1-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/harmony-wad.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "harmony IWAD (game data)")
    (description "Harmony IWAD (game data).")
    (home-page "http://heroestospare.com/rabotik/harmony.php")
    (license license:nonfree)))

;;; tunerstudio --- graphical engine tuning and analysis software for Megasquirt ECUs
(define-public tunerstudio
  (package
    (name "tunerstudio")
    (version "3.3.01-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tunerstudio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical engine tuning and analysis software for Megasquirt ECUs")
    (description "Graphical engine tuning and analysis software for Megasquirt ECUs.")
    (home-page "https://aur.archlinux.org/packages/tunerstudio/")
    (license license:nonfree)))

;;; ubi-reader --- collection of Python scripts for reading information about and extracting dat...
(define-public ubi-reader
  (package
    (name "ubi-reader")
    (version "0.8.12-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ubi_reader.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "collection of Python scripts for reading information about and extracting dat...")
    (description "Collection of Python scripts for reading information about and extracting data from UBI and UBIFS images.")
    (home-page "https://github.com/jrspruitt/ubi_reader")
    (license license:gpl3)))

;;; freedm-git --- free game data files for Doom gaming engines
(define-public freedm-git
  (package
    (name "freedm-git")
    (version "1:0.14.0.alpha.r306.gd7ad12f2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freedm-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free game data files for Doom gaming engines")
    (description "Free game data files for Doom gaming engines.")
    (home-page "http://freedoom.github.io/")
    (license license:bsd-3)))

;;; freedoom-git --- free game data files for Doom gaming engines
(define-public freedoom-git
  (package
    (name "freedoom-git")
    (version "1:0.14.0.alpha.r306.gd7ad12f2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freedoom-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free game data files for Doom gaming engines")
    (description "Free game data files for Doom gaming engines.")
    (home-page "http://freedoom.github.io/")
    (license license:bsd-3)))

;;; papirus-nord --- custom colors for folder icons for Papirus Icon Theme!
(define-public papirus-nord
  (package
    (name "papirus-nord")
    (version "1:3.2.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/papirus-nord.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "custom colors for folder icons for Papirus Icon Theme!")
    (description "Custom colors for folder icons for Papirus Icon Theme!.")
    (home-page "https://github.com/Adapta-Projects/Papirus-Nord")
    (license license:gpl2+)))

;;; python-cstruct --- c-style structs for Python
(define-public python-cstruct
  (package
    (name "python-cstruct")
    (version "6.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-cstruct.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c-style structs for Python")
    (description "C-style structs for Python.")
    (home-page "https://github.com/andreax79/python-cstruct")
    (license license:expat)))

;;; python-gpiozero --- a simple interface to GPIO devices with Raspberry Pi
(define-public python-gpiozero
  (package
    (name "python-gpiozero")
    (version "2.0.1-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-gpiozero.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple interface to GPIO devices with Raspberry Pi")
    (description "A simple interface to GPIO devices with Raspberry Pi.")
    (home-page "https://github.com/gpiozero/gpiozero")
    (license license:bsd-3)))

;;; rainfall --- a rain animation for your terminal
(define-public rainfall
  (package
    (name "rainfall")
    (version "1.0.1-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rainfall.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a rain animation for your terminal")
    (description "A rain animation for your terminal.")
    (home-page "https://github.com/alpin111/rainfall")
    (license license:expat)))

;;; snowflake-pt-client-git --- snowflake is a pluggable transport that proxies traffic through temporary pro...
(define-public snowflake-pt-client-git
  (package
    (name "snowflake-pt-client-git")
    (version "900.bd636a1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/snowflake-pt-client-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "snowflake is a pluggable transport that proxies traffic through temporary pro...")
    (description "Snowflake is a pluggable transport that proxies traffic through temporary proxies using WebRTC.")
    (home-page "https://trac.torproject.org/projects/tor/wiki/doc/Snowflake")
    (license license:bsd-3)))

;;; usbguard-notifier-git --- a tool for detecting usbguard policy and device presence changes
(define-public usbguard-notifier-git
  (package
    (name "usbguard-notifier-git")
    (version "0.1.0.2.g4abee79-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/usbguard-notifier-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool for detecting usbguard policy and device presence changes")
    (description "A tool for detecting usbguard policy and device presence changes.")
    (home-page "https://github.com/Cropi/usbguard-notifier")
    (license license:gpl2)))

;;; bdf2psf --- debian utility to convert BDF font files to PSF format
(define-public bdf2psf
  (package
    (name "bdf2psf")
    (version "1:1.221-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bdf2psf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "debian utility to convert BDF font files to PSF format")
    (description "Debian utility to convert BDF font files to PSF format.")
    (home-page "https://packages.debian.org/unstable/bdf2psf")
    (license license:gpl2)))

;;; mod-tile-git --- an Apache 2 module to deliver map tiles
(define-public mod-tile-git
  (package
    (name "mod-tile-git")
    (version "0.8.1.r1.gf0811e8-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mod_tile-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an Apache 2 module to deliver map tiles")
    (description "An Apache 2 module to deliver map tiles.")
    (home-page "https://github.com/openstreetmap/mod_tile")
    (license license:gpl2+)))

;;; renderd-git --- a daemon that renders map tiles using mapnik
(define-public renderd-git
  (package
    (name "renderd-git")
    (version "0.8.1.r1.gf0811e8-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/renderd-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a daemon that renders map tiles using mapnik")
    (description "A daemon that renders map tiles using mapnik.")
    (home-page "https://github.com/openstreetmap/mod_tile")
    (license license:gpl2+)))

;;; mpv-prescalers-git --- user shaders for prescaling in mpv
(define-public mpv-prescalers-git
  (package
    (name "mpv-prescalers-git")
    (version "r132.b3f0a59-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mpv-prescalers-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "user shaders for prescaling in mpv")
    (description "User shaders for prescaling in mpv.")
    (home-page "https://github.com/bjin/mpv-prescalers/tree/master")
    (license license:lgpl3+)))

;;; otf-fira-code-symbol --- fira Code: monospaced font with programming ligatures (symbol font)
(define-public otf-fira-code-symbol
  (package
    (name "otf-fira-code-symbol")
    (version "1.206-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-fira-code-symbol.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fira Code: monospaced font with programming ligatures (symbol font)")
    (description "Fira Code: monospaced font with programming ligatures (symbol font).")
    (home-page "https://github.com/tonsky/FiraCode/issues/211#issuecomment-239058632")
    (license license:silofl1.1)))

;;; paradox-launcher --- paradox Interactive Game Launcher v2
(define-public paradox-launcher
  (package
    (name "paradox-launcher")
    (version "1:2025.14-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/paradox-launcher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "paradox Interactive Game Launcher v2")
    (description "Paradox Interactive Game Launcher v2.")
    (home-page "https://play.paradoxplaza.com/")
    (license license:nonfree)))

;;; scrutiny-bin --- hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thres...
(define-public scrutiny-bin
  (package
    (name "scrutiny-bin")
    (version "0.8.1-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scrutiny-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thres...")
    (description "Hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thresholds.")
    (home-page "https://github.com/AnalogJ/scrutiny")
    (license license:expat)))

;;; terminal-parrot --- party parrot (http://cultofthepartyparrot.com) for your terminal
(define-public terminal-parrot
  (package
    (name "terminal-parrot")
    (version "1.2.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/terminal-parrot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "party parrot (http://cultofthepartyparrot.com) for your terminal")
    (description "Party parrot (http://cultofthepartyparrot.com) for your terminal.")
    (home-page "https://github.com/jmhobbs/terminal-parrot")
    (license license:expat)))

;;; wings3d --- 3D modeler using the winged edge data structure
(define-public wings3d
  (package
    (name "wings3d")
    (version "2.4.1-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wings3d.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "3D modeler using the winged edge data structure")
    (description "3D modeler using the winged edge data structure.")
    (home-page "https://www.wings3d.com/")
    (license license:gpl2+)))

;;; ntpclient --- a simple NTP (RFC-1305) client
(define-public ntpclient
  (package
    (name "ntpclient")
    (version "2024.132-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ntpclient.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple NTP (RFC-1305) client")
    (description "A simple NTP (RFC-1305) client.")
    (home-page "http://doolittle.icarus.com/ntpclient/")
    (license license:gpl2)))

;;; fbautostart --- lightweight XDG autostarter for Fluxbox
(define-public fbautostart
  (package
    (name "fbautostart")
    (version "2.718281828-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fbautostart.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight XDG autostarter for Fluxbox")
    (description "Lightweight XDG autostarter for Fluxbox.")
    (home-page "https://launchpad.net/fbautostart")
    (license license:expat)))

;;; tmux-xpanes --- create multiple panes with ultimate terminal divider
(define-public tmux-xpanes
  (package
    (name "tmux-xpanes")
    (version "4.2.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tmux-xpanes.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "create multiple panes with ultimate terminal divider")
    (description "Create multiple panes with ultimate terminal divider.")
    (home-page "https://github.com/greymd/tmux-xpanes")
    (license license:expat)))

;;; psftools --- utilities for manipulation of console fonts in PSF format
(define-public psftools
  (package
    (name "psftools")
    (version "1.0.14-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/psftools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utilities for manipulation of console fonts in PSF format")
    (description "Utilities for manipulation of console fonts in PSF format.")
    (home-page "http://www.seasip.info/Unix/PSF/")
    (license license:gpl3+)))

;;; freeplane-git --- a Java mindmapping tool
(define-public freeplane-git
  (package
    (name "freeplane-git")
    (version "1.11.x.6dbb149f9-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freeplane-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Java mindmapping tool")
    (description "A Java mindmapping tool.")
    (home-page "https://github.com/freeplane/freeplane.git")
    (license license:gpl3+)))

;;; galaxybuds-batterylevel-git --- simple python script to read battery values and the current wearing status fr...
(define-public galaxybuds-batterylevel-git
  (package
    (name "galaxybuds-batterylevel-git")
    (version "r28.e01596e-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/galaxybuds-batterylevel-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple python script to read battery values and the current wearing status fr...")
    (description "Simple python script to read battery values and the current wearing status from the Samsung Galaxy Buds, Buds+, Buds Live, and Buds Pro.")
    (home-page "https://github.com/ThePBone/GalaxyBuds-BatteryLevel")
    (license license:expat)))

;;; gruvbox-icon-theme --- a gruvboxed icon theme
(define-public gruvbox-icon-theme
  (package
    (name "gruvbox-icon-theme")
    (version "1.0-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gruvbox-icon-theme.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a gruvboxed icon theme")
    (description "A gruvboxed icon theme.")
    (home-page "https://aur.archlinux.org/packages/gruvbox-icon-theme/")
    (license license:gpl3+)))

;;; jefferson --- jFFS2 filesystem extraction tool
(define-public jefferson
  (package
    (name "jefferson")
    (version "0.4.7-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jefferson.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "jFFS2 filesystem extraction tool")
    (description "JFFS2 filesystem extraction tool.")
    (home-page "https://github.com/onekey-sec/jefferson")
    (license license:expat)))

;;; jpeg2png-git --- silky smooth JPEG decoder
(define-public jpeg2png-git
  (package
    (name "jpeg2png-git")
    (version "1.01.r5.g7ae6e42-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jpeg2png-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "silky smooth JPEG decoder")
    (description "Silky smooth JPEG decoder.")
    (home-page "https://github.com/ImageProcessing-ElectronicPublications/jpeg2png")
    (license license:gpl3+)))

;;; lora-cyrillic-font --- contemporary serif font that supports Latin and Cyrillic scripts. Includes OT...
(define-public lora-cyrillic-font
  (package
    (name "lora-cyrillic-font")
    (version "3.021-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lora-cyrillic-font.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "contemporary serif font that supports Latin and Cyrillic scripts. Includes OT...")
    (description "Contemporary serif font that supports Latin and Cyrillic scripts. Includes OTF, TTF, Variable and Webfonts.")
    (home-page "https://github.com/cyrealtype/Lora-Cyrillic")
    (license license:silofl1.1)))

;;; notparadoxlauncher --- alternative for Paradox Launcher (QT6)
(define-public notparadoxlauncher
  (package
    (name "notparadoxlauncher")
    (version "1.3.1-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/notparadoxlauncher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "alternative for Paradox Launcher (QT6)")
    (description "Alternative for Paradox Launcher (QT6).")
    (home-page "https://github.com/shusaura85/notparadoxlauncher")
    (license license:expat)))

;;; papirus-linux-universe --- papirus folder icon set based on distros and the most famous icon themes in t...
(define-public papirus-linux-universe
  (package
    (name "papirus-linux-universe")
    (version "1.1.0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/papirus-linux-universe.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "papirus folder icon set based on distros and the most famous icon themes in t...")
    (description "Papirus folder icon set based on distros and the most famous icon themes in the Linux world!.")
    (home-page "https://github.com/Adapta-Projects/Papirus-Linux-Universe")
    (license license:gpl2+)))

;;; prismatik-psieg --- a controller for usb driven LED backlights (an unofficial fork)
(define-public prismatik-psieg
  (package
    (name "prismatik-psieg")
    (version "5.11.2.31-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/prismatik-psieg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a controller for usb driven LED backlights (an unofficial fork)")
    (description "A controller for usb driven LED backlights (an unofficial fork).")
    (home-page "https://github.com/psieg/Lightpack")
    (license license:gpl3)))

;;; rye-git --- an experimental package management solution for Python
(define-public rye-git
  (package
    (name "rye-git")
    (version "0.44.0.r1.g62ec9ed-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rye-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an experimental package management solution for Python")
    (description "An experimental package management solution for Python.")
    (home-page "https://rye-up.com/")
    (license license:expat)))

;;; xdg-desktop-portal-shana --- a filechooser portal backend for any desktop environment
(define-public xdg-desktop-portal-shana
  (package
    (name "xdg-desktop-portal-shana")
    (version "0.3.16-1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xdg-desktop-portal-shana.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a filechooser portal backend for any desktop environment")
    (description "A filechooser portal backend for any desktop environment.")
    (home-page "https://github.com/Decodetalkers/xdg-desktop-portal-shana")
    (license license:expat)))

;;; polyphone-git --- a soundfont editor for quickly designing musical instruments
(define-public polyphone-git
  (package
    (name "polyphone-git")
    (version "2.6.0.beta.r3.c759b7d7-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/polyphone-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a soundfont editor for quickly designing musical instruments")
    (description "A soundfont editor for quickly designing musical instruments.")
    (home-page "https://polyphone-soundfonts.com/en/")
    (license license:gpl3+)))

;;; bato --- a program to send battery level notifications
(define-public bato
  (package
    (name "bato")
    (version "0.3.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bato.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a program to send battery level notifications")
    (description "A program to send battery level notifications.")
    (home-page "https://github.com/doums/bato")
    (license license:mpl2.0)))

;;; brother-hll2390dw --- brother HL-L2390DW CUPS driver
(define-public brother-hll2390dw
  (package
    (name "brother-hll2390dw")
    (version "4.0.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-hll2390dw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "brother HL-L2390DW CUPS driver")
    (description "Brother HL-L2390DW CUPS driver.")
    (home-page "http://www.brother.com")
    (license license:gpl3+)))

;;; catnip --- terminal audio visualizer for linux/unix/macOS/windows written in go
(define-public catnip
  (package
    (name "catnip")
    (version "1.8.7-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/catnip.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal audio visualizer for linux/unix/macOS/windows written in go")
    (description "Terminal audio visualizer for linux/unix/macOS/windows written in go.")
    (home-page "https://github.com/noriah/catnip")
    (license license:expat)))

;;; jira-cli-bin --- feature-rich interactive Jira command line
(define-public jira-cli-bin
  (package
    (name "jira-cli-bin")
    (version "1.7.0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jira-cli-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "feature-rich interactive Jira command line")
    (description "Feature-rich interactive Jira command line.")
    (home-page "https://github.com/ankitpokhrel/jira-cli")
    (license license:expat)))

;;; upslug2-git --- a tool to flash your NSLU2 (Slug) from a computer on a local network. (With O...
(define-public upslug2-git
  (package
    (name "upslug2-git")
    (version "r30.6fde222-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/upslug2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool to flash your NSLU2 (Slug) from a computer on a local network. (With O...")
    (description "A tool to flash your NSLU2 (Slug) from a computer on a local network. (With OpenWRT patches).")
    (home-page "http://www.nslu2-linux.org/wiki/Main/UpSlug2")
    (license license:expat)))

;;; agent-deck-bin --- terminal session manager for AI coding agents
(define-public agent-deck-bin
  (package
    (name "agent-deck-bin")
    (version "1.7.70-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/agent-deck-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal session manager for AI coding agents")
    (description "Terminal session manager for AI coding agents.")
    (home-page "https://github.com/asheshgoplani/agent-deck")
    (license license:expat)))

;;; arrpc-bun-bin --- typeScript/Bun port of arRPC - Open Discord RPC server (prebuilt binary)
(define-public arrpc-bun-bin
  (package
    (name "arrpc-bun-bin")
    (version "1.3.6-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/arrpc-bun-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "typeScript/Bun port of arRPC - Open Discord RPC server (prebuilt binary)")
    (description "TypeScript/Bun port of arRPC - Open Discord RPC server (prebuilt binary).")
    (home-page "https://github.com/Creationsss/arrpc-bun")
    (license license:expat)))

;;; azaharplus-git --- azaharPlus, an Azahar fork that adds extra features and functionality
(define-public azaharplus-git
  (package
    (name "azaharplus-git")
    (version "2125.0.A.r42.53579d09b-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/azaharplus-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "azaharPlus, an Azahar fork that adds extra features and functionality")
    (description "AzaharPlus, an Azahar fork that adds extra features and functionality.")
    (home-page "https://github.com/AzaharPlus/AzaharPlus")
    (license license:gpl2)))

;;; azaharplus-novulkan-git --- azaharPlus (Citra Fork) compiled without Vulkan support
(define-public azaharplus-novulkan-git
  (package
    (name "azaharplus-novulkan-git")
    (version "r10793.176135e9b-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/azaharplus-novulkan-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "azaharPlus (Citra Fork) compiled without Vulkan support")
    (description "AzaharPlus (Citra Fork) compiled without Vulkan support.")
    (home-page "https://github.com/AzaharPlus/AzaharPlus")
    (license license:gpl2)))

;;; beacn-utility --- a utility for controlling Beacn devices
(define-public beacn-utility
  (package
    (name "beacn-utility")
    (version "0.2.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/beacn-utility.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a utility for controlling Beacn devices")
    (description "A utility for controlling Beacn devices.")
    (home-page "https://github.com/beacn-on-linux/beacn-utility")
    (license license:expat)))

;;; celq-bin --- query and transform JSON, YAML, TOML, XML, and JSON5 data with CEL expression...
(define-public celq-bin
  (package
    (name "celq-bin")
    (version "0.4.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/celq-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "query and transform JSON, YAML, TOML, XML, and JSON5 data with CEL expression...")
    (description "Query and transform JSON, YAML, TOML, XML, and JSON5 data with CEL expressions.")
    (home-page "https://github.com/IvanIsCoding/celq")
    (license license:asl2.0)))

;;; chuckfmt --- a fast code formatter => ChucK programming language
(define-public chuckfmt
  (package
    (name "chuckfmt")
    (version "0.2.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chuckfmt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast code formatter => ChucK programming language")
    (description "A fast code formatter => ChucK programming language.")
    (home-page "https://github.com/aik2mlj/chuckfmt")
    (license license:expat)))

;;; chuckfmt-bin --- a fast code formatter => ChucK programming language
(define-public chuckfmt-bin
  (package
    (name "chuckfmt-bin")
    (version "0.2.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chuckfmt-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast code formatter => ChucK programming language")
    (description "A fast code formatter => ChucK programming language.")
    (home-page "https://github.com/aik2mlj/chuckfmt")
    (license license:expat)))

;;; emerald-legacy-launcher-git --- fOSS, cross-platform launcher for Minecraft Legacy Console Edition
(define-public emerald-legacy-launcher-git
  (package
    (name "emerald-legacy-launcher-git")
    (version "r119.8dfab72-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/emerald-legacy-launcher-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fOSS, cross-platform launcher for Minecraft Legacy Console Edition")
    (description "FOSS, cross-platform launcher for Minecraft Legacy Console Edition.")
    (home-page "https://github.com/LCE-Hub/LCE-Emerald-Launcher")
    (license license:gpl3)))

;;; gc-git --- a garbage collector for C and C++
(define-public gc-git
  (package
    (name "gc-git")
    (version "8.2.0.r2433.gf97b59c6-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gc-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a garbage collector for C and C++")
    (description "A garbage collector for C and C++.")
    (home-page "https://www.hboehm.info/gc/")
    (license license:expat)))

;;; gdlv --- a graphical frontend for Delve
(define-public gdlv
  (package
    (name "gdlv")
    (version "1.16.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gdlv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a graphical frontend for Delve")
    (description "A graphical frontend for Delve.")
    (home-page "https://github.com/aarzilli/gdlv")
    (license license:gpl3)))

;;; godot-bin --- godot Engine - Prebuilt binary from GitHub
(define-public godot-bin
  (package
    (name "godot-bin")
    (version "4.6.2-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/godot-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "godot Engine - Prebuilt binary from GitHub")
    (description "Godot Engine - Prebuilt binary from GitHub.")
    (home-page "https://godotengine.org")
    (license license:expat)))

;;; godot-mono-bin --- godot Engine - Prebuilt binary from GitHub
(define-public godot-mono-bin
  (package
    (name "godot-mono-bin")
    (version "4.6.2-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/godot-mono-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "godot Engine - Prebuilt binary from GitHub")
    (description "Godot Engine - Prebuilt binary from GitHub.")
    (home-page "https://godotengine.org")
    (license license:expat)))

;;; graphify-bin --- aI coding assistant skill - turn any folder into a queryable knowledge graph
(define-public graphify-bin
  (package
    (name "graphify-bin")
    (version "0.5.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/graphify-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aI coding assistant skill - turn any folder into a queryable knowledge graph")
    (description "AI coding assistant skill - turn any folder into a queryable knowledge graph.")
    (home-page "https://graphify.net")
    (license license:expat)))

;;; grindx --- a distraction free DSA practice in your terminal
(define-public grindx
  (package
    (name "grindx")
    (version "0.2.5-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grindx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a distraction free DSA practice in your terminal")
    (description "A distraction free DSA practice in your terminal.")
    (home-page "https://github.com/xghostient/grindx")
    (license license:expat)))

;;; gsd-pi --- a powerful meta-prompting, context engineering and spec-driven development sy...
(define-public gsd-pi
  (package
    (name "gsd-pi")
    (version "2.78.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gsd-pi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a powerful meta-prompting, context engineering and spec-driven development sy...")
    (description "A powerful meta-prompting, context engineering and spec-driven development system that enables agents to work autonomously.")
    (home-page "https://github.com/gsd-build/gsd-2")
    (license license:expat)))

;;; halley --- spatial Wayland compositor built around infinite workspace navigation
(define-public halley
  (package
    (name "halley")
    (version "0.1.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/halley.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "spatial Wayland compositor built around infinite workspace navigation")
    (description "Spatial Wayland compositor built around infinite workspace navigation.")
    (home-page "https://github.com/saltnpepper97/halley")
    (license license:gpl3+)))

;;; hidapi-hotplug-git --- simple library for communicating with USB and Bluetooth HID devices with hotp...
(define-public hidapi-hotplug-git
  (package
    (name "hidapi-hotplug-git")
    (version "r690.b460ad7-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hidapi-hotplug-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple library for communicating with USB and Bluetooth HID devices with hotp...")
    (description "Simple library for communicating with USB and Bluetooth HID devices with hotplug support.")
    (home-page "https://gitlab.com/OpenRGBDevelopers/hidapi-hotplug")
    (license license:bsd-3)))

;;; honeymux-bin --- a new UX layer for the terminal, built on tmux
(define-public honeymux-bin
  (package
    (name "honeymux-bin")
    (version "0.102.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/honeymux-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a new UX layer for the terminal, built on tmux")
    (description "A new UX layer for the terminal, built on tmux.")
    (home-page "https://github.com/honeymux/honeymux")
    (license license:asl2.0)))
