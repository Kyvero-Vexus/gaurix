;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414w
;;; Resolves 100 packages from general queue:
;;;   - 100 compat aliases mapping AUR package names to upstream Guix packages
;;;   - Categories: 41 Emacs, 28 R/CRAN, 31 Python
;;;
;;; These are AUR-named packages that already exist in upstream GNU Guix
;;; under the same or similar names.  Each alias inherits the upstream
;;; package and overrides only the name field so that
;;; `guix build -L guix <aur-name>` resolves correctly.
;;;
;;; Modules are imported with #:prefix to avoid circular name shadowing
;;; when the AUR name matches the upstream Guix name exactly.

(define-module (gaurix packages recipe-resolver-260414w)
  #:use-module (guix packages)
  #:use-module ((gnu packages astronomy) #:prefix astronomy_)
  #:use-module ((gnu packages benchmark) #:prefix benchmark_)
  #:use-module ((gnu packages cran) #:prefix cran_)
  #:use-module ((gnu packages emacs-build) #:prefix emacs_build_)
  #:use-module ((gnu packages emacs-xyz) #:prefix emacs_xyz_)
  #:use-module ((gnu packages machine-learning) #:prefix machine_learning_)
  #:use-module ((gnu packages mail) #:prefix mail_)
  #:use-module ((gnu packages mp3) #:prefix mp3_)
  #:use-module ((gnu packages parallel) #:prefix parallel_)
  #:use-module ((gnu packages python-build) #:prefix python_build_)
  #:use-module ((gnu packages python-graphics) #:prefix python_graphics_)
  #:use-module ((gnu packages python-science) #:prefix python_science_)
  #:use-module ((gnu packages python-web) #:prefix python_web_)
  #:use-module ((gnu packages python-xyz) #:prefix python_xyz_)
  #:use-module ((gnu packages simulation) #:prefix simulation_)
  #:use-module ((gnu packages statistics) #:prefix statistics_)
  #:export (emacs-calfw-git
            emacs-deferred
            emacs-elpy
            emacs-f
            emacs-hydra
            emacs-magit-popup
            emacs-parseclj
            emacs-parseedn
            emacs-posframe
            emacs-python-environment
            emacs-pyvenv
            emacs-queue
            emacs-s
            emacs-sly-git
            emacs-transient
            emacs-use-package
            emacs-which-key
            emacs-with-editor-git
            emacs-magit
            emacs-yaml-mode
            emacs-evil
            emacs-undo-tree
            emacs-auto-complete
            emacs-langtool
            emacs-xclip
            emacs-a
            emacs-helm
            emacs-julia-mode
            emacs-sesman
            emacs-yasnippet
            emacs-paredit
            emacs-dash
            emacs-mmm-mode
            emacs-sml-mode
            emacs-markdown-mode
            emacs-mew
            emacs-ess
            emacs-js2-mode
            emacs-company-mode
            emacs-apache-mode
            emacs-d-mode
            r-rcpp
            r-ggplot2
            r-glue
            r-magrittr
            r-r6
            r-catools
            r-cli
            r-crayon
            r-digest
            r-ellipsis
            r-evaluate
            r-fansi
            r-rlang
            r-stringi
            r-testthat
            r-mime
            r-httr
            r-jsonlite
            r-tidyverse
            r-assertthat
            r-callr
            r-desc
            r-e1071
            r-pkgload
            r-praise
            r-processx
            r-ps
            r-rprojroot
            python-ipdb
            python-simpy
            python-tablib
            python-flake8-quotes
            python-croniter
            python-glfw
            python-py4j
            python-plotnine
            python-branca
            python-inotify
            python-pytoml
            python-scooby
            python-annexremote
            python-devtools
            python-retry
            python-asn1tools
            python-bitstruct
            python-tatsu
            python-rst2ansi
            python-pytaglib
            python-skyfield
            python-logzero
            python-lunr
            python-pathos
            python-ppft
            python-isbnlib
            python-locust
            python-geventhttpclient
            python-gguf
            python-ndeflib
            python-docstring-parser
))


;;; ──────────────────────────────────────────────────────────────────
;;; Emacs packages (compat aliases to upstream Guix emacs-* packages)
;;; ──────────────────────────────────────────────────────────────────

