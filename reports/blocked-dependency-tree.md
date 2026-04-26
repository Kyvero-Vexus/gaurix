# Blocked Dependency Tree — deptree-resolver-260425n

**Generated:** 2026-04-26T02:13:24.470641+00:00

**Total BLOCKED:** 252

**Selected for evaluation:** 100

## Blocking Reason Distribution

| Reason | Count |
|--------|-------|
| DEP_RESOLUTION_FAILED | 106 |
| TOOLING_FAILURE | 24 |
| SOURCE_UNAVAILABLE | 18 |
| DISTRO_SPECIFIC | 14 |
| DKMS_KERNEL_MODULE | 11 |
| MINGW_CROSS_COMPILATION | 9 |
| LICENSE_REVIEW_NEEDED | 7 |
| MULTILIB_UNSUPPORTED | 7 |
| AUR_REPO_DELETED | 5 |
| NEEDS_RECIPE_DESIGN | 4 |
| BUILD_FAILED | 4 |
| COMPLEX_DEPS | 4 |
| COMPLEX_BUILD | 4 |
| GCC_SNAPSHOT_RUNTIME | 4 |
| PROPRIETARY_BINARY | 3 |
| NON_DISTRIBUTABLE | 3 |
| KERNEL_SPECIFIC | 3 |
| SELINUX_SPECIFIC | 2 |
| PLATFORM_UNSUPPORTED | 2 |
| BROWSER_EXTENSION | 2 |
| ANDROID_SDK_PLATFORM | 2 |
| KERNEL_MODULE | 2 |
| PROPRIETARY_DEP | 2 |
| LEGACY_PYTHON2 | 2 |
| ABANDONED_UPSTREAM | 1 |
| CROSS_COMPILATION | 1 |
| ARCH_SPECIFIC | 1 |
| MISSING_DEP | 1 |
| NEEDS_INVESTIGATION | 1 |
| ROCM_DEPENDENCY | 1 |
| PROPRIETARY_PLATFORM | 1 |
| CUDA_DEPENDENCY | 1 |

## Priority Queue (Top 200)

