;;; GNU Guix --- Functional package management for GNU
;;; deptree-resolver-260427d — blocked notes
;;; 100 BLOCKED packages evaluated, 1 ALREADY_IN_GUIX, 99 remain BLOCKED.

;;; ALREADY_IN_GUIX (1):
;;; - coreutils-arch (#18690): GNU `arch` command already in Guix coreutils

;;; DKMS / KERNEL MODULES (21):
;;; - aquacomputer_d5next-hwmon-dkms (#18606): hwmon DKMS module
;;; - amneziawg-dkms-git (#18642): AmneziaWG DKMS module
;;; - amneziawg-linux (#18452): AmneziaWG kernel module
;;; - amneziawg-linux-hardened (#18382): AmneziaWG for linux-hardened
;;; - ideapad-laptop-tb-dkms (#18957): IdeaPad DKMS module
;;; - ideapad-laptop-tb2024g6plus-dkms (#18895): IdeaPad 2024 DKMS module
;;; - pfring-dkms (#18399): PF_RING DKMS module
;;; - r8126-dkms (#18487): Realtek r8126 DKMS driver
;;; - rtl88x2ce-dkms-git (#18362): Realtek RTL88x2CE DKMS WiFi
;;; - faustus-dkms-git (#18859): ASUS laptop DKMS driver
;;; - nvidia-bl-dkms (#17755): NVIDIA backlight DKMS module
;;; - nvidia-open-tinygrad-dkms-git (#18617): NVIDIA open tinygrad DKMS
;;; - libch343ser-git (#17880): WCH USB serial kernel driver
;;; - zfs-linux-hardened-headers (#17921): ZFS for linux-hardened
;;; - zfs-linux-rt-headers (#17920): ZFS for linux-rt
;;; - zfs-linux-git-headers (#17919): ZFS for linux-git
;;; - linux-gpib (#20547): GPIB kernel module + userspace

;;; MINGW-W64 CROSS-COMPILATION (9):
;;; - mingw-w64-cblas (#34115)
;;; - mingw-w64-lapack (#34113)
;;; - mingw-w64-soundtouch (#18330)
;;; - mingw-w64-boost (#23783)
;;; - mingw-w64-cppwinrt (#43750)
;;; - mingw-w64-pcre2 (#26805)
;;; - mingw-w64-spirv-tools (#42666)
;;; - mingw-w64-postgresql (#24572)
;;; - mingw-w64-lame (#34112)

;;; MULTILIB / LIB32 (5):
;;; - lib32-opencl-nvidia-390xx (#17502)
;;; - lib32-libglade (#45410)
;;; - lib32-libxpm (#16491)
;;; - lib32-sdl_sound (#22729)
;;; - lib32-vkbasalt (#18688)

;;; DISTRO-SPECIFIC / ARCH TOOLS (14):
;;; - repacman (#18707): pacman package rebuilder
;;; - findbrokenpkgs (#18930): Arch broken package finder
;;; - sbctl-initcpio-post-hook (#18720): mkinitcpio hook for sbctl
;;; - system-age (#18453): Arch install time checker
;;; - linux-keep-modules (#18490): pacman hook for kernel modules
;;; - pacpak-git (#17862): pacman wrapper for flatpak
;;; - chromium-extension-arch-search (#17897): Arch search extension
;;; - python-pypi2pkgbuild (#17822): PyPI to PKGBUILD converter
;;; - archwiki-offline (#18568): Arch Wiki offline viewer
;;; - asp (#14587): Arch SVN package tool
;;; - pamac-cli (#17940): Pamac package manager
;;; - vscodium-marketplace (#18695): VSCodium marketplace patch
;;; - mkinitcpio-systemd-root-password (#18371): mkinitcpio hook
;;; - mkinitcpio-clevis-hook (#18342): mkinitcpio Clevis hook

;;; PROPRIETARY / NON-DISTRIBUTABLE (12):
;;; - squareline-studio (#17812): commercial GUI tool, no public URL
;;; - brother-mfc-l2400dw (#17797): proprietary printer driver
;;; - ttf-consolas-ligaturized (#20499): non-redistributable font
;;; - inkdrop (#17819): proprietary Markdown app
;;; - pianoteq-stage (#18367): commercial VST piano
;;; - anytxt-bin (#18295): proprietary freeware search tool
;;; - luniistore (#18478): proprietary device manager
;;; - simplicity-commander (#18419): proprietary Silicon Labs debugger
;;; - wyc (#18777): commercial Chinese port-mapping
;;; - libfprint-2-tod1-broadcom-cv3plus (#17912): proprietary fingerprint driver
;;; - soapysdrplay3-luarvique-git (#18141): depends on proprietary libsdrplay
;;; - factorio-space-age-experimental (#17440): commercial game DLC

;;; PLATFORM UNSUPPORTED (5):
;;; - bakkesmod-steam (#17468): Windows-only Rocket League mod
;;; - android-platform-19 (#28671): Android SDK platform
;;; - android-platform-21 (#23109): Android SDK platform
;;; - euroscope-bin (#17945): Windows-only ATC simulator
;;; - fileoptimizer-bin (#18315): Windows app via Wine

;;; NON-DISTRIBUTABLE GAMES (3):
;;; - ut2004-gog (#18333): requires GOG purchase
;;; - unrealtournament4 (#18319): Epic Games proprietary
;;; - madness-interactive-reloaded (#18618): itch.io only, .NET

;;; COMPLEX BUILD CHAINS (5):
;;; - wldash (#18237): 50+ Rust cargo deps
;;; - anyrun-git (#17933): Rust + custom Relm4 fork
;;; - glibc-eac (#24719): patched glibc
;;; - freetube-electron-git (#17925): Electron 41 + pnpm
;;; - dxvk-async-git (#18820): Wine cross-compilation + Vulkan

;;; DEP RESOLUTION FAILURES (14):
;;; - virtualbox-svn (#18799): 50+ deps, massive build infra
;;; - python-home-assistant-frontend (#18556): massive npm/webpack
;;; - quartz-utils-git (#18430): Crystal language not in Guix
;;; - texmacs-pure (#17873): Pure lang abandoned, llvm35
;;; - rdt-client (#18561): .NET 10.0 needed, Guix has 8.0
;;; - gbm (#19044): Mono/VB.NET not available
;;; - mailnaggertray-git (#18592): depends on mailnagger (not in Guix)
;;; - python-gradio-pdf (#18463): depends on python-gradio chain
;;; - plank-reloaded-docklet-picky-git (#18397): Plank not in Guix
;;; - wayprompt-git (#18262): Zig available but 6 deps missing
;;; - emerald (#22333): requires compiz/libdecoration
;;; - eddiscovery (#18320): .NET/Mono + NuGet deps
;;; - frame-eth (#18612): Electron + massive npm chain
;;; - kamilsss655-uv-k5-firmware-custom-git (#17909): ARM cross-compilation

;;; ABANDONED / DEAD UPSTREAM (5):
;;; - lightdm-webkit-theme-aether (#19028): abandoned
;;; - clash-for-windows-chinese (#17433): upstream deleted
;;; - xeme-hg (#18426): Mercurial-only, abandoned
;;; - phonon-qt4-vlc (#18938): Qt4 end-of-life
;;; - knossu (#18461): ancient deps (glew1.10, libpng12)

;;; LEGACY (2):
;;; - boost-python2 (#37225): Python 2 EOL
;;; - python2-gimp (#23210): Python 2 EOL

;;; SOURCE UNAVAILABLE (5, not in AUR cache):
;;; - gradience (#18644): not in AUR cache, Blueprint deps
;;; - deadbeef-mpris2-plugin (#19282): removed from AUR
;;; - linux6.18.22-1-lts-bin (#37932): no longer maintained
;;; - matlab-jre-bundled (#19363): removed from AUR
;;; - sipgate-app-clinq (#18449): proprietary, not in AUR

;;; SELinux (2):
;;; - sudo-selinux (#18513): SELinux not used by Guix System
;;; - base-selinux (#18537): SELinux not applicable

;;; MISC (3):
;;; - futu-ftnn-wine (#18151): Windows trading app via Wine
;;; - coreutils-arch (#18690): → ALREADY_IN_GUIX
;;; - virtualbox-svn (#18799): counted in dep resolution failures
