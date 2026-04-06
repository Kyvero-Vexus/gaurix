;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass 6.
;;; 13 recipes: 5 C/C++ source builds (quirc, jbig2enc, shine, xavs2, liboqs),
;;; 2 C source builds with ncurses/pcap (sngrep, zerotier-one),
;;; 3 Python packages (python-fleep, python-wassima, lieer),
;;; 1 meson C++ build (powder-toy),
;;; 1 config/data copy (arkenfox-user.js),
;;; 1 GTK theme install (qogir-gtk-theme).
;;; 17 re-blocked with specific reasons.
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd6)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module (guix utils)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xml)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; C/C++ source builds
            quirc
            jbig2enc
            shine
            xavs2
            liboqs
            sngrep
            zerotier-one
            ;; Python packages
            python-fleep
            python-wassima
            lieer
            ;; C++ meson build
            powder-toy
            ;; Config/data
            arkenfox-user.js
            ;; GTK theme
            qogir-gtk-theme))

;; ═══════════════════════════════════════════════════════════════════
;; 1. quirc (#15713) — QR code decoder library
;; ═══════════════════════════════════════════════════════════════════

(define-public quirc
  (package
    (name "quirc")
    (version "1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dlbeer/quirc")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list libjpeg-turbo libpng))
    (home-page "https://github.com/dlbeer/quirc")
    (synopsis "QR code decoding library written in C")
    (description "Quirc is a small C library for extracting and decoding QR
codes from images.  It is fast enough to be used with real-time video and
has no external dependencies beyond a basic C library.")
    (license license:isc)))

;; ═══════════════════════════════════════════════════════════════════
;; 2. jbig2enc (#16874) — JBIG2 image encoder
;; ═══════════════════════════════════════════════════════════════════

(define-public jbig2enc
  (package
    (name "jbig2enc")
    (version "0.30")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/agl/jbig2enc")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'autogen
                 (lambda _
                   (invoke "autoreconf" "-fiv"))))))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list leptonica zlib libpng libjpeg-turbo libtiff))
    (home-page "https://github.com/agl/jbig2enc")
    (synopsis "JBIG2 image encoder for PDF compression")
    (description "jbig2enc is an encoder for the JBIG2 bi-level image
compression format, which can losslessly or near-losslessly compress
scanned document images.  The compressed output is suitable for embedding
in PDF files, achieving much smaller file sizes than other formats.")
    (license license:asl2.0)))

;; ═══════════════════════════════════════════════════════════════════
;; 3. shine (#17697) — Fixed-point MP3 encoder
;; ═══════════════════════════════════════════════════════════════════

(define-public shine
  (package
    (name "shine")
    (version "3.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/savonet/shine")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'bootstrap
                 (lambda _
                   (invoke "./bootstrap"))))))
    (native-inputs (list autoconf automake libtool))
    (home-page "https://github.com/savonet/shine")
    (synopsis "super fast fixed-point MP3 encoder")
    (description "Shine is a fast, fixed-point MP3 encoding library.  It is
designed for platforms without a floating-point unit, such as embedded systems
and microcontrollers, while also performing well on desktop hardware.  It
encodes audio to MP3 using integer-only arithmetic.")
    (license license:lgpl2.0)))

;; ═══════════════════════════════════════════════════════════════════
;; 4. xavs2 (#18623) — AVS2 video encoder
;; ═══════════════════════════════════════════════════════════════════

(define-public xavs2
  (package
    (name "xavs2")
    (version "1.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pkuvcl/xavs2")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'chdir-build
                 (lambda _
                   (chdir "build/linux")))
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "./configure"
                           (string-append "--prefix=" (assoc-ref outputs "out"))
                           "--enable-shared"
                           "--disable-static"))))))
    (home-page "https://github.com/pkuvcl/xavs2")
    (synopsis "open-source encoder for AVS2-P2/IEEE1857.4 video coding")
    (description "xavs2 is an open-source encoder for the AVS2 (Audio Video
coding Standard 2) video coding standard, also known as IEEE 1857.4.  It
provides efficient encoding of video content using the AVS2 codec with
support for multiple profiles and performance tuning options.")
    (license license:gpl2+)))

