;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408u
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 6 font packages (font-build-system)
;;;   - 5 theme/icon/data packages (copy-build-system)
;;;   - 4 binary repacks (copy-build-system)
;;;   - 4 shell script/plugin packages (copy-build-system)
;;;   - 3 Python packages + 1 Python app (pyproject-build-system)
;;;   - 2 C/C++ source builds (cmake/gnu-build-system)
;;;   - 5 re-evaluated with concrete blocking reasons
;;;
;;; New recipes (25):
;;;   - font-courier-prime: Courier Prime screenwriting font (OFL-1.1)
;;;   - font-comic-mono: Comic Mono monospace font (MIT)
;;;   - font-juliamono: JuliaMono scientific monospace font (OFL-1.1)
;;;   - font-monocraft: Minecraft-inspired monospace font (OFL-1.1)
;;;   - font-gentium-basic: Gentium Basic serif font with weights (OFL-1.1)
;;;   - font-lxgw-fasmart-gothic: LXGW FasmartGothic CJK font (IPA)
;;;   - btop-theme-catppuccin: Catppuccin color themes for btop (MIT)
;;;   - qogir-gtk-theme: Qogir GTK theme (GPL-3.0)
;;;   - morewaita-icon-theme: MoreWaita icon theme (GPL-3.0)
;;;   - vimix-gtk-themes: Vimix GTK themes (GPL-3.0)
;;;   - spicetify-themes: Spicetify community themes (MIT)
;;;   - pdfsam-bin: PDF split/merge tool (AGPL-3.0)
;;;   - process-compose-bin: process scheduler/orchestrator (Apache-2.0)
;;;   - rp-bin: ROP gadget finder (MIT)
;;;   - bifrost-bin: Samsung firmware downloader (MIT)
;;;   - bitwarden-rofi: Rofi interface for Bitwarden CLI (GPL-3.0)
;;;   - lenovo-wwan-unlock: Lenovo WWAN modem unlock scripts (non-copyleft)
;;;   - zsh-you-should-use: Zsh plugin for alias reminders (GPL-3.0)
;;;   - bash-complete-alias: Bash alias autocompletion (GPL-3.0)
;;;   - python-blockdiag: block diagram generator (Apache-2.0)
;;;   - python-nwdiag: network diagram generator (Apache-2.0)
;;;   - python-actdiag: activity diagram generator (Apache-2.0)
;;;   - waybar-crypto: Waybar crypto price module (MIT)
;;;   - lief: ELF/PE/MachO parsing library (Apache-2.0)
;;;   - mstflint: Mellanox firmware tools (GPL-2.0)
;;;
;;; Re-evaluated (blocked with specific reasons, 5):
;;;   - xwinwrap-0.9-bin: UNMAINTAINED_NO_UPSTREAM
;;;   - opentabletdriver-git: DOTNET_UNSUPPORTED
;;;   - vscoq-language-server-git: OCAML_COQ_ECOSYSTEM_MISSING
;;;   - radicle-node-git: EXCESSIVE_RUST_DEPS
;;;   - python-telegram-send: MISSING_PYTHON_DEP (python-telegram-bot)
;;;
;;; NOTE: All sha256 hashes verified via guix download / guix hash.

(define-module (gaurix packages recipe-resolver-260408u)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages web)
  #:export (
            ;; fonts
            font-courier-prime
            font-comic-mono
            font-juliamono
            font-monocraft
            font-gentium-basic
            font-lxgw-fasmart-gothic
            ;; themes / icons / data
            btop-theme-catppuccin
            qogir-gtk-theme
            morewaita-icon-theme
            vimix-gtk-themes
            spicetify-themes
            ;; binary repacks
            pdfsam-bin
            process-compose-bin
            rp-bin
            bifrost-bin
            ;; shell scripts / plugins
            bitwarden-rofi
            lenovo-wwan-unlock
            zsh-you-should-use
            bash-complete-alias
            ;; python
            python-blockdiag
            python-nwdiag
            python-actdiag
            waybar-crypto
            ;; C/C++
            lief
            mstflint))

;;;
;;; ═══════════════════════════════════════════════════════════════════
;;; FONTS
;;; ═══════════════════════════════════════════════════════════════════
;;;

