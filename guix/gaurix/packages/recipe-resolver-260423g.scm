;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423g
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (10):
;;;        1.  sqlite-jdbc (copy-build-system, v3.49.1.0, Apache-2.0)
;;;        2.  beatoraja-modernchic (copy-build-system, v0.8.8, GPL-3.0+)
;;;        3.  themix-icons-suru-plus-git (copy-build-system, v30.0, GPL-3.0+)
;;;        4.  themix-icons-suru-plus-aspromauros-git (copy-build-system, v3.0, GPL-3.0+)
;;;        5.  amazon-fonts (font-build-system, v1.0, custom:amazon-limited)
;;;        6.  canvas-downloader (python-build-system, v0.3.1, MIT)
;;;        7.  kwin-effect-rounded-corners-x11-git (cmake-build-system, v0.6.7, GPL-3.0+)
;;;        8.  kwin-effects-better-blur-dx-x11-git (cmake-build-system, v0.1, GPL-3.0+)
;;;        9.  plasma6-applets-kurve (cmake-build-system, v0.5.0, GPL-3.0+)
;;;       10.  khtml (cmake-build-system, v5.115.0, LGPL-2.0+)
;;;
;;; BLOCKED EXHAUSTED (20):
;;;        1.  mobilesheets-companion -> PROPRIETARY_BINARY: no source, proprietary app
;;;        2.  joplin-beta -> ELECTRON_NPM: Electron/TypeScript with 500+ npm deps
;;;        3.  feishu -> PROPRIETARY_BINARY: Bytedance closed-source
;;;        4.  flashprint -> PROPRIETARY_BINARY: Flashforge proprietary slicer
;;;        5.  vigaphone-bin -> PROPRIETARY_BINARY: VoIP softphone, closed-source
;;;        6.  emby-server-beta -> PROPRIETARY_BINARY: commercial media server
;;;        7.  python-pyqt5-extra-modules -> QT_SIP_COMPLEX: needs SIP + full Qt5 rebuild
;;;        8.  cockpit-pacman -> ARCH_SPECIFIC: depends on alpm.rs/pacman
;;;        9.  wowup -> ELECTRON_NPM: Electron + npm dep chain
;;;       10.  wowup-cf -> ELECTRON_NPM: Electron variant, same blocker
;;;       11.  gprbuild-toolbox -> ADA_BOOTSTRAP: circular dep with gprbuild/libgpr
;;;       12.  whisparr-eros-develop -> DOTNET_REQUIRED: .NET binary, no dotnet-sdk in Guix
;;;       13.  arch-cleaner -> ARCH_SPECIFIC: depends on pacman
;;;       14.  cros-container-guest-tools-git -> CHROMEOS_SPECIFIC: Chrome OS only
;;;       15.  plasma6-wallpapers-wallpaper-engine-git -> COMPLEX_DEPS: proprietary Steam integration
;;;       16.  vscodium-xdg-dir-patch -> DEPENDS_ON_PROPRIETARY: requires vscodium binary
;;;       17.  aimp-skin-m5 -> PLATFORM_SPECIFIC: AIMP is Windows-only
;;;       18.  aimp-skin-soot -> PLATFORM_SPECIFIC: AIMP is Windows-only
;;;       19.  compiler-rt15 -> LLVM_REBUILD_SCOPE: requires full LLVM 15 rebuild
;;;       20.  python-pillow-simd-git -> GUIX_HAS_EQUIVALENT: python-pillow in Guix
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xorg)
  #:export (
            sqlite-jdbc
            beatoraja-modernchic
            themix-icons-suru-plus
            themix-icons-suru-plus-aspromauros
            amazon-fonts
            canvas-downloader
            kwin-effect-rounded-corners
            kwin-effects-better-blur-dx
            plasma6-applets-kurve
            khtml
            ))

