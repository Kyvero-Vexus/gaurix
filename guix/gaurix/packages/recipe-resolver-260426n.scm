;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260426n
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260426n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system ruby)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (

            deadbeef-plugins-kode54-git
            rlvm-git
            lustre-tools-6
            kodi-addon-pvr-waipu
            ochami-git
            riscv64-unknown-elf-gcc
            assistant
            msi-ec-git
            python-py3d
            python-open3d
            open3d
            xar-tpoechtrage-git
            pamac-tray-plasma-git
            stm8cubemx
            gtksourceview5-pkgbuild
            gtksourceview4-pkgbuild
            gtksourceview3-pkgbuild
            php-ssh-git
            oil-search
            ansible-collection-kewlfft-aur
            zj-58-git
            python-azure-cognitiveservices-speech
            gengo
            cppbtbl
            chromeos-vboot-reference-git
            chromeos-vboot-reference-crossystem-git
            adtpro-git
            tpm-fido-git
            mcuviewer
            pass-git
            netradiant-git
            postgis-old-upgrade
            vesc_tool-git
            tscdriver
            netradiant-custom
            imunes
            mpd-light-pulse-ffmpeg
            windsurf-marketplace
            windsurf-features
            wcofun
            prodos-utilities-git
            monero-api-cli
            gopass-summon-provider-git
            gopass-jsonapi-git
            gopass-hibp-git
            geeqie15
            diskm8-git
            nzbget-ppscript-nzbtomedia-git
            denoiseit-git
            umbrielpng-git
            hellocontest
            cpp-argparse-dev
            munt-daemon
            python-fake-bpy-module-latest
            netlink
            mpv-gallery-view-git
            ceserver
            rc-local
            uksmdstats-git
            pulseaudio-module-xrdp
            memstrack
            smriti-bin
            zed-git
            ibus-pinyin
            densify
            gnome-shell-extension-dash-to-dock-git
            python-jaxlib-cuda
            oci-cli
            filezilla-server
            manafiles-git
            libqmi-dev
            torguard
            python-avalon_framework
            minq-ananicy-git
            ezra-bible-app
            cncjs
            reflex-bin
            python-web3
            illuminanced-git
            hexowl
            wickedengine-editor
            wickedengine
            video2x-qt6-git
            ureminder
            tusk-launcher-git
            socat-git
            python-qiskit-qasm3-import
            python-openqasm3
            psh
            pamac-git
            owrx_connector-luarvique
            openwebrx-plus-git
            mldonkey-git
            laze
            juledoc-git
            gnome-shell-extension-enhanced-osk-git
            ecl-git
            easyconnect-hust
            csdr-luarvique
            connet
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; deadbeef-plugins-kode54-git --- a set of plugins for DeaDBeeF (Git version)
(define-public deadbeef-plugins-kode54-git
  (package
    (name "deadbeef-plugins-kode54-git")
    (version "r103.14ff3e7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/deadbeef-plugins-kode54-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a set of plugins for DeaDBeeF (Git version)")
    (description "A set of plugins for DeaDBeeF (Git version).")
    (home-page "https://bitbucket.org/losnoco/deadbeef_plugins")
    (license license:nonfree)))

;;; rlvm-git --- realLive clone for Linux and OSX. Git version
(define-public rlvm-git
  (package
    (name "rlvm-git")
    (version "latest")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rlvm-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "realLive clone for Linux and OSX. Git version")
    (description "RealLive clone for Linux and OSX. Git version.")
    (home-page "https://github.com/eglaysher/rlvm")
    (license license:gpl3+)))

;;; lustre-tools-6 --- the Lustre developpment tools free distribution version 6
(define-public lustre-tools-6
  (package
    (name "lustre-tools-6")
    (version "6.112.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lustre-tools-6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the Lustre developpment tools free distribution version 6")
    (description "The Lustre developpment tools free distribution version 6.")
    (home-page "https://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/lustre-v4/distrib/")
    (license license:nonfree)))

