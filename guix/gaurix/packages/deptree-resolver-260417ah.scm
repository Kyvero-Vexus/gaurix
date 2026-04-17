;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260417ah
;;; Resolves BLOCKED packages from dependency-tree priority queue.
;;;
;;; Recipes (12):
;;;   1. python-ipycache (pypi-sdist, v0.1.4)
;;;   2. python-anitopy (pypi-sdist, v2.1.1)
;;;   3. python-cheap-repr (pypi-sdist, v0.5.2) [dep for birdseye]
;;;   4. python-flask-humanize (pypi-sdist, v0.3.0) [dep for birdseye]
;;;   5. python-outdated (pypi-sdist, v0.2.2) [dep for birdseye]
;;;   6. python-birdseye (pypi-sdist, v0.10.0)
;;;   7. python-kagglesdk (pypi-sdist, v0.1.18) [dep for kaggle]
;;;   8. kaggle (pypi-sdist, v2.0.1)
;;;   9. verapdf (pre-built-jar, v1.28.2)
;;;  10. zzzfm-common-bin (binary-deb, v1.0.7) [dep for zzzfm-bin]
;;;  11. zzzfm-bin (binary-deb, v1.0.7)
;;;  12. python-pyephem-git → ALREADY_IN_GUIX (python-ephem 4.2)
;;;
;;; 11 new recipes written.  42 remain BLOCKED.
;;; Hashes obtained via `guix download`.

(define-module (gaurix packages deptree-resolver-260417ah)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages java)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages check)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages time)
  #:export (python-ipycache
            python-anitopy
            python-cheap-repr
            python-flask-humanize
            python-outdated
            python-birdseye
            python-kagglesdk
            kaggle
            verapdf
            zzzfm-common-bin
            zzzfm-bin))

;;; python-ipycache — IPython %cache magic for caching cell outputs
(define-public python-ipycache
  (package
    (name "python-ipycache")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/92/2b/"
                    "0370a02e514631e97fc02cedb1c29a6876f820e8ec3ec44eebe46f7c8952/"
                    "ipycache-" version ".zip"))
              (sha256
               (base32 "1vxqzlvzcagjhplvzi0vbf67afcnbdq1g01ib5csc29p3clb9pmn"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list unzip))
    (synopsis "IPython %cache magic for persistent caching of cell outputs")
    (description "Ipycache defines an IPython %cache magic command for caching
the results of long-running computations in IPython notebooks.  Cached
results are stored to disk and restored across sessions.")
    (home-page "https://github.com/rossant/ipycache")
    (license license:bsd-3)))

;;; python-anitopy — anime file name parser
(define-public python-anitopy
  (package
    (name "python-anitopy")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "anitopy" version))
              (sha256
               (base32 "09lfk036mjamsgzm4lmdwrrsbs3mvhxvakiz643f8zlig36rfnsi"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (synopsis "anime file name parsing library")
    (description "Anitopy is a Python library for parsing anime video file
names into structured data.  It extracts metadata such as anime title, episode
number, release group, and video quality from file names.")
    (home-page "https://github.com/igorcmoura/anitopy")
    (license license:mpl2.0)))

;;; python-cheap-repr — fast repr() for large objects (dep for birdseye)
(define-public python-cheap-repr
  (package
    (name "python-cheap-repr")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "cheap_repr" version))
              (sha256
               (base32 "03x3lmn8rcmwrrq5gy4pkmajmb20c1vmyb0msdx5qc5hmpw5q6h0"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "fast repr() for large or complex Python objects")
    (description "Cheap-repr provides fast @code{repr()} implementations for
large or complex Python objects.  It truncates output and provides time-limited
representations to avoid hanging on deeply nested structures.")
    (home-page "https://github.com/alexmojaki/cheap_repr")
    (license license:expat)))

;;; python-flask-humanize — Jinja2 humanize filters for Flask (dep for birdseye)
(define-public python-flask-humanize
  (package
    (name "python-flask-humanize")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/32/65/"
                    "556648b9f83e08b8e482873028d4ed5b5d0dd1adcc7dc84351f6aa738fed/"
                    "Flask-Humanize-" version ".tar.gz"))
              (sha256
               (base32 "0j9xkzm8dh77413y015z4dagk68gw7qg02plhwcipvnyzi67nnpn"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-flask python-humanize))
    (synopsis "jinja2 humanize filters for Flask applications")
    (description "Flask-Humanize provides Jinja2 template filters for the
Flask web framework that format numbers, dates, and file sizes into
human-readable strings using the humanize library.")
    (home-page "https://github.com/vitalk/flask-humanize")
    (license license:bsd-3)))

