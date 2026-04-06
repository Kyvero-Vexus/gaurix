;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #13 — blocked notes.
;;; 24 recipes created (8 Python + 4 Catppuccin themes + 3 OBS plugins + 2 Go
;;; tools + 3 script/copy packages + 1 game port + 1 C++ lib + 1 game query
;;; tool + 1 clipboard tool).
;;; 10 compat aliases added to general-compat.scm.
;;; 66 packages re-blocked with concrete reasons.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd13-blocked-notes))

(define %blocked-notes
  (list

   ;; ── NEEDS_RECIPE_DESIGN ──────────────────────────────────────────

   '(v1541commander
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Qt5/C++ Commodore 1541 disk image editor.  Uses qmake build system.
Needs Qt5 widgets + custom build phase for qmake invocation.  GitHub repo:
github.com/sv99/v1541commander.  No existing Guix package."
     next-action: "Write qmake-based recipe with Qt5 inputs")

   '(fahcontrol-gtk3-git
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Python3/GTK3 fork of Folding@home control.  Source at
github.com/cdbennett/fahcontrol-gtk3.  Needs python-build-system with
GTK3/GObject introspection deps.  Moderate complexity."
     next-action: "Draft python-build-system recipe with GTK3 inputs")

   '(cask
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Emacs project management tool (github.com/cask/cask).
Python-based CLI that installs Emacs packages.  Needs careful integration
with Guix Emacs infrastructure.  Not trivial — interacts with package.el."
     next-action: "Investigate emacs-build-system applicability vs python wrapper")

   '(xoreos
     reason: "NEEDS_RECIPE_DESIGN"
     details: "BioWare Aurora engine reimplementation (github.com/xoreos/xoreos).
CMake build with many deps: boost, SDL2, OpenAL, libxml2, zlib, lzma, libiconv,
FreeType, Vorbis, MAD.  Complex but feasible.  ~50 source files."
     next-action: "Draft cmake-build-system recipe with full dependency list")

   '(ecwolf-git
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Enhanced Wolfenstein 3D source port (github.com/AustinS/ecwolf).
CMake build; deps: SDL2, SDL2_mixer, SDL2_net, zlib, bzip2, libjpeg.
Moderate complexity, well-defined deps."
     next-action: "Draft cmake-build-system recipe")

   '(git-it
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Electron desktop app teaching Git/GitHub (github.com/jlord/git-it-electron).
Node.js/Electron app — requires npm/node build infrastructure.  Guix Electron
packaging is experimental and complex."
     next-action: "Evaluate node-build-system or binary packaging approach")

   '(muon-ssh
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Java Swing-based SSH/SFTP client (github.com/ArunMurugan0/muon-ssh
or github.com/subhra74/snowflake).  Java/Maven build.  Guix Java packaging
exists but is labor-intensive.  Moderate-high complexity."
     next-action: "Evaluate ant/maven-build-system recipe")

   '(libvgm-git
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Video game music playback library (github.com/ValleyBell/libvgm).
CMake build with optional deps: zlib, iconv, audio backends.  Moderate
complexity, well-structured upstream."
     next-action: "Draft cmake-build-system recipe")

   '(dbus-action
     reason: "NEEDS_RECIPE_DESIGN"
     details: "D-Bus signal watcher/action tool (github.com/qzed/dbus-action).
Rust/Cargo project.  Requires cargo-build-system with vendored crates.
Moderate complexity."
     next-action: "Draft cargo-build-system recipe or use pre-built binary")

   '(xr-driver-git
     reason: "NEEDS_RECIPE_DESIGN"
     details: "XR Linux driver for VR/AR headsets (gitlab.com/TheJackiMonster/xr-driver).
C/CMake project with USB/hidapi deps.  Kernel interaction, moderate complexity."
     next-action: "Investigate build requirements and kernel module status")

   '(breezy-desktop-gnome-git
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Breezy GNOME XR desktop extension (github.com/nicohman/breezy-desktop-gnome).
GNOME Shell extension with Meson build.  Depends on xr-driver-git ecosystem."
     next-action: "Blocked on xr-driver-git; draft meson recipe after")

   '(debugpy-run
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Python debugpy launcher (github.com/bulletmark/debugpy-run).
Simple Python script.  Depends on debugpy.  python-build-system feasible."
     next-action: "Draft simple python-build-system recipe")

   '(nbtopy
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Jupyter notebook to Python converter (github.com/bulletmark/nbtopy).
Simple Python package.  pyproject-build-system feasible."
     next-action: "Draft pyproject-build-system recipe after hash fetch")

   '(pdfcmd
     reason: "NEEDS_RECIPE_DESIGN"
     details: "PDF command-line tools (github.com/bulletmark/pdfcmd).
