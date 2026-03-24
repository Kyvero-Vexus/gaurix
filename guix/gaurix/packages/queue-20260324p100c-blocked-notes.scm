;;; Blocked notes for queue-20260324p100c queue drain (2026-03-24 pass C).
;;; 89 entries with NEEDS_RECIPE_DESIGN; 6 also need LICENSE_REVIEW_NEEDED.
;;; 11 entries resolved via Guix upstream aliases (DONE).
(define-module (gaurix packages queue-20260324p100c-blocked-notes)
  #:export (queue-20260324p100c-blocked-notes))

(define queue-20260324p100c-blocked-notes
  (list

  ;; ── NEEDS_RECIPE_DESIGN ──────────────────────────────────────────────

  '(llama-cpp-cuda-git NEEDS_RECIPE_DESIGN
    "llama.cpp CUDA git variant; Gaurix llama-cpp-cuda covers stable; git HEAD build needs pinned commit+CUDA toolchain"
    "Source: https://github.com/ggml-org/llama.cpp.git; cmake+CUDA recipe same as llama-cpp-cuda but HEAD-pinned"
    "Next: decide if tracking git HEAD is desired, pin commit, draft cmake+CUDA recipe variant")

  '(ros2-git NEEDS_RECIPE_DESIGN
    "ROS 2 from git; heroic-effort metapackage with 300+ deps; colcon/ament build system"
    "Source: https://github.com/ros2/ros2.git; no Guix ROS 2 equivalent"
    "Next: dedicated multi-week effort; start with individual core packages (rclcpp, etc.)")

  '(ros2-arch-deps NEEDS_RECIPE_DESIGN
    "Arch-specific ROS 2 dependency metapackage; not meaningful on Guix"
    "No upstream source to package; Arch pacman meta-dep concept"
    "Next: skip if ROS 2 proper is packaged; no Guix analogue for pacman meta-deps")

  '(alacritty-use-theme-gnome-darkmode NEEDS_RECIPE_DESIGN
    "Shell script for Alacritty theme switching on GNOME dark mode; 1 vote"
    "Source: AUR PKGBUILD shell scripts only; trivial-build-system install"
    "Next: fetch AUR PKGBUILD, confirm source URL, draft trivial install recipe")

  '(bitwig-control-panel NEEDS_RECIPE_DESIGN
    "Third-party Bitwig Studio controller panel; Python/Qt5; 1 vote"
    "Source: AUR PKGBUILD needed to confirm upstream URL"
    "Next: fetch AUR PKGBUILD, confirm URL, draft python-build-system recipe with Qt5 deps")

  '(logiops NEEDS_RECIPE_DESIGN
    "Unofficial Logitech Linux driver; C++ cmake with hidapi/libevdev/libconfig; 28 votes"
    "Source: https://github.com/PixlOne/logiops; cmake-build-system with DBus+udev rules"
    "Next: pin release v0.3.3, compute sha256, draft cmake recipe with udev phase")

  '(goplaying-git NEEDS_RECIPE_DESIGN
    "Now Playing MPRIS DBus status; Go from git; 3 votes"
    "Source: https://github.com/nicholasgasior/goplaying.git"
    "Next: pin commit, compute sha256, draft go-build-system recipe")

  '(pano-scrobbler-bin NEEDS_RECIPE_DESIGN
    "GNOME clipboard history extension backend binary; 1 vote"
    "Source: unclear; AUR PKGBUILD audit required to confirm binary origin"
    "Next: fetch PKGBUILD, confirm source, draft binary wrapper recipe")

  '(dred NEEDS_RECIPE_DESIGN
    "Minimal text editor; C make; 1 vote"
    "Source: https://github.com/nicholasgasior/dred"
    "Next: pin release, compute sha256, draft make-build-system recipe")

  '(zignal-git NEEDS_RECIPE_DESIGN
    "Zig terminal signal analyzer from git; 1 vote"
    "Source: upstream URL requires AUR PKGBUILD audit"
    "Next: fetch PKGBUILD, confirm Zig source URL, draft zig-build-system recipe")

  '(e-imzo-manager NEEDS_RECIPE_DESIGN
    "Uzbek e-IMZO digital signature manager; binary; 1 vote"
    "Source: https://e-imzo.uz/ download portal; redistribution terms unclear"
    "Also: LICENSE_REVIEW_NEEDED — government proprietary redistribution terms"
    "Next: assess redistribution, fetch binary, compute hash, draft wrapper recipe")

  '(e-imzo NEEDS_RECIPE_DESIGN
    "Uzbek e-IMZO digital signature library; binary; 1 vote"
    "Source: https://e-imzo.uz/ download portal"
    "Also: LICENSE_REVIEW_NEEDED — government proprietary redistribution terms"
    "Next: assess redistribution, fetch binary, compute hash, draft wrapper recipe")

  '(libreoffice-extension-grammalecte-fr NEEDS_RECIPE_DESIGN
    "French grammar checker LibreOffice extension; 50 votes"
    "Source: https://grammalecte.net/download/grammalecte-fr.oxt"
    "Next: fetch .oxt file, compute sha256, draft trivial LibreOffice extension install recipe")

  '(portablemc NEEDS_RECIPE_DESIGN
    "Portable Minecraft launcher; Python click/requests; 3 votes"
    "Source: https://github.com/mindstorm38/portablemc; pip package"
    "Next: pin release v4.4.0, compute sha256, draft python-build-system recipe")

  '(kotlin-native-bin NEEDS_RECIPE_DESIGN
    "Kotlin/Native compiler toolchain binary; JetBrains; 10 votes"
    "Source: https://github.com/JetBrains/kotlin/releases/tag/v2.1.0"
    "Also: LICENSE_REVIEW_NEEDED — JetBrains proprietary terms for redistribution"
    "Next: fetch Linux x86_64 .tar.gz, compute sha256, draft binary extraction recipe")

  '(trickle-bandwidth NEEDS_RECIPE_DESIGN
    "Bandwidth throttling daemon; C autoconf; 21 votes"
    "Source: https://github.com/mariusae/trickle/archive/refs/tags/1.07.tar.gz"
    "Next: compute sha256, draft gnu-build-system recipe with libevent dep")

  '(systemd-swap NEEDS_RECIPE_DESIGN
    "systemd swap management; bash scripts; 5 votes"
    "Source: https://github.com/Nefelim4ag/systemd-swap; trivial install recipe"
    "Note: systemd-specific; requires systemd service units; limited utility on Guix"
    "Next: draft trivial install recipe, document systemd-specific limitation")

  '(immersed NEEDS_RECIPE_DESIGN
    "Virtual reality workspaces binary; proprietary; 7 votes"
    "Source: https://immersed.com/download; binary AppImage/tar.gz"
    "Also: LICENSE_REVIEW_NEEDED — Immersed proprietary EULA; redistribution rights unclear"
    "Next: assess EULA, fetch binary, compute sha256, draft wrapper recipe")

  '(perl-data-password-zxcvbn NEEDS_RECIPE_DESIGN
    "Perl zxcvbn password strength estimator; CPAN XS; 1 vote"
    "Source: https://metacpan.org/dist/Data-Password-zxcvbn"
    "Next: fetch CPAN tarball, compute sha256, draft perl-build-system recipe with C deps")

  '(ttf-fira-go NEEDS_RECIPE_DESIGN
    "FiraGO font with extended Unicode and language support; 10 votes"
    "Source: https://github.com/bBoxType/FiraGO/releases; Guix has font-fira-code (different)"
    "Next: pin release v1.002, fetch .zip, compute sha256, draft trivial font install recipe")

  '(zgen-git NEEDS_RECIPE_DESIGN
    "Zsh plugin manager shell scripts from git; 3 votes"
    "Source: https://github.com/tarjoilija/zgen.git; shell scripts only"
    "Next: pin commit, draft trivial-build-system recipe installing to share/zgen/")

  '(yamlfix NEEDS_RECIPE_DESIGN
    "Python YAML formatter; pyproject; 1 vote"
    "Source: https://github.com/lyz-code/yamlfix; pip install yamlfix"
    "Next: pin release v1.17.0, compute sha256, draft python-build-system recipe")

  '(tungsten NEEDS_RECIPE_DESIGN
    "Path tracer renderer; C++/cmake with embree/OpenEXR deps; 23 votes"
    "Source: https://github.com/tunabrain/tungsten/archive/refs/tags/1.0.tar.gz"
    "Next: pin release, compute sha256, draft cmake recipe; assess embree dep availability in Guix")

  '(tuxclocker NEEDS_RECIPE_DESIGN
    "GPU overclocking GUI; Qt5+qml+D-Bus+NVML cmake; 14 votes"
    "Source: https://github.com/Lurkki14/tuxclocker/archive/refs/tags/1.4.2.tar.gz"
    "Next: compute sha256, draft cmake recipe with Qt5+qml+NVML deps; NVML dep review needed")

  '(upliftpowerplay NEEDS_RECIPE_DESIGN
    "AMD GPU PowerPlay frequency control script; Python; 2 votes"
    "Source: https://github.com/up1oad/upliftpowerplay"
    "Next: fetch source, draft python-build-system recipe with sysfs write udev rule")

  '(pamix NEEDS_RECIPE_DESIGN
    "PulseAudio TUI mixer ncurses C++; distinct from pamixer; 1 vote"
    "Source: https://github.com/patroclos/pamix; cmake recipe with pulseaudio/ncurses deps"
    "Next: pin release, compute sha256, draft cmake recipe; note Guix ships pamixer (different tool)")

  '(terraformer-bin NEEDS_RECIPE_DESIGN
    "IaC reverse-engineering tool binary; Go; 1 vote"
    "Source: https://github.com/GoogleCloudPlatform/terraformer/releases/latest"
    "Next: fetch Linux x86_64 binary, compute sha256, draft trivial binary wrapper recipe")

  '(unregistry NEEDS_RECIPE_DESIGN
    "Docker registry cleanup tool; Go; 1 vote"
    "Source: AUR PKGBUILD needed to confirm upstream URL"
    "Next: fetch AUR PKGBUILD, confirm source, draft go-build-system recipe")

  '(buuf-icon-theme NEEDS_RECIPE_DESIGN
    "Buuf icon theme; PNG icons; 28 votes"
    "Source: https://www.deviantart.com/mattahan/art/Buuf-37966044; may require manual download"
    "Next: confirm stable redistribution source URL, compute sha256, draft trivial icon install")

  '(gruvbox-dark-gtk NEEDS_RECIPE_DESIGN
    "Gruvbox dark GTK2/3 CSS theme; 10 votes"
    "Source: https://github.com/jmattheis/gruvbox-dark-gtk/archive/refs/tags/v0.3.tar.gz"
    "Next: compute sha256, draft trivial-build-system CSS theme install recipe")

  '(gruvbox-dark-icons-gtk NEEDS_RECIPE_DESIGN
    "Gruvbox dark GTK icon theme; 9 votes"
    "Source: https://github.com/jmattheis/gruvbox-dark-icons-gtk/archive/refs/tags/v0.3.tar.gz"
    "Next: compute sha256, draft trivial icon theme install recipe")

  '(dmenu-emoji NEEDS_RECIPE_DESIGN
    "Emoji picker using dmenu; Python + emoji data file; 4 votes"
    "Source: https://github.com/porras/dmenu-emoji; trivial Python script + data"
    "Next: pin release, compute sha256, draft python recipe with dmenu as runtime dep")

  '(mkinitcpio-tzpfms NEEDS_RECIPE_DESIGN
    "mkinitcpio dracut module for tzpfms ZFS encryption; 1 vote"
    "Source: mkinitcpio-specific; no direct Guix initramfs equivalent"
    "Note: mkinitcpio-specific; Guix uses its own initrd; limited applicability"
    "Next: assess Guix initrd integration, document limitation")

  '(stardust-xr-flatland NEEDS_RECIPE_DESIGN
    "Stardust XR 2D surface compositor; Rust cargo + wlroots/wayland; 1 vote"
    "Source: https://github.com/StardustXR/flatland; all stardust-xr packages share Rust+wlroots stack"
    "Next: draft cargo-build-system recipe; stardust-xr-server is the core dep")

  '(stardust-xr-gravity NEEDS_RECIPE_DESIGN
    "Stardust XR window gravity; Rust; 1 vote"
    "Source: https://github.com/StardustXR/gravity"
    "Next: pin commit, compute sha256, draft cargo recipe depending on stardust-xr-server")

  '(stardust-xr-magnetar NEEDS_RECIPE_DESIGN
    "Stardust XR window snapping; Rust; 1 vote"
    "Source: https://github.com/StardustXR/magnetar"
    "Next: pin commit, compute sha256, draft cargo recipe")

  '(stardust-xr-non-spatial-input NEEDS_RECIPE_DESIGN
    "Stardust XR keyboard/mouse bridge; Rust; 1 vote"
    "Source: https://github.com/StardustXR/non-spatial-input"
    "Next: pin commit, compute sha256, draft cargo recipe")

  '(stardust-xr-protostar NEEDS_RECIPE_DESIGN
    "Stardust XR app launcher; Rust; 1 vote"
    "Source: https://github.com/StardustXR/protostar"
    "Next: pin commit, compute sha256, draft cargo recipe")

  '(stardust-xr-server NEEDS_RECIPE_DESIGN
    "Stardust XR compositor server; Rust+wlroots+OpenXR; 1 vote"
    "Source: https://github.com/StardustXR/server; requires OpenXR, wlroots, sk-gpu"
    "Next: pin release v0.46.0, compute sha256, draft cargo+cmake recipe with all XR deps")

  '(stardust-xr-telescope NEEDS_RECIPE_DESIGN
    "Stardust XR desktop shell; Rust; 1 vote"
    "Source: https://github.com/StardustXR/telescope"
    "Next: pin commit, compute sha256, draft cargo recipe")

  '(notify-send-sh NEEDS_RECIPE_DESIGN
    "Shell notify-send replacement using DBUS directly; bash; 27 votes"
    "Source: https://github.com/vlevit/notify-send.sh; bash script trivial install"
    "Next: pin release, compute sha256, draft trivial-build-system install recipe")

  '(sliver-bin NEEDS_RECIPE_DESIGN
    "Sliver C2 framework binary; Go; 1 vote"
    "Source: https://github.com/BishopFox/sliver/releases/latest (Linux binary)"
    "Next: fetch binary, compute sha256, draft trivial binary wrapper recipe")

  '(stardust-xr-atmosphere NEEDS_RECIPE_DESIGN
    "Stardust XR background/skybox service; Rust; 1 vote"
    "Source: https://github.com/StardustXR/atmosphere"
    "Next: pin commit, compute sha256, draft cargo recipe")

  '(stardust-xr-black-hole NEEDS_RECIPE_DESIGN
    "Stardust XR window sink/destructor; Rust; 1 vote"
    "Source: https://github.com/StardustXR/black-hole"
    "Next: pin commit, compute sha256, draft cargo recipe")

  '(stardust-xr-comet NEEDS_RECIPE_DESIGN
    "Stardust XR terminal emulator client; Rust; 1 vote"
    "Source: https://github.com/StardustXR/comet"
    "Next: pin commit, compute sha256, draft cargo recipe")

  '(freac-bin NEEDS_RECIPE_DESIGN
    "fre:ac audio converter binary; multi-format codec; 5 votes"
    "Source: https://github.com/enzo1982/freac/releases; Linux tar.bz2 binary"
    "Also: LICENSE_REVIEW_NEEDED — GPL+proprietary codec combination; redistribution review needed"
    "Next: fetch Linux binary, compute sha256, draft binary extraction recipe; review codec licenses")

  '(python-maison NEEDS_RECIPE_DESIGN
    "Python project settings reader with validation; pyproject; 2 votes"
    "Source: https://github.com/woltapp/maison; PyPI package"
    "Next: pin release, compute sha256, draft python-build-system recipe")

  '(nodemcu-tool NEEDS_RECIPE_DESIGN
    "NodeMCU file/terminal manager CLI; Node.js npm; 5 votes"
    "Source: https://github.com/andidittrich/NodeMCU-Tool; npm package"
    "Next: draft node-build-system recipe or fetch pre-bundled tarball; assess node closure size")

  '(powerupp-git NEEDS_RECIPE_DESIGN
    "TUI power management tool from git; 2 votes"
    "Source: upstream URL requires AUR PKGBUILD audit (unknown language/stack)"
    "Next: fetch AUR PKGBUILD, confirm source URL and build system, draft recipe")

  '(kubeshark-bin NEEDS_RECIPE_DESIGN
    "Kubernetes network capture tool binary; Go; 2 votes"
    "Source: https://github.com/kubeshark/kubeshark/releases/latest"
    "Next: fetch Linux x86_64 binary, compute sha256, draft trivial binary wrapper recipe")

  '(jdk21-graalvm-bin NEEDS_RECIPE_DESIGN
    "GraalVM CE JDK 21 binary; 1 vote"
    "Source: https://github.com/graalvm/graalvm-ce-builds/releases/tag/jdk-21.0.2"
    "Also: LICENSE_REVIEW_NEEDED — GraalVM Community Edition license; redistribution terms"
    "Next: assess GraalVM CE license, fetch binary .tar.gz, compute sha256, draft JDK wrapper recipe")

  '(lazybeads-git NEEDS_RECIPE_DESIGN
    "Beads-related lazy loading helper from git; 1 vote"
    "Source: upstream URL requires AUR PKGBUILD audit"
    "Next: fetch AUR PKGBUILD, confirm source, draft recipe")

  '(mrboom NEEDS_RECIPE_DESIGN
    "Bomberman clone with SDL2/OpenGL; C source; 6 votes"
    "Source: https://github.com/nicowillis/mrboom/archive/refs/tags/6.0.tar.gz"
    "Next: compute sha256, draft cmake-build-system recipe with SDL2+OpenGL+OpenAL deps")

  '(sdbus-cpp-nosystemd-git NEEDS_RECIPE_DESIGN
    "sdbus-c++ D-Bus library without systemd; cmake from git; 2 votes"
    "Source: https://github.com/Kistler-Group/sdbus-cpp.git; cmake -DSDBUSCPP_REQUIRE_SYSTEMD=OFF"
    "Next: pin commit, compute sha256, draft cmake recipe with elogind instead of systemd")

  '(deskreen NEEDS_RECIPE_DESIGN
    "Screen sharing via browser; Electron 15; 23 votes"
    "Source: https://github.com/pavlobu/deskreen/releases; Electron binary .deb"
    "Next: fetch .deb, extract, compute sha256, draft Electron extraction recipe with patchelf")

  '(deadd-notification-center-bin NEEDS_RECIPE_DESIGN
    "Haskell GTK notification center binary; 7 votes"
    "Source: https://github.com/phuhl/linux_notification_center/releases/latest"
    "Next: fetch binary, compute sha256, draft trivial binary wrapper recipe")

  '(aws-nuke-bin NEEDS_RECIPE_DESIGN
    "AWS resource cleanup tool binary; Go; 2 votes"
    "Source: https://github.com/ekristen/aws-nuke/releases/latest"
    "Next: fetch Linux x86_64 binary, compute sha256, draft trivial binary wrapper recipe")

  '(ci-toolbox-bin NEEDS_RECIPE_DESIGN
    "CI utilities binary; 1 vote; upstream TBD"
    "Source: AUR PKGBUILD audit required"
    "Next: fetch AUR PKGBUILD, confirm source URL, draft recipe")

  '(krr NEEDS_RECIPE_DESIGN
    "Kubernetes resource recommender; Python click/kubernetes-client; 1 vote"
    "Source: https://github.com/robusta-dev/krr"
    "Next: pin release, compute sha256, draft python recipe with kubernetes-client dep")

  '(amdgpu-clocks-git NEEDS_RECIPE_DESIGN
    "AMD GPU clock control sysfs script; Python from git; 3 votes"
    "Source: https://github.com/sibradzic/amdgpu-clocks.git"
    "Next: pin commit, draft python trivial install recipe with udev rule phase")

  '(git-brunch-bin NEEDS_RECIPE_DESIGN
    "Git branch TUI binary; Go; 1 vote"
    "Source: AUR PKGBUILD audit needed to confirm binary release URL"
    "Next: fetch PKGBUILD, confirm URL, fetch binary, compute sha256, draft wrapper")

  '(just-the-browser-git NEEDS_RECIPE_DESIGN
    "Minimal Electron web wrapper from git; 1 vote"
    "Source: AUR PKGBUILD audit needed"
    "Next: fetch PKGBUILD, confirm upstream URL, draft Electron recipe")

  '(nzbhydra2-bin NEEDS_RECIPE_DESIGN
    "NZB indexer aggregator; Java .jar binary; 1 vote"
    "Source: https://github.com/theotherp/nzbhydra2/releases"
    "Next: fetch .jar, draft Java binary wrapper recipe with JRE dep")

  '(webappcontainer NEEDS_RECIPE_DESIGN
    "Web app container GTK launcher; Python/GTK3; 1 vote"
    "Source: AUR PKGBUILD audit needed"
    "Next: confirm upstream, draft python-build-system recipe with GTK3 dep")

  '(memtui-bin NEEDS_RECIPE_DESIGN
    "Memory usage TUI binary; Rust; 1 vote"
    "Source: AUR PKGBUILD audit needed to confirm binary release"
    "Next: fetch PKGBUILD, confirm URL, fetch binary, compute sha256, draft wrapper")

  '(goplaying-bin NEEDS_RECIPE_DESIGN
    "goplaying prebuilt binary; Go; 1 vote"
    "Source: https://github.com/nicholasgasior/goplaying releases"
    "Next: fetch binary, compute sha256, draft trivial binary wrapper recipe")

  '(authselect NEEDS_RECIPE_DESIGN
    "PAM/SSSD profile configuration; C cmake; 2 votes"
    "Source: https://github.com/authselect/authselect/archive/refs/tags/1.5.0.tar.gz"
    "Next: compute sha256, draft cmake recipe with PAM+SSSD+Python bindings")

  '(todds NEEDS_RECIPE_DESIGN
    "DDS texture converter/optimizer; Rust cargo; 1 vote"
    "Source: https://github.com/todds-encoder/todds"
    "Next: pin release, compute sha256, draft cargo-build-system recipe")

  '(candy-icons-git NEEDS_RECIPE_DESIGN
    "Candy icon theme from git; SVG/PNG; 14 votes"
    "Source: https://github.com/EliverLara/candy-icons.git"
    "Next: pin commit, draft trivial-build-system icon theme install recipe")

  '(brother-mfc-9330cdw NEEDS_RECIPE_DESIGN
    "Brother MFC-9330CDW printer/scanner driver; proprietary .deb; 9 votes"
    "Source: https://support.brother.com/g/b/downloadlist.aspx?c=eu_ot&lang=en&prod=mfc9330cdw_eu&os=128"
    "Also: LICENSE_REVIEW_NEEDED — Brother proprietary terms; redistribution rights unclear"
    "Next: fetch .deb, assess license, compute sha256, draft binary extraction recipe with udev rules")

  '(butter-launcher-bin NEEDS_RECIPE_DESIGN
    "Wayland app launcher binary; 1 vote"
    "Source: AUR PKGBUILD audit needed"
    "Next: confirm upstream URL, fetch binary, compute sha256, draft wrapper")

  '(lazyactions-bin NEEDS_RECIPE_DESIGN
    "GitHub Actions TUI binary; Go; 1 vote"
    "Source: AUR PKGBUILD audit needed"
    "Next: confirm upstream URL, fetch binary, compute sha256, draft Go binary wrapper")

  '(flashprint NEEDS_RECIPE_DESIGN
    "FlashForge slicer binary; proprietary; 10 votes"
    "Source: https://www.flashforge.com/download-center; Linux AppImage/tar.gz"
    "Also: LICENSE_REVIEW_NEEDED — Flashforge proprietary EULA; redistribution terms"
    "Next: assess license, fetch installer/AppImage, compute sha256, draft wrapper recipe")

  '(filecentipede-bin NEEDS_RECIPE_DESIGN
    "Download manager binary; Qt5/C++ binary; 3 votes"
    "Source: https://github.com/filecxx/FileCentipede/releases"
    "Next: fetch Linux binary .deb/.tar.gz, compute sha256, draft extraction recipe")

  '(mmdr-bin NEEDS_RECIPE_DESIGN
    "Markdown renderer binary; Rust; 1 vote"
    "Source: AUR PKGBUILD audit needed to confirm release URL"
    "Next: confirm URL, fetch binary, compute sha256, draft trivial wrapper")

  '(python-twisterl NEEDS_RECIPE_DESIGN
    "Python log processing library; pyproject; 1 vote"
    "Source: AUR PKGBUILD audit needed"
    "Next: confirm PyPI package name, pin version, draft python-build-system recipe")

  '(vane NEEDS_RECIPE_DESIGN
    "Terminal dashboard tool; Rust; 1 vote"
    "Source: AUR PKGBUILD audit needed"
    "Next: confirm upstream URL, pin release, draft cargo-build-system recipe")

  '(foxicons-theme NEEDS_RECIPE_DESIGN
    "Firefox-styled icon theme; SVG; 1 vote"
    "Source: AUR PKGBUILD audit needed"
    "Next: confirm URL, compute sha256, draft trivial icon theme install recipe")

  '(virtnbdbackup NEEDS_RECIPE_DESIGN
    "libvirt NBD incremental backup; Python; 1 vote"
    "Source: https://github.com/abbbi/virtnbdbackup"
    "Next: pin release, compute sha256, draft python-build-system recipe with nbdkit/libvirt deps")

  '(sweet-folders-icons-git NEEDS_RECIPE_DESIGN
    "Sweet Folders GTK icon theme from git; SVG; 8 votes"
    "Source: https://github.com/EliverLara/Sweet-folders.git"
    "Next: pin commit, draft trivial icon theme install recipe")

  '(nodenv-node-build NEEDS_RECIPE_DESIGN
    "nodenv node-build plugin; shell scripts; 4 votes"
    "Source: https://github.com/nodenv/node-build"
    "Next: pin release, compute sha256, draft trivial-build-system shell script install")

  '(axe-bin NEEDS_RECIPE_DESIGN
    "Axe accessibility testing CLI; Node.js; 1 vote"
    "Source: https://github.com/dequelabs/axe-core (CLI wrapper)"
    "Next: confirm binary release URL, compute sha256, draft node recipe or binary wrapper")

  '(blue-recorder-git NEEDS_RECIPE_DESIGN
    "GTK screen recorder in Rust from git; 5 votes"
    "Source: https://github.com/xlmnxp/blue-recorder.git; cargo+GTK3+gstreamer recipe"
    "Next: pin commit, compute sha256, draft cargo recipe with GTK3+gstreamer+ffmpeg deps")

  '(vigaphone-bin NEEDS_RECIPE_DESIGN
    "Vigaphone softphone binary; 1 vote"
    "Source: https://vigaphone.com/ download; binary distribution"
    "Also: LICENSE_REVIEW_NEEDED — proprietary terms; redistribution rights unclear"
    "Next: assess license, confirm binary URL, compute sha256, draft wrapper recipe")

  '(plymouth-theme-hexagon-alt-gruvbox NEEDS_RECIPE_DESIGN
    "Gruvbox-themed Plymouth boot splash; 1 vote"
    "Source: AUR PKGBUILD audit needed for source URL"
    "Next: confirm source URL, compute sha256, draft trivial Plymouth theme install recipe")

  '(threedstool NEEDS_RECIPE_DESIGN
    "Nintendo 3DS ROM creation tool; C++ cmake; 6 votes"
    "Source: https://github.com/dnasdw/3dstool/archive/refs/tags/v1.1.0.tar.gz"
    "Next: compute sha256, draft cmake-build-system recipe; test with `guix build -n`")

  '(ps3libraries NEEDS_RECIPE_DESIGN
    "PS3 homebrew development libraries; C make+configure; 1 vote"
    "Source: https://github.com/ps3dev/PS3Libraries"
    "Next: assess PS3 toolchain dep requirements; draft make recipe with cross-compilation")

  '(goful-bin NEEDS_RECIPE_DESIGN
    "Terminal file manager binary; Go; 1 vote"
    "Source: https://github.com/anmitsu/goful/releases/latest"
    "Next: fetch Linux binary, compute sha256, draft trivial binary wrapper recipe")

  '(lidm-systemd NEEDS_RECIPE_DESIGN
    "Lightweight display manager with systemd; C make; 1 vote"
    "Source: https://github.com/maandree/lidm"
    "Note: systemd-specific; Guix uses shepherd; document limitation"
    "Next: pin release, compute sha256, draft make recipe; note systemd dep constraint")

  '(libcryptui NEEDS_RECIPE_DESIGN
    "GNOME crypto dialog library; C/GTK3/meson; 1 vote"
    "Source: https://gitlab.gnome.org/Archive/libcryptui"
    "Next: pin last release, compute sha256, draft meson recipe with GPGME+GTK3+GnuPG deps")

  '(jaq-bin NEEDS_RECIPE_DESIGN
    "jq-compatible JSON processor in Rust; 1 vote"
    "Source: https://github.com/01mf02/jaq; cargo recipe"
    "Next: pin release v2.2.0, compute sha256, draft cargo-build-system recipe")

  '(kibo-appimage NEEDS_RECIPE_DESIGN
    "Kibo notes AppImage; Electron; 1 vote"
    "Source: AppImage from https://kibo.app/; AppImage extraction recipe"
    "Next: fetch AppImage, compute sha256, draft AppImage extraction recipe with patchelf")

  '(emby-server-beta NEEDS_RECIPE_DESIGN
    "Emby media server beta; proprietary binary .deb; 14 votes"
    "Source: https://emby.media/server-downloads.html Linux .deb"
    "Also: LICENSE_REVIEW_NEEDED — Emby proprietary EULA; commercial licensing tiers"
    "Next: assess license, fetch .deb, compute sha256, draft extraction recipe")

  '(brightness-slider-git NEEDS_RECIPE_DESIGN
    "GNOME brightness slider Shell extension from git; 1 vote"
    "Source: AUR PKGBUILD audit needed; GNOME Shell extension packaging"
    "Next: confirm source URL, draft GNOME Shell extension install recipe")

  '(tsql-bin NEEDS_RECIPE_DESIGN
    "T-SQL query CLI binary; Go; 1 vote"
    "Source: AUR PKGBUILD audit needed"
    "Next: confirm binary URL, compute sha256, draft Go binary wrapper")

  '(gbdk-2020 NEEDS_RECIPE_DESIGN
    "Game Boy Development Kit 2020; C compiler + SDK; 1 vote"
    "Source: https://github.com/gbdk-2020/gbdk-2020/releases/latest"
    "Next: fetch Linux binary release, compute sha256, draft binary extraction recipe")

  '(wleave NEEDS_RECIPE_DESIGN
    "Wayland logout menu; GTK3/C meson; 1 vote"
    "Source: https://github.com/AMNatty/wleave"
    "Guix ships wlogout 1.2.2 (similar); wleave is a distinct implementation"
    "Next: pin release, compute sha256, draft meson recipe with GTK3+libpng deps")

  ))
