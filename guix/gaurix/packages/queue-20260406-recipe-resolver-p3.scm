;;; NEEDS_RECIPE_DESIGN resolver pass 3 — 2026-04-06.
;;; Targets 30 BLOCKED NEEDS_RECIPE_DESIGN packages.
(define-module (gaurix packages queue-20260406-recipe-resolver-p3)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages tls)
  #:export (ddccontrol-db
            quirc
            shine
            jbig2enc
            sngrep
            liboqs
            powder-toy
            xavs2
            codexbar
            claudebar
            logibar
            pixora-icons
            lazytail-bin
            funzzy-bin
            workz-bin
            omp-manager-bin
            tmux-plugin-panel-bin
            console2svg-bin
            pandoc-crossref-bin
            weylus-bin
            efibooteditor
            qxmledit))


;;;
;;; ───── SOURCE PACKAGES ─────────────────────────────────────────
;;;

;;; 1. ddccontrol-db — DDC/CI monitor profile database
(define-public ddccontrol-db
  (package
    (name "ddccontrol-db")
    (version "20260120")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ddccontrol/ddccontrol-db/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07jqg00l7kihd3hf2wppj8c9qfi1zixgsbwpw9qmhi4dxi3mxyqi"))))
    (build-system gnu-build-system)
    (native-inputs (list autoconf automake intltool))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'bootstrap
            (lambda _
              (invoke "autoreconf" "-fi"))))))
    (home-page "https://github.com/ddccontrol/ddccontrol-db")
    (synopsis "monitor database for ddccontrol")
    (description
     "DDCcontrol-DB is the monitor database used by DDCcontrol.  It
contains definitions for monitor controls and profiles that allow
DDCcontrol to manage monitor settings via the DDC/CI protocol.")
    (license license:gpl2+)))

;;; 2. quirc — QR code recognition library
(define-public quirc
  (package
    (name "quirc")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dlbeer/quirc/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ib4xc6pr5vsgxfdvgbh0pnagnsp9xkwf60jp27w6zik7nijxhbk"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                       ;no test suite
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "CC=" #$(cc-for-target))
              "CFLAGS=-fPIC -O2 -Wall")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))        ;no configure script
    (home-page "https://github.com/dlbeer/quirc")
    (synopsis "small QR code decoding library")
    (description
     "Quirc is a small C library for extracting and decoding QR codes
from images.  It is fast enough to be used with realtime video and
has no external dependencies.")
    (license license:isc)))

;;; 3. shine — fixed-point MP3 encoder
(define-public shine
  (package
    (name "shine")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/toots/shine/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17n421vay42hrwzq5bz7njlxmx1n9qcmsi1nl8b6d3kggn38fnsn"))))
    (build-system gnu-build-system)
    (native-inputs (list autoconf automake libtool))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'bootstrap
            (lambda _
              (invoke "autoreconf" "-fi"))))))
    (home-page "https://github.com/toots/shine")
    (synopsis "fixed-point MP3 encoding library")
    (description
     "Shine is a blazing fast MP3 encoding library implemented in
fixed-point arithmetic.  It can encode audio on platforms without a
floating-point unit, making it suitable for embedded systems and
portable devices.")
    (license license:lgpl2.0)))

