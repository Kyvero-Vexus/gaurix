;;; GNU Guix --- Functional package management for GNU
;;; deptree-resolver-260427q --- blocked notes
;;; 100 BLOCKED packages evaluated, 2 RESOLVED, 98 remain BLOCKED.
;;; Resolved: emerald (dep compiz-core now available), plank-reloaded-docklet-picky-git (dep plank-reloaded now available).
;;; All remaining packages are in intractable categories after 23+ prior passes.

;;; ====================================================================
;;; RESOLVED (2 packages) — Previously BLOCKED, deps now available
;;; ====================================================================

;;; - emerald (#22333): window decorator for Compiz.
;;;   Was BLOCKED: COMPLEX_DEPS (missing compiz-core).
;;;   compiz-core was packaged in deptree-resolver-260418p.
;;;   All other deps in Guix: libwnck, libxres, xdg-utils, hicolor-icon-theme.
;;;   Recipe in deptree-resolver-260427q.scm.

;;; - plank-reloaded-docklet-picky-git (#18397): color picker docklet for Plank Reloaded.
;;;   Was BLOCKED: COMPLEX_DEPS (missing Plank Reloaded dev libs).
;;;   plank-reloaded was packaged in recipe-resolver-260418l.
;;;   All build deps in Guix: gnome-common, intltool, vala, meson.
;;;   Recipe in deptree-resolver-260427q.scm.

;;; ====================================================================
;;; REMAINING BLOCKED (98 packages) — Categorized with exhausted approaches
;;; ====================================================================

;;; --- SELINUX_SPECIFIC (2) ---
;;; Guix System does not use SELinux.  No kernel or policy infrastructure.
;;; - sudo-selinux (#18513): sudo fork with SELinux support
;;; - base-selinux (#18537): meta-package pulling SELinux variants

;;; --- DKMS / KERNEL MODULES (12) ---
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

;;; --- KERNEL-SPECIFIC HEADERS (3) ---
;;; Custom kernel headers for specific kernel variants.
;;; Guix manages kernels through its own configuration.
;;; - zfs-linux-hardened-headers (#17921)
;;; - zfs-linux-rt-headers (#17920)
;;; - zfs-linux-git-headers (#17919)

;;; --- KERNEL_MODULE (1) ---
;;; - libch343ser-git (#17880): DKMS serial driver

;;; --- ARCH-LINUX-SPECIFIC TOOLING (14) ---
;;; Depend on pacman, mkinitcpio, makepkg, AUR, or other Arch
;;; infrastructure with no Guix equivalent.
;;; - mkinitcpio-systemd-root-password (#18371)
;;; - mkinitcpio-clevis-hook (#18342)
;;; - repacman (#18707)
;;; - findbrokenpkgs (#18930)
;;; - pacpak-git (#17862)
;;; - pamac-cli (#17940)
;;; - pikaur-static (#18750): AUR helper, requires pacman/libalpm
;;; - pikaur-static-git (#18749): AUR helper, requires pacman/libalpm
;;; - archwiki-offline (#18568)
;;; - chromium-extension-arch-search (#17897)
;;; - sbctl-initcpio-post-hook (#18720)
;;; - python-pypi2pkgbuild (#17822): Arch PKGBUILD generator
;;; - aurutils (#11354): AUR helper
;;; - asp (#14587): Arch source package tool

;;; --- PROPRIETARY / NON-REDISTRIBUTABLE (15) ---
;;; Proprietary binaries, non-free licenses, or non-redistributable content.
;;; - squareline-studio (#17812): proprietary LVGL UI designer
;;; - matlab-jre-bundled (#19363): MATLAB proprietary JRE
;;; - sipgate-app-clinq (#18449): proprietary VoIP Electron app
;;; - simplicity-commander (#18419): Silicon Labs proprietary tool
;;; - brother-mfc-l2400dw (#17797): proprietary printer driver
;;; - ttf-consolas-ligaturized (#20499): Microsoft font, non-distributable
;;; - wyc (#18777): proprietary Chinese tunnel client
;;; - inkdrop (#17819): proprietary note-taking app
;;; - pianoteq-stage (#18367): proprietary piano synthesizer
;;; - vmd (#18253): proprietary academic license, no redistribution
;;; - anytxt-bin (#18295): proprietary desktop search, no source
;;; - upd72020x-fw-ng (#29404): proprietary USB firmware blob
;;; - xairedit (#20522): proprietary Behringer mixer app
;;; - libfprint-2-tod1-broadcom-cv3plus (#17912): proprietary fingerprint driver
;;; - soapysdrplay3-luarvique-git (#18141): requires proprietary libsdrplay

;;; --- NON_DISTRIBUTABLE (4) ---
;;; - factorio-space-age-experimental (#17440): commercial game
;;; - unrealtournament4 (#18319): proprietary Epic game
;;; - ut2004-gog (#18333): proprietary GOG game data
;;; - knossu (#18461): proprietary indie game, no source

;;; --- PLATFORM_UNSUPPORTED (7) ---
;;; Windows-only, Android SDK, or require Wine/Proton fundamentally.
;;; - bakkesmod-steam (#17468): Windows-only Rocket League mod
;;; - android-platform-19 (#28671): Android SDK platform (proprietary)
;;; - android-platform-21 (#23109): Android SDK platform (proprietary)
;;; - euroscope-bin (#17945): Windows-only aviation tool (Wine)
;;; - futu-ftnn-wine (#18151): proprietary stock trading via Wine
;;; - fileoptimizer-bin (#18315): Windows app via Wine
;;; - eddiscovery (#18320): Windows .NET WinForms application

;;; --- MINGW / WINDOWS CROSS-COMPILATION (10) ---
;;; MinGW cross-compilation targets for Windows.  Not applicable to Guix.
;;; - mingw-w64-cblas (#34115)
;;; - mingw-w64-lapack (#34113)
;;; - mingw-w64-soundtouch (#18330)
;;; - mingw-w64-boost (#23783)
;;; - mingw-w64-cppwinrt (#22714)
;;; - mingw-w64-pcre2 (#31773)
;;; - mingw-w64-spirv-tools (#24618)
;;; - mingw-w64-postgresql (#24285)
;;; - mingw-w64-lame (#24517)
;;; - dxvk-async-git (#17516): DXVK (Vulkan-based DirectX, MinGW cross-compilation)

;;; --- MULTILIB_UNSUPPORTED (5) ---
;;; 32-bit library variants.  Guix focuses on 64-bit; 32-bit support is minimal.
;;; - lib32-opencl-nvidia-390xx (#35668)
;;; - lib32-libglade (#30153)
;;; - lib32-libxpm (#32474)
;;; - lib32-sdl_sound (#25028)
;;; - lib32-vkbasalt (#29222)

;;; --- ABANDONED_UPSTREAM (5) ---
;;; - deadbeef-mpris2-plugin (#19282): not in AUR cache; package removed
;;; - lightdm-webkit-theme-aether (#19028): requires lightdm-webkit2-greeter (not in Guix)
;;; - phonon-qt4-vlc (#18938): Qt4 EOL, removed from Guix
;;; - texmacs-pure (#17873): Pure language abandoned, requires LLVM 3.5
;;; - clash-for-windows-chinese (#17433): upstream project deleted

;;; --- LEGACY_PYTHON2 (2) ---
;;; - python2-gimp (#23940): Python 2 GIMP bindings, Python 2 EOL
;;; - boost-python2 (#24810): Boost.Python for Python 2, Python 2 EOL

;;; --- COMPLEX_DEPS (remaining 11) ---
;;; These have massive dependency chains that cannot be resolved in Guix.
;;; - virtualbox-svn (#18799): 50+ deps including kernel modules, gsoap
;;; - python-home-assistant-frontend (#18556): 500+ npm webpack deps
;;; - quartz-utils-git (#18430): Crystal language not in Guix
;;; - rdt-client (#18561): requires .NET 9.0 (Guix only has 8.0)
;;; - gbm (#19044): requires mono-basic (not in Guix)
;;; - mailnaggertray-git (#18592): requires mailnagger (not in Guix)
;;; - python-gradio-pdf (#18463): requires python-gradio with 100+ transitive deps
;;; - webcord-vencord-git (#18852): Electron + 500+ npm deps
;;; - frame-eth (#18612): Electron Web3 wallet, massive npm chain
;;; - freetube-electron-git (#17925): Electron + pnpm + 500+ npm deps
;;; - madness-interactive-reloaded (#18618): .NET 9.0 game (not available in Guix)

;;; --- COMPLEX_DEPS (Electron/proprietary) (3) ---
;;; - mobirise (#18357): proprietary website builder, license unclear
;;; - open-tv (#18368): Tauri/Rust/npm build; npm dependency chain
;;; - linux-keep-modules (#18490): Arch-specific kernel module preserver

;;; --- HARDWARE_SPECIFIC (1) ---
;;; - kamilsss655-uv-k5-firmware-custom-git (#18068): ARM cross-compilation
;;;   firmware for Quansheng UV-K5 radio; requires arm-none-eabi toolchain

;;; --- SOURCE_UNAVAILABLE (1) ---
;;; - xeme-hg (#18426): Mercurial-only source, depends on birb-hg (not in Guix)

;;; --- ARCH_SPECIFIC (1) ---
;;; - glibc-eac (#24719): Arch-specific glibc patch for EasyAntiCheat

;;; --- BINARY KERNEL (1) ---
;;; - linux6.18.22-1-lts-bin (#37932): pre-built binary Arch kernel
