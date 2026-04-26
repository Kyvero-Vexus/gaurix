# Blocked Dependency Tree — deptree-resolver-260426c

Generated: 2026-04-26T07:01:11Z

## Summary

| Metric | Count |
|--------|-------|
| Total blocked | 250 |
| In AUR cache | 246 |
| Zero blocked deps | 247 |

## Blocking Reason Distribution

- **DEP_RESOLUTION_FAILED**: 105
- **TOOLING_FAILURE**: 24
- **SOURCE_UNAVAILABLE**: 18
- **DISTRO_SPECIFIC**: 14
- **DKMS_KERNEL_MODULE**: 11
- **MINGW_CROSS_COMPILATION**: 9
- **LICENSE_REVIEW_NEEDED**: 7
- **MULTILIB_UNSUPPORTED**: 7
- **AUR_REPO_DELETED**: 5
- **GCC_SNAPSHOT_RUNTIME**: 4
- **COMPLEX_BUILD**: 4
- **COMPLEX_DEPS**: 4
- **NEEDS_RECIPE_DESIGN**: 4
- **NON_DISTRIBUTABLE**: 3
- **PROPRIETARY_BINARY**: 3
- **BUILD_FAILED**: 3
- **KERNEL_SPECIFIC**: 3
- **KERNEL_MODULE**: 2
- **ANDROID_SDK_PLATFORM**: 2
- **PROPRIETARY_DEP**: 2
- **LEGACY_PYTHON2**: 2
- **PLATFORM_UNSUPPORTED**: 2
- **BROWSER_EXTENSION**: 2
- **SELINUX_SPECIFIC**: 2
- **PROPRIETARY_PLATFORM**: 1
- **ROCM_DEPENDENCY**: 1
- **ARCH_SPECIFIC**: 1
- **ABANDONED_UPSTREAM**: 1
- **MISSING_DEP**: 1
- **NEEDS_INVESTIGATION**: 1
- **CROSS_COMPILATION**: 1
- **CUDA_DEPENDENCY**: 1

## Priority Queue (top 200)