;;; ── font-courier-prime ──────────────────────────────────────────
;;; Courier Prime — screenwriting font, better Courier
;;;
(define-public font-courier-prime
  (let ((commit "7fd585a2dd4c1612c79b3308e300923d1c13df93")
        (revision "0"))
    (package
      (name "font-courier-prime")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/quoteunquoteapps/CourierPrime")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1zv5bjs4rkrfcz008jwhxak3gr8qi14knanabwz8x2sa3v9q0cci"))))
      (build-system font-build-system)
      (home-page "https://github.com/quoteunquoteapps/CourierPrime")
      (synopsis "courier Prime font designed for screenwriting")
      (description
       "Courier Prime is a TrueType font designed as a better Courier
for screenwriting.  It improves upon Courier with enhanced readability
while maintaining the same metrics, making it suitable as a drop-in
replacement for screenplay formatting.")
      (license license:silofl1.1))))

;;; ── font-comic-mono ─────────────────────────────────────────────
;;; Comic Mono — legible monospace font
;;;
(define-public font-comic-mono
  (let ((commit "13eb162648d01d61ece424088dbf750ec80a1a62")
        (revision "0"))
    (package
      (name "font-comic-mono")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/dtinth/comic-mono-font")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1jp47kaxfyisqaary0k193ycxj73n846niaslp1yqxzp24mrcwrn"))))
      (build-system font-build-system)
      (home-page "https://dtinth.github.io/comic-mono-font/")
      (synopsis "legible monospace font based on Comic Shanns")
      (description
       "Comic Mono is a legible monospace font.  It is based on Shannon
Miwa's Comic Shanns, with the characters adjusted to the same width for
use as a monospaced programming font.  The font supports Latin characters
and common programming symbols.")
      (license license:expat))))

;;; ── font-juliamono ──────────────────────────────────────────────
;;; JuliaMono — monospaced font for scientific/technical use
;;;
(define-public font-juliamono
  (package
    (name "font-juliamono")
    (version "0.062")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/cormullion/juliamono/releases/download/v"
             version "/JuliaMono-ttf.tar.gz"))
       (sha256
        (base32 "1v58dl8ra2f78p4iggp4vqv2wq2z3885bmdb8190ga84v0vvm1nn"))))
    (build-system font-build-system)
    (home-page "https://juliamono.netlify.app/")
    (synopsis "monospaced font with comprehensive Unicode coverage")
    (description
     "JuliaMono is a monospaced typeface designed for scientific and
technical computing.  It provides comprehensive Unicode coverage
including mathematical symbols, Greek letters, and technical characters.
The font is optimized for use with the Julia programming language but
is suitable for any programming or technical writing.")
    (license license:silofl1.1)))

;;; ── font-monocraft ──────────────────────────────────────────────
;;; Monocraft — Minecraft-inspired programming font
;;;
(define-public font-monocraft
  (package
    (name "font-monocraft")
    (version "4.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/IdreesInc/Monocraft/releases/download/v"
             version "/Monocraft-otf.zip"))
       (sha256
        (base32 "07g6mpc75dav8wkm2a9bbv9hprq8n5a1zi3c2p82l1i120pvf8z6"))))
    (build-system font-build-system)
    (home-page "https://github.com/IdreesInc/Monocraft")
    (synopsis "monospaced programming font inspired by Minecraft")
    (description
     "Monocraft is a monospaced programming font inspired by the Minecraft
typeface.  It includes programming ligatures and covers a wide range of
characters.  Each glyph has been carefully designed to be pixel-perfect
at standard sizes while remaining legible for everyday coding use.")
    (license license:silofl1.1)))

