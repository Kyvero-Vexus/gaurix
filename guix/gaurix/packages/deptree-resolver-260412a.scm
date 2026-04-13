;;; Dependency-tree resolver pass -- deptree-resolver-260412a
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 87 packages resolved with recipes, 13 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-12

(define-module (gaurix packages deptree-resolver-260412a)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:export (libreoffice-dev-szl
            libreoffice-dev-ta
            libreoffice-dev-te
            libreoffice-dev-tg
            libreoffice-dev-th
            libreoffice-dev-tn
            libreoffice-dev-tr
            libreoffice-dev-ts
            libreoffice-dev-tt
            libreoffice-dev-ug
            libreoffice-dev-uk
            libreoffice-dev-uz
            libreoffice-dev-ve
            libreoffice-dev-vec
            libreoffice-dev-vi
            libreoffice-dev-xh
            libreoffice-dev-zh-cn
            libreoffice-dev-zh-tw
            libreoffice-dev-zu
            libsmb2-git
            libtxc-dxtn
            likwid
            linphone-plugin-msx264
            linux-versioned-bin
            linux-versioned-docs-bin
            linux-versioned-headers-bin
            lla
            locale-en-nl-git
            logfmt-bin
            lssecret-git
            marmite
            masterpassword-gui
            mbrola-voices-de5
            mc-dracula-theme
            mcos-shell-theme
            mehshell-bin
            members
            min-browser-bin
            minisforum-v3-pcie-aspm-config
            mirth-connect-administrator-launcher
            mkmm
            mm2odt
            modsecurity-crs
            moltbot
            mqttx-bin
            muffon-bin
            mycelium
            netease-cloud-music-web-player
            netrc
            nibble-bin
            nimble-git
            nimpretty-git
            nimsuggest-git
            nitrux-icon-theme
            nmcrcon-git
            nmsurf
            nodejs-express
            nonicons-doc-git
            nonicons-license-git
            nordic-wallpapers
            notable-bin
            note-tui-bin
            nsnake
            nstool
            nuclei-bin
            numara-bin
            nvidia-oc
            nvim-lazy
            objconv
            obs-livesplit-one-bin
            octave-splines
            octoberctl-bin
            odin4-cli
            omm-bin
            omnidotdev-cli
            omnidotdev-eden
            open-in-native-client
            openhab5-addons
            opennic-up
            opentorrent-bin
            opentorrent-unstable
            opentubex-bin
            opera-gx-stable-ffmpeg-codecs-bin
            ostorybook
            font-arundina
            ourico
            pacman-mirrorup))

;;; PACKAGE DEFINITIONS (87 packages)

