# Blocked Dependency Tree Report

Generated: 2026-04-25T13:36:37.086963+00:00
Pass: deptree-resolver-260425g
Selected: 100

## Summary

- Total blocked: 270
- In AUR cache: 267
- Not in cache: 3
- Zero blocked deps: 266

## Blocking Reasons

- DEP_RESOLUTION_FAILED:: 117
- TOOLING_FAILURE:: 28
- SOURCE_UNAVAILABLE:: 17
- DISTRO_SPECIFIC:: 12
- DKMS_KERNEL_MODULE:: 11
- MINGW_CROSS_COMPILATION:: 10
- LICENSE_REVIEW_NEEDED:: 7
- MULTILIB_UNSUPPORTED:: 7
- AUR_REPO_DELETED:: 5
- NEEDS_RECIPE_DESIGN:: 4
- LEGACY_PYTHON2:: 4
- BUILD_FAILED:: 4
- COMPLEX_DEPS:: 4
- COMPLEX_BUILD:: 4
- GCC_SNAPSHOT_RUNTIME:: 4
- PROPRIETARY_BINARY:: 3
- NON_DISTRIBUTABLE:: 3
- KERNEL_SPECIFIC:: 3
- SELINUX_SPECIFIC:: 2
- PLATFORM_UNSUPPORTED:: 2
- BROWSER_EXTENSION:: 2
- ANDROID_SDK_PLATFORM:: 2
- KERNEL_MODULE:: 2
- PROPRIETARY_DEP:: 2
- BUILD_NETWORK_REQUIRED:: 1
- ABANDONED_UPSTREAM:: 1
- CROSS_COMPILATION:: 1
- deptree-resolver-260417ac:ARCH_SPECIFIC:: 1
- ARCH_SPECIFIC:: 1
- MISSING_DEP:: 1
- DISTRO_SPECIFIC: 1
- NEEDS_INVESTIGATION:: 1
- ROCM_DEPENDENCY:: 1
- PROPRIETARY_PLATFORM:: 1
- CUDA_DEPENDENCY:: 1

## Priority Queue (Top 200)

| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR | Fail Reason |
|------|---|---------|-------------|-------------|-----------|--------|-------------|
| 1 | 18644 | gradience | 0 | 1 | 0 | No | DEP_RESOLUTION_FAILED: |
| 2 | 18513 | sudo-selinux | 0 | 1 | 8 | Yes | SELINUX_SPECIFIC: |
| 3 | 18537 | base-selinux | 0 | 1 | 18 | Yes | SELINUX_SPECIFIC: |
| 4 | 18359 | wayfire-git | 0 | 1 | 33 | Yes | DEP_RESOLUTION_FAILED: |
| 5 | 18799 | virtualbox-svn | 0 | 1 | 53 | Yes | DEP_RESOLUTION_FAILED: |
| 6 | 18703 | neovim-lspconfig-opt-git | 0 | 0 | 0 | No | TOOLING_FAILURE: |
| 7 | 18449 | sipgate-app-clinq | 0 | 0 | 0 | No | NEEDS_RECIPE_DESIGN: |
| 8 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 9 | 18606 | aquacomputer_d5next-hwmon-dkms | 0 | 0 | 1 | Yes | DKMS_KERNEL_MODULE: |
| 10 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 11 | 18574 | edgeimpulse-cli | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 12 | 18355 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 13 | 18285 | librewolf-tridactyl-native-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 14 | 18423 | locale-mul_zz | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 15 | 18478 | luniistore | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 16 | 18371 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | Yes | DISTRO_SPECIFIC: |
| 17 | 18838 | playerctld-systemd-unit | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 18 | 18707 | repacman | 0 | 0 | 1 | Yes | DISTRO_SPECIFIC: |
| 19 | 18419 | simplicity-commander | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 20 | 18642 | amneziawg-dkms-git | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 21 | 18452 | amneziawg-linux | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 22 | 18382 | amneziawg-linux-hardened | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 23 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 24 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 25 | 18568 | archwiki-offline | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 26 | 18269 | aws-amplify-cli | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 27 | 18298 | aws-cdk | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 28 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 29 | 18291 | decrypto-pro-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 30 | 18958 | emmet-language-server | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 31 | 18859 | faustus-dkms-git | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 32 | 18930 | findbrokenpkgs | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 33 | 18957 | ideapad-laptop-tb-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 34 | 18895 | ideapad-laptop-tb2024g6plus-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 35 | 18461 | knossu | 0 | 0 | 2 | Yes | NEEDS_RECIPE_DESIGN: |
| 36 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 37 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 38 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 39 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 40 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 41 | 18330 | mingw-w64-soundtouch | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 42 | 18264 | nftables-geoip-db | 0 | 0 | 2 | Yes | BUILD_NETWORK_REQUIRED: |
| 43 | 18215 | nodejs-cspell | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 44 | 18417 | osmtogeojson | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 45 | 18399 | pfring-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 46 | 18556 | python-home-assistant-frontend | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 47 | 18831 | qt5-mqtt | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 48 | 18487 | r8126-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 49 | 18413 | receitanet | 0 | 0 | 2 | Yes | SOURCE_UNAVAILABLE: |
| 50 | 18720 | sbctl-initcpio-post-hook | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 51 | 18453 | system-age | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 52 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 53 | 18695 | vscodium-marketplace | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 54 | 18777 | wyc | 0 | 0 | 2 | Yes | SOURCE_UNAVAILABLE: |
| 55 | 18346 | beammp-launcher-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 56 | 18379 | java-language-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 57 | 18758 | libarchive-static | 0 | 0 | 3 | Yes | TOOLING_FAILURE: |
| 58 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 59 | 18490 | linux-keep-modules | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 60 | 18401 | nfuspire-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 61 | 18380 | nginx-mainline-mod-njs | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 62 | 18753 | nodejs-nestjs-cli | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 63 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | DKMS_KERNEL_MODULE: |
| 64 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 65 | 18938 | phonon-qt4-vlc | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 66 | 18430 | quartz-utils-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 67 | 18561 | rdt-client | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 68 | 18638 | sbctl-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 69 | 18649 | snowflake-pt-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 70 | 18396 | sommelier-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 71 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 72 | 18666 | tilp-xdg | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 73 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 74 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 75 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 76 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 77 | 19044 | gbm | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 78 | 18523 | gearhead2 | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 79 | 18898 | gephi-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 80 | 18973 | lobe-chat | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 81 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 82 | 18398 | php83-mcrypt | 0 | 0 | 4 | Yes | TOOLING_FAILURE: |
| 83 | 18557 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 84 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 85 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 86 | 18362 | rtl88x2ce-dkms-git | 0 | 0 | 4 | Yes | DKMS_KERNEL_MODULE: |
| 87 | 18814 | urbanterror | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 88 | 18333 | ut2004-gog | 0 | 0 | 4 | Yes | NON_DISTRIBUTABLE: |
| 89 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 90 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 91 | 18901 | bililive-recorder | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 92 | 18151 | futu-ftnn-wine | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 93 | 18286 | hq | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 94 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 95 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 96 | 18592 | mailnaggertray-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 97 | 18381 | musique | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 98 | 18640 | nemo-engrampa | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 99 | 18617 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | Yes | TOOLING_FAILURE: |
| 100 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 101 | 18748 | pulumi-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 102 | 18463 | python-gradio-pdf | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 103 | 18474 | python-jaxlib-bin | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 104 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 105 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 106 | 18141 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | Yes | PROPRIETARY_DEP: |
| 107 | 18480 | unpack-install-jammer | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 108 | 18319 | unrealtournament4 | 0 | 0 | 5 | Yes | NON_DISTRIBUTABLE: |
| 109 | 18354 | xidlehook | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 110 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 111 | 14587 | asp | 0 | 0 | 6 | Yes | deptree-resolver-260417ac:ARCH_SPECIFIC: |
| 112 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 113 | 18691 | awk-language-server | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 114 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 115 | 18315 | fileoptimizer-bin | 0 | 0 | 6 | Yes | PLATFORM_UNSUPPORTED: |
| 116 | 18675 | gstreamermm-docs | 0 | 0 | 6 | Yes | SOURCE_UNAVAILABLE: |
| 117 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 118 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 119 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 120 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 121 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 122 | 18576 | swscreenshot-gui | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 123 | 18299 | vegastrike-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 124 | 18520 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | Yes | TOOLING_FAILURE: |
| 125 | 18672 | arti-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 126 | 18820 | dxvk-async-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 127 | 18320 | eddiscovery | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 128 | 18600 | fido2-hid-bridge | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 129 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 130 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 131 | 18667 | limine-snapper-sync-git | 0 | 0 | 7 | Yes | SOURCE_UNAVAILABLE: |
| 132 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 133 | 18911 | logstash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 134 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 135 | 18342 | mkinitcpio-clevis-hook | 0 | 0 | 7 | Yes | ARCH_SPECIFIC: |
| 136 | 18383 | obs-plugin-input-overlay-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 137 | 18281 | pikeru | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 138 | 18397 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 139 | 18438 | prs | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 140 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 141 | 18262 | wayprompt-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 142 | 18237 | wldash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 143 | 18637 | yt-x-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 144 | 18295 | anytxt-bin | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 145 | 18690 | coreutils-arch | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 146 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 147 | 18598 | go2tv | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 148 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 149 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 150 | 18367 | pianoteq-stage | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 151 | 18750 | pikaur-static | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 152 | 18749 | pikaur-static-git | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 153 | 18807 | rocketchat-desktop | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 154 | 18253 | vmd | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 155 | 18852 | webcord-vencord-git | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 156 | 18426 | xeme-hg | 0 | 0 | 8 | Yes | SOURCE_UNAVAILABLE: |
| 157 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 158 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 159 | 18360 | epub_to_audiobook-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 160 | 18612 | frame-eth | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 161 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 162 | 18688 | lib32-vkbasalt | 0 | 0 | 9 | Yes | TOOLING_FAILURE: |
| 163 | 18618 | madness-interactive-reloaded | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 164 | 18357 | mobirise | 0 | 0 | 9 | Yes | LICENSE_REVIEW_NEEDED: |
| 165 | 18792 | network-manager-applet-nolibappindicator | 0 | 0 | 9 | Yes | TOOLING_FAILURE: |
| 166 | 18368 | open-tv | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 167 | 18689 | pcem-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 168 | 18251 | prey | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 169 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | PROPRIETARY_DEP: |
| 170 | 18654 | shijima-qt | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 171 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 172 | 18605 | ausweiskopie | 0 | 0 | 10 | Yes | SOURCE_UNAVAILABLE: |
| 173 | 18416 | beignet-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 174 | 18840 | borgwarehouse | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 175 | 18404 | hnefatafl-copenhagen | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 176 | 18351 | libfive-studio-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 177 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 178 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 179 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 180 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 181 | 18498 | linux-sched-ext-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 182 | 18533 | linux-tip-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 183 | 18921 | mailspring | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 184 | 18484 | nvidia-390xx-settings | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 185 | 18518 | pantheon-polkit-agent-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 186 | 18273 | vanilla-wiiu-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 187 | 18668 | virtualbox-bin-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 188 | 18377 | cockatrice-server-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 189 | 18648 | fancy-cat | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 190 | 18347 | lto-dump-snapshot | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 191 | 18554 | luxtorpeda-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 192 | 18613 | principia-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 193 | 18804 | python-google-cloud-speech | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 194 | 18386 | synfigstudio-dev | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 195 | 18302 | vegastrike-engine-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 196 | 18652 | vgmstream-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 197 | 18378 | whatip-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 198 | 18696 | devtools-git | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 199 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 200 | 18405 | gst-plugins-rs-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |

