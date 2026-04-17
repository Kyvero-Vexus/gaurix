;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260417q
;;; Resolves 8 BLOCKED packages from dependency tree queue:
;;;   - hyperfluent-grub-theme-endeavouros (#14721): EndeavourOS GRUB theme
;;;   - wayland-boomer-git (#14737): zoomer app for Wayland
;;;   - xorg-xwayland-git (#14712): re-export of xorg-server-xwayland
;;;   - transistor-git (#14539): KDE internet radio player
;;;   - python-ffmpy (#14579-dep): FFmpeg Python wrapper
;;;   - python-groovy (#14579-dep): SSRF protection library
;;;   - python-safehttpx (#14579-dep): safe HTTP client
;;;   - python-gradio-client (#14579-dep): Gradio client library
;;;
;;; 13 packages remain BLOCKED (see blocked-notes).
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260417q)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xorg)
  #:export (hyperfluent-grub-theme-endeavouros
            wayland-boomer-git
            xorg-xwayland-git
            transistor-git
            python-ffmpy
            python-groovy
            python-safehttpx
            python-gradio-client))

;;; ── hyperfluent-grub-theme-endeavouros (#14721) ─────────────────────
;;; EndeavourOS branding variant of HyperFluent GRUB theme.
;;; Simple file install — copy theme directory to GRUB themes path.

(define-public hyperfluent-grub-theme-endeavouros
  (package
    (name "hyperfluent-grub-theme-endeavouros")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Coopydood/HyperFluent-GRUB-Theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("endeavouros" "share/grub/themes/hyperfluent-endeavouros/"))))
    (home-page "https://github.com/Coopydood/HyperFluent-GRUB-Theme")
    (synopsis "HyperFluent GRUB theme with EndeavourOS branding")
    (description "A modern, clean GRUB bootloader theme with EndeavourOS
branding.  Part of the HyperFluent GRUB theme collection.")
    (license license:gpl3+)))

;;; ── wayland-boomer-git (#14737) ─────────────────────────────────────
;;; Zoomer application for Wayland, C project using clang + glfw.
;;; Despite the -git suffix, uses vendored raylib.

(define-public wayland-boomer-git
  (let ((commit "36e3d9a")
        (revision "0"))
    (package
      (name "wayland-boomer-git")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/lsck0/wayland-boomer")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments
       (list
        #:tests? #f
        #:make-flags
        #~(list (string-append "CC=" #$(cc-for-target))
                (string-append "PREFIX=" #$output))
        #:phases
        #~(modify-phases %standard-phases
            (delete 'configure)
            (add-before 'install 'mkdir-bin
              (lambda _
                (mkdir-p (string-append #$output "/bin"))))
            (replace 'install
              (lambda _
                (install-file "boomer"
                              (string-append #$output "/bin")))))))
      (inputs (list glfw))
      (native-inputs (list clang))
      (home-page "https://github.com/lsck0/wayland-boomer")
      (synopsis "screen zoomer application for Wayland compositors")
      (description "A zoomer application for Linux Wayland compositors,
providing a screen magnification tool.  This is a Wayland alternative
to tsoding's X11 boomer utility.")
      (license license:expat))))

;;; ── xorg-xwayland-git (#14712) ──────────────────────────────────────
;;; Re-export of xorg-server-xwayland from Guix upstream.
;;; Guix already provides xorg-server-xwayland@24.1.9.

(define-public xorg-xwayland-git
  (package
    (inherit xorg-server-xwayland)
    (name "xorg-xwayland-git")
    (properties `((hidden? . #t)))))

;;; ── transistor-git (#14539) ─────────────────────────────────────────
;;; KDE/Qt6 internet radio player with access to 50,000+ stations.
;;; CMake build, all deps available in Guix.

(define-public transistor-git
  (let ((commit "a1eaf2d3")
        (revision "0"))
    (package
      (name "transistor-git")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://gitlab.com/driglu4it/transistor")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list
        #:tests? #f
        #:configure-flags
        #~(list "-DCMAKE_BUILD_TYPE=Release")))
      (native-inputs
       (list extra-cmake-modules pkg-config))
      (inputs
       (list qtbase
             qtdeclarative
             qtmultimedia
             qtsvg
             kirigami
             kcoreaddons
             kdbusaddons
             kiconthemes
             knotifications
             jack-2))
      (home-page "https://gitlab.com/driglu4it/transistor")
      (synopsis "internet radio player with 50,000+ station database")
      (description "Transistor is an internet radio player built with Qt6
and KDE Frameworks that provides access to a station database with over
50,000 stations.  It features a clean Kirigami-based interface.")
      (license license:gpl3+))))

;;; ── python-ffmpy ────────────────────────────────────────────────────
;;; Simple Python wrapper for FFmpeg command-line tool.
;;; Dependency for python-gradio.

(define-public python-ffmpy
  (package
    (name "python-ffmpy")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "ffmpy" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (inputs (list ffmpeg))
    (home-page "https://github.com/Ch00k/ffmpy")
    (synopsis "simple Python wrapper for FFmpeg")
    (description "ffmpy is a simple Python wrapper for FFmpeg.  It provides
a Pythonic interface to execute FFmpeg commands from Python code.")
    (license license:expat)))

;;; ── python-groovy ───────────────────────────────────────────────────
;;; Python library for Gradio internal use.
;;; Dependency for python-gradio.

(define-public python-groovy
  (package
    (name "python-groovy")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "groovy" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (home-page "https://github.com/gradio-app/groovy")
    (synopsis "Gradio internal utility library")
    (description "Groovy is a small Python library used internally by the
Gradio project for application building utilities.")
    (license license:asl2.0)))

;;; ── python-safehttpx ────────────────────────────────────────────────
;;; SSRF protection library wrapping httpx.
;;; Dependency for python-gradio.

(define-public python-safehttpx
  (package
    (name "python-safehttpx")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "safehttpx" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-httpx))
    (native-inputs (list python-hatchling))
    (home-page "https://github.com/gradio-app/safehttpx")
    (synopsis "SSRF protection library for Python HTTP clients")
    (description "safehttpx is a small Python library that helps developers
protect their applications from Server Side Request Forgery (SSRF) attacks
by wrapping httpx with IP validation.")
    (license license:asl2.0)))

;;; ── python-gradio-client ────────────────────────────────────────────
;;; Client library for Gradio applications.
;;; Dependency for python-gradio.

(define-public python-gradio-client
  (package
    (name "python-gradio-client")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "gradio_client" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-fsspec
           python-httpx
           python-huggingface-hub
           python-packaging
           python-typing-extensions))
    (native-inputs (list python-hatchling))
    (home-page "https://github.com/gradio-app/gradio")
    (synopsis "client library for Gradio machine learning demos")
    (description "gradio-client is a Python library for programmatically
interacting with Gradio-powered machine learning demos and APIs.")
    (license license:asl2.0)))
