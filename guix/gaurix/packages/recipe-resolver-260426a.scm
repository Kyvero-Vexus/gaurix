;; -*- mode: scheme; coding: utf-8 -*-
;;; recipe-resolver-260426a: 100 packages attempted (100 recipes, 0 blocked)
;;; Generated from AUR PKGBUILDs via queue-drain pass.

(define-module (gaurix packages recipe-resolver-260426a)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
   exact-audio-copy
   gcc12-fortran
   cachyos-ksm-settings-git
   obsidian-level-maker-unstable
   metasploit-git
   xeme-docs-hg
   mozilla-conf-openssh
   libxnvctrl-390xx
   ufraw-thumbnailer
   gowin-eda-ide
   video-downloader-longyinstudio
   libadwaita-docs-git
   libadwaita-demos-git
   limine-dracut-support-git
   qt-installer-framework
   libcurl-compat-git
   neovim-lion-opt-git
   alephone-marathon2
   alephone-infinity
   ndiff-git
   iqmol
   gvfs-nfs-git
   gvfs-mtp-git
   gvfs-gphoto2-git
   lasso-launcher
   java-openjfx-license
   libmm-glib-dev
   d1x-rebirth-git
   qt6-base-git
   bip39-generator-git
   mysql-clients84
   libmysqlclient84
   cassette-git
   openxr-loader-git
   openxr-layers-git
   python-qiskit-addon-obp
   accutimes
   logo-ls
   servicemaster-git
   perl-file-scan-clamav
   miunlocktool-git
   librewolf-extension-multi-account-containers
   redshift-gtk-git
   qdrant
   hyperion.ng-git
   lylibrary
   mutter-mobile
   collabora-online-server-nodocker
   k0sctl
   radiotray
   sensors-lxpanel-plugin
   shadow-tech
   systester
   nginx-unit-ruby
   nginx-unit-python
   nginx-unit-php-legacy
   brother-hll2360d
   windows2usb
   stonks
   rbenv-git
   tcpslice
   gamera
   dh-autoreconf
   mosek
   lemurs-git
   trash-d
   runit-systemd
   acc
   swgemu
   perl-io-compress-lzma
   headsetkontrol
   googlekeep
   vcluster
   storyboarder-appimage
   perfmode
   linuxdeploy-appimage
   gtk3-docs-git
   gtk3-demos-git
   gcadapter-oc-dkms
   ficy
   7clock
   vsd
   tuisky
   python-miasm-git
   plex-hama-git
   plex-ass-scanner-git
   plasma6-applets-wallhaven-reborn-git
   netbsd-curses
   libblkio
   lando-beta
   ivm
   inko
   gotests
   gnome-shell-mobile-docs
   gnome-shell-mobile
   g15ctrld
   framework-sensors-git
   flowee-pay
   describe-commit-git
   boost1.86
   ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; exact-audio-copy — A precise CD audio grabber for creating perfect quality rips using CD 
(define-public exact-audio-copy
  (package
    (name "exact-audio-copy")
    (version "1.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/exact-audio-copy.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.exactaudiocopy.de/en/")
    (synopsis "A precise CD audio grabber for creating perfect quality rips using CD and DVD...")
    (description "A precise CD audio grabber for creating perfect quality rips using CD and DVD drives.")
    (license license:nonfree)))

;;; gcc12-fortran — Fortran front-end for GCC (12.x.x)
(define-public gcc12-fortran
  (package
    (name "gcc12-fortran")
    (version "12.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcc12-fortran.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gcc.gnu.org")
    (synopsis "fortran front-end for GCC (12.x.x)")
    (description "Fortran front-end for GCC (12.x.x).")
    (license license:nonfree)))

;;; cachyos-ksm-settings-git — Package for easy configuration of kernel samepage merding (KSM) via co
(define-public cachyos-ksm-settings-git
  (package
    (name "cachyos-ksm-settings-git")
    (version "4.r3.20250629.62660947")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cachyos-ksm-settings-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/CachyOS/CachyOS-PKGBUILDS/tree/master/cachyos-ksm-settings")
    (synopsis "package for easy configuration of kernel samepage merding (KSM) via commandli...")
    (description "Package for easy configuration of kernel samepage merding (KSM) via commandline or systemd.  Replaces 'uksmd'.")
    (license license:gpl3+)))

;;; obsidian-level-maker-unstable — Random level generator for classic FPS titles, unstable version.
(define-public obsidian-level-maker-unstable
  (package
    (name "obsidian-level-maker-unstable")
    (version "21.20250407")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/obsidian-level-maker-unstable.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://obsidian-level-maker.github.io")
    (synopsis "random level generator for classic FPS titles, unstable version")
    (description "Random level generator for classic FPS titles, unstable version.")
    (license license:gpl2)))

;;; metasploit-git — Advanced open-source platform for developing, testing, and using explo
(define-public metasploit-git
  (package
    (name "metasploit-git")
    (version "6.3.31.71421.28ba19a12f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/metasploit-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.metasploit.com/")
    (synopsis "advanced open-source platform for developing, testing, and using exploit code")
    (description "Advanced open-source platform for developing, testing, and using exploit code.")
    (license license:bsd-3)))

;;; xeme-docs-hg — A high level XMPP parsing library based on GObjects. (documentation)
(define-public xeme-docs-hg
  (package
    (name "xeme-docs-hg")
    (version "63.fe3187889638")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xeme-docs-hg.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://keep.imfreedom.org/xeme/xeme/")
    (synopsis "A high level XMPP parsing library based on GObjects. (documentation)")
    (description "A high level XMPP parsing library based on GObjects. (documentation).")
    (license license:lgpl2.1+)))

;;; mozilla-conf-openssh — Mozilla infosec guidelines configuration for OpenSSH
(define-public mozilla-conf-openssh
  (package
    (name "mozilla-conf-openssh")
    (version "20250327")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mozilla-conf-openssh.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://infosec.mozilla.org/guidelines/openssh")
    (synopsis "mozilla infosec guidelines configuration for OpenSSH")
    (description "Mozilla infosec guidelines configuration for OpenSSH.")
    (license license:expat)))

;;; libxnvctrl-390xx — NVIDIA NV-CONTROL X extension, 390xx legacy branch
(define-public libxnvctrl-390xx
  (package
    (name "libxnvctrl-390xx")
    (version "390.157")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libxnvctrl-390xx.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/NVIDIA/nvidia-settings")
    (synopsis "nVIDIA NV-CONTROL X extension, 390xx legacy branch")
    (description "NVIDIA NV-CONTROL X extension, 390xx legacy branch.")
    (license license:gpl2)))

;;; ufraw-thumbnailer — Provides thumbnailer definition to generate thumbnails for RAW images 
(define-public ufraw-thumbnailer
  (package
    (name "ufraw-thumbnailer")
    (version "0.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ufraw-thumbnailer.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://aur.archlinux.org/packages/ufraw-thumbnailer")
    (synopsis "provides thumbnailer definition to generate thumbnails for RAW images in file...")
    (description "Provides thumbnailer definition to generate thumbnails for RAW images in file managers like Nautilus or Nemo.")
    (license license:gpl2)))

;;; gowin-eda-ide — Gowin EDA IDE - Gowin EDA, an easy to use integrated design environmen
(define-public gowin-eda-ide
  (package
    (name "gowin-eda-ide")
    (version "1.9.12.02")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gowin-eda-ide.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.gowinsemi.com.cn/software/index")
    (synopsis "gowin EDA IDE - Gowin EDA, an easy to use integrated design environment provi...")
    (description "Gowin EDA IDE - Gowin EDA, an easy to use integrated design environment provides design engineers one-stop solution from design entry to verification.")
    (license license:nonfree)))

;;; video-downloader-longyinstudio — Download videos from websites like YouTube and many others (based on y
(define-public video-downloader-longyinstudio
  (package
    (name "video-downloader-longyinstudio")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/video-downloader-longyinstudio.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/LongYinStudio/video-downloader")
    (synopsis "download videos from websites like YouTube and many others (based on yt-dlp)")
    (description "Download videos from websites like YouTube and many others (based on yt-dlp).")
    (license license:expat)))

;;; libadwaita-docs-git — Building blocks for modern adaptive GNOME applications (documentation)
(define-public libadwaita-docs-git
  (package
    (name "libadwaita-docs-git")
    (version "1.6.rc.r16.g6e98d61")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libadwaita-docs-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gnome.pages.gitlab.gnome.org/libadwaita")
    (synopsis "building blocks for modern adaptive GNOME applications (documentation)")
    (description "Building blocks for modern adaptive GNOME applications (documentation).")
    (license license:lgpl2.1+)))

;;; libadwaita-demos-git — Building blocks for modern adaptive GNOME applications (demo applicati
(define-public libadwaita-demos-git
  (package
    (name "libadwaita-demos-git")
    (version "1.6.rc.r16.g6e98d61")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libadwaita-demos-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gnome.pages.gitlab.gnome.org/libadwaita")
    (synopsis "building blocks for modern adaptive GNOME applications (demo applications)")
    (description "Building blocks for modern adaptive GNOME applications (demo applications).")
    (license license:lgpl2.1+)))

;;; limine-dracut-support-git — Install kernels for the Limine bootloader.
(define-public limine-dracut-support-git
  (package
    (name "limine-dracut-support-git")
    (version "r618.d4ee4fc")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/limine-dracut-support-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/Zesko/limine-entry-tool")
    (synopsis "install kernels for the Limine bootloader")
    (description "Install kernels for the Limine bootloader.")
    (license license:gpl3)))

;;; qt-installer-framework — The Qt Installer Framework used for the Qt SDK installer
(define-public qt-installer-framework
  (package
    (name "qt-installer-framework")
    (version "4.11.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qt-installer-framework.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://qt-project.org/wiki/Qt-Installer-Framework")
    (synopsis "The Qt Installer Framework used for the Qt SDK installer")
    (description "The Qt Installer Framework used for the Qt SDK installer.")
    (license license:nonfree)))

;;; libcurl-compat-git — A command line tool and library for transferring data with URLs (no ve
(define-public libcurl-compat-git
  (package
    (name "libcurl-compat-git")
    (version "8.7.1.r201.gc8e0cd1de8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libcurl-compat-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://curl.se/")
    (synopsis "A command line tool and library for transferring data with URLs (no versioned...")
    (description "A command line tool and library for transferring data with URLs (no versioned symbols).")
    (license license:expat)))

;;; neovim-lion-opt-git — A simple alignment operator for (neo)vim.
(define-public neovim-lion-opt-git
  (package
    (name "neovim-lion-opt-git")
    (version "56.75306ac")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/neovim-lion-opt-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tommcdo/vim-lion")
    (synopsis "A simple alignment operator for (neo)vim")
    (description "A simple alignment operator for (neo)vim.")
    (license license:vim)))

;;; alephone-marathon2 — Marathon 2 scenario data files for Aleph One
(define-public alephone-marathon2
  (package
    (name "alephone-marathon2")
    (version "20250829")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/alephone-marathon2.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://alephone.lhowon.org/")
    (synopsis "marathon 2 scenario data files for Aleph One")
    (description "Marathon 2 scenario data files for Aleph One.")
    (license license:nonfree)))

;;; alephone-infinity — Marathon Infinity scenario data files for Aleph One
(define-public alephone-infinity
  (package
    (name "alephone-infinity")
    (version "20250829")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/alephone-infinity.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://alephone.lhowon.org/")
    (synopsis "marathon Infinity scenario data files for Aleph One")
    (description "Marathon Infinity scenario data files for Aleph One.")
    (license license:nonfree)))

;;; ndiff-git — Compare two Nmap XML files and display a list of their differences
(define-public ndiff-git
  (package
    (name "ndiff-git")
    (version "7.98.r65.g30f85c0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ndiff-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nmap/nmap")
    (synopsis "compare two Nmap XML files and display a list of their differences")
    (description "Compare two Nmap XML files and display a list of their differences.")
    (license license:nonfree)))

;;; iqmol — A molecular editor and visualization package with Q-Chem integration
(define-public iqmol
  (package
    (name "iqmol")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/iqmol.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://iqmol.org")
    (synopsis "A molecular editor and visualization package with Q-Chem integration")
    (description "A molecular editor and visualization package with Q-Chem integration.")
    (license license:gpl3)))

;;; gvfs-nfs-git — Virtual filesystem implementation for GIO (NFS backend)
(define-public gvfs-nfs-git
  (package
    (name "gvfs-nfs-git")
    (version "1.58.0+3+g04b74878")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gvfs-nfs-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wiki.gnome.org/Projects/gvfs")
    (synopsis "virtual filesystem implementation for GIO (NFS backend)")
    (description "Virtual filesystem implementation for GIO (NFS backend).")
    (license license:lgpl2.1)))

;;; gvfs-mtp-git — Virtual filesystem implementation for GIO (MTP backend; Android, media
(define-public gvfs-mtp-git
  (package
    (name "gvfs-mtp-git")
    (version "1.58.0+3+g04b74878")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gvfs-mtp-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wiki.gnome.org/Projects/gvfs")
    (synopsis "virtual filesystem implementation for GIO (MTP backend; Android, media player)")
    (description "Virtual filesystem implementation for GIO (MTP backend; Android, media player).")
    (license license:lgpl2.1)))

;;; gvfs-gphoto2-git — Virtual filesystem implementation for GIO (gphoto2 backend; PTP camera
(define-public gvfs-gphoto2-git
  (package
    (name "gvfs-gphoto2-git")
    (version "1.58.0+3+g04b74878")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gvfs-gphoto2-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wiki.gnome.org/Projects/gvfs")
    (synopsis "virtual filesystem implementation for GIO (gphoto2 backend; PTP camera, MTP m...")
    (description "Virtual filesystem implementation for GIO (gphoto2 backend; PTP camera, MTP media player).")
    (license license:lgpl2.1)))

;;; lasso-launcher — LASSO Actively Simplifies System Operations. LASSO is a hackable deskt
(define-public lasso-launcher
  (package
    (name "lasso-launcher")
    (version "v25.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lasso-launcher.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gro-david/lasso")
    (synopsis "LASSO Actively Simplifies System Operations. LASSO is a hackable desktop laun...")
    (description "LASSO Actively Simplifies System Operations.  LASSO is a hackable desktop launcher, combined with a dashboard and system bar.  It features a simple terminal based interface.")
    (license license:expat)))

;;; java-openjfx-license — License for Java OpenJFX client application platform (open-source impl
(define-public java-openjfx-license
  (package
    (name "java-openjfx-license")
    (version "23.0.2.u3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/java-openjfx-license.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wiki.openjdk.java.net/display/OpenJFX/Main")
    (synopsis "license for Java OpenJFX client application platform (open-source implementat...")
    (description "License for Java OpenJFX client application platform (open-source implementation of JavaFX) - version following latest major Arch Linux OpenJDK java release.")
    (license license:gpl2+)))

;;; libmm-glib-dev — ModemManager library
(define-public libmm-glib-dev
  (package
    (name "libmm-glib-dev")
    (version "1.25.95_dev")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libmm-glib-dev.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.freedesktop.org/wiki/Software/ModemManager/")
    (synopsis "modemManager library")
    (description "ModemManager library.")
    (license license:gpl2+)))

;;; d1x-rebirth-git — A source port of the Descent engine (git version)
(define-public d1x-rebirth-git
  (package
    (name "d1x-rebirth-git")
    (version "0.60.0.beta2.r3919.gf40f9c006")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/d1x-rebirth-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.dxx-rebirth.com/")
    (synopsis "A source port of the Descent engine (git version)")
    (description "A source port of the Descent engine (git version).")
    (license license:gpl3)))

;;; qt6-base-git — A cross-platform application and UI framework
(define-public qt6-base-git
  (package
    (name "qt6-base-git")
    (version "6.8.0_r69786.g8f5ee7acbdf")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qt6-base-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.qt.io")
    (synopsis "A cross-platform application and UI framework")
    (description "A cross-platform application and UI framework.")
    (license license:nonfree)))

;;; bip39-generator-git — BIP-39 Mnemonic Generator with optional user provided and keyboard ent
(define-public bip39-generator-git
  (package
    (name "bip39-generator-git")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bip39-generator-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/FortisCard/bip39-generator")
    (synopsis "BIP-39 Mnemonic Generator with optional user provided and keyboard entropy")
    (description "BIP-39 Mnemonic Generator with optional user provided and keyboard entropy.")
    (license license:asl2.0)))

;;; mysql-clients84 — MySQL client tools, community edition, v8.4
(define-public mysql-clients84
  (package
    (name "mysql-clients84")
    (version "8.4.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mysql-clients84.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.mysql.com/products/community/")
    (synopsis "MySQL client tools, community edition, v8.4")
    (description "MySQL client tools, community edition, v8.4.")
    (license license:gpl2)))

;;; libmysqlclient84 — MySQL client libraries, community edition, v8.4
(define-public libmysqlclient84
  (package
    (name "libmysqlclient84")
    (version "8.4.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libmysqlclient84.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.mysql.com/products/community/")
    (synopsis "MySQL client libraries, community edition, v8.4")
    (description "MySQL client libraries, community edition, v8.4.")
    (license license:gpl2)))

;;; cassette-git — GTK4/Adwaita application that allows you to use Yandex Music service o
(define-public cassette-git
  (package
    (name "cassette-git")
    (version "0.2.1.g49.r3.g7763e48")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cassette-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.gnome.org/Rirusha/cassette")
    (synopsis "GTK4/Adwaita application that allows you to use Yandex Music service on Linux...")
    (description "GTK4/Adwaita application that allows you to use Yandex Music service on Linux operating systems.")
    (license license:gpl3+)))

;;; openxr-loader-git — OpenXR loader
(define-public openxr-loader-git
  (package
    (name "openxr-loader-git")
    (version "1.1.38.r0.g650f751")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openxr-loader-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/KhronosGroup/OpenXR-SDK-Source")
    (synopsis "OpenXR loader")
    (description "OpenXR loader.")
    (license license:asl2.0)))

;;; openxr-layers-git — OpenXR Layers, including XR_APILAYER_LUNARG_core_validation
(define-public openxr-layers-git
  (package
    (name "openxr-layers-git")
    (version "1.1.38.r0.g650f751")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openxr-layers-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/KhronosGroup/OpenXR-SDK-Source")
    (synopsis "OpenXR Layers, including XR_APILAYER_LUNARG_core_validation")
    (description "OpenXR Layers, including XR_APILAYER_LUNARG_core_validation.")
    (license license:asl2.0)))

;;; python-qiskit-addon-obp — An addon to reduce the depth of circuits with operator backpropagation
(define-public python-qiskit-addon-obp
  (package
    (name "python-qiskit-addon-obp")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-qiskit-addon-obp.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Qiskit/qiskit-addon-obp")
    (synopsis "An addon to reduce the depth of circuits with operator backpropagation")
    (description "An addon to reduce the depth of circuits with operator backpropagation.")
    (license license:asl2.0)))

;;; accutimes — المواقيت الدقيقة،Accurate Times is the official software adopted by th
(define-public accutimes
  (package
    (name "accutimes")
    (version "5.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/accutimes.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://astronomycenter.net/accut.html")
    (synopsis "المواقيت الدقيقة،Accurate Times is the official software adopted by the Jorda...")
    (description "المواقيت الدقيقة،Accurate Times is the official software adopted by the Jordanian Ministry of Islamic Affairs to calculate the prayer times in Jordan.")
    (license license:nonfree)))

;;; logo-ls — Modern ls command with vscode like file icon and git integrations
(define-public logo-ls
  (package
    (name "logo-ls")
    (version "1.3.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/logo-ls.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Yash-Handa/logo-ls")
    (synopsis "modern ls command with vscode like file icon and git integrations")
    (description "Modern ls command with vscode like file icon and git integrations.")
    (license license:expat)))

;;; servicemaster-git — Linux Systemd administration tool with nice TUI written in C.
(define-public servicemaster-git
  (package
    (name "servicemaster-git")
    (version "1.8.0.r172.726aff3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/servicemaster-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lennart1978/servicemaster")
    (synopsis "Linux Systemd administration tool with nice TUI written in C")
    (description "Linux Systemd administration tool with nice TUI written in C.")
    (license license:expat)))

;;; perl-file-scan-clamav — File::Scan::ClamAV - Connect to a local Clam Anti-Virus clamd service
(define-public perl-file-scan-clamav
  (package
    (name "perl-file-scan-clamav")
    (version "1.95")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-file-scan-clamav.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/release/File-Scan-ClamAV")
    (synopsis "file::Scan::ClamAV - Connect to a local Clam Anti-Virus clamd service")
    (description "File::Scan::ClamAV - Connect to a local Clam Anti-Virus clamd service.")
    (license license:perl-license)))

;;; miunlocktool-git — MiUnlockTool developed to retrieve encryptData(token) for Xiaomi devic
(define-public miunlocktool-git
  (package
    (name "miunlocktool-git")
    (version "1.6.9.r9.g6c62051")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/miunlocktool-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/offici5l/MiUnlockTool")
    (synopsis "miUnlockTool developed to retrieve encryptData(token) for Xiaomi devices for ...")
    (description "MiUnlockTool developed to retrieve encryptData(token) for Xiaomi devices for unlocking bootloader, It is compatible with all platforms.")
    (license license:asl2.0)))

;;; librewolf-extension-multi-account-containers — Keep parts of your online life separated into color-coded tabs
(define-public librewolf-extension-multi-account-containers
  (package
    (name "librewolf-extension-multi-account-containers")
    (version "8.3.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/librewolf-extension-multi-account-containers.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mozilla/multi-account-containers")
    (synopsis "keep parts of your online life separated into color-coded tabs")
    (description "Keep parts of your online life separated into color-coded tabs.")
    (license license:mpl2.0)))

;;; redshift-gtk-git — Adjusts the color temperature of your screen according to your surroun
(define-public redshift-gtk-git
  (package
    (name "redshift-gtk-git")
    (version "1.12.r40.g490ba2a")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/redshift-gtk-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://jonls.dk/redshift/")
    (synopsis "adjusts the color temperature of your screen according to your surroundings (...")
    (description "Adjusts the color temperature of your screen according to your surroundings (development version).")
    (license license:gpl3)))

;;; qdrant — Vector Database for the next generation of AI applications
(define-public qdrant
  (package
    (name "qdrant")
    (version "1.17.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qdrant.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://qdrant.tech")
    (synopsis "vector Database for the next generation of AI applications")
    (description "Vector Database for the next generation of AI applications.")
    (license license:asl2.0)))

;;; hyperion.ng-git — The reworked version (next generation) of Hyperion, ambient light soft
(define-public hyperion.ng-git
  (package
    (name "hyperion.ng-git")
    (version "nightly.r0.44cec2e2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hyperion.ng-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hyperion-project/hyperion.ng")
    (synopsis "The reworked version (next generation) of Hyperion, ambient light software")
    (description "The reworked version (next generation) of Hyperion, ambient light software.")
    (license license:expat)))

;;; lylibrary — LyLibrary provides everything necessary to the books cataloguing, the 
(define-public lylibrary
  (package
    (name "lylibrary")
    (version "3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lylibrary.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.codelinsoft.it/sito/2013-11-17-17-56-34/lylibrary.html#")
    (synopsis "lyLibrary provides everything necessary to the books cataloguing, the loans m...")
    (description "LyLibrary provides everything necessary to the books cataloguing, the loans management and the registration of the library readers.")
    (license license:lgpl2.1)))

;;; mutter-mobile — Window manager and compositor for GNOME
(define-public mutter-mobile
  (package
    (name "mutter-mobile")
    (version "48.r0.g7cb1e9b")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mutter-mobile.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.gnome.org/verdre/mutter-mobile")
    (synopsis "window manager and compositor for GNOME")
    (description "Window manager and compositor for GNOME.")
    (license license:gpl2+)))

;;; collabora-online-server-nodocker — No description available
(define-public collabora-online-server-nodocker
  (package
    (name "collabora-online-server-nodocker")
    (version "25.04.8.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/collabora-online-server-nodocker.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.collaboraonline.com/code/")
    (synopsis "no description available")
    (description "No description available.")
    (license license:mpl2.0)))

;;; k0sctl — A bootstrapping and management tool for k0s clusters.
(define-public k0sctl
  (package
    (name "k0sctl")
    (version "0.29.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/k0sctl.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/k0sproject/k0sctl")
    (synopsis "A bootstrapping and management tool for k0s clusters")
    (description "A bootstrapping and management tool for k0s clusters.")
    (license license:asl2.0)))

;;; radiotray — An online radio streaming player that runs on a Linux system tray.
(define-public radiotray
  (package
    (name "radiotray")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/radiotray.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://radiotray.wordpress.com/")
    (synopsis "An online radio streaming player that runs on a Linux system tray")
    (description "An online radio streaming player that runs on a Linux system tray.")
    (license license:gpl2)))

;;; sensors-lxpanel-plugin — Monitor temperature/voltages/fan speeds in LXDE through lm-sensors.
(define-public sensors-lxpanel-plugin
  (package
    (name "sensors-lxpanel-plugin")
    (version "1.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sensors-lxpanel-plugin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://danamlund.dk/sensors_lxpanel_plugin")
    (synopsis "monitor temperature/voltages/fan speeds in LXDE through lm-sensors")
    (description "Monitor temperature/voltages/fan speeds in LXDE through lm-sensors.")
    (license license:gpl2)))

;;; shadow-tech — Desktop client for Shadow Tech cloud gaming service.
(define-public shadow-tech
  (package
    (name "shadow-tech")
    (version "9.9.10175")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/shadow-tech.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://shadow.tech")
    (synopsis "desktop client for Shadow Tech cloud gaming service")
    (description "Desktop client for Shadow Tech cloud gaming service.")
    (license license:nonfree)))

;;; systester — System Stability Tester is a RAM/CPU burning and benchmarking program 
(define-public systester
  (package
    (name "systester")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/systester.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://systester.sourceforge.net/")
    (synopsis "system Stability Tester is a RAM/CPU burning and benchmarking program based o...")
    (description "System Stability Tester is a RAM/CPU burning and benchmarking program based on calculating pi.")
    (license license:gpl2)))

;;; nginx-unit-ruby — Lightweight, dynamic, open-source server for diverse web applications.
(define-public nginx-unit-ruby
  (package
    (name "nginx-unit-ruby")
    (version "1.31.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nginx-unit-ruby.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://unit.nginx.org/")
    (synopsis "lightweight, dynamic, open-source server for diverse web applications")
    (description "Lightweight, dynamic, open-source server for diverse web applications.")
    (license license:asl2.0)))

;;; nginx-unit-python — Lightweight, dynamic, open-source server for diverse web applications.
(define-public nginx-unit-python
  (package
    (name "nginx-unit-python")
    (version "1.31.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nginx-unit-python.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://unit.nginx.org/")
    (synopsis "lightweight, dynamic, open-source server for diverse web applications")
    (description "Lightweight, dynamic, open-source server for diverse web applications.")
    (license license:asl2.0)))

;;; nginx-unit-php-legacy — Lightweight, dynamic, open-source server for diverse web applications.
(define-public nginx-unit-php-legacy
  (package
    (name "nginx-unit-php-legacy")
    (version "1.31.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nginx-unit-php-legacy.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://unit.nginx.org/")
    (synopsis "lightweight, dynamic, open-source server for diverse web applications")
    (description "Lightweight, dynamic, open-source server for diverse web applications.")
    (license license:asl2.0)))

;;; brother-hll2360d — Brother LPR and CUPS driver for HL-L2360DN, HL-L2360DW, HL-L2365DW
(define-public brother-hll2360d
  (package
    (name "brother-hll2360d")
    (version "3.2.0_1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-hll2360d.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.brother.com")
    (synopsis "brother LPR and CUPS driver for HL-L2360DN, HL-L2360DW, HL-L2365DW")
    (description "Brother LPR and CUPS driver for HL-L2360DN, HL-L2360DW, HL-L2365DW.")
    (license license:gpl2)))

;;; windows2usb — Windows 7/8/8.1/10/11 ISO to Flash Drive burning utility for Linux (MB
(define-public windows2usb
  (package
    (name "windows2usb")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/windows2usb.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ValdikSS/windows2usb")
    (synopsis "windows 7/8/8.1/10/11 ISO to Flash Drive burning utility for Linux (MBR/GPT, ...")
    (description "Windows 7/8/8.1/10/11 ISO to Flash Drive burning utility for Linux (MBR/GPT, BIOS/UEFI, FAT32/NTFS).")
    (license license:asl2.0)))

;;; stonks — Stonks is a terminal based stock visualizer and tracker that displays 
(define-public stonks
  (package
    (name "stonks")
    (version "1.0.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/stonks.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ericm/stonks")
    (synopsis "stonks is a terminal based stock visualizer and tracker that displays realtim...")
    (description "Stonks is a terminal based stock visualizer and tracker that displays realtime stocks in graph format in a terminal.  See how fast your stonks will crash.")
    (license license:gpl3)))

;;; rbenv-git — Simple Ruby version manager
(define-public rbenv-git
  (package
    (name "rbenv-git")
    (version "1.2.0.r46.g52acbdf")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rbenv-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rbenv/rbenv")
    (synopsis "simple Ruby version manager")
    (description "Simple Ruby version manager.")
    (license license:expat)))

;;; tcpslice — A tool for extracting portions of packet-trace files generated using t
(define-public tcpslice
  (package
    (name "tcpslice")
    (version "1.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tcpslice.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.tcpdump.org/")
    (synopsis "A tool for extracting portions of packet-trace files generated using tcpdump'...")
    (description "A tool for extracting portions of packet-trace files generated using tcpdump's -w flag.")
    (license license:bsd-3)))

;;; gamera — Framework for building document analysis applications
(define-public gamera
  (package
    (name "gamera")
    (version "4.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gamera.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hsnr-gamera/gamera-4")
    (synopsis "framework for building document analysis applications")
    (description "Framework for building document analysis applications.")
    (license license:gpl2+)))

;;; dh-autoreconf — debhelper add-on to call autoreconf and clean up after the build
(define-public dh-autoreconf
  (package
    (name "dh-autoreconf")
    (version "22")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dh-autoreconf.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://packages.debian.org/sid/dh-autoreconf")
    (synopsis "debhelper add-on to call autoreconf and clean up after the build")
    (description "debhelper add-on to call autoreconf and clean up after the build.")
    (license license:gpl2)))

;;; mosek — A commercial solver for mathematical optimization problems.
(define-public mosek
  (package
    (name "mosek")
    (version "11.1.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mosek.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.mosek.com")
    (synopsis "A commercial solver for mathematical optimization problems")
    (description "A commercial solver for mathematical optimization problems.")
    (license license:nonfree)))

;;; lemurs-git — TUI Display/Login Manager
(define-public lemurs-git
  (package
    (name "lemurs-git")
    (version "0.3.1.r3.g60fda2a")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lemurs-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/coastalwhite/lemurs")
    (synopsis "tUI Display/Login Manager")
    (description "TUI Display/Login Manager.")
    (license license:asl2.0)))

;;; trash-d — A near drop-in replacement for rm that uses the trash bin. Written in 
(define-public trash-d
  (package
    (name "trash-d")
    (version "21")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/trash-d.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rushsteve1/trash-d")
    (synopsis "A near drop-in replacement for rm that uses the trash bin. Written in D")
    (description "A near drop-in replacement for rm that uses the trash bin.  Written in D.")
    (license license:expat)))

;;; runit-systemd — A service supervision scheme, intended to be used alongside systemd
(define-public runit-systemd
  (package
    (name "runit-systemd")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/runit-systemd.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://smarden.org/runit/")
    (synopsis "A service supervision scheme, intended to be used alongside systemd")
    (description "A service supervision scheme, intended to be used alongside systemd.")
    (license license:bsd-3)))

;;; acc — ACS script compiler for use with ZDoom and/or Hexen
(define-public acc
  (package
    (name "acc")
    (version "1.60")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/acc.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rheit/acc")
    (synopsis "aCS script compiler for use with ZDoom and/or Hexen")
    (description "ACS script compiler for use with ZDoom and/or Hexen.")
    (license license:nonfree)))

;;; swgemu — Launcher for Star Wars Galaxies Emulator
(define-public swgemu
  (package
    (name "swgemu")
    (version "0.23")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/swgemu.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.swgemu.com")
    (synopsis "launcher for Star Wars Galaxies Emulator")
    (description "Launcher for Star Wars Galaxies Emulator.")
    (license license:gpl2)))

;;; perl-io-compress-lzma — Write lzma files/buffers
(define-public perl-io-compress-lzma
  (package
    (name "perl-io-compress-lzma")
    (version "2.214")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-io-compress-lzma.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/release/IO-Compress-Lzma")
    (synopsis "write lzma files/buffers")
    (description "Write lzma files/buffers.")
    (license license:gpl2)))

;;; headsetkontrol — Interface for HeadsetControl (by Sapd) written with Kirigami and KDE F
(define-public headsetkontrol
  (package
    (name "headsetkontrol")
    (version "2.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/headsetkontrol.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/TheBill2001/headsetkontrol")
    (synopsis "interface for HeadsetControl (by Sapd) written with Kirigami and KDE Framework")
    (description "Interface for HeadsetControl (by Sapd) written with Kirigami and KDE Framework.")
    (license license:gpl3)))

;;; googlekeep — Unnofficial Google Keep desktop application
(define-public googlekeep
  (package
    (name "googlekeep")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/googlekeep.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/linuxbombay/googlekeep-desktop")
    (synopsis "unnofficial Google Keep desktop application")
    (description "Unnofficial Google Keep desktop application.")
    (license license:gpl2)))

;;; vcluster — Create fully functional virtual Kubernetes clusters
(define-public vcluster
  (package
    (name "vcluster")
    (version "0.32.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vcluster.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://vcluster.com")
    (synopsis "create fully functional virtual Kubernetes clusters")
    (description "Create fully functional virtual Kubernetes clusters.")
    (license license:asl2.0)))

;;; storyboarder-appimage — The best way to visualize your story. It makes it easy to visualize a 
(define-public storyboarder-appimage
  (package
    (name "storyboarder-appimage")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/storyboarder-appimage.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wonderunit.com/storyboarder/")
    (synopsis "The best way to visualize your story. It makes it easy to visualize a story a...")
    (description "The best way to visualize your story.  It makes it easy to visualize a story as fast you can draw stick figures.")
    (license license:nonfree)))

;;; perfmode — A fan-control utility for ASUS TUF Gaming series of Laptops
(define-public perfmode
  (package
    (name "perfmode")
    (version "3.5.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perfmode.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/icebarf/perfmode")
    (synopsis "A fan-control utility for ASUS TUF Gaming series of Laptops")
    (description "A fan-control utility for ASUS TUF Gaming series of Laptops.")
    (license license:gpl2)))

;;; linuxdeploy-appimage — AppDir creation and maintenance tool. Featuring flexible plugin system
(define-public linuxdeploy-appimage
  (package
    (name "linuxdeploy-appimage")
    (version "1.alpha.20251107.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linuxdeploy-appimage.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/linuxdeploy/linuxdeploy")
    (synopsis "appDir creation and maintenance tool. Featuring flexible plugin system")
    (description "AppDir creation and maintenance tool.  Featuring flexible plugin system.")
    (license license:expat)))

;;; gtk3-docs-git — GObject-based multi-platform GUI toolkit (GIT Version) (documentation)
(define-public gtk3-docs-git
  (package
    (name "gtk3-docs-git")
    (version "3.24.41.r22.gc4dd8d0125")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtk3-docs-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.gtk.org/")
    (synopsis "gObject-based multi-platform GUI toolkit (GIT Version) (documentation)")
    (description "GObject-based multi-platform GUI toolkit (GIT Version) (documentation).")
    (license license:lgpl2.0)))

;;; gtk3-demos-git — GObject-based multi-platform GUI toolkit (GIT Version) (demo applicati
(define-public gtk3-demos-git
  (package
    (name "gtk3-demos-git")
    (version "3.24.41.r22.gc4dd8d0125")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtk3-demos-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.gtk.org/")
    (synopsis "gObject-based multi-platform GUI toolkit (GIT Version) (demo applications)")
    (description "GObject-based multi-platform GUI toolkit (GIT Version) (demo applications).")
    (license license:lgpl2.0)))

;;; gcadapter-oc-dkms — Kernel module for overclocking the Nintendo Wii U/Mayflash GameCube ad
(define-public gcadapter-oc-dkms
  (package
    (name "gcadapter-oc-dkms")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcadapter-oc-dkms.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hannesmann/gcadapter-oc-kmod")
    (synopsis "kernel module for overclocking the Nintendo Wii U/Mayflash GameCube adapter")
    (description "Kernel module for overclocking the Nintendo Wii U/Mayflash GameCube adapter.")
    (license license:gpl2)))

;;; ficy — An icecast/shoutcast stream grabber suite
(define-public ficy
  (package
    (name "ficy")
    (version "1.0.21")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ficy.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/wavexx/fIcy")
    (synopsis "An icecast/shoutcast stream grabber suite")
    (description "An icecast/shoutcast stream grabber suite.")
    (license license:lgpl2.1)))

;;; 7clock — A seven-segment display style clock for your terminal
(define-public 7clock
  (package
    (name "7clock")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/7clock.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/wezm/7clock")
    (synopsis "A seven-segment display style clock for your terminal")
    (description "A seven-segment display style clock for your terminal.")
    (license license:asl2.0)))

;;; vsd — Download video streams served over HTTP from websites, HLS and DASH pl
(define-public vsd
  (package
    (name "vsd")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vsd.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/clitic/vsd")
    (synopsis "download video streams served over HTTP from websites, HLS and DASH playlists")
    (description "Download video streams served over HTTP from websites, HLS and DASH playlists.")
    (license license:gpl2+)))

;;; tuisky — A TUI client for Bluesky
(define-public tuisky
  (package
    (name "tuisky")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tuisky.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sugyan/tuisky")
    (synopsis "A TUI client for Bluesky")
    (description "A TUI client for Bluesky.")
    (license license:expat)))

;;; python-miasm-git — Machine code manipulation library
(define-public python-miasm-git
  (package
    (name "python-miasm-git")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-miasm-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://miasm.re/")
    (synopsis "machine code manipulation library")
    (description "Machine code manipulation library.")
    (license license:gpl2+)))

;;; plex-hama-git — Plex HTTP Anidb Metadata Agent (HAMA)
(define-public plex-hama-git
  (package
    (name "plex-hama-git")
    (version "r1072.bb684a2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plex-hama-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ZeroQI/Hama.bundle")
    (synopsis "Plex HTTP Anidb Metadata Agent (HAMA)")
    (description "Plex HTTP Anidb Metadata Agent (HAMA).")
    (license license:gpl3)))

;;; plex-ass-scanner-git — Plex Absolute Series Scanner
(define-public plex-ass-scanner-git
  (package
    (name "plex-ass-scanner-git")
    (version "r1171.33ce1de")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plex-ass-scanner-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ZeroQI/Absolute-Series-Scanner")
    (synopsis "Plex Absolute Series Scanner")
    (description "Plex Absolute Series Scanner.")
    (license license:gpl3)))

;;; plasma6-applets-wallhaven-reborn-git — Wallhaven wallpaper plugin for plasma 6
(define-public plasma6-applets-wallhaven-reborn-git
  (package
    (name "plasma6-applets-wallhaven-reborn-git")
    (version "r67.030bbfe")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma6-applets-wallhaven-reborn-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Blacksuan19/plasma-wallpaper-wallhaven-reborn")
    (synopsis "wallhaven wallpaper plugin for plasma 6")
    (description "Wallhaven wallpaper plugin for plasma 6.")
    (license license:gpl3)))

;;; netbsd-curses — Port of NetBSD's curses library for usage on all POSIX systems
(define-public netbsd-curses
  (package
    (name "netbsd-curses")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/netbsd-curses.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sabotage-linux/netbsd-curses")
    (synopsis "port of NetBSD's curses library for usage on all POSIX systems")
    (description "Port of NetBSD's curses library for usage on all POSIX systems.")
    (license license:bsd-3)))

;;; libblkio — High-performance block device I/O library with C API
(define-public libblkio
  (package
    (name "libblkio")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libblkio.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/libblkio/libblkio")
    (synopsis "high-performance block device I/O library with C API")
    (description "High-performance block device I/O library with C API.")
    (license license:expat)))

;;; lando-beta — A free, open source, cross-platform, local development environment and
(define-public lando-beta
  (package
    (name "lando-beta")
    (version "3.24.0.b12")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lando-beta.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://docs.lando.dev")
    (synopsis "A free, open source, cross-platform, local development environment and DevOps...")
    (description "A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology.")
    (license license:gpl2)))

;;; ivm — The cross-platform Inko version manager
(define-public ivm
  (package
    (name "ivm")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ivm.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://inko-lang.org")
    (synopsis "The cross-platform Inko version manager")
    (description "The cross-platform Inko version manager.")
    (license license:mpl2.0)))

;;; inko — A language for building concurrent software with confidence
(define-public inko
  (package
    (name "inko")
    (version "0.20.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/inko.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://inko-lang.org")
    (synopsis "A language for building concurrent software with confidence")
    (description "A language for building concurrent software with confidence.")
    (license license:mpl2.0)))

;;; gotests — Golang commandline tool that generates table driven tests based on its
(define-public gotests
  (package
    (name "gotests")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gotests.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cweill/gotests")
    (synopsis "golang commandline tool that generates table driven tests based on its target...")
    (description "Golang commandline tool that generates table driven tests based on its target source files function and method signatures.")
    (license license:asl2.0)))

;;; gnome-shell-mobile-docs — Next generation desktop shell (API documentation)
(define-public gnome-shell-mobile-docs
  (package
    (name "gnome-shell-mobile-docs")
    (version "48.r0.gcf9bd6b")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-mobile-docs.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.gnome.org/verdre/gnome-shell-mobile")
    (synopsis "next generation desktop shell (API documentation)")
    (description "Next generation desktop shell (API documentation).")
    (license license:gpl3+)))

;;; gnome-shell-mobile — Next generation desktop shell
(define-public gnome-shell-mobile
  (package
    (name "gnome-shell-mobile")
    (version "48.r0.gcf9bd6b")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-mobile.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.gnome.org/verdre/gnome-shell-mobile")
    (synopsis "next generation desktop shell")
    (description "Next generation desktop shell.")
    (license license:gpl3+)))

;;; g15ctrld — A new daemon controlling the G15 Logitech Gaming Keyboard for x11 and 
(define-public g15ctrld
  (package
    (name "g15ctrld")
    (version "1.9.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/g15ctrld.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/raycollector/g15ctrld.git")
    (synopsis "A new daemon controlling the G15 Logitech Gaming Keyboard for x11 and wayland")
    (description "A new daemon controlling the G15 Logitech Gaming Keyboard for x11 and wayland.")
    (license license:gpl3)))

;;; framework-sensors-git — Sensors configuration for the framework 16.
(define-public framework-sensors-git
  (package
    (name "framework-sensors-git")
    (version "0.0.0.r0.5f090323")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/framework-sensors-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FrameworkComputer/lm-sensors")
    (synopsis "sensors configuration for the framework 16")
    (description "Sensors configuration for the framework 16.")
    (license license:gpl2)))

;;; flowee-pay — Flowee Payment solution
(define-public flowee-pay
  (package
    (name "flowee-pay")
    (version "2026.03.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/flowee-pay.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://flowee.org/pay/")
    (synopsis "flowee Payment solution")
    (description "Flowee Payment solution.")
    (license license:gpl3)))

;;; describe-commit-git — CLI tool that leverages AI to generate commit messages based on change
(define-public describe-commit-git
  (package
    (name "describe-commit-git")
    (version "v0.1.2.r0.gae56af8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/describe-commit-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tarampampam/describe-commit")
    (synopsis "CLI tool that leverages AI to generate commit messages based on changes made ...")
    (description "CLI tool that leverages AI to generate commit messages based on changes made in a Git repository.")
    (license license:expat)))

;;; boost1.86 — Free peer-reviewed portable C++ source libraries (version 1.86) (devel
(define-public boost1.86
  (package
    (name "boost1.86")
    (version "1.86.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/boost1.86.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.boost.org/")
    (synopsis "free peer-reviewed portable C++ source libraries (version 1.86) (development ...")
    (description "Free peer-reviewed portable C++ source libraries (version 1.86) (development headers).")
    (license license:boost1.0)))
