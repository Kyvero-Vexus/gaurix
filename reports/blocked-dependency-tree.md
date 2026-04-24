# Blocked Dependency Tree Report

Generated: 2026-04-24T23:32:36.626679+00:00
Pass: deptree-resolver-260424x
Selected: 100

## Summary

- Total blocked: 104
- In AUR cache: 104
- Not in cache: 0
- Zero blocked deps: 104

## Blocking Reasons

- DEP_RESOLUTION_FAILED:: 21
- MINGW_CROSS_COMPILATION:: 9
- MULTILIB_UNSUPPORTED:: 7
- SOURCE_UNAVAILABLE:: 6
- NEEDS_RECIPE_DESIGN:: 5
- BUILD_FAILED:: 5
- DISTRO_SPECIFIC:: 5
- COMPLEX_BUILD:: 5
- MISSING_DEP:: 4
- LEGACY_PYTHON2:: 4
- COMPLEX_DEPS:: 4
- null: 4
- PROPRIETARY_BINARY:: 3
- KERNEL_SPECIFIC:: 3
- AUR_REPO_DELETED:: 3
- ANDROID_SDK_PLATFORM:: 2
- LICENSE_REVIEW_NEEDED:: 2
- KERNEL_MODULE:: 2
- PLATFORM_UNSUPPORTED:: 1
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
| 1 | 19246 | elp | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 2 | 11204 | huawei-me936-udev | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 3 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 4 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 5 | 18190 | celeste64 | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 6 | 18228 | modrinth-app-appimage | 0 | 0 | 1 | Yes | NEEDS_RECIPE_DESIGN: |
| 7 | 18119 | neoforge-server | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 8 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 9 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 10 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 11 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 12 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 13 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 14 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 15 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 16 | 18215 | nodejs-cspell | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 17 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 18 | 18159 | udiskie-systemd-git | 0 | 0 | 2 | Yes | NEEDS_RECIPE_DESIGN: |
| 19 | 18136 | chomp | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 20 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 21 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | BUILD_FAILED: |
| 22 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 23 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 24 | 18130 | wpa-cute | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 25 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 26 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 27 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | MISSING_DEP: |
| 28 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 29 | 18195 | feather-music-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 30 | 18149 | kwin-effects-sliding-notifications-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 31 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 32 | 18167 | openfortivpn-webview-electron | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 33 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 34 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 35 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 36 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 37 | 18156 | clspv-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 38 | 18151 | futu-ftnn-wine | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 39 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 40 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 41 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 42 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 43 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 44 | 18131 | smtube | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 45 | 18141 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 46 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 47 | 14587 | asp | 0 | 0 | 6 | Yes | deptree-resolver-260417ac:ARCH_SPECIFIC: |
| 48 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 49 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 50 | 18229 | kodi-addon-pvr-hts | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 51 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 52 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 53 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 54 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 55 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 56 | 41720 | smuxi-server | 0 | 0 | 6 | Yes | MISSING_DEP: |
| 57 | 33221 | dotnet-runtime-5.0-bin | 0 | 0 | 7 | Yes | AUR_REPO_DELETED: |
| 58 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 59 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 60 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 61 | 35628 | llvm40-libs | 0 | 0 | 7 | Yes | AUR_REPO_DELETED: |
| 62 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 63 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 64 | 18232 | realesrgan-ncnn-vulkan | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 65 | 18164 | toxcore-c | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 66 | 18237 | wldash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 67 | 32716 | dotnet-runtime-6.0-bin | 0 | 0 | 8 | Yes | AUR_REPO_DELETED: |
| 68 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 69 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 70 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 71 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 72 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 73 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 74 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 75 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 76 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | - |
| 77 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | - |
| 78 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | - |
| 79 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | - |
| 80 | 18213 | folio | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 81 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 82 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 83 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 84 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 85 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 86 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 87 | 1833 | vmware-workstation | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 88 | 18241 | smoothpaper | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED: |
| 89 | 18221 | pixelflasher | 0 | 0 | 20 | Yes | NEEDS_RECIPE_DESIGN: |
| 90 | 18158 | codeblocks-svn | 0 | 0 | 22 | Yes | SOURCE_UNAVAILABLE: |
| 91 | 17261 | firestorm-next-bin | 0 | 0 | 22 | Yes | MULTILIB_UNSUPPORTED: |
| 92 | 18168 | openconnect-sso-git | 0 | 0 | 23 | Yes | DEP_RESOLUTION_FAILED: |
| 93 | 17914 | deadbeef-git | 0 | 0 | 27 | Yes | COMPLEX_BUILD: |
| 94 | 23279 | quartus-free-quartus | 0 | 0 | 27 | Yes | PROPRIETARY_PLATFORM: |
| 95 | 17424 | etlegacy32-mod | 0 | 0 | 30 | Yes | MULTILIB_UNSUPPORTED: |
| 96 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD: |
| 97 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 98 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 99 | 18192 | shadps4-git | 0 | 0 | 46 | Yes | DEP_RESOLUTION_FAILED: |
| 100 | 18200 | systemd-ukify-git | 0 | 0 | 53 | Yes | NEEDS_RECIPE_DESIGN: |
| 101 | 18197 | wine-osu-spectator-wow64 | 0 | 0 | 61 | Yes | BUILD_FAILED: |
| 102 | 18157 | thunderbird-globalmenu | 0 | 0 | 73 | Yes | BUILD_FAILED: |
| 103 | 17346 | ffmpeg-cuda-full | 0 | 0 | 89 | Yes | CUDA_DEPENDENCY: |
| 104 | 18189 | ffmpeg-full-git | 0 | 0 | 139 | Yes | DEP_RESOLUTION_FAILED: |

