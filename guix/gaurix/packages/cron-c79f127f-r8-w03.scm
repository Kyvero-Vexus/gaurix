;;; Round-8 re-resolution for blocked-tree run cron-c79f127f worker w03.
(define-module (gaurix packages cron-c79f127f-r8-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:autoload (gnu packages) (specification->package)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages time)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages gettext)
  #:export (python-plyer
            dotool
            mint-x-icons
            verify-lib
            python-condense-json
            freedm
            python-m3u8
            zmusic
            libunity))

;;; ── python-plyer ─────────────────────────────────────────────

(define-public python-plyer
  (package
    (name "python-plyer")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "plyer" version))
       (sha256
        (base32 "0qdaddrn9ki8faq01mfsf3ppchjjd6mb4zj8m0vsy1qyw6vxzdv5"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/kivy/plyer")
    (synopsis "Platform-independent wrapper for platform-dependent APIs")
    (description
     "Plyer is a platform-independent Python wrapper around platform-dependent
APIs for notifications, sensors, storage, and related desktop/mobile features.")
    (license license:expat)))

;;; ── python-condense-json ─────────────────────────────────────

(define-public python-condense-json
  (package
    (name "python-condense-json")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "condense_json" version))
       (sha256
        (base32 "1g6j77846j4yy9jpbhf2vgbf4spr30z1mwlqing89zfs9x1qvzi5"))))
    (build-system pyproject-build-system)
    (native-inputs
     (list python-setuptools
           python-wheel))
    (home-page "https://pypi.org/project/condense-json/")
    (synopsis "Condense JSON by replacing repeated values")
    (description
     "Condense-JSON provides a Python function that condenses JSON payloads by
replacing repeated values with references.")
    (license license:asl2.0)))

;;; ── python-m3u8 ──────────────────────────────────────────────

(define-public python-m3u8
  (package
    (name "python-m3u8")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "m3u8" version))
       (sha256
        (base32 "1zf0m6gnvzjpzym4dzw2i5hwvd9ydjqi755gpi9sdmv72q59kpks"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-iso8601))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/globocom/m3u8")
    (synopsis "Python m3u8 playlist parser")
    (description
     "M3U8 is a Python parser and generator for m3u8 playlists used in HTTP
Live Streaming (HLS).")
    (license license:expat)))

;;; ── verify-lib ───────────────────────────────────────────────

(define-public verify-lib
  (package
    (name "verify-lib")
    (version "0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://gitlab.com/fkzys/verify-lib/-/archive/v0.0.4/verify-lib-v0.0.4.tar.gz")
       (sha256
        (base32 "0kg9w023v439vy6in4q21la56ann9npydn00ny45sbfx9mkh8pm9"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (invoke "make"
                      (string-append "CC=" #$(cc-for-target))
                      (string-append "PREFIX=" (assoc-ref outputs "out"))
                      "install"))))))
    (home-page "https://gitlab.com/fkzys/verify-lib")
    (synopsis "Validate shell library files before sourcing")
    (description
     "verify-lib provides a small compiled checker used to validate shell
library files before sourcing them.")
    (license license:agpl3+)))

;;; ── freedm ───────────────────────────────────────────────────

