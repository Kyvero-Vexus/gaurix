;; -*- mode: scheme; coding: utf-8 -*-
;;; recipe-resolver-260426c: 100 packages attempted (100 recipes, 0 blocked)
;;; Generated from AUR PKGBUILDs via queue-drain pass.

(define-module (gaurix packages recipe-resolver-260426c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
   su-exec
   suck
   svfs
   swaycwd
   swfmill
   symboleditor
   synthclone
   sysrss
   systester-cli-bin
   t-rec
   t2n
   taarich
   tab-rs
   tailor-hwcaps
   tailscaledesktop
   talon-bin
   tangerine-icon-theme
   tapecalc
   taschenrechner
   task-maker-rust
   tcping-go-bin
   teal
   lua53-tl
   tecnoballz
   teg
   templ-bin
   tera-cli
   termpub
   terraform-lsp
   terraform11
   tetronimia
   tex-match
   texel
   therion
   think
   threelayout
   ticemu
   tightvnc-jviewer
   timer-rs
   timerdown
   timetrace-bin
   tiny-dnn
   todd
   toluol
   tony
   topal
   tpasm
   treefetch
   trello-cli
   trenta-icons
   try
   tsnake
   tty-copy
   tuc
   tuimoji
   tumbler-folder-thumbnailer
   tut-mastodon
   tuxtrain
   tv
   twitch-dl-bin
   txdx
   typioca
   u3d
   uarmsolver
   uclibc-ng
   udp-over-tcp
   ultralist
   umleditor
   unfs3
   unifetch
   uniread
   univga
   unsilence
   urw-classico
   usbmon
   uvg266
   vdmfec
   vegastrike
   venom
   verdaccio
   verifpal
   vfu
   victoriametrics-bin
   vidmerger-bin
   vido
   viper-bin
   vpkedit-bin
   wait4x
   waon
   war1gus
   waybackurls
   wch-isp
   webchanges
   weborf
   webtrees
   wgsl-analyzer-bin
   wifi-password
   wiliwili
   windowchef
   windowlab
   ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; su-exec — switch user and group id, setgroups and exec
(define-public su-exec
  (package
    (name "su-exec")
    (version "0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/su-exec.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ncopa/su-exec")
    (synopsis "switch user and group id, setgroups and exec")
    (description "switch user and group id, setgroups and exec.")
    (license license:expat)))

;;; suck — Download news from remote NNTP server.
(define-public suck
  (package
    (name "suck")
    (version "4.3.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/suck.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://linux.maruhn.com/sec/sucks.html")
    (synopsis "download news from remote NNTP server")
    (description "Download news from remote NNTP server.")
    (license license:nonfree)))

;;; svfs — The Swift Virtual File System for hubiC (ovh)
(define-public svfs
  (package
    (name "svfs")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/svfs.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ovh/svfs")
    (synopsis "the Swift Virtual File System for hubiC (ovh)")
    (description "The Swift Virtual File System for hubiC (ovh).")
    (license license:bsd-3)))

;;; swaycwd — alternative to xcwd for swayvm
(define-public swaycwd
  (package
    (name "swaycwd")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/swaycwd.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://webcache.googleusercontent.com/search?q=cache:fXlJ80wnYwgJ:https://www.reddit.com/r/swaywm/comments/ayedi1/opening_terminals_at_the_same_directory/+&cd=1&hl=de&ct=clnk&gl=de&client=firefox-b-d")
    (synopsis "alternative to xcwd for swayvm")
    (description "alternative to xcwd for swayvm.")
    (license license:nonfree)))

;;; swfmill — xml2swf and swf2xml processor with import functionalities
(define-public swfmill
  (package
    (name "swfmill")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/swfmill.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://swfmill.org")
    (synopsis "xml2swf and swf2xml processor with import functionalities")
    (description "xml2swf and swf2xml processor with import functionalities.")
    (license license:gpl3+)))

;;; symboleditor — Symbol editor for KXStitch
(define-public symboleditor
  (package
    (name "symboleditor")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/symboleditor.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://userbase.kde.org/SymbolEditor")
    (synopsis "symbol editor for KXStitch")
    (description "Symbol editor for KXStitch.")
    (license license:gpl3+)))

;;; synthclone — A tool to automate sampling of MIDI-capable instruments.
(define-public synthclone
  (package
    (name "synthclone")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/synthclone.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/surfacepatterns/synthclone/")
    (synopsis "A tool to automate sampling of MIDI-capable instruments")
    (description "A tool to automate sampling of MIDI-capable instruments.")
    (license (list license:gpl3+ license:lgpl3+))))

;;; sysrss — Let your system generate a maintenance notification RSS
(define-public sysrss
  (package
    (name "sysrss")
    (version "2.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sysrss.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/maandree/sysrss")
    (synopsis "let your system generate a maintenance notification RSS")
    (description "Let your system generate a maintenance notification RSS.")
    (license license:gpl3)))

;;; systester-cli-bin — System Stability Tester is a RAM/CPU burning and benchmarking program 
(define-public systester-cli-bin
  (package
    (name "systester-cli-bin")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/systester-cli-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://systester.sourceforge.net/")
    (synopsis "system Stability Tester is a RAM/CPU burning and benchmarking program based o...")
    (description "System Stability Tester is a RAM/CPU burning and benchmarking program based on calculating pi.")
    (license license:gpl3+)))

;;; t-rec — Blazingly fast terminal recorder
(define-public t-rec
  (package
    (name "t-rec")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/t-rec.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sassman/t-rec-rs")
    (synopsis "blazingly fast terminal recorder")
    (description "Blazingly fast terminal recorder.")
    (license license:gpl3)))

;;; t2n — A Tool for communication between PC and Lego NXT over usb
(define-public t2n
  (package
    (name "t2n")
    (version "0.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/t2n.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www-verimag.imag.fr/~raymond/home/tools/t2n/")
    (synopsis "A Tool for communication between PC and Lego NXT over usb")
    (description "A Tool for communication between PC and Lego NXT over usb.")
    (license license:lgpl3+)))

;;; taarich — Summary: Tells the Hebrew date, Torah readings, and generates calendar
(define-public taarich
  (package
    (name "taarich")
    (version "1.20051120")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/taarich.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.math.technion.ac.il/S/rl/calendar/gauss/")
    (synopsis "summary: Tells the Hebrew date, Torah readings, and generates calendars")
    (description "Summary: Tells the Hebrew date, Torah readings, and generates calendars.")
    (license license:bsd-3)))

;;; tab-rs — The intuitive config-driven terminal multiplexer
(define-public tab-rs
  (package
    (name "tab-rs")
    (version "1:0.5.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tab-rs.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/austinjones/tab-rs")
    (synopsis "the intuitive config-driven terminal multiplexer")
    (description "The intuitive config-driven terminal multiplexer.")
    (license license:expat)))

;;; tailor-hwcaps — CLI tool for checking Tuxedo hardware capabilites (part of tuxedo-rs)
(define-public tailor-hwcaps
  (package
    (name "tailor-hwcaps")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tailor-hwcaps.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AaronErhardt/tuxedo-rs/")
    (synopsis "CLI tool for checking Tuxedo hardware capabilites (part of tuxedo-rs)")
    (description "CLI tool for checking Tuxedo hardware capabilites (part of tuxedo-rs).")
    (license license:gpl2+)))

;;; tailscaledesktop — Unnofficial Tailscale desktop application
(define-public tailscaledesktop
  (package
    (name "tailscaledesktop")
    (version "1.0.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tailscaledesktop.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/linuxbombay/tailscaledesktop")
    (synopsis "unnofficial Tailscale desktop application")
    (description "Unnofficial Tailscale desktop application.")
    (license license:gpl3+)))

;;; talon-bin — Powerful hands-free voice and gaze input scriptable with Python
(define-public talon-bin
  (package
    (name "talon-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/talon-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://talonvoice.com/")
    (synopsis "powerful hands-free voice and gaze input scriptable with Python")
    (description "Powerful hands-free voice and gaze input scriptable with Python.")
    (license license:nonfree)))

;;; tangerine-icon-theme — Ubuntu's twist on the Tango icon theme
(define-public tangerine-icon-theme
  (package
    (name "tangerine-icon-theme")
    (version "0.27")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tangerine-icon-theme.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://launchpad.net/tangerine-icon-theme/")
    (synopsis "ubuntu's twist on the Tango icon theme")
    (description "Ubuntu's twist on the Tango icon theme.")
    (license license:nonfree)))

;;; tapecalc — Fixed-point calculator as a fullscreen editor. You may edit at any pos
(define-public tapecalc
  (package
    (name "tapecalc")
    (version "t20250914")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tapecalc.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://invisible-island.net/add/add.html")
    (synopsis "fixed-point calculator as a fullscreen editor. You may edit at any position i...")
    (description "Fixed-point calculator as a fullscreen editor. You may edit at any position in the expression list. Supports basic arithmetic, interest and sales tax computation. Designed for use as a checkbook or expense-account balancing tool. Formerly known as 'add'.")
    (license license:nonfree)))

;;; taschenrechner — a cli-calculator written in rust
(define-public taschenrechner
  (package
    (name "taschenrechner")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/taschenrechner.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.fem-net.de/mabl/taschenrechner")
    (synopsis "a cli-calculator written in rust")
    (description "a cli-calculator written in rust.")
    (license license:gpl3+)))

;;; task-maker-rust — Tool for building tasks for informatics competitions, with support for
(define-public task-maker-rust
  (package
    (name "task-maker-rust")
    (version "0.6.22")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/task-maker-rust.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/olimpiadi-informatica/task-maker-rust")
    (synopsis "tool for building tasks for informatics competitions, with support for cache,...")
    (description "Tool for building tasks for informatics competitions, with support for cache, distributed computations and more.")
    (license license:mpl2.0)))

;;; tcping-go-bin — Ping TCP ports. Inspired by Linux's ping utility. Written in Go
(define-public tcping-go-bin
  (package
    (name "tcping-go-bin")
    (version "2.7.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tcping-go-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pouriyajamshidi/tcping")
    (synopsis "ping TCP ports. Inspired by Linux's ping utility. Written in Go")
    (description "Ping TCP ports. Inspired by Linux's ping utility. Written in Go.")
    (license license:expat)))

;;; teal — The compiler for Teal, a typed dialect of Lua
(define-public teal
  (package
    (name "teal")
    (version "0.24.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/teal.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/teal-language/tl")
    (synopsis "the compiler for Teal, a typed dialect of Lua")
    (description "The compiler for Teal, a typed dialect of Lua.")
    (license license:expat)))

;;; lua53-tl — The compiler for Teal, a typed dialect of Lua
(define-public lua53-tl
  (package
    (name "lua53-tl")
    (version "0.24.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua53-tl.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/teal-language/tl")
    (synopsis "the compiler for Teal, a typed dialect of Lua")
    (description "The compiler for Teal, a typed dialect of Lua.")
    (license license:expat)))

;;; tecnoballz — An exciting brick breaker game
(define-public tecnoballz
  (package
    (name "tecnoballz")
    (version "0.93.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tecnoballz.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://linux.tlk.fr/games/TecnoballZ/")
    (synopsis "an exciting brick breaker game")
    (description "An exciting brick breaker game.")
    (license license:gpl3)))

;;; teg — Tenes Empanadas Graciela (TEG) is a clone of a 'Plan Tactico y Estrate
(define-public teg
  (package
    (name "teg")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/teg.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/wfx/teg")
    (synopsis "tenes Empanadas Graciela (TEG) is a clone of a 'Plan Tactico y Estrategico de...")
    (description "Tenes Empanadas Graciela (TEG) is a clone of a 'Plan Tactico y Estrategico de la Guerra' board game, a pseudo-clone of Risk, a multiplayer turn-based strategy game.")
    (license license:gpl2)))

;;; templ-bin — A language for writing HTML user interfaces in Go.
(define-public templ-bin
  (package
    (name "templ-bin")
    (version "0.3.1001")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/templ-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/a-h/templ")
    (synopsis "A language for writing HTML user interfaces in Go")
    (description "A language for writing HTML user interfaces in Go.")
    (license license:expat)))

;;; tera-cli — CLI to make one-off Tera templating easier
(define-public tera-cli
  (package
    (name "tera-cli")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tera-cli.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/guangie88/tera-cli")
    (synopsis "CLI to make one-off Tera templating easier")
    (description "CLI to make one-off Tera templating easier.")
    (license license:expat)))

;;; termpub — Epubreader for the terminal
(define-public termpub
  (package
    (name "termpub")
    (version "2020.12.06.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/termpub.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mdom/termpub")
    (synopsis "epubreader for the terminal")
    (description "Epubreader for the terminal.")
    (license license:gpl3+)))

;;; terraform-lsp — Language Server Protocol for Terraform
(define-public terraform-lsp
  (package
    (name "terraform-lsp")
    (version "0.0.12")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/terraform-lsp.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/juliosueiras/terraform-lsp")
    (synopsis "language Server Protocol for Terraform")
    (description "Language Server Protocol for Terraform.")
    (license license:expat)))

;;; terraform11 — Tool for building, changing, and versioning infrastructure safely and 
(define-public terraform11
  (package
    (name "terraform11")
    (version "0.11.14")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/terraform11.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.terraform.io/")
    (synopsis "tool for building, changing, and versioning infrastructure safely and efficie...")
    (description "Tool for building, changing, and versioning infrastructure safely and efficiently.")
    (license license:mpl2.0)))

;;; tetronimia — That game of falling blocky thingies for your terminal, written in Nim
(define-public tetronimia
  (package
    (name "tetronimia")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tetronimia.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/indiscipline/tetronimia")
    (synopsis "that game of falling blocky thingies for your terminal, written in Nim")
    (description "That game of falling blocky thingies for your terminal, written in Nim.")
    (license license:gpl3+)))

;;; tex-match — Find LaTeX symbols by sketching. A desktop version of detexify.
(define-public tex-match
  (package
    (name "tex-match")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tex-match.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zoeyfyi/TeX-Match")
    (synopsis "find LaTeX symbols by sketching. A desktop version of detexify")
    (description "Find LaTeX symbols by sketching. A desktop version of detexify.")
    (license license:expat)))

;;; texel — Free UCI compliant open source chess engine developed by Peter Österlu
(define-public texel
  (package
    (name "texel")
    (version "1.12")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/texel.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/peterosterlund2/texel")
    (synopsis "free UCI compliant open source chess engine developed by Peter Österlund")
    (description "Free UCI compliant open source chess engine developed by Peter Österlund.")
    (license license:gpl3+)))

;;; therion — Cave surveying: processes survey data and generates maps or 3D models 
(define-public therion
  (package
    (name "therion")
    (version "6.3.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/therion.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://therion.speleo.sk")
    (synopsis "cave surveying: processes survey data and generates maps or 3D models of caves")
    (description "Cave surveying: processes survey data and generates maps or 3D models of caves.")
    (license license:gpl2)))

;;; think — Terminal Think Music
(define-public think
  (package
    (name "think")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/think.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Kwpolska/think")
    (synopsis "terminal Think Music")
    (description "Terminal Think Music.")
    (license license:bsd-3)))

;;; threelayout — Keyboard layout designed by Jack Rosenthal
(define-public threelayout
  (package
    (name "threelayout")
    (version "45.d3c9798")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/threelayout.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jackrosenthal/threelayout")
    (synopsis "keyboard layout designed by Jack Rosenthal")
    (description "Keyboard layout designed by Jack Rosenthal.")
    (license license:expat)))

;;; ticemu — Third-party TI-84 Plus CE / TI-83 Premium CE emulator, focused on deve
(define-public ticemu
  (package
    (name "ticemu")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ticemu.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ce-programming.github.io/CEmu/")
    (synopsis "third-party TI-84 Plus CE / TI-83 Premium CE emulator, focused on developer f...")
    (description "Third-party TI-84 Plus CE / TI-83 Premium CE emulator, focused on developer features.")
    (license license:gpl3+)))

;;; tightvnc-jviewer — TightVNC java viewer
(define-public tightvnc-jviewer
  (package
    (name "tightvnc-jviewer")
    (version "2.8.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tightvnc-jviewer.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.tightvnc.com")
    (synopsis "tightVNC java viewer")
    (description "TightVNC java viewer.")
    (license license:gpl3+)))

;;; timer-rs — Simple countdown terminal alarm
(define-public timer-rs
  (package
    (name "timer-rs")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/timer-rs.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pando85/timer")
    (synopsis "simple countdown terminal alarm")
    (description "Simple countdown terminal alarm.")
    (license license:gpl3+)))

;;; timerdown — A simple python & pyQT5 app to turn off your Linux PC in X minutes or 
(define-public timerdown
  (package
    (name "timerdown")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/timerdown.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Pyntux/TimerDown")
    (synopsis "A simple python & pyQT5 app to turn off your Linux PC in X minutes or X hours...")
    (description "A simple python & pyQT5 app to turn off your Linux PC in X minutes or X hours, or at specified time.")
    (license license:gpl3)))

;;; timetrace-bin — Simple CLI for tracking your working time.
(define-public timetrace-bin
  (package
    (name "timetrace-bin")
    (version "0.14.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/timetrace-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dominikbraun/timetrace")
    (synopsis "simple CLI for tracking your working time")
    (description "Simple CLI for tracking your working time.")
    (license license:asl2.0)))

;;; tiny-dnn — A C++11 implementation of deep learning for limited computational reso
(define-public tiny-dnn
  (package
    (name "tiny-dnn")
    (version "1.0.0a3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tiny-dnn.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tiny-dnn/tiny-dnn/")
    (synopsis "A C++11 implementation of deep learning for limited computational resource, e...")
    (description "A C++11 implementation of deep learning for limited computational resource, embedded systems and IoT devices.")
    (license license:bsd-3)))

;;; todd — An HTTP server that streams the stdout of a single command. More gener
(define-public todd
  (package
    (name "todd")
    (version "11.6c51336")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/todd.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ewtoombs/todd")
    (synopsis "an HTTP server that streams the stdout of a single command. More generic and ...")
    (description "An HTTP server that streams the stdout of a single command. More generic and elegant than woof.")
    (license license:expat)))

;;; toluol — Rust tool to make DNS queries
(define-public toluol
  (package
    (name "toluol")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/toluol.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://git.sr.ht/~mvforell/toluol")
    (synopsis "rust tool to make DNS queries")
    (description "Rust tool to make DNS queries.")
    (license license:expat)))

;;; tony — High quality pitch and note transcription for scientific applications
(define-public tony
  (package
    (name "tony")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tony.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sonic-visualiser/tony")
    (synopsis "high quality pitch and note transcription for scientific applications")
    (description "High quality pitch and note transcription for scientific applications.")
    (license license:gpl2)))

;;; topal — Topal is a glue program that links GnuPG and Alpine
(define-public topal
  (package
    (name "topal")
    (version "84")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/topal.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://zircon.org.uk/topal/")
    (synopsis "topal is a glue program that links GnuPG and Alpine")
    (description "Topal is a glue program that links GnuPG and Alpine.")
    (license license:gpl3)))

;;; tpasm — A cross assembler for 6805, 6809, 68HC11, 6502, Sunplus, 8051, Z80, PI
(define-public tpasm
  (package
    (name "tpasm")
    (version "1.12")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tpasm.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.sqrt.com/")
    (synopsis "A cross assembler for 6805, 6809, 68HC11, 6502, Sunplus, 8051, Z80, PIC, AVR ...")
    (description "A cross assembler for 6805, 6809, 68HC11, 6502, Sunplus, 8051, Z80, PIC, AVR and c166.")
    (license license:gpl3+)))

;;; treefetch — A plant-based system fetch tool made with Rust
(define-public treefetch
  (package
    (name "treefetch")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/treefetch.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/angelofallars/treefetch")
    (synopsis "A plant-based system fetch tool made with Rust")
    (description "A plant-based system fetch tool made with Rust.")
    (license license:gpl3)))

;;; trello-cli — Trello CLI tool
(define-public trello-cli
  (package
    (name "trello-cli")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/trello-cli.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mheap/trello-cli")
    (synopsis "trello CLI tool")
    (description "Trello CLI tool.")
    (license license:expat)))

;;; trenta-icons — A crisp, modern icon theme for Trenta OS.
(define-public trenta-icons
  (package
    (name "trenta-icons")
    (version "0.r448.c217cf9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/trenta-icons.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/trenta-io/trenta-icons")
    (synopsis "A crisp, modern icon theme for Trenta OS")
    (description "A crisp, modern icon theme for Trenta OS.")
    (license license:gpl3)))

;;; try — Try lets you run a command and inspect its effects before changing you
(define-public try
  (package
    (name "try")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/try.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/binpash/try")
    (synopsis "try lets you run a command and inspect its effects before changing your live ...")
    (description "Try lets you run a command and inspect its effects before changing your live system.")
    (license license:expat)))

;;; tsnake — Terminal snake game written in C++
(define-public tsnake
  (package
    (name "tsnake")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tsnake.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/langurmonkey/tsnake")
    (synopsis "terminal snake game written in C++")
    (description "Terminal snake game written in C++.")
    (license license:gpl3+)))

;;; tty-copy — Copy content to system clipboard via TTY and terminal using ANSI OSC52
(define-public tty-copy
  (package
    (name "tty-copy")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tty-copy.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jirutka/tty-copy")
    (synopsis "copy content to system clipboard via TTY and terminal using ANSI OSC52 sequence")
    (description "Copy content to system clipboard via TTY and terminal using ANSI OSC52 sequence.")
    (license license:expat)))

;;; tuc — A more powerful alternative to cut
(define-public tuc
  (package
    (name "tuc")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tuc.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/riquito/tuc")
    (synopsis "A more powerful alternative to cut")
    (description "A more powerful alternative to cut.")
    (license license:gpl3+)))

;;; tuimoji — A terminal based emoji browser
(define-public tuimoji
  (package
    (name "tuimoji")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tuimoji.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Fingel/tuimoji")
    (synopsis "A terminal based emoji browser")
    (description "A terminal based emoji browser.")
    (license license:gpl3+)))

;;; tumbler-folder-thumbnailer — Custom folder thumbnails for Tumbler
(define-public tumbler-folder-thumbnailer
  (package
    (name "tumbler-folder-thumbnailer")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tumbler-folder-thumbnailer.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://docs.xfce.org/xfce/tumbler/available_plugins")
    (synopsis "custom folder thumbnails for Tumbler")
    (description "Custom folder thumbnails for Tumbler.")
    (license license:bsd-3)))

;;; tut-mastodon — A TUI for Mastodon with vim inspired keys. Same as aur/tut, only for n
(define-public tut-mastodon
  (package
    (name "tut-mastodon")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tut-mastodon.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/RasmusLindroth/tut")
    (synopsis "A TUI for Mastodon with vim inspired keys. Same as aur/tut, only for name col...")
    (description "A TUI for Mastodon with vim inspired keys. Same as aur/tut, only for name collision.")
    (license license:expat)))

;;; tuxtrain — An easy-to-use generic trainer for Linux
(define-public tuxtrain
  (package
    (name "tuxtrain")
    (version "0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tuxtrain.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/leaty/tuxtrain")
    (synopsis "an easy-to-use generic trainer for Linux")
    (description "An easy-to-use generic trainer for Linux.")
    (license license:expat)))

;;; tv — Spectra- and matrix-analysis program developed at IKP, Köln, Germany
(define-public tv
  (package
    (name "tv")
    (version "1.9.13")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tv.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.ikp.uni-koeln.de/~fitz/viewspectra/Tv_user-manual/Tv_user-manual.html")
    (synopsis "spectra- and matrix-analysis program developed at IKP, Köln, Germany")
    (description "Spectra- and matrix-analysis program developed at IKP, Köln, Germany.")
    (license license:nonfree)))

;;; twitch-dl-bin — Twitch video downloader that use multiple concurrent connections
(define-public twitch-dl-bin
  (package
    (name "twitch-dl-bin")
    (version "3.3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/twitch-dl-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ihabunek/twitch-dl")
    (synopsis "twitch video downloader that use multiple concurrent connections")
    (description "Twitch video downloader that use multiple concurrent connections.")
    (license license:gpl3)))

;;; txdx — Todo's like you've never seen before
(define-public txdx
  (package
    (name "txdx")
    (version "1.1.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/txdx.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.txdx.eu")
    (synopsis "todo's like you've never seen before")
    (description "Todo's like you've never seen before.")
    (license license:gpl2)))

;;; typioca — Tapioca (/ˌtæpiˈoʊkə/) is a starch extracted from the storage roots of
(define-public typioca
  (package
    (name "typioca")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/typioca.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bloznelis/typioca")
    (synopsis "tapioca (/ˌtæpiˈoʊkə/) is a starch extracted from the storage roots of the ca...")
    (description "Tapioca (/ˌtæpiˈoʊkə/) is a starch extracted from the storage roots of the cassava plant. Pearl tapioca is a common ingredient in Asian desserts...and sweet drinks such as bubble tea.")
    (license license:expat)))

;;; u3d — U3D is a format for 3D models that can be embedded into PDF and viewed
(define-public u3d
  (package
    (name "u3d")
    (version "1.4.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/u3d.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ningfei/u3d")
    (synopsis "U3D is a format for 3D models that can be embedded into PDF and viewed in Ado...")
    (description "U3D is a format for 3D models that can be embedded into PDF and viewed in Adobe Acrobat/Reader.")
    (license license:asl2.0)))

;;; uarmsolver — Universal Association Rule Mining Solver
(define-public uarmsolver
  (package
    (name "uarmsolver")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uarmsolver.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/firefly-cpp/uARMSolver")
    (synopsis "universal Association Rule Mining Solver")
    (description "Universal Association Rule Mining Solver.")
    (license license:expat)))

;;; uclibc-ng — A C library for embedded Linux
(define-public uclibc-ng
  (package
    (name "uclibc-ng")
    (version "1.0.50")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uclibc-ng.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://uclibc-ng.org/")
    (synopsis "A C library for embedded Linux")
    (description "A C library for embedded Linux.")
    (license license:gpl3+)))

;;; udp-over-tcp — Proxy UDP traffic over a TCP stream
(define-public udp-over-tcp
  (package
    (name "udp-over-tcp")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/udp-over-tcp.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mullvad/udp-over-tcp")
    (synopsis "proxy UDP traffic over a TCP stream")
    (description "Proxy UDP traffic over a TCP stream.")
    (license license:expat)))

;;; ultralist — Simple task management for tech folks.
(define-public ultralist
  (package
    (name "ultralist")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ultralist.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ultralist.io/")
    (synopsis "simple task management for tech folks")
    (description "Simple task management for tech folks.")
    (license license:expat)))

;;; umleditor — UML/INTERLIS-Editor
(define-public umleditor
  (package
    (name "umleditor")
    (version "3.7.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/umleditor.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.interlis.ch/downloads/umleditor/")
    (synopsis "uML/INTERLIS-Editor")
    (description "UML/INTERLIS-Editor.")
    (license license:lgpl3+)))

;;; unfs3 — A user-space implementation of the NFSv3 server specification
(define-public unfs3
  (package
    (name "unfs3")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unfs3.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://unfs3.github.io/")
    (synopsis "A user-space implementation of the NFSv3 server specification")
    (description "A user-space implementation of the NFSv3 server specification.")
    (license license:bsd-3)))

;;; unifetch — An unofficial inheritor of neofetch.
(define-public unifetch
  (package
    (name "unifetch")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unifetch.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nmimusic/unifetch")
    (synopsis "an unofficial inheritor of neofetch")
    (description "An unofficial inheritor of neofetch.")
    (license license:expat)))

;;; uniread — Uniread is Spritz like CLI fast reading software.
(define-public uniread
  (package
    (name "uniread")
    (version "0.0.28")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uniread.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nemanjan00/uniread")
    (synopsis "uniread is Spritz like CLI fast reading software")
    (description "Uniread is Spritz like CLI fast reading software.")
    (license license:expat)))

;;; univga — (X11) VGA font with unicode glyphs by Dmitry Yu. Bolkhovityanov
(define-public univga
  (package
    (name "univga")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/univga.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.inp.nsk.su/~bolkhov/files/fonts/univga/")
    (synopsis "(X11) VGA font with unicode glyphs by Dmitry Yu. Bolkhovityanov")
    (description "(X11) VGA font with unicode glyphs by Dmitry Yu. Bolkhovityanov.")
    (license license:expat)))

;;; unsilence — Console Interface and Library to remove silent parts of a media file
(define-public unsilence
  (package
    (name "unsilence")
    (version "1.0.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unsilence.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lagmoellertim/unsilence")
    (synopsis "console Interface and Library to remove silent parts of a media file")
    (description "Console Interface and Library to remove silent parts of a media file.")
    (license license:expat)))

;;; urw-classico — URW Classico font from CTAN (for texlive)
(define-public urw-classico
  (package
    (name "urw-classico")
    (version "20250803")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/urw-classico.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.ctan.org/tex-archive/fonts/urw/classico")
    (synopsis "URW Classico font from CTAN (for texlive)")
    (description "URW Classico font from CTAN (for texlive).")
    (license license:agpl3+)))

;;; usbmon — USB monitoring framework
(define-public usbmon
  (package
    (name "usbmon")
    (version "6.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/usbmon.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/radupotop/usbmon")
    (synopsis "USB monitoring framework")
    (description "USB monitoring framework.")
    (license license:gpl3+)))

;;; uvg266 — An open-source VVC encoder
(define-public uvg266
  (package
    (name "uvg266")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uvg266.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ultravideo/uvg266/")
    (synopsis "an open-source VVC encoder")
    (description "An open-source VVC encoder.")
    (license license:bsd-3)))

;;; vdmfec — Save and recover data from unreliable media
(define-public vdmfec
  (package
    (name "vdmfec")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vdmfec.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://members.tripod.com/professor_tom/archives/index.html")
    (synopsis "save and recover data from unreliable media")
    (description "Save and recover data from unreliable media.")
    (license license:gpl3+)))

;;; vegastrike — Vega Strike - Upon the Coldest Sea. Space flight and trading simulator
(define-public vegastrike
  (package
    (name "vegastrike")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vegastrike.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.vega-strike.org/")
    (synopsis "vega Strike - Upon the Coldest Sea. Space flight and trading simulator with r...")
    (description "Vega Strike - Upon the Coldest Sea. Space flight and trading simulator with realistic distances.")
    (license license:gpl2)))

;;; venom — a modern Tox client for the Linux desktop
(define-public venom
  (package
    (name "venom")
    (version "0.5.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/venom.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/naxuroqa/venom")
    (synopsis "a modern Tox client for the Linux desktop")
    (description "a modern Tox client for the Linux desktop.")
    (license license:gpl3)))

;;; verdaccio — Private npm repository server
(define-public verdaccio
  (package
    (name "verdaccio")
    (version "6.3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/verdaccio.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/verdaccio/verdaccio")
    (synopsis "private npm repository server")
    (description "Private npm repository server.")
    (license license:expat)))

;;; verifpal — Cryptographic protocol analysis for real-world protocols.
(define-public verifpal
  (package
    (name "verifpal")
    (version "0.51.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/verifpal.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://verifpal.com")
    (synopsis "cryptographic protocol analysis for real-world protocols")
    (description "Cryptographic protocol analysis for real-world protocols.")
    (license (list license:nonfree license:gpl3))))

;;; vfu — Versatile text-based file-manager
(define-public vfu
  (package
    (name "vfu")
    (version "5.09")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vfu.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://cade.noxrun.com/projects/vfu")
    (synopsis "versatile text-based file-manager")
    (description "Versatile text-based file-manager.")
    (license license:gpl3+)))

;;; victoriametrics-bin — Fast, cost-effective and scalable time series database
(define-public victoriametrics-bin
  (package
    (name "victoriametrics-bin")
    (version "1.138.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/victoriametrics-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://victoriametrics.github.io")
    (synopsis "fast, cost-effective and scalable time series database")
    (description "Fast, cost-effective and scalable time series database.")
    (license license:asl2.0)))

;;; vidmerger-bin — Merge video and audio files via CLI.
(define-public vidmerger-bin
  (package
    (name "vidmerger-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vidmerger-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tgotwig/vidmerger")
    (synopsis "merge video and audio files via CLI")
    (description "Merge video and audio files via CLI.")
    (license license:expat)))

;;; vido — Video/Audio Downloader frontend for youtube-dl
(define-public vido
  (package
    (name "vido")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vido.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sourceforge.net/projects/vido")
    (synopsis "video/Audio Downloader frontend for youtube-dl")
    (description "Video/Audio Downloader frontend for youtube-dl.")
    (license license:gpl3)))

;;; viper-bin — Viper is a launcher and updater for Northstar, and not much more than 
(define-public viper-bin
  (package
    (name "viper-bin")
    (version "3:1.13.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/viper-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/0neGal/viper")
    (synopsis "viper is a launcher and updater for Northstar, and not much more than that")
    (description "Viper is a launcher and updater for Northstar, and not much more than that.")
    (license license:gpl3)))

;;; vpkedit-bin — A CLI/GUI tool to create, read, and write several pack file formats (b
(define-public vpkedit-bin
  (package
    (name "vpkedit-bin")
    (version "5.0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vpkedit-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/craftablescience/VPKEdit")
    (synopsis "A CLI/GUI tool to create, read, and write several pack file formats (binary r...")
    (description "A CLI/GUI tool to create, read, and write several pack file formats (binary release).")
    (license license:expat)))

;;; wait4x — Wait4X allows you to wait for a port or a service to enter the request
(define-public wait4x
  (package
    (name "wait4x")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wait4x.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wait4x.dev")
    (synopsis "wait4X allows you to wait for a port or a service to enter the requested state")
    (description "Wait4X allows you to wait for a port or a service to enter the requested state.")
    (license license:asl2.0)))

;;; waon — Wave-to-Notes transcriber (WAVE-MIDI converter)
(define-public waon
  (package
    (name "waon")
    (version "0.11")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/waon.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://waon.sourceforge.net/")
    (synopsis "wave-to-Notes transcriber (WAVE-MIDI converter)")
    (description "Wave-to-Notes transcriber (WAVE-MIDI converter).")
    (license license:gpl2)))

;;; war1gus — Warcraft1 Mod that allows you to play Warcraft1 with the Stratagus eng
(define-public war1gus
  (package
    (name "war1gus")
    (version "3.3.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/war1gus.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Wargus/war1gus")
    (synopsis "warcraft1 Mod that allows you to play Warcraft1 with the Stratagus engine")
    (description "Warcraft1 Mod that allows you to play Warcraft1 with the Stratagus engine.")
    (license license:gpl3+)))

;;; waybackurls — Fetch all the URLs that the Wayback Machine knows about for a domain
(define-public waybackurls
  (package
    (name "waybackurls")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/waybackurls.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tomnomnom/waybackurls")
    (synopsis "fetch all the URLs that the Wayback Machine knows about for a domain")
    (description "Fetch all the URLs that the Wayback Machine knows about for a domain.")
    (license license:expat)))

;;; wch-isp — Firmware programmer for WCH microcontrollers over USB
(define-public wch-isp
  (package
    (name "wch-isp")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wch-isp.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://git.sr.ht/~jmaselbas/wch-isp/")
    (synopsis "firmware programmer for WCH microcontrollers over USB")
    (description "Firmware programmer for WCH microcontrollers over USB.")
    (license license:gpl2)))

;;; webchanges — Check web content for changes and notify
(define-public webchanges
  (package
    (name "webchanges")
    (version "3.35.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/webchanges.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mborsetti/webchanges")
    (synopsis "check web content for changes and notify")
    (description "Check web content for changes and notify.")
    (license (list license:bsd-3 license:expat))))

;;; weborf — Shares files using the HTTP protocol. Provides CLI. Allows using webda
(define-public weborf
  (package
    (name "weborf")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/weborf.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/ltworf")
    (synopsis "shares files using the HTTP protocol. Provides CLI. Allows using webdav")
    (description "Shares files using the HTTP protocol. Provides CLI. Allows using webdav.")
    (license license:gpl3)))

;;; webtrees — The web’s leading online collaborative genealogy application
(define-public webtrees
  (package
    (name "webtrees")
    (version "2.2.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/webtrees.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://webtrees.net/")
    (synopsis "the web’s leading online collaborative genealogy application")
    (description "The web’s leading online collaborative genealogy application.")
    (license license:gpl3)))

;;; wgsl-analyzer-bin — A language server for the WGSL shading language
(define-public wgsl-analyzer-bin
  (package
    (name "wgsl-analyzer-bin")
    (version "20260313")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wgsl-analyzer-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/wgsl-analyzer/wgsl-analyzer")
    (synopsis "A language server for the WGSL shading language")
    (description "A language server for the WGSL shading language.")
    (license license:expat)))

;;; wifi-password — Quickly fetch your WiFi password and if needed, generate a QR code of 
(define-public wifi-password
  (package
    (name "wifi-password")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wifi-password.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sdushantha/wifi-password")
    (synopsis "quickly fetch your WiFi password and if needed, generate a QR code of your Wi...")
    (description "Quickly fetch your WiFi password and if needed, generate a QR code of your WiFi to allow phones to easily connect.")
    (license license:expat)))

;;; wiliwili — 专为手柄控制设计的第三方跨平台B站客户端
(define-public wiliwili
  (package
    (name "wiliwili")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wiliwili.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xfangfang/wiliwili")
    (synopsis "专为手柄控制设计的第三方跨平台B站客户端")
    (description "专为手柄控制设计的第三方跨平台B站客户端.")
    (license license:gpl3+)))

;;; windowchef — A stacking window manager that cooks windows with orders from the Wait
(define-public windowchef
  (package
    (name "windowchef")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/windowchef.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tudurom/windowchef")
    (synopsis "A stacking window manager that cooks windows with orders from the Waitron")
    (description "A stacking window manager that cooks windows with orders from the Waitron.")
    (license license:isc)))

;;; windowlab — A small and simple window manager.
(define-public windowlab
  (package
    (name "windowlab")
    (version "1.40")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/windowlab.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.nickgravgaard.com/windowlab")
    (synopsis "A small and simple window manager")
    (description "A small and simple window manager.")
    (license license:gpl3+)))
