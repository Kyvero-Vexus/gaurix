;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260407d
;;; Resolves 15 NEEDS_RECIPE_DESIGN packages with new recipes.
;;; Source builds (cmake/meson/make/autotools/trivial) and binary packages.

(define-module (gaurix packages recipe-resolver-260407d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (ctags-arduino
            aribb24
            pxz
            cpp-utilities
            culmus
            font-redhat
            betterspades
            textern
            tridactyl-native-messenger-bin
            ttf-lxgw-neo-xihei
            ttf-lxgw-neo-xihei-screen
            pwmenu-bin-260407d
            bzmenu-bin-260407d
            iwmenu-bin-260407d
            ghostty-terminfo-260407d))

;;;
;;; ── SOURCE BUILD PACKAGES ──────────────────────────────────────────
;;;

;;; 1. ctags-arduino — Arduino-specific ctags fork
;;;    Simple C/Make build from GitHub.  No external dependencies.
(define-public ctags-arduino
  (package
    (name "ctags-arduino")
    (version "5.8-arduino11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/arduino/ctags/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kbrm4d7dsf7w3wqvgxihpc9n5rkxxn9ngd7672rpjxfc8y89jl6"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags #~(list (string-append "prefix=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://github.com/arduino/ctags")
    (synopsis "exuberant Ctags fork with Arduino C++ parsing support")
    (description
     "This is a fork of Exuberant Ctags with patches for better C++
parsing, used by the Arduino IDE to extract symbol information from
Arduino sketches and libraries.")
    (license license:gpl2)))

;;; 2. aribb24 — ARIB STD-B24 caption decoder library
;;;    Autotools build, LGPL-3, optional libpng.
(define-public aribb24
  (package
    (name "aribb24")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nkoriyama/aribb24/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0a7igxq08xzv515xnmx8vyzcl1lc9miqj0siff8pzr96i5rn05gn"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'bootstrap
            (lambda _
              (invoke "autoreconf" "-fiv"))))))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list libpng))
    (home-page "https://github.com/nkoriyama/aribb24")
    (synopsis "library for decoding ARIB STD-B24 captions")
    (description
     "aribb24 is a library for decoding ARIB STD-B24 character set
encoded captions, used primarily in Japanese digital television
broadcasts.  It can render captions to PNG images.")
    (license license:lgpl3)))

