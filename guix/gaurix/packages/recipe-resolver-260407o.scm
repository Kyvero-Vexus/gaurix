;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260407o
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   Mix of pre-built CLI binaries, shell/awk scripts, fortune cookie
;;;   data files, cursor/icon themes, thesaurus data, and source-built
;;;   C/C++/Python utilities (autotools, make, meson, cmake).
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260407o)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages dvd)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages json)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages nftables)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xorg)
  #:export (sshcommand
            vobcopy
            fortune-mod-calvin
            fortune-mod-hitchhiker
            fortune-mod-discworld
            breeze-contrast-cursor-theme
            fhtagn
            dracula-icons-git
            neowofetch-git
            zimfw
            hosts-update
            foomuuri
            potato-c
            airctl-bin
            mpris-scrobbler
            bash-git-prompt
            x11-mouse-funnel
            gridlock-bin
            peaclock
            fuc-bin
            goodvibes
            numr-bin
            batz-converter
            lazyworktree-bin
            mythes-ru
            ovpn-status-bin
            sley-bin
            enyo-launcher
            pmg-bin
            drl))

;;;
;;; ── 1. sshcommand ─────────────────────────────────────────────────────
;;; Turn SSH into a thin client for your app (shell script)
;;;
(define-public sshcommand
  (package
    (name "sshcommand")
    (version "0.20.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dokku/sshcommand/releases/download/v"
             version "/sshcommand"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/sshcommand"))
            (chmod (string-append bin "/sshcommand") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dokku/sshcommand")
    (synopsis "turn SSH into a thin client specifically for your app")
    (description
     "Sshcommand creates dedicated SSH commands for a given user,
allowing SSH to be used as a thin client interface for applications.
It manages authorized keys and restricts users to specific commands.")
    (license license:expat)))

;;;
;;; ── 2. vobcopy ────────────────────────────────────────────────────────
;;; DVD .vob file copier with decryption
;;;
(define-public vobcopy
  (package
    (name "vobcopy")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/barak/vobcopy/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'bootstrap
            (lambda _
              (invoke "autoreconf" "--install" "--force" "--symlink"))))))
    (native-inputs (list autoconf automake))
    (inputs (list libdvdread libdvdcss))
    (home-page "https://github.com/barak/vobcopy")
    (synopsis "copies DVD .vob files to disk, decrypting on the way")
    (description
     "Vobcopy copies DVD @file{.vob} files to hard disk, performing
decryption on the fly using @code{libdvdread} and @code{libdvdcss}.
It provides a simple command-line interface for DVD backup.")
    (license license:gpl2)))

