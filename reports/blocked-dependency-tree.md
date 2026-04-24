# Blocked Dependency Tree Report

Generated: 2026-04-24T16:17:36.107759+00:00
Pass: deptree-resolver-260424t
Selected: 100

## Summary

- Total blocked: 110
- In AUR cache: 110
- Not in cache: 0
- Zero blocked deps: 110

## Blocking Reasons

- COMPLEX_BUILD:: 17
- MINGW_CROSS_COMPILATION:: 9
- MISSING_DEP:: 8
- MULTILIB_UNSUPPORTED:: 7
- DEP_RESOLUTION_FAILED:: 6
- NEEDS_INVESTIGATION:: 6
- PROPRIETARY_BINARY:: 5
- DISTRO_SPECIFIC:: 5
- COMPLEX_DEPS:: 5
- null: 5
- SOURCE_UNAVAILABLE:: 4
- OLD_VERSION_VARIANT:: 4
- LEGACY_PYTHON2:: 4
- BUILD_FAILED:: 3
- KERNEL_SPECIFIC:: 3
- ANDROID_SDK_PLATFORM:: 2
- LICENSE_REVIEW_NEEDED:: 2
- KERNEL_MODULE:: 2
- EOL_VERSION:: 2
- PLATFORM_UNSUPPORTED:: 1
- OLD_ELECTRON:: 1
- ABANDONED_UPSTREAM:: 1
- NEEDS_RECIPE_DESIGN:: 1
- CROSS_COMPILATION:: 1
- ARCH_SPECIFIC:: 1
- NON_DISTRIBUTABLE:: 1
- DISTRO_SPECIFIC: 1
- ROCM_DEPENDENCY:: 1
- PROPRIETARY_PLATFORM:: 1
- CUDA_DEPENDENCY:: 1

## Priority Queue (Top 200)

| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR | Fail Reason |
|------|---|---------|-------------|-------------|-----------|--------|-------------|
| 1 | 19246 | elp | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 2 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 3 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 4 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 5 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 6 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 7 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 8 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 9 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 10 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 11 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 12 | 17835 | minikube-git | 0 | 0 | 2 | Yes | COMPLEX_BUILD: |
| 13 | 17942 | redlib-git | 0 | 0 | 2 | Yes | COMPLEX_BUILD: |
| 14 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 15 | 17970 | electron23-bin | 0 | 0 | 3 | Yes | OLD_ELECTRON: |
| 16 | 17796 | heroku-cli | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 17 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 18 | 17834 | mycorrhiza-git | 0 | 0 | 3 | Yes | COMPLEX_BUILD: |
| 19 | 17807 | n8n | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 20 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | BUILD_FAILED: |
| 21 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 22 | 17879 | slxfig-snapshot | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 23 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 24 | 17851 | thanos | 0 | 0 | 3 | Yes | COMPLEX_BUILD: |
| 25 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 26 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 27 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | MISSING_DEP: |
| 28 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 29 | 26185 | gcc8 | 0 | 0 | 4 | Yes | OLD_VERSION_VARIANT: |
| 30 | 21782 | gtk-theme-config | 0 | 0 | 4 | Yes | NEEDS_RECIPE_DESIGN: |
| 31 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 32 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 33 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 34 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 35 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 36 | 33165 | dashpay-bls-signatures | 0 | 0 | 5 | Yes | COMPLEX_DEPS: |
| 37 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 38 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 39 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 40 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 41 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 42 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 43 | 14587 | asp | 0 | 0 | 6 | Yes | ARCH_SPECIFIC: |
| 44 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 45 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 46 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 47 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 48 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 49 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 50 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 51 | 22584 | perl-math-clipper | 0 | 0 | 6 | Yes | COMPLEX_BUILD: |
| 52 | 36263 | rsdkv4-bin | 0 | 0 | 6 | Yes | COMPLEX_BUILD: |
| 53 | 17889 | slrn-snapshot-canlock | 0 | 0 | 6 | Yes | MISSING_DEP: |
| 54 | 41720 | smuxi-server | 0 | 0 | 6 | Yes | MISSING_DEP: |
| 55 | 27646 | vapoursynth-plugin-d2vsource-git | 0 | 0 | 6 | Yes | COMPLEX_BUILD: |
| 56 | 19936 | boost1.86-libs | 0 | 0 | 7 | Yes | OLD_VERSION_VARIANT: |
| 57 | 20944 | boost183-libs | 0 | 0 | 7 | Yes | OLD_VERSION_VARIANT: |
| 58 | 33221 | dotnet-runtime-5.0-bin | 0 | 0 | 7 | Yes | EOL_VERSION: |
| 59 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 60 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 61 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 62 | 35628 | llvm40-libs | 0 | 0 | 7 | Yes | OLD_VERSION_VARIANT: |
| 63 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 64 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 65 | 44133 | reduce-common | 0 | 0 | 7 | Yes | COMPLEX_BUILD: |
| 66 | 32716 | dotnet-runtime-6.0-bin | 0 | 0 | 8 | Yes | EOL_VERSION: |
| 67 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 68 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 69 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 70 | 44420 | ocaml-lablgl | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 71 | 17887 | oqsprovider-git | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 72 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 73 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 74 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 75 | 17953 | python-pylibssh | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 76 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 77 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 78 | 2254 | dropbox | 0 | 0 | 10 | Yes | PROPRIETARY_BINARY: |
| 79 | 17867 | erwise | 0 | 0 | 10 | Yes | NEEDS_INVESTIGATION: |
| 80 | 17825 | esp8266-rtos-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 81 | 21572 | ipe | 0 | 0 | 10 | Yes | COMPLEX_BUILD: |
| 82 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | - |
| 83 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | - |
| 84 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | - |
| 85 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | - |
| 86 | 17808 | plasma6-applets-panon | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 87 | 17915 | fht-share-picker-git | 0 | 0 | 11 | Yes | NEEDS_INVESTIGATION: |
| 88 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 89 | 17916 | fht-compositor | 0 | 0 | 12 | Yes | NEEDS_INVESTIGATION: |
| 90 | 17860 | realvnc-rvnc-connect | 0 | 0 | 12 | Yes | PROPRIETARY_BINARY: |
| 91 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 92 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 93 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 94 | 45739 | llvm19 | 0 | 0 | 14 | Yes | - |
| 95 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 96 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 97 | 17932 | libxfce4ui-devel | 0 | 0 | 15 | Yes | NEEDS_INVESTIGATION: |
| 98 | 1833 | vmware-workstation | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 99 | 17810 | better-control-git | 0 | 0 | 19 | Yes | NEEDS_INVESTIGATION: |
| 100 | 24418 | shadow-selinux | 0 | 0 | 19 | Yes | COMPLEX_BUILD: |
| 101 | 17804 | vinyl-git | 0 | 0 | 20 | Yes | DEP_RESOLUTION_FAILED: |
| 102 | 17261 | firestorm-next-bin | 0 | 0 | 22 | Yes | MULTILIB_UNSUPPORTED: |
| 103 | 17927 | pulseeffects-legacy | 0 | 0 | 22 | Yes | COMPLEX_BUILD: |
| 104 | 17914 | deadbeef-git | 0 | 0 | 27 | Yes | COMPLEX_BUILD: |
| 105 | 23279 | quartus-free-quartus | 0 | 0 | 27 | Yes | PROPRIETARY_PLATFORM: |
| 106 | 17424 | etlegacy32-mod | 0 | 0 | 30 | Yes | MULTILIB_UNSUPPORTED: |
| 107 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD: |
| 108 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 109 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 110 | 17346 | ffmpeg-cuda-full | 0 | 0 | 89 | Yes | CUDA_DEPENDENCY: |

## Full Queue

| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR | Fail Reason |
|------|---|---------|-------------|-------------|-----------|--------|-------------|
| 1 | 19246 | elp | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 2 | 17812 | squareline-studio | 0 | 0 | 0 | Yes | SOURCE_UNAVAILABLE: |
| 3 | 17468 | bakkesmod-steam | 0 | 0 | 1 | Yes | PLATFORM_UNSUPPORTED: |
| 4 | 28671 | android-platform-19 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 5 | 23109 | android-platform-21 | 0 | 0 | 2 | Yes | ANDROID_SDK_PLATFORM: |
| 6 | 17797 | brother-mfc-l2400dw | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 7 | 17502 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | Yes | MULTILIB_UNSUPPORTED: |
| 8 | 17880 | libch343ser-git | 0 | 0 | 2 | Yes | KERNEL_MODULE: |
| 9 | 17912 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | Yes | PROPRIETARY_BINARY: |
| 10 | 34115 | mingw-w64-cblas | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 11 | 34113 | mingw-w64-lapack | 0 | 0 | 2 | Yes | MINGW_CROSS_COMPILATION: |
| 12 | 17835 | minikube-git | 0 | 0 | 2 | Yes | COMPLEX_BUILD: |
| 13 | 17942 | redlib-git | 0 | 0 | 2 | Yes | COMPLEX_BUILD: |
| 14 | 20499 | ttf-consolas-ligaturized | 0 | 0 | 2 | Yes | LICENSE_REVIEW_NEEDED: |
| 15 | 17970 | electron23-bin | 0 | 0 | 3 | Yes | OLD_ELECTRON: |
| 16 | 17796 | heroku-cli | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 17 | 19028 | lightdm-webkit-theme-aether | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 18 | 17834 | mycorrhiza-git | 0 | 0 | 3 | Yes | COMPLEX_BUILD: |
| 19 | 17807 | n8n | 0 | 0 | 3 | Yes | DEP_RESOLUTION_FAILED: |
| 20 | 17755 | nvidia-bl-dkms | 0 | 0 | 3 | Yes | BUILD_FAILED: |
| 21 | 17862 | pacpak-git | 0 | 0 | 3 | Yes | DISTRO_SPECIFIC: |
| 22 | 17879 | slxfig-snapshot | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 23 | 17873 | texmacs-pure | 0 | 0 | 3 | Yes | MISSING_DEP: |
| 24 | 17851 | thanos | 0 | 0 | 3 | Yes | COMPLEX_BUILD: |
| 25 | 17897 | chromium-extension-arch-search | 0 | 0 | 4 | Yes | DISTRO_SPECIFIC: |
| 26 | 17433 | clash-for-windows-chinese | 0 | 0 | 4 | Yes | ABANDONED_UPSTREAM: |
| 27 | 17948 | eclipse-pydev | 0 | 0 | 4 | Yes | MISSING_DEP: |
| 28 | 17945 | euroscope-bin | 0 | 0 | 4 | Yes | SOURCE_UNAVAILABLE: |
| 29 | 26185 | gcc8 | 0 | 0 | 4 | Yes | OLD_VERSION_VARIANT: |
| 30 | 21782 | gtk-theme-config | 0 | 0 | 4 | Yes | NEEDS_RECIPE_DESIGN: |
| 31 | 25121 | mingw-w64-sqlite | 0 | 0 | 4 | Yes | MINGW_CROSS_COMPILATION: |
| 32 | 25153 | python2-wxpython3 | 0 | 0 | 4 | Yes | LEGACY_PYTHON2: |
| 33 | 18421 | qtspim-iconfix | 0 | 0 | 4 | Yes | BUILD_FAILED: |
| 34 | 17921 | zfs-linux-hardened-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 35 | 17920 | zfs-linux-rt-headers | 0 | 0 | 4 | Yes | KERNEL_SPECIFIC: |
| 36 | 33165 | dashpay-bls-signatures | 0 | 0 | 5 | Yes | COMPLEX_DEPS: |
| 37 | 17819 | inkdrop | 0 | 0 | 5 | Yes | SOURCE_UNAVAILABLE: |
| 38 | 17909 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | Yes | CROSS_COMPILATION: |
| 39 | 17940 | pamac-cli | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 40 | 17822 | python-pypi2pkgbuild | 0 | 0 | 5 | Yes | DISTRO_SPECIFIC: |
| 41 | 37854 | python2-dbus | 0 | 0 | 5 | Yes | LEGACY_PYTHON2: |
| 42 | 17919 | zfs-linux-git-headers | 0 | 0 | 5 | Yes | KERNEL_SPECIFIC: |
| 43 | 14587 | asp | 0 | 0 | 6 | Yes | ARCH_SPECIFIC: |
| 44 | 11354 | aurutils | 0 | 0 | 6 | Yes | DISTRO_SPECIFIC: |
| 45 | 17440 | factorio-space-age-experimental | 0 | 0 | 6 | Yes | NON_DISTRIBUTABLE: |
| 46 | 45410 | lib32-libglade | 0 | 0 | 6 | Yes | MULTILIB_UNSUPPORTED: |
| 47 | 23783 | mingw-w64-boost | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 48 | 43750 | mingw-w64-cppwinrt | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 49 | 26805 | mingw-w64-pcre2 | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 50 | 42666 | mingw-w64-spirv-tools | 0 | 0 | 6 | Yes | MINGW_CROSS_COMPILATION: |
| 51 | 22584 | perl-math-clipper | 0 | 0 | 6 | Yes | COMPLEX_BUILD: |
| 52 | 36263 | rsdkv4-bin | 0 | 0 | 6 | Yes | COMPLEX_BUILD: |
| 53 | 17889 | slrn-snapshot-canlock | 0 | 0 | 6 | Yes | MISSING_DEP: |
| 54 | 41720 | smuxi-server | 0 | 0 | 6 | Yes | MISSING_DEP: |
| 55 | 27646 | vapoursynth-plugin-d2vsource-git | 0 | 0 | 6 | Yes | COMPLEX_BUILD: |
| 56 | 19936 | boost1.86-libs | 0 | 0 | 7 | Yes | OLD_VERSION_VARIANT: |
| 57 | 20944 | boost183-libs | 0 | 0 | 7 | Yes | OLD_VERSION_VARIANT: |
| 58 | 33221 | dotnet-runtime-5.0-bin | 0 | 0 | 7 | Yes | EOL_VERSION: |
| 59 | 24719 | glibc-eac | 0 | 0 | 7 | Yes | COMPLEX_DEPS: |
| 60 | 16491 | lib32-libxpm | 0 | 0 | 7 | Yes | MULTILIB_UNSUPPORTED: |
| 61 | 20547 | linux-gpib | 0 | 0 | 7 | Yes | KERNEL_MODULE: |
| 62 | 35628 | llvm40-libs | 0 | 0 | 7 | Yes | OLD_VERSION_VARIANT: |
| 63 | 24572 | mingw-w64-postgresql | 0 | 0 | 7 | Yes | MINGW_CROSS_COMPILATION: |
| 64 | 23210 | python2-gimp | 0 | 0 | 7 | Yes | LEGACY_PYTHON2: |
| 65 | 44133 | reduce-common | 0 | 0 | 7 | Yes | COMPLEX_BUILD: |
| 66 | 32716 | dotnet-runtime-6.0-bin | 0 | 0 | 8 | Yes | EOL_VERSION: |
| 67 | 22333 | emerald | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 68 | 22729 | lib32-sdl_sound | 0 | 0 | 8 | Yes | MULTILIB_UNSUPPORTED: |
| 69 | 34112 | mingw-w64-lame | 0 | 0 | 8 | Yes | MINGW_CROSS_COMPILATION: |
| 70 | 44420 | ocaml-lablgl | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 71 | 17887 | oqsprovider-git | 0 | 0 | 8 | Yes | MISSING_DEP: |
| 72 | 17933 | anyrun-git | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 73 | 37225 | boost-python2 | 0 | 0 | 9 | Yes | LEGACY_PYTHON2: |
| 74 | 17925 | freetube-electron-git | 0 | 0 | 9 | Yes | COMPLEX_DEPS: |
| 75 | 17953 | python-pylibssh | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 76 | 21233 | python-pylink-square | 0 | 0 | 9 | Yes | COMPLEX_BUILD: |
| 77 | 2160 | auracle-git | 0 | 0 | 10 | Yes | DISTRO_SPECIFIC |
| 78 | 2254 | dropbox | 0 | 0 | 10 | Yes | PROPRIETARY_BINARY: |
| 79 | 17867 | erwise | 0 | 0 | 10 | Yes | NEEDS_INVESTIGATION: |
| 80 | 17825 | esp8266-rtos-sdk | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 81 | 21572 | ipe | 0 | 0 | 10 | Yes | COMPLEX_BUILD: |
| 82 | 19629 | libga68-snapshot | 0 | 0 | 10 | Yes | - |
| 83 | 19625 | libgfortran-snapshot | 0 | 0 | 10 | Yes | - |
| 84 | 19623 | libgnat-snapshot | 0 | 0 | 10 | Yes | - |
| 85 | 19622 | libgo-snapshot | 0 | 0 | 10 | Yes | - |
| 86 | 17808 | plasma6-applets-panon | 0 | 0 | 10 | Yes | DEP_RESOLUTION_FAILED: |
| 87 | 17915 | fht-share-picker-git | 0 | 0 | 11 | Yes | NEEDS_INVESTIGATION: |
| 88 | 17824 | envoyproxy | 0 | 0 | 12 | Yes | BUILD_FAILED: |
| 89 | 17916 | fht-compositor | 0 | 0 | 12 | Yes | NEEDS_INVESTIGATION: |
| 90 | 17860 | realvnc-rvnc-connect | 0 | 0 | 12 | Yes | PROPRIETARY_BINARY: |
| 91 | 17255 | capt-src | 0 | 0 | 13 | Yes | MULTILIB_UNSUPPORTED: |
| 92 | 17937 | illogical-impulse-ags | 0 | 0 | 13 | Yes | NEEDS_INVESTIGATION: |
| 93 | 17278 | python-jax-rocm | 0 | 0 | 13 | Yes | ROCM_DEPENDENCY: |
| 94 | 45739 | llvm19 | 0 | 0 | 14 | Yes | - |
| 95 | 17833 | rpfm-git | 0 | 0 | 14 | Yes | COMPLEX_BUILD: |
| 96 | 35454 | deepin-wine8-stable | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 97 | 17932 | libxfce4ui-devel | 0 | 0 | 15 | Yes | NEEDS_INVESTIGATION: |
| 98 | 1833 | vmware-workstation | 0 | 0 | 15 | Yes | PROPRIETARY_BINARY: |
| 99 | 17810 | better-control-git | 0 | 0 | 19 | Yes | NEEDS_INVESTIGATION: |
| 100 | 24418 | shadow-selinux | 0 | 0 | 19 | Yes | COMPLEX_BUILD: |
| 101 | 17804 | vinyl-git | 0 | 0 | 20 | Yes | DEP_RESOLUTION_FAILED: |
| 102 | 17261 | firestorm-next-bin | 0 | 0 | 22 | Yes | MULTILIB_UNSUPPORTED: |
| 103 | 17927 | pulseeffects-legacy | 0 | 0 | 22 | Yes | COMPLEX_BUILD: |
| 104 | 17914 | deadbeef-git | 0 | 0 | 27 | Yes | COMPLEX_BUILD: |
| 105 | 23279 | quartus-free-quartus | 0 | 0 | 27 | Yes | PROPRIETARY_PLATFORM: |
| 106 | 17424 | etlegacy32-mod | 0 | 0 | 30 | Yes | MULTILIB_UNSUPPORTED: |
| 107 | 17814 | audacious-plugins-git | 0 | 0 | 32 | Yes | COMPLEX_BUILD: |
| 108 | 22161 | darling-cli-devenv-gui-common-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 109 | 22171 | darling-iosurface-git | 0 | 0 | 41 | Yes | COMPLEX_DEPS: |
| 110 | 17346 | ffmpeg-cuda-full | 0 | 0 | 89 | Yes | CUDA_DEPENDENCY: |