;;; python-outdated — check if a package is outdated (dep for birdseye)
(define-public python-outdated
  (package
    (name "python-outdated")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "outdated" version))
              (sha256
               (base32 "0w5rb0qg8anflvrpr45xzzjy8dah9py8bm4ns0h12w9niv4dwzsb"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-littleutils python-requests))
    (synopsis "check if a package on PyPI is outdated")
    (description "Outdated is a Python library that checks if a package is
outdated by comparing the installed version against the latest version on
PyPI.  It provides both a library API and a CLI command.")
    (home-page "https://github.com/alexmojaki/outdated")
    (license license:expat)))

;;; python-birdseye — graphical Python debugger using AST
(define-public python-birdseye
  (package
    (name "python-birdseye")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "birdseye" version))
              (sha256
               (base32 "0bj2n5hw0v65cpz1lwjrwlz9hqmvibia03my73pabx3rrmmp4a0g"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-setuptools-scm python-wheel))
    (propagated-inputs (list python-flask
                             python-flask-humanize
                             python-sqlalchemy
                             python-asttokens
                             python-littleutils
                             python-cheap-repr
                             python-outdated
                             python-cached-property))
    (synopsis "graphical Python debugger using AST transformations")
    (description "Birdseye is a graphical Python debugger that records the
values of expressions in a function call and lets you easily view them after
the function exits.  It works by AST transformation and stores results in a
SQLAlchemy database browsable via a Flask web interface.")
    (home-page "https://github.com/alexmojaki/birdseye")
    (license license:expat)))

;;; python-kagglesdk — Kaggle API SDK (dep for kaggle)
(define-public python-kagglesdk
  (package
    (name "python-kagglesdk")
    (version "0.1.18")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "kagglesdk" version))
              (sha256
               (base32 "15b049hnxh0ipc1ihkg7i4x9x4wvzrvcsblhwdd8awm7kpsicf10"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-protobuf python-requests))
    (synopsis "kaggle API software development kit")
    (description "Kagglesdk is the Python software development kit for the
Kaggle API.  It provides low-level bindings for interacting with Kaggle
competitions, datasets, kernels, and models programmatically.")
    (home-page "https://github.com/Kaggle/kaggle-api")
    (license license:asl2.0)))

;;; kaggle — Kaggle API command-line tool
(define-public kaggle
  (package
    (name "kaggle")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "kaggle" version))
              (sha256
               (base32 "05jgq9a12pw19zvzc1l65z88832hnqpdi4c33l7lpc0nb79pf2dz"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-bleach
                             python-kagglesdk
                             python-dateutil
                             python-slugify
                             python-requests
                             python-tqdm
                             python-urllib3))
    (synopsis "kaggle API command-line tool for competitions and datasets")
    (description "Kaggle is the official command-line tool for the Kaggle
platform.  It provides commands for downloading competition data, submitting
predictions, managing datasets, and interacting with Kaggle kernels and
models.")
    (home-page "https://github.com/Kaggle/kaggle-api")
    (license license:asl2.0)))

