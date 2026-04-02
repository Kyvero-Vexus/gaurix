;;; Queue drain 2026-04-02 daily run (batch 2).
;;; Selected 100 TODO entries from todo_general_packages.org.
;;; Status: upstream Guix package re-export batch with lint + dry-run build validation.
(define-module (gaurix packages queue-20260402p100daily2)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:export (
            hyprwire-git
            obs-branch-output
            scryer-prolog
            firefox-esr
            zulip-desktop-bin
            projectm-git
            hcxtools-git
            firefox-bin
            exercism-bin
            v4l-utils-git
            icewm-git
            qimgv-git
            dia-git
            yamagi-quake2-git
            mu-git
            zathura-git
            python-customtkinter
            espanso-x11-bin
            tuxpaint-git
            otf-fira-go
            ttf-victor-mono
            lib2geom-git
            otf-ibm-plex
            google-chrome-beta
            hyprland-qt-support-git
            apertium
            libquicktime
            python-telethon
            python-progress
            gnome-mime-data
            gamin
            libcroco
            libunique
            extremetuxracer
            esmtp
            transcode
            giblib
            pipemixer
            sipcalc
            xnec2c-git
            meshlab
            openjpeg
            cmst
            libfastjson
            liblogging
            libestr
            python-yattag
            obs-multi-rtmp
            libeb
            bcc-git
            sfizz-git
            clementine-git
            libyang
            python-blake3
            himitsu
            dexed-git
            mpv-git
            kanata-git
            sioyek-git
            compiledb
            python-selenium
            wlroots-git
            python-clickgen
            grayjay
            foot-git
            gallery-dl-bin
            python-einops
            otf-openmoji
            yambar-wayland
            mksh
            avldrums-lv2-git
            leela-zero
            ttf-lxgw-wenkai
            qdl
            xcb-proto-git
            apfs-fuse-git
            pngcheck
            openmw-git
            hypridle-git
            obs-vkcapture
            desmume-git
            f3d-bin
            lisgd
            plib
            pipe-viewer-git
            ansilove
            python-ezdxf
            fuzzylite
            emacs-lucid
            qbe-git
            lziprecover
            bitlbee
            abook
            labwc-git
            gophernicus-git
            vlang
            ttf-oswald
            git-extras
            zotero
            eden-git
            ))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

(define-public hyprwire-git
  (gaurix-alias-package "hyprwire-git" "hyprwire"))
(define-public obs-branch-output
  (gaurix-alias-package "obs-branch-output" "obs-branch-output"))
(define-public scryer-prolog
  (gaurix-alias-package "scryer-prolog" "scryer-prolog"))
(define-public firefox-esr
  (gaurix-alias-package "firefox-esr" "firefox-esr"))
(define-public zulip-desktop-bin
  (gaurix-alias-package "zulip-desktop-bin" "zulip-desktop"))
(define-public projectm-git
  (gaurix-alias-package "projectm-git" "projectm"))
(define-public hcxtools-git
  (gaurix-alias-package "hcxtools-git" "hcxtools"))
(define-public firefox-bin
  (gaurix-alias-package "firefox-bin" "firefox"))
(define-public exercism-bin
  (gaurix-alias-package "exercism-bin" "exercism"))
(define-public v4l-utils-git
  (gaurix-alias-package "v4l-utils-git" "v4l-utils"))
(define-public icewm-git
  (gaurix-alias-package "icewm-git" "icewm"))
(define-public qimgv-git
  (gaurix-alias-package "qimgv-git" "qimgv"))
(define-public dia-git
  (gaurix-alias-package "dia-git" "dia"))
(define-public yamagi-quake2-git
  (gaurix-alias-package "yamagi-quake2-git" "yamagi-quake2"))
(define-public mu-git
  (gaurix-alias-package "mu-git" "mu"))
(define-public zathura-git
  (gaurix-alias-package "zathura-git" "zathura"))
(define-public python-customtkinter
  (gaurix-alias-package "python-customtkinter" "python-customtkinter"))
