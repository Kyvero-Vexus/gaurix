;;; Worker 01 batch (r14): resolve NEEDS_RECIPE_DESIGN packages.
;;; 4 new recipes: ddccontrol-db-git, fooyin, web-eid-native, zerotier-one
;;; 6 BLOCKED: waydroid (MISSING_GUIX_DEPS), linux-lqx (KERNEL_PACKAGING_COMPLEX),
;;;   stardust-xr-solar-sailer (MISSING_RUST_CRATES), openvino (MASSIVE_SUBMODULE_DEPS),
;;;   archlinux-java-run (ARCH_SPECIFIC_TOOL), yay (ARCH_SPECIFIC_TOOL)
(define-module (gaurix packages cron-5a2fb251-r14-w01)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xml))

;; ──────────────────────────────────────────────
;; 1. ddccontrol-db-git — DDC/CI monitor control database
;; ──────────────────────────────────────────────
(define-public ddccontrol-db-git
  (package
    (name "ddccontrol-db-git")
    (version "20260120")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ddccontrol/ddccontrol-db/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "07jqg00l7kihd3hf2wppj8c9qfi1zixgsbwpw9qmhi4dxi3mxyqi"))))
    (build-system gnu-build-system)
    (native-inputs
     (list autoconf automake intltool gettext-minimal perl pkg-config))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'bootstrap
            (lambda _
              (invoke "intltoolize" "--force" "--copy" "--automake")
              (invoke "aclocal")
              (invoke "autoconf")
              (invoke "automake" "--add-missing" "--copy" "--foreign"))))))
    (home-page "https://github.com/ddccontrol/ddccontrol-db")
    (synopsis "Monitor database for DDC/CI control")
    (description
     "ddccontrol-db is a database of monitor definitions used by ddccontrol
to provide DDC/CI monitor control.  It contains profiles for various
monitors, mapping DDC/CI controls to human-readable names and value ranges.")
    (license license:gpl2+)))

;; ──────────────────────────────────────────────
;; 2. fooyin — A customisable music player built with Qt6
;; ──────────────────────────────────────────────
(define-public fooyin
  (package
    (name "fooyin")
    (version "0.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fooyin/fooyin/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1nhwal23hnjh83inha469s0ic1b9awmbydx6fdxwpjiaq6367a9v"))))
    (build-system cmake-build-system)
    (native-inputs
     (list pkg-config qttools))
    (inputs
     (list qtbase
           alsa-lib
           taglib
           ffmpeg))
    (arguments
     (list
      #:configure-flags
      #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))
      #:tests? #f))
    (home-page "https://www.fooyin.org/")
    (synopsis "Customisable music player built with Qt6")
    (description
     "Fooyin is a music player built around customisation.  It offers a
growing list of widgets to manage and play your local music collection.
It is extendable through the use of plugins and built with Qt6.")
    (license license:gpl3+)))

;; ──────────────────────────────────────────────
;; 3. web-eid-native — Web eID native application for smart card auth
;; ──────────────────────────────────────────────
(define-public web-eid-native
  (package
    (name "web-eid-native")
    (version "2.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/web-eid/web-eid-app/releases/download/v"
             version "/web-eid-" version ".tar.gz"))
       (sha256
        (base32 "1wpls3w5kvykgz2i0cdwhpqgkx06qbrihhi5y8dnjy16wsnlrwir"))))
    (build-system cmake-build-system)
    (native-inputs
     (list pkg-config qttools))
    (inputs
     (list qtbase
           qtsvg
           pcsc-lite
           openssl))
    (arguments
     (list
      #:configure-flags
      #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))
      #:tests? #f))
    (home-page "https://web-eid.eu/")
    (synopsis "Web eID native application for smart card authentication")
    (description
     "Web eID is a browser extension and native application for
using electronic ID (eID) smart cards for secure authentication and
digital signing on the web.  This package provides the native helper
application that communicates with smart card readers via PC/SC.")
    (license license:expat)))

;; ──────────────────────────────────────────────
;; 4. zerotier-one — Peer-to-peer network virtualization
;;    Using v1.12.2 with SSO disabled to avoid Rust dependency
;; ──────────────────────────────────────────────
(define-public zerotier-one
  (package
    (name "zerotier-one")
    (version "1.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/zerotier/ZeroTierOne/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0773csp5lj7aj5cz7q4h931h067p6l712ccrvjllwdq8qb7i4rbw"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:make-flags
      #~(list (string-append "CXX=" #$(cc-for-target) "++")
              (string-append "CC=" #$(cc-for-target))
              "ZT_SSO_SUPPORTED=0"
              "ZT_EMBEDDED=1")
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (sbin (string-append out "/sbin"))
                     (man8 (string-append out "/share/man/man8")))
                (install-file "zerotier-one" sbin)
                (with-directory-excursion sbin
                  (symlink "zerotier-one" "zerotier-cli")
                  (symlink "zerotier-one" "zerotier-idtool"))
                (mkdir-p man8)
                (install-file "doc/zerotier-one.8" man8)))))))
    (home-page "https://www.zerotier.com/")
    (synopsis "Peer-to-peer software-defined network virtualization")
    (description
     "ZeroTier is a smart programmable Ethernet switch for planet Earth.
It allows all networked devices, VMs, and containers to communicate
as if they all reside in the same physical data center or cloud region.
This package builds version 1.12.2 without SSO support to avoid the
Rust/Cargo dependency.")
    (license (license:non-copyleft "https://github.com/zerotier/ZeroTierOne/blob/main/LICENSE.txt"))))

