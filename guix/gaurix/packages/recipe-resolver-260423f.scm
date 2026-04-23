;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423f
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (12):
;;;        1.  faal (cmake-build-system, v1.0.4.3, MIT)
;;;        2.  atmosim (cmake-build-system, v2.4.1, GPL-3.0+)
;;;        3.  calf-gui (cmake-build-system, v0.90.9, GPL-2.0+/LGPL-2.0+)
;;;        4.  pms-git (go-build-system, v0.42, MIT)
;;;        5.  lux-dl-git (go-build-system, v0.24.1, MIT)
;;;        6.  derper-ipcert (go-build-system, v1.96.4, BSD-3)
;;;        7.  axenc-git (cmake-build-system, v0.1.0, GPL-3.0+)
;;;        8.  qtask-git (cmake-build-system, v0.1, MIT)
;;;        9.  openocd-raspberrypi-git (gnu-build-system, v0.12.0, GPL-2.0+)
;;;       10.  urbackup2-server (gnu-build-system, v2.5.36, GPL-3.0+)
;;;       11.  sql-workbench (copy-build-system, v132, custom:modified-bsd)
;;;       12.  vacuum (go-build-system, v0.26.1, MIT)
;;;
;;; BLOCKED EXHAUSTED (18):
;;;        1.  checkpac -> ARCH_SPECIFIC: depends on pacman/expac (Arch-only tools)
;;;        2.  mkinitcpio-ykfde -> ARCH_SPECIFIC: depends on mkinitcpio (Arch-only)
;;;        3.  mkinitcpio-ykfde-git -> ARCH_SPECIFIC: depends on mkinitcpio (Arch-only)
;;;        4.  n-m3u8dl-re-git -> DOTNET_REQUIRED: .NET SDK 9+ needed; not in Guix
;;;        5.  uptimekit -> NPM_ECOSYSTEM: npm install -g; no native build
;;;        6.  adblock2privoxy -> HASKELL_DEPS_CHAIN: 8+ Haskell packages not in Guix
;;;        7.  nekoray-qt6 -> COMPLEX_DEPS: Qt6 + sing-box Go backend + proxy chain
;;;        8.  raven-reader -> ELECTRON_NPM: Electron/Vue.js with npm dep chain
;;;        9.  vcpkg-git -> COMPLEX_DEPS: C++ package manager with massive bootstrap
;;;       10.  brother-hll2445dw-lpr-bin -> PROPRIETARY_BINARY: closed-source Brother driver
;;;       11.  libisl-git -> UPSTREAM_DELETED: AUR git repo is empty
;;;       12.  github-desktop-plus -> ELECTRON_NPM: Electron app with npm/yarn build
;;;       13.  mingw-w64-minizip-ng -> CROSS_TOOLCHAIN: MinGW cross-compilation target
;;;       14.  brother-dcpt300 -> PROPRIETARY_BINARY: closed-source Brother driver
;;;       15.  python-pyqt5-webengine -> QT_WEBENGINE_COMPLEX: requires building QtWebEngine
;;;       16.  borked3ds -> COMPLEX_DEPS: 51 git submodules; massive C++ build
;;;       17.  grub-git -> ALREADY_IN_GUIX: grub already packaged in upstream Guix
;;;       18.  twitter -> ELECTRON_NPM: depends on libelectron (Arch-specific Electron)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages java)
  #:use-module (gnu packages libftdi)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages music)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:export (
            faal
            atmosim
            calf-gui
            pms-git
            lux-dl-git
            derper-ipcert
            axenc-git
            qtask-git
            openocd-raspberrypi-git
            urbackup2-server
            sql-workbench
            vacuum
            ))

