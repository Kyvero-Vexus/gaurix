;;; Queue drain 2026-04-04 worker w04 (10 BLOCKED AUR packages).
;;; RESOLVED: 9, BLOCKED: 1 (android-sdk).
(define-module (gaurix packages queue-20260404-w04)
  #:use-module (guix packages)
  #:autoload (gnu packages) (specification->package)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages base)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (electron37-bin
            httpfs2-2gbplus
            electron30-bin
            ollama-bin
            dotnet-targeting-pack-bin
            lgogdownloader
            python-aiolimiter
            rar
            android-sdk
            chromium-widevine))

;;;
;;; Helper
;;;

(define (gaurix-alias-package alias-name target-spec)
  "Create a Gaurix compatibility alias from a Guix upstream package."
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

;;;
;;; 1. electron37-bin — Electron 37 prebuilt binary
;;;

(define-public electron37-bin
  (package
    (name "electron37-bin")
    (version "37.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/electron/electron/releases/download/v"
             version "/electron-v" version "-linux-x64.zip"))
       (sha256
        (base32 "0q26c4svll88ph3qb9ycbwpcsgidkbk9kcksryjcsn4qppbfvd60"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     (list unzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (lib-dir (string-append out "/lib/electron37"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p lib-dir)
            (invoke unzip "-q" src "-d" lib-dir)
            (mkdir-p bin-dir)
            (symlink (string-append lib-dir "/electron")
                     (string-append bin-dir "/electron37"))
            #t))))
    (home-page "https://electronjs.org")
    (synopsis "Electron 37 runtime (prebuilt binary)")
    (description
     "Prebuilt binary distribution of Electron 37, the framework for building
cross-platform desktop applications with web technologies.")
    (license license:expat)))

;;;
;;; 2. httpfs2-2gbplus — alias to Guix httpfs2
;;;

(define-public httpfs2-2gbplus
  ;; AUR httpfs2-2gbplus: FUSE HTTP filesystem with >2GB support.
  ;; Guix already provides httpfs2 0.1.5 which supports large files.
  (gaurix-alias-package "httpfs2-2gbplus" "httpfs2"))

;;;
;;; 3. electron30-bin — Electron 30 prebuilt binary
;;;

(define-public electron30-bin
  (package
    (name "electron30-bin")
    (version "30.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/electron/electron/releases/download/v"
             version "/electron-v" version "-linux-x64.zip"))
       (sha256
        (base32 "00ql6vr47swlshg56a3zkifxsl4ywl5f7698yh2n1s1r7mw0fizc"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     (list unzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (lib-dir (string-append out "/lib/electron30"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p lib-dir)
            (invoke unzip "-q" src "-d" lib-dir)
            (mkdir-p bin-dir)
            (symlink (string-append lib-dir "/electron")
                     (string-append bin-dir "/electron30"))
            #t))))
    (home-page "https://electronjs.org")
    (synopsis "Electron 30 runtime (prebuilt binary)")
    (description
     "Prebuilt binary distribution of Electron 30, the framework for building
cross-platform desktop applications with web technologies.")
    (license license:expat)))

;;;
;;; 4. ollama-bin — Ollama LLM runner (prebuilt binary), updated to v0.20.0
;;;

(define-public ollama-bin
  (package
    (name "ollama-bin")
    (version "0.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ollama/ollama/releases/download/v"
             version "/ollama-linux-amd64.tar.zst"))
       (sha256
        (base32 "0inmhgfx0nxvl4j3lsljnxvff27ppbxjh96zh7a1y3xxgs4mx1k0"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     (list tar zstd))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (zstd (search-input-file %build-inputs "/bin/zstd")))
            (invoke tar (string-append "--use-compress-program=" zstd)
                    "-xf" src)
            (let* ((bin-src (cond
                             ((file-exists? "ollama") "ollama")
                             ((file-exists? "bin/ollama") "bin/ollama")
                             (else
                              (error "Could not find ollama binary"))))
                   (lib-src (cond
                             ((file-exists? "lib/ollama") "lib/ollama")
                             ((file-exists? "ollama/lib/ollama")
                              "ollama/lib/ollama")
                             (else #f))))
              (mkdir-p (string-append out "/bin"))
              (copy-file bin-src (string-append out "/bin/ollama"))
              (chmod (string-append out "/bin/ollama") #o755)
              (when lib-src
                (mkdir-p (string-append out "/lib"))
                (copy-recursively lib-src
                                  (string-append out "/lib/ollama")))))
          #t)))
    (home-page "https://github.com/ollama/ollama")
    (synopsis "Run and serve local LLMs (prebuilt binary)")
    (description
     "Ollama runs and serves large language models locally.  This package
repackages the upstream prebuilt Linux x86_64 binary release.")
    (license license:expat)))

;;;
;;; 5. dotnet-targeting-pack-bin — .NET 10.0 targeting pack (from SDK)
;;;

(define-public dotnet-targeting-pack-bin
  (package
    (name "dotnet-targeting-pack-bin")
    (version "10.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://builds.dotnet.microsoft.com/dotnet/Sdk/10.0.105/"
             "dotnet-sdk-10.0.105-linux-x64.tar.gz"))
       (sha256
        (base32 "0silzzafs9mvp8p5lb0q2a0vkh7aw9yfwhcb0jpncfgy226345jl"))))
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
                 (tmpdir (string-append (getcwd) "/sdk-unpack")))
            (mkdir-p tmpdir)
            (invoke tar "-xzf" src "-C" tmpdir)
            ;; Extract targeting/ref packs from the SDK tarball
            (let ((packs-dir (string-append tmpdir "/packs"))
                  (dest (string-append out "/lib/dotnet")))
              (mkdir-p dest)
              (when (file-exists? packs-dir)
                (copy-recursively packs-dir
                                  (string-append dest "/packs")))
              ;; Also copy shared framework
              (let ((shared-dir (string-append tmpdir "/shared")))
                (when (file-exists? shared-dir)
                  (copy-recursively shared-dir
                                    (string-append dest "/shared"))))))
          #t)))
    (home-page "https://dotnet.microsoft.com/")
    (synopsis ".NET 10.0 targeting pack (prebuilt binary)")
    (description
     "Binary distribution of the .NET 10.0 targeting and reference assembly
packs, extracted from the official Microsoft .NET SDK.  These are needed
to compile .NET applications targeting the 10.0 runtime.")
    (license license:expat)))

;;;
;;; 6. lgogdownloader — GOG.com game downloader
;;;

(define-public lgogdownloader
  (package
    (name "lgogdownloader")
    (version "3.18")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Sude-/lgogdownloader/releases/download/v"
             version "/lgogdownloader-" version ".tar.gz"))
       (sha256
        (base32 "1q4a5yi989f2k8ig8m66wn9dvba8hm43awwk6vazxkg0n2fg0x0r"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))     ;; no test suite provided upstream
    (inputs
     (list boost
           curl
           htmlcxx
           jsoncpp
           rhash
           tidy-html
           tinyxml2))
    (native-inputs
     (list pkg-config))
    (home-page "https://github.com/Sude-/lgogdownloader")
    (synopsis "Download games from GOG.com")
    (description
     "LGOGDownloader is an unofficial open-source downloader for GOG.com.
It allows downloading game installers, extras, patches, and language packs
from the command line.")
    (license license:wtfpl2)))

;;;
;;; 7. python-aiolimiter — async rate limiter for Python
;;;

(define-public python-aiolimiter
  (package
    (name "python-aiolimiter")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/a/aiolimiter/"
             "aiolimiter-" version ".tar.gz"))
       (sha256
        (base32 "1afcnm8p8r0lv2hs24jma08m1lfl1910b8aj4a1rwpc53bm3fap0"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-poetry-core))
    (home-page "https://github.com/mjpieters/aiolimiter")
    (synopsis "Efficient rate limiter for asyncio")
    (description
     "Aiolimiter provides an efficient asynchronous rate limiter for Python
asyncio applications.")
    (license license:expat)))

;;;
;;; 8. rar — RAR compression utility (proprietary binary)
;;;

(define-public rar
  (package
    (name "rar")
    (version "7.20")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.rarlab.com/rar/rarlinux-x64-"
             (string-join (string-split version #\.) "")
             ".tar.gz"))
       (sha256
        (base32 "0ina95p89gn2i96rvzx5nndpg9n1x2hk5qsy4p8b31934yizpryk"))))
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
                 (bin-dir (string-append out "/bin"))
                 (lib-dir (string-append out "/lib"))
                 (etc-dir (string-append out "/etc")))
            (invoke tar "-xzf" src)
            (mkdir-p bin-dir)
            (mkdir-p lib-dir)
            (mkdir-p etc-dir)
            (for-each
             (lambda (f)
               (when (file-exists? (string-append "rar/" f))
                 (copy-file (string-append "rar/" f)
                            (string-append bin-dir "/" f))
                 (chmod (string-append bin-dir "/" f) #o755)))
             '("rar" "unrar"))
            (when (file-exists? "rar/default.sfx")
              (copy-file "rar/default.sfx"
                         (string-append lib-dir "/default.sfx")))
            (when (file-exists? "rar/rarfiles.lst")
              (copy-file "rar/rarfiles.lst"
                         (string-append etc-dir "/rarfiles.lst"))))
          #t)))
    (home-page "https://www.rarlab.com/")
    (synopsis "RAR archiver (proprietary binary)")
    (description
     "RAR is a proprietary archive file format and compression utility by
Alexander Roshal.  This package provides the prebuilt Linux x86_64 binaries
for creating and extracting RAR archives.")
    (license #f)))

;;;
;;; 9. android-sdk — BLOCKED
;;;

(define-public android-sdk
  ;; AUR android-sdk: Google Android SDK command-line tools + platform tools.
  ;; BLOCKED: The Android SDK is an extremely complex meta-package requiring:
  ;;   - Multiple proprietary Google binaries (platform-tools, build-tools, emulator)
  ;;   - Java/Kotlin toolchains with specific version requirements
  ;;   - Custom license acceptance workflow (Android SDK License Agreement)
  ;;   - Dynamic component management (sdkmanager downloads components at runtime)
  ;;   - Heavy FHS assumptions (hardcoded paths, ld-linux loader, etc.)
  ;; Guix provides android-* packages for individual components (liblog, libutils, etc.)
  ;; but not the full SDK.  A proper Guix recipe would require a sustained multi-week
  ;; engineering effort similar to the ROS 2 or ROCm packaging projects.
  ;; Recommend: Users install via `sdkmanager` in an FHS container (guix shell --container).
  (package
    (name "android-sdk")
    (version "26.1.1")
    (source #f)
    (build-system trivial-build-system)
    (arguments (list #:builder #~(error "android-sdk: BLOCKED — see package description")))
    (home-page "https://developer.android.com/studio")
    (synopsis "BLOCKED — Google Android SDK (too complex for automated packaging)")
    (description
     "BLOCKED: The Android SDK requires a sustained multi-week packaging effort
due to its proprietary license, dynamic component management via sdkmanager,
FHS assumptions, and complex dependency tree.  Recommend using an FHS
container: @code{guix shell --container --emulate-fhs} with the upstream
@code{sdkmanager} installer.")
    (license #f)))

;;;
;;; 10. chromium-widevine — Widevine DRM plugin for Chromium
;;;

(define-public chromium-widevine
  (package
    (name "chromium-widevine")
    (version "4.10.2934.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.google.com/dl/release2/chrome_component/"
             "accssjtqfpf5qicscrptql4jyyxa_" version
             "/oimompecagnajdejgnnjijobebaeigek_" version
             "_linux_ph722a3wl2goebkpserszm6bde.crx3"))
       (file-name (string-append "chromium-widevine-" version ".crx3"))
       (sha256
        (base32 "1cjfsy3vf8nhm4kk16hgdzpf84iyhxx13c0y31pzglhk9xl12qfk"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     (list unzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (lib-dir (string-append out "/lib/chromium/WidevineCdm"))
                 (tmpdir (string-append (getcwd) "/widevine-unpack")))
            ;; CRX3 files are ZIP archives with a header; unzip handles them.
            (mkdir-p tmpdir)
            (invoke unzip "-q" "-o" src "-d" tmpdir)
            (mkdir-p lib-dir)
            (copy-recursively tmpdir lib-dir))
          #t)))
    (home-page "https://www.widevine.com/")
    (synopsis "Widevine DRM content decryption module for Chromium")
    (description
     "Chromium Widevine provides the Widevine Content Decryption Module (CDM),
a proprietary DRM plugin required to play DRM-protected media content
(such as Netflix, Disney+, and other streaming services) in Chromium-based
browsers.")
    (license #f)))
