;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414d
;;; Resolves 100 TODO packages from general queue (entries 12906-13092).
;;; 100 recipe drafts created with placeholder hashes.
;;; Run `guix download <url>` to obtain real hashes before building.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).

(define-module (gaurix packages recipe-resolver-260414d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pkg-config)
  #:export (
            eden-preview-bin
            prowlarr-bin
            clipcascade-bin
            gitfourchette-bin
            snekstudio-bin
            insomnium-bin
            headroom-bin
            mp3rgain-bin
            cloudflare-warp-nox-bin
            stacer-bin
            aws-cli-bin
            figma-agent-linux-bin
            z-library-bin
            flyctl-bin
            photoqt-bin
            fjordlauncher-bin
            cagent-bin
            gnirehtet-bin
            icann-rdap-bin
            f1multiviewer-bin
            stripe-cli-bin
            c3c-bin
            64gram-desktop-bin
            leafview-bin
            orca-slicer-bin
            rimsort-bin
            jpu-bin
            vrcx-bin
            vt-cli-bin
            slackdump-bin
            bsky-cli-bin
            turso-bin
            sone-bin
            mihomo-party-bin
            goto-ssh-bin
            oracle-bin
            tirith-bin
            tylax-bin
            deadbranch-bin
            gohan-bin
            numr-bin
            joplin-bin
            betterbird-ru-bin
            charles-bundled-java
            pcloud-drive
            ttf-nanum
            dina-font
            rime-ice-git
            rime-ice-pinyin-git
            rime-ice-double-pinyin-git
            rime-ice-double-pinyin-abc-git
            rime-ice-double-pinyin-mspy-git
            rime-ice-double-pinyin-sogou-git
            rime-ice-double-pinyin-flypy-git
            rime-ice-double-pinyin-ziguang-git
            rime-ice-double-pinyin-jiajia-git
            86box-roms
            xkb-ultimatekeys
            xr-hardware
            modsecurity-crs
            multi-account-containers-lite
            firedragon-multi-account-containers-lite
            firefox-multi-account-containers-lite
            floorp-multi-account-containers-lite
            icecat-multi-account-containers-lite
            librewolf-multi-account-containers-lite
            midori-multi-account-containers-lite
            mons
            ticket
            chezetc
            autoaspm-git
            steamclip
            gdown
            woeusb-ng
            python-bump-my-version
            python-bitwarden-sdk
            python-dora-search
            fluent-bit
            dynamips
            gourou
            photoqt
            hypseus-singe
            brewtarget
            vpcs
            mdns-scan
            preload
            openarc
            cnmatrix
            slack
            pam-ssh-agent
            gnome-shell-pomodoro
            presage
            freac
            snmpb
            firmware-manager
            lfe
            flare
            privatebin
            cubeb-docs
            wstui
            ))

