# Blocked Dependency Tree

**Generated:** 2026-04-26T22:44:38Z  
**Pass ID:** deptree-resolver-260426m  

## Summary

| Metric | Value |
|---|---|
| Total BLOCKED | 395 |
| In AUR cache | 386 |
| Zero blocked deps | 389 |

## Blocking Reason Distribution

| Reason | Count |
|---|---|
| NEEDS_RECIPE_DESIGN_EXHAUSTED | 91 |
| NEEDS_RECIPE_DESIGN | 75 |
| KERNEL_MODULE | 36 |
| ARCH_SPECIFIC | 24 |
| FETCH_FAILED | 24 |
| PROPRIETARY_LICENSE | 21 |
| NON_DISTRIBUTABLE | 17 |
| NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aa) | 12 |
| LIB32_UNSUPPORTED | 10 |
| DEP_RESOLUTION_FAILED | 10 |
| INFEASIBLE_BUILD | 10 |
| MISSING_SOURCE | 7 |
| NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aj) | 6 |
| NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413ah) | 6 |
| PROPRIETARY_CLOSED_SOURCE | 5 |
| DKMS_UNSUPPORTED | 5 |
| INITRAMFS_TOOL | 3 |
| ARCH_PACKAGE_MANAGER | 3 |
| COMPLEX_BUILD_DEPS | 3 |
| PROPRIETARY_SDK | 2 |
| NEEDS_CARGO_VENDORING | 2 |
| BUILD_SYSTEM_TOO_COMPLEX | 2 |
| PROPRIETARY_SERVICE | 1 |
| VERY_LOW_MATURITY | 1 |
| FOREIGN_PACKAGE_MANAGER | 1 |
| NO_UPSTREAM_SOURCE | 1 |
| NO_LICENSE | 1 |
| cargo-build-system requires vendored crate deps; crmne/op-cache has no tags, only git commits; tried | 1 |
| PLATFORM_SPECIFIC | 1 |
| SYSTEMD_SPECIFIC | 1 |
| PROPRIETARY_FONT_LICENSE | 1 |
| cargo-build-system requires vendored crate deps; NexusXe/fw-ec-utils has no tags, needs cargo-nightly; tried | 1 |
| MISSING_BUILD_TOOLS | 1 |
| LICENSE_REVIEW_NEEDED | 1 |
| LIB32_UNSUPPORTED + PROPRIETARY | 1 |
| CROSS_TOOLCHAIN_COMPLEX | 1 |
| MISSING_DEPENDENCY | 1 |
| proprietary download requires web-scraping token from symless.com landing page; no static download URL exists; tried | 1 |
| NONFREE_LICENSE | 1 |
| PROPRIETARY_SERVER | 1 |
| NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413b; heavy KDE6/Qt6/polkit-qt6 dep chain. See blocked-notes. | 1 |
| KERNEL_HEADERS | 1 |
| KERNEL_BUILD | 1 |

## Priority Queue (Top 200)

| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps | Reason |
|---|---|---|---|---|---|---|
| 1 | aurutils | 1834 | 0 | 1 | 6 | ARCH_SPECIFIC: AUR helper, depends on pa |
| 2 | pamac-aur | 11788 | 0 | 1 | 17 | NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPE |
| 3 | python-urllib3-future-git | 18341 | 0 | 1 | 17 | NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_P |
| 4 | nautilus-typeahead | 676 | 0 | 1 | 38 | NEEDS_RECIPE_DESIGN |
| 5 | audiobookshelf | 3880 | 0 | 0 | 0 | MISSING_SOURCE: not in AUR metadata |
| 6 | bulky | 5151 | 0 | 0 | 0 | MISSING_SOURCE: not in AUR metadata |
| 7 | dbeaver | 15 | 0 | 0 | 0 | MISSING_SOURCE: not in AUR metadata |
| 8 | diffnav-bin | 5141 | 0 | 0 | 0 | NEEDS_RECIPE_DESIGN |
| 9 | fluxdown-bin | 3420 | 0 | 0 | 0 | MISSING_SOURCE |
| 10 | gram-editor-bin | 3033 | 0 | 0 | 0 | MISSING_SOURCE |
| 11 | gram-editor-bin | 5457 | 0 | 0 | 0 | MISSING_SOURCE |
| 12 | hypnotix | 398 | 0 | 0 | 0 | MISSING_SOURCE |
| 13 | pardf | 13448 | 0 | 0 | 0 | NEEDS_RECIPE_DESIGN_EXHAUSTED — UNCLEAR_ |
| 14 | apple-fonts | 141 | 0 | 0 | 1 | NON_DISTRIBUTABLE |
| 15 | netpad-vnext-bin | 5637 | 0 | 0 | 1 | NEEDS_RECIPE_DESIGN_EXHAUSTED: DOTNET_UN |
| 16 | r8125-dkms | 363 | 0 | 0 | 1 | KERNEL_MODULE |
| 17 | skillshare | 2920 | 0 | 0 | 1 | PROPRIETARY_SERVICE |
| 18 | bcachefs-kernel-dkms-git | 1506 | 0 | 0 | 2 | KERNEL_MODULE |
| 19 | etcd | 5160 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 20 | flclashx-bin | 4730 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 21 | gowatch | 5172 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 22 | harbor-wave | 14201 | 0 | 0 | 2 | FETCH_FAILED |
| 23 | jdk17-graalvm-ee-bin | 5178 | 0 | 0 | 2 | PROPRIETARY_CLOSED_SOURCE |
| 24 | lib32-openssl-1.1 | 11910 | 0 | 0 | 2 | LIB32_UNSUPPORTED |
| 25 | limine-booster | 14240 | 0 | 0 | 2 | FETCH_FAILED |
| 26 | mdbook-epub | 13376 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DE |
| 27 | mingw-w64-zlib-ng | 3363 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-re |
| 28 | mkinitcpio-archlogo | 13249 | 0 | 0 | 2 | ARCH_SPECIFIC |
| 29 | mkinitcpio-systemd-extras | 723 | 0 | 0 | 2 | INITRAMFS_TOOL — Arch-specific initramfs |
| 30 | mod_maxminddb | 12757 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN: Apache HTTPD module |
| 31 | nbfc | 5254 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 32 | ndi-sdk | 9867 | 0 | 0 | 2 | PROPRIETARY_SDK |
| 33 | ntfsplus-dkms-git | 12912 | 0 | 0 | 2 | KERNEL_MODULE |
| 34 | podserv-b-git | 3037 | 0 | 0 | 2 | VERY_LOW_MATURITY — Rust podcast server  |
| 35 | portage | 7628 | 0 | 0 | 2 | FOREIGN_PACKAGE_MANAGER — Gentoo's Porta |
| 36 | quantumlauncher-bin | 4790 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 37 | r8152-dkms | 8888 | 0 | 0 | 2 | KERNEL_MODULE |
| 38 | ryzen_smu-dkms-git | 244 | 0 | 0 | 2 | KERNEL_MODULE |
| 39 | spinwheel-pipewire | 3089 | 0 | 0 | 2 | NO_UPSTREAM_SOURCE — Terminal wheel spin |
| 40 | system76-acpi-dkms | 2787 | 0 | 0 | 2 | DKMS_UNSUPPORTED — DKMS kernel module; G |
| 41 | system76-io-dkms | 2786 | 0 | 0 | 2 | DKMS_UNSUPPORTED — DKMS kernel module; G |
| 42 | webos-dev-manager-bin | 5245 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 43 | xpad-dkms-git | 7487 | 0 | 0 | 2 | KERNEL_MODULE |
| 44 | yaac | 5212 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 45 | zenpower3-dkms | 667 | 0 | 0 | 2 | KERNEL_MODULE |
| 46 | zenpower3-dkms-git | 1671 | 0 | 0 | 2 | KERNEL_MODULE |
| 47 | zenpower3-dkms-git | 13242 | 0 | 0 | 2 | KERNEL_MODULE |
| 48 | zenpower5-dkms-git | 1605 | 0 | 0 | 2 | KERNEL_MODULE |
| 49 | zenpower5-dkms-git | 12908 | 0 | 0 | 2 | KERNEL_MODULE |
| 50 | aic8800-dkms | 10156 | 0 | 0 | 3 | KERNEL_MODULE |
| 51 | ajantv2-dkms | 10154 | 0 | 0 | 3 | KERNEL_MODULE |
| 52 | ampcode | 5258 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 53 | architect-git | 14243 | 0 | 0 | 3 | FETCH_FAILED |
| 54 | artificial-rage-git | 14215 | 0 | 0 | 3 | FETCH_FAILED |
| 55 | autofirma | 5627 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN_EXHAUSTED: JAVA_COMP |
| 56 | buf-git | 5241 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 57 | dela | 5071 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 58 | disk_usage | 14224 | 0 | 0 | 3 | FETCH_FAILED |
| 59 | dpibreak | 3075 | 0 | 0 | 3 | NEEDS_CARGO_VENDORING — Rust DPI circumv |
| 60 | droidcam-dkms-git | 9915 | 0 | 0 | 3 | KERNEL_MODULE |
| 61 | fish-session | 3084 | 0 | 0 | 3 | NO_LICENSE — Fish shell session manager  |
| 62 | framework-control-bin | 3072 | 0 | 0 | 3 | BUILD_SYSTEM_TOO_COMPLEX — Framework Lap |
| 63 | jellyfin-rpc-bin | 4799 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 64 | kernelsu-dkms | 3358 | 0 | 0 | 3 | KERNEL_MODULE |
| 65 | kernelsu-dkms | 12374 | 0 | 0 | 3 | KERNEL_MODULE |
| 66 | lib32-libvpx1.3 | 11975 | 0 | 0 | 3 | LIB32_UNSUPPORTED |
| 67 | linux-apfs-rw-dkms-git | 6973 | 0 | 0 | 3 | KERNEL_MODULE |
| 68 | livekit | 14229 | 0 | 0 | 3 | FETCH_FAILED |
| 69 | llvm-cbe-git | 3258 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-re |
| 70 | local-llama-bin | 14238 | 0 | 0 | 3 | FETCH_FAILED |
| 71 | luajit-sdl2-git | 14213 | 0 | 0 | 3 | FETCH_FAILED |
| 72 | luajit-sdl3-git | 14210 | 0 | 0 | 3 | FETCH_FAILED |
| 73 | mermaid-ascii-git | 14244 | 0 | 0 | 3 | FETCH_FAILED |
| 74 | mkinitcpio-btrfs | 10987 | 0 | 0 | 3 | ARCH_SPECIFIC |
| 75 | mkinitcpio-colors-git | 10383 | 0 | 0 | 3 | ARCH_SPECIFIC |
| 76 | mkinitcpio-wifi | 2980 | 0 | 0 | 3 | ARCH_SPECIFIC |
| 77 | mkinitcpio-wifi | 13130 | 0 | 0 | 3 | ARCH_SPECIFIC |
| 78 | mkinitcpio-zerotier | 794 | 0 | 0 | 3 | ARCH_SPECIFIC |
| 79 | msi-psu-dkms | 10262 | 0 | 0 | 3 | KERNEL_MODULE |
| 80 | nifskope-git | 13610 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 81 | nvidia-390xx-dkms | 2401 | 0 | 0 | 3 | KERNEL_MODULE |
| 82 | nvidia-390xx-dkms | 12631 | 0 | 0 | 3 | KERNEL_MODULE |
| 83 | nvidia-470xx-dkms | 2328 | 0 | 0 | 3 | KERNEL_MODULE |
| 84 | nvidia-470xx-dkms | 11846 | 0 | 0 | 3 | KERNEL_MODULE |
| 85 | nvidia-580xx-dkms | 2027 | 0 | 0 | 3 | DKMS_UNSUPPORTED |
| 86 | nvidia-beta-dkms | 4681 | 0 | 0 | 3 | KERNEL_MODULE |
| 87 | nvidia-beta-dkms | 21643 | 0 | 0 | 3 | KERNEL_MODULE |
| 88 | op-cache-git | 3047 | 0 | 0 | 3 | cargo-build-system requires vendored cra |
| 89 | pam_exec-ssh-git | 14241 | 0 | 0 | 3 | FETCH_FAILED |
| 90 | protonmail-bridge-free-nokeychain-git | 14189 | 0 | 0 | 3 | FETCH_FAILED |
| 91 | r8127-dkms | 2627 | 0 | 0 | 3 | KERNEL_MODULE |
| 92 | r8127-dkms | 12803 | 0 | 0 | 3 | KERNEL_MODULE |
| 93 | rtw88-dkms-git | 383 | 0 | 0 | 3 | KERNEL_MODULE |
| 94 | rtw89-dkms-git | 4122 | 0 | 0 | 3 | KERNEL_MODULE |
| 95 | samsung-unified-driver-printer | 650 | 0 | 0 | 3 | PROPRIETARY_LICENSE — Samsung printer dr |
| 96 | ttf-ms-win11-fod-auto-paneuropean | 8934 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 97 | ttf-ms-win11-fod-auto-sinh | 8933 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 98 | ttf-ms-win11-fod-auto-syrc | 8932 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 99 | ttf-ms-win11-fod-auto-taml | 8931 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 100 | ttf-ms-win11-fod-auto-telu | 8930 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 101 | ttf-ms-win11-fod-auto-thai | 8929 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 102 | ttf-vista-fonts | 500 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 103 | unifi | 7266 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 104 | v4l2loopback-dkms-git | 10005 | 0 | 0 | 3 | KERNEL_MODULE |
| 105 | vintagestory-server | 4360 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 106 | vrk-mpollux-digisign-client | 7652 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 107 | vrms-arch | 3994 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 108 | winscp | 4680 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN_EXHAUSTED — WINE_WRA |
| 109 | wreckfest2-wine-steam | 9038 | 0 | 0 | 3 | PLATFORM_SPECIFIC |
| 110 | xone-dkms | 189 | 0 | 0 | 3 | KERNEL_MODULE |
| 111 | xone-dkms-git | 56 | 0 | 0 | 3 | KERNEL_MODULE |
| 112 | yaycache | 6633 | 0 | 0 | 3 | ARCH_SPECIFIC: yay cache cleaner, depend |
| 113 | zfs-dkms-staging-compat-git | 10354 | 0 | 0 | 3 | KERNEL_MODULE |
| 114 | zur | 5226 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 115 | ankama-launcher | 4251 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 116 | antiafk-rbx-sober | 12841 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED: FLATPAK_D |
| 117 | apifox-appimage | 4455 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 118 | arch-upgrader-git | 1431 | 0 | 0 | 4 | ARCH_SPECIFIC |
| 119 | archforge-git | 3696 | 0 | 0 | 4 | ARCH_SPECIFIC |
| 120 | archium | 7301 | 0 | 0 | 4 | ARCH_SPECIFIC |
| 121 | aurvote-utils-git | 498 | 0 | 0 | 4 | ARCH_SPECIFIC |
| 122 | banyanapp | 8380 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 123 | bdash-bin | 14239 | 0 | 0 | 4 | FETCH_FAILED |
| 124 | brother-lpr-drivers-laser | 10659 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 125 | chatd-bin | 14232 | 0 | 0 | 4 | FETCH_FAILED |
| 126 | connect-tunnel | 7497 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 127 | detect-it-easy-bin | 5150 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN |
| 128 | domake-docker-make | 5291 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN |
| 129 | dpibreak-git | 3077 | 0 | 0 | 4 | NEEDS_CARGO_VENDORING — Same upstream as |
| 130 | frame | 13383 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — ABANDONE |
| 131 | gtk2-perl | 5069 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN |
| 132 | heli-x | 8742 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED: JAVA_COMP |
| 133 | insomnia | 10469 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED: HTTP clie |
| 134 | iscan | 640 | 0 | 0 | 4 | PROPRIETARY_LICENSE — EPSON Image Scan;  |
| 135 | jivexdv-bin | 4568 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — WINDOWS_ |
| 136 | kchmviewer | 5074 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN |
| 137 | lceda-pro-bin | 15922 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETA |
| 138 | lib32-xvidcore | 10752 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — LIB32_UN |
| 139 | logibar | 3094 | 0 | 0 | 4 | SYSTEMD_SPECIFIC — Waybar Logitech batte |
| 140 | muzak | 13456 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — NO_LICEN |
| 141 | nerd-fonts-apple | 1534 | 0 | 0 | 4 | PROPRIETARY_FONT_LICENSE: Apple fonts pa |
| 142 | nextcloud-app-impersonate | 9971 | 0 | 0 | 4 | ARCH_SPECIFIC: Nextcloud PHP app; server |
| 143 | nodejs-nativefier | 7325 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-re |
| 144 | nvidia-535xx-dkms | 13106 | 0 | 0 | 4 | DEP_RESOLUTION_FAILED: DKMS kernel modul |
| 145 | nvidia-open-beta | 2344 | 0 | 0 | 4 | KERNEL_MODULE |
| 146 | nvidia-open-beta | 11971 | 0 | 0 | 4 | KERNEL_MODULE |
| 147 | nvidia-open-beta-dkms | 2345 | 0 | 0 | 4 | DKMS_UNSUPPORTED |
| 148 | nvidia-open-beta-dkms | 11972 | 0 | 0 | 4 | DKMS_UNSUPPORTED |
| 149 | nvidia-sync | 13585 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 150 | obs-vnc | 3245 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-re |
| 151 | pacdiff-pacman-hook-git | 11852 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPE |
| 152 | package-query | 10483 | 0 | 0 | 4 | ARCH_SPECIFIC: depends on pacman/libalpm |
| 153 | paru | 2023 | 0 | 0 | 4 | ARCH_SPECIFIC: Pacman/AUR helper, depend |
| 154 | paru | 11312 | 0 | 0 | 4 | ARCH_SPECIFIC: Pacman/AUR helper, depend |
| 155 | paru | 11312 | 0 | 0 | 4 | ARCH_SPECIFIC: Pacman/AUR helper, depend |
| 156 | paru | 11312 | 0 | 0 | 4 | ARCH_SPECIFIC: Pacman/AUR helper, depend |
| 157 | paru | 11312 | 0 | 0 | 4 | ARCH_SPECIFIC: Pacman/AUR helper, depend |
| 158 | paru | 11312 | 0 | 0 | 4 | ARCH_SPECIFIC: Pacman/AUR helper, depend |
| 159 | paru-git | 1486 | 0 | 0 | 4 | ARCH_SPECIFIC: Pacman/AUR helper, depend |
| 160 | paru-git | 11437 | 0 | 0 | 4 | ARCH_SPECIFIC: Pacman/AUR helper, depend |
| 161 | paru-git | 21765 | 0 | 0 | 4 | ARCH_SPECIFIC: Pacman/AUR helper, depend |
| 162 | python-onkyo-eiscp | 14233 | 0 | 0 | 4 | FETCH_FAILED |
| 163 | reboot-arch-btw | 13288 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPE |
| 164 | reboot-arch-btw | 13288 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN: Arch-specific kerne |
| 165 | river-bedload-git | 3209 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-re |
| 166 | rustwhy-git | 3660 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — NO_RELEA |
| 167 | samsung-unified-driver-scanner | 649 | 0 | 0 | 4 | PROPRIETARY_LICENSE — Samsung scanner dr |
| 168 | sickrage-git | 25171 | 0 | 0 | 4 | DEP_RESOLUTION_FAILED: TV show PVR; Pyth |
| 169 | sickrage-git | 25171 | 0 | 0 | 4 | DEP_RESOLUTION_FAILED: TV show PVR; Pyth |
| 170 | tuimer | 13417 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — SOURCE_N |
| 171 | archforge | 3419 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-re |
| 172 | calculix-ccx | 13171 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN: CalculiX FEA solver |
| 173 | clean-chroot-manager | 12870 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPEC |
| 174 | dms-shell-git | 13291 | 0 | 0 | 5 | DEP_RESOLUTION_FAILED: Desktop shell req |
| 175 | dnspyex-wine-bin | 12850 | 0 | 0 | 5 | DEP_RESOLUTION_FAILED: Windows .NET bina |
| 176 | fw-fanctrl-rs-git | 3031 | 0 | 0 | 5 | cargo-build-system requires vendored cra |
| 177 | journal-brief | 5196 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN |
| 178 | lib32-libdovi | 2583 | 0 | 0 | 5 | LIB32_UNSUPPORTED |
| 179 | lib32-libdovi | 12383 | 0 | 0 | 5 | LIB32_UNSUPPORTED |
| 180 | lib32-libvmaf | 2366 | 0 | 0 | 5 | LIB32_UNSUPPORTED |
| 181 | linpac-git | 14234 | 0 | 0 | 5 | FETCH_FAILED |
| 182 | linux-firmware-git | 3551 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED — NONFREE_ |
| 183 | llama.cpp-clblast | 13467 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED — SYSTEM_G |
| 184 | mcsast | 14237 | 0 | 0 | 5 | FETCH_FAILED |
| 185 | nvidia-340xx-dkms | 7710 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-re |
| 186 | nvidia-beta | 562 | 0 | 0 | 5 | KERNEL_MODULE |
| 187 | nvidia-beta | 21328 | 0 | 0 | 5 | KERNEL_MODULE |
| 188 | omnissa-horizon-integrated-printing | 7369 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-re |
| 189 | pacboost | 4654 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPEC |
| 190 | parui-git | 19178 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPEC |
| 191 | portage-manifest | 13162 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPE |
| 192 | portage-manifest | 13162 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN: Gentoo Portage mani |
| 193 | proslenkey | 5187 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED — UNKNOWN_ |
| 194 | python-seapie | 5177 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN |
| 195 | rofi-polkit-agent-git | 3237 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-re |
| 196 | spacebar-git | 3720 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED: Discord-c |
| 197 | staruml | 7506 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-re |
| 198 | thcrap-steam-proton-wrapper-git | 13396 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETA |
| 199 | ue4localizationstool-zenity | 7221 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED: DOTNET_MO |
| 200 | wiznoteplus-bin | 3213 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-re |
