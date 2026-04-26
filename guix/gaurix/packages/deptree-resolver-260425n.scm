;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425n
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (2): openssl-gost-engine, decrypto-pro
;;; Remaining BLOCKED: 99 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages perl)             ; perl
  #:use-module (gnu packages tls)              ; openssl
  #:export (openssl-gost-engine
            decrypto-pro))


;;; ---- 1. openssl-gost-engine ----
;;; AUR: openssl-gost-engine
;;; Reference implementation of the Russian GOST crypto algorithms
;;; for OpenSSL 3.x.  Builds as a provider module (ossl-modules/gost.so).
;;; Requires libprov submodule (provider-corner/libprov).
;;; License: MIT

(define %libprov-commit "8a126e0")

(define libprov-source
  (origin
    (method url-fetch)
    (uri (string-append
          "https://github.com/provider-corner/libprov/archive/"
          %libprov-commit ".tar.gz"))
    (file-name (string-append "libprov-" %libprov-commit ".tar.gz"))
    (sha256
     (base32 "14bsp121pmp51j142qh7hqcfrd6ch6h9almn203bsp1i158xgqg1"))))

(define-public openssl-gost-engine
  (package
    (name "openssl-gost-engine")
    (version "3.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/gost-engine/engine/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0db7sv9wcj66pkzqc4llcyylvisqnbcc1s742b6bpf087lrqiy4c"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list (string-append "-DOPENSSL_ROOT_DIR="
                             (assoc-ref %build-inputs "openssl"))
              (string-append "-DOPENSSL_ENGINES_DIR="
                             #$output "/lib/engines-3")
              (string-append "-DOPENSSL_MODULES_DIR="
                             #$output "/lib/ossl-modules"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'install-libprov-submodule
            (lambda _
              (let ((libprov-src #$(file-append libprov-source)))
                (invoke "tar" "xzf" libprov-src "-C" ".")
                (rename-file
                 (string-append "libprov-"
                                "8a126e09547630ef900177625626b6156052f0ee")
                 "libprov"))))
          (add-after 'install 'install-conf
            (lambda _
              (let ((conf-dir (string-append #$output "/etc/ssl")))
                (mkdir-p conf-dir)
                (with-output-to-file (string-append conf-dir "/gost.cnf")
                  (lambda ()
                    (display
                     (string-append
                      "openssl_conf = openssl_def\n"
                      "[openssl_def]\n"
                      "providers = provider_sect\n"
                      "[provider_sect]\n"
                      "gost = gost_sect\n"
                      "[gost_sect]\n"
                      "module = " #$output "/lib/ossl-modules/gost.so\n"
                      "activate = 1\n"))))))))))
    (native-inputs (list perl))
    (inputs (list openssl))
    (synopsis "Russian GOST crypto algorithms for OpenSSL")
    (description "This package provides a reference implementation of the
Russian GOST cryptographic algorithms as an OpenSSL 3.x provider module.
It implements GOST R 34.10-2012, GOST R 34.11-2012, GOST 28147-89, and
related standards.")
    (home-page "https://github.com/gost-engine/engine/")
    (license license:expat)))


;;; ---- 2. decrypto-pro ----
;;; AUR: decrypto-pro-git (#18291)
;;; Utility for converting CryptoPro CSP key containers to PEM keys.
;;; Simple C program, links against OpenSSL + gost engine shared lib.
;;; Bundles its own copies of the GOST headers.
;;; License: MIT

(define %decrypto-pro-commit "5db36aa56b3ef58277592c0c8135d00da4421584")

(define-public decrypto-pro
  (package
    (name "decrypto-pro")
    (version (string-append "0.0.0-0." (string-take %decrypto-pro-commit 7)))
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vitalif/decrypto-pro/archive/"
             %decrypto-pro-commit ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i24g720is1inxrpqhzdchj9a3r8zpj6lmv6jyaw8f64sqs74jcg"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                               ;no test suite
      #:make-flags
      #~(list (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)                    ;no configure script
          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((gost-so (search-input-file
                              inputs "lib/libgost.so")))
                (invoke (or (getenv "CC") "gcc")
                        "-o" "decrypto-pro" "decrypto-pro.c"
                        gost-so "-lssl" "-lcrypto"))))
          (replace 'install
            (lambda _
              (let ((bin (string-append #$output "/bin")))
                (mkdir-p bin)
                (install-file "decrypto-pro" bin)))))))
    (inputs (list openssl openssl-gost-engine))
    (synopsis "Convert CryptoPro CSP key containers to PEM")
    (description "Decrypto-pro converts CryptoPro CSP (Crypto-Pro
Cryptographic Service Provider) key containers to standard PEM format
private keys.  It supports GOST R 34.10-2001 and GOST R 34.10-2012
key algorithms commonly used in Russian government and financial
systems.")
    (home-page "https://github.com/vitalif/decrypto-pro")
    (license license:expat)))