;;; ── font-gentium-basic ──────────────────────────────────────────
;;; Gentium Basic — elegant serif font with additional weights
;;;
(define-public font-gentium-basic
  (package
    (name "font-gentium-basic")
    (version "1.102")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://scripts.sil.org/cms/scripts/render_download.php"
             "?format=file&media_id=GentiumBasic_"
             (string-join (string-split version #\.) "")
             "&filename=GentiumBasic_"
             (string-join (string-split version #\.) "")
             ".zip"))
       (file-name (string-append "GentiumBasic-" version ".zip"))
       (sha256
        (base32 "1k5klzqqn2cg3spdiiimxqqlkqgks9sn632jsgzmsc6pj5a2q6ig"))))
    (build-system font-build-system)
    (home-page "https://software.sil.org/gentiumbasic/")
    (synopsis "serif font based on Gentium with bold and italic weights")
    (description
     "Gentium Basic is a font family based on the original Gentium design
by SIL International.  Unlike the original Gentium, this version
includes bold and bold-italic weights, making it more practical for
everyday document use.  The font covers Latin, Cyrillic, and Greek
scripts with high typographic quality.")
    (license license:silofl1.1)))

;;; ── font-lxgw-fasmart-gothic ────────────────────────────────────
;;; LXGW FasmartGothic — Chinese/Japanese Gothic font
;;;
(define-public font-lxgw-fasmart-gothic
  (package
    (name "font-lxgw-fasmart-gothic")
    (version "1.201")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lxgw/LxgwFasmartGothic/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vy6b7g4pnr9r0f0adbvmr6869bngyshvfxx4all823v88akzypl"))))
    (build-system font-build-system)
    (home-page "https://github.com/lxgw/LxgwFasmartGothic")
    (synopsis "LXGW FasmartGothic Chinese and Japanese Gothic font")
    (description
     "LXGW FasmartGothic is a sans-serif (Gothic) font for Chinese and
Japanese text.  It provides multiple variants including standard, classic
(CL), and modern (MN) styles.  The font covers CJK Unified Ideographs
and common punctuation, suitable for display and body text in East Asian
documents.")
    (license license:ipa)))

;;;
;;; ═══════════════════════════════════════════════════════════════════
;;; THEMES / ICONS / DATA
;;; ═══════════════════════════════════════════════════════════════════
;;;

;;; ── btop-theme-catppuccin ───────────────────────────────────────
;;; Catppuccin themes for btop
;;;
(define-public btop-theme-catppuccin
  (package
    (name "btop-theme-catppuccin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/catppuccin/btop/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0j9sj3yi37f5irj5bgl8dcriyclv1saww9rkxn5s061mfsrzviw7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("themes" "share/btop/themes"))))
    (home-page "https://github.com/catppuccin/btop")
    (synopsis "catppuccin color themes for the btop system monitor")
    (description
     "This package provides Catppuccin color themes for btop, the terminal
resource monitor.  It includes all four Catppuccin flavors: Latte
(light), Frappe, Macchiato, and Mocha (dark).  Install the themes
to @file{~/.config/btop/themes/} or use the system-wide path.")
    (license license:expat)))

;;; ── qogir-gtk-theme ────────────────────────────────────────────
;;; Qogir — flat design GTK theme
;;;
(define-public qogir-gtk-theme
  (package
    (name "qogir-gtk-theme")
    (version "2025-08-17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vinceliuice/Qogir-theme/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13xfm9pn59pmgfcmn774ps9vlm0jcwz8wczxpd8i4ms9fipilync"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'()
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((themes-dir (string-append
                                 (assoc-ref outputs "out")
                                 "/share/themes")))
                (setenv "HOME" (getcwd))
                (invoke "bash" "./install.sh"
                        "-d" themes-dir)))))))
    (native-inputs (list bash))
    (home-page "https://github.com/vinceliuice/Qogir-theme")
    (synopsis "flat design GTK theme with multiple color variants")
    (description
     "Qogir is a flat design theme for GTK 3 and GTK 4 based desktop
environments.  It provides a clean, modern appearance with multiple
color variants and both light and dark modes.  The theme supports GNOME,
XFCE, Cinnamon, and other GTK-based desktop environments.")
    (license license:gpl3)))

