;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #11 — blocked notes.
;;; 15 packages re-blocked with concrete reasons and attempt details.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd11-blocked-notes))

(define %blocked-notes
  (list
   '(chawan-git
     reason: "NIM_ECOSYSTEM_MISSING"
     details: "Chawan is a terminal web browser written in Nim.  The Nim compiler
and its package ecosystem (nimble) are available in Guix, but the build
process requires brotli, libssh2, openssl native bindings compiled via
Nim's build system.  The Nim build integration with Guix is not
straightforward enough for batch processing."
     attempts: ("1. Checked Guix for nim — available but Nim FFI binding compilation complex"
                "2. Reviewed PKGBUILD — uses 'make' wrapping nimble with many C library deps"
                "3. Would need custom Nim build-system integration phase — beyond batch scope"))

   '(rtl8821ce-dkms-git
     reason: "DKMS_KERNEL_MODULE"
     details: "Realtek RTL8821CE WiFi driver as a DKMS kernel module.  Guix handles
kernel modules through its own linux-module-build-system and requires
modules to be compiled against a specific kernel version in the store.
DKMS is an Arch/Debian concept not applicable to Guix."
     attempts: ("1. Checked Guix for rtl8821ce — not available"
                "2. Reviewed PKGBUILD — pure DKMS install, no standalone build"
                "3. Would need linux-module-build-system with kernel headers — complex"))

   '(brother-mfc-l8690cdw
     reason: "PROPRIETARY_BINARY_DEB"
     details: "Proprietary Brother printer driver distributed as .deb packages
from download.brother.com.  Subject to Brother EULA (non-free).
Requires extracting i386 binaries from .deb archives and wrapping
with appropriate library paths (cups, ghostscript, etc.)."
     attempts: ("1. Reviewed PKGBUILD — downloads two .deb packages (LPR + CUPS wrapper)"
                "2. Checked for Brother drivers in Guix — none available"
                "3. Non-free license + .deb extraction + i386 compat — too complex for batch"))

   '(cherry-studio-electron-bin
     reason: "ELECTRON_RUNTIME_MISSING"
     details: "Cherry Studio is an Electron desktop app for LLM providers.  The AUR
package depends on electron40 (system-wide Electron runtime).  Guix
does not have a standalone Electron runtime package; Electron apps in
Guix require bundling Chromium which is an enormous build."
     attempts: ("1. Checked Guix for electron — not available as standalone runtime"
                "2. Reviewed PKGBUILD — needs electron40 + asar archive extraction"
                "3. No viable binary-only approach without Electron runtime"))

   '(portmaster-bin
     reason: "TAURI_WEBKIT2GTK_DEPS"
     details: "Portmaster is a Tauri-based privacy firewall app.  The PKGBUILD
downloads a prebuilt binary that requires webkit2gtk-4.1 (a specific
WebKit API version).  Guix has webkitgtk but the API version
compatibility (4.0 vs 4.1) needs verification, plus the binary
depends on libappindicator-gtk3 and libsoup."
     attempts: ("1. Reviewed PKGBUILD — Tauri app with complex GTK/WebKit deps"
                "2. Checked Guix for webkit2gtk-4.1 — version mismatch risk"
                "3. Binary has many shared library deps requiring patchelf — complex"))

   '(audiobookshelf
     reason: "NPM_NATIVE_DEPS"
     details: "Audiobookshelf is a Node.js audiobook server with native SQLite
bindings (better-sqlite3) and complex npm build.  Guix's node-build-system
cannot handle native npm modules that compile C++ addons without
significant manual phase customization."
     attempts: ("1. Reviewed PKGBUILD — npm ci + nuxt build + native sqlite3 addon"
                "2. Checked Guix for node-build-system — cannot handle native addons easily"
                "3. Would need vendored node_modules + manual native build — beyond batch"))

   '(sparrow-wallet
     reason: "DOWNLOAD_FAILED"
     details: "Sparrow Wallet is a Bitcoin desktop wallet distributed as a prebuilt
