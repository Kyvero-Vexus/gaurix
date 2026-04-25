;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260425e
;;; Timestamp: 2026-04-25T20:00:00+00:00
;;; 21 packages BLOCKED (79 recipes created from 100 attempted)
;;;

(define-module (gaurix packages recipe-resolver-260425e-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:))

;;; --- TOOLING_FAILURE (6 packages) ---
;;; repacman: TOOLING_FAILURE: Arch/pacman-specific tool for creating pacman packages from installed software; not applicable to Guix packaging model; next: skip — Guix uses its own packaging workflow
;;; sbctl-initcpio-post-hook: TOOLING_FAILURE: Arch mkinitcpio post hook for signing UKI images with sbctl; Guix does not use mkinitcpio; next: skip — Guix has its own initrd/bootloader infrastructure
;;; pikaur-static-git: TOOLING_FAILURE: AUR helper for Arch Linux (pacman-specific); not applicable to Guix; next: skip — Guix has its own package management
;;; pikaur-static: TOOLING_FAILURE: AUR helper for Arch Linux (pacman-specific); not applicable to Guix; next: skip — Guix has its own package management
;;; libarchive-static: TOOLING_FAILURE: static-linked variant of libarchive/bsdtar; Guix uses shared libraries and already packages libarchive; next: use existing `libarchive` package
;;; network-manager-applet-nolibappindicator: TOOLING_FAILURE: variant of network-manager-applet without libappindicator; nm-applet already available in Guix as `network-manager-applet`; next: use existing package or configure at build time

;;; --- DEP_RESOLUTION_FAILED (11 packages) ---
;;; gjs-nohammer: DEP_RESOLUTION_FAILED: variant of GJS (GNOME JavaScript) without Hammer test framework; requires full GNOME JS stack modification; next: use existing `gjs` package in Guix
;;; mesa-minimal-git: DEP_RESOLUTION_FAILED: stripped-down Mesa git build; requires 50+ build dependencies (LLVM, Vulkan, DRM, etc.) and complex Meson configuration; next: package would require full Mesa dep chain
;;; pulumi-git: DEP_RESOLUTION_FAILED: Infrastructure-as-Code platform; massive Go project with 200+ Go module dependencies plus Python SDK plus Node.js SDK; next: requires extensive Go module vendoring
;;; ntpd-rs-git: DEP_RESOLUTION_FAILED: NTP daemon in Rust; requires 100+ crate dependencies including tokio, tracing, etc.; next: requires cargo vendored crate manifest
;;; nodejs-nestjs-cli: DEP_RESOLUTION_FAILED: NestJS Node.js framework CLI; massive npm dependency tree with 500+ transitive deps; next: not feasible as Guix channel package
;;; java-openjfx-nowebkit: DEP_RESOLUTION_FAILED: OpenJFX without WebKit; complex Java modular build requiring full JavaFX/OpenJFX build infrastructure; next: package full OpenJFX stack first
;;; virtualbox-svn: DEP_RESOLUTION_FAILED: VirtualBox from SVN source; requires massive build infrastructure (Qt5, SDL, XPCOM, kernel module build); next: use nonguix channel for VirtualBox
;;; modemmanager-dev: DEP_RESOLUTION_FAILED: ModemManager development version; requires full mobile broadband stack (libqmi, libmbim, etc.); next: complex telecom stack needed
;;; python-google-cloud-speech: DEP_RESOLUTION_FAILED: Google Cloud Speech API Python client; requires 30+ transitive Google Cloud Python dependencies (proto-plus, grpc, auth); next: package Google Cloud Python SDK stack
;;; rocketchat-desktop: DEP_RESOLUTION_FAILED: Rocket.Chat Electron desktop app; massive npm/Electron dependency tree; next: not feasible as Guix channel package
;;; dxvk-async-git: DEP_RESOLUTION_FAILED: DXVK async patch for D3D→Vulkan translation; requires Mingw-w64 cross-compilation toolchain and Wine DLL build infrastructure; next: requires specialized cross-build setup
;;; qt5-mqtt: DEP_RESOLUTION_FAILED: Qt5 MQTT module; requires Qt5 qmake module build infrastructure and Qt5 private headers; next: integrate with Qt5 build system in Guix

;;; --- SOURCE_UNAVAILABLE (2 packages) ---
;;; wyc: SOURCE_UNAVAILABLE: Chinese commercial port mapping tool (wangyunchuan.com); no stable public source artifact or binary download URL; next: skip — no retrievable source
;;; urbanterror: SOURCE_UNAVAILABLE: team tactical shooter based on Quake 3; requires proprietary game data files (pak files) downloaded from urbanterror.info; binary + data separation not straightforward; next: would need separate data package approach

;;; --- LICENSE_REVIEW_NEEDED (1 package) ---
;;; virtualbox-ext-oracle-dev: LICENSE_REVIEW_NEEDED: Oracle VM VirtualBox Extension Pack; Oracle PUEL license explicitly restricts redistribution for commercial use; binary-only with restrictive EULA; next: needs legal review on redistribution terms for Gaurix channel