(define-public espanso-x11-bin
  (gaurix-alias-package "espanso-x11-bin" "espanso-x11"))
(define-public tuxpaint-git
  (gaurix-alias-package "tuxpaint-git" "tuxpaint"))
(define-public otf-fira-go
  (gaurix-alias-package "otf-fira-go" "font-fira-go"))
(define-public ttf-victor-mono
  (gaurix-alias-package "ttf-victor-mono" "font-victor-mono"))
(define-public lib2geom-git
  (gaurix-alias-package "lib2geom-git" "lib2geom"))
(define-public otf-ibm-plex
  (gaurix-alias-package "otf-ibm-plex" "font-ibm-plex"))
(define-public google-chrome-beta
  (gaurix-alias-package "google-chrome-beta" "google-chrome-beta"))
(define-public hyprland-qt-support-git
  (gaurix-alias-package "hyprland-qt-support-git" "hyprland-qt-support"))
(define-public apertium
  (gaurix-alias-package "apertium" "apertium"))
(define-public libquicktime
  (gaurix-alias-package "libquicktime" "libquicktime"))
(define-public python-telethon
  (gaurix-alias-package "python-telethon" "python-telethon"))
(define-public python-progress
  (gaurix-alias-package "python-progress" "python-progress"))
(define-public gnome-mime-data
  (gaurix-alias-package "gnome-mime-data" "gnome-mime-data"))
(define-public gamin
  (gaurix-alias-package "gamin" "gamin"))
(define-public libcroco
  (gaurix-alias-package "libcroco" "libcroco"))
(define-public libunique
  (gaurix-alias-package "libunique" "libunique"))
(define-public extremetuxracer
  (gaurix-alias-package "extremetuxracer" "extremetuxracer"))
(define-public esmtp
  (gaurix-alias-package "esmtp" "esmtp"))
(define-public transcode
  (gaurix-alias-package "transcode" "transcode"))
(define-public giblib
  (gaurix-alias-package "giblib" "giblib"))
(define-public pipemixer
  (gaurix-alias-package "pipemixer" "pipemixer"))
(define-public sipcalc
  (gaurix-alias-package "sipcalc" "sipcalc"))
(define-public xnec2c-git
  (gaurix-alias-package "xnec2c-git" "xnec2c"))
(define-public meshlab
  (gaurix-alias-package "meshlab" "meshlab"))
(define-public openjpeg
  (gaurix-alias-package "openjpeg" "openjpeg"))
(define-public cmst
  (gaurix-alias-package "cmst" "cmst"))
(define-public libfastjson
  (gaurix-alias-package "libfastjson" "libfastjson"))
(define-public liblogging
  (gaurix-alias-package "liblogging" "liblogging"))
(define-public libestr
  (gaurix-alias-package "libestr" "libestr"))
(define-public python-yattag
  (gaurix-alias-package "python-yattag" "python-yattag"))
(define-public obs-multi-rtmp
  (gaurix-alias-package "obs-multi-rtmp" "obs-multi-rtmp"))
(define-public libeb
  (gaurix-alias-package "libeb" "libeb"))
(define-public bcc-git
  (gaurix-alias-package "bcc-git" "bcc"))
(define-public sfizz-git
  (gaurix-alias-package "sfizz-git" "sfizz"))
(define-public clementine-git
  (gaurix-alias-package "clementine-git" "clementine"))
(define-public libyang
  (gaurix-alias-package "libyang" "libyang"))
(define-public python-blake3
  (gaurix-alias-package "python-blake3" "python-blake3"))
(define-public himitsu
  (gaurix-alias-package "himitsu" "himitsu"))
(define-public dexed-git
  (gaurix-alias-package "dexed-git" "dexed"))
(define-public mpv-git
  (gaurix-alias-package "mpv-git" "mpv"))
(define-public kanata-git
  (gaurix-alias-package "kanata-git" "kanata"))
(define-public sioyek-git
  (gaurix-alias-package "sioyek-git" "sioyek"))
