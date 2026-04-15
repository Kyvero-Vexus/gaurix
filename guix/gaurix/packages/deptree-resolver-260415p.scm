;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260415p
;;; Resolves packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415p)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (            python-javaobj-py3
            python-cotengra
            gh-dash-bin
            ktlint-compose-rules
            aichat-ng-bin
            paracon
            redress-bin
            tododo-bin
            dwatch-bin
            element-lk-jwt-service
            harbor-wave
            limine-booster
            architect-git
            artificial-rage-git
            bdash-bin
            disk-usage
            livekit
            local-llama-bin
            luajit-sdl2-git
            luajit-sdl3-git
            mermaid-ascii-git
            pam-exec-ssh-git
            protonmail-bridge-free-nokeychain-git
            chatd-bin
            python-onkyo-eiscp
            linpac-git
            mcsast
            vapoursynth-plugin-mlrt-migx-runtime-git
            lib32-obs-vkcapture
            libastal-lua51-git
            libastal-lua53-git
            vrms-arch-git
            xlibre-video-amdgpu
            classisland-git
            lib32-libass
            octopi-git
            xdg-desktop-portal-luminous
            zerobrew-git
            android-ndk-28
            backintime
            cachyos-service-manager
            classisland
            howdy-git
            karukan
            lib32-libxml2-legacy
            linux-lts515-docs
            linux-lts515-headers
            mips64el-linux-gnu-gcc-bootstrap
            pgadmin4-desktop-native
            sentry
            simgear-git
            sonic-tte-git
            spotify-1-1
            ssh-studio
            sunflower
            tagger
            terx-bin
            tidal-hifi-tidaluna
            tmpgentoo
            translatelocally-git
            ultimate-tic-tac-toe-git
            vial-keychron-bin
            whisper-cpp-hip
            xerahs-git
            yt-dlg-git
            aeroshell-smodglow-x11-git
            am
            artemisrgb-git
            avp
            blaadpapers
            booktab
            bootc
            bsg-diaspora-sa
            btrfs-assistant-git
            catapult
            chirp-next
            clipse-gui
            collapseloader-git
            dion-bin
            dosbox-x
            duckstation-qt-bin
            dxvk-nvapi-mingw))

(define-public python-javaobj-py3
  (package
    (name "python-javaobj-py3")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-javaobj-py3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "module for reading and writing serialized java objects")
    (description "Module for reading and writing serialized java objects.")
    (home-page "https://pypi.org/project/javaobj-py3/")
    (license license:asl2.0)))

(define-public python-cotengra
  (package
    (name "python-cotengra")
    (version "0.7.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-cotengra.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hyper optimized contraction trees for large tensor networks and einsums")
    (description "Hyper optimized contraction trees for large tensor networks and einsums.")
    (home-page "https://github.com/jcmgray/cotengra")
    (license license:asl2.0)))

(define-public gh-dash-bin
  (package
    (name "gh-dash-bin")
    (version "4.23.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gh-dash-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a beautiful CLI dashboard extension for GitHub to display pull requests and i...")
    (description "A beautiful CLI dashboard extension for GitHub to display pull requests and issues with filters you care about.")
    (home-page "https://github.com/dlvhdr/gh-dash")
    (license license:expat)))

(define-public ktlint-compose-rules
  (package
    (name "ktlint-compose-rules")
    (version "0.5.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ktlint-compose-rules.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lint rules for ktlint/detekt aimed to contribute to a healthier usage of Comp...")
    (description "Lint rules for ktlint/detekt aimed to contribute to a healthier usage of Compose. Actively maintained and evolved fork of the Twitter Compose rules.")
    (home-page "https://github.com/mrmans0n/compose-rules")
    (license license:asl2.0)))

(define-public aichat-ng-bin
  (package
    (name "aichat-ng-bin")
    (version "0.31.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aichat-ng-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openAI, ChatGPT, Gemini, Claude, Mistral, Ollama and more in your terminal. F...")
    (description "OpenAI, ChatGPT, Gemini, Claude, Mistral, Ollama and more in your terminal. Fork with advanced features.")
    (home-page "https://github.com/blob42/aichat-ng")
    (license license:agpl3)))

