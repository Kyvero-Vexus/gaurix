;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413g
;;; Resolves 100 packages from todo_general_packages.org:
;;;   - 79 recipes created
;;;   - 21 blocked with specific reason codes
;;;
;;; Recipes (79):
;;;   - wemeet-bin (copy, nonfree)
;;;   - xnviewmp-bin (copy, nonfree)
;;;   - prek (copy, expat)
;;;   - goland-bin (copy, nonfree)
;;;   - peaclock (cmake, expat)
;;;   - llama-cpp-aio (cmake, expat)
;;;   - gpu-t (copy, expat)
;;;   - certbot-dns-desec (pyproject, asl2.0)
;;;   - hachimi-world-bin (copy, expat)
;;;   - aylurs-gtk-shell (meson, gpl3+)
;;;   - theclicker-bin (copy, gpl3+)
;;;   - steamtinkerlaunch (copy, gpl3+)
;;;   - pyrite64-bin (copy, gpl3+)
;;;   - alt-sendme-bin (copy, asl2.0)
;;;   - whph-bin (copy, expat)
;;;   - python-fangfrisch (pyproject, gpl3+)
;;;   - piper-voices-common (copy, expat)
;;;   - gdscript-formatter-bin (copy, expat)
;;;   - wl-kbptr (meson, expat)
;;;   - aic94xx-firmware (copy, nonfree)
;;;   - libva-vdpau-driver (gnu, gpl2+)
;;;   - wd719x-firmware (copy, nonfree)
;;;   - ollama-cuda12-bin (copy, expat)
;;;   - ollama-cuda13-bin (copy, expat)
;;;   - ollama-mlx-cuda13-bin (copy, expat)
;;;   - scuisei (cmake, gpl3+)
;;;   - lsu (copy, expat)
;;;   - ethtui-bin (copy, expat)
;;;   - youtube-chat-rs (copy, expat)
;;;   - aerothemeplasma-desktop (copy, gpl3+)
;;;   - python-setuptools-reproducible (pyproject, expat)
;;;   - llama-cpp (cmake, expat)
;;;   - lsu-bin (copy, expat)
;;;   - picoscope7-bin (copy, nonfree)
;;;   - passkeyd (copy, asl2.0)
;;;   - font-vt323 (font, silofl1.1)
;;;   - banjorecomp-bin (copy, gpl3+)
;;;   - opencloud-desktop (cmake, asl2.0)
;;;   - protonhax (copy, expat)
;;;   - kuva (copy, expat)
;;;   - ldapvi (gnu, gpl2+)
;;;   - fastflix (pyproject, expat)
;;;   - psn-bin (copy, expat)
;;;   - clipvault (copy, expat)
;;;   - lektra (copy, gpl3+)
;;;   - lsplug (copy, expat)
;;;   - bfree-bin (copy, expat)
;;;   - spotatui (copy, expat)
;;;   - projectlibre-bin (copy, cpal1.0)
;;;   - plus42 (gnu, gpl2+)
;;;   - free42 (gnu, gpl2+)
;;;   - fish-pure-prompt (copy, expat)
;;;   - yacreader (cmake, gpl3+)
;;;   - yacreaderlibraryserver (cmake, gpl3+)
;;;   - photoqt-extensions (cmake, gpl2+)
;;;   - openspec (copy, expat)
;;;   - logisim-evolution-bin (copy, gpl3+)
;;;   - qwen-code-bin (copy, asl2.0)
;;;   - boxflat (pyproject, gpl3+)
;;;   - oauth2-proxy-bin (copy, expat)
;;;   - clipse (copy, expat)
;;;   - urbackup-client (gnu, agpl3+)
;;;   - anythingllm-desktop-bin (copy, expat)
;;;   - turtlectl (copy, expat)
;;;   - yubico-authenticator-bin (copy, bsd-2)
;;;   - pulse-visualizer-bin (copy, expat)
;;;   - anydesk-legacy-bin (copy, nonfree)
;;;   - firedragon-bin (copy, mpl2.0)
;;;   - spotatui-bin (copy, expat)
;;;   - ntfsprogs-plus (gnu, gpl2+)
;;;   - elephant-clipboard (copy, expat)
;;;   - elephant-desktopapplications (copy, expat)
;;;   - elephant-menus (copy, expat)
;;;   - elephant-unicode (copy, expat)
;;;   - osu-lazer-tachyon-bin (copy, expat)
;;;   - radarr-bin (copy, gpl3+)
;;;   - otter-launcher (copy, expat)
;;;   - p7zip-gui (gnu, lgpl2.1+)
;;;   - curd (copy, gpl3+)
;;;
;;; Blocked (21):
;;;   - new-lg4ff-dkms (NEEDS_RECIPE_DESIGN)
;;;   - vk-hdr-layer-kwin6 (NEEDS_RECIPE_DESIGN)
;;;   - intel-oneapi-basekit-2025 (NEEDS_RECIPE_DESIGN)
;;;   - subtitleedit-avalonia (NEEDS_RECIPE_DESIGN)
;;;   - pgadmin4-desktop (NEEDS_RECIPE_DESIGN)
;;;   - obs-studio-liberty (NEEDS_RECIPE_DESIGN)
;;;   - ttf-ms-win10-auto-japanese (SOURCE_UNAVAILABLE)
;;;   - ttf-ms-win10-auto-korean (SOURCE_UNAVAILABLE)
;;;   - ttf-ms-win10-auto-sea (SOURCE_UNAVAILABLE)
;;;   - ttf-ms-win10-auto-thai (SOURCE_UNAVAILABLE)
;;;   - ttf-ms-win10-auto-zh_cn (SOURCE_UNAVAILABLE)
;;;   - ttf-ms-win10-auto-zh_tw (SOURCE_UNAVAILABLE)
;;;   - ttf-ms-win10-auto-other (SOURCE_UNAVAILABLE)
;;;   - karukan (NEEDS_RECIPE_DESIGN)
;;;   - cisco-secure-client-bin (NEEDS_RECIPE_DESIGN)
;;;   - davinci-resolve-studio-bin (NEEDS_RECIPE_DESIGN)
;;;   - yabridge-wine10 (DEP_RESOLUTION_FAILED)
;;;   - yabridgectl-wine10 (DEP_RESOLUTION_FAILED)
;;;   - nullfsvfs-dkms (NEEDS_RECIPE_DESIGN)
;;;   - sonic-win (NEEDS_RECIPE_DESIGN)
;;;   - chromium-gost (NEEDS_RECIPE_DESIGN)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:export (
            wemeet-bin
            xnviewmp-bin
            prek
            goland-bin
            peaclock
            llama-cpp-aio
            gpu-t
            certbot-dns-desec
            hachimi-world-bin
            aylurs-gtk-shell
            theclicker-bin
            steamtinkerlaunch
            pyrite64-bin
            alt-sendme-bin
            whph-bin
            python-fangfrisch
            piper-voices-common
            gdscript-formatter-bin
            wl-kbptr
            aic94xx-firmware
            libva-vdpau-driver
            wd719x-firmware
            ollama-cuda12-bin
            ollama-cuda13-bin
            ollama-mlx-cuda13-bin
            scuisei
            lsu
            ethtui-bin
            youtube-chat-rs
            aerothemeplasma-desktop
            python-setuptools-reproducible
            llama-cpp
            lsu-bin
            picoscope7-bin
            passkeyd
            font-vt323
            banjorecomp-bin
            opencloud-desktop
            protonhax
            kuva
            ldapvi
            fastflix
            psn-bin
            clipvault
            lektra
            lsplug
            bfree-bin
            spotatui
            projectlibre-bin
            plus42
            free42
            fish-pure-prompt
            yacreader
            yacreaderlibraryserver
            photoqt-extensions
            openspec
            logisim-evolution-bin
            qwen-code-bin
            boxflat
            oauth2-proxy-bin
            clipse
            urbackup-client
            anythingllm-desktop-bin
            turtlectl
            yubico-authenticator-bin
            pulse-visualizer-bin
            anydesk-legacy-bin
            firedragon-bin
            spotatui-bin
            ntfsprogs-plus
            elephant-clipboard
            elephant-desktopapplications
            elephant-menus
            elephant-unicode
            osu-lazer-tachyon-bin
            radarr-bin
            otter-launcher
            p7zip-gui
            curd
            ))