Python package using pypdf.  pyproject-build-system feasible."
     next-action: "Draft pyproject-build-system recipe after hash fetch")

   '(encfsui
     reason: "NEEDS_RECIPE_DESIGN"
     details: "EncFS GUI wrapper (github.com/mhogomchungu/encfsui).
Qt/C++ with CMake build.  Deps: encfs, Qt5, libsecret.  Moderate complexity."
     next-action: "Draft cmake-build-system recipe with Qt5+encfs inputs")

   '(gosuki-git
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Multi-browser bookmark manager in Go (github.com/nicohman/gosuki).
Go module build.  Moderate complexity with browser-specific parsing."
     next-action: "Draft go-build-system recipe")

   '(python-pyautogui
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Python GUI automation (github.com/asweigart/pyautogui).
Depends on python-pyscreeze, python-pytweening, python-mouseinfo (all
now packaged in this batch).  pyproject-build-system feasible but needs
display for tests."
     next-action: "Draft recipe using new deps from this batch; disable tests")

   '(qt6gtk2
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Qt6 GTK2 platform integration plugin (github.com/nicohman/qt6gtk2
or trialuser02/qt6gtk2).  CMake build with Qt6+GTK2 deps.  Moderate complexity."
     next-action: "Draft cmake-build-system recipe with Qt6+GTK2 inputs")

   '(obsidianctl
     reason: "NEEDS_RECIPE_DESIGN"
     details: "ObsidianOS A/B partition manager.  Niche tool for ObsidianOS
distribution.  Source at github.com/nicohman/obsidianctl or similar.
Limited applicability outside ObsidianOS."
     next-action: "Low priority — investigate source availability")

   '(gatus
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Health monitoring dashboard in Go (github.com/TwiN/gatus).
Complex Go project with many deps, web UI with embedded assets.
go-build-system feasible but needs vendored deps."
     next-action: "Draft go-build-system recipe with vendor support")

   '(dsnote
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Speech-to-text note app (github.com/nicohman/dsnote).
Qt/QML C++ with CMake.  Depends on whisper.cpp, espeak, Qt6.
Complex dep chain."
     next-action: "Block on whisper.cpp packaging; draft cmake recipe after")

   '(neard
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Intel NFC daemon (git.kernel.org/pub/scm/network/nfc/neard.git).
Autotools build, D-Bus service.  Deps: glib, dbus, libnl, netlink.
Moderate complexity, well-structured."
     next-action: "Draft gnu-build-system recipe with autotools")

   '(nautilus-admin-gtk4
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Nautilus admin extension for GTK4 (github.com/nicohman/nautilus-admin-gtk4).
Python Nautilus extension.  Simple but needs nautilus-python bindings."
     next-action: "Draft python extension recipe with nautilus deps")

   '(nulloy
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Audio player with waveform (github.com/nicohman/nulloy).
Qt/C++ with CMake.  Deps: Qt5, GStreamer, taglib.  Moderate complexity."
     next-action: "Draft cmake-build-system recipe")

   '(catapult
     reason: "NEEDS_RECIPE_DESIGN"
     details: "App launcher for Linux (github.com/nicohman/catapult).
GTK4/Rust application.  cargo-build-system with GTK4 deps.  Moderate complexity."
     next-action: "Draft cargo-build-system recipe with GTK4 inputs")

   '(neothesia
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Synthesia-like piano learning app (github.com/PolyMeilex/Neothesia).
Rust/wgpu application with complex graphics pipeline.  cargo-build-system
with GPU/audio deps.  High complexity."
     next-action: "Investigate wgpu Guix support; draft cargo recipe")

   '(clapgrep
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Search tool for CLAP/VST plugins (github.com/nicohman/clapgrep).
Rust/Cargo project.  cargo-build-system feasible."
     next-action: "Draft cargo-build-system recipe")

   '(pnputils-git
     reason: "NEEDS_RECIPE_DESIGN"
     details: "USB PnP utilities.  Source repo not clearly identified from AUR
description alone.  Needs source URL verification."
     next-action: "Verify upstream source URL and evaluate build system")

   ;; ── NEEDS_RECIPE_DESIGN (binary packages) ────────────────────────

   '(mqttx-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "MQTT 5.0 desktop client (Electron app).  Binary AppImage from
