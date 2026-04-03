;;; Queue drain 2026-03-29 daily run (packages 5726-5825).
;;; Selected 100 TODO entries from todo_general_packages.org.
;;; Status: recipe-attempt stubs with NEEDS_RECIPE_DESIGN blockers.
(define-module (gaurix packages queue-20260329p100daily)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages rust-apps)
  #:export (
            mcp-router-bin
            keepassxc-git
            antares-sql-bin
            pcbdraw
            brother-mfc-l3770cdw
            gnome-shell-extension-tiling-assistant
            aegisub-arch1t3cht-git
            soh-bin
            godot-beta-bin
            music-presence-bin
            spotdl
            dockcheck
            hayase-desktop-bin
            scream-git
            hyprland-per-window-layout
            rslsync
            mysql-clients
            libmysqlclient
            osaka-simulator
            hyprland-plugin-xtra-dispatchers
            hyprland-plugin-hyprwinwrap
            hyprland-plugin-hyprtrails
            hyprland-plugin-hyprscrolling
            hyprland-plugin-hyprfocus
            hyprland-plugin-hyprexpo
            hyprland-plugin-hyprbars
            hyprland-plugin-csgo-vulkan-fix
            hyprland-plugin-borders-plus-plus
            plasma6-applets-resources-monitor
            goat-cli
            rose-pine-hyprcursor
            passless-bin
            flutter-tool
            flutter-target-web
            flutter-target-linux
            flutter-target-android
            flutter-intellij-patch
            flutter-gradle
            flutter-devel
            flutter-common
            flutter-artifacts-sky-engine-google-bin
            flutter-artifacts-material-fonts-google-bin
            flutter-artifacts-gradle-google-bin
            flutter-artifacts-engine-web-google-bin
            flutter-artifacts-engine-linux-google-bin
            flutter-artifacts-engine-common-google-bin
            flutter-artifacts-engine-android-google-bin
            flutter-artifacts-dart-google-bin
            flutter
            outfieldr-git
            plasma6-applets-panel-spacer-extended
            mcpelauncher-ui
            abcde-musicbrainz-meta
            mcpelauncher-linux
            lib32-mcpelauncher-linux
            grimaur-git
            goverlay-git
            c-lolcat
            lx-music-desktop-bin
            perccli
            qqc2-desktop-style-git
            celt
            goocanvas2
            sabnzbd
            fontpreview
            arronax
            watt-toolkit-bin
            goxlr-utility
            winecx
            nvidia-340xx-settings
            libxnvctrl-340xx
            rescrobbled-git
            gnome-shell-extension-pop-shell-git
            gnome-shell-extension-wallpaper-slideshow
            pam_rssh
            godot-git
            linux-router
            vulkanscenegraph
            mathematica
            ttf-gelasio-variable
            ttf-gelasio
            xlibre-input-wacom
            xlibre-input-evdev
            audiveris
            xivlauncher
            roleboi-git
            alephone-phoenix
            steam-cloud-file-manager-bin
            indicator-sysmonitor-budgie-git
            indicator-sysmonitor-appindicator-git
            airrohr-firmware-flasher-git
            funchook
            dimensions-bin
            intel-ipu6-camera-hal-git
            icamerasrc-git
            intel-ipu6-dkms-git
            intel-ipu6-camera-bin
            js-util-bin
            intel-vision-drivers-dkms-git
            fastero
            moderncsv-bin
            ionosctl-bin
            fhc-bin
            mill-global
            qo-bin
            python-pandas-docs
            vex-tui-bin
            greenlight-bin
            kftui-bin
            waydroid-image-gapps
))

(define-public mcp-router-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for mcp-router-bin.
  (package
    (inherit zoxide)
    (name "mcp-router-bin")))

(define-public keepassxc-git
  ;; NEEDS_RECIPE_DESIGN queue stub for keepassxc-git.
  (package
    (inherit zoxide)
    (name "keepassxc-git")))

(define-public antares-sql-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for antares-sql-bin.
  (package
    (inherit zoxide)
    (name "antares-sql-bin")))

(define-public pcbdraw
  ;; NEEDS_RECIPE_DESIGN queue stub for pcbdraw.
  (package
    (inherit zoxide)
    (name "pcbdraw")))

(define-public brother-mfc-l3770cdw
  ;; NEEDS_RECIPE_DESIGN queue stub for brother-mfc-l3770cdw.
  (package
    (inherit zoxide)
    (name "brother-mfc-l3770cdw")))

(define-public gnome-shell-extension-tiling-assistant
  ;; NEEDS_RECIPE_DESIGN queue stub for gnome-shell-extension-tiling-assistant.
  (package
    (inherit zoxide)
    (name "gnome-shell-extension-tiling-assistant")))

(define-public aegisub-arch1t3cht-git
  ;; NEEDS_RECIPE_DESIGN queue stub for aegisub-arch1t3cht-git.
  (package
    (inherit zoxide)
    (name "aegisub-arch1t3cht-git")))

