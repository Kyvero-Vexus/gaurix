;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418q
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (8):
;;;     1.  osspd (cmake-build-system, v1.3.3, gpl2)
;;;     2.  termora-bin (copy-build-system, v1.0.17, agpl3)
;;;     3.  fakturama (copy-build-system, v2.1.3c, epl1.0)
;;;     4.  sonarr-bin (copy-build-system, v4.0.17.2952, gpl3)
;;;     5.  silverbullet-bin (copy-build-system, v2.6.1, expat)
;;;     6.  electron30-bin (copy-build-system, v30.5.1, expat)
;;;     7.  sourcegit-bin (copy-build-system, v2026.08, expat)
;;;     8.  libcryptui (gnu-build-system, v3.12.2, lgpl2.0+)
;;;
;;; BLOCKED EXHAUSTED (22):
;;;     9.  mxw-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: CARGO_DEPS:
;;;         Rust CLI for Glorious mice; 10+ crate deps (hidapi, clap, colored, strum);
;;;         A1: cargo vendoring requires full crate enumeration; A2: hidapi Rust bindings
;;;         need system hidapi-dev; A3: no binary releases available
;;;    10.  stardust-xr-magnetar -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_ECOSYSTEM:
;;;         StardustXR panel manager; needs stardust-xr-fusion + stardust-xr-molecules
;;;         crates (git deps, not on crates.io);
;;;         A1: fusion crate only available as git dep; A2: StardustXR server not in Guix;
;;;         A3: entire StardustXR stack (~5 packages) must be packaged first
;;;    11.  stardust-xr-telescope -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_ECOSYSTEM:
;;;         same StardustXR crate ecosystem blocker as magnetar
;;;    12.  stardust-xr-atmosphere -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_ECOSYSTEM:
;;;         same StardustXR crate ecosystem blocker as magnetar
;;;    13.  stardust-xr-comet -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_ECOSYSTEM:
;;;         same StardustXR crate ecosystem blocker as magnetar
;;;    14.  nucleus-cli -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ORPHANED_NO_RELEASES:
;;;         orphaned on AUR (no maintainer), 5 GitHub stars, no releases/tags;
;;;         A1: requires bleeding-edge Go 1.25.4; A2: pre-release hobby project;
;;;         A3: orphaned with no downstream users
;;;    15.  zelbar -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ZIG_BUILD:
;;;         Wayland statusbar written in Zig 0.15; Guix lacks zig-build-system;
;;;         A1: no zig compiler in Guix; A2: no tagged releases; A3: no binary available
;;;    16.  heidisql-qt6-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PASCAL_LAZARUS:
;;;         HeidiSQL is built with Free Pascal + Lazarus IDE (not Qt6 as name suggests);
;;;         A1: fpc (Free Pascal Compiler) not in Guix; A2: Lazarus IDE not in Guix;
;;;         A3: binary .deb available but needs qt6pas bindings (also not in Guix)
;;;    17.  project-monalisa -> NEEDS_RECIPE_DESIGN_EXHAUSTED: HEAVY_DEPS:
;;;         Python wrapper orchestrating wireshark-qt, firefox, gnome-terminal, termshark,
;;;         proxychains; A1: termshark not in Guix; A2: proxychains not in Guix;
;;;         A3: low-value thin wrapper (5 stars, 2 contributors)
;;;    18.  chordpro-cli -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PERL_DEEP_DEPS:
;;;         Perl app with 15+ CPAN modules not in Guix (perl-object-pad, perl-javascript-quickjs,
;;;         perl-text-layout, perl-file-loadlines, perl-harfbuzz-shaper);
;;;         A1: each missing Perl module has its own dep chain; A2: perl-javascript-quickjs
;;;         wraps QuickJS engine; A3: estimated 25+ packages to add
;;;    19.  blue-recorder-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: NO_RELEASES + CARGO_DEPS:
;;;         Rust/GTK4 screen recorder with no tagged releases despite active development;
;;;         A1: no stable version to pin; A2: 18+ crate deps with clang build requirement;
;;;         A3: only available via Flatpak, no standalone binary
;;;    20.  powerupp-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ABANDONED + MISSING_DEP:
;;;         AMD GPU power TUI; no releases since 2020; needs upliftpowerplay (not in Guix);
;;;         A1: upliftpowerplay is separate AMD tool needing packaging first;
;;;         A2: project appears abandoned (last commit 2020); A3: AMD-specific utility
;;;    21.  wleave -> NEEDS_RECIPE_DESIGN_EXHAUSTED: CARGO_GTK4_DEPS:
;;;         Rust Wayland logout dialog; needs gtk4-layer-shell (not confirmed in Guix);
;;;         A1: gtk4-layer-shell Rust bindings require C library; A2: 20+ crate deps need
;;;         vendoring; A3: alternative wlogout already packaged in some channels
;;;    22.  zmkbatx -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEP:
;;;         Qt6/C++ BLE battery monitor; needs SimpleBluez C++ library not in Guix;
;;;         A1: SimpleBluez must be packaged first; A2: Qt6 Bluetooth (qt6-connectivity)
;;;         not confirmed in Guix; A3: binary has bundled deps but is not self-contained
;;;    23.  mow-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: CARGO_DEPS:
;;;         Rust CLI for Glorious Model O Wireless mouse; same hidapi/USB crate chain as mxw-git;
;;;         A1: hidapi Rust bindings need system hidapi; A2: 10+ crate deps;
;;;         A3: no binary releases, niche hardware tool
;;;    24.  kumono-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCHIVED + CARGO_DEPS:
;;;         media ripper (coomer/kemono); repository archived (read-only);
;;;         A1: archived means no future updates/fixes; A2: 17+ direct crate deps (reqwest,
;;;         tokio, serde, etc.); A3: ethically questionable content scraping tool
;;;    25.  ps3libraries -> NEEDS_RECIPE_DESIGN_EXHAUSTED: CROSS_TOOLCHAIN:
;;;         PS3 homebrew dev libraries; requires ppu-gcc/spu-gcc cross-compilers;
;;;         A1: PS3 (Cell/PowerPC) cross-toolchain not in Guix; A2: depends on ps3toolchain
;;;         package; A3: niche retro-homebrew development target
;;;    26.  muzi -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ZIG_BUILD:
;;;         Zig-based MPD client; Guix lacks zig-build-system and zig compiler;
;;;         A1: no zig in Guix; A2: depends on libmpdclient via zig package manager;
;;;         A3: no pre-built binary available
;;;    27.  pamac-flatpak -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC:
;;;         Manjaro pamac GUI package manager; depends on libalpm (pacman library);
;;;         A1: libalpm/pacman is Arch-specific; A2: pamac deeply coupled to Arch repos;
;;;         A3: no utility on non-Arch systems
;;;    28.  mistserver -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEP:
;;;         streaming media server; requires librist (RIST protocol library) not in Guix;
;;;         A1: librist must be packaged first; A2: MistServer also needs mbedtls variant;
;;;         A3: complex build with optional codecs
;;;    29.  ghdl-yosys-plugin-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEP_CHAIN:
;;;         VHDL synthesis Yosys plugin; requires GHDL (VHDL simulator) not in Guix;
;;;         A1: GHDL needs GNAT (Ada compiler) not bootstrapped in Guix;
;;;         A2: plugin must match exact GHDL+Yosys ABI; A3: deep Ada toolchain dependency
;;;    30.  waydroid-dinit -> NEEDS_RECIPE_DESIGN_EXHAUSTED: INIT_SPECIFIC:
;;;         Dinit service files for Waydroid; Guix uses GNU Shepherd, not Dinit;
;;;         A1: Dinit init system not in Guix; A2: Waydroid integration uses Shepherd services
;;;         on Guix; A3: no utility outside Dinit-based distros
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418q)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages dbm)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xml)
  #:export (
            osspd
            termora-bin
            fakturama
            sonarr-bin
            silverbullet-bin
            electron30-bin
            sourcegit-bin
            libcryptui))

