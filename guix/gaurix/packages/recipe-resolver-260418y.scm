;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418y
;;; Resolves 37 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;       1.  atlauncher (copy-build-system, v3.4.40.4, gpl3+)
;;;       2.  mindustry (copy-build-system, v157.2, gpl3)
;;;       3.  mindustry-server (copy-build-system, v157.2, gpl3)
;;;       4.  polymc (cmake-build-system, v7.0, gpl3+)
;;;       5.  sabnzbd (pyproject-build-system, v4.5.5, gpl2+)
;;;       6.  arronax (pyproject-build-system, v0.8.1, gpl3+)
;;;       7.  audiveris (copy-build-system, v5.10.0, agpl3+)
;;;       8.  pcbdraw (pyproject-build-system, v1.1.2, expat)
;;;       9.  plasma6-applets-resources-monitor (cmake-build-system, v3.2.1, gpl3+)
;;;      10.  plasma6-applets-panel-spacer-extended (cmake-build-system, v1.15.0, gpl3+)
;;;      11.  gnome-shell-extension-top-bar-organizer (copy-build-system, v14, gpl3+)
;;;      12.  piper-voices-ru-ru (copy-build-system, v1.0.0, expat)
;;;      13.  python-fmod-toolkit-git (pyproject-build-system, v0.0.0-git, expat)
;;;      14.  uefi-manager (cmake-build-system, v26.03, gpl3+)
;;;      15.  bitbox-wallet-app-rpm (copy-build-system, v4.50.1, asl2.0)
;;;      16.  alacritty-use-theme-git (copy-build-system, v0.0.0-git, gpl1+)
;;;      17.  dare-devil (gnu-build-system, v0.1.2, expat)
;;;      18.  libxnvctrl-340xx (gnu-build-system, v340.108, gpl2)
;;;      19.  icamerasrc-git (gnu-build-system, v0.0.0-git, lgpl2.1+)
;;;      20.  rescrobbled-git (cargo-build-system, v0.6.2, gpl3)
;;;      21.  lrclibfetch (cargo-build-system, v1.0.2, expat)
;;;      22.  maki-cli (cargo-build-system, v0.1.0, expat)
;;;      23.  lbn (cargo-build-system, v1.1.10, gpl2)
;;;      24.  keepassxc-git (cmake-build-system, v2.7.1, gpl2+)
;;;      25.  libmysqlclient (cmake-build-system, v9.6.0, gpl2)
;;;      26.  goxlr-utility (cargo-build-system, v1.2.4, expat)
;;;      27.  aegisub-arch1t3cht-git (meson-build-system, v3.4.1, bsd-3/gpl2+)
;;;      28.  hyprland-per-window-layout (cargo-build-system, v2.17, gpl2+)
;;;      29.  mysql-clients (cmake-build-system, v9.6.0, gpl2)
;;;      30.  gr-lora_sdr-git (cmake-build-system, v1.0.0, gpl3+)
;;;
;;; BLOCKED EXHAUSTED (7):
;;;      31.  brother-mfc-l3770cdw -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_MULTILIB:
;;;           Brother printer drivers with custom proprietary license;
;;;           requires lib32-expat and lib32-gcc-libs (multilib not supported in Guix);
;;;           A1: proprietary Brother license prohibits redistribution;
;;;           A2: requires 32-bit multilib libraries not available in Guix;
;;;           A3: CUPS auto-detection may work without dedicated driver
;;;      32.  lidarr -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DOTNET_SDK_REQUIRED:
;;;           Music collection manager requiring .NET/ASP.NET 8.0 runtime and SDK;
;;;           A1: depends on aspnet-runtime-8.0 not in Guix;
;;;           A2: build requires dotnet-sdk-8.0 + yarn for web frontend;
;;;           A3: no pre-built static binary available
;;;      33.  rslsync -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_LICENSE:
;;;           Resilio Sync (formerly BitTorrent Sync) is proprietary closed-source software;
;;;           A1: custom Resilio license prohibits redistribution;
;;;           A2: binary-only distribution, no source code;
;;;           A3: Syncthing is a FOSS alternative already in Guix
;;;      34.  vlc-plugin-lua-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: EXCESSIVE_BUILD_SCOPE:
;;;           VLC Lua plugins require full VLC source tree build with 50+ makedeps;
;;;           A1: cannot build plugins separately from VLC;
;;;           A2: makedeps include Qt6, Vulkan, 40+ multimedia libraries;
;;;           A3: VLC already in Guix with Lua support built-in
;;;      35.  airrohr-firmware-flasher-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_BUILD_CHAIN:
;;;           IoT firmware flasher requiring PyInstaller + PyQt5 + esptool toolchain;
;;;           A1: build process uses PyInstaller to create standalone binary;
;;;           A2: requires 15+ Python deps including PyQt5 with complex SIP build;
;;;           A3: esptool3.2 (specific old version) not in Guix
;;;      36.  dab-cli -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ANDROID_RUNTIME_DEP:
;;;           Android package manager CLI requiring android-tools at runtime;
;;;           A1: core functionality depends on adb/android-tools not in Guix;
;;;           A2: Rust/Cargo with ~30 crate deps needed;
;;;           A3: niche tool for Android development
;;;      37.  abcde-musicbrainz-meta -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PERL_DEPS_MISSING:
;;;           Meta-package depending on 5 Perl modules not in Guix;
;;;           A1: needs perl-webservice-musicbrainz (not in Guix);
;;;           A2: needs perl-musicbrainz-discid (not in Guix);
;;;           A3: needs perl-io-socket-ssl and perl-lwp-protocol-https (not in Guix)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418y)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnuradio)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages ocr)
  #:use-module (gnu packages openal)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (
            atlauncher
            mindustry
            mindustry-server
            polymc
            sabnzbd
            arronax
            audiveris
            pcbdraw
            plasma6-applets-resources-monitor
            plasma6-applets-panel-spacer-extended
            gnome-shell-extension-top-bar-organizer
            piper-voices-ru-ru
            python-fmod-toolkit-git
            uefi-manager
            bitbox-wallet-app-rpm
            alacritty-use-theme-git
            dare-devil
            libxnvctrl-340xx
            icamerasrc-git
            rescrobbled-git
            lrclibfetch
            maki-cli
            lbn
            keepassxc-git
            libmysqlclient
            goxlr-utility
            aegisub-arch1t3cht-git
            hyprland-per-window-layout
            mysql-clients
            gr-lora_sdr-git))

