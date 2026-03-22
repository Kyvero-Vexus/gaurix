(define-module (gaurix packages queue-20260322p100)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:export (
            f3-git
            ))

(define-public f3-git
  (package
    (inherit (specification->package "f3"))
    (name "f3-git")))