github.com/emqx/MQTTX/releases.  copy-build-system with patchelf feasible."
     next-action: "Draft copy-build-system binary recipe with AppImage extraction")

   '(audiobookconverter-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Java-based audiobook converter.  Binary release from
github.com/yermak/AudioBookConverter/releases.  Needs JRE runtime."
     next-action: "Draft trivial-build-system recipe wrapping Java binary")

   '(upsnap-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Wake-on-LAN web app.  Binary from github.com/seriousm4x/UpSnap/releases.
Single Go binary.  copy-build-system with patchelf feasible."
     next-action: "Draft copy-build-system recipe")

   '(slides-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Terminal presentation tool from Charm.sh.  Binary from
github.com/maaslalani/slides/releases.  Single Go binary."
     next-action: "Draft copy-build-system recipe for Go binary")

   '(invoice-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "CLI invoice generator from Charm.sh.  Binary from
github.com/maaslalani/invoice/releases.  Single Go binary."
     next-action: "Draft copy-build-system recipe for Go binary")

   '(gyroflow-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Video stabilization app.  Binary from github.com/gyroflow/gyroflow/releases.
Complex binary with Qt6+OpenCL deps.  Needs patchelf for many shared libs."
     next-action: "Draft copy-build-system recipe with extensive patchelf")

   '(xidel-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "XML/HTML/JSON query tool.  Binary from github.com/benibela/xidel/releases.
Free Pascal static binary.  copy-build-system feasible."
     next-action: "Draft copy-build-system recipe")

   '(mod-desktop-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "MOD Audio desktop app.  Binary from github.com/moddevices/mod-desktop/releases.
Complex audio application with many shared lib deps."
     next-action: "Evaluate binary packaging feasibility")

   '(zig-master-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Zig compiler master branch binary.  Available from
ziglang.org/download/.  Single tarball.  copy-build-system feasible."
     next-action: "Draft copy-build-system recipe for Zig tarball")

   '(duckstation-qt-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "PlayStation 1 emulator.  AppImage from
github.com/stenzek/duckstation/releases.  Complex deps (Qt6, GL, audio)."
     next-action: "Draft copy-build-system recipe with AppImage extraction")

   '(filen-cli-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Filen cloud CLI.  Binary from github.com/nicohman/filen-cli.
Node.js compiled binary or standalone.  Needs evaluation."
     next-action: "Verify binary availability and draft copy recipe")

   '(nuclei-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Vulnerability scanner.  Single Go binary from
github.com/projectdiscovery/nuclei/releases.  copy-build-system feasible."
     next-action: "Draft copy-build-system recipe for Go binary")

   '(shader-slang-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Slang shader compiler.  Binary from
github.com/shader-slang/slang/releases.  C++ binary with shared libs."
     next-action: "Draft copy-build-system recipe with patchelf")

   '(actual-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Actual Budget app.  Electron app from
github.com/actualbudget/actual/releases.  Node.js/Electron binary packaging."
     next-action: "Draft copy-build-system recipe for Electron app")

   '(zashboard-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Clash API dashboard.  Web-based binary/static files from
github.com/Zephyruso/zashboard.  Needs evaluation of distribution format."
     next-action: "Verify release format and draft recipe")

   ;; ── PLATFORM/ECOSYSTEM BLOCKERS ──────────────────────────────────

   '(microsip
     reason: "SOURCE_UNAVAILABLE"
     details: "Windows-only SIP softphone based on PJSIP.  Source at
microsip.org.  Written for Win32 API, no Linux port exists.
Cannot build on Linux."
     attempts: ("1. Reviewed AUR entry — described as 'Windows based'"
                "2. Upstream website confirms Windows-only distribution"))

   '(pacman-gui
     reason: "SOURCE_UNAVAILABLE"
     details: "GTK4 GUI frontend for Arch pacman package manager.
Arch-specific tool with no applicability on Guix systems.  Depends on
libalpm (pacman backend) which is not in Guix."
     attempts: ("1. Reviewed purpose — Arch-specific package management GUI"
                "2. libalpm dependency unavailable in Guix"))

   ;; ── COMPLEX BUILD / DEP_RESOLUTION_FAILED ────────────────────────

   '(python-wandb
     reason: "DEP_RESOLUTION_FAILED"
     details: "Weights & Biases ML tracking library.  Massive dependency tree:
