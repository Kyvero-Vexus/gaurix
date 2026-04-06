;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #8.
;;; 12 new recipes: 4 Rust/cargo, 2 Node.js, 1 CMake/Qt6, 1 GNU Make,
;;; 2 copy/trivial (shell scripts, QML configs), 1 Python (copy), 1 split-pkg.
;;; 18 re-blocked with specific reasons.
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd8)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system node)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages node)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages video)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages image)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; Rust packages
            szsol-rs
            swhook
            docx-you-want
            udiskr
            op-cache-git
            ;; Node.js packages
            nodejs-knit
            webtorrent-bittorrent-tracker
            ;; C/Make packages
            nvidia-580xx-settings
            libxnvctrl-580xx
            ;; CMake packages
            noctalia-qs
            ;; Copy/trivial packages
            arch-remaster
            noctalia-shell
            ;; Python packages
            bapctools-git))

;; ═══════════════════════════════════════════════════════════════════
;; Rust packages (cargo-build-system)
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. szsol-rs ──────────────────────────────────────────────────

(define-public szsol-rs
  (package
    (name "szsol-rs")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ghoker143/szsol-rs/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1apcry4awiw8mrwx7mx0h0f7iaadk53ms9r54fsxfnqn6vx40qzz"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (home-page "https://github.com/ghoker143/szsol-rs")
    (synopsis "solitaire card game from SHENZHEN I/O with TUI and solver")
    (description
     "Szsol-rs is a solitaire card game implementation from SHENZHEN I/O,
featuring both a terminal user interface and an automatic solver.  It
supports CLI and TUI modes for playing and solving puzzles.")
    (license license:expat)))

;; ── 2. swhook ────────────────────────────────────────────────────

(define-public swhook
  (package
    (name "swhook")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AndyLocks/swhook/archive/refs/tags/swhook-v"
                    version ".tar.gz"))
              (sha256
               (base32 "1pcn21i4k439qwbn25xlgz1i16061jmvwdrcfg271jfphps9b6i4"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (home-page "https://github.com/AndyLocks/swhook")
    (synopsis "minimalistic webhook server")
    (description
     "Swhook is a minimalistic webhook server written in Rust.  It listens
for incoming HTTP requests and executes configured actions in response
to webhook events.")
    (license license:gpl3+)))

;; ── 3. docx-you-want ────────────────────────────────────────────

(define-public docx-you-want
  (package
    (name "docx-you-want")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MikeWalrus/docx-you-want/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0nlainnyhl60qvbvqpd1brk48980dzn2a6p24df4mxn5svf3vjry"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (home-page "https://github.com/MikeWalrus/docx-you-want")
    (synopsis "unusual PDF-to-DOCX converter")
    (description
     "Docx-you-want is an unusual PDF-to-DOCX converter written in Rust.
It converts PDF documents to DOCX format using Inkscape as a backend
for rendering.")
    (license license:gpl3)))

;; ── 4. udiskr ────────────────────────────────────────────────────

(define-public udiskr
  (package
    (name "udiskr")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/uriib/udiskr/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0jfz4brimcpvizjxk16nx1f6c0fwnmhgdpi3bz7929qj1h1mp2ys"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (inputs (list udisks))
    (home-page "https://github.com/uriib/udiskr")
    (synopsis "lightweight alternative to udiskie for automounting")
    (description
     "Udiskr is a lightweight alternative to udiskie, providing automatic
mounting and unmounting of removable storage devices via UDisks2.")
    (license license:expat)))

;; ── 5. op-cache-git ──────────────────────────────────────────────

(define-public op-cache-git
  (package
    (name "op-cache-git")
    (version "0.0.0.r4.6219481")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/crmne/op-cache")
                    (commit "6219481")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "18wmdf1vwpkisfmi1s3ik9j5w3rkjgwk0mvd8a8sxv6gqyngin6f"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (home-page "https://github.com/crmne/op-cache")
    (synopsis "fast caching proxy for 1Password CLI op read commands")
    (description
     "Op-cache is a fast caching proxy for 1Password CLI @command{op read}
commands.  It reduces latency by caching secret lookups locally via
a Unix domain socket.")
    (license license:expat)))


;; ═══════════════════════════════════════════════════════════════════
;; Node.js packages (node-build-system)
;; ═══════════════════════════════════════════════════════════════════

;; ── 6. nodejs-knit ───────────────────────────────────────────────

(define-public nodejs-knit
  (package
    (name "nodejs-knit")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://registry.npmjs.org/@omnidev/knit/-/knit-"
                    version ".tgz"))
              (sha256
               (base32 "0ndfvqwc3l0wyzqaks1l3bvsn471d2lx297hm1cvasf7wnjrg6k2"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (inputs (list node))
    (home-page "https://github.com/coopbri/knit")
    (synopsis "knit local npm dependencies together")
    (description
     "Knit is a Node.js tool for linking local dependencies together during
development.  It simplifies working with monorepos and multi-package
projects by managing local dependency resolution.")
    (license license:expat)))

;; ── 7. webtorrent-bittorrent-tracker ─────────────────────────────

(define-public webtorrent-bittorrent-tracker
  (package
    (name "webtorrent-bittorrent-tracker")
    (version "11.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://registry.npmjs.org/bittorrent-tracker/-/bittorrent-tracker-"
                    version ".tgz"))
              (sha256
               (base32 "1gvwjg63cfn4kazr125brbfdv2ps3ch3hi1pbar5w0rbis1zw6sf"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (inputs (list node))
    (home-page "https://github.com/webtorrent/bittorrent-tracker")
    (synopsis "simple and robust BitTorrent tracker implementation")
    (description
     "Bittorrent-tracker is a simple, robust BitTorrent tracker (client and
server) implementation for Node.js.  It supports HTTP, UDP, and
WebSocket protocols for both announcing and scraping.")
    (license license:expat)))


;; ═══════════════════════════════════════════════════════════════════
;; C/Make packages (gnu-build-system)
;; ═══════════════════════════════════════════════════════════════════

;; ── 8. nvidia-580xx-settings + libxnvctrl-580xx ──────────────────
;; Split package: nvidia-580xx-settings is the GUI, libxnvctrl-580xx
;; is the shared library extracted from the same source.

(define nvidia-580xx-settings-source
  (origin
    (method url-fetch)
    (uri (string-append
          "https://github.com/NVIDIA/nvidia-settings/archive/"
          "580.142" ".tar.gz"))
    (sha256
     (base32 "1p615wl77ajbkyxjzvhsj3bvi94gv4pbz1caccfp5gb9frk85vyf"))))

(define-public nvidia-580xx-settings
  (package
    (name "nvidia-580xx-settings")
    (version "580.142")
    (source nvidia-580xx-settings-source)
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc"))
                   "NV_USE_BUNDLED_LIBJANSSON=0")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list gtk+ libxv libvdpau))
    (home-page "https://github.com/NVIDIA/nvidia-settings")
    (synopsis "tool for configuring the NVIDIA graphics driver (580xx)")
    (description
     "Nvidia-settings is the official configuration tool for NVIDIA graphics
drivers.  This is the 580xx legacy branch version, providing a graphical
interface to configure display settings, GPU performance, and other
driver parameters.")
    (license license:gpl2)))

(define-public libxnvctrl-580xx
  (package
    (inherit nvidia-580xx-settings)
    (name "libxnvctrl-580xx")
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc"))
                   (string-append "LIBDIR=" #$output "/lib"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda* (#:key make-flags #:allow-other-keys)
                   (apply invoke "make" "-C" "src/libXNVCtrl" make-flags)))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (lib (string-append out "/lib"))
                          (inc (string-append out "/include/NVCtrl")))
                     (mkdir-p lib)
                     (mkdir-p inc)
                     (install-file "src/libXNVCtrl/libXNVCtrl.a" lib)
                     (for-each (lambda (h)
                                 (install-file h inc))
                               (find-files "src/libXNVCtrl" "\\.h$"))))))))
    (inputs (list libx11 libxext))
    (synopsis "NVIDIA NV-CONTROL X extension library (580xx)")
    (description
     "LibXNVCtrl is the NVIDIA NV-CONTROL X extension library, providing
programmatic access to NVIDIA driver settings.  This is the 580xx
legacy branch version.")))


;; ═══════════════════════════════════════════════════════════════════
;; CMake packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 9. noctalia-qs ───────────────────────────────────────────────

(define-public noctalia-qs
  (package
    (name "noctalia-qs")
    (version "0.0.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/noctalia-dev/noctalia-qs/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "14wnxrqhw378rhrkbir1mnk44kn3sf1dg84ac50x21vkad0pbqsx"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase
                  qtdeclarative
                  qtsvg
                  qtwayland
                  wayland
                  wayland-protocols))
    (home-page "https://github.com/noctalia-dev/noctalia-qs")
    (synopsis "custom fork of Quickshell powering Noctalia Shell")
    (description
     "Noctalia-qs is a custom fork of Quickshell, a Qt6/Wayland desktop
shell framework.  It provides the core runtime for the Noctalia Shell
desktop environment, supporting widgets, panels, and system integration
on Wayland compositors.")
    (license license:lgpl3)))


;; ═══════════════════════════════════════════════════════════════════
;; Copy/trivial packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 10. arch-remaster ────────────────────────────────────────────

(define-public arch-remaster
  (package
    (name "arch-remaster")
    (version "26.02.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AdrianTM/arch-remaster/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "11xmq1vygbnflwzankxmpdvdwjpdamx892188d7njark92dp47jy"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("live-remaster" "bin/live-remaster")
               ("update-cow-space" "bin/update-cow-space")
               ("live-remaster.1" "share/man/man1/live-remaster.1")
               ("update-cow-space.1" "share/man/man1/update-cow-space.1"))))
    (inputs (list bash coreutils))
    (home-page "https://github.com/AdrianTM/arch-remaster")
    (synopsis "tools for remastering Arch Linux live systems")
    (description
     "Arch-remaster provides tools for remastering Arch Linux live systems
and updating live USB GRUB configurations.  It includes @command{live-remaster}
for creating modified live images and @command{update-cow-space} for managing
copy-on-write storage.")
    (license license:gpl2+)))

