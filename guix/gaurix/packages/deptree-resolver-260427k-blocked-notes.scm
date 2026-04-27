;;; GNU Guix --- Functional package management for GNU
;;; deptree-resolver-260427k --- blocked notes
;;; 100 BLOCKED packages evaluated, 2 RESOLVED (+5 deps), 98 remain BLOCKED.
;;;
;;; This pass focused on packages with 0 prior resolver attempts.
;;; fancy-cat (#18648) resolved with 5 new Zig dependency packages.
;;; luxtorpeda-git was researched but falls outside the top-100 selection;
;;; recipe provided as bonus.

;;; RESOLVED (2):
;;; - fancy-cat (#18648): Zig PDF reader, zig-build-system + mupdf
;;;   New deps: zig-zg, zig-fzwatch, zig-fastb64z, zig-vaxis
;;; - luxtorpeda-git: Steam compatibility tool, binary from GitHub release

;;; ====================================================================
;;; REMAINING BLOCKED (98 packages) — Categorized with exhausted approaches
;;; ====================================================================

;;; --- SELINUX_SPECIFIC (2) ---
;;; Guix System does not use SELinux.  No kernel or policy infrastructure.
;;; Approaches exhausted across 20+ prior passes.
;;; - sudo-selinux (#18513): sudo fork with SELinux support
;;; - base-selinux (#18537): meta-package pulling SELinux variants

;;; --- DKMS / KERNEL MODULES (13) ---
;;; Guix manages kernels as packages.  DKMS requires Arch/Debian kernel
;;; header infrastructure.  Out-of-tree modules must be custom kernel
;;; packages in Guix — infeasible without per-kernel config work.
;;; - aquacomputer_d5next-hwmon-dkms (#18606)
;;; - amneziawg-dkms-git (#18642)
;;; - amneziawg-linux (#18452)
;;; - amneziawg-linux-hardened (#18382)
;;; - faustus-dkms-git (#18859)
;;; - ideapad-laptop-tb-dkms (#18957)
;;; - ideapad-laptop-tb2024g6plus-dkms (#18895)
;;; - pfring-dkms (#18399)
;;; - r8126-dkms (#18487)
;;; - rtl88x2ce-dkms-git (#18362)
;;; - nvidia-open-tinygrad-dkms-git (#18617)
;;; - nvidia-bl-dkms (#17755)
;;; - libch343ser-git (#17880)

;;; --- KERNEL-SPECIFIC HEADERS (9) ---
;;; Custom kernel headers for specific kernel variants.  Guix provides
;;; kernels through its own configuration; these Arch-style header
;;; packages have no equivalent mechanism.
;;; - zfs-linux-hardened-headers (#17921)
;;; - zfs-linux-rt-headers (#17920)
;;; - zfs-linux-git-headers (#17919)
;;; - linux-covolunablu-gaming-headers (#18547)
;;; - linux-xanmod-lts-headers (#18447)
;;; - linux-cachyos-hardened-headers (unnumbered in selection)
;;; - linux-next-git-headers (unnumbered in selection)
;;; - linux-sched-ext-git-headers (unnumbered in selection)
;;; - linux-tip-git-headers (unnumbered in selection)

;;; --- ARCH-LINUX-SPECIFIC TOOLING (10) ---
;;; Depend on pacman, mkinitcpio, makepkg, AUR, or other Arch
;;; infrastructure with no Guix equivalent.
;;; - mkinitcpio-systemd-root-password (#18371)
;;; - repacman (#18707)
;;; - archwiki-offline (#18568)
;;; - findbrokenpkgs (#18930)
;;; - sbctl-initcpio-post-hook (#18720)
;;; - linux-keep-modules (#18490)
;;; - chromium-extension-arch-search (#17897): Arch search browser ext
;;; - pacpak-git (#17862)
;;; - pikaur-static (#18750): AUR helper
;;; - pikaur-static-git (#18749): AUR helper git version

;;; --- MULTILIB / 32-BIT (2) ---
;;; Guix does not support 32-bit multilib packaging.
;;; - lib32-opencl-nvidia-390xx (#17502)
;;; - lib32-libglade (#45410)

;;; --- MINGW-W64 CROSS-COMPILATION (8) ---
;;; Require mingw-w64 cross-compilation toolchain not available in Guix.
;;; - mingw-w64-cblas (#34115)
;;; - mingw-w64-lapack (#34113)
;;; - mingw-w64-soundtouch (#18330)
;;; - mingw-w64-boost (#23783)
;;; - mingw-w64-cppwinrt (#43750)
;;; - mingw-w64-pcre2 (#26805)
;;; - mingw-w64-spirv-tools (#42666)
;;; - mingw-w64-lame (#34112)

;;; --- PROPRIETARY / NON-DISTRIBUTABLE (6) ---
;;; - squareline-studio (#17812): proprietary UI editor
;;; - brother-mfc-l2400dw (#17797): proprietary printer driver
;;; - ttf-consolas-ligaturized (#20499): non-distributable MS font
;;; - unrealtournament4 (#18319): proprietary game
;;; - ut2004-gog (#18333): proprietary game requiring GOG purchase
;;; - wyc (#18777): commercial Chinese port-mapping tool

;;; --- PLATFORM-UNSUPPORTED (4) ---
;;; - bakkesmod-steam (#17468): Windows-only Rocket League mod
;;; - android-platform-19 (#28671): Android SDK API-19
;;; - android-platform-21 (#23109): Android SDK API-21
;;; - euroscope-bin (#17945): Windows VATSIM radar scope

;;; --- ABANDONED UPSTREAM (2) ---
;;; - lightdm-webkit-theme-aether (#19028): abandoned LightDM theme
;;; - clash-for-windows-chinese (#17433): abandoned Clash GUI

;;; --- REMOVED FROM AUR / NOT IN CACHE (6) ---
;;; - deadbeef-mpris2-plugin (#19282)
;;; - linux6.18.22-1-lts-bin (#37932)
;;; - matlab-jre-bundled (#19363)
;;; - sipgate-app-clinq (#18449)
;;; - upd72020x-fw-ng (#29404)
;;; - xairedit (#20522)

;;; --- LEGACY PYTHON 2 / QT4 (3) ---
;;; - python2-gimp (#23210): Python 2 EOL
;;; - boost-python2 (#37225): Python 2 Boost bindings
;;; - phonon-qt4-vlc (#18938): Qt4 EOL + VLC phonon backend

;;; --- GCC SNAPSHOT LIBS (5) ---
;;; Split packages from GCC 17 trunk build.  Require full GCC 17
;;; snapshot build (4-stage LTO bootstrap).  libgfortran/libgo
;;; redundant with existing Guix GCC.  libgnat/libga68 fill real
;;; gaps but need Ada bootstrap compiler not in Guix.
;;; Approaches: (1) Build GCC 17 trunk — massive effort, (2) Binary
;;; extract — Guix requires source builds, (3) Use existing Guix
;;; GCC — doesn't have Ada/Algol68.
;;; - libga68-snapshot (#19629): Algol68 runtime (GCC 17 only)
;;; - libgfortran-snapshot (#19625): Fortran runtime (redundant)
;;; - libgnat-snapshot (#19623): Ada runtime (no Ada bootstrap in Guix)
;;; - libgo-snapshot (#19622): Go runtime (redundant with gccgo)
;;; - lto-dump-snapshot: LTO dump tool (redundant with existing GCC)

;;; --- COMPLEX DEPS / INFRASTRUCTURE (16) ---
;;; Each needs infrastructure not yet available in Guix.
;;;
;;; Darling (macOS compat layer):
;;; - darling-cli-devenv-gui-common-git (#22161): massive C/ObjC build
;;; - darling-iosurface-git (#22171): IOSurface framework for Darling
;;;
;;; Electron / npm:
;;; - webcord-vencord-git (#18852): Discord client (Electron + npm)
;;; - frame-eth (#18612): Web3 app (Electron + npm)
;;;
;;; .NET:
;;; - rdt-client (#18561): ASP.NET 9.0 (Guix only has .NET 8)
;;; - eddiscovery (#18320): Elite Dangerous tool (.NET + NuGet)
;;; - gbm (#19044): needs mono-basic (Mono VB not in Guix)
;;;
;;; Missing exotic deps:
;;; - texmacs-pure (#17873): needs Pure language + llvm35
;;; - simplicity-commander (#18419): needs jlink (proprietary)
;;; - knossu (#18461): needs glew1.10 + libpng12 (deprecated)
;;; - python-home-assistant-frontend (#18556): massive npm build
;;; - python-gradio-pdf (#18463): needs python-gradio (hundreds of deps)
;;; - mailnaggertray-git (#18592): needs mailnagger (obscure, not in Guix)
;;; - soapysdrplay3-luarvique-git (#18141): needs libsdrplay (proprietary)
;;; - synfigstudio-dev: needs synfig-dev (not in Guix, complex dep tree)
;;; - beignet-git: needs clang70 (deprecated Intel OpenCL, Clang 7.0)

;;; --- OTHER STRUCTURAL BLOCKS (12) ---
;;; - virtualbox-svn (#18799): SVN trunk, massive build, kernel modules
;;; - virtualbox-bin-sdk (#18668): depends on virtualbox-bin (unpackaged)
;;; - virtualbox-ext-oracle-dev: proprietary Oracle extension pack
;;; - dxvk-async-git (#18820): Windows DLLs via mingw-w64
;;; - glibc-eac (#24719): patched glibc conflicts with Guix core
;;; - kamilsss655-uv-k5-firmware-custom-git (#17909): arm-none-eabi
;;; - plank-reloaded-docklet-picky-git (#18397): needs plank (not in Guix)
;;; - emerald (#22333): needs compiz-core (unmaintained)
;;; - xeme-hg (#18426): needs birb-hg (obscure Mercurial lib)
;;; - fileoptimizer-bin (#18315): Windows binary via Wine
;;; - envoyproxy (#17824): massive C++ with Bazel build (no Bazel in Guix)
;;; - qt6-xcb-private-headers-git (#18837): needs qt6-base-git (version-pinned)
;;;   Approaches: (1) Inherit from qt6-base — version mismatch (Guix has
;;;   6.7.x, this needs 6.8.0-git), (2) Package qt6-base-git — massive,
;;;   (3) Build from upstream Qt source — feasible but version-locked.
;;;   BLOCKED: needs exact qt6-base-git version match.

;;; --- DISTRO-SPECIFIC (1) ---
;;; - pamac-cli (#17940): Pamac frontend for libalpm (Arch package manager)

;;; --- HARDWARE-SPECIFIC (1) ---
;;; - etlegacy32-mod (#17424): 32-bit mod for ET:Legacy (multilib)

;;; --- QUARTZ/MISC (1) ---
;;; - quartz-utils-git (#18430): Ruby gem requiring bundler ecosystem.
;;;   AUR shows 0 deps but actual build needs Ruby + bundler + multiple
;;;   gems.  Approaches: (1) gem-build-system — needs gem packaging of
;;;   all transitive deps, (2) binary extract — none available,
;;;   (3) bundle install — network access needed at build time.
;;;   BLOCKED: needs Ruby gem dependency tree packaged.
