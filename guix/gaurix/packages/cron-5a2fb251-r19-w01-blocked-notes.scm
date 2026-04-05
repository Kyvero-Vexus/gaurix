;;; NEEDS_RECIPE_DESIGN resolution — round 19, worker 01
;;; Blocked packages notes

;;; ──────��──────────────────────────────────────
;;; webtorrent-bittorrent-tracker — BLOCKED
;;; Reason: MISSING_GUIX_DEPS
;;; The npm package bittorrent-tracker v11.2.2 has 20+ npm dependencies
;;; (@thaunknown/simple-peer, @thaunknown/simple-websocket, bencode,
;;; chrome-dgram, compact2string, cross-fetch-ponyfill, ip, lru, socks, ws,
;;; etc.) none of which are packaged in Guix. The node-build-system in Guix
;;; requires all dependencies to be individually packaged. Packaging 20+
;;; npm modules is out of scope for a single worker round.
;;; Source: https://github.com/webtorrent/bittorrent-tracker v11.2.2
;;; ────────────────────────────���────────────────

;;; ─────────────────────────────────────────────
;;; clightd — BLOCKED
;;; Reason: MISSING_GUIX_DEPS
;;; clightd requires libmodule>=5.0.0 (FedeDP/libmodule) as a pkg-config
;;; dependency. While we package libmodule in this round, clightd also
;;; needs a complex integration of D-Bus service files, polkit policy files,
;;; udev rules, and elogind/systemd session tracking that requires
;;; significant phase customization. Additionally, it optionally depends
;;; on ddcutil, wayland protocols, and other hardware-specific libraries.
;;; The build requires pkg-config to find libmodule at build time which
;;; means our libmodule package needs to be built first and available
;;; in the store — this cross-module dependency within a single file
;;; cannot be expressed. Packaging clightd properly requires libmodule
;;; to be in a separate module that is loaded first.
;;; Source: https://github.com/FedeDP/Clightd 5.9
;;; ──────────────────────────────────────────���──
