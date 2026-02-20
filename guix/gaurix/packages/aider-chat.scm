(define-module (gaurix packages aider-chat)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system pyproject)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build))

(define-public aider-chat
  (package
    (name "aider-chat")
    (version "0.86.2")
    (source
     (origin
       (method url-fetch)
       ;; Authoritative upstream source/version follows AUR PKGBUILD.
       (uri (string-append
             "https://github.com/Aider-AI/aider/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "094aci638crl5l4mrzip5s32nz740d8i13xv8i7jnj3qcynclp0w"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'sanity-check)
          (add-before 'build 'set-version
            (lambda _
              ;; Tarball builds need an explicit version for setuptools-scm.
              (setenv "SETUPTOOLS_SCM_PRETEND_VERSION" #$version))))))
    (native-inputs
     (list python-setuptools
           python-setuptools-scm
           python-wheel))
    (home-page "https://github.com/Aider-AI/aider")
    (synopsis "AI pair programming in your terminal")
    (description
     "Aider is a command-line AI pair programming assistant that edits code in
your local Git repositories.")
    (license license:asl2.0)))