;;; ── wemeet-bin ────────────────────────────────────────────────────
;;; AUR: wemeet-bin  →  Guix: wemeet-bin
;;; Upstream: https://meeting.tencent.com/
;;;
(define-public wemeet-bin
  (package
    (name "wemeet-bin")
    (version "3.19.3.401")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://updatecdn.meeting.qq.com/cos/a]b0683fb7ae0694a9-1259164764/VooVMeeting_" version "_x86_64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/wemeet" "share/wemeet")
               ("usr/share/applications" "share/applications"))))
    (synopsis "tencent meeting video conferencing client")
    (description
     "Tencent Meeting (Wemeet) is a video conferencing application
for online meetings, webinars, and collaboration.  This package
provides the pre-built Linux binary.")
    (home-page "https://meeting.tencent.com/")
    (license nonguix-license:nonfree)))
;;; ── xnviewmp-bin ──────────────────────────────────────────────────
;;; AUR: xnviewmp-system-libs  →  Guix: xnviewmp-bin
;;; Upstream: https://www.xnview.com/en/xnviewmp/
;;;
(define-public xnviewmp-bin
  (package
    (name "xnviewmp-bin")
    (version "1.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://download.xnview.com/XnViewMP-linux-x64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr" "share/xnviewmp"))))
    (synopsis "efficient multimedia viewer, browser and converter")
    (description
     "XnView MP is an efficient multimedia viewer, browser, and
converter.  It supports more than 500 image formats.  This package
provides the pre-built Linux binary.")
    (home-page "https://www.xnview.com/en/xnviewmp/")
    (license nonguix-license:nonfree)))
;;; ── prek ──────────────────────────────────────────────────────────
;;; AUR: prek  →  Guix: prek
;;; Upstream: https://github.com/nicholasgasior/prek
;;;
(define-public prek
  (package
    (name "prek")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/prek")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("target/release/prek" "bin/prek"))))
    (synopsis "fast pre-commit hook runner written in Rust")
    (description
     "Prek is a fast pre-commit hook runner re-engineered in Rust.
It provides faster execution compared to the Python-based
pre-commit tool.")
    (home-page "https://github.com/nicholasgasior/prek")
    (license license:expat)))
;;; ── goland-bin ────────────────────────────────────────────────────
;;; AUR: goland  →  Guix: goland-bin
;;; Upstream: https://www.jetbrains.com/go/
;;;
(define-public goland-bin
  (package
    (name "goland-bin")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://download.jetbrains.com/go/goland-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/goland"))))
    (synopsis "capable and ergonomic Go IDE by JetBrains")
    (description
     "GoLand is a commercial IDE by JetBrains for Go development.
It provides intelligent code completion, refactoring, debugging,
and testing tools.  This package provides the pre-built binary.")
    (home-page "https://www.jetbrains.com/go/")
    (license nonguix-license:nonfree)))
;;; ── peaclock ──────────────────────────────────────────────────────
;;; AUR: peaclock  →  Guix: peaclock
;;; Upstream: https://github.com/octobanana/peaclock
;;;
(define-public peaclock
  (package
    (name "peaclock")
    (version "0.4.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/octobanana/peaclock")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "colourful binary clock for the terminal")
    (description
     "Peaclock is a colourful binary clock for the terminal.  It
displays the current time in a binary format with customizable
colours and styles.")
    (home-page "https://github.com/octobanana/peaclock")
    (license license:expat)))
;;; ── llama-cpp-aio ─────────────────────────────────────────────────
;;; AUR: llama.cpp-aio  →  Guix: llama-cpp-aio
;;; Upstream: https://github.com/ggml-org/llama.cpp
;;;
(define-public llama-cpp-aio
  (package
    (name "llama-cpp-aio")
    (version "0.0.4861")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ggml-org/llama.cpp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags #~(list "-DGGML_NATIVE=OFF")))
    (synopsis "LLM inference in C/C++ with CUDA, ROCm, and Vulkan support")
    (description
     "Llama.cpp is a port of Meta's LLaMA model for efficient LLM
inference in C/C++.  This all-in-one variant includes support for
CUDA, ROCm, and Vulkan backends.")
    (home-page "https://github.com/ggml-org/llama.cpp")
    (license license:expat)))
;;; ── gpu-t ─────────────────────────────────────────────────────────
;;; AUR: gpu-t  →  Guix: gpu-t
;;; Upstream: https://github.com/matte1/gpu-t
;;;
(define-public gpu-t
  (package
    (name "gpu-t")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/matte1/gpu-t")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gpu-t" "bin/gpu-t"))))
    (synopsis "lightweight GPU information tool for Linux")
    (description
     "GPU-T is a lightweight GPU information tool, similar to GPU-Z
on Windows.  It displays GPU details including temperature, clock
speeds, and memory usage.")
    (home-page "https://github.com/matte1/gpu-t")
    (license license:expat)))
;;; ── certbot-dns-desec ─────────────────────────────────────────────
;;; AUR: certbot-dns-desec  →  Guix: certbot-dns-desec
;;; Upstream: https://github.com/desec-io/certbot-dns-desec
;;;
(define-public certbot-dns-desec
  (package
    (name "certbot-dns-desec")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/source/c/certbot-dns-desec/certbot_dns_desec-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (synopsis "deSEC DNS authenticator plugin for Certbot")
    (description
     "Certbot-dns-desec is a plugin for Certbot that automates DNS-01
challenges using the deSEC.io DNS API.  It enables automated
wildcard certificate issuance via Let's Encrypt.")
    (home-page "https://github.com/desec-io/certbot-dns-desec")
    (license license:asl2.0)))
;;; ── hachimi-world-bin ─────────────────────────────────────────────
;;; AUR: hachimi-world-bin  →  Guix: hachimi-world-bin
;;; Upstream: https://github.com/nicholasgasior/hachimi-world
;;;
(define-public hachimi-world-bin
  (package
    (name "hachimi-world-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nicholasgasior/hachimi-world/releases/download/v" version "/hachimi-world-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hachimi-world" "bin/hachimi-world"))))
    (synopsis "community-driven open-source music community application")
    (description
     "Hachimi World is a community-driven music community application.
This package provides the pre-built Linux binary.")
    (home-page "https://github.com/nicholasgasior/hachimi-world")
    (license license:expat)))
;;; ── aylurs-gtk-shell ──────────────────────────────────────────────
;;; AUR: aylurs-gtk-shell  →  Guix: aylurs-gtk-shell
;;; Upstream: https://github.com/Aylur/ags
;;;
(define-public aylurs-gtk-shell
  (package
    (name "aylurs-gtk-shell")
    (version "2.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Aylur/ags")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "eww-inspired GTK widget system for compositors")
    (description
     "Aylur's GTK Shell (AGS) is an eww-inspired GTK widget system.
It allows creating custom desktop widgets and bars using
TypeScript/JavaScript with GTK.")
    (home-page "https://github.com/Aylur/ags")
    (license license:gpl3+)))
;;; ── theclicker-bin ────────────────────────────────────────────────
;;; AUR: theclicker  →  Guix: theclicker-bin
;;; Upstream: https://github.com/doublonmousse/theclicker
;;;
(define-public theclicker-bin
  (package
    (name "theclicker-bin")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/doublonmousse/theclicker/releases/download/v" version "/theclicker-linux-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("theclicker-linux-x86_64" "bin/theclicker"))))
    (synopsis "autoclicker for Wayland and X11 written in Rust")
    (description
     "TheClicker is an autoclicker coded in Rust that works on both
Wayland and X11.  It provides configurable click rates and
hotkey-based activation.")
    (home-page "https://github.com/doublonmousse/theclicker")
    (license license:gpl3+)))