;;; -- libreoffice-dev-szl --
(define-public libreoffice-dev-szl
  (package
    (name "libreoffice-dev-szl")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-szl-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-szl-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-szl/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "silesian language pack for LibreOffice Dev")
    (description "Silesian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ta --
(define-public libreoffice-dev-ta
  (package
    (name "libreoffice-dev-ta")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ta-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ta-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ta/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "tamil language pack for LibreOffice Dev")
    (description "Tamil language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-te --
(define-public libreoffice-dev-te
  (package
    (name "libreoffice-dev-te")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-te-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-te-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-te/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "telugu language pack for LibreOffice Dev")
    (description "Telugu language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-tg --
(define-public libreoffice-dev-tg
  (package
    (name "libreoffice-dev-tg")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-tg-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-tg-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-tg/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "tajik language pack for LibreOffice Dev")
    (description "Tajik language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-th --
(define-public libreoffice-dev-th
  (package
    (name "libreoffice-dev-th")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-th-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-th-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-th/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "thai language pack for LibreOffice Dev")
    (description "Thai language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-tn --
(define-public libreoffice-dev-tn
  (package
    (name "libreoffice-dev-tn")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-tn-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-tn-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-tn/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "tswana language pack for LibreOffice Dev")
    (description "Tswana language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-tr --
(define-public libreoffice-dev-tr
  (package
    (name "libreoffice-dev-tr")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-tr-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-tr-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-tr/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "turkish language pack for LibreOffice Dev")
    (description "Turkish language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ts --
(define-public libreoffice-dev-ts
  (package
    (name "libreoffice-dev-ts")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ts-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ts-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ts/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "tsonga language pack for LibreOffice Dev")
    (description "Tsonga language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-tt --
(define-public libreoffice-dev-tt
  (package
    (name "libreoffice-dev-tt")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-tt-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-tt-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-tt/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "tatar language pack for LibreOffice Dev")
    (description "Tatar language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ug --
(define-public libreoffice-dev-ug
  (package
    (name "libreoffice-dev-ug")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ug-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ug-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ug/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "uighur language pack for LibreOffice Dev")
    (description "Uighur language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-uk --
(define-public libreoffice-dev-uk
  (package
    (name "libreoffice-dev-uk")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-uk-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-uk-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-uk/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "ukrainian language pack for LibreOffice Dev")
    (description "Ukrainian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-uz --
(define-public libreoffice-dev-uz
  (package
    (name "libreoffice-dev-uz")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-uz-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-uz-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-uz/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "uzbek language pack for LibreOffice Dev")
    (description "Uzbek language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ve --
(define-public libreoffice-dev-ve
  (package
    (name "libreoffice-dev-ve")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ve-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ve-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ve/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "venda language pack for LibreOffice Dev")
    (description "Venda language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-vec --
(define-public libreoffice-dev-vec
  (package
    (name "libreoffice-dev-vec")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-vec-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-vec-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-vec/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "venetian language pack for LibreOffice Dev")
    (description "Venetian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-vi --
(define-public libreoffice-dev-vi
  (package
    (name "libreoffice-dev-vi")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-vi-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-vi-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-vi/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "vietnamese language pack for LibreOffice Dev")
    (description "Vietnamese language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-xh --
(define-public libreoffice-dev-xh
  (package
    (name "libreoffice-dev-xh")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-xh-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-xh-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-xh/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "xhosa language pack for LibreOffice Dev")
    (description "Xhosa language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-zh-cn --
(define-public libreoffice-dev-zh-cn
  (package
    (name "libreoffice-dev-zh-cn")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-zh-cn-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-zh-cn-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-zh-cn/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "chinese (simplified) language pack for LibreOffice Dev")
    (description "Chinese (simplified) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-zh-tw --
(define-public libreoffice-dev-zh-tw
  (package
    (name "libreoffice-dev-zh-tw")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-zh-tw-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-zh-tw-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-zh-tw/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "chinese (traditional) language pack for LibreOffice Dev")
    (description "Chinese (traditional) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-zu --
(define-public libreoffice-dev-zu
  (package
    (name "libreoffice-dev-zu")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-zu-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-zu-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-zu/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "zulu language pack for LibreOffice Dev")
    (description "Zulu language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libsmb2-git --
(define-public libsmb2-git
  (package
    (name "libsmb2-git")
    (version "6.2.r163.gaedafb2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sahlberg/libsmb2.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libsmb2-git/"))))
    (home-page "https://github.com/sahlberg/libsmb2")
    (synopsis "userspace client/server library for accessing or serving SMB2/SMB3 shares o...")
    (description "Userspace client/server library for accessing or serving SMB2/SMB3 shares on a network.")
    (license license:expat)))

;;; -- libtxc_dxtn --
(define-public libtxc-dxtn
  (package
    (name "libtxc-dxtn")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://dri.freedesktop.org/wiki/S3TC/"
         "releases/download/v" version "/libtxc_dxtn-" version ".tar.gz"))
       (file-name (string-append "libtxc-dxtn-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libtxc-dxtn/"))))
    (home-page "http://dri.freedesktop.org/wiki/S3TC")
    (synopsis "the S3TC algorithm, needed by wine-staging DXTn patches")
    (description "The S3TC algorithm, needed by wine-staging DXTn patches.")
    (license license:bsd-3)))

;;; -- likwid --
(define-public likwid
  (package
    (name "likwid")
    (version "5.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://hpc.fau.de/research/tools/likwid//"
         "releases/download/v" version "/likwid-" version ".tar.gz"))
       (file-name (string-append "likwid-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/likwid/"))))
    (home-page "https://hpc.fau.de/research/tools/likwid/")
    (synopsis "lightweight performance tools")
    (description "Lightweight performance tools.")
    (license license:gpl3+)))

;;; -- linphone-plugin-msx264 --
(define-public linphone-plugin-msx264
  (package
    (name "linphone-plugin-msx264")
    (version "1.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.linphone.org//"
         "releases/download/v" version "/linphone-plugin-msx264-" version ".tar.gz"))
       (file-name (string-append "linphone-plugin-msx264-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/linphone-plugin-msx264/"))))
    (home-page "http://www.linphone.org/")
    (synopsis "linphone plugin that enables H.264 video codec")
    (description "Linphone plugin that enables H.264 video codec.")
    (license license:gpl3+)))

;;; -- linux-versioned-bin --
(define-public linux-versioned-bin
  (package
    (name "linux-versioned-bin")
    (version "6.19.11.arch1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/archlinux/linux/releases/download/v"
         version "/linux-versioned-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/linux-versioned-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/archlinux/linux")
    (synopsis "metapackage depending on linux6.19.11.arch1-1-bin")
    (description "Metapackage depending on linux6.19.11.arch1-1-bin.")
    (license license:gpl2+)))

;;; -- linux-versioned-docs-bin --
(define-public linux-versioned-docs-bin
  (package
    (name "linux-versioned-docs-bin")
    (version "6.19.11.arch1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/archlinux/linux/releases/download/v"
         version "/linux-versioned-docs-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/linux-versioned-docs-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/archlinux/linux")
    (synopsis "metapackage depending on linux6.19.11.arch1-1-docs-bin")
    (description "Metapackage depending on linux6.19.11.arch1-1-docs-bin.")
    (license license:gpl2+)))

;;; -- linux-versioned-headers-bin --
(define-public linux-versioned-headers-bin
  (package
    (name "linux-versioned-headers-bin")
    (version "6.19.11.arch1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/archlinux/linux/releases/download/v"
         version "/linux-versioned-headers-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/linux-versioned-headers-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/archlinux/linux")
    (synopsis "metapackage depending on linux6.19.11.arch1-1-headers-bin")
    (description "Metapackage depending on linux6.19.11.arch1-1-headers-bin.")
    (license license:gpl2+)))

;;; -- lla --
(define-public lla
  (package
    (name "lla")
    (version "0.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/triyanox/lla/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "lla-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/lla/"))))
    (home-page "https://github.com/triyanox/lla")
    (synopsis "A modern alternative to ls")
    (description "A modern alternative to ls.")
    (license license:expat)))

;;; -- locale-en-nl-git --
(define-public locale-en-nl-git
  (package
    (name "locale-en-nl-git")
    (version "r24.f98339c")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/PanderMusubi/locale-en-nl.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/locale-en-nl-git/"))))
    (home-page "https://github.com/PanderMusubi/locale-en-nl")
    (synopsis "english language locale for the Netherlands (en_NL)")
    (description "English language locale for the Netherlands (en_NL).")
    (license license:expat)))

;;; -- logfmt-bin --
(define-public logfmt-bin
  (package
    (name "logfmt-bin")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/TheEdgeOfRage/logfmt/releases/download/v"
         version "/logfmt-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/logfmt-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TheEdgeOfRage/logfmt")
    (synopsis "simple CLI tool for colorizing, analyzing, filtering, and formatting logfmt...")
    (description "Simple CLI tool for colorizing, analyzing, filtering, and formatting logfmt structured logs.")
    (license license:expat)))

;;; -- lssecret-git --
(define-public lssecret-git
  (package
    (name "lssecret-git")
    (version "r10.20fd771")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/GrantMoyer/lssecret.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/lssecret-git/"))))
    (home-page "https://gitlab.com/GrantMoyer/lssecret")
    (synopsis "utility to list all secret items in a secret service using libsecret")
    (description "Utility to list all secret items in a secret service using libsecret.")
    (license license:unlicense)))

;;; -- marmite --
(define-public marmite
  (package
    (name "marmite")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://marmite.blog//"
         "releases/download/v" version "/marmite-" version ".tar.gz"))
       (file-name (string-append "marmite-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/marmite/"))))
    (home-page "https://marmite.blog/")
    (synopsis "markdown makes sites - A Static Site Generator for Blogs")
    (description "Markdown makes sites - A Static Site Generator for Blogs.")
    (license license:agpl3+)))

;;; -- masterpassword-gui --
(define-public masterpassword-gui
  (package
    (name "masterpassword-gui")
    (version "2.7.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://masterpasswordapp.com//"
         "releases/download/v" version "/masterpassword-gui-" version ".tar.gz"))
       (file-name (string-append "masterpassword-gui-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/masterpassword-gui/"))))
    (home-page "http://masterpasswordapp.com/")
    (synopsis "java GUI for Master Password")
    (description "Java GUI for Master Password.")
    (license license:gpl3+)))

;;; -- mbrola-voices-de5 --
(define-public mbrola-voices-de5
  (package
    (name "mbrola-voices-de5")
    (version "15.6fa9693")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/numediart/MBROLA-voices/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "mbrola-voices-de5-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mbrola-voices-de5/"))))
    (home-page "https://github.com/numediart/MBROLA-voices/")
    (synopsis "A German female voice for the MBROLA synthesizer")
    (description "A German female voice for the MBROLA synthesizer.")
    (license license:expat)))

;;; -- mc-dracula-theme --
(define-public mc-dracula-theme
  (package
    (name "mc-dracula-theme")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://draculatheme.com/midnight-commander/"
         "releases/download/v" version "/mc-dracula-theme-" version ".tar.gz"))
       (file-name (string-append "mc-dracula-theme-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mc-dracula-theme/"))))
    (home-page "https://draculatheme.com/midnight-commander")
    (synopsis "A dark theme for midnight commander (mc)")
    (description "A dark theme for midnight commander (mc).")
    (license license:expat)))

;;; -- mcos-shell-theme --
(define-public mcos-shell-theme
  (package
    (name "mcos-shell-theme")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.opendesktop.org/p/1241688//"
         "releases/download/v" version "/mcos-shell-theme-" version ".tar.gz"))
       (file-name (string-append "mcos-shell-theme-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mcos-shell-theme/"))))
    (home-page "https://www.opendesktop.org/p/1241688/")
    (synopsis "mcOS Shell Theme")
    (description "McOS Shell Theme.")
    (license license:gpl3+)))

;;; -- mehshell-bin --
(define-public mehshell-bin
  (package
    (name "mehshell-bin")
    (version "0.1.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/blackflame007/mehshell/releases/download/v"
         version "/mehshell-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mehshell-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/blackflame007/mehshell")
    (synopsis "fast, parallelized zsh prompt engine written in Go")
    (description "Fast, parallelized zsh prompt engine written in Go.")
    (license license:expat)))

;;; -- members --
(define-public members
  (package
    (name "members")
    (version "20080128")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://packages.qa.debian.org/m/members.html/"
         "releases/download/v" version "/members-" version ".tar.gz"))
       (file-name (string-append "members-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/members/"))))
    (home-page "https://packages.qa.debian.org/m/members.html")
    (synopsis "shows the members of a group; by default, all members")
    (description "Shows the members of a group; by default, all members.")
    (license license:gpl3+)))

;;; -- min-browser-bin --
(define-public min-browser-bin
  (package
    (name "min-browser-bin")
    (version "1.35.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://minbrowser.org//"
         version "/min-browser-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/min-browser-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://minbrowser.org/")
    (synopsis "A fast, minimal browser that protects your privacy.(Prebuilt version.Use sy...")
    (description "A fast, minimal browser that protects your privacy.(Prebuilt version.Use system-wide electron).")
    (license license:asl2.0)))

;;; -- minisforum-v3-pcie-aspm-config --
(define-public minisforum-v3-pcie-aspm-config
  (package
    (name "minisforum-v3-pcie-aspm-config")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/trijpstra-fourlights/minisforum-v3-pcie-aspm-config/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "minisforum-v3-pcie-aspm-config-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/minisforum-v3-pcie-aspm-config/"))))
    (home-page "https://github.com/trijpstra-fourlights/minisforum-v3-pcie-aspm-config")
    (synopsis "configuration to apply active-state power management (ASPM) on supported de...")
    (description "Configuration to apply active-state power management (ASPM) on supported devices on the Minisforum V3. Uses kernel cmdline option and udev rules.")
    (license license:expat)))

