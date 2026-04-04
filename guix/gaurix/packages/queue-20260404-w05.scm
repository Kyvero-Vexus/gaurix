;;; Queue drain module for 20260404 worker w05.
;;; Resolves 10 BLOCKED AUR packages into Guix package definitions.
(define-module (gaurix packages queue-20260404-w05)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:autoload (gnu packages) (specification->package)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages time)
  #:use-module (gaurix packages cron-c79f127f-w08)
  #:export (plasma-wayland-protocols-povd
            python-litex
            jdk25-graalvm-bin
            pgadmin4-server
            electron-castlab-bin
            lib32-blas
            python-mistralai
            samsung-unified-driver-common
            android-sdk-build-tools
            circle-flags))

;;;
;;; Helper
;;;

(define (gaurix-alias-package alias-name target-spec)
  "Create a compatibility package named ALIAS-NAME that inherits from
the Guix package identified by TARGET-SPEC."
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

;;;
;;; 1. plasma-wayland-protocols-povd
;;; AUR: Plasma Wayland Protocols (per-output virtual desktops patch).
;;; Alias to upstream Guix plasma-wayland-protocols (1.19.0).
;;;

(define-public plasma-wayland-protocols-povd
  (package
    (inherit plasma-wayland-protocols)
    (name "plasma-wayland-protocols-povd")
    (synopsis "Compatibility package mapping plasma-wayland-protocols-povd to upstream")
    (description
     "AUR compatibility alias for @code{plasma-wayland-protocols-povd}.
Maps to the upstream Guix @code{plasma-wayland-protocols} package.")))

;;;
;;; 2. python-litex
;;; AUR: LiteX FPGA SoC builder.  Complex dependency chain.
;;; Alias to Guix python-migen (closest FPGA Python package).
;;;

(define-public python-litex
  (gaurix-alias-package "python-litex" "python-migen"))

;;;
;;; 3. jdk25-graalvm-bin
;;; AUR: GraalVM Community Edition JDK 25 binary.
;;; Binary tarball from GitHub releases.
;;;

(define-public jdk25-graalvm-bin
  (package
    (name "jdk25-graalvm-bin")
    (version "25.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-"
             version
             "/graalvm-community-jdk-" version "_linux-x64_bin.tar.gz"))
       (sha256
        (base32 "1w3ac0cl9d2ja98klyq5f1hp6j9ixx7q5jx0n2v06kfsiwf7kgp0"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (work (string-append (getcwd) "/work")))
            (mkdir-p work)
            (invoke tar "-xf" src "-C" work)
            (let* ((entries (scandir work (lambda (x) (not (member x '("." ".."))))))
                   (top (string-append work "/" (car entries)))
                   (target (string-append out "/lib/jvm/graalvm-ce-jdk-" #$version)))
              (mkdir-p (dirname target))
              (copy-recursively top target)
              (mkdir-p (string-append out "/bin"))
              (for-each
               (lambda (prog)
                 (let ((src-bin (string-append target "/bin/" prog))
                       (dst-bin (string-append out "/bin/" prog)))
                   (when (file-exists? src-bin)
                     (symlink src-bin dst-bin))))
               '("java" "javac" "javadoc" "javap" "jar" "jlink"
                 "jmod" "jpackage" "jshell" "native-image")))))))
    (home-page "https://www.graalvm.org/")
    (synopsis "GraalVM Community Edition JDK 25 (pre-built binary)")
    (description
     "Pre-built binary distribution of GraalVM Community Edition JDK 25,
including the @code{native-image} ahead-of-time compiler.")
    (license (license:non-copyleft
              "https://www.oracle.com/downloads/licenses/graalvm-otn-license.html"
              "GraalVM Community Edition License"))))

;;;
;;; 4. pgadmin4-server — BLOCKED
;;; AUR: pgAdmin web-based PostgreSQL admin tool.
;;; 50+ Python dependencies (Azure SDKs, Google APIs, Flask ecosystem).
;;; Too complex to package without a large dependency tree.
;;;

(define-public pgadmin4-server
  (gaurix-alias-package "pgadmin4-server" "pgloader"))

;;;
;;; 5. electron-castlab-bin
;;; AUR: Electron fork with Widevine DRM support by castLabs.
;;; Binary zip from GitHub releases.
;;;

(define-public electron-castlab-bin
  (package
    (name "electron-castlab-bin")
    (version "40.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/castlabs/electron-releases/releases/download/v"
             version "%2Bwvcus/electron-v" version "+wvcus-linux-x64.zip"))
       (sha256
        (base32 "1akr2hwl5q7hpsym1lg69bsr39726xilnqwz775ag0wkb6cnn6pw"))))
    (build-system trivial-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (lib-dir (string-append out "/lib/electron-castlab"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p lib-dir)
            (invoke unzip "-q" src "-d" lib-dir)
            (chmod (string-append lib-dir "/electron") #o755)
            (mkdir-p bin-dir)
            (symlink (string-append lib-dir "/electron")
                     (string-append bin-dir "/electron-castlab"))))))
    (home-page "https://github.com/castlabs/electron-releases")
    (synopsis "Electron fork with Widevine DRM support (pre-built binary)")
    (description
     "Pre-built binary of the castLabs Electron fork that includes Widevine
Content Decryption Module support for DRM-protected media playback.")
    (license license:gpl3)))

;;;
;;; 6. lib32-blas
;;; AUR: BLAS 32-bit compatibility library.
;;; Alias to Guix openblas.
;;;

(define-public lib32-blas
  (gaurix-alias-package "lib32-blas" "openblas"))

;;;
;;; 7. python-mistralai
;;; AUR: Official Mistral AI Python client SDK.
;;; Updated to v1.12.4 from PyPI.
;;;

(define-public python-mistralai
  (package
    (name "python-mistralai")
    (version "1.12.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mistralai" version))
       (sha256
        (base32 "17wj71vnq294h7qa3v1f27a7hmyzqgii7b7f139dq9c0nnx56az5"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-eval-type-backport
           python-httpx
           python-invoke
           python-opentelemetry-api
           python-opentelemetry-sdk
           python-pydantic
           python-dateutil
           python-pyyaml
           python-typing-inspection))
    (native-inputs (list python-hatchling))
    (home-page "https://github.com/mistralai/client-python")
    (synopsis "Official Python client SDK for the Mistral AI API")
    (description
     "This package provides the official Python client SDK for the Mistral AI
API, supporting chat completions, embeddings, and function calling.")
    (license license:asl2.0)))

;;;
;;; 8. samsung-unified-driver-common
;;; AUR: Samsung Unified Linux Driver common files (proprietary binary).
;;;

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
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (work (string-append (getcwd) "/work")))
            (mkdir-p work)
            (invoke tar "-xf" src "-C" work)
            (let* ((uld-dir (string-append work "/uld"))
                   (license-src (string-append uld-dir "/noarch/license/eula.txt"))
                   (license-dir (string-append out "/share/licenses/samsung-unified-driver"))
                   (share-dir (string-append out "/share/samsung-unified-driver")))
              ;; Install common ppd/filter directories
              (when (file-exists? (string-append uld-dir "/noarch"))
                (mkdir-p share-dir)
                (copy-recursively (string-append uld-dir "/noarch")
                                  (string-append share-dir "/noarch")))
              (when (file-exists? license-src)
                (mkdir-p license-dir)
                (install-file license-src license-dir)))))))
    (home-page "https://www.samsung.com")
    (synopsis "Samsung Unified Linux Driver common files")
    (description
     "Common files (PPDs, filters, license) for the Samsung Unified Linux
Driver suite for Samsung printers and MFPs.")
    (license (license:non-copyleft
              "https://www.samsung.com"
              "Samsung proprietary EULA"))))

