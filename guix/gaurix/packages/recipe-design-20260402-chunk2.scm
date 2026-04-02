(define-module (gaurix packages recipe-design-20260402-chunk2)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages video)
  #:export (systemd-suspend-modules
            noto-fonts-cjk-fontconfig
            q5k-usb-udev
            pixora-icons-git
            arch-remaster
            renamemytvseries-gtk-bin
            boscaceoil-blue-bin
            bililive-recorder-bin
            iwmenu-bin
            bzmenu-bin))

(define* (make-single-executable-binary-package
          name command version uri hash synopsis description home-page pkg-license)
  (package
    (name name)
    (version version)
    (source
     (origin
       (method url-fetch)
       (uri uri)
       (sha256 (base32 hash))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (target (string-append bin "/" #$command)))
            (mkdir-p bin)
            (copy-file (assoc-ref %build-inputs "source") target)
            (chmod target #o755)
            #t))))
    (home-page home-page)
    (synopsis synopsis)
    (description description)
    (license pkg-license)))

(define-public systemd-suspend-modules
  (package
    (name "systemd-suspend-modules")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://aur.archlinux.org/cgit/aur.git/plain/suspend-modules?h=systemd-suspend-modules&id=e94deea76cec40eb360adfa2a027aad70b37d290")
       (file-name "suspend-modules")
       (sha256
        (base32 "0rwfs40hfd403y0wx3y8isn96jz72mf0s86hprrk9xjybbmg4iyq"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (sleep-dir (string-append out "/lib/systemd/system-sleep"))
                 (script (string-append sleep-dir "/suspend-modules"))
                 (etc-dir (string-append out "/etc"))
                 (bash (string-append #$bash-minimal "/bin/bash")))
            (mkdir-p sleep-dir)
            (copy-file (assoc-ref %build-inputs "source") script)
            (chmod script #o755)
            (substitute* script
              (("^#!/bin/bash")
               (string-append "#!" bash)))
            (mkdir-p etc-dir)
            (call-with-output-file (string-append etc-dir "/suspend-modules.conf")
              (lambda (_port)
                #t))
            #t))))
    (home-page "https://aur.archlinux.org/packages/systemd-suspend-modules")
    (synopsis "Reload selected kernel modules on suspend and resume")
    (description
     "systemd-suspend-modules installs a systemd sleep hook that unloads
listed kernel modules before suspend/hibernate and reloads them after resume.
It also ships an empty @file{/etc/suspend-modules.conf} template file.")
    (license license:gpl2+)))

(define-public noto-fonts-cjk-fontconfig
  (package
    (name "noto-fonts-cjk-fontconfig")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://aur.archlinux.org/cgit/aur.git/plain/70-noto-cjk.conf?h=noto-fonts-cjk-fontconfig&id=db44f4a89b1ad5ea35d0d73cc1e60bc8359e07bc")
       (file-name "70-noto-cjk.conf")
       (sha256
        (base32 "013akzrzl3jqjkmwn8jij6lqf361mdf74gpdyd5h1lh5hk85162h"))))
    (build-system trivial-build-system)
    (propagated-inputs
     (list font-google-noto-sans-cjk
           font-google-noto-serif-cjk))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (conf-avail (string-append out "/share/fontconfig/conf.avail"))
                 (conf-default (string-append out "/share/fontconfig/conf.default"))
                 (target (string-append conf-avail "/70-noto-cjk.conf"))
                 (link (string-append conf-default "/70-noto-cjk.conf")))
            (mkdir-p conf-avail)
            (copy-file (assoc-ref %build-inputs "source") target)
            (mkdir-p conf-default)
            (symlink target link)
            #t))))
    (home-page "https://aur.archlinux.org/packages/noto-fonts-cjk-fontconfig")
    (synopsis "Fontconfig rules to append Noto CJK families by locale")
    (description
     "This package installs a Fontconfig snippet that appends locale-specific
Noto CJK font families when generic Noto Sans, Serif, and Sans Mono families
are requested.")
    (license license:gpl3+)))

(define-public q5k-usb-udev
  (package
    (name "q5k-usb-udev")
    (version "2026.02.28")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://gist.github.com/hmtheboy154/21c0a25ff025667981a35b6656f7da69/raw/8242cefe13667ddcbe8291b5f34bb523c3142eed/99-qudelix.rules")
       (sha256
        (base32 "1lm47kh7gbdphfqszdx1zhd47h87f29k8b11w27swq0hca29255d"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (rules-dir (string-append out "/lib/udev/rules.d")))
            (mkdir-p rules-dir)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append rules-dir "/99-qudelix.rules"))
            #t))))
    (home-page "https://gist.github.com/hmtheboy154/21c0a25ff025667981a35b6656f7da69")
    (synopsis "udev rules for Qudelix-5K USB access")
    (description
     "q5k-usb-udev installs udev rules for Qudelix-5K USB DAC and microphone
USB product IDs so the device can be accessed without root permissions.")
    (license license:bsd-3)))

(define-public pixora-icons-git
  (package
    (name "pixora-icons-git")
    (version "1.0.0-r280-g9eae9a2")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/tsora1603/pixora-icons/archive/9eae9a296e4eb345b331da045c645e21fecc0c59.tar.gz")
       (sha256
        (base32 "0ma0dgj1whzd9q8i35ybm5480hn9clinn9a4qb6w14ijibka15b4"))))
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
                 (work (string-append (getcwd) "/work"))
                 (top (string-append work
                                     "/pixora-icons-9eae9a296e4eb345b331da045c645e21fecc0c59"))
                 (icons-root (string-append out "/share/icons"))
                 (doc-dir (string-append out "/share/doc/pixora-icons-git")))
            (mkdir-p work)
            (invoke tar
                    (string-append "--use-compress-program=" gzip)
                    "-xf" src "-C" work)
            (mkdir-p icons-root)
            (for-each
             (lambda (theme)
               (copy-recursively (string-append top "/" theme)
                                 (string-append icons-root "/" theme)))
             '("pixora" "pixelitos-light" "pixelitos-dark"))
            (mkdir-p doc-dir)
            (copy-file (string-append top "/README.md")
                       (string-append doc-dir "/README.md"))
            #t))))
    (home-page "https://github.com/tsora1603/pixora-icons")
    (synopsis "16-bit pixel icon themes (Git snapshot)")
    (description
     "pixora-icons-git packages the Pixora and Pixelitos icon theme families
from a pinned source snapshot.")
    (license license:gpl3+)))

(define-public arch-remaster
  (package
    (name "arch-remaster")
    (version "26.02.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/AdrianTM/arch-remaster/archive/refs/tags/26.02.1.tar.gz")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11xmq1vygbnflwzankxmpdvdwjpdamx892188d7njark92dp47jy"))))
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
                 (bin-dir (string-append out "/bin"))
                 (man1-dir (string-append out "/share/man/man1"))
                 (work (string-append (getcwd) "/work"))
                 (top (string-append work "/arch-remaster-26.02.1"))
                 (bash (string-append #$bash-minimal "/bin/bash")))
            (mkdir-p work)
            (invoke tar
                    (string-append "--use-compress-program=" gzip)
                    "-xf" src "-C" work)
            (mkdir-p bin-dir)
            (install-file (string-append top "/live-remaster") bin-dir)
            (install-file (string-append top "/update-cow-space") bin-dir)
            (for-each
             (lambda (script)
               (chmod script #o755)
               (substitute* script
                 (("^#!/bin/bash")
                  (string-append "#!" bash))))
             (list (string-append bin-dir "/live-remaster")
                   (string-append bin-dir "/update-cow-space")))
            (mkdir-p man1-dir)
            (install-file (string-append top "/live-remaster.1") man1-dir)
            (install-file (string-append top "/update-cow-space.1") man1-dir)
            #t))))
    (home-page "https://github.com/AdrianTM/arch-remaster")
    (synopsis "Tools for remastering Arch Linux live systems")
    (description
     "arch-remaster provides shell tools to remaster Arch Linux live systems
and to update live USB copy-on-write boot parameters.")
    (license license:gpl3)))

(define-public renamemytvseries-gtk-bin
  (package
    (name "renamemytvseries-gtk-bin")
    (version "2.3.12")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://www.tweaking4all.com/downloads/video/RenameMyTVSeries-2.3.12-GTK-Linux-x64-shared-ffmpeg.tar.xz")
       (sha256
        (base32 "137vq4p2g7amik57bn8nfc7ap0f8dw2f4swqnlfp7s7f71frci54"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (propagated-inputs
     (list ffmpeg
           gtk+))
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
                 (work (string-append (getcwd) "/work"))
                 (opt (string-append out "/opt/renamemytvseries-gtk-bin"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (fonts (string-append out "/share/fonts/truetype")))
            (mkdir-p work)
            (invoke tar
                    (string-append "--use-compress-program=" xz)
                    "-xf" src "-C" work)
            (mkdir-p opt)
            (copy-file (string-append work "/RenameMyTVSeries")
                       (string-append opt "/RenameMyTVSeries"))
            (chmod (string-append opt "/RenameMyTVSeries") #o755)
            (mkdir-p bin)
            (symlink (string-append opt "/RenameMyTVSeries")
                     (string-append bin "/RenameMyTVSeries"))
            (symlink (string-append opt "/RenameMyTVSeries")
                     (string-append bin "/renamemytvseries"))
            (for-each
             (lambda (size)
               (let* ((icon-dir
                       (string-append out "/share/icons/hicolor/"
                                      size "x" size "/apps"))
                      (src-icon
                       (string-append work "/icons/" size "x" size ".png"))
                      (dst-icon
                       (string-append icon-dir "/renamemytvseries.png")))
                 (mkdir-p icon-dir)
                 (copy-file src-icon dst-icon)))
             '("16" "32" "64" "128" "256" "512"))
            (mkdir-p apps)
            (copy-file (string-append work "/RenameMyTVSeries.desktop")
                       (string-append apps "/renamemytvseries.desktop"))
            (substitute* (string-append apps "/renamemytvseries.desktop")
              (("^Exec=.*") "Exec=RenameMyTVSeries\n")
              (("^Icon=.*") "Icon=renamemytvseries\n")
              (("^NoDisplay=true\n") ""))
            (mkdir-p fonts)
            (copy-file (string-append work "/rmtv.ttf")
                       (string-append fonts "/rmtv.ttf"))
            #t))))
    (home-page "https://www.tweaking4all.com/home-theatre/rename-my-tv-series-v2/")
    (synopsis "Rename your TV series episodes using online metadata")
    (description
     "renamemytvseries-gtk-bin repackages the upstream GTK binary release of
Rename My TV Series for GNU/Linux.")
    ;; Upstream is distributed under a custom proprietary license.
    (license
     (license:non-copyleft
      "https://www.tweaking4all.com/home-theatre/rename-my-tv-series-v2/"))))

(define-public boscaceoil-blue-bin
  (package
    (name "boscaceoil-blue-bin")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/YuriSizov/boscaceoil-blue/releases/download/3.1.2-stable/boscaceoil-blue-linux-x86_64.zip")
       (sha256
        (base32 "0pb5vh6fyc3fkmvcblnyhb0zapsa4fg6p65s8pzznn8d3n7lwiy2"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
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
                 (work (string-append (getcwd) "/work"))
                 (opt (string-append out "/opt/boscaceoil-blue-bin"))
                 (bin (string-append out "/bin"))
                 (binary (string-append opt "/boscaceoil-blue")))
            (mkdir-p work)
            (invoke unzip "-q" src "-d" work)
            (mkdir-p opt)
            (copy-file
             (string-append work "/boscaceoil-blue-linux-x86_64/boscaceoil-blue.x86_64")
             binary)
            (copy-file
             (string-append work "/boscaceoil-blue-linux-x86_64/libgdsion.linux.template_release.x86_64.so")
             (string-append opt "/libgdsion.linux.template_release.x86_64.so"))
            (chmod binary #o755)
            (mkdir-p bin)
            (symlink binary (string-append bin "/boscaceoil-blue"))
            #t))))
    (home-page "https://github.com/YuriSizov/boscaceoil-blue")
    (synopsis "Beginner-friendly music sequencer binary")
    (description
     "boscaceoil-blue-bin repackages the upstream Linux binary release of
Bosca Ceoil Blue.")
    (license license:expat)))

(define-public bililive-recorder-bin
  (package
    (name "bililive-recorder-bin")
    (version "2.17.3")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/Bililive/BililiveRecorder/releases/download/v2.17.3/BililiveRecorder-CLI-linux-x64.zip")
       (sha256
        (base32 "1lw4i01zjpnglrv6sbz3q357mjfap1z2218pr0r7lx7m5qml21dw"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
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
                 (work (string-append (getcwd) "/work"))
                 (lib (string-append out "/lib/bililive-recorder"))
                 (bin (string-append out "/bin")))
            (mkdir-p work)
            (invoke unzip "-q" src "-d" work)
            (copy-recursively work lib)
            (chmod (string-append lib "/BililiveRecorder.Cli") #o755)
            (mkdir-p bin)
            (symlink (string-append lib "/BililiveRecorder.Cli")
                     (string-append bin "/BililiveRecorder.Cli"))
            #t))))
    (home-page "https://github.com/Bililive/BililiveRecorder")
    (synopsis "BiliBili live stream recorder CLI binary")
    (description
     "bililive-recorder-bin repackages the upstream CLI binary release of
BililiveRecorder for recording BiliBili live streams.")
    (license license:gpl3)))

(define-public iwmenu-bin
  (make-single-executable-binary-package
   "iwmenu-bin"
   "iwmenu"
   "0.4.0"
   "https://github.com/e-tho/iwmenu/releases/download/v0.4.0/iwmenu-x86_64-linux-gnu"
   "1pwkv6a8h5kx82dn7wpd9n701i510v2zwjzykd66r9rpm9pkc2rf"
   "Launcher-driven Wi-Fi manager binary"
   "iwmenu-bin repackages the upstream prebuilt iwmenu Linux executable."
   "https://github.com/e-tho/iwmenu"
   license:gpl3))

(define-public bzmenu-bin
  (make-single-executable-binary-package
   "bzmenu-bin"
   "bzmenu"
   "0.4.0"
   "https://github.com/e-tho/bzmenu/releases/download/v0.4.0/bzmenu-x86_64-linux-gnu"
   "0ggnand2ih6s1si6amp0mnl9r6d4gjj65vx03kysmzdvggxy71a2"
   "Launcher-driven Bluetooth manager binary"
   "bzmenu-bin repackages the upstream prebuilt bzmenu Linux executable."
   "https://github.com/e-tho/bzmenu"
   license:gpl3))
