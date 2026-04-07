;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #21.
;;; 9 new recipes: 5 binary repacks (loghew-bin, gitopolis-bin,
;;; gito-bin, csvi-bin, pv-migrate-bin), 1 binary repack needing
;;; patchelf (btlescan-bin), 1 binary repack (sqlpage-bin),
;;; 1 Python pyproject (python-partial-json-parser),
;;; 1 Python script install (jadwal-shalat).
;;; 0 compat aliases.
;;; 21 re-blocked with specific reasons.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd21)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system gnu)
  #:use-module (guix utils)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (loghew-bin
            gitopolis-bin
            btlescan-bin
            gito-bin
            csvi-bin
            pv-migrate-bin
            jadwal-shalat
            sqlpage-bin
            python-partial-json-parser))

;; ═══════════════════════════════════════════════════════════════════
;; 1. loghew-bin (3275) — TUI log file viewer (binary)
;; ═══════════════════════════════════════════════════════════════════

(define-public loghew-bin
  (package
    (name "loghew-bin")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nehadyounis/loghew/releases/download/v"
                    version "/loghew-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32 "1d54dyxrig2lk9pg08xlyx8vk00p2bpk7zkrhppmv7hnzy3dwwml"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("loghew" "bin/loghew"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/loghew"))
                          (ld  (search-input-file inputs
                                 "lib/ld-linux-x86-64.so.2"))
                          (rpath (string-append
                                  (assoc-ref inputs "glibc") "/lib:"
                                  (assoc-ref inputs "gcc") "/lib")))
                     (invoke "patchelf" "--set-interpreter" ld bin)
                     (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list glibc (list gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nehadyounis/loghew")
    (synopsis "terminal UI to read and observe log files")
    (description "Loghew is a TUI application for reading and observing
@file{.log} files in the terminal.  It provides an interactive interface
for browsing and monitoring log output.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 2. gitopolis-bin (3278) — Multi-repo git management CLI (binary)
;; ═══════════════════════════════════════════════════════════════════

(define-public gitopolis-bin
  (package
    (name "gitopolis-bin")
    (version "1.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/timabell/gitopolis/releases/download/v"
                    version "/gitopolis-linux-x86_64.tar.gz"))
              (sha256
               (base32 "1bk6pgllqc0sr16s0r1qpc0lqd0x1csvnd1yg93l825xi06skxqd"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gitopolis" "bin/gitopolis"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/timabell/gitopolis")
    (synopsis "manage multiple git repositories from the command line")
    (description "Gitopolis is a CLI tool for managing multiple git
repositories.  It can run commands across repos, clone and organize them,
and tag repos for grouping.")
    (license license:agpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; 3. btlescan-bin (3291) — Bluetooth Low Energy scanner (binary)
;; ═══════════════════════════════════════════════════════════════════

(define-public btlescan-bin
  (package
    (name "btlescan-bin")
    (version "1.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ztroop/btlescan/releases/download/"
                    version "/btlescan-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0wzmvp5z85scywwdz252pjz1cg5955qqzqda9c6phlava6540b4f"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("btlescan" "bin/btlescan"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/btlescan"))
                          (ld  (search-input-file inputs
                                 "lib/ld-linux-x86-64.so.2"))
                          (rpath (string-append
                                  (assoc-ref inputs "glibc") "/lib:"
                                  (assoc-ref inputs "gcc") "/lib:"
                                  (assoc-ref inputs "dbus") "/lib")))
                     (invoke "patchelf" "--set-interpreter" ld bin)
                     (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list glibc
                  (list gcc "lib")
                  dbus))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ztroop/btlescan")
    (synopsis "bluetooth Low Energy scanner for the terminal")
    (description "Btlescan scans for nearby Bluetooth Low Energy (BLE)
devices and displays their information in the terminal.  It reports
device names, signal strength, and other BLE advertisement data.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 4. gito-bin (3293) — AI-assisted git commit CLI (binary)
;; ═══════════════════════════════════════════════════════════════════

(define-public gito-bin
  (package
    (name "gito-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AlvaroHoux/gito/releases/download/v"
                    version "/gito_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0d10xgx8cs7513az52mp108yywp0jhcyap6fjr1rsklxm3nr83hn"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gito" "bin/gito"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AlvaroHoux/gito")
    (synopsis "AI-assisted git commit message generator")
    (description "Gito captures staged git changes and uses an LLM to
generate commit messages.  It provides context from diffs to produce
meaningful, descriptive commit messages automatically.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 5. csvi-bin (3300) — Interactive CSV editor for the terminal (binary)
;; ═══════════════════════════════════════════════════════════════════

(define-public csvi-bin
  (package
    (name "csvi-bin")
    (version "1.23.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hymkor/csvi/releases/download/v"
                    version "/csvi-v" version "-linux-amd64.zip"))
              (sha256
               (base32 "05j90bv5q4m1r32g356nq6d67jsrqk4f31j280l1mv13ff1r8qxp"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("csvi" "bin/csvi"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hymkor/csvi")
    (synopsis "interactive CSV editor for the terminal")
    (description "Csvi is a terminal-based interactive CSV editor.  It
provides a spreadsheet-like interface for editing CSV files directly
in the terminal with keyboard navigation and cell editing.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 6. pv-migrate-bin (3452) — Kubernetes PV migration CLI (binary)
;; ═══════════════════════════════════════════════════════════════════

(define-public pv-migrate-bin
  (package
    (name "pv-migrate-bin")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/utkuozdemir/pv-migrate/releases/download/v"
                    version "/pv-migrate_v" version "_linux_x86_64.tar.gz"))
              (sha256
               (base32 "029zr2ia24j2h85skiwsl5wsf0nadg4yfsy49iiy9vcybdnfs45f"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pv-migrate" "bin/pv-migrate")
               ("completions/pv-migrate.bash"
                "share/bash-completion/completions/pv-migrate")
               ("completions/pv-migrate.zsh"
                "share/zsh/site-functions/_pv-migrate")
               ("completions/pv-migrate.fish"
                "share/fish/vendor_completions.d/pv-migrate.fish"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'unpack 'chdir-to-root
                 (lambda _
                   ;; Flat tarball: unpack chdired into completions/
                   ;; Go back to the parent where the binary is
                   (chdir ".."))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/utkuozdemir/pv-migrate")
    (synopsis "migrate Kubernetes persistent volumes between clusters")
    (description "Pv-migrate is a CLI tool for migrating data between
Kubernetes persistent volumes.  It supports migration across clusters
and namespaces, using rsync-based strategies for reliable data transfer.")
    (license license:asl2.0)))

;; ═══════════════════════════════════════════════════════════════════
;; 7. jadwal-shalat (3281) — Islamic prayer time CLI
;; ═══════════════════════════════════════════════════════════════════

(define-public jadwal-shalat
  (package
    (name "jadwal-shalat")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Bangkah/jadwal-shalat/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0izlnipi2rln38vqw4vrvm72spfpb7k0ja624ccl0n5qn66kk6h8"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (lib (string-append out "/lib/jadwal-shalat")))
                     (mkdir-p bin)
                     (mkdir-p lib)
                     (copy-file "jadwal-shalat.py"
                                (string-append lib "/jadwal-shalat.py"))
                     (let ((wrapper (string-append bin "/jadwal-shalat")))
                       (with-output-to-file wrapper
                         (lambda ()
                           (format #t "#!~a~%exec ~a ~a/jadwal-shalat.py \"$@\"~%"
                                   (search-input-file %build-inputs "bin/bash")
                                   (search-input-file %build-inputs "bin/python3")
                                   lib)))
                       (chmod wrapper #o755))))))))
    (inputs (list bash-minimal python python-requests))
    (home-page "https://github.com/Bangkah/jadwal-shalat")
    (synopsis "display Islamic prayer times in the terminal")
    (description "Jadwal-shalat is a command-line tool that displays
Islamic prayer times (jadwal shalat) based on IP geolocation or manual
location input.  It fetches prayer schedule data and presents it in
a formatted terminal display.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 8. sqlpage-bin (3307) — SQL-only web application builder (binary)
;; ═══════════════════════════════════════════════════════════════════

(define-public sqlpage-bin
  (package
    (name "sqlpage-bin")
    (version "0.43.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sqlpage/SQLPage/releases/download/v"
                    version "/sqlpage-linux.tgz"))
              (sha256
               (base32 "1wr64sf52dcgqfiv5phn5jirri37k8kxv1fwyva090s4asdkyv0k"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sqlpage.bin" "bin/sqlpage"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'unpack 'chdir-to-root
                 (lambda _
                   ;; Unpack chdirs into sqlpage/ subdir; go back up
                   (when (not (file-exists? "sqlpage.bin"))
                     (chdir ".."))))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/sqlpage"))
                          (ld  (search-input-file inputs
                                 "lib/ld-linux-x86-64.so.2"))
                          (rpath (string-append
                                  (assoc-ref inputs "glibc") "/lib:"
                                  (assoc-ref inputs "gcc") "/lib")))
                     (chmod bin #o755)
                     (invoke "patchelf" "--set-interpreter" ld bin)
                     (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list glibc (list gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sqlpage/SQLPage")
    (synopsis "SQL-only web application builder")
    (description "SQLPage is a web application server that generates a
full web UI directly from SQL queries.  It automatically renders pages
with forms, tables, charts, and other components based on the SQL
output, requiring no frontend code.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 9. python-partial-json-parser (3284) — Parse partial JSON strings
;; ═══════════════════════════════════════════════════════════════════

(define-public python-partial-json-parser
  (package
    (name "python-partial-json-parser")
    (version "0.2.1.1.post7")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "partial_json_parser" version))
              (sha256
               (base32 "08m9r4r936bnncyy4v2c9y4bb3027wrd45zw5nd77dmwlqdhwnc6"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite in sdist
    (native-inputs (list python-pdm-backend))
    (home-page "https://github.com/promplate/partial-json-parser")
    (synopsis "parse partial or incomplete JSON strings")
    (description "Partial-json-parser is a lightweight Python library
for parsing partial or incomplete JSON strings.  It is useful for
processing streaming output from LLMs or other sources that produce
JSON incrementally.")
    (license license:expat)))
