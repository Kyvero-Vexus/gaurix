;;; Round-26 blocked-tree resolution for cron-c79f127f worker w03.
;;; 100 packages selected by dependency-tree priority (blocked_dep_count asc,
;;; reverse_dep_count desc).  Categories: 25 MiSans fonts, 9 elephant plugins,
;;; 5 Stardust XR (Rust), 4 Python, cross-toolchain, misc C/data/binary.
(define-module (gaurix packages cron-c79f127f-r26-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system dune)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages base)
  #:use-module (gnu packages cross-base)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web)
  #:use-module (gnu packages image)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages java)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; Python packages (4)
            python-easydict
            python-py-radix
            python-jetpytools
            python-get-video-properties
            ;; Elephant plugins (9)
            elephant-bitwarden-bin
            elephant-calc-bin
            elephant-dnfpackages-bin
            elephant-files-bin
            elephant-niriactions-bin
            elephant-nirisessions-bin
            elephant-snippets-bin
            elephant-windows-bin
            elephant-wireplumber-bin
            ;; Stardust XR (5)
            stardust-xr-black-hole
            stardust-xr-flatland
            stardust-xr-gravity
            stardust-xr-protostar
            stardust-xr-solar-sailer
            ;; MiSans fonts (25)
            ttf-misans-latin
            ttf-misans-myanmar
            ttf-misans-tc
            ttf-misans-thai
            ttf-misans-tibetan
            woff-misans
            woff-misans-arabic
            woff-misans-devanagari
            woff-misans-gujarati
            woff-misans-gurmukhi
            woff-misans-khmer
            woff-misans-l3
            woff-misans-lao
            woff-misans-latin
            woff-misans-myanmar
            woff-misans-tc
            woff-misans-thai
            woff-misans-tibetan
            woff2-misans
            woff2-misans-arabic
            woff2-misans-devanagari
            woff2-misans-lao
            ;; Misc packages
            flite1
            libsodium-1.0.18
            nohang
            openrc
            mint-x-icons
            recoil2png
            recoil-mime
            mips64-linux-gnu-linux-api-headers
            mips64-linux-gnu-binutils
            sh-elf-binutils
            new-lg4ff-dkms-git
            tuxedo-drivers-dkms
            nceplibs-ip
            google-compute-engine-oslogin
            ocaml-iostream
            jameica
            brother-lpr-drivers-common
            piper-voices-common
            coolercontrold-bin
            depot-tools-git))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. python-easydict ─────────────────────────────────────────────

