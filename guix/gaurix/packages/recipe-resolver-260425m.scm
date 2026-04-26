;; -*- mode: scheme; coding: utf-8 -*-
;;; recipe-resolver-260425m: 100 packages attempted (100 recipes, 0 blocked)
;;; Generated from AUR PKGBUILDs via queue-drain pass.

(define-module (gaurix packages recipe-resolver-260425m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
   keepassxc-wordlist-german-better
   sillytavern-git
   rudder-agent
   python-rapidyaml
   an
   meow-nvim
   ytdl-sub
   i3gocks
   ocp
   hellwal
   savedesktop
   video-downloader
   totp-cli
   python-memory-graph
   dcpomatic
   infnoise-openssl-git
   lua52-lsqlite3
   lua-lsqlite3
   ch343ser-git
   kontur-plugin
   nanobench
   poengsum
   unflac
   salt
   sway-input-config
   kmymoney-git
   jorge-git
   krep
   amarena-gtk-theme
   py-nvfan
   qgnomeplatform-qt5
   perl-cookie-baker
   uudeck
   multipartus-downloader
   playback-appimage
   d2rloader-git
   d2rloader
   ritchie-cli
   einstein-emulator
   decman
   pyprland
   ghostty-x86_64-v3-git
   projectm-sdl2-git
   idle
   qucs-git
   ecal-app
   ecal
   cyrus-imapd
   ngs-lang-git
   superslicer-prerelease
   cockatrice-client-git
   superslicer
   betula-git
   slc-cli
   jdownloader2-jre
   alexandrie-pg
   rustdesk-git
   klogg-bin-git
   obmenu-generator
   eternalterminal-server
   eternalterminal-client
   triplea
   rcl
   offline-page-downloader
   protoc-gen-psrpc
   masscanned-git
   deepl-linux-electron
   mdk3
   xcursor-simp1e-tokyo-night-storm
   xcursor-simp1e-tokyo-night-light
   xcursor-simp1e-tokyo-night
   xcursor-simp1e-solarized-light
   xcursor-simp1e-solarized-dark
   xcursor-simp1e-rose-pine-moon
   xcursor-simp1e-rose-pine-dawn
   xcursor-simp1e-rose-pine
   xcursor-simp1e-nord-light
   xcursor-simp1e-nord-dark
   xcursor-simp1e-mix-light
   xcursor-simp1e-mix-dark
   xcursor-simp1e-gruvbox-light
   xcursor-simp1e-gruvbox-dark
   xcursor-simp1e-dark
   xcursor-simp1e-catpuccin-mocha
   xcursor-simp1e-catpuccin-macchiato
   xcursor-simp1e-catpuccin-latte
   xcursor-simp1e-catpuccin-frappe
   xcursor-simp1e-breeze-dark
   xcursor-simp1e-breeze
   xcursor-simp1e-adw-dark
   xcursor-simp1e-adw
   xcursor-simp1e
   tal-noisemaker-vst-bin
   tal-noisemaker-clap-bin
   pipman-git
   adwaita-cursors-git
   python-commitizen
   smemstat
   gnome-shell-extension-freon
   figma-linux
   ))

;;; keepassxc-wordlist-german-better — Better German diceware wordlist for keepassxc password generation.
(define-public keepassxc-wordlist-german-better
  (package
    (name "keepassxc-wordlist-german-better")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/dys2p/wordlists-de/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dys2p/wordlists-de")
    (synopsis "better German diceware wordlist for keepassxc password generation")
    (description "Better German diceware wordlist for keepassxc password generation.")
    (license license:cc0)))

;;; sillytavern-git — A locally installed user interface for LLMs, image generation, and TTS
(define-public sillytavern-git
  (package
    (name "sillytavern-git")
    (version "1.12.13.r518.gb3a3b9d")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/SillyTavern/SillyTavern/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/SillyTavern/SillyTavern")
    (synopsis "a locally installed user interface for LLMs, image generation, and TTS voice ")
    (description "A locally installed user interface for LLMs, image generation, and TTS voice models.")
    (license license:agpl3)))

;;; rudder-agent — Configuration management and audit tool - agent for Rudder managed sys
(define-public rudder-agent
  (package
    (name "rudder-agent")
    (version "9.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rudder-agent.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.rudder.io")
    (synopsis "configuration management and audit tool - agent for Rudder managed systems")
    (description "Configuration management and audit tool - agent for Rudder managed systems.")
    (license license:gpl3+)))

;;; python-rapidyaml — Python bindings for rapidyaml (via SWIG).
(define-public python-rapidyaml
  (package
    (name "python-rapidyaml")
    (version "0.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/biojppm/rapidyaml/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/biojppm/rapidyaml")
    (synopsis "python bindings for rapidyaml (via SWIG)")
    (description "Python bindings for rapidyaml (via SWIG).")
    (license license:expat)))

