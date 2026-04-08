;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260408t
;;; 15 packages re-evaluated with specific blocking reasons.

(define-module (gaurix packages recipe-resolver-260408t-blocked-notes))

;;; ── nordvpn-gui-bin ────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: proprietary NordVPN GUI (nordvpn.com)
;;; Language: Electron/JavaScript (proprietary)
;;; License: Proprietary
;;; Blocker: NordVPN GUI is proprietary software with no publicly
;;;   redistributable binary URL.  Downloads require authentication
;;;   through the NordVPN website or package repository.
;;; A1: Checked NordVPN downloads page — requires login/subscription.
;;; A2: Checked AUR PKGBUILD — sources from nordvpn.com deb repo
;;;   which requires adding proprietary APT key/source.
;;; A3: No AppImage, Flatpak, or standalone binary available.
;;; Verdict: BLOCKED — proprietary, no redistributable download URL.

;;; ── aurutils-git ───────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: https://github.com/AladW/aurutils
;;; Language: Bash/Shell
;;; License: ISC
;;; Blocker: aurutils is an Arch Linux-specific tool that wraps pacman
;;;   and makepkg.  It requires pacman, makepkg, and access to AUR
;;;   repositories — none of which exist on Guix System.
;;; A1: aurutils is fundamentally tied to the Arch package ecosystem.
;;; A2: No equivalent functionality is possible without pacman.
;;; A3: Not applicable to Guix System at all.
;;; Verdict: BLOCKED — Arch-specific tool, incompatible with Guix.

;;; ── octopi-git ─────────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: https://github.com/nicehash/octopi
;;; Language: C++/Qt5
;;; License: GPL-2.0
;;; Blocker: Octopi is a graphical frontend for pacman (Arch Linux
;;;   package manager).  It depends on libalpm and pacman internals
;;;   which do not exist on Guix.
;;; A1: Requires libalpm (pacman library) — not in Guix.
;;; A2: Entire purpose is Arch package management — no use on Guix.
;;; A3: Cannot be adapted to use Guix package manager.
;;; Verdict: BLOCKED — Arch-specific pacman frontend.

;;; ── parui-git ──────────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: https://github.com/Morganamilo/parui
;;; Language: Rust
;;; License: GPL-3.0
;;; Blocker: parui is a TUI frontend for paru/pacman (Arch User
;;;   Repository helper).  It requires paru or pacman, which are
;;;   Arch-specific tools not available on Guix.
;;; A1: Depends on paru (AUR helper) — Arch-specific.
;;; A2: Cargo build with vendored crates needed.
;;; A3: Even if built, unusable without pacman ecosystem.
;;; Verdict: BLOCKED — Arch-specific AUR helper frontend.

;;; ── mangowm-git ────────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: https://github.com/mangowm/mangowm.github.io
;;; Language: C (Wayland compositor)
;;; License: Unknown
;;; Blocker: MangoWM is a Wayland compositor based on wlroots and
;;;   scenefx.  scenefx is a wlroots rendering extension not packaged
;;;   in Guix.  The project appears to be in early development with
;;;   no stable releases and only a GitHub Pages site.
;;; A1: Requires scenefx (not in Guix) — wlroots fork/extension.
;;; A2: No tagged releases or source tarballs.
;;; A3: Depends on wlroots-specific APIs that may conflict with
;;;   Guix's wlroots version.
;;; Verdict: BLOCKED — needs scenefx (not in Guix), no releases.

;;; ── caelestia-shell-git ────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: https://github.com/nicehash/caelestia-shell
;;; Language: QML/JavaScript (KDE Plasma shell)
;;; License: GPL-3.0
;;; Blocker: Caelestia Shell is a fork/extension of KDE Plasma Shell.
;;;   It requires the full KDE Frameworks 6 + Plasma 6 stack (50+
;;;   packages), most of which are not packaged in Guix.
;;; A1: Requires kf6-* (KDE Frameworks 6) — not in Guix.
;;; A2: Requires plasma-desktop and plasma-workspace — massive dep tree.
;;; A3: Would need ~50 new packages before this could be built.
;;; Verdict: BLOCKED — massive KDE Plasma 6 dependency tree.

;;; ── android_translation_layer-git ──────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: https://github.com/nicehash/android_translation_layer
;;; Language: C/C++
;;; License: GPL-3.0
;;; Blocker: Android Translation Layer requires Android runtime
;;;   libraries (bionic libc, binder IPC, art/dalvik VM), which are
;;;   deeply integrated with the Android OS and cannot be built on
;;;   a standard GNU/Linux system without extensive cross-compilation
;;;   infrastructure.
;;; A1: Requires bionic (Android libc) — not in Guix.
;;; A2: Requires Android binder kernel module.
;;; A3: Complex multi-stage build with Android NDK.
;;; Verdict: BLOCKED — requires Android runtime infrastructure.