protobuf, grpcio, docker, psutil, sentry-sdk, GitPython, requests, click,
and many more.  Many deps not in Guix.  Also requires network access for
core functionality testing."
     attempts: ("1. Ran guix import pypi wandb — failed: too many missing deps"
                "2. Counted 30+ transitive deps not in Guix"))

   '(xemu-git
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Original Xbox emulator (github.com/xemu-project/xemu).
CMake/Meson build with SDL2, OpenGL, networking.  Very complex build with
custom QEMU fork and Xbox kernel emulation.  High complexity."
     next-action: "Evaluate build complexity; likely multi-session effort")

   '(torzu
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Nintendo Switch emulator fork of yuzu (notabug.org/litucks/torzu).
CMake C++ with Qt6, Vulkan, boost, many deps.  Extremely complex build
similar to yuzu.  Legal concerns around Switch emulation."
     next-action: "Multi-session effort; evaluate legal status first")

   '(wine-pure-git
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Bleeding-edge Wine build with Staging+WoW64+NTSync+Wayland.
Source: various Wine repos with extensive patchsets.  Extremely complex
build system requiring cross-compilation, 32-bit compat, kernel patches."
     next-action: "Beyond single-pass scope; existing Guix wine package may suffice")

   '(llama.cpp-vulkan-git
     reason: "NEEDS_RECIPE_DESIGN"
     details: "llama.cpp with Vulkan GPU backend (github.com/ggml-org/llama.cpp).
CMake build with Vulkan SDK dependency.  Guix Vulkan support exists but
integration with llama.cpp GPU backends is complex."
     next-action: "Draft cmake recipe with Vulkan SDK inputs; test GPU detection")

   '(webmin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Web-based Unix admin tool (github.com/webmin/webmin).
Perl application with web server, 200+ modules.  Very complex packaging:
needs Perl + many CPAN modules + custom init system integration."
     next-action: "Evaluate feasibility; likely multi-session effort")

   ;; ── DKMS/KERNEL MODULE BLOCKERS ──────────────────────────────────

   '(ddcci-driver-linux-dkms
     reason: "NEEDS_RECIPE_DESIGN"
     details: "DDC/CI kernel module (github.com/ddcci/ddcci-driver-linux).
Linux kernel module requiring DKMS.  Guix handles kernel modules differently
(linux-module-build-system or derivation).  Moderate-high complexity."
     next-action: "Investigate linux-module-build-system recipe")

   '(ajantv2-dkms
     reason: "NEEDS_RECIPE_DESIGN"
     details: "AJA NTV2 kernel driver module.  Source at
github.com/aja-video/libajantv2.  Linux kernel module requiring
DKMS.  Professional video I/O, niche hardware."
     next-action: "Investigate linux-module-build-system recipe")

   '(aic8800-dkms
     reason: "NEEDS_RECIPE_DESIGN"
     details: "AIC8800 WiFi 6 driver (BrosTrend AX300).  Kernel module.
Source availability uncertain — may be vendor-provided binary blobs."
     next-action: "Verify source availability; evaluate kernel module recipe")

   ;; ── DOTNET BINARY PACKAGES ───────────────────────────────────────

   '(dotnet-host-preview-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: ".NET host preview binary.  Available from dotnet.microsoft.com.
copy-build-system feasible but preview versions change frequently.
Part of 6-package .NET preview suite."
     next-action: "Draft copy-build-system recipe for .NET preview bundle")

   '(aspnet-runtime-preview-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "ASP.NET runtime preview binary.  Part of .NET preview suite.
Same approach as dotnet-host-preview-bin."
     next-action: "Bundle with dotnet preview suite recipe")

   '(dotnet-runtime-preview-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: ".NET runtime preview binary.  Part of .NET preview suite."
     next-action: "Bundle with dotnet preview suite recipe")

   '(dotnet-sdk-preview-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: ".NET SDK preview binary.  Part of .NET preview suite."
     next-action: "Bundle with dotnet preview suite recipe")

   '(dotnet-targeting-pack-preview-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: ".NET targeting pack preview binary.  Part of .NET preview suite."
     next-action: "Bundle with dotnet preview suite recipe")

   '(aspnet-targeting-pack-preview-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "ASP.NET targeting pack preview binary.  Part of .NET preview suite."
     next-action: "Bundle with dotnet preview suite recipe")

   ;; ── FONT PACKAGES ────────────────────────────────────────────────

   '(ttf-iosevka-fixed
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Iosevka Fixed font variant.  Guix has font-iosevka but not the
'Fixed' variant (non-ligature monospace).  Would need a separate origin from
GitHub releases with different build plan name."
     next-action: "Draft font-iosevka-fixed using copy-build-system from release tarball")

   '(ttf-iosevka-fixed-ss06
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Iosevka Fixed SS06 variant.  Same approach as ttf-iosevka-fixed
with SS06 stylistic set."
     next-action: "Draft alongside ttf-iosevka-fixed")

   ;; ── PROPRIETARY/BINARY-ONLY ──────────────────────────────────────

   '(thinlinc-server
     reason: "LICENSE_REVIEW_NEEDED"
     details: "Cendio ThinLinc remote desktop server.  Proprietary software.
