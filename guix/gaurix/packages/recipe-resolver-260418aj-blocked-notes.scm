;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260418aj
;;; 17 packages evaluated as BLOCKED/EXHAUSTED.

;;; 14. utiliti
;;; GRADLE_BUILD: LITIENGINE game editor (Java) uses Gradle build system
;;; which Guix does not support.  AUR installs pre-built binaries from a
;;; third-party fork (iamllcoolray/utiliti-aur-package), not upstream.
;;; A1: Build from source with Gradle — Gradle not in Guix, complex Java
;;;     toolchain bootstrapping required.
;;; A2: Package pre-built JAR — fork repo is unofficial, may diverge from
;;;     upstream, redistribution unclear.
;;; A3: Use upstream gurkenlabs/litiengine — same Gradle issue, no standalone
;;;     JAR releases published.

;;; 15. libavif-noglycin
;;; ARCH_SPECIFIC: libavif is already packaged in Guix upstream.  The
;;; "-noglycin" variant is an Arch Linux-specific workaround to avoid the
;;; glycin Rust image loader in gdk-pixbuf2.  This concern does not apply
;;; to Guix's package graph.
;;; A1: Package as variant — unnecessary, Guix libavif has no glycin dep.
;;; A2: Inherit and rebuild — identical to upstream, no value added.
;;; A3: Skip — correct approach, Guix users should use upstream libavif.

;;; 16. libheif-noglycin
;;; ARCH_SPECIFIC: Same as libavif-noglycin.  libheif is already in Guix
;;; upstream.  The "-noglycin" variant is Arch-specific.
;;; A1-A3: Same reasoning as libavif-noglycin above.

;;; 17. libjxl-noglycin
;;; ARCH_SPECIFIC: Same as above.  libjxl is already in Guix upstream.
;;; The "-noglycin" variant is Arch-specific.
;;; A1-A3: Same reasoning as libavif-noglycin above.

;;; 18. libjxl-noglycin-doc
;;; ARCH_SPECIFIC: Documentation sub-package for libjxl-noglycin.  Since
;;; libjxl is already in Guix and -noglycin is Arch-specific, this docs
;;; package has no value.  Guix can add a docs output to existing libjxl
;;; if needed.
;;; A1-A3: Same as libjxl-noglycin.

;;; 19. tilem-gtk3-git
;;; MISSING_DEP_CHAIN: TI calculator emulator depends on the tilibs suite:
;;; libticables, libticonv, libtifiles, and libticalcs.  None of these
;;; four libraries are packaged in Guix.  Each has its own dependency chain.
;;; A1: Package all 4 tilibs deps — significant scope, each library has
;;;     own build requirements and interdependencies.
;;; A2: Build without tilibs — not possible, core functionality requires
;;;     calculator communication libraries.
;;; A3: Use existing Guix tilem package — no such package exists in Guix.

;;; 20. fish-session
;;; UNLICENSED: The repository uses "Unlicensed" (LicenseRef-UNLICENSED)
;;; which is not a recognized free/open-source software license.  Guix
;;; requires FOSS licensing for packages.
;;; A1: Package anyway — violates Guix FOSS policy.
;;; A2: Request license change — upstream issue, outside our control.
;;; A3: Skip — correct approach until upstream clarifies licensing.

;;; 21. framework-control-bin
;;; MISSING_DEP: GUI tool for Framework Laptop requires "framework-system"
;;; (framework_tool CLI) which is not packaged in Guix.  Also requires
;;; systemd service integration for the background daemon.
;;; A1: Package framework-system first — niche hardware tool, limited audience.
;;; A2: Binary-only without daemon — loses core functionality (fan/LED control).
;;; A3: Skip — niche hardware-specific package with systemd dependency.

;;; 22. synergy3-bin
;;; PROPRIETARY: Synergy 3 is commercial software with a proprietary EULA.
;;; Download requires scraping an authentication token from a landing page.
;;; Not redistributable.
;;; A1: Package binary — license prohibits redistribution.
;;; A2: Build from source — no source available (open-source upstream is
;;;     "deskflow", a separate project).
;;; A3: Package deskflow instead — different project, separate AUR entry.

