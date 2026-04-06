;;; Chunk module for cron-5a2fb251 r5 worker w02.
;;; 10 packages assigned; 7 packaged, 3 blocked.
(define-module (gaurix packages cron-5a2fb251-r5-w02)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression))

;;; ---------------------------------------------------------------
;;; 1. claude-code  (npm tarball → trivial install)
;;; ---------------------------------------------------------------
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
       (sha256
        (base32 "0iwkfjb3nq95b9iz1hng2i3vdcdb2aph35jmaccagcz62vwqby7z"))))
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
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (lib-dir (string-append out "/lib/claude-code"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p lib-dir)
            (mkdir-p bin-dir)
            (invoke tar
                    (string-append "--use-compress-program=" gzip)
                    "-xf" src
                    "-C" lib-dir
                    "--strip-components=1")
            ;; Create wrapper script that invokes node on the cli.js
            (let ((wrapper (string-append bin-dir "/claude")))
              (call-with-output-file wrapper
                (lambda (port)
                  (format port "#!/bin/sh~%exec node ~a/cli.js \"$@\"~%"
                          lib-dir)))
              (chmod wrapper #o755))
            #t))))
    (synopsis "Anthropic's agentic coding tool for the terminal (prebuilt)")
    (description
     "Claude Code is an agentic coding tool from Anthropic that lives in
your terminal.  It can understand your codebase, edit files, run terminal
commands, and handle entire workflows.  This package installs the prebuilt
npm distribution.")
    (home-page "https://github.com/anthropics/claude-code")
    (license license:expat)))

;;; ---------------------------------------------------------------
;;; 2. zapzap  (AppImage repackage)
;;; ---------------------------------------------------------------
(define-public zapzap
  (package
    (name "zapzap")
    (version "6.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rafatosta/zapzap/releases/download/"
             version "/ZapZap-x86_64.AppImage"))
       (sha256
        (base32 "17yfdcikq9hfl7k9dgdw59vnzpfvjvkqzv8n6rymbsdg0qicff03"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt-dir (string-append out "/opt/zapzap"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p opt-dir)
            (mkdir-p bin-dir)
            (copy-file src (string-append opt-dir "/ZapZap.AppImage"))
            (chmod (string-append opt-dir "/ZapZap.AppImage") #o755)
            (symlink (string-append opt-dir "/ZapZap.AppImage")
                     (string-append bin-dir "/zapzap"))
            #t))))
    (synopsis "WhatsApp desktop client via PyQt6 (AppImage)")
    (description
     "ZapZap is a WhatsApp desktop client built with PyQt6.  This package
installs the prebuilt AppImage.")
    (home-page "https://github.com/rafatosta/zapzap")
    (license license:gpl3+)))

;;; ---------------------------------------------------------------
;;; 3. faugus-launcher  (binary .deb repackage, zstd-compressed)
;;; ---------------------------------------------------------------
(define-public faugus-launcher
  (package
    (name "faugus-launcher")
    (version "1.17.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Faugus/faugus-launcher/releases/download/"
             version "/faugus-launcher_" version "-1_all.deb"))
       (sha256
        (base32 "1fqn03yqc8q3gcwxhb7yamipr76jd64q9zzzhnf604yk690n648n"))))
    (build-system trivial-build-system)
    (native-inputs (list binutils tar zstd))
    (arguments
     (list
      #:modules '((guix build utils) (ice-9 ftw))
      #:builder
      #~(begin
          (use-modules (guix build utils) (ice-9 ftw))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (ar   (search-input-file %build-inputs "/bin/ar"))
                 (tar  (search-input-file %build-inputs "/bin/tar"))
                 (zstd (search-input-file %build-inputs "/bin/zstd")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" zstd)
                    "-xf" "data.tar.zst")
            ;; Install files from extracted tree
            (let ((share-src "usr/share")
                  (bin-src   "usr/bin")
                  (share-out (string-append out "/share"))
                  (bin-out   (string-append out "/bin")))
              (when (file-exists? share-src)
                (copy-recursively share-src share-out))
              (when (file-exists? bin-src)
                (mkdir-p bin-out)
                (for-each
                 (lambda (f)
                   (let ((src-f (string-append bin-src "/" f))
                         (dst-f (string-append bin-out "/" f)))
                     (copy-file src-f dst-f)
                     (chmod dst-f #o755)))
                 (scandir bin-src
                          (lambda (f) (not (member f '("." "..")))))))
              #t)))))
    (synopsis "Windows game launcher using UMU-Launcher (prebuilt)")
    (description
     "Faugus Launcher is a simple launcher for running Windows games on
Linux using UMU-Launcher and Proton.  This package installs the prebuilt
Debian binary.")
    (home-page "https://github.com/Faugus/faugus-launcher")
    (license license:gpl3)))

;;; ---------------------------------------------------------------
;;; 4. spicetify-cli  (prebuilt Go binary)
;;; ---------------------------------------------------------------
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
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (lib-dir (string-append out "/lib/spicetify-cli"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p lib-dir)
            (mkdir-p bin-dir)
            (invoke tar
                    (string-append "--use-compress-program=" gzip)
                    "-xf" src
                    "-C" lib-dir)
            (let ((bin (string-append lib-dir "/spicetify")))
              (chmod bin #o755)
              (symlink bin (string-append bin-dir "/spicetify")))
            #t))))
    (synopsis "Spotify client customizer (prebuilt binary)")
    (description
     "Spicetify is a command-line tool to customize the official Spotify
client.  Supports custom themes, extensions, and apps.  This package
installs the prebuilt Linux binary.")
    (home-page "https://github.com/spicetify/cli")
    (license license:lgpl2.1+)))

;;; ---------------------------------------------------------------
;;; 5. paru-bin  (prebuilt Rust binary)
;;; ---------------------------------------------------------------
(define-public paru-bin
  (package
    (name "paru-bin")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Morganamilo/paru/releases/download/v"
             version "/paru-v" version "-x86_64.tar.zst"))
       (sha256
        (base32 "100q4zbqflkr9kryfa5md0533y3ya48dyylzarpfkrw0c1rqivr8"))))
    (build-system trivial-build-system)
    (native-inputs (list tar zstd))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar  (search-input-file %build-inputs "/bin/tar"))
                 (zstd (search-input-file %build-inputs "/bin/zstd"))
                 (bin-dir (string-append out "/bin"))
                 (man8 (string-append out "/share/man/man8"))
                 (man5 (string-append out "/share/man/man5"))
                 (bash-comp (string-append out "/share/bash-completion/completions"))
                 (zsh-comp  (string-append out "/share/zsh/site-functions"))
                 (fish-comp (string-append out "/share/fish/vendor_completions.d"))
                 (work-dir  (string-append (getcwd) "/extract")))
            (mkdir-p work-dir)
            (invoke tar
                    (string-append "--use-compress-program=" zstd)
                    "-xf" src
                    "-C" work-dir)
            (mkdir-p bin-dir)
            (copy-file (string-append work-dir "/paru")
                       (string-append bin-dir "/paru"))
            (chmod (string-append bin-dir "/paru") #o755)
            ;; Install man pages
            (mkdir-p man8)
            (mkdir-p man5)
            (when (file-exists? (string-append work-dir "/man/paru.8"))
              (copy-file (string-append work-dir "/man/paru.8")
                         (string-append man8 "/paru.8")))
            (when (file-exists? (string-append work-dir "/man/paru.conf.5"))
              (copy-file (string-append work-dir "/man/paru.conf.5")
                         (string-append man5 "/paru.conf.5")))
            ;; Install completions
            (mkdir-p bash-comp)
            (mkdir-p zsh-comp)
            (mkdir-p fish-comp)
            (when (file-exists? (string-append work-dir "/completions/bash"))
              (copy-file (string-append work-dir "/completions/bash")
                         (string-append bash-comp "/paru")))
            (when (file-exists? (string-append work-dir "/completions/zsh"))
              (copy-file (string-append work-dir "/completions/zsh")
                         (string-append zsh-comp "/_paru")))
            (when (file-exists? (string-append work-dir "/completions/fish"))
              (copy-file (string-append work-dir "/completions/fish")
                         (string-append fish-comp "/paru.fish")))
            #t))))
    (synopsis "AUR helper written in Rust (prebuilt binary)")
    (description
     "Paru is a feature-rich AUR helper and pacman wrapper written in Rust.
This package installs the prebuilt binary release.")
    (home-page "https://github.com/morganamilo/paru")
    (license license:gpl3)))

;;; ---------------------------------------------------------------
;;; 6. ttf-ms-fonts  (MS core fonts via cabextract)
;;; ---------------------------------------------------------------
(define-public ttf-ms-fonts
  (package
    (name "ttf-ms-fonts")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloads.sourceforge.net/corefonts/arial32.exe")
       (sha256
        (base32 "1xkqyivbyb3z9dcalzidf8m4npzfpls2g0kldyn8g73f2i6plac5"))))
    (build-system trivial-build-system)
    (native-inputs (list cabextract))
    (arguments
     (list
      #:modules '((guix build utils) (ice-9 ftw))
      #:builder
      #~(begin
          (use-modules (guix build utils) (ice-9 ftw))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (cabextract (search-input-file %build-inputs "/bin/cabextract"))
                 (font-dir (string-append out "/share/fonts/truetype/msttcorefonts"))
                 (work (string-append (getcwd) "/work")))
            (mkdir-p font-dir)
            (mkdir-p work)
            ;; Extract the .exe (cabinet archive) to get .ttf files
            (invoke cabextract "-q" "-d" work src)
            ;; Copy all .ttf/.TTF files to font dir
            (for-each
             (lambda (f)
               (when (or (string-suffix? ".ttf" f) (string-suffix? ".TTF" f))
                 (copy-file (string-append work "/" f)
                            (string-append font-dir "/" (string-downcase f)))))
             (scandir work (lambda (f) (not (member f '("." ".."))))))
            #t))))
    (synopsis "Core TTF fonts from Microsoft (Arial family)")
    (description
     "This package provides the Arial font family from Microsoft's Core Fonts
for the Web collection.  The fonts are extracted from the original Microsoft
cabinet archive distributed via SourceForge.")
    (home-page "http://corefonts.sourceforge.net")
    (license (license:non-copyleft
              "http://corefonts.sourceforge.net/eula.htm"
              "Microsoft Core Fonts EULA"))))

;;; ---------------------------------------------------------------
;;; 7. minecraft-launcher  (binary .deb repackage, xz-compressed)
;;; ---------------------------------------------------------------
(define-public minecraft-launcher
  (package
    (name "minecraft-launcher")
    (version "2.1.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://launcher.mojang.com/download/Minecraft.deb")
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
                 (xz  (search-input-file %build-inputs "/bin/xz")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")
            ;; Install binary
            (let ((bin-out (string-append out "/bin"))
                  (share-out (string-append out "/share")))
              (mkdir-p bin-out)
              (when (file-exists? "usr/bin/minecraft-launcher")
                (copy-file "usr/bin/minecraft-launcher"
                           (string-append bin-out "/minecraft-launcher"))
                (chmod (string-append bin-out "/minecraft-launcher") #o755))
              ;; Install desktop file and icons
              (when (file-exists? "usr/share")
                (copy-recursively "usr/share" share-out))
              #t)))))
    (synopsis "Official Minecraft Launcher (prebuilt binary)")
    (description
     "The official Minecraft Launcher from Mojang.  This package installs
the prebuilt Linux binary from the official Debian package.")
    (home-page "https://www.minecraft.net/")
    (license (license:non-copyleft
              "https://www.minecraft.net/en-us/eula"
              "Minecraft EULA"))))
