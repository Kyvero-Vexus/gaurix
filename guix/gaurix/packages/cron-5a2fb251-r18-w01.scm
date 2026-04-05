;;; Worker 01 batch (r18): resolve NEEDS_RECIPE_DESIGN packages.
;;; 8 new recipes: qt-sudo, zotero-bin, anytype-bin, arduino-ide-bin,
;;;   freetube-bin, fresh-editor-bin, ttf-material-symbols-variable-git, osu-mime
;;; 2 BLOCKED: localsend (MISSING_GUIX_DEPS: flutter/fvm/dart),
;;;   appimagelauncher (MISSING_GUIX_DEPS: libappimage)
(define-module (gaurix packages cron-5a2fb251-r18-w01)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system qt)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system font)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages qt))

;;; ────────────��───────────────────────────────
;;; qt-sudo — Qt-based sudo prompt
;;; ────────────────────────────���───────────────
(define-public qt-sudo
  (package
    (name "qt-sudo")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/aarnt/qt-sudo/archive/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dvimqsrksnzy0mk3nnksiqfynxh7rdhf86qjvnhnkl4f892k23y"))))
    (build-system qt-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (invoke "qmake6"
                        (string-append "PREFIX=" out)
                        "qt-sudo.pro")))))))
    (inputs (list qtbase))
    (native-inputs (list qttools))
    (home-page "https://github.com/aarnt/qt-sudo")
    (synopsis "Qt-based graphical sudo prompt")
    (description
     "Qt-sudo is a clone of the LXQt sudo tool that provides a graphical
password prompt for running programs with elevated privileges, without
requiring LXQt libraries.")
    (license license:lgpl2.1+)))