(define-public paracon
  (package
    (name "paracon")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/paracon.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "paracon is a packet radio terminal for Linux, Mac and Windows")
    (description "Paracon is a packet radio terminal for Linux, Mac and Windows.")
    (home-page "https://github.com/mfncooper/paracon")
    (license license:expat)))

(define-public redress-bin
  (package
    (name "redress-bin")
    (version "1.2.64")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/redress-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool for analyzing stripped Go binaries")
    (description "A tool for analyzing stripped Go binaries.")
    (home-page "https://github.com/goretk/redress")
    (license license:agpl3+)))

(define-public tododo-bin
  (package
    (name "tododo-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tododo-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the todo manager that should be extinct")
    (description "The todo manager that should be extinct.")
    (home-page "https://github.com/bmarse/tododo")
    (license license:expat)))

(define-public dwatch-bin
  (package
    (name "dwatch-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dwatch-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool to watch command output for differences and send notifications")
    (description "A tool to watch command output for differences and send notifications.")
    (home-page "https://github.com/IngoMeyer441/dwatch")
    (license license:expat)))

(define-public element-lk-jwt-service
  (package
    (name "element-lk-jwt-service")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/element-lk-jwt-service.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "liveKit Management Service for Element Call")
    (description "LiveKit Management Service for Element Call.")
    (home-page "https://github.com/vector-im/lk-jwt-service/")
    (license license:non-copyleft)))

(define-public harbor-wave
  (package
    (name "harbor-wave")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/harbor-wave.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "digital Ocean Ephemeral VM/Droplet tool")
    (description "Digital Ocean Ephemeral VM/Droplet tool.")
    (home-page "https://github.com/NetworkJack2/harbor-wave")
    (license license:non-copyleft)))

(define-public limine-booster
  (package
    (name "limine-booster")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/limine-booster.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zero-config automation for Limine boot entries with Booster")
    (description "Zero-config automation for Limine boot entries with Booster.")
    (home-page "https://github.com/abshka/limine-booster")
    (license license:gpl3)))

(define-public architect-git
  (package
    (name "architect-git")
    (version "r25.e924876")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/neoapps-dev/Architect")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nix-like configuration manager for pacman")
    (description "Nix-like configuration manager for pacman.")
    (home-page "https://github.com/neoapps-dev/Architect")
    (license license:gpl3)))

(define-public artificial-rage-git
  (package
    (name "artificial-rage-git")
    (version "r525.7a9f73d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/akselmo/artificial-rage")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "scifi FPS made with Raylib")
    (description "Scifi FPS made with Raylib.")
    (home-page "https://codeberg.org/akselmo/artificial-rage")
    (license license:gpl3+)))

(define-public bdash-bin
  (package
    (name "bdash-bin")
    (version "1.33.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bdash-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple SQL Client for lightweight data analysis.(Prebuilt version.Use system-...")
    (description "Simple SQL Client for lightweight data analysis.(Prebuilt version.Use system-wide electron).")
    (home-page "https://github.com/bdash-app/bdash")
    (license license:expat)))

(define-public disk-usage
  (package
    (name "disk-usage")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/disk_usage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool to monitor disk usage and alert when usage exceeds a threshold")
    (description "A tool to monitor disk usage and alert when usage exceeds a threshold.")
    (home-page "https://github.com/0xM4LL0C/disk_usage")
    (license license:expat)))

