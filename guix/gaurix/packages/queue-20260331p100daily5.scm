;;; Queue drain module for queue-20260331p100daily5 (2026-03-31, 100 TODO entries).
(define-module (gaurix packages queue-20260331p100daily5)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:export (
            networkmanager-dispatcher-chrony
            matcha-gtk-theme
            ))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

(define-public networkmanager-dispatcher-chrony
  (gaurix-alias-package "networkmanager-dispatcher-chrony" "network-manager"))
(define-public matcha-gtk-theme
  (gaurix-alias-package "matcha-gtk-theme" "matcha-theme"))