;;; -------------------------------------------------------------------
;;; 1. faal — GTK3 Wayland application menu
;;; -------------------------------------------------------------------
(define-public faal
  (package
    (name "faal")
    (version "1.0.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Polokalap/FAAL/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:build-type "Release"))
    (inputs (list gtk+ gtk-layer-shell glib))
    (native-inputs (list pkg-config))
    (synopsis "simple application menu for Wayland")
    (description
     "FAAL is a simple GTK3 application menu designed for Wayland compositors.
It uses gtk-layer-shell to integrate with Wayland's layer shell protocol,
providing a lightweight menu overlay.")
    (home-page "https://github.com/Polokalap/FAAL")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. atmosim — CLI maxcap calculator for Space Station 14
;;; -------------------------------------------------------------------
(define-public atmosim
  (package
    (name "atmosim")
    (version "2.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ilya246/atmosim")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "atmosim" bin)))))))
    (synopsis "CLI atmospheric simulation calculator for Space Station 14")
    (description
     "Atmosim is a command-line maxcap calculator for Space Station 14.  It
simulates atmospheric conditions to compute maximum capacity values for
in-game gas systems.")
    (home-page "https://github.com/Ilya246/atmosim")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 3. calf-gui — LV2 audio plugin suite with GUI
;;; -------------------------------------------------------------------
(define-public calf-gui
  (package
    (name "calf-gui")
    (version "0.90.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/calf-studio-gear/calf")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DWANT_EXPERIMENTAL=ON")))
    (native-inputs (list pkg-config lv2))
    (inputs (list cairo
                  fluidsynth
                  glib
                  gtk+-2
                  jack-2))
    (synopsis "LV2 plug-in suite and standalone JACK host with GUI")
    (description
     "Calf Studio Gear is a set of audio plug-ins for the LV2 standard and a
standalone JACK host application.  This build enables the graphical user
interface and experimental plug-ins.")
    (home-page "https://calf-studio-gear.org/")
    (license (list license:gpl2+ license:lgpl2.0+))))

;;; -------------------------------------------------------------------
;;; 4. pms-git — Vim-like console MPD client
;;; -------------------------------------------------------------------
(define-public pms-git
  (package
    (name "pms-git")
    (version "0.42")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ambientsound/pms")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/ambientsound/pms"
           #:install-source? #f
           #:tests? #f))
    (synopsis "practical Music Search, a Vim-like MPD client")
    (description
     "PMS (Practical Music Search) is an interactive, Vim-like console client
for the Music Player Daemon (MPD).  It provides keyboard-driven navigation,
searching, and playlist management in a terminal interface.")
    (home-page "https://github.com/ambientsound/pms")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. lux-dl-git — Go video downloader
;;; -------------------------------------------------------------------
(define-public lux-dl-git
  (package
    (name "lux-dl-git")
    (version "0.24.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/iawia002/lux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/iawia002/lux"
           #:install-source? #f
           #:tests? #f))
    (inputs (list ffmpeg))
    (synopsis "fast and simple video download tool written in Go")
    (description
     "Lux is a command-line video download tool written in Go.  It supports
downloading videos from various platforms and provides a simple, fast
interface for fetching media content.")
    (home-page "https://github.com/iawia002/lux")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. derper-ipcert — Tailscale DERP server with IP certificates
;;; -------------------------------------------------------------------
(define-public derper-ipcert
  (package
    (name "derper-ipcert")
    (version "1.96.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tailscale/tailscale/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "tailscale.com/cmd/derper"
           #:unpack-path "tailscale.com"
           #:install-source? #f
           #:tests? #f))
    (inputs (list openssl))
    (synopsis "tailscale DERP relay server with IP-based certificates")
    (description
     "Derper-ipcert is a custom build of the Tailscale DERP (Designated
Encrypted Relay for Packets) server that supports IP-based TLS certificates.
It enables running a self-hosted DERP relay node for Tailscale mesh
networks.")
    (home-page "https://tailscale.com/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 7. axenc-git — Axen language compiler
;;; -------------------------------------------------------------------
(define-public axenc-git
  (package
    (name "axenc-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arsoniv/axenc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list llvm))
    (synopsis "compiler for the Axen programming language")
    (description
     "Axenc is a compiler for the Axen programming language.  It uses LLVM as
its backend for code generation and optimization, providing a foundation for
the Axen language ecosystem.")
    (home-page "https://github.com/arsoniv/axenc")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. qtask-git — Qt5 organizer for Taskwarrior
;;; -------------------------------------------------------------------
(define-public qtask-git
  (package
    (name "qtask-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jubnzv/qtask")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list extra-cmake-modules))
    (inputs (list qtbase-5 taskwarrior))
    (synopsis "Qt5-based organizer front-end for Taskwarrior")
    (description
     "QTask is a graphical organizer built with Qt5 that provides a front-end
for Taskwarrior.  It allows managing tasks, projects, and priorities through
a desktop GUI interface.")
    (home-page "https://github.com/jubnzv/qtask")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. openocd-raspberrypi-git — Raspberry Pi fork of OpenOCD
;;; -------------------------------------------------------------------
(define-public openocd-raspberrypi-git
  (package
    (name "openocd-raspberrypi-git")
    (version "0.12.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/raspberrypi/openocd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "--disable-werror"
                   "--enable-sysfsgpio"
                   "--enable-bcm2835gpio"
                   "--enable-picoprobe"
                   "--enable-cmsis-dap"
                   "--enable-ftdi"
                   "--enable-jlink"
                   "--enable-stlink")))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list libftdi
                  libusb
                  hidapi
                  eudev
                  capstone))
    (synopsis "Raspberry Pi fork of OpenOCD for debugging and programming")
    (description
     "This is the Raspberry Pi foundation's fork of OpenOCD (Open On-Chip
Debugger), providing in-system programming and boundary-scan testing for
embedded target devices.  It includes support for Raspberry Pi-specific
debug probes including Picoprobe and BCM2835 GPIO.")
    (home-page "https://github.com/raspberrypi/openocd")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 10. urbackup2-server — Client-server backup system
;;; -------------------------------------------------------------------
(define-public urbackup2-server
  (package
    (name "urbackup2-server")
    (version "2.5.36")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://hndl.urbackup.org/Server/" version
                    "/urbackup-server-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "--enable-packaging"
                   "--with-mountvhd"
                   "--with-zlib"
                   "--with-libcurl"
                   "--enable-embedded-cryptopp")))
    (native-inputs (list pkg-config))
    (inputs (list sqlite curl fuse zlib))
    (synopsis "client-server backup system")
    (description
     "UrBackup is an easy-to-setup, client-server backup system that supports
image and file backups through a combination of incremental and full backups.
It features a web interface for administration and monitoring.")
    (home-page "https://www.urbackup.org/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11. sql-workbench — Cross-platform SQL query tool
;;; -------------------------------------------------------------------
(define-public sql-workbench
  (package
    (name "sql-workbench")
    (version "132")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.sql-workbench.eu/Workbench-Build"
                    version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sqlworkbench.jar" "share/sql-workbench/")
               ("sqlworkbench.sh" "bin/sqlworkbench")
               ("sqlwbconsole.sh" "bin/sqlwbconsole"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (chmod (string-append bin "/sqlworkbench") #o755)
                     (chmod (string-append bin "/sqlwbconsole") #o755)))))))
    (inputs (list (list openjdk11 "jdk")))
    (synopsis "free, DBMS-independent, cross-platform SQL query tool")
    (description
     "SQL Workbench/J is a free, DBMS-independent, cross-platform SQL query
tool.  It supports all major database systems through JDBC and provides
features for data import/export, SQL scripting, and database administration.")
    (home-page "https://www.sql-workbench.eu/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. vacuum — OpenAPI linter and quality checker
;;; -------------------------------------------------------------------
(define-public vacuum
  (package
    (name "vacuum")
    (version "0.26.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/daveshanley/vacuum")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/daveshanley/vacuum"
           #:install-source? #f
           #:tests? #f))
    (synopsis "fast and lightweight OpenAPI linter and quality checker")
    (description
     "Vacuum is a fast, lightweight OpenAPI linter and quality checking tool
written in Go.  It validates OpenAPI specifications against configurable
rulesets and provides detailed reports on API definition quality.")
    (home-page "https://quobix.com/vacuum/")
    (license license:expat)))