(define-public soh-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for soh-bin.
  (package
    (inherit zoxide)
    (name "soh-bin")))

(define-public godot-beta-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for godot-beta-bin.
  (package
    (inherit zoxide)
    (name "godot-beta-bin")))

(define-public music-presence-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for music-presence-bin.
  (package
    (inherit zoxide)
    (name "music-presence-bin")))

(define-public spotdl
  ;; NEEDS_RECIPE_DESIGN queue stub for spotdl.
  (package
    (inherit zoxide)
    (name "spotdl")))

(define-public dockcheck
  ;; NEEDS_RECIPE_DESIGN queue stub for dockcheck.
  (package
    (inherit zoxide)
    (name "dockcheck")))

(define-public hayase-desktop-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for hayase-desktop-bin.
  (package
    (inherit zoxide)
    (name "hayase-desktop-bin")))

(define-public scream-git
  ;; NEEDS_RECIPE_DESIGN queue stub for scream-git.
  (package
    (inherit zoxide)
    (name "scream-git")))

(define-public hyprland-per-window-layout
  ;; NEEDS_RECIPE_DESIGN queue stub for hyprland-per-window-layout.
  (package
    (inherit zoxide)
    (name "hyprland-per-window-layout")))

(define-public rslsync
  ;; NEEDS_RECIPE_DESIGN queue stub for rslsync.
  (package
    (inherit zoxide)
    (name "rslsync")))

(define-public mysql-clients
  ;; NEEDS_RECIPE_DESIGN queue stub for mysql-clients.
  (package
    (inherit zoxide)
    (name "mysql-clients")))

(define-public libmysqlclient
  ;; NEEDS_RECIPE_DESIGN queue stub for libmysqlclient.
  (package
    (inherit zoxide)
    (name "libmysqlclient")))

(define-public osaka-simulator
  ;; NEEDS_RECIPE_DESIGN queue stub for osaka-simulator.
  (package
    (inherit zoxide)
    (name "osaka-simulator")))

(define-public hyprland-plugin-xtra-dispatchers
  ;; NEEDS_RECIPE_DESIGN queue stub for hyprland-plugin-xtra-dispatchers.
  (package
    (inherit zoxide)
    (name "hyprland-plugin-xtra-dispatchers")))

(define-public hyprland-plugin-hyprwinwrap
  ;; NEEDS_RECIPE_DESIGN queue stub for hyprland-plugin-hyprwinwrap.
  (package
    (inherit zoxide)
    (name "hyprland-plugin-hyprwinwrap")))

(define-public hyprland-plugin-hyprtrails
  ;; NEEDS_RECIPE_DESIGN queue stub for hyprland-plugin-hyprtrails.
  (package
    (inherit zoxide)
    (name "hyprland-plugin-hyprtrails")))

(define-public hyprland-plugin-hyprscrolling
  ;; NEEDS_RECIPE_DESIGN queue stub for hyprland-plugin-hyprscrolling.
  (package
    (inherit zoxide)
    (name "hyprland-plugin-hyprscrolling")))

(define-public hyprland-plugin-hyprfocus
  ;; NEEDS_RECIPE_DESIGN queue stub for hyprland-plugin-hyprfocus.
  (package
    (inherit zoxide)
    (name "hyprland-plugin-hyprfocus")))

(define-public hyprland-plugin-hyprexpo
  ;; NEEDS_RECIPE_DESIGN queue stub for hyprland-plugin-hyprexpo.
  (package
    (inherit zoxide)
    (name "hyprland-plugin-hyprexpo")))

(define-public hyprland-plugin-hyprbars
  ;; NEEDS_RECIPE_DESIGN queue stub for hyprland-plugin-hyprbars.
  (package
    (inherit zoxide)
    (name "hyprland-plugin-hyprbars")))

(define-public hyprland-plugin-csgo-vulkan-fix
  ;; NEEDS_RECIPE_DESIGN queue stub for hyprland-plugin-csgo-vulkan-fix.
  (package
    (inherit zoxide)
    (name "hyprland-plugin-csgo-vulkan-fix")))

(define-public hyprland-plugin-borders-plus-plus
  ;; NEEDS_RECIPE_DESIGN queue stub for hyprland-plugin-borders-plus-plus.
  (package
    (inherit zoxide)
    (name "hyprland-plugin-borders-plus-plus")))

(define-public plasma6-applets-resources-monitor
  ;; NEEDS_RECIPE_DESIGN queue stub for plasma6-applets-resources-monitor.
  (package
    (inherit zoxide)
    (name "plasma6-applets-resources-monitor")))

(define-public goat-cli
  ;; NEEDS_RECIPE_DESIGN queue stub for goat-cli.
  (package
    (inherit zoxide)
    (name "goat-cli")))

(define-public rose-pine-hyprcursor
  ;; NEEDS_RECIPE_DESIGN queue stub for rose-pine-hyprcursor.
  (package
    (inherit zoxide)
    (name "rose-pine-hyprcursor")))

