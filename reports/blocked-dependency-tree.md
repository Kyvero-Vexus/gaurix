# Blocked Dependency Tree — deptree-resolver-260425l

Generated: 2026-04-25T22:26:33.277096+00:00

## Summary

| Metric | Count |
|--------|-------|
| Total blocked | 253 |
| In AUR cache | 250 |
| Zero blocked deps | 249 |

## Blocking Reason Distribution

- **DEP_RESOLUTION_FAILED:** 108
- **TOOLING_FAILURE:** 24
- **SOURCE_UNAVAILABLE:** 17
- **DISTRO_SPECIFIC:** 13
- **DKMS_KERNEL_MODULE:** 11
- **MINGW_CROSS_COMPILATION:** 9
- **LICENSE_REVIEW_NEEDED:** 7
- **MULTILIB_UNSUPPORTED:** 7
- **AUR_REPO_DELETED:** 5
- **NEEDS_RECIPE_DESIGN:** 4
- **BUILD_FAILED:** 4
- **COMPLEX_DEPS:** 4
- **COMPLEX_BUILD:** 4
- **GCC_SNAPSHOT_RUNTIME:** 4
- **PROPRIETARY_BINARY:** 3
- **NON_DISTRIBUTABLE:** 3
- **KERNEL_SPECIFIC:** 3
- **SELINUX_SPECIFIC:** 2
- **PLATFORM_UNSUPPORTED:** 2
- **BROWSER_EXTENSION:** 2
- **ANDROID_SDK_PLATFORM:** 2
- **KERNEL_MODULE:** 2
- **PROPRIETARY_DEP:** 2
- **LEGACY_PYTHON2:** 2
- **ABANDONED_UPSTREAM:** 1
- **CROSS_COMPILATION:** 1
- **ARCH_SPECIFIC:** 1
- **MISSING_DEP:** 1
- **BLOCKED:** 1
- **NEEDS_INVESTIGATION:** 1
- **ROCM_DEPENDENCY:** 1
- **PROPRIETARY_PLATFORM:** 1
- **CUDA_DEPENDENCY:** 1

## Priority Queue (top 200)

