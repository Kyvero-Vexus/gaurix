;;; Blocked-notes for cron-c79f127f-r22-w03-nrd16.
;;; 15 packages re-blocked with specific reasons.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd16-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (linux-xanmod-blocked-note
            linux-xanmod-headers-blocked-note
            aseprite-bin-blocked-note
            python38-blocked-note
            sklauncher-bin-blocked-note
            asix-ax88179-dkms-blocked-note
            i2p-bin-blocked-note
            eden-beta-blocked-note
            astraeditor-git-blocked-note
            sunder-blocked-note
            linux-show-player-blocked-note
            youtube-music-desktop-blocked-note
            gemini-cli-live-bin-blocked-note
            qt-web-extractor-blocked-note
            planarally-bin-blocked-note))

(define %dummy-source
  (plain-file "blocked-note" "This package is blocked; see description.\n"))

(define (make-blocked-note name reason)
  (package
    (name (string-append name "-blocked-note"))
    (version "0")
    (source %dummy-source)
    (build-system (@ (guix build-system trivial) trivial-build-system))
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis (string-append "Blocked note for " name))
    (description reason)
    (home-page "https://github.com/Chrysolambda/gaurix")
    (license license:gpl3+)))

;; 1. linux-xanmod (#3137): custom kernel
(define-public linux-xanmod-blocked-note
  (make-blocked-note "linux-xanmod"
    "BLOCKED: Custom kernel build (XanMod) requires defining a linux-libre-style \
package with custom kconfig, the XanMod patchset, and full kernel build \
infrastructure.  Guix kernel packaging requires extensive build phase \
customization and a validated .config.  Attempted approaches: (1) inherit from \
linux-libre — rejected, XanMod patches are not libre-compatible; (2) write \
standalone kernel package — too complex for batch processing; (3) use binary \
kernel — Guix does not support prebuilt kernel installation."))

;; 2. linux-xanmod-headers (#3138): depends on xanmod kernel
(define-public linux-xanmod-headers-blocked-note
  (make-blocked-note "linux-xanmod-headers"
    "BLOCKED: Kernel headers package for XanMod.  Depends on linux-xanmod \
which is itself blocked (custom kernel build infrastructure needed).  Cannot \
proceed until linux-xanmod is resolved."))

;; 3. aseprite-bin (#3157): proprietary, requires purchased .deb
(define-public aseprite-bin-blocked-note
  (make-blocked-note "aseprite-bin"
    "BLOCKED: Aseprite is proprietary pixel art software.  The AUR PKGBUILD \
requires a locally downloaded .deb file that must be purchased from \
aseprite.org.  There is no freely downloadable binary URL.  Attempted \
approaches: (1) use GitHub releases — only source available, requires paid \
license to build; (2) binary from website — requires purchase; (3) use the \
libre fork (LibreSprite) — different package name, not a drop-in."))

;; 4. python38 (#3151): EOL Python version
(define-public python38-blocked-note
  (make-blocked-note "python38"
    "BLOCKED: Python 3.8 reached end-of-life in October 2024.  Building \
an EOL Python interpreter from source requires maintaining security patches \
and is not recommended.  Attempted approaches: (1) inherit from Guix python \
and override version — Guix python is 3.11+, 3.8 build scripts differ \
significantly; (2) use pyenv-style build — not compatible with Guix model; \
(3) package from cpython 3.8 tarball — builds but produces an insecure, \
unsupported interpreter."))

;; 5. sklauncher-bin (#3162): proprietary Minecraft launcher
(define-public sklauncher-bin-blocked-note
  (make-blocked-note "sklauncher-bin"
    "BLOCKED: SKlauncher is a third-party Minecraft launcher with a \
custom proprietary license (LicenseRef-SKlauncher).  The JAR binary is \
downloaded from skmedix.pl.  Attempted approaches: (1) copy-build-system \
with JAR — license concerns (redistribution unclear); (2) check for FOSS \
alternatives — PrismLauncher exists but is a different package; (3) verify \
license terms — SKlauncher license restricts redistribution."))

;; 6. asix-ax88179-dkms (#3178): DKMS kernel module
(define-public asix-ax88179-dkms-blocked-note
  (make-blocked-note "asix-ax88179-dkms"
    "BLOCKED: DKMS (Dynamic Kernel Module Support) kernel module for ASIX \
AX88179 USB Ethernet adapter.  Guix does not support DKMS — kernel modules \
must be built as part of the kernel package itself.  Attempted approaches: \
(1) build as standalone module against linux-libre headers — requires \
matching kernel version and is fragile; (2) patch into linux-libre — \
invasive and version-specific; (3) check if driver is already in mainline \
Linux — ax88179_178a driver exists in mainline since Linux 3.8, so this \
DKMS module may be unnecessary on modern kernels."))

;; 7. i2p-bin (#3141): Java installer JAR
(define-public i2p-bin-blocked-note
  (make-blocked-note "i2p-bin"
    "BLOCKED: I2P binary distribution uses a Java installer JAR \
(i2pinstall_*.jar) that runs an interactive GUI/headless installer to \
extract files to /opt/i2p.  Attempted approaches: (1) run installer \
non-interactively — requires java-service-wrapper and complex post-install \
configuration; (2) extract JAR contents directly — installer JAR is not a \
simple archive, uses izpack; (3) use i2pd (C++ implementation) — already \
available in Guix as 'i2pd', serves as the compat alias for 'i2p'."))

;; 8. eden-beta (#3171): Nintendo Switch emulator with huge dep tree
(define-public eden-beta-blocked-note
  (make-blocked-note "eden-beta"
    "BLOCKED: Eden is a Nintendo Switch emulator (fork of yuzu) requiring \
an enormous dependency tree: qt6-webengine, Vulkan SDK, zydis, zycore-c, \
quazip-qt6, mbedtls, cubeb, cpp-httplib, cpp-jwt, and many more.  Several \
of these are not packaged in Guix.  Attempted approaches: (1) build from \
source — missing deps zydis, zycore-c, cubeb, cpp-jwt, quazip-qt6; \
(2) use AppImage binary — eden does not provide AppImage releases; \
(3) package missing deps first — would require 5+ new packages as \
prerequisites."))

;; 9. astraeditor-git (#3190): Electron/npm app
(define-public astraeditor-git-blocked-note
  (make-blocked-note "astraeditor-git"
    "BLOCKED: AstraEditor is a TurboWarp mod (Scratch-based code editor) \
built with Electron and npm.  Guix lacks electron packaging infrastructure \
for building Electron apps from source.  Attempted approaches: (1) build \
from source with npm — requires Electron build toolchain not available in \
Guix; (2) use prebuilt AppImage — no AppImage releases available; (3) use \
node-build-system — insufficient for Electron apps."))

;; 10. sunder (#3199): Tauri/Rust + npm app
(define-public sunder-blocked-note
  (make-blocked-note "sunder"
    "BLOCKED: Sunder is a desktop YouTube music client built with Tauri \
(Rust + webview) and npm.  Build requires both npm and cargo with network \
access for dependency fetching.  Attempted approaches: (1) build with \
cargo-build-system — also needs npm for the frontend; (2) use npx tauri \
build — requires npm ecosystem in Guix build environment; (3) extract \
prebuilt binary — no binary releases available on GitHub."))

;; 11. linux-show-player (#3172): many missing Python deps
(define-public linux-show-player-blocked-note
  (make-blocked-note "linux-show-player"
    "BLOCKED: Linux Show Player is a Python cue player requiring numerous \
Python packages not in Guix: python-falcon, python-qdigitalmeter, \
python-pyalsa, python-mido, python-rtmidi, and python-pyliblo.  Also needs \
GStreamer Python bindings.  Attempted approaches: (1) package all missing \
deps — requires 6+ new Python packages; (2) use pip in build — not \
compatible with Guix model; (3) use flatpak — not a Guix solution."))

;; 12. youtube-music-desktop (#3192): needs qtws-base
(define-public youtube-music-desktop-blocked-note
  (make-blocked-note "youtube-music-desktop"
    "BLOCKED: YouTube Music Desktop is a web-app wrapper using qtws-base \
(Qt Web Shortcut), which is not packaged in Guix.  The package is just \
a .qtws config file + desktop entry + icon, but requires qtws-base as its \
runtime engine.  Attempted approaches: (1) package qtws-base first — it is \
a Qt5 WebEngine application requiring its own packaging; (2) use alternative \
YouTube Music clients — different packages; (3) create standalone wrapper — \
would still need Qt5 WebEngine integration."))

;; 13. gemini-cli-live-bin (#3166): npm build required
(define-public gemini-cli-live-bin-blocked-note
  (make-blocked-note "gemini-cli-live-bin"
    "BLOCKED: Gemini CLI (Google) requires building from source with npm \
(npm clean-install, npm run bundle).  The npm dependency tree is large and \
includes native Node.js addons.  Attempted approaches: (1) use \
node-build-system — insufficient for complex npm projects with native deps; \
(2) extract npm bundle — bundling requires running npm in build environment; \
(3) use prebuilt binary — no standalone binary releases available."))

;; 14. qt-web-extractor (#3202): needs PySide6 + Qt6 WebEngine
(define-public qt-web-extractor-blocked-note
  (make-blocked-note "qt-web-extractor"
    "BLOCKED: Qt Web Extractor is a Python application using PySide6 and \
Qt6 WebEngine.  PySide6 is not packaged in Guix (it requires the full Qt6 \
source tree to build its bindings).  Attempted approaches: (1) use \
pyproject-build-system — fails because PySide6 is not available; (2) use \
PyQt6 instead — would require patching the application; (3) package PySide6 \
first — extremely complex, requires building against full Qt6 source."))

;; 15. planarally-bin (#3197): Python server, not a real binary
(define-public planarally-bin-blocked-note
  (make-blocked-note "planarally-bin"
    "BLOCKED: PlanarAlly 'binary' tarball is actually Python source code \
(a web server with Vue.js frontend), not a prebuilt binary.  Running it \
requires a Python environment with many dependencies (asyncio, aiohttp, \
etc.) and a built frontend.  Attempted approaches: (1) use copy-build-system \
with the tarball — it is source code, not runnable as-is; (2) build from \
source with pyproject-build-system — complex dependency tree and frontend \
build needed; (3) use Docker image — not compatible with Guix model."))