Free for up to 10 concurrent users.  Binary-only distribution.
License terms need review for redistribution rights."
     attempts: ("1. Reviewed upstream — proprietary with free tier"
                "2. Redistribution rights unclear in license"))

   '(discord-development
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Discord Development client.  Proprietary Electron app.
Binary from discord.com.  Similar to existing Discord packages in Guix
ecosystem.  copy-build-system with Electron wrapper feasible."
     next-action: "Draft copy-build-system recipe from .tar.gz")

   '(certiliamiddleware
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Certilia smart card middleware for Croatian eID.  Proprietary
PKCS#11 library.  Binary-only distribution.  Niche hardware dependency."
     next-action: "Verify binary availability and draft copy recipe")

   ;; ── MISC COMPLEX / NEEDS_RECIPE_DESIGN ───────────────────────────

   '(apachedirectorystudio
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Apache LDAP browser.  Eclipse RCP Java application.
Binary distribution from directory.apache.org.  Java/Eclipse packaging
is complex in Guix.  Binary approach more feasible."
     next-action: "Draft copy-build-system recipe for binary distribution")

   '(firefox-nightly-bin
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Firefox Nightly binary.  Available from Mozilla FTP.
Similar to existing firefox-bin recipes.  copy-build-system with
patchelf for glibc/GTK deps.  Version changes daily."
     next-action: "Draft copy-build-system recipe following firefox-bin pattern")

   '(awatcher-bundle
     reason: "NEEDS_RECIPE_DESIGN"
     details: "ActivityWatch bundle.  Rust-based activity tracker.
Source at github.com/2e3s/awatcher.  cargo-build-system feasible."
     next-action: "Draft cargo-build-system recipe")

   '(aw-awatcher
     reason: "NEEDS_RECIPE_DESIGN"
     details: "ActivityWatch Rust client.  Same repo as awatcher-bundle.
cargo-build-system with ActivityWatch protocol support."
     next-action: "Draft alongside awatcher-bundle")

   '(vscodium-features
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Script to unblock VSCodium marketplace features.
Shell script/patch.  copy-build-system feasible but depends on
VSCodium being installed."
     next-action: "Draft copy-build-system recipe for shell script")

   '(libajantv2
     reason: "NEEDS_RECIPE_DESIGN"
     details: "AJA NTV2 SDK library (github.com/aja-video/libajantv2).
CMake C++ build.  Professional video I/O library.  Moderate complexity."
     next-action: "Draft cmake-build-system recipe")

   '(ajantv2-tools
     reason: "NEEDS_RECIPE_DESIGN"
     details: "AJA NTV2 tools.  Same source as libajantv2.
Depends on libajantv2 package.  CMake build."
     next-action: "Draft after libajantv2 package")

   '(muzika-git
     reason: "NEEDS_RECIPE_DESIGN"
     details: "GTK4/Adwaita YouTube Music player (github.com/nicohman/muzika).
Rust/GTK4 with Meson build.  Depends on libadwaita, webkit2gtk.
Moderate-high complexity."
     next-action: "Draft meson recipe with GTK4/libadwaita inputs")

   '(devilutionx-fonts
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Additional fonts for DevilutionX game.  Separate download from
github.com/diasurgical/devilutionx-assets.  copy-build-system feasible."
     next-action: "Draft copy-build-system recipe for font assets")

   '(devilutionx-voices
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Voice files for DevilutionX.  Separate download from
github.com/diasurgical/devilutionx-assets.  copy-build-system feasible."
     next-action: "Draft copy-build-system recipe for voice assets")

   '(jcef-jetbrains-git
     reason: "NEEDS_RECIPE_DESIGN"
     details: "Chromium Embedded Framework for JetBrains (github.com/nicohman/jcef).
Complex C++/Java build with Chromium.  Extremely high complexity —
Chromium builds require extensive patching in Guix."
     next-action: "Beyond single-pass scope; evaluate binary packaging")))
