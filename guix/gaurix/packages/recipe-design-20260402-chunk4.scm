(define-module (gaurix packages recipe-design-20260402-chunk4)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix build-system python) #:select (pypi-uri python-build-system))
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages xml)
  #:export (python-curlify
            openhue-cli
            claude-code-seccomp
            bapctools-git
            szsol-rs
            pricehist
            python-pysmart
            python-aiohttp-jinja2
            fish-session
            cliamp-bin
            cliamp
            podserv-b-bin
            podserv-b-git))

(define bapctools-git-commit
  "16e23ee1f866f17ea71756b77897230e73b948e3")

(define-public python-curlify
  (package
    (name "python-curlify")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "curlify" version))
       (sha256
        (base32 "0vfxdmr1gqmfsny3hn1dccq6s6a5k13fyiggx0nrbbsz4gkh4gqd"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-requests))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/ofw/curlify")
    (synopsis "Generate cURL commands from Python Requests objects")
    (description
     "Curlify converts Python Requests objects into equivalent cURL command
lines, making it easier to inspect and reproduce HTTP traffic.")
    (license license:expat)))

(define-public openhue-cli
  (package
    (name "openhue-cli")
    (version "0.23")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/openhue/openhue-cli/releases/download/"
             version "/openhue_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "1xh2z3k0z6njg5zlx12jdcakm1qcs6wg049cxq74hijrbnn7hb3q"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (bin (string-append out "/bin"))
                 (licenses (string-append out "/share/licenses/openhue-cli")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (mkdir-p bin)
            (install-file "openhue" bin)
            (rename-file (string-append bin "/openhue")
                         (string-append bin "/openhue-cli"))
            (symlink "./openhue-cli" (string-append bin "/openhue"))
            (chmod (string-append bin "/openhue-cli") #o755)
            (mkdir-p licenses)
            (install-file "LICENSE" licenses)
            #t))))
    (home-page "https://www.openhue.io/cli/openhue-cli")
    (synopsis "Command-line client for Philips Hue systems")
    (description
     "OpenHue CLI is a command-line client for interacting with Philips Hue
bridges, lights, and related smart-lighting resources.")
    (license license:asl2.0)))

(define-public claude-code-seccomp
  (package
    (name "claude-code-seccomp")
    (version "0.0.35")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://raw.githubusercontent.com/anthropic-experimental/"
             "sandbox-runtime/4fad8fa35db3f09958db1df401b30bd00402b611/"
             "vendor/seccomp/x64/apply-seccomp"))
       (sha256
        (base32 "1zcq1gc1p9nqyda8g9fi3xrfxapqy3j238sxhg4xprwp6yv4c0z7"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     (list
      (list "unix-block-bpf"
            (origin
              (method url-fetch)
              (uri (string-append
                    "https://raw.githubusercontent.com/anthropic-experimental/"
                    "sandbox-runtime/4fad8fa35db3f09958db1df401b30bd00402b611/"
                    "vendor/seccomp/x64/unix-block.bpf"))
              (sha256
               (base32 "01w8hr79mk93f3p8xavhsd2m1k9q76n9pcrsn56r6rs2smh5klf4"))))))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (apply-seccomp (assoc-ref %build-inputs "source"))
                 (unix-block (assoc-ref %build-inputs "unix-block-bpf"))
                 (target (string-append out "/lib/claude-code-seccomp")))
            (mkdir-p target)
            (copy-file apply-seccomp (string-append target "/apply-seccomp"))
            (copy-file unix-block (string-append target "/unix-block.bpf"))
            (chmod (string-append target "/apply-seccomp") #o755)
            #t))))
    (home-page "https://github.com/anthropic-experimental/sandbox-runtime")
    (synopsis "Seccomp assets used by Claude Code sandbox runtime")
    (description
     "This package installs the @code{apply-seccomp} helper binary and the
@code{unix-block.bpf} filter file used by the Claude Code sandbox runtime.")
    (license license:asl2.0)))

(define-public bapctools-git
  (package
    (name "bapctools-git")
    (version "r1310.16e23ee")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/RagnarGrootKoerkamp/BAPCtools/archive/"
                           bapctools-git-commit ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jr44rw5gnhhpbc7cczj8rg547bali7qmnym42iwk61vppd9da59"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (propagated-inputs
     (list python
           python-argcomplete
           python-colorama
           python-pyyaml
           python-requests
           python-ruamel.yaml))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (share (string-append out "/share"))
                 (pkgdir (string-append share "/bapctools"))
                 (bin (string-append out "/bin"))
                 (license-dir (string-append out "/share/licenses/bapctools-git"))
                 (srcdir (string-append "BAPCtools-" #$bapctools-git-commit)))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (copy-recursively srcdir pkgdir)
            (when (file-exists? (string-append pkgdir "/test"))
              (delete-file-recursively (string-append pkgdir "/test")))
            (when (file-exists? (string-append pkgdir "/doc/images"))
              (delete-file-recursively (string-append pkgdir "/doc/images")))
            (mkdir-p bin)
            (symlink (string-append pkgdir "/bin/tools.py")
                     (string-append bin "/bt"))
            (mkdir-p license-dir)
            (install-file (string-append pkgdir "/LICENSE") license-dir)
            #t))))
    (home-page "https://github.com/RagnarGrootKoerkamp/BAPCtools")
    (synopsis "Tools for developing ICPC-style programming contest problems")
    (description
     "BAPCtools is a toolkit for contest organizers and problem authors.
It includes commands for generating, validating, and exporting ICPC-style
problem sets.")
    (license license:gpl3)))

(define-public szsol-rs
  (package
    (name "szsol-rs")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ghoker143/szsol-rs/releases/download/v"
             version "/szsol-rs-x86_64-unknown-linux-gnu.tar.xz"))
       (sha256
        (base32 "1mdmrlzw9w5sslrqmijk36aid19rhzv3x60fbj394ykixi1v6g5a"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs (list tar xz))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz (search-input-file %build-inputs "/bin/xz"))
                 (bin (string-append out "/bin"))
                 (doc (string-append out "/share/doc/szsol-rs"))
                 (licenses (string-append out "/share/licenses/szsol-rs"))
                 (extract-dir "szsol-rs-x86_64-unknown-linux-gnu"))
            (invoke tar (string-append "--use-compress-program=" xz) "-xf" src)
            (mkdir-p bin)
            (install-file (string-append extract-dir "/szsol-rs") bin)
            (chmod (string-append bin "/szsol-rs") #o755)
            (mkdir-p doc)
            (install-file (string-append extract-dir "/README.MD") doc)
            (mkdir-p licenses)
            (install-file (string-append extract-dir "/LICENSE") licenses)
            #t))))
    (home-page "https://github.com/ghoker143/szsol-rs")
    (synopsis "Solitaire card game from SHENZHEN I/O")
    (description
     "Szsol-rs is a terminal-based solitaire card game inspired by
SHENZHEN I/O.")
    (license license:expat)))

(define-public pricehist
  (package
    (name "pricehist")
    (version "1.4.14")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pricehist" version))
       (sha256
        (base32 "116fjbmkw5ckd9y621g6gz6g16sk55j9x2yxi65g1z3rwjx9ihv4"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'sanity-check)
          (add-after 'unpack 'relax-lxml-upper-bound
            (lambda _
              (substitute* "pyproject.toml"
                (("lxml<6\\.0\\.0") "lxml<7.0.0"))
              #t)))))
    (propagated-inputs
     (list python-cssselect
           python-curlify
           python-lxml
           python-requests))
    (native-inputs
     (list python-poetry-core
           python-setuptools-scm
           python-wheel))
    (home-page "https://gitlab.com/chrisberkhout/pricehist")
    (synopsis "Fetch and format historical price data")
    (description
     "Pricehist is a command-line utility for fetching and formatting
historical price data from multiple online sources.")
    (license license:expat)))

(define-public python-pysmart
  (package
    (name "python-pysmart")
    (version "1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://files.pythonhosted.org/packages/5c/88/883d67a628b6342562eb18dd832f4ee266f07a175058c5dd3170fb7950b2/pysmart-1.4.2.tar.gz")
       (sha256
        (base32 "115wiafcp8l0dmxxzhr478qryqgjz056d8c6cf39b5fq5xp8v1wq"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools
           python-setuptools-scm))
    (propagated-inputs
     (list python-chardet
           python-humanfriendly))
    (inputs
     (list smartmontools))
    (home-page "https://github.com/truenas/py-SMART")
    (synopsis "Python wrapper for smartctl")
    (description
     "pySMART provides Python bindings around the @code{smartctl} tool from
smartmontools, exposing device information and SMART attributes through a
high-level API.")
    (license license:lgpl2.1+)))

(define-public python-aiohttp-jinja2
  (package
    (name "python-aiohttp-jinja2")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://files.pythonhosted.org/packages/e6/39/da5a94dd89b1af7241fb7fc99ae4e73505b5f898b540b6aba6dc7afe600e/aiohttp-jinja2-1.6.tar.gz")
       (sha256
        (base32 "1qmh37k5p4f0nq2qshqd4faj9dv10zyvniz5i8pabg75ci9gz9x3"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-aiohttp
           python-jinja2))
    (home-page "https://github.com/aio-libs/aiohttp_jinja2")
    (synopsis "Jinja2 renderer integration for aiohttp.web")
    (description
     "aiohttp-jinja2 integrates Jinja2 templates with aiohttp.web request
handlers, allowing asynchronous web applications to render templates directly
from aiohttp views.")
    (license license:asl2.0)))

(define-public fish-session
  (package
    (name "fish-session")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/AtefR/fish-session/archive/refs/tags/v"
                           version ".tar.gz"))
       (sha256
        (base32 "0hifyw76pjivc5zkbsmav8m1ww0452ybkxcy6chrm9568j45cphj"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     `(("tar" ,tar)
       ("gzip" ,gzip)
       ("fish-session-bin"
        ,(origin
           (method url-fetch)
           (uri (string-append "https://github.com/AtefR/fish-session/releases/download/v"
                               version "/fish-session"))
           (sha256
            (base32 "159mb78iz20z3wg6wq3sp86869pf64r8zynw123yzbgnnqrx8xzm"))))
       ("fish-sessiond-bin"
        ,(origin
           (method url-fetch)
           (uri (string-append "https://github.com/AtefR/fish-session/releases/download/v"
                               version "/fish-sessiond"))
           (sha256
            (base32 "1cksqzgxnn0f0hc6djchpz0y1pkiwzkvci7skgzsj1a5hrn6038d"))))))
    (inputs
     (list fish))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (srcdir (string-append "fish-session-" #$version))
                 (bin (string-append out "/bin"))
                 (confd (string-append out "/share/fish/vendor_conf.d"))
                 (funcd (string-append out "/share/fish/vendor_functions.d")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (mkdir-p bin)
            (copy-file (assoc-ref %build-inputs "fish-session-bin")
                       (string-append bin "/fish-session"))
            (copy-file (assoc-ref %build-inputs "fish-sessiond-bin")
                       (string-append bin "/fish-sessiond"))
            (for-each (lambda (f) (chmod (string-append bin "/" f) #o755))
                      '("fish-session" "fish-sessiond"))
            (mkdir-p confd)
            (mkdir-p funcd)
            (install-file (string-append srcdir "/conf.d/fish-session.fish") confd)
            (install-file (string-append srcdir "/functions/fish_session.fish") funcd)
            #t))))
    (home-page "https://github.com/AtefR/fish-session")
    (synopsis "Session manager and Fish integration")
    (description
     "fish-session provides prebuilt @code{fish-session} and
@code{fish-sessiond} binaries together with Fish shell integration files for
launching and managing persistent shell sessions.")
    ;; Upstream repository does not currently declare an explicit license file.
    (license #f)))

(define-public cliamp-bin
  (package
    (name "cliamp-bin")
    (version "1.31.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/bjarneo/cliamp/releases/download/v"
                           version "/cliamp-linux-amd64"))
       (sha256
        (base32 "1iy4xya7fli6cdr0cznb0bklcy8bqqgmw3x2iiyyjmzi6c6w2yj7"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/cliamp"))
            (chmod (string-append bin "/cliamp") #o755)
            #t))))
    (home-page "https://github.com/bjarneo/cliamp")
    (synopsis "Retro terminal music player binary")
    (description
     "cliamp-bin installs the upstream prebuilt CLI player binary from the
project's GitHub releases.")
    (license license:expat)))

(define-public cliamp
  (package
    (inherit cliamp-bin)
    (name "cliamp")
    (synopsis "Retro terminal music player inspired by Winamp 2.x")
    (description
     "Compatibility package for @code{cliamp} backed by the upstream
@code{cliamp-bin} release artifact.")))

(define-public podserv-b-bin
  (package
    (name "podserv-b-bin")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/l5yth/podserv-b/releases/download/v"
                           version "/podserv-b"))
       (sha256
        (base32 "1hdss5h1wfbbb51hsfvxky5s4yly50sgp5sfkf6is5wvz3dxvx99"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/podserv-b"))
            (chmod (string-append bin "/podserv-b") #o755)
            #t))))
    (home-page "https://github.com/l5yth/podserv-b")
    (synopsis "Minimalist podcast server binary")
    (description
     "podserv-b-bin installs the upstream prebuilt @code{podserv-b} binary for
serving podcast media files over HTTP.")
    (license license:asl2.0)))

(define-public podserv-b-git
  (package
    (inherit podserv-b-bin)
    (name "podserv-b-git")
    (version "0.1.2-0.536e372")
    (synopsis "Minimalist podcast server (git compatibility package)")
    (description
     "Compatibility package for the AUR-style @code{podserv-b-git} name,
currently backed by the latest upstream prebuilt @code{podserv-b} release
binary.")))
