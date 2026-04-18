;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418j
;;; Resolves 43 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260418j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (iup
            ttf-ms-office365
            fonts-apple
            lib32-amdvlk-bin
            otf-apple-pingfang
            otf-apple-pingfang-relaxed
            otf-apple-pingfang-ui
            palemoon-i18n-fr
            seamonkey-i18n-es-es
            code-server-marketplace
            gde-creator-bin
            libfprint-2-tod1-broadcom
            ntsync-dkms
            odoo18-nightly
            rice-switcher
            8192eu-dkms-git
            arch-shell
            dude-bin
            mt76-dkms-git
            parus
            pacwall-git
            pypy3-pyparsing
            rtl8821ce-dkms-git
            cn-dascom-pin-driver
            lib32-liblrdf
            selinux-refpolicy-arch-git
            starsector
            asp
            deezer
            ec-su-axb35-dkms-git
            fnq-monitor
            olauncher
            gdrcopy
            devkitty-git
            xilinx-ise
            pamac-all
            python-torchaudio-rocm
            aiot-ide
            vitis
            lua-iup
            lua51-iup
            lua52-iup
            lua53-iup
))

(define-public iup
  (package
    (name "iup")
    (version "3.32")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/iup.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c cross platform GUI toolkit")
    (description "C cross platform GUI toolkit.")
    (home-page "https://www.tecgraf.puc-rio.br/iup/")
    (license license:expat)))

(define-public ttf-ms-office365
  (package
    (name "ttf-ms-office365")
    (version "16.0.18925.20050")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-office365.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "microsoft (Office) 365 TrueType fonts")
    (description "Microsoft (Office) 365 TrueType fonts.")
    (home-page "https://learn.microsoft.com/en-us/typography/?PID=164")
    (license license:non-copyleft)))

(define-public fonts-apple
  (package
    (name "fonts-apple")
    (version "1:21.0d2e1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fonts-apple.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "apple公司出品的字体,包含苹方简体和繁体，圆简粗体。少女简粗体，SFPro系列和Monaco等宽英文体和AppleColorEmoji符号字体。🏃")
    (description "Apple公司出品的字体,包含苹方简体和繁体，圆简粗体。少女简粗体，SFPro系列和Monaco等宽英文体和AppleColorEmoji符号字体。🏃.")
    (home-page "https://developer.apple.com/fonts/")
    (license license:non-copyleft)))

(define-public lib32-amdvlk-bin
  (package
    (name "lib32-amdvlk-bin")
    (version "2025.Q2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GPUOpen-Drivers/AMDVLK")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "aMD's standalone Vulkan driver (32-bit) (Stable DEB Release)")
    (description "AMD's standalone Vulkan driver (32-bit) (Stable DEB Release).")
    (home-page "https://github.com/GPUOpen-Drivers/AMDVLK")
    (license license:expat)))

