;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN pass #30e.
;;; 9 new recipes: 4 binary (migrate-bin, async-profiler-bin, vgx-bin,
;;; gogitver-bin), 3 Python (sqlite-web, python-cmsis-svd, automx2),
;;; 1 Make/shell (ruby-install),
;;; 1 C/Make (ca0132-tools-git).
;;; 21 re-blocked with specific reasons (eve-ng-integration already in nrd30d).

(define-module (gaurix packages queue-20260406-nrd30e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  ;; sqlite-web deps
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-build)
  ;; automx2 deps
  #:use-module (gnu packages databases)
  ;; ruby-install deps
  #:use-module (gnu packages bash)
  ;; ca0132-tools deps — none beyond gcc/make
  #:use-module ((guix licenses) #:prefix license:)
  #:export (migrate-bin
            async-profiler-bin
            vgx-bin
            gogitver-bin
            ruby-install
            sqlite-web
            python-cmsis-svd
            automx2
            ca0132-tools-git))

;; ═══════════════════════════════════════════════════════════════════
;; Binary packages (copy-build-system)
;; ═══════════════════════════════════════════════════════════════════

(define-public migrate-bin
  (package
    (name "migrate-bin")
    (version "4.18.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/golang-migrate/migrate/releases/download/v"
                    version "/migrate.linux-amd64.tar.gz"))
              (sha256
               (base32
                "1dd15xjls0mfv9k9ww3798plng4647sb4daiv5r93sahmh69rib0"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("migrate" "bin/migrate"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "database migrations tool written in Go")
    (description "Migrate reads migrations from sources and applies them to
databases in correct order.  It supports multiple database drivers including
PostgreSQL, MySQL, SQLite, MongoDB, and others.  Migrations can be read from
filesystem, GitHub, AWS S3, and other sources.")
    (home-page "https://github.com/golang-migrate/migrate")
    (license license:expat)))

(define-public async-profiler-bin
  (package
    (name "async-profiler-bin")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/async-profiler/async-profiler/releases/download/v"
                    version "/async-profiler-" version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "1s1wvhwhnxgcjniixb7v9y57zs0ny3px58jrknhyirqq0j61wqrb"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lib/libasyncProfiler.so" "lib/libasyncProfiler.so")
               ("bin/asprof" "bin/asprof"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "sampling CPU and heap profiler for Java")
    (description "Async-profiler is a low overhead sampling profiler for Java
that does not suffer from the safepoint bias problem.  It features
@code{AsyncGetCallTrace} and @code{perf_events} for accurate profiling of
both Java and native code, including kernel stack traces.  It can profile
CPU, heap allocations, locks, and wall-clock time.")
    (home-page "https://github.com/async-profiler/async-profiler")
    (license license:asl2.0)))

(define-public vgx-bin
  (package
    (name "vgx-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rohansx/vgx/releases/download/v"
                    version "/vgx_linux_amd64"))
              (sha256
               (base32
                "1gw4phbgvkgsnxxjpwhawyfvk9jjynri6sks8qyzlbn221b1bfjf"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vgx_linux_amd64" "bin/vgx"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'make-executable
                 (lambda _
                   (chmod "vgx_linux_amd64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "git pre-commit security scanner with LLM integration")
    (description "VGX is a Git pre-commit hook security scanner that detects
potential vulnerabilities in code changes.  It integrates with large
language models to provide intelligent vulnerability analysis.")
    (home-page "https://github.com/rohansx/vgx")
    (license license:expat)))

(define-public gogitver-bin
  (package
    (name "gogitver-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/syncromatics/gogitver/releases/download/v"
                    version "/linux.tar.gz"))
              (sha256
               (base32
                "08vr850chy1hg3yqfwss1xi4brqham6yfhcshxcp82imk96kh0rs"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gogitver" "bin/gogitver"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "semantic versioning tool using git history")
    (description "GoGitVer derives semantic version numbers from a
project's git history.  It analyzes commit messages to automatically
determine version bumps following the SemVer specification.")
    (home-page "https://github.com/syncromatics/gogitver")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Make/shell packages (gnu-build-system)
;; ═══════════════════════════════════════════════════════════════════

(define-public ruby-install
  (package
    (name "ruby-install")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/postmodern/ruby-install/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "00zwcl0g09mgcyv8vmffz9pyzjh2z6spjgaffsfbn91slzjnypyn"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list bash-minimal))
    (synopsis "tool for installing Ruby, JRuby, and TruffleRuby")
    (description "Ruby-install installs Ruby, JRuby, Rubinius, MRuby, or
TruffleRuby from source.  It supports installing into @file{/opt/rubies/}
or @file{~/.rubies/}, and allows selection of specific versions.")
    (home-page "https://github.com/postmodern/ruby-install")
    (license license:expat)))

(define-public ca0132-tools-git
  (package
    (name "ca0132-tools-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Conmanx360/ca0132-tools")
                    (commit "5e4ae23b17c4ad5925247c0dcbb2b79c2a2f2aba")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0z4fp38ghqpaks429lahrm34i3dqlxhi01n39kk0g50qvi44qqya"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (for-each (lambda (f)
                                 (when (file-exists? f)
                                   (install-file f bin)))
                               '("ca0132-chipio-write"
                                 "ca0132-8051-command-write"
                                 "ca0132-dsp-assembler"
                                 "ca0132-dsp-disassembler"
                                 "ca0132-dsp-op-dumper"))))))))
    (synopsis "diagnostic and programming tools for Creative CA0132 sound cards")
    (description "CA0132-tools provides an assembler, disassembler, and
diagnostic utilities for the Creative Sound Blaster CA0132 HDA codec DSP.
These tools can read/write ChipIO registers and 8051 commands for
reverse engineering and debugging the hardware.")
    (home-page "https://github.com/Conmanx360/ca0132-tools")
    (license license:gpl2)))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages (pyproject-build-system)
;; ═══════════════════════════════════════════════════════════════════

(define-public sqlite-web
  (package
    (name "sqlite-web")
    (version "0.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/s/sqlite-web/"
                    "sqlite-web-" version ".tar.gz"))
              (sha256
               (base32
                "19f2m8c9vs03cx6gvgd6i38civs3jbqmd79jgkppip2c5za5s5z4"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-flask python-peewee python-pygments))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "web-based SQLite database browser")
    (description "Sqlite-web is a web-based SQLite database browser written
in Python.  It provides a convenient interface for viewing and editing
SQLite databases through a web browser, including table browsing, query
execution, and data export.")
    (home-page "https://github.com/coleifer/sqlite-web")
    (license license:expat)))

(define-public python-cmsis-svd
  (package
    (name "python-cmsis-svd")
    (version "0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cmsis-svd/cmsis-svd/archive/refs/tags/python-"
                    version ".tar.gz"))
              (sha256
               (base32
                "1x3fxcjih30b4jivpi2805wz3kh34381rrblmj78zyg713y9q7xc"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir
                 (lambda _
                   (chdir "python"))))))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "Python parser for ARM CMSIS SVD files")
    (description "CMSIS-SVD is a Python library for parsing CMSIS System View
Description (SVD) files.  SVD files describe the peripherals, registers,
and bitfields of ARM Cortex-M microcontrollers.  This is useful for
embedded development tooling and register visualization.")
    (home-page "https://github.com/cmsis-svd/cmsis-svd")
    (license license:asl2.0)))

(define-public automx2
  (package
    (name "automx2")
    (version "2026.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rseichter/automx2/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "03xf1bbnxsifq64v9vrxvlnzfz86qclda6wdgl8sdcp9i9w90cjh"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-flask
           python-flask-migrate
           python-flask-sqlalchemy
           python-ldap3
           python-sqlalchemy))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "mail client autoconfiguration service")
    (description "Automx2 is a mail client autoconfiguration service
implementing the protocols used by Thunderbird (autoconfig), Outlook
(autodiscover), and iOS/macOS (mobileconfig).  It provides a simple
HTTP endpoint that clients query to automatically configure email
accounts.")
    (home-page "https://github.com/rseichter/automx2")
    (license license:gpl3+)))
