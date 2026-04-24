;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423t
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; Resolved recipes (14):
;;;        1.  ttf-comfortaa (font-build-system, v3.105, OFL-1.1)
;;;        2.  python-convertdate (pyproject-build-system, v2.4.1, MIT)
;;;        3.  zdbsp (cmake-build-system, v1.19, GPL-2.0)
;;;        4.  xst (gnu-build-system, v0.9, MIT)
;;;        5.  gpp (gnu-build-system, v2.28, LGPL-3.0+)
;;;        6.  everforest-gtk-theme-git (copy-build-system, v0.0.1, GPL-3.0)
;;;        7.  python-telegram-send (pyproject-build-system, v0.39.2, GPL-3.0+)
;;;        8.  python-pyvis (pyproject-build-system, v0.3.2, BSD-3-Clause)
;;;        9.  python-sioyek (pyproject-build-system, v0.31.11, GPL-3.0)
;;;       10.  liboqs (cmake-build-system, v0.15.0, MIT)
;;;       11.  openssh-askpass-qt (cmake-build-system, v2.1.0, GPL-2.0+)
;;;       12.  quickbib (meson-build-system, v0.7.2, GPL-3.0)
;;;       13.  netcheck (pyproject-build-system, v1.10.1, GPL-2.0+)
;;;       14.  scalpel-git (gnu-build-system, v2.0, Apache-2.0)
;;;
;;; Already packaged prior (8):
;;;       15.  python-types-waitress → recipe-resolver-260408w
;;;       16.  python-cyclopts → recipe-resolver-260416e
;;;       17.  python-myvaillant → recipe-resolver-260415r
;;;       18.  wl-mpris-idle-inhibit → recipe-resolver-260418k
;;;       19.  terminal-rain-lightning → recipe-resolver-260407m
;;;       20.  smpeg0 → recipe-resolver-260415d
;;;       21.  nutty-git → recipe-resolver-260419e (as nutty)
;;;       22.  gh-dash → deptree-resolver-260418ab (as gh-dash-bin)
;;;
;;; Blocked (8):
;;;       23.  sigi — Rust/Cargo, no pre-built binaries; cargo-inputs enumeration required
;;;       24.  rofi-games — Rust/Cargo, no pre-built binaries; cargo-inputs enumeration required
;;;       25.  greetd-tuigreet-fork-git — Rust/Cargo, no pre-built binaries
;;;       26.  phpactor — PHP/Composer ecosystem; no composer-build-system in Guix
;;;       27.  gprname — Ada circular bootstrap (needs gprbuild to build gprbuild)
;;;       28.  adblock2privoxy — orphaned; 20+ Haskell/Cabal deps each needing packaging
;;;       29.  thunar-extended — requires maintaining custom patch set against upstream Thunar
;;;       30.  cassette — depends on unreleased GNOME 46+ Vala libs (libadwaita 1.5+)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423t)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system font)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            ttf-comfortaa
            python-convertdate
            zdbsp
            xst
            gpp
            everforest-gtk-theme-git
            python-telegram-send
            python-pyvis
            python-sioyek
            liboqs
            openssh-askpass-qt
            quickbib
            netcheck
            scalpel-git
            ))