| Rank | Package | Blocked Deps | Reverse Deps | Total Deps | Reason |
|------|---------|-------------|-------------- |------------|--------|
| 1 | gradience | 0 | 1 | 0 | DEP_RESOLUTION_FAILED: |
| 2 | sudo-selinux | 0 | 1 | 8 | SELINUX_SPECIFIC: |
| 3 | base-selinux | 0 | 1 | 18 | SELINUX_SPECIFIC: |
| 4 | wayfire-git | 0 | 1 | 33 | DEP_RESOLUTION_FAILED: |
| 5 | virtualbox-svn | 0 | 1 | 53 | DEP_RESOLUTION_FAILED: |
| 6 | deadbeef-mpris2-plugin | 0 | 0 | 0 | SOURCE_UNAVAILABLE: |
| 7 | sipgate-app-clinq | 0 | 0 | 0 | NEEDS_RECIPE_DESIGN: |
| 8 | squareline-studio | 0 | 0 | 0 | SOURCE_UNAVAILABLE: |
| 9 | aquacomputer_d5next-hwmon-dkms | 0 | 0 | 1 | DKMS_KERNEL_MODULE: |
| 10 | bakkesmod-steam | 0 | 0 | 1 | PLATFORM_UNSUPPORTED: |
| 11 | edgeimpulse-cli | 0 | 0 | 1 | DEP_RESOLUTION_FAILED: |
| 12 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | BROWSER_EXTENSION: |
| 13 | librewolf-tridactyl-native-bin | 0 | 0 | 1 | BROWSER_EXTENSION: |
| 14 | luniistore | 0 | 0 | 1 | SOURCE_UNAVAILABLE: |
| 15 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | DISTRO_SPECIFIC: |
| 16 | repacman | 0 | 0 | 1 | DISTRO_SPECIFIC: |
| 17 | simplicity-commander | 0 | 0 | 1 | SOURCE_UNAVAILABLE: |
| 18 | amneziawg-dkms-git | 0 | 0 | 2 | DKMS_KERNEL_MODULE: |
| 19 | amneziawg-linux | 0 | 0 | 2 | DKMS_KERNEL_MODULE: |
| 20 | amneziawg-linux-hardened | 0 | 0 | 2 | DKMS_KERNEL_MODULE: |
| 21 | android-platform-19 | 0 | 0 | 2 | ANDROID_SDK_PLATFORM: |
| 22 | android-platform-21 | 0 | 0 | 2 | ANDROID_SDK_PLATFORM: |
| 23 | archwiki-offline | 0 | 0 | 2 | DISTRO_SPECIFIC: |
| 24 | aws-amplify-cli | 0 | 0 | 2 | DEP_RESOLUTION_FAILED: |
| 25 | aws-cdk | 0 | 0 | 2 | DEP_RESOLUTION_FAILED: |
| 26 | brother-mfc-l2400dw | 0 | 0 | 2 | LICENSE_REVIEW_NEEDED: |
| 27 | decrypto-pro-git | 0 | 0 | 2 | DEP_RESOLUTION_FAILED: |
| 28 | emmet-language-server | 0 | 0 | 2 | DEP_RESOLUTION_FAILED: |
| 29 | faustus-dkms-git | 0 | 0 | 2 | DKMS_KERNEL_MODULE: |
| 30 | findbrokenpkgs | 0 | 0 | 2 | DISTRO_SPECIFIC: |
| 31 | ideapad-laptop-tb-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE: |
| 32 | ideapad-laptop-tb2024g6plus-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE: |
| 33 | knossu | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN: |
| 34 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | MULTILIB_UNSUPPORTED: |
| 35 | libch343ser-git | 0 | 0 | 2 | KERNEL_MODULE: |
| 36 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | PROPRIETARY_BINARY: |
| 37 | mingw-w64-cblas | 0 | 0 | 2 | MINGW_CROSS_COMPILATION: |
| 38 | mingw-w64-lapack | 0 | 0 | 2 | MINGW_CROSS_COMPILATION: |
| 39 | mingw-w64-soundtouch | 0 | 0 | 2 | MINGW_CROSS_COMPILATION: |
| 40 | nodejs-cspell | 0 | 0 | 2 | DEP_RESOLUTION_FAILED: |
| 41 | osmtogeojson | 0 | 0 | 2 | DEP_RESOLUTION_FAILED: |
| 42 | pfring-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE: |
| 43 | python-home-assistant-frontend | 0 | 0 | 2 | DEP_RESOLUTION_FAILED: |
| 44 | r8126-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE: |
| 45 | receitanet | 0 | 0 | 2 | SOURCE_UNAVAILABLE: |
| 46 | sbctl-initcpio-post-hook | 0 | 0 | 2 | DISTRO_SPECIFIC: |
| 47 | system-age | 0 | 0 | 2 | DISTRO_SPECIFIC: |
| 48 | ttf-consolas-ligaturized | 0 | 0 | 2 | LICENSE_REVIEW_NEEDED: |
| 49 | vscodium-marketplace | 0 | 0 | 2 | TOOLING_FAILURE: |
| 50 | wyc | 0 | 0 | 2 | SOURCE_UNAVAILABLE: |
| 51 | beammp-launcher-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: |
| 52 | java-language-server | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: |
| 53 | libarchive-static | 0 | 0 | 3 | TOOLING_FAILURE: |
| 54 | lightdm-webkit-theme-aether | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: |
| 55 | linux-keep-modules | 0 | 0 | 3 | DISTRO_SPECIFIC: |
| 56 | nfuspire-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: |
| 57 | nginx-mainline-mod-njs | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: |
| 58 | nodejs-nestjs-cli | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: |
| 59 | nvidia-bl-dkms | 0 | 0 | 3 | DKMS_KERNEL_MODULE: |
| 60 | pacpak-git | 0 | 0 | 3 | DISTRO_SPECIFIC: |
| 61 | phonon-qt4-vlc | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: |
| 62 | quartz-utils-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: |
| 63 | rdt-client | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: |
| 64 | sommelier-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: |
| 65 | texmacs-pure | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: |
| 66 | tilp-xdg | 0 | 0 | 3 | DEP_RESOLUTION_FAILED: |
| 67 | chromium-extension-arch-search | 0 | 0 | 4 | DISTRO_SPECIFIC: |
| 68 | clash-for-windows-chinese | 0 | 0 | 4 | ABANDONED_UPSTREAM: |
| 69 | eclipse-pydev | 0 | 0 | 4 | DEP_RESOLUTION_FAILED: |
| 70 | euroscope-bin | 0 | 0 | 4 | SOURCE_UNAVAILABLE: |
| 71 | gbm | 0 | 0 | 4 | DEP_RESOLUTION_FAILED: |
| 72 | gephi-git | 0 | 0 | 4 | DEP_RESOLUTION_FAILED: |
| 73 | lobe-chat | 0 | 0 | 4 | DEP_RESOLUTION_FAILED: |
| 74 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | SOURCE_UNAVAILABLE: |
| 75 | qtspim-iconfix | 0 | 0 | 4 | BUILD_FAILED: |
| 76 | rtl88x2ce-dkms-git | 0 | 0 | 4 | DKMS_KERNEL_MODULE: |
| 77 | urbanterror | 0 | 0 | 4 | SOURCE_UNAVAILABLE: |
| 78 | ut2004-gog | 0 | 0 | 4 | NON_DISTRIBUTABLE: |
| 79 | zfs-linux-hardened-headers | 0 | 0 | 4 | KERNEL_SPECIFIC: |
| 80 | zfs-linux-rt-headers | 0 | 0 | 4 | KERNEL_SPECIFIC: |
| 81 | futu-ftnn-wine | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN: |
| 82 | inkdrop | 0 | 0 | 5 | SOURCE_UNAVAILABLE: |
| 83 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | CROSS_COMPILATION: |
| 84 | mailnaggertray-git | 0 | 0 | 5 | DEP_RESOLUTION_FAILED: |
| 85 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | TOOLING_FAILURE: |
| 86 | pamac-cli | 0 | 0 | 5 | DISTRO_SPECIFIC: |
| 87 | pulumi-git | 0 | 0 | 5 | DEP_RESOLUTION_FAILED: |
| 88 | python-gradio-pdf | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN: |
| 89 | python-jaxlib-bin | 0 | 0 | 5 | SOURCE_UNAVAILABLE: |
| 90 | python-pypi2pkgbuild | 0 | 0 | 5 | DISTRO_SPECIFIC: |
| 91 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | PROPRIETARY_DEP: |
| 92 | unrealtournament4 | 0 | 0 | 5 | NON_DISTRIBUTABLE: |
| 93 | zfs-linux-git-headers | 0 | 0 | 5 | KERNEL_SPECIFIC: |
| 94 | asp | 0 | 0 | 6 | DISTRO_SPECIFIC: |
| 95 | aurutils | 0 | 0 | 6 | DISTRO_SPECIFIC: |
| 96 | awk-language-server | 0 | 0 | 6 | DEP_RESOLUTION_FAILED: |
| 97 | factorio-space-age-experimental | 0 | 0 | 6 | NON_DISTRIBUTABLE: |
| 98 | fileoptimizer-bin | 0 | 0 | 6 | PLATFORM_UNSUPPORTED: |
| 99 | gstreamermm-docs | 0 | 0 | 6 | SOURCE_UNAVAILABLE: |
| 100 | lib32-libglade | 0 | 0 | 6 | MULTILIB_UNSUPPORTED: |
| 101 | mingw-w64-boost | 0 | 0 | 6 | MINGW_CROSS_COMPILATION: |
| 102 | mingw-w64-cppwinrt | 0 | 0 | 6 | MINGW_CROSS_COMPILATION: |
| 103 | mingw-w64-pcre2 | 0 | 0 | 6 | MINGW_CROSS_COMPILATION: |
| 104 | mingw-w64-spirv-tools | 0 | 0 | 6 | MINGW_CROSS_COMPILATION: |
| 105 | swscreenshot-gui | 0 | 0 | 6 | DEP_RESOLUTION_FAILED: |
| 106 | vegastrike-git | 0 | 0 | 6 | DEP_RESOLUTION_FAILED: |
| 107 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | TOOLING_FAILURE: |
| 108 | arti-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: |
| 109 | dxvk-async-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: |
| 110 | eddiscovery | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: |
| 111 | fido2-hid-bridge | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: |
| 112 | glibc-eac | 0 | 0 | 7 | COMPLEX_DEPS: |
| 113 | lib32-libxpm | 0 | 0 | 7 | MULTILIB_UNSUPPORTED: |
| 114 | limine-snapper-sync-git | 0 | 0 | 7 | SOURCE_UNAVAILABLE: |
| 115 | linux-gpib | 0 | 0 | 7 | KERNEL_MODULE: |
| 116 | logstash | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: |
| 117 | mingw-w64-postgresql | 0 | 0 | 7 | MINGW_CROSS_COMPILATION: |
| 118 | mkinitcpio-clevis-hook | 0 | 0 | 7 | ARCH_SPECIFIC: |
| 119 | obs-plugin-input-overlay-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: |
| 120 | pikeru | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: |
| 121 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: |
| 122 | prs | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: |
| 123 | python2-gimp | 0 | 0 | 7 | LEGACY_PYTHON2: |
| 124 | wayprompt-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: |
| 125 | wldash | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: |
| 126 | yt-x-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: |
| 127 | anytxt-bin | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED: |
| 128 | coreutils-arch | 0 | 0 | 8 | TOOLING_FAILURE: |
| 129 | emerald | 0 | 0 | 8 | MISSING_DEP: |
| 130 | go2tv | 0 | 0 | 8 | DEP_RESOLUTION_FAILED: |
| 131 | lib32-sdl_sound | 0 | 0 | 8 | MULTILIB_UNSUPPORTED: |
| 132 | mingw-w64-lame | 0 | 0 | 8 | MINGW_CROSS_COMPILATION: |
| 133 | pianoteq-stage | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED: |
| 134 | pikaur-static | 0 | 0 | 8 | TOOLING_FAILURE: |
| 135 | pikaur-static-git | 0 | 0 | 8 | TOOLING_FAILURE: |
| 136 | rocketchat-desktop | 0 | 0 | 8 | DEP_RESOLUTION_FAILED: |
| 137 | vmd | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED: |
| 138 | webcord-vencord-git | 0 | 0 | 8 | DEP_RESOLUTION_FAILED: |
| 139 | xeme-hg | 0 | 0 | 8 | SOURCE_UNAVAILABLE: |
| 140 | anyrun-git | 0 | 0 | 9 | COMPLEX_BUILD: |
| 141 | boost-python2 | 0 | 0 | 9 | LEGACY_PYTHON2: |
| 142 | epub_to_audiobook-git | 0 | 0 | 9 | DEP_RESOLUTION_FAILED: |
| 143 | frame-eth | 0 | 0 | 9 | DEP_RESOLUTION_FAILED: |
| 144 | freetube-electron-git | 0 | 0 | 9 | COMPLEX_DEPS: |
| 145 | lib32-vkbasalt | 0 | 0 | 9 | TOOLING_FAILURE: |
| 146 | madness-interactive-reloaded | 0 | 0 | 9 | SOURCE_UNAVAILABLE: |
| 147 | mobirise | 0 | 0 | 9 | LICENSE_REVIEW_NEEDED: |
| 148 | network-manager-applet-nolibappindicator | 0 | 0 | 9 | TOOLING_FAILURE: |
| 149 | open-tv | 0 | 0 | 9 | DEP_RESOLUTION_FAILED: |
| 150 | pcem-git | 0 | 0 | 9 | DEP_RESOLUTION_FAILED: |
| 151 | prey | 0 | 0 | 9 | SOURCE_UNAVAILABLE: |
| 152 | python-pylink-square | 0 | 0 | 9 | PROPRIETARY_DEP: |
| 153 | shijima-qt | 0 | 0 | 9 | DEP_RESOLUTION_FAILED: |
| 154 | auracle-git | 0 | 0 | 10 | BLOCKED: |
| 155 | ausweiskopie | 0 | 0 | 10 | SOURCE_UNAVAILABLE: |
| 156 | beignet-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: |
| 157 | borgwarehouse | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: |
| 158 | hnefatafl-copenhagen | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: |
| 159 | libfive-studio-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: |
| 160 | libga68-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME: |
| 161 | libgfortran-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME: |
| 162 | libgnat-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME: |
| 163 | libgo-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME: |
| 164 | linux-sched-ext-git-headers | 0 | 0 | 10 | TOOLING_FAILURE: |
| 165 | linux-tip-git-headers | 0 | 0 | 10 | TOOLING_FAILURE: |
| 166 | mailspring | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: |
| 167 | nvidia-390xx-settings | 0 | 0 | 10 | TOOLING_FAILURE: |
| 168 | pantheon-polkit-agent-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: |
| 169 | vanilla-wiiu-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: |
| 170 | virtualbox-bin-sdk | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: |
| 171 | cockatrice-server-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: |
| 172 | fancy-cat | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: |
| 173 | lto-dump-snapshot | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: |
| 174 | luxtorpeda-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: |
| 175 | principia-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: |
| 176 | python-google-cloud-speech | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: |
| 177 | synfigstudio-dev | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: |
| 178 | vegastrike-engine-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: |
| 179 | vgmstream-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: |
| 180 | whatip-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: |
| 181 | devtools-git | 0 | 0 | 12 | TOOLING_FAILURE: |
| 182 | envoyproxy | 0 | 0 | 12 | BUILD_FAILED: |
| 183 | gst-plugins-rs-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED: |
| 184 | linux-xanmod-lts-headers | 0 | 0 | 12 | TOOLING_FAILURE: |
| 185 | mingw-w64-libopenmpt | 0 | 0 | 12 | TOOLING_FAILURE: |
| 186 | opendrop-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED: |
| 187 | betterx-desktop-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED: |
| 188 | capt-src | 0 | 0 | 13 | MULTILIB_UNSUPPORTED: |
| 189 | glsmac-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED: |
| 190 | illogical-impulse-ags | 0 | 0 | 13 | NEEDS_INVESTIGATION: |
| 191 | python-jax-rocm | 0 | 0 | 13 | ROCM_DEPENDENCY: |
| 192 | yacreader-poppler-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED: |
| 193 | goxlr-utility-ui | 0 | 0 | 14 | DEP_RESOLUTION_FAILED: |
| 194 | lincity-ng-git | 0 | 0 | 14 | DEP_RESOLUTION_FAILED: |
| 195 | linux-cachyos-hardened-headers | 0 | 0 | 14 | TOOLING_FAILURE: |
| 196 | linux-next-git-headers | 0 | 0 | 14 | TOOLING_FAILURE: |
| 197 | rpfm-git | 0 | 0 | 14 | COMPLEX_BUILD: |
| 198 | deepin-wine8-stable | 0 | 0 | 15 | PROPRIETARY_BINARY: |
| 199 | lightlyshaders-git | 0 | 0 | 15 | DEP_RESOLUTION_FAILED: |
| 200 | linux-covolunablu-gaming-headers | 0 | 0 | 15 | TOOLING_FAILURE: |
