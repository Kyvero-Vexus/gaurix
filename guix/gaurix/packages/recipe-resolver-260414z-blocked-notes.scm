(define-module (gaurix packages recipe-resolver-260414z-blocked-notes)
  #:export (recipe-resolver-260414z-blocked-notes))

;;; recipe-resolver-260414z — blocked/exhausted notes
;;; 25 packages marked NEEDS_RECIPE_DESIGN_EXHAUSTED
;;; 5 packages resolved (3 recipes + 2 compat aliases)

(define recipe-resolver-260414z-blocked-notes
  (list
   ;; --- Resolved ---
   ;; #13409 ww-manager — recipe in recipe-resolver-260414z.scm
   ;; #13421 tg-config — recipe in recipe-resolver-260414z.scm
   ;; #10654 neovim-qt-git — recipe + compat alias in recipe-resolver-260414z.scm
   ;; #13491 cvs-feature-bin — compat alias to upstream cvs
   ;; #10238 psdoom-ng — recipe (inherit chocolate-doom) in recipe-resolver-260414z.scm

   ;; --- NEEDS_RECIPE_DESIGN_EXHAUSTED ---

   (list "tuimer" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "GO_VENDORED_DEPS: Go terminal timer (github.com/Saverio976/tuimer); requires go-build-system with vendored module enumeration; no pre-built Linux binaries on GitHub releases; A1: go-build-system needs module hash enumeration; A2: no binary releases available; A3: niche tool with 1 AUR vote")

   (list "auto-cpufreq" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "SYSTEMD_REQUIRED: CPU frequency optimizer requiring systemd service unit + polkit policy for privilege escalation; Guix uses Shepherd init system; A1: systemd service model incompatible with Guix; A2: polkit integration non-trivial; A3: Guix has cpufreq-utils and tlp for similar functionality")

   (list "majsoul-plus-bin" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "ELECTRON_APP: Electron-based Mahjong Soul browser (binary AppImage); Guix lacks Electron packaging infrastructure; A1: AppImage requires FUSE + runtime patching; A2: Electron bundling not supported; A3: game-specific niche tool")

   (list "neural-amp-modeler-lv2" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "COMPLEX_SUBMODULES: CMake LV2 audio plugin with 5 vendored git submodule deps (Eigen, RTNeural, json, NAM-core); A1: all submodules need individual packaging; A2: ML inference deps not trivially available; A3: requires LV2 plugin host infrastructure")

   (list "breeze-enhanced-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "KDE_PLASMA_6_MISSING: KDE Breeze window decoration fork requiring plasma-desktop + full KDE Frameworks 6 stack; A1: plasma-desktop not in Guix; A2: ECM + KDE6 build infra needed; A3: desktop-specific cosmetic change")

   (list "sitra" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "DEPS_CHAIN_MISSING: Vala/Meson font installer requiring libadwaita + gtksourceview5 + webkit2gtk; A1: webkit2gtk build extremely heavy; A2: system font path integration Guix-incompatible (/usr/share/fonts vs store paths); A3: Guix handles fonts via profiles, not system-wide install")

   (list "atlantik-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "KDE4_LEGACY: KDE Monopoly-like board game client from KDE4 era; A1: requires monopd game server not in Guix; A2: KDE4 frameworks deprecated, porting status unclear; A3: last upstream activity uncertain")

   (list "miraclecast-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "SYSTEMD_REQUIRED: Miracast WiFi display requiring systemd >= 221 for networkd/resolved integration; A1: Guix uses Shepherd, not systemd; A2: WiFi Direct requires wpa_supplicant p2p which needs system-level config; A3: complex kernel + wireless stack integration")

   (list "mininet" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "COMPLEX_SYSTEM_DEPS: SDN network emulator requiring Open vSwitch + kernel network namespaces + custom Python; A1: OVS not in Guix; A2: requires root + kernel namespace support; A3: custom license (non-standard)")

   (list "monocoque" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "MISSING_GUIX_DEPS: Racing sim device manager (C/CMake) needing argtable library not in Guix; A1: argtable not packaged; A2: libserialport + hidapi integration complex; A3: niche sim-racing tool with 0 AUR votes")

   (list "fingwit" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "MISSING_GUIX_DEPS: Linux Mint fingerprint config tool requiring xapp library not in Guix; A1: xapp (Linux Mint XApp) not packaged; A2: depends on fprintd + PAM integration; A3: Linux Mint-specific ecosystem")

   (list "linnote" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "HEAVY_DEPS: Qt6 note-taking app requiring Tesseract OCR + leptonica for OCR features; A1: tesseract integration adds significant dep chain; A2: Qt6 CMake build with 8+ deps; A3: 1 AUR vote, niche tool")

   (list "niri-settings-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "MISSING_GUIX_DEPS: Niri compositor settings GUI requiring PyQt6 not in Guix; A1: PyQt6 not packaged in Guix; A2: depends on niri compositor (not in Guix); A3: no tagged releases (git-only)")

   (list "ultimate-tic-tac-toe-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "NO_TAGGED_RELEASES: GTK4/libadwaita Python game with no stable version tags; A1: only available as -git with no releases; A2: requires meson + blueprint-compiler; A3: niche game with 1 AUR vote")

   (list "gtk-meshtastic-client" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "MISSING_GUIX_DEPS: Meshtastic LoRa mesh client requiring python-meshtastic not in Guix; A1: meshtastic Python library not packaged; A2: hardware-specific (LoRa radio required); A3: protobuf + serial device deps")

   (list "radiotray-ng-mpris" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "DEPS_CHAIN_MISSING: MPRIS2 bridge requiring radiotray-ng + python-mpris-server + python-yacl not in Guix; A1: radiotray-ng not packaged; A2: python-mpris-server not packaged; A3: three missing deps in chain")

   (list "git-incrypt-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "NO_TAGGED_RELEASES: Encrypted git remote helper with no stable releases; A1: only git snapshots available (v0.9.0.r8); A2: unclear upstream maintenance status; A3: requires python-pygit2 + gpg integration")

   (list "krunner-symbols-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "KDE_PLASMA_6_MISSING: KDE KRunner unicode symbol plugin requiring full KDE Frameworks 6 + Plasma 6 stack; A1: krunner, plasma-framework, ki18n, kconfigwidgets all needed; A2: KDE Plasma 6 not fully in Guix; A3: plugin for KDE-specific desktop feature")

   (list "pulsecontrol-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "MISSING_GUIX_DEPS: Pavucontrol fork requiring gtkmm-4.0 not in Guix; A1: gtkmm-4.0 not packaged (Guix has gtkmm-3); A2: meson build needs gtkmm-4 + sigc++-3.0; A3: upstream pavucontrol available as alternative")

   (list "qvtfpp" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "COMPLEX_BUILD: Qt6 VTF texture image format plugin requiring Vulkan headers + custom VTFLib; A1: VTFLib not in Guix; A2: Qt6 plugin installation path integration; A3: niche Valve Texture Format support")

   (list "properdocs" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "UNCLEAR_UPSTREAM: Project documentation tool with unclear source language and build system; A1: not found on PyPI, npm, or standard package registries; A2: AUR PKGBUILD needed for build system identification; A3: may be proprietary or abandoned")

   (list "s-console" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "ARCH_SPECIFIC: GTK3/VTE terminal emulator described as 'for Arch Linux'; A1: likely depends on Arch-specific paths or configs; A2: unclear portability; A3: niche terminal with 1 AUR vote")

   (list "mdbook-epub" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "CARGO_DEPS_NEEDED: Rust mdbook EPUB backend requiring cargo-build-system with 30+ crate deps; A1: deep crate dependency tree; A2: needs mdbook as runtime dep; A3: guix import crate incomplete for this tree")

   (list "pardf" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "UNCLEAR_UPSTREAM: PDF editor by Word-Sys with unclear source availability; A1: may be proprietary or have non-standard license; A2: upstream repository not easily identified; A3: 1 AUR vote, unclear maintenance")

   (list "maint" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "ARCH_SPECIFIC: Arch Linux system maintenance automation tool; A1: likely depends on pacman/makepkg/systemd; A2: not portable to non-Arch systems; A3: common name may conflict; Guix has its own system management")))
