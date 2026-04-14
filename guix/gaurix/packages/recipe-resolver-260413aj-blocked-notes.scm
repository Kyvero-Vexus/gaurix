;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413aj
;;; 10 packages re-blocked as NEEDS_RECIPE_DESIGN_EXHAUSTED.

;;; ── nodejs-nativefier (#7325) ──
;;; DEPRECATED: nativefier (github.com/nativefier/nativefier) is archived as of
;;; 2023.  The project is dead, superseded by alternatives like Tauri/gluon.
;;; It was an Electron-based tool for wrapping web sites as desktop apps.
;;; Electron packaging is not supported in Guix, and the project is abandoned.
;;; Approaches: A1: package from npm — Electron not in Guix + project archived;
;;; A2: use successor project — different package entirely;
;;; A3: binary repack — no prebuilt binaries.

;;; ── nvidia-340xx-dkms (#7710) ──
;;; PROPRIETARY_DKMS: Proprietary NVIDIA driver (custom license) for legacy
;;; 340xx branch.  Distributed as DKMS kernel module source.  Two blockers:
;;; (1) proprietary license incompatible with Guix free software policy;
;;; (2) Guix has no DKMS infrastructure — kernel modules must be built with
;;; the kernel, not via out-of-tree DKMS.
;;; Approaches: A1: DKMS build — no Guix DKMS infra;
;;; A2: kernel module — proprietary license blocks;
;;; A3: use nouveau — different driver, lower performance.

;;; ── staruml (#7506) ──
;;; PROPRIETARY: StarUML is a proprietary commercial UML modeler (license:
;;; custom:staruml).  Distributed as prebuilt Electron .deb binary from
;;; staruml.io.  No source code available; requires paid license after trial.
;;; Approaches: A1: binary repack — proprietary license prohibits redistribution;
;;; A2: build from source — no source available;
;;; A3: use FOSS alternatives (Modelio, PlantUML, draw.io).

;;; ── velocidrone (#7322) ──
;;; PROPRIETARY: Velocidrone is a proprietary commercial FPV drone racing
;;; simulator.  Requires purchase and manual download of velocidrone.zip.
;;; No redistributable source or binary.  The AUR PKGBUILD only builds the
;;; open-source patchkit-launcher-qt wrapper.
;;; Approaches: A1: binary repack — license prohibits redistribution;
;;; A2: launcher only — non-functional without proprietary simulator;
;;; A3: use FOSS alternatives (no equivalent exists).

;;; ── vstax (#7329) ──
;;; PROPRIETARY: Swiss Canton of Valais tax filing software.  Distributed as
;;; prebuilt .deb binary from government SFTP server.  Closed-source Java
;;; application with unknown/proprietary license.  Extremely niche regional
;;; software with no source code.
;;; Approaches: A1: binary repack — unknown license, no redistribution rights;
;;; A2: build from source — no source available;
;;; A3: skip — regional proprietary software.

;;; ── gnome-system-tools (#7365) ──
;;; DISCONTINUED: Last upstream activity was 2021 (code dates to ~2011).
;;; GNOME System Tools was a GNOME 2/3 era configuration utility.  The
;;; project URL redirects to a Wikipedia stub.  Depends on deprecated
;;; libraries (liboobs) not in Guix.  30 AUR votes from legacy users.
;;; Approaches: A1: package as-is — liboobs and other deps unmaintained;
;;; A2: update for modern GNOME — no upstream activity;
;;; A3: skip — superseded by GNOME Settings and Cockpit.

;;; ── hyprshade (#7372) ──
;;; MISSING_GUIX_DEPS: Hyprshade is a shader configuration tool exclusively
;;; for the Hyprland Wayland compositor.  Hyprland is not packaged in Guix
;;; and is itself difficult to package (complex Wayland compositor with many
;;; unstable dependencies and frequent API changes).  Without Hyprland,
;;; hyprshade is completely non-functional.
;;; Approaches: A1: package hyprland first — massive undertaking;
;;; A2: standalone shader tool — requires hyprctl IPC;
;;; A3: skip — Hyprland ecosystem not in Guix.

;;; ── omnissa-horizon-integrated-printing (#7369) ──
;;; PROPRIETARY: Omnissa Horizon Client integrated printing component
;;; (formerly VMware Horizon).  Proprietary binary-only distribution from
;;; Omnissa download portal (license: custom).  Part of a proprietary
;;; virtual desktop infrastructure suite.  No source code available.
;;; Approaches: A1: binary repack — proprietary license;
;;; A2: FOSS VDI — use xrdp/FreeRDP (different product);
;;; A3: skip — proprietary VMware/Omnissa product.

;;; ── pkhex-bin (#7472) ──
;;; DOTNET_WINE_BINARY: PKHeX is a Pokemon save editor written in C#/.NET
;;; WinForms.  The AUR -bin package ships prebuilt Windows binaries run via
;;; Wine+Winetricks.  Building from source requires .NET SDK (not in Guix)
;;; targeting WinForms (Windows-only GUI framework).  No native Linux build.
;;; Approaches: A1: Wine wrapper — Guix Wine packaging incomplete;
;;; A2: build from source — .NET SDK not in Guix, WinForms is Windows-only;
;;; A3: use Avalonia port — no official cross-platform GUI port exists.

;;; ── xpad-dkms-git (#7487) ──
;;; DKMS_INCOMPATIBLE: Out-of-tree Linux kernel driver for Xbox controllers
;;; distributed as DKMS module source.  Guix has no DKMS infrastructure;
;;; kernel modules must be built as part of the kernel.  The xpad driver is
;;; already included in the mainline Linux kernel; this out-of-tree variant
;;; adds patches for newer controllers.
;;; Approaches: A1: DKMS build — no Guix DKMS infra;
;;; A2: kernel patch — requires custom kernel configuration;
;;; A3: use mainline xpad — already in default kernel config.
