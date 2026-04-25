# Blocked Dependency Tree Report

Generated: 2026-04-25T03:08:32.652189+00:00
Pass: deptree-resolver-260425a
Selected: 100

## Summary

- Total blocked: 157
- In AUR cache: 157
- Not in cache: 0
- Zero blocked deps: 156

## Blocking Reasons

- DEP_RESOLUTION_FAILED:: 50
- AUR_REPO_DELETED:: 15
- MINGW_CROSS_COMPILATION:: 9
- SOURCE_UNAVAILABLE:: 8
- LICENSE_REVIEW_NEEDED:: 7
- MULTILIB_UNSUPPORTED:: 7
- NEEDS_RECIPE_DESIGN:: 6
- BUILD_FAILED:: 5
- DISTRO_SPECIFIC:: 5
- LEGACY_PYTHON2:: 4
- COMPLEX_DEPS:: 4
- COMPLEX_BUILD:: 4
- GCC_SNAPSHOT_RUNTIME:: 4
- KERNEL_MODULE:: 3
- PROPRIETARY_BINARY:: 3
- MISSING_DEP:: 3
- KERNEL_SPECIFIC:: 3
- ARCH_SPECIFIC:: 2
- ANDROID_SDK_PLATFORM:: 2
- PROPRIETARY_DEP:: 2
- PLATFORM_UNSUPPORTED:: 1
- TOOLING_FAILURE:: 1
- ABANDONED_UPSTREAM:: 1
- CROSS_COMPILATION:: 1
- deptree-resolver-260417ac:ARCH_SPECIFIC:: 1
- NON_DISTRIBUTABLE:: 1
- DISTRO_SPECIFIC: 1
- NEEDS_INVESTIGATION:: 1
- ROCM_DEPENDENCY:: 1
- PROPRIETARY_PLATFORM:: 1
- CUDA_DEPENDENCY:: 1

## Priority Queue (Top 200)

| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR | Fail Reason |
|------|---|---------|-------------|-------------|-----------|--------|-------------|
| 1 | 18359 | wayfire-git | 0 | 1 | 33 | Yes | DEP_RESOLUTION_FAILED: |
| 2 | 19246 | elp | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 3 | 11204 | huawei-me936-udev | 0 | 0 | 0 | Yes | AUR_REPO_DELETED: |
| 4 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 5 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 6 | 18190 | celeste64 | 0 | 0 | 1 | Yes | AUR_REPO_DELETED: |
| 7 | 18317 | cosu-trainer-bin | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 8 | 18355 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | Yes | NEEDS_RECIPE_DESIGN: |
| 9 | 18285 | librewolf-tridactyl-native-bin | 0 | 0 | 1 | Yes | NEEDS_RECIPE_DESIGN: |
| 10 | 18371 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | Yes | ARCH_SPECIFIC: |
| 11 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 12 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 13 | 18269 | aws-amplify-cli | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 14 | 18298 | aws-cdk | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 15 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 16 | 18291 | decrypto-pro-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 17 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 18 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 19 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 20 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 21 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 22 | 18330 | mingw-w64-soundtouch | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 23 | 18264 | nftables-geoip-db | 0 | 0 | 2 | Yes | NEEDS_RECIPE_DESIGN: |
| 24 | 18215 | nodejs-cspell | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 25 | 18322 | roon-tui | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 26 | 18279 | secho | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 27 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 28 | 18346 | beammp-launcher-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 29 | 18349 | blahaj | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 30 | 18301 | hyperledger-fabric | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 31 | 18345 | latte-dock | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 32 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 33 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | BUILD_FAILED: |
| 34 | 18282 | openjlc | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 35 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 36 | 18334 | playit | 0 | 0 | 3 | Yes | NEEDS_RECIPE_DESIGN: |
| 37 | 18266 | quickenv | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 38 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 39 | 18274 | tktreectrl-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 40 | 18344 | vesktop-electron | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 41 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 42 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 43 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | MISSING_DEP: |
| 44 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 45 | 18195 | feather-music-git | 0 | 0 | 4 | Yes | AUR_REPO_DELETED: |
| 46 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 47 | 18353 | nvidiactl-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 48 | 18167 | openfortivpn-webview-electron | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 49 | 18308 | openstack_tui | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 50 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 51 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 52 | 18362 | rtl88x2ce-dkms-git | 0 | 0 | 4 | Yes | KERNEL_MODULE: |
| 53 | 18256 | truckersmp-cli | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 54 | 18333 | ut2004-gog | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 55 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 56 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 57 | 18156 | clspv-git | 0 | 0 | 5 | Yes | AUR_REPO_DELETED: |
| 58 | 18290 | fortran_stdlib | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 59 | 18151 | futu-ftnn-wine | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 60 | 18286 | hq | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 61 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 62 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 63 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 64 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 65 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 66 | 18131 | smtube | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 67 | 18141 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | Yes | PROPRIETARY_DEP: |
| 68 | 18319 | unrealtournament4 | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 69 | 18354 | xidlehook | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 70 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 71 | 14587 | asp | 0 | 0 | 6 | Yes | deptree-resolver-260417ac:ARCH_SPECIFIC: |
| 72 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 73 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 74 | 18315 | fileoptimizer-bin | 0 | 0 | 6 | Yes | NEEDS_RECIPE_DESIGN: |
| 75 | 18361 | geekbench-ai | 0 | 0 | 6 | Yes | LICENSE_REVIEW_NEEDED: |
| 76 | 18229 | kodi-addon-pvr-hts | 0 | 0 | 6 | Yes | AUR_REPO_DELETED: |
| 77 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 78 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 79 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 80 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 81 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 82 | 41720 | smuxi-server | 0 | 0 | 6 | Yes | AUR_REPO_DELETED: |
| 83 | 18299 | vegastrike-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 84 | 33221 | dotnet-runtime-5.0-bin | 0 | 0 | 7 | Yes | AUR_REPO_DELETED: |
| 85 | 18320 | eddiscovery | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 86 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 87 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 88 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 89 | 35628 | llvm40-libs | 0 | 0 | 7 | Yes | AUR_REPO_DELETED: |
| 90 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 91 | 18342 | mkinitcpio-clevis-hook | 0 | 0 | 7 | Yes | ARCH_SPECIFIC: |
| 92 | 18281 | pikeru | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 93 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 94 | 18232 | realesrgan-ncnn-vulkan | 0 | 0 | 7 | Yes | AUR_REPO_DELETED: |
| 95 | 18262 | wayprompt-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 96 | 18237 | wldash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 97 | 18295 | anytxt-bin | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 98 | 32716 | dotnet-runtime-6.0-bin | 0 | 0 | 8 | Yes | AUR_REPO_DELETED: |
| 99 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 100 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 101 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 102 | 18367 | pianoteq-stage | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 103 | 18253 | vmd | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 104 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 105 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 106 | 18360 | epub_to_audiobook-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 107 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 108 | 18357 | mobirise | 0 | 0 | 9 | Yes | LICENSE_REVIEW_NEEDED: |
| 109 | 18368 | open-tv | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 110 | 18251 | prey | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 111 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | PROPRIETARY_DEP: |
| 112 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 113 | 18351 | libfive-studio-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 114 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 115 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 116 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 117 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 118 | 18273 | vanilla-wiiu-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 119 | 18377 | cockatrice-server-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 120 | 18347 | lto-dump-snapshot | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 121 | 18302 | vegastrike-engine-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 122 | 18378 | whatip-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 123 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 124 | 18293 | betterx-desktop-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 125 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 126 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 127 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 128 | 18336 | yacreader-poppler-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 129 | 18287 | goxlr-utility-ui | 0 | 0 | 14 | Yes | DEP_RESOLUTION_FAILED: |
| 130 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 131 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 132 | 18303 | php-legacy-pdlib | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 133 | 1833 | vmware-workstation | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 134 | 18255 | oclint | 0 | 0 | 17 | Yes | BUILD_FAILED: |
| 135 | 18241 | smoothpaper | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED: |
| 136 | 18254 | openxcom-git | 0 | 0 | 18 | Yes | DEP_RESOLUTION_FAILED: |
| 137 | 18343 | xivlauncher-rb | 0 | 0 | 20 | Yes | DEP_RESOLUTION_FAILED: |
| 138 | 18158 | codeblocks-svn | 0 | 0 | 22 | Yes | AUR_REPO_DELETED: |
| 139 | 17261 | firestorm-next-bin | 0 | 0 | 22 | Yes | MULTILIB_UNSUPPORTED: |
| 140 | 18168 | openconnect-sso-git | 0 | 0 | 23 | Yes | DEP_RESOLUTION_FAILED: |
| 141 | 18268 | ecal-samples | 0 | 0 | 24 | Yes | DEP_RESOLUTION_FAILED: |
| 142 | 17914 | deadbeef-git | 0 | 0 | 27 | Yes | COMPLEX_BUILD: |
| 143 | 23279 | quartus-free-quartus | 0 | 0 | 27 | Yes | PROPRIETARY_PLATFORM: |
| 144 | 18326 | texpresso-git | 0 | 0 | 29 | Yes | DEP_RESOLUTION_FAILED: |
| 145 | 17424 | etlegacy32-mod | 0 | 0 | 30 | Yes | MULTILIB_UNSUPPORTED: |
| 146 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD: |
| 147 | 18375 | qgroundcontrol | 0 | 0 | 40 | Yes | DEP_RESOLUTION_FAILED: |
| 148 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 149 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 150 | 18192 | shadps4-git | 0 | 0 | 46 | Yes | AUR_REPO_DELETED: |
| 151 | 18200 | systemd-ukify-git | 0 | 0 | 53 | Yes | AUR_REPO_DELETED: |
| 152 | 18348 | waytrogen | 0 | 0 | 54 | Yes | DEP_RESOLUTION_FAILED: |
| 153 | 18197 | wine-osu-spectator-wow64 | 0 | 0 | 61 | Yes | BUILD_FAILED: |
| 154 | 18157 | thunderbird-globalmenu | 0 | 0 | 73 | Yes | AUR_REPO_DELETED: |
| 155 | 17346 | ffmpeg-cuda-full | 0 | 0 | 89 | Yes | CUDA_DEPENDENCY: |
| 156 | 18189 | ffmpeg-full-git | 0 | 0 | 139 | Yes | AUR_REPO_DELETED: |
| 157 | 18263 | wayfire-plugins-extra-git | 1 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |

