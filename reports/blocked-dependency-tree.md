# Blocked Dependency Tree

**Generated:** 2026-04-26T11:50:21Z  
**Pass ID:** deptree-resolver-260426f  

## Summary

| Metric | Value |
|--------|-------|
| Total BLOCKED | 243 |
| In AUR cache | 238 |
| Zero blocked deps | 240 |

## Blocking Reason Distribution

| Reason | Count |
|--------|-------|
| DEP_RESOLUTION_FAILED | 98 |
| TOOLING_FAILURE | 24 |
| SOURCE_UNAVAILABLE | 15 |
| DISTRO_SPECIFIC | 14 |
| DKMS_KERNEL_MODULE | 11 |
| MINGW_CROSS_COMPILATION | 9 |
| MULTILIB_UNSUPPORTED | 7 |
| PROPRIETARY_BINARY | 6 |
| AUR_REPO_DELETED | 5 |
| LICENSE_REVIEW_NEEDED | 5 |
| PLATFORM_UNSUPPORTED | 5 |
| NEEDS_RECIPE_DESIGN | 4 |
| GCC_SNAPSHOT_RUNTIME | 4 |
| COMPLEX_BUILD | 4 |
| NON_DISTRIBUTABLE | 4 |
| COMPLEX_DEPS | 4 |
| KERNEL_SPECIFIC | 3 |
| BUILD_FAILED | 3 |
| SELINUX_SPECIFIC | 2 |
| KERNEL_MODULE | 2 |
| ABANDONED_UPSTREAM | 2 |
| LEGACY_PYTHON2 | 2 |
| PROPRIETARY_DEP | 2 |
| CROSS_COMPILATION | 1 |
| ROCM_DEPENDENCY | 1 |
| NEEDS_INVESTIGATION | 1 |
| CUDA_DEPENDENCY | 1 |
| BROWSER_EXTENSION | 1 |
| MISSING_DEP | 1 |
| PROPRIETARY_PLATFORM | 1 |
| ARCH_SPECIFIC | 1 |

## Priority Queue (Top 200)

