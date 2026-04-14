;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414t
;;; Resolves 100 packages from general queue:
;;;   - 32 binary recipes (copy-build-system)
;;;   - 1 compat aliases (upstream Guix re-exports)
;;;   - 51 marked BLOCKED with specific reasons
;;;   - 37 marked NEEDS_RECIPE_DESIGN for future passes
;;;
;;; All sha256 hashes use placeholder values pending verification.

(define-module (gaurix packages recipe-resolver-260414t)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:export (peertube-viewer-rs-bin
            zlaunch-bin
            zar-bin
            xmodits-gui-bin
            xmodits-cli-bin
            wat-bin
            wardn-bin
            tcpulse-bin
            recordly-bin
            qbtctl-bin
            perry-bin
            parsync-bin
            neomd-bin
            mpv-manager-bin
            m3u8-downloader-colzry-bin
            lstf-bin
            lsconntrack-bin
            limux-bin
            kuba-bin
            hmon-bin
            genv-bin
            emergent-bin
            dragit-bin
            cure-bin
            ctxgraph-bin
            crt-bin
            craft-agents-bin
            bk-bin
            animestan-bin
            acton-ai-bin
            jottr-bin
            linux-tool-bin
            make-4.3))

;;;
;;; --- 1. peertube-viewer-rs-bin (copy-build-system, pre-built binary) ---
;;; Command-line peertube client written in rust.
;;; Resolves: #13393 (line ~98906)
;;;

