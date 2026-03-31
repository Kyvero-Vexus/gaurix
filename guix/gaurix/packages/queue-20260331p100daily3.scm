;;; Queue drain module for queue-20260331p100daily3 (2026-03-31, 100 TODO entries).
;;; Aliases TODO queue names to resolvable Guix package specifications.
(define-module (gaurix packages queue-20260331p100daily3)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:export (
            lazarus-gtk3-git
            lazarus-qt6-git
            audacious-gtk3
            klassy-qt5-git
            qbittorrent-cli
            kvantum-qt5-git
            autotrace
            fasttext
            monado
            st
            redis
            gtkglext
            zile
            fdroidserver
            gnucobol
            python-pulsectl
            gtk
            glib
            sdl2
            pass-tomb
            gnunet
            xmenu
            proot
            smem
            cachefilesd
            mcrl2
            python-pymc
            rdiff-backup
            drawpile
            freeimage
            python-pytest-runner
            pup
            friction
            dstask
            fava
            python-angr
            greybird-gtk-theme
            pijul
            mp3info
            python-m2crypto
            perl-set-object
            xkb-switch
            protoc-gen-go
            imppg
            python-flask-httpauth
            feedgnuplot
            pfetch
            poweralertd
            faudio
            xwayland-run
            gtypist
            clementine
            libsepol
            kanata
            mysql
            vkquake
            abcde
            iocaine
            python-nbt
            instead
            clustershell
            pgloader
            qdmr
            stepmania
            iwgtk
            gromit-mpx
            tuxguitar
            satdump
            python-click-default-group
            coccinelle
            python-async-timeout
            grass
            gpredict
            flightgear
            openhmd
            wl-clipboard-x11
            python-stdnum
            gojq
            ocaml-sqlite3
            ocaml-extlib
            ocaml-ounit
            ocaml-lwt
            ocaml-react
            ocaml-easy-format
            ocaml-biniou
            ocaml-yojson
            ocaml-ppxlib
            wiggle
            vo-amrwbenc
            catgirl
            python-pymsgbox
            meshoptimizer
            xremap-kde
            xssproxy
            camlidl
            ptouch-print
            ptpython
            leafpad
            dualsensectl
            steghide))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

(define-public lazarus-gtk3-git
  (gaurix-alias-package "lazarus-gtk3-git" "lazarus"))
(define-public lazarus-qt6-git
  (gaurix-alias-package "lazarus-qt6-git" "lazarus"))
(define-public audacious-gtk3
  (gaurix-alias-package "audacious-gtk3" "audacious"))
(define-public klassy-qt5-git
  (gaurix-alias-package "klassy-qt5-git" "klassy"))
(define-public qbittorrent-cli
  (gaurix-alias-package "qbittorrent-cli" "qbittorrent"))
(define-public kvantum-qt5-git
  (gaurix-alias-package "kvantum-qt5-git" "kvantum"))
(define-public autotrace
  (gaurix-alias-package "autotrace" "autotrace"))
(define-public fasttext
  (gaurix-alias-package "fasttext" "fasttext"))
(define-public monado
  (gaurix-alias-package "monado" "monado"))
(define-public st
  (gaurix-alias-package "st" "st"))
(define-public redis
  (gaurix-alias-package "redis" "redis"))
(define-public gtkglext
  (gaurix-alias-package "gtkglext" "gtkglext"))
(define-public zile
  (gaurix-alias-package "zile" "zile"))
(define-public fdroidserver
  (gaurix-alias-package "fdroidserver" "fdroidserver"))
(define-public gnucobol
  (gaurix-alias-package "gnucobol" "gnucobol"))
(define-public python-pulsectl
  (gaurix-alias-package "python-pulsectl" "python-pulsectl"))
(define-public gtk
  (gaurix-alias-package "gtk" "gtk"))
(define-public glib
  (gaurix-alias-package "glib" "glib"))
