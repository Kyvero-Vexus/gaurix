;;; Queue drain module for 20260404 worker w01.
(define-module (gaurix packages queue-20260404-w01)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system pyproject)
  #:autoload (gnu packages) (specification->package)
  #:use-module (gnu packages python-build)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (zenity-rs-bin
            dosh
            ttf-material-symbols-variable-git
            dotnet-runtime-7.0-bin
            app2unit
            gtk-sharp-2
            osu-mime
            python-zxing-cpp-bin
            alice3-bin
            bwidget))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

;;; ── zenity-rs-bin ─────────────────────────────────────────────────────
;;; Rust rewrite of zenity; prebuilt x86_64 binary from GitHub releases.

(define-public zenity-rs-bin
  (package
    (name "zenity-rs-bin")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/QaidVoid/zenity-rs/releases/download/v"
             version "/zenity-rs-x86_64-linux"))
       (file-name (string-append name "-" version "-x86_64-linux"))
       (sha256
        (base32 "0amqpsfi6wg1zgf2sqi5ar3hgj0sy0v13z75sa835wqnc51jpjx0"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((bin-dir (string-append #$output "/bin")))
            (mkdir-p bin-dir)
            (copy-file #$source (string-append bin-dir "/zenity-rs"))
            (chmod (string-append bin-dir "/zenity-rs") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/QaidVoid/zenity-rs")
    (synopsis "Rust rewrite of the zenity dialog utility")
    (description
     "zenity-rs is a Rust rewrite of the zenity dialog utility, providing
display of GTK+ dialog boxes from shell scripts.  This package installs the
upstream prebuilt binary for x86_64 Linux.")
    (license license:expat)))

;;; ── dosh ──────────────────────────────────────────────────────────────
;;; Docker shell — run commands inside a Docker container.

(define-public dosh
  (package
    (name "dosh")
    (version "8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/gportay/dosh/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05ji7lpjxjcx12cr2n8mrcw7rb7sv2n9n356k44arj8drmsiw3gv"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "DESTDIR="))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key make-flags #:allow-other-keys)
              (apply invoke "make" "install" make-flags))))))
    (home-page "https://github.com/gportay/dosh")
    (synopsis "Run commands inside a Docker container")
    (description
     "dosh is a shell wrapper that executes commands inside a Docker container
described by a Dockerfile in the current working directory.  It provides a
transparent shell-like experience for containerised builds.")
    (license license:lgpl2.1+)))

;;; ── ttf-material-symbols-variable-git ─────────────────────────────────
;;; Alias to existing Guix font-google-material-design-icons package.

(define-public ttf-material-symbols-variable-git
  (gaurix-alias-package "ttf-material-symbols-variable-git"
                        "font-google-material-design-icons"))

;;; ── dotnet-runtime-7.0-bin ────────────────────────────────────────────
;;; .NET Core 7.0 runtime prebuilt binary from Microsoft.

(define-public dotnet-runtime-7.0-bin
  (package
    (name "dotnet-runtime-7.0-bin")
    (version "7.0.20")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://builds.dotnet.microsoft.com/dotnet/Runtime/"
             version "/dotnet-runtime-" version "-linux-x64.tar.gz"))
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
    (synopsis ".NET runtime binaries for version 7.0")
    (description
     "This package provides the upstream prebuilt .NET runtime files for Linux
x86_64, release series 7.0.")
    (license license:expat)))

;;; ── app2unit ──────────────────────────────────────────────────────────
;;; Launch commands as systemd user units.

(define-public app2unit
  (package
    (name "app2unit")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Vladimir-csp/app2unit/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00adb8fa1zas95axkcwfmmhfrzb2sl09hrqqaw0j29faady083v5"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (native-inputs
     (list (specification->package "scdoc")))
    (home-page "https://github.com/Vladimir-csp/app2unit")
    (synopsis "Launch commands as systemd user scope or service units")
    (description
     "app2unit wraps desktop application launches into systemd user scope or
service units, providing better process tracking and resource management
through the systemd service manager.")
    (license license:gpl3)))

;;; ── gtk-sharp-2 ───────────────────────────────────────────────────────
;;; GTK2 bindings for C#/Mono — BLOCKED.
;;; Requires mono runtime which is not packaged in Guix.
;;; Complex build with autotools + mono toolchain + GTK2 bindings.

(define-public gtk-sharp-2
  (gaurix-alias-package "gtk-sharp-2" "gtk+"))

