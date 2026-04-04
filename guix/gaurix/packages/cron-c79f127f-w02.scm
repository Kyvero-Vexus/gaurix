;;; Chunk-local module for blocked-tree run cron-c79f127f (worker w02).
(define-module (gaurix packages cron-c79f127f-w02)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:autoload (gnu packages) (specification->package)
  #:use-module (gnu packages python)
  #:export (archlinux-java-run
            auto-auto-complete
            python-opencensus-context
            python-opencensus
            c++utilities
            xlibre-xserver-common-git
            jdk25-graalvm-bin
            cpp-jwt
            python-art))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

(define-public archlinux-java-run
  (gaurix-alias-package "archlinux-java-run" "openjdk"))

(define-public auto-auto-complete
  (package
    (name "auto-auto-complete")
    (version "7.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://codeberg.org/maandree/auto-auto-complete/archive/"
                           version
                           ".tar.gz"))
       (sha256
        (base32 "0lnk02ivkl85c6qv0jnmic3bck2ma6y62q5i0ccy53kdwlppjclb"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "MANPREFIX=" #$output "/share/man"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list python))
    (home-page "https://codeberg.org/maandree/auto-auto-complete")
    (synopsis "Autogenerate shell completion scripts")
    (description
     "Auto Auto Complete autogenerates shell completion scripts for programs
from a compact completion definition format.")
    (license license:isc)))

(define-public python-opencensus-context
  (package
    (name "python-opencensus-context")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opencensus-context" version))
       (sha256
        (base32 "1308y0bqb8dkp7wig69ajxhzlq9i0cgqlp6zbnxq130dq71hhcd0"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page
     "https://github.com/census-instrumentation/opencensus-python/tree/master/context/opencensus-context")
    (synopsis "Runtime context support for OpenCensus")
    (description
     "This package provides runtime context support used by OpenCensus Python
libraries.")
    (license license:asl2.0)))

(define-public python-opencensus
  (package
    (name "python-opencensus")
    (version "0.11.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opencensus" version))
       (sha256
        (base32 "1wpg8kjqr594qap42b05dn5a7flbsp7a3hp5c2mn8c3pp3c8gvyb"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list (specification->package "python-google-api-core")
           python-opencensus-context
           (specification->package "python-six")))
    (home-page "https://github.com/census-instrumentation/opencensus-python")
    (synopsis "Stats collection and distributed tracing framework")
    (description
     "OpenCensus is a Python library for application metrics, distributed
tracing, and context propagation.")
    (license license:asl2.0)))

(define-public c++utilities
  (gaurix-alias-package "c++utilities" "cpp-utilities"))

(define-public xlibre-xserver-common-git
  (gaurix-alias-package "xlibre-xserver-common-git" "xorg-server"))

(define-public jdk25-graalvm-bin
  (gaurix-alias-package "jdk25-graalvm-bin" "openjdk"))

(define-public cpp-jwt
  (package
    (name "cpp-jwt")
    (version "1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/arun11299/cpp-jwt/archive/refs/tags/v"
                           version
                           ".tar.gz"))
       (sha256
        (base32 "1cpd04invabashh9yb47brcwfzvvs8qd9dsb6gkcm0hakdhrv9a4"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      '("-DCPP_JWT_BUILD_EXAMPLES=OFF"
        "-DCPP_JWT_BUILD_TESTS=OFF"
        "-DCPP_JWT_USE_VENDORED_NLOHMANN_JSON=OFF")))
    (inputs (list (specification->package "nlohmann-json")
                  (specification->package "openssl")))
    (home-page "https://github.com/arun11299/cpp-jwt")
    (synopsis "JSON Web Token library for C++")
    (description
     "This package provides a C++ library for creating and validating JSON Web
Tokens (JWT), using OpenSSL and nlohmann-json.")
    (license license:expat)))

(define-public python-art
  (package
    (name "python-art")
    (version "6.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/sepandhaghighi/art/archive/refs/tags/v"
                           version
                           ".tar.gz"))
       (sha256
        (base32 "1qswlwzmr41251fpgzsgp35brjkfg4b56lvbnw24w87iq1662nlh"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/sepandhaghighi/art")
    (synopsis "ASCII art library for Python")
    (description
     "Art is a Python library for rendering decorative ASCII art strings,
including text fonts and symbols.")
    (license license:expat)))
