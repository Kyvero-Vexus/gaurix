;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413n
;;; 10 packages blocked with specific reason codes.

(define-module (gaurix packages recipe-resolver-260413n-blocked-notes))

;;; ── Blocked package notes ──────────────────────────────────────────

;;; 1. moderncsv-bin (#5545)
;;;    Status: BLOCKED: PROPRIETARY_LICENSE
;;;    Reason: ModernCSV is proprietary software (custom license, not OSI-approved).
;;;    Approaches: A1: Checked moderncsv.com — free for personal use but commercial license required; not redistributable. A2: No open source alternative under the same name. Next: Cannot package due to proprietary license restrictions.

;;; 2. codex-app-bin (#4080)
;;;    Status: BLOCKED: SOURCE_UNAVAILABLE
;;;    Reason: Community port of OpenAI Codex desktop app (macOS) patched for Linux. No prebuilt binaries, requires Electron/pnpm build from git. Unclear license.
;;;    Approaches: A1: Checked GitHub (fvaha/New-Codex-App-Manjaro-Arch-Port) — unofficial fork, git-only, no releases. A2: Requires Electron build infrastructure not available in Guix. A3: License unclear (original app proprietary). Next: Cannot package — no binary, complex build, license issues.

;;; 3. enumctl-bin (#5574)
;;;    Status: BLOCKED: PROPRIETARY_LICENSE
;;;    Reason: enumctl is a proprietary CLI for the enum.co service. No open source license. Binary hosted on dl.enum.co with versioned URLs.
;;;    Approaches: A1: Checked enum.co — no SPDX license, commercial service CLI. A2: Binary not redistributable without license grant. Next: Cannot package due to proprietary license.

;;; 4. itch-setup-bin (#5593)
;;;    Status: BLOCKED: BOOTSTRAPPER_ONLY
;;;    Reason: itch-setup is a bootstrapper/installer that downloads the actual itch.io desktop app at runtime. Packaging the bootstrapper alone provides no offline functionality.
;;;    Approaches: A1: Checked itchio/itch-setup on GitHub — the binary is ~5MB and its sole purpose is to download and install the full itch app (~100MB). A2: Download URLs use signed/expiring redirects from broth.itch.zone. A3: The actual itch app itself would be a separate packaging effort. Next: Not useful as a standalone package.

;;; 5. mongodb-compass-bin (#5710)
;;;    Status: BLOCKED: SSPL_LICENSE
;;;    Reason: MongoDB Compass is licensed under SSPL (Server Side Public License), which is not OSI-approved and has distribution restrictions.
;;;    Approaches: A1: Checked GitHub mongodb-js/compass — SSPL license. A2: SSPL is considered non-free by most Linux distributions. A3: Binary (.deb) available but redistribution legally questionable. Next: Cannot package due to SSPL license concerns.

;;; 6. ripdrag (#3572)
;;;    Status: BLOCKED: CARGO_DEPS_NEEDED
;;;    Reason: Rust/Cargo project (github.com/nik012003/ripdrag) with GTK4 dependency. Building from source requires enumerating and packaging vendored Cargo crate dependencies.
;;;    Approaches: A1: Source tarball available on GitHub. A2: Also on crates.io. A3: Requires cargo-build-system with full crate dependency enumeration — not feasible in this batch pass. Next: Needs dedicated Rust/Cargo packaging pass with crate dependency resolution.

;;; 7. boxbuddy (#3627)
;;;    Status: BLOCKED: CARGO_DEPS_NEEDED
;;;    Reason: Rust/Cargo project (github.com/Dvlv/BoxBuddyRS) with GTK4/libadwaita dependency. Building from source requires enumerating vendored Cargo crate dependencies.
;;;    Approaches: A1: Source tarball available on GitHub. A2: No prebuilt binaries. A3: Requires cargo-build-system with GTK4+libadwaita deps — not feasible in this batch pass. Next: Needs dedicated Rust/Cargo packaging pass.

;;; 8. flameget (#3469)
;;;    Status: BLOCKED: NO_RELEASES
;;;    Reason: FlameGet (github.com/C-Yassin/FlameGet) has no tagged releases, no version tags, and no release artifacts. Very early-stage Python/GTK4 project.
;;;    Approaches: A1: Checked GitHub — only has commits on main branch, no releases section. A2: Python app but no setup.py/pyproject.toml for proper packaging. A3: Dependencies include flask, gtk4, aria2, yt-dlp but no requirements.txt. Next: Cannot package without stable release or proper build metadata.

;;; 9. dirsearch (#5548)
;;;    Status: BLOCKED: PYTHON_DEPS_NEEDED
;;;    Reason: Python web path scanner (github.com/maurosoria/dirsearch). Available on PyPI but has multiple Python dependencies not in Guix (defusedxml, pyparsing, etc.).
;;;    Approaches: A1: Available on PyPI, could use guix import pypi. A2: Has 8+ Python dependencies, several missing from Guix. A3: Would need dedicated Python dependency packaging sub-pass. Next: Feasible but needs Python dependency packaging first.

;;; 10. neovim-remote (#5589)
;;;    Status: BLOCKED: PYTHON_DEPS_NEEDED
;;;    Reason: Python package (github.com/mhinz/neovim-remote) providing remote control for Neovim. Depends on pynvim which may not be in Guix.
;;;    Approaches: A1: Available on PyPI. A2: Depends on pynvim (python-pynvim). A3: Guix has python-pynvim but needs verification. Next: Could be feasible if pynvim is available; needs verification in a Python packaging pass.
