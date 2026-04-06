;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #30h.
;;; 9 new recipes: 6 binary (gittop-bin, spek-rs-bin, par-term-bin,
;;; par-fractal-bin, kairo-bin, supersonic-desktop-bin),
;;; 2 themes/fonts (rose-pine-cursor, otf-monocraft),
;;; 1 cursor theme (catppuccin-cursors-latte).
;;; 1 upstream re-export (nnn-icons -> nnn).
;;; 20 re-blocked with specific reasons.

(define-module (gaurix packages queue-20260406-nrd30h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix utils)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages file-systems)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (gittop-bin
            spek-rs-bin
            par-term-bin
            par-fractal-bin
            kairo-bin
            supersonic-desktop-bin
            rose-pine-cursor
            catppuccin-cursors-latte
            otf-monocraft))

;; ═══════════════════════════════════════════════════════════════════
;; Binary packages (copy-build-system)
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. gittop-bin (3788) ─────────────────────────────────────────
;; Lightweight GitHub notifications client built with Iced.

(define-public gittop-bin
  (package
    (name "gittop-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AmarBego/GitTop/releases/download/v"
                    version "/gittop-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "1ds3hyqbqrw1vrh2nk1dw0s0429p4f28gq6dk53n9sf7ly0rlqr5"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gittop" "bin/gittop"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight GitHub notifications client")
    (description "GitTop is a lightweight GitHub notifications client built
with Iced.  It provides a desktop interface for monitoring GitHub
notifications.")
    (home-page "https://github.com/AmarBego/GitTop")
    (license license:agpl3)))

;; ── 2. spek-rs-bin (3810) ────────────────────────────────────────
;; Acoustic spectrum analyser written in Rust.

(define-public spek-rs-bin
  (package
    (name "spek-rs-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/patryk-ku/spek-rs/releases/download/v"
                    version "/spek-rs"))
              (sha256
               (base32 "1l4bp1p59vb3qx0l6mx0dlbqg1y0fxq43ri79107fajqm7bhgjn8"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("spek-rs" "bin/spek-rs"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'make-executable
                 (lambda _
                   (chmod "spek-rs" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "acoustic spectrum analyser written in Rust")
    (description "Spek-rs is an acoustic spectrum analyser, a Spek alternative
written in Rust.  It displays a spectrogram visualization of audio files.")
    (home-page "https://github.com/patryk-ku/spek-rs")
    (license license:expat)))

;; ── 3. par-term-bin (3440) ───────────────────────────────────────
;; GPU-accelerated terminal emulator with inline graphics.

(define-public par-term-bin
  (package
    (name "par-term-bin")
    (version "0.30.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/paulrobello/par-term/releases/download/v"
                    version "/par-term-linux-x86_64"))
              (sha256
               (base32 "02jx77839k20rncjvnzg5saivgyr7hyfc7s6mfygm4jhvsixyzig"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("par-term-linux-x86_64" "bin/par-term"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'make-executable
                 (lambda _
                   (chmod "par-term-linux-x86_64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "GPU-accelerated terminal emulator with inline graphics")
    (description "Par-term is a GPU-accelerated terminal emulator supporting
Sixel, iTerm2, and Kitty image protocols for inline graphics display.")
    (home-page "https://github.com/paulrobello/par-term")
    (license license:expat)))

;; ── 4. par-fractal-bin (3443) ────────────────────────────────────
;; GPU-accelerated fractal renderer built with Rust and WebGPU.

(define-public par-fractal-bin
  (package
    (name "par-fractal-bin")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/paulrobello/par-fractal/releases/download/v"
                    version "/par-fractal-linux-x86_64"))
              (sha256
               (base32 "14a3qqjfq01d6c3jpk8g3g7rv5is03xdsgd86r5dc9nx2yg6gm75"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("par-fractal-linux-x86_64" "bin/par-fractal"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'make-executable
                 (lambda _
                   (chmod "par-fractal-linux-x86_64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "GPU-accelerated fractal renderer using WebGPU")
    (description "Par-fractal is a GPU-accelerated fractal renderer built with
Rust and WebGPU.  It generates and displays various fractal patterns using the
GPU for fast rendering.")
    (home-page "https://github.com/paulrobello/par-fractal")
    (license license:expat)))

;; ── 5. kairo-bin (3774) ─────────────────────────────────────────
;; CLI and desktop app for smart URL routing.

(define-public kairo-bin
  (package
    (name "kairo-bin")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aelesbao/kairo/releases/download/v"
                    version "/kairo-" version
                    "-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32 "1qi1214kx28fqf8kckyikalgas80419ih1f6ss0xszxg6lz7aysa"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kairo" "bin/kairo"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI and desktop app for smart URL routing")
    (description "Kairo is a CLI and desktop application for smart URL
routing.  It allows defining rules to open URLs in specific browsers or
applications based on patterns.")
    (home-page "https://github.com/aelesbao/kairo")
    (license license:asl2.0)))

;; ── 6. supersonic-desktop-bin (3772) ─────────────────────────────
;; Lightweight desktop client for Subsonic music servers.

(define-public supersonic-desktop-bin
  (package
    (name "supersonic-desktop-bin")
    (version "0.21.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dweymouth/supersonic/releases/download/v"
                    version "/Supersonic-" version
                    "-linux-x64-libmpv2.tar.xz"))
              (sha256
               (base32 "0ipafrc4r8f6s5qkr79mrjq1xxgbl857qx6bfpg0k1afy3zmn968"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("supersonic" "bin/supersonic"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight desktop client for Subsonic music servers")
    (description "Supersonic is a lightweight cross-platform desktop client for
Subsonic-compatible music servers.  It supports browsing, streaming, and
managing music libraries hosted on Subsonic, Navidrome, and similar servers.")
    (home-page "https://github.com/dweymouth/supersonic")
    (license license:gpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; Cursor themes and fonts (copy-build-system)
;; ═══════════════════════════════════════════════════════════════════

;; ── 7. rose-pine-cursor (3770) ───────────────────────────────────
;; Rosé Pine cursor theme.

(define-public rose-pine-cursor
  (package
    (name "rose-pine-cursor")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rose-pine/cursor/releases/download/v"
                    version "/BreezeX-RosePine-Linux.tar.xz"))
              (sha256
               (base32 "1bx1i499978flp467kvcnpkdjy1bfz79g2k3kwh61r70x2fdac5k"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("BreezeX-RosePine-Linux"
                "share/icons/BreezeX-RosePine-Linux"))))
    (synopsis "soho vibes cursor theme for desktop environments")
    (description "Rosé Pine cursor theme is a BreezeX-based cursor set with
the Rosé Pine color palette.  It provides a cohesive set of cursors for use
with desktop environments supporting XCursor.")
    (home-page "https://github.com/rose-pine/cursor")
    (license license:gpl3)))

;; ── 8. catppuccin-cursors-latte (3781) ───────────────────────────
;; Catppuccin Latte cursor theme.

(define-public catppuccin-cursors-latte
  (package
    (name "catppuccin-cursors-latte")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/catppuccin/cursors/releases/download/v"
                    version "/catppuccin-latte-dark-cursors.zip"))
              (sha256
               (base32 "16cnbzf57vz9pc5bbmyxv30mdk58kmjgn6kahxmxxkb7sg1cyf8b"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("catppuccin-latte-dark-cursors"
                "share/icons/catppuccin-latte-dark-cursors"))))
    (synopsis "soothing pastel mouse cursors, Latte variant")
    (description "Catppuccin cursors provide a soothing pastel cursor theme
based on the Catppuccin color palette.  This is the Latte (light) variant
with dark cursor outlines.")
    (home-page "https://github.com/catppuccin/cursors")
    (license license:gpl2)))

;; ── 9. otf-monocraft (3785) ─────────────────────────────────────
;; Minecraft-inspired monospace programming font.

(define-public otf-monocraft
  (package
    (name "otf-monocraft")
    (version "4.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/IdreesInc/Monocraft/releases/download/v"
                    version "/Monocraft-otf.zip"))
              (sha256
               (base32 "07g6mpc75dav8wkm2a9bbv9hprq8n5a1zi3c2p82l1i120pvf8z6"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/" #:include-regexp (".*\\.otf$")))))
    (synopsis "programming font inspired by Minecraft typeface")
    (description "Monocraft is a monospace programming font inspired by the
Minecraft typeface.  Each glyph is designed on a pixel grid to evoke the
blocky aesthetic of Minecraft while remaining readable for code editing.")
    (home-page "https://github.com/IdreesInc/Monocraft")
    (license license:silofl1.1)))