;;; -------------------------------------------------------------------
;;; 1. osspd --- OSS Proxy Daemon (OSS emulation via CUSE/PulseAudio)
;;; CMake C project from OpenMandriva, all deps available in Guix.
;;; -------------------------------------------------------------------
(define-public osspd
  (package
    (name "osspd")
    (version "1.3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenMandrivaSoftware/ossp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list alsa-lib pulseaudio fuse))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/OpenMandrivaSoftware/ossp")
    (synopsis "OSS sound emulation via CUSE and PulseAudio or ALSA")
    (description "OSSP (OSS Proxy) provides /dev/dsp and /dev/mixer emulation
through CUSE (character device in userspace).  It proxies audio to PulseAudio
or ALSA, allowing legacy OSS-only applications to produce sound on modern
Linux systems without kernel-level OSS support.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 2. termora-bin --- cross-platform terminal emulator (binary)
;;; Kotlin/JVM app with bundled runtime; building from source requires
;;; JDK 21 + Gradle bootstrap, impractical for Guix.
;;; -------------------------------------------------------------------
(define-public termora-bin
  (package
    (name "termora-bin")
    (version "1.0.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TermoraDev/termora/releases/download/"
                    version "/termora-" version "-linux-x86-64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/termora/"
           #:exclude ("install.sh" "uninstall.sh")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (termora (string-append out "/share/termora/bin/Termora")))
                (mkdir-p bin)
                (symlink termora (string-append bin "/termora"))))))))
    (home-page "https://github.com/TermoraDev/termora")
    (synopsis "cross-platform terminal emulator with SSH management")
    (description "Termora is a cross-platform terminal emulator built with
Kotlin and Compose Multiplatform.  It supports SSH, local shell, serial port
connections, SFTP file transfer, and key management.  Ships with a bundled
JVM runtime.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 3. fakturama --- open-source invoicing application (binary)
;;; Eclipse RCP Java application; source build requires Maven/Tycho/OSGi
;;; ecosystem which is impractical in Guix.
;;; -------------------------------------------------------------------
(define-public fakturama
  (package
    (name "fakturama")
    (version "2.1.3c")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.fakturama.info/release/v2.1.3/"
                    "Installer_Fakturama_linux_x64_" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fakturama/" #:exclude ("install.sh")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (app (string-append out "/share/fakturama/Fakturama2")))
                (mkdir-p bin)
                (symlink app (string-append bin "/fakturama"))))))))
    (home-page "https://www.fakturama.info")
    (synopsis "invoicing and billing management application")
    (description "Fakturama is an open-source invoicing application for small
businesses and freelancers.  It manages contacts, products, invoices, delivery
notes, and credit memos.  Built on Eclipse RCP with a bundled Java runtime,
it provides offline invoice creation with PDF export and various templates.")
    (license license:epl1.0)))