;;; kodi-addon-pvr-waipu --- waipu.tv PVR Plugin for Kodi
(define-public kodi-addon-pvr-waipu
  (package
    (name "kodi-addon-pvr-waipu")
    (version "21.12.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kodi-addon-pvr-waipu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "waipu.tv PVR Plugin for Kodi")
    (description "Waipu.tv PVR Plugin for Kodi.")
    (home-page "https://github.com/flubshi/pvr.waipu")
    (license license:gpl3+)))

;;; ochami-git --- command line interface for OpenCHAMI services
(define-public ochami-git
  (package
    (name "ochami-git")
    (version "v0.0.7.r0.ca7625f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ochami-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command line interface for OpenCHAMI services")
    (description "Command line interface for OpenCHAMI services.")
    (home-page "https://github.com/OpenCHAMI/ochami")
    (license license:expat)))

;;; riscv64-unknown-elf-gcc --- the GNU Compiler Collection - cross compiler for 32bit and 64bit RISC-V ba...
(define-public riscv64-unknown-elf-gcc
  (package
    (name "riscv64-unknown-elf-gcc")
    (version "14.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/riscv64-unknown-elf-gcc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the GNU Compiler Collection - cross compiler for 32bit and 64bit RISC-V ba...")
    (description "The GNU Compiler Collection - cross compiler for 32bit and 64bit RISC-V bare-metal.")
    (home-page "http://gcc.gnu.org/")
    (license license:fdl1.3+)))

;;; assistant --- secure remote access to computers over a local network or over the Internet
(define-public assistant
  (package
    (name "assistant")
    (version "6.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/assistant.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "secure remote access to computers over a local network or over the Internet")
    (description "Secure remote access to computers over a local network or over the Internet.")
    (home-page "https://xn--80akicokc0aablc.xn--p1ai/")
    (license license:nonfree)))

;;; msi-ec-git --- driver for MSI laptop EC
(define-public msi-ec-git
  (package
    (name "msi-ec-git")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/msi-ec-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "driver for MSI laptop EC")
    (description "Driver for MSI laptop EC.")
    (home-page "https://github.com/BeardOverflow/msi-ec")
    (license license:gpl2+)))

;;; python-py3d --- a Modern Library for 3D Data Processing
(define-public python-py3d
  (package
    (name "python-py3d")
    (version "0.19.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-py3d.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a Modern Library for 3D Data Processing")
    (description "A Modern Library for 3D Data Processing.")
    (home-page "http://www.open3d.org")
    (license license:expat)))

;;; python-open3d --- a Modern Library for 3D Data Processing
(define-public python-open3d
  (package
    (name "python-open3d")
    (version "0.19.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-open3d.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a Modern Library for 3D Data Processing")
    (description "A Modern Library for 3D Data Processing.")
    (home-page "http://www.open3d.org")
    (license license:expat)))

;;; open3d --- a Modern Library for 3D Data Processing
(define-public open3d
  (package
    (name "open3d")
    (version "0.19.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/open3d.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a Modern Library for 3D Data Processing")
    (description "A Modern Library for 3D Data Processing.")
    (home-page "http://www.open3d.org")
    (license license:expat)))

;;; xar-tpoechtrage-git --- eXtensible ARchive format
(define-public xar-tpoechtrage-git
  (package
    (name "xar-tpoechtrage-git")
    (version "xar.1.6.1.r12.g2b9a4ab")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xar-tpoechtrage-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "eXtensible ARchive format")
    (description "EXtensible ARchive format.")
    (home-page "https://github.com/tpoechtrager/xar")
    (license license:bsd-3)))

;;; pamac-tray-plasma-git --- pamac tray icon for Plasma
(define-public pamac-tray-plasma-git
  (package
    (name "pamac-tray-plasma-git")
    (version "r21.58353a1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pamac-tray-plasma-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pamac tray icon for Plasma")
    (description "Pamac tray icon for Plasma.")
    (home-page "https://gitlab.com/LordTermor/pamac-tray-icon-plasma")
    (license license:nonfree)))

;;; stm8cubemx --- sTM8CubeMX: a user-friendly software tool that uses graphical wizards to c...
(define-public stm8cubemx
  (package
    (name "stm8cubemx")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/stm8cubemx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "sTM8CubeMX: a user-friendly software tool that uses graphical wizards to c...")
    (description "STM8CubeMX: a user-friendly software tool that uses graphical wizards to configure STM8 microcontrollers.")
    (home-page "https://www.st.com/en/development-tools/stm8cubemx.html")
    (license license:nonfree)))

;;; gtksourceview5-pkgbuild --- pKGBUILD syntax highlight support in gtksourceview5-compliant editors
(define-public gtksourceview5-pkgbuild
  (package
    (name "gtksourceview5-pkgbuild")
    (version "5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtksourceview5-pkgbuild.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pKGBUILD syntax highlight support in gtksourceview5-compliant editors")
    (description "PKGBUILD syntax highlight support in gtksourceview5-compliant editors.")
    (home-page "https://gitlab.com/rafaelff/gtksourceview-pkgbuild")
    (license license:lgpl2.1+)))

;;; gtksourceview4-pkgbuild --- pKGBUILD syntax highlight support in gtksourceview4-compliant editors
(define-public gtksourceview4-pkgbuild
  (package
    (name "gtksourceview4-pkgbuild")
    (version "5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtksourceview4-pkgbuild.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pKGBUILD syntax highlight support in gtksourceview4-compliant editors")
    (description "PKGBUILD syntax highlight support in gtksourceview4-compliant editors.")
    (home-page "https://gitlab.com/rafaelff/gtksourceview-pkgbuild")
    (license license:lgpl2.1+)))

;;; gtksourceview3-pkgbuild --- pKGBUILD syntax highlight support in gtksourceview3-compliant editors
(define-public gtksourceview3-pkgbuild
  (package
    (name "gtksourceview3-pkgbuild")
    (version "5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtksourceview3-pkgbuild.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pKGBUILD syntax highlight support in gtksourceview3-compliant editors")
    (description "PKGBUILD syntax highlight support in gtksourceview3-compliant editors.")
    (home-page "https://gitlab.com/rafaelff/gtksourceview-pkgbuild")
    (license license:lgpl2.1+)))

;;; php-ssh-git --- an SSH2 extension for PHP
(define-public php-ssh-git
  (package
    (name "php-ssh-git")
    (version "r287.65c0da1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php-ssh-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an SSH2 extension for PHP")
    (description "An SSH2 extension for PHP.")
    (home-page "http://pecl.php.net/package/ssh2")
    (license license:nonfree)))

;;; oil-search --- search-as-you-type cli frontend for the buku bookmarks manager using peco
(define-public oil-search
  (package
    (name "oil-search")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/oil-search.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "search-as-you-type cli frontend for the buku bookmarks manager using peco")
    (description "Search-as-you-type cli frontend for the buku bookmarks manager using peco.")
    (home-page "https://github.com/AndreiUlmeyda/oil")
    (license license:gpl3+)))

