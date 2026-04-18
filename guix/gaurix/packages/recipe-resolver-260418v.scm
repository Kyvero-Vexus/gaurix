;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418v
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (4):
;;;     1.  woodland (gnu-build-system, v2.1.0, gpl2+)
;;;     2.  minutor (gnu-build-system/qmake, v2.21.0, bsd-2)
;;;     3.  python-certomancer (pyproject-build-system, v0.14.0, expat)
;;;     4.  mii-emu (gnu-build-system, v1.97, expat)
;;;
;;; BLOCKED EXHAUSTED (26):
;;;     5.  gamescope-session-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DEP_BLOCKED:
;;;         session files for gamescope; gamescope itself not in Guix;
;;;         A1: copy-build-system works but result non-functional without gamescope;
;;;         A2: packaging gamescope requires Mesa/Vulkan/X11/wlroots pipeline work;
;;;         A3: session scripts only useful with gamescope installed
;;;     6.  falcond -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ZIG_UNSUPPORTED:
;;;         gaming performance daemon built with Zig compiler;
;;;         A1: Zig compiler not available in Guix;
;;;         A2: no C/Makefile build alternative in upstream;
;;;         A3: Zig cross-compilation model incompatible with Guix build stratum
;;;     7.  kx-aspe-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS:
;;;         Keyoxide ASPE CLI tool in Rust;
;;;         A1: cargo-build-system requires individual crate packaging;
;;;         A2: depends on openssl + clap + serde crate trees (~40 transitive);
;;;         A3: guix import crate produces incomplete dep chain
;;;     8.  contextpilot-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS:
;;;         Git blame analyzer and code indexer in Rust;
;;;         A1: cargo dep tree includes tokio, clap, serde (~50 crates);
;;;         A2: guix import crate only handles direct deps;
;;;         A3: no prebuilt binary releases available
;;;     9.  codanna -> NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS:
;;;         code assistant tool in Rust;
;;;         A1: requires openssl + ~30 crates;
;;;         A2: guix import crate leaves transitive deps unresolved;
;;;         A3: niche tool (1 AUR vote), low packaging priority
;;;    10.  streampager -> NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS:
;;;         terminal pager in Rust;
;;;         A1: depends on crossterm, tokio, serde (~40 crates);
;;;         A2: guix import crate incomplete;
;;;         A3: existing alternatives (less, most) available in Guix
;;;    11.  mbtiles -> NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS:
;;;         vector tile set tool in Rust;
;;;         A1: cargo dep tree includes actix, tokio, serde (~60 crates);
;;;         A2: also requires npm for part of the build;
;;;         A3: dual build system (Rust + Node) compounds complexity
;;;    12.  sqlite-dist -> NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS:
;;;         SQLite extension distribution tool in Rust;
;;;         A1: cargo deps include zstd, bzip2, clap (~30 crates);
;;;         A2: guix import crate leaves gaps;
;;;         A3: alpha-quality software (v0.0.1-alpha)
;;;    13.  sequoia-octopus-librnp -> NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS:
;;;         Sequoia PGP backend for Thunderbird in Rust;
;;;         A1: massive cargo dep tree (sequoia-openpgp alone ~80 crates);
;;;         A2: requires Thunderbird for integration testing;
;;;         A3: clang needed for C FFI bindings compilation
;;;    14.  halloy-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS:
;;;         IRC client with Iced GUI in Rust;
;;;         A1: Iced GUI framework requires ~100 crates;
;;;         A2: GPU rendering deps (wgpu/vulkan) add complexity;
;;;         A3: guix import crate cannot handle this scale
;;;    15.  airshipper -> NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS:
;;;         Veloren game launcher in Rust;
;;;         A1: GUI app with reqwest, tokio, iced (~80 crates);
;;;         A2: no prebuilt static binary for Linux;
;;;         A3: Veloren itself not in Guix, launcher alone not useful
;;;    16.  twitter-media-downloader-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: LICENSE_UNCLEAR:
;;;         Twitter media downloader in Go;
;;;         A1: no LICENSE file in repository, license field empty in AUR;
;;;         A2: Go module deps need individual packaging;
;;;         A3: redistribution rights uncertain without explicit license
;;;    17.  nvm-fish -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ECOSYSTEM_MISMATCH:
;;;         Fish shell wrapper for Node Version Manager;
;;;         A1: depends on nvm which is not in Guix;
;;;         A2: nvm's shell-level version switching conflicts with Guix profile model;
;;;         A3: Guix manages Node.js versions via packages/manifests, nvm unnecessary
;;;    18.  remmina-plugin-teamviewer -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_DEP:
;;;         Remmina plugin for TeamViewer connections;
;;;         A1: requires TeamViewer (proprietary) at runtime;
;;;         A2: plugin is GPL but non-functional without proprietary dep;
;;;         A3: Remmina already supports VNC/RDP/SSH natively
;;;    19.  golden-cheetah-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: EXTREME_DEPS:
;;;         fitness analysis app requiring 12+ Qt6 modules;
;;;         A1: needs Qt6 WebEngine (massive Chromium-based dep);
;;;         A2: requires SIP Python bindings + Qt6 Charts/Sensors/Serial;
;;;         A3: 13 makedeps including bison, flex, clang; impractical for batch
;;;    20.  hmcl-dev -> NEEDS_RECIPE_DESIGN_EXHAUSTED: GRADLE_COMPLEX:
;;;         Java Minecraft launcher using Gradle build system;
;;;         A1: Guix lacks Gradle build system support;
;;;         A2: Gradle downloads deps at build time (incompatible with sandbox);
;;;         A3: requires JDK 21 + specific Gradle version pinning
;;;    21.  omniorbpy -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DEP_MISSING:
;;;         Python bindings for omniORB CORBA broker;
;;;         A1: omniorb (C++ CORBA implementation) not in Guix;
;;;         A2: packaging omniorb itself requires significant effort;
;;;         A3: CORBA is legacy technology with minimal demand
;;;    22.  ibus-lotus -> NEEDS_RECIPE_DESIGN_EXHAUSTED: GO_MODULE_DEPS:
;;;         Vietnamese input method engine for IBus, written in Go;
;;;         A1: Go module deps (gotk3, dbus, ibus bindings) need packaging;
;;;         A2: CGO bridges to GTK3/X11 complicate go-build-system usage;
;;;         A3: ibus-bamboo (upstream of this fork) also not in Guix
;;;    23.  terraform-local -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PYTHON_DEPS_MISSING:
;;;         thin wrapper for running Terraform against LocalStack;
;;;         A1: needs python-localstack-client (not in Guix);
;;;         A2: needs python-hcl2 (not in Guix);
;;;         A3: LocalStack itself not in Guix, tool non-functional without it
;;;    24.  galaxy-flasher -> NEEDS_RECIPE_DESIGN_EXHAUSTED: RUNTIME_DEPS_MISSING:
;;;         Samsung device flashing GUI in Python/GTK4;
;;;         A1: needs odin4-cli or thor-flash-utility (neither in Guix);
;;;         A2: needs python-i18n, python-langcodes, python-language-data;
;;;         A3: Samsung device flashing is niche, runtime deps unavailable
;;;    25.  git-gl -> NEEDS_RECIPE_DESIGN_EXHAUSTED: IMPRACTICAL_FORK:
;;;         GitLab's fork of Git with vendor patches;
;;;         A1: Guix already has git; maintaining a separate fork is impractical;
;;;         A2: GitLab-specific patches mostly for GitLab server, not end users;
;;;         A3: git-gl rapidly diverges, version tracking burden high
;;;    26.  hypr-dock -> NEEDS_RECIPE_DESIGN_EXHAUSTED: GO_MODULE_DEPS:
;;;         dock panel for Hyprland in Go with GTK3;
;;;         A1: Go module deps (gotk3, go-gtk-layer-shell) need packaging;
;;;         A2: CGO + GTK layer shell bridge requires careful build flags;
;;;         A3: go-build-system + GTK3 CGO not well tested in Guix
;;;    27.  diskm8 -> NEEDS_RECIPE_DESIGN_EXHAUSTED: GO_MODULE_DEPS:
;;;         Apple II disk image tool in Go;
;;;         A1: Go module deps need individual packaging;
;;;         A2: niche tool (1 AUR vote) for retro computing;
;;;         A3: no prebuilt binaries available
;;;    28.  gprofng-gui -> NEEDS_RECIPE_DESIGN_EXHAUSTED: JAVA_BUILD_COMPLEX:
;;;         GNU profiling GUI using autotools + Java/Ant;
;;;         A1: configure.ac invokes ant/javac for Java compilation;
;;;         A2: Java classpath management complex in Guix build stratum;
;;;         A3: requires gprofng (part of binutils) built with specific options
;;;    29.  musique111-qt5 -> NEEDS_RECIPE_DESIGN_EXHAUSTED: GIT_SUBMODULES:
;;;         Qt5 music player with 8 git submodules;
;;;         A1: depends on 8 submodules (http, idle, media, updater, js,
;;;         sharedcache, SingleApplication, qt-reusable-widgets);
;;;         A2: each submodule would need separate packaging or recursive fetch;
;;;         A3: recursive git-fetch not reliable for qmake subproject integration
;;;    30.  python-pjproject -> NEEDS_RECIPE_DESIGN_EXHAUSTED: BUILD_INTEGRATION:
;;;         Python bindings for pjproject SIP stack;
;;;         A1: bindings built as part of pjproject source tree, not standalone;
;;;         A2: SWIG code generation needs pjproject headers at exact version;
;;;         A3: Guix pjproject (2.15.1) vs AUR (2.16) version mismatch
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418v)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages stb)
  #:use-module (gnu packages time)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (woodland
            minutor
            python-certomancer
            mii-emu))

