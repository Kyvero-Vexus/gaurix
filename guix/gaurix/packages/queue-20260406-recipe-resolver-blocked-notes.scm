;;; Blocked notes for recipe-resolver pass — 2026-04-06.
;;; 13 packages attempted but could not be resolved after exhausting approaches.
(define-module (gaurix packages queue-20260406-recipe-resolver-blocked-notes))

;;; 18. synergy3-bin: BLOCKED:PROPRIETARY_SOURCE | Synergy 3 is proprietary closed-source software.
;;;   Approach 1: Attempted direct binary download — Symless requires account token to download; no public URL.
;;;   Approach 2: Attempted .deb extraction — requires scraping download token from website; license forbids redistribution.
;;;   Approach 3: Checked for open-source Synergy — only Synergy v1.x (GPL-2.0) is open-source; v3 is commercial.
;;;   Conclusion: Cannot package proprietary software without redistribution rights.

;;; 19. gram-editor-bin: BLOCKED:NO_BINARY_RELEASE | No prebuilt Linux binaries available.
;;;   Approach 1: Checked Codeberg releases — no releases or prebuilt binaries exist for GramEditor.
;;;   Approach 2: Checked Flathub/AppImage — not available on any binary distribution channel.
;;;   Approach 3: Attempted source build analysis — Zed editor fork requiring Rust toolchain, Vulkan, protobuf, 20+ deps; infeasible without full Cargo crate packaging.
;;;   Conclusion: Upstream has no releases; source build requires extensive unpackaged Cargo dependency chain.

;;; 20. winboat-bin: BLOCKED:COMPLEX_ELECTRON_BUNDLE | 133 MB Electron app with many shared libraries.
;;;   Approach 1: Attempted tarball extraction — tarball contains Chromium framework (libEGL.so, libGLESv2.so, chrome-sandbox, etc.); requires patchelf for 15+ shared objects.
;;;   Approach 2: Checked AppImage — available but AppImage packaging not standard in Guix.
;;;   Approach 3: Checked .deb extraction — same Electron bundle, plus needs FreeRDP and container runtime at runtime.
;;;   Conclusion: Electron apps require extensive dynamic library patching and Chromium sandbox setup; too complex for this pass.

;;; 21. dms-shell-bin: BLOCKED:MISSING_RUNTIME_DEPS | Depends on unpackaged quickshell and dgop.
;;;   Approach 1: Attempted binary tarball install — bin/dms and QML files present but require quickshell (Qt6/QML shell framework) at runtime.
;;;   Approach 2: Checked quickshell packaging — quickshell is a complex Qt6/QML C++ project with its own dependency chain; not in Guix.
;;;   Approach 3: Checked dgop availability — dgop (system monitoring CLI by AvengeMedia) is also unpackaged; no binary releases.
;;;   Conclusion: Cannot function without quickshell and dgop; both need packaging first.

;;; 22. noctalia-qs: BLOCKED:COMPLEX_QT6_BUILD | Qt6/QML fork of quickshell requiring full Qt6 dev stack.
;;;   Approach 1: Attempted cmake source build — requires Qt6 (qt6-base, qt6-declarative, qt6-wayland), DBus, Wayland, pipewire headers.
;;;   Approach 2: Checked for prebuilt binary — no binary releases available.
;;;   Approach 3: Checked for Guix Qt6 availability — Qt6 modules are partially available but noctalia-qs patches quickshell internals requiring build customization.
;;;   Conclusion: Complex Qt6/QML build with upstream-specific patches; needs dedicated Qt6 packaging effort.

;;; 23. noctalia-shell: BLOCKED:DEPENDS_ON_NOCTALIA_QS | QML configuration requiring noctalia-qs at runtime.
;;;   Approach 1: Attempted copy install of QML files — files are arch=any but require noctalia-qs (quickshell fork) to run.
;;;   Approach 2: Checked if standard quickshell works — noctalia-shell uses noctalia-qs-specific APIs; incompatible.
;;;   Approach 3: Checked for standalone operation — shell.qml and modules are tightly coupled to the noctalia-qs runtime.
;;;   Conclusion: Blocked by noctalia-qs (item 22); resolve that first.

