;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for deptree-resolver-260428b
;;; 100 BLOCKED packages evaluated, 1 resolved (open-tv).
;;; 99 remain BLOCKED with documented reasons.
;;;
;;; Fresh approaches attempted this pass:
;;;   - open-tv: RESOLVED via binary .deb from GitHub Releases (Tauri app,
;;;     v1.9.1, copy-build-system with patchelf + PATH wrapping for
;;;     ffmpeg/mpv/yt-dlp).
;;;   - hnefatafl-copenhagen: Re-examined Codeberg source (v5.8.0).
;;;     Cargo.lock has 7608 lines (~200+ crate deps).  Requires Rust
;;;     edition 2024 / rustc 1.94 (too new for current Guix Rust).
;;;     Iced GUI framework not packaged in Guix.  Still infeasible.
;;;   - GCC snapshot libs (libga68/libgfortran/libgnat/libgo-snapshot):
;;;     Re-checked AUR repos — confirmed deleted/empty.  These are
;;;     split-packages from gcc-snapshot PKGBUILD requiring lib32-glibc
;;;     (multilib) for build.  No viable path.
;;;   - beignet-git: Confirmed abandoned by Intel (replaced by
;;;     intel-compute-runtime).  Requires LLVM 7.0 which is not in Guix
;;;     and cannot be easily backported.
;;;   - libfive-studio-git: AUR git repo is empty/deleted.  Upstream
;;;     source at libfive.com requires libfive-git (also not packaged).
;;;
;;; Category breakdown of all 99 remaining BLOCKED:
;;;
;;;   PROPRIETARY_BINARY (14):
;;;     matlab-jre-bundled (#18464), sipgate-app-clinq (#18030),
;;;     squareline-studio (#17812), upd72020x-fw-ng (#18014),
;;;     xairedit (#17863), simplicity-commander (#17949),
;;;     brother-mfc-l2400dw (#17797), knossu (#17950),
;;;     libfprint-2-tod1-broadcom-cv3plus (#17958), wyc (#17951),
;;;     inkdrop (#17819), soapysdrplay3-luarvique-git (#18028),
;;;     anytxt-bin (#18063), pianoteq-stage (#18073)
;;;
;;;   KERNEL_MODULE / DKMS (14):
;;;     aquacomputer_d5next-hwmon-dkms (#18475),
;;;     amneziawg-dkms-git (#18478), amneziawg-linux (#17267),
;;;     amneziawg-linux-hardened (#17268),
;;;     ideapad-laptop-tb-dkms (#18481),
;;;     ideapad-laptop-tb2024g6plus-dkms (#18482),
;;;     pfring-dkms (#18399), r8126-dkms (#18401),
;;;     rtl88x2ce-dkms-git (#18362), nvidia-bl-dkms (#17755),
;;;     nvidia-open-tinygrad-dkms-git (#18516),
;;;     faustus-dkms-git (#18484), libch343ser-git (#17996),
;;;     zfs-linux-git-headers (#17919)
;;;
;;;   KERNEL_HEADERS (3):
;;;     linux6.18.22-1-lts-bin (#17848),
;;;     zfs-linux-hardened-headers (#17921),
;;;     zfs-linux-rt-headers (#17920)
;;;
;;;   DISTRO_SPECIFIC (Arch Linux) (7):
;;;     repacman (#18404), findbrokenpkgs (#18483),
;;;     sbctl-initcpio-post-hook (#18405),
;;;     pacpak-git (#17862),
;;;     chromium-extension-arch-search (#17897),
;;;     archwiki-offline (#18507), asp (#14587)
;;;
;;;   ARCH_SPECIFIC (mkinitcpio/glibc patches) (4):
;;;     mkinitcpio-systemd-root-password (#18371),
;;;     mkinitcpio-clevis-hook (#18342),
;;;     linux-keep-modules (#17934), glibc-eac (#18058)
;;;
;;;   SELINUX_SPECIFIC (2):
;;;     sudo-selinux (#18513) — needs pam-selinux, libselinux stack
;;;     base-selinux (#18537) — metapackage of SELinux-patched tools
;;;
;;;   MINGW_CROSS_COMPILATION (9):
;;;     mingw-w64-cblas (#17943), mingw-w64-lapack (#17944),
;;;     mingw-w64-soundtouch (#17945), mingw-w64-boost (#17946),
;;;     mingw-w64-cppwinrt (#17952), mingw-w64-pcre2 (#17953),
;;;     mingw-w64-spirv-tools (#17954), mingw-w64-postgresql (#17955),
;;;     mingw-w64-lame (#18060)
;;;
;;;   MULTILIB_UNSUPPORTED (5):
;;;     lib32-opencl-nvidia-390xx (#17502),
;;;     lib32-libglade (#17490), lib32-libxpm (#16491),
;;;     lib32-sdl_sound (#18057), lib32-vkbasalt (#18068)
;;;
;;;   PLATFORM_UNSUPPORTED (6):
;;;     bakkesmod-steam (#17468), android-platform-19 (#17854),
;;;     android-platform-21 (#17855), euroscope-bin (#18026),
;;;     fileoptimizer-bin (#17847), futu-ftnn-wine (#18032)
;;;
;;;   COMPLEX_DEPS (10):
;;;     virtualbox-svn (#18799) — massive Qt5+XPCOM build infra,
;;;     python-home-assistant-frontend (#17942) — 200+ npm/JS deps,
;;;     quartz-utils-git (#17947) — macOS-specific Quartz framework,
;;;     rdt-client (#17948) — .NET 8 + Angular SPA,
;;;     gbm (#18038) — custom Mesa fork,
;;;     mailnaggertray-git (#18033) — Qt5 + custom D-Bus,
;;;     python-gradio-pdf (#18035) — deep Gradio ecosystem,
;;;     frame-eth (#18066) — Ethereum toolchain,
;;;     freetree-electron-git (#18067) — Electron + node-gyp,
;;;     madness-interactive-reloaded (#18070) — Unity engine game
;;;
;;;   ABANDONED_UPSTREAM (5):
;;;     deadbeef-mpris2-plugin (#17876) — unmaintained, no AUR cache entry,
;;;     lightdm-webkit-theme-aether (#17933) — archived/deleted,
;;;     phonon-qt4-vlc (#17936) — Qt4 era, dead upstream,
;;;     texmacs-pure (#17937) — Pure lang integration, Pure is dead,
;;;     clash-for-windows-chinese (#17433) — DMCA'd/removed
;;;
;;;   NON_DISTRIBUTABLE (4):
;;;     ttf-consolas-ligaturized (#17941) — Microsoft font derivative,
;;;     ut2004-gog (#18016) — requires retail game purchase,
;;;     unrealtournament4 (#18015) — Epic Games launcher required,
;;;     factorio-space-age-experimental (#17440) — Steam/purchase required
;;;
;;;   LEGACY_PYTHON2 (2):
;;;     python2-gimp (#18050) — Python 2 only, EOL,
;;;     boost-python2 (#18056) — Boost.Python for Python 2, EOL
;;;
;;;   GCC_SNAPSHOT (5):
;;;     libga68-snapshot (#19629) — AUR repo deleted, GCC 17 Algol68,
;;;     libgfortran-snapshot (#19625) — AUR repo deleted, redundant,
;;;     libgnat-snapshot (#19623) — AUR repo deleted, Ada runtime,
;;;     libgo-snapshot (#19622) — AUR repo deleted, Go runtime,
;;;     lto-dump-snapshot (#18347) — depends on gcc-snapshot
;;;
;;;   HARDWARE_SPECIFIC (1):
;;;     kamilsss655-uv-k5-firmware-custom-git (#18036) — Quansheng radio FW
;;;
;;;   SOURCE_UNAVAILABLE (2):
;;;     vdhcoapp (#18368) — deleted from AUR,
;;;     deadbeef-mpris2-plugin (#17876) — not in AUR cache
;;;
;;;   OTHER (6):
;;;     dxvk-async-git (#18059) — MinGW cross-compilation for Wine,
;;;     hnefatafl-copenhagen (#18095) — Rust 1.94/edition 2024 + iced GUI
;;;       (too new for current Guix Rust toolchain, ~200 crate deps),
;;;     beignet-git (#18094) — abandoned Intel OpenCL, needs LLVM 7,
;;;     libfive-studio-git (#18096) — AUR repo empty, needs libfive-git,
;;;     aurutils (#11354) — Arch-specific AUR helper,
;;;     pamac-cli (#17966) — Arch libalpm/pacman package manager
;;;
;;; All 99 remaining packages have been evaluated in 3+ materially
;;; different approaches across this and prior passes.  See:
;;;   deptree-resolver-260428a-blocked-notes.scm
;;;   deptree-resolver-260427r-blocked-notes.scm
;;;   (and 20+ earlier passes)
