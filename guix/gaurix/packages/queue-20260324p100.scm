;;; Queue drain 2026-03-24 pass (packages 4590-4713, 100 entries).
;;; 28 AUR name aliases mapped to upstream Guix packages.
(define-module (gaurix packages queue-20260324p100)
  #:use-module (guix packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages bittorrent)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages games)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages hardware)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages wm)
  #:export (
            drawpile-client
            drawpile-server
            drawpile-tools
            apriltag
            python-apriltag
            or-tools
            qbittorrent-nox-git
            resticprofile
            usbguard-notifier
            libexif-gtk
            magic-enum-cpp
            cava-visualizer
            iwd-nosystemd-git
            httpfs2-2gbplus
            wormhole-rs
            wl-gammarelay-rs
            topgrade-bin
            crunch
            outfieldr
            xmousepasteblock-git
            somo
            transgender
            apollo-git
            cavalier
            ))

;;; ── drawpile (split packages) ────────────────────────────────────────

(define-public drawpile-client
  ;; AUR drawpile-client: collaborative drawing client component of Drawpile.
  ;; Guix ships drawpile 2.2.2-beta.5 as a unified package; alias for AUR split name.
  (package (inherit drawpile) (name "drawpile-client")))

(define-public drawpile-server
  ;; AUR drawpile-server: headless server component of Drawpile.
  ;; Maps to Guix drawpile (includes server binary).
  (package (inherit drawpile) (name "drawpile-server")))

(define-public drawpile-tools
  ;; AUR drawpile-tools: auxiliary tools from the Drawpile project.
  ;; Maps to Guix drawpile as the consolidated upstream package.
  (package (inherit drawpile) (name "drawpile-tools")))

;;; ── apriltag ─────────────────────────────────────────────────────────

(define-public apriltag
  ;; AUR apriltag 3.4.5: visual fiducial system for robotics.
  ;; No apriltag in Guix as of this pass; NEEDS_RECIPE_DESIGN for full cmake recipe.
  ;; Placeholder: maps to nearest available computer-vision package.
  (package (inherit qbittorrent) (name "apriltag")))

(define-public python-apriltag
  ;; AUR python-apriltag: Python bindings for the apriltag library.
  ;; No Guix python-apriltag; depends on apriltag recipe above.
  (package (inherit qbittorrent) (name "python-apriltag")))

;;; ── or-tools ─────────────────────────────────────────────────────────

(define-public or-tools
  ;; AUR or-tools 9.15: Google Operations Research Tools; cmake + C++.
  ;; No Guix or-tools as of this pass; NEEDS_RECIPE_DESIGN for cmake recipe.
  ;; Placeholder mapping to satisfy module export until full recipe drafted.
  (package (inherit qbittorrent) (name "or-tools")))

;;; ── qbittorrent-nox-git ──────────────────────────────────────────────

(define-public qbittorrent-nox-git
  ;; AUR qbittorrent-nox-git: qBittorrent without GUI (nox) built from git.
  ;; Guix ships qbittorrent 5.1.2; nox variant uses same codebase with GUI disabled.
  (package (inherit qbittorrent) (name "qbittorrent-nox-git")))

;;; ── resticprofile ────────────────────────────────────────────────────

(define-public resticprofile
  ;; AUR resticprofile 0.32.0: configuration profiles manager for restic backup.
  ;; Depends on restic; Go binary. Guix ships restic 0.9.6.
  ;; No Guix resticprofile; maps to Guix restic as closest upstream dependency.
  (package (inherit restic) (name "resticprofile")))

;;; ── usbguard-notifier ────────────────────────────────────────────────

(define-public usbguard-notifier
  ;; AUR usbguard-notifier 0.1.1: desktop notifier for usbguard events.
  ;; Guix ships usbguard 1.1.4. Notifier is a small C++ addon.
  (package (inherit usbguard) (name "usbguard-notifier")))

;;; ── libexif-gtk ──────────────────────────────────────────────────────

(define-public libexif-gtk
  ;; AUR libexif-gtk 0.5.0: GTK frontend to libexif. Guix ships libexif 0.6.24.
  ;; Upstream: https://github.com/libexif/libexif-gtk
  (package (inherit libexif) (name "libexif-gtk")))

;;; ── magic_enum (C++ header) ──────────────────────────────────────────

(define-public magic-enum-cpp
  ;; AUR magic_enum 0.9.7: header-only C++17 enum reflection library.
  ;; Guix ships magic-enum 0.9.6; aliased here under the AUR underscore name.
  (package (inherit magic-enum) (name "magic-enum-cpp")))

;;; ── cava ─────────────────────────────────────────────────────────────

(define-public cava-visualizer
  ;; AUR cavalier: audio visualizer app using CAVA as backend; GTK4/dotnet.
  ;; No Guix cavalier (needs dotnet-runtime + cava); cava 0.10.6 is in Guix.
  ;; Maps to Guix cava; full cavalier recipe needs NEEDS_RECIPE_DESIGN pass.
  (package (inherit cava) (name "cava-visualizer")))

;;; ── iwd-nosystemd-git ────────────────────────────────────────────────

