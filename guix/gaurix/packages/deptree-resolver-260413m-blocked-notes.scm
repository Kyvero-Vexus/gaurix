;;; deptree-resolver-260413m-blocked-notes.scm
;;; Blocked packages documentation for run deptree-resolver-260413m
;;; Generated: 2026-04-13T21:57:48.649231+00:00
;;; 81 packages blocked with documented reasons.

(define-module (gaurix packages deptree-resolver-260413m-blocked-notes))

;;; Blocked packages:
;;; Summary by reason:
;;;   ARCH_SPECIFIC: 8
;;;   DKMS_KERNEL_MODULE: 9
;;;   DOTNET_UNSUPPORTED: 2
;;;   ELECTRON_APP: 2
;;;   INFEASIBLE_BUILD: 1
;;;   LIB32_UNSUPPORTED: 5
;;;   NEEDS_RECIPE_DESIGN: 10
;;;   PROPRIETARY_FONT_LICENSE: 14
;;;   SOURCE_UNAVAILABLE: 30
;;;
;;; nvidia-utils-beta (#12012): NEEDS_RECIPE_DESIGN -- NVIDIA driver component; complex proprietary binary with system library deps
;;; sonic-win (#11979): NEEDS_RECIPE_DESIGN -- Desktop environment component; complex dependency tree of 61 packages
;;; lib32-xrizer (#256): LIB32_UNSUPPORTED -- lib32 multilib; Guix does not use multilib
;;; plasma-workspace-povd (#2890): NEEDS_RECIPE_DESIGN -- Very complex build with 113 dependencies; needs manual packaging
;;; lib32-l-smash (#12171): LIB32_UNSUPPORTED -- lib32 multilib; Guix does not use multilib
;;; new-lg4ff-dkms-git (#11866): DKMS_KERNEL_MODULE -- DKMS kernel module or custom kernel
;;; lib32-libudev0-shim (#11976): LIB32_UNSUPPORTED -- lib32 multilib; Guix does not use multilib
;;; hid-fanatecff-dkms (#12124): DKMS_KERNEL_MODULE -- DKMS kernel module or custom kernel
;;; yabridgectl-wine10-git (#11948): NEEDS_RECIPE_DESIGN -- Depends on Wine; complex multi-architecture build
;;; linux-cachyos-lts (#1755): DKMS_KERNEL_MODULE -- Custom kernel build
;;; linux-cachyos (#1070): DKMS_KERNEL_MODULE -- Custom kernel build
;;; linux-cachyos-rc (#10770): DKMS_KERNEL_MODULE -- Custom kernel build
;;; qt6-base-hifps (#12026): NEEDS_RECIPE_DESIGN -- Qt6 variant; very complex build with 66 dependencies
;;; anbox-git (#58): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; chromium-gost (#757): INFEASIBLE_BUILD -- Full Chromium build; impractically complex
;;; gram-editor-git (#2986): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; linux6.19.8.arch1-1-bin (#7510): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; linux6.19.8.arch1-1-docs-bin (#7512): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; linux6.19.8.arch1-1-headers-bin (#7511): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; linux6.19.9.arch1-1-bin (#9670): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; linux6.19.9.arch1-1-docs-bin (#9672): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; linux6.19.9.arch1-1-headers-bin (#9671): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; linux6.19.9.zen1-1-zen-bin (#9956): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; linux6.19.9.zen1-1-zen-docs-bin (#9958): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; linux6.19.9.zen1-1-zen-headers-bin (#9957): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; llama.cpp-aio (#2097): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; nvidia-vulkan-dkms (#548): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; openai-codex-autoup-bin (#1578): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; opensc-p11-kit-module (#7333): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; pac-pacman-aliases (#9004): ARCH_SPECIFIC -- Arch Linux-specific package (pacman/systemd hook/AUR helper)
;;; pacman-log-orphans-hook (#11596): ARCH_SPECIFIC -- Arch Linux-specific package (pacman/systemd hook/AUR helper)
;;; pipewire-enable-bluez5 (#3243): SOURCE_UNAVAILABLE -- Meta-package with no source; enables PipeWire Bluetooth support
;;; projtlauncher (#6759): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; python-uharfbuzz (#12043): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; shimmy-bin (#7482): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; shorinclip-git (#1149): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; subs2srs-git (#2878): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; ttf-ms-win10-japanese (#12925): PROPRIETARY_FONT_LICENSE -- Proprietary Microsoft font; license prohibits redistribution
;;; ttf-ms-win10-korean (#12926): PROPRIETARY_FONT_LICENSE -- Proprietary Microsoft font; license prohibits redistribution
;;; ttf-ms-win10-other (#12931): PROPRIETARY_FONT_LICENSE -- Proprietary Microsoft font; license prohibits redistribution
;;; ttf-ms-win10-sea (#12927): PROPRIETARY_FONT_LICENSE -- Proprietary Microsoft font; license prohibits redistribution
;;; ttf-ms-win10-thai (#12928): PROPRIETARY_FONT_LICENSE -- Proprietary Microsoft font; license prohibits redistribution
;;; ttf-ms-win10-zh_cn (#12929): PROPRIETARY_FONT_LICENSE -- Proprietary Microsoft font; license prohibits redistribution
;;; ttf-ms-win10-zh_tw (#12930): PROPRIETARY_FONT_LICENSE -- Proprietary Microsoft font; license prohibits redistribution
;;; ttf-ms-win11-japanese (#22454): PROPRIETARY_FONT_LICENSE -- Proprietary Microsoft font; license prohibits redistribution
;;; ttf-ms-win11-korean (#22455): PROPRIETARY_FONT_LICENSE -- Proprietary Microsoft font; license prohibits redistribution
;;; ttf-ms-win11-other (#22460): PROPRIETARY_FONT_LICENSE -- Proprietary Microsoft font; license prohibits redistribution
;;; ttf-ms-win11-sea (#22456): PROPRIETARY_FONT_LICENSE -- Proprietary Microsoft font; license prohibits redistribution
;;; ttf-ms-win11-thai (#22457): PROPRIETARY_FONT_LICENSE -- Proprietary Microsoft font; license prohibits redistribution
;;; ttf-ms-win11-zh_cn (#22458): PROPRIETARY_FONT_LICENSE -- Proprietary Microsoft font; license prohibits redistribution
;;; ttf-ms-win11-zh_tw (#22459): PROPRIETARY_FONT_LICENSE -- Proprietary Microsoft font; license prohibits redistribution
;;; vdhcoapp (#7274): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; vivaldi-ffmpeg-codecs (#24): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; whatsapp-for-linux (#46): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; zettlr (#38): SOURCE_UNAVAILABLE -- Not in AUR metadata; no upstream source available
;;; ancient-packages (#3325): ARCH_SPECIFIC -- Arch-specific package management tool
;;; binder_linux-dkms (#12149): DKMS_KERNEL_MODULE -- DKMS kernel module or custom kernel
;;; lib32-libtxc_dxtn (#10703): LIB32_UNSUPPORTED -- lib32 multilib; Guix does not use multilib
;;; lib32-zix (#2584): LIB32_UNSUPPORTED -- lib32 multilib; Guix does not use multilib
;;; linux-zen-versioned-docs-bin (#9955): DKMS_KERNEL_MODULE -- Custom kernel build
;;; linux-zen-versioned-headers-bin (#9954): DKMS_KERNEL_MODULE -- Custom kernel build
;;; localepurge-hook (#1130): SOURCE_UNAVAILABLE -- No upstream URL in AUR metadata
;;; mandb-instant-update (#10058): SOURCE_UNAVAILABLE -- No upstream URL in AUR metadata
;;; mkinitcpio-sd-numlock (#12123): ARCH_SPECIFIC -- Depends on mkinitcpio (Arch-specific initramfs tool)
;;; oopz (#3480): ELECTRON_APP -- Electron app; no Guix Electron packaging path
;;; paccache-hook (#11783): ARCH_SPECIFIC -- Arch Linux-specific package (pacman/systemd hook/AUR helper)
;;; systemd-boot-pacman-hook (#1584): ARCH_SPECIFIC -- Arch Linux-specific package (pacman/systemd hook/AUR helper)
;;; yaycache-hook (#15341): SOURCE_UNAVAILABLE -- No upstream URL in AUR metadata
;;; youtube-music-desktop (#3192): SOURCE_UNAVAILABLE -- No upstream URL in AUR metadata
;;; amneziawg-dkms (#11762): DKMS_KERNEL_MODULE -- DKMS kernel module or custom kernel
;;; arch-gdm-theme-list (#9822): SOURCE_UNAVAILABLE -- Arch-specific GDM theme list; source unavailable
;;; ccusage (#4690): NEEDS_RECIPE_DESIGN -- Node.js/npm package; complex dependency bundling not yet supported
;;; checkupdates-notify (#2850): ARCH_SPECIFIC -- Depends on Arch-specific tool (pacman-contrib/pacman)
;;; claude-agent-acp (#2533): NEEDS_RECIPE_DESIGN -- Node.js/npm package; complex dependency bundling not yet supported
;;; critique (#4383): NEEDS_RECIPE_DESIGN -- Depends on Bun JavaScript runtime; not available in Guix
;;; csharpier (#925): DOTNET_UNSUPPORTED -- .NET/C# package; needs dotnet build infrastructure
;;; cython2 (#10740): NEEDS_RECIPE_DESIGN -- Depends on Python 2; python2 deprecated/removed from Guix
;;; deezer-enhanced (#360): ELECTRON_APP -- Electron app; no Guix Electron packaging path
;;; discord-chat-exporter-plus-cli (#3117): DOTNET_UNSUPPORTED -- .NET/C# package; needs dotnet build infrastructure
;;; etckeeper-packages (#2485): ARCH_SPECIFIC -- Depends on Arch-specific tool (pacman-contrib/pacman)
;;; famitracker (#9941): NEEDS_RECIPE_DESIGN -- Depends on Wine; complex multi-architecture build