;;; 3. pxz — Parallel XZ compression tool
;;;    Simple Makefile build requiring liblzma and OpenMP.
(define-public pxz
  (let ((commit "824de5dd")
        (revision "0"))
    (package
      (name "pxz")
      (version (string-append "4.999.9beta-" revision "." commit))
      (source
       (origin
         (method url-fetch)
         (uri (string-append
               "https://github.com/jnovy/pxz/archive/" commit ".tar.gz"))
         (file-name (string-append name "-" version ".tar.gz"))
         (sha256
          (base32 "051z51xysarvzw1jy7h3avbjl96fcnz5zb74m6pwhi96k7c573nh"))))
      (build-system gnu-build-system)
      (arguments
       (list
        #:tests? #f
        #:make-flags #~(list (string-append "DESTDIR=" #$output)
                             "BINDIR=/bin"
                             "MANDIR=/share/man")
        #:phases
        #~(modify-phases %standard-phases
            (delete 'configure))))
      (inputs (list xz))
      (home-page "https://github.com/jnovy/pxz")
      (synopsis "parallel XZ compression using liblzma")
      (description
       "pxz is a parallel implementation of the XZ compression format
using liblzma.  It splits input into blocks and compresses them in
parallel using OpenMP, achieving significantly faster compression on
multi-core systems while producing output compatible with the standard
xz format.")
      (license license:gpl2))))

;;; 4. cpp-utilities — C++ utility library by Martchus
;;;    CMake build, no mandatory external dependencies.
(define-public cpp-utilities
  (package
    (name "cpp-utilities")
    (version "5.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Martchus/cpp-utilities/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nx7kxhi4z9vkfp6q7q803dv0fb39mkn586f8hra7fbrdrh2ickw"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Martchus/cpp-utilities")
    (synopsis "common C++ utility classes and functions")
    (description
     "cpp-utilities (c++utilities) is a C++ library providing common
utility classes and functions for argument parsing, conversion, I/O,
time/date handling, and build system integration.  It is a dependency of
several Martchus projects including syncthingtray and Tag Editor.")
    (license license:gpl2)))

;;; 5. betterspades — Ace of Spades voxel FPS game
;;;    CMake build, requires OpenGL and audio libraries.
(define-public betterspades
  (package
    (name "betterspades")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/xtreme8000/BetterSpades/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08xhvsiw0v0m5ia51d9cdm6833swjf4zlqfrdsrzn7x6z7s687kl"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/xtreme8000/BetterSpades")
    (synopsis "voxel first-person shooter inspired by Ace of Spades")
    (description
     "BetterSpades is an open-source client for the Ace of Spades
classic voxel first-person shooter.  It features improved graphics,
smoother controls, and better performance compared to the original
client while maintaining compatibility with existing servers.")
    (license license:gpl3)))

;;; 6. textern — Firefox external editor integration
;;;    Simple make-based native messaging host for Firefox.
(define-public textern
  (package
    (name "textern")
    (version "0.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jlebon/textern/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05zq25nqx1zzwwknp3ssg3bqmlakmhsgm8bg7wr286gbzzlbqn9r"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list python))
    (home-page "https://github.com/jlebon/textern")
    (synopsis "Firefox native messaging host for external text editing")
    (description
     "Textern is a Firefox add-on and native messaging host that allows
editing text areas in an external editor.  The native host component
launches the user's preferred editor and relays edits back to the
browser in real time.")
    (license license:gpl3+)))

;;;
;;; ── FONT PACKAGES ────────────────────────────────────────────────
;;;

;;; 7. culmus — Hebrew typeface collection
(define-public culmus
  (package
    (name "culmus")
    (version "0.140")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.sourceforge.net/project/culmus/culmus/"
             version "/culmus-" version ".tar.gz"))
       (sha256
        (base32 "1qsjzivw48l2n78ifc7gr28wb4q03kkh0l4hfqm7a1qh902d3bkd"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (font-dir (string-append out "/share/fonts/truetype/culmus"))
                 (source (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip")))
            (mkdir-p font-dir)
            (invoke tar "xzf" source)
            (for-each
             (lambda (f)
               (install-file f font-dir))
             (find-files "." "\\.(ttf|otf|afm|pfa)$"))
            #t))))
    (native-inputs (list tar gzip))
    (home-page "https://culmus.sourceforge.io/")
    (synopsis "collection of free Hebrew typefaces")
    (description
     "The Culmus Project provides a collection of free Hebrew typefaces
including serif, sans-serif, monospace, and decorative fonts.  The
collection covers the Unicode Hebrew block and is suitable for both
screen display and print use.")
    (license license:gpl2)))

;;; 8. font-redhat — Red Hat display and text typeface family
(define-public font-redhat
  (package
    (name "font-redhat")
    (version "4.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/RedHatOfficial/RedHatFont/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dg5i12cficr3axji78q33nkba0lfqdqhx3g2y6bzxzh9nwb4866"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (otf-dir (string-append out "/share/fonts/opentype/redhat"))
                 (source (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip")))
            (mkdir-p otf-dir)
            (invoke tar "xzf" source)
            (for-each
             (lambda (f)
               (install-file f otf-dir))
             (find-files "." "\\.otf$"))
            #t))))
    (native-inputs (list tar gzip))
    (home-page "https://github.com/RedHatOfficial/RedHatFont")
    (synopsis "Red Hat's open-source display and text font family")
    (description
     "Red Hat Fonts are the official typeface family created for Red Hat
by Jeremy Mickel of MCKL.  The family includes Red Hat Display (for
headings), Red Hat Text (for body), and Red Hat Mono (for code), all
available in multiple weights with italic variants.")
    (license license:silofl1.1)))

;;; 9. ttf-lxgw-neo-xihei — LXGW Neo XiHei Chinese font
(define-public ttf-lxgw-neo-xihei
  (package
    (name "ttf-lxgw-neo-xihei")
    (version "1.242")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lxgw/LxgwNeoXiHei/releases/download/v"
             version "/LXGWNeoXiHei.ttf"))
       (sha256
        (base32 "1y0b6fhwc217qkldjy90jfnkvb5fjzxvgfkk6lk68ss3d4142901"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((font-dir (string-append (assoc-ref %outputs "out")
                                         "/share/fonts/truetype")))
            (mkdir-p font-dir)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append font-dir "/LXGWNeoXiHei.ttf"))
            #t))))
    (home-page "https://github.com/lxgw/LxgwNeoXiHei")
    (synopsis "Chinese sans-serif font based on IPAex Gothic")
    (description
     "LXGW Neo XiHei is a Chinese sans-serif font derived from IPAex
Gothic, modified for improved CJK character coverage and aesthetics.
It provides comprehensive support for simplified and traditional Chinese
characters.")
    (license license:ipa)))

;;; 10. ttf-lxgw-neo-xihei-screen — LXGW Neo XiHei Plus (screen variant)
(define-public ttf-lxgw-neo-xihei-screen
  (package
    (name "ttf-lxgw-neo-xihei-screen")
    (version "1.242")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lxgw/LxgwNeoXiHei/releases/download/v"
             version "/LXGWNeoXiHeiPlus.ttf"))
       (sha256
        (base32 "0vva5qyz4zkb6rfl75v9b2mz6zp3ylcw21iqrax034lqc082pnmj"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((font-dir (string-append (assoc-ref %outputs "out")
                                         "/share/fonts/truetype")))
            (mkdir-p font-dir)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append font-dir "/LXGWNeoXiHeiPlus.ttf"))
            #t))))
    (home-page "https://github.com/lxgw/LxgwNeoXiHei")
    (synopsis "screen-optimized variant of LXGW Neo XiHei Chinese font")
    (description
     "LXGW Neo XiHei Plus is the screen-optimized variant of LXGW Neo
XiHei, a Chinese sans-serif font derived from IPAex Gothic.  This version
includes additional character coverage for better screen rendering.")
    (license license:ipa)))

;;;
;;; ── BINARY PACKAGES ──────────────────────────────────────────────
;;;

;;; 11. tridactyl-native-messenger-bin — Tridactyl Firefox native messenger
(define-public tridactyl-native-messenger-bin
  (package
    (name "tridactyl-native-messenger-bin")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tridactyl/native_messenger/releases/download/"
             version "/native_main-Linux"))
       (sha256
        (base32 "0spx9j6269jbxwdbgjk2prxpa33dig4zax5q1wgqfywlr183li86"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("native_main" "lib/tridactyl/native_main"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "native_main")
              (chmod "native_main" #o755)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/lib/tridactyl/native_main"))
                    (ld-so (search-input-file
                            inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file
                                    inputs "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file
                                    inputs "lib/libgcc_s.so.1")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin))))
          (add-after 'patch-elf 'install-manifest
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (manifest-dir
                      (string-append out
                       "/lib/mozilla/native-messaging-hosts")))
                (mkdir-p manifest-dir)
                (call-with-output-file
                    (string-append manifest-dir "/tridactyl.json")
                  (lambda (port)
                    (format port "{
  \"name\": \"tridactyl\",
  \"description\": \"Tridactyl native messaging host\",
  \"path\": \"~a/lib/tridactyl/native_main\",
  \"type\": \"stdio\",
  \"allowed_extensions\": [\"tridactyl.vim@cmcaine.co.uk\",
    \"tridactyl.vim.betas@cmcaine.co.uk\",
    \"tridactyl.vim.betas.nonewtab@cmcaine.co.uk\"]
}
" out)))))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tridactyl/native_messenger")
    (synopsis "native messaging host for the Tridactyl Firefox extension")
    (description
     "Tridactyl Native Messenger is the native messaging host component
for the Tridactyl Firefox extension.  It enables advanced features like
opening the current page in Vim, running shell commands, and editing text
areas in an external editor.")
    (license license:bsd-2)))

;;;
;;; ── REVALIDATED PACKAGES (existing recipes, re-blocked in deptree pass) ────
;;; These re-export improved versions of packages whose recipes already
;;; exist in the channel but whose status was re-set to BLOCKED during
;;; the deptree-resolver-260407 dependency sweep.
;;;

;;; 12. pwmenu-bin — PipeWire audio manager (launcher-driven)
;;;     Revalidated: recipe exists in queue-20260325p100e.scm with correct hash.
(define-public pwmenu-bin-260407d
  (package
    (name "pwmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/pwmenu/releases/download/v" version
             "/pwmenu-x86_64-linux-gnu"))
       (sha256
        (base32 "0gj12lpwx6zw3p6gcda1gq7cr5frsvzzq1plra2sm511m0lg3rbj"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("pwmenu" "bin/pwmenu"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "pwmenu")
              (chmod "pwmenu" #o755)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/pwmenu"))
                    (ld-so (search-input-file
                            inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file
                                    inputs "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file
                                    inputs "lib/libgcc_s.so.1")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/pwmenu")
    (synopsis "launcher-driven PipeWire audio manager for Linux")
    (description
     "pwmenu is a launcher-driven audio manager for PipeWire on Linux.
It provides an interface through external launchers like fuzzel, rofi,
or dmenu for managing audio devices, volumes, and profiles.")
    (license license:gpl3+)))

;;; 13. bzmenu-bin — Bluetooth menu (launcher-driven)
;;;     Revalidated: recipe exists in queue-20260325p100e.scm with correct hash.
(define-public bzmenu-bin-260407d
  (package
    (name "bzmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/bzmenu/releases/download/v" version
             "/bzmenu-x86_64-linux-gnu"))
       (sha256
        (base32 "0ggnand2ih6s1si6amp0mnl9r6d4gjj65vx03kysmzdvggxy71a2"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("bzmenu" "bin/bzmenu"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "bzmenu")
              (chmod "bzmenu" #o755)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/bzmenu"))
                    (ld-so (search-input-file
                            inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file
                                    inputs "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file
                                    inputs "lib/libgcc_s.so.1")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/bzmenu")
    (synopsis "launcher-driven Bluetooth manager for Linux")
    (description
     "bzmenu is a launcher-driven Bluetooth manager that interfaces
with BlueZ through D-Bus.  It provides an interface through external
launchers like fuzzel, rofi, or dmenu for scanning, pairing, connecting,
and managing Bluetooth devices.")
    (license license:gpl3+)))

;;; 14. iwmenu-bin — WiFi menu (launcher-driven)
;;;     Revalidated: recipe exists in queue-20260325p100e.scm with correct hash.
(define-public iwmenu-bin-260407d
  (package
    (name "iwmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/iwmenu/releases/download/v" version
             "/iwmenu-x86_64-linux-gnu"))
       (sha256
        (base32 "1pwkv6a8h5kx82dn7wpd9n701i510v2zwjzykd66r9rpm9pkc2rf"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("iwmenu" "bin/iwmenu"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "iwmenu")
              (chmod "iwmenu" #o755)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/iwmenu"))
                    (ld-so (search-input-file
                            inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file
                                    inputs "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file
                                    inputs "lib/libgcc_s.so.1")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/iwmenu")
    (synopsis "launcher-driven WiFi manager using iwd")
    (description
     "iwmenu is a launcher-driven WiFi manager that interfaces with
iwd (iNet wireless daemon) through D-Bus.  It provides a menu-driven
interface through external launchers like fuzzel, rofi, or dmenu for
scanning and connecting to wireless networks.")
    (license license:gpl3+)))

;;; 15. ghostty-terminfo — Ghostty terminal terminfo entry
;;;     Revalidated: recipe exists in queue-20260407-deptree-resolver.scm.
(define-public ghostty-terminfo-260407d
  (package
    (name "ghostty-terminfo")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ghostty-org/ghostty/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append "ghostty-" version ".tar.gz"))
       (sha256
        (base32 "0ns1pmcwb4z6m3cfvxqkjnhv05dracqx8jafdc73yhvb0b9kfn16"))))
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
                     (terminfo-dir (string-append out "/share/terminfo")))
                (mkdir-p terminfo-dir)
                (invoke "tic" "-x"
                        "-o" terminfo-dir
                        "src/terminfo/ghostty.terminfo")))))))
    (native-inputs (list ncurses))
    (home-page "https://ghostty.org")
    (synopsis "terminfo entry for the Ghostty terminal emulator")
    (description
     "This package provides the terminfo database entry for the Ghostty
terminal emulator, allowing programs to correctly query terminal
capabilities when running inside Ghostty.")
    (license license:expat)))
