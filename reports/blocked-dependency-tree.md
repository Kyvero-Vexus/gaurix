# Blocked Dependency Tree

**Generated:** 2026-04-26T09:02:49Z  
**Pass ID:** deptree-resolver-260426d  

## Summary

| Metric | Value |
|--------|-------|
| Total BLOCKED | 245 |
| In AUR cache | 240 |
| Zero blocked deps | 242 |

## Blocking Reason Distribution

| Reason | Count |
|--------|-------|
| DEP_RESOLUTION_FAILED | 100 |
| TOOLING_FAILURE | 24 |
| SOURCE_UNAVAILABLE | 15 |
| DISTRO_SPECIFIC | 14 |
| DKMS_KERNEL_MODULE | 11 |
| MINGW_CROSS_COMPILATION | 9 |
| PROPRIETARY_BINARY | 6 |
| MULTILIB_UNSUPPORTED | 6 |
| PLATFORM_UNSUPPORTED | 5 |
| LICENSE_REVIEW_NEEDED | 5 |
| AUR_REPO_DELETED | 5 |
| NEEDS_RECIPE_DESIGN | 4 |
| NON_DISTRIBUTABLE | 4 |
| COMPLEX_DEPS | 4 |
| COMPLEX_BUILD | 4 |
| GCC_SNAPSHOT_RUNTIME | 4 |
| KERNEL_SPECIFIC | 3 |
| BUILD_FAILED | 3 |
| HARDWARE_SPECIFIC | 3 |
| SELINUX_SPECIFIC | 2 |
| KERNEL_MODULE | 2 |
| ABANDONED_UPSTREAM | 2 |
| PROPRIETARY_DEP | 2 |
| LEGACY_PYTHON2 | 2 |
| BROWSER_EXTENSION | 1 |
| CROSS_COMPILATION | 1 |
| ARCH_SPECIFIC | 1 |
| MISSING_DEP | 1 |
| NEEDS_INVESTIGATION | 1 |
| PROPRIETARY_PLATFORM | 1 |

## Priority Queue (Top 200)

