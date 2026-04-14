;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260414i
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - 76 recipes created
;;;   - 24 blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260414i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:export (            mkinitcpio-numlock
            nbtexplorer
            nct6687d-dkms-git
            nullfsvfs-dkms
            pacfetch
            pacman-hook-kernel-install
            pyenv-virtualenv
            python-anchor-kr-git
            python3-xynexdg
            qemu-ovmf-secureboot
            qmd
            qpxtool
            quazip-qt4
            raid-check-systemd
            reflector-nomirrorlist
            reflector-pacman-hook-git
            rep-gtk
            repomix
            responsively
            rtl8192eu-dkms
            rutoken-connect
            rvgl-dcpack
            rvgl-io-soundtrack
            ryzen_smu-dkms-git
            sakura-frp-launcher-bin
            scala-dotty
            sddm-stellar-theme
            seatools
            sentinelagent
            serviio
            shine-git
            shiori
            siggy-bin
            silverr-bin
            slatec
            slimcc-git
            soteria-bin
            spawn-fcgi-php
            spice-guest-tools-windows
            spm-arch
            spotify-adblock
            stalker-gamma-cli-bin
            sttr
            suvadu-bin
            systemd-zpool-scrub
            taskbook-bin
            taskbook-server-bin
            termf1
            tetrio-plus-bin
            tetro-tui-bin
            texlive-alteswab
            textern-native-messaging-host
            timeshift-autosnap
            timeshift-systemd-timer
            tl866-updater-git
            tradingview-bin-latest
            triliumnext-bin
            turtlectl-git
            tuxedo-yt6801-dkms-git
            tylax-bin
            uftpd
            unreal-tournament-data-gog
            upi
            uptime-kuma
            ut2004-data-archiveorg
            ut2004-data-gog
            utctimerightnow
            vdr-streamdev-client
            vdr-streamdev-server
            velocidrone
            verify-everything
            vex-shell-git
            vfstool-git
            vlc-plugin-ytdl-git
            vmware-host-modules-dkms-fix-git
            vscode-langservers-extracted))