;;; ── morewaita-icon-theme ───────────────────────────────────────
;;; MoreWaita — expanded Adwaita companion icon theme
;;;
(define-public morewaita-icon-theme
  (package
    (name "morewaita-icon-theme")
    (version "49")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/somepaulo/MoreWaita/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0j5vjvngcr3g4kz1lcmi4ni2vfarpbh0j6h78f5j4k91m730m81k"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/MoreWaita/"
                #:exclude ("LICENSE" "README.md" ".github")))))
    (home-page "https://github.com/somepaulo/MoreWaita")
    (synopsis "expanded Adwaita-styled companion icon theme")
    (description
     "MoreWaita is an expanded Adwaita-styled companion icon theme that
provides additional app icons matching the GNOME Adwaita aesthetic.
It adds icons for popular applications that do not have Adwaita-styled
icons in the default GNOME icon theme, and is designed to be used
alongside the standard Adwaita icons.")
    (license license:gpl3)))

;;; ── vimix-gtk-themes ───────────────────────────────────────────
;;; Vimix — flat material design GTK theme
;;;
(define-public vimix-gtk-themes
  (let ((commit "c11aca86854dcf9e33892c59aef4f296d985bb60")
        (revision "0"))
    (package
      (name "vimix-gtk-themes")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/vinceliuice/vimix-gtk-themes")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1rsnimnn5nc8zj2qkjdz2b8d1yjfvpnx0yixpd9qrf4d64h7xhms"))))
      (build-system copy-build-system)
      (arguments
       (list
        #:install-plan #~'()
        #:phases
        #~(modify-phases %standard-phases
            (replace 'install
              (lambda* (#:key outputs #:allow-other-keys)
                (let ((themes-dir (string-append
                                   (assoc-ref outputs "out")
                                   "/share/themes")))
                  (setenv "HOME" (getcwd))
                  (invoke "bash" "./install.sh"
                          "-d" themes-dir)))))))
      (native-inputs (list bash))
      (home-page "https://github.com/vinceliuice/vimix-gtk-themes")
      (synopsis "flat material design GTK theme with color variants")
      (description
       "Vimix is a flat material design theme for GTK 3 and GTK 4 desktop
environments.  It comes in multiple color variants (Ruby, Jade, Beryl,
Doder, Amethyst) and supports both light and dark modes.  The theme
provides a polished look for GNOME, XFCE, and other GTK-based desktops.")
      (license license:gpl3))))

