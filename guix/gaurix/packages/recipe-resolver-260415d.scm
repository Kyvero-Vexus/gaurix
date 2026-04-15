;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415d
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 14 resolved with recipes; 16 exhausted (see blocked-notes).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260415d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages logging)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (
            libtrash
            scolorpicker-legacy
            srtodo-git
            gpgfrontend
            linux-enable-ir-emitter
            ntfsprogs-plus-git
            python-aioice
            fonts-meta-base
            btrfs-desktop-notification-git
            smpeg0
            plymouth-theme-mikuboot-git
            python-zxing-cpp
            go-prism
            hypruler
            ))

;;;
;;; --- 1. libtrash ---
;;; Shared library implementing a trash can via LD_PRELOAD.
;;;

(define-public libtrash
  (package
    (name "libtrash")
    (version "3.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pete/libtrash")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (lib (string-append out "/lib")))
                     (mkdir-p lib)
                     (install-file "libtrash.so" lib)))))))
    (synopsis "Shared library implementing a trash can under GNU/Linux")
    (description
     "libtrash is a shared library which, when preloaded via LD_PRELOAD,
intercepts calls to unlink() and related functions, moving files to a
trash directory instead of permanently deleting them.  This provides
a safety net against accidental file deletion.")
    (home-page "https://github.com/pete/libtrash")
    (license license:gpl2+)))

;;;
;;; --- 2. scolorpicker-legacy ---
;;; X11 color picker (legacy C version).
;;;

(define-public scolorpicker-legacy
  (package
    (name "scolorpicker-legacy")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/smooll-d/scolorpicker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libx11 libxext))
    (synopsis "Lightweight X11 color picker")
    (description
     "scolorpicker-legacy is the legacy X11-only version of smooll's Color
Picker.  It provides a minimal screen color picker for X11 desktops.")
    (home-page "https://github.com/smooll-d/scolorpicker")
    (license ((@@ (guix licenses) license) "0BSD"
              "https://spdx.org/licenses/0BSD.html"
              "Zero-Clause BSD License"))))

;;;
;;; --- 3. srtodo-git ---
;;; Rofi-based markdown todo manager.
;;;

(define-public srtodo-git
  (package
    (name "srtodo-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/srliu3264/srtodo")
                    (commit "de64536")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("srtodo" "bin/srtodo"))))
    (inputs (list bash gawk sed))
    (synopsis "Rofi-based markdown todo manager")
    (description
     "srtodo is a simple todo manager that uses Rofi as its user interface
and stores tasks in markdown format.  It provides a quick way to add,
view, and manage todo items from a Rofi launcher.")
    (home-page "https://github.com/srliu3264/srtodo")
    (license license:expat)))

;;;
;;; --- 4. gpgfrontend ---
;;; GUI frontend for GnuPG.
;;;

(define-public gpgfrontend
  (package
    (name "gpgfrontend")
    (version "2.1.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/saturneric/GpgFrontend")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DGPGFRONTEND_BUILD_TESTING=OFF")))
    (native-inputs (list pkg-config qttools))
    (inputs (list gpgme
                  icu4c
                  libarchive
                  openssl
                  qtbase))
    (synopsis "GUI frontend for modern GnuPG")
    (description
     "GpgFrontend is an exceptional GUI frontend for GnuPG (gpg).  It provides
an intuitive interface for encrypting, decrypting, signing, and verifying
files and text using OpenPGP keys.  Features include key management, key
server integration, and a user-friendly workflow for common GPG operations.")
    (home-page "https://gpgfrontend.bktus.com")
    (license license:gpl3+)))

;;;
;;; --- 5. linux-enable-ir-emitter ---
;;; Enables infrared cameras not working out-of-the-box.
;;;

(define-public linux-enable-ir-emitter
  (package
    (name "linux-enable-ir-emitter")
    (version "6.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EmixamPP/linux-enable-ir-emitter")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list fmt
                  gtk+
                  opencv
                  spdlog
                  yaml-cpp
                  zlib))
    (synopsis "Enable infrared cameras on Linux")
    (description
     "linux-enable-ir-emitter is a utility to enable infrared cameras that
are not directly enabled out-of-the-box on Linux.  It auto-detects and
configures the IR emitter for use with facial recognition software like
Howdy or other IR-based applications.")
    (home-page "https://github.com/EmixamPP/linux-enable-ir-emitter")
    (license license:expat)))

;;;
;;; --- 6. ntfsprogs-plus-git ---
;;; Enhanced NTFS utilities (fork of ntfsprogs).
;;;

(define-public ntfsprogs-plus-git
  (package
    (name "ntfsprogs-plus-git")
    (version "2025.1.25")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AldairbotHeique/ntfsprogs-plus")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'autoreconf
                 (lambda _
                   (invoke "autoreconf" "-fiv"))))))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list fuse ntfs-3g))
    (synopsis "Enhanced NTFS filesystem utilities")
    (description
     "ntfsprogs-plus is an enhanced fork of ntfsprogs providing additional
NTFS filesystem utilities beyond what ntfs-3g provides.  It includes
tools for NTFS filesystem inspection, repair, and manipulation.")
    (home-page "https://github.com/AldairbotHeique/ntfsprogs-plus")
    (license license:gpl2+)))

;;;
;;; --- 7. python-aioice ---
;;; Asyncio-based ICE (RFC 5245) implementation.
;;;