;;; 4. jbig2enc — JBIG2 encoder
(define-public jbig2enc
  (package
    (name "jbig2enc")
    (version "0.30")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/agl/jbig2enc/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yy65hxyl87bc2z3wh1vvi7ajw9h2bics4cbsg22rp3fcqpl8s24"))))
    (build-system cmake-build-system)
    (inputs (list leptonica))
    (arguments
     (list #:tests? #f))               ;no test suite
    (home-page "https://github.com/agl/jbig2enc")
    (synopsis "JBIG2 encoder for bi-level image compression")
    (description
     "Jbig2enc is an encoder for the JBIG2 bi-level image compression
standard (ISO/IEC 14492).  It uses the Leptonica image processing
library and can produce both stand-alone JBIG2 files and PDF-ready
data streams, offering high compression ratios for scanned text
documents.")
    (license license:asl2.0)))

;;; 5. sngrep — SIP message flow viewer
(define-public sngrep
  (package
    (name "sngrep")
    (version "1.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/irontec/sngrep/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1f117cly14x2pkm386kwpiydyvvmbyafjrx72mhqm5q8rps28hkr"))))
    (build-system cmake-build-system)
    (native-inputs (list pkg-config))
    (inputs (list ncurses libpcap gnutls pcre2 zlib))
    (arguments
     (list #:tests? #f))               ;requires network access
    (home-page "https://github.com/irontec/sngrep")
    (synopsis "ncurses SIP messages flow viewer")
    (description
     "Sngrep is a tool for displaying SIP call message flows from
terminal.  It supports live capture from network interfaces and
reading from PCAP files.  It can filter and search SIP messages
and display them in a call-flow diagram.")
    (license license:gpl3+)))

;;; 6. liboqs — quantum-safe cryptography library
(define-public liboqs
  (package
    (name "liboqs")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/open-quantum-safe/liboqs/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0p2bd0b356smj3dzpp7c9jl48kc9hkb6y3h4davpzws72b6zg0rr"))))
    (build-system cmake-build-system)
    (native-inputs (list pkg-config))
    (inputs (list openssl))
    (arguments
     (list
      #:configure-flags
      #~(list "-DBUILD_SHARED_LIBS=ON"
              "-DOQS_BUILD_ONLY_LIB=ON")
      #:tests? #f))                    ;tests require network + long runtime
    (home-page "https://openquantumsafe.org/")
    (synopsis "C library for quantum-resistant cryptographic algorithms")
    (description
     "Liboqs is an open-source C library for quantum-safe cryptographic
algorithms.  It provides implementations of post-quantum key
encapsulation mechanisms and digital signature schemes, including
algorithms selected by the NIST Post-Quantum Cryptography
standardization process.")
    (license license:expat)))

;;; 7. powder-toy — falling-sand physics simulation game
(define-public powder-toy
  (package
    (name "powder-toy")
    (version "99.5.394")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/The-Powder-Toy/The-Powder-Toy/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nlcgff88q2mr16alkxp7yz0mf683l9iyaa5707w5mcliqdimavi"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list sdl2 curl fftw zlib bzip2 luajit jsoncpp libpng))
    (arguments
     (list
      #:configure-flags
      #~(list "-Dstatic=none"
              "-Dignore_updates=true"
              "-Dhttp=false")
      #:tests? #f))                    ;no test suite
    (home-page "https://powdertoy.co.uk/")
    (synopsis "falling-sand physics simulation game")
    (description
     "The Powder Toy is a free physics sandbox game.  It simulates air
pressure, velocity, heat, gravity, and countless interactions between
different elements.  Players can create and share complex machines,
electronic circuits, and other constructions.")
    (license license:gpl3+)))

;;; 8. xavs2 — AVS2/IEEE1857.4 video encoder
(define-public xavs2
  (package
    (name "xavs2")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pkuvcl/xavs2/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kn6aanhphkvlhr2903x6lwvphraki7x4gqa1aaaicjcsqf76v8y"))))
    (build-system gnu-build-system)
    (native-inputs (list nasm))
    (arguments
     (list
      #:tests? #f                       ;no test suite
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'chdir-to-build
            (lambda _
              (chdir "build/linux")))
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (invoke "./configure"
                      (string-append "--prefix=" (assoc-ref outputs "out"))
                      "--enable-shared"
                      "--disable-static"
                      "--enable-pic"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pkuvcl/xavs2")
    (synopsis "AVS2-P2/IEEE1857.4 video encoder")
    (description
     "Xavs2 is an open-source encoder for the AVS2-P2/IEEE1857.4 video
coding standard.  It provides high-quality video compression with
optimized x86 assembly routines for performance-critical loops.")
    (license license:gpl2+)))


;;;
;;; ───── SCRIPT / DATA PACKAGES ──────────────────────────────────
;;;

;;; 9. codexbar — Waybar widget for Codex usage
(define-public codexbar
  (package
    (name "codexbar")
    (version "0.1.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mryll/codexbar/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09bb4nmvlafw84y15h60dvps70gd62vmizg6m64fmymghn2anicc"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("codexbar" "bin/codexbar"))))
    (inputs (list bash curl))
    (home-page "https://github.com/mryll/codexbar")
    (synopsis "waybar widget showing Codex subscription usage")
    (description
     "Codexbar is a Waybar custom module that displays OpenAI Codex
subscription usage with colored progress bars.  It queries the
API and renders remaining quota information directly in the
status bar.")
    (license license:expat)))

;;; 10. claudebar — Waybar widget for Claude usage
(define-public claudebar
  (package
    (name "claudebar")
    (version "0.1.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mryll/claudebar/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yw1yylgwsfb3i60gfjyrfqgbzpgyg9x2q6x0kinmagb9s5ssrq0"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("claudebar" "bin/claudebar"))))
    (inputs (list bash curl))
    (home-page "https://github.com/mryll/claudebar")
    (synopsis "waybar widget showing Claude subscription usage")
    (description
     "Claudebar is a Waybar custom module that displays Anthropic Claude
subscription usage with colored progress bars.  It queries the API
and renders remaining quota information directly in the status bar.")
    (license license:expat)))

;;; 11. logibar — Waybar widget for Logitech battery levels
(define-public logibar
  (package
    (name "logibar")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mryll/logibar/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18jbfnzaykwv9m03ppkb05nid3972vdrdmvx2fx666l6d7la0lz7"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("logibar" "bin/logibar")
          ("logibard" "bin/logibard"))))
    (inputs (list bash python python-hidapi))
    (home-page "https://github.com/mryll/logibar")
    (synopsis "waybar widgets for Logitech wireless battery monitoring")
    (description
     "Logibar provides Waybar widgets and daemons for monitoring
Logitech wireless peripheral battery levels via the HID++
protocol.  It reads battery status from HID devices and displays
the information in the Wayland status bar.")
    (license license:expat)))

;;; 12. pixora-icons — 16-bit pixel art icon theme
(define-public pixora-icons
  (let ((commit "a1215de097093f5024ba63dab1cd5577a8ab04fa")
        (revision "0"))
    (package
      (name "pixora-icons")
      (version (string-append "1.0.0-" revision "." (string-take commit 7)))
      (source
       (origin
         (method url-fetch)
         (uri (string-append
               "https://github.com/tsora1603/pixora-icons/archive/"
               commit ".tar.gz"))
         (file-name (string-append name "-" version ".tar.gz"))
         (sha256
          (base32 "06pxrc0vspiwm1fd0hk6lc6xa9yc49xwzxbpp7rsgikn6qhp6zjf"))))
      (build-system copy-build-system)
      (arguments
       (list
        #:install-plan
        #~'(("pixora" "share/icons/pixora")
            ("pixelitos-dark" "share/icons/pixelitos-dark")
            ("pixelitos-light" "share/icons/pixelitos-light"))))
      (home-page "https://github.com/tsora1603/pixora-icons")
      (synopsis "16-bit pixel art icon theme for Linux desktops")
      (description
       "Pixora Icons is a 16-bit pixel art style icon theme for Linux
desktops.  It includes three variants: pixora (default),
pixelitos-dark, and pixelitos-light, providing a retro aesthetic
for application launchers and file managers.")
      (license license:cc-by4.0))))


;;;
;;; ───── PREBUILT BINARY PACKAGES ────────────────────────────────
;;;

;;; 13. lazytail-bin — terminal-based log viewer
(define-public lazytail-bin
  (package
    (name "lazytail-bin")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/raaymax/lazytail/releases/download/v"
             version "/lazytail-linux-x86_64.tar.gz"))
       (sha256
        (base32 "1fycd87x4idp7va9j7fxldkmqm1c20v3qxymk3j4x85061006lmn"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf tar gzip))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (gzip     (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1")))
                            ":"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH" (string-append (dirname tar) ":"
                                          (dirname gzip)))
            (invoke tar "xzf" src)
            (copy-file "lazytail" (string-append bin-dir "/lazytail"))
            (chmod (string-append bin-dir "/lazytail") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/lazytail"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/lazytail"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/raaymax/lazytail")
    (synopsis "fast terminal-based log viewer with live filtering")
    (description
     "Lazytail is a fast, universal terminal-based log viewer with live
filtering and follow mode.  It provides real-time log file
monitoring with regex-based filtering and a keyboard-driven TUI.")
    (license license:expat)))

;;; 14. funzzy-bin — file watcher that runs commands on changes
(define-public funzzy-bin
  (package
    (name "funzzy-bin")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/cristianoliveira/funzzy/releases/download/v"
             version "/funzzy-v" version
             "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "1fd6f3j40f33wk4d7wymaia08gi7hax59dif4zda7h5qchpf9z3g"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf tar gzip))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (gzip     (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1")))
                            ":"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH" (string-append (dirname tar) ":"
                                          (dirname gzip)))
            (invoke tar "xzf" src)
            (for-each
             (lambda (name)
               (let ((src-path (string-append "pkg/" name))
                     (dst-path (string-append bin-dir "/" name)))
                 (when (file-exists? src-path)
                   (copy-file src-path dst-path)
                   (chmod dst-path #o755)
                   (invoke patchelf "--set-interpreter" ld-so dst-path)
                   (invoke patchelf "--set-rpath" rpath dst-path))))
             '("funzzy" "fzz"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cristianoliveira/funzzy")
    (synopsis "lightweight file watcher that runs commands on changes")
    (description
     "Funzzy is a lightweight, configurable file watcher that executes
commands when files change.  It uses YAML configuration files to
define watch rules and supports glob patterns for file matching.")
    (license license:expat)))

;;; 15. workz-bin — git worktree manager
(define-public workz-bin
  (package
    (name "workz-bin")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rohansx/workz/releases/download/v"
             version "/workz-v" version
             "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "092lmgl9i208kd57xnjk1rlk4qnkard6kmkp8sj2212a9rv427mz"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf tar gzip))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (gzip     (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1")))
                            ":"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH" (string-append (dirname tar) ":"
                                          (dirname gzip)))
            (invoke tar "xzf" src)
            (copy-file "workz" (string-append bin-dir "/workz"))
            (chmod (string-append bin-dir "/workz") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/workz"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/workz"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rohansx/workz")
    (synopsis "git worktree manager with fuzzy switching")
    (description
     "Workz is a Git worktree manager with zero-config dependency sync,
fuzzy switching, and fleet mode for parallel development agents.
It simplifies working with multiple Git worktrees simultaneously.")
    (license (list license:expat license:asl2.0))))

;;; 16. omp-manager-bin — Oh My Posh manager TUI
(define-public omp-manager-bin
  (package
    (name "omp-manager-bin")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/psmux/omp-manager/releases/download/v"
             version "/omp-manager-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0y0fy7q5xy7444ps6bqyyw2zp9ws27gbm9qdy01iazx0rs5q2ayz"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf tar gzip))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (gzip     (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1")))
                            ":"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH" (string-append (dirname tar) ":"
                                          (dirname gzip)))
            (invoke tar "xzf" src)
            (copy-file "omp-manager" (string-append bin-dir "/omp-manager"))
            (chmod (string-append bin-dir "/omp-manager") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/omp-manager"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/omp-manager"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/psmux/omp-manager")
    (synopsis "TUI manager for Oh My Posh terminal themes")
    (description
     "Omp-manager is a terminal user interface for installing and
managing Oh My Posh prompt themes.  It provides a browsable list
of themes with preview and one-key installation.")
    (license license:expat)))

;;; 17. tmux-plugin-panel-bin — tmux plugin manager TUI
(define-public tmux-plugin-panel-bin
  (package
    (name "tmux-plugin-panel-bin")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/psmux/Tmux-Plugin-Panel/releases/download/v"
             version "/tmuxpanel-v" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "1ss6gy3598jv2ljz2vxzlw0dj78m99572apwjy1226wrjvffnh60"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf tar gzip))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (gzip     (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1")))
                            ":"))
                 (bin-dir  (string-append out "/bin"))
                 (subdir   (string-append "tmuxpanel-v" #$version
                                          "-linux-x64")))
            (mkdir-p bin-dir)
            (setenv "PATH" (string-append (dirname tar) ":"
                                          (dirname gzip)))
            (invoke tar "xzf" src)
            (for-each
             (lambda (name)
               (let ((src-path (string-append subdir "/" name))
                     (dst-path (string-append bin-dir "/" name)))
                 (when (file-exists? src-path)
                   (copy-file src-path dst-path)
                   (chmod dst-path #o755)
                   (invoke patchelf "--set-interpreter" ld-so dst-path)
                   (invoke patchelf "--set-rpath" rpath dst-path))))
             '("tmuxplugins" "tmuxthemes"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/psmux/Tmux-Plugin-Panel")
    (synopsis "TUI plugin manager for tmux")
    (description
     "Tmux Plugin Panel is a full-fledged TUI plugin manager for tmux,
serving as a modern alternative to TPM (Tmux Plugin Manager).  It
provides an interactive interface for browsing, installing, and
managing tmux plugins and themes.")
    (license license:expat)))

;;; 18. console2svg-bin — convert terminal output to SVG
(define-public console2svg-bin
  (package
    (name "console2svg-bin")
    (version "0.6.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/arika0093/console2svg/releases/download/v"
             version "/console2svg-linux-x64"))
       (file-name (string-append "console2svg-" version))
       (sha256
        (base32 "17yi3cccyxlsxxmbqb254v36lbk0d7cv59mnsclcs72jkq65yk26"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
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
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1")))
                            ":"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/console2svg"))
            (chmod (string-append bin-dir "/console2svg") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/console2svg"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/console2svg"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/arika0093/console2svg")
    (synopsis "convert terminal output to SVG images")
    (description
     "Console2svg converts terminal output into SVG images.  It captures
ANSI escape sequences and renders the terminal content as a
scalable vector graphic, suitable for documentation and sharing.")
    (license license:asl2.0)))

;;; 19. pandoc-crossref-bin — pandoc filter for cross-references
(define-public pandoc-crossref-bin
  (package
    (name "pandoc-crossref-bin")
    (version "0.3.23a")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lierdakil/pandoc-crossref/releases/download/v"
             version "/pandoc-crossref-Linux-X64.tar.xz"))
       (sha256
        (base32 "116yr5nnm7ffn2ii8alzsx0aan29cyv0blwzwbq9fyjlf7if8xzs"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf tar xz))
    (inputs (list glibc `(,gcc "lib") gmp zlib))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (xz       (search-input-file %build-inputs "/bin/xz"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1"))
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgmp.so"))
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libz.so")))
                            ":"))
                 (bin-dir  (string-append out "/bin"))
                 (man1     (string-append out "/share/man/man1")))
            (mkdir-p bin-dir)
            (mkdir-p man1)
            (setenv "PATH" (string-append (dirname tar) ":"
                                          (dirname xz)))
            (invoke tar "xJf" src)
            (copy-file "pandoc-crossref"
                       (string-append bin-dir "/pandoc-crossref"))
            (chmod (string-append bin-dir "/pandoc-crossref") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/pandoc-crossref"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/pandoc-crossref"))
            (when (file-exists? "pandoc-crossref.1")
              (copy-file "pandoc-crossref.1"
                         (string-append man1 "/pandoc-crossref.1")))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lierdakil/pandoc-crossref")
    (synopsis "pandoc filter for numbered figures, tables, and cross-references")
    (description
     "Pandoc-crossref is a Pandoc filter for numbering figures,
equations, tables, and cross-references to them.  It integrates
with Pandoc's Markdown processing to produce documents with
automatic numbering and hyperlinked cross-references.")
    (license license:gpl2+)))

;;; 20. weylus-bin — use tablet as drawing input
(define-public weylus-bin
  (package
    (name "weylus-bin")
    (version "0.11.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/H-M-H/Weylus/releases/download/v"
             version "/linux.zip"))
       (file-name (string-append "weylus-" version ".zip"))
       (sha256
        (base32 "1wlri95vly460bphh0hp26s6rbpbqq9wacaqxwg4bam86w6n82lg"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf unzip))
    (inputs (list glibc `(,gcc "lib")))
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
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1")))
                            ":"))
                 (bin-dir  (string-append out "/bin"))
                 (app-dir  (string-append out "/share/applications")))
            (mkdir-p bin-dir)
            (mkdir-p app-dir)
            (invoke unzip src)
            (copy-file "weylus" (string-append bin-dir "/weylus"))
            (chmod (string-append bin-dir "/weylus") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/weylus"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/weylus"))
            (when (file-exists? "weylus.desktop")
              (copy-file "weylus.desktop"
                         (string-append app-dir "/weylus.desktop")))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/H-M-H/Weylus")
    (synopsis "use your tablet as a graphic tablet or touch screen")
    (description
     "Weylus turns a tablet or smartphone into a graphic tablet or touch
screen for your computer.  It supports pressure-sensitive input and
works over the network with a web-based interface.")
    (license license:agpl3+)))