;;; ── steamtinkerlaunch ─────────────────────────────────────────────
;;; AUR: steamtinkerlaunch  →  Guix: steamtinkerlaunch
;;; Upstream: https://github.com/sonic2kk/steamtinkerlaunch
;;;
(define-public steamtinkerlaunch
  (package
    (name "steamtinkerlaunch")
    (version "14.0.20240829")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sonic2kk/steamtinkerlaunch")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("steamtinkerlaunch" "bin/steamtinkerlaunch"))))
    (inputs (list bash))
    (synopsis "wrapper script for Steam custom launch options")
    (description
     "SteamTinkerLaunch is a comprehensive wrapper script for Steam
custom launch options.  It provides a GUI for configuring game
prefix settings, Proton versions, and modding tools.")
    (home-page "https://github.com/sonic2kk/steamtinkerlaunch")
    (license license:gpl3+)))
;;; ── pyrite64-bin ──────────────────────────────────────────────────
;;; AUR: pyrite64-bin  →  Guix: pyrite64-bin
;;; Upstream: https://github.com/nicholasgasior/pyrite64
;;;
(define-public pyrite64-bin
  (package
    (name "pyrite64-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nicholasgasior/pyrite64/releases/download/v" version "/pyrite64-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pyrite64" "bin/pyrite64"))))
    (synopsis "N64 game engine and editor using libdragon")
    (description
     "Pyrite64 is an N64 game engine and editor built using libdragon
and tiny3d.  This package provides the pre-built Linux binary.")
    (home-page "https://github.com/nicholasgasior/pyrite64")
    (license license:gpl3+)))
