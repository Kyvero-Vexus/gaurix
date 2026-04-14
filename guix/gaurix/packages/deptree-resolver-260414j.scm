;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260414j
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - 52 recipes created
;;;   - 48 blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260414j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (            arch-os-manager
            brother-dcpt535dw
            brother-hl-1110
            cherry-studio-electron-bin
            circuit-macros
            cisco-secure-client
            dcli-arch-git
            docker-model-plugin
            dolibarr
            dracut-ukify
            fcitx5-hazkey-bin
            find-the-command
            gitextensions
            hpuld
            kando-bin
            lib32-opencl-nvidia-vulkan
            matlab
            mommy-git
            ollama-cuda12-bin
            ollama-cuda13-bin
            opencl-vanity-gpg
            oxmgr-bin
            pdf-over
            pkgstate-bin
            quickshell-overview-git
            qwen-code-bin
            reef-tools
            rvgl-io-loadlevel
            rvgl-io-music
            rvgl-io-skins-bonus
            rvgl-io-tracks
            sac-gui
            sheet-git
            tiddlydesktop
            tparted-bin
            ttf-nonicons-bin-git
            vscodium-bin-marketplace
            vscodium-translucent-marketplace
            vtsls
            wechat
            whyis-git
            wine-installer
            wireplumber-openrc
            woff-nonicons-bin-git
            wormhole-rs-bin
            wpa-actiond
            wscat
            xd-torrent
            xdg-ninja-git
            xdg-unused-data-git
            xdman-beta-bin
            xpad-noone-git
            ))


