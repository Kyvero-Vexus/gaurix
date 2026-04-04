;;; Chunk-local package module for blocked-tree run cron-c79f127f-r15 worker w02.
;;; Resolves: python-art, flaresolverr, chexquest3-wad, square1-wad
;;; (Other packages in this chunk already pass dry-run from other modules.)
(define-module (gaurix packages cron-c79f127f-r15-w02)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system python)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages python)
  #:autoload (gnu packages) (specification->package)
  #:export (python-art
            flaresolverr
            chexquest3-wad
            square1-wad))


;;; ---- 1. python-art ----
;;; ASCII art library for Python.  Source build with setuptools.

(define-public python-art
  (package
    (name "python-art")
    (version "6.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sepandhaghighi/art/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1qswlwzmr41251fpgzsgp35brjkfg4b56lvbnw24w87iq1662nlh"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/sepandhaghighi/art")
    (synopsis "ASCII art library for Python")
    (description
     "Art is a Python library for rendering decorative ASCII art text, fonts,
and one-line art symbols.  It supports hundreds of ASCII fonts and thousands
of art symbols.")
    (license license:expat)))


;;; ---- 2. flaresolverr ----
;;; Proxy server to bypass Cloudflare protection.  Trivial repackage of
;;; Python source with a wrapper script.

(define-public flaresolverr
  (package
    (name "flaresolverr")
    (version "3.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FlareSolverr/FlareSolverr/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "035sn1pgc6dsr8jhxiy8ay3iw52p4yf3lbsqvhr8812mgy561phf"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source #$source)
                 (out #$output)
                 (lib (string-append out "/lib/flaresolverr"))
                 (bin (string-append out "/bin")))
            (setenv "PATH" (string-append #$tar "/bin:" #$gzip "/bin"))
            (invoke (string-append #$tar "/bin/tar") "xzf" source)
            (mkdir-p lib)
            (mkdir-p bin)
            (copy-recursively
             (string-append "FlareSolverr-" #$version "/src")
             (string-append lib "/src"))
            (copy-file
             (string-append "FlareSolverr-" #$version "/requirements.txt")
             (string-append lib "/requirements.txt"))
            (let ((wrapper (string-append bin "/flaresolverr")))
              (call-with-output-file wrapper
                (lambda (port)
                  (format port "#!~a~%exec ~a ~a/src/flaresolverr.py \"$@\"~%"
                          (string-append #$bash-minimal "/bin/bash")
                          (string-append #$python "/bin/python3")
                          lib)))
              (chmod wrapper #o755))))))
    (native-inputs (list tar gzip))
    (inputs
     (list bash-minimal python))
    (home-page "https://github.com/FlareSolverr/FlareSolverr")
    (synopsis "Proxy server to bypass Cloudflare and DDoS-GUARD protection")
    (description
     "FlareSolverr is a proxy server that uses a headless browser to solve
Cloudflare challenges.  It is commonly used with tools like Prowlarr, Jackett,
and other indexer proxies.")
    (license license:expat)))


;;; ---- 3. chexquest3-wad ----
;;; Chex Quest 3 IWAD game data.  Trivial unpack of zip archive.

(define-public chexquest3-wad
  (package
    (name "chexquest3-wad")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://archive.org/download/ChexQuest3_1020/ChexQuest3.zip")
       (sha256
        (base32 "0inl7n974kxk3573ixj0rzqr0gbr0kw4rf5gc72lrppr3i9apar9"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source #$source)
                 (out #$output)
                 (wad-dir (string-append out "/share/games/doom"))
                 (doc-dir (string-append out "/share/doc/chexquest3-wad")))
            (setenv "PATH" (string-append #$unzip "/bin"))
            (invoke (string-append #$unzip "/bin/unzip") "-o" source)
            (mkdir-p wad-dir)
            (mkdir-p doc-dir)
            (copy-file "chex3.wad" (string-append wad-dir "/chex3.wad"))
            (when (file-exists? "CQ3 ReadMe.txt")
              (copy-file "CQ3 ReadMe.txt"
                         (string-append doc-dir "/CQ3 ReadMe.txt")))))))
    (native-inputs (list unzip))
    (home-page
     "https://web.archive.org/web/20140326194047/http://www.chucktropolis.com/gamers.htm")
    (synopsis "Chex Quest 3 IWAD game data")
    (description
     "This package provides the Chex Quest 3 IWAD file (@file{chex3.wad})
for use with Doom-compatible source ports.  Chex Quest 3 is a non-violent
first-person shooter originally bundled with Chex cereal.")
    (license (license:non-copyleft
              "file:///share/doc/chexquest3-wad/CQ3 ReadMe.txt"
              "Custom license; see included readme."))))


;;; ---- 4. square1-wad ----
;;; Adventures of Square Episode 1 game data.  Trivial unpack of zip.

(define-public square1-wad
  (package
    (name "square1-wad")
    (version "2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://adventuresofsquare.com/downloads/square-ep2-win64-"
             version ".zip"))
       (sha256
        (base32 "16a5m2yi5vhp82gznxckz399pkcwpgisdym74za72dndvfy4hj5f"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source #$source)
                 (out #$output)
                 (wad-dir (string-append out "/share/games/doom"))
                 (doc-dir (string-append out "/share/licenses/square1-wad")))
            (setenv "PATH" (string-append #$unzip "/bin"))
            (invoke (string-append #$unzip "/bin/unzip") "-o" source)
            (mkdir-p wad-dir)
            (mkdir-p doc-dir)
            (copy-file "square1.pk3" (string-append wad-dir "/square1.pk3"))
            (when (file-exists? "SQUARE-LICENSE.txt")
              (copy-file "SQUARE-LICENSE.txt"
                         (string-append doc-dir "/SQUARE-LICENSE.txt")))))))
    (native-inputs (list unzip))
    (home-page "http://adventuresofsquare.com/")
    (synopsis "Adventures of Square Episode 1 game data")
    (description
     "This package provides the Adventures of Square Episode 1 game data
(@file{square1.pk3}) for use with GZDoom or compatible source ports.")
    (license (list (license:non-copyleft
                    "https://creativecommons.org/licenses/by-nc/4.0/"
                    "Creative Commons Attribution-NonCommercial 4.0")
                   license:expat))))