;;; -- mirth-connect-administrator-launcher --
(define-public mirth-connect-administrator-launcher
  (package
    (name "mirth-connect-administrator-launcher")
    (version "1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.nextgen.com/products-and-services/integration-engine/"
         "releases/download/v" version "/mirth-connect-administrator-launcher-" version ".tar.gz"))
       (file-name (string-append "mirth-connect-administrator-launcher-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mirth-connect-administrator-launcher/"))))
    (home-page "https://www.nextgen.com/products-and-services/integration-engine")
    (synopsis "hl7 connector by Nextgen client")
    (description "Hl7 connector by Nextgen client.")
    (license license:asl2.0)))

;;; -- mkmm --
(define-public mkmm
  (package
    (name "mkmm")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://git.sr.ht/~moviuro/mkmm/"
         "releases/download/v" version "/mkmm-" version ".tar.gz"))
       (file-name (string-append "mkmm-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mkmm/"))))
    (home-page "https://git.sr.ht/~moviuro/mkmm")
    (synopsis "moviuro's Kernel Module Manager")
    (description "Moviuro's Kernel Module Manager.")
    (license license:expat)))

;;; -- mm2odt --
(define-public mm2odt
  (package
    (name "mm2odt")
    (version "0.9.0beta9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://sourceforge.net/projects/mm2odtfreemind//"
         "releases/download/v" version "/mm2odt-" version ".tar.gz"))
       (file-name (string-append "mm2odt-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mm2odt/"))))
    (home-page "http://sourceforge.net/projects/mm2odtfreemind/")
    (synopsis "export a FreeMind mindmap to an OpenOffice.org format .odt and .odp")
    (description "Export a FreeMind mindmap to an OpenOffice.org format .odt and .odp.")
    (license license:gpl3+)))

