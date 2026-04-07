;;; Blocked-notes for cron-c79f127f-r22-w03-nrd21.
;;; 21 packages re-blocked with specific reasons from NEEDS_RECIPE_DESIGN pass.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd21-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (subtui-git-blocked-note
            vscodium-translucent-features-blocked-note
            vscodium-translucent-marketplace-blocked-note
            claude-cowork-linux-blocked-note
            gochecker-blocked-note
            crql-anina-blocked-note
            ds360go-git-blocked-note
            tuistory-blocked-note
            smtk-obs-git-blocked-note
            gj-git-blocked-note
            yap-bin-blocked-note
            peergos-blocked-note
            shadps4-qtlauncher-bin-blocked-note
            winestreamproxy-blocked-note
            fcitx5-hazkey-bin-blocked-note
            hammer-editor-bin-blocked-note
            upnote-appimage-blocked-note
            uutils-diffutils-bin-blocked-note
            loliashizuku-bin-blocked-note
            lolia-cli-blocked-note
            reminduck-blocked-note))

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

;; ── No tagged releases / very early stage ───────────────────────

(define-public subtui-git-blocked-note
  (make-blocked-note "subtui-git"
    "BLOCKED: NO_STABLE_RELEASE — Go TUI music player for Subsonic \
servers (github.com/MattiaPun/SubTUI, MIT).  No tagged releases, \
only ~55 commits.  Go build system requires vendored modules with \
hashes.  Depends on mpv at runtime (available in Guix)."))

(define-public gochecker-blocked-note
  (make-blocked-note "gochecker"
    "BLOCKED: NO_STABLE_RELEASE — Go CLI version checker v0.0.2 \
(github.com/cilginc/gochecker, GPL-3.0).  Very early stage with \
only 2 pre-releases.  Go build system requires vendored module \
hashes.  Low maturity, revisit when project stabilizes."))

;; ── Arch-specific packages ──────────────────────────────────────

(define-public vscodium-translucent-features-blocked-note
  (make-blocked-note "vscodium-translucent-features"
    "BLOCKED: ARCH_SPECIFIC — pacman hook + Python patch script \
that unblocks features in VSCodium-Translucent by patching \
product.json on install/upgrade.  Entirely dependent on Arch \
Linux libalpm hook system.  No standalone utility outside Arch.  \
Depends on vscodium-translucent (not in Guix)."))

(define-public vscodium-translucent-marketplace-blocked-note
  (make-blocked-note "vscodium-translucent-marketplace"
    "BLOCKED: ARCH_SPECIFIC — pacman hook + Python patch script \
that enables VS Code Marketplace in VSCodium-Translucent.  Arch \
Linux libalpm-specific mechanism with no portable equivalent.  \
Depends on vscodium-translucent (not in Guix)."))

(define-public yap-bin-blocked-note
  (make-blocked-note "yap-bin"
    "BLOCKED: ARCH_SPECIFIC — Go CLI wrapper for yay (AUR helper) \
v1.0.1, GPL-3.0.  Hard dependency on yay which wraps pacman.  \
Entirely Arch Linux-specific, no applicability to Guix."))

;; ── Proprietary / nonfree ───────────────────────────────────────

(define-public crql-anina-blocked-note
  (make-blocked-note "crql-anina"
    "BLOCKED: NONFREE_LICENSE — proprietary VST3/CLAP audio plugin \
for spectral resonance suppression (crql.works/anina).  Binary-only \
distribution, no source code.  Download requires browser user-agent."))

(define-public claude-cowork-linux-blocked-note
  (make-blocked-note "claude-cowork-linux"
    "BLOCKED: NONFREE_LICENSE — repackages proprietary Claude Desktop \
macOS DMG for Linux via Electron patching.  Build process downloads \
binaries at build time, requires network access, patches proprietary \
code.  Fundamentally incompatible with Guix's reproducible model."))

(define-public upnote-appimage-blocked-note
  (make-blocked-note "upnote-appimage"
    "BLOCKED: NONFREE_LICENSE — proprietary commercial note-taking \
application (getupnote.com).  No source code available.  Distributed \
as an AppImage with a custom proprietary license."))

;; ── Missing dependencies / complex build ────────────────────────

(define-public ds360go-git-blocked-note
  (make-blocked-note "ds360go-git"
    "BLOCKED: MISSING_DEPENDENCY — Go xboxdrv wrapper for using \
DualSense as Xbox 360 controller (github.com/ugjka/ds360go, MIT).  \
No tagged releases.  Depends on xboxdrv which is not packaged in \
Guix.  Go build requires vendored module hashes."))

(define-public tuistory-blocked-note
  (make-blocked-note "tuistory"
    "BLOCKED: BUILD_SYSTEM_TOO_COMPLEX — npm-based TUI testing \
framework v0.0.16 (github.com/remorses/tuistory, MIT).  Node/npm \
ecosystem with native x86_64 binaries.  Guix node packaging requires \
full dependency tree resolution.  Very early stage."))

