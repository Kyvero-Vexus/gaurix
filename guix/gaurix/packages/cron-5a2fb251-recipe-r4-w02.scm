;;; Worker 02 batch: resolve NEEDS_RECIPE_DESIGN packages.
(define-module (gaurix packages cron-5a2fb251-recipe-r4-w02)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression))

;; ──────────────────────────────────────────────
;; 1. mullvad-vpn-bin — Mullvad VPN desktop client (binary .deb repackage)
;; ──────────────────────────────────────────────
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
                 (xz  (search-input-file %build-inputs "/bin/xz"))
                 (cwd (getcwd)))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            ;; Install opt directory (main Electron app)
            (let ((opt-src (string-append cwd "/opt/Mullvad VPN"))
                  (opt-out (string-append out "/opt/mullvad-vpn")))
              (mkdir-p opt-out)
              (copy-recursively opt-src opt-out))
            ;; Install binaries
            (let ((bin-out (string-append out "/bin")))
              (mkdir-p bin-out)
              (for-each
               (lambda (name)
                 (let ((src-bin (string-append cwd "/usr/bin/" name)))
                   (when (file-exists? src-bin)
                     (copy-file src-bin (string-append bin-out "/" name))
                     (chmod (string-append bin-out "/" name) #o755))))
               '("mullvad" "mullvad-daemon" "mullvad-exclude"
                 "mullvad-problem-report")))
            ;; Install desktop file
            (let ((apps-out (string-append out "/share/applications")))
              (mkdir-p apps-out)
              (copy-file (string-append cwd "/usr/share/applications/mullvad-vpn.desktop")
                         (string-append apps-out "/mullvad-vpn.desktop")))
            ;; Install icons
            (let ((icons-src (string-append cwd "/usr/share/icons"))
                  (icons-out (string-append out "/share/icons")))
              (when (file-exists? icons-src)
                (copy-recursively icons-src icons-out)))
            #t))))
    (home-page "https://mullvad.net")
    (synopsis "Mullvad VPN desktop client (prebuilt binary)")
    (description
     "Binary repackaging of the Mullvad VPN desktop client for Linux.
Mullvad VPN is a privacy-focused VPN service.")
    (license license:gpl3+)))

;; ──────────────────────────────────────────────
;; 2. spicetify-cli — Spotify customization CLI (prebuilt Go binary)
;; ──────────────────────────────────────────────
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
       (sha256
        (base32 "1gnd2zwrjlvf5is5n14hr0iskagy5v4343zya8rbpyb3fy89g8vz"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils)
                  (ice-9 ftw))
      #:builder
      #~(begin
          (use-modules (guix build utils)
                       (ice-9 ftw))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar-bin (search-input-file %build-inputs "/bin/tar"))
                 (gz  (search-input-file %build-inputs "/bin/gzip"))
                 (cwd (getcwd))
                 (lib (string-append out "/lib/spicetify-cli"))
                 (bin (string-append out "/bin")))
            (invoke tar-bin "--use-compress-program" gz "-xf" src "-C" cwd)
            (mkdir-p lib)
            ;; Copy everything to lib dir
            (for-each
             (lambda (entry)
               (unless (or (string=? entry ".") (string=? entry ".."))
                 (let ((s (string-append cwd "/" entry))
                       (d (string-append lib "/" entry)))
                   (if (file-is-directory? s)
                       (copy-recursively s d)
                       (copy-file s d)))))
             (scandir cwd))
            ;; Make binary executable
            (chmod (string-append lib "/spicetify") #o755)
            ;; Symlink to bin
            (mkdir-p bin)
            (symlink (string-append lib "/spicetify")
                     (string-append bin "/spicetify"))
            #t))))
    (home-page "https://spicetify.app")
    (synopsis "Command-line tool to customize the Spotify client")
    (description
     "Spicetify is a command-line tool to customize the official Spotify
client.  Supports custom themes, extensions, and apps.")
    (license license:lgpl2.1+)))

