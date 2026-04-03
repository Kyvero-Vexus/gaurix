(define-module (gaurix packages queue-20260403p100daily6)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system copy)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:export (porty-bin
            repacman2
            launcherx-bin
            httm-bin
            apidash-bin
            base64-converter
            chatgpt-bin
            cdncheck-bin
            ttf-bizter
            magic-cpp
            queue-20260403p100daily6-recipe-drafts))

(define-public porty-bin
  (package
    (name "porty-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/trishan9/porty/releases/download/v1.0.0/porty-linux-amd64")
       (sha256
        (base32 "1lvhy2p8lbc7nbanz9z48h5msyy3gz68sb3fg5wq1akpv4p38l57"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin"))
                 (target (string-append bin "/porty")))
            (mkdir-p bin)
            (copy-file src target)
            (chmod target #o755)))))
    (home-page "https://github.com/trishan9/porty")
    (synopsis "Minimal local file transfer utility")
    (description
     "Porty is a lightweight command-line utility for sharing files over
HTTP on local networks.  This package repackages the upstream prebuilt
x86_64 Linux binary.")
    (license license:expat)))

(define-public repacman2
  (package
    (name "repacman2")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/helixarch/repacman2/archive/2.0.tar.gz")
       (sha256
        (base32 "056ywd0i6zklr4bplw9v544b6snwyvb8dwl0vfq93pm7vvk4qf3c"))))
    (build-system copy-build-system)
    (inputs (list bash-minimal))
    (arguments
     (list
      #:install-plan
      '(("repacman" "bin/repacman2")
        ("LICENSE" "share/doc/repacman2/LICENSE")
        ("README.md" "share/doc/repacman2/README.md"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-script
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((bash (search-input-file inputs "/bin/bash")))
                (substitute* "repacman"
                  (("#!/usr/bin/sh")
                   (string-append "#!" bash))
                  (("arch=`pacman -Qi .*")
                   "arch=`sed -n '/%ARCH%/{n;p;q}' \"$package_dir/desc\"`")))
              (chmod "repacman" #o755)
              #t)))))
    (home-page "https://github.com/helixarch/repacman2")
    (synopsis "Recreate Arch Linux package archives from local pacman database")
    (description
     "Repacman2 recreates package archives from an existing pacman local
package database.  This recipe installs the upstream script and patches it to
read architecture data directly from package metadata, avoiding a hard runtime
dependency on the pacman executable.")
    (license license:gpl2)))

(define-public launcherx-bin
  (package
    (name "launcherx-bin")
    (version "2026.2.19")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://api.corona.studio/Build/get/796a33f4-8d91-4607-b40a-6d60c2c8dce8/net10.0-linux.linux-x64.zip")
       (sha256
        (base32 "14b10bw0v6nw216v2bhbc8iq04n84qxsk55svinzjzzrgngqnvg4"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     (list unzip
           `("launcherx-desktop"
             ,(origin
                (method url-fetch)
                (uri "https://aur.archlinux.org/cgit/aur.git/plain/LauncherX.desktop?h=launcherx-bin")
                (sha256
                 (base32 "0jd43583ld32hrvjjzmgm1a4ba77bjmyn8qzlvmi5fc7xpnk7kk9"))))
           `("launcherx-icon"
             ,(origin
                (method url-fetch)
                (uri "https://aur.archlinux.org/cgit/aur.git/plain/LauncherX.png?h=launcherx-bin")
                (sha256
                 (base32 "0q43z1cxynivjzql08q2jc2hr45jcpj63irzp2xcnq1czq3k6q0j"))))))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (desktop-src (assoc-ref %build-inputs "launcherx-desktop"))
                 (icon-src (assoc-ref %build-inputs "launcherx-icon"))
                 (work (string-append (getcwd) "/unpack"))
                 (opt (string-append out "/opt/launcherx"))
                 (bin (string-append out "/bin"))
                 (desktop-out (string-append out "/share/applications/launcherx.desktop"))
                 (icon-out (string-append out "/share/icons/hicolor/256x256/apps/launcherx.png"))
                 (launcher-target (string-append opt "/LauncherX")))
            (mkdir-p work)
            (invoke unzip "-q" src "-d" work)

            (mkdir-p opt)
            (copy-file (string-append work "/LauncherX") launcher-target)
            (chmod launcher-target #o755)

            (mkdir-p bin)
            (symlink launcher-target (string-append bin "/launcherx"))

            (mkdir-p (dirname desktop-out))
            (copy-file desktop-src desktop-out)
            (substitute* desktop-out
              (("Exec=.*") "Exec=launcherx\n")
              (("Icon=.*") "Icon=launcherx\n"))

            (mkdir-p (dirname icon-out))
            (copy-file icon-src icon-out)
            #t))))
    (home-page "https://corona.studio/lx")
    (synopsis "LauncherX Minecraft launcher (prebuilt binary)")
    (description
     "LauncherX is a Minecraft launcher distributed by Corona Studio.  This
package repackages the upstream Linux x86_64 binary build and installs desktop
integration files from the AUR package source.")
    (license license:expat)))

(define-public httm-bin
  (package
    (name "httm-bin")
    (version "0.49.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/kimono-koans/httm/releases/download/0.49.9/httm_0.49.9-1_amd64.deb")
       (sha256
        (base32 "1n1zvzj489nwlfzaayi68c3gr93pl3vb5ky5ip48pmnj7pp9f4fp"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
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
                 (bin-out (string-append out "/bin"))
                 (man-out (string-append out "/share/man"))
                 (doc-out (string-append out "/share/doc/httm")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz)
                    "-xf" "data.tar.xz")

            (mkdir-p bin-out)
            (copy-recursively "usr/bin" bin-out)

            (when (file-exists? "usr/share/man")
              (mkdir-p man-out)
              (copy-recursively "usr/share/man" man-out))

            (when (file-exists? "usr/share/doc/httm")
              (mkdir-p doc-out)
              (copy-recursively "usr/share/doc/httm" doc-out))
            #t))))
    (home-page "https://github.com/kimono-koans/httm")
    (synopsis "Interactive CLI for zfs/btrfs snapshot file recovery")
    (description
     "Httm displays the location of files in ZFS and Btrfs snapshots and can
facilitate interactive recovery.  This package repackages the upstream Debian
x86_64 binary release.")
    (license license:mpl2.0)))

(define-public apidash-bin
  (package
    (name "apidash-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/foss42/apidash/releases/download/v0.3.0/apidash-linux-amd64.deb")
       (sha256
        (base32 "00sc2rlsbhjh74sgyyx5gyq4832m04cjia22sds591k3iqw8gpvd"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs (list binutils tar zstd))
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
                 (unzstd (search-input-file %build-inputs "/bin/unzstd"))
                 (appdir (string-append out "/share/apidash"))
                 (desktop-out (string-append out "/share/applications/apidash.desktop"))
                 (icons-out (string-append out "/share/icons"))
                 (wrapper (string-append out "/bin/apidash")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" unzstd)
                    "-xf" "data.tar.zst")

            (mkdir-p appdir)
            (copy-recursively "usr/share/apidash" appdir)

            (mkdir-p (dirname desktop-out))
            (copy-file "usr/share/applications/apidash.desktop" desktop-out)

            (mkdir-p icons-out)
            (copy-recursively "usr/share/icons" icons-out)

            (mkdir-p (dirname wrapper))
            (call-with-output-file wrapper
              (lambda (port)
                (display "#!/bin/sh\n" port)
                (display (string-append "exec \"" appdir "/apidash\" \"$@\"\n") port)))
            (chmod wrapper #o755)
            #t))))
    (home-page "https://github.com/foss42/apidash")
    (synopsis "API client application (prebuilt binary)")
    (description
     "API Dash is an API client for testing and documenting HTTP APIs.  This
package repackages the upstream Debian x86_64 release with desktop files and
icons.")
    (license license:asl2.0)))

(define-public base64-converter
  (package
    (name "base64-converter")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/denix666/base64-converter/releases/download/v0.1.4/base64-converter_linux_x86_64.tar.gz")
       (sha256
        (base32 "1db97vygw8kmpi0zzar9bsg745xhrdykjl67ngbvmw2z9m6k54kv"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
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
                 (work (string-append (getcwd) "/work"))
                 (bin-out (string-append out "/bin"))
                 (icon-out (string-append out "/share/icons/hicolor/256x256/apps/base64-converter.png"))
                 (desktop-out (string-append out "/share/applications/base64-converter.desktop"))
                 (binary (string-append work "/base64-converter")))
            (mkdir-p work)
            (invoke tar "-xf" src "-C" work)

            (mkdir-p bin-out)
            (copy-file binary (string-append bin-out "/base64-converter"))
            (chmod (string-append bin-out "/base64-converter") #o755)

            (mkdir-p (dirname icon-out))
            (copy-file (string-append work "/assets/base64.png") icon-out)

            (mkdir-p (dirname desktop-out))
            (call-with-output-file desktop-out
              (lambda (port)
                (display "[Desktop Entry]\n" port)
                (display "Type=Application\n" port)
                (display "Name=Base64 Converter\n" port)
                (display "Comment=Convert text to and from Base64\n" port)
                (display "Exec=base64-converter\n" port)
                (display "Icon=base64-converter\n" port)
                (display "Terminal=false\n" port)
                (display "Categories=Utility;\n" port)))
            #t))))
    (home-page "https://github.com/denix666/base64-converter")
    (synopsis "Desktop Base64 encode/decode utility")
    (description
     "Base64 Converter is a small desktop utility to encode and decode text
using Base64.  This package repackages the upstream Linux x86_64 binary
release.")
    (license license:expat)))

(define-public chatgpt-bin
  (package
    (name "chatgpt-bin")
    (version "1.3.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/j178/chatgpt/releases/download/v1.3.5/chatgpt_Linux_x86_64.tar.gz")
       (sha256
        (base32 "10i2g6xax1hinj79v3fpws3lwv04dk60kzzmdlpbzg6l3q55804k"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
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
                 (work (string-append (getcwd) "/work"))
                 (bin-out (string-append out "/bin"))
                 (doc-out (string-append out "/share/doc/chatgpt-bin")))
            (mkdir-p work)
            (invoke tar "-xf" src "-C" work)

            (mkdir-p bin-out)
            (copy-file (string-append work "/chatgpt")
                       (string-append bin-out "/chatgpt"))
            (chmod (string-append bin-out "/chatgpt") #o755)

            (mkdir-p doc-out)
            (copy-file (string-append work "/README.md")
                       (string-append doc-out "/README.md"))
            #t))))
    (home-page "https://github.com/j178/chatgpt")
    (synopsis "Interactive ChatGPT terminal client")
    (description
     "ChatGPT is a terminal client for interacting with OpenAI-compatible
chat APIs.  This package repackages the upstream Linux x86_64 binary release.")
    (license license:expat)))

(define-public cdncheck-bin
  (package
    (name "cdncheck-bin")
    (version "1.2.29")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/projectdiscovery/cdncheck/releases/download/v1.2.29/cdncheck_1.2.29_linux_amd64.zip")
       (sha256
        (base32 "1gb1qv7a08x7ddck73zwyj1akmri3k61xpz6pyx7fc2lv86q7rrf"))))
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
                 (bin-out (string-append out "/bin"))
                 (doc-out (string-append out "/share/doc/cdncheck-bin")))
            (mkdir-p work)
            (invoke unzip "-q" src "-d" work)

            (mkdir-p bin-out)
            (copy-file (string-append work "/cdncheck")
                       (string-append bin-out "/cdncheck"))
            (chmod (string-append bin-out "/cdncheck") #o755)

            (mkdir-p doc-out)
            (copy-file (string-append work "/README.md")
                       (string-append doc-out "/README.md"))
            (copy-file (string-append work "/LICENSE.md")
                       (string-append doc-out "/LICENSE.md"))
            #t))))
    (home-page "https://github.com/projectdiscovery/cdncheck")
    (synopsis "Check whether domains are behind known CDNs")
    (description
     "Cdncheck identifies whether target domains are fronted by known CDN
providers.  This package repackages the upstream Linux x86_64 binary release.")
    (license license:expat)))

(define-public ttf-bizter
  (package
    (name "ttf-bizter")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/yuru7/BIZTER/releases/download/v0.0.2/BIZTER_v0.0.2.zip")
       (sha256
        (base32 "0mdl83vmh2mvlhdvxzf2awyj0shsk6awss74b3rr466hm2w352r8"))))
    (build-system trivial-build-system)
    (native-inputs
     (list unzip
           `("license-file"
             ,(origin
                (method url-fetch)
                (uri "https://github.com/yuru7/BIZTER/raw/refs/tags/v0.0.2/LICENSE")
                (sha256
                 (base32 "1fhy1z5p179m4hqvgyi4s8ppl1khblsg0wimdpwrl49n523b40sy"))))))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (license-file (assoc-ref %build-inputs "license-file"))
                 (work (string-append (getcwd) "/work"))
                 (font-out (string-append out "/share/fonts/truetype"))
                 (doc-out (string-append out "/share/doc/ttf-bizter")))
            (mkdir-p work)
            (invoke unzip "-q" src "-d" work)

            (mkdir-p font-out)
            (for-each (lambda (font)
                        (install-file font font-out))
                      (find-files work "\\.ttf$"))

            (mkdir-p doc-out)
            (copy-file license-file (string-append doc-out "/LICENSE"))
            #t))))
    (home-page "https://github.com/yuru7/BIZTER")
    (synopsis "BIZTER Japanese programming font family")
    (description
     "BIZTER is a Japanese programming font family derived from BIZ UD
Gothic and HackGen.  This package installs the upstream TrueType font files.")
    (license license:silofl1.1)))

(define-public magic-cpp
  (package
    (name "magic-cpp")
    (version "r37.3a2c23c")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/16bit-ykiko/magic-cpp/archive/3a2c23c5daf300872b2c5b8777efaca1ea217259.tar.gz")
       (sha256
        (base32 "0m5d8w7qd7zbydq4zikg7k2s7mkj3zmqny3z9ksg55gqri7hx6bc"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      '(("include/magic" "include/magic")
        ("LICENSE" "share/doc/magic-cpp/LICENSE")
        ("README.md" "share/doc/magic-cpp/README.md"))))
    (home-page "https://github.com/16bit-ykiko/magic-cpp")
    (synopsis "Header-only C++ reflection and metaprogramming utilities")
    (description
     "magic-cpp is a header-only C++ utility collection that provides
compile-time reflection helpers and type-introspection primitives.")
    (license license:expat)))

(define-public queue-20260403p100daily6-recipe-drafts
  '(
    ("faketty" "draft-started")
    ("deadlock-api-ingest-git" "draft-started")
    ("simsimd" "draft-started")
    ("porty-bin" "completed")
    ("gh-skyline" "draft-started")
    ("libbsc" "draft-started")
    ("passless-boot" "draft-started")
    ("bsc-m03" "draft-started")
    ("statecraft" "draft-started")
    ("typesetter" "draft-started")
    ("dietpdf-bin" "draft-started")
    ("python-gerbonara" "draft-started")
    ("git-hash-select" "draft-started")
    ("codanna" "draft-started")
    ("python-opr" "draft-started")
    ("python-memor" "draft-started")
    ("minutor-git" "draft-started")
    ("mint-l-theme" "draft-started")
    ("perl-compress-raw-lzma" "draft-started")
    ("powershell-editor-services" "draft-started")
    ("libmaddy" "draft-started")
    ("libnick" "draft-started")
    ("repacman2" "completed")
    ("launcherx-bin" "completed")
    ("devtoys-bin" "draft-started")
    ("mathematica-light" "draft-started")
    ("yt6801-dkms" "draft-started")
    ("duperemove-service" "draft-started")
    ("hmcl-dev" "draft-started")
    ("gamescope-session-git" "draft-started")
    ("ipscan-bin" "draft-started")
    ("lmstudio-beta" "draft-started")
    ("kdeconnect-no-mdns" "draft-started")
    ("play-timer" "draft-started")
    ("brother-dcp1610w" "draft-started")
    ("httm-bin" "completed")
    ("tlrc" "draft-started")
    ("arch-checkfw" "draft-started")
    ("pacman-systemd-inhibit" "draft-started")
    ("youtube-music-for-desktop-bin" "draft-started")
    ("ksh93-git" "draft-started")
    ("papirus-folders-git" "draft-started")
    ("apidash-bin" "completed")
    ("libva-nvidia-driver-git" "draft-started")
    ("koxtoolchain" "draft-started")
    ("diskm8" "draft-started")
    ("python-cirq" "draft-started")
    ("python-cirq-aqt" "draft-started")
    ("python-cirq-core" "draft-started")
    ("python-cirq-google" "draft-started")
    ("python-cirq-ionq" "draft-started")
    ("python-cirq-pasqal" "draft-started")
    ("python-cirq-web" "draft-started")
    ("python-duet" "draft-started")
    ("python-typedunits" "draft-started")
    ("ni-daqmx-base-bin" "draft-started")
    ("python-editdistance" "draft-started")
    ("prboom-plus" "draft-started")
    ("duply" "draft-started")
    ("base64-converter" "completed")
    ("golden-cheetah-git" "draft-started")
    ("omniorbpy" "draft-started")
    ("python-ompython" "draft-started")
    ("vapoursynth-plugin-waifu2x-ncnn-vulkan-git" "draft-started")
    ("libretro-neocd-git" "draft-started")
    ("leaflet" "draft-started")
    ("contextpilot-git" "draft-started")
    ("terminal-rain-lightning" "draft-started")
    ("libretro-prboom-git" "draft-started")
    ("inter-doom" "draft-started")
    ("inter-heretic" "draft-started")
    ("inter-hexen" "draft-started")
    ("psi-plus-nowebengine" "draft-started")
    ("twitter-media-downloader-bin" "draft-started")
    ("twitter-media-downloader-git" "draft-started")
    ("devkit-env" "draft-started")
    ("ntfs2btrfs" "draft-started")
    ("catppuccin-konsole-theme-git" "draft-started")
    ("chatgpt-bin" "completed")
    ("cdncheck-bin" "completed")
    ("python-chromaterm" "draft-started")
    ("sequoia-octopus-librnp" "draft-started")
    ("musicfree-desktop" "draft-started")
    ("nextcloud-app-user-usage-report" "draft-started")
    ("salome-kernel" "draft-started")
    ("latynka-kbd" "draft-started")
    ("halloy-git" "draft-started")
    ("ridecost" "draft-started")
    ("wallpaperengine-gui" "draft-started")
    ("wallpaperengine-gui-git" "draft-started")
    ("transgui-git" "draft-started")
    ("musique111-qt5" "draft-started")
    ("ttf-bizter" "completed")
    ("k3s-1.34-bin" "draft-started")
    ("gprofng-gui" "draft-started")
    ("ansiweather" "draft-started")
    ("google-calender-widget" "draft-started")
    ("magic-cpp" "completed")
    ("wizstr" "draft-started")
    ("sqlite-dist" "draft-started")
    ))

