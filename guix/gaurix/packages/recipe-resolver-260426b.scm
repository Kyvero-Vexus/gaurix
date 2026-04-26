;; -*- mode: scheme; coding: utf-8 -*-
;;; recipe-resolver-260426b: 100 packages attempted (99 recipes, 1 blocked)
;;; Generated from AUR PKGBUILDs via queue-drain pass.

(define-module (gaurix packages recipe-resolver-260426b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
   gcc-fortran-snapshot
   perl-apache-session-browseable
   gotify-desktop
   gnome-doc-utils
   openxrechnungtoolbox
   kdeconnect-git
   enlightenment-git
   gotop
   geeqie-git
   uemacs-git
   opentyrian
   gqview
   vk-messenger
   wmcalclock
   fotaq
   nyaovim
   cacti-spine
   libtsm-patched-git
   ttf-technical
   blink1
   shotcut-git
   thunderbird-sogo-connector-bin
   kio-extras-git
   jitsi-videobridge-bin
   mouse-m908
   tmate-git
   php82-intl
   flactagger
   libecwj2
   libodb-mysql
   xorg-transset
   curecoin-qt-git
   xmonad-git
   hxtools
   shuriken
   traffictoll-git
   bitrot-git
   logkeys
   localai-git-cuda
   redict-git
   protonmail-bridge-nokeychain
   ezanvakti-qt-gui
   gnome-activity-journal
   gnome-shell-extension-nightthemeswitcher-git
   libmesh-petsc
   ocserv-git
   protonhax-git
   python-pysmb
   speedtest-rs
   systemd-system-update-pacman
   thunderbird-beta-i18n-kab
   matlab-r2022a-meta
   aocl-crypto
   python-langsmith
   passes-git
   soh-git
   botanicula
   zerofree
   ruby-sprockets
   zfs-auto-snapshot
   python-dbutils
   opensm
   r-glmnet
   cargo-edit-git
   casaos-user-service
   cpuled
   greenpak-designer
   hpack-static-bin
   imediff
   marble-marcher-git
   nuget4
   pacman-expire-cache
   perl-lingua-en-titlecase-simple
   piimg-git
   python-telegram-bot
   qadwaitadecorations-qt6-git
   wmpiki
   yuview-git
   gdk-pixbuf2-git
   libfaction
   mp3fs-git
   remoteplaywhatever-bin
   toolong
   aur-check-rebuild
   cloudfleet-cli
   quien
   unifly-bin
   gaur-bin
   python-spatialmedia
   kibana-bin
   agregore-browser-bin
   atlasvpn-bin
   atoms
   licensor-git
   sx-bin
   linux-kata-bin
   bladerf-git
   bridge-constructor
   brother-mfc-290c
   ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; gcc-fortran-snapshot — GNU Compiler Collection - Fortran front-end (snapshot)
(define-public gcc-fortran-snapshot
  (package
    (name "gcc-fortran-snapshot")
    (version "16.0.0.snapshot20260419")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcc-fortran-snapshot.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gcc.gnu.org")
    (synopsis "GNU Compiler Collection - Fortran front-end (snapshot)")
    (description "GNU Compiler Collection - Fortran front-end (snapshot).")
    (license (list license:fdl1.3+ license:gpl2+ license:gpl3+ license:lgpl3 license:lgpl3+))))

;;; perl-apache-session-browseable — Add index and search methods to Apache::Session
(define-public perl-apache-session-browseable
  (package
    (name "perl-apache-session-browseable")
    (version "1.3.18")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-apache-session-browseable.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/dist/Apache-Session-Browseable")
    (synopsis "add index and search methods to Apache::Session")
    (description "Add index and search methods to Apache::Session.")
    (license license:artistic2.0)))

;;; gotify-desktop — Small Gotify daemon to send messages as desktop notifications
(define-public gotify-desktop
  (package
    (name "gotify-desktop")
    (version "1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gotify-desktop.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/desbma/gotify-desktop")
    (synopsis "small Gotify daemon to send messages as desktop notifications")
    (description "Small Gotify daemon to send messages as desktop notifications.")
    (license license:gpl3)))

;;; gnome-doc-utils — Documentation utilities for Gnome
(define-public gnome-doc-utils
  (package
    (name "gnome-doc-utils")
    (version "0.20.10+16+gc03cc09")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-doc-utils.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.gnome.org")
    (synopsis "documentation utilities for Gnome")
    (description "Documentation utilities for Gnome.")
    (license (list license:gpl2+ license:lgpl2.1+))))

;;; openxrechnungtoolbox — Visualization and validation of XRechnung (and other EN16931 compliant e-invoice
(define-public openxrechnungtoolbox
  (package
    (name "openxrechnungtoolbox")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openxrechnungtoolbox.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://jcthiele.github.io/OpenXRechnungToolbox/")
    (synopsis "visualization and validation of XRechnung (and other EN16931 compliant e-invo")
    (description "Visualization and validation of XRechnung (and other EN16931 compliant e-invoices).")
    (license license:gpl3)))

;;; kdeconnect-git — Adds communication between KDE and your smartphone
(define-public kdeconnect-git
  (package
    (name "kdeconnect-git")
    (version "24.12.1+r4763+g132a372a8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kdeconnect-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kdeconnect.kde.org/")
    (synopsis "adds communication between KDE and your smartphone")
    (description "Adds communication between KDE and your smartphone.")
    (license license:gpl2+)))

;;; enlightenment-git — Enlightenment window manager - Development version
(define-public enlightenment-git
  (package
    (name "enlightenment-git")
    (version "0.26.99.25007.g044149406")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/enlightenment-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.enlightenment.org")
    (synopsis "enlightenment window manager - Development version")
    (description "Enlightenment window manager - Development version.")
    (license license:bsd-3)))

;;; gotop — A terminal based graphical activity monitor inspired by gtop and vtop
(define-public gotop
  (package
    (name "gotop")
    (version "4.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gotop.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xxxserxxx/gotop")
    (synopsis "a terminal based graphical activity monitor inspired by gtop and vtop")
    (description "A terminal based graphical activity monitor inspired by gtop and vtop.")
    (license license:expat)))

;;; geeqie-git — Lightweight image viewer
(define-public geeqie-git
  (package
    (name "geeqie-git")
    (version "2.6.1.r389.ga92906a")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/geeqie-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/BestImageViewer/geeqie")
    (synopsis "lightweight image viewer")
    (description "Lightweight image viewer.")
    (license license:gpl2+)))

;;; uemacs-git — MicroEMACS/PK 4.0.15 customized by Linus Torvalds
(define-public uemacs-git
  (package
    (name "uemacs-git")
    (version "20141208.r122")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uemacs-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://git.kernel.org/?p=editors/uemacs/uemacs.git;a=summary")
    (synopsis "MicroEMACS/PK 4.0.15 customized by Linus Torvalds")
    (description "MicroEMACS/PK 4.0.15 customized by Linus Torvalds.")
    (license license:nonfree)))

;;; opentyrian — Open Source port of the classic DOS shoot-em-up Tyrian
(define-public opentyrian
  (package
    (name "opentyrian")
    (version "2.1.20221123")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/opentyrian.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/opentyrian/opentyrian")
    (synopsis "open Source port of the classic DOS shoot-em-up Tyrian")
    (description "Open Source port of the classic DOS shoot-em-up Tyrian.")
    (license license:gpl2+)))

;;; gqview — An image browser and viewer
(define-public gqview
  (package
    (name "gqview")
    (version "2.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gqview.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://gqview.sourceforge.net/")
    (synopsis "an image browser and viewer")
    (description "An image browser and viewer.")
    (license license:gpl2+)))

;;; vk-messenger — VK Messenger for Linux
(define-public vk-messenger
  (package
    (name "vk-messenger")
    (version "6.0.43")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vk-messenger.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://vk.com/messenger")
    (synopsis "VK Messenger for Linux")
    (description "VK Messenger for Linux.")
    (license license:nonfree)))

;;; wmcalclock — A Calendar clock [WindowMaker dockapp] with antialiased text
(define-public wmcalclock
  (package
    (name "wmcalclock")
    (version "1.25")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wmcalclock.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://web.archive.org/web/20121018121242/http://dockapps.windowmaker.org/file.php/id/9")
    (synopsis "a Calendar clock [WindowMaker dockapp] with antialiased text")
    (description "A Calendar clock [WindowMaker dockapp] with antialiased text.")
    (license license:gpl2+)))

;;; fotaq — "Flight of the Amazon Queen" is a graphical point-and-click adventure game
(define-public fotaq
  (package
    (name "fotaq")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fotaq.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://en.wikipedia.org/wiki/Flight_of_the_amazon_queen")
    (synopsis ""Flight of the Amazon Queen" is a graphical point-and-click adventure game")
    (description ""Flight of the Amazon Queen" is a graphical point-and-click adventure game.")
    (license license:nonfree)))

;;; nyaovim — Neovim frontend built on Electron
(define-public nyaovim
  (package
    (name "nyaovim")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nyaovim.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.npmjs.com/package/nyaovim")
    (synopsis "neovim frontend built on Electron")
    (description "Neovim frontend built on Electron.")
    (license license:expat)))

;;; cacti-spine — Faster poller for Cacti.
(define-public cacti-spine
  (package
    (name "cacti-spine")
    (version "1.2.30")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cacti-spine.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://cacti.net/spine_info.php")
    (synopsis "faster poller for Cacti")
    (description "Faster poller for Cacti.")
    (license license:gpl2+)))

;;; libtsm-patched-git — Terminal-emulator State Machine. Patched flavor (using patches from http://githu
(define-public libtsm-patched-git
  (package
    (name "libtsm-patched-git")
    (version "4.0.2.r41.gba2aea2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libtsm-patched-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.freedesktop.org/wiki/Software/kmscon/libtsm")
    (synopsis "terminal-emulator State Machine. Patched flavor (using patches from http://gi")
    (description "Terminal-emulator State Machine. Patched flavor (using patches from http://github.com/Aetf/libtsm).")
    (license license:expat)))

;;; ttf-technical — A technical font used by architects and engineers
(define-public ttf-technical
  (package
    (name "ttf-technical")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-technical.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://eknp.com/")
    (synopsis "a technical font used by architects and engineers")
    (description "A technical font used by architects and engineers.")
    (license license:nonfree)))

;;; blink1 — software for blink(1) USB RGB LED
(define-public blink1
  (package
    (name "blink1")
    (version "2.4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/blink1.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/todbot/blink1-tool/")
    (synopsis "software for blink(1) USB RGB LED")
    (description "Software for blink(1) USB RGB LED.")
    (license license:gpl2+)))

;;; shotcut-git — Cross-platform Qt based Video Editor - Git latest
(define-public shotcut-git
  (package
    (name "shotcut-git")
    (version "25.03.29+r6598+g86552b847")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/shotcut-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.shotcut.org")
    (synopsis "cross-platform Qt based Video Editor - Git latest")
    (description "Cross-platform Qt based Video Editor - Git latest.")
    (license license:gpl3)))

;;; thunderbird-sogo-connector-bin — Thunderbird frontend for SOGo
(define-public thunderbird-sogo-connector-bin
  (package
    (name "thunderbird-sogo-connector-bin")
    (version "78.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/thunderbird-sogo-connector-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.sogo.nu/downloads/frontends.html")
    (synopsis "thunderbird frontend for SOGo")
    (description "Thunderbird frontend for SOGo.")
    (license (list license:gpl2+ license:lgpl2.1+))))

;;; kio-extras-git — Additional components to increase the functionality of KIO
(define-public kio-extras-git
  (package
    (name "kio-extras-git")
    (version "24.04.70_r7998.g3921f08a5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kio-extras-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.kde.org/applications/internet/")
    (synopsis "additional components to increase the functionality of KIO")
    (description "Additional components to increase the functionality of KIO.")
    (license license:lgpl2.0+)))

;;; jitsi-videobridge-bin — Jitsi Meet Videobridge binary
(define-public jitsi-videobridge-bin
  (package
    (name "jitsi-videobridge-bin")
    (version "2.3+287+g4f55d380a")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jitsi-videobridge-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://jitsi.org/jitsi-meet/")
    (synopsis "Jitsi Meet Videobridge binary")
    (description "Jitsi Meet Videobridge binary.")
    (license license:asl2.0)))

;;; mouse_m908 — Control Redragon gaming mice from Linux, BSD and Haiku
(define-public mouse-m908
  (package
    (name "mouse_m908")
    (version "3.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mouse_m908.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dokutan/mouse_m908")
    (synopsis "control Redragon gaming mice from Linux, BSD and Haiku")
    (description "Control Redragon gaming mice from Linux, BSD and Haiku.")
    (license license:gpl3)))

;;; tmate-git — Instant terminal sharing
(define-public tmate-git
  (package
    (name "tmate-git")
    (version "2.4.0.r29.gac919516")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tmate-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tmate.io/")
    (synopsis "instant terminal sharing")
    (description "Instant terminal sharing.")
    (license license:isc)))

;;; php82-intl — intl module for php82
(define-public php82-intl
  (package
    (name "php82-intl")
    (version "8.2.30")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php82-intl.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.php.net")
    (synopsis "intl module for php82")
    (description "Intl module for php82.")
    (license license:php3.01)))

;;; flactagger — A Ruby script for tagging FLAC files
(define-public flactagger
  (package
    (name "flactagger")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/flactagger.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://sourceforge.net/projects/flactagger.berlios")
    (synopsis "a Ruby script for tagging FLAC files")
    (description "A Ruby script for tagging FLAC files.")
    (license license:gpl3)))

;;; libecwj2 — Library for both the ECW and the ISO JPEG 2000 image file formats
(define-public libecwj2
  (package
    (name "libecwj2")
    (version "3.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libecwj2.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://trac.osgeo.org/gdal/wiki/ECW")
    (synopsis "library for both the ECW and the ISO JPEG 2000 image file formats")
    (description "Library for both the ECW and the ISO JPEG 2000 image file formats.")
    (license license:nonfree)))

;;; libodb-mysql — The ODB MySQL runtime library
(define-public libodb-mysql
  (package
    (name "libodb-mysql")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libodb-mysql.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.codesynthesis.com/products/odb/")
    (synopsis "the ODB MySQL runtime library")
    (description "The ODB MySQL runtime library.")
    (license license:gpl3)))

;;; xorg-transset — X.org's transset
(define-public xorg-transset
  (package
    (name "xorg-transset")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xorg-transset.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.x.org/")
    (synopsis "x.org's transset")
    (description "X.org's transset.")
    (license license:nonfree)))

;;; curecoin-qt-git — GUI client (wallet) for CureCoin cryptocurrency
(define-public curecoin-qt-git
  (package
    (name "curecoin-qt-git")
    (version "v2.1.0.1.r0.gc06a7b2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/curecoin-qt-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://curecoin.net/")
    (synopsis "gUI client (wallet) for CureCoin cryptocurrency")
    (description "GUI client (wallet) for CureCoin cryptocurrency.")
    (license license:expat)))

;;; xmonad-git — Lightweight X11 tiled window manager written in Haskell
(define-public xmonad-git
  (package
    (name "xmonad-git")
    (version "v0.17.0.r24.ge25d090")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xmonad-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://xmonad.org/")
    (synopsis "lightweight X11 tiled window manager written in Haskell")
    (description "Lightweight X11 tiled window manager written in Haskell.")
    (license license:bsd-3)))

;;; hxtools — A collection of tools and scripts that have accumulated over the years, and each
(define-public hxtools
  (package
    (name "hxtools")
    (version "20201116")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hxtools.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://inai.de/projects/hxtools/")
    (synopsis "a collection of tools and scripts that have accumulated over the years, and e")
    (description "A collection of tools and scripts that have accumulated over the years, and each of which seems to be too small to warrants its own project.")
    (license license:gpl3)))

;;; shuriken — An open source beat slicer
(define-public shuriken
  (package
    (name "shuriken")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/shuriken.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rock-hopper.github.io/shuriken")
    (synopsis "an open source beat slicer")
    (description "An open source beat slicer.")
    (license license:gpl2+)))

;;; traffictoll-git — NetLimiter-like traffic shaping for Linux
(define-public traffictoll-git
  (package
    (name "traffictoll-git")
    (version "1.5.0.r1.g4569b4c")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/traffictoll-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cryzed/TrafficToll")
    (synopsis "netLimiter-like traffic shaping for Linux")
    (description "NetLimiter-like traffic shaping for Linux.")
    (license license:gpl3)))

;;; bitrot-git — Bitrot audio plugins (LV2, VST2 and LADSPA)
(define-public bitrot-git
  (package
    (name "bitrot-git")
    (version "r16.06a72cd")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bitrot-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/grejppi/bitrot.git")
    (synopsis "bitrot audio plugins (LV2, VST2 and LADSPA)")
    (description "Bitrot audio plugins (LV2, VST2 and LADSPA).")
    (license license:asl2.0)))

;;; logkeys — Simple keylogger supporting also USB keyboards.
(define-public logkeys
  (package
    (name "logkeys")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/logkeys.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kernc/logkeys")
    (synopsis "simple keylogger supporting also USB keyboards")
    (description "Simple keylogger supporting also USB keyboards.")
    (license license:gpl3)))

;;; localai-git-cuda — Self-hosted OpenAI API alternative - Open Source, community-driven and local-fir
(define-public localai-git-cuda
  (package
    (name "localai-git-cuda")
    (version "2.24.0.93.g0eb2911a")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/localai-git-cuda.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mudler/LocalAI")
    (synopsis "self-hosted OpenAI API alternative - Open Source, community-driven and local-")
    (description "Self-hosted OpenAI API alternative - Open Source, community-driven and local-first. (with CUDA support).")
    (license license:expat)))

;;; redict-git — A distributed key/value database (development version)
(define-public redict-git
  (package
    (name "redict-git")
    (version "r12218.a4c811023")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/redict-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/redict/redict")
    (synopsis "a distributed key/value database (development version)")
    (description "A distributed key/value database (development version).")
    (license license:lgpl3)))

;;; protonmail-bridge-nokeychain — An IMAP/SMTP bridge to a ProtonMail account (patched, stores secrets in a file)
(define-public protonmail-bridge-nokeychain
  (package
    (name "protonmail-bridge-nokeychain")
    (version "3.24.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/protonmail-bridge-nokeychain.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://protonmail.com/bridge/")
    (synopsis "an IMAP/SMTP bridge to a ProtonMail account (patched, stores secrets in a file)")
    (description "An IMAP/SMTP bridge to a ProtonMail account (patched, stores secrets in a file).")
    (license license:gpl3)))

;;; ezanvakti-qt-gui — Qt Gui for Ezanvakti Application
(define-public ezanvakti-qt-gui
  (package
    (name "ezanvakti-qt-gui")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ezanvakti-qt-gui.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/fbostanci/ezanvakti-qt-gui")
    (synopsis "Qt Gui for Ezanvakti Application")
    (description "Qt Gui for Ezanvakti Application.")
    (license license:gpl3)))

;;; gnome-activity-journal — Activity Journal for the GNOME desktop environment
(define-public gnome-activity-journal
  (package
    (name "gnome-activity-journal")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-activity-journal.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.gnome.org/crvi/gnome-activity-journal")
    (synopsis "activity Journal for the GNOME desktop environment")
    (description "Activity Journal for the GNOME desktop environment.")
    (license license:gpl2+)))

;;; gnome-shell-extension-nightthemeswitcher-git — Automatically toggle your light and dark themes variants
(define-public gnome-shell-extension-nightthemeswitcher-git
  (package
    (name "gnome-shell-extension-nightthemeswitcher-git")
    (version "78.r0.gddae070")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-extension-nightthemeswitcher-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension")
    (synopsis "automatically toggle your light and dark themes variants")
    (description "Automatically toggle your light and dark themes variants.")
    (license (list license:expat license:gpl2+ license:gpl3+ license:nonfree))))

;;; libmesh-petsc — A C++ Finite Element Library
(define-public libmesh-petsc
  (package
    (name "libmesh-petsc")
    (version "cpp03_final.r6839.g3e858a733")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libmesh-petsc.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://libmesh.github.io/")
    (synopsis "a C++ Finite Element Library")
    (description "A C++ Finite Element Library.")
    (license license:lgpl2.1+)))

;;; ocserv-git — OpenConnect VPN Server
(define-public ocserv-git
  (package
    (name "ocserv-git")
    (version "1.2.4.r7.g44721552")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocserv-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/openconnect/ocserv")
    (synopsis "OpenConnect VPN Server")
    (description "OpenConnect VPN Server.")
    (license license:gpl2+)))

;;; protonhax-git — Program to help executing outside programs in proton
(define-public protonhax-git
  (package
    (name "protonhax-git")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/protonhax-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jcnils/protonhax")
    (synopsis "program to help executing outside programs in proton")
    (description "Program to help executing outside programs in proton.")
    (license license:bsd-3)))

;;; python-pysmb — An experimental SMB/CIFS library written in Python
(define-public python-pysmb
  (package
    (name "python-pysmb")
    (version "1.2.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pysmb.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://miketeo.net/wp/index.php/projects/pysmb")
    (synopsis "an experimental SMB/CIFS library written in Python")
    (description "An experimental SMB/CIFS library written in Python.")
    (license license:zlib)))

;;; speedtest-rs — Speedtest.net testing utility and crate
(define-public speedtest-rs
  (package
    (name "speedtest-rs")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/speedtest-rs.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nelsonjchen/speedtest-rs")
    (synopsis "Speedtest.net testing utility and crate")
    (description "Speedtest.net testing utility and crate.")
    (license (list license:asl2.0 license:expat))))

;;; systemd-system-update-pacman — Scripts for scheduling and performing system updates with pacman using systemd's
(define-public systemd-system-update-pacman
  (package
    (name "systemd-system-update-pacman")
    (version "2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/systemd-system-update-pacman.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FraGag/systemd-system-update-pacman")
    (synopsis "scripts for scheduling and performing system updates with pacman using system")
    (description "Scripts for scheduling and performing system updates with pacman using systemd's system update mechanism.")
    (license license:expat)))

;;; thunderbird-beta-i18n-kab — Kabyle language pack for Thunderbird Beta
(define-public thunderbird-beta-i18n-kab
  (package
    (name "thunderbird-beta-i18n-kab")
    (version "142.0b4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/thunderbird-beta-i18n-kab.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.mozilla.com/")
    (synopsis "kabyle language pack for Thunderbird Beta")
    (description "Kabyle language pack for Thunderbird Beta.")
    (license (list license:gpl2 license:lgpl2.1 license:mpl2.0))))

;;; matlab-r2022a-meta — A high-level language for numerical computation and visualization (R2022a, meta)
(define-public matlab-r2022a-meta
  (package
    (name "matlab-r2022a-meta")
    (version "1:R2026a")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/matlab-r2022a-meta.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mathworks-ref-arch/container-images/tree/main/matlab-deps")
    (synopsis "a high-level language for numerical computation and visualization (R2022a, meta)")
    (description "A high-level language for numerical computation and visualization (R2022a, meta).")
    (license license:bsd-0)))

;;; aocl-crypto — AOCL-Cryptography is a library consisting of cryptographic optimized functions f
(define-public aocl-crypto
  (package
    (name "aocl-crypto")
    (version "5.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aocl-crypto.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/amd/aocl-crypto")
    (synopsis "AOCL-Cryptography is a library consisting of cryptographic optimized function")
    (description "AOCL-Cryptography is a library consisting of cryptographic optimized functions for Zen.")
    (license license:nonfree)))

;;; python-langsmith — Client library to connect to the LangSmith LLM Tracing and Evaluation Platform.
(define-public python-langsmith
  (package
    (name "python-langsmith")
    (version "0.7.26")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-langsmith.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://smith.langchain.com/")
    (synopsis "client library to connect to the LangSmith LLM Tracing and Evaluation Platform")
    (description "Client library to connect to the LangSmith LLM Tracing and Evaluation Platform.")
    (license license:expat)))

;;; passes-git — A digital pass manager
(define-public passes-git
  (package
    (name "passes-git")
    (version "r115.c035c41")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/passes-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pablo-s/passes")
    (synopsis "a digital pass manager")
    (description "A digital pass manager.")
    (license license:gpl3)))

;;; soh-git — An unofficial port of The Legend of Zelda Ocarina of Time for PC, Wii U, and Swi
(define-public soh-git
  (package
    (name "soh-git")
    (version "9.0.2.r182.g237dcfec7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/soh-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://shipofharkinian.com/")
    (synopsis "an unofficial port of The Legend of Zelda Ocarina of Time for PC, Wii U, and ")
    (description "An unofficial port of The Legend of Zelda Ocarina of Time for PC, Wii U, and Switch (git).")
    (license license:nonfree)))

;;; botanicula — A point'n'click exploration game from the creators of Machinarium (requires full
(define-public botanicula
  (package
    (name "botanicula")
    (version "20120501")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/botanicula.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.botanicula.net/")
    (synopsis "a point'n'click exploration game from the creators of Machinarium (requires f")
    (description "A point'n'click exploration game from the creators of Machinarium (requires full copy of the game).")
    (license license:nonfree)))

;;; zerofree — Scans for non-zero free blocks in an ext2 filesystem and fills them with zeroes
(define-public zerofree
  (package
    (name "zerofree")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zerofree.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://frippery.org/uml/")
    (synopsis "scans for non-zero free blocks in an ext2 filesystem and fills them with zeroes")
    (description "Scans for non-zero free blocks in an ext2 filesystem and fills them with zeroes.")
    (license license:gpl2+)))

;;; ruby-sprockets — Rack-based asset packaging system
(define-public ruby-sprockets
  (package
    (name "ruby-sprockets")
    (version "4.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ruby-sprockets.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rails/sprockets")
    (synopsis "rack-based asset packaging system")
    (description "Rack-based asset packaging system.")
    (license license:expat)))

;;; zfs-auto-snapshot — Implementation of a snapshotting service for ZFS
(define-public zfs-auto-snapshot
  (package
    (name "zfs-auto-snapshot")
    (version "1.2.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zfs-auto-snapshot.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zfsonlinux/zfs-auto-snapshot")
    (synopsis "implementation of a snapshotting service for ZFS")
    (description "Implementation of a snapshotting service for ZFS.")
    (license license:gpl2)))

;;; python-dbutils — Suite of Python modules allowing to connect in a safe and efficient way between 
(define-public python-dbutils
  (package
    (name "python-dbutils")
    (version "3.0.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-dbutils.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/WebwareForPython/DBUtils")
    (synopsis "suite of Python modules allowing to connect in a safe and efficient way betwe")
    (description "Suite of Python modules allowing to connect in a safe and efficient way between a threaded Python application and a database.")
    (license license:expat)))

;;; opensm — OpenFabrics Alliance InfiniBand Subnet Manager and Administrator
(define-public opensm
  (package
    (name "opensm")
    (version "3.3.24")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/opensm.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.openfabrics.org/index.php/overview.html")
    (synopsis "openFabrics Alliance InfiniBand Subnet Manager and Administrator")
    (description "OpenFabrics Alliance InfiniBand Subnet Manager and Administrator.")
    (license (list license:bsd-3 license:gpl2))))

;;; r-glmnet — Lasso and Elastic-Net Regularized Generalized Linear Models
(define-public r-glmnet
  (package
    (name "r-glmnet")
    (version "4.1.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-glmnet.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cran.r-project.org/package=glmnet")
    (synopsis "lasso and Elastic-Net Regularized Generalized Linear Models")
    (description "Lasso and Elastic-Net Regularized Generalized Linear Models.")
    (license license:gpl2+)))

;;; cargo-edit-git — A utility for adding cargo dependencies from the command line
(define-public cargo-edit-git
  (package
    (name "cargo-edit-git")
    (version "r640.82c09192")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cargo-edit-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/killercup/cargo-edit")
    (synopsis "a utility for adding cargo dependencies from the command line")
    (description "A utility for adding cargo dependencies from the command line.")
    (license license:expat)))

;;; casaos-user-service — Provides user management functionalities to CasaOS.
(define-public casaos-user-service
  (package
    (name "casaos-user-service")
    (version "0.4.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/casaos-user-service.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/IceWhaleTech/CasaOS-UserService")
    (synopsis "provides user management functionalities to CasaOS")
    (description "Provides user management functionalities to CasaOS.")
    (license license:asl2.0)))

;;; cpuled — It's a program to let the keyboard LEDs indicate CPU load.
(define-public cpuled
  (package
    (name "cpuled")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cpuled.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://web.archive.org/web/20011210154318/www.sudac.org/~napolium/linux/")
    (synopsis "it's a program to let the keyboard LEDs indicate CPU load")
    (description "It's a program to let the keyboard LEDs indicate CPU load.")
    (license license:gpl2+)))

;;; greenpak-designer — GreenPAK3-6 Designer
(define-public greenpak-designer
  (package
    (name "greenpak-designer")
    (version "6.25.003")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/greenpak-designer.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.dialog-semiconductor.com/greenpak-designer-software")
    (synopsis "GreenPAK3-6 Designer")
    (description "GreenPAK3-6 Designer.")
    (license license:nonfree)))

;;; hpack-static-bin — A modern format for Haskell packages (statically linked binary)
(define-public hpack-static-bin
  (package
    (name "hpack-static-bin")
    (version "0.38.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hpack-static-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sol/hpack")
    (synopsis "a modern format for Haskell packages (statically linked binary)")
    (description "A modern format for Haskell packages (statically linked binary).")
    (license license:expat)))

;;; imediff — ncurses-based 2/3 file merge tool
(define-public imediff
  (package
    (name "imediff")
    (version "3.4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/imediff.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/osamuaoki/imediff")
    (synopsis "ncurses-based 2/3 file merge tool")
    (description "Ncurses-based 2/3 file merge tool.")
    (license license:gpl2)))

;;; marble-marcher-git — A Fractal Physics Game.
(define-public marble-marcher-git
  (package
    (name "marble-marcher-git")
    (version "0.0.0.g8503931")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/marble-marcher-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeparade.itch.io/marblemarcher")
    (synopsis "a Fractal Physics Game")
    (description "A Fractal Physics Game.")
    (license license:gpl2)))

;;; nuget4 — Package manager for .NET.
(define-public nuget4
  (package
    (name "nuget4")
    (version "4.4.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nuget4.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.nuget.org")
    (synopsis "package manager for .NET")
    (description "Package manager for .NET.")
    (license license:asl2.0)))

;;; pacman-expire-cache — Tool for deleting old cached package files for pacman
(define-public pacman-expire-cache
  (package
    (name "pacman-expire-cache")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pacman-expire-cache.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://ikn.org.uk/tool/pacman-expire-cache")
    (synopsis "tool for deleting old cached package files for pacman")
    (description "Tool for deleting old cached package files for pacman.")
    (license license:bsd-3)))

;;; perl-lingua-en-titlecase-simple — John Gruber's headline capitalization script
(define-public perl-lingua-en-titlecase-simple
  (package
    (name "perl-lingua-en-titlecase-simple")
    (version "1.015")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-lingua-en-titlecase-simple.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/release/ARISTOTLE/Lingua-EN-Titlecase-Simple-1.015")
    (synopsis "john Gruber's headline capitalization script")
    (description "John Gruber's headline capitalization script.")
    (license license:expat)))

;;; piimg-git — A utility for working with disk images, which are designed to be flashed onto a 
(define-public piimg-git
  (package
    (name "piimg-git")
    (version "27.e7ce4ad")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/piimg-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/alexchamberlain/piimg")
    (synopsis "a utility for working with disk images, which are designed to be flashed onto")
    (description "A utility for working with disk images, which are designed to be flashed onto a Raspberry Pi.")
    (license license:expat)))

;;; python-telegram-bot — A library that provides a Python interface to the Telegram Bot API
(define-public python-telegram-bot
  (package
    (name "python-telegram-bot")
    (version "22.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-telegram-bot.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/python-telegram-bot/python-telegram-bot")
    (synopsis "a library that provides a Python interface to the Telegram Bot API")
    (description "A library that provides a Python interface to the Telegram Bot API.")
    (license license:lgpl3)))

;;; qadwaitadecorations-qt6-git — Qt6 decoration plugin implementing Adwaita-like client-side decorations
(define-public qadwaitadecorations-qt6-git
  (package
    (name "qadwaitadecorations-qt6-git")
    (version "0.1.7.r1.ge6da80a")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qadwaitadecorations-qt6-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FedoraQt/QAdwaitaDecorations")
    (synopsis "Qt6 decoration plugin implementing Adwaita-like client-side decorations")
    (description "Qt6 decoration plugin implementing Adwaita-like client-side decorations.")
    (license license:lgpl2.1+)))

;;; wmpiki — Multiping host checker dockapp for Window Maker
(define-public wmpiki
  (package
    (name "wmpiki")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wmpiki.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://web.archive.org/web/20121031045821/http://dockapps.windowmaker.org/file.php/id/120")
    (synopsis "multiping host checker dockapp for Window Maker")
    (description "Multiping host checker dockapp for Window Maker.")
    (license license:gpl2+)))

;;; yuview-git — The Free and Open Source Cross Platform YUV Viewer with an advanced analytics to
(define-public yuview-git
  (package
    (name "yuview-git")
    (version "r1122.45015e9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yuview-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/IENT/YUView")
    (synopsis "the Free and Open Source Cross Platform YUV Viewer with an advanced analytics")
    (description "The Free and Open Source Cross Platform YUV Viewer with an advanced analytics toolset.")
    (license license:gpl2+)))

;;; gdk-pixbuf2-git — An image loading library
(define-public gdk-pixbuf2-git
  (package
    (name "gdk-pixbuf2-git")
    (version "2.44.2.r1.gbeb152174")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gdk-pixbuf2-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wiki.gnome.org/Projects/GdkPixbuf")
    (synopsis "an image loading library")
    (description "An image loading library.")
    (license license:lgpl2.0+)))

;;; libfaction — A C library for test-driven software development
(define-public libfaction
  (package
    (name "libfaction")
    (version "0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libfaction.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://timetoplatypus.com/static/faction")
    (synopsis "a C library for test-driven software development")
    (description "A C library for test-driven software development.")
    (license license:bsd-3)))

;;; mp3fs-git — FUSE-based transcoding filesystem from FLAC to MP3
(define-public mp3fs-git
  (package
    (name "mp3fs-git")
    (version "1.1.1.r10.g0bda170")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mp3fs-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://khenriks.github.io/mp3fs")
    (synopsis "FUSE-based transcoding filesystem from FLAC to MP3")
    (description "FUSE-based transcoding filesystem from FLAC to MP3.")
    (license license:gpl3+)))

;;; remoteplaywhatever-bin — Tiny application that lets you force remote play together any game you have in y
(define-public remoteplaywhatever-bin
  (package
    (name "remoteplaywhatever-bin")
    (version "0.2.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/remoteplaywhatever-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/m4dEngi/RemotePlayWhatever")
    (synopsis "tiny application that lets you force remote play together any game you have i")
    (description "Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones.(Prebuilt version).")
    (license license:expat)))

;;; toolong — A terminal application to view, tail, merge, and search log files (plus JSONL)
(define-public toolong
  (package
    (name "toolong")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/toolong.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Textualize/toolong")
    (synopsis "a terminal application to view, tail, merge, and search log files (plus JSONL)")
    (description "A terminal application to view, tail, merge, and search log files (plus JSONL).")
    (license license:expat)))

;;; aur-check-rebuild — Pacman hook to check and launch rebuild of AUR packages affected by updates
(define-public aur-check-rebuild
  (package
    (name "aur-check-rebuild")
    (version "1.2.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aur-check-rebuild.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Emiliopg91/aur-check-rebuild")
    (synopsis "pacman hook to check and launch rebuild of AUR packages affected by updates")
    (description "Pacman hook to check and launch rebuild of AUR packages affected by updates.")
    (license license:gpl2)))

;;; cloudfleet-cli — Cloudfleet CLI
(define-public cloudfleet-cli
  (package
    (name "cloudfleet-cli")
    (version "0.8.32")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cloudfleet-cli.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cloudfleet.ai")
    (synopsis "Cloudfleet CLI")
    (description "Cloudfleet CLI.")
    (license license:nonfree)))

;;; quien — A better whois and domain intelligence toolkit
(define-public quien
  (package
    (name "quien")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quien.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/retlehs/quien")
    (synopsis "a better whois and domain intelligence toolkit")
    (description "A better whois and domain intelligence toolkit.")
    (license license:expat)))

;;; unifly-bin — CLI + TUI for managing UniFi network controllers
(define-public unifly-bin
  (package
    (name "unifly-bin")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unifly-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hyperb1iss/unifly")
    (synopsis "cLI + TUI for managing UniFi network controllers")
    (description "CLI + TUI for managing UniFi network controllers.")
    (license license:asl2.0)))

;;; gaur-bin — A beautiful, interactive TUI for Arch Linux package management (prebuilt binary)
(define-public gaur-bin
  (package
    (name "gaur-bin")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gaur-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/prbhtkumr/gaur")
    (synopsis "a beautiful, interactive TUI for Arch Linux package management (prebuilt binary)")
    (description "A beautiful, interactive TUI for Arch Linux package management (prebuilt binary).")
    (license license:gpl3)))

;;; python-spatialmedia — Specifications and tools for 360 video and spatial audio.
(define-public python-spatialmedia
  (package
    (name "python-spatialmedia")
    (version "2.1.r23.g57c85bb")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-spatialmedia.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/google/spatial-media")
    (synopsis "specifications and tools for 360 video and spatial audio")
    (description "Specifications and tools for 360 video and spatial audio.")
    (license license:asl2.0)))

;;; kibana-bin — Browser based analytics and search dashboard for Elasticsearch
(define-public kibana-bin
  (package
    (name "kibana-bin")
    (version "9.3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kibana-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/elastic/kibana")
    (synopsis "browser based analytics and search dashboard for Elasticsearch")
    (description "Browser based analytics and search dashboard for Elasticsearch.")
    (license license:asl2.0)))

;;; agregore-browser-bin — A minimal web browser for the distributed web
(define-public agregore-browser-bin
  (package
    (name "agregore-browser-bin")
    (version "2.23.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/agregore-browser-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AgregoreWeb/agregore-browser")
    (synopsis "a minimal web browser for the distributed web")
    (description "A minimal web browser for the distributed web.")
    (license license:agpl3+)))

;;; atlasvpn-bin — Package to install AtlasVPN
(define-public atlasvpn-bin
  (package
    (name "atlasvpn-bin")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/atlasvpn-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://atlasvpn.com")
    (synopsis "package to install AtlasVPN")
    (description "Package to install AtlasVPN.")
    (license license:nonfree)))

;;; atoms — Easily manage Linux Chroot(s) and Containers
(define-public atoms
  (package
    (name "atoms")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/atoms.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AtomsDevs/Atoms")
    (synopsis "easily manage Linux Chroot(s) and Containers")
    (description "Easily manage Linux Chroot(s) and Containers.")
    (license license:gpl3)))

;;; licensor-git — Write a license to standard output given its SPDX ID
(define-public licensor-git
  (package
    (name "licensor-git")
    (version "v1.0.1.r0.gf498f64")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/licensor-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/raftario/licensor")
    (synopsis "write a license to standard output given its SPDX ID")
    (description "Write a license to standard output given its SPDX ID.")
    (license license:expat)))

;;; sx-bin — Multi-engine web search from the command line
(define-public sx-bin
  (package
    (name "sx-bin")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sx-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/byteowlz/sx")
    (synopsis "multi-engine web search from the command line")
    (description "Multi-engine web search from the command line.")
    (license license:expat)))

;;; linux-kata-bin — Lightweight virtual machines for containers (version 2, binary packaging)
(define-public linux-kata-bin
  (package
    (name "linux-kata-bin")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-kata-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://katacontainers.io")
    (synopsis "lightweight virtual machines for containers (version 2, binary packaging)")
    (description "Lightweight virtual machines for containers (version 2, binary packaging).")
    (license license:asl2.0)))

;;; bladerf-git — Driver, userspace, fpga & firmware for the bladeRF SDR.
(define-public bladerf-git
  (package
    (name "bladerf-git")
    (version "2018.12.rc2.r36.g896d2431")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bladerf-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Nuand/bladeRF")
    (synopsis "driver, userspace, fpga & firmware for the bladeRF SDR")
    (description "Driver, userspace, fpga & firmware for the bladeRF SDR.")
    (license license:gpl2)))

;;; bridge-constructor — Become an appraised bridge engineer and architect in Bridge Constructor
(define-public bridge-constructor
  (package
    (name "bridge-constructor")
    (version "2.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bridge-constructor.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.bridgeconstructor.com/")
    (synopsis "become an appraised bridge engineer and architect in Bridge Constructor")
    (description "Become an appraised bridge engineer and architect in Bridge Constructor.")
    (license license:nonfree)))

;;; brother-mfc-290c — LPR and CUPS driver for the Brother MFC-290C printer
(define-public brother-mfc-290c
  (package
    (name "brother-mfc-290c")
    (version "1.1.2_2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-mfc-290c.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://support.brother.com/g/s/id/linux/en/")
    (synopsis "LPR and CUPS driver for the Brother MFC-290C printer")
    (description "LPR and CUPS driver for the Brother MFC-290C printer.")
    (license (list license:gpl2+ license:nonfree))))
