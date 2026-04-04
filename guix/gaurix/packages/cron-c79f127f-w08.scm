;;; Package mappings for blocked-tree run cron-c79f127f worker w08.
(define-module (gaurix packages cron-c79f127f-w08)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages browser-extensions)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages time)
  #:export (radicle-node
            web-eid-native
            python-eval-type-backport
            python-typing-inspection
            python-jsonpath
            python-mistralai))

(define-public radicle-node
  ;; AUR compatibility alias: upstream Guix package name is "radicle".
  (package
    (inherit radicle)
    (name "radicle-node")))

(define-public web-eid-native
  ;; AUR compatibility alias: upstream Guix package name is "web-eid-host".
  (package
    (inherit web-eid-host)
    (name "web-eid-native")))

(define-public python-eval-type-backport
  (package
    (name "python-eval-type-backport")
    (version "0.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/alexmojaki/eval_type_backport")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1a4d5kalnx9r3m3i9357yhy92201qfs59bscsqjnj8niqp27cdfw"))))
    (build-system pyproject-build-system)
    (native-inputs
     (list python-pytest
           python-setuptools
           python-setuptools-scm
           python-wheel))
    (home-page "https://github.com/alexmojaki/eval_type_backport")
    (synopsis "Backport of modern typing evaluation helpers")
    (description
     "This package provides helpers equivalent to typing._eval_type so older
Python versions can evaluate newer typing features.")
    (license license:expat)))

(define-public python-typing-inspection
  (package
    (name "python-typing-inspection")
    (version "0.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pydantic/typing-inspection")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dqib4arxxaxwyapw6y4pcvm38l8djkhd8cfr149w42bw4xrqr38"))))
    (build-system pyproject-build-system)
    (propagated-inputs
     (list python-typing-extensions))
    (native-inputs (list python-hatchling))
    (home-page "https://github.com/pydantic/typing-inspection")
    (synopsis "Runtime typing introspection helpers")
    (description
     "This package provides runtime helpers for introspecting Python typing
constructs.")
    (license license:expat)))

(define-public python-jsonpath
  (package
    (name "python-jsonpath")
    (version "1.1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sean2077/jsonpath-python")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ydgnhij15dwsxjv90rbmy9m17h6qpx5vfh0i9nhrxk85kg0d2yf"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-hatchling))
    (home-page "https://github.com/sean2077/jsonpath-python")
    (synopsis "Lightweight JSONPath implementation for Python")
    (description
     "This package provides a lightweight JSONPath implementation for Python.")
    (license license:expat)))

(define-public python-mistralai
  (package
    (name "python-mistralai")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mistralai" version))
       (sha256
        (base32 "1sxriqxixbi0q44d136c8la7xblhw30sb5721r08ia55gqjgmas8"))))
    (build-system pyproject-build-system)
    ;; Upstream test suite requires additional network/service setup.
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-eval-type-backport
           python-httpx
           python-jsonpath
           python-opentelemetry-api
           python-opentelemetry-semantic-conventions
           python-pydantic
           python-dateutil
           python-typing-inspection))
    (native-inputs (list python-hatchling))
    (home-page "https://github.com/mistralai/client-python")
    (synopsis "Python client SDK for Mistral AI")
    (description
     "This package provides the official Python client SDK for the Mistral AI
API.")
    (license license:asl2.0)))
