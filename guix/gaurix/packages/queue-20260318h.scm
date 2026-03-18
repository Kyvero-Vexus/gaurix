(define-module (gaurix packages queue-20260318h)
  #:use-module (guix packages)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages xdisorg)
  #:export (linux-mkopec-git-headers
            linux-mkopec-git
            wvkbd-deskintl
            linux-bsb-headers
            linux-bsb))

(define-public linux-mkopec-git-headers
  (package (inherit linux-libre-headers) (name "linux-mkopec-git-headers")))

(define-public linux-mkopec-git
  (package (inherit linux-libre) (name "linux-mkopec-git")))

(define-public wvkbd-deskintl
  (package (inherit wvkbd) (name "wvkbd-deskintl")))

(define-public linux-bsb-headers
  (package (inherit linux-libre-headers) (name "linux-bsb-headers")))

(define-public linux-bsb
  (package (inherit linux-libre) (name "linux-bsb")))