(define-public passless-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for passless-bin.
  (package
    (inherit zoxide)
    (name "passless-bin")))

(define-public flutter-tool
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-tool.
  (package
    (inherit zoxide)
    (name "flutter-tool")))

(define-public flutter-target-web
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-target-web.
  (package
    (inherit zoxide)
    (name "flutter-target-web")))

(define-public flutter-target-linux
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-target-linux.
  (package
    (inherit zoxide)
    (name "flutter-target-linux")))

(define-public flutter-target-android
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-target-android.
  (package
    (inherit zoxide)
    (name "flutter-target-android")))

(define-public flutter-intellij-patch
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-intellij-patch.
  (package
    (inherit zoxide)
    (name "flutter-intellij-patch")))

(define-public flutter-gradle
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-gradle.
  (package
    (inherit zoxide)
    (name "flutter-gradle")))

(define-public flutter-devel
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-devel.
  (package
    (inherit zoxide)
    (name "flutter-devel")))

(define-public flutter-common
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-common.
  (package
    (inherit zoxide)
    (name "flutter-common")))

(define-public flutter-artifacts-sky-engine-google-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-artifacts-sky-engine-google-bin.
  (package
    (inherit zoxide)
    (name "flutter-artifacts-sky-engine-google-bin")))

(define-public flutter-artifacts-material-fonts-google-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-artifacts-material-fonts-google-bin.
  (package
    (inherit zoxide)
    (name "flutter-artifacts-material-fonts-google-bin")))

(define-public flutter-artifacts-gradle-google-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-artifacts-gradle-google-bin.
  (package
    (inherit zoxide)
    (name "flutter-artifacts-gradle-google-bin")))

(define-public flutter-artifacts-engine-web-google-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-artifacts-engine-web-google-bin.
  (package
    (inherit zoxide)
    (name "flutter-artifacts-engine-web-google-bin")))

(define-public flutter-artifacts-engine-linux-google-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-artifacts-engine-linux-google-bin.
  (package
    (inherit zoxide)
    (name "flutter-artifacts-engine-linux-google-bin")))

(define-public flutter-artifacts-engine-common-google-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-artifacts-engine-common-google-bin.
  (package
    (inherit zoxide)
    (name "flutter-artifacts-engine-common-google-bin")))

(define-public flutter-artifacts-engine-android-google-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-artifacts-engine-android-google-bin.
  (package
    (inherit zoxide)
    (name "flutter-artifacts-engine-android-google-bin")))

(define-public flutter-artifacts-dart-google-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter-artifacts-dart-google-bin.
  (package
    (inherit zoxide)
    (name "flutter-artifacts-dart-google-bin")))

(define-public flutter
  ;; NEEDS_RECIPE_DESIGN queue stub for flutter.
  (package
    (inherit zoxide)
    (name "flutter")))

(define-public outfieldr-git
  ;; NEEDS_RECIPE_DESIGN queue stub for outfieldr-git.
  (package
    (inherit zoxide)
    (name "outfieldr-git")))

(define-public plasma6-applets-panel-spacer-extended
  ;; NEEDS_RECIPE_DESIGN queue stub for plasma6-applets-panel-spacer-extended.
  (package
    (inherit zoxide)
    (name "plasma6-applets-panel-spacer-extended")))

(define-public mcpelauncher-ui
  ;; NEEDS_RECIPE_DESIGN queue stub for mcpelauncher-ui.
  (package
    (inherit zoxide)
    (name "mcpelauncher-ui")))

(define-public abcde-musicbrainz-meta
  ;; NEEDS_RECIPE_DESIGN queue stub for abcde-musicbrainz-meta.
  (package
    (inherit zoxide)
    (name "abcde-musicbrainz-meta")))

(define-public mcpelauncher-linux
  ;; NEEDS_RECIPE_DESIGN queue stub for mcpelauncher-linux.
  (package
    (inherit zoxide)
    (name "mcpelauncher-linux")))

(define-public lib32-mcpelauncher-linux
  ;; NEEDS_RECIPE_DESIGN queue stub for lib32-mcpelauncher-linux.
  (package
    (inherit zoxide)
    (name "lib32-mcpelauncher-linux")))

(define-public grimaur-git
  ;; NEEDS_RECIPE_DESIGN queue stub for grimaur-git.
  (package
    (inherit zoxide)
    (name "grimaur-git")))

(define-public goverlay-git
  ;; NEEDS_RECIPE_DESIGN queue stub for goverlay-git.
  (package
    (inherit zoxide)
    (name "goverlay-git")))

(define-public c-lolcat
  ;; NEEDS_RECIPE_DESIGN queue stub for c-lolcat.
  (package
    (inherit zoxide)
    (name "c-lolcat")))

(define-public lx-music-desktop-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for lx-music-desktop-bin.
  (package
    (inherit zoxide)
    (name "lx-music-desktop-bin")))

