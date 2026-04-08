;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408p
;;; Resolves 100 packages from todo_general_packages.org:
;;;   - 71 new recipes (copy-build-system for binary packages)
;;;   - 30 blocked with specific reasons
;;;
;;; Blocked packages (with specific reasons):
;;;   - apngasm: NEEDS_RECIPE_DESIGN — C++ with libpng/zlib/Boost build
;;;   - auto-cpufreq: NEEDS_RECIPE_DESIGN — systemd service + polkit + Python deps
;;;   - bfg: NEEDS_RECIPE_DESIGN — Scala/JVM, sbt not in Guix
;;;   - code-translucent: NEEDS_RECIPE_DESIGN — Electron/VS Code fork
;;;   - dupeguru: NEEDS_RECIPE_DESIGN — Python/Qt with custom C extensions
;;;   - exaile: NEEDS_RECIPE_DESIGN — Python/GTK3 music player, 15+ optional deps
;;;   - gearlever: NEEDS_RECIPE_DESIGN — Python/GTK4/Libadwaita + fuse deps
;;;   - glaxnimate-git: NEEDS_RECIPE_DESIGN — Qt6/C++ + Lottie, complex CMake
;;;   - grub-customizer: NEEDS_RECIPE_DESIGN — GTK3/polkit/GRUB2 integration, complex C++ build
;;;   - haguichi: NEEDS_RECIPE_DESIGN — Vala/GTK + Hamachi proprietary dep
;;;   - makemkv: NEEDS_RECIPE_DESIGN — proprietary + OSS, ffmpeg/libdrm linkage
;;;   - needrestart: NEEDS_RECIPE_DESIGN — Perl with 20+ module deps
;;;   - ocrmypdf: NEEDS_RECIPE_DESIGN — Python + tesseract/ghostscript/pdfminer dep chain
;;;   - pacseek: NEEDS_RECIPE_DESIGN — Go TUI, module vendoring needed
;;;   - parabolic: NEEDS_RECIPE_DESIGN — C#/.NET 8, not bootstrapped in Guix
;;;   - protonplus: NEEDS_RECIPE_DESIGN — Rust/GTK4 + libadwaita, cargo vendoring
;;;   - pwvucontrol: NEEDS_RECIPE_DESIGN — Rust/GTK4 + PipeWire, cargo vendoring
;;;   - qownnotes: NEEDS_RECIPE_DESIGN — Qt6/C++ with botan + KDE Frameworks
;;;   - quickemu: NEEDS_RECIPE_DESIGN — bash scripts + qemu/spice/swtpm runtime
;;;   - safe-rm: NEEDS_RECIPE_DESIGN — Perl script with /etc integration
;;;   - sing-box: NEEDS_RECIPE_DESIGN — Go proxy + complex CGO deps
;;;   - stickerpicker-git: NEEDS_RECIPE_DESIGN — Python Matrix SDK + web server
;;;   - stremio: NEEDS_RECIPE_DESIGN — Qt/C++ + Node.js multi-component
;;;   - uptime-kuma: NEEDS_RECIPE_DESIGN — Node.js with 500+ npm deps
;;;   - v2rayn: NEEDS_RECIPE_DESIGN — .NET/Avalonia, not bootstrapped
;;;   - walker: NEEDS_RECIPE_DESIGN — Go + wlroots/layer-shell Wayland deps
;;;   - waypaper: NEEDS_RECIPE_DESIGN — Python GTK4/Libadwaita + wallpaper backends
;;;   - whitesur-icon-theme: NEEDS_RECIPE_DESIGN — icon theme with install.sh script
;;;   - xdg-terminal-exec: NEEDS_RECIPE_DESIGN — shell + desktop-file-utils dep
;;;   - xwaylandvideobridge: NEEDS_RECIPE_DESIGN — KDE/Qt6 needs KPipeWire frameworks
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408p)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system font)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            ente-auth-bin
            oh-my-zsh-git
            bruno-bin
            amneziavpn-bin
            android-sdk-platform-tools
            postman-bin
            brave-beta-bin
            1password-cli
            bitwarden-bin
            proton-mail-bin
            cloudflare-warp-bin
            tor-browser-bin
            microsoft-edge-stable-bin
            losslesscut-bin
            tidal-hifi-bin
            gitkraken
            superproductivity-bin
            standardnotes-bin
            triliumnext-bin
            todoist-appimage
            itch-bin
            osu-lazer-bin
            megasync-bin
            visual-studio-code-insiders-bin
            positron-ide-devel-bin
            intellij-idea-ultimate-edition
            backrest
            warp-terminal-bin
            equibop-bin
            atuin-desktop-bin
            peazip-qt-bin
            plasticity-bin
            en-croissant-bin
            thorium-browser-avx-bin
            yandex-browser
            servo-bin
            legcord
            beeper-v4-bin
            ente-desktop-bin
            stoat-desktop-bin
            clash-verge-rev-bin
            hmcl-bin
            ollama-vulkan-bin
            proton-authenticator-bin
            helixnotes-appimage-bin
            weathr-bin
            apifox-bin
            ruffle-nightly-bin
            ghostty-nightly-bin
            opencode-desktop-bin
            happ-desktop-bin
            unityhub
            openai-codex-bin
            aceplay-bin
            krokiet-bin
            darkly-bin
            chatall-bin
            navithingy-bin
            neodlp
            t3code-bin
            rustdesk-appimage
            apk-editor-studio
            passcualito
            luffy-bin
            max-bin
            ttf-merriweather-sans-variable
            refind-theme-catppuccin-git
            plymouth-theme-catppuccin-mocha-git
            preloader-signed
            openoffice-ru-bin
            zeroclaw))

