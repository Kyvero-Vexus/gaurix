;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413ah pass.
;;; 10 packages re-blocked as NEEDS_RECIPE_DESIGN_EXHAUSTED.

;;; ── wiso-steuer-2026 (#3733) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_WINE: German tax software
;;; (Buhl Data Service), proprietary Windows-only .msi requiring Wine + wine-mono
;;; + wine-gecko + winetricks; custom license prohibits redistribution;
;;; A1: no source code available; A2: Wine wrapper is fragile and breaks between
;;; versions; A3: proprietary license blocks packaging in any form

;;; ── dolphin-anty-bin (#3735) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY: anti-detect browser for
;;; multi-accounting with browser fingerprint management; proprietary closed-source;
;;; A1: no source code available; A2: ethically questionable primary use case;
;;; A3: not suitable for free software distribution channel

;;; ── vscodium-bin-marketplace (#3761) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — TOS_VIOLATION: patch scripts to enable
;;; Microsoft VS Code Marketplace in VSCodium; Microsoft Marketplace ToS only permits
;;; use with official Microsoft VS Code builds;
;;; A1: ToS violation makes this non-distributable; A2: Open VSX is the legitimate
;;; alternative for VSCodium; A3: Guix already has VSCodium package

;;; ── linux-g14 (#3762) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — KERNEL_INCOMPATIBLE: custom Linux kernel
;;; fork with ASUS ROG laptop patches; requires full kernel compilation toolchain
;;; including Rust; incompatible with Guix declarative kernel model;
;;; A1: kernel forks require continuous maintenance; A2: individual patches could be
;;; applied to Guix kernel config instead; A3: Guix kernel packaging model does not
;;; support arbitrary kernel forks well

;;; ── playdate-sdk (#3814) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY: Panic Inc. proprietary SDK
;;; for Playdate handheld game console; requires login to download; custom license
;;; prohibits redistribution;
;;; A1: no public download URL (requires authentication); A2: license prohibits
;;; redistribution; A3: proprietary development tools not suitable for Guix

;;; ── gnome-system-tools (#7365) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DISCONTINUED: GNOME system configuration
;;; utilities abandoned since 2010-era; last upstream activity from LStranger fork
;;; was 2020; no active development;
;;; A1: dead project with no maintainer; A2: functionality superseded by GNOME
;;; Settings and Cockpit; A3: would require porting to modern GTK (currently GTK2)

;;; ── mandb-ondemand (#4043) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: shell scripts + systemd
;;; units + pacman hooks to rebuild man-db asynchronously; entirely Arch/pacman-specific;
;;; A1: depends on pacman hooks (no equivalent in Guix); A2: Guix handles man-db
;;; rebuilds through its own profile mechanisms; A3: no utility outside Arch ecosystem

;;; ── sage-numerical-backends-gurobi (#4053) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_DEP: Python/Cython backend
;;; connecting SageMath to the Gurobi mixed integer linear programming solver;
;;; requires proprietary Gurobi solver (commercial, paid license);
;;; A1: Gurobi is proprietary and not redistributable; A2: SageMath itself is a
;;; massive dependency not fully packaged; A3: open-source MILP alternatives (GLPK,
;;; COIN-OR) already available in Guix/SageMath

;;; ── mingw-w64-gtk3 (#4057) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — CROSS_COMPILE_TOOLCHAIN: GTK3 cross-compiled
;;; for Windows via MinGW-w64 toolchain; requires entire mingw-w64 cross-compilation
;;; stack including cross-compiled glib2, pango, cairo, ATK, etc.;
;;; A1: Guix has its own cross-compilation infrastructure (--target=); A2: Windows
;;; cross-compile stack is enormous and maintenance-heavy; A3: no demand for mingw-w64
;;; packages in Guix ecosystem

;;; ── tomcat8 (#3709) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — EOL_SOFTWARE: Apache Tomcat 8.5 reached
;;; end-of-life in March 2024; no further security patches;
;;; A1: EOL since March 2024, security vulnerabilities unpatched; A2: users should
;;; migrate to Tomcat 9+ or 10+; A3: Java Ant build + EOL version not worth packaging