(define-public otf-apple-pingfang
  (package
    (name "otf-apple-pingfang")
    (version "3.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-apple-pingfang.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "apple公司出品的苹方字体")
    (description "Apple公司出品的苹方字体.")
    (home-page "https://developer.apple.com/fonts/")
    (license license:non-copyleft)))

(define-public otf-apple-pingfang-relaxed
  (package
    (name "otf-apple-pingfang-relaxed")
    (version "3.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-apple-pingfang-relaxed.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "开苹方字体")
    (description "开苹方字体.")
    (home-page "https://developer.apple.com/fonts/")
    (license license:non-copyleft)))

(define-public otf-apple-pingfang-ui
  (package
    (name "otf-apple-pingfang-ui")
    (version "3.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-apple-pingfang-ui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "苹方UI字体")
    (description "苹方UI字体.")
    (home-page "https://developer.apple.com/fonts/")
    (license license:non-copyleft)))

(define-public palemoon-i18n-fr
  (package
    (name "palemoon-i18n-fr")
    (version "33.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/palemoon-i18n-fr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "french language pack for Pale Moon browser")
    (description "French language pack for Pale Moon browser.")
    (home-page "https://addons.palemoon.org/language-packs/")
    (license license:mpl2.0)))

(define-public seamonkey-i18n-es-es
  (package
    (name "seamonkey-i18n-es-es")
    (version "2.53.23")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/seamonkey-i18n-es-es.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "spanish (Spain) language pack for SeaMonkey")
    (description "Spanish (Spain) language pack for SeaMonkey.")
    (home-page "http://www.seamonkey-project.org/")
    (license license:mpl2.0)))

(define-public code-server-marketplace
  (package
    (name "code-server-marketplace")
    (version "4.16.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/code-server-marketplace.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enable vscode marketplace in code-server")
    (description "Enable vscode marketplace in code-server.")
    (home-page "https://marketplace.visualstudio.com/vscode")
    (license license:non-copyleft)))

(define-public gde-creator-bin
  (package
    (name "gde-creator-bin")
    (version "1.0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gmzr0/gde-creator")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "gDE-Creator is a modern CLI tool that automatically search steam database, ..")
    (description "GDE-Creator is a modern CLI tool that automatically search steam database, fetch name and icons and generate compliant .desktop file in your Linux system.")
    (home-page "https://github.com/gmzr0/gde-creator")
    (license license:expat)))

(define-public libfprint-2-tod1-broadcom
  (package
    (name "libfprint-2-tod1-broadcom")
    (version "5.15.010.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libfprint-2-tod1-broadcom.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "proprietary driver for the fingerprint reader on the Dell Latitude 7300 - d..")
    (description "Proprietary driver for the fingerprint reader on the Dell Latitude 7300 - direct from Dell's Ubuntu repo.")
    (home-page "https://git.launchpad.net/~oem-solutions-engineers/libfprint-2-tod1-broadcom/+git/libfprint-2-tod1-broadcom/")
    (license license:non-copyleft)))

(define-public ntsync-dkms
  (package
    (name "ntsync-dkms")
    (version "6.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ntsync-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "nT synchronization primitive driver - out-of-tree module")
    (description "NT synchronization primitive driver - out-of-tree module.")
    (home-page "https://lore.kernel.org/lkml/20240519202454.1192826-1-zfigura@codeweavers.com/")
    (license license:gpl2+)))

(define-public odoo18-nightly
  (package
    (name "odoo18-nightly")
    (version "18.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/odoo18-nightly.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "odoo. Open Source Apps To Grow Your Business")
    (description "Odoo. Open Source Apps To Grow Your Business.")
    (home-page "https://odoo.com/")
    (license license:lgpl3+)))

(define-public rice-switcher
  (package
    (name "rice-switcher")
    (version "1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/S1rEx1/Rice-Switcher")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cLI tool for managing and switching between Linux config sets")
    (description "CLI tool for managing and switching between Linux config sets.")
    (home-page "https://github.com/S1rEx1/Rice-Switcher")
    (license license:expat)))

(define-public 8192eu-dkms-git
  (package
    (name "8192eu-dkms-git")
    (version "r315.d53a23d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Mange/rtl8192eu-linux-driver")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "driver for the Realtek 8192eu chipset (DKMS)")
    (description "Driver for the Realtek 8192eu chipset (DKMS).")
    (home-page "https://github.com/Mange/rtl8192eu-linux-driver")
    (license license:gpl3+)))

(define-public arch-shell
  (package
    (name "arch-shell")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/0xbbuddha/arch-shell")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "outil pour créer des environnements chroot Arch jetables, façon nix-shell, ..")
    (description "Outil pour créer des environnements chroot Arch jetables, façon nix-shell, basé sur devtools.")
    (home-page "https://github.com/0xbbuddha/arch-shell")
    (license license:expat)))

(define-public dude-bin
  (package
    (name "dude-bin")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/seeyebe/dude")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "a single-binary helper that discovers, previews and removes pacman orphans")
    (description "A single-binary helper that discovers, previews and removes pacman orphans.")
    (home-page "https://github.com/seeyebe/dude")
    (license license:asl2.0)))

(define-public mt76-dkms-git
  (package
    (name "mt76-dkms-git")
    (version "r4269.de635e1e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openwrt/mt76")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "dKMS build of the MediaTek mt76 wireless driver from OpenWRT (with mt7925 s..")
    (description "DKMS build of the MediaTek mt76 wireless driver from OpenWRT (with mt7925 support).")
    (home-page "https://github.com/openwrt/mt76")
    (license license:gpl3+)))

(define-public parus
  (package
    (name "parus")
    (version "1.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/salvoton/parus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a package search TUI for Paru, powered by Skim")
    (description "A package search TUI for Paru, powered by Skim.")
    (home-page "https://github.com/salvoton/parus")
    (license license:gpl3+)))

(define-public pacwall-git
  (package
    (name "pacwall-git")
    (version "2.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://github.com/Kharacternyk/pacwall")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a live wallpaper that shows the dependency graph and status of installed pa..")
    (description "A live wallpaper that shows the dependency graph and status of installed packages.")
    (home-page "http://github.com/Kharacternyk/pacwall")
    (license license:gpl3+)))

(define-public pypy3-pyparsing
  (package
    (name "pypy3-pyparsing")
    (version "3.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pyparsing/pyparsing")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "general parsing module for Python")
    (description "General parsing module for Python.")
    (home-page "https://github.com/pyparsing/pyparsing")
    (license license:expat)))

(define-public rtl8821ce-dkms-git
  (package
    (name "rtl8821ce-dkms-git")
    (version "1.0.5.r36.gca4abd8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tomaspinho/rtl8821ce")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "rtl8821CE driver with firmware")
    (description "Rtl8821CE driver with firmware.")
    (home-page "https://github.com/tomaspinho/rtl8821ce")
    (license license:gpl2+)))

(define-public cn-dascom-pin-driver
  (package
    (name "cn-dascom-pin-driver")
    (version "2.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cn-dascom-pin-driver.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dascom Pin Dirver (Supported models include 24-pin、AR-510N(include AR-570 ...")
    (description "Dascom Pin Dirver (Supported models include 24-pin、AR-510N(include AR-570 ...) and some DS Series.).")
    (home-page "https://www.dascom.cn/")
    (license license:expat)))

(define-public lib32-liblrdf
  (package
    (name "lib32-liblrdf")
    (version "0.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/swh/LRDF")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a library for the manipulation of RDF file in LADSPA plugins (32-bit)")
    (description "A library for the manipulation of RDF file in LADSPA plugins (32-bit).")
    (home-page "https://github.com/swh/LRDF")
    (license license:lgpl2.1+)))

(define-public selinux-refpolicy-arch-git
  (package
    (name "selinux-refpolicy-arch-git")
    (version "RELEASE_2_20260312.r2.g3e316c1c5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SELinuxProject/refpolicy/wiki")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modular SELinux reference policy including headers and docs with Arch Linux..")
    (description "Modular SELinux reference policy including headers and docs with Arch Linux patches (latest commit).")
    (home-page "https://github.com/SELinuxProject/refpolicy/wiki")
    (license license:gpl2+)))

(define-public starsector
  (package
    (name "starsector")
    (version "0.98a_RC8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/starsector.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "starsector (formerly \"Starfarer\") is an in-development open-world single-pl..")
    (description "Starsector (formerly \"Starfarer\") is an in-development open-world single-player space-combat, roleplaying, exploration, and economic game.")
    (home-page "http://fractalsoftworks.com/")
    (license license:non-copyleft)))

(define-public asp
  (package
    (name "asp")
    (version "8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/falconindy/asp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arch Linux build source file management tool")
    (description "Arch Linux build source file management tool.")
    (home-page "https://github.com/falconindy/asp")
    (license license:expat)))

(define-public deezer
  (package
    (name "deezer")
    (version "7.1.150")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/deezer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a proprietary music streaming service")
    (description "A proprietary music streaming service.")
    (home-page "https://www.deezer.com/")
    (license license:non-copyleft)))

(define-public ec-su-axb35-dkms-git
  (package
    (name "ec-su_axb35-dkms-git")
    (version "r27.8325346")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cmetz/ec-su_axb35-linux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "linux driver for the embedded controller on the Sixunited AXB35-02 board")
    (description "Linux driver for the embedded controller on the Sixunited AXB35-02 board.")
    (home-page "https://github.com/cmetz/ec-su_axb35-linux")
    (license license:gpl2+)))

(define-public fnq-monitor
  (package
    (name "fnq-monitor")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/outvoker678/fnq-monitor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "monitor Fn+Q ACPI events for system performance modes")
    (description "Monitor Fn+Q ACPI events for system performance modes.")
    (home-page "https://github.com/outvoker678/fnq-monitor")
    (license license:gpl3+)))

