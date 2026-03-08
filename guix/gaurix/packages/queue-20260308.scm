(define-module (gaurix packages queue-20260308)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xml)
  #:export (beautysh lieer qtile-extras protontricks-git rivalcfg
            python-fpdf2))

(define-public beautysh
  (package
    (name "beautysh")
    (version "6.4.2")
    (source (origin (method git-fetch)
                    (uri (git-reference (url "https://github.com/lovesegfault/beautysh")
                                        (commit (string-append "v" version))))
                    (file-name (git-file-name name version))
                    (sha256 (base32 "14pc6zsq59aymy4r1909qfz0mfkhzhp30slqn9z0csk4v2qb5fn0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list))
    (native-inputs (list python-hatchling))
    (home-page "https://github.com/lovesegfault/beautysh")
    (synopsis "Bash beautifier")
    (description "beautysh formats Bash scripts with consistent style.")
    (license license:expat)))

(define-public lieer
  (package
    (name "lieer")
    (version "1.6")
    (source (origin (method git-fetch)
                    (uri (git-reference (url "https://github.com/gauteh/lieer")
                                        (commit (string-append "v" version))))
                    (file-name (git-file-name name version))
                    (sha256 (base32 "1da36mhzb7gzfw2xv80c3cnz7hr7xfm4h6zpmv46n6i8gvmrhzsk"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/gauteh/lieer")
    (synopsis "Gmail and notmuch tag synchronization")
    (description "lieer synchronizes messages and tags between Gmail and notmuch.")
    (license license:gpl3+)))

(define-public qtile-extras
  (package
    (name "qtile-extras")
    (version "0.34.1")
    (source (origin (method url-fetch)
                    (uri (pypi-uri "qtile_extras" version))
                    (sha256 (base32 "003rg6dlj7b2lxyjsmyp2157yr2gdjxmfaxlmzz2878fclr3g646"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/elParaguayo/qtile-extras")
    (synopsis "Extra items for Qtile")
    (description "qtile-extras provides add-on widgets and tools for Qtile.")
    (license license:expat)))

(define-public protontricks-git
  (package
    (name "protontricks-git")
    (version "1.14.0")
    (source (origin (method git-fetch)
                    (uri (git-reference (url "https://github.com/Matoking/protontricks")
                                        (commit version)))
                    (file-name (git-file-name name version))
                    (sha256 (base32 "0b2i2a0j9bq4iy29pqckkk3fyfd4nxin0zysjkp1biprr2vjr9nz"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/Matoking/protontricks")
    (synopsis "Run winetricks for Proton games")
    (description "protontricks is a wrapper for running winetricks against Proton prefixes.")
    (license license:gpl3+)))

(define-public rivalcfg
  (package
    (name "rivalcfg")
    (version "4.16.0")
    (source (origin (method url-fetch)
                    (uri (pypi-uri "rivalcfg" version))
                    (sha256 (base32 "1qf1wgsp74vad9m7qjypxsfazsacf2pfr3z72inhw5wv041ga9kn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list))
    (native-inputs (list python-flit-core))
    (home-page "https://github.com/flozz/rivalcfg")
    (synopsis "Configure SteelSeries mice")
    (description "rivalcfg configures supported SteelSeries gaming mice.")
    (license license:gpl3+)))

(define-public python-fpdf2
  (package
    (name "python-fpdf2")
    (version "2.8.7")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "fpdf2" version))
       (sha256
        (base32 "1yapvrza3w3askik8v4rz0zghf9nl8v5lxpvf6ib0ylwbbpcqq3h"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-defusedxml python-fonttools python-pillow))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://py-pdf.github.io/fpdf2/")
    (synopsis "Simple and fast PDF generation for Python")
    (description "fpdf2 provides a Python library to generate PDF documents.")
    (license license:lgpl3+)))

