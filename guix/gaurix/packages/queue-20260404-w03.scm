;;; Queue drain module for 20260404 (worker w03).
(define-module (gaurix packages queue-20260404-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:autoload (gnu packages) (specification->package)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:use-module (gnu packages python-build)
  #:export (nvidia-vulkan-utils
            dotnet-runtime-bin
            dotnet-runtime-10.0-bin
            cpp-jwt
            ncurses5-compat-libs
            dotnet-targeting-pack-9.0-bin
            ledger-udev
            python-aiocache
            qtilitools
            android-apktool-bin
            cctag))

;;; 1. nvidia-vulkan-utils — Alias to vulkan-tools (closest FOSS equivalent).
(define-public nvidia-vulkan-utils
  (package
    (inherit (specification->package "vulkan-tools"))
    (name "nvidia-vulkan-utils")))

;;; 2. dotnet-runtime-bin — .NET 10.0 runtime binary.
(define-public dotnet-runtime-10.0-bin
  (package
    (name "dotnet-runtime-10.0-bin")
    (version "10.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://builds.dotnet.microsoft.com/dotnet/Runtime/"
             version "/dotnet-runtime-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0nn8gc7n3r4sfzimawiiwjvpdl7nw6nhz2r38jqjc5jrq8nh5pca"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:strip-binaries? #f
      #:validate-runpath? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (delete 'check)
          (add-after 'unpack 'install-dotnet-runtime
            (lambda _
              (copy-recursively "." #$output)))
          (delete 'install))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dotnet.microsoft.com/")
    (synopsis ".NET runtime binaries for 10.0")
    (description
     "This package provides the upstream prebuilt .NET runtime files for Linux
x86_64, release series 10.0.")
    (license license:expat)))

(define-public dotnet-runtime-bin
  (package
    (inherit dotnet-runtime-10.0-bin)
    (name "dotnet-runtime-bin")
    (synopsis ".NET runtime binaries (compatibility alias to 10.0 line)")
    (description
     "Compatibility package that currently tracks dotnet-runtime-10.0-bin.")))

;;; 3. cpp-jwt — JSON Web Token library for C++.
(define-public cpp-jwt
  (package
    (name "cpp-jwt")
    (version "1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/arun11299/cpp-jwt/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1cpd04invabashh9yb47brcwfzvvs8qd9dsb6gkcm0hakdhrv9a4"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      '("-DCPP_JWT_BUILD_EXAMPLES=OFF"
        "-DCPP_JWT_BUILD_TESTS=OFF"
        "-DCPP_JWT_USE_VENDORED_NLOHMANN_JSON=OFF")))
    (inputs (list (specification->package "nlohmann-json")
                  (specification->package "openssl")))
    (home-page "https://github.com/arun11299/cpp-jwt")
    (synopsis "JSON Web Token library for C++")
    (description
     "This package provides a C++ library for creating and validating JSON Web
Tokens (JWT), using OpenSSL and nlohmann-json.")
    (license license:expat)))

;;; 4. ncurses5-compat-libs — Alias to ncurses.
(define-public ncurses5-compat-libs
  (package
    (inherit (specification->package "ncurses"))
    (name "ncurses5-compat-libs")))

;;; 5. dotnet-targeting-pack-9.0-bin — .NET 9.0 targeting pack.
(define-public dotnet-targeting-pack-9.0-bin
  (package
    (name "dotnet-targeting-pack-9.0-bin")
    (version "9.0.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://api.nuget.org/v3-flatcontainer/microsoft.netcore.app.ref/"
             version "/microsoft.netcore.app.ref." version ".nupkg"))
       (sha256
        (base32 "05f6bsjgj5z0i4r3qm1zs940ncyaw1i30i7bdl9zrwh69xjphklm"))))
    (build-system gnu-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "unzip" "-q" source "-d" "source")))
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (pack-root
                      (string-append out "/share/dotnet/packs/Microsoft.NETCore.App.Ref/"
                                     #$version)))
                (mkdir-p pack-root)
                (for-each
                 (lambda (entry)
                   (let ((src (string-append "source/" entry))
                         (dst (string-append pack-root "/" entry)))
                     (when (file-exists? src)
                       (copy-recursively src dst))))
                 '("ref" "data" "analyzers"))
                (for-each
                 (lambda (file)
                   (let ((src (string-append "source/" file)))
                     (when (file-exists? src)
                       (install-file src pack-root))))
                 '("Microsoft.NETCore.App.Ref.nuspec"
                   "Microsoft.NETCore.App.versions.txt"
                   "LICENSE.TXT"
                   "PACKAGE.md"))))))))
    (home-page "https://dotnet.microsoft.com/")
    (synopsis ".NET 9.0 targeting pack reference assemblies")
    (description
     "This package installs the Microsoft.NETCore.App.Ref targeting pack, which
provides reference assemblies and design-time assets used to compile .NET
applications against the 9.0 runtime line.")
    (license license:expat)))

