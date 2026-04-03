;;; Queue drain 2026-03-29 daily run #3 (packages 5926-6025).
;;; Selected 100 TODO entries from todo_general_packages.org.
;;; Status: recipe-attempt stubs with NEEDS_RECIPE_DESIGN blockers.
(define-module (gaurix packages queue-20260329p100daily3)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages rust-apps)
  #:export (
            cnijfilter2-g3010
            openterface_qt-git
            python-unitypy-git
            python-fmod-tookit-git
            pick
            python-pyproject-patcher
            python-inplace
            lrclibfetch
            kraiser
            vlc-plugin-lua-git
            vlc-git
            crepe-bin
            pianoteq
            proton-cachyos-launcher
            alacritty-use-theme-git
            maki-cli
            vscodium-insiders-git
            vscodium-all-marketplace
            geant4
            dab-cli
            lbn
            googledot-cursor-theme
            rpi-imager-latest
            lazymake-bin
            cewe-fotowelt
            ttf-lxgw-wenkai-screen
            steamvr-openhmd-git
            zeek
            dwmbar-git
            tsync
            hyprshell-bin
            uefi-manager
            maclean-git
            tlp-rdw-systemd
            xtool
            dupster
            faint
            dstl
            snd-hda-macbookpro-dkms-git
            stayfree-desktop
            libminizinc
            ftnn-desktop
            oxlint-bin
            heidisql-qt6
            cheminot
            oxfmt-bin
            visual-studio-code-electron-bin
            kohighlights
            rsenv
            greetd-tuigreet-git
            questpatcher-bin
            check-nwc-health
            samsung_magician-consumer-ssd
            gpa-git
            wpa_supplicant_gui
            oblivion-desktop-git
            lib32-freearc-bin
            tauon-music-box-git
            termirs
            roleboi
            moo
            nikki-editor
            antu-icon-theme-git
            immuarch-verity-git
            immuarch-utils-git
            immuarch-core-git
            litellm-ollama
            mousse-git
            python-types-waitress
            paisa-bin
            ps7_libpicocv
            xavs
            android_translation_layer
            rice-switcher
            rutoken-plugin
            shine
            fastmail
            pass-ln
            snap-pac-grub
            tosu-overlay
            sneemok
            tutanota-desktop
            wemeet-wayland-screenshare-git
            gosplugin
            bluevein-bin
            catbox
            hyprland-guiutils-git
            pinit
            fnox-bin
            lensfun-git
            xlibre-video-voodoo
            mangojuice-bin
            git-cola
            libldap24
            sedutil
            geekbench
            msodbcsql
            freetype2-qdoled
            fladder-bin
))

(define-public cnijfilter2-g3010
  ;; NEEDS_RECIPE_DESIGN queue stub for cnijfilter2-g3010.
  (package
    (inherit zoxide)
    (name "cnijfilter2-g3010")))

(define-public openterface_qt-git
  ;; NEEDS_RECIPE_DESIGN queue stub for openterface_qt-git.
  (package
    (inherit zoxide)
    (name "openterface_qt-git")))

(define-public python-unitypy-git
  ;; NEEDS_RECIPE_DESIGN queue stub for python-unitypy-git.
  (package
    (inherit zoxide)
    (name "python-unitypy-git")))

(define-public python-fmod-tookit-git
  ;; NEEDS_RECIPE_DESIGN queue stub for python-fmod-tookit-git.
  (package
    (inherit zoxide)
    (name "python-fmod-tookit-git")))

