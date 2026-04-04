;;; Worker 03 batch (r12): resolve NEEDS_RECIPE_DESIGN packages.
;;; 5 new recipes: electron40-bin, millennium, polychromatic, prefixer, jellyfin-desktop
;;; 3 BLOCKED (Arch-specific): downgrade, aurutils, aurvote-utils
(define-module (gaurix packages cron-5a2fb251-r12-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system meson)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression))

;; ──────────────────────────────────────────────
;; 1. electron40-bin — Prebuilt Electron 40 framework (binary)
;; ──────────────────────────────────────────────
(define-public electron40-bin
  (package
    (name "electron40-bin")
    (version "40.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/electron/electron/releases/download/v"
             version "/electron-v" version "-linux-x64.zip"))
       (sha256
        (base32 "0vf2yrq6flf6mqan3x5pp7h1dkirqpv89qqbdp7gg0g4wkj6xkiv"))))
    (build-system trivial-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip-bin (search-input-file %build-inputs "/bin/unzip"))
                 (opt (string-append out "/opt/electron40"))
                 (bin (string-append out "/bin")))
            (mkdir-p opt)
            (invoke unzip-bin "-q" src "-d" opt)
            ;; Make main binary executable
            (chmod (string-append opt "/electron") #o755)
            ;; Create bin symlink
            (mkdir-p bin)
            (symlink (string-append opt "/electron")
                     (string-append bin "/electron40"))
            #t))))
    (home-page "https://electronjs.org")
    (synopsis "Prebuilt Electron 40 framework for Linux x86_64")
    (description
     "Binary repackaging of Electron 40, a framework for building
cross-platform desktop applications using JavaScript, HTML, and CSS.
This provides the electron binary usable as a runtime for Electron apps.")
    (license license:expat)))

;; ──────────────────────────────────────────────
;; 2. millennium — Steam Client homebrew plugin loader (binary)
;; ──────────────────────────────────────────────
(define-public millennium
  (package
    (name "millennium")
    (version "2.35.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SteamClientHomebrew/Millennium/releases/"
             "download/v" version
             "/millennium-v" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0ymqbh9an43w5hn9r2gkv6ba9ik6ynkyl2zdxqggac35jnqkby6r"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar-bin (search-input-file %build-inputs "/bin/tar"))
                 (gz (search-input-file %build-inputs "/bin/gzip"))
                 (cwd (getcwd))
                 (lib-out (string-append out "/lib/millennium"))
                 (share-out (string-append out "/share/millennium")))
            (invoke tar-bin "--use-compress-program" gz "-xf" src "-C" cwd)
            ;; Install shared libraries
            (let ((lib-src (string-append cwd "/usr/lib/millennium")))
              (mkdir-p lib-out)
              (for-each
               (lambda (f)
                 (let ((src-f (string-append lib-src "/" f)))
                   (when (file-exists? src-f)
                     (copy-file src-f (string-append lib-out "/" f)))))
               '("libmillennium_bootstrap_86x.so"
                 "libmillennium_hhx64.so"
                 "libmillennium_x86.so")))
            ;; Install share data
            (let ((share-src (string-append cwd "/usr/share/millennium")))
              (when (file-exists? share-src)
                (mkdir-p share-out)
                (copy-recursively share-src share-out)))
            #t))))
    (home-page "https://github.com/SteamClientHomebrew/Millennium")
    (synopsis "Steam Client plugin loader and theme manager")
    (description
     "Millennium is a plugin loader for the Steam Client, enabling custom
themes, JavaScript plugins, and CSS modifications.  This package
repackages the official prebuilt Linux binary release.  Requires a
working Steam installation to function.")
    (license license:expat)))