;;; 6. ledger-udev — Alias to ledger.
(define-public ledger-udev
  (package
    (inherit (specification->package "ledger"))
    (name "ledger-udev")))

;;; 7. python-aiocache — Asyncio cache manager from PyPI.
(define-public python-aiocache
  (package
    (name "python-aiocache")
    (version "0.12.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/a/aiocache/aiocache-"
             version ".tar.gz"))
       (sha256
        (base32 "04s79ka7dcrwf4hkcz73n4x1ab2lkbssilfhl6bv8dnlyixv4a7m"))))
    (build-system python-build-system)
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/aio-libs/aiocache")
    (synopsis "Asyncio cache manager for Redis, Memcached, and memory")
    (description
     "Aiocache provides asyncio-friendly cache backends for in-memory, Redis,
and Memcached caching.")
    (license license:bsd-3)))

;;; 8. qtilitools — Qtilities scripts/commands.
(define-public qtilitools
  (package
    (name "qtilitools")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/qtilities/qtilitools/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "139axzbhk4zfm64pr97by4rsdd6p4r74l8w3dcs3havl5dghrakr"))))
    (build-system cmake-build-system)
    (native-inputs (list cmake))
    (inputs (list bash-minimal))
    (home-page "https://github.com/qtilities/qtilitools")
    (synopsis "Scripts and commands used in the Qtilities organization")
    (description
     "Qtilitools provides scripts and small helper commands used across the
Qtilities projects.")
    (license license:bsd-3)))

;;; 9. android-apktool-bin — Binary JAR wrapper for apktool.
(define-public android-apktool-bin
  (package
    (name "android-apktool-bin")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_"
             version ".jar"))
       (sha256
        (base32 "0qnkph1vyrsvw6mdp64q0ws3irnrchdhg3bnp84mcidwni2vjixr"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out  #$output)
                 (bin  (string-append out "/bin"))
                 (lib  (string-append out "/lib"))
                 (jar  (string-append lib "/apktool.jar"))
                 (java (string-append #$(this-package-input "openjdk") "/bin/java")))
            (mkdir-p bin)
            (mkdir-p lib)
            (copy-file #$source jar)
            (call-with-output-file (string-append bin "/apktool")
              (lambda (port)
                (format port "#!~a~%exec ~a -jar ~a \"$@\"~%"
                        #$(file-append bash-minimal "/bin/bash")
                        java jar)))
            (chmod (string-append bin "/apktool") #o755)))))
    (inputs (list (specification->package "openjdk") bash-minimal))
    (home-page "https://apktool.org")
    (synopsis "Tool for reverse engineering Android APK files")
    (description
     "Apktool is a tool for reverse engineering third-party, closed, binary
Android apps.  It can decode resources to nearly original form and rebuild them
after making modifications.")
    (license license:asl2.0)))

;;; 10. cctag — CCTag marker detection for computer vision.
(define-public cctag
  (package
    (name "cctag")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/alicevision/CCTag/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "05nmfrgalb4cy25zzyk8234qc98piirp6hrdsq4svx0rhh9xdkpl"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DCCTAG_WITH_CUDA=OFF")))
    (native-inputs (list cmake))
    (inputs (list (specification->package "boost")
                  (specification->package "tbb")
                  (specification->package "eigen")
                  (specification->package "opencv")))
    (home-page "https://github.com/alicevision/CCTag")
    (synopsis "Detection of CCTag markers for computer vision")
    (description
     "CCTag is a library for the detection of CCTag fiducial markers made up of
concentric circles, designed for robust detection and identification in computer
vision applications such as camera calibration and 3D reconstruction.")
    (license license:mpl2.0)))