(define-public compiledb
  (gaurix-alias-package "compiledb" "compiledb"))
(define-public python-selenium
  (gaurix-alias-package "python-selenium" "python-selenium"))
(define-public wlroots-git
  (gaurix-alias-package "wlroots-git" "wlroots"))
(define-public python-clickgen
  (gaurix-alias-package "python-clickgen" "python-clickgen"))
(define-public grayjay
  (gaurix-alias-package "grayjay" "grayjay"))
(define-public foot-git
  (gaurix-alias-package "foot-git" "foot"))
(define-public gallery-dl-bin
  (gaurix-alias-package "gallery-dl-bin" "gallery-dl"))
(define-public python-einops
  (gaurix-alias-package "python-einops" "python-einops"))
(define-public otf-openmoji
  (gaurix-alias-package "otf-openmoji" "font-openmoji"))
(define-public yambar-wayland
  (gaurix-alias-package "yambar-wayland" "yambar-wayland"))
(define-public mksh
  (gaurix-alias-package "mksh" "mksh"))
(define-public avldrums-lv2-git
  (gaurix-alias-package "avldrums-lv2-git" "avldrums-lv2"))
(define-public leela-zero
  (gaurix-alias-package "leela-zero" "leela-zero"))
(define-public ttf-lxgw-wenkai
  (gaurix-alias-package "ttf-lxgw-wenkai" "font-lxgw-wenkai"))
(define-public qdl
  (gaurix-alias-package "qdl" "qdl"))
(define-public xcb-proto-git
  (gaurix-alias-package "xcb-proto-git" "xcb-proto"))
(define-public apfs-fuse-git
  (gaurix-alias-package "apfs-fuse-git" "apfs-fuse"))
(define-public pngcheck
  (gaurix-alias-package "pngcheck" "pngcheck"))
(define-public openmw-git
  (gaurix-alias-package "openmw-git" "openmw"))
(define-public hypridle-git
  (gaurix-alias-package "hypridle-git" "hypridle"))
(define-public obs-vkcapture
  (gaurix-alias-package "obs-vkcapture" "obs-vkcapture"))
(define-public desmume-git
  (gaurix-alias-package "desmume-git" "desmume"))
(define-public f3d-bin
  (gaurix-alias-package "f3d-bin" "f3d"))
(define-public lisgd
  (gaurix-alias-package "lisgd" "lisgd"))
(define-public plib
  (gaurix-alias-package "plib" "plib"))
(define-public pipe-viewer-git
  (gaurix-alias-package "pipe-viewer-git" "pipe-viewer"))
(define-public ansilove
  (gaurix-alias-package "ansilove" "ansilove"))
(define-public python-ezdxf
  (gaurix-alias-package "python-ezdxf" "python-ezdxf"))
(define-public fuzzylite
  (gaurix-alias-package "fuzzylite" "fuzzylite"))
(define-public emacs-lucid
  (gaurix-alias-package "emacs-lucid" "emacs-lucid"))
(define-public qbe-git
  (gaurix-alias-package "qbe-git" "qbe"))
(define-public lziprecover
  (gaurix-alias-package "lziprecover" "lziprecover"))
(define-public bitlbee
  (gaurix-alias-package "bitlbee" "bitlbee"))
(define-public abook
  (gaurix-alias-package "abook" "abook"))
(define-public labwc-git
  (gaurix-alias-package "labwc-git" "labwc"))
(define-public gophernicus-git
  (gaurix-alias-package "gophernicus-git" "gophernicus"))
(define-public vlang
  (gaurix-alias-package "vlang" "vlang"))
(define-public ttf-oswald
  (gaurix-alias-package "ttf-oswald" "font-oswald"))
(define-public git-extras
  (gaurix-alias-package "git-extras" "git-extras"))
(define-public zotero
  (gaurix-alias-package "zotero" "zotero"))
(define-public eden-git
  (gaurix-alias-package "eden-git" "eden"))
