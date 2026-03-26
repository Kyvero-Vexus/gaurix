;;; Queue drain 2026-03-25 pass-e (packages 5446-5525, 80 new entries).
;;; All 80 are NEEDS_RECIPE_DESIGN stubs; no Guix upstream aliases found.
;;; Note: entries 5348/5353/5363/5426/5430-5445 (20 items) were already stubbed
;;;       in queue-20260325p100d.scm and are marked BLOCKED in the org queue.
(define-module (gaurix packages queue-20260325p100e)
  #:use-module (guix packages)
  #:use-module (gnu packages rust-apps)
  #:export (
            linux-clear-cjktty-zfs-headers
            linux-clear-cjktty-zfs
            clightd
            libmodule
            mas
            wrkflw-bin
            iwmenu-bin
            pwmenu-bin
            bzmenu-bin
            claude-code-seccomp
            ferris-scan-bin
            gram-editor-bin
            bapctools-git
            sabiql-bin
            podserv-b-git
            netwatch-tui
            synergy3-bin
            q5k-usb-udev
            qpdf-zopfli
            swhook
            libavif-noglycin
            libheif-noglycin
            libjxl-noglycin-doc
            libjxl-noglycin
            op-cache-git
            console2svg-bin
            szsol-rs
            arch-remaster
            pixora-icons-git
            udiskr
            comp-scan-bin
            tilem-gtk3-git
            r47-bin
            docx-you-want
            c47-bin
            wo-bin
            cliamp
            oken-bin
            lazytail-bin
            funzzy-bin
            framework-control-bin
            baremetal-compiler-rt
            dpibreak
            lobster
            dpibreak-git
            uac-polkit-agent-git
            mezzotone-bin
            ipmctl-git
            python-aiohttp-jinja2
            pricehist
            fish-session
            workz-bin
            omp-manager-bin
            tmux-plugin-panel-bin
            spinwheel-pipewire
            compendium
            pandoc-crossref-bin
            boomer-git
            mkinitcpio-firmware
            qxmledit
            tufw-git
            adbfs-rootless-git
            dafny-bin
            weylus-bin
            zerx-lab-fluxdown-bin
            bililive-recorder-bin
            lenovo-print-driver-lj2400-m7400-bin
            nodejs-knit
            fw-fanctrl-rs-git
            aerothemeplasma-desktop-x11-git
            aeroshell-workspace-git
            aeroshell-libplasma-git
            aeroshell-kwin-components-git
            keks-meet-server
            jellything-git
            hurrycurry-server
            gnix
            mkbrr-gui-bin
            wireview-linux
            chough-bin
            ))

;;; ── NEEDS_RECIPE_DESIGN stubs ────────────────────────────────────────

(define-public linux-clear-cjktty-zfs-headers
  ;; AUR linux-clear-cjktty-zfs-headers: Clear Linux kernel +zfs+cjktty headers; v6.18.1-1; 2 votes.
  ;; Source: https://git.staropensource.de/StarOpenSource/Linux-Tachyon
  ;; NEEDS_RECIPE_DESIGN: custom kernel build; complex patch set (Clear+ZFS+CJK TTY).
  ;; Next: fetch kernel source + patches, compute sha256 set, draft linux-build-system recipe.
  (package (inherit zoxide) (name "linux-clear-cjktty-zfs-headers")))

(define-public linux-clear-cjktty-zfs
  ;; AUR linux-clear-cjktty-zfs: Clear Linux kernel +zfs+cjktty; v6.18.1-1; 2 votes.
  ;; Source: https://git.staropensource.de/StarOpenSource/Linux-Tachyon
  ;; NEEDS_RECIPE_DESIGN: custom kernel build; same patch set as headers variant.
  ;; Next: fetch kernel source + patch set, compute sha256s, draft linux-build-system recipe.
  (package (inherit zoxide) (name "linux-clear-cjktty-zfs")))

(define-public clightd
  ;; AUR clightd: D-Bus interface for screen brightness and frame capture; v5.9-1; 18 votes.
  ;; Source: https://github.com/FedeDP/Clightd
  ;; NEEDS_RECIPE_DESIGN: cmake C recipe; deps: libddcutil, udev, pipewire, polkit.
  ;; Next: fetch clightd-5.9 tarball, compute sha256, draft cmake recipe with udev rules.
  (package (inherit zoxide) (name "clightd")))