;;; -------------------------------------------------------------------
;;; 4. sonarr-bin --- TV series download automation (binary)
;;; .NET/ASP.NET self-contained binary; .NET SDK not available in Guix.
;;; -------------------------------------------------------------------
(define-public sonarr-bin
  (package
    (name "sonarr-bin")
    (version "4.0.17.2952")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Sonarr/Sonarr/releases/download/v"
                    version "/Sonarr.main." version ".linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("Sonarr" "share/sonarr/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (sonarr (string-append out "/share/sonarr/Sonarr")))
                (mkdir-p bin)
                (symlink sonarr (string-append bin "/sonarr"))))))))
    (home-page "https://sonarr.tv")
    (synopsis "automatic TV series download and management")
    (description "Sonarr is a PVR for Usenet and BitTorrent users that
monitors RSS feeds for new episodes of TV series, grabs, sorts, and renames
them automatically.  It provides a web interface for managing shows, quality
profiles, and download clients.  This package provides the self-contained
.NET binary distribution.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5. silverbullet-bin --- personal knowledge management (binary)
;;; Node.js/TypeScript app; source build requires Node >=24.13.0 with
;;; massive npm dependency tree.  Pre-built self-contained binary.
;;; -------------------------------------------------------------------
(define-public silverbullet-bin
  (package
    (name "silverbullet-bin")
    (version "2.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/silverbulletmd/silverbullet/releases/"
                    "download/" version "/silverbullet-server-linux-x86_64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("silverbullet-server" "bin/silverbullet"))))
    (native-inputs (list unzip))
    (home-page "https://silverbullet.md")
    (synopsis "self-hosted markdown-based knowledge management system")
    (description "SilverBullet is an open-source, self-hosted, offline-capable
personal knowledge management system.  It uses Markdown for note storage, with
live code widgets, page templates, metadata queries, and a built-in plug
system.  Runs as a local web server accessed through a browser.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. electron30-bin --- Electron 30 framework (binary)
;;; Used as a runtime dependency by specific Electron-based applications.
;;; Building Electron from source is impractical.
;;; -------------------------------------------------------------------
(define-public electron30-bin
  (package
    (name "electron30-bin")
    (version "30.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/electron/electron/releases/download/v"
                    version "/electron-v" version "-linux-x64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/electron30/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (electron (string-append out "/share/electron30/electron")))
                (mkdir-p bin)
                (symlink electron (string-append bin "/electron30"))))))))
    (native-inputs (list unzip))
    (home-page "https://www.electronjs.org")
    (synopsis "framework for building cross-platform desktop apps with web technology")
    (description "Electron is a framework for building desktop applications
using JavaScript, HTML, and CSS.  It embeds Chromium and Node.js into a single
binary.  This package provides Electron 30 as a pre-built binary runtime
for applications that depend on this specific major version.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. sourcegit-bin --- visual Git client (binary)
;;; .NET application; .NET SDK not available in Guix.  Using the
;;; self-contained AppImage-style release.
;;; -------------------------------------------------------------------
(define-public sourcegit-bin
  (package
    (name "sourcegit-bin")
    (version "2026.08")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sourcegit-scm/sourcegit/releases/"
                    "download/v" version
                    "/sourcegit_" version "-1_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/" "/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (home-page "https://sourcegit-scm.github.io")
    (synopsis "cross-platform visual Git client")
    (description "SourceGit is a free, open-source, cross-platform Git GUI
client.  It provides visual commit history, branch management, diff viewing,
blame, stash, cherry-pick, rebase, and submodule operations with a clean
interface.  Built with .NET and Avalonia UI.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. libcryptui --- GNOME crypto UI library
;;; Archived GNOME project (last release 2014) but still builds with
;;; standard autotools.  Provides GPG key management UI widgets.
;;; -------------------------------------------------------------------
(define-public libcryptui
  (package
    (name "libcryptui")
    (version "3.12.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.gnome.org/sources/libcryptui/"
                    (version-major+minor version)
                    "/libcryptui-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require running GPG agent
    (native-inputs (list pkg-config intltool gobject-introspection))
    (inputs (list gtk+ gpgme gnupg dbus-glib libsm libnotify gcr))
    (home-page "https://gitlab.gnome.org/GNOME/libcryptui")
    (synopsis "GNOME library for GnuPG key management UI widgets")
    (description "Libcryptui is a library originally part of Seahorse that
provides GTK+ widgets for GnuPG encryption key management.  It offers dialogs
for key selection, import, and signing operations.  While archived and no
longer actively developed, it remains a build dependency for some GNOME
applications.")
    (license license:lgpl2.0+)))
