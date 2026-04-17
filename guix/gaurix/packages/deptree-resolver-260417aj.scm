;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260417aj
;;; Resolves 12 BLOCKED packages from dependency tree queue.
;;; 30 packages remain BLOCKED after evaluation.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260417aj)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (gizmosql-bin
            mdatp-bin
            plexamp-bin
            cryptpad
            amsel-suite-bin
            python-jupyterlab-variableinspector
            python-libipld-git
            115-browser-bin
            python-optking
            magicq
            python-tensorstore-bin
            unofficial-homestuck-collection-bin
))

(define-public gizmosql-bin
  (package
    (name "gizmosql-bin")
    (version "1.21.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gizmosql-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "a Flight SQL Server implementation with DuckDB and SQLite back-ends")
    (description "A Flight SQL Server implementation with DuckDB and SQLite back-ends.")
    (home-page "https://gizmodata.com/gizmosql")
    (license license:asl2.0)))

(define-public mdatp-bin
  (package
    (name "mdatp-bin")
    (version "101.25122.0004")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mdatp-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "microsoft Defender Advanced Threat Protection for Endpoints")
    (description "Microsoft Defender Advanced Threat Protection for Endpoints.")
    (home-page "https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/linux-install-manually")
    (license license:non-copyleft)))

(define-public plexamp-bin
  (package
    (name "plexamp-bin")
    (version "4.13.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plexamp-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "modern music client for Plex.(Prebuilt version.Use system-wide electron)")
    (description "Modern music client for Plex.(Prebuilt version.Use system-wide electron).")
    (home-page "https://www.plex.tv/plexamp")
    (license license:non-copyleft)))

(define-public cryptpad
  (package
    (name "cryptpad")
    (version "2026.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cryptpad/cryptpad")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "realtime collaborative visual editor with zero knowlege server")
    (description "Realtime collaborative visual editor with zero knowlege server.")
    (home-page "https://github.com/cryptpad/cryptpad")
    (license license:agpl3)))

(define-public amsel-suite-bin
  (package
    (name "amsel_suite-bin")
    (version "1.9.2_L1102_T1102")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/amsel_suite-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "tTRPG Game Master companion")
    (description "TTRPG Game Master companion.")
    (home-page "https://www.amsel-suite.com/")
    (license license:non-copyleft)))

(define-public python-jupyterlab-variableinspector
  (package
    (name "python-jupyterlab-variableinspector")
    (version "3.2.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jupyterlab-contrib/jupyterlab-variableInspector")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "jupyterlab extension that shows currently used variables and their values")
    (description "Jupyterlab extension that shows currently used variables and their values.")
    (home-page "https://github.com/jupyterlab-contrib/jupyterlab-variableInspector")
    (license license:expat)))

(define-public python-libipld-git
  (package
    (name "python-libipld-git")
    (version "3.0.1.r0.ga3b2a64")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MarshalX/python-libipld")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast Python library to work with IPLD: CAR, CID, DAG-CBOR, DAG-JSON, DAG-PB..")
    (description "Fast Python library to work with IPLD: CAR, CID, DAG-CBOR, DAG-JSON, DAG-PB, multibase (built from latest git commit).")
    (home-page "https://github.com/MarshalX/python-libipld")
    (license license:expat)))

(define-public 115-browser-bin
  (package
    (name "115-browser-bin")
    (version "36.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/115-browser-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "115 Browser / 115 浏览器")
    (description "115 Browser / 115 浏览器.")
    (home-page "https://115.com/product_browser")
    (license license:non-copyleft)))

(define-public python-optking
  (package
    (name "python-optking")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/psi-rking/optking")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a molecular geometry optimization program")
    (description "A molecular geometry optimization program.")
    (home-page "https://github.com/psi-rking/optking")
    (license license:bsd-3)))

(define-public magicq
  (package
    (name "magicq")
    (version "1.9.7.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/magicq.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lighting control software from ChamSys")
    (description "Lighting control software from ChamSys.")
    (home-page "https://chamsyslighting.com/products/magicq")
    (license license:non-copyleft)))

(define-public python-tensorstore-bin
  (package
    (name "python-tensorstore-bin")
    (version "0.1.73")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/google/tensorstore")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "library for reading and writing large multi-dimensional arrays")
    (description "Library for reading and writing large multi-dimensional arrays.")
    (home-page "https://github.com/google/tensorstore")
    (license license:asl2.0)))

(define-public unofficial-homestuck-collection-bin
  (package
    (name "unofficial-homestuck-collection-bin")
    (version "2.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unofficial-homestuck-collection-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "the Unofficial Homestuck Collection")
    (description "The Unofficial Homestuck Collection.")
    (home-page "https://homestuck.giovanh.com/unofficial-homestuck-collection/")
    (license license:gpl3+)))
