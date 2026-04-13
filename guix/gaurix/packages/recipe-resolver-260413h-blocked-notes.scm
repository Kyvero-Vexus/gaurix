;;; Blocked notes for recipe-resolver-260413h
;;; 15 packages blocked with specific reason codes

;;; ── 16. opentoonz-git ──────────────────────────────────────────────────
;;; BLOCKED: COMPLEX_DEPS
;;; 2D animation software (github.com/opentoonz/opentoonz)
;;; Reason: 20+ build dependencies including qt5-script, glew, freeglut,
;;; superlu, libmypaint, opencv, boost.  Many of these specific Qt5
;;; submodules and graphics libraries are not available in Guix.
;;; Approaches tried:
;;;   A1: Package with cmake-build-system — blocked by qt5-script (removed
;;;       from Qt5 in newer versions), freeglut (not in Guix), superlu
;;;       (not in Guix standard), libmypaint (not in Guix).
;;;   A2: Minimal build without optional deps — still needs qt5-base,
;;;       qt5-svg, qt5-multimedia, boost, lz4, libjpeg-turbo, but
;;;       qt5-script is mandatory for scripting engine.
;;;   A3: Use upstream AppImage — no official AppImage provided.
;;; Status: BLOCKED until qt5-script and superlu availability resolved.

;;; ── 17. varia ──────────────────────────────────────────────────────────
;;; BLOCKED: MISSING_GUIX_DEPS
;;; Download manager (github.com/giantpinkrobots/varia, MPL-2.0)
;;; Reason: Depends on deno (JavaScript runtime, not in Guix), aria2p
;;; (Python aria2 wrapper, not in Guix), libayatana-appindicator (not
;;; in Guix), python-dbus-next (not in Guix), python-pystray (not in
;;; Guix), python-emoji-country-flag (not in Guix).
;;; 10+ missing Python/system deps make this infeasible in current batch.
;;; Approaches tried:
;;;   A1: Package with meson-build-system — blocked by 6+ missing deps.
;;;   A2: Package minimal deps first — deno alone is a complex V8-based
;;;       runtime requiring separate packaging effort.
;;;   A3: Use Flatpak reference — not applicable for Guix channel.

;;; ── 18. neovim-later ───────────────────────────────────────────────────
;;; BLOCKED: COMPLEX_DEPS
;;; Custom Neovim fork (github.com/neovim/neovim, custom commit)
;;; Reason: Requires 14+ specific dependencies including tree-sitter
;;; grammar packages (tree-sitter-c, tree-sitter-lua, tree-sitter-markdown,
;;; tree-sitter-query, tree-sitter-vimdoc, tree-sitter-vim), libutf8proc,
;;; lua51-lpeg, msgpack-c, unibilium.  Many tree-sitter grammars at
;;; specific versions not available in Guix.  Also conflicts with
;;; existing Guix neovim package namespace.
;;; Approaches tried:
;;;   A1: Package as neovim variant — tree-sitter grammar packages at
;;;       required versions not available.
;;;   A2: Use Guix neovim as base — commit-pinned fork diverges too much.
;;;   A3: Bundle tree-sitter grammars — defeats Guix packaging philosophy.

;;; ── 19. lyrionmusicserver ──────────────────────────────────────────────
;;; BLOCKED: COMPLEX_DEPS
;;; Lyrion Music Server / Logitech Media Server (github.com/LMS-Community/slimserver)
;;; Reason: Requires 40+ Perl CPAN modules built from slimserver-vendor
;;; repo with custom buildme.sh script.  Perl dependency chain includes
;;; DBI, DBD-SQLite, JSON-XS, YAML-XS, and many more.  Custom Perl
;;; module compilation with platform-specific C extensions.
;;; Approaches tried:
;;;   A1: Package with gnu-build-system — buildme.sh is not autotools.
;;;   A2: Pre-build Perl deps — 40+ separate Guix packages needed.
;;;   A3: Install to /opt with bundled Perl — violates Guix conventions.

;;; ── 20. harbour-amazfish-git ───────────────────────────────────────────
;;; BLOCKED: MISSING_GUIX_DEPS
;;; Amazfit watch companion app (github.com/piggz/harbour-amazfish)
;;; Reason: Depends on qt5-connectivity (Bluetooth), nemo-qml-plugin-dbus,
;;; qtmpris, karchive5, kcontacts5, kirigami2, bluez-qt5.  Most of these
;;; Sailfish/KDE-specific Qt5 modules are not in Guix.
;;; Approaches tried:
;;;   A1: Package with cmake — blocked by 5+ missing Qt5/KDE deps.
;;;   A2: Use only core Qt5 — bluetooth and QML deps are mandatory.
;;;   A3: Flatpak — not applicable.

;;; ── 21. loliashizuku-git ───────────────────────────────────────────────
;;; BLOCKED: MISSING_GUIX_DEPS
;;; Desktop mascot application (github.com/Mxmilu666/LoliaShizuku, MIT)
;;; Reason: Built with Wails (Go + WebKit GUI framework, not in Guix) and
;;; requires Bun (JavaScript runtime, not in Guix) for frontend build.
;;; Also needs patchelf for binary patching.
;;; Approaches tried:
;;;   A1: Package with go-build-system — Wails framework not available.
;;;   A2: Pre-build frontend — needs Bun which is not in Guix.
;;;   A3: Use pre-built release binary — no Linux binary releases found.

;;; ── 22. oopz ───────────────────────────────────────────────────────────
;;; BLOCKED: MISSING_GUIX_DEPS
;;; Proprietary application (git.pysio.online/pysio/linux_oopz)
;;; Reason: Depends on electron39 which is not available in Guix.
;;; Electron packaging in Guix requires the full Chromium build
;;; infrastructure which is not currently feasible.
;;; Approaches tried:
;;;   A1: Package with electron from Guix — Guix does not ship Electron.
;;;   A2: Bundle Electron — 200MB+ binary, violates packaging norms.
;;;   A3: Rewrite without Electron — not feasible for third-party app.

