# Blocked Dependency Tree

**Generated:** 2026-04-27T02:53:22Z  
**Pass ID:** deptree-resolver-260426p  

## Summary

| Metric | Value |
|---|---|
| Total BLOCKED | 547 |
| In AUR cache | 534 |
| Zero blocked deps | 531 |

## Blocking Reason Distribution

| Reason | Count |
|---|---|
| NEEDS_RECIPE_DESIGN | 83 |
| NEEDS_RECIPE_DESIGN_EXHAUSTED | 82 |
| DEP_RESOLUTION_FAILED | 80 |
| TOOLING_FAILURE | 36 |
| KERNEL_MODULE | 29 |
| FETCH_FAILED | 24 |
| PROPRIETARY_LICENSE | 21 |
| ARCH_SPECIFIC | 17 |
| SOURCE_UNAVAILABLE | 12 |
| NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aa) | 12 |
| NON_DISTRIBUTABLE | 11 |
| INFEASIBLE_BUILD | 10 |
| BUILD_FAILED | 9 |
| LIB32_UNSUPPORTED | 8 |
| MINGW_CROSS_COMPILATION | 8 |
| LICENSE_REVIEW_NEEDED | 7 |
| MISSING_SOURCE | 6 |
| MULTILIB_UNSUPPORTED | 6 |
| NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aj) | 6 |
| NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413ah) | 6 |
| PROPRIETARY_BINARY | 5 |
| PLATFORM_UNSUPPORTED | 4 |
| PROPRIETARY_CLOSED_SOURCE | 4 |
| DKMS_UNSUPPORTED | 4 |
| AUR_REPO_DELETED | 4 |
| DISTRO_SPECIFIC | 3 |
| INITRAMFS_TOOL | 3 |
| COMPLEX_DEPS | 3 |
| ARCH_PACKAGE_MANAGER | 3 |
| COMPLEX_BUILD_DEPS | 3 |
| HARDWARE_SPECIFIC | 3 |
| PROPRIETARY_SDK | 2 |
| NEEDS_CARGO_VENDORING | 2 |
| BUILD_SYSTEM_TOO_COMPLEX | 2 |
| ABANDONED_UPSTREAM | 2 |
| LEGACY_PYTHON2 | 2 |
| DISTRO_SPECIFIC (deptree-resolver-260424v) | 1 |
| PROPRIETARY_SERVICE | 1 |
| VERY_LOW_MATURITY | 1 |
| FOREIGN_PACKAGE_MANAGER | 1 |
| NO_UPSTREAM_SOURCE | 1 |
| NO_LICENSE | 1 |
| DKMS_KERNEL_MODULE | 1 |
| cargo-build-system requires vendored crate deps; crmne/op-cache has no tags, only git commits; tried | 1 |
| PLATFORM_SPECIFIC | 1 |
| SYSTEMD_SPECIFIC | 1 |
| PROPRIETARY_FONT_LICENSE | 1 |
| cargo-build-system requires vendored crate deps; NexusXe/fw-ec-utils has no tags, needs cargo-nightly; tried | 1 |
| MISSING_BUILD_TOOLS | 1 |
| LIB32_UNSUPPORTED + PROPRIETARY | 1 |
| MISSING_DEP | 1 |
| CROSS_TOOLCHAIN_COMPLEX | 1 |
| MISSING_DEPENDENCY | 1 |
| COMPLEX_BUILD | 1 |
| proprietary download requires web-scraping token from symless.com landing page; no static download URL exists; tried | 1 |
| NONFREE_LICENSE | 1 |
| PROPRIETARY_SERVER | 1 |
| NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413b; heavy KDE6/Qt6/polkit-qt6 dep chain. See blocked-notes. | 1 |
| KERNEL_HEADERS | 1 |
| KERNEL_BUILD | 1 |
| PROPRIETARY_PLATFORM | 1 |

## Priority Queue (Top 200)

| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps | Reason |
|---|---|---|---|---|---|---|
| 1 | sudo-selinux | 18513 | 0 | 6 | 8 | TOOLING_FAILURE: SELinux support; Guix does not us |
| 2 | devtools-git | 18696 | 0 | 2 | 12 | TOOLING_FAILURE: Arch Linux package maintainer too |
| 3 | gradience | 18644 | 0 | 1 | 0 | DEP_RESOLUTION_FAILED: Adwaita theme editor; Pytho |
| 4 | pamac-cli | 17940 | 0 | 1 | 5 | DISTRO_SPECIFIC |
| 5 | aurutils | 11354 | 0 | 1 | 6 | DISTRO_SPECIFIC |
| 6 | auracle-git | 2160 | 0 | 1 | 10 | DISTRO_SPECIFIC (deptree-resolver-260424v) |
| 7 | gjs-nohammer | 18706 | 0 | 1 | 17 | DEP_RESOLUTION_FAILED: variant of GJS requiring fu |
| 8 | python-urllib3-future-git | 18341 | 0 | 1 | 17 | NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_PYTHON_DEPS |
| 9 | base-selinux | 18537 | 0 | 1 | 18 | TOOLING_FAILURE: Arch SELinux meta-package; SELinu |
| 10 | nautilus-typeahead | 676 | 0 | 1 | 38 | NEEDS_RECIPE_DESIGN |
| 11 | virtualbox-svn | 18799 | 0 | 1 | 53 | DEP_RESOLUTION_FAILED: VirtualBox SVN needs massiv |
| 12 | teb-obs | 18491 | 0 | 1 | 67 | DEP_RESOLUTION_FAILED: OBS fork requiring OBS sour |
| 13 | audiobookshelf | 3880 | 0 | 0 | 0 | MISSING_SOURCE: not in AUR metadata |
| 14 | bulky | 5151 | 0 | 0 | 0 | MISSING_SOURCE: not in AUR metadata |
| 15 | dbeaver | 15 | 0 | 0 | 0 | MISSING_SOURCE: not in AUR metadata |
| 16 | deadbeef-mpris2-plugin | 19282 | 0 | 0 | 0 | SOURCE_UNAVAILABLE: not found in AUR metadata cach |
| 17 | diffnav-bin | 5141 | 0 | 0 | 0 | NEEDS_RECIPE_DESIGN |
| 18 | fluxdown-bin | 3420 | 0 | 0 | 0 | MISSING_SOURCE |
| 19 | gram-editor-bin | 5457 | 0 | 0 | 0 | MISSING_SOURCE |
| 20 | hypnotix | 398 | 0 | 0 | 0 | MISSING_SOURCE |
| 21 | linux6.18.22-1-lts-bin | 37932 | 0 | 0 | 0 | SOURCE_UNAVAILABLE: not found in AUR metadata cach |
| 22 | matlab-jre-bundled | 19363 | 0 | 0 | 0 | SOURCE_UNAVAILABLE: not found in AUR metadata cach |
| 23 | pardf | 13448 | 0 | 0 | 0 | NEEDS_RECIPE_DESIGN_EXHAUSTED — UNCLEAR_UPSTREAM:  |
| 24 | sipgate-app-clinq | 18449 | 0 | 0 | 0 | NEEDS_RECIPE_DESIGN: proprietary VoIP Electron app |
| 25 | squareline-studio | 17812 | 0 | 0 | 0 | PROPRIETARY_BINARY |
| 26 | apple-fonts | 141 | 0 | 0 | 1 | NON_DISTRIBUTABLE |
| 27 | aquacomputer_d5next-hwmon-dkms | 18606 | 0 | 0 | 1 | TOOLING_FAILURE: DKMS hwmon kernel module; Guix ke |
| 28 | bakkesmod-steam | 17468 | 0 | 0 | 1 | PLATFORM_UNSUPPORTED |
| 29 | luniistore | 18478 | 0 | 0 | 1 | SOURCE_UNAVAILABLE: proprietary device manager; no |
| 30 | mkinitcpio-systemd-root-password | 18371 | 0 | 0 | 1 | ARCH_SPECIFIC: mkinitcpio hook; not applicable to  |
| 31 | netpad-vnext-bin | 5637 | 0 | 0 | 1 | NEEDS_RECIPE_DESIGN_EXHAUSTED: DOTNET_UNSUPPORTED: |
| 32 | r8125-dkms | 363 | 0 | 0 | 1 | KERNEL_MODULE |
| 33 | repacman | 18707 | 0 | 0 | 1 | TOOLING_FAILURE: Arch/pacman-specific tool; not ap |
| 34 | simplicity-commander | 18419 | 0 | 0 | 1 | SOURCE_UNAVAILABLE: proprietary Silicon Labs tool; |
| 35 | skillshare | 2920 | 0 | 0 | 1 | PROPRIETARY_SERVICE |
| 36 | amneziawg-dkms-git | 18642 | 0 | 0 | 2 | TOOLING_FAILURE: AmneziaWG DKMS kernel module; DKM |
| 37 | amneziawg-linux | 18452 | 0 | 0 | 2 | TOOLING_FAILURE: DKMS kernel module; Guix kernel m |
| 38 | amneziawg-linux-hardened | 18382 | 0 | 0 | 2 | TOOLING_FAILURE: DKMS kernel module; Guix kernel m |
| 39 | android-platform-19 | 28671 | 0 | 0 | 2 | PLATFORM_UNSUPPORTED |
| 40 | android-platform-21 | 23109 | 0 | 0 | 2 | PLATFORM_UNSUPPORTED |
| 41 | archwiki-offline | 18568 | 0 | 0 | 2 | TOOLING_FAILURE: Arch-specific wiki viewer relying |
| 42 | bcachefs-kernel-dkms-git | 1506 | 0 | 0 | 2 | KERNEL_MODULE |
| 43 | brother-mfc-l2400dw | 17797 | 0 | 0 | 2 | PROPRIETARY_BINARY |
| 44 | etcd | 5160 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 45 | faustus-dkms-git | 18859 | 0 | 0 | 2 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f |
| 46 | findbrokenpkgs | 18930 | 0 | 0 | 2 | TOOLING_FAILURE: see recipe-resolver-260425f-block |
| 47 | flclashx-bin | 4730 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 48 | gowatch | 5172 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 49 | harbor-wave | 14201 | 0 | 0 | 2 | FETCH_FAILED |
| 50 | ideapad-laptop-tb-dkms | 18957 | 0 | 0 | 2 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f |
| 51 | ideapad-laptop-tb2024g6plus-dkms | 18895 | 0 | 0 | 2 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f |
| 52 | jdk17-graalvm-ee-bin | 5178 | 0 | 0 | 2 | PROPRIETARY_CLOSED_SOURCE |
| 53 | knossu | 18461 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN: Doom-like game; custom C++ en |
| 54 | lib32-opencl-nvidia-390xx | 17502 | 0 | 0 | 2 | MULTILIB_UNSUPPORTED |
| 55 | lib32-openssl-1.1 | 11910 | 0 | 0 | 2 | LIB32_UNSUPPORTED |
| 56 | libch343ser-git | 17880 | 0 | 0 | 2 | BUILD_FAILED: Linux kernel module for USB serial c |
| 57 | libfprint-2-tod1-broadcom-cv3plus | 17912 | 0 | 0 | 2 | LICENSE_REVIEW_NEEDED: proprietary Broadcom finger |
| 58 | limine-booster | 14240 | 0 | 0 | 2 | FETCH_FAILED |
| 59 | mdbook-epub | 13376 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED: |
| 60 | mingw-w64-cblas | 34115 | 0 | 0 | 2 | MINGW_CROSS_COMPILATION |
| 61 | mingw-w64-lapack | 34113 | 0 | 0 | 2 | MINGW_CROSS_COMPILATION |
| 62 | mingw-w64-soundtouch | 18330 | 0 | 0 | 2 | TOOLING_FAILURE: MinGW cross-compilation not suppo |
| 63 | mingw-w64-zlib-ng | 3363 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260 |
| 64 | mkinitcpio-archlogo | 13249 | 0 | 0 | 2 | ARCH_SPECIFIC |
| 65 | mkinitcpio-systemd-extras | 723 | 0 | 0 | 2 | INITRAMFS_TOOL — Arch-specific initramfs hook |
| 66 | mod_maxminddb | 12757 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN: Apache HTTPD module for MaxMi |
| 67 | nbfc | 5254 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 68 | ndi-sdk | 9867 | 0 | 0 | 2 | PROPRIETARY_SDK |
| 69 | ntfsplus-dkms-git | 12912 | 0 | 0 | 2 | KERNEL_MODULE |
| 70 | pfring-dkms | 18399 | 0 | 0 | 2 | TOOLING_FAILURE: DKMS kernel module; Guix kernel m |
| 71 | podserv-b-git | 3037 | 0 | 0 | 2 | VERY_LOW_MATURITY — Rust podcast server (github.co |
| 72 | portage | 7628 | 0 | 0 | 2 | FOREIGN_PACKAGE_MANAGER — Gentoo's Portage; not ap |
| 73 | python-home-assistant-frontend | 18556 | 0 | 0 | 2 | DEP_RESOLUTION_FAILED: HA web frontend; massive No |
| 74 | quantumlauncher-bin | 4790 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 75 | r8126-dkms | 18487 | 0 | 0 | 2 | TOOLING_FAILURE: DKMS kernel module; Guix kernel m |
| 76 | r8152-dkms | 8888 | 0 | 0 | 2 | KERNEL_MODULE |
| 77 | ryzen_smu-dkms-git | 244 | 0 | 0 | 2 | KERNEL_MODULE |
| 78 | sbctl-initcpio-post-hook | 18720 | 0 | 0 | 2 | TOOLING_FAILURE: Arch mkinitcpio-specific hook; Gu |
| 79 | spinwheel-pipewire | 3089 | 0 | 0 | 2 | NO_UPSTREAM_SOURCE — Terminal wheel spinner (codeb |
| 80 | system-age | 18453 | 0 | 0 | 2 | TOOLING_FAILURE: Arch-specific tool reading pacman |
| 81 | system76-acpi-dkms | 2787 | 0 | 0 | 2 | DKMS_UNSUPPORTED — DKMS kernel module; Guix manage |
| 82 | system76-io-dkms | 2786 | 0 | 0 | 2 | DKMS_UNSUPPORTED — DKMS kernel module; Guix manage |
| 83 | ttf-consolas-ligaturized | 20499 | 0 | 0 | 2 | NON_DISTRIBUTABLE |
| 84 | vscodium-marketplace | 18695 | 0 | 0 | 2 | TOOLING_FAILURE: VSCodium marketplace patch; requi |
| 85 | webos-dev-manager-bin | 5245 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 86 | wyc | 18777 | 0 | 0 | 2 | SOURCE_UNAVAILABLE: Chinese commercial tool; no st |
| 87 | xpad-dkms-git | 7487 | 0 | 0 | 2 | KERNEL_MODULE |
| 88 | yaac | 5212 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 89 | zenpower3-dkms | 667 | 0 | 0 | 2 | KERNEL_MODULE |
| 90 | zenpower3-dkms-git | 13242 | 0 | 0 | 2 | KERNEL_MODULE |
| 91 | zenpower5-dkms-git | 12908 | 0 | 0 | 2 | KERNEL_MODULE |
| 92 | aic8800-dkms | 10156 | 0 | 0 | 3 | KERNEL_MODULE |
| 93 | ajantv2-dkms | 10154 | 0 | 0 | 3 | KERNEL_MODULE |
| 94 | ampcode | 5258 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 95 | architect-git | 14243 | 0 | 0 | 3 | FETCH_FAILED |
| 96 | artificial-rage-git | 14215 | 0 | 0 | 3 | FETCH_FAILED |
| 97 | autofirma | 5627 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN_EXHAUSTED: JAVA_COMPLEX: Clien |
| 98 | buf-git | 5241 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 99 | dela | 5071 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 100 | disk_usage | 14224 | 0 | 0 | 3 | FETCH_FAILED |
| 101 | dpibreak | 3075 | 0 | 0 | 3 | NEEDS_CARGO_VENDORING — Rust DPI circumvention too |
| 102 | droidcam-dkms-git | 9915 | 0 | 0 | 3 | KERNEL_MODULE |
| 103 | fish-session | 3084 | 0 | 0 | 3 | NO_LICENSE — Fish shell session manager (github.co |
| 104 | framework-control-bin | 3072 | 0 | 0 | 3 | BUILD_SYSTEM_TOO_COMPLEX — Framework Laptop contro |
| 105 | jellyfin-rpc-bin | 4799 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 106 | kernelsu-dkms | 12374 | 0 | 0 | 3 | KERNEL_MODULE |
| 107 | lib32-libvpx1.3 | 11975 | 0 | 0 | 3 | LIB32_UNSUPPORTED |
| 108 | lightdm-webkit-theme-aether | 19028 | 0 | 0 | 3 | ABANDONED_UPSTREAM |
| 109 | linux-apfs-rw-dkms-git | 6973 | 0 | 0 | 3 | KERNEL_MODULE |
| 110 | linux-keep-modules | 18490 | 0 | 0 | 3 | TOOLING_FAILURE: Arch-specific pacman hook; Guix u |
| 111 | livekit | 14229 | 0 | 0 | 3 | FETCH_FAILED |
| 112 | llvm-cbe-git | 3258 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260 |
| 113 | local-llama-bin | 14238 | 0 | 0 | 3 | FETCH_FAILED |
| 114 | luajit-sdl2-git | 14213 | 0 | 0 | 3 | FETCH_FAILED |
| 115 | luajit-sdl3-git | 14210 | 0 | 0 | 3 | FETCH_FAILED |
| 116 | mermaid-ascii-git | 14244 | 0 | 0 | 3 | FETCH_FAILED |
| 117 | mkinitcpio-btrfs | 10987 | 0 | 0 | 3 | ARCH_SPECIFIC |
| 118 | mkinitcpio-colors-git | 10383 | 0 | 0 | 3 | ARCH_SPECIFIC |
| 119 | mkinitcpio-wifi | 13130 | 0 | 0 | 3 | ARCH_SPECIFIC |
| 120 | mkinitcpio-zerotier | 794 | 0 | 0 | 3 | ARCH_SPECIFIC |
| 121 | msi-psu-dkms | 10262 | 0 | 0 | 3 | KERNEL_MODULE |
| 122 | nfuspire-git | 18401 | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: requires libticalcs/libtica |
| 123 | nifskope-git | 13610 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 124 | nvidia-390xx-dkms | 12631 | 0 | 0 | 3 | KERNEL_MODULE |
| 125 | nvidia-470xx-dkms | 11846 | 0 | 0 | 3 | KERNEL_MODULE |
| 126 | nvidia-580xx-dkms | 2027 | 0 | 0 | 3 | DKMS_UNSUPPORTED |
| 127 | nvidia-beta-dkms | 21643 | 0 | 0 | 3 | KERNEL_MODULE |
| 128 | nvidia-bl-dkms | 17755 | 0 | 0 | 3 | DKMS_KERNEL_MODULE |
| 129 | op-cache-git | 3047 | 0 | 0 | 3 | cargo-build-system requires vendored crate deps; c |
| 130 | pacpak-git | 17862 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN: Arch Linux-specific flatpak w |
| 131 | pam_exec-ssh-git | 14241 | 0 | 0 | 3 | FETCH_FAILED |
| 132 | phonon-qt4-vlc | 18938 | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f |
| 133 | protonmail-bridge-free-nokeychain-git | 14189 | 0 | 0 | 3 | FETCH_FAILED |
| 134 | quartz-utils-git | 18430 | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: Rust CLI utils; crate deps  |
| 135 | r8127-dkms | 12803 | 0 | 0 | 3 | KERNEL_MODULE |
| 136 | rdt-client | 18561 | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: Real-Debrid client; .NET/C# |
| 137 | rtw88-dkms-git | 383 | 0 | 0 | 3 | KERNEL_MODULE |
| 138 | rtw89-dkms-git | 4122 | 0 | 0 | 3 | KERNEL_MODULE |
| 139 | samsung-unified-driver-printer | 650 | 0 | 0 | 3 | PROPRIETARY_LICENSE — Samsung printer driver; cust |
| 140 | texmacs-pure | 17873 | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: GNU TeXmacs plugin for Pure |
| 141 | ttf-ms-win11-fod-auto-paneuropean | 8934 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 142 | ttf-ms-win11-fod-auto-sinh | 8933 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 143 | ttf-ms-win11-fod-auto-syrc | 8932 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 144 | ttf-ms-win11-fod-auto-taml | 8931 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 145 | ttf-ms-win11-fod-auto-telu | 8930 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 146 | ttf-ms-win11-fod-auto-thai | 8929 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 147 | ttf-vista-fonts | 500 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 148 | unifi | 7266 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 149 | v4l2loopback-dkms-git | 10005 | 0 | 0 | 3 | KERNEL_MODULE |
| 150 | vintagestory-server | 4360 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 151 | vrk-mpollux-digisign-client | 7652 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 152 | vrms-arch | 3994 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 153 | winscp | 4680 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN_EXHAUSTED — WINE_WRAPPER: WinS |
| 154 | wreckfest2-wine-steam | 9038 | 0 | 0 | 3 | PLATFORM_SPECIFIC |
| 155 | xone-dkms | 189 | 0 | 0 | 3 | KERNEL_MODULE |
| 156 | xone-dkms-git | 56 | 0 | 0 | 3 | KERNEL_MODULE |
| 157 | yaycache | 6633 | 0 | 0 | 3 | ARCH_SPECIFIC: yay cache cleaner, depends on pacma |
| 158 | zfs-dkms-staging-compat-git | 10354 | 0 | 0 | 3 | KERNEL_MODULE |
| 159 | zur | 5226 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 160 | ankama-launcher | 4251 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 161 | antiafk-rbx-sober | 12841 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED: FLATPAK_DEPENDENCY: |
| 162 | apifox-appimage | 4455 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 163 | arch-upgrader-git | 1431 | 0 | 0 | 4 | ARCH_SPECIFIC |
| 164 | archforge-git | 3696 | 0 | 0 | 4 | ARCH_SPECIFIC |
| 165 | archium | 7301 | 0 | 0 | 4 | ARCH_SPECIFIC |
| 166 | aurvote-utils-git | 498 | 0 | 0 | 4 | ARCH_SPECIFIC |
| 167 | banyanapp | 8380 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 168 | bdash-bin | 14239 | 0 | 0 | 4 | FETCH_FAILED |
| 169 | brother-lpr-drivers-laser | 10659 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 170 | chatd-bin | 14232 | 0 | 0 | 4 | FETCH_FAILED |
| 171 | chromium-extension-arch-search | 17897 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN: browser extension (not a syst |
| 172 | clash-for-windows-chinese | 17433 | 0 | 0 | 4 | ABANDONED_UPSTREAM |
| 173 | connect-tunnel | 7497 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 174 | detect-it-easy-bin | 5150 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN |
| 175 | domake-docker-make | 5291 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN |
| 176 | dpibreak-git | 3077 | 0 | 0 | 4 | NEEDS_CARGO_VENDORING — Same upstream as dpibreak  |
| 177 | euroscope-bin | 17945 | 0 | 0 | 4 | PLATFORM_UNSUPPORTED |
| 178 | frame | 13383 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — ABANDONED_UPSTREAM |
| 179 | gbm | 19044 | 0 | 0 | 4 | DEP_RESOLUTION_FAILED: .NET/Mono dependency chain; |
| 180 | gtk2-perl | 5069 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN |
| 181 | heli-x | 8742 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED: JAVA_COMPLEX: Profe |
| 182 | insomnia | 10469 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED: HTTP client; Electr |
| 183 | iscan | 640 | 0 | 0 | 4 | PROPRIETARY_LICENSE — EPSON Image Scan; proprietar |
| 184 | jivexdv-bin | 4568 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — WINDOWS_ONLY: down |
| 185 | kchmviewer | 5074 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN |
| 186 | lceda-pro-bin | 15922 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY: propri |
| 187 | lib32-xvidcore | 10752 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — LIB32_UNSUPPORTED: |
| 188 | logibar | 3094 | 0 | 0 | 4 | SYSTEMD_SPECIFIC — Waybar Logitech battery widgets |
| 189 | muzak | 13456 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — NO_LICENSE: no LIC |
| 190 | nerd-fonts-apple | 1534 | 0 | 0 | 4 | PROPRIETARY_FONT_LICENSE: Apple fonts patched with |
| 191 | nextcloud-app-impersonate | 9971 | 0 | 0 | 4 | ARCH_SPECIFIC: Nextcloud PHP app; server config, n |
| 192 | nodejs-nativefier | 7325 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260 |
| 193 | nvidia-535xx-dkms | 13106 | 0 | 0 | 4 | DEP_RESOLUTION_FAILED: DKMS kernel module |
| 194 | nvidia-open-beta | 11971 | 0 | 0 | 4 | KERNEL_MODULE |
| 195 | nvidia-open-beta-dkms | 11972 | 0 | 0 | 4 | DKMS_UNSUPPORTED |
| 196 | nvidia-sync | 13585 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 197 | pacdiff-pacman-hook-git | 11852 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: pac |
| 198 | package-query | 10483 | 0 | 0 | 4 | ARCH_SPECIFIC: depends on pacman/libalpm |
| 199 | paru | 11312 | 0 | 0 | 4 | ARCH_SPECIFIC: Pacman/AUR helper, depends on pacma |
| 200 | paru-git | 21765 | 0 | 0 | 4 | ARCH_SPECIFIC: Pacman/AUR helper, depends on pacma |
