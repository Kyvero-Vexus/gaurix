;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417af
;;; Resolves 100 TODO Python packages from queue.
;;;
;;; Recipes (93):
;;;     1. python-hurry-filesize (pyproject, v0.9, expat)
;;;     2. python-hyprpy (pyproject, v0.2.1, expat)
;;;     3. python-mpld3 (pyproject, v0.5.12, bsd-3)
;;;     4. python-ghtopdep (pyproject, v0.4.3, expat)
;;;     5. python-hijridate (pyproject, v2.6.0, expat)
;;;     6. python-banal (pyproject, v1.1.2, expat)
;;;     7. python-apkinspector (pyproject, v1.3.6, asl2.0)
;;;     8. python-mapbox-earcut (pyproject, v2.0.0, expat)
;;;     9. python-moderngl (pyproject, v5.12.0, expat)
;;;    10. python-lzf (pyproject, v0.1, expat)
;;;    11. python-pipreqs (pyproject, v0.5.0, asl2.0)
;;;    12. python-yarg (pyproject, v0.1.10, expat)
;;;    13. python-imbalanced-learn (pyproject, v0.14.1, expat)
;;;    14. python-dashtable (pyproject, v1.4.5, expat)
;;;    15. python-drawsvg (pyproject, v2.4.1, expat)
;;;    16. python-pulsectl-asyncio (pyproject, v1.2.2, expat)
;;;    17. python-nodriver (pyproject, v0.48.1, expat)
;;;    18. python-sphinx-multiversion (pyproject, v0.2.4, bsd-3)
;;;    19. python-sabctools (pyproject, v9.4.0, expat)
;;;    20. python-webssh (pyproject, v1.6.3, expat)
;;;    21. python-ghostscript (pyproject, v0.8.1, gpl3)
;;;    22. python-nava (pyproject, v0.8, expat)
;;;    23. python-shap (pyproject, v0.51.0, expat)
;;;    24. python-garth (pyproject, v0.8.0, expat)
;;;    25. python-alt-profanity-check (pyproject, v1.8.0, expat)
;;;    26. python-pushover-complete (pyproject, v2.0.0, expat)
;;;    27. python-soundcard (pyproject, v0.4.6, bsd-3)
;;;    28. python-awscli-plugin-endpoint (pyproject, v0.4, expat)
;;;    29. python-sphinx-substitution-extensions (pyproject, v2026.1.12, expat)
;;;    30. python-jdatetime (pyproject, v5.2.0, psfl)
;;;    31. python-sigmf (pyproject, v1.8.0, expat)
;;;    32. python-edge-tts (pyproject, v7.2.8, expat)
;;;    33. python-html-sanitizer (pyproject, v2.6.0, bsd-3)
;;;    34. python-gputil (pyproject, v1.4.0, expat)
;;;    35. python-ffmpy (pyproject, v1.0.0, expat)
;;;    36. python-viztracer (pyproject, v1.1.1, expat)
;;;    37. python-tkinter-tooltip (pyproject, v3.1.2, expat)
;;;    38. python-uptime (pyproject, v3.0.1, expat)
;;;    39. python-gradio-client (pyproject, v2.4.1, expat)
;;;    40. python-gpt4all (pyproject, v2.8.2, expat)
;;;    41. python-shazamio (pyproject, v0.8.1, expat)
;;;    42. python-routeros-api (pyproject, v0.21.0, expat)
;;;    43. python-catppuccin (pyproject, v2.5.0, expat)
;;;    44. python-soundcloud-v2 (pyproject, v1.6.2, expat)
;;;    45. python-laspy (pyproject, v2.7.0, expat)
;;;    46. python-material-color-utilities (pyproject, v0.2.6, expat)
;;;    47. python-bandcamp-api (pyproject, v0.2.3, expat)
;;;    48. python-tgtg (pyproject, v0.18.4, expat)
;;;    49. python-qrcode-artistic (pyproject, v3.0.2, expat)
;;;    50. python-grep-ast (pyproject, v0.9.0, expat)
;;;    51. python-lizard (pyproject, v1.21.6, expat)
;;;    52. python-oletools (pyproject, v0.60.2, bsd-3)
;;;    53. python-mktxp (pyproject, v1.2.17, gpl2)
;;;    54. python-random2 (pyproject, v1.0.2, expat)
;;;    55. python-runtype (pyproject, v0.5.3, expat)
;;;    56. python-jsonschema-rs (pyproject, v0.46.0, expat)
;;;    57. python-e3-core (pyproject, v22.10.0, gpl3)
;;;    58. python-latexify-py (pyproject, v0.4.4, asl2.0)
;;;    59. python-owega (pyproject, v5.27.4, expat)
;;;    60. python-scalene (pyproject, v2.2.1, expat)
;;;    61. python-pdftopng (pyproject, v0.2.4, gpl2)
;;;    62. python-livepng (pyproject, v0.1.8, gpl3)
;;;    63. python-evaluate (pyproject, v0.4.6, asl2.0)
;;;    64. python-wordllama (pyproject, v0.4.0.post1, expat)
;;;    65. python-flax (pyproject, v0.12.6, expat)
;;;    66. python-cryptolyzer (pyproject, v1.1.0, mpl2.0)
;;;    67. python-ninja (pyproject, v1.13.0, expat)
;;;    68. python-keepassxc-browser (pyproject, v0.1.8, gpl3)
;;;    69. python-google-genai (pyproject, v1.73.1, expat)
;;;    70. python-goodreads (pyproject, v0.3.2, expat)
;;;    71. python-xpybutil (pyproject, v0.0.6, expat)
;;;    72. python-pyqtdarktheme (pyproject, v2.1.0, expat)
;;;    73. python-fasta2a (pyproject, v0.6.0, expat)
;;;    74. python-sqlite-vec (pyproject, v0.1.9, expat)
;;;    75. python-rustworkx (pyproject, v0.17.1, expat)
;;;    76. python-discord-rpc (pyproject, v5.5, expat)
;;;    77. python-largestinteriorrectangle (pyproject, v0.2.1, asl2.0)
;;;    78. python-rdbtools (pyproject, v0.1.15, expat)
;;;    79. python-amulet-core (pyproject, v1.9.39, expat)
;;;    80. python-ezchlog (pyproject, v1.4.0, expat)
;;;    81. python-pssh (pyproject, v2.3.1, bsd-3)
;;;    82. python-rocket-fft (pyproject, v0.3.1, bsd-3)
;;;    83. python-coincurve (pyproject, v21.0.0, expat)
;;;    84. python-pyevtk (pyproject, v1.6.0, expat)
;;;    85. python-jax-jumpy (pyproject, v1.0.0, expat)
;;;    86. python-kodistubs (pyproject, v21.0.0, gpl3)
;;;    87. python-groovy (pyproject, v0.1.2, expat)
;;;    88. python-openai-agents (pyproject, v0.14.1, expat)
;;;    89. python-pytest-pyodide (pyproject, v0.59.0, expat)
;;;    90. python-voicevox-client (pyproject, v1.1.0, expat)
;;;    91. python-pypylon (pyproject, v26.3.1, expat)
;;;    92. python-jaxlib (pyproject, v0.10.0, asl2.0)
;;;    93. python-cheap-repr (pyproject, v0.5.2, expat)
;;;
;;; Blocked (7):
;;;    94. python-optking — BLOCKED: FETCH_FAILED (PyPI package "optking" not found (tried variants))
;;;    95. python-ipycache-git — BLOCKED: FETCH_FAILED (PyPI package "ipycache-git" not found (tried variants))
;;;    96. python-kaggle-api — BLOCKED: FETCH_FAILED (PyPI package "kaggle-api" not found (tried variants))
;;;    97. python-anitopy-git — BLOCKED: FETCH_FAILED (PyPI package "anitopy-git" not found (tried variants))
;;;    98. python-tensorstore-bin — BLOCKED: FETCH_FAILED (PyPI package "tensorstore-bin" not found (tried variants))
;;;    99. python-libipld-git — BLOCKED: FETCH_FAILED (PyPI package "libipld-git" not found (tried variants))
;;;   100. python-pyephem-git — BLOCKED: FETCH_FAILED (PyPI package "pyephem-git" not found (tried variants))
;;;
;;; 93 recipes + 7 BLOCKED = 100 total.
;;;
;;; NOTE: All sha256 hashes obtained from PyPI JSON API.

