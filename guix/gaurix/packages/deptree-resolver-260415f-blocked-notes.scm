;;; deptree-resolver-260415f blocked notes
;;;
;;; Packages that remain BLOCKED with exhausted approaches:
;;;
;;; MISSING_SOURCE (23 packages - not in AUR metadata cache):
;;; anbox-git, gram-editor-git, linux6.19.8.arch1-1-bin,
;;; linux6.19.8.arch1-1-docs-bin, linux6.19.8.arch1-1-headers-bin,
;;; linux6.19.9.arch1-1-bin, linux6.19.9.arch1-1-docs-bin,
;;; linux6.19.9.arch1-1-headers-bin, linux6.19.9.zen1-1-zen-bin,
;;; linux6.19.9.zen1-1-zen-docs-bin, linux6.19.9.zen1-1-zen-headers-bin,
;;; llama.cpp-aio, nodejs-ripencli, nvidia-vulkan-dkms,
;;; openai-codex-autoup-bin, opensc-p11-kit-module, pinapp,
;;; projtlauncher, shimmy-bin, shorinclip-git, vivaldi-ffmpeg-codecs,
;;; whatsapp-for-linux, zettlr
;;;
;;; ARCH_SPECIFIC (5 packages - Arch Linux only):
;;; clean-chroot-manager (pacman/devtools wrapper)
;;; goatdkernel (Arch kernel builder)
;;; oxidizr-arch (pacman coreutils replacer)
;;; pacboost (pacman frontend)
;;; parui-git (paru/yay TUI frontend)
;;;
;;; CROSS_COMPILE / LIB32 (5 packages - not applicable in Guix):
;;; lib32-libdovi (32-bit Dolby Vision lib, no multilib in Guix)
;;; lib32-libstdc++5 (32-bit legacy GCC C++ lib, no multilib)
;;; lib32-opencl-nvidia-beta (32-bit NVIDIA OpenCL, no multilib)
;;; mingw-w64-mariadb-connector-c (MinGW cross-compile target)
;;; mipsel-linux-gnu-gcc (MIPS cross-compiler, specialized)
;;;
;;; PROPRIETARY_BINARY (8 packages - redistribution/license issues):
;;; furmark (freeware, no source, proprietary binary)
;;; masterpdfeditor-free (proprietary freeware, no source)
;;; dnspyex-wine-bin (requires Wine, .NET app, complex)
;;; lacuna-webpki (proprietary, unknown license)
;;; nvidia-beta (proprietary NVIDIA driver)
;;; opencl-amd-dev (proprietary AMD OpenCL)
;;; psychonauts (commercial game, needs purchase)
;;; osu (proprietary rhythm game)
;;;
;;; COMPLEX_DEPS (14 packages - unresolvable dependency chains):
;;; dms-shell-git (needs quickshell/dgop, not in Guix)
;;; gnome-shell-extension-pano-git (GNOME ext, npm/yarn build)
;;; jellyseerr (Node.js/pnpm, massive npm deps)
;;; laborejo (needs libcalfbox-lss, not in Guix)
;;; patroneo (needs libcalfbox-lss, not in Guix)
;;; onedrivegui-git (PySide6/onedrive-abraunegg, complex)
;;; openrgb-plugin-effects-git (needs openrgb plugin API)
;;; pear-desktop-git (Electron app, npm build)
;;; min (Electron app, npm build)
;;; sickrage-git (unmaintained, Python virtualenv)
;;; rime-frost-git (needs librime with Lua, rime-prelude)
;;; language-toolkit (Rust with complex cargo deps, no Cargo.lock)
;;; qobuz-player (Rust + protobuf + npm, multi-toolchain)
;;; redeclipse (needs game data from custom source, complex build)
;;;
;;; ALREADY_EXHAUSTED in prior passes (16 packages):
;;; firefox-nightly-i18n-pt-br, muzak, pacdiff-pacman-hook-git,
;;; reboot-arch-btw, happy-cli, immich-cli, lib32-python311-bin,
;;; libloot, llama.cpp-clblast, loginized, nbb,
;;; neural-amp-modeler-lv2, nvidia-340xx-dkms, omnissa-horizon-integrated-printing,
;;; osuboot-git, perplexity, portage-manifest
;;;
;;; ALREADY_RESOLVED in prior passes (7 packages):
;;; calculix-ccx, gashell, git-series-git, keepassxc-cryptomator,
;;; linux-firmware-liquidio-git, linux-firmware-qlogic-git, pacboost-bin,
;;; radeon-gpu-profiler
;;;
;;; RESOLVED with new recipes in deptree-resolver-260415f.scm (19 packages):
;;; gnu-apl, opentyrian (opentyrian-git), releng-tool,
;;; luaunbound, lxappearance-obconf-gtk3, pass-audit,
;;; python-requirements-language-server, ajantv2-tools,
;;; pins (pins-git), onset (onset-git), oniri (oniri-git),
;;; proxybridge (proxybridge-git), onthespot-bin (onthespot-appimage),
;;; libreoffice-extension-writingtool-bin,
;;; linux-firmware-bnx2x (linux-firmware-bnx2x-git),
;;; linux-firmware-marvell (linux-firmware-marvell-git),
;;; linux-firmware-mellanox (linux-firmware-mellanox-git),
;;; linux-firmware-nfp (linux-firmware-nfp-git),
;;; linux-firmware-qcom (linux-firmware-qcom-git)
;;;
;;; Also marking DONE: renesas-flash-programmer-bin
;;; (copy-build-system binary package with proprietary license,
;;;  but source is a standard .tar.gz from Renesas website)
