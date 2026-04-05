;;; Round-22 resolution for blocked-tree run cron-c79f127f worker w03.
;;; 6 new recipes: python-pid, deb2targz, libjodycode, notify-send.sh,
;;;   ttf-gabarito, libticables
(define-module (gaurix packages cron-c79f127f-r22-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system font)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (python-pid
            deb2targz
            libjodycode
            notify-send.sh
            ttf-gabarito
            libticables))

;;;
;;; 1. python-pid — PID file management with stale detection
;;;
(define-public python-pid
  (package
    (name "python-pid")
    (version "3.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pid" version))
       (sha256
        (base32 "0rpbagc6dql98q5gaprp9a6ifirjkih3mr1212xkx8znhc76fcqf"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))                  ;no test suite in sdist
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/trbs/pid")
    (synopsis "PID file management with stale detection and locking")
    (description
     "The pid library provides a decorator and context manager for managing PID
files.  It features automatic stale PID detection and file-level locking to
prevent multiple instances of the same process from running simultaneously.")
    (license license:asl2.0)))

;;;
;;; 2. deb2targz — Convert Debian .deb packages to .tar.gz
;;;
(define-public deb2targz
  (package
    (name "deb2targz")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.miketaylor.org.uk/tech/deb/deb2targz")
       (sha256
        (base32 "0jx4fs76v0fmwinjh9s9x2g3v5yhrslvhfcy36sxdacqn2fk35zm"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("deb2targz" "bin/deb2targz"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'unpack-source
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "deb2targz")
              (chmod "deb2targz" #o755)))
          (add-after 'unpack-source 'patch-shebang
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute* "deb2targz"
                (("#!/usr/bin/perl")
                 (string-append "#!" (search-input-file inputs "bin/perl")))))))))
    (inputs (list perl))
    (home-page "https://www.miketaylor.org.uk/tech/deb/")
    (synopsis "Convert Debian .deb packages to .tar.gz archives")
    (description
     "deb2targz is a Perl script that converts Debian Linux @file{.deb} package
files into standard @file{.tar.gz} archives, making their contents accessible
on non-Debian systems.")
    (license license:public-domain)))

;;;
;;; 3. libjodycode — Shared library used by jdupes and other Jody Bruchon tools
;;;
(define-public libjodycode
  (package
    (name "libjodycode")
    (version "4.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/jbruchon/libjodycode/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "1x3zyi0bhg1znd57dcpcg1llx55nlrcb5rs26kmi9hz0j6jms257"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                         ;no test suite
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))          ;no configure script
    (home-page "https://codeberg.org/jbruchon/libjodycode")
    (synopsis "Shared code library used by jdupes and related utilities")
    (description
     "libjodycode is a shared library that provides common code used by several
utilities written by Jody Bruchon, including jdupes (duplicate file finder),
jc_calcsize, and winregfs.  It provides string handling, path operations, and
other utility functions.")
    (license license:expat)))

;;;
;;; 4. notify-send.sh — Drop-in replacement for notify-send
;;;
(define-public notify-send.sh
  (package
    (name "notify-send.sh")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vlevit/notify-send.sh/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "1ca47481gkfxy0fs42xg0vsgqnsfvsz35d2wkk25bipgvbfalimf"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("notify-send.sh" "bin/notify-send.sh")
          ("notify-action.sh" "bin/notify-action.sh"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'wrap-scripts
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin"))
                    (gdbus (search-input-file inputs "bin/gdbus")))
                (for-each
                 (lambda (script)
                   (wrap-program (string-append bin "/" script)
                     `("PATH" prefix
                       (,(dirname gdbus)))))
                 '("notify-send.sh" "notify-action.sh"))))))))
    (inputs (list glib))
    (home-page "https://github.com/vlevit/notify-send.sh")
    (synopsis "Drop-in replacement for notify-send with more features")
    (description
     "notify-send.sh is a drop-in replacement for @command{notify-send} that
uses @command{gdbus} to communicate with the notification daemon.  It supports
replacing and closing existing notifications by ID, and executing actions via
the companion @command{notify-action.sh} script.")
    (license license:gpl3+)))

;;;
;;; 5. ttf-gabarito — Geometric sans typeface
;;;
(define-public ttf-gabarito
  (package
    (name "ttf-gabarito")
    (version "1.000")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/naipefoundry/gabarito/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "1vkmibgj8fpsz68kd1x2z2w9n49dhn6zlglhc1dqw5ic3sfpi04a"))))
    (build-system font-build-system)
    (home-page "https://github.com/naipefoundry/gabarito")
    (synopsis "Light-hearted geometric sans typeface")
    (description
     "Gabarito is a geometric sans-serif typeface designed by Naipe Foundry,
featuring 6 weights from regular to extra-bold.  It is well-suited for
headlines and display text with its friendly, approachable character.")
    (license license:silofl1.1)))

;;;
;;; 6. libticables — TI calculator link cable library
;;;
(define-public libticables
  (package
    (name "libticables")
    (version "1.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://sourceforge/tilp/tilp2-linux/tilp2-1.18/"
             "libticables2-" version ".tar.bz2"))
       (sha256
        (base32 "08j5di0cgix9vcpdv7b8xhxdjkk9zz7fqfnv3l4apk3jdr8vcvqc"))))
    (build-system gnu-build-system)
    (arguments
     (list #:configure-flags
           #~(list "--enable-libusb10")))
    (native-inputs
     (list autoconf automake libtool pkg-config))
    (inputs
     (list libusb glib))
    (home-page "http://lpg.ticalc.org/prj_tilp/")
    (synopsis "Communication library for TI calculator link cables")
    (description
     "libticables is a library that provides support for operations on TI
calculator link cables.  It is part of the TILP (TI Linking Program) suite and
handles low-level USB and serial communication with Texas Instruments graphing
calculators through various cable types.")
    (license license:gpl2+)))
