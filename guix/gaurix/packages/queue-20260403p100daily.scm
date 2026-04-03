;;; Queue drain 2026-04-03 daily run.
;;; Selected 100 TODO-status entries from todo_general_packages.org.
;;; Status: upstream Guix package re-export batch with target-resolution validation.
(define-module (gaurix packages queue-20260403p100daily)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:export (
            grimblast-git
            inkscape-bin
            hyprland-git
            beads-git
            ttf-mononoki
            ttf-recursive
            tmsu-bin
            helix-git
            elm-bin
            nim-git
            tome4-bin
            ttf-comic-neue
            wdisplays-git
            qdmr-git
            jitterentropy-rngd-git
            python-pywal16-git
            rot8-git
            star-bin
            ))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))
(define-public grimblast-git
  (gaurix-alias-package "grimblast-git" "grimblast"))
(define-public inkscape-bin
  (gaurix-alias-package "inkscape-bin" "inkscape"))
(define-public hyprland-git
  (gaurix-alias-package "hyprland-git" "hyprland"))
(define-public beads-git
  (gaurix-alias-package "beads-git" "beads"))
(define-public ttf-mononoki
  (gaurix-alias-package "ttf-mononoki" "font-mononoki"))
(define-public ttf-recursive
  (gaurix-alias-package "ttf-recursive" "font-recursive"))
(define-public tmsu-bin
  (gaurix-alias-package "tmsu-bin" "tmsu"))
(define-public helix-git
  (gaurix-alias-package "helix-git" "helix"))
(define-public elm-bin
  (gaurix-alias-package "elm-bin" "elm"))
(define-public nim-git
  (gaurix-alias-package "nim-git" "nim"))
(define-public tome4-bin
  (gaurix-alias-package "tome4-bin" "tome4"))
(define-public ttf-comic-neue
  (gaurix-alias-package "ttf-comic-neue" "font-comic-neue"))
(define-public wdisplays-git
  (gaurix-alias-package "wdisplays-git" "wdisplays"))
(define-public qdmr-git
  (gaurix-alias-package "qdmr-git" "qdmr"))
(define-public jitterentropy-rngd-git
  (gaurix-alias-package "jitterentropy-rngd-git" "jitterentropy-rngd"))
(define-public python-pywal16-git
  (gaurix-alias-package "python-pywal16-git" "python-pywal16"))
(define-public rot8-git
  (gaurix-alias-package "rot8-git" "rot8"))
(define-public star-bin
  (gaurix-alias-package "star-bin" "star"))
