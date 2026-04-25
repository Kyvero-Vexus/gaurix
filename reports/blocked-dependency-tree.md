# Blocked Dependency Tree Report

Generated: 2026-04-25T06:58:14.052559+00:00
Pass: deptree-resolver-260425c
Selected: 100

## Summary

- Total blocked: 252
- In AUR cache: 249
- Not in cache: 3
- Zero blocked deps: 249

## Blocking Reasons

- DEP_RESOLUTION_FAILED:: 107
- TOOLING_FAILURE:: 28
- SOURCE_UNAVAILABLE:: 16
- MINGW_CROSS_COMPILATION:: 10
- DISTRO_SPECIFIC:: 8
- MULTILIB_UNSUPPORTED:: 7
- NEEDS_RECIPE_DESIGN:: 6
- DKMS_KERNEL_MODULE:: 6
- LICENSE_REVIEW_NEEDED:: 6
- AUR_REPO_DELETED:: 5
- LEGACY_PYTHON2:: 4
- BUILD_FAILED:: 4
- COMPLEX_DEPS:: 4
- COMPLEX_BUILD:: 4
- GCC_SNAPSHOT_RUNTIME:: 4
- PROPRIETARY_BINARY:: 3
- MISSING_DEP:: 3
- NON_DISTRIBUTABLE:: 3
- KERNEL_SPECIFIC:: 3
- PLATFORM_UNSUPPORTED:: 2
- BROWSER_EXTENSION:: 2
- ANDROID_SDK_PLATFORM:: 2
- KERNEL_MODULE:: 2
- PROPRIETARY_DEP:: 2
- BUILD_NETWORK_REQUIRED:: 1
- BUILD_REQUIRES_DOCKER:: 1
- ABANDONED_UPSTREAM:: 1
- CROSS_COMPILATION:: 1
- deptree-resolver-260417ac:ARCH_SPECIFIC:: 1
- ARCH_SPECIFIC:: 1
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
| 3 | 18468 | python-materialyoucolor-git | 0 | 1 | 9 | Yes | NEEDS_RECIPE_DESIGN: |
| 4 | 18537 | base-selinux | 0 | 1 | 18 | Yes | TOOLING_FAILURE: |
| 5 | 18359 | wayfire-git | 0 | 1 | 33 | Yes | DEP_RESOLUTION_FAILED: |
| 6 | 18703 | neovim-lspconfig-opt-git | 0 | 0 | 0 | No | TOOLING_FAILURE: |
| 7 | 18449 | sipgate-app-clinq | 0 | 0 | 0 | No | NEEDS_RECIPE_DESIGN: |
| 8 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 9 | 18606 | aquacomputer_d5next-hwmon-dkms | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 10 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 11 | 18574 | edgeimpulse-cli | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 12 | 18599 | gdx-liftoff | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 13 | 18355 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 14 | 18285 | librewolf-tridactyl-native-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 15 | 18423 | locale-mul_zz | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 16 | 18478 | luniistore | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 17 | 18371 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | Yes | DISTRO_SPECIFIC: |
| 18 | 18700 | server-box-bin | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
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
| 30 | 18461 | knossu | 0 | 0 | 2 | Yes | NEEDS_RECIPE_DESIGN: |
| 31 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 32 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 33 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 34 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 35 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 36 | 18330 | mingw-w64-soundtouch | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 37 | 18264 | nftables-geoip-db | 0 | 0 | 2 | Yes | BUILD_NETWORK_REQUIRED: |
| 38 | 18215 | nodejs-cspell | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 39 | 18417 | osmtogeojson | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 40 | 18399 | pfring-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 41 | 18556 | python-home-assistant-frontend | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 42 | 18487 | r8126-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 43 | 18413 | receitanet | 0 | 0 | 2 | Yes | SOURCE_UNAVAILABLE: |
| 44 | 18509 | rm-improved | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 45 | 18578 | shig-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 46 | 18453 | system-age | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 47 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 48 | 18695 | vscodium-marketplace | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 49 | 18346 | beammp-launcher-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 50 | 18639 | dagger-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 51 | 18408 | ddpolymerase | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 52 | 18620 | electrum-personal-server-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 53 | 18415 | firetools-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 54 | 18301 | hyperledger-fabric | 0 | 0 | 3 | Yes | BUILD_REQUIRES_DOCKER: |
| 55 | 18379 | java-language-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 56 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 57 | 18490 | linux-keep-modules | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 58 | 18401 | nfuspire-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 59 | 18380 | nginx-mainline-mod-njs | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 60 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | DKMS_KERNEL_MODULE: |
| 61 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 62 | 18430 | quartz-utils-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 63 | 18561 | rdt-client | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 64 | 18428 | ruby-ruby-vips | 0 | 0 | 3 | Yes | NEEDS_RECIPE_DESIGN: |
| 65 | 18638 | sbctl-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 66 | 18649 | snowflake-pt-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 67 | 18396 | sommelier-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 68 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 69 | 18666 | tilp-xdg | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 70 | 18392 | wl-binclock | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 71 | 18410 | atuin-lily-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 72 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 73 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 74 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | MISSING_DEP: |
| 75 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 76 | 18523 | gearhead2 | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 77 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 78 | 18353 | nvidiactl-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 79 | 18167 | openfortivpn-webview-electron | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 80 | 18398 | php83-mcrypt | 0 | 0 | 4 | Yes | TOOLING_FAILURE: |
| 81 | 18557 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 82 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 83 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 84 | 18362 | rtl88x2ce-dkms-git | 0 | 0 | 4 | Yes | DKMS_KERNEL_MODULE: |
| 85 | 18256 | truckersmp-cli | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 86 | 18333 | ut2004-gog | 0 | 0 | 4 | Yes | NON_DISTRIBUTABLE: |
| 87 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 88 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 89 | 18151 | futu-ftnn-wine | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 90 | 18286 | hq | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 91 | 18456 | hypraway | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 92 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 93 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 94 | 18687 | libcurl-gnutls-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 95 | 18592 | mailnaggertray-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 96 | 18381 | musique | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 97 | 18640 | nemo-engrampa | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 98 | 18617 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | Yes | TOOLING_FAILURE: |
| 99 | 18589 | openexr-viewer | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 100 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 101 | 18463 | python-gradio-pdf | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 102 | 18474 | python-jaxlib-bin | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 103 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 104 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 105 | 18131 | smtube | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 106 | 18141 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | Yes | PROPRIETARY_DEP: |
| 107 | 18480 | unpack-install-jammer | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 108 | 18319 | unrealtournament4 | 0 | 0 | 5 | Yes | NON_DISTRIBUTABLE: |
| 109 | 18354 | xidlehook | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 110 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 111 | 14587 | asp | 0 | 0 | 6 | Yes | deptree-resolver-260417ac:ARCH_SPECIFIC: |
| 112 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 113 | 18691 | awk-language-server | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 114 | 18604 | beet-summarize-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 115 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 116 | 18315 | fileoptimizer-bin | 0 | 0 | 6 | Yes | PLATFORM_UNSUPPORTED: |
| 117 | 18675 | gstreamermm-docs | 0 | 0 | 6 | Yes | SOURCE_UNAVAILABLE: |
| 118 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 119 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 120 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 121 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 122 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 123 | 18576 | swscreenshot-gui | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 124 | 18299 | vegastrike-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 125 | 18520 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | Yes | TOOLING_FAILURE: |
| 126 | 18672 | arti-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 127 | 18320 | eddiscovery | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 128 | 18600 | fido2-hid-bridge | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 129 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 130 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 131 | 18667 | limine-snapper-sync-git | 0 | 0 | 7 | Yes | SOURCE_UNAVAILABLE: |
| 132 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 133 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 134 | 18342 | mkinitcpio-clevis-hook | 0 | 0 | 7 | Yes | ARCH_SPECIFIC: |
| 135 | 18383 | obs-plugin-input-overlay-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 136 | 18502 | openpace-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
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
| 151 | 18253 | vmd | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 152 | 18426 | xeme-hg | 0 | 0 | 8 | Yes | SOURCE_UNAVAILABLE: |
| 153 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 154 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 155 | 18360 | epub_to_audiobook-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 156 | 18612 | frame-eth | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 157 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 158 | 18688 | lib32-vkbasalt | 0 | 0 | 9 | Yes | TOOLING_FAILURE: |
| 159 | 18618 | madness-interactive-reloaded | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 160 | 18357 | mobirise | 0 | 0 | 9 | Yes | LICENSE_REVIEW_NEEDED: |
| 161 | 18368 | open-tv | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 162 | 18689 | pcem-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 163 | 18251 | prey | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 164 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | PROPRIETARY_DEP: |
| 165 | 18654 | shijima-qt | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 166 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 167 | 18605 | ausweiskopie | 0 | 0 | 10 | Yes | SOURCE_UNAVAILABLE: |
| 168 | 18416 | beignet-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 169 | 18404 | hnefatafl-copenhagen | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 170 | 18351 | libfive-studio-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 171 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 172 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 173 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 174 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 175 | 18498 | linux-sched-ext-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 176 | 18533 | linux-tip-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 177 | 18484 | nvidia-390xx-settings | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 178 | 18518 | pantheon-polkit-agent-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 179 | 18273 | vanilla-wiiu-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 180 | 18668 | virtualbox-bin-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 181 | 18377 | cockatrice-server-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 182 | 18648 | fancy-cat | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 183 | 18347 | lto-dump-snapshot | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 184 | 18554 | luxtorpeda-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 185 | 18613 | principia-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 186 | 18386 | synfigstudio-dev | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 187 | 18302 | vegastrike-engine-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 188 | 18652 | vgmstream-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 189 | 18378 | whatip-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 190 | 18696 | devtools-git | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 191 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 192 | 18405 | gst-plugins-rs-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 193 | 18447 | linux-xanmod-lts-headers | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 194 | 18388 | mingw-w64-libopenmpt | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 195 | 18632 | opendrop-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 196 | 18293 | betterx-desktop-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 197 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 198 | 18619 | glsmac-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 199 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 200 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |

