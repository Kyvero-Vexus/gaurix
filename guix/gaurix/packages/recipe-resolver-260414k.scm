;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414k
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 7 recipes created (copy-build-system, binary packages)
;;;   - 23 marked NEEDS_RECIPE_DESIGN_EXHAUSTED with specific reasons
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260414k)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (mihomo-alpha-bin
            local-ai-bin
            livebook-bin
            video2x-bin
            pandora-launcher-bin
            alcom-bin
            polymc-bin))

;;;
;;; --- 1. mihomo-alpha-bin (copy-build-system, pre-built Go binary) ---
;;; Mihomo (formerly Clash.Meta) network proxy kernel by MetaCubeX.
;;; Pure Go binary, gzipped single executable.
;;;

(define-public mihomo-alpha-bin
  (package
    (name "mihomo-alpha-bin")
    (version "1.19.23")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MetaCubeX/mihomo/releases/download/v"
                    version "/mihomo-linux-amd64-v" version ".gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "mihomo" "bin/mihomo"))))
    (synopsis "rule-based network proxy kernel (Clash.Meta)")
    (description "Mihomo is a rule-based network tunnel proxy kernel,
formerly known as Clash.Meta.  It supports protocols including
Shadowsocks, VMess, Trojan, VLESS, WireGuard, and Hysteria with
advanced routing rules and DNS resolution.")
    (home-page "https://github.com/MetaCubeX/mihomo")
    (license license:expat)))

;;;
;;; --- 2. local-ai-bin (copy-build-system, pre-built static binary) ---
;;; LocalAI: self-hosted OpenAI-compatible API server.
;;; Static Linux binary, no external runtime deps.
;;;

(define-public local-ai-bin
  (package
    (name "local-ai-bin")
    (version "4.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mudler/LocalAI/releases/download/v"
                    version "/local-ai-v" version "-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "local-ai" "bin/local-ai"))))
    (synopsis "self-hosted OpenAI-compatible AI API server")
    (description "LocalAI is a free, open source alternative to OpenAI.
It provides a self-hosted, community-driven, local-first API server
compatible with the OpenAI API specification.  It supports LLMs,
image generation, audio transcription, and embedding generation
without requiring a GPU.")
    (home-page "https://localai.io")
    (license license:expat)))

;;;
;;; --- 3. livebook-bin (copy-build-system, AppImage) ---
;;; Livebook: interactive Elixir notebooks for data and code workflows.
;;;

(define-public livebook-bin
  (package
    (name "livebook-bin")
    (version "0.19.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/livebook-dev/livebook/releases/download/v"
                    version "/Livebook-linux-amd64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "livebook" "bin/livebook"))))
    (synopsis "interactive Elixir notebooks for code and data workflows")
    (description "Livebook is an interactive notebook application for
the Elixir programming language.  It enables collaborative coding,
data exploration, and workflow automation with rich output support
including charts, tables, and interactive widgets.")
    (home-page "https://livebook.dev")
    (license license:asl2.0)))

;;;
;;; --- 4. video2x-bin (copy-build-system, AppImage) ---
;;; Video2X: ML-based video super resolution and frame interpolation.
;;;

(define-public video2x-bin
  (package
    (name "video2x-bin")
    (version "6.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/k4yt3x/video2x/releases/download/"
                    version "/Video2X-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "video2x" "bin/video2x"))))
    (synopsis "machine learning video upscaling and frame interpolation")
    (description "Video2X is a video super-resolution and frame
interpolation framework powered by machine learning.  It supports
multiple upscaling engines including RealESRGAN, Anime4K, and RIFE
for increasing video resolution and generating intermediate frames.")
    (home-page "https://github.com/k4yt3x/video2x")
    (license license:isc)))

;;;
;;; --- 5. pandora-launcher-bin (copy-build-system, AppImage) ---
;;; PandoraLauncher: modern Minecraft launcher with instance management.
;;;

(define-public pandora-launcher-bin
  (package
    (name "pandora-launcher-bin")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Moulberry/PandoraLauncher/releases/download/v"
                    version "/PandoraLauncher-Linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "pandora-launcher" "bin/pandora-launcher"))))
    (synopsis "modern Minecraft launcher with instance management")
    (description "Pandora Launcher is a modern Minecraft launcher that
provides powerful instance management features.  It supports multiple
Minecraft versions, modpacks, and mod loaders with an intuitive
user interface.")
    (home-page "https://github.com/Moulberry/PandoraLauncher")
    (license license:expat)))

;;;
;;; --- 6. alcom-bin (copy-build-system, AppImage) ---
;;; ALCOM: VRChat Creator Companion alternative for managing VRChat projects.
;;;

(define-public alcom-bin
  (package
    (name "alcom-bin")
    (version "1.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vrc-get/vrc-get/releases/download/gui-v"
                    version "/alcom-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "alcom" "bin/alcom"))))
    (synopsis "open-source VRChat Creator Companion alternative")
    (description "ALCOM is a fast, open-source alternative to the
VRChat Creator Companion (VCC).  It manages VRChat avatar and world
projects, handles package dependencies, and provides a streamlined
workflow for VRChat content creation.")
    (home-page "https://github.com/vrc-get/vrc-get")
    (license license:expat)))

;;;
;;; --- 7. polymc-bin (copy-build-system, AppImage) ---
;;; PolyMC: open-source Minecraft launcher with multi-instance support.
;;;

(define-public polymc-bin
  (package
    (name "polymc-bin")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/PolyMC/PolyMC/releases/download/"
                    version "/PolyMC-Linux-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "polymc" "bin/polymc"))))
    (synopsis "open-source Minecraft launcher with instance management")
    (description "PolyMC is an open-source Minecraft launcher focused on
predictability, long-term stability, and providing users the ability
to manage their Minecraft installations.  It supports multiple
instances, mod loaders, and resource packs.")
    (home-page "https://polymc.org")
    (license license:gpl3+)))
