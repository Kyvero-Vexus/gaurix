;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260416e
;;; Resolves 99 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260416e)
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
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (openjdk22-doc
            openjdk22-src
            openjdk23-doc
            openjdk23-src
            penpot-exporter
            servo
            syca
            wine-pure-git
            1c-enterprise-meta
            apollo
            expressvpn-staging
            lutris-live-bin
            maestral
            postman-bin
            qmplay2
            rog-perf-tuner-git
            sejda-desktop
            servo-git
            wivrn-dashboard
            android-translation-layer-git
            godot-mono-git
            lutris-git
            openjdk25-doc-wakefield
            openjdk25-src-wakefield
            somewm-git
            drkonqi-git
            electron17
            mimose-bin
            sunshine
            86box-git
            audacious-plugins-gtk3
            firefox-esr-globalmenu
            flaresolverr-bin
            waterfox
            gamescope-nvidia
            jre23-openjdk-headless
            python-mlflow
            vcvrack
            hyprland-nox
            jre23-openjdk
            dsnote
            handbrake-full
            onlyoffice
            sway-scroll
            cdesktopenv
            gram
            hypryou
            immich-server
            jre25-openjdk-headless-wakefield
            citron
            idescriptor-git
            jre25-openjdk-wakefield
            lib32-amdonly-gaming-opencl-rusticl-mesa-git
            bottles-git
            lib32-amdonly-gaming-mesa-git
            lib32-amdonly-gaming-vulkan-mesa-layers-git
            unofficial-homestuck-collection
            xemu-git
            lib32-amdonly-gaming-vulkan-radeon-git
            nautilus-typeahead
            orca-slicer
            portproton
            wivrn-multilib-git
            ladybird-git
            miktex
            monado-doc
            electron19
            libretro-azahar-git
            obs-studio-git
            zoneminder-git
            floorp
            slippi-mainline
            ultimatevocalremovergui-git
            azahar-git
            dwproton-signed-bin
            gopher64-git
            mesa-dlss-reflex-git
            proton-cachyos-slr
            wivrn-full-git
            linuxcnc
            nosystemd-boot-artix
            virtualbox-kvm
            plex-desktop
            firefox-vaapi
            wps-office-365-edu
            wps-office-365-edu-fonts
            misans
            zen-browser-git
            librewolf-hellfire
            aerothemeplasma-desktop-git
            lib32-gst-plugins-good
            lib32-gst-plugins-base
            obs-studio-tytan652
            obs-studio-liberty
            positron-ide-devel-bin
            wine-cachyos
            open-webui-no-venv
            all-repository-fonts
            sonic-workspace
))

(define-public openjdk22-doc
  (package
    (name "openjdk22-doc")
    (version "22.0.2.u9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openjdk22-doc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openJDK Java 22 documentation")
    (description "OpenJDK Java 22 documentation.")
    (home-page "https://openjdk.java.net/")
    (license license:non-copyleft)))

(define-public openjdk22-src
  (package
    (name "openjdk22-src")
    (version "22.0.2.u9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openjdk22-src.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openJDK Java 22 sources")
    (description "OpenJDK Java 22 sources.")
    (home-page "https://openjdk.java.net/")
    (license license:non-copyleft)))

(define-public openjdk23-doc
  (package
    (name "openjdk23-doc")
    (version "23.0.2.u7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openjdk23-doc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openJDK Java 23 documentation")
    (description "OpenJDK Java 23 documentation.")
    (home-page "https://openjdk.java.net/")
    (license license:non-copyleft)))

(define-public openjdk23-src
  (package
    (name "openjdk23-src")
    (version "23.0.2.u7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openjdk23-src.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openJDK Java 23 sources")
    (description "OpenJDK Java 23 sources.")
    (home-page "https://openjdk.java.net/")
    (license license:non-copyleft)))

(define-public penpot-exporter
  (package
    (name "penpot-exporter")
    (version "2.14.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/penpot-exporter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the open-source design tool for design and code collaboration")
    (description "The open-source design tool for design and code collaboration.")
    (home-page "https://penpot.app")
    (license license:mpl2.0)))

(define-public servo
  (package
    (name "servo")
    (version "0.0.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/servo/servo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "parallel Browser Project: web browser written in Rust")
    (description "Parallel Browser Project: web browser written in Rust.")
    (home-page "https://github.com/servo/servo")
    (license license:mpl2.0)))

(define-public syca
  (package
    (name "syca")
    (version "1.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/0xraincandy/syca")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "alternative to base-devel with syca as sudo-like elevation tool")
    (description "Alternative to base-devel with syca as sudo-like elevation tool.")
    (home-page "https://github.com/0xraincandy/syca")
    (license license:gpl3+)))

