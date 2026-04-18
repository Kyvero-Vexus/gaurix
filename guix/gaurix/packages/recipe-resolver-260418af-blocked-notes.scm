;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260418af
;;; Documents exhausted approaches and already-packaged resolutions.

;;; ===================================================================
;;; ALREADY_PACKAGED_PRIOR (23 packages)
;;; These packages already have recipes from prior resolver/deptree passes.
;;; Their NEEDS_RECIPE_DESIGN status was stale and is now corrected.
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. ccase (#2499) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Case conversion CLI tool. Recipe exists in
;;; recipe-resolver-260413ae.scm from a prior recipe pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 2. brother-mfc-l2710dw (#2714) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Brother MFC-L2710DW printer driver. Recipe exists in
;;; recipe-resolver-260414g.scm from a prior recipe pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 3. time-desktop-bin (#3956) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Desktop time tracking app. Recipe exists in
;;; queue-20260402p100daily4.scm from a prior queue pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 4. zectl-pacman-hook (#4117) -> ALREADY_PACKAGED_PRIOR
;;;
;;; ZFS boot environment pacman hook. Recipe exists in
;;; deptree-resolver-260413f.scm from a prior deptree pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 5. kemulatornnmod-bin (#5084) -> ALREADY_PACKAGED_PRIOR
;;;
;;; NES emulator. Recipe exists in
;;; queue-20260325p100.scm from a prior queue pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 6. naviterm-bin (#5122) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Terminal navigator. Recipe exists in
;;; queue-20260325p100.scm from a prior queue pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 7. python-ghlang (#5270) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Python GitHub language detection. Recipe exists in
;;; queue-20260325p100c.scm from a prior queue pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 8. pyradio (#5341) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Python internet radio player. Recipe exists in
;;; queue-20260325p100c.scm from a prior queue pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 9. doasedit-nhk (#6753) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Edit files as root using doas. Recipe exists in
;;; deptree-resolver-260413l.scm from a prior deptree pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 10. systemd-liberated-git (#7311) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Liberated systemd fork (git version). Recipe exists in
;;; queue-20260329p100.scm from a prior queue pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 11. systemd-liberated-resolvconf-git (#7313) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Liberated systemd resolvconf (git version). Recipe exists in
;;; queue-20260329p100.scm from a prior queue pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 12. systemd-liberated-sysvcompat-git (#7314) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Liberated systemd sysvinit compat (git version). Recipe exists in
;;; queue-20260329p100.scm from a prior queue pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 13. systemd-liberated-tests-git (#7315) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Liberated systemd tests (git version). Recipe exists in
;;; queue-20260329p100.scm from a prior queue pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 14. systemd-liberated-ukify-git (#7316) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Liberated systemd UKI tool (git version). Recipe exists in
;;; queue-20260329p100.scm from a prior queue pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 15. kdesu5 (#7318) -> ALREADY_PACKAGED_PRIOR
;;;
;;; KDE su privilege escalation helper. Recipe exists in
;;; cron-c79f127f-r22-w03-nrd4.scm from a prior cron pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 16. local-by-flywheel-bin (#7319) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Local WordPress development environment. Recipe exists in
;;; recipe-resolver-260417ap.scm from a prior recipe pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 17. anycubicslicernext-bin (#7320) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Anycubic 3D printer slicer. Recipe exists in
;;; recipe-resolver-260413y.scm from a prior recipe pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 18. cpp-jwt (#7321) -> ALREADY_PACKAGED_PRIOR
;;;
;;; C++ JSON Web Token library. Recipe exists in
;;; cron-c79f127f-w02.scm from a prior cron pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 19. tonespace (#7332) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Chord generator and visualizer. Recipe exists in
;;; deptree-resolver-260408h.scm from a prior deptree pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 20. crandpass (#7335) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Random password generator. Recipe exists in
;;; deptree-resolver-260408i.scm from a prior deptree pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 21. unraid-usb-creator-bin (#7357) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Unraid USB boot drive creator. Recipe exists in
;;; deptree-resolver-260413f.scm from a prior deptree pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 22. anytype-alpha-bin (#7389) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Anytype alpha note-taking tool. Recipe exists in
;;; recipe-resolver-260413y.scm from a prior recipe pass.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 23. burpsuite (#7390) -> ALREADY_PACKAGED_PRIOR
;;;
;;; Web security testing platform. Recipe exists in
;;; recipe-resolver-260413ae.scm from a prior recipe pass.
;;; -------------------------------------------------------------------

;;; ===================================================================
;;; ALREADY_PACKAGED_IN_GUIX (1 package)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 24. haskell-nats (#10700) -> ALREADY_PACKAGED_IN_GUIX
;;;
;;; Haskell 98 natural numbers library. Already packaged in Guix
;;; as 'ghc-nats' (version 1.1.2) in gnu/packages/haskell-xyz.scm.
;;; No separate package needed.
;;; -------------------------------------------------------------------

;;; ===================================================================
;;; BLOCKED EXHAUSTED (6 packages)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 25. qfinderpro-bin (#3685) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_CUSTOM_LICENSE
;;;
;;; QNAP Qfinder Pro NAS discovery utility (qnap.com/en/utilities).
;;; A1: Proprietary custom license; QNAP does not provide source code
;;;     or allow redistribution of the binary.
;;; A2: Requires openssl-1.1 (deprecated) and Qt5; heavy proprietary
;;;     binary with many dynamically linked libraries.
;;; A3: Vendor-specific NAS management tool with no FOSS alternative
;;;     that covers the same device discovery protocol.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 26. pexip-infinity-connect-bin (#3949) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_CUSTOM_LICENSE
;;;
;;; Pexip Infinity Connect video conferencing client (pexip.com).
;;; A1: Proprietary custom license from Pexip; commercial software
;;;     with no source code available.
;;; A2: The product was officially deprecated (Nov 2024 per prior
;;;     evaluation in recipe-resolver-260408y).
;;; A3: No public download URL without vendor account; commercial
;;;     video conferencing with many FOSS alternatives (Jitsi, etc.).
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 27. aura-bin (#4155) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC
;;;
;;; Aura AUR helper for Arch Linux (github.com/fosskers/aura).
;;; A1: Requires pacman and libalpm which are Arch Linux-specific
;;;     and not available in Guix.
;;; A2: As a Haskell binary, it could be installed, but has zero
;;;     utility on Guix System where there is no AUR.
;;; A3: Even as a binary-only package, it would fail at runtime
;;;     without pacman infrastructure.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 28. electron32-bin (#7493) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_COMPLEX
;;;
;;; Electron v32 prebuilt runtime (electronjs.org).
;;; A1: Electron is a Chromium-based runtime with 200+ bundled
;;;     dependencies; packaging the runtime itself in Guix is
;;;     essentially the same as packaging Chromium.
;;; A2: Custom/MIT dual license; binary requires system nss, gtk3,
;;;     alsa-lib at minimum but bundles Chromium internally.
;;; A3: Guix does not have Electron packaged; building from source
;;;     requires the full Chromium build infrastructure (~60GB build).
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 29. mqtt-explorer-beta (#8377) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: NON_FREE_LICENSE
;;;
;;; MQTT Explorer client (mqtt-explorer.com).
;;; A1: Licensed under CC-BY-ND (Creative Commons Attribution-
;;;     NoDerivatives) which prohibits modifications; incompatible
;;;     with Guix channel policy requiring modifiable source.
;;; A2: Electron-based application requiring Node.js >=17 and the
;;;     full Electron build stack.
;;; A3: Non-free license makes redistribution of modified binaries
;;;     illegal; cannot patch for Guix store paths.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 30. napcatqq-git (#14538) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_DEPS
;;;
;;; NapCatQQ bot implementation (github.com/NapNeko/NapCatQQ).
;;; A1: Depends on linuxqq (Tencent QQ desktop client) which is
;;;     proprietary closed-source software.
;;; A2: Requires xorg-server-xvfb for headless operation and
;;;     execstack for stack permission manipulation.
;;; A3: The underlying protocol relies on reverse-engineering the
;;;     proprietary QQ client; cannot function without it.
;;; -------------------------------------------------------------------
