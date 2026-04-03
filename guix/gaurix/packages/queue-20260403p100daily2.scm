;;; Queue drain 2026-04-03 daily run batch 2.
;;; Selected 100 TODO-status entries from todo_general_packages.org.
;;; Status: upstream Guix/Gaurix alias resolution batch with validated target resolution.
(define-module (gaurix packages queue-20260403p100daily2)
  #:use-module (guix packages)
  #:autoload (gnu packages) (specification->package)
  #:export (
            adobe-base-14-fonts
            ttf-meslo
            python-httpx-sse
            sov
            fvwm3-git
            python-stanza
            parallel-hashmap
            soapysdrplay3-git
            arx-libertatis-git
            file-roller-git
            mpv-uosc-git
            python-yapsy-git
            grayjay-git
            i3lock-fancy-git
            emacs-git
            libadwaita-git
            catppuccin-whiskers-bin
            zathura-pdf-mupdf-git
            whois-git
            scanbd-git
            nwipe-git
            telegram-desktop-git
            adwaita-icon-theme-git
            mousepad-git
            electrum-git
            deskflow-git
            mupdf-git
            gparted-git
            hashlink-git
            conky-git
            jujutsu-git
            thunar-git
            openfortivpn-git
            ddcui-git
            crow-translate-git
            thunar-volman-git
            deja-dup-git
            libavif-git
            mmc-utils-git
            wine-git
            awesome-git
            syncplay-git
            xdg-desktop-portal-wlr-git
            retroarch-joypad-autoconfig-git
            nushell-git
            speed-dreams-git
            xbyak
            clifm-bin
            hydroxide-git
            typstyle-git
            fnlfmt-git
            fennel-ls-git
            mda-lv2-git
            geos-git
            dool-git
            ericw-tools-git
            cpdf-bin
            xremap-kde-bin
            nextpnr-git
            ttf-iosevka-term
            ))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))
(define-public adobe-base-14-fonts
  (gaurix-alias-package "adobe-base-14-fonts" "font-adobe100dpi"))
(define-public ttf-meslo
  (gaurix-alias-package "ttf-meslo" "font-meslo-lg"))
(define-public python-httpx-sse
  (gaurix-alias-package "python-httpx-sse" "python-httpx-sse"))
(define-public sov
  (gaurix-alias-package "sov" "sov"))
(define-public fvwm3-git
  (gaurix-alias-package "fvwm3-git" "fvwm3"))
(define-public python-stanza
  (gaurix-alias-package "python-stanza" "python-stanza"))
(define-public parallel-hashmap
  (gaurix-alias-package "parallel-hashmap" "parallel-hashmap"))
(define-public soapysdrplay3-git
  (gaurix-alias-package "soapysdrplay3-git" "soapysdrplay3"))
(define-public arx-libertatis-git
  (gaurix-alias-package "arx-libertatis-git" "arx-libertatis"))
(define-public file-roller-git
  (gaurix-alias-package "file-roller-git" "file-roller"))
(define-public mpv-uosc-git
  (gaurix-alias-package "mpv-uosc-git" "mpv-uosc"))
(define-public python-yapsy-git
  (gaurix-alias-package "python-yapsy-git" "python-yapsy"))
(define-public grayjay-git
  (gaurix-alias-package "grayjay-git" "grayjay"))
(define-public i3lock-fancy-git
  (gaurix-alias-package "i3lock-fancy-git" "i3lock-fancy"))
(define-public emacs-git
  (gaurix-alias-package "emacs-git" "emacs"))
(define-public libadwaita-git
  (gaurix-alias-package "libadwaita-git" "libadwaita"))
(define-public catppuccin-whiskers-bin
  (gaurix-alias-package "catppuccin-whiskers-bin" "catppuccin-whiskers"))
(define-public zathura-pdf-mupdf-git
  (gaurix-alias-package "zathura-pdf-mupdf-git" "zathura-pdf-mupdf"))
(define-public whois-git
  (gaurix-alias-package "whois-git" "whois"))
(define-public scanbd-git
  (gaurix-alias-package "scanbd-git" "scanbd"))