;;;
;;; ───── COMPLEX SOURCE PACKAGES ─────────────────────────────────
;;;

;;; 21. efibooteditor — GUI editor for EFI boot entries
(define-public efibooteditor
  (package
    (name "efibooteditor")
    (version "1.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Neverous/efibooteditor/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1syjw3pmaih0s03gprfjby5pl9vsxkm89hsn2cnjfbyqbjbm43mi"))))
    (build-system cmake-build-system)
    (native-inputs (list pkg-config))
    (inputs (list qtbase efivar zlib))
    (arguments
     (list
      #:tests? #f                       ;no test suite
      #:configure-flags
      #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (home-page "https://github.com/Neverous/efibooteditor")
    (synopsis "GUI editor for UEFI boot manager entries")
    (description
     "EFIBootEditor is a graphical application for managing UEFI boot
entries.  It provides a user-friendly interface for viewing, editing,
creating, and reordering EFI boot manager entries without needing
command-line tools like efibootmgr.")
    (license license:lgpl3+)))

;;; 22. qxmledit — Qt-based XML editor
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
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17yjvbqzx0fmgmp1h9606p19496xcyp1kd1qa1630f8jny3c4rk9"))))
    (build-system cmake-build-system)
    (native-inputs (list pkg-config))
    (inputs (list qtbase))
    (arguments
     (list
      #:tests? #f                       ;no test suite
      #:configure-flags
      #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (home-page "https://qxmledit.org/")
    (synopsis "simple Qt-based XML editor with tree view")
    (description
     "QXmlEdit is a simple XML editor with a tree-based graphical
interface.  It provides XSD schema viewing, XSL transformation
support, and a visual approach to editing XML documents without
hand-editing markup.")
    (license license:lgpl2.0+)))
