;;; Blocked notes for recipe-resolver-260414m
;;; 20 packages blocked with reason codes

;;; #12924 ttf-ms-win10
;;;   BLOCKED: LICENSE_REVIEW_NEEDED — proprietary Microsoft fonts; must be extracted from a Windows ISO; redistribution prohibited by EULA; A1: no downloadable archive; next: human review of MS font EULA

;;; #13115 pamac-classic-fixed
;;;   BLOCKED: DEP_RESOLUTION_FAILED — requires libalpm/pacman stack not available in Guix; A1: Arch-specific package manager frontend; A2: vala + libalpm deps; next: port libalpm to Guix

;;; #13130 mkinitcpio-wifi
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Arch-specific mkinitcpio hook for WiFi in initramfs; A1: mkinitcpio not in Guix; A2: Arch initramfs-specific; next: needs Guix initrd equivalent design

;;; #13138 java11-openjfx
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — OpenJFX 11 for Java 11; A1: complex Gradle/Maven build with native WebKit/media; A2: requires JDK 11 + cmake + gtk3 + gstreamer; next: design multi-phase Java+native build

;;; #13139 java11-openjfx-doc
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — documentation package for java11-openjfx; A1: depends on java11-openjfx build; A2: javadoc generation chain; next: package java11-openjfx first

;;; #13140 java11-openjfx-src
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — source package for java11-openjfx; A1: depends on java11-openjfx; next: package java11-openjfx first

;;; #13162 portage-manifest
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Gentoo Portage manifest generator; A1: Portage-specific toolchain; A2: not useful outside Gentoo; next: evaluate cross-distro utility

;;; #13167 llvm-libunwind
;;;   BLOCKED: DEP_RESOLUTION_FAILED — LLVM's libunwind library; A1: requires full LLVM CMake infrastructure; A2: conflicts with GNU libunwind; next: integrate with Guix LLVM packaging

;;; #13171 calculix-ccx
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — CalculiX FEA solver; A1: complex Fortran+C build with SPOOLES, ARPACK deps; A2: custom Makefile build; next: design gnu-build-system with Fortran support

;;; #13180 zookeeper
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Apache ZooKeeper; A1: complex Java Maven build; A2: multi-module project with native JNI; next: design Maven-based Java build for Guix

;;; #13185 simracing-essentials
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — SimRacing tool bundle; A1: complex multi-binary package with hardware deps; A2: requires specific gamepad/wheel drivers; next: evaluate component packaging

;;; #13198 languagetool-ngrams-es
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Spanish n-gram data for LanguageTool; A1: 8GB+ download of language model data; A2: requires special hosting/mirroring; next: design large-data packaging strategy

;;; #13199 scx-scheds-git
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — sched_ext schedulers for Linux kernel; A1: requires kernel with CONFIG_SCHED_CLASS_EXT; A2: BPF + Rust + C build; next: design linux-module + BPF build system

;;; #13200 eve-ng-integration
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — EVE-NG network emulator integration; A1: requires proprietary EVE-NG platform; A2: deep Linux networking stack deps; next: evaluate packaging feasibility

;;; #13214 zephyr-sdk
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Zephyr RTOS SDK with cross-compilation toolchains; A1: multi-GB bundle of GCC cross-compilers; A2: complex SDK installer; next: design modular cross-toolchain packaging

;;; #13222 whisper.cpp-model-large-v3-turbo
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — 4.7GB GGML model file for whisper.cpp; A1: very large single-file download from HuggingFace; A2: model versioning/hosting; next: design large-model packaging

;;; #13223 xmcl-launcher
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Minecraft launcher built with Electron; A1: complex Electron + Java runtime; A2: requires Minecraft asset downloads; next: design Electron app packaging

;;; #13230 epsonscan2-non-free-plugin
;;;   BLOCKED: LICENSE_REVIEW_NEEDED — proprietary Epson scanner plugin; A1: binary-only plugin with EULA; A2: requires epsonscan2 base; next: human review of Epson EULA redistribution terms

;;; #13242 zenpower3-dkms-git
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — DKMS kernel module for AMD Zen CPU monitoring; A1: requires kernel headers and DKMS framework; A2: out-of-tree module; next: needs linux-module-build-system

;;; #13249 mkinitcpio-archlogo
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Arch Linux boot logo for mkinitcpio; A1: mkinitcpio not in Guix; A2: Arch-specific; next: not applicable to Guix initrd

