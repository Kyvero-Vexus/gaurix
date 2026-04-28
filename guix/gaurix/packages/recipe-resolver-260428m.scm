;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260428m
;;; Resolves 100 packages from queue (96 recipes, 4 blocked).
;;; Groups: source packages (88), fonts (8).
;;;
;;; BLOCKED (4):
;;;   linux6.18.20-1-lts-headers-bin -> SOURCE_UNAVAILABLE (Not found in AUR metadata cache (110883 packages))
;;;   linux6.18.20-1-lts-docs-bin -> SOURCE_UNAVAILABLE (Not found in AUR metadata cache (110883 packages))
;;;   linux6.18.20-1-lts-bin -> SOURCE_UNAVAILABLE (Not found in AUR metadata cache (110883 packages))
;;;   xviewer -> SOURCE_UNAVAILABLE (Not found in AUR metadata cache (110883 packages))
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.
;;;
;;; Generated: 2026-04-28

(define-module (gaurix packages recipe-resolver-260428m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            sway-systemd-git
            android-ndk-27
            ros2-jazzy-base
            uksmd-cachyos-nosystemd-git
            ros2-humble-base
            archiso-git
            gcc44
            android-studio-canary
            android-emulator
            ttf-ms-win8-hebrew
            ttf-ms-win8-sea
            ttf-ms-win8-japanese
            ttf-ms-win8-korean
            ttf-ms-win8-zh-cn
            ttf-ms-win8-zh-tw
            ttf-ms-win8-thai
            ttf-ms-win8-other
            android-bash-completion
            google-webdesigner
            roccat-tools-common
            roccat-tools-arvo
            roccat-tools-kiro
            roccat-tools-isku
            roccat-tools-iskufx
            roccat-tools-kone
            roccat-tools-koneplus
            roccat-tools-konepure
            roccat-tools-konepuremilitary
            roccat-tools-konepureoptical
            roccat-tools-konextd
            roccat-tools-konextdoptical
            roccat-tools-kovaplus
            roccat-tools-kova2016
            roccat-tools-lua
            roccat-tools-pyra
            roccat-tools-ryosmk
            roccat-tools-ryosmkfx
            roccat-tools-ryostkl
            roccat-tools-skeltr
            roccat-tools-sova
            roccat-tools-suora
            roccat-tools-tyon
            roccat-tools-nyth
            xorg-server-git
            xorg-server-devel-git
            xorg-server-xephyr-git
            xorg-server-xnest-git
            xorg-server-xvfb-git
            libpamac-aur
            libflashsupport-oss
            alien-package-converter
            ceti-2-themes
            dotpac
            guake-git
            libsigcpp1.2
            minetest-git
            minetest-server-git
            qt3
            adbfs-rootless-git
            par
            xorg-server-bug865
            apache-flex-sdk
            cairo-dock-git
            eclipse-subclipse
            glib2-git
            glib2-devel-git
            terasology
            tofrodos
            wmsystemtray
            all-repository-fonts
            etcd
            mozillavpn
            vcmi-git
            arch32-light
            idjc
            jslint
            statnot
            wingide
            x-tile
            cuda-memtest
            enigma-sdl
            feedthebeast-classic
            gapi-ocaml
            hg-git-hg
            libreswan
            libvpx-git
            mumble-git
            slingshot-python3
            zerobrane-studio
            fbpdf-git
            pix
            opensnitch-git
            revelation
            xinit-xsession
            e-modules-extra-git
            gspiceui
            ))

;;; Non-free license helper (for proprietary binary packages)
(define license:nonfree
  (lambda (uri)
    ((@@ (guix licenses) license) "nonfree"
      uri
      "Nonfree license; package included for user convenience.")))

