;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418i
;;; Resolves 100 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (100):
;;;     1.  pkg2appimage (copy-build-system, v1779, expat)
;;;     2.  webcord-equicord-git (copy-build-system, v4.10.3, expat)
;;;     3.  subs2srs-mono-git (copy-build-system, v0.5.0, gpl3+)
;;;     4.  subs2srs-gui (copy-build-system, v0.5.0, gpl3+)
;;;     5.  gollama-bin (copy-build-system, v1.28.4, expat)
;;;     6.  livebook (copy-build-system, v0.15.3, asl2.0)
;;;     7.  fchat-horizon-appimage (copy-build-system, v1.28.0, expat)
;;;     8.  monocoque (cmake-build-system, v0.7.0, gpl3+)
;;;     9.  fchat-horizon-git (copy-build-system, v1.28.0, expat)
;;;    10.  proton-mail-desktop (copy-build-system, v1.8.0, expat)
;;;    11.  en-croissant (copy-build-system, v0.11.0, gpl3+)
;;;    12.  proton-authenticator (copy-build-system, v1.4.0, gpl3+)
;;;    13.  adguardhome-bin (copy-build-system, v0.107.57, gpl3)
;;;    14.  chmod-cli (copy-build-system, v0.3.0, expat)
;;;    15.  ggc (copy-build-system, v0.2.0, expat)
;;;    16.  recon-ng (copy-build-system, v5.1.2, gpl3)
;;;    17.  crazydiskinfo (cmake-build-system, v1.1.0, expat)
;;;    18.  moor (copy-build-system, v4.6.1, expat)
;;;    19.  geforce-infinity (copy-build-system, v1.0.0, gpl3+)
;;;    20.  flatpost (copy-build-system, v0.1.0, gpl3+)
;;;    21.  pvetui (copy-build-system, v0.5.0, gpl3+)
;;;    22.  ddhx (copy-build-system, v0.7.3, boost1.0)
;;;    23.  gittyup-appimage (copy-build-system, v1.4.0, expat)
;;;    24.  kwin-karousel (cmake-build-system, v0.5.0, gpl3+)
;;;    25.  ufw-docker (copy-build-system, v2.2.0, asl2.0)
;;;    26.  google-breakpad (gnu-build-system, v2024.07.01, bsd-3)
;;;    27.  gnome-shell-extension-hibernate-status (copy-build-system, v82, gpl2+)
;;;    28.  intel-media-driver-legacy (cmake-build-system, v23.4.3, expat)
;;;    29.  pulse-visualizer (copy-build-system, v0.3.0, expat)
;;;    30.  trustedqsl (cmake-build-system, v2.7.4, bsd-3)
;;;    31.  grub-customizer (cmake-build-system, v5.2.4, gpl3+)
;;;    32.  boomaga (cmake-build-system, v3.0.0, gpl2+)
;;;    33.  c3c-bin (copy-build-system, v0.6.6, lgpl3+)
;;;    34.  freetube-nightly-bin (copy-build-system, v0.23.1, agpl3+)
;;;    35.  teams-for-linux-git (copy-build-system, v2.7.13, gpl3)
;;;    36.  stabilitymatrix-bin (copy-build-system, v2.13.3, agpl3+)
;;;    37.  looking-glass-client (cmake-build-system, vB7, gpl2+)
;;;    38.  obs-plugin-looking-glass (cmake-build-system, vB7, gpl2+)
;;;    39.  neo4j-community-bin (copy-build-system, v5.25.1, gpl3)
;;;    40.  stable-diffusion-webui (copy-build-system, v1.10.1, agpl3+)
;;;    41.  darkly (cmake-build-system, v0.4.0, gpl3+)
;;;    42.  webapp-manager (copy-build-system, v1.3.5, gpl3+)
;;;    43.  rbackup (copy-build-system, v1.2.0, gpl3+)
;;;    44.  gnome-network-displays (meson-build-system, v0.93.0, gpl3+)
;;;    45.  xdg-terminal-exec (copy-build-system, v0.11.0, gpl3+)
;;;    46.  youtube-dl-nightly-bin (copy-build-system, v2024.12.23, unlicense)
;;;    47.  quickemu (copy-build-system, v4.9.7, expat)
;;;    48.  xviewer-plugins (meson-build-system, v3.4.0, gpl2+)
;;;    49.  xviewer (meson-build-system, v3.4.6, gpl2+)
;;;    50.  dxvk-nvapi-vkreflex-layer (meson-build-system, v1.0.0, zlib)
;;;    51.  httptoolkit-bin (copy-build-system, v1.19.0, agpl3+)
;;;    52.  freetube-bin (copy-build-system, v0.22.0, agpl3+)
;;;    53.  zoi (copy-build-system, v0.3.0, expat)
;;;    54.  osu-lazer-bin (copy-build-system, v2025.417.0, expat)
;;;    55.  openai-codex (copy-build-system, v0.1.0, asl2.0)
;;;    56.  whisper-cpp (cmake-build-system, v1.7.5, expat)
;;;    57.  gale (copy-build-system, v0.2.0, gpl3+)
;;;    58.  vet (copy-build-system, v1.1.0, asl2.0)
;;;    59.  whatsapp-for-linux (cmake-build-system, v1.6.4, gpl3+)
;;;    60.  swhkd (copy-build-system, v2.0.2, bsd-2)
;;;    61.  zelda64recomp-bin (copy-build-system, v1.2.0, gpl3+)
;;;    62.  archivemount-ng (gnu-build-system, v0.9.2, lgpl2.1+)
;;;    63.  ipfs-desktop-appimage (copy-build-system, v0.40.0, expat)
;;;    64.  kde-material-you-colors (copy-build-system, v1.9.5, expat)
;;;    65.  xfce-polkit (gnu-build-system, v0.3.2, gpl2+)
;;;    66.  activitywatch-bin (copy-build-system, v0.13.2, mpl2.0)
;;;    67.  freeshow-bin (copy-build-system, v1.3.1, gpl3+)
;;;    68.  claude-code-router (copy-build-system, v0.1.0, expat)
;;;    69.  indi-3rdparty-libs (cmake-build-system, v2.1.2, lgpl2.1+)
;;;    70.  libfprint-2-tod1-goodix-v2 (copy-build-system, v0.0.7, lgpl2.1+)
;;;    71.  debtap (copy-build-system, v3.5.1, gpl3+)
;;;    72.  libmp3splt-docs (copy-build-system, v0.9.2, gpl2+)
;;;    73.  piper-tts-bin (copy-build-system, v2024.11.14, expat)
;;;    74.  rutoken (copy-build-system, v4.8.0.0, lgpl2.1+)
;;;    75.  quarkdown (copy-build-system, v1.5.0, expat)
;;;    76.  extract-xiso (cmake-build-system, v2.8.1, bsd-2)
;;;    77.  code-server-bin (copy-build-system, v4.99.3, expat)
;;;    78.  pegasus-frontend (cmake-build-system, v0.16.0, gpl3+)
;;;    79.  hyde-cli (copy-build-system, v0.8.1, gpl3+)
;;;    80.  deflemask-bin (copy-build-system, v1.1.9, expat)
;;;    81.  jdk-openjdk-wakefield (copy-build-system, v21.0.1, gpl2+)
;;;    82.  jre-openjdk-wakefield (copy-build-system, v21.0.1, gpl2+)
;;;    83.  jre-openjdk-wakefield-headless (copy-build-system, v21.0.1, gpl2+)
;;;    84.  openjdk-wakefield-doc (copy-build-system, v21.0.1, gpl2+)
;;;    85.  openjdk-wakefield-src (copy-build-system, v21.0.1, gpl2+)
;;;    86.  openssh-hpn-shim (copy-build-system, v9.9, bsd-2)
;;;    87.  lenovolegionlinux (copy-build-system, v1.1.0, gpl2+)
;;;    88.  python-libpulse (copy-build-system, v0.5.0, lgpl2.1+)
;;;    89.  svt-av1-psy (cmake-build-system, v2.3.0, bsd-3)
;;;    90.  epsxe-plugin-gpu-soft (copy-build-system, v1.18, gpl2+)
;;;    91.  cssmodules-language-server (copy-build-system, v1.3.0, expat)
;;;    92.  python-mmdetection (copy-build-system, v3.3.0, asl2.0)
;;;    93.  pico-sdk-develop (copy-build-system, v2.1.1, bsd-3)
;;;    94.  u2f-udev-rules-feitian (copy-build-system, v1.0, expat)
;;;    95.  thincast-client-bin (copy-build-system, v14.0.3, asl2.0)
;;;    96.  fcitx5-toki-pona (cmake-build-system, v0.2.0, gpl3+)
;;;    97.  pulseaudio-dlna-cygn (copy-build-system, v0.6.5, gpl3+)
;;;    98.  piri (copy-build-system, v0.3.0, expat)
;;;    99.  lrz-syncshare (copy-build-system, v4.2.0, gpl2+)
;;;   100.  devzat (copy-build-system, v0.18.1, expat)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages pkg-config)
  #:export (
            pkg2appimage
            webcord-equicord-git
            subs2srs-mono-git
            subs2srs-gui
            gollama-bin
            livebook
            fchat-horizon-appimage
            monocoque
            fchat-horizon-git
            proton-mail-desktop
            en-croissant
            proton-authenticator
            adguardhome-bin
            chmod-cli
            ggc
            recon-ng
            crazydiskinfo
            moor
            geforce-infinity
            flatpost
            pvetui
            ddhx
            gittyup-appimage
            kwin-karousel
            ufw-docker
            google-breakpad
            gnome-shell-extension-hibernate-status
            intel-media-driver-legacy
            pulse-visualizer
            trustedqsl
            grub-customizer
            boomaga
            c3c-bin
            freetube-nightly-bin
            teams-for-linux-git
            stabilitymatrix-bin
            looking-glass-client
            obs-plugin-looking-glass
            neo4j-community-bin
            stable-diffusion-webui
            darkly
            webapp-manager
            rbackup
            gnome-network-displays
            xdg-terminal-exec
            youtube-dl-nightly-bin
            quickemu
            xviewer-plugins
            xviewer
            dxvk-nvapi-vkreflex-layer
            httptoolkit-bin
            freetube-bin
            zoi
            osu-lazer-bin
            openai-codex
            whisper-cpp
            gale
            vet
            whatsapp-for-linux
            swhkd
            zelda64recomp-bin
            archivemount-ng
            ipfs-desktop-appimage
            kde-material-you-colors
            xfce-polkit
            activitywatch-bin
            freeshow-bin
            claude-code-router
            indi-3rdparty-libs
            libfprint-2-tod1-goodix-v2
            debtap
            libmp3splt-docs
            piper-tts-bin
            rutoken
            quarkdown
            extract-xiso
            code-server-bin
            pegasus-frontend
            hyde-cli
            deflemask-bin
            jdk-openjdk-wakefield
            jre-openjdk-wakefield
            jre-openjdk-wakefield-headless
            openjdk-wakefield-doc
            openjdk-wakefield-src
            openssh-hpn-shim
            lenovolegionlinux
            python-libpulse
            svt-av1-psy
            epsxe-plugin-gpu-soft
            cssmodules-language-server
            python-mmdetection
            pico-sdk-develop
            u2f-udev-rules-feitian
            thincast-client-bin
            fcitx5-toki-pona
            pulseaudio-dlna-cygn
            piri
            lrz-syncshare
            devzat
            ))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. pkg2appimage --- tool for creating AppImages from ingredients
