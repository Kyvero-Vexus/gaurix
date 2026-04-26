# Blocked Dependency Tree

**Generated:** 2026-04-26T10:29:15Z  
**Pass ID:** deptree-resolver-260426e  

## Summary

| Metric | Value |
|--------|-------|
| Total BLOCKED | 243 |
| In AUR cache | 238 |
| Zero blocked deps | 240 |

## Blocking Reason Distribution

| Reason | Count |
|--------|-------|
| DEP_RESOLUTION_FAILED | 66 |
| UNKNOWN | 48 |
| TOOLING_FAILURE | 21 |
| SOURCE_UNAVAILABLE | 14 |
| DISTRO_SPECIFIC | 13 |
| DKMS_KERNEL_MODULE | 11 |
| MINGW_CROSS_COMPILATION | 9 |
| MULTILIB_UNSUPPORTED | 7 |
| PROPRIETARY_BINARY | 6 |
| PLATFORM_UNSUPPORTED | 5 |
| AUR_REPO_DELETED | 5 |
| NEEDS_RECIPE_DESIGN | 4 |
| NON_DISTRIBUTABLE | 4 |
| COMPLEX_DEPS | 4 |
| COMPLEX_BUILD | 4 |
| GCC_SNAPSHOT_RUNTIME | 4 |
| KERNEL_SPECIFIC | 3 |
| SELINUX_SPECIFIC | 2 |
| KERNEL_MODULE | 2 |
| ABANDONED_UPSTREAM | 2 |
| PROPRIETARY_DEP | 2 |
| LEGACY_PYTHON2 | 2 |
| BROWSER_EXTENSION | 1 |
| CROSS_COMPILATION | 1 |
| MISSING_DEP | 1 |
| NEEDS_INVESTIGATION | 1 |
| PROPRIETARY_PLATFORM | 1 |

## Priority Queue (Top 200)

