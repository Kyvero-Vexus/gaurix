;;; Blocked notes for deptree-resolver-260428d
;;; 100 BLOCKED packages evaluated, 7 recipes (6 new + 1 alias dep),
;;; 29 ALREADY_RESOLVED, 64 remain BLOCKED.
;;;
;;; Generated: 2026-04-28

;;; === NEWLY RESOLVED (6 recipes) ===
;;; 1. glfw-wayland-minecraft-cursorfix — alias to Guix glfw (10 rdeps)
;;; 2. electron37-bin — prebuilt Electron 37 binary (8 rdeps)
;;; 3. dotnet-runtime-bin + dotnet-runtime-10.0-bin — .NET 10.0 runtime (6 rdeps)
;;; 4. dotnet-targeting-pack-bin — .NET targeting pack
;;; 5. lib32-libdav1d — alias to Guix dav1d (2 rdeps)
;;; 6. cursor-ide-bin — AppImage binary

;;; === ALREADY_RESOLVED (29 packages — recipes exist in packages.scm) ===
;;; texlive-installer, mingw-w64-mpg123, docker-desktop, ut2004-data-steam,
;;; rockchip-mpp, firefox-nightly-bin, kemoticons, qpdf-zopfli,
;;; python-opentelemetry-exporter-otlp-proto-http,
;;; python-opentelemetry-exporter-otlp-proto-grpc, boost-python2,
;;; chkufsd-bin, chromium-gost, coreutils-arch, dbeaver, dms-shell,
;;; e2-studio-bin, edk2-ovmf-fedora, firedragon-alpha-bin, gradience,
;;; gram, hdfview-bin, hypnotix, jai, komodo-periphery-git,
;;; linux-gpib, luniistore, miniconda3, navicat17-premium-en

;;; === BLOCKED — PROPRIETARY_BINARY (11) ===
;;; rar — proprietary RAR compression utility, custom license prohibits redistribution
;;; samsung-unified-driver-printer — Samsung proprietary printer driver
;;; samsung-unified-driver-scanner — Samsung proprietary scanner driver
;;; chkufsd-bin — proprietary NTFS/HFS+ utility
;;; codex-desktop-bin — proprietary desktop app (not in AUR)
;;; feishu — proprietary Lark/Feishu messenger
;;; foundryvtt — proprietary VTT platform
;;; grafana-bin — proprietary Grafana enterprise binary
;;; hbuilderx-alpha-bin — proprietary HBuilderX IDE
;;; heptabase-bin — proprietary note-taking app
;;; httptoolkit-bin — proprietary HTTP debugging proxy
;;; hubstaff — proprietary time tracking software
;;; justevery-code-bin — proprietary Codex CLI fork
;;; ninjarmm-ncplayer — proprietary remote access tool
;;; cursor-ide — proprietary cursor IDE (recipe exists but proprietary)
;;; max-appimage — proprietary MAX messenger (placeholder hash)

;;; === BLOCKED — DKMS_KERNEL_MODULE (4) ===
;;; amneziawg-dkms-git — AmneziaWG VPN kernel module, requires DKMS
;;; aquacomputer_d5next-hwmon-dkms — hardware monitor kernel module
;;; nvidia-open-tinygrad-dkms-git — NVIDIA open kernel module for tinygrad
;;; nvidia-vulkan-dkms — NVIDIA Vulkan DKMS kernel module

;;; === BLOCKED — SOURCE_UNAVAILABLE (16) ===
;;; anbox-git — Android emulator project abandoned/archived
;;; audiobookshelf — not in AUR metadata
;;; bulky — file renamer, not in AUR
;;; fahviewer — Folding@Home viewer, not in AUR
;;; fluxdown-bin — download manager, not in AUR
;;; glazepkg-bin — package manager, not in AUR
;;; gram-editor-bin — text editor binary, not in AUR
;;; gram-editor-git — text editor source, not in AUR
;;; hylauncher-bin — launcher, not in AUR
;;; konform-multi-account-containers-lite — Firefox extension, not in AUR
;;; mangowc-git — MangoHud word count, not in AUR
;;; linux6.19.8.arch1-1-bin — obsolete kernel version snapshot
;;; linux6.19.8.arch1-1-docs-bin — obsolete kernel docs
;;; linux6.19.8.arch1-1-headers-bin — obsolete kernel headers
;;; linux6.19.9.arch1-1-docs-bin — obsolete kernel docs
;;; linux6.19.9.arch1-1-headers-bin — obsolete kernel headers
;;; linux6.19.9.zen1-1-zen-bin — obsolete zen kernel
;;; linux6.19.9.zen1-1-zen-headers-bin — obsolete zen kernel headers

;;; === BLOCKED — MULTILIB_UNSUPPORTED (3) ===
;;; lib32-libvmaf — 32-bit VMAF library, Guix doesn't support multilib
;;; lib32-nvidia-utils-beta — 32-bit NVIDIA utils, multilib + proprietary
;;; lib32-sdl_sound — 32-bit SDL_sound, multilib unsupported

;;; === BLOCKED — DISTRO_SPECIFIC (3) ===
;;; archwiki-offline — Arch Wiki offline data, Arch-specific
;;; chromium-extension-arch-search — Arch search extension, Arch-specific
;;; edk2-ovmf-fedora — Fedora-patched OVMF firmware (recipe exists as note)

;;; === BLOCKED — COMPLEX_DEPS (5) ===
;;; dotnet-sdk-8.0-bin — .NET SDK depends on unpackaged targeting packs
;;; aspnet-runtime-8.0-bin — ASP.NET depends on .NET runtime chain
;;; anyrun-git — Wayland launcher needing custom libraries
;;; chromium-gost — Chromium with GOST crypto, massive build
;;; llama.cpp-aio — all-in-one llama.cpp, massive CUDA/ROCm deps

;;; === BLOCKED — SELINUX_SPECIFIC (1) ===
;;; base-selinux — Arch meta-package for SELinux, not applicable to Guix

;;; === BLOCKED — LEGACY_PYTHON2 (1) ===
;;; python2-dbus — Python 2 D-Bus bindings, Python 2 EOL

;;; === BLOCKED — ABANDONED_UPSTREAM (1) ===
;;; deadbeef-mpris2-plugin — abandoned DeaDBeeF plugin, no maintained source

;;; === BLOCKED — MINGW_CROSS_COMPILATION (0 new) ===
;;; (mingw-w64-mpg123 already counted in ALREADY_RESOLVED)

;;; === BLOCKED — OTHER / STUB RECIPES (6) ===
;;; python-jaxlib-bin — placeholder hash in deptree-resolver-260426n
;;; python-pylink-square — depends on proprietary jlink-software
;;; dracut-nosystemd-git — specification->package stub, no real recipe
;;; fcitx5-meta — broken scaffold inheriting unrelated package
;;; mercury-browser-sse4-bin — specification->package stub, no real recipe
;;; nextcloud-talk-desktop-bin — specification->package stub, no real recipe
;;; neovim-lspconfig-opt-git — Neovim plugin, not in AUR cache
;;; ps3toolchain — meta-package for PS3 dev, needs 6+ PS3 toolchain packages
;;; dae-kix-git — not in AUR, source unavailable
;;; gama-platform-jdk — complex Eclipse/Java app
;;; joplin-bin — Electron app with complex .deb extraction
;;; krux-installer-bin — prebuilt app with complex deps
;;; elp — Erlang Language Platform, source unavailable
;;; epsonscan2-non-free-plugin — proprietary Epson scanner plugin
;;; coreutils-arch — Arch-named coreutils, removed from AUR