;;;
;;; ── 3. fortune-mod-calvin ─────────────────────────────────────────────
;;; Calvin and Hobbes fortune cookies
;;;
(define-public fortune-mod-calvin
  (package
    (name "fortune-mod-calvin")
    (version "0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.netmeister.org/apps/fortunes-calvin-"
             version ".gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (fortune-dir (string-append out "/share/fortune"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p fortune-dir)
            (copy-file src (string-append fortune-dir "/calvin.gz"))
            (invoke #$(file-append gzip "/bin/gzip") "-d"
                    (string-append fortune-dir "/calvin.gz"))
            #t))))
    (native-inputs (list gzip))
    (home-page "http://www.netmeister.org/misc.html")
    (synopsis "Calvin and Hobbes fortune cookies")
    (description
     "A collection of quotes from the Calvin and Hobbes comic strip,
formatted as fortune cookie files for use with @command{fortune}.")
    (license license:public-domain)))

;;;
;;; ── 4. fortune-mod-hitchhiker ─────────────────────────────────────────
;;; Hitchhiker's Guide fortune cookies
;;;
(define-public fortune-mod-hitchhiker
  (package
    (name "fortune-mod-hitchhiker")
    (version "20050611")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.splitbrain.org/_media/projects/fortunes/fortune-hitchhiker.tgz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fortune-hitchhiker/hitchhiker" "share/fortune/hitchhiker"))))
    (home-page "https://www.splitbrain.org/projects/fortunes/hg2g")
    (synopsis "Hitchhiker's Guide to the Galaxy fortune cookies")
    (description
     "A collection of quotes from Douglas Adams' Hitchhiker's Guide to
the Galaxy series, formatted as fortune cookie files for use with
@command{fortune}.")
    (license license:public-domain)))

;;;
;;; ── 5. fortune-mod-discworld ──────────────────────────────────────────
;;; Discworld novel fortune cookies
;;;
(define-public fortune-mod-discworld
  (package
    (name "fortune-mod-discworld")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.splitbrain.org/_media/projects/fortunes/fortune-discworld.tgz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fortune-discworld/discworld" "share/fortune/discworld")
               ("fortune-discworld/discworld.dat" "share/fortune/discworld.dat"))))
    (home-page "http://www.splitbrain.org/projects/fortunes/discworld")
    (synopsis "Discworld novel fortune cookies")
    (description
     "A collection of quotes from Terry Pratchett's Discworld novels,
formatted as fortune cookie files for use with @command{fortune}.")
    (license license:public-domain)))

;;;
;;; ── 6. breeze-contrast-cursor-theme ───────────────────────────────────
;;; High-contrast Breeze cursor theme
;;;
(define-public breeze-contrast-cursor-theme
  (package
    (name "breeze-contrast-cursor-theme")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://code.jpope.org/jpope/breeze_cursor_sources/raw/master/breeze-contrast-cursor-theme.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Breeze_Contrast" "share/icons/Breeze_Contrast"))))
    (native-inputs (list unzip))
    (home-page "https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/")
    (synopsis "high-contrast variant of the Breeze cursor theme")
    (description
     "A high-contrast variant of the KDE Breeze cursor theme, providing
improved visibility for users who prefer higher contrast mouse cursors.")
    (license license:gpl3+)))

;;;
;;; ── 7. fhtagn ─────────────────────────────────────────────────────────
;;; Literate testing for command-line programs (awk script)
;;;
(define-public fhtagn
  (package
    (name "fhtagn")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/xonixx/fhtagn/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fhtagn.awk" "bin/fhtagn"))))
    (inputs (list gawk))
    (home-page "https://github.com/xonixx/fhtagn")
    (synopsis "literate testing for command-line programs")
    (description
     "Fhtagn is a literate testing tool for command-line programs.  It
allows writing executable test specifications in a readable format and
runs them using AWK.")
    (license license:expat)))

;;;
;;; ── 8. dracula-icons-git ──────────────────────────────────────────────
;;; Dracula dark icon theme for Linux desktops
;;;
(define-public dracula-icons-git
  (package
    (name "dracula-icons-git")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/m4thewz/dracula-icons")
             (commit "de2a8ed89a87f2367a5f4b30d6c47805a5e39be5")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Dracula"
                #:exclude ("README.md" ".git")))))
    (home-page "https://github.com/m4thewz/dracula-icons")
    (synopsis "dark icon theme for Linux desktops")
    (description
     "Dracula Icons is a dark icon theme for Linux desktop environments,
following the Dracula color palette.  It provides SVG and PNG icons
for applications, folders, and system elements.")
    (license license:gpl3+)))

;;;
;;; ── 9. neowofetch-git ─────────────────────────────────────────────────
;;; Standalone neofetch fork from hyfetch
;;;
(define-public neowofetch-git
  (package
    (name "neowofetch-git")
    (version "2.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hykilpikonna/hyfetch")
             (commit "2.0.5")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file (string-append src "/neofetch")
                       (string-append bin "/neowofetch"))
            (chmod (string-append bin "/neowofetch") #o755)
            #t))))
    (inputs (list bash))
    (home-page "https://github.com/hykilpikonna/hyfetch")
    (synopsis "standalone neofetch fork with extended features")
    (description
     "Neowofetch is a standalone installation of the neofetch fork from
the hyfetch project.  It displays system information in the terminal
alongside an ASCII art logo.")
    (license license:expat)))

;;;
;;; ── 10. zimfw ─────────────────────────────────────────────────────────
;;; Zsh plugin manager
;;;
(define-public zimfw
  (package
    (name "zimfw")
    (version "1.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/zimfw/zimfw/releases/download/v"
             version "/zimfw.zsh.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (share (string-append out "/share/zimfw"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p share)
            (copy-file src (string-append share "/zimfw.zsh.gz"))
            (invoke #$(file-append gzip "/bin/gzip") "-d"
                    (string-append share "/zimfw.zsh.gz"))
            #t))))
    (native-inputs (list gzip))
    (home-page "https://zimfw.sh")
    (synopsis "zsh plugin manager")
    (description
     "Zimfw is a Zsh configuration framework that provides a modular plugin
management system.  It offers fast startup times and a curated set of
modules for shell productivity.")
    (license license:expat)))

;;;
;;; ── 11. hosts-update ────────────────────────────────────────────���─────
;;; Blocklist injector for /etc/hosts
;;;
(define-public hosts-update
  (package
    (name "hosts-update")
    (version "1.38")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/graysky2/hosts-update/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "DESTDIR=" #$output)
              "PREFIX=")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list curl))
    (home-page "https://github.com/graysky2/hosts-update")
    (synopsis "blocklist injector for /etc/hosts")
    (description
     "Hosts-update injects the MVPS blocklist into @file{/etc/hosts} to
prevent thousands of parasites, hijackers, and unwanted adware and
spyware sites from being resolved.")
    (license license:gpl3+)))

;;;
;;; ── 12. foomuuri ──────────────────────────────────────────────────────
;;; Multizone bidirectional nftables firewall
;;;
(define-public foomuuri
  (package
    (name "foomuuri")
    (version "0.32")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FoobarOy/foomuuri/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "DESTDIR=" #$output)
              "PREFIX=")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (add-after 'unpack 'fix-paths
            (lambda _
              (substitute* "Makefile"
                (("/usr/sbin") "/bin")))))))
    (inputs (list python python-requests nftables))
    (home-page "https://github.com/FoobarOy/foomuuri")
    (synopsis "multizone bidirectional nftables firewall")
    (description
     "Foomuuri is a multizone bidirectional nftables firewall manager.
It provides a high-level configuration language for defining firewall
rules with support for zones, logging, and dynamic interfaces.")
    (license license:gpl2+)))

;;;
;;; ── 13. potato-c ──────────────────────────────────────────────────────
;;; Modular pomodoro timer in C
;;;
(define-public potato-c
  (package
    (name "potato-c")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nimaaskarian/potato-c/archive/refs/tags/"
             version ".zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "DESTDIR=" #$output)
              "PREFIX=")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (native-inputs (list unzip))
    (inputs (list ncurses))
    (home-page "https://github.com/nimaaskarian/potato-c")
    (synopsis "modular pomodoro timer with server-client structure")
    (description
     "Potato-c is a featureful, modular, and fast pomodoro timer with a
server-client structure.  It includes @command{potd} (daemon),
@command{potui} (TUI), and @command{potctl} (control) components.")
    (license license:gpl3)))

;;;
;;; ── 14. airctl-bin ──────────────────────────────────────────────────��─
;;; WiFi network manager GUI (prebuilt binary)
;;;
(define-public airctl-bin
  (package
    (name "airctl-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pshycodr/airctl/releases/download/v"
             version "/airctl.bin"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/airctl"))
            (chmod (string-append bin "/airctl") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pshycodr/airctl")
    (synopsis "WiFi network manager GUI")
    (description
     "Airctl is a graphical WiFi network manager built with GTK4.  It
provides a simple interface for scanning, connecting to, and managing
wireless networks via NetworkManager.")
    (license license:gpl3)))

;;;
;;; ── 15. mpris-scrobbler ───────────────────────────────────────────────
;;; MPRIS scrobbling daemon for libre.fm
;;;
(define-public mpris-scrobbler
  (package
    (name "mpris-scrobbler")
    (version "0.5.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://git.sr.ht/~mariusor/mpris-scrobbler/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list (string-append "-Dversion=" #$(package-version this-package)))))
    (native-inputs (list pkg-config scdoc))
    (inputs (list dbus libevent curl json-c))
    (home-page "https://git.sr.ht/~mariusor/mpris-scrobbler")
    (synopsis "minimalistic MPRIS scrobbling daemon")
    (description
     "Mpris-scrobbler is a minimalistic user daemon that submits the
currently playing song to libre.fm and compatible scrobbling services
using the MPRIS D-Bus interface.")
    (license license:expat)))

;;;
;;; ── 16. bash-git-prompt ───────────────────────────────────────────────
;;; Informative git prompt for bash
;;;
(define-public bash-git-prompt
  (package
    (name "bash-git-prompt")
    (version "2.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/magicmonty/bash-git-prompt/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gitprompt.sh" "lib/bash-git-prompt/gitprompt.sh")
               ("gitstatus.sh" "lib/bash-git-prompt/gitstatus.sh")
               ("git-prompt-help.sh" "lib/bash-git-prompt/git-prompt-help.sh")
               ("prompt-colors.sh" "lib/bash-git-prompt/prompt-colors.sh")
               ("gitprompt.fish" "lib/bash-git-prompt/gitprompt.fish")
               ("themes" "lib/bash-git-prompt/themes"))))
    (inputs (list bash))
    (home-page "https://github.com/magicmonty/bash-git-prompt")
    (synopsis "informative git prompt for bash and fish")
    (description
     "Bash-git-prompt provides an informative and configurable git prompt
for Bash and Fish shells.  It shows the current branch, ahead/behind
status, staging area, stash count, and more.")
    (license license:bsd-2)))

;;;
;;; ── 17. x11-mouse-funnel ──────────────────────────────────────────────
;;; Fixes dead corners on multi-monitor X11 setups
;;;
(define-public x11-mouse-funnel
  (package
    (name "x11-mouse-funnel")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/freehuntx/x11-mouse-funnel/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda _
              (invoke "gcc" "-O2" "-o" "mouse_funnel" "mouse_funnel.c"
                      "-lX11" "-lXi" "-lXrandr")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (install-file "mouse_funnel" bin)))))))
    (inputs (list libx11 libxi libxrandr))
    (home-page "https://github.com/freehuntx/x11-mouse-funnel")
    (synopsis "lightweight X11 utility for multi-monitor dead corner fix")
    (description
     "X11-mouse-funnel is a lightweight X11 utility that solves the dead
corner problem on multi-monitor setups where monitor edges are not
aligned, preventing the mouse from getting stuck.")
    (license license:expat)))

