;;; Blocked notes for queue-20260325p100e queue drain (2026-03-25 pass-e, packages 5446-5525).
;;; 0 Guix upstream aliases found.
;;; 80 NEEDS_RECIPE_DESIGN stubs.
(define-module (gaurix packages queue-20260325p100e-blocked-notes)
  #:export (queue-20260325p100e-blocked-notes))

(define queue-20260325p100e-blocked-notes
  (list

  ;; ── All 80 NEEDS_RECIPE_DESIGN ────────────────────────────────────────

  '(linux-clear-cjktty-zfs-headers BLOCKED
    "Source: https://git.staropensource.de/StarOpenSource/Linux-Tachyon (AUR linux-clear-cjktty-zfs-headers)"
    "Attempt 1: checked AUR linux-clear-cjktty-zfs-headers git repo; no standalone packaging content available"
    "Attempt 2: inspected linux-clear-cjktty-zfs PKGBUILD split package; -headers artifacts are emitted from one monolithic kernel build"
    "Attempt 3: cloned Linux-Tachyon upstream; repository is patchset/scripts only (no kernel tree), with submodule-driven tooling"
    "Blocked pending full linux-build-system port of the Tachyon+ZFS+CJK stack")

  '(linux-clear-cjktty-zfs BLOCKED
    "Source: https://git.staropensource.de/StarOpenSource/Linux-Tachyon (AUR linux-clear-cjktty-zfs)"
    "Attempt 1: surveyed upstream Guix equivalents (linux-libre/linux-libre-headers); no clear+zfs+cjktty equivalent exists"
    "Attempt 2: inspected AUR PKGBUILD; recipe expects large multi-file patch stack and integrated ZFS kernel build path"
    "Attempt 3: cloned Linux-Tachyon upstream; patchset repository requires extra scripting/submodules and does not directly map to current queue recipe style"
    "Blocked pending a dedicated kernel packaging pass (linux-build-system + patch orchestration)")

  '(clightd NEEDS_RECIPE_DESIGN
    "Source: https://github.com/FedeDP/Clightd v5.9"
    "cmake C recipe; deps: libddcutil, udev, pipewire, polkit; D-Bus interface"
    "Next: fetch clightd-5.9 tarball, compute sha256, draft cmake recipe with udev rules")

  '(libmodule NEEDS_RECIPE_DESIGN
    "Source: https://github.com/FedeDP/libmodule v5.0.2"
    "cmake C library; companion to clightd; minimal deps"
    "Next: fetch libmodule-5.0.2 tarball, compute sha256, draft cmake library recipe")

  '(mas NEEDS_RECIPE_DESIGN
    "Source: http://john.ccac.rwth-aachen.de:8000/as/ v1.42b300"
    "C make recipe; macro cross-assembler for multiple processor architectures"
    "Next: fetch asl source tarball, compute sha256, draft make recipe")

  '(wrkflw-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/bahdotsh/wrkflw v0.7.3"
    "Binary wrapper; Rust binary; fetch Linux amd64 binary from GitHub releases"
    "Next: fetch wrkflw v0.7.3 Linux binary, compute sha256, draft binary wrapper")

  '(iwmenu-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/e-tho/iwmenu v0.4.0"
    "Binary wrapper; launcher-driven Wi-Fi manager; fetch Linux amd64 from GitHub"
    "Next: fetch iwmenu v0.4.0 Linux binary, compute sha256, draft binary wrapper")

  '(pwmenu-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/e-tho/pwmenu v0.4.0"
    "Binary wrapper; launcher-driven audio manager; fetch Linux amd64 from GitHub"
    "Next: fetch pwmenu v0.4.0 Linux binary, compute sha256, draft binary wrapper")

  '(bzmenu-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/e-tho/bzmenu v0.4.0"
    "Binary wrapper; launcher-driven Bluetooth manager; fetch Linux amd64 from GitHub"
    "Next: fetch bzmenu v0.4.0 Linux binary, compute sha256, draft binary wrapper")

  '(claude-code-seccomp NEEDS_RECIPE_DESIGN
    "Source: https://github.com/anthropic-experimental/sandbox-runtime v0.0.35"
    "C library recipe; seccomp filter for Claude Code sandbox; deps: libseccomp"
    "Next: fetch sandbox-runtime v0.0.35 source, compute sha256, draft C library recipe")
  '(ferris-scan-bin DONE
    "Packaged in queue-20260325p100e.scm as binary wrapper from GitHub releases (v0.25)"
    "Validation: guix build -L guix -n ferris-scan-bin; guix lint -L guix ferris-scan-bin; full build succeeded"
    "Includes both ferris-scan-tui and ferris-scan-gui binaries with ferris-scan symlink")
  '(gram-editor-bin DONE
    "Packaged in queue-20260325p100e.scm from Codeberg release tarball (v1.2.0)"
    "Validation: guix build -L guix -n gram-editor-bin; guix lint -L guix gram-editor-bin; full build succeeded"
    "Installs gram binary, libexec helper, desktop file, and icons")
  '(bapctools-git DONE
    "Packaged in queue-20260325p100e.scm from pinned source snapshot (16e23ee...)"
    "Validation: guix build -L guix -n bapctools-git; guix lint -L guix bapctools-git; full build succeeded"
    "Installs tool tree to share/bapctools with bt/bapctools symlinks and Python propagated inputs")
  '(sabiql-bin DONE
    "Packaged in queue-20260325p100e.scm from upstream Linux binary tarball (v1.9.1)"
    "Validation: guix build -L guix -n sabiql-bin; guix lint -L guix sabiql-bin; full build succeeded"
    "Installs sabiql binary to /bin")
  '(podserv-b-git DONE
    "Packaged in queue-20260325p100e.scm from upstream release binary (v0.1.2)"
    "Validation: guix build -L guix -n podserv-b-git; guix lint -L guix podserv-b-git; full build succeeded"
    "AUR compatibility name retained while packaging upstream binary artifact")
  '(netwatch-tui BLOCKED
    "Source: https://github.com/matthart1983/netwatch v0.8.0"
    "Exhausted 3 approaches: guix import crate (fails: missing module semver ranges), binary release route (no release assets), manual cargo skeleton (offline resolution fails at atomic-waker without full cargo graph)"
    "Kept BLOCKED stub in queue-20260325p100e.scm with detailed attempt notes")
  '(synergy3-bin DONE
    "Resolved via upstream equivalent: Guix package synergy"
    "Validation: guix build -L guix -n synergy3-bin; guix lint -L guix synergy3-bin; full build resolves to store path"
    "Implemented as compatibility alias inheriting synergy in queue-20260325p100e.scm")
  '(q5k-usb-udev DONE
    "Packaged in queue-20260325p100e.scm as trivial udev-rules installer from pinned gist raw URL"
    "Validation: guix build -L guix -n q5k-usb-udev; guix lint -L guix q5k-usb-udev (small-file warning); full build succeeded"
    "Installs 99-qudelix.rules under lib/udev/rules.d")
  '(qpdf-zopfli DONE
    "Resolved via upstream equivalent: Guix package qpdf with zopfli enabled in variant package"
    "Validation: guix build -L guix -n qpdf-zopfli and guix lint -L guix qpdf-zopfli succeeded for recipe checks"
    "Full build attempted but stalled in this environment waiting for big garbage collector lock")

  '(swhook NEEDS_RECIPE_DESIGN
    "Source: https://github.com/AndyLocks/swhook v0.0.3"
    "cargo build recipe; deps: rust; minimalistic webhook server"
    "Next: fetch swhook v0.0.3 source, compute sha256, draft cargo recipe")

  '(libavif-noglycin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/AOMediaCodec/libavif v1.3.0"
    "cmake C recipe variant; noglycin gdk-pixbuf2 dep; AVIF encoder/decoder"
    "Next: fetch libavif-1.3.0 source, compute sha256, draft cmake recipe with noglycin dep")

  '(libheif-noglycin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/strukturag/libheif v1.21.2"
    "cmake C++ recipe variant; noglycin gdk-pixbuf2 dep; HEIF/AVIF codec"
    "Next: fetch libheif-1.21.2 source, compute sha256, draft cmake recipe with noglycin dep")

  '(libjxl-noglycin-doc NEEDS_RECIPE_DESIGN
    "Source: https://jpeg.org/jpegxl/ v0.11.2"
    "cmake docs subpackage; companion to libjxl-noglycin; dep: libjxl-noglycin"
    "Next: fetch libjxl-0.11.2 source, compute sha256, draft cmake docs-only subpackage")

  '(libjxl-noglycin NEEDS_RECIPE_DESIGN
    "Source: https://jpeg.org/jpegxl/ v0.11.2"
    "cmake C++ recipe variant; deps: brotli, highway; noglycin gdk-pixbuf2"
    "Next: fetch libjxl-0.11.2 source, compute sha256, draft cmake recipe with noglycin dep")

  '(op-cache-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/crmne/op-cache v0"
    "cargo or Go recipe; caching proxy for 1Password CLI op read; dep: 1password-cli"
    "Next: pin git commit, compute sha256, determine build system (Rust/Go), draft recipe")

  '(console2svg-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/arika0093/console2svg v0.6.4"
    "Binary wrapper; converts terminal output to SVG; fetch Linux binary from GitHub"
    "Next: fetch console2svg v0.6.4 Linux binary, compute sha256, draft binary wrapper")

  '(szsol-rs NEEDS_RECIPE_DESIGN
    "Source: https://github.com/ghoker143/szsol-rs v1.0.1"
    "cargo build recipe; deps: rust, crossterm; Solitaire TUI game"
    "Next: fetch szsol-rs v1.0.1 source, compute sha256, draft cargo recipe")

  '(arch-remaster NEEDS_RECIPE_DESIGN
    "Source: https://github.com/AdrianTM/arch-remaster v26.02.1"
    "Shell script recipe; deps: squashfs-tools, xorriso, grub; Arch live remaster tools"
    "Next: fetch arch-remaster 26.02.1, compute sha256, draft trivial script install")

  '(pixora-icons-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/tsora1603/pixora-icons r264.gf5604c1"
    "Trivial icon theme install; 16-bit pixel art icons; pin git commit"
    "Next: pin git rev, compute sha256, draft trivial icon theme install")

  '(udiskr NEEDS_RECIPE_DESIGN
    "Source: https://github.com/uriib/udiskr v0.1.1"
    "cargo build recipe; deps: rust, udisks2; lightweight udiskie alternative"
    "Next: fetch udiskr v0.1.1 source, compute sha256, draft cargo recipe")

  '(comp-scan-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/vvk147/comp-scan v0.1.0"
    "Binary wrapper; local AI system scanner; fetch Linux amd64 binary from GitHub"
    "Next: fetch comp-scan v0.1.0 Linux binary, compute sha256, draft binary wrapper")

  '(tilem-gtk3-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/kuba160/tilem-gtk3 r7.e36102e"
    "cmake/autotools C+GTK3 recipe; TI calculator emulator; deps: gtk3, glib, SDL"
    "Next: pin git rev, compute sha256, draft cmake C+GTK3 recipe")

  '(r47-bin NEEDS_RECIPE_DESIGN
    "Source: https://47calc.com v00.109.03.01b1 (proprietary)"
    "Binary wrapper; proprietary R47 calculator emulator; fetch Linux binary from 47calc.com"
    "Next: fetch R47 Linux binary, compute sha256, draft binary wrapper")

  '(docx-you-want NEEDS_RECIPE_DESIGN
    "Source: https://github.com/MikeWalrus/docx-you-want v0.1.2"
    "cargo build recipe; PDF-to-DOCX converter; deps: rust, poppler or pdfium"
    "Next: fetch docx-you-want v0.1.2 source, compute sha256, draft cargo recipe")

  '(c47-bin NEEDS_RECIPE_DESIGN
    "Source: https://47calc.com v00.109.03.01b1 (proprietary)"
    "Binary wrapper; proprietary C47 calculator emulator; fetch Linux binary from 47calc.com"
    "Next: fetch C47 Linux binary, compute sha256, draft binary wrapper")

  '(wo-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/antham/wo v1.0.0"
    "Binary wrapper; Go binary; workspace shell manager; fetch Linux amd64 from GitHub"
    "Next: fetch wo v1.0.0 Linux binary, compute sha256, draft binary wrapper")

  '(cliamp NEEDS_RECIPE_DESIGN
    "Source: https://github.com/bjarneo/cliamp v1.27.2"
    "node.js/npm recipe; retro terminal music player; deps: node, npm, audio libs"
    "Next: fetch cliamp v1.27.2 from npm/GitHub, compute sha256, draft node recipe")

  '(oken-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/linkwithjoydeep/oken v0.3.8"
    "Binary wrapper; smarter SSH CLI with fuzzy host picker; fetch Linux amd64 from GitHub"
    "Next: fetch oken v0.3.8 Linux binary, compute sha256, draft binary wrapper")

  '(lazytail-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/raaymax/lazytail v0.9.0"
    "Binary wrapper; fast universal terminal log viewer; fetch Linux amd64 from GitHub"
    "Next: fetch lazytail v0.9.0 Linux binary, compute sha256, draft binary wrapper")

  '(funzzy-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/cristianoliveira/funzzy v1.5.0"
    "Binary wrapper; Rust binary; lightweight file watcher; fetch Linux amd64 from GitHub"
    "Next: fetch funzzy v1.5.0 Linux binary, compute sha256, draft binary wrapper")

  '(framework-control-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/ozturkkl/framework-control v0.5.1 (proprietary)"
    "Binary wrapper; proprietary Framework Laptop fan/battery/LED tool; fetch Linux binary"
    "Next: fetch framework-control v0.5.1 Linux binary, compute sha256, draft binary wrapper")

  '(baremetal-compiler-rt NEEDS_RECIPE_DESIGN
    "Source: https://github.com/llvm/llvm-project v22.1.1"
    "cmake cross-compile recipe; LLVM compiler-rt for ARM Cortex-M bare-metal targets"
    "Next: fetch llvm-project 22.1.1, compute sha256, draft cmake cross-compile recipe")

  '(dpibreak NEEDS_RECIPE_DESIGN
    "Source: https://github.com/dilluti0n/dpibreak v0.5.1"
    "cargo build recipe; deps: rust, libc; DPI circumvention tool"
    "Next: fetch dpibreak v0.5.1 source, compute sha256, draft cargo recipe")

  '(lobster NEEDS_RECIPE_DESIGN
    "Source: https://github.com/justchokingaround/lobster v4.6.2"
    "Shell script recipe; deps: mpv, yt-dlp, fzf, rofi/wofi; media streaming CLI"
    "Next: fetch lobster v4.6.2 script, compute sha256, draft trivial shell script install")

  '(dpibreak-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/Dilluti0n/DPIBreak r357.f5c4f03"
    "cargo build recipe (git); deps: rust, libc; git version of dpibreak"
    "Next: pin git rev, compute sha256, draft cargo recipe")

  '(uac-polkit-agent-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/aeroshell-desktop/uac-polkit-agent r30f6179"
    "cmake Qt/KDE recipe; UAC-style Polkit auth for AeroShell; deps: polkit, KDE Plasma"
    "Next: pin git commit, compute sha256, draft cmake KDE recipe")

  '(mezzotone-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/joaoheitorgarcia/Mezzotone v1.1.1"
    "Binary wrapper; Go binary; TUI image-to-ASCII converter; fetch Linux amd64 from GitHub"
    "Next: fetch Mezzotone v1.1.1 Linux binary, compute sha256, draft binary wrapper")

  '(ipmctl-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/intel/ipmctl v03.00.00.0485.2"
    "cmake C recipe; Intel Optane memory management; deps: libsafec, libndctl, ndctl"
    "Next: pin git rev, compute sha256, draft cmake recipe with ndctl deps")

  '(python-aiohttp-jinja2 NEEDS_RECIPE_DESIGN
    "Source: http://aiohttp-jinja2.aio-libs.org/ v1.6"
    "python-build-system; deps: python-aiohttp, python-jinja2; aiohttp.web template renderer"
    "Next: fetch aiohttp-jinja2 1.6 from PyPI, compute sha256, draft python recipe")

  '(pricehist NEEDS_RECIPE_DESIGN
    "Source: https://gitlab.com/chrisberkhout/pricehist v1.4.14"
    "python-build-system; deps: python-requests, python-lxml, python-click"
    "Next: fetch pricehist 1.4.14 from PyPI/GitLab, compute sha256, draft python recipe")

  '(fish-session NEEDS_RECIPE_DESIGN
    "Source: https://github.com/AtefR/fish-session v0.1.8"
    "Trivial Fish shell plugin install; deps: fish; session manager"
    "Next: fetch fish-session v0.1.8, compute sha256, draft trivial Fish plugin install")

  '(workz-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/rohansx/workz v0.8.0"
    "Binary wrapper; Git worktree manager; fetch Linux amd64 binary from GitHub"
    "Next: fetch workz v0.8.0 Linux binary, compute sha256, draft binary wrapper")

  '(omp-manager-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/marlocarlo/omp-manager v0.1.2"
    "Binary wrapper; Oh My Posh installation manager; fetch Linux binary from GitHub"
    "Next: fetch omp-manager v0.1.2 Linux binary, compute sha256, draft binary wrapper")

  '(tmux-plugin-panel-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/marlocarlo/Tmux-Plugin-Panel v0.1.1"
    "Binary wrapper; TUI tmux plugin manager; fetch Linux binary from GitHub"
    "Next: fetch Tmux-Plugin-Panel v0.1.1 Linux binary, compute sha256, draft binary wrapper")

  '(spinwheel-pipewire NEEDS_RECIPE_DESIGN
    "Source: https://codeberg.org/the-traveler/spinwheel v0.1.0"
    "cargo build recipe; deps: rust, pipewire; terminal wheel spinner with audio mode"
    "Next: fetch spinwheel v0.1.0 source, compute sha256, draft cargo recipe with pipewire dep")

  '(compendium NEEDS_RECIPE_DESIGN
    "Source: https://crates.io/crates/compendium v0.2.0"
    "cargo build recipe; deps: rust, ptrace/seccomp; user-friendly strace with HTML reports"
    "Next: fetch compendium v0.2.0 from crates.io, compute sha256, draft cargo recipe")

  '(pandoc-crossref-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/lierdakil/pandoc-crossref/ v0.3.23.a"
    "Binary wrapper; Pandoc cross-reference filter; fetch Linux amd64 binary from GitHub"
    "Next: fetch pandoc-crossref v0.3.23a Linux binary, compute sha256, draft binary wrapper")

  '(boomer-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/tsoding/boomer r286.cc0f531"
    "nim recipe; deps: nim, OpenGL, X11; zoomer/magnifier application for Linux"
    "Next: pin git rev, compute sha256, draft nim build recipe")

  '(mkinitcpio-firmware NEEDS_RECIPE_DESIGN
    "Source: https://aur.archlinux.org/packages/mkinitcpio-firmware v1.6.0"
    "Firmware data install recipe; collects various firmware blobs for kernel initrd"
    "Next: identify firmware sources/versions, compute sha256s, draft firmware install recipe")

  '(qxmledit NEEDS_RECIPE_DESIGN
    "Source: https://qxmledit.org/ v0.9.18"
    "qmake Qt5 recipe; deps: qt5-base, qt5-xml, qt5-declarative; XML editor and XSD viewer"
    "Next: fetch qxmledit-0.9.18 source, compute sha256, draft qmake Qt5 recipe")

  '(tufw-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/peltho/tufw v0.2.7"
    "Go recipe; deps: go, ufw; terminal UI for ufw firewall management"
    "Next: pin git commit for v0.2.7, compute sha256, draft go-build-system recipe")

  '(adbfs-rootless-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/spion/adbfs-rootless r112.fd56381"
    "C make recipe; FUSE filesystem over ADB; deps: fuse, android-tools"
    "Next: pin git rev, compute sha256, draft C+fuse recipe")

  '(dafny-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/dafny-lang/dafny v4.11.0"
    "Binary wrapper; .NET self-contained binary; verification-aware language; fetch Linux x64"
    "Next: fetch Dafny 4.11.0 Linux x64 binary, compute sha256, draft binary wrapper")

  '(weylus-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/H-M-H/Weylus v0.11.4"
    "Binary wrapper; Rust binary; tablet-as-touchscreen; fetch Linux amd64 from GitHub"
    "Next: fetch Weylus v0.11.4 Linux binary, compute sha256, draft binary wrapper")

  '(zerx-lab-fluxdown-bin NEEDS_RECIPE_DESIGN
    "Source: https://fluxdown.zerx.dev v0.1.31"
    "Binary wrapper; Rust binary; multi-protocol download manager; fetch Linux amd64"
    "Next: fetch FluxDown v0.1.31 Linux binary, compute sha256, draft binary wrapper")

  '(bililive-recorder-bin DONE
    "Implemented trivial-build-system repack for BililiveRecorder CLI v2.17.3"
    "Installs upstream x86_64 zip payload under /lib with executable symlink in /bin"
    "Validation: guix build -L guix -f guix/gaurix/packages/queue-20260325p100e.scm -n bililive-recorder-bin; guix lint -L guix -f guix/gaurix/packages/queue-20260325p100e.scm bililive-recorder-bin")

  '(lenovo-print-driver-lj2400-m7400-bin DONE
    "Implemented proprietary Debian payload repack from AUR-pinned blob at commit 2ea87abde555df0367b9453b34e4885223bc7790"
    "Installs driver files, CUPS model/filter symlinks, and model-specific brprintconflsr3 wrappers"
    "Validation: guix build -L guix -f guix/gaurix/packages/queue-20260325p100e.scm -n lenovo-print-driver-lj2400-m7400-bin; guix lint -L guix -f guix/gaurix/packages/queue-20260325p100e.scm lenovo-print-driver-lj2400-m7400-bin")

  '(nodejs-knit BLOCKED
    "Source: https://github.com/coopbri/knit and npm @omnidev/knit 0.1.2"
    "Exhausted 3 approaches: direct npm tarball run (missing yargs), npm install --offline (ENOTCACHED), Guix node-* deps route (required node modules unavailable in current channels)"
    "Kept BLOCKED stub in queue-20260325p100e.scm with detailed attempt notes")

  '(fw-fanctrl-rs-git BLOCKED
    "Source: https://github.com/NexusXe/fw-ec-utils r106.g20b84a6"
    "Attempt 1: git-fetch + cargo-build-system prototype; checkout failed in build environment (git config access failure on /etc/gitconfig)"
    "Attempt 2: url-fetch tarball + cargo-build-system with package/workspace chdir and gexp flags; builder expansion failed (#<gexp ...> in generated builder)"
    "Attempt 3: url-fetch tarball + quoted cargo flags/manifest-path; cargo phase argument evaluation failed (wrong type to apply), still not producing a reliable workspace build"
    "Blocked pending a stable cargo packaging strategy for this workspace (and feature gating around unstable plugin-hash path)")

  '(aerothemeplasma-desktop-x11-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/aeroshell-desktop/aerothemeplasma r662.ra70f432"
    "cmake/kpackage recipe; X11 session for AeroThemePlasma; deps: KDE Plasma 6, AeroShell"
    "Next: pin git commit, compute sha256, draft cmake KDE Plasma recipe")

  '(aeroshell-workspace-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/aeroshell-desktop/aeroshell-workspace r2dff129"
    "cmake/kpackage recipe; AeroShell desktop components; deps: KDE Plasma 6, kwin"
    "Next: pin git commit, compute sha256, draft cmake KDE recipe")

  '(aeroshell-libplasma-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/aeroshell-desktop/libplasma r6aa6d2f0b"
    "cmake C++ recipe; Plasma library with AeroShell patches; full KDE build chain"
    "Next: pin git commit, compute sha256, draft cmake KDE Plasma library recipe")

  '(aeroshell-kwin-components-git NEEDS_RECIPE_DESIGN
    "Source: https://github.com/aeroshell-desktop/aeroshell-kwin-components r002e505"
    "cmake KDE recipe; KWin effects/scripts for AeroShell; deps: kwin, KDE Plasma 6"
    "Next: pin git commit, compute sha256, draft cmake KDE kwin plugin recipe")

  '(keks-meet-server NEEDS_RECIPE_DESIGN
    "Source: https://codeberg.org/metamuffin/keks-meet v1.1.0"
    "Server component recipe; determine build system (Rust/Node); secure conferencing server"
    "Next: fetch keks-meet v1.1.0 source, identify server build system, draft recipe")

  '(jellything-git NEEDS_RECIPE_DESIGN
    "Source: https://codeberg.org/metamuffin/jellything r997.823c0c6"
    "cargo build recipe; deps: rust, ffmpeg optional; media streaming server"
    "Next: pin git rev, compute sha256, draft cargo recipe")

  '(hurrycurry-server NEEDS_RECIPE_DESIGN
    "Source: https://codeberg.org/hurrycurry/hurrycurry v3.0.1"
    "Server component recipe; cooking game server; determine build system (Rust/Nim)"
    "Next: fetch hurrycurry v3.0.1 source, identify server build system, draft recipe")

  '(gnix NEEDS_RECIPE_DESIGN
    "Source: https://codeberg.org/metamuffin/gnix v2.4.1"
    "cargo build recipe; deps: rust, tokio/hyper; simple HTTP reverse proxy"
    "Next: fetch gnix v2.4.1 source, compute sha256, draft cargo recipe")

  '(mkbrr-gui-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/autobrr/mkbrr/ v1.19.0_rc1"
    "Binary wrapper; Electron/Go GUI binary; torrent file tool; fetch Linux binary from GitHub"
    "Next: fetch mkbrr-gui v1.19.0-rc1 Linux binary, compute sha256, draft binary wrapper")

  '(wireview-linux NEEDS_RECIPE_DESIGN
    "Source: https://github.com/emaspa/wireview-linux v1.0.4.0"
    "Binary or build recipe; Thermal Grizzly WireView Pro II Linux port; fetch from GitHub"
    "Next: fetch wireview-linux v1.0.4.0 source/binary, compute sha256, draft recipe")

  '(chough-bin NEEDS_RECIPE_DESIGN
    "Source: https://github.com/hyperpuncher/chough v1.0.0"
    "Binary wrapper; Rust binary; ASR CLI using Parakeet TDT; fetch Linux amd64 from GitHub"
    "Next: fetch chough v1.0.0 Linux binary, compute sha256, draft binary wrapper")

  ))