(define-public freedm
  (package
    (inherit (specification->package "freedoom"))
    (name "freedm")
    (synopsis "Free deathmatch game data for the Doom engine")
    (description
     "FreeDM provides free deathmatch game data compatible with Doom-engine
source ports.  It is part of the Freedoom project and includes the freedm.wad
deathmatch level set.")))

;;; ── zmusic ───────────────────────────────────────────────────

(define-public zmusic
  (package
    (name "zmusic")
    (version "1.1.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ZDoom/ZMusic/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0m6c7alh7wy6837j3rz1mhr8ak6z4xf73rq3fzrkd0d09vz10i7h"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs
     (list alsa-lib
           libsndfile
           mpg123))
    (home-page "https://github.com/ZDoom/ZMusic")
    (synopsis "Standalone music playback library from GZDoom")
    (description
     "ZMusic is a standalone music playback library extracted from the GZDoom
project.  It provides playback and synthesis support for multiple game music
formats including MIDI, MOD, and OPL.")
    (license license:bsd-3)))

;;; ── mint-x-icons ─────────────────────────────────────────────

(define-public mint-x-icons
  (package
    (name "mint-x-icons")
    (version "1.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/linuxmint/mint-x-icons/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "02019377bcqwjrfyki56xhjnbd4k5lpddlaw21wfskks32v4z3y7"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/share/icons" "share/icons"))))
    (native-inputs (list gtk+ hicolor-icon-theme))
    (home-page "https://github.com/linuxmint/mint-x-icons")
    (synopsis "Linux Mint X icon theme")
    (description
     "Mint-X-Icons is the classic icon theme for the Linux Mint desktop.  It
provides a complete set of icons in multiple colour variants.")
    (license license:gpl3+)))

;;; ── dotool ───────────────────────────────────────────────────

(define %dotool-go-opt-source
  (origin
    (method url-fetch)
    (uri "https://git.sr.ht/~geb/opt/archive/e72225a1933c.tar.gz")
    (sha256
     (base32 "0xgq7h4yf2xg74lbz8q81vlr7619lk1wfalyjk6jpiwim5dvhil8"))))

(define %dotool-go-uinput-source
  (origin
    (method url-fetch)
    (uri "https://github.com/bendahl/uinput/archive/refs/tags/v1.7.0.tar.gz")
    (sha256
     (base32 "19a00qya2bply6a6dqsx9lafj7kslq74i74ykh8h28qkhyjn8rzb"))))

(define-public dotool
  (package
    (name "dotool")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://git.sr.ht/~geb/dotool/archive/" version ".tar.gz"))
       (sha256
        (base32 "07mfbyckn60f5d94p4z7mybxn1k1j9k5169jv9381jwpnss86ryf"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (add-before 'build 'setup-go-vendor
            (lambda _
              (let ((gopath (string-append (getcwd) "/gopath"))
                    (opt-dir "gopath/src/git.sr.ht/~geb/opt")
                    (uinput-dir "gopath/src/github.com/bendahl/uinput"))
                (setenv "GOPATH" gopath)
                (setenv "GOPROXY" "off")
                (setenv "GOFLAGS" "-mod=mod")
                (mkdir-p opt-dir)
                (mkdir-p uinput-dir)
                (invoke "tar" "xzf" #$%dotool-go-opt-source
                        "-C" opt-dir "--strip-components=1")
                (invoke "tar" "xzf" #$%dotool-go-uinput-source
                        "-C" uinput-dir "--strip-components=1"))))
          (replace 'build
            (lambda _
              (setenv "DOTOOL_VERSION" #$version)
              (invoke "go" "build"
                      "-ldflags"
                      (string-append "-X main.Version=" #$version))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (udev (string-append out "/lib/udev/rules.d")))
                (install-file "dotool" bin)
                (install-file "dotoolc" bin)
                (install-file "dotoold" bin)
                (mkdir-p udev)
                (install-file "80-dotool.rules" udev)))))))
    (native-inputs (list go scdoc))
    (inputs (list libxkbcommon))
    (home-page "https://git.sr.ht/~geb/dotool")
    (synopsis "Simulate input on any Wayland or X11 compositor")
    (description
     "dotool reads commands from stdin and simulates keyboard and pointer input
using Linux uinput.  It works on Wayland and X11 compositors alike.")
    (license license:gpl3)))

;;; ── libunity ─────────────────────────────────────────────────

(define %libunity-patch-vala-abstract
  (origin
    (method url-fetch)
    (uri (string-append
          "https://raw.githubusercontent.com/MercySimp/libunity/7.2.6/"
          "0001-Fix-FTB-with-recent-vala-requiring-non-public-abstra.patch"))
    (sha256
     (base32 "0qijycba8cn11dm7kjljnpsbzn3jqr6incq53i6qcfivrwnmd8lq"))))

(define %libunity-patch-vala-053
  (origin
    (method url-fetch)
    (uri (string-append
          "https://raw.githubusercontent.com/MercySimp/libunity/7.2.6/"
          "libunity-7.1.4-vala-053.patch"))
    (sha256
     (base32 "09j30zvp4g7f9jz5nr76sa5cmzf2b1zm8d236spmmhpn4m5imq5n"))))

(define-public libunity
  (package
    (name "libunity")
    (version "7.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://launchpad.net/ubuntu/+archive/primary/+files/"
             "libunity_" version "+19.04.20190319.orig.tar.gz"))
       (sha256
        (base32 "14hl3xp67f6266bvqqdlxvwwr18cdfnyinckl6mlrxsbsy0b7v2n"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'apply-patches
            (lambda _
              (invoke "patch" "-p1" "-i" #$%libunity-patch-vala-abstract)
              (invoke "patch" "-p1" "-i" #$%libunity-patch-vala-053)))
          (replace 'bootstrap
            (lambda _
              (setenv "NOCONFIGURE" "1")
              (invoke "./autogen.sh"))))))
    (native-inputs
     (list autoconf
           automake
           gnome-common
           gobject-introspection
           intltool
           libtool
           pkg-config
           vala
           which))
    (inputs
     (list dee
           gtk+
           libdbusmenu))
    (home-page "https://launchpad.net/libunity")
    (synopsis "Library for Unity shell integration")
    (description
     "Libunity is a shared library for integrating with all aspects of the
Unity desktop shell, including the launcher, dash, and notification system.")
    (license license:lgpl3)))
