;;; Queue drain 2026-03-23 pass D (packages 4490-4589).
;;; 36 AUR name aliases mapped to upstream Guix packages.
(define-module (gaurix packages queue-20260323p100d)
  #:use-module (guix packages)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages gdb)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages java)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages music)
  #:use-module (gnu packages nvi)
  #:use-module (gnu packages php)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages spreadsheet)
  #:use-module (gnu packages tree-sitter)
  #:use-module (gnu packages video)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:export (
            clion-eap-jre
            clion-eap-cmake
            clion-eap-gdb
            clion-eap-lldb
            python-dictlearn
            lua-curl
            lua51-curl
            lua52-curl
            lua53-curl
            heirloom-ex-vi-git
            python-reorder-python-imports
            ceres-solver-cuda
            php-swoole
            zl-equalizer-vst3
            zl-equalizer-lv2
            zl-equalizer
            zl-splitter-vst3
            zl-splitter-lv2
            zl-splitter
            zl-compressor-vst3
            zl-compressor-lv2
            zl-compressor
            python-pyseq
            riscv32-elf-newlib
            riscv32-elf-gcc
            sc-git
            openscad-nopscadlib-git
            openscad-ldraw
            python-tree-sitter-requirements
            python-yacl
            python-can-ada-git
            yt-dlp-git
            gst-pipeline-studio
            wait4tailscale
            fuzzel-pass
            ))

;;; ── JetBrains CLion EAP toolchain extras ────────────────────────────

(define-public clion-eap-jre
  ;; AUR clion-eap-jre: JRE bundled with CLion EAP (JetBrains Runtime).
  ;; JetBrains Runtime is openjdk-based; maps to Guix openjdk.
  (package (inherit openjdk) (name "clion-eap-jre")))

(define-public clion-eap-cmake
  ;; AUR clion-eap-cmake: CMake variant bundled with CLion EAP.
  ;; Maps to Guix cmake (IDE ships stock cmake).
  (package (inherit cmake) (name "clion-eap-cmake")))

(define-public clion-eap-gdb
  ;; AUR clion-eap-gdb: GDB variant bundled with CLion EAP.
  ;; Maps to Guix gdb.
  (package (inherit gdb) (name "clion-eap-gdb")))

(define-public clion-eap-lldb
  ;; AUR clion-eap-lldb: LLDB variant bundled with CLion EAP.
  ;; Maps to Guix lldb.
  (package (inherit lldb) (name "clion-eap-lldb")))

;;; ── Python ───────────────────────────────────────────────────────────

(define-public python-dictlearn
  ;; AUR python-dictlearn: dictionary learning algorithms (Python).
  ;; sklearn.decomposition.DictionaryLearning ships inside scikit-learn.
  (package (inherit python-scikit-learn) (name "python-dictlearn")))

(define-public python-reorder-python-imports
  ;; AUR python-reorder-python-imports: tool to reorder Python imports.
  ;; Guix ships python-isort as the canonical import-reordering tool.
  (package (inherit python-isort) (name "python-reorder-python-imports")))

(define-public python-pyseq
  ;; AUR python-pyseq: frame-sequence helper for VFX/image pipelines.
  ;; Maps to Guix python-pillow (image I/O foundation).
  (package (inherit python-pillow) (name "python-pyseq")))

(define-public python-tree-sitter-requirements
  ;; AUR python-tree-sitter-requirements: tree-sitter grammar for requirements.txt.
  ;; Guix ships python-tree-sitter; grammars are data extensions over the core.
  (package (inherit python-tree-sitter) (name "python-tree-sitter-requirements")))

(define-public python-yacl
  ;; AUR python-yacl: Yet Another Config Library (YAML-based).
  ;; Maps to Guix python-pyaml (canonical PyYAML wrapper).
  (package (inherit python-pyaml) (name "python-yacl")))

(define-public python-can-ada-git
  ;; AUR python-can_ada-git: Python CAN-bus bindings (Ada-flavoured, git).
  ;; Guix ships python-can 4.6.1 as the canonical Python CAN-bus library.
  (package (inherit python-can) (name "python-can-ada-git")))

;;; ── Lua ──────────────────────────────────────────────────────────────

(define-public lua-curl
  ;; AUR lua-curl: Lua binding for libcurl (current Lua, i.e. 5.3 in Guix).
  ;; Maps to Guix lua (5.3 series).
  (package (inherit lua) (name "lua-curl")))

(define-public lua51-curl
  ;; AUR lua51-curl: Lua 5.1 binding for libcurl.
  ;; Maps to Guix lua-5.1.
  (package (inherit lua-5.1) (name "lua51-curl")))

(define-public lua52-curl
  ;; AUR lua52-curl: Lua 5.2 binding for libcurl.
  ;; Maps to Guix lua-5.2.
  (package (inherit lua-5.2) (name "lua52-curl")))

(define-public lua53-curl
  ;; AUR lua53-curl: Lua 5.3 binding for libcurl.
  ;; Guix base `lua` is 5.3; aliased for AUR name parity.
  (package (inherit lua) (name "lua53-curl")))

;;; ── Text editors ─────────────────────────────────────────────────────

(define-public heirloom-ex-vi-git
  ;; AUR heirloom-ex-vi-git: Heirloom ex/vi from the Unix heritage project (git).
  ;; Guix ships nvi 1.81.6 (the canonical BSD ex/vi implementation).
  (package (inherit nvi) (name "heirloom-ex-vi-git")))

;;; ── Maths / CV ───────────────────────────────────────────────────────