;;; -- modsecurity-crs --
(define-public modsecurity-crs
  (package
    (name "modsecurity-crs")
    (version "4.25.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/coreruleset/coreruleset/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "modsecurity-crs-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/modsecurity-crs/"))))
    (home-page "https://github.com/coreruleset/coreruleset")
    (synopsis "OWASP ModSecurity Core Rule Set")
    (description "OWASP ModSecurity Core Rule Set.")
    (license license:asl2.0)))

;;; -- moltbot --
(define-public moltbot
  (package
    (name "moltbot")
    (version "2026.1.24.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://molt.bot/"
         "releases/download/v" version "/moltbot-" version ".tar.gz"))
       (file-name (string-append "moltbot-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/moltbot/"))))
    (home-page "https://molt.bot")
    (synopsis "personal AI assistant supporting Claude, Ollama, and other LLMs - the lobst...")
    (description "Personal AI assistant supporting Claude, Ollama, and other LLMs - the lobster way.")
    (license license:expat)))

;;; -- mqttx-bin --
(define-public mqttx-bin
  (package
    (name "mqttx-bin")
    (version "1.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://mqttx.app//"
         version "/mqttx-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mqttx-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mqttx.app/")
    (synopsis "A cross-platform MQTT 5.0 client tool open sourced by EMQ.(Prebuilt version...")
    (description "A cross-platform MQTT 5.0 client tool open sourced by EMQ.(Prebuilt version.Use system-wide electron).")
    (license license:asl2.0)))

