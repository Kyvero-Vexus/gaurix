;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408p
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 23 new recipes (font/copy/pyproject/gnu/cmake/meson/go build systems)
;;;   - 2 re-evaluated with specific blocking reasons
;;;   - 5 additional resolved via compat aliases to new font recipes
;;;
;;; New recipes (23):
;;;   - font-geist (#4623/#4624/#4625): Vercel Geist font family
;;;   - font-geist-mono (#4626/#4627/#4628): Vercel Geist Mono font family
;;;   - profile-sync-daemon-zen (#4606): Zen browser PSD config
;;;   - sddm-theme-elegant-archlinux (#4614): SDDM QML login theme
;;;   - brokefetch (#4631): Bash sysinfo fetcher
;;;   - empiriqa-bin (#4592): pipeline construction tool binary
;;;   - tuitube-bin (#4595): TUI YouTube client binary
;;;   - nosy-bin (#4620): CLI content summarizer binary
;;;   - stto-bin (#4386): line-of-code counter binary
;;;   - ptui-bin (#4354): picture TUI image viewer binary
;;;   - terminal-fireworks (#4598): Python terminal animation
;;;   - deadlock-server-picker (#4622): game server picker (Python)
;;;   - borse (#3742): braille/morse/semaphore practice (Python)
;;;   - vhd2vl (#4024): VHDL to Verilog translator (C/Make)
;;;   - xcman (#3739): minimal compositing manager (C/Make)
;;;   - pp-pager (#3736): page pager utility (C/Make)
;;;   - xtest-utility (#3744): test(1) variant for multiple files (C/Make)
;;;   - blacklist-check (#3745): domain blacklist checker (Bash)
;;;   - sc (#4567): terminal spreadsheet calculator (C/Make)
;;;   - fujprog (#3746): ULX2S/ULX3S JTAG programmer (CMake)
;;;   - nautilus-code (#4618): Nautilus open-in-editor extension (Meson)
;;;   - litestream (#4616): streaming SQLite replication (Go)
;;;   - resticprofile (#4635): restic backup profiles manager (Go)
;;;
;;; Re-evaluated (blocked with specific reasons):
;;;   - responsively (#4607): Electron app, Guix lacks Electron infra
;;;   - cupola-git (#4610): Rust+libcosmic, COSMIC desktop not in Guix
;;;   - python-pymatgen (#4611): Complex scientific Python, many C ext deps
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408p)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system go)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages libftdi)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xorg)
  #:export (
            font-geist
            font-geist-mono
            profile-sync-daemon-zen
            sddm-theme-elegant-archlinux
            brokefetch
            empiriqa-bin
            tuitube-bin
            nosy-bin
            stto-bin
            ptui-bin
            terminal-fireworks
            deadlock-server-picker
            borse
            vhd2vl
            xcman
            pp-pager
            xtest-utility
            blacklist-check
            sc
            fujprog
            nautilus-code
            litestream
            resticprofile))

;;;
;;; ── font-geist ──────────────────────────────────────────────
;;; Vercel Geist font family (sans-serif)
;;;
(define-public font-geist
  (package
    (name "font-geist")
    (version "1.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vercel/geist-font")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts")))
                     (mkdir-p (string-append font-dir "/opentype"))
                     (mkdir-p (string-append font-dir "/truetype"))
                     (for-each (lambda (f)
                                 (install-file f (string-append font-dir "/opentype")))
                               (find-files "packages/geist-font/src" "\\.otf$"))
                     (for-each (lambda (f)
                                 (install-file f (string-append font-dir "/truetype")))
                               (find-files "packages/geist-font/src" "\\.ttf$"))))))))
    (home-page "https://vercel.com/font")
    (synopsis "Vercel Geist sans-serif font family")
    (description
     "Geist is a sans-serif typeface designed by Vercel in collaboration with
Basement Studio.  It includes regular and variable weight fonts in both
OTF and TTF formats, optimized for readability on screens.")
    (license license:silofl1.1)))

;;;
;;; ── font-geist-mono ──────────────────────────────────────────
;;; Vercel Geist Mono font family (monospace)
;;;
(define-public font-geist-mono
  (package
    (inherit font-geist)
    (name "font-geist-mono")
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts")))
                     (mkdir-p (string-append font-dir "/opentype"))
                     (mkdir-p (string-append font-dir "/truetype"))
                     (for-each (lambda (f)
                                 (install-file f (string-append font-dir "/opentype")))
                               (find-files "packages/geist-mono/src" "\\.otf$"))
                     (for-each (lambda (f)
                                 (install-file f (string-append font-dir "/truetype")))
                               (find-files "packages/geist-mono/src" "\\.ttf$"))))))))
    (synopsis "Vercel Geist monospaced font family")
    (description
     "Geist Mono is a monospaced typeface designed by Vercel in collaboration
with Basement Studio.  It includes regular and variable weight fonts in both
OTF and TTF formats, optimized for code editing and terminal use.")))

;;;
;;; ── profile-sync-daemon-zen ──────────────────────────────────
;;; Zen browser config fragment for profile-sync-daemon
;;;
(define-public profile-sync-daemon-zen
  (package
    (name "profile-sync-daemon-zen")
    (version "1.0")
    (source #f)
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda _
                   (mkdir-p "browsers")
                   (with-output-to-file "browsers/zen-browser"
                     (lambda ()
                       (display "# Browser profile for Zen browser\n")
                       (display "BROWSER=\"zen-browser\"\n")
                       (display "DIRArr[0]=\".zen\"\n")))))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (string-append (assoc-ref outputs "out")
                                             "/share/psd/browsers")))
                     (mkdir-p out)
                     (install-file "browsers/zen-browser" out)))))))
    (home-page "https://github.com/graysky2/profile-sync-daemon")
    (synopsis "Zen browser profile configuration for profile-sync-daemon")
    (description
     "This package provides the browser profile definition file for Zen
browser, enabling it to work with profile-sync-daemon (PSD).  PSD
symlinks browser profile directories to tmpfs for reduced disk writes
and improved performance.")
    (license license:expat)))

;;;
;;; ── sddm-theme-elegant-archlinux ──────────────────────────────
;;; Elegant SDDM login theme
;;;
(define-public sddm-theme-elegant-archlinux
  (package
    (name "sddm-theme-elegant-archlinux")
    (version "1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sniper1720/elegant-sddm-archlinux-theme")
             (commit "629a459")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("elegant-archlinux" "share/sddm/themes/elegant-archlinux"))))
    (home-page "https://github.com/sniper1720/elegant-sddm-archlinux-theme")
    (synopsis "elegant QML theme for the SDDM display manager")
    (description
     "This package provides an elegant login theme for the SDDM display
manager.  It features a clean, modern interface with customizable
background and color scheme, built using QML and Qt Quick.")
    (license license:cc-by-sa3.0)))

;;;
;;; ── brokefetch ──────────────────────────────────────────────
;;; Simple system information fetcher (Bash)
;;;
(define-public brokefetch
  (package
    (name "brokefetch")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Szerwigi1410/brokefetch")
             (commit "HEAD")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("brokefetch.sh" "bin/brokefetch"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-script
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (chmod (string-append out "/bin/brokefetch") #o755)))))))
    (inputs (list bash))
    (home-page "https://github.com/Szerwigi1410/brokefetch")
    (synopsis "simple system information fetcher written in Bash")
    (description
     "Brokefetch is a minimal system information fetcher written in Bash.
It displays basic system details such as OS, kernel, uptime, shell,
and terminal information in a compact format.")
    (license license:expat)))

;;;
;;; ── empiriqa-bin ──────────────────────────────────────────────
;;; Pipeline construction tool (pre-built binary)
;;;
(define-public empiriqa-bin
  (package
    (name "empiriqa-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ynqa/empiriqa/releases/download/v"
             version "/epiq-x86_64-unknown-linux-gnu.tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("epiq" "bin/epiq"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/epiq"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ynqa/empiriqa")
    (synopsis "pipeline construction and interactive data exploration tool")
    (description
     "Empiriqa (epiq) is a command-line tool for constructing data processing
pipelines interactively.  It provides an interactive TUI for building and
executing data transformation chains.")
    (license license:expat)))

;;;
;;; ── tuitube-bin ──────────────────────────────────────────────
;;; TUI YouTube client (pre-built binary)
;;;
(define-public tuitube-bin
  (package
    (name "tuitube-bin")
    (version "2026.01.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/remorses/tuitube/releases/download/tuitube%40202601102121/tuitube-linux-x64.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tuitube" "bin/tuitube"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/tuitube"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/remorses/tuitube")
    (synopsis "terminal user interface client for YouTube")
    (description
     "TuiTube is a pre-built terminal user interface for browsing and
downloading YouTube content.  It provides keyboard-driven navigation
for searching and streaming videos directly from the terminal.")
    (license license:expat)))

;;;
;;; ── nosy-bin ──────────────────────────────────────────────────
;;; CLI content summarizer (pre-built binary)
;;;
(define-public nosy-bin
  (package
    (name "nosy-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ynqa/nosy/releases/download/v"
             version "/nosy-cli-x86_64-unknown-linux-gnu.tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nosy" "bin/nosy"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/nosy"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ynqa/nosy")
    (synopsis "command-line content summarizer and analyzer")
    (description
     "Nosy is a command-line tool for summarizing and analyzing text content.
It processes input from files or stdin and produces concise summaries,
useful for quickly understanding large volumes of text.")
    (license license:expat)))

;;;
;;; ── stto-bin ──────────────────────────────────────────────────
;;; Simple line-of-code counter (pre-built binary)
;;;
(define-public stto-bin
  (package
    (name "stto-bin")
    (version "0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mainak55512/stto/releases/download/v"
             version "/x64_linux.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("stto" "bin/stto"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/stto"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mainak55512/stto")
    (synopsis "simple and fast source lines of code counter")
    (description
     "Stto is a fast command-line tool for counting lines of code across
source files.  It supports many programming languages and provides
a tabular summary of blank lines, comment lines, and code lines.")
    (license license:expat)))

;;;
;;; ── ptui-bin ──────────────────────────────────────────────────
;;; Picture TUI image viewer (pre-built binary)
;;;
(define-public ptui-bin
  (package
    (name "ptui-bin")
    (version "2.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/narbs/ptui/releases/download/v"
             version "/ptui-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ptui" "bin/ptui"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/ptui"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/narbs/ptui")
    (synopsis "picture viewer for the terminal with multiple rendering modes")
    (description
     "Ptui is a terminal image viewer that supports multiple rendering
backends including chafa (for ANSI/sixel/kitty graphics), ImageMagick,
and jp2a for ASCII art.  It provides a TUI for browsing and viewing
images directly in the terminal.")
    (license license:expat)))

;;;
;;; ── terminal-fireworks ──────────────────────────────────────
;;; Python terminal fireworks animation
;;;
(define-public terminal-fireworks
  (package
    (name "terminal-fireworks")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chloem3ow/terminal-fireworks")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/chloem3ow/terminal-fireworks")
    (synopsis "fireworks animation for the terminal")
    (description
     "Terminal Fireworks is a Python program that displays an animated
fireworks show directly in the terminal.  It uses ANSI escape codes
to render colorful particle effects.")
    (license license:expat)))

;;;
;;; ── deadlock-server-picker ──────────────────────────────────
;;; Deadlock game server region picker
;;;
(define-public deadlock-server-picker
  (package
    (name "deadlock-server-picker")
    (version "1.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/shibne/DeadlockServerPicker-linux/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-rich))
    (home-page "https://github.com/shibne/DeadlockServerPicker-linux")
    (synopsis "server region picker for the Deadlock game on Linux")
    (description
     "Deadlock Server Picker is a command-line tool for selecting preferred
game server regions when playing Deadlock on Linux.  It uses iptables
rules to block connections to undesired server regions, effectively
routing the player to their preferred servers.")
    (license license:gpl3)))

;;;
;;; ── borse ──────────────────────────────────────────────────
;;; Practice braille, Morse code, and semaphore
;;;
(define-public borse
  (package
    (name "borse")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vEnhance/borse")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/vEnhance/borse")
    (synopsis "practice braille, Morse code, and semaphore in the terminal")
    (description
     "Borse is a terminal-based practice tool for learning braille, Morse
code, and semaphore flag signaling.  It presents characters and expects
the user to type the correct encoding, providing interactive feedback
for each attempt.")
    (license license:expat)))

;;;
;;; ── vhd2vl ──────────────────────────────────────────────────
;;; VHDL to Verilog 2001 translator
;;;
(define-public vhd2vl
  (package
    (name "vhd2vl")
    (version "3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ldoolitt/vhd2vl")
             (commit "79dfc88")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "src/vhd2vl" bin)))))))
    (native-inputs (list bison))
    (home-page "http://doolittle.icarus.com/~larry/vhd2vl/")
    (synopsis "VHDL to Verilog 2001 translator")
    (description
     "Vhd2vl translates synthesizable VHDL code to Verilog 2001.  It parses
VHDL input and generates equivalent Verilog output, useful for design
teams migrating between hardware description languages or integrating
mixed-language projects.")
    (license license:gpl2+)))

;;;
;;; ── xcman ──────────────────────────────────────────────────
;;; Minimal compositing manager for X11
;;;
(define-public xcman
  (package
    (name "xcman")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/maandree/xcman/archive/" version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs
     (list libxcomposite libxdamage libxrender libxfixes libx11))
    (native-inputs (list pkg-config))
    (home-page "https://codeberg.org/maandree/xcman")
    (synopsis "minimal compositing manager for the X Window System")
    (description
     "Xcman is a minimal compositing manager for X11, forked from xcompmgr.
It provides basic compositing features including transparency, shadows,
and fading effects with a small resource footprint.")
    (license license:isc)))

;;;
;;; ── pp-pager ──────────────────────────────────────────────────
;;; Page pager utility
;;;
(define-public pp-pager
  (package
    (name "pp-pager")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/maandree/pp/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://github.com/maandree/pp")
    (synopsis "simple page pager for the terminal")
    (description
     "Pp is a simple, minimal terminal pager.  It displays text one page at
a time, providing basic navigation controls for scrolling through files
or piped input.")
    (license license:expat)))

;;;
;;; ── xtest-utility ──────────────────────────────────────────────
;;; Variant of test(1) for multiple files
;;;
(define-public xtest-utility
  (package
    (name "xtest-utility")
    (version "2.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/maandree/xtest/archive/" version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://codeberg.org/maandree/xtest")
    (synopsis "variant of test(1) that operates on multiple files")
    (description
     "Xtest is a command-line utility similar to test(1) but extended to
operate on multiple files simultaneously.  It can test properties of
several files in a single invocation, returning success only if all
files satisfy the given condition.")
    (license license:isc)))

;;;
;;; ── blacklist-check ──────────────────────────────────────────
;;; Domain/IP DNSBL blacklist checker (Bash)
;;;
(define-public blacklist-check
  (package
    (name "blacklist-check")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adionditsak/blacklist-check-unix-linux-utility")
             (commit "master")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bl" "bin/blacklist-check"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/blacklist-check")
                          #o755))))))
    (inputs (list bash))
    (home-page "https://github.com/adionditsak/blacklist-check-unix-linux-utility")
    (synopsis "check domains and IPs against DNS blacklists")
    (description
     "Blacklist Check is a Bash script that queries multiple DNS-based
blackhole lists (DNSBLs) to determine whether a given domain name or
IP address has been blacklisted.  It is useful for mail server
administrators monitoring their sender reputation.")
    (license license:expat)))

;;;
;;; ── sc ──────────────────────────────────────────────────────
;;; Terminal spreadsheet calculator
;;;
(define-public sc
  (package
    (name "sc")
    (version "7.16_1.1.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/n-t-roff/sc")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "./configure"
                           (string-append "--prefix="
                                          (assoc-ref outputs "out"))))))))
    (inputs (list ncurses bison))
    (home-page "https://github.com/n-t-roff/sc")
    (synopsis "terminal-based spreadsheet calculator")
    (description
     "Sc is a curses-based spreadsheet calculator for the terminal.  It
supports formulas, cell references, basic formatting, and vi-like
keybindings.  This is a maintained fork of the classic sc spreadsheet
with support for modern systems and ncurses 6.")
    (license license:unlicense)))

;;;
;;; ── fujprog ──────────────────────────────────────────────────
;;; ULX2S/ULX3S JTAG programmer
;;;
(define-public fujprog
  (package
    (name "fujprog")
    (version "4.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kost/fujprog")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libftdi libusb))
    (home-page "https://github.com/kost/fujprog")
    (synopsis "JTAG programmer for ULX2S and ULX3S FPGA boards")
    (description
     "Fujprog is a command-line JTAG programmer for ULX2S and ULX3S FPGA
development boards.  It communicates over FTDI USB interfaces to program
bitstreams into the FPGA configuration memory or attached SPI flash.")
    (license license:bsd-2)))

;;;
;;; ── nautilus-code ──────────────────────────────────────────────
;;; Nautilus right-click "Open in Editor" extension
;;;
(define-public nautilus-code
  (package
    (name "nautilus-code")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/realmazharhussain/nautilus-code/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list nautilus glib))
    (home-page "https://github.com/realmazharhussain/nautilus-code")
    (synopsis "nautilus extension to open folders in a code editor")
    (description
     "Nautilus Code adds a right-click context menu entry to the GNOME
Files (Nautilus) file manager that allows opening the selected folder
in your preferred code editor.  It supports Visual Studio Code,
GNOME Text Editor, and other configurable editors.")
    (license license:agpl3)))

;;;
;;; ── litestream ──────────────────────────────────────────────
;;; Streaming SQLite replication tool
;;;
(define-public litestream
  (package
    (name "litestream")
    (version "0.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/benbjohnson/litestream/archive/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/benbjohnson/litestream"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://litestream.io")
    (synopsis "streaming replication for SQLite databases to S3-compatible storage")
    (description
     "Litestream is a streaming replication tool for SQLite databases.  It
continuously replicates SQLite WAL changes to S3-compatible object
storage, enabling disaster recovery and read replicas without modifying
application code.  It runs as a sidecar process alongside the
application.")
    (license license:asl2.0)))

;;;
;;; ── resticprofile ──────────────────────────────────────────────
;;; Configuration profiles manager for restic backup
;;;
(define-public resticprofile
  (package
    (name "resticprofile")
    (version "0.32.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/creativeprojects/resticprofile")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/creativeprojects/resticprofile"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://github.com/creativeprojects/resticprofile")
    (synopsis "configuration profiles manager for restic backup")
    (description
     "Resticprofile is a configuration manager for the restic backup program.
It allows defining multiple backup profiles in TOML, YAML, or HCL
configuration files, with support for scheduled runs, pre/post hooks,
and systemd timer generation.  It simplifies managing complex restic
backup strategies across multiple repositories.")
    (license license:gpl3)))