(define-public perccli
  ;; NEEDS_RECIPE_DESIGN queue stub for perccli.
  (package
    (inherit zoxide)
    (name "perccli")))

(define-public qqc2-desktop-style-git
  ;; NEEDS_RECIPE_DESIGN queue stub for qqc2-desktop-style-git.
  (package
    (inherit zoxide)
    (name "qqc2-desktop-style-git")))

(define-public celt
  ;; NEEDS_RECIPE_DESIGN queue stub for celt.
  (package
    (inherit zoxide)
    (name "celt")))

(define-public goocanvas2
  ;; NEEDS_RECIPE_DESIGN queue stub for goocanvas2.
  (package
    (inherit zoxide)
    (name "goocanvas2")))

(define-public sabnzbd
  ;; NEEDS_RECIPE_DESIGN queue stub for sabnzbd.
  (package
    (inherit zoxide)
    (name "sabnzbd")))

(define-public fontpreview
  ;; NEEDS_RECIPE_DESIGN queue stub for fontpreview.
  (package
    (inherit zoxide)
    (name "fontpreview")))

(define-public arronax
  ;; NEEDS_RECIPE_DESIGN queue stub for arronax.
  (package
    (inherit zoxide)
    (name "arronax")))

(define-public watt-toolkit-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for watt-toolkit-bin.
  (package
    (inherit zoxide)
    (name "watt-toolkit-bin")))

(define-public goxlr-utility
  ;; NEEDS_RECIPE_DESIGN queue stub for goxlr-utility.
  (package
    (inherit zoxide)
    (name "goxlr-utility")))

(define-public winecx
  ;; NEEDS_RECIPE_DESIGN queue stub for winecx.
  (package
    (inherit zoxide)
    (name "winecx")))

(define-public nvidia-340xx-settings
  ;; NEEDS_RECIPE_DESIGN queue stub for nvidia-340xx-settings.
  (package
    (inherit zoxide)
    (name "nvidia-340xx-settings")))

(define-public libxnvctrl-340xx
  ;; NEEDS_RECIPE_DESIGN queue stub for libxnvctrl-340xx.
  (package
    (inherit zoxide)
    (name "libxnvctrl-340xx")))

(define-public rescrobbled-git
  ;; NEEDS_RECIPE_DESIGN queue stub for rescrobbled-git.
  (package
    (inherit zoxide)
    (name "rescrobbled-git")))

(define-public gnome-shell-extension-pop-shell-git
  ;; NEEDS_RECIPE_DESIGN queue stub for gnome-shell-extension-pop-shell-git.
  (package
    (inherit zoxide)
    (name "gnome-shell-extension-pop-shell-git")))

(define-public gnome-shell-extension-wallpaper-slideshow
  ;; NEEDS_RECIPE_DESIGN queue stub for gnome-shell-extension-wallpaper-slideshow.
  (package
    (inherit zoxide)
    (name "gnome-shell-extension-wallpaper-slideshow")))

(define-public pam_rssh
  ;; NEEDS_RECIPE_DESIGN queue stub for pam_rssh.
  (package
    (inherit zoxide)
    (name "pam_rssh")))

(define-public godot-git
  ;; NEEDS_RECIPE_DESIGN queue stub for godot-git.
  (package
    (inherit zoxide)
    (name "godot-git")))

(define-public linux-router
  ;; NEEDS_RECIPE_DESIGN queue stub for linux-router.
  (package
    (inherit zoxide)
    (name "linux-router")))

(define-public vulkanscenegraph
  ;; NEEDS_RECIPE_DESIGN queue stub for vulkanscenegraph.
  (package
    (inherit zoxide)
    (name "vulkanscenegraph")))

(define-public mathematica
  ;; NEEDS_RECIPE_DESIGN queue stub for mathematica.
  (package
    (inherit zoxide)
    (name "mathematica")))

(define-public ttf-gelasio-variable
  ;; NEEDS_RECIPE_DESIGN queue stub for ttf-gelasio-variable.
  (package
    (inherit zoxide)
    (name "ttf-gelasio-variable")))

(define-public ttf-gelasio
  ;; NEEDS_RECIPE_DESIGN queue stub for ttf-gelasio.
  (package
    (inherit zoxide)
    (name "ttf-gelasio")))

(define-public xlibre-input-wacom
  ;; NEEDS_RECIPE_DESIGN queue stub for xlibre-input-wacom.
  (package
    (inherit zoxide)
    (name "xlibre-input-wacom")))

(define-public xlibre-input-evdev
  ;; NEEDS_RECIPE_DESIGN queue stub for xlibre-input-evdev.
  (package
    (inherit zoxide)
    (name "xlibre-input-evdev")))

(define-public audiveris
  ;; NEEDS_RECIPE_DESIGN queue stub for audiveris.
  (package
    (inherit zoxide)
    (name "audiveris")))

