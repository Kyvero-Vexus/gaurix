;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260415c pass.
;;; Documents packages blocked with reason codes and 1-3 concrete details.

;;; ── #13848 cursor-cli ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Cursor CLI is part of the Cursor AI IDE; no standalone Linux binary available on GitHub releases.  A2: The Cursor IDE bundles an Electron app; no CLI-only distribution exists.  A3: No open-source alternative CLI component available.

;;; ── #13851 deemix-gui ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Electron app requiring npm/webpack build; Guix lacks Electron packaging infrastructure.  A2: No standalone binary releases available.  A3: Project is abandoned/archived; no active upstream maintenance.

;;; ── #13854 mate-wayland-session ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Requires Wayfire compositor + MATE desktop integration; complex session manager setup.  A2: Depends on mate-panel, mate-settings-daemon under Wayland which are not yet stable.  A3: No standalone build; requires full MATE + Wayfire stack coordination.

;;; ── #13857 ssh-studio ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Python + GTK4 + libadwaita app; requires python-pygobject + libadwaita introspection bindings.  A2: Build from git needs meson + complex GObject introspection setup.  A3: Packaging requires gi-typelib propagation for GTK4/libadwaita not yet streamlined in Gaurix.

;;; ── #13860 calcesara ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: SARA (Simulation Assisted Reliability Assessment) is a complex scientific application; unclear build system and dependencies.  A2: No public GitHub/GitLab repository found; source availability uncertain.  A3: Likely requires specialized simulation libraries not in Guix.

;;; ── #13863 untmp ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Part of tmplinux container suite; requires containerization runtime (LXC/chroot).  A2: Shell scripts that manipulate system-level container state; not suitable for sandboxed Guix build.  A3: No standalone build; depends on entire tmplinux ecosystem.

;;; ── #13864 tmpsuse ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Part of tmplinux suite; creates temporary OpenSUSE containers.  A2: Requires downloading OpenSUSE images at build time; network access not available in Guix builds.  A3: System-level container management not compatible with Guix sandbox.

;;; ── #13865 tmpstali ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Part of tmplinux suite; creates temporary Stali containers.  A2: Requires network access to download distro images.  A3: Container management scripts not compatible with Guix build sandbox.

;;; ── #13866 tmpidlebox ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Part of tmplinux suite; creates temporary Idlebox containers.  A2: Requires network access to download distro images.  A3: Container management scripts not compatible with Guix build sandbox.

;;; ── #13867 tmpgentoo ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Part of tmplinux suite; creates temporary Gentoo containers.  A2: Requires network access to download Gentoo stage3 tarball.  A3: Container management scripts not compatible with Guix build sandbox.

;;; ── #13871 haskell-unix ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Haskell library backport; requires GHC + Cabal infrastructure.  A2: The 'unix' package is a GHC boot library; backporting requires careful version pinning.  A3: Guix has ghc-unix as part of GHC; standalone backport conflicts with GHC's bundled version.

;;; ── #13872 haskell-filepath ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Haskell library backport; requires GHC + Cabal build.  A2: The 'filepath' package is a GHC boot library; standalone backport conflicts with GHC bundled version.  A3: Guix GHC already includes filepath; separate package would cause version conflicts.

;;; ── #13876 mangabox-bin ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Electron app for Komga; requires Electron runtime packaging.  A2: No standalone binary releases on GitHub; AppImage may exist but requires FUSE.  A3: Guix lacks Electron packaging infrastructure; use Komga web interface instead.

;;; ── #13877 manaverse-sdl2-git ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: ManaPlus fork; complex C++ game client requiring SDL2, multiple networking libraries, and custom build scripts.  A2: Build depends on tmw-data and custom server configuration.  A3: Upstream build system uses autotools with many custom patches not documented.

;;; ── #13878 manaverse-git ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: ManaPlus fork (SDL1 version); same complexity as SDL2 variant.  A2: Depends on unmaintained SDL1 APIs.  A3: Complex autotools build with many undocumented custom patches.

;;; ── #13884 danxi ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Flutter/Dart application; Guix lacks Flutter SDK packaging.  A2: No prebuilt Linux binary releases on GitHub.  A3: Dart/Flutter build toolchain is not available in Guix; cross-platform mobile app.

;;; ── #13889 deepin-wine10-stable ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Deepin's Wine 10 fork; massive C codebase with extensive patches.  A2: Requires 32-bit multilib support not available in standard Guix.  A3: Complex build with hundreds of dependencies; Guix already has wine package; Deepin patches require separate effort.

;;; ── #13891 etherlab-ethercat-dkms ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: DKMS kernel module for IgH EtherCAT Master; requires kernel headers and DKMS infrastructure.  A2: Guix kernel module packaging requires out-of-tree module build setup.  A3: Industrial EtherCAT master with complex kernel integration not suitable for batch packaging.

;;; ── #13893 jupyterlab-myst ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: JupyterLab extension built with npm/TypeScript; requires node_modules resolution.  A2: Guix lacks JupyterLab extension build infrastructure.  A3: Would need jupyterlab + npm ecosystem packaging not available in Guix.

