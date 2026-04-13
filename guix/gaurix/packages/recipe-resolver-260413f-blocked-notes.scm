;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413f
;;; 7 packages evaluated with concrete blocking reasons.
;;; Each entry documents the primary blocker and next action.

(define-module (gaurix packages recipe-resolver-260413f-blocked-notes))

;;; ── python-influxdb-client (#6231) ──────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413f
;;; Upstream: https://github.com/influxdata/influxdb-client-python
;;; Description: InfluxDB 2.0 Python client library
;;; License: MIT
;;; Blocker: requires python-reactivex (RxPY 3.x) which is not packaged in Guix; reactivex has complex async dependency chain
;;; Approaches considered:
;;;   A1: Package with pyproject-build-system — blocked on python-reactivex dependency
;;;   A2: Package python-reactivex first — requires python-typing-extensions-compat, complex async/observer pattern library
;;;   A3: Package without reactivex (optional dep) — core functionality requires it for async queries
;;; Conclusion: BLOCKED on python-reactivex; feasible when upstream dep is packaged

;;; ── extramaus (#4595) ───────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413f
;;; Upstream: http://dodger-tools.sourceforge.net/cms/index.php?id=100000201
;;; Description: Workaround to always show mouse cursor under X11
;;; License: Unknown
;;; Blocker: SourceForge project page returns 404; no alternative source found; project from 2012, appears abandoned
;;; Approaches considered:
;;;   A1: Download from SourceForge — project page/downloads return 404
;;;   A2: Search for mirrors — no mirrors or forks found on GitHub/GitLab/Codeberg
;;;   A3: Extract from AUR cached PKGBUILD — AUR only references dead sourceforge URL
;;; Conclusion: INFEASIBLE — upstream source no longer available

;;; ── monika-after-story (#4546) ──────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413f
;;; Upstream: https://github.com/adogecheems/monika-after-story-linux
;;; Description: Fan mod for Doki Doki Literature Club (Ren'Py visual novel)
;;; License: No LICENSE file in repository; base game assets may be copyrighted
;;; Blocker: No license file; redistributes modified game assets from DDLC which has restrictive distribution terms; unclear legal status
;;; Approaches considered:
;;;   A1: Package as copy-build-system from release — no license, unclear redistribution rights
;;;   A2: Contact upstream for license clarification — fan project, unlikely to add proper license
;;;   A3: Package only the mod overlay — mod depends on base game assets
;;; Conclusion: BLOCKED — no license file, unclear redistribution rights for game assets

;;; ── xattrvi (#4870) ────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413f
;;; Upstream: https://github.com/cherti/xattrvi
;;; Description: Editor for extended filesystem attributes
;;; License: No LICENSE file; no license header in source code
;;; Blocker: Repository has no LICENSE file and no license information in README or source files; cannot determine distribution rights
;;; Approaches considered:
;;;   A1: Package as copy-build-system — no license, cannot redistribute
;;;   A2: Open issue requesting license — viable but requires upstream response
;;;   A3: Infer license from context — no basis for inference; all-rights-reserved by default
;;; Conclusion: BLOCKED — no license file, cannot package without explicit license

;;; ── kfr (#4916) ────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413f
;;; Upstream: https://github.com/kfrlib/kfr
;;; Description: Fast, modern C++ DSP framework (FFT, Sample Rate Conversion)
;;; License: GPL-2.0-only (per GitHub); dual-licensed GPL-2.0 + commercial
;;; Blocker: Header-only C++ library with cmake, BUT requires specific LLVM/Clang for SIMD optimizations; complex cmake configuration with multiple optional backends; also depends on internal DFT library not available standalone
;;; Approaches considered:
;;;   A1: Package with cmake-build-system, GCC — requires Clang for SIMD intrinsics, GCC fallback is degraded
;;;   A2: Package with Clang from Guix — Guix has Clang but kfr cmake expects specific LLVM integration
;;;   A3: Header-only install (skip build) — library needs compilation for DFT/FFT functionality
;;; Conclusion: BLOCKED — complex LLVM/Clang integration requirements, cmake configuration non-trivial

;;; ── lavacli (#6267) ────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413f
;;; Upstream: https://gitlab.com/lava/lavacli
;;; Description: Command line interface for LAVA (Linaro Automated Validation Architecture)
;;; License: AGPL-3.0
;;; Blocker: Requires python-ruamel.yaml AND python-voluptuous AND python-aiohttp which are all in Guix, BUT lavacli uses setup.py with no version pins and the latest PyPI release (2.7) is from 2023; testing shows import errors with current Guix Python stack versions
;;; Approaches considered:
;;;   A1: Package from git HEAD — build succeeds but runtime imports fail due to API changes in ruamel.yaml 0.18+
;;;   A2: Package from PyPI release 2.7 — same ruamel.yaml compatibility issue
;;;   A3: Patch for ruamel.yaml compat — requires significant patching across multiple modules
;;; Conclusion: BLOCKED — ruamel.yaml API incompatibility with upstream code

;;; ── dmscripts-git (#6102) ──────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413f
;;; Upstream: https://gitlab.com/dwt1/dmscripts
;;; Description: Collection of dmenu scripts for common tasks
;;; License: GPL-3.0
;;; Blocker: Scripts depend on 9+ runtime tools (dmenu, fzf, rofi, scrot, xdotool, xclip, etc.) many of which are X11-specific; scripts hardcode paths and use distro-specific patterns; significant adaptation needed for Guix PATH/wrapping
;;; Approaches considered:
;;;   A1: Package all scripts with copy-build-system + wrap — 9+ runtime deps, many scripts assume /usr/bin paths
;;;   A2: Package subset of scripts — cherry-picking breaks the collection's purpose
;;;   A3: Patch all path references — 100+ hardcoded paths across 30+ scripts
;;; Conclusion: BLOCKED — extensive path hardcoding and distro-specific assumptions; needs significant wrapping work
