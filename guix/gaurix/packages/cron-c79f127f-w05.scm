(define-module (gaurix packages cron-c79f127f-w05)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages finance)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages video)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages compression)
  #:export (dotnet-targeting-pack-7.0-bin
            dotnet-targeting-pack-9.0-bin
            ledger-udev
            awww
            lianwalld-bin
            python-aiocache
            python-plyer
            qtilitools
            xone-dongle-firmware))

(define (dotnet-targeting-pack major version hash)
  (package
    (name (string-append "dotnet-targeting-pack-" major "-bin"))
    (version version)
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://api.nuget.org/v3-flatcontainer/microsoft.netcore.app.ref/"
                           version "/microsoft.netcore.app.ref." version ".nupkg"))
       (sha256 (base32 hash))))
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
    (synopsis (string-append ".NET " major " targeting pack reference assemblies"))
    (description
     "This package installs the Microsoft.NETCore.App.Ref targeting pack, which
provides reference assemblies and design-time assets used to compile .NET
applications against a specific runtime line.")
    (license license:expat)))

(define-public dotnet-targeting-pack-7.0-bin
  (dotnet-targeting-pack "7.0" "7.0.20"
                         "1fv6p9idx6g58y0khw7jl23lkwj01l8246mv045i9q6sp3fm9m2v"))

(define-public dotnet-targeting-pack-9.0-bin
  (dotnet-targeting-pack "9.0" "9.0.14"
                         "05f6bsjgj5z0i4r3qm1zs940ncyaw1i30i7bdl9zrwh69xjphklm"))

(define-public ledger-udev
  (package
    (inherit ledger)
    (name "ledger-udev")))

(define-public awww
  ;; Compatibility alias for AUR naming (awww/swww).
  (package
    (inherit swww)
    (name "awww")))

(define-public lianwalld-bin
  (package
    (name "lianwalld-bin")
    (version "5.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Yueosa/lianwall/releases/download/v"
                           version "/lianwalld_" version "_linux_x86_64"))
       (sha256
        (base32 "110lgkmkiaj8hvncl8dnm8rhxv5sw637kxiwvvzl5wnjcpjkjdk0"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lianwalld_5.4.0_linux_x86_64" "bin/lianwalld"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/lianwalld") #o755))))))
    (propagated-inputs (list awww mpvpaper))
    (home-page "https://github.com/Yueosa/lianwall")
    (synopsis "Wallpaper daemon based on swww and mpvpaper")
    (description
     "Lianwalld is a wallpaper daemon that coordinates animated and video
wallpapers via swww/awww and mpvpaper.")
    (license license:expat)))

(define-public python-aiocache
  (package
    (name "python-aiocache")
    (version "0.12.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "aiocache" version))
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

(define-public python-plyer
  (package
    (name "python-plyer")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "plyer" version))
       (sha256
        (base32 "0qdaddrn9ki8faq01mfsf3ppchjjd6mb4zj8m0vsy1qyw6vxzdv5"))))
    (build-system python-build-system)
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/kivy/plyer")
    (synopsis "Platform-independent wrapper for platform-dependent APIs")
    (description
     "Plyer is a platform-independent Python wrapper around platform-dependent
APIs for notifications, sensors, storage, and related desktop/mobile features.")
    (license license:expat)))

(define-public qtilitools
  (package
    (name "qtilitools")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/qtilities/qtilitools/archive/refs/tags/"
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

(define xone-dongle-02fe-source
  (origin
    (method url-fetch)
    (uri "https://catalog.s.download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/07/1cd6a87c-623f-4407-a52d-c31be49e925c_e19f60808bdcbfbd3c3df6be3e71ffc52e43261e.cab")
    (sha256 (base32 "013g1zngxffavqrk5jy934q3bdhsv6z05ilfixdn8dj0zy26lwv5"))))

(define xone-dongle-02f9-source
  (origin
    (method url-fetch)
    (uri "https://catalog.s.download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/06/1dbd7cb4-53bc-4857-a5b0-5955c8acaf71_9081931e7d664429a93ffda0db41b7545b7ac257.cab")
    (sha256 (base32 "1q1fmng898aqp0nzdq4vcm5qzwfhwz00k0gx0xs3h3a6czxr3pch"))))

(define xone-dongle-091e-source
  (origin
    (method url-fetch)
    (uri "https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2017/08/aeff215c-3bc4-4d36-a3ea-e14bfa8fa9d2_e58550c4f74a27e51e5cb6868b10ff633fa77164.cab")
    (sha256 (base32 "1wnqrh130hxyi0ddjq9d0ac30rwplh674d47g9lwqn0yabcvm3ss"))))

(define-public xone-dongle-firmware
  (package
    (name "xone-dongle-firmware")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2017/03/2ea9591b-f751-442c-80ce-8f4692cdc67b_6b555a3a288153cf04aec6e03cba360afe2fce34.cab")
       (sha256 (base32 "0cpgb0i4dnfm0h3kc7xc0lhc4d2cypkpz22wdpqw9dqhvkl756nq"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("libarchive" ,libarchive)
       ("xone-dongle-02fe.cab" ,xone-dongle-02fe-source)
       ("xone-dongle-02f9.cab" ,xone-dongle-02f9-source)
       ("xone-dongle-091e.cab" ,xone-dongle-091e-source)))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source inputs #:allow-other-keys)
              (let ((bsdtar (string-append (assoc-ref inputs "libarchive")
                                           "/bin/bsdtar")))
                (mkdir "xone_dongle_02e6")
                (mkdir "xone_dongle_02fe")
                (mkdir "xone_dongle_02f9")
                (mkdir "xone_dongle_091e")
                (invoke bsdtar "-C" "xone_dongle_02e6" "-xf" source)
                (invoke bsdtar "-C" "xone_dongle_02fe" "-xf"
                        (assoc-ref inputs "xone-dongle-02fe.cab"))
                (invoke bsdtar "-C" "xone_dongle_02f9" "-xf"
                        (assoc-ref inputs "xone-dongle-02f9.cab"))
                (invoke bsdtar "-C" "xone_dongle_091e" "-xf"
                        (assoc-ref inputs "xone-dongle-091e.cab")))))
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/lib/firmware"))
                (copy-file "xone_dongle_02e6/FW_ACC_00U.bin"
                           (string-append out "/lib/firmware/xone_dongle_02e6.bin"))
                (copy-file "xone_dongle_02fe/FW_ACC_00U.bin"
                           (string-append out "/lib/firmware/xone_dongle_02fe.bin"))
                (copy-file "xone_dongle_02f9/FW_ACC_CL.bin"
                           (string-append out "/lib/firmware/xone_dongle_02f9.bin"))
                (copy-file "xone_dongle_091e/FW_ACC_BR.bin"
                           (string-append out "/lib/firmware/xone_dongle_091e.bin"))))))))
    (home-page "https://support.xbox.com/en-US/help/hardware-network/browse")
    (synopsis "Xbox Wireless Controller Adapter firmware blobs")
    (description
     "This package installs firmware blobs for supported Xbox Wireless
Controller USB adapters used by xone.")
    (license (license:non-copyleft "https://www.microsoft.com/en-us/legal/terms-of-use"))))