(define-public libmodule
  ;; AUR libmodule: C library for modular project design; v5.0.2-1; 10 votes.
  ;; Source: https://github.com/FedeDP/libmodule
  ;; NEEDS_RECIPE_DESIGN: cmake C library recipe; minimal deps; companion to clightd.
  ;; Next: fetch libmodule-5.0.2 tarball, compute sha256, draft cmake library recipe.
  (package (inherit zoxide) (name "libmodule")))

(define-public mas
  ;; AUR mas: Macro cross-assembler (asl) for various processors; v1.42b300-1; 3 votes.
  ;; Source: http://john.ccac.rwth-aachen.de:8000/as/
  ;; NEEDS_RECIPE_DESIGN: C make recipe; multi-architecture assembler.
  ;; Next: fetch asl source tarball, compute sha256, draft make recipe.
  (package (inherit zoxide) (name "mas")))

(define-public wrkflw-bin
  ;; AUR wrkflw-bin: Validate/execute GitHub Actions workflows locally (binary); v0.7.3-1; 1 vote.
  ;; Source: https://github.com/bahdotsh/wrkflw
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch wrkflw v0.7.3 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "wrkflw-bin")))

(define-public iwmenu-bin
  ;; AUR iwmenu-bin: Launcher-driven Wi-Fi manager for Linux (binary); v0.4.0-1; 1 vote.
  ;; Source: https://github.com/e-tho/iwmenu
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch iwmenu v0.4.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "iwmenu-bin")))

(define-public pwmenu-bin
  ;; AUR pwmenu-bin: Launcher-driven audio manager for Linux (binary); v0.4.0-1; 1 vote.
  ;; Source: https://github.com/e-tho/pwmenu
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch pwmenu v0.4.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "pwmenu-bin")))

(define-public bzmenu-bin
  ;; AUR bzmenu-bin: Launcher-driven Bluetooth manager for Linux (binary); v0.4.0-1; 1 vote.
  ;; Source: https://github.com/e-tho/bzmenu
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch bzmenu v0.4.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "bzmenu-bin")))

(define-public claude-code-seccomp
  ;; AUR claude-code-seccomp: seccomp filter dep for Claude Code /sandbox; v0.0.35-1; 1 vote.
  ;; Source: https://github.com/anthropic-experimental/sandbox-runtime
  ;; NEEDS_RECIPE_DESIGN: C library recipe; seccomp filter build; deps: libseccomp.
  ;; Next: fetch sandbox-runtime source, compute sha256, draft C library recipe.
  (package (inherit zoxide) (name "claude-code-seccomp")))

(define-public ferris-scan-bin
  ;; AUR ferris-scan-bin: Lightweight Rust-based file scanner (binary); v0.25-1; 1 vote.
  ;; Source: https://github.com/Vnilabean/ferris-scan
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch ferris-scan v0.25 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "ferris-scan-bin")))

(define-public gram-editor-bin
  ;; AUR gram-editor-bin: Code editor for humanoid apes and grumpy toads (binary); v1.1.0-4; 1 vote.
  ;; Source: https://codeberg.org/GramEditor/gram
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux binary from Codeberg releases.
  ;; Next: fetch gram-editor v1.1.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "gram-editor-bin")))

(define-public bapctools-git
  ;; AUR bapctools-git: Tools for ICPC-style contest problem development; r1310.16e23ee-1; 4 votes.
  ;; Source: https://github.com/RagnarGrootKoerkamp/BAPCtools
  ;; NEEDS_RECIPE_DESIGN: python-build-system; deps: python, checktestdata, optional: latex.
  ;; Next: pin git commit, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "bapctools-git")))

(define-public sabiql-bin
  ;; AUR sabiql-bin: Fast driverless TUI for PostgreSQL (binary); v1.8.2-1; 1 vote.
  ;; Source: https://github.com/riii111/sabiql
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Rust binary; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch sabiql v1.8.2 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "sabiql-bin")))

(define-public podserv-b-git
  ;; AUR podserv-b-git: Minimalist podcast server (type b); v0.1.2.r0.g536e372-1; 1 vote.
  ;; Source: https://github.com/l5yth/podserv-b
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust; serves media files over HTTP.
  ;; Next: pin git commit, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "podserv-b-git")))

(define-public netwatch-tui
  ;; AUR netwatch-tui: Real-time network diagnostics TUI; v0.3.5-2; 1 vote.
  ;; Source: https://github.com/matthart1983/netwatch
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust; like htop for network.
  ;; Next: fetch netwatch v0.3.5 source, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "netwatch-tui")))

