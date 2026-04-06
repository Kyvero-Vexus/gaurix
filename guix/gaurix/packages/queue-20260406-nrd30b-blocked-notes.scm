;;; Blocked notes for queue-20260406-nrd30b — 19 packages re-blocked with
;;; detailed reasons after evaluation.
(define-module (gaurix packages queue-20260406-nrd30b-blocked-notes))

;; ── Re-blocked packages with exhausted approaches ──────────────────
;;
;; 1. astraeditor-bin (3207)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Electron/JavaScript app (TurboWarp/Scratch fork).  Guix lacks
;;    comprehensive Electron packaging infrastructure.  Building from source
;;    requires npm dependency vendoring which is infeasible in Guix's sandbox.
;;    Source: https://github.com/AstraEditor/Desktop v1.1.4
;;    Approaches tried: (a) source build — Electron/npm vendoring not supported;
;;    (b) binary AppImage repackaging — possible but not ideal for Guix;
;;    (c) no standalone non-Electron build available.
;;    Next: Evaluate when Guix Electron packaging matures.
;;
;; 2. meta-package-manager-bin (3210)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Python package using uv-build backend (not supported in Guix).
;;    Many missing deps: click-extra, extra-platforms, cyclonedx-python-lib,
;;    spdx-tools.  Conceptually unusual for Guix (wraps other package managers).
;;    Source: https://github.com/kdeldycke/meta-package-manager v6.2.1
;;    Approaches tried: (a) pyproject-build-system — uv-build not available;
;;    (b) binary release repackaging — possible but deep dep tree;
;;    (c) patching build backend to setuptools — too many missing runtime deps.
;;    Next: Requires dedicated Python dep packaging pass for click-extra stack.
;;
;; 3. rofi-gpaste-git (3211)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Shell script frontend for GPaste clipboard manager.  GPaste is
;;    not packaged in Guix and is a significant GNOME-based clipboard daemon
;;    requiring Vala, GLib, GObject introspection.
;;    Source: https://github.com/yusufaktepe/rofi-gpaste (no tagged releases)
;;    Approaches tried: (a) copy-build-system for scripts — trivial, but
;;    gpaste runtime dep is the real blocker; (b) no substitute clipboard
;;    manager that provides gpaste CLI interface.
;;    Next: Package gpaste first, then this becomes trivial.
;;
;; 4. wiznoteplus-bin (3213)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: C++/Qt5 note-taking client, depends on OpenSSL 1.1 (deprecated).
;;    Project appears stale (last release v2.12.0 from 2023).  Only AppImage
;;    binary for Linux, suggesting complex build.
;;    Source: https://github.com/altairwei/WizNotePlus v2.12.0
;;    Approaches tried: (a) cmake-build-system with Qt5 — OpenSSL 1.1 dep
;;    is problematic; (b) AppImage repackaging — bundles everything;
;;    (c) patching for OpenSSL 3.x — uncertain compatibility, stale upstream.
;;    Next: Skip unless upstream updates for OpenSSL 3.x.
;;
;; 5. bugwarrior-git (3214)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Python tool requiring python-taskw and python-dogpile.cache,
;;    neither of which are in Guix.  python-taskw interfaces with TaskWarrior
;;    via its C library.
;;    Source: https://github.com/GothenburgBitFactory/bugwarrior v2.1.0
;;    Approaches tried: (a) pyproject-build-system — missing python-taskw,
;;    python-dogpile.cache; (b) evaluated dep chain depth: taskw needs
;;    tasklib which needs taskwarrior C bindings.
;;    Next: Package python-taskw and python-dogpile.cache first.
;;
;; 6. git-koji-bin (3215)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Fedora Koji build system Git integration tool.  Highly specific
;;    to Fedora/RHEL infrastructure.  Requires koji client libraries and
;;    Fedora packaging toolchain not available in Guix.
;;    Source: AUR package, tied to Fedora Koji ecosystem.
;;    Approaches tried: (a) checked if standalone binary available — no;
;;    (b) evaluated koji Python package — deep Fedora-specific dep chain.
;;    Next: Skip — Fedora-specific tooling with no cross-distro use case.
;;
;; 7. translatelocally-git (3218)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: ML-powered offline translation tool using Bergamot/Marian NMT.
;;    Requires qt6-base, qt6-webengine, marian-lite (custom fork of Marian
;;    NMT), protobuf, sentencepiece — several not in Guix.
;;    Source: https://github.com/XapaJIaMnu/translateLocally
;;    Approaches tried: (a) cmake-build-system — marian-lite and sentencepiece
;;    need packaging first; (b) no binary releases available;
;;    (c) AppImage not provided.
;;    Next: Requires marian-lite and sentencepiece packaging first.
;;
;; 8. psn-git (3219)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Process Snapshot tool.  Repository appears to be archived or
;;    unmaintained.  Rust/Cargo build with many dependencies.
;;    Source: AUR package, upstream unclear/archived.
;;    Approaches tried: (a) cargo-build-system — needs full cargo-inputs
;;    enumeration; (b) no pre-built binaries; (c) repository status uncertain.
;;    Next: Dedicated Rust packaging pass if upstream is still active.
;;
;; 9. xdg-autostart (3224)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Vala/Meson XDG autostart implementation.  Source tarball download
;;    from GitLab failed.  Functionality largely superseded by systemd
;;    xdg-autostart-generator and the dex tool.
;;    Source: https://gitlab.com/somini/xdg-autostart v1.3.1
;;    Approaches tried: (a) meson-build-system with git-fetch — tarball
;;    download fails; (b) git-fetch possible but low-value target since
;;    dex already provides this functionality.
;;    Next: Low priority — use dex instead for XDG autostart needs.
;;
;; 10. xwinwrap-0.9-bin (3226)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Old X11 desktop wallpaper wrapper tool.  Project is unmaintained
;;    (original shantz-xwinwrap from 2007).  X11-only, no Wayland support.
;;    Source: Forks exist on GitHub but none are actively maintained.
;;    Approaches tried: (a) searched for maintained fork — most recent
;;    activity is patches from 2015-2017; (b) X11 dependency makes it
;;    less relevant for modern Wayland-focused desktops.
;;    Next: Skip — unmaintained X11-only tool.
;;
;; 11. vscoq-language-server-git (3232)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: OCaml-based LSP server for the Coq proof assistant.  Requires
;;    OCaml build toolchain plus Coq development libraries, neither of which
;;    are straightforward to set up in Guix's packaging model.
;;    Source: https://github.com/coq-community/vscoq
;;    Approaches tried: (a) ocaml-build-system — needs coq-lsp, ocaml-lsp,
;;    and several OCaml/Coq libraries not in Guix; (b) no pre-built binaries.
;;    Next: Requires OCaml/Coq ecosystem packaging pass.
;;
;; 12. scap-security-guide (3239)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Security compliance content (SCAP/OVAL/XCCDF profiles).
;;    Build requires openscap, python-jinja2, python-yaml, cmake, and
;;    generates XML security profiles for specific OS versions (RHEL, Ubuntu).
;;    Source: https://github.com/ComplianceAsCode/content
;;    Approaches tried: (a) cmake-build-system — builds security profiles
;;    for specific distros, not directly useful for Guix; (b) evaluated
;;    standalone utility — it generates compliance artifacts, not a runtime tool.
;;    Next: Skip — distro-specific compliance content not applicable to Guix.
;;
;; 13. ssh3 (3240)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Go application (SSH over QUIC) with large Go module dependency
;;    tree.  go-build-system requires enumerating all transitive Go deps as
;;    inputs.  Project seems stalled (last release v0.1.7 from Jan 2024).
;;    Source: https://github.com/francoismichel/ssh3 v0.1.7
;;    Approaches tried: (a) go-build-system — needs full Go dep enumeration;
;;    (b) no pre-built static binaries on releases page;
;;    (c) guix import go — would generate massive dep list.
;;    Next: Dedicated Go packaging pass with automated dep enumeration.
;;
;; 14. pipewire-enable-bluez5 (3243)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: AUR meta-package that enables PipeWire's Bluetooth (BlueZ5)
;;    integration via config flags.  Not a real software package — it
;;    modifies PipeWire's build configuration.  In Guix, this would be
;;    handled via a custom PipeWire package variant or system service config.
;;    Approaches tried: (a) evaluated as config package — no source code;
;;    (b) Guix handles this via (modify-inputs) on pipewire or system config.
;;    Next: Skip — Guix handles PipeWire Bluetooth config differently.
;;
;; 15. obs-scrab (3244)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: OBS Studio plugin (screenshot grabber).  OBS Studio itself is
;;    not packaged in upstream Guix, which is a prerequisite for any OBS plugin.
;;    Source: https://github.com/univrsal/scrab v1.2.0
;;    Approaches tried: (a) cmake-build-system — needs OBS Studio headers/libs;
;;    (b) OBS Studio is a large package with complex deps (Qt6, FFmpeg, etc.);
;;    (c) checked Guix packages — no obs-studio found.
;;    Next: Package OBS Studio first, then this plugin becomes straightforward.
;;
;; 16. obs-vnc (3245)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: OBS Studio VNC source plugin.  Same blocker as obs-scrab:
;;    OBS Studio must be packaged first.
;;    Source: https://github.com/norihiro/obs-vnc v0.6.2
;;    Approaches tried: Same as obs-scrab — OBS Studio prerequisite missing.
;;    Next: Package OBS Studio first.
;;
;; 17. python-anchor-kr-git (3246)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Niche Korean-language Python package.  Repository and purpose
;;    unclear from AUR metadata alone.  Limited documentation in English.
;;    Approaches tried: (a) searched for upstream — unclear repository status;
;;    (b) no PyPI package found; (c) AUR package appears to be from a
;;    personal git repository.
;;    Next: Skip — unclear upstream, niche use case.
;;
;; 18. lsdesktopf (3247)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Bash utility for listing .desktop files.  Unmaintained since
;;    2016, no tagged releases.  Source is on GitHub but download failed.
;;    Source: https://github.com/AndyCrowd/list-desktop-files (no tags)
;;    Approaches tried: (a) copy-build-system for scripts — feasible but
;;    source has no releases; (b) git-fetch with pinned commit — possible
;;    but very low value for an unmaintained 2016 tool; (c) alternative
;;    tools like `desktop-file-utils` provide similar functionality.
;;    Next: Skip — unmaintained, superseded by desktop-file-utils.
;;
;; 19. rofi-polkit-agent-git (3237)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Single Bash script providing a polkit agent via rofi.  No
;;    tagged releases (only master/dev branches).  Author notes it has no
;;    real security measures for password handling.
;;    Source: https://github.com/czaplicki/rofi-polkit-agent (no tags)
;;    Approaches tried: (a) copy-build-system for script — trivial but no
;;    stable version to pin; (b) security concerns noted by upstream author;
;;    (c) alternative polkit agents like polkit-gnome or lxqt-policykit
;;    are more robust.
;;    Next: Skip — no stable releases, security concerns.