| Rank | Package | Blocked Deps | Reverse Deps | Total Deps | Reason |
|------|---------|-------------|-------------|-----------|--------|
| 1 | gradience | 0 | 1 | 0 | DEP_RESOLUTION_FAILED |
| 2 | sudo-selinux | 0 | 1 | 8 | SELINUX_SPECIFIC |
| 3 | base-selinux | 0 | 1 | 18 | SELINUX_SPECIFIC |
| 4 | virtualbox-svn | 0 | 1 | 53 | DEP_RESOLUTION_FAILED |
| 5 | deadbeef-mpris2-plugin | 0 | 0 | 0 | SOURCE_UNAVAILABLE |
| 6 | linux6.18.22-1-lts-bin | 0 | 0 | 0 | SOURCE_UNAVAILABLE |
| 7 | matlab-jre-bundled | 0 | 0 | 0 | SOURCE_UNAVAILABLE |
| 8 | sipgate-app-clinq | 0 | 0 | 0 | NEEDS_RECIPE_DESIGN |
| 9 | squareline-studio | 0 | 0 | 0 | PROPRIETARY_BINARY |
| 10 | aquacomputer_d5next-hwmon-dkms | 0 | 0 | 1 | DKMS_KERNEL_MODULE |
| 11 | bakkesmod-steam | 0 | 0 | 1 | PLATFORM_UNSUPPORTED |
| 12 | edgeimpulse-cli | 0 | 0 | 1 | DEP_RESOLUTION_FAILED |
| 13 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | BROWSER_EXTENSION |
| 14 | luniistore | 0 | 0 | 1 | SOURCE_UNAVAILABLE |
| 15 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | DISTRO_SPECIFIC |
| 16 | repacman | 0 | 0 | 1 | DISTRO_SPECIFIC |
| 17 | simplicity-commander | 0 | 0 | 1 | SOURCE_UNAVAILABLE |
| 18 | amneziawg-dkms-git | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 19 | amneziawg-linux | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 20 | amneziawg-linux-hardened | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 21 | android-platform-19 | 0 | 0 | 2 | PLATFORM_UNSUPPORTED |
| 22 | android-platform-21 | 0 | 0 | 2 | PLATFORM_UNSUPPORTED |
| 23 | archwiki-offline | 0 | 0 | 2 | DISTRO_SPECIFIC |
| 24 | aws-amplify-cli | 0 | 0 | 2 | DEP_RESOLUTION_FAILED |
| 25 | aws-cdk | 0 | 0 | 2 | DEP_RESOLUTION_FAILED |
| 26 | brother-mfc-l2400dw | 0 | 0 | 2 | PROPRIETARY_BINARY |
| 27 | emmet-language-server | 0 | 0 | 2 | DEP_RESOLUTION_FAILED |
| 28 | faustus-dkms-git | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 29 | findbrokenpkgs | 0 | 0 | 2 | DISTRO_SPECIFIC |
| 30 | ideapad-laptop-tb-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 31 | ideapad-laptop-tb2024g6plus-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 32 | knossu | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 33 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | MULTILIB_UNSUPPORTED |
| 34 | libch343ser-git | 0 | 0 | 2 | KERNEL_MODULE |
| 35 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | PROPRIETARY_BINARY |
| 36 | mingw-w64-cblas | 0 | 0 | 2 | MINGW_CROSS_COMPILATION |
| 37 | mingw-w64-lapack | 0 | 0 | 2 | MINGW_CROSS_COMPILATION |
| 38 | mingw-w64-soundtouch | 0 | 0 | 2 | MINGW_CROSS_COMPILATION |
| 39 | nodejs-cspell | 0 | 0 | 2 | DEP_RESOLUTION_FAILED |
| 40 | osmtogeojson | 0 | 0 | 2 | DEP_RESOLUTION_FAILED |
| 41 | pfring-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 42 | python-home-assistant-frontend | 0 | 0 | 2 | DEP_RESOLUTION_FAILED |
| 43 | r8126-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 44 | receitanet | 0 | 0 | 2 | SOURCE_UNAVAILABLE |
| 45 | sbctl-initcpio-post-hook | 0 | 0 | 2 | DISTRO_SPECIFIC |
| 46 | system-age | 0 | 0 | 2 | DISTRO_SPECIFIC |
| 47 | ttf-consolas-ligaturized | 0 | 0 | 2 | NON_DISTRIBUTABLE |
| 48 | vscodium-marketplace | 0 | 0 | 2 | TOOLING_FAILURE |
| 49 | wyc | 0 | 0 | 2 | SOURCE_UNAVAILABLE |
| 50 | java-language-server | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 51 | libarchive-static | 0 | 0 | 3 | TOOLING_FAILURE |
| 52 | lightdm-webkit-theme-aether | 0 | 0 | 3 | ABANDONED_UPSTREAM |
| 53 | linux-keep-modules | 0 | 0 | 3 | DISTRO_SPECIFIC |
| 54 | nfuspire-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 55 | nodejs-nestjs-cli | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 56 | nvidia-bl-dkms | 0 | 0 | 3 | DKMS_KERNEL_MODULE |
| 57 | pacpak-git | 0 | 0 | 3 | DISTRO_SPECIFIC |
| 58 | phonon-qt4-vlc | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 59 | quartz-utils-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 60 | rdt-client | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 61 | texmacs-pure | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 62 | chromium-extension-arch-search | 0 | 0 | 4 | DISTRO_SPECIFIC |
| 63 | clash-for-windows-chinese | 0 | 0 | 4 | ABANDONED_UPSTREAM |
| 64 | eclipse-pydev | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 65 | euroscope-bin | 0 | 0 | 4 | PLATFORM_UNSUPPORTED |
| 66 | gbm | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 67 | gephi-git | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 68 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | SOURCE_UNAVAILABLE |
| 69 | rtl88x2ce-dkms-git | 0 | 0 | 4 | DKMS_KERNEL_MODULE |
| 70 | urbanterror | 0 | 0 | 4 | SOURCE_UNAVAILABLE |
| 71 | ut2004-gog | 0 | 0 | 4 | NON_DISTRIBUTABLE |
| 72 | zfs-linux-hardened-headers | 0 | 0 | 4 | KERNEL_SPECIFIC |
| 73 | zfs-linux-rt-headers | 0 | 0 | 4 | KERNEL_SPECIFIC |
| 74 | futu-ftnn-wine | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN |
| 75 | inkdrop | 0 | 0 | 5 | PROPRIETARY_BINARY |
| 76 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | CROSS_COMPILATION |
| 77 | mailnaggertray-git | 0 | 0 | 5 | DEP_RESOLUTION_FAILED |
| 78 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | TOOLING_FAILURE |
| 79 | pamac-cli | 0 | 0 | 5 | DISTRO_SPECIFIC |
| 80 | pulumi-git | 0 | 0 | 5 | DEP_RESOLUTION_FAILED |
| 81 | python-gradio-pdf | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN |
| 82 | python-jaxlib-bin | 0 | 0 | 5 | SOURCE_UNAVAILABLE |
| 83 | python-pypi2pkgbuild | 0 | 0 | 5 | DISTRO_SPECIFIC |
| 84 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | PROPRIETARY_DEP |
| 85 | unrealtournament4 | 0 | 0 | 5 | NON_DISTRIBUTABLE |
| 86 | zfs-linux-git-headers | 0 | 0 | 5 | KERNEL_SPECIFIC |
| 87 | asp | 0 | 0 | 6 | DISTRO_SPECIFIC |
| 88 | aurutils | 0 | 0 | 6 | DISTRO_SPECIFIC |
| 89 | awk-language-server | 0 | 0 | 6 | DEP_RESOLUTION_FAILED |
| 90 | factorio-space-age-experimental | 0 | 0 | 6 | NON_DISTRIBUTABLE |
| 91 | fileoptimizer-bin | 0 | 0 | 6 | PLATFORM_UNSUPPORTED |
| 92 | lib32-libglade | 0 | 0 | 6 | MULTILIB_UNSUPPORTED |
| 93 | mingw-w64-boost | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 94 | mingw-w64-cppwinrt | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 95 | mingw-w64-pcre2 | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 96 | mingw-w64-spirv-tools | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 97 | vegastrike-git | 0 | 0 | 6 | DEP_RESOLUTION_FAILED |
| 98 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | TOOLING_FAILURE |
| 99 | arti-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 100 | dxvk-async-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 101 | eddiscovery | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 102 | glibc-eac | 0 | 0 | 7 | COMPLEX_DEPS |
| 103 | lib32-libxpm | 0 | 0 | 7 | MULTILIB_UNSUPPORTED |
| 104 | limine-snapper-sync-git | 0 | 0 | 7 | SOURCE_UNAVAILABLE |
| 105 | linux-gpib | 0 | 0 | 7 | KERNEL_MODULE |
| 106 | logstash | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 107 | mingw-w64-postgresql | 0 | 0 | 7 | MINGW_CROSS_COMPILATION |
| 108 | mkinitcpio-clevis-hook | 0 | 0 | 7 | ARCH_SPECIFIC |
| 109 | obs-plugin-input-overlay-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 110 | pikeru | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 111 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 112 | prs | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 113 | python2-gimp | 0 | 0 | 7 | LEGACY_PYTHON2 |
| 114 | wayprompt-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 115 | wldash | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 116 | yt-x-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 117 | anytxt-bin | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED |
| 118 | coreutils-arch | 0 | 0 | 8 | TOOLING_FAILURE |
| 119 | emerald | 0 | 0 | 8 | MISSING_DEP |
| 120 | go2tv | 0 | 0 | 8 | DEP_RESOLUTION_FAILED |
| 121 | lib32-sdl_sound | 0 | 0 | 8 | MULTILIB_UNSUPPORTED |
| 122 | mingw-w64-lame | 0 | 0 | 8 | MINGW_CROSS_COMPILATION |
| 123 | pianoteq-stage | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED |
| 124 | pikaur-static | 0 | 0 | 8 | TOOLING_FAILURE |
| 125 | pikaur-static-git | 0 | 0 | 8 | TOOLING_FAILURE |
| 126 | rocketchat-desktop | 0 | 0 | 8 | DEP_RESOLUTION_FAILED |
| 127 | vmd | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED |
| 128 | webcord-vencord-git | 0 | 0 | 8 | DEP_RESOLUTION_FAILED |
| 129 | xeme-hg | 0 | 0 | 8 | SOURCE_UNAVAILABLE |
| 130 | anyrun-git | 0 | 0 | 9 | COMPLEX_BUILD |
| 131 | boost-python2 | 0 | 0 | 9 | LEGACY_PYTHON2 |
| 132 | epub_to_audiobook-git | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 133 | frame-eth | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 134 | freetube-electron-git | 0 | 0 | 9 | COMPLEX_DEPS |
| 135 | lib32-vkbasalt | 0 | 0 | 9 | TOOLING_FAILURE |
| 136 | madness-interactive-reloaded | 0 | 0 | 9 | SOURCE_UNAVAILABLE |
| 137 | mobirise | 0 | 0 | 9 | LICENSE_REVIEW_NEEDED |
| 138 | network-manager-applet-nolibappindicator | 0 | 0 | 9 | TOOLING_FAILURE |
| 139 | open-tv | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 140 | pcem-git | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 141 | prey | 0 | 0 | 9 | SOURCE_UNAVAILABLE |
| 142 | python-pylink-square | 0 | 0 | 9 | PROPRIETARY_DEP |
| 143 | shijima-qt | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 144 | auracle-git | 0 | 0 | 10 | DISTRO_SPECIFIC |
| 145 | ausweiskopie | 0 | 0 | 10 | SOURCE_UNAVAILABLE |
| 146 | beignet-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 147 | borgwarehouse | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 148 | hnefatafl-copenhagen | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 149 | libfive-studio-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 150 | libga68-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 151 | libgfortran-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 152 | libgnat-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 153 | libgo-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 154 | linux-sched-ext-git-headers | 0 | 0 | 10 | TOOLING_FAILURE |
| 155 | linux-tip-git-headers | 0 | 0 | 10 | TOOLING_FAILURE |
| 156 | mailspring | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 157 | nvidia-390xx-settings | 0 | 0 | 10 | TOOLING_FAILURE |
| 158 | pantheon-polkit-agent-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 159 | vanilla-wiiu-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 160 | virtualbox-bin-sdk | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 161 | cockatrice-server-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 162 | fancy-cat | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 163 | lto-dump-snapshot | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 164 | luxtorpeda-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 165 | principia-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 166 | python-google-cloud-speech | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 167 | synfigstudio-dev | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 168 | vegastrike-engine-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 169 | vgmstream-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 170 | whatip-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 171 | devtools-git | 0 | 0 | 12 | TOOLING_FAILURE |
| 172 | envoyproxy | 0 | 0 | 12 | BUILD_FAILED |
| 173 | gst-plugins-rs-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED |
| 174 | linux-xanmod-lts-headers | 0 | 0 | 12 | TOOLING_FAILURE |
| 175 | mingw-w64-libopenmpt | 0 | 0 | 12 | TOOLING_FAILURE |
| 176 | opendrop-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED |
| 177 | wayfire-plugins-extra-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED |
| 178 | betterx-desktop-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED |
| 179 | capt-src | 0 | 0 | 13 | MULTILIB_UNSUPPORTED |
| 180 | glsmac-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED |
| 181 | illogical-impulse-ags | 0 | 0 | 13 | NEEDS_INVESTIGATION |
| 182 | python-jax-rocm | 0 | 0 | 13 | ROCM_DEPENDENCY |
| 183 | yacreader-poppler-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED |
| 184 | goxlr-utility-ui | 0 | 0 | 14 | DEP_RESOLUTION_FAILED |
| 185 | lincity-ng-git | 0 | 0 | 14 | DEP_RESOLUTION_FAILED |
| 186 | linux-cachyos-hardened-headers | 0 | 0 | 14 | TOOLING_FAILURE |
| 187 | linux-next-git-headers | 0 | 0 | 14 | TOOLING_FAILURE |
| 188 | rpfm-git | 0 | 0 | 14 | COMPLEX_BUILD |
| 189 | deepin-wine8-stable | 0 | 0 | 15 | PROPRIETARY_BINARY |
| 190 | lightlyshaders-git | 0 | 0 | 15 | DEP_RESOLUTION_FAILED |
| 191 | linux-covolunablu-gaming-headers | 0 | 0 | 15 | TOOLING_FAILURE |
| 192 | panda3ds | 0 | 0 | 15 | DEP_RESOLUTION_FAILED |
| 193 | php-legacy-pdlib | 0 | 0 | 15 | DEP_RESOLUTION_FAILED |
| 194 | qt6-xcb-private-headers-git | 0 | 0 | 15 | DEP_RESOLUTION_FAILED |
| 195 | scans2any-git | 0 | 0 | 15 | DEP_RESOLUTION_FAILED |
| 196 | veloren | 0 | 0 | 15 | DEP_RESOLUTION_FAILED |
| 197 | vmware-workstation | 0 | 0 | 15 | PROPRIETARY_BINARY |
| 198 | lcd4linux-git | 0 | 0 | 16 | DEP_RESOLUTION_FAILED |
| 199 | gjs-nohammer | 0 | 0 | 17 | DEP_RESOLUTION_FAILED |
| 200 | gvfs-smb-git | 0 | 0 | 17 | DEP_RESOLUTION_FAILED |

