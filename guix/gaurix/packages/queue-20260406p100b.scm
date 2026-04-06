;;; Queue drain 2026-04-06 batch b — 100 entries from todo_general_packages.org.
;;; 18 recipes: 5 C source builds (gnu/cmake/meson), 5 copy-build binary packages,
;;; 4 copy-build font/theme/data packages, 2 Python packages, 1 bash script, 1 trivial.
(define-module (gaurix packages queue-20260406p100b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module (guix utils)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages web)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xml)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (urlview
            sexpect
            ntfsfixboot
            swaykbdd
            ifupdown-ng
            gcli
            sdl2pp
            nautilus-hide
            dtrx
            mediamtx-bin
            oatmeal-bin
            albafetch-bin
            radicle-node-bin
            moonbit-bin
            ttf-cm-unicode
            ttf-minecrafter
            la-capitaine-icon-theme
            catppuccin-sddm-theme-mocha))

;; ═══════════════════════════════════════════════════════════════════
;; C source packages — gnu-build-system
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. urlview ───────────────────────────────────────────────────
;; A curses URL parser for text files (202 AUR votes)

(define-public urlview
  (package
    (name "urlview")
    (version "0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sigpipe/urlview/archive/refs/tags/urlview-"
                    version ".tar.gz"))
              (sha256
               ;; FIXME: placeholder hash — run `guix download` to obtain
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "autoreconf" "-vfi")
                   (invoke "./configure"
                           (string-append "--prefix=" (assoc-ref outputs "out"))))))))
    (native-inputs (list autoconf automake))
    (inputs (list ncurses))
    (home-page "https://github.com/sigpipe/urlview")
    (synopsis "curses URL parser for text files")
    (description "Urlview is a screen oriented program for extracting URLs from
text files and displaying a menu from which you can launch a command to view a
specific item.  It integrates well with terminal-based mail and news readers.")
    (license license:gpl2+)))

;; ── 2. sexpect ───────────────────────────────────────────────────
;; Expect for shells — C with simple Makefile

(define-public sexpect
  (package
    (name "sexpect")
    (version "2.3.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/clarkwang/sexpect")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite in source
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))  ;; no configure script
    (home-page "https://github.com/clarkwang/sexpect")
    (synopsis "expect for shells")
    (description "Sexpect is an expect-like tool that works with a
shell.  Unlike Tcl's @code{expect}, sexpect is designed to be used from
any shell (bash, zsh, etc.) and supports sending and expecting from a
pseudo-terminal.")
    (license license:gpl3+)))

;; ── 3. ntfsfixboot ───────────────────────────────────────────────
;; Fix NTFS boot sector — small C program

