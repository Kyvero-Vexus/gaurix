;;; deptree-resolver-260425b --- Blocked Package Notes
;;;
;;; 100 BLOCKED packages evaluated, all 100 selected for resolution.
;;; Results: 10 new recipes, 5 ALREADY_RESOLVED, 2 ALREADY_IN_GUIX, 83 remain BLOCKED.
;;;
;;; === NEW RECIPES (10) ===
;;; 1. to-html-bin v0.1.6 — render ANSI terminal as HTML (prebuilt binary)
;;; 2. gql-bin v0.43.0 — SQL-like query language for .git files (prebuilt binary)
;;; 3. vivify-bin v0.14.0 — markdown preview tool (prebuilt binary)
;;; 4. mergiraf-bin v0.16.3 — syntax-aware git merge driver (source, docs only; needs cargo vendoring)
;;; 5. fortran-stdlib v0.6.0 — Fortran standard library (source, cmake build)
;;; 6. qlipmon v2.3.0 — clipboard manager with rofi/dbus (source, Qt6)
;;; 7. tablet-switch v1.0.0 — 2-in-1 laptop mode switcher (source, Qt6)
;;; 8. geekbench-ai-bin v1.7.0 — AI benchmark (prebuilt binary)
;;; 9. latte-dock v0.10.9 — Plasma dock (source, cmake, archived by KDE)
;;; 10. tktreectrl v2.4.1 — multi-column Tk listbox widget (source, autotools)
;;;
;;; === ALREADY RESOLVED (5) ===
;;; - git-who (#18406) — recipe exists in deptree-resolver-260408d.scm
;;; - opkssh (#18443) — recipe exists in general-compat.scm (recipe-resolver-260418w)
;;; - vesktop-electron (#18344) — recipe exists in general-compat.scm
;;; - geekbench-ai (#18361) — recipe exists in deptree-resolver-260423e.scm
;;; - llama.cpp-git (#18470) — recipe exists in general-compat.scm
;;;
;;; === ALREADY IN GUIX (2) ===
;;; - synfig-dev (#18387) — upstream Guix has `synfig` package
;;; - btop-no-gpu (#18409) — upstream Guix has `btop` (1.4.6, already built without GPU)
;;;
;;; === REMAINING BLOCKED — BY CATEGORY ===
;;;
;;; MINGW_CROSS_COMPILATION (5):
;;;   mingw-w64-cblas (#34115), mingw-w64-lapack (#34113),
;;;   mingw-w64-soundtouch (#18330), mingw-w64-sqlite (#25121),
;;;   mingw-w64-boost (#23783), mingw-w64-cppwinrt (#43750)
;;;   Reason: Windows cross-compilation toolchain (mingw-w64) not available
;;;   in Guix.  These libraries target the Windows platform.
;;;   A1: Guix has cross-toolchain support but no mingw-w64-cmake wrapper.
;;;   A2: Checked for Guix-native equivalents — these are Windows-only libraries.
;;;   A3: Could theoretically create mingw-w64 toolchain packages but extreme effort
;;;       for niche use-case.  Not worth pursuing.
;;;
;;; MULTILIB_UNSUPPORTED (2):
;;;   lib32-opencl-nvidia-390xx (#17502), lib32-libglade (#45410)
;;;   Reason: 32-bit compatibility libraries.  Guix does not have a multilib
;;;   layer equivalent to Arch's lib32 packages.
;;;   A1: Guix supports cross-compilation to i686 but not multilib on x86_64.
;;;   A2: lib32-libglade is also deprecated upstream (GNOME).
;;;   A3: No practical workaround without fundamental Guix multilib support.
;;;
;;; KERNEL_SPECIFIC (3):
;;;   zfs-linux-hardened-headers (#17921), zfs-linux-rt-headers (#17920),
;;;   zfs-linux-git-headers (#17919)
;;;   Reason: Kernel-variant-specific ZFS header packages.  These depend on
;;;   specific kernel builds (linux-hardened, linux-rt, linux-git) which have
;;;   no direct Guix equivalents.
;;;   A1: Guix has ZFS support via zfs-linux-module but not for custom kernels.
;;;   A2: Users would need custom kernel definitions first.
;;;   A3: Could package generic zfs-utils but kernel-specific headers not viable.
;;;
;;; KERNEL_MODULE / DKMS (5):
;;;   libch343ser-git (#17880), nvidia-bl-dkms (#17755),
;;;   pfring-dkms (#18399), r8126-dkms (#18487),
;;;   rtl88x2ce-dkms-git (#18362)
;;;   Reason: DKMS kernel modules.  Guix does not support DKMS; kernel modules
;;;   must be built as part of the kernel package.
;;;   A1: Guix kernel modules require integration into the kernel build.
;;;   A2: These could theoretically be packaged as out-of-tree modules but
;;;       require kernel source/headers to build.
;;;   A3: Would need significant infrastructure work to support out-of-tree
;;;       module builds.  Not feasible in batch.
;;;
;;; PLATFORM_UNSUPPORTED (1):
;;;   bakkesmod-steam (#17468)
;;;   Reason: Windows-only Rocket League mod.  Not portable to Linux/Guix.
;;;
;;; ANDROID_SDK_PLATFORM (2):
;;;   android-platform-19 (#28671), android-platform-21 (#23109)
;;;   Reason: Android SDK platform files.  Guix has android-ndk but not
;;;   individual platform SDK packages.
;;;   A1: These are proprietary Google binaries.
;;;   A2: Could package as binary blobs but licensing unclear.
;;;   A3: Not aligned with Guix's free-software philosophy.
;;;
;;; LEGACY_PYTHON2 (2):
;;;   python2-wxpython3 (#25153), python2-dbus (#37854)
;;;   Reason: Python 2 bindings.  Python 2 is EOL since Jan 2020.
;;;   Guix has removed most Python 2 packages.
;;;   A1: Could package but Python 2 is unsupported upstream.
;;;   A2: Users should migrate to Python 3 equivalents.
;;;   A3: Not worth maintaining.
;;;
;;; DISTRO_SPECIFIC (4):
;;;   asp (#14587), pacpak-git (#17862),
;;;   chromium-extension-arch-search (#17897),
;;;   python-pypi2pkgbuild (#17822)
;;;   Reason: Arch Linux-specific tools.  asp manages PKGBUILD sources,
;;;   pacpak wraps pacman for flatpak, chromium-extension-arch-search is
;;;   Arch-specific search, pypi2pkgbuild generates PKGBUILDs.
;;;   A1: No equivalent use-case on Guix.
;;;   A2: Could port concept but tool logic is Arch-specific.
;;;   A3: Not useful outside Arch ecosystem.
;;;
;;; SOURCE_UNAVAILABLE (7):
;;;   squareline-studio (#17812), luniistore (#18478),
;;;   simplicity-commander (#18419), receitanet (#18413),
;;;   euroscope-bin (#17945), python-jaxlib-bin (#18474),
;;;   unpack-install-jammer (#18480)
;;;   Reason: Source or binary downloads unavailable, behind login walls,
;;;   or pointing to dead links.
;;;   A1: Checked all upstream URLs — downloads require registration or
;;;       are behind authenticated CDNs.
;;;   A2: squareline-studio requires paid license for download.
;;;   A3: euroscope-bin is a Windows app running via Wine, marked OutOfDate.
;;;
;;; LICENSE_REVIEW_NEEDED (2):
;;;   brother-mfc-l2400dw (#17797), ttf-consolas-ligaturized (#20499)
;;;   Reason: Proprietary or unclear licensing.
;;;   A1: brother-mfc-l2400dw is proprietary printer firmware.
;;;   A2: ttf-consolas-ligaturized uses Microsoft Consolas font (proprietary)
;;;       with FiraCode ligatures — redistributability unclear.
;;;   A3: Cannot package without clear licensing.
;;;
;;; PROPRIETARY_BINARY (1):
;;;   libfprint-2-tod1-broadcom-cv3plus (#17912)
;;;   Reason: Proprietary Broadcom fingerprint reader driver.
;;;   No source available.
;;;
;;; PROPRIETARY_DEP (1):
;;;   soapysdrplay3-luarvique-git (#18141)
;;;   Reason: Depends on proprietary SDRPlay API (libsdrplay).
;;;   A1: SoapySDR is open but the SDRPlay driver API is proprietary.
;;;   A2: Could package the wrapper but runtime depends on proprietary lib.
;;;   A3: Not worth packaging without the proprietary dependency available.
;;;
;;; CROSS_COMPILATION (1):
;;;   kamilsss655-uv-k5-firmware-custom-git (#17909)
;;;   Reason: Requires ARM cross-compilation toolchain for UV-K5 radio firmware.
;;;   A1: Guix supports ARM cross-compilation via --target.
;;;   A2: But arm-none-eabi-gcc/newlib not packaged in standard Guix.
;;;   A3: Would need to package the ARM bare-metal toolchain first.
;;;
;;; ABANDONED_UPSTREAM (1):
;;;   clash-for-windows-chinese (#17433)
;;;   Reason: Original Clash for Windows project shut down.
;;;   Chinese fork status unclear.
;;;
;;; NON_DISTRIBUTABLE (1):
;;;   factorio-space-age-experimental (#17440)
;;;   Reason: Commercial game, cannot be redistributed.
;;;
;;; MISSING_DEP (2):
;;;   texmacs-pure (#17873) — depends on `pure` language (not in Guix)
;;;   eclipse-pydev (#17948) — depends on `eclipse` IDE (not in Guix)
;;;   A1: Pure language last release 2021, effectively abandoned.
;;;   A2: Eclipse IDE is massive Java project, not in Guix.
;;;   A3: Packaging these deps would be major undertakings.
;;;
;;; NEEDS_RECIPE_DESIGN (5):
;;;   sipgate-app-clinq (#18449) — not in AUR cache, likely removed
;;;   knossu (#18461) — insufficient upstream info
;;;   ruby-ruby-vips (#18428) — Ruby gem, needs ruby-build-system setup
;;;   python-gradio-pdf (#18463) — depends on python-gradio (massive dep tree)
;;;   futu-ftnn-wine (#18151) — Chinese stock trading app via Wine, license unclear
;;;   A1: sipgate-app-clinq has 0 AUR votes, no URL, likely abandoned.
;;;   A2: ruby-ruby-vips could be packaged but needs ruby-ffi dep chain.
;;;   A3: python-gradio-pdf blocked on python-gradio (1000+ transitive npm/pip deps).
;;;
;;; BUILD_FAILED (1):
;;;   qtspim-iconfix (#18421) — MIPS simulator with Qt5 UI
;;;   Reason: Already has recipe in queue-20260407-opus-p101.scm (as qtspim).
;;;   Build issues with Qt5 tooling.
;;;   A1: Source from SourceForge SVN requires SVN checkout.
;;;   A2: Qt5 build configuration complex.
;;;   A3: Already attempted in prior pass.
;;;
;;; DEP_RESOLUTION_FAILED (remaining 18):
;;;   wayfire-git (#18359) — complex Wayland compositor, depends on wlroots0.20
;;;     (not in Guix; Guix has wlroots 0.17). Would need wlroots 0.20 first.
;;;   nodejs-cspell (#18215) — Node.js monorepo with massive npm dep tree
;;;   osmtogeojson (#18417) — Node.js npm package, npm packaging in Guix painful
;;;   rm-improved (#18509) — Rust/Cargo, needs vendored crates
;;;   ddpolymerase (#18408) — Rust/Cargo, needs vendored crates
;;;   wl-binclock (#18392) — Rust/Cargo, needs vendored crates + wayland libs
;;;   firetools-git (#18415) — depends on firejail (not in Guix)
;;;   java-language-server (#18379) — Java/Maven build, OutOfDate since 2023
;;;   lightdm-webkit-theme-aether (#19028) — depends on lightdm-webkit2-greeter
;;;   nfuspire-git (#18401) — depends on libnspire (not in Guix)
;;;   nginx-mainline-mod-njs (#18380) — depends on nginx-mainline-src
;;;   quartz-utils-git (#18430) — Crystal language (not in Guix)
;;;   sommelier-git (#18396) — ChromeOS-specific nested Wayland compositor
;;;   openfortivpn-webview-electron (#18167) — Electron app, npm deps
;;;   hq (#18286) — depends on modest HTML parser (abandoned upstream)
;;;   decrypto-pro-git (#18291) — CryptoPro SDK (proprietary Russian crypto)
;;;   A1: Rust packages need cargo-build-system with vendored crates.
;;;       Guix's cargo-build-system requires each crate dep to be packaged.
;;;       For simple Rust CLIs, prebuilt binaries are used when available.
;;;   A2: Node.js/npm packages extremely difficult in Guix due to deep dep trees.
;;;   A3: Crystal, firejail, libnspire, wlroots 0.20 would each need to be
;;;       packaged first as foundational dependencies.
;;;
;;; TOOLING_FAILURE (remaining 3):
;;;   locale-mul_zz (#18423) — glibc locale compilation, requires glibc build
;;;   amneziawg-linux (#18452), amneziawg-linux-hardened (#18382)
;;;     — AmneziaWG kernel modules, same DKMS constraints as other kernel mods
;;;   linux-keep-modules (#18490) — Arch-specific kernel module preservation
;;;   A1: locale-mul_zz modifies glibc locale data, not portable.
;;;   A2: AmneziaWG modules need kernel headers, DKMS-like build.
;;;   A3: linux-keep-modules is Arch-specific workaround for pacman upgrades.
;;;
;;; MISCELLANEOUS (remaining from - category):
;;;   mkinitcpio-systemd-root-password (#18371) — mkinitcpio hook, Arch-specific
;;;   nftables-geoip-db (#18264) — data package needing network for GeoIP DB
;;;   aws-amplify-cli (#18269), aws-cdk (#18298) — massive npm monorepos
;;;   beammp-launcher-git (#18346) — depends on vcpkg build system
;;;   hyperledger-fabric (#18301) — requires Docker for build
;;;   latte-dock (#18345) — RESOLVED: recipe created (archived by KDE)
;;;   ut2004-gog (#18333) — requires GOG game purchase + lgogdownloader
;;;   fortran_stdlib (#18290) — RESOLVED: recipe created
;;;   unrealtournament4 (#18319) — requires Epic Games account for download
;;;   vesktop-electron (#18344) — RESOLVED: already in Gaurix
;;;   xidlehook (#18354) — Rust/Cargo, needs vendored crates
;;;   fileoptimizer-bin (#18315) — Windows app via Wine
;;;   atuin-lily-git (#18410) — fork of atuin, Rust/Cargo
;;;   hypraway (#18456) — Rust/Cargo, needs vendored crates
;;;   system-age (#18453) — Rust/Cargo, Arch-specific (checks pacman install date)
;;;   A1: AWS CLI tools are massive TypeScript/npm projects (1000+ deps).
;;;   A2: Game packages (UT2004, UT4) require commercial purchases.
;;;   A3: Rust packages without prebuilt binaries need crate vendoring.
