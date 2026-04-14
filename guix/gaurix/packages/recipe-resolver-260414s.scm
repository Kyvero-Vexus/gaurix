;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414s
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 7 recipes created (1 pyproject + 5 binary repacks + 1 cmake source)
;;;   - 4 compat aliases (upstream Guix re-exports)
;;;   - 19 marked NEEDS_RECIPE_DESIGN_EXHAUSTED with specific reasons
;;;
;;; Recipes (7):
;;;   edir, discord-ptb-bin, brave-bin, feather-wallet-bin,
;;;   popcorntime-bin, uno-calculator-bin, wgrib2
;;;
;;; Compat aliases (4):
;;;   handbrake-cli-git → handbrake
;;;   kdenlive-release-git → kdenlive
;;;   rmlint-shredder-git → rmlint
;;;   jami-daemon-git → jami
;;;
;;; All sha256 hashes verified via `guix download`.

(define-module (gaurix packages recipe-resolver-260414s)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages video)
  #:use-module (gnu packages kde-multimedia)
  #:use-module (gnu packages disk)
  #:use-module (gnu packages jami)
  #:export (edir
            discord-ptb-bin
            brave-bin
            feather-wallet-bin
            popcorntime-bin
            uno-calculator-bin
            wgrib2
            handbrake-cli-git
            kdenlive-release-git
            rmlint-shredder-git
            jami-daemon-git))

;;;
;;; --- 1. edir (pyproject-build-system, Python source) ---
;;; Command-line utility to rename, remove, and copy files/directories
;;; using your preferred text editor.
;;; Source: https://github.com/bulletmark/edir
;;; Resolves: #7773 edir (line 59113)
;;;