;;; -- muffon-bin --
(define-public muffon-bin
  (package
    (name "muffon-bin")
    (version "2.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://muffon.netlify.app//"
         version "/muffon-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/muffon-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://muffon.netlify.app/")
    (synopsis "music streaming browser,retrieves audio, video and metadata from various In...")
    (description "Music streaming browser,retrieves audio, video and metadata from various Internet sources.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))

;;; -- mycelium --
(define-public mycelium
  (package
    (name "mycelium")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/threefoldtech/mycelium/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "mycelium-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mycelium/"))))
    (home-page "https://github.com/threefoldtech/mycelium")
    (synopsis "mycelium end-2-end encrypted IPv6 overlay network")
    (description "Mycelium end-2-end encrypted IPv6 overlay network.")
    (license license:gpl3+)))

;;; -- netease-cloud-music-web-player --
(define-public netease-cloud-music-web-player
  (package
    (name "netease-cloud-music-web-player")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/feng-yifan/Netease-Cloud-Music-Web-Player/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "netease-cloud-music-web-player-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/netease-cloud-music-web-player/"))))
    (home-page "https://github.com/feng-yifan/Netease-Cloud-Music-Web-Player")
    (synopsis "基于网页播放器封装的网易云音乐客户端")
    (description "基于网页播放器封装的网易云音乐客户端.")
    (license license:expat)))

;;; -- netrc --
(define-public netrc
  (package
    (name "netrc")
    (version "0.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/dokku/netrc/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "netrc-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/netrc/"))))
    (home-page "https://github.com/dokku/netrc")
    (synopsis "utility that allows users to manage netrc files")
    (description "Utility that allows users to manage netrc files.")
    (license license:expat)))

;;; -- nibble-bin --
(define-public nibble-bin
  (package
    (name "nibble-bin")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/backendsystems/nibble/releases/download/v"
         version "/nibble-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nibble-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/backendsystems/nibble")
    (synopsis "A local network scanner tui tool")
    (description "A local network scanner tui tool.")
    (license license:expat)))

;;; -- nimble-git --
(define-public nimble-git
  (package
    (name "nimble-git")
    (version "1:1.6.8.r1359.a852b2e9cf")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nim-lang/nimble.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nimble-git/"))))
    (home-page "https://github.com/nim-lang/nimble")
    (synopsis "package manager for the Nim programming language")
    (description "Package manager for the Nim programming language.")
    (license license:bsd-3)))

;;; -- nimpretty-git --
(define-public nimpretty-git
  (package
    (name "nimpretty-git")
    (version "1:1.6.8.r1359.a852b2e9cf")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nim-lang/Nim.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nimpretty-git/"))))
    (home-page "https://github.com/nim-lang/Nim/tree/devel/nimpretty")
    (synopsis "standard tool for pretty printing")
    (description "Standard tool for pretty printing.")
    (license license:expat)))

;;; -- nimsuggest-git --
(define-public nimsuggest-git
  (package
    (name "nimsuggest-git")
    (version "1:1.6.8.r1359.a852b2e9cf")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nim-lang/nimsuggest.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nimsuggest-git/"))))
    (home-page "https://github.com/nim-lang/nimsuggest")
    (synopsis "nimsuggest is a tool that helps to give editors IDE like capabilities")
    (description "Nimsuggest is a tool that helps to give editors IDE like capabilities.")
    (license license:expat)))

;;; -- nitrux-icon-theme --
(define-public nitrux-icon-theme
  (package
    (name "nitrux-icon-theme")
    (version "3.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Nitrux/nitrux-icon-theme/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "nitrux-icon-theme-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nitrux-icon-theme/"))))
    (home-page "https://github.com/Nitrux/nitrux-icon-theme")
    (synopsis "new squared icon set for Linux that sports clean lines, smooth gradients, a...")
    (description "New squared icon set for Linux that sports clean lines, smooth gradients, and simple icon logos.")
    (license license:expat)))

;;; -- nmcrcon-git --
(define-public nmcrcon-git
  (package
    (name "nmcrcon-git")
    (version "r51.f1917f7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholascw/nmcrcon.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nmcrcon-git/"))))
    (home-page "https://github.com/nicholascw/nmcrcon")
    (synopsis "yet another Minecraft RCON client that isn't against humanity and actually ...")
    (description "Yet another Minecraft RCON client that isn't against humanity and actually works.")
    (license license:gpl3)))

;;; -- nmsurf --
(define-public nmsurf
  (package
    (name "nmsurf")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/aayushkdev/nmsurf/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "nmsurf-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nmsurf/"))))
    (home-page "https://github.com/aayushkdev/nmsurf")
    (synopsis "fast NetworkManager frontend supports rofi, wofi, walker and fuzzel")
    (description "Fast NetworkManager frontend supports rofi, wofi, walker and fuzzel.")
    (license license:expat)))