(define-public xivlauncher
  ;; NEEDS_RECIPE_DESIGN queue stub for xivlauncher.
  (package
    (inherit zoxide)
    (name "xivlauncher")))

(define-public roleboi-git
  ;; NEEDS_RECIPE_DESIGN queue stub for roleboi-git.
  (package
    (inherit zoxide)
    (name "roleboi-git")))

(define-public alephone-phoenix
  ;; NEEDS_RECIPE_DESIGN queue stub for alephone-phoenix.
  (package
    (inherit zoxide)
    (name "alephone-phoenix")))

(define-public steam-cloud-file-manager-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for steam-cloud-file-manager-bin.
  (package
    (inherit zoxide)
    (name "steam-cloud-file-manager-bin")))

(define-public indicator-sysmonitor-budgie-git
  ;; NEEDS_RECIPE_DESIGN queue stub for indicator-sysmonitor-budgie-git.
  (package
    (inherit zoxide)
    (name "indicator-sysmonitor-budgie-git")))

(define-public indicator-sysmonitor-appindicator-git
  ;; NEEDS_RECIPE_DESIGN queue stub for indicator-sysmonitor-appindicator-git.
  (package
    (inherit zoxide)
    (name "indicator-sysmonitor-appindicator-git")))

(define-public airrohr-firmware-flasher-git
  ;; NEEDS_RECIPE_DESIGN queue stub for airrohr-firmware-flasher-git.
  (package
    (inherit zoxide)
    (name "airrohr-firmware-flasher-git")))

(define-public funchook
  ;; NEEDS_RECIPE_DESIGN queue stub for funchook.
  (package
    (inherit zoxide)
    (name "funchook")))

(define-public dimensions-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for dimensions-bin.
  (package
    (inherit zoxide)
    (name "dimensions-bin")))

(define-public intel-ipu6-camera-hal-git
  ;; NEEDS_RECIPE_DESIGN queue stub for intel-ipu6-camera-hal-git.
  (package
    (inherit zoxide)
    (name "intel-ipu6-camera-hal-git")))

(define-public icamerasrc-git
  ;; NEEDS_RECIPE_DESIGN queue stub for icamerasrc-git.
  (package
    (inherit zoxide)
    (name "icamerasrc-git")))

(define-public intel-ipu6-dkms-git
  ;; NEEDS_RECIPE_DESIGN queue stub for intel-ipu6-dkms-git.
  (package
    (inherit zoxide)
    (name "intel-ipu6-dkms-git")))

(define-public intel-ipu6-camera-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for intel-ipu6-camera-bin.
  (package
    (inherit zoxide)
    (name "intel-ipu6-camera-bin")))

(define-public js-util-bin
  ;; NEEDS_RECIPE_DESIGN queue stub for js-util-bin.
  (package
    (inherit zoxide)
    (name "js-util-bin")))

(define-public intel-vision-drivers-dkms-git
  ;; NEEDS_RECIPE_DESIGN queue stub for intel-vision-drivers-dkms-git.
  (package
    (inherit zoxide)
    (name "intel-vision-drivers-dkms-git")))

(define-public fastero
  ;; NEEDS_RECIPE_DESIGN queue stub for fastero.
  (package
    (inherit zoxide)
    (name "fastero")))

;;; Queue entries 5545/5546/5554/5561/5575/5578/5582/5586/5592/5632.

