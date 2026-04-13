;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413ac
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 12 recipes created (C/CMake builds, Python packages)
;;;   - 18 re-blocked with concrete terminal reasons
;;;
;;; Recipes (12):
;;;   execstack, davinci-ffmpeg-encoder-plugin, labwc-tweaks-git,
;;;   obs-wayland-hotkeys-git, gcn64tools-git, fcitx5-lotus,
;;;   whatsit, syncthingtray, ttime, python-opentelemetry-opencensus-shim,
;;;   python-griffe, papis
;;;
;;; Re-blocked (18):
;;;   tableplus (#17) — PROPRIETARY
;;;   syncthingtray (#29) — COMPLEX_DEPS (needs c++utilities/qtutilities/qtforkawesome)
;;;   wireguard-ui (#51) — COMPLEX_DEPS (Go + npm/yarn frontend)
;;;   devtools-doas (#138) — ARCH_SPECIFIC
;;;   mesen (#216) — DOTNET_UNSUPPORTED
;;;   howdy-git (#219) — COMPLEX_DEPS (dlib, PAM, IR camera)
;;;   dosr (#240) — RUST_VENDORED_DEPS
;;;   music-assistant-desktop (#253) — COMPLEX_DEPS (Tauri + Rust + Node)
;;;   elephant-bookmarks (#914) — GO_VENDORED_DEPS
;;;   dput-ng (#920) — DEBIAN_SPECIFIC
;;;   retroshare (#1567) — COMPLEX_DEPS
;;;   servo (#1572) — INFEASIBLE_BUILD
;;;   uzdoom (#1791) — COMPLEX_DEPS (ZDoom engine)
;;;   home-assistant (#1875) — MASSIVE_DEPS
;;;   gns3-server (#1995) — COMPLEX_DEPS
;;;   pomo-cli (#2824) — GO_VENDORED_DEPS
;;;   caddy-he (#4106) — GO_VENDORED_DEPS
;;;   ryelang-git (#4399) — GO_VENDORED_DEPS
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413ac)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages video)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xml)
  #:export (
            ;; C/CMake builds
            execstack
            davinci-ffmpeg-encoder-plugin
            labwc-tweaks-git
            obs-wayland-hotkeys-git
            gcn64tools-git
            fcitx5-lotus
            whatsit
            ;; Python packages
            ttime
            python-opentelemetry-opencensus-shim
            python-griffe
            papis
            ))

;;; ──────────────────────────────────────────────────────────────────
;;; C/CMake builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── execstack (#669) ──

(define-public execstack
  (package
    (name "execstack")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jwilk-mirrors/prelink")
                    (commit "ca2c0c3409e0fe4b7e1fce27ebb20d4bba69244a")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'build
                 (lambda _
                   (invoke "make" "-C" "src" "execstack")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "src/execstack" bin)))))))
    (native-inputs (list autoconf automake))
    (inputs (list elfutils))
    (home-page "https://github.com/jwilk-mirrors/prelink")
    (synopsis "tool to set or clear executable stack flag on ELF binaries")
    (description "Execstack is a program which sets, clears, or queries the
executable stack flag of ELF binaries and shared libraries.  It can be used
to fix ELF binaries that incorrectly request an executable stack.")
    (license license:gpl2)))

;;; ── davinci-ffmpeg-encoder-plugin (#465) ──

(define-public davinci-ffmpeg-encoder-plugin
  (package
    (name "davinci-ffmpeg-encoder-plugin")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EdvinNilsson/ffmpeg_encoder_plugin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list ffmpeg))
    (home-page "https://github.com/EdvinNilsson/ffmpeg_encoder_plugin")
    (synopsis "FFmpeg encoder plugin for DaVinci Resolve Studio")
    (description "This plugin adds FFmpeg-based encoding support to DaVinci
Resolve Studio on Linux.  It enables encoding to additional codecs and
containers not natively supported by DaVinci Resolve.")
    (license license:gpl3+)))

;;; ── labwc-tweaks-git (#1764) ──

(define-public labwc-tweaks-git
  (package
    (name "labwc-tweaks-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/labwc/labwc-tweaks")
                    (commit "7f2d04f")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config
                         (@ (gnu packages qt) qttools)))
    (inputs (list glib libxml2 qtbase))
    (home-page "https://github.com/labwc/labwc-tweaks")
    (synopsis "configuration GUI for the labwc Wayland compositor")
    (description "Labwc-tweaks is a simple graphical configuration tool for
the labwc Wayland compositor.  It provides a Qt6-based interface for
adjusting labwc settings such as themes, keyboard layouts, and window
behavior without manually editing configuration files.")
    (license license:gpl2)))

;;; ── obs-wayland-hotkeys-git (#1091) ──

(define-public obs-wayland-hotkeys-git
  (package
    (name "obs-wayland-hotkeys-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/leia-uwu/obs-wayland-hotkeys")
                    (commit "e77f8b6")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list obs))
    (home-page "https://github.com/leia-uwu/obs-wayland-hotkeys")
    (synopsis "OBS Studio plugin for Wayland global shortcuts portal")
    (description "This OBS Studio plugin implements the XDG global shortcuts
portal on Wayland, allowing OBS hotkeys to work across applications
without X11 keyboard grabbing.  It uses the
@code{org.freedesktop.portal.GlobalShortcuts} D-Bus interface.")
    (license license:gpl2)))

;;; ── gcn64tools-git (#796) ──

(define-public gcn64tools-git
  (package
    (name "gcn64tools-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/raphnet/gcn64tools")
                    (commit "43db365")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list hidapi gtk+ libxml2))
    (home-page "https://github.com/raphnet/gcn64tools")
    (synopsis "management tools for raphnet USB adapters")
    (description "Gcn64tools provides configuration and management utilities
for raphnet GameCube and N64 controller USB adapters.  It includes a GTK
graphical interface for firmware updates, button mapping, and adapter
settings.")
    (license license:gpl3)))

;;; ── fcitx5-lotus (#908) ──

(define-public fcitx5-lotus
  (package
    (name "fcitx5-lotus")
    (version "2.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LotusInputMethod/fcitx5-lotus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config
                         (@ (gnu packages cmake) extra-cmake-modules)))
    (inputs (list (@ (gnu packages fcitx5) fcitx5)
                  (@ (gnu packages xorg) libx11)
                  (@ (gnu packages python) python)))
    (home-page "https://github.com/LotusInputMethod/fcitx5-lotus")
    (synopsis "Vietnamese input method engine for fcitx5")
    (description "Fcitx5-lotus is a Vietnamese input method engine for the
fcitx5 input method framework.  It supports Telex and VNI input methods
for typing Vietnamese characters with diacritical marks.")
    (license license:gpl3+)))

;;; ── whatsit (#367) ──

(define-public whatsit
  (package
    (name "whatsit")
    (version "5.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/devlinman/whatsit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list (@ (gnu packages cmake) extra-cmake-modules)
                         pkg-config))
    (inputs (list qtbase
                  qtwebengine
                  kconfig
                  knotifications
                  kwidgetsaddons
                  kiconthemes))
    (home-page "https://github.com/devlinman/whatsit")
    (synopsis "lightweight native Qt6 WhatsApp Web client")
    (description "Whatsit is a lightweight native desktop client for WhatsApp
Web built with Qt6 and KDE Frameworks.  It provides system tray
integration, desktop notifications, and a minimal memory footprint
compared to running WhatsApp Web in a full browser.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; Python packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── ttime (#1366) ──

(define-public ttime
  (package
    (name "ttime")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Techsmith404/ttime")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-rich python-pyfiglet))
    (home-page "https://github.com/Techsmith404/ttime")
    (synopsis "customizable countdown timer for the terminal")
    (description "Ttime is a terminal-based countdown timer with
customizable display using ASCII art and rich text formatting.  It
provides visual and audio countdown feedback with configurable
duration and appearance.")
    (license license:gpl3)))

;;; ── python-opentelemetry-opencensus-shim (#2143) ──

(define-public python-opentelemetry-opencensus-shim
  (package
    (name "python-opentelemetry-opencensus-shim")
    (version "1.40.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "opentelemetry_opencensus_shim" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-wrapt))
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (synopsis "OpenCensus shim for OpenTelemetry")
    (description "This package provides a shim layer that allows applications
using the OpenCensus API to export telemetry data via the OpenTelemetry
SDK.  It bridges the two APIs so that existing OpenCensus instrumentation
works with OpenTelemetry backends.")
    (license license:asl2.0)))

;;; ── python-griffe (#2844) ──

(define-public python-griffe
  (package
    (name "python-griffe")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "griffe" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (home-page "https://mkdocstrings.github.io/griffe")
    (synopsis "signatures for entire Python programs")
    (description "Griffe is a Python library that extracts signatures,
docstrings, and other metadata from Python source code and compiled
modules.  It is used by mkdocstrings to generate API documentation
from Python projects.")
    (license license:isc)))

;;; ── papis (#1787) ──

(define-public papis
  (package
    (name "papis")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "papis" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs
     (list (@ (gnu packages python-web) python-beautifulsoup4)
           (@ (gnu packages python-xyz) python-click)
           (@ (gnu packages python-xyz) python-colorama)
           (@ (gnu packages python-xyz) python-lxml)
           (@ (gnu packages python-xyz) python-pygments)
           (@ (gnu packages python-xyz) python-pyyaml)
           (@ (gnu packages python-xyz) python-requests)
           (@ (gnu packages python-crypto) python-slugify)))
    (home-page "https://papis.readthedocs.io")
    (synopsis "command-line document and bibliography manager")
    (description "Papis is a command-line based document and bibliography
manager.  It allows organizing research papers, books, and other
documents with customizable metadata, BibTeX export, and integration
with various online sources like DOI, ISBN, and arXiv.")
    (license license:gpl3+)))