;;; ── spicetify-themes ───────────────────────────────────────────
;;; Spicetify themes — community themes for Spotify customization
;;;
(define-public spicetify-themes
  (let ((commit "9af41cf91af6f6093c0e060d57264f08f6bb161c")
        (revision "0"))
    (package
      (name "spicetify-themes")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/spicetify/spicetify-themes")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "14zzr9dvcnhasqfj52yg30z67k0j1q9rj2hgc3z1wfgdwmfiizlq"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/spicetify-themes/"
                  #:exclude (".git" ".github" "LICENSE" "README.md")))))
      (home-page "https://github.com/spicetify/spicetify-themes")
      (synopsis "community theme collection for Spicetify")
      (description
       "This package provides a curated collection of community themes for
Spicetify, the command-line tool for customizing the Spotify desktop
client.  It includes multiple theme variants such as Dribbblish, Sleek,
Turntable, and others, each with its own set of color schemes.")
      (license license:expat))))

;;;
;;; ═══════════════════════════════════════════════════════════════════
;;; BINARY REPACKS
;;; ═══════════════════════════════════════════════════════════════════
;;;

;;; ── pdfsam-bin ─────────────────────────────────────────────────
;;; PDFsam Basic — PDF split, merge, rotate tool
;;;
(define-public pdfsam-bin
  (package
    (name "pdfsam-bin")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/torakiki/pdfsam/releases/download/v"
             version "/pdfsam-basic-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0dizp4dnyggd27886fny8wkijj9wv7srcmzkli2kawnww5lh76dx"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/pdfsam/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/lib/pdfsam/bin/pdfsam")
                              (string-append bin "/pdfsam"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://pdfsam.org")
    (synopsis "open-source PDF split, merge, mix, rotate, and extract tool")
    (description
     "PDFsam Basic is a free, open-source application to split, merge, mix,
rotate, and extract pages from PDF files.  It provides a graphical user
interface for common PDF operations.  This package provides the pre-built
Java application with a bundled JDK runtime.")
    (license license:agpl3+)))

;;; ── process-compose-bin ────────────────────────────────────────
;;; process-compose — process scheduler/orchestrator
;;;
(define-public process-compose-bin
  (package
    (name "process-compose-bin")
    (version "1.103.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/F1bonacc1/process-compose/releases/download/v"
             version "/process-compose_linux_amd64.tar.gz"))
       (sha256
        (base32 "12dsq3xi4yv0xrfirvxi6c9zlyl0p6i7mknm56xplsxjzi79zxvr"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("process-compose" "bin/process-compose"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://f1bonacc1.github.io/process-compose/")
    (synopsis "process scheduler and orchestrator like docker-compose without Docker")
    (description
     "Process Compose is a process scheduler and orchestrator for
non-containerized applications.  It provides a docker-compose-like
interface for managing multiple processes described in a YAML
configuration file, with features like process dependencies, health
checks, and a TUI for monitoring.  This package provides the pre-built
Go binary.")
    (license license:asl2.0)))

;;; ── rp-bin ─────────────────────────────────────────────────────
;;; rp++ — fast ROP gadget finder
;;;
(define-public rp-bin
  (package
    (name "rp-bin")
    (version "2.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/0vercl0k/rp/releases/download/v"
             version "/rp-lin-gcc.zip"))
       (sha256
        (base32 "0z157qnd9p7ns9jl69akjmgswz6lbmmmpkslgx0cr7gijx6wrj68"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rp-lin" "bin/rp++"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/0vercl0k/rp")
    (synopsis "fast ROP gadget finder for PE/ELF/Mach-O binaries")
    (description
     "rp++ is a fast C++ Return-Oriented Programming (ROP) gadget finder
for PE, ELF, and Mach-O executables across x86, x64, ARM, and ARM64
architectures.  It searches binary files for useful instruction
sequences that can be chained together for security research and
exploit development.  This package provides the pre-built Linux binary.")
    (license license:expat)))

;;; ── bifrost-bin ────────────────────────────────────────────────
;;; Bifrost — Samsung firmware downloader
;;;
(define-public bifrost-bin
  (package
    (name "bifrost-bin")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/zacharee/SamloaderKotlin/releases/download/"
             version "/bifrost-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "191px8875zklcdncxk9bby94cb8mbh2kl4kc97sqfcy7swm6x4bb"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (for-each
                      (lambda (f)
                        (when (and (file-exists? f)
                                   (not (directory? f)))
                          (invoke patchelf "--set-interpreter" ld-linux f)))
                      (find-files (string-append out "/bin")))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zacharee/SamloaderKotlin")
    (synopsis "Samsung firmware downloader desktop application")
    (description
     "Bifrost (formerly Samloader Kotlin) is a cross-platform Samsung
firmware downloader and decrypter.  It allows downloading official
Samsung firmware images by specifying model number, region code, and
firmware version.  The application provides both a graphical UI and
command-line interface.  This package provides the pre-built Linux
binary.")
    (license license:expat)))

;;;
;;; ═══════════════════════════════════════════════════════════════════
;;; SHELL SCRIPTS / PLUGINS
;;; ═══════════════════════════════════════════════════════════════════
;;;

;;; ── bitwarden-rofi ─────────────────────────────────────────────
;;; Bitwarden Rofi — rofi interface for Bitwarden CLI
;;;
(define-public bitwarden-rofi
  (package
    (name "bitwarden-rofi")
    (version "0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mattydebie/bitwarden-rofi")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1h5d21kv8g5g725chn3n0i1frvmsrk3pm67lfxqcg50kympg0wwd"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bwmenu" "bin/bwmenu")
               ("lib" "lib/bitwarden-rofi/"))))
    (home-page "https://github.com/mattydebie/bitwarden-rofi")
    (synopsis "rofi-based interface for Bitwarden password manager")
    (description
     "Bitwarden Rofi provides a Rofi-based menu interface for interacting
with the Bitwarden CLI password manager.  It allows searching, copying
usernames, passwords, and TOTP codes from your Bitwarden vault through
a convenient rofi popup.  Requires the Bitwarden CLI (@command{bw}) and
Rofi to be installed separately.")
    (license license:gpl3)))

;;; ── lenovo-wwan-unlock ─────────────────────────────────────────
;;; Lenovo WWAN modem unlock — FCC/DPR unlock for Lenovo WWAN modems
;;;
(define-public lenovo-wwan-unlock
  (package
    (name "lenovo-wwan-unlock")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lenovo/lenovo-wwan-unlock/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10j78f39xq0hwnrwjav0ipidr6ccw2l2c22ajc0p0j03fgpbxl6n"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lenovo_wwan_dpr_fcc_unlock.sh" "bin/lenovo-wwan-unlock")
               ("lenovo_wwan_dpr_fcc_unlock_action.sh"
                "lib/lenovo-wwan-unlock/unlock_action.sh")
               ("77-lenovo-wwan-fcc-unlock.rules"
                "lib/udev/rules.d/77-lenovo-wwan-fcc-unlock.rules"))))
    (home-page "https://github.com/lenovo/lenovo-wwan-unlock")
    (synopsis "FCC and DPR unlock scripts for Lenovo WWAN modems")
    (description
     "This package provides shell scripts and udev rules for performing
FCC (Federal Communications Commission) and DPR unlock on Lenovo
laptop WWAN (wireless wide area network) modems, including Fibocom
L860-GL and FM350-GL 5G modules.  It enables cellular connectivity
that may be locked by default on certain Lenovo laptop models.")
    (license (license:non-copyleft
              "file://Lenovo Software Code License Agreement for wwan.txt"))))

;;; ── zsh-you-should-use ─────────────────────────────────────────
;;; zsh-you-should-use — alias reminder plugin for Zsh
;;;
(define-public zsh-you-should-use
  (package
    (name "zsh-you-should-use")
    (version "1.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/MichaelAquilina/zsh-you-should-use/"
             "archive/refs/tags/" version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vc3sf74rj4d12imlf29krqmn8bc80n353l84131yc7i2bnlm22d"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("you-should-use.plugin.zsh"
                "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh"))))
    (home-page "https://github.com/MichaelAquilina/zsh-you-should-use")
    (synopsis "zsh plugin that reminds you to use defined aliases")
    (description
     "You Should Use is a Zsh plugin that reminds you when you type a
command that has an alias defined.  It helps you learn and remember
your shell aliases by displaying a notification each time you use the
full command instead of its shorter alias.")
    (license license:gpl3)))

