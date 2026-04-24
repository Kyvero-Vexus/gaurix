;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260424o
;;; Resolves 100 packages via dependency-tree priority.
;;;
;;; New recipes (16):
;;;      1.  python-typepy (pyproject-build-system, v1.3.4, MIT)
;;;      2.  python-subprocrunner (pyproject-build-system, v2.0.1, MIT)
;;;      3.  python-svgpathtools (pyproject-build-system, v1.7.2, MIT)
;;;      4.  python-macholib (pyproject-build-system, v1.16.4, MIT)
;;;      5.  python-xvfbwrapper (pyproject-build-system, v0.2.23, MIT)
;;;      6.  python-daphne (pyproject-build-system, v4.2.1, BSD-3)
;;;      7.  python-nptyping (pyproject-build-system, v2.5.0, MIT)
;;;      8.  python-webargs (pyproject-build-system, v8.7.1, MIT)
;;;      9.  python-ipyvue (pyproject-build-system, v1.12.0, MIT)
;;;     10.  python-fal-client (pyproject-build-system, v0.14.0, Apache-2.0)
;;;     11.  python-livekit-protocol (pyproject-build-system, v1.1.6, Apache-2.0)
;;;     12.  python-stlib (pyproject-build-system, v2.3.1, GPL-3.0+)
;;;     13.  doi2bib (pyproject-build-system, v0.4.0, MIT)
;;;     14.  liblinear (gnu-build-system, v250, BSD-3)
;;;     15.  lua-tl (copy-build-system, v0.24.4, MIT)
;;;     16.  betterlockscreen (copy-build-system, v4.4.0, MIT)
;;;
;;; ALREADY_IN_GUIX (18):
;;;      1.  gnome-icon-theme → adwaita-icon-theme in (gnu packages gnome)
;;;      2.  cloog → cloog in (gnu packages algebra)
;;;      3.  perl-b-utils → perl-b-utils in (gnu packages perl)
;;;      4.  ocaml-pcre → ocaml-pcre in (gnu packages ocaml)
;;;      5.  ocaml-zed → ocaml-zed in (gnu packages ocaml)
;;;      6.  qgpgme-qt5 → qgpgme in (gnu packages gnupg)
;;;      7.  r-pkgbuild → r-pkgbuild in (gnu packages cran)
;;;      8.  corosync → corosync in (gnu packages high-availability)
;;;      9.  python-cloup → python-cloup in (gnu packages python-xyz)
;;;     10.  python-pyglm → python-pyglm in (gnu packages python-xyz)
;;;     11.  adcli → adcli in (gnu packages admin)
;;;     12.  gsettings-desktop-schemas-git → gsettings-desktop-schemas in (gnu packages gnome)
;;;     13.  libmbim-dev → libmbim in (gnu packages networking)
;;;     14.  podofo-0.9 → podofo in (gnu packages pdf)
;;;     15.  psautohint → psautohint in (gnu packages fonts)
;;;     16.  kholidays-git → kholidays in (gnu packages kde-pim)
;;;     17.  kmime-git → kmime in (gnu packages kde-pim)
;;;     18.  geda-gaf → geda-gaf in (gnu packages engineering)
;;;
;;; Remaining BLOCKED: 66 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260424o)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages check)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages image)
  #:use-module (gnu packages web)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:export (python-typepy
            python-subprocrunner
            python-svgpathtools
            python-macholib
            python-xvfbwrapper
            python-daphne
            python-nptyping
            python-webargs
            python-ipyvue
            python-fal-client
            python-livekit-protocol
            python-stlib
            doi2bib
            liblinear
            lua-tl
            betterlockscreen))

;;; -- python-typepy --
;;; Variable type checker/validator/converter at run time.
;;; Source: GitHub (thombashi/typepy)
;;; License: MIT

