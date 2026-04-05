;;; Round-25 resolution for blocked-tree run cron-c79f127f worker w03.
;;; 24 new recipes: 11 Python, 6 XLibre drivers (inherit), 2 inherit (tramp,
;;; waybar-git), 5 C/shell/data packages.  6 re-blocked with specific reasons.
(define-module (gaurix packages cron-c79f127f-r25-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages serialization)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; XLibre drivers (inherit)
            xlibre-input-void
            xlibre-video-vesa
            xlibre-video-fbdev
            xlibre-video-ati
            xlibre-input-synaptics
            xlibre-input-libinput-git
            ;; inherit
            tramp
            waybar-git
            ;; Python packages
            python-nspektr
            python-graphyte
            python-bencoding
            python-ftputil
            python-xlsx2csv
            python-pythondialog
            python-boolshit
            python-maison
            python-pylibsrtp
            python-west
            ;; C/shell/data
            pixelserv-tls
            lwm-legacy
            driverctl
            mint-themes
            kwin-scripts-krohnkite
            broadcom-bt-firmware
            kernel-chktaint))

;; ═══════════════════════════════════════════════════════════════════
;; XLibre drivers — inherit from Xorg counterparts
;; (XLibre is a fork of X.Org; these packages track the fork naming)
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. xlibre-input-void ───────────────────────────────────────────

(define-public xlibre-input-void
  (package
    (inherit xf86-input-void)
    (name "xlibre-input-void")))

;; ── 2. xlibre-video-vesa ───────────────────────────────────────────

(define-public xlibre-video-vesa
  (package
    (inherit xf86-video-vesa)
    (name "xlibre-video-vesa")))

;; ── 3. xlibre-video-fbdev ──────────────────────────────────────────

(define-public xlibre-video-fbdev
  (package
    (inherit xf86-video-fbdev)
    (name "xlibre-video-fbdev")))

;; ── 4. xlibre-video-ati ────────────────────────────────────────────

(define-public xlibre-video-ati
  (package
    (inherit xf86-video-ati)
    (name "xlibre-video-ati")))

;; ── 5. xlibre-input-synaptics ──────────────────────────────────────

(define-public xlibre-input-synaptics
  (package
    (inherit xf86-input-synaptics)
    (name "xlibre-input-synaptics")))

;; ── 6. xlibre-input-libinput-git ───────────────────────────────────

(define-public xlibre-input-libinput-git
  (package
    (inherit xf86-input-libinput)
    (name "xlibre-input-libinput-git")))

;; ═══════════════════════════════════════════════════════════════════
;; Inherit-based packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 7. tramp ────────────────────────────────────────────────────────

(define-public tramp
  (package
    (inherit emacs-tramp)
    (name "tramp")))

;; ── 8. waybar-git ──────────────────────────────────────────────────

(define-public waybar-git
  (package
    (inherit waybar)
    (name "waybar-git")))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages from PyPI
;; ═══════════════════════════════════════════════════════════════════

;; ── 9. python-nspektr ──────────────────────────────────────────────

(define-public python-nspektr
  (package
    (name "python-nspektr")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "nspektr" version))
              (sha256
               (base32 "1d5j83h9a3gxqa1kv5gjkwcpjq3hbqn9ihggaywkglhvr6dnxgs2"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-setuptools-scm python-wheel))
    (propagated-inputs (list python-jaraco-context python-jaraco-functools
                             python-more-itertools python-packaging))
    (home-page "https://github.com/jaraco/nspektr")
    (synopsis "distribution package dependency inspector")
    (description "Nspektr inspects installed Python distribution packages and
their dependencies, providing programmatic access to dependency metadata.")
    (license license:expat)))

;; ── 10. python-graphyte ────────────────────────────────────────────