(define-public synergy3-bin
  ;; AUR synergy3-bin: Share mouse/keyboard between computers v3 (proprietary binary); v3.6.0-1; 5 votes.
  ;; Source: https://symless.com/synergy (proprietary)
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; proprietary; fetch Linux binary from Symless.
  ;; Next: fetch Synergy 3.6.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "synergy3-bin")))

(define-public q5k-usb-udev
  ;; AUR q5k-usb-udev: Qudelix-5K USB udev rules; v2026.02.28-1; 1 vote.
  ;; Source: https://gist.github.com/hmtheboy154/21c0a25ff025667981a35b6656f7da69
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system udev rules install; minimal.
  ;; Next: fetch udev rules file from gist, compute sha256, draft trivial udev install.
  (package (inherit zoxide) (name "q5k-usb-udev")))

(define-public qpdf-zopfli
  ;; AUR qpdf-zopfli: QPDF PDF transformation system with Zopfli compression; v12.3.2-2; 1 vote.
  ;; Source: https://github.com/qpdf/qpdf
  ;; NEEDS_RECIPE_DESIGN: cmake C++ recipe with zopfli flag; deps: cmake, zlib, zopfli.
  ;; Next: fetch qpdf-12.3.2 source, compute sha256, draft cmake recipe with zopfli feature.
  (package (inherit zoxide) (name "qpdf-zopfli")))

(define-public swhook
  ;; AUR swhook: Minimalistic webhook server; v0.0.3-1; 1 vote.
  ;; Source: https://github.com/AndyLocks/swhook
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust.
  ;; Next: fetch swhook v0.0.3 source, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "swhook")))

(define-public libavif-noglycin
  ;; AUR libavif-noglycin: libavif for gdk-pixbuf2-noglycin variant; v1.3.0-5; 1 vote.
  ;; Source: https://github.com/AOMediaCodec/libavif
  ;; NEEDS_RECIPE_DESIGN: cmake C recipe variant; requires noglycin gdk-pixbuf2 dep.
  ;; Next: fetch libavif-1.3.0 source, compute sha256, draft cmake recipe with noglycin dep.
  (package (inherit zoxide) (name "libavif-noglycin")))

(define-public libheif-noglycin
  ;; AUR libheif-noglycin: libheif for gdk-pixbuf2-noglycin variant; v1.21.2-2; 1 vote.
  ;; Source: https://github.com/strukturag/libheif
  ;; NEEDS_RECIPE_DESIGN: cmake C++ recipe variant; requires noglycin gdk-pixbuf2 dep.
  ;; Next: fetch libheif-1.21.2 source, compute sha256, draft cmake recipe with noglycin dep.
  (package (inherit zoxide) (name "libheif-noglycin")))

(define-public libjxl-noglycin-doc
  ;; AUR libjxl-noglycin-doc: JPEG XL reference docs for noglycin variant; v0.11.2-2; 1 vote.
  ;; Source: https://jpeg.org/jpegxl/
  ;; NEEDS_RECIPE_DESIGN: cmake docs subpackage; dep: libjxl-noglycin.
  ;; Next: fetch libjxl-0.11.2 source, compute sha256, draft cmake docs-only recipe.
  (package (inherit zoxide) (name "libjxl-noglycin-doc")))

(define-public libjxl-noglycin
  ;; AUR libjxl-noglycin: JPEG XL for gdk-pixbuf2-noglycin variant; v0.11.2-2; 1 vote.
  ;; Source: https://jpeg.org/jpegxl/
  ;; NEEDS_RECIPE_DESIGN: cmake C++ recipe variant; deps: brotli, highway; noglycin gdk-pixbuf2.
  ;; Next: fetch libjxl-0.11.2 source, compute sha256, draft cmake recipe with noglycin dep.
  (package (inherit zoxide) (name "libjxl-noglycin")))

(define-public op-cache-git
  ;; AUR op-cache-git: Caching proxy for 1Password CLI op read; v0-1; 1 vote.
  ;; Source: https://github.com/crmne/op-cache
  ;; NEEDS_RECIPE_DESIGN: cargo or Go recipe; deps: 1password-cli.
  ;; Next: pin git commit, compute sha256, determine build system, draft recipe.
  (package (inherit zoxide) (name "op-cache-git")))

(define-public console2svg-bin
  ;; AUR console2svg-bin: Convert terminal output to SVG images (binary); v0.6.4-2; 1 vote.
  ;; Source: https://github.com/arika0093/console2svg
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux binary from GitHub releases.
  ;; Next: fetch console2svg v0.6.4 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "console2svg-bin")))