| Rank | Package | Blocked Deps | Reverse Deps | Total Deps | Reason |
|------|---------|-------------|-------------|-----------|--------|
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
| 66 | chromium-extension-arch-search | 0 | 0 | 4 | DISTRO_SPECIFIC |
| 67 | clash-for-windows-chinese | 0 | 0 | 4 | ABANDONED_UPSTREAM |
| 68 | eclipse-pydev | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 69 | euroscope-bin | 0 | 0 | 4 | SOURCE_UNAVAILABLE |
| 70 | gbm | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 71 | gephi-git | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 72 | lobe-chat | 0 | 0 | 4 | DEP_RESOLUTION_FAILED |
| 73 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | SOURCE_UNAVAILABLE |
| 74 | qtspim-iconfix | 0 | 0 | 4 | BUILD_FAILED |
| 75 | rtl88x2ce-dkms-git | 0 | 0 | 4 | DKMS_KERNEL_MODULE |
| 76 | urbanterror | 0 | 0 | 4 | SOURCE_UNAVAILABLE |
| 77 | ut2004-gog | 0 | 0 | 4 | NON_DISTRIBUTABLE |
| 78 | zfs-linux-hardened-headers | 0 | 0 | 4 | KERNEL_SPECIFIC |
| 79 | zfs-linux-rt-headers | 0 | 0 | 4 | KERNEL_SPECIFIC |
| 80 | futu-ftnn-wine | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN |
| 81 | inkdrop | 0 | 0 | 5 | SOURCE_UNAVAILABLE |
| 82 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | CROSS_COMPILATION |
| 83 | mailnaggertray-git | 0 | 0 | 5 | DEP_RESOLUTION_FAILED |
| 84 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | TOOLING_FAILURE |
| 85 | pamac-cli | 0 | 0 | 5 | DISTRO_SPECIFIC |
| 86 | pulumi-git | 0 | 0 | 5 | DEP_RESOLUTION_FAILED |
| 87 | python-gradio-pdf | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN |
| 88 | python-jaxlib-bin | 0 | 0 | 5 | SOURCE_UNAVAILABLE |
| 89 | python-pypi2pkgbuild | 0 | 0 | 5 | DISTRO_SPECIFIC |
| 90 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | PROPRIETARY_DEP |
| 91 | unrealtournament4 | 0 | 0 | 5 | NON_DISTRIBUTABLE |
| 92 | zfs-linux-git-headers | 0 | 0 | 5 | KERNEL_SPECIFIC |
| 93 | asp | 0 | 0 | 6 | DISTRO_SPECIFIC |
| 94 | aurutils | 0 | 0 | 6 | DISTRO_SPECIFIC |
| 95 | awk-language-server | 0 | 0 | 6 | DEP_RESOLUTION_FAILED |
| 96 | factorio-space-age-experimental | 0 | 0 | 6 | NON_DISTRIBUTABLE |
| 97 | fileoptimizer-bin | 0 | 0 | 6 | PLATFORM_UNSUPPORTED |
| 98 | gstreamermm-docs | 0 | 0 | 6 | SOURCE_UNAVAILABLE |
| 99 | lib32-libglade | 0 | 0 | 6 | MULTILIB_UNSUPPORTED |
| 100 | mingw-w64-boost | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 101 | mingw-w64-cppwinrt | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 102 | mingw-w64-pcre2 | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 103 | mingw-w64-spirv-tools | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 104 | swscreenshot-gui | 0 | 0 | 6 | DEP_RESOLUTION_FAILED |
| 105 | vegastrike-git | 0 | 0 | 6 | DEP_RESOLUTION_FAILED |
| 106 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | TOOLING_FAILURE |
| 107 | arti-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 108 | dxvk-async-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 109 | eddiscovery | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 110 | fido2-hid-bridge | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 111 | glibc-eac | 0 | 0 | 7 | COMPLEX_DEPS |
| 112 | lib32-libxpm | 0 | 0 | 7 | MULTILIB_UNSUPPORTED |
| 113 | limine-snapper-sync-git | 0 | 0 | 7 | SOURCE_UNAVAILABLE |
| 114 | linux-gpib | 0 | 0 | 7 | KERNEL_MODULE |
| 115 | logstash | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 116 | mingw-w64-postgresql | 0 | 0 | 7 | MINGW_CROSS_COMPILATION |
| 117 | mkinitcpio-clevis-hook | 0 | 0 | 7 | ARCH_SPECIFIC |
| 118 | obs-plugin-input-overlay-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 119 | pikeru | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 120 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 121 | prs | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 122 | python2-gimp | 0 | 0 | 7 | LEGACY_PYTHON2 |
| 123 | wayprompt-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 124 | wldash | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 125 | yt-x-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED |
| 126 | anytxt-bin | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED |
| 127 | coreutils-arch | 0 | 0 | 8 | TOOLING_FAILURE |
| 128 | emerald | 0 | 0 | 8 | MISSING_DEP |
| 129 | go2tv | 0 | 0 | 8 | DEP_RESOLUTION_FAILED |
| 130 | lib32-sdl_sound | 0 | 0 | 8 | MULTILIB_UNSUPPORTED |
| 131 | mingw-w64-lame | 0 | 0 | 8 | MINGW_CROSS_COMPILATION |
| 132 | pianoteq-stage | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED |
| 133 | pikaur-static | 0 | 0 | 8 | TOOLING_FAILURE |
| 134 | pikaur-static-git | 0 | 0 | 8 | TOOLING_FAILURE |
| 135 | rocketchat-desktop | 0 | 0 | 8 | DEP_RESOLUTION_FAILED |
| 136 | vmd | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED |
| 137 | webcord-vencord-git | 0 | 0 | 8 | DEP_RESOLUTION_FAILED |
| 138 | xeme-hg | 0 | 0 | 8 | SOURCE_UNAVAILABLE |
| 139 | anyrun-git | 0 | 0 | 9 | COMPLEX_BUILD |
| 140 | boost-python2 | 0 | 0 | 9 | LEGACY_PYTHON2 |
| 141 | epub_to_audiobook-git | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 142 | frame-eth | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 143 | freetube-electron-git | 0 | 0 | 9 | COMPLEX_DEPS |
| 144 | lib32-vkbasalt | 0 | 0 | 9 | TOOLING_FAILURE |
| 145 | madness-interactive-reloaded | 0 | 0 | 9 | SOURCE_UNAVAILABLE |
| 146 | mobirise | 0 | 0 | 9 | LICENSE_REVIEW_NEEDED |
| 147 | network-manager-applet-nolibappindicator | 0 | 0 | 9 | TOOLING_FAILURE |
| 148 | open-tv | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 149 | pcem-git | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 150 | prey | 0 | 0 | 9 | SOURCE_UNAVAILABLE |
| 151 | python-pylink-square | 0 | 0 | 9 | PROPRIETARY_DEP |
| 152 | shijima-qt | 0 | 0 | 9 | DEP_RESOLUTION_FAILED |
| 153 | auracle-git | 0 | 0 | 10 | DISTRO_SPECIFIC |
| 154 | ausweiskopie | 0 | 0 | 10 | SOURCE_UNAVAILABLE |
| 155 | beignet-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 156 | borgwarehouse | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 157 | hnefatafl-copenhagen | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 158 | libfive-studio-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 159 | libga68-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 160 | libgfortran-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 161 | libgnat-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 162 | libgo-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME |
| 163 | linux-sched-ext-git-headers | 0 | 0 | 10 | TOOLING_FAILURE |
| 164 | linux-tip-git-headers | 0 | 0 | 10 | TOOLING_FAILURE |
| 165 | mailspring | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 166 | nvidia-390xx-settings | 0 | 0 | 10 | TOOLING_FAILURE |
| 167 | pantheon-polkit-agent-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 168 | vanilla-wiiu-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 169 | virtualbox-bin-sdk | 0 | 0 | 10 | DEP_RESOLUTION_FAILED |
| 170 | cockatrice-server-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 171 | fancy-cat | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 172 | lto-dump-snapshot | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 173 | luxtorpeda-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 174 | principia-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 175 | python-google-cloud-speech | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 176 | synfigstudio-dev | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 177 | vegastrike-engine-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 178 | vgmstream-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 179 | whatip-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED |
| 180 | devtools-git | 0 | 0 | 12 | TOOLING_FAILURE |
| 181 | envoyproxy | 0 | 0 | 12 | BUILD_FAILED |
| 182 | gst-plugins-rs-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED |
| 183 | linux-xanmod-lts-headers | 0 | 0 | 12 | TOOLING_FAILURE |
| 184 | mingw-w64-libopenmpt | 0 | 0 | 12 | TOOLING_FAILURE |
| 185 | opendrop-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED |
| 186 | wayfire-plugins-extra-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED |
| 187 | betterx-desktop-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED |
| 188 | capt-src | 0 | 0 | 13 | MULTILIB_UNSUPPORTED |
| 189 | glsmac-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED |
| 190 | illogical-impulse-ags | 0 | 0 | 13 | NEEDS_INVESTIGATION |
| 191 | python-jax-rocm | 0 | 0 | 13 | ROCM_DEPENDENCY |
| 192 | yacreader-poppler-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED |
| 193 | goxlr-utility-ui | 0 | 0 | 14 | DEP_RESOLUTION_FAILED |
| 194 | lincity-ng-git | 0 | 0 | 14 | DEP_RESOLUTION_FAILED |
| 195 | linux-cachyos-hardened-headers | 0 | 0 | 14 | TOOLING_FAILURE |
| 196 | linux-next-git-headers | 0 | 0 | 14 | TOOLING_FAILURE |
| 197 | rpfm-git | 0 | 0 | 14 | COMPLEX_BUILD |
| 198 | deepin-wine8-stable | 0 | 0 | 15 | PROPRIETARY_BINARY |
| 199 | lightlyshaders-git | 0 | 0 | 15 | DEP_RESOLUTION_FAILED |
| 200 | linux-covolunablu-gaming-headers | 0 | 0 | 15 | TOOLING_FAILURE |