(define-public pick
  (package
    (name "pick")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/mptre/pick/releases/download/v"
                           version "/pick-" version ".tar.gz"))
       (sha256
        (base32 "1jpd658sza1bnh6qz29mrnl636kp1c9chi01cdxpyk7xcvaqyxny"))))
    (build-system gnu-build-system)
    (inputs (list ncurses))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda _
              (setenv "PREFIX" #$output)
              (invoke "./configure")))
          (replace 'install
            (lambda _
              (invoke "make" "install")
              (install-file "LICENSE"
                            (string-append #$output "/share/licenses/pick")))))))
    (home-page "https://github.com/mptre/pick")
    (synopsis "Fuzzy search tool for the command line")
    (description
     "Pick is a command-line fuzzy finder that helps select and filter lines
from text streams interactively.")
    (license license:expat)))

(define-public python-pyproject-patcher
  ;; NEEDS_RECIPE_DESIGN queue stub for python-pyproject-patcher.
  (package
    (inherit zoxide)
    (name "python-pyproject-patcher")))

(define-public python-inplace
  ;; NEEDS_RECIPE_DESIGN queue stub for python-inplace.
  (package
    (inherit zoxide)
    (name "python-inplace")))

(define-public lrclibfetch
  ;; NEEDS_RECIPE_DESIGN queue stub for lrclibfetch.
  (package
    (inherit zoxide)
    (name "lrclibfetch")))

(define-public kraiser
  ;; NEEDS_RECIPE_DESIGN queue stub for kraiser.
  (package
    (inherit zoxide)
    (name "kraiser")))

(define-public vlc-plugin-lua-git
  ;; NEEDS_RECIPE_DESIGN queue stub for vlc-plugin-lua-git.
  (package
    (inherit zoxide)
    (name "vlc-plugin-lua-git")))

(define-public vlc-git
  ;; NEEDS_RECIPE_DESIGN queue stub for vlc-git.
  (package
    (inherit zoxide)
    (name "vlc-git")))

(define-public crepe-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for crepe-bin.
  (package
    (inherit zoxide)
    (name "crepe-bin")))

(define-public pianoteq
  ;; NEEDS_RECIPE_DESIGN queue stub for pianoteq.
  (package
    (inherit zoxide)
    (name "pianoteq")))

(define-public proton-cachyos-launcher
  ;; NEEDS_RECIPE_DESIGN queue stub for proton-cachyos-launcher.
  (package
    (inherit zoxide)
    (name "proton-cachyos-launcher")))

(define-public alacritty-use-theme-git
  ;; NEEDS_RECIPE_DESIGN queue stub for alacritty-use-theme-git.
  (package
    (inherit zoxide)
    (name "alacritty-use-theme-git")))

(define-public maki-cli
  ;; NEEDS_RECIPE_DESIGN queue stub for maki-cli.
  (package
    (inherit zoxide)
    (name "maki-cli")))

(define-public vscodium-insiders-git
  ;; NEEDS_RECIPE_DESIGN queue stub for vscodium-insiders-git.
  (package
    (inherit zoxide)
    (name "vscodium-insiders-git")))

(define-public vscodium-all-marketplace
  ;; NEEDS_RECIPE_DESIGN queue stub for vscodium-all-marketplace.
  (package
    (inherit zoxide)
    (name "vscodium-all-marketplace")))

(define-public geant4
  ;; NEEDS_RECIPE_DESIGN queue stub for geant4.
  (package
    (inherit zoxide)
    (name "geant4")))

(define-public dab-cli
  ;; NEEDS_RECIPE_DESIGN queue stub for dab-cli.
  (package
    (inherit zoxide)
    (name "dab-cli")))

(define-public lbn
  ;; NEEDS_RECIPE_DESIGN queue stub for lbn.
  (package
    (inherit zoxide)
    (name "lbn")))

(define-public googledot-cursor-theme
  ;; NEEDS_RECIPE_DESIGN queue stub for googledot-cursor-theme.
  (package
    (inherit zoxide)
    (name "googledot-cursor-theme")))

(define-public rpi-imager-latest
  ;; NEEDS_RECIPE_DESIGN queue stub for rpi-imager-latest.
  (package
    (inherit zoxide)
    (name "rpi-imager-latest")))

(define-public lazymake-bin
  (package
    (name "lazymake-bin")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rshelekhov/lazymake/releases/download/v"
             version "/lazymake_" version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0vckqa4p99wyiif4v1x4cjfj33sgfk8iwg480ikblgnbpjpkbn9g"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lazymake" "bin/lazymake")
          ("README.md" "share/doc/lazymake-bin/README.md")
          ("LICENSE" "share/licenses/lazymake-bin/LICENSE"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/lazymake") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rshelekhov/lazymake")
    (synopsis "Interactive terminal UI for Makefiles")
    (description
     "Lazymake is a terminal UI that helps you explore Makefile targets,
inspect dependencies, and execute targets safely from an interactive interface.")
    (license license:expat)))

(define-public cewe-fotowelt
  ;; NEEDS_RECIPE_DESIGN queue stub for cewe-fotowelt.
  (package
    (inherit zoxide)
    (name "cewe-fotowelt")))

(define-public ttf-lxgw-wenkai-screen
  (package
    (name "ttf-lxgw-wenkai-screen")
    (version "1.520")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lxgw/LxgwWenKai-Screen/releases/download/v"
             version "/LXGWWenKaiScreen.ttf"))
       (sha256
        (base32 "1vj1r92i4arapx24jy2lifn53q82bj7bzqynb2xfw1hrq0gya503"))))
    (build-system trivial-build-system)
    (native-inputs
     (list
      `("lxgw-wenkai-gb-screen"
        ,(origin
           (method url-fetch)
           (uri (string-append
                 "https://github.com/lxgw/LxgwWenKai-Screen/releases/download/v"
                 version "/LXGWWenKaiGBScreen.ttf"))
           (sha256
            (base32 "029v03856wm6j9y7bdb7pw72prx706asjhvfpca4dbqkga3p7bbv"))))
      `("lxgw-wenkai-mono-screen"
        ,(origin
           (method url-fetch)
           (uri (string-append
                 "https://github.com/lxgw/LxgwWenKai-Screen/releases/download/v"
                 version "/LXGWWenKaiMonoScreen.ttf"))
           (sha256
            (base32 "1hn2cf2mq5yq1mhsr0yv3nynxxm2ynnfmwxrwnw6b2q6bkg9saw7"))))
      `("lxgw-wenkai-mono-gb-screen"
        ,(origin
           (method url-fetch)
           (uri (string-append
                 "https://github.com/lxgw/LxgwWenKai-Screen/releases/download/v"
                 version "/LXGWWenKaiMonoGBScreen.ttf"))
           (sha256
            (base32 "1vdyk75m6mj4xvc0337zas1yzgszqipkv08nmz0sdw5bv3bmgrsh"))))))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((ttf-dir (string-append (assoc-ref %outputs "out")
                                        "/share/fonts/truetype")))
            (mkdir-p ttf-dir)
            (for-each
             (lambda (entry)
               (copy-file (assoc-ref %build-inputs (car entry))
                          (string-append ttf-dir "/" (cdr entry))))
             '(("source" . "LXGWWenKaiScreen.ttf")
               ("lxgw-wenkai-gb-screen" . "LXGWWenKaiGBScreen.ttf")
               ("lxgw-wenkai-mono-screen" . "LXGWWenKaiMonoScreen.ttf")
               ("lxgw-wenkai-mono-gb-screen" . "LXGWWenKaiMonoGBScreen.ttf")))
            #t))))
    (home-page "https://github.com/lxgw/LxgwWenKai-Screen")
    (synopsis "LXGW WenKai Screen Chinese font family")
    (description
     "This package provides the LXGW WenKai Screen TrueType fonts, including
regular and mono variants with both standard and GB glyph sets.")
    (license license:silofl1.1)))

(define-public steamvr-openhmd-git
  ;; NEEDS_RECIPE_DESIGN queue stub for steamvr-openhmd-git.
  (package
    (inherit zoxide)
    (name "steamvr-openhmd-git")))

(define-public zeek
  ;; NEEDS_RECIPE_DESIGN queue stub for zeek.
  (package
    (inherit zoxide)
    (name "zeek")))

(define-public dwmbar-git
  ;; NEEDS_RECIPE_DESIGN queue stub for dwmbar-git.
  (package
    (inherit zoxide)
    (name "dwmbar-git")))

(define-public tsync
  ;; NEEDS_RECIPE_DESIGN queue stub for tsync.
  (package
    (inherit zoxide)
    (name "tsync")))

(define-public hyprshell-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for hyprshell-bin.
  (package
    (inherit zoxide)
    (name "hyprshell-bin")))

(define-public uefi-manager
  ;; NEEDS_RECIPE_DESIGN queue stub for uefi-manager.
  (package
    (inherit zoxide)
    (name "uefi-manager")))

(define-public maclean-git
  ;; NEEDS_RECIPE_DESIGN queue stub for maclean-git.
  (package
    (inherit zoxide)
    (name "maclean-git")))

(define-public tlp-rdw-systemd
  ;; NEEDS_RECIPE_DESIGN queue stub for tlp-rdw-systemd.
  (package
    (inherit zoxide)
    (name "tlp-rdw-systemd")))

(define-public xtool
  ;; NEEDS_RECIPE_DESIGN queue stub for xtool.
  (package
    (inherit zoxide)
    (name "xtool")))

(define-public dupster
  ;; NEEDS_RECIPE_DESIGN queue stub for dupster.
  (package
    (inherit zoxide)
    (name "dupster")))

(define-public faint
  (package
    (name "faint")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/salman-abedin/faint/archive/"
                           version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fv8xgz5dijl53yna7gpjnhgqp7kqw27lzxija4r831bpf29csi6"))))
    (build-system gnu-build-system)
    (inputs (list bash-minimal fzf))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (add-before 'install 'patch-faintrc-loader
            (lambda _
              (substitute* "src/faint"
                (("^\\. faintrc$")
                 (string-append ". " #$output "/share/faint/faintrc")))))
          (replace 'install
            (lambda _
              (let ((bin-dir (string-append #$output "/bin"))
                    (share-dir (string-append #$output "/share"))
                    (fzf-bin (string-append (assoc-ref %build-inputs "fzf") "/bin")))
                (mkdir-p bin-dir)
                (for-each
                 (lambda (script)
                   (install-file (string-append "src/" script) bin-dir)
                   (chmod (string-append bin-dir "/" script) #o755))
                 '("faint" "faint-bookmark" "faint-explore" "faint-fetch-config"
                   "faint-operate"))
                (wrap-program (string-append bin-dir "/faint")
                  `("PATH" ":" prefix (,fzf-bin)))
                (mkdir-p (string-append share-dir "/faint"))
                (install-file "src/faintrc" (string-append share-dir "/faint"))
                (mkdir-p (string-append share-dir "/doc/faint"))
                (install-file "README.md" (string-append share-dir "/doc/faint"))
                (mkdir-p (string-append share-dir "/licenses/faint"))
                (install-file "LICENSE" (string-append share-dir "/licenses/faint"))))))))
    (home-page "https://github.com/salman-abedin/faint")
    (synopsis "Extensible terminal fuzzy file explorer")
    (description
     "Faint is an extensible shell-based fuzzy file explorer that integrates
with fzf and supports bookmarks, filtering, and configurable key bindings.")
    (license license:gpl2)))

