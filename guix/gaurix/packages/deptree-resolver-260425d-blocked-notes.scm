;;; deptree-resolver-260425d --- Blocked Package Notes
;;;
;;; 100 BLOCKED packages evaluated, all 100 selected for resolution.
;;; Results: 5 new recipes, 0 ALREADY_RESOLVED, 0 ALREADY_IN_GUIX, 95 remain BLOCKED.
;;;
;;; === NEW RECIPES (5) ===
;;; 1. server-box-bin v1.0.1365 — server monitoring Flutter AppImage
;;; 2. dagger-bin v0.20.6 — CI/CD pipeline engine (prebuilt Go binary)
;;; 3. rip2-bin v0.9.6 — safe rm alternative (prebuilt Rust binary, musl)
;;; 4. smtube v21.10.0 — YouTube browser for SMPlayer (Qt5/qmake source build)
;;; 5. electrum-personal-server v0.2.4 — Bitcoin Electrum server (Python)
;;;
;;; === NOTES ON RESOLUTIONS ===
;;; - server-box-bin: Was DEP_RESOLUTION_FAILED due to Flutter framework
;;;   not being in Guix.  Resolved via AppImage binary.
;;; - dagger-git: Was DEP_RESOLUTION_FAILED due to 50+ Go module deps.
;;;   Resolved via prebuilt binary from GitHub releases.
;;; - rm-improved: Was DEP_RESOLUTION_FAILED due to 50+ Rust crate deps.
;;;   Resolved via rip2-bin prebuilt binary (musl, statically linked).
;;;   rip2 is the actively maintained successor of the original rip.
;;; - smtube: Was SOURCE_UNAVAILABLE (smtube.org 404).  Source IS available
;;;   on GitHub at smplayer-dev/smtube.  Qt5/qmake build is straightforward.
;;; - electrum-personal-server-git: Was DEP_RESOLUTION_FAILED citing need
;;;   for python-bitcointx.  Re-evaluation found NO external Python deps —
;;;   uses only Python stdlib for Bitcoin Core JSON-RPC communication.
;;;
;;; === REMAINING BLOCKED — BY CATEGORY ===
;;;
;;; TOOLING_FAILURE (10):
;;;   sudo-selinux (#18513), base-selinux (#18537),
;;;   neovim-lspconfig-opt-git (#18703), aquacomputer_d5next-hwmon-dkms (#18606),
;;;   locale-mul_zz (#18423), amneziawg-dkms-git (#18642),
;;;   archwiki-offline (#18285), vscodium-marketplace (#18695),
;;;   php83-mcrypt (#18478), nvidia-open-tinygrad-dkms-git (#18617)
;;;   Reason: Arch-specific tools, SELinux variants, DKMS kernel modules,
;;;   or editor plugins that belong in their own plugin systems.
;;;   A1: Evaluated for standalone Guix recipes — no viable path.
;;;   A2: SELinux requires Guix-level integration not available.
;;;   A3: Editor plugins should use native plugin managers.
;;;
;;; DKMS_KERNEL_MODULE (6):
;;;   amneziawg-linux (#18452), amneziawg-linux-hardened (#18452),
;;;   pfring-dkms (#18399), r8126-dkms (#18487),
;;;   nvidia-bl-dkms (#17755), rtl88x2ce-dkms-git (#18362)
;;;   Reason: DKMS kernel modules require kernel integration in Guix.
;;;   A1: Guix kernel modules must be built as part of the kernel.
;;;   A2: Out-of-tree modules need kernel source/headers infrastructure.
;;;   A3: Would need significant infrastructure work not feasible in batch.
;;;
;;; KERNEL_MODULE (1):
;;;   libch343ser-git (#17880)
;;;   Reason: USB serial driver — requires kernel integration.
;;;
;;; KERNEL_SPECIFIC (2):
;;;   zfs-linux-hardened-headers (#17921), zfs-linux-rt-headers (#17920)
;;;   Reason: No matching kernel variants in Guix.
;;;
;;; PLATFORM_UNSUPPORTED (1):
;;;   bakkesmod-steam (#17468)
;;;   Reason: Windows-only Rocket League mod.
;;;
;;; MINGW_CROSS_COMPILATION (4):
;;;   mingw-w64-cblas (#34115), mingw-w64-lapack (#34113),
;;;   mingw-w64-soundtouch (#18330), mingw-w64-sqlite (#25121)
;;;   Reason: Windows cross-compilation targets — no Linux use case.
;;;
;;; MULTILIB_UNSUPPORTED (1):
;;;   lib32-opencl-nvidia-390xx (#17502)
;;;   Reason: 32-bit NVIDIA OpenCL.  Guix has no multilib layer.
;;;
;;; DISTRO_SPECIFIC (7):
;;;   mkinitcpio-systemd-root-password (#18371), system-age (#18419),
;;;   linux-keep-modules (#18285), pacpak-git (#18285),
;;;   chromium-extension-arch-search (#18285), pamac-cli (#18285),
;;;   python-pypi2pkgbuild (#18285)
;;;   Reason: Tools tightly coupled to Arch Linux infrastructure.
;;;   A1: No Guix-native equivalents exist.
;;;   A2: These tools assume pacman/makepkg/mkinitcpio.
;;;   A3: python-pypi2pkgbuild converts PyPI→PKGBUILD, Arch-specific.
;;;
;;; SOURCE_UNAVAILABLE (8):
;;;   squareline-studio (#17812), luniistore (#18478),
;;;   simplicity-commander (#18419), receitanet (#18285),
;;;   euroscope-bin (#18285), plugin-autenticacao-gov-pt (#18557),
;;;   inkdrop (#18285), python-jaxlib-bin (#18285)
;;;   Reason: No stable download URL — session-gated, proprietary,
;;;   or removed.
;;;   A1: Searched for alternative sources and mirrors.
;;;   A2: Checked web archives — not cached.
;;;   A3: No viable distribution path.
;;;
;;; BROWSER_EXTENSION (2):
;;;   librewolf-extension-ublock-origin-bin (#18355),
;;;   librewolf-tridactyl-native-bin (#18285)
;;;   Reason: Should be installed via browser extension mechanism.
;;;
;;; ANDROID_SDK_PLATFORM (2):
;;;   android-platform-19 (#28671), android-platform-21 (#23109)
;;;   Reason: Proprietary Google Android SDK files.
;;;
;;; LICENSE_REVIEW_NEEDED (2):
;;;   brother-mfc-l2400dw (#18285), ttf-consolas-ligaturized (#18285)
;;;   Reason: Non-free/restricted licenses.
;;;
;;; ABANDONED_UPSTREAM (1):
;;;   clash-for-windows-chinese (#18285)
;;;   Reason: Project abandoned, repository archived.
;;;
;;; NON_DISTRIBUTABLE (2):
;;;   ut2004-gog (#18285), unrealtournament4 (#18285)
;;;   Reason: Commercial games requiring purchase.
;;;
;;; LEGACY_PYTHON2 (2):
;;;   python2-wxpython3 (#18285), python2-dbus (#18285)
;;;   Reason: Python 2 EOL, Guix removed Python 2 support.
;;;
;;; PROPRIETARY_BINARY (1):
;;;   libfprint-2-tod1-broadcom-cv3plus (#18285)
;;;   Reason: Broadcom proprietary fingerprint driver.
;;;
;;; BUILD_REQUIRES_DOCKER (1):
;;;   hyperledger-fabric (#18285)
;;;   Reason: Build process requires Docker — not supported in Guix.
;;;
;;; BUILD_NETWORK_REQUIRED (1):
;;;   nftables-geoip-db (#18285)
;;;   Reason: Build downloads GeoIP DB at build time — no network in Guix.
;;;
;;; BUILD_FAILED (1):
;;;   qtspim-iconfix (#18285)
;;;   Reason: Qt4/Qt5 API incompatibilities.  Source available on
;;;   SourceForge but uses deprecated Qt4 APIs.
;;;   A1: Tried Qt5 build — multiple compilation errors.
;;;   A2: Would need extensive porting from Qt4→Qt5 APIs.
;;;   A3: Latest v9.1.24 still uses qmake/Qt5 but SVN-only source.
;;;
;;; CROSS_COMPILATION (1):
;;;   kamilsss655-uv-k5-firmware-custom-git (#18285)
;;;   Reason: ARM firmware, needs arm-none-eabi-gcc.
;;;
;;; NEEDS_RECIPE_DESIGN (3):
;;;   sipgate-app-clinq (#18449): Not in AUR cache, no metadata.
;;;   knossu (#18285): Binary-only 2015 indie game, no source code.
;;;   futu-ftnn-wine (#18285): Wine wrapper for proprietary Windows app.
;;;
;;; PROPRIETARY_DEP (1):
;;;   soapysdrplay3-luarvique-git (#18285)
;;;   Reason: Depends on SDRplay proprietary library.
;;;
;;; NEEDS_RECIPE_DESIGN (1):
;;;   python-gradio-pdf (#18285)
;;;   Reason: Depends on python-gradio which has 500+ npm build deps.
;;;   A1: Evaluated direct pyproject build — requires gradio as dep.
;;;   A2: gradio has massive JavaScript build chain not feasible in Guix.
;;;   A3: No viable simplified approach.
;;;
;;; DEP_RESOLUTION_FAILED (33):
;;;   gradience (#18644): Archived project, GTK4 + Blueprint compiler deps.
;;;     A1: Project archived June 2024.
;;;     A2: Meson/Python build but needs Blueprint compiler not in Guix.
;;;     A3: Not worth packaging an archived project.
;;;   wayfire-git (#18359): Wayland compositor, 33+ deps, wf-config missing.
;;;   edgeimpulse-cli (#18574): Node.js CLI, massive npm dep tree.
;;;   gdx-liftoff (#18599): Java/Gradle with LibGDX stack.
;;;   aws-amplify-cli (#18285): Massive Node.js/npm dependency tree.
;;;   aws-cdk (#18285): Massive Node.js/npm dependency tree.
;;;   decrypto-pro-git (#18285): Requires openssl-gost-engine (Russian crypto).
;;;   nodejs-cspell (#18285): Node.js spell checker, npm deps.
;;;   osmtogeojson (#18285): Node.js GeoJSON converter, npm deps.
;;;   python-home-assistant-frontend (#18556): 500+ npm build deps.
;;;   shig-git (#18285): Go SSH signing tool, 30+ Go module deps.
;;;   beammp-launcher-git (#18285): C++ game mod, uses vcpkg.
;;;   lightdm-webkit-theme-aether (#18285): Needs lightdm-webkit2-greeter.
;;;   nfuspire-git (#18285): Needs libnspire, not in Guix.
;;;   nginx-mainline-mod-njs (#18285): Nginx module, needs nginx source build.
;;;   quartz-utils-git (#18285): Crystal language, shards deps.
;;;   rdt-client (#18285): .NET/C# application.
;;;   sbctl-git (#18285): Go Secure Boot tool, needs CGO + pcsclite,
;;;     no prebuilt binaries available (CI broken per release notes).
;;;   snowflake-pt-server (#18285): Go Tor transport, prebuilt binaries
;;;     behind auth wall.  Source build needs 50+ Go deps.
;;;   sommelier-git (#18285): ChromiumOS monorepo component.
;;;   texmacs-pure (#18285): Needs Pure language + LLVM 3.5 (abandoned).
;;;   tilp-xdg (#18285): Needs libticalcs2/libticables2 not in Guix.
;;;   atuin-lily-git (#18285): Fork repo does not exist on GitHub.
;;;     Upstream atuin has prebuilt binaries but this is a nonexistent fork.
;;;   eclipse-pydev (#18285): Eclipse IDE plugin, Java + deep deps.
;;;   gearhead2 (#18285): Free Pascal game, FPC compiler not in Guix.
;;;   nvidiactl-git (#18285): Go tool, hard dep on NVIDIA proprietary driver.
;;;   openfortivpn-webview-electron (#18285): Electron app, massive deps.
;;;   truckersmp-cli (#18285): Python + mingw-w64-gcc for game modding.
;;;   hq (#18285): Needs libmodest (not in Guix).
;;;   musique (#18285): Source on GitHub but requires git submodules
;;;     (qt-reusable-widgets, http, idle, js, etc.).  Tarball has empty
;;;     submodule dirs.  Would need git-fetch with recursive + hash.
;;;     A1: Found source at github.com/flaviotordini/musique.
;;;     A2: Tarball missing submodule contents (9 empty lib/ dirs).
;;;     A3: Would need recursive git checkout + submodule hash computation.
;;;   nemo-engrampa (#18285): Not in nemo-extensions repo despite AUR claim.
;;;     A1: Downloaded nemo-extensions 6.6.0 tarball — no engrampa dir.
;;;     A2: May be a custom AUR package patching nemo-fileroller for engrampa.
;;;     A3: Cannot determine source without AUR PKGBUILD access.
;;;   mailnaggertray-git (#18285): Needs mailnagger, not in Guix.
;;;   unpack-install-jammer (#18285): Perl script, but needs
;;;     perl-compress-raw-lzma which is not in Guix.
;;;     A1: Checked Guix Perl modules — 4 of 5 deps available.
;;;     A2: perl-compress-raw-lzma not packaged for Guix.
;;;     A3: Would need to package perl-compress-raw-lzma first.