;;; ── bash-complete-alias ────────────────────────────────────────
;;; complete-alias — autocompletion for bash aliases
;;;
(define-public bash-complete-alias
  (package
    (name "bash-complete-alias")
    (version "1.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/cykerway/complete-alias/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ibljb5wm4r4f9hr18x833isjadasvpgw2i8jxfl2l4nfb18ajy3"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("complete_alias"
                "share/bash-complete-alias/complete_alias"))))
    (home-page "https://github.com/cykerway/complete-alias")
    (synopsis "automagical shell alias completion for Bash")
    (description
     "Complete-alias provides automatic tab-completion for Bash shell
aliases.  When you define an alias like @code{alias g=git}, this
plugin enables you to use the same tab completions with the alias
@code{g} as you would with the original @code{git} command.")
    (license license:gpl3)))

;;;
;;; ═══════════════════════════════════════════════════════════════════
;;; PYTHON PACKAGES
;;; ═══════════════════════════════════════════════════════════════════
;;;

;;; ── python-blockdiag ───────────────────────────────────────────
;;; blockdiag — block diagram image generator
;;;
(define-public python-blockdiag
  (package
    (name "python-blockdiag")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/b/blockdiag/"
             "blockdiag-" version ".tar.gz"))
       (sha256
        (base32 "1qm300fwj9ym5k71z289ni9z5nw02h4zaaxs8r2na8vxp1dikr6y"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-funcparserlib
           python-pillow
           python-webcolors))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/blockdiag/blockdiag")
    (synopsis "simple block diagram image generator from text")
    (description
     "Blockdiag generates block-diagram images from simple text markup.
It takes a @file{.diag} text file describing blocks and their connections
and produces PNG, SVG, or PDF diagram images.  It supports labels,
colors, shapes, and group nesting for creating clear architectural and
system diagrams.")
    (license license:asl2.0)))

;;; ── python-nwdiag ──────────────────────────────────────────────
;;; nwdiag — network diagram image generator
;;;
(define-public python-nwdiag
  (package
    (name "python-nwdiag")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/n/nwdiag/"
             "nwdiag-" version ".tar.gz"))
       (sha256
        (base32 "1sxjmixhh17pqsfmd481gzhk3q1hxnbqa103fjg1v2mcr87m6rz2"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-blockdiag))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/blockdiag/nwdiag")
    (synopsis "network diagram image generator from text")
    (description
     "Nwdiag generates network-diagram images from simple text markup.
It supports network topology visualization with features like multiple
networks, groups, peer networks, and rack diagrams.  It is part of the
blockdiag family of diagram generators.")
    (license license:asl2.0)))