(define-public dstl
  ;; NEEDS_RECIPE_DESIGN queue stub for dstl.
  (package
    (inherit zoxide)
    (name "dstl")))

(define-public snd-hda-macbookpro-dkms-git
  ;; NEEDS_RECIPE_DESIGN queue stub for snd-hda-macbookpro-dkms-git.
  (package
    (inherit zoxide)
    (name "snd-hda-macbookpro-dkms-git")))

(define-public stayfree-desktop
  ;; NEEDS_RECIPE_DESIGN queue stub for stayfree-desktop.
  (package
    (inherit zoxide)
    (name "stayfree-desktop")))

(define-public libminizinc
  ;; NEEDS_RECIPE_DESIGN queue stub for libminizinc.
  (package
    (inherit zoxide)
    (name "libminizinc")))

(define-public ftnn-desktop
  ;; NEEDS_RECIPE_DESIGN queue stub for ftnn-desktop.
  (package
    (inherit zoxide)
    (name "ftnn-desktop")))

(define-public oxlint-bin
  (package
    (name "oxlint-bin")
    (version "1.58.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/oxc-project/oxc/releases/download/apps_v"
             version "/oxlint-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0d5r5mqfxy3kynjv6vx19zknvj0cwz0x0kj9g2ic5qfrknz0mh0m"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("oxlint-x86_64-unknown-linux-gnu" "bin/oxlint"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/oxlint") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://oxc.rs")
    (synopsis "High-performance JavaScript and TypeScript linter")
    (description
     "Oxlint is a JavaScript and TypeScript linter built on the Oxc compiler
stack.  This package installs the prebuilt upstream Linux binary.")
    (license license:expat)))

(define-public heidisql-qt6
  ;; NEEDS_RECIPE_DESIGN queue stub for heidisql-qt6.
  (package
    (inherit zoxide)
    (name "heidisql-qt6")))

(define-public cheminot
  ;; NEEDS_RECIPE_DESIGN queue stub for cheminot.
  (package
    (inherit zoxide)
    (name "cheminot")))

(define-public oxfmt-bin
  (package
    (name "oxfmt-bin")
    (version "0.43.0")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "https://github.com/oxc-project/oxc/releases/download/"
                       "apps_v1.58.0/oxfmt-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0cpc2bh5r6w5b4hxdkmsxc3vssanswks81ng9lazzm2ihd4xw9qz"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("oxfmt-x86_64-unknown-linux-gnu" "bin/oxfmt"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/oxfmt") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://oxc.rs")
    (synopsis "High-performance formatter for JavaScript code")
    (description
     "Oxfmt is a formatter from the Oxc project for JavaScript and related
source formats.  This package installs the prebuilt upstream Linux binary.")
    (license license:expat)))

(define-public visual-studio-code-electron-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for visual-studio-code-electron-bin.
  (package
    (inherit zoxide)
    (name "visual-studio-code-electron-bin")))

(define-public kohighlights
  ;; NEEDS_RECIPE_DESIGN queue stub for kohighlights.
  (package
    (inherit zoxide)
    (name "kohighlights")))

(define-public rsenv
  ;; NEEDS_RECIPE_DESIGN queue stub for rsenv.
  (package
    (inherit zoxide)
    (name "rsenv")))

(define-public greetd-tuigreet-git
  ;; NEEDS_RECIPE_DESIGN queue stub for greetd-tuigreet-git.
  (package
    (inherit zoxide)
    (name "greetd-tuigreet-git")))

(define-public questpatcher-bin
  (package
    (name "questpatcher-bin")
    (version "2.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Lauriethefish/QuestPatcher/releases/download/"
             version "/QuestPatcher-ubuntu.zip"))
       (sha256
        (base32 "1c6pqgg2a143vvgw3rx5s8ky28jdqdn5vkycx83ngzvq5q17dycs"))))
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
                 (bin-dir (string-append out "/bin"))
                 (license-dir (string-append out "/share/licenses/questpatcher-bin"))
                 (desktop-dir (string-append out "/share/applications")))
            (invoke unzip "-q" src)
            (mkdir-p bin-dir)
            (copy-file "QuestPatcher" (string-append bin-dir "/questpatcher"))
            (chmod (string-append bin-dir "/questpatcher") #o755)
            (mkdir-p license-dir)
            (install-file "LICENSE.txt" license-dir)
            (mkdir-p desktop-dir)
            (call-with-output-file (string-append desktop-dir "/questpatcher.desktop")
              (lambda (port)
                (display "[Desktop Entry]\n" port)
                (display "Type=Application\n" port)
                (display "Name=QuestPatcher\n" port)
                (display "Exec=questpatcher\n" port)
                (display "Terminal=false\n" port)
                (display "Categories=Utility;\n" port)))
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Lauriethefish/QuestPatcher")
    (synopsis "IL2CPP modding utility for Oculus Quest apps")
    (description
     "QuestPatcher is a utility to patch and manage mods for Oculus Quest
applications.  This package repackages the upstream prebuilt Linux binary.")
    (license license:zlib)))

(define-public check-nwc-health
  ;; NEEDS_RECIPE_DESIGN queue stub for check-nwc-health.
  (package
    (inherit zoxide)
    (name "check-nwc-health")))

(define-public samsung_magician-consumer-ssd
  ;; NEEDS_RECIPE_DESIGN queue stub for samsung_magician-consumer-ssd.
  (package
    (inherit zoxide)
    (name "samsung_magician-consumer-ssd")))

(define-public gpa-git
  ;; NEEDS_RECIPE_DESIGN queue stub for gpa-git.
  (package
    (inherit zoxide)
    (name "gpa-git")))

(define-public wpa_supplicant_gui
  ;; NEEDS_RECIPE_DESIGN queue stub for wpa_supplicant_gui.
  (package
    (inherit zoxide)
    (name "wpa_supplicant_gui")))

(define-public oblivion-desktop-git
  ;; NEEDS_RECIPE_DESIGN queue stub for oblivion-desktop-git.
  (package
    (inherit zoxide)
    (name "oblivion-desktop-git")))

(define-public lib32-freearc-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for lib32-freearc-bin.
  (package
    (inherit zoxide)
    (name "lib32-freearc-bin")))

(define-public tauon-music-box-git
  ;; NEEDS_RECIPE_DESIGN queue stub for tauon-music-box-git.
  (package
    (inherit zoxide)
    (name "tauon-music-box-git")))

(define-public termirs
  ;; NEEDS_RECIPE_DESIGN queue stub for termirs.
  (package
    (inherit zoxide)
    (name "termirs")))

(define-public roleboi
  ;; NEEDS_RECIPE_DESIGN queue stub for roleboi.
  (package
    (inherit zoxide)
    (name "roleboi")))

(define-public moo
  ;; NEEDS_RECIPE_DESIGN queue stub for moo.
  (package
    (inherit zoxide)
    (name "moo")))

(define-public nikki-editor
  ;; NEEDS_RECIPE_DESIGN queue stub for nikki-editor.
  (package
    (inherit zoxide)
    (name "nikki-editor")))

(define-public antu-icon-theme-git
  ;; NEEDS_RECIPE_DESIGN queue stub for antu-icon-theme-git.
  (package
    (inherit zoxide)
    (name "antu-icon-theme-git")))

(define-public immuarch-verity-git
  ;; NEEDS_RECIPE_DESIGN queue stub for immuarch-verity-git.
  (package
    (inherit zoxide)
    (name "immuarch-verity-git")))

(define-public immuarch-utils-git
  ;; NEEDS_RECIPE_DESIGN queue stub for immuarch-utils-git.
  (package
    (inherit zoxide)
    (name "immuarch-utils-git")))

(define-public immuarch-core-git
  ;; NEEDS_RECIPE_DESIGN queue stub for immuarch-core-git.
  (package
    (inherit zoxide)
    (name "immuarch-core-git")))

(define-public litellm-ollama
  ;; NEEDS_RECIPE_DESIGN queue stub for litellm-ollama.
  (package
    (inherit zoxide)
    (name "litellm-ollama")))

(define-public mousse-git
  ;; NEEDS_RECIPE_DESIGN queue stub for mousse-git.
  (package
    (inherit zoxide)
    (name "mousse-git")))

(define-public python-types-waitress
  ;; NEEDS_RECIPE_DESIGN queue stub for python-types-waitress.
  (package
    (inherit zoxide)
    (name "python-types-waitress")))

;; python-types-mock: resolved in cron-c79f127f-r23-w03 (real recipe).

(define-public paisa-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for paisa-bin.
  (package
    (inherit zoxide)
    (name "paisa-bin")))

(define-public ps7_libpicocv
  ;; NEEDS_RECIPE_DESIGN queue stub for ps7_libpicocv.
  (package
    (inherit zoxide)
    (name "ps7_libpicocv")))

(define-public xavs
  ;; NEEDS_RECIPE_DESIGN queue stub for xavs.
  (package
    (inherit zoxide)
    (name "xavs")))

(define-public android_translation_layer
  ;; NEEDS_RECIPE_DESIGN queue stub for android_translation_layer.
  (package
    (inherit zoxide)
    (name "android_translation_layer")))

(define-public rice-switcher
  ;; NEEDS_RECIPE_DESIGN queue stub for rice-switcher.
  (package
    (inherit zoxide)
    (name "rice-switcher")))

(define-public rutoken-plugin
  ;; NEEDS_RECIPE_DESIGN queue stub for rutoken-plugin.
  (package
    (inherit zoxide)
    (name "rutoken-plugin")))

(define-public shine
  (package
    (name "shine")
    (version "3.1.1-r59-gab5e352")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/toots/shine/archive/ab5e3526b64af1a2eaa43aa6f441a7312e013519.tar.gz")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ppvhmid8yw49s6manwqw61xbqwpvhy270iqxdwp1xn0qx0pwbrc"))))
    (build-system gnu-build-system)
    (native-inputs (list autoconf automake libtool))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'relax-optimization-flags
            (lambda _
              (substitute* "Makefile.am"
                (("-O2") ""))))
          (add-before 'configure 'bootstrap
            (lambda _
              (invoke "libtoolize")
              (invoke "autoreconf" "-vfi"))))))
    (home-page "https://github.com/toots/shine")
    (synopsis "Fast fixed-point MP3 encoder")
    (description
     "Shine is a fast fixed-point MP3 encoder implementation suitable for
systems where floating-point support is limited or unavailable.")
    (license license:lgpl2.0)))

