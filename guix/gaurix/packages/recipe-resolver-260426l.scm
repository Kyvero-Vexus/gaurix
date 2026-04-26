;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260426l
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260426l)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system ruby)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
            simple-system-update
            museeks-bin
            eco-paste-beta-bin
            ochami-bin
            brainworkshop
            shd-bin
            flow-bin
            vfox-bin
            sam2p
            ttf-ms-win8-indic
            ffdec
            obtheme
            fortune-mod-zh
            evernote-beta-bin
            dosbox-svn
            vmware-vcli
            python2-stomper
            otf-im-fell-types
            pzl-sokoban
            matcha-gtk-theme-git
            hdrmerge
            python-pyscaffold
            freemind-bin
            ultrastardx-utility
            deepin-mail-bin
            olympus-bin
            inteltool
            zenmonitor
            ruby-colorls
            macos11-gtk-theme
            tamzen-font
            ttf-chunk
            xmlcutty-bin
            dain-ncnn-vulkan-bin
            dnf-plugins-extras
            nzb-bin
            plymouth-theme-arch-logo-new
            plymouth-theme-dragon-git
            plymouth-theme-hexagon-red-git
            ries
            warfork
            xfce-theme-blackbird-git
            qtesseract5
            matlab-r2021a-meta-all
            python-django-multiselectfield
            tela-circle-icon-theme-blue-git
            aliyunpan-gaozhangmin-bin
            btdex
            ruby-fog-core
            ttf-comic-shanns-v2
            cuda-11-7
            deepspeech-bin
            foundry-bin
            mosdns-bin
            ttf-foundertype-sc-fonts
            xerox-docuprint-cp405
            obs-cli-leafac-bin
            siod
            gitmun-bin
            nano-ffmpeg-bin
            otf-nanumbarungothic-yethangul
            otf-nanumbrush
            kwybars-bin
            lcl-gui-bin
            goku-bin
            ttf-cinecaption
            zf-bin
            poi-nightly-bin
            aliae-bin
            material-gtk-theme-deepocean-git
            ablavema-bin
            atomblocks
            python2-netifaces
            modrinth-app-beta-bin
            bicep-bin
            cairo-msg
            codicefiscale
            cycdm-bin
            euroscope-bin
            helius-bin
            emercoin-bin
            foobar2000-component-scrobble-bin
            gawk-haru
            ghc8-8-bin
            gitty-bin
            gosimac
            habboon-client-bin
            python-whatever
            cpass
            idos-timetable-tariff-chaps-all-latest
            influxdb2-bin
            kiss-gui
            lightdm-webkit2-theme-alter
            lr2oraja
            jaxe-bin
            heidisql-qt6
            md-to-html2
            nancy-bin
            nist-sts
            otf-eau-douce-sans
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; simple-system-update --- one-click update button for Linux users
(define-public simple-system-update
  (package
    (name "simple-system-update")
    (version "1.0.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/simple-system-update.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "one-click update button for Linux users")
    (description "One-click update button for Linux users.")
    (home-page "https://github.com/SeryogaBrigada/SimpleSystemUpdate")
    (license license:expat)))

;;; museeks-bin --- A lightweight and cross-platform music player
(define-public museeks-bin
  (package
    (name "museeks-bin")
    (version "0.23.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/museeks-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A lightweight and cross-platform music player")
    (description "A lightweight and cross-platform music player.")
    (home-page "http://museeks.io")
    (license license:expat)))

;;; eco-paste-beta-bin --- 内测预览版!!!🎉跨平台的剪贴板管理工具 | Cross-platform clipboard management tool 
(define-public eco-paste-beta-bin
  (package
    (name "eco-paste-beta-bin")
    (version "0.6.0beta.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eco-paste-beta-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "内测预览版!!!🎉跨平台的剪贴板管理工具 | Cross-platform clipboard management tool ")
    (description "内测预览版!!!🎉跨平台的剪贴板管理工具 | Cross-platform clipboard management tool .")
    (home-page "https://github.com/EcoPasteHub/EcoPaste")
    (license license:asl2.0)))

;;; ochami-bin --- command line interface for OpenCHAMI services
(define-public ochami-bin
  (package
    (name "ochami-bin")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ochami-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command line interface for OpenCHAMI services")
    (description "Command line interface for OpenCHAMI services.")
    (home-page "https://github.com/OpenCHAMI/ochami")
    (license license:expat)))

;;; brainworkshop --- brain Workshop is a free open-source version of the Dual N-Back mental exercise
(define-public brainworkshop
  (package
    (name "brainworkshop")
    (version "5.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brainworkshop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "brain Workshop is a free open-source version of the Dual N-Back mental exercise")
    (description "Brain Workshop is a free open-source version of the Dual N-Back mental exercise.")
    (home-page "https://github.com/samcv/brainworkshop")
    (license license:gpl3+)))

;;; shd-bin --- console tool to display drive list with commonly checked smart info
(define-public shd-bin
  (package
    (name "shd-bin")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/shd-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "console tool to display drive list with commonly checked smart info")
    (description "Console tool to display drive list with commonly checked smart info.")
    (home-page "https://github.com/alttch/shd")
    (license license:expat)))

;;; flow-bin --- A static type checker for JavaScript
(define-public flow-bin
  (package
    (name "flow-bin")
    (version "0.307.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/flow-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A static type checker for JavaScript")
    (description "A static type checker for JavaScript.")
    (home-page "https://flow.org")
    (license license:expat)))

;;; vfox-bin --- A cross-platform and extendable version manager with support for Java, Node.j...
(define-public vfox-bin
  (package
    (name "vfox-bin")
    (version "1.0.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vfox-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A cross-platform and extendable version manager with support for Java, Node.j...")
    (description "A cross-platform and extendable version manager with support for Java, Node.js, Flutter, .Net & more.Prebuilt version.")
    (home-page "https://vfox.dev")
    (license license:asl2.0)))

;;; sam2p --- A bitmap-to-eps-or-pdf-converter that produces very small files
(define-public sam2p
  (package
    (name "sam2p")
    (version "0.49.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sam2p.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A bitmap-to-eps-or-pdf-converter that produces very small files")
    (description "A bitmap-to-eps-or-pdf-converter that produces very small files.")
    (home-page "http://www.inf.bme.hu/~pts")
    (license license:gpl2+)))

;;; ttf-ms-win8-indic --- microsoft Windows 8.1 Latin and International TrueType fonts
(define-public ttf-ms-win8-indic
  (package
    (name "ttf-ms-win8-indic")
    (version "6.3.9600.17238")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win8-indic.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "microsoft Windows 8.1 Latin and International TrueType fonts")
    (description "Microsoft Windows 8.1 Latin and International TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=161")
    (license license:nonfree)))

;;; ffdec --- open Source Flash SWF decompiler and editor
(define-public ffdec
  (package
    (name "ffdec")
    (version "26.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ffdec.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "open Source Flash SWF decompiler and editor")
    (description "Open Source Flash SWF decompiler and editor.")
    (home-page "https://github.com/jindrapetrik/jpexs-decompiler")
    (license license:gpl3+)))

;;; obtheme --- A GUI theme editor for Openbox
(define-public obtheme
  (package
    (name "obtheme")
    (version "2013.2.20.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/obtheme.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A GUI theme editor for Openbox")
    (description "A GUI theme editor for Openbox.")
    (home-page "https://xyne.dev/projects/obtheme")
    (license license:gpl3+)))

;;; fortune-mod-zh --- chinese poems for fortune-mod
(define-public fortune-mod-zh
  (package
    (name "fortune-mod-zh")
    (version "2.98")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fortune-mod-zh.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "chinese poems for fortune-mod")
    (description "Chinese poems for fortune-mod.")
    (home-page "https://salsa.debian.org/chinese-team/fortunes-zh")
    (license license:gpl3+)))

;;; evernote-beta-bin --- official Evernote client for Linux beta, early-access
(define-public evernote-beta-bin
  (package
    (name "evernote-beta-bin")
    (version "10.56.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/evernote-beta-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "official Evernote client for Linux beta, early-access")
    (description "Official Evernote client for Linux beta, early-access.")
    (home-page "https://evernote.com/earlyaccess")
    (license license:nonfree)))

;;; dosbox-svn --- an emulator with builtin DOS for running DOS Games
(define-public dosbox-svn
  (package
    (name "dosbox-svn")
    (version "r4494")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dosbox-svn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an emulator with builtin DOS for running DOS Games")
    (description "An emulator with builtin DOS for running DOS Games.")
    (home-page "http://dosbox.sourceforge.net/")
    (license license:gpl2+)))

;;; vmware-vcli --- VMware vSphere Command-Line Interface vCLI; run commands against vSphere an...
(define-public vmware-vcli
  (package
    (name "vmware-vcli")
    (version "6.7.0.8156551")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vmware-vcli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "VMware vSphere Command-Line Interface vCLI; run commands against vSphere an...")
    (description "VMware vSphere Command-Line Interface vCLI; run commands against vSphere and ESX/ESXi.")
    (home-page "https://code.vmware.com/web/tool/6.7/vsphere-cli")
    (license license:nonfree)))

;;; python2-stomper --- A transport neutral client implementation of the STOMP protocol
(define-public python2-stomper
  (package
    (name "python2-stomper")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-stomper.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A transport neutral client implementation of the STOMP protocol")
    (description "A transport neutral client implementation of the STOMP protocol.")
    (home-page "https://github.com/oisinmulvihill/stomper")
    (license license:asl2.0)))

;;; otf-im-fell-types --- A set of free modern revival fonts digitalized by Igino Marini
(define-public otf-im-fell-types
  (package
    (name "otf-im-fell-types")
    (version "20121117")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-im-fell-types.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A set of free modern revival fonts digitalized by Igino Marini")
    (description "A set of free modern revival fonts digitalized by Igino Marini.")
    (home-page "https://iginomarini.com/fell/")
    (license license:silofl1.1)))

;;; pzl-sokoban --- the warehouse keeper must push boxes to designated positions
(define-public pzl-sokoban
  (package
    (name "pzl_sokoban")
    (version "35.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pzl_sokoban.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the warehouse keeper must push boxes to designated positions")
    (description "The warehouse keeper must push boxes to designated positions.")
    (home-page "http://pzl.org.uk/sokoban.html")
    (license license:gpl3+)))

;;; matcha-gtk-theme-git --- A flat design theme for GTK3, GTK2, and Gnome-Shell
(define-public matcha-gtk-theme-git
  (package
    (name "matcha-gtk-theme-git")
    (version "2021.05.20.r0.gd622941")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/matcha-gtk-theme-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A flat design theme for GTK3, GTK2, and Gnome-Shell")
    (description "A flat design theme for GTK3, GTK2, and Gnome-Shell.")
    (home-page "https://vinceliuice.github.io/theme-matcha")
    (license license:gpl3+)))

;;; hdrmerge --- HDRMerge fuses two or more raw images into a single raw with an extended dyna...
(define-public hdrmerge
  (package
    (name "hdrmerge")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hdrmerge.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "HDRMerge fuses two or more raw images into a single raw with an extended dyna...")
    (description "HDRMerge fuses two or more raw images into a single raw with an extended dynamic range.")
    (home-page "http://jcelaya.github.io/hdrmerge/")
    (license license:gpl3+)))

