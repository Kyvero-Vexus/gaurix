;;; GNU Guix — Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for deptree-resolver-260418k
;;; 43 packages finalized as FAILED (approaches exhausted).
;;; Timestamp: 2026-04-18T11:17:27.942018+00:00
;;;
;;; This pass marks all formerly-BLOCKED packages as FAILED.
;;; The stub recipes from deptree-resolver-260418j remain as documentation.

;;; iup (#15267)
;;;   Category: COMPLEX_DEPS_EXHAUSTED
;;;   Reason: PUC-Rio IUP GUI needs libcd + tecmake build system; build chain IM->CD->IUP; 10+ passes tried; exhausted

;;; ttf-ms-office365 (#16018)
;;;   Category: PROPRIETARY_EXHAUSTED
;;;   Reason: Microsoft Office 365 proprietary fonts; EULA prohibits redistribution; no free download; exhausted

;;; fonts-apple (#14971)
;;;   Category: PROPRIETARY_EXHAUSTED
;;;   Reason: Apple restricted font license prohibits redistribution; no free alternative with same glyphs; exhausted after 10+ passes

;;; lib32-amdvlk-bin (#15531)
;;;   Category: PROPRIETARY_EXHAUSTED
;;;   Reason: AMD Vulkan 32-bit binary: proprietary + Guix lacks 32-bit multilib; exhausted

;;; otf-apple-pingfang (#15346)
;;;   Category: PROPRIETARY_EXHAUSTED
;;;   Reason: Apple PingFang font license prohibits redistribution; Noto CJK is free alternative; exhausted after 10+ passes

;;; otf-apple-pingfang-relaxed (#15347)
;;;   Category: PROPRIETARY_EXHAUSTED
;;;   Reason: Apple PingFang variant — same proprietary redistribution restriction; exhausted

;;; otf-apple-pingfang-ui (#15348)
;;;   Category: PROPRIETARY_EXHAUSTED
;;;   Reason: Apple PingFang UI variant — same proprietary restriction; exhausted

;;; palemoon-i18n-fr (#15388)
;;;   Category: MISSING_DEP_EXHAUSTED
;;;   Reason: French locale for Pale Moon browser; Pale Moon not in Guix (XUL); exhausted

;;; seamonkey-i18n-es-es (#15384)
;;;   Category: MISSING_DEP_EXHAUSTED
;;;   Reason: Spanish locale for SeaMonkey; SeaMonkey not in Guix (Gecko suite); exhausted

;;; code-server-marketplace (#15031)
;;;   Category: MISSING_DEP_EXHAUSTED
;;;   Reason: VS Code marketplace for code-server; code-server not in Guix; $EXTENSIONS_GALLERY env var provides equivalent; exhausted

;;; gde-creator-bin (#7867)
;;;   Category: SOURCE_EXHAUSTED
;;;   Reason: GDE Creator binary IDE; no public source; vendor account required; niche embedded development; exhausted

;;; libfprint-2-tod1-broadcom (#15005)
;;;   Category: PROPRIETARY_EXHAUSTED
;;;   Reason: Dell/Broadcom proprietary fingerprint binary blob; no source code; restricted license; exhausted

;;; ntsync-dkms (#15010)
;;;   Category: DKMS_EXHAUSTED
;;;   Reason: NT sync primitives DKMS; upstream in Linux >= 6.14; DKMS incompatible with Guix; users should use kernel >= 6.14; exhausted

;;; odoo18-nightly (#14669)
;;;   Category: MASSIVE_SCALE_EXHAUSTED
;;;   Reason: Odoo 18 ERP: 500+ Python deps, PostgreSQL, nightly versioning breaks reproducibility; exhausted

;;; rice-switcher (#6000)
;;;   Category: SOURCE_EXHAUSTED
;;;   Reason: Upstream repo S1rEx1/Rice-Switcher returns 404; no forks or archives found; exhausted

;;; 8192eu-dkms-git (#15373)
;;;   Category: DKMS_EXHAUSTED
;;;   Reason: Realtek RTL8192EU WiFi DKMS; rtl8xxxu in mainline kernel may cover; DKMS incompatible with Guix; exhausted

;;; arch-shell (#14726)
;;;   Category: ARCH_SPECIFIC_EXHAUSTED
;;;   Reason: Creates Arch chroots via mkarchroot/devtools/pacman; guix shell provides equivalent; no cross-distro utility; exhausted

;;; dude-bin (#14699)
;;;   Category: ARCH_SPECIFIC_EXHAUSTED
;;;   Reason: Pacman orphan manager linking against libalpm; guix gc --delete-generations provides native equivalent; exhausted

;;; mt76-dkms-git (#14914)
;;;   Category: DKMS_EXHAUSTED
;;;   Reason: MediaTek mt76 WiFi DKMS; already upstream in Linux since 5.x; DKMS incompatible with Guix; exhausted

;;; parus (#15189)
;;;   Category: ARCH_SPECIFIC_EXHAUSTED
;;;   Reason: TUI for paru AUR helper; depends on paru (Arch-only); no utility on Guix; exhausted

;;; pacwall-git (#14584)
;;;   Category: ARCH_SPECIFIC_EXHAUSTED
;;;   Reason: Dependency wallpaper using pacman -Qi exclusively; guix graph provides native alternative; exhausted

;;; pypy3-pyparsing (#15310)
;;;   Category: MISSING_DEP_EXHAUSTED
;;;   Reason: pyparsing for PyPy3; PyPy3 not in Guix (complex bootstrap); CPython pyparsing already available; exhausted

;;; rtl8821ce-dkms-git (#22214)
;;;   Category: DKMS_EXHAUSTED
;;;   Reason: Realtek RTL8821CE WiFi DKMS; rtw88 in kernel >= 5.9 covers chipset; DKMS incompatible with Guix; exhausted

;;; cn-dascom-pin-driver (#15259)
;;;   Category: SOURCE_EXHAUSTED
;;;   Reason: Dascom printer driver from vendor portal (dascom.cn); no public repo; niche hardware (1 AUR vote); exhausted

;;; lib32-liblrdf (#15349)
;;;   Category: MISSING_DEP_EXHAUSTED
;;;   Reason: 32-bit liblrdf; Guix is single-architecture (no lib32/multilib); Arch-specific concept; exhausted

;;; selinux-refpolicy-arch-git (#15487)
;;;   Category: ARCH_SPECIFIC_EXHAUSTED
;;;   Reason: Arch-patched SELinux reference policy; Guix doesn't use SELinux; distro-specific policy; exhausted

;;; starsector (#15139)
;;;   Category: PROPRIETARY_EXHAUSTED
;;;   Reason: Commercial game from Fractal Softworks requiring paid license; no free download URL; AUR expects user-provided installer; exhausted

;;; asp (#14587)
;;;   Category: ARCH_SPECIFIC_EXHAUSTED
;;;   Reason: Deprecated (Nov 2023) Arch Build System tool replaced by pkgctl; depends on pacman/devtools/Arch SVN; exhausted

;;; deezer (#21712)
;;;   Category: MISSING_DEP_EXHAUSTED
;;;   Reason: Proprietary streaming client; Windows .exe via 7z/asar; requires Electron 39 not in Guix; exhausted

;;; ec-su_axb35-dkms-git (#15411)
;;;   Category: DKMS_EXHAUSTED
;;;   Reason: Sixunited AXB35-02 embedded controller DKMS; niche hardware; DKMS incompatible with Guix; exhausted

;;; fnq-monitor (#15258)
;;;   Category: MISSING_DEP_EXHAUSTED
;;;   Reason: Fn+Q ACPI monitor for Lenovo; requires acpi_call kernel module (DKMS); no userspace alternative; exhausted

;;; olauncher (#15269)
;;;   Category: SOURCE_EXHAUSTED
;;;   Reason: Modified Minecraft launcher with custom non-free license; binary from opaque build; flagged out-of-date (1 vote); exhausted

;;; gdrcopy (#15131)
;;;   Category: MISSING_DEP_EXHAUSTED
;;;   Reason: NVIDIA GPU Direct RDMA lib+kernel module; requires CUDA SDK + gdrdrv; NVIDIA ecosystem not in Guix; exhausted

;;; devkitty-git (#15058)
;;;   Category: MISSING_DEP_EXHAUSTED
;;;   Reason: Developer tool needs Electron 41 not in Guix; GitHub releases macOS-only; no Linux binary; exhausted

;;; xilinx-ise (#14616)
;;;   Category: PROPRIETARY_EXHAUSTED
;;;   Reason: Xilinx ISE: 6GB+ registration-walled installer, EULA prohibits redistribution, depends on legacy Qt4+gcc49; exhausted

;;; pamac-all (#22052)
;;;   Category: ARCH_SPECIFIC_EXHAUSTED
;;;   Reason: Manjaro GUI package manager for libalpm/pacman/AUR/snap/flatpak; Arch-ecosystem only; exhausted

;;; python-torchaudio-rocm (#14583)
;;;   Category: MASSIVE_SCALE_EXHAUSTED
;;;   Reason: PyTorch audio with ROCm/HIP; ROCm ecosystem (100+ pkgs) not in Guix; CPU-only variant loses purpose; exhausted

;;; aiot-ide (#15062)
;;;   Category: PROPRIETARY_EXHAUSTED
;;;   Reason: Xiaomi AIoT IDE: proprietary, requires Chinese iot.mi.com account, no direct download URL, no source; exhausted

;;; vitis (#15278)
;;;   Category: PROPRIETARY_EXHAUSTED
;;;   Reason: AMD/Xilinx Vitis: 100GB+ proprietary FPGA suite, registration-walled, non-redistributable; exhausted

;;; lua-iup (#15266)
;;;   Category: COMPLEX_DEPS_EXHAUSTED
;;;   Reason: Lua 5.4 bindings for IUP; blocked because iup exhausted; exhausted

;;; lua51-iup (#15265)
;;;   Category: COMPLEX_DEPS_EXHAUSTED
;;;   Reason: Lua 5.1 bindings for IUP; blocked because iup exhausted; exhausted

;;; lua52-iup (#15264)
;;;   Category: COMPLEX_DEPS_EXHAUSTED
;;;   Reason: Lua 5.2 bindings for IUP; blocked because iup exhausted; exhausted

;;; lua53-iup (#15263)
;;;   Category: COMPLEX_DEPS_EXHAUSTED
;;;   Reason: Lua 5.3 bindings for IUP; blocked because iup exhausted; exhausted
