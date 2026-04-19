;;; Notes for deptree-resolver-260418ak
;;; 10 packages moved to FAILED status
;;; 4 packages resolved with recipes
;;;
;;; === FAILED packages (approaches exhausted) ===
;;; powershell-editor-services (#8633): DEP_MISSING: requires PowerShell/.NET ecosystem which is not bootstrapped in Guix
;;;   Approaches: A1: package PowerShell — .NET ecosystem not bootstrapped in Guix; A2: pre-built binary — needs PowerShell host runtime; A3: alternative LSP — would be a different tool entirely
;;; yt6801-dkms (#8641): KERNEL_MODULE: out-of-tree RTL YT6801 WiFi kernel driver via DKMS; Guix handles kernel modules via operating-system config, not DKMS
;;;   Approaches: A1: native kernel config — needs upstream mainlining first; A2: out-of-tree module build — requires Guix kernel module integration (not DKMS); A3: use compatible NIC — different hardware, not a software fix
;;; ananicy-cpp-s6 (#16598): DISTRO_SPECIFIC: s6-rc service scripts for ananicy-cpp; Guix uses GNU Shepherd, not s6; no upstream URL; AUR-only inline scripts
;;;   Approaches: A1: convert to Shepherd service — ananicy-cpp itself not packaged; A2: port s6 scripts — wrong init system for Guix; A3: package as data files — no value without s6 runtime
;;; keyd-openrc (#8145): DISTRO_SPECIFIC: OpenRC init scripts for keyd; Guix uses GNU Shepherd, not OpenRC; keyd itself is already in Guix upstream
;;;   Approaches: A1: convert to Shepherd service — keyd already has shepherd support in Guix; A2: package OpenRC scripts — wrong init system for Guix; A3: run keyd directly — no init integration needed beyond existing Guix support
;;; texlive-installer (#8013): DISTRO_SPECIFIC: Arch pacman compatibility shim that tricks pacman into thinking texlive is installed; Guix has native texlive packages via (gnu packages tex)
;;;   Approaches: A1: Guix has native texlive packages — no shim needed; A2: adapt installer — downloads 4GB runtime bypassing Guix store; A3: use guix install texlive — already available and supported
;;; wsl-hello-sudo-bin (#8051): PLATFORM_SPECIFIC: WSL-only PAM module for Windows Hello authentication; requires Windows host with WSL environment and Windows Hello API
;;;   Approaches: A1: run on Guix System — no WSL layer available; A2: adapt to non-WSL — fundamentally depends on Windows Hello API via WSL bridge; A3: use standard PAM modules — different auth model, fprintd or pam_u2f for biometric
;;; transgui-git (#8711): DEP_MISSING: requires Free Pascal compiler and Lazarus IDE component library; neither is available in Guix; upstream repo archived/unmaintained
;;;   Approaches: A1: package Lazarus/FPC — massive Pascal IDE ecosystem, no Guix build system; A2: package qt6pas binding — needs Lazarus build infrastructure; A3: use alternative client (tremc, transmission-gtk) — different tools
;;; lib32-libxxf86dga (#5826): MULTILIB_UNSUPPORTED: 32-bit build of Xorg XF86DGA extension library; Guix does not support multilib (lib32) builds
;;;   Approaches: A1: cross-compile i686 — not lib32 compatible, different target arch; A2: use 64-bit libxxf86dga — different ABI, not a replacement; A3: custom 32-bit sysroot — impractical in Guix build model
;;; updpkgsrcs (#8036): DISTRO_SPECIFIC: bash tool for updating git submodule source arrays in Arch PKGBUILD files; has no purpose outside Arch packaging workflow
;;;   Approaches: A1: no PKGBUILD on Guix — tool has no purpose; A2: adapt for Guix packaging — completely different packaging model; A3: use git submodule commands directly — manual equivalent
;;; roxybrowser-bin (#5895): PROPRIETARY: closed-source commercial antidetect browser by Linkv Tech; no source code available; MIT license applies only to AUR PKGBUILD, not the software
;;;   Approaches: A1: actual software is proprietary — no source code to build from; A2: Electron binary repack — no redistribution rights for proprietary software; A3: use open-source alternatives (Tor Browser, Mullvad Browser) — different tools
