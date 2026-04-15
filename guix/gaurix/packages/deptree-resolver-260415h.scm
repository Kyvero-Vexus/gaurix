;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Resolver pass --- deptree-resolver-260415h
;;; Resolves 100 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system node)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
            android-armv7a-eabi-qt6-base
            jdk23-openjdk
            firefox-nightly-i18n-pt-br
            php74-apcu
            php74-memcache
            php74-igbinary
            artemis-lang
            php74-memcached
            muzak
            sickrage-git
            calculix-ccx
            dms-shell-git
            dnspyex-wine-bin
            furmark
            gnome-shell-extension-pano-git
            goatdkernel
            happy-cli
            immich-cli
            jellyseerr
            laborejo
            lacuna-webpki
            language-toolkit
            lib32-libdovi
            lib32-libstdc5
            lib32-opencl-nvidia-beta
            lib32-python311-bin
            libloot
            llama-cpp-clblast
            loginized
            masterpdfeditor-free
            min
            mingw-w64-mariadb-connector-c
            mipsel-linux-gnu-gcc
            nbb
            neural-amp-modeler-lv2
            nvidia-340xx-dkms
            nvidia-beta
            obsidianospm-git
            omnissa-horizon-integrated-printing
            onedrivegui-git
            opencl-amd-dev
            openrgb-plugin-effects-git
            osu
            osuboot-git
            patroneo
            pear-desktop-git
            perplexity
            psychonauts
            qobuz-player
            redeclipse
            rime-frost-git
            rmpc-auto-theme-git
            rofi-polkit-agent-git
            roomeqwizard
            rtl8852au-dkms-git
            scratch3
            scrollmpris-git
            silabs-usbxpresshostsdk
            slack-electron
            snapx-ui
            sonusmix-git
            soteria-git
            spacebar-git
            spotatui-git
            staruml
            steamfetch
            sunvox
            superlauncher-mc
            symbolicator
            tanglet
            tg-config
            thcrap-steam-proton-wrapper-git
            tray-mixer-plus
            tvb-recorder
            udev-browse-git
            ue4localizationstool-zenity
            unigine-tropics
            unigine-valley
            unreal-tournament-bin
            upwork
            veeam
            vencord-hook
            vm-curator
            waybar-niri-taskbar
            waydroid-launcher-git
            webmin
            wheelwizard
            wineasio
            wiznoteplus-bin
            xavs2-git
            xmousepasteblock
            youtube-chat-rs-git
            ytdownloader))

(define-public android-armv7a-eabi-qt6-base
  (package
    (name "android-armv7a-eabi-qt6-base")
    (version "6.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-armv7a-eabi-qt6-base.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform application and UI framework (android)")
    (description "A cross-platform application and UI framework (android).")
    (home-page "https://www.qt.io")
    (license license:gpl3)))

(define-public jdk23-openjdk
  (package
    (name "jdk23-openjdk")
    (version "23.0.2.u7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jdk23-openjdk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openJDK Java 23 development kit")
    (description "OpenJDK Java 23 development kit.")
    (home-page "https://openjdk.java.net/")
    (license license:non-copyleft)))

(define-public firefox-nightly-i18n-pt-br
  (package
    (name "firefox-nightly-i18n-pt-br")
    (version "151.0a1.20260414.085455")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/firefox-nightly-i18n-pt-br.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "portuguese (Brazilian) language pack for Firefox Nightly")
    (description "Portuguese (Brazilian) language pack for Firefox Nightly.")
    (home-page "https://www.mozilla.org/firefox/")
    (license license:gpl3+)))

(define-public php74-apcu
  (package
    (name "php74-apcu")
    (version "5.1.23")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php74-apcu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a userland caching module for PHP")
    (description "A userland caching module for PHP.")
    (home-page "https://pecl.php.net/package/APCu")
    (license license:non-copyleft)))