(define-public szsol-rs
  ;; AUR szsol-rs: Solitaire card game from SHENZHEN I/O with TUI; v1.0.1-1; 1 vote.
  ;; Source: https://github.com/ghoker143/szsol-rs
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust, crossterm or similar TUI crate.
  ;; Next: fetch szsol-rs v1.0.1 source, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "szsol-rs")))

(define-public arch-remaster
  ;; AUR arch-remaster: Tools for remastering Arch Linux live systems; v26.02.1-1; 1 vote.
  ;; Source: https://github.com/AdrianTM/arch-remaster
  ;; NEEDS_RECIPE_DESIGN: shell script recipe; deps: squashfs-tools, xorriso, grub.
  ;; Next: fetch arch-remaster 26.02.1 source, compute sha256, draft trivial script install.
  (package (inherit zoxide) (name "arch-remaster")))

(define-public pixora-icons-git
  ;; AUR pixora-icons-git: 16-bit pixel icon theme for Linux desktops (git); r264.gf5604c1-1; 1 vote.
  ;; Source: https://github.com/tsora1603/pixora-icons
  ;; NEEDS_RECIPE_DESIGN: trivial icon theme install; pin git commit.
  ;; Next: pin git rev, compute sha256, draft trivial icon theme install.
  (package (inherit zoxide) (name "pixora-icons-git")))

(define-public udiskr
  ;; AUR udiskr: Lightweight alternative to udiskie; v0.1.1-1; 1 vote.
  ;; Source: https://github.com/uriib/udiskr
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust, udisks2.
  ;; Next: fetch udiskr v0.1.1 source, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "udiskr")))

(define-public comp-scan-bin
  ;; AUR comp-scan-bin: Local AI agent system scanner (binary); v0.1.0-1; 1 vote.
  ;; Source: https://github.com/vvk147/comp-scan
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch comp-scan v0.1.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "comp-scan-bin")))

(define-public tilem-gtk3-git
  ;; AUR tilem-gtk3-git: TI calculator emulator (GTK3 fork); r7.e36102e-1; 1 vote.
  ;; Source: https://github.com/kuba160/tilem-gtk3
  ;; NEEDS_RECIPE_DESIGN: cmake/autotools C+GTK3 recipe; deps: gtk3, glib, SDL.
  ;; Next: pin git rev, compute sha256, draft cmake C+GTK3 recipe.
  (package (inherit zoxide) (name "tilem-gtk3-git")))

(define-public r47-bin
  ;; AUR r47-bin: R47 pocket calculator emulator (binary); v00.109.03.01b1-1; 1 vote.
  ;; Source: https://47calc.com (proprietary)
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; proprietary; fetch Linux binary from 47calc.com.
  ;; Next: fetch R47 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "r47-bin")))

(define-public docx-you-want
  ;; AUR docx-you-want: Unusual PDF-to-DOCX converter; v0.1.2-1; 1 vote.
  ;; Source: https://github.com/MikeWalrus/docx-you-want
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust, poppler or pdfium.
  ;; Next: fetch docx-you-want v0.1.2 source, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "docx-you-want")))

(define-public c47-bin
  ;; AUR c47-bin: C47 pocket calculator emulator (binary); v00.109.03.01b1-1; 1 vote.
  ;; Source: https://47calc.com (proprietary)
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; proprietary; fetch Linux binary from 47calc.com.
  ;; Next: fetch C47 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "c47-bin")))

(define-public wo-bin
  ;; AUR wo-bin: Workspace shell manager (binary); v1.0.0-1; 1 vote.
  ;; Source: https://github.com/antham/wo
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Go binary; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch wo v1.0.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "wo-bin")))

(define-public cliamp
  ;; AUR cliamp: Retro terminal music player inspired by Winamp 2.x (source); v1.27.2-1; 1 vote.
  ;; Source: https://github.com/bjarneo/cliamp
  ;; NEEDS_RECIPE_DESIGN: node.js/npm recipe; deps: node, npm, various audio libs.
  ;; Next: fetch cliamp v1.27.2 from npm/GitHub, compute sha256, draft node recipe.
  (package (inherit zoxide) (name "cliamp")))

(define-public oken-bin
  ;; AUR oken-bin: Smarter SSH CLI with fuzzy host picker (binary); v0.3.8-1; 1 vote.
  ;; Source: https://github.com/linkwithjoydeep/oken
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch oken v0.3.8 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "oken-bin")))

