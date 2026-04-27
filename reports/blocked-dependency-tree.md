# Blocked Dependency Tree
**Generated:** 2026-04-27T01:31:27Z  
**Pass ID:** deptree-resolver-260426o  

## Summary
| Metric | Value |
|---|---|
| Total BLOCKED | 354 |
| In AUR cache | 346 |
| Zero blocked deps | 351 |

## Blocking Reason Distribution
| Reason | Count |
|---|---|
| NEEDS_RECIPE_DESIGN_EXHAUSTED | 106 |
| NEEDS_RECIPE_DESIGN | 74 |
| KERNEL_MODULE | 27 |
| FETCH_FAILED | 24 |
| PROPRIETARY_LICENSE | 21 |
| ARCH_SPECIFIC | 16 |
| INFEASIBLE_BUILD | 10 |
| NON_DISTRIBUTABLE | 9 |
| DEP_RESOLUTION_FAILED | 9 |
| LIB32_UNSUPPORTED | 8 |
| MISSING_SOURCE | 6 |
| PROPRIETARY_CLOSED_SOURCE | 4 |
| DKMS_UNSUPPORTED | 4 |
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
| KERNEL_BUILD | 1 |
| KERNEL_HEADERS | 1 |

## Priority Queue (Top 354)
| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps | Reason |
|---|---|---|---|---|---|---|
| 1 | aurutils | 1834 | 0 | 1 | 6 | ARCH_SPECIFIC: AUR helper, depends on pacutils/pacman |
| 2 | audiobookshelf | 3880 | 0 | 0 | 0 | MISSING_SOURCE: not in AUR metadata |
| 3 | bulky | 5151 | 0 | 0 | 0 | MISSING_SOURCE: not in AUR metadata |
| 4 | dbeaver | 15 | 0 | 0 | 0 | MISSING_SOURCE: not in AUR metadata |
| 5 | diffnav-bin | 5141 | 0 | 0 | 0 | NEEDS_RECIPE_DESIGN |
| 6 | fluxdown-bin | 3420 | 0 | 0 | 0 | MISSING_SOURCE |
| 7 | gram-editor-bin | 5457 | 0 | 0 | 0 | MISSING_SOURCE |
| 8 | hypnotix | 398 | 0 | 0 | 0 | MISSING_SOURCE |
| 9 | pardf | 13448 | 0 | 0 | 0 | NEEDS_RECIPE_DESIGN_EXHAUSTED — UNCLEAR_UPSTREAM: no clear s |
| 10 | apple-fonts | 141 | 0 | 0 | 1 | NON_DISTRIBUTABLE |
| 11 | netpad-vnext-bin | 5637 | 0 | 0 | 1 | NEEDS_RECIPE_DESIGN_EXHAUSTED: DOTNET_UNSUPPORTED: A cross-p |
| 12 | r8125-dkms | 363 | 0 | 0 | 1 | KERNEL_MODULE |
| 13 | skillshare | 2920 | 0 | 0 | 1 | PROPRIETARY_SERVICE |
| 14 | bcachefs-kernel-dkms-git | 1506 | 0 | 0 | 2 | KERNEL_MODULE |
| 15 | etcd | 5160 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 16 | flclashx-bin | 4730 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 17 | gowatch | 5172 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 18 | harbor-wave | 14201 | 0 | 0 | 2 | FETCH_FAILED |
| 19 | jdk17-graalvm-ee-bin | 5178 | 0 | 0 | 2 | PROPRIETARY_CLOSED_SOURCE |
| 20 | lib32-openssl-1.1 | 11910 | 0 | 0 | 2 | LIB32_UNSUPPORTED |
| 21 | limine-booster | 14240 | 0 | 0 | 2 | FETCH_FAILED |
| 22 | mdbook-epub | 13376 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED: 30+ Rust  |
| 23 | mingw-w64-zlib-ng | 3363 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aa) |
| 24 | mkinitcpio-archlogo | 13249 | 0 | 0 | 2 | ARCH_SPECIFIC |
| 25 | mkinitcpio-systemd-extras | 723 | 0 | 0 | 2 | INITRAMFS_TOOL — Arch-specific initramfs hook |
| 26 | mod_maxminddb | 12757 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN: Apache HTTPD module for MaxMind GeoIP |
| 27 | nbfc | 5254 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 28 | ndi-sdk | 9867 | 0 | 0 | 2 | PROPRIETARY_SDK |
| 29 | ntfsplus-dkms-git | 12912 | 0 | 0 | 2 | KERNEL_MODULE |
| 30 | podserv-b-git | 3037 | 0 | 0 | 2 | VERY_LOW_MATURITY — Rust podcast server (github.com/l5yth/po |
| 31 | portage | 7628 | 0 | 0 | 2 | FOREIGN_PACKAGE_MANAGER — Gentoo's Portage; not applicable t |
| 32 | quantumlauncher-bin | 4790 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 33 | r8152-dkms | 8888 | 0 | 0 | 2 | KERNEL_MODULE |
| 34 | ryzen_smu-dkms-git | 244 | 0 | 0 | 2 | KERNEL_MODULE |
| 35 | spinwheel-pipewire | 3089 | 0 | 0 | 2 | NO_UPSTREAM_SOURCE — Terminal wheel spinner (codeberg.org/th |
| 36 | system76-acpi-dkms | 2787 | 0 | 0 | 2 | DKMS_UNSUPPORTED — DKMS kernel module; Guix manages kernel m |
| 37 | system76-io-dkms | 2786 | 0 | 0 | 2 | DKMS_UNSUPPORTED — DKMS kernel module; Guix manages kernel m |
| 38 | webos-dev-manager-bin | 5245 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 39 | xpad-dkms-git | 7487 | 0 | 0 | 2 | KERNEL_MODULE |
| 40 | yaac | 5212 | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 41 | zenpower3-dkms | 667 | 0 | 0 | 2 | KERNEL_MODULE |
| 42 | zenpower3-dkms-git | 13242 | 0 | 0 | 2 | KERNEL_MODULE |
| 43 | zenpower5-dkms-git | 12908 | 0 | 0 | 2 | KERNEL_MODULE |
| 44 | aic8800-dkms | 10156 | 0 | 0 | 3 | KERNEL_MODULE |
| 45 | ajantv2-dkms | 10154 | 0 | 0 | 3 | KERNEL_MODULE |
| 46 | ampcode | 5258 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 47 | architect-git | 14243 | 0 | 0 | 3 | FETCH_FAILED |
| 48 | artificial-rage-git | 14215 | 0 | 0 | 3 | FETCH_FAILED |
| 49 | autofirma | 5627 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN_EXHAUSTED: JAVA_COMPLEX: Cliente de firm |
| 50 | buf-git | 5241 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 51 | dela | 5071 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 52 | disk_usage | 14224 | 0 | 0 | 3 | FETCH_FAILED |
| 53 | dpibreak | 3075 | 0 | 0 | 3 | NEEDS_CARGO_VENDORING — Rust DPI circumvention tool (github. |
| 54 | droidcam-dkms-git | 9915 | 0 | 0 | 3 | KERNEL_MODULE |
| 55 | fish-session | 3084 | 0 | 0 | 3 | NO_LICENSE — Fish shell session manager (github.com/AtefR/fi |
| 56 | framework-control-bin | 3072 | 0 | 0 | 3 | BUILD_SYSTEM_TOO_COMPLEX — Framework Laptop control app (git |
| 57 | jellyfin-rpc-bin | 4799 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 58 | kernelsu-dkms | 12374 | 0 | 0 | 3 | KERNEL_MODULE |
| 59 | lib32-libvpx1.3 | 11975 | 0 | 0 | 3 | LIB32_UNSUPPORTED |
| 60 | linux-apfs-rw-dkms-git | 6973 | 0 | 0 | 3 | KERNEL_MODULE |
| 61 | livekit | 14229 | 0 | 0 | 3 | FETCH_FAILED |
| 62 | llvm-cbe-git | 3258 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aa) |
| 63 | local-llama-bin | 14238 | 0 | 0 | 3 | FETCH_FAILED |
| 64 | luajit-sdl2-git | 14213 | 0 | 0 | 3 | FETCH_FAILED |
| 65 | luajit-sdl3-git | 14210 | 0 | 0 | 3 | FETCH_FAILED |
| 66 | mermaid-ascii-git | 14244 | 0 | 0 | 3 | FETCH_FAILED |
| 67 | mkinitcpio-btrfs | 10987 | 0 | 0 | 3 | ARCH_SPECIFIC |
| 68 | mkinitcpio-colors-git | 10383 | 0 | 0 | 3 | ARCH_SPECIFIC |
| 69 | mkinitcpio-wifi | 13130 | 0 | 0 | 3 | ARCH_SPECIFIC |
| 70 | mkinitcpio-zerotier | 794 | 0 | 0 | 3 | ARCH_SPECIFIC |
| 71 | msi-psu-dkms | 10262 | 0 | 0 | 3 | KERNEL_MODULE |
| 72 | nifskope-git | 13610 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 73 | nvidia-390xx-dkms | 12631 | 0 | 0 | 3 | KERNEL_MODULE |
| 74 | nvidia-470xx-dkms | 11846 | 0 | 0 | 3 | KERNEL_MODULE |
| 75 | nvidia-580xx-dkms | 2027 | 0 | 0 | 3 | DKMS_UNSUPPORTED |
| 76 | nvidia-beta-dkms | 21643 | 0 | 0 | 3 | KERNEL_MODULE |
| 77 | op-cache-git | 3047 | 0 | 0 | 3 | cargo-build-system requires vendored crate deps; crmne/op-ca |
| 78 | pam_exec-ssh-git | 14241 | 0 | 0 | 3 | FETCH_FAILED |
| 79 | protonmail-bridge-free-nokeychain-git | 14189 | 0 | 0 | 3 | FETCH_FAILED |
| 80 | r8127-dkms | 12803 | 0 | 0 | 3 | KERNEL_MODULE |
| 81 | rtw88-dkms-git | 383 | 0 | 0 | 3 | KERNEL_MODULE |
| 82 | rtw89-dkms-git | 4122 | 0 | 0 | 3 | KERNEL_MODULE |
| 83 | samsung-unified-driver-printer | 650 | 0 | 0 | 3 | PROPRIETARY_LICENSE — Samsung printer driver; custom Samsung |
| 84 | ttf-ms-win11-fod-auto-paneuropean | 8934 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 85 | ttf-ms-win11-fod-auto-sinh | 8933 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 86 | ttf-ms-win11-fod-auto-syrc | 8932 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 87 | ttf-ms-win11-fod-auto-taml | 8931 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 88 | ttf-ms-win11-fod-auto-telu | 8930 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 89 | ttf-ms-win11-fod-auto-thai | 8929 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 90 | ttf-vista-fonts | 500 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 91 | unifi | 7266 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 92 | v4l2loopback-dkms-git | 10005 | 0 | 0 | 3 | KERNEL_MODULE |
| 93 | vintagestory-server | 4360 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 94 | vrk-mpollux-digisign-client | 7652 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 95 | vrms-arch | 3994 | 0 | 0 | 3 | PROPRIETARY_LICENSE |
| 96 | winscp | 4680 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN_EXHAUSTED — WINE_WRAPPER: WinSCP Windows |
| 97 | wreckfest2-wine-steam | 9038 | 0 | 0 | 3 | PLATFORM_SPECIFIC |
| 98 | xone-dkms | 189 | 0 | 0 | 3 | KERNEL_MODULE |
| 99 | xone-dkms-git | 56 | 0 | 0 | 3 | KERNEL_MODULE |
| 100 | yaycache | 6633 | 0 | 0 | 3 | ARCH_SPECIFIC: yay cache cleaner, depends on pacman-contrib |
| 101 | zur | 5226 | 0 | 0 | 3 | NEEDS_RECIPE_DESIGN |
| 102 | ankama-launcher | 4251 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 103 | antiafk-rbx-sober | 12841 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED: FLATPAK_DEPENDENCY: requires  |
| 104 | apifox-appimage | 4455 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 105 | archium | 7301 | 0 | 0 | 4 | ARCH_SPECIFIC |
| 106 | aurvote-utils-git | 498 | 0 | 0 | 4 | ARCH_SPECIFIC |
| 107 | banyanapp | 8380 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 108 | bdash-bin | 14239 | 0 | 0 | 4 | FETCH_FAILED |
| 109 | brother-lpr-drivers-laser | 10659 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 110 | chatd-bin | 14232 | 0 | 0 | 4 | FETCH_FAILED |
| 111 | connect-tunnel | 7497 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 112 | detect-it-easy-bin | 5150 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN |
| 113 | domake-docker-make | 5291 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN |
| 114 | dpibreak-git | 3077 | 0 | 0 | 4 | NEEDS_CARGO_VENDORING — Same upstream as dpibreak (github.co |
| 115 | frame | 13383 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — ABANDONED_UPSTREAM: last rel |
| 116 | gtk2-perl | 5069 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN |
| 117 | heli-x | 8742 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED: JAVA_COMPLEX: Professional R/ |
| 118 | insomnia | 10469 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED: HTTP client; Electron/npm eco |
| 119 | iscan | 640 | 0 | 0 | 4 | PROPRIETARY_LICENSE — EPSON Image Scan; proprietary core bin |
| 120 | jivexdv-bin | 4568 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — WINDOWS_ONLY: downloads Wind |
| 121 | kchmviewer | 5074 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN |
| 122 | lceda-pro-bin | 15922 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY: proprietary Chin |
| 123 | lib32-xvidcore | 10752 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — LIB32_UNSUPPORTED: 32-bit bu |
| 124 | logibar | 3094 | 0 | 0 | 4 | SYSTEMD_SPECIFIC — Waybar Logitech battery widgets (github.c |
| 125 | muzak | 13456 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — NO_LICENSE: no LICENSE file; |
| 126 | nerd-fonts-apple | 1534 | 0 | 0 | 4 | PROPRIETARY_FONT_LICENSE: Apple fonts patched with Nerd Font |
| 127 | nextcloud-app-impersonate | 9971 | 0 | 0 | 4 | ARCH_SPECIFIC: Nextcloud PHP app; server config, not standal |
| 128 | nodejs-nativefier | 7325 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aj) |
| 129 | nvidia-535xx-dkms | 13106 | 0 | 0 | 4 | DEP_RESOLUTION_FAILED: DKMS kernel module |
| 130 | nvidia-open-beta | 11971 | 0 | 0 | 4 | KERNEL_MODULE |
| 131 | nvidia-open-beta-dkms | 11972 | 0 | 0 | 4 | DKMS_UNSUPPORTED |
| 132 | nvidia-sync | 13585 | 0 | 0 | 4 | PROPRIETARY_LICENSE |
| 133 | obs-vnc | 3245 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aa) |
| 134 | pacdiff-pacman-hook-git | 11852 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: pacman hook,  |
| 135 | package-query | 10483 | 0 | 0 | 4 | ARCH_SPECIFIC: depends on pacman/libalpm |
| 136 | paru | 11312 | 0 | 0 | 4 | ARCH_SPECIFIC: Pacman/AUR helper, depends on pacman/libalpm |
| 137 | paru-git | 21765 | 0 | 0 | 4 | ARCH_SPECIFIC: Pacman/AUR helper, depends on pacman/libalpm |
| 138 | reboot-arch-btw | 13288 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN: Arch-specific kernel update checker usi |
| 139 | river-bedload-git | 3209 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aa) |
| 140 | rustwhy-git | 3660 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — NO_RELEASES: no tagged relea |
| 141 | samsung-unified-driver-scanner | 649 | 0 | 0 | 4 | PROPRIETARY_LICENSE — Samsung scanner driver; proprietary bi |
| 142 | sickrage-git | 25171 | 0 | 0 | 4 | DEP_RESOLUTION_FAILED: TV show PVR; Python virtualenv, unmai |
| 143 | tuimer | 13417 | 0 | 0 | 4 | NEEDS_RECIPE_DESIGN_EXHAUSTED — SOURCE_NOT_FOUND: no Go proj |
| 144 | zfs-dkms-staging-compat-git | 10354 | 0 | 0 | 4 | KERNEL_MODULE |
| 145 | arch-upgrader-git | 1431 | 0 | 0 | 5 | ARCH_SPECIFIC |
| 146 | archforge | 3419 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aa) |
| 147 | archforge-git | 3696 | 0 | 0 | 5 | ARCH_SPECIFIC |
| 148 | calculix-ccx | 13171 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN: CalculiX FEA solver |
| 149 | clean-chroot-manager | 12870 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: Arch Linux mak |
| 150 | dms-shell-git | 13291 | 0 | 0 | 5 | DEP_RESOLUTION_FAILED: Desktop shell requiring Quickshell fr |
| 151 | dnspyex-wine-bin | 12850 | 0 | 0 | 5 | DEP_RESOLUTION_FAILED: Windows .NET binary requiring Wine +  |
| 152 | fw-fanctrl-rs-git | 3031 | 0 | 0 | 5 | cargo-build-system requires vendored crate deps; NexusXe/fw- |
| 153 | journal-brief | 5196 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN |
| 154 | lib32-libdovi | 12383 | 0 | 0 | 5 | LIB32_UNSUPPORTED |
| 155 | lib32-libvmaf | 2366 | 0 | 0 | 5 | LIB32_UNSUPPORTED |
| 156 | linpac-git | 14234 | 0 | 0 | 5 | FETCH_FAILED |
| 157 | linux-firmware-git | 3551 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED — NONFREE_FIRMWARE |
| 158 | llama.cpp-clblast | 13467 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED — SYSTEM_GGML: CLBlast backend |
| 159 | mcsast | 14237 | 0 | 0 | 5 | FETCH_FAILED |
| 160 | nvidia-beta | 21328 | 0 | 0 | 5 | KERNEL_MODULE |
| 161 | omnissa-horizon-integrated-printing | 7369 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aj) |
| 162 | pacboost | 4654 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: pacman perform |
| 163 | parui-git | 19178 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: Rust TUI for p |
| 164 | portage-manifest | 13162 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN: Gentoo Portage manifest generator |
| 165 | proslenkey | 5187 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED — UNKNOWN_UPSTREAM |
| 166 | python-onkyo-eiscp | 14233 | 0 | 0 | 5 | FETCH_FAILED |
| 167 | python-seapie | 5177 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN |
| 168 | rofi-polkit-agent-git | 3237 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aa) |
| 169 | spacebar-git | 3720 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED: Discord-compatible server; No |
| 170 | staruml | 7506 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aj) |
| 171 | thcrap-steam-proton-wrapper-git | 13396 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_RUNTIME_DEP: Touh |
| 172 | ue4localizationstool-zenity | 7221 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED: DOTNET_MONO_REQUIRED: C#/Mono |
| 173 | wiznoteplus-bin | 3213 | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aa) |
| 174 | beekeeper-studio | 4777 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN |
| 175 | boomer-git | 3095 | 0 | 0 | 6 | MISSING_BUILD_TOOLS — Screen zoomer (github.com/tsoding/boom |
| 176 | cclive | 13603 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN_EXHAUSTED: ABANDONED_DEPS: video downloa |
| 177 | dause | 5173 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN_EXHAUSTED — UPSTREAM_404 |
| 178 | iwlwifi-lar-patched | 13476 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN_EXHAUSTED: KERNEL_MODULE_SPECIFIC: patch |
| 179 | kmozillahelper | 5184 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN |
| 180 | linux-steam-integration | 10954 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_RUNTIME_DEP: Stea |
| 181 | nvidia-340xx-dkms | 7710 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aj) |
| 182 | opentabletdriver-git | 3233 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aa) |
| 183 | pacaur | 9212 | 0 | 0 | 6 | ARCH_PACKAGE_MANAGER — Arch Linux AUR helper; depends on pac |
| 184 | pane-fm-git | 13313 | 0 | 0 | 6 | DEP_RESOLUTION_FAILED: Tauri/Svelte file manager |
| 185 | phonon-qt6-mpv-git | 10968 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN_EXHAUSTED — PHONON_QT6_MISSING: MPV back |
| 186 | plasma6-applets-fokus | 13332 | 0 | 0 | 6 | DEP_RESOLUTION_FAILED: KDE Plasma 6 pomodoro applet |
| 187 | ps3toolchain | 5015 | 0 | 0 | 6 | INFEASIBLE_BUILD: PS3 dev toolchain |
| 188 | roboclaw-studio-git | 5012 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN_EXHAUSTED — UNKNOWN_UPSTREAM |
| 189 | stasis | 5065 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN |
| 190 | tosu-git | 7052 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN_EXHAUSTED: osu! memory reader; Node.js/p |
| 191 | ttf-ms-win10-auto | 11901 | 0 | 0 | 6 | NON_DISTRIBUTABLE: Microsoft Windows 10 proprietary fonts |
| 192 | ttf-ms-win10-auto-japanese | 11902 | 0 | 0 | 6 | NON_DISTRIBUTABLE: Microsoft Windows 10 Japanese proprietary |
| 193 | ttf-ms-win10-auto-korean | 11903 | 0 | 0 | 6 | NON_DISTRIBUTABLE: Microsoft Windows 10 Korean proprietary f |
| 194 | ttf-ms-win10-auto-other | 11908 | 0 | 0 | 6 | NON_DISTRIBUTABLE: Microsoft Windows 10 Other proprietary fo |
| 195 | ttf-ms-win10-auto-sea | 11904 | 0 | 0 | 6 | NON_DISTRIBUTABLE: Microsoft Windows 10 SE Asian proprietary |
| 196 | ttf-ms-win10-auto-thai | 11905 | 0 | 0 | 6 | NON_DISTRIBUTABLE: Microsoft Windows 10 Thai proprietary fon |
| 197 | ttf-ms-win10-auto-zh_cn | 11906 | 0 | 0 | 6 | NON_DISTRIBUTABLE: Microsoft Windows 10 Simplified Chinese p |
| 198 | ttf-ms-win10-auto-zh_tw | 11907 | 0 | 0 | 6 | NON_DISTRIBUTABLE: Microsoft Windows 10 Traditional Chinese  |
| 199 | vapoursynth-plugin-mlrt-migx-runtime-git | 14183 | 0 | 0 | 6 | FETCH_FAILED |
| 200 | vaults | 6784 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_VENDORED_DEPS: GTK4+Rust |
| 201 | veracrypt-inyourlanguage | 6805 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN_EXHAUSTED: NON_FREE_LICENSE: VeraCrypt u |
| 202 | vstax | 7329 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aj) |
| 203 | waveloggate-git | 7637 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_MISSING: CAT/WSJT-X |
| 204 | xmcl-launcher | 13223 | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN: Minecraft launcher built with Electron |
| 205 | agave | 5093 | 0 | 0 | 7 | NEEDS_RECIPE_DESIGN_EXHAUSTED — DEAD_UPSTREAM |
| 206 | aurutils-git | 11962 | 0 | 0 | 7 | NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: AUR helper uti |
| 207 | dotnet-sdk-preview-bin | 10131 | 0 | 0 | 7 | NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_BINARY: proprieta |
| 208 | freedownloadmanager-bin | 5029 | 0 | 0 | 7 | NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY |
| 209 | gd-tools-git | 9402 | 0 | 0 | 7 | NEEDS_RECIPE_DESIGN_EXHAUSTED: GoldenDict tools (C++/xmake); |
| 210 | gnome-system-tools | 7365 | 0 | 0 | 7 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413ah) |
| 211 | komet | 5169 | 0 | 0 | 7 | NEEDS_RECIPE_DESIGN_EXHAUSTED — UPSTREAM_404 |
| 212 | lib32-glew1.10 | 11977 | 0 | 0 | 7 | LIB32_UNSUPPORTED |
| 213 | lib32-libbluray | 12169 | 0 | 0 | 7 | LIB32_UNSUPPORTED |
| 214 | logseq-desktop | 5042 | 0 | 0 | 7 | NEEDS_RECIPE_DESIGN |
| 215 | openclaw-git | 3955 | 0 | 0 | 7 | NEEDS_RECIPE_DESIGN_EXHAUSTED — NPM_COMPLEX: needs Bun+pnpm+ |
| 216 | pacman-static | 12893 | 0 | 0 | 7 | NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: statically lin |
| 217 | qtarcan-git | 3269 | 0 | 0 | 7 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aa) |
| 218 | supermario64-sm64ex-git | 12764 | 0 | 0 | 7 | LICENSE_REVIEW_NEEDED: requires Nintendo copyrighted baserom |
| 219 | tomcat8 | 3709 | 0 | 0 | 7 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413ah) |
| 220 | wlr-which-key | 8384 | 0 | 0 | 7 | NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED: Rust sour |
| 221 | arch-smart-update | 11536 | 0 | 0 | 8 | NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: Arch Linux upd |
| 222 | classisland-git | 11220 | 0 | 0 | 8 | NEEDS_RECIPE_DESIGN_EXHAUSTED: WINDOWS_ONLY_DOTNET: C#/.NET  |
| 223 | hyprshade | 7372 | 0 | 0 | 8 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aj) |
| 224 | intellij-idea-open-eap | 7594 | 0 | 0 | 8 | NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_BUILD: requires buil |
| 225 | kanidm | 11836 | 0 | 0 | 8 | NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED: identity  |
| 226 | lib32-nvidia-utils-beta | 2408 | 0 | 0 | 8 | LIB32_UNSUPPORTED + PROPRIETARY |
| 227 | lib32-openssl-1.0 | 11766 | 0 | 0 | 8 | LIB32_UNSUPPORTED |
| 228 | limine-dracut-support | 4745 | 0 | 0 | 8 | INITRAMFS_TOOL — Arch-specific initramfs/dracut hook |
| 229 | limine-mkinitcpio-hook | 1912 | 0 | 0 | 8 | INITRAMFS_TOOL — Arch-specific mkinitcpio hook |
| 230 | nitrox | 11669 | 0 | 0 | 8 | NEEDS_RECIPE_DESIGN_EXHAUSTED: DOTNET_REQUIRED + PROPRIETARY |
| 231 | octopi-git | 16712 | 0 | 0 | 8 | NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: Qt pacman GUI  |
| 232 | sage-numerical-backends-gurobi | 4053 | 0 | 0 | 8 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413ah) |
| 233 | whisparr-eros | 4808 | 0 | 0 | 8 | NEEDS_RECIPE_DESIGN |
| 234 | affine | 4107 | 0 | 0 | 9 | NEEDS_RECIPE_DESIGN_EXHAUSTED: NPM_ECOSYSTEM: Electron knowl |
| 235 | aurman | 1681 | 0 | 0 | 9 | ARCH_PACKAGE_MANAGER — Arch Linux AUR helper; depends on pac |
| 236 | bar_daemon | 3661 | 0 | 0 | 9 | NEEDS_RECIPE_DESIGN_EXHAUSTED — UPSTREAM_NOT_FOUND: cannot l |
| 237 | cachyos-service-manager | 3750 | 0 | 0 | 9 | NEEDS_RECIPE_DESIGN_EXHAUSTED — DISTRO_SPECIFIC: CachyOS-spe |
| 238 | certbot-dns-porkbun | 7604 | 0 | 0 | 9 | NEEDS_RECIPE_DESIGN_EXHAUSTED — PYTHON_PACKAGE_NOT_BINARY: P |
| 239 | conky-colors-git | 3249 | 0 | 0 | 9 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aa) |
| 240 | dropdeck-git | 3260 | 0 | 0 | 9 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aa) |
| 241 | intel-compute-runtime-legacy | 7681 | 0 | 0 | 9 | NEEDS_RECIPE_DESIGN |
| 242 | kabi-git | 5138 | 0 | 0 | 9 | NEEDS_RECIPE_DESIGN |
| 243 | lib32-bluez-libs | 2431 | 0 | 0 | 9 | LIB32_UNSUPPORTED |
| 244 | libastal-lua51-git | 14177 | 0 | 0 | 9 | FETCH_FAILED |
| 245 | libastal-lua53-git | 14176 | 0 | 0 | 9 | FETCH_FAILED |
| 246 | linux-lts515-docs | 7515 | 0 | 0 | 9 | COMPLEX_BUILD_DEPS: Linux LTS 5.15.x docs; kernel build infr |
| 247 | lyrionmusicserver | 3645 | 0 | 0 | 9 | NEEDS_RECIPE_DESIGN_EXHAUSTED: PERL_VERSION_PINNING: vendor  |
| 248 | mate-wayland-session | 13854 | 0 | 0 | 9 | NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_GUIX_DEPS: MATE Wayla |
| 249 | mips64-linux-gnu-gcc-bootstrap | 9045 | 0 | 0 | 9 | CROSS_TOOLCHAIN_COMPLEX |
| 250 | pricehist | 3083 | 0 | 0 | 9 | MISSING_DEPENDENCY — Python CLI for historical prices (gitla |
| 251 | python-cotengra | 14216 | 0 | 0 | 9 | FETCH_FAILED |
| 252 | python-niquests-git | 18784 | 0 | 0 | 9 | NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_PYTHON_DEPS: depends  |
| 253 | python-wa-crypt-tools-git | 14218 | 0 | 0 | 9 | FETCH_FAILED |
| 254 | spotify-1.1 | 4710 | 0 | 0 | 9 | PROPRIETARY_CLOSED_SOURCE |
| 255 | synergy3-bin | 3039 | 0 | 0 | 9 | proprietary download requires web-scraping token from symles |
| 256 | weylus-bin | 3102 | 0 | 0 | 9 | BUILD_SYSTEM_TOO_COMPLEX — Tablet as graphic tablet (github. |
| 257 | wireview-linux | 3074 | 0 | 0 | 9 | NONFREE_LICENSE — Unofficial Linux port of Thermal Grizzly W |
| 258 | yay-sys-tray-git | 3259 | 0 | 0 | 9 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413aa) |
| 259 | dooble | 1057 | 0 | 0 | 10 | NEEDS_RECIPE_DESIGN |
| 260 | esp-idf | 12920 | 0 | 0 | 10 | NEEDS_RECIPE_DESIGN_EXHAUSTED: CROSS_COMPILER_SDK: IoT dev f |
| 261 | forticlient | 4346 | 0 | 0 | 10 | NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY: Fortinet VPN cli |
| 262 | karp-git | 7521 | 0 | 0 | 10 | NEEDS_RECIPE_DESIGN_EXHAUSTED — KDE6_MISSING: PDF editor nee |
| 263 | libvhdi-git | 5271 | 0 | 0 | 10 | NEEDS_RECIPE_DESIGN |
| 264 | optimus-manager-git | 13329 | 0 | 0 | 10 | NEEDS_RECIPE_DESIGN: Nvidia Optimus GPU switching manager |
| 265 | pamac-all | 3636 | 0 | 0 | 10 | NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: Manjaro packag |
| 266 | pat-aur-client-firmware-git | 13380 | 0 | 0 | 10 | NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: firmware updat |
| 267 | qmmp-plugin-pack | 4720 | 0 | 0 | 10 | NEEDS_RECIPE_DESIGN |
| 268 | redisinsight | 746 | 0 | 0 | 10 | NEEDS_RECIPE_DESIGN_EXHAUSTED: Redis GUI; Electron/npm |
| 269 | simracing-essentials | 13185 | 0 | 0 | 10 | NEEDS_RECIPE_DESIGN: SimRacing tool bundle |
| 270 | trizen | 1582 | 0 | 0 | 10 | ARCH_PACKAGE_MANAGER — Arch Linux AUR helper; depends on pac |
| 271 | wifiman-desktop | 7603 | 0 | 0 | 10 | NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY: Ubiquiti propri |
| 272 | winboat | 7376 | 0 | 0 | 10 | NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_BUILD: Go+npm dual e |
| 273 | clyp-bin | 14227 | 0 | 0 | 11 | FETCH_FAILED |
| 274 | cvmfs | 12904 | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: CernVM File System with complex nativ |
| 275 | hyprlauncher-git | 7694 | 0 | 0 | 11 | NEEDS_RECIPE_DESIGN_EXHAUSTED — HYPRLAND_ECOSYSTEM: needs 5+ |
| 276 | kdelibs4support | 10726 | 0 | 0 | 11 | NEEDS_RECIPE_DESIGN_EXHAUSTED — LEGACY_KDE_INFRA: KDE4 compa |
| 277 | pamac-classic-fixed | 13115 | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: requires libalpm/pacman stack not ava |
| 278 | paru-static | 3615 | 0 | 0 | 11 | ARCH_SPECIFIC: static binary of paru AUR helper; wraps pacma |
| 279 | pat-aur-client-flatpak-git | 13379 | 0 | 0 | 11 | NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: depends on pa |
| 280 | qbittorrent-enhanced-ua-nox | 13343 | 0 | 0 | 11 | NEEDS_RECIPE_DESIGN: qBittorrent Enhanced fork (headless) |
| 281 | wasistlos | 3824 | 0 | 0 | 11 | NEEDS_RECIPE_DESIGN |
| 282 | wiso-steuer-2026 | 3733 | 0 | 0 | 11 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413ah) |
| 283 | yandex-music-windows | 7260 | 0 | 0 | 11 | NEEDS_RECIPE_DESIGN_EXHAUSTED: WINDOWS_ONLY: Yandex Music Wi |
| 284 | hyprsettings-git | 7440 | 0 | 0 | 12 | NEEDS_RECIPE_DESIGN_EXHAUSTED — MISSING_GUIX_DEPS: needs pyt |
| 285 | spotify-dev | 22723 | 0 | 0 | 12 | PROPRIETARY_CLOSED_SOURCE |
| 286 | cryptopro-csp-k1 | 199 | 0 | 0 | 13 | PROPRIETARY_CLOSED_SOURCE — Proprietary closed-source; no re |
| 287 | lazarus-gtk2 | 3644 | 0 | 0 | 13 | NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_GUIX_DEPS: requires F |
| 288 | nextpnr-ice40-nightly | 4770 | 0 | 0 | 13 | NEEDS_RECIPE_DESIGN |
| 289 | penpot-frontend | 13307 | 0 | 0 | 13 | NEEDS_RECIPE_DESIGN_EXHAUSTED: design tool frontend; same as |
| 290 | qbittorrent-enhanced-ua | 13344 | 0 | 0 | 13 | NEEDS_RECIPE_DESIGN: qBittorrent Enhanced fork (GUI) |
| 291 | mssql-server | 6117 | 0 | 0 | 14 | PROPRIETARY_SERVER — Microsoft SQL Server; proprietary binar |
| 292 | mingw-w64-gtk3 | 4057 | 0 | 0 | 15 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413ah) |
| 293 | moc-pulse | 12781 | 0 | 0 | 15 | NEEDS_RECIPE_DESIGN: MOC (music on console) rebuild with Pul |
| 294 | gx52 | 10061 | 0 | 0 | 16 | NEEDS_RECIPE_DESIGN_EXHAUSTED — MISSING_GUIX_DEPS: Logitech  |
| 295 | incplot | 13477 | 0 | 0 | 16 | NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: 9 custom C++ d |
| 296 | linux-g14 | 3762 | 0 | 0 | 16 | NEEDS_RECIPE_DESIGN_EXHAUSTED (recipe-resolver-260413ah) |
| 297 | nip4 | 14226 | 0 | 0 | 16 | FETCH_FAILED |
| 298 | python-rapidocr | 6825 | 0 | 0 | 16 | INFEASIBLE_BUILD: unpackaged Python deps |
| 299 | tensorrt-cross-builder-libs | 7024 | 0 | 0 | 16 | PROPRIETARY_SDK — NVIDIA TensorRT SDK; proprietary, requires |
| 300 | collabora-office | 13314 | 0 | 0 | 17 | NEEDS_RECIPE_DESIGN: Massive LibreOffice fork with Collabora |
| 301 | invidious | 13345 | 0 | 0 | 17 | DEP_RESOLUTION_FAILED: Alternative YouTube frontend written  |
| 302 | linux-libre-hardened-docs | 7201 | 0 | 0 | 17 | COMPLEX_BUILD_DEPS: Linux-libre hardened docs; kernel build  |
| 303 | pat-aur-host-git | 13377 | 0 | 0 | 17 | NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: pacman/makepk |
| 304 | python-urllib3-future-git | 18341 | 0 | 0 | 17 | NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_PYTHON_DEPS: requires |
| 305 | scx-scheds-git | 13199 | 0 | 0 | 17 | NEEDS_RECIPE_DESIGN: sched_ext schedulers for Linux kernel |
| 306 | sulis-git | 13328 | 0 | 0 | 17 | NEEDS_RECIPE_DESIGN: Complex Rust tactical RPG with custom 2 |
| 307 | syncthingtray | 29 | 0 | 0 | 17 | NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: Qt5/6 tray app |
| 308 | uac-polkit-agent-git | 3078 | 0 | 0 | 17 | NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413b; |
| 309 | lianli-linux-git | 12752 | 0 | 0 | 18 | NEEDS_RECIPE_DESIGN: USB HID controller for Lian Li hardware |
| 310 | linux-mainline-docs | 11796 | 0 | 0 | 18 | COMPLEX_BUILD_DEPS: Linux mainline kernel docs; duplicate of |
| 311 | pamac-aur | 11788 | 0 | 0 | 18 | NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: depends on pa |
| 312 | python-dlib-cuda | 12911 | 0 | 0 | 18 | NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_CUDA: CUDA varian |
| 313 | mozillavpn-git | 3962 | 0 | 0 | 19 | NEEDS_RECIPE_DESIGN_EXHAUSTED: BUILD_SYSTEM_TOO_COMPLEX: Rus |
| 314 | python-tensorrt | 7026 | 0 | 0 | 19 | NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_CUDA: NVIDIA Ten |
| 315 | cosmic-settings-git | 9078 | 0 | 0 | 20 | INFEASIBLE_BUILD: needs COSMIC desktop |
| 316 | lib32-rust-libs-git | 13318 | 0 | 0 | 20 | NEEDS_RECIPE_DESIGN: Rust 32-bit multilib libraries |
| 317 | linux-cachyos-bore | 6123 | 0 | 0 | 22 | KERNEL_BUILD: CachyOS custom kernel with BORE |
| 318 | streamrip | 5050 | 0 | 0 | 23 | NEEDS_RECIPE_DESIGN |
| 319 | syca | 4162 | 0 | 0 | 26 | NEEDS_RECIPE_DESIGN |
| 320 | apollo | 8835 | 0 | 0 | 27 | NEEDS_RECIPE_DESIGN |
| 321 | lutris-live-bin | 1396 | 0 | 0 | 27 | NEEDS_RECIPE_DESIGN |
| 322 | maestral | 722 | 0 | 0 | 27 | NEEDS_RECIPE_DESIGN |
| 323 | postman-bin | 2056 | 0 | 0 | 27 | NEEDS_RECIPE_DESIGN |
| 324 | qmplay2 | 10794 | 0 | 0 | 27 | NEEDS_RECIPE_DESIGN |
| 325 | linux-pf-headers | 4263 | 0 | 0 | 28 | KERNEL_HEADERS — Guix provides kernel headers through its ow |
| 326 | somewm-git | 12032 | 0 | 0 | 29 | NEEDS_RECIPE_DESIGN |
| 327 | mimose-bin | 7641 | 0 | 0 | 30 | NEEDS_RECIPE_DESIGN |
| 328 | sunshine | 21583 | 0 | 0 | 30 | NEEDS_RECIPE_DESIGN |
| 329 | 86box-git | 5286 | 0 | 0 | 31 | NEEDS_RECIPE_DESIGN |
| 330 | alice-vision | 4528 | 0 | 0 | 31 | INFEASIBLE_BUILD: unpackaged deps |
| 331 | flaresolverr-bin | 2108 | 0 | 0 | 31 | NEEDS_RECIPE_DESIGN |
| 332 | vcvrack | 558 | 0 | 0 | 32 | NEEDS_RECIPE_DESIGN |
| 333 | dragengine | 7020 | 0 | 0 | 34 | INFEASIBLE_BUILD: game engine, unpackaged deps |
| 334 | sway-scroll | 1012 | 0 | 0 | 34 | NEEDS_RECIPE_DESIGN |
| 335 | cdesktopenv | 7739 | 0 | 0 | 35 | NEEDS_RECIPE_DESIGN |
| 336 | citron | 11666 | 0 | 0 | 36 | NEEDS_RECIPE_DESIGN |
| 337 | idescriptor-git | 1073 | 0 | 0 | 36 | NEEDS_RECIPE_DESIGN |
| 338 | bottles-git | 18950 | 0 | 0 | 37 | NEEDS_RECIPE_DESIGN |
| 339 | xemu-git | 10125 | 0 | 0 | 37 | NEEDS_RECIPE_DESIGN |
| 340 | nautilus-typeahead | 676 | 0 | 0 | 38 | NEEDS_RECIPE_DESIGN |
| 341 | orca-slicer | 540 | 0 | 0 | 38 | NEEDS_RECIPE_DESIGN |
| 342 | amdonly-gaming-vulkan-mesa-layers-git | 6639 | 0 | 0 | 40 | INFEASIBLE_BUILD: custom Mesa |
| 343 | amdonly-gaming-opencl-rusticl-mesa-git | 6640 | 0 | 0 | 44 | INFEASIBLE_BUILD: custom Mesa |
| 344 | gopher64-git | 10000 | 0 | 0 | 44 | NEEDS_RECIPE_DESIGN |
| 345 | amdonly-gaming-vulkan-radeon-git | 6638 | 0 | 0 | 45 | INFEASIBLE_BUILD: custom Mesa |
| 346 | amdonly-gaming-mesa-git | 6641 | 0 | 0 | 47 | INFEASIBLE_BUILD: custom Mesa |
| 347 | linuxcnc | 4651 | 0 | 0 | 48 | NEEDS_RECIPE_DESIGN |
| 348 | wps-office-365-edu-fonts | 4613 | 0 | 0 | 51 | NEEDS_RECIPE_DESIGN |
| 349 | gnome-meta | 5035 | 0 | 0 | 58 | NEEDS_RECIPE_DESIGN |
| 350 | positron-ide-devel-bin | 2113 | 0 | 0 | 74 | NEEDS_RECIPE_DESIGN |
| 351 | qemu-headless-git | 6567 | 0 | 0 | 116 | INFEASIBLE_BUILD: full QEMU from git |
| 352 | oterm | 10222 | 1 | 1 | 18 | NEEDS_RECIPE_DESIGN |
| 353 | backup-warden | 932 | 1 | 1 | 20 | NEEDS_RECIPE_DESIGN |
| 354 | aurto | 3617 | 1 | 0 | 11 | NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: AUR auto-build |
