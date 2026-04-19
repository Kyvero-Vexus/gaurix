;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260418ak
;;; 27 packages evaluated as BLOCKED/EXHAUSTED.

;;; 4. ps7_libps4000
;;; PROPRIETARY: PicoScope 4000 series SDK library distributed under Pico
;;; Technology's custom commercial license from their Debian repository.
;;; Not FOSS.
;;; A1: Repack .deb binary — proprietary license, no redistribution rights.
;;; A2: Build from source — no source code available, SDK is binary-only.
;;; A3: Use open-source alternative — no FOSS PicoScope SDK exists.

;;; 5. ps7_libps3000
;;; PROPRIETARY: Same as ps7_libps4000.  PicoScope 3000 series SDK library
;;; under Pico Technology custom commercial license.
;;; A1-A3: Same reasoning as ps7_libps4000.

;;; 6. ps7_libps5000a
;;; PROPRIETARY: Same as ps7_libps4000.  PicoScope 5000a series SDK library
;;; under Pico Technology custom commercial license.
;;; A1-A3: Same reasoning as ps7_libps4000.

;;; 7. ps7_libps5000
;;; PROPRIETARY: Same as ps7_libps4000.  PicoScope 5000 series SDK library
;;; under Pico Technology custom commercial license.
;;; A1-A3: Same reasoning as ps7_libps4000.

;;; 8. ps7_libps6000a
;;; PROPRIETARY: Same as ps7_libps4000.  PicoScope 6000a series SDK library
;;; under Pico Technology custom commercial license.
;;; A1-A3: Same reasoning as ps7_libps4000.

;;; 9. pixel-fx-companion-app
;;; PROPRIETARY: Electron desktop app for Pixel FX retro gaming devices.
;;; Custom proprietary license.  Distributed as prebuilt binary from
;;; firmware.pixelfx.co with no source code available.
;;; A1: Package binary — proprietary license prohibits redistribution.
;;; A2: Build from source — no source code available.
;;; A3: Skip — proprietary, closed-source companion app.

;;; 10. ripcord-arch-libs
;;; PROPRIETARY: Discord/Slack Qt5 client under custom "LicenseRef-ripcord"
;;; license.  The -arch-libs variant patches system libraries but the
;;; core application is closed-source.
;;; A1: Package binary — proprietary license, no redistribution rights.
;;; A2: Build from source — no source code available.
;;; A3: Use open-source Discord client — e.g., webcord or dissent.

;;; 11. biu-tauri-bin
;;; NON_FOSS: Bilibili music player under PolyForm-Noncommercial-1.0.0
;;; license.  This is a source-available license that prohibits commercial
;;; use, failing the FOSS definition.
;;; A1: Package anyway — violates Guix FOSS policy.
;;; A2: Request license change — upstream decision, outside our control.
;;; A3: Skip — non-free license explicitly prohibits commercial use.

