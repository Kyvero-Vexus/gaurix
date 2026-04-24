;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424k
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; All 30 packages were found to be ALREADY_PACKAGED_PRIOR in existing
;;; recipe/deptree-resolver modules.  No new recipes needed.
;;;
;;; Resolved (30 ALREADY_PACKAGED_PRIOR):
;;;          1.  shim-signed (7439) — recipe in deptree-resolver-260408g
;;;          2.  wdisplays-git (7443) — recipe in recipe-resolver-260418w
;;;          3.  powershell (7446) — recipe in recipe-resolver-260424f
;;;          4.  alice3-bin (7456) — recipe in queue-20260404-w01
;;;          5.  qdmr-git (7477) — recipe in queue-20260403p100daily
;;;          6.  anyrun-provider (7542) — recipe in deptree-resolver-260408i
;;;          7.  adaptagrams-git (7557) — recipe in deptree-resolver-260408h
;;;          8.  scala3 (7609) — recipe in deptree-260407
;;;          9.  waybar-niri-taskbar (7621) — recipe in deptree-resolver-260415h
;;;         10.  teleport-client-bin (7896) — recipe in recipe-resolver-260414i
;;;         11.  marimo (8012) — recipe in recipe-resolver-260418z
;;;         12.  python-pyfakewebcam-git (8054) — recipe in deptree-resolver-260414q
;;;         13.  python-mediapipe-bin (8055) — recipe in deptree-resolver-260414q
;;;         14.  displaylink (8092) — recipe in deptree-resolver-260414q
;;;         15.  skia-static (8100) — recipe in deptree-resolver-260414q
;;;         16.  shorewall-core (8142) — recipe in deptree-resolver-260414q
;;;         17.  ytdlp-gui (8376) — recipe in recipe-resolver-260414p
;;;         18.  xboxdrv (8390) — recipe in recipe-resolver-260413x
;;;         19.  firestorm-bin (8393) — recipe in recipe-resolver-260413p
;;;         20.  dpt-rp1-py-git (8559) — recipe in deptree-resolver-260407c
;;;         21.  popsicle (8593) — recipe in deptree-resolver-260408g
;;;         22.  brother-cups-wrapper-common (9816) — recipe in deptree-resolver-260413l
;;;         23.  dupe-krill (9924) — recipe in recipe-resolver-260417au
;;;         24.  slowrx-git (10689) — recipe in recipe-resolver-260414b
;;;         25.  blt (10741) — recipe in deptree-resolver-260413g
;;;         26.  nvidia-vulkan-open-dkms (11757) — recipe in deptree-resolver-260407d
;;;         27.  opencl-nvidia-vulkan (11759) — recipe in deptree-resolver-260407d
;;;         28.  lib32-nvidia-vulkan-utils (11760) — recipe in deptree-resolver-260407d
;;;         29.  cider (11817) — recipe in recipe-resolver-260408v
;;;         30.  glew1.10 (11978) — recipe in deptree-resolver-260413b
;;;
;;; BLOCKED (0): none — all items already had recipes.

(define-module (gaurix packages recipe-resolver-260424k))
