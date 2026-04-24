;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423n
;;; Resolves 30 TODO packages from queue (NEEDS_RECIPE_DESIGN pass).
;;;
;;; Resolved recipes (15):
;;;        1.  libgen-cli-bin (copy-build-system, v1.1.0, Apache-2.0)
;;;        2.  otf-joscelyn (font-build-system, v1.020, OFL)
;;;        3.  kctrl-bin (copy-build-system, v0.59.7, Apache-2.0)
;;;        4.  namespaced-openvpn-git (copy-build-system, r32.5ef019d, MIT)
;;;        5.  joshuto-bin (copy-build-system, v0.9.9, LGPL-3.0)
;;;        6.  zclipboard (cmake-build-system, v1.6.0, GPL-3.0)
;;;        7.  vpinball-bgfx.cmake (cmake-build-system, r8879.384e514, BSD-2-Clause)
;;;        8.  vkfetch-git (cmake-build-system, r100.45e1004, MIT)
;;;        9.  scie-pants-bin (copy-build-system, v0.12.5, Apache-2.0)
;;;       10.  ontake-copybara-git (go-build-system, r1.53cef14, MIT)
;;;       11.  gocurl-bin (copy-build-system, v1.5.1, MIT)
;;;       12.  git-age-bin (copy-build-system, v0.3.0, MIT)
;;;       13.  tes3cmd (copy-build-system, v0.40-pre2, MIT)
;;;       14.  pokemon-colorscripts-fork-git (copy-build-system, r117.742672d, MIT)
;;;       15.  keepassxc-wordlist-eyeware (copy-build-system, v1.0, GPL-3.0+)
;;;
;;; BLOCKED (15):
;;;        1.  freetype2-macos-browsers-binary-patcher — ARCH_SPECIFIC: pacman hooks
;;;        2.  picoscope7beta — PROPRIETARY_DEPS: ps7b_libpicoipp/ps7b_libpicocv not in Guix
;;;        3.  librewolf-extension-synclair-bin — BROWSER_EXTENSION: LibreWolf XPI
;;;        4.  imessage-exporter — PLATFORM_INCOMPATIBLE: macOS iMessage database
;;;        5.  hyde-ipc — CARGO_DEPS_NEEDED: Rust CLI needs cargo-inputs enumeration
;;;        6.  gozen-git — GODOT_ENGINE_REQUIRED: needs Godot engine not in Guix
;;;        7.  fastlane — RUBY_COMPLEX_DEPS: needs 50+ Ruby gems
;;;        8.  cpptools-debug-bin — PROPRIETARY_LICENSE: Microsoft proprietary
;;;        9.  i2c-ch341-dkms — KERNEL_MODULE_DKMS: DKMS not compatible with Guix
;;;       10.  groonga — COMPLEX_DEPS: 17 deps, many not in Guix (mecab, simdjson, xsimd, blosc2)
;;;       11.  esearch-electron-bin — ELECTRON_COMPLEX: needs system Electron not in Guix
;;;       12.  groundcoverify-git — DEP_BLOCKED: depends on delta-plugin (Rust/cargo)
;;;       13.  delta-plugin-git — CARGO_DEPS_NEEDED: Rust/cargo project
;;;       14.  aeon-bin — ELECTRON_OLD_VERSION: needs electron23 not in Guix
;;;       15.  opencryptoki-git — COMPLEX_DEPS: needs trousers/TPM stack not in Guix
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423n)
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
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            libgen-cli-bin
            otf-joscelyn
            kctrl-bin
            namespaced-openvpn-git
            joshuto-bin
            zclipboard
            vpinball-bgfx.cmake
            vkfetch-git
            scie-pants-bin
            ontake-copybara-git
            gocurl-bin
            git-age-bin
            tes3cmd
            pokemon-colorscripts-fork-git
            keepassxc-wordlist-eyeware
            ))

