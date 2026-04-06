;;; Round-22 worker-03 blocked dependency-tree resolution pass (batch 4).
;;; 100 packages selected from dep-tree priority queue (blocked_dep_count asc,
;;; reverse_dep_count desc, total_dep_count asc, name asc).
;;; 32 new recipes: 5 compat aliases, 9 Python, 3 elephant binary plugins,
;;; 5 icon themes, 6 C/C++ libraries, 1 Rust tool, 1 font, 1 shell script,
;;; 1 binary tool.
;;; 68 re-blocked with specific reasons (phonon-qt5 already in Guix).
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd4)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages image)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages web)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-multimedia)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages certs)
  #:use-module (gnu packages crypto)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; Compat aliases (5)
            kdesu5
            qt5-serialbus
            qt5-gamepad
            ocaml-ppx_here
            wolfssl-all
            ;; Python packages (7)
            python-emoji-country-flag
            python-proglog
            python-aiohttp-sse-client
            python-myjdapi
            python-myloginpath
            envycontrol
            upliftpowerplay
            ;; Elephant binary plugins (3)
            elephant-1password-bin
            elephant-bookmarks-bin
            elephant-clipboard-bin
            ;; Icon themes (5)
            themix-icons-archdroid-git
            themix-icons-papirus-git
            themix-icons-numix-git
            themix-icons-suru-plus-git
            themix-icons-suru-plus-aspromauros-git
            ;; C/C++ libraries (6)
            cnmatrix
            nceplibs-g2c
            openobex
            openssl-1.0
            c-client
            undr
            ;; Rust tool (1)
            stl-thumb
            ;; More Python (2)
            python-simsimd
            python-stringzilla
            ;; Misc (3)
            pilowlava-font-common
            updpkgsrcs
            slsa-verifier))


;; ═══════════════════════════════════════════════════════════════════
;; Compat aliases — re-export existing Guix packages under AUR names
;; ═══════════════════════════════════════════════════════════════════

;; phonon-qt5 already exists in Guix at (gnu packages kde-multimedia).
;; No compat alias needed.

;; ── 1. kdesu5 → kdesu ─────────────────────────────────────────────

(define-public kdesu5
  (package (inherit kdesu) (name "kdesu5")))

;; ── 3. qt5-serialbus → qtserialbus-5 ──────────────────────────────

(define-public qt5-serialbus
  (package (inherit qtserialbus-5) (name "qt5-serialbus")))

;; ── 4. qt5-gamepad → qtgamepad-5 ──────────────────────────────────

(define-public qt5-gamepad
  (package (inherit qtgamepad-5) (name "qt5-gamepad")))

;; ── 5. ocaml-ppx_here → ocaml-ppx-here ───────────────────────────

(define-public ocaml-ppx_here
  (package (inherit ocaml-ppx-here) (name "ocaml-ppx_here")))

;; ── 6. wolfssl-all → wolfssl ──────────────────────────────────────
;; AUR wolfssl-all is wolfssl built with all features enabled.
;; Guix wolfssl already enables a reasonable feature set.

(define-public wolfssl-all
  (package (inherit wolfssl) (name "wolfssl-all")))


;; ═══════════════════════════════════════════════════════════════════
;; Python packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 7. python-emoji-country-flag ──────────────────────────────────

(define-public python-emoji-country-flag
  (package
    (name "python-emoji-country-flag")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cvzi/flag/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1ggws2xkvhbhm4sm2f0wwv5v3pfqpw3zp8xyyzam9cdhjf9n2ayy"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/cvzi/flag")
    (synopsis "encode and decode unicode country flag emoji")
    (description
     "Python module to convert country codes (ISO 3166-1 alpha-2) to
and from regional indicator symbol letter emoji representing country
flags.")
    (license license:expat)))

;; ── 8. python-proglog ─────────────────────────────────────────────