;;; verapdf — industry-supported open-source PDF/A validator
(define-public verapdf
  (package
    (name "verapdf")
    (version "1.28.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://software.verapdf.org/rel/1.28/"
                    "verapdf-greenfield-" version "-installer.zip"))
              (sha256
               (base32 "128ybi1minwaki1qsczfgvi3kkxhd1aqlznrys0736gh1dgklsfi"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("verapdf" "bin/verapdf")
               ("verapdf-gui" "bin/verapdf-gui")
               ("." "share/verapdf/"
                :include-regexp (".*\\.jar$" ".*\\.txt$" ".*\\.properties$")))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-and-prepare
                 (lambda* (#:key inputs #:allow-other-keys)
                   (use-modules (guix build utils))
                   (invoke "unzip" "-o" (assoc-ref inputs "source"))
                   (let ((dir (car (find-files "." "verapdf-greenfield.*"
                                               #:directories? #t
                                               #:fail-on-error? #f))))
                     (when dir (chdir dir)))
                   ;; Create wrapper scripts
                   (with-output-to-file "verapdf"
                     (lambda ()
                       (display "#!/bin/sh\n")
                       (format #t "exec ~a/bin/java -jar ~a/share/verapdf/verapdf-greenfield-~a.jar \"$@\"~%"
                               #$(file-append (this-package-input "openjdk") "")
                               #$output
                               #$version)))
                   (with-output-to-file "verapdf-gui"
                     (lambda ()
                       (display "#!/bin/sh\n")
                       (format #t "exec ~a/bin/java -jar ~a/share/verapdf/verapdf-greenfield-gui-~a.jar \"$@\"~%"
                               #$(file-append (this-package-input "openjdk") "")
                               #$output
                               #$version)))
                   (chmod "verapdf" #o755)
                   (chmod "verapdf-gui" #o755))))))
    (native-inputs (list unzip))
    (inputs (list openjdk))
    (supported-systems '("x86_64-linux"))
    (synopsis "industry-supported open-source PDF/A validator")
    (description "VeraPDF is the industry-supported open-source PDF/A
validator.  It checks PDF files for conformance to PDF/A-1, PDF/A-2, and
PDF/A-3 standards.  It provides both a command-line tool and a graphical
user interface.")
    (home-page "https://verapdf.org")
    (license (list license:gpl3+ license:mpl2.0))))

;;; zzzfm-common-bin — shared data for ZzzFM file manager (dep for zzzfm-bin)
(define-public zzzfm-common-bin
  (package
    (name "zzzfm-common-bin")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/antix-contribs/zzzfm/-/raw/contribs/"
                    "deb-packages/zzzfm-common_" version
                    "-6~contribs2_all.deb"))
              (file-name (string-append "zzzfm-common-" version ".deb"))
              (sha256
               (base32 "1jk8xg40wwb4k4mk2j8v34v9rsl94zcmmawqdb8gzw772p7ifgcj"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/share" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils tar xz))
    (synopsis "shared data files for ZzzFM file manager")
    (description "Zzzfm-common provides shared data files, icons, and
desktop entries for the ZzzFM file manager.  This includes translations,
UI definitions, and application metadata.")
    (home-page "https://gitlab.com/antix-contribs/zzzfm")
    (license license:gpl3+)))

;;; zzzfm-bin — lightweight GTK file manager
(define-public zzzfm-bin
  (package
    (name "zzzfm-bin")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/antix-contribs/zzzfm/-/raw/contribs/"
                    "deb-packages/zzzfm_" version
                    "-6~contribs2_amd64.deb"))
              (file-name (string-append "zzzfm-" version ".deb"))
              (sha256
               (base32 "0r4gqzb1zj0bkf4sp4cv7mvl5c64zydhf9xsypffrq1a5x579090"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin" "bin/")
               ("usr/share" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils tar xz))
    (inputs (list zzzfm-common-bin gtk+-2))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight GTK file manager for antiX and MX Linux")
    (description "ZzzFM is a lightweight file manager based on SpaceFM and
PCManFM.  It provides a fast, multi-panel interface with tabbed browsing,
file search, and customizable keybindings.")
    (home-page "https://gitlab.com/antix-contribs/zzzfm")
    (license license:gpl3+)))
