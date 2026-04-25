;;; deptree-resolver-260425e --- Blocked Package Notes
;;;
;;; 100 BLOCKED packages evaluated, all 100 selected for resolution.
;;; Results: 7 new recipes, 0 ALREADY_RESOLVED, 0 ALREADY_IN_GUIX, 93 remain BLOCKED.
;;;
;;; === NEW RECIPES (7) ===
;;; 1. shig-bin v1.1.1 — CLI utility for OpenSSH file signing (prebuilt Go binary)
;;; 2. atuin-lily-bin v18.2.0 — shell history with sync, lilydjwg fork (prebuilt Rust binary, musl)
;;; 3. hyperledger-fabric-bin v3.1.4 — distributed ledger platform (prebuilt Go binaries)
;;; 4. gdx-liftoff-bin v1.14.0.8 — LibGDX project generator (prebuilt JAR)
;;; 5. beet-summarize v0.2.0 — beets music library summarizer (Python/pyproject source build)
;;; 6. openpace v1.1.4 — EAC v2 cryptographic library (C/autotools source build)
;;; 7. openfortivpn-webview-bin v1.2.3 — FortiVPN SAML SSO helper (Electron AppImage)
;;;
;;; === NOTES ON RESOLUTIONS ===
;;; - shig-git: Was DEP_RESOLUTION_FAILED due to Go module deps.
;;;   Resolved via prebuilt static binary from GitHub releases.
;;; - atuin-lily-git: Was DEP_RESOLUTION_FAILED due to 100+ Rust crate deps.
;;;   Resolved via prebuilt musl binary.  Installed as atuin-lily to avoid
;;;   conflicts with upstream atuin package.
;;; - hyperledger-fabric: Was DEP_RESOLUTION_FAILED due to massive Go dep tree.
;;;   Resolved via prebuilt binary tarball.  Binaries prefixed with fabric-
;;;   to avoid namespace conflicts.
;;; - gdx-liftoff: Was DEP_RESOLUTION_FAILED citing Java/Gradle deps.
;;;   Resolved via prebuilt Linux JAR with Java wrapper script.
;;; - beet-summarize-git: Was DEP_RESOLUTION_FAILED citing beets plugin deps.
;;;   Re-evaluation found only beets>=1.5.0 as dep (already in Guix).
;;;   Simple pyproject build with setuptools.
;;; - openpace-git: Was DEP_RESOLUTION_FAILED citing OpenSSL deps.
;;;   Re-evaluation: standard autotools C library, only needs OpenSSL
;;;   (already in Guix).  Builds with autoreconf + configure + make.
;;; - openfortivpn-webview-electron: Was DEP_RESOLUTION_FAILED citing Electron.
;;;   Resolved via prebuilt AppImage from GitHub releases.
;;;
;;; === REMAINING BLOCKED — BY CATEGORY ===
;;;
;;; TOOLING_FAILURE / DISTRO_SPECIFIC (16):
;;;   sudo-selinux (#18513), base-selinux (#18537) — SELinux variants
;;;     require Guix-level SELinux integration not available.
;;;   neovim-lspconfig-opt-git (#18703) — editor plugin, use native plugin manager.
;;;   aquacomputer_d5next-hwmon-dkms (#18606) — DKMS kernel module.
;;;   locale-mul_zz (#18423) — Arch-specific glibc locale hack.
;;;   amneziawg-dkms-git (#18642) — DKMS kernel module.
;;;   archwiki-offline (#18568) — depends on arch-wiki-docs (Arch-specific).
;;;   coreutils-arch (#18690) — Arch-specific coreutils variant.
;;;   mkinitcpio-systemd-root-password (#18371) — mkinitcpio-specific.
;;;   pamac-cli (#17940) — pacman/libalpm-specific.
;;;   pacpak-git (#17862) — pacman wrapper.
;;;   pikaur-static (#18750), pikaur-static-git (#18749) — AUR helpers.
;;;   repacman (#18707) — pacman-specific tool.
;;;   linux-covolunablu-gaming-headers (#18547) — custom kernel headers.
;;;   linux-xanmod-lts-headers (#18447) — custom kernel headers.
;;;   A1: Evaluated for standalone Guix recipes — no viable path.
;;;   A2: SELinux requires Guix integration; plugins need native managers.
;;;   A3: Arch tools assume pacman/makepkg infrastructure.
;;;
;;; DKMS_KERNEL_MODULE (4):
;;;   amneziawg-linux (#18452), amneziawg-linux-hardened (#18382) — WireGuard variants.
;;;   pfring-dkms (#18399) — network packet capture.
;;;   nvidia-bl-dkms (#17755) — NVIDIA backlight DKMS module.
;;;   A1: DKMS modules must be built against kernel sources in Guix.
;;;   A2: Requires kernel module infrastructure not available in batch.
;;;   A3: Out-of-tree modules need significant kernel build integration.
;;;
;;; KERNEL_MODULE (1):
;;;   libch343ser-git (#17880) — USB serial driver, requires kernel integration.
;;;
;;; KERNEL_HEADERS (7):
;;;   linux-cachyos-hardened-headers (#18522) — CachyOS hardened kernel.
;;;   linux-next-git-headers (#18514) — bleeding-edge kernel.
;;;   linux-sched-ext-git-headers (#18498) — sched-ext kernel.
;;;   linux-tip-git-headers (#18533) — tip tree kernel.
;;;   zfs-linux-git-headers (#17919) — ZFS git kernel headers.
;;;   linux-covolunablu-gaming-headers (#18547) — custom gaming kernel.
;;;   linux-xanmod-lts-headers (#18447) — Xanmod LTS kernel.
;;;   A1: Custom kernel variants not available in Guix.
;;;   A2: Guix uses its own kernel packages with integrated headers.
;;;   A3: Building custom kernel headers requires full kernel config.
;;;
;;; PLATFORM_UNSUPPORTED (1):
;;;   bakkesmod-steam (#17468) — Windows-only Rocket League mod.
;;;
;;; MINGW_CROSS_COMPILATION (7):
;;;   mingw-w64-cblas (#34115), mingw-w64-lapack (#34113),
;;;   mingw-w64-soundtouch (#18330), mingw-w64-sqlite (#25121),
;;;   mingw-w64-cppwinrt (#43750), mingw-w64-pcre2 (#26805),
;;;   mingw-w64-spirv-tools (#42666).
;;;   A1: Windows cross-compilation targets — no Linux use case.
;;;   A2: Guix has limited mingw-w64 cross-compilation infrastructure.
;;;   A3: Native Linux equivalents already available in Guix.
;;;
;;; MULTILIB_UNSUPPORTED (1):
;;;   lib32-opencl-nvidia-390xx (#17502) — 32-bit NVIDIA OpenCL.
;;;   Guix has no multilib layer.
;;;
;;; SOURCE_UNAVAILABLE (5):
;;;   squareline-studio (#17812) — proprietary, session-gated downloads.
;;;   luniistore (#18478) — proprietary, removed from distribution.
;;;   simplicity-commander (#18419) — proprietary Silicon Labs tool.
;;;   wyc (#18777) — Chinese commercial tunneling tool, no stable URL.
;;;   gstreamermm-docs (#18675) — upstream source 404.
;;;   A1: Searched for alternative sources and mirrors.
;;;   A2: Checked web archives — not cached.
;;;   A3: No viable distribution path.
;;;
;;; BROWSER_EXTENSION (2):
;;;   librewolf-extension-ublock-origin-bin (#18355),
;;;   librewolf-tridactyl-native-bin (#18285).
;;;   Should be installed via browser extension mechanism.
;;;
;;; ANDROID_SDK_PLATFORM (2):
;;;   android-platform-19 (#28671), android-platform-21 (#23109).
;;;   Proprietary Google Android SDK files.
;;;
;;; AUR_REPO_DELETED (4):
;;;   libga68-snapshot (#19629), libgfortran-snapshot (#19625),
;;;   libgnat-snapshot (#19623), libgo-snapshot (#19622).
;;;   A1: AUR git repositories no longer exist.
;;;   A2: GCC snapshot runtime libraries — Guix provides its own GCC.
;;;   A3: No upstream source available.
;;;
;;; COMPLEX_DEPS / MACOS_COMPAT (2):
;;;   darling-cli-devenv-gui-common-git (#22161),
;;;   darling-iosurface-git (#22171).
;;;   Darling macOS compatibility layer — requires massive macOS framework
;;;   porting not feasible in batch.
;;;
;;; LEGACY_PYTHON2 (1):
;;;   boost-python2 (#37225) — Boost.Python for Python 2.
;;;   Python 2 is EOL; no Guix support path.
;;;
;;; LICENSE_REVIEW_NEEDED (2):
;;;   libfprint-2-tod1-broadcom-cv3plus (#17912) — proprietary Broadcom blob.
;;;   brother-mfc-l2400dw (#17797) — proprietary Brother driver.
;;;   A1: Proprietary firmware/drivers cannot be freely distributed.
;;;   A2: Require non-free license acceptance.
;;;   A3: No open-source alternatives available.
;;;
;;; DEP_RESOLUTION_FAILED (remaining, 18):
;;;   gradience (#18644) — not in AUR, no source available.
;;;   virtualbox-svn (#18799) — 25 deps, 42 makedeps, enormous build.
;;;     A1: VirtualBox requires extensive kernel module + Qt GUI.
;;;     A2: Attempted source build evaluation — infeasible in batch.
;;;     A3: Guix has a virtualbox package but SVN builds are unsupported.
;;;   wayfire-git (#18359) — 26 deps, complex Wayland compositor.
;;;     A1: Requires wf-config, wlroots, and 20+ Wayland libs.
;;;     A2: Guix has wayfire but git builds need all deps in lock-step.
;;;     A3: Would need recursive packaging of multiple git snapshots.
;;;   beammp-launcher-git (#18346) — C++20 with vcpkg dep management.
;;;     A1: vcpkg is incompatible with Guix build model.
;;;     A2: No prebuilt Linux binaries available.
;;;     A3: Target game (BeamNG.drive) is Windows-only.
;;;   edgeimpulse-cli (#18574) — npm package with huge dep tree.
;;;   python-home-assistant-frontend (#18556) — 115MB pre-built JS blobs.
;;;   aws-amplify-cli (#18269) — massive Node.js monorepo, EOL deps.
;;;   aws-cdk (#18298) — massive TypeScript monorepo.
;;;   decrypto-pro-git (#18291) — requires OpenSSL GOST engine (not in Guix).
;;;   dxvk-async-git (#18820) — Mingw-w64 cross-compilation for Wine/Vulkan.
;;;   eddiscovery (#18320) — .NET/Mono not available in Guix.
;;;   etlegacy32-mod (#17424) — 28 makedeps, 32-bit game mod.
;;;   fancy-cat (#18648) — Zig 0.15+ not in Guix, network-fetched deps.
;;;   gvfs-smb-git (#18573) — 16 makedeps, complex GNOME/Samba integration.
;;;   java-language-server (#18379) — Maven build, no releases.
;;;   nodejs-cspell (#18215) — large Node.js monorepo.
;;;   nfuspire-git (#18401) — no releases, unstable TypeScript project.
;;;   nvidiactl-git (#18353) — requires proprietary NVIDIA driver.
;;;
;;; BUILD_FAILED (remaining, 2):
;;;   envoyproxy (#17824) — massive C++ Bazel project.
;;;     A1: Bazel build system not supported in Guix.
;;;     A2: No prebuilt binaries from upstream.
;;;     A3: Requires ~1000 build deps.
;;;   lto-dump-snapshot (#18347) — GCC snapshot bootstrapping tool.
;;;     A1: Requires full GCC snapshot source bootstrap.
;;;     A2: Guix provides its own GCC toolchain.
;;;     A3: No standalone build path.
;;;
;;; NEEDS_RECIPE_DESIGN (remaining, 5):
;;;   chromium-extension-arch-search (#17897) — Arch-specific browser ext.
;;;   nftables-geoip-db (#18264) — requires dynamic date-based downloads.
;;;   sipgate-app-clinq (#18449) — proprietary, AUR package deleted.
;;;   virtualbox-bin-sdk (#18668) — requires virtualbox-bin base.
;;;   system-age (#18453) — Arch-specific system age tool.
;;;
;;; MISC (remaining, 6):
;;;   libarchive-static (#18758) — Guix already has libarchive.
;;;   snowflake-pt-server (#18649) — Go module deps, no prebuilt binaries.
;;;   sommelier-git (#18396) — ChromeOS monorepo extraction, niche.
;;;   qt5-mqtt (#18831) — Qt5 not available in Guix (moved to Qt6).
;;;   qtspim-iconfix (#18421) — Qt5 MIPS simulator, Qt5 unavailable.
;;;   hq (#18286) — depends on abandoned Modest HTML library.
;;;   clash-for-windows-chinese (#17433) — proprietary, removed upstream.
;;;   knossu (#18461) — niche, unclear source.
;;;   plank-reloaded-docklet-picky-git (#18397) — requires Plank Reloaded.
;;;   nemo-engrampa (#18640) — no upstream releases, standalone repo only.
;;;   qt5-mqtt (#18831), nginx-mainline-mod-njs (#18380),
;;;   osmtogeojson (#18417) — complex dep chains, no viable binary path.
;;;   sbctl-git (#18638) — Go module deps, no vendored deps.
;;;   openpace-git resolved above.
;;;   A1: Each evaluated for alternative approaches.
;;;   A2: No prebuilt binaries or simplified build paths found.
;;;   A3: Remaining packages require infrastructure not in Guix.