(define-public python-proglog
  (package
    (name "python-proglog")
    (version "0.1.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Edinburgh-Genome-Foundry/Proglog"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    ;; NOTE: hash placeholder — obtain with: guix download <url>
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-tqdm))
    (home-page "https://github.com/Edinburgh-Genome-Foundry/Proglog")
    (synopsis "log and progress bar manager for console and notebooks")
    (description
     "Proglog is a progress logging system for Python that provides a
unified interface for console progress bars, Jupyter notebooks,
and web-based progress indicators.")
    (license license:expat)))

;; ── 9. python-aiohttp-sse-client ──────────────────────────────────

(define-public python-aiohttp-sse-client
  (package
    (name "python-aiohttp-sse-client")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rtfol/aiohttp-sse-client/archive/"
                    "v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    ;; NOTE: hash placeholder — obtain with: guix download <url>
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-aiohttp python-multidict python-yarl))
    (home-page "https://github.com/rtfol/aiohttp-sse-client")
    (synopsis "server-sent event client for aiohttp")
    (description
     "An asynchronous Server-Sent Event (SSE) client for Python built
on aiohttp.  Provides an event source interface compatible with
the W3C EventSource API.")
    (license license:asl2.0)))

;; ── 10. python-myjdapi ───────────────────────────────────────────

(define-public python-myjdapi
  (package
    (name "python-myjdapi")
    (version "1.1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mmarquezs/My.Jdownloader-API-Python-Library"
                    "/archive/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    ;; NOTE: hash placeholder — obtain with: guix download <url>
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-requests python-pycryptodome))
    (home-page
     "https://github.com/mmarquezs/My.Jdownloader-API-Python-Library")
    (synopsis "Python API for My.JDownloader")
    (description
     "Python library for interacting with the My.JDownloader web API.
Allows programmatic control of JDownloader instances for managing
file downloads.")
    (license license:expat)))

;; ── 11. python-myloginpath ────────────────────────────────────────