(define-public sdl2
  (gaurix-alias-package "sdl2" "sdl2"))
(define-public pass-tomb
  (gaurix-alias-package "pass-tomb" "pass-tomb"))
(define-public gnunet
  (gaurix-alias-package "gnunet" "gnunet"))
(define-public xmenu
  (gaurix-alias-package "xmenu" "xmenu"))
(define-public proot
  (gaurix-alias-package "proot" "proot"))
(define-public smem
  (gaurix-alias-package "smem" "smem"))
(define-public cachefilesd
  (gaurix-alias-package "cachefilesd" "cachefilesd"))
(define-public mcrl2
  (gaurix-alias-package "mcrl2" "mcrl2"))
(define-public python-pymc
  (gaurix-alias-package "python-pymc" "python-pymc"))
(define-public rdiff-backup
  (gaurix-alias-package "rdiff-backup" "rdiff-backup"))
(define-public drawpile
  (gaurix-alias-package "drawpile" "drawpile"))
(define-public freeimage
  (gaurix-alias-package "freeimage" "freeimage"))
(define-public python-pytest-runner
  (gaurix-alias-package "python-pytest-runner" "python-pytest-runner"))
(define-public pup
  (gaurix-alias-package "pup" "pup"))
(define-public friction
  (gaurix-alias-package "friction" "friction"))
(define-public dstask
  (gaurix-alias-package "dstask" "dstask"))
(define-public fava
  (gaurix-alias-package "fava" "fava"))
(define-public python-angr
  (gaurix-alias-package "python-angr" "python-angr"))
(define-public greybird-gtk-theme
  (gaurix-alias-package "greybird-gtk-theme" "greybird-gtk-theme"))
(define-public pijul
  (gaurix-alias-package "pijul" "pijul"))
(define-public mp3info
  (gaurix-alias-package "mp3info" "mp3info"))
(define-public python-m2crypto
  (gaurix-alias-package "python-m2crypto" "python-m2crypto"))
(define-public perl-set-object
  (gaurix-alias-package "perl-set-object" "perl-set-object"))
(define-public xkb-switch
  (gaurix-alias-package "xkb-switch" "xkb-switch"))
(define-public protoc-gen-go
  (gaurix-alias-package "protoc-gen-go" "protoc-gen-go"))
(define-public imppg
  (gaurix-alias-package "imppg" "imppg"))
(define-public python-flask-httpauth
  (gaurix-alias-package "python-flask-httpauth" "python-flask-httpauth"))
(define-public feedgnuplot
  (gaurix-alias-package "feedgnuplot" "feedgnuplot"))
(define-public pfetch
  (gaurix-alias-package "pfetch" "pfetch"))
(define-public poweralertd
  (gaurix-alias-package "poweralertd" "poweralertd"))
(define-public faudio
  (gaurix-alias-package "faudio" "faudio"))
(define-public xwayland-run
  (gaurix-alias-package "xwayland-run" "xwayland-run"))
(define-public gtypist
  (gaurix-alias-package "gtypist" "gtypist"))
(define-public clementine
  (gaurix-alias-package "clementine" "clementine"))
(define-public libsepol
  (gaurix-alias-package "libsepol" "libsepol"))
(define-public kanata
  (gaurix-alias-package "kanata" "kanata"))
(define-public mysql
  (gaurix-alias-package "mysql" "mysql"))
(define-public vkquake
  (gaurix-alias-package "vkquake" "vkquake"))
(define-public abcde
  (gaurix-alias-package "abcde" "abcde"))
(define-public iocaine
  (gaurix-alias-package "iocaine" "iocaine"))
(define-public python-nbt
  (gaurix-alias-package "python-nbt" "python-nbt"))
(define-public instead
  (gaurix-alias-package "instead" "instead"))
(define-public clustershell
  (gaurix-alias-package "clustershell" "clustershell"))
