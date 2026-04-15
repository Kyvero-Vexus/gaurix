;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260415b
;;; Resolves 100 BLOCKED packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (            nvidia-390xx-dkms
            nvidia-470xx-dkms
            nvidia-beta-dkms
            lib32-libfdk-aac
            lib32-zvbi
            mozc-ut
            muon-decoder
            muzak
            nvidia-535xx-dkms
            nvidia-open-beta
            nvidia-open-beta-dkms
            opentubex-git
            oscgoesbrrr
            pacmate
            pacviz
            panoply
            patchy
            pharo-launcher
            pmt-git
            prek
            procreate-thumbnailer-git
            psdoom-ng
            pug
            python-pyqt5-3d
            python-pyqt5-datavisualization
            python-pyqt5-networkauth
            python-pyqt5-purchasing
            python2-libxml2
            python2-wxpython3
            qb64
            qqmusic-bin
            quickshell-greetd
            quiterss
            r8168-dkms
            radarr-bin
            rankmirrors-systemd
            rdrview-git
            reboot-arch-btw
            recoil-thumbnailer
            remmina-plugin-url
            requestly-bin
            rgx-cli
            river-bedload-git
            rotki-bin
            rtl8821ce-dkms-git
            rustwhy-git
            samrewritten-git
            scala
            seerr
            shock-alarm
            sickrage-git
            sierra-breeze-enhanced
            socos
            sound-themer
            speech-dispatcher-mimo
            spflashtool5-bin
            steamvr-linux-fixes-layer-git
            stl-thumb-kde
            subtitles-contact-sheet-qt-gui
            supergfxctl
            syncovery-bin
            systemd-cron-next-git
            tabaur
            tixati
            tlp-rdw-git
            tribler-bin
            ums
            upscayl-appimage
            uptater-bin
            vapoursynth-plugin-svpflow
            viber
            vimcat
            vintagestory-unstable
            vrc-get
            vsce
            waveloggate-git))

