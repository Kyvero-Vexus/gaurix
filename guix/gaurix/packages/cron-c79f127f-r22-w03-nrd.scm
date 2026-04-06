;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass.
;;; 24 new recipes: 5 Python (PyPI), 6 C/C++ (make/cmake/autotools),
;;; 8 copy/trivial (scripts, fonts, plugins, data), 2 dictionaries,
;;; 1 Java, 1 Perl, 1 fish plugin.
;;; 6 re-blocked with specific reasons.
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system ant)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages time)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages java)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages shells)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; Python packages
            python-legendary-gl
            python-pip-tools
            python-calgebra
            python-fastfeedparser
            python-sqlit-tui
            ;; C/C++ packages
            nanoflann
            rdrview
            ezstream
            openmesh
            ttymidi
            xdg-su
            ;; Copy/trivial packages
            mpv-sponsorblock
            protonhax
            stylepak-git
            ttf-lxgw-neo-xihei-plus
            numix-circle-icon-theme-git
            official-gamecube-controller-adapter-rules
            mars-mips
            ;; Script packages
            mved
            overdue
            ;; Fish plugin
            fish-autopair
            ;; Dictionaries
            hunspell-ar
            hunspell-sk
            ;; Font
            otf-xkcd-font))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages from PyPI
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. python-legendary-gl ────────────────────────────────────────

(define-public python-legendary-gl
  (package
    (name "python-legendary-gl")
    (version "0.20.34")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "legendary-gl" version))
              (sha256
               (base32 "04cn1sv5ks0cy085r9i26gddajxcc6mbqvygxlz1cp6dhbm8slis"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-requests python-filelock))
    (home-page "https://github.com/derrod/legendary")
    (synopsis "free and open-source Epic Games Launcher alternative")
    (description "Legendary is a free and open-source replacement for the Epic
Games Launcher.  It can download, install, and launch games from the Epic Games
Store on Linux and other platforms.")
    (license license:gpl3+)))

;; ── 2. python-pip-tools ───────────────────────────────────────────

(define-public python-pip-tools
  (package
    (name "python-pip-tools")
    (version "7.5.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pip_tools" version))
              (sha256
               (base32 "0h9dfkkmv5gn50zl4h0820z77b2p8i0dxfbww6zhq0dwkrvn98wg"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-setuptools-scm python-wheel))
    (propagated-inputs (list python-click python-pip python-pyproject-hooks))
    (home-page "https://github.com/jazzband/pip-tools/")
    (synopsis "keep pinned Python dependencies fresh")
    (description "Pip-tools provides @command{pip-compile} and @command{pip-sync}
to help you manage pinned Python package dependencies.  It compiles
@file{requirements.in} files to fully resolved @file{requirements.txt} files.")
    (license license:bsd-3)))

;; ── 3. python-calgebra ────────────────────────────────────────────

(define-public python-calgebra
  (package
    (name "python-calgebra")
    (version "0.10.11")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "calgebra" version))
              (sha256
               (base32 "0jjpwv4x1f4pjrb2n88qalf45kfydmm145y0qpyazm5y9zr2pn8v"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-dateutil python-typing-extensions
                             python-sortedcontainers))
    (home-page "https://github.com/ashenfad/calgebra")
    (synopsis "calendar interval algebra with set operations")
    (description "Calgebra is a tiny DSL for calendar interval algebra.  It lets
you compose, filter, and query time ranges using set operations such as union,
intersection, and complement.")
    (license license:expat)))

;; ── 4. python-fastfeedparser ──────────────────────────────────────

(define-public python-fastfeedparser
  (package
    (name "python-fastfeedparser")
    (version "0.5.9")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "fastfeedparser" version))
              (sha256
               (base32 "136r23dvs8h52k3mwlk56znqwqqbxj8sar855j5y2ycc5ddpcgrr"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-lxml python-dateutil))
    (home-page "https://github.com/kagisearch/fastfeedparser")
    (synopsis "high-performance RSS and Atom feed parser for Python")
    (description "Fastfeedparser is a high-performance feed parser for Python that
handles RSS, Atom, JSON, and RDF feeds.  It uses @code{lxml} for fast XML
parsing and supports common feed extensions.")
    (license license:expat)))

;; ── 5. python-sqlit-tui ──────────────────────────────────────────

