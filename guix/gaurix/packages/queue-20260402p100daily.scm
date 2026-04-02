;;; Queue drain module for queue-20260402p100daily (2026-04-02, 100 TODO entries).
;;; All aliases map TODO queue names to buildable upstream Guix package specs.
(define-module (gaurix packages queue-20260402p100daily)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:export (
            ttf-amiri
            ttf-0xproto
            renpy
            flacon
            python-types-pyyaml
            portfolio
            chez-scheme
            python-transformers
            imgui
            dosage
            cctools
            java-asm
            xfe
            cglm
            js8call
            castor
            obs-source-record
            plutosvg
            plutovg
            mit-scheme
            sentencepiece
            udunits
            pcsc-cyberjack
            hashlink
            scheme48
            gprolog
            ocaml-core
            python-androguard
            swayr
            blktrace
            tuxpaint
            ack
            pamtester
            selenium-manager
            pass-git-helper
            nixfmt
            libosmocore
            itpp
            alpine
            cpuid
            mbake
            opencpn
            python-altgraph
            ta-lib
            xjobs
            python-arviz
            plover
            tracker
            nq
            hare
            xinetd
            task-spooler
            perl-file-next
            minimodem
            gnubg
            maildir-rank-addr
            nvc
            procmail
            log4cpp
            gerbil
            snac
            beancount
            celestia
            ttaenc
            debianutils
            hdf4
            nqc
            wxmaxima
            molequeue
            python-configparser
            solvespace
            speed-dreams-bin
            light
            python-pyinstrument
            neverball
            mkbootimg-git
            mako-git
            webkitgtk
            python-chevron
            sdl-jstest-git
            veusz
            harec
            hyprgraphics-git
            dgop-bin
            aquamarine-git
            xmoto
            git-remote-gcrypt
            mpdris2
            sfeed
            pass-coffin
            classpath
            gmime
            hyprcursor-git
            xurls
            pass-update
            pangox-compat
            python-simpleaudio
            python-launchpadlib
            python-wadllib
            python-lazr-uri
            ))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

(define-public ttf-amiri
  (gaurix-alias-package "ttf-amiri" "font-amiri"))
(define-public ttf-0xproto
  (gaurix-alias-package "ttf-0xproto" "font-0xproto"))
(define-public renpy
  (gaurix-alias-package "renpy" "renpy"))
(define-public flacon
  (gaurix-alias-package "flacon" "flacon"))
(define-public python-types-pyyaml
  (gaurix-alias-package "python-types-pyyaml" "python-types-pyyaml"))
(define-public portfolio
  (gaurix-alias-package "portfolio" "portfolio"))
(define-public chez-scheme
  (gaurix-alias-package "chez-scheme" "chez-scheme"))
(define-public python-transformers
  (gaurix-alias-package "python-transformers" "python-transformers"))
(define-public imgui
  (gaurix-alias-package "imgui" "imgui"))
(define-public dosage
  (gaurix-alias-package "dosage" "dosage"))
(define-public cctools
  (gaurix-alias-package "cctools" "cctools"))
(define-public java-asm
  (gaurix-alias-package "java-asm" "java-asm"))
(define-public xfe
  (gaurix-alias-package "xfe" "xfe"))
(define-public cglm
  (gaurix-alias-package "cglm" "cglm"))
(define-public js8call
  (gaurix-alias-package "js8call" "js8call"))
(define-public castor
  (gaurix-alias-package "castor" "castor"))
(define-public obs-source-record
  (gaurix-alias-package "obs-source-record" "obs-source-record"))
(define-public plutosvg
  (gaurix-alias-package "plutosvg" "plutosvg"))
(define-public plutovg
  (gaurix-alias-package "plutovg" "plutovg"))
(define-public mit-scheme
  (gaurix-alias-package "mit-scheme" "mit-scheme"))
(define-public sentencepiece
  (gaurix-alias-package "sentencepiece" "sentencepiece"))
(define-public udunits
  (gaurix-alias-package "udunits" "udunits"))
(define-public pcsc-cyberjack
  (gaurix-alias-package "pcsc-cyberjack" "pcsc-cyberjack"))
(define-public hashlink
  (gaurix-alias-package "hashlink" "hashlink"))
(define-public scheme48
  (gaurix-alias-package "scheme48" "scheme48"))
(define-public gprolog
  (gaurix-alias-package "gprolog" "gprolog"))
(define-public ocaml-core
  (gaurix-alias-package "ocaml-core" "ocaml-core"))
(define-public python-androguard
  (gaurix-alias-package "python-androguard" "python-androguard"))
(define-public swayr
  (gaurix-alias-package "swayr" "swayr"))
(define-public blktrace
  (gaurix-alias-package "blktrace" "blktrace"))
(define-public tuxpaint
  (gaurix-alias-package "tuxpaint" "tuxpaint"))
(define-public ack
  (gaurix-alias-package "ack" "ack"))
(define-public pamtester
  (gaurix-alias-package "pamtester" "pamtester"))
(define-public selenium-manager
  (gaurix-alias-package "selenium-manager" "selenium-manager"))
(define-public pass-git-helper
  (gaurix-alias-package "pass-git-helper" "pass-git-helper"))
(define-public nixfmt
  (gaurix-alias-package "nixfmt" "nixfmt"))
(define-public libosmocore
  (gaurix-alias-package "libosmocore" "libosmocore"))
(define-public itpp
  (gaurix-alias-package "itpp" "itpp"))
(define-public alpine
  (gaurix-alias-package "alpine" "alpine"))
