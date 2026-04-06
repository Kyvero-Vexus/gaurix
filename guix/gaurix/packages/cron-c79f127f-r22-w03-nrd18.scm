;;; Round-22 worker-03 BLOCKED resolution pass #18 (dep-tree priority queue).
;;; 2 new recipes: 1 Bash (pipes.sh), 1 Python (aria2p).
;;; 4 compat aliases added to general-compat.scm.
;;; 94 re-blocked with specific reasons.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd18)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix build-system python) #:select (pypi-uri))
  #:use-module (gnu packages bash)
  ;; aria2p deps
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages time)
  #:use-module (gnu packages xdisorg)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (pipes.sh
            python-aria2p))

;; ═══════════════════════════════════════════════════════════════════
;; Shell scripts
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. pipes.sh (#1-ranked: 0 blocked deps, 1 reverse dep) ────────
;; Animated pipes terminal screensaver written in Bash.

(define-public pipes.sh
  (package
    (name "pipes.sh")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pipeseroni/pipes.sh/archive/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "09m4alb3clp3rhnqga5v6070p7n1gmnwp2ssqhq87nf2ipfpcaak"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pipes.sh" "bin/pipes.sh"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-script
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((bash (search-input-file inputs "bin/bash")))
                     (wrap-program (string-append (assoc-ref outputs "out")
                                                  "/bin/pipes.sh")
                       `("PATH" prefix
                         (,(dirname bash))))))))))
    (inputs (list bash-minimal))
    (home-page "https://github.com/pipeseroni/pipes.sh")
    (synopsis "Animated pipes terminal screensaver")
    (description "pipes.sh is an animated terminal screensaver that draws
randomly-growing pipes across the screen using Unicode characters.  It
requires only Bash 4.0 or later and a terminal with ANSI escape support.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 2. aria2p (#8-ranked: 0 blocked deps, 2 reverse deps) ─────────
;; Python CLI/library to interact with aria2c via JSON-RPC.

(define-public python-aria2p
  (package
    (name "python-aria2p")
    (version "0.12.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "aria2p" version))
              (sha256
               (base32 "150jikd7h1nmkpjga9qrp53nygnw2csj3i7l4fh69cab9axcq88m"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require running aria2c daemon
    (propagated-inputs
     (list python-loguru
           python-platformdirs
           python-pyperclip
           python-requests
           python-tomli
           python-websocket-client))
    (native-inputs (list python-pdm-backend))
    (home-page "https://pawamoy.github.io/aria2p/")
    (synopsis "Command-line tool and library to interact with aria2c daemon")
    (description "aria2p is a command-line tool and Python library that
provides an interface to interact with an @code{aria2c} daemon process
via its JSON-RPC API.  It allows managing downloads, monitoring
progress, and controlling aria2c from Python scripts or the terminal.")
    (license license:isc)))