(define-public php74-memcache
  (package
    (name "php74-memcache")
    (version "4.0.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php74-memcache.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "memcache module for PHP")
    (description "Memcache module for PHP.")
    (home-page "https://pecl.php.net/package/memcache")
    (license license:non-copyleft)))

(define-public php74-igbinary
  (package
    (name "php74-igbinary")
    (version "3.2.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php74-igbinary.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a drop in replacement for the standard php serializer (PHP 7")
    (description "A drop in replacement for the standard php serializer (PHP 7.4).")
    (home-page "https://pecl.php.net/package/igbinary")
    (license license:bsd-3)))

(define-public artemis-lang
  (package
    (name "artemis-lang")
    (version "0.3.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chaqchase/artemis")
                    (commit "v0.3.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "typeScript-Powered Scripting Language")
    (description "TypeScript-Powered Scripting Language.")
    (home-page "https://github.com/chaqchase/artemis")
    (license license:expat)))

(define-public php74-memcached
  (package
    (name "php74-memcached")
    (version "3.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/php-memcached-dev/php-memcached")
                    (commit "v3.1.5")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pHP extension for interfacing with memcached via libmemcached library")
    (description "PHP extension for interfacing with memcached via libmemcached library.")
    (home-page "https://github.com/php-memcached-dev/php-memcached")
    (license license:non-copyleft)))

(define-public muzak
  (package
    (name "muzak")
    (version "2.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/The0x539/muzak")
                    (commit "v2.4.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line suite for playing and compiling the bells of bezelea")
    (description "Command-line suite for playing and compiling the bells of bezelea.")
    (home-page "https://github.com/The0x539/muzak")
    (license license:non-copyleft)))

(define-public sickrage-git
  (package
    (name "sickrage-git")
    (version "9.4.117.r0.g1db69f779")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SiCKRAGETV/SickRage")
                    (commit "v9.4.117.r0.g1db69f779")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a PVR application that downloads and manages your TV shows")
    (description "A PVR application that downloads and manages your TV shows. Echel0n fork of sickbeard, with tvrage, torrents and anime support.")
    (home-page "https://github.com/SiCKRAGETV/SickRage")
    (license license:gpl3)))

(define-public calculix-ccx
  (package
    (name "calculix-ccx")
    (version "2.23")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/calculix-ccx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "calculiX: 3D Structural Finite Element Program - Solver")
    (description "CalculiX: 3D Structural Finite Element Program - Solver.")
    (home-page "http://www.calculix.de/")
    (license license:gpl2)))

(define-public dms-shell-git
  (package
    (name "dms-shell-git")
    (version "1.4.0.r283.ga0c7ffd")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AvengeMedia/DankMaterialShell")
                    (commit "v1.4.0.r283.ga0c7ffd")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop shell for wayland compositors built with Quickshell & GO")
    (description "Desktop shell for wayland compositors built with Quickshell & GO.")
    (home-page "https://github.com/AvengeMedia/DankMaterialShell")
    (license license:expat)))

(define-public dnspyex-wine-bin
  (package
    (name "dnspyex-wine-bin")
    (version "6.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dnSpyEx/dnSpy")
                    (commit "v6.5.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unofficial continuation of dnSpy: debugger and")
    (description "Unofficial continuation of dnSpy: debugger and .NET assembly editor.")
    (home-page "https://github.com/dnSpyEx/dnSpy")
    (license license:gpl3+)))

(define-public furmark
  (package
    (name "furmark")
    (version "2.10.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/furmark.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight but intensive GPU stress test and benchmarking tool for OpenG")
    (description "Lightweight but intensive GPU stress test and benchmarking tool for OpenGL and Vulkan.")
    (home-page "https://www.geeks3d.com/furmark/v2/")
    (license license:non-copyleft)))

(define-public gnome-shell-extension-pano-git
  (package
    (name "gnome-shell-extension-pano-git")
    (version "23.alpha5.r11.g1bb7d22")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/oae/gnome-shell-pano")
                    (commit "v23.alpha5.r11.g1bb7d22")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "next-gen Clipboard Manager for Gnome Shell")
    (description "Next-gen Clipboard Manager for Gnome Shell.")
    (home-page "https://github.com/oae/gnome-shell-pano")
    (license license:gpl2)))