;;; 24. mangowm: BLOCKED:MISSING_WLROOTS_019 | Requires wlroots 0.19 and scenefx 0.4; Guix has wlroots 0.18.
;;;   Approach 1: Attempted meson build with wlroots 0.18 — API changes between 0.18 and 0.19 cause compilation failures.
;;;   Approach 2: Checked for wlroots 0.19 in Guix — not yet available; wlroots 0.19 was released recently.
;;;   Approach 3: Checked for prebuilt binary — no binary releases; only source builds via meson.
;;;   Conclusion: Blocked until Guix updates wlroots to 0.19 or a compatibility package is created.

;;; 25. swhook: BLOCKED:CARGO_DEP_CHAIN | Rust/Cargo project requiring full crate dependency packaging.
;;;   Approach 1: Checked for prebuilt binary releases — no prebuilt binaries on GitHub releases (v0.0.3).
;;;   Approach 2: Attempted guix import crate swhook — would generate dependencies for tokio, hyper, serde, and 30+ transitive crates.
;;;   Approach 3: Checked for vendored build — Guix cargo-build-system requires individually packaged crates; vendored deps not supported.
;;;   Conclusion: Requires packaging ~30 Rust crate dependencies; infeasible in this pass.

;;; 26. szsol-rs: BLOCKED:CARGO_DEP_CHAIN | Rust/Cargo solitaire game requiring crate dependency packaging.
;;;   Approach 1: Checked for prebuilt binary releases — no prebuilt binaries on GitHub releases (v1.1.0).
;;;   Approach 2: Attempted guix import crate szsol-rs — would generate crossterm, ratatui, and 20+ transitive crates.
;;;   Approach 3: Checked crates.io for existing Guix packages — most TUI crate dependencies not yet in Guix.
;;;   Conclusion: Requires packaging ~20 Rust crate dependencies; infeasible in this pass.

;;; 27. netwatch-tui: BLOCKED:CARGO_DEP_CHAIN | Rust network diagnostics TUI requiring crate dependency packaging.
;;;   Approach 1: Checked for prebuilt binary releases — no prebuilt binaries; AUR builds from crates.io source.
;;;   Approach 2: Attempted guix import crate netwatch — would generate pcap, tokio, ratatui, and 40+ transitive crates.
;;;   Approach 3: Checked runtime deps — requires libpcap at runtime plus nasm at build time for crypto assembly.
;;;   Conclusion: Requires packaging ~40 Rust crate dependencies plus libpcap integration; infeasible in this pass.

;;; 28. fw-fanctrl-rs-git: BLOCKED:REQUIRES_NIGHTLY_RUST | Needs Rust nightly compiler; Guix provides stable Rust.
;;;   Approach 1: Attempted cargo build analysis — uses -Zbuild-std-features which requires nightly Rust toolchain.
;;;   Approach 2: Checked for prebuilt binary releases — no tagged releases; -git package tracks HEAD.
;;;   Approach 3: Checked if stable Rust works — build fails without nightly features; no stable Rust compatibility.
;;;   Conclusion: Requires Rust nightly; Guix only provides stable Rust toolchain.

;;; 29. podserv-b-git: BLOCKED:CARGO_DEP_CHAIN | Rust podcast server requiring crate dependency packaging.
;;;   Approach 1: Checked for prebuilt binary releases — no prebuilt binaries on GitHub (v0.1.2).
;;;   Approach 2: Attempted guix import crate podserv-b — would generate actix-web, serde, and 30+ transitive crates.
;;;   Approach 3: Checked for alternative implementations — no equivalent podcast server in Guix or as prebuilt binary.
;;;   Conclusion: Requires packaging ~30 Rust crate dependencies; infeasible in this pass.

;;; 30. arch-remaster: BLOCKED:ARCH_SPECIFIC | Arch Linux live system remastering tool; not applicable to Guix.
;;;   Approach 1: Analyzed source scripts — shell scripts that call pacman, mkinitcpio, and Arch-specific tools.
;;;   Approach 2: Checked for distro-agnostic operation — scripts hardcode Arch Linux paths (/etc/pacman.conf, mkinitcpio).
;;;   Approach 3: Checked for Guix equivalent — Guix has its own system image generation via guix system image.
;;;   Conclusion: Tool is inherently Arch Linux-specific; cannot function on Guix System.
