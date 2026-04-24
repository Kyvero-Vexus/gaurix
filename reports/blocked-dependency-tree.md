# Blocked Dependency Tree Report

Generated: 2026-04-24T20:05:24.644497+00:00
Pass: deptree-resolver-260424v
Selected: 86

## Summary

- Total blocked: 86
- In AUR cache: 86
- Not in cache: 0
- Zero blocked deps: 86

## Blocking Reasons

- MINGW_CROSS_COMPILATION:: 9
- COMPLEX_BUILD:: 8
- MULTILIB_UNSUPPORTED:: 7
- SOURCE_UNAVAILABLE:: 5
- PROPRIETARY_BINARY:: 5
- DEP_RESOLUTION_FAILED:: 5
- DISTRO_SPECIFIC:: 5
- MISSING_DEP:: 4
- LEGACY_PYTHON2:: 4
- COMPLEX_DEPS:: 4
- null: 4
- BUILD_FAILED:: 3
- KERNEL_SPECIFIC:: 3
- ANDROID_SDK_PLATFORM:: 2
- LICENSE_REVIEW_NEEDED:: 2
- KERNEL_MODULE:: 2
- EOL_VERSION:: 2
- PLATFORM_UNSUPPORTED:: 1
- OLD_ELECTRON:: 1
- ABANDONED_UPSTREAM:: 1
- CROSS_COMPILATION:: 1
- ARCH_SPECIFIC: 1
- NON_DISTRIBUTABLE:: 1
- OLD_VERSION_VARIANT:: 1
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
| 5 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 6 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 7 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 8 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 9 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 10 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 11 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 12 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 13 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 14 | 17970 | electron23-bin | 0 | 0 | 3 | Yes | OLD_ELECTRON: |
| 15 | 17796 | heroku-cli | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 16 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 17 | 17807 | n8n | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 18 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | BUILD_FAILED: |
| 19 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 20 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 21 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 22 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 23 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | MISSING_DEP: |
| 24 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 25 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 26 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 27 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 28 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 29 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 30 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 31 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 32 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 33 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 34 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 35 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 36 | 14587 | asp | 0 | 0 | 6 | Yes | ARCH_SPECIFIC |
| 37 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 38 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 39 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 40 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 41 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 42 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 43 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 44 | 22584 | perl-math-clipper | 0 | 0 | 6 | Yes | COMPLEX_BUILD: |
| 45 | 41720 | smuxi-server | 0 | 0 | 6 | Yes | MISSING_DEP: |
| 46 | 33221 | dotnet-runtime-5.0-bin | 0 | 0 | 7 | Yes | EOL_VERSION: |
| 47 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 48 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 49 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 50 | 35628 | llvm40-libs | 0 | 0 | 7 | Yes | OLD_VERSION_VARIANT: |
| 51 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 52 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 53 | 44133 | reduce-common | 0 | 0 | 7 | Yes | COMPLEX_BUILD: |
| 54 | 32716 | dotnet-runtime-6.0-bin | 0 | 0 | 8 | Yes | EOL_VERSION: |
| 55 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 56 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 57 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 58 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 59 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 60 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 61 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 62 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 63 | 2254 | dropbox | 0 | 0 | 10 | Yes | PROPRIETARY_BINARY: |
| 64 | 17825 | esp8266-rtos-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 65 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | - |
| 66 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | - |
| 67 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | - |
| 68 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | - |
| 69 | 17808 | plasma6-applets-panon | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 70 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 71 | 17860 | realvnc-rvnc-connect | 0 | 0 | 12 | Yes | PROPRIETARY_BINARY: |
| 72 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 73 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 74 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 75 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 76 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 77 | 1833 | vmware-workstation | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 78 | 24418 | shadow-selinux | 0 | 0 | 19 | Yes | COMPLEX_BUILD: |
| 79 | 17261 | firestorm-next-bin | 0 | 0 | 22 | Yes | MULTILIB_UNSUPPORTED: |
| 80 | 17914 | deadbeef-git | 0 | 0 | 27 | Yes | COMPLEX_BUILD: |
| 81 | 23279 | quartus-free-quartus | 0 | 0 | 27 | Yes | PROPRIETARY_PLATFORM: |
| 82 | 17424 | etlegacy32-mod | 0 | 0 | 30 | Yes | MULTILIB_UNSUPPORTED: |
| 83 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD: |
| 84 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 85 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 86 | 17346 | ffmpeg-cuda-full | 0 | 0 | 89 | Yes | CUDA_DEPENDENCY: |

## Full Queue

| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR | Fail Reason |
|------|---|---------|-------------|-------------|-----------|--------|-------------|
| 1 | 19246 | elp | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 2 | 11204 | huawei-me936-udev | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 3 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 4 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 5 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 6 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 7 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 8 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 9 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 10 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 11 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 12 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 13 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 14 | 17970 | electron23-bin | 0 | 0 | 3 | Yes | OLD_ELECTRON: |
| 15 | 17796 | heroku-cli | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 16 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 17 | 17807 | n8n | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 18 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | BUILD_FAILED: |
| 19 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 20 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 21 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 22 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 23 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | MISSING_DEP: |
| 24 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 25 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 26 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 27 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 28 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 29 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 30 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 31 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 32 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 33 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 34 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 35 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 36 | 14587 | asp | 0 | 0 | 6 | Yes | ARCH_SPECIFIC |
| 37 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 38 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 39 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 40 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 41 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 42 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 43 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 44 | 22584 | perl-math-clipper | 0 | 0 | 6 | Yes | COMPLEX_BUILD: |
| 45 | 41720 | smuxi-server | 0 | 0 | 6 | Yes | MISSING_DEP: |
| 46 | 33221 | dotnet-runtime-5.0-bin | 0 | 0 | 7 | Yes | EOL_VERSION: |
| 47 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 48 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 49 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 50 | 35628 | llvm40-libs | 0 | 0 | 7 | Yes | OLD_VERSION_VARIANT: |
| 51 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 52 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 53 | 44133 | reduce-common | 0 | 0 | 7 | Yes | COMPLEX_BUILD: |
| 54 | 32716 | dotnet-runtime-6.0-bin | 0 | 0 | 8 | Yes | EOL_VERSION: |
| 55 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 56 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 57 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 58 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 59 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 60 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 61 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 62 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 63 | 2254 | dropbox | 0 | 0 | 10 | Yes | PROPRIETARY_BINARY: |
| 64 | 17825 | esp8266-rtos-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 65 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | - |
| 66 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | - |
| 67 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | - |
| 68 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | - |
| 69 | 17808 | plasma6-applets-panon | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 70 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 71 | 17860 | realvnc-rvnc-connect | 0 | 0 | 12 | Yes | PROPRIETARY_BINARY: |
| 72 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 73 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 74 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 75 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 76 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 77 | 1833 | vmware-workstation | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 78 | 24418 | shadow-selinux | 0 | 0 | 19 | Yes | COMPLEX_BUILD: |
| 79 | 17261 | firestorm-next-bin | 0 | 0 | 22 | Yes | MULTILIB_UNSUPPORTED: |
| 80 | 17914 | deadbeef-git | 0 | 0 | 27 | Yes | COMPLEX_BUILD: |
| 81 | 23279 | quartus-free-quartus | 0 | 0 | 27 | Yes | PROPRIETARY_PLATFORM: |
| 82 | 17424 | etlegacy32-mod | 0 | 0 | 30 | Yes | MULTILIB_UNSUPPORTED: |
| 83 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD: |
| 84 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 85 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 86 | 17346 | ffmpeg-cuda-full | 0 | 0 | 89 | Yes | CUDA_DEPENDENCY: |
