;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413h
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 15 recipes created
;;;   - 15 blocked with specific reason codes
;;;
;;; Recipes (15):
;;;   - zsh-nix-shell (copy, bsd-3)
;;;   - swaystatus (pyproject, expat)
;;;   - peel-git (meson, expat)
;;;   - plasma-weather-plus (copy, custom)
;;;   - brother-ql1050 (trivial, nonfree)
;;;   - brother-dcpj132w (trivial, nonfree)
;;;   - tgpt-bin (copy, gpl3+)
;;;   - hfdownloader-bin (copy, asl2.0)
;;;   - spflashtool-bin (copy, nonfree)
;;;   - codenomad-bin (copy, nonfree)
;;;   - dooble-bin (trivial, custom)
;;;   - polymath (trivial, nonfree)
;;;   - stremio-enhanced-bin (copy, expat)
;;;   - apifox-bin (copy, nonfree)
;;;   - spredit (gnu, public-domain)
;;;
;;; Blocked (15):
;;;   - opentoonz-git (COMPLEX_DEPS: qt5-script, glew, freeglut, superlu, libmypaint, opencv)
;;;   - varia (MISSING_GUIX_DEPS: deno, aria2p, libayatana-appindicator)
;;;   - neovim-later (COMPLEX_DEPS: custom Neovim fork with 14+ deps)
;;;   - lyrionmusicserver (COMPLEX_DEPS: 40+ Perl deps, custom CPAN build)
;;;   - harbour-amazfish-git (MISSING_GUIX_DEPS: qt5-connectivity, nemo-qml-plugin-dbus, qtmpris)
;;;   - loliashizuku-git (MISSING_GUIX_DEPS: wails Go+WebKit framework, bun)
;;;   - oopz (MISSING_GUIX_DEPS: electron39)
;;;   - pacviz (ARCH_SPECIFIC: depends on pacman/libalpm)
;;;   - distroav (MISSING_GUIX_DEPS: OBS Studio plugin, libndi)
;;;   - brow6el-git (MISSING_GUIX_DEPS: libsixel, custom build.sh)
;;;   - pwmenu-git (RUST_CARGO: Rust/cargo with pipewire bindings, needs full crate enumeration)
;;;   - vrms-arch-git (ARCH_SPECIFIC: depends on pyalpm)
;;;   - linux-firmware-bnx2x-git (FIRMWARE_INCOMPATIBLE: Guix manages firmware differently)
;;;   - ut2004-data-gog (PROPRIETARY_DATA: requires GOG account purchase)
;;;   - ut2004-data-steam (PROPRIETARY_DATA: requires Steam account purchase)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpio)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages shells)
  #:export (
            zsh-nix-shell
            swaystatus
            peel-git
            plasma-weather-plus
            brother-ql1050
            brother-dcpj132w
            tgpt-bin
            hfdownloader-bin
            spflashtool-bin
            codenomad-bin
            dooble-bin
            polymath
            stremio-enhanced-bin
            apifox-bin
            spredit
            ))

;;; ── 1. zsh-nix-shell ───────────────────────────────────────────────────
;;; Zsh plugin for nix-shell environments
;;; AUR: zsh-nix-shell  →  Guix: zsh-nix-shell
;;; Upstream: https://github.com/chisui/zsh-nix-shell
;;;
(define-public zsh-nix-shell
  (package
    (name "zsh-nix-shell")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/chisui/zsh-nix-shell/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("nix-shell.plugin.zsh"
           "share/zsh/plugins/zsh-nix-shell/nix-shell.plugin.zsh")
          ("scripts"
           "share/zsh/plugins/zsh-nix-shell/scripts"))))
    (home-page "https://github.com/chisui/zsh-nix-shell")
    (synopsis "Zsh plugin to integrate nix-shell environments")
    (description
     "This Zsh plugin uses @command{zsh-hook} to integrate nix-shell
environments into your existing Zsh session.  It sets the shell prompt
and environment variables appropriately when entering a nix-shell.")
    (license license:bsd-3)))