## Full Queue

| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR | Fail Reason |
|------|---|---------|-------------|-------------|-----------|--------|-------------|
| 1 | 19246 | elp | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 2 | 11204 | huawei-me936-udev | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 3 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 4 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 5 | 18190 | celeste64 | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 6 | 18228 | modrinth-app-appimage | 0 | 0 | 1 | Yes | NEEDS_RECIPE_DESIGN: |
| 7 | 18119 | neoforge-server | 0 | 0 | 1 | Yes | DEP_RESOLUTION_FAILED: |
| 8 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 9 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 10 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 11 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 12 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 13 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 14 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 15 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 16 | 18215 | nodejs-cspell | 0 | 0 | 2 | Yes | DEP_RESOLUTION_FAILED: |
| 17 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 18 | 18159 | udiskie-systemd-git | 0 | 0 | 2 | Yes | NEEDS_RECIPE_DESIGN: |
| 19 | 18136 | chomp | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 20 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 21 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | BUILD_FAILED: |
| 22 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 23 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 24 | 18130 | wpa-cute | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 25 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 26 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 27 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | MISSING_DEP: |
| 28 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 29 | 18195 | feather-music-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 30 | 18149 | kwin-effects-sliding-notifications-git | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 31 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 32 | 18167 | openfortivpn-webview-electron | 0 | 0 | 4 | Yes | DEP_RESOLUTION_FAILED: |
| 33 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 34 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 35 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 36 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 37 | 18156 | clspv-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 38 | 18151 | futu-ftnn-wine | 0 | 0 | 5 | Yes | NEEDS_RECIPE_DESIGN: |
| 39 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 40 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 41 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 42 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 43 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 44 | 18131 | smtube | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 45 | 18141 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | Yes | DEP_RESOLUTION_FAILED: |
| 46 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 47 | 14587 | asp | 0 | 0 | 6 | Yes | deptree-resolver-260417ac:ARCH_SPECIFIC: |
| 48 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 49 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 50 | 18229 | kodi-addon-pvr-hts | 0 | 0 | 6 | Yes | DEP_RESOLUTION_FAILED: |
| 51 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 52 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 53 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 54 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 55 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 56 | 41720 | smuxi-server | 0 | 0 | 6 | Yes | MISSING_DEP: |
| 57 | 33221 | dotnet-runtime-5.0-bin | 0 | 0 | 7 | Yes | AUR_REPO_DELETED: |
| 58 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 59 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 60 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 61 | 35628 | llvm40-libs | 0 | 0 | 7 | Yes | AUR_REPO_DELETED: |
| 62 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 63 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 64 | 18232 | realesrgan-ncnn-vulkan | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 65 | 18164 | toxcore-c | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 66 | 18237 | wldash | 0 | 0 | 7 | Yes | DEP_RESOLUTION_FAILED: |
| 67 | 32716 | dotnet-runtime-6.0-bin | 0 | 0 | 8 | Yes | AUR_REPO_DELETED: |
| 68 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 69 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 70 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 71 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 72 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 73 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 74 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 75 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 76 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | - |
| 77 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | - |
| 78 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | - |
| 79 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | - |
| 80 | 18213 | folio | 0 | 0 | 11 | Yes | DEP_RESOLUTION_FAILED: |
| 81 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 82 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 83 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 84 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 85 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 86 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 87 | 1833 | vmware-workstation | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 88 | 18241 | smoothpaper | 0 | 0 | 17 | Yes | DEP_RESOLUTION_FAILED: |
| 89 | 18221 | pixelflasher | 0 | 0 | 20 | Yes | NEEDS_RECIPE_DESIGN: |
| 90 | 18158 | codeblocks-svn | 0 | 0 | 22 | Yes | SOURCE_UNAVAILABLE: |
| 91 | 17261 | firestorm-next-bin | 0 | 0 | 22 | Yes | MULTILIB_UNSUPPORTED: |
| 92 | 18168 | openconnect-sso-git | 0 | 0 | 23 | Yes | DEP_RESOLUTION_FAILED: |
| 93 | 17914 | deadbeef-git | 0 | 0 | 27 | Yes | COMPLEX_BUILD: |
| 94 | 23279 | quartus-free-quartus | 0 | 0 | 27 | Yes | PROPRIETARY_PLATFORM: |
| 95 | 17424 | etlegacy32-mod | 0 | 0 | 30 | Yes | MULTILIB_UNSUPPORTED: |
| 96 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD: |
| 97 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 98 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 99 | 18192 | shadps4-git | 0 | 0 | 46 | Yes | DEP_RESOLUTION_FAILED: |
| 100 | 18200 | systemd-ukify-git | 0 | 0 | 53 | Yes | NEEDS_RECIPE_DESIGN: |
| 101 | 18197 | wine-osu-spectator-wow64 | 0 | 0 | 61 | Yes | BUILD_FAILED: |
| 102 | 18157 | thunderbird-globalmenu | 0 | 0 | 73 | Yes | BUILD_FAILED: |
| 103 | 17346 | ffmpeg-cuda-full | 0 | 0 | 89 | Yes | CUDA_DEPENDENCY: |
| 104 | 18189 | ffmpeg-full-git | 0 | 0 | 139 | Yes | DEP_RESOLUTION_FAILED: |