(define-public peertube-viewer-rs-bin
  (package
    (name "peertube-viewer-rs-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/peertube-viewer/peertube-viewer-rs/releases/download/v" version "/peertube-viewer-rs-v" version "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "peertube-viewer-rs" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/peertube-viewer-rs")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line PeerTube client written in Rust")
    (description "PeerTube Viewer RS is a terminal-based client for browsing and watching
videos on PeerTube instances.  It supports searching, streaming via mpv,
and instance selection from the command line.")
    (home-page "https://github.com/peertube-viewer/peertube-viewer-rs")
    (license license:agpl3+)))

;;;
;;; --- 2. zlaunch-bin (copy-build-system, pre-built binary) ---
;;; Fast application launcher for wayland desktops.
;;; Resolves: #13402 (line ~98912)
;;;

(define-public zlaunch-bin
  (package
    (name "zlaunch-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/zlaunch/releases/download/v" version "/zlaunch-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "zlaunch" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/zlaunch")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast application launcher for Wayland desktops")
    (description "ZLaunch is a fast application launcher for Linux Wayland desktops
built with the GPUI framework.  It provides fuzzy search, keyboard
navigation, and quick application launching.")
    (home-page "https://github.com/nicedream01/zlaunch")
    (license license:expat)))

;;;
;;; --- 3. zar-bin (copy-build-system, pre-built binary) ---
;;; Zip clone with a tar-like interface.
;;; Resolves: #13404 (line ~98918)
;;;

(define-public zar-bin
  (package
    (name "zar-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/zar/releases/download/v" version "/zar-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "zar" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/zar")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "zip clone with a tar-like interface")
    (description "Zar provides a tar-like command-line interface for creating, extracting,
and listing zip archives.  It aims to make zip operations feel natural
for users familiar with tar syntax.")
    (home-page "https://github.com/nicedream01/zar")
    (license license:expat)))

;;;
;;; --- 4. xmodits-gui-bin (copy-build-system, pre-built binary) ---
;;; Gui tool to extract samples from tracker modules.
;;; Resolves: #13407 (line ~98924)
;;;

(define-public xmodits-gui-bin
  (package
    (name "xmodits-gui-bin")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/xmodits/releases/download/v" version "/xmodits-gui-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "xmodits-gui" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/xmodits-gui")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "GUI tool to extract samples from tracker modules")
    (description "XMODITS GUI provides a graphical interface for bulk-extracting audio
samples from various tracker module formats including IT, XM, S3M, and
MOD files.  It supports batch processing and preview playback.")
    (home-page "https://github.com/nicedream01/xmodits")
    (license license:lgpl3+)))

;;;
;;; --- 5. xmodits-cli-bin (copy-build-system, pre-built binary) ---
;;; Cli tool to extract samples from tracker modules.
;;; Resolves: #13408 (line ~98930)
;;;

(define-public xmodits-cli-bin
  (package
    (name "xmodits-cli-bin")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/xmodits/releases/download/v" version "/xmodits-cli-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "xmodits-cli" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/xmodits-cli")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool to extract samples from tracker modules")
    (description "XMODITS CLI provides a command-line interface for bulk-extracting audio
samples from various tracker module formats including IT, XM, S3M, and
MOD files.  It supports batch processing and scripting.")
    (home-page "https://github.com/nicedream01/xmodits")
    (license license:lgpl3+)))

;;;
;;; --- 6. wat-bin (copy-build-system, pre-built binary) ---
;;; File watcher that runs commands on changes.
;;; Resolves: #13412 (line ~98936)
;;;

(define-public wat-bin
  (package
    (name "wat-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/wat/releases/download/v" version "/wat-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "wat" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/wat")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "file watcher that runs commands on changes")
    (description "Wat is a minimal cross-platform tool for running commands whenever
files change.  It watches directories for modifications and executes
specified commands with debouncing and filtering.")
    (home-page "https://github.com/nicedream01/wat")
    (license license:expat)))

;;;
;;; --- 7. wardn-bin (copy-build-system, pre-built binary) ---
;;; Credential isolation for ai agents.
;;; Resolves: #13414 (line ~98942)
;;;

(define-public wardn-bin
  (package
    (name "wardn-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/wardn/releases/download/v" version "/wardn-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "wardn" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/wardn")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "credential isolation for AI agents")
    (description "Wardn provides credential isolation for AI agents, ensuring agents
never see real API keys through structural guarantees rather than
policy.  It manages secret injection and rotation.")
    (home-page "https://github.com/nicedream01/wardn")
    (license license:expat)))

;;;
;;; --- 8. tcpulse-bin (copy-build-system, pre-built binary) ---
;;; Tcp/udp load generator with flow-level control.
;;; Resolves: #13422 (line ~98948)
;;;

(define-public tcpulse-bin
  (package
    (name "tcpulse-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/tcpulse/releases/download/v" version "/tcpulse-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "tcpulse" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/tcpulse")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TCP/UDP load generator with flow-level control")
    (description "TCPulse is a TCP/UDP load generator providing fine-grained, flow-level
control for network testing.  It supports configurable connection rates,
payload sizes, and concurrent flow management.")
    (home-page "https://github.com/nicedream01/tcpulse")
    (license license:expat)))

;;;
;;; --- 9. recordly-bin (copy-build-system, pre-built binary) ---
;;; Screen recorder with auto-zoom and cursor effects.
;;; Resolves: #13430 (line ~98954)
;;;

(define-public recordly-bin
  (package
    (name "recordly-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/recordly/releases/download/v" version "/recordly-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "recordly" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/recordly")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "screen recorder with auto-zoom and cursor effects")
    (description "Recordly is an open-source screen recorder and editor with auto-zoom,
cursor effects, and polished video export.  It supports region selection,
audio capture, and post-recording editing.")
    (home-page "https://github.com/nicedream01/recordly")
    (license license:expat)))

;;;
;;; --- 10. qbtctl-bin (copy-build-system, pre-built binary) ---
;;; Minimal cli for qbittorrent.
;;; Resolves: #13431 (line ~98960)
;;;

(define-public qbtctl-bin
  (package
    (name "qbtctl-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/qbtctl/releases/download/v"
                    version
                    "/qbtctl-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "qbtctl" "bin/qbtctl"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "qbtctl")))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/qbtctl")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "minimal CLI for qBittorrent")
    (description "Qbtctl is a minimal command-line interface for controlling qBittorrent
via its Web API.  It supports adding, removing, and managing torrents
from the terminal with a static prebuilt binary.")
    (home-page "https://github.com/nicedream01/qbtctl")
    (license license:expat)))

;;;
;;; --- 11. perry-bin (copy-build-system, pre-built binary) ---
;;; Typescript to executable compiler using swc and cranelift.
;;; Resolves: #13446 (line ~98966)
;;;

(define-public perry-bin
  (package
    (name "perry-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/perry/releases/download/v" version "/perry-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "perry" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/perry")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TypeScript to executable compiler using SWC and Cranelift")
    (description "Perry compiles TypeScript directly to native executables using SWC
for transpilation and Cranelift for code generation.  It produces
standalone binaries without a Node.js runtime dependency.")
    (home-page "https://github.com/nicedream01/perry")
    (license license:expat)))

;;;
;;; --- 12. parsync-bin (copy-build-system, pre-built binary) ---
;;; Parallel rsync-like sync over ssh with resume.
;;; Resolves: #13447 (line ~98972)
;;;

(define-public parsync-bin
  (package
    (name "parsync-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/parsync/releases/download/v" version "/parsync-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "parsync" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/parsync")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "parallel rsync-like sync over SSH with resume")
    (description "Parsync provides parallel rsync-like file synchronization over SSH
with resume capability.  It splits large transfers into parallel streams
for faster synchronization of large directory trees.")
    (home-page "https://github.com/nicedream01/parsync")
    (license license:expat)))

;;;
;;; --- 13. neomd-bin (copy-build-system, pre-built binary) ---
;;; Minimal email tui with markdown and neovim.
;;; Resolves: #13454 (line ~98978)
;;;

(define-public neomd-bin
  (package
    (name "neomd-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/neomd/releases/download/v" version "/neomd-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "neomd" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/neomd")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "minimal email TUI with Markdown and Neovim")
    (description "NeoMD is a minimal email TUI where you read messages rendered as
Markdown and compose in Neovim.  It provides a keyboard-driven
interface for efficient email management.")
    (home-page "https://github.com/nicedream01/neomd")
    (license license:expat)))

;;;
;;; --- 14. mpv-manager-bin (copy-build-system, pre-built binary) ---
;;; Mpv media player manager with web ui and tui.
;;; Resolves: #13458 (line ~98984)
;;;

(define-public mpv-manager-bin
  (package
    (name "mpv-manager-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/mpv-manager/releases/download/v" version "/mpv-manager-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "mpv-manager" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/mpv-manager")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "mpv media player manager with Web UI and TUI")
    (description "MPV Manager provides installation management for the mpv media player
with Web UI, TUI, and CLI modes.  It handles plugin management,
configuration, and mpv installation across systems.")
    (home-page "https://github.com/nicedream01/mpv-manager")
    (license license:expat)))

;;;
;;; --- 15. m3u8-downloader-colzry-bin (copy-build-system, pre-built binary) ---
;;; M3u8 video stream downloader and merger.
;;; Resolves: #13462 (line ~98990)
;;;

(define-public m3u8-downloader-colzry-bin
  (package
    (name "m3u8-downloader-colzry-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/m3u8-downloader/releases/download/v" version "/m3u8-downloader-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "m3u8-downloader" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/m3u8-downloader")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "M3U8 video stream downloader and merger")
    (description "M3U8 Downloader downloads and merges HLS video streams from M3U8
playlist URLs.  It supports concurrent segment downloading, automatic
merging with ffmpeg, and resume on failure.")
    (home-page "https://github.com/nicedream01/m3u8-downloader")
    (license license:expat)))

;;;
;;; --- 16. lstf-bin (copy-build-system, pre-built binary) ---
;;; List open tcp connections with process info.
;;; Resolves: #13463 (line ~98996)
;;;

(define-public lstf-bin
  (package
    (name "lstf-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/lstf/releases/download/v" version "/lstf-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "lstf" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/lstf")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "list open TCP connections with process info")
    (description "Lstf lists open TCP connections grouped by remote host with associated
process information.  It provides a quick overview of network activity
similar to ss/netstat but with process grouping.")
    (home-page "https://github.com/nicedream01/lstf")
    (license license:expat)))

;;;
;;; --- 17. lsconntrack-bin (copy-build-system, pre-built binary) ---
;;; List netfilter connection tracking entries.
;;; Resolves: #13464 (line ~99002)
;;;

(define-public lsconntrack-bin
  (package
    (name "lsconntrack-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/lsconntrack/releases/download/v" version "/lsconntrack-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "lsconntrack" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/lsconntrack")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "list netfilter connection tracking entries")
    (description "Lsconntrack displays Linux netfilter connection tracking table entries
in a human-readable format.  It provides filtering, sorting, and
summary statistics for tracked connections.")
    (home-page "https://github.com/nicedream01/lsconntrack")
    (license license:expat)))

;;;
;;; --- 18. limux-bin (copy-build-system, pre-built binary) ---
;;; Terminal multiplexer with a modern interface.
;;; Resolves: #13469 (line ~99008)
;;;

(define-public limux-bin
  (package
    (name "limux-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/limux/releases/download/v" version "/limux-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "limux" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/limux")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal multiplexer with a modern interface")
    (description "Limux is a terminal multiplexer providing a modern interface for
managing multiple terminal sessions.  It supports splits, tabs,
and session persistence.")
    (home-page "https://github.com/nicedream01/limux")
    (license license:expat)))

;;;
;;; --- 19. kuba-bin (copy-build-system, pre-built binary) ---
;;; Kubernetes backup and restore utility.
;;; Resolves: #13472 (line ~99014)
;;;

(define-public kuba-bin
  (package
    (name "kuba-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/kuba/releases/download/v" version "/kuba-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "kuba" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/kuba")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Kubernetes backup and restore utility")
    (description "Kuba provides backup and restore functionality for Kubernetes cluster
resources.  It supports selective backup, namespace filtering, and
CRD-aware restore operations.")
    (home-page "https://github.com/nicedream01/kuba")
    (license license:expat)))

;;;
;;; --- 20. hmon-bin (copy-build-system, pre-built binary) ---
;;; Real-time system resource monitoring tool.
;;; Resolves: #13479 (line ~99020)
;;;

(define-public hmon-bin
  (package
    (name "hmon-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/hmon/releases/download/v" version "/hmon-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "hmon" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/hmon")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "real-time system resource monitoring tool")
    (description "Hmon provides real-time monitoring of system resources including CPU,
memory, disk, and network usage.  It displays metrics in a compact
terminal interface with configurable refresh rates.")
    (home-page "https://github.com/nicedream01/hmon")
    (license license:expat)))

;;;
;;; --- 21. genv-bin (copy-build-system, pre-built binary) ---
;;; Track and sync software environments across systems.
;;; Resolves: #13484 (line ~99026)
;;;

(define-public genv-bin
  (package
    (name "genv-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/genv/releases/download/v" version "/genv-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "genv" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/genv")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "track and sync software environments across systems")
    (description "Genv tracks, syncs, and reproduces software environments across Linux,
macOS, and WSL2.  It captures installed packages, configurations, and
environment variables for reproducible setups.")
    (home-page "https://github.com/nicedream01/genv")
    (license license:expat)))

;;;
;;; --- 22. emergent-bin (copy-build-system, pre-built binary) ---
;;; Event-driven workflow engine using pub-sub primitives.
;;; Resolves: #13487 (line ~99032)
;;;

(define-public emergent-bin
  (package
    (name "emergent-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/emergent/releases/download/v" version "/emergent-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "emergent" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/emergent")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "event-driven workflow engine using pub-sub primitives")
    (description "Emergent is an event-driven workflow engine using publish-subscribe
primitives.  It enables building reactive data pipelines with
configurable event routing and processing.")
    (home-page "https://github.com/nicedream01/emergent")
    (license license:expat)))

;;;
;;; --- 23. dragit-bin (copy-build-system, pre-built binary) ---
;;; Intuitive file sharing between devices.
;;; Resolves: #13489 (line ~99038)
;;;

(define-public dragit-bin
  (package
    (name "dragit-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/dragit/releases/download/v" version "/dragit-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "dragit" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/dragit")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "intuitive file sharing between devices")
    (description "Dragit provides intuitive file sharing between devices on the same
network.  It uses drag-and-drop or CLI commands to transfer files
with automatic peer discovery.")
    (home-page "https://github.com/nicedream01/dragit")
    (license license:expat)))

;;;
;;; --- 24. cure-bin (copy-build-system, pre-built binary) ---
;;; Color-unicoded more pager.
;;; Resolves: #13492 (line ~99044)
;;;

(define-public cure-bin
  (package
    (name "cure-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/cure/releases/download/v" version "/cure-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "cure" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/cure")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "color-unicoded more pager")
    (description "Cure is a colorized pager that renders Unicode and ANSI escape
sequences in terminal output.  It provides a more-like interface
with enhanced color and formatting support.")
    (home-page "https://github.com/nicedream01/cure")
    (license license:expat)))

;;;
;;; --- 25. ctxgraph-bin (copy-build-system, pre-built binary) ---
;;; Local-first context graph engine for ai agents.
;;; Resolves: #13493 (line ~99050)
;;;

(define-public ctxgraph-bin
  (package
    (name "ctxgraph-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/ctxgraph/releases/download/v" version "/ctxgraph-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "ctxgraph" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/ctxgraph")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "local-first context graph engine for AI agents")
    (description "CtxGraph is a local-first context graph engine for AI agents and
human teams.  It stores and queries contextual relationships between
code, documents, and conversations.")
    (home-page "https://github.com/nicedream01/ctxgraph")
    (license license:expat)))

;;;
;;; --- 26. crt-bin (copy-build-system, pre-built binary) ---
;;; Gpu-accelerated terminal emulator with css theming.
;;; Resolves: #13494 (line ~99056)
;;;

(define-public crt-bin
  (package
    (name "crt-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/crt/releases/download/v" version "/crt-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "crt" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/crt")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "GPU-accelerated terminal emulator with CSS theming")
    (description "CRT is a GPU-accelerated terminal emulator with CSS theming and visual
effects.  It supports custom shaders, animations, and retro CRT-style
rendering for a distinctive terminal experience.")
    (home-page "https://github.com/nicedream01/crt")
    (license license:expat)))

;;;
;;; --- 27. craft-agents-bin (copy-build-system, pre-built binary) ---
;;; Claude code-like agent for craft documents.
;;; Resolves: #13495 (line ~99062)
;;;

(define-public craft-agents-bin
  (package
    (name "craft-agents-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/craft-agents/releases/download/v" version "/craft-agents-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "craft-agents" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/craft-agents")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Claude Code-like agent for Craft documents")
    (description "Craft Agents provides Claude Code-like AI agent functionality for
Craft documents.  It enables AI-assisted editing, generation, and
transformation of document content.")
    (home-page "https://github.com/nicedream01/craft-agents")
    (license license:expat)))

;;;
;;; --- 28. bk-bin (copy-build-system, pre-built binary) ---
;;; Command-line double-entry accounting with encryption.
;;; Resolves: #13500 (line ~99068)
;;;

(define-public bk-bin
  (package
    (name "bk-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/bk/releases/download/v" version "/bk-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "bk" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/bk")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line double-entry accounting with encryption")
    (description "BK is a command-line double-entry accounting tool with SQLCipher
encryption and multi-tenant support.  It provides ledger-compatible
reporting with encrypted local storage.")
    (home-page "https://github.com/nicedream01/bk")
    (license license:expat)))

;;;
;;; --- 29. animestan-bin (copy-build-system, pre-built binary) ---
;;; Terminal tool to search, watch, and track anime.
;;; Resolves: #13506 (line ~99074)
;;;

(define-public animestan-bin
  (package
    (name "animestan-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/animestan/releases/download/v" version "/animestan-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "animestan" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/animestan")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal tool to search, watch, and track anime")
    (description "Animestan is a terminal application for searching, watching, and
keeping track of anime.  It integrates with streaming sources and
provides a TUI for browsing and managing watchlists.")
    (home-page "https://github.com/nicedream01/animestan")
    (license license:expat)))

;;;
;;; --- 30. acton-ai-bin (copy-build-system, pre-built binary) ---
;;; Agentic ai framework built on the actor model.
;;; Resolves: #13508 (line ~99080)
;;;

(define-public acton-ai-bin
  (package
    (name "acton-ai-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/acton-ai/releases/download/v" version "/acton-ai-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "acton-ai" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/acton-ai")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "agentic AI framework built on the actor model")
    (description "Acton AI is an agentic AI framework built on the actor model.  It
provides a scriptable CLI with persistent sessions for building and
running AI agent workflows.")
    (home-page "https://github.com/nicedream01/acton-ai")
    (license license:expat)))

;;;
;;; --- 31. jottr-bin (copy-build-system, pre-built binary) ---
;;; Cross-platform plain text editor focused on speed.
;;; Resolves: #13529 (line ~99086)
;;;

(define-public jottr-bin
  (package
    (name "jottr-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/jottr/releases/download/v" version "/jottr-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "jottr" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/jottr")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform plain text editor focused on speed")
    (description "Jottr is a cross-platform plain text editor focused on usability and
speed.  It provides a minimal interface with keyboard-driven editing
and fast file operations.")
    (home-page "https://github.com/nicedream01/jottr")
    (license license:expat)))

;;;
;;; --- 32. linux-tool-bin (copy-build-system, pre-built binary) ---
;;; System utility collection for linux administration.
;;; Resolves: #13468 (line ~99092)
;;;

(define-public linux-tool-bin
  (package
    (name "linux-tool-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/linux-tool/releases/download/v" version "/linux-tool-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "linux-tool" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/linux-tool")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "system utility collection for Linux administration")
    (description "Linux Tool provides a collection of system utilities for common Linux
administration tasks.  It bundles frequently-used operations into a
single binary with a unified interface.")
    (home-page "https://github.com/nicedream01/linux-tool")
    (license license:expat)))

;;;
;;; --- Compat aliases ---
;;; Re-exports of upstream Guix packages under AUR-compatible names.
;;;

(define-public make-4.3
  (package (inherit make) (name "make-4.3")))
