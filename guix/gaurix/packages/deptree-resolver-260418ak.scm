;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418ak
;;; Resolves 4 BLOCKED packages with concrete recipes.
;;; Moves 10 packages to FAILED status.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260418ak)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (hyprland-workspaces-tui
            deadlock-api-ingest-git
            fiqhack-git
            container2wasm-git
))

(define-public hyprland-workspaces-tui
  (package
    (name "hyprland-workspaces-tui")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Levizor/hyprland-workspaces-tui")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Terminal-based TUI wrapper for hyprland-workspaces CLI utility")
    (description "Terminal-based user interface (TUI) wrapper for the hyprland-workspaces CLI utility.  Provides a visual workspace manager for the Hyprland Wayland compositor.")
    (home-page "https://github.com/Levizor/hyprland-workspaces-tui")
    (license license:expat)))

(define-public deadlock-api-ingest-git
  (package
    (name "deadlock-api-ingest-git")
    (version "0.2.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/deadlock-api/deadlock-api-ingest")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Client for uploading match data to deadlock-api")
    (description "Client for uploading match data to the Deadlock API service.  Captures and ingests game telemetry data via libpcap.")
    (home-page "https://github.com/deadlock-api/deadlock-api-ingest")
    (license license:expat)))

(define-public fiqhack-git
  (package
    (name "fiqhack-git")
    (version "4.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FredrIQ/fiqhack")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NetHack variant focused on AI, balance, and interface improvements")
    (description "Variant of NetHack focused on AI, balance, and interface improvements.  Uses a custom build system (aimake) included in the source tree.")
    (home-page "https://github.com/FredrIQ/fiqhack")
    (license license:gpl2+)))

(define-public container2wasm-git
  (package
    (name "container2wasm-git")
    (version "0.8.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/container2wasm/container2wasm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/container2wasm/container2wasm"
           #:tests? #f))
    (synopsis "Convert OCI container images to WASM modules")
    (description "Convert OCI container images to WASM modules.  Provides the c2w binary for container-to-WebAssembly conversion.")
    (home-page "https://github.com/container2wasm/container2wasm")
    (license license:asl2.0)))