(define-public python-sqlit-tui
  (package
    (name "python-sqlit-tui")
    (version "1.3.1.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "sqlit_tui" version))
              (sha256
               (base32 "0y6c4b969ciwgj36wy86bzhcw166jd51wc640lj21rfc8apl4zd4"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-hatchling python-hatch-vcs))
    (home-page "https://github.com/Maxteabag/sqlit")
    (synopsis "terminal UI for SQL databases")
    (description "Sqlit is a terminal user interface for interacting with SQL
Server, PostgreSQL, MySQL, SQLite, and Oracle databases.  It provides a
keyboard-driven interface for browsing tables, running queries, and managing
database connections.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; C/C++ packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 6. nanoflann ──────────────────────────────────────────────────

(define-public nanoflann
  (package
    (name "nanoflann")
    (version "1.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jlblancoc/nanoflann/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0hl98wpdrhx93l5ygv2qmdn2x9cqs6gl1zdlf8rfqlkxqhz8dp0l"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags #~(list "-DBUILD_EXAMPLES=OFF"
                                     "-DBUILD_TESTS=OFF")))
    (home-page "https://github.com/jlblancoc/nanoflann")
    (synopsis "C++ header-only library for nearest neighbor search with KD-trees")
    (description "Nanoflann is a C++11 header-only library for building KD-trees
of datasets with different topologies.  It provides fast nearest neighbor search
for point clouds and is designed for minimal overhead and easy integration.")
    (license license:bsd-2)))

;; ── 7. rdrview ────────────────────────────────────────────────────

(define-public rdrview
  (package
    (name "rdrview")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/eafer/rdrview/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1awaiqp1rdggcznss7jn88acwl1364gis41k6hps85iv5v5nccp8"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output)
                                (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure))))
    (inputs (list curl libxml2 libseccomp))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/eafer/rdrview")
    (synopsis "command-line tool for Firefox Reader View content extraction")
    (description "Rdrview extracts the main content from a web page, stripping
navigation, ads, and other clutter, similar to the Firefox Reader View
feature.  It outputs clean HTML or plain text suitable for reading or
processing.")
    (license license:asl2.0)))

;; ── 8. ezstream ──────────────────────────────────────────────────

(define-public ezstream
  (package
    (name "ezstream")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ftp.osuosl.org/pub/xiph/releases/ezstream/ezstream-"
                    version ".tar.gz"))
              (sha256
               (base32 "0ajcqlk420ivm1wphpzccscadgfkjl5d9p3baicbm5as8mzqkphi"))))
    (build-system gnu-build-system)
    (inputs (list libshout taglib libxml2))
    (native-inputs (list pkg-config))
    (home-page "https://icecast.org/ezstream/")
    (synopsis "streaming source client for Icecast media servers")
    (description "Ezstream is a command-line source client for Icecast media
streaming servers.  It can stream audio files and playlists, apply on-the-fly
re-encoding, and supports metadata updates.  It reads media from local files
or standard input.")
    (license license:gpl2)))

;; ── 9. openmesh ──────────────────────────────────────────────────

