;;; Round-22 resolution for blocked-tree run cron-c79f127f worker w03.
;;; 27 new recipes: 13 Python packages + 14 C/C++ libraries
;;; 56 BLOCKED (see blocked-notes file for details)
(define-module (gaurix packages cron-c79f127f-r22-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages pcap)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages assembly)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (python-art
            python-m3u8
            python-plyer
            python-pid
            python-munge
            python-opencensus
            python-condense-json
            python-wassima
            python-syncedlyrics
            sqlite-utils
            python-inquirerpy
            python-urllib3-future
            python-uv-dynamic-versioning
            davs2
            xavs2
            vvenc
            quirc
            apriltag
            libuvc
            dynamips
            moodbar
            libaribcaption
            libklvanc
            xevd
            xeve
            openapv
            uavs3d))

;; 1. python-art
(define-public python-art
  (package
    (name "python-art")
    (version "6.5")
    (source (origin (method url-fetch) (uri (pypi-uri "art" version))
       (sha256 (base32 "0i0qglvk27p3siwa0b9k4lj6nzwrzp6vvdgldkn9g1i75js7g3d9"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/sepandhaghighi/art")
    (synopsis "ASCII art library for Python")
    (description "Art is a Python library for text-based art, including ASCII art fonts
and decorations.  It supports over 500 ASCII art fonts and 250+ 1-line art forms.")
    (license license:expat)))

;; 2. python-m3u8
(define-public python-m3u8
  (package
    (name "python-m3u8")
    (version "6.0.0")
    (source (origin (method url-fetch) (uri (pypi-uri "m3u8" version))
       (sha256 (base32 "1zf0m6gnvzjpzym4dzw2i5hwvd9ydjqi755gpi9sdmv72q59kpks"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/globocom/m3u8")
    (synopsis "Parser for M3U8 playlists used in HLS streaming")
    (description "python-m3u8 is a Python parser for M3U8 playlists, the manifest format
used by HTTP Live Streaming (HLS).")
    (license license:expat)))

;; 3. python-plyer
(define-public python-plyer
  (package
    (name "python-plyer")
    (version "2.1.0")
    (source (origin (method url-fetch) (uri (pypi-uri "plyer" version))
       (sha256 (base32 "0qdaddrn9ki8faq01mfsf3ppchjjd6mb4zj8m0vsy1qyw6vxzdv5"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/kivy/plyer")
    (synopsis "Platform-independent Python wrapper for hardware features")
    (description "Plyer provides a platform-independent Python API for accessing hardware
features such as notifications, GPS, accelerometer, and camera.")
    (license license:expat)))

;; 4. python-pid
(define-public python-pid
  (package
    (name "python-pid")
    (version "3.0.4")
    (source (origin (method url-fetch) (uri (pypi-uri "pid" version))
       (sha256 (base32 "0rpbagc6dql98q5gaprp9a6ifirjkih3mr1212xkx8znhc76fcqf"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/trbs/pid")
    (synopsis "PID file management for Python daemons")
    (description "python-pid provides pidfile context managers and decorators for managing
PID files in Python daemon processes.")
    (license license:asl2.0)))

;; 5. python-munge
(define-public python-munge
  (package
    (name "python-munge")
    (version "1.4.0")
    (source (origin (method url-fetch) (uri (pypi-uri "munge" version))
       (sha256 (base32 "0sim3xf62imvsqmmd0gmqw2va4czffwybzhvrqzrkk2gc9p1b31g"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/20c/munge")
    (synopsis "Multi-format configuration file parser for Python")
    (description "Munge is a configuration file parser supporting YAML, JSON, and TOML.")
    (license license:asl2.0)))

;; 6. python-opencensus
(define-public python-opencensus
  (package
    (name "python-opencensus")
    (version "0.11.4")
    (source (origin (method url-fetch) (uri (pypi-uri "opencensus" version))
       (sha256 (base32 "1wpg8kjqr594qap42b05dn5a7flbsp7a3hp5c2mn8c3pp3c8gvyb"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-requests))
    (home-page "https://github.com/census-instrumentation/opencensus-python")
    (synopsis "OpenCensus distributed tracing and stats for Python")
    (description "OpenCensus provides libraries for distributed tracing and application
metrics collection in Python.")
    (license license:asl2.0)))

;; 7. python-condense-json
(define-public python-condense-json
  (package
    (name "python-condense-json")
    (version "0.1.3")
    (source (origin (method url-fetch) (uri (pypi-uri "condense_json" version))
       (sha256 (base32 "1g6j77846j4yy9jpbhf2vgbf4spr30z1mwlqing89zfs9x1qvzi5"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/nemec/condense-json")
    (synopsis "Compact human-readable JSON formatter")
    (description "condense-json reformats JSON into a compact but human-readable form.")
    (license license:expat)))

;; 8. python-wassima
(define-public python-wassima
  (package
    (name "python-wassima")
    (version "2.0.5")
    (source (origin (method url-fetch) (uri (pypi-uri "wassima" version))
       (sha256 (base32 "19qhgp0z9hdbwip63n9dbkvjkrmbk9ya68szm3vlx6wxg58dm84i"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/jawah/wassima")
    (synopsis "Access system TLS certificate stores from Python")
    (description "Wassima provides Python bindings to access the OS native TLS cert store.")
    (license license:expat)))

;; 9. python-syncedlyrics
(define-public python-syncedlyrics
  (package
    (name "python-syncedlyrics")
    (version "1.0.1")
    (source (origin (method url-fetch) (uri (pypi-uri "syncedlyrics" version))
       (sha256 (base32 "1c361xwxzcxq1vz2wilva8hr2x5s8kgidsxldgcxavasxmlj9crx"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-requests python-beautifulsoup4))
    (home-page "https://github.com/rtcq/syncedlyrics")
    (synopsis "Fetch synced lyrics from various providers")
    (description "syncedlyrics fetches time-synced lyrics (LRC format) from multiple providers.")
    (license license:expat)))

;; 10. sqlite-utils
(define-public sqlite-utils
  (package
    (name "sqlite-utils")
    (version "3.39")
    (source (origin (method url-fetch) (uri (pypi-uri "sqlite_utils" version))
       (sha256 (base32 "1kfvz4ga254sjwfv7fx9skpz9g7y4xspk0vjck4vagiykg1fm8mz"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-click python-tabulate))
    (home-page "https://github.com/simonw/sqlite-utils")
    (synopsis "CLI tool and Python library for manipulating SQLite databases")
    (description "sqlite-utils provides a Python library and CLI for SQLite databases.")
    (license license:asl2.0)))

;; 11. python-inquirerpy
(define-public python-inquirerpy
  (package
    (name "python-inquirerpy")
    (version "0.3.4")
    (source (origin (method url-fetch) (uri (pypi-uri "InquirerPy" version))
       (sha256 (base32 "0zhrzj4xwyhd1c8xfjcac4gfrch8643k3bj1rf1p8cqz26havll9"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-prompt-toolkit))
    (home-page "https://github.com/kazhala/InquirerPy")
    (synopsis "Interactive command-line prompts for Python")
    (description "InquirerPy is a Python port of Inquirer.js for interactive CLI prompts.")
    (license license:expat)))

;; 12. python-urllib3-future
(define-public python-urllib3-future
  (package
    (name "python-urllib3-future")
    (version "2.19.902")
    (source (origin (method url-fetch) (uri (pypi-uri "urllib3_future" version))
       (sha256 (base32 "1znchxbfi01ml48j8x4kid52qfcxgshmsr4mmrkdknd3pb8bj5kg"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/jawah/urllib3.future")
    (synopsis "Modernized urllib3 fork with HTTP/2 and HTTP/3 support")
    (description "urllib3-future adds HTTP/2 and HTTP/3 (QUIC) to urllib3.")
    (license license:expat)))

;; 13. python-uv-dynamic-versioning
(define-public python-uv-dynamic-versioning
  (package
    (name "python-uv-dynamic-versioning")
    (version "0.14.0")
    (source (origin (method url-fetch) (uri (pypi-uri "uv_dynamic_versioning" version))
       (sha256 (base32 "0nyvr1x24qf2hynbixcgp5bi51v4p39pm5jm3p04bkksx03vqksp"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/nikhilweee/uv-dynamic-versioning")
    (synopsis "Dynamic versioning plugin for uv/hatch build systems")
    (description "uv-dynamic-versioning enables dynamic version determination from VCS tags.")
    (license license:expat)))

;; 14. davs2
(define-public davs2
  (package
    (name "davs2")
    (version "1.7")
    (source (origin (method url-fetch)
       (uri (string-append "https://github.com/pkuvcl/davs2/archive/refs/tags/" version ".tar.gz"))
       (sha256 (base32 "1j1wj9zp5aghacv30n23fz2590bwf0lnvk54lgnzgix1fsrx15xn"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
      #:phases #~(modify-phases %standard-phases
        (add-before 'configure 'chdir-build (lambda _ (chdir "build/linux")))
        (replace 'configure
          (lambda* (#:key outputs #:allow-other-keys)
            (invoke "../../configure"
              (string-append "--prefix=" (assoc-ref outputs "out"))
              "--enable-shared" "--disable-static"))))))
    (home-page "https://github.com/pkuvcl/davs2")
    (synopsis "AVS2 (IEEE 1857.4) video decoder")
    (description "davs2 is an open-source decoder for the AVS2 video coding format.")
    (license license:gpl2+)))

;; 15. xavs2
(define-public xavs2
  (package
    (name "xavs2")
    (version "1.4")
    (source (origin (method url-fetch)
       (uri (string-append "https://github.com/pkuvcl/xavs2/archive/refs/tags/" version ".tar.gz"))
       (sha256 (base32 "1kn6aanhphkvlhr2903x6lwvphraki7x4gqa1aaaicjcsqf76v8y"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
      #:phases #~(modify-phases %standard-phases
        (add-before 'configure 'chdir-build (lambda _ (chdir "build/linux")))
        (replace 'configure
          (lambda* (#:key outputs #:allow-other-keys)
            (invoke "../../configure"
              (string-append "--prefix=" (assoc-ref outputs "out"))
              "--enable-shared" "--disable-static"))))))
    (native-inputs (list yasm))
    (home-page "https://github.com/pkuvcl/xavs2")
    (synopsis "AVS2 (IEEE 1857.4) video encoder")
    (description "xavs2 is an open-source encoder for the AVS2 video coding format.")
    (license license:gpl2+)))

;; 16. vvenc
(define-public vvenc
  (package
    (name "vvenc")
    (version "1.14.0")
    (source (origin (method url-fetch)
       (uri (string-append "https://github.com/fraunhoferhhi/vvenc/archive/refs/tags/v" version ".tar.gz"))
       (sha256 (base32 "0x71ks9rhmq6iy9jhqk427c7v1vj0ss9rfg5kadhvg4xsmhx0hyx"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/fraunhoferhhi/vvenc")
    (synopsis "Fraunhofer Versatile Video Encoder for VVC/H.266")
    (description "vvenc is an open-source VVC (H.266) encoder by Fraunhofer HHI.")
    (license license:bsd-3)))

;; 17. quirc
(define-public quirc
  (package
    (name "quirc")
    (version "1.2")
    (source (origin (method url-fetch)
       (uri (string-append "https://github.com/dlbeer/quirc/archive/refs/tags/v" version ".tar.gz"))
       (sha256 (base32 "1ib4xc6pr5vsgxfdvgbh0pnagnsp9xkwf60jp27w6zik7nijxhbk"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
      #:make-flags #~(list (string-append "PREFIX=" #$output))
      #:phases #~(modify-phases %standard-phases (delete 'configure))))
    (home-page "https://github.com/dlbeer/quirc")
    (synopsis "Small QR code decoding library written in C")
    (description "quirc is a small C library for extracting and decoding QR codes.")
    (license license:isc)))

;; 18. apriltag
(define-public apriltag
  (package
    (name "apriltag")
    (version "3.4.5")
    (source (origin (method url-fetch)
       (uri (string-append "https://github.com/AprilRobotics/apriltag/archive/refs/tags/v" version ".tar.gz"))
       (sha256 (base32 "05b5ap6cz5jfb2cc5qxsbn717x71yihkhdss6yfc4y6v421g8j9p"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/AprilRobotics/apriltag")
    (synopsis "AprilTag visual fiducial detection system")
    (description "AprilTag is a visual fiducial system for robotics research.")
    (license license:bsd-2)))

;; 19. libuvc
(define-public libuvc
  (package
    (name "libuvc")
    (version "0.0.7")
    (source (origin (method url-fetch)
       (uri (string-append "https://github.com/libuvc/libuvc/archive/refs/tags/v" version ".tar.gz"))
       (sha256 (base32 "0wpfhsd95zdi3rirdfnp06vpb7rzs3xxrjp6zg6hqpdd4fbsfsvw"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libusb))
    (home-page "https://github.com/libuvc/libuvc")
    (synopsis "Cross-platform library for USB Video Class devices")
    (description "libuvc provides a userspace API for USB Video Class devices.")
    (license license:bsd-3)))

;; 20. dynamips
(define-public dynamips
  (package
    (name "dynamips")
    (version "0.2.23")
    (source (origin (method url-fetch)
       (uri (string-append "https://github.com/GNS3/dynamips/archive/refs/tags/v" version ".tar.gz"))
       (sha256 (base32 "18a1lkfm4g0d9ri44whbipif4xjbh05vvs6vm079149zq19bnfsh"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libelf libpcap))
    (home-page "https://github.com/GNS3/dynamips")
    (synopsis "Cisco router emulator for GNS3 network simulation")
    (description "Dynamips emulates Cisco IOS routers for GNS3 network simulation.")
    (license license:gpl2+)))

;; 21. moodbar
(define-public moodbar
  (package
    (name "moodbar")
    (version "1.3.0")
    (source (origin (method url-fetch)
       (uri (string-append "https://github.com/exaile/moodbar/archive/refs/tags/v" version ".tar.gz"))
       (sha256 (base32 "18b0ksn9yacdzgaj81ydkkwcvmly296bc02khpacip3wvq1m442k"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gstreamer gst-plugins-base))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/exaile/moodbar")
    (synopsis "Audio mood visualization generator using GStreamer")
    (description "Moodbar generates colorful mood visualizations of audio files.")
    (license license:gpl2+)))

;; 22. libaribcaption
(define-public libaribcaption
  (package
    (name "libaribcaption")
    (version "1.1.1")
    (source (origin (method url-fetch)
       (uri (string-append "https://github.com/xqq/libaribcaption/archive/refs/tags/v" version ".tar.gz"))
       (sha256 (base32 "10s6sjfglm8wznv44f30ikby5v9m4prn9z4a2x30ml32lsh07397"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/xqq/libaribcaption")
    (synopsis "ARIB STD-B24 caption decoder and renderer library")
    (description "libaribcaption decodes and renders ARIB STD-B24 captions for Japanese DTV.")
    (license license:expat)))

;; 23. libklvanc
(define-public libklvanc
  (package
    (name "libklvanc")
    (version "1.6.0")
    (source (origin (method url-fetch)
       (uri (string-append "https://github.com/stoth68000/libklvanc/archive/refs/tags/vid.obe." version ".tar.gz"))
       (sha256 (base32 "1hs8r6qpng8kzjnmim4gmnlkf6dji6hhp26dsbmg8kjs8m4clxjh"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
      #:phases #~(modify-phases %standard-phases
        (add-before 'configure 'autoreconf (lambda _ (invoke "autoreconf" "-fi"))))))
    (native-inputs (list autoconf automake libtool pkg-config))
    (home-page "https://github.com/stoth68000/libklvanc")
    (synopsis "Library for VANC (Vertical Ancillary Data) processing")
    (description "libklvanc handles VANC in SDI video streams for professional broadcast.")
    (license license:lgpl2.1)))

;; 24. xevd
(define-public xevd
  (package
    (name "xevd")
    (version "0.5.0")
    (source (origin (method url-fetch)
       (uri (string-append "https://github.com/mpeg5/xevd/archive/refs/tags/v" version ".tar.gz"))
       (sha256 (base32 "1n7c7hmlaabsl35ndx36wyy8iljd3nd15ghzx47ygm4s3bncfmcd"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mpeg5/xevd")
    (synopsis "MPEG-5 Essential Video Coding (EVC) decoder")
    (description "xevd is an open-source MPEG-5 EVC decoder.")
    (license license:bsd-3)))

;; 25. xeve
(define-public xeve
  (package
    (name "xeve")
    (version "0.5.0")
    (source (origin (method url-fetch)
       (uri (string-append "https://github.com/mpeg5/xeve/archive/refs/tags/v" version ".tar.gz"))
       (sha256 (base32 "12kfb771kxgysp2sf2mb10fyvmk79mqcs3213xi4h2ra3n997dag"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mpeg5/xeve")
    (synopsis "MPEG-5 Essential Video Coding (EVC) encoder")
    (description "xeve is an open-source MPEG-5 EVC encoder.")
    (license license:bsd-3)))

;; 26. openapv
(define-public openapv
  (package
    (name "openapv")
    (version "0.2.1.2")
    (source (origin (method url-fetch)
       (uri (string-append "https://github.com/AcademySoftwareFoundation/openapv/archive/refs/tags/v" version ".tar.gz"))
       (sha256 (base32 "067z57hawak72r3dncmaclyhrfyfl17z3vi4vzlgb5phqkl0ch8n"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/AcademySoftwareFoundation/openapv")
    (synopsis "Open Advanced Professional Video codec implementation")
    (description "OpenAPV implements the APV codec for professional video workflows.")
    (license license:bsd-3)))

;; 27. uavs3d
(define-public uavs3d
  (package
    (name "uavs3d")
    (version "1.0")
    (source (origin (method url-fetch)
       (uri (string-append "https://github.com/uavs3/uavs3d/archive/refs/tags/" version ".tar.gz"))
       (sha256 (base32 "0c1lb49z68m3fxrw0srqy47rljcwnihdqlg6hxy66v5m4cif8pi6"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/uavs3/uavs3d")
    (synopsis "AVS3 (IEEE 1857.10) video decoder")
    (description "uavs3d is an open-source AVS3 video decoder with SIMD optimizations.")
    (license license:bsd-3)))