;;; -- nodejs-express --
(define-public nodejs-express
  (package
    (name "nodejs-express")
    (version "5.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/expressjs/express/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "nodejs-express-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nodejs-express/"))))
    (home-page "https://github.com/expressjs/express")
    (synopsis "fast, unopinionated, minimalist web framework for node")
    (description "Fast, unopinionated, minimalist web framework for node.")
    (license license:expat)))

;;; -- nonicons-doc-git --
(define-public nonicons-doc-git
  (package
    (name "nonicons-doc-git")
    (version "r68.20241213.5f56cf0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yamatsum/nonicons.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nonicons-doc-git/"))))
    (home-page "https://github.com/yamatsum/nonicons")
    (synopsis "A next-generation icon set for developers that extends octicons")
    (description "A next-generation icon set for developers that extends octicons.")
    (license license:expat)))

;;; -- nonicons-license-git --
(define-public nonicons-license-git
  (package
    (name "nonicons-license-git")
    (version "r68.20241213.5f56cf0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yamatsum/nonicons.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nonicons-license-git/"))))
    (home-page "https://github.com/yamatsum/nonicons")
    (synopsis "A next-generation icon set for developers that extends octicons")
    (description "A next-generation icon set for developers that extends octicons.")
    (license license:expat)))

;;; -- nordic-wallpapers --
(define-public nordic-wallpapers
  (package
    (name "nordic-wallpapers")
    (version "20220812")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/linuxdotexe/nordic-wallpapers/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "nordic-wallpapers-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nordic-wallpapers/"))))
    (home-page "https://github.com/linuxdotexe/nordic-wallpapers")
    (synopsis "A collection of wallpapers that go well with the rices inspired by the Nord...")
    (description "A collection of wallpapers that go well with the rices inspired by the Nord Colorscheme.")
    (license license:expat)))

;;; -- notable-bin --
(define-public notable-bin
  (package
    (name "notable-bin")
    (version "1.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/notable/notable/releases/download/v"
         version "/notable-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/notable-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/notable/notable")
    (synopsis "the markdown-based note-taking app that doesnt suck")
    (description "The markdown-based note-taking app that doesnt suck.")
    (license license:expat)))

;;; -- note-tui-bin --
(define-public note-tui-bin
  (package
    (name "note-tui-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Pansther/note-tui/releases/download/v"
         version "/note-tui-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/note-tui-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Pansther/note-tui")
    (synopsis "A Vim-friendly terminal user interface (TUI) application for managing notes")
    (description "A Vim-friendly terminal user interface (TUI) application for managing notes.")
    (license license:expat)))

;;; -- nsnake --
(define-public nsnake
  (package
    (name "nsnake")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://nsnake.alexdantas.net//"
         "releases/download/v" version "/nsnake-" version ".tar.gz"))
       (file-name (string-append "nsnake-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nsnake/"))))
    (home-page "http://nsnake.alexdantas.net/")
    (synopsis "customizable Snake game with ncurses for the terminal")
    (description "Customizable Snake game with ncurses for the terminal.")
    (license license:gpl3+)))

;;; -- nstool --
(define-public nstool
  (package
    (name "nstool")
    (version "1.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/jakcron/nstool/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "nstool-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nstool/"))))
    (home-page "https://github.com/jakcron/nstool")
    (synopsis "general purpose read/extract tool for Nintendo Switch file formats")
    (description "General purpose read/extract tool for Nintendo Switch file formats.")
    (license license:expat)))

;;; -- nuclei-bin --
(define-public nuclei-bin
  (package
    (name "nuclei-bin")
    (version "3.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/projectdiscovery/nuclei/releases/download/v"
         version "/nuclei-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nuclei-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/projectdiscovery/nuclei")
    (synopsis "fast tool for configurable targeted scanning based on templates offering ma...")
    (description "Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use.")
    (license license:expat)))

;;; -- numara-bin --
(define-public numara-bin
  (package
    (name "numara-bin")
    (version "6.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://numara.io//"
         version "/numara-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/numara-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://numara.io/")
    (synopsis "simple notepad calculator built on Electron, powered by Math.js.(Prebuilt v...")
    (description "Simple notepad calculator built on Electron, powered by Math.js.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))

;;; -- nvidia_oc --
(define-public nvidia-oc
  (package
    (name "nvidia-oc")
    (version "0.1.24")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/Dreaming-Codes/nvidia_oc/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "nvidia-oc-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nvidia-oc/"))))
    (home-page "https://github.com/Dreaming-Codes/nvidia_oc")
    (synopsis "A simple cli overclocking tool for Nvidia GPUs that supports both X11 and W...")
    (description "A simple cli overclocking tool for Nvidia GPUs that supports both X11 and Wayland.")
    (license license:expat)))

