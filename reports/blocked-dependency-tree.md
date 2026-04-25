# Blocked Dependency Tree — deptree-resolver-260425k

Generated: 2026-04-25T20:52:30Z

## Summary

| Metric | Count |
|--------|-------|
| Total blocked | 256 |
| In AUR cache | 253 |
| Zero blocked deps | 252 |

## Blocking Reason Distribution

- **DEP_RESOLUTION_FAILED**: 109
- **TOOLING_FAILURE**: 24
- **SOURCE_UNAVAILABLE**: 18
- **DISTRO_SPECIFIC**: 14
- **DKMS_KERNEL_MODULE**: 11
- **MINGW_CROSS_COMPILATION**: 9
- **LICENSE_REVIEW_NEEDED**: 7
- **MULTILIB_UNSUPPORTED**: 7
- **AUR_REPO_DELETED**: 5
- **BUILD_FAILED**: 4
- **COMPLEX_BUILD**: 4
- **NEEDS_RECIPE_DESIGN**: 4
- **COMPLEX_DEPS**: 4
- **GCC_SNAPSHOT_RUNTIME**: 4
- **NON_DISTRIBUTABLE**: 3
- **PROPRIETARY_BINARY**: 3
- **KERNEL_SPECIFIC**: 3
- **LEGACY_PYTHON2**: 3
- **SELINUX_SPECIFIC**: 2
- **ANDROID_SDK_PLATFORM**: 2
- **BROWSER_EXTENSION**: 2
- **PROPRIETARY_DEP**: 2
- **KERNEL_MODULE**: 2
- **PLATFORM_UNSUPPORTED**: 2
- **ARCH_SPECIFIC**: 1
- **NEEDS_INVESTIGATION**: 1
- **CROSS_COMPILATION**: 1
- **ABANDONED_UPSTREAM**: 1
- **ROCM_DEPENDENCY**: 1
- **PROPRIETARY_PLATFORM**: 1
- **MISSING_DEP**: 1
- **CUDA_DEPENDENCY**: 1

## Priority Queue (top 200)