## Selected for This Pass (top 100)

1. **gradience** (blocked_deps=0, reverse_deps=1, total_deps=0) — DEP_RESOLUTION_FAILED
2. **sudo-selinux** (blocked_deps=0, reverse_deps=1, total_deps=8) — SELINUX_SPECIFIC
3. **base-selinux** (blocked_deps=0, reverse_deps=1, total_deps=18) — SELINUX_SPECIFIC
4. **virtualbox-svn** (blocked_deps=0, reverse_deps=1, total_deps=53) — DEP_RESOLUTION_FAILED
5. **deadbeef-mpris2-plugin** (blocked_deps=0, reverse_deps=0, total_deps=0) — SOURCE_UNAVAILABLE
6. **linux6.18.22-1-lts-bin** (blocked_deps=0, reverse_deps=0, total_deps=0) — SOURCE_UNAVAILABLE
7. **matlab-jre-bundled** (blocked_deps=0, reverse_deps=0, total_deps=0) — SOURCE_UNAVAILABLE
8. **sipgate-app-clinq** (blocked_deps=0, reverse_deps=0, total_deps=0) — NEEDS_RECIPE_DESIGN
9. **squareline-studio** (blocked_deps=0, reverse_deps=0, total_deps=0) — PROPRIETARY_BINARY
10. **aquacomputer_d5next-hwmon-dkms** (blocked_deps=0, reverse_deps=0, total_deps=1) — DKMS_KERNEL_MODULE
11. **bakkesmod-steam** (blocked_deps=0, reverse_deps=0, total_deps=1) — PLATFORM_UNSUPPORTED
12. **edgeimpulse-cli** (blocked_deps=0, reverse_deps=0, total_deps=1) — DEP_RESOLUTION_FAILED
13. **librewolf-extension-ublock-origin-bin** (blocked_deps=0, reverse_deps=0, total_deps=1) — BROWSER_EXTENSION
14. **luniistore** (blocked_deps=0, reverse_deps=0, total_deps=1) — SOURCE_UNAVAILABLE
15. **mkinitcpio-systemd-root-password** (blocked_deps=0, reverse_deps=0, total_deps=1) — DISTRO_SPECIFIC
16. **repacman** (blocked_deps=0, reverse_deps=0, total_deps=1) — DISTRO_SPECIFIC
17. **simplicity-commander** (blocked_deps=0, reverse_deps=0, total_deps=1) — SOURCE_UNAVAILABLE
18. **amneziawg-dkms-git** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
19. **amneziawg-linux** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
20. **amneziawg-linux-hardened** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
21. **android-platform-19** (blocked_deps=0, reverse_deps=0, total_deps=2) — PLATFORM_UNSUPPORTED
22. **android-platform-21** (blocked_deps=0, reverse_deps=0, total_deps=2) — PLATFORM_UNSUPPORTED
23. **archwiki-offline** (blocked_deps=0, reverse_deps=0, total_deps=2) — DISTRO_SPECIFIC
24. **aws-amplify-cli** (blocked_deps=0, reverse_deps=0, total_deps=2) — DEP_RESOLUTION_FAILED
25. **aws-cdk** (blocked_deps=0, reverse_deps=0, total_deps=2) — DEP_RESOLUTION_FAILED
26. **brother-mfc-l2400dw** (blocked_deps=0, reverse_deps=0, total_deps=2) — PROPRIETARY_BINARY
27. **emmet-language-server** (blocked_deps=0, reverse_deps=0, total_deps=2) — DEP_RESOLUTION_FAILED
28. **faustus-dkms-git** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
29. **findbrokenpkgs** (blocked_deps=0, reverse_deps=0, total_deps=2) — DISTRO_SPECIFIC
30. **ideapad-laptop-tb-dkms** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
31. **ideapad-laptop-tb2024g6plus-dkms** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
32. **knossu** (blocked_deps=0, reverse_deps=0, total_deps=2) — NEEDS_RECIPE_DESIGN
33. **lib32-opencl-nvidia-390xx** (blocked_deps=0, reverse_deps=0, total_deps=2) — MULTILIB_UNSUPPORTED
34. **libch343ser-git** (blocked_deps=0, reverse_deps=0, total_deps=2) — KERNEL_MODULE
35. **libfprint-2-tod1-broadcom-cv3plus** (blocked_deps=0, reverse_deps=0, total_deps=2) — PROPRIETARY_BINARY
36. **mingw-w64-cblas** (blocked_deps=0, reverse_deps=0, total_deps=2) — MINGW_CROSS_COMPILATION
37. **mingw-w64-lapack** (blocked_deps=0, reverse_deps=0, total_deps=2) — MINGW_CROSS_COMPILATION
38. **mingw-w64-soundtouch** (blocked_deps=0, reverse_deps=0, total_deps=2) — MINGW_CROSS_COMPILATION
39. **nodejs-cspell** (blocked_deps=0, reverse_deps=0, total_deps=2) — DEP_RESOLUTION_FAILED
40. **osmtogeojson** (blocked_deps=0, reverse_deps=0, total_deps=2) — DEP_RESOLUTION_FAILED
41. **pfring-dkms** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
42. **python-home-assistant-frontend** (blocked_deps=0, reverse_deps=0, total_deps=2) — DEP_RESOLUTION_FAILED
43. **r8126-dkms** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
44. **receitanet** (blocked_deps=0, reverse_deps=0, total_deps=2) — SOURCE_UNAVAILABLE
45. **sbctl-initcpio-post-hook** (blocked_deps=0, reverse_deps=0, total_deps=2) — DISTRO_SPECIFIC
46. **system-age** (blocked_deps=0, reverse_deps=0, total_deps=2) — DISTRO_SPECIFIC
47. **ttf-consolas-ligaturized** (blocked_deps=0, reverse_deps=0, total_deps=2) — NON_DISTRIBUTABLE
48. **vscodium-marketplace** (blocked_deps=0, reverse_deps=0, total_deps=2) — TOOLING_FAILURE
49. **wyc** (blocked_deps=0, reverse_deps=0, total_deps=2) — SOURCE_UNAVAILABLE
50. **java-language-server** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
51. **libarchive-static** (blocked_deps=0, reverse_deps=0, total_deps=3) — TOOLING_FAILURE
52. **lightdm-webkit-theme-aether** (blocked_deps=0, reverse_deps=0, total_deps=3) — ABANDONED_UPSTREAM
53. **linux-keep-modules** (blocked_deps=0, reverse_deps=0, total_deps=3) — DISTRO_SPECIFIC
54. **nfuspire-git** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
55. **nodejs-nestjs-cli** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
56. **nvidia-bl-dkms** (blocked_deps=0, reverse_deps=0, total_deps=3) — DKMS_KERNEL_MODULE
57. **pacpak-git** (blocked_deps=0, reverse_deps=0, total_deps=3) — DISTRO_SPECIFIC
58. **phonon-qt4-vlc** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
59. **quartz-utils-git** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
60. **rdt-client** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
61. **texmacs-pure** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
62. **chromium-extension-arch-search** (blocked_deps=0, reverse_deps=0, total_deps=4) — DISTRO_SPECIFIC
63. **clash-for-windows-chinese** (blocked_deps=0, reverse_deps=0, total_deps=4) — ABANDONED_UPSTREAM
64. **eclipse-pydev** (blocked_deps=0, reverse_deps=0, total_deps=4) — DEP_RESOLUTION_FAILED
65. **euroscope-bin** (blocked_deps=0, reverse_deps=0, total_deps=4) — PLATFORM_UNSUPPORTED
66. **gbm** (blocked_deps=0, reverse_deps=0, total_deps=4) — DEP_RESOLUTION_FAILED
67. **gephi-git** (blocked_deps=0, reverse_deps=0, total_deps=4) — DEP_RESOLUTION_FAILED
68. **plugin-autenticacao-gov-pt** (blocked_deps=0, reverse_deps=0, total_deps=4) — SOURCE_UNAVAILABLE
69. **rtl88x2ce-dkms-git** (blocked_deps=0, reverse_deps=0, total_deps=4) — DKMS_KERNEL_MODULE
70. **urbanterror** (blocked_deps=0, reverse_deps=0, total_deps=4) — SOURCE_UNAVAILABLE
71. **ut2004-gog** (blocked_deps=0, reverse_deps=0, total_deps=4) — NON_DISTRIBUTABLE
72. **zfs-linux-hardened-headers** (blocked_deps=0, reverse_deps=0, total_deps=4) — KERNEL_SPECIFIC
73. **zfs-linux-rt-headers** (blocked_deps=0, reverse_deps=0, total_deps=4) — KERNEL_SPECIFIC
74. **futu-ftnn-wine** (blocked_deps=0, reverse_deps=0, total_deps=5) — NEEDS_RECIPE_DESIGN
75. **inkdrop** (blocked_deps=0, reverse_deps=0, total_deps=5) — PROPRIETARY_BINARY
76. **kamilsss655-uv-k5-firmware-custom-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — CROSS_COMPILATION
77. **mailnaggertray-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — DEP_RESOLUTION_FAILED
78. **nvidia-open-tinygrad-dkms-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — TOOLING_FAILURE
79. **pamac-cli** (blocked_deps=0, reverse_deps=0, total_deps=5) — DISTRO_SPECIFIC
80. **pulumi-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — DEP_RESOLUTION_FAILED
81. **python-gradio-pdf** (blocked_deps=0, reverse_deps=0, total_deps=5) — NEEDS_RECIPE_DESIGN
82. **python-jaxlib-bin** (blocked_deps=0, reverse_deps=0, total_deps=5) — SOURCE_UNAVAILABLE
83. **python-pypi2pkgbuild** (blocked_deps=0, reverse_deps=0, total_deps=5) — DISTRO_SPECIFIC
84. **soapysdrplay3-luarvique-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — PROPRIETARY_DEP
85. **unrealtournament4** (blocked_deps=0, reverse_deps=0, total_deps=5) — NON_DISTRIBUTABLE
86. **zfs-linux-git-headers** (blocked_deps=0, reverse_deps=0, total_deps=5) — KERNEL_SPECIFIC
87. **asp** (blocked_deps=0, reverse_deps=0, total_deps=6) — DISTRO_SPECIFIC
88. **aurutils** (blocked_deps=0, reverse_deps=0, total_deps=6) — DISTRO_SPECIFIC
89. **awk-language-server** (blocked_deps=0, reverse_deps=0, total_deps=6) — DEP_RESOLUTION_FAILED
90. **factorio-space-age-experimental** (blocked_deps=0, reverse_deps=0, total_deps=6) — NON_DISTRIBUTABLE
91. **fileoptimizer-bin** (blocked_deps=0, reverse_deps=0, total_deps=6) — PLATFORM_UNSUPPORTED
92. **lib32-libglade** (blocked_deps=0, reverse_deps=0, total_deps=6) — MULTILIB_UNSUPPORTED
93. **mingw-w64-boost** (blocked_deps=0, reverse_deps=0, total_deps=6) — MINGW_CROSS_COMPILATION
94. **mingw-w64-cppwinrt** (blocked_deps=0, reverse_deps=0, total_deps=6) — MINGW_CROSS_COMPILATION
95. **mingw-w64-pcre2** (blocked_deps=0, reverse_deps=0, total_deps=6) — MINGW_CROSS_COMPILATION
96. **mingw-w64-spirv-tools** (blocked_deps=0, reverse_deps=0, total_deps=6) — MINGW_CROSS_COMPILATION
97. **vegastrike-git** (blocked_deps=0, reverse_deps=0, total_deps=6) — DEP_RESOLUTION_FAILED
98. **vivaldi-autoinject-custom-js-ui** (blocked_deps=0, reverse_deps=0, total_deps=6) — TOOLING_FAILURE
99. **arti-git** (blocked_deps=0, reverse_deps=0, total_deps=7) — DEP_RESOLUTION_FAILED
100. **dxvk-async-git** (blocked_deps=0, reverse_deps=0, total_deps=7) — DEP_RESOLUTION_FAILED