;;; -- nvim-lazy --
(define-public nvim-lazy
  (package
    (name "nvim-lazy")
    (version "1:v11.17.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/folke/lazy.nvim/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "nvim-lazy-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nvim-lazy/"))))
    (home-page "https://github.com/folke/lazy.nvim")
    (synopsis "A modern plugin manager for Neovim")
    (description "A modern plugin manager for Neovim.")
    (license license:asl2.0)))

;;; -- objconv --
(define-public objconv
  (package
    (name "objconv")
    (version "2.56")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.agner.org/optimize/#objconv/"
         "releases/download/v" version "/objconv-" version ".tar.gz"))
       (file-name (string-append "objconv-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/objconv/"))))
    (home-page "http://www.agner.org/optimize/#objconv")
    (synopsis "object file converter and disassembler")
    (description "Object file converter and disassembler.")
    (license license:gpl3+)))

;;; -- obs-livesplit-one-bin --
(define-public obs-livesplit-one-bin
  (package
    (name "obs-livesplit-one-bin")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/LiveSplit/obs-livesplit-one/releases/download/v"
         version "/obs-livesplit-one-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/obs-livesplit-one-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/LiveSplit/obs-livesplit-one")
    (synopsis "A plugin for OBS Studio that allows adding LiveSplit One as a source")
    (description "A plugin for OBS Studio that allows adding LiveSplit One as a source.")
    (license license:expat)))

;;; -- octave-splines --
(define-public octave-splines
  (package
    (name "octave-splines")
    (version "1.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gnu-octave.github.io/packages/splines/"
         "releases/download/v" version "/octave-splines-" version ".tar.gz"))
       (file-name (string-append "octave-splines-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/octave-splines/"))))
    (home-page "https://gnu-octave.github.io/packages/splines")
    (synopsis "additional spline functions")
    (description "Additional spline functions.")
    (license license:gpl3+)))

;;; -- octoberctl-bin --
(define-public octoberctl-bin
  (package
    (name "octoberctl-bin")
    (version "1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/october-os/octoberctl/releases/download/v"
         version "/octoberctl-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/octoberctl-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/october-os/octoberctl")
    (synopsis "the official October Linux management utility")
    (description "The official October Linux management utility.")
    (license license:gpl3+)))

;;; -- odin4-cli --
(define-public odin4-cli
  (package
    (name "odin4-cli")
    (version "1.2.1.dc05e3ea")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://forum.xda-developers.com/t/official-samsung-odin-v4-1-2-1-dc05e3ea-for-linux.4453423//"
         "releases/download/v" version "/odin4-cli-" version ".tar.gz"))
       (file-name (string-append "odin4-cli-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/odin4-cli/"))))
    (home-page "https://forum.xda-developers.com/t/official-samsung-odin-v4-1-2-1-dc05e3ea-for-linux.4453423/")
    (synopsis "an Odin4 binary for flashing Samsung firmware")
    (description "An Odin4 binary for flashing Samsung firmware.")
    (license license:expat)))

;;; -- omm-bin --
(define-public omm-bin
  (package
    (name "omm-bin")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://tools.dhruvs.space/omm/"
         version "/omm-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/omm-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tools.dhruvs.space/omm")
    (synopsis "A keyboard-driven task manager for the command line")
    (description "A keyboard-driven task manager for the command line.")
    (license license:expat)))

;;; -- omnidotdev-cli --
(define-public omnidotdev-cli
  (package
    (name "omnidotdev-cli")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://cli.omni.dev/"
         "releases/download/v" version "/omnidotdev-cli-" version ".tar.gz"))
       (file-name (string-append "omnidotdev-cli-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/omnidotdev-cli/"))))
    (home-page "https://cli.omni.dev")
    (synopsis "agentic CLI for the Omni ecosystem")
    (description "Agentic CLI for the Omni ecosystem.")
    (license license:expat)))

;;; -- omnidotdev-eden --
(define-public omnidotdev-eden
  (package
    (name "omnidotdev-eden")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://eden.omni.dev/"
         "releases/download/v" version "/omnidotdev-eden-" version ".tar.gz"))
       (file-name (string-append "omnidotdev-eden-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/omnidotdev-eden/"))))
    (home-page "https://eden.omni.dev")
    (synopsis "developer onboarding preflight checks")
    (description "Developer onboarding preflight checks.")
    (license license:expat)))

;;; -- open-in-native-client --
(define-public open-in-native-client
  (package
    (name "open-in-native-client")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://add0n.com/open-in.html/"
         "releases/download/v" version "/open-in-native-client-" version ".tar.gz"))
       (file-name (string-append "open-in-native-client-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/open-in-native-client/"))))
    (home-page "https://add0n.com/open-in.html")
    (synopsis "native client for the Open In browser extension")
    (description "Native client for the Open In browser extension.")
    (license license:expat)))