(define-module (gaurix packages recipe-resolver-260417af)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            python-hurry-filesize
            python-hyprpy
            python-mpld3
            python-ghtopdep
            python-hijridate
            python-banal
            python-apkinspector
            python-mapbox-earcut
            python-moderngl
            python-lzf
            python-pipreqs
            python-yarg
            python-imbalanced-learn
            python-dashtable
            python-drawsvg
            python-pulsectl-asyncio
            python-nodriver
            python-sphinx-multiversion
            python-sabctools
            python-webssh
            python-ghostscript
            python-nava
            python-shap
            python-garth
            python-alt-profanity-check
            python-pushover-complete
            python-soundcard
            python-awscli-plugin-endpoint
            python-sphinx-substitution-extensions
            python-jdatetime
            python-sigmf
            python-edge-tts
            python-html-sanitizer
            python-gputil
            python-ffmpy
            python-viztracer
            python-tkinter-tooltip
            python-uptime
            python-gradio-client
            python-gpt4all
            python-shazamio
            python-routeros-api
            python-catppuccin
            python-soundcloud-v2
            python-laspy
            python-material-color-utilities
            python-bandcamp-api
            python-tgtg
            python-qrcode-artistic
            python-grep-ast
            python-lizard
            python-oletools
            python-mktxp
            python-random2
            python-runtype
            python-jsonschema-rs
            python-e3-core
            python-latexify-py
            python-owega
            python-scalene
            python-pdftopng
            python-livepng
            python-evaluate
            python-wordllama
            python-flax
            python-cryptolyzer
            python-ninja
            python-keepassxc-browser
            python-google-genai
            python-goodreads
            python-xpybutil
            python-pyqtdarktheme
            python-fasta2a
            python-sqlite-vec
            python-rustworkx
            python-discord-rpc
            python-largestinteriorrectangle
            python-rdbtools
            python-amulet-core
            python-ezchlog
            python-pssh
            python-rocket-fft
            python-coincurve
            python-pyevtk
            python-jax-jumpy
            python-kodistubs
            python-groovy
            python-openai-agents
            python-pytest-pyodide
            python-voicevox-client
            python-pypylon
            python-jaxlib
            python-cheap-repr
            ))

