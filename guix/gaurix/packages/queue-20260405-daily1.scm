;;; Queue drain 2026-04-05 daily run batch 1 (queue-20260405-daily1).
;;; Attempted 100 TODO-status entries from todo_general_packages.org (25111-25210).
;;; Status: 52 recipes created (13 aliases, 39 new); 48 blocked.
(define-module (gaurix packages queue-20260405-daily1)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system perl)
  #:use-module (guix gexp)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages image)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages crypto)
  #:export (
            ;; aliases (13)
            mediastreamer-git
            meld-git
            mkvtoolnix-git
            newsboat-git
            opendht-git
            qdirstat-git
            restic-git
            swi-prolog-devel
            tealdeer-git
            threadweaver-git
            tig-git
            timew-git
            synergy-1.6
            ;; new recipes (39)
            masterpassword-cli
            mdp-git
            megabasterd-bin
            mined
            mopidy-mpris
            mutt-slang
            mypy-git
            nbwmon
            otf-vegur
            peervpn
            pekwm-git
            perl-getopt-mixed
            perl-parse-errorstring-perl
            photoprism-bin
            play-with-mpv-git
            python-espeak
            python-pyspf
            redshift-scheduler
            retmux
            ruby-colored
            shadow-icon-theme
            simple-fb2-reader
            sparklines-git
            sunclock
            syobon
            tbclock
            tmpreaper
            toppler
            torrentcheck
            uw-ttyp0-font
            verynice
            vim-instant-markdown
            vim-manpageview
            vim-notes
            vim-pandoc-git
            vim-perl-completion
            vim-repeat
            stardict-cz
            structuresynth
            ))

;;; ===== ALIASES (13) =====

(define-public mediastreamer-git
  (let ((base (specification->package "mediastreamer2")))
    (package
      (inherit base)
      (name "mediastreamer-git"))))

(define-public meld-git
  (let ((base (specification->package "meld")))
    (package
      (inherit base)
      (name "meld-git"))))

(define-public mkvtoolnix-git
  (let ((base (specification->package "mkvtoolnix")))
    (package
      (inherit base)
      (name "mkvtoolnix-git"))))

(define-public newsboat-git
  (let ((base (specification->package "newsboat")))
    (package
      (inherit base)
      (name "newsboat-git"))))

(define-public opendht-git
  (let ((base (specification->package "opendht")))
    (package
      (inherit base)
      (name "opendht-git"))))

(define-public qdirstat-git
  (let ((base (specification->package "qdirstat")))
    (package
      (inherit base)
      (name "qdirstat-git"))))

(define-public restic-git
  (let ((base (specification->package "restic")))
    (package
      (inherit base)
      (name "restic-git"))))

(define-public swi-prolog-devel
  (let ((base (specification->package "swi-prolog")))
    (package
      (inherit base)
      (name "swi-prolog-devel"))))

(define-public tealdeer-git
  (let ((base (specification->package "tealdeer")))
    (package
      (inherit base)
      (name "tealdeer-git"))))

(define-public threadweaver-git
  (let ((base (specification->package "threadweaver")))
    (package
      (inherit base)
      (name "threadweaver-git"))))

(define-public tig-git
  (let ((base (specification->package "tig")))
    (package
      (inherit base)
      (name "tig-git"))))

(define-public timew-git
  (let ((base (specification->package "timewarrior")))
    (package
      (inherit base)
      (name "timew-git"))))

(define-public synergy-1.6
  (let ((base (specification->package "synergy")))
    (package
      (inherit base)
      (name "synergy-1.6"))))

;;; ===== NEW RECIPES (39) =====

(define-public masterpassword-cli
  (package
    (name "masterpassword-cli")
    (version "2.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/spectre-app/cli")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libsodium ncurses))
    (home-page "https://github.com/spectre-app/cli")
    (synopsis "CLI password manager using stateless algorithm")
    (description "Master Password (Spectre) is a stateless password manager
that generates site passwords from a master password and site name using a
deterministic algorithm.  No passwords are stored anywhere.")
    (license license:gpl3+)))