;; ──────────────────────────────────────────────
;; 3. ttf-ms-fonts — Microsoft core TrueType fonts
;; ──────────────────────────────────────────────
(define %msfonts-base-url
  "https://downloads.sourceforge.net/project/corefonts/the%20fonts/final")

(define %andale-exe
  (origin
    (method url-fetch)
    (uri (string-append %msfonts-base-url "/andale32.exe"))
    (sha256 (base32 "0w7927hlwayqf3vvanf8f3qp2g1i404jzqvhp1z3mp0sjm1gw905"))))

(define %arial-exe
  (origin
    (method url-fetch)
    (uri (string-append %msfonts-base-url "/arial32.exe"))
    (sha256 (base32 "1xkqyivbyb3z9dcalzidf8m4npzfpls2g0kldyn8g73f2i6plac5"))))

(define %arialb-exe
  (origin
    (method url-fetch)
    (uri (string-append %msfonts-base-url "/arialb32.exe"))
    (sha256 (base32 "1a60zqrg63kjnykh5hz7dbpzvx7lyivn3vbrp7jyv9d1nvzz09d4"))))

(define %comic-exe
  (origin
    (method url-fetch)
    (uri (string-append %msfonts-base-url "/comic32.exe"))
    (sha256 (base32 "0ki0rljjc1pxkbsxg515fwx15yc95bdyaksa3pjd89nyxzzg6vcw"))))

(define %courier-exe
  (origin
    (method url-fetch)
    (uri (string-append %msfonts-base-url "/courie32.exe"))
    (sha256 (base32 "111k3waxki9yyxpjwl2qrdkswvsd2dmvhbjmmrwyipam2s31sldv"))))

(define %georgia-exe
  (origin
    (method url-fetch)
    (uri (string-append %msfonts-base-url "/georgi32.exe"))
    (sha256 (base32 "0083jcpd837j2c06kp1q8glfjn9k7z6vg3wi137savk0lv6psb1c"))))

(define %impact-exe
  (origin
    (method url-fetch)
    (uri (string-append %msfonts-base-url "/impact32.exe"))
    (sha256 (base32 "1yyc5z7zmm3s418hmrkmc8znc55afsrz5dgxblpn9n81fhxyyqb0"))))

(define %times-exe
  (origin
    (method url-fetch)
    (uri (string-append %msfonts-base-url "/times32.exe"))
    (sha256 (base32 "1aq7z3l46vwgqljvq9zfgkii6aivy00z1529qbjkspggqrg5jmnv"))))

(define %trebuchet-exe
  (origin
    (method url-fetch)
    (uri (string-append %msfonts-base-url "/trebuc32.exe"))
    (sha256 (base32 "1jfsgz80pvyqvpfpaiz5pd8zwlcn67rg2jgynjwf22sip2dhssas"))))

(define %verdana-exe
  (origin
    (method url-fetch)
    (uri (string-append %msfonts-base-url "/verdan32.exe"))
    (sha256 (base32 "15mdbbfqbyp25a6ynik3rck3m3mg44plwrj79rwncc9nbqjn3jy1"))))

(define %webdings-exe
  (origin
    (method url-fetch)
    (uri (string-append %msfonts-base-url "/webdin32.exe"))
    (sha256 (base32 "0nnp2znmnmx87ijq9zma0vl0hd46npx38p0cc6lgp00hpid5nnb4"))))

