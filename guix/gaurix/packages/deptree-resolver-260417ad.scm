;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260417ad
;;; Resolves BLOCKED packages with verified GitHub/upstream releases.
;;;
;;; Recipes (12):
;;;   1. amass (binary-tarball, v5.1.1)
;;;   2. openutau-bin (binary-zip, v0.1.565)
;;;   3. tela-icon-theme-bin (git-source, v2025-02-10)
;;;   4. shopify-themekit-bin (binary-zip, v1.3.3)
;;;   5. restfox-bin (binary-deb, v0.40.0)
;;;   6. enlightenment-eminence-theme-bin (binary-release, v0.1.13)
;;;   7. termusic-git (binary-tarball, v0.12.1)
;;;   8. gitfetch-bin (binary-single, v2.0.0)
;;;   9. basedpyright-bin (pypi-wheel, v1.39.2)
;;;   10. pyrefly-bin (pypi-sdist, v0.61.0)
;;;   11. spacecadetpinball-bin (cmake-source, v2.1.0)
;;;   12. ftop-bin (go-source, v0.0.15)
;;;
;;; 12 recipes written. 42 remain BLOCKED.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260417ad)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages node)
  #:use-module (gnu packages sdl)
  #:export (
            amass
            openutau-bin
            tela-icon-theme-bin
            shopify-themekit-bin
            restfox-bin
            enlightenment-eminence-theme-bin
            termusic-git
            gitfetch-bin
            basedpyright-bin
            pyrefly-bin
            spacecadetpinball-bin
            ftop-bin
))

;;; amass — OWASP Amass network mapping tool (pre-built binary)
(define-public amass
  (package
    (name "amass")
    (version "5.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/owasp-amass/amass/releases/download/v"
                    version "/amass_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("amass" "bin/amass"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "in-depth attack surface mapping and asset discovery")
    (description "OWASP Amass performs network mapping of attack surfaces and
external asset discovery using open source information gathering and active
reconnaissance techniques.")
    (home-page "https://github.com/owasp-amass/amass")
    (license license:asl2.0)))

;;; openutau-bin — open source singing synthesis platform (pre-built binary)
(define-public openutau-bin
  (package
    (name "openutau-bin")
    (version "0.1.565")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/stakira/OpenUtau/releases/download/"
                    version "/OpenUtau-linux-x64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/openutau/"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "open source singing synthesis platform")
    (description "OpenUtau is an open source singing synthesis platform.  It
supports UTAU voicebanks and various synthesis engines for vocal synthesis.")
    (home-page "https://github.com/stakira/OpenUtau")
    (license license:expat)))

;;; tela-icon-theme-bin — flat colorful design icon theme
(define-public tela-icon-theme-bin
  (package
    (name "tela-icon-theme-bin")
    (version "2025-02-10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/Tela-icon-theme")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((dest (string-append (assoc-ref outputs "out")
                                              "/share/icons")))
                     (invoke "bash" "install.sh" "-d" dest)))))))
    (native-inputs (list bash-minimal))
    (synopsis "flat colorful design icon theme")
    (description "Tela is a flat colorful design icon theme for Linux desktops.
It provides icons in multiple color variants.")
    (home-page "https://github.com/vinceliuice/Tela-icon-theme")
    (license license:gpl3+)))

;;; shopify-themekit-bin — Shopify theme development command line tool
(define-public shopify-themekit-bin
  (package
    (name "shopify-themekit-bin")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Shopify/themekit/releases/download/v"
                    version "/linux-amd64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("theme" "bin/theme"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "command line tool for Shopify theme development")
    (description "Theme Kit is a cross-platform command line tool for building
Shopify themes.  Note: this tool is deprecated by Shopify in favor of Shopify
CLI, but remains functional.")
    (home-page "https://github.com/Shopify/themekit")
    (license license:expat)))

;;; restfox-bin — offline-first web HTTP client (pre-built binary)
(define-public restfox-bin
  (package
    (name "restfox-bin")
    (version "0.40.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/flawiddsouza/Restfox/releases/download/v"
                    version "/restfox_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/share" "share/")
               ("usr/bin" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils tar xz))
    (supported-systems '("x86_64-linux"))
    (synopsis "offline-first web HTTP client")
    (description "Restfox is an offline-first HTTP client for testing REST APIs.
It provides a clean interface for making HTTP requests and viewing responses.")
    (home-page "https://restfox.dev")
    (license license:expat)))

;;; enlightenment-eminence-theme-bin — eminence theme for Enlightenment
(define-public enlightenment-eminence-theme-bin
  (package
    (name "enlightenment-eminence-theme-bin")
    (version "0.1.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wltjr/eminence")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("eminence-elementary.edj"
                "share/enlightenment/data/themes/eminence-elementary.edj")
               ("eminence-terminology.edj"
                "share/enlightenment/data/themes/eminence-terminology.edj"))))
    (synopsis "eminence theme for Enlightenment window manager")
    (description "Eminence is a dark theme for the Enlightenment desktop
environment.  It includes themes for both Elementary and Terminology.")
    (home-page "https://github.com/wltjr/eminence")
    (license license:gpl3+)))