(define-public emacs-calfw-git
  (package
    (inherit emacs_xyz_emacs-calfw)
    (name "emacs-calfw-git")))

(define-public emacs-deferred
  (package
    (inherit emacs_xyz_emacs-deferred)
    (name "emacs-deferred")))

(define-public emacs-elpy
  (package
    (inherit emacs_xyz_emacs-elpy)
    (name "emacs-elpy")))

(define-public emacs-f
  (package
    (inherit emacs_build_emacs-f)
    (name "emacs-f")))

(define-public emacs-hydra
  (package
    (inherit emacs_xyz_emacs-hydra)
    (name "emacs-hydra")))

(define-public emacs-magit-popup
  (package
    (inherit emacs_xyz_emacs-magit-popup)
    (name "emacs-magit-popup")))

(define-public emacs-parseclj
  (package
    (inherit emacs_xyz_emacs-parseclj)
    (name "emacs-parseclj")))

(define-public emacs-parseedn
  (package
    (inherit emacs_xyz_emacs-parseedn)
    (name "emacs-parseedn")))

(define-public emacs-posframe
  (package
    (inherit emacs_xyz_emacs-posframe)
    (name "emacs-posframe")))

(define-public emacs-python-environment
  (package
    (inherit emacs_xyz_emacs-python-environment)
    (name "emacs-python-environment")))

(define-public emacs-pyvenv
  (package
    (inherit emacs_xyz_emacs-pyvenv)
    (name "emacs-pyvenv")))

(define-public emacs-queue
  (package
    (inherit emacs_xyz_emacs-queue)
    (name "emacs-queue")))

(define-public emacs-s
  (package
    (inherit emacs_build_emacs-s)
    (name "emacs-s")))

(define-public emacs-sly-git
  (package
    (inherit emacs_xyz_emacs-sly)
    (name "emacs-sly-git")))

(define-public emacs-transient
  (package
    (inherit emacs_xyz_emacs-transient)
    (name "emacs-transient")))

(define-public emacs-use-package
  (package
    (inherit emacs_xyz_emacs-use-package)
    (name "emacs-use-package")))

(define-public emacs-which-key
  (package
    (inherit emacs_xyz_emacs-which-key)
    (name "emacs-which-key")))

(define-public emacs-with-editor-git
  (package
    (inherit emacs_xyz_emacs-with-editor)
    (name "emacs-with-editor-git")))

(define-public emacs-magit
  (package
    (inherit emacs_xyz_emacs-magit)
    (name "emacs-magit")))

(define-public emacs-yaml-mode
  (package
    (inherit emacs_xyz_emacs-yaml-mode)
    (name "emacs-yaml-mode")))

(define-public emacs-evil
  (package
    (inherit emacs_xyz_emacs-evil)
    (name "emacs-evil")))

(define-public emacs-undo-tree
  (package
    (inherit emacs_xyz_emacs-undo-tree)
    (name "emacs-undo-tree")))

(define-public emacs-auto-complete
  (package
    (inherit emacs_xyz_emacs-auto-complete)
    (name "emacs-auto-complete")))

(define-public emacs-langtool
  (package
    (inherit emacs_xyz_emacs-langtool)
    (name "emacs-langtool")))

(define-public emacs-xclip
  (package
    (inherit emacs_xyz_emacs-xclip)
    (name "emacs-xclip")))

(define-public emacs-a
  (package
    (inherit emacs_xyz_emacs-a)
    (name "emacs-a")))

(define-public emacs-helm
  (package
    (inherit emacs_xyz_emacs-helm)
    (name "emacs-helm")))

(define-public emacs-julia-mode
  (package
    (inherit emacs_xyz_emacs-julia-mode)
    (name "emacs-julia-mode")))

(define-public emacs-sesman
  (package
    (inherit emacs_xyz_emacs-sesman)
    (name "emacs-sesman")))

(define-public emacs-yasnippet
  (package
    (inherit emacs_xyz_emacs-yasnippet)
    (name "emacs-yasnippet")))

(define-public emacs-paredit
  (package
    (inherit emacs_xyz_emacs-paredit)
    (name "emacs-paredit")))

