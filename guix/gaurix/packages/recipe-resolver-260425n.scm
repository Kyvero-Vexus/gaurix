;; -*- mode: scheme; coding: utf-8 -*-
;;; recipe-resolver-260425n: 100 packages attempted (100 recipes, 0 blocked)
;;; Generated from AUR PKGBUILDs via queue-drain pass.

(define-module (gaurix packages recipe-resolver-260425n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
   tal-vocoder-vst-bin
   tal-vocoder-clap-bin
   tal-reverb4-vst-bin
   tal-reverb4-clap-bin
   tal-filter2-vst-bin
   tal-filter2-clap-bin
   tal-chorus-lx-vst-bin
   tal-chorus-lx-clap-bin
   mullvad-vpn-daemon-beta-bin
   upscayl-rpm-bin
   lazyorg-bin
   tinydng-cli-bin
   snage-bin
   rapid7-insight-agent-bin
   nping-bin
   imagenie-bin
   compasscad-bin
   azuredatastudio-bin
   pixelflasher-bin
   fcp-bin
   mercury-browser-avx2-bin
   dnote-cli-bin
   gitmux-bin
   hello-http-bin
   thoth-bin
   stew-bin
   open-ecard-app-bin
   mustang-bin
   justniffer-bin
   json-log-viewer-bin
   hollama-bin
   backslash-bin
   roc-nightly-bin
   qradiolink-bin
   nsv-bin
   colloid-gruvbox-gtk-theme-git
   colloid-everforest-gtk-theme-git
   colloid-dracula-gtk-theme-git
   colloid-catppuccin-gtk-theme-git
   zsh-theme-powerlevel10k-bin-git
   mcmojave-cursors
   ubuntu-mate-themes
   chicago95-icon-theme-git
   chicago95-gtk-theme-git
   pop-icon-theme-git
   python-diffusers
   python-papis-scihub-git
   python-pydantic-evals
   python-pydantic-ai-slim
   python-pydantic-ai-examples
   python-pydantic-ai
   python-clai
   python-blivet
   python-espeak-ng
   python-pytest-docker
   python-pymatting
   python-lpips
   python-logfire
   python-jh2-git
   python-electrum-ecc
   consolas-font
   otf-suite
   otf-suit
   otf-new-york
   nerd-fonts-sf-mono-ligatures
   ttf-tahoma
   ttf-win7-fonts
   ttf-ms-win8
   ttf-ms-win8-arabic
   sdl3-ttf-git
   boundary-desktop
   mangoverlay
   supersonic-desktop
   powerline-shell
   lobster-git
   z180emu-git
   daytona
   overwitch
   outline
   update-grub
   remarkable
   sozi-extras-texts2paths
   ls---git
   roccat-tools-savu
   netctl-gui
   loic
   osu-lazer-git
   mkvalidator
   nyancat-git
   auto-reencode
   plasma6-applets-netspeed
   remmina-plugin-ultravnc
   asf-plugin-monitoring
   ncsa-mosaic-git
   vsxu
   cling-jupyter-git
   httpry
   repoctl
   pypy3-pip
   digikam-git
   ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; tal-vocoder-vst-bin — A phase vocoder by TAL Software - VST plugin
(define-public tal-vocoder-vst-bin
  (package
    (name "tal-vocoder-vst-bin")
    (version "3.0.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tal-vocoder-vst-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tal-software.com/products/tal-vocoder")
    (synopsis "a phase vocoder by TAL Software - VST plugin")
    (description "A phase vocoder by TAL Software - VST plugin.")
    (license license:nonfree)))

;;; tal-vocoder-clap-bin — A phase vocoder by TAL Software - CLAP plugin
(define-public tal-vocoder-clap-bin
  (package
    (name "tal-vocoder-clap-bin")
    (version "3.0.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tal-vocoder-clap-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tal-software.com/products/tal-vocoder")
    (synopsis "a phase vocoder by TAL Software - CLAP plugin")
    (description "A phase vocoder by TAL Software - CLAP plugin.")
    (license license:nonfree)))

;;; tal-reverb4-vst-bin — A simple algorithmic reverb V4 by TAL Software - VST plugin
(define-public tal-reverb4-vst-bin
  (package
    (name "tal-reverb4-vst-bin")
    (version "4.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tal-reverb4-vst-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tal-software.com/tal-reverb-4")
    (synopsis "a simple algorithmic reverb V4 by TAL Software - VST plugin")
    (description "A simple algorithmic reverb V4 by TAL Software - VST plugin.")
    (license license:nonfree)))

;;; tal-reverb4-clap-bin — A simple algorithmic reverb V4 by TAL Software - CLAP plugin
(define-public tal-reverb4-clap-bin
  (package
    (name "tal-reverb4-clap-bin")
    (version "4.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tal-reverb4-clap-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tal-software.com/tal-reverb-4")
    (synopsis "a simple algorithmic reverb V4 by TAL Software - CLAP plugin")
    (description "A simple algorithmic reverb V4 by TAL Software - CLAP plugin.")
    (license license:nonfree)))

;;; tal-filter2-vst-bin — A filter V2 by TAL Software - VST plugin
(define-public tal-filter2-vst-bin
  (package
    (name "tal-filter2-vst-bin")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tal-filter2-vst-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tal-software.com/products/tal-filter")
    (synopsis "a filter V2 by TAL Software - VST plugin")
    (description "A filter V2 by TAL Software - VST plugin.")
    (license license:nonfree)))

;;; tal-filter2-clap-bin — A filter V2 by TAL Software - CLAP plugin
(define-public tal-filter2-clap-bin
  (package
    (name "tal-filter2-clap-bin")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tal-filter2-clap-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tal-software.com/products/tal-filter")
    (synopsis "a filter V2 by TAL Software - CLAP plugin")
    (description "A filter V2 by TAL Software - CLAP plugin.")
    (license license:nonfree)))

;;; tal-chorus-lx-vst-bin — A simple algorithmic chorus by TAL Software - VST plugin
(define-public tal-chorus-lx-vst-bin
  (package
    (name "tal-chorus-lx-vst-bin")
    (version "1.6.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tal-chorus-lx-vst-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tal-software.com/products/tal-chorus-lx")
    (synopsis "a simple algorithmic chorus by TAL Software - VST plugin")
    (description "A simple algorithmic chorus by TAL Software - VST plugin.")
    (license license:nonfree)))

;;; tal-chorus-lx-clap-bin — A simple algorithmic chorus by TAL Software - CLAP plugin
(define-public tal-chorus-lx-clap-bin
  (package
    (name "tal-chorus-lx-clap-bin")
    (version "1.6.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tal-chorus-lx-clap-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tal-software.com/products/tal-chorus-lx")
    (synopsis "a simple algorithmic chorus by TAL Software - CLAP plugin")
    (description "A simple algorithmic chorus by TAL Software - CLAP plugin.")
    (license license:nonfree)))

;;; mullvad-vpn-daemon-beta-bin — The Mullvad VPN client app for desktop (beta channel) (daemon and CLI)
(define-public mullvad-vpn-daemon-beta-bin
  (package
    (name "mullvad-vpn-daemon-beta-bin")
    (version "2026.2.beta1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mullvad-vpn-daemon-beta-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.mullvad.net")
    (synopsis "the Mullvad VPN client app for desktop (beta channel) (daemon and CLI)")
    (description "The Mullvad VPN client app for desktop (beta channel) (daemon and CLI).")
    (license license:gpl3+)))

;;; upscayl-rpm-bin — Free and Open Source AI Image Upscaler (binary release, system Electron)
(define-public upscayl-rpm-bin
  (package
    (name "upscayl-rpm-bin")
    (version "2.15.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/upscayl-rpm-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/upscayl/upscayl")
    (synopsis "free and Open Source AI Image Upscaler (binary release, system Electron)")
    (description "Free and Open Source AI Image Upscaler (binary release, system Electron).")
    (license license:agpl3+)))

;;; lazyorg-bin — A simple terminal-based calendar and note-taking application.
(define-public lazyorg-bin
  (package
    (name "lazyorg-bin")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lazyorg-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/HubertBel/lazyorg")
    (synopsis "a simple terminal-based calendar and note-taking application")
    (description "A simple terminal-based calendar and note-taking application.")
    (license license:expat)))

;;; tinydng-cli-bin — Compress DNG to save space without losing visual quality
(define-public tinydng-cli-bin
  (package
    (name "tinydng-cli-bin")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tinydng-cli-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tinydng.com")
    (synopsis "compress DNG to save space without losing visual quality")
    (description "Compress DNG to save space without losing visual quality.")
    (license license:nonfree)))

;;; snage-bin — A tool for managing change logs.
(define-public snage-bin
  (package
    (name "snage-bin")
    (version "0.5.20")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/snage-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FACT-Finder/snage")
    (synopsis "a tool for managing change logs")
    (description "A tool for managing change logs.")
    (license license:expat)))

;;; rapid7-insight-agent-bin — rapid7-insight-agent binary
(define-public rapid7-insight-agent-bin
  (package
    (name "rapid7-insight-agent-bin")
    (version "4.0.8.28")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rapid7-insight-agent-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.rapid7.com/")
    (synopsis "rapid7-insight-agent binary")
    (description "rapid7-insight-agent binary.")
    (license license:nonfree)))

;;; nping-bin — 🏎 Nping mean NB Ping, A Ping Tool in Rust with Real-Time Data and Visualizations
(define-public nping-bin
  (package
    (name "nping-bin")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nping-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hanshuaikang/nping")
    (synopsis "🏎 Nping mean NB Ping, A Ping Tool in Rust with Real-Time Data and Visualizations")
    (description "🏎 Nping mean NB Ping, A Ping Tool in Rust with Real-Time Data and Visualizations.")
    (license license:expat)))

;;; imagenie-bin — AI-powered desktop app for stunning image transformations.(Prebuilt version)
(define-public imagenie-bin
  (package
    (name "imagenie-bin")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/imagenie-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zhongweili/imagenie")
    (synopsis "aI-powered desktop app for stunning image transformations.(Prebuilt version)")
    (description "AI-powered desktop app for stunning image transformations.(Prebuilt version).")
    (license license:expat)))

;;; compasscad-bin — very good CAD software. plan out buildings, and show it off to your boss.(Prebuilt version.Use system-wide electron)
(define-public compasscad-bin
  (package
    (name "compasscad-bin")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/compasscad-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zeankundev/CompassCAD")
    (synopsis "very good CAD software. plan out buildings, and show it off to your boss.(Pre...")
    (description "very good CAD software. plan out buildings, and show it off to your boss.(Prebuilt version.Use system-wide electron).")
    (license license:nonfree)))

;;; azuredatastudio-bin — A data management tool that enables you to work with SQL Server, Azure SQL DB and SQL DW. (final official release)
(define-public azuredatastudio-bin
  (package
    (name "azuredatastudio-bin")
    (version "1.52.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/azuredatastudio-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/microsoft/azuredatastudio")
    (synopsis "a data management tool that enables you to work with SQL Server, Azure SQL DB...")
    (description "A data management tool that enables you to work with SQL Server, Azure SQL DB and SQL DW. (final official release).")
    (license license:nonfree)))

;;; pixelflasher-bin — Pixel phone flashing GUI utility with features.
(define-public pixelflasher-bin
  (package
    (name "pixelflasher-bin")
    (version "9.0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pixelflasher-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/badabing2005/PixelFlasher")
    (synopsis "pixel phone flashing GUI utility with features")
    (description "Pixel phone flashing GUI utility with features.")
    (license license:gpl3+)))

;;; fcp-bin — A significantly faster alternative to the classic Unix cp(1) command
(define-public fcp-bin
  (package
    (name "fcp-bin")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fcp-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/svetlitski/fcp")
    (synopsis "a significantly faster alternative to the classic Unix cp(1) command")
    (description "A significantly faster alternative to the classic Unix cp(1) command.")
    (license license:bsd-3)))

;;; mercury-browser-avx2-bin — Compiler optimized, private Firefox fork - WARNING: Unmaintained and vulnerable to CVE-2024-9680. Use at your own risk!
(define-public mercury-browser-avx2-bin
  (package
    (name "mercury-browser-avx2-bin")
    (version "129.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mercury-browser-avx2-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Alex313031/Mercury")
    (synopsis "compiler optimized, private Firefox fork - WARNING: Unmaintained and vulnerab...")
    (description "Compiler optimized, private Firefox fork - WARNING: Unmaintained and vulnerable to CVE-2024-9680. Use at your own risk!.")
    (license license:mpl2.0)))

;;; dnote-cli-bin — A simple command line notebook for programmers
(define-public dnote-cli-bin
  (package
    (name "dnote-cli-bin")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dnote-cli-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.getdnote.com/")
    (synopsis "a simple command line notebook for programmers")
    (description "A simple command line notebook for programmers.")
    (license license:gpl3)))

;;; gitmux-bin — Git in your tmux status bar
(define-public gitmux-bin
  (package
    (name "gitmux-bin")
    (version "0.11.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gitmux-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/arl/gitmux")
    (synopsis "git in your tmux status bar")
    (description "Git in your tmux status bar.")
    (license license:expat)))

;;; hello-http-bin — HTTP client for testing REST APIs, WebSocket, GraphQL and gRPC endpoints
(define-public hello-http-bin
  (package
    (name "hello-http-bin")
    (version "1.7.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hello-http-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sunny-chung.github.io/hello-http/")
    (synopsis "HTTP client for testing REST APIs, WebSocket, GraphQL and gRPC endpoints")
    (description "HTTP client for testing REST APIs, WebSocket, GraphQL and gRPC endpoints.")
    (license license:asl2.0)))

;;; thoth-bin — Terminal scratchpad inspired by the Heynote app
(define-public thoth-bin
  (package
    (name "thoth-bin")
    (version "0.1.87")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/thoth-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jooaf/thoth")
    (synopsis "terminal scratchpad inspired by the Heynote app")
    (description "Terminal scratchpad inspired by the Heynote app.")
    (license license:expat)))

;;; stew-bin — An independent package manager for compiled binaries
(define-public stew-bin
  (package
    (name "stew-bin")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/stew-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/marwanhawari/stew")
    (synopsis "an independent package manager for compiled binaries")
    (description "An independent package manager for compiled binaries.")
    (license license:expat)))

;;; open-ecard-app-bin — Client side implementation of the eCard-API-Framework (BSI TR-03112) and related international standards, such as ISO/IEC 24727.(Prebuilt version)
(define-public open-ecard-app-bin
  (package
    (name "open-ecard-app-bin")
    (version "2.3.12")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/open-ecard-app-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.openecard.org/")
    (synopsis "client side implementation of the eCard-API-Framework (BSI TR-03112) and rela...")
    (description "Client side implementation of the eCard-API-Framework (BSI TR-03112) and related international standards, such as ISO/IEC 24727.(Prebuilt version).")
    (license license:asl2.0)))

;;; mustang-bin — New full-featured desktop email, chat and video conference client.(Prebuilt version.Use system-wide electron)
(define-public mustang-bin
  (package
    (name "mustang-bin")
    (version "0.9.26")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mustang-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mustang.im/")
    (synopsis "new full-featured desktop email, chat and video conference client.(Prebuilt v...")
    (description "New full-featured desktop email, chat and video conference client.(Prebuilt version.Use system-wide electron).")
    (license license:nonfree)))

;;; justniffer-bin — TCP sniffer. It reassembles and reorders packets and displays the TCP flow in a customizable way.
(define-public justniffer-bin
  (package
    (name "justniffer-bin")
    (version "0.6.12")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/justniffer-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://onotelli.github.io/justniffer/")
    (synopsis "tCP sniffer. It reassembles and reorders packets and displays the TCP flow in...")
    (description "TCP sniffer. It reassembles and reorders packets and displays the TCP flow in a customizable way.")
    (license license:gpl3+)))

;;; json-log-viewer-bin — Interactive viewer for JSON logs.
(define-public json-log-viewer-bin
  (package
    (name "json-log-viewer-bin")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/json-log-viewer-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hedhyw/json-log-viewer")
    (synopsis "interactive viewer for JSON logs")
    (description "Interactive viewer for JSON logs.")
    (license license:expat)))

;;; hollama-bin — A minimal web-UI for talking to Ollama servers.(Prebuilt version.Use system-wide electron)
(define-public hollama-bin
  (package
    (name "hollama-bin")
    (version "0.35.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hollama-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://hollama.fernando.is/")
    (synopsis "a minimal web-UI for talking to Ollama servers.(Prebuilt version.Use system-w...")
    (description "A minimal web-UI for talking to Ollama servers.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))

;;; backslash-bin — A lightning-fast command launcher that helps you launch commands, run apps, and streamline your workflow—all while embracing the quirky spirit of Linux!
(define-public backslash-bin
  (package
    (name "backslash-bin")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/backslash-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/backslash-app/backslash")
    (synopsis "a lightning-fast command launcher that helps you launch commands, run apps, a...")
    (description "A lightning-fast command launcher that helps you launch commands, run apps, and streamline your workflow—all while embracing the quirky spirit of Linux!.")
    (license license:expat)))

;;; roc-nightly-bin — A fast, friendly, functional language. Work in progress!
(define-public roc-nightly-bin
  (package
    (name "roc-nightly-bin")
    (version "2025.09.09.d73ea109")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roc-nightly-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.roc-lang.org")
    (synopsis "a fast, friendly, functional language. Work in progress!")
    (description "A fast, friendly, functional language. Work in progress!.")
    (license license:nonfree)))

;;; qradiolink-bin — Multimode SDR transceiver for GNU radio
(define-public qradiolink-bin
  (package
    (name "qradiolink-bin")
    (version "0.8.11_1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qradiolink-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://qradiolink.org/")
    (synopsis "multimode SDR transceiver for GNU radio")
    (description "Multimode SDR transceiver for GNU radio.")
    (license license:gpl3)))

;;; nsv-bin — No-config semantic versioning
(define-public nsv-bin
  (package
    (name "nsv-bin")
    (version "0.12.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nsv-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/purpleclay/nsv")
    (synopsis "no-config semantic versioning")
    (description "No-config semantic versioning.")
    (license license:expat)))

;;; colloid-gruvbox-gtk-theme-git — Gtk Gruvbox theme for Linux
(define-public colloid-gruvbox-gtk-theme-git
  (package
    (name "colloid-gruvbox-gtk-theme-git")
    (version "2024.11.16.r22.g15f9b99")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/colloid-gruvbox-gtk-theme-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vinceliuice/Colloid-gtk-theme")
    (synopsis "gtk Gruvbox theme for Linux")
    (description "Gtk Gruvbox theme for Linux.")
    (license license:gpl3+)))

;;; colloid-everforest-gtk-theme-git — Gtk Everforest theme for Linux
(define-public colloid-everforest-gtk-theme-git
  (package
    (name "colloid-everforest-gtk-theme-git")
    (version "2024.11.16.r22.g15f9b99")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/colloid-everforest-gtk-theme-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vinceliuice/Colloid-gtk-theme")
    (synopsis "gtk Everforest theme for Linux")
    (description "Gtk Everforest theme for Linux.")
    (license license:gpl3+)))

;;; colloid-dracula-gtk-theme-git — Gtk Dracula theme for Linux
(define-public colloid-dracula-gtk-theme-git
  (package
    (name "colloid-dracula-gtk-theme-git")
    (version "2024.11.16.r22.g15f9b99")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/colloid-dracula-gtk-theme-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vinceliuice/Colloid-gtk-theme")
    (synopsis "gtk Dracula theme for Linux")
    (description "Gtk Dracula theme for Linux.")
    (license license:gpl3+)))

;;; colloid-catppuccin-gtk-theme-git — Gtk Catppuccin theme for Linux
(define-public colloid-catppuccin-gtk-theme-git
  (package
    (name "colloid-catppuccin-gtk-theme-git")
    (version "2024.11.16.r22.g15f9b99")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/colloid-catppuccin-gtk-theme-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vinceliuice/Colloid-gtk-theme")
    (synopsis "gtk Catppuccin theme for Linux")
    (description "Gtk Catppuccin theme for Linux.")
    (license license:gpl3+)))

;;; zsh-theme-powerlevel10k-bin-git — Powerlevel10k is a theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience.
(define-public zsh-theme-powerlevel10k-bin-git
  (package
    (name "zsh-theme-powerlevel10k-bin-git")
    (version "r3896.4bcc519")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zsh-theme-powerlevel10k-bin-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/romkatv/powerlevel10k")
    (synopsis "powerlevel10k is a theme for Zsh. It emphasizes speed, flexibility and out-of...")
    (description "Powerlevel10k is a theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience.")
    (license license:expat)))

;;; mcmojave-cursors — X-cursor theme inspired by macOS and based on capitaine-cursors
(define-public mcmojave-cursors
  (package
    (name "mcmojave-cursors")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mcmojave-cursors.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vinceliuice/mcmojave-cursors")
    (synopsis "x-cursor theme inspired by macOS and based on capitaine-cursors")
    (description "X-cursor theme inspired by macOS and based on capitaine-cursors.")
    (license license:gpl3+)))

;;; ubuntu-mate-themes — GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE.
(define-public ubuntu-mate-themes
  (package
    (name "ubuntu-mate-themes")
    (version "24.10.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ubuntu-mate-themes.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://launchpad.net/ubuntu-mate/")
    (synopsis "GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE")
    (description "GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE.")
    (license license:gpl3+)))

;;; chicago95-icon-theme-git — Windows 95 inspired icon theme
(define-public chicago95-icon-theme-git
  (package
    (name "chicago95-icon-theme-git")
    (version "3.0.1.r107.g9d9f9bc")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chicago95-icon-theme-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/grassmunk/Chicago95")
    (synopsis "windows 95 inspired icon theme")
    (description "Windows 95 inspired icon theme.")
    (license license:gpl3+)))

;;; chicago95-gtk-theme-git — Windows 95 inspired GTK theme
(define-public chicago95-gtk-theme-git
  (package
    (name "chicago95-gtk-theme-git")
    (version "3.0.1.r107.g9d9f9bc")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chicago95-gtk-theme-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/grassmunk/Chicago95")
    (synopsis "windows 95 inspired GTK theme")
    (description "Windows 95 inspired GTK theme.")
    (license license:gpl3+)))

;;; pop-icon-theme-git — System76 Pop icon theme
(define-public pop-icon-theme-git
  (package
    (name "pop-icon-theme-git")
    (version "1:3.5.1.r0.g1a575a8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pop-icon-theme-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pop-os/icon-theme")
    (synopsis "system76 Pop icon theme")
    (description "System76 Pop icon theme.")
    (license license:nonfree)))

;;; python-diffusers — Pretrained diffusion models for image and audio generation in PyTorch
(define-public python-diffusers
  (package
    (name "python-diffusers")
    (version "0.35.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-diffusers.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/huggingface/diffusers")
    (synopsis "pretrained diffusion models for image and audio generation in PyTorch")
    (description "Pretrained diffusion models for image and audio generation in PyTorch.")
    (license license:asl2.0)))

;;; python-papis-scihub-git — Papis plugin to import from Sci-Hub (incorporates upstream PR #62)
(define-public python-papis-scihub-git
  (package
    (name "python-papis-scihub-git")
    (version "1.4.0.r0.gf7bb665.PR62")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-papis-scihub-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/papis/scripts/tree/master/papis-scihub")
    (synopsis "papis plugin to import from Sci-Hub (incorporates upstream PR #62)")
    (description "Papis plugin to import from Sci-Hub (incorporates upstream PR #62).")
    (license license:gpl3)))

;;; python-pydantic-evals — Framework for evaluating stochastic code execution, especially code making use of LLMs.
(define-public python-pydantic-evals
  (package
    (name "python-pydantic-evals")
    (version "1.25.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pydantic-evals.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pydantic/pydantic-ai/tree/main/pydantic_evals")
    (synopsis "framework for evaluating stochastic code execution, especially code making us...")
    (description "Framework for evaluating stochastic code execution, especially code making use of LLMs.")
    (license license:expat)))

;;; python-pydantic-ai-slim — Agent Framework / shim to use Pydantic with LLMs, slim package.
(define-public python-pydantic-ai-slim
  (package
    (name "python-pydantic-ai-slim")
    (version "1.25.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pydantic-ai-slim.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pydantic/pydantic-ai/tree/main/pydantic_ai_slim")
    (synopsis "agent Framework / shim to use Pydantic with LLMs, slim package")
    (description "Agent Framework / shim to use Pydantic with LLMs, slim package.")
    (license license:expat)))

;;; python-pydantic-ai-examples — Examples of how to use PydanticAI and what it can do.
(define-public python-pydantic-ai-examples
  (package
    (name "python-pydantic-ai-examples")
    (version "1.25.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pydantic-ai-examples.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pydantic/pydantic-ai/tree/main/examples")
    (synopsis "examples of how to use PydanticAI and what it can do")
    (description "Examples of how to use PydanticAI and what it can do.")
    (license license:expat)))

;;; python-pydantic-ai — Agent Framework / shim to use Pydantic with LLMs.
(define-public python-pydantic-ai
  (package
    (name "python-pydantic-ai")
    (version "1.25.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pydantic-ai.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pydantic/pydantic-ai/")
    (synopsis "agent Framework / shim to use Pydantic with LLMs")
    (description "Agent Framework / shim to use Pydantic with LLMs.")
    (license license:expat)))

;;; python-clai — PydanticAI CLI: command line interface to chat to LLMs.
(define-public python-clai
  (package
    (name "python-clai")
    (version "1.25.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-clai.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pydantic/pydantic-ai/tree/main/clai")
    (synopsis "pydanticAI CLI: command line interface to chat to LLMs")
    (description "PydanticAI CLI: command line interface to chat to LLMs.")
    (license license:expat)))

;;; python-blivet — A DBus service and python module for management of the system storage configuration
(define-public python-blivet
  (package
    (name "python-blivet")
    (version "3.13.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-blivet.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://fedoraproject.org/wiki/Blivet")
    (synopsis "a DBus service and python module for management of the system storage configu...")
    (description "A DBus service and python module for management of the system storage configuration.")
    (license license:lgpl2.1)))

;;; python-espeak-ng — Python interface for eSpeak NG
(define-public python-espeak-ng
  (package
    (name "python-espeak-ng")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-espeak-ng.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://pypi.org/project/py-espeak-ng/")
    (synopsis "python interface for eSpeak NG")
    (description "Python interface for eSpeak NG.")
    (license license:asl2.0)))

;;; python-pytest-docker — Pytest plugin for Docker and Docker compose tests.
(define-public python-pytest-docker
  (package
    (name "python-pytest-docker")
    (version "3.2.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pytest-docker.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/avast/pytest-docker")
    (synopsis "pytest plugin for Docker and Docker compose tests")
    (description "Pytest plugin for Docker and Docker compose tests.")
    (license license:expat)))

;;; python-pymatting — A Python library for alpha matting
(define-public python-pymatting
  (package
    (name "python-pymatting")
    (version "1.1.15")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pymatting.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pymatting/pymatting")
    (synopsis "a Python library for alpha matting")
    (description "A Python library for alpha matting.")
    (license license:expat)))

;;; python-lpips — LPIPS Similarity metric
(define-public python-lpips
  (package
    (name "python-lpips")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-lpips.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/richzhang/PerceptualSimilarity")
    (synopsis "lPIPS Similarity metric")
    (description "LPIPS Similarity metric.")
    (license license:bsd-3)))

;;; python-logfire — The best Python observability tool!
(define-public python-logfire
  (package
    (name "python-logfire")
    (version "4.25.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-logfire.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pydantic/logfire")
    (synopsis "the best Python observability tool!")
    (description "The best Python observability tool!.")
    (license license:expat)))

;;; python-jh2-git — HTTP/2 State-Machine based protocol implementation (latest git commit)
(define-public python-jh2-git
  (package
    (name "python-jh2-git")
    (version "5.0.7.r0.g3d25ec6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-jh2-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jawah/h2")
    (synopsis "HTTP/2 State-Machine based protocol implementation (latest git commit)")
    (description "HTTP/2 State-Machine based protocol implementation (latest git commit).")
    (license license:expat)))

;;; python-electrum_ecc — python library for libsecp256k1, using ctypes
(define-public python-electrum-ecc
  (package
    (name "python-electrum-ecc")
    (version "0.0.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-electrum_ecc.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/spesmilo/electrum-ecc")
    (synopsis "python library for libsecp256k1, using ctypes")
    (description "python library for libsecp256k1, using ctypes.")
    (license license:expat)))

;;; consolas-font — Consolas font
(define-public consolas-font
  (package
    (name "consolas-font")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/consolas-font.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://aur.archlinux.org/packages/consolas-font")
    (synopsis "consolas font")
    (description "Consolas font.")
    (license license:expat)))

;;; otf-suite — A Korean UI headline typeface focused on clarity.
(define-public otf-suite
  (package
    (name "otf-suite")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-suite.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sunn-us/SUITE")
    (synopsis "a Korean UI headline typeface focused on clarity")
    (description "A Korean UI headline typeface focused on clarity.")
    (license license:nonfree)))

;;; otf-suit — A Korean UI body typeface focused on clarity.
(define-public otf-suit
  (package
    (name "otf-suit")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-suit.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sunn-us/SUIT")
    (synopsis "a Korean UI body typeface focused on clarity")
    (description "A Korean UI body typeface focused on clarity.")
    (license license:nonfree)))

;;; otf-new-york — Apple-designed serif typeface based on essential aspects of historical type styles. Sourced directly from Apple.
(define-public otf-new-york
  (package
    (name "otf-new-york")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-new-york.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://developer.apple.com/fonts/")
    (synopsis "apple-designed serif typeface based on essential aspects of historical type s...")
    (description "Apple-designed serif typeface based on essential aspects of historical type styles. Sourced directly from Apple.")
    (license license:nonfree)))

;;; nerd-fonts-sf-mono-ligatures — Monospaced variant of San Francisco. Sourced directly from Apple, patched with the Nerd Fonts Patcher and Fira Code ligatures
(define-public nerd-fonts-sf-mono-ligatures
  (package
    (name "nerd-fonts-sf-mono-ligatures")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nerd-fonts-sf-mono-ligatures.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://developer.apple.com/fonts/")
    (synopsis "monospaced variant of San Francisco. Sourced directly from Apple, patched wit...")
    (description "Monospaced variant of San Francisco. Sourced directly from Apple, patched with the Nerd Fonts Patcher and Fira Code ligatures.")
    (license license:nonfree)))

;;; ttf-tahoma — Tahoma and Tahoma Bold fonts from the Wine project
(define-public ttf-tahoma
  (package
    (name "ttf-tahoma")
    (version "9.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-tahoma.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.winehq.org/")
    (synopsis "tahoma and Tahoma Bold fonts from the Wine project")
    (description "Tahoma and Tahoma Bold fonts from the Wine project.")
    (license license:lgpl2.1+)))

;;; ttf-win7-fonts — Microsoft Windows 7 Latin and International TrueType fonts
(define-public ttf-win7-fonts
  (package
    (name "ttf-win7-fonts")
    (version "7.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-win7-fonts.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=161")
    (synopsis "microsoft Windows 7 Latin and International TrueType fonts")
    (description "Microsoft Windows 7 Latin and International TrueType fonts.")
    (license license:nonfree)))

;;; ttf-ms-win8 — Microsoft Windows 8.1 Latin and International TrueType fonts
(define-public ttf-ms-win8
  (package
    (name "ttf-ms-win8")
    (version "6.3.9600.17238")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win8.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=161")
    (synopsis "microsoft Windows 8.1 Latin and International TrueType fonts")
    (description "Microsoft Windows 8.1 Latin and International TrueType fonts.")
    (license license:nonfree)))

;;; ttf-ms-win8-arabic — Microsoft Windows 8.1 Latin and International TrueType fonts
(define-public ttf-ms-win8-arabic
  (package
    (name "ttf-ms-win8-arabic")
    (version "6.3.9600.17238")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win8-arabic.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=161")
    (synopsis "microsoft Windows 8.1 Latin and International TrueType fonts")
    (description "Microsoft Windows 8.1 Latin and International TrueType fonts.")
    (license license:nonfree)))

;;; sdl3_ttf-git — Support for TrueType font files with Simple Directmedia Layer (Version 3)
(define-public sdl3-ttf-git
  (package
    (name "sdl3-ttf-git")
    (version "3.2.0.r87.g3d2a01e")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sdl3_ttf-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/libsdl-org/SDL_ttf")
    (synopsis "support for TrueType font files with Simple Directmedia Layer (Version 3)")
    (description "Support for TrueType font files with Simple Directmedia Layer (Version 3).")
    (license license:zlib)))

;;; boundary-desktop — Desktop Client for Boundary
(define-public boundary-desktop
  (package
    (name "boundary-desktop")
    (version "2.3.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/boundary-desktop.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.boundaryproject.io/")
    (synopsis "desktop Client for Boundary")
    (description "Desktop Client for Boundary.")
    (license license:mpl2.0)))

;;; mangoverlay — GUI app for managing your MangoHud configuration.
(define-public mangoverlay
  (package
    (name "mangoverlay")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mangoverlay.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/loissascha/MangOverlay")
    (synopsis "gUI app for managing your MangoHud configuration")
    (description "GUI app for managing your MangoHud configuration.")
    (license license:expat)))

;;; supersonic-desktop — A lightweight cross-platform desktop client for Subsonic music servers
(define-public supersonic-desktop
  (package
    (name "supersonic-desktop")
    (version "0.20.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/supersonic-desktop.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dweymouth/supersonic")
    (synopsis "a lightweight cross-platform desktop client for Subsonic music servers")
    (description "A lightweight cross-platform desktop client for Subsonic music servers.")
    (license license:gpl3+)))

;;; powerline-shell — A pretty prompt for your shell
(define-public powerline-shell
  (package
    (name "powerline-shell")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/powerline-shell.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/b-ryan/powerline-shell")
    (synopsis "a pretty prompt for your shell")
    (description "A pretty prompt for your shell.")
    (license license:expat)))

;;; lobster-git — Shell script to watch Movies/Webseries/Shows from the terminal.
(define-public lobster-git
  (package
    (name "lobster-git")
    (version "r203.f9294ff")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lobster-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/justchokingaround/lobster.git")
    (synopsis "shell script to watch Movies/Webseries/Shows from the terminal")
    (description "Shell script to watch Movies/Webseries/Shows from the terminal.")
    (license license:gpl2)))

;;; z180emu-git — A portable full system emulator for Z180 based boards
(define-public z180emu-git
  (package
    (name "z180emu-git")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/z180emu-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gnarz/z180emu")
    (synopsis "a portable full system emulator for Z180 based boards")
    (description "A portable full system emulator for Z180 based boards.")
    (license license:gpl3+)))

;;; daytona — The Open Source Dev Environment Manager.
(define-public daytona
  (package
    (name "daytona")
    (version "0.50.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/daytona.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.daytona.io/")
    (synopsis "the Open Source Dev Environment Manager")
    (description "The Open Source Dev Environment Manager.")
    (license license:asl2.0)))

;;; overwitch — JACK client for Overbridge devices
(define-public overwitch
  (package
    (name "overwitch")
    (version "2.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/overwitch.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dagargo.github.io/overwitch/")
    (synopsis "jACK client for Overbridge devices")
    (description "JACK client for Overbridge devices.")
    (license license:gpl3)))

;;; outline — Wiki and knowledge base for growing teams
(define-public outline
  (package
    (name "outline")
    (version "0.84.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/outline.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.getoutline.com")
    (synopsis "wiki and knowledge base for growing teams")
    (description "Wiki and knowledge base for growing teams.")
    (license license:nonfree)))

;;; update-grub — Simple wrapper around grub-mkconfig
(define-public update-grub
  (package
    (name "update-grub")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/update-grub.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://packages.ubuntu.com/jammy/admin/grub-common")
    (synopsis "simple wrapper around grub-mkconfig")
    (description "Simple wrapper around grub-mkconfig.")
    (license license:gpl2)))

;;; remarkable — A free fully featured markdown editor for Linux.
(define-public remarkable
  (package
    (name "remarkable")
    (version "1.95")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/remarkable.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://remarkableapp.github.io")
    (synopsis "a free fully featured markdown editor for Linux")
    (description "A free fully featured markdown editor for Linux.")
    (license license:expat)))

;;; sozi-extras_texts2paths — An script for converting Text objects of a SVG to Path objects
(define-public sozi-extras-texts2paths
  (package
    (name "sozi-extras-texts2paths")
    (version "24.11")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sozi-extras_texts2paths.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://sozi.baierouge.fr/")
    (synopsis "an script for converting Text objects of a SVG to Path objects")
    (description "An script for converting Text objects of a SVG to Path objects.")
    (license license:mpl2.0)))

;;; ls++-git — NOT FOUND IN AUR
(define-public ls---git
  (package
    (name "ls---git")
    (version "0.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ls++-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://aur.archlinux.org/packages/ls++-git")
    (synopsis "package not found in AUR")
    (description "This package was not found in AUR metadata.  It may have been
removed or renamed.")
    (license license:nonfree)))

;;; roccat-tools-savu — Userland applications to configure and make extended use of ROCCAT Savu devices
(define-public roccat-tools-savu
  (package
    (name "roccat-tools-savu")
    (version "5.9.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/roccat-tools-savu.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://roccat.sourceforge.net")
    (synopsis "userland applications to configure and make extended use of ROCCAT Savu devices")
    (description "Userland applications to configure and make extended use of ROCCAT Savu devices.")
    (license license:gpl2)))

;;; netctl-gui — Qt5 graphical front-end for netctl. A part of netctl-gui
(define-public netctl-gui
  (package
    (name "netctl-gui")
    (version "1.4.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/netctl-gui.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://arcanis.me/projects/netctl-gui")
    (synopsis "Qt5 graphical front-end for netctl. A part of netctl-gui")
    (description "Qt5 graphical front-end for netctl. A part of netctl-gui.")
    (license license:gpl3+)))

;;; loic — An open source network stress tool for Windows. Based on Praetox's project at https://sourceforge.net/projects/loic/ and written in C#.
(define-public loic
  (package
    (name "loic")
    (version "2.0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/loic.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/NewEraCracker/LOIC")
    (synopsis "an open source network stress tool for Windows. Based on Praetox's project at...")
    (description "An open source network stress tool for Windows. Based on Praetox's project at https://sourceforge.net/projects/loic/ and written in C#.")
    (license license:gpl3+)))

;;; osu-lazer-git — A free-to-win rhythm game. Rhythm is just a *click* away!
(define-public osu-lazer-git
  (package
    (name "osu-lazer-git")
    (version "latest")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/osu-lazer-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://osu.ppy.sh/")
    (synopsis "a free-to-win rhythm game. Rhythm is just a *click* away!")
    (description "A free-to-win rhythm game. Rhythm is just a *click* away!.")
    (license license:expat)))

;;; mkvalidator — Validator for MKV files
(define-public mkvalidator
  (package
    (name "mkvalidator")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mkvalidator.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.matroska.org/downloads/mkvalidator.html")
    (synopsis "validator for MKV files")
    (description "Validator for MKV files.")
    (license license:bsd-3)))

;;; nyancat-git — Nyancat rendered in your terminal
(define-public nyancat-git
  (package
    (name "nyancat-git")
    (version "1.5.2.r5.g5ffb6c5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nyancat-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://nyancat.dakko.us/")
    (synopsis "nyancat rendered in your terminal")
    (description "Nyancat rendered in your terminal.")
    (license license:nonfree)))

;;; auto-reencode — Mass convert asf, flv, or wmv to mp4 contained x264 files using ffmpeg.
(define-public auto-reencode
  (package
    (name "auto-reencode")
    (version "2.86")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/auto-reencode.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/graysky2/auto-reencode")
    (synopsis "mass convert asf, flv, or wmv to mp4 contained x264 files using ffmpeg")
    (description "Mass convert asf, flv, or wmv to mp4 contained x264 files using ffmpeg.")
    (license license:expat)))

;;; plasma6-applets-netspeed — Plasma 6 widget that displays the currently used network bandwidth
(define-public plasma6-applets-netspeed
  (package
    (name "plasma6-applets-netspeed")
    (version "3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma6-applets-netspeed.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dfaust/plasma-applet-netspeed-widget")
    (synopsis "plasma 6 widget that displays the currently used network bandwidth")
    (description "Plasma 6 widget that displays the currently used network bandwidth.")
    (license license:gpl2)))

;;; remmina-plugin-ultravnc — A protocol plugin for Remmina to connect via VNC using UltraVNC viewer
(define-public remmina-plugin-ultravnc
  (package
    (name "remmina-plugin-ultravnc")
    (version "1.3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/remmina-plugin-ultravnc.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.muflone.com/remmina-plugin-ultravnc/")
    (synopsis "a protocol plugin for Remmina to connect via VNC using UltraVNC viewer")
    (description "A protocol plugin for Remmina to connect via VNC using UltraVNC viewer.")
    (license license:gpl2+)))

;;; asf-plugin-monitoring — Monitoring plugin for ArchiSteamFarm.
(define-public asf-plugin-monitoring
  (package
    (name "asf-plugin-monitoring")
    (version "6.3.4.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/asf-plugin-monitoring.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/JustArchiNET/ArchiSteamFarm")
    (synopsis "monitoring plugin for ArchiSteamFarm")
    (description "Monitoring plugin for ArchiSteamFarm.")
    (license license:asl2.0)))

;;; ncsa-mosaic-git — One of the first graphical web browsers
(define-public ncsa-mosaic-git
  (package
    (name "ncsa-mosaic-git")
    (version "1:2.7b6.r39.2e9a605")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ncsa-mosaic-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/alandipert/ncsa-mosaic")
    (synopsis "one of the first graphical web browsers")
    (description "One of the first graphical web browsers.")
    (license license:nonfree)))

;;; vsxu — A free to use program that lets you create and perform real-time audio visual presets.
(define-public vsxu
  (package
    (name "vsxu")
    (version "0.6.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vsxu.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.vsxu.com/")
    (synopsis "a free to use program that lets you create and perform real-time audio visual...")
    (description "A free to use program that lets you create and perform real-time audio visual presets.")
    (license license:nonfree)))

;;; cling-jupyter-git — Interactive C++ interpreter built on the top of LLVM and Clang libraries.
(define-public cling-jupyter-git
  (package
    (name "cling-jupyter-git")
    (version "r5123.45318c5a")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cling-jupyter-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://root.cern.ch/cling")
    (synopsis "interactive C++ interpreter built on the top of LLVM and Clang libraries")
    (description "Interactive C++ interpreter built on the top of LLVM and Clang libraries.")
    (license license:nonfree)))

;;; httpry — A specialized packet sniffer designed for displaying and logging HTTP traffic.
(define-public httpry
  (package
    (name "httpry")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/httpry.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://dumpsterventures.com/jason/httpry/")
    (synopsis "a specialized packet sniffer designed for displaying and logging HTTP traffic")
    (description "A specialized packet sniffer designed for displaying and logging HTTP traffic.")
    (license license:gpl2)))

;;; repoctl — An AUR helper that also simplifies managing local Pacman repositories
(define-public repoctl
  (package
    (name "repoctl")
    (version "0.22.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/repoctl.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cassava/repoctl")
    (synopsis "an AUR helper that also simplifies managing local Pacman repositories")
    (description "An AUR helper that also simplifies managing local Pacman repositories.")
    (license license:expat)))

;;; pypy3-pip — The PyPA recommended tool for installing Python packages
(define-public pypy3-pip
  (package
    (name "pypy3-pip")
    (version "26.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pypy3-pip.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://pip.pypa.io")
    (synopsis "the PyPA recommended tool for installing Python packages")
    (description "The PyPA recommended tool for installing Python packages.")
    (license license:expat)))

;;; digikam-git — An advanced digital photo management application
(define-public digikam-git
  (package
    (name "digikam-git")
    (version "1:8.1.0.r673.41241c0e82")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/digikam-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.digikam.org/")
    (synopsis "an advanced digital photo management application")
    (description "An advanced digital photo management application.")
    (license license:gpl3+)))
