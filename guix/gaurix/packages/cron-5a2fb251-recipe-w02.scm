;;; Chunk module for cron-5a2fb251 worker w02.
;;; 10 packages: qt-sudo, claude-code, traur, faugus-launcher,
;;; jetbrains-toolbox, cursor-bin, zapzap, spicetify-cli, ttf-ms-fonts,
;;; mullvad-vpn-bin.
(define-module (gaurix packages cron-5a2fb251-recipe-w02)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages node)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:export (qt-sudo
            claude-code
            traur
            faugus-launcher
            jetbrains-toolbox
            cursor-bin
            zapzap
            spicetify-cli
            ttf-ms-fonts
            mullvad-vpn-bin))

;;;
;;; 1. qt-sudo — Qt sudo dialog
;;;
(define-public qt-sudo
  (package
    (name "qt-sudo")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/aarnt/qt-sudo/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dvimqsrksnzy0mk3nnksiqfynxh7rdhf86qjvnhnkl4f892k23y"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags #~(list)))
    (inputs (list qtbase))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/aarnt/qt-sudo")
    (synopsis "A clone of LXQt sudo tool without LXQt dependencies")
    (description
     "qt-sudo is a simple graphical sudo dialog using Qt, providing a clone
of the LXQt sudo tool without requiring LXQt libraries.")
    (license license:lgpl2.1+)))

;;;
;;; 2. claude-code — Anthropic's Claude Code CLI (npm binary repack)
;;;
(define-public claude-code
  (package
    (name "claude-code")
    (version "2.1.92")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-"
             version ".tgz"))
       (file-name (string-append name "-" version ".tgz"))
       (sha256
        (base32 "0iwkfjb3nq95b9iz1hng2i3vdcdb2aph35jmaccagcz62vwqby7z"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (node (search-input-file %build-inputs "/bin/node"))
                 (lib (string-append out "/lib/node_modules/@anthropic-ai/claude-code"))
                 (bin (string-append out "/bin")))
            (mkdir-p lib)
            (invoke tar "xzf" src "-C" lib "--strip-components=1")
            (mkdir-p bin)
            (let ((wrapper (string-append bin "/claude")))
              (call-with-output-file wrapper
                (lambda (port)
                  (format port "#!~a~%exec ~a ~a/cli.js \"$@\"~%"
                          (search-input-file %build-inputs "/bin/bash")
                          node
                          lib)))
              (chmod wrapper #o755))
            #t))))
    (native-inputs (list tar gzip))
    (inputs (list node bash-minimal))
    (home-page "https://github.com/anthropics/claude-code")
    (synopsis "Anthropic's Claude Code agentic coding CLI")
    (description
     "Claude Code is an agentic coding tool by Anthropic that lives in your
terminal, understands your codebase, and helps you code faster through
natural language commands.")
    (license #f)))

;;;
;;; 3. traur — AUR helper (prebuilt binary)
;;;
(define-public traur
  (package
    (name "traur")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Sohimaster/traur/releases/download/v"
             version "/traur-" version "-x86_64.tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xrpj6glgrpbbl5c57kp20v6zbnw4d9gcgz86ixgjhaa4xp6xzr5"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (invoke tar "xzf" src "-C" bin)
            (chmod (string-append bin "/traur") #o755)
            #t))))
    (native-inputs (list tar gzip))
    (home-page "https://github.com/Sohimaster/traur")
    (synopsis "Trust scoring for AUR packages")
    (description
     "traur is a tool for computing trust scores for AUR packages,
helping users assess the trustworthiness of Arch User Repository packages
before installing them.")
    (license #f)))

;;;
;;; 4. faugus-launcher — Windows game launcher via UMU-Launcher
;;;
(define-public faugus-launcher
  (package
    (name "faugus-launcher")
    (version "1.17.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Faugus/faugus-launcher/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06j79wnh7434v374qzgjc4v0slxcmvymm2iykwmb2vy31ryb56ck"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list python bash-minimal))
    (home-page "https://github.com/Faugus/faugus-launcher")
    (synopsis "Simple app for running Windows games using UMU-Launcher")
    (description
     "Faugus Launcher is a simple and lightweight application for running
Windows games on Linux using UMU-Launcher.  It provides a graphical
interface for managing and launching Windows games through Proton.")
    (license license:expat)))

;;;
;;; 5. jetbrains-toolbox — JetBrains Toolbox (prebuilt binary)
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
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (opt (string-append out "/opt/jetbrains-toolbox"))
                 (bin (string-append out "/bin")))
            (mkdir-p opt)
            (invoke tar "xzf" src "-C" opt "--strip-components=1")
            (mkdir-p bin)
            (symlink (string-append opt "/jetbrains-toolbox")
                     (string-append bin "/jetbrains-toolbox"))
            #t))))
    (native-inputs (list tar gzip))
    (home-page "https://www.jetbrains.com/toolbox-app/")
    (synopsis "Manage JetBrains tools and projects")
    (description
     "JetBrains Toolbox App is a control panel for managing all your JetBrains
IDEs and projects.  This package repackages the official upstream binary
release for Linux x86_64.")
    (license #f)))

;;;
;;; 6. cursor-bin — Cursor AI code editor (prebuilt binary from .deb)
;;;
(define-public cursor-bin
  (package
    (name "cursor-bin")
    (version "3.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.cursor.com/production/"
             "93e276db8a03af947eafb2d10241e2de17806c29"
             "/linux/x64/deb/amd64/deb/cursor_" version "_amd64.deb"))
       (file-name (string-append name "-" version ".deb"))
       (sha256
        (base32 "0293lxr9yax4picarqpzsz1ph50is19a36mzdc8jirkj7ngmlvn9"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (ar  (search-input-file %build-inputs "/bin/ar"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz  (search-input-file %build-inputs "/bin/xz"))
                 (cwd (getcwd))
                 (opt (string-append out "/opt/cursor"))
                 (bin (string-append out "/bin")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            (mkdir-p opt)
            (copy-recursively (string-append cwd "/usr/share/cursor") opt)
            (mkdir-p bin)
            (symlink (string-append opt "/cursor")
                     (string-append bin "/cursor"))
            (let ((desktop-dir (string-append out "/share/applications"))
                  (src-desktop (string-append cwd "/usr/share/applications")))
              (when (file-exists? src-desktop)
                (mkdir-p desktop-dir)
                (copy-recursively src-desktop desktop-dir)))
            #t))))
    (native-inputs (list binutils tar xz))
    (home-page "https://www.cursor.com")
    (synopsis "AI-first code editor (prebuilt binary)")
    (description
     "Cursor is an AI-first code editor built for pair programming with AI.
This package repackages the official upstream binary .deb release for
Linux x86_64.")
    (license #f)))

;;;
;;; 7. zapzap — WhatsApp desktop in PyQt6
;;;
(define-public zapzap
  (package
    (name "zapzap")
    (version "6.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rafatosta/zapzap/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1aijf3lx2jpm056s7wzgwqijz0jwbd3psign3b2ldpkpidnxzkn5"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/rafatosta/zapzap")
    (synopsis "WhatsApp desktop application using PyQt6")
    (description
     "ZapZap is a WhatsApp desktop application written in PyQt6 and
PyQt6-WebEngine, providing a native Linux desktop experience for WhatsApp
messaging.")
    (license license:gpl3+)))

;;;
;;; 8. spicetify-cli — Spotify customization CLI (prebuilt binary)
;;;
(define-public spicetify-cli
  (package
    (name "spicetify-cli")
    (version "2.43.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/spicetify/cli/releases/download/v"
             version "/spicetify-" version "-linux-amd64.tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
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
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (opt (string-append out "/opt/spicetify"))
                 (bin (string-append out "/bin")))
            (mkdir-p opt)
            (invoke tar "xzf" src "-C" opt)
            (chmod (string-append opt "/spicetify") #o755)
            (mkdir-p bin)
            (symlink (string-append opt "/spicetify")
                     (string-append bin "/spicetify"))
            #t))))
    (native-inputs (list tar gzip))
    (home-page "https://github.com/spicetify/cli")
    (synopsis "Command-line tool to customize Spotify client")
    (description
     "spicetify-cli is a command-line tool to customize the official Spotify
client, allowing users to apply themes, extensions, and other modifications
to the Spotify desktop app.")
    (license license:lgpl2.1+)))

;;;
;;; 9. ttf-ms-fonts — Microsoft core TrueType fonts
;;;
(define-public ttf-ms-fonts
  (package
    (name "ttf-ms-fonts")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloads.sourceforge.net/project/corefonts/the%20fonts/final/andale32.exe")
       (file-name "andale32.exe")
       (sha256
        (base32 "0w7927hlwayqf3vvanf8f3qp2g1i404jzqvhp1z3mp0sjm1gw905"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (cabextract (search-input-file %build-inputs "/bin/cabextract"))
                 (font-dir (string-append out "/share/fonts/truetype/msttcorefonts"))
                 (tmpdir (string-append (getcwd) "/extract")))
            (mkdir-p font-dir)
            (mkdir-p tmpdir)
            (for-each
             (lambda (input-name)
               (let ((src (assoc-ref %build-inputs input-name)))
                 (when src
                   (invoke cabextract "-q" "-L" "-d" tmpdir src))))
             '("source" "arial" "arialb" "comic" "courier"
               "georgia" "impact" "times" "trebuchet" "verdana" "webdings"))
            ;; Install all extracted TTF files
            (for-each
             (lambda (f)
               (when (or (string-suffix? ".ttf" f) (string-suffix? ".TTF" f))
                 (install-file (string-append tmpdir "/" f) font-dir)))
             (scandir tmpdir))
            #t))))
    (native-inputs
     (list 
cabextract
           (list "arial"
                 (origin
                   (method url-fetch)
                   (uri "https://downloads.sourceforge.net/project/corefonts/the%20fonts/final/arial32.exe")
                   (file-name "arial32.exe")
                   (sha256 (base32 "1xkqyivbyb3z9dcalzidf8m4npzfpls2g0kldyn8g73f2i6plac5"))))
           (list "arialb"
                 (origin
                   (method url-fetch)
                   (uri "https://downloads.sourceforge.net/project/corefonts/the%20fonts/final/arialb32.exe")
                   (file-name "arialb32.exe")
                   (sha256 (base32 "1a60zqrg63kjnykh5hz7dbpzvx7lyivn3vbrp7jyv9d1nvzz09d4"))))
           (list "comic"
                 (origin
                   (method url-fetch)
                   (uri "https://downloads.sourceforge.net/project/corefonts/the%20fonts/final/comic32.exe")
                   (file-name "comic32.exe")
                   (sha256 (base32 "0ki0rljjc1pxkbsxg515fwx15yc95bdyaksa3pjd89nyxzzg6vcw"))))
           (list "courier"
                 (origin
                   (method url-fetch)
                   (uri "https://downloads.sourceforge.net/project/corefonts/the%20fonts/final/courie32.exe")
                   (file-name "courie32.exe")
                   (sha256 (base32 "111k3waxki9yyxpjwl2qrdkswvsd2dmvhbjmmrwyipam2s31sldv"))))
           (list "georgia"
                 (origin
                   (method url-fetch)
                   (uri "https://downloads.sourceforge.net/project/corefonts/the%20fonts/final/georgi32.exe")
                   (file-name "georgi32.exe")
                   (sha256 (base32 "0083jcpd837j2c06kp1q8glfjn9k7z6vg3wi137savk0lv6psb1c"))))
           (list "impact"
                 (origin
                   (method url-fetch)
                   (uri "https://downloads.sourceforge.net/project/corefonts/the%20fonts/final/impact32.exe")
                   (file-name "impact32.exe")
                   (sha256 (base32 "1yyc5z7zmm3s418hmrkmc8znc55afsrz5dgxblpn9n81fhxyyqb0"))))
           (list "times"
                 (origin
                   (method url-fetch)
                   (uri "https://downloads.sourceforge.net/project/corefonts/the%20fonts/final/times32.exe")
                   (file-name "times32.exe")
                   (sha256 (base32 "1aq7z3l46vwgqljvq9zfgkii6aivy00z1529qbjkspggqrg5jmnv"))))
           (list "trebuchet"
                 (origin
                   (method url-fetch)
                   (uri "https://downloads.sourceforge.net/project/corefonts/the%20fonts/final/trebuc32.exe")
                   (file-name "trebuc32.exe")
                   (sha256 (base32 "1jfsgz80pvyqvpfpaiz5pd8zwlcn67rg2jgynjwf22sip2dhssas"))))
           (list "verdana"
                 (origin
                   (method url-fetch)
                   (uri "https://downloads.sourceforge.net/project/corefonts/the%20fonts/final/verdan32.exe")
                   (file-name "verdan32.exe")
                   (sha256 (base32 "15mdbbfqbyp25a6ynik3rck3m3mg44plwrj79rwncc9nbqjn3jy1"))))
           (list "webdings"
                 (origin
                   (method url-fetch)
                   (uri "https://downloads.sourceforge.net/project/corefonts/the%20fonts/final/webdin32.exe")
                   (file-name "webdin32.exe")
                   (sha256 (base32 "0nnp2znmnmx87ijq9zma0vl0hd46npx38p0cc6lgp00hpid5nnb4"))))))
    (home-page "http://corefonts.sourceforge.net")
    (synopsis "Microsoft core TrueType fonts")
    (description
     "This package provides the Microsoft core TrueType fonts including
Arial, Comic Sans, Courier New, Georgia, Impact, Times New Roman,
Trebuchet MS, Verdana, Webdings, and Andale Mono.")
    (license #f)))

;;;
;;; 10. mullvad-vpn-bin — Mullvad VPN client (prebuilt binary from .deb)
;;;
(define-public mullvad-vpn-bin
  (package
    (name "mullvad-vpn-bin")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cdn.mullvad.net/app/desktop/releases/"
             version "/MullvadVPN-" version "_amd64.deb"))
       (file-name (string-append name "-" version ".deb"))
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
                 (ar  (search-input-file %build-inputs "/bin/ar"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz  (search-input-file %build-inputs "/bin/xz"))
                 (cwd (getcwd))
                 (opt (string-append out "/opt/mullvad-vpn"))
                 (bin (string-append out "/bin")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            (mkdir-p opt)
            (when (file-exists? (string-append cwd "/opt/Mullvad VPN"))
              (copy-recursively (string-append cwd "/opt/Mullvad VPN") opt))
            (mkdir-p bin)
            (when (file-exists? (string-append opt "/mullvad-vpn"))
              (symlink (string-append opt "/mullvad-vpn")
                       (string-append bin "/mullvad-vpn")))
            (when (file-exists? (string-append cwd "/usr/bin/mullvad"))
              (install-file (string-append cwd "/usr/bin/mullvad") bin)
              (chmod (string-append bin "/mullvad") #o755))
            (let ((desktop-dir (string-append out "/share/applications"))
                  (src-desktop (string-append cwd "/usr/share/applications")))
              (when (file-exists? src-desktop)
                (mkdir-p desktop-dir)
                (copy-recursively src-desktop desktop-dir)))
            (let ((icons-dir (string-append out "/share/icons"))
                  (src-icons (string-append cwd "/usr/share/icons")))
              (when (file-exists? src-icons)
                (mkdir-p icons-dir)
                (copy-recursively src-icons icons-dir)))
            #t))))
    (native-inputs (list binutils tar xz))
    (home-page "https://mullvad.net")
    (synopsis "Mullvad VPN client (prebuilt binary)")
    (description
     "Mullvad VPN is a privacy-focused VPN service client.  This package
repackages the official upstream binary .deb release for Linux x86_64.")
    (license license:gpl3+)))