(define-public openmesh
  (package
    (name "openmesh")
    (version "11.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.graphics.rwth-aachen.de/media/openmesh_static/"
                    "Releases/11.0/OpenMesh-" version ".tar.gz"))
              (sha256
               (base32 "1p5fk3byxhmxx2v8v3qyiwd54jb29h6c255jcmnvnv9ycwlmvwy7"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags #~(list "-DBUILD_APPS=OFF")))
    (home-page "https://www.graphics.rwth-aachen.de/software/openmesh/")
    (synopsis "generic half-edge data structure for polygon meshes")
    (description "OpenMesh is a C++ library providing a generic and efficient
half-edge data structure for representing and manipulating polygon meshes.  It
supports arbitrary vertex, edge, and face attributes, and includes algorithms
for decimation, subdivision, and smoothing.")
    (license license:bsd-3)))

;; ── 10. ttymidi ──────────────────────────────────────────────────

(define-public ttymidi
  (package
    (name "ttymidi")
    (version "0.60")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sbelectronics/ttymidi")
                    (commit "c1961e8944506d3991969f4729c24c810f7d79c1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "01wgb6sydrkkn3506lbm385scqg396h7pm7y796ldkm3vz67n2vr"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output)
                                (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure)
                        (replace 'install
                          (lambda* (#:key outputs #:allow-other-keys)
                            (let ((bin (string-append (assoc-ref outputs "out")
                                                      "/bin")))
                              (install-file "ttymidi" bin)))))))
    (inputs (list alsa-lib))
    (home-page "https://github.com/sbelectronics/ttymidi")
    (synopsis "MIDI-to-serial bridge for ALSA sequencer")
    (description "Ttymidi bridges serial devices to ALSA MIDI, allowing external
hardware connected via a serial port to send and receive MIDI messages through
the ALSA sequencer interface.")
    (license license:gpl2+)))

;; ── 11. xdg-su ──────────────────────────────────────────────────

(define-public xdg-su
  (package
    (name "xdg-su")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tarakbumba/xdg-su/archive/refs/tags/xdg-su-"
                    version ".tar.gz"))
              (sha256
               (base32 "0mmdc0h06xqiyjrm1iyfip96fzk32dzfcmf70172c0c7i6bayzjj"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (replace 'bootstrap
                          (lambda _
                            (invoke "autoreconf" "-vfi"))))))
    (native-inputs (list autoconf automake))
    (home-page "https://github.com/tarakbumba/xdg-su")
    (synopsis "run a GUI program as root with a graphical password prompt")
    (description "Xdg-su runs a program as root after prompting for the root
password using the appropriate graphical authentication agent for the current
desktop environment.  It detects and uses the native privilege-escalation tool
for KDE, GNOME, XFCE, or a generic X11 fallback.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Copy/trivial packages (scripts, fonts, plugins, data)
;; ═══════════════════════════════════════════════════════════════════

;; ── 12. mpv-sponsorblock ─────────────────────────────────────────

(define-public mpv-sponsorblock
  (package
    (name "mpv-sponsorblock")
    (version "0.0.0-1.7785c14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/po5/mpv_sponsorblock")
                    (commit "7785c1477103f2fafabfd65fdcf28ef26e6d7f0d")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "012lh23s41j6fhv71jrdysbf3i213gbdhvi9qihxq4c5cm6xlic9"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sponsorblock.lua" "share/mpv/scripts/")
               ("sponsorblock_shared" "share/mpv/scripts/sponsorblock_shared"))))
    (home-page "https://github.com/po5/mpv_sponsorblock")
    (synopsis "skip sponsored segments in YouTube videos played with mpv")
    (description "This mpv script automatically skips sponsored segments in
YouTube videos using the SponsorBlock API.  It detects sponsor, intro, outro,
and other non-content segments and can skip or mute them.")
    (license license:gpl3)))

;; ── 13. protonhax ────────────────────────────────────────────────

(define-public protonhax
  (package
    (name "protonhax")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jcnils/protonhax/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "193b9446bjwnz8gmh77v8jp7fd1c4fwiqg31gfz377rh8z4p59rx"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("protonhax" "bin/protonhax"))))
    (home-page "https://github.com/jcnils/protonhax")
    (synopsis "run programs inside a Steam Proton game environment")
    (description "Protonhax is a shell script that lets you run arbitrary programs
inside the Proton prefix of a running Steam game.  This is useful for launching
modding tools, debuggers, or other utilities in the same Wine environment as
the game.")
    (license license:bsd-3)))

;; ── 14. stylepak-git ─────────────────────────────────────────────

(define-public stylepak-git
  (package
    (name "stylepak-git")
    (version "0.0.0-1.0c4b0c1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/refi64/stylepak")
                    (commit "0c4b0c1c6d893d6c3a38e7dc828a686b7a4a5e45")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "02jppf2h9hs3a5w49kss8r3bz9kh00wl4lr9a87chigqdwy4rli1"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("stylepak" "bin/stylepak"))))
    (home-page "https://github.com/refi64/stylepak")
    (synopsis "automatically install host GTK+ theme as a Flatpak")
    (description "Stylepak generates a Flatpak extension containing the current
GTK+ theme, so that Flatpak applications can use the same appearance as the
host system without manual configuration.")
    (license license:mpl2.0)))

;; ── 15. ttf-lxgw-neo-xihei-plus ─────────────────────────────────

(define-public ttf-lxgw-neo-xihei-plus
  (package
    (name "ttf-lxgw-neo-xihei-plus")
    (version "1.242")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lxgw/LxgwNeoXiHei/releases/download/v"
                    version "/LXGWNeoXiHeiPlus.ttf"))
              (sha256
               (base32 "0vva5qyz4zkb6rfl75v9b2mz6zp3ylcw21iqrax034lqc082pnmj"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((font-dir (string-append #$output
                                              "/share/fonts/truetype")))
                 (mkdir-p font-dir)
                 (copy-file #$source
                            (string-append font-dir
                                           "/LXGWNeoXiHeiPlus.ttf"))))))
    (home-page "https://github.com/lxgw/LxgwNeoXiHei")
    (synopsis "Chinese sans-serif font derived from IPAex Gothic")
    (description "LXGW Neo XiHei Plus is a Chinese sans-serif font based on
IPAex Gothic with additional CJK character coverage.  It provides a clean,
modern appearance suitable for UI text and document body copy.")
    (license (license:non-copyleft
              "https://moji-or.jp/wp-content/ipafont/IPAFontLicense_Eng.pdf"
              "IPA Font License v1.0"))))