(define-public olauncher
  (package
    (name "olauncher")
    (version "v1.7.3_03")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/olauncher/olauncher")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modified version of the old Minecraft Launcher supporting Microsoft authe..")
    (description "A modified version of the old Minecraft Launcher supporting Microsoft authentication and more.")
    (home-page "https://github.com/olauncher/olauncher")
    (license license:non-copyleft)))

(define-public gdrcopy
  (package
    (name "gdrcopy")
    (version "2.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NVIDIA/gdrcopy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast GPU memory copy library based on NVIDIA GPUDirect RDMA technology")
    (description "A fast GPU memory copy library based on NVIDIA GPUDirect RDMA technology.")
    (home-page "https://github.com/NVIDIA/gdrcopy")
    (license license:expat)))

(define-public devkitty-git
  (package
    (name "devkitty-git")
    (version "4.1.1.r0.g873fcd8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/devkitty-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "swiss army knife for developers.(Use system-wide electron)")
    (description "Swiss army knife for developers.(Use system-wide electron).")
    (home-page "https://devkitty.app/")
    (license license:expat)))

(define-public xilinx-ise
  (package
    (name "xilinx-ise")
    (version "14.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xilinx-ise.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xilinx ISE Design Suite")
    (description "Xilinx ISE Design Suite.")
    (home-page "https://www.xilinx.com/products/design-tools/ise-design-suite.html")
    (license license:non-copyleft)))

(define-public pamac-all
  (package
    (name "pamac-all")
    (version "11.7.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/manjaro/pamac")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GUI frontend for libalpm (everything in one package - snap, flatpak, appi..")
    (description "A GUI frontend for libalpm (everything in one package - snap, flatpak, appindicator, aur, appstream).")
    (home-page "https://github.com/manjaro/pamac")
    (license license:gpl3+)))

(define-public python-torchaudio-rocm
  (package
    (name "python-torchaudio-rocm")
    (version "2.11.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pytorch/audio")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "data manipulation and transformation for audio signal processing, powered b..")
    (description "Data manipulation and transformation for audio signal processing, powered by PyTorch (with ROCm/HIP support).")
    (home-page "https://github.com/pytorch/audio")
    (license license:bsd-3)))

(define-public aiot-ide
  (package
    (name "aiot-ide")
    (version "1.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aiot-ide.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "code editing. Redefined. AIoT IDE is the first choice for developing quickApp")
    (description "Code editing. Redefined. AIoT IDE is the first choice for developing quickApp.")
    (home-page "https://iot.mi.com/vela/quickapp/")
    (license license:non-copyleft)))

(define-public vitis
  (package
    (name "vitis")
    (version "2025.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vitis.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fPGA/CPLD design suite for Xilinx devices")
    (description "FPGA/CPLD design suite for Xilinx devices.")
    (home-page "https://www.xilinx.com/products/design-tools/vitis.html")
    (license license:non-copyleft)))

(define-public lua-iup
  (package
    (name "lua-iup")
    (version "3.32")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua-iup.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua 5.4 bindings for IUP GUI toolkit")
    (description "Lua 5.4 bindings for IUP GUI toolkit.")
    (home-page "https://www.tecgraf.puc-rio.br/iup/")
    (license license:expat)))

(define-public lua51-iup
  (package
    (name "lua51-iup")
    (version "3.32")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua51-iup.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua 5.1 bindings for IUP GUI toolkit")
    (description "Lua 5.1 bindings for IUP GUI toolkit.")
    (home-page "https://www.tecgraf.puc-rio.br/iup/")
    (license license:expat)))

(define-public lua52-iup
  (package
    (name "lua52-iup")
    (version "3.32")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua52-iup.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua 5.2 bindings for IUP GUI toolkit")
    (description "Lua 5.2 bindings for IUP GUI toolkit.")
    (home-page "https://www.tecgraf.puc-rio.br/iup/")
    (license license:expat)))

(define-public lua53-iup
  (package
    (name "lua53-iup")
    (version "3.32")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua53-iup.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua 5.3 bindings for IUP GUI toolkit")
    (description "Lua 5.3 bindings for IUP GUI toolkit.")
    (home-page "https://www.tecgraf.puc-rio.br/iup/")
    (license license:expat)))
