;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424o
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; New recipes (28):
;;;      1.  otel-tui-bin (copy-build-system, v0.7.1, asl2.0)
;;;      2.  fend-bin (copy-build-system, v1.5.8, expat)
;;;      3.  chisel-bin (copy-build-system, v1.11.5, expat)
;;;      4.  teip-bin (copy-build-system, v2.3.3, expat)
;;;      5.  mailpit-bin (copy-build-system, v1.29.7, expat)
;;;      6.  dotter-rs-bin (copy-build-system, v0.13.4, unlicense)
;;;      7.  frei-bin (copy-build-system, v0.4.0, gpl3+)
;;;      8.  jd-bin (copy-build-system, v2.5.0, expat)
;;;      9.  wthrr-bin (copy-build-system, v1.2.1, expat)
;;;     10.  shclrz-bin (copy-build-system, v0.3.1, gpl3+)
;;;     11.  tssh-bin (copy-build-system, v0.1.24, expat)
;;;     12.  stegify-bin (copy-build-system, v1.2, expat)
;;;     13.  cookcli-bin (copy-build-system, v0.29.0, expat)
;;;     14.  flipt-bin (copy-build-system, v2.9.0, gpl3)
;;;     15.  steampipe-bin (copy-build-system, v2.4.2, agpl3+)
;;;     16.  togo-bin (copy-build-system, v1.0.4, expat)
;;;     17.  pokego-bin (copy-build-system, v0.5.2, gpl3)
;;;     18.  coredns-bin (copy-build-system, v1.14.3, asl2.0)
;;;     19.  minmon-bin (copy-build-system, v0.13.0, asl2.0)
;;;     20.  rustdesk-server-bin (copy-build-system, v1.1.15, agpl3+)
;;;     21.  olivetin-bin (copy-build-system, v3000.11.3, agpl3+)
;;;     22.  ud (gnu-build-system, v1.1.0, bsd-3)
;;;     23.  ivykis (gnu-build-system, v0.43.2, lgpl2.1)
;;;     24.  obs-gstreamer (meson-build-system, v0.4.1, gpl2+)
;;;     25.  ramfetch (copy-build-system, v1.1.0a, expat)
;;;     26.  clay (copy-build-system, v0.14, zlib)
;;;     27.  tex-gyre-math-fonts (copy-build-system, v1.632, non-copyleft)
;;;     28.  gqrx-udev (copy-build-system, v2.10, gpl3+)
;;;
;;; BLOCKED (2):
;;;      1.  kazam (17978+70) -- MISSING_DEP: python-distutils-extra not in Guix
;;;      2.  perl-devel-nytprof (752) -- MISSING_DEPS: perl-capture-tiny etc
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260424o)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages video)
  #:export (
            otel-tui-bin
            fend-bin
            chisel-bin
            teip-bin
            mailpit-bin
            dotter-rs-bin
            frei-bin
            jd-bin
            wthrr-bin
            shclrz-bin
            tssh-bin
            stegify-bin
            cookcli-bin
            flipt-bin
            steampipe-bin
            togo-bin
            pokego-bin
            coredns-bin
            minmon-bin
            rustdesk-server-bin
            olivetin-bin
            ud
            ivykis
            obs-gstreamer
            ramfetch
            clay
            tex-gyre-math-fonts
            gqrx-udev
            ))

;;; ===================================================================
;;; 1. otel-tui-bin
;;; ===================================================================
;;; Source: https://github.com/ymtdzzz/otel-tui
;;; Terminal OpenTelemetry viewer

