;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415k
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 5 resolved with new recipes; 7 already packaged in prior passes;
;;; 18 re-evaluated with concrete exhaust reasons.
;;;
;;; Recipes (5 new):
;;;   1. tuxmanager (gnu/qmake, v1.0.4, Qt6 task manager, GPL-3.0+)
;;;   2. pardf (pyproject, v1.8.2, Python PDF editor, GPL-3.0+)
;;;   3. jupyterlab-myst (pyproject, v2.4.2, MyST for JupyterLab, BSD-3)
;;;   4. cdesktopenv (gnu, v2.5.3, Common Desktop Environment, LGPL-2.1+)
;;;   5. ytm-player (pyproject, v1.5.6, YouTube Music TUI client, MIT)
;;;
;;; Already packaged (7):
;;;   - xclicker (#7492): recipe in recipe-resolver-260408a.scm
;;;   - android-tv-remote (#3261): recipe in recipe-resolver-260415b.scm
;;;   - dotnet-sdk-8.0-bin (#15164): recipe in deptree-resolver-260415j.scm
;;;   - aspnet-runtime-8.0-bin (#15167): recipe in deptree-resolver-260415j.scm
;;;   - aspnet-targeting-pack-8.0-bin (#15166): recipe in
;;;     deptree-resolver-260415j.scm
;;;   - qbittorrent-enhanced-ua-nox (#13343): recipe in
;;;     recipe-resolver-260414ab.scm; also upstream qbittorrent-enhanced
;;;   - qbittorrent-enhanced-ua (#13344): recipe in
;;;     recipe-resolver-260414ab.scm; also upstream qbittorrent-enhanced
;;;
;;; Exhausted (18):
;;;   - portage-manifest (#13162): ELECTRON_ARCH_SPECIFIC: Electron app
;;;     dependent on pacman/yay (Arch-only); CC-BY-NC license prohibits
;;;     commercial use; A1: needs electron-builder — not in Guix;
;;;     A2: pacman/yay are Arch-only; A3: license non-free
;;;   - simracing-essentials (#13185): KERNEL_MODULE_META: meta-package of
;;;     10+ DKMS kernel modules (hid-fanatecff, new-lg4ff, t150_driver,
;;;     etc.); A1: kernel modules need Guix kernel headers;
;;;     A2: DKMS not in Guix; A3: each module would need individual porting
;;;   - scx-scheds-git (#13199): BPF_KERNEL_SCHED: sched_ext BPF kernel
;;;     schedulers requiring libbpf CO-RE, vmlinux.h, bpftool;
;;;     A1: deep kernel integration not portable; A2: needs BPF CO-RE
;;;     headers from running kernel; A3: kernel version coupling
;;;   - zephyr-sdk (#13214): MASSIVE_CROSS_SDK: 10+ cross-compilation
;;;     toolchains for embedded targets (~1.5GB SDK);
;;;     A1: requires custom toolchain bootstrapping beyond Guix model;
;;;     A2: toolchains for ARM/RISC-V/Xtensa/etc; A3: use Guix
;;;     cross-compilation infrastructure instead
;;;   - xmcl-launcher (#13223): ELECTRON_COMPLEX: Electron/Vite Minecraft
;;;     launcher; A1: 1000+ npm deps; A2: Electron builder not in Guix;
;;;     A3: use PrismLauncher (already in Guix) instead
;;;   - organicmaps (#13304): MASSIVE_NATIVE_BUILD: C++/Qt mobile mapping
;;;     app with 100+ native deps, custom build scripts, bundled
;;;     third-party code; A1: 100+ deps to package; A2: custom Boost
;;;     patches; A3: mobile-first design impractical on desktop
;;;   - penpot (#13305): CLOJURE_MULTI_SERVICE: Clojure backend +
;;;     ClojureScript frontend + Java + npm/pnpm;
;;;     A1: Clojure build system not in Guix; A2: 4+ build ecosystems;
;;;     A3: multi-service architecture (PostgreSQL, Redis, S3)
;;;   - penpot-exporter (#13306): DEPENDS_ON_PENPOT: SVG/PDF exporter
;;;     tightly coupled to penpot core;
;;;     A1: cannot package independently; A2: requires penpot backend;
;;;     A3: shared Clojure codebase with penpot
;;;   - collabora-office (#13314): MASSIVE_LIBREOFFICE_FORK: full
;;;     LibreOffice fork with Collabora Online integration;
;;;     A1: 10M+ LOC fork; A2: hours-long build; A3: use existing
;;;     Guix libreoffice package instead
;;;   - rust-aarch64-musl-git (#13316): RUST_CROSS_TARGET: Rust
;;;     cross-compilation target for aarch64-unknown-linux-musl;
;;;     A1: requires custom rustc bootstrap; A2: Guix handles
;;;     cross-compilation natively; A3: use guix build --target instead
;;;   - rust-aarch64-gnu-git (#13317): RUST_CROSS_TARGET: same as
;;;     rust-aarch64-musl-git but for aarch64-unknown-linux-gnu target;
;;;     A1-A3: same reasoning as #13316
;;;   - lib32-rust-libs-git (#13318): MULTILIB_UNSUPPORTED: 32-bit Rust
;;;     runtime libraries require multilib infrastructure (lib32-glibc,
;;;     lib32-gcc-libs); A1: Guix lacks multilib; A2: use i686 system;
;;;     A3: 32-bit Rust cross-compilation not standardized
;;;   - sulis-git (#13328): COMPLEX_RUST_GAME: Rust tactical RPG with
;;;     custom 2D engine, 200+ vendored crate deps;
;;;     A1: cargo-build-system — 200+ crates individually; A2: no binary
;;;     releases; A3: vendored build blocked by Guix network isolation
;;;   - optimus-manager-git (#13329): ARCH_SYSTEMD_SPECIFIC: Nvidia
;;;     Optimus GPU switching tied to Arch systemd service model;
;;;     A1: mkinitcpio hooks Arch-specific; A2: Xorg driver management
;;;     not portable; A3: use Guix System gpu-switching service
;;;   - calcesara (#13860): WINDOWS_ONLY: proprietary Windows simulation
;;;     software (.exe installer); A1: no native Linux build;
;;;     A2: custom license prohibits redistribution;
;;;     A3: Wine wrapper — still proprietary
;;;   - trae-cn-desktop-bin (#13419): PROPRIETARY: ByteDance proprietary
;;;     AI IDE; A1: custom license — no source; A2: Chinese market only;
;;;     A3: binary Electron app with telemetry
;;;   - librewolf-hellfire (#13553): MOZILLA_BUILD_COMPLEX: full Firefox
;;;     fork; A1: ~40GB source checkout; A2: Rust+Clang+WASI toolchain;
;;;     A3: use Guix icecat package instead
;;;   - penpot-mcp (#13511): DEPENDS_ON_PENPOT: MCP server for penpot;
;;;     A1: requires full penpot stack; A2: Clojure/Java/npm deps;
;;;     A3: cannot function standalone
;;;
;;; All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260415k)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xorg)
  #:export (
            tuxmanager
            pardf
            jupyterlab-myst
            cdesktopenv
            ytm-player
            ))

;;;
;;; --- 1. tuxmanager ---
;;; A Linux task manager alternative built with Qt6.
;;; Uses qmake6 build system.
;;; Upstream: https://github.com/benapetr/TuxManager
;;;

(define-public tuxmanager
  (package
    (name "tuxmanager")
    (version "1.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/benapetr/TuxManager/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "020v42is9bhgg3d7qhr923l8hp2rxcgv0hcdrm4ja169748p4kb3"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                         ;no test suite
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p "build")
                (chdir "build")
                (invoke "qmake6"
                        (string-append "PREFIX=" out)
                        "../src"))))
          (add-after 'install 'install-desktop-file
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (apps (string-append out "/share/applications")))
                (mkdir-p apps)
                (call-with-output-file
                    (string-append apps "/tuxmanager.desktop")
                  (lambda (port)
                    (format port
                            "[Desktop Entry]~%Name=TuxManager~%Exec=tuxmanager~%Type=Application~%Categories=System;Monitor;~%Comment=Linux Task Manager~%")))))))))
    (native-inputs (list qttools))
    (inputs (list qtbase))
    (synopsis "task manager alternative for Linux built with Qt6")
    (description
     "TuxManager is a graphical task manager application for Linux built
with Qt6.  It provides process monitoring, CPU and memory usage
display, and process management functionality as an alternative to
traditional system monitors.")
    (home-page "https://github.com/benapetr/TuxManager")
    (license license:gpl3+)))

;;;
;;; --- 2. pardf ---
;;; Word-Sys PDF editor written in Python with GTK/PyMuPDF.
;;; Upstream: https://github.com/word-sys/pardf
;;;

(define-public pardf
  (package
    (name "pardf")
    (version "1.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/word-sys/pardf/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0bl8if4m3b05wcqmgpjl6k1z66i0j7k41n1nibsna3qf4lvnig2s"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))                  ;no test suite
    (inputs (list python-pygobject
                  python-pymupdf
                  python-numpy
                  gtk+))
    (synopsis "PDF editor built with Python and PyMuPDF")
    (description
     "Pardf is a graphical PDF editor built with Python, GTK, and
PyMuPDF.  It supports viewing, annotating, merging, splitting, and
editing PDF documents with a user-friendly interface.  Features
include page reordering, text extraction, and basic PDF manipulation
operations.")
    (home-page "https://github.com/word-sys/pardf")
    (license license:gpl3+)))

;;;
;;; --- 3. jupyterlab-myst ---
;;; MyST Markdown rendering for JupyterLab.
;;; Python package with hatchling build backend.
;;; Upstream: https://github.com/executablebooks/jupyterlab-myst
;;;

(define-public jupyterlab-myst
  (package
    (name "jupyterlab-myst")
    (version "2.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/executablebooks/jupyterlab-myst"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0klh8pzg5ydh3ilsdpymmvgdr8kd3j7qkc0b9467290sbs7an36m"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))                  ;tests need JupyterLab server
    (native-inputs (list python-hatchling))
    (synopsis "MyST Markdown rendering extension for JupyterLab")
    (description
     "Jupyterlab-myst is a JupyterLab extension that renders MyST
(Markedly Structured Text) Markdown in notebooks.  MyST extends
CommonMark Markdown with roles, directives, cross-references, and
other features from reStructuredText while maintaining readability.
The extension provides real-time rendering of MyST content in
JupyterLab notebooks and markdown files.")
    (home-page "https://github.com/executablebooks/jupyterlab-myst")
    (license license:bsd-3)))

;;;
;;; --- 4. cdesktopenv ---
;;; The Common Desktop Environment (CDE), the classic UNIX desktop.
;;; Autotools build with Motif, X11, and ksh dependencies.
;;; Upstream: https://sourceforge.net/projects/cdesktopenv/
;;;

(define-public cdesktopenv
  (package
    (name "cdesktopenv")
    (version "2.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/project/cdesktopenv"
                    "/src/cde-" version ".tar.gz"))
              (sha256
               (base32
                "0m4qjymc9xbjzhvamk0vm35xix84w8jwv491lgabjsqapy7c0n1b"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                         ;no test suite
      #:configure-flags
      #~(list (string-append "--prefix=" #$output)
              "--with-pam")))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list motif
                  libx11 libxext libxmu libxt libxpm libxft
                  libxinerama libxscrnsaver
                  freetype
                  ncurses
                  linux-pam
                  perl
                  openssl))
    (synopsis "the Common Desktop Environment for UNIX")
    (description
     "CDE (Common Desktop Environment) is the classic UNIX desktop
environment originally developed by a consortium of HP, IBM, Sun, and
USL.  It provides a complete desktop with a window manager (dtwm),
file manager (dtfile), terminal emulator (dtterm), text editor
(dtpad), calendar, mail client, and other productivity tools built on
the Motif widget toolkit.")
    (home-page "https://sourceforge.net/projects/cdesktopenv/")
    (license license:lgpl2.1+)))

;;;
;;; --- 5. ytm-player ---
;;; A TUI YouTube Music client with vim-style navigation.
;;; Python package using mpv for audio playback.
;;; Upstream: https://github.com/peternaame-boop/ytm-player
;;;

(define-public ytm-player
  (package
    (name "ytm-player")
    (version "1.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/peternaame-boop/ytm-player"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1lgjq6r1h4r8ybszi2gl7gfp8zj429ppqc6wqy009siak1bicrin"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))                  ;no test suite
    (inputs (list mpv))                    ;runtime audio backend
    (synopsis "TUI YouTube Music client with vim-style navigation")
    (description
     "ytm-player is a terminal user interface client for YouTube Music
with vim-style keybindings.  It provides music browsing, playlist
management, search, and audio playback through mpv.  Features include
queue management, lyrics display, and keyboard-driven navigation.")
    (home-page "https://github.com/peternaame-boop/ytm-player")
    (license license:expat)))
