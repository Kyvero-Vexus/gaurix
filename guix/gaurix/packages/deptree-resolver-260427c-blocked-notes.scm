;;; deptree-resolver-260427c — blocked notes (97 packages remain BLOCKED)
;;;
;;; ALREADY_RESOLVED (1):
;;;   logstash (#18344): recipe exists as logstash-bin in recipe-resolver-260426k.scm
;;;
;;; NEW RECIPES (2):
;;;   libnspire: dependency of nfuspire-git; TI-Nspire USB library
;;;   nfuspire: FUSE filesystem for TI-Nspire; resolves nfuspire-git (#18401)
;;;
;;; SELINUX_SPECIFIC (2):
;;;   sudo-selinux (#18513): SELinux not used by Guix System
;;;   base-selinux (#18537): SELinux meta-package; no Guix equivalent
;;;
;;; DKMS_KERNEL_MODULE (13):
;;;   aquacomputer_d5next-hwmon-dkms (#18606): DKMS hwmon module
;;;   amneziawg-dkms-git (#18642): DKMS kernel module
;;;   amneziawg-linux (#18452): DKMS kernel module
;;;   amneziawg-linux-hardened (#18382): DKMS kernel module
;;;   faustus-dkms-git (#18859): DKMS kernel module
;;;   ideapad-laptop-tb-dkms (#18957): DKMS kernel module
;;;   ideapad-laptop-tb2024g6plus-dkms (#18895): DKMS kernel module
;;;   pfring-dkms (#18399): DKMS kernel module
;;;   r8126-dkms (#18487): DKMS kernel module
;;;   nvidia-bl-dkms (#17755): DKMS kernel module
;;;   rtl88x2ce-dkms-git (#18362): DKMS kernel module
;;;   nvidia-open-tinygrad-dkms-git (#18617): DKMS kernel module
;;;   linux-gpib (#17740): GPIB kernel module
;;;
;;; ARCH_SPECIFIC (14):
;;;   mkinitcpio-systemd-root-password (#18371): mkinitcpio hook
;;;   repacman (#18707): pacman-specific tool
;;;   archwiki-offline (#18568): Arch wiki viewer
;;;   sbctl-initcpio-post-hook (#18720): mkinitcpio hook
;;;   system-age (#18453): reads pacman install time
;;;   linux-keep-modules (#18490): pacman hook
;;;   pacpak-git (#17862): flatpak wrapper using pacman syntax
;;;   pamac-cli (#17940): depends on pacman/libalpm
;;;   python-pypi2pkgbuild (#17822): converts PyPI to PKGBUILD
;;;   asp (#18310): Arch Build System tool
;;;   aurutils (#18332): AUR helper
;;;   mkinitcpio-clevis-hook (#18289): mkinitcpio hook
;;;   pikaur-static (#18227): AUR helper
;;;   pikaur-static-git (#18228): AUR helper
;;;
;;; MINGW_CROSS_COMPILE (10):
;;;   mingw-w64-cblas (#34115): mingw-w64 cross-compilation
;;;   mingw-w64-lapack (#34113): mingw-w64 cross-compilation
;;;   mingw-w64-soundtouch (#18330): mingw-w64 cross-compilation
;;;   mingw-w64-boost (#18273): mingw-w64 cross-compilation
;;;   mingw-w64-cppwinrt (#18256): mingw-w64 cross-compilation
;;;   mingw-w64-pcre2 (#18271): mingw-w64 cross-compilation
;;;   mingw-w64-spirv-tools (#18236): mingw-w64 cross-compilation
;;;   dxvk-async-git (#18160): needs mingw-w64 cross-compilation
;;;   mingw-w64-postgresql (#18207): mingw-w64 cross-compilation
;;;   mingw-w64-lame (#18195): mingw-w64 cross-compilation
;;;
;;; SOURCE_UNAVAILABLE (12):
;;;   deadbeef-mpris2-plugin (#19282): removed from AUR
;;;   linux6.18.22-1-lts-bin (#37932): removed from AUR
;;;   matlab-jre-bundled (#19363): removed from AUR
;;;   squareline-studio (#17812): commercial, no public download
;;;   luniistore (#18478): proprietary, no stable URL
;;;   simplicity-commander (#18419): proprietary SDK
;;;   wyc (#18777): Chinese commercial tool, no public source
;;;   clash-for-windows-chinese (#17433): project deleted from GitHub
;;;   euroscope-bin (#17945): Windows-only, no Linux binary
;;;   ut2004-gog (#18333): requires GOG purchase
;;;   inkdrop (#17819): commercial, paid license required
;;;   unrealtournament4 (#18319): requires Epic Games account
;;;
;;; LICENSE_ISSUE (7):
;;;   brother-mfc-l2400dw (#17797): proprietary binary blob
;;;   libfprint-2-tod1-broadcom-cv3plus (#17912): proprietary Broadcom driver
;;;   ttf-consolas-ligaturized (#20499): Microsoft Consolas license
;;;   factorio-space-age-experimental (#18211): requires purchased game
;;;   pianoteq-stage (#18221): proprietary commercial VST
;;;   anytxt-bin (#18238): freeware redistribution unclear
;;;   vmd (#18200): UIUC license restricts redistribution
;;;
;;; MULTILIB (2):
;;;   lib32-libglade (#18190): requires multilib support
;;;   lib32-sdl_sound (#18176): requires multilib support
;;;
;;; ANDROID_SDK (2):
;;;   android-platform-19 (#28671): Android SDK component
;;;   android-platform-21 (#23109): Android SDK component
;;;
;;; DEP_RESOLUTION_FAILED (20 — re-evaluated, still blocked):
;;;   gradience (#18644): not in AUR cache; python-material-color-utilities missing
;;;   gjs-nohammer (#18599): GNOME JS variant; use existing gjs package
;;;   virtualbox-svn (#18799): massive Qt5/SDL/XPCOM build infra
;;;   bakkesmod-steam (#17468): Windows-only Rocket League mod
;;;   lib32-opencl-nvidia-390xx (#17502): 32-bit NVIDIA legacy driver
;;;   python-home-assistant-frontend (#18556): 500+ Node.js deps
;;;   lightdm-webkit-theme-aether (#19028): lightdm-webkit2-greeter missing + abandoned
;;;   phonon-qt4-vlc (#18938): Qt4 EOL, not in Guix
;;;   quartz-utils-git (#18430): Rust crate vendoring needed
;;;   rdt-client (#18561): .NET 9.0 required, Guix has 8.0
;;;   texmacs-pure (#17873): Pure language not in Guix
;;;   gbm (#19044): mono-basic (VB.NET) not in Guix
;;;   mailnaggertray-git (#18592): mailnagger + python-zombie-imp chain
;;;   soapysdrplay3-luarvique-git (#18141): proprietary SDRPlay API
;;;   logstash (#18344): ALREADY_RESOLVED as logstash-bin
;;;   eddiscovery (#18272): nuget not in Guix
;;;   lib32-libxpm (#18177): multilib 32-bit
;;;   plank-reloaded-docklet-picky-git (#18237): bamf + plank not in Guix
;;;   wayprompt-git (#18188): 3 missing zig-* deps (zig-fcft, zig-ini, zig-spoon)
;;;   wldash (#18178): 50+ Rust crate dependencies
;;;
;;; OTHER (15):
;;;   sipgate-app-clinq (#18449): proprietary Electron VoIP app
;;;   knossu (#18461): custom C++ game engine
;;;   chromium-extension-arch-search (#17897): browser extension, not system pkg
;;;   futu-ftnn-wine (#18151): Wine wrapper for proprietary platform
;;;   python-gradio-pdf (#18463): 100+ Python dep chain via Gradio
;;;   fileoptimizer-bin (#18255): Windows app needing Wine
;;;   findbrokenpkgs (#18930): Arch tooling failure
;;;   vscodium-marketplace (#18695): VSCodium internal patching
;;;   coreutils-arch (#18197): Arch-specific coreutils command
;;;   kamilsss655-uv-k5-firmware-custom-git (#17909): arm-none-eabi cross-compile
;;;   libch343ser-git (#17880): kernel module
;;;   zfs-linux-hardened-headers (#17921): kernel-specific
;;;   zfs-linux-rt-headers (#17920): kernel-specific
;;;   zfs-linux-git-headers (#17919): kernel-specific
;;;   glibc-eac (#18182): patched glibc with DT_HASH
;;;   python2-gimp (#18180): Python 2 EOL
;;;   emerald (#18176): compiz-core not in Guix