(define-public lazytail-bin
  ;; AUR lazytail-bin: Fast universal terminal log viewer with live filter (binary); v0.9.0-1; 1 vote.
  ;; Source: https://github.com/raaymax/lazytail
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch lazytail v0.9.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "lazytail-bin")))

(define-public funzzy-bin
  ;; AUR funzzy-bin: Lightweight generic file watcher (binary); v1.5.0-2; 1 vote.
  ;; Source: https://github.com/cristianoliveira/funzzy
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Rust binary; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch funzzy v1.5.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "funzzy-bin")))

(define-public framework-control-bin
  ;; AUR framework-control-bin: Framework Laptop fan/battery/LED tool (proprietary binary); v0.5.1-1; 1 vote.
  ;; Source: https://github.com/ozturkkl/framework-control (proprietary)
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; proprietary; fetch Linux AppImage/binary from GitHub.
  ;; Next: fetch framework-control v0.5.1 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "framework-control-bin")))

(define-public baremetal-compiler-rt
  ;; AUR baremetal-compiler-rt: compiler-rt builtins for bare-metal ARM Cortex-M; v22.1.1-1; 1 vote.
  ;; Source: https://github.com/llvm/llvm-project
  ;; NEEDS_RECIPE_DESIGN: cmake recipe for LLVM compiler-rt bare-metal subset; cross-compile needed.
  ;; Next: fetch llvm-project 22.1.1 source, compute sha256, draft cmake cross-compile recipe.
  (package (inherit zoxide) (name "baremetal-compiler-rt")))

(define-public dpibreak
  ;; AUR dpibreak: Fast and easy DPI circumvention tool in Rust; v0.5.1-1; 1 vote.
  ;; Source: https://github.com/dilluti0n/dpibreak
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust, libc.
  ;; Next: fetch dpibreak v0.5.1 source, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "dpibreak")))

(define-public lobster
  ;; AUR lobster: Shell script to watch Movies/Shows from terminal; v4.6.2-1; 1 vote.
  ;; Source: https://github.com/justchokingaround/lobster
  ;; NEEDS_RECIPE_DESIGN: shell script recipe; deps: mpv, yt-dlp, fzf, rofi/wofi.
  ;; Next: fetch lobster v4.6.2 script, compute sha256, draft trivial shell script install.
  (package (inherit zoxide) (name "lobster")))

(define-public dpibreak-git
  ;; AUR dpibreak-git: DPIBreak DPI circumvention in Rust (git); r357.f5c4f03-1; 1 vote.
  ;; Source: https://github.com/Dilluti0n/DPIBreak
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe (git version); deps: rust, libc.
  ;; Next: pin git rev, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "dpibreak-git")))

(define-public uac-polkit-agent-git
  ;; AUR uac-polkit-agent-git: UAC-style Polkit authenticator for AeroShell; r30f6179-1; 1 vote.
  ;; Source: https://github.com/aeroshell-desktop/uac-polkit-agent
  ;; NEEDS_RECIPE_DESIGN: cmake Qt/KDE recipe; deps: polkit, KDE Plasma, AeroShell.
  ;; Next: pin git commit, compute sha256, draft cmake KDE recipe.
  (package (inherit zoxide) (name "uac-polkit-agent-git")))

(define-public mezzotone-bin
  ;; AUR mezzotone-bin: TUI Go app to convert images to ASCII art (binary); v1.1.1-1; 1 vote.
  ;; Source: https://github.com/joaoheitorgarcia/Mezzotone
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Go binary; fetch Linux amd64 binary from GitHub.
  ;; Next: fetch Mezzotone v1.1.1 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "mezzotone-bin")))

(define-public ipmctl-git
  ;; AUR ipmctl-git: Intel Optane DC persistent memory management utility (git); 1 vote.
  ;; Source: https://github.com/intel/ipmctl
  ;; NEEDS_RECIPE_DESIGN: cmake C recipe; deps: libsafec, libndctl, ndctl.
  ;; Next: pin git rev, compute sha256, draft cmake recipe with ndctl deps.
  (package (inherit zoxide) (name "ipmctl-git")))

(define-public python-aiohttp-jinja2
  ;; AUR python-aiohttp-jinja2: Jinja2 template renderer for aiohttp.web; v1.6-2; 1 vote.
  ;; Source: http://aiohttp-jinja2.aio-libs.org/
  ;; NEEDS_RECIPE_DESIGN: python-build-system; deps: python-aiohttp, python-jinja2.
  ;; Next: fetch aiohttp-jinja2 1.6 from PyPI, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "python-aiohttp-jinja2")))

