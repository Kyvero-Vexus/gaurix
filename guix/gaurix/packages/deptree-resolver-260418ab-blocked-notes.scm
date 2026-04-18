;;; Notes for deptree-resolver-260418ab
;;; 66 packages moved to FAILED status
;;; 11 packages remain BLOCKED
;;;
;;; === FAILED packages ===
;;; yay (#21311): DISTRO_SPECIFIC: AUR helper written in Go; depends on pacman/libalpm Arch infrastructure
;;; mingw-w64-pkg-config (#11159): CROSS_TOOLCHAIN: MinGW-w64 pkg-config wrapper; requires complete MinGW cross-compilation toolchain
;;; aurutils (#11354): DISTRO_SPECIFIC: AUR helper/automation tool; depends entirely on pacman/makepkg Arch ecosystem
;;; tensorrt (#7025): PROPRIETARY_SDK: NVIDIA TensorRT proprietary inference SDK; requires NVIDIA developer agreement
;;; libpamac-aur (#5099): DISTRO_SPECIFIC: pamac library for Arch package management (pacman/AUR); not portable to Guix
;;; anbox-git (#58): MISSING_SOURCE: Anbox project abandoned upstream; no active source repository
;;; chromium-gost (#757): COMPLEX_BUILD: Chromium fork with Russian GOST cryptography; Chromium builds require 40GB+ RAM and hours of build time
;;; codeql (#7002): PROPRIETARY_SDK: GitHub CodeQL proprietary code analysis engine; non-free license
;;; codex-desktop-bin (#1490): PROPRIETARY_APP: OpenAI Codex proprietary desktop app; closed-source
;;; cursor-ide (#5426): PROPRIETARY_APP: Cursor AI proprietary IDE; closed-source Electron app
;;; fahviewer (#10672): MISSING_SOURCE: Folding@home Viewer; not in AUR metadata cache
;;; glazepkg-bin (#2564): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; gram-editor-git (#2986): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; hylauncher-bin (#1263): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; komodo-periphery-git (#2810): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; konform-multi-account-containers-lite (#319): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; ktlint-compose-rules (#14186): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; linux6.19.8.arch1-1-bin (#7510): KERNEL_BINARY: version-pinned Arch kernel binary; not distributable or meaningful outside Arch
;;; linux6.19.8.arch1-1-docs-bin (#7512): KERNEL_BINARY: version-pinned Arch kernel docs binary; not distributable outside Arch
;;; linux6.19.8.arch1-1-headers-bin (#7511): KERNEL_BINARY: version-pinned Arch kernel headers binary; not distributable outside Arch
;;; linux6.19.9.arch1-1-bin (#9670): KERNEL_BINARY: version-pinned Arch kernel binary; not distributable or meaningful outside Arch
;;; linux6.19.9.arch1-1-docs-bin (#9672): KERNEL_BINARY: version-pinned Arch kernel docs binary; not distributable outside Arch
;;; linux6.19.9.arch1-1-headers-bin (#9671): KERNEL_BINARY: version-pinned Arch kernel headers binary; not distributable outside Arch
;;; linux6.19.9.zen1-1-zen-bin (#9956): KERNEL_BINARY: version-pinned Zen kernel binary; not distributable outside Arch
;;; linux6.19.9.zen1-1-zen-docs-bin (#9958): KERNEL_BINARY: version-pinned Zen kernel docs binary; not distributable outside Arch
;;; linux6.19.9.zen1-1-zen-headers-bin (#9957): KERNEL_BINARY: version-pinned Zen kernel headers binary; not distributable outside Arch
;;; llama.cpp-aio (#2097): COMPLEX_BUILD: llama.cpp all-in-one with CUDA/ROCm/Vulkan backends; massive build matrix not feasible in single pass
;;; mingw-w64-environment (#11244): CROSS_TOOLCHAIN: MinGW-w64 environment setup; requires complete MinGW cross-compilation toolchain
;;; nodejs-ripencli (#13452): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; nvidia-vulkan-dkms (#548): DKMS_MODULE: NVIDIA Vulkan beta driver DKMS module; Guix handles drivers via operating-system config
;;; openai-codex-autoup-bin (#1578): PROPRIETARY_APP: OpenAI Codex auto-updater; closed-source proprietary tool
;;; pinapp (#13442): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; projtlauncher (#6759): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; shimmy-bin (#7482): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; shorinclip-git (#1149): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; vivaldi-ffmpeg-codecs (#24): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; xr-passthrough-layer-git (#12741): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; apple-fonts (#11638): NON_DISTRIBUTABLE: Apple proprietary fonts; license forbids redistribution
;;; easytax-ag-2024 (#13607): PROPRIETARY_APP: EasyTax proprietary tax software; closed-source commercial application
;;; fallout1-ce-game (#12753): PROPRIETARY_GAME: Fallout 1 game data; requires original proprietary game files
;;; gnix (#3055): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; libsdrplay (#11211): PROPRIETARY_LIB: SDRplay proprietary API library; closed-source, vendor-restricted distribution
;;; linux-zen-git-headers (#6303): KERNEL_BINARY: Linux Zen kernel headers from git; Guix builds kernel headers from source
;;; makepkg-optimize-mold (#4150): DISTRO_SPECIFIC: makepkg plugin for mold linker; Arch makepkg-specific
;;; mechrevo-drivers-dkms (#473): DKMS_MODULE: MechRevo laptop DKMS drivers; out-of-tree kernel module not portable to Guix
;;; oopz (#3480): MISSING_SOURCE: not in AUR metadata cache; package likely removed or renamed
;;; opencl-legacy-amdgpu-pro (#11299): PROPRIETARY_DRIVER: AMD legacy OpenCL proprietary driver; non-free redistribution restricted
;;; pacman-cleanup-hook (#13341): DISTRO_SPECIFIC: pacman hook for cleaning package cache; Arch-specific
;;; pacolog (#5092): DISTRO_SPECIFIC: pacman log viewer; depends on Arch pacman infrastructure
;;; powerofforreboot.efi (#1628): EFI_BINARY: EFI binary for power management; specialized UEFI build toolchain needed
;;; pureref (#7048): PROPRIETARY_APP: PureRef proprietary image reference tool; closed-source binary, license restricts redistribution
;;; r8125-dkms (#11854): DKMS_MODULE: Realtek RTL8125 ethernet DKMS driver; Guix uses operating-system config for kernel modules
;;; replit-desktop-app (#10401): PROPRIETARY_APP: Replit proprietary IDE desktop app; closed-source Electron app
;;; saleae-logic2 (#4639): PROPRIETARY_APP: Saleae Logic 2 proprietary logic analyzer software; closed-source
;;; sh-elf-newlib (#7617): CROSS_TOOLCHAIN: SuperH ELF newlib C library; requires complete SH cross-compilation toolchain
;;; skillshare (#12843): PROPRIETARY_APP: Skillshare proprietary learning platform client; closed-source
;;; ssacli-bin (#3334): PROPRIETARY_APP: HPE Smart Storage Administrator CLI; proprietary vendor binary
;;; stack-wallet-appimage (#10201): PROPRIETARY_APP: Stack Wallet AppImage; proprietary cryptocurrency wallet
;;; storcli (#284): PROPRIETARY_APP: Broadcom/LSI StorCLI proprietary RAID management tool; vendor binary redistribution restricted
;;; systemd-oomd-defaults (#7445): DISTRO_SPECIFIC: systemd-oomd configuration defaults for Arch; Arch-specific packaging
;;; tetrio-desktop (#992): PROPRIETARY_GAME: TETR.IO proprietary game client; closed-source
;;; tuxedo-drivers-dkms (#11527): DKMS_MODULE: TUXEDO Computers DKMS drivers; out-of-tree kernel module not portable to Guix
;;; unreal-tournament-data-archiveorg (#3518): PROPRIETARY_GAME: Unreal Tournament game data from Archive.org; proprietary game assets
;;; android-platform (#8355): DISTRO_SPECIFIC: Android platform tools meta-package for Arch; AUR-specific packaging
;;; archlinux-java-run (#12875): DISTRO_SPECIFIC: Arch Linux Java version selector; uses archlinux-java infrastructure
;;; bcachefs-kernel-dkms-git (#12139): DKMS_MODULE: bcachefs DKMS kernel module; Guix handles filesystem drivers via operating-system config
;;;
;;; === Still BLOCKED ===
;;; gst-thumbnailers (#6543): MISSING_SOURCE: not found in AUR metadata cache
;;; audiobookshelf (#3880): MISSING_SOURCE: not found in AUR metadata cache
;;; bulky (#5151): MISSING_SOURCE: not found in AUR metadata cache
;;; dbeaver (#15): MISSING_SOURCE: not found in AUR metadata cache
;;; diffnav-bin (#5141): MISSING_SOURCE: not found in AUR metadata cache
;;; fluxdown-bin (#3420): MISSING_SOURCE: not found in AUR metadata cache
;;; gram-editor-bin (#5457): MISSING_SOURCE: not found in AUR metadata cache
;;; hypnotix (#398): MISSING_SOURCE: not found in AUR metadata cache
;;; opensc-p11-kit-module (#7333): MISSING_SOURCE: not found in AUR metadata cache
;;; whatsapp-for-linux (#46): MISSING_SOURCE: not found in AUR metadata cache
;;; zettlr (#38): MISSING_SOURCE: not found in AUR metadata cache