;;; 12. iceweasel
;;; COMPLEX_BUILD: Parabola GNU/Linux's debranded Firefox (MPL-2.0).  The
;;; build process is essentially identical to Firefox, requiring 40GB+ RAM,
;;; hours of compile time, Clang/LLVM/Rust/wasi toolchains, and 30+
;;; makedepends.  Guix already packages IceCat (GNU's Firefox fork).
;;; A1: Build from source — enormous scope, equivalent to packaging Firefox.
;;; A2: Use binary — no official prebuilt x86_64 binaries.
;;; A3: Use Guix IceCat — already available, same Firefox engine with
;;;     GNU privacy patches.

;;; 13. xterminal-bin
;;; PROPRIETARY: Chinese SSH terminal client under custom license.  Requires
;;; Electron 40 which is not available in Guix.  No source code available.
;;; A1: Package binary — proprietary license + electron40 missing.
;;; A2: Build from source — no source code, binary-only distribution.
;;; A3: Use open-source SSH client — many alternatives in Guix.

;;; 14. brother-mfc-9970cdw
;;; PROPRIETARY: Brother MFC-9970CDW printer driver under custom Brother
;;; commercial license.  Binary-only driver from Brother's website.
;;; A1: Repack binary — Brother commercial license prohibits redistribution.
;;; A2: Build from source — no source code available.
;;; A3: Use CUPS generic driver — may not support all features.

;;; 15. futubull-desktop-bin
;;; PROPRIETARY: Futu Bull (moomoo) Hong Kong/US stock trading platform.
;;; Custom proprietary license, commercial financial software.
;;; A1: Package binary — proprietary, commercial license.
;;; A2: Build from source — no source code available.
;;; A3: Skip — commercial trading platform, no FOSS alternative needed.

;;; 16. dyad-git
;;; NON_FOSS: AI app builder with split licensing.  Core code is Apache-2.0
;;; but src/pro/ directory uses FSL-1.1 (Functional Source License) which
;;; prohibits "Competing Use."  FSL-1.1 does not meet OSI or FSF definitions
;;; of free software.
;;; A1: Strip pro/ and package Apache-2.0 portion — degraded functionality.
;;; A2: Package entire app — FSL-1.1 violates Guix FOSS policy.
;;; A3: Skip — mixed licensing with non-free component.

;;; 17. idplugclassic-ro-cei-bin
;;; PROPRIETARY: Romanian electronic ID card (CEI) driver and companion app.
;;; Custom proprietary license from Romanian Ministry of Internal Affairs.
;;; A1: Package binary — government proprietary license.
;;; A2: Build from source — no source code available.
;;; A3: Use OpenSC — open-source smart card tools may provide basic access.

;;; 18. barmer-ecare-bin
;;; PROPRIETARY: German health insurance (BARMER) electronic patient record
;;; app.  Explicitly proprietary license.  Extracted from Snap package.
;;; A1: Package binary — proprietary license, non-redistributable.
;;; A2: Build from source — no source code, commercial medical app.
;;; A3: Skip — proprietary healthcare application.

;;; 19. pacsea-git
;;; DISTRO_SPECIFIC: Rust TUI for pacman/AUR package searching.  Depends
;;; directly on pacman at runtime (invokes pacman commands).  Useless on
;;; non-Arch systems.
;;; A1: Build Rust binary — depends on pacman, no Guix utility.
;;; A2: Adapt for Guix — would need complete rewrite for guix search.
;;; A3: Skip — Arch-specific tool, use guix search instead.

;;; 20. picotron
;;; PROPRIETARY: Lexaloffle's fantasy workstation (PICO-8 successor).
;;; Custom commercial license.  Paid software requiring license key.
;;; A1: Package binary — commercial license, requires purchase.
;;; A2: Build from source — no source code, proprietary engine.
;;; A3: Skip — commercial game creation tool.

;;; 21. ccstudio
;;; PROPRIETARY: Texas Instruments Code Composer Studio IDE.  Custom TI
;;; Software Production Agreement (TSPA).  Also requires lib32-glibc
;;; (multilib) which Guix does not support.
;;; A1: Package binary — TSPA license + multilib requirement.
;;; A2: Build from source — no source code, proprietary Eclipse-based IDE.
;;; A3: Use open-source alternatives — GCC ARM toolchain available in Guix.

;;; 22. pamac-tray-icon-plasma
;;; DISTRO_SPECIFIC: KDE Plasma tray icon for pamac (Manjaro's package
;;; manager).  Depends on libpamac which wraps libalpm/pacman.  No
;;; functionality without the Arch packaging ecosystem.
;;; A1: Package without libpamac — non-functional widget.
;;; A2: Port to Guix — would need complete rewrite of pamac stack.
;;; A3: Skip — Arch/Manjaro-specific package management UI.

;;; 23. nomachine
;;; PROPRIETARY: NoMachine remote desktop under custom EULA.  Commercial
;;; software with free tier.  Non-redistributable proprietary license.
;;; A1: Package binary — EULA prohibits redistribution.
;;; A2: Build from source — no source code available.
;;; A3: Use open-source remote desktop — XRDP, x2go, or VNC in Guix.

;;; 24. realvnc-vnc-viewer
;;; PROPRIETARY: RealVNC Viewer under custom proprietary license.  Free
;;; download but not FOSS.  Non-redistributable.
;;; A1: Package binary — proprietary license, non-redistributable.
;;; A2: Build from source — no source code available.
;;; A3: Use TigerVNC or Remmina — open-source VNC clients in Guix.

;;; 25. gputest
;;; PROPRIETARY: Geeks3D GPU stress test.  Freeware with explicit
;;; prohibition on redistribution: "does not grant you the right to sell,
;;; rent or distribute."  Last updated 2014, likely abandoned.
;;; A1: Package binary — license prohibits redistribution.
;;; A2: Build from source — no source code, proprietary OpenGL benchmark.
;;; A3: Use glmark2 — open-source GPU benchmark available in Guix.

;;; 26. kontur-talk
;;; PROPRIETARY: Kontur enterprise video conferencing.  Custom proprietary
;;; license from SKB Kontur (Russian IT company).  Commercial product.
;;; A1: Package binary — proprietary commercial license.
;;; A2: Build from source — no source code available.
;;; A3: Use Jitsi Meet web — open-source video conferencing.

;;; 27. termius
;;; PROPRIETARY: Termius SSH client under custom proprietary license.
;;; Commercial product with subscription model.  Distributed as Snap.
;;; A1: Package binary — proprietary, non-redistributable.
;;; A2: Build from source — no source code available.
;;; A3: Use OpenSSH + any terminal — already in Guix.

;;; 28. java-gurobi
;;; PROPRIETARY: Java bindings for Gurobi mathematical solver.  Custom
;;; Gurobi EULA (commercial optimization software).  Requires proprietary
;;; Gurobi solver as dependency.
;;; A1: Package bindings — depends on proprietary Gurobi solver.
;;; A2: Build from source — Gurobi EULA restricts redistribution.
;;; A3: Use GLPK or COIN-OR — open-source optimization solvers in Guix.

;;; 29. r-gurobi
;;; PROPRIETARY: R bindings for Gurobi mathematical solver.  Same Gurobi
;;; EULA as java-gurobi.  Depends on proprietary Gurobi solver.
;;; A1-A3: Same reasoning as java-gurobi.

;;; 30. xp-pen-tablet
;;; PROPRIETARY: XP-Pen tablet driver under custom proprietary license.
;;; Binary-only driver from XP-Pen website.  No source code available.
;;; A1: Package binary — proprietary license, non-redistributable.
;;; A2: Build from source — no source code available.
;;; A3: Use libwacom/libinput — open-source tablet support, may lack
;;;     XP-Pen-specific features.