(define-public otel-tui-bin
  (package
    (name "otel-tui-bin")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ymtdzzz/otel-tui/releases/download/v"
                    version "/otel-tui_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("otel-tui" "bin/otel-tui"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ymtdzzz/otel-tui")
    (synopsis "terminal OpenTelemetry viewer")
    (description "otel-tui is a terminal-based OpenTelemetry viewer inspired by
otel-desktop-viewer.  It provides a TUI for inspecting OpenTelemetry traces
and spans received via OTLP.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 2. fend-bin
;;; ===================================================================
;;; Source: https://github.com/printfn/fend
;;; Arbitrary-precision unit-aware calculator

(define-public fend-bin
  (package
    (name "fend-bin")
    (version "1.5.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/printfn/fend/releases/download/v"
                    version "/fend-" version "-linux-x86_64-gnu.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fend" "bin/fend"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/printfn/fend")
    (synopsis "arbitrary-precision unit-aware calculator")
    (description "fend is an arbitrary-precision unit-aware calculator for the
command line.  It supports unit conversions, complex numbers, and various
number bases with an interactive REPL.")
    (license license:expat)))

;;; ===================================================================
;;; 3. chisel-bin
;;; ===================================================================
;;; Source: https://github.com/jpillora/chisel
;;; Fast TCP/UDP tunnel over HTTP

(define-public chisel-bin
  (package
    (name "chisel-bin")
    (version "1.11.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jpillora/chisel/releases/download/v"
                    version "/chisel_" version "_linux_amd64.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("chisel" "bin/chisel"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'decompress
                 (lambda _
                   (invoke "gzip" "-d"
                           (string-append "chisel_" #$version
                                          "_linux_amd64.gz"))
                   (rename-file (string-append "chisel_" #$version
                                               "_linux_amd64")
                                "chisel")
                   (chmod "chisel" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jpillora/chisel")
    (synopsis "fast TCP/UDP tunnel over HTTP")
    (description "Chisel is a fast TCP/UDP tunnel transported over HTTP and
secured via SSH.  It is useful for passing through firewalls and accessing
services behind NAT.")
    (license license:expat)))

;;; ===================================================================
;;; 4. teip-bin
;;; ===================================================================
;;; Source: https://github.com/greymd/teip
;;; Masking tape to help commands 'do one thing well'

(define-public teip-bin
  (package
    (name "teip-bin")
    (version "2.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/greymd/teip/releases/download/v"
                    version "/teip-" version
                    ".x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/teip" "bin/teip")
               ("man/teip.1" "share/man/man1/teip.1"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/greymd/teip")
    (synopsis "masking tape to help commands do one thing well")
    (description "teip selects particular fields of input, passes them to a
subcommand, and replaces the selected fields with the output.  It acts as
masking tape for Unix pipelines, allowing commands to focus on specific parts
of the input.")
    (license license:expat)))

;;; ===================================================================
;;; 5. mailpit-bin
;;; ===================================================================
;;; Source: https://github.com/axllent/mailpit
;;; Web and API based SMTP testing

(define-public mailpit-bin
  (package
    (name "mailpit-bin")
    (version "1.29.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/axllent/mailpit/releases/download/v"
                    version "/mailpit-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mailpit" "bin/mailpit"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/axllent/mailpit")
    (synopsis "web and API based SMTP testing tool")
    (description "Mailpit is an email testing tool for developers.  It acts as
an SMTP server and provides a web interface to view all captured emails.  It
supports SMTP with optional TLS, POP3 retrieval, and a REST API for
integration testing.")
    (license license:expat)))

;;; ===================================================================
;;; 6. dotter-rs-bin
;;; ===================================================================
;;; Source: https://github.com/SuperCuber/dotter
;;; Dotfile manager and templater

(define-public dotter-rs-bin
  (package
    (name "dotter-rs-bin")
    (version "0.13.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SuperCuber/dotter/releases/download/v"
                    version "/dotter-linux-x64-musl"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dotter-linux-x64-musl" "bin/dotter"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod-binary
                 (lambda _
                   (chmod "dotter-linux-x64-musl" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/SuperCuber/dotter")
    (synopsis "dotfile manager and templater written in Rust")
    (description "Dotter is a dotfile manager and templater.  It uses a simple
TOML configuration to symlink or template dotfiles to their correct locations
and supports multiple profiles for different machines.")
    (license license:unlicense)))

;;; ===================================================================
;;; 7. frei-bin
;;; ===================================================================
;;; Source: https://github.com/alexcoder04/frei
;;; Modern replacement for the 'free' command

(define-public frei-bin
  (package
    (name "frei-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alexcoder04/frei/releases/download/v"
                    version "/frei-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("frei-linux-amd64" "bin/frei"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod-binary
                 (lambda _
                   (chmod "frei-linux-amd64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/alexcoder04/frei")
    (synopsis "modern replacement for the free command")
    (description "frei is a modern replacement for the @command{free}
command-line utility.  It displays system memory usage with a clean,
readable output format.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 8. jd-bin
;;; ===================================================================
;;; Source: https://github.com/josephburnett/jd
;;; JSON diff and patch

(define-public jd-bin
  (package
    (name "jd-bin")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/josephburnett/jd/releases/download/v"
                    version "/jd-amd64-linux"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jd-amd64-linux" "bin/jd"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod-binary
                 (lambda _
                   (chmod "jd-amd64-linux" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/josephburnett/jd")
    (synopsis "JSON diff and patch tool")
    (description "jd is a command-line tool for diffing and patching JSON and
YAML files.  It supports set, multiset, and list semantics for comparing
values and can produce both human-readable diffs and machine-applicable
patches.")
    (license license:expat)))

;;; ===================================================================
;;; 9. wthrr-bin
;;; ===================================================================
;;; Source: https://github.com/ttytm/wthrr-the-weathercrab
;;; Weather companion for the terminal

(define-public wthrr-bin
  (package
    (name "wthrr-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ttytm/wthrr-the-weathercrab"
                    "/releases/download/v" version
                    "/wthrr-linux-x86_64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/wthrr" "bin/wthrr"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) tar)
                         (@ (gnu packages compression) xz)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ttytm/wthrr-the-weathercrab")
    (synopsis "weather companion for the terminal")
    (description "wthrr (the weathercrab) is a terminal weather companion that
displays current weather conditions and forecasts using the Open-Meteo API.
It features colorful output and supports configurable units and locations.")
    (license license:expat)))

;;; ===================================================================
;;; 10. shclrz-bin
;;; ===================================================================
;;; Source: https://github.com/alexcoder04/shclrz
;;; Colored output in the shell

(define-public shclrz-bin
  (package
    (name "shclrz-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alexcoder04/shclrz/releases/download/v"
                    version "/shclrz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("shclrz" "bin/shclrz"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod-binary
                 (lambda _
                   (chmod "shclrz" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/alexcoder04/shclrz")
    (synopsis "colored output in the shell made simple")
    (description "shclrz provides simple colorized output for shell scripts.
It reads text from standard input and applies ANSI color codes based on
patterns or explicit color specifications.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 11. tssh-bin
;;; ===================================================================
;;; Source: https://github.com/trzsz/trzsz-ssh
;;; SSH client with trzsz support

(define-public tssh-bin
  (package
    (name "tssh-bin")
    (version "0.1.24")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/trzsz/trzsz-ssh/releases/download/v"
                    version "/tssh_" version "_linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "tssh_" #$version
                                        "_linux_x86_64/tssh")
                         "bin/tssh"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://trzsz.github.io/ssh")
    (synopsis "SSH client with trzsz file transfer support")
    (description "tssh is an SSH client that integrates trzsz (trz/tsz) file
transfer support.  It provides all standard SSH features plus the ability to
transfer files using the trzsz protocol directly within the terminal session.")
    (license license:expat)))

;;; ===================================================================
;;; 12. stegify-bin
;;; ===================================================================
;;; Source: https://github.com/DimitarPetrov/stegify
;;; LSB steganography tool

(define-public stegify-bin
  (package
    (name "stegify-bin")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DimitarPetrov/stegify/releases/download/v"
                    version "/stegify_linux_x86-64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("stegify_linux_x86-64" "bin/stegify"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod-binary
                 (lambda _
                   (chmod "stegify_linux_x86-64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DimitarPetrov/stegify")
    (synopsis "LSB steganography tool for hiding files in images")
    (description "stegify is a Go tool for LSB (Least Significant Bit)
steganography.  It can hide any file within a PNG or JPEG image and later
extract it, using a lossless encoding technique that is invisible to the
human eye.")
    (license license:expat)))

;;; ===================================================================
;;; 13. cookcli-bin
;;; ===================================================================
;;; Source: https://github.com/cooklang/cookcli
;;; Cooklang recipe CLI tool

(define-public cookcli-bin
  (package
    (name "cookcli-bin")
    (version "0.29.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cooklang/cookcli/releases/download/v"
                    version "/cook-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cook" "bin/cook"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cooklang.org")
    (synopsis "command-line tool for Cooklang recipe management")
    (description "cook is a command-line tool for managing recipes written in
the Cooklang markup language.  It can generate shopping lists, scale recipes,
and serve a local web interface for browsing recipes.")
    (license license:expat)))

;;; ===================================================================
;;; 14. flipt-bin
;;; ===================================================================
;;; Source: https://github.com/flipt-io/flipt
;;; Feature flag solution

(define-public flipt-bin
  (package
    (name "flipt-bin")
    (version "2.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/flipt-io/flipt/releases/download/v"
                    version "/flipt_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("flipt" "bin/flipt"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://flipt.io")
    (synopsis "open-source self-hosted feature flag solution")
    (description "Flipt is an open-source, self-hosted feature flag solution
that supports boolean and multivariate flags with flexible targeting rules.
It provides a web UI, REST and gRPC APIs, and supports various storage
backends including Git, databases, and object stores.")
    (license license:gpl3)))

;;; ===================================================================
;;; 15. steampipe-bin
;;; ===================================================================
;;; Source: https://github.com/turbot/steampipe
;;; Steampipe CLI for querying cloud APIs with SQL

(define-public steampipe-bin
  (package
    (name "steampipe-bin")
    (version "2.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/turbot/steampipe/releases/download/v"
                    version "/steampipe_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("steampipe" "bin/steampipe"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://steampipe.io")
    (synopsis "query cloud APIs with SQL")
    (description "Steampipe is a CLI tool that allows querying cloud
infrastructure, SaaS services, and other data sources using standard SQL.
It embeds PostgreSQL and provides plugins for hundreds of services including
AWS, Azure, GCP, GitHub, and more.")
    (license license:agpl3+)))

;;; ===================================================================
;;; 16. togo-bin
;;; ===================================================================
;;; Source: https://github.com/prime-run/togo
;;; Terminal to-do manager

(define-public togo-bin
  (package
    (name "togo-bin")
    (version "1.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/prime-run/togo/releases/download/v"
                    version "/togo_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "togo-" #$version "-linux-amd64")
                         "bin/togo"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/prime-run/togo")
    (synopsis "fast terminal-based to-do manager")
    (description "togo is a fast, simple, and beautiful terminal-based to-do
manager with zero dependencies.  It stores tasks locally and provides a clean
TUI for managing daily tasks.")
    (license license:expat)))

;;; ===================================================================
;;; 17. pokego-bin
;;; ===================================================================
;;; Source: https://github.com/rubiin/pokego
;;; Display Pokemon sprites in terminal

(define-public pokego-bin
  (package
    (name "pokego-bin")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rubiin/pokego/releases/download/v"
                    version "/pokego_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pokego" "bin/pokego"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rubiin/pokego")
    (synopsis "display Pokemon sprites in the terminal")
    (description "pokego is a command-line tool that displays colorful Pokemon
sprites directly in the terminal.  It supports all generations of Pokemon and
can show random or specific Pokemon by name or number.")
    (license license:gpl3)))

;;; ===================================================================
;;; 18. coredns-bin
;;; ===================================================================
;;; Source: https://github.com/coredns/coredns
;;; DNS server that chains plugins

(define-public coredns-bin
  (package
    (name "coredns-bin")
    (version "1.14.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/coredns/coredns/releases/download/v"
                    version "/coredns_" version "_linux_amd64.tgz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("coredns" "bin/coredns"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://coredns.io")
    (synopsis "DNS server that chains plugins")
    (description "CoreDNS is a flexible, extensible DNS server written in Go.
It chains plugins to provide DNS services and supports DNS over TLS,
DNS over gRPC, service discovery, and integration with Kubernetes and etcd.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 19. minmon-bin
;;; ===================================================================
;;; Source: https://github.com/flo-at/minmon
;;; Minimal monitoring and alarming tool

(define-public minmon-bin
  (package
    (name "minmon-bin")
    (version "0.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/flo-at/minmon/releases/download/v"
                    version "/minmon-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("minmon" "bin/minmon"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/flo-at/minmon")
    (synopsis "minimal monitoring and alarming tool")
    (description "MinMon is an opinionated minimal monitoring and alarming tool.
It checks system resources like CPU, memory, disk, and temperature against
configurable thresholds and sends alerts via various notification channels.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 20. rustdesk-server-bin
;;; ===================================================================
;;; Source: https://github.com/rustdesk/rustdesk-server
;;; RustDesk server program

(define-public rustdesk-server-bin
  (package
    (name "rustdesk-server-bin")
    (version "1.1.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rustdesk/rustdesk-server/releases/download/"
                    version "/rustdesk-server-linux-amd64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("amd64/hbbs" "bin/rustdesk-hbbs")
               ("amd64/hbbr" "bin/rustdesk-hbbr"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rustdesk.com")
    (synopsis "RustDesk remote desktop server")
    (description "RustDesk Server provides the relay and rendezvous
infrastructure for RustDesk remote desktop connections.  It includes hbbs
(rendezvous/signaling server) and hbbr (relay server) for self-hosted
deployments.")
    (license license:agpl3+)))

;;; ===================================================================
;;; 21. olivetin-bin
;;; ===================================================================
;;; Source: https://github.com/OliveTin/OliveTin
;;; Web interface for predefined shell commands

(define-public olivetin-bin
  (package
    (name "olivetin-bin")
    (version "3000.11.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OliveTin/OliveTin/releases/download/"
                    version "/OliveTin-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("OliveTin" "bin/olivetin")
               ("webui/" "share/olivetin/webui/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.olivetin.app")
    (synopsis "web interface for predefined shell commands")
    (description "OliveTin gives safe and simple access to predefined shell
commands from a web interface.  It is useful for giving non-technical users
buttons to run commands like restarting services, running backups, or
triggering deployments.")
    (license license:agpl3+)))

;;; ===================================================================
;;; 22. ud
;;; ===================================================================
;;; Source: https://github.com/xyproto/ud
;;; UNIX day utility

(define-public ud
  (package
    (name "ud")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xyproto/ud/releases/download/v"
                    version "/ud-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "gcc" "-std=c18" "-D_GNU_SOURCE"
                           "-o" "ud" "main.c")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "ud" bin)))))))
    (home-page "https://github.com/xyproto/ud")
    (synopsis "UNIX day utility")
    (description "ud displays the current UNIX day number, which is the number
of days since the UNIX epoch (January 1, 1970).  It is a simple single-file
C program with no external dependencies.")
    (license license:bsd-3)))

;;; ===================================================================
;;; 23. ivykis
;;; ===================================================================
;;; Source: https://github.com/buytenh/ivykis
;;; Asynchronous I/O readiness notification library

(define-public ivykis
  (package
    (name "ivykis")
    (version "0.43.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/project/libivykis/"
                    version "/ivykis-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://github.com/buytenh/ivykis")
    (synopsis "asynchronous I/O readiness notification library")
    (description "ivykis is a library for asynchronous I/O readiness
notification.  It provides a portable interface for registering interest in
file descriptor readiness, timers, and other events, abstracting over
platform-specific mechanisms like epoll, kqueue, and poll.")
    (license license:lgpl2.1)))

;;; ===================================================================
;;; 24. obs-gstreamer
;;; ===================================================================
;;; Source: https://github.com/fzwoch/obs-gstreamer
;;; OBS Studio GStreamer source plugin

(define-public obs-gstreamer
  (package
    (name "obs-gstreamer")
    (version "0.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fzwoch/obs-gstreamer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (inputs (list (@ (gnu packages video) obs)
                  glib
                  gstreamer
                  gst-plugins-base))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/fzwoch/obs-gstreamer")
    (synopsis "GStreamer source plugin for OBS Studio")
    (description "obs-gstreamer is an OBS Studio plugin that allows feeding
GStreamer launch pipelines into OBS Studio as a video or audio source.  This
enables using any GStreamer-supported input source or filter chain within OBS.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 25. ramfetch
;;; ===================================================================
;;; Source: https://codeberg.org/jahway603/ramfetch
;;; Memory info fetch utility

(define-public ramfetch
  (package
    (name "ramfetch")
    (version "1.1.0a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/jahway603/ramfetch")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ramfetch" "bin/ramfetch"))))
    (home-page "https://codeberg.org/jahway603/ramfetch")
    (synopsis "display memory info using /proc/meminfo")
    (description "ramfetch is a minimal fetch utility that displays memory
information from @file{/proc/meminfo} in a clean format.  It shows total,
used, free, and available memory along with swap usage.")
    (license license:expat)))

;;; ===================================================================
;;; 26. clay
;;; ===================================================================
;;; Source: https://github.com/nicbarker/clay
;;; Header-only C UI layout library

(define-public clay
  (package
    (name "clay")
    (version "0.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicbarker/clay/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("clay.h" "include/clay.h"))))
    (home-page "https://github.com/nicbarker/clay")
    (synopsis "high performance UI layout library in C")
    (description "Clay is a header-only high-performance UI layout library
written in C.  It provides a declarative API for building complex UI layouts
with features like flexbox-style layout, scrolling, and floating elements,
all computed microsecond-fast with zero allocations.")
    (license license:zlib)))

;;; ===================================================================
;;; 27. tex-gyre-math-fonts
;;; ===================================================================
;;; Source: https://www.gust.org.pl/projects/e-foundry/tg-math
;;; TeX Gyre math companion fonts

(define-public tex-gyre-math-fonts
  (package
    (name "tex-gyre-math-fonts")
    (version "1.632")
    (source (origin
              (method url-fetch)
              (uri "https://www.gust.org.pl/projects/e-foundry/tg-math/download/texgyrepagella-math-1632.zip")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/tex-gyre-math/"
                #:include-regexp (".*\\.otf$")))))
    (home-page "https://www.gust.org.pl/projects/e-foundry/tg-math")
    (synopsis "TeX Gyre math companion fonts")
    (description "TeX Gyre Math provides OpenType math fonts designed as
companions for the TeX Gyre text font families.  This package includes
Pagella Math (companion to Palatino), suitable for mathematical typesetting
with Unicode math support.")
    (license (license:non-copyleft
              "https://www.gust.org.pl/projects/e-foundry/licenses"
              "GUST Font License"))))

;;; ===================================================================
;;; 28. gqrx-udev
;;; ===================================================================
;;; Source: https://github.com/gqrx-sdr/gqrx
;;; Udev rules for SDR devices

(define-public gqrx-udev
  (package
    (name "gqrx-udev")
    (version "2.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gqrx-sdr/gqrx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/udev/rules.d/"
                #:include-regexp (".*\\.rules$")))))
    (home-page "https://www.gqrx.dk")
    (synopsis "udev rules for software-defined radio devices")
    (description "This package provides udev rules from GQRX for popular
Software-Defined Radio (SDR) devices including RTL-SDR, HackRF, Airspy,
AirspyHF, FunCube Dongle, LimeSDR, PlutoSDR, and RFSPACE SDR-IQ.")
    (license license:gpl3+)))
