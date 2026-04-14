;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260414z
;;; 37 packages blocked with reason codes
;;;

(define-module (gaurix packages recipe-resolver-260414z-blocked-notes))

;;; --- DEP_RESOLUTION_FAILED (16 packages) ---
;;; #13496 cockpit-session-recording v21
;;;   Cockpit plugin; needs Cockpit web framework not in Guix
;;;   Next: manual review required
;;;
;;; #13503 bind-utils-standalone v9.20.22
;;;   BIND DNS utilities standalone build needs full BIND source; complex configure
;;;   Next: manual review required
;;;
;;; #13521 luaunbound v1.0.0
;;;   Lua binding for libunbound; needs Prosody-specific Lua module system
;;;   Next: manual review required
;;;
;;; #13522 opentimestamps-client-git v0.7.2.r7.gcd71c76
;;;   Python Bitcoin timestamping; needs python-bitcoinlib + opentimestamps deps
;;;   Next: manual review required
;;;
;;; #13533 gimp-nufraw v0.43.3
;;;   GIMP raw converter; needs GIMP 2.x dev + lensfun + exiv2 + cfitsio stack
;;;   Next: manual review required
;;;
;;; #13536 molecule-plugins v25.8.12
;;;   Ansible Molecule plugins; needs molecule + ansible ecosystem not in Guix
;;;   Next: manual review required
;;;
;;; #13541 snuba v23.3.1
;;;   Sentry/Snuba requires ClickHouse + complex Python infra stack
;;;   Next: manual review required
;;;
;;; #13542 symbolicator v23.10.1
;;;   Sentry symbolication service; large Rust project with 200+ crate deps
;;;   Next: manual review required
;;;
;;; #13558 osgxr v0.5.6
;;;   OpenXR + OpenSceneGraph integration; needs OpenXR SDK not in Guix
;;;   Next: manual review required
;;;
;;; #13563 vapoursynth-plugin-rife-ncnn-vulkan v9_mod_v33
;;;   Needs vapoursynth + ncnn + vulkan; complex GPU dependency chain
;;;   Next: manual review required
;;;
;;; #13590 darkfi-git vv0.4.1.r977.ge23fb30604
;;;   Complex blockchain project with extensive dependency tree
;;;   Next: manual review required
;;;
;;; #13606 cangaroo v0.2.2.r64.gca7f907
;;;   CAN bus analyzer; needs Qt5 + socketcan kernel headers
;;;   Next: manual review required
;;;
;;; #13608 python-bitsandbytes v0.49.2
;;;   GPU-accelerated quantization; requires CUDA toolkit and GPU headers
;;;   Next: manual review required
;;;
;;; #13610 nifskope-git v1.1.3.864.g30954e7f
;;;   NIF file editor; needs Qt5 + custom NIF parsing libs not in Guix
;;;   Next: manual review required
;;;
;;; #13620 lxappearance-obconf-gtk3 v0.2.4
;;;   LXAppearance Openbox plugin; needs lxappearance GTK3 + openbox dev headers
;;;   Next: manual review required
;;;
;;; #13625 pros-cli v3.5.6
;;;   VEX robotics CLI; needs arm-none-eabi toolchain + custom Python deps
;;;   Next: manual review required
;;;

;;; --- LICENSE_REVIEW_NEEDED (6 packages) ---
;;; #13573 fsp-bin v6.4.0
;;;   Renesas FSP; commercial license requires legal review for redistribution
;;;   Next: manual review required
;;;
;;; #13582 canon-pixma-mg3000-complete v5.40
;;;   Canon printer driver; custom license requires redistribution review
;;;   Next: manual review required
;;;
;;; #13584 nvidia-sync-terminal-fix v0.64.24
;;;   NVIDIA proprietary sync utility; custom NVIDIA license needs review
;;;   Next: manual review required
;;;
;;; #13585 nvidia-sync v0.64.24
;;;   NVIDIA proprietary sync utility; custom NVIDIA license needs review
;;;   Next: manual review required
;;;
;;; #13605 renesas-flash-programmer-bin v3.21.00
;;;   Renesas flash programmer; commercial license requires legal review
;;;   Next: manual review required
;;;
;;; #13607 easytax-ag-2024 v1.2
;;;   Swiss tax software; custom license, region-specific
;;;   Next: manual review required
;;;

;;; --- NEEDS_RECIPE_DESIGN (15 packages) ---
;;; #13511 penpot-mcp v2.14.1
;;;   Penpot design tool MCP; complex Clojure/Java web app with npm frontend
;;;   Next: manual review required
;;;
;;; #13512 conquest-git v0.2.0
;;;   C2/post-exploitation framework; requires security context review
;;;   Next: manual review required
;;;
;;; #13513 havoc-c2-git vr619.f163210
;;;   C2/post-exploitation framework; requires security context review
;;;   Next: manual review required
;;;
;;; #13534 blend2d-git vr87.592d1ba
;;;   2D vector graphics engine; CMake project with JIT compilation (AsmJit dep)
;;;   Next: manual review required
;;;
;;; #13538 gtk2+extra v3.3.4
;;;   GTK2 extension widgets; legacy GTK2 with custom build system
;;;   Next: manual review required
;;;
;;; #13553 librewolf-hellfire v144.0_1
;;;   Firefox fork with custom patches; full browser build (2h+, complex deps)
;;;   Next: manual review required
;;;
;;; #13560 casa6-pipeline-bin v6.6.6
;;;   NRAO CASA astronomy pipeline; massive Python/C++ stack with custom deps
;;;   Next: manual review required
;;;
;;; #13562 democap v1.6
;;;   Drag[en]gine motion capture; needs Drag[en]gine SDK not in Guix
;;;   Next: manual review required
;;;
;;; #13589 shock-alarm v0.4.4
;;;   Flutter app; Flutter SDK not available in Guix
;;;   Next: manual review required
;;;
;;; #13598 archbuilder v0.9.5
;;;   Arch Linux-specific tool (pacman/makepkg dependency); not portable to Guix
;;;   Next: manual review required
;;;
;;; #13603 cclive v0.9.3
;;;   Video downloader; depends on quvi library (discontinued, not in Guix)
;;;   Next: manual review required
;;;
;;; #13604 winboat-electron v0.9.0
;;;   Electron app for Wine/Windows integration; complex Electron + Wine deps
;;;   Next: manual review required
;;;
;;; #13611 pantheon-dock-git vr560.a4f2137
;;;   elementary OS Pantheon dock; needs Granite + Wingpanel + Vala stack
;;;   Next: manual review required
;;;
;;; #13613 pantheon-settings-daemon-git v1.0.0.r18.e4b709d
;;;   elementary OS settings daemon; needs Granite + Switchboard + Vala stack
;;;   Next: manual review required
;;;
;;; #13617 plasma-keyboard-git v0edb3bd
;;;   KDE Plasma virtual keyboard; needs KDE Frameworks 6 + Qt6 stack
;;;   Next: manual review required
;;;

