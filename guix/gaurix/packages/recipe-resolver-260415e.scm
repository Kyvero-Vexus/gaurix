;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415e
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 12 resolved with recipes (10 new + 2 already in repo); 18 exhausted.
;;;
;;; calculix-ccx and spooles already exist in recipe-resolver-260414ab.scm.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260415e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system haskell)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            hardinfo2
            ssh-studio
            hyprqt6engine
            haskell-unix-compat
            crengine-ng
            crqt-ng
            git-series
            wlr-which-key-bin
            manaverse-sdl2
            karp
            ))

;;;
;;; --- 1. hardinfo2 ---
;;; Hardware information and benchmarking tool.
;;;

(define-public hardinfo2
  (package
    (name "hardinfo2")
    (version "2.2.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hardinfo2/hardinfo2")
                    (commit (string-append "release-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list glib
                  gtk+
                  json-glib
                  libsoup
                  lm-sensors
                  pciutils
                  zlib))
    (synopsis "System information and benchmark tool for Linux")
    (description
     "HardInfo2 is a system profiler and benchmark tool for Linux.
It can gather information about the hardware and operating system,
perform benchmarks, and generate reports.  It provides a GTK-based
graphical user interface for browsing hardware details.")
    (home-page "https://github.com/hardinfo2/hardinfo2")
    (license (list license:gpl2+ license:lgpl2.1+))))

;;;
;;; --- 2. ssh-studio ---
;;; GUI SSH connection manager built with GTK4/libadwaita.
;;;

(define-public ssh-studio
  (package
    (name "ssh-studio")
    (version "1.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BuddySirJava/SSH-Studio")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:glib-or-gtk? #t))
    (native-inputs (list blueprint-compiler
                         gettext-minimal
                         `(,glib "bin")
                         pkg-config))
    (inputs (list gtk
                  gtksourceview
                  libadwaita
                  python
                  python-pygobject))
    (synopsis "SSH connection manager with GTK4 interface")
    (description
     "SSH Studio is a graphical SSH configuration editor and connection
manager built with GTK4 and libadwaita.  It provides a modern GNOME-style
interface for managing SSH hosts, editing configuration files, and
launching terminal sessions.")
    (home-page "https://github.com/BuddySirJava/SSH-Studio")
    (license license:gpl3+)))

;;;
;;; --- 3. hyprqt6engine ---
;;; Qt6 decoration/style engine for Hyprland.
;;;

(define-public hyprqt6engine
  (package
    (name "hyprqt6engine")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprwm/hyprqt6engine")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list extra-cmake-modules pkg-config))
    (inputs (list hyprlang
                  hyprutils
                  kcolorscheme
                  kconfig
                  kiconthemes
                  qtbase
                  qtdeclarative
                  qtsvg))
    (synopsis "Qt6 QPA theme plugin for Hyprland")
    (description
     "HyprQt6Engine is a Qt6 QPA (Qt Platform Abstraction) theme plugin
for the Hyprland compositor.  It provides native-looking Qt6 application
styling when running under Hyprland, integrating with the Hyprland
configuration system for colors and icon themes.")
    (home-page "https://github.com/hyprwm/hyprqt6engine")
    (license license:bsd-3)))

;;;
;;; --- 4. haskell-unix-compat ---
;;; Portable POSIX-compatibility layer for Haskell.
;;; Named -compat to avoid conflicting with GHC's bundled unix package.
;;;

(define-public haskell-unix-compat
  (package
    (name "ghc-unix-compat")
    (version "2.8.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://hackage.haskell.org/package/unix-compat-"
                    version "/unix-compat-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system haskell-build-system)
    (arguments
     (list #:tests? #f
           #:cabal-revision
           (list "1"
                 "0000000000000000000000000000000000000000000000000000")))
    (synopsis "Portable POSIX-compatibility layer for Haskell")
    (description
     "This package provides portable implementations of parts of the
unix package.  On POSIX systems it re-exports types and functions from
the unix package; on non-POSIX systems it provides workarounds.  This
allows writing code that works on both Unix and Windows.")
    (home-page "https://hackage.haskell.org/package/unix-compat")
    (license license:bsd-3)))

;;;
;;; --- 5. crengine-ng ---
;;; CoolReader rendering engine (NG fork).
;;; Dependency needed by crqt-ng.
;;;

(define-public crengine-ng
  (package
    (name "crengine-ng")
    (version "0.9.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/coolreader-ng/crengine-ng")
                    (commit (string-append "crengine-ng-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release")))
    (native-inputs (list pkg-config))
    (inputs (list fribidi
                  libjpeg-turbo
                  libpng
                  zlib
                  freetype
                  harfbuzz))
    (synopsis "Rendering engine for e-book readers")
    (description
     "CREngine-NG is a rendering engine for e-book formats including
EPUB, FB2, RTF, DOC, TXT, HTML, and CHM.  It provides text formatting,
pagination, font rendering, and style support for building e-book
reader applications.")
    (home-page "https://gitlab.com/coolreader-ng/crengine-ng")
    (license license:gpl2+)))

;;;
;;; --- 6. crqt-ng ---
;;; CoolReader Qt6 e-book reader frontend.
;;;

(define-public crqt-ng
  (package
    (name "crqt-ng")
    (version "1.0.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/coolreader-ng/crqt-ng")
                    (commit (string-append "crqt-ng-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release")))
    (native-inputs (list extra-cmake-modules pkg-config))
    (inputs (list crengine-ng
                  fribidi
                  qtbase
                  qtdeclarative
                  qtsvg))
    (synopsis "Qt6 e-book reader based on CoolReader engine")
    (description
     "CRQt-NG is an e-book reader application with a Qt6 graphical
interface.  It supports EPUB, FB2, RTF, DOC, TXT, HTML, and CHM
formats through the CREngine-NG rendering engine.  Features include
customizable fonts, styles, page layout, and bookmarks.")
    (home-page "https://gitlab.com/coolreader-ng/crqt-ng")
    (license license:gpl2+)))

;;;
;;; --- 7. git-series ---
;;; Track changes to a patch series over time.
;;;

(define-public git-series
  (package
    (name "git-series")
    (version "0.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/git-series/git-series")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list libgit2 libssh2 openssl))
    (synopsis "Track changes to a patch series over time")
    (description
     "git series tracks changes to a patch series over time.  git
series also tracks a cover letter for the patch series, formats the
series for email, and prepares pull requests.  This makes it easy to
collaborate on a patch series with multiple revisions.")
    (home-page "https://github.com/git-series/git-series")
    (license license:expat)))

;;;
;;; --- 8. wlr-which-key-bin ---
;;; Keymap manager for wlroots compositors (binary package).
;;; Source build requires full Rust/Cargo crate vendoring;
;;; binary release provided as practical alternative.
;;;

(define-public wlr-which-key-bin
  (package
    (name "wlr-which-key-bin")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MaxVerevkin/wlr-which-key"
                    "/releases/download/v" version
                    "/wlr-which-key-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wlr-which-key" "bin/wlr-which-key"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Keymap manager for wlroots-based Wayland compositors")
    (description
     "wlr-which-key is a keymap manager for wlroots-based compositors
like Sway and Hyprland.  It displays available key bindings in a
popup menu similar to which-key in Emacs, helping users discover
and remember keyboard shortcuts.")
    (home-page "https://github.com/MaxVerevkin/wlr-which-key")
    (license license:gpl3)))

;;;
;;; --- 9. manaverse-sdl2 ---
;;; ManaPlus fork game client (SDL2 variant).
;;;

(define-public manaverse-sdl2
  (package
    (name "manaverse-sdl2")
    (version "2.1.3.17")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.themanaworld.org/mana/plus.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DUSE_SDL2=ON"
                   "-DCMAKE_BUILD_TYPE=Release")))
    (native-inputs (list pkg-config))
    (inputs (list curl
                  glu
                  libpng
                  libxml2
                  physfs
                  sdl2
                  sdl2-gfx
                  sdl2-image
                  sdl2-mixer
                  sdl2-net
                  sdl2-ttf
                  zlib))
    (synopsis "Open source MMORPG client for The Mana World")
    (description
     "Manaverse is a fork of ManaPlus, an open source client for
The Mana World and similar MMORPG servers.  It provides a 2D graphical
game interface with support for multiple server protocols, plugins,
and customizable themes.  This variant uses SDL2.")
    (home-page "https://git.themanaworld.org/mana/plus")
    (license license:gpl2+)))

;;;
;;; --- 10. karp ---
;;; KDE PDF annotation and editing tool.
;;;

(define-public karp
  (package
    (name "karp")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://invent.kde.org/utilities/karp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release")))
    (native-inputs (list extra-cmake-modules pkg-config))
    (inputs (list kirigami
                  kcoreaddons
                  ki18n
                  kconfig
                  qtbase
                  qtdeclarative
                  qtsvg
                  qpdf
                  poppler))
    (synopsis "PDF annotation and editing tool for KDE")
    (description
     "Karp is a KDE application for annotating and editing PDF files.
It provides a Kirigami-based interface for viewing PDFs, adding
annotations, highlighting text, and performing basic editing
operations.  It uses qpdf and Poppler for PDF processing.")
    (home-page "https://apps.kde.org/karp/")
    (license license:gpl2+)))
