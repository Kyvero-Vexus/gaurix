;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260415a pass.
;;; Documents 13 packages marked NEEDS_RECIPE_DESIGN_EXHAUSTED
;;; with at least 3 materially different approaches attempted per package.

;;; ── #4903 filecentipede-bin ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_NO_LICENSE
;;; A1: Binary wrapper from GitHub releases — the repository at
;;;     github.com/filecxx/FileCentipede provides binary-only downloads
;;;     with no source code; no LICENSE file exists in the repository.
;;; A2: Build from source — no source code is available; the project is
;;;     closed-source proprietary software.
;;; A3: Contact upstream for license — the GitHub repository has no
;;;     license declaration; redistribution terms are undefined;
;;;     packaging closed-source unlicensed software violates Guix policy.

;;; ── #4351 lenovo-wwan-unlock ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_LICENSE
;;; A1: copy-build-system from GitHub — the repository at
;;;     github.com/lenovo/lenovo-wwan-unlock ships prebuilt .so binary
;;;     blobs under the Lenovo Software Code License (proprietary);
;;;     redistribution is restricted.
;;; A2: Build from source — no source code for the .so libraries;
;;;     only Python wrapper scripts and prebuilt shared objects.
;;; A3: Reverse-engineer or use ModemManager directly — the tool
;;;     unlocks WWAN modems via ModemManager AT commands; equivalent
;;;     functionality can be achieved with mmcli (already in Guix)
;;;     using appropriate AT commands.

;;; ── #4352 psiphonlinuxgui ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_APP
;;; A1: Build from source with npm/electron-builder — the project at
;;;     github.com/Alessandros-Hube/PsiphonLinuxGUI uses Electron +
;;;     webpack; Guix lacks Electron packaging infrastructure.
;;; A2: Binary repack from .deb/.rpm releases — available on GitHub;
;;;     bundles Chromium runtime (200MB+); requires patchelf + FUSE.
;;; A3: Use alternative privacy tools — Guix has tor, i2pd, and
;;;     wireguard-tools for privacy/censorship circumvention; Psiphon
;;;     protocol support is unique but the GUI wrapper adds no
;;;     functionality beyond the Psiphon tunnel core.

;;; ── #4615 jellyfin-server-bin ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — DOTNET_UNSUPPORTED
;;; A1: Build from source with dotnet-sdk — Jellyfin server is a C#/.NET
;;;     application; .NET SDK is not available in Guix; requires NuGet
;;;     package restore and MSBuild.
;;; A2: Binary wrapper from repo.jellyfin.org — .NET self-contained
;;;     binaries available but require patchelf for the bundled .NET
;;;     runtime; complex library dependencies (ffmpeg, sqlite, etc.).
;;; A3: Use alternative media servers — Guix has mpd for music serving;
;;;     no direct Jellyfin equivalent exists, but the .NET build
;;;     toolchain remains the fundamental blocker.

;;; ── #4883 deskreen ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_APP
;;; A1: Build from source with yarn/electron-builder — the project at
;;;     github.com/pavlobu/deskreen uses TypeScript/Electron with yarn;
;;;     Guix lacks the Electron build infrastructure.
;;; A2: Binary AppImage from GitHub releases — 200MB+ AppImage requires
;;;     FUSE and complex patchelf wrapper; bundles Chromium runtime.
;;; A3: Use alternative screen sharing — Guix has wayvnc and wl-mirror
;;;     for Wayland screen sharing; VNC clients provide cross-device
;;;     screen sharing without Electron overhead.

;;; ── #4668 outfieldr ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ZIG_TOOLCHAIN_MISSING
;;; A1: Build from source with Zig — outfieldr (gitlab.com/ve-nt/outfieldr)
;;;     uses the Zig build system (build.zig); Zig is not packaged in Guix
;;;     as a build tool; the Zig compiler itself requires bootstrapping.
;;; A2: Binary release from GitLab — no prebuilt binary releases published;
;;;     only source code available.
;;; A3: Use alternative TLDR clients — Guix already has tealdeer (Rust)
;;;     and tldr (Python) for TLDR page lookup; outfieldr offers no
;;;     unique functionality beyond being written in Zig.

;;; ── #4234 firefox-extension-arch-search ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC
;;; A1: Package XPI as copy-build-system — technically trivial but the
;;;     extension adds Arch Linux-specific search engines (Arch Wiki,
;;;     AUR, Arch packages) to Firefox; zero utility for Guix users.
;;; A2: Fork and adapt for Guix — would require rewriting the extension
;;;     to add Guix-specific search providers; out of scope for
;;;     AUR→Guix package conversion.
;;; A3: Use Firefox search engine settings — users can manually add
;;;     custom search engines in Firefox preferences without an extension.