(define-public wine-pure-git
  (package
    (name "wine-pure-git")
    (version "10.14.r196.g3cfbf9e3cd9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ventureoo/PKGBUILDs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bleeding-edge Wine build (Staging, WoW64, NTSync, Wayland)")
    (description "Bleeding-edge Wine build (Staging, WoW64, NTSync, Wayland).")
    (home-page "https://github.com/ventureoo/PKGBUILDs")
    (license license:lgpl2.1+)))

(define-public 1c-enterprise-meta
  (package
    (name "1c_enterprise_meta")
    (version "8.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/1c_enterprise_meta.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "1C 8.3 metapackage for Linux")
    (description "1C 8.3 metapackage for Linux.")
    (home-page "https://aur.archlinux.org/packages/1c_enterprise_meta")
    (license license:gpl3+)))

(define-public apollo
  (package
    (name "apollo")
    (version "0.4.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ClassicOldSong/Apollo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a self-hosted game stream server")
    (description "A self-hosted game stream server.")
    (home-page "https://github.com/ClassicOldSong/Apollo")
    (license license:gpl3+)))

(define-public expressvpn-staging
  (package
    (name "expressvpn-staging")
    (version "5.0.1.11498")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/expressvpn-staging.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "proprietary VPN client for Linux")
    (description "Proprietary VPN client for Linux.")
    (home-page "https://expressvpn.com")
    (license license:non-copyleft)))

(define-public lutris-live-bin
  (package
    (name "lutris-live-bin")
    (version "0.5.22")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lutris-live-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "open Gaming Platform (Live version)")
    (description "Open Gaming Platform (Live version).")
    (home-page "https://lutris.net")
    (license license:gpl3+)))

(define-public maestral
  (package
    (name "maestral")
    (version "1.9.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SamSchott/maestral")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a light-weight and open-source Dropbox client")
    (description "A light-weight and open-source Dropbox client.")
    (home-page "https://github.com/SamSchott/maestral")
    (license license:expat)))