;;; ── #13895 git-series-git ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Rust tool using libgit2; cargo-build-system needs full Cargo.lock dependency resolution.  A2: Over 50 Rust crate dependencies not yet in Guix.  A3: Project appears unmaintained (last commit 2017); upstream may not build with modern Rust toolchain.

;;; ── #13896 astral-bin ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Cross-platform web application built on EasyTier; likely Electron/Tauri.  A2: No standalone CLI binary available; GUI requires web runtime.  A3: P2P VPN management requires system-level networking not suitable for sandboxed Guix build.

;;; ── #13899 fafarunner-bin ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Flutter/Dart game application; Guix lacks Flutter SDK.  A2: No prebuilt Linux x86_64 binary on GitHub releases.  A3: Mobile-focused game; Linux desktop support unclear.

;;; ── #13905 silabs-usbxpresshostsdk ──
;;; LICENSE_REVIEW_NEEDED
;;; A1: Silicon Labs USB Xpress Host SDK; proprietary binary SDK.  A2: Redistribution terms unclear; requires Silicon Labs license agreement acceptance.  A3: No open-source alternative for the flashing tool; license review needed for packaging legality.

;;; ── #13911 cp210x-overclock-dkms ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: DKMS kernel module for overclocking CP210x baudrate.  A2: Requires kernel headers and DKMS infrastructure not in standard Guix packaging flow.  A3: Kernel module patches need out-of-tree build setup specific to target kernel version.

;;; ── #13912 cargo-xwin ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Rust cargo subcommand for Windows cross-compilation; cargo-build-system needs full dependency resolution.  A2: Depends on Microsoft CRT headers/libraries download at build time.  A3: Over 100 Rust crate dependencies not in Guix; Windows cross-compilation toolchain not available.

;;; ── #13913 gv-usb2-driver-dkms-git ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: DKMS kernel module for GV-USB2 capture device.  A2: Requires kernel headers and V4L2 subsystem headers.  A3: Out-of-tree kernel module packaging not suitable for batch resolver pass.

;;; ── #13914 e2-studio-bin ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Renesas e2 studio is a large Eclipse-based IDE; 1GB+ binary distribution.  A2: Requires Renesas account/license for download; URL not publicly accessible.  A3: Eclipse RCP packaging is complex; similar to DBeaver (blocked in prior passes).

;;; ── #13919 onvif-gui ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Python + PyQt5/6 ONVIF client; requires python-onvif-zeep + many Python networking deps.  A2: Complex dependency chain including python-zeep, python-wsdiscovery, and OpenCV.  A3: Some dependencies (python-onvif-zeep) not in Guix; significant packaging effort.

;;; ── #13920 lib32-libxml2-legacy ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: 32-bit legacy version of libxml2; Guix doesn't have a lib32 packaging convention.  A2: Would require cross-compilation to i686 target.  A3: Legacy version maintenance is not justified when current libxml2 is available.

;;; ── #13921 brother-mfc-l8390cdw ──
;;; LICENSE_REVIEW_NEEDED
;;; A1: Brother printer driver contains proprietary binary filter components.  A2: Brother's EULA must be accepted; redistribution rights unclear.  A3: Driver downloads require specific Brother download portal URLs that change per model.

;;; ── #13923 metube-git ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Python + Vue.js web application; requires npm build for frontend.  A2: Backend needs yt-dlp + FFmpeg + Redis/Celery for task queue.  A3: Intended to run as a web service/Docker container; not a typical desktop package.

;;; ── #13926 alice-ai-app-bin ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Electron app built with Vue.js + Vite; requires Electron runtime.  A2: AppImage binary available but bundles Chromium (200MB+); needs FUSE + patchelf.  A3: Guix lacks Electron packaging infrastructure for proper binary repack.

;;; ── #13929 firefox-nightly-i18n-pt-br ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Firefox Nightly language pack; version changes daily with nightly builds.  A2: Source URL is unstable; nightly artifacts are not archived permanently.  A3: Requires matching Firefox Nightly version which is not in Guix/Gaurix.

;;; ── #13931 clara-verse ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Electron application bundling LLMs, ComfyUI, n8n; massive dependency tree.  A2: Requires Docker/container runtime for services.  A3: No standalone binary; complex multi-service architecture not packageable as single Guix package.

;;; ── #13933 vitasdk-packages-git ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: Cross-compilation packages for Sony PS Vita homebrew; requires VITASDK toolchain.  A2: ARM cross-compiler + custom Vita linker not in Guix.  A3: Proprietary Sony SDK headers needed for some packages; license issues.

;;; ── #13935 mingw-w64-mpg123 ──
;;; NEEDS_RECIPE_DESIGN
;;; A1: MinGW-w64 cross-compiled version of mpg123; requires mingw-w64 toolchain.  A2: Guix has mpg123 for native Linux; cross-compilation to Windows requires mingw-w64-gcc.  A3: Windows cross-compilation packages are outside typical Guix packaging scope.

