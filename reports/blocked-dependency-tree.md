# Blocked Dependency Tree Report

Generated: 2026-04-25T11:52:06.738198+00:00
Pass: deptree-resolver-260425f
Selected: 100

## Summary

- Total blocked: 272
- In AUR cache: 269
- Not in cache: 3
- Zero blocked deps: 268

## Blocking Reasons

- DEP_RESOLUTION_FAILED:: 121
- TOOLING_FAILURE:: 36
- SOURCE_UNAVAILABLE:: 17
- MINGW_CROSS_COMPILATION:: 10
- DISTRO_SPECIFIC:: 8
- LICENSE_REVIEW_NEEDED:: 7
- MULTILIB_UNSUPPORTED:: 7
- DKMS_KERNEL_MODULE:: 6
- NEEDS_RECIPE_DESIGN:: 5
- AUR_REPO_DELETED:: 5
- LEGACY_PYTHON2:: 4
- BUILD_FAILED:: 4
- COMPLEX_DEPS:: 4
- COMPLEX_BUILD:: 4
- GCC_SNAPSHOT_RUNTIME:: 4
- PROPRIETARY_BINARY:: 3
- NON_DISTRIBUTABLE:: 3
- KERNEL_SPECIFIC:: 3
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
| 2 | 18513 | sudo-selinux | 0 | 1 | 8 | Yes | TOOLING_FAILURE: |
| 3 | 18537 | base-selinux | 0 | 1 | 18 | Yes | TOOLING_FAILURE: |
| 4 | 18359 | wayfire-git | 0 | 1 | 33 | Yes | DEP_RESOLUTION_FAILED: |
| 5 | 18799 | virtualbox-svn | 0 | 1 | 53 | Yes | DEP_RESOLUTION_FAILED: |
| 6 | 18703 | neovim-lspconfig-opt-git | 0 | 0 | 0 | No | TOOLING_FAILURE: |
| 7 | 18449 | sipgate-app-clinq | 0 | 0 | 0 | No | NEEDS_RECIPE_DESIGN: |
| 8 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 9 | 18606 | aquacomputer_d5next-hwmon-dkms | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 10 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 11 | 18574 | edgeimpulse-cli | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 12 | 18355 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 13 | 18285 | librewolf-tridactyl-native-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 14 | 18423 | locale-mul_zz | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 15 | 18478 | luniistore | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 16 | 18371 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | Yes | DISTRO_SPECIFIC: |
| 17 | 18838 | playerctld-systemd-unit | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 18 | 18707 | repacman | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 19 | 18419 | simplicity-commander | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 20 | 18642 | amneziawg-dkms-git | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 21 | 18452 | amneziawg-linux | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 22 | 18382 | amneziawg-linux-hardened | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 23 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 24 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 25 | 18568 | archwiki-offline | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 26 | 18269 | aws-amplify-cli | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 27 | 18298 | aws-cdk | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 28 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 29 | 18291 | decrypto-pro-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 30 | 18958 | emmet-language-server | 0 | 0 | 2 | Yes | NEEDS_RECIPE_DESIGN: |
| 31 | 18859 | faustus-dkms-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 32 | 18930 | findbrokenpkgs | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 33 | 18957 | ideapad-laptop-tb-dkms | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 34 | 18895 | ideapad-laptop-tb2024g6plus-dkms | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
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
| 50 | 18720 | sbctl-initcpio-post-hook | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
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
| 77 | 18523 | gearhead2 | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 78 | 18898 | gephi-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 79 | 18973 | lobe-chat | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 80 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 81 | 18353 | nvidiactl-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 82 | 18398 | php83-mcrypt | 0 | 0 | 4 | Yes | TOOLING_FAILURE: |
| 83 | 18557 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 84 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 85 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 86 | 18362 | rtl88x2ce-dkms-git | 0 | 0 | 4 | Yes | DKMS_KERNEL_MODULE: |
| 87 | 18256 | truckersmp-cli | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 88 | 18814 | urbanterror | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 89 | 18333 | ut2004-gog | 0 | 0 | 4 | Yes | NON_DISTRIBUTABLE: |
| 90 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 91 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 92 | 18901 | bililive-recorder | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 93 | 18151 | futu-ftnn-wine | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 94 | 18286 | hq | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 95 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 96 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 97 | 18592 | mailnaggertray-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 98 | 18381 | musique | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 99 | 18640 | nemo-engrampa | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 100 | 18752 | ntpd-rs-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 101 | 18617 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | Yes | TOOLING_FAILURE: |
| 102 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 103 | 18748 | pulumi-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 104 | 18463 | python-gradio-pdf | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 105 | 18474 | python-jaxlib-bin | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 106 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 107 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 108 | 18141 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | Yes | PROPRIETARY_DEP: |
| 109 | 18480 | unpack-install-jammer | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 110 | 18319 | unrealtournament4 | 0 | 0 | 5 | Yes | NON_DISTRIBUTABLE: |
| 111 | 18354 | xidlehook | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 112 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 113 | 14587 | asp | 0 | 0 | 6 | Yes | deptree-resolver-260417ac:ARCH_SPECIFIC: |
| 114 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 115 | 18691 | awk-language-server | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 116 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 117 | 18315 | fileoptimizer-bin | 0 | 0 | 6 | Yes | PLATFORM_UNSUPPORTED: |
| 118 | 18675 | gstreamermm-docs | 0 | 0 | 6 | Yes | SOURCE_UNAVAILABLE: |
| 119 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 120 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 121 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 122 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 123 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 124 | 18576 | swscreenshot-gui | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 125 | 18299 | vegastrike-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 126 | 18520 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | Yes | TOOLING_FAILURE: |
| 127 | 18672 | arti-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 128 | 18820 | dxvk-async-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 129 | 18320 | eddiscovery | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 130 | 18600 | fido2-hid-bridge | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 131 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 132 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 133 | 18667 | limine-snapper-sync-git | 0 | 0 | 7 | Yes | SOURCE_UNAVAILABLE: |
| 134 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 135 | 18911 | logstash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 136 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 137 | 18342 | mkinitcpio-clevis-hook | 0 | 0 | 7 | Yes | ARCH_SPECIFIC: |
| 138 | 18383 | obs-plugin-input-overlay-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 139 | 18281 | pikeru | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 140 | 18397 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 141 | 18438 | prs | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 142 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 143 | 18262 | wayprompt-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 144 | 18237 | wldash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 145 | 18637 | yt-x-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 146 | 18295 | anytxt-bin | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 147 | 18690 | coreutils-arch | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 148 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 149 | 18598 | go2tv | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 150 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 151 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 152 | 18367 | pianoteq-stage | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 153 | 18750 | pikaur-static | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 154 | 18749 | pikaur-static-git | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 155 | 18807 | rocketchat-desktop | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 156 | 18253 | vmd | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 157 | 18852 | webcord-vencord-git | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 158 | 18426 | xeme-hg | 0 | 0 | 8 | Yes | SOURCE_UNAVAILABLE: |
| 159 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 160 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 161 | 18360 | epub_to_audiobook-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 162 | 18612 | frame-eth | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 163 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 164 | 18688 | lib32-vkbasalt | 0 | 0 | 9 | Yes | TOOLING_FAILURE: |
| 165 | 18618 | madness-interactive-reloaded | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 166 | 18357 | mobirise | 0 | 0 | 9 | Yes | LICENSE_REVIEW_NEEDED: |
| 167 | 18792 | network-manager-applet-nolibappindicator | 0 | 0 | 9 | Yes | TOOLING_FAILURE: |
| 168 | 18368 | open-tv | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 169 | 18689 | pcem-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 170 | 18251 | prey | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 171 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | PROPRIETARY_DEP: |
| 172 | 18654 | shijima-qt | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 173 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 174 | 18605 | ausweiskopie | 0 | 0 | 10 | Yes | SOURCE_UNAVAILABLE: |
| 175 | 18416 | beignet-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 176 | 18840 | borgwarehouse | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 177 | 18404 | hnefatafl-copenhagen | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 178 | 18351 | libfive-studio-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 179 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 180 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 181 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 182 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 183 | 18498 | linux-sched-ext-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 184 | 18533 | linux-tip-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 185 | 18921 | mailspring | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 186 | 18484 | nvidia-390xx-settings | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 187 | 18518 | pantheon-polkit-agent-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 188 | 18273 | vanilla-wiiu-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 189 | 18668 | virtualbox-bin-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 190 | 18377 | cockatrice-server-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 191 | 18648 | fancy-cat | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 192 | 18347 | lto-dump-snapshot | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 193 | 18554 | luxtorpeda-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 194 | 18613 | principia-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 195 | 18804 | python-google-cloud-speech | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 196 | 18386 | synfigstudio-dev | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 197 | 18302 | vegastrike-engine-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 198 | 18652 | vgmstream-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 199 | 18378 | whatip-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 200 | 18696 | devtools-git | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |

