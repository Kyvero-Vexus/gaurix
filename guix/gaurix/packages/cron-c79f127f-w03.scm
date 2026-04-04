;;; Chunk module for blocked-tree queue run cron-c79f127f worker w03.
(define-module (gaurix packages cron-c79f127f-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (python-munge
            xrizer-common
            sqlite-utils
            ollama-bin
            plasma-wayland-protocols-povd
            ncurses5-compat-libs
            python-condense-json
            zmusic
            python-m3u8
            python312))

(define (gaurix-rename-package pkg alias-name)
  (package
    (inherit pkg)
    (name alias-name)))

(define-public python-munge
  (package
    (name "python-munge")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "munge" version))
       (sha256
        (base32 "0sim3xf62imvsqmmd0gmqw2va4czffwybzhvrqzrkk2gc9p1b31g"))))
    (build-system pyproject-build-system)
    (propagated-inputs
     (list python-charset-normalizer
           python-click
           python-pyyaml
           python-requests
           python-toml
           python-tomlkit
           python-urllib3))
    (native-inputs
     (list python-hatchling))
    (home-page "https://github.com/20c/munge/")
    (synopsis "Data manipulation library and command-line client")
    (description
     "Munge is a Python library and command-line client for manipulating
structured data.")
    (license license:asl2.0)))

(define-public xrizer-common
  (package
    (name "xrizer-common")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/plain/openvrpaths.vrpath?h=xrizer")
       (file-name "openvrpaths.vrpath")
       (sha256
        (base32 "0fg8vrq7b43plxmjpr7y288phy2b8f27ah8khyxbqh93q1lyswy2"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("openvrpaths.vrpath" "opt/xrizer/openvrpaths.vrpath"))))
    (home-page "https://github.com/Supreeeme/xrizer")
    (synopsis "Common runtime metadata files for xrizer")
    (description
     "This package provides the shared runtime metadata file used by xrizer
OpenVR runtime deployments.")
    (license license:gpl3)))

(define-public sqlite-utils
  (gaurix-rename-package python-sqlite-utils "sqlite-utils"))

(define-public ollama-bin
  (package
    (name "ollama-bin")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ollama/ollama/releases/download/v"
             version
             "/ollama-linux-amd64.tar.zst"))
       (sha256
        (base32 "1lm54ssmcnrhr7yhfb5xwwis22j3ymgvk8a30l1r3rb9lb1vxv5k"))))
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
                              (error
                               (string-append
                                "Could not find ollama binary "
                                "in extracted archive")))))
                   (lib-src (cond
                             ((file-exists? "lib/ollama") "lib/ollama")
                             ((file-exists? "ollama/lib/ollama") "ollama/lib/ollama")
                             (else #f))))
              (mkdir-p (string-append out "/bin"))
              (copy-file bin-src (string-append out "/bin/ollama"))
              (chmod (string-append out "/bin/ollama") #o755)
              (when lib-src
                (mkdir-p (string-append out "/lib"))
                (copy-recursively lib-src (string-append out "/lib/ollama")))))
          #t)))
    (home-page "https://github.com/ollama/ollama")
    (synopsis "Run and serve local LLMs (prebuilt binary)")
    (description
     "Ollama runs and serves large language models locally.  This package
repackages the upstream prebuilt Linux x86_64 binary release.")
    (license license:expat)))

(define-public plasma-wayland-protocols-povd
  (gaurix-rename-package plasma-wayland-protocols
                         "plasma-wayland-protocols-povd"))

(define-public ncurses5-compat-libs
  (gaurix-rename-package ncurses "ncurses5-compat-libs"))

(define-public python-condense-json
  (package
    (name "python-condense-json")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "condense_json" version))
       (sha256
        (base32 "1g6j77846j4yy9jpbhf2vgbf4spr30z1mwlqing89zfs9x1qvzi5"))))
    (build-system pyproject-build-system)
    (native-inputs
     (list python-setuptools
           python-wheel))
    (home-page "https://github.com/simonw/condense-json")
    (synopsis "Condense JSON by replacing repeated values")
    (description
     "Condense-JSON provides a Python function that condenses JSON payloads by
replacing repeated values with references.")
    (license license:asl2.0)))

(define-public zmusic
  (package
    (name "zmusic")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ZDoom/ZMusic/archive/refs/tags/"
             version
             ".tar.gz"))
       (sha256
        (base32 "0zwzx2pcxswrhfgwmr3dj7f2m6vi6mbdd55b54vqpcy93hgd9k1f"))))
    (build-system cmake-build-system)
    (native-inputs
     (list pkg-config))
    (inputs
     (list alsa-lib
           libsndfile
           mpg123))
    (home-page "https://github.com/ZDoom/ZMusic")
    (synopsis "Standalone music playback library from GZDoom")
    (description
     "ZMusic is a standalone music playback library extracted from the GZDoom
project.  It provides playback and synthesis support for multiple game music
formats.")
    (license license:gpl3+)))

(define-public python-m3u8
  (package
    (name "python-m3u8")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "m3u8" version))
       (sha256
        (base32 "1zf0m6gnvzjpzym4dzw2i5hwvd9ydjqi755gpi9sdmv72q59kpks"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools))
    (home-page "https://github.com/globocom/m3u8")
    (synopsis "Python m3u8 parser")
    (description "M3U8 is a Python parser and generator for m3u8 playlists.")
    (license license:expat)))

(define-public python312
  (gaurix-rename-package python-3.12 "python312"))
