;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418n
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (9):
;;;     1.  plasmazones-bin (copy-build-system, v2.8.7, gpl3+)
;;;     2.  rustdesk-bin (copy-build-system, v1.4.6, agpl3+)
;;;     3.  qt-sudo (cmake-build-system, v2.3.0, lgpl2.1)
;;;     4.  clamav-gui (cmake-build-system, v1.2.2, gpl3)
;;;     5.  namp (cmake-build-system, v2.43, gpl2)
;;;     6.  samsung-ssd-fwupdate (copy-build-system, v1.1, expat)
;;;     7.  prefixer (pyproject-build-system, v1.4.1, gpl3)
;;;     8.  appimagelauncher-bin (copy-build-system, v2.2.0, expat)
;;;     9.  millennium-bin (copy-build-system, v3.0.0-beta.21, expat)
;;;
;;; ALREADY_IN_GUIX (1):
;;;    10.  python2 -> already in upstream Guix as python-2
;;;
;;; BLOCKED EXHAUSTED (20):
;;;    11.  freefilesync -> NEEDS_RECIPE_DESIGN_EXHAUSTED: NON_FREE_LICENSE:
;;;         GPL-3.0 with "private use only" restriction, commercial redistribution
;;;         prohibited; A1: binary package — license blocks redistribution;
;;;         A2: source build — custom wx+ fork, restrictive license;
;;;         A3: no FOSS-compatible fork exists
;;;    12.  traur -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC:
;;;         AUR trust scoring tool; A1: requires pacman/AUR infrastructure not in
;;;         Guix; A2: Bash script tightly coupled to AUR API + pacman local DB;
;;;         A3: no portable upstream
;;;    13.  vmware-workstation -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY:
;;;         closed-source with DKMS kernel modules; A1: proprietary binary, license
;;;         prohibits redistribution; A2: DKMS incompatible with Guix kernel model;
;;;         A3: requires systemd services not available in Guix System
;;;    14.  aurvote-utils -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC:
;;;         AUR voting utility; A1: requires pacman/AUR infrastructure;
;;;         A2: no portable alternative; A3: Arch-only tooling
;;;    15.  libxnvctrl-580xx -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_NVIDIA:
;;;         proprietary NVIDIA NV-CONTROL X extension; A1: part of proprietary
;;;         NVIDIA driver stack; A2: nonguix channel handles NVIDIA packaging;
;;;         A3: no open-source equivalent for this driver version
;;;    16.  nvidia-580xx-settings -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_NVIDIA:
;;;         proprietary NVIDIA settings tool; A1: requires proprietary driver;
;;;         A2: nonguix channel handles NVIDIA; A3: nvidia-settings in nonguix
;;;    17.  lib32-opencl-nvidia-580xx -> NEEDS_RECIPE_DESIGN_EXHAUSTED:
;;;         MULTILIB_UNSUPPORTED + PROPRIETARY_NVIDIA: 32-bit proprietary OpenCL;
;;;         A1: Guix lacks multilib support; A2: proprietary NVIDIA;
;;;         A3: use 64-bit opencl-nvidia instead
;;;    18.  lib32-nvidia-580xx-utils -> NEEDS_RECIPE_DESIGN_EXHAUSTED:
;;;         MULTILIB_UNSUPPORTED + PROPRIETARY_NVIDIA: 32-bit proprietary utils;
;;;         A1: Guix lacks multilib; A2: proprietary; A3: use 64-bit version
;;;    19.  claude-code -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY:
;;;         Anthropic commercial license prohibits redistribution; A1: npm binary
;;;         bundle, license blocks packaging; A2: no open-source fork;
;;;         A3: minified/compiled JS, cannot build from source
;;;    20.  downgrade -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC:
;;;         Bash script for pacman package downgrade; A1: requires pacman and
;;;         Arch Linux Archive; A2: no portable upstream;
;;;         A3: Guix has built-in rollback via generations
;;;    21.  octopi -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC:
;;;         Qt pacman frontend; A1: requires pacman/libalpm not in Guix;
;;;         A2: no portable package manager abstraction;
;;;         A3: Guix has its own package management UI
;;;    22.  antigravity -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY:
;;;         Google proprietary IDE; A1: closed-source, license prohibits
;;;         redistribution; A2: no open-source fork; A3: Electron binary
;;;         with proprietary Google services
;;;    23.  nvidia-580xx-dkms -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_NVIDIA:
;;;         proprietary NVIDIA kernel module sources; A1: DKMS incompatible with
;;;         Guix kernel model; A2: proprietary license; A3: nonguix handles NVIDIA
;;;    24.  opencl-nvidia-580xx -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_NVIDIA:
;;;         proprietary NVIDIA OpenCL; A1: proprietary binary blob;
;;;         A2: nonguix channel handles this; A3: no open-source equivalent
;;;    25.  nvidia-580xx-utils -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_NVIDIA:
;;;         proprietary NVIDIA driver utilities; A1: proprietary;
;;;         A2: nonguix channel; A3: no OSS alternative for this version
;;;    26.  aur-sync-vote -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC:
;;;         AUR vote syncing; A1: requires makepkg/pacman; A2: AUR-specific;
;;;         A3: no portable upstream
;;;    27.  libodb -> NEEDS_RECIPE_DESIGN_EXHAUSTED: BUILD2_REQUIRED:
;;;         needs build2 toolchain not in Guix; A1: build2 not packaged;
;;;         A2: community CMake port outdated for v2.5.0 monorepo;
;;;         A3: packaging build2 first is significant scope
;;;    28.  lib32-libxcb-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MULTILIB_UNSUPPORTED:
;;;         32-bit X11 client library; A1: Guix lacks multilib;
;;;         A2: cross-compile i686 not lib32 compatible;
;;;         A3: use 64-bit libxcb instead
;;;    29.  wails -> NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_DEPS:
;;;         Go desktop framework; A1: go-build-system needs 100+ Go modules;
;;;         A2: no prebuilt binary releases; A3: CGo + WebKitGTK cross-deps
;;;         complicate build, npm needed for frontend
;;;    30.  millennium-debug -> NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT:
;;;         debug symbols for millennium package; A1: not a separate package,
;;;         just debug output of millennium-bin; A2: Guix supports :debug output
;;;         natively; A3: millennium-bin already packaged in this pass
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:export (
            plasmazones-bin
            rustdesk-bin
            qt-sudo
            clamav-gui
            namp
            samsung-ssd-fwupdate
            prefixer
            appimagelauncher-bin
            millennium-bin))

