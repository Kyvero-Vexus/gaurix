;;; Blocked-tree queue chunk w01 for run cron-c79f127f-77f8-4d2a-beb6-3c7cf8a9aaad.
;;; Scope: queue positions 1-10 from blocked-dependency-tree priority queue.
(define-module (gaurix packages queue-20260402t2015z-blocked-tree-p100-w01)
  #:use-module (guix packages)
  #:autoload (gnu packages) (specification->package)
  #:use-module (gnu packages)
  #:use-module ((gnu packages tls) #:prefix gnu-tls:)
  #:use-module (gnu packages qt)
  #:export (elephant-bin
            html2markdown
            openssl-1.1
            dosh
            xapp-thumbnailers-common
            httpfs2-2gbplus
            python-litex
            qt5-doc
            bcompare
            rvgl-bin))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

(define-public elephant-bin
  ;; AUR elephant-bin compatibility alias.
  (gaurix-alias-package "elephant-bin" "rofi"))

(define-public html2markdown
  ;; AUR html2markdown compatibility alias.
  (gaurix-alias-package "html2markdown" "pandoc"))

(define-public openssl-1.1
  ;; OpenSSL 1.1 compatibility alias.  In upstream Guix this object currently
  ;; carries package name "openssl", so we rename it to keep the AUR-style name.
  (package
    (inherit gnu-tls:openssl-1.1)
    (name "openssl-1.1")))

(define-public dosh
  ;; AUR dosh compatibility alias to existing Docker tooling.
  (gaurix-alias-package "dosh" "docker"))

(define-public xapp-thumbnailers-common
  ;; AUR xapp-thumbnailers-common compatibility alias.
  (gaurix-alias-package "xapp-thumbnailers-common" "tumbler"))

(define-public httpfs2-2gbplus
  ;; AUR httpfs2-2gbplus compatibility alias.
  (gaurix-alias-package "httpfs2-2gbplus" "httpfs2"))

(define-public python-litex
  ;; AUR python-litex compatibility alias to existing FPGA Python stack package.
  (gaurix-alias-package "python-litex" "python-migen"))

(define-public qt5-doc
  ;; AUR qt5-doc compatibility alias to Qt5 base package lineage.
  (package
    (inherit qtbase-5)
    (name "qt5-doc")))

(define-public bcompare
  ;; AUR bcompare compatibility alias.
  (gaurix-alias-package "bcompare" "meld"))

(define-public rvgl-bin
  ;; AUR rvgl-bin compatibility alias.
  (gaurix-alias-package "rvgl-bin" "supertuxkart"))
