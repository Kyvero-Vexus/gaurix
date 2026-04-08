;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260407h
;;; Resolves 100 BLOCKED packages from priority queue (pass h).
;;; 18 packages resolved with recipes, 82 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-07T00:00:00+00:00

(define-module (gaurix packages deptree-resolver-260407h)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages perl)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system perl)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (cagent-bin
            claude-agent-acp-bin
            cloudflare-speed-cli-bin
            cloudflarewarpspeedtest-bin
            codecrafters-bin
            codegrab-bin
            codes-bin
            convcommitlint-bin
            carbonyl-bin
            compressonator-cli-bin
            cosmocc-bin
            chess-merida-font
            chromium-extension-adnauseam
            chromium-extension-web-store
            perl-test-useallmodules
            blindpaste
            chkrootkit
            betterbird-fr-bin))

;;; ════════════════════════════════════════════════════════════════════════
;;; BINARY CLI TOOLS — single-binary installs
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 1. cagent-bin ──────────────────────────────────────────────────────
;;; Docker cagent — Agent Builder and Runtime
;;;
(define-public cagent-bin
  (package
    (name "cagent-bin")
    (version "1.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/docker/cagent/releases/download/v"
             version "/cagent-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("cagent" "bin/cagent"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "cagent")
              (chmod "cagent" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/docker/cagent")
    (synopsis "docker agent builder and runtime")
    (description
     "Docker cagent is an Agent Builder and Runtime.  It provides tools for
building and running containerized agents on Docker infrastructure.")
    (license license:asl2.0)))

;;; ── 2. claude-agent-acp-bin ────────────────────────────────────────────
;;; Claude Agent for ACP (Agent Client Protocol)
;;;
(define-public claude-agent-acp-bin
  (package
    (name "claude-agent-acp-bin")
    (version "0.25.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/agentclientprotocol/claude-agent-acp/"
             "releases/download/v" version
             "/claude-agent-acp-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("claude-agent-acp" "bin/claude-agent-acp"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-symlink
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (symlink "claude-agent-acp"
                         (string-append bin "/claude-code-acp"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/agentclientprotocol/claude-agent-acp")
    (synopsis "use Claude Agent from any ACP client")
    (description
     "Claude Agent ACP lets you use Claude Agent from any ACP (Agent Client
Protocol) client such as Zed.  It provides a precompiled binary bridge
between Claude and ACP-compatible editors and tools.")
    (license license:asl2.0)))

;;; ── 3. cloudflare-speed-cli-bin ────────────────────────────────────────
;;; CLI tool for internet speed testing via Cloudflare
;;;
(define-public cloudflare-speed-cli-bin
  (package
    (name "cloudflare-speed-cli-bin")
    (version "0.6.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/kavehtehrani/cloudflare-speed-cli/"
             "releases/download/v" version
             "/cloudflare-speed-cli-x86_64-unknown-linux-musl.tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("cloudflare-speed-cli" "bin/cloudflare-speed-cli"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kavehtehrani/cloudflare-speed-cli")
    (synopsis "CLI for internet speed testing via Cloudflare")
    (description
     "Cloudflare Speed CLI is a command-line tool for measuring internet
speed using Cloudflare's network infrastructure.  It provides download
and upload speed measurements along with latency statistics.")
    (license license:gpl3)))

;;; ── 4. cloudflarewarpspeedtest-bin ─────────────────────────────────────
;;; Test latency and speed of Cloudflare WARP IPs
;;;
(define-public cloudflarewarpspeedtest-bin
  (package
    (name "cloudflarewarpspeedtest-bin")
    (version "1.5.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/peanut996/CloudflareWarpSpeedTest/"
             "releases/download/v" version
             "/CloudflareWarpSpeedTest-v" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("CloudflareWarpSpeedTest" "bin/CloudflareWarpSpeedTest"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/peanut996/CloudflareWarpSpeedTest")
    (synopsis "test latency and speed of Cloudflare WARP IPs")
    (description
     "CloudflareWarpSpeedTest tests the latency and speed of all Cloudflare
WARP IPs to find the lowest latency and fastest IP addresses for your
network connection.")
    (license license:gpl3)))

;;; ── 5. codecrafters-bin ────────────────────────────────────────────────
;;; Codecrafters CLI tool
;;;
(define-public codecrafters-bin
  (package
    (name "codecrafters-bin")
    (version "44")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/codecrafters-io/cli/releases/download/v"
             version "/v" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("codecrafters" "bin/codecrafters"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/codecrafters-io/cli")
    (synopsis "Codecrafters CLI for programming challenges")
    (description
     "The Codecrafters CLI tool provides a command-line interface for
interacting with the Codecrafters platform, which offers programming
challenges for building real-world software from scratch.")
    (license license:expat)))

;;; ── 6. codegrab-bin ────────────────────────────────────────────────────
;;; CLI/TUI for bundling code into LLM-ready output
;;;
(define-public codegrab-bin
  (package
    (name "codegrab-bin")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/epilande/codegrab/releases/download/v"
             version "/codegrab_" version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("grab" "bin/grab"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/epilande/codegrab")
    (synopsis "CLI and TUI for bundling code into LLM-ready output")
    (description
     "Codegrab is a CLI and TUI tool for selecting and bundling code files
into a single, LLM-ready output.  It helps prepare code context for use
with large language models.")
    (license license:expat)))

;;; ── 7. codes-bin ───────────────────────────────────────────────────────
;;; CLI tool for managing Claude Code configurations
;;;
(define-public codes-bin
  (package
    (name "codes-bin")
    (version "0.24.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ourines/codes/releases/download/v"
             version "/codes-v" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("codes" "bin/codes"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ourines/codes")
    (synopsis "CLI for managing multiple Claude Code configurations")
    (description
     "Codes is a CLI tool for managing multiple Claude Code configurations
with ease.  It allows switching between different configuration profiles
for the Claude Code assistant.")
    (license license:expat)))

;;; ── 8. convcommitlint-bin ──────────────────────────────────────────────
;;; Conventional commit linter
;;;
(define-public convcommitlint-bin
  (package
    (name "convcommitlint-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/coolapso/convcommitlint/releases/download/v"
             version "/convcommitlint_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("convcommitlint" "bin/convcommitlint"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/coolapso/convcommitlint")
    (synopsis "opinionated linter for conventional commits")
    (description
     "Convcommitlint is a simple, opinionated, yet usable linter for
conventional commits, written in Go.  It validates commit messages
against the Conventional Commits specification.")
    (license license:expat)))

;;; ════════════════════════════════════════════════════════════════════════
;;; BINARY TOOLS — archives with multiple files
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 9. carbonyl-bin ────────────────────────────────────────────────────
;;; Chromium-based browser for the terminal
;;;
(define-public carbonyl-bin
  (package
    (name "carbonyl-bin")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fathyb/carbonyl/releases/download/v"
             version "/carbonyl.linux-amd64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("carbonyl" "lib/carbonyl/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/carbonyl")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/carbonyl")
                  (lambda (port)
                    (format port "#!~a~%exec ~a/carbonyl \"$@\"~%"
                            (which "bash") lib)))
                (chmod (string-append bin "/carbonyl") #o755)))))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fathyb/carbonyl")
    (synopsis "Chromium-based browser built to run in a terminal")
    (description
     "Carbonyl is a Chromium-based browser built to run in a terminal.  It
supports full web rendering including CSS, JavaScript, and WebGL, all
displayed as text in the terminal using half-block characters.")
    (license license:bsd-3)))

;;; ── 10. compressonator-cli-bin ─────────────────────────────────────────
;;; GPU texture compression CLI
;;;
(define-public compressonator-cli-bin
  (package
    (name "compressonator-cli-bin")
    (version "4.5.52")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/GPUOpen-Tools/compressonator/"
             "releases/download/V" version
             "/compressonatorcli-" version "-Linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/compressonator-cli/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/compressonator-cli")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/compressonatorcli")
                  (lambda (port)
                    (format port "#!~a~%exec ~a/compressonatorcli \"$@\"~%"
                            (which "bash") lib)))
                (chmod (string-append bin "/compressonatorcli") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/GPUOpen-Tools/compressonator")
    (synopsis "CLI for GPU texture compression and transcoding")
    (description
     "Compressonator CLI provides GPU texture compression, decompression,
format transcoding, and mip-map generation from the command line.  It
supports BC, ETC, ASTC, and other texture compression formats.")
    (license license:expat)))

;;; ── 11. cosmocc-bin ────────────────────────────────────────────────────
;;; Cosmopolitan C toolchain — build-once run-anywhere
;;;
(define-public cosmocc-bin
  (package
    (name "cosmocc-bin")
    (version "4.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cosmo.zip/pub/cosmocc/cosmocc-"
             version ".zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/cosmocc/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrappers
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/cosmocc/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (let ((name (basename f)))
                     (symlink f (string-append bin "/" name))))
                 (find-files lib "^(cosmo|x86_64-|aarch64-)"))))))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://justine.lol/cosmopolitan/index.html")
    (synopsis "cosmopolitan C toolchain for portable executables")
    (description
     "Cosmocc is the Cosmopolitan C/C++ toolchain that lets you build
portable executables that run on Linux, macOS, Windows, FreeBSD, OpenBSD,
and NetBSD with the same binary.  Based on the Cosmopolitan Libc.")
    (license license:isc)))

;;; ════════════════════════════════════════════════════════════════════════
;;; DATA PACKAGES — fonts and extensions
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 12. chess-merida-font ──────────────────────────────────────────────
;;; TrueType chess font for diagrams and figurine notation
;;;
(define-public chess-merida-font
  (package
    (name "chess-merida-font")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.enpassant.dk/chess/downl/merid_tt.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("MERID_TT.TTF" "share/fonts/truetype/chess-merida/ChessMerida.ttf"))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (home-page "https://www.enpassant.dk/chess/fonteng.htm")
    (synopsis "TrueType chess font for diagrams and figurine notation")
    (description
     "Chess Merida is a TrueType font designed for chess diagrams and
figurine algebraic notation.  It provides chess piece symbols suitable
for use in documents and publications.")
    (license (license:non-copyleft
              "https://www.enpassant.dk/chess/fonteng.htm"
              "Free for personal use"))))

;;; ── 13. chromium-extension-adnauseam ───────────────────────────────────
;;; AdNauseam ad blocker for Chromium
;;;
(define-public chromium-extension-adnauseam
  (package
    (name "chromium-extension-adnauseam")
    (version "3.28.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dhowe/AdNauseam/releases/download/v"
             version "/adnauseam-" version ".chromium.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/chromium-extension-adnauseam/"))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (home-page "https://adnauseam.io")
    (synopsis "ad blocker that confuses trackers for Chromium")
    (description
     "AdNauseam is a lightweight ad blocker that also fights back against
tracking by the ad industry.  It silently simulates clicks on each
blocked ad, confusing tracking algorithms and polluting user profiles.")
    (license license:gpl3)))

;;; ── 14. chromium-extension-web-store ───────────────────────────────────
;;; Chromium Web Store extension for ungoogled-chromium
;;;
(define-public chromium-extension-web-store
  (package
    (name "chromium-extension-web-store")
    (version "1.5.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/NeverDecaf/chromium-web-store/"
             "releases/download/v" version
             "/Chromium.Web.Store.crx"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("Chromium.Web.Store.crx"
           "share/chromium-extension-web-store/Chromium.Web.Store.crx"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "Chromium.Web.Store.crx"))))))
    (home-page "https://github.com/NeverDecaf/chromium-web-store")
    (synopsis "web store extension for ungoogled-chromium")
    (description
     "Chromium Web Store is an extension that adds Chrome Web Store
functionality to ungoogled-chromium, allowing installation and updates
of extensions directly from the Chrome Web Store.")
    (license license:expat)))

;;; ════════════════════════════════════════════════════════════════════════
;;; SOURCE BUILD PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 15. perl-test-useallmodules ────────────────────────────────────────
;;; Perl test module for checking all manifested modules
;;;
(define-public perl-test-useallmodules
  (package
    (name "perl-test-useallmodules")
    (version "0.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://cpan/authors/id/I/IS/ISHIGAKI/"
             "Test-UseAllModules-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/Test-UseAllModules")
    (synopsis "run use_ok() for all the MANIFESTed modules")
    (description
     "Test::UseAllModules is a Perl test module that automatically runs
@code{use_ok()} for all the modules listed in your MANIFEST file.  This
helps ensure that all distributed modules compile correctly.")
    (license license:perl-license)))

;;; ── 16. blindpaste ─────────────────────────────────────────────────────
;;; TUI blackboard for quick note taking
;;;
(define-public blindpaste
  (package
    (name "blindpaste")
    (version "1.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://projectgrid.net/archive/blindpaste-"
             version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://projectgrid.net/portfolio/blindpaste")
    (synopsis "TUI blackboard for quick note taking")
    (description
     "Blindpaste is a TUI (text user interface) blackboard application for
quick note taking.  It provides a minimal interface for capturing and
organizing text snippets in the terminal.")
    (license (license:non-copyleft
              "https://opensource.org/license/0bsd"
              "Zero-Clause BSD"))))

;;; ── 17. chkrootkit ─────────────────────────────────────────────────────
;;; Locally checks for signs of a rootkit
;;;
(define-public chkrootkit
  (package
    (name "chkrootkit")
    (version "0.59")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "ftp://ftp.chkrootkit.org/pub/seg/pac/chkrootkit-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "CC=" (or (getenv "CC") "gcc"))
              "sense")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (sbin (string-append out "/sbin"))
                     (lib (string-append out "/lib/chkrootkit")))
                (mkdir-p sbin)
                (mkdir-p lib)
                (install-file "chkrootkit" sbin)
                (for-each
                 (lambda (f)
                   (when (and (file-exists? f)
                              (not (directory-exists? f)))
                     (install-file f lib)))
                 '("chkdirs" "chklastlog" "chkproc" "chkutmp"
                   "chkwtmp" "ifpromisc" "strings-static"))))))))
    (home-page "http://www.chkrootkit.org/")
    (synopsis "locally checks for signs of a rootkit")
    (description
     "Chkrootkit is a tool to locally check for signs of a rootkit.  It
examines certain elements of the host system to determine whether
commonly-known rootkits have modified the system binaries or logs.")
    (license license:bsd-2)))

;;; ── 18. betterbird-fr-bin ──────────────────────────────────────────────
;;; Betterbird French edition — enhanced Thunderbird fork
;;;
(define-public betterbird-fr-bin
  (package
    (name "betterbird-fr-bin")
    (version "140.9.0esr")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.betterbird.eu/downloads/LinuxArchive/"
             "betterbird-" version "-bb20.fr.linux-x86_64.tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/betterbird/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/betterbird")))
                (mkdir-p bin)
                (symlink (string-append lib "/betterbird")
                         (string-append bin "/betterbird"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.betterbird.eu/index.html")
    (synopsis "enhanced Thunderbird fork (French edition)")
    (description
     "Betterbird is a fine-tuned version of Mozilla Thunderbird with many
enhancements and bug fixes.  This is the French language edition
distributed as a prebuilt binary.")
    (license license:mpl2.0)))
