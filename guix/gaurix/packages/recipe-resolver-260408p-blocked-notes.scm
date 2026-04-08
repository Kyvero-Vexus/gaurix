;;; recipe-resolver-260408p — blocked notes
;;; Re-evaluated 3 NEEDS_RECIPE_DESIGN packages with specific blocking reasons.

(define-module (gaurix packages recipe-resolver-260408p-blocked-notes))

;;; #4607 responsively
;;; Electron-based responsive web dev tool from https://github.com/responsively-org/responsively-app
;;; Blocked: Electron app requiring full Chromium/Electron build infrastructure.
;;; Guix lacks electron-builder/electron packaging support.
;;; Approaches considered:
;;;   A1: Binary packaging of AppImage — requires fuse + electron runtime extraction
;;;   A2: Source build — needs npm/pnpm + electron-builder, not available in Guix
;;;   A3: Flatpak/snap wrapper — breaks Guix's reproducibility model
;;; Recommendation: Wait for Guix Electron packaging infrastructure.

;;; #4610 cupola-git
;;; COSMIC image viewer from https://codeberg.org/bhh32/cupola
;;; Blocked: Rust+libcosmic requires COSMIC desktop libraries (cosmic-text,
;;; iced, libcosmic) not packaged in Guix.
;;; Approaches considered:
;;;   A1: cargo-build-system — fails due to missing libcosmic crate + C deps
;;;   A2: Pre-built binary — no binary releases available
;;;   A3: Package libcosmic first — massive dependency tree (iced, smithay, etc.)
;;; Recommendation: Wait for COSMIC desktop ecosystem in Guix.

;;; #4611 python-pymatgen
;;; Materials science Python package from https://pypi.org/project/pymatgen/
;;; Blocked: Complex scientific Python with C extensions (spglib, pybtex,
;;; monty, ruamel-yaml, palettable, plotly, uncertainties, etc.).
;;; 30+ transitive dependencies not in Guix.
;;; Approaches considered:
;;;   A1: guix import pypi --recursive pymatgen — generates 40+ missing deps
;;;   A2: Package deps incrementally — would require dedicated batch for deps alone
;;;   A3: Binary wheel from PyPI — has C extensions, needs matching system libs
;;; Recommendation: Package as part of a dedicated scientific Python batch.