(define-public moderncsv-bin
  (package
    (name "moderncsv-bin")
    (version "2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.moderncsv.com/release/ModernCSV-Linux-v"
             version ".tar.gz"))
       (sha256
        (base32 "06wv7130m2zjnwpc8sic2j92sw57wxvnbsrrid2nsrrddahj4wq1"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     `(("tar" ,tar)
       ("gzip" ,gzip)
       ("license-file"
        ,(origin
           (method url-fetch)
           (uri "https://aur.archlinux.org/cgit/aur.git/plain/ModernCSV-LICENSE.md?h=moderncsv-bin")
           (sha256
            (base32 "1qc7mkm61f5lgq0g6bwipsws2b2gypwvlaq81lif518pmvavnsq1"))))))
    (arguments
     (list
      #:modules '((guix build utils)
                  (ice-9 ftw)
                  (srfi srfi-1))
      #:builder
      #~(begin
          (use-modules (guix build utils)
                       (ice-9 ftw)
                       (srfi srfi-1))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (license-file (assoc-ref %build-inputs "license-file"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (apps (string-append out "/share/applications"))
                 (icons (string-append out "/share/icons/hicolor"))
                 (doc (string-append out "/share/doc/moderncsv-bin"))
                 (license-dir (string-append out "/share/licenses/moderncsv-bin"))
                 (opt (string-append out "/opt/moderncsv"))
                 (bin (string-append out "/bin")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (let* ((entries (scandir "." (lambda (n) (not (member n '("." ".."))))))
                   (dir (find (lambda (n)
                                (and (file-is-directory? n)
                                     (string-prefix? "moderncsv" n)))
                              entries)))
              (unless dir
                (error "could not locate extracted moderncsv directory"))
              (mkdir-p opt)
              (copy-recursively dir opt)
              (mkdir-p bin)
              (symlink (string-append opt "/moderncsv")
                       (string-append bin "/moderncsv"))
              (mkdir-p apps)
              (copy-file (string-append opt "/moderncsv.desktop")
                         (string-append apps "/moderncsv.desktop"))
              (substitute* (string-append apps "/moderncsv.desktop")
                (("Exec=.*") "Exec=moderncsv"))
              (when (file-exists? (string-append opt "/icons/hicolor"))
                (mkdir-p icons)
                (copy-recursively (string-append opt "/icons/hicolor") icons))
              (when (file-exists? (string-append opt "/README.md"))
                (mkdir-p doc)
                (copy-file (string-append opt "/README.md")
                           (string-append doc "/README.md")))
              (mkdir-p license-dir)
              (copy-file license-file (string-append license-dir "/LICENSE.md"))
              #t)))))
    (home-page "https://www.moderncsv.com/")
    (synopsis "Intuitive CSV file editor")
    (description
     "Modern CSV is an editor and viewer for CSV and other delimited text files.
This package repackages the upstream prebuilt Linux binary release.")
    (license (license:non-copyleft "https://www.moderncsv.com/"
                                  "Upstream proprietary license"))))

(define-public ionosctl-bin
  (package
    (name "ionosctl-bin")
    (version "6.9.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ionos-cloud/ionosctl/releases/download/v"
             version "/ionosctl-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "050jinhb5fmbgswwqkhjq1abg2nzh5xrw1yfbwvlyvsiql3d1lk6"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
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
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (bin (string-append out "/bin"))
                 (doc (string-append out "/share/doc/ionosctl"))
                 (license-dir (string-append out "/share/licenses/ionosctl-bin")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (mkdir-p bin)
            (install-file "ionosctl" bin)
            (chmod (string-append bin "/ionosctl") #o755)
            (mkdir-p doc)
            (when (file-exists? "docs")
              (copy-recursively "docs" (string-append doc "/docs")))
            (for-each
             (lambda (name)
               (when (file-exists? name)
                 (copy-file name (string-append doc "/" name))))
             '("README.md" "CHANGELOG.md" "summary.md"))
            (when (file-exists? "LICENSE")
              (mkdir-p license-dir)
              (copy-file "LICENSE" (string-append license-dir "/LICENSE")))
            #t))))
    (home-page "https://github.com/ionos-cloud/ionosctl")
    (synopsis "IONOS Cloud command-line client")
    (description
     "ionosctl is the command-line client for IONOS Cloud APIs.  This package
installs the upstream prebuilt x86_64 Linux release.")
    (license license:asl2.0)))

(define-public fhc-bin
  (package
    (name "fhc-bin")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Edu4rdSHL/fhc/releases/download/"
             version "/fhc-linux-x64.zip"))
       (sha256
        (base32 "1nk6hk62rv7q37wdfhr8p802hgf7ac8c9m830qigzdji99h1l30q"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     `(("unzip" ,unzip)
       ("readme"
        ,(origin
           (method url-fetch)
           (uri (string-append
                 "https://raw.githubusercontent.com/Edu4rdSHL/fhc/"
                 version "/README.md"))
           (sha256
            (base32 "03s194adk4lwzp62fdn2pdsjsfs19na9qxfc9fblh0gr4mqwkpzy"))))
       ("manpage"
        ,(origin
           (method url-fetch)
           (uri (string-append
                 "https://raw.githubusercontent.com/Edu4rdSHL/fhc/"
                 version "/fhc.1"))
           (sha256
            (base32 "103fmldxc8b9zc39vgrqa7mnx4j7b15fqwf04aimfds7lyn8kdfr"))))))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (readme (assoc-ref %build-inputs "readme"))
                 (manpage (assoc-ref %build-inputs "manpage"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (bin (string-append out "/bin"))
                 (doc (string-append out "/share/doc/fhc-bin"))
                 (man1 (string-append out "/share/man/man1")))
            (invoke unzip "-q" src)
            (mkdir-p bin)
            (install-file "fhc-linux" bin)
            (rename-file (string-append bin "/fhc-linux")
                         (string-append bin "/fhc"))
            (chmod (string-append bin "/fhc") #o755)
            (mkdir-p doc)
            (copy-file readme (string-append doc "/README.md"))
            (mkdir-p man1)
            (copy-file manpage (string-append man1 "/fhc.1"))
            #t))))
    (home-page "https://github.com/Edu4rdSHL/fhc")
    (synopsis "Fast HTTP checker")
    (description
     "FHC is a fast command-line HTTP checker.  This package installs the
upstream prebuilt Linux x86_64 binary and accompanying documentation.")
    (license license:gpl3+)))

(define-public mill-global
  (package
    (name "mill-global")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://repo1.maven.org/maven2/com/lihaoyi/mill-dist/"
             version "/mill-dist-" version "-mill.sh"))
       (sha256
        (base32 "17gb75hgll8dr7lvypwkb6kh00qd8if9daghxq8a7g0yw6flrz7j"))))
    (build-system trivial-build-system)
    (native-inputs
     `(("completion"
        ,(origin
           (method url-fetch)
           (uri "https://raw.githubusercontent.com/lefou/mill-bash-completion/dfd5ac9b8b0d08b0a22596e88f0f4b1d15abcfd4/mill.complete.sh")
           (sha256
            (base32 "1q0l29gml1xgc38mqkqb71qg9jw1vh55ihxvih8cih0waay3yadz"))))))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (script (assoc-ref %build-inputs "source"))
                 (completion (assoc-ref %build-inputs "completion"))
                 (bin (string-append out "/bin"))
                 (completions (string-append out "/share/bash-completion/completions")))
            (mkdir-p bin)
            (copy-file script (string-append bin "/mill"))
            (chmod (string-append bin "/mill") #o755)
            (mkdir-p completions)
            (copy-file completion (string-append completions "/mill"))
            (substitute* (string-append completions "/mill")
              (("_split_longopt") "_comp__split_longopt"))
            #t))))
    (home-page "https://github.com/com-lihaoyi/mill")
    (synopsis "Mill build tool global launcher")
    (description
     "Mill is a Scala and Java build tool.  This package installs the upstream
launcher script for global use and bash completion definitions.")
    (license license:expat)))

(define-public qo-bin
  (package
    (name "qo-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/kiki-ki/go-qo/releases/download/v"
             version "/qo_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "09f8cnv95lxvv2x657vli56yhk775b4fxyzgh547wvk5qsdz14hj"))))
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
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (bin (string-append out "/bin"))
                 (doc (string-append out "/share/doc/qo-bin"))
                 (license-dir (string-append out "/share/licenses/qo-bin")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (mkdir-p bin)
            (install-file "qo" bin)
            (chmod (string-append bin "/qo") #o755)
            (mkdir-p doc)
            (when (file-exists? "README.md")
              (copy-file "README.md" (string-append doc "/README.md")))
            (when (file-exists? "LICENSE")
              (mkdir-p license-dir)
              (copy-file "LICENSE" (string-append license-dir "/LICENSE")))
            #t))))
    (home-page "https://github.com/kiki-ki/go-qo")
    (synopsis "Minimal SQL-like TUI for tabular data")
    (description
     "qo is an interactive terminal user interface for querying JSON, CSV, and
TSV files using SQL-like statements.  This package installs the upstream
prebuilt Linux x86_64 binary release.")
    (license license:expat)))

(define-public python-pandas-docs
  (package
    (name "python-pandas-docs")
    (version "2.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://pandas.pydata.org/pandas-docs/version/"
             version "/pandas.zip"))
       (sha256
        (base32 "07lxzypfcksi4rql0sq6jsnd7lxv743k6pq1qbdkv017rxqz7dq2"))))
    (build-system trivial-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:modules '((guix build utils)
                  (ice-9 ftw)
                  (srfi srfi-1))
      #:builder
      #~(begin
          (use-modules (guix build utils)
                       (ice-9 ftw)
                       (srfi srfi-1))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (target (string-append out "/share/doc/python-pandas/html")))
            (invoke unzip "-q" src)
            (mkdir-p target)
            (for-each
             (lambda (entry)
               (if (file-is-directory? entry)
                   (copy-recursively entry (string-append target "/" entry))
                   (copy-file entry (string-append target "/" entry))))
             (scandir "." (lambda (name) (not (member name '("." ".."))))))
            #t))))
    (home-page "https://pandas.pydata.org")
    (synopsis "Offline HTML documentation for python-pandas")
    (description
     "This package installs the upstream generated HTML documentation for the
Python pandas library.")
    (license license:bsd-3)))

(define-public vex-tui-bin
  (package
    (name "vex-tui-bin")
    (version "2.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/CodeOne45/vex-tui/releases/download/v"
             version "/vex-tui_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "06gqzi38k7bjnjfdliba6r84rrwd7yrfrmbbyhp3f9l4s7sv56y7"))))
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
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (bin (string-append out "/bin"))
                 (license-dir (string-append out "/share/licenses/vex-tui-bin")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (mkdir-p bin)
            (install-file "vex" bin)
            (chmod (string-append bin "/vex") #o755)
            (when (file-exists? "LICENSE")
              (mkdir-p license-dir)
              (copy-file "LICENSE" (string-append license-dir "/LICENSE")))
            #t))))
    (home-page "https://github.com/CodeOne45/vex-tui")
    (synopsis "Terminal spreadsheet and CSV viewer")
    (description
     "Vex is a terminal-based viewer for CSV and spreadsheet files.  This
package installs the upstream prebuilt Linux x86_64 binary.")
    (license license:expat)))

(define-public greenlight-bin
  (package
    (name "greenlight-bin")
    (version "2.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/unknownskl/greenlight/releases/download/v"
             version "/greenlight-desktop_" version "_amd64.deb"))
       (sha256
        (base32 "0qx71hgc1jd957b8c4lrgphrzynig5ba01swkldw24cm881rqsry"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     `(("binutils" ,binutils)
       ("tar" ,tar)
       ("xz" ,xz)
       ("upstream-license"
        ,(origin
           (method url-fetch)
           (uri "https://raw.githubusercontent.com/unknownskl/greenlight/main-v2/LICENSE")
           (sha256
            (base32 "1r3f47wm5c6mfhxi4lwgciswhj7bidc51jj3hbdb2dk33acgm42c"))))))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (license-file (assoc-ref %build-inputs "upstream-license"))
                 (ar (search-input-file %build-inputs "/bin/ar"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz (search-input-file %build-inputs "/bin/xz"))
                 (apps (string-append out "/share/applications"))
                 (bin (string-append out "/bin"))
                 (opt (string-append out "/opt/Greenlight"))
                 (icons (string-append out "/share/icons"))
                 (license-dir (string-append out "/share/licenses/greenlight-bin")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz) "-xf" "data.tar.xz")
            (mkdir-p opt)
            (copy-recursively "./opt/Greenlight" opt)
            (mkdir-p icons)
            (copy-recursively "./usr/share/icons" icons)
            (mkdir-p apps)
            (copy-file "./usr/share/applications/greenlight-desktop.desktop"
                       (string-append apps "/greenlight.desktop"))
            (substitute* (string-append apps "/greenlight.desktop")
              (("Exec=.*") "Exec=greenlight %U"))
            (mkdir-p bin)
            (symlink (string-append out "/opt/Greenlight/greenlight-desktop")
                     (string-append bin "/greenlight"))
            (mkdir-p license-dir)
            (copy-file license-file (string-append license-dir "/LICENSE"))
            #t))))
    (home-page "https://github.com/unknownskl/greenlight")
    (synopsis "Open source xCloud and Xbox game streaming client")
    (description
     "Greenlight is a desktop client for xCloud and Xbox home streaming.  This
package repackages the upstream prebuilt Debian package for x86_64 Linux.")
    (license license:expat)))

