;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417v
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; Recipes (25):
;;;    1. fcitx5-pinyin-genshin (copy, v20240803, CC-BY-SA-4.0)
;;;    2. fcitx5-pinyin-starrail (copy, v20240803, CC-BY-SA-4.0)
;;;    3. fcitx5-pinyin-honkai3rd (copy, v20240803, CC-BY-SA-4.0)
;;;    4. fcitx5-pinyin-starrail-rime (copy, v20240803, CC-BY-SA-4.0)
;;;    5. fcitx5-pinyin-honkai3rd-rime (copy, v20240803, CC-BY-SA-4.0)
;;;    6. engauge-samples (copy, v12.9.1, GPL-2.0)
;;;    7. ubuntu-themes (gnu, v24.04, GPL-3.0/CC-BY-SA-3.0)
;;;    8. zinkrun (trivial, v1.1, GPL-3.0+)
;;;    9. papirus-folders (gnu, v1.14.0, MIT)
;;;   10. gnome-shell-extension-no-annoyance (copy, r73.8ca0647, GPL-2.0)
;;;   11. python-editdistance (pyproject, v0.8.1, MIT)
;;;   12. python-xsdata (pyproject, v26.2, MIT)
;;;   13. python-gerbonara (pyproject, v1.6.2, Apache-2.0)
;;;   14. sdkmanager (pyproject, v0.6.11, AGPL-3.0)
;;;   15. tfupdate-bin (copy/binary, v0.9.3, MIT)
;;;   16. podliner-bin (copy/binary, v1.2.1, GPL-3.0)
;;;   17. gittype-bin (copy/binary, v0.9.0, MIT)
;;;   18. gitlogue-bin (copy/binary, v0.8.0, ISC)
;;;   19. sgdboop (gnu, v1.3.2, Zlib)
;;;   20. mew (gnu, v1.0, MIT)
;;;   21. mintstick (copy, v1.6.3, GPL-2.0)
;;;   22. mintlocale (copy, v1.4.7, GPL-2.0)
;;;   23. rabbitvcs (python, v0.19, GPL-2.0)
;;;   24. pyspread (python, v2.4.4, GPL-3.0+)
;;;   25. klatexformula (cmake, v4.1.0, GPL-2.0+)
;;;
;;; Blocked (5):
;;;   26. python-pyvis — BLOCKED: LARGE_SOURCE (PyPI sdist unavailable, GitHub 100MB)
;;;   27. gestures — BLOCKED: DEP_MISSING (libinput-gestures not in Guix)
;;;   28. terminal-rain-lightning — BLOCKED: SOURCE_UNAVAILABLE (GitHub repo inaccessible)
;;;   29. opl-synth — BLOCKED: COMPLEX_BUILD (JUCE framework, no tagged releases)
;;;   30. fake-background-webcam-git — BLOCKED: DEP_CHAIN_TOO_DEEP (mediapipe/TensorFlow)
;;;
;;; 25 recipes + 5 BLOCKED = 30 total.
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417v)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages wayland)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:export (
            fcitx5-pinyin-genshin
            fcitx5-pinyin-starrail
            fcitx5-pinyin-honkai3rd
            fcitx5-pinyin-starrail-rime
            fcitx5-pinyin-honkai3rd-rime
            engauge-samples
            ubuntu-themes
            zinkrun
            papirus-folders
            gnome-shell-extension-no-annoyance
            python-editdistance
            python-xsdata
            python-gerbonara
            sdkmanager
            tfupdate-bin
            podliner-bin
            gittype-bin
            gitlogue-bin
            sgdboop
            mew
            mintstick
            mintlocale
            rabbitvcs
            pyspread
            klatexformula
            ))

;;; -------------------------------------------------------------------
;;; 1. fcitx5-pinyin-genshin — Genshin Impact Pinyin dictionary
;;; -------------------------------------------------------------------
(define-public fcitx5-pinyin-genshin
  (package
    (name "fcitx5-pinyin-genshin")
    (version "20240803")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sihuan/mw2fcitx/releases/download/"
                    version "/genshin.dict"))
              (sha256
               (base32
                "1gbjws5vlxpn2zl006q3m2ifm18hp2dahgls76i6wg312251r08n"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("genshin.dict"
                "share/fcitx5/pinyin/dictionaries/genshin.dict"))))
    (synopsis "genshin Impact Pinyin dictionary for fcitx5")
    (description "Fcitx5-pinyin-genshin provides a Pinyin dictionary for
the fcitx5 input method framework, containing terms from Genshin Impact.
The dictionary is generated from wiki.biligame.com game data.")
    (home-page "https://github.com/sihuan/mw2fcitx")
    (license license:cc-by-sa4.0)))

