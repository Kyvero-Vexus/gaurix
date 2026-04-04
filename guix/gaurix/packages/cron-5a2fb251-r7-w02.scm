;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Package definitions for cron-5a2fb251 worker 02.
;;; Resolves: spicetify-cli, mullvad-vpn-bin, ttf-ms-fonts, xnviewmp
;;; Blocked: bottles, pinta, freefilesync, downgrade,
;;;          lib32-opencl-nvidia-580xx, lib32-nvidia-580xx-utils

(define-module (gaurix packages cron-5a2fb251-r7-w02)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system copy)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (spicetify-cli
            mullvad-vpn-bin
            ttf-ms-fonts
            xnviewmp))

;; ---------------------------------------------------------------
;; 1. spicetify-cli — Command-line tool to customize Spotify client
;; ---------------------------------------------------------------
(define-public spicetify-cli
  (package
    (name "spicetify-cli")
    (version "2.42.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/spicetify/cli/releases/download/v"
             version "/spicetify-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "1vibxsrjcmzpglmz1l2jgzza61fdk3d8giv9apcyy306kq1h6wnx"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/src"))
                 (bin (string-append out "/bin"))
                 (share (string-append out "/share/spicetify-cli")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (mkdir-p share)
            (copy-recursively tmp share)
            (mkdir-p bin)
            (symlink (string-append share "/spicetify")
                     (string-append bin "/spicetify"))
            #t))))
    (native-inputs (list tar gzip))
    (home-page "https://spicetify.app/")
    (synopsis "Command-line tool to customize Spotify client")
    (description
     "Spicetify is a command-line tool to customize the official Spotify client.
It supports changing themes, adding extensions, custom apps, and more.
This package repackages the upstream pre-built Linux binary.")
    (license license:lgpl2.1+)))

;; ---------------------------------------------------------------
;; 2. mullvad-vpn-bin — The Mullvad VPN client app for desktop
;; ---------------------------------------------------------------
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
    (native-inputs (list binutils tar xz))
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
                 (xz  (search-input-file %build-inputs "/bin/xz")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            ;; Install everything from extracted usr/ and opt/
            (when (file-exists? "opt")
              (copy-recursively "opt" (string-append out "/opt")))
            (when (file-exists? "usr")
              (for-each
               (lambda (subdir)
                 (let ((src-dir (string-append "usr/" subdir))
                       (dst-dir (string-append out "/" subdir)))
                   (when (file-exists? src-dir)
                     (copy-recursively src-dir dst-dir))))
               '("bin" "share" "lib")))
            #t))))
    (home-page "https://mullvad.net")
    (synopsis "Mullvad VPN client application for desktop")
    (description
     "The Mullvad VPN client application provides a simple interface for
using the Mullvad VPN service.  This package repackages the upstream
pre-built .deb binary for Linux amd64.")
    (license license:gpl3+)))

;; ---------------------------------------------------------------
;; 3. ttf-ms-fonts — Core TTF Fonts from Microsoft
;; ---------------------------------------------------------------

(define %corefonts-base-url
  "https://sourceforge.net/projects/corefonts/files/the%20fonts/final/")

(define (corefonts-origin name hash)
  "Return an origin for a Microsoft core font EXE."
  (origin
    (method url-fetch)
    (uri (string-append %corefonts-base-url name ".exe/download"))
    (file-name (string-append name ".exe"))
    (sha256 (base32 hash))))

(define-public ttf-ms-fonts
  (package
    (name "ttf-ms-fonts")
    (version "2.0")
    (source
     (corefonts-origin
      "arial32"
      "1xkqyivbyb3z9dcalzidf8m4npzfpls2g0kldyn8g73f2i6plac5"))
    (build-system trivial-build-system)
    (native-inputs
     `(("cabextract" ,cabextract)
       ("andale32"
        ,(corefonts-origin
          "andale32"
          "0w7927hlwayqf3vvanf8f3qp2g1i404jzqvhp1z3mp0sjm1gw905"))
       ("arialb32"
        ,(corefonts-origin
          "arialb32"
          "1a60zqrg63kjnykh5hz7dbpzvx7lyivn3vbrp7jyv9d1nvzz09d4"))
       ("comic32"
        ,(corefonts-origin
          "comic32"
          "0ki0rljjc1pxkbsxg515fwx15yc95bdyaksa3pjd89nyxzzg6vcw"))
       ("courie32"
        ,(corefonts-origin
          "courie32"
          "111k3waxki9yyxpjwl2qrdkswvsd2dmvhbjmmrwyipam2s31sldv"))
       ("georgi32"
        ,(corefonts-origin
          "georgi32"
          "0083jcpd837j2c06kp1q8glfjn9k7z6vg3wi137savk0lv6psb1c"))
       ("impact32"
        ,(corefonts-origin
          "impact32"
          "1yyc5z7zmm3s418hmrkmc8znc55afsrz5dgxblpn9n81fhxyyqb0"))
       ("times32"
        ,(corefonts-origin
          "times32"
          "1aq7z3l46vwgqljvq9zfgkii6aivy00z1529qbjkspggqrg5jmnv"))
       ("trebuc32"
        ,(corefonts-origin
          "trebuc32"
          "1jfsgz80pvyqvpfpaiz5pd8zwlcn67rg2jgynjwf22sip2dhssas"))
       ("verdan32"
        ,(corefonts-origin
          "verdan32"
          "15mdbbfqbyp25a6ynik3rck3m3mg44plwrj79rwncc9nbqjn3jy1"))
       ("webdin32"
        ,(corefonts-origin
          "webdin32"
          "0nnp2znmnmx87ijq9zma0vl0hd46npx38p0cc6lgp00hpid5nnb4"))))
    (arguments
     (list
      #:modules '((guix build utils)
                  (ice-9 ftw))
      #:builder
      #~(begin
          (use-modules (guix build utils)
                       (ice-9 ftw))
          (let* ((out (assoc-ref %outputs "out"))
                 (fonts-dir (string-append out "/share/fonts/truetype/msttcorefonts"))
                 (cabextract (search-input-file %build-inputs "/bin/cabextract"))
                 (tmp (string-append (getcwd) "/tmp")))
            (mkdir-p tmp)
            (mkdir-p fonts-dir)
            ;; Extract each font exe with cabextract
            (for-each
             (lambda (input-pair)
               (let ((name (car input-pair))
                     (path (cdr input-pair)))
                 (when (and (string? path)
                            (or (string-suffix? ".exe" path)
                                (string-suffix? ".exe" name)))
                   (invoke cabextract "-L" "-d" tmp path))))
             %build-inputs)
            ;; Also extract the main source (arial32)
            (invoke cabextract "-L" "-d" tmp
                    (assoc-ref %build-inputs "source"))
            ;; Copy all .ttf files to the output
            (let ((files (scandir tmp)))
              (for-each
               (lambda (f)
                 (when (string-suffix? ".ttf" f)
                   (install-file (string-append tmp "/" f) fonts-dir)))
               (or files '())))
            #t))))
    (home-page "http://corefonts.sourceforge.net/")
    (synopsis "Core TrueType fonts from Microsoft")
    (description
     "This package provides the Microsoft TrueType core fonts for the Web,
including Arial, Times New Roman, Courier New, Verdana, Georgia, Comic Sans,
Impact, Trebuchet, Andale Mono, and Webdings.")
    (license (license:non-copyleft
              "https://corefonts.sourceforge.net/eula.htm"
              "Microsoft EULA for core fonts"))))

;; ---------------------------------------------------------------
;; 7. xnviewmp — Efficient multimedia viewer, browser and converter
;; ---------------------------------------------------------------
(define-public xnviewmp
  (package
    (name "xnviewmp")
    (version "1.10.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://download.xnview.com/XnViewMP-linux-x64.deb")
       (file-name (string-append "xnviewmp-" version "-linux-x64.deb"))
       (sha256
        (base32 "0vxvvfmwi411sq4si7myjf2kr96k9gy8krvxb74dajh8pam28x6z"))))
    (build-system trivial-build-system)
    (native-inputs (list binutils tar xz))
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
                 (opt-out (string-append out "/opt/XnView"))
                 (bin-out (string-append out "/bin"))
                 (apps-out (string-append out "/share/applications"))
                 (pixmaps-out (string-append out "/share/pixmaps")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            (when (file-exists? "opt/XnView")
              (mkdir-p opt-out)
              (copy-recursively "opt/XnView" opt-out))
            (when (file-exists? (string-append opt-out "/xnview.sh"))
              (chmod (string-append opt-out "/xnview.sh") #o755))
            (mkdir-p bin-out)
            (symlink (string-append opt-out "/xnview.sh")
                     (string-append bin-out "/xnviewmp"))
            (mkdir-p apps-out)
            (call-with-output-file
                (string-append apps-out "/xnviewmp.desktop")
              (lambda (p)
                (display
                 (string-append
                  "[Desktop Entry]\n"
                  "Type=Application\n"
                  "Name=XnView MP\n"
                  "Exec=xnviewmp %F\n"
                  "Icon=xnviewmp\n"
                  "Categories=Graphics;Viewer;\n"
                  "Terminal=false\n")
                 p)))
            (mkdir-p pixmaps-out)
            (when (file-exists? (string-append opt-out "/xnview.png"))
              (copy-file (string-append opt-out "/xnview.png")
                         (string-append pixmaps-out "/xnviewmp.png")))
            #t))))
    (home-page "https://www.xnview.com/en/xnviewmp/")
    (synopsis "Efficient multimedia viewer, browser and converter")
    (description
     "XnView MP is a versatile and powerful photo viewer, image management,
image resizer.  It supports more than 500 image formats.  This package
repackages the upstream proprietary binary for Linux x86_64.")
    (license #f)))

;; ---------------------------------------------------------------
;; BLOCKED packages — documented below with reasons
;; ---------------------------------------------------------------

;; 4. bottles (v63.0) — BLOCKED
;;    Reason: Complex Python/Meson/GTK4/libadwaita application with extensive
;;    runtime dependencies (patool, fvs, chardet, markdown, Blueprint files).
;;    No pre-built Linux binary available. Would require packaging multiple
;;    missing Python dependencies and Blueprint compiler support.
;;    Approaches tried: Checked GitHub releases (no binaries), verified
;;    core deps (libadwaita, gtk4) exist but Bottles needs custom Blueprint
;;    compilation and many unpackaged Python deps.

;; 5. pinta (v3.1.1) — BLOCKED
;;    Reason: .NET/C# application requiring .NET 8+ SDK to build from source.
;;    Guix has mono but not the modern .NET SDK (dotnet-sdk-8.0+).
;;    No pre-built Linux binary available on GitHub (only Windows/Mac).
;;    Approaches tried: Checked GitHub releases (source-only for Linux),
;;    checked Guix for dotnet packages (only mono available, not .NET 8+),
;;    looked for Flatpak/AppImage alternatives (none found).

;; 6. freefilesync (v14.8) — BLOCKED
;;    Reason: Source download from freefilesync.org is behind a JavaScript
;;    redirect / donation wall that returns an HTML page instead of the
;;    actual ZIP file.  Cannot be automatically fetched by guix download.
;;    No GitHub mirror or alternative download source available.
;;    Approaches tried: Attempted guix download of source ZIP (got HTML page),
;;    searched for alternative mirrors (none found), checked for binary
;;    distributions (none available for Linux).

;; 8. downgrade (v12.0.1) — BLOCKED
;;    Reason: Arch-Linux-only tool that depends on pacman, makepkg, and the
;;    Arch Linux Archive (ALA).  The script is fundamentally tied to pacman
;;    package management and has no use on non-Arch systems.
;;    Approaches tried: Downloaded source (v12.0.1 tarball available),
;;    reviewed script contents — it requires pacman, pacdiff, and Arch
;;    infrastructure.  Creating a package would install a non-functional
;;    script on Guix systems.

;; 9. lib32-opencl-nvidia-580xx (v580.142) — BLOCKED
;;    Reason: NVIDIA proprietary driver packages are not available in Guix's
;;    package collection.  This is a 32-bit compatibility alias for NVIDIA
;;    OpenCL libraries that would need to inherit from a base nvidia-driver
;;    package which does not exist.  Guix uses the nonguix channel for
;;    NVIDIA drivers.
;;    Approaches tried: Searched Guix packages for nvidia (none found),
;;    checked for opencl packages (no NVIDIA-specific ones), cannot create
;;    an alias without a base package to inherit from.

;; 10. lib32-nvidia-580xx-utils (v580.142) — BLOCKED
;;     Reason: Same as lib32-opencl-nvidia-580xx above.  Requires a base
;;     NVIDIA driver/utils package in Guix which does not exist in the
;;     default channels.
;;     Approaches tried: Same as #9.