(define-public kftui-bin
  (package
    (name "kftui-bin")
    (version "0.27.28")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hcavarsan/kftray/releases/download/v"
             version "/kftui_linux_amd64"))
       (sha256
        (base32 "1j6x9764dk8xqajks8k29a76z9ybdlajyxfi4hd056mf479pw3qd"))))
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
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/kftui"))
            (chmod (string-append bin "/kftui") #o755)
            #t))))
    (home-page "https://github.com/hcavarsan/kftray")
    (synopsis "Kubectl port-forward manager TUI")
    (description
     "kftui is a terminal interface for managing kubectl port-forward sessions,
including UDP and proxy workflows.  This package installs the upstream
prebuilt Linux x86_64 binary.")
    (license license:gpl3)))

(define-public waydroid-image-gapps
  (package
    (name "waydroid-image-gapps")
    (version "20.0_20260403")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86_64/lineage-20.0-20260403-GAPPS-waydroid_x86_64-system.zip")
       (sha256
        (base32 "18q836nd1knfsl8arc6my8dflx828px21w6x9fbb9c6igbfv46l1"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     `(("unzip" ,unzip)
       ("vendor-image"
        ,(origin
           (method url-fetch)
           (uri
            "https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86_64/lineage-20.0-20260403-MAINLINE-waydroid_x86_64-vendor.zip")
           (sha256
            (base32 "0ss2ip3rmlr8zcm45ckh42n54ibah7yg55zhnhrgzd18kq6pxk14"))))))
    (arguments
     (list
      #:modules '((guix build utils)
                  (ice-9 ftw)
                  (srfi srfi-1))
      #:builder
      #~(begin
          (use-modules (guix build utils)
                       (ice-9 ftw)
                       (srfi srfi-1))
          (let* ((out (assoc-ref %outputs "out"))
                 (system-zip (assoc-ref %build-inputs "source"))
                 (vendor-zip (assoc-ref %build-inputs "vendor-image"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (target (string-append out "/share/waydroid-extra/images")))
            (invoke unzip "-q" system-zip)
            (invoke unzip "-q" vendor-zip)
            (mkdir-p target)
            (for-each
             (lambda (img)
               (install-file img target))
             (find-files "." "\\.img$"))
            #t))))
    (home-page "https://github.com/waydroid")
    (synopsis "Waydroid Android image bundle with Google Apps")
    (description
     "This package provides x86_64 Waydroid system and vendor images built with
Google Apps.  It installs upstream image artifacts under
@file{/share/waydroid-extra/images}.")
    (license license:asl2.0)))