## Full Queue

| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR | Fail Reason |
|------|---|---------|-------------|-------------|-----------|--------|-------------|
| 1 | 18644 | gradience | 0 | 1 | 0 | No | DEP_RESOLUTION_FAILED: |
| 2 | 18513 | sudo-selinux | 0 | 1 | 8 | Yes | TOOLING_FAILURE: |
| 3 | 18537 | base-selinux | 0 | 1 | 18 | Yes | TOOLING_FAILURE: |
| 4 | 18359 | wayfire-git | 0 | 1 | 33 | Yes | DEP_RESOLUTION_FAILED: |
| 5 | 18799 | virtualbox-svn | 0 | 1 | 53 | Yes | DEP_RESOLUTION_FAILED: |
| 6 | 18703 | neovim-lspconfig-opt-git | 0 | 0 | 0 | No | TOOLING_FAILURE: |
| 7 | 18449 | sipgate-app-clinq | 0 | 0 | 0 | No | NEEDS_RECIPE_DESIGN: |
| 8 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 9 | 18606 | aquacomputer_d5next-hwmon-dkms | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 10 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 11 | 18574 | edgeimpulse-cli | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 12 | 18355 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 13 | 18285 | librewolf-tridactyl-native-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 14 | 18423 | locale-mul_zz | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 15 | 18478 | luniistore | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 16 | 18371 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | Yes | DISTRO_SPECIFIC: |
| 17 | 18838 | playerctld-systemd-unit | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 18 | 18707 | repacman | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 19 | 18419 | simplicity-commander | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 20 | 18642 | amneziawg-dkms-git | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 21 | 18452 | amneziawg-linux | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 22 | 18382 | amneziawg-linux-hardened | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 23 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 24 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 25 | 18568 | archwiki-offline | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 26 | 18269 | aws-amplify-cli | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 27 | 18298 | aws-cdk | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 28 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 29 | 18291 | decrypto-pro-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 30 | 18958 | emmet-language-server | 0 | 0 | 2 | Yes | NEEDS_RECIPE_DESIGN: |
| 31 | 18859 | faustus-dkms-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 32 | 18930 | findbrokenpkgs | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 33 | 18957 | ideapad-laptop-tb-dkms | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 34 | 18895 | ideapad-laptop-tb2024g6plus-dkms | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
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
| 50 | 18720 | sbctl-initcpio-post-hook | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
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
| 77 | 18523 | gearhead2 | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 78 | 18898 | gephi-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 79 | 18973 | lobe-chat | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 80 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 81 | 18353 | nvidiactl-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 82 | 18398 | php83-mcrypt | 0 | 0 | 4 | Yes | TOOLING_FAILURE: |
| 83 | 18557 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 84 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 85 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 86 | 18362 | rtl88x2ce-dkms-git | 0 | 0 | 4 | Yes | DKMS_KERNEL_MODULE: |
| 87 | 18256 | truckersmp-cli | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 88 | 18814 | urbanterror | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 89 | 18333 | ut2004-gog | 0 | 0 | 4 | Yes | NON_DISTRIBUTABLE: |
| 90 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 91 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 92 | 18901 | bililive-recorder | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 93 | 18151 | futu-ftnn-wine | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 94 | 18286 | hq | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 95 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 96 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 97 | 18592 | mailnaggertray-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 98 | 18381 | musique | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 99 | 18640 | nemo-engrampa | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 100 | 18752 | ntpd-rs-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 101 | 18617 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | Yes | TOOLING_FAILURE: |
| 102 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 103 | 18748 | pulumi-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 104 | 18463 | python-gradio-pdf | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 105 | 18474 | python-jaxlib-bin | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 106 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 107 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 108 | 18141 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | Yes | PROPRIETARY_DEP: |
| 109 | 18480 | unpack-install-jammer | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 110 | 18319 | unrealtournament4 | 0 | 0 | 5 | Yes | NON_DISTRIBUTABLE: |
| 111 | 18354 | xidlehook | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 112 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 113 | 14587 | asp | 0 | 0 | 6 | Yes | deptree-resolver-260417ac:ARCH_SPECIFIC: |
| 114 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 115 | 18691 | awk-language-server | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 116 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 117 | 18315 | fileoptimizer-bin | 0 | 0 | 6 | Yes | PLATFORM_UNSUPPORTED: |
| 118 | 18675 | gstreamermm-docs | 0 | 0 | 6 | Yes | SOURCE_UNAVAILABLE: |
| 119 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 120 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 121 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 122 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 123 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 124 | 18576 | swscreenshot-gui | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 125 | 18299 | vegastrike-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 126 | 18520 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | Yes | TOOLING_FAILURE: |
| 127 | 18672 | arti-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 128 | 18820 | dxvk-async-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 129 | 18320 | eddiscovery | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 130 | 18600 | fido2-hid-bridge | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 131 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 132 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 133 | 18667 | limine-snapper-sync-git | 0 | 0 | 7 | Yes | SOURCE_UNAVAILABLE: |
| 134 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 135 | 18911 | logstash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 136 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 137 | 18342 | mkinitcpio-clevis-hook | 0 | 0 | 7 | Yes | ARCH_SPECIFIC: |
| 138 | 18383 | obs-plugin-input-overlay-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 139 | 18281 | pikeru | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 140 | 18397 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 141 | 18438 | prs | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 142 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 143 | 18262 | wayprompt-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 144 | 18237 | wldash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 145 | 18637 | yt-x-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 146 | 18295 | anytxt-bin | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 147 | 18690 | coreutils-arch | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 148 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 149 | 18598 | go2tv | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 150 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 151 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 152 | 18367 | pianoteq-stage | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 153 | 18750 | pikaur-static | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 154 | 18749 | pikaur-static-git | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 155 | 18807 | rocketchat-desktop | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 156 | 18253 | vmd | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 157 | 18852 | webcord-vencord-git | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 158 | 18426 | xeme-hg | 0 | 0 | 8 | Yes | SOURCE_UNAVAILABLE: |
| 159 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 160 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 161 | 18360 | epub_to_audiobook-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 162 | 18612 | frame-eth | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 163 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 164 | 18688 | lib32-vkbasalt | 0 | 0 | 9 | Yes | TOOLING_FAILURE: |
| 165 | 18618 | madness-interactive-reloaded | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 166 | 18357 | mobirise | 0 | 0 | 9 | Yes | LICENSE_REVIEW_NEEDED: |
| 167 | 18792 | network-manager-applet-nolibappindicator | 0 | 0 | 9 | Yes | TOOLING_FAILURE: |
| 168 | 18368 | open-tv | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 169 | 18689 | pcem-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 170 | 18251 | prey | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 171 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | PROPRIETARY_DEP: |
| 172 | 18654 | shijima-qt | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 173 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 174 | 18605 | ausweiskopie | 0 | 0 | 10 | Yes | SOURCE_UNAVAILABLE: |
| 175 | 18416 | beignet-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 176 | 18840 | borgwarehouse | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 177 | 18404 | hnefatafl-copenhagen | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 178 | 18351 | libfive-studio-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 179 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 180 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 181 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 182 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 183 | 18498 | linux-sched-ext-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 184 | 18533 | linux-tip-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 185 | 18921 | mailspring | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 186 | 18484 | nvidia-390xx-settings | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 187 | 18518 | pantheon-polkit-agent-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 188 | 18273 | vanilla-wiiu-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 189 | 18668 | virtualbox-bin-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 190 | 18377 | cockatrice-server-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 191 | 18648 | fancy-cat | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 192 | 18347 | lto-dump-snapshot | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 193 | 18554 | luxtorpeda-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 194 | 18613 | principia-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 195 | 18804 | python-google-cloud-speech | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 196 | 18386 | synfigstudio-dev | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 197 | 18302 | vegastrike-engine-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 198 | 18652 | vgmstream-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 199 | 18378 | whatip-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 200 | 18696 | devtools-git | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 201 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 202 | 18405 | gst-plugins-rs-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 203 | 18447 | linux-xanmod-lts-headers | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 204 | 18388 | mingw-w64-libopenmpt | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 205 | 18632 | opendrop-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 206 | 18293 | betterx-desktop-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 207 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 208 | 18619 | glsmac-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 209 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 210 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 211 | 18336 | yacreader-poppler-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 212 | 18287 | goxlr-utility-ui | 0 | 0 | 14 | Yes | DEP_RESOLUTION_FAILED: |
| 213 | 18610 | lincity-ng-git | 0 | 0 | 14 | Yes | DEP_RESOLUTION_FAILED: |
| 214 | 18522 | linux-cachyos-hardened-headers | 0 | 0 | 14 | Yes | TOOLING_FAILURE: |
| 215 | 18514 | linux-next-git-headers | 0 | 0 | 14 | Yes | TOOLING_FAILURE: |
| 216 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 217 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 218 | 18485 | lightlyshaders-git | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 219 | 18547 | linux-covolunablu-gaming-headers | 0 | 0 | 15 | Yes | TOOLING_FAILURE: |
| 220 | 18530 | panda3ds | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 221 | 18303 | php-legacy-pdlib | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 222 | 18837 | qt6-xcb-private-headers-git | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 223 | 18580 | scans2any-git | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 224 | 18922 | veloren | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 225 | 1833 | vmware-workstation | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 226 | 18439 | lcd4linux-git | 0 | 0 | 16 | Yes | DEP_RESOLUTION_FAILED: |
| 227 | 18706 | gjs-nohammer | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED: |
| 228 | 18573 | gvfs-smb-git | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED: |
| 229 | 18255 | oclint | 0 | 0 | 17 | Yes | BUILD_FAILED: |
| 230 | 18241 | smoothpaper | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED: |
| 231 | 18254 | openxcom-git | 0 | 0 | 18 | Yes | DEP_RESOLUTION_FAILED: |
| 232 | 18959 | ultrastardx-git | 0 | 0 | 18 | Yes | DEP_RESOLUTION_FAILED: |
| 233 | 18497 | picom-ftlabs-git | 0 | 0 | 19 | Yes | DEP_RESOLUTION_FAILED: |
| 234 | 18701 | sddm-idle | 0 | 0 | 19 | Yes | TOOLING_FAILURE: |
| 235 | 18507 | linux-cachyos-bmq-headers | 0 | 0 | 20 | Yes | TOOLING_FAILURE: |
| 236 | 18636 | linux-cachyos-eevdf-headers | 0 | 0 | 20 | Yes | TOOLING_FAILURE: |
| 237 | 18647 | linux-cachyos-server-headers | 0 | 0 | 20 | Yes | TOOLING_FAILURE: |
| 238 | 18521 | paperde | 0 | 0 | 20 | Yes | DEP_RESOLUTION_FAILED: |
| 239 | 18343 | xivlauncher-rb | 0 | 0 | 20 | Yes | DEP_RESOLUTION_FAILED: |
| 240 | 18158 | codeblocks-svn | 0 | 0 | 22 | Yes | AUR_REPO_DELETED: |
| 241 | 17261 | firestorm-next-bin | 0 | 0 | 22 | Yes | MULTILIB_UNSUPPORTED: |
| 242 | 18168 | openconnect-sso-git | 0 | 0 | 23 | Yes | DEP_RESOLUTION_FAILED: |
| 243 | 18268 | ecal-samples | 0 | 0 | 24 | Yes | DEP_RESOLUTION_FAILED: |
| 244 | 18802 | modemmanager-dev | 0 | 0 | 24 | Yes | DEP_RESOLUTION_FAILED: |
| 245 | 18590 | nyarchassistant | 0 | 0 | 26 | Yes | DEP_RESOLUTION_FAILED: |
| 246 | 18650 | aosp-devel | 0 | 0 | 27 | Yes | TOOLING_FAILURE: |
| 247 | 17914 | deadbeef-git | 0 | 0 | 27 | Yes | COMPLEX_BUILD: |
| 248 | 18759 | java-openjfx-nowebkit | 0 | 0 | 27 | Yes | DEP_RESOLUTION_FAILED: |
| 249 | 23279 | quartus-free-quartus | 0 | 0 | 27 | Yes | PROPRIETARY_PLATFORM: |
| 250 | 18400 | nheko-scrollfix | 0 | 0 | 28 | Yes | DEP_RESOLUTION_FAILED: |
| 251 | 18326 | texpresso-git | 0 | 0 | 29 | Yes | DEP_RESOLUTION_FAILED: |
| 252 | 17424 | etlegacy32-mod | 0 | 0 | 30 | Yes | MULTILIB_UNSUPPORTED: |
| 253 | 18897 | ghostty-git-zen3 | 0 | 0 | 30 | Yes | DEP_RESOLUTION_FAILED: |
| 254 | 18949 | thunderbird-beta | 0 | 0 | 30 | Yes | DEP_RESOLUTION_FAILED: |
| 255 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD: |
| 256 | 18711 | mesa-minimal-git | 0 | 0 | 40 | Yes | DEP_RESOLUTION_FAILED: |
| 257 | 18375 | qgroundcontrol | 0 | 0 | 40 | Yes | DEP_RESOLUTION_FAILED: |
| 258 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 259 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 260 | 18192 | shadps4-git | 0 | 0 | 46 | Yes | AUR_REPO_DELETED: |
| 261 | 18683 | librum | 0 | 0 | 51 | Yes | DEP_RESOLUTION_FAILED: |
| 262 | 18200 | systemd-ukify-git | 0 | 0 | 53 | Yes | AUR_REPO_DELETED: |
| 263 | 18348 | waytrogen | 0 | 0 | 54 | Yes | DEP_RESOLUTION_FAILED: |
| 264 | 18197 | wine-osu-spectator-wow64 | 0 | 0 | 61 | Yes | BUILD_FAILED: |
| 265 | 18491 | teb-obs | 0 | 0 | 67 | Yes | DEP_RESOLUTION_FAILED: |
| 266 | 18157 | thunderbird-globalmenu | 0 | 0 | 73 | Yes | AUR_REPO_DELETED: |
| 267 | 17346 | ffmpeg-cuda-full | 0 | 0 | 89 | Yes | CUDA_DEPENDENCY: |
| 268 | 18189 | ffmpeg-full-git | 0 | 0 | 139 | Yes | AUR_REPO_DELETED: |
| 269 | 18801 | virtualbox-ext-oracle-dev | 1 | 0 | 1 | Yes | LICENSE_REVIEW_NEEDED: |
| 270 | 18594 | illogical-impulse-pymyc-aur | 1 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 271 | 18263 | wayfire-plugins-extra-git | 1 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 272 | 18538 | base-devel-selinux | 2 | 0 | 3 | Yes | TOOLING_FAILURE: |
