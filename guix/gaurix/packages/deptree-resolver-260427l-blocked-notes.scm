;;; GNU Guix --- Functional package management for GNU
;;; deptree-resolver-260427l --- blocked notes
;;; 100 BLOCKED packages evaluated, 3 RESOLVED (+9 deps), 97 remain BLOCKED.
;;;
;;; wayprompt-git (#18262) resolved: Zig Wayland prompt tool with 6 new deps
;;; wldash (#18237) resolved: Rust Wayland launcher with 83 vendored crates
;;; anyrun-git (#17933) resolved: Rust+GTK4 Wayland launcher with 371 crates

;;; RESOLVED (3):
;;; - wayprompt-git (#18262): Zig-build password prompt for Wayland
;;;   New deps: zig-pixman-0.2, zig-wayland-0.2, zig-xkbcommon-0.2,
;;;             zig-fcft, zig-ini, zig-spoon
;;; - wldash (#18237): Wayland launcher/dashboard, cargo-build-system
;;;   83 crate sources vendored via define-cargo-inputs
;;; - anyrun-git (#17933): Wayland GTK4 app launcher, cargo-build-system
;;;   371 crate sources in (gaurix packages anyrun-crates)

;;; ====================================================================
;;; REMAINING BLOCKED (97 packages) — Categorized with exhausted approaches
;;; ====================================================================

;;; --- SELINUX_SPECIFIC (2) ---
;;; Guix System does not use SELinux.  No kernel or policy infrastructure.
;;; Approaches exhausted across 20+ prior passes.
;;; - sudo-selinux (#18513): sudo fork with SELinux support
;;; - base-selinux (#18537): meta-package pulling SELinux variants

;;; --- DKMS / KERNEL MODULES (13) ---
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
;;; - libch343ser-git (#17880)

;;; --- KERNEL-SPECIFIC HEADERS (6) ---
;;; Custom kernel headers for specific kernel variants.
;;; Guix manages kernels through its own configuration.
;;; - zfs-linux-hardened-headers (#17921)
;;; - zfs-linux-rt-headers (#17920)
;;; - zfs-linux-git-headers (#17919)
;;; - linux-keep-modules (#18490): Arch-specific kernel module preserver
;;; - linux6.18.22-1-lts-bin (#37932): pre-built binary Arch kernel
;;; - glibc-eac (#24719): Arch-specific glibc patch

;;; --- ARCH-LINUX-SPECIFIC TOOLING (14) ---
;;; Depend on pacman, mkinitcpio, makepkg, AUR, or other Arch
;;; infrastructure with no Guix equivalent.
;;; - mkinitcpio-systemd-root-password (#18371)
;;; - mkinitcpio-clevis-hook (#18342)
;;; - repacman (#18707)
;;; - findbrokenpkgs (#18930)
;;; - pacpak-git (#17862)
;;; - pamac-cli (#17940)
;;; - pikaur-static (#18750)
;;; - pikaur-static-git (#18749)
;;; - archwiki-offline (#18568)
;;; - chromium-extension-arch-search (#17897)
;;; - sbctl-initcpio-post-hook (#18720)
;;; - python-pypi2pkgbuild (#17822): Arch PKGBUILD generator
;;; - aurutils (#11354): AUR helper
;;; - asp (#14587): Arch source package tool

;;; --- PROPRIETARY / NON-REDISTRIBUTABLE (17) ---
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
;;; - factorio-space-age-experimental (#17440): commercial game
;;; - unrealtournament4 (#18319): proprietary Epic game
;;; - ut2004-gog (#18333): proprietary GOG game data

;;; --- PLATFORM_UNSUPPORTED (4) ---
;;; Windows-only, Android SDK, or require Wine/Proton fundamentally.
;;; - bakkesmod-steam (#17468): Windows-only Rocket League mod
;;; - android-platform-19 (#28671): Android SDK platform (proprietary)
;;; - android-platform-21 (#23109): Android SDK platform (proprietary)
;;; - euroscope-bin (#17945): Windows-only aviation tool (Wine)

;;; --- MINGW / WINDOWS CROSS-COMPILATION (8) ---
;;; MinGW cross-compilation targets for Windows.  Not applicable to Guix.
;;; Native versions of the underlying libraries already exist in Guix.
;;; - mingw-w64-cblas (#34115)
;;; - mingw-w64-lapack (#34113)
;;; - mingw-w64-soundtouch (#18330)
;;; - mingw-w64-boost (#23783)
;;; - mingw-w64-cppwinrt (#43750)
;;; - mingw-w64-pcre2 (#26805)
;;; - mingw-w64-spirv-tools (#42666)
;;; - mingw-w64-postgresql (#24572)

;;; --- MULTILIB_UNSUPPORTED (4) ---
;;; Guix does not use multilib.  32-bit packages are not needed.
;;; - lib32-opencl-nvidia-390xx (#17502)
;;; - lib32-libglade (#45410)
;;; - lib32-libxpm (#16491)
;;; - lib32-sdl_sound (#22729)

;;; --- ABANDONED / DEAD UPSTREAM (5) ---
;;; Upstream unmaintained, removed, or EOL technology.
;;; - deadbeef-mpris2-plugin (#19282): obsolete, built into DeaDBeeF 1.10.2+
;;; - lightdm-webkit-theme-aether (#19028): dormant since 2018
;;; - clash-for-windows-chinese (#17433): original DMCA'd/shut down Nov 2023
;;; - texmacs-pure (#17873): Pure language abandoned, requires LLVM 3.5
;;; - python2-gimp (#23210): Python 2 EOL, removed from modern GIMP

;;; --- WINE-WRAPPED APPLICATIONS (3) ---
;;; Windows applications that require Wine.
;;; - futu-ftnn-wine (#18151): proprietary stock trading via Wine
;;; - fileoptimizer-bin (#18315): Windows app via Wine
;;; - dxvk-async-git (#18820): produces Windows DLLs for Wine/Proton

;;; --- ELECTRON / COMPLEX NODEJS (6) ---
;;; Electron applications are extremely difficult to package in Guix
;;; due to bundled Chromium and complex Node.js dependency trees.
;;; - webcord-vencord-git (#18852): Electron Discord client
;;; - frame-eth (#18612): Electron Ethereum wallet
;;; - freetube-electron-git (#17925): Electron YouTube client
;;; - mobirise (#18357): Electron website builder
;;; - python-home-assistant-frontend (#18556): massive JS/Node build
;;; - rdt-client (#18561): .NET/ASP.NET web app

;;; --- COMPLEX DEPS / MISSING ECOSYSTEM (9) ---
;;; Packages where critical dependencies are missing from Guix.
;;; - emerald (#22333): needs compiz-core (not in Guix, unmaintained)
;;; - plank-reloaded-docklet-picky-git (#18397): needs plank-reloaded
;;; - quartz-utils-git (#18430): needs Crystal language (not in Guix)
;;; - python-gradio-pdf (#18463): needs python-gradio (massive dep tree)
;;; - madness-interactive-reloaded (#18618): needs .NET 9 (only 8.0 in Guix)
;;; - phonon-qt4-vlc (#18938): Qt4 is EOL and unsupported
;;; - boost-python2 (#37225): Python 2 EOL
;;; - lib32-vkbasalt (#18688): multilib Vulkan layer
;;; - eddiscovery (#18320): Windows .NET WinForms application

;;; --- HARDWARE-SPECIFIC / NICHE (6) ---
;;; Firmware, hardware-specific tools, or extremely niche packages.
;;; - kamilsss655-uv-k5-firmware-custom-git (#17909): embedded radio firmware
;;; - soapysdrplay3-luarvique-git (#18141): requires proprietary libsdrplay
;;; - mailnaggertray-git (#18592): niche Rust tray app, dead dep chain
;;; - knossu (#18461): proprietary indie game, no source
;;; - gbm (#19044): Mono/VB.NET game backup (poor Guix support)
;;; - virtualbox-svn (#18799): complex proprietary components + DKMS

;;; --- REMAINING (0) ---
;;; All 97 blocked packages accounted for above.
;;; base-devel-selinux (#18538): SELinux meta-package (counted in SELINUX)
;;; virtualbox-ext-oracle-dev (#18801): proprietary VirtualBox extension
;;; mingw-w64-lame (#34112): MINGW cross-compilation

;;; CORRECTION: 3 more not yet categorized above:
;;; - base-devel-selinux (#18538): SELINUX_SPECIFIC (meta-package)
;;; - virtualbox-ext-oracle-dev (#18801): PROPRIETARY_BINARY
;;; - mingw-w64-lame (#34112): MINGW_CROSS_COMPILATION
