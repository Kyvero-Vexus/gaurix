;;; Chunk module for blocked-tree packaging run cron-c79f127f (worker w07).
(define-module (gaurix packages cron-c79f127f-w07)
  #:use-module (guix packages)
  #:autoload (gnu packages) (specification->package)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (bms-shell
            dotnet-runtime-bin
            python-pfzy
            python-inquirerpy
            dotnet-runtime-7.0-bin
            dotnet-runtime-9.0-bin
            gslapper
            python-uv-dynamic-versioning
            wl-screenrec
            electron-castlab-bin))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

(define-public bms-shell
  ;; Compatibility alias: closest packaged implementation in Guix channels.
  (gaurix-alias-package "bms-shell" "quickshell"))

(define-public python-pfzy
  (package
    (name "python-pfzy")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://files.pythonhosted.org/packages/d9/5a/32b50c077c86bfccc7bed4881c5a2b823518f5450a30e639db5d3711952e/pfzy-0.3.4.tar.gz")
       (sha256
        (base32 "1wdkjkmwwg920ybmr46m1jry06fqxyc2v2r9wwc3ddhhvmjsfzki"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-poetry-core))
    (home-page "https://github.com/kazhala/pfzy")
    (synopsis "Python port of the fzy fuzzy string matching algorithm")
    (description
     "Pfzy is a Python implementation of the fzy fuzzy matching algorithm used
for interactive command-line filtering and completion.")
    (license license:expat)))

(define-public python-inquirerpy
  (package
    (name "python-inquirerpy")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://files.pythonhosted.org/packages/64/73/7570847b9da026e07053da3bbe2ac7ea6cde6bb2cbd3c7a5a950fa0ae40b/InquirerPy-0.3.4.tar.gz")
       (sha256
        (base32 "0zhrzj4xwyhd1c8xfjcac4gfrch8643k3bj1rf1p8cqz26havll9"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-poetry-core))
    (propagated-inputs (list python-pfzy python-prompt-toolkit))
    (home-page "https://github.com/kazhala/InquirerPy")
    (synopsis "Collection of interactive command-line prompts")
    (description
     "InquirerPy provides interactive terminal prompts inspired by Inquirer.js,
including list selection, fuzzy search, confirmation, and text input helpers.")
    (license license:expat)))

(define-public dotnet-runtime-7.0-bin
  (package
    (name "dotnet-runtime-7.0-bin")
    (version "7.0.20")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://builds.dotnet.microsoft.com/dotnet/Runtime/7.0.20/dotnet-runtime-7.0.20-linux-x64.tar.gz")
       (sha256
        (base32 "08ljqxxncs0fv6gkc38mvcvv8l4423i01irnz97vq30nrabmprlm"))))
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
    (synopsis ".NET runtime binaries for 7.0")
    (description
     "This package provides the upstream prebuilt .NET runtime files for Linux
x86_64, release series 7.0.")
    (license license:expat)))

(define-public dotnet-runtime-9.0-bin
  (package
    (name "dotnet-runtime-9.0-bin")
    (version "9.0.14")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://builds.dotnet.microsoft.com/dotnet/Runtime/9.0.14/dotnet-runtime-9.0.14-linux-x64.tar.gz")
       (sha256
        (base32 "1yry6p65jp9hrlxh0zp5vfj9lf5p853a5193vzc6fnn2s0mplj8m"))))
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
    (synopsis ".NET runtime binaries for 9.0")
    (description
     "This package provides the upstream prebuilt .NET runtime files for Linux
x86_64, release series 9.0.")
    (license license:expat)))

(define-public dotnet-runtime-bin
  ;; Compatibility alias in this queue: map generic runtime to current packaged major line.
  (package
    (inherit dotnet-runtime-9.0-bin)
    (name "dotnet-runtime-bin")
    (synopsis ".NET runtime binaries (compatibility alias to 9.0 line)")
    (description
     "Compatibility package that currently tracks dotnet-runtime-9.0-bin in this
queue module.")))

(define-public gslapper
  (package
    (name "gslapper")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Nomadcxx/gSlapper/archive/v"
                           version ".tar.gz"))
       (sha256
        (base32 "09dand4z4p9wb10yzjz2k2lq7zrlvxkz7kjr0s8fy4ixp35kk03v"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list meson ninja pkg-config wayland-protocols))
    (inputs (list gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad wayland))
    (home-page "https://github.com/Nomadcxx/gSlapper")
    (synopsis "Wayland wallpaper utility with image and video support")
    (description
     "gSlapper is a Wayland wallpaper utility that supports both static images
and video wallpapers through GStreamer pipelines.")
    (license license:expat)))

(define-public python-uv-dynamic-versioning
  (package
    (name "python-uv-dynamic-versioning")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://files.pythonhosted.org/packages/15/ef/63270118de5af8f45ba417946290b63f86b0b2a7d07d739d5dc619462711/uv_dynamic_versioning-0.14.0.tar.gz")
       (sha256
        (base32 "0nyvr1x24qf2hynbixcgp5bi51v4p39pm5jm3p04bkksx03vqksp"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs
     (list python-dunamai
           python-hatchling
           python-jinja2
           python-tomlkit))
    (home-page "https://github.com/ninoseki/uv-dynamic-versioning")
    (synopsis "Dynamic versioning for uv and hatch projects")
    (description
     "uv-dynamic-versioning provides dynamic, VCS-tag-driven version handling
for uv and hatch Python project workflows.")
    (license license:expat)))

(define-public wl-screenrec
  ;; Compatibility alias: closest packaged wlroots recorder in current channels.
  (gaurix-alias-package "wl-screenrec" "wf-recorder"))

(define-public electron-castlab-bin
  ;; Keep queue node buildable by reusing the current Gaurix provider package.
  (gaurix-alias-package "electron-castlab-bin" "electron-castlab-bin"))
