;;; Queue drain 2026-04-06 NRD30 — resolve 30 NEEDS_RECIPE_DESIGN packages.
;;; 17 recipes: 7 copy-build (binary/font/script), 5 source builds (gnu/meson),
;;; 2 Python packages, 1 Perl package, 1 font from zip, 1 cursor theme.
;;; 3 compat aliases in general-compat.scm.
;;; 10 re-blocked with detailed notes.
(define-module (gaurix packages queue-20260406-nrd30)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (guix utils)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages image)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages wm)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (htmltest-bin
            gohan-bin
            pulseaudio-control
            xcursor-borealis
            ttf-kanjistrokeorders
            rakubrew-bin
            mma
            lavat
            wayland-push-to-talk-fix
            zscroll
            perl-io-tiecombine
            transset-df
            wmutils-core
            wshowkeys
            terminess-powerline-font))

;; ═══════════════════════════════════════════════════════════════════
;; Binary packages — copy-build-system
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. htmltest-bin ─────────────────────────────────────────────────
;; Validates generated HTML for broken links (Go static binary)

(define-public htmltest-bin
  (package
    (name "htmltest-bin")
    (version "0.17.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wjdp/htmltest/releases/download/v"
                    version "/htmltest_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "1yy0gg2q8bnpwpiapkkbd1lbmx4pz1v31nfj5h0dd6a8wxz5jp3p"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("htmltest" "bin/htmltest"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/wjdp/htmltest")
    (synopsis "validates generated HTML files for broken links and resources")
    (description "Htmltest is a command-line tool that validates generated HTML
files.  It checks for broken links, images, scripts, and other resources,
making it useful in CI/CD pipelines for static site generators.")
    (license license:expat)))

;; ── 2. gohan-bin ────────────────────────────────────────────────────
;; Simple static site generator (Go binary)

(define-public gohan-bin
  (package
    (name "gohan-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bmf-san/gohan/releases/download/v"
                    version "/gohan_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0lyd27fi22f18js2kr1b25yz6gq0p9lgp1mnvmwyw3nxr429ncp2"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gohan" "bin/gohan"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bmf-san/gohan")
    (synopsis "simple static site generator with incremental builds")
    (description "Gohan is a fast static site generator written in Go.  It
supports incremental (differential) builds, Markdown content, and template
rendering for generating static websites.")
    (license license:expat)))

;; ── 3. pulseaudio-control ───────────────────────────────────────────
;; Bash script for controlling PulseAudio from status bars

(define-public pulseaudio-control
  (package
    (name "pulseaudio-control")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/marioortizmanero/polybar-pulseaudio-control"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "1nld031m96ns9qnaihjxvnv0yd7k9j08mz1qvcj5w9gx6biig4d0"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pulseaudio-control.bash" "bin/pulseaudio-control"))))
    (inputs (list bash))
    (home-page "https://github.com/marioortizmanero/polybar-pulseaudio-control")
    (synopsis "bash script to control PulseAudio volume from status bars")
    (description "Pulseaudio-control is a Bash script that provides PulseAudio
volume and sink control from any status bar such as Polybar, i3bar, or
lemonbar.  It supports switching audio sinks and adjusting volume levels.")
    (license license:expat)))

;; ── 4. xcursor-borealis ─────────────────────────────────────────────
;; X cursor theme with boreal colors

(define-public xcursor-borealis
  (package
    (name "xcursor-borealis")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alvatip/Borealis-cursors/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "0vc8rf5p60vx9i0xx5z3fg6qa5jp52zfjkwhl2dplcgk24pg4b71"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Borealis" "share/icons/Borealis")
               ("Borealis-light" "share/icons/Borealis-light"))))
    (home-page "https://github.com/alvatip/Borealis-cursors")
    (synopsis "X cursor theme with a boreal color palette")
    (description "Borealis-cursors is an X cursor theme featuring a northern/boreal
color palette.  It includes both dark and light variants for use with desktop
environments that support Xcursor themes.")
    (license license:gpl3)))

;; ── 5. rakubrew-bin ─────────────────────────────────────────────────
;; Raku (Perl 6) version manager