(define-public mdp-git
  (package
    (name "mdp-git")
    (version "0.9.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/visit1985/mdp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))))
    (inputs (list ncurses))
    (home-page "https://github.com/visit1985/mdp")
    (synopsis "Command-line based markdown presentation tool")
    (description "A command-line based markdown presentation tool that renders
markdown files as terminal-based slideshows using ncurses.")
    (license license:gpl3+)))

(define-public megabasterd-bin
  (package
    (name "megabasterd-bin")
    (version "8.40")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tonikelope/megabasterd/releases/download/v"
             version "/MegaBasterd_" version ".jar"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((,(string-append "MegaBasterd_" #$(package-version this-package) ".jar")
           "share/java/megabasterd.jar"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda _
              (let ((bin (string-append #$output "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/megabasterd")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec java -jar ~a/share/java/megabasterd.jar \"$@\"\n"
                            #$output)))
                (chmod (string-append bin "/megabasterd") #o755)))))))
    (home-page "https://github.com/tonikelope/megabasterd")
    (synopsis "Unofficial MEGA downloader and uploader suite")
    (description "MegaBasterd is an unofficial cross-platform MEGA downloader,
uploader, and streaming suite written in Java.")
    (license license:gpl3+)))

(define-public mined
  (package
    (name "mined")
    (version "2015.25")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mined/mined/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list ncurses))
    (home-page "https://mined.github.io/")
    (synopsis "Text editor with extensive Unicode support")
    (description "MinEd is a powerful text editor with a comprehensive and
easy-to-use user interface and fast, small-footprint behaviour.  It has
extensive Unicode support and smart input methods.")
    (license license:gpl3+)))

(define-public mopidy-mpris
  (package
    (name "mopidy-mpris")
    (version "3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Mopidy-MPRIS" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/mopidy/mopidy-mpris")
    (synopsis "Mopidy extension for MPRIS D-Bus interface control")
    (description "Mopidy-MPRIS provides a Mopidy extension that enables
controlling Mopidy through the MPRIS D-Bus interface, allowing integration
with desktop media controls.")
    (license license:asl2.0)))

(define-public mutt-slang
  (let ((base (specification->package "mutt")))
    (package
      (inherit base)
      (name "mutt-slang"))))

(define-public mypy-git
  (package
    (name "mypy-git")
    (version "1.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mypy" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/python/mypy")
    (synopsis "Optional static type checker for Python")
    (description "Mypy is an optional static type checker for Python that aims
to combine the benefits of dynamic typing and static typing.  It checks
Python programs for type errors using PEP 484 type annotations.")
    (license license:expat)))

(define-public nbwmon
  (package
    (name "nbwmon")
    (version "0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/causes-/nbwmon")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list ncurses))
    (home-page "https://github.com/causes-/nbwmon")
    (synopsis "Ncurses bandwidth monitor")
    (description "nbwmon is a lightweight ncurses-based bandwidth monitor for
Linux that shows real-time network traffic statistics in the terminal.")
    (license license:expat)))

(define-public otf-vegur
  (package
    (name "otf-vegur")
    (version "0.701")
    (source
     (origin
       (method url-fetch)
       (uri "https://dotcolon.net/DL/font/vegur.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/opentype/" #:include-regexp (".*\\.otf$")))))
    (home-page "https://dotcolon.net/font/vegur/")
    (synopsis "Humanist sans-serif font used for the LibreOffice logo")
    (description "Vegur is a humanist sans-serif font by Sora Sagano,
notably used for the LibreOffice logo.  Available in Light, Regular, and Bold
weights in OpenType format.")
    (license license:cc0)))

(define-public peervpn
  (package
    (name "peervpn")
    (version "0.044")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hideman-ltd/peervpn")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda _
                   (install-file "peervpn" (string-append #$output "/bin")))))))
    (inputs (list openssl))
    (home-page "https://github.com/hideman-ltd/peervpn")
    (synopsis "Open source peer-to-peer VPN")
    (description "PeerVPN is an open source peer-to-peer VPN that builds
a full-mesh encrypted tunnel network over UDP, requiring no central server.")
    (license license:gpl3+)))

(define-public pekwm-git
  (package
    (name "pekwm-git")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pekdon/pekwm")
             (commit (string-append "release-" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libx11 libxinerama libxrandr libxft))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/pekdon/pekwm")
    (synopsis "Tabbed X11 window manager")
    (description "PeKWM is a lightweight, tabbed X11 window manager with
grouping, autoproperties, keybindings, a simple menu system, and a Lisp-like
configuration language.")
    (license license:gpl2+)))

(define-public perl-getopt-mixed
  (package
    (name "perl-getopt-mixed")
    (version "1.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://cpan/authors/id/C/CJ/CJM/Getopt-Mixed-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/pod/Getopt::Mixed")
    (synopsis "Getopt processing with both long and short options")
    (description "Getopt::Mixed provides a Perl library for processing
command-line options that supports both long and short option formats in a
single interface.")
    (license license:perl-license)))

(define-public perl-parse-errorstring-perl
  (package
    (name "perl-parse-errorstring-perl")
    (version "0.27")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://cpan/authors/id/M/MA/MANWAR/Parse-ErrorString-Perl-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/dist/Parse-ErrorString-Perl")
    (synopsis "Parse error messages from the Perl interpreter")
    (description "Parse::ErrorString::Perl parses error and warning messages
from the Perl interpreter into structured data, useful for IDE integration and
error-handling tools.")
    (license license:perl-license)))

(define-public photoprism-bin
  (package
    (name "photoprism-bin")
    (version "240915")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/photoprism/photoprism/releases/download/"
             version "/photoprism-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("photoprism" "bin/photoprism"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/photoprism") #o755))))))
    (home-page "https://www.photoprism.app/")
    (synopsis "AI-powered photo management application")
    (description "PhotoPrism is an AI-powered photo management application
written in Go that provides automatic tagging, face recognition, maps,
and powerful search for personal photo libraries.")
    (license license:agpl3+)))

(define-public play-with-mpv-git
  (package
    (name "play-with-mpv-git")
    (version "0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Thann/play-with-mpv")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Thann/play-with-mpv")
    (synopsis "Play web videos in mpv via browser extension")
    (description "play-with-mpv provides a Python server and companion browser
extension that allows opening videos from web pages directly in mpv player
instead of the browser.")
    (license license:expat)))

(define-public python-espeak
  (package
    (name "python-espeak")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "python-espeak" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/relsi/python-espeak")
    (synopsis "Python bindings for eSpeak text-to-speech")
    (description "Python-espeak provides Python bindings for the eSpeak
text-to-speech synthesizer, allowing programmatic control of speech synthesis
from Python programs.")
    (license license:gpl3+)))

(define-public python-pyspf
  (package
    (name "python-pyspf")
    (version "2.0.14")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyspf" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/sdgathman/pyspf")
    (synopsis "Python implementation of the Sender Policy Framework protocol")
    (description "pyspf is a Python implementation of the Sender Policy
Framework (SPF) protocol, used to validate email sender addresses against
DNS-published SPF records to prevent email spoofing.")
    (license license:psfl)))

(define-public redshift-scheduler
  (package
    (name "redshift-scheduler")
    (version "1.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/spantaleev/redshift-scheduler")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/spantaleev/redshift-scheduler")
    (synopsis "Rule-based screen temperature changer based on redshift")
    (description "Redshift Scheduler is a rule-based screen temperature
controller that wraps redshift, allowing more complex scheduling rules for
color temperature adjustment.")
    (license license:gpl3+)))

(define-public retmux
  (package
    (name "retmux")
    (version "0.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sk1418/retmux")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/sk1418/retmux")
    (synopsis "Tmux sessions backup and restore tool")
    (description "retmux provides backup and restore functionality for tmux
sessions, preserving session layouts and window configurations.")
    (license license:expat)))

(define-public ruby-colored
  (package
    (name "ruby-colored")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://rubygems.org/downloads/colored-" version ".gem"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/ruby/vendor_ruby/" #:include-regexp (".*\\.rb$")))))
    (home-page "https://rubygems.org/gems/colored")
    (synopsis "Ruby library for colorizing terminal text output")
    (description "Colored adds methods to String for colorizing terminal
text output with ANSI escape codes, providing a simple API like
@code{\"text\".red} or @code{\"text\".bold}.")
    (license license:expat)))

(define-public shadow-icon-theme
  (package
    (name "shadow-icon-theme")
    (version "4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rudrab/Shadow")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/icons/Shadow/"))))
    (home-page "https://github.com/rudrab/Shadow")
    (synopsis "Flat colorful icon theme for GNOME 3.10+")
    (description "Shadow is a flat icon theme for GNOME with colourful
circular bases and long shadow effects on the icons.")
    (license license:gpl3+)))

(define-public simple-fb2-reader
  (package
    (name "simple-fb2-reader")
    (version "0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Cactus64k/simple-fb2-reader")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Cactus64k/simple-fb2-reader")
    (synopsis "Simple FB2 book reader on GTK+3")
    (description "Simple FB2 Reader is a lightweight GTK+3 application for
reading FictionBook (FB2) format e-books.")
    (license license:gpl3+)))

(define-public sparklines-git
  (package
    (name "sparklines-git")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/deeplook/sparklines")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/deeplook/sparklines")
    (synopsis "Sparklines for your shell using Unicode block characters")
    (description "Sparklines generates sparkline charts in the terminal
using Unicode block characters, providing quick visual data representation
on the command line.")
    (license license:expat)))

(define-public sunclock
  (package
    (name "sunclock")
    (version "3.57")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nongiach/Sunclock")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list libx11 libxpm))
    (home-page "https://github.com/nongiach/Sunclock")
    (synopsis "Astronomical world map showing day and night positions")
    (description "Sunclock is an X11 application that displays an equirectangular
projection of the Earth with the day/night terminator, Sun and Moon positions
updated in real time.")
    (license license:gpl2+)))

(define-public syobon
  (package
    (name "syobon")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/akemin-dayo/OpenSyobonAction")
             (commit "master")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list sdl2 sdl2-image sdl2-mixer sdl2-ttf))
    (home-page "https://github.com/akemin-dayo/OpenSyobonAction")
    (synopsis "Open source implementation of Syobon Action (Cat Mario)")
    (description "Open Syobon Action is a free and open source implementation
of the Japanese parody game Syobon Action (also known as Cat Mario), a
notoriously difficult platformer inspired by Super Mario Bros.")
    (license license:gpl2+)))

(define-public tbclock
  (package
    (name "tbclock")
    (version "2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tamentis/tbclock")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list ncurses))
    (home-page "https://github.com/tamentis/tbclock")
    (synopsis "Full screen binary clock for your terminal")
    (description "tbclock displays a full screen binary clock in the terminal
using ncurses, with an optional guessbin game mode for learning binary time.")
    (license license:isc)))

(define-public tmpreaper
  (package
    (name "tmpreaper")
    (version "1.6.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://deb.debian.org/debian/pool/main/t/tmpreaper/tmpreaper_"
             version ".orig.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://packages.debian.org/tmpreaper")
    (synopsis "Cleans up files in directories based on their age")
    (description "tmpreaper traverses specified directories and removes files
that have not been accessed for a configurable period, useful for cleaning
temporary file directories.")
    (license license:gpl2+)))

(define-public toppler
  (package
    (name "toppler")
    (version "1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/roever/toppler/-/archive/v"
             version "/toppler-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list sdl2 sdl2-mixer sdl2-image zlib))
    (native-inputs (list pkg-config))
    (home-page "https://toppler.sourceforge.net/")
    (synopsis "Reimplementation of the classic game Nebulus")
    (description "Toppler is a reimplementation of the classic jump-and-run
game Nebulus (also known as Tower Toppler), where you climb rotating towers
while avoiding obstacles and enemies.")
    (license license:gpl2+)))

(define-public torrentcheck
  (package
    (name "torrentcheck")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "torrentcheck" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/clee704/torrentcheck")
    (synopsis "Command line torrent viewer and hash checker")
    (description "torrentcheck is a command-line tool for viewing torrent file
metadata and verifying file integrity by checking piece hashes against
actual downloaded data.")
    (license license:expat)))

(define-public uw-ttyp0-font
  (package
    (name "uw-ttyp0-font")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://people.mpi-inf.mpg.de/~uwe/misc/uw-ttyp0/uw-ttyp0-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://people.mpi-inf.mpg.de/~uwe/misc/uw-ttyp0/")
    (synopsis "Bitmap monospaced font with Unicode and Powerline symbols")
    (description "UW ttyp0 is a family of bitmap monospaced fonts with extensive
Unicode coverage including Latin, Greek, Cyrillic, and Powerline symbols,
designed for use in terminal emulators.")
    (license (license:non-copyleft
              "https://people.mpi-inf.mpg.de/~uwe/misc/uw-ttyp0/LICENSE"
              "Custom free license"))))

(define-public verynice
  (package
    (name "verynice")
    (version "2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/JohannesBuchner/verynice")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda _
                   (install-file "verynice" (string-append #$output "/bin")))))))
    (home-page "https://github.com/JohannesBuchner/verynice")
    (synopsis "Dynamic process re-nicer daemon")
    (description "VeryNice is a tool for dynamically adjusting the nice level
of processes under Unix-like operating systems, automatically managing process
priorities based on configurable rules.")
    (license license:gpl2+)))

(define-public vim-instant-markdown
  (package
    (name "vim-instant-markdown")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/instant-markdown/vim-instant-markdown")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("autoload" "share/vim/vimfiles/autoload")
          ("plugin" "share/vim/vimfiles/plugin")
          ("ftplugin" "share/vim/vimfiles/ftplugin")
          ("doc" "share/vim/vimfiles/doc"))))
    (home-page "https://github.com/instant-markdown/vim-instant-markdown")
    (synopsis "Instant Markdown previews from Vim in a browser")
    (description "vim-instant-markdown provides real-time Markdown preview in
a web browser as you type in Vim, updating the preview automatically with
each change.")
    (license license:expat)))

(define-public vim-manpageview
  (package
    (name "vim-manpageview")
    (version "25b")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.vim.org/scripts/download_script.php?src_id=24018")
       (file-name "manpageview.vba.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/vim/vimfiles/" #:include-regexp (".*\\.vim$")))))
    (home-page "https://www.vim.org/scripts/script.php?script_id=489")
    (synopsis "Viewer for manpages, GNU info, and perldoc in Vim")
    (description "vim-manpageview provides a Vim plugin for viewing man pages,
GNU info, perldoc, and PHP documentation directly within Vim.")
    (license license:vim)))

(define-public vim-notes
  (package
    (name "vim-notes")
    (version "0.33")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xolox/vim-notes")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("autoload" "share/vim/vimfiles/autoload")
          ("plugin" "share/vim/vimfiles/plugin")
          ("doc" "share/vim/vimfiles/doc")
          ("misc" "share/vim/vimfiles/misc"))))
    (home-page "https://github.com/xolox/vim-notes")
    (synopsis "Easy note taking plugin for Vim")
    (description "vim-notes provides a fast and intuitive note-taking
experience within Vim, with features like note search, completion, and
customizable storage.")
    (license license:expat)))

(define-public vim-pandoc-git
  (package
    (name "vim-pandoc-git")
    (version "2.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vim-pandoc/vim-pandoc")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("autoload" "share/vim/vimfiles/autoload")
          ("plugin" "share/vim/vimfiles/plugin")
          ("ftplugin" "share/vim/vimfiles/ftplugin")
          ("syntax" "share/vim/vimfiles/syntax")
          ("doc" "share/vim/vimfiles/doc"))))
    (home-page "https://github.com/vim-pandoc/vim-pandoc")
    (synopsis "Vim plugin for writing and editing documents with pandoc")
    (description "vim-pandoc provides integration between Vim and pandoc,
enabling comfortable editing and compilation of documents in pandoc's
extended Markdown format.")
    (license license:gpl3+)))

(define-public vim-perl-completion
  (package
    (name "vim-perl-completion")
    (version "0.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.vim.org/scripts/download_script.php?src_id=14625")
       (file-name "perl-completion.vim")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("perl-completion.vim" "share/vim/vimfiles/autoload/"))))
    (home-page "https://www.vim.org/scripts/script.php?script_id=2852")
    (synopsis "Perl omni completion for Vim")
    (description "vim-perl-completion provides Perl omni completion support
for Vim, including basic Moose syntax, variable names, class methods,
and other common Perl patterns.")
    (license license:vim)))

(define-public vim-repeat
  (package
    (name "vim-repeat")
    (version "1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tpope/vim-repeat")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("autoload" "share/vim/vimfiles/autoload")
          ("plugin" "share/vim/vimfiles/plugin"))))
    (home-page "https://github.com/tpope/vim-repeat")
    (synopsis "Enable the repeat command (.) with supported Vim plugins")
    (description "vim-repeat extends Vim's repeat command (.) to work with
plugin mappings, allowing plugins to properly integrate with the repeat
functionality by Tim Pope.")
    (license license:vim)))

(define-public stardict-cz
  (package
    (name "stardict-cz")
    (version "20171101")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cihar.com/software/slovnik/dl/stardict-czech-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/stardict/dic/" #:include-regexp (".*\\.(dict|idx|ifo)(\\.gz)?$")))))
    (home-page "https://cihar.com/software/slovnik/")
    (synopsis "Czech dictionary of foreign words for StarDict")
    (description "Czech dictionary of foreign words in StarDict format,
providing translations and definitions for foreign loan words used in
the Czech language.")
    (license license:gpl2+)))

(define-public structuresynth
  (package
    (name "structuresynth")
    (version "1.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/LegalizeAdulthood/structuresynth")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://structuresynth.sourceforge.net/")
    (synopsis "3D structure generator from sets of design grammar rules")
    (description "Structure Synth is a tool for generating 3D structures from
sets of user-defined design grammar rules, similar to Context Free but
producing three-dimensional output.  Uses a domain-specific language called
EisenScript.")
    (license license:gpl2+)))