;;; sway-systemd-git --- systemd integration for Sway session
(define-public sway-systemd-git
  (package
    (name "sway-systemd-git")
    (version "0.4.1.r0.gd2c1493")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sway-systemd-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "systemd integration for Sway session")
    (description "Systemd integration for Sway session.  This package is imported from the Arch User Repository.")
    (home-page "https://github.com/alebastr/sway-systemd")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; android-ndk-27 --- android C/C++ developer kit
(define-public android-ndk-27
  (package
    (name "android-ndk-27")
    (version "r27.d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-ndk-27.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "android C/C++ developer kit")
    (description "Android C/C++ developer kit.  This package is imported from the Arch User Repository.")
    (home-page "https://developer.android.com/ndk/")
    (license (list (license:nonfree "https://aur.archlinux.org") license:gpl3+ license:lgpl3+))))

;;; ros2-jazzy-base --- A set of software libraries and tools for building robot applications (Jazz..
(define-public ros2-jazzy-base
  (package
    (name "ros2-jazzy-base")
    (version "2025.04.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ros2-jazzy-base.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A set of software libraries and tools for building robot applications (Jazz..")
    (description "A set of software libraries and tools for building robot applications (Jazzy Jalisco, base variant).  This package is imported from the Arch User Repository.")
    (home-page "https://index.ros.org/p/ros_base/#jazzy")
    (license license:asl2.0)))

;;; uksmd-cachyos-nosystemd-git --- userspace KSM helper daemon. CachyOS-version with 'uksmdstats'. Without sys..
(define-public uksmd-cachyos-nosystemd-git
  (package
    (name "uksmd-cachyos-nosystemd-git")
    (version "1.3.0.r122.20250127.23f75ea")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uksmd-cachyos-nosystemd-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userspace KSM helper daemon. CachyOS-version with 'uksmdstats'. Without sys..")
    (description "Userspace KSM helper daemon. CachyOS-version with 'uksmdstats'. Without systemd dependency, latest git checkout.")
    (home-page "https://github.com/CachyOS/uksmd")
    (license license:gpl3)))

;;; ros2-humble-base --- A set of software libraries and tools for building robot applications (base..
(define-public ros2-humble-base
  (package
    (name "ros2-humble-base")
    (version "2026.02.20")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ros2-humble-base.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A set of software libraries and tools for building robot applications (base..")
    (description "A set of software libraries and tools for building robot applications (base variant).  This package is imported from the Arch User Repository.")
    (home-page "https://index.ros.org/p/ros_base/#humble")
    (license license:asl2.0)))

;;; archiso-git --- tools for creating Arch Linux live and install iso images
(define-public archiso-git
  (package
    (name "archiso-git")
    (version "79.r0.gfa3aba3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/archiso-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tools for creating Arch Linux live and install iso images")
    (description "Tools for creating Arch Linux live and install iso images.  This package is imported from the Arch User Repository.")
    (home-page "https://gitlab.archlinux.org/archlinux/archiso")
    (license license:gpl3+)))

;;; gcc44 --- the GNU Compiler Collection (4.4.x)
(define-public gcc44
  (package
    (name "gcc44")
    (version "4.4.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcc44.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the GNU Compiler Collection (4.4.x)")
    (description "The GNU Compiler Collection (4.4.x).")
    (home-page "http://gcc.gnu.org/")
    (license (list (license:nonfree "https://aur.archlinux.org") license:gpl2 license:gpl3 license:lgpl2.1 license:lgpl3+))))

;;; android-studio-canary --- the Official Android IDE (Canary branch)
(define-public android-studio-canary
  (package
    (name "android-studio-canary")
    (version "2026.1.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-studio-canary.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Official Android IDE (Canary branch)")
    (description "The Official Android IDE (Canary branch).  This package is imported from the Arch User Repository.")
    (home-page "http://tools.android.com/")
    (license license:asl2.0)))

;;; android-emulator --- google Android Emulator
(define-public android-emulator
  (package
    (name "android-emulator")
    (version "36.5.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-emulator.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "google Android Emulator")
    (description "Google Android Emulator.  This package is imported from the Arch User Repository.")
    (home-page "https://developer.android.com/studio/releases/emulator.html")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; ttf-ms-win8-hebrew --- microsoft Windows 8.1 Latin and International TrueType fonts
(define-public ttf-ms-win8-hebrew
  (package
    (name "ttf-ms-win8-hebrew")
    (version "6.3.9600.17238")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win8-hebrew.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 8.1 Latin and International TrueType fonts")
    (description "Microsoft Windows 8.1 Latin and International TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=161")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; ttf-ms-win8-sea --- microsoft Windows 8.1 Latin and International TrueType fonts
(define-public ttf-ms-win8-sea
  (package
    (name "ttf-ms-win8-sea")
    (version "6.3.9600.17238")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win8-sea.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 8.1 Latin and International TrueType fonts")
    (description "Microsoft Windows 8.1 Latin and International TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=161")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; ttf-ms-win8-japanese --- microsoft Windows 8.1 Latin and International TrueType fonts
(define-public ttf-ms-win8-japanese
  (package
    (name "ttf-ms-win8-japanese")
    (version "6.3.9600.17238")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win8-japanese.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 8.1 Latin and International TrueType fonts")
    (description "Microsoft Windows 8.1 Latin and International TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=161")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; ttf-ms-win8-korean --- microsoft Windows 8.1 Latin and International TrueType fonts
(define-public ttf-ms-win8-korean
  (package
    (name "ttf-ms-win8-korean")
    (version "6.3.9600.17238")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win8-korean.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 8.1 Latin and International TrueType fonts")
    (description "Microsoft Windows 8.1 Latin and International TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=161")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; ttf-ms-win8-zh-cn --- microsoft Windows 8.1 Latin and International TrueType fonts
(define-public ttf-ms-win8-zh-cn
  (package
    (name "ttf-ms-win8-zh-cn")
    (version "6.3.9600.17238")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win8-zh_cn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 8.1 Latin and International TrueType fonts")
    (description "Microsoft Windows 8.1 Latin and International TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=161")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; ttf-ms-win8-zh-tw --- microsoft Windows 8.1 Latin and International TrueType fonts
(define-public ttf-ms-win8-zh-tw
  (package
    (name "ttf-ms-win8-zh-tw")
    (version "6.3.9600.17238")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win8-zh_tw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 8.1 Latin and International TrueType fonts")
    (description "Microsoft Windows 8.1 Latin and International TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=161")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; ttf-ms-win8-thai --- microsoft Windows 8.1 Latin and International TrueType fonts
(define-public ttf-ms-win8-thai
  (package
    (name "ttf-ms-win8-thai")
    (version "6.3.9600.17238")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win8-thai.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 8.1 Latin and International TrueType fonts")
    (description "Microsoft Windows 8.1 Latin and International TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=161")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; ttf-ms-win8-other --- microsoft Windows 8.1 Latin and International TrueType fonts
(define-public ttf-ms-win8-other
  (package
    (name "ttf-ms-win8-other")
    (version "6.3.9600.17238")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win8-other.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 8.1 Latin and International TrueType fonts")
    (description "Microsoft Windows 8.1 Latin and International TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=161")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; android-bash-completion --- bash completion for android, adb, emulator, fastboot, and repo
(define-public android-bash-completion
  (package
    (name "android-bash-completion")
    (version "r43.c1b0656")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-bash-completion.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bash completion for android, adb, emulator, fastboot, and repo")
    (description "Bash completion for android, adb, emulator, fastboot, and repo.  This package is imported from the Arch User Repository.")
    (home-page "https://github.com/mbrubeck/android-completion")
    (license license:expat)))

;;; google-webdesigner --- create engaging, interactive HTML5-based designs and motion graphics that c..
(define-public google-webdesigner
  (package
    (name "google-webdesigner")
    (version "16.4.0.0711")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/google-webdesigner.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "create engaging, interactive HTML5-based designs and motion graphics that c..")
    (description "Create engaging, interactive HTML5-based designs and motion graphics that can run on any device.  This package is imported from the Arch User Repository.")
    (home-page "https://webdesigner.withgoogle.com")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; roccat-tools-common --- ROCCAT tools common files
(define-public roccat-tools-common
  (package
    (name "roccat-tools-common")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-common.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ROCCAT tools common files")
    (description "ROCCAT tools common files.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-arvo --- userland applications to configure and make extended use of ROCCAT Arvo dev..
(define-public roccat-tools-arvo
  (package
    (name "roccat-tools-arvo")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-arvo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Arvo dev..")
    (description "Userland applications to configure and make extended use of ROCCAT Arvo devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-kiro --- userland applications to configure and make extended use of ROCCAT Kiro dev..
(define-public roccat-tools-kiro
  (package
    (name "roccat-tools-kiro")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-kiro.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Kiro dev..")
    (description "Userland applications to configure and make extended use of ROCCAT Kiro devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-isku --- userland applications to configure and make extended use of ROCCAT Isku dev..
(define-public roccat-tools-isku
  (package
    (name "roccat-tools-isku")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-isku.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Isku dev..")
    (description "Userland applications to configure and make extended use of ROCCAT Isku devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-iskufx --- userland applications to configure and make extended use of ROCCAT Isku FX ..
(define-public roccat-tools-iskufx
  (package
    (name "roccat-tools-iskufx")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-iskufx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Isku FX ..")
    (description "Userland applications to configure and make extended use of ROCCAT Isku FX devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-kone --- userland applications to configure and make extended use of ROCCAT Kone dev..
(define-public roccat-tools-kone
  (package
    (name "roccat-tools-kone")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-kone.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Kone dev..")
    (description "Userland applications to configure and make extended use of ROCCAT Kone devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-koneplus --- userland applications to configure and make extended use of ROCCAT Kone[+] ..
(define-public roccat-tools-koneplus
  (package
    (name "roccat-tools-koneplus")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-koneplus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Kone[+] ..")
    (description "Userland applications to configure and make extended use of ROCCAT Kone[+] devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-konepure --- userland applications to configure and make extended use of ROCCAT Kone Pur..
(define-public roccat-tools-konepure
  (package
    (name "roccat-tools-konepure")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-konepure.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Kone Pur..")
    (description "Userland applications to configure and make extended use of ROCCAT Kone Pure devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-konepuremilitary --- userland applications to configure and make extended use of ROCCAT Kone Pur..
(define-public roccat-tools-konepuremilitary
  (package
    (name "roccat-tools-konepuremilitary")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-konepuremilitary.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Kone Pur..")
    (description "Userland applications to configure and make extended use of ROCCAT Kone Pure Military devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-konepureoptical --- userland applications to configure and make extended use of ROCCAT Kone Pur..
(define-public roccat-tools-konepureoptical
  (package
    (name "roccat-tools-konepureoptical")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-konepureoptical.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Kone Pur..")
    (description "Userland applications to configure and make extended use of ROCCAT Kone Pure optical devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-konextd --- userland applications to configure and make extended use of ROCCAT Kone XTD..
(define-public roccat-tools-konextd
  (package
    (name "roccat-tools-konextd")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-konextd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Kone XTD..")
    (description "Userland applications to configure and make extended use of ROCCAT Kone XTD devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-konextdoptical --- userland applications to configure and make extended use of ROCCAT Kone XTD..
(define-public roccat-tools-konextdoptical
  (package
    (name "roccat-tools-konextdoptical")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-konextdoptical.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Kone XTD..")
    (description "Userland applications to configure and make extended use of ROCCAT Kone XTD Optical devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-kovaplus --- userland applications to configure and make extended use of ROCCAT Kova[+] ..
(define-public roccat-tools-kovaplus
  (package
    (name "roccat-tools-kovaplus")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-kovaplus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Kova[+] ..")
    (description "Userland applications to configure and make extended use of ROCCAT Kova[+] devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-kova2016 --- userland applications to configure and make extended use of ROCCAT Kova2016..
(define-public roccat-tools-kova2016
  (package
    (name "roccat-tools-kova2016")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-kova2016.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Kova2016..")
    (description "Userland applications to configure and make extended use of ROCCAT Kova2016 devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-lua --- userland applications to configure and make extended use of ROCCAT Lua devices
(define-public roccat-tools-lua
  (package
    (name "roccat-tools-lua")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-lua.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Lua devices")
    (description "Userland applications to configure and make extended use of ROCCAT Lua devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-pyra --- userland applications to configure and make extended use of ROCCAT Pyra dev..
(define-public roccat-tools-pyra
  (package
    (name "roccat-tools-pyra")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-pyra.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Pyra dev..")
    (description "Userland applications to configure and make extended use of ROCCAT Pyra devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-ryosmk --- userland applications to configure and make extended use of ROCCAT RyosMK d..
(define-public roccat-tools-ryosmk
  (package
    (name "roccat-tools-ryosmk")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-ryosmk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT RyosMK d..")
    (description "Userland applications to configure and make extended use of ROCCAT RyosMK devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-ryosmkfx --- userland applications to configure and make extended use of ROCCAT RyosMK F..
(define-public roccat-tools-ryosmkfx
  (package
    (name "roccat-tools-ryosmkfx")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-ryosmkfx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT RyosMK F..")
    (description "Userland applications to configure and make extended use of ROCCAT RyosMK FX devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-ryostkl --- userland applications to configure and make extended use of ROCCAT RyosTKL ..
(define-public roccat-tools-ryostkl
  (package
    (name "roccat-tools-ryostkl")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-ryostkl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT RyosTKL ..")
    (description "Userland applications to configure and make extended use of ROCCAT RyosTKL devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-skeltr --- userland applications to configure and make extended use of ROCCAT Skeltr d..
(define-public roccat-tools-skeltr
  (package
    (name "roccat-tools-skeltr")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-skeltr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Skeltr d..")
    (description "Userland applications to configure and make extended use of ROCCAT Skeltr devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-sova --- userland applications to configure and make extended use of ROCCAT Sova dev..
(define-public roccat-tools-sova
  (package
    (name "roccat-tools-sova")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-sova.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Sova dev..")
    (description "Userland applications to configure and make extended use of ROCCAT Sova devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-suora --- userland applications to configure and make extended use of ROCCAT Suora de..
(define-public roccat-tools-suora
  (package
    (name "roccat-tools-suora")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-suora.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Suora de..")
    (description "Userland applications to configure and make extended use of ROCCAT Suora devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-tyon --- userland applications to configure and make extended use of ROCCAT Tyon dev..
(define-public roccat-tools-tyon
  (package
    (name "roccat-tools-tyon")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-tyon.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Tyon dev..")
    (description "Userland applications to configure and make extended use of ROCCAT Tyon devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; roccat-tools-nyth --- userland applications to configure and make extended use of ROCCAT Nyth dev..
(define-public roccat-tools-nyth
  (package
    (name "roccat-tools-nyth")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-nyth.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userland applications to configure and make extended use of ROCCAT Nyth dev..")
    (description "Userland applications to configure and make extended use of ROCCAT Nyth devices.  This package is imported from the Arch User Repository.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl2)))

;;; xorg-server-git --- xorg X server (git version)
(define-public xorg-server-git
  (package
    (name "xorg-server-git")
    (version "21.1.99.1.r1061.ge61bd1e5f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xorg-server-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xorg X server (git version)")
    (description "Xorg X server (git version).  This package is imported from the Arch User Repository.")
    (home-page "https://xorg.freedesktop.org")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; xorg-server-devel-git --- development files for the X.Org X server (git version)
(define-public xorg-server-devel-git
  (package
    (name "xorg-server-devel-git")
    (version "21.1.99.1.r1061.ge61bd1e5f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xorg-server-devel-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "development files for the X.Org X server (git version)")
    (description "Development files for the X.Org X server (git version).")
    (home-page "https://xorg.freedesktop.org")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; xorg-server-xephyr-git --- A nested X server that runs as an X application (git version)
(define-public xorg-server-xephyr-git
  (package
    (name "xorg-server-xephyr-git")
    (version "21.1.99.1.r1061.ge61bd1e5f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xorg-server-xephyr-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A nested X server that runs as an X application (git version)")
    (description "A nested X server that runs as an X application (git version).  This package is imported from the Arch User Repository.")
    (home-page "https://xorg.freedesktop.org")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; xorg-server-xnest-git --- A nested X server that runs as an X application (git version)
(define-public xorg-server-xnest-git
  (package
    (name "xorg-server-xnest-git")
    (version "21.1.99.1.r1061.ge61bd1e5f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xorg-server-xnest-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A nested X server that runs as an X application (git version)")
    (description "A nested X server that runs as an X application (git version).  This package is imported from the Arch User Repository.")
    (home-page "https://xorg.freedesktop.org")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; xorg-server-xvfb-git --- virtual framebuffer X server (git version)
(define-public xorg-server-xvfb-git
  (package
    (name "xorg-server-xvfb-git")
    (version "21.1.99.1.r1061.ge61bd1e5f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xorg-server-xvfb-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "virtual framebuffer X server (git version)")
    (description "Virtual framebuffer X server (git version).  This package is imported from the Arch User Repository.")
    (home-page "https://xorg.freedesktop.org")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; libpamac-aur --- pamac package manager library based on libalpm
(define-public libpamac-aur
  (package
    (name "libpamac-aur")
    (version "11.7.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libpamac-aur.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pamac package manager library based on libalpm")
    (description "Pamac package manager library based on libalpm.  This package is imported from the Arch User Repository.")
    (home-page "https://github.com/manjaro/libpamac/")
    (license license:gpl3+)))

;;; libflashsupport-oss --- adobe flash plugin support lib (OSSv4)
(define-public libflashsupport-oss
  (package
    (name "libflashsupport-oss")
    (version "4.2_2020")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libflashsupport-oss.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adobe flash plugin support lib (OSSv4)")
    (description "Adobe flash plugin support lib (OSSv4).  This package is imported from the Arch User Repository.")
    (home-page "http://developer.opensound.com/")
    (license license:gpl2)))

;;; alien-package-converter --- alien is a program that converts between the rpm, dpkg, stampede slp, and s..
(define-public alien-package-converter
  (package
    (name "alien-package-converter")
    (version "8.95.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/alien_package_converter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "alien is a program that converts between the rpm, dpkg, stampede slp, and s..")
    (description "Alien is a program that converts between the rpm, dpkg, stampede slp, and slackware tgz file formats.  This package is imported from the Arch User Repository.")
    (home-page "http://joeyh.name/code/alien/")
    (license license:gpl2)))

;;; ceti-2-themes --- ceti-2 is a theme for GTK 3, GTK 2 and Gnome-Shell. It supports GTK 3 and G..
(define-public ceti-2-themes
  (package
    (name "ceti-2-themes")
    (version "20150923")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ceti-2-themes.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ceti-2 is a theme for GTK 3, GTK 2 and Gnome-Shell. It supports GTK 3 and G..")
    (description "Ceti-2 is a theme for GTK 3, GTK 2 and Gnome-Shell. It supports GTK 3 and GTK 2 based desktop environments like Gnome, Unity, Budgie, Pantheon, etc.")
    (home-page "http://horst3180.deviantart.com/art/Ceti-2-Theme-489193140")
    (license license:gpl3)))

;;; dotpac --- bash script to get rid of *.pac* files
(define-public dotpac
  (package
    (name "dotpac")
    (version "0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dotpac.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bash script to get rid of *.pac* files")
    (description "Bash script to get rid of *.pac* files.")
    (home-page "http://wiki.archlinux.org/index.php/dotpac")
    (license license:bsd-3)))

;;; guake-git --- top-down terminal for Gnome using gtk3 and vte3
(define-public guake-git
  (package
    (name "guake-git")
    (version "3.10.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/guake-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "top-down terminal for Gnome using gtk3 and vte3")
    (description "Top-down terminal for Gnome using gtk3 and vte3.  This package is imported from the Arch User Repository.")
    (home-page "https://guake.github.io/")
    (license license:gpl2+)))

;;; libsigcpp1.2 --- A typesafe callback system for standard C++
(define-public libsigcpp1.2
  (package
    (name "libsigcpp1.2")
    (version "1.2.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libsigcpp1.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A typesafe callback system for standard C++")
    (description "A typesafe callback system for standard C++.  This package is imported from the Arch User Repository.")
    (home-page "http://libsigc.sourceforge.net/")
    (license license:lgpl3+)))

;;; minetest-git --- free and open source voxel-based game engine (git)
(define-public minetest-git
  (package
    (name "minetest-git")
    (version "1:5.10.0.rc1.r6.g9982c5637")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/minetest-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free and open source voxel-based game engine (git)")
    (description "Free and open source voxel-based game engine (git).  This package is imported from the Arch User Repository.")
    (home-page "https://www.luanti.org")
    (license license:lgpl3+)))

;;; minetest-server-git --- free and open source voxel-based game engine (headless server) (git)
(define-public minetest-server-git
  (package
    (name "minetest-server-git")
    (version "1:5.10.0.rc1.r6.g9982c5637")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/minetest-server-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free and open source voxel-based game engine (headless server) (git)")
    (description "Free and open source voxel-based game engine (headless server) (git).  This package is imported from the Arch User Repository.")
    (home-page "https://www.luanti.org")
    (license license:lgpl3+)))

;;; qt3 --- A cross-platform application and UI framework
(define-public qt3
  (package
    (name "qt3")
    (version "1:3.3.8b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qt3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A cross-platform application and UI framework")
    (description "A cross-platform application and UI framework.  This package is imported from the Arch User Repository.")
    (home-page "http://qt.io")
    (license license:gpl3+)))

;;; adbfs-rootless-git --- fuse filesystem over adb tool for android devices, no device root required
(define-public adbfs-rootless-git
  (package
    (name "adbfs-rootless-git")
    (version "r112.fd56381")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/adbfs-rootless-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fuse filesystem over adb tool for android devices, no device root required")
    (description "fuse filesystem over adb tool for android devices, no device root required.  This package is imported from the Arch User Repository.")
    (home-page "https://github.com/spion/adbfs-rootless")
    (license license:bsd-3)))

;;; par --- paragraph reformatter
(define-public par
  (package
    (name "par")
    (version "1.53")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/par.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "paragraph reformatter")
    (description "Paragraph reformatter.  This package is imported from the Arch User Repository.")
    (home-page "http://www.nicemice.net/par/")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; xorg-server-bug865 --- xorg X server with the patch for freedesktop bug 865 (need to kick hotkeys ..
(define-public xorg-server-bug865
  (package
    (name "xorg-server-bug865")
    (version "21.1.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xorg-server-bug865.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xorg X server with the patch for freedesktop bug 865 (need to kick hotkeys ..")
    (description "Xorg X server with the patch for freedesktop bug 865 (need to kick hotkeys on release, not press).  This package is imported from the Arch User Repository.")
    (home-page "https://xorg.freedesktop.org")
    (license (list license:bsd-3 license:hpnd (license:nonfree "https://aur.archlinux.org") license:isc license:expat license:x11))))

;;; apache-flex-sdk --- the open-source framework for building expressive web and mobile applications
(define-public apache-flex-sdk
  (package
    (name "apache-flex-sdk")
    (version "4.16.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/apache-flex-sdk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the open-source framework for building expressive web and mobile applications")
    (description "The open-source framework for building expressive web and mobile applications.  This package is imported from the Arch User Repository.")
    (home-page "https://flex.apache.org/")
    (license license:asl2.0)))

;;; cairo-dock-git --- light eye-candy fully themable animated dock
(define-public cairo-dock-git
  (package
    (name "cairo-dock-git")
    (version "3.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cairo-dock-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "light eye-candy fully themable animated dock")
    (description "Light eye-candy fully themable animated dock.  This package is imported from the Arch User Repository.")
    (home-page "http://glx-dock.org/")
    (license license:gpl3+)))

;;; eclipse-subclipse --- subversion integration for the Eclipse platform
(define-public eclipse-subclipse
  (package
    (name "eclipse-subclipse")
    (version "4.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eclipse-subclipse.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "subversion integration for the Eclipse platform")
    (description "Subversion integration for the Eclipse platform.  This package is imported from the Arch User Repository.")
    (home-page "https://github.com/subclipse/subclipse")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; glib2-git --- low Level Core Library
(define-public glib2-git
  (package
    (name "glib2-git")
    (version "2.86.0.r146.gd54816d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/glib2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "low Level Core Library")
    (description "Low Level Core Library.  This package is imported from the Arch User Repository.")
    (home-page "https://gitlab.gnome.org/GNOME/glib")
    (license license:lgpl2.1+)))

;;; glib2-devel-git --- low Level Core Library - development files
(define-public glib2-devel-git
  (package
    (name "glib2-devel-git")
    (version "2.86.0.r146.gd54816d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/glib2-devel-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "low Level Core Library - development files")
    (description "Low Level Core Library - development files.  This package is imported from the Arch User Repository.")
    (home-page "https://gitlab.gnome.org/GNOME/glib")
    (license license:lgpl2.1+)))

;;; terasology --- yet another high resolution game with blocks like Minecraft!
(define-public terasology
  (package
    (name "terasology")
    (version "1:5.4.0alpha24")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/terasology.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "yet another high resolution game with blocks like Minecraft!")
    (description "Yet another high resolution game with blocks like Minecraft!.  This package is imported from the Arch User Repository.")
    (home-page "https://terasology.org")
    (license license:asl2.0)))

;;; tofrodos --- convert ASCII files between the MS-DOS/Windows format and the UNIX format
(define-public tofrodos
  (package
    (name "tofrodos")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tofrodos.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "convert ASCII files between the MS-DOS/Windows format and the UNIX format")
    (description "Convert ASCII files between the MS-DOS/Windows format and the UNIX format.  This package is imported from the Arch User Repository.")
    (home-page "https://www.thefreecountry.com/tofrodos/")
    (license (list license:gpl2 license:gpl3+))))

;;; wmsystemtray --- system tray designed as a Window Maker dockapp
(define-public wmsystemtray
  (package
    (name "wmsystemtray")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wmsystemtray.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "system tray designed as a Window Maker dockapp")
    (description "system tray designed as a Window Maker dockapp.  This package is imported from the Arch User Repository.")
    (home-page "http://wmsystemtray.sourceforge.net/")
    (license license:gpl3+)))

;;; all-repository-fonts --- meta package for all fonts in the official repositories
(define-public all-repository-fonts
  (package
    (name "all-repository-fonts")
    (version "20260410")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/all-repository-fonts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "meta package for all fonts in the official repositories")
    (description "Meta package for all fonts in the official repositories.  This package is imported from the Arch User Repository.")
    (home-page "https://aur.archlinux.org/packages/all-repository-fonts/")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; etcd --- A distributed, reliable key-value store for the most critical data of a dis..
(define-public etcd
  (package
    (name "etcd")
    (version "3.6.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/etcd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A distributed, reliable key-value store for the most critical data of a dis..")
    (description "A distributed, reliable key-value store for the most critical data of a distributed system.  This package is imported from the Arch User Repository.")
    (home-page "https://github.com/etcd-io/etcd")
    (license license:asl2.0)))

;;; mozillavpn --- fast, secure, and easy to use VPN from the makers of Firefox
(define-public mozillavpn
  (package
    (name "mozillavpn")
    (version "2.36.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mozillavpn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast, secure, and easy to use VPN from the makers of Firefox")
    (description "Fast, secure, and easy to use VPN from the makers of Firefox.  This package is imported from the Arch User Repository.")
    (home-page "https://vpn.mozilla.org")
    (license license:mpl2.0)))

;;; vcmi-git --- open-source engine for Heroes of Might and Magic III
(define-public vcmi-git
  (package
    (name "vcmi-git")
    (version "1.7.3.73.gb41a40bc9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vcmi-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source engine for Heroes of Might and Magic III")
    (description "Open-source engine for Heroes of Might and Magic III.  This package is imported from the Arch User Repository.")
    (home-page "http://vcmi.eu")
    (license license:gpl2)))

;;; arch32-light --- lightweight 32-bit chroot intended for 64-bit systems
(define-public arch32-light
  (package
    (name "arch32-light")
    (version "2015")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/arch32-light.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight 32-bit chroot intended for 64-bit systems")
    (description "Lightweight 32-bit chroot intended for 64-bit systems.  This package is imported from the Arch User Repository.")
    (home-page "https://xyne.dev/projects/arch32-light")
    (license license:gpl3+)))

;;; idjc --- powerful client for individuals interested in streaming live radio shows
(define-public idjc
  (package
    (name "idjc")
    (version "0.9.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/idjc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "powerful client for individuals interested in streaming live radio shows")
    (description "Powerful client for individuals interested in streaming live radio shows.  This package is imported from the Arch User Repository.")
    (home-page "http://idjc.sourceforge.net/")
    (license license:gpl2)))

;;; jslint --- easily use JSLint from the command line
(define-public jslint
  (package
    (name "jslint")
    (version "0.12.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jslint.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "easily use JSLint from the command line")
    (description "Easily use JSLint from the command line.  This package is imported from the Arch User Repository.")
    (home-page "https://github.com/reid/node-jslint")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; statnot --- notification daemon for lightweight window managers
(define-public statnot
  (package
    (name "statnot")
    (version "0.0.4.post1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/statnot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "notification daemon for lightweight window managers")
    (description "Notification daemon for lightweight window managers.  This package is imported from the Arch User Repository.")
    (home-page "https://github.com/halhen/statnot")
    (license license:gpl3+)))

;;; wingide --- wing IDE Professional is a full-featured Python IDE for professional progra..
(define-public wingide
  (package
    (name "wingide")
    (version "11.1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wingide.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wing IDE Professional is a full-featured Python IDE for professional progra..")
    (description "Wing IDE Professional is a full-featured Python IDE for professional programmers.  This package is imported from the Arch User Repository.")
    (home-page "https://wingware.com")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; x-tile --- allows you to select a number of windows and tile them in different ways (F..
(define-public x-tile
  (package
    (name "x-tile")
    (version "3.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/x-tile.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "allows you to select a number of windows and tile them in different ways (F..")
    (description "Allows you to select a number of windows and tile them in different ways (Fancyzones for Linux).  This package is imported from the Arch User Repository.")
    (home-page "https://www.giuspen.com/x-tile")
    (license license:gpl2)))

;;; cuda-memtest --- A GPU memory test utility for NVIDIA and AMD GPUs
(define-public cuda-memtest
  (package
    (name "cuda-memtest")
    (version "r83.dd723aa")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cuda_memtest.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A GPU memory test utility for NVIDIA and AMD GPUs")
    (description "A GPU memory test utility for NVIDIA and AMD GPUs.  This package is imported from the Arch User Repository.")
    (home-page "https://github.com/ComputationalRadiationPhysics/cuda_memtest")
    (license (license:nonfree "https://aur.archlinux.org"))))

;;; enigma-sdl --- puzzle game inspired by Oxyd on the Atari ST and Rock'n'Roll on the Amiga
(define-public enigma-sdl
  (package
    (name "enigma-sdl")
    (version "1.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/enigma_sdl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "puzzle game inspired by Oxyd on the Atari ST and Rock'n'Roll on the Amiga")
    (description "Puzzle game inspired by Oxyd on the Atari ST and Rock'n'Roll on the Amiga.  This package is imported from the Arch User Repository.")
    (home-page "http://www.nongnu.org/enigma/")
    (license license:gpl3+)))

;;; feedthebeast-classic --- feed The Beast offers many different styles of Minecraft modpacks to the co..
(define-public feedthebeast-classic
  (package
    (name "feedthebeast-classic")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/feedthebeast-classic.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "feed The Beast offers many different styles of Minecraft modpacks to the co..")
    (description "Feed The Beast offers many different styles of Minecraft modpacks to the community, catering to all tastes.  This package is imported from the Arch User Repository.")
    (home-page "https://feed-the-beast.com/")
    (license license:asl2.0)))

;;; gapi-ocaml --- A simple OCaml client for Google Services
(define-public gapi-ocaml
  (package
    (name "gapi-ocaml")
    (version "0.4.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gapi-ocaml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A simple OCaml client for Google Services")
    (description "A simple OCaml client for Google Services.  This package is imported from the Arch User Repository.")
    (home-page "https://astrada.github.io/gapi-ocaml/")
    (license license:expat)))

;;; hg-git-hg --- the Hg-Git mercurial plugin
(define-public hg-git-hg
  (package
    (name "hg-git-hg")
    (version "1951.e799e4fad448")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hg-git-hg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Hg-Git mercurial plugin")
    (description "the Hg-Git mercurial plugin.  This package is imported from the Arch User Repository.")
    (home-page "http://hg-git.github.io/")
    (license license:gpl2)))

;;; libreswan --- IPsec implementation with IKEv1 and IKEv2 keying protocols
(define-public libreswan
  (package
    (name "libreswan")
    (version "5.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libreswan.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "IPsec implementation with IKEv1 and IKEv2 keying protocols")
    (description "IPsec implementation with IKEv1 and IKEv2 keying protocols.  This package is imported from the Arch User Repository.")
    (home-page "https://libreswan.org/")
    (license (list license:gpl3+ license:mpl2.0))))

;;; libvpx-git --- VP8 and VP9 video codecs (git version)
(define-public libvpx-git
  (package
    (name "libvpx-git")
    (version "1.11.0.r198.ge8579cc3d4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libvpx-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "VP8 and VP9 video codecs (git version)")
    (description "VP8 and VP9 video codecs (git version).  This package is imported from the Arch User Repository.")
    (home-page "https://www.webmproject.org/")
    (license license:bsd-3)))

;;; mumble-git --- an Open Source, low-latency, high quality voice chat software (git version)
(define-public mumble-git
  (package
    (name "mumble-git")
    (version "1:1.6.870.r2.gc73aee6e4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mumble-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an Open Source, low-latency, high quality voice chat software (git version)")
    (description "An Open Source, low-latency, high quality voice chat software (git version).  This package is imported from the Arch User Repository.")
    (home-page "https://www.mumble.info")
    (license license:bsd-3)))

;;; slingshot-python3 --- A 2D strategy game in the gravity fields of several planets (python3 port)
(define-public slingshot-python3
  (package
    (name "slingshot-python3")
    (version "1:0.9+5+g243aef9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/slingshot-python3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A 2D strategy game in the gravity fields of several planets (python3 port)")
    (description "A 2D strategy game in the gravity fields of several planets (python3 port).  This package is imported from the Arch User Repository.")
    (home-page "https://github.com/indritbashkimi/slingshot")
    (license license:gpl3+)))

;;; zerobrane-studio --- A lightweight Lua-based IDE for Lua
(define-public zerobrane-studio
  (package
    (name "zerobrane-studio")
    (version "2.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zerobrane-studio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A lightweight Lua-based IDE for Lua")
    (description "A lightweight Lua-based IDE for Lua.  This package is imported from the Arch User Repository.")
    (home-page "https://studio.zerobrane.com/")
    (license license:expat)))

;;; fbpdf-git --- A small framebuffer pdf viewer, based on MuPDF
(define-public fbpdf-git
  (package
    (name "fbpdf-git")
    (version "r107.6a0d77f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fbpdf-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A small framebuffer pdf viewer, based on MuPDF")
    (description "A small framebuffer pdf viewer, based on MuPDF.  This package is imported from the Arch User Repository.")
    (home-page "https://github.com/aligrudi/fbpdf")
    (license license:isc)))

;;; pix --- image viewer and browser based on gthumb. X-Apps Project
(define-public pix
  (package
    (name "pix")
    (version "3.4.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pix.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "image viewer and browser based on gthumb. X-Apps Project")
    (description "Image viewer and browser based on gthumb. X-Apps Project.")
    (home-page "https://github.com/linuxmint/pix")
    (license license:gpl2+)))

;;; opensnitch-git --- A GNU/Linux port of the Little Snitch application firewall
(define-public opensnitch-git
  (package
    (name "opensnitch-git")
    (version "1.8.0.r18.65480fa5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/opensnitch-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A GNU/Linux port of the Little Snitch application firewall")
    (description "A GNU/Linux port of the Little Snitch application firewall.  This package is imported from the Arch User Repository.")
    (home-page "https://github.com/evilsocket/opensnitch")
    (license license:gpl3)))

;;; revelation --- password manager for the GNOME desktop
(define-public revelation
  (package
    (name "revelation")
    (version "0.5.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/revelation.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "password manager for the GNOME desktop")
    (description "Password manager for the GNOME desktop.  This package is imported from the Arch User Repository.")
    (home-page "https://github.com/mikelolasagasti/revelation")
    (license license:gpl2+)))

;;; xinit-xsession --- allows ~/.xinitrc to be run as a session from your display manager
(define-public xinit-xsession
  (package
    (name "xinit-xsession")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xinit-xsession.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "allows ~/.xinitrc to be run as a session from your display manager")
    (description "Allows ~/.xinitrc to be run as a session from your display manager.")
    (home-page "https://aur.archlinux.org/packages/xinit-xsession")
    (license license:gpl3)))

;;; e-modules-extra-git --- enlightenment modules: Extra unsupported modules in Git not already package..
(define-public e-modules-extra-git
  (package
    (name "e-modules-extra-git")
    (version "20260221")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/e-modules-extra-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enlightenment modules: Extra unsupported modules in Git not already package..")
    (description "Enlightenment modules: Extra unsupported modules in Git not already packaged elsewhere.  This package is imported from the Arch User Repository.")
    (home-page "https://git.enlightenment.org/")
    (license (list license:gpl3+ license:expat))))

;;; gspiceui --- A GUI to various freely available Spice electronic ciruit simulators
(define-public gspiceui
  (package
    (name "gspiceui")
    (version "1.2.87")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gspiceui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A GUI to various freely available Spice electronic ciruit simulators")
    (description "A GUI to various freely available Spice electronic ciruit simulators.  This package is imported from the Arch User Repository.")
    (home-page "http://users.tpg.com.au/micksw012/gspiceui.html")
    (license license:gpl3+)))
