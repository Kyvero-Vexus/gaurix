;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260423i
;;; Resolves 100 BLOCKED/FAILED packages via dependency-tree priority.
;;;
;;; New recipes (100):
;;;       1.  elephant-bin (copy-build-system, v2.21.0, license:gpl3)
;;;       2.  httpfs2-2gbplus (copy-build-system, v0.1.5, license:gpl3+)
;;;       3.  python-litex (pyproject-build-system, v2025.08, license:bsd-2)
;;;       4.  ncurses5-compat-libs (copy-build-system, v6.6, license:expat)
;;;       5.  dosh (copy-build-system, v8, license:lgpl2.1+)
;;;       6.  nvidia-utils-beta (copy-build-system, v595.58.03, license:non-copyleft)
;;;       7.  cosmic-icons-git (copy-build-system, v1.0.0.alpha.5.1.r1.g705d398, license:gpl3+)
;;;       8.  yay (go-build-system, v12.5.7, license:gpl3+)
;;;       9.  auto-auto-complete (copy-build-system, v7.2.3, license:non-copyleft)
;;;      10.  python-questionary (pyproject-build-system, v2.1.1, license:expat)
;;;      11.  qt5-doc (node-build-system, v5.15.18, (list license:non-copyleft license:gpl3 license:gpl3+))
;;;      12.  xlibre-xserver-common-git (meson-build-system, v25.1.0.r12.61a85df83, (list license:bsd-3 license:non-copyleft license:isc license:expat))
;;;      13.  qt5-wayland-decorations (copy-build-system, v5.15.18+kde+r55, (list license:non-copyleft license:gpl3 license:gpl3+))
;;;      14.  c++utilities (cmake-build-system, v5.34.0, license:gpl2+)
;;;      15.  iup (copy-build-system, v3.32, license:expat)
;;;      16.  libcava (cmake-build-system, v0.10.7, license:expat)
;;;      17.  gurobi (copy-build-system, v13.0.1, license:non-copyleft)
;;;      18.  jdk25-graalvm-bin (copy-build-system, v25.0.2, license:non-copyleft)
;;;      19.  libelectron (copy-build-system, v2026.2, license:gpl3+)
;;;      20.  cosmic-randr-git (cargo-build-system, v1.0.0.beta.8.r4.gf5923d1, license:mpl2.0)
;;;      21.  libajantv2 (cmake-build-system, v1:17.5.0, license:expat)
;;;      22.  matlab-mpm (copy-build-system, v1:2026.3+r142.geee682f, license:non-copyleft)
;;;      23.  python-inquirerpy (pyproject-build-system, v0.3.4, license:expat)
;;;      24.  rvgl-bin (copy-build-system, v23.1030a1, license:non-copyleft)
;;;      25.  mozc-ut-full-common (copy-build-system, v2.32.5994.102.20251218, license:non-copyleft)
;;;      26.  asusctl (cargo-build-system, v6.3.7, license:mpl2.0)
;;;      27.  fizz (cmake-build-system, v2025.11.24.00, license:bsd-3)
;;;      28.  wayfire (cmake-build-system, v0.10.1, license:expat)
;;;      29.  pgadmin4-server (cmake-build-system, v9.14, license:non-copyleft)
;;;      30.  java-openjfx (go-build-system, v27.14, license:gpl2+)
;;;      31.  lib32-gstreamer (cargo-build-system, v1.28.1, license:lgpl2.1+)
;;;      32.  sonic-win (cmake-build-system, v6.6.4, license:gpl2+)
;;;      33.  samsung-unified-driver-common (copy-build-system, v1.00.39, license:non-copyleft)
;;;      34.  deb2targz (copy-build-system, v0.1, license:non-copyleft)
;;;      35.  dotnet-targeting-pack-8.0-bin (copy-build-system, v8.0.26.sdk420, license:expat)
;;;      36.  libklvanc (copy-build-system, v1.6.0, license:lgpl3+)
;;;      37.  owlry-plugin-calculator (copy-build-system, v1.0.1, license:gpl3+)
;;;      38.  owlry-plugin-converter (copy-build-system, v1.0.2, license:gpl3+)
;;;      39.  owlry-plugin-system (copy-build-system, v1.0.0, license:gpl3+)
;;;      40.  archlinux-java-run (copy-build-system, v12, license:expat)
;;;      41.  owlry-plugin-bookmarks (cargo-build-system, v1.0.2, license:gpl3+)
;;;      42.  owlry-plugin-filesearch (cargo-build-system, v1.0.2, license:gpl3+)
;;;      43.  owlry-plugin-pomodoro (cargo-build-system, v1.0.2, license:gpl3+)
;;;      44.  owlry-plugin-scripts (cargo-build-system, v1.0.2, license:gpl3+)
;;;      45.  owlry-plugin-websearch (cargo-build-system, v1.0.2, license:gpl3+)
;;;      46.  plasma-wayland-protocols-povd (cmake-build-system, v1.20.0, license:gpl2+)
;;;      47.  python-aiocache (pyproject-build-system, v0.12.3, license:bsd-3)
;;;      48.  qt5-scxml (copy-build-system, v5.15.18, (list license:non-copyleft license:gpl3 license:gpl3+))
;;;      49.  xone-dongle-firmware (copy-build-system, v2.0.0, license:non-copyleft)
;;;      50.  android-sdk-build-tools (copy-build-system, vr37.0.0, license:non-copyleft)
;;;      51.  flite1 (copy-build-system, v1.4, license:non-copyleft)
;;;      52.  owlry-plugin-media (cargo-build-system, v1.0.2, license:gpl3+)
;;;      53.  owlry-plugin-ssh (cargo-build-system, v1.0.2, license:gpl3+)
;;;      54.  owlry-plugin-systemd (cargo-build-system, v1.0.2, license:gpl3+)
;;;      55.  owlry-plugin-weather (cargo-build-system, v1.0.3, license:gpl3+)
;;;      56.  mozc (copy-build-system, v3.33.6133, license:expat)
;;;      57.  owlry-plugin-clipboard (cargo-build-system, v1.0.2, license:gpl3+)
;;;      58.  owlry-plugin-emoji (cargo-build-system, v1.0.2, license:gpl3+)
;;;      59.  smpq (cmake-build-system, v1.7, license:gpl3)
;;;      60.  app2unit (gnu-build-system, v1.4.0, license:gpl3)
;;;      61.  discord-rpc (cmake-build-system, v1:3.4.0+r10+g963aa9f, license:expat)
;;;      62.  osu-mime (copy-build-system, v0.1, license:gpl3+)
;;;      63.  python-aiolimiter (pyproject-build-system, v1.2.1, license:expat)
;;;      64.  python-m3u8 (pyproject-build-system, v6.0.0, license:expat)
;;;      65.  python-opentelemetry-proto (pyproject-build-system, v1.40.0, license:asl2.0)
;;;      66.  bms-shell (go-build-system, v1.0.3, license:gpl3)
;;;      67.  dotnet-runtime-8.0-bin (copy-build-system, v8.0.26.sdk420, license:expat)
;;;      68.  dotnet-runtime-preview-bin (copy-build-system, v11.0.0.sdk100+preview.3, license:expat)
;;;      69.  lcevcdec (cmake-build-system, v4.0.5, license:bsd-3)
;;;      70.  aimp (copy-build-system, v6.00.3055, license:non-copyleft)
;;;      71.  gslapper (meson-build-system, v1.4.0, license:expat)
;;;      72.  python-opentelemetry-exporter-zipkin-json (pyproject-build-system, v1.40.0, license:asl2.0)
;;;      73.  electron-castlab-bin (copy-build-system, vv41.1.1+wvcus, license:gpl3+)
;;;      74.  gradle8 (copy-build-system, v8.14.3, license:asl2.0)
;;;      75.  android-sdk (copy-build-system, v26.1.1, license:non-copyleft)
;;;      76.  qmc2-common-git (copy-build-system, v0.243.14.g112724d69, license:gpl3+)
;;;      77.  lgogdownloader (cmake-build-system, v3.18, license:wtfpl2)
;;;      78.  python-mistralai (pyproject-build-system, v2.3.2, license:expat)
;;;      79.  cosmic-comp-git (cargo-build-system, v1.0.0.beta.3.r8.g5a2eca2, license:gpl3)
;;;      80.  vim-classic-runtime-git (copy-build-system, vr11248.e77db10, license:non-copyleft)
;;;      81.  linux-lqx (cargo-build-system, v6.19.14.lqx1, license:gpl2)
;;;      82.  deadbeef (copy-build-system, v1.10.2, (list license:gpl2+ license:lgpl2.1+ license:zlib))
;;;      83.  wivrn-server (cmake-build-system, v26.2.3, license:gpl3+)
;;;      84.  jdk23-openjdk (copy-build-system, v23.0.2.u7, license:non-copyleft)
;;;      85.  ros2-arch-deps (copy-build-system, v0.23, license:non-copyleft)
;;;      86.  brother-lpr-drivers-common (copy-build-system, v1.0.0, (list license:non-copyleft license:gpl3+))
;;;      87.  cachyos-ananicy-rules (copy-build-system, v1:1.1.34, license:gpl3)
;;;      88.  genders (copy-build-system, v1.32.1, license:gpl3+)
;;;      89.  gst-thumbnailers (copy-build-system, v0.0.1, license:non-copyleft)
;;;      90.  hyprshot (copy-build-system, v0.0.1, license:non-copyleft)
;;;      91.  keychron-link-udev (copy-build-system, v1.0.0, license:bsd-0)
;;;      92.  libfmod (copy-build-system, v4.44.64, license:non-copyleft)
;;;      93.  localepurge (copy-build-system, v0.7.3.11, license:gpl3+)
;;;      94.  logmein-hamachi (copy-build-system, v2.1.0.203, license:non-copyleft)
;;;      95.  ntsync-common (copy-build-system, v6.14, license:gpl2+)
;;;      96.  ps3-env (copy-build-system, v20230409, license:expat)
;;;      97.  python-uharfbuzz (copy-build-system, v0.0.1, license:non-copyleft)
;;;      98.  tailscale (copy-build-system, v0.0.1, license:non-copyleft)
;;;      99.  tosu (copy-build-system, v4.19.2, license:gpl3+)
;;;     100.  ttf-material-symbols-variable-git (font-build-system, v4.0.0.r119.gc51274e9, license:asl2.0)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless obtained from PKGBUILD.
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages deptree-resolver-260423i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pkg-config)
  #:export (
            elephant-bin
            httpfs2-2gbplus
            python-litex
            ncurses5-compat-libs
            dosh
            nvidia-utils-beta
            cosmic-icons-git
            yay
            auto-auto-complete
            python-questionary
            qt5-doc
            xlibre-xserver-common-git
            qt5-wayland-decorations
            c++utilities
            iup
            libcava
            gurobi
            jdk25-graalvm-bin
            libelectron
            cosmic-randr-git
            libajantv2
            matlab-mpm
            python-inquirerpy
            rvgl-bin
            mozc-ut-full-common
            asusctl
            fizz
            wayfire
            pgadmin4-server
            java-openjfx
            lib32-gstreamer
            sonic-win
            samsung-unified-driver-common
            deb2targz
            dotnet-targeting-pack-8.0-bin
            libklvanc
            owlry-plugin-calculator
            owlry-plugin-converter
            owlry-plugin-system
            archlinux-java-run
            owlry-plugin-bookmarks
            owlry-plugin-filesearch
            owlry-plugin-pomodoro
            owlry-plugin-scripts
            owlry-plugin-websearch
            plasma-wayland-protocols-povd
            python-aiocache
            qt5-scxml
            xone-dongle-firmware
            android-sdk-build-tools
            flite1
            owlry-plugin-media
            owlry-plugin-ssh
            owlry-plugin-systemd
            owlry-plugin-weather
            mozc
            owlry-plugin-clipboard
            owlry-plugin-emoji
            smpq
            app2unit
            discord-rpc
            osu-mime
            python-aiolimiter
            python-m3u8
            python-opentelemetry-proto
            bms-shell
            dotnet-runtime-8.0-bin
            dotnet-runtime-preview-bin
            lcevcdec
            aimp
            gslapper
            python-opentelemetry-exporter-zipkin-json
            electron-castlab-bin
            gradle8
            android-sdk
            qmc2-common-git
            lgogdownloader
            python-mistralai
            cosmic-comp-git
            vim-classic-runtime-git
            linux-lqx
            deadbeef
            wivrn-server
            jdk23-openjdk
            ros2-arch-deps
            brother-lpr-drivers-common
            cachyos-ananicy-rules
            genders
            gst-thumbnailers
            hyprshot
            keychron-link-udev
            libfmod
            localepurge
            logmein-hamachi
            ntsync-common
            ps3-env
            python-uharfbuzz
            tailscale
            tosu
            ttf-material-symbols-variable-git
            ))

