;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; wayprompt-git package definition with Zig dependencies.
;;; Uses zig-build-system with Zig 0.13.
;;; Upstream: https://git.sr.ht/~leon_plickat/wayprompt
;;; Generated: 2026-04-27

(define-module (gaurix packages wayprompt)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system zig)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages zig)
  #:export (zig-wayland-0.2
            zig-pixman-0.2
            zig-xkbcommon-0.2
            zig-fcft
            zig-ini
            zig-spoon
            wayprompt-git))

;;; ============================================================
;;; Dependency: zig-pixman-0.2 (Zig bindings for Pixman)
;;; ============================================================
;;; Wayprompt requires zig-pixman v0.2.0 (minimum Zig 0.13).
;;; Guix ships zig-pixman v0.3.0 (for Zig 0.15), which is
;;; API-incompatible, so we package v0.2.0 separately.

(define-public zig-pixman-0.2
  (package
    (name "zig-pixman")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/ifreund/zig-pixman/archive/v"
                    version ".tar.gz"))
              (file-name (string-append "zig-pixman-" version ".tar.gz"))
              (sha256
               (base32
                "190cm5am208455f6l57sqh41rsn4l9b84iaaa6y9l7vxwhh0b209"))))
    (build-system zig-build-system)
    (arguments
     (list #:zig zig-0.13
           #:skip-build? #t))
    (propagated-inputs (list pixman))
    (home-page "https://codeberg.org/ifreund/zig-pixman")
    (synopsis "Zig bindings for Pixman")
    (description "This package provides Zig bindings for @code{pixman},
a low-level software library for pixel manipulation.")
    (license license:expat)))

;;; ============================================================
;;; Dependency: zig-wayland-0.2 (Zig Wayland bindings)
;;; ============================================================
;;; Wayprompt requires zig-wayland v0.2.0 (minimum Zig 0.13).
;;; Guix ships zig-wayland v0.4.0 (for Zig 0.15).

(define-public zig-wayland-0.2
  (package
    (name "zig-wayland")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/ifreund/zig-wayland/archive/v"
                    version ".tar.gz"))
              (file-name (string-append "zig-wayland-" version ".tar.gz"))
              (sha256
               (base32
                "0w2dg060x34iiskjmmcgvbjm816qpmf149syvsbxmn5an0ff8743"))))
    (build-system zig-build-system)
    (arguments
     (list #:zig zig-0.13
           #:skip-build? #t))
    (propagated-inputs (list wayland wayland-protocols))
    (native-inputs (list pkg-config wayland))
    (home-page "https://codeberg.org/ifreund/zig-wayland")
    (synopsis "Zig Wayland bindings and protocol scanner")
    (description "This package provides Zig bindings for @code{wayland}
and a @code{Scanner} interface for generating protocol bindings at
build time.")
    (license license:expat)))

;;; ============================================================
;;; Dependency: zig-xkbcommon-0.2 (Zig bindings for libxkbcommon)
;;; ============================================================
;;; Wayprompt requires zig-xkbcommon v0.2.0 (minimum Zig 0.13).
;;; Guix ships zig-xkbcommon v0.3.0 (for Zig 0.15).

(define-public zig-xkbcommon-0.2
  (package
    (name "zig-xkbcommon")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/ifreund/zig-xkbcommon/archive/v"
                    version ".tar.gz"))
              (file-name (string-append "zig-xkbcommon-" version ".tar.gz"))
              (sha256
               (base32
                "0zbh746fm45ijcd5xvlk4c50jcdb3isax0bi6yasgnk29qjh96kz"))))
    (build-system zig-build-system)
    (arguments
     (list #:zig zig-0.13
           #:skip-build? #t))
    (propagated-inputs (list libxkbcommon))
    (home-page "https://codeberg.org/ifreund/zig-xkbcommon")
    (synopsis "Zig bindings for libxkbcommon")
    (description "This package provides Zig bindings for @code{libxkbcommon},
a library for handling keyboard descriptions.")
    (license license:expat)))

;;; ============================================================
;;; Dependency: zig-fcft (Zig bindings for fcft font library)
;;; ============================================================
;;; Required by wayprompt for font rendering.  Depends on zig-pixman.

(define-public zig-fcft
  (package
    (name "zig-fcft")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://git.sr.ht/~novakane/zig-fcft/archive/"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1dabfrlg17cg1bi6n5rn1p7l5qsxy17pzwqbzm1cnszaqp7gzhm2"))))
    (build-system zig-build-system)
    (arguments
     (list #:zig zig-0.13
           #:install-source? #t
           #:skip-build? #t))
    (inputs
     (list zig-pixman-0.2))
    (propagated-inputs (list fcft))
    (home-page "https://git.sr.ht/~novakane/zig-fcft")
    (synopsis "Zig bindings for the fcft font library")
    (description "This package provides Zig bindings for @code{fcft}, a font
loading and rendering library.")
    (license license:expat)))

;;; ============================================================
;;; Dependency: zig-ini (INI file parser for Zig)
;;; ============================================================
;;; Required by wayprompt for configuration file parsing.

(define-public zig-ini
  (let ((commit "879c74a3a801d49fa34343aebd55a22f591899b3")
        (revision "0"))
    (package
      (name "zig-ini")
      (version (git-version "1.0.2" revision commit))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://git.sr.ht/~leon_plickat/zig-ini/archive/"
                      commit ".tar.gz"))
                (file-name (string-append name "-" version ".tar.gz"))
                (sha256
                 (base32
                  "132gqhrpxifnnnd0f6mnahnfwki4an773y929177fg4h29yvs5j6"))))
      (build-system zig-build-system)
      (arguments
       (list #:zig zig-0.13
             #:install-source? #t
             #:skip-build? #t))
      (home-page "https://git.sr.ht/~leon_plickat/zig-ini")
      (synopsis "Zig INI file parser")
      (description "Zig-ini is a streaming INI configuration file parser for
Zig programs.")
      (license license:expat))))

;;; ============================================================
;;; Dependency: zig-spoon (TUI library for Zig)
;;; ============================================================
;;; Required by wayprompt for terminal user interface fallback.

(define-public zig-spoon
  (let ((commit "fdba8e643c9558254bf4e6c600dfbd782fa7a267")
        (revision "0"))
    (package
      (name "zig-spoon")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://git.sr.ht/~leon_plickat/zig-spoon/archive/"
                      commit ".tar.gz"))
                (file-name (string-append name "-" version ".tar.gz"))
                (sha256
                 (base32
                  "0r0hw7n4iam3k6fxgbdk2cb501j015dmmh84vxfvi80dlhbp9vjw"))))
      (build-system zig-build-system)
      (arguments
       (list #:zig zig-0.13
             #:install-source? #t
             #:skip-build? #t))
      (home-page "https://git.sr.ht/~leon_plickat/zig-spoon")
      (synopsis "Terminal UI library for Zig")
      (description "Zig-spoon is a terminal user interface library for Zig,
providing screen management and input handling for terminal applications.")
      (license license:expat))))

;;; ============================================================
;;; wayprompt-git --- Multi-purpose prompt tool for Wayland
;;; ============================================================
;;; Wayprompt is a password-prompt tool for Wayland compositors that
;;; support the layer-shell protocol.  It ships three executables:
;;; wayprompt (CLI prompt), pinentry-wayprompt (GPG pinentry), and
;;; wayprompt-ssh-askpass (SSH askpass).
;;;
;;; Build requires Zig 0.13 with six Zig library dependencies.
;;; All dependencies are packaged above.

(define-public wayprompt-git
  (package
    (name "wayprompt-git")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://git.sr.ht/~leon_plickat/wayprompt/archive/v"
                    version ".tar.gz"))
              (file-name (string-append "wayprompt-" version ".tar.gz"))
              (sha256
               (base32
                "0lv879g5q9q6criibrdk3snm37d0dzfl0b05n256khnab8lvpi16"))))
    (build-system zig-build-system)
    (arguments
     (list
      #:zig zig-0.13
      #:install-source? #f
      #:tests? #f
      #:zig-release-type "safe"
      #:phases
      #~(modify-phases %standard-phases
          ;; The zig-build-system's unpack-dependencies phase uses
          ;; GUIX_ZIG_PACKAGE_PATH to find Zig library sources.
          ;; We need to rename dependency references in build.zig.zon
          ;; to match Guix package names (which include "zig-" prefix
          ;; for the ifreund bindings, and match for the rest).
          ;;
          ;; wayprompt's build.zig.zon dep names:
          ;;   zig-ini, zig-spoon, zig-pixman, zig-wayland,
          ;;   zig-xkbcommon, zig-fcft
          ;; These already match the Guix package names after
          ;; strip-version, so no renaming is needed.

          ;; Ensure pkg-config can find wayland-scanner path
          (add-after 'unpack 'fix-pkg-config
            (lambda* (#:key inputs #:allow-other-keys)
              ;; wayland-scanner is needed by zig-wayland's Scanner
              ;; to generate protocol C code
              (let ((wayland (assoc-ref inputs "wayland")))
                (setenv "PATH"
                        (string-append wayland "/bin:"
                                       (getenv "PATH")))))))))
    (inputs
     (list zig-wayland-0.2
           zig-pixman-0.2
           zig-xkbcommon-0.2
           zig-fcft
           zig-ini
           zig-spoon))
    (native-inputs
     (list pkg-config
           wayland))     ;; for wayland-scanner binary
    (home-page "https://git.sr.ht/~leon_plickat/wayprompt")
    (synopsis "multi-purpose prompt tool for Wayland with pinentry support")
    (description "Wayprompt is a multi-purpose password-prompt tool for
Wayland compositors that support the layer-shell protocol.  It includes
a drop-in @code{pinentry} replacement for GPG (@command{pinentry-wayprompt}),
an @code{ssh-askpass} implementation (@command{wayprompt-ssh-askpass}), and a
general-purpose CLI prompt tool (@command{wayprompt}).  It also provides a TUI
fallback mode for use from a TTY when no Wayland connection is available.")
    (license license:gpl3)))
