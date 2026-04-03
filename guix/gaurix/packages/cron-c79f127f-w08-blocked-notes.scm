;;; Blocked package investigation notes for blocked-tree run cron-c79f127f worker w08.
(define-module (gaurix packages cron-c79f127f-w08-blocked-notes)
  #:export (cron-c79f127f-w08-blocked-notes))

(define-public cron-c79f127f-w08-blocked-notes
  '(("qmc2-common-git" "NEEDS_RECIPE_DESIGN"
     "A1 guix show qmc2-common-git => package not found; A2 guix search -r '^qmc2|qmc2' => no matching candidates; A3 scripts/fetch-aur-pkgbuild.sh qmc2-common-git => AUR git clone succeeds but repository has no PKGBUILD/.SRCINFO checkout (empty cache dir). Blocker: missing authoritative package recipe source in AUR and no upstream Guix equivalent.")
    ("lgogdownloader" "NEEDS_RECIPE_DESIGN"
     "A1 guix show lgogdownloader => package not found; A2 guix search -r 'lgogdownloader|gogdownloader' => no candidate in current Guix snapshot; A3 scripts/fetch-aur-pkgbuild.sh lgogdownloader => PKGBUILD retrieved (v3.18 CMake build, deps boost/jsoncpp/tinyxml2/rhash/tidy). Blocker: Guix recipe still needs authoring and dependency-name reconciliation (notably Arch tidy -> Guix tidy-html).")
    ("linux-lqx" "NEEDS_RECIPE_DESIGN"
     "A1 guix show linux-lqx => package not found; A2 guix search -r 'linux.*liquorix|liquorix|lqx' => no Liquorix flavor in current Guix; A3 scripts/fetch-aur-pkgbuild.sh linux-lqx => large PKGBUILD retrieved with custom kernel patch/config workflow. Blocker: substantial linux-libre-derived packaging effort required (patch stack integration, config deltas, outputs/signing handling).")
    ("fooyin" "NEEDS_RECIPE_DESIGN"
     "A1 guix show fooyin => package not found; A2 guix search -r 'fooyin' => no candidates; A3 scripts/fetch-aur-pkgbuild.sh fooyin => PKGBUILD retrieved (Qt6/CMake app depending on qcoro, kdsingleapplication, libvgm-git). Blocker: dependency chain not present in current Guix package set and recipe not yet drafted.")
    ("vscodium-translucent" "NEEDS_RECIPE_DESIGN"
     "A1 guix show vscodium-translucent => package not found; A2 guix search -r 'vscodium|codium|vscode' => no baseline vscodium package available; A3 scripts/fetch-aur-pkgbuild.sh vscodium-translucent => PKGBUILD retrieved, requires heavyweight git build + translucency patchset and Node/Rust toolchain bootstrap. Blocker: upstream baseline (vscodium) absent in this channel, making patch-variant packaging premature.")
    ("rom-properties" "NEEDS_RECIPE_DESIGN"
     "A1 guix show rom-properties => package not found; A2 guix search -r 'rom-properties|rom' => no direct candidate; A3 scripts/fetch-aur-pkgbuild.sh rom-properties => PKGBUILD retrieved with split outputs (core/gtk/kde) and extensive KDE/GTK build deps. Blocker: multi-output Guix recipe with mapped KDE dependency set not yet implemented.")
    ("ros2-arch-deps" "NEEDS_RECIPE_DESIGN"
     "A1 guix show ros2-arch-deps => package not found; A2 guix search -r 'ros2|ament|colcon|vcstool' => no ROS2/ament/colcon family in current snapshot; A3 scripts/fetch-aur-pkgbuild.sh ros2-arch-deps => meta-package PKGBUILD retrieved listing broad ROS2 build stack. Blocker: target is a distro-specific Arch metapackage and depends on large unported ROS2 ecosystem in Guix.")))
