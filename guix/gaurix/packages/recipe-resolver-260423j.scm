;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423j
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;        1.  wine-stable-mono (gnu-build-system, v9.4.0, GPL)
;;;        2.  spicetify-cli-git (go-build-system, v2.16.1.r1.gd5cc68f, LGPL2.1)
;;;        3.  catppuccin-mocha-grub-theme-git (gnu-build-system, vr29.b2919a9, MIT)
;;;        4.  catppuccin-qt5ct-git (gnu-build-system, vr6.cb58530, MIT)
;;;        5.  whisper.cpp-model-large-v3 (gnu-build-system, v4, MIT)
;;;        6.  hyprls-git (go-build-system, v0.8.0, MIT)
;;;        7.  shiru.lv2-git (gnu-build-system, vr46.08853f9, GPL)
;;;        8.  ttf-chocolate-classical-sans (font-build-system, v1.001, OFL-1.1)
;;;        9.  nordic-darker-standard-buttons-theme-git (gnu-build-system, vr213+5f93cb3, GPL)
;;;       10.  lolcat++-bin (copy-build-system, v2.5.0, BSD-3-Clause)
;;;       11.  stdexec-git (cmake-build-system, vgtc.2026.r5.gb6f8a0e, Apache-2.0)
;;;       12.  zen-browser-sponsorblock (node-build-system, v6.1.5, GPL-3.0-only)
;;;       13.  librewolf-extension-sponsorblock (node-build-system, v6.1.5, GPL-3.0-only)
;;;       14.  firefox-extension-sponsorblock (node-build-system, v6.1.5, GPL-3.0-only)
;;;       15.  argon-rbx (gnu-build-system, v2.0.25, Apache-2.0)
;;;       16.  urweb-git (gnu-build-system, v20240308.55a881ff, BSD-3-Clause)
;;;       17.  pyboinc-git (pyproject-build-system, v0.0.3, MIT)
;;;       18.  flandre-grub-theme-git (gnu-build-system, vr4.39394ec, MIT)
;;;       19.  phc-intel-dkms-stable (gnu-build-system, v0.3.2.rev44, GPL2)
;;;       20.  openssl-1.0 (gnu-build-system, v1.0.2.u, openssl)
;;;       21.  mp3tag (gnu-build-system, v3.34, custom)
;;;       22.  cachyos-ananicy-rules-git (gnu-build-system, v20260326.r1990.g40e7b0d, GPL-3.0-only)
;;;       23.  nodejs-http-server (node-build-system, v14.1.1, MIT)
;;;       24.  libvpx1.3 (gnu-build-system, v1.3.0, BSD)
;;;       25.  kubectl-cnpg (gnu-build-system, v1.28.1, Apache 2.0)
;;;       26.  makepkg-meta (gnu-build-system, vr18.97242c5, MIT)
;;;       27.  looking-glass-rc-module-dkms (cmake-build-system, vB7, GPL-2.0-or-later)
;;;       28.  pipes.c (gnu-build-system, v1.2.1, GPL3)
;;;       29.  networkd-broker (cargo-build-system, v1.1.1, GPL-3.0-or-later)
;;;       30.  piper-voices-en-gb (gnu-build-system, v1.0.0, MIT)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages ncurses)
  #:export (
            wine-stable-mono
            spicetify-cli-git
            catppuccin-mocha-grub-theme-git
            catppuccin-qt5ct-git
            whisper-cpp-model-large-v3
            hyprls-git
            shiru-lv2-git
            ttf-chocolate-classical-sans
            nordic-darker-standard-buttons-theme-git
            lolcat++-bin
            stdexec-git
            zen-browser-sponsorblock
            librewolf-extension-sponsorblock
            firefox-extension-sponsorblock
            argon-rbx
            urweb-git
            pyboinc-git
            flandre-grub-theme-git
            phc-intel-dkms-stable
            openssl-1-0
            mp3tag
            cachyos-ananicy-rules-git
            nodejs-http-server
            libvpx1-3
            kubectl-cnpg
            makepkg-meta
            looking-glass-rc-module-dkms
            pipes-c
            networkd-broker
            piper-voices-en-gb
            ))

;;; -------------------------------------------------------------------
;;; 1. wine-stable-mono --- wine’s built-in replacement for Microsoft’s .NET Framework (for wine-stable)
;;; -------------------------------------------------------------------
(define-public wine-stable-mono
  (package
    (name "wine-stable-mono")
    (version "9.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wiki.winehq.org/Mono/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wine’s built-in replacement for Microsoft’s .NET Framework (for wine-stable)")
    (description "Wine’s built-in replacement for Microsoft’s .NET Framework (for wine-stable).")
    (home-page "https://wiki.winehq.org/Mono")
    (license (list license:gpl3+ license:lgpl2.1 license:mpl2.0))))

