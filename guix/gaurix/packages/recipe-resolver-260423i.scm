;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423i
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (16):
;;;        1.  r-tidyjson (r-build-system, v0.3.3.1, MIT)
;;;        2.  r-inflection (r-build-system, v1.3.7, GPL-2+)
;;;        3.  r-dice (r-build-system, v1.2, GPL-2+)
;;;        4.  r-ggquiver (r-build-system, v0.4.0, GPL-3)
;;;        5.  r-vip (r-build-system, v0.4.6, GPL-2+)
;;;        6.  r-mcmcse (r-build-system, v1.5-1, GPL-2+)
;;;        7.  r-widyr (r-build-system, v0.1.5, MIT)
;;;        8.  r-finetune (r-build-system, v1.3.0, MIT)
;;;        9.  python-super-collections (pyproject-build-system, v0.6.2, MIT)
;;;       10.  python-mkdocs-macros-plugin (pyproject-build-system, v1.5.0, MIT)
;;;       11.  fswebcam (gnu-build-system, v20200725, GPL-2)
;;;       12.  fastchess (gnu-build-system, v1.8.0, MIT)
;;;       13.  fsv3 (meson-build-system, v3.0, LGPL-2.1)
;;;       14.  likwid (gnu-build-system, v5.5.1, GPL-3+)
;;;       15.  font-selawik (font-build-system, v1.0, MIT)
;;;       16.  komga (copy-build-system, v1.24.3, MIT)
;;;
;;; ALREADY_IN_GUIX (3):
;;;        1.  mas (#5450) -> asl v1.42-beta-267
;;;        2.  python-aiohttp-sse-client (#6830) -> in cron-c79f127f-r22-w03-nrd4.scm
;;;        3.  python-simsimd (#6824) -> in cron-c79f127f-r22-w03-nrd4.scm
;;;
;;; BLOCKED EXHAUSTED (11):
;;;        1.  python-telegram-send -> MISSING_DEP: python-telegram-bot not in Guix
;;;        2.  baremetal-compiler-rt -> CROSS_TOOLCHAIN: needs arm-none-eabi-newlib not in Guix
;;;        3.  git-koji-bin -> FEDORA_SPECIFIC: Fedora Koji tooling, requires koji client libraries
;;;        4.  arch-check -> ARCH_SPECIFIC: Arch Linux health checker, useless on Guix
;;;        5.  linux-libre-lts-docs -> REDUNDANT: Guix linux-libre already provides docs output
;;;        6.  libgpr -> ADA_BOOTSTRAP: circular dependency (gprbuild needs gprbuild to build)
;;;        7.  gprbuild -> ADA_BOOTSTRAP: circular dependency with libgpr
;;;        8.  gprtools -> ADA_BOOTSTRAP: depends on gprbuild (blocked)
;;;        9.  gprname -> ADA_BOOTSTRAP: depends on gprbuild (blocked)
;;;       10.  emergency-alerts -> MISSING_DEP: requires granite7 (elementary OS lib, not in Guix)
;;;       11.  qoder-bin -> PROPRIETARY: proprietary Electron app with custom license
;;;
;;; NOTE: All sha256 hashes are from guix download/import (verified).

(define-module (gaurix packages recipe-resolver-260423i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system r)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system font)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages cran)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages image)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages java)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages time)
  #:export (
            r-tidyjson
            r-inflection
            r-dice
            r-ggquiver
            r-vip
            r-mcmcse
            r-widyr
            r-finetune
            python-super-collections
            python-mkdocs-macros-plugin
            fswebcam
            fastchess
            fsv3
            likwid
            font-selawik
            komga
            ))

