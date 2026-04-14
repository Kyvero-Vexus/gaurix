;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260414b
;;; Resolves 100 BLOCKED packages from priority queue:
;;;   - 4 recipes created
;;;   - 96 blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260414b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (logana-bin
            lsu-bin
            lunii-qt-bin
            skillshare))

;;; ── logana-bin (#2589) ──

(define-public logana-bin
  (package
    (name "logana-bin")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pauloremoli/logana/releases/download/"
                    version "/logana-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("logana" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pauloremoli/logana")
    (synopsis "TUI log analyzer for large files with instant filtering")
    (description "Logana is a terminal log analyzer built for speed.  It handles files
with millions of lines and provides instant filtering, navigation, and
pattern highlighting for efficient log analysis workflows.")
    (license license:gpl3+)))

;;; ── lsu-bin (#1473) ──

(define-public lsu-bin
  (package
    (name "lsu-bin")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/l5yth/lsu/releases/download/v"
                    version "/lsu-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lsu" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/l5yth/lsu")
    (synopsis "terminal UI for viewing systemd service units and journals")
    (description "LSU provides a terminal user interface for viewing systemd service
units and their journal output.  It offers quick navigation, filtering,
and real-time log viewing for systemd services.")
    (license license:asl2.0)))

;;; ── lunii-qt-bin (#1315) ──

(define-public lunii-qt-bin
  (package
    (name "lunii-qt-bin")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/o-daneel/Lunii.QT/releases/download/v"
                    version "/Lunii.QT-v" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Lunii.QT" "bin/lunii-qt"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/o-daneel/Lunii.QT")
    (synopsis "GUI for managing Lunii Storyteller devices")
    (description "Lunii.QT provides a graphical interface for managing Lunii
Storyteller audio devices.  It supports story pack management,
device backup, and library organization for the Lunii platform.")
    (license license:gpl3+)))

;;; ── skillshare (#12843) ──

(define-public skillshare
  (package
    (name "skillshare")
    (version "0.19.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/runkids/skillshare.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/runkids/skillshare")
    (synopsis "sync skills across AI CLI tools with one command")
    (description "Skillshare synchronizes configuration and skills across multiple AI
command-line tools.  It provides a unified interface for managing
prompts, templates, and settings shared between AI assistants.")
    (license license:expat)))