;;;
;;; ── 18. gridlock-bin ──────────────────────────────────────────────────
;;; TMUX session manager and automator (Go binary)
;;;
(define-public gridlock-bin
  (package
    (name "gridlock-bin")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/esaiaswestberg/gridlock/releases/download/v"
             version "/gridlock_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("gridlock" "bin/gridlock"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/esaiaswestberg/gridlock")
    (synopsis "powerful TMUX session manager and automator")
    (description
     "Gridlock is a powerful TMUX session manager and automator.  It allows
defining session layouts in YAML configuration files and launching
complex tmux sessions with a single command.")
    (license license:expat)))

;;;
;;; ── 19. peaclock ──────────────────────────────────────────────────────
;;; Colourful binary clock for the terminal (C++)
;;;
(define-public peaclock
  (package
    (name "peaclock")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/octobanana/peaclock/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (setenv "PREFIX" out)
                (invoke "./RUNME.sh" "build"))))
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (install-file "build/release/peaclock" bin)))))))
    (inputs (list icu4c))
    (home-page "https://github.com/octobanana/peaclock")
    (synopsis "colourful binary clock for the terminal")
    (description
     "Peaclock is a colourful binary clock for the terminal.  It displays
time in binary format with customizable colors, styles, and layout
options.")
    (license license:expat)))

