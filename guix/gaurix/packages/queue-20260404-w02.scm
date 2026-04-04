;;; Queue module for batch 20260404-w02: 10 AUR packages resolved.
(define-module (gaurix packages queue-20260404-w02)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:export (elephant-bin
            glfw-wayland-minecraft-cursorfix
            c++utilities
            lib32-libdav1d
            dotnet-targeting-pack-7.0-bin
            hyprshot
            ps3-env
            qpdf-zopfli
            aml1
            cachyos-ananicy-rules))

;;; ---------------------------------------------------------------
;;; 1. elephant-bin  — Single Go binary from GitHub releases
;;; ---------------------------------------------------------------
(define-public elephant-bin
  (package
    (name "elephant-bin")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/abenz1267/elephant/releases/download/v"
             version "/elephant-linux-amd64.tar.gz"))
       (sha256
        (base32 "164f0bn4qnh6ns56azb8yjdb733f44lp8hm6igb63bqkzkmbp2m7"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("elephant-linux-amd64" "bin/elephant"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/elephant") #o755))))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "General purpose datasource and executor")
    (description
     "Elephant is a general purpose datasource and executor, providing modules
for application launching, clipboard, calculator, bookmarks, and more.")
    (license license:gpl3)))

;;; ---------------------------------------------------------------
;;; 2. glfw-wayland-minecraft-cursorfix — alias to Guix glfw
;;; ---------------------------------------------------------------
(define-public glfw-wayland-minecraft-cursorfix
  (package
    (inherit (specification->package "glfw"))
    (name "glfw-wayland-minecraft-cursorfix")))

;;; ---------------------------------------------------------------
;;; 3. c++utilities — alias to Guix cpp-utilities
;;; ---------------------------------------------------------------
(define-public c++utilities
  (package
    (inherit (specification->package "cpp-utilities"))
    (name "c++utilities")))

;;; ---------------------------------------------------------------
;;; 4. lib32-libdav1d — alias to Guix dav1d
;;; ---------------------------------------------------------------
(define-public lib32-libdav1d
  (package
    (inherit (specification->package "dav1d"))
    (name "lib32-libdav1d")))

;;; ---------------------------------------------------------------
;;; 5. dotnet-targeting-pack-7.0-bin — .NET targeting pack binary
;;; ---------------------------------------------------------------
(define-public dotnet-targeting-pack-7.0-bin
  (package
    (name "dotnet-targeting-pack-7.0-bin")
    (version "7.0.20")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://api.nuget.org/v3-flatcontainer/microsoft.netcore.app.ref/"
             version "/microsoft.netcore.app.ref." version ".nupkg"))
       (sha256
        (base32 "1fv6p9idx6g58y0khw7jl23lkwj01l8246mv045i9q6sp3fm9m2v"))))
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
    (synopsis ".NET 7.0 targeting pack reference assemblies")
    (description
     "This package installs the Microsoft.NETCore.App.Ref targeting pack, which
provides reference assemblies and design-time assets used to compile .NET
applications against the 7.0 runtime.")
    (license license:expat)))

;;; ---------------------------------------------------------------
;;; 6. hyprshot — screenshot utility for Hyprland
;;; ---------------------------------------------------------------
(define-public hyprshot
  (package
    (name "hyprshot")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Gustash/Hyprshot/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0fb79wll1w63bamzhvirfgc88khj6aylg15gp48xhwz4dvkdnnri"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (license-dir (string-append out "/share/licenses/hyprshot")))
                (mkdir-p bin)
                (mkdir-p license-dir)
                (install-file "hyprshot" bin)
                (chmod (string-append bin "/hyprshot") #o755)
                (install-file "LICENSE" license-dir)))))))
    (propagated-inputs
     (list
      (list "bash" (specification->package "bash"))
      (list "grim" (specification->package "grim"))
      (list "jq" (specification->package "jq"))
      (list "libnotify" (specification->package "libnotify"))
      (list "slurp" (specification->package "slurp"))
      (list "wl-clipboard" (specification->package "wl-clipboard"))))
    (home-page "https://github.com/Gustash/Hyprshot")
    (synopsis "Utility to take screenshots in Hyprland")
    (description
     "Hyprshot is a utility script to take area, window, and monitor
screenshots in Hyprland and copy results to the clipboard.")
    (license license:gpl3)))