;;; an — Anagram Generator.
(define-public an
  (package
    (name "an")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/an.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://salsa.debian.org/pm/an")
    (synopsis "anagram Generator")
    (description "Anagram Generator.")
    (license license:gpl2)))

;;; meow-nvim — cat alternative using Neovim for highlighting and configuration.
(define-public meow-nvim
  (package
    (name "meow-nvim")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/datsfilipe/meow/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/datsfilipe/meow")
    (synopsis "cat alternative using Neovim for highlighting and configuration")
    (description "cat alternative using Neovim for highlighting and configuration.")
    (license license:expat)))

;;; ytdl-sub — Automate downloading and metadata generation with yt-dlp.
(define-public ytdl-sub
  (package
    (name "ytdl-sub")
    (version "2026.04.13.post1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/jmbannon/ytdl-sub/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jmbannon/ytdl-sub")
    (synopsis "automate downloading and metadata generation with yt-dlp")
    (description "Automate downloading and metadata generation with yt-dlp.")
    (license license:gpl3)))

;;; i3gocks — Minimal status line generator for i3/sway written in Go.
(define-public i3gocks
  (package
    (name "i3gocks")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/alexcoder04/i3gocks/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/alexcoder04/i3gocks")
    (synopsis "minimal status line generator for i3/sway written in Go")
    (description "Minimal status line generator for i3/sway written in Go.")
    (license license:gpl3+)))

;;; ocp — Open Cubic Player.
(define-public ocp
  (package
    (name "ocp")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocp.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://stian.cubic.org/project-ocp.php")
    (synopsis "open Cubic Player")
    (description "Open Cubic Player.")
    (license license:gpl3+)))

;;; hellwal — fast, extensible color palette generator.
(define-public hellwal
  (package
    (name "hellwal")
    (version "1.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/danihek/hellwal/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/danihek/hellwal")
    (synopsis "fast, extensible color palette generator")
    (description "fast, extensible color palette generator.")
    (license license:expat)))

;;; savedesktop — Saves your Linux desktop environment configuration.
(define-public savedesktop
  (package
    (name "savedesktop")
    (version "4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/savedesktop.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://vikdevelop.github.io/SaveDesktop")
    (synopsis "saves your Linux desktop environment configuration")
    (description "Saves your Linux desktop environment configuration.")
    (license license:gpl3+)))

