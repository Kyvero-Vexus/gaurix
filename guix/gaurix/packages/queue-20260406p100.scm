;;; Dep-tree priority 100 resolution pass — 2026-04-06
;;; 20 recipes: 7 Python libs, 4 cmake C/C++ libs, 3 meson/vala libs,
;;; 2 git-based plugins/icon themes, 1 Python backup tool, 1 Qt5 binding
;;; generator, 1 Rust/Python SSG, 1 Python filesystem picker.
(define-module (gaurix packages queue-20260406p100)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system python)
  #:use-module (guix utils)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages xml)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (python-ftfy
            python-asyncprawcore
            python-agent-client-protocol
            python-aubio-ledfx
            python-google-ai-generativelanguage
            python-inquirer-textual
            python-textual-fspicker
            msdfgen
            libsurvive
            libnautilus-extension-typeahead
            feather-tk
            smooth
            appmenu-glib-translator
            libastal-bluetooth
            libastal-wireplumber
            themix-icons-gnome-colors
            themix-export-spotify
            backintime-cli
            shiboken2
            zensical))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages — pure Python libraries
;; ═══════════════════════════════════════════════════════════════════

(define-public python-ftfy
  (package
    (name "python-ftfy")
    (version "6.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ftfy" version))
       (sha256
        ;; FIXME: placeholder hash — run `guix download` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-wcwidth))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/LuminosoInsight/python-ftfy")
    (synopsis "fixes mojibake and other problems with Unicode")
    (description "Ftfy fixes mojibake and other problems with Unicode text,
after the fact.  It can repair text that was decoded with the wrong encoding,
fix common encoding mistakes, and normalize text to a consistent form.")
    (license license:expat)))

