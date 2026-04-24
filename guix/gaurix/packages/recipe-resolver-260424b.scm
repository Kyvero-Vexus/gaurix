;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424b
;;; Resolves 3 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; Resolved recipes (3):
;;;         1.  sigi (copy-build-system, v3.7.1, GPL-2.0-only)
;;;         2.  greetd-tuigreet-fork-git (copy-build-system, v1.0.1, GPL-3.0+)
;;;         3.  phpactor (copy-build-system, v2025.12.21.1, MIT)
;;;
;;; Already packaged prior: (none)
;;; Blocked: (none)
;;;
;;; NOTE: sha256 hashes are REAL (obtained via `guix download`).

(define-module (gaurix packages recipe-resolver-260424b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages php)
  #:export (
            sigi
            greetd-tuigreet-fork-git
            phpactor
            ))

;;; -------------------------------------------------------------------
;;; 1. sigi --- organization CLI for terminal lovers who hate organizing
;;; -------------------------------------------------------------------
(define-public sigi
  (package
    (name "sigi")
    (version "3.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sigi-cli/sigi/releases/download/v"
                    version "/sigi_v" version
                    "_x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "16fnryrd0xq4n9d208j6fd13d8a0kzq4vlnhgzwg6nyr1p8dikis"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sigi" "bin/sigi")
                ("sigi.1" "share/man/man1/sigi.1"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sigi-cli/sigi")
    (synopsis "organization CLI for terminal lovers who hate organizing")
    (description "Sigi is an organizing tool for terminal lovers who hate
organizing.  It provides stack-based task management with commands to push,
pop, peek, and manipulate items.  Supports multiple named stacks for
different contexts.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 2. greetd-tuigreet-fork-git --- stylish TUI greeter for greetd
;;; -------------------------------------------------------------------
(define-public greetd-tuigreet-fork-git
  (package
    (name "greetd-tuigreet-fork-git")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/soupy-boy/tuigreet-soupy-boy/releases/download/"
                    version "/tuigreet-" version "-x86_64"))
              (sha256
               (base32 "1lb91ygbvxqdnrvgbqay8rgdmrhaqk0cxix1p5gbavmdmkgaqf8j"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tuigreet-1.0.1-x86_64" "bin/tuigreet"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/tuigreet")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/soupy-boy/tuigreet-soupy-boy")
    (synopsis "stylish graphical console greeter for greetd")
    (description "Tuigreet-soupy-boy is a fork of tuigreet, a graphical
console greeter for greetd built with Ratatui.  This fork adds keybinds for
power options and a @code{--silent} flag to silence command output.  It does
not require a Wayland compositor to be used.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 3. phpactor --- PHP completion, refactoring, and language server
;;; -------------------------------------------------------------------
(define-public phpactor
  (package
    (name "phpactor")
    (version "2025.12.21.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/phpactor/phpactor/releases/download/"
                    version "/phpactor.phar"))
              (sha256
               (base32 "1hvc4jd5sfzadp2m0sf9vzkbngfip9gmjbxwjjrykdfrbiifkfsk"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("phpactor.phar" "share/phpactor/phpactor.phar"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (php (search-input-file inputs "bin/php"))
                          (phar (string-append out "/share/phpactor/phpactor.phar")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/phpactor")
                       (lambda (port)
                         (format port "#!~a~%exec ~a ~a \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 php phar)))
                     (chmod (string-append bin "/phpactor") #o755)))))))
    (inputs (list php))
    (supported-systems '("x86_64-linux"))
    (home-page "https://phpactor.readthedocs.io/")
    (synopsis "PHP completion, refactoring, introspection tool and language server")
    (description "Phpactor is a PHP language server providing completion,
refactoring, and code introspection.  It integrates with editors via LSP and
supports goto definition, find references, rename, and code generation.
Requires PHP 8.2 or later.")
    (license license:expat)))
