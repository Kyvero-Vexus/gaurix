;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Binary/prebuilt application packages (Chunk 1)
;;; Worker: cron-5a2fb251-r3-w01

(define-module (gaurix packages cron-5a2fb251-r3-w01)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression))

;;;
;;; 1. vscodium-bin
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
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/src"))
                 (opt (string-append out "/opt/vscodium"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (pixmaps (string-append out "/share/pixmaps")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (copy-recursively tmp opt)
            (mkdir-p bin)
            (symlink (string-append opt "/bin/codium")
                     (string-append bin "/codium"))
            (mkdir-p apps)
            (mkdir-p pixmaps)
            (copy-file (string-append opt "/resources/app/resources/linux/code.png")
                       (string-append pixmaps "/vscodium.png"))
            (call-with-output-file (string-append apps "/vscodium.desktop")
              (lambda (p)
                (display
                 (string-append
                  "[Desktop Entry]\n"
                  "Type=Application\n"
                  "Name=VSCodium\n"
                  "Comment=Code Editing. Redefined.\n"
                  "Exec=codium %F\n"
                  "Icon=vscodium\n"
                  "Categories=Development;IDE;\n"
                  "Terminal=false\n")
                 p)))
            #t))))
    (synopsis "VS Code without Microsoft telemetry (prebuilt binary)")
    (description
     "VSCodium is a community-driven, freely-licensed binary distribution of
Microsoft's VS Code editor, without telemetry or tracking.  This package
repackages the upstream x86_64 Linux binary release.")
    (home-page "https://vscodium.com/")
    (license license:expat)))

;;;
;;; 2. vesktop-bin
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
             version "/vesktop_" version "_amd64.deb"))
       (sha256
        (base32 "1x8wqdn6rdjdj6gbzqhzzs8za9hr5fqkrijr3mb061w1wjmrfk1d"))))
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
                 (opt (string-append out "/opt/Vesktop"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (icons (string-append out "/share/icons/hicolor/scalable/apps")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            ;; Copy application files
            (mkdir-p (dirname opt))
            (copy-recursively (string-append cwd "/opt/Vesktop") opt)
            (chmod (string-append opt "/vesktop") #o755)
            ;; Install desktop file
            (mkdir-p apps)
            (copy-file
             (string-append cwd "/usr/share/applications/vesktop.desktop")
             (string-append apps "/vesktop.desktop"))
            (substitute* (string-append apps "/vesktop.desktop")
              (("Exec=.*") "Exec=vesktop %U\n"))
            ;; Install icon
            (mkdir-p icons)
            (copy-file
             (string-append cwd
              "/usr/share/icons/hicolor/scalable/apps/vesktop.svg")
             (string-append icons "/vesktop.svg"))
            ;; Symlink binary
            (mkdir-p bin)
            (symlink (string-append opt "/vesktop")
                     (string-append bin "/vesktop"))
            #t))))
    (synopsis "Enhanced Discord desktop client (prebuilt binary)")
    (description
     "Vesktop is an enhanced Discord desktop client powered by Vencord.  It
features built-in Vencord extensions, screen sharing with audio on Linux,
and other improvements.  This package repackages the upstream amd64 deb.")
    (home-page "https://github.com/Vencord/Vesktop")
    (license license:gpl3)))

;;;
;;; 3. zoom
;;;
(define-public zoom
  (package
    (name "zoom")
    (version "7.0.0.1666")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cdn.zoom.us/prod/" version "/zoom_amd64.deb"))
       (sha256
        (base32 "0bah3kfqligg54arfjr0ajin3gj7asf43cm7v3i3s3q79jqkfqnd"))))
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
                 (opt (string-append out "/opt/zoom"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (pixmaps (string-append out "/share/pixmaps")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            ;; Copy application files
            (mkdir-p (dirname opt))
            (copy-recursively (string-append cwd "/opt/zoom") opt)
            ;; Install desktop file
            (mkdir-p apps)
            (copy-file
             (string-append cwd "/usr/share/applications/Zoom.desktop")
             (string-append apps "/Zoom.desktop"))
            (substitute* (string-append apps "/Zoom.desktop")
              (("Exec=.*") (string-append "Exec=" out
                                          "/opt/zoom/ZoomLauncher %U\n")))
            ;; Install icons
            (mkdir-p pixmaps)
            (copy-file (string-append cwd "/usr/share/pixmaps/Zoom.png")
                       (string-append pixmaps "/Zoom.png"))
            ;; Symlink main binary
            (mkdir-p bin)
            (symlink (string-append opt "/ZoomLauncher")
                     (string-append bin "/zoom"))
            #t))))
    (synopsis "Zoom video conferencing client (prebuilt binary)")
    (description
     "Zoom is a proprietary video conferencing and messaging platform.
This package repackages the upstream amd64 deb release.")
    (home-page "https://zoom.us/")
    ;; Proprietary
    (license #f)))

;;;
;;; 4. ventoy-bin
;;;
(define-public ventoy-bin
  (package
    (name "ventoy-bin")
    (version "1.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ventoy/Ventoy/releases/download/v"
             version "/ventoy-" version "-linux.tar.gz"))
       (sha256
        (base32 "025jpv2rgv362rqgvzpl0j08a4m945k9cjjpzqs2hwdvw7kan4qi"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/src"))
                 (opt (string-append out "/opt/ventoy"))
                 (bin (string-append out "/bin")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (let ((srcdir (string-append tmp "/ventoy-" #$version)))
              (copy-recursively srcdir opt)
              ;; Make scripts executable
              (for-each (lambda (f)
                          (when (file-exists? (string-append opt "/" f))
                            (chmod (string-append opt "/" f) #o755)))
                        '("Ventoy2Disk.sh" "VentoyGUI.x86_64"
                          "CreatePersistentImg.sh" "ExtendPersistentImg.sh"))
              (mkdir-p bin)
              ;; Wrapper scripts
              (call-with-output-file (string-append bin "/ventoy")
                (lambda (p)
                  (display
                   (string-append "#!/bin/sh\nexec " out
                                  "/opt/ventoy/VentoyGUI.x86_64 \"$@\"\n")
                   p)))
              (chmod (string-append bin "/ventoy") #o755)
              (call-with-output-file (string-append bin "/ventoy-cli")
                (lambda (p)
                  (display
                   (string-append "#!/bin/sh\nexec " out
                                  "/opt/ventoy/Ventoy2Disk.sh \"$@\"\n")
                   p)))
              (chmod (string-append bin "/ventoy-cli") #o755))
            #t))))
    (synopsis "Bootable USB solution (prebuilt binary)")
    (description
     "Ventoy is an open source tool to create bootable USB drives.  You
simply copy ISO/IMG files to the USB drive and boot from them directly.
This package repackages the upstream x86_64 Linux binary release.")
    (home-page "https://www.ventoy.net/")
    (license license:gpl3+)))

;;;
;;; 5. zotero-bin
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
    (native-inputs (list tar xz))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/src"))
                 (opt (string-append out "/opt/zotero"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (icons (string-append out "/share/icons/hicolor")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append xz "/bin/xz")
                    "-xf" src "-C" tmp)
            (let ((srcdir (string-append tmp "/Zotero_linux-x86_64")))
              (copy-recursively srcdir opt)
              (chmod (string-append opt "/zotero") #o755)
              (chmod (string-append opt "/zotero-bin") #o755)
              ;; Install desktop file
              (mkdir-p apps)
              (call-with-output-file (string-append apps "/zotero.desktop")
                (lambda (p)
                  (display
                   (string-append
                    "[Desktop Entry]\n"
                    "Type=Application\n"
                    "Name=Zotero\n"
                    "Comment=Open-source reference manager\n"
                    "Exec=" out "/opt/zotero/zotero %U\n"
                    "Icon=zotero\n"
                    "Categories=Office;Science;\n"
                    "Terminal=false\n"
                    "MimeType=x-scheme-handler/zotero;\n")
                   p)))
              ;; Install icons
              (for-each
               (lambda (pair)
                 (let ((src-icon (car pair))
                       (dest-dir (string-append icons "/"
                                                (cdr pair) "/apps")))
                   (when (file-exists?
                          (string-append opt "/icons/" src-icon))
                     (mkdir-p dest-dir)
                     (copy-file (string-append opt "/icons/" src-icon)
                                (string-append dest-dir "/zotero.png")))))
               '(("icon32.png" . "32x32")
                 ("icon64.png" . "64x64")
                 ("icon128.png" . "128x128")))
              ;; Symlink binary
              (mkdir-p bin)
              (symlink (string-append opt "/zotero")
                       (string-append bin "/zotero")))
            #t))))
    (synopsis "Reference manager and research tool (prebuilt binary)")
    (description
     "Zotero is a free, open-source reference management tool for collecting,
organizing, annotating, citing, and sharing research.  This package
repackages the upstream x86_64 Linux binary release.")
    (home-page "https://www.zotero.org/")
    (license license:agpl3+)))

;;;
;;; 6. freetube-bin
;;;
(define-public freetube-bin
  (package
    (name "freetube-bin")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FreeTubeApp/FreeTube/releases/download/v"
             version "-beta/freetube_" version "_beta_amd64.deb"))
       (sha256
        (base32 "0lilc823sg0yfbfx9jzcy0c9n74qiaapi07sb4azyyrcpl6r6xna"))))
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
                 (opt (string-append out "/opt/FreeTube"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (icons (string-append out
                         "/share/icons/hicolor/scalable/apps")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            ;; Copy application files
            (mkdir-p (dirname opt))
            (copy-recursively (string-append cwd "/opt/FreeTube") opt)
            (chmod (string-append opt "/freetube") #o755)
            ;; Install desktop file
            (mkdir-p apps)
            (copy-file
             (string-append cwd
              "/usr/share/applications/freetube.desktop")
             (string-append apps "/freetube.desktop"))
            (substitute* (string-append apps "/freetube.desktop")
              (("Exec=.*") "Exec=freetube %U\n"))
            ;; Install icon
            (mkdir-p icons)
            (copy-file
             (string-append cwd
              "/usr/share/icons/hicolor/scalable/apps/freetube.svg")
             (string-append icons "/freetube.svg"))
            ;; Symlink binary
            (mkdir-p bin)
            (symlink (string-append opt "/freetube")
                     (string-append bin "/freetube"))
            #t))))
    (synopsis "Private YouTube client (prebuilt binary)")
    (description
     "FreeTube is an open source YouTube client built with privacy in mind.
It uses local subscriptions and watch history, and can optionally use the
Invidious API.  This package repackages the upstream amd64 deb.")
    (home-page "https://freetubeapp.io/")
    (license license:agpl3+)))

;;;
;;; 7. anytype-bin
;;;
(define-public anytype-bin
  (package
    (name "anytype-bin")
    (version "0.54.23-alpha")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/anyproto/anytype-ts/releases/download/v"
             version "/anytype_" version "_amd64.deb"))
       (sha256
        (base32 "177a3f6cwxn2gwmnwxsnj6zgckayfwhd4zdb57yfiq3jin997bf2"))))
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
                 (opt (string-append out "/opt/Anytype"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (icons (string-append out "/share/icons/hicolor")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            ;; Copy application files
            (mkdir-p (dirname opt))
            (copy-recursively (string-append cwd "/opt/Anytype") opt)
            (chmod (string-append opt "/anytype") #o755)
            ;; Install desktop file
            (mkdir-p apps)
            (copy-file
             (string-append cwd
              "/usr/share/applications/anytype.desktop")
             (string-append apps "/anytype.desktop"))
            (substitute* (string-append apps "/anytype.desktop")
              (("Exec=.*") "Exec=anytype %U\n"))
            ;; Install icons
            (for-each
             (lambda (res)
               (let ((src-path (string-append cwd "/usr/share/icons/hicolor/"
                                              res "/apps/anytype.png"))
                     (dest-dir (string-append icons "/"
                                              res "/apps")))
                 (when (file-exists? src-path)
                   (mkdir-p dest-dir)
                   (copy-file src-path
                              (string-append dest-dir "/anytype.png")))))
             '("16x16" "32x32" "64x64" "128x128" "256x256"
               "512x512" "1024x1024"))
            ;; Symlink binary
            (mkdir-p bin)
            (symlink (string-append opt "/anytype")
                     (string-append bin "/anytype"))
            #t))))
    (synopsis "Local-first productivity tool (prebuilt binary)")
    (description
     "Anytype is a local-first, peer-to-peer productivity tool for creating
docs, tasks, and knowledge bases.  Data is stored locally and encrypted
end-to-end.  This package repackages the upstream amd64 deb.")
    (home-page "https://anytype.io/")
    ;; Anytype's custom license (source-available, non-free)
    (license #f)))

;;;
;;; 8. proton-pass-bin
;;;
(define-public proton-pass-bin
  (package
    (name "proton-pass-bin")
    (version "1.34.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://proton.me/download/PassDesktop/linux/x64/ProtonPass.deb")
       (file-name (string-append "proton-pass-" version ".deb"))
       (sha256
        (base32 "1qaj36vwyrz4p4ibfwxgsf3hf1yizbr00gw2by1x9nnhxkb1154b"))))
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
            ;; Copy application files
            (mkdir-p (dirname opt))
            (copy-recursively (string-append cwd "/usr/lib/proton-pass")
                              opt)
            (chmod (string-append opt "/Proton Pass") #o755)
            ;; Install desktop file
            (mkdir-p apps)
            (copy-file
             (string-append cwd
              "/usr/share/applications/proton-pass.desktop")
             (string-append apps "/proton-pass.desktop"))
            (substitute* (string-append apps "/proton-pass.desktop")
              (("Exec=.*") "Exec=proton-pass %U\n"))
            ;; Install icon
            (mkdir-p pixmaps)
            (copy-file (string-append cwd
                        "/usr/share/pixmaps/proton-pass.png")
                       (string-append pixmaps "/proton-pass.png"))
            ;; Wrapper script (binary name has a space)
            (mkdir-p bin)
            (call-with-output-file (string-append bin "/proton-pass")
              (lambda (p)
                (display
                 (string-append
                  "#!/bin/sh\nexec \""
                  out "/opt/proton-pass/Proton Pass\" \"$@\"\n")
                 p)))
            (chmod (string-append bin "/proton-pass") #o755)
            #t))))
    (synopsis "Proton Pass password manager (prebuilt binary)")
    (description
     "Proton Pass is an end-to-end encrypted password manager from the makers
of Proton Mail.  This package repackages the upstream amd64 deb release.")
    (home-page "https://proton.me/pass")
    (license license:gpl3+)))

;;;
;;; 9. arduino-ide-bin
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
    (native-inputs (list unzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/src"))
                 (opt (string-append out "/opt/arduino-ide"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (pixmaps (string-append out "/share/pixmaps")))
            (mkdir-p tmp)
            (invoke #$(file-append unzip "/bin/unzip")
                    "-q" src "-d" tmp)
            (let ((srcdir (string-append tmp "/arduino-ide_"
                                         #$version "_Linux_64bit")))
              (copy-recursively srcdir opt)
              (chmod (string-append opt "/arduino-ide") #o755))
            (mkdir-p bin)
            (symlink (string-append opt "/arduino-ide")
                     (string-append bin "/arduino-ide"))
            ;; Desktop file
            (mkdir-p apps)
            (call-with-output-file
                (string-append apps "/arduino-ide.desktop")
              (lambda (p)
                (display
                 (string-append
                  "[Desktop Entry]\n"
                  "Type=Application\n"
                  "Name=Arduino IDE\n"
                  "Comment=Arduino IDE 2.x\n"
                  "Exec=arduino-ide %F\n"
                  "Icon=arduino-ide\n"
                  "Categories=Development;Electronics;\n"
                  "Terminal=false\n")
                 p)))
            #t))))
    (synopsis "Arduino IDE 2.x (prebuilt binary)")
    (description
     "Arduino IDE is the development environment for Arduino boards.  This
package installs the upstream Linux x86_64 binary distribution.")
    (home-page "https://www.arduino.cc/en/software")
    ;; Arduino IDE uses AGPL-3.0 for its source
    (license license:agpl3+)))

;;;
;;; 10. minecraft-launcher
;;;
(define-public minecraft-launcher
  (package
    (name "minecraft-launcher")
    (version "2.1.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://launcher.mojang.com/download/Minecraft.deb")
       (file-name (string-append "minecraft-launcher-" version ".deb"))
       (sha256
        (base32 "1vp93g4q2zqzldh12klr7va3w54vmkfdkjcysg4v45dj4599x0yy"))))
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
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (icons (string-append out
                         "/share/icons/hicolor/symbolic/apps")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            ;; Install binary
            (mkdir-p bin)
            (copy-file (string-append cwd
                        "/usr/bin/minecraft-launcher")
                       (string-append bin "/minecraft-launcher"))
            (chmod (string-append bin "/minecraft-launcher") #o755)
            ;; Install desktop file
            (mkdir-p apps)
            (copy-file
             (string-append cwd
              "/usr/share/applications/minecraft-launcher.desktop")
             (string-append apps "/minecraft-launcher.desktop"))
            ;; Install icon
            (mkdir-p icons)
            (copy-file
             (string-append cwd
              "/usr/share/icons/hicolor/symbolic/apps/minecraft-launcher.svg")
             (string-append icons "/minecraft-launcher.svg"))
            #t))))
    (synopsis "Official Minecraft launcher (prebuilt binary)")
    (description
     "The official Minecraft launcher from Mojang.  This package repackages
the upstream amd64 deb.  Note: a valid Minecraft account is required.")
    (home-page "https://minecraft.net/")
    ;; Proprietary
    (license #f)))