| Rank | Package | Blocked Deps | Reverse Deps | Total Deps | Reason |
|------|---------|-------------|-------------- |------------|--------|
| 1 | gradience | 0 | 1 | 0 | DEP_RESOLUTION_FAILED |
| 2 | sudo-selinux | 0 | 1 | 8 | SELINUX_SPECIFIC |
| 3 | base-selinux | 0 | 1 | 18 | SELINUX_SPECIFIC |
| 4 | wayfire-git | 0 | 1 | 33 | DEP_RESOLUTION_FAILED |
| 5 | virtualbox-svn | 0 | 1 | 53 | DEP_RESOLUTION_FAILED |
| 6 | deadbeef-mpris2-plugin | 0 | 0 | 0 | SOURCE_UNAVAILABLE |
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
| 27 | decrypto-pro-git | 0 | 0 | 2 | DEP_RESOLUTION_FAILED |
| 28 | emmet-language-server | 0 | 0 | 2 | DEP_RESOLUTION_FAILED |
| 29 | faustus-dkms-git | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 30 | findbrokenpkgs | 0 | 0 | 2 | DISTRO_SPECIFIC |
| 31 | ideapad-laptop-tb-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 32 | ideapad-laptop-tb2024g6plus-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 33 | knossu | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN |
| 34 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | MULTILIB_UNSUPPORTED |
| 35 | libch343ser-git | 0 | 0 | 2 | KERNEL_MODULE |
| 36 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | PROPRIETARY_BINARY |
| 37 | mingw-w64-cblas | 0 | 0 | 2 | MINGW_CROSS_COMPILATION |
| 38 | mingw-w64-lapack | 0 | 0 | 2 | MINGW_CROSS_COMPILATION |
| 39 | mingw-w64-soundtouch | 0 | 0 | 2 | MINGW_CROSS_COMPILATION |
| 40 | nodejs-cspell | 0 | 0 | 2 | DEP_RESOLUTION_FAILED |
| 41 | osmtogeojson | 0 | 0 | 2 | DEP_RESOLUTION_FAILED |
| 42 | pfring-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 43 | python-home-assistant-frontend | 0 | 0 | 2 | DEP_RESOLUTION_FAILED |
| 44 | r8126-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE |
| 45 | receitanet | 0 | 0 | 2 | SOURCE_UNAVAILABLE |
| 46 | sbctl-initcpio-post-hook | 0 | 0 | 2 | DISTRO_SPECIFIC |
| 47 | system-age | 0 | 0 | 2 | DISTRO_SPECIFIC |
| 48 | ttf-consolas-ligaturized | 0 | 0 | 2 | LICENSE_REVIEW_NEEDED |
| 49 | vscodium-marketplace | 0 | 0 | 2 | TOOLING_FAILURE |
| 50 | wyc | 0 | 0 | 2 | SOURCE_UNAVAILABLE |
| 51 | beammp-launcher-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 52 | java-language-server | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 53 | libarchive-static | 0 | 0 | 3 | TOOLING_FAILURE |
| 54 | lightdm-webkit-theme-aether | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 55 | linux-keep-modules | 0 | 0 | 3 | DISTRO_SPECIFIC |
| 56 | nfuspire-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 57 | nginx-mainline-mod-njs | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 58 | nodejs-nestjs-cli | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 59 | nvidia-bl-dkms | 0 | 0 | 3 | DKMS_KERNEL_MODULE |
| 60 | pacpak-git | 0 | 0 | 3 | DISTRO_SPECIFIC |
| 61 | phonon-qt4-vlc | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 62 | quartz-utils-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 63 | rdt-client | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 64 | sommelier-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 65 | texmacs-pure | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 66 | tilp-xdg | 0 | 0 | 3 | DEP_RESOLUTION_FAILED |
| 67 | chromium-extension-arch-search | 0 | 0 | 4 | DISTRO_SPECIFIC |
| 68 | clash-for-windows-chinese | 0 | 0 | 4 | ABANDONED_UPSTREAM |
| 69 | eclipse-pydev | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 70 | euroscope-bin | 0 | 0 | 4 | SOURCE_UNAVAILABLE |
| 71 | gbm | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 72 | gephi-git | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 73 | lobe-chat | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 74 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | SOURCE_UNAVAILABLE |
| 75 | qtspim-iconfix | 0 | 0 | 4 | BUILD_FAILED |
| 76 | rtl88x2ce-dkms-git | 0 | 0 | 4 | DKMS_KERNEL_MODULE |
| 77 | urbanterror | 0 | 0 | 4 | SOURCE_UNAVAILABLE |
| 78 | ut2004-gog | 0 | 0 | 4 | NON_DISTRIBUTABLE |
| 79 | zfs-linux-hardened-headers | 0 | 0 | 4 | KERNEL_SPECIFIC |
| 80 | zfs-linux-rt-headers | 0 | 0 | 4 | KERNEL_SPECIFIC |
| 81 | bililive-recorder | 0 | 0 | 5 | DEP_RESOLUTION_FAILED |
| 82 | futu-ftnn-wine | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN |
| 83 | inkdrop | 0 | 0 | 5 | SOURCE_UNAVAILABLE |
| 84 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | CROSS_COMPILATION |
| 85 | mailnaggertray-git | 0 | 0 | 5 | DEP_RESOLUTION_FAILED |
| 86 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | TOOLING_FAILURE |
| 87 | pamac-cli | 0 | 0 | 5 | DISTRO_SPECIFIC |
| 88 | pulumi-git | 0 | 0 | 5 | DEP_RESOLUTION_FAILED |
| 89 | python-gradio-pdf | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN |
| 90 | python-jaxlib-bin | 0 | 0 | 5 | SOURCE_UNAVAILABLE |
| 91 | python-pypi2pkgbuild | 0 | 0 | 5 | DISTRO_SPECIFIC |
| 92 | python2-dbus | 0 | 0 | 5 | LEGACY_PYTHON2 |
| 93 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | PROPRIETARY_DEP |
| 94 | unpack-install-jammer | 0 | 0 | 5 | SOURCE_UNAVAILABLE |
| 95 | unrealtournament4 | 0 | 0 | 5 | NON_DISTRIBUTABLE |
| 96 | zfs-linux-git-headers | 0 | 0 | 5 | KERNEL_SPECIFIC |
| 97 | asp | 0 | 0 | 6 | DISTRO_SPECIFIC |
| 98 | aurutils | 0 | 0 | 6 | DISTRO_SPECIFIC |
| 99 | awk-language-server | 0 | 0 | 6 | DEP_RESOLUTION_FAILED |
| 100 | factorio-space-age-experimental | 0 | 0 | 6 | NON_DISTRIBUTABLE |
| 101 | fileoptimizer-bin | 0 | 0 | 6 | PLATFORM_UNSUPPORTED |
| 102 | gstreamermm-docs | 0 | 0 | 6 | SOURCE_UNAVAILABLE |
| 103 | lib32-libglade | 0 | 0 | 6 | MULTILIB_UNSUPPORTED |
| 104 | mingw-w64-boost | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 105 | mingw-w64-cppwinrt | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 106 | mingw-w64-pcre2 | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 107 | mingw-w64-spirv-tools | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 108 | swscreenshot-gui | 0 | 0 | 6 | DEP_RESOLUTION_FAILED |
| 109 | vegastrike-git | 0 | 0 | 6 | DEP_RESOLUTION_FAILED |
| 110 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | TOOLING_FAILURE |
| 111 | arti-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 112 | dxvk-async-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 113 | eddiscovery | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 114 | fido2-hid-bridge | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 115 | glibc-eac | 0 | 0 | 7 | COMPLEX_DEPS |
| 116 | lib32-libxpm | 0 | 0 | 7 | MULTILIB_UNSUPPORTED |
| 117 | limine-snapper-sync-git | 0 | 0 | 7 | SOURCE_UNAVAILABLE |
| 118 | linux-gpib | 0 | 0 | 7 | KERNEL_MODULE |
| 119 | logstash | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 120 | mingw-w64-postgresql | 0 | 0 | 7 | MINGW_CROSS_COMPILATION |
| 121 | mkinitcpio-clevis-hook | 0 | 0 | 7 | ARCH_SPECIFIC |
| 122 | obs-plugin-input-overlay-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 123 | pikeru | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 124 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 125 | prs | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 126 | python2-gimp | 0 | 0 | 7 | LEGACY_PYTHON2 |
| 127 | wayprompt-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 128 | wldash | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 129 | yt-x-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 130 | anytxt-bin | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED |
| 131 | coreutils-arch | 0 | 0 | 8 | TOOLING_FAILURE |
| 132 | emerald | 0 | 0 | 8 | MISSING_DEP |
| 133 | go2tv | 0 | 0 | 8 | DEP_RESOLUTION_FAILED |
| 134 | lib32-sdl_sound | 0 | 0 | 8 | MULTILIB_UNSUPPORTED |
| 135 | mingw-w64-lame | 0 | 0 | 8 | MINGW_CROSS_COMPILATION |
| 136 | pianoteq-stage | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED |
| 137 | pikaur-static | 0 | 0 | 8 | TOOLING_FAILURE |
| 138 | pikaur-static-git | 0 | 0 | 8 | TOOLING_FAILURE |
| 139 | rocketchat-desktop | 0 | 0 | 8 | DEP_RESOLUTION_FAILED |
| 140 | vmd | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED |
| 141 | webcord-vencord-git | 0 | 0 | 8 | DEP_RESOLUTION_FAILED |
| 142 | xeme-hg | 0 | 0 | 8 | SOURCE_UNAVAILABLE |
| 143 | anyrun-git | 0 | 0 | 9 | COMPLEX_BUILD |
| 144 | boost-python2 | 0 | 0 | 9 | LEGACY_PYTHON2 |
| 145 | epub_to_audiobook-git | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 146 | frame-eth | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 147 | freetube-electron-git | 0 | 0 | 9 | COMPLEX_DEPS |
| 148 | lib32-vkbasalt | 0 | 0 | 9 | TOOLING_FAILURE |
| 149 | madness-interactive-reloaded | 0 | 0 | 9 | SOURCE_UNAVAILABLE |
| 150 | mobirise | 0 | 0 | 9 | LICENSE_REVIEW_NEEDED |
| 151 | network-manager-applet-nolibappindicator | 0 | 0 | 9 | TOOLING_FAILURE |
| 152 | open-tv | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 153 | pcem-git | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 154 | prey | 0 | 0 | 9 | SOURCE_UNAVAILABLE |
| 155 | python-pylink-square | 0 | 0 | 9 | PROPRIETARY_DEP |
| 156 | shijima-qt | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 157 | auracle-git | 0 | 0 | 10 | DISTRO_SPECIFIC |
| 158 | ausweiskopie | 0 | 0 | 10 | SOURCE_UNAVAILABLE |
| 159 | beignet-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 160 | borgwarehouse | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 161 | hnefatafl-copenhagen | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 162 | libfive-studio-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 163 | libga68-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 164 | libgfortran-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 165 | libgnat-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 166 | libgo-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 167 | linux-sched-ext-git-headers | 0 | 0 | 10 | TOOLING_FAILURE |
| 168 | linux-tip-git-headers | 0 | 0 | 10 | TOOLING_FAILURE |
| 169 | mailspring | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 170 | nvidia-390xx-settings | 0 | 0 | 10 | TOOLING_FAILURE |
| 171 | pantheon-polkit-agent-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 172 | vanilla-wiiu-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 173 | virtualbox-bin-sdk | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 174 | cockatrice-server-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 175 | fancy-cat | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 176 | lto-dump-snapshot | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 177 | luxtorpeda-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 178 | principia-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 179 | python-google-cloud-speech | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 180 | synfigstudio-dev | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 181 | vegastrike-engine-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 182 | vgmstream-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 183 | whatip-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 184 | devtools-git | 0 | 0 | 12 | TOOLING_FAILURE |
| 185 | envoyproxy | 0 | 0 | 12 | BUILD_FAILED |
| 186 | gst-plugins-rs-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED |
| 187 | linux-xanmod-lts-headers | 0 | 0 | 12 | TOOLING_FAILURE |
| 188 | mingw-w64-libopenmpt | 0 | 0 | 12 | TOOLING_FAILURE |
| 189 | opendrop-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED |
| 190 | betterx-desktop-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED |
| 191 | capt-src | 0 | 0 | 13 | MULTILIB_UNSUPPORTED |
| 192 | glsmac-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED |
| 193 | illogical-impulse-ags | 0 | 0 | 13 | NEEDS_INVESTIGATION |
| 194 | python-jax-rocm | 0 | 0 | 13 | ROCM_DEPENDENCY |
| 195 | yacreader-poppler-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED |
| 196 | goxlr-utility-ui | 0 | 0 | 14 | DEP_RESOLUTION_FAILED |
| 197 | lincity-ng-git | 0 | 0 | 14 | DEP_RESOLUTION_FAILED |
| 198 | linux-cachyos-hardened-headers | 0 | 0 | 14 | TOOLING_FAILURE |
| 199 | linux-next-git-headers | 0 | 0 | 14 | TOOLING_FAILURE |
| 200 | rpfm-git | 0 | 0 | 14 | COMPLEX_BUILD |

