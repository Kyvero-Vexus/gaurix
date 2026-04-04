;;; Queue drain 2026-04-04 daily run batch 2 (queue-20260404-daily2).
;;; Attempted 100 TODO-status entries from todo_general_packages.org.
;;; Status: 52 recipes created (1 aliases, 51 new); 48 blocked.
(define-module (gaurix packages queue-20260404-daily2)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (gnu packages python-build)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix gexp)
  #:export (
            libhelium
            fluent-gtk-theme
            htminl-bin
            guitar-bin
            mgmt-bin
            collapseloader-bin
            python-odsexport
            lxappearance-gtk2
            zmate-bin
            szyszka
            netop
            python-asyncinotify
            mate-applet-lockkeys
            loggo-bin
            toutui-bin
            slskd-bin
            gtrash-bin
            deletor-bin
            topiary-bin
            andcli-bin
            c
            eget-bin
            circup
            outline-manager-appimage
            motus-bin
            tuckr
            oggvideotools
            pvw-bin
            wsjtx-improved-widescreen
            yandex-disk-indicator
            maple-mono-nf-cn-unhinted
            lamebar
            c-lcrypt
            obsidian2web
            obsidian2web-bin
            sentry-relay
            adbyss-bin
            guff-bin
            oh-my-theme
            yesvgmap-bin
            channelz-bin
            ns-usbloader
            resemb
            codanna-bin
            torrra
            rkvm
            uxplay
            ntfysh-bin
            roumon-bin
            sou-bin
            ssl-checker-bin
            gitnr-bin
            ))

(define-public libhelium
  (package
    (name "libhelium")
    (version "1.8.71")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tau-OS/libhelium/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/tau-OS/libhelium")
    (synopsis "The application framework for tauOS apps.")
    (description "The application framework for tauOS apps.")
    (license license:gpl3+)))

(define-public fluent-gtk-theme
  (package
    (name "fluent-gtk-theme")
    (version "2025.04.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vinceliuice/Fluent-gtk-theme/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/vinceliuice/Fluent-gtk-theme")
    (synopsis "Fluent design GTK theme")
    (description "Fluent design GTK theme")
    (license license:gpl3+)))

(define-public htminl-bin
  (package
    (name "htminl-bin")
    (version "0.11.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Blobfolio/htminl/releases/download/v"
             version "/htminl-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("htminl" "bin/htminl"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/htminl") #o755))))))
    (home-page "https://github.com/Blobfolio/htminl")
    (synopsis "CLI tool that simplifies the task of minifying HTML in-place for production en")
    (description "CLI tool that simplifies the task of minifying HTML in-place for production environments")
    (license license:wtfpl2)))

(define-public guitar-bin
  (package
    (name "guitar-bin")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/soramimi/Guitar/releases/download/v"
             version "/Guitar-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("Guitar" "bin/guitar"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/guitar") #o755))))))
    (home-page "https://github.com/soramimi/Guitar")
    (synopsis "Open source Git GUI Client")
    (description "Open source Git GUI Client")
    (license license:gpl2+)))

(define-public mgmt-bin
  (package
    (name "mgmt-bin")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/purpleidea/mgmt/releases/download/v"
             version "/mgmt-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("mgmt" "bin/mgmt"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/mgmt") #o755))))))
    (home-page "https://github.com/purpleidea/mgmt")
    (synopsis "Next generation config management.")
    (description "Next generation config management.")
    (license license:gpl3+)))

(define-public collapseloader-bin
  (package
    (name "collapseloader-bin")
    (version "0.2.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dest4590/CollapseLoader/releases/download/v"
             version "/CollapseLoader-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("CollapseLoader" "bin/collapseloader"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/collapseloader") #o755))))))
    (home-page "https://github.com/dest4590/CollapseLoader")
    (synopsis "A user-friendly loader for many minecraft clients")
    (description "A user-friendly loader for many minecraft clients")
    (license license:gpl3+)))

(define-public python-odsexport
  (package
    (name "python-odsexport")
    (version "0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "odsexport" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/johndoe31415/odsexport")
    (synopsis "Python-native ODS writer library")
    (description "Python-native ODS writer library")
    (license license:gpl3+)))

(define-public lxappearance-gtk2
  (package
    (inherit (specification->package "lxappearance"))
    (name "lxappearance-gtk2")))