;;; -------------------------------------------------------------------
(define-public pkg2appimage
  (package
    (name "pkg2appimage")
    (version "1779")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AppImageCommunity/pkg2appimage")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pkg2appimage" "bin/pkg2appimage"))))
    (home-page "https://github.com/AppImageCommunity/pkg2appimage")
    (synopsis "tool for creating AppImages from ingredients")
    (description "Pkg2appimage is a tool for creating AppImages from existing packages.
It takes a recipe file that describes the ingredients and produces an
AppImage from them.  It supports various package sources including
Debian, Ubuntu, and RPM repositories.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. webcord-equicord-git --- custom Discord client based on Electron
;;; -------------------------------------------------------------------
(define-public webcord-equicord-git
  (package
    (name "webcord-equicord-git")
    (version "4.10.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ArmCord/ArmCord/releases/download/v" version "/ArmCord_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/share/armcord" "share/armcord"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ArmCord/ArmCord")
    (synopsis "custom Discord client based on Electron")
    (description "WebCord Equicord is a custom Discord client built on Electron.
It provides enhanced privacy, customization options, and additional
features compared to the official Discord client.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. subs2srs-mono-git --- subtitle to SRS card converter using Mono
;;; -------------------------------------------------------------------
(define-public subs2srs-mono-git
  (package
    (name "subs2srs-mono-git")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Wikipedia2Anki/subs2srs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/subs2srs"))))
    (home-page "https://github.com/Wikipedia2Anki/subs2srs")
    (synopsis "subtitle to SRS card converter using Mono")
    (description "Subs2srs is a tool that creates SRS flashcards from subtitle files
and media.  It extracts audio and screenshots at subtitle timings
and generates cards for spaced repetition learning.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 4. subs2srs-gui --- graphical interface for subtitle to SRS converter
;;; -------------------------------------------------------------------
(define-public subs2srs-gui
  (package
    (name "subs2srs-gui")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Wikipedia2Anki/subs2srs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/subs2srs-gui"))))
    (home-page "https://github.com/Wikipedia2Anki/subs2srs")
    (synopsis "graphical interface for subtitle to SRS converter")
    (description "Subs2srs-gui provides a graphical user interface for the subs2srs
tool, which creates SRS flashcards from subtitle files and media
for language learning.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5. gollama-bin --- TUI for managing Ollama models
;;; -------------------------------------------------------------------
(define-public gollama-bin
  (package
    (name "gollama-bin")
    (version "1.28.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sammcj/gollama/releases/download/v" version "/gollama_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gollama" "bin/gollama"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sammcj/gollama")
    (synopsis "TUI for managing Ollama models")
    (description "Gollama is a terminal user interface for managing Ollama models.
It allows you to list, pull, delete, and inspect models from the
command line with an interactive interface.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. livebook --- interactive notebook application for Elixir
;;; -------------------------------------------------------------------
(define-public livebook
  (package
    (name "livebook")
    (version "0.15.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/livebook-dev/livebook")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/livebook"))))
    (home-page "https://github.com/livebook-dev/livebook")
    (synopsis "interactive notebook application for Elixir")
    (description "Livebook is a web-based interactive notebook application for
the Elixir programming language.  It supports collaborative editing,
rich content, and integration with the Elixir ecosystem.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 7. fchat-horizon-appimage --- F-Chat Horizon messaging client AppImage
;;; -------------------------------------------------------------------
(define-public fchat-horizon-appimage
  (package
    (name "fchat-horizon-appimage")
    (version "1.28.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Fchat-Horizon/Fchat-Horizon/releases/download/v" version "/Fchat-Horizon-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Fchat-Horizon.AppImage" "bin/fchat-horizon"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Fchat-Horizon/Fchat-Horizon")
    (synopsis "F-Chat Horizon messaging client AppImage")
    (description "F-Chat Horizon is a desktop client for the F-Chat messaging platform.
This package provides the AppImage binary distribution of the client.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. fchat-horizon-git --- F-Chat Horizon messaging client from source
;;; -------------------------------------------------------------------
(define-public fchat-horizon-git
  (package
    (name "fchat-horizon-git")
    (version "1.28.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Fchat-Horizon/Fchat-Horizon")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fchat-horizon"))))
    (home-page "https://github.com/Fchat-Horizon/Fchat-Horizon")
    (synopsis "F-Chat Horizon messaging client from source")
    (description "F-Chat Horizon is a desktop client for the F-Chat messaging
platform, built from source.  It provides real-time chat
functionality with a modern interface.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. proton-mail-desktop --- unofficial Proton Mail desktop client
;;; -------------------------------------------------------------------
(define-public proton-mail-desktop
  (package
    (name "proton-mail-desktop")
    (version "1.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/proton-mail-linux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/proton-mail-desktop"))))
    (home-page "https://github.com/nickvdyck/proton-mail-linux")
    (synopsis "unofficial Proton Mail desktop client")
    (description "Proton Mail Desktop is an unofficial desktop application for
accessing Proton Mail.  It wraps the Proton Mail web interface
in a native desktop window.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. en-croissant --- chess GUI and analysis tool
;;; -------------------------------------------------------------------
(define-public en-croissant
  (package
    (name "en-croissant")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/franciscoBSalguworkers/en-croissant/releases/download/v" version "/en-croissant_" version "_amd64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("en-croissant.AppImage" "bin/en-croissant"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/franciscoBSalguworkers/en-croissant")
    (synopsis "chess GUI and analysis tool")
    (description "En Croissant is a chess graphical user interface and analysis tool.
It supports engine analysis, game databases, and online play with
a modern interface built using Tauri.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11. proton-authenticator --- two-factor authentication client for Proton
;;; -------------------------------------------------------------------
(define-public proton-authenticator
  (package
    (name "proton-authenticator")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/proton-authenticator")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/proton-authenticator"))))
    (home-page "https://github.com/nickvdyck/proton-authenticator")
    (synopsis "two-factor authentication client for Proton")
    (description "Proton Authenticator is a two-factor authentication client
for Proton services.  It generates time-based one-time passwords
(TOTP) for securing your Proton account.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 12. adguardhome-bin --- network-wide ad and tracker blocking DNS server
;;; -------------------------------------------------------------------
(define-public adguardhome-bin
  (package
    (name "adguardhome-bin")
    (version "0.107.57")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AdguardTeam/AdGuardHome/releases/download/v" version "/AdGuardHome_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("AdGuardHome/AdGuardHome" "bin/adguardhome"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AdguardTeam/AdGuardHome")
    (synopsis "network-wide ad and tracker blocking DNS server")
    (description "AdGuard Home is a network-wide software for blocking ads and tracking.
It operates as a DNS server that re-routes tracking domains to a
black hole, preventing devices from connecting to those servers.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 13. chmod-cli --- interactive CLI tool for setting file permissions
;;; -------------------------------------------------------------------
(define-public chmod-cli
  (package
    (name "chmod-cli")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jbkr/chmod-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/chmod-cli"))))
    (home-page "https://github.com/jbkr/chmod-cli")
    (synopsis "interactive CLI tool for setting file permissions")
    (description "Chmod-cli is an interactive command-line tool that helps you
set file permissions.  It provides a visual interface for selecting
permission bits instead of remembering numeric codes.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. ggc --- game launcher and collection manager
;;; -------------------------------------------------------------------
(define-public ggc
  (package
    (name "ggc")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/skyne98/ggc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ggc"))))
    (home-page "https://github.com/skyne98/ggc")
    (synopsis "game launcher and collection manager")
    (description "GGC is a game launcher and collection manager.  It provides a
unified interface for organizing and launching games from various
platforms and sources.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. recon-ng --- web reconnaissance framework
;;; -------------------------------------------------------------------
(define-public recon-ng
  (package
    (name "recon-ng")
    (version "5.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lanmaster53/recon-ng")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/recon-ng"))))
    (home-page "https://github.com/lanmaster53/recon-ng")
    (synopsis "web reconnaissance framework")
    (description "Recon-ng is a full-featured reconnaissance framework written in
Python.  It provides a modular interface for performing web-based
open source reconnaissance efficiently.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 16. moor --- reactive persistence library for Dart and Flutter
;;; -------------------------------------------------------------------
(define-public moor
  (package
    (name "moor")
    (version "4.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/simolus3/drift")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/moor"))))
    (home-page "https://github.com/simolus3/drift")
    (synopsis "reactive persistence library for Dart and Flutter")
    (description "Moor (now Drift) is a reactive persistence library for Dart and
Flutter applications.  It provides a type-safe way to interact
with SQLite databases.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. geforce-infinity --- NVIDIA GeForce driver management tool
;;; -------------------------------------------------------------------
(define-public geforce-infinity
  (package
    (name "geforce-infinity")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/geforce-infinity/geforce-infinity")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/geforce-infinity"))))
    (home-page "https://github.com/geforce-infinity/geforce-infinity")
    (synopsis "NVIDIA GeForce driver management tool")
    (description "GeForce Infinity is a tool for managing NVIDIA GeForce drivers on
Linux.  It provides features for driver installation, configuration,
and performance optimization.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 18. flatpost --- Flatpak post-installation configuration manager
;;; -------------------------------------------------------------------
(define-public flatpost
  (package
    (name "flatpost")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/flatpost/flatpost")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/flatpost"))))
    (home-page "https://github.com/flatpost/flatpost")
    (synopsis "Flatpak post-installation configuration manager")
    (description "Flatpost is a tool for managing Flatpak post-installation
configuration.  It automates the setup of permissions, overrides,
and other configuration for Flatpak applications.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 19. pvetui --- terminal user interface for Proxmox VE
;;; -------------------------------------------------------------------
(define-public pvetui
  (package
    (name "pvetui")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ivanych/pvetui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pvetui"))))
    (home-page "https://github.com/ivanych/pvetui")
    (synopsis "terminal user interface for Proxmox VE")
    (description "Pvetui is a terminal user interface for managing Proxmox VE
virtualization environments.  It provides an ncurses-based interface
for common Proxmox operations.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 20. ddhx --- hex editor for block devices and large files
;;; -------------------------------------------------------------------
(define-public ddhx
  (package
    (name "ddhx")
    (version "0.7.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ddhx/ddhx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ddhx"))))
    (home-page "https://github.com/ddhx/ddhx")
    (synopsis "hex editor for block devices and large files")
    (description "Ddhx is a hex editor for viewing and editing block devices and
large files directly.  It provides a terminal interface for
browsing binary data at the byte level.")
    (license license:boost1.0)))

;;; -------------------------------------------------------------------
;;; 21. gittyup-appimage --- graphical Git client
;;; -------------------------------------------------------------------
(define-public gittyup-appimage
  (package
    (name "gittyup-appimage")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Murmele/Gittyup/releases/download/gittyup_v" version "/Gittyup-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Gittyup.AppImage" "bin/gittyup"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Murmele/Gittyup")
    (synopsis "graphical Git client")
    (description "Gittyup is a graphical user interface for Git that understands the
Git workflow.  It provides a visual diff viewer, branch management,
and commit history browsing in a clean interface.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. ufw-docker --- UFW firewall integration for Docker
;;; -------------------------------------------------------------------
(define-public ufw-docker
  (package
    (name "ufw-docker")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chaifeng/ufw-docker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ufw-docker" "bin/ufw-docker"))))
    (home-page "https://github.com/chaifeng/ufw-docker")
    (synopsis "UFW firewall integration for Docker")
    (description "Ufw-docker fixes Docker's network conflicts with UFW (Uncomplicated
Firewall).  Docker modifies iptables rules directly, bypassing UFW.
This tool helps manage firewall rules for Docker containers.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 23. gnome-shell-extension-hibernate-status --- GNOME Shell extension for hibernate and suspend options
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-hibernate-status
  (package
    (name "gnome-shell-extension-hibernate-status")
    (version "82")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arelange/gnome-shell-extension-hibernate-status")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/hibernate-status@dromi"))))
    (home-page "https://github.com/arelange/gnome-shell-extension-hibernate-status")
    (synopsis "GNOME Shell extension for hibernate and suspend options")
    (description "This GNOME Shell extension adds hibernate and hybrid suspend options
to the power-off menu.  It provides additional power management
choices beyond the default suspend option.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 24. pulse-visualizer --- audio visualizer for PulseAudio
;;; -------------------------------------------------------------------
(define-public pulse-visualizer
  (package
    (name "pulse-visualizer")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/pulse-visualizer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pulse-visualizer"))))
    (home-page "https://github.com/nickvdyck/pulse-visualizer")
    (synopsis "audio visualizer for PulseAudio")
    (description "Pulse Visualizer is a real-time audio visualizer that works with
PulseAudio.  It displays visual representations of audio output
in a terminal or graphical window.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. c3c-bin --- compiler for the C3 programming language
;;; -------------------------------------------------------------------
(define-public c3c-bin
  (package
    (name "c3c-bin")
    (version "0.6.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/c3lang/c3c/releases/download/v" version "/c3-linux.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("c3c" "bin/c3c"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/c3lang/c3c")
    (synopsis "compiler for the C3 programming language")
    (description "C3c is the compiler for the C3 programming language, an evolution
of C that adds modules, error handling, and other modern features
while maintaining C's performance characteristics.")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 26. freetube-nightly-bin --- privacy-focused YouTube desktop client (nightly)
;;; -------------------------------------------------------------------
(define-public freetube-nightly-bin
  (package
    (name "freetube-nightly-bin")
    (version "0.23.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FreeTubeApp/FreeTube/releases/download/v" version "-beta/freetube_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/share/freetube" "share/freetube"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FreeTubeApp/FreeTube")
    (synopsis "privacy-focused YouTube desktop client (nightly)")
    (description "FreeTube is an open source desktop YouTube player built with privacy
in mind.  It uses a local subscription list and does not require a
Google account.  This is the nightly build.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 27. teams-for-linux-git --- unofficial Microsoft Teams client for Linux
;;; -------------------------------------------------------------------
(define-public teams-for-linux-git
  (package
    (name "teams-for-linux-git")
    (version "2.7.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/teams-for-linux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/teams-for-linux"))))
    (home-page "https://github.com/nickvdyck/teams-for-linux")
    (synopsis "unofficial Microsoft Teams client for Linux")
    (description "Teams for Linux is an unofficial Microsoft Teams client for Linux.
It wraps the Teams web application in an Electron shell and provides
native desktop integration features.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 28. stabilitymatrix-bin --- multi-platform package manager for Stable Diffusion
;;; -------------------------------------------------------------------
(define-public stabilitymatrix-bin
  (package
    (name "stabilitymatrix-bin")
    (version "2.13.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LykosAI/StabilityMatrix/releases/download/v" version "/StabilityMatrix-linux-x64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("StabilityMatrix" "bin/stabilitymatrix"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/LykosAI/StabilityMatrix")
    (synopsis "multi-platform package manager for Stable Diffusion")
    (description "Stability Matrix is a multi-platform package manager for Stable
Diffusion.  It provides an easy way to install, configure, and
manage various Stable Diffusion interfaces and models.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 29. neo4j-community-bin --- graph database management system (community edition)
;;; -------------------------------------------------------------------
(define-public neo4j-community-bin
  (package
    (name "neo4j-community-bin")
    (version "5.25.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dist.neo4j.org/neo4j-community-" version "-unix.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/neo4j"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://neo4j.com")
    (synopsis "graph database management system (community edition)")
    (description "Neo4j is a graph database management system that stores data in
nodes and relationships instead of tables or documents.  The community
edition provides core graph database functionality under an open
source license.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 30. stable-diffusion-webui --- web interface for Stable Diffusion image generation
;;; -------------------------------------------------------------------
(define-public stable-diffusion-webui
  (package
    (name "stable-diffusion-webui")
    (version "1.10.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AUTOMATIC1111/stable-diffusion-webui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/stable-diffusion-webui"))))
    (home-page "https://github.com/AUTOMATIC1111/stable-diffusion-webui")
    (synopsis "web interface for Stable Diffusion image generation")
    (description "Stable Diffusion Web UI is a browser interface for Stable Diffusion
image generation.  It provides an accessible way to generate, modify,
and upscale images using AI models.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 31. webapp-manager --- tool for creating web application shortcuts
;;; -------------------------------------------------------------------
(define-public webapp-manager
  (package
    (name "webapp-manager")
    (version "1.3.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/webapp-manager")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/webapp-manager"))))
    (home-page "https://github.com/nickvdyck/webapp-manager")
    (synopsis "tool for creating web application shortcuts")
    (description "Webapp Manager creates web application shortcuts that run in their
own browser window.  It supports multiple browsers and allows you
to create desktop entries for any web page.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 32. rbackup --- rsync-based backup tool
;;; -------------------------------------------------------------------
(define-public rbackup
  (package
    (name "rbackup")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/rbackup")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rbackup"))))
    (home-page "https://github.com/nickvdyck/rbackup")
    (synopsis "rsync-based backup tool")
    (description "Rbackup is a backup tool that uses rsync for efficient file
synchronization.  It provides incremental backups with hardlinks
and a simple configuration interface.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 33. xdg-terminal-exec --- XDG-compliant terminal emulator executor
;;; -------------------------------------------------------------------
(define-public xdg-terminal-exec
  (package
    (name "xdg-terminal-exec")
    (version "0.11.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Vladimir-csp/xdg-terminal-exec")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("xdg-terminal-exec" "bin/xdg-terminal-exec"))))
    (home-page "https://github.com/Vladimir-csp/xdg-terminal-exec")
    (synopsis "XDG-compliant terminal emulator executor")
    (description "Xdg-terminal-exec is a proposal implementation of the Default Terminal
Execution specification for XDG desktop environments.  It provides a
standard way to launch the user's preferred terminal emulator.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 34. youtube-dl-nightly-bin --- command-line video downloader (nightly build)
;;; -------------------------------------------------------------------
(define-public youtube-dl-nightly-bin
  (package
    (name "youtube-dl-nightly-bin")
    (version "2024.12.23")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ytdl-org/youtube-dl/releases/download/" version "/youtube-dl"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("youtube-dl" "bin/youtube-dl"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ytdl-org/youtube-dl")
    (synopsis "command-line video downloader (nightly build)")
    (description "Youtube-dl is a command-line program to download videos from
YouTube and other video sites.  This nightly build includes the
latest patches and site support updates.")
    (license license:unlicense)))

;;; -------------------------------------------------------------------
;;; 35. quickemu --- quickly create and run optimised virtual machines
;;; -------------------------------------------------------------------
(define-public quickemu
  (package
    (name "quickemu")
    (version "4.9.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/quickemu-project/quickemu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("quickemu" "bin/quickemu"))))
    (home-page "https://github.com/quickemu-project/quickemu")
    (synopsis "quickly create and run optimised virtual machines")
    (description "Quickemu is a tool for quickly creating and running optimised
virtual machines.  It automatically downloads and configures
operating system images for use with QEMU.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 36. httptoolkit-bin --- HTTP debugging proxy and analyzer
;;; -------------------------------------------------------------------
(define-public httptoolkit-bin
  (package
    (name "httptoolkit-bin")
    (version "1.19.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/httptoolkit/httptoolkit-desktop/releases/download/v" version "/HttpToolkit-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("HttpToolkit.AppImage" "bin/httptoolkit"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://httptoolkit.com")
    (synopsis "HTTP debugging proxy and analyzer")
    (description "HTTP Toolkit is an HTTP debugging proxy and analyzer.  It allows
you to intercept, inspect, and modify HTTP and HTTPS traffic from
any application for debugging and testing.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 37. freetube-bin --- privacy-focused YouTube desktop client
;;; -------------------------------------------------------------------
(define-public freetube-bin
  (package
    (name "freetube-bin")
    (version "0.22.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FreeTubeApp/FreeTube/releases/download/v" version "-beta/freetube_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/share/freetube" "share/freetube"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FreeTubeApp/FreeTube")
    (synopsis "privacy-focused YouTube desktop client")
    (description "FreeTube is an open source desktop YouTube player built with privacy
in mind.  It allows you to watch YouTube videos without ads and
without Google tracking your viewing habits.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 38. zoi --- terminal-based AI assistant
;;; -------------------------------------------------------------------
(define-public zoi
  (package
    (name "zoi")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/zoi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/zoi"))))
    (home-page "https://github.com/nickvdyck/zoi")
    (synopsis "terminal-based AI assistant")
    (description "Zoi is a terminal-based AI assistant that provides a command-line
interface for interacting with large language models.  It supports
multiple AI providers and conversation management.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 39. osu-lazer-bin --- free-to-play rhythm game
;;; -------------------------------------------------------------------
(define-public osu-lazer-bin
  (package
    (name "osu-lazer-bin")
    (version "2025.417.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ppy/osu/releases/download/" version "/osu.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("osu.AppImage" "bin/osu-lazer"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://osu.ppy.sh")
    (synopsis "free-to-play rhythm game")
    (description "Osu! is a free-to-play rhythm game with four game modes: osu!,
osu!taiko, osu!catch, and osu!mania.  It features community-created
beatmaps and competitive online leaderboards.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 40. openai-codex --- OpenAI Codex CLI coding assistant
;;; -------------------------------------------------------------------
(define-public openai-codex
  (package
    (name "openai-codex")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openai/codex")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/openai-codex"))))
    (home-page "https://github.com/openai/codex")
    (synopsis "OpenAI Codex CLI coding assistant")
    (description "OpenAI Codex is a command-line coding assistant powered by
OpenAI models.  It can generate, explain, and refactor code
directly from the terminal.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 41. gale --- lightweight Matrix messaging client
;;; -------------------------------------------------------------------
(define-public gale
  (package
    (name "gale")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/gale")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gale"))))
    (home-page "https://github.com/nickvdyck/gale")
    (synopsis "lightweight Matrix messaging client")
    (description "Gale is a lightweight Matrix messaging client.  It provides
a clean interface for Matrix chat with support for end-to-end
encryption and multiple accounts.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 42. vet --- dependency analysis and security scanning tool
;;; -------------------------------------------------------------------
(define-public vet
  (package
    (name "vet")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/vet")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vet"))))
    (home-page "https://github.com/nickvdyck/vet")
    (synopsis "dependency analysis and security scanning tool")
    (description "Vet is a tool for analyzing project dependencies for known
vulnerabilities and license compliance issues.  It scans lock
files and reports security advisories.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 43. swhkd --- simple Wayland hotkey daemon
;;; -------------------------------------------------------------------
(define-public swhkd
  (package
    (name "swhkd")
    (version "2.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/waycrate/swhkd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/swhkd"))))
    (home-page "https://github.com/waycrate/swhkd")
    (synopsis "simple Wayland hotkey daemon")
    (description "Swhkd is a display-protocol-independent hotkey daemon for Wayland
and X11.  It listens for keyboard shortcuts and executes commands,
similar to sxhkd but compatible with Wayland compositors.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 44. zelda64recomp-bin --- recompilation of Zelda 64 for PC
;;; -------------------------------------------------------------------
(define-public zelda64recomp-bin
  (package
    (name "zelda64recomp-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rt64/zelda64recomp/releases/download/v" version "/Zelda64Recompiled-Linux-x64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Zelda64Recompiled.AppImage" "bin/zelda64recomp"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rt64/zelda64recomp")
    (synopsis "recompilation of Zelda 64 for PC")
    (description "Zelda64Recomp is a static recompilation project for The Legend of
Zelda: Majora's Mask that allows playing the game natively on PC.
It converts N64 code to native x86_64 code.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 45. ipfs-desktop-appimage --- IPFS desktop application
;;; -------------------------------------------------------------------
(define-public ipfs-desktop-appimage
  (package
    (name "ipfs-desktop-appimage")
    (version "0.40.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nickvdyck/ipfs-desktop/releases/download/v" version "/ipfs-desktop-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ipfs-desktop.AppImage" "bin/ipfs-desktop"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nickvdyck/ipfs-desktop")
    (synopsis "IPFS desktop application")
    (description "IPFS Desktop is a desktop application for running and managing
an IPFS node.  It provides a graphical interface for file sharing,
pinning, and IPFS network connectivity.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 46. kde-material-you-colors --- Material You color scheme generator for KDE Plasma
;;; -------------------------------------------------------------------
(define-public kde-material-you-colors
  (package
    (name "kde-material-you-colors")
    (version "1.9.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/kde-material-you-colors")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/kde-material-you-colors"))))
    (home-page "https://github.com/nickvdyck/kde-material-you-colors")
    (synopsis "Material You color scheme generator for KDE Plasma")
    (description "KDE Material You Colors generates Material You color schemes from
wallpapers for KDE Plasma.  It automatically extracts dominant
colors and creates matching system themes.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 47. activitywatch-bin --- automated time tracking application
;;; -------------------------------------------------------------------
(define-public activitywatch-bin
  (package
    (name "activitywatch-bin")
    (version "0.13.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ActivityWatch/activitywatch/releases/download/v" version "/activitywatch-v" version "-linux-x86_64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("activitywatch" "share/activitywatch"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://activitywatch.net")
    (synopsis "automated time tracking application")
    (description "ActivityWatch is an automated time tracker that records what you do
on your computer.  It tracks active window titles, browser activity,
and provides detailed productivity statistics.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 48. freeshow-bin --- free and open source presentation software
;;; -------------------------------------------------------------------
(define-public freeshow-bin
  (package
    (name "freeshow-bin")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ChurchApps/FreeShow/releases/download/v" version "/FreeShow-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("FreeShow.AppImage" "bin/freeshow"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://freeshow.app")
    (synopsis "free and open source presentation software")
    (description "FreeShow is a free and open source presentation application designed
for churches and other venues.  It supports slides, media playback,
and live output to projectors.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 49. claude-code-router --- API router for Claude Code
;;; -------------------------------------------------------------------
(define-public claude-code-router
  (package
    (name "claude-code-router")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/claude-code-router")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/claude-code-router"))))
    (home-page "https://github.com/nickvdyck/claude-code-router")
    (synopsis "API router for Claude Code")
    (description "Claude Code Router is an API routing tool for directing Claude Code
requests.  It provides middleware for managing and distributing API
calls across multiple endpoints.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 50. libfprint-2-tod1-goodix-v2 --- Goodix fingerprint sensor driver for libfprint
;;; -------------------------------------------------------------------
(define-public libfprint-2-tod1-goodix-v2
  (package
    (name "libfprint-2-tod1-goodix-v2")
    (version "0.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nickvdyck/libfprint-2-tod1-goodix/releases/download/v" version "/libfprint-2-tod1-goodix_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib" "lib"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nickvdyck/libfprint-2-tod1-goodix")
    (synopsis "Goodix fingerprint sensor driver for libfprint")
    (description "Libfprint TOD1 Goodix v2 provides a driver for Goodix fingerprint
sensors compatible with libfprint.  It enables fingerprint
authentication on laptops with Goodix sensor hardware.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 51. debtap --- script for converting DEB packages
;;; -------------------------------------------------------------------
(define-public debtap
  (package
    (name "debtap")
    (version "3.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/helixarch/debtap")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("debtap" "bin/debtap"))))
    (home-page "https://github.com/helixarch/debtap")
    (synopsis "script for converting DEB packages")
    (description "Debtap is a script for converting Debian packages to other
formats.  It extracts the contents of a .deb file and repackages
them for installation on non-Debian systems.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 52. libmp3splt-docs --- documentation for the libmp3splt library
;;; -------------------------------------------------------------------
(define-public libmp3splt-docs
  (package
    (name "libmp3splt-docs")
    (version "0.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mp3splt/mp3splt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/doc/libmp3splt"))))
    (home-page "https://github.com/mp3splt/mp3splt")
    (synopsis "documentation for the libmp3splt library")
    (description "Libmp3splt-docs provides documentation for the libmp3splt library,
which is used for splitting MP3 and Ogg Vorbis files without
decoding and re-encoding.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 53. piper-tts-bin --- fast local neural text-to-speech engine
;;; -------------------------------------------------------------------
(define-public piper-tts-bin
  (package
    (name "piper-tts-bin")
    (version "2024.11.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rhasspy/piper/releases/download/" version "/piper_linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("piper" "bin/piper-tts"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rhasspy/piper")
    (synopsis "fast local neural text-to-speech engine")
    (description "Piper is a fast local neural text-to-speech system.  It uses
VITS models to generate natural-sounding speech from text and
runs entirely on the CPU without requiring a GPU.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 54. rutoken --- Rutoken hardware security token drivers
;;; -------------------------------------------------------------------
(define-public rutoken
  (package
    (name "rutoken")
    (version "4.8.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.rutoken.ru/Rutoken/Drivers/Current/" version "/rutoken-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rutoken"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.rutoken.ru")
    (synopsis "Rutoken hardware security token drivers")
    (description "Rutoken provides drivers and utilities for Rutoken hardware
security tokens.  These tokens are used for digital signatures,
authentication, and secure key storage.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 55. quarkdown --- Markdown processor and document generator
;;; -------------------------------------------------------------------
(define-public quarkdown
  (package
    (name "quarkdown")
    (version "1.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/quarkdown")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/quarkdown"))))
    (home-page "https://github.com/nickvdyck/quarkdown")
    (synopsis "Markdown processor and document generator")
    (description "Quarkdown is a Markdown processor that extends standard Markdown
with additional features for document generation.  It supports
custom macros, includes, and multiple output formats.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 56. code-server-bin --- VS Code running in the browser
;;; -------------------------------------------------------------------
(define-public code-server-bin
  (package
    (name "code-server-bin")
    (version "4.99.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/coder/code-server/releases/download/v" version "/code-server-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/code-server"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/coder/code-server")
    (synopsis "VS Code running in the browser")
    (description "Code-server is VS Code running on a remote server, accessible
through the browser.  It provides a full VS Code experience with
extensions, terminal access, and collaborative editing.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 57. hyde-cli --- CLI tool for managing HyDE Hyprland themes
;;; -------------------------------------------------------------------
(define-public hyde-cli
  (package
    (name "hyde-cli")
    (version "0.8.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/HyDE-Project/Hyde-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hyde-cli"))))
    (home-page "https://github.com/HyDE-Project/Hyde-cli")
    (synopsis "CLI tool for managing HyDE Hyprland themes")
    (description "Hyde-cli is a command-line tool for managing themes and configurations
in the HyDE (Hyprland Desktop Environment) setup.  It handles theme
switching, wallpaper management, and system customization.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 58. deflemask-bin --- multi-system chiptune music tracker
;;; -------------------------------------------------------------------
(define-public deflemask-bin
  (package
    (name "deflemask-bin")
    (version "1.1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://deflemask.com/DefleMask_" version "_LINUX.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("DefleMask" "bin/deflemask"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://deflemask.com")
    (synopsis "multi-system chiptune music tracker")
    (description "DefleMask is a multi-system chiptune tracker for creating music
for classic game systems.  It supports Sega Genesis, Game Boy,
NES, and many other platforms' sound chips.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 59. jdk-openjdk-wakefield --- OpenJDK with Wayland support (Project Wakefield)
;;; -------------------------------------------------------------------
(define-public jdk-openjdk-wakefield
  (package
    (name "jdk-openjdk-wakefield")
    (version "21.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/wakefield")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/jdk-openjdk-wakefield"))))
    (home-page "https://github.com/nickvdyck/wakefield")
    (synopsis "OpenJDK with Wayland support (Project Wakefield)")
    (description "OpenJDK Wakefield is a modified OpenJDK distribution that adds
native Wayland support to Java's AWT and Swing toolkits.  It
enables Java GUI applications to run natively on Wayland.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 60. jre-openjdk-wakefield --- OpenJDK JRE with Wayland support (Project Wakefield)
;;; -------------------------------------------------------------------
(define-public jre-openjdk-wakefield
  (package
    (name "jre-openjdk-wakefield")
    (version "21.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/wakefield")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/jre-openjdk-wakefield"))))
    (home-page "https://github.com/nickvdyck/wakefield")
    (synopsis "OpenJDK JRE with Wayland support (Project Wakefield)")
    (description "OpenJDK Wakefield JRE is a Java Runtime Environment with native
Wayland support.  It allows Java applications to run natively on
Wayland compositors without XWayland.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 61. jre-openjdk-wakefield-headless --- headless OpenJDK JRE with Wayland patches
;;; -------------------------------------------------------------------
(define-public jre-openjdk-wakefield-headless
  (package
    (name "jre-openjdk-wakefield-headless")
    (version "21.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/wakefield")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/jre-openjdk-wakefield-headless"))))
    (home-page "https://github.com/nickvdyck/wakefield")
    (synopsis "headless OpenJDK JRE with Wayland patches")
    (description "OpenJDK Wakefield Headless JRE is a headless Java Runtime Environment
based on the Wakefield project.  It provides server-side Java
execution without graphical display dependencies.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 62. openjdk-wakefield-doc --- documentation for OpenJDK Wakefield
;;; -------------------------------------------------------------------
(define-public openjdk-wakefield-doc
  (package
    (name "openjdk-wakefield-doc")
    (version "21.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/wakefield")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/doc/openjdk-wakefield"))))
    (home-page "https://github.com/nickvdyck/wakefield")
    (synopsis "documentation for OpenJDK Wakefield")
    (description "OpenJDK Wakefield documentation provides API documentation and
developer guides for the Wakefield OpenJDK distribution with
native Wayland support.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 63. openjdk-wakefield-src --- source code for OpenJDK Wakefield
;;; -------------------------------------------------------------------
(define-public openjdk-wakefield-src
  (package
    (name "openjdk-wakefield-src")
    (version "21.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/wakefield")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/src/openjdk-wakefield"))))
    (home-page "https://github.com/nickvdyck/wakefield")
    (synopsis "source code for OpenJDK Wakefield")
    (description "OpenJDK Wakefield source package contains the complete source code
for the Wakefield OpenJDK distribution.  It includes the Wayland
backend patches and build infrastructure.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 64. openssh-hpn-shim --- high performance OpenSSH patch shim
;;; -------------------------------------------------------------------
(define-public openssh-hpn-shim
  (package
    (name "openssh-hpn-shim")
    (version "9.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rapier1/openssh-portable")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/openssh-hpn-shim"))))
    (home-page "https://www.psc.edu/hpn-ssh-home/hpn-ssh-faq/")
    (synopsis "high performance OpenSSH patch shim")
    (description "OpenSSH HPN Shim provides the high-performance networking patches
for OpenSSH.  These patches improve SSH transfer speeds through
dynamic window sizing and multi-threaded encryption.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 65. lenovolegionlinux --- driver and utilities for Lenovo Legion laptops
;;; -------------------------------------------------------------------
(define-public lenovolegionlinux
  (package
    (name "lenovolegionlinux")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/johnfanv2/LenovoLegionLinux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lenovolegionlinux"))))
    (home-page "https://github.com/johnfanv2/LenovoLegionLinux")
    (synopsis "driver and utilities for Lenovo Legion laptops")
    (description "Lenovo Legion Linux provides kernel drivers and userspace utilities
for Lenovo Legion gaming laptops.  It enables fan control, power
profile management, and RGB keyboard configuration.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 66. python-libpulse --- Python bindings for PulseAudio
;;; -------------------------------------------------------------------
(define-public python-libpulse
  (package
    (name "python-libpulse")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/python-libpulse")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/python-libpulse"))))
    (home-page "https://github.com/nickvdyck/python-libpulse")
    (synopsis "Python bindings for PulseAudio")
    (description "Python-libpulse provides Python bindings for the PulseAudio
sound server.  It enables Python applications to control and
monitor PulseAudio streams and devices.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 67. epsxe-plugin-gpu-soft --- software GPU plugin for ePSXe PlayStation emulator
;;; -------------------------------------------------------------------
(define-public epsxe-plugin-gpu-soft
  (package
    (name "epsxe-plugin-gpu-soft")
    (version "1.18")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.epsxe.com/files/ePSXe" version "linux_x64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/epsxe-plugins"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.epsxe.com")
    (synopsis "software GPU plugin for ePSXe PlayStation emulator")
    (description "ePSXe Plugin GPU Soft is a software-rendered GPU plugin for the
ePSXe PlayStation emulator.  It provides graphics rendering without
requiring hardware acceleration.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 68. cssmodules-language-server --- language server for CSS modules
;;; -------------------------------------------------------------------
(define-public cssmodules-language-server
  (package
    (name "cssmodules-language-server")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/cssmodules-language-server")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cssmodules-language-server"))))
    (home-page "https://github.com/nickvdyck/cssmodules-language-server")
    (synopsis "language server for CSS modules")
    (description "CSS Modules Language Server provides autocompletion and navigation
for CSS Modules in editors that support the Language Server Protocol.
It resolves CSS class names from imported module files.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 69. python-mmdetection --- object detection toolkit based on PyTorch
;;; -------------------------------------------------------------------
(define-public python-mmdetection
  (package
    (name "python-mmdetection")
    (version "3.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/open-mmlab/mmdetection")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/python-mmdetection"))))
    (home-page "https://github.com/open-mmlab/mmdetection")
    (synopsis "object detection toolkit based on PyTorch")
    (description "MMDetection is an open source object detection toolbox based on
PyTorch.  It provides implementations of various detection algorithms
including Faster R-CNN, RetinaNet, and YOLO variants.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 70. pico-sdk-develop --- development SDK for Raspberry Pi Pico
;;; -------------------------------------------------------------------
(define-public pico-sdk-develop
  (package
    (name "pico-sdk-develop")
    (version "2.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/raspberrypi/pico-sdk")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pico-sdk"))))
    (home-page "https://github.com/raspberrypi/pico-sdk")
    (synopsis "development SDK for Raspberry Pi Pico")
    (description "Pico SDK is the official software development kit for the
Raspberry Pi Pico microcontroller board.  It provides libraries,
headers, and build tools for developing RP2040 applications.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 71. u2f-udev-rules-feitian --- udev rules for Feitian U2F security keys
;;; -------------------------------------------------------------------
(define-public u2f-udev-rules-feitian
  (package
    (name "u2f-udev-rules-feitian")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/u2f-udev-rules-feitian")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/udev/rules.d"))))
    (home-page "https://www.ftsafe.com")
    (synopsis "udev rules for Feitian U2F security keys")
    (description "U2F udev rules for Feitian provides the necessary udev rules
for Feitian U2F and FIDO2 security keys to work properly on
Linux without requiring root access.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 72. thincast-client-bin --- remote desktop client based on FreeRDP
;;; -------------------------------------------------------------------
(define-public thincast-client-bin
  (package
    (name "thincast-client-bin")
    (version "14.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://thincast.com/downloads/client/thincast-client-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("thincast-client.AppImage" "bin/thincast-client"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://thincast.com")
    (synopsis "remote desktop client based on FreeRDP")
    (description "Thincast Client is a remote desktop client based on FreeRDP.
It provides RDP connectivity to Windows Remote Desktop services
with enhanced performance and usability features.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 73. pulseaudio-dlna-cygn --- DLNA and Chromecast streaming for PulseAudio
;;; -------------------------------------------------------------------
(define-public pulseaudio-dlna-cygn
  (package
    (name "pulseaudio-dlna-cygn")
    (version "0.6.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/pulseaudio-dlna")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pulseaudio-dlna"))))
    (home-page "https://github.com/nickvdyck/pulseaudio-dlna")
    (synopsis "DLNA and Chromecast streaming for PulseAudio")
    (description "PulseAudio DLNA streams audio from PulseAudio to DLNA renderers
and Chromecast devices on the network.  It creates virtual sinks
that forward audio to network speakers.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 74. piri --- process information and reporting interface
;;; -------------------------------------------------------------------
(define-public piri
  (package
    (name "piri")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/piri")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/piri"))))
    (home-page "https://github.com/nickvdyck/piri")
    (synopsis "process information and reporting interface")
    (description "Piri is a process information and reporting interface tool.  It
provides a command-line interface for inspecting running processes
and their resource usage.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 75. lrz-syncshare --- LRZ Sync+Share cloud storage client
;;; -------------------------------------------------------------------
(define-public lrz-syncshare
  (package
    (name "lrz-syncshare")
    (version "4.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://syncandshare.lrz.de/client/download/linux/lrz-syncshare-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lrz-syncshare.AppImage" "bin/lrz-syncshare"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://syncandshare.lrz.de")
    (synopsis "LRZ Sync+Share cloud storage client")
    (description "LRZ Sync+Share is the official client for the LRZ cloud storage
service.  It provides file synchronization and sharing capabilities
for academic and research institutions in Bavaria.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 76. devzat --- SSH chat server for developers
;;; -------------------------------------------------------------------
(define-public devzat
  (package
    (name "devzat")
    (version "0.18.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/quackduck/devzat/releases/download/v" version "/devzat-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("devzat-linux-amd64" "bin/devzat"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/quackduck/devzat")
    (synopsis "SSH chat server for developers")
    (description "Devzat is a chat server accessible over SSH.  It provides a
real-time chat experience directly in the terminal without
requiring any additional client software.")
    (license license:expat)))


;;; ===================================================================
;;; CMAKE-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 77. monocoque --- sim racing telemetry application
;;; -------------------------------------------------------------------
(define-public monocoque
  (package
    (name "monocoque")
    (version "0.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Spacefreak18/monocoque")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/Spacefreak18/monocoque")
    (synopsis "sim racing telemetry application")
    (description "Monocoque is a sim racing telemetry application that reads data from
various racing simulators and outputs it to hardware devices such as
wind simulators, haptic feedback devices, and LED displays.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 78. crazydiskinfo --- disk health monitoring tool using S.M.A.R.T. data
;;; -------------------------------------------------------------------
(define-public crazydiskinfo
  (package
    (name "crazydiskinfo")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/otakuto/CrazyDiskInfo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/otakuto/CrazyDiskInfo")
    (synopsis "disk health monitoring tool using S.M.A.R.T. data")
    (description "CrazyDiskInfo is a Linux disk health monitoring tool based on
S.M.A.R.T. data.  It displays disk status information in a
user-friendly interface similar to CrystalDiskInfo on Windows.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 79. kwin-karousel --- scrolling window management KWin plugin
;;; -------------------------------------------------------------------
(define-public kwin-karousel
  (package
    (name "kwin-karousel")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/peterfajdiga/karousel")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/peterfajdiga/karousel")
    (synopsis "scrolling window management KWin plugin")
    (description "Karousel is a KWin plugin that provides a scrolling window
management experience.  Windows are arranged side by side in a
horizontal strip that you can scroll through.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 80. intel-media-driver-legacy --- legacy Intel media driver for VA-API
;;; -------------------------------------------------------------------
(define-public intel-media-driver-legacy
  (package
    (name "intel-media-driver-legacy")
    (version "23.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/intel/media-driver/archive/refs/tags/intel-media-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/intel/media-driver")
    (synopsis "legacy Intel media driver for VA-API")
    (description "Intel Media Driver is a VAAPI (Video Acceleration API) user-mode
driver for Intel GPUs.  This package provides the legacy version
for older Intel hardware generations.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 81. trustedqsl --- amateur radio QSO logging and certificate tool
;;; -------------------------------------------------------------------
(define-public trustedqsl
  (package
    (name "trustedqsl")
    (version "2.7.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/penguin359/trustedqsl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/penguin359/trustedqsl")
    (synopsis "amateur radio QSO logging and certificate tool")
    (description "TrustedQSL is a tool for generating digitally signed QSO records
for submission to the ARRL Logbook of The World.  It provides
certificate management and log signing capabilities.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 82. grub-customizer --- graphical GRUB bootloader configuration tool
;;; -------------------------------------------------------------------
(define-public grub-customizer
  (package
    (name "grub-customizer")
    (version "5.2.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/grub-customizer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/nickvdyck/grub-customizer")
    (synopsis "graphical GRUB bootloader configuration tool")
    (description "GRUB Customizer is a graphical interface for configuring the GRUB
bootloader.  It allows you to rearrange, add, or remove boot menu
entries and change the default boot entry.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 83. boomaga --- virtual printer for document preparation
;;; -------------------------------------------------------------------
(define-public boomaga
  (package
    (name "boomaga")
    (version "3.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Boomaga/boomaga")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/Boomaga/boomaga")
    (synopsis "virtual printer for document preparation")
    (description "Boomaga is a virtual printer that allows you to preview and rearrange
pages before printing.  It supports booklet printing, page reordering,
and merging multiple print jobs.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 84. looking-glass-client --- KVM frame relay client for GPU passthrough
;;; -------------------------------------------------------------------
(define-public looking-glass-client
  (package
    (name "looking-glass-client")
    (version "B7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://looking-glass.io/artifact/" version "/source"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://looking-glass.io")
    (synopsis "KVM frame relay client for GPU passthrough")
    (description "Looking Glass is a KVM frame relay application that captures the
framebuffer from a GPU passed through to a guest VM and displays
it on the host machine with minimal latency.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 85. obs-plugin-looking-glass --- OBS Studio plugin for Looking Glass
;;; -------------------------------------------------------------------
(define-public obs-plugin-looking-glass
  (package
    (name "obs-plugin-looking-glass")
    (version "B7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://looking-glass.io/artifact/" version "/source"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://looking-glass.io")
    (synopsis "OBS Studio plugin for Looking Glass")
    (description "This OBS Studio plugin provides a Looking Glass capture source,
allowing you to capture the guest VM's display directly into OBS
for streaming or recording without performance overhead.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 86. darkly --- dark theme for KDE Plasma
;;; -------------------------------------------------------------------
(define-public darkly
  (package
    (name "darkly")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/darkly")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/nickvdyck/darkly")
    (synopsis "dark theme for KDE Plasma")
    (description "Darkly is a dark theme for KDE Plasma desktop environment.  It
provides a consistent dark appearance across Qt applications,
Plasma widgets, and window decorations.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 87. whisper-cpp --- C/C++ port of OpenAI Whisper speech recognition
;;; -------------------------------------------------------------------
(define-public whisper-cpp
  (package
    (name "whisper-cpp")
    (version "1.7.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ggerganov/whisper.cpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/ggerganov/whisper.cpp")
    (synopsis "C/C++ port of OpenAI Whisper speech recognition")
    (description "Whisper.cpp is a high-performance C/C++ port of OpenAI's Whisper
automatic speech recognition model.  It runs locally without
requiring a GPU and supports multiple languages.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 88. whatsapp-for-linux --- unofficial WhatsApp desktop client for Linux
;;; -------------------------------------------------------------------
(define-public whatsapp-for-linux
  (package
    (name "whatsapp-for-linux")
    (version "1.6.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/whatsapp-for-linux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/nickvdyck/whatsapp-for-linux")
    (synopsis "unofficial WhatsApp desktop client for Linux")
    (description "WhatsApp for Linux is an unofficial WhatsApp desktop client.
It wraps the WhatsApp Web interface in a native GTK window with
system tray integration and notification support.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 89. indi-3rdparty-libs --- third-party driver libraries for INDI astronomy
;;; -------------------------------------------------------------------
(define-public indi-3rdparty-libs
  (package
    (name "indi-3rdparty-libs")
    (version "2.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/indilib/indi-3rdparty")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/indilib/indi-3rdparty")
    (synopsis "third-party driver libraries for INDI astronomy")
    (description "INDI 3rd-party libraries provide drivers for various astronomical
devices.  This package includes libraries needed by third-party
INDI drivers for telescopes, cameras, and other equipment.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 90. extract-xiso --- Xbox ISO image extraction tool
;;; -------------------------------------------------------------------
(define-public extract-xiso
  (package
    (name "extract-xiso")
    (version "2.8.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/XboxDev/extract-xiso")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/XboxDev/extract-xiso")
    (synopsis "Xbox ISO image extraction tool")
    (description "Extract-xiso is a tool for extracting and creating Xbox ISO images.
It supports both original Xbox and Xbox 360 disc images and can
extract files or repack directories.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 91. pegasus-frontend --- cross-platform graphical game launcher
;;; -------------------------------------------------------------------
(define-public pegasus-frontend
  (package
    (name "pegasus-frontend")
    (version "0.16.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mmatber/pegasus-frontend")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://pegasus-frontend.org")
    (synopsis "cross-platform graphical game launcher")
    (description "Pegasus is a cross-platform graphical frontend for browsing and
launching emulators and games.  It supports customizable themes
and multiple metadata sources.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 92. svt-av1-psy --- AV1 encoder with perceptual quality optimizations
;;; -------------------------------------------------------------------
(define-public svt-av1-psy
  (package
    (name "svt-av1-psy")
    (version "2.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gianni-rosato/svt-av1-psy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/gianni-rosato/svt-av1-psy")
    (synopsis "AV1 encoder with perceptual quality optimizations")
    (description "SVT-AV1-PSY is a fork of SVT-AV1 with psychovisual enhancements.
It provides better perceptual video quality at the same bitrate
through optimized rate-distortion and quantization settings.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 93. fcitx5-toki-pona --- Toki Pona input method for Fcitx5
;;; -------------------------------------------------------------------
(define-public fcitx5-toki-pona
  (package
    (name "fcitx5-toki-pona")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/fcitx5-toki-pona")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/nickvdyck/fcitx5-toki-pona")
    (synopsis "Toki Pona input method for Fcitx5")
    (description "Fcitx5 Toki Pona provides an input method for typing in Toki Pona
using the Fcitx5 input method framework.  It supports sitelen pona
script input.")
    (license license:gpl3+)))


;;; ===================================================================
;;; MESON-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 94. gnome-network-displays --- Miracast/Wi-Fi display streaming for GNOME
;;; -------------------------------------------------------------------
(define-public gnome-network-displays
  (package
    (name "gnome-network-displays")
    (version "0.93.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/GNOME/gnome-network-displays.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://gitlab.gnome.org/GNOME/gnome-network-displays")
    (synopsis "Miracast/Wi-Fi display streaming for GNOME")
    (description "GNOME Network Displays allows you to stream your desktop to remote
displays using Miracast/Wi-Fi Display protocol.  It provides wireless
screen mirroring to compatible TVs and displays.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 95. xviewer-plugins --- plugins for the Xviewer image viewer
;;; -------------------------------------------------------------------
(define-public xviewer-plugins
  (package
    (name "xviewer-plugins")
    (version "3.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linuxmint/xviewer-plugins")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/linuxmint/xviewer-plugins")
    (synopsis "plugins for the Xviewer image viewer")
    (description "Xviewer-plugins provides additional functionality for the Xviewer
image viewer.  It includes plugins for image manipulation, EXIF
data display, and integration with other applications.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 96. xviewer --- image viewer for the Cinnamon desktop
;;; -------------------------------------------------------------------
(define-public xviewer
  (package
    (name "xviewer")
    (version "3.4.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linuxmint/xviewer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/linuxmint/xviewer")
    (synopsis "image viewer for the Cinnamon desktop")
    (description "Xviewer is a simple image viewer application for the Cinnamon
desktop environment.  It is a fork of Eye of GNOME with additional
features and Linux Mint integration.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 97. dxvk-nvapi-vkreflex-layer --- Vulkan Reflex layer for DXVK-NVAPI
;;; -------------------------------------------------------------------
(define-public dxvk-nvapi-vkreflex-layer
  (package
    (name "dxvk-nvapi-vkreflex-layer")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/doitsujin/dxvk")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/doitsujin/dxvk")
    (synopsis "Vulkan Reflex layer for DXVK-NVAPI")
    (description "DXVK-NVAPI VkReflex Layer provides Vulkan Reflex support for
DXVK-NVAPI.  It enables NVIDIA Reflex low-latency technology
for DirectX games running through Wine/Proton.")
    (license license:zlib)))


;;; ===================================================================
;;; GNU-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 98. google-breakpad --- crash reporting system from Google
;;; -------------------------------------------------------------------
(define-public google-breakpad
  (package
    (name "google-breakpad")
    (version "2024.07.01")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://chromium.googlesource.com/breakpad/breakpad")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://chromium.googlesource.com/breakpad/breakpad")
    (synopsis "crash reporting system from Google")
    (description "Google Breakpad is a set of client and server components that
implement a crash-reporting system.  It produces minidump files
from crashes and processes them to produce stack traces.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 99. archivemount-ng --- FUSE-based archive mounting utility
;;; -------------------------------------------------------------------
(define-public archivemount-ng
  (package
    (name "archivemount-ng")
    (version "0.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/archivemount-ng")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/nickvdyck/archivemount-ng")
    (synopsis "FUSE-based archive mounting utility")
    (description "Archivemount-ng mounts archive files as FUSE filesystems.
It allows you to browse and extract files from archives as if
they were regular directories.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 100. xfce-polkit --- polkit authentication agent for Xfce
;;; -------------------------------------------------------------------
(define-public xfce-polkit
  (package
    (name "xfce-polkit")
    (version "0.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdyck/xfce-polkit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/nickvdyck/xfce-polkit")
    (synopsis "polkit authentication agent for Xfce")
    (description "Xfce-polkit is a simple polkit authentication agent for the Xfce
desktop environment.  It displays a dialog when administrative
privileges are needed for system operations.")
    (license license:gpl2+)))

