;;; Chunk-local package module for blocked-tree run cron-c79f127f-r8 worker w02.
(define-module (gaurix packages cron-c79f127f-r8-w02)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:autoload (gnu packages) (specification->package)
  #:export (xlibre-xserver-common-git
            python-art
            python-munge
            sqlite-utils
            xrizer-common
            flaresolverr
            chexquest3-wad
            square1-wad
            tailscale
            davs2))

;;; ---- Helper ----

(define (gaurix-alias-package alias-name target-spec)
  "Create a trivial compatibility alias from ALIAS-NAME to TARGET-SPEC."
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))


;;; ---- 1. xlibre-xserver-common-git ----
;;; Strategy A: Alias to upstream xorg-server.
;;; XLibre is a fork of xorg-server; the "common" split package maps to
;;; the base xorg-server package which ships the same common files.

(define-public xlibre-xserver-common-git
  (package
    (inherit (specification->package "xorg-server"))
    (name "xlibre-xserver-common-git")
    (synopsis "Compatibility alias mapping xlibre-xserver-common-git to xorg-server")
    (description
     "This package maps the AUR @code{xlibre-xserver-common-git} package to the
upstream Guix @code{xorg-server} package.  XLibre is a community fork of
xorg-server and the common files are equivalent.")))


;;; ---- 2. python-art ----
;;; Strategy C: Source build (setuptools).

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


;;; ---- 3. python-munge ----
;;; Strategy C: Source build (pyproject / hatchling).

(define-public python-munge
  (package
    (name "python-munge")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/20c/munge/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1pb6xqx27xkxvxq187lpp7f0k7kjyfpawclr9gqgf135sdjq8w0v"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list (specification->package "python-hatchling")))
    (propagated-inputs
     (list (specification->package "python-requests")
           (specification->package "python-click")
           (specification->package "python-toml")
           (specification->package "python-tomlkit")
           (specification->package "python-pyyaml")
           (specification->package "python-urllib3")
           (specification->package "python-charset-normalizer")))
    (home-page "https://github.com/20c/munge")
    (synopsis "Data manipulation and configuration file parsing library")
    (description
     "Munge is a Python library and CLI for reading, manipulating, and writing
configuration data in YAML, TOML, and JSON formats.")
    (license license:asl2.0)))


;;; ---- 4. sqlite-utils ----
;;; Strategy C: Source build (setuptools).

(define-public sqlite-utils
  (package
    (name "sqlite-utils")
    (version "3.39")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/s/sqlite-utils/"
             "sqlite_utils-" version ".tar.gz"))
       (sha256
        (base32 "1kfvz4ga254sjwfv7fx9skpz9g7y4xspk0vjck4vagiykg1fm8mz"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list (specification->package "python-sqlite-fts4")
           (specification->package "python-click")
           (specification->package "python-click-default-group")
           (specification->package "python-tabulate")
           (specification->package "python-dateutil")
           (specification->package "python-pluggy")))
    (home-page "https://sqlite-utils.datasette.io/")
    (synopsis "CLI tool and Python library for manipulating SQLite databases")
    (description
     "sqlite-utils provides a command-line tool and Python library for creating,
querying, and manipulating SQLite databases.  It supports full-text search,
data import/export, and schema introspection.")
    (license license:asl2.0)))


;;; ---- 5. xrizer-common ----
;;; Strategy D: Data/asset package.  xrizer-common ships configuration
;;; and data files for the xrizer OpenVR-to-OpenXR translation layer.
;;; The actual Rust binary is a separate package; this is just the common
;;; assets.  We install the LICENSE and README.

(define-public xrizer-common
  (package
    (name "xrizer-common")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Supreeeme/xrizer/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1lv7nwmw06bkqkgdkd8alzhsp5s7bs0lcf9rk9kdk3v0p32xq7wg"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source #$source)
                 (tar (string-append #+tar "/bin/tar"))
                 (gzip (string-append #+gzip "/bin/gzip"))
                 (out #$output)
                 (doc (string-append out "/share/doc/xrizer-common"))
                 (license-dir (string-append out "/share/licenses/xrizer-common")))
            (setenv "PATH" (string-append #+tar "/bin:" #+gzip "/bin"))
            (invoke tar "xzf" source)
            (mkdir-p doc)
            (mkdir-p license-dir)
            (copy-file (string-append "xrizer-" #$version "/README.md")
                       (string-append doc "/README.md"))
            (copy-file (string-append "xrizer-" #$version "/LICENSE")
                       (string-append license-dir "/LICENSE"))))))
    (native-inputs (list tar gzip))
    (home-page "https://github.com/Supreeeme/xrizer")
    (synopsis "Common files for xrizer OpenVR-to-OpenXR translation layer")
    (description
     "This package provides common data files, documentation, and license for
the xrizer project, an OpenVR-to-OpenXR translation layer for VR applications
on Linux.")
    (license license:gpl3+)))


;;; ---- 6. flaresolverr ----
;;; Strategy C: Source build (trivial Python application).
;;; FlareSolverr is a proxy server that bypasses Cloudflare challenges using
;;; a headless browser.  It requires Chromium + Selenium at runtime.

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
            (setenv "PATH" (string-append #+tar "/bin:" #+gzip "/bin"))
            (invoke (string-append #+tar "/bin/tar") "xzf" source)
            (mkdir-p lib)
            (mkdir-p bin)
            ;; Copy Python source files
            (copy-recursively
             (string-append "FlareSolverr-" #$version "/src")
             (string-append lib "/src"))
            (copy-file
             (string-append "FlareSolverr-" #$version "/requirements.txt")
             (string-append lib "/requirements.txt"))
            ;; Create wrapper script
            (let ((wrapper (string-append bin "/flaresolverr")))
              (call-with-output-file wrapper
                (lambda (port)
                  (format port "#!~a~%exec ~a ~a/src/flaresolverr.py \"$@\"~%"
                          (string-append #+bash-minimal "/bin/bash")
                          (string-append #+python "/bin/python3")
                          lib)))
              (chmod wrapper #o755))))))
    (native-inputs (list tar gzip))
    (inputs
     (list bash-minimal
           (specification->package "python")
           (specification->package "python-selenium")
           (specification->package "python-bottle")
           (specification->package "python-waitress")
           (specification->package "python-prometheus-client")
           (specification->package "python-requests")
           (specification->package "python-certifi")
           (specification->package "python-websockets")
           (specification->package "python-packaging")
           (specification->package "python-xvfbwrapper")))
    (home-page "https://github.com/FlareSolverr/FlareSolverr")
    (synopsis "Proxy server to bypass Cloudflare and DDoS-GUARD protection")
    (description
     "FlareSolverr is a proxy server that uses a headless browser to solve
Cloudflare challenges.  It is commonly used with tools like Prowlarr, Jackett,
and other indexer proxies.")
    (license license:expat)))


;;; ---- 7. chexquest3-wad ----
;;; Strategy D: Data/asset package (WAD file).

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
            (setenv "PATH" (string-append #+unzip "/bin"))
            (invoke (string-append #+unzip "/bin/unzip") "-o" source)
            (mkdir-p wad-dir)
            (mkdir-p doc-dir)
            (copy-file "chex3.wad" (string-append wad-dir "/chex3.wad"))
            (when (file-exists? "CQ3 ReadMe.txt")
              (copy-file "CQ3 ReadMe.txt"
                         (string-append doc-dir "/CQ3 ReadMe.txt")))))))
    (native-inputs (list (specification->package "unzip")))
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


;;; ---- 8. square1-wad ----
;;; Strategy D: Data/asset package (PK3 file).

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
            (setenv "PATH" (string-append #+unzip "/bin"))
            (invoke (string-append #+unzip "/bin/unzip") "-o" source)
            (mkdir-p wad-dir)
            (mkdir-p doc-dir)
            (copy-file "square1.pk3" (string-append wad-dir "/square1.pk3"))
            (when (file-exists? "SQUARE-LICENSE.txt")
              (copy-file "SQUARE-LICENSE.txt"
                         (string-append doc-dir "/SQUARE-LICENSE.txt")))))))
    (native-inputs (list (specification->package "unzip")))
    (home-page "http://adventuresofsquare.com/")
    (synopsis "Adventures of Square Episode 1 game data")
    (description
     "This package provides the Adventures of Square Episode 1 game data
(@file{square1.pk3}) for use with GZDoom or compatible source ports.")
    (license (list (license:non-copyleft "https://creativecommons.org/licenses/by-nc/4.0/" "Creative Commons Attribution-NonCommercial 4.0") license:expat))))


;;; ---- 9. tailscale ----
;;; Strategy B: Trivial binary repack from official release tarball.

(define-public tailscale
  (package
    (name "tailscale")
    (version "1.96.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://pkgs.tailscale.com/stable/tailscale_"
             version "_amd64.tgz"))
       (sha256
        (base32 "1k3qx8liiqk9japnfy6v8adk6n2jkcjvixgpbsr1rydi4s4a3jx1"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source #$source)
                 (out #$output)
                 (bin (string-append out "/bin")))
            (setenv "PATH" (string-append #+tar "/bin:" #+gzip "/bin"))
            (invoke (string-append #+tar "/bin/tar") "xzf" source)
            (mkdir-p bin)
            (let ((srcdir (string-append "tailscale_" #$version "_amd64")))
              (copy-file (string-append srcdir "/tailscale")
                         (string-append bin "/tailscale"))
              (copy-file (string-append srcdir "/tailscaled")
                         (string-append bin "/tailscaled"))
              (chmod (string-append bin "/tailscale") #o755)
              (chmod (string-append bin "/tailscaled") #o755))))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tailscale.com/")
    (synopsis "Mesh VPN built on WireGuard")
    (description
     "Tailscale is a mesh VPN service built on top of WireGuard that makes it
easy to connect devices securely.  This package provides the pre-built
@command{tailscale} CLI client and @command{tailscaled} daemon for
x86_64-linux.")
    (license license:bsd-3)))


;;; ---- 10. davs2 ----
;;; Strategy C: Source build (custom configure + make).

(define-public davs2
  (package
    (name "davs2")
    (version "1.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pkuvcl/davs2/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1j1wj9zp5aghacv30n23fz2590bwf0lnvk54lgnzgix1fsrx15xn"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (chdir "build/linux")
                (invoke "./configure"
                        (string-append "--prefix=" out)
                        "--enable-shared"
                        "--disable-static"))))
          (add-before 'configure 'patch-configure
            (lambda _
              (substitute* "build/linux/configure"
                (("/bin/bash") (which "bash"))))))))
    (native-inputs
     (list (specification->package "nasm")))
    (home-page "https://github.com/pkuvcl/davs2")
    (synopsis "AVS2/IEEE 1857.4 video decoder")
    (description
     "davs2 is an open-source decoder for the AVS2 (Audio Video Standard 2)
video coding standard, also known as IEEE 1857.4.  It supports multithreaded
decoding and is suitable for broadcasting and streaming applications.")
    (license license:gpl2+)))