(define-public nwipe-git
  (gaurix-alias-package "nwipe-git" "nwipe"))
(define-public telegram-desktop-git
  (gaurix-alias-package "telegram-desktop-git" "telegram-desktop"))
(define-public adwaita-icon-theme-git
  (gaurix-alias-package "adwaita-icon-theme-git" "adwaita-icon-theme"))
(define-public mousepad-git
  (gaurix-alias-package "mousepad-git" "mousepad"))
(define-public electrum-git
  (gaurix-alias-package "electrum-git" "electrum"))
(define-public deskflow-git
  (gaurix-alias-package "deskflow-git" "deskflow"))
(define-public mupdf-git
  (gaurix-alias-package "mupdf-git" "mupdf"))
(define-public gparted-git
  (gaurix-alias-package "gparted-git" "gparted"))
(define-public hashlink-git
  (gaurix-alias-package "hashlink-git" "hashlink"))
(define-public conky-git
  (gaurix-alias-package "conky-git" "conky"))
(define-public jujutsu-git
  (gaurix-alias-package "jujutsu-git" "jujutsu"))
(define-public thunar-git
  (gaurix-alias-package "thunar-git" "thunar"))
(define-public openfortivpn-git
  (gaurix-alias-package "openfortivpn-git" "openfortivpn"))
(define-public ddcui-git
  (gaurix-alias-package "ddcui-git" "ddcui"))
(define-public crow-translate-git
  (gaurix-alias-package "crow-translate-git" "crow-translate"))
(define-public thunar-volman-git
  (gaurix-alias-package "thunar-volman-git" "thunar-volman"))
(define-public deja-dup-git
  (gaurix-alias-package "deja-dup-git" "deja-dup"))
(define-public libavif-git
  (gaurix-alias-package "libavif-git" "libavif"))
(define-public mmc-utils-git
  (gaurix-alias-package "mmc-utils-git" "mmc-utils"))
(define-public wine-git
  (gaurix-alias-package "wine-git" "wine"))
(define-public awesome-git
  (gaurix-alias-package "awesome-git" "awesome"))
(define-public syncplay-git
  (gaurix-alias-package "syncplay-git" "syncplay"))
(define-public xdg-desktop-portal-wlr-git
  (gaurix-alias-package "xdg-desktop-portal-wlr-git" "xdg-desktop-portal-wlr"))
(define-public retroarch-joypad-autoconfig-git
  (gaurix-alias-package "retroarch-joypad-autoconfig-git" "retroarch-joypad-autoconfig"))
(define-public nushell-git
  (gaurix-alias-package "nushell-git" "nushell"))
(define-public speed-dreams-git
  (gaurix-alias-package "speed-dreams-git" "speed-dreams"))
(define-public xbyak
  (gaurix-alias-package "xbyak" "xbyak"))
(define-public clifm-bin
  (gaurix-alias-package "clifm-bin" "clifm"))
(define-public hydroxide-git
  (gaurix-alias-package "hydroxide-git" "hydroxide"))
(define-public typstyle-git
  (gaurix-alias-package "typstyle-git" "typstyle"))
(define-public fnlfmt-git
  (gaurix-alias-package "fnlfmt-git" "fnlfmt"))
(define-public fennel-ls-git
  (gaurix-alias-package "fennel-ls-git" "fennel-ls"))
(define-public mda-lv2-git
  (gaurix-alias-package "mda-lv2-git" "mda-lv2"))
(define-public geos-git
  (gaurix-alias-package "geos-git" "geos"))
(define-public dool-git
  (gaurix-alias-package "dool-git" "dool"))
(define-public ericw-tools-git
  (gaurix-alias-package "ericw-tools-git" "ericw-tools"))
(define-public cpdf-bin
  (gaurix-alias-package "cpdf-bin" "cpdf"))
(define-public xremap-kde-bin
  (gaurix-alias-package "xremap-kde-bin" "xremap-kde"))
(define-public nextpnr-git
  (gaurix-alias-package "nextpnr-git" "nextpnr"))
(define-public ttf-iosevka-term
  (gaurix-alias-package "ttf-iosevka-term" "font-iosevka-term"))