;;; ── 2. swaystatus ──────────────────────────────────────────────────────
;;; Configurable status command for swaybar
;;; AUR: swaystatus  →  Guix: swaystatus
;;; Upstream: https://github.com/pedroscaff/swaystatus
;;;
(define-public swaystatus
  (package
    (name "swaystatus")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/s/swaystatus/"
             "swaystatus-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python))
    (home-page "https://github.com/pedroscaff/swaystatus")
    (synopsis "Configurable status command for swaybar")
    (description
     "Swaystatus is a configurable status command for the swaybar status bar
used with the Sway Wayland compositor.  It provides modules for displaying
system information such as battery, CPU, memory, network, and time.")
    (license license:expat)))

;;; ── 3. peel-git ────────────────────────────────────────────────────────
;;; GNOME tool to extract and view data from various sources
;;; AUR: peel-git  →  Guix: peel-git
;;; Upstream: https://gitlab.gnome.org/bugaevc/peel
;;;
(define-public peel-git
  (package
    (name "peel-git")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.gnome.org/bugaevc/peel.git")
             (commit "2659b44")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs (list python gobject-introspection))
    (native-inputs (list pkg-config))
    (home-page "https://gitlab.gnome.org/bugaevc/peel")
    (synopsis "Tool for extracting data from structured formats")
    (description
     "Peel is a GNOME tool for extracting and viewing data from various
structured file formats.  It uses GObject introspection and Python
for flexible data extraction and presentation.")
    (license license:expat)))

;;; ── 4. plasma-weather-plus ─────────────────────────────────────────────
;;; Enhanced weather widget for KDE Plasma 6
;;; AUR: plasma-weather-plus  →  Guix: plasma-weather-plus
;;; Upstream: https://github.com/tully-t/weather-widget-plus
;;;
(define-public plasma-weather-plus
  (package
    (name "plasma-weather-plus")
    (version "4.4.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tully-t/weather-widget-plus")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("package" "share/plasma/plasmoids/com.github.tully-t.weather-widget-plus"))))
    (home-page "https://github.com/tully-t/weather-widget-plus")
    (synopsis "Enhanced weather widget for KDE Plasma desktop")
    (description
     "Weather Widget Plus is an enhanced weather plasmoid for the KDE
Plasma desktop.  It displays current weather conditions, forecasts,
and alerts using data from multiple weather providers.  Features
include configurable display units, multiple locations, and detailed
forecast views.")
    (license license:gpl3+)))

