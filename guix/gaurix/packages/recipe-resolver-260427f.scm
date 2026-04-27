;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260427f
;;; Resolves 100 packages from queue (99 recipes, 1 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260427f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (

            buildstream-plugins-experimental
            azure2
            annobin
            cargo-mommy-git
            cudatext-git
            c-evo-dh
            bricscad-fr_fr
            npapi-vlc-git
            lprng-cups
            hoffice-hwp
            k5prog-git
            elasticsearch
            relagit
            fabric-git
            kubectl-argo-rollouts-bin
            twitchmpv-git
            checkupdatify
            paper-plane-git
            freecad-appimage
            env-modules
            endlessh-git
            python-g2p-blocks-git
            python-tulir-telethon
            google-drive-ocamlfuse
            squirrel-sql
            checkra1n-cli
            baikal
            cubicsdr
            bibletime-git
            gpp
            fbff-git
            xscreensaver-backends
            pathplanner-bin
            tla-toolbox
            libreddit
            doclifter
            cryptor
            triton-git
            supercat
            murex
            mautrix-discord-bin
            lxqt-plugin-wingmenu-git
            heisenbridge
            fprint_demo
            ytsub-bin
            ttkmusicplayer-bin
            python-plum
            python-cambd
            oq-bin
            librm-git
            libfprint-0
            kyocera-sane
            ir-lv2
            buckets-beta-bin
            baobab-git
            zimtohrli-git
            yuma123-git
            witsy-bin
            vala-rofi-polkit
            todo-manager
            textadept-curses
            tablet-mode
            ssh-ggh-bin
            sigil2-wad
            sftpman-iced
            scu-bin
            runki-git
            resticity
            res-downloader
            quickosdl
            python-pytest-image-diff
            python-imgdiff
            python-accimage
            pixfetch-bin
            php-parle-git
            momw-configurator
            minilpa-git
            libinput-git
            labelle
            kustomize-sops
            jlecmd-git
            imfile-git
            imfile
            freckles-bin
            fedi-fetcher
            erg-bin
            emu80-base
            easylpac
            dofigen
            clicker-git
            chromium-extension-ublock-origin
            cargo-chef
            arch-update-helper
            aptos
            advanced-linux-system-cleaning
            mcuxpresso-config-tools
            cinnamon-6-2-theme
            4kyoutubetomp3
            xerox-phaser-3320
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; buildstream-plugins-experimental --- a collection of experimental BuildStream plugins
(define-public buildstream-plugins-experimental
  (package
    (name "buildstream-plugins-experimental")
    (version "1.95.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/buildstream-plugins-experimental.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a collection of experimental BuildStream plugins")
    (description "A collection of experimental BuildStream plugins.")
    (home-page "https://buildstream.build")
    (license license:lgpl3+)))

;;; azure2 --- bayesian R-Matrix Inference Code
(define-public azure2
  (package
    (name "azure2")
    (version "v1.0.r117.gd7deab6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/azure2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "bayesian R-Matrix Inference Code")
    (description "Bayesian R-Matrix Inference Code.")
    (home-page "https://azure.nd.edu/")
    (license license:nonfree)))

;;; annobin --- a binary annotation and examination package
(define-public annobin
  (package
    (name "annobin")
    (version "13.08")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/annobin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a binary annotation and examination package")
    (description "A binary annotation and examination package.")
    (home-page "https://sourceware.org/annobin")
    (license license:gpl3+)))

;;; cargo-mommy-git --- mommy's here to support you when running cargo~
(define-public cargo-mommy-git
  (package
    (name "cargo-mommy-git")
    (version "r10.df726f2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cargo-mommy-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "mommy's here to support you when running cargo~")
    (description "Mommy's here to support you when running cargo~.")
    (home-page "https://github.com/Gankra/cargo-mommy")
    (license license:asl2.0)))

;;; cudatext-git --- text editor written in Free Pascal with Lazarus (Qt6)
(define-public cudatext-git
  (package
    (name "cudatext-git")
    (version "1.229.5.0.r57.gb9ce0d8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cudatext-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "text editor written in Free Pascal with Lazarus (Qt6)")
    (description "Text editor written in Free Pascal with Lazarus (Qt6).")
    (home-page "https://github.com/Alexey-T/CudaText")
    (license license:mpl2.0)))

;;; c-evo-dh --- c-evo: Distant Horizon, Empire Building Game
(define-public c-evo-dh
  (package
    (name "c-evo-dh")
    (version "3.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/c-evo-dh.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "c-evo: Distant Horizon, Empire Building Game")
    (description "C-evo: Distant Horizon, Empire Building Game.")
    (home-page "https://git.code.sf.net/p/c-evo-eh/code")
    (license license:nonfree)))

;;; bricscad-fr_fr --- logiciel de CAO DWG
(define-public bricscad-fr_fr
  (package
    (name "bricscad-fr_fr")
    (version "26.2.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bricscad-fr_fr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "logiciel de CAO DWG")
    (description "Logiciel de CAO DWG.")
    (home-page "https://www.bricsys.com")
    (license license:nonfree)))

;;; npapi-vlc-git --- the modern VLC Mozilla (NPAPI) plugin - Git version
(define-public npapi-vlc-git
  (package
    (name "npapi-vlc-git")
    (version "3.0.3.r1570.3.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/npapi-vlc-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the modern VLC Mozilla (NPAPI) plugin - Git version")
    (description "The modern VLC Mozilla (NPAPI) plugin - Git version.")
    (home-page "https://code.videolan.org/videolan/npapi-vlc")
    (license license:nonfree)))

;;; lprng-cups --- an enhanced, extended, and portable implementation of the Berkeley LPR lpd pr
(define-public lprng-cups
  (package
    (name "lprng-cups")
    (version "3.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lprng-cups.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an enhanced, extended, and portable implementation of the Berkeley LPR lpd pr")
    (description "an enhanced, extended, and portable implementation of the Berkeley LPR lpd print spooler that coexists with CUPS.")
    (home-page "https://lprng.sourceforge.net")
    (license license:nonfree)))

;;; hoffice-hwp --- .HWP/HWPX Office document editor for Linux, excluding the Hancom Office suite
(define-public hoffice-hwp
  (package
    (name "hoffice-hwp")
    (version "11.20.0.1520")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hoffice-hwp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis ".HWP/HWPX Office document editor for Linux, excluding the Hancom Office suite")
    (description ".HWP/HWPX Office document editor for Linux, excluding the Hancom Office suite and only installs hoffice-hwp editor.")
    (home-page "https://www.hancom.com")
    (license license:nonfree)))

;;; k5prog-git --- quansheng UV-K5 EEPROM programmer
(define-public k5prog-git
  (package
    (name "k5prog-git")
    (version "r31.241ab18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/k5prog-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "quansheng UV-K5 EEPROM programmer")
    (description "Quansheng UV-K5 EEPROM programmer.")
    (home-page "https://github.com/sq5bpf/k5prog")
    (license license:gpl3+)))

;;; elasticsearch --- free and Open, Distributed, RESTful Search Engine
(define-public elasticsearch
  (package
    (name "elasticsearch")
    (version "9.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/elasticsearch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "free and Open, Distributed, RESTful Search Engine")
    (description "Free and Open, Distributed, RESTful Search Engine.")
    (home-page "https://www.elastic.co/elasticsearch/")
    (license license:nonfree)))

;;; relagit --- the elegant solution to graphical version control
(define-public relagit
  (package
    (name "relagit")
    (version "r1081.78fc85e")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/relagit/relagit/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the elegant solution to graphical version control")
    (description "The elegant solution to graphical version control.")
    (home-page "https://github.com/relagit/relagit")
    (license license:nonfree)))

;;; fabric-git --- an open-source framework for augmenting humans using AI
(define-public fabric-git
  (package
    (name "fabric-git")
    (version "r2173.ef2e985d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fabric-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an open-source framework for augmenting humans using AI")
    (description "An open-source framework for augmenting humans using AI.")
    (home-page "https://github.com/danielmiessler/fabric")
    (license license:expat)))

;;; kubectl-argo-rollouts-bin --- kubectl plugin for argo rollouts
(define-public kubectl-argo-rollouts-bin
  (package
    (name "kubectl-argo-rollouts-bin")
    (version "1.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/argoproj/argo-rollouts/releases/download/v" version "/argo-rollouts-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "kubectl plugin for argo rollouts")
    (description "Kubectl plugin for argo rollouts.")
    (home-page "https://github.com/argoproj/argo-rollouts")
    (license license:asl2.0)))

;;; twitchmpv-git --- wrapper bash script for streamlink in order to more simply watch twitch from 
(define-public twitchmpv-git
  (package
    (name "twitchmpv-git")
    (version "0.0.1.r3.9002501")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/twitchmpv-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "wrapper bash script for streamlink in order to more simply watch twitch from ")
    (description "Wrapper bash script for streamlink in order to more simply watch twitch from the terminal.")
    (home-page "https://github.com/Aethar01/twitchmpv")
    (license license:bsd-2)))

;;; checkupdatify --- a collection of scripts that notify you of pending updates to your Arch Linux
(define-public checkupdatify
  (package
    (name "checkupdatify")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/protist/checkupdatify/-/archive/v" version "/checkupdatify-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a collection of scripts that notify you of pending updates to your Arch Linux")
    (description "A collection of scripts that notify you of pending updates to your Arch Linux system.")
    (home-page "https://gitlab.com/protist/checkupdatify")
    (license license:gpl3+)))

;;; paper-plane-git --- chat over Telegram on a modern and elegant client
(define-public paper-plane-git
  (package
    (name "paper-plane-git")
    (version "0.1.0beta.4.r0.g2aa316c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/paper-plane-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "chat over Telegram on a modern and elegant client")
    (description "Chat over Telegram on a modern and elegant client.")
    (home-page "https://github.com/paper-plane-developers/paper-plane")
    (license license:gpl3+)))

;;; freecad-appimage --- a general purpose 3D CAD modeler (AppImage version)
(define-public freecad-appimage
  (package
    (name "freecad-appimage")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freecad-appimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a general purpose 3D CAD modeler (AppImage version)")
    (description "A general purpose 3D CAD modeler (AppImage version).")
    (home-page "https://www.freecad.org/")
    (license license:lgpl3+)))

;;; env-modules --- provides for an easy dynamic modification of a user's environment via modulef
(define-public env-modules
  (package
    (name "env-modules")
    (version "5.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/env-modules.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "provides for an easy dynamic modification of a user's environment via modulef")
    (description "Provides for an easy dynamic modification of a user's environment via modulefile.")
    (home-page "https://envmodules.io/")
    (license license:gpl2+)))

;;; endlessh-git --- a tarpit to lock up SSH clients
(define-public endlessh-git
  (package
    (name "endlessh-git")
    (version "r100.dfe44eb")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/endlessh-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a tarpit to lock up SSH clients")
    (description "A tarpit to lock up SSH clients.")
    (home-page "https://github.com/skeeto/endlessh")
    (license license:nonfree)))

;;; python-g2p-blocks-git --- enable bcache or LVM on existing block devices. Convert between raw partition
(define-public python-g2p-blocks-git
  (package
    (name "python-g2p-blocks-git")
    (version "167")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-g2p-blocks-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "enable bcache or LVM on existing block devices. Convert between raw partition")
    (description "Enable bcache or LVM on existing block devices. Convert between raw partitions, logical volumes, and bcache devices witout moving data.")
    (home-page "https://github.com/g2p/blocks")
    (license license:gpl3+)))

;;; python-tulir-telethon --- fork of Telethon library with custom patches from Tulir
(define-public python-tulir-telethon
  (package
    (name "python-tulir-telethon")
    (version "1.99.0a6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tulir/Telethon/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fork of Telethon library with custom patches from Tulir")
    (description "fork of Telethon library with custom patches from Tulir.")
    (home-page "https://github.com/tulir/Telethon")
    (license license:expat)))

;;; google-drive-ocamlfuse --- FUSE-based file system backed by Google Drive, written in OCaml
(define-public google-drive-ocamlfuse
  (package
    (name "google-drive-ocamlfuse")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/google-drive-ocamlfuse.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "FUSE-based file system backed by Google Drive, written in OCaml")
    (description "FUSE-based file system backed by Google Drive, written in OCaml.")
    (home-page "https://astrada.github.io/google-drive-ocamlfuse/")
    (license license:expat)))

;;; squirrel-sql --- a Java SQL client for any JDBC compliant database
(define-public squirrel-sql
  (package
    (name "squirrel-sql")
    (version "5.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/squirrel-sql.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a Java SQL client for any JDBC compliant database")
    (description "A Java SQL client for any JDBC compliant database.")
    (home-page "http://www.squirrelsql.org/")
    (license license:gpl3+)))

;;; checkra1n-cli --- a semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop)
(define-public checkra1n-cli
  (package
    (name "checkra1n-cli")
    (version "0.12.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/checkra1n-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop)")
    (description "A semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop). It's based on the checkm8 bootrom exploit released by axi0mx. Supports iOS 12.0 and newer.")
    (home-page "https://checkra.in")
    (license license:nonfree)))

;;; baikal --- lightweight CalDAV+CardDAV server
(define-public baikal
  (package
    (name "baikal")
    (version "0.11.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/baikal.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight CalDAV+CardDAV server")
    (description "Lightweight CalDAV+CardDAV server.")
    (home-page "http://sabre.io/baikal/")
    (license license:gpl3+)))

;;; cubicsdr --- cross-Platform Software-Defined Radio Application
(define-public cubicsdr
  (package
    (name "cubicsdr")
    (version "0.2.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cubicsdr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-Platform Software-Defined Radio Application")
    (description "Cross-Platform Software-Defined Radio Application.")
    (home-page "https://cubicsdr.com")
    (license license:gpl2+)))

;;; bibletime-git --- a Bible study application based on the Sword library and Qt toolkit
(define-public bibletime-git
  (package
    (name "bibletime-git")
    (version "3.2.0.r11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bibletime-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a Bible study application based on the Sword library and Qt toolkit")
    (description "A Bible study application based on the Sword library and Qt toolkit.")
    (home-page "https://bibletime.info/")
    (license license:gpl2)))

;;; gpp --- a general-purpose preprocessor with customizable syntax, suitable for a wide 
(define-public gpp
  (package
    (name "gpp")
    (version "2.28")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gpp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a general-purpose preprocessor with customizable syntax, suitable for a wide ")
    (description "A general-purpose preprocessor with customizable syntax, suitable for a wide range of preprocessing tasks.")
    (home-page "https://logological.org/gpp")
    (license license:nonfree)))

;;; fbff-git --- a small ffmpeg-based framebuffer media player
(define-public fbff-git
  (package
    (name "fbff-git")
    (version "0.87.ae86d8e")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fbff-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a small ffmpeg-based framebuffer media player")
    (description "A small ffmpeg-based framebuffer media player.")
    (home-page "http://repo.or.cz/w/fbff.git")
    (license license:gpl3+)))

;;; xscreensaver-backends --- screensavers from XScreenSaver for common frontends
(define-public xscreensaver-backends
  (package
    (name "xscreensaver-backends")
    (version "6.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xscreensaver-backends.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "screensavers from XScreenSaver for common frontends")
    (description "Screensavers from XScreenSaver for common frontends.")
    (home-page "http://www.jwz.org/xscreensaver/")
    (license license:bsd-3)))

;;; pathplanner-bin --- a simple yet powerful motion profile generator for FRC robots
(define-public pathplanner-bin
  (package
    (name "pathplanner-bin")
    (version "v2026.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mjansen4857/pathplanner/releases/download/v" version "/pathplanner-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple yet powerful motion profile generator for FRC robots")
    (description "A simple yet powerful motion profile generator for FRC robots.")
    (home-page "https://github.com/mjansen4857/pathplanner")
    (license license:expat)))

;;; tla-toolbox --- IDE for the TLA+ tools
(define-public tla-toolbox
  (package
    (name "tla-toolbox")
    (version "1.7.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tla-toolbox.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "IDE for the TLA+ tools")
    (description "IDE for the TLA+ tools.")
    (home-page "http://research.microsoft.com/en-us/um/people/lamport/tla/toolbox.html")
    (license license:expat)))

;;; libreddit --- alternative private front-end to Reddit
(define-public libreddit
  (package
    (name "libreddit")
    (version "0.30.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/spikecodes/libreddit/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "alternative private front-end to Reddit")
    (description "Alternative private front-end to Reddit.")
    (home-page "https://github.com/spikecodes/libreddit")
    (license license:agpl3+)))

;;; doclifter --- lift documents in {n,t}roff markups to XML-DocBook
(define-public doclifter
  (package
    (name "doclifter")
    (version "2.22")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/doclifter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "lift documents in {n,t}roff markups to XML-DocBook")
    (description "Lift documents in {n,t}roff markups to XML-DocBook.")
    (home-page "http://www.catb.org/~esr/doclifter")
    (license license:bsd-2)))

;;; cryptor --- simple GUI application for gocryptfs
(define-public cryptor
  (package
    (name "cryptor")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/moson-mo/cryptor/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple GUI application for gocryptfs")
    (description "Simple GUI application for gocryptfs.")
    (home-page "https://github.com/moson-mo/cryptor")
    (license license:bsd-3)))

;;; triton-git --- dynamic binary analysis framework
(define-public triton-git
  (package
    (name "triton-git")
    (version "0.9.r652.gb022f317")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/triton-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "dynamic binary analysis framework")
    (description "Dynamic binary analysis framework.")
    (home-page "https://triton.quarkslab.com/")
    (license license:asl2.0)))

;;; supercat --- a program that colorizes text based on matching regular expressions/strings/c
(define-public supercat
  (package
    (name "supercat")
    (version "0.5.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/supercat.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a program that colorizes text based on matching regular expressions/strings/c")
    (description "A program that colorizes text based on matching regular expressions/strings/characters.")
    (home-page "http://supercat.nosredna.net/")
    (license license:gpl3+)))

;;; murex --- a smarter shell and scripting environment with advanced features designed for
(define-public murex
  (package
    (name "murex")
    (version "7.2.1001")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/lmorg/murex/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a smarter shell and scripting environment with advanced features designed for")
    (description "A smarter shell and scripting environment with advanced features designed for usability, safety and productivity (eg smarter DevOps tooling).")
    (home-page "https://github.com/lmorg/murex")
    (license license:gpl2)))

;;; mautrix-discord-bin --- a Matrix-Discord puppeting bridge
(define-public mautrix-discord-bin
  (package
    (name "mautrix-discord-bin")
    (version "0.7.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mautrix/discord/releases/download/v" version "/discord-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a Matrix-Discord puppeting bridge")
    (description "A Matrix-Discord puppeting bridge.")
    (home-page "https://github.com/mautrix/discord")
    (license license:agpl3+)))

;;; lxqt-plugin-wingmenu-git --- alternative menu plugin for lxqt-panel
(define-public lxqt-plugin-wingmenu-git
  (package
    (name "lxqt-plugin-wingmenu-git")
    (version "r57.70b9b80")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lxqt-plugin-wingmenu-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "alternative menu plugin for lxqt-panel")
    (description "alternative menu plugin for lxqt-panel.")
    (home-page "https://github.com/slidinghotdog/plugin-wingmenu")
    (license license:lgpl3+)))

;;; heisenbridge --- bouncer-style Matrix IRC bridge
(define-public heisenbridge
  (package
    (name "heisenbridge")
    (version "1.15.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hifi/heisenbridge/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "bouncer-style Matrix IRC bridge")
    (description "bouncer-style Matrix IRC bridge.")
    (home-page "https://github.com/hifi/heisenbridge")
    (license license:expat)))

;;; fprint_demo --- a simple GTK+ application to demonstrate and test libfprint's capabilities
(define-public fprint_demo
  (package
    (name "fprint_demo")
    (version "0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fprint_demo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple GTK+ application to demonstrate and test libfprint's capabilities")
    (description "A simple GTK+ application to demonstrate and test libfprint's capabilities.")
    (home-page "https://www.freedesktop.org/wiki/Software/fprint/fprint_demo/")
    (license license:gpl2)))

;;; ytsub-bin --- a subscriptions only TUI Youtube client
(define-public ytsub-bin
  (package
    (name "ytsub-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/sarowish/ytsub/releases/download/v" version "/ytsub-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a subscriptions only TUI Youtube client")
    (description "A subscriptions only TUI Youtube client.")
    (home-page "https://github.com/sarowish/ytsub")
    (license license:gpl3+)))

;;; ttkmusicplayer-bin --- TTKMusicPlayer imitates Kugou UI, the music player uses of qmmp core library 
(define-public ttkmusicplayer-bin
  (package
    (name "ttkmusicplayer-bin")
    (version "4.3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Greedysky/TTKMusicPlayer/releases/download/v" version "/TTKMusicPlayer-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "TTKMusicPlayer imitates Kugou UI, the music player uses of qmmp core library ")
    (description "TTKMusicPlayer imitates Kugou UI, the music player uses of qmmp core library based on Qt.(Prebuilt version)支持网易云音乐、酷我音乐、酷狗音乐.")
    (home-page "https://github.com/Greedysky/TTKMusicPlayer")
    (license license:gpl3+)))

;;; python-plum --- pack/Unpack Memory
(define-public python-plum
  (package
    (name "python-plum")
    (version "0.8.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-plum.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pack/Unpack Memory")
    (description "Pack/Unpack Memory.")
    (home-page "https://plum-py.readthedocs.io/en/latest/")
    (license license:expat)))

;;; python-cambd --- cambridge dictionary cli app
(define-public python-cambd
  (package
    (name "python-cambd")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/rocktimsaikia/cambd/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cambridge dictionary cli app")
    (description "Cambridge dictionary cli app.")
    (home-page "https://github.com/rocktimsaikia/cambd")
    (license license:expat)))

;;; oq-bin --- a performant, and portable jq wrapper to facilitate the consumption and outpu
(define-public oq-bin
  (package
    (name "oq-bin")
    (version "1.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/blacksmoke16/oq/releases/download/v" version "/oq-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a performant, and portable jq wrapper to facilitate the consumption and outpu")
    (description "A performant, and portable jq wrapper to facilitate the consumption and output of formats other than JSON; using jq filters to transform the data.")
    (home-page "https://github.com/blacksmoke16/oq")
    (license license:expat)))

;;; librm-git --- offers FRITZ!Box related core functionality for Roger Router (GUI), Roger CLI
(define-public librm-git
  (package
    (name "librm-git")
    (version "2.3.4+2.r154.20250629.9dabfe1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/tabos/librm/-/archive/v" version "/librm-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "offers FRITZ!Box related core functionality for Roger Router (GUI), Roger CLI")
    (description "Offers FRITZ!Box related core functionality for Roger Router (GUI), Roger CLI (CLI) and Roger Rabbit (ncurses) interfaces.")
    (home-page "https://gitlab.com/tabos/librm")
    (license license:lgpl3+)))

;;; libfprint-0 --- library for fingerprint readers - version 0.7 for fprint_demo
(define-public libfprint-0
  (package
    (name "libfprint-0")
    (version "0.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libfprint-0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "library for fingerprint readers - version 0.7 for fprint_demo")
    (description "Library for fingerprint readers - version 0.7 for fprint_demo.")
    (home-page "https://fprint.freedesktop.org/")
    (license license:lgpl3+)))

;;; kyocera-sane --- kyocera sane scanner support package for many Kyocera printers
(define-public kyocera-sane
  (package
    (name "kyocera-sane")
    (version "2.2.1511")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kyocera-sane.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "kyocera sane scanner support package for many Kyocera printers")
    (description "Kyocera sane scanner support package for many Kyocera printers.")
    (home-page "https://www.kyocera.com/")
    (license license:nonfree)))

;;; ir-lv2 --- no-latency/low-latency, realtime, high performance signal convolver for rever
(define-public ir-lv2
  (package
    (name "ir.lv2")
    (version "1.3.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ir.lv2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "no-latency/low-latency, realtime, high performance signal convolver for rever")
    (description "No-latency/low-latency, realtime, high performance signal convolver for reverb effects.")
    (home-page "https://tomscii.sig7.se/plugins/ir.lv2")
    (license license:gpl2)))

;;; buckets-beta-bin --- private budgeting with the envelope budgeting method
(define-public buckets-beta-bin
  (package
    (name "buckets-beta-bin")
    (version "0.81.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/buckets-beta-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "private budgeting with the envelope budgeting method")
    (description "Private budgeting with the envelope budgeting method.")
    (home-page "https://www.budgetwithbuckets.com/")
    (license license:nonfree)))

;;; baobab-git --- a graphical directory tree analyzer
(define-public baobab-git
  (package
    (name "baobab-git")
    (version "42.alpha.r1.g30f0653")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/baobab-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a graphical directory tree analyzer")
    (description "A graphical directory tree analyzer.")
    (home-page "https://wiki.gnome.org/Apps/DiskUsageAnalyzer")
    (license license:gpl2)))

;;; zimtohrli-git --- a psychoacoustic perceptual metric for audio compression
(define-public zimtohrli-git
  (package
    (name "zimtohrli-git")
    (version "0.2.1.r37.ecb24ec")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zimtohrli-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a psychoacoustic perceptual metric for audio compression")
    (description "A psychoacoustic perceptual metric for audio compression.")
    (home-page "https://github.com/google/zimtohrli")
    (license license:asl2.0)))

;;; yuma123-git --- open-source YANG API in C, yangcli and netconfd server
(define-public yuma123-git
  (package
    (name "yuma123-git")
    (version "latest")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yuma123-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source YANG API in C, yangcli and netconfd server")
    (description "Open-source YANG API in C, yangcli and netconfd server.")
    (home-page "https://github.com/vlvassilev/yuma123")
    (license license:bsd-3)))

;;; witsy-bin --- generative AI desktop application.(Prebuilt version.Use system-wide electron)
(define-public witsy-bin
  (package
    (name "witsy-bin")
    (version "3.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Kochava-Studios/witsy/releases/download/v" version "/witsy-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "generative AI desktop application.(Prebuilt version.Use system-wide electron)")
    (description "Generative AI desktop application.(Prebuilt version.Use system-wide electron).")
    (home-page "https://github.com/Kochava-Studios/witsy")
    (license license:asl2.0)))

;;; vala-rofi-polkit --- a tool crafted to employ Rofi, or any other program executable via a Bash scr
(define-public vala-rofi-polkit
  (package
    (name "vala-rofi-polkit")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/MonadicSpell/vala-rofi-polkit/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a tool crafted to employ Rofi, or any other program executable via a Bash scr")
    (description "A tool crafted to employ Rofi, or any other program executable via a Bash script, as the authentication user interface for Polkit.")
    (home-page "https://github.com/MonadicSpell/vala-rofi-polkit")
    (license license:expat)))

;;; todo-manager --- a simple task management TUI using gum CLI
(define-public todo-manager
  (package
    (name "todo-manager")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Harish-Rusum/todo.git/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple task management TUI using gum CLI")
    (description "A simple task management TUI using gum CLI.")
    (home-page "https://github.com/Harish-Rusum/todo.git")
    (license license:expat)))

;;; textadept-curses --- fast, minimalist, and remarkably extensible cross-platform text editor
(define-public textadept-curses
  (package
    (name "textadept-curses")
    (version "12.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/orbitalquark/textadept/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast, minimalist, and remarkably extensible cross-platform text editor")
    (description "Fast, minimalist, and remarkably extensible cross-platform text editor.")
    (home-page "https://github.com/orbitalquark/textadept")
    (license license:expat)))

;;; tablet-mode --- tools to toggle a convertible laptop between laptop and tablet mode
(define-public tablet-mode
  (package
    (name "tablet-mode")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/coNQP/tablet-mode/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tools to toggle a convertible laptop between laptop and tablet mode")
    (description "Tools to toggle a convertible laptop between laptop and tablet mode.")
    (home-page "https://github.com/coNQP/tablet-mode")
    (license license:gpl3+)))

;;; ssh-ggh-bin --- recall your SSH sessions (also search your SSH config file)
(define-public ssh-ggh-bin
  (package
    (name "ssh-ggh-bin")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/byawitz/ggh/releases/download/v" version "/ggh-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "recall your SSH sessions (also search your SSH config file)")
    (description "Recall your SSH sessions (also search your SSH config file).")
    (home-page "https://github.com/byawitz/ggh")
    (license license:asl2.0)))

;;; sigil2-wad --- SIGIL II, the unofficial 6th episode of the original 1993 DOOM by John Romero
(define-public sigil2-wad
  (package
    (name "sigil2-wad")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sigil2-wad.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "SIGIL II, the unofficial 6th episode of the original 1993 DOOM by John Romero")
    (description "SIGIL II, the unofficial 6th episode of the original 1993 DOOM by John Romero. Requires DOOM.WAD.")
    (home-page "https://romero.com/sigil")
    (license license:nonfree)))

;;; sftpman-iced --- a GUI frontend to sftpman (an application for managing and mounting sshfs (SF
(define-public sftpman-iced
  (package
    (name "sftpman-iced")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/spantaleev/sftpman-iced-rs/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a GUI frontend to sftpman (an application for managing and mounting sshfs (SF")
    (description "A GUI frontend to sftpman (an application for managing and mounting sshfs (SFTP) filesystems).")
    (home-page "https://github.com/spantaleev/sftpman-iced-rs")
    (license license:agpl3+)))

;;; scu-bin --- system fetch utility is aimed at informativeness
(define-public scu-bin
  (package
    (name "scu-bin")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/charidot/scu/-/archive/v" version "/scu-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "system fetch utility is aimed at informativeness")
    (description "System fetch utility is aimed at informativeness.")
    (home-page "https://gitlab.com/charidot/scu")
    (license license:gpl3+)))

;;; runki-git --- ankiweb.net console client. Manage Anki flashcards without a friction
(define-public runki-git
  (package
    (name "runki-git")
    (version "20240325")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/runki-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "ankiweb.net console client. Manage Anki flashcards without a friction")
    (description "Ankiweb.net console client. Manage Anki flashcards without a friction.")
    (home-page "https://github.com/seletskiy/runki")
    (license license:expat)))

;;; resticity --- a frontend for restic
(define-public resticity
  (package
    (name "resticity")
    (version "1.0.46")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ad-on-is/resticity/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a frontend for restic")
    (description "A frontend for restic.")
    (home-page "https://github.com/ad-on-is/resticity")
    (license license:gpl3+)))

;;; res-downloader --- this is a high-value and high-performance and diverse resource downloader cal
(define-public res-downloader
  (package
    (name "res-downloader")
    (version "3.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/putyy/res-downloader/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "this is a high-value and high-performance and diverse resource downloader cal")
    (description "This is a high-value and high-performance and diverse resource downloader called res-downloader.")
    (home-page "https://github.com/putyy/res-downloader")
    (license license:asl2.0)))

;;; quickosdl --- TUI for quick finding and downloading images of various operating systems
(define-public quickosdl
  (package
    (name "quickosdl")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/lj3954/quickosdl/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI for quick finding and downloading images of various operating systems")
    (description "TUI for quick finding and downloading images of various operating systems.")
    (home-page "https://github.com/lj3954/quickosdl")
    (license license:gpl3+)))

;;; python-pytest-image-diff --- pytest helps for compare images and regression
(define-public python-pytest-image-diff
  (package
    (name "python-pytest-image-diff")
    (version "0.0.14-2.314")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pytest-image-diff.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pytest helps for compare images and regression")
    (description "pytest helps for compare images and regression.")
    (home-page "https://pypi.org/project/pytest-image-diff/")
    (license license:expat)))

;;; python-imgdiff --- compare two images side-by-side
(define-public python-imgdiff
  (package
    (name "python-imgdiff")
    (version "1.8.0-2.314")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-imgdiff.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "compare two images side-by-side")
    (description "Compare two images side-by-side.")
    (home-page "https://pypi.org/project/imgdiff/")
    (license license:expat)))

;;; python-accimage --- high performance image loading and augmenting routines mimicking PIL.Image in
(define-public python-accimage
  (package
    (name "python-accimage")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pytorch/accimage/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "high performance image loading and augmenting routines mimicking PIL.Image in")
    (description "high performance image loading and augmenting routines mimicking PIL.Image interface.")
    (home-page "https://github.com/pytorch/accimage")
    (license license:bsd-3)))

;;; pixfetch-bin --- another fetch program with pixelized images written in Rust
(define-public pixfetch-bin
  (package
    (name "pixfetch-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/RubixDev/pixfetch/releases/download/v" version "/pixfetch-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "another fetch program with pixelized images written in Rust")
    (description "Another fetch program with pixelized images written in Rust.")
    (home-page "https://github.com/RubixDev/pixfetch")
    (license license:gpl2)))

;;; php-parle-git --- parser and lexer for PHP
(define-public php-parle-git
  (package
    (name "php-parle-git")
    (version "0.8.5.r3.gc6343f5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php-parle-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "parser and lexer for PHP")
    (description "Parser and lexer for PHP.")
    (home-page "https://github.com/weltling/parle")
    (license license:bsd-2)))

;;; momw-configurator --- generates fully functional openmw.cfg and settings.cfg for any mod list from 
(define-public momw-configurator
  (package
    (name "momw-configurator")
    (version "1.23")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/modding-openmw/momw-configurator/-/archive/v" version "/momw-configurator-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "generates fully functional openmw.cfg and settings.cfg for any mod list from ")
    (description "Generates fully functional openmw.cfg and settings.cfg for any mod list from Modding-OpenMW.com and runs modding tools with appropriate handling for your selected mod list. Intended to be used alongside umo for the website's Automatic Install Guide.")
    (home-page "https://gitlab.com/modding-openmw/momw-configurator")
    (license license:expat)))

;;; minilpa-git --- professional LPA UI
(define-public minilpa-git
  (package
    (name "minilpa-git")
    (version "r21.bb1ee40")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/minilpa-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "professional LPA UI")
    (description "Professional LPA UI.")
    (home-page "https://github.com/EsimMoe/MiniLPA")
    (license license:agpl3+)))

;;; libinput-git --- input device management and event handling library
(define-public libinput-git
  (package
    (name "libinput-git")
    (version "1.27.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libinput-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "input device management and event handling library")
    (description "Input device management and event handling library.")
    (home-page "https://gitlab.freedesktop.org/libinput/libinput")
    (license license:expat)))

;;; labelle --- linux Software to print with LabelManager PnP from Dymo
(define-public labelle
  (package
    (name "labelle")
    (version "1.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/labelle-org/labelle/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "linux Software to print with LabelManager PnP from Dymo")
    (description "Linux Software to print with LabelManager PnP from Dymo.")
    (home-page "https://github.com/labelle-org/labelle")
    (license license:asl2.0)))

;;; kustomize-sops --- KSOPS - A Flexible Kustomize Plugin for SOPS Encrypted Resources
(define-public kustomize-sops
  (package
    (name "kustomize-sops")
    (version "4.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/viaduct-ai/kustomize-sops/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "KSOPS - A Flexible Kustomize Plugin for SOPS Encrypted Resources")
    (description "KSOPS - A Flexible Kustomize Plugin for SOPS Encrypted Resources.")
    (home-page "https://github.com/viaduct-ai/kustomize-sops")
    (license license:asl2.0)))

;;; jlecmd-git --- automatic and Custom Destinations jump list parser with Windows 10 support
(define-public jlecmd-git
  (package
    (name "jlecmd-git")
    (version "1.1.0.0.r54.gf76cae2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jlecmd-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "automatic and Custom Destinations jump list parser with Windows 10 support")
    (description "Automatic and Custom Destinations jump list parser with Windows 10 support.")
    (home-page "https://github.com/EricZimmerman/JLECmd")
    (license license:expat)))

;;; imfile-git --- a full-featured download manager.Forked from motrix.(Use system-wide electron)
(define-public imfile-git
  (package
    (name "imfile-git")
    (version "2.0.4.r0.g83b91f1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/imfile-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a full-featured download manager.Forked from motrix.(Use system-wide electron)")
    (description "A full-featured download manager.Forked from motrix.(Use system-wide electron).")
    (home-page "https://imfile.io/")
    (license license:expat)))

;;; imfile --- a full-featured download manager.Forked from motrix.(Use system-wide electron)
(define-public imfile
  (package
    (name "imfile")
    (version "2.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/imfile.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a full-featured download manager.Forked from motrix.(Use system-wide electron)")
    (description "A full-featured download manager.Forked from motrix.(Use system-wide electron).")
    (home-page "https://imfile.io/")
    (license license:expat)))

;;; freckles-bin --- a simple dotfile manager
(define-public freckles-bin
  (package
    (name "freckles-bin")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/carapace-sh/freckles/releases/download/v" version "/freckles-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple dotfile manager")
    (description "A simple dotfile manager.")
    (home-page "https://github.com/carapace-sh/freckles")
    (license license:expat)))

;;; fedi-fetcher --- fediFetcher is a tool for Mastodon that automatically fetches missing replies
(define-public fedi-fetcher
  (package
    (name "fedi-fetcher")
    (version "7.1.16")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nanos/FediFetcher/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fediFetcher is a tool for Mastodon that automatically fetches missing replies")
    (description "FediFetcher is a tool for Mastodon that automatically fetches missing replies and posts from other fediverse instances, and adds them to your own Mastodon instance.")
    (home-page "https://github.com/nanos/FediFetcher")
    (license license:expat)))

;;; erg-bin --- statically typed language that builds upon the Python ecosystem
(define-public erg-bin
  (package
    (name "erg-bin")
    (version "0.6.53")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/erg-lang/erg/releases/download/v" version "/erg-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "statically typed language that builds upon the Python ecosystem")
    (description "Statically typed language that builds upon the Python ecosystem.")
    (home-page "https://github.com/erg-lang/erg")
    (license license:asl2.0)))

;;; emu80-base --- emulator for bunch of Soviet PCs. Assets package
(define-public emu80-base
  (package
    (name "emu80-base")
    (version "4.0.559")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/emu80-base.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "emulator for bunch of Soviet PCs. Assets package")
    (description "Emulator for bunch of Soviet PCs. Assets package.")
    (home-page "https://emu80.org/")
    (license license:gpl3+)))

;;; easylpac --- lpac GUI Frontend
(define-public easylpac
  (package
    (name "easylpac")
    (version "0.7.8.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/creamlike1024/EasyLPAC/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "lpac GUI Frontend")
    (description "lpac GUI Frontend.")
    (home-page "https://github.com/creamlike1024/EasyLPAC")
    (license license:expat)))

;;; dofigen --- generate Dockerfiles using simplified descriptions in YAML
(define-public dofigen
  (package
    (name "dofigen")
    (version "2.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/lenra-io/dofigen/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "generate Dockerfiles using simplified descriptions in YAML")
    (description "Generate Dockerfiles using simplified descriptions in YAML.")
    (home-page "https://github.com/lenra-io/dofigen")
    (license license:expat)))

;;; clicker-git --- a simple desktop automation tool (autoclicker)
(define-public clicker-git
  (package
    (name "clicker-git")
    (version "r45.9ef5eeb")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/clicker-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple desktop automation tool (autoclicker)")
    (description "a simple desktop automation tool (autoclicker).")
    (home-page "https://codeberg.org/nycex/clicker")
    (license license:gpl3+)))

;;; chromium-extension-ublock-origin --- chromium uBlock Origin extension
(define-public chromium-extension-ublock-origin
  (package
    (name "chromium-extension-ublock-origin")
    (version "1.70.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/gorhill/uBlock/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "chromium uBlock Origin extension")
    (description "chromium uBlock Origin extension.")
    (home-page "https://github.com/gorhill/uBlock")
    (license license:gpl3+)))

;;; cargo-chef --- a cargo-subcommand to speed up Rust Docker builds using Docker layer caching
(define-public cargo-chef
  (package
    (name "cargo-chef")
    (version "0.1.77")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/LukeMathWalker/cargo-chef/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a cargo-subcommand to speed up Rust Docker builds using Docker layer caching")
    (description "A cargo-subcommand to speed up Rust Docker builds using Docker layer caching.")
    (home-page "https://github.com/LukeMathWalker/cargo-chef")
    (license license:asl2.0)))

;;; arch-update-helper --- a Systray Utility for Checking Arch Linux Updates and Installing Them
(define-public arch-update-helper
  (package
    (name "arch-update-helper")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/silverhadch/arch-update-helper/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a Systray Utility for Checking Arch Linux Updates and Installing Them")
    (description "A Systray Utility for Checking Arch Linux Updates and Installing Them.")
    (home-page "https://github.com/silverhadch/arch-update-helper")
    (license license:gpl3+)))

;;; aptos --- aptos is a layer 1 blockchain built to support the widespread use of blockcha
(define-public aptos
  (package
    (name "aptos")
    (version "9.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aptos.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "aptos is a layer 1 blockchain built to support the widespread use of blockcha")
    (description "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience.")
    (home-page "https://aptos.dev")
    (license license:asl2.0)))

;;; advanced-linux-system-cleaning --- advanced system cleaning and privacy
(define-public advanced-linux-system-cleaning
  (package
    (name "advanced-linux-system-cleaning")
    (version "1.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SeryogaBrigada/AdvancedLinuxSystemCleaning/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "advanced system cleaning and privacy")
    (description "Advanced system cleaning and privacy.")
    (home-page "https://github.com/SeryogaBrigada/AdvancedLinuxSystemCleaning")
    (license license:expat)))

;;; mcuxpresso-config-tools --- integrated suite of configuration tools for NXP's microcontrollers. From BIN 
(define-public mcuxpresso-config-tools
  (package
    (name "mcuxpresso-config-tools")
    (version "25.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mcuxpresso-config-tools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "integrated suite of configuration tools for NXP's microcontrollers. From BIN ")
    (description "Integrated suite of configuration tools for NXP's microcontrollers. From BIN package distributed by NXP.")
    (home-page "http://www.nxp.com/products/software-and-tools/run-time-software/mcuxpresso-software-and-tools/mcuxpresso-config-tools:MCUXpresso-Config-Tools")
    (license license:nonfree)))

;;; cinnamon-6-2-theme --- this theme preserves the default theme from Cinnamon 6.2 for the Cinnamon des
(define-public cinnamon-6-2-theme
  (package
    (name "cinnamon-6.2-theme")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/username227/Cinnamon-6.2-theme/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "this theme preserves the default theme from Cinnamon 6.2 for the Cinnamon des")
    (description "This theme preserves the default theme from Cinnamon 6.2 for the Cinnamon desktop.")
    (home-page "https://github.com/username227/Cinnamon-6.2-theme")
    (license license:nonfree)))

;;; 4kyoutubetomp3 --- extract audio from YouTube, Vimeo, Facebook and other online video hosting se
(define-public 4kyoutubetomp3
  (package
    (name "4kyoutubetomp3")
    (version "26.0.2.0282")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/4kyoutubetomp3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "extract audio from YouTube, Vimeo, Facebook and other online video hosting se")
    (description "Extract audio from YouTube, Vimeo, Facebook and other online video hosting services.")
    (home-page "https://www.4kdownload.com/products/product-youtubetomp3")
    (license license:nonfree)))

;;; xerox-phaser-3320 --- CUPS driver for the Xerox Phaser 3320 series. Also supports Phaser 3117, 3140
(define-public xerox-phaser-3320
  (package
    (name "xerox-phaser-3320")
    (version "4.01.06")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xerox-phaser-3320.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CUPS driver for the Xerox Phaser 3320 series. Also supports Phaser 3117, 3140")
    (description "CUPS driver for the Xerox Phaser 3320 series. Also supports Phaser 3117, 3140, 3160, 3200, 3250, 3250, 3300, 3435, 3600, 6110, WorkCentre 3210, 3220, 3315, 3325, 3550, 4118, PE120, PE220, FaxCentre 2218.")
    (home-page "https://www.support.xerox.com/en-us/product/phaser-3320/downloads")
    (license license:nonfree)))
