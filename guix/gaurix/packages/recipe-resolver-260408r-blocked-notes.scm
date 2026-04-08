;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260408r
;;; 10 packages re-evaluated with specific blocking reasons

(define-module (gaurix packages recipe-resolver-260408r-blocked-notes))

;;; ── waypaper ───────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408r
;;; Upstream: https://github.com/anufrievroman/waypaper (v2.8)
;;; Language: Python (pure), GTK4/libadwaita GUI
;;; License: GPL-3.0
;;; Blocker: Requires python-pillow (available), but also needs GTK4 +
;;;   libadwaita Python bindings (PyGObject with GTK4), and runtime backends
;;;   (swaybg, swww, feh) that are partially available.  The main issue is
;;;   python-gobject + libadwaita integration in Guix requires careful
;;;   propagated-inputs and GI_TYPELIB_PATH wrapping.
;;; Approaches tried:
;;;   A1: pyproject-build-system with inputs for gtk4, libadwaita — blocked
;;;       because libadwaita GObject introspection typelib paths need wrapping.
;;;   A2: Checked if waypaper is already in upstream Guix — it is not.
;;;   A3: Considered packaging without GUI (CLI-only) — not useful, GUI is
;;;       the core feature.
;;; Next: Package after establishing GTK4/libadwaita Python wrapping pattern.

;;; ── exaile ─────────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408r
;;; Upstream: https://github.com/exaile/exaile (v4.2.2)
;;; Language: Python, GTK3 via PyGObject
;;; License: GPL-2.0
;;; Blocker: Exaile has 15+ optional Python dependencies for its plugin
;;;   system, many of which are not in Guix: python-bpm-counter, python-cddb,
;;;   python-pylast, python-mutagen (available), python-dbus (available),
;;;   python-gi (available).  Core build is feasible but would produce a
;;;   player missing most features.
;;; Approaches tried:
;;;   A1: gnu-build-system with make install — build itself works but test
;;;       suite needs python-pytest and many optional deps.
;;;   A2: Checked upstream Guix — not packaged.
;;;   A3: Minimal build (core only) — technically possible but missing
;;;       scrobbling, lyrics, equalizer, podcast support.
;;; Next: Feasible if minimal build is acceptable; needs maintainer decision.

;;; ── fcitx5-mcbopomofo-git ──────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408r
;;; Upstream: https://github.com/openvanilla/fcitx5-mcbopomofo (v3.0)
;;; Language: C++, CMake build
;;; License: MIT
;;; Blocker: Requires fcitx5-devel headers and extra-cmake-modules for
;;;   building.  While fcitx5 exists in upstream Guix, the required
;;;   Fcitx5MacrosCMake and Fcitx5Utils CMake modules may not be properly
;;;   exported.  Also needs fmt library.
;;; Approaches tried:
;;;   A1: cmake-build-system with fcitx5 as input — CMake cannot find
;;;       Fcitx5Macros.cmake in the Guix fcitx5 package.
;;;   A2: Checked if upstream Guix has fcitx5-mcbopomofo — it does not.
;;;   A3: Considered bundling CMake modules — not clean, upstream expects
;;;       system fcitx5 development files.
;;; Next: Verify fcitx5 package in Guix exports CMake config files; if so,
;;;   set CMAKE_PREFIX_PATH appropriately.

;;; ── fcitx5-sitelen-pona ────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408r
;;; Upstream: https://github.com/Toastberries/fcitx5-sitelen-pona (v1.1.0)
;;; Language: Data files + install script
;;; License: MIT
;;; Blocker: The install script invokes libime_tabledict to compile the
;;;   input method table.  This tool is part of libime, which is packaged
;;;   in Guix but the tabledict binary may not be in the default output.
;;;   Also requires specific fcitx5 data directory structure.
;;; Approaches tried:
;;;   A1: copy-build-system with custom phase to run libime_tabledict —
;;;       could not verify libime_tabledict is available in Guix's libime.
;;;   A2: Checked if upstream Guix has fcitx5-sitelen-pona — it does not.
;;;   A3: Considered pre-compiling the table offline — the table format is
;;;       version-dependent, not portable.
;;; Next: Verify libime package exports libime_tabledict; if so, recipe is
;;;   straightforward.

;;; ── grub-customizer ────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408r
;;; Upstream: https://launchpad.net/grub-customizer (v5.2.5)
;;; Language: C++, CMake build
;;; License: GPL-3.0+
;;; Blocker: Requires gtkmm3, libarchive, and GRUB2 development files
;;;   (grub-mkconfig, grub-install paths).  The tool is designed to modify
;;;   GRUB configuration which conflicts with Guix's declarative system
;;;   configuration model where GRUB config is generated from config.scm.
;;; Approaches tried:
;;;   A1: cmake-build-system with gtkmm, libarchive, grub inputs —
;;;       builds but hardcodes /etc/default/grub which doesn't exist on Guix.
;;;   A2: Checked Guix System compatibility — fundamentally incompatible
;;;       with Guix System's boot configuration model.
;;;   A3: Considered as tool for non-Guix-System installs (foreign distro) —
;;;       possible but niche use case in a Guix channel.
;;; Next: Low priority; only useful on foreign distros running Guix packages.

