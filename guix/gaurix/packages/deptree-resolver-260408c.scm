;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- deptree-resolver-260408c
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 15 packages resolved with recipes, 85 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408c)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fonts)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (dol-bin
            doltgresql-bin
            dottie-bin
            dsearch-bin
            editorconfiger-bin
            eilmeldung-bin
            eldiron-bin
            emmylua-ls-bin
            engram-bin
            enseal-bin
            envdiff-bin
            font-ebgaramond
            coder-bin
            docker-scout
            codeql-bin))

;;; ====================================================================
;;; BINARY CLI TOOLS -- tar.gz archives with single binary
;;; ====================================================================

;;; -- 1. dol-bin -------------------------------------------------------
;;; Detect dark/light mode on the CLI
;;;
(define-public dol-bin
  (package
    (name "dol-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/netmute/dol/releases/download/v"
             version "/dol_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "1h80kvnmgv4m08bvfl8zasiaf9qj9sb6zcbb1zslhx8gilv8yrjq"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dol" "bin/dol"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/netmute/dol")
    (synopsis "detect dark or light mode on the command line")
    (description
     "Dol is a command-line utility that detects whether the terminal or
desktop environment is using dark or light mode.  It can be used in shell
scripts to adapt output styling to the current color scheme.")
    (license license:expat)))

;;; -- 2. doltgresql-bin ------------------------------------------------
;;; Version controlled PostgreSQL
;;;
(define-public doltgresql-bin
  (package
    (name "doltgresql-bin")
    (version "0.56.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dolthub/doltgresql/releases/download/v"
             version "/doltgresql-linux-amd64.tar.gz"))
       (sha256
        (base32 "0cipq9kg0pknv1p16b8cvr5fqadbvln4m0xy8zxah9qjymnhxjma"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("doltgresql-linux-amd64/bin/doltgres" "bin/doltgres"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dolthub/doltgresql")
    (synopsis "version controlled PostgreSQL database")
    (description
     "DoltgreSQL is a PostgreSQL-compatible database with Git-like version
control built in.  Every write is automatically tracked and can be diffed,
branched, merged, and pushed just like a Git repository.")
    (license license:asl2.0)))

;;; -- 3. dottie-bin ----------------------------------------------------
;;; Makes working with .env files easy
;;;
(define-public dottie-bin
  (package
    (name "dottie-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jippi/dottie/releases/download/v"
             version "/dottie_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "17spgbsi6n418fhsqmpgmyl4v1yq29q8dzswccqq6kyyygyqj01z"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dottie" "bin/dottie"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jippi/dottie")
    (synopsis "tool for working with .env files")
    (description
     "Dottie is a command-line tool that makes working with @file{.env} files
easy.  It can validate, sort, diff, and manage environment variable files
with support for shell completions and man pages.")
    (license license:expat)))

;;; -- 4. dsearch-bin ---------------------------------------------------
;;; Fast filesystem search service
;;;
(define-public dsearch-bin
  (package
    (name "dsearch-bin")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AvengeMedia/danksearch/releases/download/v"
             version "/dsearch-linux-amd64.tar.gz"))
       (sha256
        (base32 "193l3arr788fcxhjyffz3hr89r75pfvl7mn1s8f9v2q58rqx8032"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dsearch-linux-amd64" "bin/dsearch"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AvengeMedia/danksearch")
    (synopsis "fast filesystem search service")
    (description
     "DSearch is a fast filesystem search service that indexes files and
directories for quick lookup.  It provides a daemon-based architecture for
persistent indexing and rapid query responses.")
    (license license:expat)))

;;; -- 5. editorconfiger-bin --------------------------------------------
;;; Validate and compare .editorconfig files
;;;
(define-public editorconfiger-bin
  (package
    (name "editorconfiger-bin")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/aegoroff/editorconfiger/releases/download/"
             version "/editorconfiger-" version
             "-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "1kc0vg575zqjkfrwyrjziyyvcfj3nprr3spypvpm2z7b33d5gxhn"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("editorconfiger" "bin/editorconfiger"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/aegoroff/editorconfiger")
    (synopsis "validate and compare .editorconfig files")
    (description
     "Editorconfiger is a command-line tool for validating and comparing
@file{.editorconfig} files.  It checks for syntax errors, duplicate
sections, and inconsistencies across multiple configuration files.")
    (license license:expat)))

;;; -- 6. eilmeldung-bin ------------------------------------------------
;;; TUI RSS reader based on the news-flash library
;;;
(define-public eilmeldung-bin
  (package
    (name "eilmeldung-bin")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/christo-auer/eilmeldung/releases/download/"
             version "/eilmeldung-x86_64-unknown-linux-musl-" version ".tar.gz"))
       (sha256
        (base32 "0szaib0dp8prn0kfmdypfi0l09x4fqpyh8agm4hrvv54lwfrbfry"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("eilmeldung/eilmeldung" "bin/eilmeldung"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/christo-auer/eilmeldung")
    (synopsis "terminal RSS reader based on news-flash")
    (description
     "Eilmeldung is a terminal user interface RSS and Atom feed reader built
on the news-flash library.  It provides keyboard-driven feed management and
article reading in the terminal.")
    (license license:gpl3+)))

;;; -- 7. eldiron-bin ---------------------------------------------------
;;; Cross platform RPG game creator
;;;
(define-public eldiron-bin
  (package
    (name "eldiron-bin")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/markusmoenig/Eldiron/releases/download/v"
             version "/eldiron-creator-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "1cjs7236g6wm5n9jfv633q8lf1lvw7js3q2c8a58bv4rdm2qzfd8"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("eldiron-creator" "bin/eldiron-creator"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/markusmoenig/Eldiron")
    (synopsis "cross-platform classic RPG game creator")
    (description
     "Eldiron is a cross-platform creator for classic role-playing games.
It provides a visual editor for designing tile-based game worlds, scripting
game logic, and building retro RPG experiences.")
    (license license:expat)))

;;; -- 8. emmylua-ls-bin ------------------------------------------------
;;; Lua language server based on EmmyLua Analyzer
;;;
(define-public emmylua-ls-bin
  (package
    (name "emmylua-ls-bin")
    (version "0.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/EmmyLuaLs/emmylua-analyzer-rust/releases/download/"
             version "/emmylua_ls-linux-x64.tar.gz"))
       (sha256
        (base32 "19q52g6yh7xrqdw5hrj1zmvgys41zyq9hwh82igb9644lanwz0p0"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("emmylua_ls" "bin/emmylua_ls"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/EmmyLuaLs/emmylua-analyzer-rust")
    (synopsis "lua language server based on EmmyLua analyzer")
    (description
     "EmmyLua Language Server is a Lua language server implementation built
in Rust.  It provides code completion, diagnostics, go-to-definition, and
other IDE features for Lua development via the Language Server Protocol.")
    (license license:expat)))

;;; -- 9. engram-bin ----------------------------------------------------
;;; Persistent memory system for AI coding agents
;;;
(define-public engram-bin
  (package
    (name "engram-bin")
    (version "1.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Gentleman-Programming/engram/releases/download/v"
             version "/engram_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "1rb5rj1y117m9hzml83l7k4ppmjysq18hmragsj3f7mxqbrd3nmg"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("engram" "bin/engram"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Gentleman-Programming/engram")
    (synopsis "persistent memory system for AI coding agents")
    (description
     "Engram is a persistent memory system for AI coding agents.  It uses
SQLite with FTS5 full-text search and provides an MCP server, HTTP API,
and CLI for storing and retrieving contextual memories.")
    (license license:expat)))

;;; -- 10. enseal-bin ---------------------------------------------------
;;; Secure, ephemeral secret sharing
;;;
(define-public enseal-bin
  (package
    (name "enseal-bin")
    (version "0.17.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FlerAlex/enseal/releases/download/v"
             version "/enseal-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "10jfg0rs55cl4f320rypwzmij8phln7xglm9xbifj5sjihxiy2bn"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("enseal" "bin/enseal"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FlerAlex/enseal")
    (synopsis "secure ephemeral secret sharing for developers")
    (description
     "Enseal is a command-line tool for secure, ephemeral secret sharing.
It encrypts secrets and generates shareable links that expire after a
configurable time period or number of views.")
    (license license:expat)))

;;; -- 11. envdiff-bin --------------------------------------------------
;;; CLI tool to snapshot and diff environments
;;;
(define-public envdiff-bin
  (package
    (name "envdiff-bin")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/GBerghoff/envdiff/releases/download/v"
             version "/envdiff_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0jzc2k60jaxyhsb0504dj1hwkd0i3bplk2hp6s1jj0rj87fmyn6l"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("envdiff" "bin/envdiff"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/GBerghoff/envdiff")
    (synopsis "snapshot and diff environments to find differences")
    (description
     "Envdiff is a CLI tool that takes snapshots of environment variables and
compares them to find differences.  It helps identify which environment
changes cause different application behavior.")
    (license license:expat)))

;;; ====================================================================
;;; FONTS
;;; ====================================================================

;;; -- 12. font-ebgaramond (ebgaramond-otf) ----------------------------
;;; EB Garamond OpenType font
;;;
(define-public font-ebgaramond
  (let ((commit "106a4a6d377987459ae5e68673a4570f13b957fb")
        (revision "1"))
    (package
      (name "font-ebgaramond")
      (version (git-version "1.001" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/octaviopardo/EBGaramond12")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0mvhc01psahhda7kjvk4kk93z6idmah9rr28i5gcf0sabcmlripp"))))
      (build-system font-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (replace 'install
              (lambda* (#:key outputs #:allow-other-keys)
                (let ((font-dir (string-append (assoc-ref outputs "out")
                                               "/share/fonts/opentype")))
                  (mkdir-p font-dir)
                  (for-each (lambda (f)
                              (install-file f font-dir))
                            (find-files "fonts/otf" "\\.otf$"))))))))
      (home-page "https://github.com/octaviopardo/EBGaramond12")
      (synopsis "EB Garamond OpenType font family")
      (description
       "EB Garamond is a revival of Claude Garamond's famous humanist
typeface from the mid-16th century.  This version by Octavio Pardo and Georg
Duffner provides a complete OpenType font family with regular, italic, bold,
and other weights.")
      (license license:silofl1.1))))

;;; ====================================================================
;;; LARGER BINARY TOOLS
;;; ====================================================================

;;; -- 13. coder-bin ----------------------------------------------------
;;; Remote development environments on your infrastructure
;;;
(define-public coder-bin
  (package
    (name "coder-bin")
    (version "2.28.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/coder/coder/releases/download/v"
             version "/coder_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "1pg4ywq01iajr6a18si8v4ag50shv5v28nbvbkxqdzv6svhdgzam"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("coder" "bin/coder"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://coder.com")
    (synopsis "remote development environments on your infrastructure")
    (description
     "Coder provisions remote development environments on your infrastructure
using Terraform.  It supports any IDE, any cloud, and any compute with
a consistent developer experience.")
    (license license:agpl3)))

;;; -- 14. docker-scout -------------------------------------------------
;;; Docker software supply chain security tool
;;;
(define-public docker-scout
  (package
    (name "docker-scout")
    (version "1.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/docker/scout-cli/releases/download/v"
             version "/docker-scout_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0lxii68izykn0d1xhdy1qbm5bwqqy547chkacyf6mh4sf2hc1gh6"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("docker-scout" "bin/docker-scout"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/docker/scout-cli")
    (synopsis "docker software supply chain security analysis tool")
    (description
     "Docker Scout analyzes container images for vulnerabilities and provides
recommendations for remediation.  It integrates with Docker workflows to
surface security insights during development.")
    ;; Proprietary; Docker Subscription Service Agreement.
    (license #f)))

;;; -- 15. codeql-bin ---------------------------------------------------
;;; GitHub CodeQL CLI for code analysis
;;;
(define-public codeql-bin
  (package
    (name "codeql-bin")
    (version "2.23.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/github/codeql-cli-binaries/releases/download/v"
             version "/codeql-linux64.zip"))
       (sha256
        (base32 "1cj035m1rjgbl9k1d8q7rmjk7yxv2ad64dhwkp6mmm46inmch6z6"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan
      #~'(("codeql" "lib/codeql"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append out "/lib/codeql/codeql")
                         (string-append out "/bin/codeql"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/github/codeql-cli-binaries")
    (synopsis "GitHub CodeQL CLI for semantic code analysis")
    (description
     "CodeQL is GitHub's semantic code analysis engine.  The CLI lets you
create and analyze CodeQL databases, run queries to find vulnerabilities,
and generate SARIF results for integration with CI/CD pipelines.")
    ;; Proprietary; GitHub CodeQL Terms and Conditions.
    (license #f)))