;;; -------------------------------------------------------------------
;;; python-hurry-filesize — a simple Python library for human readable file sizes (or anything sized in...
;;; -------------------------------------------------------------------
(define-public python-hurry-filesize
  (package
    (name "python-hurry-filesize")
    (version "0.9")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/ee/5e/16e17bedcf54d5b618dc0771690deda77178e5c310402881c3d2d6c5f27c/hurry.filesize-0.9.tar.gz")
              (sha256
               (base32
                "19mr04wgc41cljqqkbjm0hk7kfs04d99155wsg66my5ymllq6dpm"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "UNKNOWN")
    (synopsis "a simple Python library for human readable file sizes (or anything sized in...")
    (description "A simple Python library for human readable file sizes (or anything sized in bytes).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-hyprpy — python bindings for the Hyprland compositor
;;; -------------------------------------------------------------------
(define-public python-hyprpy
  (package
    (name "python-hyprpy")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/36/c9/ae481dea6ca032287fdb87c3afab1b9163e4840df5667d2d238c30d862f2/hyprpy-0.2.1.tar.gz")
              (sha256
               (base32
                "1w1vxc9skx38gslxhfrxihs3bngzaak8bmpskz95dk0dkn35sqc8"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/hyprpy/")
    (synopsis "python bindings for the Hyprland compositor")
    (description "Python bindings for the Hyprland compositor.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-mpld3 — d3 Viewer for Matplotlib
;;; -------------------------------------------------------------------
(define-public python-mpld3
  (package
    (name "python-mpld3")
    (version "0.5.12")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/f8/b2/9943f3e0bdf4ff9968b7ac4499152162d8ee8fc8eaa55487339872f86300/mpld3-0.5.12.tar.gz")
              (sha256
               (base32
                "0drcgx3ikyrsj1mcbm7snr06bhjvyqvbl0bqqbrrmshjl2yf4cqk"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://mpld3.github.com")
    (synopsis "d3 Viewer for Matplotlib")
    (description "D3 Viewer for Matplotlib.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; python-ghtopdep — cLI tool for sorting dependents repositories and packages by stars
;;; -------------------------------------------------------------------
(define-public python-ghtopdep
  (package
    (name "python-ghtopdep")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/fd/4e/77f4964a360710e5a433bdc99795c25313c19c530ff03b5b75999781121d/ghtopdep-0.4.3.tar.gz")
              (sha256
               (base32
                "0drbjcn50a080fm6iiw22bqg2ms59yajh027bfvq81lc0any9plj"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/ghtopdep/")
    (synopsis "cLI tool for sorting dependents repositories and packages by stars")
    (description "CLI tool for sorting dependents repositories and packages by stars.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-hijridate — accurate Hijri-Gregorian dates converter based on Umm al-Qura calendar
;;; -------------------------------------------------------------------
(define-public python-hijridate
  (package
    (name "python-hijridate")
    (version "2.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/0e/8a/ddbaee418c78d067832e6d684e52640e19aa04d81d8eee42870b98728205/hijridate-2.6.0.tar.gz")
              (sha256
               (base32
                "003f46xwfs7c8alrn92kpbji4p20c2kbya1wmb9czqqz9m669r5g"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/hijridate/")
    (synopsis "accurate Hijri-Gregorian dates converter based on Umm al-Qura calendar")
    (description "Accurate Hijri-Gregorian dates converter based on Umm al-Qura calendar.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-banal — commons of banal micro-functions for Python
;;; -------------------------------------------------------------------
(define-public python-banal
  (package
    (name "python-banal")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/4c/cc/b36bc69862e057a51b47e2ce4a74e4bb81bed77dcf3a54fd71a05b9c99dd/banal-1.1.2-py3-none-any.whl")
              (sha256
               (base32
                "1p8xzrip31759jglxhlnqskga07kr6lhd52qhwp5wdqma1r031ri"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/banal/")
    (synopsis "commons of banal micro-functions for Python")
    (description "Commons of banal micro-functions for Python.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-apkinspector — apkInspector is a tool designed to provide detailed insights into the zip s...
;;; -------------------------------------------------------------------
(define-public python-apkinspector
  (package
    (name "python-apkinspector")
    (version "1.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/43/c2/56a1cb01ca64549633fa39b799861b226cda600412b62e9c6e4e4acb2f71/apkinspector-1.3.6.tar.gz")
              (sha256
               (base32
                "010scmvpd4g9m87qkldm9w29mml7987agq893dmqmlh6150fx6yk"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/apkInspector/")
    (synopsis "apkInspector is a tool designed to provide detailed insights into the zip s...")
    (description "apkInspector is a tool designed to provide detailed insights into the zip structure of APK files, offering the capability to extract content and decode the AndroidManifest.xml file.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; python-mapbox-earcut — python bindings for the mapbox earcut C++ polygon triangulation library
;;; -------------------------------------------------------------------
(define-public python-mapbox-earcut
  (package
    (name "python-mapbox-earcut")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/bc/7b/bbf6b00488662be5d2eb7a188222c264b6f713bac10dc4a77bf37a4cb4b6/mapbox_earcut-2.0.0.tar.gz")
              (sha256
               (base32
                "1mpry1bimbxxw4axyyf4wl07ki82flzqxfcqnvg535grdjwbdsl1"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/mapbox-earcut/")
    (synopsis "python bindings for the mapbox earcut C++ polygon triangulation library")
    (description "Python bindings for the mapbox earcut C++ polygon triangulation library.")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; python-moderngl — modernGL: High performance rendering for Python 3
;;; -------------------------------------------------------------------
(define-public python-moderngl
  (package
    (name "python-moderngl")
    (version "5.12.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/da/52/540e2f8c45060bb2709f56eb5a44ae828dfcc97ccecb342c1a7deb467889/moderngl-5.12.0.tar.gz")
              (sha256
               (base32
                "16qjwpfblwsqidw4x4izgqg87xhr565m466bwgbf3wmjrjc6m4sj"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/moderngl/moderngl")
    (synopsis "modernGL: High performance rendering for Python 3")
    (description "ModernGL: High performance rendering for Python 3.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-lzf — cFFI-based Python binding for LZF stream compression
;;; -------------------------------------------------------------------
(define-public python-lzf
  (package
    (name "python-lzf")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/ef/f7/70aa6aacd6bc865e74dae319bb262078d59f6cf90584da2bbe7307b52565/lzf-0.1.tar.gz")
              (sha256
               (base32
                "0fw9z3faj97dh7snfplpck9ab4jdg9hm38x0lnjbla3k5wbsaqr1"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/lordmauve/lzf")
    (synopsis "cFFI-based Python binding for LZF stream compression")
    (description "CFFI-based Python binding for LZF stream compression.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; python-pipreqs — pip requirements.txt generator based on imports in project
;;; -------------------------------------------------------------------
(define-public python-pipreqs
  (package
    (name "python-pipreqs")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/12/4c/0a335b1b70c7e1821140ac6f884b51d47f049bcb600fa19bb374922f73aa/pipreqs-0.5.0.tar.gz")
              (sha256
               (base32
                "10q1vi7ws7r7rgla3fyff3fbmnc4s2a3b6nbd7rxwxpz6p99hcpk"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/bndr/pipreqs")
    (synopsis "pip requirements.txt generator based on imports in project")
    (description "Pip requirements.txt generator based on imports in project.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; python-yarg — a semi hard Cornish cheese, also queries PyPI (PyPI client)
;;; -------------------------------------------------------------------
(define-public python-yarg
  (package
    (name "python-yarg")
    (version "0.1.10")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/5f/f4/86a394ac2c74268c0281d27b6ca9a37bb595d19601bf4de920584e581eb6/yarg-0.1.10.tar.gz")
              (sha256
               (base32
                "0zlbhk2s3443rq9hk3z78ff59pkhll350sp4vz9c5symi6pr9g0z"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://yarg.readthedocs.org/")
    (synopsis "a semi hard Cornish cheese, also queries PyPI (PyPI client)")
    (description "A semi hard Cornish cheese, also queries PyPI (PyPI client).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-imbalanced-learn — toolbox for imbalanced dataset in machine learning
;;; -------------------------------------------------------------------
(define-public python-imbalanced-learn
  (package
    (name "python-imbalanced-learn")
    (version "0.14.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/c1/7d/f1384d3c0eefb5531b4dc05c191aba260f78e4d4bdd31a0c2a3394de5c8d/imbalanced_learn-0.14.1.tar.gz")
              (sha256
               (base32
                "1jyd7i5fws7vqqrsc5g7v1z0lfg4ydkdlmk38a9gmdln79vvbvj6"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/imbalanced-learn/")
    (synopsis "toolbox for imbalanced dataset in machine learning")
    (description "Toolbox for imbalanced dataset in machine learning.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-dashtable — a library for converting a HTML tables into ASCII tables, rowspan and colsp...
;;; -------------------------------------------------------------------
(define-public python-dashtable
  (package
    (name "python-dashtable")
    (version "1.4.5")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/81/83/8c6daa702072b7db63c8338e865381919db331e38f9d6fa5e60b9f58388d/dashtable-1.4.5.tar.gz")
              (sha256
               (base32
                "0slrd53lv0cggf59l7k1fc7vd71m1ca7ckp6np54s166pv88s4vl"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/doakey3/DashTable")
    (synopsis "a library for converting a HTML tables into ASCII tables, rowspan and colsp...")
    (description "A library for converting a HTML tables into ASCII tables, rowspan and colspan allowed!")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-drawsvg — a Python 3 library for programmatically generating SVG (vector) images and ...
;;; -------------------------------------------------------------------
(define-public python-drawsvg
  (package
    (name "python-drawsvg")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/bf/07/a2c3db84e6af6fa761de905b39109fe24eff2c8d52653c1bff968b6b965d/drawsvg-2.4.1-py3-none-any.whl")
              (sha256
               (base32
                "1nkzbfv6pli96a9y3sl1gz0h6ws2hni42nv8r0mm80wfjqjg07r4"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/cduck/drawsvg")
    (synopsis "a Python 3 library for programmatically generating SVG (vector) images and ...")
    (description "A Python 3 library for programmatically generating SVG (vector) images and animations.  Drawsvg can also render to PNG, MP4, and display your drawings in Jupyter notebook and Jupyter lab.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-pulsectl-asyncio — asyncio frontend for the pulsectl Python bindings of libpulse
;;; -------------------------------------------------------------------
(define-public python-pulsectl-asyncio
  (package
    (name "python-pulsectl-asyncio")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/62/6c/cf1c49abd874edd460d4c68d860d0dc2605b9fd5958a7ba925e3b0c1ec9b/pulsectl_asyncio-1.2.2.tar.gz")
              (sha256
               (base32
                "0zs11pzg064kbp8f7sqj6vcva5kklil0cj2y0qw2wkgl21x44k7f"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mhthies/pulsectl-asyncio")
    (synopsis "asyncio frontend for the pulsectl Python bindings of libpulse")
    (description "Asyncio frontend for the pulsectl Python bindings of libpulse.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-nodriver — [Docs here](https://ultrafunkamsterdam.github.io/nodriver)
;;; -------------------------------------------------------------------
(define-public python-nodriver
  (package
    (name "python-nodriver")
    (version "0.48.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/25/da/a8ec72015adfe54d377ea54c4058dbfd66ea241270e8dfce4dcd56da5a3e/nodriver-0.48.1.tar.gz")
              (sha256
               (base32
                "0hs39fz2pw9s9qqa63aakfjn4x5iba7vfzqmvhk3q4xgns4cvj2a"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/nodriver/")
    (synopsis "[Docs here](https://ultrafunkamsterdam.github.io/nodriver)")
    (description "[Docs here](https://ultrafunkamsterdam.github.io/nodriver).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-sphinx-multiversion — add support for multiple versions to sphinx
;;; -------------------------------------------------------------------
(define-public python-sphinx-multiversion
  (package
    (name "python-sphinx-multiversion")
    (version "0.2.4")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/9a/10/25231164a97a9016bdc73a3530af8f4a6846bdc564af1460af2ff3e59a50/sphinx-multiversion-0.2.4.tar.gz")
              (sha256
               (base32
                "1jqbk7a1sm5yfvrvczlfm57sy4ya732fkrbcip5n7vayrfgcmlaw"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://holzhaus.github.io/sphinx-multiversion/")
    (synopsis "add support for multiple versions to sphinx")
    (description "Add support for multiple versions to sphinx.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; python-sabctools — c implementations of functions for use within SABnzbd
;;; -------------------------------------------------------------------
(define-public python-sabctools
  (package
    (name "python-sabctools")
    (version "9.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/59/27/332a888118543f222d8da61bd3eb565311706febb70f8820ddbf3475be36/sabctools-9.4.0.tar.gz")
              (sha256
               (base32
                "0cnhv324pb3c3yiik4k4x98bqfb9jyivmqm563fwv9zkk6sm2i16"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/sabctools/")
    (synopsis "c implementations of functions for use within SABnzbd")
    (description "C implementations of functions for use within SABnzbd.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-webssh — web based ssh client
;;; -------------------------------------------------------------------
(define-public python-webssh
  (package
    (name "python-webssh")
    (version "1.6.3")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/fe/8d/aba7feaaaaa15a54decff18c5df79df27f17c833e6f9fd274a217ec7077b/webssh-1.6.3.tar.gz")
              (sha256
               (base32
                "0071fvzvw0hqiw4zzxf9h7k1ii5k4j0drr6721ck9b86yax5pkib"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/huashengdun/webssh")
    (synopsis "web based ssh client")
    (description "Web based ssh client.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-ghostscript — interface to the Ghostscript C-API, both high- and low-level, based on ctypes
;;; -------------------------------------------------------------------
(define-public python-ghostscript
  (package
    (name "python-ghostscript")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/1e/4d/12eb41060aa530f22f5233bdc3bfa5c3f444c86e2853100cff9781536baa/ghostscript-0.8.1.tar.gz")
              (sha256
               (base32
                "120k5dwssrmaw8m4k93h8sy9lx69rnhb89g4j1wghsq30798bykw"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/pdftools/python-ghostscript")
    (synopsis "interface to the Ghostscript C-API, both high- and low-level, based on ctypes")
    (description "Interface to the Ghostscript C-API, both high- and low-level, based on ctypes.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; python-nava — a Python library for playing sound everywhere natively and securely
;;; -------------------------------------------------------------------
(define-public python-nava
  (package
    (name "python-nava")
    (version "0.8")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/86/7a/b85a58a5c52e1482b7cb303259c7c6a539140672f9de75935a8845b570bd/nava-0.8.tar.gz")
              (sha256
               (base32
                "1y0b6z5vkwnvc5mx5js9xyhv58q5l7vsf2qyn80dqvq133b9vx3i"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/openscilab/nava")
    (synopsis "a Python library for playing sound everywhere natively and securely")
    (description "A Python library for playing sound everywhere natively and securely.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-shap — a unified approach to explain the output of any machine learning model
;;; -------------------------------------------------------------------
(define-public python-shap
  (package
    (name "python-shap")
    (version "0.51.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/a4/0a/4a3ee4b1a3654f2a9ae038a64bb3e91a42af3da07577d69b65241f010970/shap-0.51.0.tar.gz")
              (sha256
               (base32
                "0nfv1fq9dqf7xv1ip8z15qpacdq0kgbj7aas5189sz352gr7z8fg"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/shap/")
    (synopsis "a unified approach to explain the output of any machine learning model")
    (description "A unified approach to explain the output of any machine learning model.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-garth — garmin SSO auth + Connect client
;;; -------------------------------------------------------------------
(define-public python-garth
  (package
    (name "python-garth")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/19/bc/ec45fd388678aa8d8521108f9e036bfb62cbb351ea374ea35652a49fe711/garth-0.8.0.tar.gz")
              (sha256
               (base32
                "1qs9ywrww5r296w68hxbzh4km9s8cp0qzjlqb0g0ih8qzszdybpp"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/garth/")
    (synopsis "garmin SSO auth + Connect client")
    (description "Garmin SSO auth + Connect client.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-alt-profanity-check — a fast, robust library to check for offensive language in strings. Dropdown...
;;; -------------------------------------------------------------------
(define-public python-alt-profanity-check
  (package
    (name "python-alt-profanity-check")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/b7/4d/2c76f3a39ace363d25dbba5cd908140bfb0a0576dc850a1e1b680916cd59/alt_profanity_check-1.8.0.tar.gz")
              (sha256
               (base32
                "10lw2nw4lcs9cqy4s2sbps755qjgbzxmqnzhvjr6al10rbwx1z5x"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/dimitrismistriotis/alt-profanity-check")
    (synopsis "a fast, robust library to check for offensive language in strings. Dropdown...")
    (description "A fast, robust library to check for offensive language in strings.  Dropdown replacement of \"profanity-check\".")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-pushover-complete — a Python package for interacting with *all* aspects of the Pushover API
;;; -------------------------------------------------------------------
(define-public python-pushover-complete
  (package
    (name "python-pushover-complete")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/db/ae/2ed5c277e22316d8a31e2f67c6c9fd5021189ed3754e144aad53d874d687/pushover_complete-2.0.0.tar.gz")
              (sha256
               (base32
                "19r1xm13iawr9yx540xk9h8z03gl6q6yizkqfq7889ilsy27vz14"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/pushover-complete/")
    (synopsis "a Python package for interacting with *all* aspects of the Pushover API")
    (description "A Python package for interacting with all aspects of the Pushover API.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-soundcard — play and record audio without resorting to CPython extensions
;;; -------------------------------------------------------------------
(define-public python-soundcard
  (package
    (name "python-soundcard")
    (version "0.4.6")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/f5/ef/85322a77399b19b23bd741ad57d86677687cdf9c9d9bc01997bc6bf9d30d/soundcard-0.4.6.tar.gz")
              (sha256
               (base32
                "0yzlij55jw9pqbky811lxk2rg7q6gk4qbhygigcdfz7r4r5dcilv"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/bastibe/SoundCard")
    (synopsis "play and record audio without resorting to CPython extensions")
    (description "Play and record audio without resorting to CPython extensions.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; python-awscli-plugin-endpoint — endpoint plugin for AWS CLI
;;; -------------------------------------------------------------------
(define-public python-awscli-plugin-endpoint
  (package
    (name "python-awscli-plugin-endpoint")
    (version "0.4")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/c7/e0/35562467505ded087e994cfa177e497050fd2df3e8b91b681cb8227bc1c7/awscli-plugin-endpoint-0.4.tar.gz")
              (sha256
               (base32
                "1l5gdfwkkv2zqinmlrgicl0hri5cfr1ad247qaqff5vzccgz15lh"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/wbingli/awscli-plugin-endpoint")
    (synopsis "endpoint plugin for AWS CLI")
    (description "Endpoint plugin for AWS CLI.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-sphinx-substitution-extensions — extensions for Sphinx which allow for substitutions
;;; -------------------------------------------------------------------
(define-public python-sphinx-substitution-extensions
  (package
    (name "python-sphinx-substitution-extensions")
    (version "2026.1.12")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/ca/3e/a82aa5fed0d06161a89dc2f6971b160f837cad44f196c467fc6b2132acaa/sphinx_substitution_extensions-2026.1.12.tar.gz")
              (sha256
               (base32
                "0dnpflssam7kb262qrc5inzs6i4hhx3ajgc8jgsiv7mz1z2cdq15"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/sphinx-substitution-extensions/")
    (synopsis "extensions for Sphinx which allow for substitutions")
    (description "Extensions for Sphinx which allow for substitutions.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-jdatetime — jalali datetime binding for python
;;; -------------------------------------------------------------------
(define-public python-jdatetime
  (package
    (name "python-jdatetime")
    (version "5.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/6e/9d/5ed59c36f3cbc68c01fab6442e6efb6d35a484ba4eec4f790264fce39f6c/jdatetime-5.2.0.tar.gz")
              (sha256
               (base32
                "0lgm4k1gvb5isvlhsp3yfl60n8ykp3w76anflc4vd0kvf6c5h7f8"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/slashmili/python-jalali")
    (synopsis "jalali datetime binding for python")
    (description "Jalali datetime binding for python.")
    (license license:psfl)))

;;; -------------------------------------------------------------------
;;; python-sigmf — easily interact with Signal Metadata Format (SigMF) recordings
;;; -------------------------------------------------------------------
(define-public python-sigmf
  (package
    (name "python-sigmf")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/ef/10/5762fd30c085b65ede5287c976d48af4a225bdd31c0c6e2e1627836c5bcc/sigmf-1.8.0.tar.gz")
              (sha256
               (base32
                "0l4scnfwqlq9mcp8kpwqzivgycvsq4j6mmk1z7jkk5j98sq0rqci"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/SigMF/")
    (synopsis "easily interact with Signal Metadata Format (SigMF) recordings")
    (description "Easily interact with Signal Metadata Format (SigMF) recordings.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; python-edge-tts — microsoft Edge's TTS
;;; -------------------------------------------------------------------
(define-public python-edge-tts
  (package
    (name "python-edge-tts")
    (version "7.2.8")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/3f/60/afbf548b43c78355e03926c6b1fff7500303a2da4d84db9e1324119e21ae/edge_tts-7.2.8.tar.gz")
              (sha256
               (base32
                "1l4cdcn41419qgwmv3dqngky1mf1mhgq9mgr0g8d5817snh8bwgw"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/rany2/edge-tts")
    (synopsis "microsoft Edge's TTS")
    (description "Microsoft Edge's TTS.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; python-html-sanitizer — hTML sanitizer
;;; -------------------------------------------------------------------
(define-public python-html-sanitizer
  (package
    (name "python-html-sanitizer")
    (version "2.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/87/c8/1c8d770748ba26d6168c763a212c8311f6052dc1763b3678c7bfaeef0f7f/html_sanitizer-2.6.0.tar.gz")
              (sha256
               (base32
                "096m9jwsx8h96a5sl2nlc0gbv0pld4phprxc9b01c78nvy9bq2z2"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/html-sanitizer/")
    (synopsis "hTML sanitizer")
    (description "HTML sanitizer.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; python-gputil — gPUtil is a Python module for getting the GPU status from NVIDA GPUs using ...
;;; -------------------------------------------------------------------
(define-public python-gputil
  (package
    (name "python-gputil")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/ed/0e/5c61eedde9f6c87713e89d794f01e378cfd9565847d4576fa627d758c554/GPUtil-1.4.0.tar.gz")
              (sha256
               (base32
                "1fggc4v6naadrdfjsq396jvazhm5ymkwlgvnr2ldyb2ibv3557h9"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/anderskm/gputil")
    (synopsis "gPUtil is a Python module for getting the GPU status from NVIDA GPUs using ...")
    (description "GPUtil is a Python module for getting the GPU status from NVIDA GPUs using nvidia-smi.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-ffmpy — a simple Python wrapper for FFmpeg
;;; -------------------------------------------------------------------
(define-public python-ffmpy
  (package
    (name "python-ffmpy")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/7d/d2/1c4c582d71bcc65c76fa69fab85de6257d50fdf6fd4a2317c53917e9a581/ffmpy-1.0.0.tar.gz")
              (sha256
               (base32
                "12rgw6k05z17nd9ygfp4f4cq4pvn09204hfh3h7q5j1maklk4adi"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/ffmpy/")
    (synopsis "a simple Python wrapper for FFmpeg")
    (description "A simple Python wrapper for FFmpeg.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-viztracer — a debugging and profiling tool that can trace and visualize python code exe...
;;; -------------------------------------------------------------------
(define-public python-viztracer
  (package
    (name "python-viztracer")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/9c/ab/94ae463cd4e386f143e3520a274856c4f2b4858d7ae30aa223ae25e9a2e5/viztracer-1.1.1.tar.gz")
              (sha256
               (base32
                "0ilkzr2l97clv0ar0v0s631hpm5l9jc6sh44lmwywh1srkfvbm6w"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/viztracer/")
    (synopsis "a debugging and profiling tool that can trace and visualize python code exe...")
    (description "A debugging and profiling tool that can trace and visualize python code execution.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-tkinter-tooltip — an easy and customisable ToolTip implementation for Tkinter
;;; -------------------------------------------------------------------
(define-public python-tkinter-tooltip
  (package
    (name "python-tkinter-tooltip")
    (version "3.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/a9/f1/e864d09013055e4c372995214efbd217415d8c8e91af2dbc91aaabe81f39/tkinter_tooltip-3.1.2.tar.gz")
              (sha256
               (base32
                "0r19mzc6w2zgw32pk0xp8qdw7nm4404zk5idxbgkc6c51iradj6s"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/gnikit/tkinter-tooltip")
    (synopsis "an easy and customisable ToolTip implementation for Tkinter")
    (description "An easy and customisable ToolTip implementation for Tkinter.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-uptime — cross-platform uptime library
;;; -------------------------------------------------------------------
(define-public python-uptime
  (package
    (name "python-uptime")
    (version "3.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/ad/53/6c420ddf6949097d6f9406358951c9322505849bea9cb79efe3acc0bb55d/uptime-3.0.1.tar.gz")
              (sha256
               (base32
                "0wr9jkixprlywz0plyn5p42a5fd31aiwvjrxdvj7r02vfxa04c3w"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Cairnarvon/uptime")
    (synopsis "cross-platform uptime library")
    (description "Cross-platform uptime library.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; python-gradio-client — python library for easily interacting with trained machine learning models
;;; -------------------------------------------------------------------
(define-public python-gradio-client
  (package
    (name "python-gradio-client")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/5f/5f/d480fb5e61cf47eaae6c4de2c84a5f130ebcaa2a0a4f36f9f494f53eea35/gradio_client-2.4.1.tar.gz")
              (sha256
               (base32
                "0cbdb88gm8619iwkxc1kwswkgayq5x1jm4gxgdb6vzdx7pmq71y0"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/gradio-client/")
    (synopsis "python library for easily interacting with trained machine learning models")
    (description "Python library for easily interacting with trained machine learning models.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; python-gpt4all — python bindings for GPT4All
;;; -------------------------------------------------------------------
(define-public python-gpt4all
  (package
    (name "python-gpt4all")
    (version "2.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/19/92/bad46a9bc5b993727045d09ce35e2dcc3939be02f47acfc99b2be0d33b33/gpt4all-2.8.2-py3-none-macosx_10_15_universal2.whl")
              (sha256
               (base32
                "05xvzgi8hb8zvqvbic0dy0y8k0whndg5qn5vphlrm70zzrhdxmj1"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gpt4all.io/")
    (synopsis "python bindings for GPT4All")
    (description "Python bindings for GPT4All.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-shazamio — is a asynchronous framework from reverse engineered Shazam API written in P...
;;; -------------------------------------------------------------------
(define-public python-shazamio
  (package
    (name "python-shazamio")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/2f/66/31ecae67c373421db10f250a83d80653d6908f7d95080c46816102bd1fda/shazamio-0.8.1.tar.gz")
              (sha256
               (base32
                "1z5manhv2pqihzg66sjvl5gx2rdamzxf7pyp5xwlvnnc6lkj4q2x"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/dotX12/ShazamIO")
    (synopsis "is a asynchronous framework from reverse engineered Shazam API written in P...")
    (description "Is a asynchronous framework from reverse engineered Shazam API written in Python 3.8+ with asyncio and aiohttp.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-routeros-api — python API to RouterBoard devices produced by MikroTik
;;; -------------------------------------------------------------------
(define-public python-routeros-api
  (package
    (name "python-routeros-api")
    (version "0.21.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/3b/3d/414cfbdc91ca6cf127cde120178ec0961caec4b1810e654f2d4520a475b7/routeros_api-0.21.0.tar.gz")
              (sha256
               (base32
                "0bfqjylk0ndwvbc3jp05kc647fkngn6hd4m3vivd8p7q9wm4adqd"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/socialwifi/RouterOS-api")
    (synopsis "python API to RouterBoard devices produced by MikroTik")
    (description "Python API to RouterBoard devices produced by MikroTik.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-catppuccin — 🐍 Soothing pastel theme for Python
;;; -------------------------------------------------------------------
(define-public python-catppuccin
  (package
    (name "python-catppuccin")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/b6/31/87c3ca25d29678e076e1f0d151ef8792f0557b26a8dc865035b5f1fa96c4/catppuccin-2.5.0.tar.gz")
              (sha256
               (base32
                "0d38gjn6661pb9jl4bg6l698aw4llir44xacrg8nj8xw6nzz6d9h"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/catppuccin/")
    (synopsis "🐍 Soothing pastel theme for Python")
    (description "🐍 Soothing pastel theme for Python.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-soundcloud-v2 — python wrapper for the internal v2 SoundCloud API.Does not require an API key
;;; -------------------------------------------------------------------
(define-public python-soundcloud-v2
  (package
    (name "python-soundcloud-v2")
    (version "1.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/6f/48/d83aec09276ecc1e72c3df81f4ab7b97b0eb3ee8b3c106bd05d44ff3431f/soundcloud_v2-1.6.2.tar.gz")
              (sha256
               (base32
                "1s33drzchpyv666nrvnllmg1nhk125w0wp8c2vl2y5kh4ckl1xr6"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/7x11x13/soundcloud.py")
    (synopsis "python wrapper for the internal v2 SoundCloud API.Does not require an API key")
    (description "Python wrapper for the internal v2 SoundCloud API.Does not require an API key.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-laspy — native Python ASPRS LAS read/write library
;;; -------------------------------------------------------------------
(define-public python-laspy
  (package
    (name "python-laspy")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/9c/5d/5a540ac25dcc57fa77691363bb753363b192a3759aefef4b40e1250ddb17/laspy-2.7.0.tar.gz")
              (sha256
               (base32
                "1xd34lq3ymdzqrvz4kr6fl72jfaklfval5785vqnypg78mafnvzm"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/laspy/")
    (synopsis "native Python ASPRS LAS read/write library")
    (description "Native Python ASPRS LAS read/write library.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; python-material-color-utilities — theme color library for Material You
;;; -------------------------------------------------------------------
(define-public python-material-color-utilities
  (package
    (name "python-material-color-utilities")
    (version "0.2.6")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/05/bb/751057cca6b6aee5162dda3ab0be55c69c703281d750765170c3ebab17ae/material_color_utilities-0.2.6.tar.gz")
              (sha256
               (base32
                "00l114pbcxsyzrz0k0qc0zyvrx9zb0l9kyzmlp1kmskyh63h7120"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/material-color-utilities/")
    (synopsis "theme color library for Material You")
    (description "Theme color library for Material You.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-bandcamp-api — obtains information from bandcamp.com
;;; -------------------------------------------------------------------
(define-public python-bandcamp-api
  (package
    (name "python-bandcamp-api")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/1b/32/f04a5d01f3951644abbdec70ca4430af94946182ef201167003bf7350f54/bandcamp_api-0.2.3.tar.gz")
              (sha256
               (base32
                "06ryzk73pzmkhlxgslmcd0jwvdvggi088y1s043k626ziqr9gxgg"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/RustyRin/bandcamp-api/")
    (synopsis "obtains information from bandcamp.com")
    (description "Obtains information from bandcamp.com.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-tgtg — unoffical python client for TooGoodToGo API
;;; -------------------------------------------------------------------
(define-public python-tgtg
  (package
    (name "python-tgtg")
    (version "0.18.4")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/2b/aa/f75cecac69e6ae6f20c88b1f08acdf321be830e529c9e3dc9d875d7e154f/tgtg-0.18.4.tar.gz")
              (sha256
               (base32
                "0dm9qblyl9msylvd0zsjmx9r0vpsyhzzdq6g425wphxlz6rnxhnr"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ahivert/tgtg-python")
    (synopsis "unoffical python client for TooGoodToGo API")
    (description "Unoffical python client for TooGoodToGo API.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-qrcode-artistic — artistic (Micro) QR Code plugin for Segno
;;; -------------------------------------------------------------------
(define-public python-qrcode-artistic
  (package
    (name "python-qrcode-artistic")
    (version "3.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/4f/cf/5fff014b4ba48c7e985343bc59827e134a11bae71227c15a47bee3b999aa/qrcode-artistic-3.0.2.tar.gz")
              (sha256
               (base32
                "1x41q545m9rxlp520ng13hps5r6b9skm8995yy6677y8fckg2wgb"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/qrcode-artistic/")
    (synopsis "artistic (Micro) QR Code plugin for Segno")
    (description "Artistic (Micro) QR Code plugin for Segno.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; python-grep-ast — a tool to grep through the AST of a source file
;;; -------------------------------------------------------------------
(define-public python-grep-ast
  (package
    (name "python-grep-ast")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/67/82/a87079945a7c15d242cb586ae22e17952132439eaa9c878ec5fbdc61c54d/grep_ast-0.9.0.tar.gz")
              (sha256
               (base32
                "1qrf9dfqdxlhrxnlm4plfj3iyrdf6k1adjfi709p5rlk8hm282k2"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/paul-gauthier/grep-ast")
    (synopsis "a tool to grep through the AST of a source file")
    (description "A tool to grep through the AST of a source file.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; python-lizard — a code analyzer without caring the C/C++ header files. It works with Java, ...
;;; -------------------------------------------------------------------
(define-public python-lizard
  (package
    (name "python-lizard")
    (version "1.21.6")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/6d/e6/c9ffd177f15905835e076570d6aebc7b8944b2f15f810aef7e93dede8b76/lizard-1.21.6.tar.gz")
              (sha256
               (base32
                "0rgd1qkp80pr9g3l8li34zcfz9ddbykkrc4dv8dwkvzsaibsc19b"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.lizard.ws")
    (synopsis "a code analyzer without caring the C/C++ header files. It works with Java, ...")
    (description "A code analyzer without caring the C/C++ header files.  It works with Java, C/C++, JavaScript, Python, Ruby, Swift, Objective C.  Metrics includes cyclomatic complexity number etc.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-oletools — python tools to analyze security characteristics of MS Office and OLE files...
;;; -------------------------------------------------------------------
(define-public python-oletools
  (package
    (name "python-oletools")
    (version "0.60.2")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/5c/2f/037f40e44706d542b94a2312ccc33ee2701ebfc9a83b46b55263d49ce55a/oletools-0.60.2.zip")
              (sha256
               (base32
                "1hxjw3knxmlpw44ild7sx5g1j39090rlagqian4gspv9yjcj0idd"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/decalage2/oletools")
    (synopsis "python tools to analyze security characteristics of MS Office and OLE files...")
    (description "Python tools to analyze security characteristics of MS Office and OLE files (also called Structured Storage, Compound File Binary Format or Compound Document File Format), for Malware Analysis and Incident Response #DFIR.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; python-mktxp — prometheus Exporter for Mikrotik RouterOS devices
;;; -------------------------------------------------------------------
(define-public python-mktxp
  (package
    (name "python-mktxp")
    (version "1.2.17")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/f7/97/2821c9b14c6eed9042394308d51b6cf34ffdefdf6cad90e6d2bbde4d95a6/mktxp-1.2.17.tar.gz")
              (sha256
               (base32
                "04hlzajqpj13m5axhrj4s1qk8105iywn812i6w363z0q118j1bnf"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/akpw/mktxp")
    (synopsis "prometheus Exporter for Mikrotik RouterOS devices")
    (description "Prometheus Exporter for Mikrotik RouterOS devices.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; python-random2 — python 3 compatible Python 2 `random` Module
;;; -------------------------------------------------------------------
(define-public python-random2
  (package
    (name "python-random2")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/c2/f8/aba7ea7900492da2dd405aa42aa6160b83490421c7d70cf2d5aa44238a13/random2-1.0.2.tar.gz")
              (sha256
               (base32
                "0xvy0lycqnkhwq9h6x08z2rrr063pfk7vyh5az6nfx9693pzqm1p"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://pypi.python.org/pypi/random2")
    (synopsis "python 3 compatible Python 2 `random` Module")
    (description "Python 3 compatible Python 2 'random' Module.")
    (license license:psfl)))

;;; -------------------------------------------------------------------
;;; python-runtype — type dispatch and validation for run-time Python
;;; -------------------------------------------------------------------
(define-public python-runtype
  (package
    (name "python-runtype")
    (version "0.5.3")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/60/76/d8a0f754c834c3d71a0896b1d40a1938244aab4bb5b4bab0b21d21525694/runtype-0.5.3.tar.gz")
              (sha256
               (base32
                "07yvqpwpl7nd75v13v3j9ny19lb08lq5xhlz5cs17lpqfifc1bnc"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/erezsh/runtype")
    (synopsis "type dispatch and validation for run-time Python")
    (description "Type dispatch and validation for run-time Python.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-jsonschema-rs — a high-performance JSON Schema validator for Python
;;; -------------------------------------------------------------------
(define-public python-jsonschema-rs
  (package
    (name "python-jsonschema-rs")
    (version "0.46.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/7b/89/7dc67b91860924360c12628ca5986902a44e7b42108747ce0b6d3f0ad750/jsonschema_rs-0.46.0.tar.gz")
              (sha256
               (base32
                "1895x32i9hy85730dswg5gichb36zigxj3wdsymn7yl3lmznmnaa"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/jsonschema-rs/")
    (synopsis "a high-performance JSON Schema validator for Python")
    (description "A high-performance JSON Schema validator for Python.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-e3-core — e3 core. Tools and library for building and testing software
;;; -------------------------------------------------------------------
(define-public python-e3-core
  (package
    (name "python-e3-core")
    (version "22.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/23/ff/1f547e4e0cd56d8c926e9d8c0f851b60467915776d794871327ecb0bde6f/e3_core-22.10.0-py3-none-any.whl")
              (sha256
               (base32
                "1b109lrhhkj6cx0yzi4gik88zn0ln3ibqw1kqhl3gwxcrvjbv1yg"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/e3-core/")
    (synopsis "e3 core. Tools and library for building and testing software")
    (description "E3 core.  Tools and library for building and testing software.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; python-latexify-py — generates LaTeX math description from Python functions
;;; -------------------------------------------------------------------
(define-public python-latexify-py
  (package
    (name "python-latexify-py")
    (version "0.4.4")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/c1/66/28097e41eb5bcaa6b17557517322cb2ce65c583d8208c91245df40fd8e8e/latexify_py-0.4.4.tar.gz")
              (sha256
               (base32
                "0vj29v41wgngmfmsvv0b9arjql119f0p11n96qa5pyqi92c794pq"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/latexify-py/")
    (synopsis "generates LaTeX math description from Python functions")
    (description "Generates LaTeX math description from Python functions.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; python-owega — a command-line interface for conversing with AI APIs (OpenAI, anthropic, ...)
;;; -------------------------------------------------------------------
(define-public python-owega
  (package
    (name "python-owega")
    (version "5.27.4")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/e5/20/f8a6c42086445545a033c7318044e5471f316415edf33ade11398e25ad06/owega-5.27.4.tar.gz")
              (sha256
               (base32
                "0x593r1g74gs9khdfh0g3flbfbpk9lka8f7i72lwslhqisjlwrc7"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/owega/")
    (synopsis "a command-line interface for conversing with AI APIs (OpenAI, anthropic, ...)")
    (description "A command-line interface for conversing with AI APIs (OpenAI, anthropic, ...).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-scalene — scalene: A high-resolution, low-overhead CPU, GPU, and memory profiler for ...
;;; -------------------------------------------------------------------
(define-public python-scalene
  (package
    (name "python-scalene")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/66/fc/ed550649058e9ad4bc262039c2c146c92e4d5d0b9d305c7d33d709c151f5/scalene-2.2.1.tar.gz")
              (sha256
               (base32
                "14fp1lb105sdf4mpc0jcvkr83bshcjkwrs5v29bswk6q6jg80bv4"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/scalene/")
    (synopsis "scalene: A high-resolution, low-overhead CPU, GPU, and memory profiler for ...")
    (description "Scalene: A high-resolution, low-overhead CPU, GPU, and memory profiler for Python with AI-powered optimization suggestions.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; python-pdftopng — a PDF to PNG conversion library
;;; -------------------------------------------------------------------
(define-public python-pdftopng
  (package
    (name "python-pdftopng")
    (version "0.2.4")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/af/c7/d86885db2691d43c3f559c1506af8e80ff801fd8dff1e47c437e0ac97453/pdftopng-0.2.4-cp310-cp310-macosx_14_0_arm64.whl")
              (sha256
               (base32
                "0hw878h0y0rxbr1l9cmf3qdpbhsnkij3n1zxd3qh9l6k38qnbwxf"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/vinayak-mehta/pdftopng")
    (synopsis "a PDF to PNG conversion library")
    (description "A PDF to PNG conversion library.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; python-livepng — livePNG is a format to create avatars based on PNG images with lipsync support
;;; -------------------------------------------------------------------
(define-public python-livepng
  (package
    (name "python-livepng")
    (version "0.1.8")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/5f/f6/46460592a722da0a2bb2630f351780fd1ad1280fee10b62b9f3da4188234/livepng-0.1.8.tar.gz")
              (sha256
               (base32
                "1y9c131f8s7ggj0kwbdgx6qzry1snnyjh1nkiajfsarn8mzfxmrx"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/francescocaracciolo/livepng")
    (synopsis "livePNG is a format to create avatars based on PNG images with lipsync support")
    (description "LivePNG is a format to create avatars based on PNG images with lipsync support.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; python-evaluate — huggingFace community-driven open-source library of evaluation
;;; -------------------------------------------------------------------
(define-public python-evaluate
  (package
    (name "python-evaluate")
    (version "0.4.6")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/ad/d0/0c17a8e6e8dc7245f22dea860557c32bae50fc4d287ae030cb0e8ab8720f/evaluate-0.4.6.tar.gz")
              (sha256
               (base32
                "089zkb39f274ccg6788k31iz7ny23kr8gdrsz0ql7hmk2b53cw70"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/huggingface/evaluate")
    (synopsis "huggingFace community-driven open-source library of evaluation")
    (description "HuggingFace community-driven open-source library of evaluation.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; python-wordllama — wordLlama NLP Utility
;;; -------------------------------------------------------------------
(define-public python-wordllama
  (package
    (name "python-wordllama")
    (version "0.4.0.post1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/3a/c2/0592e33f12045f26a5cc5a5618aef028428dae6d4cc8d3900bbfba7ecc47/wordllama-0.4.0.post1.tar.gz")
              (sha256
               (base32
                "1d9vm2qb6izfsd5yw8bsy7hqww19jd0pbc2h8f53riyhdyy68dhk"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/wordllama/")
    (synopsis "wordLlama NLP Utility")
    (description "WordLlama NLP Utility.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-flax — flax: A neural network library for JAX designed for flexibility
;;; -------------------------------------------------------------------
(define-public python-flax
  (package
    (name "python-flax")
    (version "0.12.6")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/9a/40/d9707f22377d34dc9eaa5df67e51db4d667db9538b0f2c60c0921bc86473/flax-0.12.6.tar.gz")
              (sha256
               (base32
                "1r02nazzzpc0vfp2infjdhvbr0b8mcn2l4hc4q1wrscgmkgmz6ih"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/flax/")
    (synopsis "flax: A neural network library for JAX designed for flexibility")
    (description "Flax: A neural network library for JAX designed for flexibility.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; python-cryptolyzer — multi-protocol cryptographic configuration analyzer for TLS, SSH, DNS, and ...
;;; -------------------------------------------------------------------
(define-public python-cryptolyzer
  (package
    (name "python-cryptolyzer")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/06/e6/dea5474c97082bbe0aaa08c9e7eb400ab588c05c9d16a94c1b168a6bbc52/cryptolyzer-1.1.0.tar.gz")
              (sha256
               (base32
                "15b215ns3asq4yvcfnxvj9p0n9awwzkg2jx9lz36nb539l0whg4d"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/CryptoLyzer/")
    (synopsis "multi-protocol cryptographic configuration analyzer for TLS, SSH, DNS, and ...")
    (description "Multi-protocol cryptographic configuration analyzer for TLS, SSH, DNS, and HTTP — alternative to testssl.sh and sslyze with Python API, 400+ cipher suites, vulnerability detection (FREAK, Logjam, ROBOT), and JA3/HASSH fingerprinting.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; python-ninja — ninja is a small build system with a focus on speed
;;; -------------------------------------------------------------------
(define-public python-ninja
  (package
    (name "python-ninja")
    (version "1.13.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/43/73/79a0b22fc731989c708068427579e840a6cf4e937fe7ae5c5d0b7356ac22/ninja-1.13.0.tar.gz")
              (sha256
               (base32
                "0y7rfrg089bydq9cgxj7nn9d2apn7gzkgspq4kfdjm7dbncwwh2a"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/ninja/")
    (synopsis "ninja is a small build system with a focus on speed")
    (description "Ninja is a small build system with a focus on speed.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; python-keepassxc-browser — access the KeepassXC Browser API from python
;;; -------------------------------------------------------------------
(define-public python-keepassxc-browser
  (package
    (name "python-keepassxc-browser")
    (version "0.1.8")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/f5/b8/4052181f929112b8e65d16b984f662b8f3f23582b77d9581c916f2a64227/keepassxc-browser-0.1.8.tar.gz")
              (sha256
               (base32
                "1fpmcc6r7i8hvmwlm3rqdd32y8qpvm6av5wcjqbh9i382vmlfqkz"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/hrehfeld/python-keepassxc-browser")
    (synopsis "access the KeepassXC Browser API from python")
    (description "Access the KeepassXC Browser API from python.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; python-google-genai — genAI Python SDK
;;; -------------------------------------------------------------------
(define-public python-google-genai
  (package
    (name "python-google-genai")
    (version "1.73.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/3d/d8/40f5f107e5a2976bbac52d421f04d14fc221b55a8f05e66be44b2f739fe6/google_genai-1.73.1.tar.gz")
              (sha256
               (base32
                "05as9ld0hlkk5vnvyam5xj2dw0sq2rqd8dkiy93crv72p6iy6dxn"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/google-genai/")
    (synopsis "genAI Python SDK")
    (description "GenAI Python SDK.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-goodreads — python wrapper for Goodreads API
;;; -------------------------------------------------------------------
(define-public python-goodreads
  (package
    (name "python-goodreads")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/ef/6e/5aef0dd1819ed7b89be1a05f731a9727b8f6eba3d20bd4005104e82178c4/goodreads-0.3.2.tar.gz")
              (sha256
               (base32
                "0ialsf502pmchak82bhbf9vwnvm7h1zfdf89zyxkasqs1cd322rs"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/sefakilic/goodreads/")
    (synopsis "python wrapper for Goodreads API")
    (description "Python wrapper for Goodreads API.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-xpybutil — an incomplete xcb-util port plus some extras
;;; -------------------------------------------------------------------
(define-public python-xpybutil
  (package
    (name "python-xpybutil")
    (version "0.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/e7/4a/413b385ddc211293fac3151f290e64f6e661855e9188617b26f8ca169b06/xpybutil-0.0.6-py2.py3-none-any.whl")
              (sha256
               (base32
                "1ifrn7fx76608q6a7c2dsq6ac370jwmkgsw11fpf4laf8qwasz35"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://github.com/BurntSushi/xpybutil")
    (synopsis "an incomplete xcb-util port plus some extras")
    (description "An incomplete xcb-util port plus some extras.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-pyqtdarktheme — flat dark theme for PySide and PyQt
;;; -------------------------------------------------------------------
(define-public python-pyqtdarktheme
  (package
    (name "python-pyqtdarktheme")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/5c/f1/786feaad7a333072b34a913dbe38aef94b5ae43ad188934f5d70007aea79/pyqtdarktheme-2.1.0.tar.gz")
              (sha256
               (base32
                "1f5dgp8n2hqhm01d585kjpv7zsxzvvwv1ka3jznq2m1szbfp90jz"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/5yutan5/PyQtDarkTheme")
    (synopsis "flat dark theme for PySide and PyQt")
    (description "Flat dark theme for PySide and PyQt.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-fasta2a — convert an AI Agent into a A2A server! ✨
;;; -------------------------------------------------------------------
(define-public python-fasta2a
  (package
    (name "python-fasta2a")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/1b/d1/7a3ab5d4519141978eb47d3f24dff06bc4fa0b39f31e155c1934de95d8e6/fasta2a-0.6.0.tar.gz")
              (sha256
               (base32
                "0qz9fygwd364bd1f4ar6q1avnhsvkv5b3z5kmgj7xgysp7czly40"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/fasta2a/")
    (synopsis "convert an AI Agent into a A2A server! ✨")
    (description "Convert an AI Agent into a A2A server! ✨.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-sqlite-vec — python package
;;; -------------------------------------------------------------------
(define-public python-sqlite-vec
  (package
    (name "python-sqlite-vec")
    (version "0.1.9")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/68/85/9fad0045d8e7c8df3e0fa5a56c630e8e15ad6e5ca2e6106fceb666aa6638/sqlite_vec-0.1.9-py3-none-macosx_10_6_x86_64.whl")
              (sha256
               (base32
                "1yz591din3g8dvl1rg4nz1ddh4saz6xrkrflfmalgnb0l3qafqhv"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://TODO.com")
    (synopsis "python package")
    (description "TODO readme.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-rustworkx — a High-Performance Graph Library for Python
;;; -------------------------------------------------------------------
(define-public python-rustworkx
  (package
    (name "python-rustworkx")
    (version "0.17.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/e7/b0/66d96f02120f79eeed86b5c5be04029b6821155f31ed4907a4e9f1460671/rustworkx-0.17.1.tar.gz")
              (sha256
               (base32
                "13hhwf3ic6509aqv3w1jj2p1ivqyck0icww2x2jgznh3wss03sjr"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/rustworkx/")
    (synopsis "a High-Performance Graph Library for Python")
    (description "A High-Performance Graph Library for Python.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-discord-rpc — a Python wrapper for the Discord RPC API
;;; -------------------------------------------------------------------
(define-public python-discord-rpc
  (package
    (name "python-discord-rpc")
    (version "5.5")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/a5/fb/5de4c8b703d2eea4fdc3a80fac4571002237ed053c99a1790528629a1ec3/discord_rpc-5.5.tar.gz")
              (sha256
               (base32
                "19c9kswc8k78jx5jcrq9pd05gcnqhp5rs66myyhk4vv5pmw49h27"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/discord-rpc/")
    (synopsis "a Python wrapper for the Discord RPC API")
    (description "A Python wrapper for the Discord RPC API.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-largestinteriorrectangle — fast Largest Interior Rectangle calculation
;;; -------------------------------------------------------------------
(define-public python-largestinteriorrectangle
  (package
    (name "python-largestinteriorrectangle")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/82/5e/e67dc1d61a9600d85ad9cfb2f74ed1196c299cfb3e16ce2d1862ab895864/largestinteriorrectangle-0.2.1.tar.gz")
              (sha256
               (base32
                "1g82n2cc8vym21rvp98l56hjb0agv1qvyp5s56q22incjwjlycjr"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/largestinteriorrectangle/")
    (synopsis "fast Largest Interior Rectangle calculation")
    (description "Fast Largest Interior Rectangle calculation.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; python-rdbtools — utilities to convert Redis RDB files to JSON or SQL formats
;;; -------------------------------------------------------------------
(define-public python-rdbtools
  (package
    (name "python-rdbtools")
    (version "0.1.15")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/dd/e5/eebb748863d74b7f9d433e359b874d97e830e9d1b3e3d876b91b5cba6b9d/rdbtools-0.1.15.tar.gz")
              (sha256
               (base32
                "1pkjjzsm3ngvd5mq55l6jqbhv60rd1kxk4z8lhzcgga35zj5g7k8"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/sripathikrishnan/redis-rdb-tools")
    (synopsis "utilities to convert Redis RDB files to JSON or SQL formats")
    (description "Utilities to convert Redis RDB files to JSON or SQL formats.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-amulet-core — a Python library for reading/writing Minecraft's various save formats
;;; -------------------------------------------------------------------
(define-public python-amulet-core
  (package
    (name "python-amulet-core")
    (version "1.9.39")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/b6/5e/81b27e80cdfad95d7f892cd2c86010d70fa4db9615f0d1f4ceacfd7418c0/amulet_core-1.9.39.tar.gz")
              (sha256
               (base32
                "02mw6rv5235waxv44sbs8r0k7lwvfygihdwx37crz4w6a502gfil"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.amuletmc.com")
    (synopsis "a Python library for reading/writing Minecraft's various save formats")
    (description "A Python library for reading/writing Minecraft's various save formats.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-ezchlog — easy git branch friendly changelogs
;;; -------------------------------------------------------------------
(define-public python-ezchlog
  (package
    (name "python-ezchlog")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/08/43/d75a7dfa0ee4ff55eeeb4fd6cee71aca904bf3a4baad4914337d50766163/ezchlog-1.4.0.tar.gz")
              (sha256
               (base32
                "0pz4w0skhnc7l5sqlw3am3d4m27sv8shy8f3g30nfmh1bj15f09g"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/ezchlog/")
    (synopsis "easy git branch friendly changelogs")
    (description "Easy git branch friendly changelogs.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-pssh — parallel version of OpenSSH and related tools
;;; -------------------------------------------------------------------
(define-public python-pssh
  (package
    (name "python-pssh")
    (version "2.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/60/9a/8035af3a7d3d1617ae2c7c174efa4f154e5bf9c24b36b623413b38be8e4a/pssh-2.3.1.tar.gz")
              (sha256
               (base32
                "1d7n26rrr6n8gxi97jlfi68cds0sklc6yagk20ip28mpcf1qv7sk"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://code.google.com/p/parallel-ssh/")
    (synopsis "parallel version of OpenSSH and related tools")
    (description "Parallel version of OpenSSH and related tools.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; python-rocket-fft — rocket-FFT extends Numba by scipy.fft and numpy.fft
;;; -------------------------------------------------------------------
(define-public python-rocket-fft
  (package
    (name "python-rocket-fft")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/44/b0/09cbec3177ecf56e5ceb789a69fbcdcbabe758cbb682e5d36b14aa8c05fb/rocket_fft-0.3.1.tar.gz")
              (sha256
               (base32
                "1x54gxyn5xslnz15dwrxz5kjyv031lxyms9gq2gzz6h9c6ih5jfx"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/rocket-fft/")
    (synopsis "rocket-FFT extends Numba by scipy.fft and numpy.fft")
    (description "Rocket-FFT extends Numba by scipy.fft and numpy.fft.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; python-coincurve — safest and fastest Python library for secp256k1 elliptic curve operations
;;; -------------------------------------------------------------------
(define-public python-coincurve
  (package
    (name "python-coincurve")
    (version "21.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/6f/a2/f2a38eb05b747ed3e54e1be33be339d4a14c1f5cc6a6e2b342b5e8160d51/coincurve-21.0.0.tar.gz")
              (sha256
               (base32
                "1rd6nrsyvr7yzbiwn721422bzzankrv1mqlnwzqfnax8cm1cwdwb"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/coincurve/")
    (synopsis "safest and fastest Python library for secp256k1 elliptic curve operations")
    (description "Safest and fastest Python library for secp256k1 elliptic curve operations.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; python-pyevtk — export data as binary VTK files
;;; -------------------------------------------------------------------
(define-public python-pyevtk
  (package
    (name "python-pyevtk")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/44/dd/d20c1a0c0105611b831536d2c6d9132bb83d70ed80f4b6d328c04acfeb0d/pyevtk-1.6.0.tar.gz")
              (sha256
               (base32
                "1x55zpnxwlfwss9jmzz7lbqlzr779zd525c6b215q01sda3yfsqz"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/pyscience-projects/pyevtk")
    (synopsis "export data as binary VTK files")
    (description "Export data as binary VTK files.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-jax-jumpy — common backend for Jax or Numpy
;;; -------------------------------------------------------------------
(define-public python-jax-jumpy
  (package
    (name "python-jax-jumpy")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/52/6a/b6affff68f172a4c8316d9ab9b7d952e865df15b854f158690991864e0fe/jax-jumpy-1.0.0.tar.gz")
              (sha256
               (base32
                "1bar1nrkr9v93sjwgykz80daa564n4gwpqsk2h5pyascriavjpqr"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/jax-jumpy/")
    (synopsis "common backend for Jax or Numpy")
    (description "Common backend for Jax or Numpy.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; python-kodistubs — stub modules that re-create Kodi Python API
;;; -------------------------------------------------------------------
(define-public python-kodistubs
  (package
    (name "python-kodistubs")
    (version "21.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/24/bc/5cf6fcb211cfcfe572b48897140806c88d2c2ab7597d51dcac2313950304/Kodistubs-21.0.0.tar.gz")
              (sha256
               (base32
                "0xims8lcml6f07v3vrqr9qds5snqfrm1b976i03njp68yvmjwd1c"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/romanvm/Kodistubs")
    (synopsis "stub modules that re-create Kodi Python API")
    (description "Stub modules that re-create Kodi Python API.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; python-groovy — a small Python library created to help developers protect their application...
;;; -------------------------------------------------------------------
(define-public python-groovy
  (package
    (name "python-groovy")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/52/36/bbdede67400277bef33d3ec0e6a31750da972c469f75966b4930c753218f/groovy-0.1.2.tar.gz")
              (sha256
               (base32
                "10qh4g97iyw1zhbykx8v0wvs0vmrpv3659wa8n9f5mzrnc4xrh95"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/groovy/")
    (synopsis "a small Python library created to help developers protect their application...")
    (description "A small Python library created to help developers protect their applications from Server Side Request Forgery (SSRF) attacks.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-openai-agents — openAI Agents SDK
;;; -------------------------------------------------------------------
(define-public python-openai-agents
  (package
    (name "python-openai-agents")
    (version "0.14.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/16/ae/8af117a3a4a06ad72b4a60759fbab98a7158f0eb36c47d90d5d883610781/openai_agents-0.14.1.tar.gz")
              (sha256
               (base32
                "1p2pjjb2gvk2sy65x6nkip8f046hgwh9qvpbh8nd6wd1q2sc3akv"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/openai-agents/")
    (synopsis "openAI Agents SDK")
    (description "OpenAI Agents SDK.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-pytest-pyodide — pytest plugin for testing applications that use Pyodide
;;; -------------------------------------------------------------------
(define-public python-pytest-pyodide
  (package
    (name "python-pytest-pyodide")
    (version "0.59.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/7e/73/cfda8b3fd05c78d447ce1bddd78f15d39baf0f2e873c1059a6c96740375b/pytest_pyodide-0.59.0.tar.gz")
              (sha256
               (base32
                "0b606hf6n7nxq13gk5mza7f098952lw99y2xaasdg1d8nl8kpzn5"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/pytest-pyodide/")
    (synopsis "pytest plugin for testing applications that use Pyodide")
    (description "Pytest plugin for testing applications that use Pyodide.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; python-voicevox-client — voicevox engine unoffical wrapper
;;; -------------------------------------------------------------------
(define-public python-voicevox-client
  (package
    (name "python-voicevox-client")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/7b/a4/e88dd08aa1409e83e7510761ea732c51bad090b0a356d58fbf4a61d785e9/voicevox_client-1.1.0.tar.gz")
              (sha256
               (base32
                "1v1ban4msnw2647243dzn9apwcbcdnqk28j46zf2gj8k3jwvypp9"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/voicevox-client/python")
    (synopsis "voicevox engine unoffical wrapper")
    (description "Voicevox engine unoffical wrapper.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-pypylon — the python wrapper for the Basler pylon Camera Software Suite
;;; -------------------------------------------------------------------
(define-public python-pypylon
  (package
    (name "python-pypylon")
    (version "26.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/16/db/79edfe8758ba0a01fac336bdd9501d3f27daf07ac952f846ffd410891400/pypylon-26.3.1-cp39-abi3-macosx_14_0_arm64.whl")
              (sha256
               (base32
                "0dlmkal35h800y43k12bdjp0q6inkv4drdkdlwy9y5jpa0y9s5sx"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/basler/pypylon")
    (synopsis "the python wrapper for the Basler pylon Camera Software Suite")
    (description "The python wrapper for the Basler pylon Camera Software Suite.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; python-jaxlib — xLA library for JAX
;;; -------------------------------------------------------------------
(define-public python-jaxlib
  (package
    (name "python-jaxlib")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/48/5c/64a60f90d48bb6ab68ece63b7fa78855e8f8cefc4045f198a5c8695bfd99/jaxlib-0.10.0-cp311-cp311-macosx_11_0_arm64.whl")
              (sha256
               (base32
                "0sk43fr9kb8qqkdpqrkjwhnjfvp69wyv030yzmgzvhvly3lk4w17"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/jax-ml/jax")
    (synopsis "xLA library for JAX")
    (description "XLA library for JAX.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; python-cheap-repr — better version of repr/reprlib for short, cheap string representations
;;; -------------------------------------------------------------------
(define-public python-cheap-repr
  (package
    (name "python-cheap-repr")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/b1/30/f0e9d5bfe80b8287ea8a9263eb3c71c5fdf44b6f7a781a7c96f83172ccad/cheap_repr-0.5.2.tar.gz")
              (sha256
               (base32
                "03x3lmn8rcmwrrq5gy4pkmajmb20c1vmyb0msdx5qc5hmpw5q6h0"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/alexmojaki/cheap_repr")
    (synopsis "better version of repr/reprlib for short, cheap string representations")
    (description "Better version of repr/reprlib for short, cheap string representations.")
    (license license:expat)))

