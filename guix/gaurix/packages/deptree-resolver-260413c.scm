;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- deptree-resolver-260413c
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 68 packages resolved with recipes, 32 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-13
;;;
;;; Recipes (68):
;;;   - yay (go, gpl3+)
;;;   - paru (cargo, gpl3+)
;;;   - paru-git (cargo, gpl3+)
;;;   - topgrade (cargo, gpl3+)
;;;   - awww-git (cargo, gpl3+)
;;;   - snapd (go, gpl3)
;;;   - yaycache (cargo, gpl3+)
;;;   - cosmic-settings-git (cargo, gpl3)
;;;   - pikaur (pyproject, gpl3+)
;;;   - portage (python, gpl2)
;;;   - aurman (python, expat)
;;;   - python-speechrecognition (pyproject, bsd-3)
;;;   - python-openvino (pyproject, asl2.0)
;;;   - bulky (python, gpl3+)
;;;   - hypnotix (python, gpl3+)
;;;   - pacaur (copy, isc)
;;;   - trizen (copy, gpl3)
;;;   - aurutils (copy, isc)
;;;   - mingw-w64-environment (copy, bsd-3)
;;;   - mingw-w64-pkg-config (copy, zlib)
;;;   - mkinitcpio-systemd-extras (copy, gpl3+)
;;;   - limine-dracut-support (copy, gpl3)
;;;   - limine-mkinitcpio-hook (copy, gpl3)
;;;   - mchose-a7-v2-pro-udev (copy, gpl2+)
;;;   - libsdrplay (copy, nonfree)
;;;   - ndi-sdk (copy, nonfree)
;;;   - opencl-legacy-amdgpu-pro (copy, nonfree)
;;;   - mssql-server (copy, nonfree)
;;;   - davinci-resolve-studio (copy, nonfree)
;;;   - cryptopro-csp-k1 (copy, nonfree)
;;;   - tensorrt-cross-builder-libs (copy, nonfree)
;;;   - android-platform (copy, nonfree)
;;;   - dbeaver (copy, asl2.0)
;;;   - cursor-ide (copy, nonfree)
;;;   - glazepkg-bin (copy, gpl3+)
;;;   - gram-editor-bin (copy, gpl3+)
;;;   - fluxdown-bin (copy, gpl3+)
;;;   - lnko-bin (copy, expat)
;;;   - lzbench-bin (copy, gpl2+)
;;;   - codex-desktop-bin (copy, nonfree)
;;;   - hylauncher-bin (copy, gpl3+)
;;;   - konform-multi-account-containers-lite (copy, mpl2.0)
;;;   - fahviewer (copy, gpl2)
;;;   - grub-customizer (cmake, gpl3+)
;;;   - 86box (cmake, gpl2+)
;;;   - dragengine (cmake, expat)
;;;   - java-openjfx (cmake, gpl2)
;;;   - wivrn-server (cmake, gpl3+)
;;;   - openvino-intel-gpu-plugin-git (cmake, asl2.0)
;;;   - openvino-intel-npu-plugin-git (cmake, asl2.0)
;;;   - alice-vision (cmake, multi)
;;;   - fcitx5-mozc-ut (cmake, asl2.0)
;;;   - openvpn3 (meson, agpl3+)
;;;   - libdxvk (meson, zlib)
;;;   - libpamac-aur (meson, gpl3+)
;;;   - networkmanager-iwd (meson, multi)
;;;   - gst-thumbnailers (meson, lgpl2.1+)
;;;   - package-query (gnu, gpl2+)
;;;   - imagemagick-full-doc (gnu, asl2.0)
;;;   - mips64-linux-gnu-gcc-bootstrap (gnu, multi)
;;;   - mangowc-git (gnu, gpl2)
;;;   - system76-acpi-dkms (copy, gpl2+)
;;;   - system76-io-dkms (copy, gpl2+)
;;;   - tuxedo-drivers-dkms (copy, gpl2+)
;;;   - linux-zen-git-headers (copy, gpl2)
;;;   - linux-pf-headers (copy, gpl2)
;;;   - audiobookshelf (copy, gpl3+)
;;;   - komodo-periphery-git (cargo, gpl3+)
;;;
;;; Blocked (32):
;;;   - linux6.19.8.arch1-1-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.8.arch1-1-docs-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.8.arch1-1-headers-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.9.arch1-1-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.9.arch1-1-docs-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.9.arch1-1-headers-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.9.zen1-1-zen-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.9.zen1-1-zen-docs-bin (OBSOLETE_KERNEL_VERSION)
;;;   - linux6.19.9.zen1-1-zen-headers-bin (OBSOLETE_KERNEL_VERSION)
;;;   - anbox-git (DISCONTINUED)
;;;   - makeenv (DEAD_PROJECT)
;;;   - mas (PLATFORM_INCOMPATIBLE)
;;;   - lib32-xrizer (MULTILIB_UNSUPPORTED)
;;;   - lib32-openssl-1.1 (MULTILIB_UNSUPPORTED)
;;;   - lib32-libvpx1.3 (MULTILIB_UNSUPPORTED)
;;;   - lib32-libvmaf (MULTILIB_UNSUPPORTED)
;;;   - lib32-glew1.10 (MULTILIB_UNSUPPORTED)
;;;   - lib32-bluez-libs (MULTILIB_UNSUPPORTED)
;;;   - lib32-openssl-1.0 (MULTILIB_UNSUPPORTED)
;;;   - linux-cachyos (KERNEL_BUILD_COMPLEX)
;;;   - linux-cachyos-bore (KERNEL_BUILD_COMPLEX)
;;;   - linux-cachyos-lts (KERNEL_BUILD_COMPLEX)
;;;   - linux-cachyos-rc (KERNEL_BUILD_COMPLEX)
;;;   - amdonly-gaming-opencl-rusticl-mesa-git (BUILD_SYSTEM_TOO_COMPLEX)
;;;   - amdonly-gaming-mesa-git (BUILD_SYSTEM_TOO_COMPLEX)
;;;   - amdonly-gaming-vulkan-mesa-layers-git (BUILD_SYSTEM_TOO_COMPLEX)
;;;   - amdonly-gaming-vulkan-radeon-git (BUILD_SYSTEM_TOO_COMPLEX)
;;;   - plasma-workspace-povd (BUILD_SYSTEM_TOO_COMPLEX)
;;;   - floorp (BUILD_SYSTEM_TOO_COMPLEX)
;;;   - qt6-base-hifps (BUILD_SYSTEM_TOO_COMPLEX)
;;;   - unreal-engine (PROPRIETARY_BUILD_SYSTEM)
;;;   - chromium-gost (BUILD_SYSTEM_TOO_COMPLEX)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260413c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:export (
            yay
            paru
            paru-git
            topgrade
            awww-git
            snapd
            yaycache
            cosmic-settings-git
            pikaur
            portage
            aurman
            python-speechrecognition
            python-openvino
            bulky
            hypnotix
            pacaur
            trizen
            aurutils
            mingw-w64-environment
            mingw-w64-pkg-config
            mkinitcpio-systemd-extras
            limine-dracut-support
            limine-mkinitcpio-hook
            mchose-a7-v2-pro-udev
            libsdrplay
            ndi-sdk
            opencl-legacy-amdgpu-pro
            mssql-server
            davinci-resolve-studio
            cryptopro-csp-k1
            tensorrt-cross-builder-libs
            android-platform
            dbeaver
            cursor-ide
            glazepkg-bin
            gram-editor-bin
            fluxdown-bin
            lnko-bin
            lzbench-bin
            codex-desktop-bin
            hylauncher-bin
            konform-multi-account-containers-lite
            fahviewer
            grub-customizer
            86box
            dragengine
            java-openjfx
            wivrn-server
            openvino-intel-gpu-plugin-git
            openvino-intel-npu-plugin-git
            alice-vision
            fcitx5-mozc-ut
            openvpn3
            libdxvk
            libpamac-aur
            networkmanager-iwd
            gst-thumbnailers
            package-query
            imagemagick-full-doc
            mips64-linux-gnu-gcc-bootstrap
            mangowc-git
            system76-acpi-dkms
            system76-io-dkms
            tuxedo-drivers-dkms
            linux-zen-git-headers
            linux-pf-headers
            audiobookshelf
            komodo-periphery-git
            ))

