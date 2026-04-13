;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree priority resolver --- deptree-resolver-260413n
;;; Resolves 100 BLOCKED packages from priority queue:
;;;   - 25 recipes created
;;;   - 75 blocked with specific reason codes
;;;
;;; Recipes (25):
;;;   - elephant-providerlist (go, v2.21.0)
;;;   - elephant-runner (go, v2.21.0)
;;;   - elephant-symbols (go, v2.21.0)
;;;   - elephant-todo (go, v2.21.0)
;;;   - elephant-websearch (go, v2.21.0)
;;;   - elephant-calc (go, v2.21.0)
;;;   - elephant-files (go, v2.21.0)
;;;   - google-breakpad (cmake, v2024.02.16)
;;;   - helixnotes-appimage-bin (copy, v1.2.8)
;;;   - hmcl-bin (copy, v3.12.4)
;;;   - hpsahba-git (gnu, v0.1)
;;;   - hytale-updater (go, v1.0.0)
;;;   - i2p-bin (copy, v2.11.0)
;;;   - nvidia-utils-beta (copy, v595.58.03)
;;;   - ccusage (copy, v18.0.10)
;;;   - claude-agent-acp (copy, v0.23.1)
;;;   - critique (copy, v0.1.139)
;;;   - hyprflow (copy, v0.2.1)
;;;   - ibus-autostart-kimpanel (copy, v1.2)
;;;   - famitracker (copy, v0.4.6)
;;;   - oopz (copy, v1.0.0)
;;;   - yabridgectl-wine10-git (copy, v0.5.0)
;;;   - homepage-git (copy, v0.9.6)
;;;   - hurrycurry-client (copy, v3.0.1)
;;;   - hyprland-plugin-easymotion (copy, v0.52.1)
;;;
;;; Blocked (75):
;;;   sonic-win [INFEASIBLE_BUILD: patched KDE kwin fork, requires full KDE build infra]
;;;   lib32-xrizer [LIB32_UNSUPPORTED]
;;;   plasma-workspace-povd [INFEASIBLE_BUILD: patched KDE workspace, requires full KDE build infra + custom patches]
;;;   lib32-l-smash [LIB32_UNSUPPORTED]
;;;   new-lg4ff-dkms-git [DKMS_KERNEL_MODULE]
;;;   lib32-libudev0-shim [LIB32_UNSUPPORTED]
;;;   hid-fanatecff-dkms [DKMS_KERNEL_MODULE]
;;;   linux-cachyos-lts [CUSTOM_KERNEL: CachyOS kernel variant, out of scope]
;;;   linux-cachyos [CUSTOM_KERNEL: CachyOS kernel variant, out of scope]
;;;   linux-cachyos-rc [CUSTOM_KERNEL: CachyOS kernel variant, out of scope]
;;;   qt6-base-hifps [INFEASIBLE_BUILD: patched Qt6 base, requires full Qt build infra]
;;;   anbox-git [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   chromium-gost [INFEASIBLE_BUILD: full Chromium build with GOST crypto patches]
;;;   gram-editor-git [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.8.arch1-1-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.8.arch1-1-docs-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.8.arch1-1-headers-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.9.arch1-1-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.9.arch1-1-docs-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.9.arch1-1-headers-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.9.zen1-1-zen-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.9.zen1-1-zen-docs-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   linux6.19.9.zen1-1-zen-headers-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   llama.cpp-aio [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   nvidia-vulkan-dkms [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   openai-codex-autoup-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   opensc-p11-kit-module [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   pac-pacman-aliases [ARCH_SPECIFIC: pacman shell aliases]
;;;   pacman-log-orphans-hook [ARCH_SPECIFIC: pacman hook]
;;;   pipewire-enable-bluez5 [ARCH_SPECIFIC: pacman hook for pipewire]
;;;   projtlauncher [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   python-uharfbuzz [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   shimmy-bin [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   shorinclip-git [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   subs2srs-git [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   ttf-ms-win10-japanese [PROPRIETARY_FONT_LICENSE: MS Windows fonts, redistribution prohibited]
;;;   ttf-ms-win10-korean [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-other [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-sea [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-thai [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-zh_cn [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-zh_tw [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-japanese [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-korean [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-other [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-sea [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-thai [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-zh_cn [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-zh_tw [PROPRIETARY_FONT_LICENSE]
;;;   vdhcoapp [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   vivaldi-ffmpeg-codecs [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   whatsapp-for-linux [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   zettlr [SOURCE_UNAVAILABLE: not in AUR metadata]
;;;   ancient-packages [ARCH_SPECIFIC: depends on package-query (pacman tool)]
;;;   binder_linux-dkms [DKMS_KERNEL_MODULE]
;;;   lib32-libtxc_dxtn [LIB32_UNSUPPORTED]
;;;   lib32-zix [LIB32_UNSUPPORTED]
;;;   linux-zen-versioned-docs-bin [LINUX_METAPACKAGE: depends on versioned linux kernel pkg not in AUR]
;;;   linux-zen-versioned-headers-bin [LINUX_METAPACKAGE: depends on versioned linux kernel pkg not in AUR]
;;;   localepurge-hook [ARCH_SPECIFIC: pacman hook for localepurge]
;;;   mandb-instant-update [ARCH_SPECIFIC: pacman hook for mandb]
;;;   mkinitcpio-sd-numlock [ARCH_SPECIFIC: mkinitcpio hook]
;;;   paccache-hook [ARCH_SPECIFIC: pacman hook]
;;;   systemd-boot-pacman-hook [ARCH_SPECIFIC: pacman hook for systemd-boot]
;;;   yaycache-hook [ARCH_SPECIFIC: yay/pacman hook]
;;;   youtube-music-desktop [DEP_UNAVAILABLE: depends on qtws-base, not packaged]
;;;   amneziawg-dkms [DKMS_KERNEL_MODULE]
;;;   arch-gdm-theme-list [ARCH_SPECIFIC: Arch Linux GDM theme]
;;;   checkupdates-notify [ARCH_SPECIFIC: depends on pacman-contrib]
;;;   csharpier [DOTNET_UNSUPPORTED: requires .NET SDK 10.0]
;;;   cython2 [DEPRECATED: Python 2 is EOL]
;;;   deezer-enhanced [ELECTRON_APP: depends on electron37, not available in Guix]
;;;   discord-chat-exporter-plus-cli [DOTNET_UNSUPPORTED: requires .NET runtime 10.0]
;;;   etckeeper-packages [ARCH_SPECIFIC: depends on pacman]
;;;   i2c-nct6793-dkms-git [DKMS_KERNEL_MODULE]

(define-module (gaurix packages deptree-resolver-260413n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            elephant-providerlist
            elephant-runner
            elephant-symbols
            elephant-todo
            elephant-websearch
            elephant-calc
            elephant-files
            google-breakpad
            helixnotes-appimage-bin
            hmcl-bin
            hpsahba-git
            hytale-updater
            i2p-bin
            nvidia-utils-beta
            ccusage
            claude-agent-acp
            critique
            hyprflow
            ibus-autostart-kimpanel
            famitracker
            oopz
            yabridgectl-wine10-git
            homepage-git
            hurrycurry-client
            hyprland-plugin-easymotion
            ))

;;; -- elephant-providerlist (#12518) --

(define-public elephant-providerlist
  (package
    (name "elephant-providerlist")
    (version "2.21.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/abenz1267/elephant/cmd/providerlist"
           #:unpack-path "github.com/abenz1267/elephant"
           #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "providerlist provider for elephant application launcher")
    (description "Providerlist provider for Elephant, a fast
application launcher for Linux.")
    (license license:gpl3+)))

;;; -- elephant-runner (#12519) --

(define-public elephant-runner
  (package
    (name "elephant-runner")
    (version "2.21.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/abenz1267/elephant/cmd/runner"
           #:unpack-path "github.com/abenz1267/elephant"
           #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "runner provider for elephant application launcher")
    (description "Runner provider for Elephant, a fast application
launcher for Linux.")
    (license license:gpl3+)))

;;; -- elephant-symbols (#12520) --

(define-public elephant-symbols
  (package
    (name "elephant-symbols")
    (version "2.21.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/abenz1267/elephant/cmd/symbols"
           #:unpack-path "github.com/abenz1267/elephant"
           #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "symbols provider for elephant application launcher")
    (description "Symbols provider for Elephant, a fast application
launcher for Linux.")
    (license license:gpl3+)))

;;; -- elephant-todo (#12521) --

(define-public elephant-todo
  (package
    (name "elephant-todo")
    (version "2.21.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/abenz1267/elephant/cmd/todo"
           #:unpack-path "github.com/abenz1267/elephant"
           #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "todo provider for elephant application launcher")
    (description "Todo provider for Elephant, a fast application
launcher for Linux.")
    (license license:gpl3+)))

;;; -- elephant-websearch (#12522) --

(define-public elephant-websearch
  (package
    (name "elephant-websearch")
    (version "2.21.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/abenz1267/elephant/cmd/websearch"
           #:unpack-path "github.com/abenz1267/elephant"
           #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "websearch provider for elephant application launcher")
    (description "Websearch provider for Elephant, a fast application
launcher for Linux.")
    (license license:gpl3+)))

;;; -- elephant-calc (#12516) --

(define-public elephant-calc
  (package
    (name "elephant-calc")
    (version "2.21.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/abenz1267/elephant/cmd/calc"
           #:unpack-path "github.com/abenz1267/elephant"
           #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "calculator provider for elephant application launcher")
    (description "Calculator provider for Elephant, a fast application
launcher for Linux.")
    (license license:gpl3+)))

;;; -- elephant-files (#12517) --

(define-public elephant-files
  (package
    (name "elephant-files")
    (version "2.21.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/abenz1267/elephant/cmd/files"
           #:unpack-path "github.com/abenz1267/elephant"
           #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "files provider for elephant application launcher")
    (description "Files provider for Elephant, a fast application
launcher for Linux.")
    (license license:gpl3+)))

;;; -- google-breakpad (#428) --

(define-public google-breakpad
  (package
    (name "google-breakpad")
    (version "2024.02.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://chromium.googlesource.com/breakpad/breakpad")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://chromium.googlesource.com/breakpad/breakpad/")
    (synopsis "open-source multi-platform crash reporting system")
    (description "Google Breakpad is an open-source multi-platform crash
reporting system.  It provides tools for collecting, processing, and
symbolizing crash reports from client applications.")
    (license license:bsd-3)))

;;; -- helixnotes-appimage-bin (#2820) --

(define-public helixnotes-appimage-bin
  (package
    (name "helixnotes-appimage-bin")
    (version "1.2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/HelixNotes/helix/releases/download/v"
                    version "/HelixNotes_" version "_amd64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("HelixNotes.AppImage" "bin/helixnotes"))))
    (home-page "https://helixnotes.com")
    (synopsis "local markdown note-taking app built with Rust and Tauri")
    (description "HelixNotes is a local markdown note-taking application
built with Rust, Tauri, and SvelteKit.  It provides a clean interface
for organizing and editing markdown notes locally.")
    (license license:agpl3)))

;;; -- hmcl-bin (#1291) --

(define-public hmcl-bin
  (package
    (name "hmcl-bin")
    (version "3.12.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/huanghongxun/HMCL/releases/download/v"
                    version "/HMCL-" version ".jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "HMCL-" #$version ".jar")
                         "share/java/hmcl.jar"))))
    (home-page "https://github.com/huanghongxun/HMCL")
    (synopsis "multi-functional cross-platform Minecraft launcher")
    (description "HMCL (Hello Minecraft! Launcher) is a multi-functional,
cross-platform Minecraft launcher.  It supports automatic game installation,
mod management, and multiple accounts.")
    (license license:gpl3+)))

;;; -- hpsahba-git (#2965) --

(define-public hpsahba-git
  (package
    (name "hpsahba-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/im-0/hpsahba")
                    (commit "0a57a52")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "hpsahba" bin)))))))
    (home-page "https://github.com/im-0/hpsahba")
    (synopsis "enable/disable HBA mode on HP Smart Array controllers")
    (description "Tool to enable or disable HBA mode on some HP Smart
Array controllers.  This allows direct access to drives connected to
HP RAID controllers.")
    (license license:gpl2)))

;;; -- hytale-updater (#993) --

(define-public hytale-updater
  (package
    (name "hytale-updater")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tomwmth/hytale-updater")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/tomwmth/hytale-updater"
           #:tests? #f))
    (home-page "https://github.com/tomwmth/hytale-updater")
    (synopsis "wrapper for the Hytale Launcher for Linux packaging")
    (description "A wrapper for the Hytale Launcher that allows Linux
distribution friendly packaging of the game launcher.")
    (license license:expat)))

;;; -- i2p-bin (#3141) --

(define-public i2p-bin
  (package
    (name "i2p-bin")
    (version "2.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.i2p2.de/releases/" version
                    "/i2pinstall_" version ".jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "i2pinstall_" #$version ".jar")
                         "share/java/i2p-installer.jar"))))
    (home-page "https://geti2p.net")
    (synopsis "distributed anonymous network (pre-compiled binary)")
    (description "I2P (Invisible Internet Project) is a distributed
anonymous network.  It provides a layer of abstraction for communications
over the internet, offering strong privacy protections.")
    (license license:gpl2)))

;;; -- nvidia-utils-beta (#12012) --

(define-public nvidia-utils-beta
  (package
    (name "nvidia-utils-beta")
    (version "595.58.03")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.nvidia.com/XFree86/Linux-x86_64/"
                    version "/NVIDIA-Linux-x86_64-" version ".run"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/nvidia/"))))
    (home-page "https://www.nvidia.com/")
    (synopsis "nVIDIA driver utilities (beta version)")
    (description "NVIDIA driver utilities for the beta branch.  Includes
nvidia-smi, nvidia-settings, and related tools for managing NVIDIA GPUs.")
    (license (license:nonfree "https://www.nvidia.com/en-us/drivers/nvidia-license/"))))

;;; -- ccusage (#4690) --

(define-public ccusage
  (package
    (name "ccusage")
    (version "18.0.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ryoppippi/ccusage")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ccusage/"))))
    (home-page "https://github.com/ryoppippi/ccusage")
    (synopsis "cLI tool for analyzing Claude Code token usage and costs")
    (description "A CLI tool for analyzing Claude Code token usage and
costs from local JSONL files.  Provides detailed breakdowns of API usage
and associated costs.")
    (license license:expat)))

;;; -- claude-agent-acp (#2533) --

(define-public claude-agent-acp
  (package
    (name "claude-agent-acp")
    (version "0.23.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anthropics/claude-code-acp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/claude-agent-acp/"))))
    (home-page "https://github.com/zed-industries/claude-agent-acp")
    (synopsis "use Claude Agent from any ACP client")
    (description "Claude Agent ACP allows using Claude Agent from any
ACP (Agent Communication Protocol) client such as Zed editor.  It bridges
the gap between ACP-compatible tools and Claude's capabilities.")
    (license license:asl2.0)))

;;; -- critique (#4383) --

(define-public critique
  (package
    (name "critique")
    (version "0.1.139")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/remorses/critique")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/critique/"))))
    (home-page "https://github.com/remorses/critique")
    (synopsis "beautiful terminal UI for reviewing git diffs")
    (description "Critique is a beautiful terminal UI for reviewing git
diffs with syntax highlighting.  It provides an interactive interface
for navigating and reviewing code changes.")
    (license license:expat)))

;;; -- hyprflow (#2894) --

(define-public hyprflow
  (package
    (name "hyprflow")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/isorensen/hyprflow")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hyprflow/"))))
    (home-page "https://github.com/isorensen/hyprflow")
    (synopsis "save and restore Hyprland window sessions")
    (description "Hyprflow allows saving and restoring Hyprland window
sessions.  It captures the current window layout and can restore it later,
preserving workspace configurations.")
    (license license:expat)))

;;; -- ibus-autostart-kimpanel (#3676) --

(define-public ibus-autostart-kimpanel
  (package
    (name "ibus-autostart-kimpanel")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/ibus-autostart-kimpanel.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ibus-autostart-kimpanel/"))))
    (home-page "https://aur.archlinux.org/packages/ibus-autostart-kimpanel")
    (synopsis "iBus daemon autostart with XDG Autostart and kimpanel")
    (description "Provides XDG Autostart configuration for the iBus
input method daemon with kimpanel integration for KDE Plasma.")
    (license license:public-domain)))

;;; -- famitracker (#9941) --

(define-public famitracker
  (package
    (name "famitracker")
    (version "0.4.6")
    (source (origin
              (method url-fetch)
              (uri "http://www.famitracker.com/files/FamiTracker-Source.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/famitracker/"))))
    (home-page "http://www.famitracker.com")
    (synopsis "free tracker for producing music for the NES/Famicom")
    (description "FamiTracker is a free tracker for producing music for
the NES/Famicom-systems.  It lets you create authentic chiptune music
using the sound channels available on the NES hardware.")
    (license license:gpl2+)))

;;; -- oopz (#3480) --

(define-public oopz
  (package
    (name "oopz")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://git.pysio.online/pysio/linux_oopz/releases/download/v"
                    version "/oopz-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/oopz/"))))
    (home-page "https://git.pysio.online/pysio/linux_oopz")
    (synopsis "oOPZ desktop client for the free online voice platform")
    (description "OOPZ is a third-party desktop client (Electron-based)
for the free online voice platform.  Provides a native desktop experience
for OOPZ voice communication.")
    (license (license:nonfree "https://git.pysio.online/pysio/linux_oopz"))))

;;; -- yabridgectl-wine10-git (#11948) --

(define-public yabridgectl-wine10-git
  (package
    (name "yabridgectl-wine10-git")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/robbert-vdh/yabridge")
                    (commit "42e0794d")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/yabridgectl/"))))
    (home-page "https://github.com/robbert-vdh/yabridge")
    (synopsis "utility to set up and manage yabridge (Wine 10 git)")
    (description "Optional utility to help set up and manage yabridge,
which allows using Windows VST plugins in Linux DAWs through Wine.
This version is built for Wine 10.")
    (license license:gpl3+)))

;;; -- homepage-git (#7504) --

(define-public homepage-git
  (package
    (name "homepage-git")
    (version "0.9.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gethomepage/homepage")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/homepage/"))))
    (home-page "https://github.com/gethomepage/homepage")
    (synopsis "highly customizable homepage and application dashboard")
    (description "A highly customizable homepage (or startpage /
application dashboard) with Docker and service API integrations.
Provides a clean, modern interface for organizing links and services.")
    (license license:gpl3)))

;;; -- hurrycurry-client (#1772) --

(define-public hurrycurry-client
  (package
    (name "hurrycurry-client")
    (version "3.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/hurrycurry/hurrycurry")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hurrycurry/"))))
    (home-page "https://codeberg.org/hurrycurry/hurrycurry")
    (synopsis "a game about cooking (client)")
    (description "HurryCurry is a multiplayer cooking game client.
Players cooperate to prepare and serve dishes in a fast-paced
kitchen environment.")
    (license license:agpl3)))

;;; -- hyprland-plugin-easymotion (#10678) --

(define-public hyprland-plugin-easymotion
  (package
    (name "hyprland-plugin-easymotion")
    (version "0.52.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zakk4223/hyprland-easymotion")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/zakk4223/hyprland-easymotion")
    (synopsis "easymotion-style window labels for Hyprland")
    (description "A Hyprland plugin that brings up window labels and
allows executing user-defined commands on the selected window.  Similar
to vim-easymotion for navigating between windows.")
    (license license:bsd-3)))
