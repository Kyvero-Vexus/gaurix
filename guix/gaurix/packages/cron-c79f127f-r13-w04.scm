;;; Worker w04 batch (r13): resolve blocked packages.
(define-module (gaurix packages cron-c79f127f-r13-w04)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system copy)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages emacs)
  #:autoload (gnu packages) (specification->package)
  #:export (python-art
            python-munge
            sqlite-utils
            xrizer-common
            doas
            jdk21-temurin
            babashka-bin
            emacs-deco
            aspnet-targeting-pack-bin
            advantagescope))


;;; ---- 1. python-art ----
;;; Strategy: Source build (setuptools) from PyPI.

(define-public python-art
  (package
    (name "python-art")
    (version "6.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sepandhaghighi/art/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1qswlwzmr41251fpgzsgp35brjkfg4b56lvbnw24w87iq1662nlh"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/sepandhaghighi/art")
    (synopsis "ASCII art library for Python")
    (description
     "Art is a Python library for rendering decorative ASCII art text, fonts,
and one-line art symbols.  It supports hundreds of ASCII fonts and thousands
of art symbols.")
    (license license:expat)))


;;; ---- 2. python-munge ----
;;; Strategy: Source build (pyproject / hatchling).

(define-public python-munge
  (package
    (name "python-munge")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/20c/munge/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1pb6xqx27xkxvxq187lpp7f0k7kjyfpawclr9gqgf135sdjq8w0v"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list (specification->package "python-hatchling")))
    (propagated-inputs
     (list (specification->package "python-requests")
           (specification->package "python-click")
           (specification->package "python-toml")
           (specification->package "python-tomlkit")
           (specification->package "python-pyyaml")
           (specification->package "python-urllib3")
           (specification->package "python-charset-normalizer")))
    (home-page "https://github.com/20c/munge")
    (synopsis "Data manipulation and configuration file parsing library")
    (description
     "Munge is a Python library and CLI for reading, manipulating, and writing
configuration data in YAML, TOML, and JSON formats.")
    (license license:asl2.0)))


;;; ---- 3. sqlite-utils ----
;;; Strategy: Source build (setuptools) from PyPI.

(define-public sqlite-utils
  (package
    (name "sqlite-utils")
    (version "3.39")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/s/sqlite-utils/"
             "sqlite_utils-" version ".tar.gz"))
       (sha256
        (base32 "1kfvz4ga254sjwfv7fx9skpz9g7y4xspk0vjck4vagiykg1fm8mz"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list (specification->package "python-sqlite-fts4")
           (specification->package "python-click")
           (specification->package "python-click-default-group")
           (specification->package "python-tabulate")
           (specification->package "python-dateutil")
           (specification->package "python-pluggy")))
    (home-page "https://sqlite-utils.datasette.io/")
    (synopsis "CLI tool and Python library for manipulating SQLite databases")
    (description
     "sqlite-utils provides a command-line tool and Python library for creating,
querying, and manipulating SQLite databases.  It supports full-text search,
data import/export, and schema introspection.")
    (license license:asl2.0)))


;;; ---- 4. xrizer-common ----
;;; Strategy: Data/asset package.  Installs LICENSE + README from the xrizer
;;; source tarball (the common data/config files for xrizer OpenVR-to-OpenXR).

(define-public xrizer-common
  (package
    (name "xrizer-common")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Supreeeme/xrizer/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1lv7nwmw06bkqkgdkd8alzhsp5s7bs0lcf9rk9kdk3v0p32xq7wg"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source #$source)
                 (out #$output)
                 (doc (string-append out "/share/doc/xrizer-common"))
                 (license-dir (string-append out "/share/licenses/xrizer-common")))
            (setenv "PATH" (string-append
                            #$(this-package-native-input "tar") "/bin:"
                            #$(this-package-native-input "gzip") "/bin"))
            (invoke "tar" "xzf" source)
            (mkdir-p doc)
            (mkdir-p license-dir)
            (copy-file (string-append "xrizer-" #$version "/README.md")
                       (string-append doc "/README.md"))
            (copy-file (string-append "xrizer-" #$version "/LICENSE")
                       (string-append license-dir "/LICENSE"))
            #t))))
    (native-inputs (list tar gzip))
    (home-page "https://github.com/Supreeeme/xrizer")
    (synopsis "Common data files for xrizer (OpenVR-to-OpenXR layer)")
    (description
     "This package provides common data files for xrizer, a reimplementation
of OpenVR that translates calls to OpenXR.")
    (license license:gpl3+)))


;;; ---- 5. doas ----
;;; Strategy: Compat alias to upstream opendoas.

(define-public doas
  (let ((upstream (specification->package "opendoas")))
    (package
      (inherit upstream)
      (name "doas")
      (synopsis "Compatibility alias mapping doas to upstream opendoas")
      (description
       "This package maps the AUR @code{doas} name to the upstream Guix
@code{opendoas} package, a minimal replacement for sudo from the OpenBSD
project."))))


;;; ---- 6. jdk21-temurin ----
;;; Strategy: Binary repackage of Eclipse Temurin JDK 21 for x86_64 Linux.

(define-public jdk21-temurin
  (package
    (name "jdk21-temurin")
    (version "21.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/adoptium/temurin21-binaries/releases/download/"
             "jdk-" version "%2B6"
             "/OpenJDK21U-jdk_x64_linux_hotspot_" version "_6.tar.gz"))
       (sha256
        (base32 "1q1c2nn926x0di7msqk62dar0237h5pbfqfb39a3y6dpy373lkcp"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:strip-binaries? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source "--strip-components=1")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (copy-recursively "." out)))))))
    (native-inputs (list tar gzip))
    (home-page "https://adoptium.net/")
    (synopsis "Eclipse Temurin JDK 21 (prebuilt OpenJDK 21 binaries)")
    (description
     "Eclipse Temurin is a prebuilt distribution of the OpenJDK provided by
the Adoptium project.  This package provides the JDK 21 binaries for
x86_64 Linux.")
    (license (license:non-copyleft
              "https://openjdk.org/legal/gplv2+ce.html"
              "GPLv2 with Classpath Exception"))))


;;; ---- 7. babashka-bin ----
;;; Strategy: Binary repackage of prebuilt babashka static binary.

(define-public babashka-bin
  (package
    (name "babashka-bin")
    (version "1.12.217")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/babashka/babashka/releases/download/v"
             version "/babashka-" version "-linux-amd64-static.tar.gz"))
       (sha256
        (base32 "11n45qpxnbjx3yp0d1wr7vxd6g3cvpmgyvg5mf0sy82hapjgyyqk"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:strip-binaries? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source)))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (install-file "bb" bin)))))))
    (native-inputs (list tar gzip))
    (home-page "https://github.com/babashka/babashka")
    (synopsis "Fast-starting Clojure scripting runtime")
    (description
     "Babashka is a native Clojure interpreter for scripting with fast startup.
It provides a batteries-included scripting environment for Clojure,
suitable for replacing Bash scripts with Clojure programs.")
    (license license:epl1.0)))


