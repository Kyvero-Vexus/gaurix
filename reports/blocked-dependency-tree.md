# Blocked Dependency Tree Report

Generated: 2026-04-25T15:43:51.685201+00:00
Pass: deptree-resolver-260425h
Selected: 100

## Summary

- Total blocked: 266
- In AUR cache: 263
- Not in cache: 3
- Zero blocked deps: 262

## Blocking Reasons

- DEP_RESOLUTION_FAILED: 115
- TOOLING_FAILURE: 26
- SOURCE_UNAVAILABLE: 17
- DISTRO_SPECIFIC: 13
- DKMS_KERNEL_MODULE: 11
- MINGW_CROSS_COMPILATION: 9
- LICENSE_REVIEW_NEEDED: 7
- MULTILIB_UNSUPPORTED: 7
- AUR_REPO_DELETED: 5
- NEEDS_RECIPE_DESIGN: 4
- BUILD_FAILED: 4
- COMPLEX_DEPS: 4
- COMPLEX_BUILD: 4
- GCC_SNAPSHOT_RUNTIME: 4
- PROPRIETARY_BINARY: 3
- NON_DISTRIBUTABLE: 3
- KERNEL_SPECIFIC: 3
- LEGACY_PYTHON2: 3
- SELINUX_SPECIFIC: 2
- PLATFORM_UNSUPPORTED: 2
- BROWSER_EXTENSION: 2
- ANDROID_SDK_PLATFORM: 2
- KERNEL_MODULE: 2
- DONE: 2
- PROPRIETARY_DEP: 2
- ARCH_SPECIFIC: 2
- BUILD_NETWORK_REQUIRED: 1
- ABANDONED_UPSTREAM: 1
- CROSS_COMPILATION: 1
- MISSING_DEP: 1
- NEEDS_INVESTIGATION: 1
- ROCM_DEPENDENCY: 1
- PROPRIETARY_PLATFORM: 1
- CUDA_DEPENDENCY: 1

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
| 14 | 18478 | luniistore | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 15 | 18371 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | Yes | DISTRO_SPECIFIC: |
| 16 | 18707 | repacman | 0 | 0 | 1 | Yes | DISTRO_SPECIFIC: |
| 17 | 18419 | simplicity-commander | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 18 | 18642 | amneziawg-dkms-git | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 19 | 18452 | amneziawg-linux | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 20 | 18382 | amneziawg-linux-hardened | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 21 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 22 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 23 | 18568 | archwiki-offline | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 24 | 18269 | aws-amplify-cli | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 25 | 18298 | aws-cdk | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 26 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 27 | 18291 | decrypto-pro-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 28 | 18958 | emmet-language-server | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 29 | 18859 | faustus-dkms-git | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 30 | 18930 | findbrokenpkgs | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 31 | 18957 | ideapad-laptop-tb-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 32 | 18895 | ideapad-laptop-tb2024g6plus-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 33 | 18461 | knossu | 0 | 0 | 2 | Yes | NEEDS_RECIPE_DESIGN: |
| 34 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 35 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 36 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 37 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 38 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 39 | 18330 | mingw-w64-soundtouch | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 40 | 18264 | nftables-geoip-db | 0 | 0 | 2 | Yes | BUILD_NETWORK_REQUIRED: |
| 41 | 18215 | nodejs-cspell | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 42 | 18417 | osmtogeojson | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 43 | 18399 | pfring-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 44 | 18556 | python-home-assistant-frontend | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 45 | 18831 | qt5-mqtt | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 46 | 18487 | r8126-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 47 | 18413 | receitanet | 0 | 0 | 2 | Yes | SOURCE_UNAVAILABLE: |
| 48 | 18720 | sbctl-initcpio-post-hook | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 49 | 18453 | system-age | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 50 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 51 | 18695 | vscodium-marketplace | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 52 | 18777 | wyc | 0 | 0 | 2 | Yes | SOURCE_UNAVAILABLE: |
| 53 | 18346 | beammp-launcher-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 54 | 18379 | java-language-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 55 | 18758 | libarchive-static | 0 | 0 | 3 | Yes | TOOLING_FAILURE: |
| 56 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 57 | 18490 | linux-keep-modules | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 58 | 18401 | nfuspire-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 59 | 18380 | nginx-mainline-mod-njs | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 60 | 18753 | nodejs-nestjs-cli | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 61 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | DKMS_KERNEL_MODULE: |
| 62 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 63 | 18938 | phonon-qt4-vlc | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 64 | 18430 | quartz-utils-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 65 | 18561 | rdt-client | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 66 | 18638 | sbctl-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 67 | 18649 | snowflake-pt-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 68 | 18396 | sommelier-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 69 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 70 | 18666 | tilp-xdg | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 71 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 72 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 73 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 74 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 75 | 19044 | gbm | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 76 | 18898 | gephi-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 77 | 18973 | lobe-chat | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 78 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | DONE: |
| 79 | 18398 | php83-mcrypt | 0 | 0 | 4 | Yes | TOOLING_FAILURE: |
| 80 | 18557 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 81 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | DONE: |
| 82 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 83 | 18362 | rtl88x2ce-dkms-git | 0 | 0 | 4 | Yes | DKMS_KERNEL_MODULE: |
| 84 | 18814 | urbanterror | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 85 | 18333 | ut2004-gog | 0 | 0 | 4 | Yes | NON_DISTRIBUTABLE: |
| 86 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 87 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 88 | 18901 | bililive-recorder | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 89 | 18151 | futu-ftnn-wine | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 90 | 18286 | hq | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 91 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 92 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 93 | 18592 | mailnaggertray-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 94 | 18381 | musique | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 95 | 18617 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | Yes | TOOLING_FAILURE: |
| 96 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 97 | 18748 | pulumi-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 98 | 18463 | python-gradio-pdf | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 99 | 18474 | python-jaxlib-bin | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 100 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 101 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 102 | 18141 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | Yes | PROPRIETARY_DEP: |
| 103 | 18480 | unpack-install-jammer | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 104 | 18319 | unrealtournament4 | 0 | 0 | 5 | Yes | NON_DISTRIBUTABLE: |
| 105 | 18354 | xidlehook | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 106 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 107 | 14587 | asp | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 108 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 109 | 18691 | awk-language-server | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 110 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 111 | 18315 | fileoptimizer-bin | 0 | 0 | 6 | Yes | PLATFORM_UNSUPPORTED: |
| 112 | 18675 | gstreamermm-docs | 0 | 0 | 6 | Yes | SOURCE_UNAVAILABLE: |
| 113 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 114 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 115 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 116 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 117 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 118 | 18576 | swscreenshot-gui | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 119 | 18299 | vegastrike-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 120 | 18520 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | Yes | TOOLING_FAILURE: |
| 121 | 18672 | arti-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 122 | 18820 | dxvk-async-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 123 | 18320 | eddiscovery | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 124 | 18600 | fido2-hid-bridge | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 125 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 126 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 127 | 18667 | limine-snapper-sync-git | 0 | 0 | 7 | Yes | SOURCE_UNAVAILABLE: |
| 128 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 129 | 18911 | logstash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 130 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 131 | 18342 | mkinitcpio-clevis-hook | 0 | 0 | 7 | Yes | ARCH_SPECIFIC: |
| 132 | 18383 | obs-plugin-input-overlay-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 133 | 18281 | pikeru | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 134 | 18397 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 135 | 18438 | prs | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 136 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 137 | 18262 | wayprompt-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 138 | 18237 | wldash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 139 | 18637 | yt-x-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 140 | 18295 | anytxt-bin | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 141 | 18690 | coreutils-arch | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 142 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 143 | 18598 | go2tv | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 144 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 145 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 146 | 18367 | pianoteq-stage | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 147 | 18750 | pikaur-static | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 148 | 18749 | pikaur-static-git | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 149 | 18807 | rocketchat-desktop | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 150 | 18253 | vmd | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 151 | 18852 | webcord-vencord-git | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 152 | 18426 | xeme-hg | 0 | 0 | 8 | Yes | SOURCE_UNAVAILABLE: |
| 153 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 154 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 155 | 18360 | epub_to_audiobook-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 156 | 18612 | frame-eth | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 157 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 158 | 18688 | lib32-vkbasalt | 0 | 0 | 9 | Yes | TOOLING_FAILURE: |
| 159 | 18618 | madness-interactive-reloaded | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 160 | 18357 | mobirise | 0 | 0 | 9 | Yes | LICENSE_REVIEW_NEEDED: |
| 161 | 18792 | network-manager-applet-nolibappindicator | 0 | 0 | 9 | Yes | TOOLING_FAILURE: |
| 162 | 18368 | open-tv | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 163 | 18689 | pcem-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 164 | 18251 | prey | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 165 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | PROPRIETARY_DEP: |
| 166 | 18654 | shijima-qt | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 167 | 2160 | auracle-git | 0 | 0 | 10 | Yes | ARCH_SPECIFIC: |
| 168 | 18605 | ausweiskopie | 0 | 0 | 10 | Yes | SOURCE_UNAVAILABLE: |
| 169 | 18416 | beignet-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 170 | 18840 | borgwarehouse | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 171 | 18404 | hnefatafl-copenhagen | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 172 | 18351 | libfive-studio-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 173 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 174 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 175 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 176 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 177 | 18498 | linux-sched-ext-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 178 | 18533 | linux-tip-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 179 | 18921 | mailspring | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 180 | 18484 | nvidia-390xx-settings | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 181 | 18518 | pantheon-polkit-agent-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 182 | 18273 | vanilla-wiiu-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 183 | 18668 | virtualbox-bin-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 184 | 18377 | cockatrice-server-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 185 | 18648 | fancy-cat | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 186 | 18347 | lto-dump-snapshot | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 187 | 18554 | luxtorpeda-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 188 | 18613 | principia-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 189 | 18804 | python-google-cloud-speech | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 190 | 18386 | synfigstudio-dev | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 191 | 18302 | vegastrike-engine-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 192 | 18652 | vgmstream-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 193 | 18378 | whatip-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 194 | 18696 | devtools-git | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 195 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 196 | 18405 | gst-plugins-rs-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 197 | 18447 | linux-xanmod-lts-headers | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 198 | 18388 | mingw-w64-libopenmpt | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 199 | 18632 | opendrop-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 200 | 18293 | betterx-desktop-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
