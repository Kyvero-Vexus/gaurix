(define-module (gaurix packages plymouth-themes-compat)
  #:use-module (gnu packages freedesktop)
  #:use-module (guix packages)
  #:export (plymouth-theme-unrap-git
            plymouth-theme-tech-b-git
            plymouth-theme-tech-a-git
            plymouth-theme-target-git
            plymouth-theme-target-2-git
            plymouth-theme-square-hud-git
            plymouth-theme-square-git
            plymouth-theme-splash-git
            plymouth-theme-spinner-alt-git
            plymouth-theme-spin-git
            plymouth-theme-sphere-git
            plymouth-theme-sliced-git
            plymouth-theme-seal-git
            plymouth-theme-seal-3-git
            plymouth-theme-seal-2-git
            plymouth-theme-rog-git
            plymouth-theme-rog-2-git
            plymouth-theme-rings-git
            plymouth-theme-rings-2-git
            plymouth-theme-red-loader-git))

;; Compatibility aliases for AUR-style plymouth theme package names.
(define-public plymouth-theme-unrap-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-unrap-git")))

(define-public plymouth-theme-tech-b-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-tech-b-git")))

(define-public plymouth-theme-tech-a-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-tech-a-git")))

(define-public plymouth-theme-target-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-target-git")))

(define-public plymouth-theme-target-2-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-target-2-git")))

(define-public plymouth-theme-square-hud-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-square-hud-git")))

(define-public plymouth-theme-square-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-square-git")))

(define-public plymouth-theme-splash-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-splash-git")))

(define-public plymouth-theme-spinner-alt-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-spinner-alt-git")))

(define-public plymouth-theme-spin-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-spin-git")))

(define-public plymouth-theme-sphere-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-sphere-git")))

(define-public plymouth-theme-sliced-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-sliced-git")))

(define-public plymouth-theme-seal-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-seal-git")))

(define-public plymouth-theme-seal-3-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-seal-3-git")))

(define-public plymouth-theme-seal-2-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-seal-2-git")))

(define-public plymouth-theme-rog-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-rog-git")))

(define-public plymouth-theme-rog-2-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-rog-2-git")))

(define-public plymouth-theme-rings-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-rings-git")))

(define-public plymouth-theme-rings-2-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-rings-2-git")))

(define-public plymouth-theme-red-loader-git
  (package
    (inherit plymouth)
    (name "plymouth-theme-red-loader-git")))