;; ── 11. noctalia-shell ───────────────────────────────────────────

(define-public noctalia-shell
  (package
    (name "noctalia-shell")
    (version "4.7.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/noctalia-dev/noctalia-shell")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "164r2jd7d76kw69bmblfgdp8n6hblp6xz5v0w8knfjcijjw046nk"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "etc/xdg/quickshell/noctalia-shell/"
                #:exclude (".git" ".gitignore" "LICENSE" "README.md")))))
    (inputs (list noctalia-qs))
    (home-page "https://github.com/noctalia-dev/noctalia-shell")
    (synopsis "sleek and minimal desktop shell for Wayland")
    (description
     "Noctalia Shell is a sleek and minimal desktop shell for Wayland
compositors, built on top of Quickshell (noctalia-qs).  It provides
panels, widgets, and system integration using QML configuration files.")
    (license license:expat)))


;; ═══════════════════════════════════════════════════════════════════
;; Python packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 12. bapctools-git ────────────────────────────────────────────

(define-public bapctools-git
  (package
    (name "bapctools-git")
    (version "0.0.0.r1310.9027452")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/RagnarGrootKoerkamp/BAPCtools")
                    (commit "9027452")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0lwia0zwxfnx7wjdbl9drln95d26fg1h73l2zxl9y03ipc7p8lgy"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin" "share/bapctools/bin")
               ("." "share/bapctools/"
                #:include-regexp (".*\\.py$" ".*\\.yaml$" ".*\\.latex$")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (python (search-input-file inputs "bin/python3")))
                     (mkdir-p (string-append out "/bin"))
                     (call-with-output-file (string-append out "/bin/bt")
                       (lambda (port)
                         (format port "#!~a~%import sys, os~%sys.path.insert(0, '~a/share/bapctools')~%os.chdir(os.getcwd())~%exec(open('~a/share/bapctools/bin/tools.py').read())~%"
                                 python out out)))
                     (chmod (string-append out "/bin/bt") #o755)))))))
    (inputs (list python python-yaml python-colorama))
    (home-page "https://github.com/RagnarGrootKoerkamp/BAPCtools")
    (synopsis "tools for developing ICPC-style programming contest problems")
    (description
     "BAPCtools provides a collection of tools for developing ICPC-style
programming contest problems.  It supports problem validation, test
generation, and submission testing for competitive programming contests.")
    (license license:gpl3+)))