;;; ───────���────────────────────────────────────
;;; zotero-bin — Zotero reference manager (binary)
;;; ─────────────────────���──────────────────────
(define-public zotero-bin
  (package
    (name "zotero-bin")
    (version "8.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.zotero.org/download/client/dl?channel=release"
             "&platform=linux-x86_64&version=" version))
       (file-name (string-append "zotero-" version "-linux-x86_64.tar.bz2"))
       (sha256
        (base32 "0wwn4jf7w9kwrc02kr0y9zg77gfmd1c8smfzc7djgp3b7b9pfzmy"))))
    (build-system trivial-build-system)
    (native-inputs (list tar bzip2))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (bzip2 (search-input-file %build-inputs "/bin/bzip2"))
                 (lib-dir (string-append out "/lib/zotero"))
                 (bin-dir (string-append out "/bin"))
                 (share-dir (string-append out "/share")))
            (setenv "PATH" (string-append
                            (dirname tar) ":"
                            (dirname bzip2)))
            (invoke tar "xjf" src)
            (mkdir-p lib-dir)
            (copy-recursively "Zotero_linux-x86_64" lib-dir)
            (mkdir-p bin-dir)
            (symlink (string-append lib-dir "/zotero")
                     (string-append bin-dir "/zotero"))
            (mkdir-p (string-append share-dir "/applications"))
            (call-with-output-file
                (string-append share-dir "/applications/zotero.desktop")
              (lambda (port)
                (display "[Desktop Entry]
Type=Application
Name=Zotero
Comment=Free reference manager
Exec=zotero %U
Icon=zotero
Terminal=false
Categories=Office;Education;Science;
MimeType=x-scheme-handler/zotero;
" port)))
            (for-each
             (lambda (pair)
               (let ((size (car pair))
                     (file (cdr pair)))
                 (let ((icon-dir (string-append share-dir "/icons/hicolor/"
                                                size "x" size "/apps")))
                   (mkdir-p icon-dir)
                   (when (file-exists? (string-append lib-dir "/icons/" file))
                     (copy-file (string-append lib-dir "/icons/" file)
                                (string-append icon-dir "/zotero.png"))))))
             '(("32" . "icon32.png")
               ("64" . "icon64.png")
               ("128" . "icon128.png")))
            #t))))
    (home-page "https://www.zotero.org/")
    (synopsis "Free reference manager (prebuilt binary)")
    (description
     "Zotero is a free, easy-to-use tool to help you collect, organize, cite,
and share your research sources.  This package repackages the upstream
prebuilt x86_64 Linux binary.")
    (license license:agpl3+)))

;;; ───���────────────────────────────────────────
;;; anytype-bin — P2P note-taking app (AppImage)
;;; ──────────────────���─────────────────────────
(define-public anytype-bin
  (package
    (name "anytype-bin")
    (version "0.54.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/anyproto/anytype-ts/releases/download/v"
             version "/Anytype-" version ".AppImage"))
       (file-name (string-append "anytype-" version ".AppImage"))
       (sha256
        (base32 "0f4rxgwn1qd06vmqrg7jc59n8ybfhhbb4k29b7hd1w1hwggn81sf"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin-dir (string-append out "/bin"))
                 (share-dir (string-append out "/share")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/anytype"))
            (chmod (string-append bin-dir "/anytype") #o755)
            (mkdir-p (string-append share-dir "/applications"))
            (call-with-output-file
                (string-append share-dir "/applications/anytype.desktop")
              (lambda (port)
                (display "[Desktop Entry]
Type=Application
Name=Anytype
Comment=Next generation knowledge management
Exec=anytype %U
Icon=anytype
Terminal=false
Categories=Office;Utility;
" port)))
            #t))))
    (home-page "https://anytype.io/")
    (synopsis "P2P note-taking and knowledge management app (AppImage)")
    (description
     "Anytype is a next-generation software that breaks down barriers between
applications, giving back privacy and data ownership to users.  This package
provides the upstream AppImage binary.")
    (license license:expat)))

;;; ───────��────────────���───────────────────────
;;; arduino-ide-bin — Arduino IDE (binary)
;;; ──────��─────���───────────────────────────────
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
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (opt-dir (string-append out "/opt/arduino-ide"))
                 (bin-dir (string-append out "/bin"))
                 (share-dir (string-append out "/share")))
            (invoke unzip src "-d" "arduino-extract")
            (mkdir-p opt-dir)
            (copy-recursively
             (string-append "arduino-extract/arduino-ide_"
                            #$version "_Linux_64bit")
             opt-dir)
            (chmod (string-append opt-dir "/arduino-ide") #o755)
            (mkdir-p bin-dir)
            (symlink (string-append opt-dir "/arduino-ide")
                     (string-append bin-dir "/arduino-ide"))
            (mkdir-p (string-append share-dir "/applications"))
            (call-with-output-file
                (string-append share-dir "/applications/arduino-ide.desktop")
              (lambda (port)
                (display "[Desktop Entry]
Type=Application
Name=Arduino IDE
Comment=Arduino prototyping platform IDE
Exec=arduino-ide %U
Icon=arduino-ide
Terminal=false
Categories=Development;IDE;Electronics;
MimeType=text/x-arduino;
" port)))
            #t))))
    (home-page "https://github.com/arduino/arduino-ide")
    (synopsis "Arduino IDE based on the Theia framework (prebuilt binary)")
    (description
     "Arduino IDE is the modern prototyping platform IDE for Arduino boards,
rewritten based on the Theia IDE framework.  This package repackages the
upstream prebuilt x86_64 Linux binary.")
    (license license:agpl3)))

;;; ─��──────────────────────────────────────────
;;; freetube-bin — YouTube desktop client (binary)
;;; ───────────��────────────────────────────────
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
       (file-name (string-append "freetube-" version "-amd64.deb"))
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
                 (ar (search-input-file %build-inputs "/bin/ar"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz (search-input-file %build-inputs "/bin/xz"))
                 (opt-dir (string-append out "/opt/FreeTube"))
                 (bin-dir (string-append out "/bin"))
                 (share-dir (string-append out "/share")))
            (setenv "PATH" (string-append
                            (dirname tar) ":"
                            (dirname xz)))
            (invoke ar "x" src)
            (invoke tar "xf" "data.tar.xz")
            (mkdir-p opt-dir)
            (copy-recursively "opt/FreeTube" opt-dir)
            (mkdir-p bin-dir)
            (symlink (string-append opt-dir "/freetube")
                     (string-append bin-dir "/freetube"))
            (when (file-exists? "usr/share")
              (mkdir-p share-dir)
              (copy-recursively "usr/share" share-dir))
            #t))))
    (home-page "https://github.com/FreeTubeApp/FreeTube")
    (synopsis "Privacy-focused desktop YouTube player (prebuilt binary)")
    (description
     "FreeTube is an open-source desktop YouTube player built with privacy in
mind.  It allows watching YouTube videos without tracking or ads.  This
package repackages the upstream prebuilt x86_64 Linux binary.")
    (license license:agpl3)))

;;; ───��───────���────────────────────────────────
;;; fresh-editor-bin �� Terminal text editor (binary)
;;; ─────���──────────────────────────────────────
(define-public fresh-editor-bin
  (package
    (name "fresh-editor-bin")
    (version "0.2.21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sinelaw/fresh/releases/download/v"
             version "/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"))
       (sha256
        (base32 "1nnhqcfbfn2brq4mcprhj53pp3z93dag06h2vd80dd968psdj58b"))))
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
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz (search-input-file %build-inputs "/bin/xz"))
                 (bin-dir (string-append out "/bin"))
                 (share-dir (string-append out "/share/fresh-editor")))
            (setenv "PATH" (string-append
                            (dirname tar) ":"
                            (dirname xz)))
            (invoke tar "xf" src)
            (let ((extract-dir "fresh-editor-x86_64-unknown-linux-gnu"))
              (mkdir-p share-dir)
              (mkdir-p bin-dir)
              (copy-file (string-append extract-dir "/fresh")
                         (string-append share-dir "/fresh"))
              (chmod (string-append share-dir "/fresh") #o755)
              (when (file-exists? (string-append extract-dir "/plugins"))
                (copy-recursively (string-append extract-dir "/plugins")
                                  (string-append share-dir "/plugins")))
              (symlink (string-append share-dir "/fresh")
                       (string-append bin-dir "/fresh")))
            #t))))
    (home-page "https://sinelaw.github.io/fresh/")
    (synopsis "Lightweight terminal text editor with LSP support (prebuilt)")
    (description
     "Fresh is a lightweight, fast terminal-based text editor with LSP support
and TypeScript plugins.  This package repackages the upstream prebuilt
x86_64 Linux binary.")
    (license license:gpl2)))

;;; ──────────────��─────────────────────────────
;;; ttf-material-symbols-variable-git — Material Symbols variable fonts
;;; ────────────────────────────────────────────
;;; The variable fonts exist only on the master branch of the
;;; material-design-icons repository (not in any tagged release).
;;; We fetch the three .ttf files directly and install them with
;;; trivial-build-system.

(define material-symbols-outlined-ttf
  (origin
    (method url-fetch)
    (uri "https://github.com/google/material-design-icons/raw/refs/heads/master/variablefont/MaterialSymbolsOutlined%5BFILL%2CGRAD%2Copsz%2Cwght%5D.ttf")
    (file-name "MaterialSymbolsOutlined.ttf")
    (sha256
     (base32 "10ydlzdkfpn2c239q05y0hn9vnw44lvsc5r2xcqjzf1lavmd3s65"))))

(define material-symbols-rounded-ttf
  (origin
    (method url-fetch)
    (uri "https://github.com/google/material-design-icons/raw/refs/heads/master/variablefont/MaterialSymbolsRounded%5BFILL%2CGRAD%2Copsz%2Cwght%5D.ttf")
    (file-name "MaterialSymbolsRounded.ttf")
    (sha256
     (base32 "0xx86154i43234nh467sjvx1bwpqfr0mm06y4zrz6lf01va2pzvb"))))

(define material-symbols-sharp-ttf
  (origin
    (method url-fetch)
    (uri "https://github.com/google/material-design-icons/raw/refs/heads/master/variablefont/MaterialSymbolsSharp%5BFILL%2CGRAD%2Copsz%2Cwght%5D.ttf")
    (file-name "MaterialSymbolsSharp.ttf")
    (sha256
     (base32 "00nsi35klni92dyv9br1k40433vcnyv1lsm45dm16sxfd94csipc"))))

(define-public ttf-material-symbols-variable-git
  (package
    (name "ttf-material-symbols-variable-git")
    (version "4.0.0.r119")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((font-dir (string-append (assoc-ref %outputs "out")
                                         "/share/fonts/truetype")))
            (mkdir-p font-dir)
            (copy-file #$material-symbols-outlined-ttf
                       (string-append font-dir "/MaterialSymbolsOutlined.ttf"))
            (copy-file #$material-symbols-rounded-ttf
                       (string-append font-dir "/MaterialSymbolsRounded.ttf"))
            (copy-file #$material-symbols-sharp-ttf
                       (string-append font-dir "/MaterialSymbolsSharp.ttf"))
            #t))))
    (home-page "https://github.com/google/material-design-icons")
    (synopsis "Google Material Symbols variable icon fonts")
    (description
     "Material Symbols are Google's latest iconography font family, provided as
variable fonts with axes for fill, weight, grade, and optical size.  This
package installs the Outlined, Rounded, and Sharp variants as TrueType
variable fonts.")
    (license license:asl2.0)))

;;; ───��───────────��────────────────────────────
;;; osu-mime — MIME type definitions for osu!
;;; ───────────���────────────────────────────────
(define-public osu-mime
  (package
    (name "osu-mime")
    (version "0.1")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (mime-dir (string-append out "/share/mime/packages")))
            (mkdir-p mime-dir)
            (call-with-output-file
                (string-append mime-dir "/osu-file-extensions.xml")
              (lambda (port)
                (display "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<mime-info xmlns=\"http://www.freedesktop.org/standards/shared-mime-info\">
  <mime-type type=\"application/x-osu-beatmap\">
    <glob pattern=\"*.osu\"/>
    <sub-class-of type=\"text/plain\"/>
    <magic priority=\"60\">
        <match type=\"string\" offset=\"0\" value=\"osu file format v\"/>
    </magic>
    <comment>osu! beatmap</comment>
  </mime-type>
  <mime-type type=\"application/x-osu-storyboard\">
    <glob pattern=\"*.osb\"/>
    <sub-class-of type=\"text/plain\"/>
    <comment>osu! storyboard</comment>
  </mime-type>
  <mime-type type=\"application/x-osu-skin-archive\">
    <glob pattern=\"*.osk\"/>
    <sub-class-of type=\"application/zip\"/>
    <comment>osu! skin archive</comment>
  </mime-type>
  <mime-type type=\"application/x-osu-replay\">
    <glob pattern=\"*.osr\"/>
    <sub-class-of type=\"application/octet-stream\"/>
    <comment>osu! replay</comment>
  </mime-type>
  <mime-type type=\"application/x-osu-beatmap-archive\">
    <glob pattern=\"*.osz\"/>
    <sub-class-of type=\"application/zip\"/>
    <comment>osu! beatmap archive</comment>
  </mime-type>
  <mime-type type=\"application/x-osu-beatmap-archive\">
    <glob pattern=\"*.osz2\"/>
    <sub-class-of type=\"application/zip\"/>
    <comment>osu! beatmap archive</comment>
  </mime-type>
</mime-info>
" port)))
            #t))))
    (home-page "https://osu.ppy.sh/")
    (synopsis "MIME type definitions for osu! file formats")
    (description
     "Provides shared MIME type definitions for osu! game file formats including
beatmaps (.osu), storyboards (.osb), skin archives (.osk), replays (.osr),
and beatmap archives (.osz, .osz2).")
    (license license:agpl3)))
