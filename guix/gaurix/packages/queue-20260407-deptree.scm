(define-module (gaurix packages queue-20260407-deptree)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages check)
  #:use-module (gnu packages gnome))

;; ─── pipes.sh ───
;; Animated pipes terminal screensaver (pure bash)
(define-public pipes.sh
  (package
    (name "pipes.sh")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pipeseroni/pipes.sh/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "09m4alb3clp3rhnqga5v6070p7n1gmnwp2ssqhq87nf2ipfpcaak"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pipes.sh" "bin/pipes.sh"))))
    (inputs (list bash))
    (synopsis "animated pipes terminal screensaver")
    (description "Pipes.sh is a terminal screensaver that draws animated
pipes across the screen using Unicode characters.  It is written entirely
in Bash and requires no external dependencies beyond a terminal emulator.")
    (home-page "https://github.com/pipeseroni/pipes.sh")
    (license license:expat)))

;; ─── grepcidr ───
;; Filter IPv4 and IPv6 addresses matching CIDR patterns
(define-public grepcidr
  (package
    (name "grepcidr")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://www.pc-tools.net/files/unix/grepcidr-"
                    version ".tar.gz"))
              (sha256
               (base32
                "1yzpa1nigmmp4hir6377hrkpp0z6jnxgccaw2jbqgydbglvnm231"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f                  ;no test suite
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)      ;no configure script
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (man (string-append out "/share/man/man1")))
                     (install-file "grepcidr" bin)
                     (install-file "grepcidr.1" man)))))))
    (synopsis "filter IPv4 and IPv6 addresses matching CIDR patterns")
    (description "Grepcidr can be used to filter a list of IP addresses
against one or more Classless Inter-Domain Routing (CIDR) patterns.  It
supports both IPv4 and IPv6 addresses and can be used as a fast filter
in shell pipelines.")
    (home-page "http://www.pc-tools.net/unix/grepcidr/")
    (license license:gpl3+)))

;; ─── libjodycode ───
;; Shared code used by jdupes and other utilities
(define-public libjodycode
  (package
    (name "libjodycode")
    (version "4.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/jbruchon/libjodycode/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0ci117jszha296vqd5y2vkdjgihg5q6f8qfk4v12pn39y828g9fv"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f                  ;no test suite
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)      ;uses plain Make
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (invoke "make" "install"
                             (string-append "PREFIX=" out))))))))
    (synopsis "shared code library for jdupes and related utilities")
    (description "Libjodycode provides shared code used by jdupes, jody_hash,
and other utilities written by Jody Bruchon.  It includes string handling,
OS abstraction, and other common routines.")
    (home-page "https://codeberg.org/jbruchon/libjodycode")
    (license license:expat)))

;; ─── notify-send.sh ───
;; Drop-in replacement for notify-send with more features
(define-public notify-send.sh
  (package
    (name "notify-send.sh")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vlevit/notify-send.sh/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1ca47481gkfxy0fs42xg0vsgqnsfvsz35d2wkk25bipgvbfalimf"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("notify-send.sh" "bin/notify-send.sh")
               ("notify-action.sh" "bin/notify-action.sh"))))
    (inputs (list bash libnotify))
    (synopsis "notify-send drop-in replacement with more features")
    (description "Notify-send.sh is a drop-in replacement for notify-send
from libnotify.  It adds support for replacing and closing existing
notifications, and waiting for notification actions.")
    (home-page "https://github.com/vlevit/notify-send.sh")
    (license license:gpl3+)))

;; ─── python-pid ───
;; Pidfile featuring stale detection and file-locking
(define-public python-pid
  (package
    (name "python-pid")
    (version "3.0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/trbs/pid/")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14ap3sg7xm7if9mndyay52ch0sgl9wcd6bx711r6hjwhz3imbykf"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/trbs/pid/")
    (synopsis "pidfile featuring stale detection and file-locking")
    (description "Python-pid provides a pidfile implementation featuring stale
detection and file-locking.  It can be used as a context manager or decorator
to ensure only one instance of a process is running.")
    (license license:asl2.0)))

;; ─── python-condense-json ───
;; Python function for condensing JSON using replacement strings
(define-public python-condense-json
  (package
    (name "python-condense-json")
    (version "0.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/simonw/condense-json")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1m855crk91m9xwg2460c6qbs0l5rj2qrmigdpl0fssdanlc7mj5w"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-pytest python-setuptools))
    (home-page "https://github.com/simonw/condense-json")
    (synopsis "condense JSON using replacement strings")
    (description "Python-condense-json provides a function for condensing JSON
data by replacing repeated values with shorter replacement strings.  This is
useful for reducing the size of JSON output for display purposes.")
    (license license:asl2.0)))

;; ─── python-m3u8 ───
;; Python m3u8 parser
(define-public python-m3u8
  (package
    (name "python-m3u8")
    (version "6.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/globocom/m3u8")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "021ivgx9cxl02klxr9nsrbpc9142ynk25fj6fgcax0s1lclaw8ym"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/globocom/m3u8")
    (synopsis "Python m3u8 playlist parser")
    (description "Python-m3u8 is a parser for M3U8 playlists, which are used
by HTTP Live Streaming (HLS).  It can parse both simple and variant playlists
and provides an object model for manipulating playlist data.")
    (license license:expat)))

;; ─── python-plyer ───
;; Platform-independent wrapper for platform-dependent APIs
(define-public python-plyer
  (package
    (name "python-plyer")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/p/plyer/plyer-"
             version ".tar.gz"))
       (sha256
        (base32 "0qdaddrn9ki8faq01mfsf3ppchjjd6mb4zj8m0vsy1qyw6vxzdv5"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))               ;tests require Android/iOS/macOS
    (native-inputs (list python-setuptools))
    (home-page "https://plyer.readthedocs.org/en/latest/")
    (synopsis "platform-independent wrapper for platform-dependent APIs")
    (description "Plyer is a platform-independent Python wrapper for
platform-dependent APIs.  It provides a consistent interface for accessing
features like notifications, GPS, camera, and other hardware across
different operating systems.")
    (license license:expat)))
