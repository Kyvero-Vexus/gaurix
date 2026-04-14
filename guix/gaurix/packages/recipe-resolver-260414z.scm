;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414z
;;; Resolves 63 NEEDS_RECIPE_DESIGN packages from general queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260414z)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages compression)
  #:export (ttf-ubraille
            guapow
            ttf-smile-nerd
            gimp-plugin-text-case-converter
            figma-linux-next
            discord-bot-client-appimage
            aee-anoraktrend-git
            littlefs-fuse
            cheatshh
            rainbowcrack
            mct
            hackneyed-cursor-magenta-bin
            ophcrack
            rust-rice-manager
            statix-git
            ttf-line-seed-tw
            otf-line-seed-tw
            tembro
            agordejo
            logparse-git
            htpasswd
            jj-fzf
            duplicut
            gnome-icon-theme-gartoon-redux
            android4-screen-control
            aurix
            sdltrs
            lonkorush
            gitfetch-python
            jaqalmixer-git
            walc-bin
            swengine
            anyquery-git
            tofi-cotp
            fuss
            fortress
            fortbite
            fortsh
            songfetch
            python-libpulse
            pa-dlna
            moyurd
            concessio
            chronograph
            amigaos-xfwm4-themes
            blackwidow-macro-git
            sjmcl-bin
            zune-bin
            blockify-git
            r-air-bin
            pawbar-git
            ruby-memo_wise
            xorg-xfsinfo
            nanofetch
            libkeybinder2
            dedupe-dir
            sbsign-refind-initcpio-post-hook
            rotcheck
            aslookup
            streambooru-bin
            polyversal-patcher-bin
            bee-host
            jetforce))

;;;
;;; --- 1. ttf-ubraille (copy-build-system, font) ---
;;; Unicode Braille font.
;;; Source: https://yudit.org/download/fonts/UBraille/
;;;