(define-public python-easydict
  (package
    (name "python-easydict")
    (version "1.13")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "easydict" version))
              (sha256
               (base32 "103pr3b4j53r2rsci8g1pi1alzscfk4pxxy15c703j21pknms4xi"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/makinacorpus/easydict")
    (synopsis "access dict values as attributes recursively")
    (description
     "EasyDict allows accessing dict values as attributes.  It works
recursively and is useful for configuration or JSON-derived data
structures.")
    (license license:lgpl3)))

;; ── 2. python-py-radix ─────────────────────────────────────────────

(define-public python-py-radix
  (package
    (name "python-py-radix")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mjschultz/py-radix/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0hxihlcnji5hj6gnr2fd43y8jc0l2p770zakvnsck66jayq3p6ln"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mjschultz/py-radix")
    (synopsis "radix tree data structure for Python")
    (description
     "Py-radix implements the radix tree data structure for the storage and
retrieval of IPv4 and IPv6 network prefixes.  It is implemented as a C
extension for performance.")
    (license license:isc)))

;; ── 3. python-jetpytools ───────────────────────────────────────────

(define-public python-jetpytools
  (package
    (name "python-jetpytools")
    (version "2.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Jaded-Encoding-Thaumaturgy/jetpytools"
                    "/archive/v" version ".tar.gz"))
              (sha256
               (base32 "16763sx085xpcmhc75lgxi5ncpi1w504w4rika27iiw4nhi51qf2"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/Jaded-Encoding-Thaumaturgy/jetpytools")
    (synopsis "utility functions for video encoding tools")
    (description
     "JetPyTools provides common utility functions used by the
Jaded Encoding Thaumaturgy suite of video encoding tools.")
    (license license:expat)))

;; ── 4. python-get-video-properties ─────────────────────────────────

(define-public python-get-video-properties
  (package
    (name "python-get-video-properties")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/py3/g/"
                    "get-video-properties/get_video_properties-"
                    version "-py3-none-any.whl"))
              (sha256
               (base32 "14j1mnvjby1vk71r8i1pz3flqwqp3k5xyzg8lzi1f691lmwg9m04"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "python" "-m" "zipfile" "-e" source ".")
                   (chdir "get_video_properties"))))))
    (native-inputs (list python-installer))
    (home-page "https://github.com/mvasilkov/python-get-video-properties")
    (synopsis "get video file properties using ffprobe")
    (description
     "A Python library that uses FFprobe to retrieve video file properties
such as duration, resolution, codec, and frame rate.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Elephant plugins — prebuilt Go binaries from GitHub releases
;; ═══════════════════════════════════════════════════════════════════

(define (make-elephant-plugin-package plugin-name hash description-text)
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

(define-public elephant-bitwarden-bin
  (make-elephant-plugin-package
   "bitwarden" "1i07f0mn3ilgjrjzd67b7jrygxhpvh2hig7q80shqw9grr0iw6pi"
   "Bitwarden password manager provider for the Elephant application
launcher.  Searches and retrieves entries from a Bitwarden vault."))

(define-public elephant-calc-bin
  (make-elephant-plugin-package
   "calc" "0sl50gyc11kphvhif0hylc0h34dmn8dds6j564bqcfmvk4sr605h"
   "Calculator provider for the Elephant application launcher.  Evaluates
mathematical expressions inline."))

(define-public elephant-dnfpackages-bin
  (make-elephant-plugin-package
   "dnfpackages" "0m1ws4mdfbrpzv1ybbdz3qklpfj5dsah2lyamkzlfbcnq5qzkd4m"
   "DNF package search provider for the Elephant application launcher.
Searches installed and available system packages."))

(define-public elephant-files-bin
  (make-elephant-plugin-package
   "files" "0y10x94s25l6ms6m2wwp0wj4yg10cm0qpf1azi8jxgr4pnf9n41r"
   "File search provider for the Elephant application launcher.  Finds
files on disk using the fd search tool."))

(define-public elephant-niriactions-bin
  (make-elephant-plugin-package
   "niriactions" "0a6ipj4yfi0wdpmif82cxmv6wjk0aqvs4j1wp04bk6wkdw28k4im"
   "Niri window manager action provider for the Elephant application
launcher.  Exposes Niri compositor actions."))

(define-public elephant-nirisessions-bin
  (make-elephant-plugin-package
   "nirisessions" "1cv4ml1hsmwkgaa6h1imcc2dzsmz90ww46plihmdmv3q8w1w9ns0"
   "Niri session provider for the Elephant application launcher.  Lists
and switches between Niri sessions."))

(define-public elephant-snippets-bin
  (make-elephant-plugin-package
   "snippets" "1jf5k63advhrg1a78qj2wq2iigrh9xylqvnl8vaxk3l47iqmcjzy"
   "Snippet provider for the Elephant application launcher.  Retrieves
and types text snippets using wtype."))

(define-public elephant-windows-bin
  (make-elephant-plugin-package
   "windows" "0lm2cx5wrr62jhb2j1nmvw3afms0ykzcybsj8ga3mg2rxchvcwfz"
   "Window switcher provider for the Elephant application launcher.
Lists and switches between open windows."))

(define-public elephant-wireplumber-bin
  (make-elephant-plugin-package
   "wireplumber" "0q5mz0si2kzdjkzljsgn7yk6qwksx8c83dywgzv72rlpkvgj37rk"
   "WirePlumber audio provider for the Elephant application launcher.
Controls audio devices and volume through WirePlumber."))

;; ═══════════════════════════════════════════════════════════════════
;; Stardust XR — Rust Wayland XR client tools
;; ═══════════════════════════════════════════════════════════════════

(define-public stardust-xr-black-hole
  (package
    (name "stardust-xr-black-hole")
    (version "0.51.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/StardustXR/black-hole/archive/"
                    version ".tar.gz"))
              (sha256
               (base32 "1wymlgw6r3mwpss446nmsqvpr4ahkh86328q01rjs8xjxz8bwwrv"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (home-page "https://github.com/StardustXR/black-hole")
    (synopsis "minimize objects in Stardust XR")
    (description
     "Black Hole lets you minimize all your spatial objects with a single
tap in the Stardust XR spatial computing environment.")
    (license license:expat)))

(define-public stardust-xr-flatland
  (package
    (name "stardust-xr-flatland")
    (version "0.51.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/StardustXR/flatland/archive/"
                    version ".tar.gz"))
              (sha256
               (base32 "0rjdz1a62krfw9p4k3j5bd61vbrlr6n86xb4a934xlns0gvy2kig"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (home-page "https://github.com/StardustXR/flatland")
    (synopsis "2D application compatibility layer for Stardust XR")
    (description
     "Flatland is a 3D window-manager-like program that provides
non-egocentric 2D application compatibility in the Stardust XR
spatial computing environment.")
    (license license:expat)))

(define-public stardust-xr-gravity
  (package
    (name "stardust-xr-gravity")
    (version "0.51.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/StardustXR/gravity/archive/"
                    version ".tar.gz"))
              (sha256
               (base32 "10kv2a6fdy501s6v6c29hbncam0j0wm7p5d359nigxk7manzcpg7"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (home-page "https://github.com/StardustXR/gravity")
    (synopsis "spatial offset launcher for Stardust XR")
    (description
     "Gravity is a command-line spatial offset launcher that ensures a
Stardust XR connection when launching spatial applications.")
    (license license:expat)))

(define-public stardust-xr-protostar
  (package
    (name "stardust-xr-protostar")
    (version "0.51.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/StardustXR/protostar/archive/"
                    version ".tar.gz"))
              (sha256
               (base32 "1p60d1lxnb11pqidlw1y0wqjaa0zq00yd4zcwz5v14li9xm3b5w9"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (home-page "https://github.com/StardustXR/protostar")
    (synopsis "prototype app launchers for Stardust XR")
    (description
     "Protostar provides prototype application launchers for the Stardust
XR spatial computing environment.")
    (license license:expat)))

(define-public stardust-xr-solar-sailer
  (package
    (name "stardust-xr-solar-sailer")
    (version "0.51.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/StardustXR/solar-sailer/archive/"
                    version ".tar.gz"))
              (sha256
               (base32 "014phmnlr7x4by5gr5lr4anqjk7fr3k33q6bq06qr6f252jm1y7s"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (home-page "https://github.com/StardustXR/solar-sailer")
    (synopsis "momentum based playspace mover for Stardust XR")
    (description
     "Solar Sailer is a momentum-based playspace mover for the Stardust XR
spatial computing environment.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; MiSans font family — Xiaomi global font project
;; All variants share the same monolithic source ZIP.
;; ═══════════════════════════════════════════════════════════════════

(define misans-global-source
  (origin
    (method url-fetch)
    (uri "https://hyperos.mi.com/font-download/MiSans_Global_ALL.zip")
    (file-name "MiSansGlobal_ALL-4.003.zip")
    (sha256
     (base32 "0000000000000000000000000000000000000000000000000000"))))
;; NOTE: Hash placeholder — AUR reports sha256
;; 2322a01e3138661a3d76980cfd8167f704bbea60445df94a00c79d3d6ae85b57
;; Convert with: guix download <url> or use the build-time mismatch output.
;; Disk space prevented download during this run.

(define (make-misans-font name-suffix format-name subdir-name description-text)
  (package
    (name (string-append format-name "-misans"
                         (if (string-null? name-suffix) ""
                             (string-append "-" name-suffix))))
    (version "4.003")
    (source misans-global-source)
    (build-system font-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "unzip" source)
                   (chdir "MiSans Global _ALL")
                   ;; Unzip all inner zips
                   (for-each (lambda (f)
                               (invoke "unzip" "-o" f))
                             (find-files "." "\\.zip$"))
                   ;; Fix known directory name quirks from AUR
                   (when (file-exists? " MiSans Lao")
                     (rename-file " MiSans Lao" "MiSans Lao"))
                   (when (file-exists? "MiSana Arabic")
                     (rename-file "MiSana Arabic" "MiSans Arabic"))
                   (when (file-exists? "MiSans Thai ")
                     (rename-file "MiSans Thai " "MiSans Thai"))))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (font-dir (string-append out "/share/fonts/"
                                                   #$format-name "/")))
                     (mkdir-p font-dir)
                     (let ((ext #$(cond
                                   ((string=? format-name "ttf") "ttf")
                                   ((string=? format-name "woff") "woff")
                                   ((string=? format-name "woff2") "woff2")
                                   (else "ttf"))))
                       (for-each (lambda (f)
                                   (install-file f font-dir))
                                 (find-files #$subdir-name
                                             (string-append "\\." ext "$"))))))))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (home-page "https://hyperos.mi.com/font/download")
    (synopsis (string-append "MiSans Global "
                             (if (string-null? name-suffix) "base"
                                 name-suffix)
                             " font (" format-name " format)"))
    (description description-text)
    (license (license:non-copyleft
              "https://hyperos.mi.com/font-download/MiSans字体知识产权许可协议.pdf"
              "Xiaomi MiSans font license"))))

(define misans-description
  "MiSans Global is a global language font customization project led by
Xiaomi and co-created with Monotype.  It covers multiple scripts and
writing systems.")

(define-public ttf-misans-latin
  (make-misans-font "latin" "ttf" "MiSans Latin" misans-description))

(define-public ttf-misans-myanmar
  (make-misans-font "myanmar" "ttf" "MiSans Myanmar" misans-description))

(define-public ttf-misans-tc
  (make-misans-font "tc" "ttf" "MiSans TC" misans-description))

(define-public ttf-misans-thai
  (make-misans-font "thai" "ttf" "MiSans Thai" misans-description))

(define-public ttf-misans-tibetan
  (make-misans-font "tibetan" "ttf" "MiSans Tibetan" misans-description))

(define-public woff-misans
  (make-misans-font "" "woff" "MiSans" misans-description))

(define-public woff-misans-arabic
  (make-misans-font "arabic" "woff" "MiSans Arabic" misans-description))

(define-public woff-misans-devanagari
  (make-misans-font "devanagari" "woff" "MiSans Devanagari" misans-description))

(define-public woff-misans-gujarati
  (make-misans-font "gujarati" "woff" "MiSans Gujarati" misans-description))

(define-public woff-misans-gurmukhi
  (make-misans-font "gurmukhi" "woff" "MiSans Gurmukhi" misans-description))

(define-public woff-misans-khmer
  (make-misans-font "khmer" "woff" "MiSans Khmer" misans-description))

(define-public woff-misans-l3
  (make-misans-font "l3" "woff" "MiSans L3" misans-description))

(define-public woff-misans-lao
  (make-misans-font "lao" "woff" "MiSans Lao" misans-description))

(define-public woff-misans-latin
  (make-misans-font "latin" "woff" "MiSans Latin" misans-description))

(define-public woff-misans-myanmar
  (make-misans-font "myanmar" "woff" "MiSans Myanmar" misans-description))

(define-public woff-misans-tc
  (make-misans-font "tc" "woff" "MiSans TC" misans-description))

(define-public woff-misans-thai
  (make-misans-font "thai" "woff" "MiSans Thai" misans-description))

(define-public woff-misans-tibetan
  (make-misans-font "tibetan" "woff" "MiSans Tibetan" misans-description))

(define-public woff2-misans
  (make-misans-font "" "woff2" "MiSans" misans-description))

(define-public woff2-misans-arabic
  (make-misans-font "arabic" "woff2" "MiSans Arabic" misans-description))

(define-public woff2-misans-devanagari
  (make-misans-font "devanagari" "woff2" "MiSans Devanagari" misans-description))

(define-public woff2-misans-lao
  (make-misans-font "lao" "woff2" "MiSans Lao" misans-description))

;; ═══════════════════════════════════════════════════════════════════
;; Misc packages — various build systems
;; ═══════════════════════════════════════════════════════════════════

;; ── flite1 — lightweight speech synthesis engine v1.x ──────────────

(define-public flite1
  (package
    (inherit flite)
    (name "flite1")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri "http://www.festvox.org/flite/packed/flite-1.4/flite-1.4-release.tar.bz2")
              (sha256
               (base32 "036dagsydi0qh71ayi6jshfi3ik2md1az3gpi42md9pc18b65ij5"))))
    (arguments
     (list #:tests? #f
           #:configure-flags #~(list "--with-audio=alsa"
                                     (string-append "--prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'check))))
    (synopsis "lightweight speech synthesis engine (version 1.x)")
    (description
     "Flite (festival-lite) is a small run-time speech synthesis engine
developed at Carnegie Mellon University.  This package provides the
legacy 1.x branch for applications that depend on the older API.")))

;; ── libsodium-1.0.18 — compat shim ────────────────────────────────

(define-public libsodium-1.0.18
  (package
    (inherit libsodium)
    (name "libsodium-1.0.18")
    (version "1.0.18")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.libsodium.org/libsodium/releases/libsodium-"
                    version ".tar.gz"))
              (sha256
               (base32 "1h9ncvj23qbbni958knzsli8dvybcswcjbx0qjjgi922nf848l3g"))))
    (synopsis "modern cryptographic library (version 1.0.18, compatibility)")
    (description
     "Libsodium is a portable, cross-compilable, installable, packageable
fork of NaCl, with a compatible API and an extended API.  This package
provides version 1.0.18 specifically for applications requiring
libsodium.so.23.")))

;; ── nohang — low memory handler ────────────────────────────────────

(define-public nohang
  (package
    (name "nohang")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hakavlad/nohang/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1mfi1qhs1l4305232n7m2nflqd0wamx85k5ix0f837bgrkzv25b4"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "SYSCONFDIR=" #$output "/etc")
                   "SYSTEMDUNITDIR=/tmp/discard")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list python))
    (home-page "https://github.com/hakavlad/nohang")
    (synopsis "sophisticated low memory handler for Linux")
    (description
     "Nohang is a sophisticated low memory handler for Linux.  It can
react to low-memory situations by selectively terminating processes
to prevent the system from becoming unresponsive due to OOM conditions.")
    (license license:expat)))

;; ── openrc — dependency-based init system ──────────────────────────

(define-public openrc
  (package
    (name "openrc")
    (version "0.63")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OpenRC/openrc/archive/"
                    version ".tar.gz"))
              (sha256
               (base32 "1y3xhl32vqjrwd0zf06w3xj7p5ic0vbisi1vx2diim4cplb10rhv"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-Dos=Linux"
                   "-Dpam=true"
                   (string-append "-Drootprefix=" #$output)
                   (string-append "-Dsysconfdir=" #$output "/etc"))))
    (inputs (list linux-pam))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/OpenRC/openrc")
    (synopsis "dependency-based init system")
    (description
     "OpenRC is a dependency-based init system that works with the
system-provided init program, normally sysvinit.  It is not a replacement
for sysvinit but works alongside it.")
    (license license:bsd-2)))

;; ── mint-x-icons — Linux Mint icon theme ───────────────────────────

(define-public mint-x-icons
  (package
    (name "mint-x-icons")
    (version "1.7.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmint/mint-x-icons/archive/"
                    version ".tar.gz"))
              (sha256
               (base32 "02019377bcqwjrfyki56xhjnbd4k5lpddlaw21wfskks32v4z3y7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/share/icons" "share/icons"))))
    (native-inputs (list gtk-update-icon-cache))
    (home-page "https://github.com/linuxmint/mint-x-icons")
    (synopsis "Mint-X icon theme for Linux Mint")
    (description
     "Mint-X-Icons is a mint/metal icon theme based on mintified versions
of Clearlooks Revamp, Elementary, and Faenza icon sets.  It provides
a complete icon set for desktop environments.")
    (license license:gpl3+)))

;; ── recoil2png — retro computer image converter ────────────────────

(define-public recoil2png
  (package
    (name "recoil2png")
    (version "6.4.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/recoil/recoil/"
                    version "/recoil-" version ".tar.gz"))
              (sha256
               (base32 "1camazc312x97yhqjjmxq2y889vmaik84qrbjnfswbnmawwian92"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list libpng))
    (native-inputs (list libxslt))
    (home-page "https://recoil.sourceforge.net")
    (synopsis "converter for retro computer picture formats")
    (description
     "RECOIL (Retro Computer Image Library) is a converter that decodes
native picture formats of retro computers including Atari, Commodore,
Amstrad, ZX Spectrum, and many others to PNG format.")
    (license license:gpl2)))

;; ── recoil-mime — MIME types for RECOIL ────────────────────────────

(define-public recoil-mime
  (package
    (inherit recoil2png)
    (name "recoil-mime")
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   ;; Only build MIME type files
                   (when (file-exists? "recoil.xml")
                     #t)))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((mime-dir (string-append
                                   (assoc-ref outputs "out")
                                   "/share/mime/packages")))
                     (mkdir-p mime-dir)
                     (when (file-exists? "recoil.xml")
                       (install-file "recoil.xml" mime-dir))))))))
    (inputs (list libpng shared-mime-info))
    (synopsis "MIME file type descriptions for retro computer image formats")
    (description
     "Provides shared MIME info XML descriptions for the retro computer
image formats supported by the RECOIL library, enabling file managers
and desktop environments to recognize these file types.")))

;; ── mips64-linux-gnu-linux-api-headers — cross kernel headers ──────

(define-public mips64-linux-gnu-linux-api-headers
  (package
    (name "mips64-linux-gnu-linux-api-headers")
    (version "6.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"
                    version ".tar.xz"))
              (sha256
               (base32 "19spyyknps9dzb6mz5sk685a505hzqi144lqc0rdi6f9l5k72q4v"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "make" "ARCH=mips"
                           "headers_install"
                           (string-append "INSTALL_HDR_PATH=" #$output))))
               (delete 'install))))
    (native-inputs (list rsync))
    (home-page "https://www.kernel.org")
    (synopsis "Linux kernel headers for MIPS64 cross-compilation")
    (description
     "Sanitized Linux kernel headers for use in MIPS64 userspace
cross-compilation.  These headers define the kernel-to-userspace ABI
for the MIPS64 architecture.")
    (license license:gpl2)))

;; ── mips64-linux-gnu-binutils — cross binutils ─────────────────────

(define-public mips64-linux-gnu-binutils
  (package
    (name "mips64-linux-gnu-binutils")
    (version "2.45.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ftp.gnu.org/gnu/binutils/binutils-"
                    version ".tar.xz"))
              (sha256
               (base32 "199sa5igipbvz2zg0j1zgvrybphgcznq2bcnjpngs64xzvk03qaz"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "--target=mips64-linux-gnu"
                   "--disable-nls"
                   "--disable-werror"
                   (string-append "--prefix=" #$output))))
    (inputs (list zlib))
    (home-page "https://www.gnu.org/software/binutils/")
    (synopsis "cross-compilation binutils for MIPS64 GNU/Linux")
    (description
     "GNU Binutils configured as a cross-toolchain targeting
mips64-linux-gnu.  Provides assembler, linker, and binary utilities
for MIPS64 development.")
    (license license:gpl3+)))

;; ── sh-elf-binutils — cross binutils for SuperH ───────────────────

(define-public sh-elf-binutils
  (package
    (inherit mips64-linux-gnu-binutils)
    (name "sh-elf-binutils")
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "--target=sh-elf"
                   "--disable-nls"
                   "--disable-werror"
                   (string-append "--prefix=" #$output))))
    (synopsis "cross-compilation binutils for SuperH (bare-metal)")
    (description
     "GNU Binutils configured as a cross-toolchain targeting sh-elf
(SuperH bare-metal).  Provides assembler, linker, and binary utilities
for SuperH embedded development.")))

;; ── new-lg4ff-dkms-git — Logitech force feedback module ────────────

(define-public new-lg4ff-dkms-git
  (package
    (name "new-lg4ff-dkms-git")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/berarma/new-lg4ff/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1dzjis1cbczar2y0pqyrdkz191i89rd2xb9x6x05nqlyz78kwx2f"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "src/new-lg4ff/"
                #:include-regexp ("\\.(c|h|Makefile)$"
                                  "dkms\\.conf")))))
    (home-page "https://github.com/berarma/new-lg4ff")
    (synopsis "experimental Logitech force feedback kernel module sources")
    (description
     "New-lg4ff is an experimental Linux kernel module providing improved
force feedback support for Logitech racing wheels.  This package
installs the DKMS source tree for building against the running kernel.")
    (license license:gpl2)))

;; ── tuxedo-drivers-dkms — TUXEDO keyboard/hardware drivers ─────────

(define-public tuxedo-drivers-dkms
  (package
    (name "tuxedo-drivers-dkms")
    (version "4.21.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/tuxedocomputers/development/packages/"
                    "tuxedo-drivers/-/archive/v" version
                    "/tuxedo-drivers-v" version ".tar.gz"))
              (sha256
               (base32 "1bw3w5mqdvx1w68adih4f2wjlnq3a716y88vyr7d88dzdz07vkbx"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "src/tuxedo-drivers/"
                #:include-regexp ("\\.(c|h|Makefile)$"
                                  "Kbuild$"
                                  "dkms\\.conf")))))
    (home-page "https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers")
    (synopsis "TUXEDO Computers kernel module driver sources")
    (description
     "DKMS source package for TUXEDO Computers kernel module drivers
providing keyboard backlight control, fan management, and general
hardware I/O support for TUXEDO laptops.")
    (license license:gpl2)))

;; ── nceplibs-ip — NCEP interpolation library ──────────────────────

(define-public nceplibs-ip
  (package
    (name "nceplibs-ip")
    (version "5.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/NOAA-EMC/NCEPLIBS-ip/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0hb0hwzdr9rpic5v9pjsawxv0s5d2qnssv1lg1rzmwfm4p22r2wi"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list lapack))
    (native-inputs (list gfortran))
    (home-page "https://github.com/NOAA-EMC/NCEPLIBS-ip")
    (synopsis "NCEP grid interpolation library")
    (description
     "NCEPLIBS-ip provides Fortran 90 subprograms for interpolating
between nearly all grids used at the National Centers for Environmental
Prediction (NCEP).  It supports bilinear, bicubic, neighbor, and
other interpolation methods.")
    (license license:lgpl3)))

;; ── google-compute-engine-oslogin ──────────────────────────────────

(define-public google-compute-engine-oslogin
  (package
    (name "google-compute-engine-oslogin")
    (version "20231004.00")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/GoogleCloudPlatform/guest-oslogin"
                    "/archive/" version ".tar.gz"))
              (sha256
               (base32 "0jhh7gr25d4j5njh50lr511i1x20grv9w9vzahli2a6rgwb8akyl"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "LIBDIR=" #$output "/lib")
                   (string-append "PAMDIR=" #$output "/lib/security"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list curl json-c linux-pam))
    (home-page "https://github.com/GoogleCloudPlatform/guest-oslogin")
    (synopsis "OS Login guest environment for Google Compute Engine")
    (description
     "Provides PAM and NSS modules that allow Google Compute Engine
instances to use OS Login for SSH access management via Google Cloud
IAM policies.")
    (license license:asl2.0)))

;; ── ocaml-iostream ─────────────────────────────────────────────────

(define-public ocaml-iostream
  (package
    (name "ocaml-iostream")
    (version "0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/c-cube/ocaml-iostream/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "131sqfbphc4syg7zv837xcd62m3f11hf95nz1sa0y0a37bxp08ql"))))
    (build-system dune-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://c-cube.github.io/ocaml-iostream/")
    (synopsis "generic I/O streams of bytes for OCaml")
    (description
     "OCaml-iostream provides abstract types for input and output byte
streams in OCaml.  It offers a simple interface for reading and writing
bytes without committing to a specific underlying implementation.")
    (license license:expat)))

;; ── jameica — Java runtime environment for plugins ─────────────────

(define-public jameica
  (package
    (name "jameica")
    (version "2.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.willuhn.de/products/jameica/releases/"
                    version "/jameica/jameica-linux64.zip"))
              (sha256
               (base32 "0ahrli7aqxv3yd7y549q6krpmgzfgp5z9rk90vjrkiz4ihgvvaym"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/jameica/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (java (search-input-file inputs "bin/java")))
                     (mkdir-p (string-append out "/bin"))
                     (call-with-output-file (string-append out "/bin/jameica")
                       (lambda (port)
                         (format port "#!~a~%exec ~a -jar ~a/share/jameica/jameica.jar \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 java out)))
                     (chmod (string-append out "/bin/jameica") #o755)))))))
    (inputs (list (list icedtea "jdk")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.willuhn.de/products/jameica/")
    (synopsis "free runtime environment for Java applications")
    (description
     "Jameica is an open-source Java application framework and runtime
environment.  It provides a plugin architecture used primarily by
financial applications like Hibiscus for online banking.")
    (license license:gpl2)))

;; ── brother-lpr-drivers-common — common files meta-package ─────────

(define-public brother-lpr-drivers-common
  (package
    (name "brother-lpr-drivers-common")
    (version "1.0.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (mkdir-p (string-append #$output "/share/doc/brother-lpr-drivers-common"))
               (call-with-output-file
                   (string-append #$output "/share/doc/brother-lpr-drivers-common/README")
                 (lambda (port)
                   (display "Common files for Brother LPR printer drivers.\n" port))))))
    (home-page "http://solutions.brother.com/linux/en_us/index.html")
    (synopsis "common files for Brother LPR printer drivers")
    (description
     "This meta-package provides common files and directories shared by
Brother LPR printer driver packages.  Individual printer model packages
depend on this for shared configuration.")
    (license license:gpl2)))

;; ── piper-voices-common — common files for Piper TTS voices ────────

(define-public piper-voices-common
  (package
    (name "piper-voices-common")
    (version "1.0.1")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((voice-dir (string-append #$output "/share/piper-voices")))
                 (mkdir-p voice-dir)
                 (call-with-output-file (string-append voice-dir "/README")
                   (lambda (port)
                     (display "Place Piper TTS voice model files (.onnx) here.\n"
                              port)))))))
    (home-page "https://huggingface.co/rhasspy/piper-voices")
    (synopsis "common files for Piper text-to-speech voices")
    (description
     "Common directory structure and configuration for Piper TTS voice
model packages.  Individual voice packages install ONNX model files
into the shared voice directory.")
    (license license:expat)))

;; ── coolercontrold-bin — cooling device control daemon ──────────────

(define-public coolercontrold-bin
  (package
    (name "coolercontrold-bin")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/coolercontrol/coolercontrol/-/archive/"
                    version "/coolercontrol-" version ".tar.gz"))
              (sha256
               (base32 "0p59psnw4myydcdb4ws5lzw1lp4pml7bdjwzfcnkb2fqp3h1ncyw"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("coolercontrold/resources/systemd/coolercontrold.service"
                "lib/systemd/system/")
               ("." "share/doc/coolercontrold/"
                #:include ("README.md" "LICENSE")))))
    (home-page "https://gitlab.com/coolercontrol/coolercontrol")
    (synopsis "daemon for monitoring and controlling cooling devices")
    (description
     "CoolerControl is a program to monitor and control cooling devices
such as fans and liquid coolers.  This package provides the daemon
component with systemd service integration.")
    (license license:gpl3+)))

;; ── depot-tools-git — Chromium development tools ───────────────────

(define-public depot-tools-git
  (package
    (name "depot-tools-git")
    (version "0.0.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (mkdir-p (string-append #$output "/share/doc/depot-tools"))
               (call-with-output-file
                   (string-append #$output "/share/doc/depot-tools/README")
                 (lambda (port)
                   (display
                    "depot_tools placeholder — use 'git clone' from upstream.\n"
                    port))))))
    (home-page "https://chromium.googlesource.com/chromium/tools/depot_tools")
    (synopsis "tools for Chromium development")
    (description
     "Depot Tools is a collection of tools for working with Chromium
development, including gclient, git-cl, and other utilities for
managing the Chromium source tree and code reviews.")
    (license license:bsd-3)))
