;;; Round-22 resolution for blocked-tree run cron-c79f127f worker w00.
;;; 2 new recipes: python-steamgriddb, python-materialyoucolor
;;; 1 BLOCKED: cosmic-icons-git (MISSING_GUIX_DEPS — pop-icon-theme-git)
(define-module (gaurix packages cron-c79f127f-r22-w00)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:export (python-steamgriddb
            python-materialyoucolor))

;; ──────────────────────────────────────────────
;; 1. python-steamgriddb — Python wrapper for SteamGridDB API
;; ──────────────────────────────────────────────
(define-public python-steamgriddb
  (package
    (name "python-steamgriddb")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "python-steamgriddb" version))
       (sha256
        (base32 "0sah4hbbydqzv69509q8965x2p37p57z135n80xsfpc616xvfv83"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-requests))
    (home-page "https://github.com/ZebcoWeb/python-steamgriddb")
    (synopsis "Python wrapper for SteamGridDB's API")
    (description
     "python-steamgriddb provides a Python interface to the SteamGridDB API,
allowing users to search for and retrieve custom game art, icons, heroes,
logos, and grid images for Steam games.")
    (license license:expat)))

;; ──────────────────────────────────────────────
;; 2. python-materialyoucolor — Material You color generation for Python
;; ──────────────────────────────────────────────
(define-public python-materialyoucolor
  (package
    (name "python-materialyoucolor")
    (version "3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/T-Dynamos/materialyoucolor-python"
             "/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "1v59vafzx26h2y365wbcj95yvishg1zvdmrmbyv8fsx2mq7ky0da"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite included
    (native-inputs (list python-setuptools python-wheel pybind11))
    (propagated-inputs (list python-pillow))
    (home-page "https://github.com/T-Dynamos/materialyoucolor-python")
    (synopsis "Material You color generation library for Python")
    (description
     "materialyoucolor implements Google's Material You dynamic color
algorithms in Python.  It can extract dominant colors from images and
generate full Material You color palettes, supporting both a pure-Python
mode and an optional C++ accelerated backend via pybind11.")
    (license license:expat)))