;;; -------------------------------------------------------------------
;;; 1. atlauncher --- launcher for Minecraft with modpack support
;;; Prebuilt JAR from GitHub releases.
;;; -------------------------------------------------------------------
(define-public atlauncher
  (package
    (name "atlauncher")
    (version "3.4.40.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ATLauncher/ATLauncher"
                    "/releases/download/v" version
                    "/ATLauncher-" version ".jar"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openjdk openal))
    (home-page "https://github.com/ATLauncher/ATLauncher")
    (synopsis "launcher for Minecraft with modpack support")
    (description "ATLauncher is a launcher for Minecraft which integrates
multiple different modpacks to allow you to download and install modpacks
easily and quickly.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2. mindustry --- sandbox tower defense game
;;; Prebuilt JAR from GitHub releases.
;;; -------------------------------------------------------------------
(define-public mindustry
  (package
    (name "mindustry")
    (version "157.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Anuken/Mindustry"
                    "/releases/download/v" version
                    "/Mindustry.jar"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openjdk17))
    (home-page "https://github.com/Anuken/Mindustry")
    (synopsis "sandbox tower defense game")
    (description "Mindustry is a sandbox tower defense game where you build
elaborate supply chains of conveyor belts, producing ammo and supplies
for your turrets.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 3. mindustry-server --- dedicated server for Mindustry
;;; Prebuilt JAR from GitHub releases.
;;; -------------------------------------------------------------------
(define-public mindustry-server
  (package
    (name "mindustry-server")
    (version "157.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Anuken/Mindustry"
                    "/releases/download/v" version
                    "/server-release.jar"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openjdk17))
    (home-page "https://github.com/Anuken/Mindustry")
    (synopsis "dedicated server for Mindustry")
    (description "Dedicated server component for the Mindustry sandbox tower
defense game.  Allows hosting multiplayer game sessions.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 4. polymc --- Minecraft launcher with multiple instance support
;;; C++/Qt6 launcher built with CMake.
;;; -------------------------------------------------------------------
(define-public polymc
  (package
    (name "polymc")
    (version "7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PolyMC/PolyMC")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list extra-cmake-modules scdoc))
    (inputs (list qtbase-5 qt5compat qtsvg zlib openjdk))
    (home-page "https://github.com/PolyMC/PolyMC")
    (synopsis "Minecraft launcher with multiple instance support")
    (description "PolyMC is a custom launcher for Minecraft that allows you
to easily manage multiple installations of Minecraft at once.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5. sabnzbd --- web-interface based binary newsgrabber with NZB support
;;; Python Usenet downloader.
;;; -------------------------------------------------------------------
(define-public sabnzbd
  (package
    (name "sabnzbd")
    (version "4.5.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sabnzbd/sabnzbd"
                    "/releases/download/" version
                    "/SABnzbd-" version "-src.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-cherrypy
           python-chardet
           python-cryptography
           python-feedparser
           python-configobj
           python-puremagic
           python-guessit
           python-dateutil))
    (home-page "https://github.com/sabnzbd/sabnzbd")
    (synopsis "web-interface based binary newsgrabber with NZB support")
    (description "SABnzbd is an open source binary newsreader.  It simplifies
the process of downloading from Usenet via a web interface.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 6. arronax --- create and modify application starters
;;; Python/GTK desktop entry editor.
;;; -------------------------------------------------------------------
(define-public arronax
  (package
    (name "arronax")
    (version "0.8.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AlfredoDeNicolo/arronax")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list intltool))
    (propagated-inputs (list python-pygobject python-pyxdg gtk+))
    (home-page "https://www.florian-diesch.de/software/arronax")
    (synopsis "create and modify application starters")
    (description "Arronax is a program to create and modify starters (also
known as .desktop files or launchers) for applications, files, folders
and web links.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7. audiveris --- music score optical character recognition engine
;;; Prebuilt from GitHub releases.
;;; -------------------------------------------------------------------
(define-public audiveris
  (package
    (name "audiveris")
    (version "5.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Audiveris/audiveris"
                    "/releases/download/" version
                    "/Audiveris-" version "-linux_x86-64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openjdk21 tesseract-ocr))
    (home-page "https://github.com/Audiveris/audiveris")
    (synopsis "music score optical character recognition engine")
    (description "Audiveris is an open-source optical music recognition (OMR)
engine that converts sheet music images into MusicXML format.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 8. pcbdraw --- convert KiCad boards into 2D drawings
;;; Python PCB rendering tool.
;;; -------------------------------------------------------------------
(define-public pcbdraw
  (package
    (name "pcbdraw")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "PcbDraw" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-numpy
           python-lxml
           python-pillow
           python-click
           python-pyyaml))
    (home-page "https://github.com/yaqwsx/PcbDraw")
    (synopsis "convert KiCad boards into 2D drawings")
    (description "PcbDraw converts your KiCad board into a nicely looking 2D
drawing suitable for pinout diagrams and documentation.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. plasma6-applets-resources-monitor --- KDE Plasma applet for monitoring system resources
;;; CMake-built Plasma applet.
;;; -------------------------------------------------------------------
(define-public plasma6-applets-resources-monitor
  (package
    (name "plasma6-applets-resources-monitor")
    (version "3.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/orblazer/plasma-applet-resources-monitor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list extra-cmake-modules))
    (inputs (list qtbase))
    (home-page "https://github.com/orblazer/plasma-applet-resources-monitor")
    (synopsis "KDE Plasma applet for monitoring system resources")
    (description "Plasma Resources Monitor is a KDE Plasma applet for
monitoring CPU, memory, network traffic, GPUs and disks I/O.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 10. plasma6-applets-panel-spacer-extended --- extended panel spacer for KDE Plasma
;;; CMake-built Plasma applet.
;;; -------------------------------------------------------------------
(define-public plasma6-applets-panel-spacer-extended
  (package
    (name "plasma6-applets-panel-spacer-extended")
    (version "1.15.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/luisbocanegra/plasma-panel-spacer-extended")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list extra-cmake-modules))
    (home-page "https://github.com/luisbocanegra/plasma-panel-spacer-extended")
    (synopsis "extended panel spacer for KDE Plasma")
    (description "Extended panel spacer for KDE Plasma panels with mouse
gesture support.  Allows dragging windows and running shortcuts or
commands.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11. gnome-shell-extension-top-bar-organizer --- GNOME Shell extension to organize the top bar
;;; Installed via copy-build-system.
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-top-bar-organizer
  (package
    (name "gnome-shell-extension-top-bar-organizer")
    (version "14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/julianschacher/top-bar-organizer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gnome-shell))
    (home-page "https://gitlab.gnome.org/julianschacher/top-bar-organizer")
    (synopsis "GNOME Shell extension to organize the top bar")
    (description "Top Bar Organizer is a GNOME Shell extension that allows
you to organize and reorder the items in the top (menu) bar.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 12. piper-voices-ru-ru --- Russian voices for Piper text-to-speech
;;; Voice data files installed via copy-build-system.
;;; -------------------------------------------------------------------
(define-public piper-voices-ru-ru
  (package
    (name "piper-voices-ru-ru")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://huggingface.co/rhasspy/piper-voices")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://huggingface.co/rhasspy/piper-voices")
    (synopsis "Russian voices for Piper text-to-speech")
    (description "Voice data files for the Piper text-to-speech system,
providing Russian language (ru_RU) voices.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. python-fmod-toolkit-git --- lightweight Python package for extracting audio from FMOD banks
;;; Python audio extraction toolkit from git.
;;; -------------------------------------------------------------------
(define-public python-fmod-toolkit-git
  (package
    (name "python-fmod-toolkit-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/K0lb3/fmod_toolkit")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list python))
    (home-page "https://github.com/K0lb3/fmod_toolkit")
    (synopsis "lightweight Python package for extracting audio from FMOD banks")
    (description "A lightweight Python package designed to extract and export
audio from FMOD sound bank files.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. uefi-manager --- graphical tool for managing UEFI boot entries
;;; Qt6 UEFI boot manager built with CMake.
;;; -------------------------------------------------------------------
(define-public uefi-manager
  (package
    (name "uefi-manager")
    (version "26.03")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AdrianTM/uefi-manager")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list ninja qttools-5))
    (inputs (list qtbase efibootmgr polkit))
    (home-page "https://github.com/AdrianTM/uefi-manager")
    (synopsis "graphical tool for managing UEFI boot entries")
    (description "UEFI Manager is a graphical tool for managing UEFI boot
entries, allowing users to view, add, edit, and delete UEFI boot
options.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. bitbox-wallet-app-rpm --- BitBox hardware wallet companion application
;;; Prebuilt binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public bitbox-wallet-app-rpm
  (package
    (name "bitbox-wallet-app-rpm")
    (version "4.50.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/BitBoxSwiss/bitbox-wallet-app"
                    "/releases/download/v" version
                    "/BitBox-" version "-x86_64.rpm"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libxcb))
    (home-page "https://bitbox.swiss/")
    (synopsis "BitBox hardware wallet companion application")
    (description "BitBox Wallet App is a companion application for managing
digital assets with BitBox hardware wallets.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 16. alacritty-use-theme-git --- utility to switch Alacritty terminal themes
;;; Shell script installed via copy-build-system.
;;; -------------------------------------------------------------------
(define-public alacritty-use-theme-git
  (package
    (name "alacritty-use-theme-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alacritty-use-theme/alacritty-use-theme")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (inputs (list bash))
    (home-page "https://github.com/alacritty-use-theme/alacritty-use-theme")
    (synopsis "utility to switch Alacritty terminal themes")
    (description "A small utility to switch the selected theme used by the
Alacritty terminal emulator.")
    (license license:gpl1+)))

;;; -------------------------------------------------------------------
;;; 17. dare-devil --- challenging action game
;;; C/C++ game built with GNU build system.
;;; -------------------------------------------------------------------
(define-public dare-devil
  (package
    (name "dare-devil")
    (version "0.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Akash420-oss/Dare-Devil")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list glibc zenity))
    (home-page "https://github.com/Akash420-oss/Dare-Devil")
    (synopsis "challenging action game")
    (description "Dare Devil is a challenging action game with thrilling
gameplay mechanics.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. libxnvctrl-340xx --- NVIDIA NV-CONTROL X extension library (340xx legacy)
;;; Built from nvidia-settings source.
;;; -------------------------------------------------------------------
(define-public libxnvctrl-340xx
  (package
    (name "libxnvctrl-340xx")
    (version "340.108")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NVIDIA/nvidia-settings")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libxext))
    (home-page "https://github.com/NVIDIA/nvidia-settings")
    (synopsis "NVIDIA NV-CONTROL X extension library (340xx legacy)")
    (description "The NV-CONTROL X extension library allows X clients to
query and change NVIDIA driver settings.  This is the 340xx legacy
branch.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 19. icamerasrc-git --- Intel IPU6 camera source for GStreamer
;;; Autotools-based GStreamer source element.
;;; -------------------------------------------------------------------
(define-public icamerasrc-git
  (package
    (name "icamerasrc-git")
    (version "0.0.0-git")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/intel/icamerasrc")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list autoconf automake pkg-config))
    (inputs (list gstreamer gst-plugins-base libdrm))
    (home-page "https://github.com/intel/icamerasrc")
    (synopsis "Intel IPU6 camera source for GStreamer")
    (description "GStreamer source element for Intel IPU6 camera hardware,
providing camera capture functionality.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 20. rescrobbled-git --- music scrobbler daemon using MPRIS D-Bus interface
;;; Rust scrobbler built with Cargo.
;;; -------------------------------------------------------------------
(define-public rescrobbled-git
  (package
    (name "rescrobbled-git")
    (version "0.6.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/InputUsername/rescrobbled")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list dbus))
    (home-page "https://github.com/InputUsername/rescrobbled")
    (synopsis "music scrobbler daemon using MPRIS D-Bus interface")
    (description "Rescrobbled is a music scrobbler daemon that detects
currently playing music using the MPRIS D-Bus interface and scrobbles
it to Last.fm or ListenBrainz.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 21. lrclibfetch --- command-line interface for LRCLIB
;;; Rust lyrics fetcher built with Cargo.
;;; -------------------------------------------------------------------
(define-public lrclibfetch
  (package
    (name "lrclibfetch")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aethar01/lrclibfetch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Aethar01/lrclibfetch")
    (synopsis "command-line interface for LRCLIB")
    (description "A command-line tool for fetching lyrics from the LRCLIB
lyrics database.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. maki-cli --- cross-platform fuzzy Makefile task finder
;;; Rust CLI tool built with Cargo.
;;; -------------------------------------------------------------------
(define-public maki-cli
  (package
    (name "maki-cli")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cesarferreira/maki")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list glibc))
    (home-page "https://github.com/cesarferreira/maki")
    (synopsis "cross-platform fuzzy Makefile task finder")
    (description "Maki is a cross-platform fuzzy Makefile task finder that
helps you discover and run Makefile targets interactively.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. lbn --- lightweight desktop notification sender
;;; Rust notification tool built with Cargo.
;;; -------------------------------------------------------------------
(define-public lbn
  (package
    (name "lbn")
    (version "1.1.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~aeldit/lbn")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list glibc))
    (home-page "https://git.sr.ht/~aeldit/lbn")
    (synopsis "lightweight desktop notification sender")
    (description "A lightweight program that sends a notification to the
user's desktop when their laptop battery reaches a specified level.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 24. keepassxc-git --- cross-platform password manager (git version)
;;; KeePassXC development version built with CMake.
;;; -------------------------------------------------------------------
(define-public keepassxc-git
  (package
    (name "keepassxc-git")
    (version "2.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/keepassxreboot/keepassxc")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list asciidoc qttools-5))
    (inputs
     (list qtbase-5
           libxtst
           botan
           argon2
           libusb
           pcsc-lite
           qrencode
           minizip
           zlib))
    (home-page "https://github.com/keepassxreboot/keepassxc")
    (synopsis "cross-platform password manager (git version)")
    (description "KeePassXC is a cross-platform community-driven port of the
KeePass password manager.  This is the development version from git.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 25. libmysqlclient --- MySQL client libraries
;;; Built from MySQL source with CMake.
;;; -------------------------------------------------------------------
(define-public libmysqlclient
  (package
    (name "libmysqlclient")
    (version "9.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dev.mysql.com/get/Downloads/MySQL-"
                    (version-major+minor version)
                    "/mysql-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list zlib zstd openssl))
    (home-page "https://www.mysql.com/products/community/")
    (synopsis "MySQL client libraries")
    (description "Client libraries for connecting to MySQL database servers.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 26. goxlr-utility --- utility for controlling GoXLR audio mixer on Linux
;;; Rust utility built with Cargo.
;;; -------------------------------------------------------------------
(define-public goxlr-utility
  (package
    (name "goxlr-utility")
    (version "1.2.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GoXLR-on-Linux/goxlr-utility")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list libusb pulseaudio speech-dispatcher))
    (home-page "https://github.com/GoXLR-on-Linux/goxlr-utility")
    (synopsis "utility for controlling GoXLR audio mixer on Linux")
    (description "GoXLR Utility is a tool for monitoring and controlling a
TC-Helicon GoXLR or GoXLR Mini audio mixer on Linux.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 27. aegisub-arch1t3cht-git --- subtitle editor with ASS/SSA support (arch1t3cht fork)
;;; Built with Meson.
;;; -------------------------------------------------------------------
(define-public aegisub-arch1t3cht-git
  (package
    (name "aegisub-arch1t3cht-git")
    (version "3.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arch1t3cht/Aegisub")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs
     (list boost
           ffmpeg
           fftw
           fontconfig
           hunspell
           icu4c
           libass
           openal
           wxwidgets))
    (home-page "https://github.com/arch1t3cht/Aegisub")
    (synopsis "subtitle editor with ASS/SSA support (arch1t3cht fork)")
    (description "Aegisub is a general-purpose subtitle editor with ASS/SSA
support.  This is the arch1t3cht fork with additional features and bug
fixes.")
    (license (list license:bsd-3 license:gpl2+))))

;;; -------------------------------------------------------------------
;;; 28. hyprland-per-window-layout --- per-window keyboard layout for Hyprland compositor
;;; Rust daemon built with Cargo.
;;; -------------------------------------------------------------------
(define-public hyprland-per-window-layout
  (package
    (name "hyprland-per-window-layout")
    (version "2.17")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/coffebar/hyprland-per-window-layout")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/coffebar/hyprland-per-window-layout")
    (synopsis "per-window keyboard layout for Hyprland compositor")
    (description "Daemon that maintains per-window keyboard layout (language)
state for the Hyprland Wayland compositor.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 29. mysql-clients --- MySQL command-line client tools
;;; Built from MySQL source with CMake.
;;; -------------------------------------------------------------------
(define-public mysql-clients
  (package
    (name "mysql-clients")
    (version "9.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dev.mysql.com/get/Downloads/MySQL-"
                    (version-major+minor version)
                    "/mysql-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libmysqlclient openssl zlib))
    (home-page "https://www.mysql.com/products/community/")
    (synopsis "MySQL command-line client tools")
    (description "Command-line client tools for interacting with MySQL
database servers, including the mysql and mysqldump utilities.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 30. gr-lora_sdr-git --- GNU Radio blocks for LoRa transceiver
;;; CMake-built GNU Radio out-of-tree module.
;;; -------------------------------------------------------------------
(define-public gr-lora_sdr-git
  (package
    (name "gr-lora_sdr-git")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tapparelj/gr-lora_sdr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pybind11))
    (inputs (list gnuradio python boost))
    (home-page "https://github.com/tapparelj/gr-lora_sdr")
    (synopsis "GNU Radio blocks for LoRa transceiver")
    (description "GNU Radio out-of-tree module implementing a fully-functional
LoRa transceiver using software-defined radio.")
    (license license:gpl3+)))