;;; python-pyscaffold --- python project template generator with batteries included
(define-public python-pyscaffold
  (package
    (name "python-pyscaffold")
    (version "4.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pyscaffold.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "python project template generator with batteries included")
    (description "Python project template generator with batteries included.")
    (home-page "https://github.com/pyscaffold/pyscaffold")
    (license license:expat)))

;;; freemind-bin --- A mind mapper, and a hierarchical editor with strong emphasis on folding
(define-public freemind-bin
  (package
    (name "freemind-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freemind-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A mind mapper, and a hierarchical editor with strong emphasis on folding")
    (description "A mind mapper, and a hierarchical editor with strong emphasis on folding.")
    (home-page "https://freemind.sourceforge.io/wiki/")
    (license license:gpl2+)))

;;; ultrastardx-utility --- manage UltraStar Deluxe songs
(define-public ultrastardx-utility
  (package
    (name "ultrastardx-utility")
    (version "0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ultrastardx-utility.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "manage UltraStar Deluxe songs")
    (description "Manage UltraStar Deluxe songs.")
    (home-page "https://github.com/daniel-j/usdx-linux-utility")
    (license license:gpl3+)))

;;; deepin-mail-bin --- deepin mail
(define-public deepin-mail-bin
  (package
    (name "deepin-mail-bin")
    (version "6.4.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/deepin-mail-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "deepin mail")
    (description "deepin-mail-bin --- Deepin mail.")
    (home-page "https://www.deepin.com/")
    (license license:gpl3+)))

;;; olympus-bin --- A mod manager for Celeste
(define-public olympus-bin
  (package
    (name "olympus-bin")
    (version "5355")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/olympus-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A mod manager for Celeste")
    (description "A mod manager for Celeste.")
    (home-page "https://github.com/EverestAPI/Olympus")
    (license license:expat)))

;;; inteltool --- provides information about Intel CPU/chipset hardware configuration
(define-public inteltool
  (package
    (name "inteltool")
    (version "26.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/inteltool.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "provides information about Intel CPU/chipset hardware configuration")
    (description "Provides information about Intel CPU/chipset hardware configuration.")
    (home-page "https://www.coreboot.org")
    (license license:gpl2)))

;;; zenmonitor --- zen monitor is monitoring software for AMD Zen-based CPUs
(define-public zenmonitor
  (package
    (name "zenmonitor")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zenmonitor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "zen monitor is monitoring software for AMD Zen-based CPUs")
    (description "Zen monitor is monitoring software for AMD Zen-based CPUs.")
    (home-page "https://github.com/ocerman/zenmonitor")
    (license license:expat)))

;;; ruby-colorls --- A Ruby CLI gem that beautifies the terminal's ls command, with color and font...
(define-public ruby-colorls
  (package
    (name "ruby-colorls")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ruby-colorls.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Ruby CLI gem that beautifies the terminal's ls command, with color and font...")
    (description "A Ruby CLI gem that beautifies the terminal's ls command, with color and font-awesome icons.")
    (home-page "https://github.com/athityakumar/colorls")
    (license license:expat)))

;;; macos11-gtk-theme --- macOS11 GTK Theme
(define-public macos11-gtk-theme
  (package
    (name "macos11-gtk-theme")
    (version "2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/macos11-gtk-theme.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "macOS11 GTK Theme")
    (description "macos11-gtk-theme --- macOS11 GTK Theme.")
    (home-page "https://www.opendesktop.org/p/1220826/")
    (license license:gpl3+)))

;;; tamzen-font --- bitmapped programming font, based on Tamsyn powerline, bitmap, ttf, vconsole...
(define-public tamzen-font
  (package
    (name "tamzen-font")
    (version "1.11.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tamzen-font.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "bitmapped programming font, based on Tamsyn powerline, bitmap, ttf, vconsole...")
    (description "Bitmapped programming font, based on Tamsyn powerline, bitmap, ttf, vconsole font.")
    (home-page "https://github.com/sunaku/tamzen-font")
    (license license:nonfree)))

;;; ttf-chunk --- an ultra-bold, ultra-awesome slab serif typeface
(define-public ttf-chunk
  (package
    (name "ttf-chunk")
    (version "20180627")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-chunk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an ultra-bold, ultra-awesome slab serif typeface")
    (description "An ultra-bold, ultra-awesome slab serif typeface.")
    (home-page "http://theleagueofmoveabletype.com/chunk")
    (license license:silofl1.1)))

;;; xmlcutty-bin --- xmlcutty is a simple tool for carving out elements from large XML files, fast...
(define-public xmlcutty-bin
  (package
    (name "xmlcutty-bin")
    (version "0.1.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xmlcutty-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "xmlcutty is a simple tool for carving out elements from large XML files, fast...")
    (description "xmlcutty is a simple tool for carving out elements from large XML files, fast - binary static.")
    (home-page "https://github.com/miku/xmlcutty")
    (license license:gpl3+)))

;;; dain-ncnn-vulkan-bin --- DAIN, Depth-Aware Video Frame Interpolation implemented with ncnn library
(define-public dain-ncnn-vulkan-bin
  (package
    (name "dain-ncnn-vulkan-bin")
    (version "20220728")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dain-ncnn-vulkan-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "DAIN, Depth-Aware Video Frame Interpolation implemented with ncnn library")
    (description "DAIN, Depth-Aware Video Frame Interpolation implemented with ncnn library.")
    (home-page "https://github.com/nihui/dain-ncnn-vulkan")
    (license license:expat)))

;;; dnf-plugins-extras --- extras DNF Plugins
(define-public dnf-plugins-extras
  (package
    (name "dnf-plugins-extras")
    (version "4.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dnf-plugins-extras.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "extras DNF Plugins")
    (description "dnf-plugins-extras --- Extras DNF Plugins.")
    (home-page "https://github.com/rpm-software-management/dnf-plugins-extras")
    (license license:gpl2+)))

;;; nzb-bin --- A beautiful CLI front-end for Nozbe written in Rust
(define-public nzb-bin
  (package
    (name "nzb-bin")
    (version "0.5.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nzb-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A beautiful CLI front-end for Nozbe written in Rust")
    (description "A beautiful CLI front-end for Nozbe written in Rust.")
    (home-page "https://gitlab.com/reisub0/nzb")
    (license license:expat)))

;;; plymouth-theme-arch-logo-new --- replace the logo from package plymouth-theme-arch-logo
(define-public plymouth-theme-arch-logo-new
  (package
    (name "plymouth-theme-arch-logo-new")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plymouth-theme-arch-logo-new.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "replace the logo from package plymouth-theme-arch-logo")
    (description "Replace the logo from package plymouth-theme-arch-logo.")
    (home-page "https://gitlab.com/menelkir/plymouth-arch-logo-new")
    (license license:gpl3+)))

;;; plymouth-theme-dragon-git --- the plymouth theme collection by adi1090x
(define-public plymouth-theme-dragon-git
  (package
    (name "plymouth-theme-dragon-git")
    (version "r28.32a0d92")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plymouth-theme-dragon-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the plymouth theme collection by adi1090x")
    (description "The plymouth theme collection by adi1090x.")
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (license license:gpl3+)))

;;; plymouth-theme-hexagon-red-git --- the plymouth theme collection by adi1090x
(define-public plymouth-theme-hexagon-red-git
  (package
    (name "plymouth-theme-hexagon-red-git")
    (version "r28.32a0d92")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plymouth-theme-hexagon-red-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the plymouth theme collection by adi1090x")
    (description "The plymouth theme collection by adi1090x.")
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (license license:gpl3+)))

;;; ries --- find algebraic equations, given their solution
(define-public ries
  (package
    (name "ries")
    (version "20240422")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ries.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "find algebraic equations, given their solution")
    (description "Find algebraic equations, given their solution.")
    (home-page "http://mrob.com/pub/ries/")
    (license license:gpl3+)))

;;; warfork --- free online multiplayer competitive FPS based on the Qfusion engine
(define-public warfork
  (package
    (name "warfork")
    (version "21.03.04")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/warfork.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "free online multiplayer competitive FPS based on the Qfusion engine")
    (description "Free online multiplayer competitive FPS based on the Qfusion engine.")
    (home-page "https://www.warfork.com/")
    (license license:gpl2+)))

;;; xfce-theme-blackbird-git --- dark Desktop Suite for Xfce. Git version
(define-public xfce-theme-blackbird-git
  (package
    (name "xfce-theme-blackbird-git")
    (version "v0.4.r33.gab4a30e")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xfce-theme-blackbird-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "dark Desktop Suite for Xfce. Git version")
    (description "Dark Desktop Suite for Xfce.  Git version.")
    (home-page "https://github.com/shimmerproject/Blackbird")
    (license license:cc-by-sa3.0)))

;;; qtesseract5 --- convert the SUB/IDX subtiltes to SRT file
(define-public qtesseract5
  (package
    (name "qtesseract5")
    (version "2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qtesseract5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "convert the SUB/IDX subtiltes to SRT file")
    (description "Convert the SUB/IDX subtiltes to SRT file.")
    (home-page "https://forum.ubuntu-fr.org/viewtopic.php?pid=21507283")
    (license license:gpl3+)))

;;; matlab-r2021a-meta-all --- A high-level language for numerical computation and visualization R2021a, me...
(define-public matlab-r2021a-meta-all
  (package
    (name "matlab-r2021a-meta-all")
    (version "R2026a")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/matlab-r2021a-meta-all.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A high-level language for numerical computation and visualization R2021a, me...")
    (description "A high-level language for numerical computation and visualization R2021a, meta, all.")
    (home-page "https://github.com/mathworks-ref-arch/container-images/tree/main/matlab-deps")
    (license license:bsd-0)))

;;; python-django-multiselectfield --- A Multiple Choice model field
(define-public python-django-multiselectfield
  (package
    (name "python-django-multiselectfield")
    (version "0.1.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-django-multiselectfield.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Multiple Choice model field")
    (description "A Multiple Choice model field.")
    (home-page "https://github.com/goinnn/django-multiselectfield")
    (license license:lgpl3)))

;;; tela-circle-icon-theme-blue-git --- A flat, colorful design icon theme blue variant
(define-public tela-circle-icon-theme-blue-git
  (package
    (name "tela-circle-icon-theme-blue-git")
    (version "2025.02.10.r107.gbdb616e4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tela-circle-icon-theme-blue-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A flat, colorful design icon theme blue variant")
    (description "A flat, colorful design icon theme blue variant.")
    (home-page "https://github.com/vinceliuice/Tela-circle-icon-theme")
    (license license:gpl3+)))

;;; aliyunpan-gaozhangmin-bin --- 阿里云盘小白羊版，gaozhangmin's fork
(define-public aliyunpan-gaozhangmin-bin
  (package
    (name "aliyunpan-gaozhangmin-bin")
    (version "3.13.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aliyunpan-gaozhangmin-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "阿里云盘小白羊版，gaozhangmin's fork")
    (description "阿里云盘小白羊版，gaozhangmin's fork.")
    (home-page "https://github.com/gaozhangmin/aliyunpan")
    (license license:expat)))

;;; btdex --- decentralized cryptocurrency exchange system running on the Burstcoin blockchain
(define-public btdex
  (package
    (name "btdex")
    (version "0.6.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/btdex.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "decentralized cryptocurrency exchange system running on the Burstcoin blockchain")
    (description "Decentralized cryptocurrency exchange system running on the Burstcoin blockchain.")
    (home-page "https://btdex.trade")
    (license license:gpl3+)))

;;; ruby-fog-core --- shared classes and tests for fog providers and services
(define-public ruby-fog-core
  (package
    (name "ruby-fog-core")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ruby-fog-core.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "shared classes and tests for fog providers and services")
    (description "Shared classes and tests for fog providers and services.")
    (home-page "https://github.com/fog/fog-core")
    (license license:expat)))

;;; ttf-comic-shanns-v2 --- version 2 of a classy font
(define-public ttf-comic-shanns-v2
  (package
    (name "ttf-comic-shanns-v2")
    (version "r16.b98eee0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-comic-shanns-v2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "version 2 of a classy font")
    (description "version 2 of a classy font.")
    (home-page "https://github.com/shannpersand/comic-shanns")
    (license license:expat)))

;;; cuda-11-7 --- NVIDIA's GPU programming toolkit
(define-public cuda-11-7
  (package
    (name "cuda-11.7")
    (version "11.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cuda-11.7.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "NVIDIA's GPU programming toolkit")
    (description "NVIDIA's GPU programming toolkit.")
    (home-page "https://developer.nvidia.com/cuda-zone")
    (license license:nonfree)))

;;; deepspeech-bin --- A TensorFlow implementation of Baidu's DeepSpeech architecture - C++ native c...
(define-public deepspeech-bin
  (package
    (name "deepspeech-bin")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/deepspeech-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A TensorFlow implementation of Baidu's DeepSpeech architecture - C++ native c...")
    (description "A TensorFlow implementation of Baidu's DeepSpeech architecture - C++ native client + devel files.")
    (home-page "https://github.com/mozilla/DeepSpeech")
    (license license:mpl2.0)))

;;; foundry-bin --- blazing fast, portable and modular Ethereum development toolkit written in Rust
(define-public foundry-bin
  (package
    (name "foundry-bin")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/foundry-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "blazing fast, portable and modular Ethereum development toolkit written in Rust")
    (description "Blazing fast, portable and modular Ethereum development toolkit written in Rust.")
    (home-page "https://github.com/foundry-rs/foundry")
    (license license:asl2.0)))

;;; mosdns-bin --- 一个 DNS 转发器
(define-public mosdns-bin
  (package
    (name "mosdns-bin")
    (version "5.3.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mosdns-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "一个 DNS 转发器")
    (description "mosdns-bin --- 一个 DNS 转发器.")
    (home-page "https://github.com/IrineSistiana/mosdns/")
    (license license:gpl3+)))

;;; ttf-foundertype-sc-fonts --- founderType Free Fonts.方正免费字体.方正书宋,方正仿宋,方正楷体,方正黑体
(define-public ttf-foundertype-sc-fonts
  (package
    (name "ttf-foundertype-sc-fonts")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-foundertype-sc-fonts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "founderType Free Fonts.方正免费字体.方正书宋,方正仿宋,方正楷体,方正黑体")
    (description "FounderType Free Fonts.方正免费字体.方正书宋,方正仿宋,方正楷体,方正黑体.")
    (home-page "https://github.com/wordshub/free-font")
    (license license:nonfree)))

;;; xerox-docuprint-cp405 --- drivers for Fuji Xerox DocuPrint CP405 Printer Optimized for faster printing
(define-public xerox-docuprint-cp405
  (package
    (name "xerox-docuprint-cp405")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xerox-docuprint-cp405.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "drivers for Fuji Xerox DocuPrint CP405 Printer Optimized for faster printing")
    (description "Drivers for Fuji Xerox DocuPrint CP405 Printer Optimized for faster printing.")
    (home-page "http://www.fujixerox.com/eng/")
    (license license:nonfree)))

;;; obs-cli-leafac-bin --- remote control OBS from the command line by leafac, not by muesli
(define-public obs-cli-leafac-bin
  (package
    (name "obs-cli-leafac-bin")
    (version "2.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/obs-cli-leafac-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "remote control OBS from the command line by leafac, not by muesli")
    (description "Remote control OBS from the command line by leafac, not by muesli.")
    (home-page "https://github.com/leafac/obs-cli")
    (license license:expat)))

;;; siod --- scheme in one day or scheme in one defun
(define-public siod
  (package
    (name "siod")
    (version "3.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/siod.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "scheme in one day or scheme in one defun")
    (description "Scheme in one day or scheme in one defun.")
    (home-page "http://people.delphiforums.com/gjc/siod.html")
    (license license:lgpl3+)))

;;; gitmun-bin --- A cross-platform Git GUI built with Tauri
(define-public gitmun-bin
  (package
    (name "gitmun-bin")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gitmun-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A cross-platform Git GUI built with Tauri")
    (description "A cross-platform Git GUI built with Tauri.")
    (home-page "https://github.com/cst8t/gitmun")
    (license license:gpl3)))

;;; nano-ffmpeg-bin --- wraps the full power of FFmpeg in a beautiful, keyboard-driven terminal dashb...
(define-public nano-ffmpeg-bin
  (package
    (name "nano-ffmpeg-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nano-ffmpeg-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "wraps the full power of FFmpeg in a beautiful, keyboard-driven terminal dashb...")
    (description "Wraps the full power of FFmpeg in a beautiful, keyboard-driven terminal dashboard.")
    (home-page "https://github.com/dgr8akki/nano-ffmpeg")
    (license license:expat)))

;;; otf-nanumbarungothic-yethangul --- naver NanumBarunGothic YetHangul OpenType font
(define-public otf-nanumbarungothic-yethangul
  (package
    (name "otf-nanumbarungothic-yethangul")
    (version "20241017")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-nanumbarungothic-yethangul.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "naver NanumBarunGothic YetHangul OpenType font")
    (description "Naver NanumBarunGothic YetHangul OpenType font.")
    (home-page "https://hangeul.naver.com/font")
    (license license:nonfree)))

;;; otf-nanumbrush --- naver NanumBrush OpenType font
(define-public otf-nanumbrush
  (package
    (name "otf-nanumbrush")
    (version "20241017")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-nanumbrush.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "naver NanumBrush OpenType font")
    (description "Naver NanumBrush OpenType font.")
    (home-page "https://hangeul.naver.com/font")
    (license license:nonfree)))

;;; kwybars-bin --- desktop audio visualizer for Wayland that renders real-time audio bars on screen
(define-public kwybars-bin
  (package
    (name "kwybars-bin")
    (version "0.1.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kwybars-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop audio visualizer for Wayland that renders real-time audio bars on screen")
    (description "Desktop audio visualizer for Wayland that renders real-time audio bars on screen.")
    (home-page "https://github.com/naurissteins/Kwybars")
    (license license:expat)))

;;; lcl-gui-bin --- linux command reference and cheat sheets - desktop application
(define-public lcl-gui-bin
  (package
    (name "lcl-gui-bin")
    (version "3.7.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lcl-gui-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "linux command reference and cheat sheets - desktop application")
    (description "Linux command reference and cheat sheets - desktop application.")
    (home-page "https://github.com/SimonSchubert/LinuxCommandLibrary")
    (license license:asl2.0)))

;;; goku-bin --- HTTP load testing application
(define-public goku-bin
  (package
    (name "goku-bin")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/goku-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "HTTP load testing application")
    (description "HTTP load testing application.")
    (home-page "https://github.com/jcaromiq/goku")
    (license license:expat)))

;;; ttf-cinecaption --- A cinematic Japanese font
(define-public ttf-cinecaption
  (package
    (name "ttf-cinecaption")
    (version "2.27")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-cinecaption.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A cinematic Japanese font")
    (description "A cinematic Japanese font.")
    (home-page "https://cute-freefont.flop.jp/sinecaption.html")
    (license license:nonfree)))

;;; zf-bin --- A commandline fuzzy finder designed for filtering filepaths
(define-public zf-bin
  (package
    (name "zf-bin")
    (version "0.10.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zf-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A commandline fuzzy finder designed for filtering filepaths")
    (description "A commandline fuzzy finder designed for filtering filepaths.")
    (home-page "https://github.com/natecraddock/zf")
    (license license:expat)))

;;; poi-nightly-bin --- scalable KanColle browser and tool
(define-public poi-nightly-bin
  (package
    (name "poi-nightly-bin")
    (version "11.0.0.beta.6.8508")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/poi-nightly-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "scalable KanColle browser and tool")
    (description "Scalable KanColle browser and tool.")
    (home-page "https://github.com/poooi/poi/")
    (license license:expat)))

;;; aliae-bin --- cross shell and platform alias management
(define-public aliae-bin
  (package
    (name "aliae-bin")
    (version "0.26.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aliae-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross shell and platform alias management")
    (description "Cross shell and platform alias management.")
    (home-page "https://aliae.dev")
    (license license:expat)))

;;; material-gtk-theme-deepocean-git --- material gtk themes
(define-public material-gtk-theme-deepocean-git
  (package
    (name "material-gtk-theme-deepocean-git")
    (version "r38.4d828d5d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/material-gtk-theme-deepocean-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "material gtk themes")
    (description "Material gtk themes.")
    (home-page "https://github.com/Fausto-Korpsvart/Material-GTK-Themes")
    (license license:gpl3+)))

;;; ablavema-bin --- A Blender launcher and version manager
(define-public ablavema-bin
  (package
    (name "ablavema-bin")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ablavema-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Blender launcher and version manager")
    (description "A Blender launcher and version manager.")
    (home-page "https://github.com/AlexChaplinBraz/Ablavema")
    (license license:expat)))

;;; atomblocks --- async, absolutely lightweight and dead simple bar for dwm and similar window ...
(define-public atomblocks
  (package
    (name "atomblocks")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/atomblocks.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "async, absolutely lightweight and dead simple bar for dwm and similar window ...")
    (description "async, absolutely lightweight and dead simple bar for dwm and similar window managers.")
    (home-page "https://github.com/milchinskiy/atomblocks")
    (license license:expat)))

;;; python2-netifaces --- portable module to access network interface information in Python
(define-public python2-netifaces
  (package
    (name "python2-netifaces")
    (version "0.10.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-netifaces.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "portable module to access network interface information in Python")
    (description "Portable module to access network interface information in Python.")
    (home-page "https://alastairs-place.net/netifaces/")
    (license license:expat)))

;;; modrinth-app-beta-bin --- A unique, open-source launcher that allows you to play your favorite mods, an...
(define-public modrinth-app-beta-bin
  (package
    (name "modrinth-app-beta-bin")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/modrinth-app-beta-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A unique, open-source launcher that allows you to play your favorite mods, an...")
    (description "A unique, open-source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.")
    (home-page "https://modrinth.com/app")
    (license license:gpl3+)))

;;; bicep-bin --- A declarative language for describing and deploying Azure resourcesPrebuilt ...
(define-public bicep-bin
  (package
    (name "bicep-bin")
    (version "0.42.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bicep-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A declarative language for describing and deploying Azure resourcesPrebuilt ...")
    (description "A declarative language for describing and deploying Azure resourcesPrebuilt version.")
    (home-page "https://github.com/Azure/bicep")
    (license license:expat)))

;;; cairo-msg --- A small splash program for UNIX like OS
(define-public cairo-msg
  (package
    (name "cairo-msg")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cairo-msg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A small splash program for UNIX like OS")
    (description "A small splash program for UNIX like OS.")
    (home-page "https://github.com/01micko/cairo-msg")
    (license license:gpl2+)))

;;; codicefiscale --- the tax code in Italy is an alphanumeric code with a fixed length of 16 chara...
(define-public codicefiscale
  (package
    (name "codicefiscale")
    (version "4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/codicefiscale.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the tax code in Italy is an alphanumeric code with a fixed length of 16 chara...")
    (description "The tax code in Italy is an alphanumeric code with a fixed length of 16 characters, inspired by the use of library, which is used to uniquely identify the tax and administrative citizens.")
    (home-page "http://www.codelinsoft.it/sito/2013-11-17-17-56-34/codice-fiscale.html")
    (license license:lgpl3+)))

;;; cycdm-bin --- 次元城动漫桌面端
(define-public cycdm-bin
  (package
    (name "cycdm-bin")
    (version "1.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cycdm-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "次元城动漫桌面端")
    (description "cycdm-bin --- 次元城动漫桌面端.")
    (home-page "https://github.com/CycityTeam/cyc-desktop")
    (license license:nonfree)))

;;; euroscope-bin --- A radar scope for VATSIM
(define-public euroscope-bin
  (package
    (name "euroscope-bin")
    (version "3.2.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/euroscope-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A radar scope for VATSIM")
    (description "A radar scope for VATSIM.")
    (home-page "https://euroscope.hu/")
    (license license:nonfree)))

;;; helius-bin --- local-first personal finance tracker for with a Rust CLI/TUI, SQLite ledger, ...
(define-public helius-bin
  (package
    (name "helius-bin")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/helius-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "local-first personal finance tracker for with a Rust CLI/TUI, SQLite ledger, ...")
    (description "Local-first personal finance tracker for with a Rust CLI/TUI, SQLite ledger, budgets, recurring bills, reconciliation, and cashflow forecasting.")
    (home-page "https://github.com/Helius-Finance/helius-finance-tracker")
    (license license:agpl3)))

;;; emercoin-bin --- emercoin is a digital currency and blockchain service platform
(define-public emercoin-bin
  (package
    (name "emercoin-bin")
    (version "0.8.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/emercoin-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "emercoin is a digital currency and blockchain service platform")
    (description "Emercoin is a digital currency and blockchain service platform.")
    (home-page "http://emercoin.com/")
    (license license:gpl3+)))

;;; foobar2000-component-scrobble-bin --- A last.fm scrobble component for foobar2000
(define-public foobar2000-component-scrobble-bin
  (package
    (name "foobar2000-component-scrobble-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/foobar2000-component-scrobble-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A last.fm scrobble component for foobar2000")
    (description "A last.fm scrobble component for foobar2000.")
    (home-page "https://hydrogenaud.io/index.php?topic=114979.0")
    (license license:nonfree)))

;;; gawk-haru --- GAWK extension - interface to the libharu PDF library
(define-public gawk-haru
  (package
    (name "gawk-haru")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gawk-haru.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GAWK extension - interface to the libharu PDF library")
    (description "GAWK extension - interface to the libharu PDF library.")
    (home-page "https://sourceforge.net/projects/gawkextlib/")
    (license license:gpl3+)))

;;; ghc8-8-bin --- binary GHC 8.8 installed on /usr/bin/ghc-8.8
(define-public ghc8-8-bin
  (package
    (name "ghc8.8-bin")
    (version "8.8.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ghc8.8-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "binary GHC 8.8 installed on /usr/bin/ghc-8.8")
    (description "Binary GHC 8.8 installed on /usr/bin/ghc-8.8.")
    (home-page "http://www.haskell.org/ghc/")
    (license license:bsd-3)))

;;; gitty-bin --- contextual information about your git projects, right on the command-line
(define-public gitty-bin
  (package
    (name "gitty-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gitty-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "contextual information about your git projects, right on the command-line")
    (description "Contextual information about your git projects, right on the command-line.")
    (home-page "https://github.com/muesli/gitty")
    (license license:expat)))

;;; gosimac --- fetch the wallpaper from Bings, Unsplash..
(define-public gosimac
  (package
    (name "gosimac")
    (version "5.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gosimac.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fetch the wallpaper from Bings, Unsplash..")
    (description "Fetch the wallpaper from Bings, Unsplash...")
    (home-page "https://github.com/1995parham/gosimac")
    (license license:gpl2+)))

;;; habboon-client-bin --- A desktop application for the Habboon Client
(define-public habboon-client-bin
  (package
    (name "habboon-client-bin")
    (version "1.0.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/habboon-client-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A desktop application for the Habboon Client")
    (description "A desktop application for the Habboon Client.")
    (home-page "https://www.habboon.pw")
    (license license:isc)))

;;; python-whatever --- easy way to make anonymous functions by partial application of operators
(define-public python-whatever
  (package
    (name "python-whatever")
    (version "0.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-whatever.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "easy way to make anonymous functions by partial application of operators")
    (description "Easy way to make anonymous functions by partial application of operators.")
    (home-page "https://github.com/Suor/whatever")
    (license license:bsd-3)))

;;; cpass --- A terminal password manager written in Rust
(define-public cpass
  (package
    (name "cpass")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cpass.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A terminal password manager written in Rust")
    (description "A terminal password manager written in Rust.")
    (home-page "https://gitlab.com/thacoon/cpass.git")
    (license license:expat)))

;;; idos-timetable-tariff-chaps-all-latest --- tariff data for the timetable search engines by CHAPS: Czech/Slovak trains + ...
(define-public idos-timetable-tariff-chaps-all-latest
  (package
    (name "idos-timetable-tariff-chaps-all-latest")
    (version "2025_12_31")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/idos-timetable-tariff-chaps-all-latest.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tariff data for the timetable search engines by CHAPS: Czech/Slovak trains + ...")
    (description "Tariff data for the timetable search engines by CHAPS: Czech/Slovak trains + bus, Czech public transport.  Note that some data need the purchased version of IDOS to run.")
    (home-page "https://chaps.cz/eng/download/idos/zip#kotvatar")
    (license license:nonfree)))

;;; influxdb2-bin --- scalable datastore for metrics, events, and real-time analytics; Binary release;
(define-public influxdb2-bin
  (package
    (name "influxdb2-bin")
    (version "2.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/influxdb2-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "scalable datastore for metrics, events, and real-time analytics; Binary release;")
    (description "Scalable datastore for metrics, events, and real-time analytics; Binary release;.")
    (home-page "https://portal.influxdata.com/downloads/")
    (license license:expat)))

;;; kiss-gui --- crossplatform configuration tool for the Flyduino flight control system KISS
(define-public kiss-gui
  (package
    (name "kiss-gui")
    (version "2.0.34")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kiss-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "crossplatform configuration tool for the Flyduino flight control system KISS")
    (description "Crossplatform configuration tool for the Flyduino flight control system KISS.")
    (home-page "https://github.com/flyduino/kissfc-chrome-gui")
    (license license:nonfree)))

;;; lightdm-webkit2-theme-alter --- alterLinux webkit2 greeter theme
(define-public lightdm-webkit2-theme-alter
  (package
    (name "lightdm-webkit2-theme-alter")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lightdm-webkit2-theme-alter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "alterLinux webkit2 greeter theme")
    (description "AlterLinux webkit2 greeter theme.")
    (home-page "https://github.com/SereneTeam/lightdm-webkit2-theme-alter")
    (license license:expat)))

;;; lr2oraja --- the latest build of beatoraja, but compiled using LR2 judges and gauges
(define-public lr2oraja
  (package
    (name "lr2oraja")
    (version "build11611350155")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lr2oraja.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the latest build of beatoraja, but compiled using LR2 judges and gauges")
    (description "The latest build of beatoraja, but compiled using LR2 judges and gauges.")
    (home-page "https://aur.archlinux.org/packages/lr2oraja")
    (license license:gpl3+)))

;;; jaxe-bin --- jaxe parses new line delimited json and outputs a human readable representation
(define-public jaxe-bin
  (package
    (name "jaxe-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jaxe-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "jaxe parses new line delimited json and outputs a human readable representation")
    (description "jaxe parses new line delimited json and outputs a human readable representation.")
    (home-page "https://github.com/simao/jaxe")
    (license license:expat)))

;;; heidisql-qt6 --- A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite da...
(define-public heidisql-qt6
  (package
    (name "heidisql-qt6")
    (version "12.17")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/heidisql-qt6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite da...")
    (description "A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases Qt6.")
    (home-page "http://www.heidisql.com/")
    (license license:gpl2+)))

;;; md-to-html2 --- convert Markdown to HTML using Jinja2 templates
(define-public md-to-html2
  (package
    (name "md-to-html2")
    (version "0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/md-to-html2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "convert Markdown to HTML using Jinja2 templates")
    (description "Convert Markdown to HTML using Jinja2 templates.")
    (home-page "https://codeberg.org/gi1242/md-to-html")
    (license license:expat)))

;;; nancy-bin --- A tool to check for vulnerabilities in your Golang dependencies
(define-public nancy-bin
  (package
    (name "nancy-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nancy-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A tool to check for vulnerabilities in your Golang dependencies")
    (description "A tool to check for vulnerabilities in your Golang dependencies.")
    (home-page "https://github.com/sonatype-nexus-community/nancy")
    (license license:asl2.0)))

;;; nist-sts --- NIST Statistical Test Suite STS
(define-public nist-sts
  (package
    (name "nist-sts")
    (version "2.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nist-sts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "NIST Statistical Test Suite STS")
    (description "NIST Statistical Test Suite STS.")
    (home-page "https://csrc.nist.gov/projects/random-bit-generation/documentation-and-software")
    (license license:nonfree)))

;;; otf-eau-douce-sans --- san-serif font by Yamaoka Yasuhiro
(define-public otf-eau-douce-sans
  (package
    (name "otf-eau-douce-sans")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-eau-douce-sans.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "san-serif font by Yamaoka Yasuhiro")
    (description "San-serif font by Yamaoka Yasuhiro.")
    (home-page "https://yoworks.blogspot.com.au/2011/02/eau-douce-sans-2008-2011.html")
    (license license:nonfree)))