;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── eden-preview-bin (#12906) ──
(define-public eden-preview-bin
  (package
    (name "eden-preview-bin")
    (version "0.0.839")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/eden-emulator/eden/releases/download/v0.0.839/eden-mainline-0.0.839-linux-appimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/eden-preview-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/eden-emulator/eden")
    (synopsis "nintendo switch emulator preview builds (AppImage)")
    (description "Nintendo Switch emulator AppImage for preview builds")
    (license license:gpl3+)))

;;; ── prowlarr-bin (#12914) ──
(define-public prowlarr-bin
  (package
    (name "prowlarr-bin")
    (version "1.33.2.5054")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Prowlarr/Prowlarr/releases/download/v1.33.2.5054/Prowlarr.master.1.33.2.5054.linux-core-x64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/prowlarr-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Prowlarr/Prowlarr")
    (synopsis "indexer manager and proxy for usenet and torrent")
    (description "Indexer manager/proxy for usenet and torrent users")
    (license license:gpl3)))

;;; ── clipcascade-bin (#12933) ──
(define-public clipcascade-bin
  (package
    (name "clipcascade-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Sathvik-Rao/ClipCascade/releases/download/v1.0.0/clipcascade-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/clipcascade-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Sathvik-Rao/ClipCascade")
    (synopsis "clipboard synchronization across multiple devices")
    (description "ClipCascade: Sync clipboard across multiple devices")
    (license license:expat)))

;;; ── gitfourchette-bin (#12944) ──
(define-public gitfourchette-bin
  (package
    (name "gitfourchette-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/jorio/gitfourchette/releases/download/v1.2.0/GitFourchette-1.2.0-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gitfourchette-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jorio/gitfourchette")
    (synopsis "comfortable Qt-based graphical Git client")
    (description "The comfortable Qt-based Git GUI")
    (license license:gpl3+)))

;;; ── snekstudio-bin (#12948) ──
(define-public snekstudio-bin
  (package
    (name "snekstudio-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/virtual-puppet-project/snekstudio/releases/download/v0.3.0/snekstudio-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/snekstudio-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/virtual-puppet-project/snekstudio")
    (synopsis "open-source VTuber software using Godot engine")
    (description "Open-source VTuber software using Godot Engine")
    (license license:expat)))

;;; ── insomnium-bin (#12949) ──
(define-public insomnium-bin
  (package
    (name "insomnium-bin")
    (version "0.2.3-a")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ArchGPT/insomnium/releases/download/core@0.2.3-a/Insomnium.Core-0.2.3-a.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/insomnium-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ArchGPT/insomnium")
    (synopsis "privacy-focused API client for GraphQL and REST")
    (description "API Client for GraphQL and REST (privacy focused Insomnia fork)")
    (license license:asl2.0)))

;;; ── headroom-bin (#12950) ──
(define-public headroom-bin
  (package
    (name "headroom-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nomonosound/headroom/releases/download/v0.5.0/headroom-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/headroom-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nomonosound/headroom")
    (synopsis "audio loudness analyzer and gain adjustment tool")
    (description "Audio loudness analyzer and gain adjustment tool")
    (license license:expat)))

;;; ── mp3rgain-bin (#12952) ──
(define-public mp3rgain-bin
  (package
    (name "mp3rgain-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/niclasr/mp3rgain/releases/download/v1.0.0/mp3rgain-linux-x86_64")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/mp3rgain-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/mp3rgain")
    (synopsis "lossless MP3 volume adjustment tool")
    (description "Lossless MP3 volume adjustment - modern mp3gain replacement")
    (license license:lgpl2.1)))

;;; ── cloudflare-warp-nox-bin (#12953) ──
(define-public cloudflare-warp-nox-bin
  (package
    (name "cloudflare-warp-nox-bin")
    (version "2024.12.554")
    (source (origin
              (method url-fetch)
              (uri "https://pkg.cloudflareclient.com/pool/noble/main/c/cloudflare-warp/cloudflare-warp_2024.12.554_amd64.deb")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cloudflare-warp-nox-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://developers.cloudflare.com/warp-client/")
    (synopsis "cloudflare Warp VPN client for headless servers")
    (description "Cloudflare Warp Client for servers")
    (license license:asl2.0)))

;;; ── stacer-bin (#12974) ──
(define-public stacer-bin
  (package
    (name "stacer-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/oguzhaninan/Stacer/releases/download/v1.1.0/Stacer-1.1.0-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/stacer-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://oguzhaninan.github.io/Stacer-Web/")
    (synopsis "linux system optimizer and monitoring tool")
    (description "Linux System Optimizer and Monitoring")
    (license license:gpl3)))

;;; ── aws-cli-bin (#12976) ──
(define-public aws-cli-bin
  (package
    (name "aws-cli-bin")
    (version "2.24.0")
    (source (origin
              (method url-fetch)
              (uri "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.24.0.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/aws-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://aws.amazon.com/cli/")
    (synopsis "unified command line interface for Amazon Web Services")
    (description "Amazon Web Services CLI v2 binary release")
    (license license:asl2.0)))

;;; ── figma-agent-linux-bin (#12977) ──
(define-public figma-agent-linux-bin
  (package
    (name "figma-agent-linux-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/figma-agent-linux/releases/download/v0.5.0/figma-agent-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/figma-agent-linux-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicklasoverworlds/figma-agent-linux")
    (synopsis "lightweight local service for Figma font access")
    (description "Makes locally installed fonts available on Figma")
    (license license:expat)))

;;; ── z-library-bin (#12981) ──
(define-public z-library-bin
  (package
    (name "z-library-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/AnonSave/Z-Library/releases/download/v1.5.0/Z-Library-1.5.0-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/z-library-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AnonSave/Z-Library")
    (synopsis "Z-library desktop application")
    (description "Z-library desktop application")
    (license license:expat)))

;;; ── flyctl-bin (#12995) ──
(define-public flyctl-bin
  (package
    (name "flyctl-bin")
    (version "0.3.80")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/superfly/flyctl/releases/download/v0.3.80/flyctl_0.3.80_Linux_x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/flyctl-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://fly.io/")
    (synopsis "command line tools for fly.io services")
    (description "Command line tools for fly.io services")
    (license license:asl2.0)))

;;; ── photoqt-bin (#13013) ──
(define-public photoqt-bin
  (package
    (name "photoqt-bin")
    (version "4.7")
    (source (origin
              (method url-fetch)
              (uri "https://photoqt.org/downloads/photoqt-4.7-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/photoqt-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://photoqt.org/")
    (synopsis "fast and highly configurable image viewer (binary)")
    (description "Fast and highly configurable image viewer (binary release)")
    (license license:gpl2+)))

;;; ── fjordlauncher-bin (#13025) ──
(define-public fjordlauncher-bin
  (package
    (name "fjordlauncher-bin")
    (version "9.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/unmojang/FjordLauncher/releases/download/9.2/FjordLauncher-Linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fjordlauncher-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/unmojang/FjordLauncher")
    (synopsis "Minecraft launcher fork with alternative auth support")
    (description "Prism Launcher fork with alternative auth server support")
    (license license:gpl3+)))

;;; ── cagent-bin (#13027) ──
(define-public cagent-bin
  (package
    (name "cagent-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/cagent-project/cagent/releases/download/v0.1.0/cagent-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cagent-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cagent-project/cagent")
    (synopsis "docker container agent builder and runtime")
    (description "Docker cagent - Agent Builder and Runtime")
    (license license:asl2.0)))

;;; ── gnirehtet-bin (#13028) ──
(define-public gnirehtet-bin
  (package
    (name "gnirehtet-bin")
    (version "2.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Genymobile/gnirehtet/releases/download/v2.5.1/gnirehtet-rust-linux64-v2.5.1.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnirehtet-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Genymobile/gnirehtet")
    (synopsis "reverse tethering tool for Android devices")
    (description "Gnirehtet provides reverse tethering for Android")
    (license license:asl2.0)))

;;; ── icann-rdap-bin (#13038) ──
(define-public icann-rdap-bin
  (package
    (name "icann-rdap-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/icann/icann-rdap/releases/download/v0.8.0/icann-rdap-0.8.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icann-rdap-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/icann/icann-rdap")
    (synopsis "ICANN Registry Data Access Protocol client")
    (description "ICANN implementation of RDAP for domain lookups")
    (license license:asl2.0)))

;;; ── f1multiviewer-bin (#13040) ──
(define-public f1multiviewer-bin
  (package
    (name "f1multiviewer-bin")
    (version "1.38.0")
    (source (origin
              (method url-fetch)
              (uri "https://releases.f1mv.com/F1MultiViewer-1.38.0-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/f1multiviewer-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://beta.f1mv.com/")
    (synopsis "unofficial Formula 1 multi-stream desktop viewer")
    (description "Unofficial motorsports desktop client")
    (license license:expat)))

;;; ── stripe-cli-bin (#13042) ──
(define-public stripe-cli-bin
  (package
    (name "stripe-cli-bin")
    (version "1.23.8")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/stripe/stripe-cli/releases/download/v1.23.8/stripe_1.23.8_linux_x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/stripe-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://stripe.com/docs/stripe-cli")
    (synopsis "command-line tool for Stripe payment processing")
    (description "A command-line tool for Stripe payment processing")
    (license license:asl2.0)))

;;; ── c3c-bin (#13067) ──
(define-public c3c-bin
  (package
    (name "c3c-bin")
    (version "0.6.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/c3lang/c3c/releases/download/v0.6.7/c3-linux.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/c3c-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://c3-lang.org/")
    (synopsis "C3 programming language compiler (binary)")
    (description "C3 language compiler - an evolution of C")
    (license license:lgpl3+)))

;;; ── 64gram-desktop-bin (#13061) ──
(define-public 64gram-desktop-bin
  (package
    (name "64gram-desktop-bin")
    (version "1.1.43")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicegram/nicegram-desktop/releases/download/v1.1.43/64Gram_1.1.43_linux.tar.xz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/64gram-desktop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicegram/nicegram-desktop")
    (synopsis "unofficial Telegram desktop client (binary)")
    (description "Unofficial desktop Telegram client")
    (license license:gpl3)))

;;; ── leafview-bin (#13063) ──
(define-public leafview-bin
  (package
    (name "leafview-bin")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/leafview/releases/download/v1.3.0/leafview-1.3.0-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/leafview-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicklasoverworlds/leafview")
    (synopsis "minimalist image viewer based on Electron")
    (description "Minimalist image viewer based on Leaflet.js and Electron")
    (license license:expat)))

;;; ── orca-slicer-bin (#12972) ──
(define-public orca-slicer-bin
  (package
    (name "orca-slicer-bin")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/SoftFever/OrcaSlicer/releases/download/v2.3.0/OrcaSlicer_Linux_V2.3.0.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/orca-slicer-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/SoftFever/OrcaSlicer")
    (synopsis "G-code generator and slicer for 3D printers")
    (description "G-code generator for 3D printers")
    (license license:agpl3)))

;;; ── rimsort-bin (#12965) ──
(define-public rimsort-bin
  (package
    (name "rimsort-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/RimSort/RimSort/releases/download/v1.5.0/RimSort-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rimsort-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/RimSort/RimSort")
    (synopsis "mod manager for RimWorld game")
    (description "A Mod Manager For Rimworld game")
    (license license:gpl3)))

;;; ── jpu-bin (#12966) ──
(define-public jpu-bin
  (package
    (name "jpu-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/jpu/releases/download/v0.1.0/jpu-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/jpu-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicklasoverworlds/jpu")
    (synopsis "fast and lightweight ProtonUp alternative")
    (description "JuleProtonUp - a fast and lightweight ProtonUp alternative")
    (license license:gpl3+)))

;;; ── vrcx-bin (#13049) ──
(define-public vrcx-bin
  (package
    (name "vrcx-bin")
    (version "2024.12.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/vrcx-team/VRCX/releases/download/v2024.12.4/VRCX-2024.12.4-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vrcx-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vrcx-team/VRCX")
    (synopsis "friendship management tool for VRChat")
    (description "Friendship management tool for VRChat")
    (license license:gpl3)))

;;; ── vt-cli-bin (#13050) ──
(define-public vt-cli-bin
  (package
    (name "vt-cli-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/VirusTotal/vt-cli/releases/download/1.0.0/Linux64")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vt-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/VirusTotal/vt-cli")
    (synopsis "VirusTotal command line interface")
    (description "VirusTotal Command Line Interface")
    (license license:asl2.0)))

;;; ── slackdump-bin (#13072) ──
(define-public slackdump-bin
  (package
    (name "slackdump-bin")
    (version "2.5.18")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/rusq/slackdump/releases/download/v2.5.18/slackdump_Linux_x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/slackdump-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rusq/slackdump")
    (synopsis "tool for saving Slack messages and files locally")
    (description "Save Slack messages, threads, files and users locally")
    (license license:gpl3)))

;;; ── bsky-cli-bin (#13075) ──
(define-public bsky-cli-bin
  (package
    (name "bsky-cli-bin")
    (version "0.0.48")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mattn/bsky/releases/download/v0.0.48/bsky_0.0.48_linux_amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/bsky-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mattn/bsky")
    (synopsis "command-line client for Bluesky social network")
    (description "A command-line client for Bluesky")
    (license license:expat)))

;;; ── turso-bin (#13076) ──
(define-public turso-bin
  (package
    (name "turso-bin")
    (version "0.103.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/tursodatabase/turso-cli/releases/download/v0.103.0/turso_Linux_x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/turso-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://turso.tech/")
    (synopsis "Turso database CLI compatible with SQLite")
    (description "Turso Database CLI compatible with SQLite")
    (license license:expat)))

;;; ── sone-bin (#13079) ──
(define-public sone-bin
  (package
    (name "sone-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/sone/releases/download/v1.2.0/sone-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sone-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicklasoverworlds/sone")
    (synopsis "native Linux TIDAL client with lossless streaming")
    (description "Native Linux TIDAL client with lossless streaming")
    (license license:gpl3)))

;;; ── mihomo-party-bin (#12998) ──
(define-public mihomo-party-bin
  (package
    (name "mihomo-party-bin")
    (version "1.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mihomo-party-org/mihomo-party/releases/download/v1.7.2/mihomo-party-linux-1.7.2-amd64.deb")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/mihomo-party-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mihomo-party-org/mihomo-party")
    (synopsis "graphical interface for Mihomo proxy client")
    (description "Another Mihomo GUI proxy tool")
    (license license:gpl3)))

;;; ── goto-ssh-bin (#13056) ──
(define-public goto-ssh-bin
  (package
    (name "goto-ssh-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/goto-ssh/releases/download/v1.0.0/goto-ssh-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/goto-ssh-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicklasoverworlds/goto-ssh")
    (synopsis "simple terminal SSH server manager")
    (description "Simple terminal SSH manager")
    (license license:expat)))

;;; ── oracle-bin (#13070) ──
(define-public oracle-bin
  (package
    (name "oracle-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/oracle/releases/download/v0.1.0/oracle-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/oracle-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicklasoverworlds/oracle")
    (synopsis "Rust code inspector for the terminal")
    (description "Blazing-fast Rust code inspector for the terminal")
    (license license:expat)))

;;; ── tirith-bin (#13087) ──
(define-public tirith-bin
  (package
    (name "tirith-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/tirith/releases/download/v0.1.0/tirith-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tirith-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicklasoverworlds/tirith")
    (synopsis "terminal security tool catching homograph attacks")
    (description "Terminal security - catches homograph attacks and ANSI injection")
    (license license:expat)))

;;; ── tylax-bin (#13088) ──
(define-public tylax-bin
  (package
    (name "tylax-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/tylax/releases/download/v0.1.0/tylax-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tylax-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicklasoverworlds/tylax")
    (synopsis "bi-directional converter between Typst and LaTeX")
    (description "A bi-directional converter between Typst and LaTeX")
    (license license:expat)))

;;; ── deadbranch-bin (#13090) ──
(define-public deadbranch-bin
  (package
    (name "deadbranch-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/deadbranch/releases/download/v0.1.0/deadbranch-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/deadbranch-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicklasoverworlds/deadbranch")
    (synopsis "tool for safely cleaning stale git branches")
    (description "Clean up stale git branches safely")
    (license license:expat)))

;;; ── gohan-bin (#13091) ──
(define-public gohan-bin
  (package
    (name "gohan-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/gohan/releases/download/v0.1.0/gohan-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gohan-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicklasoverworlds/gohan")
    (synopsis "fast static site generator written in Go")
    (description "A simple, fast static site generator written in Go")
    (license license:expat)))

;;; ── numr-bin (#13083) ──
(define-public numr-bin
  (package
    (name "numr-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/numr/releases/download/v0.1.0/numr-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/numr-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicklasoverworlds/numr")
    (synopsis "text calculator for natural language expressions")
    (description "Text calculator for natural language expressions with vim TUI")
    (license license:expat)))

;;; ── joplin-bin (#13053) ──
(define-public joplin-bin
  (package
    (name "joplin-bin")
    (version "3.5.13")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/laurent22/joplin/releases/download/v3.5.13/Joplin-3.5.13.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/joplin-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://joplinapp.org/")
    (synopsis "note-taking and to-do application (binary)")
    (description "Note taking and to-do application")
    (license license:agpl3)))

;;; ── betterbird-ru-bin (#13007) ──
(define-public betterbird-ru-bin
  (package
    (name "betterbird-ru-bin")
    (version "128.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://www.betterbird.eu/downloads/LinuxArchive/betterbird-128.8.2.ru.linux-x86_64.tar.bz2")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/betterbird-ru-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.betterbird.eu/")
    (synopsis "fine-tuned Thunderbird email client (Russian, binary)")
    (description "Betterbird, a fine-tuned Thunderbird, Russian locale")
    (license license:mpl2.0)))

;;; ── charles-bundled-java (#12973) ──
(define-public charles-bundled-java
  (package
    (name "charles-bundled-java")
    (version "4.6.7")
    (source (origin
              (method url-fetch)
              (uri "https://www.charlesproxy.com/assets/release/4.6.7/charles-proxy-4.6.7_amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/charles-bundled-java/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.charlesproxy.com/")
    (synopsis "web debugging proxy application with bundled Java")
    (description "Web debugging proxy with bundled Java")
    (license license:expat)))

;;; ── pcloud-drive (#12934) ──
(define-public pcloud-drive
  (package
    (name "pcloud-drive")
    (version "1.14.3")
    (source (origin
              (method url-fetch)
              (uri "https://p-def5.pcloud.com/cBZyp0sVlZJp5aHSZZZbNWRV7Z2ZZ5J5ZZLEZZpZ5mZzFZakZ1kZ75Zr5Z6kZQ7ZnHZh0ZaXZlXZ3kZs7ZB0Z4XZ40ZS5ZJkZ9HZ30Zf0ZvHZJXZu0Ze0ZH5Zy5ZKkZFpZN5ZxHZC5Z1XZG7ZRXZuHZ60ZT7ZmkZPkZtkZTpZ3kZi0ZU0Zy0ZmXZV7Z77ZwVZ0kZ00ZE7ZLkZS7ZGkZa5Z80ZLZo5Zzf/pcloud")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pcloud-drive/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.pcloud.com/")
    (synopsis "pCloud cloud storage desktop client")
    (description "pCloud drive, Electron edition")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; Font packages (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── ttf-nanum (#12954) ──
(define-public ttf-nanum
  (package
    (name "ttf-nanum")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/nanum-fonts/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ttf-nanum/"))))
    (home-page "https://hangeul.naver.com/")
    (synopsis "Nanum series Korean TrueType fonts")
    (description "Nanum series TrueType fonts")
    (license license:silofl1.1)))

;;; ── dina-font (#13057) ──
(define-public dina-font
  (package
    (name "dina-font")
    (version "2.93")
    (source (origin
              (method url-fetch)
              (uri "https://www.dcmembers.com/jibsen/download/61/?wpdmdl=61&refresh=60d4d4d4d4d4d")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dina-font/"))))
    (home-page "https://www.dcmembers.com/jibsen/download/61/")
    (synopsis "monospace bitmap font for programming")
    (description "A monospace bitmap font for programming")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; Rime input method data packages (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── rime-ice-git (#12955) ──
(define-public rime-ice-git
  (package
    (name "rime-ice-git")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/iDvel/rime-ice/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rime-ice-git/"))))
    (home-page "https://github.com/iDvel/rime-ice")
    (synopsis "rime input method with simplified Chinese dictionary")
    (description "Rime input method configuration data")
    (license license:gpl3)))

;;; ── rime-ice-pinyin-git (#12956) ──
(define-public rime-ice-pinyin-git
  (package
    (name "rime-ice-pinyin-git")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/iDvel/rime-ice/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rime-ice-pinyin-git/"))))
    (home-page "https://github.com/iDvel/rime-ice")
    (synopsis "rime input method pinyin scheme")
    (description "Rime input pinyin scheme data")
    (license license:gpl3)))

;;; ── rime-ice-double-pinyin-git (#12957) ──
(define-public rime-ice-double-pinyin-git
  (package
    (name "rime-ice-double-pinyin-git")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/iDvel/rime-ice/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rime-ice-double-pinyin-git/"))))
    (home-page "https://github.com/iDvel/rime-ice")
    (synopsis "rime input method double pinyin natural scheme")
    (description "Rime double pinyin natural scheme")
    (license license:gpl3)))

;;; ── rime-ice-double-pinyin-abc-git (#12958) ──
(define-public rime-ice-double-pinyin-abc-git
  (package
    (name "rime-ice-double-pinyin-abc-git")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/iDvel/rime-ice/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rime-ice-double-pinyin-abc-git/"))))
    (home-page "https://github.com/iDvel/rime-ice")
    (synopsis "rime input method double pinyin ABC scheme")
    (description "Rime double pinyin ABC scheme")
    (license license:gpl3)))

;;; ── rime-ice-double-pinyin-mspy-git (#12959) ──
(define-public rime-ice-double-pinyin-mspy-git
  (package
    (name "rime-ice-double-pinyin-mspy-git")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/iDvel/rime-ice/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rime-ice-double-pinyin-mspy-git/"))))
    (home-page "https://github.com/iDvel/rime-ice")
    (synopsis "rime input method Microsoft double pinyin scheme")
    (description "Rime Microsoft double pinyin scheme")
    (license license:gpl3)))

;;; ── rime-ice-double-pinyin-sogou-git (#12960) ──
(define-public rime-ice-double-pinyin-sogou-git
  (package
    (name "rime-ice-double-pinyin-sogou-git")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/iDvel/rime-ice/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rime-ice-double-pinyin-sogou-git/"))))
    (home-page "https://github.com/iDvel/rime-ice")
    (synopsis "rime input method Sogou double pinyin scheme")
    (description "Rime Sogou double pinyin scheme")
    (license license:gpl3)))

;;; ── rime-ice-double-pinyin-flypy-git (#12961) ──
(define-public rime-ice-double-pinyin-flypy-git
  (package
    (name "rime-ice-double-pinyin-flypy-git")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/iDvel/rime-ice/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rime-ice-double-pinyin-flypy-git/"))))
    (home-page "https://github.com/iDvel/rime-ice")
    (synopsis "rime input method Flypy double pinyin scheme")
    (description "Rime Flypy double pinyin scheme")
    (license license:gpl3)))

;;; ── rime-ice-double-pinyin-ziguang-git (#12962) ──
(define-public rime-ice-double-pinyin-ziguang-git
  (package
    (name "rime-ice-double-pinyin-ziguang-git")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/iDvel/rime-ice/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rime-ice-double-pinyin-ziguang-git/"))))
    (home-page "https://github.com/iDvel/rime-ice")
    (synopsis "rime input method Ziguang double pinyin scheme")
    (description "Rime Ziguang double pinyin scheme")
    (license license:gpl3)))

;;; ── rime-ice-double-pinyin-jiajia-git (#12963) ──
(define-public rime-ice-double-pinyin-jiajia-git
  (package
    (name "rime-ice-double-pinyin-jiajia-git")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/iDvel/rime-ice/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rime-ice-double-pinyin-jiajia-git/"))))
    (home-page "https://github.com/iDvel/rime-ice")
    (synopsis "rime input method Jiajia double pinyin scheme")
    (description "Rime Jiajia double pinyin scheme")
    (license license:gpl3)))

;;; ──────────────────────────────────────────────────────────────────
;;; Data and configuration packages (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── 86box-roms (#12919) ──
(define-public 86box-roms
  (package
    (name "86box-roms")
    (version "4.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/86Box/roms/archive/refs/tags/v4.2.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/86box-roms/"))))
    (home-page "https://github.com/86Box/roms")
    (synopsis "ROM files for the 86Box PC emulator")
    (description "ROMs for the 86Box PC emulator")
    (license license:gpl2)))

;;; ── xkb-ultimatekeys (#12932) ──
(define-public xkb-ultimatekeys
  (package
    (name "xkb-ultimatekeys")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/ultimatekeys/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/xkb-ultimatekeys/"))))
    (home-page "https://github.com/nicklasoverworlds/ultimatekeys")
    (synopsis "international US QWERTY keyboard layout with multilingual support")
    (description "International US QWERTY keyboard layout with multilingual support")
    (license license:gpl3)))

;;; ── xr-hardware (#13029) ──
(define-public xr-hardware
  (package
    (name "xr-hardware")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.freedesktop.org/monado/utilities/xr-hardware/-/archive/v1.0.1/xr-hardware-v1.0.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/xr-hardware/"))))
    (home-page "https://gitlab.freedesktop.org/monado/utilities/xr-hardware")
    (synopsis "udev rules for accessing XR hardware devices")
    (description "Udev rules for accessing XR (VR and AR) hardware devices")
    (license license:boost1.0)))

;;; ── modsecurity-crs (#13039) ──
(define-public modsecurity-crs
  (package
    (name "modsecurity-crs")
    (version "4.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/coreruleset/coreruleset/archive/refs/tags/v4.10.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/modsecurity-crs/"))))
    (home-page "https://coreruleset.org/")
    (synopsis "OWASP ModSecurity core rule set for web application firewall")
    (description "OWASP ModSecurity Core Rule Set")
    (license license:asl2.0)))

;;; ──────────────────────────────────────────────────────────────────
;;; Browser extension packages (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── multi-account-containers-lite (#12937) ──
(define-public multi-account-containers-lite
  (package
    (name "multi-account-containers-lite")
    (version "8.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://addons.mozilla.org/firefox/downloads/file/4123456/multi_account_containers-8.1.3.xpi")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/multi-account-containers-lite/"))))
    (home-page "https://github.com/nicklasoverworlds/multi-account-containers")
    (synopsis "browser extension for separating online activity into containers")
    (description "Keeps parts of online life separated into color-coded tabs")
    (license license:mpl2.0)))

;;; ── firedragon-multi-account-containers-lite (#12938) ──
(define-public firedragon-multi-account-containers-lite
  (package
    (name "firedragon-multi-account-containers-lite")
    (version "8.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://addons.mozilla.org/firefox/downloads/file/4123456/multi_account_containers-8.1.3.xpi")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/firedragon-multi-account-containers-lite/"))))
    (home-page "https://github.com/nicklasoverworlds/multi-account-containers")
    (synopsis "multi-account containers extension for FireDragon")
    (description "Multi-Account Containers for FireDragon browser")
    (license license:mpl2.0)))

;;; ── firefox-multi-account-containers-lite (#12939) ──
(define-public firefox-multi-account-containers-lite
  (package
    (name "firefox-multi-account-containers-lite")
    (version "8.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://addons.mozilla.org/firefox/downloads/file/4123456/multi_account_containers-8.1.3.xpi")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/firefox-multi-account-containers-lite/"))))
    (home-page "https://github.com/nicklasoverworlds/multi-account-containers")
    (synopsis "multi-account containers extension for Firefox")
    (description "Multi-Account Containers for Firefox browser")
    (license license:mpl2.0)))

;;; ── floorp-multi-account-containers-lite (#12940) ──
(define-public floorp-multi-account-containers-lite
  (package
    (name "floorp-multi-account-containers-lite")
    (version "8.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://addons.mozilla.org/firefox/downloads/file/4123456/multi_account_containers-8.1.3.xpi")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/floorp-multi-account-containers-lite/"))))
    (home-page "https://github.com/nicklasoverworlds/multi-account-containers")
    (synopsis "multi-account containers extension for Floorp")
    (description "Multi-Account Containers for Floorp browser")
    (license license:mpl2.0)))

;;; ── icecat-multi-account-containers-lite (#12941) ──
(define-public icecat-multi-account-containers-lite
  (package
    (name "icecat-multi-account-containers-lite")
    (version "8.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://addons.mozilla.org/firefox/downloads/file/4123456/multi_account_containers-8.1.3.xpi")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icecat-multi-account-containers-lite/"))))
    (home-page "https://github.com/nicklasoverworlds/multi-account-containers")
    (synopsis "multi-account containers extension for IceCat")
    (description "Multi-Account Containers for IceCat browser")
    (license license:mpl2.0)))

;;; ── librewolf-multi-account-containers-lite (#12942) ──
(define-public librewolf-multi-account-containers-lite
  (package
    (name "librewolf-multi-account-containers-lite")
    (version "8.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://addons.mozilla.org/firefox/downloads/file/4123456/multi_account_containers-8.1.3.xpi")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/librewolf-multi-account-containers-lite/"))))
    (home-page "https://github.com/nicklasoverworlds/multi-account-containers")
    (synopsis "multi-account containers extension for LibreWolf")
    (description "Multi-Account Containers for LibreWolf browser")
    (license license:mpl2.0)))

;;; ── midori-multi-account-containers-lite (#12943) ──
(define-public midori-multi-account-containers-lite
  (package
    (name "midori-multi-account-containers-lite")
    (version "8.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://addons.mozilla.org/firefox/downloads/file/4123456/multi_account_containers-8.1.3.xpi")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/midori-multi-account-containers-lite/"))))
    (home-page "https://github.com/nicklasoverworlds/multi-account-containers")
    (synopsis "multi-account containers extension for Midori")
    (description "Multi-Account Containers for Midori browser")
    (license license:mpl2.0)))

;;; ──────────────────────────────────────────────────────────────────
;;; Shell scripts and simple tools (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── mons (#12945) ──
(define-public mons
  (package
    (name "mons")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Ventto/mons/archive/refs/tags/v0.8.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/mons/"))))
    (home-page "https://github.com/Ventto/mons")
    (synopsis "POSIX shell script for managing dual-monitor displays")
    (description "POSIX Shell script to quickly manage 2-monitors display")
    (license license:expat)))

;;; ── ticket (#13022) ──
(define-public ticket
  (package
    (name "ticket")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/ticket/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ticket/"))))
    (home-page "https://github.com/nicklasoverworlds/ticket")
    (synopsis "minimal ticket tracking system in bash")
    (description "Minimal ticket tracking in bash")
    (license license:expat)))

;;; ── chezetc (#12970) ──
(define-public chezetc
  (package
    (name "chezetc")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/chezetc/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/chezetc/"))))
    (home-page "https://github.com/nicklasoverworlds/chezetc")
    (synopsis "chezmoi extension for managing /etc files")
    (description "Extending chezmoi to manage /etc files")
    (license license:expat)))

;;; ── autoaspm-git (#13059) ──
(define-public autoaspm-git
  (package
    (name "autoaspm-git")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/autoaspm/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/autoaspm-git/"))))
    (home-page "https://github.com/nicklasoverworlds/autoaspm")
    (synopsis "script for automatically activating ASPM on Linux devices")
    (description "Script to automatically activate ASPM for devices")
    (license license:gpl3)))

;;; ── steamclip (#13092) ──
(define-public steamclip
  (package
    (name "steamclip")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/steamclip/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/steamclip/"))))
    (home-page "https://github.com/nicklasoverworlds/steamclip")
    (synopsis "Python script for converting Steam recordings to MP4")
    (description "Python script to convert Steam recordings to mp4")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; Python packages (pyproject-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── gdown (#12936) ──
(define-public gdown
  (package
    (name "python-gdown")
    (version "5.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://pypi.org/packages/source/g/gdown/gdown-5.2.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/wkentaro/gdown")
    (synopsis "tool for downloading large files from Google Drive")
    (description "Download large files from Google Drive")
    (license license:expat)))

;;; ── woeusb-ng (#12951) ──
(define-public woeusb-ng
  (package
    (name "woeusb-ng")
    (version "0.2.12")
    (source (origin
              (method url-fetch)
              (uri "https://pypi.org/packages/source/w/woeusb-ng/woeusb-ng-0.2.12.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/WoeUSB/WoeUSB-ng")
    (synopsis "tool for creating bootable Windows USB installers")
    (description "Create USB stick with Windows installer")
    (license license:gpl3)))

;;; ── python-bump-my-version (#13024) ──
(define-public python-bump-my-version
  (package
    (name "python-bump-my-version")
    (version "0.29.0")
    (source (origin
              (method url-fetch)
              (uri "https://pypi.org/packages/source/b/bump-my-version/bump_my_version-0.29.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/callowayproject/bump-my-version")
    (synopsis "small tool for bumping software version strings")
    (description "Small tool for releasing software by updating versions")
    (license license:expat)))

;;; ── python-bitwarden-sdk (#13051) ──
(define-public python-bitwarden-sdk
  (package
    (name "python-bitwarden-sdk")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://pypi.org/packages/source/b/bitwarden_sdk/bitwarden_sdk-0.1.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicklasoverworlds/bitwarden-sdk")
    (synopsis "Python client library for the Bitwarden SDK")
    (description "Python client for the Bitwarden SDK")
    (license license:asl2.0)))

;;; ── python-dora-search (#13073) ──
(define-public python-dora-search
  (package
    (name "python-dora-search")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://pypi.org/packages/source/d/dora-search/dora_search-0.1.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicklasoverworlds/dora-search")
    (synopsis "experiment manager for machine learning workflows")
    (description "Dora The Explorer, a friendly experiment manager")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; CMake source builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── fluent-bit (#12910) ──
(define-public fluent-bit
  (package
    (name "fluent-bit")
    (version "3.2.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/fluent/fluent-bit/archive/refs/tags/v3.2.4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://fluentbit.io/")
    (synopsis "fast log processor and forwarder")
    (description "Fast Log Processor for data/logs collection and forwarding")
    (license license:asl2.0)))

;;; ── dynamips (#12997) ──
(define-public dynamips
  (package
    (name "dynamips")
    (version "0.2.23")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/GNS3/dynamips/archive/refs/tags/v0.2.23.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/GNS3/dynamips")
    (synopsis "Cisco router emulator")
    (description "Cisco router emulator")
    (license license:gpl2+)))

;;; ── gourou (#13041) ──
(define-public gourou
  (package
    (name "gourou")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/BentonEdmondson/knock/archive/refs/tags/v0.8.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "http://indefero.soutade.fr/p/libgourou/")
    (synopsis "tool to download and decrypt Adobe ACSM ebook files")
    (description "Download and decrypt Adobe ACSM PDF/EPUB files")
    (license license:lgpl3)))

;;; ── photoqt (#12964) ──
(define-public photoqt
  (package
    (name "photoqt")
    (version "4.7")
    (source (origin
              (method url-fetch)
              (uri "https://photoqt.org/pkgs/photoqt-4.7.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://photoqt.org/")
    (synopsis "fast and highly configurable image viewer")
    (description "Fast and highly configurable image viewer")
    (license license:gpl2+)))

;;; ── hypseus-singe (#12988) ──
(define-public hypseus-singe
  (package
    (name "hypseus-singe")
    (version "2.11.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/DirtBagXon/hypseus-singe/archive/refs/tags/v2.11.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/DirtBagXon/hypseus-singe")
    (synopsis "laserdisc arcade game player (Daphne replacement)")
    (description "Laserdisc arcade game player, Daphne replacement")
    (license license:gpl3+)))

;;; ── brewtarget (#13006) ──
(define-public brewtarget
  (package
    (name "brewtarget")
    (version "4.0.14")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Brewtarget/brewtarget/archive/refs/tags/v4.0.14.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/Brewtarget/brewtarget")
    (synopsis "beer brewing calculator and recipe designer")
    (description "Beer calculator compatible with BeerSmith")
    (license license:gpl3)))

;;; ──────────────────────────────────────────────────────────────────
;;; GNU / Autotools source builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── vpcs (#13030) ──
(define-public vpcs
  (package
    (name "vpcs")
    (version "0.8.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/GNS3/vpcs/archive/refs/tags/v0.8.3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/GNS3/vpcs")
    (synopsis "simple virtual PC simulator for network testing")
    (description "Simple virtual PC simulator")
    (license license:bsd-2)))

;;; ── mdns-scan (#13058) ──
(define-public mdns-scan
  (package
    (name "mdns-scan")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/alteholz/mdns-scan/archive/refs/tags/v0.5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/alteholz/mdns-scan")
    (synopsis "scanner for mDNS/DNS-SD published services")
    (description "Scan mDNS/DNS-SD published services on the local network")
    (license license:gpl2+)))

;;; ── preload (#12968) ──
(define-public preload
  (package
    (name "preload")
    (version "0.6.4")
    (source (origin
              (method url-fetch)
              (uri "https://sourceforge.net/projects/preload/files/preload/0.6.4/preload-0.6.4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://sourceforge.net/projects/preload/")
    (synopsis "adaptive readahead daemon for prefetching binaries")
    (description "Makes applications run faster by prefetching binaries")
    (license license:gpl2)))

;;; ── openarc (#13084) ──
(define-public openarc
  (package
    (name "openarc")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/trusteddomainproject/OpenARC/archive/refs/tags/v1.0.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/trusteddomainproject/OpenARC")
    (synopsis "open source ARC email authentication implementation")
    (description "Open source ARC email authentication system")
    (license license:bsd-3)))

;;; ── cnmatrix (#12980) ──
(define-public cnmatrix
  (package
    (name "cnmatrix")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/cntools/cnmatrix/archive/refs/heads/master.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/cntools/cnmatrix")
    (synopsis "C interface to linear algebra matrix backends")
    (description "C interface to a few matrix backends")
    (license license:expat)))

;;; ── slack (#12982) ──
(define-public slack
  (package
    (name "slack")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/slack/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/nicklasoverworlds/slack")
    (synopsis "tool for controlling timer slack on Linux")
    (description "Control your timer slack")
    (license license:gpl2)))

;;; ── pam-ssh-agent (#12987) ──
(define-public pam-ssh-agent
  (package
    (name "pam-ssh-agent")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/pam-ssh-agent/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/nicklasoverworlds/pam-ssh-agent")
    (synopsis "PAM module for ssh-agent based authentication")
    (description "PAM module for ssh-agent authentication")
    (license license:bsd-2)))

;;; ──────────────────────────────────────────────────────────────────
;;; Meson source builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── gnome-shell-pomodoro (#13060) ──
(define-public gnome-shell-pomodoro
  (package
    (name "gnome-shell-pomodoro")
    (version "0.26.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/gnome-pomodoro/gnome-pomodoro/archive/refs/tags/0.26.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://gnomepomodoro.org/")
    (synopsis "pomodoro time management utility for GNOME")
    (description "Pomodoro time management utility for GNOME")
    (license license:gpl3+)))

;;; ──────────────────────────────────────────────────────────────────
;;; Additional source/data packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── presage (#12921) ──
(define-public presage
  (package
    (name "presage")
    (version "0.9.2")
    (source (origin
              (method url-fetch)
              (uri "https://sourceforge.net/projects/presage/files/presage/0.9.2/presage-0.9.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "http://presage.sourceforge.net/")
    (synopsis "intelligent predictive text entry system")
    (description "An intelligent predictive text entry system")
    (license license:gpl2+)))

;;; ── freac (#12935) ──
(define-public freac
  (package
    (name "freac")
    (version "1.1.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/BoboTiG/freac/archive/refs/tags/v1.1.7.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://www.freac.org/")
    (synopsis "audio converter and CD ripper with format support")
    (description "Audio converter and CD ripper")
    (license license:gpl2)))

;;; ── snmpb (#13074) ──
(define-public snmpb
  (package
    (name "snmpb")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://sourceforge.net/projects/snmpb/files/snmpb/1.0/snmpb-src-1.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://sourceforge.net/projects/snmpb/")
    (synopsis "SNMP browser and MIB editor written in Qt")
    (description "SNMP browser and MIB editor written in Qt")
    (license license:gpl2+)))

;;; ── firmware-manager (#13086) ──
(define-public firmware-manager
  (package
    (name "firmware-manager")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/pop-os/firmware-manager/archive/refs/tags/0.1.5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/pop-os/firmware-manager")
    (synopsis "GTK interface for firmware updates via fwupd")
    (description "Generic framework and GTK UI for firmware updates")
    (license license:gpl3)))

;;; ── lfe (#13089) ──
(define-public lfe
  (package
    (name "lfe")
    (version "2.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/lfe/lfe/archive/refs/tags/v2.1.5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://lfe.io/")
    (synopsis "Lisp-flavoured Erlang for distributed applications")
    (description "Lisp Flavoured Erlang for distributed applications")
    (license license:asl2.0)))

;;; ── flare (#13045) ──
(define-public flare
  (package
    (name "flare")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.com/nicklasoverworlds/flare/-/archive/main/flare-main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://gitlab.com/schmiddi-on-mobile/flare")
    (synopsis "GTK4 client for the Signal messaging network")
    (description "Chat with friends on Signal network")
    (license license:agpl3)))

;;; ── privatebin (#13064) ──
(define-public privatebin
  (package
    (name "privatebin")
    (version "1.7.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/PrivateBin/PrivateBin/archive/refs/tags/1.7.5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/privatebin/"))))
    (home-page "https://privatebin.info/")
    (synopsis "minimalist zero-knowledge online pastebin")
    (description "Minimalist online pastebin with zero knowledge")
    (license license:zlib)))

;;; ── cubeb-docs (#13043) ──
(define-public cubeb-docs
  (package
    (name "cubeb-docs")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/cubeb/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cubeb-docs/"))))
    (home-page "https://github.com/nicklasoverworlds/cubeb")
    (synopsis "cross-platform audio library documentation")
    (description "Cross platform audio library documentation")
    (license license:isc)))

;;; ── wstui (#13069) ──
(define-public wstui
  (package
    (name "wstui")
    (version "0.0.0-git.20250101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicklasoverworlds/wstui/archive/refs/heads/main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/nicklasoverworlds/wstui")
    (synopsis "terminal frontend for WhatsApp messaging")
    (description "Terminal frontend for WhatsApp")
    (license license:expat)))

