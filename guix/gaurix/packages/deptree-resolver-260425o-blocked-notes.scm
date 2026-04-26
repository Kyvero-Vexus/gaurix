;;; Blocked notes for deptree-resolver-260425o
;;; Generated: 2026-04-26 00:00:00 UTC
;;; 100 BLOCKED packages evaluated, 1 resolved (ls++-git)
;;; 3 new dependencies packaged (perl-term-extendedcolor, perl-file-lscolor, ls++)
;;; 99 remain BLOCKED

(define-module (gaurix packages deptree-resolver-260425o-blocked-notes))

;;; gradience (#18644): BLOCKED — AUR_REPO_DELETED: project archived Jul 2024, removed from AUR; not in AUR cache
;;; sudo-selinux (#18513): BLOCKED — SELINUX_SPECIFIC: requires SELinux infrastructure; Guix does not use SELinux MAC framework
;;; base-selinux (#18537): BLOCKED — SELINUX_SPECIFIC: SELinux meta-package; Guix does not use SELinux
;;; virtualbox-svn (#18799): BLOCKED — BUILD_SYSTEM_TOO_COMPLEX: 53+ deps including kernel modules, VBOXDRV, proprietary Extension Pack
;;; deadbeef-mpris2-plugin (#19282): BLOCKED — ABANDONED_UPSTREAM: not in AUR cache; functionality merged into DeaDBeeF 1.10.2+
;;; matlab-jre-bundled (#19363): BLOCKED — SOURCE_UNAVAILABLE: proprietary MATLAB component; not in AUR cache
;;; sipgate-app-clinq (#18449): BLOCKED — SOURCE_UNAVAILABLE: proprietary Electron app; not in AUR cache
;;; squareline-studio (#17812): BLOCKED — PROPRIETARY_BINARY: commercial binary GUI editor; no source code available
;;; aquacomputer_d5next-hwmon-dkms (#18606): BLOCKED — DKMS_KERNEL_MODULE: HWMON DKMS module; Guix uses different kernel module model
;;; bakkesmod-steam (#17468): BLOCKED — PLATFORM_UNSUPPORTED: Windows-only Rocket League mod tool
;;; edgeimpulse-cli (#18574): BLOCKED — DEP_RESOLUTION_FAILED: npm package with deep node dependency tree
;;; librewolf-extension-ublock-origin-bin (#18355): BLOCKED — BROWSER_EXTENSION: browser extension .xpi; install via browser extension manager
;;; librewolf-tridactyl-native-bin (#18285): BLOCKED — BROWSER_EXTENSION: browser native messaging host + .xpi
;;; luniistore (#18478): BLOCKED — SOURCE_UNAVAILABLE: proprietary Java app; download returns HTTP 403
;;; mkinitcpio-systemd-root-password (#18371): BLOCKED — DISTRO_SPECIFIC: Arch Linux mkinitcpio hook
;;; repacman (#18707): BLOCKED — DISTRO_SPECIFIC: pacman report tool; Arch-specific
;;; simplicity-commander (#18419): BLOCKED — SOURCE_UNAVAILABLE: proprietary Silicon Labs binary; download URL dead
;;; amneziawg-dkms-git (#18642): BLOCKED — DKMS_KERNEL_MODULE: AmneziaWG DKMS kernel module
;;; amneziawg-linux (#18452): BLOCKED — DKMS_KERNEL_MODULE: AmneziaWG kernel module
;;; amneziawg-linux-hardened (#18382): BLOCKED — DKMS_KERNEL_MODULE: AmneziaWG for hardened kernel
;;; android-platform-19 (#28671): BLOCKED — PLATFORM_UNSUPPORTED: proprietary Google Android SDK platform
;;; android-platform-21 (#23109): BLOCKED — PLATFORM_UNSUPPORTED: proprietary Google Android SDK platform
;;; archwiki-offline (#18568): BLOCKED — DISTRO_SPECIFIC: Arch Wiki offline reader
;;; aws-amplify-cli (#18269): BLOCKED — DEP_RESOLUTION_FAILED: massive npm dependency tree (hundreds of transitive deps)
;;; aws-cdk (#18298): BLOCKED — DEP_RESOLUTION_FAILED: massive npm dependency tree
;;; brother-mfc-l2400dw (#17797): BLOCKED — PROPRIETARY_BINARY: binary-only Brother printer driver; non-redistributable
;;; emmet-language-server (#18958): BLOCKED — DEP_RESOLUTION_FAILED: npm package with deep node dependency tree
;;; faustus-dkms-git (#18859): BLOCKED — DKMS_KERNEL_MODULE: ASUS fan control DKMS module
;;; findbrokenpkgs (#18930): BLOCKED — DISTRO_SPECIFIC: pacman broken-package finder; Arch-specific
;;; ideapad-laptop-tb-dkms (#18957): BLOCKED — DKMS_KERNEL_MODULE: Lenovo Ideapad tablet DKMS module
;;; ideapad-laptop-tb2024g6plus-dkms (#18895): BLOCKED — DKMS_KERNEL_MODULE: Lenovo Ideapad 2024 DKMS module
;;; knossu (#18461): BLOCKED — SOURCE_UNAVAILABLE: proprietary binary from 2015; requires legacy glew1.10 + libpng12
;;; lib32-opencl-nvidia-390xx (#17502): BLOCKED — MULTILIB_UNSUPPORTED: 32-bit multilib not supported on Guix
;;; libch343ser-git (#17880): BLOCKED — SOURCE_UNAVAILABLE: AUR repository is empty; no PKGBUILD
;;; libfprint-2-tod1-broadcom-cv3plus (#17912): BLOCKED — PROPRIETARY_BINARY: non-redistributable fingerprint driver
;;; ls++-git (#21854): RESOLVED — recipe in deptree-resolver-260425o.scm
;;;   (ls++ v0.36, perl-build-system, Perl license)
;;;   New dependencies packaged: perl-term-extendedcolor v0.504, perl-file-lscolor v0.544
;;; mingw-w64-cblas (#34115): BLOCKED — MINGW_CROSS_COMPILATION: Windows cross-compilation target
;;; mingw-w64-lapack (#34113): BLOCKED — MINGW_CROSS_COMPILATION: Windows cross-compilation target
;;; mingw-w64-soundtouch (#18330): BLOCKED — MINGW_CROSS_COMPILATION: Windows cross-compilation target
;;; nodejs-cspell (#18215): BLOCKED — DEP_RESOLUTION_FAILED: npm monorepo with deep node dependency tree
;;; osmtogeojson (#18417): BLOCKED — DEP_RESOLUTION_FAILED: npm package with deep node dependency tree
;;; pfring-dkms (#18399): BLOCKED — DKMS_KERNEL_MODULE: PF_RING network capture DKMS module
;;; python-home-assistant-frontend (#18556): BLOCKED — DEP_RESOLUTION_FAILED: 115MB pre-built JS frontend; cannot build from source
;;; r8126-dkms (#18487): BLOCKED — DKMS_KERNEL_MODULE: Realtek r8126 Ethernet DKMS module
;;; receitanet (#18413): BLOCKED — SOURCE_UNAVAILABLE: proprietary Brazilian government tax software
;;; sbctl-initcpio-post-hook (#18720): BLOCKED — DISTRO_SPECIFIC: sbctl mkinitcpio hook; Arch-specific
;;; system-age (#18453): BLOCKED — DISTRO_SPECIFIC: reads pacman install date; Arch-specific
;;; ttf-consolas-ligaturized (#20499): BLOCKED — NON_DISTRIBUTABLE: derivative of proprietary Microsoft Consolas font
;;; vscodium-marketplace (#18695): BLOCKED — DISTRO_SPECIFIC: Arch pacman hook for VSCodium marketplace
;;; wyc (#18777): BLOCKED — SOURCE_UNAVAILABLE: proprietary Chinese tunneling binary
;;; beammp-launcher-git (#18346): BLOCKED — DEP_RESOLUTION_FAILED: vcpkg build model incompatible with Guix
;;; java-language-server (#18379): BLOCKED — DEP_RESOLUTION_FAILED: Maven build downloads 100+ deps at build time
;;; libarchive-static (#18758): BLOCKED — TOOLING_FAILURE: Arch emergency recovery tool; static musl build bundling 7 libs
;;; lightdm-webkit-theme-aether (#19028): BLOCKED — DEP_RESOLUTION_FAILED: needs lightdm-webkit2-greeter + npm/webpack
;;; linux-keep-modules (#18490): BLOCKED — DISTRO_SPECIFIC: Arch pacman hook for kernel modules
;;; nfuspire-git (#18401): BLOCKED — DEP_RESOLUTION_FAILED: needs libnspire (TI calculator lib, only 1 commit upstream)
;;; nginx-mainline-mod-njs (#18380): BLOCKED — DEP_RESOLUTION_FAILED: no nginx dynamic module build infrastructure in Guix
;;; nodejs-nestjs-cli (#18753): BLOCKED — DEP_RESOLUTION_FAILED: npm package with deep node dependency tree
;;; nvidia-bl-dkms (#17755): BLOCKED — DKMS_KERNEL_MODULE: NVIDIA backlight DKMS module
;;; pacpak-git (#17862): BLOCKED — DISTRO_SPECIFIC: pacman + flatpak wrapper; Arch-specific
;;; phonon-qt4-vlc (#18938): BLOCKED — LEGACY_QT4: requires Qt4 (EOL since 2015)
;;; quartz-utils-git (#18430): BLOCKED — DEP_RESOLUTION_FAILED: Crystal language not available in Guix
;;; rdt-client (#18561): BLOCKED — DEP_RESOLUTION_FAILED: needs .NET 9/10; Guix only has dotnet 8
;;; sommelier-git (#18396): BLOCKED — DEP_RESOLUTION_FAILED: ChromeOS platform2 monorepo; no tagged releases
;;; texmacs-pure (#17873): BLOCKED — DEP_RESOLUTION_FAILED: Pure language defunct; needs LLVM 3.5
;;; chromium-extension-arch-search (#17897): BLOCKED — DISTRO_SPECIFIC: Arch search browser extension
;;; clash-for-windows-chinese (#17433): BLOCKED — ABANDONED_UPSTREAM: GitHub repo deleted
;;; eclipse-pydev (#17948): BLOCKED — DEP_RESOLUTION_FAILED: Eclipse IDE platform not available in Guix
;;; euroscope-bin (#17945): BLOCKED — PLATFORM_UNSUPPORTED: Windows-only proprietary via Wine
;;; gbm (#19044): BLOCKED — DEP_RESOLUTION_FAILED: VB.NET/Mono; VB.NET compiler not supported in Guix
;;; gephi-git (#18425): BLOCKED — DEP_RESOLUTION_FAILED: Maven build + NetBeans Platform; massive dep tree
;;; lobe-chat (#18479): BLOCKED — DEP_RESOLUTION_FAILED: Next.js/pnpm monorepo; massive npm deps
;;; plugin-autenticacao-gov-pt (#18404): BLOCKED — SOURCE_UNAVAILABLE: binary .deb; no source repository
;;; qtspim-iconfix (#18426): BLOCKED — BUILD_FAILED: SVN-only source (SourceForge); no git mirror or release tarball
;;; rtl88x2ce-dkms-git (#18477): BLOCKED — DKMS_KERNEL_MODULE: Realtek WiFi DKMS module
;;; urbanterror (#18406): BLOCKED — SOURCE_UNAVAILABLE: proprietary game data; download broken
;;; ut2004-gog (#18427): BLOCKED — NON_DISTRIBUTABLE: commercial GOG game
;;; zfs-linux-hardened-headers (#18434): BLOCKED — KERNEL_SPECIFIC: kernel-version-specific ZFS headers
;;; zfs-linux-rt-headers (#18435): BLOCKED — KERNEL_SPECIFIC: kernel-version-specific ZFS headers
;;; futu-ftnn-wine (#18460): BLOCKED — PROPRIETARY_BINARY: proprietary Windows binary via Wine
;;; inkdrop (#18475): BLOCKED — SOURCE_UNAVAILABLE: proprietary commercial Electron app
;;; kamilsss655-uv-k5-firmware-custom-git (#18482): BLOCKED — CROSS_COMPILATION: needs ARM cross-compilation toolchain for UV-K5 radio
;;; mailnaggertray-git (#18491): BLOCKED — DEP_RESOLUTION_FAILED: 149 Rust crate deps; cargo-build-system infeasible at scale
;;; nvidia-open-tinygrad-dkms-git (#18506): BLOCKED — TOOLING_FAILURE: empty AUR repo; NVIDIA needs proprietary firmware
;;; pamac-cli (#18401): BLOCKED — DISTRO_SPECIFIC: Package Manager for ALPM (pacman); Arch-specific
;;; pulumi-git (#18556): BLOCKED — DEP_RESOLUTION_FAILED: large multi-language project (Go+Node+Python)
;;; python-gradio-pdf (#18558): BLOCKED — DEP_RESOLUTION_FAILED: needs python-gradio (massive dep tree)
;;; python-jaxlib-bin (#18563): BLOCKED — SOURCE_UNAVAILABLE: binary wheel; source build requires Bazel
;;; python-pypi2pkgbuild (#18568): BLOCKED — DISTRO_SPECIFIC: PyPI to PKGBUILD converter; Arch-specific
;;; soapysdrplay3-luarvique-git (#18597): BLOCKED — PROPRIETARY_DEP: depends on SDRPlay API (proprietary)
;;; unrealtournament4 (#18613): BLOCKED — NON_DISTRIBUTABLE: proprietary Epic Games
;;; zfs-linux-git-headers (#18621): BLOCKED — KERNEL_SPECIFIC: kernel-version-specific ZFS headers
;;; asp (#18636): BLOCKED — DISTRO_SPECIFIC: Arch Build Source management tool
;;; aurutils (#18651): BLOCKED — DISTRO_SPECIFIC: AUR helper tools
;;; awk-language-server (#18656): BLOCKED — DEP_RESOLUTION_FAILED: npm/TypeScript + tree-sitter deps
;;; factorio-space-age-experimental (#18672): BLOCKED — NON_DISTRIBUTABLE: proprietary commercial game
;;; fileoptimizer-bin (#18683): BLOCKED — PLATFORM_UNSUPPORTED: Wine-based Windows app
;;; gstreamermm-docs (#18701): BLOCKED — SOURCE_UNAVAILABLE: needs gstreamermm (2017 API, incompatible with modern GStreamer)
;;; lib32-libglade (#18456): BLOCKED — MULTILIB_UNSUPPORTED: 32-bit multilib not supported on Guix
;;; mingw-w64-boost (#18503): BLOCKED — MINGW_CROSS_COMPILATION: Windows cross-compilation target
