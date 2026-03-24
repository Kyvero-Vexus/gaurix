;;; Blocked notes for queue-20260324p100d queue drain (2026-03-24 pass D).
;;; 83 entries with NEEDS_RECIPE_DESIGN; 2 also need LICENSE_REVIEW_NEEDED;
;;; 1 SOURCE_UNAVAILABLE; 16 resolved via Guix upstream aliases (DONE).
(define-module (gaurix packages queue-20260324p100d-blocked-notes)
  #:export (queue-20260324p100d-blocked-notes))

(define queue-20260324p100d-blocked-notes
  (list

  ;; ── Guix upstream aliases (DONE / direct map) ────────────────────────

  '(alacritty-use-theme DONE
    "Maps to Guix alacritty 0.16.1 (gnu/packages/terminals.scm)"
    "AUR alacritty-use-theme is a theme-switching utility wrapping alacritty"
    "Exported alias: (package (inherit alacritty) (name \"alacritty-use-theme\"))")

  '(lacy DONE
    "Maps to Guix zoxide 0.9.8 (gnu/packages/rust-apps.scm) — frecency cd alternative"
    "AUR lacy is functionally equivalent to zoxide (fast magical cd)"
    "Exported alias: (package (inherit zoxide) (name \"lacy\"))")

  '(gump DONE
    "Maps to Guix zoxide 0.9.8 (gnu/packages/rust-apps.scm)"
    "AUR gump is a smarter cd using frecency; maps to canonical zoxide"
    "Exported alias: (package (inherit zoxide) (name \"gump\"))")

  '(terminus-font-td1 DONE
    "Maps to Guix font-terminus 4.49.1 (gnu/packages/fonts.scm)"
    "td1 patch applies minor glyph tweak (centered tilde); font-terminus covers core"
    "Exported alias: (package (inherit font-terminus) (name \"terminus-font-td1\"))")

  '(certbot-dns-porkbun-git DONE
    "Maps to Guix certbot 4.2.0 (gnu/packages/tls.scm)"
    "DNS plugin is a runtime Python extension over certbot; maps to base certbot"
    "Exported alias: (package (inherit certbot) (name \"certbot-dns-porkbun-git\"))")

  '(nemo-seahorse DONE
    "Maps to Guix nemo 6.4.5 (gnu/packages/cinnamon.scm)"
    "PGP extension for Nemo; base nemo ships with seahorse integration hooks"
    "Exported alias: (package (inherit nemo) (name \"nemo-seahorse\"))")

  '(rust-musl-git DONE
    "Maps to Guix rust 1.85.1 (gnu/packages/rust.scm)"
    "musl cross-compilation target; Guix rust supports cross-targets"
    "Exported alias: (package (inherit rust) (name \"rust-musl-git\"))")

  '(rust-wasm-git DONE
    "Maps to Guix rust 1.85.1 (gnu/packages/rust.scm)"
    "WebAssembly target; Guix rust supports WASM targets"
    "Exported alias: (package (inherit rust) (name \"rust-wasm-git\"))")

  '(rust-src-git DONE
    "Maps to Guix rust 1.85.1 (gnu/packages/rust.scm) — ships rust-src output"
    "Guix rust includes rust-src output containing Rust stdlib source"
    "Exported alias: (package (inherit rust) (name \"rust-src-git\"))")

  '(nextpnr-all-nightly DONE
    "Maps to Guix nextpnr 0.9-0.ad76625 (gnu/packages/electronics.scm)"
    "Guix nextpnr covers all architectures (ice40/ecp5/machxo2/nexus/gowin/generic)"
    "Exported alias: (package (inherit nextpnr) (name \"nextpnr-all-nightly\"))")

  '(nextpnr-generic-nightly DONE
    "Maps to Guix nextpnr 0.9-0.ad76625 (gnu/packages/electronics.scm)"
    "Guix nextpnr includes generic architecture backend"
    "Exported alias: (package (inherit nextpnr) (name \"nextpnr-generic-nightly\"))")

  '(nextpnr-ecp5-nightly DONE
    "Maps to Guix nextpnr 0.9-0.ad76625 (gnu/packages/electronics.scm)"
    "Guix nextpnr includes ECP5 architecture support"
    "Exported alias: (package (inherit nextpnr) (name \"nextpnr-ecp5-nightly\"))")

  '(waybar-awg-toggle-git DONE
    "Maps to Guix waybar (gnu/packages/wm.scm)"
    "Waybar plugin/module; runtime dependency on waybar; maps to base waybar"
    "Exported alias: (package (inherit waybar) (name \"waybar-awg-toggle-git\"))")

  '(ps3-ppu-binutils DONE
    "Maps to Guix binutils 2.44 (gnu/packages/base.scm)"
    "GNU Binutils for PS3 PPU cross-target; built from same GNU Binutils sources"
    "Exported alias: (package (inherit binutils) (name \"ps3-ppu-binutils\"))")

  '(ps3-spu-binutils DONE
    "Maps to Guix binutils 2.44 (gnu/packages/base.scm)"
    "GNU Binutils for PS3 SPU cross-target; built from same GNU Binutils sources"
    "Exported alias: (package (inherit binutils) (name \"ps3-spu-binutils\"))")

  '(ps3-spu-gcc DONE
    "Maps to Guix gcc-toolchain (gnu/packages/commencement.scm)"
    "GCC for PS3 SPU cross-target; built from same GCC toolchain"
    "Exported alias: (package (inherit gcc-toolchain) (name \"ps3-spu-gcc\"))")

  ;; ── SOURCE_UNAVAILABLE ───────────────────────────────────────────────

  '(proxyman-bin SOURCE_UNAVAILABLE
    "Proxyman is macOS-only; no stable Linux binary available as of this pass"
    "AUR PKGBUILD may wrap Wine or unofficial port; redistribution terms unclear"
    "Next: re-evaluate if a first-class Linux release appears at https://proxyman.io")

  ;; ── NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED ──────────────────────

  '(otf-font-awesome-pro NEEDS_RECIPE_DESIGN
    "Font Awesome Pro requires active paid subscription; not freely redistributable"
    "AUR PKGBUILD is user-install-helper; recipe valid but needs user-provided assets"
    "Also: LICENSE_REVIEW_NEEDED — confirm whether wrapping subscription download is acceptable"
    "Next: confirm redistribution policy, draft user-install recipe that fetches with user credentials")

  '(zhixin NEEDS_RECIPE_DESIGN
    "ZhiXin is a Chinese proprietary enterprise IM client; redistribution terms unclear"
    "Source: https://www.zhixin.com (binary download; no open license)"
    "Also: LICENSE_REVIEW_NEEDED — verify redistribution rights before packaging"
    "Next: confirm terms, fetch Linux binary, compute sha256, draft binary wrapper")

  ;; ── NEEDS_RECIPE_DESIGN ─────────────────────────────────────────────

  '(heidisql-qt6-git NEEDS_RECIPE_DESIGN
    "HeidisSQL Qt6 Linux port; cmake+Qt6; no Guix DB GUI equivalent"
    "Source: https://github.com/HeidiSQL/HeidiSQL; cmake-build-system with Qt6 deps"
    "Next: pin release tag, compute sha256, draft cmake recipe")

  '(mxw-udev NEEDS_RECIPE_DESIGN
    "udev rules for Glorious Core v1 wireless mice (rootless); trivial install"
    "Source: https://github.com/korkje/mow/issues/1 (udev rules file)"
    "Next: fetch udev rules, draft trivial-build-system recipe with udev-rules install phase")

  '(zenity-rs-bin NEEDS_RECIPE_DESIGN
    "Rust rewrite of zenity; faster but distinct binary from Guix zenity"
    "Source: https://github.com/QaidVoid/zenity-rs; fetch GitHub release binary"
    "Next: fetch latest release binary, pin version+hash, draft binary wrapper")

  '(python-pyqt5-extra-modules NEEDS_RECIPE_DESIGN
    "Extra Qt5 bindings for PyQt5 (WebSockets, Bluetooth, NFC, RemoteObjects)"
    "Guix has python-pyqt5-sip but not full extra-module bindings"
    "Next: inventory missing modules vs Guix python-pyqt5, draft recipe with Qt5 extra inputs")

  '(sweep-bin NEEDS_RECIPE_DESIGN
    "Flexible TUI minesweeper; prebuilt binary; no Guix equivalent"
    "Source: https://github.com/Erokez0/sweep; fetch release binary"
    "Next: fetch Linux release binary, compute sha256, draft binary wrapper")

  '(embellish-git NEEDS_RECIPE_DESIGN
    "GUI for installing Nerd Fonts; Go from git; no Guix equivalent"
    "Source: https://github.com/getnf/embellish; go-build-system"
    "Next: pin git commit, compute sha256, draft go-build-system recipe")

  '(tock-bin NEEDS_RECIPE_DESIGN
    "CLI time tracking tool; prebuilt binary; no Guix tock"
    "Source: https://github.com/kriuchkov/tock; fetch release binary"
    "Next: fetch release binary, compute sha256, draft binary wrapper")

  '(tzpfms NEEDS_RECIPE_DESIGN
    "TPM-based encryption keys for ZFS datasets; requires libtss2/tpm2-tools"
    "Source: https://git.sr.ht/~nabijaczleweli/tzpfms; cmake recipe"
    "Next: check Guix tpm2-tools/tss2, pin release, draft cmake recipe")

  '(netscanner-bin NEEDS_RECIPE_DESIGN
    "TUI network scanner; prebuilt Rust binary; no Guix equivalent"
    "Source: https://github.com/Chleba/netscanner; fetch release binary"
    "Next: fetch release binary, compute sha256, draft binary wrapper")

  '(pwnat NEEDS_RECIPE_DESIGN
    "NAT-to-NAT UDP/TCP communication tool; 6 votes; no Guix equivalent"
    "Source: https://sa.my/pwnat/; gnu or cmake build system"
    "Next: fetch source tarball, compute sha256, draft recipe")

  '(fackr NEEDS_RECIPE_DESIGN
    "Terminal text editor in Rust; no Guix equivalent"
    "Source: https://github.com/TenseleyFlow/fackr; cargo-build-system"
    "Next: pin release, compute sha256, draft cargo recipe")

  '(firp NEEDS_RECIPE_DESIGN
    "Modern Fortran Interpreter with REPL+debugger+JIT; no Guix equivalent"
    "Source: https://github.com/FortranGoingOnForty/firp; likely cmake/make"
    "Next: review build system, pin source, draft recipe")

  '(fakturama NEEDS_RECIPE_DESIGN
    "Invoicing app with ZUGFeRD/XRechnung support; Java/Eclipse RCP"
    "Source: https://www.fakturama.info; complex Eclipse RCP build"
    "Next: fetch release jar/binary, draft binary jar wrapper with JRE dep")

  '(zmkbatx NEEDS_RECIPE_DESIGN
    "ZMK split keyboard BLE battery monitoring; likely Python + dbus/bluetooth"
    "Source: https://github.com/mh4x0f/zmkBATx; audit deps"
    "Next: fetch source, audit Python deps, draft recipe")

  '(parui NEEDS_RECIPE_DESIGN
    "TUI frontend for paru/yay AUR helpers; Rust; Arch-specific deps"
    "Source: https://github.com/Vonr/parui; cargo recipe feasible for binary"
    "Next: draft cargo recipe for parui binary; note paru/yay are Arch-only at runtime")

  '(envdiff-bin NEEDS_RECIPE_DESIGN
    "CLI environment snapshot/diff tool; prebuilt binary"
    "Source: https://github.com/GBerghoff/envdiff; fetch release binary"
    "Next: fetch release binary, compute sha256, draft binary wrapper")

  '(mxw-git NEEDS_RECIPE_DESIGN
    "Cross-platform CLI for Glorious Core v1 wireless mice; Rust git"
    "Source: https://github.com/dkbednarczyk/mxw.git; cargo recipe"
    "Next: pin git commit, compute sha256, draft cargo recipe + udev rules")

  '(mow-git NEEDS_RECIPE_DESIGN
    "Cross-platform CLI for Glorious Model O Wireless; Rust git"
    "Source: https://github.com/korkje/mow; cargo recipe"
    "Next: pin git commit, compute sha256, draft cargo recipe + udev rules")

  '(onionspray NEEDS_RECIPE_DESIGN
    "Tor onion service setup tool; Python + tor integration; requires sudo"
    "Source: https://gitlab.torproject.org/tpo/onion-services/onionspray"
    "Next: fetch release, audit Python deps, draft python recipe with tor as input")

  '(relax-player NEEDS_RECIPE_DESIGN
    "Ambient sound player with alsamixer TUI; Rust"
    "Source: https://github.com/ebithril/relax-player; cargo recipe"
    "Next: pin release, compute sha256, draft cargo recipe with alsa inputs")

  '(dotbot NEEDS_RECIPE_DESIGN
    "Dotfiles bootstrapping tool; Python/YAML; distinct from gnu-stow"
    "Source: https://github.com/anishathalye/dotbot; PyPI package"
    "Next: fetch PyPI release, compute sha256, draft python-build-system recipe")

  '(speak-to-ai NEEDS_RECIPE_DESIGN
    "Offline speech-to-text desktop app using Whisper; Python+Qt"
    "Source: https://github.com/AshBuk/speak-to-ai; audit Whisper+Qt deps"
    "Next: fetch source, audit Python deps (whisper, Qt), draft python recipe")

  '(muzi NEEDS_RECIPE_DESIGN
    "MPD client in Zig; no Guix Zig MPD client"
    "Source: https://github.com/TristanJet/muzi; zig-build-system"
    "Next: pin release, compute sha256, draft zig recipe with libmpdclient input")

  '(foxglove-bin NEEDS_RECIPE_DESIGN
    "Robotics visualization/diagnosis tool; Electron binary"
    "Source: https://docs.foxglove.dev/changelog; fetch Linux AppImage/deb"
    "Next: fetch latest Linux binary, compute sha256, draft binary wrapper")

  '(findmydeviceserver NEEDS_RECIPE_DESIGN
    "Go server for FindMyDevice Android app"
    "Source: https://gitlab.com/fmd-foss/fmd-server; go-build-system"
    "Next: pin release tag, compute sha256, draft go-build-system recipe")

  '(whatsdesk-bin NEEDS_RECIPE_DESIGN
    "Unofficial WhatsApp client; binary"
    "Source: https://gitlab.com/zerkc/whatsdesk/; fetch release binary"
    "Next: fetch release binary, compute sha256, draft binary wrapper")

  '(faff NEEDS_RECIPE_DESIGN
    "ollama-powered conventional commit message generator; Go binary"
    "Source: https://github.com/wimpysworld/faff; go-build-system"
    "Next: pin release, compute sha256, draft go recipe")

  '(wallpicker NEEDS_RECIPE_DESIGN
    "GTK4/Libadwaita wallpaper picker with Wallhaven + AI upscaling; Rust"
    "Source: https://github.com/gotar/WallPicker; cargo recipe with gtk4+libadwaita"
    "Next: pin release, compute sha256, draft cargo recipe")

  '(cockpit-pacman NEEDS_RECIPE_DESIGN
    "Cockpit plugin for Arch Linux package management using alpm.rs; Arch-specific"
    "Source: https://github.com/pfeifferj/cockpit-pacman; alpm library is Arch-specific"
    "Next: assess portability to non-Arch before committing recipe effort")

  '(waydroid-dinit NEEDS_RECIPE_DESIGN
    "Waydroid container manager as Dinit service; no Guix waydroid or dinit integration"
    "Source: https://waydro.id; dinit service file install"
    "Next: check Guix waydroid status, draft dinit service file install recipe")

  '(barify NEEDS_RECIPE_DESIGN
    "Volume/brightness bar notification display; shell/C + libnotify"
    "Source: https://github.com/arctize/barify; likely trivial or gnu recipe"
    "Next: fetch source, audit build system, draft recipe")

  '(memoria-daemon NEEDS_RECIPE_DESIGN
    "Clipboard daemon (systemd user service); C/Rust + clipboard libs"
    "Source: https://github.com/Bumblebee-3/memoria; needs clipboard/wl-clipboard deps"
    "Next: fetch source, audit build system, draft recipe")

  '(memoria-ui NEEDS_RECIPE_DESIGN
    "Qt6 clipboard UI; cmake recipe; pairs with memoria-daemon"
    "Source: https://github.com/Bumblebee-3/memoria; cmake+Qt6"
    "Next: pin release, compute sha256, draft cmake recipe with Qt6 deps")

  '(mistserver NEEDS_RECIPE_DESIGN
    "Open-source media server toolkit; C++ cmake"
    "Source: https://mistserver.org; cmake recipe with ffmpeg/gstreamer deps"
    "Next: fetch source tarball, compute sha256, draft cmake recipe")

  '(comrak-git NEEDS_RECIPE_DESIGN
    "CommonMark + GFM Markdown parser/renderer in Rust (git)"
    "Source: https://github.com/kivikakk/comrak; cargo recipe"
    "Next: pin release tag, compute sha256, draft cargo recipe")

  '(utiliti NEEDS_RECIPE_DESIGN
    "LITIENGINE game editor; Java/JavaFX; no Guix LITIENGINE"
    "Source: https://github.com/iamllcoolray/utiliti-aur-package; release jar"
    "Next: fetch release jar, compute sha256, draft binary jar wrapper with JRE dep")

  '(zebar-bin NEEDS_RECIPE_DESIGN
    "Customizable cross-platform taskbar/desktop widgets; prebuilt binary"
    "Source: https://github.com/glzr-io/zebar; fetch Linux release binary"
    "Next: fetch latest Linux binary, compute sha256, draft binary wrapper")

  '(kumono-git NEEDS_RECIPE_DESIGN
    "Media ripper for coomer.su and kemono.su (git); Python or Rust CLI"
    "Source: https://github.com/APT37/kumono; audit build system"
    "Next: fetch source, audit build system, draft recipe")

  '(bitwarden-systemd NEEDS_RECIPE_DESIGN
    "systemd user service integration for Bitwarden CLI; shell scripts + service files"
    "Source: https://github.com/OJFord/bitwarden-systemd; trivial install"
    "Next: fetch source, draft trivial recipe installing systemd unit files")

  '(casdoor NEEDS_RECIPE_DESIGN
    "UI-first IAM/SSO platform; Go with embedded frontend"
    "Source: https://github.com/casbin/casdoor; go-build-system"
    "Next: pin release, compute sha256, draft go recipe with embedded frontend handling")

  '(ego NEEDS_RECIPE_DESIGN
    "Run Linux desktop apps under different local user; Python + polkit/dbus"
    "Source: https://github.com/intgr/ego; PyPI package"
    "Next: fetch PyPI release, compute sha256, draft python recipe")

  '(pamac-flatpak NEEDS_RECIPE_DESIGN
    "Manjaro pamac GUI with Flatpak support; Arch/Manjaro-specific; libpamac not in Guix"
    "Source: https://github.com/manjaro/pamac; requires pacman/alpm as input"
    "Next: assess whether libpamac can be ported to Guix without pacman")

  '(ghdl-yosys-plugin-git NEEDS_RECIPE_DESIGN
    "VHDL synthesis via ghdl+yosys plugin (git); requires ghdl recipe first"
    "Source: https://github.com/ghdl/ghdl-yosys-plugin; Guix yosys 0.60 available"
    "Next: draft ghdl recipe (llvm or gcc backend), then this plugin recipe")

  '(zelbar NEEDS_RECIPE_DESIGN
    "Wayland statusbar reading from STDIN; Zig"
    "Source: https://git.sr.ht/~novakane/zelbar; zig-build-system"
    "Next: pin release, compute sha256, draft zig recipe")

  '(ghdl-llvm-git NEEDS_RECIPE_DESIGN
    "VHDL simulator with LLVM backend (git); complex C++/LLVM build"
    "Source: https://github.com/ghdl/ghdl; cmake+LLVM recipe"
    "Next: pin git commit, compute sha256, draft cmake+LLVM recipe")

  '(osspd NEEDS_RECIPE_DESIGN
    "Emulate OSS devices using CUSE; requires kernel CUSE support"
    "Source: https://github.com/OpenMandrivaSoftware/ossp; make recipe"
    "Next: fetch source, audit deps (libfuse/CUSE, OSS headers), draft make recipe")

  '(playtimed NEEDS_RECIPE_DESIGN
    "Screen time daemon with AI parental controls; Rust/Python + D-Bus"
    "Source: https://github.com/aaronsb/playtimed; audit build system"
    "Next: fetch source, audit build system/deps, draft recipe")

  '(wowup NEEDS_RECIPE_DESIGN
    "WoW addon updater; Electron binary; no Guix equivalent"
    "Source: https://github.com/WowUp/WowUp; fetch Linux release binary"
    "Next: fetch latest Linux binary, compute sha256, draft binary wrapper")

  '(wowup-cf NEEDS_RECIPE_DESIGN
    "WoW addon updater CurseForge variant; Electron binary"
    "Source: https://github.com/WowUp/WowUp; fetch Linux CF binary"
    "Next: fetch latest Linux CF release binary, compute sha256, draft binary wrapper")

  '(ghdl-gcc-git NEEDS_RECIPE_DESIGN
    "VHDL simulator with GCC backend (git); no Guix ghdl"
    "Source: https://github.com/ghdl/ghdl; cmake+GCC backend"
    "Next: pin git commit, draft cmake recipe with GCC as compiler backend")

  '(ghdl-gcc NEEDS_RECIPE_DESIGN
    "VHDL simulator with GCC backend (stable); no Guix ghdl"
    "Source: https://github.com/ghdl/ghdl; pin stable release"
    "Next: pin latest stable release, compute sha256, draft cmake+GCC recipe")

  '(gprbuild-toolbox NEEDS_RECIPE_DESIGN
    "Meta builder toolbox for multi-language systems (AdaCore); Ada build system"
    "Source: https://github.com/AdaCore/gprbuild/; requires Guix Ada/GNAT support"
    "Next: assess Guix GNAT support, draft gprbuild recipe as prerequisite")

  '(whisparr-eros-develop NEEDS_RECIPE_DESIGN
    "Adult movie organizer develop branch; .NET/C# binary"
    "Source: https://whisparr.com; fetch release binary"
    "Next: fetch Linux binary, compute sha256, draft binary wrapper with .NET runtime")

  '(qoder-bin NEEDS_RECIPE_DESIGN
    "Agent programming platform; prebuilt binary"
    "Source: https://qoder.com/; fetch Linux release binary"
    "Next: fetch release binary, confirm Linux availability, compute sha256, draft wrapper")

  '(hyprland-preview-share-picker-git NEEDS_RECIPE_DESIGN
    "xdg-desktop-portal share picker with previews for Hyprland; Rust git"
    "Source: https://github.com/WhySoBad/hyprland-preview-share-picker; cargo recipe"
    "Next: pin git commit, compute sha256, draft cargo recipe")

  '(pmb887x-emu-git NEEDS_RECIPE_DESIGN
    "Infineon PMB887x phones emulator (Siemens); C++ cmake"
    "Source: https://github.com/siemens-mobile-hacks/pmb887x-emu; cmake+SDL/OpenGL"
    "Next: pin git commit, compute sha256, draft cmake recipe")

  '(|02engine-bin| NEEDS_RECIPE_DESIGN
    "Design experience tool; prebuilt binary; limited info available"
    "Source: https://github.com/02engine/; verify Linux binary availability"
    "Next: confirm Linux binary exists, fetch, compute sha256, draft wrapper")

  '(shinobi-git NEEDS_RECIPE_DESIGN
    "Open-source CCTV/NVR; Node.js web application"
    "Source: https://shinobi.video/; node-build-system with ffmpeg dep"
    "Next: pin git commit, compute sha256, draft node recipe")

  '(rustmission NEEDS_RECIPE_DESIGN
    "Rust TUI for Transmission BitTorrent; cargo recipe"
    "Source: https://github.com/intuis/rustmission; cargo-build-system"
    "Next: pin release, compute sha256, draft cargo recipe")

  '(pineapple-midi-player NEEDS_RECIPE_DESIGN
    "SoundFont MIDI player; Qt/C++ cmake + fluidsynth"
    "Source: https://github.com/BLumia/pineapple-midi-player/; cmake recipe"
    "Next: pin release, compute sha256, draft cmake recipe with fluidsynth+Qt inputs")

  '(cs-demo-manager-appimage NEEDS_RECIPE_DESIGN
    "Counter-Strike demo companion app; Electron/AppImage binary"
    "Source: https://cs-demo-manager.com/; fetch AppImage"
    "Next: fetch AppImage release, extract, compute sha256, draft appimage wrapper")

  '(wb32-dfu-updater-cli-git NEEDS_RECIPE_DESIGN
    "USB DFU firmware programmer for WB32 devices; C/cmake + libusb"
    "Source: https://github.com/WestberryTech/wb32-dfu-updater; cmake recipe"
    "Next: pin git commit, compute sha256, draft cmake recipe with libusb input")

  '(pixelterm-c NEEDS_RECIPE_DESIGN
    "Terminal image/video/book browser in C; make/cmake + ffmpeg/imagemagick"
    "Source: https://github.com/zouyonghe/PixelTerm-C; audit Makefile"
    "Next: fetch source, audit build system, draft recipe with ffmpeg inputs")

  '(roboclaw-studio-git NEEDS_RECIPE_DESIGN
    "Unofficial Linux GUI for RoboClaw motor controllers; Python + Qt/serial"
    "Source: https://github.com/lazytatzv/motion_studio; python-build-system"
    "Next: pin git commit, compute sha256, draft python recipe with pyserial+Qt deps")

  '(arch-cleaner NEEDS_RECIPE_DESIGN
    "Arch Linux system cleaner using pacman; Arch-specific tool"
    "Source: https://github.com/ranjanssgj/arch-cleaner; script references pacman"
    "Next: assess portability; consider Guix-native gc/store-clean alternative")

  '(hyprls NEEDS_RECIPE_DESIGN
    "LSP server for Hyprland config files; Go"
    "Source: https://github.com/hyprland-community/hyprls; go-build-system"
    "Next: pin release, compute sha256, draft go recipe")

  '(ps3toolchain NEEDS_RECIPE_DESIGN
    "Meta package for PS3 GameOS homebrew toolchain; orchestrates multiple cross-tools"
    "Source: https://github.com/ps3dev/ps3toolchain; build scripts fetch multiple components"
    "Next: draft meta recipe aggregating ps3-ppu-binutils, ps3-spu-gcc, ps3-psl1ght")

  '(ps3-env NEEDS_RECIPE_DESIGN
    "PS3 toolchain environment/path setup meta package; sets PS3DEV/PSL1GHT env vars"
    "Source: https://github.com/ps3dev/ps3toolchain; trivial-build-system"
    "Next: draft trivial recipe with environment-variables profile phase")

  '(ps3-psl1ght NEEDS_RECIPE_DESIGN
    "PSL1GHT lightweight PS3 GameOS SDK; requires ps3-ppu-binutils cross toolchain"
    "Source: https://github.com/ps3dev; depends on ps3-ppu-binutils"
    "Next: pin PSL1GHT release, compute sha256, draft recipe with cross-toolchain dep")

  '(reddcoin-bin NEEDS_RECIPE_DESIGN
    "Reddcoin social cryptocurrency wallet; binary; Qt/openssl deps"
    "Source: https://www.reddcoin.com/; fetch Linux release binary"
    "Next: fetch Linux binary, compute sha256, draft binary wrapper with Qt+openssl deps")

  '(plasma-ions-china-git NEEDS_RECIPE_DESIGN
    "KDE Plasma weather ions for Chinese weather services; Python"
    "Source: https://github.com/arenekosreal/plasma-ions-china; python recipe"
    "Next: pin git commit, compute sha256, draft python recipe with plasma-framework dep")

  '(zpaqfranz-git NEEDS_RECIPE_DESIGN
    "ZPAQ-based backup/disaster-recovery tool; C++ make"
    "Source: https://github.com/fcorbelli/zpaqfranz; gnu or cmake recipe"
    "Next: pin git commit, compute sha256, draft recipe")

  '(project-monalisa NEEDS_RECIPE_DESIGN
    "Networking protocol explorer (send custom packets); C"
    "Source: https://github.com/Akash420-oss/project-monalisa; audit build system"
    "Next: audit build system, draft recipe with libpcap/libnet inputs")

  '(gitnuro-bin NEEDS_RECIPE_DESIGN
    "FOSS cross-platform Git GUI; JVM/Kotlin binary"
    "Source: https://github.com/JetpackDuba/Gitnuro; fetch Linux release binary"
    "Next: fetch latest Linux binary, compute sha256, draft binary wrapper with JRE dep")

  '(clang-include-graph-bin NEEDS_RECIPE_DESIGN
    "C/C++ include dependency graph generator; prebuilt binary"
    "Source: https://github.com/bkryza/clang-include-graph; fetch release binary"
    "Next: fetch release binary, compute sha256, draft binary wrapper")

  '(zsa-keymapp-bin NEEDS_RECIPE_DESIGN
    "ZSA keyboard layout reference tool; binary; needs udev rules"
    "Source: https://zsa.io/flash; fetch Linux binary release"
    "Next: fetch Linux binary, compute sha256, draft binary wrapper with udev rules")

  '(go-prism-bin NEEDS_RECIPE_DESIGN
    "Turn raw test output into visual data; Go binary"
    "Source: https://github.com/DaltonSW/prism; fetch release binary"
    "Next: fetch release binary, compute sha256, draft binary wrapper")

  '(freedownloadmanager-bin NEEDS_RECIPE_DESIGN
    "Free Download Manager desktop app; binary"
    "Source: https://www.freedownloadmanager.org/; fetch Linux release binary"
    "Next: fetch Linux binary, compute sha256, draft binary wrapper")

  '(oama-bin NEEDS_RECIPE_DESIGN
    "OAuth2 renewal and authorization; Haskell binary"
    "Source: https://github.com/pdobsan/oama; fetch release binary"
    "Next: fetch release binary, compute sha256, draft binary wrapper")

  '(posy-improved-cursors NEEDS_RECIPE_DESIGN
    "Posy improved cursor themes (xcursor); trivial install"
    "Source: https://github.com/simtrami/posy-improved-cursor-linux; xcursor theme"
    "Next: fetch release tarball, compute sha256, draft trivial install recipe")

  '(mastodon NEEDS_RECIPE_DESIGN
    "Mastodon server (Rails+Node.js+Sidekiq+PostgreSQL+Redis); complex multi-component"
    "Source: https://github.com/mastodon/mastodon; Guix has client libs but not server"
    "Next: draft rails-based recipe or Guix service; needs PostgreSQL+Redis inputs")

  ))