(define-public smtk-obs-git-blocked-note
  (make-blocked-note "smtk-obs-git"
    "BLOCKED: MISSING_DEPENDENCY — OBS Browser Source overlay for \
showmethekey (github.com/denizkose/smtk-obs, MIT).  Depends on \
bun (Zig-based JS runtime) which is not in Guix and is extremely \
complex to package.  Very early project (~4 commits)."))

(define-public gj-git-blocked-note
  (make-blocked-note "gj-git"
    "BLOCKED: NEEDS_CARGO_VENDORING — Rust CLI journaling tool \
v0.2.0 (github.com/efekrskl/gj, MIT).  Requires cargo-build-system \
with full crate dependency enumeration.  Functionally depends on \
Notion API key at runtime."))

(define-public peergos-blocked-note
  (make-blocked-note "peergos"
    "BLOCKED: BUILD_SYSTEM_TOO_COMPLEX — Java/Ant/Maven P2P secure \
file storage v1.20.0 (github.com/Peergos/Peergos, AGPL-3.0).  \
Complex Java build chain with many dependencies.  AUR distributes \
as pre-built JAR.  Source build requires full Maven ecosystem.  \
Needs JDK 21+."))

(define-public shadps4-qtlauncher-bin-blocked-note
  (make-blocked-note "shadps4-qtlauncher-bin"
    "BLOCKED: BINARY_APPIMAGE — Qt launcher GUI for shadPS4 PS4 \
emulator (github.com/shadps4-emu/shadps4-qtlauncher, GPL-2.0).  \
Distributed as AppImage only.  From-source build requires C++/Qt/ \
CMake and the shadPS4 emulator itself."))

(define-public winestreamproxy-blocked-note
  (make-blocked-note "winestreamproxy"
    "BLOCKED: CROSS_COMPILATION — Wine named pipe to Unix socket \
proxy v2.0.3 (github.com/openglfreak/winestreamproxy, MPL-2.0).  \
Requires mingw-w64-gcc cross-compilation to produce a Windows DLL \
alongside the native Linux component.  Cross-compilation setup in \
Guix is feasible but non-trivial to wire up."))

(define-public fcitx5-hazkey-bin-blocked-note
  (make-blocked-note "fcitx5-hazkey-bin"
    "BLOCKED: BINARY_COMPLEX_DEPS — Japanese IME for fcitx5 powered \
by azooKey engine v0.2.1 (github.com/7ka-Hiira/fcitx5-hazkey, MIT).  \
Binary repack only.  From-source build requires azooKey engine and \
potentially ggml/LLM inference libraries not in Guix."))

(define-public hammer-editor-bin-blocked-note
  (make-blocked-note "hammer-editor-bin"
    "BLOCKED: BUILD_SYSTEM_TOO_COMPLEX — interactive story editor \
v2.1.3 (github.com/Wavesonics/hammer-editor, MIT).  Binary repack \
from .deb.  Upstream is Kotlin Multiplatform (JVM/Desktop) which \
requires Gradle and extensive JVM toolchain not available in Guix."))

(define-public uutils-diffutils-bin-blocked-note
  (make-blocked-note "uutils-diffutils-bin"
    "BLOCKED: NEEDS_CARGO_VENDORING — Rust reimplementation of GNU \
diffutils v0.5.0 (github.com/uutils/diffutils, Apache-2.0/MIT).  \
Requires cargo-build-system with full crate dependency enumeration.  \
Large Rust codebase with many dependencies."))

(define-public loliashizuku-bin-blocked-note
  (make-blocked-note "loliashizuku-bin"
    "BLOCKED: BUILD_SYSTEM_TOO_COMPLEX — Wails desktop client for \
Lolia FRP v0.0.2 (github.com/Mxmilu666/LoliaShizuku, MIT).  \
Requires Go + Node.js + WebKit (Wails framework).  Guix lacks \
Wails build system support.  Very early stage."))

(define-public lolia-cli-blocked-note
  (make-blocked-note "lolia-cli"
    "BLOCKED: BUILD_SYSTEM_TOO_COMPLEX — Go CLI client for Lolia \
FRP v0.67.4 (github.com/Lolia-FRP/lolia-frp, Apache-2.0).  Go \
build with npm step for web UI assets.  Requires both Go module \
vendoring and npm dependency resolution."))

(define-public reminduck-blocked-note
  (make-blocked-note "reminduck"
    "BLOCKED: MISSING_DEPENDENCY — GTK4/Granite reminder app v2.3.1.5 \
(github.com/elly-code/reminduck, GPL-3.0+).  Meson/Vala build.  \
Depends on granite7 (elementary OS library) which is not packaged \
in Guix.  GTK4, sqlite, Vala compiler are available."))