;;; -------------------------------------------------------------------
;;; 1. ttf-comfortaa --- rounded geometric sans-serif font family
;;; -------------------------------------------------------------------
(define-public ttf-comfortaa
  (package
    (name "ttf-comfortaa")
    (version "3.105")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/googlefonts/comfortaa")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/googlefonts/comfortaa")
    (synopsis "rounded geometric sans-serif font family")
    (description "Comfortaa is a rounded geometric sans-serif font family
designed by Johan Aakerlund.  It includes Latin, Cyrillic, and Greek
character sets and is suitable for titles, logos, and body text.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 2. python-convertdate --- calendar system conversion library
;;; -------------------------------------------------------------------
(define-public python-convertdate
  (package
    (name "python-convertdate")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/c/convertdate/"
                    "convertdate-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/fitnr/convertdate")
    (synopsis "converts between Gregorian and various calendar systems")
    (description "Convertdate provides routines for converting dates between
Gregorian, Julian, ISO, Hebrew, Islamic, Persian, Indian Civil, Mayan,
and other calendar systems.  It also includes astronomical calculations
for equinoxes and solstices.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. zdbsp --- ZDoom BSP node builder for Doom WAD files
;;; -------------------------------------------------------------------
(define-public zdbsp
  (package
    (name "zdbsp")
    (version "1.19")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ZDoom/ZDBSP")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list zlib))
    (home-page "https://zdoom.org")
    (synopsis "BSP node builder for ZDoom engine WAD files")
    (description "ZDBSP is a BSP node builder for Doom engine WAD files used
by the ZDoom source port.  It generates the BSP tree data needed by the
game engine to render levels efficiently.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 4. xst --- st terminal fork with additional patches
;;; -------------------------------------------------------------------
(define-public xst
  (package
    (name "xst")
    (version "0.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~arkhan/xst")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list libxft fontconfig libx11 libxext))
    (home-page "https://git.sr.ht/~arkhan/xst")
    (synopsis "simple terminal fork with scrollback and clipboard patches")
    (description "Xst is a fork of the suckless simple terminal (st) with
various patches applied including scrollback, clipboard, font resizing,
wide character support, and other usability improvements.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. gpp --- general-purpose preprocessor
;;; -------------------------------------------------------------------
(define-public gpp
  (package
    (name "gpp")
    (version "2.28")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/logological/gpp/releases/download/"
                    version "/gpp-" version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://logological.org/gpp")
    (synopsis "general-purpose preprocessor with customizable syntax")
    (description "GPP is a general-purpose preprocessor with customizable
syntax suitable for use with any programming or scripting language.  It
handles string replacement, macro expansion, conditional compilation,
and file inclusion.")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 6. everforest-gtk-theme-git --- Everforest GTK theme
;;; -------------------------------------------------------------------
(define-public everforest-gtk-theme-git
  (package
    (name "everforest-gtk-theme-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme")
                    (commit "462458b1a5e1c5fd88e0bd23a14ee659f4f13ec8")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("themes/." "share/themes/"))))
    (home-page "https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme")
    (synopsis "GTK theme based on the Everforest color palette")
    (description "Everforest GTK Theme provides GTK 3 and GTK 4 themes based
on the Everforest color palette.  It includes dark and light variants for
use with GNOME, Xfce, and other GTK-based desktop environments.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. python-telegram-send --- send Telegram messages from command line
;;; -------------------------------------------------------------------
(define-public python-telegram-send
  (package
    (name "python-telegram-send")
    (version "0.39.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/t/telegram_send/"
                    "telegram_send-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/rahiel/telegram-send")
    (synopsis "send messages and files over Telegram from the command line")
    (description "Telegram-send allows sending messages, files, and images
to Telegram chats from the command line or from Python scripts.  It uses
a Telegram bot for delivery and supports reading from standard input.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. python-pyvis --- interactive network graph visualization
;;; -------------------------------------------------------------------
(define-public python-pyvis
  (package
    (name "python-pyvis")
    (version "0.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/WestHealth/pyvis")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-jinja2 python-networkx))
    (home-page "https://github.com/WestHealth/pyvis")
    (synopsis "interactive network graph visualization in Python")
    (description "Pyvis generates interactive network graph visualizations
using the vis.js JavaScript library.  It allows creating and customizing
network graphs from Python with support for physics simulation, node
styling, and edge configuration.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 9. python-sioyek --- Python interface for Sioyek PDF viewer
;;; -------------------------------------------------------------------
(define-public python-sioyek
  (package
    (name "python-sioyek")
    (version "0.31.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/s/sioyek/"
                    "sioyek-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://sioyek.info")
    (synopsis "Python interface for the Sioyek PDF viewer")
    (description "The Sioyek Python library provides a programmatic interface
for interacting with the Sioyek PDF viewer.  It enables extending Sioyek
with custom Python scripts for document navigation, annotation, and
search functionality.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 10. liboqs --- post-quantum cryptographic library
;;; -------------------------------------------------------------------
(define-public liboqs
  (package
    (name "liboqs")
    (version "0.15.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/open-quantum-safe/liboqs")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON"
                   "-DOQS_BUILD_ONLY_LIB=OFF")))
    (native-inputs (list pkg-config))
    (inputs (list openssl))
    (home-page "https://openquantumsafe.org")
    (synopsis "C library for quantum-resistant cryptographic algorithms")
    (description "liboqs is an open source C library implementing
quantum-resistant cryptographic algorithms.  It provides key encapsulation
mechanisms and digital signature schemes designed to resist attacks by
both classical and quantum computers.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. openssh-askpass-qt --- Qt-based SSH passphrase dialog
;;; -------------------------------------------------------------------
(define-public openssh-askpass-qt
  (package
    (name "openssh-askpass-qt")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicosoresm/openssh-askpass/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase-5))
    (home-page "http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=openssh-askpass&full=0")
    (synopsis "Qt-based passphrase dialog for OpenSSH")
    (description "OpenSSH Askpass Qt is a Qt-based passphrase dialog for
OpenSSH.  It provides a graphical prompt for entering SSH key passphrases
and passwords, compatible with the SSH_ASKPASS environment variable.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 12. quickbib --- DOI/arXiv to BibTeX desktop tool
;;; -------------------------------------------------------------------
(define-public quickbib
  (package
    (name "quickbib")
    (version "0.7.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/archisman-panigrahi/QuickBib")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config gettext-minimal desktop-file-utils))
    (inputs (list python gtk libadwaita))
    (home-page "https://github.com/archisman-panigrahi/QuickBib")
    (synopsis "quickly get BibTeX entries from DOI or arXiv identifiers")
    (description "QuickBib converts DOI and arXiv identifiers into BibTeX
entries.  It provides a simple graphical interface for researchers to
quickly obtain citation data for their papers and bibliography files.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 13. netcheck --- network connectivity and quality checker
;;; -------------------------------------------------------------------
(define-public netcheck
  (package
    (name "netcheck")
    (version "1.10.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gene-git/netcheck")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/gene-git/netcheck")
    (synopsis "network connectivity and quality monitoring tool")
    (description "Netcheck monitors and logs network connectivity by
performing periodic checks.  It provides tools to visualize connection
quality over time with graphs of latency and packet loss data.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 14. scalpel-git --- file carving and recovery tool
;;; -------------------------------------------------------------------
(define-public scalpel-git
  (package
    (name "scalpel-git")
    (version "2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sleuthkit/scalpel")
                    (commit "35e1367c6f60a1e7edf4b0b18ade6ec24f8fa0b3")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "./configure"
                           (string-append "--prefix="
                                          (assoc-ref outputs "out"))))))))
    (inputs (list tre))
    (home-page "https://github.com/sleuthkit/scalpel")
    (synopsis "file carving tool for digital forensics and data recovery")
    (description "Scalpel is a file carving tool that reads a database of
header and footer definitions and extracts matching files from a disk
image or raw device.  It is useful for digital forensics and data
recovery operations.")
    (license license:asl2.0)))
