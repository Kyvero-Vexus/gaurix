;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260419b
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30 resolved, 30 definitions):
;;;        1.  mihomo-bin (copy-build-system, v1.19.23, GPL-3.0+)
;;;        2.  subfinder-bin (copy-build-system, v2.13.0, MIT)
;;;        3.  grype-bin (copy-build-system, v0.110.0, Apache-2.0)
;;;        4.  pnpm-bin (copy-build-system, v10.33.0, MIT)
;;;        5.  amber-bash-bin (copy-build-system, v0.5.1-alpha, LGPL-3.0)
;;;        6.  ytermusic-bin (copy-build-system, v0.1.5, Apache-2.0)
;;;        7.  aretext-bin (copy-build-system, v1.6.2, GPL-3.0)
;;;        8.  boundary-bin (copy-build-system, v0.21.2, BUSL-1.1)
;;;        9.  vgmstream-cli-bin (copy-build-system, r2083, ISC)
;;;       10.  codemap-bin (copy-build-system, v4.1.6, MIT)
;;;       11.  quikgit-bin (copy-build-system, v1.0.6, MIT)
;;;       12.  zfsbackrest-bin (copy-build-system, v0.2.0, MIT)
;;;       13.  linuxtoys-bin (copy-build-system, v5.7, LGPL-2.1+)
;;;       14.  proton-authenticator-bin (copy-build-system, v1.1.4, GPL-3.0+)
;;;       15.  wkhtmltopdf-bin (copy-build-system, v0.12.6.1, LGPL-3.0)
;;;       16.  ttf-poppins (copy-build-system, v4.003, OFL-1.1)
;;;       17.  ttf-rubik-vf (copy-build-system, v2.3.0, OFL-1.1)
;;;       18.  ttf-readex-pro (copy-build-system, v1.204, OFL-1.1)
;;;       19.  ttf-readex-pro-variable (copy-build-system, v1.204, OFL-1.1)
;;;       20.  ttf-nanum (copy-build-system, v2018, OFL)
;;;       21.  ttf-alte-haas-grotesk (copy-build-system, v1.0, non-copyleft)
;;;       22.  sddm-silent-theme (copy-build-system, v1.4.2, GPL-3.0)
;;;       23.  catppuccin-sddm-theme-frappe (copy-build-system, v1.1.2, MIT)
;;;       24.  plymouth-theme-neat (copy-build-system, v0.1.0, MIT)
;;;       25.  xkb-ultimatekeys (copy-build-system, v2026.02.24, GPL-3.0)
;;;       26.  perl-test-kwalitee (perl-build-system, v1.28, Perl)
;;;       27.  perl-irc-utils (perl-build-system, v0.12, Perl)
;;;       28.  perl-toml-parser (perl-build-system, v0.91, Perl)
;;;       29.  perl-cpan-outdated (perl-build-system, v0.32, Perl)
;;;       30.  perl-chemistry-elements (perl-build-system, v1.081, Artistic-2.0)
;;;
;;; BLOCKED EXHAUSTED (0):
;;;       (none)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260419b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:export (mihomo-bin
            subfinder-bin
            grype-bin
            pnpm-bin
            amber-bash-bin
            ytermusic-bin
            aretext-bin
            boundary-bin
            vgmstream-cli-bin
            codemap-bin
            quikgit-bin
            zfsbackrest-bin
            linuxtoys-bin
            proton-authenticator-bin
            wkhtmltopdf-bin
            ttf-poppins
            ttf-rubik-vf
            ttf-readex-pro
            ttf-readex-pro-variable
            ttf-nanum
            ttf-alte-haas-grotesk
            sddm-silent-theme
            catppuccin-sddm-theme-frappe
            plymouth-theme-neat
            xkb-ultimatekeys
            perl-test-kwalitee
            perl-irc-utils
            perl-toml-parser
            perl-cpan-outdated
            perl-chemistry-elements))

