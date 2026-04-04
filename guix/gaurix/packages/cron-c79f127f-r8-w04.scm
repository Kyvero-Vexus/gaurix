;;; Chunk-local module for blocked-tree run cron-c79f127f (worker w04, round 8).
(define-module (gaurix packages cron-c79f127f-r8-w04)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:autoload (gnu packages) (specification->package)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:export (python-pfzy
            python-inquirerpy
            python-sse-starlette
            python-uv-dynamic-versioning
            xboxdrv
            google-chrome
            llvm-libs-minimal-git
            python312
            hyprtoolkit
            wayfire))

;;; ---------------------------------------------------------------------------
;;; Helper: create an alias from an upstream Guix package.
;;; ---------------------------------------------------------------------------
(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

;;; ---------------------------------------------------------------------------
;;; 1. python-pfzy — fuzzy matching library (dependency of InquirerPy)
;;; ---------------------------------------------------------------------------
(define-public python-pfzy
  (package
    (name "python-pfzy")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pfzy" version))
       (sha256
        (base32 "1wdkjkmwwg920ybmr46m1jry06fqxyc2v2r9wwc3ddhhvmjsfzki"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/kazhala/pfzy")
    (synopsis "Python fuzzy string matching library")
    (description
     "pfzy is a Python port of the fuzzy string matching algorithm used by
the fzy fuzzy finder.  It provides scoring and filtering for interactive
selection interfaces.")
    (license license:expat)))

;;; ---------------------------------------------------------------------------
;;; 2. python-inquirerpy — interactive CLI prompts
;;; ---------------------------------------------------------------------------
(define-public python-inquirerpy
  (package
    (name "python-inquirerpy")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "InquirerPy" version))
       (sha256
        (base32 "0zhrzj4xwyhd1c8xfjcac4gfrch8643k3bj1rf1p8cqz26havll9"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (propagated-inputs
     (list python-pfzy python-prompt-toolkit))
    (home-page "https://github.com/kazhala/InquirerPy")
    (synopsis "Interactive CLI prompt library for Python")
    (description
     "InquirerPy provides a collection of common interactive command-line
user interface prompts built on top of prompt_toolkit.  It supports list,
checkbox, confirm, input, filepath, fuzzy, and other prompt types.")
    (license license:expat)))

;;; ---------------------------------------------------------------------------
;;; 3. python-sse-starlette — Server-Sent Events for Starlette/FastAPI
;;; ---------------------------------------------------------------------------
(define-public python-sse-starlette
  (package
    (name "python-sse-starlette")
    (version "3.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sse_starlette" version))
       (sha256
        (base32 "1wdyqwvp2zhfy35c7nqyq154hywliq1ar59834km92mgcz02zyda"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (propagated-inputs
     (list (specification->package "python-anyio")
           (specification->package "python-starlette")
           (specification->package "python-uvicorn")))
    (home-page "https://github.com/sysid/sse-starlette")
    (synopsis "Server-Sent Events for Starlette and FastAPI")
    (description
     "sse-starlette implements the Server-Sent Events (SSE) protocol for
Starlette and FastAPI applications.  It provides an @code{EventSourceResponse}
class that streams events to connected clients.")
    (license license:bsd-3)))

;;; ---------------------------------------------------------------------------
;;; 4. python-uv-dynamic-versioning — dynamic versioning for uv/hatch
;;; ---------------------------------------------------------------------------
(define-public python-uv-dynamic-versioning
  (package
    (name "python-uv-dynamic-versioning")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "uv_dynamic_versioning" version))
       (sha256
        (base32 "0nyvr1x24qf2hynbixcgp5bi51v4p39pm5jm3p04bkksx03vqksp"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs
     (list (specification->package "python-dunamai")
           (specification->package "python-jinja2")
           (specification->package "python-pydantic")
           (specification->package "python-tomlkit")))
    (home-page "https://github.com/ninoseki/uv-dynamic-versioning")
    (synopsis "Dynamic versioning plugin for uv and hatch")
    (description
     "uv-dynamic-versioning is a hatch build plugin that determines the
package version dynamically from VCS tags using dunamai.  It is designed
for use with uv and hatchling build backends.")
    (license license:expat)))

;;; ---------------------------------------------------------------------------
;;; 5. xboxdrv — Xbox gamepad userspace driver
;;; ---------------------------------------------------------------------------
(define-public xboxdrv
  (package
    (name "xboxdrv")
    (version "0.8.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/xiota/xboxdrv/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0bh5a3j3bz5dm0yp0ng8fs1arqszblc3zpyprnwj35vdbdirqyi2"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list (specification->package "pkg-config")))
    (inputs
     (list (specification->package "dbus-glib")
           (specification->package "glib")
           (specification->package "libusb")
           (specification->package "libx11")
           (specification->package "python")
           (specification->package "python-dbus")))
    (home-page "https://github.com/xiota/xboxdrv")
    (synopsis "Xbox gamepad userspace driver for Linux")
    (description
     "xboxdrv is a userspace driver for Xbox and Xbox 360 gamepads.  It
supports button remapping, axis calibration, autofire, and force feedback
effects.  This fork by xiota adds meson build support and various fixes.")
    (license license:gpl3+)))

;;; ---------------------------------------------------------------------------
;;; 6. google-chrome — alias to ungoogled-chromium
;;; ---------------------------------------------------------------------------
(define-public google-chrome
  (gaurix-alias-package "google-chrome" "ungoogled-chromium"))

;;; ---------------------------------------------------------------------------
;;; 7. llvm-libs-minimal-git — alias to upstream LLVM
;;; ---------------------------------------------------------------------------
(define-public llvm-libs-minimal-git
  (gaurix-alias-package "llvm-libs-minimal-git" "llvm"))

;;; ---------------------------------------------------------------------------
;;; 8. python312 — alias to upstream Python 3.10 (closest available)
;;; ---------------------------------------------------------------------------
(define-public python312
  (gaurix-alias-package "python312" "python@3.10"))

;;; ---------------------------------------------------------------------------
;;; 9. hyprtoolkit — Hyprland C++ Wayland-native GUI toolkit
;;; ---------------------------------------------------------------------------
(define-public hyprtoolkit
  (package
    (name "hyprtoolkit")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hyprwm/hyprtoolkit/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1h6dnkyldys6flfwm704b46v8g8qma3s2nhil3nv3x7n9gyp2rky"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list (specification->package "pkg-config")
           (specification->package "hyprwayland-scanner")))
    (inputs
     (list (specification->package "cairo")
           (specification->package "hyprutils")
           (specification->package "hyprlang")
           (specification->package "iniparser")
           (specification->package "libdrm")
           (specification->package "libinput")
           (specification->package "libxkbcommon")
           (specification->package "mesa")
           (specification->package "pango")
           (specification->package "pixman")
           (specification->package "wayland")
           (specification->package "wayland-protocols")))
    (home-page "https://github.com/hyprwm/hyprtoolkit")
    (synopsis "Modern C++ Wayland-native GUI toolkit for Hyprland")
    (description
     "Hyprtoolkit is a modern C++ GUI toolkit designed for Wayland compositors.
It integrates with the Hyprland ecosystem and provides widgets, rendering,
and input handling for building native Wayland applications.")
    (license license:bsd-3)))

;;; ---------------------------------------------------------------------------
;;; 10. wayfire — 3D Wayland compositor
;;; ---------------------------------------------------------------------------
(define-public wayfire
  (package
    (name "wayfire")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/WayfireWM/wayfire/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "051m1s5fddq3ccd0vrqln8mag9g7rn0k88db7wl6256jspx2kks0"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-Duse_system_wlroots=enabled"
              "-Duse_system_wfconfig=enabled")
      #:tests? #f))
    (native-inputs
     (list (specification->package "pkg-config")
           (specification->package "wayland-protocols")))
    (inputs
     (list (specification->package "cairo")
           (specification->package "eudev")
           (specification->package "glm")
           (specification->package "libdrm")
           (specification->package "libinput")
           (specification->package "libjpeg-turbo")
           (specification->package "libxkbcommon")
           (specification->package "mesa")
           (specification->package "pango")
           (specification->package "pixman")
           (specification->package "vulkan-loader")
           (specification->package "wayland")
           (specification->package "wf-config")
           (specification->package "wlroots@0.19")
           (specification->package "yyjson")))
    (home-page "https://wayfire.org")
    (synopsis "3D Wayland compositor with plugin support")
    (description
     "Wayfire is a 3D Wayland compositor inspired by Compiz.  It provides
window management with 3D effects, a plugin architecture for extensibility,
and is built on top of wlroots.  It supports Expo, Cube, and many other
desktop effects.")
    (license license:expat)))