## Full Queue

| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR | Fail Reason |
|------|---|---------|-------------|-------------|-----------|--------|-------------|
| 1 | 18359 | wayfire-git | 0 | 1 | 33 | Yes | DEP_RESOLUTION_FAILED: |
| 2 | 19246 | elp | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 3 | 11204 | huawei-me936-udev | 0 | 0 | 0 | Yes | AUR_REPO_DELETED: |
| 4 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 5 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 6 | 18190 | celeste64 | 0 | 0 | 1 | Yes | AUR_REPO_DELETED: |
| 7 | 18317 | cosu-trainer-bin | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 8 | 18355 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | Yes | NEEDS_RECIPE_DESIGN: |
| 9 | 18285 | librewolf-tridactyl-native-bin | 0 | 0 | 1 | Yes | NEEDS_RECIPE_DESIGN: |
| 10 | 18371 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | Yes | ARCH_SPECIFIC: |
| 11 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 12 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 13 | 18269 | aws-amplify-cli | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 14 | 18298 | aws-cdk | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 15 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 16 | 18291 | decrypto-pro-git | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 17 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 18 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 19 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 20 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 21 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 22 | 18330 | mingw-w64-soundtouch | 0 | 0 | 2 | Yes | TOOLING_FAILURE: |
| 23 | 18264 | nftables-geoip-db | 0 | 0 | 2 | Yes | NEEDS_RECIPE_DESIGN: |
| 24 | 18215 | nodejs-cspell | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 25 | 18322 | roon-tui | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 26 | 18279 | secho | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 27 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 28 | 18346 | beammp-launcher-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 29 | 18349 | blahaj | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 30 | 18301 | hyperledger-fabric | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 31 | 18345 | latte-dock | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 32 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 33 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | BUILD_FAILED: |
| 34 | 18282 | openjlc | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 35 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 36 | 18334 | playit | 0 | 0 | 3 | Yes | NEEDS_RECIPE_DESIGN: |
| 37 | 18266 | quickenv | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 38 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 39 | 18274 | tktreectrl-git | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 40 | 18344 | vesktop-electron | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 41 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 42 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 43 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | MISSING_DEP: |
| 44 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 45 | 18195 | feather-music-git | 0 | 0 | 4 | Yes | AUR_REPO_DELETED: |
| 46 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 47 | 18353 | nvidiactl-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 48 | 18167 | openfortivpn-webview-electron | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 49 | 18308 | openstack_tui | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 50 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 51 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 52 | 18362 | rtl88x2ce-dkms-git | 0 | 0 | 4 | Yes | KERNEL_MODULE: |
| 53 | 18256 | truckersmp-cli | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 54 | 18333 | ut2004-gog | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 55 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 56 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 57 | 18156 | clspv-git | 0 | 0 | 5 | Yes | AUR_REPO_DELETED: |
| 58 | 18290 | fortran_stdlib | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 59 | 18151 | futu-ftnn-wine | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 60 | 18286 | hq | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 61 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 62 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 63 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 64 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 65 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 66 | 18131 | smtube | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 67 | 18141 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | Yes | PROPRIETARY_DEP: |
| 68 | 18319 | unrealtournament4 | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 69 | 18354 | xidlehook | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 70 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 71 | 14587 | asp | 0 | 0 | 6 | Yes | deptree-resolver-260417ac:ARCH_SPECIFIC: |
| 72 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 73 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 74 | 18315 | fileoptimizer-bin | 0 | 0 | 6 | Yes | NEEDS_RECIPE_DESIGN: |
| 75 | 18361 | geekbench-ai | 0 | 0 | 6 | Yes | LICENSE_REVIEW_NEEDED: |
| 76 | 18229 | kodi-addon-pvr-hts | 0 | 0 | 6 | Yes | AUR_REPO_DELETED: |
| 77 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 78 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 79 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 80 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 81 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 82 | 41720 | smuxi-server | 0 | 0 | 6 | Yes | AUR_REPO_DELETED: |
| 83 | 18299 | vegastrike-git | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 84 | 33221 | dotnet-runtime-5.0-bin | 0 | 0 | 7 | Yes | AUR_REPO_DELETED: |
| 85 | 18320 | eddiscovery | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 86 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 87 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 88 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 89 | 35628 | llvm40-libs | 0 | 0 | 7 | Yes | AUR_REPO_DELETED: |
| 90 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 91 | 18342 | mkinitcpio-clevis-hook | 0 | 0 | 7 | Yes | ARCH_SPECIFIC: |
| 92 | 18281 | pikeru | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 93 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 94 | 18232 | realesrgan-ncnn-vulkan | 0 | 0 | 7 | Yes | AUR_REPO_DELETED: |
| 95 | 18262 | wayprompt-git | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 96 | 18237 | wldash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 97 | 18295 | anytxt-bin | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 98 | 32716 | dotnet-runtime-6.0-bin | 0 | 0 | 8 | Yes | AUR_REPO_DELETED: |
| 99 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 100 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 101 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 102 | 18367 | pianoteq-stage | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 103 | 18253 | vmd | 0 | 0 | 8 | Yes | LICENSE_REVIEW_NEEDED: |
| 104 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 105 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 106 | 18360 | epub_to_audiobook-git | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 107 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 108 | 18357 | mobirise | 0 | 0 | 9 | Yes | LICENSE_REVIEW_NEEDED: |
| 109 | 18368 | open-tv | 0 | 0 | 9 | Yes | DEP_RESOLUTION_FAILED: |
| 110 | 18251 | prey | 0 | 0 | 9 | Yes | SOURCE_UNAVAILABLE: |
| 111 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | PROPRIETARY_DEP: |
| 112 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 113 | 18351 | libfive-studio-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 114 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 115 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 116 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 117 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | GCC_SNAPSHOT_RUNTIME: |
| 118 | 18273 | vanilla-wiiu-git | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 119 | 18377 | cockatrice-server-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 120 | 18347 | lto-dump-snapshot | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 121 | 18302 | vegastrike-engine-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 122 | 18378 | whatip-git | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 123 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 124 | 18293 | betterx-desktop-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 125 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 126 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 127 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 128 | 18336 | yacreader-poppler-git | 0 | 0 | 13 | Yes | DEP_RESOLUTION_FAILED: |
| 129 | 18287 | goxlr-utility-ui | 0 | 0 | 14 | Yes | DEP_RESOLUTION_FAILED: |
| 130 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 131 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 132 | 18303 | php-legacy-pdlib | 0 | 0 | 15 | Yes | DEP_RESOLUTION_FAILED: |
| 133 | 1833 | vmware-workstation | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 134 | 18255 | oclint | 0 | 0 | 17 | Yes | BUILD_FAILED: |
| 135 | 18241 | smoothpaper | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED: |
| 136 | 18254 | openxcom-git | 0 | 0 | 18 | Yes | DEP_RESOLUTION_FAILED: |
| 137 | 18343 | xivlauncher-rb | 0 | 0 | 20 | Yes | DEP_RESOLUTION_FAILED: |
| 138 | 18158 | codeblocks-svn | 0 | 0 | 22 | Yes | AUR_REPO_DELETED: |
| 139 | 17261 | firestorm-next-bin | 0 | 0 | 22 | Yes | MULTILIB_UNSUPPORTED: |
| 140 | 18168 | openconnect-sso-git | 0 | 0 | 23 | Yes | DEP_RESOLUTION_FAILED: |
| 141 | 18268 | ecal-samples | 0 | 0 | 24 | Yes | DEP_RESOLUTION_FAILED: |
| 142 | 17914 | deadbeef-git | 0 | 0 | 27 | Yes | COMPLEX_BUILD: |
| 143 | 23279 | quartus-free-quartus | 0 | 0 | 27 | Yes | PROPRIETARY_PLATFORM: |
| 144 | 18326 | texpresso-git | 0 | 0 | 29 | Yes | DEP_RESOLUTION_FAILED: |
| 145 | 17424 | etlegacy32-mod | 0 | 0 | 30 | Yes | MULTILIB_UNSUPPORTED: |
| 146 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD: |
| 147 | 18375 | qgroundcontrol | 0 | 0 | 40 | Yes | DEP_RESOLUTION_FAILED: |
| 148 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 149 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 150 | 18192 | shadps4-git | 0 | 0 | 46 | Yes | AUR_REPO_DELETED: |
| 151 | 18200 | systemd-ukify-git | 0 | 0 | 53 | Yes | AUR_REPO_DELETED: |
| 152 | 18348 | waytrogen | 0 | 0 | 54 | Yes | DEP_RESOLUTION_FAILED: |
| 153 | 18197 | wine-osu-spectator-wow64 | 0 | 0 | 61 | Yes | BUILD_FAILED: |
| 154 | 18157 | thunderbird-globalmenu | 0 | 0 | 73 | Yes | AUR_REPO_DELETED: |
| 155 | 17346 | ffmpeg-cuda-full | 0 | 0 | 89 | Yes | CUDA_DEPENDENCY: |
| 156 | 18189 | ffmpeg-full-git | 0 | 0 | 139 | Yes | AUR_REPO_DELETED: |
| 157 | 18263 | wayfire-plugins-extra-git | 1 | 0 | 12 | Yes | DEP_RESOLUTION_FAILED: |
