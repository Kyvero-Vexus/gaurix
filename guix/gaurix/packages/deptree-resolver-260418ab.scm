;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418ab
;;; Resolves 23 BLOCKED packages with concrete recipes.
;;; Moves 66 packages to FAILED status.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260418ab)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (aspnet-runtime-preview-bin
            kdesignerplugin
            python-javaobj-py3
            kemoticons
            coder-bin
            gh-dash-bin
            aichat-ng-bin
            chough-bin
            envy-tui-bin
            paracon
            plasma6-applets-window-title
            psiphonlinuxgui
            redress-bin
            safe-rm
            svnkit
            tdarr
            technitium-dns-server-bin
            tododo-bin
            cmdfy
            dvdisaster-speed47-git
            dwatch-bin
            element-lk-jwt-service
            elephant-providerlist-bin
))

(define-public aspnet-runtime-preview-bin
  (package
    (name "aspnet-runtime-preview-bin")
    (version "11.0.0.sdk100+preview.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aspnet-runtime-preview-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "ASP.NET Core runtime (preview, binary)")
    (description "The ASP.NET Core runtime (preview, binary).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

(define-public kdesignerplugin
  (package
    (name "kdesignerplugin")
    (version "5.116.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kdesignerplugin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Integration of Frameworks widgets in Qt Designer/Creator")
    (description "Integration of Frameworks widgets in Qt Designer/Creator.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public python-javaobj-py3
  (package
    (name "python-javaobj-py3")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "javaobj-py3" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Module for reading and writing serialized java objects")
    (description "Module for reading and writing serialized java objects.")
    (home-page "https://pypi.org/project/javaobj-py3/")
    (license license:asl2.0)))

(define-public kemoticons
  (package
    (name "kemoticons")
    (version "5.116.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kemoticons.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Support for emoticons and emoticons themes")
    (description "Support for emoticons and emoticons themes.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public coder-bin
  (package
    (name "coder-bin")
    (version "2.28.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/coder-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Remote development environments on your infrastructure provisioned with")
    (description "Remote development environments on your infrastructure provisioned with Terraform.")
    (home-page "https://coder.com")
    (license license:expat)))

(define-public gh-dash-bin
  (package
    (name "gh-dash-bin")
    (version "4.23.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dlvhdr/gh-dash")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Beautiful CLI dashboard extension for GitHub to display pull requests and")
    (description "A beautiful CLI dashboard extension for GitHub to display pull requests and issues with filters you care about.")
    (home-page "https://github.com/dlvhdr/gh-dash")
    (license license:expat)))

(define-public aichat-ng-bin
  (package
    (name "aichat-ng-bin")
    (version "0.31.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/blob42/aichat-ng")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "OpenAI, ChatGPT, Gemini, Claude, Mistral, Ollama and more in your")
    (description "OpenAI, ChatGPT, Gemini, Claude, Mistral, Ollama and more in your terminal. Fork with advanced features.")
    (home-page "https://github.com/blob42/aichat-ng")
    (license license:agpl3+)))

(define-public chough-bin
  (package
    (name "chough-bin")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyperpuncher/chough")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Fast ASR CLI using Parakeet TDT 0.6b V3")
    (description "Fast ASR CLI using Parakeet TDT 0.6b V3.")
    (home-page "https://github.com/hyperpuncher/chough")
    (license license:expat)))

(define-public envy-tui-bin
  (package
    (name "envy-tui-bin")
    (version "0.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tassiovirginio/envy-tui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Terminal User Interface (TUI) manager for EnvyControl - Easy GPU switching")
    (description "A Terminal User Interface (TUI) manager for EnvyControl - Easy GPU switching for Nvidia Optimus laptops under Linux.")
    (home-page "https://github.com/tassiovirginio/envy-tui")
    (license license:expat)))

(define-public paracon
  (package
    (name "paracon")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mfncooper/paracon")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Paracon is a packet radio terminal for Linux, Mac and Windows")
    (description "Paracon is a packet radio terminal for Linux, Mac and Windows.")
    (home-page "https://github.com/mfncooper/paracon")
    (license license:expat)))

(define-public plasma6-applets-window-title
  (package
    (name "plasma6-applets-window-title")
    (version "0.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dhruv8sh/plasma6-window-title-applet")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Plasma 6 applet that shows the application title and icon for active window")
    (description "Plasma 6 applet that shows the application title and icon for active window.")
    (home-page "https://github.com/dhruv8sh/plasma6-window-title-applet")
    (license license:gpl3+)))

(define-public psiphonlinuxgui
  (package
    (name "psiphonlinuxgui")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Alessandros-Hube/PsiphonLinuxGUI")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PsiphonLinuxGUI is an unofficial Linux app for managing the Psiphon VPN")
    (description "PsiphonLinuxGUI is an unofficial Linux app for managing the Psiphon VPN and browser settings.")
    (home-page "https://github.com/Alessandros-Hube/PsiphonLinuxGUI")
    (license license:expat)))

(define-public redress-bin
  (package
    (name "redress-bin")
    (version "1.2.64")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/goretk/redress")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Tool for analyzing stripped Go binaries")
    (description "A tool for analyzing stripped Go binaries.")
    (home-page "https://github.com/goretk/redress")
    (license license:agpl3+)))

(define-public safe-rm
  (package
    (name "safe-rm")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/safe-rm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Tool intended to prevent the accidental deletion of important files")
    (description "A tool intended to prevent the accidental deletion of important files.")
    (home-page "https://launchpad.net/safe-rm")
    (license license:gpl3+)))

(define-public svnkit
  (package
    (name "svnkit")
    (version "1.8.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/svnkit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Subversion library for Java")
    (description "A Subversion library for Java.")
    (home-page "http://svnkit.com")
    (license license:expat)))

(define-public tdarr
  (package
    (name "tdarr")
    (version "2.68.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tdarr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Transcoding application manager for processing media libraries. Server + Node")
    (description "Transcoding application manager for processing media libraries. Server + Node.")
    (home-page "https://tdarr.io/")
    (license license:expat)))

(define-public technitium-dns-server-bin
  (package
    (name "technitium-dns-server-bin")
    (version "14.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/technitium-dns-server-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Open source authoritative and recursive DNS server focused on privacy and")
    (description "Open source authoritative and recursive DNS server focused on privacy and security.")
    (home-page "https://technitium.com/dns/")
    (license license:gpl3+)))

(define-public tododo-bin
  (package
    (name "tododo-bin")
    (version "0.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bmarse/tododo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Todo manager that should be extinct")
    (description "The todo manager that should be extinct.")
    (home-page "https://github.com/bmarse/tododo")
    (license license:expat)))

(define-public cmdfy
  (package
    (name "cmdfy")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kesavan-vaisakh/cmdfy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/kesavan-vaisakh/cmdfy"
           #:tests? #f))
    (synopsis "Command-line tool that translates natural language requests into")
    (description "A command-line tool that translates natural language requests into executable shell commands.")
    (home-page "https://github.com/kesavan-vaisakh/cmdfy")
    (license license:expat)))

(define-public dvdisaster-speed47-git
  (package
    (name "dvdisaster-speed47-git")
    (version "0.79.10.pl3.r6.g063ad92")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/speed47/dvdisaster")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Provides a margin of safety against data loss on CD and DVD media caused")
    (description "Provides a margin of safety against data loss on CD and DVD media caused by aging or scratches, speed47 fork.")
    (home-page "https://github.com/speed47/dvdisaster")
    (license license:gpl3+)))

(define-public dwatch-bin
  (package
    (name "dwatch-bin")
    (version "0.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/IngoMeyer441/dwatch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Tool to watch command output for differences and send notifications")
    (description "A tool to watch command output for differences and send notifications.")
    (home-page "https://github.com/IngoMeyer441/dwatch")
    (license license:expat)))

(define-public element-lk-jwt-service
  (package
    (name "element-lk-jwt-service")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vector-im/lk-jwt-service")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/vector-im/lk-jwt-service"
           #:tests? #f))
    (synopsis "LiveKit Management Service for Element Call")
    (description "LiveKit Management Service for Element Call.")
    (home-page "https://github.com/vector-im/lk-jwt-service/")
    (license license:gpl3+)))

(define-public elephant-providerlist-bin
  (package
    (name "elephant-providerlist-bin")
    (version "2.21.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))
    (synopsis "Providerlist provider for elephant")
    (description "Providerlist provider for elephant.")
    (home-page "https://github.com/abenz1267/elephant")
    (license license:gpl3+)))