;; ── 16. numix-circle-icon-theme-git ──────────────────────────────

(define-public numix-circle-icon-theme-git
  (package
    (name "numix-circle-icon-theme-git")
    (version "26.02.21")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/numixproject/numix-icon-theme-circle/"
                    "archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "1flqsp62rnjrb3v4qg0w5s9hisdhpz5nny6jsbj5n06fr4dq4r0a"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Numix-Circle" "share/icons/Numix-Circle")
               ("Numix-Circle-Light" "share/icons/Numix-Circle-Light"))))
    (home-page "https://github.com/numixproject/numix-icon-theme-circle")
    (synopsis "circle icon theme from the Numix project")
    (description "Numix Circle is an icon theme that provides circular
application icons for the Linux desktop.  It extends the base Numix icon theme
with a distinctive round design for application launchers.")
    (license license:gpl3)))

;; ── 17. official-gamecube-controller-adapter-rules ────────────────

(define-public official-gamecube-controller-adapter-rules
  (package
    (name "official-gamecube-controller-adapter-rules")
    (version "1.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((rules-dir (string-append #$output
                                               "/lib/udev/rules.d")))
                 (mkdir-p rules-dir)
                 (call-with-output-file
                     (string-append rules-dir
                                    "/51-gcadapter.rules")
                   (lambda (port)
                     (display
                      "SUBSYSTEM==\"usb\", ENV{DEVTYPE}==\"usb_device\", ATTRS{idVendor}==\"057e\", ATTRS{idProduct}==\"0337\", MODE=\"0666\"\n"
                      port)))))))
    (home-page "https://wiki.dolphin-emu.org/")
    (synopsis "udev rules for the official GameCube controller adapter")
    (description "This package provides udev rules that grant user-level access
to the official Nintendo GameCube Controller Adapter for Wii U and Switch,
enabling use with the Dolphin emulator without root privileges.")
    (license license:public-domain)))

;; ── 18. mars-mips ────────────────────────────────────────────────