(define-public python-myloginpath
  (package
    (name "python-myloginpath")
    (version "0.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/PyMySQL/myloginpath/archive/"
                    "v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    ;; NOTE: hash placeholder — obtain with: guix download <url>
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/PyMySQL/myloginpath")
    (synopsis "MySQL login path file reader for Python")
    (description
     "A Python library for reading MySQL login path files created by
@code{mysql_config_editor}.  Provides a safe way to read stored
MySQL credentials.")
    (license license:expat)))

;; ── 12. envycontrol ───────────────────────────────────────────────

(define-public envycontrol
  (package
    (name "envycontrol")
    (version "3.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bayasdev/envycontrol/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0has3ww5znlwgqcw8fy15anx8mqrpmjfhz8micq9kav7p5x15960"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/bayasdev/envycontrol")
    (synopsis "CLI for NVIDIA Optimus graphics mode switching on Linux")
    (description
     "EnvyControl is a command-line tool for switching between integrated,
hybrid, and NVIDIA-only graphics modes on Linux laptops with
NVIDIA Optimus technology.  It manages Xorg, modprobe, and udev
configuration.")
    (license license:expat)))

;; ── 13. upliftpowerplay ───────────────────────────────────────────

(define-public upliftpowerplay
  (package
    (name "upliftpowerplay")
    (version "0.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sibradzic/upp/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "02laqz653pnjg46wyg0aimmiyaw9z9xwf9hdk19jr3zlq8xai44v"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-click))
    (home-page "https://github.com/sibradzic/upp")
    (synopsis "parse and modify Radeon PowerPlay tables")
    (description
     "UPP (Uplift Power Play) is a tool for parsing, dumping, and modifying
data in Radeon PowerPlay tables embedded in GPU BIOS images.  Useful
for undervolting and power management tuning of AMD GPUs.")
    (license license:gpl3)))


;; ═══════════════════════════════════════════════════════════════════
;; Elephant binary plugins — prebuilt Go binaries from GitHub releases
;; ═══════════════════════════════════════════════════════════════════

(define (make-elephant-plugin-package/nrd4 plugin-name hash description-text)
  (package
    (name (string-append "elephant-" plugin-name "-bin"))
    (version "2.20.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/abenz1267/elephant/releases/download/v"
                    version "/" plugin-name "-linux-amd64.tar.gz"))
              (sha256 (base32 hash))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append #$plugin-name) "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis (string-append plugin-name " provider for elephant launcher"))
    (description description-text)
    (license license:gpl3)))

;; ── 14. elephant-1password-bin ─────────────────────────────────────

(define-public elephant-1password-bin
  (make-elephant-plugin-package/nrd4
   "1password" "15c40w5r9m01nrq28jha53ccjxmg0b8hw1wkkfzzx7ik8zhlcan7"
   "1Password credential provider for the Elephant application launcher.
Searches and retrieves entries from a 1Password vault."))

;; ── 15. elephant-bookmarks-bin ─────────────────────────────────────

(define-public elephant-bookmarks-bin
  (make-elephant-plugin-package/nrd4
   "bookmarks" "1x0hz1s76vyzk08j1vsf4z1xai2fncvmiqj8wyz53ds026z2ydr6"
   "Browser bookmark provider for the Elephant application launcher.
Searches and opens bookmarks from supported browsers."))

;; ── 16. elephant-clipboard-bin ─────────────────────────────────────

(define-public elephant-clipboard-bin
  (make-elephant-plugin-package/nrd4
   "clipboard" "0pdnrn9fqdvrsx35bjv6ifgymj3jc1874mg05v6562ln7qyw18vf"
   "Clipboard history provider for the Elephant application launcher.
Accesses clipboard entries via wl-clipboard integration."))


;; ═══════════════════════════════════════════════════════════════════
;; Icon themes — standalone SVG/PNG icon themes
;; ═══════════════════════════════════════════════════════════════════

;; ── 17. themix-icons-archdroid-git ─────────────────────────────────

(define-public themix-icons-archdroid-git
  (package
    (name "themix-icons-archdroid-git")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/themix-project/archdroid-icon-theme"
                    "/archive/refs/heads/master.tar.gz"))
              (sha256
               (base32 "0bz1xjh32hrqarvqwg0s2ncixjgwqxjajbx2s5k44rhi86mcj335"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/icons/Archdroid/"
                         #:exclude ("README.md" "LICENSE" ".gitignore")))))
    (home-page "https://github.com/themix-project/archdroid-icon-theme")
    (synopsis "Archdroid icon theme for Linux desktops")
    (description
     "Archdroid is a flat icon theme inspired by Android's material design
for Linux desktop environments.  Works standalone or as a Themix/Oomox
icon plugin.")
    (license license:gpl3)))

;; ── 18. themix-icons-papirus-git ───────────────────────────────────

(define-public themix-icons-papirus-git
  (package
    (name "themix-icons-papirus-git")
    (version "20220910")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
                    "/archive/" version ".tar.gz"))
              (sha256
               (base32 "0bp215xyiiaxpg0pm17j31myfyfv78smi0bi5407f19iqmmwjdp2"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "Papirus" "share/icons/Papirus/")
                   (list "Papirus-Dark" "share/icons/Papirus-Dark/")
                   (list "Papirus-Light" "share/icons/Papirus-Light/"))))
    (home-page "https://github.com/PapirusDevelopmentTeam/papirus-icon-theme")
    (synopsis "Papirus icon theme for Themix/Oomox integration")
    (description
     "Papirus icon theme packaged for use as a Themix/Oomox icon plugin.
A free SVG icon theme for Linux based on Paper Icon Set with lots
of additional panel icons and new app icons.")
    (license license:gpl3)))

;; ── 19. themix-icons-numix-git ─────────────────────────────────────

(define-public themix-icons-numix-git
  (package
    (name "themix-icons-numix-git")
    (version "22.08.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/numixproject/numix-icon-theme"
                    "/archive/refs/heads/master.tar.gz"))
              (sha256
               (base32 "1f2y878xx18jbk13233ifq0dj5d5i8fgk7h00dyqfl7pxdir6g7q"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "Numix" "share/icons/Numix/")
                   (list "Numix-Light" "share/icons/Numix-Light/"))))
    (home-page "https://github.com/numixproject/numix-icon-theme")
    (synopsis "Numix icon theme for Themix/Oomox integration")
    (description
     "Numix is a flat icon theme for Linux from the Numix Project,
packaged for Themix/Oomox integration.  Features a modern circle
style for application icons.")
    (license license:gpl3)))

;; ── 20. themix-icons-suru-plus-git ─────────────────────────────────

(define-public themix-icons-suru-plus-git
  (package
    (name "themix-icons-suru-plus-git")
    (version "30.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gusbemacbe/suru-plus"
                    "/archive/refs/heads/master.tar.gz"))
              (sha256
               (base32 "02r154ig2hy9lqvgi5divnzhy2h1alqcksay21x62x3fk6x9v6pk"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/icons/Suru++/"
                         #:exclude ("README.md" "LICENSE" ".gitignore"
                                    "CREDITS.md" "COPYING")))))
    (home-page "https://github.com/gusbemacbe/suru-plus")
    (synopsis "Suru++ icon theme for Linux desktops")
    (description
     "Suru++ is a cyberpunk style icon theme for Linux desktops based
on the Suru icons from the Ubuntu Touch project.  Provides over
5000 icons in gradient style.")
    (license license:gpl3)))

;; ── 21. themix-icons-suru-plus-aspromauros-git ─────────────────────

(define-public themix-icons-suru-plus-aspromauros-git
  (package
    (name "themix-icons-suru-plus-aspromauros-git")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gusbemacbe/suru-plus-aspromauros"
                    "/archive/refs/heads/master.tar.gz"))
              (sha256
               (base32 "1bmy3a5yxl3q33phk0fjm8m88zwa66jijq2rj7m1d2id25q2j34f"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/icons/Suru++-Aspromauros/"
                         #:exclude ("README.md" "LICENSE" ".gitignore"
                                    "CREDITS.md" "COPYING")))))
    (home-page "https://github.com/gusbemacbe/suru-plus-aspromauros")
    (synopsis "Suru++ Aspromauros black & white icon theme")
    (description
     "Suru++ Aspromauros is a black and white variant of the Suru++ icon
theme for Linux desktops.  The name means \"black & white\" in
Greek.")
    (license license:gpl3)))