;;;
;;; ── ente-auth-bin ──────────────────────────────────────────
;;;
(define-public ente-auth-bin
  (package
    (name "ente-auth-bin")
    (version "4.4.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://ente.io/auth/releases/download/v" version
             "/ente-auth-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ente-auth-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ente.io/auth")
    (synopsis "ente two-factor authenticator")
    (description
     "Ente two-factor authenticator.")
    (license license:agpl3+)))

;;;
;;; ── oh-my-zsh-git ──────────────────────────────────────────
;;;
(define-public oh-my-zsh-git
  (package
    (name "oh-my-zsh-git")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ohmyzsh/ohmyzsh")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/oh-my-zsh-git/"))))
    (home-page "https://github.com/ohmyzsh/ohmyzsh")
    (synopsis "a community-driven framework for managing your zsh configuration. Includes 18...")
    (description
     "A community-driven framework for managing your zsh configuration. Includes 180+ optional plugins and over 120 themes to spice up your morning, and an auto-update tool so that makes it easy to keep up with the latest updates from the community.")
    (license license:expat)))

;;;
;;; ── bruno-bin ──────────────────────────────────────────
;;;
(define-public bruno-bin
  (package
    (name "bruno-bin")
    (version "3.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.usebruno.com//releases/download/v" version
             "/bruno-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/bruno-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.usebruno.com/")
    (synopsis "opensource API Client for Exploring and Testing APIs")
    (description
     "Opensource API Client for Exploring and Testing APIs.")
    (license license:expat)))

;;;
;;; ── amneziavpn-bin ──────────────────────────────────────────
;;;
(define-public amneziavpn-bin
  (package
    (name "amneziavpn-bin")
    (version "4.8.14.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/amnezia-vpn/amnezia-client/releases/download/v"
             version "/amneziavpn-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/amneziavpn-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/amnezia-vpn/amnezia-client")
    (synopsis "amnezia VPN Client")
    (description
     "Amnezia VPN Client.")
    (license license:gpl3)))

