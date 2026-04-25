# Blocked Dependency Tree Report

Generated: 2026-04-25T08:30:20.260141+00:00
Pass: deptree-resolver-260425d
Selected: 100

## Summary

- Total blocked: 244
- In AUR cache: 241
- Not in cache: 3
- Zero blocked deps: 241

## Blocking Reasons

- DEP_RESOLUTION_FAILED:: 103
- TOOLING_FAILURE:: 28
- SOURCE_UNAVAILABLE:: 16
- MINGW_CROSS_COMPILATION:: 10
- DISTRO_SPECIFIC:: 8
- MULTILIB_UNSUPPORTED:: 7
- DKMS_KERNEL_MODULE:: 6
- LICENSE_REVIEW_NEEDED:: 6
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
| 5 | 18703 | neovim-lspconfig-opt-git | 0 | 0 | 0 | No | TOOLING_FAILURE: |
| 6 | 18449 | sipgate-app-clinq | 0 | 0 | 0 | No | NEEDS_RECIPE_DESIGN: |
| 7 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 8 | 18606 | aquacomputer_d5next-hwmon-dkms | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 9 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 10 | 18574 | edgeimpulse-cli | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 11 | 18599 | gdx-liftoff | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 12 | 18355 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 13 | 18285 | librewolf-tridactyl-native-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 14 | 18423 | locale-mul_zz | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 15 | 18478 | luniistore | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 16 | 18371 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | Yes | DISTRO_SPECIFIC: |
| 17 | 18700 | server-box-bin | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 18 | 18419 | simplicity-commander | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 19 | 18642 | amneziawg-dkms-git | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 20 | 18452 | amneziawg-linux | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 21 | 18382 | amneziawg-linux-hardened | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 22 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 23 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 24 | 18568 | archwiki-offline | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 25 | 18269 | aws-amplify-cli | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 26 | 18298 | aws-cdk | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 27 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 28 | 18291 | decrypto-pro-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 29 | 18461 | knossu | 0 | 0 | 2 | Yes | NEEDS_RECIPE_DESIGN: |
| 30 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 31 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 32 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 33 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 34 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 35 | 18330 | mingw-w64-soundtouch | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 36 | 18264 | nftables-geoip-db | 0 | 0 | 2 | Yes | BUILD_NETWORK_REQUIRED: |
| 37 | 18215 | nodejs-cspell | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 38 | 18417 | osmtogeojson | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 39 | 18399 | pfring-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 40 | 18556 | python-home-assistant-frontend | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 41 | 18487 | r8126-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 42 | 18413 | receitanet | 0 | 0 | 2 | Yes | SOURCE_UNAVAILABLE: |
| 43 | 18509 | rm-improved | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 44 | 18578 | shig-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 45 | 18453 | system-age | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 46 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 47 | 18695 | vscodium-marketplace | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 48 | 18346 | beammp-launcher-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 49 | 18639 | dagger-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 50 | 18620 | electrum-personal-server-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 51 | 18301 | hyperledger-fabric | 0 | 0 | 3 | Yes | BUILD_REQUIRES_DOCKER: |
| 52 | 18379 | java-language-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 53 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 54 | 18490 | linux-keep-modules | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 55 | 18401 | nfuspire-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 56 | 18380 | nginx-mainline-mod-njs | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 57 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | DKMS_KERNEL_MODULE: |
| 58 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 59 | 18430 | quartz-utils-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 60 | 18561 | rdt-client | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 61 | 18638 | sbctl-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 62 | 18649 | snowflake-pt-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 63 | 18396 | sommelier-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 64 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 65 | 18666 | tilp-xdg | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 66 | 18410 | atuin-lily-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 67 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 68 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 69 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 70 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 71 | 18523 | gearhead2 | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 72 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 73 | 18353 | nvidiactl-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 74 | 18167 | openfortivpn-webview-electron | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 75 | 18398 | php83-mcrypt | 0 | 0 | 4 | Yes | TOOLING_FAILURE: |
| 76 | 18557 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 77 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 78 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 79 | 18362 | rtl88x2ce-dkms-git | 0 | 0 | 4 | Yes | DKMS_KERNEL_MODULE: |
| 80 | 18256 | truckersmp-cli | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 81 | 18333 | ut2004-gog | 0 | 0 | 4 | Yes | NON_DISTRIBUTABLE: |
| 82 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 83 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 84 | 18151 | futu-ftnn-wine | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 85 | 18286 | hq | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 86 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 87 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 88 | 18592 | mailnaggertray-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 89 | 18381 | musique | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 90 | 18640 | nemo-engrampa | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 91 | 18617 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | Yes | TOOLING_FAILURE: |
| 92 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 93 | 18463 | python-gradio-pdf | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 94 | 18474 | python-jaxlib-bin | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 95 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 96 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 97 | 18131 | smtube | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 98 | 18141 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | Yes | PROPRIETARY_DEP: |
| 99 | 18480 | unpack-install-jammer | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 100 | 18319 | unrealtournament4 | 0 | 0 | 5 | Yes | NON_DISTRIBUTABLE: |
| 101 | 18354 | xidlehook | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 102 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 103 | 14587 | asp | 0 | 0 | 6 | Yes | deptree-resolver-260417ac:ARCH_SPECIFIC: |
| 104 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 105 | 18691 | awk-language-server | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 106 | 18604 | beet-summarize-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 107 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 108 | 18315 | fileoptimizer-bin | 0 | 0 | 6 | Yes | PLATFORM_UNSUPPORTED: |
| 109 | 18675 | gstreamermm-docs | 0 | 0 | 6 | Yes | SOURCE_UNAVAILABLE: |
| 110 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 111 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 112 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 113 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 114 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 115 | 18576 | swscreenshot-gui | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 116 | 18299 | vegastrike-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 117 | 18520 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | Yes | TOOLING_FAILURE: |
| 118 | 18672 | arti-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 119 | 18320 | eddiscovery | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 120 | 18600 | fido2-hid-bridge | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 121 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 122 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 123 | 18667 | limine-snapper-sync-git | 0 | 0 | 7 | Yes | SOURCE_UNAVAILABLE: |
| 124 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 125 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 126 | 18342 | mkinitcpio-clevis-hook | 0 | 0 | 7 | Yes | ARCH_SPECIFIC: |
| 127 | 18383 | obs-plugin-input-overlay-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 128 | 18502 | openpace-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 129 | 18281 | pikeru | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 130 | 18397 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 131 | 18438 | prs | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 132 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 133 | 18262 | wayprompt-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 134 | 18237 | wldash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 135 | 18637 | yt-x-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 136 | 18295 | anytxt-bin | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 137 | 18690 | coreutils-arch | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 138 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 139 | 18598 | go2tv | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 140 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 141 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 142 | 18367 | pianoteq-stage | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 143 | 18253 | vmd | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 144 | 18426 | xeme-hg | 0 | 0 | 8 | Yes | SOURCE_UNAVAILABLE: |
| 145 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 146 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 147 | 18360 | epub_to_audiobook-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 148 | 18612 | frame-eth | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 149 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 150 | 18688 | lib32-vkbasalt | 0 | 0 | 9 | Yes | TOOLING_FAILURE: |
| 151 | 18618 | madness-interactive-reloaded | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 152 | 18357 | mobirise | 0 | 0 | 9 | Yes | LICENSE_REVIEW_NEEDED: |
| 153 | 18368 | open-tv | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 154 | 18689 | pcem-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 155 | 18251 | prey | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 156 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | PROPRIETARY_DEP: |
| 157 | 18654 | shijima-qt | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 158 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 159 | 18605 | ausweiskopie | 0 | 0 | 10 | Yes | SOURCE_UNAVAILABLE: |
| 160 | 18416 | beignet-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 161 | 18404 | hnefatafl-copenhagen | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 162 | 18351 | libfive-studio-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 163 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 164 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 165 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 166 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 167 | 18498 | linux-sched-ext-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 168 | 18533 | linux-tip-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 169 | 18484 | nvidia-390xx-settings | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 170 | 18518 | pantheon-polkit-agent-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 171 | 18273 | vanilla-wiiu-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 172 | 18668 | virtualbox-bin-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 173 | 18377 | cockatrice-server-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 174 | 18648 | fancy-cat | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 175 | 18347 | lto-dump-snapshot | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 176 | 18554 | luxtorpeda-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 177 | 18613 | principia-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 178 | 18386 | synfigstudio-dev | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 179 | 18302 | vegastrike-engine-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 180 | 18652 | vgmstream-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 181 | 18378 | whatip-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 182 | 18696 | devtools-git | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 183 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 184 | 18405 | gst-plugins-rs-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 185 | 18447 | linux-xanmod-lts-headers | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 186 | 18388 | mingw-w64-libopenmpt | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 187 | 18632 | opendrop-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 188 | 18293 | betterx-desktop-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 189 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 190 | 18619 | glsmac-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 191 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 192 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 193 | 18336 | yacreader-poppler-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 194 | 18287 | goxlr-utility-ui | 0 | 0 | 14 | Yes | DEP_RESOLUTION_FAILED: |
| 195 | 18610 | lincity-ng-git | 0 | 0 | 14 | Yes | DEP_RESOLUTION_FAILED: |
| 196 | 18522 | linux-cachyos-hardened-headers | 0 | 0 | 14 | Yes | TOOLING_FAILURE: |
| 197 | 18514 | linux-next-git-headers | 0 | 0 | 14 | Yes | TOOLING_FAILURE: |
| 198 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 199 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 200 | 18485 | lightlyshaders-git | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |

