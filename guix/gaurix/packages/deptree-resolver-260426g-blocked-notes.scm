;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260426g
;;;
;;; 100 packages evaluated, 2 resolved with recipes, 98 remain BLOCKED.
;;;
;;; Resolved packages:
;;;   1. librewolf-extension-ublock-origin-bin (uBlock Origin .xpi for
;;;      LibreWolf; copy-build-system, downloads signed .xpi from GitHub
;;;      Releases, installs to system-wide extensions directory.)
;;;   2. vivaldi-autoinject-custom-js-ui (shell script tool for managing
;;;      custom JS UI mods in Vivaldi; gnu-build-system with gawk+m4,
;;;      bashbud framework generates monolithic script.)
;;;
;;; Blocked packages by category:
;;;
;;; === MISSING_SOURCE (5) ===
;;; Not found in AUR metadata cache; package may be deleted or renamed.
;;; gradience (#18644): Not in AUR cache, likely removed.
;;; deadbeef-mpris2-plugin (#19282): Not in AUR cache.
;;; linux6.18.22-1-lts-bin (#37932): Not in AUR cache, ephemeral kernel binary.
;;; matlab-jre-bundled (#19363): Not in AUR cache, likely removed.
;;; sipgate-app-clinq (#18449): Not in AUR cache.
;;;
;;; === SELINUX_SPECIFIC (2) ===
;;; Require SELinux infrastructure not present in Guix.
;;; sudo-selinux (#18513): SELinux-enabled sudo variant; Guix uses no SELinux.
;;; base-selinux (#18537): Arch SELinux meta-package; full SELinux stack.
;;;
;;; === DKMS_KERNEL_MODULE (9) ===
;;; All require DKMS which is incompatible with Guix's immutable kernel model.
;;; aquacomputer_d5next-hwmon-dkms (#18606): Aquacomputer HWMON driver.
;;; amneziawg-dkms-git (#18642): AmneziaWG VPN kernel module.
;;; ideapad-laptop-tb-dkms (#18957): Lenovo ThinkBook DKMS driver.
;;; ideapad-laptop-tb2024g6plus-dkms (#18895): Lenovo 2024 G6+ DKMS driver.
;;; pfring-dkms (#18399): PF_RING network monitoring DKMS module.
;;; r8126-dkms (#18487): Realtek RTL8126 ethernet DKMS driver.
;;; rtl88x2ce-dkms-git (#18369): Realtek WiFi DKMS driver.
;;; faustus-dkms-git (#18859): ASUS TUF fan control DKMS driver.
;;; nvidia-open-tinygrad-dkms-git (#18617): NVIDIA open kernel modules tinygrad.
;;;
;;; === KERNEL_MODULE (5) ===
;;; Out-of-tree kernel modules or kernel-specific headers.
;;; amneziawg-linux (#18452): WireGuard-variant kernel module; needs linux-headers.
;;; amneziawg-linux-hardened (#18382): WireGuard-variant for hardened kernel.
;;; zfs-linux-hardened-headers (#17921): ZFS headers for hardened kernel.
;;; zfs-linux-rt-headers (#17920): ZFS headers for RT kernel.
;;; zfs-linux-git-headers (#17919): ZFS headers for git kernel.
;;;
;;; === DISTRO_SPECIFIC (11) ===
;;; Tightly coupled to Arch Linux pacman/mkinitcpio/ALPM.
;;; mkinitcpio-systemd-root-password (#18371): mkinitcpio hook for root password.
;;; repacman (#18707): Produces pacman packages from installed software.
;;; findbrokenpkgs (#18930): Arch-specific broken-package finder using pacman.
;;; sbctl-initcpio-post-hook (#18720): sbctl mkinitcpio hook for Secure Boot.
;;; system-age (#18453): Reads Arch's pacman install date; Arch-specific.
;;; linux-keep-modules (#18490): Pacman hook to preserve kernel modules.
;;; pacpak-git (#17862): Pacman wrapper for Flatpak management.
;;; chromium-extension-arch-search (#17897): Arch Wiki/AUR browser extension.
;;; python-pypi2pkgbuild (#17822): PyPI to Arch PKGBUILD converter.
;;; archwiki-offline (#18568): Arch Wiki offline viewer; depends on arch-wiki-docs.
;;; mkinitcpio-clevis-hook (#18342): mkinitcpio hook for LUKS+Clevis+TPM.
;;;
;;; === PROPRIETARY_BINARY (6) ===
;;; Proprietary, non-redistributable, or unknown-license binaries.
;;; squareline-studio (#17812): Proprietary GUI design tool, no source.
;;; brother-mfc-l2400dw (#17797): Proprietary printer driver binary.
;;; luniistore (#18478): Proprietary storefront app; unknown license.
;;; simplicity-commander (#18419): Proprietary Silicon Labs debug tool.
;;; inkdrop (#17819): Proprietary note-taking app.
;;; wyc (#18777): Commercial Chinese port mapping service; commercial license.
;;;
;;; === PLATFORM_UNSUPPORTED (3) ===
;;; Windows-only or require platform-specific infrastructure.
;;; bakkesmod-steam (#17468): Windows-only Rocket League modding tool.
;;; android-platform-19 (#18550): Google Android SDK API level 19.
;;; android-platform-21 (#18549): Google Android SDK API level 21.
;;; euroscope-bin (#18289): Windows-only VATSIM radar client.
;;;
;;; === NON_DISTRIBUTABLE (3) ===
;;; Cannot be redistributed due to license or require purchase.
;;; ttf-consolas-ligaturized (#18551): Font derived from Microsoft Consolas; non-free.
;;; factorio-space-age-experimental (#17440): Requires purchase; non-distributable.
;;; ut2004-gog (#18333): Requires GOG purchase for game data.
;;;
;;; === MULTILIB_UNSUPPORTED (3) ===
;;; 32-bit library variants not supported on Guix.
;;; lib32-opencl-nvidia-390xx (#17502): 32-bit NVIDIA OpenCL; multilib.
;;; lib32-libglade (#18401): 32-bit libglade; multilib.
;;; lib32-libxpm (#16491): 32-bit libXpm; multilib.
;;;
;;; === MINGW_CROSS_COMPILATION (6) ===
;;; MinGW Windows cross-compilation packages.
;;; mingw-w64-cblas (#18451): MinGW CBLAS; Windows cross-compile only.
;;; mingw-w64-lapack (#18422): MinGW LAPACK; Windows cross-compile only.
;;; mingw-w64-soundtouch (#18330): MinGW SoundTouch; Windows cross-compile only.
;;; mingw-w64-boost (#18391): MinGW Boost; Windows cross-compile only.
;;; mingw-w64-cppwinrt (#18421): MinGW C++/WinRT; Windows cross-compile only.
;;; mingw-w64-spirv-tools (#18442): MinGW SPIR-V Tools; Windows cross-compile only.
;;; mingw-w64-postgresql (#18365): MinGW PostgreSQL; Windows cross-compile only.
;;;
;;; === ABANDONED_UPSTREAM (2) ===
;;; clash-for-windows-chinese (#17433): Upstream project abandoned.
;;; lightdm-webkit-theme-aether (#18400): Upstream abandoned; webkit greeter dead.
;;;
;;; === WINE_WRAPPER (2) ===
;;; Require Wine to run Windows applications.
;;; fileoptimizer-bin (#18315): Windows optimizer via Wine; requires wine-mono.
;;; futu-ftnn-wine (#18151): Chinese stock trading app via Wine.
;;;
;;; === OBSOLETE_DEPS (2) ===
;;; Depend on obsolete/unsupported libraries.
;;; knossu (#18461): Requires glew1.10 and libpng12 (EOL).
;;; phonon-qt4-vlc (#18938): Requires Qt4 (EOL since 2015).
;;;
;;; === BUILD_SYSTEM_TOO_COMPLEX (7) ===
;;; Require build infrastructure not available or too complex for Guix.
;;; virtualbox-svn (#18799): Massive codebase; SVN checkout; ~70 deps; DKMS host modules.
;;;   Attempts: A1: gnu-build-system — build requires 40+ makedepends, SVN, Java, Qt6,
;;;   kernel headers. A2: binary repackage from Oracle — proprietary components mixed
;;;   in. A3: use Guix's existing virtualbox — different version track (svn vs release).
;;; java-language-server (#18379): Maven build; 14+ transitive Java dependencies not in Guix.
;;;   Attempts: A1: maven-build-system not in Guix. A2: ant-build-system cannot handle
;;;   Maven POM. A3: pre-built JAR — no official binary releases.
;;; eclipse-pydev (#17948): Eclipse plugin; complex OSGI bundle structure.
;;;   Attempts: A1: copy-build-system with pre-built zip — depends on eclipse (not in
;;;   Guix). A2: build from source — requires Eclipse PDE build. A3: standalone PyDev —
;;;   not available without Eclipse.
;;; gephi-git (#18898): Maven build; ~20 Java deps; requires JDK 11 specifically.
;;;   Attempts: A1: maven-build-system — not in Guix. A2: pre-built binary — no official
;;;   Linux binary release. A3: gradle wrapper — project uses Maven, not Gradle.
;;; logstash (#18911): Ruby+Java hybrid; requires JRuby, Gradle, 100+ gems.
;;;   Attempts: A1: ruby-build-system — needs JRuby not in Guix. A2: binary tarball from
;;;   Elastic — Apache/Elastic dual license, complex runtime. A3: Docker image extraction —
;;;   not suitable for Guix packaging.
;;; pulumi-git (#18748): Go build with massive module dependency tree (~500+ modules).
;;;   Attempts: A1: go-build-system — requires vendoring 500+ Go modules, each needing
;;;   individual Guix packages. A2: pre-built binary — available but requires glibc
;;;   compatibility. A3: binary tarball with copy-build-system — license allows it but
;;;   binary links against specific glibc version.
;;; rdt-client (#18392): .NET 8 web application; .NET SDK not in Guix.
;;;   Attempts: A1: dotnet-build-system — not in Guix. A2: binary self-contained
;;;   publish — .NET self-contained requires framework in store. A3: Docker image — not
;;;   suitable for Guix.
;;;
;;; === NPM_COMPLEX_DEPS (10) ===
;;; Node.js packages requiring 15-200+ npm dependency packages not in Guix.
;;; edgeimpulse-cli (#18574): Edge Impulse IoT CLI; npm with extensive native deps.
;;; nodejs-cspell (#18215): Code spell checker; 200+ transitive npm deps.
;;; osmtogeojson (#18417): OSM-to-GeoJSON converter; ~25 npm deps not in Guix.
;;;   Attempts: A1: node-build-system — needs packaging ~20 individual node-* packages
;;;   first (domelementtype, htmlparser2 v3, JSONStream, etc.). A2: bundled tarball
;;;   approach — npm install needs network (blocked in builds). A3: pre-packed
;;;   node_modules — loses reproducibility, not suitable for Guix.
;;; emmet-language-server (#18958): Emmet LSP server; ~25 npm deps not in Guix.
;;;   Attempts: A1: node-build-system — needs ~20 new packages (vscode-languageserver,
;;;   emmet, htmlparser2 v10, etc.). A2: npm global install — needs network at build
;;;   time. A3: pre-built tarball with bundled deps — no official bundle available.
;;; aws-amplify-cli (#18269): AWS Amplify CLI; massive npm dependency tree.
;;; aws-cdk (#18298): AWS CDK CLI; massive npm dependency tree.
;;; nodejs-nestjs-cli (#18753): NestJS CLI; requires npm + typescript ecosystem.
;;; awk-language-server (#18691): AWK LSP; requires yarn + typescript build pipeline.
;;; vscodium-marketplace (#18695): Patches VSCodium product.json; depends on vscodium.
;;; python-home-assistant-frontend (#18556): Pre-built npm frontend as Python wheel.
;;;
;;; === MISSING_DEPS (8) ===
;;; Critical dependencies not available in Guix.
;;; libch343ser-git (#17880): WCH USB serial kernel driver; kernel module.
;;; libfprint-2-tod1-broadcom-cv3plus (#17912): Proprietary fingerprint driver;
;;;   requires libfprint-tod (not in Guix).
;;; texmacs-pure (#17873): Pure language plugin for TeXmacs; requires Pure lang and
;;;   LLVM 3.5 (both unavailable in Guix).
;;; nfuspire-git (#18401): FUSE filesystem for TI Nspire; requires libnspire (not
;;;   in Guix).
;;; gbm (#19044): Game Backup Monitor; requires mono-basic (not in Guix).
;;; mailnaggertray-git (#18592): Tray icon for mailnagger; requires mailnagger (not
;;;   in Guix).
;;; soapysdrplay3-luarvique-git (#18141): SoapySDR module; requires proprietary
;;;   libsdrplay (not in Guix).
;;; kamilsss655-uv-k5-firmware-custom-git (#17909): UV-K5 radio firmware; requires
;;;   arm-none-eabi cross-toolchain (not in Guix standard packages).
;;;
;;; === NON_DISTRIBUTABLE_GAME (3) ===
;;; Games requiring proprietary data or commercial purchase.
;;; urbanterror (#18814): Game data ~1.4GB is proprietary FrozenSand content.
;;;   Attempts: A1: package engine from source (GPL ioquake3 fork at
;;;   github.com/FrozenSand/ioq3-for-UrbanTerror-4) — engine builds but game data
;;;   (pk3 files) are proprietary. A2: binary distribution with copy-build-system —
;;;   mixes GPL engine with proprietary data. A3: separate engine/data packages —
;;;   engine alone is useless without data files.
;;; unrealtournament4 (#18319): Epic Games proprietary; requires Epic account.
;;; receitanet (#18413): Brazilian government tax software; proprietary custom license.
;;;
;;; === OTHER (4) ===
;;; Miscellaneous blockers.
;;; libarchive-static (#18758): Static musl build of bsdtar; Guix already provides
;;;   libarchive — static musl variant needs cross-compilation infrastructure.
;;;   Attempts: A1: gnu-build-system with musl — musl in Guix is for cross-compilation,
;;;   not native static builds. A2: modify existing libarchive package with static
;;;   flags — upstream Guix libarchive uses glibc. A3: trivial-build-system wrapping
;;;   guix build libarchive --with-c-toolchain=musl — approach too fragile.
;;; quartz-utils-git (#18430): Crystal language CLI tools; Crystal compiler not in Guix.
;;; python-gradio-pdf (#18463): Depends on python-gradio (massive dep tree, not in Guix).
;;; python-jaxlib-bin (#18474): Binary wheel with C++ extensions; binary wheels
;;;   incompatible with Guix's dynamic linking model.
;;;
;;; === PREVIOUSLY_CATEGORIZED (7) ===
;;; Already had failure categories from prior passes; confirmed still blocked.
;;; asp (#14587): DISTRO_SPECIFIC — Arch Build System package tool.
;;; pamac-cli (#18299): DISTRO_SPECIFIC — ALPM/pacman frontend.
;;; nvidia-bl-dkms (#18356): DKMS_KERNEL_MODULE — NVIDIA backlight driver.
;;; vivaldi-autoinject-custom-js-ui (#18520): RESOLVED in this pass.
;;; plugin-autenticacao-gov-pt (#18557): PROPRIETARY_BINARY — Portuguese gov auth
;;;   plugin; depends on proprietary PKCS#11 infrastructure and smartcard runtime
;;;   (pcsclite/ccid available in Guix but the plugin JAR is proprietary).
;;; edgeimpulse-cli (#18574): See NPM_COMPLEX_DEPS above.
;;; librewolf-extension-ublock-origin-bin (#18355): RESOLVED in this pass.
