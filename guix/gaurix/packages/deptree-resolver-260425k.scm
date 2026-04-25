;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425k
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (2): perl-compress-raw-lzma, unpack-install-jammer
;;; Already in Guix (1): python2-dbus
;;; Already resolved (1): bililive-recorder (binary variant exists)
;;; Remaining BLOCKED: 97 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425k)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:export (perl-compress-raw-lzma
            unpack-install-jammer))


;;; ---- 1. perl-compress-raw-lzma ----
;;; Dependency for unpack-install-jammer.
;;; CPAN: Compress-Raw-Lzma
;;; Low-level Perl interface to the lzma/xz compression library.

(define-public perl-compress-raw-lzma
  (package
    (name "perl-compress-raw-lzma")
    (version "2.221")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://cpan/authors/id/P/PM/PMQS/Compress-Raw-Lzma-" version
             ".tar.gz"))
       (sha256
        (base32 "0zzd9bnbzkfpvbp9h8n42lb833nzad9kygfchvrf9cr9gxyd3cp8"))))
    (build-system perl-build-system)
    (inputs (list xz))
    (home-page "https://metacpan.org/release/Compress-Raw-Lzma")
    (synopsis "Low-level interface to the lzma compression library")
    (description "Compress::Raw::Lzma provides a Perl interface to the lzma
compression library.  It is used by IO::Compress::Lzma and other modules for
LZMA/XZ compression and decompression.")
    (license license:perl-license)))


;;; ---- 2. unpack-install-jammer ----
;;; AUR: unpack-install-jammer (#18756)
;;; Extract files from InstallJammer installers
;;; License: GPL-3.0-or-later

(define-public unpack-install-jammer
  (package
    (name "unpack-install-jammer")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lod/unpack-install-jammer/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "08qz7lkcgdqz6bw0arm58hmv437nvkcrbfzkqv73gqqjqba9wizw"))))
    (build-system perl-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (copy-file "extract.pl"
                           (string-append bin "/unpack-install-jammer"))
                (chmod (string-append bin "/unpack-install-jammer") #o755)
                (wrap-program (string-append bin "/unpack-install-jammer")
                  `("PERL5LIB" ":" prefix
                    (,(getenv "PERL5LIB"))))))))))
    (propagated-inputs
     (list perl-modern-perl
           perl-compress-raw-lzma
           perl-term-progressbar
           perl-data-dump
           perl-file-homedir))
    (home-page "https://github.com/lod/unpack-install-jammer")
    (synopsis "Extract files from InstallJammer installers")
    (description "Unpack-install-jammer is a tool that extracts files from
InstallJammer format installers.  It supports decompression of LZMA-compressed
installer payloads and can list or extract the contained files.")
    (license license:gpl3+)))
