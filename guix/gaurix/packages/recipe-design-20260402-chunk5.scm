(define-module (gaurix packages recipe-design-20260402-chunk5)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages synergy)
  #:export (sabiql-bin
            synergy3-bin
            c++utilities
            xrizer-common
            pilowlava-font-common
            sqlite-utils
            samsung-unified-driver-common
            hadolint-bin
            otf-unifont
            rust-docs))

(define-public sabiql-bin
  (package
    (name "sabiql-bin")
    (version "1.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/riii111/sabiql/releases/download/v"
                           version
                           "/sabiql-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0mp1x9k4v9r5snba1m07ywbhx6d6kx85zrbhq19wrkh2bv24y0ay"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (bin (string-append out "/bin")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (mkdir-p bin)
            (copy-file "sabiql" (string-append bin "/sabiql"))
            (chmod (string-append bin "/sabiql") #o755)
            #t))))
    (home-page "https://github.com/riii111/sabiql")
    (synopsis "Driverless TUI client for PostgreSQL")
    (description
     "Sabiql-bin installs the upstream prebuilt Linux binary of SabiQL, a
terminal user interface for browsing and editing PostgreSQL databases.")
    (license license:expat)))

(define-public synergy3-bin
  (package
    (inherit synergy)
    (name "synergy3-bin")
    (synopsis "Compatibility alias for Synergy keyboard/mouse sharing")
    (description
     "This compatibility package provides the AUR-style name
@code{synergy3-bin} by re-exporting the free software @code{synergy} package
already available in upstream Guix.")))

(define-public c++utilities
  ;; Arch compatibility alias: AUR "c++utilities" tracks upstream
  ;; "cpp-utilities".
  (package
    (inherit cpp-utilities)
    (name "c++utilities")
    (synopsis "Common C++ classes and routines")))

(define-public xrizer-common
  (package
    (name "xrizer-common")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xrizer.tar.gz")
       (sha256
        (base32 "0cg1z5lb0wzph6imlx4vqf83jj2dxv3m80zwxxfmx4x4g6yxvgdz"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("openvrpaths.vrpath" "opt/xrizer/openvrpaths.vrpath"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'add-empty-version-file
            (lambda _
              (let ((version-dir (string-append #$output "/opt/xrizer/bin"))
                    (version-file (string-append #$output
                                                 "/opt/xrizer/bin/version.txt")))
                (mkdir-p version-dir)
                (call-with-output-file version-file (lambda (_) #t))))))))
    (home-page "https://github.com/Supreeeme/xrizer")
    (synopsis "Common data files for xrizer")
    (description
     "This package provides the shared data files used by xrizer clients,
including the default OpenVR path mapping and runtime version marker.")
    (license license:gpl3+)))

(define-public pilowlava-font-common
  (package
    (name "pilowlava-font-common")
    (version "2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://events.ccc.de/congress/2024/infos/styleguide/"
             "38c3-styleguide-full-v2.zip"))
       (sha256
        (base32 "05jjgxrfvzm5k5d6mmd1xr47kfhabaghxrv4pyapmjc5zjy5mrls"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key source outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (tmp (string-append (getcwd) "/pilowlava-src"))
                     (src-root (if (and source (file-is-directory? source))
                                   source
                                   (begin
                                     (mkdir-p tmp)
                                     (invoke "unzip" "-q" source "-d" tmp)
                                     tmp)))
                     (base (string-append src-root "/fonts/pilowlava"))
                     (doc (string-append out "/share/doc/pilowlava-font"))
                     (lic (string-append out "/share/licenses/pilowlava-font")))
                (unless (file-exists? (string-append base "/FONTLOG.md"))
                  (error "pilowlava font docs not found" base))
                (mkdir-p doc)
                (mkdir-p lic)
                (copy-file (string-append base "/FONTLOG.md")
                           (string-append doc "/FONTLOG.md"))
                (copy-file (string-append base "/README.md")
                           (string-append doc "/README.md"))
                (copy-file (string-append base "/TRADEMARKS.md")
                           (string-append doc "/TRADEMARKS.md"))
                (copy-recursively (string-append base "/documentation")
                                  (string-append doc "/documentation"))
                (copy-file (string-append base "/COPYRIGHT.md")
                           (string-append lic "/COPYRIGHT.md"))
                (copy-file (string-append base "/License.txt")
                           (string-append lic "/License.txt"))))))))
    (home-page "https://events.ccc.de/congress/2024/infos/styleguide.html")
    (synopsis "Common documentation and licensing for Pilowlava font")
    (description
     "This package installs the shared documentation and license files for the
Pilowlava font family from the 38C3 style guide assets.")
    (license license:silofl1.1)))

(define python-sqlite-fts4-without-tests
  ;; Upstream package currently fails in `check` because setuptools dropped the
  ;; legacy `setup.py test` command path.
  (package
    (inherit python-sqlite-fts4)
    (name "python-sqlite-fts4")
    (arguments
     (substitute-keyword-arguments (package-arguments python-sqlite-fts4)
       ((#:tests? tests? #f) #f)))))

(define-public sqlite-utils
  (package
    (inherit python-sqlite-utils)
    (name "sqlite-utils")
    (propagated-inputs
     (modify-inputs (package-propagated-inputs python-sqlite-utils)
       (replace "python-sqlite-fts4" python-sqlite-fts4-without-tests)))
    (synopsis "CLI and Python utilities for SQLite")
    (description
     "Compatibility package for the Arch-style @code{sqlite-utils} name,
backed by the upstream Guix @code{python-sqlite-utils} package.")))

(define-public samsung-unified-driver-common
  (package
    (name "samsung-unified-driver-common")
    (version "1.00.39")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloadcenter.samsung.com/content/DR/201704/"
             "20170407143829533/uld_V" version "_01.17.tar.gz"))
       (sha256
        (base32 "0ik7mrvaxjw0cqhddhv7gj380s8wwdz3i1jqjq9g67z1n7wndh89"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("noarch/license/eula.txt"
           "share/licenses/samsung-unified-driver-common/LICENSE")
          ("noarch/license/eula-fr.txt"
           "share/licenses/samsung-unified-driver-common/eula-fr.txt"))))
    (home-page "https://www.samsung.com")
    (synopsis "Samsung Unified Linux Driver common files")
    (description
     "This package provides common files from Samsung's Unified Linux Driver,
currently the EULA/license payload used by related printer and scanner driver
packages.")
    (license
     (license:non-copyleft "https://downloadcenter.samsung.com/"))))

(define-public hadolint-bin
  (package
    (name "hadolint-bin")
    (version "2.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/hadolint/hadolint/releases/download/v"
                           version
                           "/hadolint-Linux-x86_64"))
       (sha256
        (base32 "0issvklkjvyckgckn6zn900mqhi7knbqnkh1vn26rxc48sa2dwkb"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/hadolint"))
            (chmod (string-append bin "/hadolint") #o755)
            #t))))
    (home-page "https://github.com/hadolint/hadolint")
    (synopsis "Dockerfile linter")
    (description
     "Hadolint-bin installs the upstream prebuilt hadolint binary, a
Dockerfile linter that checks container build files for best practices and
common mistakes.")
    (license license:gpl3+)))

(define-public otf-unifont
  (package
    (name "otf-unifont")
    (version "17.0.04")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://unifoundry.com/pub/unifont/unifont-"
                           version
                           "/unifont-"
                           version
                           ".tar.gz"))
       (sha256
        (base32 "0d4snpiqz21wrhw9s2wli3m5gk7c1ib6hbm6pkfqk07rdvawaljw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (root (if (file-exists? "font/precompiled")
                               "."
                               (string-append "unifont-" #$version)))
                     (prefix (if (string=? root ".")
                                 ""
                                 (string-append root "/")))
                     (fonts (string-append prefix "font/precompiled"))
                     (font-dir (string-append out "/share/fonts/opentype/unifont"))
                     (lic (string-append out "/share/licenses/otf-unifont")))
                (mkdir-p font-dir)
                (copy-file (string-append fonts "/unifont-" #$version ".otf")
                           (string-append font-dir "/Unifont.otf"))
                (copy-file (string-append fonts "/unifont_jp-" #$version ".otf")
                           (string-append font-dir "/Unifont_jp.otf"))
                (copy-file (string-append fonts "/unifont_upper-" #$version ".otf")
                           (string-append font-dir "/Unifont_Upper.otf"))
                (copy-file (string-append fonts "/unifont_csur-" #$version ".otf")
                           (string-append font-dir "/Unifont_CSUR.otf"))
                (mkdir-p lic)
                (copy-file (string-append prefix "OFL-1.1.txt")
                           (string-append lic "/OFL-1.1.txt"))
                (copy-file (string-append prefix "COPYING")
                           (string-append lic "/COPYING"))
                #t))))))
    (home-page "https://unifoundry.com/unifont/index.html")
    (synopsis "OpenType version of GNU Unifont")
    (description
     "This package provides OpenType builds of GNU Unifont, including the
main Unifont face plus Japanese, Upper, and CSUR variants.")
    ;; Upstream ships both OFL-1.1 and GPL-2+ licensing texts.
    (license (list license:silofl1.1 license:gpl2+))))

(define-public rust-docs
  (package
    (name "rust-docs")
    (version "1.94.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://static.rust-lang.org/dist/rust-docs-"
                           version
                           "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0zp21knk9048lw1jk4kgrk71h01dvddf0l42fx919250nincypwg"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (root (if (file-exists? "rust-docs/share/doc/rust/html")
                               "."
                               (string-append "rust-docs-" #$version
                                              "-x86_64-unknown-linux-gnu")))
                     (prefix (if (string=? root ".")
                                 ""
                                 (string-append root "/")))
                     (html-src (string-append prefix "rust-docs/share/doc/rust/html"))
                     (doc-dir (string-append out "/share/doc/rust-docs"))
                     (lic (string-append out "/share/licenses/rust-docs")))
                (mkdir-p doc-dir)
                (copy-recursively html-src
                                  (string-append doc-dir "/html"))
                (mkdir-p lic)
                (copy-file (string-append prefix "COPYRIGHT")
                           (string-append lic "/COPYRIGHT"))
                (copy-file (string-append prefix "LICENSE-MIT")
                           (string-append lic "/LICENSE-MIT"))
                (copy-file (string-append prefix "LICENSE-APACHE")
                           (string-append lic "/LICENSE-APACHE"))
                #t))))))
    (home-page "https://rust-lang.org/")
    (synopsis "Offline HTML documentation for Rust")
    (description
     "Rust-docs installs the upstream prebuilt offline HTML documentation for
Rust, including the standard library, Rust book, Cargo guide, and reference
manual pages.")
    (license (list license:asl2.0 license:expat))))