Java application.  The GitHub release URL for the x86_64 tarball
returned a download failure (404 or redirect issue).  The package also
requires a JVM runtime wrapper."
     attempts: ("1. Attempted guix download of GitHub release URL — failed"
                "2. URL pattern: sparrowwallet-2.4.2-x86_64.tar.gz — may need different arch name"
                "3. Even if downloadable, needs JRE wrapper and libxcrypt-compat"))

   '(streamlink-twitch-gui-bin
     reason: "DOWNLOAD_FAILED"
     details: "Streamlink Twitch GUI binary distribution.  The GitHub release URL
for v2.5.3 linux64 tarball returned a download failure.  This is an
NW.js (Node-Webkit) application requiring specific shared libraries."
     attempts: ("1. Attempted guix download of v2.5.3-linux64.tar.gz — failed"
                "2. Checked URL structure — may be renamed or removed from releases"
                "3. Even if downloadable, NW.js apps need complex library patching"))

   '(nsz-git
     reason: "MISSING_DEP_CHAIN"
     details: "NSZ is a Nintendo Switch NSP/XCI compressor using Python.  It requires
python-enlighten (progress bars) which is not in Guix.  python-enlighten
itself requires python-prefixed which is also not in Guix.  Two-deep
dependency chain needs packaging first."
     attempts: ("1. Checked Guix for python-enlighten — not available"
                "2. Ran guix import pypi enlighten — needs python-prefixed (also missing)"
                "3. Two missing deps in chain; beyond single-package batch scope"))

   '(fortune-mod-portal-game
     reason: "MISSING_DEP_FORTUNE_MOD"
     details: "Portal game quotes for the Unix fortune tool.  The build process
uses 'make' which calls strfile (from fortune-mod) to generate binary
fortune databases.  fortune-mod is not available in Guix."
     attempts: ("1. Searched Guix for fortune-mod — not found"
                "2. Searched guix search fortune — no fortune-mod equivalent"
                "3. Cannot build without strfile binary from fortune-mod"))

   '(llvm-bolt
     reason: "MASSIVE_BUILD_INFRA"
     details: "LLVM BOLT is a post-link optimizer that is part of the LLVM project.
Building it requires downloading and compiling the entire LLVM monorepo
(~2GB source, hours of compilation) with specific CMake configuration.
Guix has LLVM but BOLT is not split out as a separate output."
     attempts: ("1. Checked Guix LLVM packages — BOLT not available as separate package"
                "2. Reviewed PKGBUILD — needs full llvm-project source + CMake/Ninja build"
                "3. Build requires 16GB+ RAM and hours of compilation — not batch-feasible"))

   '(jira-cli
     reason: "DOWNLOAD_FAILED"
     details: "Interactive CLI for Atlassian Jira, written in Go.  The GitHub
release tarball URL failed to download (v1.7.0 and v1.5.2 both 404).
The repository may have been renamed, made private, or the release
tags restructured."
     attempts: ("1. Attempted guix download of v1.7.0.tar.gz — failed"
                "2. Attempted guix download of v1.5.2.tar.gz — also failed"
                "3. Even if available, Go module deps would need packaging"))

   '(simple-thumbnailer-stl
     reason: "DOWNLOAD_FAILED"
     details: "Rust tool for generating STL 3D model thumbnails.  The GitLab
archive URL for version 0.4.0 failed to download.  The version tag
may not exist or the archive format may differ."
     attempts: ("1. Attempted guix download of GitLab archive v0.4.0 — failed"
                "2. Tried alternative URL patterns — none worked"
                "3. Even if available, Rust cargo deps would need packaging"))

   '(vfstool-git
     reason: "DOWNLOAD_FAILED"
     details: "Rust tool for OpenMW modlist lighting adjustment.  The GitHub
release tarball for version 2.5 failed to download with both tag
patterns (2.5 and v2.5)."
     attempts: ("1. Attempted guix download of tags/2.5.tar.gz — failed"
                "2. Attempted guix download of tags/v2.5.tar.gz — also failed"
                "3. Even if available, Rust cargo deps would need packaging"))

   '(kate-discord-rpc-git
     reason: "DOWNLOAD_FAILED"
     details: "CMake/KDE plugin for Discord Rich Presence in Kate editor.
The GitHub archive URL for the main branch failed to download.
The repository may have been removed or made private."
     attempts: ("1. Attempted guix download of main.tar.gz — failed"
                "2. Repository may no longer exist at github.com/leia-uwu/kate-discord-rpc"
                "3. Even if available, needs KDE Frameworks + discord-rpc submodule"))))