;;; -------------------------------------------------------------------
;;; 2. fcitx5-pinyin-starrail — Star Rail Pinyin dictionary
;;; -------------------------------------------------------------------
(define-public fcitx5-pinyin-starrail
  (package
    (name "fcitx5-pinyin-starrail")
    (version "20240803")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sihuan/mw2fcitx/releases/download/"
                    version "/starrail.dict"))
              (sha256
               (base32
                "0ln627cg51b1q9nbsvm3j9kc7wriw1n0kkkbfkkdq3vbva1x2aqh"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("starrail.dict"
                "share/fcitx5/pinyin/dictionaries/starrail.dict"))))
    (synopsis "honkai: Star Rail Pinyin dictionary for fcitx5")
    (description "Fcitx5-pinyin-starrail provides a Pinyin dictionary for
the fcitx5 input method framework, containing terms from Honkai: Star
Rail.  The dictionary is generated from wiki.biligame.com game data.")
    (home-page "https://github.com/sihuan/mw2fcitx")
    (license license:cc-by-sa4.0)))

;;; -------------------------------------------------------------------
;;; 3. fcitx5-pinyin-honkai3rd — Honkai Impact 3rd Pinyin dictionary
;;; -------------------------------------------------------------------
(define-public fcitx5-pinyin-honkai3rd
  (package
    (name "fcitx5-pinyin-honkai3rd")
    (version "20240803")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sihuan/mw2fcitx/releases/download/"
                    version "/honkai3rd.dict"))
              (sha256
               (base32
                "03h956i045gixi97cpk1z3r75knm4ppqjch1p7p2fnh22z1fw5cr"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("honkai3rd.dict"
                "share/fcitx5/pinyin/dictionaries/honkai3rd.dict"))))
    (synopsis "honkai Impact 3rd Pinyin dictionary for fcitx5")
    (description "Fcitx5-pinyin-honkai3rd provides a Pinyin dictionary for
the fcitx5 input method framework, containing terms from Honkai Impact
3rd.  The dictionary is generated from wiki.biligame.com game data.")
    (home-page "https://github.com/sihuan/mw2fcitx")
    (license license:cc-by-sa4.0)))

;;; -------------------------------------------------------------------
;;; 4. fcitx5-pinyin-starrail-rime — Star Rail Rime dictionary
;;; -------------------------------------------------------------------
(define-public fcitx5-pinyin-starrail-rime
  (package
    (name "fcitx5-pinyin-starrail-rime")
    (version "20240803")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sihuan/mw2fcitx/releases/download/"
                    version "/starrail.dict.yaml"))
              (sha256
               (base32
                "1rryd7m9f1qnmpsynvrynyi95046rm4cls0vin6rdg9fp51sjynp"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("starrail.dict.yaml"
                "share/rime-data/starrail.dict.yaml"))))
    (synopsis "honkai: Star Rail Rime dictionary for fcitx5")
    (description "Fcitx5-pinyin-starrail-rime provides a Rime dictionary
in YAML format for the Rime input method framework, containing terms
from Honkai: Star Rail.  Generated from wiki.biligame.com game data.")
    (home-page "https://github.com/sihuan/mw2fcitx")
    (license license:cc-by-sa4.0)))

;;; -------------------------------------------------------------------
;;; 5. fcitx5-pinyin-honkai3rd-rime — Honkai 3rd Rime dictionary
;;; -------------------------------------------------------------------
(define-public fcitx5-pinyin-honkai3rd-rime
  (package
    (name "fcitx5-pinyin-honkai3rd-rime")
    (version "20240803")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sihuan/mw2fcitx/releases/download/"
                    version "/honkai3rd.dict.yaml"))
              (sha256
               (base32
                "1ikcqw5f1bdd6j5l6q5yfl4fgb1ndk5a58nnd4ygdfpccvndkkfw"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("honkai3rd.dict.yaml"
                "share/rime-data/honkai3rd.dict.yaml"))))
    (synopsis "honkai Impact 3rd Rime dictionary for fcitx5")
    (description "Fcitx5-pinyin-honkai3rd-rime provides a Rime dictionary
in YAML format for the Rime input method framework, containing terms
from Honkai Impact 3rd.  Generated from wiki.biligame.com game data.")
    (home-page "https://github.com/sihuan/mw2fcitx")
    (license license:cc-by-sa4.0)))