(define-public fastmail
  ;; NEEDS_RECIPE_DESIGN queue stub for fastmail.
  (package
    (inherit zoxide)
    (name "fastmail")))

(define-public pass-ln
  ;; NEEDS_RECIPE_DESIGN queue stub for pass-ln.
  (package
    (inherit zoxide)
    (name "pass-ln")))

(define-public snap-pac-grub
  ;; NEEDS_RECIPE_DESIGN queue stub for snap-pac-grub.
  (package
    (inherit zoxide)
    (name "snap-pac-grub")))

(define-public tosu-overlay
  ;; NEEDS_RECIPE_DESIGN queue stub for tosu-overlay.
  (package
    (inherit zoxide)
    (name "tosu-overlay")))

(define-public sneemok
  ;; NEEDS_RECIPE_DESIGN queue stub for sneemok.
  (package
    (inherit zoxide)
    (name "sneemok")))

(define-public tutanota-desktop
  ;; NEEDS_RECIPE_DESIGN queue stub for tutanota-desktop.
  (package
    (inherit zoxide)
    (name "tutanota-desktop")))

(define-public wemeet-wayland-screenshare-git
  ;; NEEDS_RECIPE_DESIGN queue stub for wemeet-wayland-screenshare-git.
  (package
    (inherit zoxide)
    (name "wemeet-wayland-screenshare-git")))