## Full Queue

| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR | Fail Reason |
|------|---|---------|-------------|-------------|-----------|--------|-------------|
| 1 | 18644 | gradience | 0 | 1 | 0 | No | DEP_RESOLUTION_FAILED: |
| 2 | 18513 | sudo-selinux | 0 | 1 | 8 | Yes | SELINUX_SPECIFIC: |
| 3 | 18537 | base-selinux | 0 | 1 | 18 | Yes | SELINUX_SPECIFIC: |
| 4 | 18359 | wayfire-git | 0 | 1 | 33 | Yes | DEP_RESOLUTION_FAILED: |
| 5 | 18799 | virtualbox-svn | 0 | 1 | 53 | Yes | DEP_RESOLUTION_FAILED: |
| 6 | 18703 | neovim-lspconfig-opt-git | 0 | 0 | 0 | No | TOOLING_FAILURE: |
| 7 | 18449 | sipgate-app-clinq | 0 | 0 | 0 | No | NEEDS_RECIPE_DESIGN: |
| 8 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 9 | 18606 | aquacomputer_d5next-hwmon-dkms | 0 | 0 | 1 | Yes | DKMS_KERNEL_MODULE: |
| 10 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 11 | 18574 | edgeimpulse-cli | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 12 | 18355 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 13 | 18285 | librewolf-tridactyl-native-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 14 | 18423 | locale-mul_zz | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 15 | 18478 | luniistore | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 16 | 18371 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | Yes | DISTRO_SPECIFIC: |
| 17 | 18838 | playerctld-systemd-unit | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 18 | 18707 | repacman | 0 | 0 | 1 | Yes | DISTRO_SPECIFIC: |
| 19 | 18419 | simplicity-commander | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 20 | 18642 | amneziawg-dkms-git | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 21 | 18452 | amneziawg-linux | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 22 | 18382 | amneziawg-linux-hardened | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 23 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 24 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 25 | 18568 | archwiki-offline | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 26 | 18269 | aws-amplify-cli | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 27 | 18298 | aws-cdk | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 28 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 29 | 18291 | decrypto-pro-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 30 | 18958 | emmet-language-server | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 31 | 18859 | faustus-dkms-git | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 32 | 18930 | findbrokenpkgs | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 33 | 18957 | ideapad-laptop-tb-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 34 | 18895 | ideapad-laptop-tb2024g6plus-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 35 | 18461 | knossu | 0 | 0 | 2 | Yes | NEEDS_RECIPE_DESIGN: |
| 36 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 37 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 38 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 39 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 40 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 41 | 18330 | mingw-w64-soundtouch | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 42 | 18264 | nftables-geoip-db | 0 | 0 | 2 | Yes | BUILD_NETWORK_REQUIRED: |
| 43 | 18215 | nodejs-cspell | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 44 | 18417 | osmtogeojson | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 45 | 18399 | pfring-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 46 | 18556 | python-home-assistant-frontend | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 47 | 18831 | qt5-mqtt | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 48 | 18487 | r8126-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 49 | 18413 | receitanet | 0 | 0 | 2 | Yes | SOURCE_UNAVAILABLE: |
| 50 | 18720 | sbctl-initcpio-post-hook | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 51 | 18453 | system-age | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 52 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 53 | 18695 | vscodium-marketplace | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 54 | 18777 | wyc | 0 | 0 | 2 | Yes | SOURCE_UNAVAILABLE: |
| 55 | 18346 | beammp-launcher-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 56 | 18379 | java-language-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 57 | 18758 | libarchive-static | 0 | 0 | 3 | Yes | TOOLING_FAILURE: |
| 58 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 59 | 18490 | linux-keep-modules | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 60 | 18401 | nfuspire-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 61 | 18380 | nginx-mainline-mod-njs | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 62 | 18753 | nodejs-nestjs-cli | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 63 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | DKMS_KERNEL_MODULE: |
| 64 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 65 | 18938 | phonon-qt4-vlc | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 66 | 18430 | quartz-utils-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 67 | 18561 | rdt-client | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 68 | 18638 | sbctl-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 69 | 18649 | snowflake-pt-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 70 | 18396 | sommelier-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 71 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 72 | 18666 | tilp-xdg | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 73 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 74 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 75 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 76 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 77 | 19044 | gbm | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 78 | 18523 | gearhead2 | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 79 | 18898 | gephi-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 80 | 18973 | lobe-chat | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 81 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 82 | 18398 | php83-mcrypt | 0 | 0 | 4 | Yes | TOOLING_FAILURE: |
| 83 | 18557 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 84 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 85 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 86 | 18362 | rtl88x2ce-dkms-git | 0 | 0 | 4 | Yes | DKMS_KERNEL_MODULE: |
| 87 | 18814 | urbanterror | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 88 | 18333 | ut2004-gog | 0 | 0 | 4 | Yes | NON_DISTRIBUTABLE: |
| 89 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 90 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 91 | 18901 | bililive-recorder | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 92 | 18151 | futu-ftnn-wine | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 93 | 18286 | hq | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 94 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 95 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 96 | 18592 | mailnaggertray-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 97 | 18381 | musique | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 98 | 18640 | nemo-engrampa | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 99 | 18617 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | Yes | TOOLING_FAILURE: |
| 100 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 101 | 18748 | pulumi-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 102 | 18463 | python-gradio-pdf | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 103 | 18474 | python-jaxlib-bin | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 104 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 105 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 106 | 18141 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | Yes | PROPRIETARY_DEP: |
| 107 | 18480 | unpack-install-jammer | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 108 | 18319 | unrealtournament4 | 0 | 0 | 5 | Yes | NON_DISTRIBUTABLE: |
| 109 | 18354 | xidlehook | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 110 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 111 | 14587 | asp | 0 | 0 | 6 | Yes | deptree-resolver-260417ac:ARCH_SPECIFIC: |
| 112 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 113 | 18691 | awk-language-server | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 114 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 115 | 18315 | fileoptimizer-bin | 0 | 0 | 6 | Yes | PLATFORM_UNSUPPORTED: |
| 116 | 18675 | gstreamermm-docs | 0 | 0 | 6 | Yes | SOURCE_UNAVAILABLE: |
| 117 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 118 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 119 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 120 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 121 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 122 | 18576 | swscreenshot-gui | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 123 | 18299 | vegastrike-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 124 | 18520 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | Yes | TOOLING_FAILURE: |
| 125 | 18672 | arti-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 126 | 18820 | dxvk-async-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 127 | 18320 | eddiscovery | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 128 | 18600 | fido2-hid-bridge | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 129 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 130 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 131 | 18667 | limine-snapper-sync-git | 0 | 0 | 7 | Yes | SOURCE_UNAVAILABLE: |
| 132 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 133 | 18911 | logstash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 134 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 135 | 18342 | mkinitcpio-clevis-hook | 0 | 0 | 7 | Yes | ARCH_SPECIFIC: |
| 136 | 18383 | obs-plugin-input-overlay-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 137 | 18281 | pikeru | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 138 | 18397 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 139 | 18438 | prs | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 140 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 141 | 18262 | wayprompt-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 142 | 18237 | wldash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 143 | 18637 | yt-x-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 144 | 18295 | anytxt-bin | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 145 | 18690 | coreutils-arch | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 146 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 147 | 18598 | go2tv | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 148 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 149 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 150 | 18367 | pianoteq-stage | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 151 | 18750 | pikaur-static | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 152 | 18749 | pikaur-static-git | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 153 | 18807 | rocketchat-desktop | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 154 | 18253 | vmd | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 155 | 18852 | webcord-vencord-git | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 156 | 18426 | xeme-hg | 0 | 0 | 8 | Yes | SOURCE_UNAVAILABLE: |
| 157 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 158 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 159 | 18360 | epub_to_audiobook-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 160 | 18612 | frame-eth | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 161 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 162 | 18688 | lib32-vkbasalt | 0 | 0 | 9 | Yes | TOOLING_FAILURE: |
| 163 | 18618 | madness-interactive-reloaded | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 164 | 18357 | mobirise | 0 | 0 | 9 | Yes | LICENSE_REVIEW_NEEDED: |
| 165 | 18792 | network-manager-applet-nolibappindicator | 0 | 0 | 9 | Yes | TOOLING_FAILURE: |
| 166 | 18368 | open-tv | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 167 | 18689 | pcem-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 168 | 18251 | prey | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 169 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | PROPRIETARY_DEP: |
| 170 | 18654 | shijima-qt | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 171 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 172 | 18605 | ausweiskopie | 0 | 0 | 10 | Yes | SOURCE_UNAVAILABLE: |
| 173 | 18416 | beignet-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 174 | 18840 | borgwarehouse | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 175 | 18404 | hnefatafl-copenhagen | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 176 | 18351 | libfive-studio-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 177 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 178 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 179 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 180 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 181 | 18498 | linux-sched-ext-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 182 | 18533 | linux-tip-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 183 | 18921 | mailspring | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 184 | 18484 | nvidia-390xx-settings | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 185 | 18518 | pantheon-polkit-agent-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 186 | 18273 | vanilla-wiiu-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 187 | 18668 | virtualbox-bin-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 188 | 18377 | cockatrice-server-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 189 | 18648 | fancy-cat | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 190 | 18347 | lto-dump-snapshot | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 191 | 18554 | luxtorpeda-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 192 | 18613 | principia-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 193 | 18804 | python-google-cloud-speech | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 194 | 18386 | synfigstudio-dev | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 195 | 18302 | vegastrike-engine-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 196 | 18652 | vgmstream-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 197 | 18378 | whatip-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 198 | 18696 | devtools-git | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 199 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 200 | 18405 | gst-plugins-rs-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 201 | 18447 | linux-xanmod-lts-headers | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 202 | 18388 | mingw-w64-libopenmpt | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 203 | 18632 | opendrop-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 204 | 18293 | betterx-desktop-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 205 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 206 | 18619 | glsmac-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 207 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 208 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 209 | 18336 | yacreader-poppler-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 210 | 18287 | goxlr-utility-ui | 0 | 0 | 14 | Yes | DEP_RESOLUTION_FAILED: |
| 211 | 18610 | lincity-ng-git | 0 | 0 | 14 | Yes | DEP_RESOLUTION_FAILED: |
| 212 | 18522 | linux-cachyos-hardened-headers | 0 | 0 | 14 | Yes | TOOLING_FAILURE: |
| 213 | 18514 | linux-next-git-headers | 0 | 0 | 14 | Yes | TOOLING_FAILURE: |
| 214 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 215 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 216 | 18485 | lightlyshaders-git | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 217 | 18547 | linux-covolunablu-gaming-headers | 0 | 0 | 15 | Yes | TOOLING_FAILURE: |
| 218 | 18530 | panda3ds | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 219 | 18303 | php-legacy-pdlib | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 220 | 18837 | qt6-xcb-private-headers-git | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 221 | 18580 | scans2any-git | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 222 | 18922 | veloren | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 223 | 1833 | vmware-workstation | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 224 | 18439 | lcd4linux-git | 0 | 0 | 16 | Yes | DEP_RESOLUTION_FAILED: |
| 225 | 18706 | gjs-nohammer | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED: |
| 226 | 18573 | gvfs-smb-git | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED: |
| 227 | 18255 | oclint | 0 | 0 | 17 | Yes | BUILD_FAILED: |
| 228 | 18241 | smoothpaper | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED: |
| 229 | 18254 | openxcom-git | 0 | 0 | 18 | Yes | DEP_RESOLUTION_FAILED: |
| 230 | 18959 | ultrastardx-git | 0 | 0 | 18 | Yes | DEP_RESOLUTION_FAILED: |
| 231 | 18497 | picom-ftlabs-git | 0 | 0 | 19 | Yes | DEP_RESOLUTION_FAILED: |
| 232 | 18701 | sddm-idle | 0 | 0 | 19 | Yes | TOOLING_FAILURE: |
| 233 | 18507 | linux-cachyos-bmq-headers | 0 | 0 | 20 | Yes | TOOLING_FAILURE: |
| 234 | 18636 | linux-cachyos-eevdf-headers | 0 | 0 | 20 | Yes | TOOLING_FAILURE: |
| 235 | 18647 | linux-cachyos-server-headers | 0 | 0 | 20 | Yes | TOOLING_FAILURE: |
| 236 | 18521 | paperde | 0 | 0 | 20 | Yes | DEP_RESOLUTION_FAILED: |
| 237 | 18343 | xivlauncher-rb | 0 | 0 | 20 | Yes | DEP_RESOLUTION_FAILED: |
| 238 | 18158 | codeblocks-svn | 0 | 0 | 22 | Yes | AUR_REPO_DELETED: |
| 239 | 17261 | firestorm-next-bin | 0 | 0 | 22 | Yes | MULTILIB_UNSUPPORTED: |
| 240 | 18168 | openconnect-sso-git | 0 | 0 | 23 | Yes | DEP_RESOLUTION_FAILED: |
| 241 | 18268 | ecal-samples | 0 | 0 | 24 | Yes | DEP_RESOLUTION_FAILED: |
| 242 | 18802 | modemmanager-dev | 0 | 0 | 24 | Yes | DEP_RESOLUTION_FAILED: |
| 243 | 18590 | nyarchassistant | 0 | 0 | 26 | Yes | DEP_RESOLUTION_FAILED: |
| 244 | 18650 | aosp-devel | 0 | 0 | 27 | Yes | TOOLING_FAILURE: |
| 245 | 17914 | deadbeef-git | 0 | 0 | 27 | Yes | COMPLEX_BUILD: |
| 246 | 18759 | java-openjfx-nowebkit | 0 | 0 | 27 | Yes | DEP_RESOLUTION_FAILED: |
| 247 | 23279 | quartus-free-quartus | 0 | 0 | 27 | Yes | PROPRIETARY_PLATFORM: |
| 248 | 18400 | nheko-scrollfix | 0 | 0 | 28 | Yes | DEP_RESOLUTION_FAILED: |
| 249 | 18326 | texpresso-git | 0 | 0 | 29 | Yes | DEP_RESOLUTION_FAILED: |
| 250 | 17424 | etlegacy32-mod | 0 | 0 | 30 | Yes | MULTILIB_UNSUPPORTED: |
| 251 | 18897 | ghostty-git-zen3 | 0 | 0 | 30 | Yes | DEP_RESOLUTION_FAILED: |
| 252 | 18949 | thunderbird-beta | 0 | 0 | 30 | Yes | DEP_RESOLUTION_FAILED: |
| 253 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD: |
| 254 | 18711 | mesa-minimal-git | 0 | 0 | 40 | Yes | DEP_RESOLUTION_FAILED: |
| 255 | 18375 | qgroundcontrol | 0 | 0 | 40 | Yes | DEP_RESOLUTION_FAILED: |
| 256 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 257 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 258 | 18192 | shadps4-git | 0 | 0 | 46 | Yes | AUR_REPO_DELETED: |
| 259 | 18683 | librum | 0 | 0 | 51 | Yes | DEP_RESOLUTION_FAILED: |
| 260 | 18200 | systemd-ukify-git | 0 | 0 | 53 | Yes | AUR_REPO_DELETED: |
| 261 | 18348 | waytrogen | 0 | 0 | 54 | Yes | DEP_RESOLUTION_FAILED: |
| 262 | 18197 | wine-osu-spectator-wow64 | 0 | 0 | 61 | Yes | BUILD_FAILED: |
| 263 | 18491 | teb-obs | 0 | 0 | 67 | Yes | DEP_RESOLUTION_FAILED: |
| 264 | 18157 | thunderbird-globalmenu | 0 | 0 | 73 | Yes | AUR_REPO_DELETED: |
| 265 | 17346 | ffmpeg-cuda-full | 0 | 0 | 89 | Yes | CUDA_DEPENDENCY: |
| 266 | 18189 | ffmpeg-full-git | 0 | 0 | 139 | Yes | AUR_REPO_DELETED: |
| 267 | 18801 | virtualbox-ext-oracle-dev | 1 | 0 | 1 | Yes | LICENSE_REVIEW_NEEDED: |
| 268 | 18594 | illogical-impulse-pymyc-aur | 1 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 269 | 18263 | wayfire-plugins-extra-git | 1 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 270 | 18538 | base-devel-selinux | 2 | 0 | 3 | Yes | TOOLING_FAILURE: |