## Selected for This Pass (top 100)

1. **gradience** (blocked_deps=0, reverse_deps=1, total_deps=0) — DEP_RESOLUTION_FAILED
2. **sudo-selinux** (blocked_deps=0, reverse_deps=1, total_deps=8) — SELINUX_SPECIFIC
3. **base-selinux** (blocked_deps=0, reverse_deps=1, total_deps=18) — SELINUX_SPECIFIC
4. **wayfire-git** (blocked_deps=0, reverse_deps=1, total_deps=33) — DEP_RESOLUTION_FAILED
5. **virtualbox-svn** (blocked_deps=0, reverse_deps=1, total_deps=53) — DEP_RESOLUTION_FAILED
6. **deadbeef-mpris2-plugin** (blocked_deps=0, reverse_deps=0, total_deps=0) — SOURCE_UNAVAILABLE
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
27. **decrypto-pro-git** (blocked_deps=0, reverse_deps=0, total_deps=2) — DEP_RESOLUTION_FAILED
28. **emmet-language-server** (blocked_deps=0, reverse_deps=0, total_deps=2) — DEP_RESOLUTION_FAILED
29. **faustus-dkms-git** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
30. **findbrokenpkgs** (blocked_deps=0, reverse_deps=0, total_deps=2) — DISTRO_SPECIFIC
31. **ideapad-laptop-tb-dkms** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
32. **ideapad-laptop-tb2024g6plus-dkms** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
33. **knossu** (blocked_deps=0, reverse_deps=0, total_deps=2) — NEEDS_RECIPE_DESIGN
34. **lib32-opencl-nvidia-390xx** (blocked_deps=0, reverse_deps=0, total_deps=2) — MULTILIB_UNSUPPORTED
35. **libch343ser-git** (blocked_deps=0, reverse_deps=0, total_deps=2) — KERNEL_MODULE
36. **libfprint-2-tod1-broadcom-cv3plus** (blocked_deps=0, reverse_deps=0, total_deps=2) — PROPRIETARY_BINARY
37. **mingw-w64-cblas** (blocked_deps=0, reverse_deps=0, total_deps=2) — MINGW_CROSS_COMPILATION
38. **mingw-w64-lapack** (blocked_deps=0, reverse_deps=0, total_deps=2) — MINGW_CROSS_COMPILATION
39. **mingw-w64-soundtouch** (blocked_deps=0, reverse_deps=0, total_deps=2) — MINGW_CROSS_COMPILATION
40. **nodejs-cspell** (blocked_deps=0, reverse_deps=0, total_deps=2) — DEP_RESOLUTION_FAILED
41. **osmtogeojson** (blocked_deps=0, reverse_deps=0, total_deps=2) — DEP_RESOLUTION_FAILED
42. **pfring-dkms** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
43. **python-home-assistant-frontend** (blocked_deps=0, reverse_deps=0, total_deps=2) — DEP_RESOLUTION_FAILED
44. **r8126-dkms** (blocked_deps=0, reverse_deps=0, total_deps=2) — DKMS_KERNEL_MODULE
45. **receitanet** (blocked_deps=0, reverse_deps=0, total_deps=2) — SOURCE_UNAVAILABLE
46. **sbctl-initcpio-post-hook** (blocked_deps=0, reverse_deps=0, total_deps=2) — DISTRO_SPECIFIC
47. **system-age** (blocked_deps=0, reverse_deps=0, total_deps=2) — DISTRO_SPECIFIC
48. **ttf-consolas-ligaturized** (blocked_deps=0, reverse_deps=0, total_deps=2) — LICENSE_REVIEW_NEEDED
49. **vscodium-marketplace** (blocked_deps=0, reverse_deps=0, total_deps=2) — TOOLING_FAILURE
50. **wyc** (blocked_deps=0, reverse_deps=0, total_deps=2) — SOURCE_UNAVAILABLE
51. **beammp-launcher-git** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
52. **java-language-server** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
53. **libarchive-static** (blocked_deps=0, reverse_deps=0, total_deps=3) — TOOLING_FAILURE
54. **lightdm-webkit-theme-aether** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
55. **linux-keep-modules** (blocked_deps=0, reverse_deps=0, total_deps=3) — DISTRO_SPECIFIC
56. **nfuspire-git** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
57. **nginx-mainline-mod-njs** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
58. **nodejs-nestjs-cli** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
59. **nvidia-bl-dkms** (blocked_deps=0, reverse_deps=0, total_deps=3) — DKMS_KERNEL_MODULE
60. **pacpak-git** (blocked_deps=0, reverse_deps=0, total_deps=3) — DISTRO_SPECIFIC
61. **phonon-qt4-vlc** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
62. **quartz-utils-git** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
63. **rdt-client** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
64. **sommelier-git** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
65. **texmacs-pure** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
66. **tilp-xdg** (blocked_deps=0, reverse_deps=0, total_deps=3) — DEP_RESOLUTION_FAILED
67. **chromium-extension-arch-search** (blocked_deps=0, reverse_deps=0, total_deps=4) — DISTRO_SPECIFIC
68. **clash-for-windows-chinese** (blocked_deps=0, reverse_deps=0, total_deps=4) — ABANDONED_UPSTREAM
69. **eclipse-pydev** (blocked_deps=0, reverse_deps=0, total_deps=4) — DEP_RESOLUTION_FAILED
70. **euroscope-bin** (blocked_deps=0, reverse_deps=0, total_deps=4) — SOURCE_UNAVAILABLE
71. **gbm** (blocked_deps=0, reverse_deps=0, total_deps=4) — DEP_RESOLUTION_FAILED
72. **gephi-git** (blocked_deps=0, reverse_deps=0, total_deps=4) — DEP_RESOLUTION_FAILED
73. **lobe-chat** (blocked_deps=0, reverse_deps=0, total_deps=4) — DEP_RESOLUTION_FAILED
74. **plugin-autenticacao-gov-pt** (blocked_deps=0, reverse_deps=0, total_deps=4) — SOURCE_UNAVAILABLE
75. **qtspim-iconfix** (blocked_deps=0, reverse_deps=0, total_deps=4) — BUILD_FAILED
76. **rtl88x2ce-dkms-git** (blocked_deps=0, reverse_deps=0, total_deps=4) — DKMS_KERNEL_MODULE
77. **urbanterror** (blocked_deps=0, reverse_deps=0, total_deps=4) — SOURCE_UNAVAILABLE
78. **ut2004-gog** (blocked_deps=0, reverse_deps=0, total_deps=4) — NON_DISTRIBUTABLE
79. **zfs-linux-hardened-headers** (blocked_deps=0, reverse_deps=0, total_deps=4) — KERNEL_SPECIFIC
80. **zfs-linux-rt-headers** (blocked_deps=0, reverse_deps=0, total_deps=4) — KERNEL_SPECIFIC
81. **bililive-recorder** (blocked_deps=0, reverse_deps=0, total_deps=5) — DEP_RESOLUTION_FAILED
82. **futu-ftnn-wine** (blocked_deps=0, reverse_deps=0, total_deps=5) — NEEDS_RECIPE_DESIGN
83. **inkdrop** (blocked_deps=0, reverse_deps=0, total_deps=5) — SOURCE_UNAVAILABLE
84. **kamilsss655-uv-k5-firmware-custom-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — CROSS_COMPILATION
85. **mailnaggertray-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — DEP_RESOLUTION_FAILED
86. **nvidia-open-tinygrad-dkms-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — TOOLING_FAILURE
87. **pamac-cli** (blocked_deps=0, reverse_deps=0, total_deps=5) — DISTRO_SPECIFIC
88. **pulumi-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — DEP_RESOLUTION_FAILED
89. **python-gradio-pdf** (blocked_deps=0, reverse_deps=0, total_deps=5) — NEEDS_RECIPE_DESIGN
90. **python-jaxlib-bin** (blocked_deps=0, reverse_deps=0, total_deps=5) — SOURCE_UNAVAILABLE
91. **python-pypi2pkgbuild** (blocked_deps=0, reverse_deps=0, total_deps=5) — DISTRO_SPECIFIC
92. **python2-dbus** (blocked_deps=0, reverse_deps=0, total_deps=5) — LEGACY_PYTHON2
93. **soapysdrplay3-luarvique-git** (blocked_deps=0, reverse_deps=0, total_deps=5) — PROPRIETARY_DEP
94. **unpack-install-jammer** (blocked_deps=0, reverse_deps=0, total_deps=5) — SOURCE_UNAVAILABLE
95. **unrealtournament4** (blocked_deps=0, reverse_deps=0, total_deps=5) — NON_DISTRIBUTABLE
96. **zfs-linux-git-headers** (blocked_deps=0, reverse_deps=0, total_deps=5) — KERNEL_SPECIFIC
97. **asp** (blocked_deps=0, reverse_deps=0, total_deps=6) — DISTRO_SPECIFIC
98. **aurutils** (blocked_deps=0, reverse_deps=0, total_deps=6) — DISTRO_SPECIFIC
99. **awk-language-server** (blocked_deps=0, reverse_deps=0, total_deps=6) — DEP_RESOLUTION_FAILED
100. **factorio-space-age-experimental** (blocked_deps=0, reverse_deps=0, total_deps=6) — NON_DISTRIBUTABLE