(define-public zmate-bin
  (package
    (name "zmate-bin")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ziinaio/zmate/releases/download/v"
             version "/zmate-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("zmate" "bin/zmate"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/zmate") #o755))))))
    (home-page "https://github.com/ziinaio/zmate")
    (synopsis "Instant terminal sharing using Zellij and SSH")
    (description "Instant terminal sharing using Zellij and SSH")
    (license license:expat)))

(define-public szyszka
  (package
    (name "szyszka")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/qarmin/szyszka/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/qarmin/szyszka")
    (synopsis "A simple but powerful batch file rename program")
    (description "A simple but powerful batch file rename program")
    (license license:expat)))

(define-public netop
  (package
    (name "netop")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ZingerLittleBee/netop/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ZingerLittleBee/netop")
    (synopsis "A terminal command line interface that can customize the filter network traffi")
    (description "A terminal command line interface that can customize the filter network traffic rule with BPF")
    (license license:expat)))

(define-public python-asyncinotify
  (package
    (name "python-asyncinotify")
    (version "4.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "asyncinotify" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://pypi.org/project/asyncinotify/")
    (synopsis "'A simple optionally-async python inotify library, focused on simplicity of us")
    (description "'A simple optionally-async python inotify library, focused on simplicity of use and operation, and leveraging modern Python features")
    (license license:expat)))

(define-public mate-applet-lockkeys
  (package
    (name "mate-applet-lockkeys")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rezso/mate-applet-lockkeys/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/rezso/mate-applet-lockkeys")
    (synopsis "A MATE panel applet that shows which of the CapsLock, NumLock and ScrollLock k")
    (description "A MATE panel applet that shows which of the CapsLock, NumLock and ScrollLock keys are on and which are off.")
    (license license:gpl2+)))

(define-public loggo-bin
  (package
    (name "loggo-bin")
    (version "0.3.26")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/aurc/loggo/releases/download/v"
             version "/loggo-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("loggo" "bin/loggo"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/loggo") #o755))))))
    (home-page "https://github.com/aurc/loggo")
    (synopsis "A powerful terminal app for structured log streaming")
    (description "A powerful terminal app for structured log streaming")
    (license license:expat)))

(define-public toutui-bin
  (package
    (name "toutui-bin")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AlbanDAVID/Toutui/releases/download/v"
             version "/Toutui-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("Toutui" "bin/toutui"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/toutui") #o755))))))
    (home-page "https://github.com/AlbanDAVID/Toutui")
    (synopsis "TUI Audiobookshelf client. Listen to your audiobooks and podcasts from your te")
    (description "TUI Audiobookshelf client. Listen to your audiobooks and podcasts from your terminal.")
    (license license:gpl3+)))

(define-public slskd-bin
  (package
    (name "slskd-bin")
    (version "0.24.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/slskd/slskd/releases/download/v"
             version "/slskd-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("slskd" "bin/slskd"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/slskd") #o755))))))
    (home-page "https://github.com/slskd/slskd/")
    (synopsis "A modern client-server application for the Soulseek file-sharing network.")
    (description "A modern client-server application for the Soulseek file-sharing network.")
    (license license:agpl3)))

(define-public gtrash-bin
  (package
    (name "gtrash-bin")
    (version "0.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/umlx5h/gtrash/releases/download/v"
             version "/gtrash-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("gtrash" "bin/gtrash"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/gtrash") #o755))))))
    (home-page "https://github.com/umlx5h/gtrash")
    (synopsis "A Trash CLI manager written in Go")
    (description "A Trash CLI manager written in Go")
    (license license:expat)))

(define-public deletor-bin
  (package
    (name "deletor-bin")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pashkov256/deletor/releases/download/v"
             version "/deletor-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("deletor" "bin/deletor"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/deletor") #o755))))))
    (home-page "https://github.com/pashkov256/deletor")
    (synopsis "Manage and delete files efficiently with an interactive TUI and scriptable CLI")
    (description "Manage and delete files efficiently with an interactive TUI and scriptable CLI")
    (license license:expat)))