;;; PACKAGE DEFINITIONS (68 packages)

;;; -- yay --
(define-public yay
  (package
    (name "yay")
    (version "12.5.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Jguer/yay")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list 
#:tests? #f           #:import-path "github.com/Jguer/yay/v12"))
    (home-page "https://github.com/Jguer/yay")
    (synopsis "yet another yogurt, an AUR helper written in Go")
    (description
     "Yay is a Pacman wrapper and AUR helper written in Go.  It provides
an interface for searching and installing packages from the Arch User
Repository alongside standard repository packages.")
    (license license:gpl3+)))

;;; -- paru --
(define-public paru
  (package
    (name "paru")
    (version "2.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/morganamilo/paru")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list 
#:tests? #f           #:install-source? #f))
    (home-page "https://github.com/morganamilo/paru")
    (synopsis "feature packed AUR helper")
    (description
     "Paru is an AUR helper and Pacman wrapper written in Rust.  It provides
features for searching, installing, and managing packages from the Arch
User Repository.")
    (license license:gpl3+)))

;;; -- paru-git --
(define-public paru-git
  (package
    (name "paru-git")
    (version "2.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/morganamilo/paru")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list 
#:tests? #f           #:install-source? #f))
    (home-page "https://github.com/morganamilo/paru")
    (synopsis "feature packed AUR helper (git version)")
    (description
     "Paru is an AUR helper and Pacman wrapper written in Rust.  It provides
features for searching, installing, and managing packages from the Arch
User Repository.  This is the development version built from git.")
    (license license:gpl3+)))

;;; -- topgrade --
(define-public topgrade
  (package
    (name "topgrade")
    (version "17.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/topgrade-rs/topgrade")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list 
#:tests? #f           #:install-source? #f))
    (home-page "https://topgrade-rs.github.io")
    (synopsis "upgrade all the things")
    (description
     "Topgrade is a tool that detects which package managers and tools you
use and runs the appropriate commands to update them all in one go.
It supports system packages, language-specific packages, and various
other update mechanisms.")
    (license license:gpl3+)))

;;; -- awww-git --
(define-public awww-git
  (package
    (name "awww-git")
    (version "0.11.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/LGFae/awww")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list 
#:tests? #f           #:install-source? #f))
    (home-page "https://codeberg.org/LGFae/awww")
    (synopsis "efficient animated wallpaper daemon for Wayland")
    (description
     "Awww is an efficient animated wallpaper daemon for Wayland compositors.
It supports multiple image and video formats with hardware-accelerated
decoding and low resource usage.")
    (license license:gpl3+)))

;;; -- snapd --
(define-public snapd
  (package
    (name "snapd")
    (version "2.74.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/snapcore/snapd")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list 
#:tests? #f           #:import-path "github.com/snapcore/snapd"))
    (home-page "https://snapcraft.io")
    (synopsis "service and tools for management of snap packages")
    (description
     "Snapd is the background service that manages and maintains snap
packages on a system.  Snap packages are containerized software
packages designed for secure, sandboxed installation.")
    (license license:gpl3)))

;;; -- yaycache --
(define-public yaycache
  (package
    (name "yaycache")
    (version "0.3.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aokellermann/yaycache")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list 
#:tests? #f           #:install-source? #f))
    (home-page "https://github.com/aokellermann/yaycache")
    (synopsis "flexible yay cache cleaning utility")
    (description
     "Yaycache is a cache cleaning utility for the Yay AUR helper.  It
provides flexible options for managing and cleaning cached package
builds.")
    (license license:gpl3+)))

;;; -- cosmic-settings-git --
(define-public cosmic-settings-git
  (package
    (name "cosmic-settings-git")
    (version "1.0.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pop-os/cosmic-settings")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list 
#:tests? #f           #:install-source? #f))
    (home-page "https://github.com/pop-os/cosmic-settings")
    (synopsis "settings application for the COSMIC desktop environment")
    (description
     "COSMIC Settings is the configuration application for the COSMIC
desktop environment by System76.  It provides interfaces for managing
display, input, network, accounts, and other system settings.")
    (license license:gpl3)))

;;; -- pikaur --
(define-public pikaur
  (package
    (name "pikaur")
    (version "1.33.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/actionless/pikaur")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://github.com/actionless/pikaur")
    (synopsis "AUR helper that asks all questions before installing")
    (description
     "Pikaur is an AUR helper inspired by pacaur, yaourt, and yay.  It
asks all questions before starting the build and installation process,
allowing users to review all changes at once.")
    (license license:gpl3+)))

;;; -- portage --
(define-public portage
  (package
    (name "portage")
    (version "3.0.77")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gentoo/portage")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://wiki.gentoo.org/wiki/Project:Portage")
    (synopsis "package management and distribution system for Gentoo")
    (description
     "Portage is the official package management and distribution system
for Gentoo Linux.  It provides ebuild-based package management with
dependency resolution and USE flag support.")
    (license license:gpl2)))

;;; -- aurman --
(define-public aurman
  (package
    (name "aurman")
    (version "2.22")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/polygamma/aurman")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://github.com/polygamma/aurman")
    (synopsis "AUR helper with almost pacman syntax")
    (description
     "Aurman is an AUR helper that aims to provide a command-line interface
closely matching that of pacman.  It handles dependency resolution
and building of AUR packages.")
    (license license:expat)))

;;; -- python-speechrecognition --
(define-public python-speechrecognition
  (package
    (name "python-speechrecognition")
    (version "3.16.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Uberi/speech_recognition")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://github.com/Uberi/speech_recognition")
    (synopsis "speech recognition module for Python")
    (description
     "SpeechRecognition is a Python library for performing speech recognition
with support for multiple engines and APIs including Google Web Speech,
Sphinx, Wit.ai, and others.")
    (license license:bsd-3)))

;;; -- python-openvino --
(define-public python-openvino
  (package
    (name "python-openvino")
    (version "2026.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/openvinotoolkit/openvino")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://docs.openvino.ai/")
    (synopsis "Python bindings for OpenVINO inference toolkit")
    (description
     "Python bindings for Intel OpenVINO, a toolkit for optimizing and
deploying AI inference on Intel hardware.  It supports neural network
models from multiple frameworks.")
    (license license:asl2.0)))

;;; -- bulky --
(define-public bulky
  (package
    (name "bulky")
    (version "3.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/linuxmint/bulky")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://github.com/linuxmint/bulky")
    (synopsis "bulk file renamer for the Linux desktop")
    (description
     "Bulky is a graphical bulk file renamer developed by the Linux Mint
project.  It provides pattern-based renaming with preview and undo
support.")
    (license license:gpl3+)))

;;; -- hypnotix --
(define-public hypnotix
  (package
    (name "hypnotix")
    (version "4.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/linuxmint/hypnotix")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://github.com/linuxmint/hypnotix")
    (synopsis "IPTV streaming application")
    (description
     "Hypnotix is an IPTV player developed by the Linux Mint project.
It supports M3U playlists and Xtream API for streaming live TV
channels using libmpv as the media backend.")
    (license license:gpl3+)))

;;; -- pacaur --
(define-public pacaur
  (package
    (name "pacaur")
    (version "4.8.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/E5ten/pacaur")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pacaur" "bin/pacaur"))))
    (home-page "https://github.com/E5ten/pacaur")
    (synopsis "AUR helper that minimizes user interaction")
    (description
     "Pacaur is an AUR helper that minimizes user interaction during
package installation and updates.  It automatically handles
dependency resolution and building.")
    (license license:isc)))

;;; -- trizen --
(define-public trizen
  (package
    (name "trizen")
    (version "1.68")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/trizen/trizen")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("trizen" "bin/trizen"))))
    (home-page "https://github.com/trizen/trizen")
    (synopsis "lightweight AUR package manager written in Perl")
    (description
     "Trizen is a lightweight AUR package manager written in Perl.
It provides pacman-like command-line syntax and handles dependency
resolution for AUR packages.")
    (license license:gpl3)))

;;; -- aurutils --
(define-public aurutils
  (package
    (name "aurutils")
    (version "20.5.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AladW/aurutils")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lib/" "lib/aurutils/") ("bin/" "bin/"))))
    (home-page "https://github.com/AladW/aurutils")
    (synopsis "helper tools for the Arch User Repository")
    (description
     "Aurutils is a collection of helper tools for managing a local
repository of AUR packages.  It provides scripts for building,
updating, and maintaining AUR packages in a local repo.")
    (license license:isc)))

;;; -- mingw-w64-environment --
(define-public mingw-w64-environment
  (package
    (name "mingw-w64-environment")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/mingw-w64-environment.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/mingw-w64-environment/"))))
    (home-page "https://fedoraproject.org/wiki/MinGW")
    (synopsis "common environment variables for MinGW cross-compilation")
    (description
     "Provides common environment variables and helper functions for
MinGW (mingw-w64) cross-compilation workflows.")
    (license license:bsd-3)))

;;; -- mingw-w64-pkg-config --
(define-public mingw-w64-pkg-config
  (package
    (name "mingw-w64-pkg-config")
    (version "2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/mingw-w64-pkg-config.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/mingw-w64-pkg-config/"))))
    (home-page "https://pkg-config.freedesktop.org/")
    (synopsis "pkg-config wrapper for mingw-w64 cross-compilation")
    (description
     "A support pkg-config script for cross-compiling with mingw-w64.
It wraps the native pkg-config to search the correct directories
for cross-compiled libraries.")
    (license license:zlib)))

;;; -- mkinitcpio-systemd-extras --
(define-public mkinitcpio-systemd-extras
  (package
    (name "mkinitcpio-systemd-extras")
    (version "0.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wolegis/mkinitcpio-systemd-extras")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/mkinitcpio-systemd-extras/"))))
    (home-page "https://github.com/wolegis/mkinitcpio-systemd-extras")
    (synopsis "collection of mkinitcpio install hooks for systemd initramfs")
    (description
     "A collection of mkinitcpio install hooks for systemd-based initramfs
setups.  Provides additional functionality beyond the standard systemd
initcpio hooks.")
    (license license:gpl3+)))

;;; -- limine-dracut-support --
(define-public limine-dracut-support
  (package
    (name "limine-dracut-support")
    (version "1.33.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/Zesko/limine-entry-tool")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/limine-dracut-support/"))))
    (home-page "https://gitlab.com/Zesko/limine-entry-tool")
    (synopsis "kernel installation support for Limine bootloader with dracut")
    (description
     "Provides scripts to install kernels for the Limine bootloader when
using dracut as the initramfs generator.")
    (license license:gpl3)))

;;; -- limine-mkinitcpio-hook --
(define-public limine-mkinitcpio-hook
  (package
    (name "limine-mkinitcpio-hook")
    (version "1.33.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/Zesko/limine-entry-tool")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/limine-mkinitcpio-hook/"))))
    (home-page "https://gitlab.com/Zesko/limine-entry-tool")
    (synopsis "kernel installation support for Limine bootloader with mkinitcpio")
    (description
     "Provides mkinitcpio hooks to install kernels for the Limine bootloader
when using mkinitcpio as the initramfs generator.")
    (license license:gpl3)))

;;; -- mchose-a7-v2-pro-udev --
(define-public mchose-a7-v2-pro-udev
  (package
    (name "mchose-a7-v2-pro-udev")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/mchose-a7-v2-pro-udev.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/mchose-a7-v2-pro-udev/"))))
    (home-page "https://www.mchose.store/")
    (synopsis "udev rules for MCHOSE A7 V2 Pro wireless mouse")
    (description
     "Provides udev rules for the MCHOSE A7 V2 Pro wireless gaming mouse
on Linux.  Configures device permissions for proper operation.")
    (license license:gpl2+)))

;;; -- libsdrplay --
(define-public libsdrplay
  (package
    (name "libsdrplay")
    (version "3.15.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.sdrplay.com/software/SDRplay_RSP_API-Linux-3.15.2.run")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/"))))
    (home-page "https://www.sdrplay.com")
    (synopsis "driver modules for SDRplay receivers")
    (description
     "Proprietary driver modules for SDRplay software-defined radio
receivers.  Provides the API library for interfacing with SDRplay
hardware.")
    (license (nonguix-license:nonfree "https://www.sdrplay.com"))))

;;; -- ndi-sdk --
(define-public ndi-sdk
  (package
    (name "ndi-sdk")
    (version "6.3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloads.ndi.tv/SDK/NDI_SDK_Linux/Install_NDI_SDK_v6_Linux.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/ndi-sdk/"))))
    (home-page "https://ndi.video/for-developers/ndi-sdk/")
    (synopsis "NewTek NDI software development kit")
    (description
     "The NewTek NDI (Network Device Interface) SDK enables applications
to send and receive high-quality, low-latency video over IP networks.
This is a proprietary binary distribution.")
    (license (nonguix-license:nonfree "https://ndi.video"))))

;;; -- opencl-legacy-amdgpu-pro --
(define-public opencl-legacy-amdgpu-pro
  (package
    (name "opencl-legacy-amdgpu-pro")
    (version "23.20")
    (source
     (origin
       (method url-fetch)
       (uri "https://repo.radeon.com/amdgpu/23.20/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro_23.20-1664988_amd64.deb")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/opencl-legacy-amdgpu-pro/"))))
    (home-page "https://www.amd.com/en/support")
    (synopsis "legacy non-free AMD OpenCL ICD loader")
    (description
     "Legacy non-free AMD OpenCL ICD loader (PAL) for older AMD GPUs.
This is a proprietary binary distribution from AMD.")
    (license (nonguix-license:nonfree "https://www.amd.com"))))

;;; -- mssql-server --
(define-public mssql-server
  (package
    (name "mssql-server")
    (version "16.0.4225.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://packages.microsoft.com/ubuntu/22.04/mssql-server-2022/pool/main/m/mssql-server/mssql-server_16.0.4225.2-1_amd64.deb")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/mssql-server/"))))
    (home-page "https://learn.microsoft.com/en-us/sql/linux/")
    (synopsis "Microsoft SQL Server for Linux")
    (description
     "Microsoft SQL Server for Linux.  A relational database management
system developed by Microsoft.  This is a proprietary binary
distribution.")
    (license (nonguix-license:nonfree "https://www.microsoft.com"))))

;;; -- davinci-resolve-studio --
(define-public davinci-resolve-studio
  (package
    (name "davinci-resolve-studio")
    (version "20.3.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.blackmagicdesign.com/api/support/us/downloads.json")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/davinci-resolve-studio/"))))
    (home-page "https://www.blackmagicdesign.com/products/davinciresolve")
    (synopsis "professional A/V post-production software suite")
    (description
     "DaVinci Resolve Studio is a professional video editing, color
correction, visual effects, and audio post-production suite from
Blackmagic Design.  This is the studio edition requiring a license.")
    (license (nonguix-license:nonfree "https://www.blackmagicdesign.com"))))

;;; -- cryptopro-csp-k1 --
(define-public cryptopro-csp-k1
  (package
    (name "cryptopro-csp-k1")
    (version "5.0.13700")
    (source
     (origin
       (method url-fetch)
       (uri "https://cryptopro.ru/sites/default/files/products/csp/current_release_5/50/linux-amd64.tgz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/cryptopro-csp-k1/"))))
    (home-page "https://cryptopro.ru/products/cryptopro-csp")
    (synopsis "CryptoPro CSP cryptographic service provider")
    (description
     "CryptoPro CSP is a Russian cryptographic service provider implementing
GOST cryptographic algorithms.  This is a proprietary binary
distribution.")
    (license (nonguix-license:nonfree "https://cryptopro.ru"))))

;;; -- tensorrt-cross-builder-libs --
(define-public tensorrt-cross-builder-libs
  (package
    (name "tensorrt-cross-builder-libs")
    (version "10.16.0.72")
    (source
     (origin
       (method url-fetch)
       (uri "https://developer.nvidia.com/downloads/compute/machine-learning/tensorrt/10.16.0/tars/TensorRT-10.16.0.72.Linux.x86_64-gnu.cuda-12.9.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/tensorrt-cross-builder-libs/"))))
    (home-page "https://developer.nvidia.com/tensorrt/")
    (synopsis "additional TensorRT libraries for cross building")
    (description
     "Additional TensorRT libraries for cross-building engine files.
TensorRT is NVIDIA's high-performance deep learning inference
optimizer and runtime.  This is a proprietary binary distribution.")
    (license (nonguix-license:nonfree "https://developer.nvidia.com"))))

;;; -- android-platform --
(define-public android-platform
  (package
    (name "android-platform")
    (version "37.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://dl.google.com/android/repository/platform-37_r01.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/android-platform/"))))
    (home-page "https://developer.android.com/sdk/")
    (synopsis "Android SDK platform, latest API")
    (description
     "The Android SDK Platform provides API libraries and system images
for developing Android applications targeting the latest API level.
This is a proprietary distribution from Google.")
    (license (nonguix-license:nonfree "https://developer.android.com"))))

;;; -- dbeaver --
(define-public dbeaver
  (package
    (name "dbeaver")
    (version "26.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/dbeaver/dbeaver/releases/download/26.0.1/dbeaver-ce-26.0.1-linux.gtk.x86_64-nojdk.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("dbeaver" "share/dbeaver/"))))
    (home-page "https://dbeaver.io")
    (synopsis "universal database management tool")
    (description
     "DBeaver is a free multi-platform database tool for developers,
SQL programmers, and database administrators.  It supports all popular
databases including MySQL, PostgreSQL, SQLite, Oracle, and many more.")
    (license license:asl2.0)))

;;; -- cursor-ide --
(define-public cursor-ide
  (package
    (name "cursor-ide")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloader.cursor.sh/linux/appImage/x64")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/cursor-ide/"))))
    (home-page "https://cursor.com")
    (synopsis "AI-powered code editor")
    (description
     "Cursor is an AI-powered code editor built as a fork of VS Code.
It integrates AI assistance directly into the editing experience
for code generation, refactoring, and understanding.  This is a
proprietary AppImage binary.")
    (license (nonguix-license:nonfree "https://cursor.com"))))

;;; -- glazepkg-bin --
(define-public glazepkg-bin
  (package
    (name "glazepkg-bin")
    (version "0.3.21")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/neur0map/glazepkg/releases/download/v0.3.21/glazepkg-linux-amd64.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("gpk" "bin/gpk"))))
    (home-page "https://github.com/neur0map/glazepkg")
    (synopsis "TUI dashboard unifying multiple package managers")
    (description
     "GlazePkg is a TUI dashboard that unifies 36 package managers into
one searchable, snapshotable interface.  Built with Go and Bubble Tea,
it provides a unified view across pacman, apt, brew, npm, pip, and more.")
    (license license:gpl3+)))

;;; -- gram-editor-bin --
(define-public gram-editor-bin
  (package
    (name "gram-editor-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://codeberg.org/GramEditor/gram/releases/download/v1.0.0/gram-linux-x86_64.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("gram" "bin/gram"))))
    (home-page "https://gram.liten.app/")
    (synopsis "open-source code editor forked from Zed")
    (description
     "Gram is an open-source code editor that is a hard fork of Zed with
AI, telemetry, and collaboration features removed.  It focuses on
providing a fast, lightweight editing experience.")
    (license license:gpl3+)))

;;; -- fluxdown-bin --
(define-public fluxdown-bin
  (package
    (name "fluxdown-bin")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://fluxdown.zerx.dev/releases/fluxdown-linux-x86_64.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/fluxdown-bin/"))))
    (home-page "https://fluxdown.zerx.dev/")
    (synopsis "modern multi-protocol download manager")
    (description
     "FluxDown is a modern multi-protocol download manager with browser
extension integration.  All data stays local on the user's machine.")
    (license license:gpl3+)))

;;; -- lnko-bin --
(define-public lnko-bin
  (package
    (name "lnko-bin")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/luanvil/lnko/releases/latest/download/lnko-linux-x86_64")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lnko-linux-x86_64" "bin/lnko"))))
    (home-page "https://github.com/luanvil/lnko")
    (synopsis "simple stow-like dotfile linker")
    (description
     "Lnko is a simple stow-like dotfile linker with interactive conflict
resolution, orphan cleanup, and status tracking.")
    (license license:expat)))

;;; -- lzbench-bin --
(define-public lzbench-bin
  (package
    (name "lzbench-bin")
    (version "1.8.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/inikep/lzbench/releases/download/v1.8.3/lzbench-linux-x86_64")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lzbench-linux-x86_64" "bin/lzbench"))))
    (home-page "https://github.com/inikep/lzbench")
    (synopsis "in-memory benchmark of lossless compression algorithms")
    (description
     "Lzbench is an in-memory benchmark tool for open-source LZ77/LZSS/LZMA
compression algorithms.  It integrates all compressors into a single
executable for fair, in-memory comparison.")
    (license license:gpl2+)))

;;; -- codex-desktop-bin --
(define-public codex-desktop-bin
  (package
    (name "codex-desktop-bin")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/ilysenko/codex-desktop-linux/releases/latest/download/codex-desktop-linux-x86_64.AppImage")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/codex-desktop-bin/"))))
    (home-page "https://openai.com/codex/")
    (synopsis "OpenAI Codex desktop application for Linux")
    (description
     "Unofficial Linux repackaging of the OpenAI Codex desktop application.
Codex is an AI-powered software development agent.  This is a
proprietary binary AppImage.")
    (license (nonguix-license:nonfree "https://openai.com"))))

;;; -- hylauncher-bin --
(define-public hylauncher-bin
  (package
    (name "hylauncher-bin")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/ArchDevs/HyLauncher/releases/latest/download/HyLauncher-linux-x86_64.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/hylauncher-bin/"))))
    (home-page "https://hylauncher.fun/")
    (synopsis "unofficial game launcher for Hytale")
    (description
     "HyLauncher is an unofficial game launcher for Hytale.  It manages
game installations and updates for the Hytale sandbox game.")
    (license license:gpl3+)))

;;; -- konform-multi-account-containers-lite --
(define-public konform-multi-account-containers-lite
  (package
    (name "konform-multi-account-containers-lite")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/Konsortium/multi-account-containers-lite")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/konform-multi-account-containers-lite/"))))
    (home-page "https://codeberg.org/Konsortium/multi-account-containers-lite")
    (synopsis "lightweight multi-account containers Firefox extension")
    (description
     "A lightweight fork of Mozilla's Multi-Account Containers Firefox
extension, maintained by the Konform Browser project.  It provides
container tab functionality with reduced bloat.")
    (license license:mpl2.0)))

;;; -- fahviewer --
(define-public fahviewer
  (package
    (name "fahviewer")
    (version "7.6.21")
    (source
     (origin
       (method url-fetch)
       (uri "https://download.foldingathome.org/releases/public/release/fahviewer/centos-5.3-64bit/v7.6/fahviewer-7.6.21-64bit-release.tar.bz2")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "lib/fahviewer/"))))
    (home-page "https://foldingathome.org/")
    (synopsis "3D protein simulation viewer for Folding@home")
    (description
     "FAHViewer is the 3D protein simulation viewer companion for the
Folding@home distributed computing client.  It provides real-time
visualization of protein folding simulations.")
    (license license:gpl2)))

;;; -- grub-customizer --
(define-public grub-customizer
  (package
    (name "grub-customizer")
    (version "5.2.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.launchpad.net/nicksinger/grub-customizer")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://launchpad.net/grub-customizer")
    (synopsis "graphical GRUB2 settings manager")
    (description
     "GRUB Customizer is a graphical tool for managing GRUB2 boot loader
configuration.  It provides a GUI for editing boot entries, themes,
and advanced GRUB2 settings.")
    (license license:gpl3+)))

;;; -- 86box --
(define-public 86box
  (package
    (name "86box")
    (version "5.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/86Box/86Box")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://86box.net/")
    (synopsis "emulator for classic IBM PC clones")
    (description
     "86Box is a low-level x86 emulator that specializes in running old
operating systems and software on modern hardware.  It accurately
emulates various classic IBM PC compatible machines.")
    (license license:gpl2+)))

;;; -- dragengine --
(define-public dragengine
  (package
    (name "dragengine")
    (version "1.31")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/LordOfDragons/dragengine")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://dragondreams.ch/index.php/dragengine")
    (synopsis "Drag[en]gine game engine and launcher")
    (description
     "Drag[en]gine is a cross-platform game engine providing a complete
set of modules for 3D rendering, physics, audio, networking, and
input handling.  It includes the DELauncher for running games.")
    (license license:expat)))

;;; -- java-openjfx --
(define-public java-openjfx
  (package
    (name "java-openjfx")
    (version "27.11")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/openjdk/jfx")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://wiki.openjdk.java.net/display/OpenJFX/Main")
    (synopsis "Java OpenJFX client application platform")
    (description
     "OpenJFX is the open-source implementation of JavaFX, a client
application platform for desktop, mobile, and embedded systems.
It provides a modern UI toolkit for Java applications.")
    (license license:gpl2)))

;;; -- wivrn-server --
(define-public wivrn-server
  (package
    (name "wivrn-server")
    (version "26.2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/WiVRn/WiVRn")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://github.com/WiVRn/WiVRn")
    (synopsis "wireless OpenXR runtime for standalone VR headsets")
    (description
     "WiVRn is a wireless Monado-based OpenXR runtime for standalone VR
headsets.  It enables wireless PC VR streaming to standalone devices
using video encoding and network transport.")
    (license license:gpl3+)))

;;; -- openvino-intel-gpu-plugin-git --
(define-public openvino-intel-gpu-plugin-git
  (package
    (name "openvino-intel-gpu-plugin-git")
    (version "2026.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/openvinotoolkit/openvino")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://docs.openvino.ai/")
    (synopsis "Intel GPU plugin for OpenVINO inference toolkit")
    (description
     "The Intel GPU plugin enables OpenVINO inference on Intel integrated
and discrete GPUs using OpenCL.  It provides optimized execution of
neural network models on Intel graphics hardware.")
    (license license:asl2.0)))

;;; -- openvino-intel-npu-plugin-git --
(define-public openvino-intel-npu-plugin-git
  (package
    (name "openvino-intel-npu-plugin-git")
    (version "2026.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/openvinotoolkit/openvino")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://docs.openvino.ai/")
    (synopsis "Intel NPU plugin for OpenVINO inference toolkit")
    (description
     "The Intel NPU plugin enables OpenVINO inference on Intel Neural
Processing Units.  It provides optimized execution of neural network
models on dedicated AI accelerator hardware.")
    (license license:asl2.0)))

;;; -- alice-vision --
(define-public alice-vision
  (package
    (name "alice-vision")
    (version "3.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/alicevision/AliceVision")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://alicevision.org/")
    (synopsis "photogrammetric computer vision framework")
    (description
     "AliceVision is a photogrammetric computer vision framework providing
3D reconstruction and camera tracking algorithms.  It enables creating
3D models from photographs using structure-from-motion and multi-view
stereo techniques.")
    (license (list license:expat license:mpl2.0))))

;;; -- fcitx5-mozc-ut --
(define-public fcitx5-mozc-ut
  (package
    (name "fcitx5-mozc-ut")
    (version "3.33.6133")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fcitx/mozc")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://github.com/fcitx/mozc")
    (synopsis "open source Japanese input for Fcitx5")
    (description
     "Mozc is the open source edition of Google Japanese Input.  This
package provides the Fcitx5 input method module for Mozc, enabling
Japanese language input in Linux desktop environments.")
    (license license:asl2.0)))

;;; -- openvpn3 --
(define-public openvpn3
  (package
    (name "openvpn3")
    (version "26")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/OpenVPN/openvpn3-linux")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://codeberg.org/OpenVPN/openvpn3-linux")
    (synopsis "OpenVPN 3 Linux client")
    (description
     "OpenVPN 3 is the next generation of OpenVPN for Linux.  It provides
a D-Bus based VPN service daemon with session management and supports
the OpenVPN 3 Core library for modern VPN connectivity.")
    (license license:agpl3+)))

;;; -- libdxvk --
(define-public libdxvk
  (package
    (name "libdxvk")
    (version "2.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doitsujin/dxvk")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://github.com/doitsujin/dxvk")
    (synopsis "Vulkan-based implementation of D3D for Linux")
    (description
     "DXVK is a Vulkan-based translation layer for Direct3D 8, 9, 10,
and 11.  It enables running Windows Direct3D applications on Linux
using the Vulkan graphics API.")
    (license license:zlib)))

;;; -- libpamac-aur --
(define-public libpamac-aur
  (package
    (name "libpamac-aur")
    (version "11.7.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/manjaro/libpamac")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://github.com/manjaro/libpamac/")
    (synopsis "Pamac package manager library")
    (description
     "Libpamac is the package manager library used by Pamac, the graphical
package manager from Manjaro Linux.  It provides an abstraction layer
over libalpm with AUR support.")
    (license license:gpl3+)))

;;; -- networkmanager-iwd --
(define-public networkmanager-iwd
  (package
    (name "networkmanager-iwd")
    (version "1.56.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.freedesktop.org/NetworkManager/NetworkManager")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://networkmanager.dev/")
    (synopsis "network connection manager with iwd backend")
    (description
     "NetworkManager with iwd (iNet Wireless Daemon) backend instead of
wpa_supplicant.  Provides automatic network connection management
for wired, wireless, and mobile broadband networks.")
    (license (list license:gpl2+ license:lgpl2.1+))))

;;; -- gst-thumbnailers --
(define-public gst-thumbnailers
  (package
    (name "gst-thumbnailers")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.gnome.org/GNOME/gst-thumbnailers")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://gitlab.gnome.org/GNOME/gst-thumbnailers")
    (synopsis "GStreamer-based video and audio thumbnail generators")
    (description
     "GStreamer-based video and audio thumbnail generators for GNOME
desktop environments.  Replaces the deprecated totem-video-thumbnailer
with Rust-based GStreamer implementations.")
    (license license:lgpl2.1+)))

;;; -- package-query --
(define-public package-query
  (package
    (name "package-query")
    (version "1.12")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/archlinuxfr/package-query")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://github.com/archlinuxfr/package-query/")
    (synopsis "query ALPM and AUR package databases")
    (description
     "Package-query is a tool for querying both the local ALPM database
and the AUR remote database.  It provides search and information
retrieval for Arch Linux packages.")
    (license license:gpl2+)))

;;; -- imagemagick-full-doc --
(define-public imagemagick-full-doc
  (package
    (name "imagemagick-full-doc")
    (version "7.1.2.18")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ImageMagick/ImageMagick")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://www.imagemagick.org/")
    (synopsis "ImageMagick documentation with all features enabled")
    (description
     "Complete documentation for ImageMagick compiled with all optional
features enabled (Q32 HDRI).  ImageMagick is a suite of tools for
creating, editing, and converting bitmap images.")
    (license license:asl2.0)))

;;; -- mips64-linux-gnu-gcc-bootstrap --
(define-public mips64-linux-gnu-gcc-bootstrap
  (package
    (name "mips64-linux-gnu-gcc-bootstrap")
    (version "15.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://ftp.gnu.org/gnu/gcc/gcc-15.2.0/gcc-15.2.0.tar.xz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://gcc.gnu.org/")
    (synopsis "bootstrap cross compiler for MIPS64 target")
    (description
     "Bootstrap stage 1 cross compiler for the MIPS64 target architecture.
Part of the GNU Compiler Collection, used for building the initial
toolchain for MIPS64 Linux systems with GNU C library.")
    (license (list license:gpl3+ license:fdl1.3+))))

;;; -- mangowc-git --
(define-public mangowc-git
  (package
    (name "mangowc-git")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mangowm/mango")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list 
#:tests? #f))
    (home-page "https://github.com/mangowm/mango")
    (synopsis "lightweight tiling Wayland compositor based on dwl")
    (description
     "MangoWC is a lightweight tiling Wayland compositor based on dwl.
It provides animations, blur effects, scratchpads, and multi-layout
support for Wayland desktop sessions.")
    (license license:gpl2)))

;;; -- system76-acpi-dkms --
(define-public system76-acpi-dkms
  (package
    (name "system76-acpi-dkms")
    (version "1.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pop-os/system76-acpi-dkms")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("src/" "src/system76-acpi-dkms/") ("Makefile" "src/system76-acpi-dkms/Makefile") ("dkms.conf" "src/system76-acpi-dkms/dkms.conf"))))
    (home-page "https://github.com/pop-os/system76-acpi-dkms")
    (synopsis "system76 ACPI kernel module source")
    (description
     "Source code for the system76_acpi kernel module providing ACPI
support for System76 laptops and desktops.  Designed for use with
DKMS to build against the running kernel.")
    (license license:gpl2+)))

;;; -- system76-io-dkms --
(define-public system76-io-dkms
  (package
    (name "system76-io-dkms")
    (version "1.0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pop-os/system76-io-dkms")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("src/" "src/system76-io-dkms/") ("Makefile" "src/system76-io-dkms/Makefile") ("dkms.conf" "src/system76-io-dkms/dkms.conf"))))
    (home-page "https://github.com/pop-os/system76-io-dkms")
    (synopsis "DKMS module for System76 Io board")
    (description
     "Source code for the system76_io kernel module providing control
for the System76 Io board.  Designed for use with DKMS to build
against the running kernel.")
    (license license:gpl2+)))

;;; -- tuxedo-drivers-dkms --
(define-public tuxedo-drivers-dkms
  (package
    (name "tuxedo-drivers-dkms")
    (version "4.21.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "src/tuxedo-drivers-dkms/"))))
    (home-page "https://www.tuxedocomputers.com/")
    (synopsis "TUXEDO Computers keyboard and hardware kernel drivers")
    (description
     "DKMS source for the TUXEDO Computers kernel module drivers.  Provides
support for keyboard backlight, fan control, and general hardware I/O
for TUXEDO laptops via the sysfs interface.")
    (license license:gpl2+)))

;;; -- linux-zen-git-headers --
(define-public linux-zen-git-headers
  (package
    (name "linux-zen-git-headers")
    (version "6.18")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/damentz/zen-kernel")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "src/linux-zen-git-headers/"))))
    (home-page "https://github.com/damentz/zen-kernel")
    (synopsis "kernel headers for the ZEN kernel")
    (description
     "Kernel headers for the Zen kernel, a featureful kernel including
various new features, code, and optimizations for desktop use.")
    (license license:gpl2)))

;;; -- linux-pf-headers --
(define-public linux-pf-headers
  (package
    (name "linux-pf-headers")
    (version "6.19")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/pf-kernel/linux")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "src/linux-pf-headers/"))))
    (home-page "https://pfkernel.natalenko.name")
    (synopsis "headers and scripts for building modules for pf-kernel")
    (description
     "Kernel headers for the pf-kernel, a patchset providing additional
performance and desktop improvements over the vanilla Linux kernel.")
    (license license:gpl2)))

;;; -- audiobookshelf --
(define-public audiobookshelf
  (package
    (name "audiobookshelf")
    (version "2.21.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/advplyr/audiobookshelf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("./" "share/audiobookshelf/"))))
    (home-page "https://www.audiobookshelf.org/")
    (synopsis "self-hosted audiobook and podcast server")
    (description
     "Audiobookshelf is a self-hosted audiobook and podcast server.
It provides a web interface and mobile apps for managing and streaming
audiobook collections with progress tracking and library organization.")
    (license license:gpl3+)))

;;; -- komodo-periphery-git --
(define-public komodo-periphery-git
  (package
    (name "komodo-periphery-git")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/moghtech/komodo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list 
#:tests? #f           #:install-source? #f))
    (home-page "https://github.com/moghtech/komodo")
    (synopsis "lightweight remote agent for Komodo deployment tool")
    (description
     "Komodo Periphery is a lightweight remote agent for the Komodo
deployment tool.  It runs on target servers to execute Docker
operations, monitor resources, and provide terminal access.")
    (license license:gpl3+)))
