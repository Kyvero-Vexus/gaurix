;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260407j
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   popular desktop applications, browsers, dev tools, and CLI utilities
;;;   distributed as pre-built binaries.

(define-module (gaurix packages recipe-resolver-260407j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (brave-bin
            zen-browser-bin
            ventoy-bin
            vscodium-bin
            heroic-games-launcher-bin
            freetube-bin
            zotero-bin
            onlyoffice-bin
            vesktop-bin
            opencode-bin
            arduino-ide-bin
            anytype-bin
            floorp-bin
            jetbrains-toolbox
            spicetify-cli-bin
            helium-browser-bin
            koboldcpp-bin
            jitsi-meet-desktop-bin
            trezor-suite-bin
            ldtk-bin
            mullvad-browser-bin
            rustdesk-bin
            proton-pass-cli-bin
            zoom-bin
            slack-desktop-bin
            mullvad-vpn-bin
            cursor-bin
            proton-pass-bin
            betterbird-bin
            google-chrome-bin))

;;;
;;; ── 1. brave-bin ─────────────────────────────────────────────────────────
;;; Web browser that blocks ads and trackers
;;;
(define-public brave-bin
  (package
    (name "brave-bin")
    (version "1.88.138")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/brave/brave-browser/releases/download/v"
             version "/brave-browser-" version "-linux-amd64.zip"))
       (sha256
        (base32 "08xb5z1haipy0inhw4r0n6pky1riv6msalw9ngsl6q7zh2yac25r"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/brave"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append unzip "/bin/unzip") src "-d" tmp)
            (copy-recursively tmp opt)
            (mkdir-p bin)
            (symlink (string-append opt "/brave")
                     (string-append bin "/brave"))
            #t))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://brave.com")
    (synopsis "privacy-focused web browser based on Chromium")
    (description
     "Brave is a free and open-source web browser based on the Chromium
web browser.  It blocks ads and website trackers by default, and
provides a way for users to send cryptocurrency in the form of Basic
Attention Tokens to websites and content creators.")
    (license license:mpl2.0)))

;;;
;;; ── 2. zen-browser-bin ───────────────────────────────────────────────────
;;; Performance-oriented Firefox-based browser
;;;
(define-public zen-browser-bin
  (package
    (name "zen-browser-bin")
    (version "1.19.6b")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/zen-browser/desktop/releases/download/"
             version "/zen.linux-x86_64.tar.xz"))
       (sha256
        (base32 "0v38srf92xggjxn9h7bcddpxzdy5n2yl2nprnj8r29zwah48z5w7"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/zen-browser"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append xz "/bin/xz")
                    "-xf" src "-C" tmp)
            (copy-recursively (string-append tmp "/zen") opt)
            (mkdir-p bin)
            (symlink (string-append opt "/zen")
                     (string-append bin "/zen-browser"))
            #t))))
    (native-inputs (list tar xz))
    (supported-systems '("x86_64-linux"))
    (home-page "https://zen-browser.app")
    (synopsis "performance-oriented Firefox-based web browser")
    (description
     "Zen Browser is a Firefox-based web browser focused on performance
and user experience.  It features a clean interface with built-in
privacy protections and customizable sidebar.")
    (license license:mpl2.0)))

;;;
;;; ── 3. ventoy-bin ────────────────────────────────────────────────────────
;;; Bootable USB solution
;;;
(define-public ventoy-bin
  (package
    (name "ventoy-bin")
    (version "1.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ventoy/Ventoy/releases/download/v"
             version "/ventoy-" version "-linux.tar.gz"))
       (sha256
        (base32 "1alzg03r2dgalg0q8cb464hqn2yycp6dgwa3vz2x098j6krwpjyx"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/ventoy"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (let ((srcdir (car (find-files tmp "^ventoy-" #:directories? #t
                                           #:fail-on-error? #f))))
              (copy-recursively srcdir opt)
              (mkdir-p bin)
              (for-each
               (lambda (script)
                 (let ((src-path (string-append opt "/" script)))
                   (when (file-exists? src-path)
                     (chmod src-path #o755)
                     (symlink src-path
                              (string-append bin "/" script)))))
               '("Ventoy2Disk.sh" "VentoyWeb.sh" "VentoyPlugson.sh")))
            #t))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.ventoy.net")
    (synopsis "bootable USB solution supporting multiple ISO images")
    (description
     "Ventoy is an open-source tool to create bootable USB drives.
You simply copy ISO, WIM, IMG, VHD, or EFI files to the USB drive
and boot from them directly.  No need to extract or format the
drive repeatedly.")
    (license license:gpl3+)))

;;;
;;; ── 4. vscodium-bin ──────────────────────────────────────────────────────
;;; VS Code without Microsoft branding and telemetry
;;;
(define-public vscodium-bin
  (package
    (name "vscodium-bin")
    (version "1.112.01907")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/VSCodium/vscodium/releases/download/"
             version "/VSCodium-linux-x64-" version ".tar.gz"))
       (sha256
        (base32 "0bwrw35665ny3qfnmws67h53f71mkd3lax539xx2x823k0hjvzh8"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/vscodium"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (copy-recursively tmp opt)
            (mkdir-p bin)
            (symlink (string-append opt "/bin/codium")
                     (string-append bin "/codium"))
            #t))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://vscodium.com")
    (synopsis "community-driven freely-licensed VS Code distribution")
    (description
     "VSCodium is a community-driven, freely-licensed binary distribution of
Microsoft's VS Code editor.  It removes Microsoft's branding, telemetry,
and tracking from the open-source VS Code codebase.")
    (license license:expat)))

;;;
;;; ── 5. heroic-games-launcher-bin ─────────────────────────────────────────
;;; Open source launcher for Epic, Amazon, and GOG games
;;;
(define-public heroic-games-launcher-bin
  (package
    (name "heroic-games-launcher-bin")
    (version "2.20.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher"
             "/releases/download/v" version
             "/Heroic-" version "-linux-x64.tar.xz"))
       (sha256
        (base32 "0lcqq7b5gl7rj0x74aw93njck9bick0x9mzfhiiaq40nhf6zb0qb"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/heroic"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append xz "/bin/xz")
                    "-xf" src "-C" tmp)
            (copy-recursively tmp opt)
            (mkdir-p bin)
            (symlink (string-append opt "/heroic")
                     (string-append bin "/heroic"))
            #t))))
    (native-inputs (list tar xz))
    (supported-systems '("x86_64-linux"))
    (home-page "https://heroicgameslauncher.com")
    (synopsis "open source game launcher for Epic, Amazon, and GOG")
    (description
     "Heroic Games Launcher is an open-source game launcher for Linux
that allows playing games from Epic Games Store, Amazon Prime Gaming,
and GOG.  It supports running Windows games through Proton and Wine.")
    (license license:gpl3+)))

;;;
;;; ── 6. freetube-bin ──────────────────────────────────────────────────────
;;; Open source desktop YouTube player focused on privacy
;;;
(define-public freetube-bin
  (package
    (name "freetube-bin")
    (version "0.24.0-beta")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FreeTubeApp/FreeTube/releases/download/v"
             version "/freetube-" version
             "-linux-x64-portable.zip"))
       (sha256
        (base32 "1820jjra3af7qli95zs3yhr48gfjm35rab9k5gzvvgnnl1ikiz99"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/freetube"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append unzip "/bin/unzip") src "-d" tmp)
            (let ((srcdir (string-append tmp "/FreeTube-linux-x64")))
              (copy-recursively srcdir opt))
            (mkdir-p bin)
            (symlink (string-append opt "/FreeTube")
                     (string-append bin "/freetube"))
            #t))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://freetubeapp.io")
    (synopsis "open source desktop YouTube player for privacy")
    (description
     "FreeTube is an open-source desktop YouTube player built with
privacy in mind.  It allows watching YouTube videos without ads and
without Google tracking, using either a local API or the Invidious API.")
    (license license:agpl3+)))

;;;
;;; ── 7. zotero-bin ────────────────────────────────────────────────────────
;;; Research source collection and organization tool
;;;
(define-public zotero-bin
  (package
    (name "zotero-bin")
    (version "8.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.zotero.org/client/release/"
             version "/Zotero-" version "_linux-x86_64.tar.xz"))
       (sha256
        (base32 "0wwn4jf7w9kwrc02kr0y9zg77gfmd1c8smfzc7djgp3b7b9pfzmy"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/zotero"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append xz "/bin/xz")
                    "-xf" src "-C" tmp)
            (let ((srcdir (car (find-files tmp "^Zotero" #:directories? #t
                                           #:fail-on-error? #f))))
              (copy-recursively srcdir opt))
            (mkdir-p bin)
            (symlink (string-append opt "/zotero")
                     (string-append bin "/zotero"))
            #t))))
    (native-inputs (list tar xz))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.zotero.org")
    (synopsis "reference management software for research")
    (description
     "Zotero is a free, open-source reference management software to manage
bibliographic data and related research materials.  It helps collect,
organize, annotate, cite, and share research sources.")
    (license license:agpl3+)))

;;;
;;; ── 8. onlyoffice-bin ────────────────────────────────────────────────────
;;; Office suite for text, spreadsheet, and presentation editing
;;;
(define-public onlyoffice-bin
  (package
    (name "onlyoffice-bin")
    (version "9.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v"
             version "/DesktopEditors-x86_64.AppImage"))
       (sha256
        (base32 "0ps40w71r41i6vfgb9xrjf8lkrjcbkmw8nbbwb329dgmwxs7vacp"))))
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
            (copy-file src (string-append bin "/onlyoffice-desktopeditors"))
            (chmod (string-append bin "/onlyoffice-desktopeditors") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.onlyoffice.com")
    (synopsis "office suite for documents, spreadsheets, and presentations")
    (description
     "ONLYOFFICE Desktop Editors is a free office suite that combines text,
spreadsheet, and presentation editors.  It is fully compatible with
Microsoft Office formats including DOCX, XLSX, and PPTX.")
    (license license:agpl3+)))

;;;
;;; ── 9. vesktop-bin ───────────────────────────────────────────────────────
;;; Discord client with Vencord pre-installed
;;;
(define-public vesktop-bin
  (package
    (name "vesktop-bin")
    (version "1.6.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Vencord/Vesktop/releases/download/v"
             version "/vesktop-" version ".tar.gz"))
       (sha256
        (base32 "0panf4lg1n5a4na5zwjq9a4i0r0j7p9414pdr53hpkcl1jdgrld2"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/vesktop"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (copy-recursively tmp opt)
            (mkdir-p bin)
            (symlink (string-append opt "/vesktop")
                     (string-append bin "/vesktop"))
            #t))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Vencord/Vesktop")
    (synopsis "discord desktop client with Vencord pre-installed")
    (description
     "Vesktop is a custom Discord desktop application that comes with
Vencord pre-installed.  It provides additional features and
customization options on top of the standard Discord experience,
including better Wayland and screen sharing support.")
    (license license:gpl3+)))

;;;
;;; ── 10. opencode-bin ─────────────────────────────────────────────────────
;;; AI coding agent for the terminal
;;;
(define-public opencode-bin
  (package
    (name "opencode-bin")
    (version "0.0.55")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/opencode-ai/opencode/releases/download/v"
             version "/opencode-linux-x86_64.tar.gz"))
       (sha256
        (base32 "09c0r7aa9vwgfpmpq43v19nqrkp96k9ic8iyiz2aw83r7qh427vz"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (mkdir-p bin)
            (let ((binary (car (find-files tmp "^opencode$"))))
              (copy-file binary (string-append bin "/opencode"))
              (chmod (string-append bin "/opencode") #o755))
            #t))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/opencode-ai/opencode")
    (synopsis "AI coding agent for the terminal")
    (description
     "OpenCode is an open-source AI coding agent that runs in the terminal.
It connects to various LLM providers and helps with code generation,
editing, and understanding directly from the command line.")
    (license license:expat)))

;;;
;;; ── 11. arduino-ide-bin ──────────────────────────────────────────────────
;;; Arduino prototyping IDE
;;;
(define-public arduino-ide-bin
  (package
    (name "arduino-ide-bin")
    (version "2.3.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/arduino/arduino-ide/releases/download/"
             version "/arduino-ide_" version "_Linux_64bit.zip"))
       (sha256
        (base32 "1nwb4cd9xffsx7nh3p9cz4s0j1b91z7mg0lqydingpgv0bj34s92"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/arduino-ide"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append unzip "/bin/unzip") src "-d" tmp)
            (let ((srcdir (car (find-files tmp "^arduino-ide" #:directories? #t
                                           #:fail-on-error? #f))))
              (copy-recursively srcdir opt))
            (mkdir-p bin)
            (symlink (string-append opt "/arduino-ide")
                     (string-append bin "/arduino-ide"))
            #t))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.arduino.cc/en/software")
    (synopsis "integrated development environment for Arduino")
    (description
     "Arduino IDE 2.x is the official integrated development environment
for Arduino boards.  It features a modern editor with autocomplete,
code navigation, a built-in serial monitor, and a debugger.")
    (license license:agpl3+)))

;;;
;;; ── 12. anytype-bin ──────────────────────────────────────────────────────
;;; Next-gen knowledge management tool
;;;
(define-public anytype-bin
  (package
    (name "anytype-bin")
    (version "0.54.26")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/anyproto/anytype-ts/releases/download/v"
             version "-alpha/anytype_" version "-alpha_amd64.deb"))
       (sha256
        (base32 "1265h0895wr6lw43rr6vyx0mxin0bk9736nck2yrgdh52w4rxmfd"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/anytype"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/Anytype")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/anytype")
                     (string-append bin "/anytype"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://anytype.io")
    (synopsis "local-first knowledge management and collaboration tool")
    (description
     "Anytype is a local-first, peer-to-peer tool for creating documents,
tasks, and knowledge bases.  Data is stored locally and synced between
devices without relying on a central server.")
    ;; Anytype uses the Any Source Available License 1.0.
    (license #f)))

;;;
;;; ── 13. floorp-bin ───────────────────────────────────────────────────────
;;; Firefox-based customizable browser
;;;
(define-public floorp-bin
  (package
    (name "floorp-bin")
    (version "12.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Floorp-Projects/Floorp/releases/download/v"
             version "/floorp-linux-x86_64.tar.xz"))
       (sha256
        (base32 "040rlldhr3pv9vidnbgqqdnr5rm0y8w0v8q9wyj9q8p80kcimxm6"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/floorp"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append xz "/bin/xz")
                    "-xf" src "-C" tmp)
            (let ((srcdir (string-append tmp "/floorp")))
              (copy-recursively srcdir opt))
            (mkdir-p bin)
            (symlink (string-append opt "/floorp")
                     (string-append bin "/floorp"))
            #t))))
    (native-inputs (list tar xz))
    (supported-systems '("x86_64-linux"))
    (home-page "https://floorp.app")
    (synopsis "customizable Firefox-based web browser")
    (description
     "Floorp is a Firefox-based browser from Japan that focuses on
customizability and user freedom.  It features a flexible sidebar,
vertical tabs, workspaces, and extensive theming support.")
    (license license:mpl2.0)))

;;;
;;; ── 14. jetbrains-toolbox ────────────────────────────────────────────────
;;; JetBrains IDE manager
;;;
(define-public jetbrains-toolbox
  (package
    (name "jetbrains-toolbox")
    (version "3.4.1.78303")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.jetbrains.com/toolbox/jetbrains-toolbox-"
             version ".tar.gz"))
       (sha256
        (base32 "169zwak6l3i3n9dh4vj9id0n7p1y5jj56zhhic6n4g06f28avbwq"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/jetbrains-toolbox"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (let ((srcdir (car (find-files tmp "^jetbrains-toolbox"
                                           #:directories? #t
                                           #:fail-on-error? #f))))
              (copy-recursively srcdir opt))
            (mkdir-p bin)
            (symlink (string-append opt "/jetbrains-toolbox")
                     (string-append bin "/jetbrains-toolbox"))
            #t))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.jetbrains.com/toolbox-app/")
    (synopsis "manager for JetBrains IDEs and projects")
    (description
     "JetBrains Toolbox App manages JetBrains IDE installations and
updates.  It provides a single entry point to install, update,
and configure all JetBrains development tools.")
    ;; Proprietary, free to use.
    (license #f)))

;;;
;;; ── 15. spicetify-cli-bin ────────────────────────────────────────────────
;;; Spotify client customization CLI
;;;
(define-public spicetify-cli-bin
  (package
    (name "spicetify-cli-bin")
    (version "2.43.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/spicetify/cli/releases/download/v"
             version "/spicetify-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "1gnd2zwrjlvf5is5n14hr0iskagy5v4343zya8rbpyb3fy89g8vz"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (mkdir-p bin)
            (copy-file (string-append tmp "/spicetify")
                       (string-append bin "/spicetify"))
            (chmod (string-append bin "/spicetify") #o755)
            #t))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://spicetify.app")
    (synopsis "command-line tool to customize Spotify client")
    (description
     "Spicetify is a command-line tool to customize the official Spotify
client.  It supports custom themes, extensions, and apps for the
Spotify desktop client on Linux.")
    (license license:lgpl2.1+)))

;;;
;;; ── 16. helium-browser-bin ───────────────────────────────────────────────
;;; Privacy-focused Chromium-based browser
;;;
(define-public helium-browser-bin
  (package
    (name "helium-browser-bin")
    (version "0.10.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicothin/helium-linux/releases/download/"
             version "/helium-" version "-x86_64_linux.tar.xz"))
       (sha256
        (base32 "1ppmhxn43gmph182a285pn80mpqznfrpmlvsf2slmq704sy0dvda"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/helium"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append xz "/bin/xz")
                    "-xf" src "-C" tmp)
            (copy-recursively tmp opt)
            (mkdir-p bin)
            (let ((exe (car (find-files opt "^helium$" #:fail-on-error? #f))))
              (when exe
                (symlink exe (string-append bin "/helium"))))
            #t))))
    (native-inputs (list tar xz))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicothin/helium-linux")
    (synopsis "privacy-focused Chromium-based web browser")
    (description
     "Helium is a lightweight, privacy-focused web browser based on
Chromium.  It removes telemetry and tracking while providing a
clean browsing experience.")
    (license license:gpl3+)))

;;;
;;; ── 17. koboldcpp-bin ────────────────────────────────────────────────────
;;; LLM inference engine (no CUDA)
;;;
(define-public koboldcpp-bin
  (package
    (name "koboldcpp-bin")
    (version "1.111.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/LostRuins/koboldcpp/releases/download/v"
             version "/koboldcpp-linux-x64-nocuda"))
       (sha256
        (base32 "1jpfgdjnsd376ral774fc63jlz5k6kc8fwprpjv72dc55njamj5a"))))
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
            (copy-file src (string-append bin "/koboldcpp"))
            (chmod (string-append bin "/koboldcpp") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/LostRuins/koboldcpp")
    (synopsis "easy-to-use local LLM inference with KoboldAI API")
    (description
     "KoboldCpp is a self-contained AI text generation application built
on llama.cpp.  It provides a KoboldAI-compatible API server for running
large language models locally on CPU, with optional GPU acceleration.")
    (license license:agpl3+)))

;;;
;;; ── 18. jitsi-meet-desktop-bin ───────────────────────────────────────────
;;; Jitsi Meet video conferencing desktop client
;;;
(define-public jitsi-meet-desktop-bin
  (package
    (name "jitsi-meet-desktop-bin")
    (version "2026.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jitsi/jitsi-meet-electron/releases/download/v"
             version "/jitsi-meet-x86_64.AppImage"))
       (sha256
        (base32 "1c9n7ydmz514xrf06bnbqimfnighhzixjha731dkpafbxcvwblzb"))))
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
            (copy-file src (string-append bin "/jitsi-meet"))
            (chmod (string-append bin "/jitsi-meet") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://jitsi.org/jitsi-meet/")
    (synopsis "desktop client for Jitsi Meet video conferencing")
    (description
     "Jitsi Meet Desktop is the official Electron-based desktop application
for Jitsi Meet, an open-source video conferencing platform.  It
provides screen sharing, virtual backgrounds, and end-to-end encryption.")
    (license license:asl2.0)))

;;;
;;; ── 19. trezor-suite-bin ─────────────────────────────────────────────────
;;; Trezor hardware wallet management
;;;
(define-public trezor-suite-bin
  (package
    (name "trezor-suite-bin")
    (version "26.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/trezor/trezor-suite/releases/download/v"
             version "/Trezor-Suite-" version
             "-linux-x86_64.AppImage"))
       (sha256
        (base32 "0zffi242aq4jj654b811ypvcx42c18l8ms61mml8541gpssjkypl"))))
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
            (copy-file src (string-append bin "/trezor-suite"))
            (chmod (string-append bin "/trezor-suite") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://trezor.io/trezor-suite")
    (synopsis "desktop application for managing Trezor hardware wallets")
    (description
     "Trezor Suite is the official desktop application for managing Trezor
hardware cryptocurrency wallets.  It provides a secure interface for
sending, receiving, and managing digital assets.")
    ;; Trezor Reference Source License (T-RSL).
    (license #f)))

;;;
;;; ── 20. ldtk-bin ─────────────────────────────────────────────────────────
;;; Level Designer Toolkit for 2D games
;;;
(define-public ldtk-bin
  (package
    (name "ldtk-bin")
    (version "1.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/deepnight/ldtk/releases/download/v"
             version "/ubuntu-distribution.zip"))
       (sha256
        (base32 "0ri5a36pzimb1dhx4n05m2i8cycy0k9ik888pzgwmlimmdqciccb"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/ldtk"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append unzip "/bin/unzip") src "-d" tmp)
            (copy-recursively tmp opt)
            (mkdir-p bin)
            (let ((exe (car (find-files opt "^LDtk$" #:fail-on-error? #f))))
              (when exe
                (chmod exe #o755)
                (symlink exe (string-append bin "/ldtk"))))
            #t))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ldtk.io")
    (synopsis "modern level designer toolkit for 2D games")
    (description
     "LDtk (Level Designer Toolkit) is a modern, open-source 2D level
editor focused on user-friendliness.  It supports auto-tiling, entity
management, and exports to JSON for easy integration with game engines.")
    (license license:expat)))

;;;
;;; ── 21. mullvad-browser-bin ──────────────────────────────────────────────
;;; Privacy browser by Mullvad and Tor Project
;;;
(define-public mullvad-browser-bin
  (package
    (name "mullvad-browser-bin")
    (version "15.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mullvad/mullvad-browser/releases/download/"
             version "/mullvad-browser-linux-x86_64-" version ".tar.xz"))
       (sha256
        (base32 "154nraw83lhyrhrahvd35zvclnshcfvgjq16cr2z9jg5sz7c4hhs"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/mullvad-browser"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append xz "/bin/xz")
                    "-xf" src "-C" tmp)
            (let ((srcdir (string-append tmp "/mullvad-browser")))
              (copy-recursively srcdir opt))
            (mkdir-p bin)
            (let ((start (string-append opt "/Browser/start-mullvad-browser")))
              (when (file-exists? start)
                (symlink start (string-append bin "/mullvad-browser"))))
            #t))))
    (native-inputs (list tar xz))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mullvad.net/browser")
    (synopsis "privacy-focused web browser by Mullvad and Tor Project")
    (description
     "Mullvad Browser is a privacy-focused web browser developed in
collaboration between Mullvad VPN and the Tor Project.  It is designed
to minimize tracking and fingerprinting without using the Tor network.")
    (license license:mpl2.0)))

;;;
;;; ── 22. rustdesk-bin ─────────────────────────────────────────────────────
;;; Open source remote desktop
;;;
(define-public rustdesk-bin
  (package
    (name "rustdesk-bin")
    (version "1.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rustdesk/rustdesk/releases/download/"
             version "/rustdesk-" version "-x86_64.deb"))
       (sha256
        (base32 "014giif43vrxgclkn780f5rgmh8hk8qp8grjspg848i5gdx6v90d"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/rustdesk"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.gz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/usr/lib/rustdesk")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (let ((exe (string-append opt "/rustdesk")))
              (when (file-exists? exe)
                (symlink exe (string-append bin "/rustdesk"))))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rustdesk.com")
    (synopsis "open-source remote desktop software")
    (description
     "RustDesk is an open-source remote desktop application written in Rust.
It provides a self-hosted alternative to TeamViewer and AnyDesk, with
support for unattended access, file transfer, and TCP tunneling.")
    (license license:agpl3+)))

;;;
;;; ── 23. proton-pass-cli-bin ──────────────────────────────────────────────
;;; Proton Pass command-line interface
;;;
(define-public proton-pass-cli-bin
  (package
    (name "proton-pass-cli-bin")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://proton.me/download/pass-cli/" version
             "/pass-cli-linux-x86_64"))
       (sha256
        (base32 "1x528vsx7pjylxz4rqd2gmq05m7bc6gch05ranpnc0jqgyayawcv"))))
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
            (copy-file src (string-append bin "/proton-pass"))
            (chmod (string-append bin "/proton-pass") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://proton.me/pass")
    (synopsis "command-line interface for Proton Pass password manager")
    (description
     "Proton Pass CLI provides command-line access to the Proton Pass
password manager.  It allows managing passwords, generating TOTP codes,
and exporting vault data from the terminal.")
    ;; Proprietary (Proton AG).
    (license #f)))

;;;
;;; ── 24. zoom-bin ─────────────────────────────────────────────────────────
;;; Video conferencing
;;;
(define-public zoom-bin
  (package
    (name "zoom-bin")
    (version "7.0.2.34412")
    (source
     (origin
       (method url-fetch)
       ;; Note: using "latest" URL; pin to version hash at build time.
       (uri "https://zoom.us/client/latest/zoom_x86_64.tar.xz")
       (sha256
        (base32 "0q8kypi7xqvyjy9l9wiw3rqrhl1fyqsarvvc68g3mcpj89psd36h"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/zoom"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append xz "/bin/xz")
                    "-xf" src "-C" tmp)
            (let ((srcdir (string-append tmp "/zoom")))
              (copy-recursively srcdir opt))
            (mkdir-p bin)
            (symlink (string-append opt "/ZoomLauncher")
                     (string-append bin "/zoom"))
            #t))))
    (native-inputs (list tar xz))
    (supported-systems '("x86_64-linux"))
    (home-page "https://zoom.us")
    (synopsis "video conferencing and online meetings platform")
    (description
     "Zoom is a video conferencing platform for online meetings, webinars,
and collaboration.  It supports HD video and audio, screen sharing,
virtual backgrounds, and breakout rooms.")
    ;; Proprietary.
    (license #f)))

;;;
;;; ── 25. slack-desktop-bin ────────────────────────────────────────────────
;;; Slack desktop client
;;;
(define-public slack-desktop-bin
  (package
    (name "slack-desktop-bin")
    (version "4.47.69")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.slack-edge.com/desktop-releases/linux/x64/"
             version "/slack-desktop-" version "-amd64.deb"))
       (sha256
        (base32 "19bbj3lk9vwqgjabsgisjldsxwwq3na7525vvijyfs59kq3y7mbv"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/slack"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            ;; Slack .deb uses data.tar.xz
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/usr/lib/slack")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/slack")
                     (string-append bin "/slack"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://slack.com")
    (synopsis "desktop client for Slack team communication")
    (description
     "Slack is a channel-based messaging platform for team communication.
This package provides the official desktop client for Linux with
support for notifications, screen sharing, and huddles.")
    ;; Proprietary (Salesforce/Slack).
    (license #f)))

;;;
;;; ── 26. mullvad-vpn-bin ──────────────────────────────────────────────────
;;; Mullvad VPN desktop client
;;;
(define-public mullvad-vpn-bin
  (package
    (name "mullvad-vpn-bin")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mullvad/mullvadvpn-app/releases/download/"
             version "/MullvadVPN-" version "_amd64.deb"))
       (sha256
        (base32 "0gpg5yb1b4fw6zw06ymgicw46v7qj4sf7i5zd5srdhqvn66rlmqy"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/mullvad-vpn"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/Mullvad VPN")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (let ((exe (string-append opt "/mullvad-vpn")))
              (when (file-exists? exe)
                (symlink exe (string-append bin "/mullvad-vpn"))))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mullvad.net")
    (synopsis "Mullvad VPN desktop application")
    (description
     "Mullvad VPN is a privacy-focused VPN service.  This package provides
the official desktop application which manages VPN connections using
WireGuard and OpenVPN protocols, with a simple one-click interface.")
    (license license:gpl3+)))

;;;
;;; ── 27. cursor-bin ───────────────────────────────────────────────────────
;;; AI-first coding environment
;;;
(define-public cursor-bin
  (package
    (name "cursor-bin")
    (version "3.0.13")
    (source
     (origin
       (method url-fetch)
       ;; Uses the latest stable redirect URL.
       (uri "https://downloader.cursor.sh/linux/appImage/x64")
       (file-name (string-append "cursor-" version "-x86_64.AppImage"))
       (sha256
        (base32 "14pi4gwawqkaniqk21ffzmiri6sk2k1n1ylpimvysgqk5wk9dhg4"))))
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
            (copy-file src (string-append bin "/cursor"))
            (chmod (string-append bin "/cursor") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cursor.com")
    (synopsis "AI-first code editor built on VS Code")
    (description
     "Cursor is an AI-powered code editor built on top of VS Code.  It
features AI-assisted code completion, editing, and chat capabilities
integrated directly into the development workflow.")
    ;; Proprietary (Anysphere).
    (license #f)))

;;;
;;; ── 28. proton-pass-bin ──────────────────────────────────────────────────
;;; Proton Pass desktop password manager
;;;
(define-public proton-pass-bin
  (package
    (name "proton-pass-bin")
    (version "1.36.0")
    (source
     (origin
       (method url-fetch)
       ;; Unversioned URL, always serves latest.
       (uri "https://proton.me/download/PassDesktop/linux/x64/ProtonPass.deb")
       (file-name (string-append "proton-pass-" version ".deb"))
       (sha256
        (base32 "0v922ryjzfi6vwh6xyaq4grcwaqzz29galhgpmn2qiwj91ihz63c"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/proton-pass"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/Proton Pass")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (let ((exe (string-append opt "/proton-pass")))
              (when (file-exists? exe)
                (symlink exe (string-append bin "/proton-pass"))))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://proton.me/pass")
    (synopsis "desktop password manager by Proton")
    (description
     "Proton Pass is an end-to-end encrypted password manager from the
makers of Proton Mail.  This desktop application provides secure
password storage, autofill, and TOTP generation.")
    ;; Proprietary (Proton AG).
    (license #f)))

;;;
;;; ── 29. betterbird-bin ───────────────────────────────────────────────────
;;; Fine-tuned Thunderbird fork
;;;
(define-public betterbird-bin
  (package
    (name "betterbird-bin")
    (version "140.9.0esr-bb20")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.betterbird.eu/downloads/get.php?"
             "os=linux&lang=en-US&version=release"))
       (file-name (string-append "betterbird-" version ".tar.xz"))
       (sha256
        (base32 "091h76dd3ivpw7jj3134cxry3wr4jc7p09jdrrgd7rzkbg5l1l32"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/betterbird"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append xz "/bin/xz")
                    "-xf" src "-C" tmp)
            (let ((srcdir (string-append tmp "/betterbird")))
              (copy-recursively srcdir opt))
            (mkdir-p bin)
            (symlink (string-append opt "/betterbird")
                     (string-append bin "/betterbird"))
            #t))))
    (native-inputs (list tar xz))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.betterbird.eu")
    (synopsis "fine-tuned version of Mozilla Thunderbird")
    (description
     "Betterbird is a fork of Mozilla Thunderbird with additional features
and bug fixes.  It includes improvements to the message list, folder
pane, composition window, and search functionality.")
    (license license:mpl2.0)))

;;;
;;; ── 30. google-chrome-bin ────────────────────────────────────────────────
;;; Google Chrome web browser
;;;
(define-public google-chrome-bin
  (package
    (name "google-chrome-bin")
    (version "137.0.7151.40")
    (source
     (origin
       (method url-fetch)
       (uri "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb")
       (file-name (string-append "google-chrome-" version ".deb"))
       (sha256
        (base32 "0a5v5jj13fp42mxqy3k78xflg60kxll5l6m39inwp41y2hn9fyrp"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/google-chrome"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/google/chrome")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/google-chrome")
                     (string-append bin "/google-chrome"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.google.com/chrome/")
    (synopsis "web browser by Google")
    (description
     "Google Chrome is a cross-platform web browser developed by Google.
It features a V8 JavaScript engine, sandboxed tabs, built-in translation,
and synchronization across devices via Google account.")
    ;; Proprietary (Google).
    (license #f)))
