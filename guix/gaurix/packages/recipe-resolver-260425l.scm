;; -*- mode: scheme; coding: utf-8 -*-
;;; recipe-resolver-260425l: 100 packages attempted (99 recipes, 1 blocked)
;;; Generated from AUR PKGBUILDs via queue-drain pass.

(define-module (gaurix packages recipe-resolver-260425l)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
   imagewriter
   package-query-git
   psst-git
   citra
   meshcentral
   mpdris2-rs
   jitsi-meet-desktop
   aeskulap
   debhelper
   hybrid-encoder
   po-debconf
   actual-server
   ente-cli
   go2rtc
   ovpn-dco-dkms
   fm-relm4-git
   mutter-mobile-docs
   satty-git
   perl-mce
   perl-log-dispatch
   perl-excel-writer-xlsx
   palemoon-gtk3
   perl-redis
   mail-deduplicate
   wxuieditor-git
   tsm-app
   stl-next-git
   repoforge-git
   python-slskd-api
   python-bdfparser
   proton-meet
   pins
   perl-pod-readme
   perl-moosex-aliases
   perl-devel-confess
   pacforge-git
   meta-package-manager-git
   meta-package-manager
   llama-cpp-openvino
   linux-mnt-reform-bin-headers
   linux-mnt-reform-bin
   fzfocus
   essh
   dotm
   dinky-git
   deskblob-git
   bit-font
   babyobounce-git
   popcorntime-git
   mconf
   umo-git
   martin-cp
   martin
   qcheck-git
   etlegacy32
   alacritty-sixel-git
   dieharder
   python-rgw
   python-rbd
   python-rados
   python-cephfs
   python-ceph-common
   librgw
   librbd
   librados
   libcephsqlite
   libcephfs
   cephfs-top
   cephfs-shell
   ceph-volume
   ceph-tools
   ceph-test
   ceph-rgw
   ceph-rbd
   ceph-rados
   ceph-osd
   ceph-node-proxy
   ceph-mon
   ceph-mgr
   ceph-mds
   ceph-libs
   ceph-erasure
   ceph-crypto
   ceph-compressor
   ceph-common
   ceph-cluster
   ceph-cli
   ceph-cephfs
   ceph-cephadm
   ceph-base
   steamdepotdownloader
   freenginx
   ultrastar-creator
   kcm-grub2-git
   lib32-nvidia-390xx-utils
   spyder-notebook
   libserum-concentrate-git
   lib32-libdxvk-gplasync
   enemy-territory
   ))

;;; imagewriter — A graphical utility for writing raw disk images & hybrid isos to USB k
(define-public imagewriter
  (package
    (name "imagewriter")
    (version "1.10.1432200249.1d253d9.2.24")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/openSUSE/imagewriter/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/openSUSE/imagewriter")
    (synopsis "A graphical utility for writing raw disk images & hybrid isos to USB keys")
    (description "A graphical utility for writing raw disk images & hybrid isos to USB keys.")
    (license license:gpl2)))

;;; package-query-git — Query ALPM and AUR
(define-public package-query-git
  (package
    (name "package-query-git")
    (version "1.12.r0.g840a000")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/archlinuxfr/package-query/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/archlinuxfr/package-query")
    (synopsis "query ALPM and AUR")
    (description "Query ALPM and AUR.")
    (license license:gpl3+)))

;;; psst-git — Fast and multi-platform Spotify client with native GUI
(define-public psst-git
  (package
    (name "psst-git")
    (version "r417.f1300bf")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/jpochyla/pss/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jpochyla/psst")
    (synopsis "fast and multi-platform Spotify client with native GUI")
    (description "Fast and multi-platform Spotify client with native GUI.")
    (license license:expat)))

;;; citra — An experimental open-source Nintendo 3DS emulator/debugger
(define-public citra
  (package
    (name "citra")
    (version "r10112.608383e")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/username227/citra/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/username227/citra")
    (synopsis "an experimental open-source Nintendo 3DS emulator/debugger")
    (description "An experimental open-source Nintendo 3DS emulator/debugger.")
    (license license:gpl2+)))