(define-public mars-mips
  (package
    (name "mars-mips")
    (version "4.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dpetersanderson/MARS/archive/refs/tags/v."
                    version ".tar.gz"))
              (sha256
               (base32 "15l83y4l54wv85kr21i39mq9wc6lyy6yvli9z2fqq1z0w45y1zjw"))))
    (build-system ant-build-system)
    (arguments
     (list #:tests? #f
           #:build-target "mars"
           #:phases #~(modify-phases %standard-phases
                        (replace 'install
                          (lambda* (#:key outputs #:allow-other-keys)
                            (let* ((out (assoc-ref outputs "out"))
                                   (share (string-append out "/share/mars"))
                                   (bin (string-append out "/bin")))
                              (mkdir-p share)
                              (mkdir-p bin)
                              (copy-file "Mars.jar"
                                         (string-append share "/Mars.jar"))
                              (call-with-output-file (string-append bin "/mars")
                                (lambda (port)
                                  (format port "#!~a~%exec ~a -jar ~a/Mars.jar \"$@\"~%"
                                          (which "bash")
                                          (which "java")
                                          share)))
                              (chmod (string-append bin "/mars") #o755)))))))
    (native-inputs (list `(,icedtea "jdk")))
    (inputs (list icedtea bash-minimal))
    (home-page "https://github.com/dpetersanderson/MARS")
    (synopsis "MIPS assembler and runtime simulator for education")
    (description "MARS (MIPS Assembler and Runtime Simulator) is an integrated
development environment for programming in MIPS assembly language.  It is
designed for educational use in computer architecture and organization
courses.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Script packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 19. mved ─────────────────────────────────────────────────────

(define-public mved
  (package
    (name "mved")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/raforg/mved/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "09fdchqdkfvvxbpg7qj5ardmcy80ykiasqmfqg88hz6v1g3nimzh"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output))
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure))))
    (inputs (list perl))
    (home-page "https://github.com/raforg/mved")
    (synopsis "rename multiple files and directories using a text editor")
    (description "Mved opens a list of file names in your text editor and renames
them according to your edits.  It carefully handles name collisions, circular
renames, and provides a dry-run mode for previewing changes.")
    (license license:gpl2+)))

;; ── 20. overdue ──────────────────────────────────────────────────

(define-public overdue
  (package
    (name "overdue")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tylerjl/overdue/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "17wv5pz2d8i7cq1h0n4rl6yw73p1dsxrn14dvjjnj8zhfmi3b0y7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("overdue" "bin/overdue"))))
    (home-page "https://github.com/tylerjl/overdue")
    (synopsis "check for running daemons with outdated shared libraries")
    (description "Overdue detects running processes that still reference old
versions of shared libraries after a system update.  It helps identify services
that need to be restarted to use the latest library versions.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Fish plugin
;; ═══════════════════════════════════════════════════════════════════

;; ── 21. fish-autopair ────────────────────────────────────────────

(define-public fish-autopair
  (package
    (name "fish-autopair")
    (version "1.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jorgebucaran/autopair.fish/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "11dc6zbk2d7righcsnv0l34mdrahvk1z9x2lhvqgcf5psg88c9ms"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("conf.d/autopair.fish"
                "share/fish/vendor_conf.d/autopair.fish")
               ("functions/autopair.fish"
                "share/fish/vendor_functions.d/autopair.fish"))))
    (home-page "https://github.com/jorgebucaran/autopair.fish")
    (synopsis "auto-complete matching pairs in the Fish command line")
    (description "Autopair.fish automatically inserts, erases, and skips matching
pairs of characters such as parentheses, brackets, quotes, and backticks in the
Fish shell command line.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Dictionary packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 22. hunspell-ar ──────────────────────────────────────────────

(define-public hunspell-ar
  (package
    (name "hunspell-ar")
    (version "3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/ayaspell/ayaspell-dic/ayaspell-dic-"
                    version ".tar.bz2"))
              (sha256
               (base32 "0yisfdlw4z3m3pqqyxxjndxvzmqaypas9czwglkk94y3r3pdxmfa"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wikipedia-ar.dic" "share/hunspell/ar.dic")
               ("wikipedia-ar.aff" "share/hunspell/ar.aff"))))
    (home-page "https://ayaspell.sourceforge.net/")
    (synopsis "Arabic dictionary for Hunspell")
    (description "This package provides Arabic language dictionary files for the
Hunspell spell checker.  The dictionary is based on the Ayaspell project and
covers Modern Standard Arabic vocabulary.")
    (license license:gpl2+)))

;; ── 23. hunspell-sk ──────────────────────────────────────────────

(define-public hunspell-sk
  (package
    (name "hunspell-sk")
    (version "2.4.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sk-spell/hunspell-sk/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1pcyqyk29wymyg886vyp6mfpjzxngj7lvxwlb8czhy1ahnr9231w"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sk_SK.dic" "share/hunspell/sk_SK.dic")
               ("sk_SK.aff" "share/hunspell/sk_SK.aff"))))
    (home-page "https://github.com/sk-spell/hunspell-sk")
    (synopsis "Slovak dictionary for Hunspell")
    (description "This package provides Slovak language dictionary files for the
Hunspell spell checker.  It includes comprehensive vocabulary coverage for
Slovak spelling and hyphenation.")
    (license license:lgpl2.1+)))

;; ── 24. otf-xkcd-font ────────────────────────────────────────────

(define-public otf-xkcd-font
  (package
    (name "otf-xkcd-font")
    (version "0.0.0-1.5632fde")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ipython/xkcd-font")
                    (commit "5632fde618845dba5c22f14adc7b52bf6c52d46d")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "01wpfc1yp93b37r472mx2b459il5gywnv5sl7pp9afpycb3i4f6l"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("xkcd/build/xkcd.otf" "share/fonts/opentype/")
               ("xkcd/build/xkcd-Regular.otf" "share/fonts/opentype/")
               ("xkcd-script/font/xkcd-script.ttf"
                "share/fonts/truetype/"))))
    (home-page "https://github.com/ipython/xkcd-font")
    (synopsis "font inspired by the xkcd webcomic handwriting style")
    (description "The xkcd font is an OpenType font that reproduces the
handwriting style used in Randall Munroe's xkcd webcomic.  It includes both a
regular weight OTF and a script-style TTF variant, suitable for use with
matplotlib's xkcd mode and similar applications.")
    (license license:cc0)))