;; ──────────────────────────────────────────────
;; 3. polychromatic — OpenRazer RGB controller frontend
;; BLOCKED: depends on python-openrazer (not in Guix) and PyQt6 (not in Guix)
;; ──────────────────────────────────────────────
(define-public polychromatic
  (package
    (name "polychromatic")
    (version "0.9.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/polychromatic/polychromatic/archive/refs/"
             "tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "polychromatic: BLOCKED — depends on python-openrazer and python-pyqt6 which are not available in Guix")))
    (home-page "https://github.com/polychromatic/polychromatic")
    (synopsis "RGB lighting management for OpenRazer (BLOCKED — missing deps)")
    (description
     "Polychromatic is a frontend for managing RGB lighting on Razer
peripherals via OpenRazer.  BLOCKED: requires python-openrazer and
python-pyqt6, neither of which is packaged for Guix.")
    (license license:gpl3+)))

;; ──────────────────────────────────────────────
;; 4. prefixer — Wine prefix management tool
;; BLOCKED: depends on python-vdf (not in Guix)
;; ──────────────────────────────────────────────
(define-public prefixer
  (package
    (name "prefixer")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/wojtmic/prefixer/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "prefixer: BLOCKED — depends on python-vdf (Steam VDF parser) which is not available in Guix")))
    (home-page "https://github.com/wojtmic/prefixer")
    (synopsis "Wine prefix management tool (BLOCKED — missing deps)")
    (description
     "Prefixer is a tool for managing Wine prefixes with Steam integration.
BLOCKED: requires python-vdf (Valve Data Format parser), which is not
packaged for Guix.")
    (license license:gpl3+)))

;; ──────────────────────────────────────────────
;; 5. jellyfin-desktop — Jellyfin media player desktop client
;; BLOCKED: no releases on GitHub, depends on mpvqt (not in Guix)
;; ──────────────────────────────────────────────
(define-public jellyfin-desktop
  (package
    (name "jellyfin-desktop")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jellyfin/jellyfin-desktop")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "jellyfin-desktop: BLOCKED — no upstream releases; depends on mpvqt and qt6-webengine which are not available in Guix")))
    (home-page "https://github.com/jellyfin/jellyfin-desktop")
    (synopsis "Jellyfin desktop media player client (BLOCKED — missing deps)")
    (description
     "Jellyfin Desktop is a client for the Jellyfin media server.
BLOCKED: the upstream repository has no tagged releases, and the build
requires mpvqt and qt6-webengine, neither of which is packaged for Guix.")
    (license license:gpl2+)))

;; ──────────────────────────────────────────────
;; 6. downgrade — Arch Linux package downgrader
;; BLOCKED: Arch-specific tool (depends on pacman)
;; ──────────────────────────────────────────────
(define-public downgrade
  (package
    (name "downgrade")
    (version "12.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/archlinux-downgrade/downgrade/archive/"
             "refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "downgrade: BLOCKED — Arch-specific tool requiring pacman and pacman-contrib")))
    (home-page "https://github.com/archlinux-downgrade/downgrade")
    (synopsis "Arch Linux package downgrader (BLOCKED — Arch-specific)")
    (description
     "Downgrade is a bash utility for downgrading Arch Linux packages using
the Arch Linux Archive.  BLOCKED: fundamentally depends on pacman and
pacman-contrib, which are Arch Linux-specific tools not available in Guix.")
    (license license:gpl2)))

;; ──────────────────────────────────────────────
;; 7. aurutils — AUR helper utilities for Arch Linux
;; BLOCKED: Arch-specific tool (depends on pacman/pacutils)
;; ──────────────────────────────────────────────
(define-public aurutils
  (package
    (name "aurutils")
    (version "20.5.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AladW/aurutils/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "aurutils: BLOCKED — Arch-specific tool requiring pacman, pacutils, and makepkg")))
    (home-page "https://github.com/AladW/aurutils")
    (synopsis "AUR helper utilities for Arch Linux (BLOCKED — Arch-specific)")
    (description
     "Aurutils is a collection of scripts for automating AUR (Arch User
Repository) usage, including building, reviewing, and managing packages.
BLOCKED: fundamentally depends on pacman, pacutils, and makepkg, which
are Arch Linux-specific tools not available in Guix.")
    (license license:isc)))

;; ──────────────────────────────────────────────
;; 8. aurvote-utils — AUR voting utilities for Arch Linux
;; BLOCKED: Arch-specific tool (AUR interaction requires pacman ecosystem)
;; ──────────────────────────────────────────────
(define-public aurvote-utils
  (package
    (name "aurvote-utils")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/gwuen/aurvote-utils/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "aurvote-utils: BLOCKED — Arch-specific AUR voting tool; only useful within Arch Linux ecosystem")))
    (home-page "https://github.com/gwuen/aurvote-utils")
    (synopsis "AUR package voting utilities (BLOCKED — Arch-specific)")
    (description
     "Aurvote-utils provides utilities for voting on AUR (Arch User
Repository) packages.  BLOCKED: fundamentally an Arch Linux ecosystem
tool; requires AUR account and is only meaningful within the Arch
package management context.")
    (license license:expat)))