;;;
;;; ── 20. fuc-bin ───────────────────────────────────────────────────────
;;; Fast Unix Commands: cp and rm alternatives (Rust binaries)
;;;
(define-public fuc-bin
  (package
    (name "fuc-bin")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SUPERCILEX/fuc/releases/download/"
             version "/x86_64-unknown-linux-gnu-cpz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source"))
                 (rmz (assoc-ref %build-inputs "rmz")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/cpz"))
            (chmod (string-append bin "/cpz") #o755)
            (copy-file rmz (string-append bin "/rmz"))
            (chmod (string-append bin "/rmz") #o755)
            #t))))
    (native-inputs
     `(("rmz"
        ,(origin
           (method url-fetch)
           (uri (string-append
                 "https://github.com/SUPERCILEX/fuc/releases/download/"
                 "3.1.1/x86_64-unknown-linux-gnu-rmz"))
           (sha256
            (base32 "0000000000000000000000000000000000000000000000000000"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/SUPERCILEX/fuc")
    (synopsis "fast Unix commands: performance alternatives to cp and rm")
    (description
     "Fuc provides @command{cpz} and @command{rmz}, performance-focused
alternatives to @command{cp} and @command{rm} respectively.  They are
written in Rust and optimized for speed on large file operations.")
    (license license:asl2.0)))

;;;
;;; ── 21. goodvibes ─────────────────────────────────────────────────────
;;; Lightweight internet radio player (GTK)
;;;
(define-public goodvibes
  (package
    (name "goodvibes")
    (version "0.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/goodvibes/goodvibes/-/archive/v"
             version "/goodvibes-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:configure-flags #~(list "-Dtests=false")))
    (native-inputs (list pkg-config))
    (inputs
     (list libkeybinder
           libsoup-minimal-2
           gst-plugins-base
           gst-plugins-bad
           gst-plugins-good
           gst-plugins-ugly))
    (home-page "https://gitlab.com/goodvibes/goodvibes")
    (synopsis "lightweight internet radio player")
    (description
     "Goodvibes is a lightweight internet radio player for GNU/Linux.  It
provides a simple GTK interface for playing internet radio streams
with support for multiple audio formats via GStreamer.")
    (license license:gpl3+)))

;;;
;;; ── 22. numr-bin ──────────────────────────────────────────────────────
;;; Text calculator for natural language expressions (Rust binary)
;;;
(define-public numr-bin
  (package
    (name "numr-bin")
    (version "0.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nasedkinpv/numr/releases/download/v"
             version "/numr-v" version
             "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("numr" "bin/numr")
               ("numr-cli" "bin/numr-cli"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nasedkinpv/numr")
    (synopsis "text calculator for natural language expressions")
    (description
     "Numr is a text calculator for natural language expressions with a
vim-style TUI.  It includes @command{numr} for interactive use and
@command{numr-cli} for command-line calculations.")
    (license license:expat)))

;;;
;;; ── 23. batz-converter ────────────────────────────────────────────────
;;; Timezone converter shell script
;;;
(define-public batz-converter
  (package
    (name "batz-converter")
    (version "2.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/chmouel/batzconverter/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("batz.sh" "bin/batz"))))
    (inputs (list bash))
    (home-page "https://github.com/chmouel/batzconverter")
    (synopsis "show and convert timezones in the shell")
    (description
     "Batz-converter is a shell script for showing and converting timezones
from the command line.  It provides a simple way to check the current
time in different timezones.")
    (license license:asl2.0)))

;;;
;;; ── 24. lazyworktree-bin ──────────────────────────────────────────────
;;; TUI git worktree manager (Go binary)
;;;
(define-public lazyworktree-bin
  (package
    (name "lazyworktree-bin")
    (version "1.44.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/chmouel/lazyworktree/releases/download/v"
             version "/lazyworktree_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lazyworktree" "bin/lazyworktree")
               ("lazyworktree.1" "share/man/man1/lazyworktree.1")
               ("completions/lazyworktree.bash"
                "share/bash-completion/completions/lazyworktree")
               ("completions/lazyworktree.zsh"
                "share/zsh/site-functions/_lazyworktree")
               ("completions/lazyworktree.fish"
                "share/fish/vendor_completions.d/lazyworktree.fish"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/chmouel/lazyworktree")
    (synopsis "TUI tool to manage git worktrees")
    (description
     "Lazyworktree is a terminal user interface tool for managing git
worktrees.  It provides an interactive interface for creating, switching,
and deleting worktrees with integration for lazygit and tmux.")
    (license license:asl2.0)))

;;;
;;; ── 25. mythes-ru ─────────────────────────────────────────────────────
;;; Russian thesaurus for LibreOffice
;;;
(define-public mythes-ru
  (package
    (name "mythes-ru")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri "http://pkgs.fedoraproject.org/repo/pkgs/mythes-ru/thes_ru_RU_v2.zip/802cc8a3e5447a65debdbad13247f5c4/thes_ru_RU_v2.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("th_ru_RU_v2.dat" "share/mythes/th_ru_RU_v2.dat")
               ("th_ru_RU_v2.idx" "share/mythes/th_ru_RU_v2.idx"))))
    (native-inputs (list unzip))
    (home-page "http://wiki.services.openoffice.org/wiki/Dictionaries")
    (synopsis "Russian thesaurus for LibreOffice and OpenOffice")
    (description
     "Mythes-ru provides Russian language thesaurus data files for use with
LibreOffice, OpenOffice, and other applications using the MyThes
thesaurus library.")
    (license license:lgpl2.1+)))

;;;
;;; ── 26. ovpn-status-bin ───────────────────────────────────────────────
;;; OVPN status page in the terminal (prebuilt binary)
;;;
(define-public ovpn-status-bin
  (package
    (name "ovpn-status-bin")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/APT37/ovpn-status/releases/download/"
             version "/ovpn-status"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/ovpn-status"))
            (chmod (string-append bin "/ovpn-status") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/APT37/ovpn-status")
    (synopsis "OVPN status page in the terminal")
    (description
     "Ovpn-status displays the OVPN service status page directly in the
terminal, providing a quick way to check VPN connection status without
opening a browser.")
    (license license:expat)))

;;;
;;; ── 27. sley-bin ──────────────────────────────────────────────────────
;;; Semantic versioning CLI with plugins (Go binary)
;;;
(define-public sley-bin
  (package
    (name "sley-bin")
    (version "0.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/indaco/sley/releases/download/v"
             version "/sley_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("sley" "bin/sley"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/indaco/sley")
    (synopsis "CLI for semantic versioning with plugins")
    (description
     "Sley is a CLI tool for semantic versioning using a simple
@file{.version} file.  It is language-agnostic and supports plugins
for git tagging, changelog generation, and versioning policies.")
    (license license:expat)))

;;;
;;; ── 28. enyo-launcher ─────────────────────────────────────────────────
;;; Frontend for Doom engines (C++/CMake/Qt6)
;;;
(define-public enyo-launcher
  (package
    (name "enyo-launcher")
    (version "2.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/sdcofer70/enyo-launcher/-/archive/"
             version "/enyo-launcher-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase))
    (home-page "https://gitlab.com/sdcofer70/enyo-launcher")
    (synopsis "frontend for Doom engines")
    (description
     "Enyo Launcher is a graphical frontend for various Doom source ports
and engines.  It provides a unified interface for configuring and
launching Doom games with different WAD files and mods.")
    (license license:gpl3+)))

;;;
;;; ── 29. pmg-bin ───────────────────────────────────────────────────────
;;; Malicious open source package scanner (Go binary)
;;;
(define-public pmg-bin
  (package
    (name "pmg-bin")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/safedep/pmg/releases/download/v"
             version "/pmg_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pmg" "bin/pmg"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/safedep/pmg")
    (synopsis "malicious open source package scanner")
    (description
     "PMG protects developers from getting hacked by malicious open source
packages.  It scans project dependencies for known vulnerabilities and
supply chain attack indicators.")
    (license license:asl2.0)))

;;;
;;; ── 30. drl ───────────────────────────────────────────────────────────
;;; Doom Roguelike — roguelike game based on Doom (prebuilt)
;;;
(define-public drl
  (package
    (name "drl")
    (version "0.10.0e")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/chaosforgeorg/doomrl/releases/download/"
             (string-join (string-split version #\.) "_")
             "/drl-linux-0100.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/drl" #:exclude ("cc-by-nc-sa-4.0.txt")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (share (string-append out "/share/drl")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/drl")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec ~a/drl \"$@\"\n" share)))
                (chmod (string-append bin "/drl") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://drl.chaosforge.org/")
    (synopsis "roguelike game based on the FPS Doom")
    (description
     "DRL (formerly DoomRL) is a fast and furious coffee-break roguelike
game based on the first-person shooter Doom.  It features procedurally
generated levels, permadeath, and classic Doom weapons and monsters.")
    (license (list license:gpl2+ license:cc-by-sa4.0))))
