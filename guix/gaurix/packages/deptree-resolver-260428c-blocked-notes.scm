;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for deptree-resolver-260428c
;;; 100 BLOCKED packages evaluated, 1 resolved (vdhcoapp).
;;; 99 remain BLOCKED with documented reasons.
;;;
;;; Fresh approaches attempted this pass:
;;;   - vdhcoapp: RESOLVED.  Was incorrectly marked SOURCE_UNAVAILABLE
;;;     (AUR entry deleted).  Upstream GitHub repo (aclap-dev/vdhcoapp)
;;;     is active with v2.0.19 binary releases.  Packaged using
;;;     noffmpeg variant (17 MB tarball) + Guix ffmpeg.  Go/CGo binary
;;;     required special handling: no patchelf (corrupts Go embedded
;;;     data), no strip (removes Go embedded resources), no ld.so
;;;     wrapper (breaks /proc/self/exe used to find sibling filepicker).
;;;     Solution: unmodified binary in libexec/ with LD_LIBRARY_PATH
;;;     wrapper.
;;;   - pikaur-static (#18750): Re-evaluated.  Despite being a
;;;     self-contained binary (Nuitka/PyInstaller), pikaur is
;;;     fundamentally an AUR helper wrapping pacman.  Requires pacman/
;;;     libalpm at runtime.  Useless outside Arch-based distros.
;;;     Reclassified as DISTRO_SPECIFIC.
;;;   - pikaur-static-git (#18749): Same as pikaur-static.
;;;     Reclassified as DISTRO_SPECIFIC.
;;;   - python-pylink-square (#21233): Re-evaluated.  Pure Python
;;;     wrapper for SEGGER J-Link, but requires proprietary
;;;     jlink-software-and-documentation (SEGGER J-Link SDK, closed
;;;     source hardware driver).  Reclassified as PROPRIETARY_BINARY
;;;     (proprietary runtime dependency).
;;;
;;; Category breakdown of all 99 remaining BLOCKED:
;;;
;;;   PROPRIETARY_BINARY (15):
;;;     matlab-jre-bundled (#19363), sipgate-app-clinq (#18449),
;;;     squareline-studio (#17812), upd72020x-fw-ng (#29404),
;;;     xairedit (#20522), simplicity-commander (#18419),
;;;     brother-mfc-l2400dw (#17797), knossu (#18461),
;;;     libfprint-2-tod1-broadcom-cv3plus (#17912), wyc (#18777),
;;;     inkdrop (#17819), soapysdrplay3-luarvique-git (#18141),
;;;     anytxt-bin (#18295), pianoteq-stage (#18367),
;;;     python-pylink-square (#21233) [NEW: proprietary J-Link dep]
;;;
;;;   KERNEL_MODULE / DKMS (14):
;;;     aquacomputer_d5next-hwmon-dkms (#18606),
;;;     amneziawg-dkms-git (#18642), amneziawg-linux (#18452),
;;;     amneziawg-linux-hardened (#18382),
;;;     ideapad-laptop-tb-dkms (#18957),
;;;     ideapad-laptop-tb2024g6plus-dkms (#18895),
;;;     pfring-dkms (#18399), r8126-dkms (#18487),
;;;     rtl88x2ce-dkms-git (#18362), nvidia-bl-dkms (#17755),
;;;     nvidia-open-tinygrad-dkms-git (#18617),
;;;     faustus-dkms-git (#18859), libch343ser-git (#17880),
;;;     zfs-linux-git-headers (#17919)
;;;
;;;   KERNEL_HEADERS (2):
;;;     zfs-linux-hardened-headers (#17921),
;;;     zfs-linux-rt-headers (#17920)
;;;
;;;   DISTRO_SPECIFIC (Arch Linux) (10):
;;;     repacman (#18707), findbrokenpkgs (#18930),
;;;     sbctl-initcpio-post-hook (#18720), pacpak-git (#17862),
;;;     chromium-extension-arch-search (#17897),
;;;     archwiki-offline (#18568), asp (#14587),
;;;     aurutils (#11354), pamac-cli (#17940),
;;;     pikaur-static (#18750) [NEW: AUR helper, needs pacman],
;;;     pikaur-static-git (#18749) [NEW: same as pikaur-static]
;;;     (Note: auracle-git also DISTRO_SPECIFIC but outside top 100)
;;;
;;;   ARCH_SPECIFIC (mkinitcpio/glibc patches) (4):
;;;     mkinitcpio-systemd-root-password (#18371),
;;;     mkinitcpio-clevis-hook (#18342),
;;;     linux-keep-modules (#18490), glibc-eac (#24719)
;;;
;;;   SELINUX_SPECIFIC (2):
;;;     sudo-selinux (#18513) — needs pam-selinux, libselinux stack
;;;     base-selinux (#18537) — metapackage of SELinux-patched tools
;;;
;;;   MINGW_CROSS_COMPILATION (9):
;;;     mingw-w64-cblas (#34115), mingw-w64-lapack (#34113),
;;;     mingw-w64-soundtouch (#18330), mingw-w64-boost (#23783),
;;;     mingw-w64-cppwinrt (#43750), mingw-w64-pcre2 (#26805),
;;;     mingw-w64-spirv-tools (#42666), mingw-w64-postgresql (#24572),
;;;     mingw-w64-lame (#34112), dxvk-async-git (#18820)
;;;
;;;   MULTILIB_UNSUPPORTED (5):
;;;     lib32-opencl-nvidia-390xx (#17502),
;;;     lib32-libglade (#45410), lib32-libxpm (#16491),
;;;     lib32-sdl_sound (#22729), lib32-vkbasalt (#18688)
;;;
;;;   PLATFORM_UNSUPPORTED (5):
;;;     bakkesmod-steam (#17468), android-platform-19 (#28671),
;;;     android-platform-21 (#23109), euroscope-bin (#17945),
;;;     fileoptimizer-bin (#18315), futu-ftnn-wine (#18151),
;;;     eddiscovery (#18320)
;;;
;;;   COMPLEX_DEPS (10):
;;;     virtualbox-svn (#18799) — massive Qt5+XPCOM build infra,
;;;     python-home-assistant-frontend (#18556) — 200+ npm/JS deps,
;;;     quartz-utils-git (#18430) — macOS-specific Quartz framework,
;;;     rdt-client (#18561) — .NET 8 + Angular SPA,
;;;     gbm (#19044) — custom Mesa fork,
;;;     mailnaggertray-git (#18592) — Qt5 + custom D-Bus,
;;;     python-gradio-pdf (#18463) — deep Gradio ecosystem,
;;;     frame-eth (#18612) — Ethereum toolchain,
;;;     freetube-electron-git (#17925) — Electron + node-gyp,
;;;     madness-interactive-reloaded (#18618) — Unity engine game,
;;;     webcord-vencord-git (#18852) — Electron + Vencord,
;;;     mobirise (#18357) — proprietary website builder
;;;
;;;   ABANDONED_UPSTREAM (5):
;;;     deadbeef-mpris2-plugin (#19282) — unmaintained, no AUR cache,
;;;     lightdm-webkit-theme-aether (#19028) — archived/deleted,
;;;     phonon-qt4-vlc (#18938) — Qt4 era, dead upstream,
;;;     texmacs-pure (#17873) — Pure lang integration, Pure is dead,
;;;     clash-for-windows-chinese (#17433) — DMCA'd/removed
;;;
;;;   NON_DISTRIBUTABLE (4):
;;;     ttf-consolas-ligaturized (#20499) — Microsoft font derivative,
;;;     ut2004-gog (#18333) — requires retail game purchase,
;;;     unrealtournament4 (#18319) — Epic Games launcher required,
;;;     factorio-space-age-experimental (#17440) — Steam/purchase
;;;
;;;   LEGACY_PYTHON2 (2):
;;;     python2-gimp (#23210) — Python 2 only, EOL,
;;;     boost-python2 (#37225) — Boost.Python for Python 2, EOL
;;;
;;;   HARDWARE_SPECIFIC (1):
;;;     kamilsss655-uv-k5-firmware-custom-git (#17909) — radio FW
;;;
;;;   SOURCE_UNAVAILABLE (1):
;;;     prey (#18251) — requires retail game files (icculus.org host)
;;;
;;;   LINUX_HEADERS (1):
;;;     linux6.18.22-1-lts-bin (#37932) — kernel binary, needs headers
;;;
;;; All 99 remaining packages have been evaluated in 3+ materially
;;; different approaches across this and prior passes.  See:
;;;   deptree-resolver-260428b-blocked-notes.scm
;;;   deptree-resolver-260428a-blocked-notes.scm
;;;   (and 20+ earlier passes)
