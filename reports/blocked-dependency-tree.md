# Blocked Dependency Tree Report

Generated: 2026-04-25T05:23:02.749100+00:00
Pass: deptree-resolver-260425b
Selected: 100

## Summary

- Total blocked: 203
- In AUR cache: 202
- Not in cache: 1
- Zero blocked deps: 201

## Blocking Reasons

- -: 54
- DEP_RESOLUTION_FAILED: 44
- TOOLING_FAILURE: 16
- SOURCE_UNAVAILABLE: 10
- MINGW_CROSS_COMPILATION: 9
- MULTILIB_UNSUPPORTED: 7
- DISTRO_SPECIFIC: 7
- NEEDS_RECIPE_DESIGN: 6
- AUR_REPO_DELETED: 5
- BUILD_FAILED: 4
- LEGACY_PYTHON2: 4
- COMPLEX_DEPS: 4
- COMPLEX_BUILD: 4
- GCC_SNAPSHOT_RUNTIME: 4
- PROPRIETARY_BINARY: 3
- MISSING_DEP: 3
- KERNEL_SPECIFIC: 3
- ANDROID_SDK_PLATFORM: 2
- LICENSE_REVIEW_NEEDED: 2
- KERNEL_MODULE: 2
- PROPRIETARY_DEP: 2
- PLATFORM_UNSUPPORTED: 1
- CROSS_COMPILATION: 1
- ABANDONED_UPSTREAM: 1
- NON_DISTRIBUTABLE: 1
- ROCM_DEPENDENCY: 1
- NEEDS_INVESTIGATION: 1
- PROPRIETARY_PLATFORM: 1
- CUDA_DEPENDENCY: 1

## Priority Queue (Top 200)

| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR | Fail Reason |
|------|---|---------|-------------|-------------|-----------|--------|-------------|
| 1 | 18387 | synfig-dev | 0 | 1 | 19 | Yes | DEP_RESOLUTION_FAILED |
| 2 | 18359 | wayfire-git | 0 | 1 | 34 | Yes | - |
| 3 | 18449 | sipgate-app-clinq | 0 | 0 | 0 | No | NEEDS_RECIPE_DESIGN |
| 4 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE |
| 5 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED |
| 6 | 18355 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | Yes | - |
| 7 | 18285 | librewolf-tridactyl-native-bin | 0 | 0 | 1 | Yes | - |
| 8 | 18423 | locale-mul_zz | 0 | 0 | 1 | Yes | TOOLING_FAILURE |
| 9 | 18478 | luniistore | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE |
| 10 | 18371 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | Yes | - |
| 11 | 18419 | simplicity-commander | 0 | 0 | 1 | Yes | SOURCE_UNAVAILABLE |
| 12 | 18452 | amneziawg-linux | 0 | 0 | 2 | Yes | TOOLING_FAILURE |
| 13 | 18382 | amneziawg-linux-hardened | 0 | 0 | 2 | Yes | TOOLING_FAILURE |
| 14 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM |
| 15 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM |
| 16 | 18269 | aws-amplify-cli | 0 | 0 | 2 | Yes | - |
| 17 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED |
| 18 | 18291 | decrypto-pro-git | 0 | 0 | 2 | Yes | - |
| 19 | 18461 | knossu | 0 | 0 | 2 | Yes | NEEDS_RECIPE_DESIGN |
| 20 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE |
| 21 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY |
| 22 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION |
| 23 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION |
| 24 | 18330 | mingw-w64-soundtouch | 0 | 0 | 2 | Yes | - |
| 25 | 18264 | nftables-geoip-db | 0 | 0 | 2 | Yes | - |
| 26 | 18215 | nodejs-cspell | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED |
| 27 | 18443 | opkssh | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED |
| 28 | 18442 | opkssh-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED |
| 29 | 18417 | osmtogeojson | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED |
| 30 | 18399 | pfring-dkms | 0 | 0 | 2 | Yes | TOOLING_FAILURE |
| 31 | 18413 | receitanet | 0 | 0 | 2 | Yes | SOURCE_UNAVAILABLE |
| 32 | 18509 | rm-improved | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED |
| 33 | 18453 | system-age | 0 | 0 | 2 | Yes | TOOLING_FAILURE |
| 34 | 18394 | to-html | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED |
| 35 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED |
| 36 | 18298 | aws-cdk | 0 | 0 | 3 | Yes | - |
| 37 | 18346 | beammp-launcher-git | 0 | 0 | 3 | Yes | - |
| 38 | 18409 | btop-no-gpu | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED |
| 39 | 18408 | ddpolymerase | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED |
| 40 | 18415 | firetools-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED |
| 41 | 18301 | hyperledger-fabric | 0 | 0 | 3 | Yes | - |
| 42 | 18379 | java-language-server | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED |
| 43 | 18345 | latte-dock | 0 | 0 | 3 | Yes | - |
| 44 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 3 | Yes | MULTILIB_UNSUPPORTED |
| 45 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED |
| 46 | 18490 | linux-keep-modules | 0 | 0 | 3 | Yes | TOOLING_FAILURE |
| 47 | 18401 | nfuspire-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED |
| 48 | 18380 | nginx-mainline-mod-njs | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED |
| 49 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | BUILD_FAILED |
| 50 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC |
| 51 | 18430 | quartz-utils-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED |
| 52 | 18428 | ruby-ruby-vips | 0 | 0 | 3 | Yes | NEEDS_RECIPE_DESIGN |
| 53 | 18396 | sommelier-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED |
| 54 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | MISSING_DEP |
| 55 | 18274 | tktreectrl-git | 0 | 0 | 3 | Yes | - |
| 56 | 18392 | wl-binclock | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED |
| 57 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC |
| 58 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | MISSING_DEP |
| 59 | 18406 | git-who | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED |
| 60 | 18473 | gql | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED |
| 61 | 18476 | mergiraf-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED |
| 62 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION |
| 63 | 18167 | openfortivpn-webview-electron | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED |
| 64 | 18398 | php83-mcrypt | 0 | 0 | 4 | Yes | TOOLING_FAILURE |
| 65 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2 |
| 66 | 18472 | qlipmon | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED |
| 67 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED |
| 68 | 18487 | r8126-dkms | 0 | 0 | 4 | Yes | TOOLING_FAILURE |
| 69 | 18362 | rtl88x2ce-dkms-git | 0 | 0 | 4 | Yes | - |
| 70 | 18395 | tablet-switch-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED |
| 71 | 18333 | ut2004-gog | 0 | 0 | 4 | Yes | - |
| 72 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC |
| 73 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC |
| 74 | 18410 | atuin-lily-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED |
| 75 | 17945 | euroscope-bin | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE |
| 76 | 18290 | fortran_stdlib | 0 | 0 | 5 | Yes | - |
| 77 | 18286 | hq | 0 | 0 | 5 | Yes | - |
| 78 | 18456 | hypraway | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED |
| 79 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION |
| 80 | 18463 | python-gradio-pdf | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN |
| 81 | 18474 | python-jaxlib-bin | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE |
| 82 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC |
| 83 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2 |
| 84 | 18141 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | Yes | PROPRIETARY_DEP |
| 85 | 18480 | unpack-install-jammer | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE |
| 86 | 18319 | unrealtournament4 | 0 | 0 | 5 | Yes | - |
| 87 | 18344 | vesktop-electron | 0 | 0 | 5 | Yes | - |
| 88 | 18393 | vivify | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED |
| 89 | 18354 | xidlehook | 0 | 0 | 5 | Yes | - |
| 90 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC |
| 91 | 14587 | asp | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC |
| 92 | 17433 | clash-for-windows-chinese | 0 | 0 | 6 | Yes | ABANDONED_UPSTREAM |
| 93 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE |
| 94 | 18315 | fileoptimizer-bin | 0 | 0 | 6 | Yes | - |
| 95 | 18151 | futu-ftnn-wine | 0 | 0 | 6 | Yes | NEEDS_RECIPE_DESIGN |
| 96 | 18361 | geekbench-ai | 0 | 0 | 6 | Yes | - |
| 97 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED |
| 98 | 18470 | llama.cpp-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED |
| 99 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION |
| 100 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION |
| 101 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION |
| 102 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION |
| 103 | 18381 | musique | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED |
| 104 | 18353 | nvidiactl-git | 0 | 0 | 6 | Yes | - |
| 105 | 17940 | pamac-cli | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC |
| 106 | 18299 | vegastrike-git | 0 | 0 | 6 | Yes | - |
| 107 | 18520 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | Yes | TOOLING_FAILURE |
| 108 | 17819 | inkdrop | 0 | 0 | 7 | Yes | SOURCE_UNAVAILABLE |
| 109 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED |
| 110 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION |
| 111 | 18342 | mkinitcpio-clevis-hook | 0 | 0 | 7 | Yes | - |
| 112 | 18383 | obs-plugin-input-overlay-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED |
| 113 | 18502 | openpace-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED |
| 114 | 18397 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED |
| 115 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2 |
| 116 | 18256 | truckersmp-cli | 0 | 0 | 7 | Yes | - |
| 117 | 18262 | wayprompt-git | 0 | 0 | 7 | Yes | - |
| 118 | 18237 | wldash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED |
| 119 | 18295 | anytxt-bin | 0 | 0 | 8 | Yes | - |
| 120 | 18320 | eddiscovery | 0 | 0 | 8 | Yes | - |
| 121 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP |
| 122 | 24719 | glibc-eac | 0 | 0 | 8 | Yes | COMPLEX_DEPS |
| 123 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED |
| 124 | 20547 | linux-gpib | 0 | 0 | 8 | Yes | KERNEL_MODULE |
| 125 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION |
| 126 | 18367 | pianoteq-stage | 0 | 0 | 8 | Yes | - |
| 127 | 18281 | pikeru | 0 | 0 | 8 | Yes | - |
| 128 | 18438 | prs | 0 | 0 | 8 | Yes | DEP_RESOLUTION_FAILED |
| 129 | 18513 | sudo-selinux | 0 | 0 | 8 | Yes | TOOLING_FAILURE |
| 130 | 18426 | xeme-hg | 0 | 0 | 8 | Yes | SOURCE_UNAVAILABLE |
| 131 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD |
| 132 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2 |
| 133 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS |
| 134 | 18357 | mobirise | 0 | 0 | 9 | Yes | - |
| 135 | 18368 | open-tv | 0 | 0 | 9 | Yes | - |
| 136 | 18468 | python-materialyoucolor-git | 0 | 0 | 9 | Yes | NEEDS_RECIPE_DESIGN |
| 137 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | PROPRIETARY_DEP |
| 138 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 139 | 18416 | beignet-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED |
| 140 | 18404 | hnefatafl-copenhagen | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED |
| 141 | 18351 | libfive-studio-git | 0 | 0 | 10 | Yes | - |
| 142 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME |
| 143 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME |
| 144 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME |
| 145 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME |
| 146 | 18498 | linux-sched-ext-git-headers | 0 | 0 | 10 | Yes | TOOLING_FAILURE |
| 147 | 18484 | nvidia-390xx-settings | 0 | 0 | 10 | Yes | TOOLING_FAILURE |
| 148 | 18273 | vanilla-wiiu-git | 0 | 0 | 10 | Yes | - |
| 149 | 18347 | lto-dump-snapshot | 0 | 0 | 11 | Yes | - |
| 150 | 18302 | vegastrike-engine-git | 0 | 0 | 11 | Yes | - |
| 151 | 18253 | vmd | 0 | 0 | 11 | Yes | - |
| 152 | 18378 | whatip-git | 0 | 0 | 11 | Yes | - |
| 153 | 18377 | cockatrice-server-git | 0 | 0 | 12 | Yes | - |
| 154 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED |
| 155 | 18405 | gst-plugins-rs-git | 0 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED |
| 156 | 18447 | linux-xanmod-lts-headers | 0 | 0 | 12 | Yes | TOOLING_FAILURE |
| 157 | 18388 | mingw-w64-libopenmpt | 0 | 0 | 12 | Yes | TOOLING_FAILURE |
| 158 | 18293 | betterx-desktop-git | 0 | 0 | 13 | Yes | - |
| 159 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED |
| 160 | 18251 | prey | 0 | 0 | 13 | Yes | - |
| 161 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY |
| 162 | 18131 | smtube | 0 | 0 | 13 | Yes | SOURCE_UNAVAILABLE |
| 163 | 18287 | goxlr-utility-ui | 0 | 0 | 14 | Yes | - |
| 164 | 18514 | linux-next-git-headers | 0 | 0 | 14 | Yes | TOOLING_FAILURE |
| 165 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD |
| 166 | 11354 | aurutils | 0 | 0 | 15 | Yes | DISTRO_SPECIFIC |
| 167 | 18360 | epub_to_audiobook-git | 0 | 0 | 15 | Yes | - |
| 168 | 18485 | lightlyshaders-git | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED |
| 169 | 18303 | php-legacy-pdlib | 0 | 0 | 15 | Yes | - |
| 170 | 18336 | yacreader-poppler-git | 0 | 0 | 15 | Yes | - |
| 171 | 18439 | lcd4linux-git | 0 | 0 | 16 | Yes | DEP_RESOLUTION_FAILED |
| 172 | 1833 | vmware-workstation | 0 | 0 | 16 | Yes | PROPRIETARY_BINARY |
| 173 | 18255 | oclint | 0 | 0 | 17 | Yes | - |
| 174 | 18241 | smoothpaper | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED |
| 175 | 18507 | linux-cachyos-bmq-headers | 0 | 0 | 20 | Yes | TOOLING_FAILURE |
| 176 | 18254 | openxcom-git | 0 | 0 | 20 | Yes | - |
| 177 | 17937 | illogical-impulse-ags | 0 | 0 | 21 | Yes | NEEDS_INVESTIGATION |
| 178 | 18158 | codeblocks-svn | 0 | 0 | 22 | Yes | AUR_REPO_DELETED |
| 179 | 18168 | openconnect-sso-git | 0 | 0 | 23 | Yes | DEP_RESOLUTION_FAILED |
| 180 | 18497 | picom-ftlabs-git | 0 | 0 | 23 | Yes | DEP_RESOLUTION_FAILED |
| 181 | 18268 | ecal-samples | 0 | 0 | 24 | Yes | - |
| 182 | 23279 | quartus-free-quartus | 0 | 0 | 28 | Yes | PROPRIETARY_PLATFORM |
| 183 | 18326 | texpresso-git | 0 | 0 | 29 | Yes | - |
| 184 | 17424 | etlegacy32-mod | 0 | 0 | 31 | Yes | MULTILIB_UNSUPPORTED |
| 185 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD |
| 186 | 17261 | firestorm-next-bin | 0 | 0 | 33 | Yes | MULTILIB_UNSUPPORTED |
| 187 | 35454 | deepin-wine8-stable | 0 | 0 | 35 | Yes | PROPRIETARY_BINARY |
| 188 | 18400 | nheko-scrollfix | 0 | 0 | 36 | Yes | DEP_RESOLUTION_FAILED |
| 189 | 18343 | xivlauncher-rb | 0 | 0 | 37 | Yes | - |
| 190 | 17914 | deadbeef-git | 0 | 0 | 38 | Yes | COMPLEX_BUILD |
| 191 | 18375 | qgroundcontrol | 0 | 0 | 40 | Yes | - |
| 192 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS |
| 193 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS |
| 194 | 18192 | shadps4-git | 0 | 0 | 48 | Yes | AUR_REPO_DELETED |
| 195 | 18200 | systemd-ukify-git | 0 | 0 | 55 | Yes | AUR_REPO_DELETED |
| 196 | 18348 | waytrogen | 0 | 0 | 59 | Yes | - |
| 197 | 18197 | wine-osu-spectator-wow64 | 0 | 0 | 66 | Yes | BUILD_FAILED |
| 198 | 18491 | teb-obs | 0 | 0 | 75 | Yes | DEP_RESOLUTION_FAILED |
| 199 | 18157 | thunderbird-globalmenu | 0 | 0 | 75 | Yes | AUR_REPO_DELETED |
| 200 | 17346 | ffmpeg-cuda-full | 0 | 0 | 92 | Yes | CUDA_DEPENDENCY |
| 201 | 18189 | ffmpeg-full-git | 0 | 0 | 141 | Yes | AUR_REPO_DELETED |
| 202 | 18386 | synfigstudio-dev | 1 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED |
| 203 | 18263 | wayfire-plugins-extra-git | 1 | 0 | 17 | Yes | - |