(define-public pricehist
  ;; AUR pricehist: CLI tool for fetching historical price data; v1.4.14-1; 1 vote.
  ;; Source: https://gitlab.com/chrisberkhout/pricehist
  ;; NEEDS_RECIPE_DESIGN: python-build-system; deps: python-requests, python-lxml, python-click.
  ;; Next: fetch pricehist 1.4.14 from PyPI/GitLab, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "pricehist")))

(define-public fish-session
  ;; AUR fish-session: UI-first session manager for Fish shell; v0.1.8-1; 1 vote.
  ;; Source: https://github.com/AtefR/fish-session
  ;; NEEDS_RECIPE_DESIGN: trivial Fish plugin install; deps: fish.
  ;; Next: fetch fish-session v0.1.8, compute sha256, draft trivial Fish plugin install.
  (package (inherit zoxide) (name "fish-session")))

(define-public workz-bin
  ;; AUR workz-bin: Git worktrees with zero-config dep sync (binary); v0.8.0-1; 1 vote.
  ;; Source: https://github.com/rohansx/workz
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch workz v0.8.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "workz-bin")))

(define-public omp-manager-bin
  ;; AUR omp-manager-bin: Installation manager for 'Oh My Posh' (binary); v0.1.2-1; 1 vote.
  ;; Source: https://github.com/marlocarlo/omp-manager
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux binary from GitHub releases.
  ;; Next: fetch omp-manager v0.1.2 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "omp-manager-bin")))

(define-public tmux-plugin-panel-bin
  ;; AUR tmux-plugin-panel-bin: TUI tmux plugin manager (binary); v0.1.1-1; 1 vote.
  ;; Source: https://github.com/marlocarlo/Tmux-Plugin-Panel
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux binary from GitHub releases.
  ;; Next: fetch Tmux-Plugin-Panel v0.1.1 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "tmux-plugin-panel-bin")))

(define-public spinwheel-pipewire
  ;; AUR spinwheel-pipewire: Terminal wheel spinner with PipeWire audio mode; v0.1.0-1; 1 vote.
  ;; Source: https://codeberg.org/the-traveler/spinwheel
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust, pipewire.
  ;; Next: fetch spinwheel v0.1.0 source, compute sha256, draft cargo recipe with pipewire dep.
  (package (inherit zoxide) (name "spinwheel-pipewire")))

(define-public compendium
  ;; AUR compendium: User-friendly strace for x86 Linux with HTML reports; v0.2.0-1; 1 vote.
  ;; Source: https://crates.io/crates/compendium
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust, ptrace/seccomp.
  ;; Next: fetch compendium v0.2.0 from crates.io, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "compendium")))

(define-public pandoc-crossref-bin
  ;; AUR pandoc-crossref-bin: Pandoc filter for cross-references (binary); v0.3.23.a-1; 1 vote.
  ;; Source: https://github.com/lierdakil/pandoc-crossref/
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch pandoc-crossref v0.3.23a Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "pandoc-crossref-bin")))

(define-public boomer-git
  ;; AUR boomer-git: Zoomer application for Linux (git); r286.cc0f531-1; 1 vote.
  ;; Source: https://github.com/tsoding/boomer
  ;; NEEDS_RECIPE_DESIGN: nim recipe; deps: nim, OpenGL, X11.
  ;; Next: pin git rev, compute sha256, draft nim build recipe.
  (package (inherit zoxide) (name "boomer-git")))

(define-public mkinitcpio-firmware
  ;; AUR mkinitcpio-firmware: Optional firmware for default linux kernel; v1.6.0-1; 1 vote.
  ;; Source: https://aur.archlinux.org/packages/mkinitcpio-firmware
  ;; NEEDS_RECIPE_DESIGN: firmware data install recipe; collect various firmware blobs.
  ;; Next: identify firmware sources/versions, compute sha256s, draft firmware install recipe.
  (package (inherit zoxide) (name "mkinitcpio-firmware")))

(define-public qxmledit
  ;; AUR qxmledit: Simple XML editor and XSD viewer; v0.9.18-1; 1 vote.
  ;; Source: https://qxmledit.org/
  ;; NEEDS_RECIPE_DESIGN: qmake Qt5 recipe; deps: qt5-base, qt5-xml, qt5-declarative.
  ;; Next: fetch qxmledit-0.9.18 source, compute sha256, draft qmake Qt5 recipe.
  (package (inherit zoxide) (name "qxmledit")))