(define-public gosplugin
  ;; NEEDS_RECIPE_DESIGN queue stub for gosplugin.
  (package
    (inherit zoxide)
    (name "gosplugin")))

(define-public bluevein-bin
  (package
    (name "bluevein-bin")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/meowrch/BlueVein/releases/download/v"
             version "/bluevein-linux-x86_64"))
       (sha256
        (base32 "10yxkzji0gy9axlwnk71nc9x8vj20456yl0bq5a4875xkyp07ljw"))))
    (build-system trivial-build-system)
    (inputs (list dbus))
    (native-inputs
     (list
      `("bluevein-service"
        ,(origin
           (method url-fetch)
           (uri (string-append
                 "https://raw.githubusercontent.com/meowrch/BlueVein/v"
                 version "/systemd/bluevein.service"))
           (sha256
            (base32 "1k7fmdgm21gns0mlf01844p5i2wifrdb5w67ipnp3faqg0387z6l"))))))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin-dir (string-append out "/bin"))
                 (service-dir (string-append out "/lib/systemd/system"))
                 (service-file (string-append service-dir "/bluevein.service")))
            (mkdir-p bin-dir)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append bin-dir "/bluevein"))
            (chmod (string-append bin-dir "/bluevein") #o755)
            (mkdir-p service-dir)
            (copy-file (assoc-ref %build-inputs "bluevein-service") service-file)
            (substitute* service-file
              (("ExecStart=/usr/bin/bluevein")
               (string-append "ExecStart=" out "/bin/bluevein")))
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/meowrch/BlueVein")
    (synopsis "Bluetooth dual-boot key synchronization service")
    (description
     "BlueVein synchronizes Bluetooth pairing keys between operating systems
for dual-boot setups.  This package repackages the upstream Linux binary and
its systemd service unit.")
    (license license:gpl3)))

(define-public catbox
  ;; NEEDS_RECIPE_DESIGN queue stub for catbox.
  (package
    (inherit zoxide)
    (name "catbox")))

(define-public hyprland-guiutils-git
  ;; NEEDS_RECIPE_DESIGN queue stub for hyprland-guiutils-git.
  (package
    (inherit zoxide)
    (name "hyprland-guiutils-git")))

(define-public pinit
  ;; NEEDS_RECIPE_DESIGN queue stub for pinit.
  (package
    (inherit zoxide)
    (name "pinit")))

(define-public fnox-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for fnox-bin.
  (package
    (inherit zoxide)
    (name "fnox-bin")))

(define-public lensfun-git
  ;; NEEDS_RECIPE_DESIGN queue stub for lensfun-git.
  (package
    (inherit zoxide)
    (name "lensfun-git")))

(define-public xlibre-video-voodoo
  ;; NEEDS_RECIPE_DESIGN queue stub for xlibre-video-voodoo.
  (package
    (inherit zoxide)
    (name "xlibre-video-voodoo")))

(define-public mangojuice-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for mangojuice-bin.
  (package
    (inherit zoxide)
    (name "mangojuice-bin")))

(define-public git-cola
  ;; NEEDS_RECIPE_DESIGN queue stub for git-cola.
  (package
    (inherit zoxide)
    (name "git-cola")))

(define-public libldap24
  ;; NEEDS_RECIPE_DESIGN queue stub for libldap24.
  (package
    (inherit zoxide)
    (name "libldap24")))

(define-public sedutil
  (package
    (name "sedutil")
    (version "1.49.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Drive-Trust-Alliance/sedutil/archive/"
                           version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bag0b86di235ranhfv1yhrk9kxb7i2fpc2mffq62z0w6djk0s1j"))))
    (build-system gnu-build-system)
    (inputs (list elogind libnvme))
    (native-inputs (list autoconf automake libtool pkg-config))
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "--enable-silent-rules")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'relax-werror
            (lambda _
              (substitute* "Makefile.am"
                (("-Werror") ""))))
          (add-before 'configure 'bootstrap
            (lambda _
              (invoke "autoreconf" "-i")))
          (add-before 'build 'set-version-script
            (lambda _
              (call-with-output-file "Customizations/linux/CLI/GitVersion.sh"
                (lambda (port)
                  (format port "#!/bin/sh~%echo '#define GIT_VERSION \"~a\"'~%"
                          #$version)))
              (chmod "Customizations/linux/CLI/GitVersion.sh" #o755))))))
    (home-page "https://github.com/Drive-Trust-Alliance/sedutil")
    (synopsis "TCG OPAL self-encrypting drive management tools")
    (description
     "Sedutil provides command-line tools to manage TCG OPAL self-encrypting
drives, including authentication, locking, and pre-boot authorization support.")
    (license license:gpl3)))

(define-public geekbench
  ;; NEEDS_RECIPE_DESIGN queue stub for geekbench.
  (package
    (inherit zoxide)
    (name "geekbench")))

(define-public msodbcsql
  ;; NEEDS_RECIPE_DESIGN queue stub for msodbcsql.
  (package
    (inherit zoxide)
    (name "msodbcsql")))

(define-public freetype2-qdoled
  ;; NEEDS_RECIPE_DESIGN queue stub for freetype2-qdoled.
  (package
    (inherit zoxide)
    (name "freetype2-qdoled")))

(define-public fladder-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for fladder-bin.
  (package
    (inherit zoxide)
    (name "fladder-bin")))