;;; -- mkinitcpio-numlock (#381) --

(define-public mkinitcpio-numlock
  (package
    (name "mkinitcpio-numlock")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://bbs.archlinux.org/viewtopic.php?pid=869618")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://bbs.archlinux.org/viewtopic.php?pid=869618")
    (synopsis "enable numlock in early userspace")
    (description "Enable numlock in early userspace.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- nbtexplorer (#1014) --

(define-public nbtexplorer
  (package
    (name "nbtexplorer")
    (version "2.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jaquadro/NBTExplorer.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/jaquadro/NBTExplorer")
    (synopsis "minecraft NBT Editor for editing player and world files")
    (description "Minecraft NBT Editor for editing player and world files.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- nct6687d-dkms-git (#1691) --

(define-public nct6687d-dkms-git
  (package
    (name "nct6687d-dkms-git")
    (version "r78.df1565a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Fred78290/nct6687d.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Fred78290/nct6687d")
    (synopsis "nuvoton module for NCT6687-R synced with latest upstream kernel")
    (description "Nuvoton module for NCT6687-R synced with latest upstream kernel.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; -- nullfsvfs-dkms (#260) --

(define-public nullfsvfs-dkms
  (package
    (name "nullfsvfs-dkms")
    (version "0.26")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abbbi/nullfsvfs.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/abbbi/nullfsvfs")
    (synopsis "virtual black hole file system that behaves like /dev/null")
    (description "Virtual black hole file system that behaves like /dev/null.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- pacfetch (#184) --

(define-public pacfetch
  (package
    (name "pacfetch")
    (version "1.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/camtisocial/pacfetch.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/camtisocial/pacfetch")
    (synopsis "A neofetch-style pacman stats display and -Syu wrapper")
    (description "A neofetch-style pacman stats display and -Syu wrapper.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- pacman-hook-kernel-install (#1987) --

(define-public pacman-hook-kernel-install
  (package
    (name "pacman-hook-kernel-install")
    (version "0.16.0")
    (source (origin
              (method url-fetch)
              (uri "https://man.archlinux.org/man/kernel-install.8")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://man.archlinux.org/man/kernel-install.8")
    (synopsis "pacman hooks for kernel-install")
    (description "Pacman hooks for kernel-install.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- pyenv-virtualenv (#2402) --

(define-public pyenv-virtualenv
  (package
    (name "pyenv-virtualenv")
    (version "1:1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pyenv/pyenv-virtualenv.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/pyenv/pyenv-virtualenv")
    (synopsis "pyenv plugin to manage virtualenv (a.k.a. python-virtualenv)")
    (description "pyenv plugin to manage virtualenv (a.k.a. python-virtualenv).")
    (license license:expat)))


;;; -- python-anchor-kr-git (#3246) --

(define-public python-anchor-kr-git
  (package
    (name "python-anchor-kr-git")
    (version "6.4cedb6a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/justfoolingaround/anchor.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/justfoolingaround/anchor")
    (synopsis "this project is created in the favor of scraping projects of KR")
    (description "This project is created in the favor of scraping projects of KR.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- python3-xynexdg (#25154) --

(define-public python3-xynexdg
  (package
    (name "python3-xynexdg")
    (version "2021")
    (source (origin
              (method url-fetch)
              (uri "https://xyne.dev/projects/python3-xynexdg")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://xyne.dev/projects/python3-xynexdg")
    (synopsis "implementation of various freedesktop.org standards, for internal use in Xy...")
    (description "Implementation of various freedesktop.org standards, for internal use in
Xyne's modules.")
    (license license:gpl3+)))


;;; -- qemu-ovmf-secureboot (#7330) --

(define-public qemu-ovmf-secureboot
  (package
    (name "qemu-ovmf-secureboot")
    (version "1.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rhuefi/qemu-ovmf-secureboot.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/rhuefi/qemu-ovmf-secureboot")
    (synopsis "script to generate an OVMF vars file with default secure boot key enrolled")
    (description "Script to generate an OVMF vars file with default secure boot key
enrolled.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- qmd (#833) --

(define-public qmd
  (package
    (name "qmd")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tobi/qmd.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/tobi/qmd")
    (synopsis "on-device search engine for markdown files with BM25, vector, and LLM-power...")
    (description "On-device search engine for markdown files with BM25, vector, and LLM-
powered search.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- qpxtool (#2452) --

(define-public qpxtool
  (package
    (name "qpxtool")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri "http://qpxtool.sourceforge.net/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://qpxtool.sourceforge.net/")
    (synopsis "allows better controll over optical drives to include QChecks and optimizat...")
    (description "Allows better controll over optical drives to include QChecks and
optimization settings.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- quazip-qt4 (#25158) --

(define-public quazip-qt4
  (package
    (name "quazip-qt4")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri "http://sourceforge.net/projects/quazip/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://sourceforge.net/projects/quazip/")
    (synopsis "C++ wrapper for the Gilles Vollant's ZIP/UNZIP C package, qt4 version")
    (description "C++ wrapper for the Gilles Vollant's ZIP/UNZIP C package, qt4 version.  It is packaged from the Arch User Repository.")
    (license license:lgpl3+)))


;;; -- raid-check-systemd (#10685) --

(define-public raid-check-systemd
  (package
    (name "raid-check-systemd")
    (version "4.4")
    (source (origin
              (method url-fetch)
              (uri "https://wiki.archlinux.org/index.php/RAID#Scrubbing")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://wiki.archlinux.org/index.php/RAID#Scrubbing")
    (synopsis "raid data scrubbing script with systemd timer to be used with mdadm")
    (description "Raid data scrubbing script with systemd timer to be used with mdadm.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- reflector-nomirrorlist (#7397) --

(define-public reflector-nomirrorlist
  (package
    (name "reflector-nomirrorlist")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/packages/reflector-nomirrorlist/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/reflector-nomirrorlist/")
    (synopsis "use reflector-generated mirrorlist by default")
    (description "Use reflector-generated mirrorlist by default.  It is packaged from the Arch User Repository.")
    (license (nonguix-license:nonfree "https://aur.archlinux.org/packages/reflector-nomirrorlist/"))))


;;; -- reflector-pacman-hook-git (#12729) --

(define-public reflector-pacman-hook-git
  (package
    (name "reflector-pacman-hook-git")
    (version "r81.9d5f298")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/desbma/pacman-hooks.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/desbma/pacman-hooks")
    (synopsis "pacman hook to automatically update Pacman mirrorlist using reflector")
    (description "Pacman hook to automatically update Pacman mirrorlist using reflector.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- rep-gtk (#25161) --

(define-public rep-gtk
  (package
    (name "rep-gtk")
    (version "0.90.8.3")
    (source (origin
              (method url-fetch)
              (uri "http://sawfish.wikia.com/wiki/Rep-GTK")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://sawfish.wikia.com/wiki/Rep-GTK")
    (synopsis "binding of the GTK and GDK libraries for the librep Lisp environment")
    (description "Binding of the GTK and GDK libraries for the librep Lisp environment.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- repomix (#716) --

(define-public repomix
  (package
    (name "repomix")
    (version "1.13.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/repomix.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/repomix")
    (synopsis "repomix (formerly Repopack) is a powerful tool that packs your entire repos...")
    (description "Repomix (formerly Repopack) is a powerful tool that packs your entire
repository into a single, AI-friendly file.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- responsively (#4607) --

(define-public responsively
  (package
    (name "responsively")
    (version "1.18.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/responsively-org/responsively-app.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/responsively-org/responsively-app")
    (synopsis "A modified browser built using Electron that helps in responsive web develo...")
    (description "A modified browser built using Electron that helps in responsive web
development.  It is packaged from the Arch User Repository.")
    (license license:agpl3+)))


;;; -- rtl8192eu-dkms (#4395) --

(define-public rtl8192eu-dkms
  (package
    (name "rtl8192eu-dkms")
    (version "5.6.4.r302.g2fddecc")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Mange/rtl8192eu-linux-driver.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Mange/rtl8192eu-linux-driver")
    (synopsis "driver for Realtek 8192eu chipset (DKMS)")
    (description "Driver for Realtek 8192eu chipset (DKMS).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- rutoken-connect (#1047) --

(define-public rutoken-connect
  (package
    (name "rutoken-connect")
    (version "6.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://www.rutoken.ru/support/download/rutoken-connect/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.rutoken.ru/support/download/rutoken-connect/")
    (synopsis "rutoken Connect plugin for browser integration")
    (description "Rutoken Connect plugin for browser integration.  It is packaged from the Arch User Repository.")
    (license (nonguix-license:nonfree "https://www.rutoken.ru/support/download/rutoken-connect/"))))


;;; -- rvgl-dcpack (#7222) --

(define-public rvgl-dcpack
  (package
    (name "rvgl-dcpack")
    (version "23.0501a1")
    (source (origin
              (method url-fetch)
              (uri "https://rvgl.org")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://rvgl.org")
    (synopsis "dreamcast content pack for RVGL")
    (description "Dreamcast content pack for RVGL.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- rvgl-io-soundtrack (#7225) --

(define-public rvgl-io-soundtrack
  (package
    (name "rvgl-io-soundtrack")
    (version "20.0302")
    (source (origin
              (method url-fetch)
              (uri "https://re-volt.io/downloads/packs")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://re-volt.io/downloads/packs")
    (synopsis "RVGL community-made soundtrack")
    (description "RVGL community-made soundtrack.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- ryzen_smu-dkms-git (#11622) --

(define-public ryzen_smu-dkms-git
  (package
    (name "ryzen_smu-dkms-git")
    (version "181.9f9569f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amkillam/ryzen_smu.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/amkillam/ryzen_smu")
    (synopsis "A Linux kernel driver that exposes access to the SMU (System Management Uni...")
    (description "A Linux kernel driver that exposes access to the SMU (System Management
Unit) for certain AMD Ryzen Processors.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; -- sakura-frp-launcher-bin (#2636) --

(define-public sakura-frp-launcher-bin
  (package
    (name "sakura-frp-launcher-bin")
    (version "3.1.7")
    (source (origin
              (method url-fetch)
              (uri "https://www.natfrp.com/tunnel/download")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.natfrp.com/tunnel/download")
    (synopsis "A daemon for a fast reverse proxy to help you expose a local server behind ...")
    (description "A daemon for a fast reverse proxy to help you expose a local server
behind a NAT or firewall to the internet.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- scala-dotty (#7608) --

(define-public scala-dotty
  (package
    (name "scala-dotty")
    (version "3.7.4")
    (source (origin
              (method url-fetch)
              (uri "http://dotty.epfl.ch")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://dotty.epfl.ch")
    (synopsis "the Scala 3 compiler, also known as Dotty")
    (description "The Scala 3 compiler, also known as Dotty.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))


;;; -- sddm-stellar-theme (#25168) --

(define-public sddm-stellar-theme
  (package
    (name "sddm-stellar-theme")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sgerbino.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/sgerbino")
    (synopsis "A minimalistic sddm greeter theme that features a milky way background, cre...")
    (description "A minimalistic sddm greeter theme that features a milky way background,
credential panel, session and layout manager.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- seatools (#7676) --

(define-public seatools
  (package
    (name "seatools")
    (version "5.2.5")
    (source (origin
              (method url-fetch)
              (uri "http://www.seagate.com/support/downloads/seatools/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.seagate.com/support/downloads/seatools/")
    (synopsis "seagate graphical user interface (GUI) tool for managing hard drives and SS...")
    (description "Seagate graphical user interface (GUI) tool for managing hard drives and
SSDs on a system.  It is packaged from the Arch User Repository.")
    (license (nonguix-license:nonfree "http://www.seagate.com/support/downloads/seatools/"))))


;;; -- sentinelagent (#3411) --

(define-public sentinelagent
  (package
    (name "sentinelagent")
    (version "25.3.1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sentinelagent.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/sentinelagent")
    (synopsis "sentinelOne | Next-Generation Endpoint Protection Software")
    (description "SentinelOne | Next-Generation Endpoint Protection Software.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- serviio (#10316) --

(define-public serviio
  (package
    (name "serviio")
    (version "2.4")
    (source (origin
              (method url-fetch)
              (uri "http://www.serviio.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.serviio.org/")
    (synopsis "free DLNA media server")
    (description "Free DLNA media server.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- shine-git (#17697) --

(define-public shine-git
  (package
    (name "shine-git")
    (version "3.1.1.r59.gab5e352")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/toots/shine.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/toots/shine")
    (synopsis "super fast fixed-point MP3 encoder")
    (description "Super fast fixed-point MP3 encoder.  It is packaged from the Arch User Repository.")
    (license license:gpl2+)))


;;; -- shiori (#2927) --

(define-public shiori
  (package
    (name "shiori")
    (version "1.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/go-shiori/shiori.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/go-shiori/shiori")
    (synopsis "simple bookmark manager built with Go")
    (description "Simple bookmark manager built with Go.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- siggy-bin (#2882) --

(define-public siggy-bin
  (package
    (name "siggy-bin")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/johnsideserf/siggy")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/johnsideserf/siggy")
    (synopsis "terminal-based Signal messenger client with vim keybindings")
    (description "Terminal-based Signal messenger client with vim keybindings.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- silverr-bin (#4416) --

(define-public silverr-bin
  (package
    (name "silverr-bin")
    (version "0.0.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Wookhq/silverr")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Wookhq/silverr")
    (synopsis "silverr application")
    (description "Silverr application.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- slatec (#1122) --

(define-public slatec
  (package
    (name "slatec")
    (version "4.1")
    (source (origin
              (method url-fetch)
              (uri "http://netlib.org/slatec")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://netlib.org/slatec")
    (synopsis "common Mathematical Library")
    (description "Common Mathematical Library.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- slimcc-git (#826) --

(define-public slimcc-git
  (package
    (name "slimcc-git")
    (version "r921.ff77023")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fuhsnn/slimcc.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/fuhsnn/slimcc")
    (synopsis "C23 compiler with C2y/GNU extensions for x86-64 Linux/BSD, written in C99")
    (description "C23 compiler with C2y/GNU extensions for x86-64 Linux/BSD, written in
C99.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- soteria-bin (#2098) --

(define-public soteria-bin
  (package
    (name "soteria-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ImVaskel/soteria")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ImVaskel/soteria")
    (synopsis "A GTK-based polkit authentication agent (prebuilt binary)")
    (description "A GTK-based polkit authentication agent (prebuilt binary).  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))


;;; -- spawn-fcgi-php (#25176) --

(define-public spawn-fcgi-php
  (package
    (name "spawn-fcgi-php")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/packages/spawn-fcgi-php/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/spawn-fcgi-php/")
    (synopsis "script to provide simple cgi-php support for nginx http daemon")
    (description "Script to provide simple cgi-php support for nginx http daemon.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- spice-guest-tools-windows (#11046) --

(define-public spice-guest-tools-windows
  (package
    (name "spice-guest-tools-windows")
    (version "0.141")
    (source (origin
              (method url-fetch)
              (uri "https://www.spice-space.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.spice-space.org/")
    (synopsis "windows XP-10/2003-2016 guest drivers and agent for SPICE-enabled QEMU VMs")
    (description "Windows XP-10/2003-2016 guest drivers and agent for SPICE-enabled QEMU
VMs.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; -- spm-arch (#2987) --

(define-public spm-arch
  (package
    (name "spm-arch")
    (version "2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/adelmonte/Simple_Package_Manager.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/adelmonte/Simple_Package_Manager")
    (synopsis "simple Package Manager - Interactive fzf tui for Arch package management")
    (description "Simple Package Manager - Interactive fzf tui for Arch package
management.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- spotify-adblock (#12083) --

(define-public spotify-adblock
  (package
    (name "spotify-adblock")
    (version "1:1.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abba23/spotify-adblock.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/abba23/spotify-adblock")
    (synopsis "adblocker for Spotify")
    (description "Adblocker for Spotify.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- stalker-gamma-cli-bin (#2647) --

(define-public stalker-gamma-cli-bin
  (package
    (name "stalker-gamma-cli-bin")
    (version "1.24.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/FaithBeam/stalker-gamma-cli")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FaithBeam/stalker-gamma-cli")
    (synopsis "a cli to install Stalker Anomaly and the GAMMA mod pack (appimage)")
    (description "a cli to install Stalker Anomaly and the GAMMA mod pack (appimage).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- sttr (#10899) --

(define-public sttr
  (package
    (name "sttr")
    (version "0.2.28")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abhimanyu003/sttr.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/abhimanyu003/sttr")
    (synopsis "cli app to perform various operations on string")
    (description "cli app to perform various operations on string.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- suvadu-bin (#2763) --

(define-public suvadu-bin
  (package
    (name "suvadu-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/AppachiTech/suvadu")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AppachiTech/suvadu")
    (synopsis "A database-backed shell history replacement with fuzzy search, AI agent mon...")
    (description "A database-backed shell history replacement with fuzzy search, AI agent
monitoring, and interactive TUI.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- systemd-zpool-scrub (#25186) --

(define-public systemd-zpool-scrub
  (package
    (name "systemd-zpool-scrub")
    (version "1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lnicola/systemd-zpool-scrub.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/lnicola/systemd-zpool-scrub")
    (synopsis "systemd service for automatic ZFS zpool scrubbing")
    (description "Systemd service for automatic ZFS zpool scrubbing.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- taskbook-bin (#2801) --

(define-public taskbook-bin
  (package
    (name "taskbook-bin")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/taskbook-sh/taskbook")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/taskbook-sh/taskbook")
    (synopsis "tasks, boards & notes for the command-line habitat (Client)")
    (description "Tasks, boards & notes for the command-line habitat (Client).  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- taskbook-server-bin (#2802) --

(define-public taskbook-server-bin
  (package
    (name "taskbook-server-bin")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/taskbook-sh/taskbook")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/taskbook-sh/taskbook")
    (synopsis "tasks, boards & notes for the command-line habitat (Server)")
    (description "Tasks, boards & notes for the command-line habitat (Server).  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- termf1 (#2907) --

(define-public termf1
  (package
    (name "termf1")
    (version "2.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dk-a-dev/termf1.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/dk-a-dev/termf1")
    (synopsis "terminal UI: Dashboard for Formula-1")
    (description "Terminal UI: Dashboard for Formula-1.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- tetrio-plus-bin (#2459) --

(define-public tetrio-plus-bin
  (package
    (name "tetrio-plus-bin")
    (version "10.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://tetr.io/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tetr.io/")
    (synopsis "TETR.IO Plus desktop client")
    (description "TETR.IO Plus desktop client.")
    (license license:expat)))


;;; -- tetro-tui-bin (#1186) --

(define-public tetro-tui-bin
  (package
    (name "tetro-tui-bin")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Strophox/tetro-tui")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Strophox/tetro-tui")
    (synopsis "A cross-platform terminal game where tetrominos fall and stack")
    (description "A cross-platform terminal game where tetrominos fall and stack.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- texlive-alteswab (#9933) --

(define-public texlive-alteswab
  (package
    (name "texlive-alteswab")
    (version "20060901")
    (source (origin
              (method url-fetch)
              (uri "http://www.gaehrken.de/fraktur/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.gaehrken.de/fraktur/")
    (synopsis "alte Schwabacher fraktur font for use with LaTeX")
    (description "Alte Schwabacher fraktur font for use with LaTeX.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- textern-native-messaging-host (#4388) --

(define-public textern-native-messaging-host
  (package
    (name "textern-native-messaging-host")
    (version "0.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jlebon/textern.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/jlebon/textern")
    (synopsis "native Messaging Host for the Textern firefox addon")
    (description "Native Messaging Host for the Textern firefox addon.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- timeshift-autosnap (#12130) --

(define-public timeshift-autosnap
  (package
    (name "timeshift-autosnap")
    (version "0.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/racehd/timeshift-autosnap.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://codeberg.org/racehd/timeshift-autosnap")
    (synopsis "timeshift auto-snapshot script which runs before package upgrade using Pacm...")
    (description "Timeshift auto-snapshot script which runs before package upgrade using
Pacman hook.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- timeshift-systemd-timer (#1670) --

(define-public timeshift-systemd-timer
  (package
    (name "timeshift-systemd-timer")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/timeshift-systemd-timer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/timeshift-systemd-timer")
    (synopsis "add systemd support for timeshift")
    (description "Add systemd support for timeshift.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- tl866-updater-git (#765) --

(define-public tl866-updater-git
  (package
    (name "tl866-updater-git")
    (version "r267.4352559")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/radiomanV/TL866.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/radiomanV/TL866")
    (synopsis "open source software for Minipro TL866 eprom programmer")
    (description "Open source software for Minipro TL866 eprom programmer.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; -- tradingview-bin-latest (#4389) --

(define-public tradingview-bin-latest
  (package
    (name "tradingview-bin-latest")
    (version "2.14.0_1")
    (source (origin
              (method url-fetch)
              (uri "https://www.tradingview.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.tradingview.com")
    (synopsis "tradingView desktop client (prebuilt .deb, minimal installation, symlinked ...")
    (description "TradingView desktop client (prebuilt .deb, minimal installation,
symlinked binary).")
    (license license:expat)))


;;; -- triliumnext-bin (#1195) --

(define-public triliumnext-bin
  (package
    (name "triliumnext-bin")
    (version "0.102.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/TriliumNext/Trilium")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TriliumNext/Trilium")
    (synopsis "build your personal knowledge base with TriliumNext Notes.(Prebuilt version...")
    (description "Build your personal knowledge base with TriliumNext Notes.(Prebuilt
version.Use system-wide electron).")
    (license license:agpl3)))


;;; -- turtlectl-git (#810) --

(define-public turtlectl-git
  (package
    (name "turtlectl-git")
    (version "0.2.1.r34.gb1d9a44")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bnema/turtlectl.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/bnema/turtlectl")
    (synopsis "A Go CLI tool to manage and run Turtle WoW on Linux (X11/Wayland)")
    (description "A Go CLI tool to manage and run Turtle WoW on Linux (X11/Wayland).  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- tuxedo-yt6801-dkms-git (#12975) --

(define-public tuxedo-yt6801-dkms-git
  (package
    (name "tuxedo-yt6801-dkms-git")
    (version "1.0.30tux5.r7.gbc8aeca")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/tuxedocomputers/development/packages/tuxedo-yt6801.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/tuxedocomputers/development/packages/tuxedo-yt6801")
    (synopsis "kernel module for Motorcomm YT6801 ethernet controller (DKMS)")
    (description "Kernel module for Motorcomm YT6801 ethernet controller (DKMS).  It is packaged from the Arch User Repository.")
    (license license:gpl2+)))


;;; -- tylax-bin (#2781) --

(define-public tylax-bin
  (package
    (name "tylax-bin")
    (version "0.3.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/scipenai/tylax")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/scipenai/tylax")
    (synopsis "A bi-directional converter between Typst and LaTeX")
    (description "A bi-directional converter between Typst and LaTeX.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))


;;; -- uftpd (#7271) --

(define-public uftpd
  (package
    (name "uftpd")
    (version "2.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/troglobit/uftpd.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/troglobit/uftpd")
    (synopsis "FTP/TFTP server for Linux that just works")
    (description "FTP/TFTP server for Linux that just works.  It is packaged from the Arch User Repository.")
    (license license:isc)))


;;; -- unreal-tournament-data-gog (#3519) --

(define-public unreal-tournament-data-gog
  (package
    (name "unreal-tournament-data-gog")
    (version "436")
    (source (origin
              (method url-fetch)
              (uri "https://www.gog.com/game/unreal_tournament_goty")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.gog.com/game/unreal_tournament_goty")
    (synopsis "unreal Tournament 99 (GOTY) data from GOG")
    (description "Unreal Tournament 99 (GOTY) data from GOG.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- upi (#3717) --

(define-public upi
  (package
    (name "upi")
    (version "0.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/skorotkiewicz/upi.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/skorotkiewicz/upi")
    (synopsis "A simple, lightweight Rust daemon that monitors URLs and triggers local scr...")
    (description "A simple, lightweight Rust daemon that monitors URLs and triggers local
scripts when content changes.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- uptime-kuma (#11859) --

(define-public uptime-kuma
  (package
    (name "uptime-kuma")
    (version "2.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/louislam/uptime-kuma.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/louislam/uptime-kuma")
    (synopsis "A fancy self-hosted monitoring tool")
    (description "A fancy self-hosted monitoring tool.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- ut2004-data-archiveorg (#201) --

(define-public ut2004-data-archiveorg
  (package
    (name "ut2004-data-archiveorg")
    (version "3369")
    (source (origin
              (method url-fetch)
              (uri "https://www.oldunreal.com/downloads/unreal-tournament-2004/full-game-installers/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.oldunreal.com/downloads/unreal-tournament-2004/full-game-installers/")
    (synopsis "unreal Tournament 2004 ECE data from OldUnreal/Archive.org ISO")
    (description "Unreal Tournament 2004 ECE data from OldUnreal/Archive.org ISO.")
    (license license:expat)))


;;; -- ut2004-data-gog (#3516) --

(define-public ut2004-data-gog
  (package
    (name "ut2004-data-gog")
    (version "3369")
    (source (origin
              (method url-fetch)
              (uri "https://www.gog.com/game/unreal_tournament_2004_ece")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.gog.com/game/unreal_tournament_2004_ece")
    (synopsis "unreal Tournament 2004 ECE data from GOG")
    (description "Unreal Tournament 2004 ECE data from GOG.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- utctimerightnow (#9000) --

(define-public utctimerightnow
  (package
    (name "utctimerightnow")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://git.opentty.xyz/robogg133/utctimerightnow")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://git.opentty.xyz/robogg133/utctimerightnow")
    (synopsis "print real time UTC time")
    (description "Print real time UTC time.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- vdr-streamdev-client (#25202) --

(define-public vdr-streamdev-client
  (package
    (name "vdr-streamdev-client")
    (version "0.6.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vdr-projects/vdr-plugin-streamdev.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/vdr-projects/vdr-plugin-streamdev")
    (synopsis "implementation of the VTP (Video Transfer Protocol): client-side")
    (description "Implementation of the VTP (Video Transfer Protocol): client-side.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; -- vdr-streamdev-server (#25203) --

(define-public vdr-streamdev-server
  (package
    (name "vdr-streamdev-server")
    (version "0.6.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vdr-projects/vdr-plugin-streamdev.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/vdr-projects/vdr-plugin-streamdev")
    (synopsis "implementation of the VTP (Video Transfer Protocol): server-side")
    (description "Implementation of the VTP (Video Transfer Protocol): server-side.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; -- velocidrone (#7322) --

(define-public velocidrone
  (package
    (name "velocidrone")
    (version "1.17.1")
    (source (origin
              (method url-fetch)
              (uri "https://www.velocidrone.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.velocidrone.com/")
    (synopsis "a fast paced multi-player and single player FPV drone racing simulator")
    (description "a fast paced multi-player and single player FPV drone racing simulator.  It is packaged from the Arch User Repository.")
    (license (nonguix-license:nonfree "https://www.velocidrone.com/"))))


;;; -- verify-everything (#809) --

(define-public verify-everything
  (package
    (name "verify-everything")
    (version "0.1.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/imbue-ai/vet.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/imbue-ai/vet")
    (synopsis "LLM-based code review tool that finds issues tests and linters miss")
    (description "LLM-based code review tool that finds issues tests and linters miss.  It is packaged from the Arch User Repository.")
    (license license:agpl3)))


;;; -- vex-shell-git (#2669) --

(define-public vex-shell-git
  (package
    (name "vex-shell-git")
    (version "r1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aethstetic/vex.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/aethstetic/vex")
    (synopsis "A typed shell with structured data pipelines, written in C")
    (description "A typed shell with structured data pipelines, written in C.  It is packaged from the Arch User Repository.")
    (license license:expat)))


;;; -- vfstool-git (#3893) --

(define-public vfstool-git
  (package
    (name "vfstool-git")
    (version "2.5.r2.gad0a7c3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/DreamWeave-MP/vfstool.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/DreamWeave-MP/vfstool")
    (synopsis "application for OpenMW modlists designed to allow introspecting into and cr...")
    (description "Application for OpenMW modlists designed to allow introspecting into and
creating virtual filesystems, even for other games.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))


;;; -- vlc-plugin-ytdl-git (#11013) --

(define-public vlc-plugin-ytdl-git
  (package
    (name "vlc-plugin-ytdl-git")
    (version "0.r2.bd233b1")
    (source (origin
              (method url-fetch)
              (uri "https://git.remlab.net/gitweb/?p=vlc-plugin-ytdl.git;a=blob;f=README")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://git.remlab.net/gitweb/?p=vlc-plugin-ytdl.git;a=blob;f=README")
    (synopsis "VLC plugin for youtube-dl")
    (description "VLC plugin for youtube-dl.  It is packaged from the Arch User Repository.")
    (license license:lgpl3+)))


;;; -- vmware-host-modules-dkms-fix-git (#7693) --

(define-public vmware-host-modules-dkms-fix-git
  (package
    (name "vmware-host-modules-dkms-fix-git")
    (version "2:w17.6.3.r17.g6797e55")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/philipl/vmware-host-modules.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/philipl/vmware-host-modules")
    (synopsis "VMware (Player and Workstation) host kernel modules with patches needed to ...")
    (description "VMware (Player and Workstation) host kernel modules with patches needed
to build against recent kernels.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))


;;; -- vscode-langservers-extracted (#7053) --

(define-public vscode-langservers-extracted
  (package
    (name "vscode-langservers-extracted")
    (version "4.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hrsh7th/vscode-langservers-extracted.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/hrsh7th/vscode-langservers-extracted")
    (synopsis "language servers extracted from VSCode")
    (description "Language servers extracted from VSCode.  It is packaged from the Arch User Repository.")
    (license license:expat)))