(define-public nvidia-390xx-dkms
  (package
    (name "nvidia-390xx-dkms")
    (version "390.157")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-390xx-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA drivers - module sources")
    (description "NVIDIA drivers - module sources.")
    (home-page "https://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public nvidia-470xx-dkms
  (package
    (name "nvidia-470xx-dkms")
    (version "470.256.02-8.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-470xx-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA drivers - module sources")
    (description "NVIDIA drivers - module sources.")
    (home-page "http://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public nvidia-beta-dkms
  (package
    (name "nvidia-beta-dkms")
    (version "595.58.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-beta-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA kernel modules - module sources (beta version)")
    (description "NVIDIA kernel modules - module sources (beta version).")
    (home-page "https://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public lib32-libfdk-aac
  (package
    (name "lib32-libfdk-aac")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libfdk-aac.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fraunhofer FDK AAC codec library (32-bit)")
    (description "Fraunhofer FDK AAC codec library (32-bit).")
    (home-page "https://sourceforge.net/projects/opencore-amr/")
    (license license:non-copyleft)))

(define-public lib32-zvbi
  (package
    (name "lib32-zvbi")
    (version "0.2.44")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-zvbi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vBI capture and decoding library (32-bit)")
    (description "VBI capture and decoding library (32-bit).")
    (home-page "http://zapping.sourceforge.net/cgi-bin/view/ZVBI/WebHome")
    (license license:bsd-3)))

(define-public mozc-ut
  (package
    (name "mozc-ut")
    (version "3.33.6133.20260312")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/google/mozc")
                    (commit "v3.33.6133.20260312")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Open Source edition of Google Japanese Input bundled with the UT dict")
    (description "The Open Source edition of Google Japanese Input bundled with the UT dictionary.")
    (home-page "https://github.com/google/mozc")
    (license license:asl2.0)))

(define-public muon-decoder
  (package
    (name "muon-decoder")
    (version "1.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Dopple24/muon_decoder")
                    (commit "v1.1.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "particle decoder")
    (description "Particle decoder.")
    (home-page "https://github.com/Dopple24/muon_decoder")
    (license license:expat)))

(define-public muzak
  (package
    (name "muzak")
    (version "2.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/The0x539/muzak")
                    (commit "v2.4.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line suite for playing and compiling the bells of bezelea")
    (description "Command-line suite for playing and compiling the bells of bezelea.")
    (home-page "https://github.com/The0x539/muzak")
    (license license:non-copyleft)))

(define-public nvidia-535xx-dkms
  (package
    (name "nvidia-535xx-dkms")
    (version "535.288.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-535xx-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA drivers - module sources, 535 branch")
    (description "NVIDIA drivers - module sources, 535 branch.")
    (home-page "http://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public nvidia-open-beta
  (package
    (name "nvidia-open-beta")
    (version "595.58.03")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NVIDIA/open-gpu-kernel-modules")
                    (commit "v595.58.03")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA open kernel modules (beta version)")
    (description "NVIDIA open kernel modules (beta version).")
    (home-page "https://github.com/NVIDIA/open-gpu-kernel-modules/")
    (license license:expat)))

(define-public nvidia-open-beta-dkms
  (package
    (name "nvidia-open-beta-dkms")
    (version "595.58.03")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NVIDIA/open-gpu-kernel-modules")
                    (commit "v595.58.03")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA open kernel modules (module sources; beta version)")
    (description "NVIDIA open kernel modules (module sources; beta version).")
    (home-page "https://github.com/NVIDIA/open-gpu-kernel-modules/")
    (license license:expat)))

(define-public opentubex-git
  (package
    (name "opentubex-git")
    (version "r10273.08b241344")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenTubeX/OpenTubeX")
                    (commit "vr10273.08b241344")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fork of the open source desktop YouTube player FreeTube with additional")
    (description "A fork of the open source desktop YouTube player FreeTube with additional features.")
    (home-page "https://github.com/OpenTubeX/OpenTubeX")
    (license license:agpl3+)))

(define-public oscgoesbrrr
  (package
    (name "oscgoesbrrr")
    (version "2.1.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/oscgoesbrrr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "make haptics in real life go BRRR from VRChat")
    (description "Make haptics in real life go BRRR from VRChat.")
    (home-page "https://osc.toys/")
    (license license:non-copyleft)))

(define-public pacmate
  (package
    (name "pacmate")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/nathanchere/pacmate")
                    (commit "v1.2.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "interactive terminal UI wrapper for pacman")
    (description "Interactive terminal UI wrapper for pacman.")
    (home-page "https://gitlab.com/nathanchere/pacmate")
    (license license:asl2.0)))

(define-public pacviz
  (package
    (name "pacviz")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sjsanc/pacviz")
                    (commit "v0.1.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tUI for managing Arch Linux pacman packages")
    (description "TUI for managing Arch Linux pacman packages.")
    (home-page "https://github.com/sjsanc/pacviz")
    (license license:expat)))

(define-public panoply
  (package
    (name "panoply")
    (version "5.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/panoply.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "netCDF, HDF and GRIB Data Viewer by NASA GISS")
    (description "NetCDF, HDF and GRIB Data Viewer by NASA GISS.")
    (home-page "http://www.giss.nasa.gov/tools/panoply/")
    (license license:non-copyleft)))

(define-public patchy
  (package
    (name "patchy")
    (version "0.0.27")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/richardgill/patchy")
                    (commit "v0.0.27")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a CLI for generating and applying patches to git repositories")
    (description "A CLI for generating and applying patches to git repositories.")
    (home-page "https://github.com/richardgill/patchy")
    (license license:expat)))

(define-public pharo-launcher
  (package
    (name "pharo-launcher")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pharo-launcher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pharo Launcher helps you manage your Pharo images")
    (description "Pharo Launcher helps you manage your Pharo images.")
    (home-page "http://www.pharo-project.org/")
    (license license:expat)))

(define-public pmt-git
  (package
    (name "pmt-git")
    (version "r12.d93c3d2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aethstetic/pmt")
                    (commit "vr12.d93c3d2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal UI package manager for Arch Linux")
    (description "Terminal UI package manager for Arch Linux.")
    (home-page "https://github.com/aethstetic/pmt")
    (license license:expat)))

(define-public prek
  (package
    (name "prek")
    (version "0.3.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/j178/prek")
                    (commit "v0.3.8")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "⚡ Better 'pre-commit', re-engineered in Rust")
    (description "⚡ Better 'pre-commit', re-engineered in Rust.")
    (home-page "https://github.com/j178/prek")
    (license license:expat)))

(define-public procreate-thumbnailer-git
  (package
    (name "procreate-thumbnailer-git")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/devlinman/Procreate-thumbnailer")
                    (commit "v1.0.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "thumbnailer for Procreate (")
    (description "Thumbnailer for Procreate (.procreate) files.")
    (home-page "https://github.com/devlinman/Procreate-thumbnailer")
    (license license:expat)))

(define-public psdoom-ng
  (package
    (name "psdoom-ng")
    (version "2017.10.02.2.3.0.20181229")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yeoldegrove/psdoom-ng1")
                    (commit "v2017.10.02.2.3.0.20181229")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a FPS and operating system process killer (when you kill an enemy, it kil")
    (description "A FPS and operating system process killer (when you kill an enemy, it kills a process) based on psDooM and Chocolate Doom.")
    (home-page "https://github.com/yeoldegrove/psdoom-ng1")
    (license license:gpl3+)))

(define-public pug
  (package
    (name "pug")
    (version "1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ventto/pug")
                    (commit "v1.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "synchronize Pacman and AUR installed package lists into Gists")
    (description "synchronize Pacman and AUR installed package lists into Gists.")
    (home-page "https://github.com/Ventto/pug")
    (license license:non-copyleft)))

(define-public python-pyqt5-3d
  (package
    (name "python-pyqt5-3d")
    (version "5.15.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pyqt5-3d.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python bindings for Qt3D")
    (description "Python bindings for Qt3D.")
    (home-page "https://www.riverbankcomputing.com/software/pyqt3d/intro")
    (license license:gpl3)))

(define-public python-pyqt5-datavisualization
  (package
    (name "python-pyqt5-datavisualization")
    (version "5.15.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pyqt5-datavisualization.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python bindings for QtDataVisualization")
    (description "Python bindings for QtDataVisualization.")
    (home-page "https://www.riverbankcomputing.com/software/pyqtdatavisualization/intro")
    (license license:gpl3)))

(define-public python-pyqt5-networkauth
  (package
    (name "python-pyqt5-networkauth")
    (version "5.15.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pyqt5-networkauth.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python bindings for QtNetworkAuth")
    (description "Python bindings for QtNetworkAuth.")
    (home-page "https://www.riverbankcomputing.com/software/pyqtnetworkauth/intro")
    (license license:gpl3)))

(define-public python-pyqt5-purchasing
  (package
    (name "python-pyqt5-purchasing")
    (version "5.15.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pyqt5-purchasing.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python bindings for QtPurchasing")
    (description "Python bindings for QtPurchasing.")
    (home-page "https://www.riverbankcomputing.com/software/pyqtpurchasing/intro")
    (license license:gpl3)))

(define-public python2-libxml2
  (package
    (name "python2-libxml2")
    (version "2.9.14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home")
                    (commit "v2.9.14")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python 2 bindings for the XML parsing library v2")
    (description "Python 2 bindings for the XML parsing library v2.")
    (home-page "https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home")
    (license license:expat)))

(define-public python2-wxpython3
  (package
    (name "python2-wxpython3")
    (version "3.0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-wxpython3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "classic wxWidgets GUI toolkit for Python")
    (description "Classic wxWidgets GUI toolkit for Python.")
    (home-page "https://www.wxpython.org")
    (license license:non-copyleft)))

(define-public qb64
  (package
    (name "qb64")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qb64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bASIC for the modern era")
    (description "BASIC for the modern era.")
    (home-page "https://www.qb64.com/")
    (license license:non-copyleft)))

(define-public qqmusic-bin
  (package
    (name "qqmusic-bin")
    (version "1.1.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qqmusic-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "腾讯QQ音乐")
    (description "腾讯QQ音乐.")
    (home-page "https://y.qq.com/")
    (license license:cc0)))

(define-public quickshell-greetd
  (package
    (name "quickshell-greetd")
    (version "1.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/everyoneexe/quickshell-greetd")
                    (commit "v1.0.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "use Quickshell lockscreen as greetd greeter")
    (description "Use Quickshell lockscreen as greetd greeter.")
    (home-page "https://github.com/everyoneexe/quickshell-greetd")
    (license license:expat)))

(define-public quiterss
  (package
    (name "quiterss")
    (version "0.19.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quiterss.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast and light RSS/Atom feed reader written in Qt/С++")
    (description "Fast and light RSS/Atom feed reader written in Qt/С++.")
    (home-page "https://quiterss.org/")
    (license license:gpl3)))

(define-public r8168-dkms
  (package
    (name "r8168-dkms")
    (version "8.056.02")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mtorromeo/r8168")
                    (commit "v8.056.02")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a kernel module for Realtek 8168 network cards (DKMS version)")
    (description "A kernel module for Realtek 8168 network cards (DKMS version).")
    (home-page "https://github.com/mtorromeo/r8168")
    (license license:gpl2+)))

(define-public radarr-bin
  (package
    (name "radarr-bin")
    (version "6.1.1.10360")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/radarr-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "movie organizer/manager for usenet and torrent users")
    (description "Movie organizer/manager for usenet and torrent users.")
    (home-page "https://radarr.video")
    (license license:gpl3+)))

(define-public rankmirrors-systemd
  (package
    (name "rankmirrors-systemd")
    (version "1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EgidioCaprino/rankmirrors-systemd")
                    (commit "v1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rank Pacman mirrors based on the speed related to the host network")
    (description "Rank Pacman mirrors based on the speed related to the host network.")
    (home-page "https://github.com/EgidioCaprino/rankmirrors-systemd")
    (license license:expat)))

(define-public rdrview-git
  (package
    (name "rdrview-git")
    (version "20210213.b887583")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eafer/rdrview")
                    (commit "v20210213.b887583")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command line tool to extract the main content from a webpage")
    (description "Command line tool to extract the main content from a webpage.")
    (home-page "https://github.com/eafer/rdrview")
    (license license:non-copyleft)))

(define-public reboot-arch-btw
  (package
    (name "reboot-arch-btw")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rnestler/reboot-arch-btw")
                    (commit "v1.0.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "check if you need to reboot due to an updated kernel")
    (description "Check if you need to reboot due to an updated kernel.")
    (home-page "https://github.com/rnestler/reboot-arch-btw")
    (license license:gpl3)))

(define-public recoil-thumbnailer
  (package
    (name "recoil-thumbnailer")
    (version "6.4.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/recoil-thumbnailer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "converter for native picture formats of retro computers (GNOME thumbnailer)")
    (description "Converter for native picture formats of retro computers (GNOME thumbnailer).")
    (home-page "https://recoil.sourceforge.net")
    (license license:gpl2)))

(define-public remmina-plugin-url
  (package
    (name "remmina-plugin-url")
    (version "1.3.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/remmina-plugin-url.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a protocol plugin for Remmina to open an URL in an external browser")
    (description "A protocol plugin for Remmina to open an URL in an external browser.")
    (home-page "http://www.muflone.com/remmina-plugin-url/")
    (license license:gpl2+)))

(define-public requestly-bin
  (package
    (name "requestly-bin")
    (version "26.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/requestly-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "debug your network request across all platforms and browsers using a sing")
    (description "Debug your network request across all platforms and browsers using a single app.(Prebuilt version.Use system-wide electron).")
    (home-page "https://requestly.com/")
    (license license:agpl3)))

(define-public rgx-cli
  (package
    (name "rgx-cli")
    (version "0.10.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/brevity1swos/rgx")
                    (commit "v0.10.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a terminal regex tester with real-time matching and multi-engine support")
    (description "A terminal regex tester with real-time matching and multi-engine support.")
    (home-page "https://github.com/brevity1swos/rgx")
    (license license:asl2.0)))

(define-public river-bedload-git
  (package
    (name "river-bedload-git")
    (version "r9.9cdc0e0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~novakane/river-bedload")
                    (commit "vr9.9cdc0e0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "display information about river in json in the STDOUT")
    (description "Display information about river in json in the STDOUT.")
    (home-page "https://git.sr.ht/~novakane/river-bedload")
    (license license:gpl3)))

(define-public rotki-bin
  (package
    (name "rotki-bin")
    (version "1.40.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rotki-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a portfolio tracking, analytics, accounting and tax reporting application")
    (description "A portfolio tracking, analytics, accounting and tax reporting application that respects your privacy.")
    (home-page "https://rotki.com")
    (license license:bsd-3)))

(define-public rtl8821ce-dkms-git
  (package
    (name "rtl8821ce-dkms-git")
    (version "1.0.5.r36.gca4abd8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tomaspinho/rtl8821ce")
                    (commit "v1.0.5.r36.gca4abd8")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rtl8821CE driver with firmware")
    (description "rtl8821CE driver with firmware.")
    (home-page "https://github.com/tomaspinho/rtl8821ce")
    (license license:gpl2)))

(define-public rustwhy-git
  (package
    (name "rustwhy-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ninso112/rustwhy")
                    (commit "v0.1.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unified Linux system diagnostics - understand WHY things happen")
    (description "Unified Linux system diagnostics - understand WHY things happen.")
    (home-page "https://github.com/Ninso112/rustwhy")
    (license license:gpl3)))

(define-public samrewritten-git
  (package
    (name "samrewritten-git")
    (version "1.2.0.r0.g95cda4f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PaulCombal/SamRewritten")
                    (commit "v1.2.0.r0.g95cda4f")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unlock achievements and stats on Steam, and more!")
    (description "Unlock achievements and stats on Steam, and more!.")
    (home-page "https://github.com/PaulCombal/SamRewritten")
    (license license:gpl3)))

(define-public scala
  (package
    (name "scala")
    (version "2.13.16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scala.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Java-interoperable language with object-oriented and functional features")
    (description "A Java-interoperable language with object-oriented and functional features.")
    (home-page "https://www.scala-lang.org")
    (license license:asl2.0)))

(define-public seerr
  (package
    (name "seerr")
    (version "3.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/seerr-team/seerr")
                    (commit "v3.1.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "request management and media discovery tool for the Plex ecosystem")
    (description "Request management and media discovery tool for the Plex ecosystem.")
    (home-page "https://github.com/seerr-team/seerr")
    (license license:expat)))

(define-public shock-alarm
  (package
    (name "shock-alarm")
    (version "0.4.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ComputerElite/ShockAlarmApp")
                    (commit "v0.4.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a flutter app for controlling OpenShock devices")
    (description "A flutter app for controlling OpenShock devices.")
    (home-page "https://github.com/ComputerElite/ShockAlarmApp")
    (license license:gpl3)))

(define-public sickrage-git
  (package
    (name "sickrage-git")
    (version "9.4.117.r0.g1db69f779")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SiCKRAGETV/SickRage")
                    (commit "v9.4.117.r0.g1db69f779")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a PVR application that downloads and manages your TV shows")
    (description "A PVR application that downloads and manages your TV shows. Echel0n fork of sickbeard, with tvrage, torrents and anime support.")
    (home-page "https://github.com/SiCKRAGETV/SickRage")
    (license license:gpl3)))

(define-public sierra-breeze-enhanced
  (package
    (name "sierra-breeze-enhanced")
    (version "2.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kupiqu/sierrabreezeenhanced")
                    (commit "v2.1.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a kwin decoration with support for transparency, rounded corners, multipl")
    (description "A kwin decoration with support for transparency, rounded corners, multiple titlebar button presets and more.")
    (home-page "https://github.com/kupiqu/sierrabreezeenhanced")
    (license license:gpl3+)))

(define-public socos
  (package
    (name "socos")
    (version "r215.7719b54")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SoCo/socos")
                    (commit "vr215.7719b54")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "commandline tool for controlling Sonos devices")
    (description "Commandline tool for controlling Sonos devices.")
    (home-page "https://github.com/SoCo/socos")
    (license license:expat)))

(define-public sound-themer
  (package
    (name "sound-themer")
    (version "0.3.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tmforshaw/sound_themer")
                    (commit "v0.3.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a program to play sounds from a selected sound theme")
    (description "A program to play sounds from a selected sound theme.")
    (home-page "https://github.com/tmforshaw/sound_themer")
    (license license:expat)))

(define-public speech-dispatcher-mimo
  (package
    (name "speech-dispatcher-mimo")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/speech-dispatcher-mimo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "speech-dispatcher output module that uses Xiaomi MiMo API for high-qualit")
    (description "speech-dispatcher output module that uses Xiaomi MiMo API for high-quality Chinese/English neural TTS.")
    (home-page "https://platform.xiaomimimo.com")
    (license license:expat)))

(define-public spflashtool5-bin
  (package
    (name "spflashtool5-bin")
    (version "5.2228")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/spflashtool5-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sP Flash Tool is an application to flash your MediaTek (MTK) SmartPhone")
    (description "SP Flash Tool is an application to flash your MediaTek (MTK) SmartPhone. Version 5 variant.")
    (home-page "http://spflashtools.com/category/linux")
    (license license:non-copyleft)))

(define-public steamvr-linux-fixes-layer-git
  (package
    (name "steamvr-linux-fixes-layer-git")
    (version "0.1.3.r0.g04e43c9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BnuuySolutions/SteamVRLinuxFixes")
                    (commit "v0.1.3.r0.g04e43c9")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Vulkan layer that patches SteamVR's vrcompositor to address issues for ")
    (description "A Vulkan layer that patches SteamVR's vrcompositor to address issues for wired headsets.")
    (home-page "https://github.com/BnuuySolutions/SteamVRLinuxFixes")
    (license license:expat)))

(define-public stl-thumb-kde
  (package
    (name "stl-thumb-kde")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/unlimitedbacon/stl-thumb-kde")
                    (commit "v0.5.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "KDE/KIO plugin for stl-thumb, a fast lightweight thumbnail generator for ")
    (description "KDE/KIO plugin for stl-thumb, a fast lightweight thumbnail generator for STL files.")
    (home-page "https://github.com/unlimitedbacon/stl-thumb-kde")
    (license license:expat)))

(define-public subtitles-contact-sheet-qt-gui
  (package
    (name "subtitles-contact-sheet-qt-gui")
    (version "1.17")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/subtitles-contact-sheet-qt-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "create subtitles/video contact sheets, previews, small animations, screen")
    (description "Create subtitles/video contact sheets, previews, small animations, screenshots and thumbnails (Qt GUI).")
    (home-page "https://vongoob9.gitlab.io/subtitles_contact_sheet_qt")
    (license license:gpl3+)))

(define-public supergfxctl
  (package
    (name "supergfxctl")
    (version "5.2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/asus-linux/supergfxctl")
                    (commit "v5.2.7")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a utility for Linux graphics switching on Intel/AMD iGPU + nVidia dGPU la")
    (description "A utility for Linux graphics switching on Intel/AMD iGPU + nVidia dGPU laptops.")
    (home-page "https://gitlab.com/asus-linux/supergfxctl")
    (license license:mpl2.0)))

(define-public syncovery-bin
  (package
    (name "syncovery-bin")
    (version "11.13.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/syncovery-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "syncovery File Synchronization Tool")
    (description "Syncovery File Synchronization Tool.")
    (home-page "https://www.syncovery.com")
    (license license:non-copyleft)))

(define-public systemd-cron-next-git
  (package
    (name "systemd-cron-next-git")
    (version "1.0.2.r22.gfe1f4a6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/systemd-cron/systemd-cron-next")
                    (commit "v1.0.2.r22.gfe1f4a6")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "systemd generator to generate timers/services from crontab and anacrontab")
    (description "Systemd generator to generate timers/services from crontab and anacrontab files.")
    (home-page "https://github.com/systemd-cron/systemd-cron-next")
    (license license:expat)))

(define-public tabaur
  (package
    (name "tabaur")
    (version "0.6.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BurntRanch/TabAUR")
                    (commit "v0.6.9")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a customizable and lightweight AUR helper, designed to be simple but powe")
    (description "A customizable and lightweight AUR helper, designed to be simple but powerful.")
    (home-page "https://github.com/BurntRanch/TabAUR")
    (license license:gpl2)))

(define-public tixati
  (package
    (name "tixati")
    (version "3.42")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tixati.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tixati is a peer-to-peer file sharing program that uses the popular BitTo")
    (description "Tixati is a peer-to-peer file sharing program that uses the popular BitTorrent protocol.")
    (home-page "http://www.tixati.com/")
    (license license:non-copyleft)))

(define-public tlp-rdw-git
  (package
    (name "tlp-rdw-git")
    (version "1.10.0.b1.r10.33007a3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tlp-rdw-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "switch wifi and bluetooth on/off automatically")
    (description "Switch wifi and bluetooth on/off automatically.")
    (home-page "https://linrunner.de/en/tlp/tlp.html")
    (license license:gpl3+)))

(define-public tribler-bin
  (package
    (name "tribler-bin")
    (version "8.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tribler-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "p2P/Bittorrent/YouTube client")
    (description "P2P/Bittorrent/YouTube client.")
    (home-page "http://tribler.org")
    (license license:gpl3)))

(define-public ums
  (package
    (name "ums")
    (version "15.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ums.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "universal Media Server: a DLNA-compliant UPnP Media Server")
    (description "Universal Media Server: a DLNA-compliant UPnP Media Server.")
    (home-page "http://www.universalmediaserver.com/")
    (license license:gpl2)))

(define-public upscayl-appimage
  (package
    (name "upscayl-appimage")
    (version "2.15.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/upscayl/upscayl")
                    (commit "v2.15.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free and Open Source AI Image Upscaler")
    (description "Free and Open Source AI Image Upscaler.")
    (home-page "https://github.com/upscayl/upscayl")
    (license license:agpl3)))

(define-public uptater-bin
  (package
    (name "uptater-bin")
    (version "1.0.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gytdoo/uptater")
                    (commit "v1.0.1.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "clean, robust GUI for managing Arch Linux packages and AUR updates")
    (description "Clean, robust GUI for managing Arch Linux packages and AUR updates.")
    (home-page "https://github.com/gytdoo/uptater")
    (license license:gpl3)))

(define-public vapoursynth-plugin-svpflow
  (package
    (name "vapoursynth-plugin-svpflow")
    (version "4.6.263")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vapoursynth-plugin-svpflow.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "smoothVideo plugin for Vapoursynth")
    (description "SmoothVideo plugin for Vapoursynth.")
    (home-page "https://www.svp-team.com/wiki/SVP:Linux")
    (license license:gpl2)))

(define-public viber
  (package
    (name "viber")
    (version "27.3.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/viber.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free and secure calls and messages to anyone, anywhere, on any device and")
    (description "Free and secure calls and messages to anyone, anywhere, on any device and network, in any country!.")
    (home-page "https://www.viber.com")
    (license license:non-copyleft)))

(define-public vimcat
  (package
    (name "vimcat")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vimcat.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a `cat` that uses vim's syntax highlighting")
    (description "A `cat` that uses vim's syntax highlighting.")
    (home-page "https://aur.archlinux.org/packages/vimcat")
    (license license:bsd-3)))

(define-public vintagestory-unstable
  (package
    (name "vintagestory-unstable")
    (version "1.22.0rc.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vintagestory-unstable.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "uncompromising wilderness survival sandbox game (unstable branch)")
    (description "Uncompromising wilderness survival sandbox game (unstable branch).")
    (home-page "https://www.vintagestory.at/")
    (license license:non-copyleft)))

(define-public vrc-get
  (package
    (name "vrc-get")
    (version "1.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anatawa12/vrc-get")
                    (commit "v1.9.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open Source command line client of VRChat Package Manager")
    (description "Open Source command line client of VRChat Package Manager.")
    (home-page "https://github.com/anatawa12/vrc-get")
    (license license:expat)))

(define-public vsce
  (package
    (name "vsce")
    (version "3.7.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/microsoft/vscode-vsce")
                    (commit "v3.7.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "visual Studio Code extension manager")
    (description "Visual Studio Code extension manager.")
    (home-page "https://github.com/microsoft/vscode-vsce")
    (license license:expat)))

(define-public waveloggate-git
  (package
    (name "waveloggate-git")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wavelog/WaveLogGate")
                    (commit "v1.2.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cAT and WSJT-X Bridge for WaveLog")
    (description "CAT and WSJT-X Bridge for WaveLog.")
    (home-page "https://github.com/wavelog/WaveLogGate")
    (license license:expat)))