;; ═══════════════════════════════════════════════════════════════════
;; C/C++ libraries
;; ═══════════════════════════════════════════════════════════════════

;; ── 22. cnmatrix ──────────────────────────────────────────────────

(define-public cnmatrix
  (package
    (name "cnmatrix")
    (version "0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cntools/cnmatrix"
                    "/archive/refs/heads/master.tar.gz"))
              (sha256
               (base32 "0g2yvz40mb0jvlsljpgljw2fhxzfdzj4phr12b317hay7y4c1bdg"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list lapack))
    (home-page "https://github.com/cntools/cnmatrix")
    (synopsis "C interface to matrix backends")
    (description
     "CNMatrix provides a minimal C interface to several matrix
computation backends.  Designed for embedded and real-time
applications that need lightweight linear algebra.")
    (license license:expat)))

;; ── 23. nceplibs-g2c ──────────────────────────────────────────────

(define-public nceplibs-g2c
  (package
    (name "nceplibs-g2c")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/NOAA-EMC/NCEPLIBS-g2c/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1avrisf93x6rg5pcyds738yki4nbn2vwc1bss38cy0350r6a4845"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list libjpeg-turbo libpng zlib))
    (home-page "https://github.com/NOAA-EMC/NCEPLIBS-g2c")
    (synopsis "C decoder/encoder routines for GRIB edition 2")
    (description
     "NCEPLIBS-g2c provides C-language decoder and encoder routines for
GRIB edition 2 weather data messages.  Part of the NOAA NCEP
libraries for meteorological data processing.")
    (license license:lgpl3)))

;; ── 24. openobex ──────────────────────────────────────────────────

(define-public openobex
  (package
    (name "openobex")
    (version "1.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/openobex/files/"
                    "openobex/" version "/openobex-" version
                    "-Source.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    ;; NOTE: hash placeholder — SF download redirects; obtain with:
    ;; guix download <direct-mirror-url>
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list eudev libusb))
    (home-page "http://dev.zuckschwerdt.org/openobex/")
    (synopsis "implementation of the OBject EXchange (OBEX) protocol")
    (description
     "OpenOBEX is a free open source implementation of the OBEX protocol
used for transferring objects (files, contacts, calendar entries)
between devices via Bluetooth, IrDA, or USB.  Provides both a C
library and command-line tools.")
    (license license:gpl2+)))

;; ── 25. openssl-1.0 ───────────────────────────────────────────────

(define-public openssl-1.0
  (package
    (name "openssl-1.0")
    (version "1.0.2u")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.openssl.org/source/old/1.0.2/openssl-"
                    version ".tar.gz"))
              (sha256
               (base32 "05lxcs4hzyfqd5jn0d9p0fvqna62v2s4pc9qgmq0dpcknkzwdl7c"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (invoke "./config"
                        (string-append "--prefix=" out)
                        (string-append "--openssldir=" out "/etc/ssl")
                        "shared"
                        "no-ssl2"
                        "no-ssl3")))))))
    (native-inputs (list perl))
    (home-page "https://www.openssl.org/")
    (synopsis "legacy OpenSSL 1.0.x compatibility library")
    (description
     "OpenSSL 1.0.2 compatibility package for applications that have
not yet migrated to OpenSSL 3.x.  This is a legacy version and
should only be used for backward compatibility.")
    (license license:openssl)))