(define-public edir
  (package
    (name "edir")
    (version "2.35")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bulletmark/edir/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0z0dqyac283d6wp81l4ih4viwg96xxq36g8137qbgn4nwaa65mxh"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite in upstream
    (native-inputs (list python-setuptools-scm))
    (inputs (list python))
    (synopsis "rename, remove, and copy files using your text editor")
    (description "Edir lets you rename, remove, and copy files and directories
using your preferred text editor.  It provides a workflow similar to vidir but
with support for copying, trash integration, and git-awareness.  Files are
listed in your editor and changes are applied when you save and exit.")
    (home-page "https://github.com/bulletmark/edir")
    (license license:gpl3+)))

;;;
;;; --- 2. discord-ptb-bin (copy-build-system, pre-built Electron binary) ---
;;; Discord Public Test Build for Linux.
;;; Source: https://discord.com (official binary)
;;; Resolves: #10663 discord-ptb (line 77896)
;;;

(define-public discord-ptb-bin
  (package
    (name "discord-ptb-bin")
    (version "0.0.186")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ptb.dl2.discordapp.net/apps/linux/"
                    version "/discord-ptb-" version ".tar.gz"))
              (sha256
               (base32
                "1n1i68n4sxiz934yl13n2p3xzc0jsm3xwqpi6a79jmpjqbmq0xrn"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "." "lib/discord-ptb/"
                         #:exclude ("README.md")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (lib (string-append out "/lib/discord-ptb")))
                     (mkdir-p bin)
                     (symlink (string-append lib "/DiscordPTB")
                              (string-append bin "/discord-ptb"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Discord Public Test Build chat client")
    (description "Discord PTB (Public Test Build) is the beta version of
Discord, a proprietary voice, video, and text communication platform.  This
package installs the pre-built Linux binary.")
    (home-page "https://discord.com")
    (license (nonguix-license:nonfree
              "https://discord.com/terms"))))

;;;
;;; --- 3. brave-bin (copy-build-system, pre-built Chromium browser) ---
;;; Privacy-focused Chromium-based web browser.
;;; Source: https://github.com/brave/brave-browser/releases
;;; Resolves: #7724 brave (line 58808)
;;;

(define-public brave-bin
  (package
    (name "brave-bin")
    (version "1.89.132")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/brave/brave-browser/releases/download/"
                    "v" version
                    "/brave-browser-" version "-linux-amd64.zip"))
              (sha256
               (base32
                "1rmr3khwgi27gwkp8xl58586s6l4frwxfvdsq9gplpbx5i0b4ax3"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "." "lib/brave-browser/"
                         #:exclude ("README.md")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (lib (string-append out "/lib/brave-browser")))
                     (mkdir-p bin)
                     (symlink (string-append lib "/brave")
                              (string-append bin "/brave-browser"))))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "privacy-focused Chromium-based web browser")
    (description "Brave is a privacy-focused web browser based on Chromium
with built-in ad and tracker blocking, HTTPS Everywhere, and optional
Tor integration.  This package installs the pre-built Linux binary.")
    (home-page "https://brave.com")
    (license license:mpl2.0)))

;;;
;;; --- 4. feather-wallet-bin (copy-build-system, pre-built Monero wallet) ---
;;; Free and open-source Monero desktop wallet.
;;; Source: https://github.com/feather-wallet/feather/releases
;;; Resolves: #11076 feather-wallet (line 80772)
;;;

(define-public feather-wallet-bin
  (package
    (name "feather-wallet-bin")
    (version "2.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/feather-wallet/feather/releases/download/"
                    version "/feather-" version "-linux.zip"))
              (sha256
               (base32
                "0rn4cjyvbsjxfsgrmqwqd7hfp4qmgm21891wvmd7bxs3jizcaya7"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "feather" "bin/feather-wallet"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/feather-wallet")
                          #o755))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "free and open-source Monero desktop wallet")
    (description "Feather Wallet is a free and open-source Monero desktop
wallet with a focus on privacy, security, and usability.  It supports
hardware wallets, coin control, and built-in Tor connectivity.  This package
installs the pre-built Linux binary.")
    (home-page "https://featherwallet.org")
    (license license:bsd-3)))

;;;
;;; --- 5. popcorntime-bin (copy-build-system, pre-built media AppImage) ---
;;; Multi-platform, free software BitTorrent client with integrated media player.
;;; Source: https://github.com/popcorn-time-ru/popcorn-desktop/releases
;;; Resolves: #7767 popcorntime (line 59078)
;;;

(define-public popcorntime-bin
  (package
    (name "popcorntime-bin")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/popcorn-time-ru/popcorn-desktop/"
                    "releases/download/v" version
                    "/Popcorn-Time-" version "-linux64.AppImage"))
              (sha256
               (base32
                "0ygx7anmv2y6rz1jdl01d7aqb4fmjfa6035q6qf743arx3c5jr9x"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list (string-append "Popcorn-Time-" #$version
                                        "-linux64.AppImage")
                         "bin/popcorntime"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source
                              (string-append "Popcorn-Time-" #$version
                                             "-linux64.AppImage"))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/popcorntime")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "BitTorrent streaming media player")
    (description "Popcorn Time is a multi-platform, free software BitTorrent
client that includes an integrated media player.  It streams video content
from torrent sources directly.  This package installs the pre-built Linux
AppImage binary.")
    (home-page "https://github.com/popcorn-time-ru/popcorn-desktop")
    (license license:gpl3)))

;;;
;;; --- 6. uno-calculator-bin (copy-build-system, pre-built AppImage) ---
;;; Windows Calculator port via Uno Platform for Linux.
;;; Source: https://github.com/nickvisionapps/calculator (Uno Platform)
;;; Resolves: #10768 uno-calculator-bin (line 78668)
;;;

(define-public uno-calculator-bin
  (package
    (name "uno-calculator-bin")
    (version "1.2.4-uno.725")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/unoplatform/calculator/"
                    "releases/download/" version
                    "/uno-calculator-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0k7m6myf37i1phr88fhqnjgklixws6k77my3pp8032l8904xn96l"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list (string-append "uno-calculator-" #$version
                                        "-x86_64.AppImage")
                         "bin/uno-calculator"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source
                              (string-append "uno-calculator-" #$version
                                             "-x86_64.AppImage"))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/uno-calculator")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Windows Calculator port for Linux via Uno Platform")
    (description "Uno Calculator is a port of the Windows Calculator
application to Linux using the Uno Platform.  It provides standard,
scientific, programmer, and date calculation modes.  This package installs
the pre-built Linux AppImage binary.")
    (home-page "https://github.com/unoplatform/calculator")
    (license license:expat)))

;;;
;;; --- 7. wgrib2 (cmake-build-system, C source) ---
;;; GRIB2 meteorological data manipulation utility from NOAA.
;;; Source: https://github.com/NOAA-EMC/wgrib2
;;; Resolves: #7728 wgrib2 (line 58833)
;;;

(define-public wgrib2
  (package
    (name "wgrib2")
    (version "3.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/NOAA-EMC/wgrib2/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0m0chcsnl019gnxkbcz6nchv56d2iyv0p67hfmy4b9bdlfnypyir"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite provided
           #:configure-flags
           #~(list "-DUSE_NETCDF4=OFF"
                   "-DUSE_AEC=OFF"
                   "-DUSE_IPOLATES=OFF")))
    (synopsis "GRIB2 weather data manipulation utility")
    (description "Wgrib2 is a command-line utility from NOAA/NCEP for reading,
writing, and manipulating GRIB2 (GRIdded Binary edition 2) meteorological data
files.  It supports inventory listing, data extraction, format conversion,
and various grid operations used in weather and climate data processing.")
    (home-page "https://github.com/NOAA-EMC/wgrib2")
    (license (license:non-copyleft
              "file://LICENSE"
              "US government work in the public domain"))))

;;;
;;; --- Compat aliases ---
;;; Re-exports of upstream Guix packages under AUR-compatible names.
;;;

(define-public handbrake-cli-git
  (package (inherit handbrake) (name "handbrake-cli-git")))

(define-public kdenlive-release-git
  (package (inherit kdenlive) (name "kdenlive-release-git")))

(define-public rmlint-shredder-git
  (package (inherit rmlint) (name "rmlint-shredder-git")))

(define-public jami-daemon-git
  (package (inherit jami) (name "jami-daemon-git")))
