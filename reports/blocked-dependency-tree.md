# Blocked Dependency Tree Report

Generated: 2026-04-24T18:18:16.548819+00:00
Pass: deptree-resolver-260424u
Selected: 98

## Summary

- Total blocked: 98
- In AUR cache: 98
- Not in cache: 0
- Zero blocked deps: 98

## Blocking Reasons

- COMPLEX_BUILD:: 10
- MINGW_CROSS_COMPILATION:: 9
- MULTILIB_UNSUPPORTED:: 7
- MISSING_DEP:: 7
- DEP_RESOLUTION_FAILED:: 6
- SOURCE_UNAVAILABLE:: 5
- PROPRIETARY_BINARY:: 5
- DISTRO_SPECIFIC:: 5
- OLD_VERSION_VARIANT:: 4
- LEGACY_PYTHON2:: 4
- COMPLEX_DEPS:: 4
- null: 4
- BUILD_FAILED:: 3
- KERNEL_SPECIFIC:: 3
- NEEDS_INVESTIGATION:: 3
- ANDROID_SDK_PLATFORM:: 2
- LICENSE_REVIEW_NEEDED:: 2
- KERNEL_MODULE:: 2
- EOL_VERSION:: 2
- PLATFORM_UNSUPPORTED:: 1
- OLD_ELECTRON:: 1
- ABANDONED_UPSTREAM:: 1
- NEEDS_RECIPE_DESIGN:: 1
- CROSS_COMPILATION:: 1
- ARCH_SPECIFIC: 1
- NON_DISTRIBUTABLE:: 1
- DISTRO_SPECIFIC: 1
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
| 20 | 17879 | slxfig-snapshot | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 21 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 22 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 23 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 24 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | MISSING_DEP: |
| 25 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 26 | 26185 | gcc8 | 0 | 0 | 4 | Yes | OLD_VERSION_VARIANT: |
| 27 | 21782 | gtk-theme-config | 0 | 0 | 4 | Yes | NEEDS_RECIPE_DESIGN: |
| 28 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 29 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 30 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 31 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 32 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 33 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 34 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 35 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 36 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 37 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 38 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 39 | 14587 | asp | 0 | 0 | 6 | Yes | ARCH_SPECIFIC |
| 40 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 41 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 42 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 43 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 44 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 45 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 46 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 47 | 22584 | perl-math-clipper | 0 | 0 | 6 | Yes | COMPLEX_BUILD: |
| 48 | 17889 | slrn-snapshot-canlock | 0 | 0 | 6 | Yes | MISSING_DEP: |
| 49 | 41720 | smuxi-server | 0 | 0 | 6 | Yes | MISSING_DEP: |
| 50 | 27646 | vapoursynth-plugin-d2vsource-git | 0 | 0 | 6 | Yes | COMPLEX_BUILD: |
| 51 | 19936 | boost1.86-libs | 0 | 0 | 7 | Yes | OLD_VERSION_VARIANT: |
| 52 | 20944 | boost183-libs | 0 | 0 | 7 | Yes | OLD_VERSION_VARIANT: |
| 53 | 33221 | dotnet-runtime-5.0-bin | 0 | 0 | 7 | Yes | EOL_VERSION: |
| 54 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 55 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 56 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 57 | 35628 | llvm40-libs | 0 | 0 | 7 | Yes | OLD_VERSION_VARIANT: |
| 58 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 59 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 60 | 44133 | reduce-common | 0 | 0 | 7 | Yes | COMPLEX_BUILD: |
| 61 | 32716 | dotnet-runtime-6.0-bin | 0 | 0 | 8 | Yes | EOL_VERSION: |
| 62 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 63 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 64 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 65 | 17887 | oqsprovider-git | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 66 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 67 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 68 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 69 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 70 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 71 | 2254 | dropbox | 0 | 0 | 10 | Yes | PROPRIETARY_BINARY: |
| 72 | 17867 | erwise | 0 | 0 | 10 | Yes | NEEDS_INVESTIGATION: |
| 73 | 17825 | esp8266-rtos-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 74 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | - |
| 75 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | - |
| 76 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | - |
| 77 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | - |
| 78 | 17808 | plasma6-applets-panon | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 79 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 80 | 17860 | realvnc-rvnc-connect | 0 | 0 | 12 | Yes | PROPRIETARY_BINARY: |
| 81 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 82 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 83 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 84 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 85 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 86 | 1833 | vmware-workstation | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 87 | 17810 | better-control-git | 0 | 0 | 19 | Yes | NEEDS_INVESTIGATION: |
| 88 | 24418 | shadow-selinux | 0 | 0 | 19 | Yes | COMPLEX_BUILD: |
| 89 | 17804 | vinyl-git | 0 | 0 | 20 | Yes | DEP_RESOLUTION_FAILED: |
| 90 | 17261 | firestorm-next-bin | 0 | 0 | 22 | Yes | MULTILIB_UNSUPPORTED: |
| 91 | 17927 | pulseeffects-legacy | 0 | 0 | 22 | Yes | COMPLEX_BUILD: |
| 92 | 17914 | deadbeef-git | 0 | 0 | 27 | Yes | COMPLEX_BUILD: |
| 93 | 23279 | quartus-free-quartus | 0 | 0 | 27 | Yes | PROPRIETARY_PLATFORM: |
| 94 | 17424 | etlegacy32-mod | 0 | 0 | 30 | Yes | MULTILIB_UNSUPPORTED: |
| 95 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD: |
| 96 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 97 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 98 | 17346 | ffmpeg-cuda-full | 0 | 0 | 89 | Yes | CUDA_DEPENDENCY: |

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
| 20 | 17879 | slxfig-snapshot | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 21 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 22 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 23 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 24 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | MISSING_DEP: |
| 25 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 26 | 26185 | gcc8 | 0 | 0 | 4 | Yes | OLD_VERSION_VARIANT: |
| 27 | 21782 | gtk-theme-config | 0 | 0 | 4 | Yes | NEEDS_RECIPE_DESIGN: |
| 28 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 29 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 30 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 31 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 32 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 33 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 34 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 35 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 36 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 37 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 38 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 39 | 14587 | asp | 0 | 0 | 6 | Yes | ARCH_SPECIFIC |
| 40 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 41 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 42 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 43 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 44 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 45 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 46 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 47 | 22584 | perl-math-clipper | 0 | 0 | 6 | Yes | COMPLEX_BUILD: |
| 48 | 17889 | slrn-snapshot-canlock | 0 | 0 | 6 | Yes | MISSING_DEP: |
| 49 | 41720 | smuxi-server | 0 | 0 | 6 | Yes | MISSING_DEP: |
| 50 | 27646 | vapoursynth-plugin-d2vsource-git | 0 | 0 | 6 | Yes | COMPLEX_BUILD: |
| 51 | 19936 | boost1.86-libs | 0 | 0 | 7 | Yes | OLD_VERSION_VARIANT: |
| 52 | 20944 | boost183-libs | 0 | 0 | 7 | Yes | OLD_VERSION_VARIANT: |
| 53 | 33221 | dotnet-runtime-5.0-bin | 0 | 0 | 7 | Yes | EOL_VERSION: |
| 54 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 55 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 56 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 57 | 35628 | llvm40-libs | 0 | 0 | 7 | Yes | OLD_VERSION_VARIANT: |
| 58 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 59 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 60 | 44133 | reduce-common | 0 | 0 | 7 | Yes | COMPLEX_BUILD: |
| 61 | 32716 | dotnet-runtime-6.0-bin | 0 | 0 | 8 | Yes | EOL_VERSION: |
| 62 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 63 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 64 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 65 | 17887 | oqsprovider-git | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 66 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 67 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 68 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 69 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 70 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 71 | 2254 | dropbox | 0 | 0 | 10 | Yes | PROPRIETARY_BINARY: |
| 72 | 17867 | erwise | 0 | 0 | 10 | Yes | NEEDS_INVESTIGATION: |
| 73 | 17825 | esp8266-rtos-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 74 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | - |
| 75 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | - |
| 76 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | - |
| 77 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | - |
| 78 | 17808 | plasma6-applets-panon | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 79 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 80 | 17860 | realvnc-rvnc-connect | 0 | 0 | 12 | Yes | PROPRIETARY_BINARY: |
| 81 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 82 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 83 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 84 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 85 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 86 | 1833 | vmware-workstation | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 87 | 17810 | better-control-git | 0 | 0 | 19 | Yes | NEEDS_INVESTIGATION: |
| 88 | 24418 | shadow-selinux | 0 | 0 | 19 | Yes | COMPLEX_BUILD: |
| 89 | 17804 | vinyl-git | 0 | 0 | 20 | Yes | DEP_RESOLUTION_FAILED: |
| 90 | 17261 | firestorm-next-bin | 0 | 0 | 22 | Yes | MULTILIB_UNSUPPORTED: |
| 91 | 17927 | pulseeffects-legacy | 0 | 0 | 22 | Yes | COMPLEX_BUILD: |
| 92 | 17914 | deadbeef-git | 0 | 0 | 27 | Yes | COMPLEX_BUILD: |
| 93 | 23279 | quartus-free-quartus | 0 | 0 | 27 | Yes | PROPRIETARY_PLATFORM: |
| 94 | 17424 | etlegacy32-mod | 0 | 0 | 30 | Yes | MULTILIB_UNSUPPORTED: |
| 95 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD: |
| 96 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 97 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 98 | 17346 | ffmpeg-cuda-full | 0 | 0 | 89 | Yes | CUDA_DEPENDENCY: |
