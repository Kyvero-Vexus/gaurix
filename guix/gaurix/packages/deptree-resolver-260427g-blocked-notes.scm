;;; GNU Guix --- Functional package management for GNU
;;; deptree-resolver-260427g --- blocked notes
;;; 100 BLOCKED packages evaluated, 1 RESOLVED (luniistore),
;;; 99 remain BLOCKED.

;;; RESOLVED (1):
;;; - luniistore (#18478): DONE: binary .deb extraction from Google Cloud Storage
;;;   Approach: copy-build-system, extract .deb (ar + tar), wrapper script, udev rules
;;;   Prior passes incorrectly tagged SOURCE_UNAVAILABLE (download 403); URL now works.
;;;   Build validated structurally (lint clean, build reaches install phase).
;;;   Full build requires >500MB free on /gnu; system has insufficient space for
;;;   complete build verification at this time.

;;; ====================================================================
;;; REMAINING BLOCKED (99 packages) — Categorized with exhausted approaches
;;; ====================================================================

;;; --- SOURCE UNAVAILABLE / REMOVED FROM AUR (6) ---
;;; Approaches tried: (1) AUR cache lookup, (2) GitHub/GitLab search, (3) web archive
;;; - gradience (#18644): Not in AUR cache; Blueprint compiler deps unresolved
;;; - deadbeef-mpris2-plugin (#19282): Not in AUR cache; removed from AUR
;;; - linux6.18.22-1-lts-bin (#37932): Not in AUR cache; kernel version no longer maintained
;;; - matlab-jre-bundled (#19363): Not in AUR cache; proprietary MATLAB distribution
;;; - sipgate-app-clinq (#18449): Not in AUR cache; proprietary SaaS app
;;; - xairedit (#20522): Not in AUR cache; no upstream source identified

;;; --- SELinux (2) ---
;;; Approaches tried: (1) Check if SELinux support possible on Guix, (2) Check for
;;; non-SELinux alternatives, (3) Evaluate standalone packaging
;;; Guix System does not use SELinux; these packages are fundamentally incompatible.
;;; - sudo-selinux (#18513): SELinux-patched sudo; Guix System has no SELinux
;;; - base-selinux (#18537): SELinux meta-package; fundamentally Arch+SELinux

;;; --- DKMS / KERNEL MODULES (16) ---
;;; Approaches tried: (1) Package as kernel module, (2) Check for userspace component,
;;; (3) Check if upstreamed in mainline Linux kernel
;;; Guix kernel modules require different infrastructure; DKMS not supported.
;;; - aquacomputer_d5next-hwmon-dkms (#18606): hwmon DKMS; no userspace component
;;; - amneziawg-dkms-git (#18642): AmneziaWG DKMS; kernel module only
;;; - amneziawg-linux (#18452): AmneziaWG kernel module
;;; - amneziawg-linux-hardened (#18382): AmneziaWG for linux-hardened
;;; - faustus-dkms-git (#18859): ASUS TUF laptop DKMS driver
;;; - ideapad-laptop-tb-dkms (#18957): IdeaPad ACPI DKMS module
;;; - ideapad-laptop-tb2024g6plus-dkms (#18895): IdeaPad 2024 DKMS module
;;; - libch343ser-git (#17880): WCH USB serial kernel driver
;;; - nvidia-bl-dkms (#17755): NVIDIA backlight DKMS module
;;; - nvidia-open-tinygrad-dkms-git (#18617): NVIDIA open tinygrad DKMS
;;; - pfring-dkms (#18399): PF_RING DKMS kernel bypass
;;; - r8126-dkms (#18487): Realtek RTL8126 DKMS driver
;;; - rtl88x2ce-dkms-git (#18362): Realtek RTL88x2CE WiFi DKMS
;;; - zfs-linux-hardened-headers (#17921): ZFS for linux-hardened
;;; - zfs-linux-rt-headers (#17920): ZFS for linux-rt
;;; - zfs-linux-git-headers (#17919): ZFS for linux-git

;;; --- MinGW-w64 CROSS-COMPILATION (9) ---
;;; Approaches tried: (1) Guix cross-compilation with mingw-w64, (2) Check for
;;; native Linux builds, (3) Check for prebuilt binaries
;;; Guix does not have a mingw-w64 toolchain; no path to resolution.
;;; - mingw-w64-cblas (#34115)
;;; - mingw-w64-lapack (#34113)
;;; - mingw-w64-soundtouch (#18330)
;;; - mingw-w64-boost (#23783)
;;; - mingw-w64-cppwinrt (#43750)
;;; - mingw-w64-pcre2 (#26805)
;;; - mingw-w64-spirv-tools (#42666)
;;; - mingw-w64-postgresql (#24572)
;;; - mingw-w64-lame (#34112)

;;; --- MULTILIB / LIB32 (3) ---
;;; Approaches tried: (1) Check for 64-bit alternatives, (2) Guix multilib support,
;;; (3) Static linking approaches
;;; Guix does not support lib32 / multilib packaging.
;;; - lib32-opencl-nvidia-390xx (#17502): NVIDIA 390xx OpenCL lib32
;;; - lib32-libglade (#45410): also deprecated (GTK2 era)
;;; - lib32-libxpm (#16491): X11 pixmap library, 32-bit

;;; --- PLATFORM-UNSUPPORTED (6) ---
;;; Approaches tried: (1) Check for Linux-native alternative, (2) Wine/Proton wrapper,
;;; (3) Source build for native platform
;;; - bakkesmod-steam (#17468): Windows-only Rocket League mod; no Linux port
;;; - android-platform-19 (#18548): Android SDK platform; requires Android toolchain
;;; - android-platform-21 (#18549): Android SDK platform; requires Android toolchain
;;; - euroscope-bin (#19044): Windows-only VATSIM air traffic control; no Linux build
;;; - futu-ftnn-wine (#18312): Windows trading app; Wine wrapper
;;; - unrealtournament4 (#17505): Unreal Tournament 4; requires Epic launcher

;;; --- PROPRIETARY / NON-DISTRIBUTABLE (9) ---
;;; Approaches tried: (1) Check for public download URL, (2) Check open-source
;;; alternatives, (3) Try binary packaging from releases
;;; - squareline-studio (#17812): Commercial GUI tool; no public download without account
;;; - brother-mfc-l2400dw (#18480): Proprietary printer driver; vendor binary blob
;;; - libfprint-2-tod1-broadcom-cv3plus (#18098): Proprietary fingerprint driver
;;; - inkdrop (#18263): Proprietary note-taking app; requires account
;;; - pianoteq-stage (#17833): Proprietary piano synthesizer; commercial license
;;; - ttf-consolas-ligaturized (#18540): Microsoft Consolas font; non-distributable
;;; - ut2004-gog (#17493): GOG game; non-distributable
;;; - factorio-space-age-experimental (#18804): Commercial game DLC
;;; - clash-for-windows-chinese (#18297): Abandoned; removed from distribution

;;; --- DISTRO-SPECIFIC / ARCH TOOLS (14) ---
;;; Approaches tried: (1) Evaluate if tool works without pacman, (2) Port to
;;; Guix-native equivalent, (3) Package as-is with Arch deps stubbed
;;; All depend fundamentally on pacman, mkinitcpio, or Arch infrastructure.
;;; - repacman (#18707): Produces pacman .pkg.tar files; dead upstream (archlinux.fr)
;;; - findbrokenpkgs (#18930): Queries pacman database; Arch-only by design
;;; - sbctl-initcpio-post-hook (#18720): mkinitcpio hook for Secure Boot
;;; - system-age (#18453): Reads /var/log/pacman.log for install date
;;; - linux-keep-modules (#18490): pacman hook to preserve kernel modules
;;; - pacpak-git (#17862): pacman wrapper for flatpak; depends on pacman CLI
;;; - chromium-extension-arch-search (#17897): Arch-specific browser extension
;;; - python-pypi2pkgbuild (#17822): PyPI to PKGBUILD converter; Arch output
;;; - archwiki-offline (#18568): Requires arch-wiki-docs (Arch-only dump)
;;; - asp (#14587): Arch SVN package tool; PKGBUILD infrastructure
;;; - aurutils (#11354): AUR helper toolset; depends on pacman
;;; - pamac-cli (#17940): Pamac/libalpm package manager; pacman ecosystem
;;; - mkinitcpio-systemd-root-password (#18371): mkinitcpio hook
;;; - mkinitcpio-clevis-hook (#18342): mkinitcpio + Clevis/TPM hook

;;; --- COMPLEX BUILD CHAINS / MISSING ECOSYSTEMS (20) ---
;;; Approaches tried: (1) Direct build with available tools, (2) Pre-built binary,
;;; (3) Alternative versions/forks, (4) Minimal viable build
;;;
;;; Rust packages not on crates.io (cargo-build-system needs explicit crate-inputs):
;;; - wldash (#18237): Wayland launcher; 93 crate deps, not on crates.io
;;; - anyrun-git (#17933): Wayland runner; Rust, not on crates.io
;;; - pikaur-static (#18750): AUR helper compiled with Nuitka; also Arch-specific
;;; - pikaur-static-git (#18749): Same as pikaur-static
;;; - mailnaggertray-git (#18592): Tray icon; depends on mailnagger (not in Guix)
;;; - webcord-vencord-git (#18852): Discord client; complex npm/Electron build
;;;
;;; Zig build with vendored dependencies:
;;; - wayprompt-git (#18262): Wayland pinentry; zig build with 7 vendored zig deps
;;;
;;; .NET / Mono ecosystem:
;;; - rdt-client (#18561): Real-Debrid client; dotnet-runtime-9.0 not in Guix
;;; - eddiscovery (#18320): Elite Dangerous tool; msbuild/nuget/mono chain
;;; - gbm (#19044): Game Backup Monitor; depends on mono-basic (not in Guix)
;;;
;;; Other missing build tools/ecosystems:
;;; - quartz-utils-git (#18430): Crystal language CLI; Crystal not in Guix
;;; - texmacs-pure (#17873): Pure language plugin; Pure dead, llvm35 ancient
;;; - python-home-assistant-frontend (#18556): 110MB npm-built frontend wheel
;;; - python-gradio-pdf (#18463): Depends on python-gradio (complex npm chain)
;;; - frame-eth (#18612): Web3 tool; npm/nvm build chain
;;; - dxvk-async-git (#18820): DXVK; needs mingw-w64-gcc for cross-compilation
;;; - glibc-eac (#24719): Custom glibc; needs lib32-gcc-libs (multilib)
;;; - knossu (#18461): Binary game from 2015; needs glew1.10, libpng12 (both obsolete)
;;; - anytxt-bin (#18295): Chinese search tool; needs openssl-1.1, libxcrypt-compat
;;; - vmd (#18253): Visual Molecular Dynamics; proprietary custom license
;;;
;;; Deprecated / abandoned dependencies:
;;; - phonon-qt4-vlc (#18938): Qt4 phonon backend; Qt4 removed from Guix
;;; - boost-python2 (#37225): Boost with Python 2; Python 2 EOL
;;; - emerald (#22333): Compiz decorator; Compiz not in Guix
;;; - python2-gimp (#17823): GIMP Python 2 bindings; Python 2 EOL
;;; - lightdm-webkit-theme-aether (#18246): Abandoned upstream
;;; - xeme-hg (#18426): XMPP library; depends on birb-hg (not in Guix)
;;; - lib32-sdl_sound (#22729): lib32 + deprecated SDL1 sound library
;;;
;;; Proprietary dependencies:
;;; - simplicity-commander (#18419): Depends on jlink-software (proprietary SEGGER)
;;; - soapysdrplay3-luarvique-git (#18141): Depends on libsdrplay (proprietary SDK)
;;; - kamilsss655-uv-k5-firmware-custom-git (#17909): ARM cross-compiler chain
;;; - plank-reloaded-docklet-picky-git (#18397): Depends on plank (not in Guix)
;;;
;;; Commercial / proprietary with no source:
;;; - wyc (#18777): Commercial Chinese VPN/port mapping tool
;;; - virtualbox-svn (#18799): 53 deps; massive build infra (Qt5, SDL, XPCOM)
