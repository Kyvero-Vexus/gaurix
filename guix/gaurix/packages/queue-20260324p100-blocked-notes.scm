;;; Blocked notes for queue-20260324p100 queue drain (2026-03-24).
;;; 72 entries blocked — primary reason codes documented per-entry.
(define-module (gaurix packages queue-20260324p100-blocked-notes)
  #:export (queue-20260324p100-blocked-notes))

(define queue-20260324p100-blocked-notes
  (list

  ;; ── AUR packages with no Guix upstream equivalent (NEEDS_RECIPE_DESIGN) ───

  '(equicord-openasar NEEDS_RECIPE_DESIGN
    "Electron/Discord-fork + OpenAsar patcher; AUR PKGBUILD fetched (pnpm/nvm build); complex build requiring nvm/asar toolchain"
    "Source: https://equicord.org/; git-based build from equicord + openasar"
    "Next: draft electron-binary or custom pnpm build recipe; assess bundled-electron policy")

  '(pacman-command-utils NEEDS_RECIPE_DESIGN
    "Rust CLI utility for pacman command UX; v0.1.0 at https://github.com/crypticverse/pacman-command-utils"
    "cargo-build-system recipe; depends on pacman (Arch-specific dependency; adjust for Guix)"
    "Next: fetch source tarball, compute sha256, draft cargo recipe with pacman dep replaced by guix package-manager shim")

  '(empiriqa-bin NEEDS_RECIPE_DESIGN
    "Binary-only; v0.1.0 from https://github.com/<_pkgauthor>/empiriqa; glibc+gcc-libs deps"
    "Needs binary wrapper recipe; fetch Linux x86_64 release binary, compute hash"
    "Next: fetch binary from GitHub releases, compute sha256, draft trivial binary recipe")

  '(objdiff NEEDS_RECIPE_DESIGN
    "Rust GUI decompilation diff tool v3.7.1; cargo recipe needed; two binaries (objdiff + objdiff-cli)"
    "Source: https://github.com/encounter/objdiff/archive/refs/tags/v3.7.1.tar.gz; b2sum documented in PKGBUILD"
    "Next: pin v3.7.1, compute sha256, draft cargo-build-system recipe exporting both binaries")

  '(tabularis-bin NEEDS_RECIPE_DESIGN
    "Tauri-based spreadsheet/DB UI binary v0.9.10; .deb source from https://github.com/debba/tabularis releases"
    "Needs binary-with-extracted-deb recipe; deps: webkit2gtk-4.1 gtk3 libappindicator-gtk3 openssl"
    "Next: fetch .deb, extract, draft binary recipe with patchelf for interpreter")

  '(tuitube-bin NEEDS_RECIPE_DESIGN
    "TUI YouTube client binary v2026.01.10; glibc dep; from https://github.com/<_pkgauthor>/tuitube"
    "Binary recipe needed; fetch Linux release binary, compute hash"
    "Next: fetch binary from GitHub releases, compute sha256, draft binary recipe")

  '(decomp-toolkit-bin NEEDS_RECIPE_DESIGN
    "Decompilation project toolkit binary v1.8.0 from https://github.com/encounter/decomp-toolkit"
    "Binary recipe; Apache-2.0 OR MIT license"
    "Next: fetch x86_64 Linux binary release, compute sha256, draft binary wrapper recipe")

  '(libsurvive-git NEEDS_RECIPE_DESIGN
    "HTC Vive/Index VR tracking library from git; cmake+ninja; deps: hidapi xr-hardware libpcap zlib libusb eigen"
    "Source: https://github.com/collabora/libsurvive.git; cmake-build-system recipe"
    "Next: pin commit hash, draft cmake recipe using (guix build cmake-build-system); assess eigen/hidapi as guix inputs")

  '(terminal-fireworks NEEDS_RECIPE_DESIGN
    "Python pyproject terminal animation v0.1.0; git tag v0.1.0 at https://github.com/chloem3ow/terminal-fireworks"
    "python-build-system recipe; sha256 in PKGBUILD: 62600d9b40cc43803d48086a1cad09348f6236fd8a94424734f01d96f3e33d02"
    "Next: fetch source tarball from GitHub tag, verify hash, draft python-build-system recipe")

  '(terx-bin NEEDS_RECIPE_DESIGN
    "Proprietary binary terminal emulator v0.2.22 from https://github.com/OutrageLabs/terX; LicenseRef-custom"
    "Source: pkg.tar.zst binary; needs extract+wrap recipe; LICENSE_REVIEW_NEEDED for redistribution terms"
    "Next: fetch .pkg.tar.zst, assess terms, compute hash, draft binary extraction recipe")

  '(manga-tui NEEDS_RECIPE_DESIGN
    "Rust TUI manga reader v0.10.0; cargo-build-system recipe; deps: gcc-libs openssl"
    "Source: https://github.com/josueBarretogit/manga-tui/archive/v0.10.0.tar.gz; sha512 documented in PKGBUILD"
    "Next: compute sha256 from source tarball, draft cargo-build-system recipe")

  '(ollama-git NEEDS_RECIPE_DESIGN
    "Ollama AI model server from git v0.15.1.rc0; Go+cmake build; deps: gcc-libs glibc"
    "Source: https://github.com/ollama/ollama; go-build-system or cmake needed"
    "Next: pin a stable tag, draft go/cmake recipe; assess bundled ggml/llama.cpp dep handling")

  '(ollama-rocm-git NEEDS_RECIPE_DESIGN
    "Ollama with ROCm GPU acceleration from git; same upstream as ollama-git; adds rocm dep"
    "Requires ROCm toolchain (hip/rocm-opencl); needs go+cmake recipe variant"
    "Next: draft after ollama-git base recipe; add rocm-opencl-runtime to inputs")

  '(ollama-cuda-git NEEDS_RECIPE_DESIGN
    "Ollama with CUDA GPU acceleration from git; cmake+ninja+go+cuda toolchain"
    "Requires CUDA; similar to llama-cpp-cuda recipe in gaurix"
    "Next: draft after ollama-git base; use cuda from (gnu packages cuda) or proprietary cuda inputs")

  '(ollama-vulkan-git SOURCE_UNAVAILABLE
    "AUR ollama-vulkan-git: no PKGBUILD found in AUR git (cp error on fetch)"
    "Source repository not accessible at evaluation time"
    "Next: retry fetch; if consistently absent, package may have been removed from AUR")

  '(ollama-docs-git SOURCE_UNAVAILABLE
    "AUR ollama-docs-git: no PKGBUILD found in AUR git (cp error on fetch)"
    "Source repository not accessible at evaluation time"
    "Next: retry fetch; may be a docs-only sub-package merged into ollama-git main")

  '(profile-sync-daemon-zen NEEDS_RECIPE_DESIGN
    "Zen browser profile-sync-daemon config fragment v1.0; shell files only"
    "Depends on profile-sync-daemon + zen-browser; trivial copy-build-system recipe"
    "Next: draft trivial recipe copying browser config file to /usr/share/psd/browsers/")

  '(responsively NEEDS_RECIPE_DESIGN
    "Electron-based responsive web dev tool; fetched PKGBUILD; Electron binary app"
    "Source: GitHub releases at https://github.com/responsively-org/responsively-app"
    "Next: fetch Linux AppImage or .deb binary, compute hash, draft binary wrapper recipe")

  '(zen-c NEEDS_RECIPE_DESIGN
    "Zen-C language compiler v0.4.4; writes like high-level, compiles to C"
    "Source: https://github.com/zenc-lang/zenc; likely cargo or cmake build"
    "Next: inspect build system from fetched PKGBUILD, pin release, draft appropriate recipe")

  '(python-ftputil NEEDS_RECIPE_DESIGN
    "Python FTP utility library v5.1.0; BSD license; PyPI source available"
    "Source: https://files.pythonhosted.org/packages/source/f/ftputil/ftputil-5.1.0.tar.gz; sha256: e9e62d3fd307ef9c52e43b33fd92759fc94c04d8b5178f85f641b183906d4353"
    "Next: draft python-build-system recipe with verified PyPI hash; no Guix python-ftputil found")

  '(cupola-git NEEDS_RECIPE_DESIGN
    "COSMIC desktop image viewer from git; Rust project at https://codeberg.org/bhh32/cupola"
    "cargo-build-system recipe; depends on COSMIC desktop stack (libcosmic)"
    "Next: pin commit, draft cargo recipe; assess libcosmic availability in Guix")

  '(python-pymatgen NEEDS_RECIPE_DESIGN
    "Python materials genomics library; complex scientific Python package"
    "Many C extension deps (spglib, pybabel etc.); PyPI source available"
    "Next: assess dependency tree, draft python-build-system recipe with native C extensions")

  '(wps-office-365-edu NEEDS_RECIPE_DESIGN
    "WPS Office 365 Education Edition binary; proprietary; download requires account"
    "Binary-only distribution; potential redistribution restrictions"
    "Next: locate stable direct download URL, assess license terms, draft binary recipe if distributable")

  '(wps-office-365-edu-fonts SOURCE_UNAVAILABLE
    "AUR wps-office-365-edu-fonts: no PKGBUILD accessible (cp error on fetch)"
    "Font supplement package for wps-office-365-edu; AUR entry may be absent/removed"
    "Next: retry fetch; if absent, package was likely withdrawn from AUR")

  '(sddm-theme-elegant-archlinux-git NEEDS_RECIPE_DESIGN
    "SDDM QML theme v1.2.1.r81 from git; depends sddm qt6-base qt6-declarative qt6-svg"
    "Source: https://github.com/sniper1720/elegant-sddm-archlinux-theme; copy-build-system recipe"
    "Next: draft trivial copy-build-system recipe; all .qml + assets to /usr/share/sddm/themes/")

  '(jellyfin-server-bin NEEDS_RECIPE_DESIGN
    "Jellyfin media server binary v10.11.6; .NET runtime dep; GPL2"
    "Binary .deb/archive distribution from https://repo.jellyfin.org"
    "Next: fetch Linux x86_64 binary, compute hash, draft dotnet binary recipe")

  '(litestream NEEDS_RECIPE_DESIGN
    "SQLite streaming replication Go tool v0.5.6; Apache license"
    "Source: https://github.com/benbjohnson/litestream/archive/v0.5.6.tar.gz; sha256 in PKGBUILD"
    "Next: draft go-build-system recipe; sha256: f9e035bbd53d3b304494b9725be66b2c66e3f90a104a83c6f143a354b5725f47")

  '(pseint-bin NEEDS_RECIPE_DESIGN
    "PSeInt pseudocode teaching tool binary v20250314; GPL2; Qt-based"
    "Binary from http://pseint.sourceforge.net; Linux binary download available"
    "Next: fetch Linux binary, compute hash, draft binary wrapper recipe")

  '(nautilus-code NEEDS_RECIPE_DESIGN
    "Nautilus extension to open folders in code editors v0.5; AGPL3; meson build"
    "Source: https://github.com/realmazharhussain/nautilus-code; meson-build-system"
    "Next: draft meson-build-system recipe; dep: nautilus-python gnome-pkg-tools")

  '(sparta-plugins-bin NEEDS_RECIPE_DESIGN
    "SPARTA spatial audio VST/LV2/AAX plugin suite binary; GPL3; zip binary release"
    "Source: https://github.com/leomccormack/SPARTA/releases; architecture-specific binary"
    "Next: fetch x86_64 Linux release zip, compute hash, draft binary recipe installing to /usr/lib/lv2 etc.")

  '(nosy-bin NEEDS_RECIPE_DESIGN
    "CLI content summarizer binary v0.1.0; MIT; from https://github.com/<_pkgauthor>/nosy"
    "Binary release; glibc dep; needs binary wrapper recipe"
    "Next: locate GitHub release URL, fetch binary, compute hash, draft recipe")

  '(cosmocc-bin NEEDS_RECIPE_DESIGN
    "Cosmopolitan toolchain binary v4.0.2; ISC license; build-once run-anywhere"
    "Source: https://justine.lol/cosmopolitan/; binary tarball"
    "Next: fetch cosmocc binary tarball, compute hash, draft binary recipe")

  '(deadlock-server-picker NEEDS_RECIPE_DESIGN
    "Deadlock game server picker v1.5.2; GPL3; Python+iptables tool"
    "Source: https://github.com/shibne/DeadlockServerPicker-linux; python-build-system"
    "Next: draft python-build-system recipe; game-specific tool, assess if iptables dep handled at runtime")

  '(otf-geist NEEDS_RECIPE_DESIGN
    "Geist OTF font family from Vercel; font package; GitHub releases"
    "Source: https://github.com/vercel/geist-font/releases; OFL license"
    "Next: fetch font zip release, compute hash, draft font recipe")

  '(ttf-geist NEEDS_RECIPE_DESIGN
    "Geist TTF font family from Vercel; font package"
    "Same upstream as otf-geist; different font format"
    "Next: draft alongside otf-geist recipe using same release archive")

  '(ttf-geist-variable NEEDS_RECIPE_DESIGN
    "Geist Variable TTF font from Vercel; variable font format"
    "Same upstream release as otf-geist"
    "Next: include as output of geist font recipe")

  '(otf-geist-mono NEEDS_RECIPE_DESIGN
    "Geist Mono OTF monospace font from Vercel"
    "Same upstream release; monospace variant"
    "Next: include as output of geist font recipe")

  '(ttf-geist-mono NEEDS_RECIPE_DESIGN
    "Geist Mono TTF monospace font from Vercel"
    "Same upstream release; monospace TTF variant"
    "Next: include as output of geist font recipe")

  '(ttf-geist-mono-variable NEEDS_RECIPE_DESIGN
    "Geist Mono Variable TTF from Vercel"
    "Same upstream release; monospace variable font"
    "Next: include as output of geist font recipe")

  '(koofr-desktop-bin NEEDS_RECIPE_DESIGN
    "Koofr cloud storage desktop client binary v<upstream>; proprietary"
    "Binary Electron app from https://koofr.eu; Linux .deb or AppImage"
    "Next: locate stable Linux binary download URL, compute hash, draft binary recipe")

  '(brokefetch-git NEEDS_RECIPE_DESIGN
    "Sysinfo fetcher from git; MIT; Bash script-based"
    "Source: https://github.com/Szerwigi1410/brokefetch; copy-build-system recipe"
    "Next: draft trivial copy-build-system recipe for Bash script")

  '(lunar-client NEEDS_RECIPE_DESIGN
    "Minecraft launcher binary; proprietary; AppImage or .deb distribution"
    "Source: https://lunarclient.com; terms may restrict redistribution URL"
    "Next: assess license redistribution terms, locate stable download, draft binary recipe")

  '(magic_enum NEEDS_RECIPE_DESIGN
    "AUR name magic_enum (underscore variant) v0.9.7; Guix has magic-enum 0.9.6 (hyphen)"
    "Header-only cmake install; Source: https://github.com/Neargye/magic_enum/archive/v0.9.7.tar.gz"
    "Next: draft as an alias or cmake-build-system recipe bump over Guix magic-enum 0.9.6")

  '(amdvlk NEEDS_RECIPE_DESIGN
    "AMD open-source Vulkan driver binary; proprietary binary from AMD"
    "Source: https://github.com/GPUOpen-Drivers/AMDVLK/releases; large binary"
    "Next: fetch x86_64 Linux binary release, compute hash, draft binary recipe for /usr/lib/vulkan/icd.d/")

  '(noctalia-shell-git NEEDS_RECIPE_DESIGN
    "Wayland desktop shell v2.3.1.r16 using Quickshell; MIT"
    "Source: https://github.com/noctalia-dev/noctalia-shell; requires quickshell + Qt"
    "Next: assess quickshell availability in Guix, draft cmake/qmake recipe")

  '(saleae-logic2 NEEDS_RECIPE_DESIGN
    "Saleae Logic 2 logic analyzer binary; proprietary; AppImage-based"
    "Source: https://www.saleae.com/downloads/; registration may be required for direct URL"
    "Next: locate stable direct AppImage URL, compute hash, draft binary AppImage wrapper recipe")

  '(darkly NEEDS_RECIPE_DESIGN
    "Qt5/KDE theme fork of Lightly v0.5.36; GPL2; cmake build"
    "Source: https://github.com/Bali10050/darkly; cmake-build-system with KDE deps"
    "Next: draft cmake recipe; deps: extra-cmake-modules kf5-kdecoration qt5-base")

  '(timemap-bin NEEDS_RECIPE_DESIGN
    "Binary utility for timeline mapping; MIT; from AUR"
    "Binary release; needs fetch and wrap recipe"
    "Next: fetch PKGBUILD details, locate binary URL, compute hash, draft recipe")

  '(mangcli-bin NEEDS_RECIPE_DESIGN
    "Manga CLI binary downloader; MIT; from AUR"
    "Binary distribution; needs wrapper recipe"
    "Next: fetch PKGBUILD, locate binary URL, compute hash, draft recipe")

  '(tgpt-git NEEDS_RECIPE_DESIGN
    "ChatGPT terminal client from git v1.6.0.r1; GPL3; Go binary"
    "Source: https://github.com/aandrew-me/tgpt; go-build-system recipe"
    "Next: pin release tag, draft go-build-system recipe")

  '(try-rs-bin NEEDS_RECIPE_DESIGN
    "CLI tool for temporary project management binary v1.6.3; MIT"
    "Source: https://github.com/tassiovirginio/try-rs; binary release"
    "Next: fetch Linux binary release, compute hash, draft binary wrapper recipe")

  '(python-xlsx2csv NEEDS_RECIPE_DESIGN
    "Python XLSX to CSV converter v0.8.6; MIT; GitHub + setuptools_scm"
    "Source: https://github.com/dilshod/xlsx2csv/archive/0.8.6.tar.gz; sha512 in PKGBUILD"
    "Next: compute sha256, draft python-build-system recipe with SETUPTOOLS_SCM_PRETEND_VERSION")

  '(linuxcnc NEEDS_RECIPE_DESIGN
    "LinuxCNC CNC machine controller; complex build with RTAI/Preempt-RT kernel"
    "Requires real-time kernel patches; highly environment-specific build"
    "Next: assess RT kernel availability, draft cmake/make recipe; likely needs DKMS approach")

  '(classisland NEEDS_RECIPE_DESIGN
    "ClassIsland class schedule app; .NET/WPF app - Linux support unclear"
    "Primarily a Windows/WPF application; Linux binary may not exist"
    "Next: verify Linux release availability; if absent, mark SOURCE_UNAVAILABLE")

  '(gopac-git NEEDS_RECIPE_DESIGN
    "Go PAC (proxy auto-config) tool from git; go-build-system recipe"
    "Source: GitHub go project; needs go-build-system recipe"
    "Next: fetch PKGBUILD for exact URL, pin version, draft go recipe")

  '(pacboost NEEDS_RECIPE_DESIGN
    "Pacman package manager performance booster; Arch-specific wrapper"
    "Depends on pacman (Arch-only); limited utility outside Arch context"
    "Next: assess if meaningful in Guix context; draft with pacman dep replaced by placeholder")

  '(waves-bin NEEDS_RECIPE_DESIGN
    "Waves Audio plugins binary; proprietary commercial audio plugins"
    "Binary installer; commercial license; source URL requires account"
    "Next: assess if direct download URL is stable; draft binary recipe if terms allow")

  '(python-withoutbg NEEDS_RECIPE_DESIGN
    "Python background removal library; PyPI package"
    "Source: https://pypi.org/project/withoutbg/; python-build-system recipe"
    "Next: fetch from PyPI, compute hash, draft python-build-system recipe")

  '(arduino NEEDS_RECIPE_DESIGN
    "Arduino IDE; complex Java/Electron build; AUR provides IDE binary"
    "No Guix arduino-ide (there is arduino-cli); needs binary Java recipe"
    "Next: fetch Arduino IDE Linux AppImage, compute hash, draft binary wrapper recipe")

  '(rpcs3-git NEEDS_RECIPE_DESIGN
    "RPCS3 PS3 emulator from git; complex cmake build with LLVM, Vulkan, Qt6"
    "Source: https://github.com/RPCS3/rpcs3; heavy deps including llvm clang vulkan-headers"
    "Next: draft cmake-build-system recipe with explicit dep list; build time will be long")

  '(voxtype-bin NEEDS_RECIPE_DESIGN
    "VoxType typing app binary; MIT; binary distribution"
    "Source: GitHub releases; binary wrapper recipe needed"
    "Next: fetch binary, compute hash, draft wrapper recipe")

  '(cosmic-session-git NEEDS_RECIPE_DESIGN
    "COSMIC desktop session from git; Rust+COSMIC stack; complex build"
    "Source: https://github.com/pop-os/cosmic-session; multiple rust workspace crates"
    "Next: draft cargo workspace recipe; assess cosmic-comp/cosmic-panel deps in Guix")

  '(alt-sendme-bin NEEDS_RECIPE_DESIGN
    "Sendme alternative file transfer binary; MIT"
    "Binary distribution; needs wrapper recipe"
    "Next: fetch PKGBUILD details, locate binary, compute hash, draft recipe")

  '(ps3dec-git NEEDS_RECIPE_DESIGN
    "PS3 disc image decryptor from git; WTFPL; cmake build with mbedtls"
    "Source: https://github.com/al3xtjames/PS3Dec; cmake-build-system recipe"
    "Next: draft cmake recipe; deps: mbedtls libgcc libgomp")

  '(outfieldr NEEDS_RECIPE_DESIGN
    "TLDR client in Zig v1.1.1; MIT; zig build system"
    "Source: https://gitlab.com/ve-nt/outfieldr; requires zig compiler"
    "Next: draft zig-build-system recipe using (guix build-system zig) if available, else cmake wrapper")

  '(xmousepasteblock-git NEEDS_RECIPE_DESIGN
    "Disable X11 middle-click paste from git; GPL2; C with Xlib"
    "Source: https://github.com/milaq/XMousePasteBlock; make-build-system recipe"
    "Next: draft make-build-system recipe; deps: libx11 libxi libxtst")

  '(utools-bin NEEDS_RECIPE_DESIGN
    "uTools productivity platform binary v7.5.1; LicenseRef-custom (proprietary Chinese app)"
    "Source: https://u.tools; Electron binary; LICENSE_REVIEW_NEEDED for redistribution"
    "Next: assess license terms, locate stable download URL, draft binary recipe if allowed")

  '(prowlarr NEEDS_RECIPE_DESIGN
    "Prowlarr indexer manager binary; GPL3; .NET binary"
    "Source: https://github.com/Prowlarr/Prowlarr/releases; dotnet binary"
    "Next: fetch Linux binary, compute hash, draft dotnet-binary recipe")

  '(arad-fonts NEEDS_RECIPE_DESIGN
    "Arad multilingual Arabic/Farsi/Kurdish font v2.3.0; OFL"
    "Source: https://github.com/MohamadDarvishi/Arad/releases/download/2.3.0/arad_2.3.0.for-terminal.zip"
    "Next: fetch zip, compute hash, draft font recipe copying TTF/OTF to /usr/share/fonts/")

  '(winscp NEEDS_RECIPE_DESIGN
    "WinSCP SFTP/FTP client v6.5.5 for Wine; GPL2; Windows binary + Wine wrapper"
    "Source: https://winscp.net/; Windows .exe wrapped in Wine"
    "Next: fetch WinSCP installer, compute hash, draft wine-wrapped binary recipe")

  '(nvidia-beta-dkms NEEDS_RECIPE_DESIGN
    "NVIDIA beta driver DKMS module; proprietary; version varies by NVIDIA beta channel"
    "Requires DKMS + NVIDIA proprietary source package; version pinning is fragile"
    "Next: identify current beta version, assess kernel/DKMS recipe pattern, draft module recipe")

  '(cli53 NEEDS_RECIPE_DESIGN
    "Amazon Route 53 CLI tool v0.8.25; MIT; Go binary"
    "Source: https://github.com/barnybug/cli53; go-build-system recipe"
    "Next: pin v0.8.25, compute sha256 for source tarball, draft go recipe")

  '(openscad-bosl2-git NEEDS_RECIPE_DESIGN
    "BOSL2 OpenSCAD library from git; BSD-2-Clause; library files only (no build)"
    "Source: https://github.com/revarbat/BOSL2.git; copy-build-system recipe"
    "Next: draft trivial copy-build-system recipe installing .scad files to openscad library path")

  '(apple_cursor NEEDS_RECIPE_DESIGN
    "macOS-style cursor theme v2.0.1; GPL3; cursor theme files"
    "Source: https://github.com/ful1e5/apple_cursor; xcursorgen or prebuilt assets"
    "Next: fetch release archive, compute hash, draft copy-build-system cursor theme recipe")

  '(keymapper NEEDS_RECIPE_DESIGN
    "Cross-platform key remapper v5.4.1; GPL3; cmake build"
    "Source: https://github.com/houmain/keymapper; cmake-build-system recipe"
    "Next: draft cmake recipe; deps: dbus libappindicator-gtk3 libusb libx11 libxkbcommon")

  '(selectdefaultapplication-git NEEDS_RECIPE_DESIGN
    "Simple default application selector from git; GPL; Qt5 app"
    "Source: https://github.com/sandsmark/selectdefaultapplication; cmake-build-system"
    "Next: draft cmake recipe; deps: qt5-base hicolor-icon-theme")

  '(ccusage NEEDS_RECIPE_DESIGN
    "Claude Code token usage CLI analyzer v18.0.10; MIT; Node.js/npm tool"
    "Source: https://github.com/ryoppippi/ccusage; node-build-system or npm wrapper recipe"
    "Next: fetch npm tarball, compute hash, draft node-build-system recipe")

  '(flexo NEEDS_RECIPE_DESIGN
    "Central pacman cache server v1.6.10; MIT; Rust cargo project"
    "Source: https://github.com/nroi/flexo; cargo-build-system recipe; pacman/Arch-focused"
    "Next: draft cargo recipe; note pacman dep; assess portability to Guix context")

  '(karing-bin NEEDS_RECIPE_DESIGN
    "Karing VPN proxy client binary; proprietary; AppImage distribution"
    "Source: https://github.com/KaringX/karing/releases; binary recipe needed"
    "Next: fetch Linux AppImage, compute hash, draft binary wrapper recipe")

  '(bifrost-bin NEEDS_RECIPE_DESIGN
    "Bifrost binary tool; binary release from AUR"
    "Needs PKGBUILD analysis for exact upstream source URL and version"
    "Next: review fetched PKGBUILD for URL, compute hash, draft binary recipe")

  '(qt5-webkit NEEDS_RECIPE_DESIGN
    "Qt5 WebKit web rendering engine; complex cmake build with Qt5"
    "Source: https://github.com/qtwebkit/qtwebkit; large C++ cmake project"
    "Next: draft cmake-build-system recipe with qt5-base qt5-webengine dep tree")

  '(koboldcpp NEEDS_RECIPE_DESIGN
    "KoboldCpp AI text generation v1.110; AGPL3; complex cmake+cuda/vulkan build"
    "Source: https://github.com/LostRuins/koboldcpp; requires llama.cpp submodule"
    "Next: draft cmake recipe with optional CUDA/Vulkan; assess llama.cpp Guix package reuse")

  '(toipe NEEDS_RECIPE_DESIGN
    "Crab-flavored terminal typing test v0.4.1; MIT; Rust cargo project"
    "Source: https://github.com/Samyak2/toipe; cargo-build-system recipe"
    "Next: pin v0.4.1, compute sha256 from release tarball, draft cargo recipe")

  '(odinls-bin NEEDS_RECIPE_DESIGN
    "Odin language server binary; binary distribution"
    "Source: GitHub releases for odinls; needs binary wrapper recipe"
    "Next: fetch binary, compute hash, draft wrapper recipe")

  '(exodus NEEDS_RECIPE_DESIGN
    "Exodus crypto wallet binary; proprietary; AppImage/Electron app"
    "Source: https://www.exodus.com/download/; terms may restrict redistribution"
    "Next: assess license terms; if permitted, fetch binary, compute hash, draft recipe")

  '(sshpilot NEEDS_RECIPE_DESIGN
    "SSH connection manager v4.7.9; GPL3; Python+Qt app"
    "Source: https://github.com/mfat/sshpilot; python-build-system recipe"
    "Next: draft python-build-system recipe; deps: python-qt or python-pyqt5")

  '(httpfs2-2gbplus NEEDS_RECIPE_DESIGN
    "FUSE HTTP filesystem patched for >2GB files v0.1.5; GPL; C FUSE project"
    "Note: Guix ships httpfs2 0.1.5 (same version); this is a patched variant needing separate recipe"
    "Next: assess if Guix httpfs2 already has the patch; if not, draft make recipe with patch application")

  '(vpkedit NEEDS_RECIPE_DESIGN
    "VPK pack file editor v5.0.0.4; MIT; cmake build with Qt6"
    "Source: https://github.com/craftablescience/VPKEdit; cmake-build-system recipe"
    "Next: draft cmake recipe; deps: qt6-base qt6-tools libarchive zlib")

  '(wl-gammarelay-rs NEEDS_RECIPE_DESIGN
    "Wayland display temperature/brightness DBus daemon v1.0.1; GPL3; Rust cargo"
    "Source: https://github.com/MaxVerevkin/wl-gammarelay-rs/archive/refs/tags/v1.0.1.tar.gz"
    "Next: compute sha256, draft cargo-build-system recipe; deps: wayland-client at runtime")

  '(ttf-lxgw-wenkai-mono-nerd NEEDS_RECIPE_DESIGN
    "LXGW WenKai Mono Nerd font v1.522; OFL; patched with Nerd Font glyphs"
    "Source: https://github.com/Yikai-Liao/LxgwWenKaiNerdFont/releases; font files"
    "Next: fetch release zip, compute hash, draft font recipe installing to /usr/share/fonts/")

  '(floorp NEEDS_RECIPE_DESIGN
    "Floorp Firefox-based browser v12.11.0; MPL-2.0; complex Firefox build"
    "Source: https://github.com/Floorp-Projects/Floorp; requires Mozilla build system"
    "Next: assess if binary build is available; if so, draft binary recipe; else draft Firefox-variant cmake recipe")

  '(lib32-amdvlk NEEDS_RECIPE_DESIGN
    "32-bit AMD Vulkan driver binary; depends on amdvlk recipe"
    "Same upstream as amdvlk; 32-bit variant"
    "Next: draft after amdvlk 64-bit recipe; use same release archive i686 variant")

  '(termframe-bin NEEDS_RECIPE_DESIGN
    "Terminal output SVG renderer binary v0.8.3; MIT"
    "Source: GitHub releases from <_pkgauthor>/<_pkgname>; binary wrapper recipe"
    "Next: fetch PKGBUILD details for exact URL, compute hash, draft binary recipe")

  '(casual-pre-loader-git NEEDS_RECIPE_DESIGN
    "Casual pre-loader utility from git; AUR package"
    "Needs PKGBUILD review for build system and upstream URL"
    "Next: review fetched PKGBUILD, assess build system, draft appropriate recipe")

  '(frpc-bin SOURCE_UNAVAILABLE
    "AUR frpc-bin: no PKGBUILD found (cp error on fetch)"
    "frp reverse proxy client binary; AUR entry may be absent"
    "Next: retry fetch; check if package was moved to frp or frpc in AUR")

  '(frps-bin SOURCE_UNAVAILABLE
    "AUR frps-bin: no PKGBUILD found (cp error on fetch)"
    "frp reverse proxy server binary; AUR entry may be absent"
    "Next: retry fetch; check if package was moved to frp or frps in AUR")

  '(monado-doc SOURCE_UNAVAILABLE
    "AUR monado-doc: no PKGBUILD found (cp error on fetch)"
    "Documentation package for Monado OpenXR runtime; AUR entry may be absent"
    "Next: retry fetch; Monado main package may include docs in one package now")

  '(spotify-1.1 NEEDS_RECIPE_DESIGN
    "Spotify client pinned to 1.1.x legacy version; proprietary binary"
    "Source: Spotify Linux repository; terms restrict redistribution"
    "Next: assess if legacy version is still available; draft binary recipe with Spotify APT URL")

  '(droidcam-obs-plugin NEEDS_RECIPE_DESIGN
    "DroidCam OBS virtual camera plugin; proprietary component; Linux binary"
    "Source: https://github.com/dev47apps/droidcam-obs; cmake build with OBS-studio deps"
    "Next: draft cmake recipe; deps: obs-studio libv4l libavcodec")

  ))