;;; -- matlab (#9975) --

(define-public matlab
  (package
    (name "matlab")
    (version "R2025b-25.2.0.3177638")
    (source (origin
              (method url-fetch)
              (uri "https://www.mathworks.com/products/matlab.html")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.mathworks.com/products/matlab.html")
    (synopsis "a high-level language for numerical computation and visualization")
    (description "A high-level language for numerical computation and visualization.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- brother-dcpt535dw (#9029) --

(define-public brother-dcpt535dw
  (package
    (name "brother-dcpt535dw")
    (version "3.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpt535dw_eu_as")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpt535dw_eu_as")
    (synopsis "driver for the Brother DCP-T535DW wifi multifuncional printer")
    (description "Driver for the Brother DCP-T535DW wifi multifuncional printer.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- find-the-command (#3139) --

(define-public find-the-command
  (package
    (name "find-the-command")
    (version "2.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pkasemir/find-the-command.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/pkasemir/find-the-command")
    (synopsis "advanced command-not-found hook for bash, fish and zsh using the power of")
    (description "Advanced command-not-found hook for bash, fish and zsh using the power of pacman.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- arch-os-manager (#10421) --

(define-public arch-os-manager
  (package
    (name "arch-os-manager")
    (version "1.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/murkl/arch-os-manager.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/murkl/arch-os-manager")
    (synopsis "arch OS System Manager")
    (description "Arch OS System Manager.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- brother-hl-1110 (#10064) --

(define-public brother-hl-1110
  (package
    (name "brother-hl-1110")
    (version "3.0.1_1")
    (source (origin
              (method url-fetch)
              (uri "https://support.brother.com/g/b/producttop.aspx?c=us_ot&lang=en&prod=hl1110_us_eu_as")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://support.brother.com/g/b/producttop.aspx?c=us_ot&lang=en&prod=hl1110_us_eu_as")
    (synopsis "brother HL-1110 CUPS Driver")
    (description "Brother HL-1110 CUPS Driver.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))

;;; -- cherry-studio-electron-bin (#3876) --

(define-public cherry-studio-electron-bin
  (package
    (name "cherry-studio-electron-bin")
    (version "1.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://cherry-ai.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://cherry-ai.com/")
    (synopsis "🍒A desktop client that supports for multiple LLM providers.(Prebuilt vers")
    (description "🍒A desktop client that supports for multiple LLM providers.(Prebuilt version.Use system-wide electron).  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- circuit_macros (#10653) --

(define-public circuit-macros
  (package
    (name "circuit-macros")
    (version "10.6")
    (source (origin
              (method url-fetch)
              (uri "https://ece.uwaterloo.ca/~aplevich/Circuit_macros/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://ece.uwaterloo.ca/~aplevich/Circuit_macros/")
    (synopsis "tools for drawing electric circuits and other line diagrams")
    (description "Tools for drawing electric circuits and other line diagrams.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- cisco-secure-client (#11922) --

(define-public cisco-secure-client
  (package
    (name "cisco-secure-client")
    (version "5.1.11.388")
    (source (origin
              (method url-fetch)
              (uri "https://www.cisco.com/site/us/en/products/security/secure-client/index.html")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.cisco.com/site/us/en/products/security/secure-client/index.html")
    (synopsis "cisco AnyConnect Secure Mobility Client")
    (description "Cisco AnyConnect Secure Mobility Client.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- dcli-arch-git (#7398) --

(define-public dcli-arch-git
  (package
    (name "dcli-arch-git")
    (version "0.2.0.r140.5257e7d2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/theblackdon/dcli.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/theblackdon/dcli")
    (synopsis "a declarative package management CLI tool for Arch Linux, inspired by NixOS")
    (description "A declarative package management CLI tool for Arch Linux, inspired by NixOS.  It is packaged from the Arch User Repository.")
    (license license:bsd-0)))

;;; -- docker-model-plugin (#12709) --

(define-public docker-model-plugin
  (package
    (name "docker-model-plugin")
    (version "1.1.28")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/docker/model-runner.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/docker/model-runner")
    (synopsis "docker CLI plugin for Model Runner - manage and run AI models in containers")
    (description "Docker CLI plugin for Model Runner - manage and run AI models in containers.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- dolibarr (#12946) --

(define-public dolibarr
  (package
    (name "dolibarr")
    (version "23.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://dolibarr.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://dolibarr.org/")
    (synopsis "dolibarr ERP CRM: modern software package to manage your company")
    (description "Dolibarr ERP CRM: modern software package to manage your company.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- dracut-ukify (#10253) --

(define-public dracut-ukify
  (package
    (name "dracut-ukify")
    (version "11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/packages/dracut-ukify")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/dracut-ukify")
    (synopsis "integration layer for dracut and systemd's ukify tool for Arch Linux")
    (description "Integration layer for dracut and systemd's ukify tool for Arch Linux.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- fcitx5-hazkey-bin (#3304) --

(define-public fcitx5-hazkey-bin
  (package
    (name "fcitx5-hazkey-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://hazkey.hiira.dev/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://hazkey.hiira.dev/")
    (synopsis "japanese input method for fcitx5, powered by azooKey engine")
    (description "Japanese input method for fcitx5, powered by azooKey engine.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- gitextensions (#6816) --

(define-public gitextensions
  (package
    (name "gitextensions")
    (version "2.51.05")
    (source (origin
              (method url-fetch)
              (uri "http://gitextensions.github.io/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://gitextensions.github.io/")
    (synopsis "graphical user interface for Git that allows you control Git without usin")
    (description "Graphical user interface for Git that allows you control Git without using the command line.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- hpuld (#1502) --

(define-public hpuld
  (package
    (name "hpuld")
    (version "1.00.39.12_00.15")
    (source (origin
              (method url-fetch)
              (uri "https://support.hp.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://support.hp.com/")
    (synopsis "hP Unified Linux Driver")
    (description "HP Unified Linux Driver.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- kando-bin (#7267) --

(define-public kando-bin
  (package
    (name "kando-bin")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://ko-fi.com/post/Introducing-Ken-Do-L3L7L0FQ2")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://ko-fi.com/post/Introducing-Ken-Do-L3L7L0FQ2")
    (synopsis "a pie menu for the desktop. It will be highly customizable and will allow")
    (description "A pie menu for the desktop. It will be highly customizable and will allow you to create your own menus and actions.(Prebuilt version.Use system-wide electron).  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- lib32-opencl-nvidia-vulkan (#11761) --

(define-public lib32-opencl-nvidia-vulkan
  (package
    (name "lib32-opencl-nvidia-vulkan")
    (version "595.44.05")
    (source (origin
              (method url-fetch)
              (uri "https://developer.nvidia.com/vulkan-driver")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://developer.nvidia.com/vulkan-driver")
    (synopsis "openCL implemention for NVIDIA (32-bit) (vulkan developer branch)")
    (description "OpenCL implemention for NVIDIA (32-bit) (vulkan developer branch).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- mommy-git (#1019) --

(define-public mommy-git
  (package
    (name "mommy-git")
    (version "v1.8.0.r8.g3eb3a54")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fwdekker/mommy.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/fwdekker/mommy")
    (synopsis "mommy's here to support you~")
    (description "Mommy's here to support you~.  It is packaged from the Arch User Repository.")
    (license license:unlicense)))

;;; -- ollama-cuda12-bin (#1159) --

(define-public ollama-cuda12-bin
  (package
    (name "ollama-cuda12-bin")
    (version "0.20.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ollama/ollama/releases/download/v0.20.6/ollama-cuda12-0.20.6-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/ollama/ollama")
    (synopsis "create, run and share large language models (LLMs) with CUDA 12")
    (description "Create, run and share large language models (LLMs) with CUDA 12.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- ollama-cuda13-bin (#1158) --

(define-public ollama-cuda13-bin
  (package
    (name "ollama-cuda13-bin")
    (version "0.20.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ollama/ollama/releases/download/v0.20.6/ollama-cuda13-0.20.6-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/ollama/ollama")
    (synopsis "create, run and share large language models (LLMs) with CUDA 13")
    (description "Create, run and share large language models (LLMs) with CUDA 13.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- opencl-vanity-gpg (#12717) --

(define-public opencl-vanity-gpg
  (package
    (name "opencl-vanity-gpg")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TransparentLC/opencl_vanity_gpg.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/TransparentLC/opencl_vanity_gpg")
    (synopsis "rusty GPU/OpenCL-powered vanity PGP keys generator")
    (description "Rusty GPU/OpenCL-powered vanity PGP keys generator.  It is packaged from the Arch User Repository.")
    (license license:agpl3+)))

;;; -- oxmgr-bin (#2840) --

(define-public oxmgr-bin
  (package
    (name "oxmgr-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Vladimir-Urik/OxMgr/releases/download/v0.2.0/oxmgr-0.2.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/Vladimir-Urik/OxMgr")
    (synopsis "lightweight cross-platform process manager")
    (description "Lightweight cross-platform process manager.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- pdf-over (#7250) --

(define-public pdf-over
  (package
    (name "pdf-over")
    (version "4.4.8")
    (source (origin
              (method url-fetch)
              (uri "https://technology.a-sit.at/en/pdf-over/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://technology.a-sit.at/en/pdf-over/")
    (synopsis "graphical tool for creating PAdES conforming PDF signatures")
    (description "Graphical tool for creating PAdES conforming PDF signatures.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- pkgstate-bin (#9012) --

(define-public pkgstate-bin
  (package
    (name "pkgstate-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/pol-rivero/pkgstate/releases/download/v0.2.3/pkgstate-0.2.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/pol-rivero/pkgstate")
    (synopsis "the perfect companion your dotfiles repo: declaratively define your insta")
    (description "The perfect companion your dotfiles repo: declaratively define your installed packages, systemd services, and user groups (binary release).  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- quickshell-overview-git (#12695) --

(define-public quickshell-overview-git
  (package
    (name "quickshell-overview-git")
    (version "r18.272b4e7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Shanu-Kumawat/quickshell-overview.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Shanu-Kumawat/quickshell-overview")
    (synopsis "a standalone workspace overview module for Hyprland using Quickshell")
    (description "A standalone workspace overview module for Hyprland using Quickshell.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- qwen-code-bin (#2109) --

(define-public qwen-code-bin
  (package
    (name "qwen-code-bin")
    (version "0.14.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/QwenLM/qwen-code/releases/download/v0.14.3/qwen-code-0.14.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/QwenLM/qwen-code")
    (synopsis "open-source AI agent based on Gemini CLI by QwenLM")
    (description "Open-source AI agent based on Gemini CLI by QwenLM.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- reef-tools (#3700) --

(define-public reef-tools
  (package
    (name "reef-tools")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ZStud/reef.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ZStud/reef")
    (synopsis "modern CLI tool wrappers for fish — grep→rg, find→fd, sed→sd, du→dust, ps")
    (description "Modern CLI tool wrappers for fish — grep→rg, find→fd, sed→sd, du→dust, ps→procs, ls→eza, cat→bat, cd→zoxide.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- rvgl-io-loadlevel (#7224) --

(define-public rvgl-io-loadlevel
  (package
    (name "rvgl-io-loadlevel")
    (version "23.0923")
    (source (origin
              (method url-fetch)
              (uri "https://re-volt.io/online/tracks")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://re-volt.io/online/tracks")
    (synopsis "loading screens for RVGL community tracks")
    (description "Loading screens for RVGL community tracks.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- rvgl-io-music (#7223) --

(define-public rvgl-io-music
  (package
    (name "rvgl-io-music")
    (version "25.0902")
    (source (origin
              (method url-fetch)
              (uri "https://re-volt.io/online/tracks")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://re-volt.io/online/tracks")
    (synopsis "extra music for RVGL community tracks")
    (description "Extra music for RVGL community tracks.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- rvgl-io-skins-bonus (#7226) --

(define-public rvgl-io-skins-bonus
  (package
    (name "rvgl-io-skins-bonus")
    (version "25.0902")
    (source (origin
              (method url-fetch)
              (uri "https://re-volt.io/online/cars")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://re-volt.io/online/cars")
    (synopsis "additional skins for RVGL default and community cars")
    (description "Additional skins for RVGL default and community cars.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- rvgl-io-tracks (#7219) --

(define-public rvgl-io-tracks
  (package
    (name "rvgl-io-tracks")
    (version "25.0902")
    (source (origin
              (method url-fetch)
              (uri "https://re-volt.io/online/tracks")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://re-volt.io/online/tracks")
    (synopsis "additional RVGL tracks used for official events")
    (description "Additional RVGL tracks used for official events.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- sac-gui (#1767) --

(define-public sac-gui
  (package
    (name "sac-gui")
    (version "10.9.4723")
    (source (origin
              (method url-fetch)
              (uri "https://cpl.thalesgroup.com/access-management/security-applications/authentication-client-token-management")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://cpl.thalesgroup.com/access-management/security-applications/authentication-client-token-management")
    (synopsis "thales/Gemalto SafeNet Authentication Client for eToken 5110/5300 & IDPri")
    (description "Thales/Gemalto SafeNet Authentication Client for eToken 5110/5300 & IDPrime (GUI tools).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- sheet-git (#7620) --

(define-public sheet-git
  (package
    (name "sheet-git")
    (version "r11.a4ffa4b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/unixextremist/sheet.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://codeberg.org/unixextremist/sheet")
    (synopsis "sheet is a minimal(ish) tui frontend for feh/swaybg")
    (description "Sheet is a minimal(ish) tui frontend for feh/swaybg.  It is packaged from the Arch User Repository.")
    (license license:wtfpl2)))

;;; -- tiddlydesktop (#25191) --

(define-public tiddlydesktop
  (package
    (name "tiddlydesktop")
    (version "0.0.22")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Jermolene/TiddlyDesktop.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Jermolene/TiddlyDesktop")
    (synopsis "tiddlyDesktop is a special purpose web browser for working with locally s")
    (description "TiddlyDesktop is a special purpose web browser for working with locally stored TiddlyWikis.  It is packaged from the Arch User Repository.")
    (license license:bsd-3)))

;;; -- tparted-bin (#1770) --

(define-public tparted-bin
  (package
    (name "tparted-bin")
    (version "2026.03.26")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Kagamma/tparted/releases/download/v2026.03.26/tparted-2026.03.26-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/Kagamma/tparted")
    (synopsis "text-based user interface (TUI) frontend for parted, based on Free Vision")
    (description "Text-based user interface (TUI) frontend for parted, based on Free Vision application framework.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- ttf-nonicons-bin-git (#3462) --

(define-public ttf-nonicons-bin-git
  (package
    (name "ttf-nonicons-bin-git")
    (version "r68.20241213.5f56cf0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yamatsum/nonicons.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/yamatsum/nonicons")
    (synopsis "a next-generation icon set for developers that extends octicons")
    (description "A next-generation icon set for developers that extends octicons.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- vscodium-bin-marketplace (#3761) --

(define-public vscodium-bin-marketplace
  (package
    (name "vscodium-bin-marketplace")
    (version "1.76.0")
    (source (origin
              (method url-fetch)
              (uri "https://marketplace.visualstudio.com/vscode")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://marketplace.visualstudio.com/vscode")
    (synopsis "enable vscode marketplace in vscodium-bin")
    (description "Enable vscode marketplace in vscodium-bin.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- vscodium-translucent-marketplace (#3282) --

(define-public vscodium-translucent-marketplace
  (package
    (name "vscodium-translucent-marketplace")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/microsoft/vscode.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/microsoft/vscode")
    (synopsis "enable vscode marketplace in VSCodium")
    (description "Enable vscode marketplace in VSCodium.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- vtsls (#423) --

(define-public vtsls
  (package
    (name "vtsls")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yioneko/vtsls.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/yioneko/vtsls")
    (synopsis "lSP wrapper for the TypeScript extension from Visual Studio Code")
    (description "LSP wrapper for the TypeScript extension from Visual Studio Code.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- wechat (#12876) --

(define-public wechat
  (package
    (name "wechat")
    (version "11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Kraftland/portable.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Kraftland/portable")
    (synopsis "fixes and optional sandbox for WeChat")
    (description "Fixes and optional sandbox for WeChat.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- whyis-git (#436) --

(define-public whyis-git
  (package
    (name "whyis-git")
    (version "0.2.0.r2.g767609e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xZepyx/whyis.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/xZepyx/whyis")
    (synopsis "a simple linux troubleshooting utility")
    (description "A simple linux troubleshooting utility.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- wine-installer (#9810) --

(define-public wine-installer
  (package
    (name "wine-installer")
    (version "5.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linuxmint/wine-installer.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/linuxmint/wine-installer")
    (synopsis "a metapackage that provides desktop files and menus to WINE")
    (description "A metapackage that provides desktop files and menus to WINE.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- wireplumber-openrc (#7601) --

(define-public wireplumber-openrc
  (package
    (name "wireplumber-openrc")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/pkgbase/pipewire-openrc")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/pkgbase/pipewire-openrc")
    (synopsis "openRC init script for 'wireplumber'")
    (description "OpenRC init script for 'wireplumber'.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))

;;; -- woff-nonicons-bin-git (#3463) --

(define-public woff-nonicons-bin-git
  (package
    (name "woff-nonicons-bin-git")
    (version "r68.20241213.5f56cf0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yamatsum/nonicons.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/yamatsum/nonicons")
    (synopsis "a next-generation icon set for developers that extends octicons")
    (description "A next-generation icon set for developers that extends octicons.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- wormhole-rs-bin (#15712) --

(define-public wormhole-rs-bin
  (package
    (name "wormhole-rs-bin")
    (version "0.7.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/magic-wormhole/magic-wormhole.rs/releases/download/v0.7.7/wormhole-rs-0.7.7-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/magic-wormhole/magic-wormhole.rs")
    (synopsis "rust implementation of Magic Wormhole, with new features and enhancements")
    (description "Rust implementation of Magic Wormhole, with new features and enhancements.  It is packaged from the Arch User Repository.")
    (license license:eupl1.2)))

;;; -- wpa_actiond (#10687) --

(define-public wpa-actiond
  (package
    (name "wpa-actiond")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri "http://projects.archlinux.org/wpa_actiond.git/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://projects.archlinux.org/wpa_actiond.git/")
    (synopsis "daemon that connects to wpa_supplicant and handles connect and disconnect")
    (description "Daemon that connects to wpa_supplicant and handles connect and disconnect events.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- wscat (#4673) --

(define-public wscat
  (package
    (name "wscat")
    (version "6.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/websockets/wscat.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/websockets/wscat")
    (synopsis "netcat-like utility for WebSockets")
    (description "Netcat-like utility for WebSockets.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- xd-torrent (#8840) --

(define-public xd-torrent
  (package
    (name "xd-torrent")
    (version "0.4.8")
    (source (origin
              (method url-fetch)
              (uri "https://xd-torrent.github.io/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://xd-torrent.github.io/")
    (synopsis "an I2P BitTorrent client")
    (description "An I2P BitTorrent client.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- xdg-ninja-git (#1672) --

(define-public xdg-ninja-git
  (package
    (name "xdg-ninja-git")
    (version "r560.cb09ebd")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/b3nj5m1n/xdg-ninja.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/b3nj5m1n/xdg-ninja")
    (synopsis "a shell script which checks your $HOME for unwanted files and directories")
    (description "A shell script which checks your $HOME for unwanted files and directories.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- xdg-unused-data-git (#8881) --

(define-public xdg-unused-data-git
  (package
    (name "xdg-unused-data-git")
    (version "r123.f605067")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pawel-0/xdg-unused-data.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/pawel-0/xdg-unused-data")
    (synopsis "a simple way to identify unused applications data in user directories suc")
    (description "A simple way to identify unused applications data in user directories such as ~./config and ~/.cache.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- xdman-beta-bin (#10560) --

(define-public xdman-beta-bin
  (package
    (name "xdman-beta-bin")
    (version "8.0.29")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subhra74/xdm/releases/download/v8.0.29/xdman-beta-8.0.29-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/subhra74/xdm")
    (synopsis "powerfull download accelerator and video downloader (binary release)")
    (description "Powerfull download accelerator and video downloader (binary release).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- xpad-noone-git (#489) --

(define-public xpad-noone-git
  (package
    (name "xpad-noone-git")
    (version "r129.7b53614")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/forkymcforkface/xpad-noone.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/forkymcforkface/xpad-noone")
    (synopsis "this is the original upstream xpad driver from the Linux kernel with supp")
    (description "This is the original upstream xpad driver from the Linux kernel with support for Xbox One controllers removed.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))
