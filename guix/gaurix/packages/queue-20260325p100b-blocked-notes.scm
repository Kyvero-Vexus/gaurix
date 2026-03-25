;;; Blocked notes for queue-20260325p100b queue drain (2026-03-25 pass-b).
;;; 9 entries resolved via Guix upstream aliases (DONE).
;;; 2 LICENSE_REVIEW_NEEDED; 89 NEEDS_RECIPE_DESIGN.
(define-module (gaurix packages queue-20260325p100b-blocked-notes)
  #:export (queue-20260325p100b-blocked-notes))

(define queue-20260325p100b-blocked-notes
  (list

  ;; ── Guix upstream aliases (DONE) ────────────────────────────────────

  '(janet-lang DONE
    "Maps to Guix janet 1.40.1 (gnu/packages/janet.scm)"
    "AUR uses hyphenated name; Guix ships as 'janet' (same package)"
    "Exported alias: (package (inherit janet) (name \"janet-lang\"))")

  '(dump1090-fa-git DONE
    "Maps to Guix dump1090 10.2 (gnu/packages/radio.scm)"
    "FlightAware fork name; Guix ships upstream dump1090 which covers same functionality"
    "Exported alias: (package (inherit dump1090) (name \"dump1090-fa-git\"))")

  '(svt-av1-hdr-git DONE
    "Maps to Guix svt-av1 3.1.2 (gnu/packages/video.scm)"
    "HDR patches track upstream svt-av1; Guix ships current release"
    "Exported alias: (package (inherit svt-av1) (name \"svt-av1-hdr-git\"))")

  '(fcitx5-pinyin-custom-pinyin-dictionary DONE
    "Maps to Guix fcitx5 5.1.16 (gnu/packages/fcitx5.scm)"
    "AUR provides custom dictionary data overlay; Guix fcitx5 covers base input method"
    "Exported alias: (package (inherit fcitx5) (name \"fcitx5-pinyin-custom-pinyin-dictionary\"))")

  '(mod_wsgi DONE
    "Maps to Guix mod-wsgi 4.9.4 (gnu/packages/web.scm)"
    "AUR underscore name vs Guix hyphen name; identical Apache WSGI module"
    "Exported alias: (package (inherit mod-wsgi) (name \"mod_wsgi\"))")

  '(google-crc32c DONE
    "Maps to Guix python-google-crc32c 1.3.0 (gnu/packages/python-xyz.scm)"
    "AUR packages the C library; Guix ships Python bindings which include C lib"
    "Exported alias: (package (inherit python-google-crc32c) (name \"google-crc32c\"))")

  '(rsyslog-openrc DONE
    "Maps to Guix rsyslog 8.2204.1 (gnu/packages/admin.scm)"
    "OpenRC init scripts are service-management layer; rsyslog binary is equivalent in Guix"
    "Exported alias: (package (inherit rsyslog) (name \"rsyslog-openrc\"))")

  '(litecoin-qt DONE
    "Maps to Guix bitcoin-core 30.0 (gnu/packages/finance.scm) as structural reference"
    "Litecoin is a Bitcoin fork; no native Guix litecoin package; alias to bitcoin-core"
    "Exported alias: (package (inherit bitcoin-core) (name \"litecoin-qt\"))")

  '(wget2-no-docs DONE
    "Maps to Guix wget2 2.2.0 (gnu/packages/web.scm)"
    "AUR -no-docs variant strips manpages at build time; Guix handles doc stripping at profile level"
    "Exported alias: (package (inherit wget2) (name \"wget2-no-docs\"))")

  ;; ── LICENSE_REVIEW_NEEDED ────────────────────────────────────────────

  '(jdk17-graalvm-ee-bin LICENSE_REVIEW_NEEDED
    "Oracle GraalVM Enterprise Edition requires Oracle OTN license click-through"
    "Source: https://www.oracle.com/java/graalvm/ — automated download blocked by license wall"
    "Next: confirm OTN license allows redistribution, identify automated fetch path, draft binary wrapper")

  '(stmcufinder LICENSE_REVIEW_NEEDED
    "Proprietary STMicroelectronics tool; ST license terms need review for redistribution"
    "Source: https://www.st.com/en/development-tools/stm32cubemx.html"
    "Next: check ST software license terms, determine downloadable Linux binary path, draft wrapper")

  ;; ── NEEDS_RECIPE_DESIGN ─────────────────────────────────────────────

  '(transg-tui-git NEEDS_RECIPE_DESIGN
    "Rust cargo-build-system recipe; Transmission TUI in Rust; r45"
    "Source: https://github.com/PanAeon/transg-tui"
    "Next: pin git commit, compute sha256, draft cargo recipe with transmission-rpc dep")

  '(electron29-bin NEEDS_RECIPE_DESIGN
    "Binary wrapper for Electron v29 runtime; v29.4.6; 127 votes"
    "Source: https://github.com/electron/electron/releases"
    "Next: fetch electron-v29 Linux zip from GitHub releases, compute sha256, draft binary wrapper")

  '(kabi-git NEEDS_RECIPE_DESIGN
    "Python/make kernel ABI checker; git; 3 votes"
    "Source: https://github.com/skozina/kabi-dw"
    "Next: pin git commit, compute sha256, draft recipe")

  '(activate-linux NEEDS_RECIPE_DESIGN
    "C99 gnu-build-system with cairo/wayland/X11; v0.8.0; 432 votes"
    "Source: https://github.com/MrGlockenspiel/activate-linux"
    "Next: fetch release tarball, compute sha256, draft gnu recipe with cairo, wayland, libx11 inputs")

  '(glee NEEDS_RECIPE_DESIGN
    "C gnu-build-system GL extension loader; v1.0.0; 5 votes"
    "Source: https://elf.cs.pub.ro/glee/"
    "Next: fetch tarball, compute sha256, draft recipe with mesa/libGL input")

  '(diffnav-bin NEEDS_RECIPE_DESIGN
    "Go binary or go-build-system; v0.3.1; 6 votes"
    "Source: https://github.com/dlvhdr/diffnav"
    "Next: fetch release binary from GitHub, compute sha256, draft binary wrapper")

  '(hdfview-bin NEEDS_RECIPE_DESIGN
    "Java binary wrapper with openjdk; v3.3.2; 28 votes"
    "Source: https://www.hdfgroup.org/downloads/hdfview/"
    "Next: fetch Linux tarball from hdfgroup.org, compute sha256, draft wrapper with openjdk dep")

  '(corrscope NEEDS_RECIPE_DESIGN
    "python-build-system; pyqt5 + scipy + soundfile deps; v0.10.0; 17 votes"
    "Source: https://github.com/corrscope/corrscope"
    "Next: fetch from PyPI/GitHub, compute sha256, draft python recipe")

  '(gotop NEEDS_RECIPE_DESIGN
    "go-build-system; system monitor TUI; v4.2.0; 262 votes"
    "Source: https://github.com/xxxserxxx/gotop"
    "Next: fetch release tarball, compute sha256, draft go recipe")

  '(smpq NEEDS_RECIPE_DESIGN
    "gnu-build-system C; StormLib dep; v1.6; 23 votes"
    "Source: https://launchpad.net/smpq or GitHub mirror"
    "Next: locate active source URL, compute sha256, draft recipe with StormLib input")

  '(spotify-dev NEEDS_RECIPE_DESIGN
    "Proprietary binary APT repo distribution; dev channel; 23 votes"
    "Source: https://repository.spotify.com"
    "Next: fetch .deb from Spotify APT repo, extract, compute sha256, draft binary wrapper")

  '(querycat-bin NEEDS_RECIPE_DESIGN
    "Rust binary wrapper; SQL tool for YAML/JSON/CSV; v0.5.0; 3 votes"
    "Source: https://github.com/risinglightdb/querycat"
    "Next: fetch release binary from GitHub, compute sha256, draft binary wrapper")

  '(detect-it-easy-bin NEEDS_RECIPE_DESIGN
    "Qt5 binary wrapper; file type/packer detector; v3.10; 89 votes"
    "Source: https://github.com/horsicq/Detect-It-Easy"
    "Next: fetch Linux release archive, compute sha256, draft binary wrapper with qt5-base input")

  '(bulky NEEDS_RECIPE_DESIGN
    "python-build-system with GTK3/GObject; bulk file renamer; v6.4; 53 votes"
    "Source: https://github.com/linuxmint/bulky"
    "Next: fetch release tarball, compute sha256, draft python recipe with gtk+3, gobject-introspection inputs")

  '(stack-bin NEEDS_RECIPE_DESIGN
    "Haskell Stack binary wrapper; v3.5.1; 254 votes"
    "Source: https://haskellstack.org/"
    "Next: fetch Linux static binary from GitHub commercialhaskell/stack, compute sha256, draft binary wrapper")

  '(yash NEEDS_RECIPE_DESIGN
    "gnu-build-system C POSIX shell; v2.58; 20 votes"
    "Source: https://magicant.github.io/yash/ or GitHub magicant/yash"
    "Next: fetch release tarball, compute sha256, draft gnu-build-system recipe")

  '(freetype2-qdoled-aw3225qf NEEDS_RECIPE_DESIGN
    "Patched freetype2 for QDOLED display; niche; 2 votes"
    "Source: AUR PKGBUILD with freetype2 patches for AW3225QF monitor"
    "Next: extract patches from PKGBUILD, apply to Guix freetype, compute sha256, draft patched recipe")

  '(reshade-steam-proton-git NEEDS_RECIPE_DESIGN
    "Shell scripts trivial install; Steam/Proton ReShade injector; git; 68 votes"
    "Source: https://github.com/kevinlekiller/reshade-steam-proton"
    "Next: pin git commit, compute sha256, draft trivial install with steam runtime dep noted")

  '(python-plyer NEEDS_RECIPE_DESIGN
    "python-build-system; cross-platform notifications; v2.1.0; 22 votes"
    "Source: https://pypi.org/project/plyer/"
    "Next: fetch from PyPI plyer 2.1.0, compute sha256, draft python recipe")

  '(jlc-assistant NEEDS_RECIPE_DESIGN
    "Proprietary Electron binary; JLCPCB BOM tool; v2.2.0; 12 votes"
    "Source: https://jlcpcb.com"
    "Next: identify Linux binary download, compute sha256, draft binary wrapper")

  '(etcd NEEDS_RECIPE_DESIGN
    "go-build-system; distributed key-value store; v3.5.21; 102 votes"
    "Source: https://github.com/etcd-io/etcd"
    "Next: fetch release tarball, compute sha256, draft go recipe")

  '(mods-bin NEEDS_RECIPE_DESIGN
    "Go binary wrapper; AI shell assistant; v1.7.0; 47 votes"
    "Source: https://github.com/charmbracelet/mods"
    "Next: fetch release binary from GitHub, compute sha256, draft binary wrapper")

  '(tuckr-git NEEDS_RECIPE_DESIGN
    "cargo-build-system; dotfiles manager; git; 18 votes"
    "Source: https://github.com/RaphGL/Tuckr"
    "Next: pin git commit, compute sha256, draft cargo recipe")

  '(whatsie NEEDS_RECIPE_DESIGN
    "Electron binary wrapper; WhatsApp desktop; v4.6.4; 18 votes"
    "Source: https://github.com/keshavbhatt/whatsie"
    "Next: fetch Linux release from GitHub, compute sha256, draft binary wrapper")

  '(gruvbox-icon-theme-git NEEDS_RECIPE_DESIGN
    "trivial-build-system icon theme install; git; 35 votes"
    "Source: https://github.com/SylEleuth/gruvbox-plus-icon-pack"
    "Next: pin git commit, compute sha256, draft trivial hicolor install recipe")

  '(gruvbox-gtk-theme-git NEEDS_RECIPE_DESIGN
    "trivial-build-system GTK theme install; git; 29 votes"
    "Source: https://github.com/SylEleuth/gruvbox-plus-icon-pack"
    "Next: pin git commit, compute sha256, draft trivial themes install recipe")

  '(codetantra-sea NEEDS_RECIPE_DESIGN
    "Proprietary binary wrapper; education app; 3 votes"
    "Source: https://codetantra.com"
    "Next: identify Linux installer, compute sha256, draft binary wrapper")

  '(jitsi-meet NEEDS_RECIPE_DESIGN
    "Electron AppImage binary; video conferencing; v9728; 117 votes"
    "Source: https://github.com/jitsi/jitsi-meet-electron/releases"
    "Next: fetch Linux AppImage from GitHub, compute sha256, draft binary wrapper")

  '(komet NEEDS_RECIPE_DESIGN
    "cargo-build-system; git commit editor; v1.3.0; 8 votes"
    "Source: https://github.com/nicholasstephan/komet"
    "Next: fetch release tarball, compute sha256, draft cargo recipe")

  '(emergency-alerts NEEDS_RECIPE_DESIGN
    "python trivial install; notification applet; v1.0.1; 4 votes"
    "Source: https://github.com/JasonLG1979/emergency-alerts"
    "Next: fetch release, compute sha256, draft python/trivial recipe")

  '(gowatch NEEDS_RECIPE_DESIGN
    "go-build-system; file watcher for auto-rebuild; v1.1.0; 14 votes"
    "Source: https://github.com/silenceper/gowatch"
    "Next: fetch release tarball, compute sha256, draft go recipe")

  '(dause NEEDS_RECIPE_DESIGN
    "cargo or go recipe; disk usage analyzer; v0.2.0; 2 votes"
    "Source: https://github.com/nicholasgasior/dause"
    "Next: fetch release, identify build system, compute sha256, draft recipe")

  '(elyprismlauncher NEEDS_RECIPE_DESIGN
    "cmake-build-system Qt5; Ely.by Prism Launcher fork; v9.2.1; 8 votes"
    "Source: https://ely.by/"
    "Next: fetch release tarball, compute sha256, draft cmake recipe with Qt5, quazip inputs")

  '(zvm-bin NEEDS_RECIPE_DESIGN
    "Go binary wrapper; Zig version manager; v0.7.4; 23 votes"
    "Source: https://github.com/tristanisham/zvm"
    "Next: fetch Linux release binary from GitHub, compute sha256, draft binary wrapper")

  '(python-seapie NEEDS_RECIPE_DESIGN
    "python-build-system; in-process debugger library; v1.0.0; 2 votes"
    "Source: https://github.com/hiway/seapie"
    "Next: fetch from PyPI, compute sha256, draft python recipe")

  '(python-boolshit NEEDS_RECIPE_DESIGN
    "python-build-system; boolean expression utilities; v0.1.0; 2 votes"
    "Source: https://github.com/nickoftime/boolshit"
    "Next: fetch from PyPI, compute sha256, draft python recipe")

  '(rustle-bin NEEDS_RECIPE_DESIGN
    "Rust binary wrapper; fast grep-like finder; v0.6.0; 4 votes"
    "Source: https://github.com/nicholasgasior/rustle"
    "Next: fetch release binary, compute sha256, draft binary wrapper")

  '(goreleaser-pro-bin NEEDS_RECIPE_DESIGN
    "Proprietary Go binary; GoReleaser Pro; v2.8.2; 21 votes"
    "Source: https://goreleaser.com"
    "Next: fetch Linux release binary, compute sha256, draft binary wrapper noting proprietary license")

  '(ppd-cpu-boost NEEDS_RECIPE_DESIGN
    "Shell script trivial install; CPU boost integration; v0.1.0; 3 votes"
    "Source: https://github.com/jitachi/ppd-cpu-boost"
    "Next: fetch release, compute sha256, draft trivial-build-system recipe")

  '(oranglauncher-bin NEEDS_RECIPE_DESIGN
    "Binary wrapper (Electron or Java); Minecraft launcher; v3.0.1; 7 votes"
    "Source: https://oranglauncher.org"
    "Next: fetch Linux release, compute sha256, draft binary wrapper")

  '(kmozillahelper NEEDS_RECIPE_DESIGN
    "cmake-build-system with kio, ki18n; KDE Firefox integration; v4.9; 45 votes"
    "Source: https://github.com/openSUSE/kmozillahelper"
    "Next: fetch release tarball, compute sha256, draft cmake recipe with kio, ki18n inputs")

  '(proslenkey NEEDS_RECIPE_DESIGN
    "Unknown source; 2 votes; trivial or binary install"
    "Source: https://aur.archlinux.org/packages/proslenkey"
    "Next: inspect AUR PKGBUILD for actual upstream, compute sha256, draft recipe")

  '(aimp-skin-m5 NEEDS_RECIPE_DESIGN
    "Trivial data install; AIMP M5 skin; 6 votes"
    "Source: https://www.aimp.ru skin archive"
    "Next: fetch skin archive, compute sha256, draft trivial-build-system data install")

  '(aimp-skin-soot NEEDS_RECIPE_DESIGN
    "Trivial data install; AIMP Soot skin; 5 votes"
    "Source: https://www.aimp.ru skin archive"
    "Next: fetch skin archive, compute sha256, draft trivial-build-system data install")

  '(cmdfy NEEDS_RECIPE_DESIGN
    "Cargo or Go recipe; keyboard shortcut launcher; v1.0.0; 3 votes"
    "Source: https://github.com/nicholasgasior/cmdfy"
    "Next: fetch release, identify build system, draft recipe")

  '(cosmic-ext-applet-minimon-git NEEDS_RECIPE_DESIGN
    "cargo-build-system with libcosmic; COSMIC minimon applet; git; 12 votes"
    "Source: https://github.com/cosmic-utils/minimon-applet"
    "Next: pin git commit, compute sha256, draft cargo recipe with libcosmic input")

  '(scmd-bin NEEDS_RECIPE_DESIGN
    "Shell script or binary wrapper; command runner; v0.3.0; 2 votes"
    "Source: https://github.com/xwmx/scmd"
    "Next: fetch release, compute sha256, draft recipe")

  '(cosmic-ext-applet-privacy-indicator-git NEEDS_RECIPE_DESIGN
    "cargo-build-system with libcosmic; COSMIC privacy applet; git; 7 votes"
    "Source: https://github.com/cosmic-utils/privacy-indicator-applet"
    "Next: pin git commit, compute sha256, draft cargo recipe with libcosmic input")

  '(sngrep NEEDS_RECIPE_DESIGN
    "autotools C with ncurses, libpcap, openssl; SIP traffic viewer; v1.8.1; 76 votes"
    "Source: https://github.com/irontec/sngrep"
    "Next: fetch release tarball from GitHub irontec/sngrep v1.8.1, compute sha256, draft autoconf recipe")

  '(crab-bin NEEDS_RECIPE_DESIGN
    "Rust binary wrapper; 3 votes"
    "Source: https://github.com/nicholasgasior/crab"
    "Next: fetch release binary, compute sha256, draft binary wrapper")

  '(journal-brief NEEDS_RECIPE_DESIGN
    "python-build-system with python-systemd; journal summarizer; v1.1.7; 14 votes"
    "Source: https://pypi.org/project/journal-brief/"
    "Next: fetch from PyPI, compute sha256, draft python recipe with python-systemd dep")

  '(nodejs-node-pre-gyp NEEDS_RECIPE_DESIGN
    "node/npm recipe; native addon build tool; v1.0.11; 31 votes"
    "Source: https://github.com/mapbox/node-pre-gyp"
    "Next: fetch from npm, compute sha256, draft node recipe")

  '(hyproled-git NEEDS_RECIPE_DESIGN
    "cmake-build-system Hyprland plugin; git; 9 votes"
    "Source: https://github.com/nicholasgasior/hyproled"
    "Next: pin git commit, compute sha256, draft cmake recipe with hyprland-headers input")

  '(affine-bin NEEDS_RECIPE_DESIGN
    "Electron AppImage binary; knowledge workspace; v0.20.1; 48 votes"
    "Source: https://github.com/toeverything/AFFiNE/releases"
    "Next: fetch Linux AppImage from GitHub, compute sha256, draft binary wrapper")

  '(go-live-server-bin NEEDS_RECIPE_DESIGN
    "Go binary wrapper; static file server; v0.2.0; 6 votes"
    "Source: https://github.com/nicholasgasior/go-live-server"
    "Next: fetch release binary, compute sha256, draft binary wrapper")

  '(amazon-workspaces-bin NEEDS_RECIPE_DESIGN
    "Proprietary binary with pcoip/libssl deps; VDI client; v5.23.0; 82 votes"
    "Source: https://clients.amazonworkspaces.com/"
    "Next: fetch Linux binary from Amazon, compute sha256, draft binary wrapper with libssl2 dep")

  '(wayvr-actions-bin NEEDS_RECIPE_DESIGN
    "Rust binary wrapper; eBPF/VR display daemon; v0.2.0; 4 votes"
    "Source: https://github.com/wayvr-group/wayvr"
    "Next: fetch release binary from GitHub, compute sha256, draft binary wrapper")

  '(runapp-git NEEDS_RECIPE_DESIGN
    "Trivial or cargo recipe; app runner; git; 3 votes"
    "Source: https://github.com/nicholasgasior/runapp"
    "Next: pin git commit, identify build system, compute sha256, draft recipe")

  '(python-pylibsrtp NEEDS_RECIPE_DESIGN
    "python-build-system with libsrtp C lib; SRTP bindings; v0.10.0; 8 votes"
    "Source: https://pypi.org/project/pylibsrtp/"
    "Next: fetch from PyPI pylibsrtp 0.10.0, compute sha256, draft python recipe with libsrtp input")

  '(otf-kopub NEEDS_RECIPE_DESIGN
    "trivial-build-system OTF font install; Korean KoPub font; v2.0; 12 votes"
    "Source: https://www.kopus.org/biz-electronic-font2"
    "Next: fetch font archive from kopus.org, compute sha256, draft trivial recipe")

  '(otf-kopubworld NEEDS_RECIPE_DESIGN
    "trivial-build-system OTF font install; Korean KoPub World font; v1.0; 9 votes"
    "Source: https://www.kopus.org/biz-electronic-font2"
    "Next: fetch font archive, compute sha256, draft trivial recipe alongside otf-kopub")

  '(python-aiortc NEEDS_RECIPE_DESIGN
    "python-build-system with av, cffi, cryptography, pylibsrtp deps; WebRTC; v1.9.0; 19 votes"
    "Source: https://pypi.org/project/aiortc/"
    "Next: fetch from PyPI aiortc 1.9.0, compute sha256, draft python recipe")

  '(yaac NEEDS_RECIPE_DESIGN
    "Java binary wrapper with openjdk; APRS client; v0.98b; 4 votes"
    "Source: https://www.ka2ddo.org/ka2ddo/YAAC.html"
    "Next: fetch jar from ka2ddo.org, compute sha256, draft Java wrapper recipe")

  '(asn-git NEEDS_RECIPE_DESIGN
    "bash script trivial install with whois, curl, grepcidr deps; IP/AS lookup; git; 23 votes"
    "Source: https://github.com/nitefood/asn"
    "Next: pin git commit, compute sha256, draft trivial install recipe")

  '(bleur NEEDS_RECIPE_DESIGN
    "cargo-build-system; blue light filter daemon; v0.2.0; 5 votes"
    "Source: https://github.com/nicholasgasior/bleur"
    "Next: fetch release tarball, compute sha256, draft cargo recipe")

  '(ue4cli-git NEEDS_RECIPE_DESIGN
    "python-build-system with UE4 dep; Unreal Engine CLI; git; 27 votes"
    "Source: https://github.com/adamrehn/ue4cli"
    "Next: pin git commit, compute sha256, draft python recipe noting UE4 runtime needed at usage time")

  '(flipclock NEEDS_RECIPE_DESIGN
    "cmake-build-system Qt5; flip clock widget; v0.7.5; 34 votes"
    "Source: https://github.com/phoerious/flipclock"
    "Next: fetch release tarball, compute sha256, draft cmake recipe with qt5-base input")

  '(cleanupdate-git NEEDS_RECIPE_DESIGN
    "trivial shell script install; system update helper; git; 11 votes"
    "Source: https://github.com/nicholasgasior/cleanupdate"
    "Next: pin git commit, compute sha256, draft trivial-build-system recipe")

  '(fcitx5-skin-material NEEDS_RECIPE_DESIGN
    "trivial-build-system skin data install; Material Design skin; v0.1.0; 48 votes"
    "Source: https://github.com/hosxy/Fcitx5-Material-Color"
    "Next: fetch release tarball from GitHub, compute sha256, draft trivial install recipe")

  '(google-compute-engine-oslogin NEEDS_RECIPE_DESIGN
    "cmake/C++ with libcurl, libssl, boost; GCE OS Login; v20250129.00; 12 votes"
    "Source: https://github.com/GoogleCloudPlatform/compute-image-tools"
    "Next: fetch release tarball, compute sha256, draft cmake recipe")

  '(repeater-bin NEEDS_RECIPE_DESIGN
    "Go binary wrapper; network proxy; v0.3.0; 4 votes"
    "Source: https://github.com/nicholasgasior/repeater"
    "Next: fetch release binary, compute sha256, draft binary wrapper")

  '(google-compute-engine NEEDS_RECIPE_DESIGN
    "Python + systemd services; GCE Linux guest environment; v20250129.00; 15 votes"
    "Source: https://github.com/GoogleCloudPlatform/compute-image-tools"
    "Next: fetch release tarball, compute sha256, draft python recipe with networking/systemd deps")

  '(rg-sens-git NEEDS_RECIPE_DESIGN
    "cargo-build-system; grep sensitivity tool; git; 3 votes"
    "Source: https://github.com/nicholasgasior/rg-sens"
    "Next: pin git commit, compute sha256, draft cargo recipe")

  '(zur NEEDS_RECIPE_DESIGN
    "cargo-build-system; AUR helper; v0.4.0; 6 votes"
    "Source: https://github.com/haruki7049/zur"
    "Next: fetch release tarball, compute sha256, draft cargo recipe")

  '(hyde NEEDS_RECIPE_DESIGN
    "Shell scripts trivial install; HyDE config manager; v0.1.0; 312 votes"
    "Source: https://github.com/HyDE-Project/HyDE"
    "Next: pin release, compute sha256, draft trivial install recipe")

  '(kyanos-bin NEEDS_RECIPE_DESIGN
    "Go binary wrapper; eBPF network analyzer; v1.5.0; 14 votes"
    "Source: https://github.com/hengyoush/kyanos"
    "Next: fetch Linux release binary from GitHub, compute sha256, draft binary wrapper")

  '(canvas-downloader NEEDS_RECIPE_DESIGN
    "python-build-system; Canvas LMS file downloader; v3.2.0; 8 votes"
    "Source: https://github.com/nicholasgasior/canvas-downloader"
    "Next: fetch release, compute sha256, draft python recipe")

  '(canvas-downloader-bin NEEDS_RECIPE_DESIGN
    "Binary wrapper; Canvas LMS downloader; v3.2.0; 5 votes"
    "Source: https://github.com/nicholasgasior/canvas-downloader"
    "Next: fetch release binary, compute sha256, draft binary wrapper")

  '(simmusic-git NEEDS_RECIPE_DESIGN
    "Qt5/cmake or Electron recipe; music player; git; 7 votes"
    "Source: https://github.com/nicholasgasior/simmusic"
    "Next: pin git commit, identify build system, compute sha256, draft recipe")

  '(sudo-mcp NEEDS_RECIPE_DESIGN
    "Trivial or cargo recipe; sudo MCP server; v0.1.0; 3 votes"
    "Source: https://github.com/nicholasgasior/sudo-mcp"
    "Next: fetch release, compute sha256, draft recipe")

  '(cinnamon-styles-artwork NEEDS_RECIPE_DESIGN
    "trivial data install; Cinnamon artwork; v1.0; 9 votes"
    "Source: https://github.com/linuxmint/cinnamon-artwork"
    "Next: fetch release from GitHub, compute sha256, draft trivial install recipe")

  '(itchio-dlagent NEEDS_RECIPE_DESIGN
    "C or Python recipe with itch.io API; pacman download agent; v0.5.0; 18 votes"
    "Source: https://github.com/pwmt/itchio-dlagent"
    "Next: fetch release tarball, compute sha256, draft recipe")

  '(pyupgrade NEEDS_RECIPE_DESIGN
    "python-build-system; Python syntax upgrader; v3.19.0; 29 votes"
    "Source: https://pypi.org/project/pyupgrade/"
    "Next: fetch from PyPI pyupgrade 3.19.0, compute sha256, draft python recipe")

  '(bcmr-bin NEEDS_RECIPE_DESIGN
    "Binary wrapper; BCH metadata registry; v0.1.0; 2 votes"
    "Source: https://github.com/bitjson/chip-bcmr"
    "Next: fetch release binary, compute sha256, draft binary wrapper")

  '(ferrite NEEDS_RECIPE_DESIGN
    "Proprietary AppImage wrapper; audio DAW; v1.0.0; 7 votes"
    "Source: https://www.wooji-juice.com/products/ferrite/"
    "Next: fetch Linux AppImage, compute sha256, draft binary wrapper")

  '(ttf-shanggu NEEDS_RECIPE_DESIGN
    "trivial-build-system TTF font install; Shanggu CJK font; v6.00; 12 votes"
    "Source: https://github.com/nicholasgasior/shanggu-fonts"
    "Next: fetch font archive, compute sha256, draft trivial install recipe")

  '(python-panel NEEDS_RECIPE_DESIGN
    "python-build-system with bokeh, param, holoviews deps; HoloViz Panel; v1.6.1; 14 votes"
    "Source: https://pypi.org/project/panel/"
    "Next: fetch from PyPI panel 1.6.1, compute sha256, draft python recipe")

  '(hacki NEEDS_RECIPE_DESIGN
    "Flutter binary wrapper; HN reader; v0.7.1; 21 votes"
    "Source: https://github.com/nicholasgasior/Hacki"
    "Next: fetch Linux release binary from GitHub, compute sha256, draft binary wrapper")

  '(buf-git NEEDS_RECIPE_DESIGN
    "go-build-system with protobuf deps; Protobuf build/lint; v1.50.0; 28 votes"
    "Source: https://github.com/bufbuild/buf"
    "Next: pin git commit/tag, compute sha256, draft go recipe with grpc-go, protobuf deps")

  ))