## Full Queue

| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR | Fail Reason |
|------|---|---------|-------------|-------------|-----------|--------|-------------|
| 1 | 18644 | gradience | 0 | 1 | 0 | No | DEP_RESOLUTION_FAILED: |
| 2 | 18513 | sudo-selinux | 0 | 1 | 8 | Yes | TOOLING_FAILURE: |
| 3 | 18468 | python-materialyoucolor-git | 0 | 1 | 9 | Yes | NEEDS_RECIPE_DESIGN: |
| 4 | 18537 | base-selinux | 0 | 1 | 18 | Yes | TOOLING_FAILURE: |
| 5 | 18359 | wayfire-git | 0 | 1 | 33 | Yes | DEP_RESOLUTION_FAILED: |
| 6 | 18703 | neovim-lspconfig-opt-git | 0 | 0 | 0 | No | TOOLING_FAILURE: |
| 7 | 18449 | sipgate-app-clinq | 0 | 0 | 0 | No | NEEDS_RECIPE_DESIGN: |
| 8 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 9 | 18606 | aquacomputer_d5next-hwmon-dkms | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 10 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 11 | 18574 | edgeimpulse-cli | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 12 | 18599 | gdx-liftoff | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 13 | 18355 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 14 | 18285 | librewolf-tridactyl-native-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 15 | 18423 | locale-mul_zz | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 16 | 18478 | luniistore | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 17 | 18371 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | Yes | DISTRO_SPECIFIC: |
| 18 | 18700 | server-box-bin | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
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
| 30 | 18461 | knossu | 0 | 0 | 2 | Yes | NEEDS_RECIPE_DESIGN: |
| 31 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 32 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 33 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 34 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 35 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 36 | 18330 | mingw-w64-soundtouch | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 37 | 18264 | nftables-geoip-db | 0 | 0 | 2 | Yes | BUILD_NETWORK_REQUIRED: |
| 38 | 18215 | nodejs-cspell | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 39 | 18417 | osmtogeojson | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 40 | 18399 | pfring-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 41 | 18556 | python-home-assistant-frontend | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 42 | 18487 | r8126-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 43 | 18413 | receitanet | 0 | 0 | 2 | Yes | SOURCE_UNAVAILABLE: |
| 44 | 18509 | rm-improved | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 45 | 18578 | shig-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 46 | 18453 | system-age | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 47 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 48 | 18695 | vscodium-marketplace | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 49 | 18346 | beammp-launcher-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 50 | 18639 | dagger-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 51 | 18408 | ddpolymerase | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 52 | 18620 | electrum-personal-server-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 53 | 18415 | firetools-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 54 | 18301 | hyperledger-fabric | 0 | 0 | 3 | Yes | BUILD_REQUIRES_DOCKER: |
| 55 | 18379 | java-language-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 56 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 57 | 18490 | linux-keep-modules | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 58 | 18401 | nfuspire-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 59 | 18380 | nginx-mainline-mod-njs | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 60 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | DKMS_KERNEL_MODULE: |
| 61 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 62 | 18430 | quartz-utils-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 63 | 18561 | rdt-client | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 64 | 18428 | ruby-ruby-vips | 0 | 0 | 3 | Yes | NEEDS_RECIPE_DESIGN: |
| 65 | 18638 | sbctl-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 66 | 18649 | snowflake-pt-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 67 | 18396 | sommelier-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 68 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 69 | 18666 | tilp-xdg | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 70 | 18392 | wl-binclock | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 71 | 18410 | atuin-lily-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 72 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 73 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 74 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | MISSING_DEP: |
| 75 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 76 | 18523 | gearhead2 | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 77 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 78 | 18353 | nvidiactl-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 79 | 18167 | openfortivpn-webview-electron | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 80 | 18398 | php83-mcrypt | 0 | 0 | 4 | Yes | TOOLING_FAILURE: |
| 81 | 18557 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 82 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 83 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 84 | 18362 | rtl88x2ce-dkms-git | 0 | 0 | 4 | Yes | DKMS_KERNEL_MODULE: |
| 85 | 18256 | truckersmp-cli | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 86 | 18333 | ut2004-gog | 0 | 0 | 4 | Yes | NON_DISTRIBUTABLE: |
| 87 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 88 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 89 | 18151 | futu-ftnn-wine | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 90 | 18286 | hq | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 91 | 18456 | hypraway | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 92 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 93 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 94 | 18687 | libcurl-gnutls-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 95 | 18592 | mailnaggertray-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 96 | 18381 | musique | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 97 | 18640 | nemo-engrampa | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 98 | 18617 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | Yes | TOOLING_FAILURE: |
| 99 | 18589 | openexr-viewer | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 100 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 101 | 18463 | python-gradio-pdf | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 102 | 18474 | python-jaxlib-bin | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 103 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 104 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 105 | 18131 | smtube | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 106 | 18141 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | Yes | PROPRIETARY_DEP: |
| 107 | 18480 | unpack-install-jammer | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 108 | 18319 | unrealtournament4 | 0 | 0 | 5 | Yes | NON_DISTRIBUTABLE: |
| 109 | 18354 | xidlehook | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 110 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 111 | 14587 | asp | 0 | 0 | 6 | Yes | deptree-resolver-260417ac:ARCH_SPECIFIC: |
| 112 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 113 | 18691 | awk-language-server | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 114 | 18604 | beet-summarize-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 115 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 116 | 18315 | fileoptimizer-bin | 0 | 0 | 6 | Yes | PLATFORM_UNSUPPORTED: |
| 117 | 18675 | gstreamermm-docs | 0 | 0 | 6 | Yes | SOURCE_UNAVAILABLE: |
| 118 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 119 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 120 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 121 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 122 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 123 | 18576 | swscreenshot-gui | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 124 | 18299 | vegastrike-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 125 | 18520 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | Yes | TOOLING_FAILURE: |
| 126 | 18672 | arti-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 127 | 18320 | eddiscovery | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 128 | 18600 | fido2-hid-bridge | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 129 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 130 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 131 | 18667 | limine-snapper-sync-git | 0 | 0 | 7 | Yes | SOURCE_UNAVAILABLE: |
| 132 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 133 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 134 | 18342 | mkinitcpio-clevis-hook | 0 | 0 | 7 | Yes | ARCH_SPECIFIC: |
| 135 | 18383 | obs-plugin-input-overlay-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 136 | 18502 | openpace-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
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
| 151 | 18253 | vmd | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 152 | 18426 | xeme-hg | 0 | 0 | 8 | Yes | SOURCE_UNAVAILABLE: |
| 153 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 154 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 155 | 18360 | epub_to_audiobook-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 156 | 18612 | frame-eth | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 157 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 158 | 18688 | lib32-vkbasalt | 0 | 0 | 9 | Yes | TOOLING_FAILURE: |
| 159 | 18618 | madness-interactive-reloaded | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 160 | 18357 | mobirise | 0 | 0 | 9 | Yes | LICENSE_REVIEW_NEEDED: |
| 161 | 18368 | open-tv | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 162 | 18689 | pcem-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 163 | 18251 | prey | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 164 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | PROPRIETARY_DEP: |
| 165 | 18654 | shijima-qt | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 166 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 167 | 18605 | ausweiskopie | 0 | 0 | 10 | Yes | SOURCE_UNAVAILABLE: |
| 168 | 18416 | beignet-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 169 | 18404 | hnefatafl-copenhagen | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 170 | 18351 | libfive-studio-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 171 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 172 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 173 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 174 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 175 | 18498 | linux-sched-ext-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 176 | 18533 | linux-tip-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 177 | 18484 | nvidia-390xx-settings | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 178 | 18518 | pantheon-polkit-agent-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 179 | 18273 | vanilla-wiiu-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 180 | 18668 | virtualbox-bin-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 181 | 18377 | cockatrice-server-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 182 | 18648 | fancy-cat | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 183 | 18347 | lto-dump-snapshot | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 184 | 18554 | luxtorpeda-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 185 | 18613 | principia-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 186 | 18386 | synfigstudio-dev | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 187 | 18302 | vegastrike-engine-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 188 | 18652 | vgmstream-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 189 | 18378 | whatip-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 190 | 18696 | devtools-git | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 191 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 192 | 18405 | gst-plugins-rs-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 193 | 18447 | linux-xanmod-lts-headers | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 194 | 18388 | mingw-w64-libopenmpt | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 195 | 18632 | opendrop-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 196 | 18293 | betterx-desktop-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 197 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 198 | 18619 | glsmac-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 199 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 200 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 201 | 18336 | yacreader-poppler-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 202 | 18287 | goxlr-utility-ui | 0 | 0 | 14 | Yes | DEP_RESOLUTION_FAILED: |
| 203 | 18610 | lincity-ng-git | 0 | 0 | 14 | Yes | DEP_RESOLUTION_FAILED: |
| 204 | 18522 | linux-cachyos-hardened-headers | 0 | 0 | 14 | Yes | TOOLING_FAILURE: |
| 205 | 18514 | linux-next-git-headers | 0 | 0 | 14 | Yes | TOOLING_FAILURE: |
| 206 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 207 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 208 | 18485 | lightlyshaders-git | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 209 | 18547 | linux-covolunablu-gaming-headers | 0 | 0 | 15 | Yes | TOOLING_FAILURE: |
| 210 | 18530 | panda3ds | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 211 | 18303 | php-legacy-pdlib | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 212 | 18580 | scans2any-git | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 213 | 1833 | vmware-workstation | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 214 | 18439 | lcd4linux-git | 0 | 0 | 16 | Yes | DEP_RESOLUTION_FAILED: |
| 215 | 18573 | gvfs-smb-git | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED: |
| 216 | 18255 | oclint | 0 | 0 | 17 | Yes | BUILD_FAILED: |
| 217 | 18241 | smoothpaper | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED: |
| 218 | 18254 | openxcom-git | 0 | 0 | 18 | Yes | DEP_RESOLUTION_FAILED: |
| 219 | 18497 | picom-ftlabs-git | 0 | 0 | 19 | Yes | DEP_RESOLUTION_FAILED: |
| 220 | 18701 | sddm-idle | 0 | 0 | 19 | Yes | TOOLING_FAILURE: |
| 221 | 18507 | linux-cachyos-bmq-headers | 0 | 0 | 20 | Yes | TOOLING_FAILURE: |
| 222 | 18636 | linux-cachyos-eevdf-headers | 0 | 0 | 20 | Yes | TOOLING_FAILURE: |
| 223 | 18647 | linux-cachyos-server-headers | 0 | 0 | 20 | Yes | TOOLING_FAILURE: |
| 224 | 18521 | paperde | 0 | 0 | 20 | Yes | DEP_RESOLUTION_FAILED: |
| 225 | 18343 | xivlauncher-rb | 0 | 0 | 20 | Yes | DEP_RESOLUTION_FAILED: |
| 226 | 18158 | codeblocks-svn | 0 | 0 | 22 | Yes | AUR_REPO_DELETED: |
| 227 | 17261 | firestorm-next-bin | 0 | 0 | 22 | Yes | MULTILIB_UNSUPPORTED: |
| 228 | 18168 | openconnect-sso-git | 0 | 0 | 23 | Yes | DEP_RESOLUTION_FAILED: |
| 229 | 18268 | ecal-samples | 0 | 0 | 24 | Yes | DEP_RESOLUTION_FAILED: |
| 230 | 18590 | nyarchassistant | 0 | 0 | 26 | Yes | DEP_RESOLUTION_FAILED: |
| 231 | 18650 | aosp-devel | 0 | 0 | 27 | Yes | TOOLING_FAILURE: |
| 232 | 17914 | deadbeef-git | 0 | 0 | 27 | Yes | COMPLEX_BUILD: |
| 233 | 23279 | quartus-free-quartus | 0 | 0 | 27 | Yes | PROPRIETARY_PLATFORM: |
| 234 | 18400 | nheko-scrollfix | 0 | 0 | 28 | Yes | DEP_RESOLUTION_FAILED: |
| 235 | 18326 | texpresso-git | 0 | 0 | 29 | Yes | DEP_RESOLUTION_FAILED: |
| 236 | 17424 | etlegacy32-mod | 0 | 0 | 30 | Yes | MULTILIB_UNSUPPORTED: |
| 237 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD: |
| 238 | 18375 | qgroundcontrol | 0 | 0 | 40 | Yes | DEP_RESOLUTION_FAILED: |
| 239 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 240 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 241 | 18192 | shadps4-git | 0 | 0 | 46 | Yes | AUR_REPO_DELETED: |
| 242 | 18683 | librum | 0 | 0 | 51 | Yes | DEP_RESOLUTION_FAILED: |
| 243 | 18200 | systemd-ukify-git | 0 | 0 | 53 | Yes | AUR_REPO_DELETED: |
| 244 | 18348 | waytrogen | 0 | 0 | 54 | Yes | DEP_RESOLUTION_FAILED: |
| 245 | 18197 | wine-osu-spectator-wow64 | 0 | 0 | 61 | Yes | BUILD_FAILED: |
| 246 | 18491 | teb-obs | 0 | 0 | 67 | Yes | DEP_RESOLUTION_FAILED: |
| 247 | 18157 | thunderbird-globalmenu | 0 | 0 | 73 | Yes | AUR_REPO_DELETED: |
| 248 | 17346 | ffmpeg-cuda-full | 0 | 0 | 89 | Yes | CUDA_DEPENDENCY: |
| 249 | 18189 | ffmpeg-full-git | 0 | 0 | 139 | Yes | AUR_REPO_DELETED: |
| 250 | 18263 | wayfire-plugins-extra-git | 1 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 251 | 18538 | base-devel-selinux | 2 | 0 | 3 | Yes | TOOLING_FAILURE: |
| 252 | 18594 | illogical-impulse-pymyc-aur | 2 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