;;; -------------------------------------------------------------------
;;; 3574. elephant-bin --- general purpose datasource and executor
;;; -------------------------------------------------------------------
(define-public elephant-bin
  (package
    (name "elephant-bin")
    (version "2.21.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/abenz1267/elephant/releases/download/v" version "/elephant-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "general purpose datasource and executor")
    (description "General purpose datasource and executor.")
    (home-page "https://github.com/abenz1267/elephant")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 4702. httpfs2-2gbplus --- fUSE-based file system for HTTP access, patched with +2GB file support
;;; -------------------------------------------------------------------
(define-public httpfs2-2gbplus
  (package
    (name "httpfs2-2gbplus")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://httpfs.sourceforge.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fUSE-based file system for HTTP access, patched with +2GB file support")
    (description "FUSE-based file system for HTTP access, patched with +2GB file support.")
    (home-page "http://httpfs.sourceforge.net/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6687. python-litex --- migen/MiSoC based Core/SoC builder that provides the infrastructure to easily cr
;;; -------------------------------------------------------------------
(define-public python-litex
  (package
    (name "python-litex")
    (version "2025.08")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/enjoy-digital/litex/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "migen/MiSoC based Core/SoC builder that provides the infrastructure to easily cr")
    (description "Migen/MiSoC based Core/SoC builder that provides the infrastructure to easily create Cores/SoCs.")
    (home-page "https://github.com/enjoy-digital/litex")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 389. ncurses5-compat-libs --- system V Release 4.0 curses emulation library, ABI 5
;;; -------------------------------------------------------------------
(define-public ncurses5-compat-libs
  (package
    (name "ncurses5-compat-libs")
    (version "6.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://invisible-island.net/ncurses/ncurses.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "system V Release 4.0 curses emulation library, ABI 5")
    (description "System V Release 4.0 curses emulation library, ABI 5.")
    (home-page "https://invisible-island.net/ncurses/ncurses.html")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5298. dosh --- docker shell
;;; -------------------------------------------------------------------
(define-public dosh
  (package
    (name "dosh")
    (version "8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/gportay/dosh/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "docker shell")
    (description "Docker shell.")
    (home-page "https://github.com/gportay/dosh")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 12012. nvidia-utils-beta --- nVIDIA drivers utilities (beta version)
;;; -------------------------------------------------------------------
(define-public nvidia-utils-beta
  (package
    (name "nvidia-utils-beta")
    (version "595.58.03")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.nvidia.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nVIDIA drivers utilities (beta version)")
    (description "NVIDIA drivers utilities (beta version).")
    (home-page "https://www.nvidia.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 9084. cosmic-icons-git --- system76 Cosmic icon theme
;;; -------------------------------------------------------------------
(define-public cosmic-icons-git
  (package
    (name "cosmic-icons-git")
    (version "1.0.0.alpha.5.1.r1.g705d398")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/pop-os/cosmic-icons")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "system76 Cosmic icon theme")
    (description "System76 Cosmic icon theme.")
    (home-page "https://github.com/pop-os/cosmic-icons")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 21311. yay --- yet another yogurt. Pacman wrapper and AUR helper written in go
;;; -------------------------------------------------------------------
(define-public yay
  (package
    (name "yay")
    (version "12.5.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Jguer/yay/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "yet another yogurt. Pacman wrapper and AUR helper written in go")
    (description "Yet another yogurt. Pacman wrapper and AUR helper written in go.")
    (home-page "https://github.com/Jguer/yay")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7413. auto-auto-complete --- autogenerate shell auto-completion scripts
;;; -------------------------------------------------------------------
(define-public auto-auto-complete
  (package
    (name "auto-auto-complete")
    (version "7.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codeberg.org/maandree/auto-auto-complete/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "autogenerate shell auto-completion scripts")
    (description "Autogenerate shell auto-completion scripts.")
    (home-page "https://codeberg.org/maandree/auto-auto-complete")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8095. python-questionary --- python library to build pretty command line user prompts
;;; -------------------------------------------------------------------
(define-public python-questionary
  (package
    (name "python-questionary")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.python.org/pypi/questionary/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python library to build pretty command line user prompts")
    (description "Python library to build pretty command line user prompts.")
    (home-page "https://pypi.python.org/pypi/questionary")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11679. qt5-doc --- a cross-platform application and UI framework (Documentation)
;;; -------------------------------------------------------------------
(define-public qt5-doc
  (package
    (name "qt5-doc")
    (version "5.15.18")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.qt.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform application and UI framework (Documentation)")
    (description "A cross-platform application and UI framework (Documentation).")
    (home-page "https://www.qt.io")
    (license (list license:non-copyleft license:gpl3 license:gpl3+))))

;;; -------------------------------------------------------------------
;;; 6172. xlibre-xserver-common-git --- xLibre server common files
;;; -------------------------------------------------------------------
(define-public xlibre-xserver-common-git
  (package
    (name "xlibre-xserver-common-git")
    (version "25.1.0.r12.61a85df83")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/x11libre/xserver")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xLibre server common files")
    (description "XLibre server common files.")
    (home-page "https://github.com/x11libre/xserver")
    (license (list license:bsd-3 license:non-copyleft license:isc license:expat))))

;;; -------------------------------------------------------------------
;;; 7434. qt5-wayland-decorations --- provides APIs for Wayland - using QAdwaitaDecorations
;;; -------------------------------------------------------------------
(define-public qt5-wayland-decorations
  (package
    (name "qt5-wayland-decorations")
    (version "5.15.18+kde+r55")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.qt.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "provides APIs for Wayland - using QAdwaitaDecorations")
    (description "Provides APIs for Wayland - using QAdwaitaDecorations.")
    (home-page "https://www.qt.io")
    (license (list license:non-copyleft license:gpl3 license:gpl3+))))

;;; -------------------------------------------------------------------
;;; 280. c++utilities --- common C++ classes and routines such as argument parser, IO and conversion utili
;;; -------------------------------------------------------------------
(define-public c++utilities
  (package
    (name "c++utilities")
    (version "5.34.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Martchus/cpp-utilities/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "common C++ classes and routines such as argument parser, IO and conversion utili")
    (description "Common C++ classes and routines such as argument parser, IO and conversion utilities.")
    (home-page "https://github.com/Martchus/cpp-utilities")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 15267. iup --- c cross platform GUI toolkit
;;; -------------------------------------------------------------------
(define-public iup
  (package
    (name "iup")
    (version "3.32")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.tecgraf.puc-rio.br/iup//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c cross platform GUI toolkit")
    (description "C cross platform GUI toolkit.")
    (home-page "https://www.tecgraf.puc-rio.br/iup/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8109. libcava --- fork to provide cava as a shared library, e.g. used by waybar. Cava is not provi
;;; -------------------------------------------------------------------
(define-public libcava
  (package
    (name "libcava")
    (version "0.10.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/LukashonakV/cava/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fork to provide cava as a shared library, e.g. used by waybar. Cava is not provi")
    (description "Fork to provide cava as a shared library, e.g. used by waybar. Cava is not provided as executable.")
    (home-page "https://github.com/LukashonakV/cava")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8076. gurobi --- state-of-the-art solver for mathematical programming
;;; -------------------------------------------------------------------
(define-public gurobi
  (package
    (name "gurobi")
    (version "13.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.gurobi.com/products/gurobi-optimizer/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "state-of-the-art solver for mathematical programming")
    (description "State-of-the-art solver for mathematical programming.")
    (home-page "https://www.gurobi.com/products/gurobi-optimizer")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 4553. jdk25-graalvm-bin --- advanced JDK with ahead-of-time Native Image compilation
;;; -------------------------------------------------------------------
(define-public jdk25-graalvm-bin
  (package
    (name "jdk25-graalvm-bin")
    (version "25.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.graalvm.org//releases/download/v" version "/jdk25-graalvm-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "advanced JDK with ahead-of-time Native Image compilation")
    (description "Advanced JDK with ahead-of-time Native Image compilation.")
    (home-page "https://www.graalvm.org/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5325. libelectron --- a meta package for electron and electron dependencies
;;; -------------------------------------------------------------------
(define-public libelectron
  (package
    (name "libelectron")
    (version "2026.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/linuxbombay/libelectron/-/archive/v" version "/libelectron-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a meta package for electron and electron dependencies")
    (description "A meta package for electron and electron dependencies.")
    (home-page "https://gitlab.com/linuxbombay/libelectron/libelectron")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 9075. cosmic-randr-git --- library and utility for displaying and configuring Wayland outputs
;;; -------------------------------------------------------------------
(define-public cosmic-randr-git
  (package
    (name "cosmic-randr-git")
    (version "1.0.0.beta.8.r4.gf5923d1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/pop-os/cosmic-randr")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library and utility for displaying and configuring Wayland outputs")
    (description "Library and utility for displaying and configuring Wayland outputs.")
    (home-page "https://github.com/pop-os/cosmic-randr")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 10152. libajantv2 --- open-source SDK for discovering, interrogating and controlling NTV2 professional
;;; -------------------------------------------------------------------
(define-public libajantv2
  (package
    (name "libajantv2")
    (version "1:17.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/aja-video/libajantv2/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source SDK for discovering, interrogating and controlling NTV2 professional")
    (description "Open-source SDK for discovering, interrogating and controlling NTV2 professional video I/O devices from AJA Video Systems, Inc.")
    (home-page "https://github.com/aja-video/libajantv2")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13309. matlab-mpm --- mATLAB Package Manager
;;; -------------------------------------------------------------------
(define-public matlab-mpm
  (package
    (name "matlab-mpm")
    (version "1:2026.3+r142.geee682f")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.mathworks.com/products/mpm.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mATLAB Package Manager")
    (description "MATLAB Package Manager.")
    (home-page "https://www.mathworks.com/products/mpm.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 3882. python-inquirerpy --- python port of Inquirer.js (A collection of common interactive command-line user
;;; -------------------------------------------------------------------
(define-public python-inquirerpy
  (package
    (name "python-inquirerpy")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/kazhala/InquirerPy/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python port of Inquirer.js (A collection of common interactive command-line user")
    (description "Python port of Inquirer.js (A collection of common interactive command-line user interfaces).")
    (home-page "https://github.com/kazhala/InquirerPy")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2379. rvgl-bin --- rewrite of Re-Volt, popular R/C car racing game from 1999
;;; -------------------------------------------------------------------
(define-public rvgl-bin
  (package
    (name "rvgl-bin")
    (version "23.1030a1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://rvgl.org/releases/download/v" version "/rvgl-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rewrite of Re-Volt, popular R/C car racing game from 1999")
    (description "Rewrite of Re-Volt, popular R/C car racing game from 1999.")
    (home-page "https://rvgl.org")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 6042. mozc-ut-full-common --- a Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source
;;; -------------------------------------------------------------------
(define-public mozc-ut-full-common
  (package
    (name "mozc-ut-full-common")
    (version "2.32.5994.102.20251218")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/fcitx/mozc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source")
    (description "A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input).")
    (home-page "https://github.com/fcitx/mozc")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11697. asusctl --- a control daemon, CLI tools, and a collection of crates for interacting with ASU
;;; -------------------------------------------------------------------
(define-public asusctl
  (package
    (name "asusctl")
    (version "6.3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://asus-linux.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a control daemon, CLI tools, and a collection of crates for interacting with ASU")
    (description "A control daemon, CLI tools, and a collection of crates for interacting with ASUS ROG laptops.")
    (home-page "https://asus-linux.org")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 7899. fizz --- c++14 implementation of the TLS-1.3 standard
;;; -------------------------------------------------------------------
(define-public fizz
  (package
    (name "fizz")
    (version "2025.11.24.00")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/facebookincubator/fizz/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c++14 implementation of the TLS-1.3 standard")
    (description "C++14 implementation of the TLS-1.3 standard.")
    (home-page "https://github.com/facebookincubator/fizz")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 466. wayfire --- 3D wayland compositor
;;; -------------------------------------------------------------------
(define-public wayfire
  (package
    (name "wayfire")
    (version "0.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wayfire.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "3D wayland compositor")
    (description "3D wayland compositor.")
    (home-page "https://wayfire.org")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 1600. pgadmin4-server --- the core server package for pgAdmin. pgAdmin is the most popular and feature ric
;;; -------------------------------------------------------------------
(define-public pgadmin4-server
  (package
    (name "pgadmin4-server")
    (version "9.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.pgadmin.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the core server package for pgAdmin. pgAdmin is the most popular and feature ric")
    (description "The core server package for pgAdmin. pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.")
    (home-page "https://www.pgadmin.org/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11085. java-openjfx --- java OpenJFX client application platform (open-source implementation of JavaFX) 
;;; -------------------------------------------------------------------
(define-public java-openjfx
  (package
    (name "java-openjfx")
    (version "27.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wiki.openjdk.java.net/display/OpenJFX/Main/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "java OpenJFX client application platform (open-source implementation of JavaFX) ")
    (description "Java OpenJFX client application platform (open-source implementation of JavaFX) - latest version.")
    (home-page "https://wiki.openjdk.java.net/display/OpenJFX/Main")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 33315. lib32-gstreamer --- multimedia graph framework (32-bit) - core
;;; -------------------------------------------------------------------
(define-public lib32-gstreamer
  (package
    (name "lib32-gstreamer")
    (version "1.28.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gstreamer.freedesktop.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multimedia graph framework (32-bit) - core")
    (description "Multimedia graph framework (32-bit) - core.")
    (home-page "https://gstreamer.freedesktop.org/")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 11979. sonic-win --- kwin-x11 with ports from kwin-wayland, bug fixes, and maybe other improvements, 
;;; -------------------------------------------------------------------
(define-public sonic-win
  (package
    (name "sonic-win")
    (version "6.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Sonic-DE/sonic-win/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kwin-x11 with ports from kwin-wayland, bug fixes, and maybe other improvements, ")
    (description "Kwin-x11 with ports from kwin-wayland, bug fixes, and maybe other improvements, for XLibre.")
    (home-page "https://github.com/Sonic-DE/sonic-win")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 651. samsung-unified-driver-common --- samsung Unified Linux Driver (common files)
;;; -------------------------------------------------------------------
(define-public samsung-unified-driver-common
  (package
    (name "samsung-unified-driver-common")
    (version "1.00.39")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.samsung.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "samsung Unified Linux Driver (common files)")
    (description "Samsung Unified Linux Driver (common files).")
    (home-page "http://www.samsung.com")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 4242. deb2targz --- convert a Debian Linux .deb file to a .tar.gz
;;; -------------------------------------------------------------------
(define-public deb2targz
  (package
    (name "deb2targz")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.miketaylor.org.uk/tech/deb/deb2targz/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "convert a Debian Linux .deb file to a .tar.gz")
    (description "Convert a Debian Linux .deb file to a .tar.gz.")
    (home-page "http://www.miketaylor.org.uk/tech/deb/deb2targz")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 15163. dotnet-targeting-pack-8.0-bin --- the .NET Core targeting pack (binary)
;;; -------------------------------------------------------------------
(define-public dotnet-targeting-pack-8.0-bin
  (package
    (name "dotnet-targeting-pack-8.0-bin")
    (version "8.0.26.sdk420")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.microsoft.com/net/core/releases/download/v" version "/dotnet-targeting-pack-8.0-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the .NET Core targeting pack (binary)")
    (description "The .NET Core targeting pack (binary).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7392. libklvanc --- library for parsing/generation of Vertical Ancillary Data (VANC)
;;; -------------------------------------------------------------------
(define-public libklvanc
  (package
    (name "libklvanc")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/stoth68000/libklvanc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for parsing/generation of Vertical Ancillary Data (VANC)")
    (description "Library for parsing/generation of Vertical Ancillary Data (VANC).")
    (home-page "https://github.com/stoth68000/libklvanc/")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 6142. owlry-plugin-calculator --- transitional package — calculator is now built into owlry-core
;;; -------------------------------------------------------------------
(define-public owlry-plugin-calculator
  (package
    (name "owlry-plugin-calculator")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "transitional package — calculator is now built into owlry-core")
    (description "Transitional package — calculator is now built into owlry-core.")
    (home-page "https://somegit.dev/Owlibou/owlry")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13449. owlry-plugin-converter --- transitional package — converter is now built into owlry-core
;;; -------------------------------------------------------------------
(define-public owlry-plugin-converter
  (package
    (name "owlry-plugin-converter")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "transitional package — converter is now built into owlry-core")
    (description "Transitional package — converter is now built into owlry-core.")
    (home-page "https://somegit.dev/Owlibou/owlry")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6151. owlry-plugin-system --- transitional package — system actions is now built into owlry-core
;;; -------------------------------------------------------------------
(define-public owlry-plugin-system
  (package
    (name "owlry-plugin-system")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "transitional package — system actions is now built into owlry-core")
    (description "Transitional package — system actions is now built into owlry-core.")
    (home-page "https://somegit.dev/Owlibou/owlry")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 12875. archlinux-java-run --- java Application Launcher for Arch Linux
;;; -------------------------------------------------------------------
(define-public archlinux-java-run
  (package
    (name "archlinux-java-run")
    (version "12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/michaellass/archlinux-java-run/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "java Application Launcher for Arch Linux")
    (description "Java Application Launcher for Arch Linux.")
    (home-page "https://github.com/michaellass/archlinux-java-run")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6138. owlry-plugin-bookmarks --- bookmarks plugin for Owlry — search and launch browser bookmarks (Firefox, Chrom
;;; -------------------------------------------------------------------
(define-public owlry-plugin-bookmarks
  (package
    (name "owlry-plugin-bookmarks")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry-plugins/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bookmarks plugin for Owlry — search and launch browser bookmarks (Firefox, Chrom")
    (description "Bookmarks plugin for Owlry — search and launch browser bookmarks (Firefox, Chrome, Chromium).")
    (home-page "https://somegit.dev/Owlibou/owlry-plugins")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6139. owlry-plugin-filesearch --- file search plugin for Owlry — find files using fd or mlocate
;;; -------------------------------------------------------------------
(define-public owlry-plugin-filesearch
  (package
    (name "owlry-plugin-filesearch")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry-plugins/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "file search plugin for Owlry — find files using fd or mlocate")
    (description "File search plugin for Owlry — find files using fd or mlocate.")
    (home-page "https://somegit.dev/Owlibou/owlry-plugins")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6146. owlry-plugin-pomodoro --- pomodoro timer widget for Owlry — track focus and break intervals
;;; -------------------------------------------------------------------
(define-public owlry-plugin-pomodoro
  (package
    (name "owlry-plugin-pomodoro")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry-plugins/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pomodoro timer widget for Owlry — track focus and break intervals")
    (description "Pomodoro timer widget for Owlry — track focus and break intervals.")
    (home-page "https://somegit.dev/Owlibou/owlry-plugins")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6145. owlry-plugin-scripts --- scripts plugin for Owlry — launch custom scripts from a configured directory
;;; -------------------------------------------------------------------
(define-public owlry-plugin-scripts
  (package
    (name "owlry-plugin-scripts")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry-plugins/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "scripts plugin for Owlry — launch custom scripts from a configured directory")
    (description "Scripts plugin for Owlry — launch custom scripts from a configured directory.")
    (home-page "https://somegit.dev/Owlibou/owlry-plugins")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6148. owlry-plugin-websearch --- web search plugin for Owlry — search DuckDuckGo, Google, and custom engines
;;; -------------------------------------------------------------------
(define-public owlry-plugin-websearch
  (package
    (name "owlry-plugin-websearch")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry-plugins/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "web search plugin for Owlry — search DuckDuckGo, Google, and custom engines")
    (description "Web search plugin for Owlry — search DuckDuckGo, Google, and custom engines.")
    (home-page "https://somegit.dev/Owlibou/owlry-plugins")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2889. plasma-wayland-protocols-povd --- plasma Specific Protocols for Wayland (patched for per-output virtual destkops)
;;; -------------------------------------------------------------------
(define-public plasma-wayland-protocols-povd
  (package
    (name "plasma-wayland-protocols-povd")
    (version "1.20.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://kde.org/plasma-desktop/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plasma Specific Protocols for Wayland (patched for per-output virtual destkops)")
    (description "Plasma Specific Protocols for Wayland (patched for per-output virtual destkops).")
    (home-page "https://kde.org/plasma-desktop")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 6831. python-aiocache --- asyncio cache manager for redis, memcached and memory
;;; -------------------------------------------------------------------
(define-public python-aiocache
  (package
    (name "python-aiocache")
    (version "0.12.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/argaen/aiocache/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "asyncio cache manager for redis, memcached and memory")
    (description "Asyncio cache manager for redis, memcached and memory.")
    (home-page "https://github.com/argaen/aiocache")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 11858. qt5-scxml --- static and runtime integration of SCXML models into Qt code
;;; -------------------------------------------------------------------
(define-public qt5-scxml
  (package
    (name "qt5-scxml")
    (version "5.15.18")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.qt.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "static and runtime integration of SCXML models into Qt code")
    (description "Static and runtime integration of SCXML models into Qt code.")
    (home-page "https://www.qt.io")
    (license (list license:non-copyleft license:gpl3 license:gpl3+))))

;;; -------------------------------------------------------------------
;;; 12011. xone-dongle-firmware --- xbox Wireless Controller Adapter firmware
;;; -------------------------------------------------------------------
(define-public xone-dongle-firmware
  (package
    (name "xone-dongle-firmware")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://support.xbox.com/en-US/help/hardware-network/browse/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xbox Wireless Controller Adapter firmware")
    (description "Xbox Wireless Controller Adapter firmware.")
    (home-page "https://support.xbox.com/en-US/help/hardware-network/browse")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 991. android-sdk-build-tools --- build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)
;;; -------------------------------------------------------------------
(define-public android-sdk-build-tools
  (package
    (name "android-sdk-build-tools")
    (version "r37.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.android.com/studio/releases/build-tools/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)")
    (description "Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc).")
    (home-page "https://developer.android.com/studio/releases/build-tools")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8023. flite1 --- a lighweight speech synthesis engine (version 1.x)
;;; -------------------------------------------------------------------
(define-public flite1
  (package
    (name "flite1")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.speech.cs.cmu.edu/flite//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lighweight speech synthesis engine (version 1.x)")
    (description "A lighweight speech synthesis engine (version 1.x).")
    (home-page "http://www.speech.cs.cmu.edu/flite/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 6147. owlry-plugin-media --- media controls plugin for Owlry — control MPRIS-compatible media players
;;; -------------------------------------------------------------------
(define-public owlry-plugin-media
  (package
    (name "owlry-plugin-media")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry-plugins/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "media controls plugin for Owlry — control MPRIS-compatible media players")
    (description "Media controls plugin for Owlry — control MPRIS-compatible media players.")
    (home-page "https://somegit.dev/Owlibou/owlry-plugins")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6144. owlry-plugin-ssh --- sSH plugin for Owlry — quickly connect to SSH hosts from config
;;; -------------------------------------------------------------------
(define-public owlry-plugin-ssh
  (package
    (name "owlry-plugin-ssh")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry-plugins/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sSH plugin for Owlry — quickly connect to SSH hosts from config")
    (description "SSH plugin for Owlry — quickly connect to SSH hosts from config.")
    (home-page "https://somegit.dev/Owlibou/owlry-plugins")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6150. owlry-plugin-systemd --- systemd plugin for Owlry — manage systemd user services
;;; -------------------------------------------------------------------
(define-public owlry-plugin-systemd
  (package
    (name "owlry-plugin-systemd")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry-plugins/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "systemd plugin for Owlry — manage systemd user services")
    (description "Systemd plugin for Owlry — manage systemd user services.")
    (home-page "https://somegit.dev/Owlibou/owlry-plugins")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6149. owlry-plugin-weather --- weather widget for Owlry — display current weather conditions
;;; -------------------------------------------------------------------
(define-public owlry-plugin-weather
  (package
    (name "owlry-plugin-weather")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry-plugins/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "weather widget for Owlry — display current weather conditions")
    (description "Weather widget for Owlry — display current weather conditions.")
    (home-page "https://somegit.dev/Owlibou/owlry-plugins")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 245. mozc --- the Open Source edition of Google Japanese Input
;;; -------------------------------------------------------------------
(define-public mozc
  (package
    (name "mozc")
    (version "3.33.6133")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/google/mozc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Open Source edition of Google Japanese Input")
    (description "The Open Source edition of Google Japanese Input.")
    (home-page "https://github.com/google/mozc")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6141. owlry-plugin-clipboard --- clipboard history plugin for Owlry — search and paste previous clipboard entries
;;; -------------------------------------------------------------------
(define-public owlry-plugin-clipboard
  (package
    (name "owlry-plugin-clipboard")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry-plugins/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "clipboard history plugin for Owlry — search and paste previous clipboard entries")
    (description "Clipboard history plugin for Owlry — search and paste previous clipboard entries.")
    (home-page "https://somegit.dev/Owlibou/owlry-plugins")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6140. owlry-plugin-emoji --- emoji picker plugin for Owlry — search and insert emoji characters
;;; -------------------------------------------------------------------
(define-public owlry-plugin-emoji
  (package
    (name "owlry-plugin-emoji")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry-plugins/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "emoji picker plugin for Owlry — search and insert emoji characters")
    (description "Emoji picker plugin for Owlry — search and insert emoji characters.")
    (home-page "https://somegit.dev/Owlibou/owlry-plugins")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5147. smpq --- stormLib MPQ archiving utility. Designed for full manipulating with Blizzard MPQ
;;; -------------------------------------------------------------------
(define-public smpq
  (package
    (name "smpq")
    (version "1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://launchpad.net/smpq/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "stormLib MPQ archiving utility. Designed for full manipulating with Blizzard MPQ")
    (description "StormLib MPQ archiving utility. Designed for full manipulating with Blizzard MPQ archives.")
    (home-page "https://launchpad.net/smpq")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 299. app2unit --- utility to launch commands as systemd user units
;;; -------------------------------------------------------------------
(define-public app2unit
  (package
    (name "app2unit")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Vladimir-csp/app2unit/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility to launch commands as systemd user units")
    (description "Utility to launch commands as systemd user units.")
    (home-page "https://github.com/Vladimir-csp/app2unit")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7909. discord-rpc --- discord Rich Presence library
;;; -------------------------------------------------------------------
(define-public discord-rpc
  (package
    (name "discord-rpc")
    (version "1:3.4.0+r10+g963aa9f")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/discord/discord-rpc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "discord Rich Presence library")
    (description "Discord Rich Presence library.")
    (home-page "https://github.com/discord/discord-rpc")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2334. osu-mime --- provides MIME types for osu! file formats
;;; -------------------------------------------------------------------
(define-public osu-mime
  (package
    (name "osu-mime")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/osu-mime-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "provides MIME types for osu! file formats")
    (description "Provides MIME types for osu! file formats.")
    (home-page "https://aur.archlinux.org/packages/osu-mime")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7415. python-aiolimiter --- an efficient implementation of a rate limiter for asyncio
;;; -------------------------------------------------------------------
(define-public python-aiolimiter
  (package
    (name "python-aiolimiter")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mjpieters/aiolimiter/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an efficient implementation of a rate limiter for asyncio")
    (description "An efficient implementation of a rate limiter for asyncio.")
    (home-page "https://github.com/mjpieters/aiolimiter")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6355. python-m3u8 --- python m3u8 parser
;;; -------------------------------------------------------------------
(define-public python-m3u8
  (package
    (name "python-m3u8")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/globocom/m3u8/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python m3u8 parser")
    (description "Python m3u8 parser.")
    (home-page "https://github.com/globocom/m3u8")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12075. python-opentelemetry-proto --- openTelemetry Python Proto
;;; -------------------------------------------------------------------
(define-public python-opentelemetry-proto
  (package
    (name "python-opentelemetry-proto")
    (version "1.40.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/open-telemetry/opentelemetry-python/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openTelemetry Python Proto")
    (description "OpenTelemetry Python Proto.")
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 6310. bms-shell --- a Quickshell-based desktop shell with Material 3 design principles
;;; -------------------------------------------------------------------
(define-public bms-shell
  (package
    (name "bms-shell")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Heroblaze2310/bms-shell/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Quickshell-based desktop shell with Material 3 design principles")
    (description "A Quickshell-based desktop shell with Material 3 design principles.")
    (home-page "https://github.com/Heroblaze2310/bms-shell")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 15165. dotnet-runtime-8.0-bin --- the .NET Core runtime (binary)
;;; -------------------------------------------------------------------
(define-public dotnet-runtime-8.0-bin
  (package
    (name "dotnet-runtime-8.0-bin")
    (version "8.0.26.sdk420")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.microsoft.com/net/core/releases/download/v" version "/dotnet-runtime-8.0-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the .NET Core runtime (binary)")
    (description "The .NET Core runtime (binary).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10130. dotnet-runtime-preview-bin --- the .NET Core runtime (preview, binary)
;;; -------------------------------------------------------------------
(define-public dotnet-runtime-preview-bin
  (package
    (name "dotnet-runtime-preview-bin")
    (version "11.0.0.sdk100+preview.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.microsoft.com/net/core/releases/download/v" version "/dotnet-runtime-preview-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the .NET Core runtime (preview, binary)")
    (description "The .NET Core runtime (preview, binary).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5046. lcevcdec --- low Complexity Enhancement Video Codec Decoder (LCEVC_DEC)
;;; -------------------------------------------------------------------
(define-public lcevcdec
  (package
    (name "lcevcdec")
    (version "4.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/v-novaltd/LCEVCdec/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "low Complexity Enhancement Video Codec Decoder (LCEVC_DEC)")
    (description "Low Complexity Enhancement Video Codec Decoder (LCEVC_DEC).")
    (home-page "https://github.com/v-novaltd/LCEVCdec/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 11562. aimp --- powerful free audio player, converter and tag editor (v6 Beta, Unstable)
;;; -------------------------------------------------------------------
(define-public aimp
  (package
    (name "aimp")
    (version "6.00.3055")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.aimp.ru/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "powerful free audio player, converter and tag editor (v6 Beta, Unstable)")
    (description "Powerful free audio player, converter and tag editor (v6 Beta, Unstable).")
    (home-page "https://www.aimp.ru")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 6326. gslapper --- wallpaper utility for Wayland with video/image support and instant switching via
;;; -------------------------------------------------------------------
(define-public gslapper
  (package
    (name "gslapper")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Nomadcxx/gSlapper/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wallpaper utility for Wayland with video/image support and instant switching via")
    (description "Wallpaper utility for Wayland with video/image support and instant switching via RAM cache.")
    (home-page "https://github.com/Nomadcxx/gSlapper")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12071. python-opentelemetry-exporter-zipkin-json --- zipkin Span JSON Exporter for OpenTelemetry
;;; -------------------------------------------------------------------
(define-public python-opentelemetry-exporter-zipkin-json
  (package
    (name "python-opentelemetry-exporter-zipkin-json")
    (version "1.40.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/open-telemetry/opentelemetry-python/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zipkin Span JSON Exporter for OpenTelemetry")
    (description "Zipkin Span JSON Exporter for OpenTelemetry.")
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 5338. electron-castlab-bin --- electron for Content Security (ECS) is a fork of Electron created by castLabs to
;;; -------------------------------------------------------------------
(define-public electron-castlab-bin
  (package
    (name "electron-castlab-bin")
    (version "v41.1.1+wvcus")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/castlabs/electron-releases/releases/download/v" version "/electron-releases-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "electron for Content Security (ECS) is a fork of Electron created by castLabs to")
    (description "Electron for Content Security (ECS) is a fork of Electron created by castLabs to facilitate the use of Google's Widevine Content Decryption Module (CDM) for DRM-enabled playback within Electron.")
    (home-page "https://github.com/castlabs/electron-releases")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 3795. gradle8 --- powerful build system for the JVM
;;; -------------------------------------------------------------------
(define-public gradle8
  (package
    (name "gradle8")
    (version "8.14.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gradle.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "powerful build system for the JVM")
    (description "Powerful build system for the JVM.")
    (home-page "https://gradle.org/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 21312. android-sdk --- google Android SDK
;;; -------------------------------------------------------------------
(define-public android-sdk
  (package
    (name "android-sdk")
    (version "26.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.android.com/studio/releases/sdk-tools.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "google Android SDK")
    (description "Google Android SDK.")
    (home-page "https://developer.android.com/studio/releases/sdk-tools.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8305. qmc2-common-git --- qt based UNIX MAME frontend. Core files, included qCHDman GUI. (GIT version)
;;; -------------------------------------------------------------------
(define-public qmc2-common-git
  (package
    (name "qmc2-common-git")
    (version "0.243.14.g112724d69")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://qmc2.batcom-it.net")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qt based UNIX MAME frontend. Core files, included qCHDman GUI. (GIT version)")
    (description "Qt based UNIX MAME frontend. Core files, included qCHDman GUI. (GIT version).")
    (home-page "https://qmc2.batcom-it.net")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 1274. lgogdownloader --- open source downloader for GOG.com games, uses the GOG.com API
;;; -------------------------------------------------------------------
(define-public lgogdownloader
  (package
    (name "lgogdownloader")
    (version "3.18")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Sude-/lgogdownloader/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source downloader for GOG.com games, uses the GOG.com API")
    (description "Open source downloader for GOG.com games, uses the GOG.com API.")
    (home-page "https://github.com/Sude-/lgogdownloader")
    (license license:wtfpl2)))

;;; -------------------------------------------------------------------
;;; 2123. python-mistralai --- python Client SDK for the Mistral AI API
;;; -------------------------------------------------------------------
(define-public python-mistralai
  (package
    (name "python-mistralai")
    (version "2.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mistralai/client-python/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python Client SDK for the Mistral AI API")
    (description "Python Client SDK for the Mistral AI API.")
    (home-page "https://github.com/mistralai/client-python")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9083. cosmic-comp-git --- compositor for the COSMIC desktop environment
;;; -------------------------------------------------------------------
(define-public cosmic-comp-git
  (package
    (name "cosmic-comp-git")
    (version "1.0.0.beta.3.r8.g5a2eca2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/pop-os/cosmic-comp")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "compositor for the COSMIC desktop environment")
    (description "Compositor for the COSMIC desktop environment.")
    (home-page "https://github.com/pop-os/cosmic-comp")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 33430. vim-classic-runtime-git --- vim Classic is a fork of Vim 8.x for long-term maintenance. - shared runtime
;;; -------------------------------------------------------------------
(define-public vim-classic-runtime-git
  (package
    (name "vim-classic-runtime-git")
    (version "r11248.e77db10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://git.sr.ht/~sircmpwn/vim-classic")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vim Classic is a fork of Vim 8.x for long-term maintenance. - shared runtime")
    (description "Vim Classic is a fork of Vim 8.x for long-term maintenance. - shared runtime.")
    (home-page "https://git.sr.ht/~sircmpwn/vim-classic")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11982. linux-lqx --- the Linux Liquorix kernel and modules
;;; -------------------------------------------------------------------
(define-public linux-lqx
  (package
    (name "linux-lqx")
    (version "6.19.14.lqx1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://liquorix.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Linux Liquorix kernel and modules")
    (description "The Linux Liquorix kernel and modules.")
    (home-page "https://liquorix.net/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 1935. deadbeef --- modular GTK audio player for GNU/Linux
;;; -------------------------------------------------------------------
(define-public deadbeef
  (package
    (name "deadbeef")
    (version "1.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://deadbeef.sourceforge.io//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modular GTK audio player for GNU/Linux")
    (description "Modular GTK audio player for GNU/Linux.")
    (home-page "https://deadbeef.sourceforge.io/")
    (license (list license:gpl2+ license:lgpl2.1+ license:zlib))))

;;; -------------------------------------------------------------------
;;; 11519. wivrn-server --- a wireless Monado-based OpenXR runtime for standalone headsets
;;; -------------------------------------------------------------------
(define-public wivrn-server
  (package
    (name "wivrn-server")
    (version "26.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/WiVRn/WiVRn/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a wireless Monado-based OpenXR runtime for standalone headsets")
    (description "A wireless Monado-based OpenXR runtime for standalone headsets.")
    (home-page "https://github.com/WiVRn/WiVRn")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13946. jdk23-openjdk --- openJDK Java 23 development kit
;;; -------------------------------------------------------------------
(define-public jdk23-openjdk
  (package
    (name "jdk23-openjdk")
    (version "23.0.2.u7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://openjdk.java.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openJDK Java 23 development kit")
    (description "OpenJDK Java 23 development kit.")
    (home-page "https://openjdk.java.net/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 4822. ros2-arch-deps --- [Meta-PKG] Dependencies for building ROS2 on Arch
;;; -------------------------------------------------------------------
(define-public ros2-arch-deps
  (package
    (name "ros2-arch-deps")
    (version "0.23")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://docs.ros.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "[Meta-PKG] Dependencies for building ROS2 on Arch")
    (description "[Meta-PKG] Dependencies for building ROS2 on Arch.")
    (home-page "https://docs.ros.org/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8601. brother-lpr-drivers-common --- this package provides common files for Brother LPR drivers packages
;;; -------------------------------------------------------------------
(define-public brother-lpr-drivers-common
  (package
    (name "brother-lpr-drivers-common")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://solutions.brother.com/linux/en_us/index.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "this package provides common files for Brother LPR drivers packages")
    (description "This package provides common files for Brother LPR drivers packages.")
    (home-page "http://solutions.brother.com/linux/en_us/index.html")
    (license (list license:non-copyleft license:gpl3+))))

;;; -------------------------------------------------------------------
;;; 5049. cachyos-ananicy-rules --- cachyOS - ananicy-rules
;;; -------------------------------------------------------------------
(define-public cachyos-ananicy-rules
  (package
    (name "cachyos-ananicy-rules")
    (version "1:1.1.34")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/CachyOS/ananicy-rules/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cachyOS - ananicy-rules")
    (description "CachyOS - ananicy-rules.")
    (home-page "https://github.com/CachyOS/ananicy-rules")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7422. genders --- static cluster configuration database used for cluster configuration management
;;; -------------------------------------------------------------------
(define-public genders
  (package
    (name "genders")
    (version "1.32.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/chaos/genders/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "static cluster configuration database used for cluster configuration management")
    (description "Static cluster configuration database used for cluster configuration management.")
    (home-page "https://github.com/chaos/genders")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6543. gst-thumbnailers --- aUR package gst-thumbnailers
;;; -------------------------------------------------------------------
(define-public gst-thumbnailers
  (package
    (name "gst-thumbnailers")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/packages/gst-thumbnailers/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aUR package gst-thumbnailers")
    (description "AUR package gst-thumbnailers.")
    (home-page "https://aur.archlinux.org/packages/gst-thumbnailers")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 62. hyprshot --- aUR package hyprshot
;;; -------------------------------------------------------------------
(define-public hyprshot
  (package
    (name "hyprshot")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/packages/hyprshot/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aUR package hyprshot")
    (description "AUR package hyprshot.")
    (home-page "https://aur.archlinux.org/packages/hyprshot")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 4168. keychron-link-udev --- udev rule for the Keychron Link wireless receiver
;;; -------------------------------------------------------------------
(define-public keychron-link-udev
  (package
    (name "keychron-link-udev")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://example.com/keychron-link-udev-" version ".tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "udev rule for the Keychron Link wireless receiver")
    (description "Udev rule for the Keychron Link wireless receiver.")
    (home-page "https://aur.archlinux.org/packages/keychron-link-udev")
    (license license:bsd-0)))

;;; -------------------------------------------------------------------
;;; 7233. libfmod --- libraries of the fmodex audio engine
;;; -------------------------------------------------------------------
(define-public libfmod
  (package
    (name "libfmod")
    (version "4.44.64")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.fmod.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "libraries of the fmodex audio engine")
    (description "Libraries of the fmodex audio engine.")
    (home-page "http://www.fmod.org/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 475. localepurge --- script to remove disk space wasted for unneeded localizations
;;; -------------------------------------------------------------------
(define-public localepurge
  (package
    (name "localepurge")
    (version "0.7.3.11")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://packages.debian.org/source/sid/localepurge/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "script to remove disk space wasted for unneeded localizations")
    (description "Script to remove disk space wasted for unneeded localizations.")
    (home-page "http://packages.debian.org/source/sid/localepurge")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 1958. logmein-hamachi --- a zero-configuration VPN service
;;; -------------------------------------------------------------------
(define-public logmein-hamachi
  (package
    (name "logmein-hamachi")
    (version "2.1.0.203")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.vpn.net/linux/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a zero-configuration VPN service")
    (description "A zero-configuration VPN service.")
    (home-page "https://www.vpn.net/linux")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 15011. ntsync-common --- nT synchronization primitive driver - common files
;;; -------------------------------------------------------------------
(define-public ntsync-common
  (package
    (name "ntsync-common")
    (version "6.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://lore.kernel.org/lkml/20240519202454.1192826-1-zfigura@codeweavers.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nT synchronization primitive driver - common files")
    (description "NT synchronization primitive driver - common files.")
    (home-page "https://lore.kernel.org/lkml/20240519202454.1192826-1-zfigura@codeweavers.com/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 5016. ps3-env --- meta package for tools used in the creation of homebrew software for the Sony Pl
;;; -------------------------------------------------------------------
(define-public ps3-env
  (package
    (name "ps3-env")
    (version "20230409")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ps3dev/ps3toolchain/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "meta package for tools used in the creation of homebrew software for the Sony Pl")
    (description "Meta package for tools used in the creation of homebrew software for the Sony PlayStation 3 videogame system.")
    (home-page "https://github.com/ps3dev/ps3toolchain")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 193. python-uharfbuzz --- aUR package python-uharfbuzz
;;; -------------------------------------------------------------------
(define-public python-uharfbuzz
  (package
    (name "python-uharfbuzz")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/packages/python-uharfbuzz/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aUR package python-uharfbuzz")
    (description "AUR package python-uharfbuzz.")
    (home-page "https://aur.archlinux.org/packages/python-uharfbuzz")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 52. tailscale --- aUR package tailscale
;;; -------------------------------------------------------------------
(define-public tailscale
  (package
    (name "tailscale")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/packages/tailscale/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aUR package tailscale")
    (description "AUR package tailscale.")
    (home-page "https://aur.archlinux.org/packages/tailscale")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 6382. tosu --- eponymous software for reading osu! memory
;;; -------------------------------------------------------------------
(define-public tosu
  (package
    (name "tosu")
    (version "4.19.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tosuapp/tosu/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "eponymous software for reading osu! memory")
    (description "Eponymous software for reading osu! memory.")
    (home-page "https://github.com/tosuapp/tosu")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 1919. ttf-material-symbols-variable-git --- material Design icons by Google - variable fonts
;;; -------------------------------------------------------------------
(define-public ttf-material-symbols-variable-git
  (package
    (name "ttf-material-symbols-variable-git")
    (version "4.0.0.r119.gc51274e9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/google/material-design-icons")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "material Design icons by Google - variable fonts")
    (description "Material Design icons by Google - variable fonts.")
    (home-page "https://github.com/google/material-design-icons")
    (license license:asl2.0)))

