;;; Blocked notes for recipe-resolver-260414a
;;; 12 packages blocked with reason codes

;;; #12797 yabridge-tui
;;;   BLOCKED: DEP_RESOLUTION_FAILED — requires yabridge VST bridge + Wine runtime not available in Guix; A1: yabridge depends on Wine and VST SDK; next: package yabridge first

;;; #12803 r8127-dkms
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Realtek r8127 out-of-tree DKMS kernel module; A1: requires linux-module-build-system + kernel headers; A2: DKMS not supported in Guix; next: design kernel module build phase

;;; #12815 open-vm-tools-git
;;;   BLOCKED: DEP_RESOLUTION_FAILED — already packaged as open-vm-tools in upstream Guix (gnu packages virtualization); A1: duplicate of existing package; next: use upstream open-vm-tools instead

;;; #12841 antiafk-rbx-sober
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Roblox anti-AFK tool requiring Sober Flatpak runtime; A1: depends on Sober (Roblox for Linux Flatpak); A2: no standalone operation; next: requires Sober packaging first

;;; #12843 skillshare
;;;   BLOCKED: SOURCE_UNAVAILABLE — proprietary Electron desktop client; A1: official desktop app discontinued 2023; A2: no stable public download URL; next: no actionable packaging path

;;; #12850 dnspyex-wine-bin
;;;   BLOCKED: DEP_RESOLUTION_FAILED — Windows .NET binary requiring Wine + .NET Desktop Runtime; A1: mono/.NET 8 runtime under Wine; A2: complex Wine prefix setup; next: needs Wine + dotnet packaging

;;; #12870 clean-chroot-manager
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Arch Linux makechrootpkg wrapper; A1: requires pacman + devtools + libalpm; A2: Arch-specific chroot management; next: not portable to non-pacman systems

;;; #12874 systemd-boot-pacman-hook
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Arch Linux pacman hook for systemd-boot update; A1: libalpm hook mechanism; A2: pacman-specific triggers; next: not portable to non-pacman systems

;;; #12876 wechat
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — proprietary WeChat Linux client; A1: complex Electron + native libs; A2: .deb with many runtime deps (libgtk, nss, gconf); next: needs comprehensive dep mapping

;;; #12877 proton-cachyos-slr
;;;   BLOCKED: DEP_RESOLUTION_FAILED — CachyOS-patched Proton for Steam; A1: requires CachyOS kernel patches + wine-staging; A2: Steam runtime integration; next: package wine-staging and Proton build deps

;;; #12893 pacman-static
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — statically linked Arch Linux pacman; A1: requires libalpm + static linking of all deps; A2: Arch-specific package manager; next: not useful outside Arch ecosystem

;;; #12904 cvmfs
;;;   BLOCKED: DEP_RESOLUTION_FAILED — CernVM File System with complex native deps; A1: requires fuse3, libcurl, c-ares, uuid, cap, sqlite; A2: custom cmake build with 15+ deps; next: map full dependency tree to Guix

