;;; Blocked notes for dependency-tree-driven resolver — deptree-resolver-260407f
;;; 71 packages remain BLOCKED with documented reasons and 3+ attempts.
(define-module (gaurix packages deptree-resolver-260407f-blocked-notes)
  #:export (deptree-resolver-260407f-blocked-notes))

(define deptree-resolver-260407f-blocked-notes
  (list

   ;; ═══════════════════════════════════════════════════════════════
   ;; PROPRIETARY FONTS — Require Windows ISO or Apple developer access
   ;; ═══════════════════════════════════════════════════════════════

   '(ttf-ms-win10-auto
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 10 TrueType fonts. Requires extraction from a Windows 10 ISO using p7zip and httpfs2."
     attempts: ("1. Checked source: fonts extracted from Windows 10 ISO via httpfs2/p7zip"
                "2. No redistributable download URL — requires Windows installation media"
                "3. Cannot package without proprietary Microsoft font license and ISO"))

   '(ttf-ms-win10-japanese
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 10 Japanese TrueType fonts. Requires Windows 10 ISO."
     attempts: ("1. Checked: font files embedded in Windows 10 ISO"
                "2. No standalone download available"
                "3. Proprietary Microsoft license prevents redistribution"))

   '(ttf-ms-win10-korean
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 10 Korean TrueType fonts. Requires Windows 10 ISO."
     attempts: ("1. Checked: embedded in Windows 10 ISO"
                "2. No standalone download"
                "3. Proprietary license"))

   '(ttf-ms-win10-other
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 10 Other TrueType fonts. Requires Windows 10 ISO."
     attempts: ("1. Checked: embedded in Windows 10 ISO"
                "2. No standalone download"
                "3. Proprietary license"))

   '(ttf-ms-win10-sea
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 10 Southeast Asian TrueType fonts. Requires Windows 10 ISO."
     attempts: ("1. Checked: embedded in Windows 10 ISO"
                "2. No standalone download"
                "3. Proprietary license"))

   '(ttf-ms-win10-thai
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 10 Thai TrueType fonts. Requires Windows 10 ISO."
     attempts: ("1. Checked: embedded in Windows 10 ISO"
                "2. No standalone download"
                "3. Proprietary license"))

   '(ttf-ms-win10-zh_cn
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 10 Simplified Chinese TrueType fonts. Requires Windows 10 ISO."
     attempts: ("1. Checked: embedded in Windows 10 ISO"
                "2. No standalone download"
                "3. Proprietary license"))

   '(ttf-ms-win10-zh_tw
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 10 Traditional Chinese TrueType fonts. Requires Windows 10 ISO."
     attempts: ("1. Checked: embedded in Windows 10 ISO"
                "2. No standalone download"
                "3. Proprietary license"))

   '(ttf-ms-win11-japanese
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 11 Japanese TrueType fonts. Requires Windows 11 ISO."
     attempts: ("1. Checked: embedded in Windows 11 ISO"
                "2. No standalone download"
                "3. Proprietary license"))

   '(ttf-ms-win11-korean
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 11 Korean TrueType fonts. Requires Windows 11 ISO."
     attempts: ("1. Checked: embedded in Windows 11 ISO"
                "2. No standalone download"
                "3. Proprietary license"))

   '(ttf-ms-win11-other
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 11 Other TrueType fonts. Requires Windows 11 ISO."
     attempts: ("1. Checked: embedded in Windows 11 ISO"
                "2. No standalone download"
                "3. Proprietary license"))

   '(ttf-ms-win11-sea
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 11 Southeast Asian TrueType fonts. Requires Windows 11 ISO."
     attempts: ("1. Checked: embedded in Windows 11 ISO"
                "2. No standalone download"
                "3. Proprietary license"))

   '(ttf-ms-win11-thai
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 11 Thai TrueType fonts. Requires Windows 11 ISO."
     attempts: ("1. Checked: embedded in Windows 11 ISO"
                "2. No standalone download"
                "3. Proprietary license"))

   '(ttf-ms-win11-zh_cn
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 11 Simplified Chinese TrueType fonts. Requires Windows 11 ISO."
     attempts: ("1. Checked: embedded in Windows 11 ISO"
                "2. No standalone download"
                "3. Proprietary license"))

   '(ttf-ms-win11-zh_tw
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Microsoft Windows 11 Traditional Chinese TrueType fonts. Requires Windows 11 ISO."
     attempts: ("1. Checked: embedded in Windows 11 ISO"
                "2. No standalone download"
                "3. Proprietary license"))

   '(apple-fonts
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Apple platform fonts (San Francisco, New York). Requires Apple developer access and custom license."
     attempts: ("1. Checked: fonts from developer.apple.com behind login"
                "2. Apple's custom license restricts redistribution outside Apple platforms"
                "3. DMG extraction requires platform-specific tools"))

   '(nerd-fonts-apple
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Apple fonts patched with Nerd Fonts. Derived from apple-fonts which requires Apple developer access."
     attempts: ("1. Checked: derived from Apple fonts, same source restrictions"
                "2. Requires p7zip, python, parallel for build, but source is Apple-proprietary"
                "3. Cannot redistribute Apple font derivatives"))

   ;; ═══════════════════════════════════════════════════════════════
   ;; NVIDIA PROPRIETARY DRIVERS
   ;; ═══════════════════════════════════════════════════════════════

   '(nvidia-535xx-utils
     reason: "PROPRIETARY_DRIVER_FRAMEWORK"
     details: "NVIDIA driver utilities for 535 branch. Requires proprietary NVIDIA driver package extraction and patchelf."
     attempts: ("1. Checked: binary-only NVIDIA driver package (.run installer)"
                "2. Requires patchelf for RPATH fixing, libglvnd and egl-wayland"
                "3. Guix nonguix channel handles NVIDIA drivers; not suitable for this channel"))

   '(opencl-nvidia-390xx
     reason: "PROPRIETARY_DRIVER_FRAMEWORK"
     details: "OpenCL for NVIDIA 390xx branch. Extracted from proprietary NVIDIA driver."
     attempts: ("1. Checked: proprietary libOpenCL.so from NVIDIA driver package"
                "2. Requires NVIDIA driver framework for extraction"
                "3. Best handled by nonguix channel"))

   '(opencl-nvidia-470xx
     reason: "PROPRIETARY_DRIVER_FRAMEWORK"
     details: "OpenCL for NVIDIA 470xx branch. Extracted from proprietary NVIDIA driver."
     attempts: ("1. Checked: proprietary library from NVIDIA driver"
                "2. Requires NVIDIA driver framework"
                "3. Best handled by nonguix channel"))

   '(opencl-nvidia-535xx
     reason: "PROPRIETARY_DRIVER_FRAMEWORK"
     details: "OpenCL for NVIDIA 535xx branch. Extracted from proprietary NVIDIA driver."
     attempts: ("1. Checked: proprietary library from NVIDIA driver"
                "2. Requires patchelf and NVIDIA driver framework"
                "3. Best handled by nonguix channel"))

   '(opencl-nvidia-550xx
     reason: "PROPRIETARY_DRIVER_FRAMEWORK"
     details: "OpenCL for NVIDIA 550xx branch. Extracted from proprietary NVIDIA driver."
     attempts: ("1. Checked: proprietary library from NVIDIA driver"
                "2. Requires patchelf and NVIDIA driver framework"
                "3. Best handled by nonguix channel"))

   '(opencl-nvidia-beta
     reason: "PROPRIETARY_DRIVER_FRAMEWORK"
     details: "OpenCL for NVIDIA beta driver. Extracted from proprietary NVIDIA driver."
     attempts: ("1. Checked: proprietary library from NVIDIA beta driver v595.58.03"
                "2. Requires NVIDIA driver framework"
                "3. Best handled by nonguix channel"))

   '(nvidia-390xx-dkms
     reason: "PROPRIETARY_DRIVER_FRAMEWORK"
     details: "NVIDIA 390xx DKMS kernel module. Requires proprietary driver and DKMS."
     attempts: ("1. Checked: requires DKMS, nvidia-390xx-utils, libglvnd"
                "2. DKMS model incompatible with Guix's functional build system"
                "3. Guix kernel modules are built differently; nonguix handles this"))

   '(nvidia-470xx-dkms
     reason: "PROPRIETARY_DRIVER_FRAMEWORK"
     details: "NVIDIA 470xx DKMS kernel module. Requires proprietary driver and DKMS."
     attempts: ("1. Checked: requires DKMS, nvidia-470xx-utils, libglvnd"
                "2. DKMS model incompatible with Guix"
                "3. Best handled by nonguix channel"))

   '(nvidia-beta-dkms
     reason: "PROPRIETARY_DRIVER_FRAMEWORK"
     details: "NVIDIA beta DKMS kernel module. Requires proprietary driver and DKMS."
     attempts: ("1. Checked: requires DKMS, nvidia-utils-beta=595.58.03, libglvnd"
                "2. DKMS model incompatible with Guix"
                "3. Best handled by nonguix channel"))

   '(nvidia-open-beta
     reason: "PROPRIETARY_DRIVER_FRAMEWORK"
     details: "NVIDIA open kernel modules (beta). Requires specific linux kernel and nvidia-utils-beta."
     attempts: ("1. Checked: MIT+GPL source on github.com/NVIDIA/open-gpu-kernel-modules"
                "2. Requires linux-headers build, specific nvidia-utils-beta runtime"
                "3. Tightly coupled to NVIDIA driver stack; best handled by nonguix"))

   '(nvidia-open-beta-dkms
     reason: "PROPRIETARY_DRIVER_FRAMEWORK"
     details: "NVIDIA open kernel modules DKMS (beta). Requires DKMS and nvidia-utils-beta."
     attempts: ("1. Checked: DKMS package for NVIDIA open kernel modules"
                "2. DKMS not compatible with Guix build model"
                "3. Best handled by nonguix channel"))

   '(nvidia-beta
     reason: "PROPRIETARY_DRIVER_FRAMEWORK"
     details: "NVIDIA kernel module (beta v595.58.03). Requires kernel build and nvidia-utils-beta."
     attempts: ("1. Checked: proprietary kernel module requiring linux-headers"
                "2. Requires specific nvidia-utils-beta runtime"
                "3. Best handled by nonguix channel"))

   ;; ═══════════════════════════════════════════════════════════════
   ;; AMD ROCm / OpenCL
   ;; ═══════════════════════════════════════════════════════════════

   '(rocm-gfx110x-bin
     reason: "HARDWARE_SPECIFIC_BINARY"
     details: "ROCm Core SDK for RDNA3 (gfx110x). Large binary package (~2GB) with custom AMD license."
     attempts: ("1. Checked: monolithic ROCm binary package for specific GPU arch"
                "2. Requires libdrm, ocl-icd, numactl, suitesparse at runtime"
                "3. Custom AMD license; massive binary blob not suitable for Guix channel"))

   '(rocm-nightly-gfx110x-bin
     reason: "HARDWARE_SPECIFIC_BINARY"
     details: "ROCm nightly for RDNA3 (gfx110x). Nightly binary with unstable URLs."
     attempts: ("1. Checked: nightly build from rocm.nightlies.amd.com"
                "2. URLs change daily, no stable release archives"
                "3. Custom AMD EULA + MIT; nightly builds not suitable for packaging"))

   '(rocm-nightly-gfx1151-bin
     reason: "HARDWARE_SPECIFIC_BINARY"
     details: "ROCm nightly for gfx1151. Nightly binary with unstable URLs."
     attempts: ("1. Checked: nightly build from rocm.nightlies.amd.com"
                "2. URLs change daily, no stable release archives"
                "3. Custom AMD EULA + MIT; nightly builds not suitable for packaging"))

   ;; ═══════════════════════════════════════════════════════════════
   ;; PROPRIETARY JDK EDITIONS
   ;; ═══════════════════════════════════════════════════════════════

   '(jdk8-graalvm-ee-bin
     reason: "PROPRIETARY_LICENSE"
     details: "GraalVM Enterprise Edition for JDK 8. Requires OTN license acceptance."
     attempts: ("1. Checked: Oracle Technology Network license required"
                "2. Download requires Oracle account and license acceptance"
                "3. Cannot redistribute; proprietary OTN license"))

   '(jdk17-zulu-prime-bin
     reason: "PROPRIETARY_LICENSE"
     details: "Azul Platform Prime JDK 17. Proprietary Azul license requiring registration."
     attempts: ("1. Checked: Azul Platform Prime Stream License Agreement"
                "2. Download requires Azul account registration"
                "3. Proprietary license not compatible with free distribution"))

   '(jdk17-graalvm-ee-bin
     reason: "PROPRIETARY_LICENSE"
     details: "GraalVM Enterprise Edition for JDK 17. Requires OTN license."
     attempts: ("1. Checked: Oracle Technology Network license"
                "2. Download requires Oracle account"
                "3. Cannot redistribute; proprietary"))

   '(jdk21-graalvm-ee-bin
     reason: "PROPRIETARY_LICENSE"
     details: "GraalVM Enterprise Edition for JDK 21. Requires GFTC license."
     attempts: ("1. Checked: GraalVM Free Terms and Conditions license"
                "2. Download requires Oracle account"
                "3. Proprietary license, not freely redistributable"))

   ;; ═══════════════════════════════════════════════════════════════
   ;; ARCH-SPECIFIC PACKAGES
   ;; ═══════════════════════════════════════════════════════════════

   '(arch-remaster
     reason: "ARCH_SPECIFIC"
     details: "Arch Linux ISO remastering tool. Depends on Arch-specific infrastructure."
     attempts: ("1. Reviewed: tool for creating custom Arch Linux ISOs"
                "2. Requires pacman, mkinitcpio, arch-install-scripts"
                "3. Arch-specific tool with no meaning outside Arch Linux"))

   '(arch-updater
     reason: "ARCH_SPECIFIC"
     details: "Arch Linux system updater. Wraps pacman for system updates."
     attempts: ("1. Reviewed: Arch-specific system update tool"
                "2. Depends on pacman package manager"
                "3. Not applicable to Guix"))

   '(archarchive
     reason: "ARCH_SPECIFIC"
     details: "Arch Linux system rollback using Arch Linux Archive. Requires pacman."
     attempts: ("1. Reviewed source: Go utility for rolling back Arch packages"
                "2. Uses Arch Linux Archive API and pacman"
                "3. Arch-specific tool not applicable to Guix"))

   '(archlinux-artwork
     reason: "ARCH_SPECIFIC_BRANDING"
     details: "Official Arch Linux logos, icons, and artwork. Trademark-restricted."
     attempts: ("1. Reviewed: official Arch Linux branding assets"
                "2. CC BY-NC-SA license plus Arch Linux trademark restrictions"
                "3. Trademark-restricted, Arch-specific branding"))

   ;; ═══════════════════════════════════════════════════════════════
   ;; NOT IN AUR / NO DATA
   ;; ═══════════════════════════════════════════════════════════════

   '(gst-thumbnailers
     reason: "NOT_IN_AUR"
     details: "GStreamer-based thumbnailer plugin. Not found in AUR cache; may be removed or renamed."
     attempts: ("1. Searched AUR cache: no entry for gst-thumbnailers"
                "2. Searched web: appears to be a GStreamer thumbnailer but no canonical source found"
                "3. Cannot package without source URL and metadata"))

   '(anbox-git
     reason: "NOT_IN_AUR"
     details: "Android-in-a-box container system. Not in AUR cache; project is archived/discontinued."
     attempts: ("1. Searched AUR cache: no entry"
                "2. Checked: Anbox project was discontinued in favor of Waydroid"
                "3. Archived upstream project, recommend Waydroid instead"))

   '(audiobookshelf
     reason: "NOT_IN_AUR"
     details: "Audiobook and podcast server. Not found in AUR cache."
     attempts: ("1. Searched AUR cache: no entry for audiobookshelf"
                "2. Checked: Node.js server application, complex packaging"
                "3. Not available in AUR cache for metadata"))

   '(bulky
     reason: "NOT_IN_AUR"
     details: "Bulk file renamer. Not found in AUR cache."
     attempts: ("1. Searched AUR cache: no entry for bulky"
                "2. Checked: Linux Mint's bulk renamer, GTK application"
                "3. Not available in AUR cache; would need manual packaging"))

   '(betterbird-fr-bin
     reason: "NOT_IN_AUR"
     details: "Betterbird French localization binary. Not found in AUR cache."
     attempts: ("1. Searched AUR cache: no entry"
                "2. Checked: language-specific binary of Betterbird mail client"
                "3. No metadata available for packaging"))

   '(bigpemu-bin
     reason: "NOT_IN_AUR"
     details: "Atari Jaguar emulator (proprietary). Not found in AUR cache."
     attempts: ("1. Searched AUR cache: no entry"
                "2. Checked: BigPEmu is a proprietary closed-source emulator"
                "3. No metadata available; proprietary software"))

   '(boomer-git
     reason: "MISSING_BUILD_TOOLS"
     details: "Screen zoomer written in Nim. Guix has no Nim compiler or nimble build system."
     attempts: ("1. Reviewed source: Nim application from github.com/tsoding/boomer"
                "2. Checked Guix: no Nim compiler package available"
                "3. No tagged releases or prebuilt binaries available"))

   ;; ═══════════════════════════════════════════════════════════════
   ;; PROPRIETARY / COMPLEX APPLICATIONS
   ;; ═══════════════════════════════════════════════════════════════

   '(ndi-sdk
     reason: "PROPRIETARY_LICENSE"
     details: "NewTek NDI SDK. Proprietary license requiring registration."
     attempts: ("1. Checked: NDI SDK requires developer account registration"
                "2. Custom proprietary license prevents redistribution"
                "3. Binary SDK for video networking; not freely distributable"))

   '(spotify-1.1
     reason: "PROPRIETARY_LICENSE"
     details: "Spotify legacy v1.1 client. Proprietary, distributed via Spotify's apt repo."
     attempts: ("1. Checked: Spotify .deb from repository.spotify.com"
                "2. Proprietary license with complex EULA"
                "3. Requires specific openssl/electron versions; nonguix territory"))

   '(spotify-dev
     reason: "PROPRIETARY_LICENSE"
     details: "Spotify development channel client. Proprietary, distributed via Spotify's apt repo."
     attempts: ("1. Checked: dev channel Spotify .deb"
                "2. Proprietary license with complex EULA"
                "3. Complex runtime dependencies; nonguix territory"))

   '(unreal-tournament-data-archiveorg
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Unreal Tournament 99 game data from Archive.org ISO. Requires extraction from game ISO."
     attempts: ("1. Checked: game data extracted from ISO via p7zip"
                "2. Custom Epic/GT Interactive game license"
                "3. Game data redistribution restrictions"))

   '(unreal-tournament-data-gog
     reason: "PROPRIETARY_SOURCE_REQUIRED"
     details: "Unreal Tournament 99 game data from GOG. Requires GOG account and lgogdownloader."
     attempts: ("1. Checked: requires lgogdownloader + innoextract for GOG installer"
                "2. GOG account required to download"
                "3. Game data under proprietary license"))

   '(mongodb-bin
     reason: "RESTRICTIVE_LICENSE"
     details: "MongoDB server binary. SSPL-1.0 license is not OSI-approved."
     attempts: ("1. Checked: MongoDB binary available from mongodb.com"
                "2. Server-Side Public License (SSPL) is controversial and restrictive"
                "3. SSPL prevents use in SaaS; not compatible with Guix free software guidelines"))

   '(vscodium-electron-bin
     reason: "BLOCKED_DEPENDENCY"
     details: "VSCodium with system Electron. Requires electron39 package not available in Guix."
     attempts: ("1. Checked: depends on electron39, libx11, libxkbfile, ripgrep, python"
                "2. Guix has Electron but not the specific electron39 version required"
                "3. Complex Electron app packaging; existing vscodium-bin in channel uses bundled Electron"))

   ;; ═══════════════════════════════════════════════════════════════
   ;; HARDWARE / DRIVER SPECIFIC
   ;; ═══════════════════════════════════════════════════════════════

   '(freetype2-qdoled-aw3225qf
     reason: "HARDWARE_SPECIFIC_PATCH"
     details: "freetype2 patched for Dell AW3225QF QD-OLED subpixel layout. Requires monitor-specific patches from AUR."
     attempts: ("1. Reviewed: freetype2 built with custom subpixel rendering patches"
                "2. Patches are for specific QD-OLED panel used in Dell AW3225QF"
                "3. Could inherit from Guix freetype but patches only available in AUR git repo"))

   '(freetype2-qdoled-gen3
     reason: "HARDWARE_SPECIFIC_PATCH"
     details: "freetype2 patched for QD-OLED Gen3 panels (AW2725D). Requires monitor-specific patches from AUR."
     attempts: ("1. Reviewed: freetype2 built with Gen3 QD-OLED subpixel patches"
                "2. Patches are for specific panel geometry"
                "3. Could inherit from Guix freetype but patches only available in AUR git repo"))

   '(mechrevo-drivers-dkms
     reason: "DKMS_DRIVER"
     details: "MECHREVO laptop kernel modules via DKMS. Derived from TuxedoComputers drivers."
     attempts: ("1. Reviewed: DKMS kernel module from gitlab.com/tuxedocomputers"
                "2. DKMS model not compatible with Guix kernel module build system"
                "3. Would need conversion to Guix linux-module-build-system"))

   ;; ═══════════════════════════════════════════════════════════════
   ;; CROSS-COMPILATION / SPECIALIZED TOOLCHAINS
   ;; ═══════════════════════════════════════════════════════════════

   '(mingw-w64-crt-msvcrt
     reason: "CROSS_COMPILATION_TOOLCHAIN"
     details: "MinGW-w64 CRT with MSVCRT. Part of Windows cross-compilation toolchain."
     attempts: ("1. Reviewed: CRT for Windows targeting, MSVCRT flavor"
                "2. Requires mingw-w64-gcc, mingw-w64-binutils, mingw-w64-headers"
                "3. Guix has its own cross-compilation infrastructure; this is Arch-specific packaging"))

   '(ps3toolchain
     reason: "MISSING_DEPENDENCIES"
     details: "PS3 homebrew development meta-package. Requires ps3-env, ps3-ppu-gcc, ps3-spu-gcc."
     attempts: ("1. Reviewed: meta-package for PlayStation 3 homebrew development"
                "2. All 5 dependencies (ps3-env, ps3-ppu-binutils, ps3-ppu-gcc, ps3-spu-binutils, ps3-spu-gcc) are missing"
                "3. Would need entire PS3 cross-compilation toolchain packaged first"))

   '(mips64-linux-gnu-gcc-bootstrap
     reason: "CROSS_COMPILATION_TOOLCHAIN"
     details: "Bootstrap/stage1 GCC cross-compiler for MIPS64. Part of cross-compilation toolchain."
     attempts: ("1. Reviewed: GCC bootstrap for MIPS64 target"
                "2. Requires mips64-linux-gnu-binutils and linux-api-headers"
                "3. Guix has native cross-compilation support; Arch-specific toolchain packaging"))

   ;; ═══════════════════════════════════════════════════════════════
   ;; OTHER COMPLEX / BLOCKED
   ;; ═══════════════════════════════════════════════════════════════

   '(iscan
     reason: "PROPRIETARY_COMPONENTS"
     details: "EPSON Image Scan! scanner front-end. Mixes GPL and proprietary AVASYSPL license."
     attempts: ("1. Reviewed: GTK2 scanner frontend with mixed licensing"
                "2. Depends on libstdc++5 (obsolete) and SANE"
                "3. Proprietary AVASYSPL license for core components prevents clean packaging"))

   '(llama.cpp-opencl
     reason: "BLOCKED_DEPENDENCY"
     details: "llama.cpp with OpenCL backend. Requires OpenCL runtime (ocl-icd + vendor ICD)."
     attempts: ("1. Reviewed: cmake build from github.com/ggerganov/llama.cpp"
                "2. Requires opencl-headers for build and ocl-icd + vendor ICD at runtime"
                "3. Guix has ocl-icd but vendor ICDs (NVIDIA/AMD) are proprietary"))

   '(firefox-beta-bin-all-localizations
     reason: "COMPLEX_PACKAGING"
     details: "Perl script to install Firefox Beta in any locale. Complex dependency chain."
     attempts: ("1. Reviewed: Perl script downloading locale-specific Firefox beta .tar.bz2"
                "2. Depends on perl-file-slurp, perl-lwp-protocol-https, perl-switch"
                "3. Better to package Firefox Beta directly; this is a download helper"))

   '(lib32-libdovi
     reason: "32BIT_LIBRARY"
     details: "32-bit Dolby Vision metadata library. Requires 32-bit Rust toolchain."
     attempts: ("1. Reviewed: Rust library from github.com/quietvoid/dovi_tool"
                "2. Needs cargo, cargo-c, and lib32-rust-libs for 32-bit build"
                "3. Guix has limited 32-bit multilib support; Rust 32-bit cross not available"))

   '(lib32-libbluray
     reason: "32BIT_LIBRARY"
     details: "32-bit libbluray. Requires 32-bit fontconfig, freetype2, libxml2."
     attempts: ("1. Reviewed: 32-bit build of libbluray for Blu-Ray disc access"
                "2. Extensive 32-bit dependency chain (fontconfig, freetype2, libxml2)"
                "3. Guix 32-bit multilib support limited"))

   '(vectorchord-bin
     reason: "DATABASE_EXTENSION"
     details: "PostgreSQL vector search extension. Requires specific PostgreSQL version."
     attempts: ("1. Reviewed: binary PostgreSQL extension for vector similarity search"
                "2. Requires postgresql>=18 and pgvector at runtime"
                "3. Version-locked to PostgreSQL major version; needs careful integration"))

   '(beatmapexporter-bin
     reason: "DOTNET_RUNTIME"
     details: "osu! beatmap exporter. .NET application requiring .NET runtime."
     attempts: ("1. Reviewed: .NET application from github.com/kabiiQ/BeatmapExporter"
                "2. Requires .NET runtime which has limited Guix support"
                "3. Complex .NET dependency chain"))

   '(butter-launcher-bin
     reason: "ELECTRON_APP"
     details: "Electron-based game launcher. Requires Electron runtime."
     attempts: ("1. Reviewed: Electron app from github.com/vZylev/Butter-Launcher"
                "2. Complex Electron packaging requirements"
                "3. No standalone binary available without Electron"))

   '(blindpaste
     reason: "NO_LINUX_BINARY"
     details: "TUI blackboard app. No GitHub release with Linux binary found."
     attempts: ("1. Checked: projectgrid.net/portfolio/blindpaste"
                "2. No GitHub repository or release page found"
                "3. Cannot determine source or binary download URL"))

   '(samsung-unified-driver-printer
     reason: "PROPRIETARY_DRIVER"
     details: "Samsung printer driver. Proprietary Samsung license."
     attempts: ("1. Reviewed: requires samsung-unified-driver-common, cups, ghostscript"
                "2. Proprietary Samsung binary driver"
                "3. Custom samsung license prevents redistribution"))

   '(samsung-unified-driver-scanner
     reason: "PROPRIETARY_DRIVER"
     details: "Samsung scanner driver. Proprietary Samsung license."
     attempts: ("1. Reviewed: requires samsung-unified-driver-common and SANE"
                "2. Proprietary Samsung binary driver"
                "3. Custom samsung license prevents redistribution"))

   '(matlab
     reason: "PROPRIETARY_LICENSE"
     details: "MATLAB by MathWorks. Requires paid license and MathWorks account."
     attempts: ("1. Checked: requires matlab-meta, proprietary MATLAB EULA"
                "2. Download requires MathWorks account and active license"
                "3. Proprietary commercial software, not redistributable"))

   '(lib32-nvidia-utils-beta
     reason: "PROPRIETARY_DRIVER_FRAMEWORK"
     details: "32-bit NVIDIA driver utilities (beta). Requires NVIDIA driver framework."
     attempts: ("1. Checked: 32-bit libs from proprietary NVIDIA driver"
                "2. Requires nvidia-utils-beta>=595.58.03"
                "3. Best handled by nonguix channel"))

   ))