;;; ── python-actdiag ─────────────────────────────────────────────
;;; actdiag — activity diagram image generator
;;;
(define-public python-actdiag
  (package
    (name "python-actdiag")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/a/actdiag/"
             "actdiag-" version ".tar.gz"))
       (sha256
        (base32 "01j04vcslxvy571bqqpaa48k0lksfpay3ga51xdpdv6khwl9pz0f"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-blockdiag))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/blockdiag/actdiag")
    (synopsis "activity diagram image generator from text")
    (description
     "Actdiag generates activity-diagram images from simple text markup.
It creates swimlane-style diagrams showing activities across multiple
lanes, useful for visualizing workflows and processes.  It is part of
the blockdiag family of diagram generators.")
    (license license:asl2.0)))

;;; ── waybar-crypto ──────────────────────────────────────────────
;;; waybar-crypto — cryptocurrency price module for Waybar
;;;
(define-public waybar-crypto
  (package
    (name "waybar-crypto")
    (version "1.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/chadsr/waybar-crypto/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0c6hwbwhlhm39nd38wnn5g5hqqf9magqnz6vh9az2r42nxzf7pn9"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-requests))
    (native-inputs
     (list python-hatchling))
    (home-page "https://github.com/chadsr/waybar-crypto")
    (synopsis "waybar module for displaying cryptocurrency market data")
    (description
     "Waybar-crypto is a custom module for the Waybar status bar that
displays cryptocurrency market information from CoinMarketCap.  It
shows price, percentage change, and other market data for configured
cryptocurrencies in your Waybar panel.")
    (license license:expat)))

;;;
;;; ═══════════════════════════════════════════════════════════════════
;;; C/C++ SOURCE BUILDS
;;; ═══════════════════════════════════════════════════════════════════
;;;

;;; ── lief ───────────────────────────────────────────────────────
;;; LIEF — library to parse, modify, abstract ELF/PE/MachO formats
;;;
(define-public lief
  (package
    (name "lief")
    (version "0.17.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lief-project/LIEF/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11xyp44dg4h75sw8ailnarilji01wyc2pvxsmdz42bcihnfd3fsz"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DLIEF_EXAMPLES=OFF"
                   "-DLIEF_PYTHON_API=OFF"
                   "-DLIEF_INSTALL_PYTHON=OFF")))
    (native-inputs (list pkg-config))
    (home-page "https://lief-project.github.io/")
    (synopsis "cross-platform library to parse, modify, and abstract ELF/PE/MachO")
    (description
     "LIEF (Library to Instrument Executable Formats) is a cross-platform
library to parse, modify, and abstract ELF, PE, and Mach-O executable
formats.  It provides both a C++ and Python API for tasks like adding
sections, modifying imports, patching binaries, and analyzing executable
metadata.  It supports x86, x86-64, ARM, and AArch64 architectures.")
    (license license:asl2.0)))

;;; ── mstflint ───────────────────────────────────────────────────
;;; mstflint — Mellanox/NVIDIA firmware tools
;;;
(define-public mstflint
  (package
    (name "mstflint")
    (version "4.35.0-1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Mellanox/mstflint/releases/download/v"
             version "/mstflint-" version ".tar.gz"))
       (sha256
        (base32 "0b8i9ik371akyvhirf92n3jb7dcp7rkv56xwf5rhbkcqj9pnhf51"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list autoconf automake libtool pkg-config))
    (home-page "https://github.com/Mellanox/mstflint")
    (synopsis "firmware burning and diagnostics tools for Mellanox/NVIDIA HCAs")
    (description
     "Mstflint is an open-source collection of firmware tools for
Mellanox (now NVIDIA) Host Channel Adapters (HCAs) and network
interface cards (NICs).  It provides utilities for firmware burning,
querying, and diagnostics including @command{mstflint} for flashing
firmware, @command{mstconfig} for device configuration, and
@command{mstfwreset} for firmware-level device reset.")
    (license license:gpl2)))