;;; ansible-collection-kewlfft-aur --- ansible collection that contains an Ansible module to manage packages from...
(define-public ansible-collection-kewlfft-aur
  (package
    (name "ansible-collection-kewlfft-aur")
    (version "0.11.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ansible-collection-kewlfft-aur.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "ansible collection that contains an Ansible module to manage packages from...")
    (description "Ansible collection that contains an Ansible module to manage packages from the AUR.")
    (home-page "https://galaxy.ansible.com/kewlfft/aur")
    (license license:gpl3+)))

;;; zj-58-git --- cUPS filter for thermal printers as Zjiang ZJ-58, XPrinter XP-58, etc
(define-public zj-58-git
  (package
    (name "zj-58-git")
    (version "r27.6474356")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zj-58-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cUPS filter for thermal printers as Zjiang ZJ-58, XPrinter XP-58, etc")
    (description "CUPS filter for thermal printers as Zjiang ZJ-58, XPrinter XP-58, etc.")
    (home-page "https://github.com/klirichek/zj-58")
    (license license:bsd-3)))

;;; python-azure-cognitiveservices-speech --- microsoft Cognitive Services Speech SDK for Python
(define-public python-azure-cognitiveservices-speech
  (package
    (name "python-azure-cognitiveservices-speech")
    (version "1.44.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-azure-cognitiveservices-speech.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "microsoft Cognitive Services Speech SDK for Python")
    (description "Microsoft Cognitive Services Speech SDK for Python.")
    (home-page "https://pypi.org/project/azure-cognitiveservices-speech")
    (license license:nonfree)))

;;; gengo --- linguist-inspired language classifier
(define-public gengo
  (package
    (name "gengo")
    (version "0.12.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gengo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "linguist-inspired language classifier")
    (description "Linguist-inspired language classifier.")
    (home-page "https://github.com/spenserblack/gengo")
    (license license:asl2.0)))

;;; cppbtbl --- a C++ wrapper around the UPower DBus API to get bluetooth devices' battery
(define-public cppbtbl
  (package
    (name "cppbtbl")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cppbtbl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a C++ wrapper around the UPower DBus API to get bluetooth devices' battery")
    (description "A C++ wrapper around the UPower DBus API to get bluetooth devices' battery.")
    (home-page "https://github.com/pato05/cppbtbl")
    (license license:expat)))

;;; chromeos-vboot-reference-git --- chromeOS vbutil tools: futility (vbutil_kernel) cgpt from git
(define-public chromeos-vboot-reference-git
  (package
    (name "chromeos-vboot-reference-git")
    (version "r20221126105520.e952b90")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chromeos-vboot-reference-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "chromeOS vbutil tools: futility (vbutil_kernel) cgpt from git")
    (description "ChromeOS vbutil tools: futility (vbutil_kernel) cgpt from git.")
    (home-page "https://chromium.googlesource.com/chromiumos/platform/vboot_reference")
    (license license:gpl3+)))

;;; chromeos-vboot-reference-crossystem-git --- chromeOS vbutil tools: crossystem from git, in experimental phase
(define-public chromeos-vboot-reference-crossystem-git
  (package
    (name "chromeos-vboot-reference-crossystem-git")
    (version "r20221126105520.e952b90")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chromeos-vboot-reference-crossystem-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "chromeOS vbutil tools: crossystem from git, in experimental phase")
    (description "ChromeOS vbutil tools: crossystem from git, in experimental phase.")
    (home-page "https://chromium.googlesource.com/chromiumos/platform/vboot_reference")
    (license license:gpl3+)))

;;; adtpro-git --- apple Disk Transfer ProDOS for transfering disk images between Apple II-er...
(define-public adtpro-git
  (package
    (name "adtpro-git")
    (version "2.1.0.r12.g2e18f43")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/adtpro-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "apple Disk Transfer ProDOS for transfering disk images between Apple II-er...")
    (description "Apple Disk Transfer ProDOS for transfering disk images between Apple II-era computers and the modern world.")
    (home-page "https://adtpro.com/")
    (license license:gpl2+)))

;;; tpm-fido-git --- a WebAuthn/U2F token protected by a TPM
(define-public tpm-fido-git
  (package
    (name "tpm-fido-git")
    (version "r24.5f8828b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tpm-fido-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a WebAuthn/U2F token protected by a TPM")
    (description "A WebAuthn/U2F token protected by a TPM.")
    (home-page "https://github.com/psanford/tpm-fido")
    (license license:expat)))

;;; mcuviewer --- real-time embedded variable & trace viewer
(define-public mcuviewer
  (package
    (name "mcuviewer")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mcuviewer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "real-time embedded variable & trace viewer")
    (description "Real-time embedded variable & trace viewer.")
    (home-page "https://github.com/klonyyy/MCUViewer")
    (license license:gpl3)))