;;; -------------------------------------------------------------------
;;; 6. engauge-samples — sample images for engauge-digitizer
;;; -------------------------------------------------------------------
(define-public engauge-samples
  (package
    (name "engauge-samples")
    (version "12.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/akhuettel/engauge-digitizer"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1wv5yggjx4m6c9ml2pqxp9vaiz72n7iij32a41q0gxqa762di98d"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("samples" "share/engauge-digitizer/samples"))))
    (synopsis "sample graph images for engauge-digitizer")
    (description "Engauge-samples provides a collection of sample graph
images for testing and demonstrating the engauge-digitizer data point
extraction tool.  Includes PNG, JPG, BMP, GIF, and other image formats.")
    (home-page "https://github.com/akhuettel/engauge-digitizer")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 7. ubuntu-themes — Ubuntu Ambiance and Radiance GTK themes
;;; -------------------------------------------------------------------
(define-public ubuntu-themes
  (package
    (name "ubuntu-themes")
    (version "24.04")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://launchpad.net/ubuntu/+archive/primary"
                    "/+sourcefiles/ubuntu-themes/"
                    version "-0ubuntu1/ubuntu-themes_"
                    version ".orig.tar.gz"))
              (sha256
               (base32
                "068gbs601azb0gaybj5qa37b7d47a97yspkk94xfylcj6v0308zx"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "DESTDIR=" #$output)
                   "PREFIX=")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build))))
    (native-inputs (list imagemagick))
    (synopsis "ubuntu Ambiance and Radiance GTK themes and icons")
    (description "Ubuntu-themes provides the Ambiance and Radiance GTK
themes, Ubuntu monochrome icon themes (dark and light variants), and
login screen icons.  These are the default themes shipped with Ubuntu
desktop releases.")
    (home-page "https://launchpad.net/ubuntu-themes")
    (license (list license:gpl3 license:cc-by-sa3.0))))

