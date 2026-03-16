(define-module (gaurix packages queue-20260316d)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:export (goldendict-ng
            sirikali))

(define-public goldendict-ng (specification->package "goldendict-ng"))
(define-public sirikali (specification->package "sirikali"))