(define-public emacs-dash
  (package
    (inherit emacs_build_emacs-dash)
    (name "emacs-dash")))

(define-public emacs-mmm-mode
  (package
    (inherit emacs_xyz_emacs-mmm-mode)
    (name "emacs-mmm-mode")))

(define-public emacs-sml-mode
  (package
    (inherit emacs_xyz_emacs-sml-mode)
    (name "emacs-sml-mode")))

(define-public emacs-markdown-mode
  (package
    (inherit emacs_xyz_emacs-markdown-mode)
    (name "emacs-markdown-mode")))

(define-public emacs-mew
  (package
    (inherit mail_emacs-mew)
    (name "emacs-mew")))

(define-public emacs-ess
  (package
    (inherit statistics_emacs-ess)
    (name "emacs-ess")))

(define-public emacs-js2-mode
  (package
    (inherit emacs_xyz_emacs-js2-mode)
    (name "emacs-js2-mode")))

(define-public emacs-company-mode
  (package
    (inherit emacs_xyz_emacs-company)
    (name "emacs-company-mode")))

(define-public emacs-apache-mode
  (package
    (inherit emacs_xyz_emacs-apache-mode)
    (name "emacs-apache-mode")))

(define-public emacs-d-mode
  (package
    (inherit emacs_xyz_emacs-d-mode)
    (name "emacs-d-mode")))


;;; ──────────────────────────────────────────────────────────────────
;;; R/CRAN packages (compat aliases to upstream Guix r-* packages)
;;; ──────────────────────────────────────────────────────────────────

(define-public r-rcpp
  (package
    (inherit cran_r-rcpp)
    (name "r-rcpp")))

(define-public r-ggplot2
  (package
    (inherit cran_r-ggplot2)
    (name "r-ggplot2")))

(define-public r-glue
  (package
    (inherit cran_r-glue)
    (name "r-glue")))

(define-public r-magrittr
  (package
    (inherit cran_r-magrittr)
    (name "r-magrittr")))

(define-public r-r6
  (package
    (inherit statistics_r-r6)
    (name "r-r6")))

(define-public r-catools
  (package
    (inherit cran_r-catools)
    (name "r-catools")))

(define-public r-cli
  (package
    (inherit cran_r-cli)
    (name "r-cli")))

(define-public r-crayon
  (package
    (inherit cran_r-crayon)
    (name "r-crayon")))

(define-public r-digest
  (package
    (inherit cran_r-digest)
    (name "r-digest")))

(define-public r-ellipsis
  (package
    (inherit cran_r-ellipsis)
    (name "r-ellipsis")))

(define-public r-evaluate
  (package
    (inherit cran_r-evaluate)
    (name "r-evaluate")))

(define-public r-fansi
  (package
    (inherit cran_r-fansi)
    (name "r-fansi")))

(define-public r-rlang
  (package
    (inherit statistics_r-rlang)
    (name "r-rlang")))

(define-public r-stringi
  (package
    (inherit cran_r-stringi)
    (name "r-stringi")))

(define-public r-testthat
  (package
    (inherit statistics_r-testthat)
    (name "r-testthat")))

(define-public r-mime
  (package
    (inherit cran_r-mime)
    (name "r-mime")))

(define-public r-httr
  (package
    (inherit cran_r-httr)
    (name "r-httr")))

(define-public r-jsonlite
  (package
    (inherit cran_r-jsonlite)
    (name "r-jsonlite")))

(define-public r-tidyverse
  (package
    (inherit cran_r-tidyverse)
    (name "r-tidyverse")))

(define-public r-assertthat
  (package
    (inherit cran_r-assertthat)
    (name "r-assertthat")))

(define-public r-callr
  (package
    (inherit cran_r-callr)
    (name "r-callr")))

(define-public r-desc
  (package
    (inherit cran_r-desc)
    (name "r-desc")))

(define-public r-e1071
  (package
    (inherit cran_r-e1071)
    (name "r-e1071")))

(define-public r-pkgload
  (package
    (inherit cran_r-pkgload)
    (name "r-pkgload")))

