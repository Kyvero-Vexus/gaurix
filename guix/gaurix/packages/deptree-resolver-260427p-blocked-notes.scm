;;; GNU Guix --- Functional package management for GNU
;;; deptree-resolver-260427p --- blocked notes
;;; 100 BLOCKED packages evaluated, 0 RESOLVED, 100 remain BLOCKED.
;;; All packages are in intractable categories after 22+ prior passes.

;;; ====================================================================
;;; REMAINING BLOCKED (100 packages) — Categorized with exhausted approaches
;;; ====================================================================

;;; --- SELINUX_SPECIFIC (2) ---
;;; Guix System does not use SELinux.  No kernel or policy infrastructure.
;;; Approaches exhausted across 22+ prior passes.
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
;;; - libch343ser-git (#17880): DKMS serial driver

;;; --- KERNEL-SPECIFIC HEADERS (4) ---
;;; Custom kernel headers for specific kernel variants.
;;; Guix manages kernels through its own configuration.
;;; - zfs-linux-hardened-headers (#17921)
;;; - zfs-linux-rt-headers (#17920)
;;; - zfs-linux-git-headers (#17919)
;;; - linux6.18.22-1-lts-bin (#37932): pre-built binary Arch kernel

;;; --- ARCH-LINUX-SPECIFIC TOOLING (16) ---
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
;;; - linux-keep-modules (#18490): Arch-specific kernel module preserver
;;; - glibc-eac (#24719): Arch-specific glibc patch for EAC

;;; --- PROPRIETARY / NON-REDISTRIBUTABLE (19) ---
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
;;; - knossu (#18461): proprietary indie game, no source
;;; - soapysdrplay3-luarvique-git (#18141): requires proprietary libsdrplay

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
;;; Native versions of the underlying libraries already exist in Guix.
;;; - mingw-w64-cblas (#34115)
;;; - mingw-w64-lapack (#34113)
;;; - mingw-w64-soundtouch (#18330)
;;; - mingw-w64-boost (#23783)
;;; - mingw-w64-cppwinrt (#43750)
;;; - mingw-w64-pcre2 (#26805)
;;; - mingw-w64-spirv-tools (#42666)
;;; - mingw-w64-postgresql (#24572)
;;; - mingw-w64-lame (#34112)
;;; - dxvk-async-git (#18820): produces Windows DLLs for Wine/Proton

;;; --- MULTILIB_UNSUPPORTED (5) ---
;;; Guix does not use multilib.  32-bit packages are not needed.
;;; - lib32-opencl-nvidia-390xx (#17502)
;;; - lib32-libglade (#45410)
;;; - lib32-libxpm (#16491)
;;; - lib32-sdl_sound (#22729)
;;; - lib32-vkbasalt (#18688): multilib Vulkan layer

;;; --- ABANDONED / DEAD UPSTREAM (5) ---
;;; Upstream unmaintained, removed, or EOL technology.
;;; - deadbeef-mpris2-plugin (#19282): obsolete, built into DeaDBeeF 1.10.2+
;;; - lightdm-webkit-theme-aether (#19028): dormant since 2018
;;; - clash-for-windows-chinese (#17433): original DMCA'd/shut down Nov 2023
;;; - texmacs-pure (#17873): Pure language abandoned, requires LLVM 3.5
;;; - phonon-qt4-vlc (#18938): Qt4 is EOL and unsupported

;;; --- LEGACY_PYTHON2 (2) ---
;;; Python 2 is EOL.  Guix has removed Python 2 support.
;;; - python2-gimp (#23210): Python 2 EOL, removed from modern GIMP
;;; - boost-python2 (#37225): Python 2 EOL

;;; --- ELECTRON / COMPLEX NODEJS (5) ---
;;; Electron applications or massive JS/Node.js dependency trees.
;;; - webcord-vencord-git (#18852): Electron Discord client
;;; - frame-eth (#18612): Electron Ethereum wallet
;;; - freetrue-electron-git (#17925): Electron YouTube client
;;; - mobirise (#18357): Electron website builder
;;; - python-home-assistant-frontend (#18556): massive JS/Node build

;;; --- COMPLEX DEPS / MISSING ECOSYSTEM (10) ---
;;; Packages where critical dependencies are missing from Guix.
;;; - virtualbox-svn (#18799): massive build, proprietary components + DKMS
;;; - emerald (#22333): needs compiz-core (not in Guix, unmaintained)
;;; - plank-reloaded-docklet-picky-git (#18397): needs plank-reloaded
;;; - quartz-utils-git (#18430): needs Crystal language (not in Guix)
;;; - python-gradio-pdf (#18463): needs python-gradio (massive dep tree)
;;; - madness-interactive-reloaded (#18618): needs .NET 9 (only 8.0 in Guix)
;;; - rdt-client (#18561): .NET/ASP.NET web app
;;; - open-tv (#18368): Tauri/Rust/WebKit; binary version already packaged
;;; - gbm (#19044): Mono/VB.NET game backup (poor Guix support)
;;; - mailnaggertray-git (#18592): niche Rust tray app, dead dep chain

;;; --- SOURCE_UNAVAILABLE (1) ---
;;; Source hosting broken or unreachable.
;;; - xeme-hg (#18426): Mercurial-only; archive downloads return HTTP 500,
;;;   SSL cert issues, no stable release (0.1.0-dev), depends on birb-hg
;;;   (also Mercurial-only).  Tested hg clone: works with --insecure but
;;;   Guix hg-fetch would likely fail due to SSL.  No git mirror exists.

;;; --- HARDWARE-SPECIFIC / NICHE (1) ---
;;; Firmware, hardware-specific tools, or extremely niche packages.
;;; - kamilsss655-uv-k5-firmware-custom-git (#17909): embedded radio firmware

;;; ====================================================================
;;; Total: 100 packages (2 SELinux + 13 DKMS/kernel + 4 kernel-headers +
;;; 16 arch-specific + 19 proprietary + 7 platform + 10 mingw + 5 multilib +
;;; 5 abandoned + 2 python2 + 5 electron + 10 complex-deps +
;;; 1 source-unavailable + 1 hardware = 100 unique packages)
;;; ====================================================================