;;; -------------------------------------------------------------------
;;; 1. libgen-cli-bin --- CLI tool to access the Library Genesis dataset
;;; -------------------------------------------------------------------
(define-public libgen-cli-bin
  (package
    (name "libgen-cli-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ciehanski/libgen-cli/releases/download/v"
                    version "/libgen-cli-v" version "-linux"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("libgen-cli-v1.1.0-linux" "bin/libgen-cli"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod
                 (lambda _
                   (chmod "libgen-cli-v1.1.0-linux" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line tool to access the Library Genesis dataset")
    (description "A CLI tool to access the Library Genesis dataset.  Search,
download, and manage books from Library Genesis directly from the terminal.")
    (home-page "https://github.com/ciehanski/libgen-cli")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 2. otf-joscelyn --- authentic secretary hand serif font
;;; -------------------------------------------------------------------
(define-public otf-joscelyn
  (package
    (name "otf-joscelyn")
    (version "1.020")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/psb1558/Joscelyn-font")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "authentic secretary hand serif font")
    (description "Joscelyn is an authentic secretary hand serif font.  It is
based on historical calligraphic styles and provides a distinctive handwritten
appearance suitable for decorative text and historical document reproduction.")
    (home-page "https://github.com/psb1558/Joscelyn-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 3. kctrl-bin --- continuous delivery and package management for Kubernetes
;;; -------------------------------------------------------------------
(define-public kctrl-bin
  (package
    (name "kctrl-bin")
    (version "0.59.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/carvel-dev/kapp-controller/releases/download/v"
                    version "/kctrl-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kctrl-linux-amd64" "bin/kctrl"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod
                 (lambda _
                   (chmod "kctrl-linux-amd64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "continuous delivery and package management for Kubernetes")
    (description "Kctrl is the CLI for Carvel's kapp-controller, providing
continuous delivery and package management for Kubernetes.  It helps manage
application lifecycle on Kubernetes clusters.")
    (home-page "https://carvel.dev/kapp-controller")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 4. namespaced-openvpn-git --- wrapper for OpenVPN solving privacy issues
;;; -------------------------------------------------------------------
(define-public namespaced-openvpn-git
  (package
    (name "namespaced-openvpn-git")
    (version "r32.5ef019d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/slingamn/namespaced-openvpn")
                    (commit "5ef019d")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("namespaced-openvpn" "bin/namespaced-openvpn"))))
    (synopsis "wrapper for OpenVPN on Linux solving various privacy issues")
    (description "Namespaced-openvpn is a wrapper for OpenVPN on Linux that
solves various privacy issues.  It uses Linux network namespaces to ensure
that all traffic from selected applications is routed through the VPN tunnel.")
    (home-page "https://github.com/slingamn/namespaced-openvpn")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. joshuto-bin --- ranger-like terminal file manager written in Rust
;;; -------------------------------------------------------------------
(define-public joshuto-bin
  (package
    (name "joshuto-bin")
    (version "0.9.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kamiyaa/joshuto/releases/download/v"
                    version "/joshuto-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("joshuto" "bin/joshuto"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "ranger-like terminal file manager written in Rust")
    (description "Joshuto is a ranger-like terminal file manager written in
Rust.  It provides vi-like keybindings, file previews, and bulk operations
for efficient file management in the terminal.")
    (home-page "https://github.com/kamiyaa/joshuto")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 6. zclipboard --- modern fast clipboard manager
;;; -------------------------------------------------------------------
(define-public zclipboard
  (package
    (name "zclipboard")
    (version "1.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/reim-developer/zclipboard")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern, fast clipboard manager")
    (description "Zclipboard is a modern, fast clipboard manager built with
Qt6.  It provides clipboard history, search, and quick access to recently
copied items with desktop notifications.")
    (home-page "https://github.com/reim-developer/zclipboard")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. vpinball-bgfx.cmake --- fork of bgfx with patches for vpinball
;;; -------------------------------------------------------------------
(define-public vpinball-bgfx.cmake
  (package
    (name "vpinball-bgfx.cmake")
    (version "r8879.384e514")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bkaradzic/bgfx.cmake")
                    (commit "384e514")
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fork of bgfx with patches for vpinball")
    (description "A CMake-based fork of the bgfx cross-platform rendering
library with specific patches for the Visual Pinball project.  Provides
low-level GPU rendering abstraction supporting multiple backends.")
    (home-page "https://github.com/bkaradzic/bgfx.cmake")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 8. vkfetch-git --- fetch program that displays Vulkan GPU information
;;; -------------------------------------------------------------------
(define-public vkfetch-git
  (package
    (name "vkfetch-git")
    (version "r100.45e1004")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Wunkolo/vkfetch")
                    (commit "45e1004")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fetch program that displays Vulkan information about your GPUs")
    (description "Vkfetch is a system information tool that queries the Vulkan
API to display detailed information about your GPU hardware and driver.  It
presents the data in a neofetch-like format in the terminal.")
    (home-page "https://github.com/Wunkolo/vkfetch")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. scie-pants-bin --- Pants build tool launcher binary
;;; -------------------------------------------------------------------
(define-public scie-pants-bin
  (package
    (name "scie-pants-bin")
    (version "0.12.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pantsbuild/scie-pants/releases/download/v"
                    version "/scie-pants-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("scie-pants-linux-x86_64" "bin/pants"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod
                 (lambda _
                   (chmod "scie-pants-linux-x86_64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "pants build tool launcher binary")
    (description "Scie-pants is the launcher binary for the Pants build system,
a scalable build tool for monorepos.  It handles bootstrapping and version
management of the Pants build system.")
    (home-page "https://github.com/pantsbuild/scie-pants")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 10. ontake-copybara-git --- Wayland clipboard automation tool
;;; -------------------------------------------------------------------
(define-public ontake-copybara-git
  (package
    (name "ontake-copybara-git")
    (version "r1.53cef14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/make-42/copybara")
                    (commit "53cef14")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/make-42/copybara"
           #:tests? #f))
    (synopsis "wayland clipboard automation tool")
    (description "Copybara is a Wayland clipboard automation tool written in Go.
It monitors and manipulates clipboard contents on Wayland compositors using
wl-clipboard as a backend.")
    (home-page "https://github.com/make-42/copybara")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. gocurl-bin --- simplified curl written in Go
;;; -------------------------------------------------------------------
(define-public gocurl-bin
  (package
    (name "gocurl-bin")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ameshkov/gocurl/releases/download/v"
                    version "/gocurl-linux-amd64-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gocurl" "bin/gocurl"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simplified version of curl written in Go with additional features")
    (description "Gocurl is a simplified version of curl written in pure Go
with additional features.  It supports HTTP/3, DNS-over-HTTPS, DNS-over-TLS,
and DNS-over-QUIC for advanced network diagnostics.")
    (home-page "https://github.com/ameshkov/gocurl")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. git-age-bin --- smudge/clean filter to encrypt files in git
;;; -------------------------------------------------------------------
(define-public git-age-bin
  (package
    (name "git-age-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/prskr/git-age/releases/download/v"
                    version "/git-age_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("git-age" "bin/git-age"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "smudge/clean filter to encrypt/decrypt files in a git repository")
    (description "Git-age is a smudge/clean filter to encrypt and decrypt files
in a git repository transparently.  It uses the age encryption format to
protect sensitive files while keeping them in version control.")
    (home-page "https://github.com/prskr/git-age")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. tes3cmd --- command line tool for Morrowind plugins
;;; -------------------------------------------------------------------
(define-public tes3cmd
  (package
    (name "tes3cmd")
    (version "0.40-pre2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/john-moonsugar/tes3cmd")
                    (commit "v0.40-pre-release-2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tes3cmd" "bin/tes3cmd"))))
    (synopsis "command line tool to examine and manipulate Morrowind plugins")
    (description "Tes3cmd is a command line tool to examine and manipulate
plugins for the game Morrowind.  It can clean plugins, merge leveled lists,
and perform various automated operations on TES3 plugin files.")
    (home-page "https://github.com/john-moonsugar/tes3cmd")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. pokemon-colorscripts-fork-git --- Pokemon terminal sprites
;;; -------------------------------------------------------------------
(define-public pokemon-colorscripts-fork-git
  (package
    (name "pokemon-colorscripts-fork-git")
    (version "r117.742672d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AnarchistHoneybun/pokemon-colorscripts-fork")
                    (commit "742672d")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("colorscripts/" "share/pokemon-colorscripts/colorscripts/")
               ("pokemon.json" "share/pokemon-colorscripts/pokemon.json")
               ("pokemon-colorscripts.py" "bin/pokemon-colorscripts"))))
    (synopsis "CLI utility that prints unicode sprites of pokemon to the terminal")
    (description "Pokemon-colorscripts is a CLI utility that prints unicode
sprites of Pokemon to the terminal.  It supports all generations and can
display random Pokemon or specific ones by name or number.")
    (home-page "https://github.com/AnarchistHoneybun/pokemon-colorscripts-fork")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. keepassxc-wordlist-eyeware --- Lord of the Rings diceware wordlist
;;; -------------------------------------------------------------------
(define-public keepassxc-wordlist-eyeware
  (package
    (name "keepassxc-wordlist-eyeware")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nightsense/eyeware")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("eyeware.wordlist" "share/keepassxc/wordlists/eyeware.wordlist"))))
    (synopsis "Lord of the Rings diceware wordlist for KeePassXC")
    (description "A diceware wordlist for KeePassXC based on @emph{The Lord of
the Rings}.  It provides themed words for passphrase generation using the
KeePassXC password manager.")
    (home-page "https://github.com/nightsense/eyeware")
    (license license:gpl3+)))