;;; -------------------------------------------------------------------
;;; 1. sqlite-jdbc — JDBC driver for SQLite
;;; -------------------------------------------------------------------
(define-public sqlite-jdbc
  (package
    (name "sqlite-jdbc")
    (version "3.49.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xerial/sqlite-jdbc/releases/download/"
                    version "/sqlite-jdbc-" version ".jar"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sqlite-jdbc-3.49.1.0.jar" "share/java/"))))
    (native-inputs (list `(,icedtea "jdk")))
    (synopsis "JDBC driver for SQLite databases")
    (description
     "SQLite JDBC is a library for accessing and creating SQLite database
files in Java.  It embeds the SQLite native library and provides a
pure-Java JDBC interface, requiring no additional native configuration.")
    (home-page "https://github.com/xerial/sqlite-jdbc")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 2. beatoraja-modernchic — cross-platform BMS rhythm game
;;; -------------------------------------------------------------------
(define-public beatoraja-modernchic
  (package
    (name "beatoraja-modernchic")
    (version "0.8.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/exch-bms2/beatoraja/releases/download/"
                    version "/beatoraja" version "-modernchic.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/beatoraja/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/beatoraja")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/beatoraja")
                       (lambda ()
                         (format #t "#!/bin/sh\nexec java -jar ~a/beatoraja.jar \"$@\"\n"
                                 share)))
                     (chmod (string-append bin "/beatoraja") #o755)))))))
    (inputs (list `(,icedtea "jdk")))
    (synopsis "cross-platform BMS rhythm game based on Java and libGDX")
    (description
     "Beatoraja is a cross-platform rhythm game that plays BMS (Be-Music Source)
format charts.  It is built with Java and the libGDX game framework.  The
ModernChic skin provides a contemporary user interface.")
    (home-page "https://github.com/exch-bms2/beatoraja")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 3. themix-icons-suru-plus — Suru++ icon theme
;;; -------------------------------------------------------------------
(define-public themix-icons-suru-plus
  (package
    (name "themix-icons-suru-plus")
    (version "30.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gusbemacbe/suru-plus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Suru++/"
                #:exclude ("LICENSE" "README.md" ".gitignore")))))
    (synopsis "Suru++ icon theme for Linux desktops")
    (description
     "Suru++ is a comprehensive icon theme for Linux desktops, based on the
Suru icon set originally designed for Ubuntu.  It provides a complete set
of modern, colorful icons for applications, file types, and system
actions.")
    (home-page "https://github.com/gusbemacbe/suru-plus")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 4. themix-icons-suru-plus-aspromauros — Suru++ Asprómauros icon theme
;;; -------------------------------------------------------------------
(define-public themix-icons-suru-plus-aspromauros
  (package
    (name "themix-icons-suru-plus-aspromauros")
    (version "3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gusbemacbe/suru-plus-aspromauros")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Suru++-Asprómauros/"
                #:exclude ("LICENSE" "README.md" ".gitignore")))))
    (synopsis "monochrome variant of the Suru++ icon theme")
    (description
     "Suru++ Asprómauros is a monochrome variant of the Suru++ icon theme.
It provides the same comprehensive icon coverage in a black-and-white
aesthetic suitable for dark or minimal desktop themes.")
    (home-page "https://github.com/gusbemacbe/suru-plus-aspromauros")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5. amazon-fonts — Amazon Ember and Bookerly typefaces
;;; -------------------------------------------------------------------
(define-public amazon-fonts
  (package
    (name "amazon-fonts")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://developer.amazon.com/sdk-download/AmazonEmber.zip")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "Amazon Ember and Bookerly typeface families")
    (description
     "Amazon Ember is a sans-serif typeface and Bookerly is a serif typeface,
both designed for Amazon products and services.  Amazon Ember provides
a clean, modern sans-serif suitable for user interfaces, while Bookerly
offers a reading-optimized serif for long-form text.")
    (home-page "https://developer.amazon.com/en-US/alexa/branding/echo-guidelines/identity-guidelines/typography")
    (license (license:non-copyleft
              "https://developer.amazon.com/support/legal/tou"
              "Amazon limited-use font license"))))

;;; -------------------------------------------------------------------
;;; 6. canvas-downloader — download files from Canvas LMS courses
;;; -------------------------------------------------------------------
(define-public canvas-downloader
  (package
    (name "canvas-downloader")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/canvas-downloader")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-requests))
    (synopsis "download course files from Canvas LMS")
    (description
     "Canvas Downloader is a command-line tool to bulk download course files
from the Canvas Learning Management System.  It authenticates via API
token and recursively retrieves files from specified courses.")
    (home-page "https://github.com/nicholasgasior/canvas-downloader")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. kwin-effect-rounded-corners — KWin rounded window corners
;;; -------------------------------------------------------------------
(define-public kwin-effect-rounded-corners
  (package
    (name "kwin-effect-rounded-corners")
    (version "0.6.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/matinlotfali/KDE-Rounded-Corners")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list extra-cmake-modules pkg-config))
    (inputs (list kwin
                  kconfigwidgets
                  kglobalaccel
                  kwindowsystem
                  libepoxy
                  qtbase
                  qtdeclarative))
    (synopsis "KWin effect plugin for rounded window corners")
    (description
     "KDE Rounded Corners is a KWin effect plugin that renders rounded
corners on application windows.  It works with KDE Plasma 6 on both
X11 and Wayland sessions.")
    (home-page "https://github.com/matinlotfali/KDE-Rounded-Corners")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. kwin-effects-better-blur-dx — enhanced KWin blur effect
;;; -------------------------------------------------------------------
(define-public kwin-effects-better-blur-dx
  (package
    (name "kwin-effects-better-blur-dx")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/taj-ny/kwin-effects-forceblur")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list extra-cmake-modules pkg-config))
    (inputs (list kwin
                  kconfigwidgets
                  kglobalaccel
                  kwindowsystem
                  qtbase
                  qtdeclarative))
    (synopsis "enhanced blur effect plugin for KWin")
    (description
     "Better Blur DX is a KWin effect plugin that provides an enhanced
Gaussian blur effect for window transparency.  It improves upon the
default KWin blur with better performance and additional configuration
options.")
    (home-page "https://github.com/taj-ny/kwin-effects-forceblur")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 9. plasma6-applets-kurve — KDE Plasma system stats applet
;;; -------------------------------------------------------------------
(define-public plasma6-applets-kurve
  (package
    (name "plasma6-applets-kurve")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niclas3640/kurve")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list extra-cmake-modules pkg-config))
    (inputs (list libplasma
                  ki18n
                  kcoreaddons
                  kdeclarative
                  qtbase
                  qtdeclarative))
    (synopsis "system statistics Plasma applet with curve graphs")
    (description
     "Kurve is a KDE Plasma 6 applet that displays system statistics such as
CPU, memory, and network usage as smooth curve graphs in the panel or
desktop.  It provides a lightweight, visually appealing system monitor
widget.")
    (home-page "https://github.com/niclas3640/kurve")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 10. khtml — KDE Frameworks HTML rendering engine
;;; -------------------------------------------------------------------
(define-public khtml
  (package
    (name "khtml")
    (version "5.115.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://kde/stable/frameworks/"
                    (version-major+minor version)
                    "/portingAids/khtml-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'set-path
                 (lambda _
                   (setenv "HOME" (getcwd)))))))
    (native-inputs (list extra-cmake-modules pkg-config perl))
    (inputs (list karchive-5
                  kcodecs-5
                  kglobalaccel-5
                  ki18n-5
                  kiconthemes-5
                  kio-5
                  kjs
                  knotifications-5
                  kparts-5
                  ktextwidgets-5
                  kwidgetsaddons-5
                  kwindowsystem-5
                  kxmlgui-5
                  qtbase-5
                  sonnet-5))
    (synopsis "KDE Frameworks HTML rendering engine (porting aid)")
    (description
     "KHTML is the legacy HTML rendering engine from KDE Frameworks 5.  It
is provided as a porting aid for applications that have not yet migrated
to QtWebEngine or other rendering solutions.  KHTML supports HTML 4,
CSS 2.1, and basic JavaScript through the KJS engine.")
    (home-page "https://api.kde.org/frameworks/khtml/html/index.html")
    (license license:lgpl2.0+)))
