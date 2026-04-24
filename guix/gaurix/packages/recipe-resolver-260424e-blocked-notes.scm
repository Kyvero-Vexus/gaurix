;;; recipe-resolver-260424e --- blocked notes
;;;
;;; This pass resolved 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 5 new recipes written (yay-bin, teleport-client-bin, marmite-bin, rtimelog, 7zip-docs)
;;;   - 15 confirmed as already-resolved from prior passes
;;;   - 10 marked EXHAUSTED with concrete reasons
;;;
;;; EXHAUSTED entries (10):
;;;   7467. libreoffice-dev-gu — LIBREOFFICE_LOCALE: full LO rebuild impractical for single locale
;;;   7468. libreoffice-dev-mr — LIBREOFFICE_LOCALE: same as libreoffice-dev-gu
;;;   7507. linux-versioned-bin — ARCH_KERNEL_BINARY: Guix has own kernel model (linux-libre)
;;;   7508. linux-versioned-headers-bin — ARCH_KERNEL_HEADERS: same as linux-versioned-bin
;;;   7509. linux-versioned-docs-bin — ARCH_KERNEL_DOCS: same as linux-versioned-bin
;;;   7599. pipewire-openrc — OPENRC_INCOMPATIBLE: Guix uses GNU Shepherd
;;;   7600. pipewire-pulse-openrc — OPENRC_INCOMPATIBLE: same as pipewire-openrc
;;;   10675. python2-gamin — PYTHON2_EOL: Python 2 end-of-life, no Python 3 port
;;;   7619. advantagescope — ELECTRON_COMPLEX: 24 system deps, Electron not in Guix
;;;   10755. numara-bin — ELECTRON_ABANDONED: upstream archived, Electron repacking needed
;;;
;;; CONFIRMED already-resolved (15):
;;;   7394. objection — recipe in recipe-resolver-260413af.scm
;;;   7395. sonic-silver-theme — recipe in deptree-resolver-260414q.scm
;;;   7428. fortty — recipe in recipe-resolver-260414e.scm
;;;   7433. finalmouse-cli — recipe in recipe-resolver-260414e.scm
;;;   7436. qadwaitadecorations-qt6 — recipe in recipe-resolver-260413aj.scm
;;;   7452. sideloader-bin — recipe in recipe-resolver-260413y.scm
;;;   7479. yarr — recipe in recipe-resolver-260414b.scm
;;;   7480. blobdrop-git — recipe in recipe-resolver-260418f.scm
;;;   7495. python-pywal16-git — recipe in recipe-resolver-260413aj.scm
;;;   7522. runelite — recipe in recipe-resolver-260414e.scm
;;;   7544. minisystool — recipe in recipe-resolver-260414e.scm
;;;   7638. icon-git — recipe in recipe-resolver-260414e.scm
;;;   7543. urnetwork-provider-git — recipe in deptree-resolver-260414s.scm
;;;   7565. vapoursynth-plugin-vship-amd-git — recipe in deptree-resolver-260414s.scm
;;;   8379. classisland-bin — recipe in recipe-resolver-260413y.scm