;;; termusic-git — terminal music player written in Rust (pre-built binary)
(define-public termusic-git
  (package
    (name "termusic-git")
    (version "0.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tramhao/termusic/releases/download/v"
                    version "/termusic-v" version "-x86_64-linux.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("termusic" "bin/termusic")
               ("termusic-server" "bin/termusic-server"))))
    (native-inputs (list tar xz))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal music player written in Rust")
    (description "Termusic is a TUI music player written in Rust.  It supports
multiple audio backends including GStreamer and MPV.")
    (home-page "https://github.com/tramhao/termusic")
    (license license:gpl3+)))

;;; gitfetch-bin — GitHub profile fetcher for the terminal
(define-public gitfetch-bin
  (package
    (name "gitfetch-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/BeanDx/GitFetchCSharp/releases/download/v"
                    version "/GithubFetch-CSharp"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("GithubFetch-CSharp" "bin/gitfetch"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/gitfetch") #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "GitHub profile fetcher for the terminal")
    (description "GitFetch displays GitHub user profile information in the
terminal, similar to neofetch but for GitHub profiles.")
    (home-page "https://github.com/BeanDx/GitFetchCSharp")
    (license license:expat)))

;;; basedpyright-bin — Python type checker based on pyright (pre-built)
(define-public basedpyright-bin
  (package
    (name "basedpyright-bin")
    (version "1.39.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DetachHead/basedpyright/releases/download/v"
                    version "/basedpyright-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list node))
    (synopsis "Python type checker based on Pyright with extra features")
    (description "Basedpyright is a Python type checker based on Pyright with
additional features and stricter defaults.  It requires Node.js at runtime.")
    (home-page "https://github.com/DetachHead/basedpyright")
    (license license:expat)))

;;; pyrefly-bin — fast type checker and language server for Python
(define-public pyrefly-bin
  (package
    (name "pyrefly-bin")
    (version "0.61.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/pyrefly/"
                    "pyrefly-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast type checker and language server for Python")
    (description "Pyrefly is a fast type checker and language server for Python
developed by Meta.  It provides IDE features like code completion and
diagnostics.")
    (home-page "https://pyrefly.org/")
    (license license:expat)))

;;; spacecadetpinball-bin — decompilation of 3D Pinball for Windows Space Cadet
(define-public spacecadetpinball-bin
  (package
    (name "spacecadetpinball-bin")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/k4zmu2a/SpaceCadetPinball")
                    (commit (string-append "Release_" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list sdl2 sdl2-mixer))
    (synopsis "decompilation of 3D Pinball for Windows Space Cadet")
    (description "SpaceCadetPinball is a portable decompilation of the 3D Pinball
for Windows Space Cadet game.  Game data files must be supplied separately.")
    (home-page "https://github.com/k4zmu2a/SpaceCadetPinball")
    (license license:expat)))

;;; ftop-bin — file-based process monitor
(define-public ftop-bin
  (package
    (name "ftop-bin")
    (version "0.0.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/walles/ftop")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/walles/ftop"
           #:tests? #f))
    (synopsis "file-based process monitor")
    (description "Ftop is a process monitor that shows which files each process
is accessing.  It displays per-file I/O activity in the terminal.")
    (home-page "https://github.com/walles/ftop")
    (license license:expat)))