(define-public livekit
  (package
    (name "livekit")
    (version "1.10.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/livekit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "liveKit: Real-time video, audio and data for developers")
    (description "LiveKit: Real-time video, audio and data for developers.")
    (home-page "https://livekit.io/")
    (license license:asl2.0)))

(define-public local-llama-bin
  (package
    (name "local-llama-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/local-llama-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "local Llama also known as L³ is designed to be easy to use, with a user-frien...")
    (description "Local Llama also known as L³ is designed to be easy to use, with a user-friendly interface and advanced settings.(Prebuilt version.Use system-wide electron).")
    (home-page "https://folio.tib0.com/")
    (license license:non-copyleft)))

(define-public luajit-sdl2-git
  (package
    (name "luajit-sdl2-git")
    (version "r55.33529d3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sonoro1234/luajit-sdl2")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "autogenerated LuaJIT bindings for SDL2 with threads and audio")
    (description "Autogenerated LuaJIT bindings for SDL2 with threads and audio.")
    (home-page "https://github.com/sonoro1234/luajit-sdl2")
    (license license:expat)))

(define-public luajit-sdl3-git
  (package
    (name "luajit-sdl3-git")
    (version "r15.9c0b802")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sonoro1234/luajit-sdl3")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "autogenerated LuaJIT bindings for SDL3 with threads and audio")
    (description "Autogenerated LuaJIT bindings for SDL3 with threads and audio.")
    (home-page "https://github.com/sonoro1234/luajit-sdl3")
    (license license:expat)))

(define-public mermaid-ascii-git
  (package
    (name "mermaid-ascii-git")
    (version "0.7.0.r0.g14ea0d2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AlexanderGrooff/mermaid-ascii")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "render Mermaid graphs inside your terminal (development version)")
    (description "Render Mermaid graphs inside your terminal (development version).")
    (home-page "https://github.com/AlexanderGrooff/mermaid-ascii")
    (license license:expat)))

(define-public pam-exec-ssh-git
  (package
    (name "pam-exec-ssh-git")
    (version "r22.cc3b533")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/x70b1/pam_exec-ssh")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unlock SSH keys on login using PAM")
    (description "Unlock SSH keys on login using PAM.")
    (home-page "https://github.com/x70b1/pam_exec-ssh")
    (license license:non-copyleft)))

(define-public protonmail-bridge-free-nokeychain-git
  (package
    (name "protonmail-bridge-free-nokeychain-git")
    (version "3.24.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mnixry/proton-bridge")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "proton Mail Bridge fork (free) without keychain requirement; stores secrets i...")
    (description "Proton Mail Bridge fork (free) without keychain requirement; stores secrets in a file.")
    (home-page "https://github.com/mnixry/proton-bridge")
    (license license:gpl3)))

(define-public chatd-bin
  (package
    (name "chatd-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chatd-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "chat with your documents using local AI.(Prebuilt version.Use system-wide ele...")
    (description "Chat with your documents using local AI.(Prebuilt version.Use system-wide electron).")
    (home-page "https://chatd.ai/")
    (license license:expat)))

(define-public python-onkyo-eiscp
  (package
    (name "python-onkyo-eiscp")
    (version "1.2.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-onkyo-eiscp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "control Onkyo receivers over ethernet")
    (description "Control Onkyo receivers over ethernet.")
    (home-page "https://github.com/miracle2k/onkyo-eiscp")
    (license license:expat)))

(define-public linpac-git
  (package
    (name "linpac-git")
    (version "0.28")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linpac-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "amateur Radio AX.25 chat and PBBS program using Linux's AX.25 stack")
    (description "Amateur Radio AX.25 chat and PBBS program using Linux's AX.25 stack.")
    (home-page "https://sourceforge.net/projects/linpac/")
    (license license:non-copyleft)))

(define-public mcsast
  (package
    (name "mcsast")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mcsast.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "manage Minecraft server / proxy / plugins quickly and easily!")
    (description "Manage Minecraft server / proxy / plugins quickly and easily!.")
    (home-page "https://github.com/MagicTeaMC/Minecraft-server-auto-setup")
    (license license:gpl3+)))

(define-public vapoursynth-plugin-mlrt-migx-runtime-git
  (package
    (name "vapoursynth-plugin-mlrt-migx-runtime-git")
    (version "786.83b0180")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AmusementClub/vs-mlrt")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for VapourSynth: mlrt (MIGraphX runtime)")
    (description "Plugin for VapourSynth: mlrt (MIGraphX runtime).")
    (home-page "https://github.com/AmusementClub/vs-mlrt")
    (license license:gpl3)))