;;; ── subliminal ─────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408r
;;; Upstream: https://github.com/Diaoul/subliminal (v2.6.0)
;;; Language: Python
;;; License: MIT
;;; Blocker: Requires 5+ Python packages not in Guix: python-babelfish,
;;;   python-enzyme, python-guessit (which itself needs python-rebulk,
;;;   python-dateutil), python-stevedore, python-dogpile-cache.  The
;;;   transitive dependency tree is substantial.
;;; Approaches tried:
;;;   A1: pyproject-build-system — missing python-babelfish (ISO language
;;;       codes library), not in Guix.
;;;   A2: Checked if any deps are available — python-click and python-chardet
;;;       are in Guix, but core deps (babelfish, enzyme, guessit) are not.
;;;   A3: Considered minimal build without optional providers — core still
;;;       needs babelfish and enzyme.
;;; Next: Would need to package python-babelfish, python-enzyme, python-rebulk,
;;;   python-guessit as prerequisites.

;;; ── varia ──────────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408r
;;; Upstream: https://github.com/giantpinkrobots/varia (v2026.3.27)
;;; Language: Python, Meson build, GTK4/libadwaita
;;; License: MPL-2.0
;;; Blocker: Requires blueprint-compiler (not in Guix) for compiling
;;;   Blueprint UI files to GTK XML.  Also needs libadwaita with GObject
;;;   introspection, and aria2 as runtime dependency.  aria2 is in Guix
;;;   but blueprint-compiler is the hard blocker.
;;; Approaches tried:
;;;   A1: meson-build-system with gtk4, libadwaita — fails because
;;;       blueprint-compiler is required during build.
;;;   A2: Checked if blueprint-compiler is in Guix — it is not.
;;;   A3: Considered pre-compiling blueprints — format is version-dependent.
;;; Next: Package blueprint-compiler first, then varia becomes feasible.

;;; ── auto-cpufreq ───────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408r
;;; Upstream: https://github.com/AdnanHodzic/auto-cpufreq (v2.4.0)
;;; Language: Python
;;; License: LGPL-3.0+
;;; Blocker: Requires systemd service integration (auto-cpufreq.service),
;;;   polkit policy for privilege elevation, and runtime access to
;;;   /sys/devices/system/cpu/ sysfs.  On Guix System, systemd services
;;;   are not used (Shepherd instead).  Also needs python-psutil, python-click
;;;   (both available) and dbus/polkit integration.
;;; Approaches tried:
;;;   A1: pyproject-build-system — build succeeds but the systemd service
;;;       file and polkit policy cannot be installed on Guix System.
;;;   A2: Considered Shepherd service adaptation — significant rewrite needed.
;;;   A3: CLI-only mode (without daemon) — partially functional but loses
;;;       the main auto-adjustment feature.
;;; Next: Feasible for foreign distros with systemd; Guix System needs
;;;   Shepherd service definition.

;;; ── safe-rm ────────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408r
;;; Upstream: https://launchpad.net/safe-rm (v1.1.0)
;;; Language: Rust (Cargo)
;;; License: GPL-3.0
;;; Blocker: Rust/Cargo project requiring cargo-build-system with vendored
;;;   crate dependencies.  The cargo-build-system in Guix requires each
;;;   transitive crate dependency to be individually packaged or provided
;;;   as cargo-inputs.  guix import crate can bootstrap this but produces
;;;   incomplete results for transitive deps.
;;; Approaches tried:
;;;   A1: cargo-build-system — needs full cargo-inputs enumeration for
;;;       all transitive dependencies.
;;;   A2: guix import crate safe-rm — produces partial definition.
;;;   A3: Checked crate dep tree — ~15 transitive crates needed.
;;; Next: Use guix import crate recursively to package all deps.

;;; ── makemkv ────────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408r
;;; Upstream: https://www.makemkv.com/
;;; Language: C++
;;; License: Proprietary (GUI) + LGPL (libmmbd/libdriveio)
;;; Blocker: MakeMKV is a hybrid proprietary+OSS tool.  The open-source
;;;   components (libmmbd, libdriveio) can be built but the main GUI/CLI
;;;   requires a proprietary binary blob.  Also needs specific ffmpeg version
;;;   with custom patches, libdrm, and optical drive access.
;;; Approaches tried:
;;;   A1: Investigated OSS-only build — libmmbd alone is not useful without
;;;       the main MakeMKV binary.
;;;   A2: Binary repack from .deb — proprietary license prohibits
;;;       redistribution in package form.
;;;   A3: Checked Guix policy — proprietary software not suitable for
;;;       a Guix channel unless clearly marked non-free.
;;; Next: Would need explicit non-free channel or user acknowledgment.