(define-public tufw-git
  ;; AUR tufw-git: Terminal UI for ufw firewall manager (git); v0.2.7-2; 1 vote.
  ;; Source: https://github.com/peltho/tufw
  ;; NEEDS_RECIPE_DESIGN: Go recipe; deps: go, ufw.
  ;; Next: pin git commit for v0.2.7, compute sha256, draft go-build-system recipe.
  (package (inherit zoxide) (name "tufw-git")))

(define-public adbfs-rootless-git
  ;; AUR adbfs-rootless-git: FUSE filesystem over ADB, rootless; r112.fd56381-1; 1 vote.
  ;; Source: https://github.com/spion/adbfs-rootless
  ;; NEEDS_RECIPE_DESIGN: C make recipe; deps: fuse, android-tools/adb.
  ;; Next: pin git rev, compute sha256, draft C+fuse recipe.
  (package (inherit zoxide) (name "adbfs-rootless-git")))

(define-public dafny-bin
  ;; AUR dafny-bin: Dafny verification-aware programming language (binary); v4.11.0-1; 1 vote.
  ;; Source: https://github.com/dafny-lang/dafny
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; .NET self-contained binary; fetch Linux x64 release.
  ;; Next: fetch Dafny 4.11.0 Linux x64 binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "dafny-bin")))

(define-public weylus-bin
  ;; AUR weylus-bin: Use tablet as graphic tablet/touchscreen on your computer (binary); v0.11.4-1; 1 vote.
  ;; Source: https://github.com/H-M-H/Weylus
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Rust binary; fetch Linux amd64 binary from GitHub.
  ;; Next: fetch Weylus v0.11.4 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "weylus-bin")))

(define-public zerx-lab-fluxdown-bin
  ;; AUR zerx-lab-fluxdown-bin: FluxDown multi-protocol download manager (binary); v0.1.31-1; 1 vote.
  ;; Source: https://fluxdown.zerx.dev
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Rust binary; fetch Linux amd64 binary from releases.
  ;; Next: fetch FluxDown v0.1.31 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "zerx-lab-fluxdown-bin")))

(define-public bililive-recorder-bin
  ;; AUR bililive-recorder-bin: BiliBili live stream recorder (binary); v2.17.3-1; 1 vote.
  ;; Source: https://github.com/Bililive/BililiveRecorder
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; .NET self-contained binary; fetch Linux x64 release.
  ;; Next: fetch BililiveRecorder 2.17.3 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "bililive-recorder-bin")))

(define-public lenovo-print-driver-lj2400-m7400-bin
  ;; AUR lenovo-print-driver-lj2400-m7400-bin: Lenovo LJ2400/M7400 printer driver (proprietary binary); v5.0.3-1; 1 vote.
  ;; Source: https://www.lenovo.com (proprietary)
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; proprietary printer driver; fetch Linux binary from Lenovo.
  ;; Next: fetch Lenovo LJ2400/M7400 Linux driver binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "lenovo-print-driver-lj2400-m7400-bin")))

(define-public nodejs-knit
  ;; AUR nodejs-knit: Knit local Node.js dependencies together; v0.1.2-1; 1 vote.
  ;; Source: https://github.com/coopbri/knit
  ;; NEEDS_RECIPE_DESIGN: node.js/npm recipe; deps: node, npm.
  ;; Next: fetch knit v0.1.2 from npm/GitHub, compute sha256, draft node recipe.
  (package (inherit zoxide) (name "nodejs-knit")))

(define-public fw-fanctrl-rs-git
  ;; AUR fw-fanctrl-rs-git: Lightweight fan control daemon for Framework laptops (git); r106.g20b84a6-1; 1 vote.
  ;; Source: https://github.com/NexusXe/fw-ec-utils
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust; Framework Embedded Controller access.
  ;; Next: pin git rev, compute sha256, draft cargo recipe with EC/udev rules.
  (package (inherit zoxide) (name "fw-fanctrl-rs-git")))

(define-public aerothemeplasma-desktop-x11-git
  ;; AUR aerothemeplasma-desktop-x11-git: X11 session for AeroThemePlasma; r662.ra70f432-1; 1 vote.
  ;; Source: https://github.com/aeroshell-desktop/aerothemeplasma
  ;; NEEDS_RECIPE_DESIGN: cmake/kpackage recipe; deps: KDE Plasma 6, AeroShell components.
  ;; Next: pin git commit, compute sha256, draft cmake KDE Plasma recipe.
  (package (inherit zoxide) (name "aerothemeplasma-desktop-x11-git")))

