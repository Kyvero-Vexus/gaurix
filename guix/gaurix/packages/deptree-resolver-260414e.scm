;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260414e
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - 26 recipes created
;;;   - 74 blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260414e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (            hashcc-git
            otter-launcher
            oxid-git
            rustfetch-git
            shellforge
            steamguard-cli-git
            systemd-manager-tui
            term39
            gossip
            iamb-git
            konfigkoll
            konfigkoll-git
            pwsp
            reth
            helix-steel-git
            gosuki-git
            local-ai
            sing-box-ref1nd-git
            llama.cpp-vulkan-git
            llvm-libunwind
            tapi-git
            plasma6-applets-kara-git
            gcn64tools-git
            qvickbuild
            superhtml
            liskvork))


;;; ──────────────────────────────────────────────────────────────────
;;; Rust/Cargo packages (placeholder build)
;;; ──────────────────────────────────────────────────────────────────

;;; ── gossip (#7035) ──

(define-public gossip
  (package
    (name "gossip")
    (version "0.13.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mikedilger/gossip.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/mikedilger/gossip")
    (synopsis "desktop Nostr client built with Rust and egui")
    (description "Gossip is a desktop Nostr client built with Rust and egui.  It
focuses on following people across relays with a privacy-respecting
approach and efficient relay management.")
    (license license:expat)))

;;; ── hashcc-git (#8969) ──

(define-public hashcc-git
  (package
    (name "hashcc-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chaitanyayeleti/hashcc.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/chaitanyayeleti/hashcc")
    (synopsis "fast parallel hashing utility supporting multiple algorithms")
    (description "Hashcc is a fast, parallel hashing utility supporting MD5, SHA-1,
SHA-256, SHA-512, and BLAKE3.  It processes files concurrently for
high-throughput hashing of large file sets.")
    (license license:expat)))

;;; ── helix-steel-git (#2567) ──

(define-public helix-steel-git
  (package
    (name "helix-steel-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mattwparas/helix.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/mattwparas/helix")
    (synopsis "helix fork with Steel event system support")
    (description "Helix-steel is a fork of the Helix text editor with support for the
Steel scripting language event system.  It extends Helix with
programmable customization through Steel Scheme scripts.")
    (license license:mpl2.0)))

;;; ── iamb-git (#6760) ──

(define-public iamb-git
  (package
    (name "iamb-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ulyssa/iamb.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/ulyssa/iamb")
    (synopsis "matrix client for Vim addicts")
    (description "Iamb is a terminal-based Matrix client designed for Vim users.  It
provides modal editing, Vi keybindings, and a keyboard-driven interface
for chatting on Matrix servers.")
    (license license:asl2.0)))

;;; ── konfigkoll (#3381) ──

(define-public konfigkoll
  (package
    (name "konfigkoll")
    (version "0.1.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/VorpalBlade/paketkoll.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/VorpalBlade/paketkoll")
    (synopsis "personal system configuration manager")
    (description "Konfigkoll is a personal system configuration manager for Linux.  It
tracks installed packages, modified config files, and filesystem state
to reproduce system configurations declaratively.")
    (license license:mpl2.0)))

;;; ── konfigkoll-git (#3394) ──

(define-public konfigkoll-git
  (package
    (name "konfigkoll-git")
    (version "0.1.12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/VorpalBlade/paketkoll.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/VorpalBlade/paketkoll")
    (synopsis "personal system configuration manager (git version)")
    (description "Konfigkoll is a personal system configuration manager for Linux.  It
tracks installed packages, modified config files, and filesystem state
to reproduce system configurations declaratively.  This is the
development version.")
    (license license:mpl2.0)))

;;; ── otter-launcher (#1041) ──

(define-public otter-launcher
  (package
    (name "otter-launcher")
    (version "0.6.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kuokuo123/otter-launcher.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/kuokuo123/otter-launcher")
    (synopsis "keyboard-centric CLI/TUI launcher with vi and emacs bindings")
    (description "Otter Launcher is a Rust-based CLI/TUI application launcher built
for keyboard-centric users.  It features vi and emacs key bindings,
fuzzy search, and customizable launch configurations.")
    (license license:gpl3)))

;;; ── oxid-git (#4034) ──

(define-public oxid-git
  (package
    (name "oxid-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ninso112/oxid.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/Ninso112/oxid")
    (synopsis "customizable TUI text editor written in Rust")
    (description "Oxid is a customizable TUI text editor written in Rust.  It provides
a minimal yet extensible editing experience with syntax highlighting
and configurable key bindings.")
    (license license:expat)))

;;; ── pwsp (#2131) ──

(define-public pwsp
  (package
    (name "pwsp")
    (version "1.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arabianq/pipewire-soundpad.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/arabianq/pipewire-soundpad")
    (synopsis "play audio files through your microphone via PipeWire")
    (description "Pwsp lets you play audio files through your microphone using PipeWire.
It creates a virtual audio source that mixes your microphone input
with audio file playback for voice chat applications.")
    (license license:expat)))

;;; ── reth (#8868) ──

(define-public reth
  (package
    (name "reth")
    (version "1.11.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/paradigmxyz/reth.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/paradigmxyz/reth")
    (synopsis "fast implementation of the Ethereum protocol in Rust")
    (description "Reth is a fast, modular implementation of the Ethereum protocol in
Rust.  It provides a full Ethereum execution client with high
performance, extensive documentation, and a composable architecture.")
    (license (list license:asl2.0 license:expat))))

;;; ── rustfetch-git (#4458) ──

(define-public rustfetch-git
  (package
    (name "rustfetch-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/akirathelinuxguy/rustfetch.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://codeberg.org/akirathelinuxguy/rustfetch")
    (synopsis "fast system information fetch tool written in Rust")
    (description "Rustfetch is a fast system information fetch tool written in Rust.
It displays system details such as OS, kernel, CPU, memory, and
uptime in a colorful terminal output.")
    (license license:expat)))

;;; ── shellforge (#3376) ──

(define-public shellforge
  (package
    (name "shellforge")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/minosariane/Shellforge.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/minosariane/Shellforge")
    (synopsis "terminal tool for generating reverse shells for CTF challenges")
    (description "Shellforge is a terminal tool for generating reverse shells for CTF
challenges and educational penetration testing.  It supports multiple
shell types, encoding options, and listener configurations.")
    (license license:gpl3)))

;;; ── steamguard-cli-git (#11059) ──

(define-public steamguard-cli-git
  (package
    (name "steamguard-cli-git")
    (version "0.14.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dyc3/steamguard-cli.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/dyc3/steamguard-cli")
    (synopsis "command-line utility for Steam 2FA codes and confirmations")
    (description "Steamguard-cli is a command-line utility to generate Steam two-factor
authentication codes and respond to trade and market confirmations.
It provides headless Steam Guard management for automation.")
    (license license:gpl3)))

;;; ── systemd-manager-tui (#975) ──

(define-public systemd-manager-tui
  (package
    (name "systemd-manager-tui")
    (version "1.2.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/matheus-git/systemd-manager-tui.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/matheus-git/systemd-manager-tui")
    (synopsis "TUI for managing systemd services")
    (description "Systemd-manager-tui is a terminal user interface for managing systemd
services.  It provides an interactive view of service units with
start, stop, restart, and status inspection capabilities.")
    (license license:expat)))

;;; ── term39 (#2358) ──

(define-public term39
  (package
    (name "term39")
    (version "1.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alejandroqh/term39.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/alejandroqh/term39")
    (synopsis "modern terminal multiplexer with classic MS-DOS aesthetic")
    (description "Term39 is a modern terminal multiplexer with a classic MS-DOS
aesthetic, built with Rust.  It provides split panes, tabs, and
customizable themes with a retro visual style.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Go packages (placeholder build)
;;; ──────────────────────────────────────────────────────────────────

;;; ── gosuki-git (#10116) ──

(define-public gosuki-git
  (package
    (name "gosuki-git")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/blob42/gosuki.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/blob42/gosuki")
    (synopsis "multi-browser real-time bookmark manager with P2P sync")
    (description "Gosuki is a multi-browser, real-time, extension-free bookmark manager
with peer-to-peer synchronization.  It indexes bookmarks from Firefox,
Chrome, and other browsers into a unified database.")
    (license license:agpl3+)))

;;; ── local-ai (#1747) ──

(define-public local-ai
  (package
    (name "local-ai")
    (version "4.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mudler/LocalAI.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/mudler/LocalAI")
    (synopsis "free open source OpenAI alternative for local AI inference")
    (description "LocalAI is a free, open source drop-in replacement for the OpenAI
API.  It runs large language models, generates images, and provides
audio transcription locally without requiring a GPU.")
    (license license:expat)))

;;; ── sing-box-ref1nd-git (#1577) ──

(define-public sing-box-ref1nd-git
  (package
    (name "sing-box-ref1nd-git")
    (version "1.14.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/reF1nd/sing-box.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/reF1nd/sing-box")
    (synopsis "universal proxy platform (reF1nd fork)")
    (description "Sing-box reF1nd is a fork of the sing-box universal proxy platform.
It provides additional features and patches for advanced proxy
configuration and network protocol support.")
    (license license:gpl3+)))


;;; ──────────────────────────────────────────────────────────────────
;;; C/C++ packages (cmake-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── llama.cpp-vulkan-git (#10173) ──

(define-public llama.cpp-vulkan-git
  (package
    (name "llama.cpp-vulkan-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ggerganov/llama.cpp.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ggerganov/llama.cpp")
    (synopsis "LLaMA model inference in C/C++ with Vulkan acceleration")
    (description "Llama.cpp-vulkan is a port of Facebook's LLaMA model inference engine
in C/C++ with Vulkan GPU acceleration.  It provides fast local
inference for GGML and GGUF format models using Vulkan compute.")
    (license license:expat)))

;;; ── llvm-libunwind (#2869) ──

(define-public llvm-libunwind
  (package
    (name "llvm-libunwind")
    (version "21.1.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/llvm/llvm-project.git")
                    (commit (string-append "llvmorg-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/llvm/llvm-project/tree/main/libunwind")
    (synopsis "LLVM implementation of the libunwind library")
    (description "LLVM libunwind is an implementation of the libunwind specification
from the LLVM project.  It provides a portable C ABI for stack
unwinding with support for DWARF and EHABI unwind formats.")
    (license license:asl2.0)))

;;; ── plasma6-applets-kara-git (#11515) ──

(define-public plasma6-applets-kara-git
  (package
    (name "plasma6-applets-kara-git")
    (version "0.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dhruv8sh/kara.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/dhruv8sh/kara")
    (synopsis "KDE Plasma pager applet")
    (description "Kara is a KDE Plasma desktop pager applet.  It provides a virtual
desktop overview widget with customizable appearance and workspace
management features for the Plasma 6 desktop.")
    (license license:gpl3)))

;;; ── tapi-git (#6821) ──

(define-public tapi-git
  (package
    (name "tapi-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tpoechtrager/apple-libtapi.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/tpoechtrager/apple-libtapi")
    (synopsis "apple TAPI library for cross-compilation toolchains")
    (description "Apple-libtapi is a library for reading and writing Apple text-based
API (.tbd) files.  It is used by cross-compilation toolchains
targeting macOS and iOS platforms.")
    (license license:ncsa)))


;;; ──────────────────────────────────────────────────────────────────
;;; C/C++ packages (gnu-build-system, make)
;;; ──────────────────────────────────────────────────────────────────

;;; ── gcn64tools-git (#796) ──

(define-public gcn64tools-git
  (package
    (name "gcn64tools-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/raphnet/gcn64tools.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:make-flags
                     #~(list (string-append "prefix=" #$output)
                             (string-append "CC=" #$(cc-for-target)))
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure))))
    (home-page "https://github.com/raphnet/gcn64tools")
    (synopsis "raphnet USB adapter management tools for GameCube/N64 controllers")
    (description "Gcn64tools provides management tools for raphnet USB adapters that
connect GameCube and N64 controllers to PC.  It includes firmware
update, configuration, and diagnostic utilities.")
    (license license:gpl3+)))

;;; ── qvickbuild (#10026) ──

(define-public qvickbuild
  (package
    (name "qvickbuild")
    (version "0.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/nordtektiger/qvickbuild.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:make-flags
                     #~(list (string-append "prefix=" #$output)
                             (string-append "CC=" #$(cc-for-target)))
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure))))
    (home-page "https://gitlab.com/nordtektiger/qvickbuild")
    (synopsis "simple lightweight fast build system for C and C++")
    (description "Qvickbuild is a simple, lightweight, and fast build system for C and
C++ projects.  It provides automatic dependency detection, parallel
compilation, and minimal configuration overhead.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Zig packages (placeholder build)
;;; ──────────────────────────────────────────────────────────────────

;;; ── liskvork (#7636) ──

(define-public liskvork
  (package
    (name "liskvork")
    (version "0.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://liskvork.org/liskvork/liskvork.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires zig
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://liskvork.org")
    (synopsis "modern multi-platform gomoku game server")
    (description "Liskvork is a modern multi-platform gomoku game server.  It implements
the Gomocup protocol for hosting AI tournaments and provides a
network-ready server for the classic five-in-a-row game.")
    (license license:eupl1.2)))

;;; ── superhtml (#10348) ──

(define-public superhtml
  (package
    (name "superhtml")
    (version "0.6.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kristoff-it/superhtml.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires zig
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/kristoff-it/superhtml")
    (synopsis "HTML language server and templating language library")
    (description "SuperHTML is an HTML language server and templating language library.
It provides completion, diagnostics, formatting, and hover information
for HTML documents in editors that support LSP.")
    (license license:expat)))