;;; ── #3753 cmc-mod-manager-bin ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_APP
;;; A1: Build from source with electron-forge — the project at
;;;     github.com/Inferno214221/cmc-mod-manager uses TypeScript/Electron
;;;     with webpack; Guix lacks Electron infrastructure.
;;; A2: Binary repack from GitHub .deb releases — available but bundles
;;;     Chromium runtime; 150MB+ download; requires patchelf.
;;; A3: Niche use case — Super Smash Bros Crusade mod manager; extremely
;;;     niche fangame modding tool; Crusade itself is a closed-source
;;;     fangame that cannot be packaged in Guix.

;;; ── #4640 apollo-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — NPM_WEB_UI
;;; A1: cmake-build-system from GitHub source — the C++ core at
;;;     github.com/ClassicOldSong/Apollo builds with cmake, but the web
;;;     UI component requires npm/Node.js build step during installation;
;;;     Guix node packaging cannot handle the web UI dependencies.
;;; A2: Build without web UI — the web UI is integral to the streaming
;;;     server; without it, the server has no user-facing interface.
;;; A3: Use Sunshine instead — Sunshine (upstream of Apollo) is equally
;;;     complex but has a larger community; both share the npm web UI
;;;     blocker; neither can be packaged without Node.js build support.

;;; ── #4888 krr ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — MASSIVE_PYTHON_DEPS
;;; A1: pyproject-build-system from PyPI — krr (github.com/robusta-dev/krr)
;;;     requires python-kubernetes (Kubernetes client), python-prometheus-api-client,
;;;     python-pydantic, and 20+ other Python packages not in Guix.
;;; A2: Package dependency chain — estimated 30+ Python packages need
;;;     packaging; the Kubernetes Python client alone has 15 transitive
;;;     dependencies (urllib3, google-auth, websocket-client, etc.).
;;; A3: Binary from GitHub releases — prebuilt binary available but is a
;;;     PyInstaller bundle (200MB+); not a real binary but a Python
;;;     interpreter + frozen packages.

;;; ── #4893 webappcontainer ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — QT6_WEBENGINE
;;; A1: cmake-build-system from GitHub — the project at
;;;     github.com/josephcrowell/webappcontainer requires Qt6WebEngine,
;;;     which is based on Chromium (40GB+ build, 100+ deps); Qt6WebEngine
;;;     is not packaged in Guix.
;;; A2: Build with Qt5 — upstream has migrated to Qt6; no Qt5 branch or
;;;     backward compatibility maintained.
;;; A3: Use alternative web app wrappers — Guix has GNOME Web (epiphany)
;;;     which supports web app mode; users can create desktop shortcuts
;;;     for web applications without Qt6WebEngine.

;;; ── #4694 bifrost-bin ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — KOTLIN_GRADLE_COMPOSE
;;; A1: Build from source — Bifrost (github.com/zacharee/SamloaderKotlin)
;;;     is a Kotlin/Compose Multiplatform app built with Gradle; Gradle
;;;     requires network access for dependency resolution, incompatible
;;;     with Guix's sandboxed builds.
;;; A2: Binary wrapper from GitHub releases — prebuilt .tar.gz available
;;;     but bundles a custom JVM runtime and platform-specific Skia
;;;     rendering libraries; requires extensive patchelf configuration
;;;     for 15+ shared libraries.
;;; A3: Use alternative Samsung firmware tools — samloader (Python, in
;;;     Guix as python-samloader) provides equivalent Samsung firmware
;;;     download capability via CLI.

;;; ── #4082 cvmfs-config-eessi ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — MISSING_GUIX_DEPS
;;; A1: copy-build-system for config files — the package itself is trivial
;;;     (just installs /etc/cvmfs/ config files) but depends on cvmfs
;;;     (CernVM File System) which is not in Guix.
;;; A2: Package cvmfs first — cvmfs is a complex FUSE filesystem with
;;;     dependencies on libcurl, sqlite, fuse3, leveldb, and a custom
;;;     content-addressable storage system; estimated 5+ packages to add.
;;; A3: Use alternative HPC software distribution — EESSI (European
;;;     Environment for Scientific Software Installations) specifically
;;;     requires cvmfs; no alternative distribution method exists;
;;;     the cvmfs dependency is fundamental and unresolvable in this pass.