(define-public python-asyncprawcore
  (package
    (name "python-asyncprawcore")
    (version "3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "asyncprawcore" version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-flit-core))
    (propagated-inputs (list python-aiohttp python-yarl))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/praw-dev/asyncprawcore")
    (synopsis "low-level asynchronous communication layer for Async PRAW")
    (description "Asyncprawcore is a low-level asynchronous communication
layer for Async PRAW, the asynchronous Python Reddit API Wrapper.  It
handles authentication, rate limiting, and HTTP communication with the
Reddit API.")
    (license license:bsd-2)))

(define-public python-agent-client-protocol
  (package
    (name "python-agent-client-protocol")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "agent_client_protocol" version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-pdm-backend))
    (propagated-inputs (list python-pydantic))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/agentclientprotocol/python-sdk")
    (synopsis "python SDK for ACP clients and agents")
    (description "Python SDK for the Agent Client Protocol (ACP), providing
client and agent abstractions for building AI agent communication pipelines.")
    (license license:asl2.0)))

(define-public python-aubio-ledfx
  (package
    (name "python-aubio-ledfx")
    (version "0.4.11")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "aubio_ledfx" version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (native-inputs (list meson-python))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/LedFx/aubio-ledfx")
    (synopsis "audio event detection library for LedFx")
    (description "A fork of the aubio audio signal analysis library,
customized for use with LedFx.  It provides onset detection, pitch tracking,
and beat detection for real-time LED effect synchronization.")
    (license license:gpl3)))

(define-public python-google-ai-generativelanguage
  (package
    (name "python-google-ai-generativelanguage")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_ai_generativelanguage" version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools))
    (propagated-inputs
     (list python-google-api-core
           python-grpcio
           python-proto-plus
           python-protobuf))
    (arguments (list #:tests? #f))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-ai-generativelanguage")
    (synopsis "google AI Generative Language API client library")
    (description "Client library for the Google AI Generative Language API
(Gemini).  Provides Python bindings for interacting with Google's generative
AI models through gRPC and REST.")
    (license license:asl2.0)))

(define-public python-inquirer-textual
  (package
    (name "python-inquirer-textual")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "inquirer_textual" version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-rich python-textual python-typing-extensions))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/robvanderleek/inquirer-textual")
    (synopsis "versatile library for user input in Python")
    (description "Inquirer-textual is a versatile library for creating
interactive terminal user input prompts using the Textual TUI framework.
It supports text input, selection lists, confirmations, and more.")
    (license license:expat)))

(define-public python-textual-fspicker
  (package
    (name "python-textual-fspicker")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "textual_fspicker" version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-textual))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/davep/textual-fspicker")
    (synopsis "textual filesystem picker dialog library")
    (description "A simple Textual filesystem picker dialog library, providing
file open, file save, and directory selection dialogs for terminal
applications built with the Textual TUI framework.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; CMake C/C++ libraries
;; ═══════════════════════════════════════════════════════════════════

(define-public msdfgen
  (package
    (name "msdfgen")
    (version "1.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Chlumsky/msdfgen")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (inputs (list tinyxml2 libpng freetype zlib))
    (arguments
     (list #:configure-flags
           #~(list "-DMSDFGEN_BUILD_STANDALONE=ON"
                   "-DMSDFGEN_USE_VCPKG=OFF"
                   "-DMSDFGEN_INSTALL=ON")
           #:tests? #f))
    (home-page "https://github.com/Chlumsky/msdfgen")
    (synopsis "multi-channel signed distance field generator")
    (description "Msdfgen is a utility for generating signed distance fields
from vector shapes, with support for multi-channel distance fields (MSDF)
for rendering sharp text and vector graphics at any resolution.  It is
commonly used in game engines and GPU text rendering pipelines.")
    (license license:expat)))

(define-public libsurvive
  (package
    (name "libsurvive")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cntools/libsurvive")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (inputs (list openblas libpcap libusb zlib))
    (native-inputs (list eigen pkg-config))
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/cntools/libsurvive")
    (synopsis "lighthouse and Vive VR tracking library")
    (description "Libsurvive is an open-source tracking library for
Lighthouse and HTC Vive based VR devices.  It provides 6DoF pose
estimation using optical tracking data from Lighthouse base stations.")
    (license license:expat)))

(define-public feather-tk
  (package
    (name "feather-tk")
    (version "0.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/grizzlypeak3d/feather-tk")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (inputs (list lunasvg nlohmann-json libpng freetype sdl2))
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/grizzlypeak3d/feather-tk")
    (synopsis "lightweight cross-platform application toolkit")
    (description "Feather-tk is a lightweight toolkit for building
cross-platform applications.  It provides a minimal set of UI components
rendered with SDL2 and SVG/font support via LunaSVG and FreeType.")
    (license license:bsd-3)))

(define-public smooth
  (package
    (name "smooth")
    (version "0.9.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/enzo1982/smooth/releases/download/v"
             version "/smooth-" version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (inputs
     (list bzip2 curl fribidi gtk+ libcpuid libjpeg-turbo libpng libxml2))
    (arguments
     (list #:tests? #f))
    (home-page "http://www.smooth-project.org/")
    (synopsis "object-oriented C++ class library")
    (description "Smooth is an object-oriented C++ class library for
building cross-platform applications.  It provides GUI, I/O, networking,
XML, and internationalization support, and is used as the foundation for
the fre:ac audio converter.")
    (license license:artistic2.0)))

;; ═══════════════════════════════════════════════════════════════════
;; Meson/Vala libraries
;; ═══════════════════════════════════════════════════════════════════

(define-public libnautilus-extension-typeahead
  (package
    (name "libnautilus-extension-typeahead")
    (version "49.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/niclasr/nautilus-typeahead")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (inputs (list glib))
    (native-inputs
     (list gobject-introspection pkg-config))
    (arguments
     (list #:tests? #f))
    (home-page "https://apps.gnome.org/Nautilus/")
    (synopsis "extension interface for Nautilus with typeahead search")
    (description "Extension interface library for GNOME Files (Nautilus),
patched to restore the typeahead search behavior in the file manager.
Provides the shared library for building Nautilus extensions.")
    (license license:gpl3+)))

(define-public appmenu-glib-translator
  (package
    (name "appmenu-glib-translator")
    (version "25.04")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/niclasr/vala-panel-appmenu")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (inputs (list glib))
    (native-inputs
     (list gobject-introspection vala pkg-config))
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.com/vala-panel-project/vala-panel-appmenu")
    (synopsis "glib-based DBusMenu to GMenuModel translator")
    (description "GLib-based library for translating DBusMenu-exported menus
into GMenuModels.  Used for vala-panel's system tray and all variants of
vala-panel-appmenu.  Can be used with GTK3 or GTK4.")
    (license license:lgpl3)))

(define-public libastal-bluetooth
  (package
    (name "libastal-bluetooth")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Aylur/astal")
             (commit "ca3190d")))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (inputs (list glib))
    (native-inputs
     (list gobject-introspection vala pkg-config))
    (arguments
     (list #:source-directory "lib/bluetooth"
           #:tests? #f))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "library to control BlueZ over D-Bus")
    (description "Astal Bluetooth is a GLib/Vala library for controlling
BlueZ (the Linux Bluetooth stack) over D-Bus.  It provides a high-level
API for discovering, pairing, and managing Bluetooth devices.")
    (license license:lgpl2.1)))

(define-public libastal-wireplumber
  (package
    (name "libastal-wireplumber")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Aylur/astal")
             (commit "c1bd89a")))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (inputs (list glib wireplumber))
    (native-inputs
     (list gobject-introspection vala pkg-config))
    (arguments
     (list #:source-directory "lib/wireplumber"
           #:tests? #f))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "library for audio control using WirePlumber")
    (description "Astal WirePlumber is a GLib/Vala library for controlling
audio devices and streams through WirePlumber.  It provides a high-level
API for volume control, device management, and audio stream routing.")
    (license license:lgpl2.1)))

;; ═══════════════════════════════════════════════════════════════════
;; Git-based plugins / icon themes
;; ═══════════════════════════════════════════════════════════════════

(define-public themix-icons-gnome-colors
  (package
    (name "themix-icons-gnome-colors")
    (version "5.5.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/themix-project/gnome-colors-icon-theme")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (inputs (list librsvg imagemagick))
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/gnome-colors/"
                #:include-regexp (".*\\.svg$" ".*\\.png$" "index\\.theme")))))
    (home-page "https://github.com/themix-project/gnome-colors-icon-theme")
    (synopsis "gnome-Colors icon theme plugin for Themix")
    (description "GNOME-Colors icon theme plugin for the Themix GUI designer
(oomox).  Provides a customizable set of icons that can be recolored using
Themix palette tools.")
    (license license:gpl3)))

(define-public themix-export-spotify
  (package
    (name "themix-export-spotify")
    (version "1.2.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/themix-project/oomoxify")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (inputs (list bash-minimal unzip zip polkit))
    (arguments
     (list #:install-plan
           #~'(("." "share/themix-export-spotify/"
                #:include-regexp (".*\\.sh$" ".*\\.py$")))))
    (home-page "https://github.com/themix-project/oomoxify")
    (synopsis "export plugin for Themix to apply color palettes to Spotify")
    (description "Export plugin for the Themix GUI designer that applies color
palettes to the Spotify desktop player.  Uses shell scripts and Python to
modify the Spotify client theme files.")
    (license license:gpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; Python backup tool
;; ═══════════════════════════════════════════════════════════════════

(define-public backintime-cli
  (package
    (name "backintime-cli")
    (version "1.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bit-team/backintime")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (inputs
     (list openssh python-dbus python-keyring python-packaging rsync sshfs))
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'build
                 (lambda _ #t))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (invoke "python3" "common/configure.py"
                             (string-append "--prefix=" out))
                     (invoke "make" "-C" "common" "install")))))))
    (home-page "https://github.com/bit-team/backintime")
    (synopsis "simple backup system using rsync")
    (description "Back In Time is a simple backup system inspired by the
Flyback Project and TimeVault.  It uses rsync and hard-links to create
incremental snapshots of directories.  This package provides the CLI
version without the Qt GUI.")
    (license license:gpl1+)))

;; ═══════════════════════════════════════════════════════════════════
;; Qt5 binding generator
;; ═══════════════════════════════════════════════════════════════════

(define-public shiboken2
  (package
    (name "shiboken2")
    (version "5.15.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.qt.io/official_releases/QtForPython/shiboken2/"
             "PySide2-" version "-src/pyside-setup-opensource-src-"
             version ".tar.xz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (inputs (list libxslt qtxmlpatterns))
    (native-inputs (list python-numpy python-setuptools llvm clang))
    (arguments
     (list #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output)
                   "-DBUILD_TESTS=OFF")
           #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'enter-shiboken-dir
                 (lambda _
                   (chdir "sources/shiboken2"))))))
    (home-page "https://wiki.qt.io/Qt_for_Python")
    (synopsis "generates bindings for C++ libraries using CPython source")
    (description "Shiboken2 is a binding generator for C++ libraries that
generates CPython-based bindings.  It is the code generation component of
Qt for Python (PySide2), capable of generating Python bindings for arbitrary
C++ libraries.")
    (license license:lgpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; Rust/Python static site generator
;; ═══════════════════════════════════════════════════════════════════

(define-public zensical
  (package
    (name "zensical")
    (version "0.0.20")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "zensical" version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (native-inputs (list maturin))
    (propagated-inputs (list python-deepmerge))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/zensical/zensical")
    (synopsis "modern static site generator for project documentation")
    (description "Zensical is a modern static site generator designed to
simplify building and maintaining project documentation.  It uses a Rust
backend via maturin for performance and provides Markdown-based content
management with customizable themes.")
    (license license:expat)))
