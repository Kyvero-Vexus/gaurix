;;; Blocked notes for deptree-resolver-260424n
;;; Timestamp: 2026-04-24T16:00:00+00:00
;;; 57 packages processed, 12 resolved, 45 remain BLOCKED
;;;
;;; === NEW RECIPES (4 resolved) ===
;;; grive (#19300): DONE: cmake-build-system recipe, GPL-2.0, Google Drive client with 4 patches.
;;; font-alibaba-puhuiti (#44962+#44963): DONE: font-build-system recipe, non-copyleft, from GitHub mirror.
;;;   → resolves both otf-alibaba-puhuiti and ttf-alibaba-puhuiti
;;; faba-mono-icons (#21538): DONE: copy-build-system recipe, GPL-3.0+, monochrome panel icons.
;;; illogical-impulse-oneui4-icons (#18595): DONE: copy-build-system recipe, GPL-3.0, OneUI4 icons.
;;;
;;; === ALREADY_IN_GUIX (4 resolved) ===
;;; arm-linux-gnueabihf-gdb (#17714): ALREADY_IN_GUIX: gdb-multiarch in (gnu packages gdb) supports all targets including ARM.
;;; guile-git-lib (#17802): ALREADY_IN_GUIX: guile-git v0.10.0 in (gnu packages guile); identical package.
;;; python-pocketsphinx (#21481): ALREADY_IN_GUIX: pocketsphinx v5.0.4 in (gnu packages speech); same upstream.
;;; electron25 (#32692): ALREADY_RESOLVED: electron25-bin recipe exists in (gaurix packages deptree-resolver-260415i);
;;;   compat alias electron25 defined in general-compat.scm.
;;;
;;; === ALREADY_RESOLVED (2 resolved) ===
;;; otf-alibaba-puhuiti (#44962): maps to font-alibaba-puhuiti (this pass).
;;; ttf-alibaba-puhuiti (#44963): maps to font-alibaba-puhuiti (this pass).
;;;
;;; === DUPLICATE (1 resolved) ===
;;; vmware-workstation (#11356): DUPLICATE of #1833; same AUR package.
;;;
;;; === REMAINING BLOCKED (45 packages) ===
;;;
;;; --- MINGW_CROSS_COMPILATION (8 packages) ---
;;; mingw-w64-cblas (#34115): MINGW_CROSS_COMPILATION: requires mingw-w64 cross-compilation toolchain.
;;;   A1: Guix has cross toolchains but lacks mingw-w64-cmake wrapper and target libraries.
;;;   A2: native CBLAS (lapack) already in Guix. A3: full mingw-w64 library stack out of scope.
;;; mingw-w64-lapack (#34113): MINGW_CROSS_COMPILATION: same as mingw-w64-cblas.
;;; mingw-w64-sqlite (#25121): MINGW_CROSS_COMPILATION: requires mingw-w64-configure, mingw-w64-crt.
;;;   Native sqlite already in Guix.
;;; mingw-w64-boost (#23783): MINGW_CROSS_COMPILATION: requires entire mingw-w64 ecosystem.
;;; mingw-w64-cppwinrt (#43750): MINGW_CROSS_COMPILATION: Windows Runtime C++ projection; no Linux equivalent.
;;; mingw-w64-pcre2 (#26805): MINGW_CROSS_COMPILATION: native pcre2 already in Guix.
;;; mingw-w64-spirv-tools (#42666): MINGW_CROSS_COMPILATION: native spirv-tools already in Guix.
;;; mingw-w64-postgresql (#24572): MINGW_CROSS_COMPILATION: native postgresql already in Guix.
;;;
;;; --- MULTILIB_UNSUPPORTED (5 packages) ---
;;; lib32-opencl-nvidia-390xx (#17502): MULTILIB_UNSUPPORTED: 32-bit NVIDIA 390xx legacy driver.
;;;   A1: NVIDIA 390xx is EOL. A2: Guix lacks multilib. A3: also proprietary.
;;; lib32-libxpm (#16491): MULTILIB_UNSUPPORTED: Guix has 64-bit libxpm but not multilib.
;;; lib32-libglade (#45410): MULTILIB_UNSUPPORTED: libglade is also deprecated upstream (GtkBuilder).
;;; capt-src (#17255): MULTILIB_UNSUPPORTED: Canon CAPT driver requires 32-bit filter binaries.
;;;   A1: CAPT protocol mandates 32-bit captfilter. A2: no 64-bit Canon driver. A3: also proprietary license.
;;; firestorm-next-bin (#17261): MULTILIB_UNSUPPORTED: Second Life viewer binary requires lib32-* libs.
;;;   A1: binary ships 32-bit libs. A2: source build also needs 32-bit compat. A3: OutOfDate in AUR.
;;;
;;; --- DISTRO_SPECIFIC (3 packages) ---
;;; asp (#14587): DISTRO_SPECIFIC: Arch Build System tool; depends on pacman infrastructure.
;;; aurutils (#11354): DISTRO_SPECIFIC: AUR helper; depends on pacutils/pacman.
;;; pamac-cli (#17940): DISTRO_SPECIFIC: Manjaro package manager frontend; depends on libpamac/libalpm.
;;;
;;; --- LEGACY_PYTHON2 (3 packages) ---
;;; python2-dbus (#37854): LEGACY_PYTHON2: Python 2 EOL. Guix has python-dbus (Python 3).
;;; python2-gimp (#23210): LEGACY_PYTHON2: GIMP 3.0+ uses Python 3. Python 2 EOL.
;;; python2-wxpython3 (#25153): LEGACY_PYTHON2: superseded by wxPython 4.x for Python 3.
;;;
;;; --- PROPRIETARY_BINARY (6 packages) ---
;;; dropbox (#2254): PROPRIETARY_BINARY: custom license prohibits redistribution.
;;; vmware-workstation (#1833): PROPRIETARY_BINARY: commercial VM software; non-redistributable.
;;; squareline-studio (#17812): PROPRIETARY_BINARY: commercial UI editor ($66-183/month); no source code.
;;; inkdrop (#17819): PROPRIETARY_BINARY: paid subscription note-taking app; no source code.
;;; brother-mfc-l2400dw (#17797): PROPRIETARY_BINARY: Brother commercial license + requires lib32-glibc.
;;;   A1: proprietary license prohibits redistribution. A2: requires multilib. A3: double blocker.
;;; deepin-wine8-stable (#35454): PROPRIETARY_BINARY: Deepin proprietary Wine fork.
;;;
;;; --- NON_DISTRIBUTABLE (2 packages) ---
;;; factorio-space-age-experimental (#17440): NON_DISTRIBUTABLE: commercial game; EULA prohibits redistribution.
;;; ttf-consolas-ligaturized (#20499): NON_DISTRIBUTABLE: proprietary Microsoft Consolas base font;
;;;   redistributing modified Consolas violates Microsoft EULA.
;;;
;;; --- PLATFORM_UNSUPPORTED (3 packages) ---
;;; bakkesmod-steam (#17468): PLATFORM_UNSUPPORTED: Windows-only Rocket League mod; DLL injection.
;;; euroscope-bin (#17945): PLATFORM_UNSUPPORTED: Windows-only ATC simulator; requires Wine.
;;; chromium-material-icons-for-github-bin (#18602): PLATFORM_UNSUPPORTED: browser extension (.crx/.xpi);
;;;   Guix has no packaging model for browser extensions.
;;;
;;; --- ABANDONED_UPSTREAM (3 packages) ---
;;; lightdm-webkit-theme-aether (#19028): ABANDONED_UPSTREAM: repo archived 2026-01-23; last release 2018.
;;;   Also requires lightdm-webkit2-greeter (not in Guix) and Arch-specific branding.
;;; gtk-theme-config (#21782): ABANDONED_UPSTREAM: repo archived since 2018; depends on deprecated GConf.
;;;   Tool is obsolete for modern GTK3/4.
;;; qtspim-iconfix (#18421): ABANDONED_UPSTREAM: SVN-only source; last AUR update 2020; Guix has qtmips.
;;;
;;; --- COMPLEX_DEPS (5 packages) ---
;;; heroku-cli (#17796): COMPLEX_DEPS: massive npm monorepo with hundreds of transitive deps.
;;;   A1: Guix node-build-system cannot handle oclif framework. A2: ties to proprietary platform.
;;;   A3: no lightweight CLI alternative.
;;; n8n (#17807): COMPLEX_DEPS + NON_FREE_LICENSE: Sustainable Use License (not OSI/FSF approved).
;;;   Also massive pnpm monorepo with hundreds of npm deps.
;;; plasma6-applets-panon (#17808): COMPLEX_DEPS: missing python-soundcard dependency.
;;;   A1: most KDE deps exist. A2: python-soundcard needs packaging first.
;;;   A3: KDE plasmoid install model non-standard for Guix.
;;; darling-cli-devenv-gui-common-git (#22161): COMPLEX_DEPS: macOS compat layer; requires multilib + 40+ deps.
;;; darling-iosurface-git (#22171): COMPLEX_DEPS: IOSurface for Darling; same dep chain as #22161.
;;;
;;; --- HARDWARE_SPECIFIC (3 packages) ---
;;; python-jax-rocm (#17278): HARDWARE_SPECIFIC: requires full AMD ROCm stack; Guix lacks ROCm.
;;;   CPU-only python-jax already in Guix.
;;; ffmpeg-cuda-full (#17346): HARDWARE_SPECIFIC: requires CUDA toolkit; also nonfree license (libfdk-aac).
;;; etlegacy32-mod (#17424): HARDWARE_SPECIFIC + MULTILIB: 32-bit game mod requiring 13 lib32-* deps.
;;;
;;; --- ABANDONED_UPSTREAM (1 package) ---
;;; clash-for-windows-chinese (#17433): ABANDONED_UPSTREAM: original project taken down; no license declared.
;;;
;;; --- COMPLEX_DEPS (2 packages) ---
;;; quartus-free-quartus (#23279): PROPRIETARY_PLATFORM: Intel FPGA tools; 10GB+ binary; also needs multilib.
;;; faenza-cupertino-icon-theme (#21477): COMPLEX_DEPS: requires packaging base faenza-icon-theme first.
;;;   Both are unmaintained (2017). Low demand (popularity=0.0).
;;;
;;; --- DKMS_KERNEL_MODULE (1 package) ---
;;; nvidia-bl-dkms (#17755): DKMS_KERNEL_MODULE: DKMS kernel module for legacy NVIDIA backlight.
;;;   A1: no upstream URL. A2: requires DKMS infra. A3: legacy hardware (pre-Kepler).
;;;
;;; --- DUPLICATE (already counted above) ---
;;; android-platform-19 (#28671): PLATFORM_UNSUPPORTED: Android SDK platform; requires android-sdk-build-tools.
;;;   Guix has no Android SDK packaging. Proprietary Google components.
;;; android-platform-21 (#23109): PLATFORM_UNSUPPORTED: same as android-platform-19.
