;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass 5.
;;; 13 recipes: 1 inherit (noglycin-doc), 1 cmake (qpdf-zopfli), 2 binary-zip (c47/r47),
;;; 1 binary-elf (cliamp), 1 fish plugin (fish-session), 1 .NET binary (dafny-bin),
;;; 1 Qt/cmake (qxmledit), 1 cmake (ipmctl), 1 gnu make (mas/asl), 1 autotools (tilem-gtk3),
;;; 1 binary-tar (wireview-linux), 1 alias (dpibreak-git).
;;; 17 re-blocked with specific reasons.
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd5)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system qt)
  #:use-module (guix utils)
  #:use-module (gaurix packages cron-c79f127f-r22-w03-nrd3)
  #:use-module (gnu packages image)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages disk)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages commencement)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; Inherit variants
            libjxl-noglycin-doc
            ;; Alias
            dpibreak-git
            ;; Binary packages
            c47-bin
            r47-bin
            cliamp
            dafny-bin
            wireview-linux
            ;; Source builds
            qpdf-zopfli
            qxmledit
            ipmctl-git
            mas
            tilem-gtk3-git
            ;; Fish plugin
            fish-session))

;; ═══════════════════════════════════════════════════════════════════
;; 1. libjxl-noglycin-doc (#3046) — doc output inherit variant
;; ═══════════════════════════════════════════════════════════════════

(define-public libjxl-noglycin-doc
  (package
    (inherit libjxl)
    (name "libjxl-noglycin-doc")
    (arguments
     (substitute-keyword-arguments (package-arguments libjxl)
       ((#:tests? _ #t) #f)
       ((#:configure-flags flags #~'())
        #~(append #$flags
                  (list "-DBUILD_TESTING=OFF"
                        "-DJPEGXL_ENABLE_TOOLS=OFF"
                        "-DJPEGXL_ENABLE_DOXYGEN=ON")))))
    (synopsis "JPEG XL reference documentation, without glycin integration")
    (description "This package provides the API documentation for the libjxl
JPEG XL reference implementation.  In Guix, gdk-pixbuf does not use glycin, so
this is the standard libjxl documentation.  It exists for compatibility with
packages that depend on the @code{-noglycin-doc} variant name.")))

;; ═══════════════════════════════════════════════════════════════════
;; 2. dpibreak-git (#3077) — alias to existing dpibreak
;; ═══════════════════════════════════════════════════════════════════

(define-public dpibreak-git
  (package
    (inherit dpibreak)
    (name "dpibreak-git")
    (synopsis "DPI circumvention tool in Rust (git version)")
    (description (package-description dpibreak))))

;; ═══════════════════════════════════════════════════════════════════
;; 3. c47-bin (#3064) — C47 pocket calculator emulator binary
;; ═══════════════════════════════════════════════════════════════════

(define-public c47-bin
  (package
    (name "c47-bin")
    (version "00.109.03.02a0.vect")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/api/v4/projects/14055190"
             "/packages/generic/c47/" version
             "/c47-linux-" version ".zip"))
       (sha256
        (base32 "1qrbckwczds2mrjbv8nmhy3zp5nza9y0hz40qrw05x2vzxjn25b1"))))
    (build-system trivial-build-system)
    (native-inputs (list unzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")
                  gtk+ cairo glib gmp pulseaudio))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (unzip    (search-input-file %build-inputs "/bin/unzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (bash     (search-input-file %build-inputs "/bin/bash"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (gtk      (assoc-ref %build-inputs "gtk+"))
                 (cairo-in (assoc-ref %build-inputs "cairo"))
                 (glib-in  (assoc-ref %build-inputs "glib"))
                 (gmp-in   (assoc-ref %build-inputs "gmp"))
                 (pulse    (assoc-ref %build-inputs "pulseaudio"))
                 (rpath    (string-append libc-lib "/lib:"
                                          gcc-lib "/lib:"
                                          gtk "/lib:"
                                          cairo-in "/lib:"
                                          glib-in "/lib:"
                                          gmp-in "/lib:"
                                          pulse "/lib"))
                 (lib-dir  (string-append out "/lib/c47"))
                 (share    (string-append out "/share/c47"))
                 (bin-dir  (string-append out "/bin")))
            (invoke unzip "-q" src)
            (let ((srcdir (string-append "c47-linux-" #$version)))
              (mkdir-p lib-dir)
              (mkdir-p share)
              (mkdir-p bin-dir)
              (let ((exe (string-append srcdir "/c47")))
                (install-file exe lib-dir)
                (chmod (string-append lib-dir "/c47") #o755)
                (invoke patchelf "--set-interpreter" ld-so
                        (string-append lib-dir "/c47"))
                (invoke patchelf "--set-rpath" rpath
                        (string-append lib-dir "/c47")))
              (for-each (lambda (f)
                          (when (file-exists? (string-append srcdir "/" f))
                            (copy-file (string-append srcdir "/" f)
                                       (string-append share "/" f))))
                        '("C47__StandardFont.ttf"))
              (when (file-exists? (string-append srcdir "/res"))
                (copy-recursively (string-append srcdir "/res")
                                  (string-append share "/res")))
              (call-with-output-file (string-append bin-dir "/c47")
                (lambda (port)
                  (format port "#!~a
mkdir -p \"$HOME/.config/c47\"
cd \"$HOME/.config/c47\" || exit 1
ln -sf ~a/res ./res 2>/dev/null
ln -sf ~a/c47 ./c47
ln -sf ~a/C47__StandardFont.ttf ./C47__StandardFont.ttf 2>/dev/null
./c47 \"$@\"
rm -f res c47 C47__StandardFont.ttf
" bash share lib-dir share)))
              (chmod (string-append bin-dir "/c47") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://47calc.com")
    (synopsis "emulator for the C47 pocket calculator")
    (description
     "C47 is an emulator for the C47 pocket calculator, a programmable
scientific calculator with a rich set of mathematical functions.  It
emulates the original hardware including display and keyboard.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; 4. r47-bin (#3065) — R47 pocket calculator emulator binary
;; ═══════════════════════════════════════════════════════════════════

(define-public r47-bin
  (package
    (inherit c47-bin)
    (name "r47-bin")
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (unzip    (search-input-file %build-inputs "/bin/unzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (bash     (search-input-file %build-inputs "/bin/bash"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (gtk      (assoc-ref %build-inputs "gtk+"))
                 (cairo-in (assoc-ref %build-inputs "cairo"))
                 (glib-in  (assoc-ref %build-inputs "glib"))
                 (gmp-in   (assoc-ref %build-inputs "gmp"))
                 (pulse    (assoc-ref %build-inputs "pulseaudio"))
                 (rpath    (string-append libc-lib "/lib:"
                                          gcc-lib "/lib:"
                                          gtk "/lib:"
                                          cairo-in "/lib:"
                                          glib-in "/lib:"
                                          gmp-in "/lib:"
                                          pulse "/lib"))
                 (lib-dir  (string-append out "/lib/r47"))
                 (share    (string-append out "/share/r47"))
                 (bin-dir  (string-append out "/bin")))
            (invoke unzip "-q" src)
            (let ((srcdir (string-append "c47-linux-"
                                         #$(package-version c47-bin))))
              (mkdir-p lib-dir)
              (mkdir-p share)
              (mkdir-p bin-dir)
              (let ((exe (string-append srcdir "/r47")))
                (install-file exe lib-dir)
                (chmod (string-append lib-dir "/r47") #o755)
                (invoke patchelf "--set-interpreter" ld-so
                        (string-append lib-dir "/r47"))
                (invoke patchelf "--set-rpath" rpath
                        (string-append lib-dir "/r47")))
              (for-each (lambda (f)
                          (when (file-exists? (string-append srcdir "/" f))
                            (copy-file (string-append srcdir "/" f)
                                       (string-append share "/" f))))
                        '("R47__StandardFont.ttf"))
              (when (file-exists? (string-append srcdir "/res"))
                (copy-recursively (string-append srcdir "/res")
                                  (string-append share "/res")))
              (call-with-output-file (string-append bin-dir "/r47")
                (lambda (port)
                  (format port "#!~a
mkdir -p \"$HOME/.config/r47\"
cd \"$HOME/.config/r47\" || exit 1
ln -sf ~a/res ./res 2>/dev/null
ln -sf ~a/r47 ./r47
ln -sf ~a/R47__StandardFont.ttf ./R47__StandardFont.ttf 2>/dev/null
./r47 \"$@\"
rm -f res r47 R47__StandardFont.ttf
" bash share lib-dir share)))
              (chmod (string-append bin-dir "/r47") #o755))))))
    (home-page "https://47calc.com")
    (synopsis "emulator for the R47 pocket calculator")
    (description
     "R47 is an emulator for the R47 pocket calculator, an RPN (Reverse
Polish Notation) programmable scientific calculator.  It emulates the
original hardware including display and keyboard.")))

;; ═══════════════════════════════════════════════════════════════════
;; 5. cliamp (#3068) — retro terminal music player (binary)
;; ═══════════════════════════════════════════════════════════════════

(define-public cliamp
  (package
    (name "cliamp")
    (version "1.34.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bjarneo/cliamp/releases/download/v"
             version "/cliamp-linux-amd64"))
       (sha256
        (base32 "0x6jcd7fmg7xyk3jiym0c5hingwpcckr9pam8g5mifkl9hf5ky7w"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib") alsa-lib))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (alsa     (assoc-ref %build-inputs "alsa-lib"))
                 (rpath    (string-append libc-lib "/lib:"
                                          gcc-lib "/lib:"
                                          alsa "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/cliamp"))
            (chmod (string-append bin-dir "/cliamp") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/cliamp"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/cliamp"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bjarneo/cliamp")
    (synopsis "retro terminal music player inspired by Winamp 2.x")
    (description
     "Cliamp is a retro terminal music player inspired by Winamp 2.x.  It
plays audio files from the command line with a nostalgic Winamp-style
text interface.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 6. dafny-bin (#3101) — Dafny verification language binary
;; ═══════════════════════════════════════════════════════════════════

(define-public dafny-bin
  (package
    (name "dafny-bin")
    (version "4.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dafny-lang/dafny/releases/download/v"
             version "/dafny-" version "-x64-ubuntu-22.04.zip"))
       (sha256
        (base32 "0ybi4vl1kzjlhrgv1486p3kczx0kvyaqxislb2azf86prpvrysm4"))))
    (build-system trivial-build-system)
    (native-inputs (list unzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils)
                       (ice-9 ftw))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (unzip    (search-input-file %build-inputs "/bin/unzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:"
                                          gcc-lib "/lib"))
                 (lib-dir  (string-append out "/lib/dafny"))
                 (bin-dir  (string-append out "/bin"))
                 (bash     (search-input-file %build-inputs "/bin/bash")))
            (invoke unzip "-q" src "-d" "dafny-extracted")
            (let ((srcdir "dafny-extracted/dafny"))
              (mkdir-p lib-dir)
              (mkdir-p bin-dir)
              (copy-recursively srcdir lib-dir)
              ;; Patch the main dafny binary
              (let ((dafny-exe (string-append lib-dir "/dafny")))
                (when (file-exists? dafny-exe)
                  (chmod dafny-exe #o755)
                  (invoke patchelf "--set-interpreter" ld-so dafny-exe)
                  (invoke patchelf "--set-rpath" rpath dafny-exe)))
              ;; Wrapper script
              (call-with-output-file (string-append bin-dir "/dafny")
                (lambda (port)
                  (format port "#!~a\nexec ~a/dafny \"$@\"\n"
                          bash lib-dir)))
              (chmod (string-append bin-dir "/dafny") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dafny.org")
    (synopsis "verification-aware programming language")
    (description
     "Dafny is a verification-aware programming language that includes
built-in specification constructs.  The Dafny compiler can target
C#, Java, JavaScript, Go, and Python.  Its verifier proves that the
code meets its specification at compile time.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 7. wireview-linux (#3074) — WireView Pro II desktop app binary
;; ═══════════════════════════════════════════════════════════════════

(define-public wireview-linux
  (package
    (name "wireview-linux")
    (version "1.0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/emaspa/wireview-linux/releases/download/v"
             version "/wireview-linux-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "1yaaildslp1a0w186hf6dqzvlkzzhqcrf966acccax45cbic73l9"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/wireview-linux/"
                #:exclude ("wireview-linux")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-binary
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (lib (string-append out "/lib/wireview-linux"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (install-file "wireview-linux" lib)
                     (chmod (string-append lib "/wireview-linux") #o755)
                     (symlink (string-append lib "/wireview-linux")
                              (string-append bin "/wireview-linux"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/emaspa/wireview-linux")
    (synopsis "Linux desktop app for Thermal Grizzly WireView Pro II")
    (description
     "Wireview-linux is an unofficial Linux port of the Thermal Grizzly
WireView Pro II desktop application.  It reads power measurement data
from the WireView Pro II device connected via USB and displays real-time
power draw, voltage, and current for PCIe and EPS connectors.")
    (license license:gpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; 8. qpdf-zopfli (#3041) — QPDF with Zopfli compression
;; ═══════════════════════════════════════════════════════════════════

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
     (list gnutls
           libjpeg-turbo
           openssl
           zlib
           zopfli))
    (home-page "https://github.com/qpdf/qpdf")
    (synopsis "PDF transformation tool with Zopfli compression")
    (description
     "QPDF is a command-line program that does structural, content-preserving
transformations on PDF files.  This variant is built with Zopfli support for
improved zlib-compatible compression of PDF streams.")
    (license license:asl2.0)))

;; ═══════════════════════════════════════════════════════════════════
;; 9. qxmledit (#3098) — Qt XML editor
;; ═══════════════════════════════════════════════════════════════════

(define-public qxmledit
  (package
    (name "qxmledit")
    (version "0.9.18")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lbellonda/qxmledit/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "17yjvbqzx0fmgmp1h9606p19496xcyp1kd1qa1630f8jny3c4rk9"))))
    (build-system qt-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (inputs
     (list qtbase-5 qtsvg-5 qtxmlpatterns-5))
    (home-page "https://qxmledit.org/")
    (synopsis "simple XML editor and XSD viewer")
    (description
     "QXmlEdit is a simple XML editor based on Qt libraries.  Its main
features include easy display of XML data, XSD structure visualization,
split and compare of large XML files, and search functionality.  It
provides a user-friendly graphical interface for editing XML documents.")
    (license license:lgpl2.0+)))

;; ═══════════════════════════════════════════════════════════════════
;; 10. ipmctl-git (#3081) — Intel Optane persistent memory management
;; ═══════════════════════════════════════════════════════════════════

(define-public ipmctl-git
  (package
    (name "ipmctl-git")
    (version "03.00.00.0538")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/intel/ipmctl/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "14sm9cvv5di29qw682s9zl3j09aaxp83q91rwgdpyh9m6vlsd4q4"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DRELEASE=ON")))
    (inputs (list ndctl))
    (home-page "https://github.com/intel/ipmctl")
    (synopsis "utility for managing Intel Optane persistent memory")
    (description
     "Ipmctl is a command-line utility for configuring and managing Intel
Optane DC persistent memory modules (DCPMM).  It provides provisioning,
firmware updates, health monitoring, and diagnostic capabilities for
Intel Optane persistent memory hardware.")
    (license license:bsd-3)))

;; ═══════════════════════════════════════════════════════════════════
;; 11. mas (#3025) — Macro Assembler AS
;; ═══════════════════════════════════════════════════════════════════

(define-public mas
  (package
    (name "mas")
    (version "current")
    (source
     (origin
       (method url-fetch)
       (uri "http://john.ccac.rwth-aachen.de:8000/ftp/as/source/c_version/asl-current.tar.gz")
       (sha256
        (base32 "00bdvrpa7wf16xrpgpg3bygrqyswxkwaq470fbmpzh52fb6jvsms"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "BINDIR=" #$output "/bin")
              (string-append "INCDIR=" #$output "/include/asl")
              (string-append "MANDIR=" #$output "/share/man")
              (string-append "LIBDIR=" #$output "/lib")
              (string-append "DOCDIR=" #$output "/share/doc/asl"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (add-before 'build 'copy-makefile
            (lambda _
              (copy-file "Makefile.def-samples/Makefile.def-x86_64-unknown-linux"
                         "Makefile.def"))))))
    (home-page "http://john.ccac.rwth-aachen.de:8000/as/")
    (synopsis "macro cross-assembler for many processors")
    (description
     "AS is a portable macro cross-assembler for a wide range of processors
and microcontrollers.  It supports CPUs from the 68000 family, 8051, AVR,
PIC, Z80, ARM, MIPS, PowerPC, and many others.  The assembler provides
macros, conditional assembly, local labels, and various output formats.")
    (license license:gpl2+)))

;; ═══════════════════════════════════════════════════════════════════
;; 12. tilem-gtk3-git (#3063) — TI calculator emulator (GTK3 fork)
;; ═══════════════════════════════════════════════════════════════════

(define-public tilem-gtk3-git
  (let ((commit "64b9a38a4460abf52bf09ab28dffdc3784f002a3")
        (revision "0"))
    (package
      (name "tilem-gtk3-git")
      (version (git-version "2.0" revision commit))
      (source
       (origin
         (method url-fetch)
         (uri (string-append
               "https://github.com/kuba160/tilem-gtk3/archive/"
               commit ".tar.gz"))
         (sha256
          (base32 "1fgwd7i1y0v6n7xyiqmc298wkz90v93nprrjg0x1a29zi5cfaczv"))))
      (build-system gnu-build-system)
      (arguments
       (list
        #:tests? #f
        #:phases
        #~(modify-phases %standard-phases
            (replace 'bootstrap
              (lambda _
                (invoke "autoreconf" "-vif"))))))
      (native-inputs
       (list autoconf automake libtool pkg-config))
      (inputs
       (list gtk+ glib))
      (home-page "https://github.com/kuba160/tilem-gtk3")
      (synopsis "TI calculator emulator with GTK3 interface")
      (description
       "TilEm is a TI calculator emulator for Linux.  This is a GTK3 port
of the original TilEm, supporting TI-73, TI-76.fr, TI-81, TI-82, TI-83,
TI-83+, TI-83+ SE, TI-84+, TI-84+ SE, TI-85, and TI-86 calculators.
It provides accurate emulation of the calculator hardware.")
      (license license:gpl3+))))

;; ═══════════════════════════════════════════════════════════════════
;; 13. fish-session (#3084) — fish shell session manager plugin
;; ═══════════════════════════════════════════════════════════════════

(define-public fish-session
  (package
    (name "fish-session")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AtefR/fish-session/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0hifyw76pjivc5zkbsmav8m1ww0452ybkxcy6chrm9568j45cphj"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("functions/" "share/fish/vendor_functions.d/")
               ("conf.d/" "share/fish/vendor_conf.d/"))))
    (home-page "https://github.com/AtefR/fish-session")
    (synopsis "session manager plugin for the Fish shell")
    (description
     "Fish-session is a session management plugin for the Fish shell.  It
saves and restores shell session state including working directory,
command history context, and environment variables across terminal
sessions.")
    (license license:expat)))