| Rank | Package | Blocked Deps | Reverse Deps | Total Deps | Reason |
|------|---------|-------------|-------------|-----------|--------|
| 1 | gradience | 0 | 1 | 0 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 2 | sudo-selinux | 0 | 1 | 8 | SELINUX_SPECIFIC (deptree-resolver-260426d) |
| 3 | base-selinux | 0 | 1 | 18 | SELINUX_SPECIFIC (deptree-resolver-260426d) |
| 4 | virtualbox-svn | 0 | 1 | 53 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 5 | deadbeef-mpris2-plugin | 0 | 0 | 0 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 6 | linux6.18.22-1-lts-bin | 0 | 0 | 0 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 7 | matlab-jre-bundled | 0 | 0 | 0 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 8 | sipgate-app-clinq | 0 | 0 | 0 | NEEDS_RECIPE_DESIGN (deptree-resolver-260426d) |
| 9 | squareline-studio | 0 | 0 | 0 | PROPRIETARY_BINARY |
| 10 | aquacomputer_d5next-hwmon-dkms | 0 | 0 | 1 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 11 | bakkesmod-steam | 0 | 0 | 1 | PLATFORM_UNSUPPORTED |
| 12 | edgeimpulse-cli | 0 | 0 | 1 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 13 | librewolf-extension-ublock-origin-bin | 0 | 0 | 1 | BROWSER_EXTENSION (deptree-resolver-260426d) |
| 14 | luniistore | 0 | 0 | 1 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 15 | mkinitcpio-systemd-root-password | 0 | 0 | 1 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 16 | repacman | 0 | 0 | 1 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 17 | simplicity-commander | 0 | 0 | 1 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 18 | amneziawg-dkms-git | 0 | 0 | 2 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 19 | amneziawg-linux | 0 | 0 | 2 | DKMS_KERNEL_MODULE: AmneziaWG kernel module (deptree-resolve |
| 20 | amneziawg-linux-hardened | 0 | 0 | 2 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 21 | android-platform-19 | 0 | 0 | 2 | PLATFORM_UNSUPPORTED |
| 22 | android-platform-21 | 0 | 0 | 2 | PLATFORM_UNSUPPORTED |
| 23 | archwiki-offline | 0 | 0 | 2 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 24 | aws-amplify-cli | 0 | 0 | 2 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 25 | aws-cdk | 0 | 0 | 2 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 26 | brother-mfc-l2400dw | 0 | 0 | 2 | PROPRIETARY_BINARY |
| 27 | emmet-language-server | 0 | 0 | 2 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 28 | faustus-dkms-git | 0 | 0 | 2 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 29 | findbrokenpkgs | 0 | 0 | 2 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 30 | ideapad-laptop-tb-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 31 | ideapad-laptop-tb2024g6plus-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 32 | knossu | 0 | 0 | 2 | NEEDS_RECIPE_DESIGN (deptree-resolver-260426d) |
| 33 | lib32-opencl-nvidia-390xx | 0 | 0 | 2 | MULTILIB_UNSUPPORTED |
| 34 | libch343ser-git | 0 | 0 | 2 | KERNEL_MODULE (deptree-resolver-260426d) |
| 35 | libfprint-2-tod1-broadcom-cv3plus | 0 | 0 | 2 | PROPRIETARY_BINARY (deptree-resolver-260426d) |
| 36 | mingw-w64-cblas | 0 | 0 | 2 | MINGW_CROSS_COMPILATION |
| 37 | mingw-w64-lapack | 0 | 0 | 2 | MINGW_CROSS_COMPILATION |
| 38 | mingw-w64-soundtouch | 0 | 0 | 2 | MINGW_CROSS_COMPILATION (deptree-resolver-260426d) |
| 39 | nodejs-cspell | 0 | 0 | 2 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 40 | osmtogeojson | 0 | 0 | 2 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 41 | pfring-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 42 | python-home-assistant-frontend | 0 | 0 | 2 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 43 | r8126-dkms | 0 | 0 | 2 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 44 | receitanet | 0 | 0 | 2 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 45 | sbctl-initcpio-post-hook | 0 | 0 | 2 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 46 | system-age | 0 | 0 | 2 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 47 | ttf-consolas-ligaturized | 0 | 0 | 2 | NON_DISTRIBUTABLE |
| 48 | vscodium-marketplace | 0 | 0 | 2 | TOOLING_FAILURE (deptree-resolver-260426d) |
| 49 | wyc | 0 | 0 | 2 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 50 | java-language-server | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 51 | libarchive-static | 0 | 0 | 3 | TOOLING_FAILURE (deptree-resolver-260426d) |
| 52 | lightdm-webkit-theme-aether | 0 | 0 | 3 | ABANDONED_UPSTREAM |
| 53 | linux-keep-modules | 0 | 0 | 3 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 54 | nfuspire-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 55 | nodejs-nestjs-cli | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 56 | nvidia-bl-dkms | 0 | 0 | 3 | DKMS_KERNEL_MODULE |
| 57 | pacpak-git | 0 | 0 | 3 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 58 | phonon-qt4-vlc | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 59 | quartz-utils-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 60 | rdt-client | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 61 | sommelier-git | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 62 | texmacs-pure | 0 | 0 | 3 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 63 | chromium-extension-arch-search | 0 | 0 | 4 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 64 | clash-for-windows-chinese | 0 | 0 | 4 | ABANDONED_UPSTREAM |
| 65 | eclipse-pydev | 0 | 0 | 4 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 66 | euroscope-bin | 0 | 0 | 4 | PLATFORM_UNSUPPORTED |
| 67 | gbm | 0 | 0 | 4 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 68 | gephi-git | 0 | 0 | 4 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 69 | plugin-autenticacao-gov-pt | 0 | 0 | 4 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 70 | rtl88x2ce-dkms-git | 0 | 0 | 4 | DKMS_KERNEL_MODULE (deptree-resolver-260426d) |
| 71 | urbanterror | 0 | 0 | 4 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 72 | ut2004-gog | 0 | 0 | 4 | NON_DISTRIBUTABLE (deptree-resolver-260426d) |
| 73 | zfs-linux-hardened-headers | 0 | 0 | 4 | KERNEL_SPECIFIC (deptree-resolver-260426d) |
| 74 | zfs-linux-rt-headers | 0 | 0 | 4 | KERNEL_SPECIFIC (deptree-resolver-260426d) |
| 75 | futu-ftnn-wine | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN (deptree-resolver-260426d) |
| 76 | inkdrop | 0 | 0 | 5 | PROPRIETARY_BINARY |
| 77 | kamilsss655-uv-k5-firmware-custom-git | 0 | 0 | 5 | CROSS_COMPILATION (deptree-resolver-260426d) |
| 78 | mailnaggertray-git | 0 | 0 | 5 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 79 | nvidia-open-tinygrad-dkms-git | 0 | 0 | 5 | TOOLING_FAILURE (deptree-resolver-260426d) |
| 80 | pamac-cli | 0 | 0 | 5 | DISTRO_SPECIFIC |
| 81 | pulumi-git | 0 | 0 | 5 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 82 | python-gradio-pdf | 0 | 0 | 5 | NEEDS_RECIPE_DESIGN (deptree-resolver-260426d) |
| 83 | python-jaxlib-bin | 0 | 0 | 5 | SOURCE_UNAVAILABLE (deptree-resolver-260426d) |
| 84 | python-pypi2pkgbuild | 0 | 0 | 5 | DISTRO_SPECIFIC (deptree-resolver-260426d) |
| 85 | soapysdrplay3-luarvique-git | 0 | 0 | 5 | PROPRIETARY_DEP (deptree-resolver-260426d) |
| 86 | unrealtournament4 | 0 | 0 | 5 | NON_DISTRIBUTABLE (deptree-resolver-260426d) |
| 87 | zfs-linux-git-headers | 0 | 0 | 5 | KERNEL_SPECIFIC (deptree-resolver-260426d) |
| 88 | asp | 0 | 0 | 6 | DISTRO_SPECIFIC |
| 89 | aurutils | 0 | 0 | 6 | DISTRO_SPECIFIC |
| 90 | awk-language-server | 0 | 0 | 6 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 91 | factorio-space-age-experimental | 0 | 0 | 6 | NON_DISTRIBUTABLE |
| 92 | fileoptimizer-bin | 0 | 0 | 6 | PLATFORM_UNSUPPORTED (deptree-resolver-260426d) |
| 93 | lib32-libglade | 0 | 0 | 6 | MULTILIB_UNSUPPORTED |
| 94 | mingw-w64-boost | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 95 | mingw-w64-cppwinrt | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 96 | mingw-w64-pcre2 | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 97 | mingw-w64-spirv-tools | 0 | 0 | 6 | MINGW_CROSS_COMPILATION |
| 98 | vegastrike-git | 0 | 0 | 6 | DEP_RESOLUTION_FAILED (deptree-resolver-260426d) |
| 99 | vivaldi-autoinject-custom-js-ui | 0 | 0 | 6 | TOOLING_FAILURE (deptree-resolver-260426d) |
| 100 | arti-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: Tor in Rust; 200+ crate deps; next: r |
| 101 | dxvk-async-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: needs Mingw-w64 cross-compilation + W |
| 102 | eddiscovery | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: .NET/Mono not available (recipe-resol |
| 103 | fido2-hid-bridge | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: FIDO2 HID bridge; requires custom HID |
| 104 | glibc-eac | 0 | 0 | 7 | COMPLEX_DEPS: patched glibc with DT_HASH for EAC games (dept |
| 105 | lib32-libxpm | 0 | 0 | 7 | MULTILIB_UNSUPPORTED |
| 106 | limine-snapper-sync-git | 0 | 0 | 7 | SOURCE_UNAVAILABLE: Limine-Snapper sync script; repository n |
| 107 | linux-gpib | 0 | 0 | 7 | KERNEL_MODULE: GPIB IEEE 488 kernel module, requires specifi |
| 108 | logstash | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f-blocked-n |
| 109 | mingw-w64-postgresql | 0 | 0 | 7 | MINGW_CROSS_COMPILATION |
| 110 | mkinitcpio-clevis-hook | 0 | 0 | 7 | ARCH_SPECIFIC: mkinitcpio hook; not applicable to Guix Syste |
| 111 | obs-plugin-input-overlay-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: requires OBS SDK + libuiohook + Qt ve |
| 112 | pikeru | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: Rust/GTK4 100+ crate deps (recipe-res |
| 113 | plank-reloaded-docklet-picky-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: requires Plank Reloaded dev libs + Va |
| 114 | prs | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: Rust password manager; 80+ crate deps |
| 115 | python2-gimp | 0 | 0 | 7 | LEGACY_PYTHON2 |
| 116 | wayprompt-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: Zig compiler not in Guix (recipe-reso |
| 117 | wldash | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: Rust Wayland; 50+ cargo deps + waylan |
| 118 | yt-x-git | 0 | 0 | 7 | DEP_RESOLUTION_FAILED: terminal YouTube browser in Go/Rust;  |
| 119 | anytxt-bin | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED: freeware redistribution unclear (reci |
| 120 | coreutils-arch | 0 | 0 | 8 | TOOLING_FAILURE: Arch-specific GNU coreutils arch command; a |
| 121 | emerald | 0 | 0 | 8 | MISSING_DEP: requires compiz-core window manager, not in Gui |
| 122 | go2tv | 0 | 0 | 8 | DEP_RESOLUTION_FAILED: Go DLNA tool; 40+ Go module deps; nex |
| 123 | lib32-sdl_sound | 0 | 0 | 8 | MULTILIB_UNSUPPORTED: 32-bit SDL_sound library (deptree-reso |
| 124 | mingw-w64-lame | 0 | 0 | 8 | MINGW_CROSS_COMPILATION: LAME MP3 encoder for MinGW-w64 (dep |
| 125 | pianoteq-stage | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED: proprietary commercial VST (recipe-re |
| 126 | pikaur-static | 0 | 0 | 8 | TOOLING_FAILURE: AUR helper; pacman-specific, not applicable |
| 127 | pikaur-static-git | 0 | 0 | 8 | TOOLING_FAILURE: AUR helper; pacman-specific, not applicable |
| 128 | rocketchat-desktop | 0 | 0 | 8 | DEP_RESOLUTION_FAILED: Electron app with massive npm dep tre |
| 129 | vmd | 0 | 0 | 8 | LICENSE_REVIEW_NEEDED: custom UIUC license restricts redistr |
| 130 | webcord-vencord-git | 0 | 0 | 8 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f-blocked-n |
| 131 | xeme-hg | 0 | 0 | 8 | SOURCE_UNAVAILABLE: Mercurial-only source; appears abandoned |
| 132 | anyrun-git | 0 | 0 | 9 | COMPLEX_BUILD: Rust Wayland runner, requires cargo-inputs an |
| 133 | boost-python2 | 0 | 0 | 9 | LEGACY_PYTHON2: Boost.Python for Python 2, Python 2 is EOL ( |
| 134 | epub_to_audiobook-git | 0 | 0 | 9 | DEP_RESOLUTION_FAILED: edge-tts/openai API deps (recipe-reso |
| 135 | frame-eth | 0 | 0 | 9 | DEP_RESOLUTION_FAILED: Web3/Ethereum wallet (Electron); mass |
| 136 | freetube-electron-git | 0 | 0 | 9 | COMPLEX_DEPS: requires Electron 41 and yarn Node.js build (d |
| 137 | lib32-vkbasalt | 0 | 0 | 9 | TOOLING_FAILURE: 32-bit Vulkan layer; Guix does not support  |
| 138 | madness-interactive-reloaded | 0 | 0 | 9 | SOURCE_UNAVAILABLE: game distributed via itch.io; no direct  |
| 139 | mobirise | 0 | 0 | 9 | LICENSE_REVIEW_NEEDED: proprietary redistribution unclear (r |
| 140 | network-manager-applet-nolibappindicator | 0 | 0 | 9 | TOOLING_FAILURE: variant of nm-applet already in Guix (recip |
| 141 | open-tv | 0 | 0 | 9 | DEP_RESOLUTION_FAILED: Tauri/Rust/WebKit (recipe-resolver-26 |
| 142 | pcem-git | 0 | 0 | 9 | DEP_RESOLUTION_FAILED: IBM PC emulator; SDL2 + OpenAL + cust |
| 143 | prey | 0 | 0 | 9 | SOURCE_UNAVAILABLE: requires purchased game data (recipe-res |
| 144 | shijima-qt | 0 | 0 | 9 | DEP_RESOLUTION_FAILED: desktop pet app; Qt6 + custom animati |
| 145 | ausweiskopie | 0 | 0 | 10 | SOURCE_UNAVAILABLE: German ID copy tool; no public repositor |
| 146 | beignet-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: legacy Intel OpenCL; abandoned, requi |
| 147 | borgwarehouse | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f-blocked-n |
| 148 | hnefatafl-copenhagen | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: Rust game client with niche crate dep |
| 149 | libfive-studio-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: Eigen/Boost/Qt5 (recipe-resolver-2604 |
| 150 | libga68-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME: GCC pre-release Algol68 runtime; Guix  |
| 151 | libgfortran-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME: GCC pre-release Fortran runtime; Guix  |
| 152 | libgnat-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME: GCC pre-release Ada runtime; Guix prov |
| 153 | libgo-snapshot | 0 | 0 | 10 | GCC_SNAPSHOT_RUNTIME: GCC pre-release Go runtime; Guix provi |
| 154 | linux-sched-ext-git-headers | 0 | 0 | 10 | TOOLING_FAILURE: custom kernel headers; Guix manages kernels |
| 155 | linux-tip-git-headers | 0 | 0 | 10 | TOOLING_FAILURE: linux-next/tip kernel headers; Guix kernel  |
| 156 | mailspring | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f-blocked-n |
| 157 | nvidia-390xx-settings | 0 | 0 | 10 | TOOLING_FAILURE: NVIDIA 390xx legacy driver; requires propri |
| 158 | pantheon-polkit-agent-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: requires Pantheon desktop stack (gran |
| 159 | vanilla-wiiu-git | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: custom networking and kernel drivers  |
| 160 | virtualbox-bin-sdk | 0 | 0 | 10 | DEP_RESOLUTION_FAILED: VirtualBox SDK; requires matching Vir |
| 161 | fancy-cat | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: terminal PDF reader in Zig; requires  |
| 162 | lto-dump-snapshot | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: GCC snapshot bootstrap infeasible (re |
| 163 | luxtorpeda-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: Steam Play tool in Rust; 100+ crate d |
| 164 | principia-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: physics sandbox game; Box2D + SDL2 +  |
| 165 | synfigstudio-dev | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: dev branch requiring synfig-core + ET |
| 166 | vegastrike-engine-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: depends on vegastrike ecosystem (reci |
| 167 | vgmstream-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: game audio lib; 20+ codec deps; next: |
| 168 | whatip-git | 0 | 0 | 11 | DEP_RESOLUTION_FAILED: GNOME/libadwaita/Python deps (recipe- |
| 169 | devtools-git | 0 | 0 | 12 | TOOLING_FAILURE: Arch Linux package maintainer tools (makepk |
| 170 | envoyproxy | 0 | 0 | 12 | BUILD_FAILED: massive C++ project using Bazel build system;  |
| 171 | gst-plugins-rs-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED: GStreamer + 200+ Rust crate deps; C/R |
| 172 | linux-xanmod-lts-headers | 0 | 0 | 12 | TOOLING_FAILURE: custom kernel headers; Guix manages kernels |
| 173 | mingw-w64-libopenmpt | 0 | 0 | 12 | TOOLING_FAILURE: mingw-w64 cross-compilation target; not app |
| 174 | opendrop-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED: AirDrop implementation; requires OWL  |
| 175 | python-google-cloud-speech | 0 | 0 | 12 | DEP_RESOLUTION_FAILED: 30+ transitive Google Cloud Python de |
| 176 | python-pylink-square | 0 | 0 | 12 | PROPRIETARY_DEP: Depends on proprietary SEGGER J-Link SDK (d |
| 177 | wayfire-plugins-extra-git | 0 | 0 | 12 | DEP_RESOLUTION_FAILED: depends on wayfire (recipe-resolver-2 |
| 178 | auracle-git | 0 | 0 | 13 | DISTRO_SPECIFIC (deptree-resolver-260424o) |
| 179 | betterx-desktop-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED: Electron source build; use -bin (reci |
| 180 | capt-src | 0 | 0 | 13 | MULTILIB_UNSUPPORTED |
| 181 | cockatrice-server-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED: Protobuf/Qt5 network (recipe-resolver |
| 182 | glsmac-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED: SMAC reimplementation; C++ with SDL2  |
| 183 | illogical-impulse-ags | 0 | 0 | 13 | NEEDS_INVESTIGATION: AGS GTK Shell config (deptree-resolver- |
| 184 | python-jax-rocm | 0 | 0 | 13 | HARDWARE_SPECIFIC |
| 185 | yacreader-poppler-git | 0 | 0 | 13 | DEP_RESOLUTION_FAILED: Qt6/poppler/7zip (recipe-resolver-260 |
| 186 | goxlr-utility-ui | 0 | 0 | 14 | DEP_RESOLUTION_FAILED: Tauri/Rust stack (recipe-resolver-260 |
| 187 | lincity-ng-git | 0 | 0 | 14 | DEP_RESOLUTION_FAILED: city sim game; SDL2_mixer + PhysFS +  |
| 188 | linux-cachyos-hardened-headers | 0 | 0 | 14 | TOOLING_FAILURE: CachyOS hardened kernel headers; Guix manag |
| 189 | linux-next-git-headers | 0 | 0 | 14 | TOOLING_FAILURE: bleeding-edge kernel headers; Guix manages  |
| 190 | rpfm-git | 0 | 0 | 14 | COMPLEX_BUILD: Rust mod manager, requires cargo-inputs (dept |
| 191 | deepin-wine8-stable | 0 | 0 | 15 | PROPRIETARY_BINARY |
| 192 | lightlyshaders-git | 0 | 0 | 15 | DEP_RESOLUTION_FAILED: KDE KWin effect; requires full KDE Fr |
| 193 | linux-covolunablu-gaming-headers | 0 | 0 | 15 | TOOLING_FAILURE: custom gaming kernel headers; Guix manages  |
| 194 | panda3ds | 0 | 0 | 15 | DEP_RESOLUTION_FAILED: HLE 3DS emulator; complex C++ with Vu |
| 195 | php-legacy-pdlib | 0 | 0 | 15 | DEP_RESOLUTION_FAILED: PHP and dlib not available (recipe-re |
| 196 | qt6-xcb-private-headers-git | 0 | 0 | 15 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f-blocked-n |
| 197 | scans2any-git | 0 | 0 | 15 | DEP_RESOLUTION_FAILED: scan converter in Rust; requires Typs |
| 198 | veloren | 0 | 0 | 15 | DEP_RESOLUTION_FAILED: see recipe-resolver-260425f-blocked-n |
| 199 | vmware-workstation | 0 | 0 | 15 | PROPRIETARY_BINARY |
| 200 | lcd4linux-git | 0 | 0 | 16 | DEP_RESOLUTION_FAILED: requires 15+ display driver libs not  |