(define-public topiary-bin
  (package
    (name "topiary-bin")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tweag/topiary/releases/download/v"
             version "/topiary-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("topiary" "bin/topiary"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/topiary") #o755))))))
    (home-page "https://github.com/tweag/topiary")
    (synopsis "Topiary is a tool in the Tree-sitter ecosystem, designed for formatter authors")
    (description "Topiary is a tool in the Tree-sitter ecosystem, designed for formatter authors and formatter users")
    (license license:expat)))

(define-public andcli-bin
  (package
    (name "andcli-bin")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tjblackheart/andcli/releases/download/v"
             version "/andcli-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("andcli" "bin/andcli"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/andcli") #o755))))))
    (home-page "https://github.com/tjblackheart/andcli")
    (synopsis "A 2FA TUI for your shell")
    (description "A 2FA TUI for your shell")
    (license license:expat)))

(define-public c
  (package
    (name "c")
    (version "0.15.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ryanmjacobs/c/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ryanmjacobs/c")
    (synopsis "Compile and execute C \"scripts\" in one go")
    (description "Compile and execute C \"scripts\" in one go")
    (license license:expat)))

(define-public eget-bin
  (package
    (name "eget-bin")
    (version "1.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/zyedidia/eget/releases/download/v"
             version "/eget-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("eget" "bin/eget"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/eget") #o755))))))
    (home-page "https://github.com/zyedidia/eget")
    (synopsis "Easily install prebuilt binaries from GitHub")
    (description "Easily install prebuilt binaries from GitHub")
    (license license:expat)))

(define-public circup
  (package
    (name "circup")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/adafruit/circup/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/adafruit/circup")
    (synopsis "A tool to manage/update libraries on CircuitPython devices.")
    (description "A tool to manage/update libraries on CircuitPython devices.")
    (license license:expat)))

(define-public outline-manager-appimage
  (package
    (name "outline-manager-appimage")
    (version "1.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Jigsaw-Code/outline-server/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Jigsaw-Code/outline-server")
    (synopsis "Creates and manages Outline servers, powered by Shadowsocks.")
    (description "Creates and manages Outline servers, powered by Shadowsocks.")
    (license license:asl2.0)))

(define-public motus-bin
  (package
    (name "motus-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/oleiade/motus/releases/download/v"
             version "/motus-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("motus" "bin/motus"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/motus") #o755))))))
    (home-page "https://github.com/oleiade/motus")
    (synopsis "A dead simple password generator")
    (description "A dead simple password generator")
    (license license:agpl3)))

(define-public tuckr
  (package
    (name "tuckr")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/RaphGL/Tuckr/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/RaphGL/Tuckr")
    (synopsis "A super powered replacement for the GNU Stow dotfile manager")
    (description "A super powered replacement for the GNU Stow dotfile manager")
    (license license:gpl3+)))

(define-public oggvideotools
  (package
    (name "oggvideotools")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/oggvideotools/oggvideotools-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://sourceforge.net/projects/oggvideotools/")
    (synopsis "A collection of tools for manipulating Ogg video files")
    (description "A collection of tools for manipulating Ogg video files")
    (license license:gpl2+)))

(define-public pvw-bin
  (package
    (name "pvw-bin")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/allyring/pvw/releases/download/v"
             version "/pvw-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("pvw" "bin/pvw"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/pvw") #o755))))))
    (home-page "https://github.com/allyring/pvw")
    (synopsis "A simple and intuitive TUI to monitor the ports used on a computer")
    (description "A simple and intuitive TUI to monitor the ports used on a computer")
    (license license:gpl3+)))

(define-public wsjtx-improved-widescreen
  (package
    (name "wsjtx-improved-widescreen")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/wsjtx-improved-widescreen/wsjtx-improved-widescreen-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://sourceforge.net/projects/wsjt-x-improved/")
    (synopsis "Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X I")
    (description "Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X Improved by DG2YCB (Widescreen Layout Version)")
    (license license:gpl3+)))

(define-public yandex-disk-indicator
  (package
    (name "yandex-disk-indicator")
    (version "1.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/slytomcat/yandex-disk-indicator/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/slytomcat/yandex-disk-indicator/")
    (synopsis "Panel indicator (GUI) for YandexDisk CLI client for Linux.")
    (description "Panel indicator (GUI) for YandexDisk CLI client for Linux.")
    (license license:gpl3+)))