;;; 23. spinwheel-pipewire
;;; NO_UPSTREAM: The upstream repository (codeberg.org/the-traveler/spinwheel)
;;; returns HTTP 404.  Source files only exist embedded in the AUR git
;;; repository.  No proper upstream source tarball or release exists.
;;; A1: Use AUR-embedded source — not a proper origin for Guix packaging.
;;; A2: Mirror source — no license to redistribute without upstream.
;;; A3: Skip — no upstream source available.

;;; 24. bapctools-git
;;; COMPLEX_DEPS: BAPCtools (ICPC contest problem tools) has a heavy Python
;;; dependency chain including checktestdata (niche tool not in Guix),
;;; python-questionary, and many pinned versions.  The -git variant tracks
;;; HEAD with no tagged releases.
;;; A1: Package all Python deps — at least 5 missing packages needed.
;;; A2: Package checktestdata separately — C++ build, own dep chain.
;;; A3: Minimal install without optional deps — breaks core test validation.

;;; 25. renamemytvseries-gtk-bin
;;; PROPRIETARY: Closed-source application built with Lazarus Pascal.
;;; No source code is available.  Distributed as binary from tweaking4all.com
;;; with a custom proprietary license.
;;; A1: Package binary — redistribution rights unclear, no FOSS license.
;;; A2: Build from source — no source code available.
;;; A3: Skip — proprietary, closed-source software.

;;; 26. ipmctl-git
;;; COMPLEX_BUILD: Intel Optane DCPMM management tool has a complex CMake
;;; build requiring edk2 (TianoCore UEFI) as a build dependency via a
;;; submodule.  AUR PKGBUILD needs 3 custom patches.  Intel Optane is a
;;; discontinued product line.
;;; A1: Build with edk2 submodule — edk2 not in Guix, complex UEFI toolchain.
;;; A2: Apply AUR patches — 3 patches needed, may break with updates.
;;; A3: Skip — discontinued hardware, diminishing user base.

;;; 27. uac-polkit-agent-git
;;; COMPLEX_DEPS: PolicyKit agent with Windows UAC-style interface requires
;;; massive KDE Frameworks 6 / Qt6 dependency chain: polkit-qt6, kirigami,
;;; kwindowsystem, and many other KF6 modules.  Most KDE6/Qt6 deps may
;;; not be available in Guix.
;;; A1: Package all KF6 deps — enormous scope, 10+ missing packages.
;;; A2: Port to GTK — not feasible, tightly integrated with Qt/KDE.
;;; A3: Skip — niche AeroShell desktop agent, existing polkit agents in Guix.

;;; 28. op-cache-git
;;; PROPRIETARY_DEP: Caching proxy for 1Password CLI "op read" commands.
;;; Requires the proprietary 1Password CLI ("op") as a runtime dependency.
;;; No tagged releases (AUR version is "0-1").
;;; A1: Package without op CLI — useless, entire purpose is to cache op calls.
;;; A2: Package op CLI — proprietary, not FOSS.
;;; A3: Skip — fundamentally depends on proprietary software.

;;; 29. reqable-bin
;;; PROPRIETARY: HTTP debugging tool is closed-source with a custom
;;; proprietary license.  Distributed as .deb and .AppImage from GitHub
;;; releases-only repository (no source code).
;;; A1: Package binary — proprietary license, not redistributable.
;;; A2: Build from source — no source code available.
;;; A3: Skip — proprietary, closed-source software.

;;; 30. c47-bin
;;; ALREADY_PACKAGED_PRIOR: The c47 RPN calculator emulator was already
;;; packaged from source (meson-build-system) in recipe-resolver-260416a.scm.
;;; The -bin variant (prebuilt binary) is unnecessary when a source build
;;; already exists in the channel.
;;; A1: Package binary anyway — redundant with existing source package.
;;; A2: Replace source with binary — source build is preferred in Guix.
;;; A3: Skip — correct approach, use existing c47 source package.