;;; -------------------------------------------------------------------
;;; 8. zinkrun — shell wrapper for Mesa Zink/Vulkan OpenGL
;;; -------------------------------------------------------------------
(define-public zinkrun
  (package
    (name "zinkrun")
    (version "1.1")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((bin (string-append #$output "/bin")))
                 (mkdir-p bin)
                 (call-with-output-file (string-append bin "/zinkrun")
                   (lambda (port)
                     (format port "#!~a~%~a ~a ~a ~a \"$@\"~%"
                             (string-append #$bash-minimal "/bin/bash")
                             "__GLX_VENDOR_LIBRARY_NAME=mesa"
                             "MESA_LOADER_DRIVER_OVERRIDE=zink"
                             "GALLIUM_DRIVER=zink"
                             "LIBGL_KOPPER_DRI2=1")))
                 (chmod (string-append bin "/zinkrun") #o755)))))
    (inputs (list bash-minimal))
    (synopsis "run OpenGL applications using Mesa Zink Vulkan translation")
    (description "Zinkrun is a shell wrapper that sets Mesa environment
variables to run OpenGL applications using the Zink Gallium driver,
which translates OpenGL calls to Vulkan.  Useful for testing or running
applications that benefit from Vulkan-backed OpenGL rendering.")
    (home-page "https://docs.mesa3d.org/drivers/zink.html")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 9. papirus-folders — change Papirus icon theme folder colors
;;; -------------------------------------------------------------------
(define-public papirus-folders
  (package
    (name "papirus-folders")
    (version "1.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/PapirusDevelopmentTeam"
                    "/papirus-folders/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1lkdbscg9k8pzr8kvj7p322546wlx4l7vvcixy4dk2k38vdj71v5"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "DESTDIR=" #$output)
                   "PREFIX=")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build))))
    (synopsis "script to change folder colors in the Papirus icon theme")
    (description "Papirus-folders is a bash script that allows changing
the color of folders in the Papirus icon theme.  It supports multiple
color variants and can apply changes system-wide or per-user.")
    (home-page "https://github.com/PapirusDevelopmentTeam/papirus-folders")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. gnome-shell-extension-no-annoyance — remove window-is-ready alert
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-no-annoyance
  (package
    (name "gnome-shell-extension-no-annoyance")
    (version "73.8ca0647")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jirkavrba/noannoyance/archive/"
                    "8ca06477ccdcb5c02f73ccabc3ba5edaa91a7f16.tar.gz"))
              (sha256
               (base32
                "1rly1ky6hlhzy10rvcvr89l7xnh406h76yrbarhkwc6k8ql6mwck"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("extension.js"
                "share/gnome-shell/extensions/noannoyance-fork@jirkavrba/extension.js")
               ("prefs.js"
                "share/gnome-shell/extensions/noannoyance-fork@jirkavrba/prefs.js")
               ("metadata.json"
                "share/gnome-shell/extensions/noannoyance-fork@jirkavrba/metadata.json")
               ("schemas/org.gnome.shell.extensions.noannoyance-fork.gschema.xml"
                "share/glib-2.0/schemas/org.gnome.shell.extensions.noannoyance-fork.gschema.xml"))))
    (synopsis "GNOME Shell extension to auto-focus ready windows")
    (description "Gnome-shell-extension-no-annoyance removes the
annoying \"Window is ready\" notification in GNOME Shell and instead
automatically brings the window into focus.  Supports GNOME 45 and
later with ES6 module syntax.")
    (home-page "https://github.com/jirkavrba/noannoyance")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 11. python-editdistance — fast Levenshtein distance in C++
;;; -------------------------------------------------------------------
(define-public python-editdistance
  (package
    (name "python-editdistance")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "editdistance" version))
              (sha256
               (base32
                "1vcg5m6zxr4qr9lzz1k9gx2pniaswlna8sba2b4v052hbl5gikfi"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel python-cython))
    (synopsis "fast implementation of edit distance (Levenshtein distance)")
    (description "Editdistance is a Python library providing a fast
implementation of the Levenshtein distance algorithm using C++ and
Cython.  It works with any iterable of hashable objects, not just
strings, and provides O(NM) time complexity.")
    (home-page "https://github.com/roy-ht/editdistance")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. python-xsdata — XML/JSON data bindings code generator
;;; -------------------------------------------------------------------
(define-public python-xsdata
  (package
    (name "python-xsdata")
    (version "26.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "xsdata" version))
              (sha256
               (base32
                "19h9203yjclh5h1vbc5awbg0bnc9hg7qz84jrvw38mx7m9qsycf6"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;requires large test fixtures
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "python XML/JSON data bindings code generator")
    (description "Xsdata is a complete Python data binding library that
generates dataclasses with type hints from XML Schemas, DTD, WSDL
definitions, and XML/JSON documents.  Supports lxml and native XML
parsing with automatic code generation.")
    (home-page "https://github.com/tefra/xsdata")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. python-gerbonara — Gerber/Excellon PCB file library
;;; -------------------------------------------------------------------
(define-public python-gerbonara
  (package
    (name "python-gerbonara")
    (version "1.6.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "gerbonara" version))
              (sha256
               (base32
                "1m76yc8yw6q5c169jldhjnz4zq5aqpg8aj79914xlpm6bcmsjz42"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;requires test fixtures not in sdist
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-click))
    (synopsis "library for handling Gerber and Excellon PCB files")
    (description "Gerbonara provides tools to read, modify, and write
Gerber (RS-274X) and Excellon drill files used in PCB manufacturing.
It is a friendly fork of pcb-tools-extension with additional features
for the gerbolyze project.")
    (home-page "https://git.jaseg.de/gerbonara.git")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 14. sdkmanager — Python Android SDK manager replacement
;;; -------------------------------------------------------------------
(define-public sdkmanager
  (package
    (name "sdkmanager")
    (version "0.6.11")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "sdkmanager" version))
              (sha256
               (base32
                "0r3xwk8xsfxvmxyw3d57sy2i9by24g0l1jl40735jiac9mypcg7n"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;requires Android SDK
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "drop-in replacement for Android sdkmanager CLI tool")
    (description "Sdkmanager is a Python drop-in replacement for the
official Android SDK @code{sdkmanager} command-line tool.  It implements
the exact same API as the official tool and is developed as part of the
F-Droid ecosystem.")
    (home-page "https://gitlab.com/fdroid/sdkmanager")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 15. tfupdate-bin — update Terraform version constraints
;;; -------------------------------------------------------------------
(define-public tfupdate-bin
  (package
    (name "tfupdate-bin")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/minamijoyo/tfupdate/releases"
                    "/download/v" version
                    "/tfupdate_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0fpz05ygwp8b71aj4vhi80b08m12czxh6vkfzgafzqxmidj4bp6z"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tfupdate" "bin/tfupdate"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "update version constraints in Terraform configurations")
    (description "Tfupdate updates version constraints of Terraform core,
OpenTofu core, providers, and modules in configuration files.  It can
also update dependency lock files without requiring the Terraform or
OpenTofu CLI to be installed.")
    (home-page "https://github.com/minamijoyo/tfupdate")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. podliner-bin — TUI podcast player
;;; -------------------------------------------------------------------
(define-public podliner-bin
  (package
    (name "podliner-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/timkicker/podliner/releases"
                    "/download/v" version
                    "/podliner-linux-x64.tar.gz"))
              (sha256
               (base32
                "0rc4j4sjp6pvk1scpizpzh902zavgp8sx6hspnfdn429j6w3cvna"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("podliner" "bin/podliner"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI podcast player with vim-style navigation")
    (description "Podliner is a terminal-based podcast player with
vim-style keyboard navigation, offline playback support, gPodder
synchronization, and OPML import/export.  It features a clean TUI
interface for managing and playing podcast episodes.")
    (home-page "https://github.com/timkicker/podliner")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17. gittype-bin — code-typing game from source code
;;; -------------------------------------------------------------------
(define-public gittype-bin
  (package
    (name "gittype-bin")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/unhappychoice/gittype/releases"
                    "/download/v" version
                    "/gittype-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "1crjjl6kz1f2q9pxbxcavjk7ihna97vzv8bn1b2rzc44m9i9gisj"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gittype" "bin/gittype"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI code-typing game using source code files")
    (description "Gittype is a command-line typing game that turns source
code into typing challenges.  It supports 20+ programming languages via
tree-sitter parsing, tracks WPM and accuracy, and provides a ranking
system with 15+ visual themes.")
    (home-page "https://github.com/unhappychoice/gittype")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. gitlogue-bin — cinematic Git history replay
;;; -------------------------------------------------------------------
(define-public gitlogue-bin
  (package
    (name "gitlogue-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/unhappychoice/gitlogue/releases"
                    "/download/v" version
                    "/gitlogue-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0as80pyd99c9qlg28qq1lhsxhzb4xkhgk16xffdxcvv5alzc9cyg"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gitlogue" "bin/gitlogue"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cinematic Git commit history replay in the terminal")
    (description "Gitlogue is a terminal tool for replaying Git commit
history as a cinematic animation.  It renders typing effects, syntax
highlighting for 29 languages via tree-sitter, and file tree
visualizations to bring Git history to life.")
    (home-page "https://github.com/unhappychoice/gitlogue")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 19. sgdboop — apply SteamGridDB artwork to Steam library
;;; -------------------------------------------------------------------
(define-public sgdboop
  (package
    (name "sgdboop")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SteamGridDB/SGDBoop/archive"
                    "/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1aq0jb6lbfp03n4fps6ijl0nkr8gz3j0azfgm81y9g964vpnw26v"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-before 'build 'chdir-linux
                 (lambda _
                   (chdir "linux"))))))
    (inputs (list curl gtk+))
    (native-inputs (list pkg-config))
    (synopsis "apply SteamGridDB artwork to your Steam library")
    (description "SGDBoop is a tool for automatically applying custom
artwork from SteamGridDB to your Steam library.  It handles grid images,
hero images, logos, and icons for Steam games with a simple one-click
workflow.")
    (home-page "https://github.com/SteamGridDB/SGDBoop")
    (license license:zlib)))

;;; -------------------------------------------------------------------
;;; 20. mew — efficient Wayland dynamic menu (dmenu port)
;;; -------------------------------------------------------------------
(define-public mew
  (package
    (name "mew")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/sewn/mew/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "02y7hc2rddwxnkqws316j6j5z9dv5jxji0zd4wipjpvc5jwjyi81"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list libxkbcommon wayland wayland-protocols))
    (native-inputs (list pkg-config))
    (synopsis "efficient dynamic menu for Wayland compositors")
    (description "Mew is an efficient dynamic menu for Wayland, serving
as a 99% compatible port of dmenu to the Wayland display protocol.  It
provides fast keyboard-driven application launching and selection with
minimal resource usage.")
    (home-page "https://codeberg.org/sewn/mew")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. mintstick — USB stick formatter and bootable USB creator
;;; -------------------------------------------------------------------
(define-public mintstick
  (package
    (name "mintstick")
    (version "1.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmint/mintstick/archive"
                    "/refs/tags/master.lmde6.tar.gz"))
              (sha256
               (base32
                "0lqq20ddr63p6rx9jbkf6n7m07kqd778k0wawm04v7z7l8j5nmwy"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lib" "lib/mintstick")
               ("share" "share/")
               ("bin/mintstick" "bin/mintstick"))))
    (inputs (list python))
    (synopsis "GUI to format USB sticks and write ISO images")
    (description "Mintstick is a graphical tool for formatting USB drives
and writing ISO or IMG files to USB sticks to create bootable media.
It provides a simple GTK interface for common USB stick operations
used in Linux Mint.")
    (home-page "https://github.com/linuxmint/mintstick")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 22. mintlocale — language and locale selection tool
;;; -------------------------------------------------------------------
(define-public mintlocale
  (package
    (name "mintlocale")
    (version "1.4.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmint/mintlocale/archive"
                    "/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "17kd8ybrrwvf7jf6vsjwa9q24kwrf6wwywlfnhn73alip3gf0ra4"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib" "lib/")
               ("usr/share" "share/"))))
    (inputs (list python))
    (synopsis "language and locale selection tool from Linux Mint")
    (description "Mintlocale is a graphical tool for selecting system
language and locale settings.  Originally developed for Linux Mint, it
provides a simple GTK interface for managing installed languages and
input method configuration.")
    (home-page "https://github.com/linuxmint/mintlocale")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 23. rabbitvcs — graphical version control system tools
;;; -------------------------------------------------------------------
(define-public rabbitvcs
  (package
    (name "rabbitvcs")
    (version "0.19")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rabbitvcs/rabbitvcs/archive"
                    "/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0x1yj2zrvpg0drhs1ddw1ia0kj87clls4fq8rzlymx4m3vxsmpl3"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))  ;no test suite configured
    (inputs (list gtk+ python-pygobject python-dulwich git))
    (synopsis "graphical tools for version control with SVN and Git")
    (description "RabbitVCS provides a set of graphical tools for simple
and straightforward access to version control systems including
Subversion and Git.  It integrates with file managers like Nautilus,
Thunar, Nemo, and Caja for contextual VCS operations.")
    (home-page "https://github.com/rabbitvcs/rabbitvcs")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 24. pyspread — Python-based spreadsheet application
;;; -------------------------------------------------------------------
(define-public pyspread
  (package
    (name "pyspread")
    (version "2.4.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyspread" version))
              (sha256
               (base32
                "1nbi4x1imv9rgaqd15nr1jl7rda3cyc92lzq04l6jf2nh50qzpk0"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))  ;requires display and PyQt5 runtime
    (propagated-inputs (list python-numpy python-pyqt))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "non-traditional Python-based spreadsheet application")
    (description "Pyspread is a spreadsheet application where each cell
contains a Python expression rather than a simple value.  This allows
using Python's full power for data processing, including access to
libraries like numpy and matplotlib directly from cells.")
    (home-page "https://pyspread.gitlab.io/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 25. klatexformula — GUI for LaTeX equation image generation
;;; -------------------------------------------------------------------
(define-public klatexformula
  (package
    (name "klatexformula")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/klatexformula/klatexformula"
                    "/archive/refs/tags/KLF_4-1-0.tar.gz"))
              (sha256
               (base32
                "0dx5d9r5rdjarrbiha45nlshmm6y6bxazbnayaa0mzqd7yla37h2"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;no test suite
    (inputs (list qtbase-5 qtsvg-5))
    (native-inputs (list pkg-config))
    (synopsis "GUI application for generating images from LaTeX equations")
    (description "KLatexFormula is a graphical application for quickly
generating images from LaTeX math formulas.  It supports drag-and-drop,
clipboard integration, font and color customization, and can export to
PNG, SVG, EPS, and PDF formats.")
    (home-page "https://klatexformula.sourceforge.io/")
    (license license:gpl2+)))
