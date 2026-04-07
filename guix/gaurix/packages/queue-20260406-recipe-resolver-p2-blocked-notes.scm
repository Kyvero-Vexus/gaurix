;;; Blocked notes for recipe-resolver pass 2 — 2026-04-06.
;;; 13 packages evaluated but not resolvable in this pass.
;;; 3 packages (libmodule, noto-fonts-cjk-fontconfig, wo-bin) found already
;;; resolved in cron-5a2fb251-r19-w01.scm / cron-5a2fb251-r20-w03.scm.
(define-module (gaurix packages queue-20260406-recipe-resolver-p2-blocked-notes))

;;; ─── BLOCKED: MISSING_CARGO_DEPS ────────────────────────────────────────
;;; These Rust packages need vendored cargo dependencies not yet in Guix.
;;;
;;; 3066. docx-you-want (v0.1.2, github.com/MikeWalrus/docx-you-want)
;;;   → PDF-to-DOCX converter; needs cargo deps + inkscape runtime dep.
;;;
;;; 3075. dpibreak (v0.6.0, github.com/Dilluti0n/DPIBreak)
;;;   → DPI circumvention tool; needs cargo deps + nftables + libnetfilter_queue.
;;;
;;; 3077. dpibreak-git (same upstream as dpibreak)
;;;   → Git tracking variant; same deps as dpibreak.
;;;
;;; 3055. gnix (v2.4.1, codeberg.org/metamuffin/gnix)
;;;   → HTTP/QUIC reverse proxy; needs cargo deps for HTTP/2+3 support.
;;;
;;; 3047. op-cache-git (no releases, github.com/crmne/op-cache)
;;;   → 1Password CLI caching proxy; very early stage (~4 commits),
;;;     tracks non-default branch, needs cargo deps.
;;;

;;; ─── BLOCKED: NEEDS_NIGHTLY_RUST ────────────────────────────────────────
;;;
;;; 3060. udiskr (v0.1.1, github.com/uriib/udiskr)
;;;   → Lightweight udisks2 wrapper; needs nightly Rust + cargo deps + udisks2.
;;;

;;; ─── BLOCKED: MISSING_GO_DEPS ──────────────────────────────────────────
;;;
;;; 3068. cliamp (v1.34.1, github.com/bjarneo/cliamp)
;;;   → Retro TUI music player; Go with CGo (alsa-lib); needs go module vendoring.
;;;

;;; ─── BLOCKED: COMPLEX_BUILD_DEPS ───────────────────────────────────────
;;; These packages need multiple build tools not available in Guix.
;;;
;;; 3058. keks-meet-server (v1.1.0, codeberg.org/metamuffin/keks-meet)
;;;   → WebRTC signaling server; Rust+TS, needs cargo deps + esbuild + nightly.
;;;
;;; 3056. hurrycurry-server (v3.0.1, codeberg.org/hurrycurry/hurrycurry)
;;;   → Coop multiplayer game server; Rust+GDScript, needs cargo + deno + godot.
;;;
;;; 3057. jellything-git (no releases, codeberg.org/metamuffin/jellything)
;;;   → Media streaming server; Rust+TS, needs cargo + esbuild + nasm + meson.
;;;

;;; ─── BLOCKED: NEEDS_DOTNET_SDK ──────────────────────────────────────────
;;;
;;; 3074. wireview-linux (v1.0.4.0, github.com/emaspa/wireview-linux)
;;;   → Thermal Grizzly WireView Pro II Linux port; .NET 8.0 + Avalonia UI;
;;;     no standard license (contains decompiled code).
;;;

;;; ─── BLOCKED: ARCHIVED_UPSTREAM ─────────────────────────────────────────
;;;
;;; 3081. ipmctl-git (github.com/intel/ipmctl, archived 2026-03-09)
;;;   → Intel PMem controller CLI; cmake, needs edk2 submodule + 3 patches.
;;;

;;; ─── BLOCKED: MISSING_KDE6_DEPS ────────────────────────────────────────
;;;
;;; 3078. uac-polkit-agent-git (v6.6.1, github.com/aeroshell-desktop/uac-polkit-agent)
;;;   → KDE Plasma 6 polkit agent with UAC-style dialog; needs qt6 + kf6-* +
;;;     polkit-qt6 + extra-cmake-modules (KDE Frameworks 6 stack).
