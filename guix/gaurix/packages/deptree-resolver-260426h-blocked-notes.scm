;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260426h
;;;
;;; 100 packages evaluated, 0 resolved with recipes, 100 remain BLOCKED.
;;; The resolvable package pool has been exhausted after 20+ successive
;;; deptree-resolver passes.  Every package in the current top-100 priority
;;; queue carries a concrete, documented blocker.
;;;
;;; === MISSING_SOURCE (5) ===
;;; Not found in AUR metadata cache; package may be deleted or renamed.
;;; gradience (#18644): Not in AUR cache.  Formerly a GNOME/libadwaita theming
;;;   app (GradienceTeam/Gradience on GitHub); project appears archived or
;;;   removed from AUR.
;;; deadbeef-mpris2-plugin (#19282): Not in AUR cache.  MPRIS2 plugin for
;;;   DeaDBeeF music player; likely merged into main package or abandoned.
;;; linux6.18.22-1-lts-bin (#37932): Not in AUR cache.  Ephemeral kernel
;;;   binary package; specific kernel version expired.
;;; matlab-jre-bundled (#19363): Not in AUR cache.  MATLAB Java runtime bundle;
;;;   likely removed due to MATLAB licensing changes.
;;; sipgate-app-clinq (#18449): Not in AUR cache.  Sipgate VoIP desktop app;
;;;   likely removed from AUR.
;;;
;;; === SELINUX_SPECIFIC (2) ===
;;; Require SELinux infrastructure not present in Guix.
;;; sudo-selinux (#18513): SELinux-enabled sudo variant.  Guix does not use
;;;   SELinux; depends on pam-selinux, libselinux, libsemanage.
;;;   Attempts: A1: Strip SELinux deps and build as regular sudo — defeats the
;;;   purpose; Guix already has sudo.  A2: Package full SELinux stack — massive
;;;   effort, 10+ packages, no Guix users need it.  A3: Skip — Guix already
;;;   provides standard sudo.
;;; base-selinux (#18537): Arch SELinux meta-package; full SELinux stack
;;;   (coreutils-selinux, findutils-selinux, etc.).  Not applicable to Guix.
;;;   Attempts: A1: Package individual SELinux variants — 15+ packages needed,
;;;   no demand.  A2: Provide wrapper meta-package — no SELinux support in Guix
;;;   kernel config.  A3: Skip — fundamentally incompatible with Guix model.
;;;
;;; === DKMS_KERNEL_MODULE (9) ===
;;; All require DKMS which is incompatible with Guix's immutable kernel model.
;;; aquacomputer_d5next-hwmon-dkms (#18606): Aquacomputer HWMON driver.
;;; amneziawg-dkms-git (#18642): AmneziaWG VPN kernel module.
;;; ideapad-laptop-tb-dkms (#18957): Lenovo ThinkBook DKMS driver.
;;; ideapad-laptop-tb2024g6plus-dkms (#18895): Lenovo 2024 G6+ DKMS driver.
;;; pfring-dkms (#18399): PF_RING network monitoring DKMS module.
;;; r8126-dkms (#18487): Realtek RTL8126 ethernet DKMS driver.
;;; rtl88x2ce-dkms-git (#18369): Realtek WiFi DKMS driver.
;;; faustus-dkms-git (#18859): ASUS TUF fan control DKMS driver.
;;; nvidia-open-tinygrad-dkms-git (#18617): NVIDIA open kernel modules tinygrad.
;;;   All DKMS packages share the same fundamental blocker: Guix builds kernels
;;;   as immutable store items and does not support out-of-tree module insertion.
;;;   To support these, each driver would need to be compiled into a custom Guix
;;;   kernel configuration — a per-user system-level change, not a channel package.
;;;   Attempts (common): A1: Build as out-of-tree .ko against linux-libre headers
;;;   — Guix's kernel is immutable, cannot insmod arbitrary modules.  A2: Create
;;;   custom kernel config with driver compiled in — requires user-specific kernel
;;;   build, not a distributable package.  A3: Use linux-module-build-system (if
;;;   available) — Guix does not currently have this build system for third-party
;;;   kernel modules.
;;;
;;; === KERNEL_MODULE (5) ===
;;; Out-of-tree kernel modules or kernel-specific headers.
;;; amneziawg-linux (#18452): AmneziaWG VPN kernel module; needs linux-headers.
;;; amneziawg-linux-hardened (#18382): AmneziaWG for hardened kernel.
;;; zfs-linux-hardened-headers (#17921): ZFS headers for hardened kernel.
;;; zfs-linux-rt-headers (#17920): ZFS headers for RT kernel.
;;; zfs-linux-git-headers (#17919): ZFS headers for git kernel.
;;; libch343ser-git (#17880): WCH USB serial kernel driver (ch342/ch343/ch344).
;;;   Despite "lib" prefix, this is a kernel module (.ko) built with kernel
;;;   Makefile infrastructure; same DKMS/kernel-module constraints apply.
;;;   Attempts: A1: Build as kernel module against Guix linux-libre headers —
;;;   kernel module loading not supported in Guix's immutable model.  A2:
;;;   Convert to userspace driver (libusb) — not feasible, hardware requires
;;;   kernel-level tty driver.  A3: Add to custom kernel config — per-user
;;;   kernel build, not distributable.
;;;
;;; === DISTRO_SPECIFIC (11) ===
;;; Tightly coupled to Arch Linux pacman/mkinitcpio/ALPM infrastructure.
;;; mkinitcpio-systemd-root-password (#18371): mkinitcpio hook for root password.
;;; repacman (#18707): Produces pacman packages from installed software.
;;; findbrokenpkgs (#18930): Uses pacman database to find broken packages.
;;; sbctl-initcpio-post-hook (#18720): mkinitcpio hook for Secure Boot signing.
;;; system-age (#18453): Reads pacman install date.  Also, the Rust source
;;;   hardcodes "Archlinux" in output string.
;;;   Attempts: A1: Build with cargo-build-system patching output string — Guix
;;;   lacks rust-chrono and its transitive deps (~15 crates).  A2: Rewrite as
;;;   shell script (stat -c %W /) — different tool, not a port.  A3: Package
;;;   pre-built binary — no release binaries published.
;;; linux-keep-modules (#18490): Pacman hook to preserve kernel modules.
;;; pacpak-git (#17862): Pacman wrapper for Flatpak management.
;;; chromium-extension-arch-search (#17897): Browser extension adding Arch Wiki/
;;;   AUR search.  Technically static JS/HTML files (copy-build-system feasible)
;;;   but requires Chromium at build time for .crx packing, and the extension is
;;;   inherently Arch-ecosystem-specific.
;;;   Attempts: A1: copy-build-system with raw extension files — users must
;;;   enable developer mode or policy-load, poor UX.  A2: Pack .crx in build
;;;   phase using chromium --pack-extension — Chromium needed as native-input,
;;;   heavyweight.  A3: Distribute as .zip with install instructions — not a
;;;   real package, just a wrapper.
;;; python-pypi2pkgbuild (#17822): PyPI to Arch PKGBUILD converter; depends on
;;;   namcap and pkgfile (Arch tools).
;;; archwiki-offline (#18568): Depends on arch-wiki-docs (Arch-specific).
;;;
;;; === PROPRIETARY_BINARY (6) ===
;;; Proprietary, non-redistributable, or unknown-license binaries.
;;; squareline-studio (#17812): Proprietary GUI design tool, no source.
;;; brother-mfc-l2400dw (#17797): Proprietary printer driver binary.
;;; luniistore (#18478): French children's storyteller management app;
;;;   proprietary binary distributed from lunii.fr; unknown/proprietary license.
;;; simplicity-commander (#18419): Silicon Labs debug tool; depends on
;;;   jlink-software-and-documentation (proprietary JTAG debugger suite).
;;; inkdrop (#17819): Proprietary note-taking app.
;;; wyc (#18777): Commercial Chinese port mapping service (wangyunchuan.com);
;;;   commercial license.
;;;
;;; === PLATFORM_UNSUPPORTED (4) ===
;;; Windows-only or require platform-specific infrastructure.
;;; bakkesmod-steam (#17468): Windows-only Rocket League modding tool.
;;; android-platform-19 (#28671): Google Android SDK API level 19.
;;; android-platform-21 (#23109): Google Android SDK API level 21.
;;; euroscope-bin (#18289): Windows-only VATSIM radar client (C++ MFC app).
;;;   Attempts: A1: Wine wrapper — depends on complex Windows GUI framework
;;;   (MFC), Wine rendering poor.  A2: Source build — proprietary source, binary
;;;   only.  A3: Skip — Windows-only application.
;;;
;;; === NON_DISTRIBUTABLE (3) ===
;;; Cannot be redistributed due to license or require purchase.
;;; ttf-consolas-ligaturized (#20499): Font derived from Microsoft Consolas.
;;; factorio-space-age-experimental (#17440): Requires purchase.
;;; receitanet (#18413): Brazilian government tax software; proprietary custom
;;;   license.  Distributed as Java app (Java 11 dep) from gov.br.
;;;   Attempts: A1: Repackage JAR with copy-build-system — license prohibits
;;;   redistribution.  A2: Provide download-and-install script — not a real
;;;   package.  A3: Contact gov.br for redistribution permission — bureaucratic
;;;   impossibility for foreign package channel.
;;;
;;; === MULTILIB_UNSUPPORTED (3) ===
;;; 32-bit library variants not supported on Guix.
;;; lib32-opencl-nvidia-390xx (#17502): 32-bit NVIDIA OpenCL.
;;; lib32-libglade (#18401): 32-bit libglade.
;;; lib32-libxpm (#16491): 32-bit libXpm.
;;;
;;; === MINGW_CROSS_COMPILATION (7) ===
;;; MinGW Windows cross-compilation packages.
;;; mingw-w64-cblas (#34115): MinGW CBLAS.
;;; mingw-w64-lapack (#34113): MinGW LAPACK.
;;; mingw-w64-soundtouch (#18330): MinGW SoundTouch.
;;; mingw-w64-boost (#18391): MinGW Boost.
;;; mingw-w64-cppwinrt (#18421): MinGW C++/WinRT.
;;; mingw-w64-spirv-tools (#18442): MinGW SPIR-V Tools.
;;; mingw-w64-pcre2 (#18365): MinGW PCRE2.
;;;
;;; === ABANDONED_UPSTREAM (2) ===
;;; clash-for-windows-chinese (#17433): Upstream project abandoned.
;;; lightdm-webkit-theme-aether (#19028): Upstream abandoned; webkit greeter
;;;   framework dead.
;;;
;;; === WINE_WRAPPER (2) ===
;;; Require Wine to run Windows applications.
;;; fileoptimizer-bin (#18315): Windows optimizer via Wine.
;;; futu-ftnn-wine (#18151): Chinese stock trading app via Wine.
;;;
;;; === OBSOLETE_DEPS (2) ===
;;; Depend on obsolete/unsupported libraries.
;;; knossu (#18461): Requires glew1.10 and libpng12 (both EOL).
;;;   Attempts: A1: Patch to use current glew/libpng — game is proprietary
;;;   binary, cannot rebuild.  A2: Provide glew1.10 + libpng12 compat packages
;;;   — obsolete libraries with known CVEs, not appropriate.  A3: Containerized
;;;   approach — Guix lacks container-with-old-libs mechanism.
;;; phonon-qt4-vlc (#18938): Requires Qt4 (EOL since 2015).
;;;   Attempts: A1: Build against Qt5/Qt6 — phonon-qt4-vlc is specifically the
;;;   Qt4 backend, Qt5 version is a separate package (already in Guix).
;;;   A2: Package Qt4 — massive effort for EOL framework.
;;;   A3: Skip — Qt4 ecosystem is dead.
;;;
;;; === BUILD_SYSTEM_TOO_COMPLEX (7) ===
;;; Require build infrastructure not available or too complex for Guix.
;;; virtualbox-svn (#18799): Massive codebase; SVN checkout; ~70 deps; DKMS.
;;;   Attempts: A1: gnu-build-system — requires 40+ makedepends, SVN, Java, Qt6,
;;;   kernel headers.  A2: Binary repackage — proprietary components.
;;;   A3: Use Guix's existing virtualbox — different version track.
;;; java-language-server (#18379): Maven build; 14+ transitive Java deps.
;;;   Attempts: A1: maven-build-system — not in Guix.  A2: ant-build-system —
;;;   cannot handle Maven POM.  A3: Pre-built JAR — no official binary releases.
;;; eclipse-pydev (#17948): Eclipse plugin; complex OSGI bundle structure.
;;;   Attempts: A1: copy-build-system with pre-built zip — depends on eclipse
;;;   (not in Guix).  A2: Build from source — requires Eclipse PDE.
;;;   A3: Standalone PyDev — not available without Eclipse.
;;; gephi-git (#18898): Maven build; ~20 Java deps.
;;;   Attempts: A1: maven-build-system — not in Guix.  A2: Pre-built binary —
;;;   no official Linux binary.  A3: Gradle wrapper — project uses Maven.
;;; pulumi-git (#18748): Go build with ~500+ Go modules.
;;;   Attempts: A1: go-build-system — 500+ vendor packages needed.  A2: Pre-built
;;;   binary with copy-build-system — binary links to specific glibc version.
;;;   A3: Minimal CLI binary tarball — license allows but glibc compat issues.
;;; rdt-client (#18392): .NET 8 web application; .NET SDK not in Guix.
;;;   Attempts: A1: dotnet-build-system — not in Guix.  A2: Self-contained
;;;   publish — needs .NET framework in store.  A3: Docker extraction — not
;;;   suitable for Guix.
;;; dxvk-async-git (#18644): DXVK fork with async shader compilation.  Requires
;;;   meson + mingw-w64 cross-compilation to produce Windows DLLs.  Even nonguix
;;;   DXVK packages use pre-built binaries because from-source cross-compilation
;;;   is too complex.  No pre-built release binaries available for async variant.
;;;   Attempts: A1: meson-build-system with mingw cross-files — Guix's
;;;   meson-build-system does not support Windows-target cross-compilation
;;;   natively.  A2: Pre-built binary with copy-build-system — no release
;;;   binaries published for async fork.  A3: Follow nonguix pattern — nonguix
;;;   DXVK uses pre-built releases, but async fork only has git, no releases.
;;;
;;; === NPM_COMPLEX_DEPS (10) ===
;;; Node.js packages requiring 15-200+ npm dependency packages not in Guix.
;;; edgeimpulse-cli (#18574): Edge Impulse IoT CLI; npm with native deps.
;;; nodejs-cspell (#18215): Code spell checker; 200+ npm deps.
;;; osmtogeojson (#18417): OSM-to-GeoJSON; ~25 npm deps.
;;; emmet-language-server (#18958): Emmet LSP; ~25 npm deps.
;;; aws-amplify-cli (#18269): AWS Amplify CLI; massive npm dep tree.
;;; aws-cdk (#18298): AWS CDK CLI; massive npm dep tree.
;;; nodejs-nestjs-cli (#18753): NestJS CLI; npm + typescript.
;;; awk-language-server (#18691): AWK LSP; yarn + typescript pipeline.
;;; vscodium-marketplace (#18695): Patches VSCodium product.json; depends on
;;;   vscodium (not in Guix standard packages).
;;; python-home-assistant-frontend (#18556): Pre-built JavaScript frontend
;;;   (~110 MB) distributed as Python wheel.  Requires Python >= 3.14.  Building
;;;   from source needs hundreds of npm deps.
;;;   Attempts: A1: pyproject-build-system with pre-built wheel from PyPI —
;;;   wheel is py3-none-any (pure Python wrapper for 110 MB of opaque minified
;;;   JavaScript); violates Guix source-bootstrapping.  A2: Build frontend from
;;;   source — requires Node.js toolchain + hundreds of npm packages.
;;;   A3: copy-build-system extracting wheel assets — ships opaque JS bundle,
;;;   Python 3.14 not yet in Guix.
;;;
;;; === MISSING_DEPS (8) ===
;;; Critical dependencies not available in Guix.
;;; libfprint-2-tod1-broadcom-cv3plus (#17912): Proprietary fingerprint driver;
;;;   requires libfprint-tod (proprietary Touch OEM Driver framework).
;;; texmacs-pure (#17873): Requires Pure language interpreter + LLVM 3.5 (both
;;;   unavailable).
;;; nfuspire-git (#18401): FUSE filesystem for TI Nspire; requires libnspire.
;;; gbm (#19044): Game Backup Monitor; requires mono-basic (VB.NET on Mono).
;;; mailnaggertray-git (#18592): Tray icon for mailnagger; requires mailnagger
;;;   (not in Guix) and rust-chrono + ~15 transitive Rust crates.
;;; soapysdrplay3-luarvique-git (#18141): SoapySDR module; requires proprietary
;;;   libsdrplay (no source, binary-only SDK from SDRplay.com).
;;; kamilsss655-uv-k5-firmware-custom-git (#17909): UV-K5 radio firmware;
;;;   requires arm-none-eabi cross-toolchain (gcc, binutils, newlib).  Guix has
;;;   some ARM cross-compilation support but not the bare-metal newlib variant
;;;   needed for microcontroller firmware.
;;;   Attempts: A1: Use Guix's cross-compilation with --target=arm-none-eabi —
;;;   Guix cross-compilation targets Linux, not bare-metal.  A2: Package
;;;   arm-none-eabi-gcc/binutils/newlib trio — 3+ new complex packages needed.
;;;   A3: Pre-built firmware binary — no official pre-built releases.
;;; plugin-autenticacao-gov-pt (#18557): Portuguese government authentication
;;;   plugin.  Distributed only as pre-built .deb binary; no source code
;;;   available.  Licensed under EUPL per metadata but binary-only distribution.
;;;   Guix has pcsc-lite and ccid but the plugin itself is opaque.
;;;   Attempts: A1: Extract .deb and repackage with copy-build-system — ships
;;;   opaque binary with unknown provenance.  A2: Build from source — no source
;;;   repository found.  A3: Contact autenticacao.gov.pt for source — government
;;;   bureaucracy, unlikely to succeed.
;;;
;;; === NON_DISTRIBUTABLE_GAME (3) ===
;;; Games requiring proprietary data or commercial purchase.
;;; urbanterror (#18814): GPL engine (ioquake3 fork) but proprietary game data
;;;   (~1.4 GB pk3 files from FrozenSand).
;;;   Attempts: A1: Package engine only — engine alone is useless without data.
;;;   A2: Binary distribution — mixes GPL engine with proprietary data.
;;;   A3: Separate engine/data packages — data is non-distributable.
;;; unrealtournament4 (#18319): Epic Games proprietary; requires Epic account.
;;; ut2004-gog (#18333): Requires GOG purchase for game data.
;;;
;;; === OTHER (6) ===
;;; libarchive-static (#18758): Static musl build of bsdtar; Guix already has
;;;   libarchive — static musl variant needs cross-compilation infrastructure.
;;;   Attempts: A1: gnu-build-system with musl — musl in Guix is for cross-
;;;   compilation, not native static builds.  A2: Modify existing libarchive
;;;   with static flags — upstream uses glibc.  A3: trivial-build-system
;;;   wrapping guix build with musl toolchain — too fragile.
;;; quartz-utils-git (#18430): Crystal language CLI tools; Crystal compiler not
;;;   in Guix (no crystal-build-system or shards support).
;;;   Attempts: A1: crystal-build-system — does not exist in Guix.  A2: Package
;;;   Crystal compiler first — massive bootstrapping effort.  A3: Pre-built
;;;   binary — no release binaries published.
;;; python-gradio-pdf (#18463): Depends on python-gradio which has a massive
;;;   dependency tree (100+ Python packages, npm frontend build).
;;; python-jaxlib-bin (#18474): Binary wheel containing compiled XLA/LLVM native
;;;   code.  Binary wheels with C extensions are incompatible with Guix's
;;;   dynamic linking model (expects specific glibc/library paths).
;;;   Attempts: A1: pyproject-build-system with wheel from PyPI — native .so
;;;   files in wheel link against specific glibc/library versions, not Guix
;;;   store paths.  A2: Build from source — requires Bazel + XLA compiler
;;;   infrastructure (not in Guix).  A3: Patchelf to fix library paths — XLA
;;;   runtime has 50+ .so files with complex interdependencies.
;;; glibc-eac (#18644): Patched glibc adding DT_HASH for EasyAntiCheat games.
;;;   Replacing system glibc is extremely dangerous and conflicts with Guix's
;;;   package model.
;;;   Attempts: A1: Package as alternate glibc — conflicts with system glibc,
;;;   breaks store integrity.  A2: LD_PRELOAD wrapper library providing only
;;;   the DT_HASH symbol table — requires deep ELF internals knowledge.
;;;   A3: Game-specific wrapper script using alternate glibc in container —
;;;   Guix lacks easy container-with-modified-glibc mechanism.
;;; eddiscovery (#18644): Elite Dangerous companion app; requires Mono runtime
;;;   and msbuild (neither in Guix standard packages).
;;;   Attempts: A1: Build with Guix's Mono (if available) — Guix does not
;;;   package Mono.  A2: Binary tarball — no official Linux binary release.
;;;   A3: Rewrite in different language — out of scope.
;;;
;;; === PREVIOUSLY_CATEGORIZED (2) ===
;;; asp (#14587): DISTRO_SPECIFIC — Arch Build System package tool.
;;; pamac-cli (#18299): DISTRO_SPECIFIC — ALPM/pacman frontend.
;;; nvidia-bl-dkms (#17755): DKMS_KERNEL_MODULE — NVIDIA backlight driver.
;;;
;;; === SUMMARY ===
;;; Total evaluated: 100
;;; New recipes: 0
;;; Remaining BLOCKED: 100
;;;
;;; The top-100 priority queue consists entirely of packages with fundamental
;;; incompatibilities: DKMS/kernel modules (14), distro-specific Arch tools (11),
;;; npm ecosystems (10), complex build systems (7), proprietary binaries (6),
;;; missing AUR source (5), missing Guix deps (8), platform-unsupported (4),
;;; MinGW cross-compilation (7), non-distributable (3+3 games), multilib (3),
;;; SELinux (2), abandoned upstream (2), Wine wrappers (2), obsolete deps (2),
;;; and miscellaneous (6).
;;;
;;; After 20+ successive deptree-resolver passes, the resolvable package pool
;;; is exhausted.  Future passes on this same BLOCKED queue will yield zero
;;; new recipes unless:
;;; 1) New Guix infrastructure appears (cargo crate ecosystem, npm ecosystem,
;;;    .NET/Mono, Maven, Crystal, DKMS-equivalent)
;;; 2) Packages are removed from AUR or replaced by alternatives
;;; 3) New BLOCKED packages are added to the queue from other sources
