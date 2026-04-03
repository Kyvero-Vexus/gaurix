;;; Queue drain 2026-04-03 daily run batch 3.
;;; Attempted 100 TODO-status entries from todo_general_packages.org.
;;; Status: 9 validated upstream alias packages; 91 blockers recorded separately.
(define-module (gaurix packages queue-20260403p100daily3)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:export (
            rtl_433-git
            sdl_pango
            klassy-qt5
            keepassxc-qt6
            ocaml-ppx_expect
            qcustomplot-qt6
            kseexpr-qt6-git
            buku_run-git
            otf-oswald
            ))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))
(define-public rtl_433-git
  (gaurix-alias-package "rtl_433-git" "rtl-433"))
(define-public sdl_pango
  (gaurix-alias-package "sdl_pango" "sdl-pango"))
(define-public klassy-qt5
  (gaurix-alias-package "klassy-qt5" "klassy"))
(define-public keepassxc-qt6
  (gaurix-alias-package "keepassxc-qt6" "keepassxc"))
(define-public ocaml-ppx_expect
  (gaurix-alias-package "ocaml-ppx_expect" "ocaml-ppx-expect"))
(define-public qcustomplot-qt6
  (gaurix-alias-package "qcustomplot-qt6" "qcustomplot"))
(define-public kseexpr-qt6-git
  (gaurix-alias-package "kseexpr-qt6-git" "kseexpr"))
(define-public buku_run-git
  (gaurix-alias-package "buku_run-git" "buku-run"))
(define-public otf-oswald
  (gaurix-alias-package "otf-oswald" "font-oswald"))
