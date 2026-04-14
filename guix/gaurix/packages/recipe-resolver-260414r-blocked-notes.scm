;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260414r
;;; 22 packages marked NEEDS_RECIPE_DESIGN_EXHAUSTED
;;;
;;; Packages with detailed blocking reasons:

;;; 1. lapctl (#7345, line 56240)
;;;    CARGO_DEPS_NEEDED: Rust CLI (github.com/S4NKALP/lapctl, MIT);
;;;    no binary releases for v0.3.2; needs cargo-inputs enumeration
;;;    (~30 crates + systemd-libs/dbus/wayland native deps).
;;;    A1: cargo-build-system — needs full crate vendoring;
;;;    A2: no pre-built binaries on GitHub releases;
;;;    A3: systemd-libs dependency may be incompatible with Guix Shepherd.

;;; 2. rmpc-auto-theme-git (#7416, line 56748)
;;;    NO_TAGGED_RELEASE + CARGO_DEPS_NEEDED: Rust project
;;;    (github.com/animegolem/RMPC-Auto-Theme, MIT);
;;;    no GitHub releases, only 22 git commits, very new project;
;;;    A1: cargo-build-system with git pin — no stable version;
;;;    A2: no binary releases; A3: project too immature for packaging.

;;; 3. pastelock (#7586, line 57945)
;;;    NO_LICENSE + NO_BUILD_SYSTEM: encrypted clipboard manager
;;;    (gitlab.com/E-Gamma-102/pastelock);
;;;    no standard license file (custom/unknown); no setup.py/pyproject.toml;
;;;    13 niche Python GUI deps (customtkinter, ctkmessagebox) not in Guix.
;;;    A1: license blocks Guix inclusion; A2: no proper build system;
;;;    A3: missing deps chain too deep.

;;; 4. wayvibes-git (#7605, line 58054)
;;;    NO_LICENSE: C++ keyboard sound tool
;;;    (github.com/sahaj-b/wayvibes);
;;;    repository has no LICENSE file — defaults to all-rights-reserved;
;;;    cannot be packaged in Guix without explicit free software license.
;;;    A1: no license — cannot distribute; A2: no tagged releases;
;;;    A3: upstream contacted (no response).

;;; 5. banyanapp (#8380, line 63632)
;;;    PROPRIETARY: SonicWall Banyan zero trust VPN client;
;;;    proprietary binary distributed as RPM from banyanops.com;
;;;    no source code available; commercial enterprise software.
;;;    A1: proprietary — not distributable; A2: no source code;
;;;    A3: requires service subscription.

;;; 6. aurdex (#7489, line 57318)
;;;    ARCH_SPECIFIC: AUR package browser TUI
;;;    (github.com/envolution/aurdex, Apache-2.0);
;;;    depends on pyalpm (Python bindings for libalpm/pacman);
;;;    fundamentally Arch Linux-specific, zero utility on Guix.
;;;    A1: requires libalpm (Arch package manager library);
;;;    A2: AUR browser irrelevant outside Arch; A3: skip.

;;; 7. connect-tunnel (#7497, line 57383)
;;;    PROPRIETARY: SonicWALL Connect Tunnel VPN client;
;;;    proprietary binary from software.sonicwall.com;
;;;    custom license agreement, no source code.
;;;    A1: proprietary — not distributable; A2: no source code;
;;;    A3: requires vendor license acceptance.

;;; 8. ytdownloader (#7460, line 57113)
;;;    MISSING_GUIX_DEPS: GTK3 YouTube downloader
;;;    (github.com/kanehekili/YoutubeDownloader, GPL-2.0/MIT);
;;;    depends on deno runtime which is not in Guix and is extremely
;;;    complex to package (V8 engine, Rust toolchain, etc.).
;;;    A1: deno not in Guix; A2: deno build requires V8+Rust;
;;;    A3: yt-dlp already available as alternative.

;;; 9. ytdownloader-gui (#7465, line 57147)
;;;    ELECTRON_APP: Electron-based video downloader GUI
;;;    (github.com/aandrew-me/ytDownloader, GPL-3.0);
;;;    massive npm dependency tree; Electron apps are not buildable
;;;    from source in Guix due to Chromium bundling constraints.
;;;    A1: Electron source build infeasible; A2: AppImage repack fragile;
;;;    A3: ytconverter/yt-dlp provide CLI alternative.

;;; 10. jacartauc (#7520, line 57545)
;;;     PROPRIETARY: JaCarta Russian smart card token management;
;;;     proprietary binary from aladdin-rd.ru; no source code;
;;;     vendor-specific hardware management tool.
;;;     A1: proprietary — not distributable; A2: no source code;
;;;     A3: hardware-vendor-specific.

;;; 11. lycheeslicer (#7538, line 57663)
;;;     PROPRIETARY: Lychee Slicer 3D printing software;
;;;     commercial Electron app from mango3d.io; proprietary license.
;;;     A1: proprietary — not distributable; A2: no source code;
;;;     A3: commercial subscription software.

;;; 12. pacmate (#7541, line 57680)
;;;     ARCH_SPECIFIC: interactive TUI wrapper for pacman
;;;     (gitlab.com/nathanchere/pacmate, Apache-2.0);
;;;     literally wraps the pacman package manager;
;;;     zero utility outside Arch Linux.
;;;     A1: depends on pacman binary; A2: Arch-only tool;
;;;     A3: Guix has its own package manager.

;;; 13. zenkit (#7417, line 56756)
;;;     PROPRIETARY: Zenkit project management desktop client;
;;;     proprietary Electron app from zenkit.com;
;;;     unknown/custom license, no source code.
;;;     A1: proprietary — not distributable; A2: no source code;
;;;     A3: commercial SaaS software.

;;; 14. omnetpp (#7334, line 56172)
;;;     NON_FREE_LICENSE: OMNeT++ network simulation framework;
;;;     Academic Public License restricts commercial use;
;;;     not a free software license per FSF/DFSG criteria;
;;;     download also requires registration.
;;;     A1: non-free license — incompatible with Guix;
;;;     A2: registration-gated download; A3: use ns-3 (free) instead.

;;; 15. shelly-bin (#7350, line 56271)
;;;     ARCH_SPECIFIC: graphical Arch Linux package manager;
;;;     C#/.NET wrapping pacman/ALPM; Arch-only tool.
;;;     A1: depends on pacman/ALPM; A2: .NET SDK not in Guix;
;;;     A3: zero utility outside Arch Linux.

;;; 16. systemd-cron-next-git (#7380, line 56468)
;;;     SYSTEMD_SPECIFIC: Rust crontab-to-systemd-timer converter;
;;;     fundamentally requires systemd (MIT license);
;;;     Guix uses GNU Shepherd, not systemd.
;;;     A1: requires systemd — incompatible with Guix;
;;;     A2: Guix uses mcron for cron jobs; A3: skip.

;;; 17. cnmplayer (#7339, line 56203)
;;;     CARGO_DEPS_NEEDED: Rust terminal music player
;;;     (github.com/professor-lee/CNMPlayer, AGPL-3.0);
;;;     cargo build with ~50 crate deps + chromaprint/fftw/cava native;
;;;     pre-built binary available but has complex runtime deps.
;;;     A1: cargo-build-system needs 50+ crates; A2: binary repack
;;;     needs patchelf + complex glibc/lib chain; A3: cava dep may not
;;;     be in Guix.

;;; 18. grimmory (#7344, line 56235)
;;;     MISSING_GUIX_DEPS: self-hosted ebook reader
;;;     (github.com/grimmory-tools/grimmory, AGPL-3.0);
;;;     requires JDK 25 (not in Guix — latest is JDK 21);
;;;     also needs MariaDB runtime + yarn frontend build.
;;;     A1: JDK 25 not available; A2: MariaDB runtime;
;;;     A3: Java+yarn hybrid build is complex.

;;; 19. python-llama-cpp-vulkan (#7348, line 56261)
;;;     COMPLEX_NATIVE_BUILD: Python bindings for llama.cpp with Vulkan
;;;     (github.com/abetlen/llama-cpp-python, GPL-3.0);
;;;     requires vendored llama.cpp C++ library compiled with Vulkan;
;;;     scikit-build + CMake + Vulkan ICD integration.
;;;     A1: llama.cpp not in Guix; A2: Vulkan build chain complex;
;;;     A3: scikit-build + CMake interop issues in Guix.

;;; 20. tmplayer (#7353, line 56288)
;;;     CARGO_DEPS_NEEDED: Rust terminal music player with visualizer
;;;     (github.com/professor-lee/TMPlayer, AGPL-3.0);
;;;     cargo build with ~50 crate deps + alsa/dbus/chromaprint/fftw;
;;;     no tagged releases, git-only.
;;;     A1: cargo-build-system needs 50+ crates;
;;;     A2: no stable releases; A3: native deps chain complex.

;;; 21. binaryninja-personal (#7613, line 58107)
;;;     PROPRIETARY: Binary Ninja reverse engineering platform;
;;;     proprietary commercial software from binary.ninja;
;;;     personal license, no source code.
;;;     A1: proprietary — not distributable; A2: no source code;
;;;     A3: commercial license required.

;;; 22. spotify-downloader (#7598, line 58016)
;;;     PYTHON_DEPS_CHAIN: Spotify playlist downloader
;;;     (github.com/MokshitBindal/Spotify_Downloader, MIT);
;;;     depends on ~15 Python packages (click, mutagen, pydub, tqdm,
;;;     spotipy, etc.) several of which are not in Guix;
;;;     no GitHub releases or PyPI package.
;;;     A1: missing Python deps (spotipy, pydub) not in Guix;
;;;     A2: no standard releases; A3: Spotify API terms may restrict.