;;; meshcentral — The open source, multi-platform, self-hosted, feature packed web site 
(define-public meshcentral
  (package
    (name "meshcentral")
    (version "1.1.38")
    (source
     (origin
       (method url-fetch)
       (uri "https://meshcentral.com/info/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://meshcentral.com/info/")
    (synopsis "the open source, multi-platform, self-hosted, feature packed web site for...")
    (description "The open source, multi-platform, self-hosted, feature packed web site for remote device management.")
    (license license:asl2.0)))

;;; mpdris2-rs — Exposing MPRIS V2.1 D-Bus interface for mpd
(define-public mpdris2-rs
  (package
    (name "mpdris2-rs")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/szclsya/mpdris2-rs/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/szclsya/mpdris2-rs")
    (synopsis "exposing MPRIS V2.1 D-Bus interface for mpd")
    (description "Exposing MPRIS V2.1 D-Bus interface for mpd.")
    (license license:gpl3+)))

;;; jitsi-meet-desktop — Jitsi Meet desktop application
(define-public jitsi-meet-desktop
  (package
    (name "jitsi-meet-desktop")
    (version "2026.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/jitsi/jitsi-meet-electron/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jitsi/jitsi-meet-electron")
    (synopsis "jitsi Meet desktop application")
    (description "Jitsi Meet desktop application.")
    (license license:asl2.0)))

;;; aeskulap — Medical image viewer and DICOM client
(define-public aeskulap
  (package
    (name "aeskulap")
    (version "0.2.2beta2+r8+ge710562")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.nongnu.org/aeskulap")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.nongnu.org/aeskulap")
    (synopsis "medical image viewer and DICOM client")
    (description "Medical image viewer and DICOM client.")
    (license #f)))

;;; debhelper — Programs to automate common tasks in debian/rules when building Debian
(define-public debhelper
  (package
    (name "debhelper")
    (version "13.31")
    (source
     (origin
       (method url-fetch)
       (uri "https://salsa.debian.org/debian/debhelper")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://salsa.debian.org/debian/debhelper")
    (synopsis "programs to automate common tasks in debian/rules when building Debian pa...")
    (description "Programs to automate common tasks in debian/rules when building Debian packages.")
    (license license:gpl2+)))

;;; hybrid-encoder — A very complete gui for video encoding
(define-public hybrid-encoder
  (package
    (name "hybrid-encoder")
    (version "20251109")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.selur.de/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.selur.de/")
    (synopsis "A very complete gui for video encoding")
    (description "A very complete gui for video encoding.")
    (license license:expat)))

;;; po-debconf — Debian manage translated Debconf templates files with gettext
(define-public po-debconf
  (package
    (name "po-debconf")
    (version "1.0.22")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.debian.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.debian.org/")
    (synopsis "debian manage translated Debconf templates files with gettext")
    (description "Debian manage translated Debconf templates files with gettext.")
    (license (list license:gpl2 license:gpl2+))))

;;; actual-server — Actual Budget server used for syncing across devices. Includes the web
(define-public actual-server
  (package
    (name "actual-server")
    (version "26.4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://actualbudget.org")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://actualbudget.org")
    (synopsis "actual Budget server used for syncing across devices. Includes the web cl...")
    (description "Actual Budget server used for syncing across devices. Includes the web client.")
    (license license:expat)))

;;; ente-cli — A Command Line Utility for exporting data from Ente.
(define-public ente-cli
  (package
    (name "ente-cli")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://ente.io")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ente.io")
    (synopsis "A Command Line Utility for exporting data from Ente")
    (description "A Command Line Utility for exporting data from Ente.")
    (license license:gpl3+)))

;;; go2rtc — Ultimate camera streaming application with support RTSP, RTMP, HTTP-FL
(define-public go2rtc
  (package
    (name "go2rtc")
    (version "1.9.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/AlexxIT/go2rtc/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AlexxIT/go2rtc")
    (synopsis "ultimate camera streaming application with support RTSP, RTMP, HTTP-FLV, ...")
    (description "Ultimate camera streaming application with support RTSP, RTMP, HTTP-FLV, WebRTC, MSE, HLS, MP4, MJPEG, HomeKit, FFmpeg, etc.")
    (license license:expat)))

;;; ovpn-dco-dkms — Optional Data Channel Offload kernel module for OpenVPN 3
(define-public ovpn-dco-dkms
  (package
    (name "ovpn-dco-dkms")
    (version "0.2.20251017")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/OpenVPN/ovpn-dco/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/OpenVPN/ovpn-dco")
    (synopsis "optional Data Channel Offload kernel module for OpenVPN 3")
    (description "Optional Data Channel Offload kernel module for OpenVPN 3.")
    (license license:gpl2)))

;;; fm-relm4-git — Small, general purpose file manager built with GTK4.
(define-public fm-relm4-git
  (package
    (name "fm-relm4-git")
    (version "r143.5ae63b8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/euclio/fm/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/euclio/fm")
    (synopsis "small, general purpose file manager built with GTK4")
    (description "Small, general purpose file manager built with GTK4.")
    (license license:expat)))

;;; mutter-mobile-docs — Window manager and compositor for GNOME (documentation)
(define-public mutter-mobile-docs
  (package
    (name "mutter-mobile-docs")
    (version "48.r0.g7cb1e9b")
    (source
     (origin
       (method url-fetch)
       (uri "https://gitlab.gnome.org/verdre/mutter-mobile")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.gnome.org/verdre/mutter-mobile")
    (synopsis "window manager and compositor for GNOME (documentation)")
    (description "Window manager and compositor for GNOME (documentation).")
    (license license:gpl2+)))

;;; satty-git — A screenshot annotation tool inspired by Swappy and Flameshot.
(define-public satty-git
  (package
    (name "satty-git")
    (version "0.19.0.r2.g04d7c22")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/gabm/satty/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gabm/satty")
    (synopsis "A screenshot annotation tool inspired by Swappy and Flameshot")
    (description "A screenshot annotation tool inspired by Swappy and Flameshot.")
    (license license:mpl2.0)))

;;; perl-mce — Many-Core Engine for Perl providing parallel processing capabilities
(define-public perl-mce
  (package
    (name "perl-mce")
    (version "1.902")
    (source
     (origin
       (method url-fetch)
       (uri "https://metacpan.org/release/MCE")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/release/MCE")
    (synopsis "many-Core Engine for Perl providing parallel processing capabilities")
    (description "Many-Core Engine for Perl providing parallel processing capabilities.")
    (license license:gpl3+)))

;;; perl-log-dispatch — Dispatches messages to one or more outputs
(define-public perl-log-dispatch
  (package
    (name "perl-log-dispatch")
    (version "2.71")
    (source
     (origin
       (method url-fetch)
       (uri "https://metacpan.org/release/Log-Dispatch")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/release/Log-Dispatch")
    (synopsis "dispatches messages to one or more outputs")
    (description "Dispatches messages to one or more outputs.")
    (license license:gpl3+)))

;;; perl-excel-writer-xlsx — Create a new file in the Excel 2007+ XLSX format.
(define-public perl-excel-writer-xlsx
  (package
    (name "perl-excel-writer-xlsx")
    (version "1.15")
    (source
     (origin
       (method url-fetch)
       (uri "https://metacpan.org/release/Excel-Writer-XLSX")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/release/Excel-Writer-XLSX")
    (synopsis "create a new file in the Excel 2007+ XLSX format")
    (description "Create a new file in the Excel 2007+ XLSX format.")
    (license license:gpl3+)))

;;; palemoon-gtk3 — Open source web browser based on Firefox focusing on efficiency.
(define-public palemoon-gtk3
  (package
    (name "palemoon-gtk3")
    (version "34.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.palemoon.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.palemoon.org/")
    (synopsis "open source web browser based on Firefox focusing on efficiency")
    (description "Open source web browser based on Firefox focusing on efficiency.")
    (license license:mpl2.0)))

;;; perl-redis — Perl binding for Redis database
(define-public perl-redis
  (package
    (name "perl-redis")
    (version "2.000")
    (source
     (origin
       (method url-fetch)
       (uri "https://metacpan.org/release/Redis")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/release/Redis")
    (synopsis "perl binding for Redis database")
    (description "Perl binding for Redis database.")
    (license license:artistic2.0)))

;;; mail-deduplicate — An utility to deduplicate mails from a set of boxes.
(define-public mail-deduplicate
  (package
    (name "mail-deduplicate")
    (version "8.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://kdeldycke.github.io/mail-deduplicate/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kdeldycke.github.io/mail-deduplicate/")
    (synopsis "an utility to deduplicate mails from a set of boxes")
    (description "An utility to deduplicate mails from a set of boxes.")
    (license license:gpl2)))

;;; wxuieditor-git — RAD tool used to create and maintain wxWidgets UI elements (C++, Pytho
(define-public wxuieditor-git
  (package
    (name "wxuieditor-git")
    (version "1.2.1.r1009.g25d3a248")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/KeyWorksRW/wxUiEditor/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/KeyWorksRW/wxUiEditor")
    (synopsis "RAD tool used to create and maintain wxWidgets UI elements (C++, Python, ...")
    (description "RAD tool used to create and maintain wxWidgets UI elements (C++, Python, Ruby, XRC).")
    (license license:asl2.0)))

;;; tsm-app — TradeSkillMaster Desktop App for Linux - auction data downloader for W
(define-public tsm-app
  (package
    (name "tsm-app")
    (version "1.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/exceptionptr/tsm-app-linux/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/exceptionptr/tsm-app-linux")
    (synopsis "tradeSkillMaster Desktop App for Linux - auction data downloader for WoW ...")
    (description "TradeSkillMaster Desktop App for Linux - auction data downloader for WoW under Wine/Lutris/Steam.")
    (license license:expat)))

;;; stl-next-git — A high-performance Steam game wrapper replacement for SteamTinkerLaunc
(define-public stl-next-git
  (package
    (name "stl-next-git")
    (version "c62bb62")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Distracted-E421/stl-nex/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Distracted-E421/stl-next")
    (synopsis "A high-performance Steam game wrapper replacement for SteamTinkerLaunch")
    (description "A high-performance Steam game wrapper replacement for SteamTinkerLaunch.")
    (license license:expat)))

;;; repoforge-git — A C++ wizard to create linux remote repositories for debian, RHEL and 
(define-public repoforge-git
  (package
    (name "repoforge-git")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Vniverse77/byte-knigh/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Vniverse77/byte-knight")
    (synopsis "A C++ wizard to create linux remote repositories for debian, RHEL and AUR")
    (description "A C++ wizard to create linux remote repositories for debian, RHEL and AUR.")
    (license license:gpl3+)))

;;; python-slskd-api — Python API for slskd
(define-public python-slskd-api
  (package
    (name "python-slskd-api")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/bigoulours/slskd-python-ap/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bigoulours/slskd-python-api")
    (synopsis "python API for slskd")
    (description "Python API for slskd.")
    (license license:agpl3)))

;;; python-bdfparser — BDF bitmap font file parser in pure Python
(define-public python-bdfparser
  (package
    (name "python-bdfparser")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/tomchen/bdfparser/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tomchen/bdfparser")
    (synopsis "BDF bitmap font file parser in pure Python")
    (description "BDF bitmap font file parser in pure Python.")
    (license license:expat)))

;;; proton-meet — Proton official desktop application for Proton Mail and Proton Calenda
(define-public proton-meet
  (package
    (name "proton-meet")
    (version "1.0.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://proton.me/meet")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://proton.me/meet")
    (synopsis "proton official desktop application for Proton Mail and Proton Calendar")
    (description "Proton official desktop application for Proton Mail and Proton Calendar.")
    (license license:gpl3+)))

;;; pins — Create your own application shortcuts
(define-public pins
  (package
    (name "pins")
    (version "2.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/fabrialberio/Pins/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fabrialberio/Pins")
    (synopsis "create your own application shortcuts")
    (description "Create your own application shortcuts.")
    (license license:gpl3+)))

;;; perl-pod-readme — Intelligently generate a README file from POD
(define-public perl-pod-readme
  (package
    (name "perl-pod-readme")
    (version "1.2.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://metacpan.org/release/Pod-Readme")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/release/Pod-Readme")
    (synopsis "intelligently generate a README file from POD")
    (description "Intelligently generate a README file from POD.")
    (license license:gpl3+)))

;;; perl-moosex-aliases — Easy aliasing of methods and attributes in Moose.
(define-public perl-moosex-aliases
  (package
    (name "perl-moosex-aliases")
    (version "0.11")
    (source
     (origin
       (method url-fetch)
       (uri "https://metacpan.org/release/MooseX-Aliases")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/release/MooseX-Aliases")
    (synopsis "easy aliasing of methods and attributes in Moose")
    (description "Easy aliasing of methods and attributes in Moose.")
    (license license:gpl3+)))

;;; perl-devel-confess — Include stack traces on all warnings and errors
(define-public perl-devel-confess
  (package
    (name "perl-devel-confess")
    (version "0.009004")
    (source
     (origin
       (method url-fetch)
       (uri "https://metacpan.org/release/Devel-Confess")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/release/Devel-Confess")
    (synopsis "include stack traces on all warnings and errors")
    (description "Include stack traces on all warnings and errors.")
    (license license:gpl3+)))

;;; pacforge-git — A C++ wizard to create packages for debian, RHEL and etc
(define-public pacforge-git
  (package
    (name "pacforge-git")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Vniverse77/byte-knigh/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Vniverse77/byte-knight")
    (synopsis "A C++ wizard to create packages for debian, RHEL and etc")
    (description "A C++ wizard to create packages for debian, RHEL and etc.")
    (license license:gpl3+)))

;;; meta-package-manager-git — A wrapper around all package managers (git version)
(define-public meta-package-manager-git
  (package
    (name "meta-package-manager-git")
    (version "6.3.0.r46.gd1ac4397")
    (source
     (origin
       (method url-fetch)
       (uri "https://kdeldycke.github.io/meta-package-manager/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kdeldycke.github.io/meta-package-manager/")
    (synopsis "A wrapper around all package managers (git version)")
    (description "A wrapper around all package managers (git version).")
    (license license:gpl2)))

;;; meta-package-manager — A wrapper around all package managers
(define-public meta-package-manager
  (package
    (name "meta-package-manager")
    (version "6.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://kdeldycke.github.io/meta-package-manager/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kdeldycke.github.io/meta-package-manager/")
    (synopsis "A wrapper around all package managers")
    (description "A wrapper around all package managers.")
    (license license:gpl2)))

;;; llama.cpp-openvino — Port of Facebook's LLaMA model in C/C++(with OpenVINO Backend support)
(define-public llama-cpp-openvino
  (package
    (name "llama.cpp-openvino")
    (version "b8644")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ggerganov/llama.cpp/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ggerganov/llama.cpp")
    (synopsis "port of Facebook's LLaMA model in C/C++(with OpenVINO Backend support)")
    (description "Port of Facebook's LLaMA model in C/C++(with OpenVINO Backend support).")
    (license license:expat)))

;;; linux-mnt-reform-bin-headers — Header files and scripts for building modules for linux-mnt-reform-bin
(define-public linux-mnt-reform-bin-headers
  (package
    (name "linux-mnt-reform-bin-headers")
    (version "6.19.14.reform1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/cetola/mnt-build/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cetola/mnt-build")
    (synopsis "header files and scripts for building modules for linux-mnt-reform-bin ke...")
    (description "Header files and scripts for building modules for linux-mnt-reform-bin kernel.")
    (license license:gpl2)))

;;; linux-mnt-reform-bin — Linux kernel for MNT Reform
(define-public linux-mnt-reform-bin
  (package
    (name "linux-mnt-reform-bin")
    (version "6.19.14.reform1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/cetola/mnt-build/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/linux-mnt-reform-bin"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cetola/mnt-build")
    (synopsis "linux kernel for MNT Reform")
    (description "Linux kernel for MNT Reform.")
    (license license:gpl2)))

;;; fzfocus — fzf-based personal info manager — calendar, todos, and notes in the te
(define-public fzfocus
  (package
    (name "fzfocus")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/mossbraxtin/fzfocus/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mossbraxtin/fzfocus")
    (synopsis "fzf-based personal info manager — calendar, todos, and notes in the terminal")
    (description "Fzf-based personal info manager — calendar, todos, and notes in the terminal.")
    (license license:expat)))

;;; essh — Enhanced SSH client with TUI — manage connections, keys, and sessions
(define-public essh
  (package
    (name "essh")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/matthart1983/essh/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/matthart1983/essh")
    (synopsis "enhanced SSH client with TUI — manage connections, keys, and sessions")
    (description "Enhanced SSH client with TUI — manage connections, keys, and sessions.")
    (license license:expat)))

;;; dotm — Declarative dotfiles manager with normal file paths, delegated encrypt
(define-public dotm
  (package
    (name "dotm")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/fkzys/dotm/-/archive/v" version "/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/fkzys/dotm")
    (synopsis "declarative dotfiles manager with normal file paths, delegated encryption...")
    (description "Declarative dotfiles manager with normal file paths, delegated encryption, and first-class permission management.")
    (license license:agpl3+)))

;;; dinky-git — A terminal text editor for those who just want to edit some text (VCS 
(define-public dinky-git
  (package
    (name "dinky-git")
    (version "r169.3f5b2ff")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/sedwards2009/dinky/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sedwards2009/dinky")
    (synopsis "A terminal text editor for those who just want to edit some text (VCS ver...")
    (description "A terminal text editor for those who just want to edit some text (VCS version).")
    (license license:expat)))

;;; deskblob-git — A cyberplasmic desktop toy
(define-public deskblob-git
  (package
    (name "deskblob-git")
    (version "r30.2e3ea21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/Modanung/deskblob/-/archive/v" version "/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/Modanung/deskblob")
    (synopsis "A cyberplasmic desktop toy")
    (description "A cyberplasmic desktop toy.")
    (license (list license:cc0 license:gpl2+))))

;;; bit-font — CLI/TUI Logo Designer + ANSI Font Library with Gradients, Shadows, and
(define-public bit-font
  (package
    (name "bit-font")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/superstarryeyes/b/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/superstarryeyes/bit")
    (synopsis "CLI/TUI Logo Designer + ANSI Font Library with Gradients, Shadows, and Mu...")
    (description "CLI/TUI Logo Designer + ANSI Font Library with Gradients, Shadows, and Multi-Format Export.")
    (license license:expat)))

;;; babyobounce-git — A 3D remake of a QBasic game called Baby
(define-public babyobounce-git
  (package
    (name "babyobounce-git")
    (version "r39.b444492")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/Modanung/babyobounce/-/archive/v" version "/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/Modanung/babyobounce")
    (synopsis "A 3D remake of a QBasic game called Baby")
    (description "A 3D remake of a QBasic game called Baby.")
    (license (list license:cc0 license:gpl3+))))

;;; popcorntime-git — Popcorn Time is a multi-platform, free software BitTorrent client that
(define-public popcorntime-git
  (package
    (name "popcorntime-git")
    (version "0.5.1.r61.g61af271d7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/popcorn-official/popcorn-desktop/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/popcorn-official/popcorn-desktop")
    (synopsis "popcorn Time is a multi-platform, free software BitTorrent client that in...")
    (description "Popcorn Time is a multi-platform, free software BitTorrent client that includes an integrated media player.")
    (license license:gpl3+)))

;;; mconf — Parser for the mconf configuration language
(define-public mconf
  (package
    (name "mconf")
    (version "1.2505.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/marzeq/mconf/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/marzeq/mconf")
    (synopsis "parser for the mconf configuration language")
    (description "Parser for the mconf configuration language.")
    (license license:wtfpl2)))

;;; umo-git — An automatic modlist downloader for Modding-OpenMW.com modlists
(define-public umo-git
  (package
    (name "umo-git")
    (version "0.10.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://modding-openmw.gitlab.io/umo/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://modding-openmw.gitlab.io/umo/")
    (synopsis "an automatic modlist downloader for Modding-OpenMW.com modlists")
    (description "An automatic modlist downloader for Modding-OpenMW.com modlists.")
    (license license:gpl3+)))

;;; martin-cp — Generate vector map tiles in bulk
(define-public martin-cp
  (package
    (name "martin-cp")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://maplibre.org/martin/martin-cp.html")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://maplibre.org/martin/martin-cp.html")
    (synopsis "generate vector map tiles in bulk")
    (description "Generate vector map tiles in bulk.")
    (license license:expat)))

;;; martin — A tile server able to generate and serve vector tiles on the fly
(define-public martin
  (package
    (name "martin")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://maplibre.org/martin/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://maplibre.org/martin/")
    (synopsis "A tile server able to generate and serve vector tiles on the fly")
    (description "A tile server able to generate and serve vector tiles on the fly.")
    (license license:expat)))

;;; qcheck-git — A quick alternative to cksfv for generating and verifying CRC32C check
(define-public qcheck-git
  (package
    (name "qcheck-git")
    (version "r56.2262a31")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Wunkolo/qCheck/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Wunkolo/qCheck")
    (synopsis "A quick alternative to cksfv for generating and verifying CRC32C checksum...")
    (description "A quick alternative to cksfv for generating and verifying CRC32C checksum files(.sfv).")
    (license license:expat)))

;;; etlegacy32 — Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy 
(define-public etlegacy32
  (package
    (name "etlegacy32")
    (version "2.83.2")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.etlegacy.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.etlegacy.com/")
    (synopsis "wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy eng...")
    (description "Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy engine, 32 bit).")
    (license (list license:expat license:gpl3+))))

;;; alacritty-sixel-git — A cross-platform, GPU-accelerated terminal emulator
(define-public alacritty-sixel-git
  (package
    (name "alacritty-sixel-git")
    (version "0.14.0.2427.gc7213774")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ayosec/alacritty/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ayosec/alacritty")
    (synopsis "A cross-platform, GPU-accelerated terminal emulator")
    (description "A cross-platform, GPU-accelerated terminal emulator.")
    (license (list license:asl2.0 license:expat))))

;;; dieharder — A testing and benchmarking tool for random number generators
(define-public dieharder
  (package
    (name "dieharder")
    (version "3.31.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/eddelbuettel/dieharder/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/eddelbuettel/dieharder")
    (synopsis "A testing and benchmarking tool for random number generators")
    (description "A testing and benchmarking tool for random number generators.")
    (license license:gpl2+)))

;;; python-rgw — Ceph Storage python library for librgw
(define-public python-rgw
  (package
    (name "python-rgw")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/source/" (string-take "rgw" 1) "/rgw/rgw-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage python library for librgw")
    (description "Ceph Storage python library for librgw.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; python-rbd — Ceph Storage python library for librbd
(define-public python-rbd
  (package
    (name "python-rbd")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/source/" (string-take "rbd" 1) "/rbd/rbd-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage python library for librbd")
    (description "Ceph Storage python library for librbd.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; python-rados — Ceph Storage python library for librados
(define-public python-rados
  (package
    (name "python-rados")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/source/" (string-take "rados" 1) "/rados/rados-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage python library for librados")
    (description "Ceph Storage python library for librados.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; python-cephfs — Ceph Storage python library for libcephfs
(define-public python-cephfs
  (package
    (name "python-cephfs")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/source/" (string-take "cephfs" 1) "/cephfs/cephfs-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage python library for libcephfs")
    (description "Ceph Storage python library for libcephfs.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; python-ceph-common — Ceph Storage python module for common classes, objects and types
(define-public python-ceph-common
  (package
    (name "python-ceph-common")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/source/" (string-take "ceph-common" 1) "/ceph-common/ceph-common-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage python module for common classes, objects and types")
    (description "Ceph Storage python module for common classes, objects and types.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; librgw — Ceph Storage client library to RADOS Object Gateway, a S3 and Swift co
(define-public librgw
  (package
    (name "librgw")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage client library to RADOS Object Gateway, a S3 and Swift compa...")
    (description "Ceph Storage client library to RADOS Object Gateway, a S3 and Swift compatible REST API.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; librbd — Ceph Storage client library for RADOS block devices
(define-public librbd
  (package
    (name "librbd")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage client library for RADOS block devices")
    (description "Ceph Storage client library for RADOS block devices.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; librados — Ceph Storage client library to the RADOS distributed object store
(define-public librados
  (package
    (name "librados")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage client library to the RADOS distributed object store")
    (description "Ceph Storage client library to the RADOS distributed object store.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; libcephsqlite — Ceph Storage client library for a RADOS backed sqlite3 VFS extension
(define-public libcephsqlite
  (package
    (name "libcephsqlite")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage client library for a RADOS backed sqlite3 VFS extension")
    (description "Ceph Storage client library for a RADOS backed sqlite3 VFS extension.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; libcephfs — Ceph Storage client library for CephFS, a distributed POSIX filesystem
(define-public libcephfs
  (package
    (name "libcephfs")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage client library for CephFS, a distributed POSIX filesystem")
    (description "Ceph Storage client library for CephFS, a distributed POSIX filesystem.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; cephfs-top — Ceph Storage utility for a top(1) inspired curses TUI for CephFS metri
(define-public cephfs-top
  (package
    (name "cephfs-top")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage utility for a top(1) inspired curses TUI for CephFS metrics")
    (description "Ceph Storage utility for a top(1) inspired curses TUI for CephFS metrics.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; cephfs-shell — Ceph Storage utility for accessing a CephFS filesystem shell
(define-public cephfs-shell
  (package
    (name "cephfs-shell")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage utility for accessing a CephFS filesystem shell")
    (description "Ceph Storage utility for accessing a CephFS filesystem shell.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-volume — Ceph Storage utility for preparing block devices for use as OSDs
(define-public ceph-volume
  (package
    (name "ceph-volume")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage utility for preparing block devices for use as OSDs")
    (description "Ceph Storage utility for preparing block devices for use as OSDs.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-tools — Ceph Storage miscellaneous tooling and utilities
(define-public ceph-tools
  (package
    (name "ceph-tools")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage miscellaneous tooling and utilities")
    (description "Ceph Storage miscellaneous tooling and utilities.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-test — Ceph Storage tools for benchmarking and testing live clusters
(define-public ceph-test
  (package
    (name "ceph-test")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage tools for benchmarking and testing live clusters")
    (description "Ceph Storage tools for benchmarking and testing live clusters.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-rgw — Ceph Storage cluster RADOS Object Gateway daemon, for serving RESTful 
(define-public ceph-rgw
  (package
    (name "ceph-rgw")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage cluster RADOS Object Gateway daemon, for serving RESTful tra...")
    (description "Ceph Storage cluster RADOS Object Gateway daemon, for serving RESTful traffic.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-rbd — Ceph Storage utilities and tooling for librbd
(define-public ceph-rbd
  (package
    (name "ceph-rbd")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage utilities and tooling for librbd")
    (description "Ceph Storage utilities and tooling for librbd.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-rados — Ceph Storage utilities and tools for librados
(define-public ceph-rados
  (package
    (name "ceph-rados")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage utilities and tools for librados")
    (description "Ceph Storage utilities and tools for librados.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-osd — Ceph Storage cluster object storage daemon, for managing block devices
(define-public ceph-osd
  (package
    (name "ceph-osd")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage cluster object storage daemon, for managing block devices")
    (description "Ceph Storage cluster object storage daemon, for managing block devices.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-node-proxy — Ceph Storage daemon for cephadm deployments to collect RedFishAPI hard
(define-public ceph-node-proxy
  (package
    (name "ceph-node-proxy")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage daemon for cephadm deployments to collect RedFishAPI hardwar...")
    (description "Ceph Storage daemon for cephadm deployments to collect RedFishAPI hardware metrics.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-mon — Ceph Storage cluster monitor daemon, for distributed state storage via
(define-public ceph-mon
  (package
    (name "ceph-mon")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage cluster monitor daemon, for distributed state storage via PAXOS")
    (description "Ceph Storage cluster monitor daemon, for distributed state storage via PAXOS.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-mgr — Ceph Storage cluster manager daemon, the API gateway for cluster manag
(define-public ceph-mgr
  (package
    (name "ceph-mgr")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage cluster manager daemon, the API gateway for cluster management")
    (description "Ceph Storage cluster manager daemon, the API gateway for cluster management.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-mds — Ceph Storage cluster metadata server, the API gateway for CephFS
(define-public ceph-mds
  (package
    (name "ceph-mds")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage cluster metadata server, the API gateway for CephFS")
    (description "Ceph Storage cluster metadata server, the API gateway for CephFS.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-libs — Ceph Storage client libraries [VIRTUAL]
(define-public ceph-libs
  (package
    (name "ceph-libs")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage client libraries [VIRTUAL]")
    (description "Ceph Storage client libraries [VIRTUAL].")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-erasure — Ceph Storage erasure coding libs
(define-public ceph-erasure
  (package
    (name "ceph-erasure")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage erasure coding libs")
    (description "Ceph Storage erasure coding libs.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-crypto — Ceph Storage crypto libs
(define-public ceph-crypto
  (package
    (name "ceph-crypto")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage crypto libs")
    (description "Ceph Storage crypto libs.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-compressor — Ceph Storage compressor libs
(define-public ceph-compressor
  (package
    (name "ceph-compressor")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage compressor libs")
    (description "Ceph Storage compressor libs.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-common — Ceph Storage common libraries and dependencies
(define-public ceph-common
  (package
    (name "ceph-common")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage common libraries and dependencies")
    (description "Ceph Storage common libraries and dependencies.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-cluster — Ceph Storage cluster daemons and components [VIRTUAL]
(define-public ceph-cluster
  (package
    (name "ceph-cluster")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage cluster daemons and components [VIRTUAL]")
    (description "Ceph Storage cluster daemons and components [VIRTUAL].")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-cli — Ceph Storage CLI utility [VIRTUAL]
(define-public ceph-cli
  (package
    (name "ceph-cli")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage CLI utility [VIRTUAL]")
    (description "Ceph Storage CLI utility [VIRTUAL].")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-cephfs — Ceph Storage utilities and tooling for libcephfs
(define-public ceph-cephfs
  (package
    (name "ceph-cephfs")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage utilities and tooling for libcephfs")
    (description "Ceph Storage utilities and tooling for libcephfs.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-cephadm — Ceph Storage adminstration and configuration utility
(define-public ceph-cephadm
  (package
    (name "ceph-cephadm")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage adminstration and configuration utility")
    (description "Ceph Storage adminstration and configuration utility.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; ceph-base — Ceph Storage cluster base utilities and configuration
(define-public ceph-base
  (package
    (name "ceph-base")
    (version "20.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://ceph.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ceph.com/")
    (synopsis "ceph Storage cluster base utilities and configuration")
    (description "Ceph Storage cluster base utilities and configuration.")
    (license (list license:gpl2+ license:lgpl2.1+ license:lgpl3+))))

;;; steamdepotdownloader — Steam depot downloader utilizing the SteamKit2 library.
(define-public steamdepotdownloader
  (package
    (name "steamdepotdownloader")
    (version "3.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/SteamRE/DepotDownloader/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/SteamRE/DepotDownloader")
    (synopsis "steam depot downloader utilizing the SteamKit2 library")
    (description "Steam depot downloader utilizing the SteamKit2 library.")
    (license license:gpl2)))

;;; freenginx — Lightweight web server, IMAP/POP3 and TCP/UDP proxy server
(define-public freenginx
  (package
    (name "freenginx")
    (version "1.30.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://freenginx.org")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://freenginx.org")
    (synopsis "lightweight web server, IMAP/POP3 and TCP/UDP proxy server")
    (description "Lightweight web server, IMAP/POP3 and TCP/UDP proxy server.")
    (license license:expat)))

;;; ultrastar-creator — Qt program used to generate USDX songs from scratch
(define-public ultrastar-creator
  (package
    (name "ultrastar-creator")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/UltraStar-Deluxe/UltraStar-Creator/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/UltraStar-Deluxe/UltraStar-Creator")
    (synopsis "qt program used to generate USDX songs from scratch")
    (description "Qt program used to generate USDX songs from scratch.")
    (license license:gpl2)))

;;; kcm-grub2-git — A KDE Control Module for configuring the GRUB2 bootloader
(define-public kcm-grub2-git
  (package
    (name "kcm-grub2-git")
    (version "0.6.4.r301.g1281187")
    (source
     (origin
       (method url-fetch)
       (uri "https://invent.kde.org/system/kcm-grub2")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://invent.kde.org/system/kcm-grub2")
    (synopsis "A KDE Control Module for configuring the GRUB2 bootloader")
    (description "A KDE Control Module for configuring the GRUB2 bootloader.")
    (license license:gpl3+)))

;;; lib32-nvidia-390xx-utils — NVIDIA drivers utilities (32-bit), 390xx legacy branch
(define-public lib32-nvidia-390xx-utils
  (package
    (name "lib32-nvidia-390xx-utils")
    (version "390.157")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.nvidia.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.nvidia.com/")
    (synopsis "NVIDIA drivers utilities (32-bit), 390xx legacy branch")
    (description "NVIDIA drivers utilities (32-bit), 390xx legacy branch.")
    (license license:expat)))

;;; spyder-notebook — Jupyter notebook integration with Spyder
(define-public spyder-notebook
  (package
    (name "spyder-notebook")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://docs.spyder-ide.org/current/plugins/notebook.html")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://docs.spyder-ide.org/current/plugins/notebook.html")
    (synopsis "jupyter notebook integration with Spyder")
    (description "Jupyter notebook integration with Spyder.")
    (license license:expat)))

;;; libserum-concentrate-git — Fork of libserum, a cross-platform library for decoding Serum files & 
(define-public libserum-concentrate-git
  (package
    (name "libserum-concentrate-git")
    (version "r333.b6f7ea2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/PPUC/libserum_concentrate/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/PPUC/libserum_concentrate")
    (synopsis "fork of libserum, a cross-platform library for decoding Serum files & col...")
    (description "Fork of libserum, a cross-platform library for decoding Serum files & colorization format for pinball ROMs.")
    (license license:gpl2+)))

;;; lib32-libdxvk-gplasync — Vulkan-based implementation of D3D8, 9, 10 and 11 for Linux, gplasync 
(define-public lib32-libdxvk-gplasync
  (package
    (name "lib32-libdxvk-gplasync")
    (version "2.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/doitsujin/dxvk/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/doitsujin/dxvk")
    (synopsis "vulkan-based implementation of D3D8, 9, 10 and 11 for Linux, gplasync pat...")
    (description "Vulkan-based implementation of D3D8, 9, 10 and 11 for Linux, gplasync patch (32-bit).")
    (license license:zlib)))

;;; enemy-territory — Wolfenstein: Enemy Territory is a completely free, standalone, team-ba
(define-public enemy-territory
  (package
    (name "enemy-territory")
    (version "2.60b")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.splashdamage.com/wolfet")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.splashdamage.com/wolfet")
    (synopsis "wolfenstein: Enemy Territory is a completely free, standalone, team-based...")
    (description "Wolfenstein: Enemy Territory is a completely free, standalone, team-based, multiplayer FPS.")
    (license license:expat)))