(define-public python-typepy
  (package
    (name "python-typepy")
    (version "1.3.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/thombashi/typepy")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15rjh1s7di3jf2mc7pcd8a51y0mcqfb1z415598p1nkg9fh1f34n"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-mbstrdecoder))
    (native-inputs (list python-setuptools python-setuptools-scm))
    (arguments
     (list #:tests? #f))  ;; tests require python-tcolorpy not in Guix
    (home-page "https://github.com/thombashi/typepy")
    (synopsis "variable type checker/validator/converter at run time")
    (description "typepy is a Python library for variable type
checker/validator/converter at run time.  It can determine variable types,
validate values, and convert between compatible types.")
    (license license:expat)))

;;; -- python-subprocrunner --
;;; Python wrapper library for subprocess module.
;;; Source: GitHub (thombashi/subprocrunner)
;;; License: MIT

(define-public python-subprocrunner
  (package
    (name "python-subprocrunner")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/thombashi/subprocrunner")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00656zfsvqxd1agi3r2wbralrj5mk4lrbscmfka2ybvm5akh99xn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-mbstrdecoder))
    (native-inputs (list python-setuptools))
    (arguments
     (list #:tests? #f))  ;; tests require python-typepy and loguru
    (home-page "https://github.com/thombashi/subprocrunner")
    (synopsis "python wrapper library for subprocess module")
    (description "This package provides a Python wrapper library for the
subprocess module with convenient output handling and error management.")
    (license license:expat)))

;;; -- python-svgpathtools --
;;; Tools for manipulating and analyzing SVG Path objects and Bezier curves.
;;; Source: GitHub (mathandy/svgpathtools)
;;; License: MIT

(define-public python-svgpathtools
  (package
    (name "python-svgpathtools")
    (version "1.7.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mathandy/svgpathtools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0acxmbrcfqyksjfs8j6133snrib1bd01bcvsc11yq4n86f1afrrq"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-scipy python-svgwrite))
    (native-inputs (list python-setuptools))
    (arguments
     (list #:tests? #f))  ;; tests require test fixtures not in tarball
    (home-page "https://github.com/mathandy/svgpathtools")
    (synopsis "tools for manipulating and analyzing SVG Path objects")
    (description "This package provides tools for manipulating and analyzing
SVG Path objects and Bezier curves, including tools for converting between
path types and computing intersections.")
    (license license:expat)))

;;; -- python-macholib --
;;; Mach-O header analysis and editing.
;;; Source: GitHub (ronaldoussoren/macholib)
;;; License: MIT

(define-public python-macholib
  (package
    (name "python-macholib")
    (version "1.16.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ronaldoussoren/macholib")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fl1g471l4paf5af18r06w0w9l5cfarr9nwg1pnnnaph1hzlbdzv"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-altgraph))
    (native-inputs (list python-setuptools))
    (arguments
     (list #:tests? #f))  ;; tests require macOS Mach-O binaries
    (home-page "https://github.com/ronaldoussoren/macholib")
    (synopsis "Mach-O header analysis and editing")
    (description "macholib can be used to analyze and edit Mach-O headers,
the executable format used on macOS.  It is typically used as part of
the py2app toolchain.")
    (license license:expat)))

;;; -- python-xvfbwrapper --
;;; Manage headless displays with Xvfb.
;;; Source: PyPI
;;; License: MIT

(define-public python-xvfbwrapper
  (package
    (name "python-xvfbwrapper")
    (version "0.2.23")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "xvfbwrapper" version))
       (sha256
        (base32 "09mqmffcnyvl08xm67yhxgi6gpz8glz5qx23g1jznq2bww08qcgz"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools))
    (inputs (list xorg-server))
    (arguments
     (list #:tests? #f))  ;; tests require running X server
    (home-page "https://github.com/cgoldberg/xvfbwrapper")
    (synopsis "manage headless displays with Xvfb")
    (description "xvfbwrapper is a Python module for managing headless displays
with Xvfb (X virtual framebuffer).  It can be used as a context manager or
with explicit start/stop for running GUI tests without a display.")
    (license license:expat)))

;;; -- python-daphne --
;;; Django ASGI HTTP/WebSocket server.
;;; Source: PyPI
;;; License: BSD-3

(define-public python-daphne
  (package
    (name "python-daphne")
    (version "4.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "daphne" version))
       (sha256
        (base32 "1crircpk2g26y02q8xmxlyb5wh86hqr7q7aly7fpmnhz19q8x2az"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-asgiref python-autobahn python-twisted))
    (native-inputs (list python-setuptools))
    (arguments
     (list #:tests? #f))  ;; tests require Django and hypothesis
    (home-page "https://github.com/django/daphne")
    (synopsis "Django ASGI server for HTTP and WebSocket protocols")
    (description "Daphne is an HTTP, HTTP2 and WebSocket protocol server
for ASGI and ASGI-HTTP, developed as part of the Django Channels project.
It serves as the reference ASGI server implementation.")
    (license license:bsd-3)))

;;; -- python-nptyping --
;;; Type hints for NumPy.
;;; Source: GitHub (ramonhagenaars/nptyping)
;;; License: MIT

(define-public python-nptyping
  (package
    (name "python-nptyping")
    (version "2.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ramonhagenaars/nptyping")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0m6iq98qi9pl5hcc5k99bvy5w293vrlsdnimxl020i60rfnihgl7"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy))
    (native-inputs (list python-setuptools))
    (arguments
     (list #:tests? #f))  ;; tests require beartype, typeguard, pandas
    (home-page "https://github.com/ramonhagenaars/nptyping")
    (synopsis "type hints for NumPy")
    (description "nptyping provides type hints for NumPy arrays.  It allows
expressing the shape and dtype of arrays in a human-readable way, enabling
static type checking with tools like mypy and pyright.")
    (license license:expat)))

;;; -- python-webargs --
;;; Library for parsing HTTP request arguments.
;;; Source: GitHub (marshmallow-code/webargs)
;;; License: MIT

(define-public python-webargs
  (package
    (name "python-webargs")
    (version "8.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/marshmallow-code/webargs")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16b8bx9xcb3fwvqzgi35qc6ay6axzzij8gjy64jzqx97w4418hny"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-marshmallow python-packaging))
    (native-inputs (list python-setuptools))
    (arguments
     (list #:tests? #f))  ;; tests require flask, django, falcon, etc.
    (home-page "https://github.com/marshmallow-code/webargs")
    (synopsis "library for parsing HTTP request arguments")
    (description "webargs is a Python library for parsing and validating
HTTP request arguments with support for popular web frameworks including
Flask, Django, Bottle, Tornado, Pyramid, Falcon, and aiohttp.")
    (license license:expat)))

;;; -- python-ipyvue --
;;; Jupyter widgets base for Vue libraries.
;;; Source: GitHub (widgetti/ipyvue)
;;; License: MIT

(define-public python-ipyvue
  (package
    (name "python-ipyvue")
    (version "1.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/widgetti/ipyvue")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05xd374v7hki42i1n94y3qbamwp0mg9ijb4804y0azfrq57jl2rg"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-ipywidgets))
    (native-inputs (list python-setuptools))
    (arguments
     (list #:tests? #f))  ;; tests require solara (not in Guix)
    (home-page "https://github.com/widgetti/ipyvue")
    (synopsis "Jupyter widgets base for Vue libraries")
    (description "ipyvue provides a base for creating Jupyter widgets using
Vue.js components.  It enables embedding Vue.js applications and components
as interactive Jupyter widgets.")
    (license license:expat)))

;;; -- python-fal-client --
;;; Python client for fal.ai.
;;; Source: PyPI
;;; License: Apache-2.0

(define-public python-fal-client
  (package
    (name "python-fal-client")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "fal_client" version))
       (sha256
        (base32 "0qcsviha6vx543bnhpghyhghda4bi47y6i155zhp1jf6h4pqshb4"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-httpx python-msgpack))
    (native-inputs (list python-setuptools python-setuptools-scm))
    (arguments
     (list #:tests? #f))  ;; tests require API key and network access
    (home-page "https://github.com/fal-ai/fal-python")
    (synopsis "Python client for fal.ai serverless platform")
    (description "fal-client is the official Python client for fal.ai,
a serverless platform for running AI models.  It provides synchronous
and asynchronous interfaces for submitting and retrieving model results.")
    (license license:asl2.0)))

;;; -- python-livekit-protocol --
;;; Python protocol stubs for LiveKit.
;;; Source: PyPI
;;; License: Apache-2.0

(define-public python-livekit-protocol
  (package
    (name "python-livekit-protocol")
    (version "1.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "livekit_protocol" version))
       (sha256
        (base32 "16qgwx8ssb7l425p6r6sp21arxd8vn3v5f7qyxjf0v0a8iiqhr23"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-protobuf))
    (native-inputs (list python-hatchling))
    (arguments
     (list #:tests? #f))  ;; no test suite included
    (home-page "https://github.com/livekit/python-sdks/")
    (synopsis "Python protocol stubs for LiveKit")
    (description "Python protocol stubs for LiveKit, a real-time
communication platform.  This package provides generated protobuf
definitions for the LiveKit signaling protocol.")
    (license license:asl2.0)))

;;; -- python-stlib --
;;; Async library for Steam client interaction.
;;; Source: PyPI
;;; License: GPL-3.0+

(define-public python-stlib
  (package
    (name "python-stlib")
    (version "2.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "stlib" version))
       (sha256
        (base32 "13qpkjc5p2ypknq193xjzsj0n9fzfigzi6788kld29kjsxv0qrwc"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aiohttp python-beautifulsoup4 python-rsa))
    (native-inputs (list python-setuptools))
    (arguments
     (list #:tests? #f))  ;; no test suite included
    (home-page "https://github.com/nicholasgasior/stlib")
    (synopsis "async library for Steam client features")
    (description "stlib is an async Python library providing features
related to the Steam client, including Steam Guard, confirmations,
and other Steam network interactions.")
    (license license:gpl3+)))

;;; -- doi2bib --
;;; Generate BibTeX entries from DOIs.
;;; Source: GitHub (bibcure/doi2bib)
;;; License: MIT

(define-public doi2bib
  (package
    (name "doi2bib")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bibcure/doi2bib/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "071279maxcy2nr97z0hxg7cwr5l4d7ra9ik99kyv0jm3i3mmh917"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-bibtexparser python-requests))
    (native-inputs (list python-setuptools))
    (arguments
     (list #:tests? #f))  ;; tests require network access
    (home-page "https://github.com/bibcure/doi2bib")
    (synopsis "generate BibTeX entries from DOIs")
    (description "doi2bib is a tool for generating BibTeX bibliography
entries from Digital Object Identifiers (DOIs).  It fetches metadata
from the DOI resolver and formats it as BibTeX.")
    (license license:expat)))

;;; -- liblinear --
;;; A Library for Large Linear Classification.
;;; Source: GitHub (cjlin1/liblinear)
;;; License: BSD-3

(define-public liblinear
  (package
    (name "liblinear")
    (version "250")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cjlin1/liblinear/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1r05sr6ji47dvbf39sa99x9d42wsydk1q24iiasaalxfsnsblxf8"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test target
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   "lib")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)  ;; no configure script
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (lib (string-append out "/lib"))
                          (inc (string-append out "/include"))
                          (bin (string-append out "/bin")))
                     (install-file "train" bin)
                     (install-file "predict" bin)
                     (install-file "liblinear.so.5" lib)
                     (symlink "liblinear.so.5"
                              (string-append lib "/liblinear.so"))
                     (install-file "linear.h" inc)
                     (install-file "tron.h" inc)))))))
    (home-page "https://www.csie.ntu.edu.tw/~cjlin/liblinear/")
    (synopsis "library for large-scale linear classification")
    (description "LIBLINEAR is a library for large-scale linear
classification supporting logistic regression, L2-regularized L2-loss,
and L2-regularized L1-loss support vector classification, as well as
L2-regularized support vector regression.")
    (license license:bsd-3)))

;;; -- lua-tl --
;;; The compiler for Teal, a typed dialect of Lua.
;;; Source: GitHub (teal-language/tl)
;;; License: MIT

(define-public lua-tl
  (package
    (name "lua-tl")
    (version "0.24.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/teal-language/tl/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1qa29vj7zz0vdkb1511kgypq1japc5pb96n7kivpfanbhnmafj5l"))))
    (build-system copy-build-system)
    (inputs (list lua))
    (arguments
     (list #:install-plan
           #~'(("tl" "bin/tl")
               ("tl.lua" "share/lua/5.4/tl.lua")
               ("tl.tl" "share/lua/5.4/tl.tl"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-program
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((lua (search-input-file inputs "bin/lua")))
                     (wrap-program (string-append (assoc-ref outputs "out")
                                                  "/bin/tl")
                       `("LUA_PATH" prefix
                         (,(string-append (assoc-ref outputs "out")
                                          "/share/lua/5.4/?.lua"))))))))))
    (home-page "https://github.com/teal-language/tl")
    (synopsis "compiler for Teal, a typed dialect of Lua")
    (description "Teal is a typed dialect of Lua.  The tl compiler
transpiles Teal source code into plain Lua, adding optional type
annotations and static type checking while remaining fully compatible
with existing Lua code and libraries.")
    (license license:expat)))

;;; -- betterlockscreen --
;;; A minimal lockscreen using i3lock-color.
;;; Source: GitHub (betterlockscreen/betterlockscreen)
;;; License: MIT

(define-public betterlockscreen
  (package
    (name "betterlockscreen")
    (version "4.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/betterlockscreen/betterlockscreen/"
                    "archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "1zaxpl7g34a1mymw6c7jz73hh7vfmlfvv0wvrsc6xd8abxr5ikzx"))))
    (build-system copy-build-system)
    (inputs (list bash-minimal imagemagick xdpyinfo xrandr))
    (arguments
     (list #:install-plan
           #~'(("betterlockscreen" "bin/betterlockscreen")
               ("system/betterlockscreen@.service"
                "lib/systemd/system/betterlockscreen@.service"))))
    (home-page "https://github.com/betterlockscreen/betterlockscreen")
    (synopsis "minimal lockscreen with image caching and effects")
    (description "betterlockscreen is a minimal, fast lockscreen wrapper
built around i3lock-color.  It supports image caching, blur, dimming,
and pixel effects, with both single and dual monitor configurations.")
    (license license:expat)))