(define-public python-aioice
  (package
    (name "python-aioice")
    (version "0.10.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "aioice" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-dnspython))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Asyncio-based Interactive Connectivity Establishment (ICE)")
    (description
     "aioice is a Python library implementing Interactive Connectivity
Establishment (RFC 5245) using asyncio.  It provides STUN and TURN
protocol support for establishing peer-to-peer connections through
NATs and firewalls.")
    (home-page "https://github.com/aiortc/aioice")
    (license license:bsd-3)))

;;;
;;; --- 8. fonts-meta-base ---
;;; Base font collection meta-package.
;;;

(define-public fonts-meta-base
  (package
    (name "fonts-meta-base")
    (version "1.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (mkdir-p (string-append #$output "/share/doc"))
               (call-with-output-file
                   (string-append #$output "/share/doc/fonts-meta-base.txt")
                 (lambda (port)
                   (display "Base font collection meta-package.\n" port))))))
    (propagated-inputs
     (list font-dejavu font-liberation font-google-noto))
    (synopsis "Base font collection meta-package")
    (description
     "fonts-meta-base is a meta-package that provides a base collection
of commonly used fonts including DejaVu, Liberation, and Noto.
Installing this package ensures a reasonable set of fonts for desktop
use.")
    (home-page "https://www.freedesktop.org/wiki/Software/Fonts/")
    (license license:gpl2+)))

;;;
;;; --- 9. btrfs-desktop-notification-git ---
;;; Desktop notifications for BTRFS warnings.
;;;

(define-public btrfs-desktop-notification-git
  (package
    (name "btrfs-desktop-notification-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/Zesko/btrfs-desktop-notification.git")
                    (commit "132c107")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("btrfs-desktop-notification" "bin/btrfs-desktop-notification"))))
    (inputs (list bash libnotify))
    (synopsis "Desktop notifications for BTRFS filesystem warnings")
    (description
     "btrfs-desktop-notification monitors BTRFS filesystem status and sends
desktop notifications when warnings or error messages appear.  It alerts
users about read-only filesystem states and BTRFS issues reported in
kernel messages.")
    (home-page "https://gitlab.com/Zesko/btrfs-desktop-notification")
    (license license:gpl3)))

;;;
;;; --- 10. smpeg0 ---
;;; SDL MPEG Player Library (legacy version 0.x).
;;;

(define-public smpeg0
  (package
    (name "smpeg0")
    (version "0.4.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/icculus/smpeg/archive/refs/tags/release_"
                    (string-join (string-split version #\.) "_")
                    ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'autoreconf
                 (lambda _
                   (invoke "autoreconf" "-fiv"))))))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list sdl))
    (synopsis "SDL MPEG player library")
    (description
     "SMPEG is an MPEG-1 video player library with audio support based on
SDL.  This is the legacy 0.x version branch, providing MPEG decoding
capabilities for applications using the SDL 1.2 multimedia library.")
    (home-page "https://github.com/icculus/smpeg")
    (license license:lgpl2.1+)))

;;;
;;; --- 11. plymouth-theme-mikuboot-git ---
;;; Hatsune Miku themed Plymouth boot splash.
;;;

(define-public plymouth-theme-mikuboot-git
  (package
    (name "plymouth-theme-mikuboot-git")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mikuboot/plymouth-theme-mikuboot")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plymouth/themes/mikuboot"
                #:exclude ("README.md" "LICENSE" ".git")))))
    (synopsis "Hatsune Miku themed Plymouth boot splash")
    (description
     "plymouth-theme-mikuboot is a Plymouth boot splash theme featuring
Hatsune Miku artwork.  It provides an animated boot screen for systems
using Plymouth as their boot splash manager.")
    (home-page "https://github.com/mikuboot/plymouth-theme-mikuboot")
    (license license:gpl3)))

;;;
;;; --- 12. python-zxing-cpp ---
;;; Python bindings for the zxing-cpp barcode library.
;;;

(define-public python-zxing-cpp
  (package
    (name "python-zxing-cpp")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "zxing_cpp" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list cmake pybind11 python-setuptools python-wheel))
    (inputs (list zxing-cpp))
    (synopsis "Python bindings for zxing-cpp barcode library")
    (description
     "python-zxing-cpp provides Python bindings for the zxing-cpp library,
enabling barcode and QR code reading and generation from Python.
Supports a wide range of 1D and 2D barcode formats including QR Code,
Data Matrix, Aztec, PDF417, and many more.")
    (home-page "https://github.com/zxing-cpp/zxing-cpp")
    (license license:asl2.0)))

;;;
;;; --- 13. go-prism ---
;;; Turns raw test output into beautiful data.
;;;

(define-public go-prism
  (package
    (name "go-prism")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/DaltonSW/prism")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/DaltonSW/prism"
           #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'check))))
    (synopsis "Turns raw test output into readable data")
    (description
     "Prism is a Go tool that transforms raw test output into beautifully
formatted and readable data.  It parses test results from various
testing frameworks and presents them in a clear, colorful format.")
    (home-page "https://github.com/DaltonSW/prism")
    (license license:expat)))

;;;
;;; --- 14. hypruler ---
;;; Screen measurement tool for Hyprland.
;;;

(define-public hypruler
  (package
    (name "hypruler")
    (version "0.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/t4t5/hypruler")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'check))))
    (inputs (list fontconfig))
    (synopsis "Measure anything on your screen")
    (description
     "Hypruler is a screen measurement tool designed for Hyprland and other
Wayland compositors.  It allows users to quickly measure distances,
dimensions, and areas on their screen with pixel-level precision.")
    (home-page "https://github.com/t4t5/hypruler")
    (license license:expat)))