## Full Queue

| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR | Fail Reason |
|------|---|---------|-------------|-------------|-----------|--------|-------------|
| 1 | 18644 | gradience | 0 | 1 | 0 | No | DEP_RESOLUTION_FAILED: |
| 2 | 18513 | sudo-selinux | 0 | 1 | 8 | Yes | TOOLING_FAILURE: |
| 3 | 18537 | base-selinux | 0 | 1 | 18 | Yes | TOOLING_FAILURE: |
| 4 | 18359 | wayfire-git | 0 | 1 | 33 | Yes | DEP_RESOLUTION_FAILED: |
| 5 | 18703 | neovim-lspconfig-opt-git | 0 | 0 | 0 | No | TOOLING_FAILURE: |
| 6 | 18449 | sipgate-app-clinq | 0 | 0 | 0 | No | NEEDS_RECIPE_DESIGN: |
| 7 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 8 | 18606 | aquacomputer_d5next-hwmon-dkms | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 9 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 10 | 18574 | edgeimpulse-cli | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 11 | 18599 | gdx-liftoff | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 12 | 18355 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 13 | 18285 | librewolf-tridactyl-native-bin | 0 | 0 | 1 | Yes | BROWSER_EXTENSION: |
| 14 | 18423 | locale-mul_zz | 0 | 0 | 1 | Yes | TOOLING_FAILURE: |
| 15 | 18478 | luniistore | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 16 | 18371 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | Yes | DISTRO_SPECIFIC: |
| 17 | 18700 | server-box-bin | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 18 | 18419 | simplicity-commander | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE: |
| 19 | 18642 | amneziawg-dkms-git | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 20 | 18452 | amneziawg-linux | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 21 | 18382 | amneziawg-linux-hardened | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 22 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 23 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 24 | 18568 | archwiki-offline | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 25 | 18269 | aws-amplify-cli | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 26 | 18298 | aws-cdk | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 27 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 28 | 18291 | decrypto-pro-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 29 | 18461 | knossu | 0 | 0 | 2 | Yes | NEEDS_RECIPE_DESIGN: |
| 30 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 31 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 32 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 33 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 34 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 35 | 18330 | mingw-w64-soundtouch | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 36 | 18264 | nftables-geoip-db | 0 | 0 | 2 | Yes | BUILD_NETWORK_REQUIRED: |
| 37 | 18215 | nodejs-cspell | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 38 | 18417 | osmtogeojson | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 39 | 18399 | pfring-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 40 | 18556 | python-home-assistant-frontend | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 41 | 18487 | r8126-dkms | 0 | 0 | 2 | Yes | DKMS_KERNEL_MODULE: |
| 42 | 18413 | receitanet | 0 | 0 | 2 | Yes | SOURCE_UNAVAILABLE: |
| 43 | 18509 | rm-improved | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 44 | 18578 | shig-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 45 | 18453 | system-age | 0 | 0 | 2 | Yes | DISTRO_SPECIFIC: |
| 46 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 47 | 18695 | vscodium-marketplace | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 48 | 18346 | beammp-launcher-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 49 | 18639 | dagger-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 50 | 18620 | electrum-personal-server-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 51 | 18301 | hyperledger-fabric | 0 | 0 | 3 | Yes | BUILD_REQUIRES_DOCKER: |
| 52 | 18379 | java-language-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 53 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 54 | 18490 | linux-keep-modules | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 55 | 18401 | nfuspire-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 56 | 18380 | nginx-mainline-mod-njs | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 57 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | DKMS_KERNEL_MODULE: |
| 58 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 59 | 18430 | quartz-utils-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 60 | 18561 | rdt-client | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 61 | 18638 | sbctl-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 62 | 18649 | snowflake-pt-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 63 | 18396 | sommelier-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 64 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 65 | 18666 | tilp-xdg | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 66 | 18410 | atuin-lily-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 67 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 68 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 69 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 70 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 71 | 18523 | gearhead2 | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 72 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 73 | 18353 | nvidiactl-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 74 | 18167 | openfortivpn-webview-electron | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 75 | 18398 | php83-mcrypt | 0 | 0 | 4 | Yes | TOOLING_FAILURE: |
| 76 | 18557 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 77 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 78 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 79 | 18362 | rtl88x2ce-dkms-git | 0 | 0 | 4 | Yes | DKMS_KERNEL_MODULE: |
| 80 | 18256 | truckersmp-cli | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 81 | 18333 | ut2004-gog | 0 | 0 | 4 | Yes | NON_DISTRIBUTABLE: |
| 82 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 83 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 84 | 18151 | futu-ftnn-wine | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 85 | 18286 | hq | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 86 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 87 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 88 | 18592 | mailnaggertray-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 89 | 18381 | musique | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 90 | 18640 | nemo-engrampa | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 91 | 18617 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | Yes | TOOLING_FAILURE: |
| 92 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 93 | 18463 | python-gradio-pdf | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 94 | 18474 | python-jaxlib-bin | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 95 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 96 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 97 | 18131 | smtube | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 98 | 18141 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | Yes | PROPRIETARY_DEP: |
| 99 | 18480 | unpack-install-jammer | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 100 | 18319 | unrealtournament4 | 0 | 0 | 5 | Yes | NON_DISTRIBUTABLE: |
| 101 | 18354 | xidlehook | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 102 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 103 | 14587 | asp | 0 | 0 | 6 | Yes | deptree-resolver-260417ac:ARCH_SPECIFIC: |
| 104 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 105 | 18691 | awk-language-server | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 106 | 18604 | beet-summarize-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 107 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 108 | 18315 | fileoptimizer-bin | 0 | 0 | 6 | Yes | PLATFORM_UNSUPPORTED: |
| 109 | 18675 | gstreamermm-docs | 0 | 0 | 6 | Yes | SOURCE_UNAVAILABLE: |
| 110 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 111 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 112 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 113 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 114 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 115 | 18576 | swscreenshot-gui | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 116 | 18299 | vegastrike-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 117 | 18520 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | Yes | TOOLING_FAILURE: |
| 118 | 18672 | arti-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 119 | 18320 | eddiscovery | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 120 | 18600 | fido2-hid-bridge | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 121 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 122 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 123 | 18667 | limine-snapper-sync-git | 0 | 0 | 7 | Yes | SOURCE_UNAVAILABLE: |
| 124 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 125 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 126 | 18342 | mkinitcpio-clevis-hook | 0 | 0 | 7 | Yes | ARCH_SPECIFIC: |
| 127 | 18383 | obs-plugin-input-overlay-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 128 | 18502 | openpace-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 129 | 18281 | pikeru | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 130 | 18397 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 131 | 18438 | prs | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 132 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 133 | 18262 | wayprompt-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 134 | 18237 | wldash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 135 | 18637 | yt-x-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 136 | 18295 | anytxt-bin | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 137 | 18690 | coreutils-arch | 0 | 0 | 8 | Yes | TOOLING_FAILURE: |
| 138 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 139 | 18598 | go2tv | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED: |
| 140 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 141 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 142 | 18367 | pianoteq-stage | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 143 | 18253 | vmd | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 144 | 18426 | xeme-hg | 0 | 0 | 8 | Yes | SOURCE_UNAVAILABLE: |
| 145 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 146 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 147 | 18360 | epub_to_audiobook-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 148 | 18612 | frame-eth | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 149 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 150 | 18688 | lib32-vkbasalt | 0 | 0 | 9 | Yes | TOOLING_FAILURE: |
| 151 | 18618 | madness-interactive-reloaded | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 152 | 18357 | mobirise | 0 | 0 | 9 | Yes | LICENSE_REVIEW_NEEDED: |
| 153 | 18368 | open-tv | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 154 | 18689 | pcem-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 155 | 18251 | prey | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 156 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | PROPRIETARY_DEP: |
| 157 | 18654 | shijima-qt | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 158 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 159 | 18605 | ausweiskopie | 0 | 0 | 10 | Yes | SOURCE_UNAVAILABLE: |
| 160 | 18416 | beignet-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 161 | 18404 | hnefatafl-copenhagen | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 162 | 18351 | libfive-studio-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 163 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 164 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 165 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 166 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 167 | 18498 | linux-sched-ext-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 168 | 18533 | linux-tip-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 169 | 18484 | nvidia-390xx-settings | 0 | 0 | 10 | Yes | TOOLING_FAILURE: |
| 170 | 18518 | pantheon-polkit-agent-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 171 | 18273 | vanilla-wiiu-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 172 | 18668 | virtualbox-bin-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 173 | 18377 | cockatrice-server-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 174 | 18648 | fancy-cat | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 175 | 18347 | lto-dump-snapshot | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 176 | 18554 | luxtorpeda-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 177 | 18613 | principia-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 178 | 18386 | synfigstudio-dev | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 179 | 18302 | vegastrike-engine-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 180 | 18652 | vgmstream-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 181 | 18378 | whatip-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 182 | 18696 | devtools-git | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 183 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 184 | 18405 | gst-plugins-rs-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 185 | 18447 | linux-xanmod-lts-headers | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 186 | 18388 | mingw-w64-libopenmpt | 0 | 0 | 12 | Yes | TOOLING_FAILURE: |
| 187 | 18632 | opendrop-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 188 | 18293 | betterx-desktop-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 189 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 190 | 18619 | glsmac-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 191 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 192 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 193 | 18336 | yacreader-poppler-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 194 | 18287 | goxlr-utility-ui | 0 | 0 | 14 | Yes | DEP_RESOLUTION_FAILED: |
| 195 | 18610 | lincity-ng-git | 0 | 0 | 14 | Yes | DEP_RESOLUTION_FAILED: |
| 196 | 18522 | linux-cachyos-hardened-headers | 0 | 0 | 14 | Yes | TOOLING_FAILURE: |
| 197 | 18514 | linux-next-git-headers | 0 | 0 | 14 | Yes | TOOLING_FAILURE: |
| 198 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 199 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 200 | 18485 | lightlyshaders-git | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 201 | 18547 | linux-covolunablu-gaming-headers | 0 | 0 | 15 | Yes | TOOLING_FAILURE: |
| 202 | 18530 | panda3ds | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 203 | 18303 | php-legacy-pdlib | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 204 | 18580 | scans2any-git | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 205 | 1833 | vmware-workstation | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 206 | 18439 | lcd4linux-git | 0 | 0 | 16 | Yes | DEP_RESOLUTION_FAILED: |
| 207 | 18573 | gvfs-smb-git | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED: |
| 208 | 18255 | oclint | 0 | 0 | 17 | Yes | BUILD_FAILED: |
| 209 | 18241 | smoothpaper | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED: |
| 210 | 18254 | openxcom-git | 0 | 0 | 18 | Yes | DEP_RESOLUTION_FAILED: |
| 211 | 18497 | picom-ftlabs-git | 0 | 0 | 19 | Yes | DEP_RESOLUTION_FAILED: |
| 212 | 18701 | sddm-idle | 0 | 0 | 19 | Yes | TOOLING_FAILURE: |
| 213 | 18507 | linux-cachyos-bmq-headers | 0 | 0 | 20 | Yes | TOOLING_FAILURE: |
| 214 | 18636 | linux-cachyos-eevdf-headers | 0 | 0 | 20 | Yes | TOOLING_FAILURE: |
| 215 | 18647 | linux-cachyos-server-headers | 0 | 0 | 20 | Yes | TOOLING_FAILURE: |
| 216 | 18521 | paperde | 0 | 0 | 20 | Yes | DEP_RESOLUTION_FAILED: |
| 217 | 18343 | xivlauncher-rb | 0 | 0 | 20 | Yes | DEP_RESOLUTION_FAILED: |
| 218 | 18158 | codeblocks-svn | 0 | 0 | 22 | Yes | AUR_REPO_DELETED: |
| 219 | 17261 | firestorm-next-bin | 0 | 0 | 22 | Yes | MULTILIB_UNSUPPORTED: |
| 220 | 18168 | openconnect-sso-git | 0 | 0 | 23 | Yes | DEP_RESOLUTION_FAILED: |
| 221 | 18268 | ecal-samples | 0 | 0 | 24 | Yes | DEP_RESOLUTION_FAILED: |
| 222 | 18590 | nyarchassistant | 0 | 0 | 26 | Yes | DEP_RESOLUTION_FAILED: |
| 223 | 18650 | aosp-devel | 0 | 0 | 27 | Yes | TOOLING_FAILURE: |
| 224 | 17914 | deadbeef-git | 0 | 0 | 27 | Yes | COMPLEX_BUILD: |
| 225 | 23279 | quartus-free-quartus | 0 | 0 | 27 | Yes | PROPRIETARY_PLATFORM: |
| 226 | 18400 | nheko-scrollfix | 0 | 0 | 28 | Yes | DEP_RESOLUTION_FAILED: |
| 227 | 18326 | texpresso-git | 0 | 0 | 29 | Yes | DEP_RESOLUTION_FAILED: |
| 228 | 17424 | etlegacy32-mod | 0 | 0 | 30 | Yes | MULTILIB_UNSUPPORTED: |
| 229 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD: |
| 230 | 18375 | qgroundcontrol | 0 | 0 | 40 | Yes | DEP_RESOLUTION_FAILED: |
| 231 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 232 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 233 | 18192 | shadps4-git | 0 | 0 | 46 | Yes | AUR_REPO_DELETED: |
| 234 | 18683 | librum | 0 | 0 | 51 | Yes | DEP_RESOLUTION_FAILED: |
| 235 | 18200 | systemd-ukify-git | 0 | 0 | 53 | Yes | AUR_REPO_DELETED: |
| 236 | 18348 | waytrogen | 0 | 0 | 54 | Yes | DEP_RESOLUTION_FAILED: |
| 237 | 18197 | wine-osu-spectator-wow64 | 0 | 0 | 61 | Yes | BUILD_FAILED: |
| 238 | 18491 | teb-obs | 0 | 0 | 67 | Yes | DEP_RESOLUTION_FAILED: |
| 239 | 18157 | thunderbird-globalmenu | 0 | 0 | 73 | Yes | AUR_REPO_DELETED: |
| 240 | 17346 | ffmpeg-cuda-full | 0 | 0 | 89 | Yes | CUDA_DEPENDENCY: |
| 241 | 18189 | ffmpeg-full-git | 0 | 0 | 139 | Yes | AUR_REPO_DELETED: |
| 242 | 18594 | illogical-impulse-pymyc-aur | 1 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 243 | 18263 | wayfire-plugins-extra-git | 1 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
| 244 | 18538 | base-devel-selinux | 2 | 0 | 3 | Yes | TOOLING_FAILURE: |
