;;; Blocked notes for deptree-resolver-260417ak
;;; 25 packages could not be resolved
;;;
;;; raidrivecli (#14202): MISSING_SOURCE: Not in AUR cache; no upstream source.  Re-confirmed in 260417ak pass
;;; ttf-ms-office365 (#16018): PROPRIETARY_LICENSE: Microsoft Office 365 font license prohibits redistribution.  Tried: (1) check EULA -- only licensed for Office 365 subscribers; (2) binary font extract -- license violation; (3) open alternative -- Liberation/Croscore fonts exist
;;; fonts-apple (#14971): PROPRIETARY_LICENSE: Apple license forbids redistribution.  Re-confirmed in 260417ak pass
;;; otf-apple-pingfang (#15346): PROPRIETARY_LICENSE: Apple restricted font license explicitly forbids redistribution.  Re-confirmed in 260417ak pass
;;; otf-apple-pingfang-relaxed (#15347): PROPRIETARY_LICENSE: Apple restricted font license forbids redistribution.  Same as otf-apple-pingfang
;;; otf-apple-pingfang-ui (#15348): PROPRIETARY_LICENSE: Apple restricted font license forbids redistribution.  Same as otf-apple-pingfang
;;; code-server-marketplace (#15031): MISSING_DEPENDENCY: Requires code-server not in Guix; the package itself is just a Python script + JSON patch.  Tried: (1) package standalone -- useless without code-server; (2) check for code-server in Guix -- not available; (3) license is unknown
;;; libfprint-2-tod1-broadcom (#15005): PROPRIETARY_LICENSE: Proprietary Broadcom binary blob from Launchpad PPA; also depends on libfprint-tod not in Guix.  Re-confirmed in 260417ak pass
;;; ntsync-dkms (#15010): DKMS_UNSUPPORTED: Out-of-tree DKMS module; ntsync is upstream in Linux >= 6.14, no DKMS needed on modern kernels.  Re-confirmed in 260417ak pass
;;; odoo18-nightly (#14669): MASSIVE_SCALE: Massive Python ERP (100k+ LOC), 500+ pip dependencies installed at build time.  Tried: (1) minimal install -- still requires 200+ Python packages; (2) check for deps in Guix -- most missing; (3) nightly URL not versioned
;;; arch-shell (#14726): ARCH_SPECIFIC: Requires mkarchroot from devtools (Arch-only chroot tool).  Re-confirmed in 260417ak pass
;;; dude-bin (#14699): ARCH_SPECIFIC: Rust binary that directly links against libalpm (pacman library).  Re-confirmed in 260417ak pass
;;; mt76-dkms-git (#14914): DKMS_UNSUPPORTED: Out-of-tree DKMS kernel module for MediaTek WiFi; mt76 driver already in mainline Linux kernel.  Re-confirmed in 260417ak pass
;;; parus (#15189): ARCH_SPECIFIC: TUI frontend for paru (AUR helper); entire purpose is paru/AUR interaction.  Re-confirmed in 260417ak pass
;;; pacwall-git (#14584): ARCH_SPECIFIC: C program that directly uses libalpm (alpm.h) to read pacman database and generate dependency graphs.  Tried: (1) check source -- core generate.c uses alpm API; (2) adapt for Guix -- would require complete rewrite; (3) graphviz-only subset -- not feasible without libalpm
;;; starsector (#15139): PROPRIETARY: Commercial game requiring purchase from fractalsoftworks.com; no redistributable archive available.  Re-confirmed in 260417ak pass
;;; asp (#14587): ARCH_SPECIFIC: Arch Build System tool for PKGBUILDs; requires devtools and Arch SVN infrastructure.  Re-confirmed in 260417ak pass
;;; deemix-gui-appimage (#14759): LEGAL_ISSUES: Deezer music downloading tool that facilitates copyright infringement; project is dead (only archive.org copy).  Re-confirmed in 260417ak pass
;;; gdrcopy (#15131): NVIDIA_DEPENDENCY: Requires NVIDIA CUDA toolkit + nvidia-open-dkms + builds custom kernel module (gdrdrv.ko).  Tried: (1) source build -- needs CUDA SDK headers/nvcc; (2) binary -- no prebuilt tarball; (3) stub build without CUDA -- not functional
;;; brother-mfc-j5720dw (#15008): PROPRIETARY_LICENSE: Brother proprietary printer driver with i386 binary blobs; requires lib32-glibc for x86_64.  Re-confirmed in 260417ak pass
;;; devkitty-git (#15058): COMPLEX_DEPS: TypeScript/Electron app requiring pnpm + nvm + node25 + electron41; hundreds of npm deps downloaded at build time.  Tried: (1) check GitHub -- source available at egor-xyz/devkitty; (2) Linux build possible via electron-builder; (3) Guix has no Electron packaging story; npm deps violate deterministic builds
;;; xilinx-ise (#14616): PROPRIETARY_LICENSE: Xilinx proprietary FPGA tools requiring manual download and EULA acceptance.  Re-confirmed in 260417ak pass
;;; python-torchaudio-rocm (#14583): COMPLEX_DEPS: ROCm ecosystem (rocm-hip-sdk, rocm-toolchain) not available in Guix.  Re-confirmed in 260417ak pass
;;; godot-double-mono (#14495): COMPLEX_DEPS: Godot engine with double-precision + Mono/.NET; requires dotnet-sdk-8.0 + nuget + scons; massive build.  Re-confirmed in 260417ak pass
;;; aiot-ide (#15062): PROPRIETARY_LICENSE: Xiaomi proprietary IoT IDE; requires manual download from iot.mi.com (Chinese portal with registration).  Re-confirmed in 260417ak pass