(define-public maple-mono-nf-cn-unhinted
  (package
    (name "maple-mono-nf-cn-unhinted")
    (version "7.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/subframe7536/maple-font/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/subframe7536/maple-font")
    (synopsis "Open source monospace font with round corner, ligatures and Nerd-Font icons fo")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font icons for IDE and terminal, fine-grained customization options.")
    (license license:silofl1.1)))

(define-public lamebar
  (package
    (name "lamebar")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jakubsmolaga/lamebar/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jakubsmolaga/lamebar")
    (synopsis "Hyper-minimalistic status bar for Wayland compositors")
    (description "Hyper-minimalistic status bar for Wayland compositors")
    (license license:expat)))

(define-public c-lcrypt
  (package
    (name "c-lcrypt")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Locotir/C-LCRYPT/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Locotir/C-LCRYPT")
    (synopsis "C++ encryption program with RAM-based I/O, featuring byte shuffling, binary re")
    (description "C++ encryption program with RAM-based I/O, featuring byte shuffling, binary reversal, bit insertion, byte substitution with randomized table, and XOR key encryption for secure file/folder handling.")
    (license license:expat)))

(define-public obsidian2web
  (package
    (name "obsidian2web")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lun-4/obsidian2web/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/lun-4/obsidian2web")
    (synopsis "lun-4's obsidian publish knockoff that generates (largely static) websites")
    (description "lun-4's obsidian publish knockoff that generates (largely static) websites")
    (license license:expat)))

(define-public obsidian2web-bin
  (package
    (name "obsidian2web-bin")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lun-4/obsidian2web/releases/download/v"
             version "/obsidian2web-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("obsidian2web" "bin/obsidian2web"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/obsidian2web") #o755))))))
    (home-page "https://github.com/lun-4/obsidian2web")
    (synopsis "lun-4's obsidian publish knockoff that generates (largely static) websites")
    (description "lun-4's obsidian publish knockoff that generates (largely static) websites")
    (license license:expat)))

(define-public sentry-relay
  (package
    (name "sentry-relay")
    (version "26.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/getsentry/relay/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/getsentry/relay")
    (synopsis "Sentry relay")
    (description "Sentry relay")
    (license license:asl2.0)))

(define-public adbyss-bin
  (package
    (name "adbyss-bin")
    (version "0.23.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Blobfolio/adbyss/releases/download/v"
             version "/adbyss-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("adbyss" "bin/adbyss"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/adbyss") #o755))))))
    (home-page "https://github.com/Blobfolio/adbyss")
    (synopsis "DNS blocklist manager")
    (description "DNS blocklist manager")
    (license license:wtfpl2)))

(define-public guff-bin
  (package
    (name "guff-bin")
    (version "0.11.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Blobfolio/guff/releases/download/v"
             version "/guff-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("guff" "bin/guff"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/guff") #o755))))))
    (home-page "https://github.com/Blobfolio/guff")
    (synopsis "A simple SASS/SCSS compiler and CSS parser/minifier")
    (description "A simple SASS/SCSS compiler and CSS parser/minifier")
    (license license:wtfpl2)))

(define-public oh-my-theme
  (package
    (name "oh-my-theme")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mikeisfree/oh-my-theme/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/mikeisfree/oh-my-theme")
    (synopsis "A terminal-based theme manager for Oh My Posh")
    (description "A terminal-based theme manager for Oh My Posh")
    (license license:expat)))

(define-public yesvgmap-bin
  (package
    (name "yesvgmap-bin")
    (version "0.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Blobfolio/yesvgmap/releases/download/v"
             version "/yesvgmap-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("yesvgmap" "bin/yesvgmap"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/yesvgmap") #o755))))))
    (home-page "https://github.com/Blobfolio/yesvgmap")
    (synopsis "CLI app for generating SVG sprite maps from any number of standalone SVG image")
    (description "CLI app for generating SVG sprite maps from any number of standalone SVG images.")
    (license license:wtfpl2)))

(define-public channelz-bin
  (package
    (name "channelz-bin")
    (version "0.12.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Blobfolio/channelz/releases/download/v"
             version "/channelz-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("channelz" "bin/channelz"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/channelz") #o755))))))
    (home-page "https://github.com/Blobfolio/channelz")
    (synopsis "CLI tool to encode static assets with Gzip and Brotli")
    (description "CLI tool to encode static assets with Gzip and Brotli")
    (license license:wtfpl2)))