;;; -------------------------------------------------------------------
;;; 1. mihomo-bin --- Rule-based network tunnel proxy
;;; Prebuilt Go binary from GitHub releases.  Supports multiple proxy
;;; protocols including VMess, Shadowsocks, Trojan, and WireGuard.
;;; -------------------------------------------------------------------
(define-public mihomo-bin
  (package
    (name "mihomo-bin")
    (version "1.19.23")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MetaCubeX/mihomo/releases/download/v"
                    version "/mihomo-linux-amd64-v" version ".gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("mihomo" "bin/mihomo"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "mihomo.gz")
                   (invoke "gzip" "-d" "mihomo.gz")
                   (chmod "mihomo" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/MetaCubeX/mihomo")
    (synopsis "rule-based network tunnel proxy")
    (description "Mihomo is a rule-based network tunnel that supports multiple
protocols including VMess, Shadowsocks, Trojan, and WireGuard.  It provides
flexible routing rules and a RESTful API for configuration management.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2. subfinder-bin --- Subdomain discovery tool
;;; Prebuilt Go binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public subfinder-bin
  (package
    (name "subfinder-bin")
    (version "2.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/projectdiscovery/subfinder/releases/download/v"
                    version "/subfinder_" version "_linux_amd64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("subfinder" "bin/subfinder"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/projectdiscovery/subfinder")
    (synopsis "subdomain discovery tool for security research")
    (description "Subfinder is a subdomain discovery tool that discovers valid
subdomains for websites by using passive online sources.  It has a simple
modular architecture and is optimized for speed.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. grype-bin --- Vulnerability scanner for containers and filesystems
;;; Prebuilt Go binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public grype-bin
  (package
    (name "grype-bin")
    (version "0.110.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anchore/grype/releases/download/v"
                    version "/grype_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("grype" "bin/grype"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anchore/grype")
    (synopsis "vulnerability scanner for container images and filesystems")
    (description "Grype is a vulnerability scanner for container images and
filesystems.  It scans container images and file system directories for known
vulnerabilities using multiple vulnerability databases.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 4. pnpm-bin --- Fast, disk space efficient JavaScript package manager
;;; Standalone prebuilt binary (no Node.js dependency).
;;; -------------------------------------------------------------------
(define-public pnpm-bin
  (package
    (name "pnpm-bin")
    (version "10.33.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pnpm/pnpm/releases/download/v"
                    version "/pnpm-linux-x64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pnpm" "bin/pnpm"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "pnpm")
                   (chmod "pnpm" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://pnpm.io")
    (synopsis "fast and disk space efficient JavaScript package manager")
    (description "Pnpm is a fast, disk space efficient package manager for
JavaScript and Node.js projects.  It uses a content-addressable file store
and hard links to save disk space when installing packages.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. amber-bash-bin --- Programming language that compiles to Bash
;;; Prebuilt Rust binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public amber-bash-bin
  (package
    (name "amber-bash-bin")
    (version "0.5.1-alpha")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/amber-lang/amber/releases/download/"
                    version "/amber-linux-gnu-x86_64.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("amber" "bin/amber"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://amber-lang.com/")
    (synopsis "programming language that compiles to Bash")
    (description "Amber is a programming language that compiles to Bash.  It
provides modern language features including type safety, error handling, and
a readable syntax while producing portable Bash scripts as output.")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 6. ytermusic-bin --- Terminal-based YouTube Music player
;;; Prebuilt Rust binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public ytermusic-bin
  (package
    (name "ytermusic-bin")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ccgauche/ytermusic/releases/download/beta-"
                    version "/ytermusic-beta-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ytermusic" "bin/ytermusic"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ccgauche/ytermusic")
    (synopsis "terminal-based YouTube Music player written in Rust")
    (description "Ytermusic is a terminal-based YouTube Music player written
in Rust.  It provides a fast and simple TUI for browsing and playing music
from YouTube Music.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 7. aretext-bin --- Minimalist terminal text editor
;;; Prebuilt Go binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public aretext-bin
  (package
    (name "aretext-bin")
    (version "1.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aretext/aretext/releases/download/v"
                    version "/aretext_v" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("aretext" "bin/aretext"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://aretext.org")
    (synopsis "minimalist terminal text editor")
    (description "Aretext is a minimalist text editor designed for the
terminal.  It supports Vi-like key bindings, syntax highlighting for
multiple languages, and efficient file navigation.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8. boundary-bin --- Identity-based access management tool
;;; Prebuilt Go binary from HashiCorp releases.
;;; -------------------------------------------------------------------
(define-public boundary-bin
  (package
    (name "boundary-bin")
    (version "0.21.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://releases.hashicorp.com/boundary/"
                    version "/boundary_" version "_linux_amd64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("boundary" "bin/boundary"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.boundaryproject.io/")
    (synopsis "identity-based access management for dynamic infrastructure")
    (description "Boundary provides simple and secure remote access to
critical infrastructure.  It uses identity-based controls to manage access
to hosts and services across clouds, on-premises, and Kubernetes
environments.")
    (license (license:non-copyleft
              "https://github.com/hashicorp/boundary/blob/main/LICENSE"
              "Business Source License 1.1"))))

;;; -------------------------------------------------------------------
;;; 9. vgmstream-cli-bin --- Video game audio format decoder
;;; Prebuilt binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public vgmstream-cli-bin
  (package
    (name "vgmstream-cli-bin")
    (version "2083")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vgmstream/vgmstream/releases/download/r"
                    version "/vgmstream-linux-cli.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("vgmstream-cli" "bin/vgmstream-cli"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vgmstream/vgmstream")
    (synopsis "command-line decoder for streamed video game audio")
    (description "Vgmstream is a library and command-line tool for decoding
streamed (prerecorded) video game audio formats.  It supports hundreds of
audio formats from various gaming platforms and engines.")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 10. codemap-bin --- Project context mapper for AI development
;;; Prebuilt Go binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public codemap-bin
  (package
    (name "codemap-bin")
    (version "4.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JordanCoin/codemap/releases/download/v"
                    version "/codemap_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("codemap" "bin/codemap"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/JordanCoin/codemap")
    (synopsis "project context mapper for AI-assisted development")
    (description "Codemap generates architectural context maps of codebases
for use with large language models.  It provides instant structural overviews
without consuming excessive token budgets.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. quikgit-bin --- GitHub repository manager with TUI
;;; Prebuilt Go binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public quikgit-bin
  (package
    (name "quikgit-bin")
    (version "1.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LvcasX1/quikgit/releases/download/v"
                    version "/quikgit_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("quikgit" "bin/quikgit"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lvcasx1/quikgit")
    (synopsis "GitHub repository manager with terminal user interface")
    (description "Quikgit is a terminal-based GitHub repository manager.  It
provides a TUI for browsing, cloning, and managing GitHub repositories
directly from the command line.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. zfsbackrest-bin --- ZFS backup and restore tool
;;; Prebuilt binary from GitHub releases.
;;; -------------------------------------------------------------------
(define-public zfsbackrest-bin
  (package
    (name "zfsbackrest-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gargakshit/zfsbackrest/releases/download/v"
                    version "/zfsbackrest_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("zfsbackrest" "bin/zfsbackrest"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gargakshit/zfsbackrest")
    (synopsis "ZFS backup and restore tool")
    (description "ZFS Backrest is a backup and restore tool for ZFS
filesystems.  It provides automated snapshot management, incremental backups,
and easy restoration of ZFS datasets.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. linuxtoys-bin --- Collection of user-friendly Linux tools
;;; Prebuilt release archive from GitHub; Python+GTK application.
;;; -------------------------------------------------------------------
(define-public linuxtoys-bin
  (package
    (name "linuxtoys-bin")
    (version "5.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/psygreg/linuxtoys/releases/download/"
                    version "/linuxtoys-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/linuxtoys" "bin/linuxtoys")
               ("usr/share/linuxtoys" "share/linuxtoys"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://git.linux.toys/psygreg/linuxtoys")
    (synopsis "collection of user-friendly Linux administration tools")
    (description "Linux Toys is a collection of tools for Linux presented in
a user-friendly graphical interface.  It provides utilities for system
maintenance, configuration, and common administrative tasks.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 14. proton-authenticator-bin --- Two-factor authentication app
;;; Prebuilt .deb binary from Proton; GTK+WebKit application.
;;; -------------------------------------------------------------------
(define-public proton-authenticator-bin
  (package
    (name "proton-authenticator-bin")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://proton.me/download/authenticator/linux/"
                    "ProtonAuthenticator_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/proton-authenticator" "bin/proton-authenticator")
               ("usr/share/applications" "share/applications")
               ("usr/share/icons" "share/icons"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://proton.me/authenticator")
    (synopsis "two-factor authentication app from Proton")
    (description "Proton Authenticator is a two-factor authentication
application from Proton.  It securely stores and generates 2FA codes with
end-to-end encryption and cross-device synchronization through Proton
accounts.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. wkhtmltopdf-bin --- HTML to PDF/image converter (static build)
;;; Upstream static build from GitHub releases (.deb format).
;;; -------------------------------------------------------------------
(define-public wkhtmltopdf-bin
  (package
    (name "wkhtmltopdf-bin")
    (version "0.12.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wkhtmltopdf/packaging/releases/download/"
                    version "-3/wkhtmltox_" version
                    "-3.bookworm_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/local/bin/wkhtmltopdf" "bin/wkhtmltopdf")
               ("usr/local/bin/wkhtmltoimage" "bin/wkhtmltoimage"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wkhtmltopdf.org")
    (synopsis "HTML to PDF and image converter using WebKit")
    (description "Wkhtmltopdf is a command-line tool for converting HTML to
PDF and images using the Qt WebKit rendering engine.  This package provides
the upstream static build which bundles all required libraries.")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 16. ttf-poppins --- Geometric sans serif font by Indian Type Foundry
;;; Source archive from GitHub; TTF files in nested zip.
;;; -------------------------------------------------------------------
(define-public ttf-poppins
  (package
    (name "ttf-poppins")
    (version "4.003")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/itfoundry/Poppins/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/poppins"
                #:include-regexp ("\\.ttf$")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'extract-fonts
                 (lambda _
                   (invoke "unzip" "-o"
                           "products/Poppins-4.003-GoogleFonts-TTF.zip"))))))
    (native-inputs (list unzip))
    (home-page "https://github.com/itfoundry/Poppins")
    (synopsis "geometric sans serif font family by Indian Type Foundry")
    (description "Poppins is a geometric sans serif typeface designed by
Indian Type Foundry.  It supports Latin and Devanagari scripts with 18
styles ranging from Thin to Black, each with matching italics.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 17. ttf-rubik-vf --- Sans serif variable font with rounded corners
;;; From Google Fonts GitHub repository; pinned to specific commit.
;;; -------------------------------------------------------------------
(define-public ttf-rubik-vf
  (package
    (name "ttf-rubik-vf")
    (version "2.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/googlefonts/rubik")
                    (commit "e337a5f69a9bea30e58d05bd40184d79cc099628")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fonts/variable/Rubik[wght].ttf"
                "share/fonts/truetype/rubik/Rubik[wght].ttf")
               ("fonts/variable/Rubik-Italic[wght].ttf"
                "share/fonts/truetype/rubik/Rubik-Italic[wght].ttf"))))
    (home-page "https://github.com/googlefonts/rubik")
    (synopsis "sans serif font family with slightly rounded corners")
    (description "Rubik is a sans serif font family with slightly rounded
corners, designed by Hubert and Fischer, Meir Sadan, and Cyreal.  This
package provides the variable font version with adjustable weight axis.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 18. ttf-readex-pro --- World-script expansion of Lexend (static TTF)
;;; From GitHub repository; pinned to specific commit (no tags).
;;; -------------------------------------------------------------------
(define-public ttf-readex-pro
  (package
    (name "ttf-readex-pro")
    (version "1.204")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ThomasJockin/readexpro")
                    (commit "1a5aaa4c15edb043c37113a8cddf020235917050")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fonts/ttf" "share/fonts/truetype/readex-pro"))))
    (home-page "https://github.com/ThomasJockin/readexpro")
    (synopsis "world-script expansion of Lexend font family")
    (description "Readex Pro is a world-script expansion of the Lexend font
family.  It provides static TrueType fonts optimized for readability across
Latin, Arabic, and other scripts in six weight variants.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 19. ttf-readex-pro-variable --- Variable font version of Readex Pro
;;; Same source as ttf-readex-pro; installs variable font file.
;;; -------------------------------------------------------------------
(define-public ttf-readex-pro-variable
  (package
    (name "ttf-readex-pro-variable")
    (version "1.204")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ThomasJockin/readexpro")
                    (commit "1a5aaa4c15edb043c37113a8cddf020235917050")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fonts/variable" "share/fonts/truetype/readex-pro-variable"))))
    (home-page "https://github.com/ThomasJockin/readexpro")
    (synopsis "variable font version of Readex Pro font family")
    (description "Readex Pro Variable is the variable font version of the
Readex Pro font family, a world-script expansion of the Lexend family.  It
provides continuously adjustable weight and height expansion axes.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 20. ttf-nanum --- Nanum series Korean TrueType fonts
;;; Font pack from Naver CDN.
;;; -------------------------------------------------------------------
(define-public ttf-nanum
  (package
    (name "ttf-nanum")
    (version "2018")
    (source (origin
              (method url-fetch)
              (uri "http://appdown.naver.com/naver/font/NanumFont/setup/NanumFontSetup_TTF_ALL.zip")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/nanum"
                #:include-regexp ("\\.ttf$")))))
    (native-inputs (list unzip))
    (home-page "https://hangeul.naver.com/")
    (synopsis "Nanum series Korean TrueType fonts by Naver")
    (description "Nanum is a family of Korean TrueType fonts developed by
Naver Corporation.  It includes Nanum Gothic, Nanum Myeongjo, Nanum Brush,
Nanum Pen, Nanum Barun Gothic, and Nanum Gothic Coding in multiple weights.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 21. ttf-alte-haas-grotesk --- Helvetica-inspired sans serif font
;;; Font files from 1001fonts.com.
;;; -------------------------------------------------------------------
(define-public ttf-alte-haas-grotesk
  (package
    (name "ttf-alte-haas-grotesk")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.1001fonts.com/download/alte-haas-grotesk.zip")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/alte-haas-grotesk"
                #:include-regexp ("\\.ttf$")))))
    (native-inputs (list unzip))
    (home-page "http://www.yannlecoroller.com/")
    (synopsis "sans serif font inspired by classic Helvetica typography")
    (description "Alte Haas Grotesk is a sans serif typeface by Yann Le
Coroller.  It evokes the feel of Helvetica as seen in vintage
Muller-Brockmann design books, with regular and bold weights included.")
    (license (license:non-copyleft
              "https://www.1001fonts.com/alte-haas-grotesk-font.html"
              "Free for personal and commercial use"))))

;;; -------------------------------------------------------------------
;;; 22. sddm-silent-theme --- Highly customizable SDDM theme
;;; Source archive from GitHub.
;;; -------------------------------------------------------------------
(define-public sddm-silent-theme
  (package
    (name "sddm-silent-theme")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/uiriansan/SilentSDDM/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Main.qml" "share/sddm/themes/silent/Main.qml")
               ("metadata.desktop" "share/sddm/themes/silent/metadata.desktop")
               ("components" "share/sddm/themes/silent/components")
               ("configs" "share/sddm/themes/silent/configs")
               ("backgrounds" "share/sddm/themes/silent/backgrounds")
               ("icons" "share/sddm/themes/silent/icons")
               ("fonts" "share/sddm/themes/silent/fonts"))))
    (home-page "https://github.com/uiriansan/SilentSDDM")
    (synopsis "highly customizable SDDM login theme")
    (description "Silent is a highly customizable SDDM theme with support
for custom backgrounds, fonts, colors, and layout options.  It features a
minimal design with smooth animations and HiDPI support.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 23. catppuccin-sddm-theme-frappe --- Catppuccin Frappe SDDM theme
;;; Source archive from GitHub.
;;; -------------------------------------------------------------------
(define-public catppuccin-sddm-theme-frappe
  (package
    (name "catppuccin-sddm-theme-frappe")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/catppuccin/sddm/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/catppuccin-frappe"
                "share/sddm/themes/catppuccin-frappe"))))
    (home-page "https://github.com/catppuccin/sddm")
    (synopsis "Catppuccin Frappe pastel theme for SDDM")
    (description "Catppuccin Frappe is an SDDM login theme from the
Catppuccin color scheme collection.  It provides a soothing pastel color
palette with the Frappe flavor for the SDDM display manager.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. plymouth-theme-neat --- HiDPI-friendly Plymouth boot theme
;;; Source archive from GitHub.
;;; -------------------------------------------------------------------
(define-public plymouth-theme-neat
  (package
    (name "plymouth-theme-neat")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/neetly/plymouth-theme-neat/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src" "share/plymouth/themes/neat"))))
    (home-page "https://github.com/neetly/plymouth-theme-neat")
    (synopsis "HiDPI-friendly Plymouth boot splash theme")
    (description "Plymouth Theme Neat is a minimal, HiDPI-friendly boot
splash theme for Plymouth.  It features a clean design with a simple
loading animation suitable for high-resolution displays.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. xkb-ultimatekeys --- Multilingual US QWERTY keyboard layout
;;; Source archive from GitHub; tag uses r-prefixed date format.
;;; -------------------------------------------------------------------
(define-public xkb-ultimatekeys
  (let ((tag-version "2026-02-24"))
    (package
      (name "xkb-ultimatekeys")
      (version "2026.02.24")
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://github.com/pieter-degroote/UltimateKEYS/"
                      "archive/refs/tags/r" tag-version ".tar.gz"))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("linux-xkb/custom"
                  "share/X11/xkb/symbols/ultimatekeys"))))
      (home-page "https://github.com/pieter-degroote/UltimateKEYS")
      (synopsis "international US QWERTY keyboard layout for multilingual input")
      (description "UltimateKEYS is an international US QWERTY keyboard layout
with enhanced multilingual support.  It allows typing accented characters and
special symbols from many languages using intuitive key combinations.")
      (license license:gpl3))))

;;; -------------------------------------------------------------------
;;; 26. perl-test-kwalitee --- Test distribution quality before release
;;; Standard CPAN distribution.
;;; -------------------------------------------------------------------
(define-public perl-test-kwalitee
  (package
    (name "perl-test-kwalitee")
    (version "1.28")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/E/ET/ETHER/Test-Kwalitee-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/Test-Kwalitee")
    (synopsis "test the Kwalitee of a distribution before release")
    (description "Test::Kwalitee provides a simple way to test the Kwalitee
of a Perl distribution.  It checks for common quality indicators such as
proper documentation, test coverage, and CPAN metadata completeness.")
    (license (list license:gpl1+ license:artistic2.0))))

;;; -------------------------------------------------------------------
;;; 27. perl-irc-utils --- Common utilities for IRC-related tasks
;;; Standard CPAN distribution.
;;; -------------------------------------------------------------------
(define-public perl-irc-utils
  (package
    (name "perl-irc-utils")
    (version "0.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/H/HI/HINRIK/IRC-Utils-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/IRC-Utils")
    (synopsis "common utilities for IRC-related tasks")
    (description "IRC::Utils provides common utility functions for IRC-related
tasks in Perl.  It includes functions for nickname manipulation, color code
handling, mode parsing, and other IRC protocol operations.")
    (license (list license:gpl1+ license:artistic2.0))))

;;; -------------------------------------------------------------------
;;; 28. perl-toml-parser --- TOML format parser for Perl
;;; Standard CPAN distribution.
;;; -------------------------------------------------------------------
(define-public perl-toml-parser
  (package
    (name "perl-toml-parser")
    (version "0.91")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/K/KA/KARUPA/TOML-Parser-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/TOML-Parser")
    (synopsis "TOML format parser for Perl")
    (description "TOML::Parser is a Perl module for parsing TOML (Tom's
Obvious Minimal Language) configuration files.  It provides a simple
interface for reading TOML data into Perl data structures.")
    (license (list license:gpl1+ license:artistic2.0))))

;;; -------------------------------------------------------------------
;;; 29. perl-cpan-outdated --- Detect outdated CPAN modules
;;; Standard CPAN distribution.
;;; -------------------------------------------------------------------
(define-public perl-cpan-outdated
  (package
    (name "perl-cpan-outdated")
    (version "0.32")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/D/DO/DOLMEN/cpan-outdated-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/cpan-outdated")
    (synopsis "detect outdated CPAN modules in your environment")
    (description "cpan-outdated detects outdated CPAN modules installed in
your Perl environment.  It compares locally installed module versions against
the latest versions available on CPAN and reports any that need updating.")
    (license (list license:gpl1+ license:artistic2.0))))

;;; -------------------------------------------------------------------
;;; 30. perl-chemistry-elements --- Work with chemical elements in Perl
;;; Standard CPAN distribution.
;;; -------------------------------------------------------------------
(define-public perl-chemistry-elements
  (package
    (name "perl-chemistry-elements")
    (version "1.081")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/B/BR/BRIANDFOY/"
                    "Chemistry-Elements-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/Chemistry-Elements")
    (synopsis "Perl extension for working with chemical elements")
    (description "Chemistry::Elements is a Perl module for working with
the chemical elements.  It provides functions to look up element names,
symbols, and atomic numbers, and to convert between these representations.")
    (license license:artistic2.0)))
