;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418aj
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (13):
;;;        1.  lobster (copy-build-system, v4.6.2, GPL-2.0)
;;;        2.  q5k-usb-udev (copy-build-system, v2026.02.28, BSD-2)
;;;        3.  wrkflw-bin (copy-build-system, v0.7.3, MIT)
;;;        4.  omp-manager-bin (copy-build-system, v0.1.2, MIT)
;;;        5.  cliamp (copy-build-system, v1.37.0, MIT)
;;;        6.  dpibreak (copy-build-system, v0.6.1, GPL-3.0+)
;;;        7.  netwatch-tui (copy-build-system, v0.12.3, MIT)
;;;        8.  zignal-git (copy-build-system, v0.10.0, MIT)
;;;        9.  comp-scan-bin (copy-build-system, v0.1.0, MIT)
;;;       10.  deepfilternet-demos-git (copy-build-system, v0.5.6, MIT+Apache-2.0)
;;;       11.  szsol-rs (copy-build-system, v1.1.0, GPL-3.0)
;;;       12.  qpdf-zopfli (cmake-build-system, v11.8.0, Apache-2.0)
;;;       13.  gbdk-2020 (copy-build-system, v4.5.0, GPL-2.0)
;;;
;;; BLOCKED EXHAUSTED (17):
;;;       14.  utiliti -> GRADLE_BUILD: Java/Gradle not supported in Guix
;;;       15.  libavif-noglycin -> ARCH_SPECIFIC: libavif already in Guix
;;;       16.  libheif-noglycin -> ARCH_SPECIFIC: libheif already in Guix
;;;       17.  libjxl-noglycin -> ARCH_SPECIFIC: libjxl already in Guix
;;;       18.  libjxl-noglycin-doc -> ARCH_SPECIFIC: libjxl docs in Guix
;;;       19.  tilem-gtk3-git -> MISSING_DEP_CHAIN: needs tilibs suite
;;;       20.  fish-session -> UNLICENSED: not a recognized FOSS license
;;;       21.  framework-control-bin -> MISSING_DEP: framework-system + systemd
;;;       22.  synergy3-bin -> PROPRIETARY: commercial EULA
;;;       23.  spinwheel-pipewire -> NO_UPSTREAM: Codeberg repo 404
;;;       24.  bapctools-git -> COMPLEX_DEPS: heavy Python dep chain
;;;       25.  renamemytvseries-gtk-bin -> PROPRIETARY: closed source
;;;       26.  ipmctl-git -> COMPLEX_BUILD: edk2 submodule + patches
;;;       27.  uac-polkit-agent-git -> COMPLEX_DEPS: KDE6/Qt6 chain
;;;       28.  op-cache-git -> PROPRIETARY_DEP: requires 1Password CLI
;;;       29.  reqable-bin -> PROPRIETARY: closed-source custom license
;;;       30.  c47-bin -> ALREADY_PACKAGED_PRIOR: c47 in recipe-resolver-260416a
;;;
;;; NOTE: All hashes are placeholders (base32 "0000...").
;;; Run `guix build -L guix <name>` to obtain actual hashes from error output.

(define-module (gaurix packages recipe-resolver-260418aj)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pdf)
  #:export (lobster
            q5k-usb-udev
            wrkflw-bin
            omp-manager-bin
            cliamp
            dpibreak
            netwatch-tui
            zignal-git
            comp-scan-bin
            deepfilternet-demos-git
            szsol-rs
            qpdf-zopfli
            gbdk-2020))