(define-public r-praise
  (package
    (inherit cran_r-praise)
    (name "r-praise")))

(define-public r-processx
  (package
    (inherit cran_r-processx)
    (name "r-processx")))

(define-public r-ps
  (package
    (inherit cran_r-ps)
    (name "r-ps")))

(define-public r-rprojroot
  (package
    (inherit statistics_r-rprojroot)
    (name "r-rprojroot")))


;;; ──────────────────────────────────────────────────────────────────
;;; Python packages (compat aliases to upstream Guix python-* packages)
;;; ──────────────────────────────────────────────────────────────────

(define-public python-ipdb
  (package
    (inherit python_xyz_python-ipdb)
    (name "python-ipdb")))

(define-public python-simpy
  (package
    (inherit simulation_python-simpy)
    (name "python-simpy")))

(define-public python-tablib
  (package
    (inherit python_xyz_python-tablib)
    (name "python-tablib")))

(define-public python-flake8-quotes
  (package
    (inherit python_xyz_python-flake8-quotes)
    (name "python-flake8-quotes")))

(define-public python-croniter
  (package
    (inherit python_xyz_python-croniter)
    (name "python-croniter")))

(define-public python-glfw
  (package
    (inherit python_graphics_python-glfw)
    (name "python-glfw")))

(define-public python-py4j
  (package
    (inherit python_xyz_python-py4j)
    (name "python-py4j")))

(define-public python-plotnine
  (package
    (inherit python_science_python-plotnine)
    (name "python-plotnine")))

(define-public python-branca
  (package
    (inherit python_web_python-branca)
    (name "python-branca")))

(define-public python-inotify
  (package
    (inherit python_xyz_python-inotify)
    (name "python-inotify")))

(define-public python-pytoml
  (package
    (inherit python_build_python-pytoml)
    (name "python-pytoml")))

(define-public python-scooby
  (package
    (inherit python_xyz_python-scooby)
    (name "python-scooby")))

(define-public python-annexremote
  (package
    (inherit python_xyz_python-annexremote)
    (name "python-annexremote")))

(define-public python-devtools
  (package
    (inherit python_xyz_python-devtools)
    (name "python-devtools")))

(define-public python-retry
  (package
    (inherit python_xyz_python-retry)
    (name "python-retry")))

(define-public python-asn1tools
  (package
    (inherit python_xyz_python-asn1tools)
    (name "python-asn1tools")))

(define-public python-bitstruct
  (package
    (inherit python_xyz_python-bitstruct)
    (name "python-bitstruct")))

(define-public python-tatsu
  (package
    (inherit python_xyz_python-tatsu)
    (name "python-tatsu")))

(define-public python-rst2ansi
  (package
    (inherit python_xyz_python-rst2ansi)
    (name "python-rst2ansi")))

(define-public python-pytaglib
  (package
    (inherit mp3_python-pytaglib)
    (name "python-pytaglib")))

(define-public python-skyfield
  (package
    (inherit astronomy_python-skyfield)
    (name "python-skyfield")))

(define-public python-logzero
  (package
    (inherit python_xyz_python-logzero)
    (name "python-logzero")))

(define-public python-lunr
  (package
    (inherit python_xyz_python-lunr)
    (name "python-lunr")))

(define-public python-pathos
  (package
    (inherit parallel_python-pathos)
    (name "python-pathos")))

(define-public python-ppft
  (package
    (inherit parallel_python-ppft)
    (name "python-ppft")))

(define-public python-isbnlib
  (package
    (inherit python_xyz_python-isbnlib)
    (name "python-isbnlib")))

(define-public python-locust
  (package
    (inherit benchmark_python-locust)
    (name "python-locust")))

(define-public python-geventhttpclient
  (package
    (inherit python_web_python-geventhttpclient)
    (name "python-geventhttpclient")))

(define-public python-gguf
  (package
    (inherit machine_learning_python-gguf)
    (name "python-gguf")))

(define-public python-ndeflib
  (package
    (inherit python_xyz_python-ndeflib)
    (name "python-ndeflib")))

(define-public python-docstring-parser
  (package
    (inherit python_xyz_python-docstring-parser)
    (name "python-docstring-parser")))