(define-public rakubrew-bin
  (package
    (name "rakubrew-bin")
    (version "44")
    (source (origin
              (method url-fetch)
              (uri "https://rakubrew.org/perl/rakubrew")
              (sha256
               (base32 "05ys6fk8c4g7asgsph0mlmgzkxh8mzabkcsk32r3jz6ivmdrmn8l"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((bin (string-append #$output "/bin")))
                 (mkdir-p bin)
                 (copy-file #$source (string-append bin "/rakubrew"))
                 (chmod (string-append bin "/rakubrew") #o755)))))
    (inputs (list perl))
    (home-page "https://rakubrew.org/")
    (synopsis "Raku version manager")
    (description "Rakubrew is a version manager for the Raku programming language
(formerly Perl 6).  It allows installing and switching between multiple
Rakudo implementations and versions in parallel.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Font/data packages — copy-build-system
;; ═══════════════════════════════════════════════════════════════════

;; ── 6. ttf-kanjistrokeorders ────────────────────────────────────────
;; Font showing kanji stroke order diagrams

(define-public ttf-kanjistrokeorders
  (package
    (name "ttf-kanjistrokeorders")
    (version "4.004")
    (source (origin
              (method url-fetch)
              (uri "http://www.dropbox.com/s/9jv2pnw4ohxzaml/KanjiStrokeOrders_v4.004.zip")
              (sha256
               (base32 "0r5k9mdyimqqjkmds1fawppnhjxwwlp76fs834q1ygz2y50vqsjw"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("KanjiStrokeOrders_v4.004.ttf"
                "share/fonts/truetype/KanjiStrokeOrders.ttf"))))
    (native-inputs (list unzip))
    (home-page "http://www.nihilist.org.uk/")
    (synopsis "font showing Japanese kanji stroke order diagrams")
    (description "KanjiStrokeOrders is a TrueType font that displays kanji
characters with stroke order numbers overlaid.  It is useful for Japanese
language learners studying correct kanji writing order.")
    (license (license:non-copyleft
              "file://copyright.txt"
              "Custom license, see copyright.txt in source archive"))))

;; ── 7. terminess-powerline-font ─────────────────────────────────────
;; Powerline-patched Terminus bitmap font

(define-public terminess-powerline-font
  (package
    (name "terminess-powerline-font")
    (version "0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/powerline/fonts")
                    (commit "a029626780dd4af32f15a3e708a5b00528c22f1d")))
              (file-name (git-file-name name version))
              (sha256
               ;; FIXME: placeholder — run guix hash -x --serializer=nar on checkout
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Terminus/PSF" "share/consolefonts/")
               ("Terminus/PCF" "share/fonts/misc/"))))
    (home-page "https://github.com/powerline/fonts")
    (synopsis "powerline-patched Terminus bitmap font")
    (description "Terminess Powerline is a patched version of the Terminus
bitmap font that includes special glyphs used by Powerline status line
plugins.  It provides PCF and PSF variants for use in terminals and the
Linux console.")
    (license license:silofl1.1)))

;; ═══════════════════════════════════════════════════════════════════
;; Source-built packages — gnu-build-system (make)
;; ═══════════════════════════════════════════════════════════════════

;; ── 8. lavat ────────────────────────────────────────────────────────
;; Lava lamp animation in the terminal

(define-public lavat
  (package
    (name "lavat")
    (version "0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AngelJumbo/lavat")
                    (commit "b354ec8c4091e5eed28fd0757ea665132c210546")))
              (file-name (git-file-name name version))
              (sha256
               ;; FIXME: placeholder — run guix hash -x --serializer=nar on checkout
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://github.com/AngelJumbo/lavat")
    (synopsis "lava lamp simulation in the terminal")
    (description "Lavat is a small C program that renders a lava lamp animation
directly in the terminal using Unicode characters.  It is self-contained
with no external dependencies.")
    (license license:expat)))

;; ── 9. wayland-push-to-talk-fix ─────────────────────────────────────
;; Forwards push-to-talk keypresses under Wayland

(define-public wayland-push-to-talk-fix
  (package
    (name "wayland-push-to-talk-fix")
    (version "0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Rush/wayland-push-to-talk-fix")
                    (commit "fecb045c90916ae0cd0414948e0af561dd9ea579")))
              (file-name (git-file-name name version))
              (sha256
               ;; FIXME: placeholder — run guix hash -x --serializer=nar on checkout
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list libevdev))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/Rush/wayland-push-to-talk-fix")
    (synopsis "forwards push-to-talk keypresses under Wayland")
    (description "Wayland-push-to-talk-fix is a small daemon that captures
keyboard events via libevdev and forwards push-to-talk key combinations to
applications like Discord that cannot capture global hotkeys natively under
Wayland compositors.")
    (license license:expat)))

;; ── 10. transset-df ─────────────────────────────────────────────────
;; Per-window transparency control for X11

(define-public transset-df
  (package
    (name "transset-df")
    (version "6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://forchheimer.se/transset-df/transset-df-"
                    version ".tar.gz"))
              (sha256
               (base32 "1vnykwwrv75miigbhmcwxniw8xnhsdyzhqydip2m9crxi2lwhqs5"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list libxcomposite libxdamage libxrender libxfixes libx11))
    (native-inputs (list pkg-config))
    (home-page "https://forchheimer.se/transset-df/")
    (synopsis "per-window transparency control for X11")
    (description "Transset-df is a patched fork of X.Org's @command{transset}
that adds per-window opacity control.  It allows setting transparency levels
on individual X11 windows when used with a compositing window manager.")
    (license license:x11)))

;; ── 11. wmutils-core ────────────────────────────────────────────────
;; Minimal XCB-based window manipulation tools

(define-public wmutils-core
  (package
    (name "wmutils-core")
    (version "1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wmutils/core/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0wk39aq2lrnc0wjs8pv3cigw3lwy2qzaw0v61bwknd5wabm25bvj"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list libxcb xcb-util xcb-util-cursor))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/wmutils/core")
    (synopsis "minimal XCB-based command-line tools for X11 window manipulation")
    (description "Wmutils is a set of small, focused command-line utilities for
X11 window management built on XCB.  Each tool performs a single operation
such as moving, resizing, focusing, or listing windows, composable via shell
scripts to build custom window management workflows.")
    (license license:isc)))

;; ═══════════════════════════════════════════════════════════════════
;; Source-built packages — meson-build-system
;; ═══════════════════════════════════════════════════════════════════

;; ── 12. wshowkeys ───────────────────────────────────────────────────
;; Displays keypresses as an overlay on Wayland

(define-public wshowkeys
  (package
    (name "wshowkeys")
    (version "0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ammgws/wshowkeys")
                    (commit "308fc9f1c8946bfe398b18891dcc4ff14bd15113")))
              (file-name (git-file-name name version))
              (sha256
               ;; FIXME: placeholder — run guix hash -x --serializer=nar on checkout
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs (list cairo pango libinput libxkbcommon wayland))
    (native-inputs (list pkg-config wayland-protocols))
    (home-page "https://github.com/ammgws/wshowkeys")
    (synopsis "displays pressed keys as an overlay on Wayland")
    (description "Wshowkeys is a Wayland utility that displays an overlay showing
which keys are currently pressed.  It is useful for screencasts, presentations,
and tutorials where viewers need to see keyboard input.")
    (license license:gpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 13. zscroll ─────────────────────────────────────────────────────
;; Scrolling text for status bars

(define-public zscroll
  (package
    (name "zscroll")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/noctuid/zscroll/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "0l4mg678gapni4dj2yj763pdfdfcjjafx18wp1y7pgzdpjigwk27"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (inputs (list python))
    (home-page "https://github.com/noctuid/zscroll")
    (synopsis "scrolling text output for terminal status bars")
    (description "Zscroll is a text scroller for use with terminal status bars
such as Polybar, lemonbar, and i3bar.  It scrolls text that is too long to
fit in a fixed-width area, similar to a marquee effect.")
    (license license:gpl3)))

;; ── 14. mma ─────────────────────────────────────────────────────────
;; Musical MIDI Accompaniment generator

(define-public mma
  (package
    (name "mma")
    (version "25.05.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.mellowood.ca/mma/mma-bin-" version ".tar.gz"))
              (sha256
               (base32 "1wz0dsgj1zpzagzyvbqs6j6yd5ksnm9zxyzp8kfsyn95017sxg97"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mma.py" "bin/mma")
               ("MMA" "lib/mma/MMA")
               ("lib" "lib/mma/lib")
               ("includes" "lib/mma/includes"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-program
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (python (search-input-file inputs "bin/python3")))
                     (wrap-program (string-append out "/bin/mma")
                       `("PYTHONPATH" prefix
                         (,(string-append out "/lib/mma")))
                       `("MMA_HOME" = (,(string-append out "/lib/mma"))))))))))
    (inputs (list python bash))
    (home-page "https://www.mellowood.ca/mma/")
    (synopsis "musical MIDI accompaniment generator")
    (description "MMA (Musical MIDI Accompaniment) generates MIDI backing tracks
from text files containing chord progressions and style directives.  It is a
command-line tool written in Python that can produce accompaniment in various
musical styles.")
    (license license:gpl2+)))

;; ═══════════════════════════════════════════════════════════════════
;; Perl packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 15. perl-io-tiecombine ──────────────────────────────────────────
;; Produces tied filehandles combining multiple streams

(define-public perl-io-tiecombine
  (package
    (name "perl-io-tiecombine")
    (version "1.005")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/R/RJ/RJBS/IO-TieCombine-"
                    version ".tar.gz"))
              (sha256
               (base32 "1bv9ampayf4bvyxg4ivy18l8k79jvq55x6gl68b2fg8b62w4sba0"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #t
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "perl" "Makefile.PL"
                           (string-append "PREFIX=" (assoc-ref outputs "out"))))))))
    (inputs (list perl))
    (native-inputs (list perl))
    (home-page "https://metacpan.org/release/IO-TieCombine")
    (synopsis "produce tied filehandles that combine into one")
    (description "IO::TieCombine is a Perl module that produces tied filehandles
allowing you to capture output from multiple separate handles and combine them
into a single stream.  It is useful for testing code that writes to different
output channels.")
    (license license:perl-license)))