;;; -------------------------------------------------------------------
;;; 1. lobster --- Terminal movie/show streaming script
;;; POSIX shell script for streaming movies/shows from the terminal.
;;; -------------------------------------------------------------------
(define-public lobster
  (package
    (name "lobster")
    (version "4.6.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/justchokingaround/lobster")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lobster" "bin/lobster"))))
    (inputs (list bash))
    (home-page "https://github.com/justchokingaround/lobster")
    (synopsis "shell script to watch movies and shows from the terminal")
    (description "Lobster is a POSIX-compliant shell script for streaming
movies and TV shows directly from the terminal.  It supports searching,
tracking watch history, and multiple video sources.  Requires common
utilities such as @code{curl}, @code{fzf}, and @code{mpv}.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 2. q5k-usb-udev --- Udev rules for Qudelix-5K DAC
;;; Sets MODE 0666 permissions for the Qudelix-5K USB DAC/amplifier.
;;; -------------------------------------------------------------------
(define-public q5k-usb-udev
  (package
    (name "q5k-usb-udev")
    (version "2026.02.28")
    (source (origin
              (method url-fetch)
              (uri "https://gist.githubusercontent.com/hmtheboy154/21c0a25ff025667981a35b6656f7da69/raw/69-qudelix-5k.rules")
              (file-name "69-qudelix-5k.rules")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "69-qudelix-5k.rules"))))
           #:install-plan
           #~'(("69-qudelix-5k.rules" "lib/udev/rules.d/69-qudelix-5k.rules"))))
    (home-page "https://gist.github.com/hmtheboy154/21c0a25ff025667981a35b6656f7da69")
    (synopsis "udev rules for the Qudelix-5K USB DAC/amplifier")
    (description "Udev rules that set appropriate device permissions for
the Qudelix-5K USB DAC/amplifier across various sample rate configurations.
Installs rules to @file{lib/udev/rules.d/} for automatic device setup.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 3. wrkflw-bin --- GitHub Actions workflow validator (prebuilt)
;;; CLI tool to validate and execute GitHub Actions workflows locally.
;;; -------------------------------------------------------------------
(define-public wrkflw-bin
  (package
    (name "wrkflw-bin")
    (version "0.7.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bahdotsh/wrkflw/releases/download/v"
                    version "/wrkflw-v" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wrkflw" "bin/wrkflw"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/wrkflw")
    (synopsis "validate and run GitHub Actions workflows locally")
    (description "Wrkflw is a command-line tool for validating and executing
GitHub Actions workflow files locally.  It parses workflow YAML files and
checks for common errors before pushing to CI.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. omp-manager-bin --- Oh My Posh theme manager (prebuilt)
;;; TUI application for managing Oh My Posh prompt themes and Nerd Fonts.
;;; -------------------------------------------------------------------
(define-public omp-manager-bin
  (package
    (name "omp-manager-bin")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/psmux/omp-manager/releases/download/v"
                    version "/omp-manager-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("omp-manager" "bin/omp-manager"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/psmux/omp-manager")
    (synopsis "TUI manager for Oh My Posh themes and Nerd Fonts")
    (description "Omp-manager is a terminal user interface application for
installing and managing Oh My Posh prompt themes and Nerd Fonts.  It
provides an interactive browser for discovering and applying prompt
customizations.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. cliamp --- Retro terminal music player (prebuilt)
;;; Terminal music player inspired by Winamp 2.x with streaming support.
;;; -------------------------------------------------------------------
(define-public cliamp
  (package
    (name "cliamp")
    (version "1.37.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bjarneo/cliamp/releases/download/v"
                    version "/cliamp-linux-amd64"))
              (file-name (string-append "cliamp-" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "cliamp")
                   (chmod "cliamp" #o755))))
           #:install-plan
           #~'(("cliamp" "bin/cliamp"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bjarneo/cliamp")
    (synopsis "retro terminal music player inspired by Winamp 2.x")
    (description "Cliamp is a terminal music player with a retro Winamp
2.x-inspired interface.  It supports playing local audio files as well as
streaming from YouTube, Spotify, and SoundCloud.  Written in Go as a
statically-linked binary.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. dpibreak --- DPI circumvention tool (prebuilt musl)
;;; Fast DPI (Deep Packet Inspection) circumvention tool using nftables.
;;; -------------------------------------------------------------------
(define-public dpibreak
  (package
    (name "dpibreak")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dilluti0n/dpibreak/releases/download/v"
                    version "/DPIBreak-" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("DPIBreak" "bin/dpibreak"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dilluti0n/dpibreak")
    (synopsis "DPI circumvention tool using nftables queue")
    (description "DPIBreak is a fast tool for circumventing Deep Packet
Inspection using nftables netfilter queue.  It modifies network packets
to bypass DPI-based traffic filtering.  Requires nftables and elevated
privileges at runtime.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7. netwatch-tui --- Network diagnostics TUI (prebuilt)
;;; Real-time network monitoring tool like htop for networking.
;;; -------------------------------------------------------------------
(define-public netwatch-tui
  (package
    (name "netwatch-tui")
    (version "0.12.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/matthart1983/netwatch/releases/download/v"
                    version "/netwatch-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("netwatch" "bin/netwatch"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/matthart1983/netwatch")
    (synopsis "real-time network diagnostics terminal interface")
    (description "Netwatch is a real-time network diagnostics tool with a
terminal user interface, similar to @code{htop} for networking.  It provides
live monitoring of network connections, bandwidth usage, and packet
statistics.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. zignal-git --- Zig image processing CLI (prebuilt)
;;; Zero-dependency image processing library and CLI written in Zig.
;;; -------------------------------------------------------------------
(define-public zignal-git
  (package
    (name "zignal-git")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/arrufat/zignal/releases/download/"
                    version "/zignal-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zignal" "bin/zignal"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/arrufat/zignal")
    (synopsis "zero-dependency image processing tool written in Zig")
    (description "Zignal is a zero-dependency image processing library and
command-line tool written in Zig.  It provides signal and image processing
capabilities as a small statically-linked binary.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. comp-scan-bin --- Local AI system scanner (prebuilt)
;;; CLI tool that scans your system and suggests improvements via Ollama.
;;; -------------------------------------------------------------------
(define-public comp-scan-bin
  (package
    (name "comp-scan-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vvk147/comp-scan/releases/download/v"
                    version "/compscan-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("compscan" "bin/compscan"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vvk147/comp-scan")
    (synopsis "local AI agent that scans systems and suggests improvements")
    (description "Comp-scan is a command-line tool that scans your system,
observes usage patterns, and suggests improvements using a local AI model
via Ollama.  It provides system analysis and optimization recommendations
without sending data to external services.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. deepfilternet-demos-git --- Deep noise filter (prebuilt musl)
;;; Deep learning speech enhancement and noise reduction tool.
;;; -------------------------------------------------------------------
(define-public deepfilternet-demos-git
  (package
    (name "deepfilternet-demos-git")
    (version "0.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Rikorose/DeepFilterNet/releases/download/v"
                    version "/deep-filter-" version
                    "-x86_64-unknown-linux-musl"))
              (file-name (string-append "deep-filter-" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "deep-filter")
                   (chmod "deep-filter" #o755))))
           #:install-plan
           #~'(("deep-filter" "bin/deep-filter"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Rikorose/DeepFilterNet")
    (synopsis "deep learning speech enhancement and noise reduction")
    (description "DeepFilterNet is a deep-learning-based speech enhancement
and noise reduction tool for 48 kHz audio.  This package provides the
@command{deep-filter} command-line demo application as a statically-linked
musl binary.  It can process audio files to remove background noise while
preserving speech quality.")
    (license (list license:expat license:asl2.0))))

;;; -------------------------------------------------------------------
;;; 11. szsol-rs --- SHENZHEN I/O solitaire game (prebuilt musl)
;;; TUI/CLI solitaire card game with solver from SHENZHEN I/O.
;;; -------------------------------------------------------------------
(define-public szsol-rs
  (package
    (name "szsol-rs")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ghoker143/szsol-rs/releases/download/v"
                    version "/szsol-rs-x86_64-unknown-linux-musl.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("szsol-rs" "bin/szsol-rs"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ghoker143/szsol-rs")
    (synopsis "SHENZHEN I/O solitaire card game with solver")
    (description "Szsol-rs is a terminal-based implementation of the solitaire
card game from SHENZHEN I/O with a built-in solver.  It supports both TUI
and CLI modes for playing and automatically solving games.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 12. qpdf-zopfli --- QPDF with Zopfli compression support
;;; QPDF PDF transformation tool compiled with Zopfli for better compression.
;;; -------------------------------------------------------------------
(define-public qpdf-zopfli
  (package
    (inherit qpdf)
    (name "qpdf-zopfli")
    (inputs (modify-inputs (package-inputs qpdf)
              (append zopfli)))
    (synopsis "PDF transformation tool with Zopfli compression support")
    (description "QPDF is a command-line tool and library for structural,
content-preserving transformations on PDF files.  This variant is compiled
with Zopfli compression support, providing better compression ratios for
PDF streams at the cost of slower compression speed.")))

;;; -------------------------------------------------------------------
;;; 13. gbdk-2020 --- Game Boy Development Kit (prebuilt)
;;; C compiler, assembler, and linker for Game Boy, NES, SMS, and GG.
;;; -------------------------------------------------------------------
(define-public gbdk-2020
  (package
    (name "gbdk-2020")
    (version "4.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gbdk-2020/gbdk-2020/releases/download/"
                    version "/gbdk-linux64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/gbdk-2020/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrappers
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (opt (string-append out "/opt/gbdk-2020"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (for-each
                      (lambda (tool)
                        (let ((target (string-append opt "/bin/" tool))
                              (link (string-append bin "/" tool)))
                          (when (file-exists? target)
                            (symlink target link))))
                      '("lcc" "sdcc" "sdasgb" "sdldgb" "bankpack"
                        "ihxcheck" "makebin"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gbdk-2020/gbdk-2020")
    (synopsis "game Boy development kit with C compiler and tools")
    (description "GBDK-2020 is a cross-platform development kit for creating
games and applications for the Game Boy, Game Boy Color, Analogue Pocket,
Mega Duck, NES, SMS, and Game Gear.  It includes a C compiler (based on
SDCC), assembler, linker, and libraries for these retro platforms.")
    (license license:gpl2)))
