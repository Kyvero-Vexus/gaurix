(define-module (gaurix packages recipe-design-20260402-chunk3)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages hardware)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages radio)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (ice-9 match)
  #:export (clightd
            libmodule
            mas
            wrkflw-bin
            pwmenu-bin
            qpdf-zopfli
            libavif-noglycin
            libheif-noglycin
            libjxl-noglycin
            libjxl-noglycin-doc))

(define-public libmodule
  (package
    (name "libmodule")
    (version "5.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/FedeDP/libmodule/archive/"
                           version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zpp46jly4sqb7gbffxajv72i6rh60cacc7sfrsr65mym9liw43j"))))
    (build-system cmake-build-system)
    (native-inputs (list pkg-config))
    (arguments
     (list
      #:configure-flags #~(list "-DBUILD_TESTS=OFF"
                                "-DBUILD_SAMPLES=OFF"
                                "-DBUILD_DOCS=OFF")
      #:tests? #f))
    (home-page "https://github.com/FedeDP/libmodule")
    (synopsis "Small C library for modular actor-like project structure")
    (description
     "Libmodule is a small C library to structure projects into modules with
message-passing-like abstractions and utility containers.")
    (license license:expat)))

(define-public clightd
  (package
    (name "clightd")
    (version "5.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/FedeDP/Clightd/archive/"
                           version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0m1h1xjvarj6n6b06v9qf45w3dmj662ls79vqac1qwpbbrdqdbkn"))))
    (build-system cmake-build-system)
    (native-inputs (list pkg-config))
    (inputs
     (list dbus
           ddcutil
           elogind
           eudev
           libdrm
           libiio
           libjpeg-turbo
           libmodule
           libusb
           libx11
           libxext
           libxrandr
           polkit
           wayland))
    (arguments
     (list
      #:modules '((guix build cmake-build-system)
                  (guix build utils))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-install-destinations
            (lambda _
              (substitute* "CMakeLists.txt"
                (("pkg_get_variable\\(SYSTEM_BUS_DIR dbus-1 system_bus_services_dir\\)")
                 "set(SYSTEM_BUS_DIR \"${CMAKE_INSTALL_FULL_DATAROOTDIR}/dbus-1/system-services\")")
                (("pkg_get_variable\\(POLKIT_ACTION_DIR polkit-gobject-1 actiondir\\)")
                 "set(POLKIT_ACTION_DIR \"${CMAKE_INSTALL_FULL_DATAROOTDIR}/polkit-1/actions\")")))))
      #:configure-flags
      #~(list "-DCMAKE_INSTALL_LIBEXECDIR=lib/clightd"
              "-DENABLE_DDC=ON"
              "-DENABLE_GAMMA=ON"
              "-DENABLE_DPMS=ON"
              "-DENABLE_SCREEN=ON"
              "-DENABLE_YOCTOLIGHT=ON"
              "-DENABLE_PIPEWIRE=OFF"
              "-DDBUS_CONFIG_DIR=etc/dbus-1/system.d"
              "-DMODULE_LOAD_DIR=lib/modules-load.d")
      #:tests? #f))
    (home-page "https://github.com/FedeDP/Clightd")
    (synopsis "D-Bus daemon to manage screen brightness and ambient light")
    (description
     "Clightd is a D-Bus daemon used by clight-like frontends to manage screen
brightness, gamma, DPMS, and ambient-light-based adjustments using sensors and
monitor backlight interfaces.")
    (license license:gpl3+)))

(define-public mas
  (package
    (inherit asl)
    (name "mas")
    (synopsis "Compatibility package name for AS macro cross-assembler")
    (description
     "Compatibility package that provides the upstream Guix @code{asl} macro
cross-assembler under the AUR-style package name @code{mas}.")))

(define-public wrkflw-bin
  (package
    (name "wrkflw-bin")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bahdotsh/wrkflw/releases/download/v"
             version "/wrkflw-v" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "1bkqs48ph0b0m96p6v6kgrkh3kbhaqfcc5vvs4lsw5bfk3fizyxy"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (mkdir-p bin)
            (install-file "wrkflw" bin)
            (chmod (string-append bin "/wrkflw") #o555)
            #t))))
    (home-page "https://github.com/bahdotsh/wrkflw")
    (synopsis "Validate and execute GitHub Actions workflows locally")
    (description
     "wrkflw validates and executes GitHub Actions workflows locally.  This
package repackages the upstream prebuilt Linux x86_64 binary release.")
    (license license:expat)))

(define (pwmenu-bin-uri version)
  (match (or (%current-target-system) (%current-system))
    ("x86_64-linux"
     (string-append "https://github.com/e-tho/pwmenu/releases/download/v"
                    version "/pwmenu-x86_64-linux-gnu"))
    ("aarch64-linux"
     (string-append "https://github.com/e-tho/pwmenu/releases/download/v"
                    version "/pwmenu-aarch64-linux-gnu"))
    (_ (error "Unsupported system for pwmenu-bin"))))

(define (pwmenu-bin-hash)
  (match (or (%current-target-system) (%current-system))
    ("x86_64-linux" (base32 "0gj12lpwx6zw3p6gcda1gq7cr5frsvzzq1plra2sm511m0lg3rbj"))
    ("aarch64-linux" (base32 "1gmwyyyjsb4cz6rzpk4hv437yw9xb7ng1z9i456whqjzalsa6jz7"))
    (_ (error "Unsupported system for pwmenu-bin"))))

(define-public pwmenu-bin
  (package
    (name "pwmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pwmenu-bin-uri version))
       (file-name (string-append "pwmenu-" version))
       (sha256 (pwmenu-bin-hash))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux" "aarch64-linux"))
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
            (copy-file src (string-append bin "/pwmenu"))
            (chmod (string-append bin "/pwmenu") #o555)
            #t))))
    (home-page "https://github.com/e-tho/pwmenu")
    (synopsis "Launcher-driven audio manager for Linux")
    (description
     "pwmenu is a launcher-driven Linux audio manager.  This package repackages
upstream prebuilt binaries for x86_64 and AArch64 Linux systems.")
    (license license:gpl3+)))

(define-public qpdf-zopfli
  (package
    (name "qpdf-zopfli")
    (version "12.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/qpdf/qpdf/releases/download/v"
                           version "/qpdf-" version ".tar.gz"))
       (sha256
        (base32 "1nnyl9w82bmvrzlz7fyi41wj2yrh3bjy16gbz82xk1yq5jgjzfkc"))))
    (build-system cmake-build-system)
    (native-inputs (list perl pkg-config))
    (inputs (list gnutls zopfli))
    (propagated-inputs
     ;; In Requires.private of libqpdf.pc.
     (list libjpeg-turbo zlib))
    (arguments
     (list
      #:configure-flags
      #~(list "-DBUILD_STATIC_LIBS=OFF"
              "-DZOPFLI=ON"
              "-DREQUIRE_CRYPTO_GNUTLS=ON"
              "-DREQUIRE_CRYPTO_OPENSSL=OFF"
              "-DBUILD_DOC=OFF")
      #:tests? #f))
    (synopsis "Command-line tools and library for transforming PDF files")
    (description
     "QPDF is a command-line program and C++ library for structural,
content-preserving transformations on PDF files.  This variant enables Zopfli
compression support.")
    (license (list license:asl2.0 license:clarified-artistic))
    (home-page "https://qpdf.sourceforge.io/")))

(define-public libavif-noglycin
  (package
    (inherit libavif)
    (name "libavif-noglycin")
    (synopsis "Compatibility package name for libavif")
    (description
     "Compatibility package that provides @code{libavif} under the AUR-style
package name @code{libavif-noglycin}.")))

(define-public libheif-noglycin
  (package
    (inherit libheif)
    (name "libheif-noglycin")
    (synopsis "Compatibility package name for libheif")
    (description
     "Compatibility package that provides @code{libheif} under the AUR-style
package name @code{libheif-noglycin}.")))

(define-public libjxl-noglycin
  (package
    (inherit libjxl)
    (name "libjxl-noglycin")
    (synopsis "Compatibility package name for libjxl")
    (description
     "Compatibility package that provides @code{libjxl} under the AUR-style
package name @code{libjxl-noglycin}.")))

(define-public libjxl-noglycin-doc
  (package
    (inherit libjxl-noglycin)
    (name "libjxl-noglycin-doc")
    (synopsis "Compatibility package name for libjxl documentation variant")
    (description
     "Compatibility package that provides @code{libjxl} under the AUR-style
package name @code{libjxl-noglycin-doc}.  Guix does not split libjxl
documentation into a standalone docs package.")))