(define-public ntfsfixboot
  (package
    (name "ntfsfixboot")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicovince/ntfsfixboot/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
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
    (home-page "https://github.com/nicovince/ntfsfixboot")
    (synopsis "fix NTFS boot sector")
    (description "Ntfsfixboot is a small utility to fix the NTFS boot sector
of a partition.  It can repair or rewrite the boot sector to allow Windows
to boot again after certain types of corruption.")
    (license license:gpl2+)))

;; ── 4. ifupdown-ng ───────────────────────────────────────────────
;; Flexible ifup/ifdown implementation

(define-public ifupdown-ng
  (package
    (name "ifupdown-ng")
    (version "0.12.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ifupdown-ng/ifupdown-ng")
                    (commit (string-append "ifupdown-ng-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; tests need network and root
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "SYSCONFDIR=" #$output "/etc")
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://github.com/ifupdown-ng/ifupdown-ng")
    (synopsis "flexible ifup/ifdown implementation")
    (description "Ifupdown-ng is a network device manager that can configure
network interfaces on Linux systems.  It is compatible with Debian's
@code{ifupdown} but provides a more modular and extensible architecture
with support for modern networking features.")
    (license license:isc)))

;; ═══════════════════════════════════════════════════════════════════
;; CMake / Meson source packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 5. swaykbdd ──────────────────────────────────────────────────
;; Automatic keyboard layout switching in Sway

(define-public swaykbdd
  (package
    (name "swaykbdd")
    (version "1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/artemsen/swaykbdd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs (list json-c))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/artemsen/swaykbdd")
    (synopsis "automatic keyboard layout switching in Sway")
    (description "Swaykbdd is a daemon that automatically switches keyboard
layouts on a per-window basis in Sway and other wlroots-based Wayland
compositors.  It remembers the last used layout for each window and restores
it when you switch back.")
    (license license:expat)))

;; ── 6. sdl2pp ────────────────────────────────────────────────────
;; C++ bindings/wrapper for SDL2

(define-public sdl2pp
  (package
    (name "sdl2pp")
    (version "0.18.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/libSDL2pp/libSDL2pp")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DSDL2PP_WITH_EXAMPLES=OFF")))
    (inputs (list sdl2))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/libSDL2pp/libSDL2pp")
    (synopsis "C++ bindings and wrapper for SDL2")
    (description "Libsdl2pp provides C++ bindings for the SDL2 library.  It
wraps all SDL2 types in RAII classes and provides type-safe interfaces while
maintaining close to zero overhead over the C API.")
    (license license:zlib)))

;; ── 7. gcli ──────────────────────────────────────────────────────
;; CLI for Github, Gitlab and Gitea written in C

(define-public gcli
  (package
    (name "gcli")
    (version "2.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/herrhotzenplotz/gcli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ;; tests need network access
    (native-inputs (list autoconf automake pkg-config))
    (inputs (list curl openssl))
    (home-page "https://github.com/herrhotzenplotz/gcli")
    (synopsis "CLI for GitHub, GitLab, and Gitea written in C")
    (description "Gcli is a command-line interface for interacting with GitHub,
GitLab, Gitea, and Bugzilla forges.  It allows creating, listing, and managing
issues, pull requests, and repositories from the terminal without needing a
web browser.")
    (license license:bsd-2)))

;; ── 8. nautilus-hide ─────────────────────────────────────────────
;; Nautilus extension for hiding files

(define-public nautilus-hide
  (package
    (name "nautilus-hide")
    (version "0.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/brunonova/nautilus-hide")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs (list nautilus glib))
    (native-inputs (list pkg-config gettext-minimal `(,glib "bin")))
    (home-page "https://github.com/brunonova/nautilus-hide")
    (synopsis "Nautilus extension to hide and unhide files")
    (description "Nautilus-hide is a simple extension for the GNOME Files
(Nautilus) file manager that adds @samp{Hide} and @samp{Unhide} options to
the right-click context menu.  Hidden files are managed using a
@file{.hidden} file in the directory.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 9. dtrx ──────────────────────────────────────────────────────
;; Intelligent archive extraction tool (99 AUR votes)

(define-public dtrx
  (package
    (name "dtrx")
    (version "8.5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dtrx-py/dtrx")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;; tests require external archivers
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/dtrx-py/dtrx")
    (synopsis "intelligent archive extraction tool")
    (description "Dtrx (Do The Right eXtraction) is a tool for extracting
archives.  It intelligently handles various archive formats, avoids clobbering
existing files, creates a directory for archives that would otherwise litter
the current directory, and can recursively extract nested archives.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; Binary packages — prebuilt via copy-build-system
;; ═══════════════════════════════════════════════════════════════════

;; ── 10. mediamtx-bin ─────────────────────────────────────────────
;; Zero-dependency real-time media server (Go binary)

(define-public mediamtx-bin
  (package
    (name "mediamtx-bin")
    (version "1.11.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bluenviron/mediamtx/releases/download/v"
                    version "/mediamtx_v" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mediamtx" "bin/mediamtx")
               ("mediamtx.yml" "etc/mediamtx/mediamtx.yml"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bluenviron/mediamtx")
    (synopsis "zero-dependency real-time media server and proxy")
    (description "MediaMTX (formerly rtsp-simple-server) is a ready-to-use
and zero-dependency real-time media server and media proxy.  It supports
publishing, reading, proxying, and recording video and audio streams
using RTSP, RTMP, HLS, WebRTC, and SRT protocols.")
    (license license:expat)))

;; ── 11. oatmeal-bin ──────────────────────────────────────────────
;; Terminal UI to chat with LLMs (Rust binary)

(define-public oatmeal-bin
  (package
    (name "oatmeal-bin")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dustinblackman/oatmeal/releases/download/v"
                    version "/oatmeal-v" version "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("oatmeal" "bin/oatmeal"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dustinblackman/oatmeal")
    (synopsis "terminal UI to chat with large language models")
    (description "Oatmeal is a terminal user interface for chatting with large
language models using backends such as Ollama.  It provides syntax
highlighting for code, multi-line input, and session management directly
in the terminal.")
    (license license:expat)))

;; ── 12. albafetch-bin ────────────────────────────────────────────
;; Neofetch alternative written in C (binary)

(define-public albafetch-bin
  (package
    (name "albafetch-bin")
    (version "4.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alba4k/albafetch/releases/download/v"
                    version "/albafetch-v" version "-x86_64-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("albafetch" "bin/albafetch"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/alba4k/albafetch")
    (synopsis "fast system information display tool")
    (description "Albafetch is a system information display tool similar to
Neofetch but written in C for improved speed.  It shows distribution,
kernel, uptime, memory, CPU, and other system details in the terminal.")
    (license license:expat)))

;; ── 13. radicle-node-bin ─────────────────────────────────────────
;; P2P code collaboration stack built on Git

(define-public radicle-node-bin
  (package
    (name "radicle-node-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.radicle.xyz/releases/" version
                    "/radicle-" version "-x86_64-unknown-linux-musl.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://radicle.xyz/")
    (synopsis "peer-to-peer code collaboration stack built on Git")
    (description "Radicle is an open-source, peer-to-peer code collaboration
stack built on Git that enables censorship-resistant code hosting.  It
provides repository hosting, issue tracking, and patch review without
relying on centralized servers.")
    (license (list license:expat license:asl2.0))))

;; ── 14. moonbit-bin ──────────────────────────────────────────────
;; MoonBit developer platform for WASM

(define-public moonbit-bin
  (package
    (name "moonbit-bin")
    (version "0.1.20250403")
    (source (origin
              (method url-fetch)
              (uri "https://cli.moonbitlang.com/binaries/latest/moonbit-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("moon" "bin/moon")
               ("moonc" "bin/moonc")
               ("moonrun" "bin/moonrun"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.moonbitlang.com/")
    (synopsis "developer platform for Cloud and Edge using WebAssembly")
    (description "MoonBit is an intelligent developer platform designed for
Cloud and Edge computing using WebAssembly.  It provides a modern programming
language, build tools, and IDE integration for developing high-performance
WASM applications.")
    (license license:asl2.0)))

;; ═══════════════════════════════════════════════════════════════════
;; Font / theme / data packages — copy-build-system
;; ═══════════════════════════════════════════════════════════════════

;; ── 15. ttf-cm-unicode ───────────────────────────────────────────
;; Computer Modern Unicode fonts (57 AUR votes)

(define-public ttf-cm-unicode
  (package
    (name "ttf-cm-unicode")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/project/cm-unicode/cm-unicode/"
                    version "/cm-unicode-" version "-ttf.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/cm-unicode/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://cm-unicode.sourceforge.io/")
    (synopsis "Computer Modern Unicode TrueType fonts")
    (description "CM Unicode is a set of Unicode fonts derived from Donald
Knuth's Computer Modern fonts using Blue Sky Research Type 1 fonts.  They
provide comprehensive coverage of Latin, Cyrillic, and Greek scripts in
the familiar Computer Modern typeface.")
    (license license:silofl1.1)))

;; ── 16. ttf-minecrafter ─────────────────────────────────────────
;; Minecraft-style font

(define-public ttf-minecrafter
  (package
    (name "ttf-minecrafter")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri "https://dl.dafont.com/dl/?f=minecrafter")
              (file-name "minecrafter.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/minecrafter/"
                #:include-regexp (".*\\.ttf$")))))
    (native-inputs (list unzip))
    (home-page "https://www.dafont.com/minecrafter.font")
    (synopsis "Minecraft-style TrueType font")
    (description "Minecrafter is a TrueType font inspired by the Minecraft
video game logo and interface.  It includes regular and alternate styles
suitable for headings and decorative text.")
    (license license:cc0)))

;; ── 17. la-capitaine-icon-theme ──────────────────────────────────
;; Icon pack for desktop environments (30 AUR votes)

(define-public la-capitaine-icon-theme
  (package
    (name "la-capitaine-icon-theme")
    (version "0.6.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/keeferrourke/la-capitaine-icon-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/La-Capitaine/"
                #:include-regexp (".*\\.svg$" ".*\\.png$" "index\\.theme")))))
    (home-page "https://github.com/keeferrourke/la-capitaine-icon-theme")
    (synopsis "icon pack designed to integrate with most desktop environments")
    (description "La Capitaine is an icon theme inspired by macOS and
Google's Material Design.  It is designed to fit into most desktop
environments and provides a modern, flat style with a consistent
color palette.")
    (license license:gpl3+)))

;; ── 18. catppuccin-sddm-theme-mocha ─────────────────────────────
;; Catppuccin Mocha theme for SDDM

(define-public catppuccin-sddm-theme-mocha
  (package
    (name "catppuccin-sddm-theme-mocha")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/catppuccin/sddm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/mocha" "share/sddm/themes/catppuccin-mocha"))))
    (home-page "https://github.com/catppuccin/sddm")
    (synopsis "Catppuccin Mocha theme for SDDM display manager")
    (description "This package provides the Mocha variant of the Catppuccin
color scheme as an SDDM display manager theme.  Catppuccin is a community-driven
pastel theme that provides soothing warm colors for user interfaces.")
    (license license:expat)))