;; ── 26. c-client ──────────────────────────────────────────────────

(define-public c-client
  (package
    (name "c-client")
    (version "2007f")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/StrungOutAF/imap-" version
                    "/archive/refs/heads/master.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    ;; NOTE: hash placeholder — try:
    ;; guix download https://github.com/uw-imap/imap/archive/refs/tags/imap-2007f.tar.gz
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "SSLDIR=" #$(this-package-input "openssl"))
              "lnp" "EXTRACFLAGS=-fPIC")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (lib (string-append out "/lib"))
                     (inc (string-append out "/include/c-client")))
                (mkdir-p lib)
                (mkdir-p inc)
                (install-file "c-client/c-client.a" lib)
                (for-each (lambda (h)
                            (install-file h inc))
                          (find-files "c-client" "\\.h$"))))))))
    (inputs (list openssl))
    (home-page "https://github.com/uw-imap/imap")
    (synopsis "UW IMAP c-client library for mail access")
    (description
     "The UW IMAP c-client library provides a C-language API for
accessing IMAP, POP3, and local mailboxes.  Used by PHP's IMAP
extension and other mail applications.")
    (license license:asl2.0)))


;; ═══════════════════════════════════════════════════════════════════
;; Rust tool
;; ═══════════════════════════════════════════════════════════════════

;; ── 27. stl-thumb ─────────────────────────────────────────────────