(define-public lib32-obs-vkcapture
  (package
    (name "lib32-obs-vkcapture")
    (version "1.5.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-obs-vkcapture.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "oBS Linux Vulkan/OpenGL game capture (32-bit)")
    (description "OBS Linux Vulkan/OpenGL game capture (32-bit).")
    (home-page "https://github.com/nowrep/obs-vkcapture")
    (license license:gpl2+)))

(define-public libastal-lua51-git
  (package
    (name "libastal-lua51-git")
    (version "r10.ad63ffc")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tokyob0t/astal-lua")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua bindings for libstal")
    (description "Lua bindings for libstal.")
    (home-page "https://github.com/tokyob0t/astal-lua")
    (license license:lgpl2.1)))

(define-public libastal-lua53-git
  (package
    (name "libastal-lua53-git")
    (version "r10.ad63ffc")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tokyob0t/astal-lua")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua bindings for libstal")
    (description "Lua bindings for libstal.")
    (home-page "https://github.com/tokyob0t/astal-lua")
    (license license:lgpl2.1)))

(define-public vrms-arch-git
  (package
    (name "vrms-arch-git")
    (version "2.0.1.r0.g637e123")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gardenappl/vrms-arch")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "virtual Richard M. Stallman for Arch Linux (updated fork)")
    (description "Virtual Richard M. Stallman for Arch Linux (updated fork).")
    (home-page "https://github.com/gardenappl/vrms-arch")
    (license license:non-copyleft)))

(define-public xlibre-video-amdgpu
  (package
    (name "xlibre-video-amdgpu")
    (version "25.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xlibre-video-amdgpu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xLibre fork of X.Org amdgpu video driver")
    (description "XLibre fork of X.Org amdgpu video driver.")
    (home-page "https://github.com/X11Libre/xf86-video-amdgpu")
    (license license:non-copyleft)))

(define-public classisland-git
  (package
    (name "classisland-git")
    (version "2.0.0.0.r16.ga0ce760")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ClassIsland/ClassIsland")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "适用于班级大屏的课表小工具（最新开发构建）。Class schedule displaying tool for interactive whiteboa...")
    (description "适用于班级大屏的课表小工具（最新开发构建）。Class schedule displaying tool for interactive whiteboards in classrooms. (Built from latest Git commit).")
    (home-page "https://github.com/ClassIsland/ClassIsland")
    (license license:gpl3)))

(define-public lib32-libass
  (package
    (name "lib32-libass")
    (version "0.17.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libass.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a portable library for SSA/ASS subtitles rendering (32 bit)")
    (description "A portable library for SSA/ASS subtitles rendering (32 bit).")
    (home-page "https://github.com/libass/libass/")
    (license license:bsd-3)))

(define-public octopi-git
  (package
    (name "octopi-git")
    (version "0.16.2.r31.d98b3541")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aarnt/octopi")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "this is Octopi, a powerful Pacman frontend using Qt libs")
    (description "This is Octopi, a powerful Pacman frontend using Qt libs.")
    (home-page "https://github.com/aarnt/octopi")
    (license license:gpl2)))

(define-public xdg-desktop-portal-luminous
  (package
    (name "xdg-desktop-portal-luminous")
    (version "0.1.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xdg-desktop-portal-luminous.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xdg-desktop-portal backend for wlroots based compositors, providing screensho...")
    (description "Xdg-desktop-portal backend for wlroots based compositors, providing screenshot and screencast.")
    (home-page "https://github.com/waycrate/xdg-desktop-portal-luminous")
    (license license:non-copyleft)))

(define-public zerobrew-git
  (package
    (name "zerobrew-git")
    (version "r109.31b8d83")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lucasgelfond/zerobrew")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a drop-in, 5-20x faster, experimental Homebrew alternative")
    (description "A drop-in, 5-20x faster, experimental Homebrew alternative.")
    (home-page "https://github.com/lucasgelfond/zerobrew")
    (license license:asl2.0)))