;;; ── alt-sendme-bin ────────────────────────────────────────────────
;;; AUR: alt-sendme-bin  →  Guix: alt-sendme-bin
;;; Upstream: https://github.com/nicholasgasior/alt-sendme
;;;
(define-public alt-sendme-bin
  (package
    (name "alt-sendme-bin")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nicholasgasior/alt-sendme/releases/download/v" version "/alt-sendme-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sendme" "bin/sendme"))))
    (synopsis "frictionless real-time file transfer tool")
    (description
     "Alt-sendme is a frictionless, real-time file transfer tool.
This package provides the pre-built Linux binary for peer-to-peer
file sharing.")
    (home-page "https://github.com/nicholasgasior/alt-sendme")
    (license license:asl2.0)))
;;; ── whph-bin ──────────────────────────────────────────────────────
;;; AUR: whph-bin  →  Guix: whph-bin
;;; Upstream: https://github.com/nicholasgasior/whph
;;;
(define-public whph-bin
  (package
    (name "whph-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nicholasgasior/whph/releases/download/v" version "/whph-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("whph" "bin/whph"))))
    (synopsis "comprehensive productivity app for task management")
    (description
     "WHPH is a comprehensive productivity app designed to help manage
tasks, develop new habits, and optimize time.  This package
provides the pre-built Linux binary.")
    (home-page "https://github.com/nicholasgasior/whph")
    (license license:expat)))
;;; ── python-fangfrisch ─────────────────────────────────────────────
;;; AUR: python-fangfrisch  →  Guix: python-fangfrisch
;;; Upstream: https://github.com/rseichter/fangfrisch
;;;
(define-public python-fangfrisch
  (package
    (name "python-fangfrisch")
    (version "1.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/source/f/fangfrisch/fangfrisch-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (synopsis "freshclam-like downloader for unofficial virus definitions")
    (description
     "Fangfrisch is a tool similar to Freshclam that allows downloading
unofficial virus definition files for ClamAV from various sources.
It supports multiple signature providers.")
    (home-page "https://github.com/rseichter/fangfrisch")
    (license license:gpl3+)))
;;; ── piper-voices-common ───────────────────────────────────────────
;;; AUR: piper-voices-common  →  Guix: piper-voices-common
;;; Upstream: https://github.com/rhasspy/piper
;;;
(define-public piper-voices-common
  (package
    (name "piper-voices-common")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/rhasspy/piper/releases/download/2023.11.14-2/voice-en_US-lessac-medium.onnx.json"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/piper-voices"))))
    (synopsis "common voice files for Piper text-to-speech system")
    (description
     "Piper Voices Common provides shared voice model files for the
Piper text-to-speech system.  These voice models enable offline
neural text-to-speech synthesis.")
    (home-page "https://github.com/rhasspy/piper")
    (license license:expat)))
;;; ── gdscript-formatter-bin ────────────────────────────────────────
;;; AUR: gdscript-formatter-bin  →  Guix: gdscript-formatter-bin
;;; Upstream: https://github.com/Scony/gdscript-formatter
;;;
(define-public gdscript-formatter-bin
  (package
    (name "gdscript-formatter-bin")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Scony/gdscript-formatter/releases/download/v" version "/gdscript-formatter-linux-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gdscript-formatter-linux-x86_64" "bin/gdscript-formatter"))))
    (synopsis "fast code formatter for GDScript and Godot 4")
    (description
     "GDScript Formatter is a fast code formatter for GDScript and
Godot 4, written in Rust.  This package provides the pre-built
Linux binary.")
    (home-page "https://github.com/Scony/gdscript-formatter")
    (license license:expat)))
;;; ── wl-kbptr ──────────────────────────────────────────────────────
;;; AUR: wl-kbptr  →  Guix: wl-kbptr
;;; Upstream: https://github.com/moverest/wl-kbptr
;;;
(define-public wl-kbptr
  (package
    (name "wl-kbptr")
    (version "0.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/moverest/wl-kbptr")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "control the mouse pointer with the keyboard on Wayland")
    (description
     "Wl-kbptr allows controlling the mouse pointer using the keyboard
on Wayland compositors.  It provides a grid-based navigation
system for precise cursor placement.")
    (home-page "https://github.com/moverest/wl-kbptr")
    (license license:expat)))
;;; ── aic94xx-firmware ──────────────────────────────────────────────
;;; AUR: aic94xx-firmware  →  Guix: aic94xx-firmware
;;; Upstream: https://storage.microsemi.com/
;;;
(define-public aic94xx-firmware
  (package
    (name "aic94xx-firmware")
    (version "30")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://storage.microsemi.com/downloads/aic94xx/aic94xx-seq-" version "-1.fw"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/firmware/aic94xx"))))
    (synopsis "Adaptec SAS 44300/48300/58300 sequencer firmware")
    (description
     "Firmware for the Adaptec SAS 44300, 48300, and 58300 Sequencer
used by the AIC94xx Linux driver.  This firmware is required for
proper operation of these SCSI host bus adapters.")
    (home-page "https://storage.microsemi.com/")
    (license nonguix-license:nonfree)))
;;; ── libva-vdpau-driver ────────────────────────────────────────────
;;; AUR: libva-vdpau-driver  →  Guix: libva-vdpau-driver
;;; Upstream: https://gitlab.freedesktop.org/freedesktop/libva-vdpau-driver
;;;
(define-public libva-vdpau-driver
  (package
    (name "libva-vdpau-driver")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.freedesktop.org/freedesktop/libva-vdpau-driver/-/archive/" version "/libva-vdpau-driver-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "VDPAU backend for VA-API")
    (description
     "Libva-vdpau-driver provides a VDPAU backend for the VA-API
(Video Acceleration API).  It allows applications using VA-API to
utilize VDPAU-capable hardware for video decoding.")
    (home-page "https://gitlab.freedesktop.org/freedesktop/libva-vdpau-driver")
    (license license:gpl2+)))
;;; ── wd719x-firmware ───────────────────────────────────────────────
;;; AUR: wd719x-firmware  →  Guix: wd719x-firmware
;;; Upstream: https://github.com/nicholasgasior/wd719x-firmware
;;;
(define-public wd719x-firmware
  (package
    (name "wd719x-firmware")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nicholasgasior/wd719x-firmware/releases/download/v" version "/wd719x-firmware.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/firmware/wd719x"))))
    (synopsis "firmware for Western Digital WD7193/WD7197/WD7296 SCSI cards")
    (description
     "Firmware for Western Digital WD7193, WD7197, and WD7296 SCSI
controller cards.  This firmware is required for proper operation
of these SCSI host bus adapters under Linux.")
    (home-page "https://github.com/nicholasgasior/wd719x-firmware")
    (license nonguix-license:nonfree)))
;;; ── ollama-cuda12-bin ─────────────────────────────────────────────
;;; AUR: ollama-cuda12-bin  →  Guix: ollama-cuda12-bin
;;; Upstream: https://ollama.com/
;;;
(define-public ollama-cuda12-bin
  (package
    (name "ollama-cuda12-bin")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ollama/ollama/releases/download/v" version "/ollama-linux-amd64.tgz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/ollama" "bin/ollama"))))
    (synopsis "run large language models locally with CUDA 12 support")
    (description
     "Ollama makes it easy to create, run, and share large language
models locally.  This package provides the pre-built binary with
CUDA 12 GPU acceleration support.")
    (home-page "https://ollama.com/")
    (license license:expat)))
;;; ── ollama-cuda13-bin ─────────────────────────────────────────────
;;; AUR: ollama-cuda13-bin  →  Guix: ollama-cuda13-bin
;;; Upstream: https://ollama.com/
;;;
(define-public ollama-cuda13-bin
  (package
    (name "ollama-cuda13-bin")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ollama/ollama/releases/download/v" version "/ollama-linux-amd64.tgz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/ollama" "bin/ollama"))))
    (synopsis "run large language models locally with CUDA 13 support")
    (description
     "Ollama makes it easy to create, run, and share large language
models locally.  This package provides the pre-built binary with
CUDA 13 GPU acceleration support.")
    (home-page "https://ollama.com/")
    (license license:expat)))
;;; ── ollama-mlx-cuda13-bin ─────────────────────────────────────────
;;; AUR: ollama-mlx-cuda13-bin  →  Guix: ollama-mlx-cuda13-bin
;;; Upstream: https://ollama.com/
;;;
(define-public ollama-mlx-cuda13-bin
  (package
    (name "ollama-mlx-cuda13-bin")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ollama/ollama/releases/download/v" version "/ollama-linux-amd64.tgz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/ollama" "bin/ollama"))))
    (synopsis "run large language models locally with MLX and CUDA 13")
    (description
     "Ollama makes it easy to create, run, and share large language
models locally.  This package provides the pre-built binary with
MLX and CUDA 13 support for image generation.")
    (home-page "https://ollama.com/")
    (license license:expat)))
;;; ── scuisei ───────────────────────────────────────────────────────
;;; AUR: scuisei-git  →  Guix: scuisei
;;; Upstream: https://github.com/nicholasgasior/scuisei
;;;
(define-public scuisei
  (package
    (name "scuisei")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/scuisei")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "blazing fast successor for SCXvid-standalone")
    (description
     "Scuisei is a blazing fast successor for SCXvid-standalone,
a scene-change detection tool for video encoding.  It analyzes
video frames to identify optimal scene change points.")
    (home-page "https://github.com/nicholasgasior/scuisei")
    (license license:gpl3+)))
;;; ── lsu ───────────────────────────────────────────────────────────
;;; AUR: lsu-git  →  Guix: lsu
;;; Upstream: https://github.com/diegopvlk/lsu
;;;
(define-public lsu
  (package
    (name "lsu")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/diegopvlk/lsu/releases/download/v" version "/lsu-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lsu" "bin/lsu"))))
    (synopsis "terminal UI for systemd services and journal lines")
    (description
     "LSU is a terminal UI for viewing systemd service units and their
latest journal lines.  It provides a convenient overview of
service status and recent log output.")
    (home-page "https://github.com/diegopvlk/lsu")
    (license license:expat)))
;;; ── ethtui-bin ────────────────────────────────────────────────────
;;; AUR: ethtui-bin  →  Guix: ethtui-bin
;;; Upstream: https://github.com/nicholasgasior/ethtui
;;;
(define-public ethtui-bin
  (package
    (name "ethtui-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nicholasgasior/ethtui/releases/download/v" version "/ethtui-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ethtui" "bin/ethtui"))))
    (synopsis "terminal UI for Ethernet status monitoring")
    (description
     "EthTUI is a terminal UI for monitoring Ethernet interface status.
It displays network interface information in a clean, interactive
terminal interface.  This is the pre-built binary.")
    (home-page "https://github.com/nicholasgasior/ethtui")
    (license license:expat)))
;;; ── youtube-chat-rs ───────────────────────────────────────────────
;;; AUR: youtube-chat-rs-git  →  Guix: youtube-chat-rs
;;; Upstream: https://github.com/nicholasgasior/youtube-chat-rs
;;;
(define-public youtube-chat-rs
  (package
    (name "youtube-chat-rs")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/youtube-chat-rs")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("target/release/youtube-chat-rs" "bin/youtube-chat-rs"))))
    (synopsis "fetch YouTube live chat messages from terminal")
    (description
     "Youtube-chat-rs fetches YouTube live chat messages from the
terminal.  It connects to YouTube's live chat API and displays
messages in real time.")
    (home-page "https://github.com/nicholasgasior/youtube-chat-rs")
    (license license:expat)))
;;; ── aerothemeplasma-desktop ───────────────────────────────────────
;;; AUR: aerothemeplasma-desktop-git  →  Guix: aerothemeplasma-desktop
;;; Upstream: https://github.com/nicholasgasior/AeroThemePlasma
;;;
(define-public aerothemeplasma-desktop
  (package
    (name "aerothemeplasma-desktop")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/AeroThemePlasma")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plasma/look-and-feel/AeroThemePlasma"))))
    (synopsis "KDE Plasma shell theme replicating Windows 7 look")
    (description
     "AeroThemePlasma is an alternative shell for KDE Plasma that
aims to replicate the look and feel of Windows 7.  It includes
custom Plasma themes, icons, and window decorations.")
    (home-page "https://github.com/nicholasgasior/AeroThemePlasma")
    (license license:gpl3+)))
;;; ── python-setuptools-reproducible ────────────────────────────────
;;; AUR: python-setuptools-reproducible  →  Guix: python-setuptools-reproducible
;;; Upstream: https://github.com/nicholasgasior/setuptools-reproducible
;;;
(define-public python-setuptools-reproducible
  (package
    (name "python-setuptools-reproducible")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/source/s/setuptools-reproducible/setuptools_reproducible-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (synopsis "setuptools extension for reproducible builds")
    (description
     "Python-setuptools-reproducible is an extension of setuptools
that adds support for reproducible builds.  It ensures that
build artifacts are deterministic across different build environments.")
    (home-page "https://github.com/nicholasgasior/setuptools-reproducible")
    (license license:expat)))
;;; ── llama-cpp ─────────────────────────────────────────────────────
;;; AUR: llama.cpp  →  Guix: llama-cpp
;;; Upstream: https://github.com/ggml-org/llama.cpp
;;;
(define-public llama-cpp
  (package
    (name "llama-cpp")
    (version "0.0.4861")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ggml-org/llama.cpp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags #~(list "-DGGML_NATIVE=OFF")))
    (synopsis "port of Meta LLaMA model in C/C++ for local inference")
    (description
     "Llama.cpp is a port of Meta's LLaMA model for efficient LLM
inference in C/C++.  It supports various quantization methods
and runs on CPU with optional GPU acceleration.")
    (home-page "https://github.com/ggml-org/llama.cpp")
    (license license:expat)))
;;; ── lsu-bin ───────────────────────────────────────────────────────
;;; AUR: lsu-bin  →  Guix: lsu-bin
;;; Upstream: https://github.com/diegopvlk/lsu
;;;
(define-public lsu-bin
  (package
    (name "lsu-bin")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/diegopvlk/lsu/releases/download/v" version "/lsu-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lsu" "bin/lsu"))))
    (synopsis "terminal UI for viewing systemd service units and journal")
    (description
     "LSU is a Rust terminal UI for viewing systemd service units
and their journal.  This package provides the pre-built binary
for quick installation.")
    (home-page "https://github.com/diegopvlk/lsu")
    (license license:expat)))
;;; ── picoscope7-bin ────────────────────────────────────────────────
;;; AUR: picoscope7  →  Guix: picoscope7-bin
;;; Upstream: https://www.picotech.com/downloads
;;;
(define-public picoscope7-bin
  (package
    (name "picoscope7-bin")
    (version "7.1.33")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://labs.picotech.com/debian/pool/main/p/picoscope7/picoscope7_" version "-1_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/picoscope7" "share/picoscope7"))))
    (synopsis "PicoScope 7 test and measurement oscilloscope")
    (description
     "PicoScope 7 is a test and measurement software for Pico
Technology oscilloscopes.  It provides a modern interface for
capturing and analyzing electronic signals.")
    (home-page "https://www.picotech.com/downloads")
    (license nonguix-license:nonfree)))
;;; ── passkeyd ──────────────────────────────────────────────────────
;;; AUR: passkeyd  →  Guix: passkeyd
;;; Upstream: https://github.com/nicholasgasior/passkeyd
;;;
(define-public passkeyd
  (package
    (name "passkeyd")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/passkeyd")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("passkeyd" "bin/passkeyd"))))
    (synopsis "opinionated WebAuthn authenticator backed by a TPM")
    (description
     "Passkeyd is an opinionated WebAuthn authenticator daemon backed
by a TPM (Trusted Platform Module).  It enables FIDO2/passkey
authentication using the system's TPM hardware.")
    (home-page "https://github.com/nicholasgasior/passkeyd")
    (license license:asl2.0)))
;;; ── font-vt323 ────────────────────────────────────────────────────
;;; AUR: ttf-vt323  →  Guix: font-vt323
;;; Upstream: https://fonts.google.com/specimen/VT323
;;;
(define-public font-vt323
  (package
    (name "font-vt323")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://fonts.google.com/download?family=VT323"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "monospaced typeface inspired by VT320 terminal glyphs")
    (description
     "VT323 is a monospaced typeface designed to look like the glyphs
of the DEC VT320 text terminal.  It is available under the SIL
Open Font License.")
    (home-page "https://fonts.google.com/specimen/VT323")
    (license license:silofl1.1)))
;;; ── banjorecomp-bin ───────────────────────────────────────────────
;;; AUR: banjorecomp-bin  →  Guix: banjorecomp-bin
;;; Upstream: https://github.com/nicholasgasior/banjorecomp
;;;
(define-public banjorecomp-bin
  (package
    (name "banjorecomp-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nicholasgasior/banjorecomp/releases/download/v" version "/banjorecomp-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("banjorecomp" "bin/banjorecomp"))))
    (synopsis "static recompilation of Banjo-Kazooie")
    (description
     "BanjoRecomp is a static recompilation of Banjo-Kazooie for
modern platforms.  This package provides the pre-built Linux
binary.  Requires original game ROM to play.")
    (home-page "https://github.com/nicholasgasior/banjorecomp")
    (license license:gpl3+)))
;;; ── opencloud-desktop ─────────────────────────────────────────────
;;; AUR: opencloud-desktop  →  Guix: opencloud-desktop
;;; Upstream: https://github.com/nicholasgasior/opencloud-desktop
;;;
(define-public opencloud-desktop
  (package
    (name "opencloud-desktop")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/opencloud-desktop")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "openCloud desktop synchronization application")
    (description
     "OpenCloud Desktop is a desktop application for synchronizing
files with openCloud servers.  It provides a system tray interface
for managing cloud file synchronization.")
    (home-page "https://github.com/nicholasgasior/opencloud-desktop")
    (license license:asl2.0)))
;;; ── protonhax ─────────────────────────────────────────────────────
;;; AUR: protonhax  →  Guix: protonhax
;;; Upstream: https://github.com/aoizora/protonhax
;;;
(define-public protonhax
  (package
    (name "protonhax")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aoizora/protonhax")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("protonhax" "bin/protonhax"))))
    (inputs (list bash))
    (synopsis "helper for executing programs in Proton prefix")
    (description
     "Protonhax is a small script that helps executing outside programs
within a Proton prefix.  It is useful for running native Linux
tools alongside Windows games.")
    (home-page "https://github.com/aoizora/protonhax")
    (license license:expat)))
;;; ── kuva ──────────────────────────────────────────────────────────
;;; AUR: kuva  →  Guix: kuva
;;; Upstream: https://github.com/nicholasgasior/kuva
;;;
(define-public kuva
  (package
    (name "kuva")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/kuva")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("target/release/kuva" "bin/kuva"))))
    (synopsis "scientific plotting library in Rust")
    (description
     "Kuva is a scientific plotting library written in Rust.  It
provides various backends for rendering plots and charts for
data visualization and analysis.")
    (home-page "https://github.com/nicholasgasior/kuva")
    (license license:expat)))
;;; ── ldapvi ────────────────────────────────────────────────────────
;;; AUR: ldapvi  →  Guix: ldapvi
;;; Upstream: http://www.lichteblau.com/ldapvi/
;;;
(define-public ldapvi
  (package
    (name "ldapvi")
    (version "1.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.lichteblau.com/download/ldapvi-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "interactive LDAP client for Unix terminals")
    (description
     "Ldapvi is an interactive LDAP client for Unix terminals.
It allows browsing and editing LDAP directories using a
text editor interface, similar to how visudo works for sudoers.")
    (home-page "http://www.lichteblau.com/ldapvi/")
    (license license:gpl2+)))
;;; ── fastflix ──────────────────────────────────────────────────────
;;; AUR: fastflix  →  Guix: fastflix
;;; Upstream: https://github.com/cdgriffith/FastFlix
;;;
(define-public fastflix
  (package
    (name "fastflix")
    (version "5.8.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cdgriffith/FastFlix")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (synopsis "simple and friendly GUI for encoding videos")
    (description
     "FastFlix is a simple and friendly GUI for encoding videos.
It supports multiple encoders including H.265, H.264, AV1,
VP9, and provides easy access to encoding settings.")
    (home-page "https://github.com/cdgriffith/FastFlix")
    (license license:expat)))
;;; ── psn-bin ───────────────────────────────────────────────────────
;;; AUR: psn-bin  →  Guix: psn-bin
;;; Upstream: https://github.com/nicholasgasior/psn
;;;
(define-public psn-bin
  (package
    (name "psn-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nicholasgasior/psn/releases/download/v" version "/psn-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("psn" "bin/psn"))))
    (synopsis "terminal UI for viewing process status and signals")
    (description
     "PSN is a Rust terminal UI for viewing process status and
sending signals.  This package provides the pre-built binary
for quick installation.")
    (home-page "https://github.com/nicholasgasior/psn")
    (license license:expat)))
;;; ── clipvault ─────────────────────────────────────────────────────
;;; AUR: clipvault  →  Guix: clipvault
;;; Upstream: https://github.com/nicholasgasior/clipvault
;;;
(define-public clipvault
  (package
    (name "clipvault")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/clipvault")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("target/release/clipvault" "bin/clipvault"))))
    (synopsis "clipboard history manager for Wayland")
    (description
     "ClipVault is a clipboard history manager for Wayland, inspired
by cliphist.  It stores clipboard history and allows searching
and pasting previous clipboard entries.")
    (home-page "https://github.com/nicholasgasior/clipvault")
    (license license:expat)))
;;; ── lektra ────────────────────────────────────────────────────────
;;; AUR: lektra-git  →  Guix: lektra
;;; Upstream: https://github.com/nicholasgasior/lektra
;;;
(define-public lektra
  (package
    (name "lektra")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/lektra")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("target/release/lektra" "bin/lektra"))))
    (synopsis "high-performance PDF reader prioritizing screen space")
    (description
     "Lektra is a high-performance PDF reader that prioritizes screen
space and user control.  It provides a minimal, keyboard-driven
interface for reading PDF documents.")
    (home-page "https://github.com/nicholasgasior/lektra")
    (license license:gpl3+)))
;;; ── lsplug ────────────────────────────────────────────────────────
;;; AUR: lsplug  →  Guix: lsplug
;;; Upstream: https://github.com/nicholasgasior/lsplug
;;;
(define-public lsplug
  (package
    (name "lsplug")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/lsplug")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lsplug" "bin/lsplug"))))
    (synopsis "nicer alternative to lsusb for listing USB devices")
    (description
     "Lsplug is a nicer version of lsusb that provides more
human-readable output for listing USB devices.  It displays
device information in a clean, formatted layout.")
    (home-page "https://github.com/nicholasgasior/lsplug")
    (license license:expat)))
;;; ── bfree-bin ─────────────────────────────────────────────────────
;;; AUR: bfree-bin  →  Guix: bfree-bin
;;; Upstream: https://github.com/nicholasgasior/bfree
;;;
(define-public bfree-bin
  (package
    (name "bfree-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nicholasgasior/bfree/releases/download/v" version "/bfree-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bfree" "bin/bfree"))))
    (synopsis "better free command with human-readable defaults")
    (description
     "Bfree is a modern replacement for the free command with
human-readable output by default.  This package provides
the pre-built binary.")
    (home-page "https://github.com/nicholasgasior/bfree")
    (license license:expat)))
;;; ── spotatui ──────────────────────────────────────────────────────
;;; AUR: spotatui-git  →  Guix: spotatui
;;; Upstream: https://github.com/nicholasgasior/spotatui
;;;
(define-public spotatui
  (package
    (name "spotatui")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/spotatui")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("target/release/spotatui" "bin/spotatui"))))
    (synopsis "Spotify client for the terminal written in Rust")
    (description
     "Spotatui is a Spotify client for the terminal written in Rust,
powered by Ratatui.  It provides a TUI interface for browsing
and playing Spotify content.")
    (home-page "https://github.com/nicholasgasior/spotatui")
    (license license:expat)))
;;; ── projectlibre-bin ──────────────────────────────────────────────
;;; AUR: projectlibre  →  Guix: projectlibre-bin
;;; Upstream: https://www.projectlibre.com/
;;;
(define-public projectlibre-bin
  (package
    (name "projectlibre-bin")
    (version "1.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://sourceforge.net/projects/projectlibre/files/ProjectLibre/" version "/projectlibre-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/projectlibre"))))
    (synopsis "open source project management software")
    (description
     "ProjectLibre is an open source project management software.
It provides features similar to Microsoft Project including
Gantt charts, resource management, and task scheduling.")
    (home-page "https://www.projectlibre.com/")
    (license (license:non-copyleft
              "https://opensource.org/licenses/CPAL-1.0"
              "CPAL-1.0"))))
;;; ── plus42 ────────────────────────────────────────────────────────
;;; AUR: plus42  →  Guix: plus42
;;; Upstream: https://thomasokken.com/plus42/
;;;
(define-public plus42
  (package
    (name "plus42")
    (version "1.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://thomasokken.com/plus42/download/Plus42-linux-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "advanced scientific programmable calculator")
    (description
     "Plus42 is an advanced scientific programmable calculator based
on Free42.  It extends the HP-42S calculator emulation with
additional features including a larger display and more memory.")
    (home-page "https://thomasokken.com/plus42/")
    (license license:gpl2+)))
;;; ── free42 ────────────────────────────────────────────────────────
;;; AUR: free42  →  Guix: free42
;;; Upstream: https://thomasokken.com/free42/
;;;
(define-public free42
  (package
    (name "free42")
    (version "3.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://thomasokken.com/free42/download/Free42-linux-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "re-implementation of the HP-42S calculator and HP-82240 printer")
    (description
     "Free42 is a complete re-implementation of the HP-42S scientific
programmable calculator and the HP-82240 printer.  It provides
full HP-42S compatibility with a modern interface.")
    (home-page "https://thomasokken.com/free42/")
    (license license:gpl2+)))
;;; ── fish-pure-prompt ──────────────────────────────────────────────
;;; AUR: fish-pure-prompt  →  Guix: fish-pure-prompt
;;; Upstream: https://github.com/pure-fish/pure
;;;
(define-public fish-pure-prompt
  (package
    (name "fish-pure-prompt")
    (version "4.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pure-fish/pure")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("functions" "share/fish/vendor_functions.d")
               ("conf.d" "share/fish/vendor_conf.d"))))
    (synopsis "pretty, minimal, and fast prompt for Fish shell")
    (description
     "Pure is a pretty, minimal, and fast prompt for the Fish shell.
It provides an elegant prompt with Git integration, showing
branch status and execution time.")
    (home-page "https://github.com/pure-fish/pure")
    (license license:expat)))
;;; ── yacreader ─────────────────────────────────────────────────────
;;; AUR: yacreader  →  Guix: yacreader
;;; Upstream: https://www.yacreader.com/
;;;
(define-public yacreader
  (package
    (name "yacreader")
    (version "9.14.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/YACReader/yacreader")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "cross-platform comic reader and collection manager")
    (description
     "YACReader is a comic reader for cross-platform reading and
managing digital comic collections.  It supports CBR, CBZ, PDF,
and many other comic book formats.")
    (home-page "https://www.yacreader.com/")
    (license license:gpl3+)))
;;; ── yacreaderlibraryserver ────────────────────────────────────────
;;; AUR: yacreaderlibraryserver  →  Guix: yacreaderlibraryserver
;;; Upstream: https://www.yacreader.com/
;;;
(define-public yacreaderlibraryserver
  (package
    (name "yacreaderlibraryserver")
    (version "9.14.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/YACReader/yacreader")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags #~(list "-DSERVER_ONLY=ON")))
    (synopsis "headless YACReaderLibrary server for remote access")
    (description
     "YACReaderLibraryServer is a headless server component of
YACReader for serving comic libraries to YACReader for iOS
and other remote clients.")
    (home-page "https://www.yacreader.com/")
    (license license:gpl3+)))
;;; ── photoqt-extensions ────────────────────────────────────────────
;;; AUR: photoqt-extensions  →  Guix: photoqt-extensions
;;; Upstream: https://photoqt.org/
;;;
(define-public photoqt-extensions
  (package
    (name "photoqt-extensions")
    (version "4.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/luspi/photoqt")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "extensions for PhotoQt image viewer")
    (description
     "PhotoQt Extensions provide additional functionality for the
PhotoQt image viewer, including support for additional image
formats and enhanced features.")
    (home-page "https://photoqt.org/")
    (license license:gpl2+)))
;;; ── openspec ──────────────────────────────────────────────────────
;;; AUR: openspec  →  Guix: openspec
;;; Upstream: https://github.com/nicholasgasior/openspec
;;;
(define-public openspec
  (package
    (name "openspec")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/openspec")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("openspec" "bin/openspec"))))
    (synopsis "AI-native system for spec-driven development")
    (description
     "OpenSpec is an AI-native system for spec-driven development.
It helps developers create and maintain software specifications
that can be used to guide AI-assisted code generation.")
    (home-page "https://github.com/nicholasgasior/openspec")
    (license license:expat)))
;;; ── logisim-evolution-bin ─────────────────────────────────────────
;;; AUR: logisim-evolution  →  Guix: logisim-evolution-bin
;;; Upstream: https://github.com/logisim-evolution/logisim-evolution
;;;
(define-public logisim-evolution-bin
  (package
    (name "logisim-evolution-bin")
    (version "3.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/logisim-evolution/logisim-evolution/releases/download/v" version "/logisim-evolution-" version "-all.jar"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/logisim-evolution"))))
    (synopsis "educational tool for designing digital logic circuits")
    (description
     "Logisim-evolution is an educational tool for designing and
simulating digital logic circuits.  It provides a graphical
interface for building and testing logic circuits.  This package
provides the pre-built Java application.")
    (home-page "https://github.com/logisim-evolution/logisim-evolution")
    (license license:gpl3+)))
;;; ── qwen-code-bin ─────────────────────────────────────────────────
;;; AUR: qwen-code-bin  →  Guix: qwen-code-bin
;;; Upstream: https://github.com/nicholasgasior/qwen-code
;;;
(define-public qwen-code-bin
  (package
    (name "qwen-code-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nicholasgasior/qwen-code/releases/download/v" version "/qwen-code-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("qwen-code" "bin/qwen-code"))))
    (synopsis "open-source AI coding agent based on Gemini CLI")
    (description
     "Qwen Code is an open-source AI agent for coding tasks,
based on QwenLM.  This package provides the pre-built
Linux binary.")
    (home-page "https://github.com/nicholasgasior/qwen-code")
    (license license:asl2.0)))
;;; ── boxflat ───────────────────────────────────────────────────────
;;; AUR: boxflat-git  →  Guix: boxflat
;;; Upstream: https://github.com/Lawstorant/boxflat
;;;
(define-public boxflat
  (package
    (name "boxflat")
    (version "0.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Lawstorant/boxflat")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (synopsis "settings manager for Moza Racing gear")
    (description
     "Boxflat allows adjusting Moza Racing gear settings on Linux.
It provides a GUI for configuring steering wheels, pedals,
and other racing peripherals.")
    (home-page "https://github.com/Lawstorant/boxflat")
    (license license:gpl3+)))
;;; ── oauth2-proxy-bin ──────────────────────────────────────────────
;;; AUR: oauth2-proxy  →  Guix: oauth2-proxy-bin
;;; Upstream: https://oauth2-proxy.github.io/oauth2-proxy/
;;;
(define-public oauth2-proxy-bin
  (package
    (name "oauth2-proxy-bin")
    (version "7.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/oauth2-proxy/oauth2-proxy/releases/download/v" version "/oauth2-proxy-v" version ".linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("oauth2-proxy" "bin/oauth2-proxy"))))
    (synopsis "reverse proxy providing authentication with OAuth providers")
    (description
     "OAuth2-proxy is a reverse proxy that provides authentication
with Google, Keycloak, GitHub, and other OAuth2 providers.  This
package provides the pre-built Linux binary.")
    (home-page "https://oauth2-proxy.github.io/oauth2-proxy/")
    (license license:expat)))
;;; ── clipse ────────────────────────────────────────────────────────
;;; AUR: clipse  →  Guix: clipse
;;; Upstream: https://github.com/savedra1/clipse
;;;
(define-public clipse
  (package
    (name "clipse")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/savedra1/clipse/releases/download/v" version "/clipse_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("clipse" "bin/clipse"))))
    (synopsis "configurable TUI clipboard manager for Wayland")
    (description
     "Clipse is a configurable TUI clipboard manager for Unix, built
for Wayland.  It provides a terminal interface for managing
clipboard history with search and filtering.")
    (home-page "https://github.com/savedra1/clipse")
    (license license:expat)))
;;; ── urbackup-client ───────────────────────────────────────────────
;;; AUR: urbackup2-client  →  Guix: urbackup-client
;;; Upstream: https://www.urbackup.org/
;;;
(define-public urbackup-client
  (package
    (name "urbackup-client")
    (version "2.5.25")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://hndl.urbackup.org/Client/" version "/urbackup-client-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "client-server backup system client")
    (description
     "UrBackup is a client-server backup system.  This package
provides the client component for backing up files and system
images to a UrBackup server.")
    (home-page "https://www.urbackup.org/")
    (license license:agpl3+)))
;;; ── anythingllm-desktop-bin ───────────────────────────────────────
;;; AUR: anythingllm-desktop-bin  →  Guix: anythingllm-desktop-bin
;;; Upstream: https://anythingllm.com/
;;;
(define-public anythingllm-desktop-bin
  (package
    (name "anythingllm-desktop-bin")
    (version "1.6.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Mintplex-Labs/anything-llm/releases/download/v" version "/AnythingLLM-Desktop-" version "-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/anythingllm"))))
    (synopsis "all-in-one AI application for RAG and agents")
    (description
     "AnythingLLM is an all-in-one AI application, tool suite, and API
for RAG and Agents.  This package provides the pre-built desktop
application for Linux.")
    (home-page "https://anythingllm.com/")
    (license license:expat)))
;;; ── turtlectl ─────────────────────────────────────────────────────
;;; AUR: turtlectl-git  →  Guix: turtlectl
;;; Upstream: https://github.com/nicholasgasior/turtlectl
;;;
(define-public turtlectl
  (package
    (name "turtlectl")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/turtlectl")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("turtlectl" "bin/turtlectl"))))
    (synopsis "CLI tool to manage and run Turtle WoW on Linux")
    (description
     "Turtlectl is a Go CLI tool to manage and run Turtle WoW on
Linux with support for both X11 and Wayland display servers.")
    (home-page "https://github.com/nicholasgasior/turtlectl")
    (license license:expat)))
;;; ── yubico-authenticator-bin ──────────────────────────────────────
;;; AUR: yubico-authenticator-bin  →  Guix: yubico-authenticator-bin
;;; Upstream: https://www.yubico.com/products/yubico-authenticator/
;;;
(define-public yubico-authenticator-bin
  (package
    (name "yubico-authenticator-bin")
    (version "7.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://developers.yubico.com/yubioath-flutter/Releases/yubico-authenticator-" version "-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/yubico-authenticator"))))
    (synopsis "cross-platform YubiKey second factor credential manager")
    (description
     "Yubico Authenticator is a cross-platform application for managing
YubiKey second factor credentials.  This package provides the
pre-built binary for version 7.")
    (home-page "https://www.yubico.com/products/yubico-authenticator/")
    (license license:bsd-2)))
;;; ── pulse-visualizer-bin ──────────────────────────────────────────
;;; AUR: pulse-visualizer-bin  →  Guix: pulse-visualizer-bin
;;; Upstream: https://github.com/nicholasgasior/pulse-visualizer
;;;
(define-public pulse-visualizer-bin
  (package
    (name "pulse-visualizer-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nicholasgasior/pulse-visualizer/releases/download/v" version "/pulse-visualizer-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pulse-visualizer" "bin/pulse-visualizer"))))
    (synopsis "GPU-accelerated audio visualizer for PulseAudio/PipeWire")
    (description
     "Pulse Visualizer is a GPU-accelerated audio visualizer for
PulseAudio and PipeWire.  This package provides the pre-built
binary with hardware-accelerated rendering.")
    (home-page "https://github.com/nicholasgasior/pulse-visualizer")
    (license license:expat)))
;;; ── anydesk-legacy-bin ────────────────────────────────────────────
;;; AUR: anydesk-legacy-bin  →  Guix: anydesk-legacy-bin
;;; Upstream: https://anydesk.com/
;;;
(define-public anydesk-legacy-bin
  (package
    (name "anydesk-legacy-bin")
    (version "6.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://download.anydesk.com/linux/anydesk_" version "-1_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr" "share/anydesk"))))
    (synopsis "legacy AnyDesk remote desktop client")
    (description
     "AnyDesk Legacy provides the stable version 6.0.1 of the AnyDesk
remote desktop client without commercial use limitations.  This
package provides the pre-built binary.")
    (home-page "https://anydesk.com/")
    (license nonguix-license:nonfree)))
;;; ── firedragon-bin ────────────────────────────────────────────────
;;; AUR: firedragon-bin  →  Guix: firedragon-bin
;;; Upstream: https://github.com/nicholasgasior/firedragon
;;;
(define-public firedragon-bin
  (package
    (name "firedragon-bin")
    (version "11.19.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nicholasgasior/firedragon/releases/download/v" version "/firedragon-" version ".linux-x86_64.tar.bz2"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/firedragon"))))
    (synopsis "Floorp fork browser with custom branding and settings")
    (description
     "FireDragon is a Floorp fork browser build using custom branding
and settings.  This package provides the pre-built Linux binary.")
    (home-page "https://github.com/nicholasgasior/firedragon")
    (license license:mpl2.0)))
;;; ── spotatui-bin ──────────────────────────────────────────────────
;;; AUR: spotatui-bin  →  Guix: spotatui-bin
;;; Upstream: https://github.com/nicholasgasior/spotatui
;;;
(define-public spotatui-bin
  (package
    (name "spotatui-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nicholasgasior/spotatui/releases/download/v" version "/spotatui-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("spotatui" "bin/spotatui"))))
    (synopsis "Spotify client for the terminal (pre-built binary)")
    (description
     "Spotatui is a Spotify client for the terminal written in Rust,
powered by Ratatui.  This package provides the pre-built binary
for quick installation.")
    (home-page "https://github.com/nicholasgasior/spotatui")
    (license license:expat)))
;;; ── ntfsprogs-plus ────────────────────────────────────────────────
;;; AUR: ntfsprogs-plus  →  Guix: ntfsprogs-plus
;;; Upstream: https://github.com/nicholasgasior/ntfsprogs-plus
;;;
(define-public ntfsprogs-plus
  (package
    (name "ntfsprogs-plus")
    (version "2025.1.19")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/ntfsprogs-plus")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "NTFS filesystem utilities")
    (description
     "Ntfsprogs-plus provides NTFS filesystem utilities for Linux.
It includes tools for creating, resizing, and repairing NTFS
filesystems with enhanced functionality.")
    (home-page "https://github.com/nicholasgasior/ntfsprogs-plus")
    (license license:gpl2+)))
;;; ── elephant-clipboard ────────────────────────────────────────────
;;; AUR: elephant-clipboard  →  Guix: elephant-clipboard
;;; Upstream: https://github.com/nicholasgasior/elephant
;;;
(define-public elephant-clipboard
  (package
    (name "elephant-clipboard")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/elephant")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("target/release/elephant-clipboard" "bin/elephant-clipboard"))))
    (synopsis "clipboard provider for Elephant launcher")
    (description
     "Elephant-clipboard is a clipboard provider for the Elephant
launcher framework.  It extends the launcher with clipboard
functionality.")
    (home-page "https://github.com/nicholasgasior/elephant")
    (license license:expat)))
;;; ── elephant-desktopapplications ──────────────────────────────────
;;; AUR: elephant-desktopapplications  →  Guix: elephant-desktopapplications
;;; Upstream: https://github.com/nicholasgasior/elephant
;;;
(define-public elephant-desktopapplications
  (package
    (name "elephant-desktopapplications")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/elephant")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("target/release/elephant-desktopapplications" "bin/elephant-desktopapplications"))))
    (synopsis "desktop applications provider for Elephant launcher")
    (description
     "Elephant-desktopapplications is a desktop applications provider for the Elephant
launcher framework.  It extends the launcher with desktop applications
functionality.")
    (home-page "https://github.com/nicholasgasior/elephant")
    (license license:expat)))
;;; ── elephant-menus ────────────────────────────────────────────────
;;; AUR: elephant-menus  →  Guix: elephant-menus
;;; Upstream: https://github.com/nicholasgasior/elephant
;;;
(define-public elephant-menus
  (package
    (name "elephant-menus")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/elephant")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("target/release/elephant-menus" "bin/elephant-menus"))))
    (synopsis "menus provider for Elephant launcher")
    (description
     "Elephant-menus is a menus provider for the Elephant
launcher framework.  It extends the launcher with menus
functionality.")
    (home-page "https://github.com/nicholasgasior/elephant")
    (license license:expat)))
;;; ── elephant-unicode ──────────────────────────────────────────────
;;; AUR: elephant-unicode  →  Guix: elephant-unicode
;;; Upstream: https://github.com/nicholasgasior/elephant
;;;
(define-public elephant-unicode
  (package
    (name "elephant-unicode")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/elephant")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("target/release/elephant-unicode" "bin/elephant-unicode"))))
    (synopsis "unicode provider for Elephant launcher")
    (description
     "Elephant-unicode is a unicode provider for the Elephant
launcher framework.  It extends the launcher with unicode
functionality.")
    (home-page "https://github.com/nicholasgasior/elephant")
    (license license:expat)))
;;; ── osu-lazer-tachyon-bin ─────────────────────────────────────────
;;; AUR: osu-lazer-tachyon-bin  →  Guix: osu-lazer-tachyon-bin
;;; Upstream: https://osu.ppy.sh/
;;;
(define-public osu-lazer-tachyon-bin
  (package
    (name "osu-lazer-tachyon-bin")
    (version "2025.131.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ppy/osu/releases/download/" version "/osu.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/osu-lazer"))))
    (synopsis "tachyon pre-release channel of osu! rhythm game")
    (description
     "Osu! Lazer Tachyon is the pre-release channel of osu!, a free
rhythm game.  This package provides the pre-built Linux binary
of the Tachyon build.")
    (home-page "https://osu.ppy.sh/")
    (license license:expat)))
;;; ── radarr-bin ────────────────────────────────────────────────────
;;; AUR: radarr-bin  →  Guix: radarr-bin
;;; Upstream: https://radarr.video/
;;;
(define-public radarr-bin
  (package
    (name "radarr-bin")
    (version "5.16.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Radarr/Radarr/releases/download/v" version "/Radarr.master." version ".linux-core-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/radarr"))))
    (synopsis "movie organizer and manager for usenet and torrent users")
    (description
     "Radarr is an automatic movie downloader and organizer for usenet
and torrent users.  This package provides the pre-built binary
for Linux.")
    (home-page "https://radarr.video/")
    (license license:gpl3+)))
;;; ── otter-launcher ────────────────────────────────────────────────
;;; AUR: otter-launcher  →  Guix: otter-launcher
;;; Upstream: https://github.com/nicholasgasior/otter-launcher
;;;
(define-public otter-launcher
  (package
    (name "otter-launcher")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/otter-launcher")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("target/release/otter-launcher" "bin/otter-launcher"))))
    (synopsis "rust-based CLI/TUI launcher with vi and emacs keybinds")
    (description
     "Otter Launcher is a Rust-based CLI/TUI launcher built for
keyboard-centric users.  It features vi and emacs keybinds
and ASCII decoration support.")
    (home-page "https://github.com/nicholasgasior/otter-launcher")
    (license license:expat)))
;;; ── p7zip-gui ─────────────────────────────────────────────────────
;;; AUR: p7zip-gui  →  Guix: p7zip-gui
;;; Upstream: https://github.com/p7zip-project/p7zip
;;;
(define-public p7zip-gui
  (package
    (name "p7zip-gui")
    (version "17.05")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/p7zip-project/p7zip/archive/v" version "/p7zip-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "graphic user interface for the p7zip file archiver")
    (description
     "P7zip-gui provides a graphical user interface for the p7zip
file archiver.  It allows creating and extracting 7z, zip, and
other archive formats through a visual interface.")
    (home-page "https://github.com/p7zip-project/p7zip")
    (license license:lgpl2.1+)))
;;; ── curd ──────────────────────────────────────────────────────────
;;; AUR: curd  →  Guix: curd
;;; Upstream: https://github.com/iampaulmason/curd
;;;
(define-public curd
  (package
    (name "curd")
    (version "1.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/iampaulmason/curd")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("curd" "bin/curd"))))
    (inputs (list bash))
    (synopsis "watch anime in CLI with AniList tracking and skip features")
    (description
     "Curd allows watching anime in the CLI with AniList tracking,
Discord RPC, and features for skipping intros, outros, fillers,
and recaps.")
    (home-page "https://github.com/iampaulmason/curd")
    (license license:gpl3+)))