| Rank | Package | Blocked Deps | Reverse Deps | Total Deps | Reason |
|------|---------|-------------|-------------- |------------|--------|
| 1 | gradience | 0 | 1 | 0 | DEP_RESOLUTION_FAILED |
| 2 | sudo-selinux | 0 | 1 | 8 | SELINUX_SPECIFIC |
| 3 | base-selinux | 0 | 1 | 18 | SELINUX_SPECIFIC |
| 4 | virtualbox-svn | 0 | 1 | 53 | DEP_RESOLUTION_FAILED |
| 5 | deadbeef-mpris2-plugin | 0 | 0 | 0 | SOURCE_UNAVAILABLE |
| 6 | matlab-jre-bundled | 0 | 0 | 0 | SOURCE_UNAVAILABLE |
| 7 | sipgate-app-clinq | 0 | 0 | 0 | NEEDS_RECIPE_DESIGN |
| 8 | squareline-studio | 0 | 0 | 0 | SOURCE_UNAVAILABLE |
| 9 | aquacomputer_d5next-hwmon-dkms | 0 | 0 | 1 | DKMS_KERNEL_MODULE |
| 10 | bakkesmod-steam | 0 | 0 | 1 | PLATFORM_UNSUPPORTED |
| 11 | edgeimpulse-cli | 0 | 0 | 1 | DEP_RESOLUTION_FAILED |
| 12 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | BROWSER_EXTENSION |
| 13 | librewolf-tridactyl-native-bin | 0 | 0 | 1 | BROWSER_EXTENSION |
| 14 | luniistore | 0 | 0 | 1 | SOURCE_UNAVAILABLE |
| 15 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | DISTRO_SPECIFIC |
| 16 | repacman | 0 | 0 | 1 | DISTRO_SPECIFIC |
| 17 | simplicity-commander | 0 | 0 | 1 | SOURCE_UNAVAILABLE |
| 18 | amneziawg-dkms-git | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 19 | amneziawg-linux | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 20 | amneziawg-linux-hardened | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 21 | android-platform-19 | 0 | 0 | 2 | ANDROID_SDK_PLATFORM |
| 22 | android-platform-21 | 0 | 0 | 2 | ANDROID_SDK_PLATFORM |
| 23 | archwiki-offline | 0 | 0 | 2 | DISTRO_SPECIFIC |
| 24 | aws-amplify-cli | 0 | 0 | 2 | DEP_RESOLUTION_FAILED |
| 25 | aws-cdk | 0 | 0 | 2 | DEP_RESOLUTION_FAILED |
| 26 | brother-mfc-l2400dw | 0 | 0 | 2 | LICENSE_REVIEW_NEEDED |
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
| 47 | ttf-consolas-ligaturized | 0 | 0 | 2 | LICENSE_REVIEW_NEEDED |
| 48 | vscodium-marketplace | 0 | 0 | 2 | TOOLING_FAILURE |
| 49 | wyc | 0 | 0 | 2 | SOURCE_UNAVAILABLE |
| 50 | beammp-launcher-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 51 | java-language-server | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 52 | libarchive-static | 0 | 0 | 3 | TOOLING_FAILURE |
| 53 | lightdm-webkit-theme-aether | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 54 | linux-keep-modules | 0 | 0 | 3 | DISTRO_SPECIFIC |
| 55 | nfuspire-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 56 | nginx-mainline-mod-njs | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 57 | nodejs-nestjs-cli | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 58 | nvidia-bl-dkms | 0 | 0 | 3 | DKMS_KERNEL_MODULE |
| 59 | pacpak-git | 0 | 0 | 3 | DISTRO_SPECIFIC |
| 60 | phonon-qt4-vlc | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 61 | quartz-utils-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 62 | rdt-client | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 63 | sommelier-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 64 | texmacs-pure | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 65 | chromium-extension-arch-search | 0 | 0 | 4 | DISTRO_SPECIFIC |
| 66 | clash-for-windows-chinese | 0 | 0 | 4 | ABANDONED_UPSTREAM |
| 67 | eclipse-pydev | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 68 | euroscope-bin | 0 | 0 | 4 | SOURCE_UNAVAILABLE |
| 69 | gbm | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 70 | gephi-git | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 71 | lobe-chat | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 72 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | SOURCE_UNAVAILABLE |
| 73 | rtl88x2ce-dkms-git | 0 | 0 | 4 | DKMS_KERNEL_MODULE |
| 74 | urbanterror | 0 | 0 | 4 | SOURCE_UNAVAILABLE |
| 75 | ut2004-gog | 0 | 0 | 4 | NON_DISTRIBUTABLE |
| 76 | zfs-linux-hardened-headers | 0 | 0 | 4 | KERNEL_SPECIFIC |
| 77 | zfs-linux-rt-headers | 0 | 0 | 4 | KERNEL_SPECIFIC |
| 78 | futu-ftnn-wine | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN |
| 79 | inkdrop | 0 | 0 | 5 | SOURCE_UNAVAILABLE |
| 80 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | CROSS_COMPILATION |
| 81 | mailnaggertray-git | 0 | 0 | 5 | DEP_RESOLUTION_FAILED |
| 82 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | TOOLING_FAILURE |
| 83 | pamac-cli | 0 | 0 | 5 | DISTRO_SPECIFIC |
| 84 | pulumi-git | 0 | 0 | 5 | DEP_RESOLUTION_FAILED |
| 85 | python-gradio-pdf | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN |
| 86 | python-jaxlib-bin | 0 | 0 | 5 | SOURCE_UNAVAILABLE |
| 87 | python-pypi2pkgbuild | 0 | 0 | 5 | DISTRO_SPECIFIC |
| 88 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | PROPRIETARY_DEP |
| 89 | unrealtournament4 | 0 | 0 | 5 | NON_DISTRIBUTABLE |
| 90 | zfs-linux-git-headers | 0 | 0 | 5 | KERNEL_SPECIFIC |
| 91 | asp | 0 | 0 | 6 | DISTRO_SPECIFIC |
| 92 | aurutils | 0 | 0 | 6 | DISTRO_SPECIFIC |
| 93 | awk-language-server | 0 | 0 | 6 | DEP_RESOLUTION_FAILED |
| 94 | factorio-space-age-experimental | 0 | 0 | 6 | NON_DISTRIBUTABLE |
| 95 | fileoptimizer-bin | 0 | 0 | 6 | PLATFORM_UNSUPPORTED |
| 96 | gstreamermm-docs | 0 | 0 | 6 | SOURCE_UNAVAILABLE |
| 97 | lib32-libglade | 0 | 0 | 6 | MULTILIB_UNSUPPORTED |
| 98 | mingw-w64-boost | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 99 | mingw-w64-cppwinrt | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 100 | mingw-w64-pcre2 | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 101 | mingw-w64-spirv-tools | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 102 | swscreenshot-gui | 0 | 0 | 6 | DEP_RESOLUTION_FAILED |
| 103 | vegastrike-git | 0 | 0 | 6 | DEP_RESOLUTION_FAILED |
| 104 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | TOOLING_FAILURE |
| 105 | arti-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 106 | dxvk-async-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 107 | eddiscovery | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 108 | fido2-hid-bridge | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 109 | glibc-eac | 0 | 0 | 7 | COMPLEX_DEPS |
| 110 | lib32-libxpm | 0 | 0 | 7 | MULTILIB_UNSUPPORTED |
| 111 | limine-snapper-sync-git | 0 | 0 | 7 | SOURCE_UNAVAILABLE |
| 112 | linux-gpib | 0 | 0 | 7 | KERNEL_MODULE |
| 113 | logstash | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 114 | mingw-w64-postgresql | 0 | 0 | 7 | MINGW_CROSS_COMPILATION |
| 115 | mkinitcpio-clevis-hook | 0 | 0 | 7 | ARCH_SPECIFIC |
| 116 | obs-plugin-input-overlay-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 117 | pikeru | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 118 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 119 | prs | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 120 | python2-gimp | 0 | 0 | 7 | LEGACY_PYTHON2 |
| 121 | wayprompt-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 122 | wldash | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 123 | yt-x-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 124 | anytxt-bin | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED |
| 125 | coreutils-arch | 0 | 0 | 8 | TOOLING_FAILURE |
| 126 | emerald | 0 | 0 | 8 | MISSING_DEP |
| 127 | go2tv | 0 | 0 | 8 | DEP_RESOLUTION_FAILED |
| 128 | lib32-sdl_sound | 0 | 0 | 8 | MULTILIB_UNSUPPORTED |
| 129 | mingw-w64-lame | 0 | 0 | 8 | MINGW_CROSS_COMPILATION |
| 130 | pianoteq-stage | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED |
| 131 | pikaur-static | 0 | 0 | 8 | TOOLING_FAILURE |
| 132 | pikaur-static-git | 0 | 0 | 8 | TOOLING_FAILURE |
| 133 | rocketchat-desktop | 0 | 0 | 8 | DEP_RESOLUTION_FAILED |
| 134 | vmd | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED |
| 135 | webcord-vencord-git | 0 | 0 | 8 | DEP_RESOLUTION_FAILED |
| 136 | xeme-hg | 0 | 0 | 8 | SOURCE_UNAVAILABLE |
| 137 | anyrun-git | 0 | 0 | 9 | COMPLEX_BUILD |
| 138 | boost-python2 | 0 | 0 | 9 | LEGACY_PYTHON2 |
| 139 | epub_to_audiobook-git | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 140 | frame-eth | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 141 | freetube-electron-git | 0 | 0 | 9 | COMPLEX_DEPS |
| 142 | lib32-vkbasalt | 0 | 0 | 9 | TOOLING_FAILURE |
| 143 | madness-interactive-reloaded | 0 | 0 | 9 | SOURCE_UNAVAILABLE |
| 144 | mobirise | 0 | 0 | 9 | LICENSE_REVIEW_NEEDED |
| 145 | network-manager-applet-nolibappindicator | 0 | 0 | 9 | TOOLING_FAILURE |
| 146 | open-tv | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 147 | pcem-git | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 148 | prey | 0 | 0 | 9 | SOURCE_UNAVAILABLE |
| 149 | python-pylink-square | 0 | 0 | 9 | PROPRIETARY_DEP |
| 150 | shijima-qt | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 151 | auracle-git | 0 | 0 | 10 | DISTRO_SPECIFIC |
| 152 | ausweiskopie | 0 | 0 | 10 | SOURCE_UNAVAILABLE |
| 153 | beignet-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 154 | borgwarehouse | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 155 | hnefatafl-copenhagen | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 156 | libfive-studio-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 157 | libga68-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 158 | libgfortran-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 159 | libgnat-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 160 | libgo-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 161 | linux-sched-ext-git-headers | 0 | 0 | 10 | TOOLING_FAILURE |
| 162 | linux-tip-git-headers | 0 | 0 | 10 | TOOLING_FAILURE |
| 163 | mailspring | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 164 | nvidia-390xx-settings | 0 | 0 | 10 | TOOLING_FAILURE |
| 165 | pantheon-polkit-agent-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 166 | vanilla-wiiu-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 167 | virtualbox-bin-sdk | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 168 | cockatrice-server-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 169 | fancy-cat | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 170 | lto-dump-snapshot | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 171 | luxtorpeda-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 172 | principia-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 173 | python-google-cloud-speech | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 174 | synfigstudio-dev | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 175 | vegastrike-engine-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 176 | vgmstream-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 177 | whatip-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 178 | devtools-git | 0 | 0 | 12 | TOOLING_FAILURE |
| 179 | envoyproxy | 0 | 0 | 12 | BUILD_FAILED |
| 180 | gst-plugins-rs-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED |
| 181 | linux-xanmod-lts-headers | 0 | 0 | 12 | TOOLING_FAILURE |
| 182 | mingw-w64-libopenmpt | 0 | 0 | 12 | TOOLING_FAILURE |
| 183 | opendrop-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED |
| 184 | wayfire-plugins-extra-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED |
| 185 | betterx-desktop-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED |
| 186 | capt-src | 0 | 0 | 13 | MULTILIB_UNSUPPORTED |
| 187 | glsmac-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED |
| 188 | illogical-impulse-ags | 0 | 0 | 13 | NEEDS_INVESTIGATION |
| 189 | python-jax-rocm | 0 | 0 | 13 | ROCM_DEPENDENCY |
| 190 | yacreader-poppler-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED |
| 191 | goxlr-utility-ui | 0 | 0 | 14 | DEP_RESOLUTION_FAILED |
| 192 | lincity-ng-git | 0 | 0 | 14 | DEP_RESOLUTION_FAILED |
| 193 | linux-cachyos-hardened-headers | 0 | 0 | 14 | TOOLING_FAILURE |
| 194 | linux-next-git-headers | 0 | 0 | 14 | TOOLING_FAILURE |
| 195 | rpfm-git | 0 | 0 | 14 | COMPLEX_BUILD |
| 196 | deepin-wine8-stable | 0 | 0 | 15 | PROPRIETARY_BINARY |
| 197 | lightlyshaders-git | 0 | 0 | 15 | DEP_RESOLUTION_FAILED |
| 198 | linux-covolunablu-gaming-headers | 0 | 0 | 15 | TOOLING_FAILURE |
| 199 | panda3ds | 0 | 0 | 15 | DEP_RESOLUTION_FAILED |
| 200 | php-legacy-pdlib | 0 | 0 | 15 | DEP_RESOLUTION_FAILED |