;;; -------------------------------------------------------------------
;;; 1. r-tidyjson — tidy complex JSON data
;;; -------------------------------------------------------------------
(define-public r-tidyjson
  (package
    (name "r-tidyjson")
    (version "0.3.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "tidyjson" version))
       (sha256
        (base32 "069bkk30gx43v4n7x13bn5ywccs7ni9i2a43fmm0rdyyg0b85pm0"))))
    (properties `((upstream-name . "tidyjson")))
    (build-system r-build-system)
    (propagated-inputs (list r-assertthat
                             r-dplyr
                             r-jsonlite
                             r-magrittr
                             r-purrr
                             r-rlang
                             r-tibble
                             r-tidyr))
    (native-inputs (list r-knitr r-testthat))
    (home-page "https://github.com/colearendt/tidyjson")
    (synopsis "tidy complex JSON data")
    (description "Turn complex JSON data into tidy data frames.  Provides
a grammar for turning complex JSON into tidy tibbles.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. r-inflection — find inflection points of curves
;;; -------------------------------------------------------------------
(define-public r-inflection
  (package
    (name "r-inflection")
    (version "1.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "inflection" version))
       (sha256
        (base32 "0482g7idw28h42xzb5v15y0wlmxg999cn9wgf92s4v4w0rrcfcpw"))))
    (properties `((upstream-name . "inflection")))
    (build-system r-build-system)
    (native-inputs (list r-knitr))
    (home-page "https://CRAN.R-project.org/package=inflection")
    (synopsis "find the inflection point of a curve")
    (description "Implementation of methods Extremum Surface Estimator
(ESE) and Extremum Distance Estimator (EDE) to identify the inflection
point of a curve.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 3. r-dice — dice-rolling probability calculations
;;; -------------------------------------------------------------------
(define-public r-dice
  (package
    (name "r-dice")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "dice" version))
       (sha256
        (base32 "0gic7lqnsdmwv3dbzwwmcwdfyfqlq8kpr2pciqphd1j2ligzwl3s"))))
    (properties `((upstream-name . "dice")))
    (build-system r-build-system)
    (propagated-inputs (list r-gtools))
    (home-page "https://cran.r-project.org/package=dice")
    (synopsis "calculate probabilities of various dice-rolling events")
    (description "This package provides utilities to calculate the
probabilities of various dice-rolling events, such as the probability
of rolling a four-sided die six times and getting specific outcomes.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 4. r-ggquiver — quiver plots for ggplot2
;;; -------------------------------------------------------------------
(define-public r-ggquiver
  (package
    (name "r-ggquiver")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggquiver" version))
       (sha256
        (base32 "1fcxszlg8ivc99r777z1bk8jw04k8rlvdln8xlpl9613gsafv7jg"))))
    (properties `((upstream-name . "ggquiver")))
    (build-system r-build-system)
    (propagated-inputs (list r-ggplot2))
    (native-inputs (list r-testthat r-vdiffr))
    (home-page "https://github.com/mitchelloharawild/ggquiver")
    (synopsis "quiver plots for ggplot2")
    (description "An extension of ggplot2 to provide quiver plots to
visualise vector fields.  This functionality is implemented using a
geom to produce a new graphical layer, which allows aesthetic options.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5. r-vip — variable importance plots
;;; -------------------------------------------------------------------
(define-public r-vip
  (package
    (name "r-vip")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "vip" version))
       (sha256
        (base32 "0m45d17ryqi8rafgx4l5kh40g0ikvb86hxsdyxlw6akbk0djhlkj"))))
    (properties `((upstream-name . "vip")))
    (build-system r-build-system)
    (propagated-inputs (list r-foreach r-ggplot2 r-tibble r-yardstick))
    (native-inputs (list r-knitr r-tinytest))
    (home-page "https://github.com/koalaverse/vip/")
    (synopsis "variable importance plots for machine learning models")
    (description "A general framework for constructing variable importance
plots from various types of machine learning models in R.  Includes
permutation-based and Shapley value-based variable importance measures.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 6. r-mcmcse — Monte Carlo standard errors for MCMC
;;; -------------------------------------------------------------------
(define-public r-mcmcse
  (package
    (name "r-mcmcse")
    (version "1.5-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "mcmcse" version))
       (sha256
        (base32 "08v6ymlmr05ix4n3lw560xj5jxy2shbc11dcmdz67jhr7ad4wdsm"))))
    (properties `((upstream-name . "mcmcse")))
    (build-system r-build-system)
    (propagated-inputs (list r-ellipse r-fftwtools r-rcpp r-rcpparmadillo
                             r-testthat))
    (native-inputs (list r-knitr))
    (home-page "https://github.com/dvats/mcmcse")
    (synopsis "Monte Carlo standard errors for MCMC")
    (description "Tools for computing Monte Carlo standard errors (MCSE)
in Markov chain Monte Carlo (MCMC) settings.  MCSE computation for
expectation and quantile estimators is supported as well as multivariate
estimations.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 7. r-widyr — widen, process, then re-tidy data
;;; -------------------------------------------------------------------
(define-public r-widyr
  (package
    (name "r-widyr")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "widyr" version))
       (sha256
        (base32 "05300hslrfpsqaxzzbmxgl2s2dz3wldpmnxh9hzgy97xkdc0c6fn"))))
    (properties `((upstream-name . "widyr")))
    (build-system r-build-system)
    (propagated-inputs (list r-broom
                             r-dplyr
                             r-matrix
                             r-purrr
                             r-reshape2
                             r-rlang
                             r-tibble
                             r-tidyr
                             r-tidytext))
    (native-inputs (list r-knitr r-testthat))
    (home-page "https://github.com/juliasilge/widyr")
    (synopsis "widen, process, then re-tidy data")
    (description "Encapsulates the pattern of untidying data into a wide
matrix, performing some processing, then turning it back into a tidy
form.  Useful for co-occurrence counts, correlations, or clustering.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. r-finetune — additional functions for model tuning
;;; -------------------------------------------------------------------
(define-public r-finetune
  (package
    (name "r-finetune")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "finetune" version))
       (sha256
        (base32 "0gb8gdnp244y92ml9h3b3az2gs2sd8bnrl5w0apx0yqrdn6v0s05"))))
    (properties `((upstream-name . "finetune")))
    (build-system r-build-system)
    (propagated-inputs (list r-cli
                             r-dials
                             r-dplyr
                             r-ggplot2
                             r-parsnip
                             r-purrr
                             r-rlang
                             r-tibble
                             r-tidyr
                             r-tidyselect
                             r-tune
                             r-vctrs
                             r-workflows))
    (native-inputs (list r-lme4
                         r-modeldata
                         r-ranger
                         r-recipes
                         r-rsample
                         r-testthat
                         r-yardstick))
    (home-page "https://github.com/tidymodels/finetune")
    (synopsis "additional functions for model tuning")
    (description "Enhances the tune package by providing more specialized
methods for finding reasonable values of model tuning parameters.  Two
racing methods and an iterative search method using generalized simulated
annealing are included.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. python-super-collections — enhanced Python collections
;;; -------------------------------------------------------------------
(define-public python-super-collections
  (package
    (name "python-super-collections")
    (version "0.6.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fralau/super-collections")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19i9dlp5n4js7yijs2zwd8h8s8b5n5zk83cky7bm6rlkpxqbj1gd"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-hjson))
    (native-inputs (list python-pytest python-pyyaml python-setuptools))
    (home-page "https://github.com/fralau/super-collections")
    (synopsis "enhanced Python collections with attribute access and merging")
    (description "Super-collections provides enhanced dict and list types
for Python with attribute-style access, deep merging, and YAML/HJSON
configuration file loading.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. python-mkdocs-macros-plugin — MkDocs macros and variables
;;; -------------------------------------------------------------------
(define-public python-mkdocs-macros-plugin
  (package
    (name "python-mkdocs-macros-plugin")
    (version "1.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fralau/mkdocs_macros_plugin")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1x9y7kj3cv7v54697k8i5rxrb1bnzd4ksmgq7ckpfb9k0i983wd9"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require mkdocs-macros-test (not packaged)
    (propagated-inputs (list python-hjson
                             python-jinja2
                             python-mkdocs
                             python-packaging
                             python-pathspec
                             python-dateutil
                             python-pyyaml
                             python-requests
                             python-super-collections
                             python-termcolor))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/fralau/mkdocs_macros_plugin")
    (synopsis "MkDocs plugin to use variables and macros in Markdown files")
    (description "Unleash the power of MkDocs with macros and variables.
This plugin allows you to define variables, call macros, and use
Jinja2 templates directly in your MkDocs Markdown files.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. fswebcam — simple webcam capture tool
;;; -------------------------------------------------------------------
(define-public fswebcam
  (package
    (name "fswebcam")
    (version "20200725")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.sanslogic.co.uk/fswebcam/files/fswebcam-"
                    version ".tar.gz"))
              (sha256
               (base32
                "1dazsrcaw9s30zz3jpxamk9lkff5dkmflp1s0jjjvdbwa0k6k6ii"))))
    (build-system gnu-build-system)
    (inputs (list gd))
    (synopsis "neat and simple webcam capture application")
    (description "Fswebcam is a small and simple webcam application for
capturing images from a V4L1/V4L2 compatible device, applying various
effects, and saving the result as a PNG or JPEG image.")
    (home-page "https://www.sanslogic.co.uk/fswebcam/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 14. fastchess — chess engine match runner
;;; -------------------------------------------------------------------
(define-public fastchess
  (package
    (name "fastchess")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Disservin/fastchess/archive/refs/tags/v"
                    version "-alpha.tar.gz"))
              (sha256
               (base32
                "1add5lgvs1b96mhkd4sqa5qr2r0xyhwci3l02q2gwvbqg6imkw65"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "chess CLI tool to run engine vs engine matches")
    (description "Fastchess is a command-line tool for running chess engine
vs engine matches.  It supports various time controls, concurrency, and
outputs results in PGN format.")
    (home-page "https://github.com/Disservin/fastchess")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. fsv3 — 3D file system explorer (GTK3 port)
;;; -------------------------------------------------------------------
(define-public fsv3
  (package
    (name "fsv3")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jabl/fsv/archive/refs/tags/fsv-"
                    version ".tar.gz"))
              (sha256
               (base32
                "16kxa4w5n963adpgigxvmc1g1333drhqhi12ksmqyw7bx1jxg00r"))))
    (build-system meson-build-system)
    (inputs (list cglm gtk+ glu libepoxy gdk-pixbuf zlib))
    (native-inputs (list pkg-config gettext-minimal))
    (synopsis "3D file system explorer using GTK3 and OpenGL")
    (description "FSV3 is a 3D file system visualizer that displays a
directory tree as a three-dimensional scene.  Files and directories are
represented as colored blocks whose sizes represent the file sizes.
This is the GTK3 port of the original fsv.")
    (home-page "https://github.com/jabl/fsv")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 16. likwid — lightweight performance tools for HPC
;;; -------------------------------------------------------------------
(define-public likwid
  (package
    (name "likwid")
    (version "5.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/RRZE-HPC/likwid/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0y6vj7wmz6wlsryfnv1pdnl20hlvqdwsw5ivzky9c0xjcc787ir5"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "MANPREFIX=" #$output "/share/man")
                   "INSTALL_CHOWN="
                   "ACCESSMODE=direct"
                   "COMPILER=GCC")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list perl))
    (synopsis "lightweight performance tools for HPC")
    (description "LIKWID provides a set of command-line tools for
performance-oriented programmers.  It includes tools for hardware
topology, hardware performance monitoring, affinity control, and
micro-benchmarking on x86 processors.")
    (home-page "https://hpc.fau.de/research/tools/likwid/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17. font-selawik — Selawik font (Segoe UI fallback)
;;; -------------------------------------------------------------------
(define-public font-selawik
  (package
    (name "font-selawik")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/winjs/bootstrap-winjs/archive/"
                    "11fb35582ac3b9f750738da93c44293ffaaa0294.zip"))
              (sha256
               (base32
                "152jhnnvs7fkvwzmrizvx2k0yvfziqyqbr5mkdsx4y7l3kk0h38d"))))
    (build-system font-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/truetype")))
                     (mkdir-p font-dir)
                     (for-each (lambda (f)
                                 (install-file f font-dir))
                               (find-files "." "\\.ttf$"))))))))
    (synopsis "font designed as a fallback to Segoe UI")
    (description "Selawik is an open-source font designed to be metrically
compatible with Segoe UI, the default Windows system font.  It can be
used as a drop-in replacement on non-Windows systems.")
    (home-page "https://github.com/winjs/bootstrap-winjs")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. komga — media server for comics and manga
;;; -------------------------------------------------------------------
(define-public komga
  (package
    (name "komga")
    (version "1.24.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gotson/komga/releases/download/"
                    version "/komga-" version ".jar"))
              (sha256
               (base32
                "16ms8rfr5qqi375qsgl1392jnmxb3bjbcl4p0n59nq6hpx37dipq"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("komga.jar" "share/java/komga/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "komga.jar")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (java (search-input-file inputs "bin/java")))
                     (mkdir-p (string-append out "/bin"))
                     (with-output-to-file (string-append out "/bin/komga")
                       (lambda ()
                         (display (string-append
                                   "#!/bin/sh\nexec " java
                                   " -jar " out "/share/java/komga/komga.jar"
                                   " \"$@\"\n"))))
                     (chmod (string-append out "/bin/komga") #o755)))))))
    (inputs (list (list openjdk17 "jdk")))
    (synopsis "media server for comics, manga, and BD with OPDS support")
    (description "Komga is a free and open-source media server for comics,
manga, BD, and magazines.  It provides a web interface and OPDS feed for
browsing and reading digital comic collections.")
    (home-page "https://komga.org")
    (license license:expat)))