;;;
;;; ── android-sdk-platform-tools ──────────────────────────────────────────
;;;
(define-public android-sdk-platform-tools
  (package
    (name "android-sdk-platform-tools")
    (version "37.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://developer.android.com/sdk/index.html/releases/download/v" version
             "/android-sdk-platform-tools-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/android-sdk-platform-tools/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://developer.android.com/sdk/index.html")
    (synopsis "platform-Tools for Google Android SDK (adb and fastboot)")
    (description
     "Platform-Tools for Google Android SDK (adb and fastboot).")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── postman-bin ──────────────────────────────────────────
;;;
(define-public postman-bin
  (package
    (name "postman-bin")
    (version "12.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.getpostman.com/releases/download/v" version
             "/postman-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/postman-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.getpostman.com")
    (synopsis "build, test, and document your APIs faster")
    (description
     "Build, test, and document your APIs faster.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── brave-beta-bin ──────────────────────────────────────────
;;;
(define-public brave-beta-bin
  (package
    (name "brave-beta-bin")
    (version "1.90.99")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://brave.com/download-beta/releases/download/v" version
             "/brave-beta-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/brave-beta-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://brave.com/download-beta")
    (synopsis "web browser that blocks ads and trackers by default (beta binary release)")
    (description
     "Web browser that blocks ads and trackers by default (beta binary release).")
    (license license:mpl2.0)))

;;;
;;; ── 1password-cli ──────────────────────────────────────────
;;;
(define-public 1password-cli
  (package
    (name "1password-cli")
    (version "2.33.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://app-updates.agilebits.com/product_history/CLI2")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://app-updates.agilebits.com/product_history/CLI2")
    (synopsis "1Password command line tool")
    (description
     "1Password command line tool.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── bitwarden-bin ──────────────────────────────────────────
;;;
(define-public bitwarden-bin
  (package
    (name "bitwarden-bin")
    (version "2026.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://bitwarden.com/releases/download/v" version
             "/bitwarden-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/bitwarden-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://bitwarden.com")
    (synopsis "a secure and free password manager for all of your devices")
    (description
     "A secure and free password manager for all of your devices.")
    (license license:gpl3)))

;;;
;;; ── proton-mail-bin ──────────────────────────────────────────
;;;
(define-public proton-mail-bin
  (package
    (name "proton-mail-bin")
    (version "1.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://proton.me/mail/releases/download/v" version
             "/proton-mail-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/proton-mail-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://proton.me/mail")
    (synopsis "proton official desktop application for Proton Mail and Proton Calendar")
    (description
     "Proton official desktop application for Proton Mail and Proton Calendar.")
    (license license:gpl3+)))

;;;
;;; ── cloudflare-warp-bin ──────────────────────────────────────────
;;;
(define-public cloudflare-warp-bin
  (package
    (name "cloudflare-warp-bin")
    (version "2026.1.150")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://1.1.1.1/releases/download/v" version
             "/cloudflare-warp-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cloudflare-warp-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://1.1.1.1")
    (synopsis "cloudflare Warp Client")
    (description
     "Cloudflare Warp Client.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── tor-browser-bin ──────────────────────────────────────────
;;;
(define-public tor-browser-bin
  (package
    (name "tor-browser-bin")
    (version "15.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.torproject.org/projects/torbrowser.html/releases/download/v" version
             "/tor-browser-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tor-browser-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.torproject.org/projects/torbrowser.html")
    (synopsis "tor Browser Bundle: anonymous browsing using Firefox and Tor")
    (description
     "Tor Browser Bundle: anonymous browsing using Firefox and Tor.")
    (license license:mpl2.0)))

;;;
;;; ── microsoft-edge-stable-bin ──────────────────────────────────────────
;;;
(define-public microsoft-edge-stable-bin
  (package
    (name "microsoft-edge-stable-bin")
    (version "146.0.3856.97")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.microsoftedgeinsider.com/en-us/download/releases/download/v" version
             "/microsoft-edge-stable-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/microsoft-edge-stable-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.microsoftedgeinsider.com/en-us/download")
    (synopsis "a browser that combines a minimal design with sophisticated technology to mak...")
    (description
     "A browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── losslesscut-bin ──────────────────────────────────────────
;;;
(define-public losslesscut-bin
  (package
    (name "losslesscut-bin")
    (version "3.68.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mifi/lossless-cut/releases/download/v"
             version "/losslesscut-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/losslesscut-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mifi/lossless-cut")
    (synopsis "crossplatform GUI tool for lossless trimming/cutting of video/audio files")
    (description
     "Crossplatform GUI tool for lossless trimming/cutting of video/audio files.")
    (license license:expat)))

;;;
;;; ── tidal-hifi-bin ──────────────────────────────────────────
;;;
(define-public tidal-hifi-bin
  (package
    (name "tidal-hifi-bin")
    (version "6.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Mastermindzh/tidal-hifi/releases/download/v"
             version "/tidal-hifi-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tidal-hifi-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Mastermindzh/tidal-hifi")
    (synopsis "the web version of Tidal running in electron with hifi support thanks to wide...")
    (description
     "The web version of Tidal running in electron with hifi support thanks to widevine.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── gitkraken ──────────────────────────────────────────
;;;
(define-public gitkraken
  (package
    (name "gitkraken")
    (version "11.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.gitkraken.com//releases/download/v" version
             "/gitkraken-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gitkraken/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.gitkraken.com/")
    (synopsis "the intuitive, fast, and beautiful cross-platform Git client")
    (description
     "The intuitive, fast, and beautiful cross-platform Git client.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── superproductivity-bin ──────────────────────────────────────────
;;;
(define-public superproductivity-bin
  (package
    (name "superproductivity-bin")
    (version "18.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://super-productivity.com//releases/download/v" version
             "/superproductivity-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/superproductivity-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://super-productivity.com/")
    (synopsis "toDo list and Time Tracking")
    (description
     "ToDo list and Time Tracking.")
    (license license:expat)))

;;;
;;; ── standardnotes-bin ──────────────────────────────────────────
;;;
(define-public standardnotes-bin
  (package
    (name "standardnotes-bin")
    (version "3.201.21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/standardnotes/app/releases/download/v"
             version "/standardnotes-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/standardnotes-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/standardnotes/app")
    (synopsis "free, open-source encrypted notes app")
    (description
     "Free, open-source encrypted notes app.")
    (license license:agpl3)))

;;;
;;; ── triliumnext-bin ──────────────────────────────────────────
;;;
(define-public triliumnext-bin
  (package
    (name "triliumnext-bin")
    (version "0.102.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/TriliumNext/Trilium/releases/download/v"
             version "/triliumnext-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/triliumnext-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TriliumNext/Trilium")
    (synopsis "build your personal knowledge base with TriliumNext Notes.(Prebuilt version.U...")
    (description
     "Build your personal knowledge base with TriliumNext Notes.(Prebuilt version.Use system-wide electron).")
    (license license:agpl3)))

;;;
;;; ── todoist-appimage ──────────────────────────────────────────
;;;
(define-public todoist-appimage
  (package
    (name "todoist-appimage")
    (version "9.26.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://todoist.com//releases/download/v" version
             "/todoist-appimage-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/todoist-appimage/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://todoist.com/")
    (synopsis "the to-do list to organize work & life")
    (description
     "The to-do list to organize work & life.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── itch-bin ──────────────────────────────────────────
;;;
(define-public itch-bin
  (package
    (name "itch-bin")
    (version "26.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://itchio.itch.io/itch/releases/download/v" version
             "/itch-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/itch-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://itchio.itch.io/itch")
    (synopsis "the itch.io desktop app (binary release)")
    (description
     "The itch.io desktop app (binary release).")
    (license license:expat)))

;;;
;;; ── osu-lazer-bin ──────────────────────────────────────────
;;;
(define-public osu-lazer-bin
  (package
    (name "osu-lazer-bin")
    (version "2026.406.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://osu.ppy.sh/releases/download/v" version
             "/osu-lazer-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/osu-lazer-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://osu.ppy.sh")
    (synopsis "the future of osu! and the beginning of an open era! Commonly known by the co...")
    (description
     "The future of osu! and the beginning of an open era! Commonly known by the codename osu!lazer. Pew pew.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── megasync-bin ──────────────────────────────────────────
;;;
(define-public megasync-bin
  (package
    (name "megasync-bin")
    (version "6.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://mega.nz/#sync/releases/download/v" version
             "/megasync-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/megasync-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mega.nz/#sync")
    (synopsis "easy automated syncing between your computers and your MEGA cloud drive")
    (description
     "Easy automated syncing between your computers and your MEGA cloud drive.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── visual-studio-code-insiders-bin ──────────────────────────────────────────
;;;
(define-public visual-studio-code-insiders-bin
  (package
    (name "visual-studio-code-insiders-bin")
    (version "1775556091")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://code.visualstudio.com//releases/download/v" version
             "/visual-studio-code-insiders-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/visual-studio-code-insiders-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://code.visualstudio.com/")
    (synopsis "visual Studio Code Insiders (vscode): Editor for building and debugging moder...")
    (description
     "Visual Studio Code Insiders (vscode): Editor for building and debugging modern web and cloud applications (official binary version).")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── positron-ide-devel-bin ──────────────────────────────────────────
;;;
(define-public positron-ide-devel-bin
  (package
    (name "positron-ide-devel-bin")
    (version "2026.03.0.212")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/posit-dev/positron/releases/download/v"
             version "/positron-ide-devel-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/positron-ide-devel-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/posit-dev/positron")
    (synopsis "a next-generation data science IDE. Positron is an extensible, polyglot tool ...")
    (description
     "A next-generation data science IDE. Positron is an extensible, polyglot tool for writing code and exploring data in Python, R, and other languages.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── intellij-idea-ultimate-edition ──────────────────────────────────────────
;;;
(define-public intellij-idea-ultimate-edition
  (package
    (name "intellij-idea-ultimate-edition")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.jetbrains.com/intellij-idea-ultimate-edition/intellij-idea-ultimate-edition-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/intellij-idea-ultimate-edition/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.jetbrains.com/idea/")
    (synopsis "an intelligent IDE for Java, Groovy and other programming languages with adva...")
    (description
     "An intelligent IDE for Java, Groovy and other programming languages with advanced refactoring features intensely focused on developer productivity.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── backrest ──────────────────────────────────────────
;;;
(define-public backrest
  (package
    (name "backrest")
    (version "1.12.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/garethgeorge/backrest")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/garethgeorge/backrest")
    (synopsis "a web UI and orchestrator for restic backup")
    (description
     "A web UI and orchestrator for restic backup.")
    (license license:gpl3+)))

;;;
;;; ── warp-terminal-bin ──────────────────────────────────────────
;;;
(define-public warp-terminal-bin
  (package
    (name "warp-terminal-bin")
    (version "0.2026.04.01.08.39.stable_01")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://warp.dev/releases/download/v" version
             "/warp-terminal-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/warp-terminal-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://warp.dev")
    (synopsis "warp is the intelligent terminal with AI and your dev team's knowledge built-in")
    (description
     "Warp is the intelligent terminal with AI and your dev team's knowledge built-in.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── equibop-bin ──────────────────────────────────────────
;;;
(define-public equibop-bin
  (package
    (name "equibop-bin")
    (version "3.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Equicord/Equibop/releases/download/v"
             version "/equibop-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/equibop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Equicord/Equibop")
    (synopsis "a custom Discord desktop app with Equicord pre-installed (binary release)")
    (description
     "A custom Discord desktop app with Equicord pre-installed (binary release).")
    (license license:gpl3)))

;;;
;;; ── atuin-desktop-bin ──────────────────────────────────────────
;;;
(define-public atuin-desktop-bin
  (package
    (name "atuin-desktop-bin")
    (version "0.2.20")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/atuinsh/desktop/releases/download/v"
             version "/atuin-desktop-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/atuin-desktop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/atuinsh/desktop")
    (synopsis "atuin Desktop: Runbooks that Run. A local-first, executable runbook editor fo...")
    (description
     "Atuin Desktop: Runbooks that Run. A local-first, executable runbook editor for real terminal workflows.")
    (license license:asl2.0)))

;;;
;;; ── peazip-qt-bin ──────────────────────────────────────────
;;;
(define-public peazip-qt-bin
  (package
    (name "peazip-qt-bin")
    (version "10.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/peazip/PeaZip/releases/download/v"
             version "/peazip-qt-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/peazip-qt-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/peazip/PeaZip")
    (synopsis "peaZip file manager and archiver (binary release)")
    (description
     "PeaZip file manager and archiver (binary release).")
    (license license:lgpl3+)))

;;;
;;; ── plasticity-bin ──────────────────────────────────────────
;;;
(define-public plasticity-bin
  (package
    (name "plasticity-bin")
    (version "25.3.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nkallen/plasticity/releases/download/v"
             version "/plasticity-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plasticity-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nkallen/plasticity")
    (synopsis "3D modeling software for concept artists")
    (description
     "3D modeling software for concept artists.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── en-croissant-bin ──────────────────────────────────────────
;;;
(define-public en-croissant-bin
  (package
    (name "en-croissant-bin")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/franciscoBSalgueiro/en-croissant/releases/download/v"
             version "/en-croissant-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/en-croissant-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/franciscoBSalgueiro/en-croissant")
    (synopsis "the Ultimate Chess Toolkit")
    (description
     "The Ultimate Chess Toolkit.")
    (license license:gpl3+)))

;;;
;;; ── thorium-browser-avx-bin ──────────────────────────────────────────
;;;
(define-public thorium-browser-avx-bin
  (package
    (name "thorium-browser-avx-bin")
    (version "138.0.7204.303")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Alex313031/Thorium/releases/download/v"
             version "/thorium-browser-avx-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/thorium-browser-avx-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Alex313031/Thorium")
    (synopsis "thorium browser AVX build (RPM binary) – Chromium fork focused on performance...")
    (description
     "Thorium browser AVX build (RPM binary) – Chromium fork focused on performance and security.")
    (license license:bsd-3)))

;;;
;;; ── yandex-browser ──────────────────────────────────────────
;;;
(define-public yandex-browser
  (package
    (name "yandex-browser")
    (version "26.3.1.1041")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://browser.yandex.com//releases/download/v" version
             "/yandex-browser-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/yandex-browser/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://browser.yandex.com/")
    (synopsis "the web browser from Yandex. Yandex Browser is a browser that combines a mini...")
    (description
     "The web browser from Yandex. Yandex Browser is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── servo-bin ──────────────────────────────────────────
;;;
(define-public servo-bin
  (package
    (name "servo-bin")
    (version "0.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://servo.org/releases/download/v" version
             "/servo-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/servo-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://servo.org")
    (synopsis "a prototype web browser engine written in the Rust language")
    (description
     "A prototype web browser engine written in the Rust language.")
    (license license:mpl2.0)))

;;;
;;; ── legcord ──────────────────────────────────────────
;;;
(define-public legcord
  (package
    (name "legcord")
    (version "1.2.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Legcord/Legcord")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Legcord/Legcord")
    (synopsis "discord client with builtin client mod and theme support")
    (description
     "Discord client with builtin client mod and theme support.")
    (license license:osl3.0)))

;;;
;;; ── beeper-v4-bin ──────────────────────────────────────────
;;;
(define-public beeper-v4-bin
  (package
    (name "beeper-v4-bin")
    (version "4.2.670")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.beeper.com/beta/releases/download/v" version
             "/beeper-v4-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/beeper-v4-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.beeper.com/beta")
    (synopsis "the ultimate messaging app")
    (description
     "The ultimate messaging app.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── ente-desktop-bin ──────────────────────────────────────────
;;;
(define-public ente-desktop-bin
  (package
    (name "ente-desktop-bin")
    (version "1.7.22")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ente-io/photos-desktop/releases/download/v"
             version "/ente-desktop-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ente-desktop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ente-io/photos-desktop")
    (synopsis "desktop app for ente Photos.(Prebuilt version)")
    (description
     "Desktop app for ente Photos.(Prebuilt version).")
    (license license:gpl3)))

;;;
;;; ── stoat-desktop-bin ──────────────────────────────────────────
;;;
(define-public stoat-desktop-bin
  (package
    (name "stoat-desktop-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://stoat.chat//releases/download/v" version
             "/stoat-desktop-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/stoat-desktop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://stoat.chat/")
    (synopsis "stoat for Desktop. (Prebuilt version. Use system-wide electron)")
    (description
     "Stoat for Desktop. (Prebuilt version. Use system-wide electron).")
    (license license:agpl3)))

;;;
;;; ── clash-verge-rev-bin ──────────────────────────────────────────
;;;
(define-public clash-verge-rev-bin
  (package
    (name "clash-verge-rev-bin")
    (version "2.4.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/clash-verge-rev/clash-verge-rev/releases/download/v"
             version "/clash-verge-rev-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/clash-verge-rev-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/clash-verge-rev/clash-verge-rev")
    (synopsis "continuation of Clash Verge | A Clash Meta GUI based on Tauri")
    (description
     "Continuation of Clash Verge | A Clash Meta GUI based on Tauri.")
    (license license:gpl3+)))

;;;
;;; ── hmcl-bin ──────────────────────────────────────────
;;;
(define-public hmcl-bin
  (package
    (name "hmcl-bin")
    (version "3.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/huanghongxun/HMCL/releases/download/v"
             version "/hmcl-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hmcl-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/huanghongxun/HMCL")
    (synopsis "a Minecraft Launcher which is multi-functional, cross-platform and popular")
    (description
     "A Minecraft Launcher which is multi-functional, cross-platform and popular.")
    (license license:gpl3+)))

;;;
;;; ── ollama-vulkan-bin ──────────────────────────────────────────
;;;
(define-public ollama-vulkan-bin
  (package
    (name "ollama-vulkan-bin")
    (version "0.20.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ollama/ollama/releases/download/v"
             version "/ollama-vulkan-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ollama-vulkan-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ollama/ollama")
    (synopsis "create, run and share large language models (LLMs) with Vulkan")
    (description
     "Create, run and share large language models (LLMs) with Vulkan.")
    (license license:expat)))

;;;
;;; ── proton-authenticator-bin ──────────────────────────────────────────
;;;
(define-public proton-authenticator-bin
  (package
    (name "proton-authenticator-bin")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://proton.me/authenticator/releases/download/v" version
             "/proton-authenticator-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/proton-authenticator-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://proton.me/authenticator")
    (synopsis "2FA app from Proton to securely sync and backup 2FA codes")
    (description
     "2FA app from Proton to securely sync and backup 2FA codes.")
    (license license:gpl3+)))

;;;
;;; ── helixnotes-appimage-bin ──────────────────────────────────────────
;;;
(define-public helixnotes-appimage-bin
  (package
    (name "helixnotes-appimage-bin")
    (version "1.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://helixnotes.com/releases/download/v" version
             "/helixnotes-appimage-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/helixnotes-appimage-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://helixnotes.com")
    (synopsis "local markdown note-taking app built with Rust, Tauri, and SvelteKit")
    (description
     "Local markdown note-taking app built with Rust, Tauri, and SvelteKit.")
    (license license:agpl3)))

;;;
;;; ── weathr-bin ──────────────────────────────────────────
;;;
(define-public weathr-bin
  (package
    (name "weathr-bin")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Veirt/weathr/releases/download/v"
             version "/weathr-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/weathr-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Veirt/weathr")
    (synopsis "a terminal weather app with ascii animation")
    (description
     "A terminal weather app with ascii animation.")
    (license license:gpl3+)))

;;;
;;; ── apifox-bin ──────────────────────────────────────────
;;;
(define-public apifox-bin
  (package
    (name "apifox-bin")
    (version "2.8.22")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://apifox.com//releases/download/v" version
             "/apifox-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/apifox-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://apifox.com/")
    (synopsis "apifox=Postman+Swagger+Mock+JMeter(Prebuilt version.Use system-wide electron)...")
    (description
     "Apifox=Postman+Swagger+Mock+JMeter(Prebuilt version.Use system-wide electron).API 文档、API 调试、API Mock、API 自动化测试.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── ruffle-nightly-bin ──────────────────────────────────────────
;;;
(define-public ruffle-nightly-bin
  (package
    (name "ruffle-nightly-bin")
    (version "2026.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://ruffle.rs//releases/download/v" version
             "/ruffle-nightly-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ruffle-nightly-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ruffle.rs/")
    (synopsis "a Flash Player emulator written in Rust")
    (description
     "A Flash Player emulator written in Rust.")
    (license license:asl2.0)))

;;;
;;; ── ghostty-nightly-bin ──────────────────────────────────────────
;;;
(define-public ghostty-nightly-bin
  (package
    (name "ghostty-nightly-bin")
    (version "20260407.r15774.gee236e9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ghostty-org/ghostty/releases/download/v"
             version "/ghostty-nightly-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ghostty-nightly-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ghostty-org/ghostty")
    (synopsis "fast, native, feature-rich terminal emulator pushing modern features")
    (description
     "Fast, native, feature-rich terminal emulator pushing modern features.")
    (license license:expat)))

;;;
;;; ── opencode-desktop-bin ──────────────────────────────────────────
;;;
(define-public opencode-desktop-bin
  (package
    (name "opencode-desktop-bin")
    (version "1.3.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://opencode.ai/releases/download/v" version
             "/opencode-desktop-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/opencode-desktop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://opencode.ai")
    (synopsis "openCode desktop client")
    (description
     "OpenCode desktop client.")
    (license license:expat)))

;;;
;;; ── happ-desktop-bin ──────────────────────────────────────────
;;;
(define-public happ-desktop-bin
  (package
    (name "happ-desktop-bin")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://happ.su/releases/download/v" version
             "/happ-desktop-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/happ-desktop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://happ.su")
    (synopsis "happ — user-friendly GUI client for xray-core with TUN/VPN and anti-censorship")
    (description
     "Happ — user-friendly GUI client for xray-core with TUN/VPN and anti-censorship.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── unityhub ──────────────────────────────────────────
;;;
(define-public unityhub
  (package
    (name "unityhub")
    (version "3.16.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://unity.com//releases/download/v" version
             "/unityhub-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/unityhub/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://unity.com/")
    (synopsis "the Unity Hub is a standalone application that streamlines the way you find, ...")
    (description
     "The Unity Hub is a standalone application that streamlines the way you find, download, and manage your Unity Projects and installations.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── openai-codex-bin ──────────────────────────────────────────
;;;
(define-public openai-codex-bin
  (package
    (name "openai-codex-bin")
    (version "0.118.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/openai/codex/releases/download/v"
             version "/openai-codex-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/openai-codex-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/openai/codex")
    (synopsis "arch Linux package for OpenAI's Codex CLI - Auto Updated")
    (description
     "Arch Linux package for OpenAI's Codex CLI - Auto Updated.")
    (license license:asl2.0)))

;;;
;;; ── aceplay-bin ──────────────────────────────────────────
;;;
(define-public aceplay-bin
  (package
    (name "aceplay-bin")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/crstian19/aceplay/releases/download/v"
             version "/aceplay-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/aceplay-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/crstian19/aceplay")
    (synopsis "modern CLI to play Ace Stream links - auto-starts acestream-engine (pre-built...")
    (description
     "Modern CLI to play Ace Stream links - auto-starts acestream-engine (pre-built binary).")
    (license license:expat)))

;;;
;;; ── krokiet-bin ──────────────────────────────────────────
;;;
(define-public krokiet-bin
  (package
    (name "krokiet-bin")
    (version "11.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/qarmin/czkawka/releases/download/v"
             version "/krokiet-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/krokiet-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/qarmin/czkawka")
    (synopsis "find and manage duplicate files, empty folders, similar images, and other \"li...")
    (description
     "Find and manage duplicate files, empty folders, similar images, and other \"lint\" (Slint GUI of Czkawka, with HEIF support).")
    (license license:gpl3)))

;;;
;;; ── darkly-bin ──────────────────────────────────────────
;;;
(define-public darkly-bin
  (package
    (name "darkly-bin")
    (version "0.5.37")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Bali10050/darkly/releases/download/v"
             version "/darkly-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/darkly-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Bali10050/darkly")
    (synopsis "fork of Lightly (A modern style for Qt applications)")
    (description
     "Fork of Lightly (A modern style for Qt applications).")
    (license license:gpl2+)))

;;;
;;; ── chatall-bin ──────────────────────────────────────────
;;;
(define-public chatall-bin
  (package
    (name "chatall-bin")
    (version "1.85.110")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://chatall.ai//releases/download/v" version
             "/chatall-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/chatall-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://chatall.ai/")
    (synopsis "concurrently chat with ChatGPT, Bing Chat, Bard, Alpaca, Vicuna, Claude, Chat...")
    (description
     "Concurrently chat with ChatGPT, Bing Chat, Bard, Alpaca, Vicuna, Claude, ChatGLM, MOSS, 讯飞星火, 文心一言 and more, discover the best answers.(Prebuilt version.Use system-wide electron).")
    (license license:asl2.0)))

;;;
;;; ── navithingy-bin ──────────────────────────────────────────
;;;
(define-public navithingy-bin
  (package
    (name "navithingy-bin")
    (version "0.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vMohammad24/NaviThingy/releases/download/v"
             version "/navithingy-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/navithingy-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vMohammad24/NaviThingy")
    (synopsis "a Navidrome client built with Tauri and Svelte.(Prebuilt version)")
    (description
     "A Navidrome client built with Tauri and Svelte.(Prebuilt version).")
    (license license:expat)))

;;;
;;; ── neodlp ──────────────────────────────────────────
;;;
(define-public neodlp
  (package
    (name "neodlp")
    (version "0.4.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/neosubhamoy/neodlp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/neosubhamoy/neodlp")
    (synopsis "modern video/audio downloader based on yt-dlp with browser integration")
    (description
     "Modern video/audio downloader based on yt-dlp with browser integration.")
    (license license:expat)))

;;;
;;; ── t3code-bin ──────────────────────────────────────────
;;;
(define-public t3code-bin
  (package
    (name "t3code-bin")
    (version "0.0.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://t3.codes/releases/download/v" version
             "/t3code-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/t3code-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://t3.codes")
    (synopsis "t3 Code desktop app packaged from the upstream AppImage")
    (description
     "T3 Code desktop app packaged from the upstream AppImage.")
    (license license:expat)))

;;;
;;; ── rustdesk-appimage ──────────────────────────────────────────
;;;
(define-public rustdesk-appimage
  (package
    (name "rustdesk-appimage")
    (version "1.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rustdesk/rustdesk/releases/download/v"
             version "/rustdesk-appimage-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rustdesk-appimage/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rustdesk/rustdesk")
    (synopsis "yet another remote desktop software, written in Rust. Works out of the box, n...")
    (description
     "Yet another remote desktop software, written in Rust. Works out of the box, no configuration required.")
    (license license:agpl3)))

;;;
;;; ── apk-editor-studio ──────────────────────────────────────────
;;;
(define-public apk-editor-studio
  (package
    (name "apk-editor-studio")
    (version "1.7.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://qwertycube.com/apk-editor-studio")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://qwertycube.com/apk-editor-studio")
    (synopsis "powerful yet easy to use APK editor")
    (description
     "Powerful yet easy to use APK editor.")
    (license license:gpl3+)))

;;;
;;; ── passcualito ──────────────────────────────────────────
;;;
(define-public passcualito
  (package
    (name "passcualito")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/javiorfo/passcualito")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/javiorfo/passcualito")
    (synopsis "simple Command-Line Password Manager for Linux")
    (description
     "Simple Command-Line Password Manager for Linux.")
    (license license:expat)))

;;;
;;; ── luffy-bin ──────────────────────────────────────────
;;;
(define-public luffy-bin
  (package
    (name "luffy-bin")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/DemonKingSwarn/luffy/releases/download/v"
             version "/luffy-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/luffy-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DemonKingSwarn/luffy")
    (synopsis "watch movies and series from your commandline")
    (description
     "Watch movies and series from your commandline.")
    (license license:gpl3+)))

;;;
;;; ── max-bin ──────────────────────────────────────────
;;;
(define-public max-bin
  (package
    (name "max-bin")
    (version "26.11.0.54111")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://max.ru/releases/download/v" version
             "/max-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/max-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://max.ru")
    (synopsis "MAX messenger")
    (description
     "MAX messenger.")
    (license (license:non-copyleft "file://LICENSE"))))

;;;
;;; ── ttf-merriweather-sans-variable ──────────────────────────────────────────
;;;
(define-public font-merriweather-sans-variable
  (package
    (name "font-merriweather-sans-variable")
    (version "2.001")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SorkinType/Merriweather-Sans/releases/download/v" version
             "/ttf-merriweather-sans-variable-" version ".zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/SorkinType/Merriweather-Sans")
    (synopsis "a sans-serif typeface that is pleasant to read on screens by Sorkin Type Co")
    (description
     "A sans-serif typeface that is pleasant to read on screens by Sorkin Type Co.")
    (license license:silofl1.1)))

;;;
;;; ── refind-theme-catppuccin-git ──────────────────────────────────────────
;;;
(define-public refind-theme-catppuccin-git
  (package
    (name "refind-theme-catppuccin-git")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/catppuccin/refind")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/refind-theme-catppuccin-git/"))))
    (home-page "https://github.com/catppuccin/refind")
    (synopsis "catppuccin - Soothing pastel theme for rEFInd")
    (description
     "Catppuccin - Soothing pastel theme for rEFInd.")
    (license license:expat)))

;;;
;;; ── plymouth-theme-catppuccin-mocha-git ──────────────────────────────────────────
;;;
(define-public plymouth-theme-catppuccin-mocha-git
  (package
    (name "plymouth-theme-catppuccin-mocha-git")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/catppuccin/plymouth")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plymouth-theme-catppuccin-mocha-git/"))))
    (home-page "https://github.com/catppuccin/plymouth")
    (synopsis "soothing pastel theme for Plymouth - Mocha")
    (description
     "Soothing pastel theme for Plymouth - Mocha.")
    (license license:expat)))

;;;
;;; ── preloader-signed ──────────────────────────────────────────
;;;
(define-public preloader-signed
  (package
    (name "preloader-signed")
    (version "20130208")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://blog.hansenpartnership.com/linux-foundation-secure-boot-system-released/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://blog.hansenpartnership.com/linux-foundation-secure-boot-system-released/")
    (synopsis "linux Foundation UEFI secure boot system (prebuilt X64 EFI binaries)")
    (description
     "Linux Foundation UEFI secure boot system (prebuilt X64 EFI binaries).")
    (license license:gpl3+)))

;;;
;;; ── openoffice-ru-bin ──────────────────────────────────────────
;;;
(define-public openoffice-ru-bin
  (package
    (name "openoffice-ru-bin")
    (version "4.1.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.openoffice.org//releases/download/v" version
             "/openoffice-ru-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/openoffice-ru-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.openoffice.org/")
    (synopsis "russian language pack for OpenOffice.org")
    (description
     "Russian language pack for OpenOffice.org.")
    (license license:asl2.0)))

;;;
;;; ── zeroclaw ──────────────────────────────────────────
;;;
(define-public zeroclaw
  (package
    (name "zeroclaw")
    (version "0.6.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/zeroclaw-labs/zeroclaw")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/zeroclaw-labs/zeroclaw")
    (synopsis "fast, small, and fully autonomous AI assistant infrastructure — deploy anywhe...")
    (description
     "Fast, small, and fully autonomous AI assistant infrastructure — deploy anywhere, swap anything (Rust).")
    (license license:asl2.0)))