(define-public postman-bin
  (package
    (name "postman-bin")
    (version "12.5.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/postman-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "build, test, and document your APIs faster")
    (description "Build, test, and document your APIs faster.")
    (home-page "https://www.getpostman.com")
    (license license:non-copyleft)))

(define-public qmplay2
  (package
    (name "qmplay2")
    (version "25.09.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zaps166/QMPlay2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qMPlay2 is a video and audio player which can play most formats and codecs")
    (description "QMPlay2 is a video and audio player which can play most formats and codecs.")
    (home-page "https://github.com/zaps166/QMPlay2")
    (license license:lgpl3+)))

(define-public rog-perf-tuner-git
  (package
    (name "rog-perf-tuner-git")
    (version "4.14.7.r0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Emiliopg91/RogPerfTuner")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an utility to manage Asus Rog laptop performance and RGB lighting")
    (description "An utility to manage Asus Rog laptop performance and RGB lighting.")
    (home-page "https://github.com/Emiliopg91/RogPerfTuner")
    (license license:gpl2+)))

(define-public sejda-desktop
  (package
    (name "sejda-desktop")
    (version "7.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sejda-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "proprietary commercial PDF editor")
    (description "Proprietary commercial PDF editor.")
    (home-page "https://www.sejda.com/desktop")
    (license license:non-copyleft)))

(define-public servo-git
  (package
    (name "servo-git")
    (version "testing.0.0.0.0.2.r1154.g15cc268")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/servo/servo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "parallel Browser Project: web browser written in Rust")
    (description "Parallel Browser Project: web browser written in Rust.")
    (home-page "https://github.com/servo/servo")
    (license license:mpl2.0)))

(define-public wivrn-dashboard
  (package
    (name "wivrn-dashboard")
    (version "26.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/WiVRn/WiVRn")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a wireless Monado-based OpenXR runtime for standalone headsets")
    (description "A wireless Monado-based OpenXR runtime for standalone headsets.")
    (home-page "https://github.com/WiVRn/WiVRn")
    (license license:gpl3+)))

(define-public android-translation-layer-git
  (package
    (name "android_translation_layer-git")
    (version "r932.9de91586")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/android_translation_layer/android_translation_layer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a translation layer for running Android apps on a Linux system")
    (description "A translation layer for running Android apps on a Linux system.")
    (home-page "https://gitlab.com/android_translation_layer/android_translation_layer")
    (license license:gpl3+)))

(define-public godot-mono-git
  (package
    (name "godot-mono-git")
    (version "4.5.r76.gadb2ec0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/godot-mono-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an advanced, feature packed, multi-platform 2D and 3D game engine built pro..")
    (description "An advanced, feature packed, multi-platform 2D and 3D game engine built properly.")
    (home-page "https://godotengine.org/")
    (license license:expat)))

(define-public lutris-git
  (package
    (name "lutris-git")
    (version "0.5.22.r164.g74f67b8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lutris-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open Gaming Platform")
    (description "Open Gaming Platform.")
    (home-page "https://lutris.net")
    (license license:gpl3+)))

(define-public openjdk25-doc-wakefield
  (package
    (name "openjdk25-doc-wakefield")
    (version "25.0.1.0.r9557.g0bf2bd4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openjdk25-doc-wakefield.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openJDK Java 25 wayland documentation")
    (description "OpenJDK Java 25 wayland documentation.")
    (home-page "https://openjdk.java.net/")
    (license license:non-copyleft)))

(define-public openjdk25-src-wakefield
  (package
    (name "openjdk25-src-wakefield")
    (version "25.0.1.0.r9557.g0bf2bd4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openjdk25-src-wakefield.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openJDK Java 25 wayland sources")
    (description "OpenJDK Java 25 wayland sources.")
    (home-page "https://openjdk.java.net/")
    (license license:non-copyleft)))

(define-public somewm-git
  (package
    (name "somewm-git")
    (version "0.5.0.r91.gc9921b6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/trip-zip/somewm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "awesomeWM ported to Wayland - 100% Lua API compatible")
    (description "AwesomeWM ported to Wayland - 100% Lua API compatible.")
    (home-page "https://github.com/trip-zip/somewm")
    (license license:gpl3+)))

(define-public drkonqi-git
  (package
    (name "drkonqi-git")
    (version "6.5.90.r10.g975563ff0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/drkonqi-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the KDE crash handler (Git version)")
    (description "The KDE crash handler (Git version).")
    (home-page "https://kde.org/plasma-desktop/")
    (license license:gpl2+)))

(define-public electron17
  (package
    (name "electron17")
    (version "17.4.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/electron17.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "build cross platform desktop apps with web technologies")
    (description "Build cross platform desktop apps with web technologies.")
    (home-page "https://electronjs.org/")
    (license license:non-copyleft)))

(define-public mimose-bin
  (package
    (name "mimose-bin")
    (version "1.9.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mimose-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "mimose – App that combines Spotify, Soundcloud, VK and Deezer")
    (description "Mimose – App that combines Spotify, Soundcloud, VK and Deezer.")
    (home-page "https://mimose.site")
    (license license:non-copyleft)))

(define-public sunshine
  (package
    (name "sunshine")
    (version "2025.924.154138")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sunshine.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "self-hosted game stream host for Moonlight")
    (description "Self-hosted game stream host for Moonlight.")
    (home-page "https://app.lizardbyte.dev/Sunshine")
    (license license:gpl3+)))

(define-public 86box-git
  (package
    (name "86box-git")
    (version "5.3.r590.gc910f6559")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/86box-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an emulator for classic IBM PC clones")
    (description "An emulator for classic IBM PC clones.")
    (home-page "https://86box.net/")
    (license license:non-copyleft)))

(define-public audacious-plugins-gtk3
  (package
    (name "audacious-plugins-gtk3")
    (version "4.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/audacious-plugins-gtk3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugins for Audacious")
    (description "Plugins for Audacious.")
    (home-page "https://audacious-media-player.org/")
    (license license:bsd-3)))

(define-public firefox-esr-globalmenu
  (package
    (name "firefox-esr-globalmenu")
    (version "140.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/firefox-esr-globalmenu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast, Private & Safe Web Browser, Extended Support Release. (with appmenu p..")
    (description "Fast, Private & Safe Web Browser, Extended Support Release. (with appmenu patch).")
    (home-page "https://www.mozilla.org/en-US/firefox/enterprise/")
    (license license:mpl2.0)))

(define-public flaresolverr-bin
  (package
    (name "flaresolverr-bin")
    (version "3.4.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FlareSolverr/FlareSolverr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "a proxy server to bypass Cloudflare protection")
    (description "A proxy server to bypass Cloudflare protection.")
    (home-page "https://github.com/FlareSolverr/FlareSolverr")
    (license license:expat)))

(define-public waterfox
  (package
    (name "waterfox")
    (version "6.6.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/waterfox.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fork of Mozilla Firefox featuring some privacy, usability, and speed enhanc..")
    (description "Fork of Mozilla Firefox featuring some privacy, usability, and speed enhancements.")
    (home-page "https://www.waterfox.net/")
    (license license:mpl2.0)))

(define-public gamescope-nvidia
  (package
    (name "gamescope-nvidia")
    (version "3.16.23")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sharkautarch/gamescope/tree/nvidia-fix")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "steamOS session compositing window manager (NVIDIA patch)")
    (description "SteamOS session compositing window manager (NVIDIA patch).")
    (home-page "https://github.com/sharkautarch/gamescope/tree/nvidia-fix")
    (license license:bsd-3)))

(define-public jre23-openjdk-headless
  (package
    (name "jre23-openjdk-headless")
    (version "23.0.2.u7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jre23-openjdk-headless.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openJDK Java 23 headless runtime environment")
    (description "OpenJDK Java 23 headless runtime environment.")
    (home-page "https://openjdk.java.net/")
    (license license:non-copyleft)))

(define-public python-mlflow
  (package
    (name "python-mlflow")
    (version "3.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-mlflow.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open source platform for the machine learning lifecycle")
    (description "An open source platform for the machine learning lifecycle.")
    (home-page "https://mlflow.org")
    (license license:asl2.0)))

(define-public vcvrack
  (package
    (name "vcvrack")
    (version "2.6.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vcvrack.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source Eurorack modular synthesizer simulator")
    (description "Open-source Eurorack modular synthesizer simulator.")
    (home-page "https://vcvrack.com/")
    (license license:gpl3+)))

(define-public hyprland-nox
  (package
    (name "hyprland-nox")
    (version "0.54.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprwm/Hyprland")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an independent, highly customizable, dynamic tiling Wayland compositor that..")
    (description "An independent, highly customizable, dynamic tiling Wayland compositor that doesn't sacrifice on its looks. (w/o XWayland support).")
    (home-page "https://github.com/hyprwm/Hyprland")
    (license license:bsd-3)))

(define-public jre23-openjdk
  (package
    (name "jre23-openjdk")
    (version "23.0.2.u7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jre23-openjdk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openJDK Java 23 full runtime environment")
    (description "OpenJDK Java 23 full runtime environment.")
    (home-page "https://openjdk.java.net/")
    (license license:non-copyleft)))

(define-public dsnote
  (package
    (name "dsnote")
    (version "4.8.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mkiol/dsnote")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "note taking, reading and translating with offline Speech to Text, Text to S..")
    (description "Note taking, reading and translating with offline Speech to Text, Text to Speech and Machine Translation.")
    (home-page "https://github.com/mkiol/dsnote")
    (license license:mpl2.0)))

(define-public handbrake-full
  (package
    (name "handbrake-full")
    (version "1.11.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/handbrake-full.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multithreaded video transcoder")
    (description "Multithreaded video transcoder.")
    (home-page "https://handbrake.fr/")
    (license license:non-copyleft)))

(define-public onlyoffice
  (package
    (name "onlyoffice")
    (version "9.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/onlyoffice.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an office suite that combines text, spreadsheet and presentation editors al..")
    (description "An office suite that combines text, spreadsheet and presentation editors allowing to create, view and edit local documents.")
    (home-page "https://www.onlyoffice.com/desktop.aspx")
    (license license:agpl3+)))

(define-public sway-scroll
  (package
    (name "sway-scroll")
    (version "1.12.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dawsers/scroll")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fork of the sway Wayland compositor with a scrolling layout like PaperWM or..")
    (description "Fork of the sway Wayland compositor with a scrolling layout like PaperWM or niri (stable version).")
    (home-page "https://github.com/dawsers/scroll")
    (license license:expat)))

(define-public cdesktopenv
  (package
    (name "cdesktopenv")
    (version "2.5.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cdesktopenv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Common Desktop Environment, the classic UNIX desktop")
    (description "The Common Desktop Environment, the classic UNIX desktop.")
    (home-page "http://sourceforge.net/projects/cdesktopenv/")
    (license license:lgpl2.1+)))

(define-public gram
  (package
    (name "gram")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gram.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a code editor for humanoid apes and grumpy toads")
    (description "A code editor for humanoid apes and grumpy toads.")
    (home-page "https://gram.liten.app")
    (license license:agpl3+)))

(define-public hypryou
  (package
    (name "hypryou")
    (version "2.2.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/koeqaife/hyprland-material-you")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dynamic and elegant desktop setup inspired by Material You, featuring auto-..")
    (description "Dynamic and elegant desktop setup inspired by Material You, featuring auto-generated colors, fluid animations, and customizable user experience.")
    (home-page "https://github.com/koeqaife/hyprland-material-you")
    (license license:gpl3+)))

(define-public immich-server
  (package
    (name "immich-server")
    (version "2.7.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/immich-app/immich")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "self-hosted photos and videos backup tool")
    (description "Self-hosted photos and videos backup tool.")
    (home-page "https://github.com/immich-app/immich")
    (license license:agpl3+)))

(define-public jre25-openjdk-headless-wakefield
  (package
    (name "jre25-openjdk-headless-wakefield")
    (version "25.0.1.0.r9557.g0bf2bd4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jre25-openjdk-headless-wakefield.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openJDK Java 25 wayland headless runtime environment")
    (description "OpenJDK Java 25 wayland headless runtime environment.")
    (home-page "https://openjdk.java.net/")
    (license license:non-copyleft)))

(define-public citron
  (package
    (name "citron")
    (version "2026.02.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/citron.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nintendo Switch emulator forked from yuzu")
    (description "Nintendo Switch emulator forked from yuzu.")
    (home-page "https://citron-emu.org")
    (license license:gpl2+)))

(define-public idescriptor-git
  (package
    (name "idescriptor-git")
    (version "r263.6d86243")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/iDescriptor/iDescriptor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free, open-source, and cross-platform iDevice management tool")
    (description "A free, open-source, and cross-platform iDevice management tool.")
    (home-page "https://github.com/iDescriptor/iDescriptor")
    (license license:agpl3+)))

(define-public jre25-openjdk-wakefield
  (package
    (name "jre25-openjdk-wakefield")
    (version "25.0.1.0.r9557.g0bf2bd4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jre25-openjdk-wakefield.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openJDK Java 25 wayland full runtime environment")
    (description "OpenJDK Java 25 wayland full runtime environment.")
    (home-page "https://openjdk.java.net/")
    (license license:non-copyleft)))

(define-public lib32-amdonly-gaming-opencl-rusticl-mesa-git
  (package
    (name "lib32-amdonly-gaming-opencl-rusticl-mesa-git")
    (version "26.1.0_devel.219374.37ba573877a.d41d8cd")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-amdonly-gaming-opencl-rusticl-mesa-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openCL support with rusticl for mesa drivers (32-bit)")
    (description "OpenCL support with rusticl for mesa drivers (32-bit).")
    (home-page "https://www.mesa3d.org/")
    (license license:non-copyleft)))

(define-public bottles-git
  (package
    (name "bottles-git")
    (version "2:51.18.r78.g3e1dc5bd")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bottles-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "easily manage wineprefix using environments")
    (description "Easily manage wineprefix using environments.")
    (home-page "https://usebottles.com/")
    (license license:gpl3+)))

(define-public lib32-amdonly-gaming-mesa-git
  (package
    (name "lib32-amdonly-gaming-mesa-git")
    (version "26.1.0_devel.219374.37ba573877a.d41d8cd")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-amdonly-gaming-mesa-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open-source implementation of the OpenGL specification (32-bit)")
    (description "An open-source implementation of the OpenGL specification (32-bit).")
    (home-page "https://www.mesa3d.org/")
    (license license:non-copyleft)))

(define-public lib32-amdonly-gaming-vulkan-mesa-layers-git
  (package
    (name "lib32-amdonly-gaming-vulkan-mesa-layers-git")
    (version "26.1.0_devel.219374.37ba573877a.d41d8cd")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-amdonly-gaming-vulkan-mesa-layers-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mesa's Vulkan layers (32-bit)")
    (description "Mesa's Vulkan layers (32-bit).")
    (home-page "https://www.mesa3d.org/")
    (license license:non-copyleft)))

(define-public unofficial-homestuck-collection
  (package
    (name "unofficial-homestuck-collection")
    (version "2.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unofficial-homestuck-collection.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Unofficial Homestuck Collection")
    (description "The Unofficial Homestuck Collection.")
    (home-page "https://homestuck.giovanh.com/unofficial-homestuck-collection/")
    (license license:gpl3+)))

(define-public xemu-git
  (package
    (name "xemu-git")
    (version "0.8.134.r0.gfc9980d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xemu-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "original Xbox emulator (fork of XQEMU)")
    (description "Original Xbox emulator (fork of XQEMU).")
    (home-page "https://xemu.app/")
    (license license:gpl2+)))

(define-public lib32-amdonly-gaming-vulkan-radeon-git
  (package
    (name "lib32-amdonly-gaming-vulkan-radeon-git")
    (version "26.1.0_devel.219374.37ba573877a.d41d8cd")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-amdonly-gaming-vulkan-radeon-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "radeon's Vulkan mesa driver (32-bit)")
    (description "Radeon's Vulkan mesa driver (32-bit).")
    (home-page "https://www.mesa3d.org/")
    (license license:non-copyleft)))

(define-public nautilus-typeahead
  (package
    (name "nautilus-typeahead")
    (version "50.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nautilus-typeahead.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "default file manager for GNOME - Patched to bring back the 'typeahead find'..")
    (description "Default file manager for GNOME - Patched to bring back the 'typeahead find' feature.")
    (home-page "https://apps.gnome.org/Nautilus/")
    (license license:gpl3+)))

(define-public orca-slicer
  (package
    (name "orca-slicer")
    (version "1:2.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SoftFever/OrcaSlicer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "g-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creal..")
    (description "G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.).")
    (home-page "https://github.com/SoftFever/OrcaSlicer")
    (license license:agpl3+)))

(define-public portproton
  (package
    (name "portproton")
    (version "1.7.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/portproton.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "software for playing Microsoft Windows games and launchers")
    (description "Software for playing Microsoft Windows games and launchers.")
    (home-page "https://linux-gaming.ru")
    (license license:expat)))

(define-public wivrn-multilib-git
  (package
    (name "wivrn-multilib-git")
    (version "25.9.129.g2204fdd3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/WiVRn/WiVRn")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a wireless Monado-based OpenXR runtime for standalone headsets. (32-bit sup..")
    (description "A wireless Monado-based OpenXR runtime for standalone headsets. (32-bit support).")
    (home-page "https://github.com/WiVRn/WiVRn")
    (license license:gpl3+)))

(define-public ladybird-git
  (package
    (name "ladybird-git")
    (version "r76835.b544e42809e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LadybirdBrowser/ladybird")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "truly independent web browser")
    (description "Truly independent web browser.")
    (home-page "https://github.com/LadybirdBrowser/ladybird")
    (license license:bsd-3)))

(define-public miktex
  (package
    (name "miktex")
    (version "26.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/miktex.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a distribution of the TeX/LaTeX typesetting system")
    (description "A distribution of the TeX/LaTeX typesetting system.")
    (home-page "https://miktex.org")
    (license license:non-copyleft)))

(define-public monado-doc
  (package
    (name "monado-doc")
    (version "25.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/monado-doc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open source OpenXR runtime (documentation)")
    (description "An open source OpenXR runtime (documentation).")
    (home-page "https://monado.dev/")
    (license license:boost1.0)))

(define-public electron19
  (package
    (name "electron19")
    (version "19.1.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/electron19.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "build cross platform desktop apps with web technologies")
    (description "Build cross platform desktop apps with web technologies.")
    (home-page "https://electronjs.org/")
    (license license:non-copyleft)))

(define-public libretro-azahar-git
  (package
    (name "libretro-azahar-git")
    (version "2125.0.1.r11.g3066887")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libretro-azahar-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nintendo 3DS core based on Citra")
    (description "Nintendo 3DS core based on Citra.")
    (home-page "https://azahar-emu.org/")
    (license license:gpl2+)))

(define-public obs-studio-git
  (package
    (name "obs-studio-git")
    (version "32.1.0.r13.g1159bc8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/obsproject/obs-studio")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free, open source software for live streaming and recording")
    (description "Free, open source software for live streaming and recording.")
    (home-page "https://github.com/obsproject/obs-studio")
    (license license:gpl2+)))

(define-public zoneminder-git
  (package
    (name "zoneminder-git")
    (version "1.38.0.r4.g6833e51")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zoneminder-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a full-featured, open source, state-of-the-art video surveillance software ..")
    (description "A full-featured, open source, state-of-the-art video surveillance software system (git version).")
    (home-page "https://zoneminder.com/")
    (license license:gpl2+)))

(define-public floorp
  (package
    (name "floorp")
    (version "12.12.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Floorp-Projects/Floorp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "firefox-based web browser focused on performance and customizability")
    (description "Firefox-based web browser focused on performance and customizability.")
    (home-page "https://github.com/Floorp-Projects/Floorp")
    (license license:mpl2.0)))

(define-public slippi-mainline
  (package
    (name "slippi-mainline")
    (version "v4.0.0.mainline.beta.14.r0.g9af1bb57e8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/project-slippi/dolphin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "https://slippi.gg/about")
    (description "Https://slippi.gg/about.")
    (home-page "https://github.com/project-slippi/dolphin")
    (license license:gpl2+)))

(define-public ultimatevocalremovergui-git
  (package
    (name "ultimatevocalremovergui-git")
    (version "5.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Anjok07/ultimatevocalremovergui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "this application uses state-of-the-art source separation models to remove v..")
    (description "This application uses state-of-the-art source separation models to remove vocals from audio files. UVR's core developers trained all of the models provided in this package (except for the Demucs v3 and v4 4-stem models).")
    (home-page "https://github.com/Anjok07/ultimatevocalremovergui")
    (license license:non-copyleft)))

(define-public azahar-git
  (package
    (name "azahar-git")
    (version "2125.0.1.r11.g3066887")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/azahar-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nintendo 3DS emulator based on Citra")
    (description "Nintendo 3DS emulator based on Citra.")
    (home-page "https://azahar-emu.org/")
    (license license:gpl2+)))

(define-public dwproton-signed-bin
  (package
    (name "dwproton-signed-bin")
    (version "1:10.0_14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dawn-winery/dawn-signed")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "proton builds with the latest Dawn Winery fixes for gacha games, based on P..")
    (description "Proton builds with the latest Dawn Winery fixes for gacha games, based on Proton-CachyOS. Signed build.")
    (home-page "https://github.com/dawn-winery/dawn-signed")
    (license license:bsd-3)))

(define-public gopher64-git
  (package
    (name "gopher64-git")
    (version "1.1.15.r25.g9528473f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gopher64/gopher64")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Nintendo64 emulator (git version)")
    (description "A Nintendo64 emulator (git version).")
    (home-page "https://github.com/gopher64/gopher64/")
    (license license:gpl3+)))

(define-public mesa-dlss-reflex-git
  (package
    (name "mesa-dlss-reflex-git")
    (version "26.1.0_devel.220433.4f76ecec8be.nvkdlssreflex")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mesa-dlss-reflex-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mesa git with VK_NVX_binary_import (NVK DLSS) + VK_NV_low_latency2 (NVK Ref..")
    (description "Mesa git with VK_NVX_binary_import (NVK DLSS) + VK_NV_low_latency2 (NVK Reflex).")
    (home-page "https://www.mesa3d.org")
    (license license:non-copyleft)))

(define-public proton-cachyos-slr
  (package
    (name "proton-cachyos-slr")
    (version "1:10.0.20260408")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CachyOS/proton-cachyos")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a compatibility tool for Steam Play based on Wine and additional components..")
    (description "A compatibility tool for Steam Play based on Wine and additional components, experimental branch with extra CachyOS flavour (Steam Linux Runtime build).")
    (home-page "https://github.com/CachyOS/proton-cachyos")
    (license license:bsd-3)))

(define-public wivrn-full-git
  (package
    (name "wivrn-full-git")
    (version "r2233.370b7e8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/WiVRn/WiVRn")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a wireless Monado-based OpenXR runtime for standalone headsets")
    (description "A wireless Monado-based OpenXR runtime for standalone headsets.")
    (home-page "https://github.com/WiVRn/WiVRn")
    (license license:gpl3+)))

(define-public linuxcnc
  (package
    (name "linuxcnc")
    (version "2.9.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linuxcnc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "controls CNC machines (mills, lathes, 3D printers, robots, etc.)")
    (description "Controls CNC machines (mills, lathes, 3D printers, robots, etc.).")
    (home-page "https://linuxcnc.org/")
    (license license:non-copyleft)))

(define-public nosystemd-boot-artix
  (package
    (name "nosystemd-boot-artix")
    (version "258")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.github.com/Demelza/nosystemd-boot-artix")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nosystemd-boot-artix")
    (description "Nosystemd-boot-artix.")
    (home-page "https://www.github.com/Demelza/nosystemd-boot-artix")
    (license license:lgpl2.1+)))

(define-public virtualbox-kvm
  (package
    (name "virtualbox-kvm")
    (version "20260201")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cyberus-technology/virtualbox-kvm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "powerful x86 virtualization for enterprise as well as home use (KVM backend)")
    (description "Powerful x86 virtualization for enterprise as well as home use (KVM backend).")
    (home-page "https://github.com/cyberus-technology/virtualbox-kvm")
    (license license:gpl3+)))

(define-public plex-desktop
  (package
    (name "plex-desktop")
    (version "1.112.0.359")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plex-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plex desktop client for linux")
    (description "Plex desktop client for linux.")
    (home-page "http://plex.tv")
    (license license:non-copyleft)))

(define-public firefox-vaapi
  (package
    (name "firefox-vaapi")
    (version "149.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/firefox-vaapi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast, Private & Safe Web Browser (with VA-API patches)")
    (description "Fast, Private & Safe Web Browser (with VA-API patches).")
    (home-page "https://www.mozilla.org/firefox/")
    (license license:mpl2.0)))

(define-public wps-office-365-edu
  (package
    (name "wps-office-365-edu")
    (version "12.1.2.23578")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wps-office-365-edu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wPS Office for education")
    (description "WPS Office for education.")
    (home-page "https://365.wps.cn/edu/home")
    (license license:non-copyleft)))

(define-public wps-office-365-edu-fonts
  (package
    (name "wps-office-365-edu-fonts")
    (version "12.1.2.23578")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wps-office-365-edu-fonts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wPS Office for education")
    (description "WPS Office for education.")
    (home-page "https://365.wps.cn/edu/home")
    (license license:non-copyleft)))

(define-public misans
  (package
    (name "misans")
    (version "4.003")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/misans.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "miSans Global is a global language font customization project led by Xiaomi..")
    (description "MiSans Global is a global language font customization project led by Xiaomi and co-created with Mona font and Han Yi font. - meta package.")
    (home-page "https://hyperos.mi.com/font/download")
    (license license:non-copyleft)))

(define-public zen-browser-git
  (package
    (name "zen-browser-git")
    (version "1.18.2b.r6297.g4de01a9bc")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zen-browser-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zen Browser Twilight (Git version)")
    (description "Zen Browser Twilight (Git version).")
    (home-page "https://zen-browser.app/")
    (license license:mpl2.0)))

(define-public librewolf-hellfire
  (package
    (name "librewolf-hellfire")
    (version "1:144.0_1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/librewolf-hellfire.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "libreWolf with HellFire performance optimizations - privacy-focused Firefox..")
    (description "LibreWolf with HellFire performance optimizations - privacy-focused Firefox fork with extreme performance tuning.")
    (home-page "https://librewolf.net/")
    (license license:mpl2.0)))

(define-public aerothemeplasma-desktop-git
  (package
    (name "aerothemeplasma-desktop-git")
    (version "6.6.1_696.r786c863")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aeroshell-desktop/aerothemeplasma")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an alternative shell for KDE Plasma that aims to replicate the look and fee..")
    (description "An alternative shell for KDE Plasma that aims to replicate the look and feel of Windows 7.")
    (home-page "https://github.com/aeroshell-desktop/aerothemeplasma")
    (license license:agpl3+)))

(define-public lib32-gst-plugins-good
  (package
    (name "lib32-gst-plugins-good")
    (version "1.28.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-gst-plugins-good.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multimedia graph framework (32-bit) - good plugins")
    (description "Multimedia graph framework (32-bit) - good plugins.")
    (home-page "https://gstreamer.freedesktop.org/")
    (license license:lgpl2.1+)))

(define-public lib32-gst-plugins-base
  (package
    (name "lib32-gst-plugins-base")
    (version "1.28.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-gst-plugins-base.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multimedia graph framework (32-bit) - base plugins")
    (description "Multimedia graph framework (32-bit) - base plugins.")
    (home-page "https://gstreamer.freedesktop.org/")
    (license license:lgpl2.1+)))

(define-public obs-studio-tytan652
  (package
    (name "obs-studio-tytan652")
    (version "32.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/obsproject/obs-studio")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free and open source software for video recording and live streaming. With ..")
    (description "Free and open source software for video recording and live streaming. With everything except service integrations. Plus my bind interface PR, and sometimes backported fixes.")
    (home-page "https://github.com/obsproject/obs-studio")
    (license license:gpl2+)))

(define-public obs-studio-liberty
  (package
    (name "obs-studio-liberty")
    (version "32.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/obsproject/obs-studio")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free, open source software for live streaming and recording. With Browser S..")
    (description "Free, open source software for live streaming and recording. With Browser Source support. Without the need to install ffmpeg-obs, etc.")
    (home-page "https://github.com/obsproject/obs-studio")
    (license license:gpl2+)))

(define-public positron-ide-devel-bin
  (package
    (name "positron-ide-devel-bin")
    (version "2026.04.0.269")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/posit-dev/positron")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "a next-generation data science IDE. Positron is an extensible, polyglot too..")
    (description "A next-generation data science IDE. Positron is an extensible, polyglot tool for writing code and exploring data in Python, R, and other languages.")
    (home-page "https://github.com/posit-dev/positron")
    (license license:non-copyleft)))

(define-public wine-cachyos
  (package
    (name "wine-cachyos")
    (version "2:10.0.20260324")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CachyOS/wine-cachyos")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a compatibility layer for running Windows programs, with extra CachyOS flavour")
    (description "A compatibility layer for running Windows programs, with extra CachyOS flavour.")
    (home-page "https://github.com/CachyOS/wine-cachyos")
    (license license:lgpl2.1+)))

(define-public open-webui-no-venv
  (package
    (name "open-webui-no-venv")
    (version "0.8.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/open-webui/open-webui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "web UI and OpenAI API for various LLM runners, including Ollama, built with..")
    (description "Web UI and OpenAI API for various LLM runners, including Ollama, built without creating virtualenv.")
    (home-page "https://github.com/open-webui/open-webui")
    (license license:bsd-3)))

(define-public all-repository-fonts
  (package
    (name "all-repository-fonts")
    (version "20260410")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/all-repository-fonts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "meta package for all fonts in the official repositories")
    (description "Meta package for all fonts in the official repositories.")
    (home-page "https://aur.archlinux.org/packages/all-repository-fonts/")
    (license license:expat)))

(define-public sonic-workspace
  (package
    (name "sonic-workspace")
    (version "6.6.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Sonic-DE/sonic-workspace")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kDE Plasma Workspace, light version with fixes and improvements for X11 ses..")
    (description "KDE Plasma Workspace, light version with fixes and improvements for X11 session, for XLibre.")
    (home-page "https://github.com/Sonic-DE/sonic-workspace")
    (license license:lgpl3+)))