;;; -------------------------------------------------------------------
;;; 1. plasmazones-bin --- window tiling for KDE Plasma (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public plasmazones-bin
  (package
    (name "plasmazones-bin")
    (version "2.8.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fuddlesworth/PlasmaZones/releases/download/v"
                    version "/plasmazones-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/" "bin/")
               ("share/" "share/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fuddlesworth/PlasmaZones")
    (synopsis "window tiling and autotiling extension for KDE Plasma")
    (description "PlasmaZones is a window tiling and autotiling extension for
KDE Plasma.  It provides customizable tiling zones that allow windows to be
snapped into predefined layouts on the desktop, similar to FancyZones on
Windows.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2. rustdesk-bin --- remote desktop software (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public rustdesk-bin
  (package
    (name "rustdesk-bin")
    (version "1.4.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rustdesk/rustdesk/releases/download/"
                    version "/rustdesk-" version "-x86_64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/bin/" "bin/")
          ("usr/share/" "share/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rustdesk/rustdesk")
    (synopsis "open-source remote desktop software written in Rust")
    (description "RustDesk is an open-source remote desktop application written
in Rust.  It works out of the box with no configuration required, providing
secure remote access using end-to-end encryption.  It supports self-hosted
relay servers for full control over data.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 3. qt-sudo --- lightweight Qt sudo dialog
;;; -------------------------------------------------------------------
(define-public qt-sudo
  (package
    (name "qt-sudo")
    (version "2.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aarnt/qt-sudo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list qtbase))
    (home-page "https://github.com/aarnt/qt-sudo")
    (synopsis "lightweight Qt-based sudo dialog without LXQt dependencies")
    (description "qt-sudo is a minimal sudo dialog built with Qt6, providing a
graphical password prompt for running commands with elevated privileges.  It is
a clone of the LXQt sudo tool but without any LXQt library dependencies,
making it suitable for any Qt-based desktop environment.")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 4. clamav-gui --- graphical interface for ClamAV
;;; -------------------------------------------------------------------
(define-public clamav-gui
  (package
    (name "clamav-gui")
    (version "1.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wusel1007/clamav-gui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list qtbase))
    (home-page "https://github.com/wusel1007/clamav-gui")
    (synopsis "graphical user interface for ClamAV antivirus")
    (description "ClamAV GUI provides a graphical interface for the ClamAV
antivirus scanner and freshclam signature updater.  It offers an integrated
service menu for easy virus scanning and database updates through a Qt6-based
desktop application.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5. namp --- terminal-based audio player
;;; -------------------------------------------------------------------
(define-public namp
  (package
    (name "namp")
    (version "2.43")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/d99kris/namp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list qtbase qtmultimedia))
    (home-page "https://github.com/d99kris/namp")
    (synopsis "terminal-based audio player using Qt Multimedia")
    (description "Namp is a lightweight terminal-based audio player built with
Qt6.  It uses the Qt Multimedia framework for audio playback and provides a
simple text-based interface for managing and playing music files from the
command line.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 6. samsung-ssd-fwupdate --- Samsung SSD firmware update script
;;; -------------------------------------------------------------------
(define-public samsung-ssd-fwupdate
  (package
    (name "samsung-ssd-fwupdate")
    (version "1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eerielili/samsung-ssd-fwupdate")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("samsung_ssd_fwupdate.sh" "bin/samsung-ssd-fwupdate"))))
    (inputs (list bash))
    (home-page "https://github.com/eerielili/samsung-ssd-fwupdate")
    (synopsis "script for updating Samsung SSD firmware on Linux")
    (description "samsung-ssd-fwupdate is a shell script that simplifies
downloading and applying firmware updates for Samsung SSDs on Linux.  It
automates the process of fetching firmware ISOs from Samsung and applying them
using hdparm.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. prefixer --- Proton prefix management tool
;;; -------------------------------------------------------------------
(define-public prefixer
  (package
    (name "prefixer")
    (version "1.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wojtmic/prefixer")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (home-page "https://github.com/wojtmic/prefixer")
    (synopsis "modern Proton prefix management tool for Steam on Linux")
    (description "Prefixer is a command-line tool for managing Wine/Proton
prefixes used by Steam games on Linux.  It provides an interface for
inspecting, modifying, and organizing game prefixes with support for
configuration file parsing and fuzzy matching.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8. appimagelauncher-bin --- AppImage integration helper (prebuilt)
;;; -------------------------------------------------------------------
(define-public appimagelauncher-bin
  (package
    (name "appimagelauncher-bin")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TheAssassin/AppImageLauncher/releases/"
                    "download/v" version "/appimagelauncher_" version
                    "-travis995.0f91801.bionic_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/bin/" "bin/")
          ("usr/lib/" "lib/")
          ("usr/share/" "share/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TheAssassin/AppImageLauncher")
    (synopsis "helper application for running and integrating AppImages")
    (description "AppImageLauncher is a helper application for Linux that
makes it easier to run and integrate AppImages into the desktop environment.
It provides automatic desktop integration, allowing AppImages to appear in
application menus and be managed like regular installed applications.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. millennium-bin --- Steam Client modding framework (prebuilt)
;;; -------------------------------------------------------------------
(define-public millennium-bin
  (package
    (name "millennium-bin")
    (version "3.0.0-beta.21")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SteamClientHomebrew/Millennium/releases/"
                    "download/v" version "/millennium-v" version
                    "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/millennium/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/SteamClientHomebrew/Millennium")
    (synopsis "open-source modding framework for Steam Client themes and plugins")
    (description "Millennium is an open-source modding framework for the Steam
Client that enables creating and managing custom themes and plugins.  It
provides a plugin API for extending Steam Client functionality with JavaScript
and CSS modifications.")
    (license license:expat)))