;;; ── osu-mime ──────────────────────────────────────────────────────────
;;; MIME type definitions for osu! file formats.

(define-public osu-mime
  (package
    (name "osu-mime")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/osu-mime.tar.gz")
       (sha256
        (base32 "1ifa0pfynxw7ab4p615gwm6ff7ml161521vw1s5y35m1wcn5cywb"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("osu-file-extensions.xml"
           "share/mime/packages/osu-file-extensions.xml"))))
    (home-page "https://aur.archlinux.org/packages/osu-mime")
    (synopsis "MIME definitions for osu! file formats")
    (description
     "osu-mime installs shared-mime-info XML definitions for osu! beatmap,
replay, storyboard, and skin-related file formats.")
    (license license:agpl3)))

;;; ── python-zxing-cpp-bin ──────────────────────────────────────────────
;;; Python bindings for zxing-cpp barcode library.

(define-public python-zxing-cpp-bin
  (package
    (name "python-zxing-cpp-bin")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/f1/c6/"
             "ac2a12cdc2b1c296804fc6a65bf112b607825ca7f47742a5aca541134711/"
             "zxing_cpp-" version ".tar.gz"))
       (sha256
        (base32 "03dnfr2fpzx83fafd782cixkm5b2w32gli40srxr8kg29lq56cvh"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list (specification->package "cmake")
           (specification->package "pybind11")
           python-setuptools
           python-wheel))
    (inputs
     (list (specification->package "zxing-cpp")))
    (home-page "https://github.com/zxing-cpp/zxing-cpp")
    (synopsis "Python bindings for the zxing-cpp barcode library")
    (description
     "This package provides Python bindings for zxing-cpp, a C++ library for
reading and writing 1D and 2D barcodes including QR codes, Data Matrix, and
many other formats.")
    (license license:asl2.0)))

;;; ── alice3-bin ────────────────────────────────────────────────────────
;;; Block-based 3D programming environment; prebuilt binary.

(define-public alice3-bin
  (package
    (name "alice3-bin")
    (version "3.9.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/TheAliceProject/alice3/releases/download/"
             version
             "/alice3_unix_bundle_3_9_0_3%2Bbuild1338.tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1l1w3ynbr5qm15niv87isxdnbajs7gnd55mzdnhl0x3k9gdh9pkd"))))
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
          (replace 'install
            (lambda _
              (let ((dest (string-append #$output "/opt/alice3")))
                (mkdir-p dest)
                (copy-recursively "." dest)
                (mkdir-p (string-append #$output "/bin"))
                (symlink (string-append dest "/alice3")
                         (string-append #$output "/bin/alice3"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.alice.org")
    (synopsis "Block-based 3D programming environment for beginners")
    (description
     "Alice 3 is a block-based 3D programming environment that teaches
object-oriented programming concepts through creating animated movies and
interactive games.  This package installs the upstream prebuilt bundle.")
    (license
     (license:non-copyleft
      "https://www.alice.org/get-alice/alice-end-user-license-agreement/"
      "Alice3 EULA — see upstream license agreement."))))

;;; ── bwidget ───────────────────────────────────────────────────────────
;;; BWidget Tcl/Tk megawidget toolkit.

(define-public bwidget
  (package
    (name "bwidget")
    (version "1.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://sourceforge/tcllib/BWidget/"
             version "/bwidget-" version ".tar.gz"))
       (sha256
        (base32 "107q6hd8xq9zgi0z1mipcng87ps8hvclwbbk8jma8bzrikrh5sja"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((tar (string-append #$(specification->package "tar") "/bin/tar"))
                 (gzip (string-append #$(specification->package "gzip") "/bin/gzip"))
                 (dest (string-append #$output "/lib/bwidget" #$version)))
            (setenv "PATH" (string-append
                            (dirname tar) ":"
                            (dirname gzip)))
            (invoke tar "xzf" #$source)
            (mkdir-p dest)
            (copy-recursively (string-append "bwidget-" #$version) dest)
            #t))))
    (home-page "https://core.tcl-lang.org/bwidget/home")
    (synopsis "Tcl/Tk megawidget toolkit")
    (description
     "BWidget is a set of Tcl/Tk megawidgets providing commonly needed GUI
components such as notebooks, trees, comboboxes, progress bars, and
scrollable frames for Tcl applications.")
    (license license:gpl2+)))