;;; ---------------------------------------------------------------
;;; 7. ps3-env — meta package for PS3 homebrew dev
;;; ---------------------------------------------------------------
(define-public ps3-env
  (package
    (name "ps3-env")
    (version "20230409")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ps3-env.tar.gz")
       (sha256
        (base32 "0nqnvjfn95r3bqlzcqmlghyhzxx1px50c7fa14mfwbh41zn0blin"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (prefix (string-append out "/opt/ps3dev")))
                (mkdir-p prefix)
                (for-each
                 (lambda (file)
                   (when (file-exists? file)
                     (install-file file prefix)))
                 '("ps3toolchain.sh" "ps3libraries.sh"
                   "modulefile_ps3toolchain" "modulefile_ps3libraries"))))))))
    (home-page "https://github.com/ps3dev/ps3toolchain")
    (synopsis "Environment setup files for PS3 homebrew toolchains")
    (description
     "ps3-env provides shell snippets and environment module files used by
PS3 homebrew development toolchains.")
    (license license:expat)))

;;; ---------------------------------------------------------------
;;; 8. qpdf-zopfli — QPDF with Zopfli compression support
;;; ---------------------------------------------------------------
(define-public qpdf-zopfli
  (package
    (name "qpdf-zopfli")
    (version "12.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/qpdf/qpdf/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1mx43agkzfl3p2wjasmv21v8j1dihy5nmkhzz9ilhcypy001ib0i"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DZOPFLI=ON")))
    (inputs
     (list (specification->package "gnutls")
           (specification->package "libjpeg-turbo")
           (specification->package "openssl")
           zlib
           zopfli))
    (home-page "https://github.com/qpdf/qpdf")
    (synopsis "PDF transformation tool with Zopfli compression")
    (description
     "QPDF is a command-line program that does structural, content-preserving
transformations on PDF files.  This variant is built with Zopfli support for
improved zlib-compatible compression.")
    (license license:asl2.0)))

;;; ---------------------------------------------------------------
;;; 9. aml1 — Another Main Loop library
;;; ---------------------------------------------------------------
(define-public aml1
  (package
    (name "aml1")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/any1/aml/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "15ldy8w26n26aav9rcdr23hajblysr3i2qdwx109zwrs451zgf5j"))))
    (build-system meson-build-system)
    (home-page "https://github.com/any1/aml")
    (synopsis "Another Main Loop library")
    (description
     "Aml is a small event loop library for C that provides file descriptor
watching, timers, signals, and idle callbacks.")
    (license license:isc)))

;;; ---------------------------------------------------------------
;;; 10. cachyos-ananicy-rules — CachyOS ananicy scheduling rules
;;; ---------------------------------------------------------------
(define-public cachyos-ananicy-rules
  (package
    (name "cachyos-ananicy-rules")
    (version "1.1.32")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/CachyOS/ananicy-rules/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0rn82aclgc8wgxk1xvzx6gzwsx58y08q45m1cbb06zq91is1qpwk"))))
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
                   (target (string-append out "/etc/ananicy.d"))
                   (license-dir (string-append out "/share/licenses/cachyos-ananicy-rules")))
              (mkdir-p target)
              (for-each
               (lambda (name)
                 (unless (member name '("." ".." ".gitattributes" ".github"
                                        "README.md" "README" "LICENSE"))
                   (let ((path (string-append top "/" name)))
                     (if (file-is-directory? path)
                         (copy-recursively path (string-append target "/" name))
                         (install-file path target)))))
               (scandir top (lambda (x) (not (member x '("." ".."))))))
              (when (file-exists? (string-append top "/LICENSE"))
                (mkdir-p license-dir)
                (install-file (string-append top "/LICENSE") license-dir)))))))
    (home-page "https://github.com/CachyOS/ananicy-rules")
    (synopsis "Ananicy ruleset maintained by CachyOS")
    (description
     "This package provides the CachyOS-maintained ruleset for Ananicy process
scheduling profiles.")
    (license license:gpl3)))
