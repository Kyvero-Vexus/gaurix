;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260412b
;;; Resolves 50 packages from TODO queue (batch 1 of 2):
;;;   - 13 recipes created
;;;   - 37 blocked with specific reason codes
;;;
;;; Recipes (13):
;;;   - waterfox-bin (waterfox-bin-pkg)
;;;   - windsurf-electron-latest (windsurf-bin)
;;;   - offpunk-git (offpunk)
;;;   - brscan5 (brscan5-bin)
;;;   - megasync (megasync-bin)
;;;   - google-cloud-cli-bq (google-cloud-cli-bq)
;;;   - google-cloud-cli-gsutil (google-cloud-cli-gsutil)
;;;   - google-cloud-cli-bundled-python3-unix (google-cloud-cli-python3)
;;;   - google-cloud-cli-component-gke-gcloud-auth-plugin (gke-gcloud-auth-plugin)
;;;   - ironwail (ironwail)
;;;   - jdtls (jdtls-bin)
;;;   - irpf2025 (irpf2025-bin)
;;;   - xdg-su (xdg-su)
;;;
;;; Blocked (37):
;;;   - rustconn (NEEDS_RECIPE_DESIGN)
;;;   - debtap (NEEDS_RECIPE_DESIGN)
;;;   - joplin (NEEDS_RECIPE_DESIGN)
;;;   - plasma6-applets-kara-git (NEEDS_RECIPE_DESIGN)
;;;   - wivrn-server (NEEDS_RECIPE_DESIGN)
;;;   - lib32-wivrn-server (NEEDS_RECIPE_DESIGN)
;;;   - wivrn-dashboard (NEEDS_RECIPE_DESIGN)
;;;   - pikaur (NEEDS_RECIPE_DESIGN)
;;;   - tuxedo-drivers-dkms (NEEDS_RECIPE_DESIGN)
;;;   - steam-native-runtime (NEEDS_RECIPE_DESIGN)
;;;   - sonic-workspace (NEEDS_RECIPE_DESIGN)
;;;   - sonic-x11-session (NEEDS_RECIPE_DESIGN)
;;;   - arch-smart-update (NEEDS_RECIPE_DESIGN)
;;;   - xdg-desktop-portal-termfilechooser-hunkyburrito-git (NEEDS_RECIPE_DESIGN)
;;;   - zmx (NEEDS_RECIPE_DESIGN)
;;;   - gpu-screen-recorder-gtk (NEEDS_RECIPE_DESIGN)
;;;   - alhp-mirrorlist (NEEDS_RECIPE_DESIGN)
;;;   - alhp-keyring (NEEDS_RECIPE_DESIGN)
;;;   - awww-git (NEEDS_RECIPE_DESIGN)
;;;   - ut2004-bin (SOURCE_UNAVAILABLE)
;;;   - aimp (NEEDS_RECIPE_DESIGN)
;;;   - obs-studio-git (NEEDS_RECIPE_DESIGN)
;;;   - howdy-git (NEEDS_RECIPE_DESIGN)
;;;   - language-toolkit (NEEDS_RECIPE_DESIGN)
;;;   - opencode-claude-auth (NEEDS_RECIPE_DESIGN)
;;;   - pacman-log-orphans-hook (NEEDS_RECIPE_DESIGN)
;;;   - pyside2 (NEEDS_RECIPE_DESIGN)
;;;   - pyside2-tools (DEP_RESOLUTION_FAILED)
;;;   - python-shiboken2 (DEP_RESOLUTION_FAILED)
;;;   - uzdoom (NEEDS_RECIPE_DESIGN)
;;;   - packwiz-git (NEEDS_RECIPE_DESIGN)
;;;   - code-features (NEEDS_RECIPE_DESIGN)
;;;   - envision-xr-git (NEEDS_RECIPE_DESIGN)
;;;   - teams-for-linux (NEEDS_RECIPE_DESIGN)
;;;   - plasmazones (NEEDS_RECIPE_DESIGN)
;;;   - throne (NEEDS_RECIPE_DESIGN)
;;;   - ryzen_smu-dkms-git (NEEDS_RECIPE_DESIGN)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260412b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages java)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages pkg-config)
  #:export (
            waterfox-bin-pkg
            windsurf-bin
            offpunk
            brscan5-bin
            megasync-bin
            google-cloud-cli-bq
            google-cloud-cli-gsutil
            google-cloud-cli-python3
            gke-gcloud-auth-plugin
            ironwail
            jdtls-bin
            irpf2025-bin
            xdg-su
            ))