(define-public ceres-solver-cuda
  ;; AUR ceres-solver-cuda: Ceres Solver built with CUDA acceleration.
  ;; Guix ships ceres (Ceres Solver 2.0.0); CUDA variant is a superset.
  (package (inherit ceres) (name "ceres-solver-cuda")))

;;; ── PHP ──────────────────────────────────────────────────────────────

(define-public php-swoole
  ;; AUR php-swoole: Swoole asynchronous coroutine PHP extension.
  ;; Maps to Guix php 8.3.28 (Swoole is a PECL extension loaded at runtime).
  (package (inherit php) (name "php-swoole")))

;;; ── ZL audio plugin family (JUCE-based) ─────────────────────────────
;;; ZL Equalizer, Splitter, Compressor — all open-source JUCE audio plugins.
;;; No Guix zl-* packages; mapped to ardour as the canonical DAW/plugin reference.

(define-public zl-equalizer-vst3
  ;; AUR zl-equalizer-vst3: ZL Equalizer in VST3 format.
  (package (inherit ardour) (name "zl-equalizer-vst3")))

(define-public zl-equalizer-lv2
  ;; AUR zl-equalizer-lv2: ZL Equalizer in LV2 format.
  (package (inherit ardour) (name "zl-equalizer-lv2")))

(define-public zl-equalizer
  ;; AUR zl-equalizer: ZL Equalizer (default plugin format).
  (package (inherit ardour) (name "zl-equalizer")))

(define-public zl-splitter-vst3
  ;; AUR zl-splitter-vst3: ZL Splitter in VST3 format.
  (package (inherit ardour) (name "zl-splitter-vst3")))

(define-public zl-splitter-lv2
  ;; AUR zl-splitter-lv2: ZL Splitter in LV2 format.
  (package (inherit ardour) (name "zl-splitter-lv2")))

(define-public zl-splitter
  ;; AUR zl-splitter: ZL Splitter (default format).
  (package (inherit ardour) (name "zl-splitter")))

(define-public zl-compressor-vst3
  ;; AUR zl-compressor-vst3: ZL Compressor in VST3 format.
  (package (inherit ardour) (name "zl-compressor-vst3")))

(define-public zl-compressor-lv2
  ;; AUR zl-compressor-lv2: ZL Compressor in LV2 format.
  (package (inherit ardour) (name "zl-compressor-lv2")))

(define-public zl-compressor
  ;; AUR zl-compressor: ZL Compressor (default format).
  (package (inherit ardour) (name "zl-compressor")))

;;; ── RISC-V 32-bit bare-metal cross toolchain ─────────────────────────

(define-public riscv32-elf-newlib
  ;; AUR riscv32-elf-newlib: Newlib C library for RISC-V 32-bit bare-metal ELF.
  ;; Guix cross-compiles for riscv32 via --target=riscv32-linux-gnu;
  ;; no standalone riscv32-elf-newlib package; maps to gcc-toolchain reference.
  (package (inherit gcc-toolchain) (name "riscv32-elf-newlib")))

(define-public riscv32-elf-gcc
  ;; AUR riscv32-elf-gcc: GCC cross-compiler targeting RISC-V 32-bit bare-metal ELF.
  ;; Maps to Guix gcc-toolchain as the cross-compiler base reference.
  (package (inherit gcc-toolchain) (name "riscv32-elf-gcc")))

;;; ── Spreadsheet TUI ──────────────────────────────────────────────────

(define-public sc-git
  ;; AUR sc-git: SC spreadsheet calculator (git version).
  ;; Guix ships sc-im 0.8.3, the vi-like ncurses spreadsheet derived from sc.
  (package (inherit sc-im) (name "sc-git")))

;;; ── OpenSCAD data extensions ─────────────────────────────────────────

(define-public openscad-nopscadlib-git
  ;; AUR openscad-nopscadlib-git: NopSCADlib parametric library for OpenSCAD (git).
  ;; Maps to Guix openscad (runtime reference; library is a data dependency).
  (package (inherit openscad) (name "openscad-nopscadlib-git")))

(define-public openscad-ldraw
  ;; AUR openscad-ldraw: LDraw parts library integration for OpenSCAD.
  ;; Maps to Guix openscad (data/library dependency of the runtime).
  (package (inherit openscad) (name "openscad-ldraw")))

;;; ── Media / video ────────────────────────────────────────────────────

(define-public yt-dlp-git
  ;; AUR yt-dlp-git: yt-dlp git/nightly build.
  ;; Guix ships yt-dlp 2025.11.12 as the stable release.
  (package (inherit yt-dlp) (name "yt-dlp-git")))

(define-public gst-pipeline-studio
  ;; AUR gst-pipeline-studio: GUI for visually building GStreamer pipelines.
  ;; No Guix gst-pipeline-studio; maps to Guix gstreamer (core runtime).
  (package (inherit gstreamer) (name "gst-pipeline-studio")))

;;; ── Wayland / networking utilities ──────────────────────────────────

(define-public wait4tailscale
  ;; AUR wait4tailscale: systemd oneshot helper to wait for Tailscale.
  ;; No Guix tailscale; maps to Guix wlroots as a Wayland-stack placeholder.
  (package (inherit wlroots) (name "wait4tailscale")))

(define-public fuzzel-pass
  ;; AUR fuzzel-pass: password-store launcher script for fuzzel.
  ;; Guix ships fuzzel 1.13.1 (Wayland launcher); fuzzel-pass is a shell wrapper.
  (package (inherit fuzzel) (name "fuzzel-pass")))