## Selected for This Pass (top 100)

1. **gradience** (blocked_deps=0, reverse_deps=1, total_deps=0) — DEP_RESOLUTION_FAILED
2. **sudo-selinux** (blocked_deps=0, reverse_deps=1, total_deps=8) — SELINUX_SPECIFIC
3. **base-selinux** (blocked_deps=0, reverse_deps=1, total_deps=18) — SELINUX_SPECIFIC
4. **virtualbox-svn** (blocked_deps=0, reverse_deps=1, total_deps=53) — DEP_RESOLUTION_FAILED
5. **deadbeef-mpris2-plugin** (blocked_deps=0, reverse_deps=0, total_deps=0) — SOURCE_UNAVAILABLE
6. **matlab-jre-bundled** (blocked_deps=0, reverse_deps=0, total_deps=0) — SOURCE_UNAVAILABLE
7. **sipgate-app-clinq** (blocked_deps=0, reverse_deps=0, total_deps=0) — NEEDS_RECIPE_DESIGN
8. **squareline-studio** (blocked_deps=0, reverse_deps=0, total_deps=0) — SOURCE_UNAVAILABLE
9. **aquacomputer_d5next-hwmon-dkms** (blocked_deps=0, reverse_deps=0, total_deps=1) — DKMS_KERNEL_MODULE
10. **bakkesmod-steam** (blocked_deps=0, reverse_deps=0, total_deps=1) — PLATFORM_UNSUPPORTED
11. **edgeimpulse-cli** (blocked_deps=0, reverse_deps=0, total_deps=1) — DEP_RESOLUTION_FAILED
12. **librewolf-extension-ublock-origin-bin** (blocked_deps=0, reverse_deps=0, total_deps=1) — BROWSER_EXTENSION
13. **librewolf-tridactyl-native-bin** (blocked_deps=0, reverse_deps=0, total_deps=1) — BROWSER_EXTENSION
14. **luniistore** (blocked_deps=0, reverse_deps=0, total_deps=1) — SOURCE_UNAVAILABLE
15. **mkinitcpio-systemd-root-password** (blocked_deps=0, reverse_deps=0, total_deps=1) — DISTRO_SPECIFIC
16. **repacman** (blocked_deps=0, reverse_deps=0, total_deps=1) — DISTRO_SPECIFIC
17. **simplicity-commander** (blocked_deps=0, reverse_deps=0, total_deps=1) — SOURCE_UNAVAILABLE
18. **amneziawg-dkms-git** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
19. **amneziawg-linux** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
20. **amneziawg-linux-hardened** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
21. **android-platform-19** (blocked_deps=0, reverse_deps=0, total_deps=2) — ANDROID_SDK_PLATFORM
22. **android-platform-21** (blocked_deps=0, reverse_deps=0, total_deps=2) — ANDROID_SDK_PLATFORM
23. **archwiki-offline** (blocked_deps=0, reverse_deps=0, total_deps=2) — DISTRO_SPECIFIC
24. **aws-amplify-cli** (blocked_deps=0, reverse_deps=0, total_deps=2) — DEP_RESOLUTION_FAILED
25. **aws-cdk** (blocked_deps=0, reverse_deps=0, total_deps=2) — DEP_RESOLUTION_FAILED
26. **brother-mfc-l2400dw** (blocked_deps=0, reverse_deps=0, total_deps=2) — LICENSE_REVIEW_NEEDED
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
47. **ttf-consolas-ligaturized** (blocked_deps=0, reverse_deps=0, total_deps=2) — LICENSE_REVIEW_NEEDED
48. **vscodium-marketplace** (blocked_deps=0, reverse_deps=0, total_deps=2) — TOOLING_FAILURE
49. **wyc** (blocked_deps=0, reverse_deps=0, total_deps=2) — SOURCE_UNAVAILABLE
50. **beammp-launcher-git** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
51. **java-language-server** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
52. **libarchive-static** (blocked_deps=0, reverse_deps=0, total_deps=3) — TOOLING_FAILURE
53. **lightdm-webkit-theme-aether** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
54. **linux-keep-modules** (blocked_deps=0, reverse_deps=0, total_deps=3) — DISTRO_SPECIFIC
55. **nfuspire-git** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
56. **nginx-mainline-mod-njs** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
57. **nodejs-nestjs-cli** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
58. **nvidia-bl-dkms** (blocked_deps=0, reverse_deps=0, total_deps=3) — DKMS_KERNEL_MODULE
59. **pacpak-git** (blocked_deps=0, reverse_deps=0, total_deps=3) — DISTRO_SPECIFIC
60. **phonon-qt4-vlc** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
61. **quartz-utils-git** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
62. **rdt-client** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
63. **sommelier-git** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
64. **texmacs-pure** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
65. **chromium-extension-arch-search** (blocked_deps=0, reverse_deps=0, total_deps=4) — DISTRO_SPECIFIC
66. **clash-for-windows-chinese** (blocked_deps=0, reverse_deps=0, total_deps=4) — ABANDONED_UPSTREAM
67. **eclipse-pydev** (blocked_deps=0, reverse_deps=0, total_deps=4) — DEP_RESOLUTION_FAILED
68. **euroscope-bin** (blocked_deps=0, reverse_deps=0, total_deps=4) — SOURCE_UNAVAILABLE
69. **gbm** (blocked_deps=0, reverse_deps=0, total_deps=4) — DEP_RESOLUTION_FAILED
70. **gephi-git** (blocked_deps=0, reverse_deps=0, total_deps=4) — DEP_RESOLUTION_FAILED
71. **lobe-chat** (blocked_deps=0, reverse_deps=0, total_deps=4) — DEP_RESOLUTION_FAILED
72. **plugin-autenticacao-gov-pt** (blocked_deps=0, reverse_deps=0, total_deps=4) — SOURCE_UNAVAILABLE
73. **rtl88x2ce-dkms-git** (blocked_deps=0, reverse_deps=0, total_deps=4) — DKMS_KERNEL_MODULE
74. **urbanterror** (blocked_deps=0, reverse_deps=0, total_deps=4) — SOURCE_UNAVAILABLE
75. **ut2004-gog** (blocked_deps=0, reverse_deps=0, total_deps=4) — NON_DISTRIBUTABLE
76. **zfs-linux-hardened-headers** (blocked_deps=0, reverse_deps=0, total_deps=4) — KERNEL_SPECIFIC
77. **zfs-linux-rt-headers** (blocked_deps=0, reverse_deps=0, total_deps=4) — KERNEL_SPECIFIC
78. **futu-ftnn-wine** (blocked_deps=0, reverse_deps=0, total_deps=5) — NEEDS_RECIPE_DESIGN
79. **inkdrop** (blocked_deps=0, reverse_deps=0, total_deps=5) — SOURCE_UNAVAILABLE
80. **kamilsss655-uv-k5-firmware-custom-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — CROSS_COMPILATION
81. **mailnaggertray-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — DEP_RESOLUTION_FAILED
82. **nvidia-open-tinygrad-dkms-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — TOOLING_FAILURE
83. **pamac-cli** (blocked_deps=0, reverse_deps=0, total_deps=5) — DISTRO_SPECIFIC
84. **pulumi-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — DEP_RESOLUTION_FAILED
85. **python-gradio-pdf** (blocked_deps=0, reverse_deps=0, total_deps=5) — NEEDS_RECIPE_DESIGN
86. **python-jaxlib-bin** (blocked_deps=0, reverse_deps=0, total_deps=5) — SOURCE_UNAVAILABLE
87. **python-pypi2pkgbuild** (blocked_deps=0, reverse_deps=0, total_deps=5) — DISTRO_SPECIFIC
88. **soapysdrplay3-luarvique-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — PROPRIETARY_DEP
89. **unrealtournament4** (blocked_deps=0, reverse_deps=0, total_deps=5) — NON_DISTRIBUTABLE
90. **zfs-linux-git-headers** (blocked_deps=0, reverse_deps=0, total_deps=5) — KERNEL_SPECIFIC
91. **asp** (blocked_deps=0, reverse_deps=0, total_deps=6) — DISTRO_SPECIFIC
92. **aurutils** (blocked_deps=0, reverse_deps=0, total_deps=6) — DISTRO_SPECIFIC
93. **awk-language-server** (blocked_deps=0, reverse_deps=0, total_deps=6) — DEP_RESOLUTION_FAILED
94. **factorio-space-age-experimental** (blocked_deps=0, reverse_deps=0, total_deps=6) — NON_DISTRIBUTABLE
95. **fileoptimizer-bin** (blocked_deps=0, reverse_deps=0, total_deps=6) — PLATFORM_UNSUPPORTED
96. **gstreamermm-docs** (blocked_deps=0, reverse_deps=0, total_deps=6) — SOURCE_UNAVAILABLE
97. **lib32-libglade** (blocked_deps=0, reverse_deps=0, total_deps=6) — MULTILIB_UNSUPPORTED
98. **mingw-w64-boost** (blocked_deps=0, reverse_deps=0, total_deps=6) — MINGW_CROSS_COMPILATION
99. **mingw-w64-cppwinrt** (blocked_deps=0, reverse_deps=0, total_deps=6) — MINGW_CROSS_COMPILATION
100. **mingw-w64-pcre2** (blocked_deps=0, reverse_deps=0, total_deps=6) — MINGW_CROSS_COMPILATION
