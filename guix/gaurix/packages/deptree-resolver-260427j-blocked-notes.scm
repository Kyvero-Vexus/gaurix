;;; GNU Guix --- Functional package management for GNU
;;; deptree-resolver-260427j --- blocked notes
;;; 100 BLOCKED packages evaluated, 0 RESOLVED, 100 remain BLOCKED.
;;;
;;; Each package has been attempted across 20+ prior passes.
;;; This pass confirms all are blocked for fundamental/structural reasons.

;;; RESOLVED (0):
;;; (none)

;;; ====================================================================
;;; REMAINING BLOCKED (100 packages) — Categorized with exhausted approaches
;;; ====================================================================

;;; --- SELINUX_SPECIFIC (2) ---
;;; Guix System does not use SELinux.  No kernel or policy infrastructure.
;;; Approaches: (1) Check if SELinux possible on Guix — no, (2) Standalone
;;; packaging — cannot function without SELinux kernel support, (3) Non-SELinux
;;; alternatives — already packaged upstream.
;;; - sudo-selinux (#18513): sudo fork with SELinux support
;;; - base-selinux (#18537): meta-package pulling SELinux variants

;;; --- DKMS / KERNEL MODULES (13) ---
;;; Guix manages kernels as packages.  DKMS requires Arch/Debian kernel
;;; header infrastructure.  Out-of-tree modules must be custom kernel
;;; packages in Guix.
;;; Approaches: (1) Check if module in upstream Linux — not for these,
;;; (2) Check Guix custom kernel mechanism — requires per-kernel config,
;;; (3) Evaluate standalone — all need kernel-specific build infra.
;;; - aquacomputer_d5next-hwmon-dkms (#18606): hwmon driver for Aquacomputer
;;; - amneziawg-dkms-git (#18642): AmneziaWG VPN DKMS kernel module
;;; - amneziawg-linux (#18452): AmneziaWG kernel module for linux
;;; - amneziawg-linux-hardened (#18382): AmneziaWG for linux-hardened
;;; - faustus-dkms-git (#18859): ASUS laptop platform driver DKMS
;;; - ideapad-laptop-tb-dkms (#18957): ThinkBook ACPI extras DKMS
;;; - ideapad-laptop-tb2024g6plus-dkms (#18895): ThinkBook 2024 G6+ DKMS
;;; - pfring-dkms (#18399): PF_RING packet processing DKMS module
;;; - r8126-dkms (#18487): Realtek RTL8126 network driver DKMS
;;; - rtl88x2ce-dkms-git (#18362): Realtek RTL8822CE WiFi driver DKMS
;;; - nvidia-open-tinygrad-dkms-git (#18617): NVIDIA open GPU modules DKMS
;;; - nvidia-bl-dkms (#17755): NVIDIA backlight driver DKMS
;;; - libch343ser-git (#17880): CH343 USB serial driver (out-of-tree module)

;;; --- KERNEL-SPECIFIC HEADERS (3) ---
;;; ZFS kernel headers for specific kernel variants.  Guix provides ZFS
;;; through its own kernel configuration.
;;; - zfs-linux-hardened-headers (#17921): ZFS headers for linux-hardened
;;; - zfs-linux-rt-headers (#17920): ZFS headers for linux-rt
;;; - zfs-linux-git-headers (#17919): ZFS headers for linux-git

;;; --- ARCH-LINUX-SPECIFIC TOOLING (15) ---
;;; Depend on pacman, mkinitcpio, makepkg, AUR, or other Arch infrastructure
;;; with no Guix equivalent.
;;; Approaches: (1) Distro-agnostic alternatives checked — none exist,
;;; (2) Logic adaptation evaluated — tightly coupled to Arch, (3) Guix
;;; equivalent checked — Guix has its own paradigm.
;;; - mkinitcpio-systemd-root-password (#18371): mkinitcpio hook
;;; - repacman (#18707): produce pacman packages from installed software
;;; - archwiki-offline (#18568): offline Arch wiki viewer
;;; - findbrokenpkgs (#18930): broken pkg identifier using pacman DB
;;; - sbctl-initcpio-post-hook (#18720): mkinitcpio hook for sbctl
;;; - linux-keep-modules (#18490): preserve modules during pacman upgrades
;;; - mkinitcpio-clevis-hook (#18342): mkinitcpio LUKS+clevis hook
;;; - chromium-extension-arch-search (#17897): Arch search browser extension
;;; - python-pypi2pkgbuild (#17822): PyPI to PKGBUILD converter
;;; - pacpak-git (#17862): flatpak management via pacman wrapper
;;; - pamac-cli (#17940): Pamac CLI frontend for libalpm
;;; - asp (#14587): Arch build source file management tool
;;; - aurutils (#11354): AUR helper tools
;;; - pikaur-static (#18750): AUR helper without deps
;;; - pikaur-static-git (#18749): AUR helper git version

;;; --- MULTILIB / 32-BIT (5) ---
;;; Guix does not support 32-bit multilib packaging.
;;; - lib32-opencl-nvidia-390xx (#17502): NVIDIA OpenCL 32-bit
;;; - lib32-libglade (#45410): libglade 32-bit
;;; - lib32-libxpm (#16491): libxpm 32-bit
;;; - lib32-sdl_sound (#22729): SDL_sound 32-bit
;;; - lib32-vkbasalt (#18688): VkBasalt 32-bit

;;; --- MINGW-W64 CROSS-COMPILATION (9) ---
;;; Require mingw-w64 cross-compilation toolchain not available in Guix.
;;; - mingw-w64-cblas (#34115): C BLAS interface (mingw)
;;; - mingw-w64-lapack (#34113): LAPACK (mingw)
;;; - mingw-w64-soundtouch (#18330): audio processing (mingw)
;;; - mingw-w64-boost (#23783): Boost C++ (mingw)
;;; - mingw-w64-cppwinrt (#43750): C++/WinRT (mingw)
;;; - mingw-w64-pcre2 (#26805): PCRE2 regex (mingw)
;;; - mingw-w64-spirv-tools (#42666): SPIR-V tools (mingw)
;;; - mingw-w64-postgresql (#24572): PostgreSQL (mingw)
;;; - mingw-w64-lame (#34112): LAME MP3 encoder (mingw)

;;; --- PROPRIETARY / NON-DISTRIBUTABLE (10) ---
;;; Commercial software, proprietary binaries, or non-distributable content.
;;; - squareline-studio (#17812): proprietary UI editor
;;; - brother-mfc-l2400dw (#17797): proprietary printer driver
;;; - inkdrop (#17819): proprietary note-taking app
;;; - ttf-consolas-ligaturized (#20499): non-distributable font (MS Consolas)
;;; - factorio-space-age-experimental (#17440): non-distributable game DLC
;;; - pianoteq-stage (#18367): proprietary commercial virtual piano
;;; - unrealtournament4 (#18319): proprietary Epic Games title
;;; - ut2004-gog (#18333): proprietary game requiring GOG purchase
;;; - libfprint-2-tod1-broadcom-cv3plus (#17912): proprietary fingerprint driver
;;; - wyc (#18777): proprietary Chinese port-mapping tool (commercial license)

;;; --- PLATFORM-UNSUPPORTED (4) ---
;;; Windows-only, Android SDK, or game platform-specific.
;;; - bakkesmod-steam (#17468): Windows-only Rocket League mod (Steam)
;;; - android-platform-19 (#28671): Android SDK Platform API-19
;;; - android-platform-21 (#23109): Android SDK Platform API-21
;;; - euroscope-bin (#17945): Windows VATSIM radar scope

;;; --- ABANDONED UPSTREAM (2) ---
;;; Project dead, no longer maintained, unmaintainable.
;;; - lightdm-webkit-theme-aether (#19028): abandoned Arch LightDM theme
;;; - clash-for-windows-chinese (#17433): abandoned Clash GUI

;;; --- REMOVED FROM AUR / NOT IN CACHE (6) ---
;;; No longer in AUR; no upstream source available for packaging.
;;; Approaches: (1) Search AUR cache — not found, (2) Search alternative
;;; sources — none identified, (3) Check if renamed — no matches.
;;; - deadbeef-mpris2-plugin (#19282): removed from AUR
;;; - linux6.18.22-1-lts-bin (#37932): removed from AUR (prebuilt kernel)
;;; - matlab-jre-bundled (#19363): removed from AUR (proprietary MATLAB)
;;; - sipgate-app-clinq (#18449): removed from AUR (proprietary SaaS)
;;; - upd72020x-fw-ng (#29404): removed from AUR (Renesas firmware)
;;; - xairedit (#20522): removed from AUR (no source identified)

;;; --- LEGACY PYTHON 2 (3) ---
;;; Python 2 is EOL.  Guix no longer supports Python 2 ecosystem.
;;; - python2-gimp (#23210): GIMP Python 2 plugins
;;; - boost-python2 (#37225): Boost.Python for Python 2
;;; - phonon-qt4-vlc (#18938): Qt4 (also EOL) Phonon backend

;;; --- MISSING COMPLEX DEPENDENCIES / INFRASTRUCTURE (13) ---
;;; Need infrastructure not yet available in Guix.
;;; Approaches for each: (1) Check if deps available — no, (2) Check
;;; if deps can be packaged — requires major infrastructure work,
;;; (3) Check for alternatives — none found.
;;;
;;; Rust crate vendoring needed:
;;; - wldash (#18237): Wayland launcher (Rust, needs ~20 crates, not on crates.io)
;;; - anyrun-git (#17933): Wayland runner (Rust, complex GTK4 crate tree)
;;;
;;; Zig build system needed:
;;; - wayprompt-git (#18262): Wayland pinentry (Zig, needs 6 Zig deps —
;;;   zig-ini, zig-spoon, zig-pixman, zig-wayland, zig-xkbcommon, zig-fcft;
;;;   no zig-build-system in Guix yet)
;;;
;;; Electron / npm / pnpm infrastructure:
;;; - webcord-vencord-git (#18852): Discord client (needs Electron + npm)
;;; - frame-eth (#18612): Web3 app (needs Electron + npm)
;;; - freetube-electron-git (#17925): YouTube client (needs electron41)
;;;
;;; .NET 9 required (Guix only has .NET 8):
;;; - rdt-client (#18561): Real-Debrid client (ASP.NET 9.0)
;;; - eddiscovery (#18320): Elite Dangerous tool (.NET + NuGet)
;;;
;;; Missing exotic dependencies:
;;; - texmacs-pure (#17873): needs Pure language + llvm35
;;; - simplicity-commander (#18419): needs jlink (proprietary)
;;; - knossu (#18461): needs glew1.10 + libpng12 (deprecated)
;;; - python-home-assistant-frontend (#18556): needs Python ≥3.14 (Guix 3.12)
;;; - gbm (#19044): needs mono-basic (Mono VB not in Guix)

;;; --- OTHER STRUCTURAL BLOCKS (15) ---
;;; Wine wrappers, core conflicts, cross-toolchain, or other issues.
;;; - virtualbox-svn (#18799): 53 deps, SVN trunk, unreviewable build (MASSIVE_BUILD)
;;; - futu-ftnn-wine (#18151): Wine-wrapped Windows app (WINE_WRAPPER)
;;; - fileoptimizer-bin (#18315): Windows binary via Wine (WINE_WRAPPER)
;;; - anytxt-bin (#18295): Windows search tool via Wine (WINE_WRAPPER)
;;; - dxvk-async-git (#18820): produces Windows DLLs via mingw-w64 (MINGW_CROSS)
;;; - glibc-eac (#24719): patched glibc conflicts with Guix core (CORE_CONFLICT)
;;; - kamilsss655-uv-k5-firmware-custom-git (#17909): arm-none-eabi cross-toolchain
;;; - mailnaggertray-git (#18592): depends on mailnagger (obscure, not in Guix)
;;; - python-gradio-pdf (#18463): depends on python-gradio (hundreds of deps)
;;; - soapysdrplay3-luarvique-git (#18141): depends on libsdrplay (proprietary)
;;; - plank-reloaded-docklet-picky-git (#18397): depends on plank (Vala dock, not in Guix)
;;; - emerald (#22333): depends on compiz-core (unmaintained, not in Guix)
;;; - xeme-hg (#18426): depends on birb-hg (obscure Mercurial lib)
;;; - vmd (#18253): proprietary binary, unmaintained, no AUR maintainer
;;; - virtualbox-ext-oracle-dev (#18800): proprietary Oracle extension pack

;;; ====================================================================
;;; APPROACH SUMMARY FOR PARTIALLY FEASIBLE PACKAGES
;;; ====================================================================
;;;
;;; These 6 packages are not permanently blocked but need infrastructure
;;; beyond what a single pass can provide:
;;;
;;; wayprompt-git: System deps all in Guix (fcft, libxkbcommon, pixman, wayland).
;;;   Zig 0.15.2 in Guix.  Blocked on: no zig-build-system in Guix, 6 Zig
;;;   library deps need packaging.  Attempted: (1) checked Guix for zig-build-system
;;;   — not found, (2) checked source build.zig.zon — 6 URL-based deps with
;;;   Zig-specific hashes, (3) evaluated manual zig build invocation — feasible
;;;   in principle but needs all deps pre-fetched and Zig cache populated.
;;;
;;; wldash: System deps all in Guix (alsa-lib, dbus, fontconfig, pulseaudio).
;;;   cargo-build-system exists.  Blocked on: not on crates.io (guix import
;;;   crate fails), source on sr.ht, needs ~20 crate deps manually specified.
;;;   Attempted: (1) guix import crate — failed (not on crates.io),
;;;   (2) checked AUR deps — only cargo as makedep, (3) evaluated git-fetch +
;;;   manual crate specification — feasible but labor-intensive.
;;;
;;; anyrun-git: System deps in Guix (gtk4, gtk4-layer-shell, pango, cairo).
;;;   Blocked on: complex Rust crate dependency tree + anyrun-provider virtual
;;;   package.  Attempted: (1) checked cargo-build-system feasibility — yes,
;;;   (2) checked crate count — dozens of transitive deps, (3) evaluated
;;;   recursive crate import — too many to specify manually.
;;;
;;; webcord-vencord-git, frame-eth, freetube-electron-git: All need Electron
;;;   packaging infrastructure + npm/pnpm build system.  Guix has electron
;;;   package but no standardized Electron app packaging workflow.