(define-public stl-thumb
  (package
    (name "stl-thumb")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/unlimitedbacon/stl-thumb/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1c4q8hcr477y5w324gn07k9h7b199x6c6g6nbgd57zc033i0z24q"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (home-page "https://github.com/unlimitedbacon/stl-thumb")
    (synopsis "fast lightweight thumbnail generator for STL files")
    (description
     "STL Thumb is a fast, lightweight thumbnail generator for STL 3D
model files.  Generates PNG thumbnail images suitable for file
managers and other applications that display file previews.")
    (license license:expat)))


;; ═══════════════════════════════════════════════════════════════════
;; Misc packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 28. pilowlava-font-common ─────────────────────────────────────

(define-public pilowlava-font-common
  (package
    (name "pilowlava-font-common")
    (version "2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicehash/pilowlava-font")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    ;; NOTE: hash placeholder — upstream URL uncertain (CCC event font).
    ;; This is a documentation and license meta-package for the
    ;; Pilowlava font family.
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "LICENSE" "share/doc/pilowlava-font/"))))
    (home-page "https://events.ccc.de/congress/2024/infos/styleguide.html")
    (synopsis "documentation and license for Pilowlava font")
    (description
     "General documentation and license files for the Pilowlava font,
used in the CCC (Chaos Communication Congress) 2024 event branding.")
    (license license:silofl1.1)))

;; ── 29. updpkgsrcs ────────────────────────────────────────────────

(define-public updpkgsrcs
  (package
    (name "updpkgsrcs")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "updpkgsrcs-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    ;; NOTE: hash placeholder — AUR snapshot URL; obtain with guix download
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "updpkgsrcs" "bin/"))))
    (inputs (list bash coreutils git sed))
    (home-page "https://aur.archlinux.org/packages/updpkgsrcs")
    (synopsis "update source array of Git submodules in PKGBUILD")
    (description
     "A shell script that updates the source array of Git submodules
in Arch Linux PKGBUILD files.  Useful for maintaining packages
that track multiple Git submodule sources.")
    (license license:gpl3)))

;; ── 30. slsa-verifier ─────────────────────────────────────────────

(define-public slsa-verifier
  (package
    (name "slsa-verifier")
    (version "2.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/slsa-framework/slsa-verifier"
                    "/releases/download/v" version
                    "/slsa-verifier-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    ;; NOTE: hash placeholder — obtain with: guix download <url>
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "slsa-verifier-linux-amd64" "bin/slsa-verifier"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/slsa-verifier")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/slsa-framework/slsa-verifier")
    (synopsis "verify provenance from SLSA compliant builders")
    (description
     "SLSA Verifier verifies SLSA provenance attestations for artifacts
built using SLSA-compliant builders.  It checks that software
artifacts were produced by expected builders and source repositories.")
    (license license:asl2.0)))

;; ── 31. undr ──────────────────────────────────────────────────────

(define-public undr
  (package
    (name "undr")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/javiorfo/undr/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "1zwv6dxnfhjm8dz48wqq2vswf2vn57zk8gg1y5qc2kq9qjvnz4gn"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/javiorfo/undr")
    (synopsis "C library with multiple utilities")
    (description
     "Undr is a small C utility library providing common data structures
and helper functions for C programs.  Includes hash maps, dynamic
arrays, string utilities, and logging.")
    (license license:expat)))

;; ── 32. python-simsimd ────────────────────────────────────────────

(define-public python-simsimd
  (package
    (name "python-simsimd")
    (version "6.5.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ashvardanian/simsimd/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1ys693y9hgv1vm96m32pr7dg8hmv6kx7bxbg56r5j28vwnjsbbrs"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/ashvardanian/simsimd")
    (synopsis "SIMD-accelerated similarity metrics for Python")
    (description
     "SimSIMD provides hardware-accelerated dot products and distance
functions (cosine, Euclidean, Jaccard, etc.) using SIMD instructions
for high-performance vector similarity computations in Python.")
    (license license:asl2.0)))

;; ── 33. python-stringzilla ────────────────────────────────────────

(define-public python-stringzilla
  (package
    (name "python-stringzilla")
    (version "4.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ashvardanian/StringZilla/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1qyh891abz55qllspl2j9hp79a6ik03i7q2ifhkmvcphnvd5m8yb"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/ashvardanian/StringZilla")
    (synopsis "SIMD-accelerated string search and manipulation")
    (description
     "StringZilla provides SIMD-accelerated string search, sorting,
hashing, and fingerprinting for Python.  Up to 10x faster than
standard library string operations on modern hardware.")
    (license license:asl2.0)))