(define-public android-ndk-28
  (package
    (name "android-ndk-28")
    (version "r28.c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-ndk-28.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "android C/C++ developer kit")
    (description "Android C/C++ developer kit.")
    (home-page "https://developer.android.com/ndk/")
    (license license:non-copyleft)))

(define-public backintime
  (package
    (name "backintime")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/backintime.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple backup system inspired from the Flyback Project and TimeVault. Qt6 GUI...")
    (description "Simple backup system inspired from the Flyback Project and TimeVault. Qt6 GUI version.")
    (home-page "https://github.com/bit-team/backintime")
    (license license:non-copyleft)))

(define-public cachyos-service-manager
  (package
    (name "cachyos-service-manager")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cachyos-service-manager.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "full-featured systemd service manager for CachyOS (Qt6 + GTK4 frontends)")
    (description "Full-featured systemd service manager for CachyOS (Qt6 + GTK4 frontends).")
    (home-page "https://github.com/Goitonthefloor/cachyos-service-manager")
    (license license:expat)))

(define-public classisland
  (package
    (name "classisland")
    (version "2.0.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/classisland.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "适用于班级大屏的课表小工具。Class schedule displaying tool for interactive whiteboards in c...")
    (description "适用于班级大屏的课表小工具。Class schedule displaying tool for interactive whiteboards in classrooms.")
    (home-page "https://github.com/ClassIsland/ClassIsland")
    (license license:gpl3)))

(define-public howdy-git
  (package
    (name "howdy-git")
    (version "r586.c4521c1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/boltgolt/howdy")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "windows Hello style facial authentication for Linux")
    (description "Windows Hello style facial authentication for Linux.")
    (home-page "https://github.com/boltgolt/howdy")
    (license license:expat)))

(define-public karukan
  (package
    (name "karukan")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/karukan.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "japanese Input Method System for Linux, Neural Kana-Kanji Conversion Engine +...")
    (description "Japanese Input Method System for Linux, Neural Kana-Kanji Conversion Engine + fcitx5 IME.")
    (home-page "https://github.com/togatoga/karukan")
    (license license:non-copyleft)))

(define-public lib32-libxml2-legacy
  (package
    (name "lib32-libxml2-legacy")
    (version "2.13.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libxml2-legacy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xML C parser and toolkit (32-bit) (legacy version)")
    (description "XML C parser and toolkit (32-bit) (legacy version).")
    (home-page "https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home")
    (license license:expat)))

(define-public linux-lts515-docs
  (package
    (name "linux-lts515-docs")
    (version "5.15.202")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-lts515-docs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "documentation for the LTS Linux 5.15.x kernel")
    (description "Documentation for the LTS Linux 5.15.x kernel.")
    (home-page "https://www.kernel.org/")
    (license license:gpl2)))

(define-public linux-lts515-headers
  (package
    (name "linux-lts515-headers")
    (version "5.15.202")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-lts515-headers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "headers and scripts for building modules for the LTS Linux 5.15.x kernel")
    (description "Headers and scripts for building modules for the LTS Linux 5.15.x kernel.")
    (home-page "https://www.kernel.org/")
    (license license:gpl2)))

(define-public mips64el-linux-gnu-gcc-bootstrap
  (package
    (name "mips64el-linux-gnu-gcc-bootstrap")
    (version "15.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mips64el-linux-gnu-gcc-bootstrap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the GNU Compiler Collection - bootstrap/stage1 cross compiler for the MIPS64E...")
    (description "The GNU Compiler Collection - bootstrap/stage1 cross compiler for the MIPS64EL target (for the toolchain with GNU C library and multilib ABI).")
    (home-page "https://gcc.gnu.org/")
    (license license:non-copyleft)))