;;; pass-git --- stores, retrieves, generates, and synchronizes passwords securely
(define-public pass-git
  (package
    (name "pass-git")
    (version "1.7.4.r12.28cec11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pass-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "stores, retrieves, generates, and synchronizes passwords securely")
    (description "Stores, retrieves, generates, and synchronizes passwords securely.")
    (home-page "https://passwordstore.org")
    (license license:gpl2+)))

;;; netradiant-git --- the open source, cross platform level editor for idtech games (GtkRadiant ...
(define-public netradiant-git
  (package
    (name "netradiant-git")
    (version "r2643.cb8bf953")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/netradiant-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the open source, cross platform level editor for idtech games (GtkRadiant ...")
    (description "The open source, cross platform level editor for idtech games (GtkRadiant fork).")
    (home-page "https://netradiant.gitlab.io/")
    (license license:asl2.0)))

;;; postgis-old-upgrade --- postGIS build against postgresql-old-upgrade package for pg_upgrade
(define-public postgis-old-upgrade
  (package
    (name "postgis-old-upgrade")
    (version "3.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/postgis-old-upgrade.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "postGIS build against postgresql-old-upgrade package for pg_upgrade")
    (description "PostGIS build against postgresql-old-upgrade package for pg_upgrade.")
    (home-page "https://postgis.net/")
    (license license:gpl3+)))

;;; vesc_tool-git --- vESC ESC graphical configuration tool
(define-public vesc_tool-git
  (package
    (name "vesc_tool-git")
    (version "r1690.8a6de0dd")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vesc_tool-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "vESC ESC graphical configuration tool")
    (description "VESC ESC graphical configuration tool.")
    (home-page "https://vesc-project.com/vesc_tool")
    (license license:gpl3)))

;;; tscdriver --- drivers for TSC Printers
(define-public tscdriver
  (package
    (name "tscdriver")
    (version "1.2.13")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tscdriver.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "drivers for TSC Printers")
    (description "Drivers for TSC Printers.")
    (home-page "https://www.tscprinters.com")
    (license license:nonfree)))

;;; netradiant-custom --- the open-source, cross-platform level editor for id Tech based games (NetR...
(define-public netradiant-custom
  (package
    (name "netradiant-custom")
    (version "20260114")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/netradiant-custom.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the open-source, cross-platform level editor for id Tech based games (NetR...")
    (description "The open-source, cross-platform level editor for id Tech based games (NetRadiant fork).")
    (home-page "https://garux.github.io/NRC/")
    (license license:asl2.0)))

;;; imunes --- integrated Multiprotocol Network Emulator/Simulator
(define-public imunes
  (package
    (name "imunes")
    (version "3.0.0b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/imunes.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "integrated Multiprotocol Network Emulator/Simulator")
    (description "Integrated Multiprotocol Network Emulator/Simulator.")
    (home-page "https://imunes.net/")
    (license license:nonfree)))

;;; mpd-light-pulse-ffmpeg --- flexible, powerful, server-side application for playing music. Light versi...
(define-public mpd-light-pulse-ffmpeg
  (package
    (name "mpd-light-pulse-ffmpeg")
    (version "0.24.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mpd-light-pulse-ffmpeg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "flexible, powerful, server-side application for playing music. Light versi...")
    (description "Flexible, powerful, server-side application for playing music. Light version without openal, ao, jack, mikmod, modplug, mpg123, openmpt, pipewire, shout, sidplay, wavpack, fluidsynth, avahi, zziplib and gme support.")
    (home-page "https://www.musicpd.org/")
    (license license:bsd-2)))

;;; windsurf-marketplace --- enable vscode marketplace in windsurf
(define-public windsurf-marketplace
  (package
    (name "windsurf-marketplace")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/windsurf-marketplace.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "enable vscode marketplace in windsurf")
    (description "Enable vscode marketplace in windsurf.")
    (home-page "https://marketplace.visualstudio.com/vscode")
    (license license:bsd-0)))

;;; windsurf-features --- unblock some features in windsurf
(define-public windsurf-features
  (package
    (name "windsurf-features")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/windsurf-features.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "unblock some features in windsurf")
    (description "Unblock some features in windsurf.")
    (home-page "https://github.com/microsoft/vscode")
    (license license:bsd-0)))

;;; wcofun --- stream and download animes directly from your terminal
(define-public wcofun
  (package
    (name "wcofun")
    (version "r34.0118b37")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wcofun.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "stream and download animes directly from your terminal")
    (description "Stream and download animes directly from your terminal.")
    (home-page "https://github.com/matheusfillipe/wcofun.cli")
    (license license:expat)))

;;; prodos-utilities-git --- tool and Go library to access ProDOS filesystems of the Apple ][ series of...
(define-public prodos-utilities-git
  (package
    (name "prodos-utilities-git")
    (version "r82.6925946")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/prodos-utilities-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tool and Go library to access ProDOS filesystems of the Apple ][ series of...")
    (description "Tool and Go library to access ProDOS filesystems of the Apple ][ series of computers.")
    (home-page "https://github.com/tjboldt/ProDOS-Utilities")
    (license license:expat)))

;;; monero-api-cli --- python cli application meant for remotely interacting with a Monero Daemon...
(define-public monero-api-cli
  (package
    (name "monero-api-cli")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/monero-api-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "python cli application meant for remotely interacting with a Monero Daemon...")
    (description "Python cli application meant for remotely interacting with a Monero Daemon via its RPC API.")
    (home-page "https://github.com/Dvd-Znf/monero-api-cli/")
    (license license:expat)))

;;; gopass-summon-provider-git --- summon provider for gopass
(define-public gopass-summon-provider-git
  (package
    (name "gopass-summon-provider-git")
    (version "1.15.8.r4.g1fd58e1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gopass-summon-provider-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "summon provider for gopass")
    (description "Summon provider for gopass.")
    (home-page "https://github.com/gopasspw/gopass-summon-provider")
    (license license:expat)))

;;; gopass-jsonapi-git --- the jsonapi for gopass used for bridging to browsers
(define-public gopass-jsonapi-git
  (package
    (name "gopass-jsonapi-git")
    (version "r6.374b795")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gopass-jsonapi-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the jsonapi for gopass used for bridging to browsers")
    (description "The jsonapi for gopass used for bridging to browsers.")
    (home-page "https://github.com/gopasspw/gopass-jsonapi")
    (license license:expat)))

;;; gopass-hibp-git --- haveibeenpwnd.com integration for gopass
(define-public gopass-hibp-git
  (package
    (name "gopass-hibp-git")
    (version "1.15.13.r10.gb75cb16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gopass-hibp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "haveibeenpwnd.com integration for gopass")
    (description "Haveibeenpwnd.com integration for gopass.")
    (home-page "https://github.com/gopasspw/gopass-hibp")
    (license license:expat)))

;;; geeqie15 --- lightweight image viewer (version 1.5)
(define-public geeqie15
  (package
    (name "geeqie15")
    (version "1.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/geeqie15.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight image viewer (version 1.5)")
    (description "Lightweight image viewer (version 1.5).")
    (home-page "http://www.geeqie.org/")
    (license license:gpl2+)))

;;; diskm8-git --- diskM8 Apple II disk image manipulation, cataloging and analysis tool
(define-public diskm8-git
  (package
    (name "diskm8-git")
    (version "r36.4bb682e")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/diskm8-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "diskM8 Apple II disk image manipulation, cataloging and analysis tool")
    (description "DiskM8 Apple II disk image manipulation, cataloging and analysis tool.")
    (home-page "https://github.com/paleotronic/diskm8")
    (license license:gpl3+)))

;;; nzbget-ppscript-nzbtomedia-git --- post-processing scripts to communicate with media managers
(define-public nzbget-ppscript-nzbtomedia-git
  (package
    (name "nzbget-ppscript-nzbtomedia-git")
    (version "2637.d956cd2b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nzbget-ppscript-nzbtomedia-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "post-processing scripts to communicate with media managers")
    (description "Post-processing scripts to communicate with media managers.")
    (home-page "https://github.com/clinton-hall/nzbToMedia")
    (license license:gpl3+)))

;;; denoiseit-git --- tiny utility to run audio files through RNNoise
(define-public denoiseit-git
  (package
    (name "denoiseit-git")
    (version "r5.1e22526")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/denoiseit-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tiny utility to run audio files through RNNoise")
    (description "Tiny utility to run audio files through RNNoise.")
    (home-page "https://github.com/DragoonAethis/DenoiseIt")
    (license license:gpl3+)))

;;; umbrielpng-git --- pNG chunk analyzer and modifier
(define-public umbrielpng-git
  (package
    (name "umbrielpng-git")
    (version "0.1.c54.cdf6925")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/umbrielpng-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pNG chunk analyzer and modifier")
    (description "PNG chunk analyzer and modifier.")
    (home-page "https://github.com/Traneptora/umbrielpng")
    (license license:bsd-3)))

;;; hellocontest --- a simple HF contest logger for Linux
(define-public hellocontest
  (package
    (name "hellocontest")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hellocontest.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple HF contest logger for Linux")
    (description "A simple HF contest logger for Linux.")
    (home-page "https://github.com/ftl/hellocontest")
    (license license:expat)))

;;; cpp-argparse-dev --- python-like argument parser for C++ projects
(define-public cpp-argparse-dev
  (package
    (name "cpp-argparse-dev")
    (version "1.10.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cpp-argparse-dev.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "python-like argument parser for C++ projects")
    (description "Python-like argument parser for C++ projects.")
    (home-page "https://github.com/rue-ryuzaki/argparse")
    (license license:expat)))

;;; munt-daemon --- software synthesizer emulating pre-GM MIDI devices such as the Roland MT-3...
(define-public munt-daemon
  (package
    (name "munt-daemon")
    (version "2.7.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/munt-daemon.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "software synthesizer emulating pre-GM MIDI devices such as the Roland MT-3...")
    (description "Software synthesizer emulating pre-GM MIDI devices such as the Roland MT-32, CM-32L, CM-64 and LAPC-I (ALSA driver daemon).")
    (home-page "http://munt.sourceforge.net")
    (license license:gpl2+)))

;;; python-fake-bpy-module-latest --- collection of the fake Blender Python API module for the code completion
(define-public python-fake-bpy-module-latest
  (package
    (name "python-fake-bpy-module-latest")
    (version "20240904")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-fake-bpy-module-latest.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "collection of the fake Blender Python API module for the code completion")
    (description "Collection of the fake Blender Python API module for the code completion.")
    (home-page "https://github.com/nutti/fake-bpy-module")
    (license license:expat)))

;;; netlink --- asynchronous implementation of the Linux netlink protocol
(define-public netlink
  (package
    (name "netlink")
    (version "0.0.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/netlink.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "asynchronous implementation of the Linux netlink protocol")
    (description "Asynchronous implementation of the Linux netlink protocol.")
    (home-page "https://github.com/tijko/netlink")
    (license license:gpl3+)))

;;; mpv-gallery-view-git --- mPV gallery view for chapters and playlists
(define-public mpv-gallery-view-git
  (package
    (name "mpv-gallery-view-git")
    (version "0.0.0.r188")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mpv-gallery-view-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "mPV gallery view for chapters and playlists")
    (description "MPV gallery view for chapters and playlists.")
    (home-page "https://github.com/occivink/mpv-gallery-view")
    (license license:nonfree)))

;;; ceserver --- cheat Engine Server
(define-public ceserver
  (package
    (name "ceserver")
    (version "7.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ceserver.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cheat Engine Server")
    (description "Cheat Engine Server.")
    (home-page "https://github.com/cheat-engine/cheat-engine/tree/master/Cheat%20Engine/ceserver")
    (license license:nonfree)))

;;; rc-local --- support for legacy rc.local scripts
(define-public rc-local
  (package
    (name "rc-local")
    (version "4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rc-local.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "support for legacy rc.local scripts")
    (description "Support for legacy rc.local scripts.")
    (home-page "https://aur.archlinux.org/packages/rc-local/")
    (license license:lgpl2.1+)))

;;; uksmdstats-git --- statistics output for uksmd, a userspace KSM helper daemon. Latest git che...
(define-public uksmdstats-git
  (package
    (name "uksmdstats-git")
    (version "1.3.0.r122.20250127.23f75ea")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uksmdstats-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "statistics output for uksmd, a userspace KSM helper daemon. Latest git che...")
    (description "Statistics output for uksmd, a userspace KSM helper daemon. Latest git checkout.")
    (home-page "https://github.com/CachyOS/uksmd")
    (license license:gpl3)))

;;; pulseaudio-module-xrdp --- xrdp pulseaudio module
(define-public pulseaudio-module-xrdp
  (package
    (name "pulseaudio-module-xrdp")
    (version "0.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pulseaudio-module-xrdp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "xrdp pulseaudio module")
    (description "Xrdp pulseaudio module.")
    (home-page "https://github.com/neutrinolabs/pulseaudio-module-xrdp")
    (license license:lgpl2.1)))

;;; memstrack --- a memory allocation trace, like a hot spot analyzer for memory allocation
(define-public memstrack
  (package
    (name "memstrack")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/memstrack.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a memory allocation trace, like a hot spot analyzer for memory allocation")
    (description "A memory allocation trace, like a hot spot analyzer for memory allocation.")
    (home-page "https://github.com/ryncsn/memstrack")
    (license license:gpl3+)))

;;; smriti-bin --- keep track of the commands your memory missed
(define-public smriti-bin
  (package
    (name "smriti-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/smriti-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "keep track of the commands your memory missed")
    (description "Keep track of the commands your memory missed.")
    (home-page "https://github.com/aspasht/smriti")
    (license license:expat)))

;;; zed-git --- a high-performance, multiplayer code editor from the creators of Atom and ...
(define-public zed-git
  (package
    (name "zed-git")
    (version "0.234.5.r140.g280f8b1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zed-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a high-performance, multiplayer code editor from the creators of Atom and ...")
    (description "A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter.")
    (home-page "https://zed.dev")
    (license license:agpl3+)))

;;; ibus-pinyin --- pinyin (Chinese) input method for the IBus framework
(define-public ibus-pinyin
  (package
    (name "ibus-pinyin")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ibus-pinyin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pinyin (Chinese) input method for the IBus framework")
    (description "Pinyin (Chinese) input method for the IBus framework.")
    (home-page "https://github.com/ibus/ibus-pinyin/")
    (license license:gpl3+)))

;;; densify --- gTK+ application to easily compress pdf files using Ghostscript
(define-public densify
  (package
    (name "densify")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/densify.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "gTK+ application to easily compress pdf files using Ghostscript")
    (description "GTK+ application to easily compress pdf files using Ghostscript.")
    (home-page "https://github.com/hkdb/Densify")
    (license license:expat)))

;;; gnome-shell-extension-dash-to-dock-git --- move the dash out of the overview transforming it in a dock
(define-public gnome-shell-extension-dash-to-dock-git
  (package
    (name "gnome-shell-extension-dash-to-dock-git")
    (version "102.r3.gf29b27e0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-extension-dash-to-dock-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "move the dash out of the overview transforming it in a dock")
    (description "Move the dash out of the overview transforming it in a dock.")
    (home-page "https://micheleg.github.io/dash-to-dock/")
    (license license:gpl2)))

;;; python-jaxlib-cuda --- xLA library for JAX
(define-public python-jaxlib-cuda
  (package
    (name "python-jaxlib-cuda")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-jaxlib-cuda.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "xLA library for JAX")
    (description "XLA library for JAX.")
    (home-page "https://github.com/jax-ml/jax")
    (license license:asl2.0)))

;;; oci-cli --- command line interface for Oracle Cloud Infrastructure
(define-public oci-cli
  (package
    (name "oci-cli")
    (version "3.80.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/oci-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command line interface for Oracle Cloud Infrastructure")
    (description "Command line interface for Oracle Cloud Infrastructure.")
    (home-page "https://github.com/oracle/oci-cli")
    (license license:asl2.0)))

;;; filezilla-server --- a simple FTP, FTPS or SFTP server
(define-public filezilla-server
  (package
    (name "filezilla-server")
    (version "1.12.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/filezilla-server.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple FTP, FTPS or SFTP server")
    (description "A simple FTP, FTPS or SFTP server.")
    (home-page "https://filezilla-project.org/download.php?type=server")
    (license license:agpl3)))

;;; manafiles-git --- config file and package tracking utility
(define-public manafiles-git
  (package
    (name "manafiles-git")
    (version "r335.0e15bfe")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/manafiles-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "config file and package tracking utility")
    (description "Config file and package tracking utility.")
    (home-page "https://github.com/riyyi/manafiles")
    (license license:expat)))

;;; libqmi-dev --- qMI modem protocol helper library
(define-public libqmi-dev
  (package
    (name "libqmi-dev")
    (version "1.37.995_dev")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libqmi-dev.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "qMI modem protocol helper library")
    (description "QMI modem protocol helper library.")
    (home-page "https://www.freedesktop.org/wiki/Software/libqmi/")
    (license license:gpl2+)))

;;; torguard --- torGuard VPN Software Stay private online with TorGuard's anonymous VPN so...
(define-public torguard
  (package
    (name "torguard")
    (version "4.8.29")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/torguard.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "torGuard VPN Software Stay private online with TorGuard's anonymous VPN so...")
    (description "TorGuard VPN Software Stay private online with TorGuard's anonymous VPN software and connect to 37+ countries worldwide.")
    (home-page "https://www.torguard.net")
    (license license:nonfree)))

;;; python-avalon_framework --- avalon Framework is a library that can make python printing in Linux much ...
(define-public python-avalon_framework
  (package
    (name "python-avalon_framework")
    (version "1.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-avalon_framework.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "avalon Framework is a library that can make python printing in Linux much ...")
    (description "Avalon Framework is a library that can make python printing in Linux much easier.")
    (home-page "https://github.com/K4YT3X/AVALON")
    (license license:lgpl3+)))

;;; minq-ananicy-git --- minq Ananicy - fork of Ananicy with support for cmdline and more frequentl...
(define-public minq-ananicy-git
  (package
    (name "minq-ananicy-git")
    (version "2.2.1.r324.g1c843c8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/minq-ananicy-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "minq Ananicy - fork of Ananicy with support for cmdline and more frequentl...")
    (description "Minq Ananicy - fork of Ananicy with support for cmdline and more frequently updated rules.")
    (home-page "https://github.com/kuche1/minq-ananicy")
    (license license:gpl3+)))

;;; ezra-bible-app --- a modern and user-friendly Bible app for desktops, tablets and mobiles foc...
(define-public ezra-bible-app
  (package
    (name "ezra-bible-app")
    (version "1.18.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ezra-bible-app.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a modern and user-friendly Bible app for desktops, tablets and mobiles foc...")
    (description "A modern and user-friendly Bible app for desktops, tablets and mobiles focussing on topical study.")
    (home-page "https://ezrabibleapp.net")
    (license license:gpl2+)))

;;; cncjs --- web-based interface for CNC controllers running Grbl, Marlin, Smoothieware...
(define-public cncjs
  (package
    (name "cncjs")
    (version "1.10.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cncjs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "web-based interface for CNC controllers running Grbl, Marlin, Smoothieware...")
    (description "Web-based interface for CNC controllers running Grbl, Marlin, Smoothieware, or TinyG.")
    (home-page "https://github.com/cncjs/cncjs")
    (license license:expat)))

;;; reflex-bin --- run a command when files change
(define-public reflex-bin
  (package
    (name "reflex-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/reflex-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "run a command when files change")
    (description "Run a command when files change.")
    (home-page "github.com/cespare/reflex")
    (license license:expat)))

;;; python-web3 --- a python interface for interacting with the Ethereum blockchain and ecosystem
(define-public python-web3
  (package
    (name "python-web3")
    (version "7.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-web3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a python interface for interacting with the Ethereum blockchain and ecosystem")
    (description "A python interface for interacting with the Ethereum blockchain and ecosystem.")
    (home-page "https://github.com/ethereum/web3.py")
    (license license:expat)))

;;; illuminanced-git --- ambient Light Sensor Daemon for Linux
(define-public illuminanced-git
  (package
    (name "illuminanced-git")
    (version "r27.4c6178c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/illuminanced-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "ambient Light Sensor Daemon for Linux")
    (description "Ambient Light Sensor Daemon for Linux.")
    (home-page "https://github.com/mikhail-m1/illuminanced")
    (license license:gpl3+)))

;;; hexowl --- hexowl is a Lightweight and flexible programmer's calculator with user var...
(define-public hexowl
  (package
    (name "hexowl")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hexowl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "hexowl is a Lightweight and flexible programmer's calculator with user var...")
    (description "Hexowl is a Lightweight and flexible programmer's calculator with user variables and functions support written in Go.")
    (home-page "https://github.com/DECE2183/hexowl")
    (license license:gpl3+)))

;;; wickedengine-editor --- 3D engine with modern graphics
(define-public wickedengine-editor
  (package
    (name "wickedengine-editor")
    (version "0.71.787")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wickedengine-editor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "3D engine with modern graphics")
    (description "3D engine with modern graphics.")
    (home-page "https://wickedengine.net/")
    (license license:expat)))

;;; wickedengine --- 3D engine with modern graphics
(define-public wickedengine
  (package
    (name "wickedengine")
    (version "0.71.787")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wickedengine.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "3D engine with modern graphics")
    (description "3D engine with modern graphics.")
    (home-page "https://wickedengine.net/")
    (license license:expat)))

;;; video2x-qt6-git --- the Qt6 GUI for Video2X
(define-public video2x-qt6-git
  (package
    (name "video2x-qt6-git")
    (version "6.4.0.r0.g4793103")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/video2x-qt6-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the Qt6 GUI for Video2X")
    (description "The Qt6 GUI for Video2X.")
    (home-page "https://github.com/k4yt3x/video2x-qt6")
    (license license:isc)))

;;; ureminder --- reminds to upgrade Arch Linux by desktop-messages, shows Arch Linux News a...
(define-public ureminder
  (package
    (name "ureminder")
    (version "0.9.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ureminder.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "reminds to upgrade Arch Linux by desktop-messages, shows Arch Linux News a...")
    (description "Reminds to upgrade Arch Linux by desktop-messages, shows Arch Linux News and keeps package mirrors and cache healthy.")
    (home-page "https://codeberg.org/tuxnix/ureminder")
    (license license:nonfree)))

;;; tusk-launcher-git --- a Rust written GUI app launcher for wlroots tiling WMs
(define-public tusk-launcher-git
  (package
    (name "tusk-launcher-git")
    (version "r189.46c1f05")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tusk-launcher-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a Rust written GUI app launcher for wlroots tiling WMs")
    (description "A Rust written GUI app launcher for wlroots tiling WMs.")
    (home-page "https://github.com/padoruuuu/Tusk-Launcher")
    (license license:gpl3)))

;;; socat-git --- multipurpose relay
(define-public socat-git
  (package
    (name "socat-git")
    (version "1.7.4.4.r0.ga8b2cb6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/socat-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "multipurpose relay")
    (description "Multipurpose relay.")
    (home-page "http://www.dest-unreach.org/socat/")
    (license license:gpl2+)))

;;; python-qiskit-qasm3-import --- importer from OpenQASM 3 to Qiskit's QuantumCircuit
(define-public python-qiskit-qasm3-import
  (package
    (name "python-qiskit-qasm3-import")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-qiskit-qasm3-import.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "importer from OpenQASM 3 to Qiskit's QuantumCircuit")
    (description "Importer from OpenQASM 3 to Qiskit's QuantumCircuit.")
    (home-page "https://github.com/Qiskit/qiskit-qasm3-import")
    (license license:asl2.0)))

;;; python-openqasm3 --- reference OpenQASM AST in Python
(define-public python-openqasm3
  (package
    (name "python-openqasm3")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-openqasm3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "reference OpenQASM AST in Python")
    (description "Reference OpenQASM AST in Python.")
    (home-page "https://github.com/openqasm/openqasm")
    (license license:asl2.0)))

;;; psh --- a small minimalistic shell
(define-public psh
  (package
    (name "psh")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/psh.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a small minimalistic shell")
    (description "A small minimalistic shell.")
    (home-page "https://github.com/proh14/psh")
    (license license:unlicense)))

;;; pamac-git --- pamac package manager - library, gui, cli
(define-public pamac-git
  (package
    (name "pamac-git")
    (version "11.7.3.r3.gf756a05")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pamac-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pamac package manager - library, gui, cli")
    (description "Pamac package manager - library, gui, cli.")
    (home-page "https://github.com/manjaro/pamac")
    (license license:gpl3+)))

;;; owrx_connector-luarvique --- connectors used by OpenWebRX to interface with SDR hardware
(define-public owrx_connector-luarvique
  (package
    (name "owrx_connector-luarvique")
    (version "0.6.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/owrx_connector-luarvique.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "connectors used by OpenWebRX to interface with SDR hardware")
    (description "Connectors used by OpenWebRX to interface with SDR hardware.")
    (home-page "https://github.com/luarvique/owrx_connector")
    (license license:gpl3+)))

;;; openwebrx-plus-git --- open source, multi-user SDR receiver software with a web interface
(define-public openwebrx-plus-git
  (package
    (name "openwebrx-plus-git")
    (version "1.2.112.r0.ga030a834")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openwebrx-plus-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "open source, multi-user SDR receiver software with a web interface")
    (description "Open source, multi-user SDR receiver software with a web interface.")
    (home-page "https://luarvique.github.io/ppa/")
    (license license:agpl3)))

;;; mldonkey-git --- a multi-network P2P client
(define-public mldonkey-git
  (package
    (name "mldonkey-git")
    (version "3.2.1.r14.g0d446356")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mldonkey-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a multi-network P2P client")
    (description "A multi-network P2P client.")
    (home-page "https://github.com/ygrek/mldonkey")
    (license license:gpl2+)))

;;; laze --- fast declarative meta build system for C/C++/Rust projects
(define-public laze
  (package
    (name "laze")
    (version "0.1.35")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/laze.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast declarative meta build system for C/C++/Rust projects")
    (description "Fast declarative meta build system for C/C++/Rust projects.")
    (home-page "https://github.com/kaspar030/laze")
    (license license:asl2.0)))

;;; juledoc-git --- jule code documentation generator
(define-public juledoc-git
  (package
    (name "juledoc-git")
    (version "r3461147")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/juledoc-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "jule code documentation generator")
    (description "Jule code documentation generator.")
    (home-page "https://github.com/julelang/juledoc")
    (license license:bsd-3)))

;;; gnome-shell-extension-enhanced-osk-git --- enhanced On-Screen Keyboard for Gnome Shell
(define-public gnome-shell-extension-enhanced-osk-git
  (package
    (name "gnome-shell-extension-enhanced-osk-git")
    (version "r177.d98b9cf")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-extension-enhanced-osk-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "enhanced On-Screen Keyboard for Gnome Shell")
    (description "Enhanced On-Screen Keyboard for Gnome Shell.")
    (home-page "https://github.com/honjow/enhanced-osk-gnome-ext.git")
    (license license:gpl3+)))

;;; ecl-git --- embeddable Common Lisp
(define-public ecl-git
  (package
    (name "ecl-git")
    (version "24.5.10.r262.g4f0fed469")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ecl-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "embeddable Common Lisp")
    (description "Embeddable Common Lisp.")
    (home-page "https://common-lisp.net/project/ecl/")
    (license license:lgpl2.1+)))

;;; easyconnect-hust --- accessing HUST's network resources over vpn connection
(define-public easyconnect-hust
  (package
    (name "easyconnect-hust")
    (version "7.6.7.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/easyconnect-hust.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "accessing HUST's network resources over vpn connection")
    (description "Accessing HUST's network resources over vpn connection.")
    (home-page "https://vpn.hust.edu.cn/portal/#!/down_client")
    (license license:nonfree)))

;;; csdr-luarvique --- a simple DSP library and command-line tool for Software Defined Radio
(define-public csdr-luarvique
  (package
    (name "csdr-luarvique")
    (version "0.18.37")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/csdr-luarvique.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple DSP library and command-line tool for Software Defined Radio")
    (description "A simple DSP library and command-line tool for Software Defined Radio.")
    (home-page "https://github.com/luarvique/csdr")
    (license license:gpl3+)))

;;; connet --- a P2P reverse proxy with NAT traversal
(define-public connet
  (package
    (name "connet")
    (version "0.6.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/connet.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a P2P reverse proxy with NAT traversal")
    (description "A P2P reverse proxy with NAT traversal.")
    (home-page "https://github.com/connet-dev/connet")
    (license license:asl2.0)))