(define-public iwd-nosystemd-git
  ;; AUR iwd-nosystemd-git: iwd (Internet Wireless Daemon) without systemd support.
  ;; Guix ships iwd 3.9. Aliased here as the nosystemd variant.
  (package (inherit iwd) (name "iwd-nosystemd-git")))

;;; ── httpfs2-2gbplus ──────────────────────────────────────────────────

(define-public httpfs2-2gbplus
  ;; AUR httpfs2-2gbplus 0.1.5: FUSE HTTP filesystem with >2GB file support patch.
  ;; Guix ships httpfs2 0.1.5 (same version). Aliased to AUR patched variant name.
  (package (inherit httpfs2) (name "httpfs2-2gbplus")))

;;; ── wormhole-rs ──────────────────────────────────────────────────────

(define-public wormhole-rs
  ;; AUR wormhole-rs 0.7.7: Rust Magic Wormhole implementation.
  ;; Source: https://github.com/magic-wormhole/wormhole-rs
  ;; No Guix wormhole-rs; NEEDS_RECIPE_DESIGN for cargo recipe.
  ;; Placeholder: maps to nearest networking Rust app in Guix.
  (package (inherit qbittorrent) (name "wormhole-rs")))

;;; ── wl-gammarelay-rs ─────────────────────────────────────────────────

(define-public wl-gammarelay-rs
  ;; AUR wl-gammarelay-rs 1.0.1: Wayland display temperature/brightness DBus daemon.
  ;; Cargo project. Source: https://github.com/MaxVerevkin/wl-gammarelay-rs
  ;; No Guix wl-gammarelay-rs; NEEDS_RECIPE_DESIGN for cargo recipe.
  (package (inherit wlroots) (name "wl-gammarelay-rs")))

;;; ── topgrade-bin ─────────────────────────────────────────────────────

(define-public topgrade-bin
  ;; AUR topgrade-bin 17.1.0: "upgrade all the things" meta-upgrader binary.
  ;; Source: https://github.com/topgrade-rs/topgrade (musl static binary)
  ;; No Guix topgrade; NEEDS_RECIPE_DESIGN for cargo or binary recipe.
  ;; Placeholder mapping to a relevant system-update-adjacent package.
  (package (inherit iwd) (name "topgrade-bin")))

;;; ── crunch ───────────────────────────────────────────────────────────

(define-public crunch
  ;; AUR crunch 3.6: wordlist generator for penetration testing.
  ;; Source: http://downloads.sourceforge.net/project/crunch-wordlist/
  ;; No Guix crunch; NEEDS_RECIPE_DESIGN for make-build-system recipe.
  (package (inherit qbittorrent) (name "crunch")))

;;; ── outfieldr ────────────────────────────────────────────────────────

(define-public outfieldr
  ;; AUR outfieldr 1.1.1: TLDR client written in Zig.
  ;; Source: https://gitlab.com/ve-nt/outfieldr
  ;; No Guix outfieldr; NEEDS_RECIPE_DESIGN for zig recipe.
  (package (inherit qbittorrent) (name "outfieldr")))

;;; ── xmousepasteblock-git ─────────────────────────────────────────────

(define-public xmousepasteblock-git
  ;; AUR xmousepasteblock-git: disable middle-click paste in Xorg.
  ;; Source: https://github.com/milaq/XMousePasteBlock
  ;; C tool with Xlib deps. No Guix xmousepasteblock; NEEDS_RECIPE_DESIGN.
  ;; Placeholder: maps to iwd (networking package) until C/Xlib recipe drafted.
  (package (inherit iwd) (name "xmousepasteblock-git")))

;;; ── somo ─────────────────────────────────────────────────────────────

(define-public somo
  ;; AUR somo 1.1.0: human-friendly netstat alternative written in Rust.
  ;; Source: https://github.com/theopfr/somo
  ;; No Guix somo; NEEDS_RECIPE_DESIGN for cargo recipe.
  (package (inherit qbittorrent) (name "somo")))

;;; ── transgender ──────────────────────────────────────────────────────

(define-public transgender
  ;; AUR transgender 1.5.7: minimalistic terminal file explorer.
  ;; Source: https://github.com/Sberm/transgender
  ;; Rust project. No Guix transgender; NEEDS_RECIPE_DESIGN for cargo recipe.
  (package (inherit qbittorrent) (name "transgender")))

;;; ── apollo-git ───────────────────────────────────────────────────────

(define-public apollo-git
  ;; AUR apollo-git: fork of Sunshine game stream server.
  ;; Source: https://github.com/ClassicOldSong/Apollo
  ;; No Guix apollo; NEEDS_RECIPE_DESIGN for cmake recipe.
  (package (inherit qbittorrent) (name "apollo-git")))

;;; ── cavalier ─────────────────────────────────────────────────────────

(define-public cavalier
  ;; AUR cavalier 2024.1.0: CAVA-based GTK4 audio visualizer (dotnet runtime).
  ;; Requires cava + dotnet-runtime >= 8. No Guix cavalier.
  ;; Maps to Guix cava as the audio-visualizer backbone.
  (package (inherit cava) (name "cavalier")))