| Rank | Package | Blocked Deps | Reverse Deps | Total Deps | Reason |
|------|---------|-------------|-------------|-----------|--------|
| 1 | gradience | 0 | 1 | 0 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 2 | sudo-selinux | 0 | 1 | 8 | SELINUX_SPECIFIC (deptree-resolver-260426d) |
| 3 | base-selinux | 0 | 1 | 18 | SELINUX_SPECIFIC (deptree-resolver-260426d) |
| 4 | virtualbox-svn | 0 | 1 | 56 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 5 | deadbeef-mpris2-plugin | 0 | 0 | 0 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 6 | linux6.18.22-1-lts-bin | 0 | 0 | 0 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 7 | matlab-jre-bundled | 0 | 0 | 0 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 8 | sipgate-app-clinq | 0 | 0 | 0 | NEEDS_RECIPE_DESIGN (deptree-resolver-260426d) |
| 9 | squareline-studio | 0 | 0 | 0 | PROPRIETARY_BINARY (deptree-resolver-260426d) |
| 10 | aquacomputer_d5next-hwmon-dkms | 0 | 0 | 1 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 11 | bakkesmod-steam | 0 | 0 | 1 | PLATFORM_UNSUPPORTED (deptree-resolver-260426d) |
| 12 | edgeimpulse-cli | 0 | 0 | 1 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 13 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | BROWSER_EXTENSION (deptree-resolver-260426d) |
| 14 | luniistore | 0 | 0 | 1 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 15 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 16 | repacman | 0 | 0 | 1 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 17 | simplicity-commander | 0 | 0 | 1 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 18 | amneziawg-dkms-git | 0 | 0 | 2 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 19 | amneziawg-linux | 0 | 0 | 2 | DKMS_KERNEL_MODULE: AmneziaWG kernel module (deptree-resolver-260425f) |
| 20 | amneziawg-linux-hardened | 0 | 0 | 2 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 21 | android-platform-19 | 0 | 0 | 2 | PLATFORM_UNSUPPORTED (deptree-resolver-260426d) |
| 22 | android-platform-21 | 0 | 0 | 2 | PLATFORM_UNSUPPORTED (deptree-resolver-260426d) |
| 23 | aws-amplify-cli | 0 | 0 | 2 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 24 | brother-mfc-l2400dw | 0 | 0 | 2 | PROPRIETARY_BINARY (deptree-resolver-260426d) |
| 25 | emmet-language-server | 0 | 0 | 2 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 26 | findbrokenpkgs | 0 | 0 | 2 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 27 | ideapad-laptop-tb-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 28 | ideapad-laptop-tb2024g6plus-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 29 | knossu | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN (deptree-resolver-260426d) |
| 30 | libch343ser-git | 0 | 0 | 2 | KERNEL_MODULE (deptree-resolver-260426d) |
| 31 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | PROPRIETARY_BINARY (deptree-resolver-260426d) |
| 32 | mingw-w64-cblas | 0 | 0 | 2 | MINGW_CROSS_COMPILATION (deptree-resolver-260426d) |
| 33 | mingw-w64-lapack | 0 | 0 | 2 | MINGW_CROSS_COMPILATION (deptree-resolver-260426d) |
| 34 | mingw-w64-soundtouch | 0 | 0 | 2 | MINGW_CROSS_COMPILATION (deptree-resolver-260426d) |
| 35 | nodejs-cspell | 0 | 0 | 2 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 36 | osmtogeojson | 0 | 0 | 2 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 37 | pfring-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 38 | python-home-assistant-frontend | 0 | 0 | 2 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 39 | receitanet | 0 | 0 | 2 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 40 | sbctl-initcpio-post-hook | 0 | 0 | 2 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 41 | system-age | 0 | 0 | 2 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 42 | ttf-consolas-ligaturized | 0 | 0 | 2 | NON_DISTRIBUTABLE (deptree-resolver-260426d) |
| 43 | vscodium-marketplace | 0 | 0 | 2 | TOOLING_FAILURE (deptree-resolver-260426d) |
| 44 | wyc | 0 | 0 | 2 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 45 | aws-cdk | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 46 | java-language-server | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 47 | lib32-opencl-nvidia-390xx | 0 | 0 | 3 | MULTILIB_UNSUPPORTED (deptree-resolver-260426d) |
| 48 | libarchive-static | 0 | 0 | 3 | TOOLING_FAILURE (deptree-resolver-260426d) |
| 49 | lightdm-webkit-theme-aether | 0 | 0 | 3 | ABANDONED_UPSTREAM (deptree-resolver-260426d) |
| 50 | linux-keep-modules | 0 | 0 | 3 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 51 | nfuspire-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 52 | nodejs-nestjs-cli | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 53 | nvidia-bl-dkms | 0 | 0 | 3 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 54 | pacpak-git | 0 | 0 | 3 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 55 | phonon-qt4-vlc | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 56 | quartz-utils-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 57 | texmacs-pure | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 58 | chromium-extension-arch-search | 0 | 0 | 4 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 59 | eclipse-pydev | 0 | 0 | 4 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 60 | gephi-git | 0 | 0 | 4 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 61 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 62 | r8126-dkms | 0 | 0 | 4 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 63 | rdt-client | 0 | 0 | 4 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 64 | rtl88x2ce-dkms-git | 0 | 0 | 4 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 65 | urbanterror | 0 | 0 | 4 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 66 | ut2004-gog | 0 | 0 | 4 | NON_DISTRIBUTABLE (deptree-resolver-260426d) |
| 67 | zfs-linux-hardened-headers | 0 | 0 | 4 | KERNEL_SPECIFIC (deptree-resolver-260426d) |
| 68 | zfs-linux-rt-headers | 0 | 0 | 4 | KERNEL_SPECIFIC (deptree-resolver-260426d) |
| 69 | euroscope-bin | 0 | 0 | 5 | PLATFORM_UNSUPPORTED (deptree-resolver-260426d) |
| 70 | faustus-dkms-git | 0 | 0 | 5 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 71 | gbm | 0 | 0 | 5 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 72 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | CROSS_COMPILATION (deptree-resolver-260426d) |
| 73 | mailnaggertray-git | 0 | 0 | 5 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 74 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | TOOLING_FAILURE (deptree-resolver-260426d) |
| 75 | pulumi-git | 0 | 0 | 5 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 76 | python-gradio-pdf | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN (deptree-resolver-260426d) |
| 77 | python-jaxlib-bin | 0 | 0 | 5 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 78 | python-pypi2pkgbuild | 0 | 0 | 5 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 79 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | PROPRIETARY_DEP (deptree-resolver-260426d) |
| 80 | unrealtournament4 | 0 | 0 | 5 | NON_DISTRIBUTABLE (deptree-resolver-260426d) |
| 81 | zfs-linux-git-headers | 0 | 0 | 5 | KERNEL_SPECIFIC (deptree-resolver-260426d) |
| 82 | archwiki-offline | 0 | 0 | 6 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 83 | asp | 0 | 0 | 6 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 84 | awk-language-server | 0 | 0 | 6 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 85 | clash-for-windows-chinese | 0 | 0 | 6 | ABANDONED_UPSTREAM (deptree-resolver-260426d) |
| 86 | factorio-space-age-experimental | 0 | 0 | 6 | NON_DISTRIBUTABLE (deptree-resolver-260426d) |
| 87 | fileoptimizer-bin | 0 | 0 | 6 | PLATFORM_UNSUPPORTED (deptree-resolver-260426d) |
| 88 | futu-ftnn-wine | 0 | 0 | 6 | NEEDS_RECIPE_DESIGN (deptree-resolver-260426d) |
| 89 | lib32-libglade | 0 | 0 | 6 | MULTILIB_UNSUPPORTED (deptree-resolver-260426d) |
| 90 | mingw-w64-boost | 0 | 0 | 6 | MINGW_CROSS_COMPILATION (deptree-resolver-260426d) |
| 91 | mingw-w64-cppwinrt | 0 | 0 | 6 | MINGW_CROSS_COMPILATION (deptree-resolver-260426d) |
| 92 | mingw-w64-pcre2 | 0 | 0 | 6 | MINGW_CROSS_COMPILATION (deptree-resolver-260426d) |
| 93 | mingw-w64-spirv-tools | 0 | 0 | 6 | MINGW_CROSS_COMPILATION (deptree-resolver-260426d) |
| 94 | pamac-cli | 0 | 0 | 6 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 95 | vegastrike-git | 0 | 0 | 6 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 96 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | TOOLING_FAILURE (deptree-resolver-260426d) |
| 97 | arti-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: Tor in Rust; 200+ crate deps; next: requires vendored cra |
| 98 | inkdrop | 0 | 0 | 7 | PROPRIETARY_BINARY (deptree-resolver-260426d) |
| 99 | lib32-libxpm | 0 | 0 | 7 | MULTILIB_UNSUPPORTED: 32-bit X11 library (deptree-resolver-260424e) |
| 100 | logstash | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f-blocked-notes.scm (recipe-res |
| 101 | mingw-w64-postgresql | 0 | 0 | 7 | MINGW_CROSS_COMPILATION: requires mingw-w64 toolchain (deptree-resolver-260424e) |
| 102 | mkinitcpio-clevis-hook | 0 | 0 | 7 | TODO |
| 103 | obs-plugin-input-overlay-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: requires OBS SDK + libuiohook + Qt version matching (reci |
| 104 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: requires Plank Reloaded dev libs + Vala (recipe-resolver- |
| 105 | python2-gimp | 0 | 0 | 7 | LEGACY_PYTHON2: Python 2 EOL, GIMP 3.0 uses Python 3 (deptree-resolver-260424e) |
| 106 | wayprompt-git | 0 | 0 | 7 | TODO |
| 107 | wldash | 0 | 0 | 7 | BLOCKED |
| 108 | anytxt-bin | 0 | 0 | 8 | TODO |
| 109 | coreutils-arch | 0 | 0 | 8 | TOOLING_FAILURE: Arch-specific GNU coreutils arch command; already available in  |
| 110 | dxvk-async-git | 0 | 0 | 8 | TODO |
| 111 | eddiscovery | 0 | 0 | 8 | TODO |
| 112 | emerald | 0 | 0 | 8 | MISSING_DEP: requires compiz-core window manager, not in Guix (deptree-resolver- |
| 113 | glibc-eac | 0 | 0 | 8 | COMPLEX_DEPS: patched glibc with DT_HASH for EAC games (deptree-resolver-260424p |
| 114 | lib32-sdl_sound | 0 | 0 | 8 | MULTILIB_UNSUPPORTED: 32-bit SDL_sound library (deptree-resolver-260424p) |
| 115 | linux-gpib | 0 | 0 | 8 | KERNEL_MODULE: GPIB IEEE 488 kernel module, requires specific kernel (deptree-re |
| 116 | mingw-w64-lame | 0 | 0 | 8 | MINGW_CROSS_COMPILATION: LAME MP3 encoder for MinGW-w64 (deptree-resolver-260424 |
| 117 | pianoteq-stage | 0 | 0 | 8 | TODO |
| 118 | pikeru | 0 | 0 | 8 | TODO |
| 119 | prs | 0 | 0 | 8 | DEP_RESOLUTION_FAILED: Rust password manager; 80+ crate deps + GPG (recipe-resol |
| 120 | rocketchat-desktop | 0 | 0 | 8 | TODO |
| 121 | xeme-hg | 0 | 0 | 8 | SOURCE_UNAVAILABLE: Mercurial-only source; appears abandoned (recipe-resolver-26 |
| 122 | anyrun-git | 0 | 0 | 9 | COMPLEX_BUILD: Rust Wayland runner, requires cargo-inputs and gtk4-layer-shell ( |
| 123 | boost-python2 | 0 | 0 | 9 | LEGACY_PYTHON2: Boost.Python for Python 2, Python 2 is EOL (deptree-resolver-260 |
| 124 | frame-eth | 0 | 0 | 9 | DEP_RESOLUTION_FAILED: Web3/Ethereum wallet (Electron); massive npm deps; next:  |
| 125 | freetube-electron-git | 0 | 0 | 9 | COMPLEX_DEPS: requires Electron 41 and yarn Node.js build (deptree-resolver-2604 |
| 126 | go2tv | 0 | 0 | 9 | DEP_RESOLUTION_FAILED: Go DLNA tool; 40+ Go module deps; next: requires go modul |
| 127 | lib32-vkbasalt | 0 | 0 | 9 | TOOLING_FAILURE: 32-bit Vulkan layer; Guix does not support lib32 multilib; next |
| 128 | madness-interactive-reloaded | 0 | 0 | 9 | SOURCE_UNAVAILABLE: game distributed via itch.io; no direct download URL; next:  |
| 129 | mobirise | 0 | 0 | 9 | TODO |
| 130 | network-manager-applet-nolibappindicator | 0 | 0 | 9 | TODO |
| 131 | open-tv | 0 | 0 | 9 | TODO |
| 132 | pcem-git | 0 | 0 | 9 | DEP_RESOLUTION_FAILED: IBM PC emulator; SDL2 + OpenAL + custom HW emulation; nex |
| 133 | shijima-qt | 0 | 0 | 9 | DEP_RESOLUTION_FAILED: desktop pet app; Qt6 + custom animation framework; next:  |
| 134 | beignet-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: legacy Intel OpenCL; abandoned, requires LLVM 3.x-14 (rec |
| 135 | hnefatafl-copenhagen | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: Rust game client with niche crate deps (recipe-resolver-2 |
| 136 | libfive-studio-git | 0 | 0 | 10 | TODO |
| 137 | libga68-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME: GCC pre-release Algol68 runtime; Guix provides stable GCC  |
| 138 | libgfortran-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME: GCC pre-release Fortran runtime; Guix provides stable GCC  |
| 139 | libgnat-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME: GCC pre-release Ada runtime; Guix provides stable GCC runt |
| 140 | libgo-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME: GCC pre-release Go runtime; Guix provides stable GCC runti |
| 141 | linux-sched-ext-git-headers | 0 | 0 | 10 | TOOLING_FAILURE: custom kernel headers; Guix manages kernels separately (recipe- |
| 142 | linux-tip-git-headers | 0 | 0 | 10 | TOOLING_FAILURE: linux-next/tip kernel headers; Guix kernel model incompatible;  |
| 143 | mailspring | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f-blocked-notes.scm (recipe-res |
| 144 | nvidia-390xx-settings | 0 | 0 | 10 | TOOLING_FAILURE: NVIDIA 390xx legacy driver; requires proprietary NVIDIA stack ( |
| 145 | pantheon-polkit-agent-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: requires Pantheon desktop stack (granite, wingpanel); nex |
| 146 | pikaur-static | 0 | 0 | 10 | TODO |
| 147 | pikaur-static-git | 0 | 0 | 10 | TODO |
| 148 | vanilla-wiiu-git | 0 | 0 | 10 | TODO |
| 149 | ausweiskopie | 0 | 0 | 11 | SOURCE_UNAVAILABLE: German ID copy tool; no public repository or download URL fo |
| 150 | borgwarehouse | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f-blocked-notes.scm (recipe-res |
| 151 | fancy-cat | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: terminal PDF reader in Zig; requires Zig compiler; next:  |
| 152 | lto-dump-snapshot | 0 | 0 | 11 | TODO |
| 153 | principia-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: physics sandbox game; Box2D + SDL2 + custom engine; next: |
| 154 | synfigstudio-dev | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: dev branch requiring synfig-core + ETL + MLT + GTKmm + 30 |
| 155 | vegastrike-engine-git | 0 | 0 | 11 | TODO |
| 156 | vgmstream-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: game audio lib; 20+ codec deps; next: complex codec chain |
| 157 | virtualbox-bin-sdk | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: VirtualBox SDK; requires matching VirtualBox binary; next |
| 158 | vmd | 0 | 0 | 11 | TODO |
| 159 | webcord-vencord-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f-blocked-notes.scm (recipe-res |
| 160 | whatip-git | 0 | 0 | 11 | TODO |
| 161 | yt-x-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: terminal YouTube browser in Go/Rust; complex deps; next:  |
| 162 | envoyproxy | 0 | 0 | 12 | BLOCKED |
| 163 | gst-plugins-rs-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED: GStreamer + 200+ Rust crate deps; C/Rust interop (recipe- |
| 164 | linux-xanmod-lts-headers | 0 | 0 | 12 | TOOLING_FAILURE: custom kernel headers; Guix manages kernels separately (recipe- |
| 165 | luxtorpeda-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED: Steam Play tool in Rust; 100+ crate deps; next: requires  |
| 166 | mingw-w64-libopenmpt | 0 | 0 | 12 | TOOLING_FAILURE: mingw-w64 cross-compilation target; not applicable to Guix (rec |
| 167 | opendrop-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED: AirDrop implementation; requires OWL + custom net stack;  |
| 168 | python-google-cloud-speech | 0 | 0 | 12 | TODO |
| 169 | python-pylink-square | 0 | 0 | 12 | PROPRIETARY_DEP: Depends on proprietary SEGGER J-Link SDK (deptree-resolver-2604 |
| 170 | auracle-git | 0 | 0 | 13 | FAILED |
| 171 | betterx-desktop-git | 0 | 0 | 13 | TODO |
| 172 | capt-src | 0 | 0 | 13 | MULTILIB_UNSUPPORTED: Canon CAPT requires 32-bit binaries (deptree-resolver-2604 |
| 173 | devtools-git | 0 | 0 | 13 | TOOLING_FAILURE: Arch Linux package maintainer tools (makepkg); relies on pacman |
| 174 | glsmac-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED: SMAC reimplementation; C++ with SDL2 + custom scripting;  |
| 175 | limine-snapper-sync-git | 0 | 0 | 13 | SOURCE_UNAVAILABLE: Limine-Snapper sync script; repository not found at expected |
| 176 | prey | 0 | 0 | 13 | TODO |
| 177 | python-jax-rocm | 0 | 0 | 13 | ROCM_DEPENDENCY: requires full AMD ROCm stack (deptree-resolver-260424e) |
| 178 | cockatrice-server-git | 0 | 0 | 14 | TODO |
| 179 | goxlr-utility-ui | 0 | 0 | 14 | TODO |
| 180 | lincity-ng-git | 0 | 0 | 14 | DEP_RESOLUTION_FAILED: city sim game; SDL2_mixer + PhysFS + custom GUI; next: co |
| 181 | linux-cachyos-hardened-headers | 0 | 0 | 14 | TOOLING_FAILURE: CachyOS hardened kernel headers; Guix manages kernels through i |
| 182 | linux-next-git-headers | 0 | 0 | 14 | TOOLING_FAILURE: bleeding-edge kernel headers; Guix manages kernels separately ( |
| 183 | rpfm-git | 0 | 0 | 14 | COMPLEX_BUILD: Rust mod manager, requires cargo-inputs (deptree-resolver-260424p |
| 184 | aurutils | 0 | 0 | 15 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 185 | epub_to_audiobook-git | 0 | 0 | 15 | TODO |
| 186 | lightlyshaders-git | 0 | 0 | 15 | DEP_RESOLUTION_FAILED: KDE KWin effect; requires full KDE Frameworks 5 (recipe-r |
| 187 | linux-covolunablu-gaming-headers | 0 | 0 | 15 | TOOLING_FAILURE: custom gaming kernel headers; Guix manages kernels separately;  |
| 188 | panda3ds | 0 | 0 | 15 | DEP_RESOLUTION_FAILED: HLE 3DS emulator; complex C++ with Vulkan/OpenGL + 30+ de |
| 189 | php-legacy-pdlib | 0 | 0 | 15 | TODO |
| 190 | qt6-xcb-private-headers-git | 0 | 0 | 15 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f-blocked-notes.scm (recipe-res |
| 191 | scans2any-git | 0 | 0 | 15 | DEP_RESOLUTION_FAILED: scan converter in Rust; requires Typst + 40+ crate deps;  |
| 192 | yacreader-poppler-git | 0 | 0 | 15 | TODO |
| 193 | lcd4linux-git | 0 | 0 | 16 | DEP_RESOLUTION_FAILED: requires 15+ display driver libs not in Guix (recipe-reso |
| 194 | vmware-workstation | 0 | 0 | 16 | PROPRIETARY_BINARY: commercial, not redistributable (deptree-resolver-260424e) |
| 195 | gvfs-smb-git | 0 | 0 | 17 | DEP_RESOLUTION_FAILED: GVFS SMB backend; requires full GVFS build + Samba/CIFS;  |
| 196 | oclint | 0 | 0 | 17 | TODO |
| 197 | smoothpaper | 0 | 0 | 17 | BLOCKED |
| 198 | veloren | 0 | 0 | 17 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f-blocked-notes.scm (recipe-res |
| 199 | wayfire-plugins-extra-git | 0 | 0 | 17 | TODO |
| 200 | sddm-idle | 0 | 0 | 19 | TOOLING_FAILURE: SDDM display manager variant; requires deep system integration  |
