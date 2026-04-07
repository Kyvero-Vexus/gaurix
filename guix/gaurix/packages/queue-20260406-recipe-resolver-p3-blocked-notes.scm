;;; Blocked notes for recipe-resolver pass 3 — 2026-04-06.
;;; 8 packages evaluated but not resolvable in this pass.
(define-module (gaurix packages queue-20260406-recipe-resolver-p3-blocked-notes))

;;; ─── BLOCKED: NO_LICENSE ───────────────────────────────────────
;;;
;;; 3084. fish-session (v0.1.8, github.com/AtefR/fish-session)
;;;   → Fish shell session manager with persistent PTY sessions.
;;;   → No LICENSE file, no license in Cargo.toml; AUR says "LicenseRef-UNLICENSED".
;;;   → Cannot package for Guix without a declared FOSS license.
;;;

;;; ─── BLOCKED: MIXED_LICENSE_COMPLEX_BUILD ──────────────────────
;;;
;;; zerotier-one (v1.16.0, github.com/zerotier/ZeroTierOne)
;;;   → Peer-to-peer software-defined WAN (SD-WAN) / virtual network.
;;;   → MPL-2.0 core + proprietary "nonfree/" controller directory.
;;;   → Complex build: custom Makefile + Rust/Cargo for zeroidc component,
;;;     bundled dependencies in ext/, requires system daemon.
;;;   → Multiple build systems (C++ make + Rust cargo) in same project.
;;;

;;; ─── BLOCKED: ARCH_LINUX_SPECIFIC ──────────────────────────────
;;;
;;; archlinux-java-run (v12, github.com/michaellass/archlinux-java-run)
;;;   → Helper script to find/launch correct JRE on Arch Linux.
;;;   → Script is hard-coded to Arch's /usr/lib/jvm/ layout and
;;;     archlinux-java framework.  Has no utility on Guix which manages
;;;     Java via its own profile/package mechanism.
;;;

;;; ─── BLOCKED: NEEDS_DOTNET_RUNTIME ─────────────────────────────
;;;
;;; 3101. dafny-bin (v4.11.0, github.com/dafny-lang/dafny)
;;;   → Verification-aware programming language (compiler + verifier).
;;;   → Requires .NET 8.0 runtime which is not available in Guix.
;;;   → Source build impossible without .NET SDK in Guix.
;;;   → Binary package bundles dotnet-runtime but needs it on PATH.
;;;

;;; ─── BLOCKED: NEEDS_NIM_TOOLCHAIN ──────────────────────────────
;;;
;;; 3095. boomer-git (no releases, github.com/tsoding/boomer)
;;;   → Screen zoomer application for X11.
;;;   → Written in Nim; no nim-build-system exists in Guix.
;;;   → Nim dependencies (x11, opengl nim packages) also need packaging.
;;;   → No tagged releases or prebuilt binaries available.
;;;   → Last commit 2024-02-08.
;;;

;;; ─── BLOCKED: NEEDS_GO_MODULE_VENDORING ────────────────────────
;;;
;;; 3099. tufw-git (v0.2.7, github.com/peltho/tufw)
;;;   → Terminal UI for managing ufw (Uncomplicated Firewall) rules.
;;;   → Go 1.23 with tcell/tview TUI libraries; requires go module
;;;     vendoring (go-github-com-gdamore-tcell-v2, go-github-com-rivo-tview
;;;     not in Guix).
;;;   → Also needs ufw at runtime, which is not packaged in Guix.
;;;

;;; ─── BLOCKED: NEEDS_PYTHON_DEPS ───────────────────────────────
;;;
;;; 3091. yewtube-bin (v2.13.1, pypi.org/project/yewtube)
;;;   → Terminal-based YouTube player/downloader (fork of mps-youtube).
;;;   → Pure Python, available on PyPI, but requires yewtube-search-python
;;;     (>=1.6.7) which is not in Guix and would need packaging first.
;;;   → Also needs python-httpx (available) and python-pylast.
;;;

;;; ─── BLOCKED: NO_TAGS_FUSE_DEPS ───────────────────────────────
;;;
;;; 3100. adbfs-rootless-git (no tags, github.com/spion/adbfs-rootless)
;;;   → FUSE filesystem to mount Android devices over ADB.
;;;   → Simple Makefile C++ project, but no tagged releases.
;;;   → Requires android-tools (adb) at runtime which is not in Guix.
;;;   → FUSE integration needs additional Guix service configuration.
;;;