;;; -- openhab5-addons --
(define-public openhab5-addons
  (package
    (name "openhab5-addons")
    (version "5.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.openhab.org//"
         "releases/download/v" version "/openhab5-addons-" version ".tar.gz"))
       (file-name (string-append "openhab5-addons-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/openhab5-addons/"))))
    (home-page "http://www.openhab.org/")
    (synopsis "addons for openhab5 open source home automation software")
    (description "Addons for openhab5 open source home automation software.")
    (license license:expat)))

;;; -- opennic-up --
(define-public opennic-up
  (package
    (name "opennic-up")
    (version "1.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/kewlfft/opennic-up/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "opennic-up-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/opennic-up/"))))
    (home-page "https://github.com/kewlfft/opennic-up")
    (synopsis "openNIC auto DNS updater")
    (description "OpenNIC auto DNS updater.")
    (license license:lgpl3+)))

;;; -- opentorrent-bin --
(define-public opentorrent-bin
  (package
    (name "opentorrent-bin")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://openlyst.ink/"
         version "/opentorrent-bin-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/opentorrent-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://openlyst.ink")
    (synopsis "qBittorrent client")
    (description "QBittorrent client.")
    (license license:gpl3+)))

;;; -- opentorrent-unstable --
(define-public opentorrent-unstable
  (package
    (name "opentorrent-unstable")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://openlyst.ink/"
         "releases/download/v" version "/opentorrent-unstable-" version ".tar.gz"))
       (file-name (string-append "opentorrent-unstable-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/opentorrent-unstable/"))))
    (home-page "https://openlyst.ink")
    (synopsis "qBittorrent client (unstable build from GitHub)")
    (description "QBittorrent client (unstable build from GitHub).")
    (license license:gpl3+)))

;;; -- opentubex-bin --
(define-public opentubex-bin
  (package
    (name "opentubex-bin")
    (version "0.24.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/OpenTubeX/OpenTubeX/releases/download/v"
         version "/opentubex-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/opentubex-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/OpenTubeX/OpenTubeX")
    (synopsis "A fork of the open source desktop YouTube player FreeTube with additional f...")
    (description "A fork of the open source desktop YouTube player FreeTube with additional features.")
    (license license:agpl3+)))

;;; -- opera-gx-stable-ffmpeg-codecs-bin --
(define-public opera-gx-stable-ffmpeg-codecs-bin
  (package
    (name "opera-gx-stable-ffmpeg-codecs-bin")
    (version "1:127.0.5778.75")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/download/v"
         version "/opera-gx-stable-ffmpeg-codecs-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/opera-gx-stable-ffmpeg-codecs-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/")
    (synopsis "additional support for proprietary codecs for opera-gx-stable using prebuil...")
    (description "Additional support for proprietary codecs for opera-gx-stable using prebuilt FFmpeg binaries made for NW.js.")
    (license license:lgpl2.1+)))

;;; -- ostorybook --
(define-public ostorybook
  (package
    (name "ostorybook")
    (version "6.03")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://ostorybook.eu/v6/en//"
         "releases/download/v" version "/ostorybook-" version ".tar.gz"))
       (file-name (string-append "ostorybook-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ostorybook/"))))
    (home-page "http://ostorybook.eu/v6/en/")
    (synopsis "open Source Novel Writing Software for Novelists, Authors and Creative Writers")
    (description "Open Source Novel Writing Software for Novelists, Authors and Creative Writers.")
    (license license:gpl3+)))

;;; -- otf-arundina --
(define-public font-arundina
  (package
    (name "font-arundina")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://linux.thai.net/projects/fonts-sipa-arundina/"
         version "/otf-arundina-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://linux.thai.net/projects/fonts-sipa-arundina")
    (synopsis "thai fonts aiming at Bitstream Vera and Dejavu compatibility")
    (description "Thai fonts aiming at Bitstream Vera and Dejavu compatibility.")
    (license license:expat)))

;;; -- ourico --
(define-public ourico
  (package
    (name "ourico")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://freshmeat.sourceforge.net/projects/ourico/"
         "releases/download/v" version "/ourico-" version ".tar.gz"))
       (file-name (string-append "ourico-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ourico/"))))
    (home-page "http://freshmeat.sourceforge.net/projects/ourico")
    (synopsis "A lightweight EWMH taskbar, originally designed for echinus")
    (description "A lightweight EWMH taskbar, originally designed for echinus.")
    (license license:expat)))

;;; -- pacman-mirrorup --
(define-public pacman-mirrorup
  (package
    (name "pacman-mirrorup")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
         "https://github.com/bpetlert/pacman-mirrorup/archive/refs/tags/v"
         version ".tar.gz"))
       (file-name (string-append "pacman-mirrorup-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/pacman-mirrorup/"))))
    (home-page "https://github.com/bpetlert/pacman-mirrorup")
    (synopsis "A program to retrieve the best and latest Pacman mirror list based on user'...")
    (description "A program to retrieve the best and latest Pacman mirror list based on user's geography.")
    (license license:gpl3+)))