(define-public goatdkernel
  (package
    (name "goatdkernel")
    (version "0.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MadGoatHaz/GOATd-Kernel")
                    (commit "v0.2.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "custom Arch kernel building & compile with microarchitecture tuning using")
    (description "Custom Arch kernel building & compile with microarchitecture tuning using Clang, LLVM LTO, Polly Vectorization and more!.")
    (home-page "https://github.com/MadGoatHaz/GOATd-Kernel")
    (license license:gpl3)))

(define-public happy-cli
  (package
    (name "happy-cli")
    (version "0.13.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/slopus/happy")
                    (commit "v0.13.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mobile and Web client for Claude Code and Codex - remote control your AI ")
    (description "Mobile and Web client for Claude Code and Codex - remote control your AI coding agent.")
    (home-page "https://github.com/slopus/happy")
    (license license:expat)))

(define-public immich-cli
  (package
    (name "immich-cli")
    (version "2.7.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/immich-app/immich")
                    (commit "v2.7.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "self-hosted photos and videos backup tool")
    (description "Self-hosted photos and videos backup tool.")
    (home-page "https://github.com/immich-app/immich")
    (license license:agpl3)))

(define-public jellyseerr
  (package
    (name "jellyseerr")
    (version "2.7.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/seerr-team/seerr")
                    (commit "v2.7.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "request management and media discovery tool for the Plex ecosystem")
    (description "Request management and media discovery tool for the Plex ecosystem.")
    (home-page "https://github.com/seerr-team/seerr")
    (license license:expat)))

(define-public laborejo
  (package
    (name "laborejo")
    (version "2.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/laborejo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "MIDI sequencer based on classical music notation")
    (description "MIDI sequencer based on classical music notation.")
    (home-page "https://laborejo.org/laborejo/")
    (license license:gpl3)))

(define-public lacuna-webpki
  (package
    (name "lacuna-webpki")
    (version "2.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lacuna-webpki.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Lacuna WebPKI native application")
    (description "The Lacuna WebPKI native application. An easy solution for using digital certificates in Web applications.")
    (home-page "http://webpki.lacunasoftware.com")
    (license license:non-copyleft)))

(define-public language-toolkit
  (package
    (name "language-toolkit")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/language-toolkit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple tool to document and create languages")
    (description "A simple tool to document and create languages.")
    (home-page "https://git.gay/ika4422/language-toolkit")
    (license license:gpl3+)))

(define-public lib32-libdovi
  (package
    (name "lib32-libdovi")
    (version "3.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/quietvoid/dovi_tool/tree/main/dolby_vision")
                    (commit "v3.3.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library to read and write Dolby Vision metadata C-API (32-bit)")
    (description "Library to read and write Dolby Vision metadata C-API (32-bit).")
    (home-page "https://github.com/quietvoid/dovi_tool/tree/main/dolby_vision")
    (license license:expat)))

(define-public lib32-libstdc5
  (package
    (name "lib32-libstdc5")
    (version "3.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libstdc++5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "legacy GNU Standard C++ library version 3 (32 bit)")
    (description "Legacy GNU Standard C++ library version 3 (32 bit).")
    (home-page "http://gcc.gnu.org")
    (license license:gpl2+)))

(define-public lib32-opencl-nvidia-beta
  (package
    (name "lib32-opencl-nvidia-beta")
    (version "595.58.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-opencl-nvidia-beta.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "OpenCL implemention for NVIDIA (32-bit, beta version)")
    (description "OpenCL implemention for NVIDIA (32-bit, beta version).")
    (home-page "https://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public lib32-python311-bin
  (package
    (name "lib32-python311-bin")
    (version "3.11.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-python311-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "major release 3")
    (description "Major release 3.11 of the Python high-level programming language (32-bit).")
    (home-page "https://www.python.org/")
    (license license:psfl)))

(define-public libloot
  (package
    (name "libloot")
    (version "0.29.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libloot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a library for the Load Order Optimisation Tool for Starfield, The Elder S")
    (description "A library for the Load Order Optimisation Tool for Starfield, The Elder Scrolls (Morrowind and later) and Fallout (3 and later) games.")
    (home-page "https://loot.github.io")
    (license license:gpl3)))

(define-public llama-cpp-clblast
  (package
    (name "llama-cpp-clblast")
    (version "b8644")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ggerganov/llama.cpp")
                    (commit "vb8644")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "port of Facebook's LLaMA model in C/C++(with Unofficial CLBlast Backend s")
    (description "Port of Facebook's LLaMA model in C/C++(with Unofficial CLBlast Backend support).")
    (home-page "https://github.com/ggerganov/llama.cpp")
    (license license:expat)))

(define-public loginized
  (package
    (name "loginized")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/juhaku/loginized")
                    (commit "v1.4.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gnome GDM Login Theme Manager")
    (description "Gnome GDM Login Theme Manager.")
    (home-page "https://github.com/juhaku/loginized")
    (license license:gpl3)))

(define-public masterpdfeditor-free
  (package
    (name "masterpdfeditor-free")
    (version "4.3.89")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/masterpdfeditor-free.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a complete solution for creation and editing PDF files - Free version wit")
    (description "A complete solution for creation and editing PDF files - Free version without watermark.")
    (home-page "https://code-industry.net/free-pdf-editor/")
    (license license:non-copyleft)))

(define-public min
  (package
    (name "min")
    (version "1.35.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/min.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast, minimal browser that protects your privacy")
    (description "A fast, minimal browser that protects your privacy.")
    (home-page "https://minbrowser.org")
    (license license:asl2.0)))

(define-public mingw-w64-mariadb-connector-c
  (package
    (name "mingw-w64-mariadb-connector-c")
    (version "3.4.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-mariadb-connector-c.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mariaDB client libraries (mingw-w64)")
    (description "MariaDB client libraries (mingw-w64).")
    (home-page "https://mariadb.com/docs/connectors/mariadb-connector-c")
    (license license:lgpl2.1+)))

(define-public mipsel-linux-gnu-gcc
  (package
    (name "mipsel-linux-gnu-gcc")
    (version "15.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mipsel-linux-gnu-gcc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the GNU Compiler Collection for the MIPS architecture")
    (description "The GNU Compiler Collection for the MIPS architecture.")
    (home-page "https://www.gnu.org/software/gcc/")
    (license license:non-copyleft)))

(define-public nbb
  (package
    (name "nbb")
    (version "1.4.206")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/babashka/nbb")
                    (commit "v1.4.206")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "scripting in Clojure on Node")
    (description "Scripting in Clojure on Node.js using SCI.")
    (home-page "https://github.com/babashka/nbb")
    (license license:non-copyleft)))

(define-public neural-amp-modeler-lv2
  (package
    (name "neural-amp-modeler-lv2")
    (version "0.1.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mikeoliphant/neural-amp-modeler-lv2")
                    (commit "v0.1.9")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "neural Amp Modeler (NAM) LV2 plugin")
    (description "Neural Amp Modeler (NAM) LV2 plugin.")
    (home-page "https://github.com/mikeoliphant/neural-amp-modeler-lv2")
    (license license:bsd-3)))

(define-public nvidia-340xx-dkms
  (package
    (name "nvidia-340xx-dkms")
    (version "340.108")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-340xx-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA driver sources for linux, 340xx legacy branch")
    (description "NVIDIA driver sources for linux, 340xx legacy branch.")
    (home-page "https://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public nvidia-beta
  (package
    (name "nvidia-beta")
    (version "595.58.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-beta.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA kernel module (beta version)")
    (description "NVIDIA kernel module (beta version).")
    (home-page "https://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public obsidianospm-git
  (package
    (name "obsidianospm-git")
    (version "r3.b74d866")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Obsidian-OS/opm")
                    (commit "vr3.b74d866")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "obsidianOS Package Manager, install pacman packages as ObsidianOS Overlays")
    (description "ObsidianOS Package Manager, install pacman packages as ObsidianOS Overlays.")
    (home-page "https://github.com/Obsidian-OS/opm")
    (license license:expat)))

(define-public omnissa-horizon-integrated-printing
  (package
    (name "omnissa-horizon-integrated-printing")
    (version "2512.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/omnissa-horizon-integrated-printing.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "omnissa Horizon Client - integrated printing")
    (description "Omnissa Horizon Client - integrated printing.")
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/virtual_desktop_and_apps/omnissa_horizon_clients/8")
    (license license:non-copyleft)))

(define-public onedrivegui-git
  (package
    (name "onedrivegui-git")
    (version "1.2.1.r10.g740cd51")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bpozdena/OneDriveGUI")
                    (commit "v1.2.1.r10.g740cd51")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple GUI for OneDrive Linux client, with multi-account support")
    (description "A simple GUI for OneDrive Linux client, with multi-account support.")
    (home-page "https://github.com/bpozdena/OneDriveGUI")
    (license license:gpl3+)))

(define-public opencl-amd-dev
  (package
    (name "opencl-amd-dev")
    (version "7.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/opencl-amd-dev.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rOCm extra runtime and developer packages")
    (description "ROCm extra runtime and developer packages. This package needs 16.45GB of disk space.")
    (home-page "http://www.amd.com")
    (license license:non-copyleft)))

(define-public openrgb-plugin-effects-git
  (package
    (name "openrgb-plugin-effects-git")
    (version "0.9.70.g4b11017")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin")
                    (commit "v0.9.70.g4b11017")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "effects plugin for OpenRGB")
    (description "Effects plugin for OpenRGB.")
    (home-page "https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin")
    (license license:gpl2)))

(define-public osu
  (package
    (name "osu")
    (version "20260325")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/osu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free-to-win rhythm game")
    (description "A free-to-win rhythm game.")
    (home-page "https://osu.ppy.sh")
    (license license:non-copyleft)))

(define-public osuboot-git
  (package
    (name "osuboot-git")
    (version "r36.131230c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/osuboot-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wrapper for osu!lazer")
    (description "Wrapper for osu!lazer. Downloads and executes the AppImage automatically without requiring any manual work.")
    (home-page "https://git.staropensource.de/JeremyStarTM/aur-osuboot-git")
    (license license:gpl3+)))

(define-public patroneo
  (package
    (name "patroneo")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/patroneo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an easy to use pattern based midi sequencer")
    (description "An easy to use pattern based midi sequencer.")
    (home-page "https://www.laborejo.org/patroneo/")
    (license license:gpl3)))

(define-public pear-desktop-git
  (package
    (name "pear-desktop-git")
    (version "3.11.0.r393.g8bd86e8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pear-devs/pear-desktop")
                    (commit "v3.11.0.r393.g8bd86e8")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extension for music player")
    (description "Extension for music player.")
    (home-page "https://github.com/pear-devs/pear-desktop")
    (license license:expat)))

(define-public perplexity
  (package
    (name "perplexity")
    (version "1.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mazixs/perplexity")
                    (commit "v1.5.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "native Perplexity AI client for Linux")
    (description "Native Perplexity AI client for Linux.")
    (home-page "https://github.com/mazixs/perplexity")
    (license license:asl2.0)))

(define-public psychonauts
  (package
    (name "psychonauts")
    (version "20130506")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/psychonauts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a mind-bending platforming adventure (game sold separately)")
    (description "A mind-bending platforming adventure (game sold separately).")
    (home-page "http://www.psychonauts.com/")
    (license license:non-copyleft)))

(define-public qobuz-player
  (package
    (name "qobuz-player")
    (version "0.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SofusA/qobuz-player")
                    (commit "v0.9.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "high resolution audio player backed by Qobuz")
    (description "High resolution audio player backed by Qobuz.")
    (home-page "https://github.com/SofusA/qobuz-player")
    (license license:gpl3)))

(define-public redeclipse
  (package
    (name "redeclipse")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/redeclipse.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free, casual arena shooter")
    (description "free, casual arena shooter.")
    (home-page "http://redeclipse.net")
    (license license:non-copyleft)))

(define-public rime-frost-git
  (package
    (name "rime-frost-git")
    (version "r265.76c91a9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gaboolic/rime-frost")
                    (commit "vr265.76c91a9")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rime 配置：白霜词库 | 蒹葭苍苍，白露为霜。基于雾凇拼音重制的，更纯净、词频准确、智能的词库。")
    (description "Rime 配置：白霜词库 | 蒹葭苍苍，白露为霜。基于雾凇拼音重制的，更纯净、词频准确、智能的词库。.")
    (home-page "https://github.com/gaboolic/rime-frost")
    (license license:gpl3+)))

(define-public rmpc-auto-theme-git
  (package
    (name "rmpc-auto-theme-git")
    (version "r22.e0f6399")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/animegolem/RMPC-Auto-Theme")
                    (commit "vr22.e0f6399")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dynamic theme generator for rmpc music player using K-means color extraction")
    (description "Dynamic theme generator for rmpc music player using K-means color extraction.")
    (home-page "https://github.com/animegolem/RMPC-Auto-Theme")
    (license license:expat)))

(define-public rofi-polkit-agent-git
  (package
    (name "rofi-polkit-agent-git")
    (version "r2.d0c5e52")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/czaplicki/rofi-polkit-agent")
                    (commit "vr2.d0c5e52")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "polkit agent, using rofi for UI")
    (description "Polkit agent, using rofi for UI.")
    (home-page "https://github.com/czaplicki/rofi-polkit-agent")
    (license license:expat)))

(define-public roomeqwizard
  (package
    (name "roomeqwizard")
    (version "5.31.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roomeqwizard.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a room acoustics analysis software for measuring and analysing room and l")
    (description "A room acoustics analysis software for measuring and analysing room and loudspeaker responses.")
    (home-page "https://www.roomeqwizard.com")
    (license license:non-copyleft)))

(define-public rtl8852au-dkms-git
  (package
    (name "rtl8852au-dkms-git")
    (version "r110.db4fa82")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/natimerry/rtl8852au")
                    (commit "vr110.db4fa82")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the WiFi driver for Realtek chipsets RTL8832AU and RTL8852AU (e")
    (description "The WiFi driver for Realtek chipsets RTL8832AU and RTL8852AU (e.g. ASUS USB-AX56, D-Link DW-AX1850, TP-Link AX1800).")
    (home-page "https://github.com/natimerry/rtl8852au")
    (license license:gpl2)))

(define-public scratch3
  (package
    (name "scratch3")
    (version "3.31.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/scratchfoundation/scratch-desktop")
                    (commit "v3.31.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "scratch 3")
    (description "Scratch 3.0 as a self-contained desktop application.")
    (home-page "https://github.com/scratchfoundation/scratch-desktop")
    (license license:agpl3)))

(define-public scrollmpris-git
  (package
    (name "scrollmpris-git")
    (version "1.0.0_r24.3e79f70")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BEST8OY/ScrollMPRIS")
                    (commit "v1.0.0_r24.3e79f70")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "scrolling MPRIS module for waybar")
    (description "Scrolling MPRIS module for waybar.")
    (home-page "https://github.com/BEST8OY/ScrollMPRIS")
    (license license:unlicense)))

(define-public silabs-usbxpresshostsdk
  (package
    (name "silabs-usbxpresshostsdk")
    (version "6.7.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/silabs-usbxpresshostsdk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flashing tool for CP210X UART bridges")
    (description "Flashing tool for CP210X UART bridges.")
    (home-page "https://www.silabs.com/search#q=usbxpresshostsdk&t=Documentation&sort=relevancy")
    (license license:non-copyleft)))

(define-public slack-electron
  (package
    (name "slack-electron")
    (version "4.47.69")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/slack-electron.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "slack Desktop (Beta) for Linux, using the system Electron package")
    (description "Slack Desktop (Beta) for Linux, using the system Electron package.")
    (home-page "https://slack.com/downloads/linux")
    (license license:non-copyleft)))

(define-public snapx-ui
  (package
    (name "snapx-ui")
    (version "0.r4.0.makepkg.1.g5c6ddf7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SnapXL/SnapX")
                    (commit "v0.r4.0.makepkg.1.g5c6ddf7")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "screenshot tool that handles images, text, and video (fork of ShareX)")
    (description "Screenshot tool that handles images, text, and video (fork of ShareX). SnapX Avalonia-based UI (works best on X11).")
    (home-page "https://github.com/SnapXL/SnapX")
    (license license:gpl3+)))

(define-public sonusmix-git
  (package
    (name "sonusmix-git")
    (version "r195.7369dab")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/sonusmix/sonusmix")
                    (commit "vr195.7369dab")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "next-gen Pipewire audio routing tool")
    (description "Next-gen Pipewire audio routing tool.")
    (home-page "https://codeberg.org/sonusmix/sonusmix")
    (license license:mpl2.0)))

(define-public soteria-git
  (package
    (name "soteria-git")
    (version "0.2.2.r1.g02ae19a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/imvaskel/soteria")
                    (commit "v0.2.2.r1.g02ae19a")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GTK-based polkit authentication agent")
    (description "A GTK-based polkit authentication agent.")
    (home-page "https://github.com/imvaskel/soteria")
    (license license:asl2.0)))

(define-public spacebar-git
  (package
    (name "spacebar-git")
    (version "r3678.6bf4637")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/spacebarchat/server")
                    (commit "vr3678.6bf4637")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "spacebar is a free, opensource selfhostable discord-compatible chat, voic")
    (description "Spacebar is a free, opensource selfhostable discord-compatible chat, voice and video platform.")
    (home-page "https://github.com/spacebarchat/server")
    (license license:agpl3)))

(define-public spotatui-git
  (package
    (name "spotatui-git")
    (version "0.35.5.r3.ga3ee518")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LargeModGames/spotatui")
                    (commit "v0.35.5.r3.ga3ee518")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Spotify client for the terminal written in Rust, powered by Ratatui (gi")
    (description "A Spotify client for the terminal written in Rust, powered by Ratatui (git version).")
    (home-page "https://github.com/LargeModGames/spotatui")
    (license license:expat)))

(define-public staruml
  (package
    (name "staruml")
    (version "7.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/staruml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a sophisticated software modeler")
    (description "A sophisticated software modeler.")
    (home-page "http://staruml.io/")
    (license license:non-copyleft)))

(define-public steamfetch
  (package
    (name "steamfetch")
    (version "0.5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/unhappychoice/steamfetch")
                    (commit "v0.5.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "neofetch for Steam - Display your Steam stats in terminal with style")
    (description "neofetch for Steam - Display your Steam stats in terminal with style.")
    (home-page "https://github.com/unhappychoice/steamfetch")
    (license license:isc)))

(define-public sunvox
  (package
    (name "sunvox")
    (version "2.1.4.d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sunvox.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small, fast and powerful modular synthesizer with pattern-based sequencer")
    (description "Small, fast and powerful modular synthesizer with pattern-based sequencer (tracker).")
    (home-page "http://warmplace.ru/soft/sunvox/")
    (license license:bsd-3)))

(define-public superlauncher-mc
  (package
    (name "superlauncher-mc")
    (version "1.4.0.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ludvig2457/SuperLauncherMC")
                    (commit "v1.4.0.9")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "superLauncherMC — Advanced Minecraft launcher with mod and server support")
    (description "SuperLauncherMC — Advanced Minecraft launcher with mod and server support (new design release).")
    (home-page "https://github.com/ludvig2457/SuperLauncherMC")
    (license license:gpl3)))

(define-public symbolicator
  (package
    (name "symbolicator")
    (version "23.10.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/getsentry/symbolicator")
                    (commit "v23.10.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a sentry symbolication service for native stacktraces")
    (description "A sentry symbolication service for native stacktraces.")
    (home-page "https://github.com/getsentry/symbolicator")
    (license license:non-copyleft)))

(define-public tanglet
  (package
    (name "tanglet")
    (version "1.6.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tanglet.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "single player word finding game")
    (description "Single player word finding game.")
    (home-page "https://gottcode.org/tanglet/")
    (license license:gpl3+)))

(define-public tg-config
  (package
    (name "tg-config")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/meowrch/tg-config")
                    (commit "v1.0.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "declarative Telegram Desktop configuration via TOML config files - perfec")
    (description "Declarative Telegram Desktop configuration via TOML config files - perfect for dotfiles and ricing.")
    (home-page "https://github.com/meowrch/tg-config")
    (license license:gpl3)))

(define-public thcrap-steam-proton-wrapper-git
  (package
    (name "thcrap-steam-proton-wrapper-git")
    (version "r24.519e82c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tactikauan/thcrap-steam-proton-wrapper")
                    (commit "vr24.519e82c")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a wrapper script for launching the official Touhou games on Steam with pa")
    (description "A wrapper script for launching the official Touhou games on Steam with patches.")
    (home-page "https://github.com/tactikauan/thcrap-steam-proton-wrapper")
    (license license:unlicense)))

(define-public tray-mixer-plus
  (package
    (name "tray-mixer-plus")
    (version "0.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tray_mixer_plus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small tray sound volume control based tray_mixer project by Claudio Matsu")
    (description "Small tray sound volume control based tray_mixer project by Claudio Matsuoka and other authors.")
    (home-page "http://forum.altlinux.org")
    (license license:gpl3+)))

(define-public tvb-recorder
  (package
    (name "tvb-recorder")
    (version "2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/tuxnix/tvb-recorder")
                    (commit "v2.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tV-Browser plugins for switching and recording")
    (description "TV-Browser plugins for switching and recording.")
    (home-page "https://codeberg.org/tuxnix/tvb-recorder")
    (license license:non-copyleft)))

(define-public udev-browse-git
  (package
    (name "udev-browse-git")
    (version "0.3.r0.g7ba128e")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/udev-browse-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical browser for the Linux sysfs device tree")
    (description "Graphical browser for the Linux sysfs device tree.")
    (home-page "http://0pointer.de/blog/projects/udev-browse.html")
    (license license:lgpl3+)))

(define-public ue4localizationstool-zenity
  (package
    (name "ue4localizationstool-zenity")
    (version "2.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amrshaheen61/UE4LocalizationsTool")
                    (commit "v2.7")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple tool to edit Unreal Engine 4 text files (patched to use native fil")
    (description "Simple tool to edit Unreal Engine 4 text files (patched to use native filepicker).")
    (home-page "https://github.com/amrshaheen61/UE4LocalizationsTool")
    (license license:expat)))

(define-public unigine-tropics
  (package
    (name "unigine-tropics")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unigine-tropics.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "demonstration and benchmarking of the Unigine 3D engine")
    (description "Demonstration and benchmarking of the Unigine 3D engine.")
    (home-page "http://unigine.com/")
    (license license:non-copyleft)))

(define-public unigine-valley
  (package
    (name "unigine-valley")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unigine-valley.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "latest Interactive Unigine Benchmark")
    (description "Latest Interactive Unigine Benchmark.")
    (home-page "http://www.unigine.com")
    (license license:non-copyleft)))

(define-public unreal-tournament-bin
  (package
    (name "unreal-tournament-bin")
    (version "469e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OldUnreal/UnrealTournamentPatches")
                    (commit "v469e")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unreal Tournament 99 (GOTY) native binaries (OldUnreal)")
    (description "Unreal Tournament 99 (GOTY) native binaries (OldUnreal).")
    (home-page "https://github.com/OldUnreal/UnrealTournamentPatches")
    (license license:non-copyleft)))

(define-public upwork
  (package
    (name "upwork")
    (version "5.8.0.41")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/upwork.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "track your time for Hourly Payment Protection")
    (description "Track your time for Hourly Payment Protection. Stay connected.")
    (home-page "https://www.upwork.com/ab/downloads/?os=linux")
    (license license:non-copyleft)))

(define-public veeam
  (package
    (name "veeam")
    (version "13.0.1.404")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/veeam.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "veeam Agent for Linux")
    (description "Veeam Agent for Linux.")
    (home-page "https://www.veeam.com/products/downloads.html")
    (license license:non-copyleft)))

(define-public vencord-hook
  (package
    (name "vencord-hook")
    (version "1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Vencord/Installer")
                    (commit "v1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pacman hook to automatically install Vencord after Discord updates")
    (description "Pacman hook to automatically install Vencord after Discord updates.")
    (home-page "https://github.com/Vencord/Installer.git")
    (license license:gpl3)))

(define-public vm-curator
  (package
    (name "vm-curator")
    (version "0.4.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mroboff/vm-curator")
                    (commit "v0.4.7")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a TUI application to manage QEMU/KVM VMs")
    (description "A TUI application to manage QEMU/KVM VMs.")
    (home-page "https://github.com/mroboff/vm-curator")
    (license license:expat)))

(define-public waybar-niri-taskbar
  (package
    (name "waybar-niri-taskbar")
    (version "0.4.0+niri.25.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lawngnome/niri-taskbar")
                    (commit "v0.4.0+niri.25.11")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple taskbar for Niri, written in Rust: release version")
    (description "A simple taskbar for Niri, written in Rust: release version.")
    (home-page "https://github.com/lawngnome/niri-taskbar")
    (license license:expat)))

(define-public waydroid-launcher-git
  (package
    (name "waydroid-launcher-git")
    (version "r1.58d7810")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chenx-dust/waydroid-launcher")
                    (commit "vr1.58d7810")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "for better launching Waydroid")
    (description "For better launching Waydroid. Sources from Bazzite.")
    (home-page "https://github.com/chenx-dust/waydroid-launcher")
    (license license:asl2.0)))

(define-public webmin
  (package
    (name "webmin")
    (version "2.610")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/webmin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a web-based administration interface for Unix systems")
    (description "A web-based administration interface for Unix systems.")
    (home-page "http://www.webmin.com/")
    (license license:non-copyleft)))

(define-public wheelwizard
  (package
    (name "wheelwizard")
    (version "2.4.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TeamWheelWizard/WheelWizard")
                    (commit "v2.4.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wheelWizard – Mario Kart Mod Manager & Retro Rewind Auto Updater")
    (description "WheelWizard – Mario Kart Mod Manager & Retro Rewind Auto Updater.")
    (home-page "https://github.com/TeamWheelWizard/WheelWizard")
    (license license:gpl3)))

(define-public wineasio
  (package
    (name "wineasio")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wineasio/wineasio")
                    (commit "v1.3.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aSIO driver implementation for Wine")
    (description "ASIO driver implementation for Wine.")
    (home-page "https://github.com/wineasio/wineasio")
    (license license:gpl2+)))

(define-public wiznoteplus-bin
  (package
    (name "wiznoteplus-bin")
    (version "2.12.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wiznoteplus-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a community-driven cross-platform note-taking client")
    (description "A community-driven cross-platform note-taking client.(Prebuilt version.Use system-wide electron)为知笔记 Plus 是一款基于云服务的跨平台个人知识管理工具。.")
    (home-page "https://altairwei.github.io/WizNotePlus/")
    (license license:gpl3)))

(define-public xavs2-git
  (package
    (name "xavs2-git")
    (version "1.4.r0.geae1e8b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pkuvcl/xavs2")
                    (commit "v1.4.r0.geae1e8b")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-Source encoder of AVS2-P2/IEEE1857")
    (description "Open-Source encoder of AVS2-P2/IEEE1857.4 video coding standard (git version).")
    (home-page "https://github.com/pkuvcl/xavs2/")
    (license license:gpl2+)))

(define-public xmousepasteblock
  (package
    (name "xmousepasteblock")
    (version "1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/milaq/XMousePasteBlock")
                    (commit "v1.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userspace tool to disable middle mouse button paste in Xorg")
    (description "Userspace tool to disable middle mouse button paste in Xorg.")
    (home-page "https://github.com/milaq/XMousePasteBlock")
    (license license:gpl3+)))

(define-public youtube-chat-rs-git
  (package
    (name "youtube-chat-rs-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/efekrskl/youtube-chat-rs")
                    (commit "v0.1.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fetch YouTube live chat messages from terminal")
    (description "Fetch YouTube live chat messages from terminal.")
    (home-page "https://github.com/efekrskl/youtube-chat-rs")
    (license license:expat)))

(define-public ytdownloader
  (package
    (name "ytdownloader")
    (version "1.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kanehekili/YoutubeDownloader")
                    (commit "v1.6.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gKT3 frontend for yt-dlp (the active branch of youtube-dl) with focus on ")
    (description "GKT3 frontend for yt-dlp (the active branch of youtube-dl) with focus on best audio and video. Uses ffmpeg for joining audio & video.")
    (home-page "https://github.com/kanehekili/YoutubeDownloader")
    (license license:gpl2)))