;;; video-downloader — Download videos from websites like YouTube and many others (based on y
(define-public video-downloader
  (package
    (name "video-downloader")
    (version "0.12.31")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Unrud/video-downloader/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Unrud/video-downloader")
    (synopsis "download videos from websites like YouTube and many others (based on yt-dlp)")
    (description "Download videos from websites like YouTube and many others (based on yt-dlp).")
    (license license:gpl3+)))

;;; totp-cli — Cli application to generate OTP tokens for two-factor authentication.
(define-public totp-cli
  (package
    (name "totp-cli")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/WhyNotHugo/totp-cli/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/WhyNotHugo/totp-cli")
    (synopsis "cli application to generate OTP tokens for two-factor authentication")
    (description "Cli application to generate OTP tokens for two-factor authentication.")
    (license license:expat)))

;;; python-memory-graph — Generate intuitive graphs of your Python data.
(define-public python-memory-graph
  (package
    (name "python-memory-graph")
    (version "0.3.67")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/bterwijn/memory_graph/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bterwijn/memory_graph")
    (synopsis "generate intuitive graphs of your Python data")
    (description "Generate intuitive graphs of your Python data.")
    (license license:bsd-2)))

;;; dcpomatic — A free, open-source program to generate Digital Cinema Packages (DCPs)
(define-public dcpomatic
  (package
    (name "dcpomatic")
    (version "2.18.38")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dcpomatic.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dcpomatic.com/")
    (synopsis "a free, open-source program to generate Digital Cinema Packages (DCPs) from v")
    (description "A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images.")
    (license license:gpl2+)))

;;; infnoise-openssl-git — OpenSSL Engine for random number generation using the Infnoise hardwar
(define-public infnoise-openssl-git
  (package
    (name "infnoise-openssl-git")
    (version "r22.d161bfd")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/tinskip/infnoise-openssl/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tinskip/infnoise-openssl")
    (synopsis "openSSL Engine for random number generation using the Infnoise hardware TRNG")
    (description "OpenSSL Engine for random number generation using the Infnoise hardware TRNG.")
    (license license:lgpl3)))

;;; lua52-lsqlite3 — A binding for Lua to the SQLite3 database library.
(define-public lua52-lsqlite3
  (package
    (name "lua52-lsqlite3")
    (version "0.9.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua52-lsqlite3.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://lua.sqlite.org")
    (synopsis "a binding for Lua to the SQLite3 database library")
    (description "A binding for Lua to the SQLite3 database library.")
    (license license:expat)))

;;; lua-lsqlite3 — A binding for Lua to the SQLite3 database library.
(define-public lua-lsqlite3
  (package
    (name "lua-lsqlite3")
    (version "0.9.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua-lsqlite3.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://lua.sqlite.org")
    (synopsis "a binding for Lua to the SQLite3 database library")
    (description "A binding for Lua to the SQLite3 database library.")
    (license license:expat)))

;;; ch343ser-git — USB serial driver for ch342/ch343/ch344/ch347/ch347f/ch9101/ch9102/ch9
(define-public ch343ser-git
  (package
    (name "ch343ser-git")
    (version "r56.b705737")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/WCHSoftGroup/ch343ser_linux/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/WCHSoftGroup/ch343ser_linux")
    (synopsis "uSB serial driver for ch342/ch343/ch344/ch347/ch347f/ch9101/ch9102/ch9103/ch9")
    (description "USB serial driver for ch342/ch343/ch344/ch347/ch347f/ch9101/ch9102/ch9103/ch9104, etc.")
    (license license:gpl2+)))

;;; kontur-plugin — Kontur.Plugin is an extension for web browsers that allows users to pe
(define-public kontur-plugin
  (package
    (name "kontur-plugin")
    (version "4.11.1.3628")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kontur-plugin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://help.kontur.ru/plugin/")
    (synopsis "kontur.Plugin is an extension for web browsers that allows users to perform c")
    (description "Kontur.Plugin is an extension for web browsers that allows users to perform cryptographic operations in SKB Kontur services.")
    (license license:non-copyleft)))

;;; nanobench — Simple, fast, accurate single-header microbenchmarking functionality f
(define-public nanobench
  (package
    (name "nanobench")
    (version "4.3.11")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nanobench.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://nanobench.ankerl.com")
    (synopsis "simple, fast, accurate single-header microbenchmarking functionality for C++1")
    (description "Simple, fast, accurate single-header microbenchmarking functionality for C++11/14/17/20.")
    (license license:expat)))

;;; poengsum — Quickly generate a leaderboard for a quiz from your terminal.
(define-public poengsum
  (package
    (name "poengsum")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/sigurd4/poengsum/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sigurd4/poengsum")
    (synopsis "quickly generate a leaderboard for a quiz from your terminal")
    (description "Quickly generate a leaderboard for a quiz from your terminal.")
    (license license:expat)))

;;; unflac — A command line tool for fast frame accurate audio image + cue sheet sp
(define-public unflac
  (package
    (name "unflac")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://git.sr.ht/~ft/unflac/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://git.sr.ht/~ft/unflac")
    (synopsis "a command line tool for fast frame accurate audio image + cue sheet splitting")
    (description "A command line tool for fast frame accurate audio image + cue sheet splitting.")
    (license license:expat)))

;;; salt — Portable, distributed, remote execution and configuration management s
(define-public salt
  (package
    (name "salt")
    (version "3007.13")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/salt.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://saltproject.io/")
    (synopsis "portable, distributed, remote execution and configuration management system")
    (description "Portable, distributed, remote execution and configuration management system.")
    (license license:asl2.0)))

;;; sway-input-config — Sway Input Configurator.
(define-public sway-input-config
  (package
    (name "sway-input-config")
    (version "1.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Sunderland93/sway-input-config/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Sunderland93/sway-input-config")
    (synopsis "sway Input Configurator")
    (description "Sway Input Configurator.")
    (license license:gpl3+)))

;;; kmymoney-git — Personal finance manager for KDE which operates similarly to MS-Money 
(define-public kmymoney-git
  (package
    (name "kmymoney-git")
    (version "5.1.95.r572.gcc9596c")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kmymoney-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kmymoney.org/")
    (synopsis "personal finance manager for KDE which operates similarly to MS-Money or Quicken")
    (description "Personal finance manager for KDE which operates similarly to MS-Money or Quicken.")
    (license license:gpl2+)))

;;; jorge-git — Personal site generator with org-mode support (latest commit).
(define-public jorge-git
  (package
    (name "jorge-git")
    (version "0.9.1.r8.g9cf08c4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/facundoolano/jorge/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/facundoolano/jorge")
    (synopsis "personal site generator with org-mode support (latest commit)")
    (description "Personal site generator with org-mode support (latest commit).")
    (license license:expat)))

;;; krep — fast text search tool with advanced algorithms, SIMD acceleration, mul
(define-public krep
  (package
    (name "krep")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/davidesantangelo/krep/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/davidesantangelo/krep")
    (synopsis "fast text search tool with advanced algorithms, SIMD acceleration, multi-thre")
    (description "fast text search tool with advanced algorithms, SIMD acceleration, multi-threading, and regex support.")
    (license license:bsd-3)))

;;; amarena-gtk-theme — Amarena GTK theme & icon set: built with the GTK Theme Framework.
(define-public amarena-gtk-theme
  (package
    (name "amarena-gtk-theme")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/jaxwilko/gtk-theme-framework/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jaxwilko/gtk-theme-framework")
    (synopsis "amarena GTK theme & icon set: built with the GTK Theme Framework")
    (description "Amarena GTK theme & icon set: built with the GTK Theme Framework.")
    (license license:gpl3+)))

;;; py-nvfan — Automatic Fan Control for NVIDIA Graphics Cards Based on Temperature.
(define-public py-nvfan
  (package
    (name "py-nvfan")
    (version "0.1.22")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/py-nvfan.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://pypi.org/project/py-nvfan/")
    (synopsis "automatic Fan Control for NVIDIA Graphics Cards Based on Temperature")
    (description "Automatic Fan Control for NVIDIA Graphics Cards Based on Temperature.")
    (license license:expat)))

;;; qgnomeplatform-qt5 — QPlatformTheme for a better Qt5 application inclusion in GNOME.
(define-public qgnomeplatform-qt5
  (package
    (name "qgnomeplatform-qt5")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/FedoraQt/QGnomePlatform/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FedoraQt/QGnomePlatform")
    (synopsis "qPlatformTheme for a better Qt5 application inclusion in GNOME")
    (description "QPlatformTheme for a better Qt5 application inclusion in GNOME.")
    (license license:lgpl2.1)))

;;; perl-cookie-baker — Cookie string generator / parser.
(define-public perl-cookie-baker
  (package
    (name "perl-cookie-baker")
    (version "0.12")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-cookie-baker.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/dist/Cookie-Baker")
    (synopsis "cookie string generator / parser")
    (description "Cookie string generator / parser.")
    (license #f)))

;;; uudeck — Simplified UU Accelerator for Steam Deck on Arch Linux.
(define-public uudeck
  (package
    (name "uudeck")
    (version "2025.4.12.0001")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uudeck.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://uu.163.com/")
    (synopsis "simplified UU Accelerator for Steam Deck on Arch Linux")
    (description "Simplified UU Accelerator for Steam Deck on Arch Linux.")
    (license license:non-copyleft)))

;;; multipartus-downloader — An app that lets you download Impartus video lectures.
(define-public multipartus-downloader
  (package
    (name "multipartus-downloader")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/crux-bphc/multipartus-downloader/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/crux-bphc/multipartus-downloader")
    (synopsis "an app that lets you download Impartus video lectures")
    (description "An app that lets you download Impartus video lectures.")
    (license license:expat)))

;;; playback-appimage — Playback software for Epilogue Operator devices.
(define-public playback-appimage
  (package
    (name "playback-appimage")
    (version "1.8.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/playback-appimage.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.epilogue.co")
    (synopsis "playback software for Epilogue Operator devices")
    (description "Playback software for Epilogue Operator devices.")
    (license license:non-copyleft)))

;;; d2rloader-git — Cross-platform Diablo 2 Resurrected Loader written in Python/Qt.
(define-public d2rloader-git
  (package
    (name "d2rloader-git")
    (version "v1.4.0.r0.g21d9e4e")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/sh4nks/d2rloader/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sh4nks/d2rloader")
    (synopsis "cross-platform Diablo 2 Resurrected Loader written in Python/Qt")
    (description "Cross-platform Diablo 2 Resurrected Loader written in Python/Qt.")
    (license license:expat)))

;;; d2rloader — Cross-platform Diablo 2 Resurrected Loader written in Python/Qt.
(define-public d2rloader
  (package
    (name "d2rloader")
    (version "1.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/sh4nks/d2rloader/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sh4nks/d2rloader")
    (synopsis "cross-platform Diablo 2 Resurrected Loader written in Python/Qt")
    (description "Cross-platform Diablo 2 Resurrected Loader written in Python/Qt.")
    (license license:expat)))

;;; ritchie-cli — Ritchie CLI is an open-source tool that allows to create, store and sh
(define-public ritchie-cli
  (package
    (name "ritchie-cli")
    (version "2.11.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ritchie-cli.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ritchiecli.io/")
    (synopsis "ritchie CLI is an open-source tool that allows to create, store and share any")
    (description "Ritchie CLI is an open-source tool that allows to create, store and share any kind of automation, executing them through command lines, to run operations or start workflows.")
    (license license:asl2.0)))

;;; einstein-emulator — NewtonOS running on other operating systems.
(define-public einstein-emulator
  (package
    (name "einstein-emulator")
    (version "2024.12.26")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/pguyot/Einstein/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pguyot/Einstein")
    (synopsis "newtonOS running on other operating systems")
    (description "NewtonOS running on other operating systems.")
    (license license:gpl2)))

;;; decman — Declarative package & configuration manager for Arch Linux.
(define-public decman
  (package
    (name "decman")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/kiviktnm/decman/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kiviktnm/decman")
    (synopsis "declarative package & configuration manager for Arch Linux")
    (description "Declarative package & configuration manager for Arch Linux.")
    (license license:gpl3+)))

;;; pyprland — Enhance your Desktop with menus, easy monitor layout and other extensi
(define-public pyprland
  (package
    (name "pyprland")
    (version "3.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/hyprland-community/pyprland/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hyprland-community/pyprland")
    (synopsis "enhance your Desktop with menus, easy monitor layout and other extensions (po")
    (description "Enhance your Desktop with menus, easy monitor layout and other extensions (powerful hyprland scratchpads).")
    (license license:expat)))

;;; ghostty-x86_64-v3-git — Fast, native, feature-rich terminal emulator with modern x86_64-v3 opt
(define-public ghostty-x86_64-v3-git
  (package
    (name "ghostty-x86_64-v3-git")
    (version "r11032.26522ab8c")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ghostty-org/ghostty/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ghostty-org/ghostty")
    (synopsis "fast, native, feature-rich terminal emulator with modern x86_64-v3 optimizati")
    (description "Fast, native, feature-rich terminal emulator with modern x86_64-v3 optimizations and bundled shell integration + terminfo.")
    (license license:expat)))

;;; projectm-sdl2-git — Music visualizer which uses 3D accelerated iterative image based rende
(define-public projectm-sdl2-git
  (package
    (name "projectm-sdl2-git")
    (version "111.c53e732")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/projectM-visualizer/projectm/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/projectM-visualizer/projectm")
    (synopsis "music visualizer which uses 3D accelerated iterative image based rendering (g")
    (description "Music visualizer which uses 3D accelerated iterative image based rendering (git version).")
    (license license:lgpl3+)))

;;; idle — Python Integrated Development and Learning Environment (desktop entry)
(define-public idle
  (package
    (name "idle")
    (version "3.14")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/idle.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://packages.debian.org/stable/python/idle")
    (synopsis "python Integrated Development and Learning Environment (desktop entry)")
    (description "Python Integrated Development and Learning Environment (desktop entry).")
    (license license:psfl)))

;;; qucs-git — An integrated circuit simulator GUI (develop branch).
(define-public qucs-git
  (package
    (name "qucs-git")
    (version "r3698.9269528")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/qucs/qucs/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://github.com/qucs/qucs")
    (synopsis "an integrated circuit simulator GUI (develop branch)")
    (description "An integrated circuit simulator GUI (develop branch).")
    (license license:gpl3+)))

;;; ecal-app — First-party tools for eCAL.
(define-public ecal-app
  (package
    (name "ecal-app")
    (version "6.1.0.r0.gf60f5a2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/eclipse-ecal/ecal/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/eclipse-ecal/ecal")
    (synopsis "first-party tools for eCAL")
    (description "First-party tools for eCAL.")
    (license license:asl2.0)))

;;; ecal — enhanced Communication Abstraction Layer.
(define-public ecal
  (package
    (name "ecal")
    (version "6.1.0.r0.gf60f5a2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/eclipse-ecal/ecal/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/eclipse-ecal/ecal")
    (synopsis "enhanced Communication Abstraction Layer")
    (description "enhanced Communication Abstraction Layer.")
    (license license:asl2.0)))

;;; cyrus-imapd — An email, contacts and calendar server.
(define-public cyrus-imapd
  (package
    (name "cyrus-imapd")
    (version "3.12.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cyrus-imapd.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.cyrusimap.org/")
    (synopsis "an email, contacts and calendar server")
    (description "An email, contacts and calendar server.")
    (license license:bsd-3)))

;;; ngs-lang-git — NGS: Next Generation Shell (built from latest git commit).
(define-public ngs-lang-git
  (package
    (name "ngs-lang-git")
    (version "1:0.2.17.r0.g10a4a0da")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ngs-lang/ngs/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ngs-lang/ngs")
    (synopsis "nGS: Next Generation Shell (built from latest git commit)")
    (description "NGS: Next Generation Shell (built from latest git commit).")
    (license license:gpl3+)))

;;; superslicer-prerelease — G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.).
(define-public superslicer-prerelease
  (package
    (name "superslicer-prerelease")
    (version "1:2.7.61.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/supermerill/SuperSlicer/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/supermerill/SuperSlicer")
    (synopsis "g-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)")
    (description "G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.).")
    (license license:agpl3)))

;;; cockatrice-client-git — Open-source multiplatform supported program for playing tabletop card 
(define-public cockatrice-client-git
  (package
    (name "cockatrice-client-git")
    (version "2.9.1.beta.2.r21.gb7042165")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cockatrice-client-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cockatrice.github.io/")
    (synopsis "open-source multiplatform supported program for playing tabletop card games o")
    (description "Open-source multiplatform supported program for playing tabletop card games over a network.")
    (license license:gpl2)))

;;; superslicer — G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.).
(define-public superslicer
  (package
    (name "superslicer")
    (version "1:2.5.59.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/supermerill/SuperSlicer/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/supermerill/SuperSlicer")
    (synopsis "g-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)")
    (description "G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.).")
    (license license:agpl3)))

;;; betula-git — Federated personal link collection manager (latest git commit).
(define-public betula-git
  (package
    (name "betula-git")
    (version "1.4.0.r1.ge4e6b90")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://git.sr.ht/~bouncepaw/betula/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://git.sr.ht/~bouncepaw/betula")
    (synopsis "federated personal link collection manager (latest git commit)")
    (description "Federated personal link collection manager (latest git commit).")
    (license license:agpl3+)))

;;; slc-cli — Command line tool to generate projects with Silicon Labs SDK.
(define-public slc-cli
  (package
    (name "slc-cli")
    (version "5.10.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/slc-cli.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://siliconlabs.github.io/slc-specification")
    (synopsis "command line tool to generate projects with Silicon Labs SDK")
    (description "Command line tool to generate projects with Silicon Labs SDK.")
    (license #f)))

;;; jdownloader2-jre — Download manager, written in Java, for one-click hosting sites like Ra
(define-public jdownloader2-jre
  (package
    (name "jdownloader2-jre")
    (version "21.0.6+7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jdownloader2-jre.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://jdownloader.org/")
    (synopsis "download manager, written in Java, for one-click hosting sites like Rapidshar")
    (description "Download manager, written in Java, for one-click hosting sites like Rapidshare and MEGA with bundled JRE.")
    (license license:gpl3)))

;;; alexandrie-pg — Rust private crates registry - with postgres backend.
(define-public alexandrie-pg
  (package
    (name "alexandrie-pg")
    (version "0.1.0_20231113")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Hirevo/alexandrie/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Hirevo/alexandrie")
    (synopsis "rust private crates registry - with postgres backend")
    (description "Rust private crates registry - with postgres backend.")
    (license license:expat)))

;;; rustdesk-git — Yet another remote desktop software, written in Rust. Works out of the
(define-public rustdesk-git
  (package
    (name "rustdesk-git")
    (version "1.4.2.r10726.g878e1ff")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rustdesk-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rustdesk.com/")
    (synopsis "yet another remote desktop software, written in Rust. Works out of the box, n")
    (description "Yet another remote desktop software, written in Rust. Works out of the box, no configuration required. Great alternative to TeamViewer and AnyDesk!.")
    (license license:agpl3)))

;;; klogg-bin-git — A multi-platform GUI application that helps browse and search through 
(define-public klogg-bin-git
  (package
    (name "klogg-bin-git")
    (version "24.11.0.1685")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/klogg-bin-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://klogg.filimonov.dev")
    (synopsis "a multi-platform GUI application that helps browse and search through long an")
    (description "A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail.")
    (license license:gpl3+)))

;;; obmenu-generator — A fast pipe/static menu generator for the Openbox Window Manager (with
(define-public obmenu-generator
  (package
    (name "obmenu-generator")
    (version "0.93")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/trizen/obmenu-generator/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/trizen/obmenu-generator")
    (synopsis "a fast pipe/static menu generator for the Openbox Window Manager (with icons ")
    (description "A fast pipe/static menu generator for the Openbox Window Manager (with icons support).")
    (license license:gpl3+)))

;;; eternalterminal-server — Re-Connectable Terminal connection. Includes only the server.
(define-public eternalterminal-server
  (package
    (name "eternalterminal-server")
    (version "6.2.11")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eternalterminal-server.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mistertea.github.io/EternalTerminal/")
    (synopsis "re-Connectable Terminal connection. Includes only the server")
    (description "Re-Connectable Terminal connection. Includes only the server.")
    (license license:asl2.0)))

;;; eternalterminal-client — Re-Connectable Terminal connection. Includes only the client.
(define-public eternalterminal-client
  (package
    (name "eternalterminal-client")
    (version "6.2.11")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eternalterminal-client.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mistertea.github.io/EternalTerminal/")
    (synopsis "re-Connectable Terminal connection. Includes only the client")
    (description "Re-Connectable Terminal connection. Includes only the client.")
    (license license:asl2.0)))

;;; triplea — An online multiplayer turn based strategy game and board game engine.
(define-public triplea
  (package
    (name "triplea")
    (version "2.7.14900")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/triplea.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.triplea-game.org/")
    (synopsis "an online multiplayer turn based strategy game and board game engine")
    (description "An online multiplayer turn based strategy game and board game engine.")
    (license license:gpl3+)))

;;; rcl — A reasonable configuration language.
(define-public rcl
  (package
    (name "rcl")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rcl.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rcl-lang.org/")
    (synopsis "a reasonable configuration language")
    (description "A reasonable configuration language.")
    (license license:asl2.0)))

;;; offline-page-downloader — Download web pages for offline use.
(define-public offline-page-downloader
  (package
    (name "offline-page-downloader")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/metatronslove/offline-downloader-script-and-gui/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/metatronslove/offline-downloader-script-and-gui")
    (synopsis "download web pages for offline use")
    (description "Download web pages for offline use.")
    (license license:expat)))

;;; protoc-gen-psrpc — PubSub-RPC and Protobuf Generators.
(define-public protoc-gen-psrpc
  (package
    (name "protoc-gen-psrpc")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/livekit/psrpc/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/livekit/psrpc/tree/main/protoc-gen-psrpc")
    (synopsis "pubSub-RPC and Protobuf Generators")
    (description "PubSub-RPC and Protobuf Generators.")
    (license license:asl2.0)))

;;; masscanned-git — A low-interaction focused on network scanners and bots. It integrates 
(define-public masscanned-git
  (package
    (name "masscanned-git")
    (version "0.2.0.dev44")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/masscanned-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ivre.rocks/")
    (synopsis "a low-interaction focused on network scanners and bots. It integrates very we")
    (description "A low-interaction focused on network scanners and bots. It integrates very well with IVRE to build a self-hosted alternative to GreyNoise.")
    (license license:gpl3+)))

;;; deepl-linux-electron — DeepL Integration for Linux. Select text in any application and simply
(define-public deepl-linux-electron
  (package
    (name "deepl-linux-electron")
    (version "1.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/kumakichi/Deepl-linux-electron/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kumakichi/Deepl-linux-electron")
    (synopsis "deepL Integration for Linux. Select text in any application and simply press ")
    (description "DeepL Integration for Linux. Select text in any application and simply press Ctrl+C and another shortcut to translate it.(Use system-wide electron).")
    (license license:expat)))

;;; mdk3 — WLAN penetration tool.
(define-public mdk3
  (package
    (name "mdk3")
    (version "v6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mdk3.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.kali.org/tools/mdk3/")
    (synopsis "wLAN penetration tool")
    (description "WLAN penetration tool.")
    (license license:gpl2)))

;;; xcursor-simp1e-tokyo-night-storm — An aesthetic cursor theme.
(define-public xcursor-simp1e-tokyo-night-storm
  (package
    (name "xcursor-simp1e-tokyo-night-storm")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-tokyo-night-light — An aesthetic cursor theme.
(define-public xcursor-simp1e-tokyo-night-light
  (package
    (name "xcursor-simp1e-tokyo-night-light")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-tokyo-night — An aesthetic cursor theme.
(define-public xcursor-simp1e-tokyo-night
  (package
    (name "xcursor-simp1e-tokyo-night")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-solarized-light — An aesthetic cursor theme.
(define-public xcursor-simp1e-solarized-light
  (package
    (name "xcursor-simp1e-solarized-light")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-solarized-dark — An aesthetic cursor theme.
(define-public xcursor-simp1e-solarized-dark
  (package
    (name "xcursor-simp1e-solarized-dark")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-rose-pine-moon — An aesthetic cursor theme.
(define-public xcursor-simp1e-rose-pine-moon
  (package
    (name "xcursor-simp1e-rose-pine-moon")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-rose-pine-dawn — An aesthetic cursor theme.
(define-public xcursor-simp1e-rose-pine-dawn
  (package
    (name "xcursor-simp1e-rose-pine-dawn")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-rose-pine — An aesthetic cursor theme.
(define-public xcursor-simp1e-rose-pine
  (package
    (name "xcursor-simp1e-rose-pine")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-nord-light — An aesthetic cursor theme.
(define-public xcursor-simp1e-nord-light
  (package
    (name "xcursor-simp1e-nord-light")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-nord-dark — An aesthetic cursor theme.
(define-public xcursor-simp1e-nord-dark
  (package
    (name "xcursor-simp1e-nord-dark")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-mix-light — An aesthetic cursor theme.
(define-public xcursor-simp1e-mix-light
  (package
    (name "xcursor-simp1e-mix-light")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-mix-dark — An aesthetic cursor theme.
(define-public xcursor-simp1e-mix-dark
  (package
    (name "xcursor-simp1e-mix-dark")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-gruvbox-light — An aesthetic cursor theme.
(define-public xcursor-simp1e-gruvbox-light
  (package
    (name "xcursor-simp1e-gruvbox-light")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-gruvbox-dark — An aesthetic cursor theme.
(define-public xcursor-simp1e-gruvbox-dark
  (package
    (name "xcursor-simp1e-gruvbox-dark")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-dark — An aesthetic cursor theme.
(define-public xcursor-simp1e-dark
  (package
    (name "xcursor-simp1e-dark")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-catpuccin-mocha — An aesthetic cursor theme.
(define-public xcursor-simp1e-catpuccin-mocha
  (package
    (name "xcursor-simp1e-catpuccin-mocha")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-catpuccin-macchiato — An aesthetic cursor theme.
(define-public xcursor-simp1e-catpuccin-macchiato
  (package
    (name "xcursor-simp1e-catpuccin-macchiato")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-catpuccin-latte — An aesthetic cursor theme.
(define-public xcursor-simp1e-catpuccin-latte
  (package
    (name "xcursor-simp1e-catpuccin-latte")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-catpuccin-frappe — An aesthetic cursor theme.
(define-public xcursor-simp1e-catpuccin-frappe
  (package
    (name "xcursor-simp1e-catpuccin-frappe")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-breeze-dark — An aesthetic cursor theme.
(define-public xcursor-simp1e-breeze-dark
  (package
    (name "xcursor-simp1e-breeze-dark")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-breeze — An aesthetic cursor theme.
(define-public xcursor-simp1e-breeze
  (package
    (name "xcursor-simp1e-breeze")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-adw-dark — An aesthetic cursor theme.
(define-public xcursor-simp1e-adw-dark
  (package
    (name "xcursor-simp1e-adw-dark")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e-adw — An aesthetic cursor theme.
(define-public xcursor-simp1e-adw
  (package
    (name "xcursor-simp1e-adw")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; xcursor-simp1e — An aesthetic cursor theme.
(define-public xcursor-simp1e
  (package
    (name "xcursor-simp1e")
    (version "20250223")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cursors/simp1e/-/archive/v" version "/simp1e-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cursors/simp1e")
    (synopsis "an aesthetic cursor theme")
    (description "An aesthetic cursor theme.")
    (license license:gpl3+)))

;;; tal-noisemaker-vst-bin — A free soft synth by TAL Software - VST plugin.
(define-public tal-noisemaker-vst-bin
  (package
    (name "tal-noisemaker-vst-bin")
    (version "5.0.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tal-noisemaker-vst-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tal-software.com/products/tal-noisemaker")
    (synopsis "a free soft synth by TAL Software - VST plugin")
    (description "A free soft synth by TAL Software - VST plugin.")
    (license license:non-copyleft)))

;;; tal-noisemaker-clap-bin — A free soft synth by TAL Software - CLAP plugin.
(define-public tal-noisemaker-clap-bin
  (package
    (name "tal-noisemaker-clap-bin")
    (version "5.0.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tal-noisemaker-clap-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tal-software.com/products/tal-noisemaker")
    (synopsis "a free soft synth by TAL Software - CLAP plugin")
    (description "A free soft synth by TAL Software - CLAP plugin.")
    (license license:non-copyleft)))

;;; pipman-git — Generate PKGBUILD from pip packages.
(define-public pipman-git
  (package
    (name "pipman-git")
    (version "1.1.r0.g2a4c138")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/sollidsnake/pipman/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://github.com/sollidsnake/pipman")
    (synopsis "generate PKGBUILD from pip packages")
    (description "Generate PKGBUILD from pip packages.")
    (license license:gpl3+)))

;;; adwaita-cursors-git — GNOME standard cursors.
(define-public adwaita-cursors-git
  (package
    (name "adwaita-cursors-git")
    (version "44.0.r44.ge1528589b")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/adwaita-cursors-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.gnome.org/GNOME/adwaita-icon-theme")
    (synopsis "gNOME standard cursors")
    (description "GNOME standard cursors.")
    (license #f)))

;;; python-commitizen — Create committing rules for projects, auto bump versions, and auto cha
(define-public python-commitizen
  (package
    (name "python-commitizen")
    (version "4.13.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/commitizen-tools/commitizen/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/commitizen-tools/commitizen")
    (synopsis "create committing rules for projects, auto bump versions, and auto changelog ")
    (description "Create committing rules for projects, auto bump versions, and auto changelog generation.")
    (license license:expat)))

;;; smemstat — Smemstat reports the physical memory usage taking into consideration s
(define-public smemstat
  (package
    (name "smemstat")
    (version "0.02.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ColinIanKing/smemstat/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ColinIanKing/smemstat")
    (synopsis "smemstat reports the physical memory usage taking into consideration shared m")
    (description "Smemstat reports the physical memory usage taking into consideration shared memory.")
    (license license:gpl2+)))

;;; gnome-shell-extension-freon — Displays: CPU temperature, HDD/SSD temperature, video card temperature
(define-public gnome-shell-extension-freon
  (package
    (name "gnome-shell-extension-freon")
    (version "61")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/UshakovVasilii/gnome-shell-extension-freon/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/UshakovVasilii/gnome-shell-extension-freon")
    (synopsis "displays: CPU temperature, HDD/SSD temperature, video card temperature (nVidi")
    (description "Displays: CPU temperature, HDD/SSD temperature, video card temperature (nVidia/Catalyst), voltage and fan RPM in a GNOME Shell top bar pop-down.")
    (license license:gpl3+)))

;;; figma-linux — The collaborative interface design tool. Unofficial Figma desktop clie
(define-public figma-linux
  (package
    (name "figma-linux")
    (version "0.11.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Figma-Linux/figma-linux/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Figma-Linux/figma-linux")
    (synopsis "the collaborative interface design tool. Unofficial Figma desktop client for ")
    (description "The collaborative interface design tool. Unofficial Figma desktop client for Linux.")
    (license license:gpl2)))