;;; ---- 8. emacs-deco ----
;;; Strategy: Compat alias to emacs-pgtk (same version 30.2, PGTK enabled).

(define-public emacs-deco
  (package
    (inherit emacs-pgtk)
    (name "emacs-deco")
    (synopsis "Emacs with PGTK support (compatibility alias for emacs-deco)")
    (description
     "This package maps the AUR @code{emacs-deco} name to the upstream Guix
@code{emacs-pgtk} package, which provides Emacs with PGTK (Pure GTK) support
enabled, the same base feature set as AUR's emacs-deco.")))


;;; ---- 9. aspnet-targeting-pack-bin ----
;;; Strategy: NuGet package extraction of ASP.NET Core reference assemblies.

(define-public aspnet-targeting-pack-bin
  (package
    (name "aspnet-targeting-pack-bin")
    (version "10.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://api.nuget.org/v3-flatcontainer/"
             "microsoft.aspnetcore.app.ref/"
             version "/microsoft.aspnetcore.app.ref." version ".nupkg"))
       (sha256
        (base32 "0flx7iq5a0kflsd7zg0d3jkfp2xhjprhq00q7nhwz556mcblz8ah"))))
    (build-system gnu-build-system)
    (native-inputs (list (specification->package "unzip")))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "unzip" "-q" source "-d" "source")
              (chdir "source")))
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (pack-root
                      (string-append
                       out "/share/dotnet/packs/"
                       "Microsoft.AspNetCore.App.Ref/" #$version)))
                (mkdir-p pack-root)
                (for-each
                 (lambda (entry)
                   (let ((src entry))
                     (when (file-exists? src)
                       (copy-recursively src
                                         (string-append pack-root "/" entry)))))
                 '("ref" "data" "analyzers"))
                (for-each
                 (lambda (file)
                   (when (file-exists? file)
                     (install-file file pack-root)))
                 '("Microsoft.AspNetCore.App.Ref.nuspec"
                   "LICENSE.TXT"
                   "PACKAGE.md"))))))))
    (home-page "https://dotnet.microsoft.com/")
    (synopsis "ASP.NET Core targeting pack reference assemblies (binary)")
    (description
     "This package installs the Microsoft.AspNetCore.App.Ref targeting pack,
providing reference assemblies and design-time assets used to compile ASP.NET
Core applications against a specific runtime version.")
    (license license:expat)))


;;; ---- 10. advantagescope ----
;;; Strategy: Binary repackage from Electron app (pacman/tar.zst archive).

(define-public advantagescope
  (package
    (name "advantagescope")
    (version "4.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Mechanical-Advantage/AdvantageScope/"
             "releases/download/v" version
             "/advantagescope-linux-x64-v" version ".pacman"))
       (sha256
        (base32 "0wz2s820ygyaqm67i7nbwsfwg1bzjbmx432r34hxm9zi26p0k9wb"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:strip-binaries? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              ;; .pacman files are zstd-compressed tar archives.
              (invoke #$(file-append (specification->package "zstd") "/bin/zstd")
                      "-d" source "-o" "archive.tar")
              (invoke "tar" "xf" "archive.tar")))
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out")))
                ;; pacman archives contain usr/ subtree
                (when (file-exists? "usr")
                  (copy-recursively "usr" out))
                ;; Ensure the binary is executable
                (let ((bin (string-append out "/bin/advantagescope")))
                  (when (file-exists? bin)
                    (chmod bin #o755)))))))))
    (native-inputs
     (list tar (specification->package "zstd")))
    (home-page "https://github.com/Mechanical-Advantage/AdvantageScope")
    (synopsis "Robot diagnostics, log review, and data visualization tool")
    (description
     "AdvantageScope is an FRC robot diagnostics, log review/analysis, and data
visualization application.  It supports NetworkTables, WPILib data logs, and
Driver Station logs.")
    (license license:expat)))
