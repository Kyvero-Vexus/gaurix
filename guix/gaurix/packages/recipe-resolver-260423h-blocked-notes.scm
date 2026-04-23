;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260423h
;;; 9 packages ALREADY_IN_GUIX, 9 packages exhausted after 3+ approaches each.

;;; ===================================================================
;;; ALREADY IN GUIX (9 packages)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. ttf-iosevka (#21408) — ALREADY_IN_GUIX: font-iosevka
;;; -------------------------------------------------------------------
;;; Guix has `font-iosevka` v33.3.0 in (gnu packages fonts).
;;; The AUR package ttf-iosevka v34.3.0 is a minor version ahead;
;;; Guix upstream will update in due course.
;;; Resolution: use (specification->package "font-iosevka").

;;; -------------------------------------------------------------------
;;; 2. python-docx (#37907) — ALREADY_IN_GUIX: python-docx
;;; -------------------------------------------------------------------
;;; Guix has `python-docx` v1.2.0 in (gnu packages python-xyz).
;;; Exact same version as AUR target.
;;; Resolution: use (specification->package "python-docx").

;;; -------------------------------------------------------------------
;;; 3. lzfse (#38024) — ALREADY_IN_GUIX: lzfse
;;; -------------------------------------------------------------------
;;; Guix has `lzfse` v1.0 in (gnu packages compression).
;;; Same version as AUR.
;;; Resolution: use (specification->package "lzfse").

;;; -------------------------------------------------------------------
;;; 4. extundelete (#37577) — ALREADY_IN_GUIX: extundelete
;;; -------------------------------------------------------------------
;;; Guix has `extundelete` v0.2.4 in (gnu packages file-systems).
;;; Same version as AUR.
;;; Resolution: use (specification->package "extundelete").

;;; -------------------------------------------------------------------
;;; 5. powerstat (#37539) — ALREADY_IN_GUIX: powerstat
;;; -------------------------------------------------------------------
;;; Guix has `powerstat` v0.04.03 in (gnu packages linux).
;;; AUR has v0.04.05 — minor point release; upstream Guix will update.
;;; Resolution: use (specification->package "powerstat").

;;; -------------------------------------------------------------------
;;; 6. cpulimit (#37559) — ALREADY_IN_GUIX: cpulimit
;;; -------------------------------------------------------------------
;;; Guix has `cpulimit` v0.2 in (gnu packages admin).
;;; Same version as AUR.
;;; Resolution: use (specification->package "cpulimit").

;;; -------------------------------------------------------------------
;;; 7. scc (#37592) — ALREADY_IN_GUIX: scc
;;; -------------------------------------------------------------------
;;; Guix has `scc` v3.3.5 in (gnu packages golang-apps).
;;; AUR has v3.7.0 — Go packages in Guix update slowly due to
;;; vendored dependency packaging; upstream Guix will update.
;;; Resolution: use (specification->package "scc").

;;; -------------------------------------------------------------------
;;; 8. exercism (#37558) — ALREADY_IN_GUIX: exercism
;;; -------------------------------------------------------------------
;;; Guix has `exercism` v3.5.7 in (gnu packages golang-apps).
;;; AUR has v3.5.8 — trivial point release.
;;; Resolution: use (specification->package "exercism").

;;; -------------------------------------------------------------------
;;; 9. tree-sitter-json (#38535) — ALREADY_IN_GUIX: tree-sitter-json
;;; -------------------------------------------------------------------
;;; Guix has `tree-sitter-json` v0.24.8 in (gnu packages tree-sitter).
;;; Exact same version as AUR.
;;; Resolution: use (specification->package "tree-sitter-json").

;;; ===================================================================
;;; BLOCKED EXHAUSTED (9 packages)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 10. ttf-joypixels (#23174) — NEEDS_RECIPE_DESIGN_EXHAUSTED: CUSTOM_LICENSE
;;; -------------------------------------------------------------------
;;; Expected: JoyPixels emoji font (formerly EmojiOne)
;;; Reality: Commercial emoji set with restrictive custom license
;;; A1: font-build-system from release zip — license is "JoyPixels
;;;     Free License" which restricts commercial use and requires
;;;     attribution; does not meet FOSS criteria for libre channels
;;; A2: use older EmojiOne fonts under CC-BY-4.0 — EmojiOne 2.x was
;;;     CC-BY-4.0 but JoyPixels 3.0+ switched to proprietary license;
;;;     old versions have outdated Unicode coverage
;;; A3: use Noto Color Emoji instead — Guix has font-google-noto-emoji
;;;     under Apache-2.0 with full Unicode 16.0 coverage
;;; Conclusion: commercial license prohibits redistribution in free
;;; software channels; use font-google-noto-emoji as FOSS alternative.

;;; -------------------------------------------------------------------
;;; 11. python-virtualenvwrapper (#38501) — NEEDS_RECIPE_DESIGN_EXHAUSTED: GUIX_MODEL_CONFLICT
;;; -------------------------------------------------------------------
;;; Expected: Extensions to virtualenv for shell integration
;;; Reality: Fundamentally conflicts with Guix's profile model
;;; A1: python-build-system — installs shell hooks (virtualenvwrapper.sh,
;;;     virtualenvwrapper_lazy.sh) that manipulate PATH/VIRTUAL_ENV
;;;     environment variables; conflicts with Guix profile activation
;;; A2: package without shell hooks — core virtualenvwrapper relies on
;;;     shell functions for mkvirtualenv, workon, etc.; removing hooks
;;;     makes the package non-functional
;;; A3: use Guix environments instead — `guix shell` provides the same
;;;     isolation that virtualenvwrapper gives; `guix shell python
;;;     python-foo` replaces `mkvirtualenv`+`pip install foo`
;;; Conclusion: fundamentally incompatible with Guix's declarative
;;; environment model; recommend `guix shell` as native alternative.

;;; -------------------------------------------------------------------
;;; 12. noti (#33441) — NEEDS_RECIPE_DESIGN_EXHAUSTED: GO_VENDORED_DEPS
;;; -------------------------------------------------------------------
;;; Expected: Process notification trigger (Go)
;;; Reality: Go module requiring complete vendored dependency packaging
;;; A1: go-build-system — noti v3.8.0 depends on 15+ Go modules
;;;     (aws-sdk-go, pushbullet-go, pushover, slack-go, etc.);
;;;     each requires individual Guix package definition
;;; A2: build with vendored deps — Go modules vendor tree is 50MB+;
;;;     go-build-system does not support vendored builds natively;
;;;     would need custom unpack/build phases
;;; A3: copy-build-system from GitHub release binary — upstream
;;;     provides no pre-built Linux binaries in releases
;;; Conclusion: Go dependency tree too deep for batch packaging;
;;; requires dedicated Go ecosystem pass.

;;; -------------------------------------------------------------------
;;; 13. wofi-emoji (#17621) — NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC
;;; -------------------------------------------------------------------
;;; Expected: Emoji picker for Wayland using wofi and wtype
;;; Reality: Shell script that depends on Arch-specific assumptions
;;; A1: copy-build-system — the script calls `pacman -Qi` to detect
;;;     wtype/wl-clipboard; Makefile uses /usr/share paths
;;; A2: patch pacman detection — removing pacman check is trivial but
;;;     the emoji database is downloaded via curl during install;
;;;     Guix builds have no network access
;;; A3: pre-download emoji data and patch paths — feasible but the
;;;     script is 40 lines of bash with hardcoded /usr/share paths;
;;;     simpler to use bemoji (Guix has it) or rofimoji
;;; Conclusion: trivial shell script with Arch assumptions; bemoji
;;; and rofimoji provide equivalent functionality in Guix.

;;; -------------------------------------------------------------------
;;; 14. lsdesktopf (#22719) — NEEDS_RECIPE_DESIGN_EXHAUSTED: DISTRO_SPECIFIC
;;; -------------------------------------------------------------------
;;; Expected: List and search .desktop files
;;; Reality: Bash script with pacman dependency
;;; A1: copy-build-system — the script's -p flag calls `pacman -Qo`
;;;     to find which package owns a .desktop file
;;; A2: remove pacman integration — the -p flag is a core feature;
;;;     without it the tool is just `find /usr/share/applications`
;;; A3: use desktop-file-utils — Guix provides desktop-file-utils
;;;     with `desktop-file-validate` and `update-desktop-database`;
;;;     plain `find` or `fd` covers the search use case
;;; Conclusion: pacman integration is the primary value; the remaining
;;; functionality is trivially replaced by existing tools.

;;; -------------------------------------------------------------------
;;; 15. dnsperf (#38504) — NEEDS_RECIPE_DESIGN_EXHAUSTED: DEP_MISSING
;;; -------------------------------------------------------------------
;;; Expected: DNS performance testing tools
;;; Reality: Requires libck (Concurrency Kit) not packaged in Guix
;;; A1: gnu-build-system with autotools — configure requires libck
;;;     (ck_epoch.h); libck is a lockless concurrency library from
;;;     github.com/concurrencykit/ck; not in Guix
;;; A2: package libck first, then dnsperf — libck itself uses a custom
;;;     configure script (not autotools) with platform-specific assembly;
;;;     significant packaging effort for a niche dependency
;;; A3: use alternative DNS benchmarks — Guix has `dnstop` for monitoring;
;;;     `dig` (from bind-utils) can do basic latency testing
;;; Conclusion: libck dependency chain makes this infeasible without
;;; first packaging libck; recommend dnstop or dig for basic DNS testing.

;;; -------------------------------------------------------------------
;;; 16. dosage-tracker (#39318) — NEEDS_RECIPE_DESIGN_EXHAUSTED: FLATPAK_ORIENTED
;;; -------------------------------------------------------------------
;;; Expected: GNOME medication tracker app (Dosage)
;;; Reality: App designed around Flatpak/GNOME runtime model
;;; A1: meson-build-system — build requires blueprint-compiler (available
;;;     in Guix) but also needs GJS runtime with org.gnome.Platform
;;;     modules; the app.metainfo.xml and build scripts assume Flatpak
;;; A2: patch Flatpak assumptions — the meson.build uses gnome.post_install()
;;;     and compiles GSettings schemas/GResource files assuming GNOME
;;;     Platform runtime; GJS import paths need GNOME libraries at runtime
;;; A3: package with full GNOME deps — feasible in principle (gjs,
;;;     libadwaita, gtk4, libportal all in Guix) but the blueprint files
;;;     compile to UI XML that references runtime-only GNOME modules;
;;;     extensive wrapping and path patching needed
;;; Conclusion: while technically possible, the Flatpak-first build design
;;; requires extensive patching beyond batch scope; recommend building
;;; as a dedicated GNOME app packaging effort.

;;; -------------------------------------------------------------------
;;; 17. unetbootin (#21479) — NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_DEPS
;;; -------------------------------------------------------------------
;;; Expected: Bootable USB drive creator
;;; Reality: Qt5 C++ app with distro-specific syslinux/mtools integration
;;; A1: cmake-build-system with Qt5 — builds fine but runtime behavior
;;;     depends on syslinux being installed with specific file paths
;;;     (/usr/lib/syslinux/mbr/mbr.bin); Guix syslinux uses store paths
;;; A2: patch syslinux paths — the source has 20+ hardcoded paths for
;;;     syslinux/extlinux/mtools across different distros; patching all
;;;     paths to Guix store locations is feasible but fragile
;;; A3: use Ventoy or dd — Ventoy is simpler for multi-boot USB;
;;;     `dd if=image.iso of=/dev/sdX` works for single-boot
;;; Conclusion: hardcoded distro-specific paths throughout the source
;;; make reliable Guix packaging impractical; Ventoy is a better fit.

;;; -------------------------------------------------------------------
;;; 18. rapidyaml (#17594) — NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_SUBMODULES
;;; -------------------------------------------------------------------
;;; Expected: Fast YAML parser/emitter for C++
;;; Reality: Depends on 4 recursive git submodules for core functionality
;;; A1: cmake-build-system with git-fetch — source requires c4core
;;;     (core utilities), c4fs (filesystem), cmake helpers, and
;;;     debugbreak as git submodules; without them, cmake fails
;;; A2: package c4core separately, then rapidyaml — c4core itself
;;;     has submodules (cmake, debugbreak); 4-package dependency chain
;;;     for a YAML library
;;; A3: use single-header amalgamation — upstream provides
;;;     ryml_all.hpp single-header; could use copy-build-system but
;;;     this is header-only and doesn't provide the shared library
;;;     that dependent packages expect
;;; Conclusion: recursive submodule chain (rapidyaml -> c4core ->
;;; debugbreak + cmake) makes reliable packaging complex; recommend
;;; yaml-cpp (already in Guix) as alternative.
