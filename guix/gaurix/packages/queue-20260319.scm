(define-module (gaurix packages queue-20260319)
  #:use-module (guix packages)
  #:use-module (gnu packages gnome)
  #:use-module ((gnu packages tls) #:prefix gnu:)
  #:export (evince-no-gnome
            openssl-static))

(define-public evince-no-gnome
  (package
    (inherit evince)
    (name "evince-no-gnome")
    (synopsis "Compatibility package name for Evince")
    (description
     "Compatibility package that provides Evince under the AUR-style package\nname evince-no-gnome.")))

(define-public openssl-static
  (package
    (inherit gnu:openssl)
    (name "openssl-static")
    (synopsis "Compatibility package name for OpenSSL")
    (description
     "Compatibility package that provides OpenSSL under the AUR-style package\nname openssl-static.")))
