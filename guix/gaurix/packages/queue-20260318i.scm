(define-module (gaurix packages queue-20260318i)
  #:use-module (guix packages)
  #:use-module (gnu packages linux)
  #:export (linux-mainline-headers))

(define-public linux-mainline-headers
  (package (inherit linux-libre-headers) (name "linux-mainline-headers")))