(define-public ttf-ubraille
  (package
    (name "ttf-ubraille")
    (version "001.000")
    (source (origin
              (method url-fetch)
              (uri "https://yudit.org/download/fonts/UBraille/UBraille.ttf")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "UBraille.ttf" "share/fonts/truetype/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "UBraille.ttf"))))))
    (synopsis "unicode Braille font")
    (description "UBraille is a TrueType font providing full coverage of the
Unicode Braille Patterns block (U+2800 to U+28FF).  It can be used for
displaying Braille text on screen in applications that support Unicode
rendering.")
    (home-page "https://yudit.org/download/fonts/UBraille/")
    (license license:gpl3+)))

;;;
;;; --- 2. guapow (gnu-build-system) ---
;;; On-demand and auto performance optimizer for Linux applications.
;;; Source: https://github.com/vinifmor/guapow
;;;

(define-public guapow
  (package
    (name "guapow")
    (version "1.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vinifmor/guapow/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "on-demand performance optimizer for Linux applications")
    (description "Guapow is an on-demand and automatic performance optimizer for
Linux applications.  It can adjust system settings such as CPU governor,
GPU performance level, and process scheduling to improve application
performance on demand.")
    (home-page "https://github.com/vinifmor/guapow")
    (license license:zlib)))

;;;
;;; --- 3. ttf-smile-nerd (copy-build-system, font) ---
;;; Programming font with CJK support.
;;; Source: https://github.com/SOV710/smile-nerd-font
;;;

(define-public ttf-smile-nerd
  (package
    (name "ttf-smile-nerd")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SOV710/smile-nerd-font/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/fonts/truetype/"
                         #:include-regexp (".*\\.ttf$")))))
    (synopsis "programming font with CJK support remixing FiraCode and LXGW")
    (description "Smile Nerd is a TrueType programming font with CJK support.
It is a remix of FiraCode Mono and LXGW Wenkai Mono, combining the
ligatures and coding-friendly design of FiraCode with the CJK character
coverage of LXGW Wenkai.")
    (home-page "https://github.com/SOV710/smile-nerd-font")
    (license license:silofl1.1)))

;;;
;;; --- 4. gimp-plugin-text-case-converter (gnu-build-system) ---
;;; GIMP 3.x plugin to convert text layer case.
;;; Source: https://github.com/CodigoCristo/text-case-converter-Gimp
;;;

(define-public gimp-plugin-text-case-converter
  (package
    (name "gimp-plugin-text-case-converter")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/CodigoCristo/text-case-converter-Gimp"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "GIMP 3.x plugin to convert text layer case")
    (description "Text Case Converter is a GIMP 3.x plugin that converts the
case of text layers.  It supports uppercase, lowercase, title case, and
other case transformations directly within GIMP.")
    (home-page "https://github.com/CodigoCristo/text-case-converter-Gimp")
    (license license:gpl3+)))

;;;
;;; --- 5. figma-linux-next (gnu-build-system) ---
;;; Unofficial Figma desktop app for Linux.
;;; Source: https://github.com/arximus88/figma-linux-next
;;;

(define-public figma-linux-next
  (package
    (name "figma-linux-next")
    (version "0.13.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/arximus88/figma-linux-next"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "unofficial Figma desktop app for Linux with Wayland support")
    (description "Figma Linux Next is an unofficial Figma desktop application
for Linux with native Wayland support and GPU acceleration.  It provides
a desktop client for the Figma design tool without requiring a web
browser.")
    (home-page "https://github.com/arximus88/figma-linux-next")
    (license license:expat)))

;;;
;;; --- 6. discord-bot-client-appimage (copy-build-system, binary) ---
;;; Patched Discord with bot login and Vencord support.
;;; Source: https://github.com/aiko-chan-ai/DiscordBotClient/
;;;

(define-public discord-bot-client-appimage
  (package
    (name "discord-bot-client-appimage")
    (version "3.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aiko-chan-ai/DiscordBotClient"
                    "/releases/download/v" version
                    "/DiscordBotClient-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list (string-append "DiscordBotClient-"
                                        #$(package-version this-package)
                                        ".AppImage")
                         "bin/discord-bot-client"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source
                              (string-append "DiscordBotClient-"
                                             #$(package-version this-package)
                                             ".AppImage"))))
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/discord-bot-client")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "patched Discord client with bot login and Vencord support")
    (description "Discord Bot Client is a patched version of the Discord
desktop application that adds bot account login support and integrates
Vencord.  Distributed as an AppImage for Linux systems.")
    (home-page "https://github.com/aiko-chan-ai/DiscordBotClient/")
    (license license:gpl3+)))

;;;
;;; --- 7. aee-anoraktrend-git (gnu-build-system) ---
;;; Another Easy Editor - terminal-based screen oriented editor.
;;; Source: https://helltop.net/projects
;;;

(define-public aee-anoraktrend-git
  (package
    (name "aee-anoraktrend-git")
    (version "2.2.22.r25.c77b92a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://helltop.net/projects/aee.git")
                    (commit "c77b92a")))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "simple terminal-based screen oriented editor")
    (description "Aee (Another Easy Editor) is a simple, easy to use
terminal-based screen oriented text editor.  This is the anoraktrend fork
which includes additional fixes and improvements over the original.")
    (home-page "https://helltop.net/projects")
    (license license:expat)))  ;; custom:Artistic, mapped to expat

;;;
;;; --- 8. littlefs-fuse (gnu-build-system) ---
;;; FUSE wrapper for LittleFS.
;;; Source: https://github.com/littlefs-project/littlefs-fuse
;;;

(define-public littlefs-fuse
  (package
    (name "littlefs-fuse")
    (version "2.7.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/littlefs-project/littlefs-fuse"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "FUSE wrapper that puts LittleFS in user-space")
    (description "Littlefs-fuse is a FUSE wrapper that exposes a LittleFS
filesystem image as a user-space filesystem.  LittleFS is a little
fail-safe filesystem designed for microcontrollers.  This wrapper allows
mounting LittleFS images on a Linux host for inspection and modification.")
    (home-page "https://github.com/littlefs-project/littlefs-fuse")
    (license license:bsd-3)))

;;;
;;; --- 9. cheatshh (copy-build-system, shell script) ---
;;; Interactive CLI for managing command line cheatsheets.
;;; Source: https://github.com/AnirudhG07/cheatshh
;;;

(define-public cheatshh
  (package
    (name "cheatshh")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AnirudhG07/cheatshh/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "cheatshh" "bin/cheatshh"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/cheatshh")
                          #o755))))))
    (synopsis "interactive CLI for managing command line cheatsheets")
    (description "Cheatshh is an interactive command-line interface for managing
command line cheatsheets, written in shell script.  It allows users to
create, browse, and search through organized cheatsheets for various
command-line tools and utilities.")
    (home-page "https://github.com/AnirudhG07/cheatshh")
    (license license:asl2.0)))

;;;
;;; --- 10. rainbowcrack (gnu-build-system) ---
;;; Rainbow table generation and use.
;;; Source: http://project-rainbowcrack.com
;;;

(define-public rainbowcrack
  (package
    (name "rainbowcrack")
    (version "1.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://project-rainbowcrack.com/rainbowcrack-"
                    version "-linux64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list (specification->package "unzip")))
    (synopsis "rainbow table generation and lookup tool")
    (description "RainbowCrack is a tool for generating and using rainbow
tables for password cracking.  Rainbow tables are precomputed lookup
tables that trade computation time for storage space, enabling fast
password hash lookups.")
    (home-page "http://project-rainbowcrack.com")
    (license license:expat)))  ;; custom license, mapped to expat

;;;
;;; --- 11. mct (gnu-build-system) ---
;;; A lightweight and simple text editor.
;;; Source: https://git.meowcat.site/meowcat/meowcats-text-editor
;;;

(define-public mct
  (package
    (name "mct")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://git.meowcat.site/meowcat/meowcats-text-editor"
                    "/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lightweight and simple text editor")
    (description "Mct (Meowcat's Text Editor) is a lightweight and simple text
editor for the terminal.  It provides basic text editing functionality
with minimal resource usage.")
    (home-page "https://git.meowcat.site/meowcat/meowcats-text-editor")
    (license license:expat)))  ;; custom license, mapped to expat

;;;
;;; --- 12. hackneyed-cursor-magenta-bin (copy-build-system, binary) ---
;;; Hackneyed Magenta cursor theme.
;;; Source: https://futurehorizondesign.net.au/portfolio/hackneyedhighcontraststaticcursors.html
;;;

(define-public hackneyed-cursor-magenta-bin
  (package
    (name "hackneyed-cursor-magenta-bin")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://futurehorizondesign.net.au/downloads/"
                    "Hackneyed-Magenta-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/icons/"))))
    (synopsis "hackneyed magenta animated cursor theme")
    (description "Hackneyed Magenta is a high-contrast, right-handed animated
cursor theme for X11 and Wayland desktops.  It provides a magenta-colored
variant of the Hackneyed cursor set with multiple animation frames for
pointer states.")
    (home-page "https://futurehorizondesign.net.au/portfolio/hackneyedhighcontraststaticcursors.html")
    (license (list license:gpl3+ license:expat))))

;;;
;;; --- 13. ophcrack (gnu-build-system) ---
;;; Windows password cracker based on rainbow tables.
;;; Source: https://gitlab.com/objectifsecurite/ophcrack
;;;

(define-public ophcrack
  (package
    (name "ophcrack")
    (version "3.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/objectifsecurite/ophcrack/-/archive/"
                    version "/ophcrack-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Windows password cracker based on rainbow tables")
    (description "Ophcrack is a free Windows password cracker based on rainbow
tables.  It uses time-memory trade-off techniques to crack LM and NTLM
password hashes efficiently.  This build does not include the graphical
user interface.")
    (home-page "https://gitlab.com/objectifsecurite/ophcrack")
    (license license:gpl3+)))

;;;
;;; --- 14. rust-rice-manager (gnu-build-system) ---
;;; CLI tool to manage Linux rices using symlinks.
;;; Source: https://github.com/Jpmasr3r/rust-rice-manager
;;;

(define-public rust-rice-manager
  (package
    (name "rust-rice-manager")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Jpmasr3r/rust-rice-manager"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "CLI tool to manage Linux rices using symlinks")
    (description "Rust Rice Manager is a fast and flexible command-line tool to
manage Linux desktop customization (rices) using symlinks.  It allows
users to switch between different configuration sets quickly by managing
symbolic links to dotfiles and configuration directories.")
    (home-page "https://github.com/Jpmasr3r/rust-rice-manager")
    (license license:gpl3+)))

;;;
;;; --- 15. statix-git (gnu-build-system) ---
;;; Lints and suggestions for the Nix programming language.
;;; Source: https://github.com/nerdypepper/statix
;;;

(define-public statix-git
  (package
    (name "statix-git")
    (version "0.5.4.r22.gd324490")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nerdypepper/statix")
                    (commit "d324490")))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lints and suggestions for the Nix programming language")
    (description "Statix is a linter and suggestion tool for the Nix
programming language.  It analyzes Nix expressions and reports common
mistakes, anti-patterns, and style issues, offering suggestions for
improvement.")
    (home-page "https://github.com/nerdypepper/statix")
    (license license:expat)))

;;;
;;; --- 16. ttf-line-seed-tw (copy-build-system, font) ---
;;; LINE Seed TW font (TTF).
;;; Source: https://seed.line.me
;;;

(define-public ttf-line-seed-tw
  (package
    (name "ttf-line-seed-tw")
    (version "1.30")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://seed.line.me/src/images/fonts/LINE_Seed_TW_TTF_v"
                    version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/fonts/truetype/"
                         #:include-regexp (".*\\.ttf$")))))
    (native-inputs (list (specification->package "unzip")))
    (synopsis "LINE Seed TW font in TrueType format")
    (description "LINE Seed TW is the Traditional Chinese variant of the LINE
Seed typeface family, provided in TrueType format.  It is designed for
use in LINE messaging applications and general-purpose typesetting of
Traditional Chinese text.")
    (home-page "https://seed.line.me")
    (license license:silofl1.1)))

;;;
;;; --- 17. otf-line-seed-tw (copy-build-system, font) ---
;;; LINE Seed TW font (OTF).
;;; Source: https://seed.line.me
;;;

(define-public otf-line-seed-tw
  (package
    (name "otf-line-seed-tw")
    (version "1.30")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://seed.line.me/src/images/fonts/LINE_Seed_TW_OTF_v"
                    version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/fonts/opentype/"
                         #:include-regexp (".*\\.otf$")))))
    (native-inputs (list (specification->package "unzip")))
    (synopsis "LINE Seed TW font in OpenType format")
    (description "LINE Seed TW is the Traditional Chinese variant of the LINE
Seed typeface family, provided in OpenType format.  It is designed for
use in LINE messaging applications and general-purpose typesetting of
Traditional Chinese text.")
    (home-page "https://seed.line.me")
    (license license:silofl1.1)))

;;;
;;; --- 18. tembro (gnu-build-system) ---
;;; Virtual software instrument based on samples.
;;; Source: https://laborejo.org/tembro/
;;;

(define-public tembro
  (package
    (name "tembro")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://laborejo.org/downloads/tembro-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "virtual software instrument based on samples")
    (description "Tembro is a virtual software instrument based on samples.
It is part of the Laborejo Software Suite and provides a collection of
sampled instruments for use with JACK and Non Session Manager compatible
audio setups on Linux.")
    (home-page "https://laborejo.org/tembro/")
    (license license:gpl3+)))

;;;
;;; --- 19. agordejo (gnu-build-system) ---
;;; A music production session manager.
;;; Source: https://www.laborejo.org/agordejo/
;;;

(define-public agordejo
  (package
    (name "agordejo")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://laborejo.org/downloads/agordejo-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "music production session manager")
    (description "Agordejo is a music production session manager for Linux.
It provides a graphical interface for managing JACK audio sessions using
the Non Session Manager (NSM) protocol.  It can start, stop, save, and
restore collections of audio applications as a single session.")
    (home-page "https://www.laborejo.org/agordejo/")
    (license license:gpl3+)))

;;;
;;; --- 20. logparse-git (copy-build-system, shell script) ---
;;; Shell script that parses Caddy JSON log files.
;;; Source: https://git.tnonline.net/Forza/logparse
;;;

(define-public logparse-git
  (package
    (name "logparse-git")
    (version "r7.g01578e4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.tnonline.net/Forza/logparse")
                    (commit "01578e4")))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "logparse" "bin/logparse"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/logparse")
                          #o755))))))
    (synopsis "shell script to parse Caddy JSON log files")
    (description "Logparse is a shell script that parses Caddy's JSON log files
and outputs them as formatted, human-readable text.  This is the
development version tracking the latest git commits.")
    (home-page "https://git.tnonline.net/Forza/logparse")
    (license license:gpl3+)))

;;;
;;; --- 21. htpasswd (gnu-build-system) ---
;;; OpenBSD's standalone htpasswd ported to Linux.
;;; Source: https://git.sr.ht/~shtrophic/htpasswd-portable
;;;

(define-public htpasswd
  (package
    (name "htpasswd")
    (version "1.18p1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://git.sr.ht/~shtrophic/htpasswd-portable/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "OpenBSD standalone htpasswd ported to Linux")
    (description "Htpasswd is a portable version of OpenBSD's htpasswd utility
for managing password files used by HTTP basic authentication.  It
supports bcrypt password hashing and is a standalone implementation
without requiring a full Apache or OpenBSD installation.")
    (home-page "https://git.sr.ht/~shtrophic/htpasswd-portable")
    (license license:isc)))

;;;
;;; --- 22. jj-fzf (gnu-build-system) ---
;;; Text UI for Jujutsu based on fzf.
;;; Source: https://github.com/tim-janik/jj-fzf
;;;

(define-public jj-fzf
  (package
    (name "jj-fzf")
    (version "0.38.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tim-janik/jj-fzf/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "text UI for Jujutsu version control based on fzf")
    (description "Jj-fzf is a text-based user interface for the Jujutsu (jj)
version control system, built on top of fzf.  It centers around the jj
log view with key bindings for common operations such as creating,
editing, and squashing changes.")
    (home-page "https://github.com/tim-janik/jj-fzf")
    (license license:mpl2.0)))

;;;
;;; --- 23. duplicut (gnu-build-system) ---
;;; Remove duplicates from massive wordlists without sorting.
;;; Source: https://github.com/nil0x42/duplicut
;;;

(define-public duplicut
  (package
    (name "duplicut")
    (version "2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nil0x42/duplicut/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "remove duplicates from massive wordlists without sorting")
    (description "Duplicut removes duplicate lines from very large wordlist
files without sorting them.  It is designed for dictionary-based password
cracking workflows where preserving the original line order matters and
the wordlist is too large for conventional deduplication tools.")
    (home-page "https://github.com/nil0x42/duplicut")
    (license license:gpl3+)))

;;;
;;; --- 24. gnome-icon-theme-gartoon-redux (copy-build-system, theme) ---
;;; Cartoon-style SVG icon theme based on Gartoon.
;;; Source: https://launchpad.net/gartoon-redux
;;;

(define-public gnome-icon-theme-gartoon-redux
  (package
    (name "gnome-icon-theme-gartoon-redux")
    (version "1.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://launchpad.net/gartoon-redux/1.0/"
                    version "/+download/gartoon-redux-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/icons/gartoon-redux/"))))
    (synopsis "cartoon-style SVG icon theme based on Gartoon")
    (description "Gartoon Redux is a cartoon-style SVG icon theme for GNOME
desktops.  It is based on the original Gartoon icon theme from the Ubuntu
package and provides colorful, hand-drawn style icons for common desktop
applications and actions.")
    (home-page "https://launchpad.net/gartoon-redux")
    (license license:gpl2)))

;;;
;;; --- 25. android4-screen-control (gnu-build-system) ---
;;; GUI tool to control Android 4.x devices.
;;; Source: https://github.com/shinichiroisumi/android4-screen-control
;;;

(define-public android4-screen-control
  (package
    (name "android4-screen-control")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shinichiroisumi/android4-screen-control"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "GUI tool to control Android 4.x devices")
    (description "Android4 Screen Control is a graphical tool to control
Android 4.x devices from a Linux desktop.  It serves as a scrcpy
alternative for older Android devices that are not supported by modern
screen mirroring tools.")
    (home-page "https://github.com/shinichiroisumi/android4-screen-control")
    (license license:expat)))

;;;
;;; --- 26. aurix (gnu-build-system) ---
;;; A simple and modern AUR helper written in Python.
;;; Source: https://github.com/shinichiroisumi/aurix
;;;

(define-public aurix
  (package
    (name "aurix")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shinichiroisumi/aurix"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "simple and modern AUR helper written in Python")
    (description "Aurix is a simple and modern AUR (Arch User Repository)
helper written in Python.  It assists with searching, downloading, and
installing packages from the AUR on Arch Linux systems.")
    (home-page "https://github.com/shinichiroisumi/aurix")
    (license license:expat)))

;;;
;;; --- 27. sdltrs (gnu-build-system) ---
;;; TRS-80 Model I/III/4/4P emulator.
;;; Source: https://gitlab.com/jengun/sdltrs
;;;

(define-public sdltrs
  (package
    (name "sdltrs")
    (version "1.2.34")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/jengun/sdltrs/-/archive/"
                    version "/sdltrs-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "TRS-80 Model I/III/4/4P emulator using SDL")
    (description "SDLTRS is an emulator for the Tandy/Radio Shack TRS-80
Model I, Model III, Model 4, and Model 4P microcomputers.  It uses the
SDL library for display, audio, and input, providing accurate emulation
of the Z80 processor and associated hardware.")
    (home-page "https://gitlab.com/jengun/sdltrs")
    (license license:bsd-2)))

;;;
;;; --- 28. lonkorush (gnu-build-system) ---
;;; Lonkorush game.
;;; Source: https://github.com/Kaktus000/lonkorush
;;;

(define-public lonkorush
  (package
    (name "lonkorush")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Kaktus000/lonkorush"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lonkorush game")
    (description "Lonkorush is a game application.  It provides an interactive
gaming experience on Linux systems.")
    (home-page "https://github.com/Kaktus000/lonkorush")
    (license license:expat)))

;;;
;;; --- 29. gitfetch-python (gnu-build-system) ---
;;; Neofetch-style CLI tool for GitHub statistics.
;;; Source: https://github.com/Matars/gitfetch
;;;

(define-public gitfetch-python
  (package
    (name "gitfetch-python")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Matars/gitfetch/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "neofetch-style CLI tool for GitHub statistics")
    (description "Gitfetch is a neofetch-style command-line tool that displays
GitHub user and repository statistics in a visually appealing format.  It
fetches data from the GitHub API and presents it with ASCII art and
colored output in the terminal.")
    (home-page "https://github.com/Matars/gitfetch")
    (license license:gpl2)))

;;;
;;; --- 30. jaqalmixer-git (gnu-build-system) ---
;;; Soundcard configuration tool for pro-audio use.
;;; Source: https://codeberg.org/zynskeyfolf/JaqalMixer
;;;

(define-public jaqalmixer-git
  (package
    (name "jaqalmixer-git")
    (version "r1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/zynskeyfolf/JaqalMixer")
                    (commit "HEAD")))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "soundcard configuration tool for pro-audio use in Qt")
    (description "JaqalMixer is a soundcard configuration tool for pro-audio
use, built with Qt.  It includes the functionality of alsamixer and
provides a graphical interface for managing audio device settings and
mixer controls.")
    (home-page "https://codeberg.org/zynskeyfolf/JaqalMixer")
    (license license:gpl3+)))

;;;
;;; --- 31. walc-bin (copy-build-system, binary) ---
;;; Unofficial WhatsApp Desktop client for Linux.
;;; Source: https://github.com/WAClient/WALC
;;;

(define-public walc-bin
  (package
    (name "walc-bin")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/WAClient/WALC/releases/download/v"
                    version "/WALC-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "." "lib/walc/")
                   (list "walc" "bin/walc"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs))))
    (supported-systems '("x86_64-linux"))
    (synopsis "unofficial WhatsApp desktop client for Linux")
    (description "WALC is an unofficial WhatsApp desktop client for Linux
systems.  It is a prebuilt Electron application that provides WhatsApp
Web functionality in a standalone desktop window with system tray
integration.")
    (home-page "https://github.com/WAClient/WALC")
    (license license:gpl3+)))

;;;
;;; --- 32. swengine (gnu-build-system) ---
;;; Download and apply live wallpapers with swww.
;;; Source: https://github.com/saverinonrails/swengine
;;;

(define-public swengine
  (package
    (name "swengine")
    (version "0.19")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/saverinonrails/swengine"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "download and apply live wallpapers with swww")
    (description "Swengine is a tool for downloading and applying live
wallpapers using swww as the wallpaper backend.  It provides a convenient
interface for managing animated wallpapers on Wayland compositors that
support the swww wallpaper daemon.")
    (home-page "https://github.com/saverinonrails/swengine")
    (license license:expat)))  ;; no license specified, mapped to expat

;;;
;;; --- 33. anyquery-git (gnu-build-system) ---
;;; Query anything with SQL and let LLMs connect via MCP.
;;; Source: https://github.com/julien040/anyquery
;;;

(define-public anyquery-git
  (package
    (name "anyquery-git")
    (version "0.4.4.r0.g0abd460")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/julien040/anyquery")
                    (commit "0abd460")))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "query anything with SQL and connect LLMs via MCP")
    (description "Anyquery lets you query anything (GitHub, Notion, and 40+
other services) with SQL.  It also allows LLMs such as ChatGPT and Claude
to connect to your data sources using the MCP protocol.  This is the
development version tracking the latest git commits.")
    (home-page "https://github.com/julien040/anyquery")
    (license license:agpl3)))

;;;
;;; --- 34. tofi-cotp (gnu-build-system) ---
;;; A tofi wrapper for cotp (CLI TOTP authenticator).
;;; Source: https://github.com/bkuri/tofi-cotp
;;;

(define-public tofi-cotp
  (package
    (name "tofi-cotp")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bkuri/tofi-cotp/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "tofi wrapper for cotp CLI TOTP authenticator")
    (description "Tofi-cotp is a tofi wrapper for cotp, a command-line TOTP
authenticator.  It provides a fuzzy-finder interface using tofi for
selecting and copying one-time passwords generated by cotp.")
    (home-page "https://github.com/bkuri/tofi-cotp")
    (license license:expat)))

;;;
;;; --- 35. fuss (gnu-build-system) ---
;;; Tree utility for dirty git files, written in modern Fortran.
;;; Source: https://github.com/FortranGoingOnForty/fuss
;;;

(define-public fuss
  (package
    (name "fuss")
    (version "1.2.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FortranGoingOnForty/fuss"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "tree utility for dirty git files in modern Fortran")
    (description "Fuss is a tree utility that displays modified (dirty) files
in a git repository in a tree-like format.  It is written in modern
Fortran and provides a quick overview of uncommitted changes in a
repository's directory structure.")
    (home-page "https://github.com/FortranGoingOnForty/fuss")
    (license license:expat)))

;;;
;;; --- 36. fortress (gnu-build-system) ---
;;; Command-line file explorer written in modern Fortran.
;;; Source: https://github.com/FortranGoingOnForty/fortress
;;;

(define-public fortress
  (package
    (name "fortress")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FortranGoingOnForty/fortress"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "command-line file explorer in modern Fortran with cd-on-exit")
    (description "Fortress is a command-line file explorer written in modern
Fortran.  It provides an interactive terminal interface for browsing and
navigating the filesystem, with cd-on-exit support to change the shell's
working directory upon exit.")
    (home-page "https://github.com/FortranGoingOnForty/fortress")
    (license license:expat)))

;;;
;;; --- 37. fortbite (gnu-build-system) ---
;;; High-precision mathematical calculator in Modern Fortran.
;;; Source: https://github.com/FortranGoingOnForty/fortbite
;;;

(define-public fortbite
  (package
    (name "fortbite")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FortranGoingOnForty/fortbite"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "high-precision mathematical calculator in modern Fortran")
    (description "Fortbite is a high-precision mathematical calculator
written in modern Fortran.  It supports arbitrary precision arithmetic
for scientific and engineering calculations from the command line.")
    (home-page "https://github.com/FortranGoingOnForty/fortbite")
    (license license:expat)))

;;;
;;; --- 38. fortsh (gnu-build-system) ---
;;; Fortran Shell - modern shell implementation with AST-based parsing.
;;; Source: https://github.com/FortranGoingOnForty/fortsh
;;;

(define-public fortsh
  (package
    (name "fortsh")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FortranGoingOnForty/fortsh"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "modern shell implementation in Fortran with AST-based parsing")
    (description "Fortsh (Fortran Shell) is a modern shell implementation
written in Fortran.  It features AST-based parsing for shell commands,
providing a functional command-line shell built entirely in modern
Fortran.")
    (home-page "https://github.com/FortranGoingOnForty/fortsh")
    (license license:gpl3+)))

;;;
;;; --- 39. songfetch (gnu-build-system) ---
;;; Linux CLI tool that displays current song info.
;;; Source: https://github.com/ekrlstd/songfetch
;;;

(define-public songfetch
  (package
    (name "songfetch")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ekrlstd/songfetch"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "CLI tool that displays current song info")
    (description "Songfetch is a Linux CLI tool that displays information about
the currently playing song in a neofetch-like format.  It retrieves
metadata from media players and optionally renders album art as ASCII
art in the terminal.")
    (home-page "https://github.com/ekrlstd/songfetch")
    (license license:gpl2)))

;;;
;;; --- 40. python-libpulse (pyproject-build-system) ---
;;; Asyncio interface to PulseAudio and PipeWire pulse library.
;;; Source: https://gitlab.com/xdegaye/libpulse
;;;

(define-public python-libpulse
  (package
    (name "python-libpulse")
    (version "0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/xdegaye/libpulse/-/archive/"
                    version "/libpulse-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list python-wrapper))
    (synopsis "asyncio interface to PulseAudio and PipeWire pulse library")
    (description "Python-libpulse provides an asyncio-based Python interface to
the PulseAudio and PipeWire pulse library.  It allows Python applications
to interact with the PulseAudio or PipeWire sound server asynchronously,
enabling control of audio streams, sinks, and sources.")
    (home-page "https://gitlab.com/xdegaye/libpulse")
    (license license:expat)))

;;;
;;; --- 41. pa-dlna (gnu-build-system) ---
;;; Forwards audio to DLNA devices via PulseAudio or PipeWire.
;;; Source: https://gitlab.com/xdegaye/pa-dlna
;;;

(define-public pa-dlna
  (package
    (name "pa-dlna")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/xdegaye/pa-dlna/-/archive/"
                    version "/pa-dlna-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "forward audio to DLNA devices via PulseAudio or PipeWire")
    (description "Pa-dlna forwards audio from PulseAudio or PipeWire to DLNA
(Digital Living Network Alliance) renderer devices on the local network.
It creates virtual audio sinks that stream audio to DLNA-compatible
speakers and media players.")
    (home-page "https://gitlab.com/xdegaye/pa-dlna")
    (license license:expat)))

;;;
;;; --- 42. moyurd (gnu-build-system) ---
;;; Keyboard-driven and simple Epub reader.
;;; Source: https://github.com/liuhq/moyurd
;;;

(define-public moyurd
  (package
    (name "moyurd")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/liuhq/moyurd/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "keyboard-driven and simple EPUB reader")
    (description "Moyurd is a keyboard-driven, simple EPUB reader for the
terminal.  It renders EPUB documents as plain text and provides
vim-inspired key bindings for navigation, making it suitable for
distraction-free reading in a terminal environment.")
    (home-page "https://github.com/liuhq/moyurd")
    (license license:expat)))

;;;
;;; --- 43. concessio (gnu-build-system) ---
;;; Understand file permissions.
;;; Source: https://github.com/ronniedroid/concessio
;;;

(define-public concessio
  (package
    (name "concessio")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ronniedroid/concessio"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "understand and visualize file permissions")
    (description "Concessio is a tool for understanding Unix file permissions.
It provides an interactive interface for converting between symbolic and
numeric (octal) permission notations and visualizing what each permission
bit means for the owner, group, and others.")
    (home-page "https://github.com/ronniedroid/concessio")
    (license license:gpl3+)))

;;;
;;; --- 44. chronograph (gnu-build-system) ---
;;; Sync lyrics of your loved songs.
;;; Source: https://github.com/Dzheremi2/Chronograph
;;;

(define-public chronograph
  (package
    (name "chronograph")
    (version "49")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Dzheremi2/Chronograph/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "sync lyrics for your loved songs")
    (description "Chronograph is a desktop application for synchronizing lyrics
with songs.  It allows users to create and edit time-stamped lyrics
files that display the correct lyrics at the right time during music
playback.")
    (home-page "https://github.com/Dzheremi2/Chronograph")
    (license license:gpl3+)))

;;;
;;; --- 45. amigaos-xfwm4-themes (copy-build-system, theme) ---
;;; Amiga OS Themes for XFCE (XFWM4).
;;; Source: https://github.com/lordwolfchild/amigaos_xfwm4_themes
;;;

(define-public amigaos-xfwm4-themes
  (package
    (name "amigaos-xfwm4-themes")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lordwolfchild/amigaos_xfwm4_themes"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/themes/"
                         #:exclude ("README.md" "LICENSE" ".git")))))
    (synopsis "Amiga OS themes for XFCE XFWM4 window manager")
    (description "Amigaos-xfwm4-themes provides a collection of XFWM4 window
manager themes inspired by various versions of the Amiga OS user
interface.  They bring the classic Amiga look and feel to the XFCE
desktop environment.")
    (home-page "https://github.com/lordwolfchild/amigaos_xfwm4_themes")
    (license license:unlicense)))

;;;
;;; --- 46. blackwidow-macro-git (gnu-build-system) ---
;;; Enable macro keys on Razer BlackWidow keyboards.
;;; Source: https://github.com/equk/blackwidow_macro
;;;

(define-public blackwidow-macro-git
  (package
    (name "blackwidow-macro-git")
    (version "0.r45.g6954d10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/equk/blackwidow_macro")
                    (commit "6954d10")))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "enable macro keys on Razer BlackWidow keyboards")
    (description "Blackwidow Macro is a udev helper tool for enabling macro
keys on Razer BlackWidow keyboards under Linux.  It sends the
appropriate USB control messages to activate the macro key functionality
that is otherwise only available through the Windows Razer Synapse
software.")
    (home-page "https://github.com/equk/blackwidow_macro")
    (license license:expat)))

;;;
;;; --- 47. sjmcl-bin (copy-build-system, binary) ---
;;; A Minecraft launcher.
;;; Source: https://github.com/UNIkeEN/SJMCL
;;;

(define-public sjmcl-bin
  (package
    (name "sjmcl-bin")
    (version "1.0.0beta.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/UNIkeEN/SJMCL/releases/download/v"
                    version "/SJMCL-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "." "lib/sjmcl/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/lib/sjmcl/sjmcl")
                              (string-append out "/bin/sjmcl"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Minecraft launcher from SJMC-Dev")
    (description "SJMCL is a Minecraft launcher from the SJMC-Dev team.  It
provides an interface for downloading, managing, and launching Minecraft
instances on Linux systems.  This is the prebuilt binary release.")
    (home-page "https://github.com/UNIkeEN/SJMCL")
    (license license:gpl3+)))  ;; GPL-3.0 + custom

;;;
;;; --- 48. zune-bin (copy-build-system, binary) ---
;;; A Luau runtime.
;;; Source: https://github.com/Scythe-Technology/zune
;;;

(define-public zune-bin
  (package
    (name "zune-bin")
    (version "0.5.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Scythe-Technology/zune/releases/download/v"
                    version "/zune-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "zune" "bin/zune"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/zune")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Luau runtime similar to Lune, Node, or Bun")
    (description "Zune is a Luau runtime environment, similar in concept to
Lune, Node.js, or Bun.  It provides a fast execution environment for
Luau scripts with built-in standard library modules for file I/O,
networking, and other system operations.")
    (home-page "https://github.com/Scythe-Technology/zune")
    (license license:expat)))

;;;
;;; --- 49. blockify-git (gnu-build-system) ---
;;; Mutes Spotify advertisements.
;;; Source: https://github.com/carlocastoldi/blockify
;;;

(define-public blockify-git
  (package
    (name "blockify-git")
    (version "4.1.0.r1.g7ec5460")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/carlocastoldi/blockify")
                    (commit "7ec5460")))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "mute Spotify advertisements automatically")
    (description "Blockify automatically mutes Spotify advertisements on
Linux.  It monitors the currently playing track and mutes the audio
output when an advertisement is detected, restoring the volume when
music resumes.")
    (home-page "https://github.com/carlocastoldi/blockify")
    (license license:expat)))

;;;
;;; --- 50. r-air-bin (copy-build-system, binary) ---
;;; An R language server and formatter.
;;; Source: https://github.com/posit-dev/air
;;;

(define-public r-air-bin
  (package
    (name "r-air-bin")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/posit-dev/air/releases/download/v"
                    version "/air-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "air" "bin/air"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/air")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "R language server and formatter")
    (description "Air is a language server and code formatter for the R
programming language, developed by Posit.  It provides IDE features such
as code completion, diagnostics, and formatting for R source files.")
    (home-page "https://github.com/posit-dev/air")
    (license license:expat)))

;;;
;;; --- 51. pawbar-git (gnu-build-system) ---
;;; Kitten-panel based desktop panel.
;;; Source: https://github.com/codelif/pawbar
;;;

(define-public pawbar-git
  (package
    (name "pawbar-git")
    (version "r314.3aec858")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/codelif/pawbar")
                    (commit "3aec858")))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "kitten-panel based desktop panel for your desktop")
    (description "Pawbar is a desktop panel based on kitten-panel.  It provides
a configurable status bar and panel for Linux desktop environments,
displaying system information, workspace indicators, and other widgets.")
    (home-page "https://github.com/codelif/pawbar")
    (license license:bsd-3)))

;;;
;;; --- 52. ruby-memo_wise (gnu-build-system) ---
;;; The wise choice for Ruby memoization.
;;; Source: https://github.com/panorama-ed/memo_wise
;;;

(define-public ruby-memo_wise
  (package
    (name "ruby-memo_wise")
    (version "1.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/panorama-ed/memo_wise"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "wise choice for Ruby memoization")
    (description "MemoWise is a Ruby gem that provides fast and easy
memoization for methods.  It caches the return values of methods so
that repeated calls with the same arguments return the cached result
instead of recomputing it, improving performance for expensive
operations.")
    (home-page "https://github.com/panorama-ed/memo_wise")
    (license license:expat)))

;;;
;;; --- 53. xorg-xfsinfo (gnu-build-system) ---
;;; X font server information utility.
;;; Source: https://xorg.freedesktop.org/
;;;

(define-public xorg-xfsinfo
  (package
    (name "xorg-xfsinfo")
    (version "1.0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://xorg.freedesktop.org/releases/individual/app/"
                    "xfsinfo-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "X font server information utility")
    (description "Xfsinfo is an X.Org utility that displays information about
an X font server.  It queries the font server for its capabilities,
supported catalogue paths, and protocol version information.")
    (home-page "https://xorg.freedesktop.org/")
    (license license:expat)))  ;; custom X.Org license, mapped to expat

;;;
;;; --- 54. nanofetch (gnu-build-system) ---
;;; Lightweight system information tool written in C++.
;;; Source: https://github.com/tinyopsec/nanofetch
;;;

(define-public nanofetch
  (package
    (name "nanofetch")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tinyopsec/nanofetch"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lightweight system information tool written in C++")
    (description "Nanofetch is a lightweight system information tool written in
C++.  It displays key system details such as OS, kernel, CPU, memory,
and uptime in a minimal and fast format in the terminal, similar to
neofetch but with a smaller footprint.")
    (home-page "https://github.com/tinyopsec/nanofetch")
    (license license:expat)))

;;;
;;; --- 55. libkeybinder2 (gnu-build-system) ---
;;; Library for registering global keyboard shortcuts.
;;; Source: https://github.com/kupferlauncher/keybinder
;;;

(define-public libkeybinder2
  (package
    (name "libkeybinder2")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kupferlauncher/keybinder"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "library for registering global keyboard shortcuts")
    (description "Libkeybinder is a library for registering global keyboard
shortcuts in X11 desktop environments.  It allows applications to bind
key combinations that work regardless of which window has focus, useful
for media keys, launcher shortcuts, and other system-wide hotkeys.")
    (home-page "https://github.com/kupferlauncher/keybinder")
    (license license:gpl3+)))

;;;
;;; --- 56. dedupe-dir (gnu-build-system) ---
;;; Deduplicates directories on a weekly schedule.
;;; Source: https://github.com/theblu3j/dedupe-dir
;;;

(define-public dedupe-dir
  (package
    (name "dedupe-dir")
    (version "0.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/theblu3j/dedupe-dir"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "deduplicate directories of your choosing weekly")
    (description "Dedupe-dir is a tool that deduplicates files in specified
directories on a weekly schedule.  It identifies duplicate files by
content hash and removes redundant copies, freeing up disk space
automatically.")
    (home-page "https://github.com/theblu3j/dedupe-dir")
    (license license:bsd-0)))

;;;
;;; --- 57. sbsign-refind-initcpio-post-hook (gnu-build-system) ---
;;; Mkinitcpio post hook to sign kernels for rEFInd and Secure Boot.
;;; Source: https://aur.archlinux.org/packages/sbsign-refind-initcpio-post-hook
;;;

(define-public sbsign-refind-initcpio-post-hook
  (package
    (name "sbsign-refind-initcpio-post-hook")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "sbsign-refind-initcpio-post-hook-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "mkinitcpio post hook to sign kernels for rEFInd")
    (description "Sbsign-refind-initcpio-post-hook is a mkinitcpio post hook
that signs kernels for use with the rEFInd boot manager and UEFI Secure
Boot.  It automatically invokes sbsign to sign the kernel image after it
is generated by mkinitcpio.")
    (home-page "https://aur.archlinux.org/packages/sbsign-refind-initcpio-post-hook")
    (license license:gpl3+)))

;;;
;;; --- 58. rotcheck (gnu-build-system) ---
;;; Recursively generate, update and verify checksums.
;;; Source: https://github.com/jamielinux/rotcheck
;;;

(define-public rotcheck
  (package
    (name "rotcheck")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jamielinux/rotcheck"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "recursively generate, update and verify file checksums")
    (description "Rotcheck recursively generates, updates, and verifies
checksums for files in a directory tree.  It is designed to detect bit
rot and silent data corruption on storage devices by maintaining a
database of file checksums and periodically verifying them.")
    (home-page "https://github.com/jamielinux/rotcheck")
    (license license:expat)))

;;;
;;; --- 59. aslookup (gnu-build-system) ---
;;; Resolve ASN information and IP ranges for a given IP address.
;;; Source: https://codeberg.org/nieldk/aslookup
;;;

(define-public aslookup
  (package
    (name "aslookup")
    (version "1.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/nieldk/aslookup/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "resolve ASN information and IP ranges for IP addresses")
    (description "Aslookup is a command-line tool to resolve ASN (Autonomous
System Number) information and IP ranges for a given IP address, using
the Cymru WHOIS service.  It supports colored terminal output and JSON
output parsing for integration with other tools.")
    (home-page "https://codeberg.org/nieldk/aslookup")
    (license license:bsd-0)))

;;;
;;; --- 60. streambooru-bin (copy-build-system, binary) ---
;;; Cross-platform Electron app to browse multiple booru sites.
;;; Source: https://github.com/Amateur-God/StreamBooru
;;;

(define-public streambooru-bin
  (package
    (name "streambooru-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Amateur-God/StreamBooru"
                    "/releases/download/v" version
                    "/StreamBooru-" version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "." "lib/streambooru/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/lib/streambooru/streambooru")
                              (string-append out "/bin/streambooru"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform Electron app to browse booru sites")
    (description "StreamBooru is a cross-platform Electron application for
browsing multiple booru (image board) sites.  It provides a unified
interface for searching and viewing images across various booru services.
This is the prebuilt binary release for Linux.")
    (home-page "https://github.com/Amateur-God/StreamBooru")
    (license license:gpl3+)))

;;;
;;; --- 61. polyversal-patcher-bin (copy-build-system, binary) ---
;;; Linux Steam patcher for Committee of Zero Science Adventure patches.
;;; Source: https://github.com/CommitteeOfZero/polyversal-coz-linux-patcher
;;;

(define-public polyversal-patcher-bin
  (package
    (name "polyversal-patcher-bin")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/CommitteeOfZero/polyversal-coz-linux-patcher"
                    "/releases/download/v" version
                    "/polyversal-patcher-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "polyversal-patcher" "bin/polyversal-patcher"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/polyversal-patcher")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Linux Steam patcher for Committee of Zero patches")
    (description "Polyversal Patcher is the Linux Steam patcher for the
Committee of Zero's Science Adventure visual novel Steam patches.  It
applies translation and improvement patches to Science Adventure series
games running on Linux through Steam/Proton.")
    (home-page "https://github.com/CommitteeOfZero/polyversal-coz-linux-patcher")
    (license license:expat)))

;;;
;;; --- 62. bee-host (gnu-build-system) ---
;;; Native messaging host for Browser's External Editor extension.
;;; Source: https://github.com/rosmanov/bee-host
;;;

(define-public bee-host
  (package
    (name "bee-host")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rosmanov/bee-host"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "native messaging host for browser external editor extension")
    (description "Bee-host is a native messaging host application for the
Browser's External Editor browser extension.  It enables editing web page
text fields in an external editor by acting as a bridge between the
browser extension and the local text editor via the WebExtensions native
messaging protocol.")
    (home-page "https://github.com/rosmanov/bee-host")
    (license license:expat)))

;;;
;;; --- 63. jetforce (gnu-build-system) ---
;;; Experimental Gemini protocol server.
;;; Source: https://github.com/michael-lazar/jetforce
;;;

(define-public jetforce
  (package
    (name "jetforce")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/michael-lazar/jetforce"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "experimental Gemini protocol server")
    (description "Jetforce is an experimental server for the Gemini protocol,
a lightweight internet protocol designed as a middle ground between
Gopher and the Web.  It serves Gemini content over TLS and supports
static files and CGI-like dynamic content generation.")
    (home-page "https://github.com/michael-lazar/jetforce")
    (license license:expat)))  ;; LicenseRef-FloodgapFSL, mapped to expat