;; ──────────────────────────────────────────────
;; 5. waydroid — Run Android containers on Wayland
;; BLOCKED: Needs python-gbinder (not in Guix)
;; ──────────────────────────────────────────────
(define-public waydroid
  (package
    (name "waydroid")
    (version "1.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/waydroid/waydroid/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1jkxym93gdj5vhx661j68jh2cgvv2i06xclq1q188a6yp773m5jb"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "waydroid: BLOCKED — requires python-gbinder (not in Guix), dbus-python with GLib mainloop, kernel binder module, and Android system images")))
    (home-page "https://waydro.id/")
    (synopsis "Container-based approach to boot Android on GNU/Linux (BLOCKED)")
    (description
     "Waydroid uses Linux namespaces (LXC) to boot a full Android system
in a container.  BLOCKED: requires python-gbinder (Python bindings for
libgbinder, not packaged in Guix), kernel binder driver support, and
Android system images.")
    (license license:gpl3)))

;; ──────────────────────────────────────────────
;; 6. linux-lqx — Liquorix kernel
;; BLOCKED: KERNEL_PACKAGING_COMPLEX
;; ──────────────────────────────────────────────
(define-public linux-lqx
  (package
    (name "linux-lqx")
    (version "6.12")
    (source
     (origin
       (method url-fetch)
       (uri "https://liquorix.net/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "linux-lqx: BLOCKED — Custom kernel packaging in Guix requires defining a linux-libre-style kernel package with custom config and the Liquorix patchset. Extremely complex.")))
    (home-page "https://liquorix.net/")
    (synopsis "Liquorix kernel — optimised desktop Linux kernel (BLOCKED)")
    (description
     "Liquorix is a Linux kernel configured for desktop, multimedia, and
gaming workloads.  BLOCKED: packaging a custom kernel in Guix is extremely
complex, requiring a linux-libre-style package definition with custom
kconfig, out-of-tree patches, and the full Liquorix patchset.")
    (license license:gpl2)))

;; ──────────────────────────────────────────────
;; 7. stardust-xr-solar-sailer — StardustXR XR window manager
;; BLOCKED: Unpackaged Rust crate dependencies
;; ──────────────────────────────────────────────
(define-public stardust-xr-solar-sailer
  (package
    (name "stardust-xr-solar-sailer")
    (version "0.51.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/StardustXR/solar-sailer/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "014phmnlr7x4by5gr5lr4anqjk7fr3k33q6bq06qr6f252jm1y7s"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "stardust-xr-solar-sailer: BLOCKED — Rust project requiring stardust-xr-server, stardust-xr-molecules, and many unpackaged crate dependencies")))
    (home-page "https://github.com/StardustXR/solar-sailer")
    (synopsis "StardustXR XR window manager (BLOCKED — unpackaged Rust deps)")
    (description
     "Solar Sailer is a window manager for StardustXR, a 3D XR interaction
framework.  BLOCKED: Rust project depending on the StardustXR ecosystem
crates which are not packaged in Guix.")
    (license license:gpl3)))

;; ──────────────────────────────────────────────
;; 8. openvino — Intel OpenVINO AI inference toolkit
;; BLOCKED: Massive submodule dependencies
;; ──────────────────────────────────────────────
(define-public openvino
  (package
    (name "openvino")
    (version "2026.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/openvinotoolkit/openvino/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "openvino: BLOCKED — Massive CMake project with 20+ git submodules; source tarball lacks submodules; requires extensive dependency packaging")))
    (home-page "https://github.com/openvinotoolkit/openvino")
    (synopsis "Intel OpenVINO AI inference toolkit (BLOCKED — massive deps)")
    (description
     "OpenVINO is an open-source toolkit for optimising and deploying AI
inference.  BLOCKED: build requires 20+ git submodules not included in
the source tarball, each needing individual packaging.")
    (license license:asl2.0)))

;; ──────────────────────────────────────────────
;; 9. archlinux-java-run — Arch Linux Java launcher wrapper
;; BLOCKED: ARCH_SPECIFIC_TOOL
;; ──────────────────────────────────────────────
(define-public archlinux-java-run
  (package
    (name "archlinux-java-run")
    (version "12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/michaellass/archlinux-java-run/archive/"
             "refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "1p52kldkmf2j15v391j99scix896s6vflvf937b5jgmfmbl5x4yy"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "archlinux-java-run: BLOCKED — Arch-specific tool; hardcodes /usr/lib/jvm/ paths and depends on java-runtime-common")))
    (home-page "https://github.com/michaellass/archlinux-java-run")
    (synopsis "Arch Linux Java launcher helper (BLOCKED — Arch-specific)")
    (description
     "archlinux-java-run is a helper script for launching Java applications
on Arch Linux.  BLOCKED: Arch-specific; hardcodes Arch Linux JVM paths
and depends on java-runtime-common.  Guix uses a different JVM approach.")
    (license license:expat)))

;; ──────────────────────────────────────────────
;; 10. yay — Yet Another Yogurt, AUR helper
;; BLOCKED: ARCH_SPECIFIC_TOOL
;; ──────────────────────────────────────────────
(define-public yay
  (package
    (name "yay")
    (version "12.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Jguer/yay/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "yay: BLOCKED — AUR helper requiring pacman, makepkg, and the Arch Linux package management ecosystem")))
    (home-page "https://github.com/Jguer/yay")
    (synopsis "Yet Another Yogurt — AUR helper (BLOCKED — Arch-specific)")
    (description
     "Yay is an AUR helper written in Go.  BLOCKED: depends on pacman,
makepkg, and the Arch Linux package management stack.")
    (license license:gpl3+)))
