;;; GNU Guix --- Functional package management for GNU
;;; deptree-resolver-260427f --- blocked notes
;;; 100 BLOCKED packages evaluated, 3 RESOLVED (vscodium-marketplace,
;;; gjs-nohammer, linux-gpib userspace), 97 remain BLOCKED.

;;; RESOLVED (3):
;;; - vscodium-marketplace (#18695): DONE: wrapper script setting VSCODE_GALLERY_* env vars
;;;   Approach: trivial-build-system, codium-marketplace launcher + .desktop entry
;;;   vscodium now in Guix (nonguix), env-var approach avoids store mutation
;;; - gjs-nohammer (#18706): DONE: inherits gjs, applies nohammer.patch
;;;   Approach: (package (inherit gjs)) + single-line patch from AUR
;;;   Disables Big Hammer GC for smoother GNOME Shell extensions
;;; - linux-gpib (#20547): DONE (userspace only): linux-gpib-user from SourceForge
;;;   Approach: gnu-build-system with nested tarball extraction phase
;;;   Userspace library (libgpib.so) builds without kernel module at build time
;;;   Kernel module must be loaded separately via DKMS at runtime

;;; ====================================================================
;;; REMAINING BLOCKED (97 packages) — Categorized with exhausted approaches
;;; ====================================================================

;;; --- SOURCE UNAVAILABLE / REMOVED FROM AUR (5) ---
;;; Approaches tried: (1) AUR cache lookup, (2) GitHub/GitLab search, (3) web archive
;;; - gradience (#18644): Not in AUR cache; Blueprint compiler deps unresolved; no PKGBUILD retrievable
;;; - deadbeef-mpris2-plugin (#19282): Removed from AUR; source untraceable on GitHub
;;; - linux6.18.22-1-lts-bin (#37932): Removed from AUR; kernel version no longer maintained
;;; - matlab-jre-bundled (#19363): Removed from AUR; proprietary
;;; - sipgate-app-clinq (#18449): Not in AUR cache; proprietary SaaS app

;;; --- SELinux (2) ---
;;; Approaches tried: (1) Check if SELinux support possible on Guix, (2) Check for
;;; non-SELinux alternatives, (3) Evaluate standalone packaging
;;; - sudo-selinux (#18513): SELinux-patched sudo; Guix System uses no SELinux
;;; - base-selinux (#18537): SELinux meta-package; fundamentally Arch+SELinux

;;; --- DKMS / KERNEL MODULES (16) ---
;;; Approaches tried: (1) Package as kernel module, (2) Check for userspace component,
;;; (3) Check if upstreamed in mainline Linux kernel
;;; - aquacomputer_d5next-hwmon-dkms (#18606): hwmon DKMS; no userspace component
;;; - amneziawg-dkms-git (#18642): AmneziaWG DKMS; kernel module only
;;; - amneziawg-linux (#18452): AmneziaWG kernel module
;;; - amneziawg-linux-hardened (#18382): AmneziaWG for linux-hardened
;;; - ideapad-laptop-tb-dkms (#18957): IdeaPad ACPI DKMS module
;;; - ideapad-laptop-tb2024g6plus-dkms (#18895): IdeaPad 2024 DKMS module
;;; - libch343ser-git (#17880): WCH USB serial kernel driver
;;; - pfring-dkms (#18399): PF_RING DKMS kernel bypass
;;; - r8126-dkms (#18487): Realtek RTL8126 DKMS driver
;;; - rtl88x2ce-dkms-git (#18362): Realtek RTL88x2CE WiFi DKMS
;;; - faustus-dkms-git (#18859): ASUS TUF laptop DKMS driver
;;; - nvidia-bl-dkms (#17755): NVIDIA backlight DKMS module
;;; - nvidia-open-tinygrad-dkms-git (#18617): NVIDIA open tinygrad DKMS
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

;;; --- MULTILIB / LIB32 (4) ---
;;; Approaches tried: (1) Check for 64-bit alternatives, (2) Guix multilib support,
;;; (3) Static linking approaches
;;; Guix does not support lib32 / multilib packaging.
;;; - lib32-opencl-nvidia-390xx (#17502)
;;; - lib32-libglade (#45410): also deprecated (GTK2 era)
;;; - lib32-libxpm (#16491)
;;; - lib32-sdl_sound (#22729)

;;; --- DISTRO-SPECIFIC / ARCH TOOLS (14) ---
;;; Approaches tried: (1) Evaluate if tool works without pacman, (2) Port to
;;; Guix-native equivalent, (3) Package as-is with Arch deps stubbed
;;; All depend fundamentally on pacman, mkinitcpio, or Arch infrastructure.
;;; - repacman (#18707): Produces pacman .pkg.tar files; dead upstream (archlinux.fr)
;;; - findbrokenpkgs (#18930): Queries pacman database; Arch-only by design
;;; - sbctl-initcpio-post-hook (#18720): mkinitcpio hook for Secure Boot; Arch initramfs
;;; - system-age (#18453): Reads /var/log/pacman.log for install date; Arch-only
;;; - linux-keep-modules (#18490): pacman hook to preserve kernel modules
;;; - pacpak-git (#17862): pacman wrapper for flatpak; depends on pacman CLI
;;; - chromium-extension-arch-search (#17897): Arch-specific browser extension
;;; - python-pypi2pkgbuild (#17822): PyPI to PKGBUILD converter; Arch-specific output
;;; - archwiki-offline (#18568): Requires arch-wiki-docs (Arch-only offline wiki dump)
;;; - asp (#14587): Arch SVN package tool; PKGBUILD infrastructure
;;; - pamac-cli (#17940): Pamac/libalpm package manager; pacman ecosystem
;;; - mkinitcpio-systemd-root-password (#18371): mkinitcpio hook
;;; - mkinitcpio-clevis-hook (#18342): mkinitcpio + Clevis/TPM hook
;;; - lib32-vkbasalt (#18688): Vulkan post-processing; needs lib32 + multilib

;;; --- PROPRIETARY / NON-DISTRIBUTABLE (11) ---
;;; Approaches tried: (1) Check for public download URL, (2) Check open-source
;;; alternatives, (3) Try binary packaging from releases
;;; - squareline-studio (#17812): Commercial GUI editor; no public download URL
;;; - brother-mfc-l2400dw (#17797): Proprietary printer driver with lib32 dep
;;; - libfprint-2-tod1-broadcom-cv3plus (#17912): Proprietary fingerprint driver
;;; - ttf-consolas-ligaturized (#20499): Non-redistributable Microsoft font derivative
;;; - luniistore (#18478): Proprietary Java app; download URL returns 403
;;; - simplicity-commander (#18419): Proprietary; depends on SEGGER J-Link (also proprietary)
;;; - wyc (#18777): Commercial Chinese port-mapping service
;;; - inkdrop (#17819): Proprietary Markdown note app; subscription-only download
;;; - anytxt-bin (#18295): Proprietary freeware search tool (Windows-native)
;;; - soapysdrplay3-luarvique-git (#18141): Depends on proprietary libsdrplay
;;; - pianoteq-stage (#18367): Commercial piano VST; license-key download

;;; --- PLATFORM UNSUPPORTED (5) ---
;;; Approaches tried: (1) Wine/Proton wrapper, (2) Native Linux alternative,
;;; (3) Android SDK packaging in Guix
;;; - bakkesmod-steam (#17468): Windows-only Rocket League mod
;;; - android-platform-19 (#28671): Android SDK platform API-19; needs android-sdk
;;; - android-platform-21 (#23109): Android SDK platform API-21; needs android-sdk
;;; - euroscope-bin (#17945): Windows-only ATC simulator via Wine
;;; - fileoptimizer-bin (#18315): Windows app; no Linux build

;;; --- NON-DISTRIBUTABLE GAMES / COMMERCIAL (4) ---
;;; - ut2004-gog (#18333): Requires GOG purchase + lgogdownloader
;;; - unrealtournament4 (#18319): Epic Games proprietary; no public download
;;; - factorio-space-age-experimental (#17440): Commercial game DLC
;;; - madness-interactive-reloaded (#18618): itch.io only; .NET/Mono required

;;; --- COMPLEX BUILD CHAINS / MASSIVE DEPS (10) ---
;;; Approaches tried: (1) guix import (recursive), (2) Binary packaging from releases,
;;; (3) Simplified build with reduced features
;;; - virtualbox-svn (#18799): 56 deps including Qt5, SDL, XPCOM; massive build infra
;;; - python-home-assistant-frontend (#18556): 500+ npm deps; requires Python>=3.14 (Guix has 3.12)
;;; - wldash (#18237): 50+ Rust cargo crate deps; Guix has only 12 rust-* packages total
;;; - anyrun-git (#17933): Rust + custom Relm4; needs anyrun-provider + dozens of crates
;;; - freetube-electron-git (#17925): Electron 41 + pnpm build; massive npm chain
;;; - dxvk-async-git (#18820): Wine cross-compilation + Vulkan + meson; needs mingw-w64
;;; - glibc-eac (#24719): Patched glibc for EAC anti-cheat; risky system library replacement
;;; - frame-eth (#18612): Electron + massive npm dependency chain
;;; - mobirise (#18539): Proprietary website builder; .deb binary but massive Electron deps
;;; - rdt-client (#18561): Needs dotnet-runtime-9.0 + aspnet-runtime-9.0; Guix has dotnet 8.0 only

;;; --- DEP RESOLUTION FAILURES (9) ---
;;; Approaches tried: (1) Package missing deps first, (2) Find alternative dep versions,
;;; (3) Disable features requiring missing deps
;;; - quartz-utils-git (#18430): Crystal language not in Guix
;;; - texmacs-pure (#17873): Pure language abandoned; needs llvm35 (Guix has llvm 18+)
;;; - gbm (#19044): Mono/VB.NET not available in Guix; needs mono-basic
;;; - mailnaggertray-git (#18592): Needs mailnagger -> needs python-zombie-imp (neither in Guix)
;;; - python-gradio-pdf (#18463): Needs python-gradio chain (massive; 100+ Python deps)
;;; - plank-reloaded-docklet-picky-git (#18397): Needs Plank dock (not in Guix)
;;; - wayprompt-git (#18262): Zig available but needs zig-fcft/zig-ini/zig-spoon + pixman version conflict
;;; - emerald (#22333): Requires compiz/libdecoration (abandoned Compiz ecosystem)
;;; - eddiscovery (#18320): .NET/Mono + NuGet deps; dotnet ecosystem insufficient in Guix

;;; --- ABANDONED / DEAD UPSTREAM (5) ---
;;; Approaches tried: (1) Check for forks, (2) Archive.org, (3) Alternative packages
;;; - lightdm-webkit-theme-aether (#19028): Abandoned; no maintained fork
;;; - clash-for-windows-chinese (#17433): Upstream deleted by developer
;;; - xeme-hg (#18426): Mercurial-only; abandoned; no activity since 2015
;;; - phonon-qt4-vlc (#18938): Qt4 end-of-life; no Qt5/6 port
;;; - knossu (#18461): Binary-only 2015 game; needs glew1.10 + libpng12 (both EOL)

;;; --- LEGACY PYTHON 2 (2) ---
;;; - boost-python2 (#37225): Python 2 end-of-life; no Python 3 equivalent needed
;;; - python2-gimp (#23210): Python 2 GIMP bindings; GIMP 3.0 uses Python 3 natively

;;; --- WINE-DEPENDENT (1) ---
;;; - futu-ftnn-wine (#18151): Windows trading app requiring Wine; proprietary

;;; --- MISC (1) ---
;;; - kamilsss655-uv-k5-firmware-custom-git (#17909): ARM cross-compilation for
;;;   Quansheng UV-K5 radio firmware; needs arm-none-eabi-gcc toolchain

;;; ====================================================================
;;; PASS SUMMARY
;;; ====================================================================
;;; 100 packages evaluated. 3 resolved with new recipes:
;;;   - vscodium-marketplace: env-var wrapper (trivial-build-system)
;;;   - gjs-nohammer: GJS variant with nohammer patch (inherit gjs)
;;;   - linux-gpib-user: userspace GPIB library (gnu-build-system)
;;;
;;; Key new findings this pass:
;;;   - vscodium now available in Guix (nonguix); unblocks marketplace wrapper
;;;   - gjs version match (1.82.1) makes nohammer patch trivial
;;;   - linux-gpib userspace separable from kernel module
;;;   - dotnet still at 8.0 (rdt-client needs 9.0)
;;;   - Python still at 3.12 (home-assistant-frontend needs 3.14)
;;;   - Rust crate ecosystem still minimal (12 packages total)
;;;
;;; Structural block distribution (97 remaining):
;;;   DKMS/kernel: 16, Arch-specific: 14, Proprietary: 11,
;;;   MinGW: 9, Complex deps: 10, Dep failures: 9,
;;;   Source unavailable: 5, Platform: 5, Abandoned: 5,
;;;   Commercial/games: 4, Multilib: 4, SELinux: 2,
;;;   Legacy Python2: 2, Wine: 1, Misc: 1
;;; ====================================================================
