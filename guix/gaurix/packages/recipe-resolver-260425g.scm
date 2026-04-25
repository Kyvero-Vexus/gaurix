;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260425g
;;; Resolves 100 packages (99 recipes, 1 blocked).
;;;
;;; New recipes (99):
;;;      1.  silos (gnu-build-system, v0.2.9, gpl3+)
;;;      2.  audiotube-git (cmake-build-system, v24.05.0.r26.gd9b1902, gpl2+)
;;;      3.  libdsk (gnu-build-system, v1.5.21, #f)
;;;      4.  eiffelstudio-bin (copy-build-system, v25.02.98732, gpl3+)
;;;      5.  cockroachdb-bin (copy-build-system, v26.1.3, #f)
;;;      6.  expressvpn-gui (gnu-build-system, v0.6.10, #f)
;;;      7.  openxr-utils-git (cmake-build-system, v1.1.38.r0.g650f751, asl2.0)
;;;      8.  python-elgato-streamdeck (pyproject-build-system, v0.9.8, expat)
;;;      9.  libicu53 (gnu-build-system, v53.2, #f)
;;;     10.  fawkes-bin (copy-build-system, v1.0, bsd-3)
;;;     11.  netkit-telnet-ssl (cmake-build-system, v0.17.41.really0.17.r7, bsd-3)
;;;     12.  ibus-bamboo-git (go-build-system, v0.8.4.rc6+35+g1ee8288, gpl3+)
;;;     13.  goredo (gnu-build-system, v2.9.1, gpl3+)
;;;     14.  circumflex (go-build-system, v3.9, #f)
;;;     15.  tabaur-bin (copy-build-system, v0.6.9, gpl2+)
;;;     16.  python-exif (pyproject-build-system, v1.6.1, expat)
;;;     17.  pdfium-binaries (cmake-build-system, v7749, asl2.0)
;;;     18.  opentrace-bin (copy-build-system, v1.5.1, gpl3)
;;;     19.  saveland (gnu-build-system, v0.1.0, expat)
;;;     20.  ruby-oauth-tty (ruby-build-system, v1.0.6, expat)
;;;     21.  pythowo (gnu-build-system, v1.0, expat)
;;;     22.  python-qiskit-ibm-transpiler (pyproject-build-system, v0.13.1, asl2.0)
;;;     23.  python-qiskit-addon-utils (pyproject-build-system, v0.3.1, asl2.0)
;;;     24.  pdfium-binaries-v8-bin (copy-build-system, v7749, asl2.0)
;;;     25.  pdfium-binaries-v8 (cmake-build-system, v7749, asl2.0)
;;;     26.  pass-index-git (gnu-build-system, vr6.2c162df, asl2.0)
;;;     27.  nora-bin (copy-build-system, v3.1.0_stable, expat)
;;;     28.  mstflint425 (gnu-build-system, v4.25.0.1, #f)
;;;     29.  libreoffice-extension-citequran (gnu-build-system, v3.0, gpl3+)
;;;     30.  kometa (gnu-build-system, v2.3.1, expat)
;;;     31.  encrypt0r-bin (copy-build-system, v3.12.68, expat)
;;;     32.  dsnet (go-build-system, v0.8.1, expat)
;;;     33.  cherryctl (go-build-system, v0.9.0, mpl2.0)
;;;     34.  bonk (go-build-system, v1.1.0, expat)
;;;     35.  oda-file-converter (cmake-build-system, v27.1, #f)
;;;     36.  dbgl (copy-build-system, v0.99, gpl3+)
;;;     37.  qv2ray (cmake-build-system, v2.7.0, gpl3+)
;;;     38.  eg (gnu-build-system, v1.2.3, expat)
;;;     39.  timelineproject-hg (gnu-build-system, v2.10.0.r7971, gpl3+)
;;;     40.  sftpgo-bin (copy-build-system, v2.7.1, #f)
;;;     41.  fancytasks (gnu-build-system, v1.1.5, gpl3+)
;;;     42.  didyoumean (cargo-build-system, v1.1.4, gpl3+)
;;;     43.  weechat-matrix-rs-git (cargo-build-system, vr405.2b093a7, isc)
;;;     44.  python-djlint (pyproject-build-system, v1.36.4, gpl3+)
;;;     45.  patat-bin (copy-build-system, v0.15.2.0, gpl2+)
;;;     46.  monotone (gnu-build-system, v1.1, gpl3+)
;;;     47.  hawck-git (meson-build-system, v20240108, bsd-3)
;;;     48.  browserpass-chrome (gnu-build-system, v3.10.2, isc)
;;;     49.  sleek-bin (copy-build-system, v2.0.25, expat)
;;;     50.  gcfscape (gnu-build-system, v1.8.6, #f)
;;;     51.  fusee-interfacee-tk-bin (copy-build-system, v1.0.1, gpl2+)
;;;     52.  surface-uefi-firmware-git (gnu-build-system, vr52.47a687f, #f)
;;;     53.  python3-synapse-s3-storage-provider (pyproject-build-system, v1.6.0, asl2.0)
;;;     54.  python-syncthing (pyproject-build-system, v2.4.2, expat)
;;;     55.  nullpomino-git (gnu-build-system, vv7.5.0.r126.gfd8d758, bsd-3)
;;;     56.  moc-lyrics-git (gnu-build-system, v0.2213.c51e02e, gpl3+)
;;;     57.  johnnydep (gnu-build-system, v1.20.6, expat)
;;;     58.  gxr (meson-build-system, v0.16.0, expat)
;;;     59.  gulkan (meson-build-system, v0.16.0, expat)
;;;     60.  cdhist (gnu-build-system, v4.5, gpl3+)
;;;     61.  wox-bin (copy-build-system, v2.0.0_beta.5, gpl3+)
;;;     62.  vscodius-bin (copy-build-system, v1.98.2, expat)
;;;     63.  universal-pause (gnu-build-system, v2.0, expat)
;;;     64.  timr-bin (copy-build-system, v1.8.1, expat)
;;;     65.  servicer-bin (copy-build-system, v0.1.13, expat)
;;;     66.  rofi-notion (gnu-build-system, v2.1.2, expat)
;;;     67.  python-wolkenbruch (pyproject-build-system, v0.8.1, gpl3+)
;;;     68.  python-vadersentiment (pyproject-build-system, v3.3.2, expat)
;;;     69.  python-qiskit-addon-cutting (pyproject-build-system, v0.10.0, asl2.0)
;;;     70.  python-pyrosm (pyproject-build-system, v0.6.2, expat)
;;;     71.  python-pyrobuf (pyproject-build-system, v0.9.3, asl2.0)
;;;     72.  python-pyarrow-stubs (pyproject-build-system, v17.17, bsd-2)
;;;     73.  python-papis-python-rofi (pyproject-build-system, v1.0.3, gpl3+)
;;;     74.  python-osmnet (pyproject-build-system, v0.1.7, agpl3)
;;;     75.  python-mov-cli-youtube (pyproject-build-system, v1.3.8, expat)
;;;     76.  python-mov-cli-test (pyproject-build-system, v1.1.7, expat)
;;;     77.  python-kasa (pyproject-build-system, v0.9.1, gpl3+)
;;;     78.  python-dhash (pyproject-build-system, v1.4, expat)
;;;     79.  python-devgoldyutils (pyproject-build-system, v3.0.0, expat)
;;;     80.  pupu-bin (copy-build-system, v0.1.4, expat)
;;;     81.  papis-rofi-git (gnu-build-system, v0.2.0.r25.b74eea0, gpl3+)
;;;     82.  papis-dmenu (gnu-build-system, v0.3, #f)
;;;     83.  notion-desktop-git (copy-build-system, v1.1.0.r2.g1eb5f30, expat)
;;;     84.  neovim-nightly (cmake-build-system, v0.13.0.r270.g32e249dfa6, asl2.0)
;;;     85.  mov-cli (gnu-build-system, v4.4.19, expat)
;;;     86.  memos (go-build-system, v0.25.3, expat)
;;;     87.  mangadesk (go-build-system, v0.7.8, expat)
;;;     88.  linux-timemachine (gnu-build-system, v1.3.2, expat)
;;;     89.  libreoffice-extension-ayaspell (gnu-build-system, v3.5, gpl2+)
;;;     90.  librdp (cargo-build-system, v0.15.0, expat)
;;;     91.  kalico-git (gnu-build-system, vr5899.f26c79c77, gpl3+)
;;;     92.  kalico (gnu-build-system, v0.12.0, gpl3+)
;;;     93.  fs2es-indexer (gnu-build-system, v0.6.0, #f)
;;;     94.  dotdev-git (go-build-system, v0.0.1.20250224.01.r11.89cbf87, gpl3+)
;;;     95.  darkmark-git (cmake-build-system, v1.10.18, gpl3+)
;;;     96.  darkhelp-git (cmake-build-system, v1.9.6, expat)
;;;     97.  compiler-rt17 (cmake-build-system, v17.0.6, #f)
;;;     98.  cleanarch (gnu-build-system, v0.0.1, expat)
;;;     99.  clang17 (cmake-build-system, v17.0.6, #f)
;;;
;;; BLOCKED (1):
;;;      1.  gbm -- DEP_RESOLUTION_FAILED
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.
(define-module (gaurix packages recipe-resolver-260425g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system ruby)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            silos
            audiotube-git
            libdsk
            eiffelstudio-bin
            cockroachdb-bin
            expressvpn-gui
            openxr-utils-git
            python-elgato-streamdeck
            libicu53
            fawkes-bin
            netkit-telnet-ssl
            ibus-bamboo-git
            goredo
            circumflex
            tabaur-bin
            python-exif
            pdfium-binaries
            opentrace-bin
            saveland
            ruby-oauth-tty
            pythowo
            python-qiskit-ibm-transpiler
            python-qiskit-addon-utils
            pdfium-binaries-v8-bin
            pdfium-binaries-v8
            pass-index-git
            nora-bin
            mstflint425
            libreoffice-extension-citequran
            kometa
            encrypt0r-bin
            dsnet
            cherryctl
            bonk
            oda-file-converter
            dbgl
            qv2ray
            eg
            timelineproject-hg
            sftpgo-bin
            fancytasks
            didyoumean
            weechat-matrix-rs-git
            python-djlint
            patat-bin
            monotone
            hawck-git
            browserpass-chrome
            sleek-bin
            gcfscape
            fusee-interfacee-tk-bin
            surface-uefi-firmware-git
            python3-synapse-s3-storage-provider
            python-syncthing
            nullpomino-git
            moc-lyrics-git
            johnnydep
            gxr
            gulkan
            cdhist
            wox-bin
            vscodius-bin
            universal-pause
            timr-bin
            servicer-bin
            rofi-notion
            python-wolkenbruch
            python-vadersentiment
            python-qiskit-addon-cutting
            python-pyrosm
            python-pyrobuf
            python-pyarrow-stubs
            python-papis-python-rofi
            python-osmnet
            python-mov-cli-youtube
            python-mov-cli-test
            python-kasa
            python-dhash
            python-devgoldyutils
            pupu-bin
            papis-rofi-git
            papis-dmenu
            notion-desktop-git
            neovim-nightly
            mov-cli
            memos
            mangadesk
            linux-timemachine
            libreoffice-extension-ayaspell
            librdp
            kalico-git
            kalico
            fs2es-indexer
            dotdev-git
            darkmark-git
            darkhelp-git
            compiler-rt17
            cleanarch
            clang17
            ))

;;; Nonfree/proprietary packages use (license #f) per repo convention.

;;; ===================================================================
;;; 1. silos
;;; ===================================================================
;;; Source: https://github.com/intersimone999/pyqtws
;;; Web-app container, with multimedia apps (YouTube, Netflix, Twitch, VVVVID, and R

(define-public silos
  (package
    (name "silos")
    (version "0.2.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/intersimone999/pyqtws/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/intersimone999/pyqtws")
    (synopsis "web-app container, with multimedia apps (YouTube, Netflix, Twitch, VVVVID, and")
    (description "Web-app container, with multimedia apps (YouTube, Netflix, Twitch, VVVVID, and RaiPlay), productivity suites (Microsoft Office 365, Skype, Google Office, Trello, and Gmail), and others (WhatsApp web and Wikipedia)")
    (license license:gpl3+)))

;;; ===================================================================
;;; 2. audiotube-git
;;; ===================================================================
;;; Source: https://invent.kde.org/multimedia/audiotube
;;; Client for YouTube Music

(define-public audiotube-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "audiotube-git")
      (version (git-version "24.05.0.r26.gd9b1902" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://invent.kde.org/multimedia/audiotube")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://invent.kde.org/multimedia/audiotube")
      (synopsis "client for YouTube Music")
      (description "Client for YouTube Music")
      (license license:gpl2+))))

;;; ===================================================================
;;; 3. libdsk
;;; ===================================================================
;;; Source: http://www.seasip.info/Unix/LibDsk/index.html
;;; A library for accessing floppy drive and disc images files

(define-public libdsk
  (package
    (name "libdsk")
    (version "1.5.21")
    (source (origin
              (method url-fetch)
              (uri "http://www.seasip.info/Unix/LibDsk/index.html")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.seasip.info/Unix/LibDsk/index.html")
    (synopsis "A library for accessing floppy drive and disc images files")
    (description "A library for accessing floppy drive and disc images files")
    (license #f)))

;;; ===================================================================
;;; 4. eiffelstudio-bin
;;; ===================================================================
;;; Source: https://www.eiffel.org/downloads
;;; IDE for the Eiffel programming language (opensource edition)

(define-public eiffelstudio-bin
  (package
    (name "eiffelstudio-bin")
    (version "25.02.98732")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.eiffel.org/downloads/releases/download/v" version "/eiffelstudio-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/eiffelstudio-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.eiffel.org/downloads")
    (synopsis "IDE for the Eiffel programming language (opensource edition)")
    (description "IDE for the Eiffel programming language (opensource edition)")
    (license license:gpl3+)))

;;; ===================================================================
;;; 5. cockroachdb-bin
;;; ===================================================================
;;; Source: https://www.cockroachlabs.com
;;; Cloud-native, distributed SQL database

(define-public cockroachdb-bin
  (package
    (name "cockroachdb-bin")
    (version "26.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.cockroachlabs.com/releases/download/v" version "/cockroachdb-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cockroachdb-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.cockroachlabs.com")
    (synopsis "cloud-native, distributed SQL database")
    (description "Cloud-native, distributed SQL database")
    (license #f)))

;;; ===================================================================
;;; 6. expressvpn-gui
;;; ===================================================================
;;; Source: https://gitlab.com/vojko.pribudic/expressvpn-gui
;;; Unofficial linux GUI for expressvpn CLI (Qt)

(define-public expressvpn-gui
  (package
    (name "expressvpn-gui")
    (version "0.6.10")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.com/vojko.pribudic/expressvpn-gui")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/vojko.pribudic/expressvpn-gui")
    (synopsis "unofficial linux GUI for expressvpn CLI (Qt)")
    (description "Unofficial linux GUI for expressvpn CLI (Qt)")
    (license #f)))

;;; ===================================================================
;;; 7. openxr-utils-git
;;; ===================================================================
;;; Source: https://github.com/KhronosGroup/OpenXR-SDK-Source
;;; OpenXR Utils: hello_xr, runtime_list

(define-public openxr-utils-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "openxr-utils-git")
      (version (git-version "1.1.38.r0.g650f751" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/KhronosGroup/OpenXR-SDK-Source")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/KhronosGroup/OpenXR-SDK-Source")
      (synopsis "OpenXR Utils: hello_xr, runtime_list")
      (description "OpenXR Utils: hello_xr, runtime_list")
      (license license:asl2.0))))

;;; ===================================================================
;;; 8. python-elgato-streamdeck
;;; ===================================================================
;;; Source: https://github.com/abcminiuser/python-elgato-streamdeck
;;; Library to control Elgato Stream Deck devices

(define-public python-elgato-streamdeck
  (package
    (name "python-elgato-streamdeck")
    (version "0.9.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/e/elgato-streamdeck/elgato-streamdeck-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/abcminiuser/python-elgato-streamdeck")
    (synopsis "library to control Elgato Stream Deck devices")
    (description "Library to control Elgato Stream Deck devices")
    (license license:expat)))

;;; ===================================================================
;;; 9. libicu53
;;; ===================================================================
;;; Source: https://icu.unicode.org
;;; International Components for Unicode library (version 53)

(define-public libicu53
  (package
    (name "libicu53")
    (version "53.2")
    (source (origin
              (method url-fetch)
              (uri "https://icu.unicode.org")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://icu.unicode.org")
    (synopsis "international Components for Unicode library (version 53)")
    (description "International Components for Unicode library (version 53)")
    (license #f)))

;;; ===================================================================
;;; 10. fawkes-bin
;;; ===================================================================
;;; Source: https://sandlab.cs.uchicago.edu/fawkes/
;;; Image cloaking tool for personal privacy

(define-public fawkes-bin
  (package
    (name "fawkes-bin")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sandlab.cs.uchicago.edu/fawkes//releases/download/v" version "/fawkes-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fawkes-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sandlab.cs.uchicago.edu/fawkes/")
    (synopsis "image cloaking tool for personal privacy")
    (description "Image cloaking tool for personal privacy")
    (license license:bsd-3)))

;;; ===================================================================
;;; 11. netkit-telnet-ssl
;;; ===================================================================
;;; Source: https://salsa.debian.org/debian/netkit-telnet-ssl
;;; Telnet client and server with TLS support (Debian Netkit version)

(define-public netkit-telnet-ssl
  (package
    (name "netkit-telnet-ssl")
    (version "0.17.41.really0.17.r7")
    (source (origin
              (method url-fetch)
              (uri "https://salsa.debian.org/debian/netkit-telnet-ssl")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://salsa.debian.org/debian/netkit-telnet-ssl")
    (synopsis "telnet client and server with TLS support (Debian Netkit version)")
    (description "Telnet client and server with TLS support (Debian Netkit version)")
    (license license:bsd-3)))

;;; ===================================================================
;;; 12. ibus-bamboo-git
;;; ===================================================================
;;; Source: https://github.com/BambooEngine/ibus-bamboo
;;; A Vietnamese IME for IBus

(define-public ibus-bamboo-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "ibus-bamboo-git")
      (version (git-version "0.8.4.rc6+35+g1ee8288" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BambooEngine/ibus-bamboo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/BambooEngine/ibus-bamboo")
      (synopsis "A Vietnamese IME for IBus")
      (description "A Vietnamese IME for IBus")
      (license license:gpl3+))))

;;; ===================================================================
;;; 13. goredo
;;; ===================================================================
;;; Source: http://www.goredo.cypherpunks.su/
;;; Go implementation of djb's redo, a Makefile replacement that sucks less

(define-public goredo
  (package
    (name "goredo")
    (version "2.9.1")
    (source (origin
              (method url-fetch)
              (uri "http://www.goredo.cypherpunks.su/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.goredo.cypherpunks.su/")
    (synopsis "Go implementation of djb's redo, a Makefile replacement that sucks less")
    (description "Go implementation of djb's redo, a Makefile replacement that sucks less")
    (license license:gpl3+)))

;;; ===================================================================
;;; 14. circumflex
;;; ===================================================================
;;; Source: https://github.com/bensadeh/circumflex
;;; A command line tool for browsing Hacker News in your terminal

(define-public circumflex
  (package
    (name "circumflex")
    (version "3.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bensadeh/circumflex/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/bensadeh/circumflex")
    (synopsis "A command line tool for browsing Hacker News in your terminal")
    (description "A command line tool for browsing Hacker News in your terminal")
    (license #f)))

;;; ===================================================================
;;; 15. tabaur-bin
;;; ===================================================================
;;; Source: https://github.com/BurntRanch/TabAUR
;;; A customizable and lightweight AUR helper, designed to be simple but powerful.

(define-public tabaur-bin
  (package
    (name "tabaur-bin")
    (version "0.6.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/BurntRanch/TabAUR/releases/download/v" version "/tabaur-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tabaur-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/BurntRanch/TabAUR")
    (synopsis "A customizable and lightweight AUR helper, designed to be simple but powerful")
    (description "A customizable and lightweight AUR helper, designed to be simple but powerful.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 16. python-exif
;;; ===================================================================
;;; Source: https://gitlab.com/TNThieding/exif
;;; Read and modify image EXIF metadata

(define-public python-exif
  (package
    (name "python-exif")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/e/exif/exif-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/TNThieding/exif")
    (synopsis "read and modify image EXIF metadata")
    (description "Read and modify image EXIF metadata")
    (license license:expat)))

;;; ===================================================================
;;; 17. pdfium-binaries
;;; ===================================================================
;;; Source: https://github.com/bblanchon/pdfium-binaries
;;; PDFium binaries built with scripts from pdfium-binaries

(define-public pdfium-binaries
  (package
    (name "pdfium-binaries")
    (version "7749")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bblanchon/pdfium-binaries/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/bblanchon/pdfium-binaries")
    (synopsis "PDFium binaries built with scripts from pdfium-binaries")
    (description "PDFium binaries built with scripts from pdfium-binaries")
    (license license:asl2.0)))

;;; ===================================================================
;;; 18. opentrace-bin
;;; ===================================================================
;;; Source: https://github.com/Archeb/opentrace
;;; A cross-platform GUI wrapper for NextTrace. Bringing you the familiar traceroute

(define-public opentrace-bin
  (package
    (name "opentrace-bin")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Archeb/opentrace/releases/download/v" version "/opentrace-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/opentrace-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Archeb/opentrace")
    (synopsis "A cross-platform GUI wrapper for NextTrace. Bringing you the familiar tracerou")
    (description "A cross-platform GUI wrapper for NextTrace. Bringing you the familiar traceroute experience.")
    (license license:gpl3)))

;;; ===================================================================
;;; 19. saveland
;;; ===================================================================
;;; Source: https://github.com/MAX-786/saveland
;;; Save and restore window layouts in Hyprland

(define-public saveland
  (package
    (name "saveland")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/MAX-786/saveland/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/MAX-786/saveland")
    (synopsis "save and restore window layouts in Hyprland")
    (description "Save and restore window layouts in Hyprland")
    (license license:expat)))

;;; ===================================================================
;;; 20. ruby-oauth-tty
;;; ===================================================================
;;; Source: https://gitlab.com/oauth-xx/oauth-tty/
;;; OAuth 1.0 TTY Command Line Interface

(define-public ruby-oauth-tty
  (package
    (name "ruby-oauth-tty")
    (version "1.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.com/oauth-xx/oauth-tty/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/oauth-xx/oauth-tty/")
    (synopsis "oAuth 1.0 TTY Command Line Interface")
    (description "OAuth 1.0 TTY Command Line Interface")
    (license license:expat)))

;;; ===================================================================
;;; 21. pythowo
;;; ===================================================================
;;; Source: https://github.com/virejdasani/pythOwO
;;; an UwU programming language

(define-public pythowo
  (package
    (name "pythowo")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/virejdasani/pythOwO/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/virejdasani/pythOwO")
    (synopsis "an UwU programming language")
    (description "an UwU programming language")
    (license license:expat)))

;;; ===================================================================
;;; 22. python-qiskit-ibm-transpiler
;;; ===================================================================
;;; Source: https://github.com/Qiskit/qiskit-ibm-transpiler
;;; A library to use the Qiskit Transpiler Service and the AI-powered transpiler pas

(define-public python-qiskit-ibm-transpiler
  (package
    (name "python-qiskit-ibm-transpiler")
    (version "0.13.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/q/qiskit-ibm-transpiler/qiskit-ibm-transpiler-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Qiskit/qiskit-ibm-transpiler")
    (synopsis "A library to use the Qiskit Transpiler Service and the AI-powered transpiler p")
    (description "A library to use the Qiskit Transpiler Service and the AI-powered transpiler passes")
    (license license:asl2.0)))

;;; ===================================================================
;;; 23. python-qiskit-addon-utils
;;; ===================================================================
;;; Source: https://github.com/Qiskit/qiskit-addon-utils/
;;; Utilities to support workflows leveraging Qiskit addons

(define-public python-qiskit-addon-utils
  (package
    (name "python-qiskit-addon-utils")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/q/qiskit-addon-utils/qiskit-addon-utils-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Qiskit/qiskit-addon-utils/")
    (synopsis "utilities to support workflows leveraging Qiskit addons")
    (description "Utilities to support workflows leveraging Qiskit addons")
    (license license:asl2.0)))

;;; ===================================================================
;;; 24. pdfium-binaries-v8-bin
;;; ===================================================================
;;; Source: https://github.com/bblanchon/pdfium-binaries
;;; PDFium binaries built with scripts from pdfium-binaries

(define-public pdfium-binaries-v8-bin
  (package
    (name "pdfium-binaries-v8-bin")
    (version "7749")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bblanchon/pdfium-binaries/releases/download/v" version "/pdfiumaries-v8-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pdfium-binaries-v8-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bblanchon/pdfium-binaries")
    (synopsis "PDFium binaries built with scripts from pdfium-binaries")
    (description "PDFium binaries built with scripts from pdfium-binaries")
    (license license:asl2.0)))

;;; ===================================================================
;;; 25. pdfium-binaries-v8
;;; ===================================================================
;;; Source: https://github.com/bblanchon/pdfium-binaries
;;; PDFium binaries with V8 and XFA built with scripts from pdfium-binaries

(define-public pdfium-binaries-v8
  (package
    (name "pdfium-binaries-v8")
    (version "7749")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bblanchon/pdfium-binaries/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/bblanchon/pdfium-binaries")
    (synopsis "PDFium binaries with V8 and XFA built with scripts from pdfium-binaries")
    (description "PDFium binaries with V8 and XFA built with scripts from pdfium-binaries")
    (license license:asl2.0)))

;;; ===================================================================
;;; 26. pass-index-git
;;; ===================================================================
;;; Source: https://github.com/sboesebeck/pass-index
;;; An "index" to speed up content search for pass - the standard unix password stor

(define-public pass-index-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "pass-index-git")
      (version (git-version "r6.2c162df" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sboesebeck/pass-index")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/sboesebeck/pass-index")
      (synopsis "An \"index\" to speed up content search for pass - the standard unix password ")
      (description "An \"index\" to speed up content search for pass - the standard unix password store")
      (license license:asl2.0))))

;;; ===================================================================
;;; 27. nora-bin
;;; ===================================================================
;;; Source: https://noramusic.netlify.app/
;;; An elegant music player built using Electron and React. Inspired by Oto Music fo

(define-public nora-bin
  (package
    (name "nora-bin")
    (version "3.1.0_stable")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://noramusic.netlify.app//releases/download/v" version "/nora-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nora-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://noramusic.netlify.app/")
    (synopsis "An elegant music player built using Electron and React. Inspired by Oto Music ")
    (description "An elegant music player built using Electron and React. Inspired by Oto Music for Android by Piyush Mamidwar.(Prebuilt version.Use system-wide electron)")
    (license license:expat)))

;;; ===================================================================
;;; 28. mstflint425
;;; ===================================================================
;;; Source: https://github.com/Mellanox/mstflint
;;; Open-source version of MFT (Mellanox Firmware Tools) - old version for ConnectX-

(define-public mstflint425
  (package
    (name "mstflint425")
    (version "4.25.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Mellanox/mstflint/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Mellanox/mstflint")
    (synopsis "open-source version of MFT (Mellanox Firmware Tools) - old version for Connect")
    (description "Open-source version of MFT (Mellanox Firmware Tools) - old version for ConnectX-3 Pro")
    (license #f)))

;;; ===================================================================
;;; 29. libreoffice-extension-citequran
;;; ===================================================================
;;; Source: https://github.com/cdjalel/CiteQuran
;;; CiteQuran is a LibreOffice extension that allows you to Cite the Holy Quran in y

(define-public libreoffice-extension-citequran
  (package
    (name "libreoffice-extension-citequran")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/cdjalel/CiteQuran/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/cdjalel/CiteQuran")
    (synopsis "citeQuran is a LibreOffice extension that allows you to Cite the Holy Quran in")
    (description "CiteQuran is a LibreOffice extension that allows you to Cite the Holy Quran in your Writer document without errors and with proper Arabic fonts.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 30. kometa
;;; ===================================================================
;;; Source: https://kometa.wiki
;;; A powerful tool designed to give you complete control over your Plex media libra

(define-public kometa
  (package
    (name "kometa")
    (version "2.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://kometa.wiki")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://kometa.wiki")
    (synopsis "A powerful tool designed to give you complete control over your Plex media lib")
    (description "A powerful tool designed to give you complete control over your Plex media libraries.")
    (license license:expat)))

;;; ===================================================================
;;; 31. encrypt0r-bin
;;; ===================================================================
;;; Source: https://www.kunalnagar.in/blog/encryptor-encrypt-decrypt-files-passphrase/
;;; App to encrypt and decrypt your files with a passphrase, powered by electron.(Pr

(define-public encrypt0r-bin
  (package
    (name "encrypt0r-bin")
    (version "3.12.68")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.kunalnagar.in/blog/encryptor-encrypt-decrypt-files-passphrase//releases/download/v" version "/encrypt0r-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/encrypt0r-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.kunalnagar.in/blog/encryptor-encrypt-decrypt-files-passphrase/")
    (synopsis "app to encrypt and decrypt your files with a passphrase, powered by electron.(")
    (description "App to encrypt and decrypt your files with a passphrase, powered by electron.(Prebuilt version.Use system-wide electron)")
    (license license:expat)))

;;; ===================================================================
;;; 32. dsnet
;;; ===================================================================
;;; Source: https://github.com/naggie/dsnet
;;; Simple command to manage a centralised wireguard VPN.

(define-public dsnet
  (package
    (name "dsnet")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/naggie/dsnet/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/naggie/dsnet")
    (synopsis "simple command to manage a centralised wireguard VPN")
    (description "Simple command to manage a centralised wireguard VPN.")
    (license license:expat)))

;;; ===================================================================
;;; 33. cherryctl
;;; ===================================================================
;;; Source: https://github.com/cherryservers/cherryctl
;;; Cherry Servers CLI for managing cloud infrastructure

(define-public cherryctl
  (package
    (name "cherryctl")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/cherryservers/cherryctl/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/cherryservers/cherryctl")
    (synopsis "cherry Servers CLI for managing cloud infrastructure")
    (description "Cherry Servers CLI for managing cloud infrastructure")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 34. bonk
;;; ===================================================================
;;; Source: https://github.com/KingJorjai/BONK
;;; A mighty command-line tool for bonking your friends, enemies, or inanimate objec

(define-public bonk
  (package
    (name "bonk")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/KingJorjai/BONK/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/KingJorjai/BONK")
    (synopsis "A mighty command-line tool for bonking your friends, enemies, or inanimate obj")
    (description "A mighty command-line tool for bonking your friends, enemies, or inanimate objects! Keep track of exactly how many times you've bonked anything with persistent cloud-based bonking statistics.")
    (license license:expat)))

;;; ===================================================================
;;; 35. oda-file-converter
;;; ===================================================================
;;; Source: https://www.opendesign.com/guestfiles/oda_file_converter
;;; Converts files between the .dwg and .dxf file formats

(define-public oda-file-converter
  (package
    (name "oda-file-converter")
    (version "27.1")
    (source (origin
              (method url-fetch)
              (uri "https://www.opendesign.com/guestfiles/oda_file_converter")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.opendesign.com/guestfiles/oda_file_converter")
    (synopsis "converts files between the .dwg and .dxf file formats")
    (description "Converts files between the .dwg and .dxf file formats")
    (license #f)))

;;; ===================================================================
;;; 36. dbgl
;;; ===================================================================
;;; Source: https://dbgl.org/
;;; An open-source, free, multi-platform frontend for DOSBox

(define-public dbgl
  (package
    (name "dbgl")
    (version "0.99")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dbgl.org//releases/download/v" version "/dbgl-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dbgl/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dbgl.org/")
    (synopsis "An open-source, free, multi-platform frontend for DOSBox")
    (description "An open-source, free, multi-platform frontend for DOSBox")
    (license license:gpl3+)))

;;; ===================================================================
;;; 37. qv2ray
;;; ===================================================================
;;; Source: https://github.com/Qv2ray/Qv2ray
;;; Cross-platform V2ray Client written in Qt (Stable Release)

(define-public qv2ray
  (package
    (name "qv2ray")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Qv2ray/Qv2ray/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Qv2ray/Qv2ray")
    (synopsis "cross-platform V2ray Client written in Qt (Stable Release)")
    (description "Cross-platform V2ray Client written in Qt (Stable Release)")
    (license license:gpl3+)))

;;; ===================================================================
;;; 38. eg
;;; ===================================================================
;;; Source: https://github.com/srsudar/eg
;;; Useful examples at the command line

(define-public eg
  (package
    (name "eg")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/srsudar/eg/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/srsudar/eg")
    (synopsis "useful examples at the command line")
    (description "Useful examples at the command line")
    (license license:expat)))

;;; ===================================================================
;;; 39. timelineproject-hg
;;; ===================================================================
;;; Source: http://thetimelineproj.sourceforge.net/
;;; Aims to create a free, cross-platform application for displaying and navigating 

(define-public timelineproject-hg
  (package
    (name "timelineproject-hg")
    (version "2.10.0.r7971")
    (source (origin
              (method url-fetch)
              (uri "http://thetimelineproj.sourceforge.net/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://thetimelineproj.sourceforge.net/")
    (synopsis "aims to create a free, cross-platform application for displaying and navigatin")
    (description "Aims to create a free, cross-platform application for displaying and navigating events on a timeline.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 40. sftpgo-bin
;;; ===================================================================
;;; Source: https://github.com/drakkan/sftpgo
;;; Full-featured and highly configurable SFTP, HTTP/S, FTP/S and WebDAV server - S3

(define-public sftpgo-bin
  (package
    (name "sftpgo-bin")
    (version "2.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/drakkan/sftpgo/releases/download/v" version "/sftpgo-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sftpgo-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/drakkan/sftpgo")
    (synopsis "full-featured and highly configurable SFTP, HTTP/S, FTP/S and WebDAV server - ")
    (description "Full-featured and highly configurable SFTP, HTTP/S, FTP/S and WebDAV server - S3, Google Cloud Storage, Azure Blob")
    (license #f)))

;;; ===================================================================
;;; 41. fancytasks
;;; ===================================================================
;;; Source: https://github.com/alexankitty/FancyTasks
;;; More modern taskbar-style window switcher displaying icons and text, with some i

(define-public fancytasks
  (package
    (name "fancytasks")
    (version "1.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/alexankitty/FancyTasks/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/alexankitty/FancyTasks")
    (synopsis "more modern taskbar-style window switcher displaying icons and text, with some")
    (description "More modern taskbar-style window switcher displaying icons and text, with some improvments and color. Serves as a replacement for the Icon-Only and Task Manager plasmoids KDE ships with.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 42. didyoumean
;;; ===================================================================
;;; Source: https://github.com/hisbaan/didyoumean
;;; A CLI spelling corrector

(define-public didyoumean
  (package
    (name "didyoumean")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hisbaan/didyoumean/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/hisbaan/didyoumean")
    (synopsis "A CLI spelling corrector")
    (description "A CLI spelling corrector")
    (license license:gpl3+)))

;;; ===================================================================
;;; 43. weechat-matrix-rs-git
;;; ===================================================================
;;; Source: https://github.com/poljar/weechat-matrix-rs
;;; Rust rewrite of the Python weechat-matrix script

(define-public weechat-matrix-rs-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "weechat-matrix-rs-git")
      (version (git-version "r405.2b093a7" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/poljar/weechat-matrix-rs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/poljar/weechat-matrix-rs")
      (synopsis "Rust rewrite of the Python weechat-matrix script")
      (description "Rust rewrite of the Python weechat-matrix script")
      (license license:isc))))

;;; ===================================================================
;;; 44. python-djlint
;;; ===================================================================
;;; Source: https://github.com/djlint/djLint/releases/tag/v1.34.1
;;; HTML Template Linter and Formatter

(define-public python-djlint
  (package
    (name "python-djlint")
    (version "1.36.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/d/djlint/djlint-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/djlint/djLint/releases/tag/v1.34.1")
    (synopsis "hTML Template Linter and Formatter")
    (description "HTML Template Linter and Formatter")
    (license license:gpl3+)))

;;; ===================================================================
;;; 45. patat-bin
;;; ===================================================================
;;; Source: https://github.com/jaspervdj/patat
;;; Terminal-based presentations using Pandoc

(define-public patat-bin
  (package
    (name "patat-bin")
    (version "0.15.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jaspervdj/patat/releases/download/v" version "/patat-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/patat-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jaspervdj/patat")
    (synopsis "terminal-based presentations using Pandoc")
    (description "Terminal-based presentations using Pandoc")
    (license license:gpl2+)))

;;; ===================================================================
;;; 46. monotone
;;; ===================================================================
;;; Source: http://www.monotone.ca/
;;; The Monotone distributed version control system

(define-public monotone
  (package
    (name "monotone")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "http://www.monotone.ca/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.monotone.ca/")
    (synopsis "The Monotone distributed version control system")
    (description "The Monotone distributed version control system")
    (license license:gpl3+)))

;;; ===================================================================
;;; 47. hawck-git
;;; ===================================================================
;;; Source: https://github.com/snyball/hawck
;;; Keyboard macro system

(define-public hawck-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "hawck-git")
      (version (git-version "20240108" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/snyball/hawck")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/snyball/hawck")
      (synopsis "keyboard macro system")
      (description "Keyboard macro system")
      (license license:bsd-3))))

;;; ===================================================================
;;; 48. browserpass-chrome
;;; ===================================================================
;;; Source: https://github.com/browserpass/browserpass-extension
;;; Chrome extension for Browserpass, browser extension for zx2c4's pass (password m

(define-public browserpass-chrome
  (package
    (name "browserpass-chrome")
    (version "3.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/browserpass/browserpass-extension/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/browserpass/browserpass-extension")
    (synopsis "chrome extension for Browserpass, browser extension for zx2c4's pass (password")
    (description "Chrome extension for Browserpass, browser extension for zx2c4's pass (password manager)")
    (license license:isc)))

;;; ===================================================================
;;; 49. sleek-bin
;;; ===================================================================
;;; Source: https://github.com/ransome1/sleek
;;; todo.txt manager for Linux, Windows and MacOS, free and open-source (FOSS).(Preb

(define-public sleek-bin
  (package
    (name "sleek-bin")
    (version "2.0.25")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ransome1/sleek/releases/download/v" version "/sleek-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sleek-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ransome1/sleek")
    (synopsis "todo.txt manager for Linux, Windows and MacOS, free and open-source (FOSS).(Pr")
    (description "todo.txt manager for Linux, Windows and MacOS, free and open-source (FOSS).(Prebuilt version.Use system-wide electron)")
    (license license:expat)))

;;; ===================================================================
;;; 50. gcfscape
;;; ===================================================================
;;; Source: https://nemstools.github.io/pages/GCFScape-Download.html
;;; An explorer for Half-Life file packages (bsp, gcf, vpk, wad, pak, etc)

(define-public gcfscape
  (package
    (name "gcfscape")
    (version "1.8.6")
    (source (origin
              (method url-fetch)
              (uri "https://nemstools.github.io/pages/GCFScape-Download.html")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://nemstools.github.io/pages/GCFScape-Download.html")
    (synopsis "An explorer for Half-Life file packages (bsp, gcf, vpk, wad, pak, etc)")
    (description "An explorer for Half-Life file packages (bsp, gcf, vpk, wad, pak, etc)")
    (license #f)))

;;; ===================================================================
;;; 51. fusee-interfacee-tk-bin
;;; ===================================================================
;;; Source: https://github.com/nh-server/fusee-interfacee-tk
;;; A mod of falquinhos Fusée Launcher for use with Nintendo Homebrew Switch Guide. 

(define-public fusee-interfacee-tk-bin
  (package
    (name "fusee-interfacee-tk-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nh-server/fusee-interfacee-tk/releases/download/v" version "/fusee-interfacee-tk-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fusee-interfacee-tk-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nh-server/fusee-interfacee-tk")
    (synopsis "A mod of falquinhos Fusée Launcher for use with Nintendo Homebrew Switch Guide")
    (description "A mod of falquinhos Fusée Launcher for use with Nintendo Homebrew Switch Guide. It also adds the ability to mount SD while in RCM.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 52. surface-uefi-firmware-git
;;; ===================================================================
;;; Source: https://github.com/linux-surface/surface-uefi-firmware
;;; Scripts to prepare UEFI firmware updates for Microsoft Surface

(define-public surface-uefi-firmware-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "surface-uefi-firmware-git")
      (version (git-version "r52.47a687f" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linux-surface/surface-uefi-firmware")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/linux-surface/surface-uefi-firmware")
      (synopsis "scripts to prepare UEFI firmware updates for Microsoft Surface")
      (description "Scripts to prepare UEFI firmware updates for Microsoft Surface")
      (license #f))))

;;; ===================================================================
;;; 53. python3-synapse-s3-storage-provider
;;; ===================================================================
;;; Source: https://github.com/matrix-org/synapse-s3-storage-provider
;;; Synapse storage provider to fetch and store media in Amazon S3

(define-public python3-synapse-s3-storage-provider
  (package
    (name "python3-synapse-s3-storage-provider")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/s/synapse-s3-storage-provider/synapse-s3-storage-provider-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/matrix-org/synapse-s3-storage-provider")
    (synopsis "synapse storage provider to fetch and store media in Amazon S3")
    (description "Synapse storage provider to fetch and store media in Amazon S3")
    (license license:asl2.0)))

;;; ===================================================================
;;; 54. python-syncthing
;;; ===================================================================
;;; Source: https://github.com/blakev/python-syncthing
;;; Python bindings to the Syncthing REST interface

(define-public python-syncthing
  (package
    (name "python-syncthing")
    (version "2.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/s/syncthing/syncthing-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/blakev/python-syncthing")
    (synopsis "Python bindings to the Syncthing REST interface")
    (description "Python bindings to the Syncthing REST interface")
    (license license:expat)))

;;; ===================================================================
;;; 55. nullpomino-git
;;; ===================================================================
;;; Source: https://github.com/nullpomino/nullpomino
;;; An action puzzle game

(define-public nullpomino-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "nullpomino-git")
      (version (git-version "v7.5.0.r126.gfd8d758" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nullpomino/nullpomino")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/nullpomino/nullpomino")
      (synopsis "An action puzzle game")
      (description "An action puzzle game")
      (license license:bsd-3))))

;;; ===================================================================
;;; 56. moc-lyrics-git
;;; ===================================================================
;;; Source: https://github.com/christophgysin/moc
;;; An ncurses console audio player (with lyrics patch)

(define-public moc-lyrics-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "moc-lyrics-git")
      (version (git-version "0.2213.c51e02e" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/christophgysin/moc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/christophgysin/moc")
      (synopsis "An ncurses console audio player (with lyrics patch)")
      (description "An ncurses console audio player (with lyrics patch)")
      (license license:gpl3+))))

;;; ===================================================================
;;; 57. johnnydep
;;; ===================================================================
;;; Source: https://github.com/wimglenn/johnnydep
;;; Display dependency tree of Python distribution

(define-public johnnydep
  (package
    (name "johnnydep")
    (version "1.20.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/wimglenn/johnnydep/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/wimglenn/johnnydep")
    (synopsis "display dependency tree of Python distribution")
    (description "Display dependency tree of Python distribution")
    (license license:expat)))

;;; ===================================================================
;;; 58. gxr
;;; ===================================================================
;;; Source: https://gitlab.freedesktop.org/xrdesktop/gxr
;;; glib wrapper for the OpenVR and soon the OpenXR API

(define-public gxr
  (package
    (name "gxr")
    (version "0.16.0")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.freedesktop.org/xrdesktop/gxr")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/xrdesktop/gxr")
    (synopsis "glib wrapper for the OpenVR and soon the OpenXR API")
    (description "glib wrapper for the OpenVR and soon the OpenXR API")
    (license license:expat)))

;;; ===================================================================
;;; 59. gulkan
;;; ===================================================================
;;; Source: https://gitlab.freedesktop.org/xrdesktop/gulkan
;;; GLib library for Vulkan abstraction

(define-public gulkan
  (package
    (name "gulkan")
    (version "0.16.0")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.freedesktop.org/xrdesktop/gulkan")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.freedesktop.org/xrdesktop/gulkan")
    (synopsis "gLib library for Vulkan abstraction")
    (description "GLib library for Vulkan abstraction")
    (license license:expat)))

;;; ===================================================================
;;; 60. cdhist
;;; ===================================================================
;;; Source: https://github.com/bulletmark/cdhist
;;; Linux shell cd history

(define-public cdhist
  (package
    (name "cdhist")
    (version "4.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bulletmark/cdhist/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/bulletmark/cdhist")
    (synopsis "Linux shell cd history")
    (description "Linux shell cd history")
    (license license:gpl3+)))

;;; ===================================================================
;;; 61. wox-bin
;;; ===================================================================
;;; Source: https://github.com/Wox-launcher/Wox
;;; A cross-platform launcher that simply works

(define-public wox-bin
  (package
    (name "wox-bin")
    (version "2.0.0_beta.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Wox-launcher/Wox/releases/download/v" version "/wox-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/wox-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Wox-launcher/Wox")
    (synopsis "A cross-platform launcher that simply works")
    (description "A cross-platform launcher that simply works")
    (license license:gpl3+)))

;;; ===================================================================
;;; 62. vscodius-bin
;;; ===================================================================
;;; Source: https://github.com/RubisetCie/vscodius
;;; Binary releases of Visual Studio Code without MS branding/telemetry/licensing an

(define-public vscodius-bin
  (package
    (name "vscodius-bin")
    (version "1.98.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/RubisetCie/vscodius/releases/download/v" version "/vscodius-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vscodius-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/RubisetCie/vscodius")
    (synopsis "binary releases of Visual Studio Code without MS branding/telemetry/licensing ")
    (description "Binary releases of Visual Studio Code without MS branding/telemetry/licensing and various personal workflow improvements.(Prebuilt version)")
    (license license:expat)))

;;; ===================================================================
;;; 63. universal-pause
;;; ===================================================================
;;; Source: https://github.com/Evilur/UniversalPause
;;; Universal pause for Linux games. Allows you to pause non-pausable cutscenes and 

(define-public universal-pause
  (package
    (name "universal-pause")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Evilur/UniversalPause/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Evilur/UniversalPause")
    (synopsis "universal pause for Linux games. Allows you to pause non-pausable cutscenes an")
    (description "Universal pause for Linux games. Allows you to pause non-pausable cutscenes and games")
    (license license:expat)))

;;; ===================================================================
;;; 64. timr-bin
;;; ===================================================================
;;; Source: https://github.com/sectore/timr-tui
;;; A TUI to organize your time: Pomodoro, Countdown, Timer

(define-public timr-bin
  (package
    (name "timr-bin")
    (version "1.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/sectore/timr-tui/releases/download/v" version "/timr-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/timr-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sectore/timr-tui")
    (synopsis "A TUI to organize your time: Pomodoro, Countdown, Timer")
    (description "A TUI to organize your time: Pomodoro, Countdown, Timer")
    (license license:expat)))

;;; ===================================================================
;;; 65. servicer-bin
;;; ===================================================================
;;; Source: https://github.com/servicer-labs/servicer
;;; Simplify service management on systemd

(define-public servicer-bin
  (package
    (name "servicer-bin")
    (version "0.1.13")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/servicer-labs/servicer/releases/download/v" version "/servicer-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/servicer-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/servicer-labs/servicer")
    (synopsis "simplify service management on systemd")
    (description "Simplify service management on systemd")
    (license license:expat)))

;;; ===================================================================
;;; 66. rofi-notion
;;; ===================================================================
;;; Source: https://github.com/mathix420/rofi-notion
;;; Quickly create new Notion pages for your databases with rofi as GUI.

(define-public rofi-notion
  (package
    (name "rofi-notion")
    (version "2.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mathix420/rofi-notion/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mathix420/rofi-notion")
    (synopsis "quickly create new Notion pages for your databases with rofi as GUI")
    (description "Quickly create new Notion pages for your databases with rofi as GUI.")
    (license license:expat)))

;;; ===================================================================
;;; 67. python-wolkenbruch
;;; ===================================================================
;;; Source: https://gitlab.com/christophfink/wolkenbruch/
;;; Remind you to pack your rain gear when it’s forecast to rain

(define-public python-wolkenbruch
  (package
    (name "python-wolkenbruch")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/w/wolkenbruch/wolkenbruch-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/christophfink/wolkenbruch/")
    (synopsis "remind you to pack your rain gear when it’s forecast to rain")
    (description "Remind you to pack your rain gear when it’s forecast to rain")
    (license license:gpl3+)))

;;; ===================================================================
;;; 68. python-vadersentiment
;;; ===================================================================
;;; Source: https://github.com/cjhutto/vaderSentiment
;;; VADER (Valence Aware Dictionary and sEntiment Reasoner)

(define-public python-vadersentiment
  (package
    (name "python-vadersentiment")
    (version "3.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/v/vadersentiment/vadersentiment-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/cjhutto/vaderSentiment")
    (synopsis "vADER (Valence Aware Dictionary and sEntiment Reasoner)")
    (description "VADER (Valence Aware Dictionary and sEntiment Reasoner)")
    (license license:expat)))

;;; ===================================================================
;;; 69. python-qiskit-addon-cutting
;;; ===================================================================
;;; Source: https://github.com/Qiskit/qiskit-addon-cutting
;;; Reduce width and depth of quantum circuits by cutting gates and wires

(define-public python-qiskit-addon-cutting
  (package
    (name "python-qiskit-addon-cutting")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/q/qiskit-addon-cutting/qiskit-addon-cutting-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Qiskit/qiskit-addon-cutting")
    (synopsis "reduce width and depth of quantum circuits by cutting gates and wires")
    (description "Reduce width and depth of quantum circuits by cutting gates and wires")
    (license license:asl2.0)))

;;; ===================================================================
;;; 70. python-pyrosm
;;; ===================================================================
;;; Source: https://pyrosm.readthedocs.io/
;;; A Python tool to parse OSM data from Protobuf format into GeoDataFrame.

(define-public python-pyrosm
  (package
    (name "python-pyrosm")
    (version "0.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/p/pyrosm/pyrosm-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pyrosm.readthedocs.io/")
    (synopsis "A Python tool to parse OSM data from Protobuf format into GeoDataFrame")
    (description "A Python tool to parse OSM data from Protobuf format into GeoDataFrame.")
    (license license:expat)))

;;; ===================================================================
;;; 71. python-pyrobuf
;;; ===================================================================
;;; Source: https://github.com/appnexus/pyrobuf
;;; An alternative to Google's Python Protobuf library.

(define-public python-pyrobuf
  (package
    (name "python-pyrobuf")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/p/pyrobuf/pyrobuf-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/appnexus/pyrobuf")
    (synopsis "An alternative to Google's Python Protobuf library")
    (description "An alternative to Google's Python Protobuf library.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 72. python-pyarrow-stubs
;;; ===================================================================
;;; Source: https://github.com/zen-xu/pyarrow-stubs
;;; Type annotations for pyarrow

(define-public python-pyarrow-stubs
  (package
    (name "python-pyarrow-stubs")
    (version "17.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/p/pyarrow-stubs/pyarrow-stubs-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/zen-xu/pyarrow-stubs")
    (synopsis "type annotations for pyarrow")
    (description "Type annotations for pyarrow")
    (license license:bsd-2)))

;;; ===================================================================
;;; 73. python-papis-python-rofi
;;; ===================================================================
;;; Source: https://pypi.org/project/papis-python-rofi/
;;; Create simple GUIs using the Rofi application (fork for papis)

(define-public python-papis-python-rofi
  (package
    (name "python-papis-python-rofi")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/p/papis-python-rofi/papis-python-rofi-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/papis-python-rofi/")
    (synopsis "create simple GUIs using the Rofi application (fork for papis)")
    (description "Create simple GUIs using the Rofi application (fork for papis)")
    (license license:gpl3+)))

;;; ===================================================================
;;; 74. python-osmnet
;;; ===================================================================
;;; Source: http://udst.github.io/osmnet/
;;; Tools for the extraction of OpenStreetMap street network data

(define-public python-osmnet
  (package
    (name "python-osmnet")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/o/osmnet/osmnet-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://udst.github.io/osmnet/")
    (synopsis "tools for the extraction of OpenStreetMap street network data")
    (description "Tools for the extraction of OpenStreetMap street network data")
    (license license:agpl3)))

;;; ===================================================================
;;; 75. python-mov-cli-youtube
;;; ===================================================================
;;; Source: https://github.com/mov-cli/mov-cli-youtube
;;; A mov-cli v4 plugin for watching youtube.

(define-public python-mov-cli-youtube
  (package
    (name "python-mov-cli-youtube")
    (version "1.3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/m/mov-cli-youtube/mov-cli-youtube-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mov-cli/mov-cli-youtube")
    (synopsis "A mov-cli v4 plugin for watching youtube")
    (description "A mov-cli v4 plugin for watching youtube.")
    (license license:expat)))

;;; ===================================================================
;;; 76. python-mov-cli-test
;;; ===================================================================
;;; Source: https://github.com/mov-cli/mov-cli-test
;;; A mov-cli v4 plugin to test mov-cli's capabilities.

(define-public python-mov-cli-test
  (package
    (name "python-mov-cli-test")
    (version "1.1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/m/mov-cli-test/mov-cli-test-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mov-cli/mov-cli-test")
    (synopsis "A mov-cli v4 plugin to test mov-cli's capabilities")
    (description "A mov-cli v4 plugin to test mov-cli's capabilities.")
    (license license:expat)))

;;; ===================================================================
;;; 77. python-kasa
;;; ===================================================================
;;; Source: https://github.com/python-kasa/python-kasa
;;; Python library to control TPLink's smart home devices (plugs, wall switches, pow

(define-public python-kasa
  (package
    (name "python-kasa")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/k/kasa/kasa-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/python-kasa/python-kasa")
    (synopsis "Python library to control TPLink's smart home devices (plugs, wall switches, p")
    (description "Python library to control TPLink's smart home devices (plugs, wall switches, power strips, and bulbs).")
    (license license:gpl3+)))

;;; ===================================================================
;;; 78. python-dhash
;;; ===================================================================
;;; Source: https://github.com/Jetsetter/dhash
;;; Calculate the difference hash (perceptual hash) for an image

(define-public python-dhash
  (package
    (name "python-dhash")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/d/dhash/dhash-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Jetsetter/dhash")
    (synopsis "calculate the difference hash (perceptual hash) for an image")
    (description "Calculate the difference hash (perceptual hash) for an image")
    (license license:expat)))

;;; ===================================================================
;;; 79. python-devgoldyutils
;;; ===================================================================
;;; Source: https://github.com/THEGOLDENPRO/devgoldyutils
;;; Goldy's small python util library.

(define-public python-devgoldyutils
  (package
    (name "python-devgoldyutils")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/d/devgoldyutils/devgoldyutils-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/THEGOLDENPRO/devgoldyutils")
    (synopsis "goldy's small python util library")
    (description "Goldy's small python util library.")
    (license license:expat)))

;;; ===================================================================
;;; 80. pupu-bin
;;; ===================================================================
;;; Source: https://github.com/haoxiang-xu/PuPu
;;; A simple and easy to use UI for the Ollama.(Use system-wide electron)

(define-public pupu-bin
  (package
    (name "pupu-bin")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/haoxiang-xu/PuPu/releases/download/v" version "/pupu-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pupu-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/haoxiang-xu/PuPu")
    (synopsis "A simple and easy to use UI for the Ollama.(Use system-wide electron)")
    (description "A simple and easy to use UI for the Ollama.(Use system-wide electron)")
    (license license:expat)))

;;; ===================================================================
;;; 81. papis-rofi-git
;;; ===================================================================
;;; Source: https://pypi.org/project/papis-rofi/
;;; Rofi interface for papis

(define-public papis-rofi-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "papis-rofi-git")
      (version (git-version "0.2.0.r25.b74eea0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://pypi.org/project/papis-rofi/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://pypi.org/project/papis-rofi/")
      (synopsis "Rofi interface for papis")
      (description "Rofi interface for papis")
      (license license:gpl3+))))

;;; ===================================================================
;;; 82. papis-dmenu
;;; ===================================================================
;;; Source: https://github.com/papis/papis-dmenu
;;; Papis plugin implementing a picker based on dmenu

(define-public papis-dmenu
  (package
    (name "papis-dmenu")
    (version "0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/papis/papis-dmenu/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/papis/papis-dmenu")
    (synopsis "papis plugin implementing a picker based on dmenu")
    (description "Papis plugin implementing a picker based on dmenu")
    (license #f)))

;;; ===================================================================
;;; 83. notion-desktop-git
;;; ===================================================================
;;; Source: https://snapcraft.io/notion-desktop
;;; An unofficial desktop application that allows you to use Notion directly on your

(define-public notion-desktop-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "notion-desktop-git")
      (version (git-version "1.1.0.r2.g1eb5f30" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://snapcraft.io/notion-desktop")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://snapcraft.io/notion-desktop")
      (synopsis "An unofficial desktop application that allows you to use Notion directly on yo")
      (description "An unofficial desktop application that allows you to use Notion directly on your computer, making it easier to chat with friends and family while working.(Use system-wide electron)")
      (license license:expat))))

;;; ===================================================================
;;; 84. neovim-nightly
;;; ===================================================================
;;; Source: https://neovim.io
;;; Fork of Vim aiming to improve user experience, plugins, and GUIs

(define-public neovim-nightly
  (package
    (name "neovim-nightly")
    (version "0.13.0.r270.g32e249dfa6")
    (source (origin
              (method url-fetch)
              (uri "https://neovim.io")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://neovim.io")
    (synopsis "fork of Vim aiming to improve user experience, plugins, and GUIs")
    (description "Fork of Vim aiming to improve user experience, plugins, and GUIs")
    (license license:asl2.0)))

;;; ===================================================================
;;; 85. mov-cli
;;; ===================================================================
;;; Source: https://github.com/mov-cli/mov-cli
;;; Watch everything from your terminal.

(define-public mov-cli
  (package
    (name "mov-cli")
    (version "4.4.19")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mov-cli/mov-cli/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mov-cli/mov-cli")
    (synopsis "watch everything from your terminal")
    (description "Watch everything from your terminal.")
    (license license:expat)))

;;; ===================================================================
;;; 86. memos
;;; ===================================================================
;;; Source: https://github.com/usememos/memos
;;; A privacy-first, lightweight note-taking service. Easily capture and share your 

(define-public memos
  (package
    (name "memos")
    (version "0.25.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/usememos/memos/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/usememos/memos")
    (synopsis "A privacy-first, lightweight note-taking service. Easily capture and share you")
    (description "A privacy-first, lightweight note-taking service. Easily capture and share your great thoughts.")
    (license license:expat)))

;;; ===================================================================
;;; 87. mangadesk
;;; ===================================================================
;;; Source: https://github.com/darylhjd/mangadesk
;;; Terminal client for MangaDex

(define-public mangadesk
  (package
    (name "mangadesk")
    (version "0.7.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/darylhjd/mangadesk/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/darylhjd/mangadesk")
    (synopsis "terminal client for MangaDex")
    (description "Terminal client for MangaDex")
    (license license:expat)))

;;; ===================================================================
;;; 88. linux-timemachine
;;; ===================================================================
;;; Source: https://github.com/cytopia/linux-timemachine
;;; Rsync-based OSX-like time machine for atomic and resumable local and remote back

(define-public linux-timemachine
  (package
    (name "linux-timemachine")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/cytopia/linux-timemachine/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/cytopia/linux-timemachine")
    (synopsis "Rsync-based OSX-like time machine for atomic and resumable local and remote ba")
    (description "Rsync-based OSX-like time machine for atomic and resumable local and remote backups")
    (license license:expat)))

;;; ===================================================================
;;; 89. libreoffice-extension-ayaspell
;;; ===================================================================
;;; Source: https://ayaspell.sourceforge.net/
;;; Arabic spelling and thesaurus dictionaries.

(define-public libreoffice-extension-ayaspell
  (package
    (name "libreoffice-extension-ayaspell")
    (version "3.5")
    (source (origin
              (method url-fetch)
              (uri "https://ayaspell.sourceforge.net/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://ayaspell.sourceforge.net/")
    (synopsis "arabic spelling and thesaurus dictionaries")
    (description "Arabic spelling and thesaurus dictionaries.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 90. librdp
;;; ===================================================================
;;; Source: https://github.com/urschrei/rdp
;;; Fast Ramer–Douglas–Peucker and Visvalingam-Whyatt line simplification algorithms

(define-public librdp
  (package
    (name "librdp")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/urschrei/rdp/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/urschrei/rdp")
    (synopsis "fast Ramer–Douglas–Peucker and Visvalingam-Whyatt line simplification algorith")
    (description "Fast Ramer–Douglas–Peucker and Visvalingam-Whyatt line simplification algorithms")
    (license license:expat)))

;;; ===================================================================
;;; 91. kalico-git
;;; ===================================================================
;;; Source: https://kalico.gg
;;; Klipper, but Limitless

(define-public kalico-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "kalico-git")
      (version (git-version "r5899.f26c79c77" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://kalico.gg")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://kalico.gg")
      (synopsis "klipper, but Limitless")
      (description "Klipper, but Limitless")
      (license license:gpl3+))))

;;; ===================================================================
;;; 92. kalico
;;; ===================================================================
;;; Source: https://kalico.gg
;;; Klipper, but Limitless

(define-public kalico
  (package
    (name "kalico")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri "https://kalico.gg")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://kalico.gg")
    (synopsis "klipper, but Limitless")
    (description "Klipper, but Limitless")
    (license license:gpl3+)))

;;; ===================================================================
;;; 93. fs2es-indexer
;;; ===================================================================
;;; Source: https://github.com/Ellerhold/fs2es-indexer
;;; File system indexer for Elasticsearch

(define-public fs2es-indexer
  (package
    (name "fs2es-indexer")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Ellerhold/fs2es-indexer/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Ellerhold/fs2es-indexer")
    (synopsis "file system indexer for Elasticsearch")
    (description "File system indexer for Elasticsearch")
    (license #f)))

;;; ===================================================================
;;; 94. dotdev-git
;;; ===================================================================
;;; Source: https://github.com/petlack/dotdev
;;; Lightweight Web server for static HTML with built-in live reload written in Go.

(define-public dotdev-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "dotdev-git")
      (version (git-version "0.0.1.20250224.01.r11.89cbf87" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/petlack/dotdev")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/petlack/dotdev")
      (synopsis "lightweight Web server for static HTML with built-in live reload written in Go")
      (description "Lightweight Web server for static HTML with built-in live reload written in Go.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 95. darkmark-git
;;; ===================================================================
;;; Source: https://github.com/stephanecharette/DarkMark
;;; DarkMark: GUI for Darknet and DarkHelp

(define-public darkmark-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "darkmark-git")
      (version (git-version "1.10.18" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stephanecharette/DarkMark")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/stephanecharette/DarkMark")
      (synopsis "darkMark: GUI for Darknet and DarkHelp")
      (description "DarkMark: GUI for Darknet and DarkHelp")
      (license license:gpl3+))))

;;; ===================================================================
;;; 96. darkhelp-git
;;; ===================================================================
;;; Source: https://github.com/stephanecharette/DarkHelp
;;; DarkHelp: C++ helper class for Darknet's C API

(define-public darkhelp-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "darkhelp-git")
      (version (git-version "1.9.6" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stephanecharette/DarkHelp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/stephanecharette/DarkHelp")
      (synopsis "darkHelp: C++ helper class for Darknet's C API")
      (description "DarkHelp: C++ helper class for Darknet's C API")
      (license license:expat))))

;;; ===================================================================
;;; 97. compiler-rt17
;;; ===================================================================
;;; Source: https://compiler-rt.llvm.org/
;;; Compiler runtime libraries for clang 17

(define-public compiler-rt17
  (package
    (name "compiler-rt17")
    (version "17.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://compiler-rt.llvm.org/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://compiler-rt.llvm.org/")
    (synopsis "compiler runtime libraries for clang 17")
    (description "Compiler runtime libraries for clang 17")
    (license #f)))

;;; ===================================================================
;;; 98. cleanarch
;;; ===================================================================
;;; Source: https://github.com/Coderangshu/cleanarch
;;; Clean your Arch Linux system by removing unnecessary packages and cache.

(define-public cleanarch
  (package
    (name "cleanarch")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Coderangshu/cleanarch/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Coderangshu/cleanarch")
    (synopsis "clean your Arch Linux system by removing unnecessary packages and cache")
    (description "Clean your Arch Linux system by removing unnecessary packages and cache.")
    (license license:expat)))

;;; ===================================================================
;;; 99. clang17
;;; ===================================================================
;;; Source: https://clang.llvm.org/
;;; C language family frontend for LLVM 17

(define-public clang17
  (package
    (name "clang17")
    (version "17.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://clang.llvm.org/")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://clang.llvm.org/")
    (synopsis "c language family frontend for LLVM 17")
    (description "C language family frontend for LLVM 17")
    (license #f)))