(define-public ttf-ms-fonts
  (package
    (name "ttf-ms-fonts")
    (version "2.0")
    (source %arial-exe)
    (build-system trivial-build-system)
    (native-inputs
     `(("cabextract" ,cabextract)
       ("andale" ,%andale-exe)
       ("arialb" ,%arialb-exe)
       ("comic" ,%comic-exe)
       ("courier" ,%courier-exe)
       ("georgia" ,%georgia-exe)
       ("impact" ,%impact-exe)
       ("times" ,%times-exe)
       ("trebuchet" ,%trebuchet-exe)
       ("verdana" ,%verdana-exe)
       ("webdings" ,%webdings-exe)))
    (arguments
     (list
      #:modules '((guix build utils)
                  (ice-9 ftw))
      #:builder
      #~(begin
          (use-modules (guix build utils)
                       (ice-9 ftw))
          (let* ((out (assoc-ref %outputs "out"))
                 (cabextract (search-input-file %build-inputs "/bin/cabextract"))
                 (font-dir (string-append out "/share/fonts/truetype/msttcorefonts"))
                 (cwd (getcwd))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p font-dir)
            ;; Extract from source (arial32.exe)
            (invoke cabextract "-q" "-d" cwd src)
            ;; Extract from additional font sources
            (for-each
             (lambda (input-name)
               (let ((f (assoc-ref %build-inputs input-name)))
                 (when f
                   (invoke cabextract "-q" "-d" cwd f))))
             '("andale" "arialb" "comic" "courier" "georgia"
               "impact" "times" "trebuchet" "verdana" "webdings"))
            ;; Install all TTF files
            (for-each
             (lambda (f)
               (when (or (string-suffix? ".ttf" f)
                         (string-suffix? ".TTF" f))
                 (install-file (string-append cwd "/" f) font-dir)))
             (scandir cwd))
            #t))))
    (home-page "http://corefonts.sourceforge.net")
    (synopsis "Microsoft core TrueType fonts")
    (description
     "Core TrueType fonts from Microsoft, including Arial, Comic Sans MS,
Courier New, Georgia, Impact, Times New Roman, Trebuchet MS, Verdana,
Webdings, and Andale Mono.")
    (license (license:non-copyleft
              "https://corefonts.sourceforge.net/eula.htm"
              "Microsoft EULA for core fonts"))))

;; ──────────────────────────────────────────────
;; 4. bottles — Wine prefix manager
;; BLOCKED: complex Python/Meson/GTK4/libadwaita source build.
;; ──────────────────────────────────────────────
(define-public bottles
  (package
    (name "bottles")
    (version "63.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bottlesdevs/Bottles/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "bottles: BLOCKED — complex Python/GTK4/libadwaita source build; needs dedicated packaging effort")))
    (home-page "https://usebottles.com")
    (synopsis "Wine prefix manager (BLOCKED — needs complex source build)")
    (description
     "Bottles is a graphical tool to manage Wine prefixes and run Windows
software on Linux.  BLOCKED: requires Python, Meson, GTK4, libadwaita,
and many GNOME dependencies.")
    (license license:gpl3+)))

;; ──────────────────────────────────────────────
;; 5. pinta — Simple GTK image editor
;; BLOCKED: .NET/C# source build; Guix lacks .NET SDK packaging.
;; ──────────────────────────────────────────────
(define-public pinta
  (package
    (name "pinta")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/PintaProject/Pinta/releases/download/"
             version "/pinta-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "pinta: BLOCKED — .NET/C# source build; Guix lacks .NET SDK packaging")))
    (home-page "https://pinta-project.com")
    (synopsis "Simple GTK image editor (BLOCKED — needs .NET SDK)")
    (description
     "Pinta is a simple drawing/editing program modeled after Paint.NET.
BLOCKED: requires .NET SDK for building, which is not well-supported
in Guix.  No prebuilt Linux binary available.")
    (license license:expat)))

;; ──────────────────────────────────────────────
;; 6. freefilesync — File synchronization tool (binary repackage)
;; ──────────────────────────────────────────────
(define-public freefilesync
  (package
    (name "freefilesync")
    (version "14.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://freefilesync.org/download/FreeFileSync_"
             version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "05xlqgswb6wihdpyddxd45qhq915jy1dxz3k7m5lcwm6qs2ismqb"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils)
                  (rnrs io ports)
                  (rnrs bytevectors))
      #:builder
      #~(begin
          (use-modules (guix build utils)
                       (rnrs io ports)
                       (rnrs bytevectors))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar-bin (search-input-file %build-inputs "/bin/tar"))
                 (gz  (search-input-file %build-inputs "/bin/gzip"))
                 (cwd (getcwd))
                 (opt (string-append out "/opt/freefilesync"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (pixmaps (string-append out "/share/pixmaps")))
            ;; Extract outer tar.gz to get the .run installer
            (invoke tar-bin "--use-compress-program" gz "-xf" src "-C" cwd)
            (let* ((run-file (string-append cwd "/FreeFileSync_"
                                            #$version "_Install.run"))
                   (data (call-with-input-file run-file
                           get-bytevector-all))
                   (len (bytevector-length data)))
              ;; Find embedded gzip stream (deflate method = 0x08)
              (let loop ((i 0))
                (cond
                 ((>= i (- len 3))
                  (error "Could not find embedded tar.gz in .run file"))
                 ((and (= (bytevector-u8-ref data i) #x1f)
                       (= (bytevector-u8-ref data (+ i 1)) #x8b)
                       (= (bytevector-u8-ref data (+ i 2)) #x08))
                  ;; Found gzip header — extract from this offset
                  (let ((tmp-gz (string-append cwd "/embedded.tar.gz")))
                    (call-with-output-file tmp-gz
                      (lambda (port)
                        (put-bytevector port data i (- len i))))
                    (mkdir-p opt)
                    (invoke tar-bin "--use-compress-program" gz
                            "-xf" tmp-gz "-C" opt)
                    ;; Make binaries executable
                    (for-each
                     (lambda (name)
                       (let ((f (string-append opt "/" name)))
                         (when (file-exists? f)
                           (chmod f #o755))))
                     '("FreeFileSync" "RealTimeSync"))
                    ;; Create bin symlinks
                    (mkdir-p bin)
                    (symlink (string-append opt "/FreeFileSync")
                             (string-append bin "/freefilesync"))
                    (symlink (string-append opt "/RealTimeSync")
                             (string-append bin "/realtimesync"))
                    ;; Desktop file
                    (mkdir-p apps)
                    (call-with-output-file
                        (string-append apps "/freefilesync.desktop")
                      (lambda (p)
                        (display
                         (string-append
                          "[Desktop Entry]\n"
                          "Type=Application\n"
                          "Name=FreeFileSync\n"
                          "Exec=freefilesync\n"
                          "Icon=freefilesync\n"
                          "Categories=Utility;FileTools;\n"
                          "Terminal=false\n")
                         p)))
                    ;; Icon
                    (mkdir-p pixmaps)
                    (let ((png (string-append opt
                                             "/Resources/FreeFileSync.png")))
                      (when (file-exists? png)
                        (copy-file png
                                   (string-append pixmaps
                                                  "/freefilesync.png"))))))
                 (else (loop (+ i 1))))))
            #t))))
    (home-page "https://freefilesync.org")
    (synopsis "Folder comparison and synchronization software")
    (description
     "FreeFileSync is a folder comparison and synchronization software that
creates and manages backup copies of files.  This package repackages the
official Linux binary distribution.")
    (license (license:non-copyleft
              "https://freefilesync.org/license.php"
              "FreeFileSync license"))))

;; ──────────────────────────────────────────────
;; 7. xnviewmp — Image viewer/browser (binary .deb repackage)
;; ──────────────────────────────────────────────
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
                 (cwd (getcwd))
                 (opt (string-append out "/opt/xnviewmp"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (pixmaps (string-append out "/share/pixmaps")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            ;; Install opt directory
            (mkdir-p opt)
            (copy-recursively (string-append cwd "/opt/XnView") opt)
            ;; Make binary executable
            (chmod (string-append opt "/XnView") #o755)
            (when (file-exists? (string-append opt "/xnview.sh"))
              (chmod (string-append opt "/xnview.sh") #o755))
            ;; Create bin symlink
            (mkdir-p bin)
            (symlink (string-append opt "/XnView")
                     (string-append bin "/xnviewmp"))
            ;; Desktop file
            (mkdir-p apps)
            (call-with-output-file (string-append apps "/xnviewmp.desktop")
              (lambda (p)
                (display
                 (string-append
                  "[Desktop Entry]\n"
                  "Type=Application\n"
                  "Name=XnView MP\n"
                  "Exec=xnviewmp %F\n"
                  "Icon=xnviewmp\n"
                  "Categories=Graphics;Viewer;\n"
                  "MimeType=image/jpeg;image/png;image/gif;image/bmp;\n"
                  "Terminal=false\n")
                 p)))
            ;; Icon
            (mkdir-p pixmaps)
            (let ((png (string-append opt "/xnview.png")))
              (when (file-exists? png)
                (copy-file png (string-append pixmaps "/xnviewmp.png"))))
            #t))))
    (home-page "https://www.xnview.com/en/xnviewmp/")
    (synopsis "Image viewer, browser, and converter")
    (description
     "XnView MP is an efficient cross-platform multimedia viewer, browser,
and converter.  This package repackages the official Linux binary.")
    (license (license:non-copyleft
              "https://www.xnview.com/en/license/"
              "XnView freeware license"))))

;; ──────────────────────────────────────────────
;; 8. appimagelauncher — AppImage integration (binary .deb repackage)
;; ──────────────────────────────────────────────
(define-public appimagelauncher
  (package
    (name "appimagelauncher")
    (version "3.0.0-beta-3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/TheAssassin/AppImageLauncher/releases/"
             "download/v" version
             "/appimagelauncher_3.0.0-beta-2-gha287.96cb937_amd64.deb"))
       (sha256
        (base32 "0dhc49h9pvj6l3h1zb0xs8p7lm2zsmgmn1jxjl8q12ln0lhma5s1"))))
    (build-system trivial-build-system)
    (native-inputs (list binutils tar xz))
    (arguments
     (list
      #:modules '((guix build utils)
                  (ice-9 ftw))
      #:builder
      #~(begin
          (use-modules (guix build utils)
                       (ice-9 ftw))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (ar  (search-input-file %build-inputs "/bin/ar"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz  (search-input-file %build-inputs "/bin/xz"))
                 (cwd (getcwd))
                 (opt (string-append out "/opt/appimagelauncher"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (icons-out (string-append out "/share/icons")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            ;; Install the AppDir
            (mkdir-p opt)
            (copy-recursively
             (string-append cwd "/opt/appimagelauncher.AppDir") opt)
            ;; Make binaries executable
            (for-each
             (lambda (name)
               (let ((f (string-append opt "/usr/bin/" name)))
                 (when (file-exists? f) (chmod f #o755))))
             '("AppImageLauncher" "AppImageLauncherSettings"
               "ail-cli" "appimagelauncherd"))
            (when (file-exists? (string-append opt "/AppRun"))
              (chmod (string-append opt "/AppRun") #o755))
            ;; Create bin symlinks
            (mkdir-p bin)
            (for-each
             (lambda (pair)
               (let ((target (string-append opt "/usr/bin/" (car pair)))
                     (link   (string-append bin "/" (cdr pair))))
                 (when (file-exists? target)
                   (symlink target link))))
             '(("AppImageLauncher" . "AppImageLauncher")
               ("AppImageLauncherSettings" . "AppImageLauncherSettings")
               ("ail-cli" . "ail-cli")
               ("appimagelauncherd" . "appimagelauncherd")))
            ;; Desktop files
            (mkdir-p apps)
            (let ((src-apps (string-append opt "/usr/share/applications")))
              (when (file-exists? src-apps)
                (for-each
                 (lambda (f)
                   (unless (or (string=? f ".") (string=? f ".."))
                     (copy-file (string-append src-apps "/" f)
                                (string-append apps "/" f))))
                 (scandir src-apps))))
            ;; Icons
            (let ((src-icons (string-append opt "/usr/share/icons")))
              (when (file-exists? src-icons)
                (copy-recursively src-icons icons-out)))
            #t))))
    (home-page "https://github.com/TheAssassin/AppImageLauncher")
    (synopsis "Helper for running and integrating AppImages")
    (description
     "AppImageLauncher integrates AppImages into the system by registering
them with the desktop environment, managing updates, and providing a
consistent launch experience.")
    (license license:expat)))

;; ──────────────────────────────────────────────
;; 9. rustdesk-bin — Remote desktop software (binary .deb repackage)
;; ──────────────────────────────────────────────
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
                 (cwd (getcwd))
                 (share-out (string-append out "/share"))
                 (bin-out (string-append out "/bin")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            ;; Install rustdesk data
            (let ((rustdesk-src (string-append cwd "/usr/share/rustdesk"))
                  (rustdesk-out (string-append share-out "/rustdesk")))
              (mkdir-p rustdesk-out)
              (copy-recursively rustdesk-src rustdesk-out)
              (chmod (string-append rustdesk-out "/rustdesk") #o755)
              ;; Create bin symlink
              (mkdir-p bin-out)
              (symlink (string-append rustdesk-out "/rustdesk")
                       (string-append bin-out "/rustdesk")))
            ;; Desktop files
            (let ((apps-out (string-append share-out "/applications")))
              (mkdir-p apps-out)
              (for-each
               (lambda (name)
                 (let ((f (string-append cwd "/usr/share/applications/"
                                         name)))
                   (when (file-exists? f)
                     (copy-file f (string-append apps-out "/" name)))))
               '("rustdesk.desktop" "rustdesk-link.desktop")))
            ;; Icons
            (let ((icons-src (string-append cwd "/usr/share/icons"))
                  (icons-out (string-append share-out "/icons")))
              (when (file-exists? icons-src)
                (copy-recursively icons-src icons-out)))
            #t))))
    (home-page "https://rustdesk.com")
    (synopsis "Remote desktop software (prebuilt binary)")
    (description
     "RustDesk is an open-source remote desktop software written in Rust.
Works out of the box with no configuration required.  This package
repackages the official x86_64 Linux .deb binary release.")
    (license license:agpl3+)))

;; ──────────────────────────────────────────────
;; 10. proton-pass-bin — Proton Pass password manager (binary .deb repackage)
;; ──────────────────────────────────────────────
(define-public proton-pass-bin
  (package
    (name "proton-pass-bin")
    (version "1.35.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://proton.me/download/PassDesktop/linux/x64/proton-pass_"
             version "_amd64.deb"))
       (sha256
        (base32 "1ri3mirwf103sap608issk0f81xpdff669qd8gyym91rm47phhbn"))))
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
                 (cwd (getcwd))
                 (opt (string-append out "/opt/proton-pass"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (pixmaps (string-append out "/share/pixmaps")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            ;; Install the Electron app
            (let ((lib-src (string-append cwd "/usr/lib/proton-pass")))
              (mkdir-p opt)
              (copy-recursively lib-src opt))
            ;; Make main binary executable
            (let ((main-bin (string-append opt "/Proton Pass")))
              (when (file-exists? main-bin)
                (chmod main-bin #o755)))
            ;; Create bin wrapper script (handles space in binary name)
            (mkdir-p bin)
            (call-with-output-file (string-append bin "/proton-pass")
              (lambda (p)
                (display
                 (string-append "#!/bin/sh\nexec \""
                                out "/opt/proton-pass/Proton Pass"
                                "\" \"$@\"\n")
                 p)))
            (chmod (string-append bin "/proton-pass") #o755)
            ;; Desktop file
            (mkdir-p apps)
            (let ((f (string-append cwd
                                    "/usr/share/applications/"
                                    "proton-pass.desktop")))
              (when (file-exists? f)
                (copy-file f (string-append apps "/proton-pass.desktop"))))
            ;; Icon
            (mkdir-p pixmaps)
            (let ((icon (string-append cwd
                                       "/usr/share/pixmaps/"
                                       "proton-pass.png")))
              (when (file-exists? icon)
                (copy-file icon
                           (string-append pixmaps "/proton-pass.png"))))
            #t))))
    (home-page "https://proton.me/pass")
    (synopsis "Proton Pass password manager (prebuilt binary)")
    (description
     "Proton Pass is an open-source, end-to-end encrypted password manager
from Proton.  This package repackages the official Linux desktop binary.")
    (license license:gpl3+)))