;; ═══════════════════════════════════════════════════════════════════
;; 5. liboqs (#19234) — Post-quantum cryptography library
;; ═══════════════════════════════════════════════════════════════════

(define-public liboqs
  (package
    (name "liboqs")
    (version "0.15.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/open-quantum-safe/liboqs")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON"
                   "-DOQS_BUILD_ONLY_LIB=OFF"
                   "-DOQS_USE_OPENSSL=ON")
           #:tests? #f))
    (inputs (list openssl))
    (native-inputs (list pkg-config))
    (home-page "https://openquantumsafe.org/")
    (synopsis "C library for prototyping quantum-resistant cryptography")
    (description "liboqs is an open-source C library for quantum-resistant
cryptographic algorithms.  It provides implementations of post-quantum
key encapsulation mechanisms (KEMs) and digital signature schemes,
including those selected by the NIST Post-Quantum Cryptography
standardization process such as ML-KEM and ML-DSA.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 6. sngrep (#17973) — SIP message flow viewer
;; ═══════════════════════════════════════════════════════════════════

(define-public sngrep
  (package
    (name "sngrep")
    (version "2.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/irontec/sngrep")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list ncurses openssl libpcap))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/irontec/sngrep")
    (synopsis "terminal-based SIP message flow viewer")
    (description "sngrep displays SIP call message flows from terminal.  It
can capture SIP packets from a network interface or read them from PCAP
files, displaying the call flow diagrams in a curses-based interface.
Useful for debugging and analyzing VoIP SIP signaling.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; 7. zerotier-one (#53) — Peer-to-peer VPN
;; ═══════════════════════════════════════════════════════════════════

(define-public zerotier-one
  (package
    (name "zerotier-one")
    (version "1.14.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/zerotier/ZeroTierOne")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "DESTDIR=" #$output)
                   "PREFIX=")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list openssl))
    (native-inputs (list pkg-config))
    (home-page "https://www.zerotier.com/")
    (synopsis "peer-to-peer software-defined networking tool")
    (description "ZeroTier is a smart programmable Ethernet switch for planet
Earth.  It provides peer-to-peer encrypted virtual networking that works
across physical network boundaries.  ZeroTier creates virtual network
interfaces that behave like Ethernet ports on a virtual switch, enabling
secure communication between devices anywhere.")
    (license (list license:bsd-3
                   license:gpl3+))))

;; ═══════════════════════════════════════════════════════════════════
;; 8. python-fleep (#18630) — File format detection for Python
;; ═══════════════════════════════════════════════════════════════════

(define-public python-fleep
  (package
    (name "python-fleep")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/floyernick/fleep-py")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/floyernick/fleep-py")
    (synopsis "file format determination library for Python")
    (description "Fleep is a Python library that determines file type and
extension by examining the file's magic bytes (header signatures).  It
supports over 100 file types and works with both files and byte streams
without requiring external dependencies.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 9. python-wassima (#16311) — System root CA retrieval for Python
;; ═══════════════════════════════════════════════════════════════════

(define-public python-wassima
  (package
    (name "python-wassima")
    (version "2.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jawah/wassima")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/jawah/wassima")
    (synopsis "retrieve system root certificates with ease in Python")
    (description "Wassima is a Python library that retrieves system root CA
certificates, providing a drop-in alternative to the certifi package.  It
accesses the operating system's certificate store directly rather than
bundling its own set of root certificates.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 10. lieer (#15977) — Gmail/notmuch two-way sync
;; ═══════════════════════════════════════════════════════════════════

(define-public lieer
  (package
    (name "lieer")
    (version "1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gauteh/lieer")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-google-api-python-client
           python-google-auth-httplib2
           python-google-auth-oauthlib
           python-tqdm))
    (home-page "https://github.com/gauteh/lieer")
    (synopsis "fast Gmail and notmuch two-way tag synchronization")
    (description "Lieer (formerly gmailieer) provides fast fetch and two-way
tag synchronization between notmuch and Gmail using the Gmail API.  It maps
Gmail labels to notmuch tags and vice-versa, enabling efficient email
management with notmuch while keeping Gmail in sync.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; 11. powder-toy (#16416) — Physics sandbox game
;; ═══════════════════════════════════════════════════════════════════

(define-public powder-toy
  (package
    (name "powder-toy")
    (version "98.2.365")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/The-Powder-Toy/The-Powder-Toy")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-Dignore_updates=true")))
    (inputs (list sdl2 lua zlib curl libx11 fftw))
    (native-inputs (list pkg-config))
    (home-page "https://powdertoy.co.uk/")
    (synopsis "classic falling sand physics sandbox game")
    (description "The Powder Toy is a free physics sandbox game that simulates
air pressure, velocity, heat, gravity, and a large number of interactions
between different materials.  Players can create and share simulations
involving electronics, explosives, fluids, gases, and more.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; 12. arkenfox-user.js (#15761) — Firefox privacy config
;; ═══════════════════════════════════════════════════════════════════

(define-public arkenfox-user.js
  (package
    (name "arkenfox-user.js")
    (version "140.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/arkenfox/user.js")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("user.js" "share/arkenfox/user.js")
               ("updater.sh" "share/arkenfox/updater.sh")
               ("prefsCleaner.sh" "share/arkenfox/prefsCleaner.sh"))))
    (home-page "https://github.com/arkenfox/user.js")
    (synopsis "Firefox privacy and security configuration template")
    (description "The arkenfox user.js is a comprehensive Firefox configuration
template focused on privacy, security, and anti-tracking.  It sets hundreds
of about:config preferences to harden Firefox against fingerprinting, data
leaks, and tracking, while maintaining reasonable usability.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 13. qogir-gtk-theme (#18016) — Flat design GTK theme
;; ═══════════════════════════════════════════════════════════════════

(define-public qogir-gtk-theme
  (package
    (name "qogir-gtk-theme")
    (version "2025-02-19")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vinceliuice/Qogir-theme")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda _
                   (invoke "./install.sh"
                           "--dest" (string-append #$output "/share/themes")))))))
    (inputs (list gtk+))
    (home-page "https://github.com/vinceliuice/Qogir-theme")
    (synopsis "flat design theme for GTK desktops")
    (description "Qogir is a flat design theme for GTK-based Linux desktop
environments.  It provides a modern, clean look with support for GTK 2,
GTK 3, GTK 4, GNOME Shell, Cinnamon, XFCE, and other desktop environments.
Multiple color variants and window button styles are available.")
    (license license:gpl3+)))