;;; ── lceda-pro-bin ──────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: https://lceda.cn (EasyEDA Pro)
;;; Language: Electron/JavaScript
;;; License: Proprietary
;;; Blocker: LCEDA Pro (EasyEDA Pro Chinese edition) is proprietary
;;;   electronics design software.  Downloads require registration
;;;   on the Chinese LCEDA platform.  No publicly redistributable
;;;   binary URL is available.
;;; A1: Checked lceda.cn — requires registration to download.
;;; A2: No GitHub releases or public mirrors.
;;; A3: Proprietary license prohibits redistribution.
;;; Verdict: BLOCKED — proprietary, no redistributable URL.

;;; ── feishu-bin ─────────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: https://www.feishu.cn (Lark/Feishu by ByteDance)
;;; Language: Electron/JavaScript
;;; License: Proprietary
;;; Blocker: Feishu (Lark China edition) is proprietary collaboration
;;;   software by ByteDance.  The Linux .deb is available from
;;;   feishu.cn but requires accepting proprietary terms and the
;;;   download URL includes authentication tokens that expire.
;;; A1: Download URL requires active session on feishu.cn.
;;; A2: No static download URL or GitHub releases.
;;; A3: Proprietary license prohibits redistribution.
;;; Verdict: BLOCKED — proprietary, no stable download URL.

;;; ── shutter-encoder-bin ────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: https://github.com/paulpacifico/shutter-encoder
;;; Language: Java
;;; License: GPL-3.0
;;; Blocker: Shutter Encoder is a Java video transcoding tool.  While
;;;   the source is GPL-3.0, the GitHub releases contain no Linux
;;;   binary assets (latest release v20.0 has zero assets).  The
;;;   website offers a download but it requires building from source
;;;   with complex FFmpeg/JavaFX dependencies.
;;; A1: GitHub releases have no Linux binary (v20.0: 0 assets).
;;; A2: Website download is a Windows-focused installer.
;;; A3: Source build requires JavaFX (not in Guix) + bundled FFmpeg.
;;; Verdict: BLOCKED — no Linux binary, JavaFX not in Guix.

;;; ── opendeck-git ───────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: unknown (no GitHub repository found)
;;; Language: unknown
;;; License: unknown
;;; Blocker: No GitHub repository matching "opendeck" for a Stream
;;;   Deck alternative could be located.  The StreamDeckCommunity/OpenDeck
;;;   repo does not exist, and no other matching project was found.
;;; A1: GitHub search for "opendeck" — no matching project.
;;; A2: StreamDeckCommunity org has no OpenDeck repo.
;;; A3: Project may be abandoned or renamed.
;;; Verdict: BLOCKED — no upstream source found.

;;; ── savestate-bin ──────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: https://github.com/Matteo842/SaveState
;;; Language: C# (.NET/WPF)
;;; License: MIT
;;; Blocker: SaveState is a Windows-focused game save backup manager
;;;   built with .NET WPF.  It is a Windows desktop application with
;;;   no Linux support, no AppImage, and no cross-platform build.
;;; A1: WPF is Windows-only UI framework — no Linux port.
;;; A2: No Linux binary releases on GitHub.
;;; A3: .NET WPF cannot be cross-compiled to Linux.
;;; Verdict: BLOCKED — Windows-only application (WPF).

;;; ── tosu-overlay-git ───────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: https://github.com/K4zoku/tosu-overlay-qt
;;; Language: C++/Qt6 + Qt6 WebEngine
;;; License: unknown
;;; Blocker: tosu-overlay is a Qt6 + Qt6 WebEngine overlay for osu!
;;;   game statistics.  It requires Qt6 WebEngine (Chromium-based,
;;;   not in Guix) and is specific to the osu! game ecosystem.
;;; A1: Requires Qt6 WebEngine — not in Guix (Chromium-based).
;;; A2: Requires tosu (osu! stats server) as runtime dependency.
;;; A3: Niche gaming overlay with limited utility outside osu!.
;;; Verdict: BLOCKED — Qt6 WebEngine not in Guix.

;;; ── python-urllib3-future ──────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: https://pypi.org/project/urllib3-future/ (v2.19.903)
;;; Language: Python
;;; License: MIT
;;; Blocker: urllib3-future is a fork of urllib3 with HTTP/2 and HTTP/3
;;;   support.  It depends on h11, jh2, and qh3 — three Python packages
;;;   not available in Guix.  qh3 requires QUIC protocol support and
;;;   has native C extensions.
;;; A1: Requires python-h11 — not in Guix.
;;; A2: Requires python-jh2 — not in Guix.
;;; A3: Requires python-qh3 (QUIC) — not in Guix, has C extensions.
;;; Verdict: BLOCKED — 3 missing Python deps (h11, jh2, qh3).

;;; ── python-niquests ────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408t
;;; Upstream: https://pypi.org/project/niquests/ (v3.18.4)
;;; Language: Python
;;; License: Apache-2.0
;;; Blocker: niquests is a drop-in replacement for python-requests with
;;;   HTTP/2 and HTTP/3 support.  It depends on urllib3-future (blocked,
;;;   see above) and python-wassima (not in Guix).
;;; A1: Depends on urllib3-future — blocked (see above).
;;; A2: Depends on python-wassima — not in Guix.
;;; A3: Transitive dep chain includes h11, jh2, qh3 — all missing.
;;; Verdict: BLOCKED — depends on urllib3-future (blocked).
