(define-module (gaurix packages queue-20260319)
  #:use-module (guix packages)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages games)
  #:use-module ((gnu packages tls) #:prefix gnu:)
  #:use-module (gaurix packages sunshine-bin)
  #:export (evince-no-gnome
            openssl-static
            audacity-plugins
            sunshine-beta-bin
            powder-toy))

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

(define-public audacity-plugins
  (package
    (inherit audacity)
    (name "audacity-plugins")
    (synopsis "Compatibility package name for Audacity")
    (description
     "Compatibility package that provides Audacity under the AUR-style package\nname audacity-plugins.")))

(define-public sunshine-beta-bin
  (package
    (inherit sunshine-bin)
    (name "sunshine-beta-bin")
    (synopsis "Compatibility package name for Sunshine binary package")
    (description
     "Compatibility package that provides sunshine-bin under the AUR-style\npackage name sunshine-beta-bin.")))

(define-public powder-toy
  (package
    (inherit the-powder-toy)
    (name "powder-toy")
    (synopsis "Compatibility package name for The Powder Toy")
    (description
     "Compatibility package that provides The Powder Toy under the AUR-style\npackage name powder-toy.")))