;;; -------------------------------------------------------------------
;;; 1. woodland --- minimal Wayland compositor based on wlroots
;;; From https://github.com/DiogenesN/woodland; custom configure + make.
;;; -------------------------------------------------------------------
(define-public woodland
  (package
    (name "woodland")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/DiogenesN/woodland")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))
              (snippet
               '(substitute* "Makefile.in"
                  (("-march=native ") "")))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ; no test suite
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" #$(cc-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda _
                   ;; Custom configure script just checks for dependencies
                   ;; and copies Makefile.in to Makefile.
                   (invoke "./configure"))))))
    (native-inputs (list pkg-config wayland-protocols))
    (inputs (list cairo
                  dbus
                  gdk-pixbuf
                  glib
                  libdrm
                  libinput
                  librsvg
                  libxkbcommon
                  pixman
                  stb
                  wayland
                  wlroots-0.18))
    (home-page "https://github.com/DiogenesN/woodland")
    (synopsis "Minimal Wayland compositor based on wlroots")
    (description
     "Woodland is a minimal Wayland compositor built on wlroots.  It
provides basic window management with support for layer shell, XDG shell,
a panel, application launcher, window list, and network management via
D-Bus.  Configuration is done through a simple configuration file.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 2. minutor --- minimalistic Minecraft map viewer
;;; From https://github.com/mrkite/minutor; Qt5 qmake project.
;;; -------------------------------------------------------------------
(define-public minutor
  (package
    (name "minutor")
    (version "2.21.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mrkite/minutor")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ; no test suite
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "qmake"
                           (string-append "PREFIX="
                                          (assoc-ref outputs "out"))
                           "minutor.pro")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share")))
                     (install-file "minutor" bin)
                     (install-file "minutor.desktop"
                                   (string-append share
                                                  "/applications"))
                     (install-file "minutor.png"
                                   (string-append share
                                                  "/pixmaps"))))))))
    (inputs (list qtbase-5 zlib))
    (home-page "https://seancode.com/minutor/")
    (synopsis "Minimalistic map viewer for Minecraft worlds")
    (description
     "Minutor is a minimalistic map viewer for Minecraft.  It renders
an overhead view of Minecraft worlds, supports all biomes and block types,
and can generate high-resolution map images.  It includes a search feature
for locating specific blocks and structures.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 3. python-certomancer --- PKI testing tool
;;; From PyPI / https://github.com/MatthiasValvekens/certomancer;
;;; pyproject-build-system.
;;; -------------------------------------------------------------------
(define-public python-certomancer
  (package
    (name "python-certomancer")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "certomancer" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ; test dependencies not available
    (propagated-inputs (list python-asn1crypto
                             python-click
                             python-cryptography
                             python-dateutil
                             python-pyyaml
                             python-tzlocal))
    (native-inputs (list python-setuptools
                         python-setuptools-scm))
    (home-page "https://github.com/MatthiasValvekens/certomancer")
    (synopsis "Construct and mock PKI test configurations declaratively")
    (description
     "Certomancer is a Python tool for quickly constructing, mocking, and
deploying PKI test configurations using simple declarative config files.
It can generate certificates, CRLs, OCSP responses, and time stamp tokens
for testing purposes.  Supports X.509, CMS, and various PKI protocols.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. mii-emu --- Apple //e emulator for Linux
;;; From https://github.com/buserror/mii_emu; custom Makefile.
;;; -------------------------------------------------------------------
(define-public mii-emu
  (package
    (name "mii-emu")
    (version "1.97")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/buserror/mii_emu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))
              (snippet
               '(substitute* "Makefile"
                  (("-march=native") "")
                  (("-B/usr/libexec/mold") "")))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ; no test suite
           #:make-flags
           #~(list (string-append "DESTDIR=" #$output)
                   (string-append "CC=" #$(cc-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))  ; no configure script
    (native-inputs (list pkg-config))
    (inputs (list alsa-lib
                  glu
                  libx11
                  mesa
                  pixman))
    (home-page "https://github.com/buserror/mii_emu")
    (synopsis "Apple //e emulator for Linux with OpenGL display")
    (description
     "MII is an Apple //e emulator for Linux.  It emulates the Apple //e
hardware including the 65C02 CPU, disk drives, and various expansion cards.
The display uses OpenGL for rendering.  MII aims for high compatibility
with Apple //e software and supports both 5.25-inch and 3.5-inch disk
image formats.")
    (license license:expat)))