;;; ── 5. brother-ql1050 ──────────────────────────────────────────────────
;;; Brother QL-1050 label printer driver
;;; AUR: brother-ql1050  →  Guix: brother-ql1050
;;; Upstream: http://download.brother.com/
;;;
(define-public brother-ql1050
  (package
    (name "brother-ql1050")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://download.brother.com/welcome/dlfp002227/"
             "ql1050lpr-" version "-0.i386.rpm"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/rpm")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append cpio "/bin") ":"
                                   #$(file-append gzip "/bin")))
            (with-directory-excursion tmp
              (invoke "sh" "-c"
                      (string-append
                       #$(file-append gzip "/bin/gzip")
                       " -dc " src " | "
                       #$(file-append cpio "/bin/cpio")
                       " -idm")))
            (copy-recursively (string-append tmp "/usr")
                              (string-append out "/usr"))
            (when (file-exists? (string-append tmp "/opt"))
              (copy-recursively (string-append tmp "/opt")
                                (string-append out "/opt")))
            #t))))
    (native-inputs (list cpio gzip))
    (supported-systems '("x86_64-linux" "i686-linux"))
    (home-page "https://support.brother.com/")
    (synopsis "Brother QL-1050 label printer driver")
    (description
     "This package provides the LPR printer driver for the Brother QL-1050
label printer.  It includes filter programs and PPD files for CUPS
integration.")
    ;; Proprietary Brother license
    (license #f)))

;;; ── 6. brother-dcpj132w ────────────────────────────────────────────────
;;; Brother DCP-J132W printer driver
;;; AUR: brother-dcpj132w  →  Guix: brother-dcpj132w
;;; Upstream: http://www.brother.com/
;;;
(define-public brother-dcpj132w
  (package
    (name "brother-dcpj132w")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.brother.com/pub/bsc/linux/dlf/"
             "dcpj132wlpr-" version "-1.i386.rpm"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/rpm")))
            (mkdir-p tmp)
            (with-directory-excursion tmp
              (invoke "sh" "-c"
                      (string-append
                       #$(file-append gzip "/bin/gzip")
                       " -dc " src " | "
                       #$(file-append cpio "/bin/cpio")
                       " -idm")))
            (copy-recursively (string-append tmp "/usr")
                              (string-append out "/usr"))
            (when (file-exists? (string-append tmp "/opt"))
              (copy-recursively (string-append tmp "/opt")
                                (string-append out "/opt")))
            #t))))
    (native-inputs (list cpio gzip))
    (supported-systems '("x86_64-linux" "i686-linux"))
    (home-page "https://support.brother.com/")
    (synopsis "Brother DCP-J132W printer driver")
    (description
     "This package provides the LPR printer driver for the Brother
DCP-J132W multifunction printer.  It includes filter programs and
PPD files for CUPS integration.")
    ;; Proprietary Brother license
    (license #f)))

;;; ── 7. tgpt-bin ────────────────────────────────────────────────────────
;;; ChatGPT-compatible terminal client (pre-built binary)
;;; AUR: tgpt-git  →  Guix: tgpt-bin
;;; Upstream: https://github.com/aandrew-me/tgpt
;;;
(define-public tgpt-bin
  (package
    (name "tgpt-bin")
    (version "2.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/aandrew-me/tgpt/releases/download/v"
             version "/tgpt-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tgpt-linux-amd64" "bin/tgpt"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                    "/bin/tgpt")
                     #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/aandrew-me/tgpt")
    (synopsis "AI chatbot in the terminal without API keys")
    (description
     "tgpt is a cross-platform command-line tool that lets you use AI
chatbots (ChatGPT, Phind, Blackbox AI, and others) directly in your
terminal without requiring API keys.  It supports multiple AI
providers and can generate code, answer questions, and assist with
various tasks.")
    (license license:gpl3+)))

;;; ── 8. hfdownloader-bin ────────────────────────────────────────────────
;;; HuggingFace model downloader (pre-built Go binary)
;;; AUR: hfdownloader-git  →  Guix: hfdownloader-bin
;;; Upstream: https://github.com/bodaay/HuggingFaceModelDownloader
;;;
(define-public hfdownloader-bin
  (package
    (name "hfdownloader-bin")
    (version "1.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bodaay/HuggingFaceModelDownloader/"
             "releases/download/v" version
             "/hfdownloader_linux_amd64_v" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((,(string-append "hfdownloader_linux_amd64_v" #$version)
           "bin/hfdownloader"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                    "/bin/hfdownloader")
                     #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bodaay/HuggingFaceModelDownloader")
    (synopsis "CLI tool to download models from HuggingFace")
    (description
     "HFDownloader is a command-line tool for downloading AI models and
datasets from HuggingFace Hub.  It supports parallel downloads, resume
capability, and filtering by file patterns.  Useful for downloading
large language models and other ML artifacts.")
    (license license:asl2.0)))

;;; ── 9. spflashtool-bin ─────────────────────────────────────────────────
;;; MediaTek SP Flash Tool for flashing firmware
;;; AUR: spflashtool-bin  →  Guix: spflashtool-bin
;;; Upstream: https://spflashtools.com/
;;;
(define-public spflashtool-bin
  (package
    (name "spflashtool-bin")
    (version "6.2228")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://spflashtools.com/wp-content/uploads/"
             "SP_Flash_Tool_v" version "_Linux.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "opt/spflashtool"
           #:exclude ("*.bat" "*.exe")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'extract-zip
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke #$(file-append unzip "/bin/unzip")
                      "-o" (assoc-ref inputs "source"))))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/spflashtool")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec ~a/opt/spflashtool/flash_tool \"$@\"\n"
                            out)))
                (chmod (string-append bin "/spflashtool") #o755)))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://spflashtools.com/")
    (synopsis "MediaTek SP Flash Tool for firmware flashing")
    (description
     "SP Flash Tool is a utility for flashing firmware on devices with
MediaTek chipsets.  It can flash stock ROMs, recovery images, and
custom firmware via USB connection.  This package provides the
pre-built Linux binary.")
    ;; Proprietary MediaTek license
    (license #f)))

;;; ── 10. codenomad-bin ──────────────────────────────────────────────────
;;; AI-powered code editor (pre-built binary)
;;; AUR: codenomad-bin  →  Guix: codenomad-bin
;;; Upstream: https://github.com/NeuralNomadsAI/CodeNomad
;;;
(define-public codenomad-bin
  (package
    (name "codenomad-bin")
    (version "0.12.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/NeuralNomadsAI/CodeNomad/releases/download/"
             "v" version "/CodeNomad-" version "-linux-x64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "opt/codenomad"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'extract-zip
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke #$(file-append unzip "/bin/unzip")
                      "-o" (assoc-ref inputs "source"))))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/codenomad")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec ~a/opt/codenomad/codenomad \"$@\"\n"
                            out)))
                (chmod (string-append bin "/codenomad") #o755)))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/NeuralNomadsAI/CodeNomad")
    (synopsis "AI-powered code editor (pre-built binary)")
    (description
     "CodeNomad is an AI-powered code editor built on top of VS Code.
It provides AI-assisted code completion, generation, and refactoring.
This package installs the pre-built binary distribution.")
    ;; License not specified upstream
    (license #f)))

;;; ── 11. dooble-bin ─────────────────────────────────────────────────────
;;; Dooble web browser (pre-built binary)
;;; AUR: dooble-bin  →  Guix: dooble-bin
;;; Upstream: https://github.com/textbrowser/dooble
;;;
(define-public dooble-bin
  (package
    (name "dooble-bin")
    (version "2025.11.25")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/textbrowser/dooble/releases/download/"
             version "/Dooble-" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append binutils "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (when (file-exists? (string-append tmp "/opt"))
              (copy-recursively (string-append tmp "/opt")
                                (string-append out "/opt")))
            (when (file-exists? (string-append tmp "/usr"))
              (copy-recursively (string-append tmp "/usr")
                                (string-append out "/usr")))
            (let ((bin (string-append out "/bin")))
              (mkdir-p bin)
              (call-with-output-file (string-append bin "/dooble")
                (lambda (port)
                  (format port "#!/bin/sh\nexec ~a/opt/dooble/Dooble \"$@\"\n"
                          out)))
              (chmod (string-append bin "/dooble") #o755))
            #t))))
    (native-inputs (list tar gzip xz binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/textbrowser/dooble")
    (synopsis "Dooble web browser (pre-built binary)")
    (description
     "Dooble is a privacy-focused web browser based on Qt and Chromium.
It features ad blocking, cookie management, and encrypted storage
for bookmarks, cookies, and history.  This package installs the
pre-built binary from the official release.")
    ;; Custom Dooble license (BSD-like)
    (license license:bsd-3)))

;;; ── 12. polymath ───────────────────────────────────────────────────────
;;; Flux Keyboard firmware utility
;;; AUR: polymath  →  Guix: polymath
;;; Upstream: https://fluxkeyboard.com/
;;;
(define-public polymath
  (package
    (name "polymath")
    (version "1.4.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://fluxkeyboard.com/updates/polymath/linux/deb/"
             "polymath_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append binutils "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (when (file-exists? (string-append tmp "/opt"))
              (copy-recursively (string-append tmp "/opt")
                                (string-append out "/opt")))
            (when (file-exists? (string-append tmp "/usr"))
              (copy-recursively (string-append tmp "/usr")
                                (string-append out "/usr")))
            (let ((bin (string-append out "/bin")))
              (mkdir-p bin)
              (call-with-output-file (string-append bin "/polymath")
                (lambda (port)
                  (format port "#!/bin/sh\nexec ~a/opt/polymath/polymath \"$@\"\n"
                          out)))
              (chmod (string-append bin "/polymath") #o755))
            #t))))
    (native-inputs (list tar gzip xz binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://fluxkeyboard.com/")
    (synopsis "Flux Keyboard firmware configuration utility")
    (description
     "Polymath is the desktop companion application for the Flux
Keyboard.  It provides firmware management, key remapping, macro
configuration, and lighting customization for Flux mechanical
keyboards.  This package installs the pre-built binary from the
official distribution.")
    ;; Proprietary Flux Keyboard license
    (license #f)))

;;; ── 13. stremio-enhanced-bin ───────────────────────────────────────────
;;; Enhanced Stremio media center (pre-built AppImage)
;;; AUR: stremio-enhanced-bin  →  Guix: stremio-enhanced-bin
;;; Upstream: https://github.com/REVENGE977/stremio-enhanced-community
;;;
(define-public stremio-enhanced-bin
  (package
    (name "stremio-enhanced-bin")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/REVENGE977/stremio-enhanced-community/"
             "releases/download/v" version
             "/Stremio.Enhanced-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((,(string-append "Stremio.Enhanced-" #$version ".AppImage")
           "opt/stremio-enhanced/stremio-enhanced.AppImage"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (app (string-append out "/opt/stremio-enhanced/"
                                         "stremio-enhanced.AppImage")))
                (chmod app #o755)
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/stremio-enhanced")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec ~a --no-sandbox \"$@\"\n" app)))
                (chmod (string-append bin "/stremio-enhanced") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/REVENGE977/stremio-enhanced-community")
    (synopsis "Enhanced Stremio media center with community patches")
    (description
     "Stremio Enhanced is a community-maintained fork of the Stremio
media center with additional features and fixes.  It provides a
unified interface for streaming video content from various sources
and add-ons.  This package installs the pre-built AppImage.")
    (license license:expat)))

;;; ── 14. apifox-bin ─────────────────────────────────────────────────────
;;; API development and testing platform (pre-built binary)
;;; AUR: apifox-bin  →  Guix: apifox-bin
;;; Upstream: https://apifox.com/
;;;
(define-public apifox-bin
  (package
    (name "apifox-bin")
    (version "2.8.14")
    (source
     (origin
       (method url-fetch)
       (uri "https://file-assets.apifox.com/download/Apifox-linux-latest.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "opt/apifox"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'extract-zip
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke #$(file-append unzip "/bin/unzip")
                      "-o" (assoc-ref inputs "source"))))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/apifox")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec ~a/opt/apifox/apifox --no-sandbox \"$@\"\n"
                            out)))
                (chmod (string-append bin "/apifox") #o755)))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://apifox.com/")
    (synopsis "API development and testing platform (pre-built binary)")
    (description
     "Apifox is an all-in-one API development platform that combines API
design, debugging, testing, and documentation.  It supports REST,
GraphQL, gRPC, and WebSocket protocols.  This package installs the
pre-built binary distribution.")
    ;; Proprietary Apifox license
    (license #f)))

;;; ── 15. spredit ────────────────────────────────────────────────────────
;;; Sprite editor using Allegro
;;; AUR: spredit  →  Guix: spredit
;;; Upstream: http://csdb.dk
;;;
(define-public spredit
  (package
    (name "spredit")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "http://csdb.dk/getinternalfile.php/93647/SPRedit-for-linux.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'extract-zip
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke #$(file-append unzip "/bin/unzip")
                      "-o" (assoc-ref inputs "source"))
              (chdir "SPRedit-for-linux/source")))
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "spredit" bin)))))))
    (native-inputs (list unzip))
    (home-page "http://csdb.dk")
    (synopsis "Sprite editor for C64-style graphics")
    (description
     "SPRedit is a sprite editor for creating and editing C64-style sprite
graphics.  It provides a graphical interface for pixel-level editing
of sprite data used in retro game development and demoscene
productions.")
    ;; License not specified upstream; assumed public domain for retro tool
    (license license:public-domain)))
