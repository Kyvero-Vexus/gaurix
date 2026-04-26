;; -*- mode: scheme; coding: utf-8 -*-
;;; recipe-resolver-260426f: 100 packages attempted (100 recipes, 0 blocked)
;;; Generated from AUR PKGBUILDs via queue-drain pass.

(define-module (gaurix packages recipe-resolver-260426f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
   kde-cdemu-manager
   libvorbis-aotuv
   javafx-scenebuilder
   hacx-wad
   gourmand
   subedit
   open-plc-utils
   pdfcropmargins
   simple-signer
   soundkonverter
   watermarker
   magicavoxel
   musescore3
   yolk
   targetcli-fb
   python-openvino-telemetry
   minilpa
   notepad-plus-plus
   mathpix-snipping-tool
   aptakube
   rbcat
   synapse-admin
   rusync
   blocky
   betula
   factorio-experimental
   gridcoinresearchd
   gridcoinresearch-qt
   octave-control
   octave-signal
   octave-communications
   validatornu
   purr-data
   warzone2100-sequences
   librespeed-go
   tracecompass
   volta
   toolblex
   qjackcapture
   grok-jpeg2000
   goimports-reviser
   das-keyboard-q
   sirilic
   python-dspy
   python-djangorestframework-xml
   mytonwallet-appimage
   mpdris
   lddot
   egpu-switcher
   cornrow
   calendar-cli
   repetier-host
   gmsl
   disfetch
   dijo
   igvtools
   hunspell-ko
   walk
   unmakeself
   elfcat
   python-inputimeout
   python-getch
   localxpose-cli
   dupefi
   busybox-crond
   byedpi-git
   bento4
   hyphanet
   classicube
   neocmakelsp
   video2x-qt6
   perl-devel-trace
   python-uuid6
   rtcqs
   dufs
   makeself
   python-pdfplumber
   questdb
   hoffice
   rftg
   tor-unstable
   line
   vnrez
   pacsaviour
   whoogle-git
   try
   tuc
   treefetch
   ultralist
   unifetch
   unsilence
   verifpal
   vfu
   victoriametrics-bin
   wait4x
   webchanges
   wifi-password
   windowchef
   windowlab
   waon
   ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

(define license:wtfpl2
  ((@@ (guix licenses) license) "WTFPL"
    "http://www.wtfpl.net/"
    "Do What The Fuck You Want To Public License, version 2."))

;;; kde-cdemu-manager — KDE CDEmu Manager is a simple frontend for CDEmu.
(define-public kde-cdemu-manager
  (package
    (name "kde-cdemu-manager")
    (version "0.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kde-cdemu-manager.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/marcelh83/kde-cdemu-manager")
    (synopsis "kDE CDEmu Manager is a simple frontend for CDEmu")
    (description "KDE CDEmu Manager is a simple frontend for CDEmu.")
    (license license:gpl3+)))

;;; libvorbis-aotuv — aoTuV is software library for encoding and decoding of OggVo
(define-public libvorbis-aotuv
  (package
    (name "libvorbis-aotuv")
    (version "b6.03.2020")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libvorbis-aotuv.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ao-yumi.github.io/aotuv_web/")
    (synopsis "aoTuV is software library for encoding and decoding of OggVorbis that modifie...")
    (description "AoTuV is software library for encoding and decoding of OggVorbis that modified encoding part of Xiph.Org's libvorbis.")
    (license license:bsd-3)))

;;; javafx-scenebuilder — Scene Builder is an open source tool that allows for drag an
(define-public javafx-scenebuilder
  (package
    (name "javafx-scenebuilder")
    (version "26.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/javafx-scenebuilder.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gluonhq.com/products/scene-builder/")
    (synopsis "scene Builder is an open source tool that allows for drag and drop design of ...")
    (description "Scene Builder is an open source tool that allows for drag and drop design of JavaFX user interfaces.")
    (license license:bsd-3)))

;;; hacx-wad — Hacx IWAD (game data)
(define-public hacx-wad
  (package
    (name "hacx-wad")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hacx-wad.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.drnostromo.com/hacx/")
    (synopsis "hacx IWAD (game data)")
    (description "Hacx IWAD (game data).")
    (license license:nonfree)))

;;; gourmand — A manager, editor, and organizer for recipes.
(define-public gourmand
  (package
    (name "gourmand")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gourmand.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/GourmandRecipeManager/gourmand")
    (synopsis "a manager, editor, and organizer for recipes")
    (description "A manager, editor, and organizer for recipes.")
    (license license:gpl2)))

;;; subedit — Subtitle editor written in bash
(define-public subedit
  (package
    (name "subedit")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/subedit.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/helixarch/subedit")
    (synopsis "subtitle editor written in bash")
    (description "Subtitle editor written in bash.")
    (license license:gpl2+)))

;;; open-plc-utils — Qualcomm Atheros Open Powerline Toolkit for HomePlug AV
(define-public open-plc-utils
  (package
    (name "open-plc-utils")
    (version "r535.g46c35064")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/open-plc-utils.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/qca/open-plc-utils")
    (synopsis "qualcomm Atheros Open Powerline Toolkit for HomePlug AV")
    (description "Qualcomm Atheros Open Powerline Toolkit for HomePlug AV.")
    (license license:bsd-3)))

;;; pdfcropmargins — Automatically crops the margins of PDF files
(define-public pdfcropmargins
  (package
    (name "pdfcropmargins")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdfcropmargins.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://pypi.org/project/pdfCropMargins/")
    (synopsis "automatically crops the margins of PDF files")
    (description "Automatically crops the margins of PDF files.")
    (license license:nonfree)))

;;; simple-signer — Sign PDF files using a simple GUI.
(define-public simple-signer
  (package
    (name "simple-signer")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/simple-signer.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/schorschii/Simple-Signer")
    (synopsis "sign PDF files using a simple GUI")
    (description "Sign PDF files using a simple GUI.")
    (license license:gpl3)))

;;; soundkonverter — Front-end to various audio converters
(define-public soundkonverter
  (package
    (name "soundkonverter")
    (version "3.0.1.32")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/soundkonverter.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://store.kde.org/p/1126634")
    (synopsis "front-end to various audio converters")
    (description "Front-end to various audio converters.")
    (license license:nonfree)))

;;; watermarker — CLI tool for adding watermark to images
(define-public watermarker
  (package
    (name "watermarker")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/watermarker.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xomvio/watermarker")
    (synopsis "cLI tool for adding watermark to images")
    (description "CLI tool for adding watermark to images.")
    (license license:gpl3+)))

;;; magicavoxel — A free lightweight 8-bit voxel art editor and GPU based inte
(define-public magicavoxel
  (package
    (name "magicavoxel")
    (version "0.99.7.2.r20230614")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/magicavoxel.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ephtracy.github.io/")
    (synopsis "a free lightweight 8-bit voxel art editor and GPU based interactive path trac...")
    (description "A free lightweight 8-bit voxel art editor and GPU based interactive path tracing renderer.")
    (license license:nonfree)))

;;; musescore3 — Create, play and print beautiful sheet music -- Version 3; E
(define-public musescore3
  (package
    (name "musescore3")
    (version "3.6.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/musescore3.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://musescore.org/")
    (synopsis "create, play and print beautiful sheet music -- Version 3; End-of-life")
    (description "Create, play and print beautiful sheet music -- Version 3; End-of-life.")
    (license license:nonfree)))

;;; yolk — Templated dotfile management that won't get in your way
(define-public yolk
  (package
    (name "yolk")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yolk.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://elkowar.github.io/yolk/")
    (synopsis "templated dotfile management that won't get in your way")
    (description "Templated dotfile management that won't get in your way.")
    (license license:expat)))

;;; targetcli-fb — free branch of the targetcli LIO administration shell (iSCSI
(define-public targetcli-fb
  (package
    (name "targetcli-fb")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/targetcli-fb.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/open-iscsi/targetcli-fb")
    (synopsis "free branch of the targetcli LIO administration shell (iSCSI + Co)")
    (description "Free branch of the targetcli LIO administration shell (iSCSI + Co).")
    (license license:asl2.0)))

;;; python-openvino-telemetry — Pythno library for sending statistics data from the OpenVINO
(define-public python-openvino-telemetry
  (package
    (name "python-openvino-telemetry")
    (version "2025.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-openvino-telemetry.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/openvinotoolkit/telemetry/")
    (synopsis "pythno library for sending statistics data from the OpenVINO toolkit components")
    (description "Pythno library for sending statistics data from the OpenVINO toolkit components.")
    (license license:asl2.0)))

;;; minilpa — Professional LPA UI
(define-public minilpa
  (package
    (name "minilpa")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/minilpa.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/EsimMoe/MiniLPA")
    (synopsis "professional LPA UI")
    (description "Professional LPA UI.")
    (license license:agpl3+)))

;;; notepad-plus-plus — A free source code editor for Windows
(define-public notepad-plus-plus
  (package
    (name "notepad++")
    (version "8.9.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/notepad++.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://notepad-plus-plus.org/")
    (synopsis "a free source code editor for Windows")
    (description "A free source code editor for Windows.")
    (license license:gpl2+)))

;;; mathpix-snipping-tool — Mathpix Snipping Tool
(define-public mathpix-snipping-tool
  (package
    (name "mathpix-snipping-tool")
    (version "03.00.0138")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mathpix-snipping-tool.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mathpix.com/")
    (synopsis "mathpix Snipping Tool")
    (description "Mathpix Snipping Tool.")
    (license license:nonfree)))

;;; aptakube — A modern and lightweight Kubernetes desktop client to help y
(define-public aptakube
  (package
    (name "aptakube")
    (version "1.16.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aptakube.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://aptakube.com/")
    (synopsis "a modern and lightweight Kubernetes desktop client to help you operate worklo...")
    (description "A modern and lightweight Kubernetes desktop client to help you operate workloads on multiple clusters. (free to use during the public preview).")
    (license license:nonfree)))

;;; rbcat — A go clone of lolcat with built-in cat function.
(define-public rbcat
  (package
    (name "rbcat")
    (version "v1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rbcat.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/Minecodes/rbcat")
    (synopsis "a go clone of lolcat with built-in cat function")
    (description "A go clone of lolcat with built-in cat function.")
    (license license:bsd-3)))

;;; synapse-admin — A Matrix administration panel using react-admin
(define-public synapse-admin
  (package
    (name "synapse-admin")
    (version "0.11.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/synapse-admin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Awesome-Technologies/synapse-admin")
    (synopsis "a Matrix administration panel using react-admin")
    (description "A Matrix administration panel using react-admin.")
    (license license:asl2.0)))

;;; rusync — Minimalist rsync implementation in Rust
(define-public rusync
  (package
    (name "rusync")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rusync.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/your-tools/rusync/")
    (synopsis "minimalist rsync implementation in Rust")
    (description "Minimalist rsync implementation in Rust.")
    (license license:expat)))

;;; blocky — Fast and lightweight DNS proxy as ad-blocker
(define-public blocky
  (package
    (name "blocky")
    (version "0.29.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/blocky.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/0xERR0R/blocky")
    (synopsis "fast and lightweight DNS proxy as ad-blocker")
    (description "Fast and lightweight DNS proxy as ad-blocker.")
    (license license:asl2.0)))

;;; betula — Self-hosted personal link collection manager
(define-public betula
  (package
    (name "betula")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/betula.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/bouncepaw/betula")
    (synopsis "self-hosted personal link collection manager")
    (description "Self-hosted personal link collection manager.")
    (license license:gpl3)))

;;; factorio-experimental — A 2D game about building and maintaining factories (experime
(define-public factorio-experimental
  (package
    (name "factorio-experimental")
    (version "2.0.76")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/factorio-experimental.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.factorio.com/")
    (synopsis "a 2D game about building and maintaining factories (experimental branch)")
    (description "A 2D game about building and maintaining factories (experimental branch).")
    (license license:nonfree)))

;;; gridcoinresearchd — A cryptocurrency that rewards users for participating on the
(define-public gridcoinresearchd
  (package
    (name "gridcoinresearchd")
    (version "5.5.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gridcoinresearchd.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gridcoin.us")
    (synopsis "a cryptocurrency that rewards users for participating on the BOINC network (D...")
    (description "A cryptocurrency that rewards users for participating on the BOINC network (Daemon/CLI).")
    (license license:expat)))

;;; gridcoinresearch-qt — A cryptocurrency that rewards users for participating on the
(define-public gridcoinresearch-qt
  (package
    (name "gridcoinresearch-qt")
    (version "5.5.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gridcoinresearch-qt.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gridcoin.us")
    (synopsis "a cryptocurrency that rewards users for participating on the BOINC network (Q...")
    (description "A cryptocurrency that rewards users for participating on the BOINC network (Qt GUI).")
    (license license:expat)))

;;; octave-control — Computer-Aided Control System Design (CACSD) Tools for GNU O
(define-public octave-control
  (package
    (name "octave-control")
    (version "4.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/octave-control.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gnu-octave.github.io/packages/control/")
    (synopsis "computer-Aided Control System Design (CACSD) Tools for GNU Octave, based on t...")
    (description "Computer-Aided Control System Design (CACSD) Tools for GNU Octave, based on the proven SLICOT Library.")
    (license license:gpl3+)))

;;; octave-signal — Signal processing tools, including filtering, windowing and 
(define-public octave-signal
  (package
    (name "octave-signal")
    (version "1.4.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/octave-signal.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gnu-octave.github.io/packages/signal/")
    (synopsis "signal processing tools, including filtering, windowing and display functions")
    (description "Signal processing tools, including filtering, windowing and display functions.")
    (license license:gpl3+)))

;;; octave-communications — Digital Communications, Error Correcting Codes (Channel Code
(define-public octave-communications
  (package
    (name "octave-communications")
    (version "1.2.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/octave-communications.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gnu-octave.github.io/packages/communications")
    (synopsis "digital Communications, Error Correcting Codes (Channel Code), Source Code fu...")
    (description "Digital Communications, Error Correcting Codes (Channel Code), Source Code functions, Modulation and Galois Fields.")
    (license license:gpl3+)))

;;; validatornu — The Nu Html Checker, a command line tool for HTML5 markup va
(define-public validatornu
  (package
    (name "validatornu")
    (version "26.1.11")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/validatornu.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://validator.github.io/validator/")
    (synopsis "the Nu Html Checker, a command line tool for HTML5 markup validation")
    (description "The Nu Html Checker, a command line tool for HTML5 markup validation.")
    (license license:asl2.0)))

;;; purr-data — Jonathan Wilkes' nw.js variant of Pd-L2Ork (git version)
(define-public purr-data
  (package
    (name "purr-data")
    (version "2.20.0.r5324.c74c2de4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/purr-data.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://agraef.github.io/purr-data/")
    (synopsis "jonathan Wilkes' nw.js variant of Pd-L2Ork (git version)")
    (description "Jonathan Wilkes' nw.js variant of Pd-L2Ork (git version).")
    (license license:bsd-3)))

;;; warzone2100-sequences — Additional video content for Warzone 2100
(define-public warzone2100-sequences
  (package
    (name "warzone2100-sequences")
    (version "3.2.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/warzone2100-sequences.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Warzone2100/wz-sequences")
    (synopsis "additional video content for Warzone 2100")
    (description "Additional video content for Warzone 2100.")
    (license license:nonfree)))

;;; librespeed-go — Go backend for LibreSpeed
(define-public librespeed-go
  (package
    (name "librespeed-go")
    (version "1.1.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/librespeed-go.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/librespeed/speedtest-go")
    (synopsis "go backend for LibreSpeed")
    (description "Go backend for LibreSpeed.")
    (license license:lgpl3+)))

;;; tracecompass — Eclipse Trace Compass is an open source application to solve
(define-public tracecompass
  (package
    (name "tracecompass")
    (version "9.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tracecompass.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://eclipse.dev/tracecompass/")
    (synopsis "eclipse Trace Compass is an open source application to solve performance and ...")
    (description "Eclipse Trace Compass is an open source application to solve performance and reliability issues by reading and analyzing traces and logs of a system.")
    (license license:nonfree)))

;;; volta — The Hassle-Free JavaScript Tool Manager
(define-public volta
  (package
    (name "volta")
    (version "2.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/volta.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://volta.sh/")
    (synopsis "the Hassle-Free JavaScript Tool Manager")
    (description "The Hassle-Free JavaScript Tool Manager.")
    (license license:bsd-2)))

;;; toolblex — A Bluetooth Low Energy device scanner and analyzer
(define-public toolblex
  (package
    (name "toolblex")
    (version "0.16")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/toolblex.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/emericg/toolBLEx")
    (synopsis "a Bluetooth Low Energy device scanner and analyzer")
    (description "A Bluetooth Low Energy device scanner and analyzer.")
    (license license:gpl3+)))

;;; qjackcapture — A GUI for easy recording of JACK audio sources using jack_ca
(define-public qjackcapture
  (package
    (name "qjackcapture")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qjackcapture.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/SpotlightKid/qjackcapture")
    (synopsis "a GUI for easy recording of JACK audio sources using jack_capture")
    (description "A GUI for easy recording of JACK audio sources using jack_capture.")
    (license license:nonfree)))

;;; grok-jpeg2000 — A high performance open source JPEG 2000 codec.
(define-public grok-jpeg2000
  (package
    (name "grok-jpeg2000")
    (version "20.0.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grok-jpeg2000.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/GrokImageCompression/grok")
    (synopsis "a high performance open source JPEG 2000 codec")
    (description "A high performance open source JPEG 2000 codec.")
    (license license:nonfree)))

;;; goimports-reviser — Right imports sorting & code formatting tool (goimports alte
(define-public goimports-reviser
  (package
    (name "goimports-reviser")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/goimports-reviser.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/incu6us/goimports-reviser")
    (synopsis "right imports sorting & code formatting tool (goimports alternative)")
    (description "Right imports sorting & code formatting tool (goimports alternative).")
    (license license:expat)))

;;; das-keyboard-q — Software for Das Keyboard 5Q, 5Qs, 4Q
(define-public das-keyboard-q
  (package
    (name "das-keyboard-q")
    (version "4.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/das-keyboard-q.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.daskeyboard.io/get-started/software/")
    (synopsis "software for Das Keyboard 5Q, 5Qs, 4Q")
    (description "Software for Das Keyboard 5Q, 5Qs, 4Q.")
    (license license:nonfree)))

;;; sirilic — Siril's Interactive Companion
(define-public sirilic
  (package
    (name "sirilic")
    (version "1.15.12")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sirilic.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://siril.org/docs/sirilic/")
    (synopsis "siril's Interactive Companion")
    (description "Siril's Interactive Companion.")
    (license license:gpl3+)))

;;; python-dspy — The framework for programming (not prompting) language model
(define-public python-dspy
  (package
    (name "python-dspy")
    (version "3.1.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-dspy.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/stanfordnlp/dspy")
    (synopsis "the framework for programming (not prompting) language models")
    (description "The framework for programming (not prompting) language models.")
    (license license:expat)))

;;; python-djangorestframework-xml — XML support for Django REST Framework
(define-public python-djangorestframework-xml
  (package
    (name "python-djangorestframework-xml")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-djangorestframework-xml.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jpadilla/django-rest-framework-xml")
    (synopsis "xML support for Django REST Framework")
    (description "XML support for Django REST Framework.")
    (license license:bsd-3)))

;;; mytonwallet-appimage — Feature rich TON wallet
(define-public mytonwallet-appimage
  (package
    (name "mytonwallet-appimage")
    (version "4.5.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mytonwallet-appimage.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mytonwallet.io/")
    (synopsis "feature rich TON wallet")
    (description "Feature rich TON wallet.")
    (license license:nonfree)))

;;; mpdris — A MPD client implementing the dbus MPRIS standard written in
(define-public mpdris
  (package
    (name "mpdris")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mpdris.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jasger9000/mpdris")
    (synopsis "a MPD client implementing the dbus MPRIS standard written in rust")
    (description "A MPD client implementing the dbus MPRIS standard written in rust.")
    (license license:expat)))

;;; lddot — A wrapper over ldd, which produces output in Graphviz format
(define-public lddot
  (package
    (name "lddot")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lddot.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jwilk/lddot")
    (synopsis "a wrapper over ldd, which produces output in Graphviz format")
    (description "A wrapper over ldd, which produces output in Graphviz format.")
    (license license:expat)))

;;; egpu-switcher — Automatically detect and use eGPU on startup
(define-public egpu-switcher
  (package
    (name "egpu-switcher")
    (version "0.20.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/egpu-switcher.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hertg/egpu-switcher")
    (synopsis "automatically detect and use eGPU on startup")
    (description "Automatically detect and use eGPU on startup.")
    (license license:nonfree)))

;;; cornrow — Bluetooth and Airplay Audio Daemon for SBCs (Raspberry Pi, e
(define-public cornrow
  (package
    (name "cornrow")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cornrow.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mincequi/cornrow")
    (synopsis "bluetooth and Airplay Audio Daemon for SBCs (Raspberry Pi, etc)")
    (description "Bluetooth and Airplay Audio Daemon for SBCs (Raspberry Pi, etc).")
    (license license:gpl2)))

;;; calendar-cli — calendar-cli is a caldav client for calendar and task manage
(define-public calendar-cli
  (package
    (name "calendar-cli")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/calendar-cli.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tobixen/calendar-cli")
    (synopsis "calendar-cli is a caldav client for calendar and task management")
    (description "Calendar-cli is a caldav client for calendar and task management.")
    (license license:nonfree)))

;;; repetier-host — almost complete 3d-printing workflow
(define-public repetier-host
  (package
    (name "repetier-host")
    (version "2.3.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/repetier-host.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.repetier.com/")
    (synopsis "almost complete 3d-printing workflow")
    (description "Almost complete 3d-printing workflow.")
    (license license:nonfree)))

;;; gmsl — GNU Make Standard Library: extra functions to extend functio
(define-public gmsl
  (package
    (name "gmsl")
    (version "1.2.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gmsl.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gmsl.jgc.org/")
    (synopsis "gNU Make Standard Library: extra functions to extend functionality of Makefiles")
    (description "GNU Make Standard Library: extra functions to extend functionality of Makefiles.")
    (license license:bsd-3)))

;;; disfetch — Yet another *nix distro fetching program, but less complex.
(define-public disfetch
  (package
    (name "disfetch")
    (version "3.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/disfetch.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/llathasa-veleth/disfetch")
    (synopsis "yet another *nix distro fetching program, but less complex")
    (description "Yet another *nix distro fetching program, but less complex.")
    (license license:expat)))

;;; dijo — Scriptable, curses-based, digital habit tracker
(define-public dijo
  (package
    (name "dijo")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dijo.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/NerdyPepper/dijo")
    (synopsis "scriptable, curses-based, digital habit tracker")
    (description "Scriptable, curses-based, digital habit tracker.")
    (license license:expat)))

;;; igvtools — IGV utilities for preprocessing bioinformatics data files
(define-public igvtools
  (package
    (name "igvtools")
    (version "2.19.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/igvtools.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://software.broadinstitute.org/software/igv")
    (synopsis "iGV utilities for preprocessing bioinformatics data files")
    (description "IGV utilities for preprocessing bioinformatics data files.")
    (license license:expat)))

;;; hunspell-ko — Korean hunspell dictionary
(define-public hunspell-ko
  (package
    (name "hunspell-ko")
    (version "0.7.94")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hunspell-ko.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/spellcheck-ko/hunspell-dict-ko")
    (synopsis "korean hunspell dictionary")
    (description "Korean hunspell dictionary.")
    (license license:nonfree)))

;;; walk — Terminal file manager
(define-public walk
  (package
    (name "walk")
    (version "1.13.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/walk.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/antonmedv/walk")
    (synopsis "terminal file manager")
    (description "Terminal file manager.")
    (license license:expat)))

;;; unmakeself — Makeself archive extractor
(define-public unmakeself
  (package
    (name "unmakeself")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unmakeself.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.freshports.org/archivers/unmakeself")
    (synopsis "makeself archive extractor")
    (description "Makeself archive extractor.")
    (license license:bsd-3)))

;;; elfcat — Generates HTML files from ELF binaries
(define-public elfcat
  (package
    (name "elfcat")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/elfcat.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ruslashev/elfcat")
    (synopsis "generates HTML files from ELF binaries")
    (description "Generates HTML files from ELF binaries.")
    (license license:zlib)))

;;; python-inputimeout — A Python package for multi platform standard input with time
(define-public python-inputimeout
  (package
    (name "python-inputimeout")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-inputimeout.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/johejo/inputimeout")
    (synopsis "a Python package for multi platform standard input with timeout")
    (description "A Python package for multi platform standard input with timeout.")
    (license license:expat)))

;;; python-getch — Does single char input, like C getch/getche
(define-public python-getch
  (package
    (name "python-getch")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-getch.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://pypi.org/project/getch/")
    (synopsis "does single char input, like C getch/getche")
    (description "Does single char input, like C getch/getche.")
    (license license:nonfree)))

;;; localxpose-cli — A reverse proxy that enables you to expose your localhost to
(define-public localxpose-cli
  (package
    (name "localxpose-cli")
    (version "latest")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/localxpose-cli.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://localxpose.io")
    (synopsis "a reverse proxy that enables you to expose your localhost to the internet (CLI)")
    (description "A reverse proxy that enables you to expose your localhost to the internet (CLI).")
    (license license:nonfree)))

;;; dupefi — A command-line duplicate file finder for linux.
(define-public dupefi
  (package
    (name "dupefi")
    (version "1.01")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dupefi.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hirak99/dupefi")
    (synopsis "a command-line duplicate file finder for linux")
    (description "A command-line duplicate file finder for linux.")
    (license license:asl2.0)))

;;; busybox-crond — Busybox crond implementation
(define-public busybox-crond
  (package
    (name "busybox-crond")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/busybox-crond.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.busybox.net")
    (synopsis "busybox crond implementation")
    (description "Busybox crond implementation.")
    (license license:nonfree)))

;;; byedpi-git — A simple and fast software designed to bypass Deep Packet In
(define-public byedpi-git
  (package
    (name "byedpi-git")
    (version "latest")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/byedpi-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hufrea/byedpi")
    (synopsis "a simple and fast software designed to bypass Deep Packet Inspection")
    (description "A simple and fast software designed to bypass Deep Packet Inspection.")
    (license license:expat)))

;;; bento4 — C++ class library and tools designed to read and write ISO-M
(define-public bento4
  (package
    (name "bento4")
    (version "1.6.0.641")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bento4.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.bento4.com/")
    (synopsis "c++ class library and tools designed to read and write ISO-MP4 files")
    (description "C++ class library and tools designed to read and write ISO-MP4 files.")
    (license license:nonfree)))

;;; hyphanet — A peer-to-peer network for censorship-resistant and privacy-
(define-public hyphanet
  (package
    (name "hyphanet")
    (version "0.7.5.1506")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hyphanet.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.hyphanet.org/")
    (synopsis "a peer-to-peer network for censorship-resistant and privacy-respecting publis...")
    (description "A peer-to-peer network for censorship-resistant and privacy-respecting publishing and communication, a.k.a The Original Freenet since 1999. This is NOT Locutus.")
    (license license:gpl2+)))

;;; classicube — A custom Minecraft Classic compatible client written in C fr
(define-public classicube
  (package
    (name "classicube")
    (version "1.3.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/classicube.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.classicube.net/")
    (synopsis "a custom Minecraft Classic compatible client written in C from scratch")
    (description "A custom Minecraft Classic compatible client written in C from scratch.")
    (license license:bsd-3)))

;;; neocmakelsp — CMake LSP implementation based on Tower and Tree-sitter
(define-public neocmakelsp
  (package
    (name "neocmakelsp")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/neocmakelsp.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/neocmakelsp/neocmakelsp")
    (synopsis "cMake LSP implementation based on Tower and Tree-sitter")
    (description "CMake LSP implementation based on Tower and Tree-sitter.")
    (license license:expat)))

;;; video2x-qt6 — The Qt6 GUI for Video2X
(define-public video2x-qt6
  (package
    (name "video2x-qt6")
    (version "6.4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/video2x-qt6.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/k4yt3x/video2x-qt6")
    (synopsis "the Qt6 GUI for Video2X")
    (description "The Qt6 GUI for Video2X.")
    (license license:isc)))

;;; perl-devel-trace — Print out each line before it is executed (like sh -x)
(define-public perl-devel-trace
  (package
    (name "perl-devel-trace")
    (version "0.12")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-devel-trace.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://search.cpan.org/dist/Devel-Trace/Trace.pm")
    (synopsis "print out each line before it is executed (like sh -x)")
    (description "Print out each line before it is executed (like sh -x).")
    (license license:nonfree)))

;;; python-uuid6 — New time-based UUID formats which are suited for use as a da
(define-public python-uuid6
  (package
    (name "python-uuid6")
    (version "2025.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-uuid6.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/oittaa/uuid6-python")
    (synopsis "new time-based UUID formats which are suited for use as a database key")
    (description "New time-based UUID formats which are suited for use as a database key.")
    (license license:expat)))

;;; rtcqs — Scanner for potential real-time bottlenecks
(define-public rtcqs
  (package
    (name "rtcqs")
    (version "0.6.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rtcqs.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/rtcqs/rtcqs")
    (synopsis "scanner for potential real-time bottlenecks")
    (description "Scanner for potential real-time bottlenecks.")
    (license license:expat)))

;;; dufs — A distinctive utility file server that supports static servi
(define-public dufs
  (package
    (name "dufs")
    (version "0.45.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dufs.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sigoden/dufs")
    (synopsis "a distinctive utility file server that supports static serving, uploading, se...")
    (description "A distinctive utility file server that supports static serving, uploading, searching, accessing control, webdav...")
    (license license:expat)))

;;; makeself — Utility to create self-extracting packages
(define-public makeself
  (package
    (name "makeself")
    (version "2.7.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/makeself.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://makeself.io/")
    (synopsis "utility to create self-extracting packages")
    (description "Utility to create self-extracting packages.")
    (license license:gpl2+)))

;;; python-pdfplumber — Plumb a PDF for detailed information about each char, rectan
(define-public python-pdfplumber
  (package
    (name "python-pdfplumber")
    (version "0.11.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pdfplumber.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jsvine/pdfplumber")
    (synopsis "plumb a PDF for detailed information about each char, rectangle, line, et cetera")
    (description "Plumb a PDF for detailed information about each char, rectangle, line, et cetera.")
    (license license:expat)))

;;; questdb — Fast timeseries database
(define-public questdb
  (package
    (name "questdb")
    (version "9.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/questdb.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://questdb.io")
    (synopsis "fast timeseries database")
    (description "Fast timeseries database.")
    (license license:asl2.0)))

;;; hoffice — Office document editor for Linux. Hancom Office Editor is an
(define-public hoffice
  (package
    (name "hoffice")
    (version "11.20.0.1520")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hoffice.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.hancom.com")
    (synopsis "office document editor for Linux. Hancom Office Editor is an application to a...")
    (description "Office document editor for Linux. Hancom Office Editor is an application to allow you to edit office documents that is developed and distributed by Hancom Inc. / 본 어플리케이션은 리눅스용 문서 편집 프로그램으로, 한컴에 의해 개발되고 배포된 형식의 문서들을 편집할 수 있도록 해주는 프로그램입니다.")
    (license license:nonfree)))

;;; rftg — Singleplayer and online implementation of the card game Race
(define-public rftg
  (package
    (name "rftg")
    (version "0.9.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rftg.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://keldon.net/rftg/")
    (synopsis "singleplayer and online implementation of the card game Race for the Galaxy b...")
    (description "Singleplayer and online implementation of the card game Race for the Galaxy by Tom Lehman.")
    (license license:nonfree)))

;;; tor-unstable — Anonymizing overlay network (with alpha/beta/rc)
(define-public tor-unstable
  (package
    (name "tor-unstable")
    (version "0.4.9.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tor-unstable.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.torproject.org/")
    (synopsis "anonymizing overlay network (with alpha/beta/rc)")
    (description "Anonymizing overlay network (with alpha/beta/rc).")
    (license license:bsd-3)))

;;; line — A dead simple line printer.
(define-public line
  (package
    (name "line")
    (version "2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/line.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mini-eggs/line")
    (synopsis "a dead simple line printer")
    (description "A dead simple line printer.")
    (license license:expat)))

;;; vnrez — All-in-one Linux tool for recording, screenshots to share yo
(define-public vnrez
  (package
    (name "vnrez")
    (version "3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vnrez.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/verysillycat/vnrez")
    (synopsis "all-in-one Linux tool for recording, screenshots to share your files online")
    (description "All-in-one Linux tool for recording, screenshots to share your files online.")
    (license license:agpl3+)))

;;; pacsaviour — An automation tool for optimising mirrors, cleaning and upda
(define-public pacsaviour
  (package
    (name "pacsaviour")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pacsaviour.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Luxxgit2k4/pacsaviour")
    (synopsis "an automation tool for optimising mirrors, cleaning and updating the system")
    (description "An automation tool for optimising mirrors, cleaning and updating the system.")
    (license license:expat)))

;;; whoogle-git — A self-hosted, ad-free, privacy-respecting metasearch engine
(define-public whoogle-git
  (package
    (name "whoogle-git")
    (version "0.8.4.r6.g7313edf")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/whoogle-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/benbusby/whoogle-search")
    (synopsis "a self-hosted, ad-free, privacy-respecting metasearch engine")
    (description "A self-hosted, ad-free, privacy-respecting metasearch engine.")
    (license license:expat)))

;;; try — Try lets you run a command and inspect its effects before ch
(define-public try
  (package
    (name "try")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/try.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/binpash/try")
    (synopsis "try lets you run a command and inspect its effects before changing your live ...")
    (description "Try lets you run a command and inspect its effects before changing your live system.")
    (license license:expat)))

;;; tuc — A more powerful alternative to cut
(define-public tuc
  (package
    (name "tuc")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tuc.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/riquito/tuc")
    (synopsis "a more powerful alternative to cut")
    (description "A more powerful alternative to cut.")
    (license license:gpl3+)))

;;; treefetch — A plant-based system fetch tool made with Rust
(define-public treefetch
  (package
    (name "treefetch")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/treefetch.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/angelofallars/treefetch")
    (synopsis "a plant-based system fetch tool made with Rust")
    (description "A plant-based system fetch tool made with Rust.")
    (license license:gpl3)))

;;; ultralist — Simple task management for tech folks.
(define-public ultralist
  (package
    (name "ultralist")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ultralist.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ultralist.io/")
    (synopsis "simple task management for tech folks")
    (description "Simple task management for tech folks.")
    (license license:expat)))

;;; unifetch — An unofficial inheritor of neofetch.
(define-public unifetch
  (package
    (name "unifetch")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unifetch.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nmimusic/unifetch")
    (synopsis "an unofficial inheritor of neofetch")
    (description "An unofficial inheritor of neofetch.")
    (license license:expat)))

;;; unsilence — Console Interface and Library to remove silent parts of a me
(define-public unsilence
  (package
    (name "unsilence")
    (version "1.0.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unsilence.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lagmoellertim/unsilence")
    (synopsis "console Interface and Library to remove silent parts of a media file")
    (description "Console Interface and Library to remove silent parts of a media file.")
    (license license:expat)))

;;; verifpal — Cryptographic protocol analysis for real-world protocols.
(define-public verifpal
  (package
    (name "verifpal")
    (version "0.51.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/verifpal.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://verifpal.com")
    (synopsis "cryptographic protocol analysis for real-world protocols")
    (description "Cryptographic protocol analysis for real-world protocols.")
    (license license:nonfree)))

;;; vfu — Versatile text-based file-manager
(define-public vfu
  (package
    (name "vfu")
    (version "5.09")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vfu.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cade.noxrun.com/projects/vfu")
    (synopsis "versatile text-based file-manager")
    (description "Versatile text-based file-manager.")
    (license license:nonfree)))

;;; victoriametrics-bin — Fast, cost-effective and scalable time series database
(define-public victoriametrics-bin
  (package
    (name "victoriametrics-bin")
    (version "1.138.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/victoriametrics-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://victoriametrics.github.io")
    (synopsis "fast, cost-effective and scalable time series database")
    (description "Fast, cost-effective and scalable time series database.")
    (license license:asl2.0)))

;;; wait4x — Wait4X allows you to wait for a port or a service to enter t
(define-public wait4x
  (package
    (name "wait4x")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wait4x.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wait4x.dev")
    (synopsis "wait4X allows you to wait for a port or a service to enter the requested state")
    (description "Wait4X allows you to wait for a port or a service to enter the requested state.")
    (license license:asl2.0)))

;;; webchanges — Check web content for changes and notify
(define-public webchanges
  (package
    (name "webchanges")
    (version "3.36.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/webchanges.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mborsetti/webchanges")
    (synopsis "check web content for changes and notify")
    (description "Check web content for changes and notify.")
    (license license:bsd-3)))

;;; wifi-password — Quickly fetch your WiFi password and if needed, generate a Q
(define-public wifi-password
  (package
    (name "wifi-password")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wifi-password.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sdushantha/wifi-password")
    (synopsis "quickly fetch your WiFi password and if needed, generate a QR code of your Wi...")
    (description "Quickly fetch your WiFi password and if needed, generate a QR code of your WiFi to allow phones to easily connect.")
    (license license:expat)))

;;; windowchef — A stacking window manager that cooks windows with orders fro
(define-public windowchef
  (package
    (name "windowchef")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/windowchef.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tudurom/windowchef")
    (synopsis "a stacking window manager that cooks windows with orders from the Waitron")
    (description "A stacking window manager that cooks windows with orders from the Waitron.")
    (license license:isc)))

;;; windowlab — A small and simple window manager.
(define-public windowlab
  (package
    (name "windowlab")
    (version "1.40")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/windowlab.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.nickgravgaard.com/windowlab")
    (synopsis "a small and simple window manager")
    (description "A small and simple window manager.")
    (license license:nonfree)))

;;; waon — Wave-to-Notes transcriber (WAVE-MIDI converter)
(define-public waon
  (package
    (name "waon")
    (version "0.11")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/waon.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://waon.sourceforge.net/")
    (synopsis "wave-to-Notes transcriber (WAVE-MIDI converter)")
    (description "Wave-to-Notes transcriber (WAVE-MIDI converter).")
    (license license:gpl2+)))