;;; -------------------------------------------------------------------
;;; 2. spicetify-cli-git --- command-line tool to customize Spotify client - Git master branch
;;; -------------------------------------------------------------------
(define-public spicetify-cli-git
  (package
    (name "spicetify-cli-git")
    (version "2.16.1.r1.gd5cc68f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/spicetify/spicetify-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/spicetify/spicetify-cli"
      #:tests? #f))
    (synopsis "command-line tool to customize Spotify client - Git master branch")
    (description "Command-line tool to customize Spotify client - Git master branch.")
    (home-page "https://github.com/spicetify/spicetify-cli")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 3. catppuccin-mocha-grub-theme-git --- soothing pastel theme for GRUB2 -- Mocha colorscheme
;;; -------------------------------------------------------------------
(define-public catppuccin-mocha-grub-theme-git
  (package
    (name "catppuccin-mocha-grub-theme-git")
    (version "r29.b2919a9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/catppuccin/grub")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "soothing pastel theme for GRUB2 -- Mocha colorscheme")
    (description "Soothing pastel theme for GRUB2 -- Mocha colorscheme.")
    (home-page "https://github.com/catppuccin/grub")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. catppuccin-qt5ct-git --- soothing pastel theme for qt5ct & qt6ct
;;; -------------------------------------------------------------------
(define-public catppuccin-qt5ct-git
  (package
    (name "catppuccin-qt5ct-git")
    (version "r6.cb58530")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/catppuccin/qt5ct")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "soothing pastel theme for qt5ct & qt6ct")
    (description "Soothing pastel theme for qt5ct & qt6ct.")
    (home-page "https://github.com/catppuccin/qt5ct")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. whisper.cpp-model-large-v3 --- this is an autogenerated file, please see https://github.com/hrehfeld/arc...
;;; -------------------------------------------------------------------
(define-public whisper-cpp-model-large-v3
  (package
    (name "whisper-cpp-model-large-v3")
    (version "4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ggerganov/whisper.cpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/arc...")
    (description "This is an autogenerated file, please see https://github.com/hrehfeld/archlinux-whisper.cpp-model.")
    (home-page "https://github.com/ggerganov/whisper.cpp")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. hyprls-git --- a LSP server for Hyprland config files
;;; -------------------------------------------------------------------
(define-public hyprls-git
  (package
    (name "hyprls-git")
    (version "0.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprland-community/hyprls")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/hyprland-community/hyprls"
      #:tests? #f))
    (synopsis "a LSP server for Hyprland config files")
    (description "A LSP server for Hyprland config files.")
    (home-page "https://github.com/hyprland-community/hyprls")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. shiru.lv2-git --- a set of music plugins created by Shiru, unofficial DPF ports
;;; -------------------------------------------------------------------
(define-public shiru-lv2-git
  (package
    (name "shiru-lv2-git")
    (version "r46.08853f9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linuxmao-org/shiru-plugins")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a set of music plugins created by Shiru, unofficial DPF ports")
    (description "A set of music plugins created by Shiru, unofficial DPF ports.")
    (home-page "https://github.com/linuxmao-org/shiru-plugins")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. ttf-chocolate-classical-sans --- a traditional Chinese font based on Source Han Sans, featuring inherited ...
;;; -------------------------------------------------------------------
(define-public ttf-chocolate-classical-sans
  (package
    (name "ttf-chocolate-classical-sans")
    (version "1.001")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MoonlitOwen/ChocolateSans")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a traditional Chinese font based on Source Han Sans, featuring inherited ...")
    (description "A traditional Chinese font based on Source Han Sans, featuring inherited glyph forms.")
    (home-page "https://github.com/MoonlitOwen/ChocolateSans")
    (license (license:non-copyleft "custom"))))

;;; -------------------------------------------------------------------
;;; 9. nordic-darker-standard-buttons-theme-git --- nordic darker-standard-buttons theme (git checkout)
;;; -------------------------------------------------------------------
(define-public nordic-darker-standard-buttons-theme-git
  (package
    (name "nordic-darker-standard-buttons-theme-git")
    (version "r213+5f93cb3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EliverLara/Nordic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nordic darker-standard-buttons theme (git checkout)")
    (description "Nordic darker-standard-buttons theme (git checkout).")
    (home-page "https://github.com/EliverLara/Nordic")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 10. lolcat++-bin --- a lolcat reimplementation in C++ -- BLAZINGLY FAST
;;; -------------------------------------------------------------------
(define-public lolcat++-bin
  (package
    (name "lolcat++-bin")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/lolcatpp/lolcatpp/releases/download/v" version "/lolcat++-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lolcat++-bin" "bin/lolcat++-bin"))))
    (synopsis "a lolcat reimplementation in C++ -- BLAZINGLY FAST")
    (description "A lolcat reimplementation in C++ -- BLAZINGLY FAST.")
    (home-page "https://github.com/lolcatpp/lolcatpp")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 11. stdexec-git --- senders - A Standard Model for Asynchronous Execution in C++
;;; -------------------------------------------------------------------
(define-public stdexec-git
  (package
    (name "stdexec-git")
    (version "gtc.2026.r5.gb6f8a0e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NVIDIA/stdexec")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "senders - A Standard Model for Asynchronous Execution in C++")
    (description "Senders - A Standard Model for Asynchronous Execution in C++.")
    (home-page "https://github.com/NVIDIA/stdexec")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 12. zen-browser-sponsorblock --- skip YouTube video sponsors
;;; -------------------------------------------------------------------
(define-public zen-browser-sponsorblock
  (package
    (name "zen-browser-sponsorblock")
    (version "6.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ajayyy/SponsorBlock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "skip YouTube video sponsors")
    (description "Skip YouTube video sponsors.")
    (home-page "https://github.com/ajayyy/SponsorBlock")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 13. librewolf-extension-sponsorblock --- skip YouTube video sponsors
;;; -------------------------------------------------------------------
(define-public librewolf-extension-sponsorblock
  (package
    (name "librewolf-extension-sponsorblock")
    (version "6.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ajayyy/SponsorBlock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "skip YouTube video sponsors")
    (description "Skip YouTube video sponsors.")
    (home-page "https://github.com/ajayyy/SponsorBlock")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. firefox-extension-sponsorblock --- skip YouTube video sponsors
;;; -------------------------------------------------------------------
(define-public firefox-extension-sponsorblock
  (package
    (name "firefox-extension-sponsorblock")
    (version "6.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ajayyy/SponsorBlock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "skip YouTube video sponsors")
    (description "Skip YouTube video sponsors.")
    (home-page "https://github.com/ajayyy/SponsorBlock")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 15. argon-rbx --- full featured tool for Roblox development
;;; -------------------------------------------------------------------
(define-public argon-rbx
  (package
    (name "argon-rbx")
    (version "2.0.25")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/argon-rbx/argon")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "full featured tool for Roblox development")
    (description "Full featured tool for Roblox development.")
    (home-page "https://github.com/argon-rbx/argon")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 16. urweb-git --- full stack web framework based on a functional programming language
;;; -------------------------------------------------------------------
(define-public urweb-git
  (package
    (name "urweb-git")
    (version "20240308.55a881ff")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://www.impredicative.com/ur/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "full stack web framework based on a functional programming language")
    (description "Full stack web framework based on a functional programming language.")
    (home-page "http://www.impredicative.com/ur/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 17. pyboinc-git --- pyBOINC - a very basic python BOINC bridge
;;; -------------------------------------------------------------------
(define-public pyboinc-git
  (package
    (name "pyboinc-git")
    (version "0.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nielstron/pyboinc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "pyBOINC - a very basic python BOINC bridge")
    (description "PyBOINC - a very basic python BOINC bridge.")
    (home-page "https://github.com/nielstron/pyboinc")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. flandre-grub-theme-git --- flandre scarlet GRUB2 theme
;;; -------------------------------------------------------------------
(define-public flandre-grub-theme-git
  (package
    (name "flandre-grub-theme-git")
    (version "r4.39394ec")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.jamjar.ws/strat/flandre_grub")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flandre scarlet GRUB2 theme")
    (description "Flandre scarlet GRUB2 theme.")
    (home-page "https://git.jamjar.ws/strat/flandre_grub")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. phc-intel-dkms-stable --- frequency driver for Intel CPUs with undervolting feature. DKMS-based ker...
;;; -------------------------------------------------------------------
(define-public phc-intel-dkms-stable
  (package
    (name "phc-intel-dkms-stable")
    (version "0.3.2.rev44")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/linux-phc/phc-intel/-/archive/v" version "/phc-intel-dkms-stable-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "frequency driver for Intel CPUs with undervolting feature. DKMS-based ker...")
    (description "Frequency driver for Intel CPUs with undervolting feature. DKMS-based kernel module, stable branch.")
    (home-page "https://gitlab.com/linux-phc/phc-intel")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 20. openssl-1.0 --- the Open Source toolkit for Secure Sockets Layer and Transport Layer Secu...
;;; -------------------------------------------------------------------
(define-public openssl-1-0
  (package
    (name "openssl-1-0")
    (version "1.0.2.u")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.openssl.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list glibc))
    (synopsis "the Open Source toolkit for Secure Sockets Layer and Transport Layer Secu...")
    (description "The Open Source toolkit for Secure Sockets Layer and Transport Layer Security.")
    (home-page "https://www.openssl.org")
    (license (license:non-copyleft "custom"))))

;;; -------------------------------------------------------------------
;;; 21. mp3tag --- the universal tag editor
;;; -------------------------------------------------------------------
(define-public mp3tag
  (package
    (name "mp3tag")
    (version "3.34")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.mp3tag.de/en//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the universal tag editor")
    (description "The universal tag editor.")
    (home-page "https://www.mp3tag.de/en/")
    (license (license:non-copyleft "custom"))))

;;; -------------------------------------------------------------------
;;; 22. cachyos-ananicy-rules-git --- cachyOS - ananicy-rules
;;; -------------------------------------------------------------------
(define-public cachyos-ananicy-rules-git
  (package
    (name "cachyos-ananicy-rules-git")
    (version "20260326.r1990.g40e7b0d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CachyOS/ananicy-rules")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cachyOS - ananicy-rules")
    (description "CachyOS - ananicy-rules.")
    (home-page "https://github.com/CachyOS/ananicy-rules")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 23. nodejs-http-server --- a simple zero-configuration command-line http server
;;; -------------------------------------------------------------------
(define-public nodejs-http-server
  (package
    (name "nodejs-http-server")
    (version "14.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/http-party/http-server")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple zero-configuration command-line http server")
    (description "A simple zero-configuration command-line http server.")
    (home-page "https://github.com/http-party/http-server")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. libvpx1.3 --- VP8 and VP9 codec
;;; -------------------------------------------------------------------
(define-public libvpx1-3
  (package
    (name "libvpx1-3")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.webmproject.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list glibc))
    (synopsis "VP8 and VP9 codec")
    (description "VP8 and VP9 codec.")
    (home-page "http://www.webmproject.org/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 25. kubectl-cnpg --- a kubectl plugin to interact with CloudNativePG
;;; -------------------------------------------------------------------
(define-public kubectl-cnpg
  (package
    (name "kubectl-cnpg")
    (version "1.28.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cloudnative-pg/cloudnative-pg")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a kubectl plugin to interact with CloudNativePG")
    (description "A kubectl plugin to interact with CloudNativePG.")
    (home-page "https://github.com/cloudnative-pg/cloudnative-pg")
    (license (license:non-copyleft "custom"))))

;;; -------------------------------------------------------------------
;;; 26. makepkg-meta --- easily create and install custom metapackages
;;; -------------------------------------------------------------------
(define-public makepkg-meta
  (package
    (name "makepkg-meta")
    (version "r18.97242c5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/andrewgregory/makepkg-meta")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "easily create and install custom metapackages")
    (description "Easily create and install custom metapackages.")
    (home-page "https://github.com/andrewgregory/makepkg-meta")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 27. looking-glass-rc-module-dkms --- a kernel module that implements a basic interface to the IVSHMEM device f...
;;; -------------------------------------------------------------------
(define-public looking-glass-rc-module-dkms
  (package
    (name "looking-glass-rc-module-dkms")
    (version "B7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://looking-glass.io//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a kernel module that implements a basic interface to the IVSHMEM device f...")
    (description "A kernel module that implements a basic interface to the IVSHMEM device for when using LookingGlass in VM->VM mode.")
    (home-page "https://looking-glass.io/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 28. pipes.c --- small application to mimic the \"pipes\" screensaver in a terminal window
;;; -------------------------------------------------------------------
(define-public pipes-c
  (package
    (name "pipes-c")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pipeseroni/pipes.c")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list ncurses))
    (synopsis "small application to mimic the \"pipes\" screensaver in a terminal window")
    (description "Small application to mimic the \\\"pipes\\\" screensaver in a terminal window.")
    (home-page "https://github.com/pipeseroni/pipes.c")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 29. networkd-broker --- an event broker daemon for systemd-networkd
;;; -------------------------------------------------------------------
(define-public networkd-broker
  (package
    (name "networkd-broker")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bpetlert/networkd-broker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list dbus))
    (synopsis "an event broker daemon for systemd-networkd")
    (description "An event broker daemon for systemd-networkd.")
    (home-page "https://github.com/bpetlert/networkd-broker")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 30. piper-voices-en-gb --- voices for Piper text to speech system (en_GB)
;;; -------------------------------------------------------------------
(define-public piper-voices-en-gb
  (package
    (name "piper-voices-en-gb")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://huggingface.co/rhasspy/piper-voices/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "voices for Piper text to speech system (en_GB)")
    (description "Voices for Piper text to speech system (en_GB).")
    (home-page "https://huggingface.co/rhasspy/piper-voices")
    (license license:expat)))