(define-public pgadmin4-desktop-native
  (package
    (name "pgadmin4-desktop-native")
    (version "9.13")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pgadmin4-desktop-native.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pgAdmin 4 desktop (System Electron 34 + Venv libs) built from source")
    (description "PgAdmin 4 desktop (System Electron 34 + Venv libs) built from source.")
    (home-page "https://www.pgadmin.org/")
    (license license:non-copyleft)))

(define-public sentry
  (package
    (name "sentry")
    (version "23.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sentry.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python-based realtime logging and aggregation server")
    (description "Python-based realtime logging and aggregation server.")
    (home-page "http://pypi.python.org/pypi/sentry")
    (license license:bsd-3)))

(define-public simgear-git
  (package
    (name "simgear-git")
    (version "2024.1.0r6266.a5af7601")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/simgear-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a set of open-source libraries designed to be used as building blocks for qui...")
    (description "A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications.")
    (home-page "https://www.flightgear.org/")
    (license license:gpl3+)))

(define-public sonic-tte-git
  (package
    (name "sonic-tte-git")
    (version "0.1.r20.g070dce1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/shmall03/sonic-tte")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "animated terminal media screensaver using TerminalTextEffects")
    (description "Animated terminal media screensaver using TerminalTextEffects.")
    (home-page "https://github.com/shmall03/sonic-tte")
    (license license:gpl3)))

(define-public spotify-1-1
  (package
    (name "spotify-1-1")
    (version "1.1.84.716")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/spotify-1.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a proprietary music streaming service. (Legacy version branch v1.1.)")
    (description "A proprietary music streaming service. (Legacy version branch v1.1.).")
    (home-page "https://www.spotify.com")
    (license license:non-copyleft)))

(define-public ssh-studio
  (package
    (name "ssh-studio")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ssh-studio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "easy, GUI SSH config editor and validator built with Python, GTK 4 and libadw...")
    (description "Easy, GUI SSH config editor and validator built with Python, GTK 4 and libadwaita.")
    (home-page "https://github.com/BuddySirJava/SSH-Studio")
    (license license:gpl3+)))

(define-public sunflower
  (package
    (name "sunflower")
    (version "0.5.63")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sunflower.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small and highly customizable twin-panel file manager for Linux with support ...")
    (description "Small and highly customizable twin-panel file manager for Linux with support for plugins.")
    (home-page "https://sunflower-fm.org")
    (license license:gpl3)))

(define-public tagger
  (package
    (name "tagger")
    (version "2024.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tagger.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an easy-to-use music tag (metadata) editor")
    (description "An easy-to-use music tag (metadata) editor.")
    (home-page "https://github.com/NickvisionApps/Tagger")
    (license license:gpl3+)))

(define-public terx-bin
  (package
    (name "terx-bin")
    (version "0.2.22")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/terx-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dEPRECATED: Use subterm-bin instead. Cross-platform SSH client with GPU-accel...")
    (description "DEPRECATED: Use subterm-bin instead. Cross-platform SSH client with GPU-accelerated terminal rendering.")
    (home-page "https://github.com/OutrageLabs/terX")
    (license license:non-copyleft)))

(define-public tidal-hifi-tidaluna
  (package
    (name "tidal-hifi-tidaluna")
    (version "6.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tidal-hifi-tidaluna.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the web version of Tidal running in electron with hifi support thanks to wide...")
    (description "The web version of Tidal running in electron with hifi support thanks to widevine (with TidaLuna client mod).")
    (home-page "https://github.com/Mastermindzh/tidal-hifi")
    (license license:non-copyleft)))

(define-public tmpgentoo
  (package
    (name "tmpgentoo")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tmpgentoo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "part of the tmplinux suite. Temporary gentoo Linux")
    (description "Part of the tmplinux suite. Temporary gentoo Linux.")
    (home-page "https://github.com/TheOddCell/tmpgentoo")
    (license license:expat)))

(define-public translatelocally-git
  (package
    (name "translatelocally-git")
    (version "r512.1d0d382")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/translatelocally-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast and secure translation on your local machine, powered by marian and Berg...")
    (description "Fast and secure translation on your local machine, powered by marian and Bergamot.")
    (home-page "https://translatelocally.com")
    (license license:expat)))