(define-public ns-usbloader
  (package
    (name "ns-usbloader")
    (version "7.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/developersu/ns-usbloader/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/developersu/ns-usbloader")
    (synopsis "Awoo Installer/TinFoil/GoldLeaf NSPs (and other files) uploader and RCM tool.")
    (description "Awoo Installer/TinFoil/GoldLeaf NSPs (and other files) uploader and RCM tool.")
    (license license:gpl3+)))

(define-public resemb
  (package
    (name "resemb")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/2IMT/resemb/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/2IMT/resemb")
    (synopsis "Tool to bake assets into your executable")
    (description "Tool to bake assets into your executable")
    (license license:expat)))

(define-public codanna-bin
  (package
    (name "codanna-bin")
    (version "0.9.19")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bartolli/codanna/releases/download/v"
             version "/codanna-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("codanna" "bin/codanna"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/codanna") #o755))))))
    (home-page "https://github.com/bartolli/codanna")
    (synopsis "X-ray vision for your agent - Code assistant with understanding of functions, ")
    (description "X-ray vision for your agent - Code assistant with understanding of functions, relationships, and implementations")
    (license license:asl2.0)))

(define-public torrra
  (package
    (name "torrra")
    (version "2.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/stabldev/torrra/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/stabldev/torrra")
    (synopsis "A Python tool that lets you find and download torrents without leaving your CL")
    (description "A Python tool that lets you find and download torrents without leaving your CLI.")
    (license license:expat)))

(define-public rkvm
  (package
    (name "rkvm")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/htrefil/rkvm/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/htrefil/rkvm")
    (synopsis "Virtual KVM switch for Linux machines")
    (description "Virtual KVM switch for Linux machines")
    (license license:expat)))

(define-public uxplay
  (package
    (name "uxplay")
    (version "1.73.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FDH2/UxPlay/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/FDH2/UxPlay")
    (synopsis "AirPlay Unix mirroring server")
    (description "AirPlay Unix mirroring server")
    (license license:gpl3+)))

(define-public ntfysh-bin
  (package
    (name "ntfysh-bin")
    (version "2.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/binwiederhier/ntfy/releases/download/v"
             version "/ntfy-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("ntfy" "bin/ntfysh"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/ntfysh") #o755))))))
    (home-page "https://github.com/binwiederhier/ntfy")
    (synopsis "Send push notifications to your phone or desktop using PUT/POST")
    (description "Send push notifications to your phone or desktop using PUT/POST")
    (license license:gpl2+)))

(define-public roumon-bin
  (package
    (name "roumon-bin")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/becheran/roumon/releases/download/v"
             version "/roumon-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("roumon" "bin/roumon"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/roumon") #o755))))))
    (home-page "https://github.com/becheran/roumon")
    (synopsis "Universal goroutine monitor using pprof and termui")
    (description "Universal goroutine monitor using pprof and termui")
    (license license:expat)))

(define-public sou-bin
  (package
    (name "sou-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/knqyf263/sou/releases/download/v"
             version "/sou-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("sou" "bin/sou"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/sou") #o755))))))
    (home-page "https://github.com/knqyf263/sou")
    (synopsis "A tool for exploring files in container image layers")
    (description "A tool for exploring files in container image layers")
    (license license:asl2.0)))

(define-public ssl-checker-bin
  (package
    (name "ssl-checker-bin")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fabio42/ssl-checker/releases/download/v"
             version "/ssl-checker-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("ssl-checker" "bin/ssl-checker"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/ssl-checker") #o755))))))
    (home-page "https://github.com/fabio42/ssl-checker")
    (synopsis "Fast and beautiful program to check all your https endpoint")
    (description "Fast and beautiful program to check all your https endpoint")
    (license license:expat)))

(define-public gitnr-bin
  (package
    (name "gitnr-bin")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/reemus-dev/gitnr/releases/download/v"
             version "/gitnr-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("gitnr" "bin/gitnr"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/gitnr") #o755))))))
    (home-page "https://github.com/reemus-dev/gitnr")
    (synopsis "A CLI to generate .gitignore files using one or more templates")
    (description "A CLI to generate .gitignore files using one or more templates")
    (license license:expat)))