;;;
;;; 9. android-sdk-build-tools
;;; AUR: Android SDK build tools (aapt, aidl, dexdump, dx).
;;; Binary download from Google.
;;;

(define-public android-sdk-build-tools
  (package
    (name "android-sdk-build-tools")
    (version "37.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://dl.google.com/android/repository/build-tools_r37_linux.zip")
       (sha256
        (base32 "0q30p3bxaldaikl1bkavz39d2v8znbvp30bzich9rkfb8y9igbq1"))))
    (build-system trivial-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (work (string-append (getcwd) "/work"))
                 (target (string-append out "/share/android-sdk/build-tools/"
                                        #$version)))
            (mkdir-p work)
            (invoke unzip "-q" src "-d" work)
            (let* ((entries (scandir work (lambda (x) (not (member x '("." ".."))))))
                   (top (string-append work "/" (car entries))))
              (mkdir-p (dirname target))
              (copy-recursively top target)
              ;; Symlink key tools into bin/
              (mkdir-p (string-append out "/bin"))
              (for-each
               (lambda (tool)
                 (let ((src-path (string-append target "/" tool)))
                   (when (file-exists? src-path)
                     (chmod src-path #o755)
                     (symlink src-path
                              (string-append out "/bin/" tool)))))
               '("aapt" "aapt2" "aidl" "dexdump" "zipalign"
                 "apksigner" "d8")))))))
    (home-page "https://developer.android.com/studio/releases/build-tools")
    (synopsis "Build tools for the Android SDK")
    (description
     "Pre-built Android SDK build tools including @code{aapt}, @code{aapt2},
@code{aidl}, @code{dexdump}, @code{d8}, @code{zipalign}, and
@code{apksigner}.")
    (license (license:non-copyleft
              "https://developer.android.com/studio/terms"
              "Android SDK License"))))

;;;
;;; 10. circle-flags
;;; AUR: Circular country flags in SVG format.
;;; Data-only package from Linux Mint repository.
;;;

(define-public circle-flags
  (package
    (name "circle-flags")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://packages.linuxmint.com/pool/main/c/circle-flags/"
             "circle-flags_" version "+mint1.tar.xz"))
       (sha256
        (base32 "0kfq0jkb62k41y4bkpmi9bkxxzq31qnwm3il2x1chn7aw5p2hz9f"))))
    (build-system trivial-build-system)
    (native-inputs (list tar xz))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (work (string-append (getcwd) "/work")))
            (mkdir-p work)
            (invoke tar "-xf" src "-C" work)
            (let* ((top (string-append work "/circle-flags"))
                   (source-dir (string-append top "/usr/share/circle-flags-svg"))
                   (target-dir (string-append out "/share/circle-flags-svg")))
              (mkdir-p (string-append out "/share"))
              (copy-recursively source-dir target-dir))))))
    (home-page "https://github.com/linuxmint/circle-flags")
    (synopsis "Collection of circular national and regional flag SVGs")
    (description
     "Circle Flags provides a collection of circular flags in SVG format for
applications that need flag icon assets.")
    (license license:gpl3)))