(define-public ultimate-tic-tac-toe-git
  (package
    (name "ultimate-tic-tac-toe-git")
    (version "1.1.0.r8.geb6a4c6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Nokse22/ultimate-tic-tac-toe")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ultimate Tic Tac Toe - GTK4/libadwaita Python game")
    (description "Ultimate Tic Tac Toe - GTK4/libadwaita Python game.")
    (home-page "https://github.com/Nokse22/ultimate-tic-tac-toe")
    (license license:gpl3+)))

(define-public vial-keychron-bin
  (package
    (name "vial-keychron-bin")
    (version "0.8.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vial-keychron-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vial is an open-source cross-platform (Windows, Linux and Mac) GUI and a QMK ...")
    (description "Vial is an open-source cross-platform (Windows, Linux and Mac) GUI and a QMK fork for configuring your keyboard in real time, similar to VIA. Keychron branch.")
    (home-page "https://github.com/Tymon3310/vial-gui")
    (license license:gpl2)))

(define-public whisper-cpp-hip
  (package
    (name "whisper-cpp-hip")
    (version "1.8.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/whisper.cpp-hip.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "port of OpenAI's Whisper model in C/C++ (using system llama.cpp-hip)")
    (description "Port of OpenAI's Whisper model in C/C++ (using system llama.cpp-hip).")
    (home-page "https://github.com/ggerganov/whisper.cpp")
    (license license:expat)))

(define-public xerahs-git
  (package
    (name "xerahs-git")
    (version "r2614.b680bcad")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ShareX/XerahS")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform screen capture and file sharing tool (ShareX port) built with ...")
    (description "Cross-platform screen capture and file sharing tool (ShareX port) built with Avalonia UI.")
    (home-page "https://github.com/ShareX/XerahS")
    (license license:gpl3+)))

(define-public yt-dlg-git
  (package
    (name "yt-dlg-git")
    (version "1.2.0.r242.g3ec93dc")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/oleksis/youtube-dl-gui")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross platform front-end GUI of the popular youtube-dl written in wxPython ...")
    (description "A cross platform front-end GUI of the popular youtube-dl written in wxPython (maintained fork of youtube-dl-gui).")
    (home-page "https://github.com/oleksis/youtube-dl-gui")
    (license license:non-copyleft)))

(define-public aeroshell-smodglow-x11-git
  (package
    (name "aeroshell-smodglow-x11-git")
    (version "6.6.3_27.rdef5938")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aeroshell-desktop/smod")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "decoration button glow effect for SMOD decorations")
    (description "Decoration button glow effect for SMOD decorations.")
    (home-page "https://github.com/aeroshell-desktop/smod")
    (license license:agpl3+)))

(define-public am
  (package
    (name "am")
    (version "placeholder")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/am.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "appImage package manager to install, update and manage ALL of them, system-wi...")
    (description "AppImage package manager to install, update and manage ALL of them, system-wide or locally.")
    (home-page "https://github.com/ivan-hc/AM")
    (license license:gpl3)))

(define-public artemisrgb-git
  (package
    (name "artemisrgb-git")
    (version "1.2026.0101.2913")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/artemisrgb-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a universal RGB control software")
    (description "A universal RGB control software.")
    (home-page "https://artemis-rgb.com/")
    (license license:non-copyleft)))

(define-public avp
  (package
    (name "avp")
    (version "20170505_a1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/avp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "alien Versus Predator Gold engine")
    (description "Alien Versus Predator Gold engine.")
    (home-page "https://www.icculus.org/avp")
    (license license:non-copyleft)))

(define-public blaadpapers
  (package
    (name "blaadpapers")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/blaadpapers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast & clean wallpaper manager")
    (description "Fast & clean wallpaper manager.")
    (home-page "https://github.com/Blaadick/BlaadPapers")
    (license license:gpl3)))

(define-public booktab
  (package
    (name "booktab")
    (version "4.26")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/booktab.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "myZanichelli - La piattaforma che ti permette di consultare tutti i tuoi libr...")
    (description "MyZanichelli - La piattaforma che ti permette di consultare tutti i tuoi libri scolastici in versione multimediale e interattiva.")
    (home-page "https://booktab.it/")
    (license license:non-copyleft)))

