;;; Blocked notes for recipe-resolver-260419d
;;;
;;; ALREADY_IN_GUIX (1):
;;;
;;; 1. hyprland-guiutils-git (#6013)
;;;    Already packaged in Guix as hyprland-guiutils@0.2.1 in (gnu packages cpp).
;;;    AUR -git variant is v0.1.0, older than Guix version.
;;;    Resolution: compat alias to existing Guix package.
;;;
;;; BLOCKED EXHAUSTED (19):
;;;
;;; 1. tutanota-desktop (#6008) — COMPLEX_BUILD
;;;    Tutanota encrypted email desktop client (GPL-3.0).
;;;    A1: Build from source requires cargo + emscripten + nvm + rust-wasm
;;;        — massive cross-language toolchain not in Guix.
;;;    A2: No pre-built binary releases in a repackageable format
;;;        (upstream uses Electron Builder, no AppImage/tar.gz).
;;;    A3: Electron wrapping would require bundled Chromium + node_modules.
;;;    Conclusion: infeasible without emscripten + rust-wasm ecosystem in Guix.
;;;
;;; 2. geekbench (#6022) — PROPRIETARY
;;;    Primate Labs benchmark tool (custom proprietary license).
;;;    A1: Binary-only distribution with custom license.
;;;    A2: Requires online activation for full functionality.
;;;    A3: License prohibits redistribution of modified packages.
;;;    Conclusion: proprietary license blocks Guix packaging.
;;;
;;; 3. msodbcsql (#6023) — PROPRIETARY
;;;    Microsoft ODBC Driver 18 for SQL Server (custom Microsoft license).
;;;    A1: Binary-only RPM/DEB with Microsoft EULA.
;;;    A2: Requires acceptance of license terms on install.
;;;    A3: No source code available.
;;;    Conclusion: proprietary license blocks Guix packaging.
;;;
;;; 4. oracle-sqldeveloper (#8085) — PROPRIETARY
;;;    Oracle SQL Developer database GUI (Oracle OTN license).
;;;    A1: Requires Oracle account to download.
;;;    A2: OTN license restricts redistribution.
;;;    A3: Java app with Oracle-specific JDK requirements.
;;;    Conclusion: OTN license and download restrictions block packaging.
;;;
;;; 5. synology-hyper-backup-explorer (#8086) — PROPRIETARY
;;;    Synology backup browser/extractor (proprietary license).
;;;    A1: Binary-only with proprietary Synology license.
;;;    A2: Depends on libxcrypt-compat (legacy compat library).
;;;    A3: No source code available.
;;;    Conclusion: proprietary license blocks Guix packaging.
;;;
;;; 6. vivado (#8114) — PROPRIETARY
;;;    AMD/Xilinx FPGA design suite (custom license).
;;;    A1: Enormous proprietary installer (~100GB installed size).
;;;    A2: Requires Xilinx account and license server.
;;;    A3: Depends on ncurses5-compat-libs, libxcrypt-compat, libpng12,
;;;        lib32-libpng12 — legacy compat libraries.
;;;    Conclusion: proprietary, massive, and requires legacy libs not in Guix.
;;;
;;; 7. brother-hl1118 (#8124) — PROPRIETARY_DRIVER
;;;    Brother printer driver (custom Brother commercial license).
;;;    A1: Proprietary binary driver with Brother license.
;;;    A2: Depends on foomatic-db-nonfree (not in Guix).
;;;    A3: No open-source alternative for this printer model.
;;;    Conclusion: proprietary commercial license blocks packaging.
;;;
;;; 8. brother-dcp1610w (#8649) — PROPRIETARY_DRIVER + LIB32
;;;    Brother printer driver (GPL-2.0 wrapper but proprietary binary).
;;;    A1: Depends on lib32-glibc — Guix does not support multilib.
;;;    A2: Contains proprietary binary filter components.
;;;    A3: Driver architecture requires 32-bit binary execution.
;;;    Conclusion: lib32 requirement and proprietary components block packaging.
;;;
;;; 9. radar-omega (#8132) — PROPRIETARY
;;;    Advanced weather radar application (proprietary license).
;;;    A1: Distributed as proprietary AppImage.
;;;    A2: Requires paid subscription for full functionality.
;;;    A3: No source code available.
;;;    Conclusion: proprietary license blocks Guix packaging.
;;;
;;; 10. mathematica-light (#8640) — PROPRIETARY
;;;     Wolfram Mathematica light edition (Wolfram license).
;;;     A1: Proprietary software with Wolfram EULA.
;;;     A2: Requires online activation and license key.
;;;     A3: Enormous binary distribution (~5GB).
;;;     Conclusion: proprietary license blocks Guix packaging.
;;;
;;; 11. lmstudio-beta (#8646) — PROPRIETARY
;;;     LM Studio AI model runner (EULA license).
;;;     A1: Proprietary AppImage with EULA.
;;;     A2: Self-updating mechanism conflicts with Guix store immutability.
;;;     A3: Depends on FUSE2 and CLBlast with specific versions.
;;;     Conclusion: proprietary EULA license blocks Guix packaging.
;;;
;;; 12. arch-checkfw (#8652) — ARCH_SPECIFIC
;;;     Arch Linux firmware detection tool.
;;;     A1: Depends on pacman and Arch package database infrastructure.
;;;     A2: Uses mkinitcpio (Arch-specific initramfs tool).
;;;     A3: No equivalent functionality outside Arch ecosystem.
;;;     Conclusion: Arch-specific tool with no Guix applicability.
;;;
;;; 13. pacman-systemd-inhibit (#8653) — ARCH_SPECIFIC
;;;     Pacman systemd inhibitor during upgrades.
;;;     A1: Specifically hooks into pacman package manager.
;;;     A2: Guix uses its own upgrade mechanism (guix system reconfigure).
;;;     A3: No equivalent use case on Guix System.
;;;     Conclusion: pacman-specific tool with no Guix applicability.
;;;
;;; 14. google-calender-widget (#8717) — ELECTRON_COMPLEX
;;;     Unofficial Google Calendar desktop widget (MIT license).
;;;     A1: Depends on electron38 — Electron not packaged in Guix.
;;;     A2: Build requires yarn + nvm (npm ecosystem not in Guix).
;;;     A3: Unofficial third-party tool with minimal upstream support.
;;;     Conclusion: Electron + npm build chain not available in Guix.
;;;
;;; 15. visual-paradigm-163 (#8723) — PROPRIETARY
;;;     Visual Paradigm UML/modeling tool v16.3 (custom license).
;;;     A1: Proprietary Java application with custom license.
;;;     A2: Outdated version (16.3 from 2022).
;;;     A3: No source code available.
;;;     Conclusion: proprietary license blocks Guix packaging.
;;;
;;; 16. binance (#8735) — PROPRIETARY
;;;     Binance cryptocurrency exchange desktop app (unknown license).
;;;     A1: Proprietary Electron app with no source code.
;;;     A2: Unknown/custom license.
;;;     A3: Depends on GTK3/NSS/libXScrnSaver (Electron deps).
;;;     Conclusion: proprietary with no open-source license.
;;;
;;; 17. rog-perf-tuner (#8739) — COMPLEX_BUILD
;;;     ASUS ROG laptop performance/RGB tuner (GPL-2.0).
;;;     A1: Build requires npm + pnpm + qtcreator — complex build chain.
;;;     A2: Depends on asusctl (not in Guix) for hardware control.
;;;     A3: Hardware-specific: only useful on ASUS ROG laptops.
;;;     Conclusion: npm/pnpm build chain + missing asusctl dep block packaging.
;;;
;;; 18. storageexplorer (#8741) — PROPRIETARY + DOTNET
;;;     Microsoft Azure Storage Explorer (unknown license).
;;;     A1: Proprietary Microsoft application.
;;;     A2: Depends on dotnet-runtime (not bootstrapped in Guix).
;;;     A3: No source code available.
;;;     Conclusion: proprietary + .NET runtime not in Guix.
;;;
;;; 19. libbit4opki (#8765) — PROPRIETARY
;;;     Bit4ID smart card middleware (unknown license).
;;;     A1: Proprietary binary middleware with unknown license.
;;;     A2: No source code available.
;;;     A3: Hardware-specific smart card driver.
;;;     Conclusion: proprietary with no open-source license.