(define-public aeroshell-workspace-git
  ;; AUR aeroshell-workspace-git: Desktop components for AeroShell-based desktops (git); r2dff129-1; 1 vote.
  ;; Source: https://github.com/aeroshell-desktop/aeroshell-workspace
  ;; NEEDS_RECIPE_DESIGN: cmake/kpackage recipe; deps: KDE Plasma 6, kwin.
  ;; Next: pin git commit, compute sha256, draft cmake KDE recipe.
  (package (inherit zoxide) (name "aeroshell-workspace-git")))

(define-public aeroshell-libplasma-git
  ;; AUR aeroshell-libplasma-git: Plasma library with AeroShell patches (git); r6aa6d2f0b-1; 1 vote.
  ;; Source: https://github.com/aeroshell-desktop/libplasma
  ;; NEEDS_RECIPE_DESIGN: cmake C++ recipe; deps: KDE Plasma 6 full build chain.
  ;; Next: pin git commit, compute sha256, draft cmake KDE Plasma library recipe.
  (package (inherit zoxide) (name "aeroshell-libplasma-git")))

(define-public aeroshell-kwin-components-git
  ;; AUR aeroshell-kwin-components-git: KWin effects/scripts for AeroShell (git); r002e505-1; 1 vote.
  ;; Source: https://github.com/aeroshell-desktop/aeroshell-kwin-components
  ;; NEEDS_RECIPE_DESIGN: cmake KDE recipe; deps: kwin, KDE Plasma 6.
  ;; Next: pin git commit, compute sha256, draft cmake KDE kwin plugin recipe.
  (package (inherit zoxide) (name "aeroshell-kwin-components-git")))

(define-public keks-meet-server
  ;; AUR keks-meet-server: Server for keks-meet simple secure conferencing; v1.1.0-2; 1 vote.
  ;; Source: https://codeberg.org/metamuffin/keks-meet
  ;; NEEDS_RECIPE_DESIGN: cargo or Node recipe for server component; deps: rust or node.
  ;; Next: fetch keks-meet v1.1.0 source, determine server build system, draft recipe.
  (package (inherit zoxide) (name "keks-meet-server")))

(define-public jellything-git
  ;; AUR jellything-git: Jellything media streaming server (git); r997.823c0c6-1; 1 vote.
  ;; Source: https://codeberg.org/metamuffin/jellything
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust, ffmpeg optional.
  ;; Next: pin git rev, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "jellything-git")))

(define-public hurrycurry-server
  ;; AUR hurrycurry-server: Server for hurrycurry cooking game; v3.0.1-1; 1 vote.
  ;; Source: https://codeberg.org/hurrycurry/hurrycurry
  ;; NEEDS_RECIPE_DESIGN: recipe for server component; determine build system (likely Rust/Nim).
  ;; Next: fetch hurrycurry v3.0.1 source, identify server build system, draft recipe.
  (package (inherit zoxide) (name "hurrycurry-server")))

(define-public gnix
  ;; AUR gnix: Simple stupid HTTP reverse proxy; v2.4.1-1; 1 vote.
  ;; Source: https://codeberg.org/metamuffin/gnix
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust, tokio/hyper.
  ;; Next: fetch gnix v2.4.1 source, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "gnix")))

(define-public mkbrr-gui-bin
  ;; AUR mkbrr-gui-bin: Create/modify/inspect torrent files - GUI version (binary); v1.19.0_rc1-2; 1 vote.
  ;; Source: https://github.com/autobrr/mkbrr/
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Electron/Go binary; fetch Linux binary from GitHub.
  ;; Next: fetch mkbrr-gui v1.19.0-rc1 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "mkbrr-gui-bin")))

(define-public wireview-linux
  ;; AUR wireview-linux: Unofficial Linux port of Thermal Grizzly WireView Pro II; v1.0.4.0-1; 1 vote.
  ;; Source: https://github.com/emaspa/wireview-linux
  ;; NEEDS_RECIPE_DESIGN: binary wrapper or build recipe; fetch Linux binary/source from GitHub.
  ;; Next: fetch wireview-linux v1.0.4.0 source/binary, compute sha256, draft recipe.
  (package (inherit zoxide) (name "wireview-linux")))

(define-public chough-bin
  ;; AUR chough-bin: Fast ASR CLI using Parakeet TDT 0.6b V3 (binary); v1.0.0-1; 1 vote.
  ;; Source: https://github.com/hyperpuncher/chough
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Rust binary; fetch Linux amd64 binary from GitHub.
  ;; Next: fetch chough v1.0.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "chough-bin")))
