;;; Blocked notes for deptree-resolver-260428e
;;; 100 BLOCKED packages evaluated, 0 new recipes,
;;; 5 ALREADY_RESOLVED, 4 newly categorized, 91 remain BLOCKED.
;;;
;;; Generated: 2026-04-28
;;;
;;; The BLOCKED queue is now 177 packages (down from 3,978 at 260428d).
;;; Nearly all remaining packages are in permanently intractable categories.

;;; === ALREADY_RESOLVED (5 packages — recipes exist in imported modules) ===
;;; 1. asp — recipe in deptree-resolver-260418j.scm
;;; 2. aurutils — recipe in deptree-resolver-260413c.scm
;;; 3. euroscope-bin — recipe in recipe-resolver-260426l.scm
;;; 4. faustus-dkms-git — recipe in recipe-resolver-260428e.scm
;;; 5. fileoptimizer-bin — recipe in recipe-resolver-260427q.scm

;;; === NEWLY CATEGORIZED (4 packages) ===
;;;
;;; pikaur-static — DISTRO_SPECIFIC
;;;   AUR helper wrapping pacman; fundamentally Arch Linux only.
;;;   A1: Package as-is → requires pacman, not available on Guix.
;;;   A2: Strip pacman dep → tool is useless without pacman.
;;;   A3: Stub package → no value, entire purpose is AUR/pacman integration.
;;;
;;; pikaur-static-git — DISTRO_SPECIFIC
;;;   Git version of pikaur-static; same issues as above.
;;;   A1–A3: Same as pikaur-static.
;;;
;;; prey — NON_DISTRIBUTABLE + MULTILIB_UNSUPPORTED
;;;   FPS game based on id Tech 4; requires retail game files to play.
;;;   Custom restrictive license.  Depends on lib32-alsa-lib, lib32-mesa,
;;;   lib32-openal, lib32-sdl (multilib).
;;;   A1: Package binary → requires retail files, can't distribute.
;;;   A2: Installer needing user-supplied files → still needs lib32 deps.
;;;   A3: 64-bit wrapper → game binary is 32-bit only, no 64-bit port.
;;;
;;; borgwarehouse — COMPLEX_DEPS (NPM_ECOSYSTEM)
;;;   Next.js 16 web UI for BorgBackup, 500+ transitive npm deps via pnpm.
;;;   A1: node-build-system → requires each npm dep as separate Guix package.
;;;   A2: Standalone build with vendored deps → pnpm install needs network.
;;;   A3: Pre-built binary repack → no standalone release artifact exists.
;;;   Would need either Guix pnpm tooling or a manually vendored tarball.

;;; === BLOCKED — PROPRIETARY_BINARY (15) ===
;;; matlab-jre-bundled, sipgate-app-clinq, squareline-studio,
;;; upd72020x-fw-ng, xairedit, simplicity-commander, brother-mfc-l2400dw,
;;; knossu, libfprint-2-tod1-broadcom-cv3plus, wyc, inkdrop,
;;; soapysdrplay3-luarvique-git, anytxt-bin, pianoteq-stage, vmd

;;; === BLOCKED — DKMS_KERNEL_MODULE (13) ===
;;; aquacomputer_d5next-hwmon-dkms, amneziawg-dkms-git, amneziawg-linux,
;;; amneziawg-linux-hardened, faustus-dkms-git, ideapad-laptop-tb-dkms,
;;; ideapad-laptop-tb2024g6plus-dkms, libch343ser-git, pfring-dkms,
;;; r8126-dkms, nvidia-bl-dkms, rtl88x2ce-dkms-git,
;;; nvidia-open-tinygrad-dkms-git

;;; === BLOCKED — COMPLEX_DEPS (13 + 1 newly categorized) ===
;;; virtualbox-svn, python-home-assistant-frontend, quartz-utils-git,
;;; rdt-client, gbm, mailnaggertray-git, python-gradio-pdf,
;;; webcord-vencord-git, frame-eth, freetube-electron-git,
;;; madness-interactive-reloaded, mobirise, hnefatafl-copenhagen,
;;; borgwarehouse (newly categorized — NPM_ECOSYSTEM)

;;; === BLOCKED — MINGW_CROSS_COMPILATION (10) ===
;;; mingw-w64-cblas, mingw-w64-lapack, mingw-w64-soundtouch,
;;; dxvk-async-git, mingw-w64-boost, mingw-w64-cppwinrt,
;;; mingw-w64-pcre2, mingw-w64-spirv-tools, mingw-w64-postgresql,
;;; mingw-w64-lame

;;; === BLOCKED — DISTRO_SPECIFIC (9 + 2 newly categorized) ===
;;; repacman, archwiki-offline, findbrokenpkgs, sbctl-initcpio-post-hook,
;;; pacpak-git, chromium-extension-arch-search, asp, aurutils, pamac-cli,
;;; pikaur-static (newly categorized), pikaur-static-git (newly categorized)

;;; === BLOCKED — PLATFORM_UNSUPPORTED (7) ===
;;; bakkesmod-steam, android-platform-19, android-platform-21,
;;; euroscope-bin, futu-ftnn-wine, eddiscovery, fileoptimizer-bin

;;; === BLOCKED — MULTILIB_UNSUPPORTED (5 + part of prey) ===
;;; lib32-opencl-nvidia-390xx, lib32-libglade, lib32-libxpm,
;;; lib32-sdl_sound, lib32-vkbasalt

;;; === BLOCKED — ABANDONED_UPSTREAM (6) ===
;;; deadbeef-mpris2-plugin, lightdm-webkit-theme-aether, phonon-qt4-vlc,
;;; texmacs-pure, clash-for-windows-chinese, beignet-git

;;; === BLOCKED — ARCH_SPECIFIC (5) ===
;;; mkinitcpio-systemd-root-password, linux-keep-modules,
;;; glibc-eac, mkinitcpio-clevis-hook, python-pypi2pkgbuild

;;; === BLOCKED — NON_DISTRIBUTABLE (4 + prey newly categorized) ===
;;; ttf-consolas-ligaturized, ut2004-gog, unrealtournament4,
;;; factorio-space-age-experimental, prey (newly categorized)

;;; === BLOCKED — KERNEL_HEADERS (4) ===
;;; linux6.18.22-1-lts-bin, zfs-linux-hardened-headers,
;;; zfs-linux-rt-headers, zfs-linux-git-headers

;;; === BLOCKED — LEGACY_PYTHON2 (2) ===
;;; python2-gimp, boost-python2

;;; === BLOCKED — SELINUX_SPECIFIC (2) ===
;;; sudo-selinux, base-selinux

;;; === BLOCKED — HARDWARE_SPECIFIC (1) ===
;;; kamilsss655-uv-k5-firmware-custom-git

;;; === BLOCKED — GCC_SNAPSHOT (implied from lto-dump-snapshot) ===
;;; (lto-dump-snapshot is beyond position 100 but noted for completeness)