(define-public bootc
  (package
    (name "bootc")
    (version "1.15.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bootc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "boot and upgrade via container images")
    (description "Boot and upgrade via container images.")
    (home-page "https://github.com/bootc-dev/bootc")
    (license license:non-copyleft)))

(define-public bsg-diaspora-sa
  (package
    (name "bsg-diaspora-sa")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bsg-diaspora-sa.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "diaspora: Shattered Armistice is a single and multiplayer space fighter comba...")
    (description "Diaspora: Shattered Armistice is a single and multiplayer space fighter combat game set in the reimagined Battlestar Galactica universe.")
    (home-page "http://diaspora.hard-light.net/")
    (license license:non-copyleft)))

(define-public btrfs-assistant-git
  (package
    (name "btrfs-assistant-git")
    (version "1.9.r2.ge602da7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/btrfs-assistant/btrfs-assistant")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an application for managing BTRFS subvolumes and Snapper snapshots")
    (description "An application for managing BTRFS subvolumes and Snapper snapshots.")
    (home-page "https://gitlab.com/btrfs-assistant/btrfs-assistant")
    (license license:gpl3)))

(define-public catapult
  (package
    (name "catapult")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/catapult.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "app launcher for Linux, similar to ulauncher(wayland support)")
    (description "App launcher for Linux, similar to ulauncher(wayland support).")
    (home-page "https://otsaloma.io/catapult")
    (license license:gpl3)))

(define-public chirp-next
  (package
    (name "chirp-next")
    (version "20260410")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chirp-next.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI tool for programming ham radios")
    (description "GUI tool for programming ham radios.")
    (home-page "https://chirpmyradio.com/projects/chirp/wiki/Home")
    (license license:gpl3+)))

(define-public clipse-gui
  (package
    (name "clipse-gui")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/clipse-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GTK3 GUI for the clipse clipboard manager")
    (description "A GTK3 GUI for the clipse clipboard manager.")
    (home-page "https://github.com/d7omdev/clipse-gui")
    (license license:expat)))

(define-public collapseloader-git
  (package
    (name "collapseloader-git")
    (version "r556.0346b46")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dest4590/CollapseLoader")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI utility for launching Minecraft clients, built with Rust and Tauri (git v...")
    (description "GUI utility for launching Minecraft clients, built with Rust and Tauri (git version).")
    (home-page "https://github.com/dest4590/CollapseLoader")
    (license license:gpl3)))

(define-public dion-bin
  (package
    (name "dion-bin")
    (version "5.30.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dion-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop application for dion.vc")
    (description "Desktop application for dion.vc.")
    (home-page "https://dion.vc")
    (license license:expat)))

(define-public dosbox-x
  (package
    (name "dosbox-x")
    (version "2026.03.29")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dosbox-x.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "x86 emulator with builtin DOS, with patches with more features")
    (description "X86 emulator with builtin DOS, with patches with more features.")
    (home-page "http://dosbox-x.com")
    (license license:gpl3+)))

(define-public duckstation-qt-bin
  (package
    (name "duckstation-qt-bin")
    (version "0.1.r10998")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/duckstation-qt-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast PlayStation 1 emulator for PC and Android")
    (description "Fast PlayStation 1 emulator for PC and Android.")
    (home-page "https://github.com/stenzek/duckstation")
    (license license:non-copyleft)))

(define-public dxvk-nvapi-mingw
  (package
    (name "dxvk-nvapi-mingw")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dxvk-nvapi-mingw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "alternative NVAPI implementation on top of DXVK")
    (description "Alternative NVAPI implementation on top of DXVK.")
    (home-page "https://github.com/jp7677/dxvk-nvapi")
    (license license:expat)))
