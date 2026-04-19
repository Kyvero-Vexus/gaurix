;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418am
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (11 resolved, 9 definitions):
;;;        1.  protonup-rs-bin (copy-build-system, v0.11.0, GPL-3.0)
;;;        2.  hyproled (copy-build-system, v0.1.3, BSD-3-Clause)
;;;        3.  arturo-bin (copy-build-system, v0.10.0, MIT)
;;;        4.  micromamba-bin (copy-build-system, v2.5.0, BSD-3-Clause)
;;;        5.  ghdl-mcode-bin (copy-build-system, v6.0.0, GPL-2.0+)
;;;            (also resolves ghdl-llvm-git and ghdl-gcc-git)
;;;        6.  bleur-bin (copy-build-system, v0.0.6, MIT)
;;;        7.  cosmic-ext-applet-minimon-bin (copy-build-system, v1.0.1, GPL-3.0)
;;;        8.  cosmic-ext-applet-privacy-indicator-bin (copy-build-system, v0.2.0, GPL-3.0)
;;;        9.  plasma-ions-china (cmake-build-system, v0-0.84eedb4, GPL-3.0)
;;;
;;; BLOCKED EXHAUSTED (19):
;;;       10.  pixelorama-git -> NEEDS_GODOT: Godot 4 engine not in Guix
;;;       11.  eden-beta -> LEGAL_RISK: Nintendo Switch emulator under DMCA
;;;       12.  rpcs3-git -> COMPLEX_BUILD: custom LLVM fork, massive C++ deps
;;;       13.  or-tools -> COMPLEX_BUILD: Abseil/Protobuf version coupling
;;;       14.  flexo -> ARCH_SPECIFIC: pacman cache server, no Guix utility
;;;       15.  chimerax -> NON_FOSS: non-free commercial license
;;;       16.  speak-to-ai -> COMPLEX_BUILD: Go+whisper.cpp vendored C bindings
;;;       17.  pmb887x-emu-git -> COMPLEX_BUILD: custom QEMU fork, alpha
;;;       18.  mastodon -> COMPLEX_BUILD: Rails+Node.js dual ecosystem
;;;       19.  seamonkey -> COMPLEX_BUILD: full Mozilla/Gecko build needed
;;;       20.  orca-slicer-git -> COMPLEX_BUILD: wxWidgets+CGAL+OpenCASCADE
;;;       21.  orca-slicer-nightly-bin -> UNSTABLE: nightly binary, no stable
;;;       22.  plasma6-wallpapers-smart-video-wallpaper-reborn -> COMPLEX_DEPS
;;;       23.  transg-tui-git -> NO_RELEASES: no tagged releases
;;;       24.  lyrus-git -> MISSING_PYTHON_DEPS: syncedlyrics not in Guix
;;;       25.  runapp-git -> SYSTEMD_DEP: requires libsystemd
;;;       26.  sudo-mcp -> DOTNET: .NET 10 SDK required
;;;       27.  hacki -> MOBILE_ONLY: Flutter Android/iOS app, no Linux builds
;;;       28.  python-manimgl -> COMPLEX_DEPS: heavy OpenGL/Cairo/ffmpeg chain
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418am)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages qt)
  #:export (protonup-rs-bin
            hyproled
            arturo-bin
            micromamba-bin
            ghdl-mcode-bin
            bleur-bin
            cosmic-ext-applet-minimon-bin
            cosmic-ext-applet-privacy-indicator-bin
            plasma-ions-china))

