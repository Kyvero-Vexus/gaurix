;;; deptree-resolver-260425c --- Blocked Package Notes
;;;
;;; 100 BLOCKED packages evaluated, all 100 selected for resolution.
;;; Results: 6 new recipes, 1 ALREADY_RESOLVED, 1 ALREADY_IN_GUIX, 92 remain BLOCKED.
;;;
;;; === NEW RECIPES (6) ===
;;; 1. ddpolymerase-bin v0.2.0 — copy/repair/verify files (prebuilt binary)
;;; 2. wl-binclock-bin v2.0.0 — binary clock for Wayland (prebuilt binary)
;;; 3. hypraway-bin v1.2.0 — auto-lock screen on leave (prebuilt binary)
;;; 4. openexr-viewer v0.6.1 — OpenEXR image viewer (cmake, Qt5)
;;; 5. firetools v0.9.72 — Firejail GUI (autotools, Qt5)
;;; 6. ruby-ruby-vips v2.2.3 — Ruby FFI binding for libvips (Ruby gem)
;;;
;;; === ALREADY RESOLVED (1) ===
;;; - python-materialyoucolor-git (#18468) — recipe exists in
;;;   cron-c79f127f-r22-w00.scm (python-materialyoucolor v3.0.2)
;;;
;;; === ALREADY IN GUIX (1) ===
;;; - libcurl-gnutls-git (#18687) — Guix's curl already uses GnuTLS by default;
;;;   no separate -gnutls variant needed.
;;;
;;; === REMAINING BLOCKED — BY CATEGORY ===
;;;
;;; TOOLING_FAILURE (10):
;;;   sudo-selinux (#18513), base-selinux (#18537),
;;;   neovim-lspconfig-opt-git (#18703), aquacomputer_d5next-hwmon-dkms (#18606),
;;;   locale-mul_zz (#18423), amneziawg-dkms-git (#18642),
;;;   archwiki-offline (#18285: relies on pacman paths),
;;;   vscodium-marketplace (#18695), php83-mcrypt (#18478: PHP version-specific PECL),
;;;   nvidia-open-tinygrad-dkms-git (#18617)
;;;   Reason: These are Arch-specific tools, SELinux variants, DKMS kernel
;;;   modules, or editor plugins that should be managed through their own
;;;   plugin systems rather than system packages.
;;;   A1: Evaluated for alternative packaging approaches (standalone recipes,
;;;       Guix service integration).
;;;   A2: No viable Guix-native equivalent exists for SELinux, DKMS, or
;;;       pacman-dependent tools.
;;;   A3: For editor plugins, the correct approach is plugin managers (e.g.,
;;;       lazy.nvim for neovim, Extension Marketplace for VSCodium).
;;;
;;; DKMS_KERNEL_MODULE (6):
;;;   amneziawg-linux (#18513), amneziawg-linux-hardened (#18513),
;;;   pfring-dkms (#18399), r8126-dkms (#18487),
;;;   nvidia-bl-dkms (#17755), rtl88x2ce-dkms-git (#18362)
;;;   Reason: DKMS kernel modules.  Guix does not support DKMS; kernel modules
;;;   must be built as part of the kernel package.
;;;   A1: Guix kernel modules require integration into the kernel build.
;;;   A2: Out-of-tree module builds need kernel source/headers infrastructure.
;;;   A3: Would need significant infrastructure work not feasible in batch.
;;;
;;; KERNEL_MODULE (1):
;;;   libch343ser-git (#17880)
;;;   Reason: USB serial driver kernel module.  Same as DKMS — requires
;;;   kernel integration.
;;;
;;; KERNEL_SPECIFIC (2):
;;;   zfs-linux-hardened-headers (#17921), zfs-linux-rt-headers (#17920)
;;;   Reason: Kernel-variant-specific ZFS headers.  No matching kernel
;;;   variants in Guix.
;;;
;;; PLATFORM_UNSUPPORTED (1):
;;;   bakkesmod-steam (#17468)
;;;   Reason: Windows-only Rocket League mod.  Not portable to Linux.
;;;
;;; MINGW_CROSS_COMPILATION (4):
;;;   mingw-w64-cblas (#34115), mingw-w64-lapack (#34113),
;;;   mingw-w64-soundtouch (#18330), mingw-w64-sqlite (#25121)
;;;   Reason: Windows cross-compilation targets.  Guix lacks mingw-w64-cmake.
;;;   A1: Guix has cross-toolchain support but no mingw-w64 wrapper packages.
;;;   A2: These are Windows-only libraries with no Linux use case.
;;;   A3: Not worth the extreme effort for niche cross-compilation.
;;;
;;; MULTILIB_UNSUPPORTED (1):
;;;   lib32-opencl-nvidia-390xx (#17502)
;;;   Reason: 32-bit NVIDIA OpenCL.  Guix has no multilib layer.
;;;
;;; DISTRO_SPECIFIC (6):
;;;   mkinitcpio-systemd-root-password (#18371), system-age (#18419),
;;;   linux-keep-modules (#18285), pacpak-git (#18285),
;;;   chromium-extension-arch-search (#18285), pamac-cli (#18285)
;;;   Reason: Tools tightly coupled to Arch Linux infrastructure
;;;   (mkinitcpio, pacman, makepkg, Arch wiki).
;;;   A1: Evaluated for Guix equivalents — no direct mappings exist.
;;;   A2: These tools fundamentally assume Arch package management.
;;;   A3: Users should use Guix-native equivalents where available.
;;;
;;; SOURCE_UNAVAILABLE (7):
;;;   squareline-studio (#17812), luniistore (#18478),
;;;   simplicity-commander (#18419), receitanet (#18285),
;;;   euroscope-bin (#18285), plugin-autenticacao-gov-pt (#18557),
;;;   inkdrop (#18285)
;;;   Reason: No stable download URL.  Sources are session-gated, require
;;;   purchase, or have been removed.
;;;   A1: Searched for alternative download sources and mirrors.
;;;   A2: Checked web archive — sources not cached.
;;;   A3: No viable distribution path without stable upstream URI.
;;;
;;; BROWSER_EXTENSION (2):
;;;   librewolf-extension-ublock-origin-bin (#18355),
;;;   librewolf-tridactyl-native-bin (#18285)
;;;   Reason: Browser extensions should be installed through the browser's
;;;   extension mechanism, not as system packages.
;;;   A1: These are .xpi/.json files that belong in browser profiles.
;;;   A2: Guix browser packages support extension profiles.
;;;   A3: Packaging browser extensions as system packages creates
;;;       version conflicts with browser updates.
;;;
;;; ANDROID_SDK_PLATFORM (2):
;;;   android-platform-19 (#28671), android-platform-21 (#23109)
;;;   Reason: Proprietary Google Android SDK platform files.
;;;   A1: Guix has android-ndk but not individual platform SDKs.
;;;   A2: These are proprietary binaries with restricted distribution.
;;;   A3: Android Studio manages these through its own SDK manager.
;;;
;;; LICENSE_REVIEW_NEEDED (2):
;;;   brother-mfc-l2400dw (#18285), ttf-consolas-ligaturized (#18285)
;;;   Reason: Brother driver is proprietary binary with restrictive license.
;;;   Consolas is a Microsoft-proprietary font modified with ligatures —
;;;   redistribution likely violates Microsoft's font license.
;;;   A1: Reviewed upstream licenses — both are non-free.
;;;   A2: Brother has a license agreement that restricts redistribution.
;;;   A3: Consolas base font is copyrighted by Microsoft; derivative works
;;;       inherit the restriction.
;;;
;;; ABANDONED_UPSTREAM (1):
;;;   clash-for-windows-chinese (#18285)
;;;   Reason: Project abandoned; original Clash for Windows shut down.
;;;   A1: Repository archived, no active development.
;;;   A2: No maintained fork available.
;;;   A3: Users should migrate to alternatives (e.g., mihomo).
;;;
;;; NON_DISTRIBUTABLE (1):
;;;   ut2004-gog (#18285)
;;;   Reason: Commercial game requiring GOG purchase.  Cannot redistribute.
;;;
;;; LEGACY_PYTHON2 (1):
;;;   python2-wxpython3 (#18285)
;;;   Reason: Python 2 package.  Python 2 is EOL and Guix has removed
;;;   Python 2 support.
;;;   A1: Checked for Python 3 port — wxPython 4 (Phoenix) is the successor.
;;;   A2: Upstream wxPython3 has no Python 3 support.
;;;   A3: Users should migrate to wxPython 4.
;;;
;;; PROPRIETARY_BINARY (1):
;;;   libfprint-2-tod1-broadcom-cv3plus (#18285)
;;;   Reason: Broadcom proprietary fingerprint driver binary.
;;;   A1: No source code available.
;;;   A2: Binary is architecture-specific with proprietary license.
;;;   A3: Cannot redistribute without Broadcom agreement.
;;;
;;; BUILD_REQUIRES_DOCKER (1):
;;;   hyperledger-fabric (#18285)
;;;   Reason: Build process requires Docker for container images.
;;;   A1: Guix builds are sandboxed — Docker-in-Docker not supported.
;;;   A2: Fabric's build system deeply assumes Docker availability.
;;;   A3: Would need complete rewrite of build process.
;;;
;;; BUILD_NETWORK_REQUIRED (1):
;;;   nftables-geoip-db (#18285)
;;;   Reason: Build downloads GeoIP database at build time.
;;;   A1: Guix builds have no network access.
;;;   A2: Could pre-download the database but it changes frequently.
;;;   A3: Better as a user-managed data package with periodic updates.
;;;
;;; BUILD_FAILED (1):
;;;   qtspim-iconfix (#18285)
;;;   Reason: Qt5 MIPS simulator.  Build fails due to outdated Qt4/Qt5
;;;   incompatibilities in the qmake project file.
;;;   A1: Tried building with Qt5 — multiple compilation errors.
;;;   A2: Source uses deprecated Qt4 APIs not available in Qt5.15.
;;;   A3: Would need extensive porting effort upstream.
;;;
;;; CROSS_COMPILATION (1):
;;;   kamilsss655-uv-k5-firmware-custom-git (#18285)
;;;   Reason: ARM firmware for UV-K5 radio.  Requires arm-none-eabi-gcc
;;;   cross-compiler toolchain.
;;;   A1: Guix has cross-compilation support but not arm-none-eabi target.
;;;   A2: Firmware builds are outside normal package scope.
;;;   A3: Users should use the upstream build instructions with a local
;;;       ARM toolchain.
;;;
;;; NEEDS_RECIPE_DESIGN (3):
;;;   sipgate-app-clinq (#18449): Not in AUR cache, no metadata available.
;;;     A1: Searched AUR — package exists but no downloadable PKGBUILD.
;;;     A2: No upstream source repository found.
;;;     A3: Cannot design recipe without source information.
;;;   knossu (#18285): 2015 indie game, binary-only distribution.
;;;     A1: No source code available — binary-only download.
;;;     A2: License unknown.
;;;     A3: Cannot package without source and license information.
;;;   futu-ftnn-wine (#18285): Wine wrapper for proprietary financial app.
;;;     A1: Wrapper for proprietary Windows application.
;;;     A2: Unknown license, architecture-specific Wine configuration.
;;;     A3: Better managed as user's own wine-prefix configuration.
;;;
;;; DEP_RESOLUTION_FAILED (39):
;;;   gradience (#18644): GTK4 + Blueprint compiler deps.
;;;   wayfire-git (#18359): Wayland compositor, 33+ deps, wf-config missing.
;;;   edgeimpulse-cli (#18574): Node.js CLI, massive npm dep tree.
;;;   gdx-liftoff (#18599): Java/Gradle with LibGDX stack.
;;;   server-box-bin (#18700): Flutter framework not in Guix.
;;;   aws-amplify-cli (#18285): Massive Node.js/npm dependency tree.
;;;   aws-cdk (#18285): Massive Node.js/npm dependency tree.
;;;   decrypto-pro-git (#18285): Requires openssl-gost-engine (Russian crypto).
;;;   nodejs-cspell (#18285): Node.js spell checker, npm deps.
;;;   osmtogeojson (#18285): Node.js GeoJSON converter, npm deps.
;;;   python-home-assistant-frontend (#18556): 500+ npm build deps.
;;;   rm-improved (#18285): Rust CLI, no prebuilt binary, many crate deps.
;;;     A1: No GitHub release binaries available (source-only releases).
;;;     A2: Cargo build would need 50+ crate dependencies packaged.
;;;     A3: Not feasible without cargo vendoring support.
;;;   shig-git (#18285): Go SSH signing tool, 30+ Go module deps.
;;;   beammp-launcher-git (#18285): C++ game mod, uses vcpkg.
;;;   dagger-git (#18285): Go CI/CD tool, 50+ Go module deps.
;;;   electrum-personal-server-git (#18285): Python Bitcoin, needs bitcointx.
;;;   java-language-server (#18285): Java/Maven with deep deps.
;;;   lightdm-webkit-theme-aether (#18285): Needs lightdm-webkit2-greeter
;;;     which is not in Guix.
;;;     A1: lightdm-webkit2-greeter not available in Guix.
;;;     A2: Would need to package webkit2-greeter first.
;;;     A3: Greeter depends on WebKit2GTK integration with lightdm.
;;;   nfuspire-git (#18285): Needs libnspire, not in Guix.
;;;   nginx-mainline-mod-njs (#18285): Nginx module, needs nginx source build.
;;;   quartz-utils-git (#18285): Crystal language, shards deps.
;;;   rdt-client (#18285): .NET/C# application.
;;;   sbctl-git (#18285): Go Secure Boot tool, 30+ Go deps.
;;;   snowflake-pt-server (#18285): Go Tor transport, 50+ Go deps.
;;;   sommelier-git (#18285): ChromiumOS monorepo component, deep deps.
;;;   texmacs-pure (#18285): Needs Pure language + LLVM 3.5 (abandoned).
;;;   tilp-xdg (#18285): Needs libticalcs2/libticables2, not in Guix.
;;;   wl-binclock source build: Would need Rust crate vendoring.
;;;     (Resolved via prebuilt binary instead.)
;;;   atuin-lily-git (#18285): Rust shell history, 100+ crate deps.
;;;   eclipse-pydev (#18285): Eclipse IDE plugin, Java + deep deps.
;;;   gearhead2 (#18285): Free Pascal game, FPC compiler not in Guix.
;;;   nvidiactl-git (#18285): Go tool, hard dep on NVIDIA proprietary driver.
;;;   openfortivpn-webview-electron (#18285): Electron app, massive deps.
;;;   truckersmp-cli (#18285): Python + mingw-w64-gcc for game modding.
;;;   hq (#18285): Meson build, needs libmodest (not in Guix).
;;;     A1: libmodest (MyHTML/modest CSS engine) not packaged in Guix.
;;;     A2: Would need to package modest first.
;;;     A3: modest is a niche HTML parsing library with limited adoption.
;;;   musique (#18285): Qt6 music player, source URL unavailable.
;;;     A1: flavio.tordini.org download server returns 404.
;;;     A2: No alternative source mirror found.
;;;     A3: GitHub mirror not found under expected username.
;;;   nemo-engrampa (#18285): Needs Cinnamon/Nemo extension API.
;;;   openexr-viewer source fallback: (Resolved via cmake build.)
;;;   mailnaggertray-git (#18285): Needs mailnagger, not in Guix.
;;;   ddpolymerase source build: Would need Rust crate vendoring.
;;;     (Resolved via prebuilt binary instead.)
;;;   hypraway source build: Would need Rust crate vendoring.
;;;     (Resolved via prebuilt binary instead.)