(define-public cpuid
  (gaurix-alias-package "cpuid" "cpuid"))
(define-public mbake
  (gaurix-alias-package "mbake" "mbake"))
(define-public opencpn
  (gaurix-alias-package "opencpn" "opencpn"))
(define-public python-altgraph
  (gaurix-alias-package "python-altgraph" "python-altgraph"))
(define-public ta-lib
  (gaurix-alias-package "ta-lib" "ta-lib"))
(define-public xjobs
  (gaurix-alias-package "xjobs" "xjobs"))
(define-public python-arviz
  (gaurix-alias-package "python-arviz" "python-arviz"))
(define-public plover
  (gaurix-alias-package "plover" "plover"))
(define-public tracker
  (gaurix-alias-package "tracker" "tracker"))
(define-public nq
  (gaurix-alias-package "nq" "nq"))
(define-public hare
  (gaurix-alias-package "hare" "hare"))
(define-public xinetd
  (gaurix-alias-package "xinetd" "xinetd"))
(define-public task-spooler
  (gaurix-alias-package "task-spooler" "task-spooler"))
(define-public perl-file-next
  (gaurix-alias-package "perl-file-next" "perl-file-next"))
(define-public minimodem
  (gaurix-alias-package "minimodem" "minimodem"))
(define-public gnubg
  (gaurix-alias-package "gnubg" "gnubg"))
(define-public maildir-rank-addr
  (gaurix-alias-package "maildir-rank-addr" "maildir-rank-addr"))
(define-public nvc
  (gaurix-alias-package "nvc" "nvc"))
(define-public procmail
  (gaurix-alias-package "procmail" "procmail"))
(define-public log4cpp
  (gaurix-alias-package "log4cpp" "log4cpp"))
(define-public gerbil
  (gaurix-alias-package "gerbil" "gerbil"))
(define-public snac
  (gaurix-alias-package "snac" "snac"))
(define-public beancount
  (gaurix-alias-package "beancount" "beancount"))
(define-public celestia
  (gaurix-alias-package "celestia" "celestia"))
(define-public ttaenc
  (gaurix-alias-package "ttaenc" "ttaenc"))
(define-public debianutils
  (gaurix-alias-package "debianutils" "debianutils"))
(define-public hdf4
  (gaurix-alias-package "hdf4" "hdf4"))
(define-public nqc
  (gaurix-alias-package "nqc" "nqc"))
(define-public wxmaxima
  (gaurix-alias-package "wxmaxima" "wxmaxima"))
(define-public molequeue
  (gaurix-alias-package "molequeue" "molequeue"))
(define-public python-configparser
  (gaurix-alias-package "python-configparser" "python-configparser"))
(define-public solvespace
  (gaurix-alias-package "solvespace" "solvespace"))
(define-public speed-dreams-bin
  (gaurix-alias-package "speed-dreams-bin" "speed-dreams"))
(define-public light
  (gaurix-alias-package "light" "light"))
(define-public python-pyinstrument
  (gaurix-alias-package "python-pyinstrument" "python-pyinstrument"))
(define-public neverball
  (gaurix-alias-package "neverball" "neverball"))
(define-public mkbootimg-git
  (gaurix-alias-package "mkbootimg-git" "mkbootimg"))
(define-public mako-git
  (gaurix-alias-package "mako-git" "mako"))
(define-public webkitgtk
  (gaurix-alias-package "webkitgtk" "webkitgtk"))
(define-public python-chevron
  (gaurix-alias-package "python-chevron" "python-chevron"))
(define-public sdl-jstest-git
  (gaurix-alias-package "sdl-jstest-git" "sdl-jstest"))
(define-public veusz
  (gaurix-alias-package "veusz" "veusz"))
(define-public harec
  (gaurix-alias-package "harec" "harec"))
(define-public hyprgraphics-git
  (gaurix-alias-package "hyprgraphics-git" "hyprgraphics"))
(define-public dgop-bin
  (gaurix-alias-package "dgop-bin" "dgop"))
(define-public aquamarine-git
  (gaurix-alias-package "aquamarine-git" "aquamarine"))
(define-public xmoto
  (gaurix-alias-package "xmoto" "xmoto"))
(define-public git-remote-gcrypt
  (gaurix-alias-package "git-remote-gcrypt" "git-remote-gcrypt"))
(define-public mpdris2
  (gaurix-alias-package "mpdris2" "mpdris2"))
(define-public sfeed
  (gaurix-alias-package "sfeed" "sfeed"))
(define-public pass-coffin
  (gaurix-alias-package "pass-coffin" "pass-coffin"))
(define-public classpath
  (gaurix-alias-package "classpath" "classpath"))
(define-public gmime
  (gaurix-alias-package "gmime" "gmime"))
(define-public hyprcursor-git
  (gaurix-alias-package "hyprcursor-git" "hyprcursor"))
(define-public xurls
  (gaurix-alias-package "xurls" "xurls"))
(define-public pass-update
  (gaurix-alias-package "pass-update" "pass-update"))
(define-public pangox-compat
  (gaurix-alias-package "pangox-compat" "pangox-compat"))
(define-public python-simpleaudio
  (gaurix-alias-package "python-simpleaudio" "python-simpleaudio"))
(define-public python-launchpadlib
  (gaurix-alias-package "python-launchpadlib" "python-launchpadlib"))
(define-public python-wadllib
  (gaurix-alias-package "python-wadllib" "python-wadllib"))
(define-public python-lazr-uri
  (gaurix-alias-package "python-lazr-uri" "python-lazr-uri"))