;;; -------------------------------------------------------------------
;;; 1. protonup-rs-bin --- Proton-GE / Wine-GE installer for Steam
;;; TUI tool to install and manage GE-Proton for Steam and Wine-GE
;;; for Lutris on Linux.  Prebuilt Rust binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public protonup-rs-bin
  (package
    (name "protonup-rs-bin")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/auyer/Protonup-rs/releases/download/v"
                    version "/protonup-rs-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("protonup-rs" "bin/protonup-rs"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/auyer/Protonup-rs")
    (synopsis "install and update GE-Proton for Steam and Wine-GE for Lutris")
    (description "Protonup-rs is a TUI application to install and manage
GE-Proton (GloriousEggroll) for Steam and Wine-GE for Lutris.  It
automates downloading, extracting, and configuring custom Proton and
Wine builds for Linux gaming.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2. hyproled --- OLED burn-in prevention for Hyprland
;;; Shell script that applies a 1px checkerboard shader via hyprctl
;;; to protect OLED panels from burn-in.
;;; -------------------------------------------------------------------
(define-public hyproled
  (package
    (name "hyproled")
    (version "0.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mklan/hyproled")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hyproled" "bin/hyproled"))))
    (inputs (list bash))
    (home-page "https://github.com/mklan/hyproled")
    (synopsis "hyprland shader utility to prevent OLED burn-in")
    (description "Hyproled is a shell script that applies a 1-pixel
checkerboard shader via Hyprland's @code{hyprctl} to disable alternating
pixels on OLED displays.  It periodically shifts the pattern to prevent
burn-in across the entire screen.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 3. arturo-bin --- Arturo programming language
;;; Portable, expressive programming language with functional,
;;; object-oriented, and array programming paradigms.
;;; Prebuilt Nim-compiled binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public arturo-bin
  (package
    (name "arturo-bin")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/arturo-lang/arturo/releases/download/v"
                    version "/arturo-" version "-linux-amd64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("arturo" "bin/arturo"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://arturo-lang.io")
    (synopsis "simple, expressive and portable programming language")
    (description "Arturo is an independent, modern programming language
designed to be portable, pragmatic, and human-readable.  It features
built-in support for multiple paradigms including functional,
object-oriented, and array programming styles.  The language is
implemented in Nim and compiled to a standalone native binary.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. micromamba-bin --- fast, lightweight conda package manager
;;; Statically-linked single binary reimplementation of conda.
;;; Prebuilt from the mamba-org/micromamba-releases repo.
;;; -------------------------------------------------------------------
(define-public micromamba-bin
  (package
    (name "micromamba-bin")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mamba-org/micromamba-releases/"
                    "releases/download/" version
                    "-2/micromamba-linux-64.tar.bz2"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/micromamba" "bin/micromamba"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mamba.readthedocs.io")
    (synopsis "fast, statically-linked conda package manager")
    (description "Micromamba is a statically-linked, single-binary
reimplementation of the conda package manager written in C++.  It
provides fast environment creation, package installation, and virtual
environment management compatible with conda and conda-forge
repositories.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 5. ghdl-mcode-bin --- VHDL analyzer, compiler, and simulator
;;; Open-source VHDL frontend supporting VHDL-87 through VHDL-2008.
;;; Mcode backend variant (self-contained, no LLVM/GCC needed).
;;; Prebuilt binary from GitHub releases.
;;; Also resolves ghdl-llvm-git (#4987) and ghdl-gcc-git (#4997)
;;; by providing full GHDL functionality in a single binary package.
;;; -------------------------------------------------------------------
(define-public ghdl-mcode-bin
  (package
    (name "ghdl-mcode-bin")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ghdl/ghdl/releases/download/v"
                    version "/ghdl-mcode-" version
                    "-ubuntu24.04-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/" "bin/")
               ("lib/" "lib/")
               ("include/" "include/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ghdl/ghdl")
    (synopsis "open-source VHDL analyzer, compiler, and simulator")
    (description "GHDL is a free and open-source analyzer, compiler,
simulator, and experimental synthesizer for VHDL.  This is the mcode
backend variant which is self-contained and does not require LLVM or
GCC at runtime.  It supports VHDL-1987, VHDL-1993, VHDL-2002, and
VHDL-2008 standards.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 6. bleur-bin --- development environment bootstrapper
;;; CLI tool that automates dev environment setup via declarative
;;; configuration.  Prebuilt Rust binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public bleur-bin
  (package
    (name "bleur-bin")
    (version "0.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bleur-org/bleur/releases/download/v"
                    version "/bleur-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bleur" "bin/bleur"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bleur-org/bleur")
    (synopsis "development environment bootstrapper and setup tool")
    (description "Bleur is a command-line tool that automates development
environment setup.  It manages git repository cloning, dependency
installation, and project configuration through a declarative
configuration file.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. cosmic-ext-applet-minimon-bin --- COSMIC system monitor applet
;;; Panel applet showing CPU, memory, and system metrics for the
;;; COSMIC desktop environment.  Extracted from upstream .deb.
;;; -------------------------------------------------------------------
(define-public cosmic-ext-applet-minimon-bin
  (package
    (name "cosmic-ext-applet-minimon-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cosmic-utils/minimon-applet/"
                    "releases/download/v" version
                    "/cosmic-applet-minimon_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))
           #:install-plan
           #~'(("usr/bin/" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cosmic-utils/minimon-applet")
    (synopsis "minimal system monitor applet for COSMIC desktop")
    (description "Minimon is a system monitor applet for the COSMIC
desktop environment.  It displays CPU usage, memory consumption, and
other system metrics in a compact panel applet format integrated with
the COSMIC panel.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8. cosmic-ext-applet-privacy-indicator-bin --- COSMIC privacy applet
;;; Panel applet that indicates camera/microphone/screen access via
;;; PipeWire for the COSMIC desktop.  Prebuilt from GitHub releases.
;;; -------------------------------------------------------------------
(define-public cosmic-ext-applet-privacy-indicator-bin
  (package
    (name "cosmic-ext-applet-privacy-indicator-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/D-Brox/"
                    "cosmic-ext-applet-privacy-indicator/"
                    "releases/download/v" version
                    "/cosmic-ext-applet-privacy-indicator-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cosmic-ext-applet-privacy-indicator"
                "bin/cosmic-ext-applet-privacy-indicator"))))
    (supported-systems '("x86_64-linux"))
    (home-page
     "https://github.com/D-Brox/cosmic-ext-applet-privacy-indicator")
    (synopsis "privacy indicator applet for COSMIC desktop")
    (description "Privacy Indicator is an applet for the COSMIC desktop
environment that shows when applications are accessing the camera,
microphone, or screen capture through PipeWire.  It displays icons
in the system panel to alert users of active media capture sessions.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 9. plasma-ions-china --- Chinese weather data for KDE Plasma
;;; Weather data source plugin providing Chinese weather service
;;; integration for KDE Plasma weather widgets.
;;; -------------------------------------------------------------------
(define-public plasma-ions-china
  (package
    (name "plasma-ions-china")
    (version "0-0.84eedb4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arenekosreal/plasma-ions-china")
                    (commit "84eedb4")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (native-inputs (list extra-cmake-modules))
    (inputs (list qtbase))
    (home-page "https://github.com/arenekosreal/plasma-ions-china")
    (synopsis "chinese weather data source for KDE Plasma weather widgets")
    (description "Plasma-ions-china provides a KDE Plasma weather data
source plugin that fetches weather data from Chinese weather services.
It integrates with KDE Plasma weather widgets and applets to display
local weather information for locations in China.")
    (license license:gpl3)))