(define-public pgloader
  (gaurix-alias-package "pgloader" "pgloader"))
(define-public qdmr
  (gaurix-alias-package "qdmr" "qdmr"))
(define-public stepmania
  (gaurix-alias-package "stepmania" "stepmania"))
(define-public iwgtk
  (gaurix-alias-package "iwgtk" "iwgtk"))
(define-public gromit-mpx
  (gaurix-alias-package "gromit-mpx" "gromit-mpx"))
(define-public tuxguitar
  (gaurix-alias-package "tuxguitar" "tuxguitar"))
(define-public satdump
  (gaurix-alias-package "satdump" "satdump"))
(define-public python-click-default-group
  (gaurix-alias-package "python-click-default-group" "python-click-default-group"))
(define-public coccinelle
  (gaurix-alias-package "coccinelle" "coccinelle"))
(define-public python-async-timeout
  (gaurix-alias-package "python-async-timeout" "python-async-timeout"))
(define-public grass
  (gaurix-alias-package "grass" "grass"))
(define-public gpredict
  (gaurix-alias-package "gpredict" "gpredict"))
(define-public flightgear
  (gaurix-alias-package "flightgear" "flightgear"))
(define-public openhmd
  (gaurix-alias-package "openhmd" "openhmd"))
(define-public wl-clipboard-x11
  (gaurix-alias-package "wl-clipboard-x11" "wl-clipboard-x11"))
(define-public python-stdnum
  (gaurix-alias-package "python-stdnum" "python-stdnum"))
(define-public gojq
  (gaurix-alias-package "gojq" "gojq"))
(define-public ocaml-sqlite3
  (gaurix-alias-package "ocaml-sqlite3" "ocaml-sqlite3"))
(define-public ocaml-extlib
  (gaurix-alias-package "ocaml-extlib" "ocaml-extlib"))
(define-public ocaml-ounit
  (gaurix-alias-package "ocaml-ounit" "ocaml-ounit"))
(define-public ocaml-lwt
  (gaurix-alias-package "ocaml-lwt" "ocaml-lwt"))
(define-public ocaml-react
  (gaurix-alias-package "ocaml-react" "ocaml-react"))
(define-public ocaml-easy-format
  (gaurix-alias-package "ocaml-easy-format" "ocaml-easy-format"))
(define-public ocaml-biniou
  (gaurix-alias-package "ocaml-biniou" "ocaml-biniou"))
(define-public ocaml-yojson
  (gaurix-alias-package "ocaml-yojson" "ocaml-yojson"))
(define-public ocaml-ppxlib
  (gaurix-alias-package "ocaml-ppxlib" "ocaml-ppxlib"))
(define-public wiggle
  (gaurix-alias-package "wiggle" "wiggle"))
(define-public vo-amrwbenc
  (gaurix-alias-package "vo-amrwbenc" "vo-amrwbenc"))
(define-public catgirl
  (gaurix-alias-package "catgirl" "catgirl"))
(define-public python-pymsgbox
  (gaurix-alias-package "python-pymsgbox" "python-pymsgbox"))
(define-public meshoptimizer
  (gaurix-alias-package "meshoptimizer" "meshoptimizer"))
(define-public xremap-kde
  (gaurix-alias-package "xremap-kde" "xremap-kde"))
(define-public xssproxy
  (gaurix-alias-package "xssproxy" "xssproxy"))
(define-public camlidl
  (gaurix-alias-package "camlidl" "camlidl"))
(define-public ptouch-print
  (gaurix-alias-package "ptouch-print" "ptouch-print"))
(define-public ptpython
  (gaurix-alias-package "ptpython" "ptpython"))
(define-public leafpad
  (gaurix-alias-package "leafpad" "leafpad"))
(define-public dualsensectl
  (gaurix-alias-package "dualsensectl" "dualsensectl"))
(define-public steghide
  (gaurix-alias-package "steghide" "steghide"))