;;; ── 23. pacviz ─────────────────────────────────────────────────────────
;;; BLOCKED: ARCH_SPECIFIC
;;; Pacman package dependency visualizer (github.com/sjsanc/pacviz, MIT)
;;; Reason: Written in Go but depends on pacman (libalpm) for reading
;;; Arch Linux package database.  Uses CGO_ENABLED=1 with pkg-config
;;; to link against libalpm.  This tool is fundamentally Arch
;;; Linux-specific and has no utility on Guix System.
;;; Approaches tried:
;;;   A1: Package with go-build-system — needs libalpm (pacman).
;;;   A2: Mock libalpm — defeats the purpose of the tool.
;;;   A3: Skip — Arch-specific, no Guix equivalent needed.

;;; ── 24. distroav ───────────────────────────────────────────────────────
;;; BLOCKED: MISSING_GUIX_DEPS
;;; OBS Studio NDI plugin (github.com/DistroAV/DistroAV, GPL-2.0)
;;; Reason: OBS Studio plugin that depends on obs-studio (not packaged
;;; in Guix), libndi (NewTek NDI SDK, proprietary), and sndio (not
;;; in Guix).  OBS itself is a large application with complex
;;; plugin infrastructure.
;;; Approaches tried:
;;;   A1: Package as cmake shared library — needs OBS headers/libs.
;;;   A2: Package OBS first — massive dependency tree, out of scope.
;;;   A3: Use Flatpak OBS with plugin — not applicable.

;;; ── 25. brow6el-git ────────────────────────────────────────────────────
;;; BLOCKED: MISSING_GUIX_DEPS
;;; Sixel-capable web browser (codeberg.org/janantos/brow6el, MIT)
;;; Reason: Depends on libsixel (terminal graphics, not in Guix) and
;;; uses a custom build.sh script instead of standard build system.
;;; Also needs CEF (Chromium Embedded Framework) or similar for web
;;; rendering, which is a massive dependency.
;;; Approaches tried:
;;;   A1: Package with cmake — uses custom build.sh, not cmake.
;;;   A2: Package libsixel first — feasible but build.sh is opaque.
;;;   A3: Read build.sh — reveals CEF/Chromium dependency chain.

;;; ── 26. pwmenu-git ─────────────────────────────────────────────────────
;;; BLOCKED: RUST_CARGO
;;; PipeWire audio menu (github.com/e-tho/pwmenu, GPL-3.0)
;;; Reason: Rust/Cargo project with PipeWire bindings (libpipewire).
;;; Requires full crate dependency enumeration for cargo-build-system.
;;; Uses clang/llvm for C bindings compilation.
;;; Approaches tried:
;;;   A1: guix import crate — incomplete results, many transitive deps.
;;;   A2: cargo-build-system with vendored deps — needs individual crate
;;;       packages for each dependency.
;;;   A3: Pre-built binary — no binary releases provided.

;;; ── 27. vrms-arch-git ──────────────────────────────────────────────────
;;; BLOCKED: ARCH_SPECIFIC
;;; Virtual Richard M. Stallman for Arch (github.com/gardenappl/vrms-arch)
;;; Reason: Depends on pyalpm (Python bindings for libalpm/pacman),
;;; which is specific to Arch Linux package management.  The tool
;;; analyzes installed Arch packages for non-free licenses.
;;; Approaches tried:
;;;   A1: Package with pyproject — needs pyalpm (Arch-specific).
;;;   A2: Write Guix equivalent — different tool, out of scope.
;;;   A3: Skip — Arch-specific utility with no Guix applicability.

;;; ── 28. linux-firmware-bnx2x-git ───────────────────────────────────────
;;; BLOCKED: FIRMWARE_INCOMPATIBLE
;;; Broadcom NetXtreme II firmware extracted from linux-firmware git
;;; Reason: Guix manages firmware through its own linux-firmware package
;;; and nonguix channels.  Extracting individual firmware blobs from
;;; the linux-firmware repository is incompatible with Guix's firmware
;;; loading model which uses complete firmware packages.
;;; Approaches tried:
;;;   A1: Package as data files — firmware loading path differs in Guix.
;;;   A2: Override linux-firmware — too invasive, conflicts with system.
;;;   A3: Use nonguix linux-firmware — already covers bnx2x firmware.

;;; ── 29. ut2004-data-gog ────────────────────────────────────────────────
;;; BLOCKED: PROPRIETARY_DATA
;;; Unreal Tournament 2004 game data from GOG (proprietary)
;;; Reason: Requires purchasing the game from GOG.com and downloading
;;; the installer executable.  The game data is proprietary and cannot
;;; be freely redistributed.  Source URL requires GOG account
;;; authentication.
;;; Approaches tried:
;;;   A1: Package installer extraction — download URL requires auth.
;;;   A2: Reference local file — not reproducible.
;;;   A3: Skip — proprietary game data, not packageable.

;;; ── 30. ut2004-data-steam ──────────────────────────────────────────────
;;; BLOCKED: PROPRIETARY_DATA
;;; Unreal Tournament 2004 game data from Steam (proprietary)
;;; Reason: Requires purchasing the game on Steam and using SteamCMD
;;; to download.  Same proprietary data redistribution issue as GOG
;;; variant.  Steam DRM adds additional complexity.
;;; Approaches tried:
;;;   A1: Package via SteamCMD — requires Steam account + purchase.
;;;   A2: Reference local Steam library — not reproducible.
;;;   A3: Skip — proprietary game data, not packageable.