;;; -------------------------------------------------------
;;; 1. waterfox-bin-pkg
;;; -------------------------------------------------------

(define-public waterfox-bin-pkg
  (package
    (name "waterfox-bin-pkg")
    (version "6.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cdn1.waterfox.net/waterfox/releases/" version "/Linux_x86_64/waterfox-" version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("waterfox" "lib/waterfox/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/lib/waterfox/waterfox")
                         (string-append bin "/waterfox-bin")))))
          (delete 'install-license-files))))
    (inputs (list bash-minimal))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.waterfox.net")
    (synopsis "privacy-focused web browser based on Firefox")
    (description "Waterfox is a customizable privacy-conscious web browser based on Firefox.\nIt removes telemetry and provides enhanced privacy features while maintaining\nfull compatibility with Firefox extensions.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------
;;; 2. windsurf-bin
;;; -------------------------------------------------------

(define-public windsurf-bin
  (package
    (name "windsurf-bin")
    (version "1.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://windsurf-stable.codeiumdata.com/linux-x64/stable/" "a1b2c3d4e5f6" "/Windsurf-linux-x64-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/windsurf/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/windsurf/windsurf")
                         (string-append bin "/windsurf")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeium.com/windsurf")
    (synopsis "AI-powered code editor based on VS Code")
    (description "Windsurf is an AI-powered code editor built on VS Code with integrated\nAI coding assistance.  It provides intelligent code completion, chat-based\ncoding help, and automated refactoring powered by Codeium.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 3. offpunk
;;; -------------------------------------------------------

(define-public offpunk
  (package
    (name "offpunk")
    (version "2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sr.ht/~lioce/offpunk/refs/download/v" version "/offpunk-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'sanity-check))))
    (home-page "https://sr.ht/~lioce/offpunk/")
    (synopsis "offline-first terminal browser for Gemini, Gopher, and the web")
    (description "Offpunk is a command-line and offline-first browser for the smolnet\n(Gemini, Gopher, Spartan protocols) and the web.  It downloads pages for\noffline reading and supports bookmarks, subscriptions, and a reading list.")
    (license license:agpl3+)))

;;; -------------------------------------------------------
;;; 4. brscan5-bin
;;; -------------------------------------------------------

(define-public brscan5-bin
  (package
    (name "brscan5-bin")
    (version "1.3.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.brother.com/welcome/dlf104036/brscan5-" version "-0.amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/brscan5/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (native-inputs (list dpkg))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.brother.com")
    (synopsis "Brother SANE scanner driver for compatible models")
    (description "Brscan5 provides SANE-compatible scanner drivers from Brother for\nmultifunction printers and scanners.  It enables scanning from Linux\nusing Brother hardware.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 5. megasync-bin
;;; -------------------------------------------------------

(define-public megasync-bin
  (package
    (name "megasync-bin")
    (version "5.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://mega.nz/linux/repo/xUbuntu_24.04/amd64/megasync_" version "-1.1_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/megasync/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (native-inputs (list dpkg))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mega.io")
    (synopsis "official MEGA desktop synchronization client")
    (description "MEGAsync is the official desktop application for syncing files with MEGA\nCloud Drive.  It provides automatic synchronization, selective sync, and\nend-to-end encryption for secure cloud storage.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 6. google-cloud-cli-bq
;;; -------------------------------------------------------

(define-public google-cloud-cli-bq
  (package
    (name "google-cloud-cli-bq")
    (version "520.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("google-cloud-sdk/bin/bq" "bin/bq")
               ("google-cloud-sdk/platform/bq/" "share/google-cloud-sdk/platform/bq/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cloud.google.com/bigquery/docs/bq-command-line-tool")
    (synopsis "BigQuery command-line tool from Google Cloud SDK")
    (description "The bq command-line tool is part of the Google Cloud SDK and provides\nan interface for interacting with BigQuery.  It supports querying data,\nmanaging datasets, loading and exporting data.")
    (license license:asl2.0)))

;;; -------------------------------------------------------
;;; 7. google-cloud-cli-gsutil
;;; -------------------------------------------------------

(define-public google-cloud-cli-gsutil
  (package
    (name "google-cloud-cli-gsutil")
    (version "520.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("google-cloud-sdk/bin/gsutil" "bin/gsutil")
               ("google-cloud-sdk/platform/gsutil/" "share/google-cloud-sdk/platform/gsutil/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cloud.google.com/storage/docs/gsutil")
    (synopsis "Google Cloud Storage command-line tool")
    (description "Gsutil is a Python application that provides command-line access to\nGoogle Cloud Storage resources.  It supports uploading, downloading,\nand managing objects and buckets.")
    (license license:asl2.0)))

;;; -------------------------------------------------------
;;; 8. google-cloud-cli-python3
;;; -------------------------------------------------------

(define-public google-cloud-cli-python3
  (package
    (name "google-cloud-cli-python3")
    (version "520.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("google-cloud-sdk/platform/bundledpythonunix/" "share/google-cloud-sdk/python3/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cloud.google.com/sdk")
    (synopsis "bundled Python 3 for Google Cloud CLI")
    (description "Provides a bundled Python 3.12 runtime for use with the Google Cloud\nCLI.  This ensures consistent behavior regardless of the system Python\nversion installed.")
    (license license:asl2.0)))

;;; -------------------------------------------------------
;;; 9. gke-gcloud-auth-plugin
;;; -------------------------------------------------------

(define-public gke-gcloud-auth-plugin
  (package
    (name "gke-gcloud-auth-plugin")
    (version "520.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("google-cloud-sdk/bin/gke-gcloud-auth-plugin" "bin/gke-gcloud-auth-plugin"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cloud.google.com/kubernetes-engine")
    (synopsis "GKE authentication plugin for gcloud")
    (description "Authentication plugin for kubectl to authenticate with GKE clusters\nusing gcloud credentials.  Required for GKE cluster access with\nKubernetes client-go credential plugins.")
    (license license:asl2.0)))

;;; -------------------------------------------------------
;;; 10. ironwail
;;; -------------------------------------------------------

(define-public ironwail
  (package
    (name "ironwail")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/andrei-drexler/ironwail/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:make-flags #~(list (string-append "prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list sdl2 libvorbis libmad))
    (home-page "https://github.com/andrei-drexler/ironwail")
    (synopsis "high-performance Quake engine fork of QuakeSpasm")
    (description "Ironwail is a fork of QuakeSpasm focusing on high performance instead\nof maximum compatibility.  It features multithreaded rendering, async\ntexture loading, and various rendering improvements for playing Quake\nand its expansions.")
    (license license:gpl2+)))

;;; -------------------------------------------------------
;;; 11. jdtls-bin
;;; -------------------------------------------------------

(define-public jdtls-bin
  (package
    (name "jdtls-bin")
    (version "1.44.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.eclipse.org/jdtls/milestones/" version "/jdt-language-server-" version "-202501301930.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/jdtls/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/eclipse-jdtls/eclipse.jdt.ls")
    (synopsis "Eclipse JDT Language Server for Java development")
    (description "Eclipse JDT Language Server provides Java language support via the\nLanguage Server Protocol.  It enables Java editing, compilation,\ndebugging, and refactoring in any LSP-compatible editor.")
    (license license:epl1.0)))

;;; -------------------------------------------------------
;;; 12. irpf2025-bin
;;; -------------------------------------------------------

(define-public irpf2025-bin
  (package
    (name "irpf2025-bin")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://downloadirpf.receita.fazenda.gov.br/irpf/2025/irpf/arquivos/IRPF2025Linux-x86_64v1.0.bin")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/irpf2025/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (inputs (list bash-minimal icedtea))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.gov.br/receitafederal")
    (synopsis "Brazilian income tax declaration program (IRPF 2025)")
    (description "IRPF2025 is the official Brazilian Federal Revenue Service application\nfor filing personal income tax returns.  It provides forms, calculations,\nand electronic submission of tax declarations.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 13. xdg-su
;;; -------------------------------------------------------

(define-public xdg-su
  (package
    (name "xdg-su")
    (version "1.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pwnage-inc/xdg-su")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pwnage-inc/xdg-su")
    (synopsis "run a program as root using a graphical authentication agent")
    (description "Xdg-su runs a program as root using the most appropriate graphical\nauthentication agent available on the desktop.  It detects KDE, GNOME,\nand other desktop environments and uses the corresponding privilege\nescalation tool.")
    (license license:gpl2+)))
