;;; Blocked notes for cron-c79f127f worker w07.
(define-module (gaurix packages cron-c79f127f-w07-blocked-notes)
  #:export (cron-c79f127f-w07-blocked-notes))

(define-public cron-c79f127f-w07-blocked-notes
  '(("openbangla-keyboard-git" "RECIPE_NOT_IMPLEMENTED"
     "A1: guix show openbangla-keyboard-git not found; guix search openbangla/bangla has no input-method package candidate."
     "A2: AUR PKGBUILD is a split package (openbangla-keyboard-git + ibus-openbangla-git + fcitx5-openbangla-git) with cmake+rust build and output reshuffling logic."
     "A3: Upstream requires riti git submodule wiring; no ibus-openbangla-git/fcitx5-openbangla-git/openbangla-keyboard packages currently available for compatibility aliasing.")))