(define-public python-graphyte
  (package
    (name "python-graphyte")
    (version "1.7.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "graphyte" version))
              (sha256
               (base32 "1qlv50j73rv0y7dlvzgnpjx0yrr8r5cv4y6drkl9vskm4grn2q2w"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/benhoyt/graphyte")
    (synopsis "python library for sending data to Graphite")
    (description "Graphyte is a small Python library for sending data to a
Graphite carbon daemon.  It works with both plain-text and pickle protocols.")
    (license license:expat)))

;; ── 11. python-bencoding ───────────────────────────────────────────

(define-public python-bencoding
  (package
    (name "python-bencoding")
    (version "0.2.6")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "bencoding" version))
              (sha256
               (base32 "0h241lc3yf6q8rdy3mg9jllvwli6kx71sm8iqrmrvqk390fy7k23"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://pypi.org/project/bencoding")
    (synopsis "bencoding encoder and decoder for Python")
    (description "Bencoding provides encoding and decoding of bencoded data, the
serialization format used by BitTorrent for .torrent files and tracker
communication.")
    (license license:expat)))

;; ── 12. python-ftputil ─────────────────────────────────────────────

(define-public python-ftputil
  (package
    (name "python-ftputil")
    (version "5.1.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "ftputil" version))
              (sha256
               (base32 "0ls3dn887ca1ys2qy5xmv024rjczfn9gscrvwi99rvq7sczjvrp9"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://ftputil.sschwarzer.net/")
    (synopsis "high-level FTP client library for Python")
    (description "Ftputil is a high-level Python FTP client library built on top
of ftplib.  It provides a file-system-like interface with classes for remote
files, directories, and stat results.")
    (license license:bsd-3)))

;; ── 13. python-xlsx2csv ────────────────────────────────────────────

(define-public python-xlsx2csv
  (package
    (name "python-xlsx2csv")
    (version "0.8.6")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "xlsx2csv" version))
              (sha256
               (base32 "1d901nnhlsarkswgcdw3qvzjyczgk5g1kmp3p25dwq18c41cb3v1"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-setuptools-scm python-wheel))
    (home-page "https://github.com/dilshod/xlsx2csv")
    (synopsis "convert XLSX (Excel) files to CSV format")
    (description "Xlsx2csv converts Microsoft Excel XLSX files to plain CSV
format.  It supports multiple sheets, date formatting, and various delimiter
options.")
    (license license:expat)))

;; ── 14. python-pythondialog ────────────────────────────────────────

(define-public python-pythondialog
  (package
    (name "python-pythondialog")
    (version "3.5.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pythondialog" version))
              (sha256
               (base32 "08v3flvbhpc0p20drniiaalc3ijghlxk9ka5vz5mqqm6y254m8xj"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "http://pythondialog.sf.net")
    (synopsis "python wrapper for the UNIX dialog utility")
    (description "Pythondialog provides a Python interface to the dialog program,
allowing scripts to display various types of dialog boxes including message
boxes, input boxes, checklists, and menus.")
    (license license:lgpl2.1+)))

;; ── 15. python-boolshit ────────────────────────────────────────────

(define-public python-boolshit
  (package
    (name "python-boolshit")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "boolshit" version))
              (sha256
               (base32 "0sm4blxmcbg922yky1v36flzn55qdj4fzzr3pf48rh8jwi1n483k"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/hirsimaki-markus/boolshit")
    (synopsis "boolean expression evaluator for Python")
    (description "Boolshit evaluates arbitrary boolean expressions given as
strings, supporting standard logical operators and variable substitution.")
    (license license:unlicense)))

;; ── 16. python-maison ──────────────────────────────────────────────

(define-public python-maison
  (package
    (name "python-maison")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "maison" version))
              (sha256
               (base32 "1z1fikbvwjiwkk20yjk5jp336nlbnx6vsmlqbazml3x22ks2nvs7"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-click python-toml))
    (home-page "https://github.com/dbatten5/maison")
    (synopsis "configuration reader for Python projects")
    (description "Maison reads project configuration from pyproject.toml and
other standard configuration files, providing a unified API for accessing
project settings.")
    (license license:expat)))

;; ── 17. python-pylibsrtp ──────────────────────────────────────────

(define-public python-pylibsrtp
  (package
    (name "python-pylibsrtp")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pylibsrtp" version))
              (sha256
               (base32 "1m1l5dhl1dm2qxhx1i06kwn4bbyjc064kwkpagnqsfi6bc3zz7dk"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list libsrtp))
    (propagated-inputs (list python-cffi))
    (home-page "https://github.com/aiortc/pylibsrtp")
    (synopsis "python bindings for libsrtp")
    (description "Pylibsrtp provides Python bindings for libsrtp, the Secure
Real-time Transport Protocol library used for encrypting and authenticating
RTP/RTCP streams.")
    (license license:bsd-3)))

;; ── 18. python-west ────────────────────────────────────────────────

(define-public python-west
  (package
    (name "python-west")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "west" version))
              (sha256
               (base32 "19fh7rl9ryimdlhai0wxj7ybrxs9j591ricmxvmij1zyk87gx23h"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-colorama python-pyyaml
                             python-pykwalify python-packaging))
    (home-page "https://pypi.org/project/west/")
    (synopsis "Zephyr RTOS meta-tool for workspace and repository management")
    (description "West is the Swiss-army knife command-line tool of the Zephyr
RTOS project.  It manages multiple Git repositories, provides a pluggable
command system, and handles Zephyr workspace configuration.")
    (license license:asl2.0)))

;; ═══════════════════════════════════════════════════════════════════
;; C / shell / data packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 19. pixelserv-tls ──────────────────────────────────────────────

(define-public pixelserv-tls
  (package
    (name "pixelserv-tls")
    (version "2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kvic-z/pixelserv-tls/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "03b88cz1nii2grhagi1jpvv3hr9jb66x254ryf4kavl9risyjdn7"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list openssl))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/kvic-z/pixelserv-tls")
    (synopsis "tiny bespoke HTTP/HTTPS server for ad blocking")
    (description "Pixelserv-tls is a tiny web server that serves a 1x1
transparent GIF pixel for ad-blocking purposes.  It supports both HTTP/1.1
and HTTPS with automatic certificate generation.")
    (license license:lgpl3)))

;; ── 20. lwm-legacy ─────────────────────────────────────────────────

(define-public lwm-legacy
  (package
    (name "lwm-legacy")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/brokenallmute/lwm/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "10a75z0x1dn29mgc4yymn3gj5r76alcvpvlwfsk1sbzjpm957yhv"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list libx11 libxinerama))
    (home-page "https://github.com/brokenallmute/lwm")
    (synopsis "lightweight window manager for X11")
    (description "Lwm is a lightweight window manager for X11 that provides a
clean, minimal interface with no icons, buttons, or title bars.  This is the
legacy version maintained as a fork.")
    (license license:expat)))

;; ── 21. driverctl ──────────────────────────────────────────────────

(define-public driverctl
  (package
    (name "driverctl")
    (version "0.115")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/driverctl/driverctl/-/archive/"
                    version "/driverctl-" version ".tar.gz"))
              (sha256
               (base32 "0x59w867zl38w4akvyr093ib5vc5v6nvp298fzhzfjim0j8zgr74"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "DESTDIR="))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list bash))
    (home-page "https://gitlab.com/driverctl/driverctl")
    (synopsis "device driver control utility for Linux")
    (description "Driverctl is a device driver control utility that allows
overriding the automatic driver selection for specific devices, persisting
across reboots via udev rules.")
    (license license:lgpl2.1)))

;; ── 22. mint-themes ───────────────────────────────────────────���────

(define-public mint-themes
  (package
    (name "mint-themes")
    (version "2.3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmint/mint-themes/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "08mcqrnryjp7ag9cvi9s2b10y6462cavv0v57mb4524jpqqn9qkr"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "DESTDIR=" #$output)
                   "PREFIX=")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://github.com/linuxmint/mint-themes")
    (synopsis "collection of GTK themes from Linux Mint")
    (description "Mint-themes is a collection of GTK2, GTK3, and Cinnamon
desktop themes from the Linux Mint project, including Mint-Y and its dark
and colour variants.")
    (license license:gpl3+)))

;; ── 23. kwin-scripts-krohnkite ─────────────────────────────────────

(define-public kwin-scripts-krohnkite
  (package
    (name "kwin-scripts-krohnkite")
    (version "0.9.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/anametologin/krohnkite/archive/"
                    version ".tar.gz"))
              (sha256
               (base32 "0f714i4mwh3ch6f5sjwxk2g9d0pcyci29djdxnv2c82mddxmv2k1"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("res/" "share/kwin/scripts/krohnkite/"))))
    (home-page "https://codeberg.org/anametologin/krohnkite")
    (synopsis "dynamic tiling extension for KWin")
    (description "Krohnkite is a dynamic tiling extension for KDE's KWin
window manager, providing automatic window tiling with multiple layout
modes including tile, monocle, stacked, and spread layouts.")
    (license license:expat)))

;; ── 24. broadcom-bt-firmware ───────────────────────────────────────

(define-public broadcom-bt-firmware
  (package
    (name "broadcom-bt-firmware")
    (version "12.0.1.1105")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/winterheart/broadcom-bt-firmware"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "04cjlwjbcz34dqfdp0r8sjd4ckivr0h96nnag7vcb8nvxx77by5l"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("brcm/" "lib/firmware/brcm/"))))
    (home-page "https://github.com/winterheart/broadcom-bt-firmware")
    (synopsis "Broadcom Bluetooth firmware files")
    (description "This package provides Bluetooth firmware files for Broadcom
WIDCOMM chipsets, extracted from Microsoft Windows drivers.  These firmware
files are required for Bluetooth functionality on many laptops and devices
with Broadcom wireless hardware.")
    (license (list license:expat
                   (license:non-copyleft
                    "https://github.com/winterheart/broadcom-bt-firmware/blob/master/LICENSE.broadcom_bcm20702"
                    "Broadcom firmware license")))))

;; ── 25. kernel-chktaint ────────────────────────────────────────────

(define-public kernel-chktaint
  (package
    (name "kernel-chktaint")
    (version "6.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds"
                    "/linux.git/plain/tools/debugging/kernel-chktaint"
                    "?h=v" version))
              (file-name (string-append "kernel-chktaint-" version))
              (sha256
               (base32 "16dv4ggkniizbv4xgm7r4f5w80bi16yrkiyzwykxa75bj5zbcv2r"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "kernel-chktaint-" #$version)
                         "bin/kernel-chktaint"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/kernel-chktaint")
                          #o755))))))
    (home-page "https://kernel.org/")
    (synopsis "check kernel for tainted modules")
    (description "Kernel-chktaint is a script from the Linux kernel source tree
that checks and decodes the kernel taint flags, reporting which modules or
conditions have tainted the running kernel.")
    (license license:gpl2)))
