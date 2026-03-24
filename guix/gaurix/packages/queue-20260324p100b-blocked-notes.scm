;;; Blocked notes for queue-20260324p100b queue drain (2026-03-24 pass B).
;;; 93 entries blocked — primary reason codes documented per-entry.
(define-module (gaurix packages queue-20260324p100b-blocked-notes)
  #:export (queue-20260324p100b-blocked-notes))

(define queue-20260324p100b-blocked-notes
  (list

  ;; ── NEEDS_RECIPE_DESIGN ──────────────────────────────────────────────

  '(neoarch-git NEEDS_RECIPE_DESIGN
    "Neovim-based Arch management TUI; Rust/Lua cargo build; votes=4"
    "Source: https://github.com/neoarch/neoarch; need to confirm URL and fetch tarball"
    "Next: confirm upstream URL, compute sha256, draft cargo recipe")

  '(stm32cubemx NEEDS_RECIPE_DESIGN
    "ST Microelectronics proprietary STM32 configurator; binary-only installer; votes=59"
    "Download is registration-gated at https://www.st.com/en/development-tools/stm32cubemx.html"
    "Also: LICENSE_REVIEW_NEEDED — ST proprietary redistribution terms must be confirmed")

  '(fish-lsp-git NEEDS_RECIPE_DESIGN
    "Fish shell LSP server; TypeScript/Node.js; https://github.com/ndonfris/fish-lsp.git"
    "Needs node-build-system recipe or pre-built npm tarball approach"
    "Next: fetch latest tagged release, compute sha256, draft node recipe")

  '(streamcontroller NEEDS_RECIPE_DESIGN
    "Stream Deck controller; Python/GTK4; https://github.com/StreamController/StreamController"
    "python-build-system with GTK4 + libusb deps"
    "Next: fetch release tarball, draft python recipe")

  '(godot-cpp NEEDS_RECIPE_DESIGN
    "Godot C++ GDExtension bindings; cmake; https://github.com/godotengine/godot-cpp"
    "cmake-build-system; needs godot headers as input"
    "Next: pin version, compute sha256, draft cmake recipe")

  '(pokeget NEEDS_RECIPE_DESIGN
    "Pokemon terminal sprites; Rust; https://github.com/talwat/pokeget-rs"
    "cargo-build-system"
    "Next: pin release tag, compute sha256, draft cargo recipe")

  '(coolerdash-git NEEDS_RECIPE_DESIGN
    "Corsair fan controller GUI; Python/Qt; https://github.com/liquidcooled/coolerdash.git"
    "python-build-system + libusb + Qt deps"
    "Next: pin commit, draft python recipe")

  '(screenpipe-bin NEEDS_RECIPE_DESIGN
    "AI screen recorder; proprietary binary; https://github.com/mediar-ai/screenpipe releases"
    "Binary wrapper + redistribution review needed"
    "Next: assess license, fetch binary, compute sha256, draft wrapper")

  '(boca NEEDS_RECIPE_DESIGN
    "Audio CD ripping library; C++ cmake; https://github.com/enzo1982/boca"
    "cmake recipe; depends on smooth library and audio plugin deps"
    "Next: pin v1.1.0, compute sha256, draft cmake recipe with smooth as input")

  '(smooth NEEDS_RECIPE_DESIGN
    "C++ multimedia utility library; cmake; https://github.com/enzo1982/smooth"
    "cmake recipe; required by boca/fre:ac"
    "Next: pin v0.9.3, compute sha256, draft cmake recipe")

  '(commafeed-h2 NEEDS_RECIPE_DESIGN
    "RSS reader with H2 DB; Java/Quarkus; https://github.com/Athou/commafeed releases"
    "maven/Java recipe with H2 embedded db"
    "Next: fetch .jar release, draft Java binary wrapper")

  '(commafeed-postgresql NEEDS_RECIPE_DESIGN
    "RSS reader with PostgreSQL; Java/Quarkus; https://github.com/Athou/commafeed releases"
    "maven/Java recipe with postgresql dep"
    "Next: fetch .jar release, draft Java binary wrapper")

  '(commafeed-mysql NEEDS_RECIPE_DESIGN
    "RSS reader with MySQL; Java/Quarkus; https://github.com/Athou/commafeed releases"
    "maven/Java recipe with mysql dep"
    "Next: fetch .jar release, draft Java binary wrapper")

  '(commafeed-mariadb NEEDS_RECIPE_DESIGN
    "RSS reader with MariaDB; Java/Quarkus; https://github.com/Athou/commafeed releases"
    "maven/Java recipe with mariadb dep"
    "Next: fetch .jar release, draft Java binary wrapper")

  '(immich-machine-learning NEEDS_RECIPE_DESIGN
    "Immich ML service; Python/ONNX; https://github.com/immich-app/immich"
    "Complex Python service with ONNX/triton/face-recognition deps"
    "Next: enumerate Python deps, draft python recipe with ONNX runtime")

  '(flclashx-bin NEEDS_RECIPE_DESIGN
    "ClashX Flutter proxy client binary; https://github.com/chen08209/FlClash releases"
    "Flutter binary wrapper with patchelf"
    "Next: fetch x86_64 Linux binary, compute sha256, draft wrapper")

  '(wsdd-native NEEDS_RECIPE_DESIGN
    "Native Rust WS-Discovery daemon; https://github.com/koushiro/wsdd-native"
    "cargo-build-system with dbus/netlink deps"
    "Next: pin release, compute sha256, draft cargo recipe")

  '(httptoolkit-bin NEEDS_RECIPE_DESIGN
    "HTTP debugging proxy Electron binary; https://httptoolkit.com/download/linux-standalone/"
    "Electron binary wrapper with patchelf and sandbox setup"
    "Next: fetch Linux .tar.gz, compute sha256, draft Electron wrapper recipe")

  '(vesta NEEDS_RECIPE_DESIGN
    "Vesta CP web hosting stack; PHP/bash; https://github.com/serghey-rodin/vesta"
    "Complex multi-service bundle needing modular recipe or container approach"
    "Next: assess architecture, consider systemd service packaging vs container")

  '(bisq-bin NEEDS_RECIPE_DESIGN
    "Bisq Bitcoin exchange; Java .deb; https://github.com/bisq-network/bisq/releases"
    "Java binary .deb extraction recipe; AGPL-3.0"
    "Next: fetch .deb, extract, patchelf Java binary, draft recipe")

  '(windterm-bin NEEDS_RECIPE_DESIGN
    "WindTerm SSH terminal; proprietary binary; https://github.com/kingToolbox/WindTerm/releases"
    "Binary wrapper after license review"
    "Also: LICENSE_REVIEW_NEEDED — proprietary terms must be confirmed")

  '(hypryou-greeter NEEDS_RECIPE_DESIGN
    "Hyprland greeter; GTK4/Rust; https://github.com/hyprland-community/hypryou"
    "cargo-build-system + GTK4"
    "Next: pin release, compute sha256, draft cargo recipe")

  '(snx-rs NEEDS_RECIPE_DESIGN
    "Checkpoint SNX VPN client in Rust; https://github.com/ancwrd1/snx-rs"
    "cargo-build-system with openssl/libpam deps"
    "Next: pin release, compute sha256, draft cargo recipe")

  '(nodejs-fast-cli NEEDS_RECIPE_DESIGN
    "fast.com CLI speed test; Node.js; https://github.com/sindresorhus/fast-cli"
    "node-build-system or pre-built tarball"
    "Next: fetch npm tarball, compute sha256, draft node recipe")

  '(thorium-browser-bin NEEDS_RECIPE_DESIGN
    "Thorium AVX2 Chromium fork binary; https://github.com/Alex313031/thorium/releases"
    "Binary .deb extraction with patchelf + chrome sandbox setup"
    "Next: fetch latest .deb, compute sha256, draft extraction recipe")

  '(yay-git NEEDS_RECIPE_DESIGN
    "AUR helper in Go; https://github.com/Jguer/yay.git"
    "go-build-system; pacman-specific internals need shim for non-Arch use"
    "Next: pin commit/tag, compute sha256, draft Go recipe with pacman dep shim")

  '(sysc-greet NEEDS_RECIPE_DESIGN
    "greetd greeter; GTK4/Rust; https://github.com/sysc-greet/sysc-greet"
    "cargo + GTK4 recipe"
    "Next: pin release, compute sha256, draft cargo recipe")

  '(brscan-skey NEEDS_RECIPE_DESIGN
    "Brother scanner key daemon; proprietary .deb; https://support.brother.com/"
    "Binary .deb extraction + udev rules"
    "Also: LICENSE_REVIEW_NEEDED — Brother proprietary; Next: fetch .deb, review terms, draft binary recipe")

  '(limine-dracut-support NEEDS_RECIPE_DESIGN
    "Limine bootloader dracut module; shell; https://github.com/limine-bootloader/limine-dracut-support"
    "trivial-build-system recipe"
    "Next: pin release, compute sha256, draft trivial install recipe")

  '(quran-companion NEEDS_RECIPE_DESIGN
    "Quran reading app; Qt5 cmake; https://github.com/0xzer0x/quran-companion"
    "cmake recipe with Qt5 + quran audio data deps"
    "Next: pin release, compute sha256, draft cmake recipe")

  '(gvisor-bin NEEDS_RECIPE_DESIGN
    "Google gVisor runsc binary; https://storage.googleapis.com/gvisor/releases/release/latest/x86_64/runsc"
    "Binary wrapper recipe; Apache-2.0 license"
    "Next: fetch latest runsc binary, compute sha256, draft trivial binary recipe")

  '(suil-optgui NEEDS_RECIPE_DESIGN
    "suil with optional GUI backends; https://gitlab.com/lilvg/suil variant"
    "Patched cmake recipe with optional X11/Qt/GTK backend configure flags"
    "Next: fetch variant source, compute sha256, draft cmake recipe extending suil")

  '(httpx-bin NEEDS_RECIPE_DESIGN
    "Project Discovery httpx HTTP toolkit; Go; https://github.com/projectdiscovery/httpx/releases"
    "Go binary wrapper or go-build-system recipe"
    "Next: fetch latest Linux binary, compute sha256, draft recipe")

  '(gigabyte-laptop-wmi-dkms-git NEEDS_RECIPE_DESIGN
    "Gigabyte laptop WMI DKMS module; https://github.com/tangalbert919/gigabyte-laptop-wmi.git"
    "dkms linux-module-build-system recipe"
    "Next: pin commit, draft module recipe")

  '(qogir-gtk-theme NEEDS_RECIPE_DESIGN
    "Qogir GTK theme; CSS; https://github.com/vinceliuice/Qogir-theme"
    "trivial-build-system recipe for CSS theme files"
    "Next: pin release tag, compute sha256, draft trivial install recipe")

  '(monado-vulkan-layers-git NEEDS_RECIPE_DESIGN
    "Monado Vulkan layers; cmake; https://gitlab.freedesktop.org/monado/utilities/vulkan-layers.git"
    "cmake recipe as companion to Guix monado 25.1.0"
    "Next: pin commit, draft cmake recipe with vulkan/monado deps")

  '(chordpro-cli NEEDS_RECIPE_DESIGN
    "ChordPro CLI; Perl CPAN; https://metacpan.org/dist/App-Music-ChordPro"
    "perl-build-system with App::Music::ChordPro + PDF::API2 deps"
    "Next: fetch CPAN tarball, compute sha256, draft perl recipe")

  '(electron30-bin NEEDS_RECIPE_DESIGN
    "Electron v30 runtime binary; https://github.com/electron/electron/releases/tag/v30.x.x"
    "Binary wrapper with patchelf + electron sandbox setup"
    "Next: fetch Linux zip, compute sha256, draft Electron wrapper recipe")

  '(serpro-signer NEEDS_RECIPE_DESIGN
    "Brazilian SERPRO signing tool; Java proprietary; https://www.serpro.gov.br/links-fixos-superiores/assinador"
    "Binary wrapper after license review"
    "Also: LICENSE_REVIEW_NEEDED — Brazilian govt proprietary redistribution terms")

  '(ros2-humble NEEDS_RECIPE_DESIGN
    "ROS 2 Humble meta-package; massive dep tree; https://github.com/ros2/ros2/releases/tag/release-humble-20231122"
    "Requires full colcon/ament build system; heroic-effort sustained recipe"
    "Next: dedicated multi-week effort; recommend creating a separate focused ticket")

  '(my-femboy-roommate-bin NEEDS_RECIPE_DESIGN
    "Visual novel game binary; https://github.com/Maboroshi-game/my-femboy-roommate releases"
    "Binary wrapper recipe"
    "Next: fetch binary release, compute sha256, draft trivial binary recipe")

  '(lrcget-bin NEEDS_RECIPE_DESIGN
    "LRC lyrics manager; Rust/Tauri binary; https://github.com/tranxuanthang/lrcget/releases"
    "Binary wrapper or cargo-build-system recipe"
    "Next: fetch Linux binary, compute sha256, draft recipe")

  '(surrealdb-bin NEEDS_RECIPE_DESIGN
    "SurrealDB multi-model DB binary; Rust; https://github.com/surrealdb/surrealdb/releases"
    "Binary wrapper or cargo recipe"
    "Next: fetch Linux binary, compute sha256, draft recipe")

  '(brisk-bin NEEDS_RECIPE_DESIGN
    "Brisk app binary; upstream TBD"
    "Upstream source URL requires AUR PKGBUILD audit before recipe"
    "Next: fetch AUR PKGBUILD, confirm source URL, plan recipe")

  '(mint-y-icons NEEDS_RECIPE_DESIGN
    "Linux Mint Y icon theme; trivial; https://github.com/linuxmint/mint-y-icons"
    "trivial-build-system recipe for icon theme files"
    "Next: pin release tag, compute sha256, draft trivial install recipe")

  '(chromium-bypass-paywalls-clean NEEDS_RECIPE_DESIGN
    "Patched Chromium + extension; full source build; heroic effort"
    "Requires full Chromium build from source with extension baked in"
    "Next: assess whether binary distribution is feasible; heroic effort otherwise")

  '(frpc NEEDS_RECIPE_DESIGN
    "frp client; Go; https://github.com/fatedier/frp/releases"
    "go-build-system recipe; shares source with frps"
    "Next: pin release, compute sha256, draft Go recipe building both frpc and frps")

  '(frps NEEDS_RECIPE_DESIGN
    "frp server; Go; https://github.com/fatedier/frp/releases"
    "go-build-system recipe; shares source with frpc"
    "Next: same recipe as frpc; build both binaries from single Go source")

  '(declaro-git NEEDS_RECIPE_DESIGN
    "Dotfile config manager; Rust; https://github.com/arcnmx/declaro.git"
    "cargo-build-system recipe"
    "Next: pin commit, compute sha256, draft cargo recipe")

  '(ps3-disc-dumper-bin NEEDS_RECIPE_DESIGN
    "PS3 disc dumper; .NET 8 binary; https://github.com/13xforever/ps3-disc-dumper/releases"
    ".NET binary wrapper with dotnet-runtime-8 dep"
    "Next: fetch Linux binary, compute sha256, draft dotnet wrapper recipe")

  '(kumono-bin NEEDS_RECIPE_DESIGN
    "Kumono binary; upstream TBD"
    "Upstream source URL requires AUR PKGBUILD audit"
    "Next: fetch AUR PKGBUILD, confirm source URL, plan recipe")

  '(nextpnr-ice40-nightly NEEDS_RECIPE_DESIGN
    "nextpnr iCE40 nightly; cmake git; https://github.com/YosysHQ/nextpnr.git"
    "Nightly git cmake recipe; Guix nextpnr 0.9 is stable; nightly needs pinned commit"
    "Next: identify current nightly commit, compute sha256, draft cmake recipe")

  '(manim NEEDS_RECIPE_DESIGN
    "ManimCE animation library; Python; https://github.com/ManimCommunity/manim"
    "python-build-system with Cairo/OpenGL/manimpango/ffmpeg deps"
    "Next: enumerate all Python deps, draft comprehensive python recipe")

  '(gelly NEEDS_RECIPE_DESIGN
    "Garry's Mod fluid simulation; CMake+CUDA binary; https://github.com/cast-e/gelly/releases"
    "CMake+CUDA plugin recipe; gmod-specific binary"
    "Next: assess CUDA toolchain in Guix, fetch binary, draft wrapper or cmake recipe")

  '(keyman NEEDS_RECIPE_DESIGN
    "Keyman keyboard input method; Qt5+CEF cmake; https://github.com/keymanapp/keyman"
    "cmake recipe with CEF + ibus/fcitx + Qt5 deps"
    "Next: pin release, compute sha256, draft cmake recipe")

  '(python-pythondialog NEEDS_RECIPE_DESIGN
    "Python dialog TUI binding; https://pypi.org/project/pythondialog/"
    "python-build-system with dialog runtime dep"
    "Next: fetch tarball, compute sha256, draft python recipe")

  '(perl-crypt-argon2 NEEDS_RECIPE_DESIGN
    "Perl Argon2 bindings; CPAN; https://metacpan.org/dist/Crypt-Argon2"
    "perl-build-system with libargon2 native dep"
    "Next: fetch CPAN tarball, compute sha256, draft perl XS recipe")

  '(beekeeper-studio NEEDS_RECIPE_DESIGN
    "SQL editor; Electron; https://github.com/beekeeper-studio/beekeeper-studio"
    "Electron recipe or binary extraction; MIT license"
    "Next: assess Electron build complexity, fetch binary, draft recipe")

  '(wireguard-vanity-keygen NEEDS_RECIPE_DESIGN
    "WireGuard vanity keygen; Rust; https://github.com/axllent/wireguard-vanity-keygen"
    "cargo-build-system recipe"
    "Next: pin release, compute sha256, draft cargo recipe")

  '(python-sysv-ipc NEEDS_RECIPE_DESIGN
    "Python System V IPC C extension; https://semanchuk.com/philip/sysv_ipc/"
    "python C-extension build recipe"
    "Next: fetch tarball, compute sha256, draft python recipe with C extension")

  '(networkd-dispatcher NEEDS_RECIPE_DESIGN
    "networkd event dispatcher; Python; https://gitlab.com/craftyguy/networkd-dispatcher"
    "python-build-system with dbus/networkd deps"
    "Next: pin release, compute sha256, draft python recipe")

  '(sshpilot-bin NEEDS_RECIPE_DESIGN
    "SSH manager GUI binary; upstream TBD"
    "Upstream URL requires AUR PKGBUILD audit"
    "Next: fetch AUR PKGBUILD, confirm source URL, plan recipe")

  '(mint-x-icons NEEDS_RECIPE_DESIGN
    "Linux Mint X icon theme; https://github.com/linuxmint/mint-x-icons"
    "trivial-build-system icon theme recipe"
    "Next: pin release, compute sha256, draft trivial install recipe")

  '(xmlada NEEDS_RECIPE_DESIGN
    "XML/Ada library; Ada; https://github.com/AdaCore/xmlada/archive/refs/tags/v25.0.0.tar.gz"
    "Ada/gprbuild recipe; circular dep challenge with gprbuild bootstrap"
    "Next: research Ada bootstrap strategy in Guix, draft staged build recipe")

  '(libgpr NEEDS_RECIPE_DESIGN
    "GNAT GPR runtime; Ada; https://github.com/AdaCore/gprbuild"
    "Ada bootstrap recipe; circular dep: gprbuild needs libgpr needs gprbuild"
    "Next: research staged Ada bootstrap, draft two-phase recipe")

  '(gprbuild NEEDS_RECIPE_DESIGN
    "GNAT Project Manager; Ada; https://github.com/AdaCore/gprbuild"
    "Ada bootstrap recipe; circular dep with libgpr"
    "Next: staged build using GNAT-native bootstrap compiler; heroic effort")

  '(gprtools NEEDS_RECIPE_DESIGN
    "GNAT project tools; Ada; https://github.com/AdaCore/gprtools"
    "Ada recipe companion to gprbuild"
    "Next: once gprbuild recipe exists, draft gprtools recipe")

  '(gprname NEEDS_RECIPE_DESIGN
    "GNAT project naming tool; Ada; https://github.com/AdaCore/gprbuild"
    "Ada companion tool to gprbuild"
    "Next: once gprbuild recipe exists, draft gprname recipe")

  '(clock-tui NEEDS_RECIPE_DESIGN
    "Terminal clock TUI; Rust; https://github.com/race604/clock-tui"
    "cargo-build-system recipe"
    "Next: pin release, compute sha256, draft cargo recipe")

  '(quantumlauncher-bin NEEDS_RECIPE_DESIGN
    "Minecraft launcher; Java binary; https://github.com/Mrmayman/quantum-launcher/releases"
    "Java binary wrapper recipe"
    "Next: fetch .jar, draft Java wrapper recipe")

  '(yubikey-agent NEEDS_RECIPE_DESIGN
    "YubiKey ssh-agent; Go; https://github.com/FiloSottile/yubikey-agent"
    "go-build-system with pcsclite/pinentry deps"
    "Next: pin release, compute sha256, draft Go recipe")

  '(sonarr NEEDS_RECIPE_DESIGN
    "TV PVR service; .NET binary; https://github.com/Sonarr/Sonarr/releases"
    ".NET binary wrapper with dotnet-runtime-8 dep"
    "Next: fetch Linux .tar.gz, compute sha256, draft dotnet wrapper recipe")

  '(ps-mem NEEDS_RECIPE_DESIGN
    "Per-process memory reporter; Python; https://github.com/pixelb/ps_mem"
    "python-build-system recipe"
    "Next: fetch tarball, compute sha256, draft python recipe")

  '(gotify-tray-cpp NEEDS_RECIPE_DESIGN
    "Gotify tray notification; Qt5/C++ cmake; https://github.com/seird/gotify-tray-cpp"
    "cmake + Qt5 recipe"
    "Next: pin release, compute sha256, draft cmake recipe")

  '(sourcegit NEEDS_RECIPE_DESIGN
    "Git GUI; .NET/Avalonia binary; https://github.com/sourcegit-scm/sourcegit/releases"
    ".NET Avalonia binary recipe with patchelf"
    "Next: fetch .tar.gz binary, compute sha256, draft dotnet wrapper recipe")

  '(silverbullet NEEDS_RECIPE_DESIGN
    "Markdown knowledge app; Deno binary; https://github.com/silverbulletmd/silverbullet/releases"
    "Deno single binary wrapper recipe"
    "Next: fetch Linux binary, compute sha256, draft trivial binary recipe")

  '(jellyfin-rpc-bin NEEDS_RECIPE_DESIGN
    "Jellyfin Discord RPC; Rust binary; https://github.com/Radiicall/jellyfin-rpc/releases"
    "Binary wrapper or cargo-build-system recipe"
    "Next: fetch binary, compute sha256, draft recipe")

  '(tera NEEDS_RECIPE_DESIGN
    "Disk usage TUI; Rust; https://github.com/nicohman/tera"
    "cargo-build-system recipe"
    "Next: pin release, compute sha256, draft cargo recipe")

  '(kas NEEDS_RECIPE_DESIGN
    "Yocto layer manager; Python; https://github.com/siemens/kas"
    "python-build-system with PyYAML/GitPython deps"
    "Next: pin release, compute sha256, draft python recipe")

  '(termora-bin NEEDS_RECIPE_DESIGN
    "SSH manager; JVM binary; https://github.com/TermoraDev/termora/releases"
    "JVM binary wrapper recipe"
    "Next: fetch .jar/.tar.gz, draft Java wrapper recipe")

  '(mandelbulber2 NEEDS_RECIPE_DESIGN
    "3D fractal renderer; Qt5+OpenCL cmake; https://github.com/buddhi1980/mandelbulber2"
    "cmake recipe with Qt5 + opencl + openexr deps"
    "Next: pin release, compute sha256, draft cmake recipe")

  '(gohome-bin NEEDS_RECIPE_DESIGN
    "Home automation Go binary; https://github.com/markdaws/gohome/releases"
    "Go binary wrapper recipe; low-votes"
    "Next: fetch binary, compute sha256, draft recipe")

  '(mt7902-bluetooth-dkms-git NEEDS_RECIPE_DESIGN
    "MT7902 Bluetooth DKMS module; https://github.com/mt7902-dkms/mt7902-bt.git"
    "dkms linux-module-build-system recipe; low-votes"
    "Next: pin commit, draft module recipe")

  '(whisparr-eros NEEDS_RECIPE_DESIGN
    "Whisparr Eros branch; .NET binary; https://github.com/whisparr/whisparr/releases"
    ".NET binary wrapper recipe"
    "Next: fetch binary, compute sha256, draft dotnet wrapper recipe")

  '(expandrive-bin NEEDS_RECIPE_DESIGN
    "ExpanDrive cloud client; proprietary binary; https://www.expandrive.com/download"
    "Binary wrapper after license review"
    "Also: LICENSE_REVIEW_NEEDED — proprietary commercial terms")

  '(git-standup NEEDS_RECIPE_DESIGN
    "Git standup CLI; Go; https://github.com/kamranahmedse/git-standup"
    "go-build-system or shell-script install"
    "Next: confirm Go vs shell implementation, pin release, draft recipe")

  '(mago-bin NEEDS_RECIPE_DESIGN
    "Mago binary; upstream TBD; low-votes"
    "Upstream URL requires AUR PKGBUILD audit"
    "Next: fetch AUR PKGBUILD, confirm source URL")

  '(addwater NEEDS_RECIPE_DESIGN
    "Firefox CSS theme app; Python/GTK4; https://github.com/largestgithubusernamedave/AddWater"
    "python-build-system + GTK4 recipe"
    "Next: pin release, compute sha256, draft python recipe")

  '(fftw-amd NEEDS_RECIPE_DESIGN
    "AMD AOCL-FFTW; cmake; https://github.com/amd/aocl-fftw"
    "cmake recipe; Guix fftw 3.3.10 is standard; AMD variant needs AOCL compiler flags"
    "Next: pin AOCL-FFTW release, compute sha256, draft cmake recipe with AMD flags")

  '(phantomjs-git NEEDS_RECIPE_DESIGN
    "PhantomJS headless browser (abandoned 2018); qmake/WebKit; https://github.com/ariya/phantomjs.git"
    "Complex WebKit build; upstream abandoned 2018"
    "Next: assess viability; consider whether packaging abandoned software is worthwhile")

  '(dotr-bin NEEDS_RECIPE_DESIGN
    "Dotfile manager binary; Rust; https://github.com/lappis-unb/dotr/releases"
    "Binary wrapper or cargo recipe; low-votes"
    "Next: fetch binary, compute sha256, draft recipe")

  '(reticulum-meshchat-bin NEEDS_RECIPE_DESIGN
    "Reticulum MeshChat binary; Python/Electron; https://github.com/liamcottle/reticulum-meshchat/releases"
    "Binary wrapper recipe; low-votes"
    "Next: fetch binary, compute sha256, draft recipe")

  '(godot-preview-bin NEEDS_RECIPE_DESIGN
    "Godot preview binary; official pre-release; https://github.com/godotengine/godot/releases"
    "Binary wrapper recipe; Guix godot covers stable releases"
    "Next: fetch latest pre-release binary, compute sha256, draft wrapper recipe")

  '(texlive-acrotex NEEDS_RECIPE_DESIGN
    "Minor: Guix texlive-acro available but not use-moduled in queue-20260324p100b"
    "Add #:use-module (gnu packages tex) to module header and switch inherit to texlive-acro"
    "Next: minor recipe fixup — add tex use-module, update inherit base")

  ))
