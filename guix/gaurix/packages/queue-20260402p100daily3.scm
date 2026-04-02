;;; Queue drain module for queue-20260402p100daily3 (2026-04-02, 100 TODO entries).
;;; All aliases map TODO queue names to buildable upstream Guix package specs.
(define-module (gaurix packages queue-20260402p100daily3)
  #:use-module (guix packages)
  #:autoload   (gnu packages) (specification->package)
  #:export (
            cmake3-bin
            dsd-git
            hcxdumptool-git
            simdutf-git
            openrct2-git
            tenacity-git
            midori-bin
            signal-desktop-beta
            celestia-bin
            dstask-bin
            fceux-git
            corosync-git
            radicle-bin
            syncthing-bin
            numix-gtk-theme-git
            vscodium
            docker-desktop
            anydesk-bin
            witr-bin
            hyprland-git
            rsgain
            phonon-qt5
            rpcs3-bin
            eden-beta
            wezterm-git
            witr
            eden
            linphone-desktop-appimage
            telegram-desktop-bin
            rpcs3-git
            nvidia-settings-beta
            python-mcp
            chezmoi-git
            ttf-mononoki
            ttf-recursive
            tmsu-git
            clac
            grantlee
            tmsu-bin
            tree-sitter-css-git
            tree-sitter-elixir-git
            tree-sitter-html-git
            tree-sitter-jsdoc-git
            tree-sitter-php-git
            vhdl-ls
            codex-acp
            copyq-git
            fzf-tab
            scilab-bin
            mlmmj
            no-more-secrets-git
            autofs-git
            espanso-x11-git
            espanso-wayland-git
            element-desktop-git
            helix-git
            inkscape-bin
            pcb
            grayjay-bin
            beads-git
            eduke32
            google-chrome-canary
            ttf-iosevka
            linux-git
            ttf-miracode
            python-pynput
            normalize
            qbittorrent-enhanced-git
            qdirstat-bin
            megacmd-bin
            passage-git
            libsixel-git
            passff-host-git
            govulncheck-git
            seek-bin
            guix-git
            hotspot-appimage
            ck-bin
            qelectrotech-git
            cutter-bin
            dgop-git
            cqfd-bin
            plover-appimage
            eduke32-bin
            python-sentencepiece-bin
            sentencepiece-bin
            swag-bin
            tgs2png-git
            libxslt-git
            lisgd-git
            guile-commonmark-git
            guile-fibers-git
            gimp-appimage
            splash-bin
            minizip-git
            rpi-imager-git
            lagrange-bin
            beets-git
            shotcut-bin
            conan-bin
            ))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

(define-public cmake3-bin
  (gaurix-alias-package "cmake3-bin" "cmake-minimal"))
(define-public dsd-git
  (gaurix-alias-package "dsd-git" "dsd"))
(define-public hcxdumptool-git
  (gaurix-alias-package "hcxdumptool-git" "hcxdumptool"))
(define-public simdutf-git
  (gaurix-alias-package "simdutf-git" "simdutf"))
(define-public openrct2-git
  (gaurix-alias-package "openrct2-git" "openrct2"))
(define-public tenacity-git
  (gaurix-alias-package "tenacity-git" "tenacity"))
(define-public midori-bin
  (gaurix-alias-package "midori-bin" "midori"))
(define-public signal-desktop-beta
  (gaurix-alias-package "signal-desktop-beta" "signal-desktop"))
(define-public celestia-bin
  (gaurix-alias-package "celestia-bin" "celestia"))
(define-public dstask-bin
  (gaurix-alias-package "dstask-bin" "dstask"))
(define-public fceux-git
  (gaurix-alias-package "fceux-git" "fceux"))
(define-public corosync-git
  (gaurix-alias-package "corosync-git" "corosync"))
(define-public radicle-bin
  (gaurix-alias-package "radicle-bin" "radicle"))
(define-public syncthing-bin
  (gaurix-alias-package "syncthing-bin" "syncthing"))
(define-public numix-gtk-theme-git
  (gaurix-alias-package "numix-gtk-theme-git" "numix-gtk-theme"))
(define-public vscodium
  (gaurix-alias-package "vscodium" "vscodium"))
(define-public docker-desktop
  (gaurix-alias-package "docker-desktop" "docker"))
(define-public anydesk-bin
  (gaurix-alias-package "anydesk-bin" "anydesk"))
(define-public witr-bin
  (gaurix-alias-package "witr-bin" "witr"))
(define-public hyprland-git
  (gaurix-alias-package "hyprland-git" "hyprland"))
(define-public rsgain
  (gaurix-alias-package "rsgain" "rsgain"))
(define-public phonon-qt5
  (gaurix-alias-package "phonon-qt5" "phonon-qt5"))
(define-public rpcs3-bin
  (gaurix-alias-package "rpcs3-bin" "rpcs3"))
(define-public eden-beta
  (gaurix-alias-package "eden-beta" "eden"))
(define-public wezterm-git
  (gaurix-alias-package "wezterm-git" "wezterm"))
(define-public witr
  (gaurix-alias-package "witr" "witr"))
(define-public eden
  (gaurix-alias-package "eden" "eden"))
(define-public linphone-desktop-appimage
  (gaurix-alias-package "linphone-desktop-appimage" "linphone-desktop"))
(define-public telegram-desktop-bin
  (gaurix-alias-package "telegram-desktop-bin" "telegram-desktop"))
(define-public rpcs3-git
  (gaurix-alias-package "rpcs3-git" "rpcs3"))
(define-public nvidia-settings-beta
  (gaurix-alias-package "nvidia-settings-beta" "nvidia-settings-beta"))
(define-public python-mcp
  (gaurix-alias-package "python-mcp" "python-mcp"))
(define-public chezmoi-git
  (gaurix-alias-package "chezmoi-git" "chezmoi"))
(define-public ttf-mononoki
  (gaurix-alias-package "ttf-mononoki" "font-mononoki"))
(define-public ttf-recursive
  (gaurix-alias-package "ttf-recursive" "font-recursive"))
(define-public tmsu-git
  (gaurix-alias-package "tmsu-git" "tmsu"))
(define-public clac
  (gaurix-alias-package "clac" "clac"))
(define-public grantlee
  (gaurix-alias-package "grantlee" "grantlee"))
(define-public tmsu-bin
  (gaurix-alias-package "tmsu-bin" "tmsu"))
(define-public tree-sitter-css-git
  (gaurix-alias-package "tree-sitter-css-git" "tree-sitter-css"))
(define-public tree-sitter-elixir-git
  (gaurix-alias-package "tree-sitter-elixir-git" "tree-sitter-elixir"))
(define-public tree-sitter-html-git
  (gaurix-alias-package "tree-sitter-html-git" "tree-sitter-html"))
(define-public tree-sitter-jsdoc-git
  (gaurix-alias-package "tree-sitter-jsdoc-git" "tree-sitter-jsdoc"))
(define-public tree-sitter-php-git
  (gaurix-alias-package "tree-sitter-php-git" "tree-sitter-php"))
(define-public vhdl-ls
  (gaurix-alias-package "vhdl-ls" "vhdl-ls"))
(define-public codex-acp
  (gaurix-alias-package "codex-acp" "codex-acp"))
(define-public copyq-git
  (gaurix-alias-package "copyq-git" "copyq"))
(define-public fzf-tab
  (gaurix-alias-package "fzf-tab" "fzf-tab"))
(define-public scilab-bin
  (gaurix-alias-package "scilab-bin" "scilab"))
(define-public mlmmj
  (gaurix-alias-package "mlmmj" "mlmmj"))
(define-public no-more-secrets-git
  (gaurix-alias-package "no-more-secrets-git" "no-more-secrets"))
(define-public autofs-git
  (gaurix-alias-package "autofs-git" "autofs"))
(define-public espanso-x11-git
  (gaurix-alias-package "espanso-x11-git" "espanso-x11"))
(define-public espanso-wayland-git
  (gaurix-alias-package "espanso-wayland-git" "espanso-wayland"))
(define-public element-desktop-git
  (gaurix-alias-package "element-desktop-git" "element-desktop"))
(define-public helix-git
  (gaurix-alias-package "helix-git" "helix"))
(define-public inkscape-bin
  (gaurix-alias-package "inkscape-bin" "inkscape"))
(define-public pcb
  (gaurix-alias-package "pcb" "pcb"))
(define-public grayjay-bin
  (gaurix-alias-package "grayjay-bin" "grayjay"))
(define-public beads-git
  (gaurix-alias-package "beads-git" "beads"))
(define-public eduke32
  (gaurix-alias-package "eduke32" "eduke32"))
(define-public google-chrome-canary
  (gaurix-alias-package "google-chrome-canary" "google-chrome-canary"))
(define-public ttf-iosevka
  (gaurix-alias-package "ttf-iosevka" "font-iosevka"))
(define-public linux-git
  (gaurix-alias-package "linux-git" "linux"))
(define-public ttf-miracode
  (gaurix-alias-package "ttf-miracode" "font-miracode"))
(define-public python-pynput
  (gaurix-alias-package "python-pynput" "python-pynput"))
(define-public normalize
  (gaurix-alias-package "normalize" "normalize"))
(define-public qbittorrent-enhanced-git
  (gaurix-alias-package "qbittorrent-enhanced-git" "qbittorrent-enhanced"))
(define-public qdirstat-bin
  (gaurix-alias-package "qdirstat-bin" "qdirstat"))
(define-public megacmd-bin
  (gaurix-alias-package "megacmd-bin" "megacmd"))
(define-public passage-git
  (gaurix-alias-package "passage-git" "passage"))
(define-public libsixel-git
  (gaurix-alias-package "libsixel-git" "libsixel"))
(define-public passff-host-git
  (gaurix-alias-package "passff-host-git" "passff-host"))
(define-public govulncheck-git
  (gaurix-alias-package "govulncheck-git" "govulncheck"))
(define-public seek-bin
  (gaurix-alias-package "seek-bin" "seek"))
(define-public guix-git
  (gaurix-alias-package "guix-git" "guix"))
(define-public hotspot-appimage
  (gaurix-alias-package "hotspot-appimage" "hotspot"))
(define-public ck-bin
  (gaurix-alias-package "ck-bin" "ck"))
(define-public qelectrotech-git
  (gaurix-alias-package "qelectrotech-git" "qelectrotech"))
(define-public cutter-bin
  (gaurix-alias-package "cutter-bin" "cutter"))
(define-public dgop-git
  (gaurix-alias-package "dgop-git" "dgop"))
(define-public cqfd-bin
  (gaurix-alias-package "cqfd-bin" "cqfd"))
(define-public plover-appimage
  (gaurix-alias-package "plover-appimage" "plover"))
(define-public eduke32-bin
  (gaurix-alias-package "eduke32-bin" "eduke32"))
(define-public python-sentencepiece-bin
  (gaurix-alias-package "python-sentencepiece-bin" "python-sentencepiece"))
(define-public sentencepiece-bin
  (gaurix-alias-package "sentencepiece-bin" "sentencepiece"))
(define-public swag-bin
  (gaurix-alias-package "swag-bin" "swag"))
(define-public tgs2png-git
  (gaurix-alias-package "tgs2png-git" "tgs2png"))
(define-public libxslt-git
  (gaurix-alias-package "libxslt-git" "libxslt"))
(define-public lisgd-git
  (gaurix-alias-package "lisgd-git" "lisgd"))
(define-public guile-commonmark-git
  (gaurix-alias-package "guile-commonmark-git" "guile-commonmark"))
(define-public guile-fibers-git
  (gaurix-alias-package "guile-fibers-git" "guile-fibers"))
(define-public gimp-appimage
  (gaurix-alias-package "gimp-appimage" "gimp"))
(define-public splash-bin
  (gaurix-alias-package "splash-bin" "splash"))
(define-public minizip-git
  (gaurix-alias-package "minizip-git" "minizip"))
(define-public rpi-imager-git
  (gaurix-alias-package "rpi-imager-git" "rpi-imager"))
(define-public lagrange-bin
  (gaurix-alias-package "lagrange-bin" "lagrange"))
(define-public beets-git
  (gaurix-alias-package "beets-git" "beets"))
(define-public shotcut-bin
  (gaurix-alias-package "shotcut-bin" "shotcut"))
(define-public conan-bin
  (gaurix-alias-package "conan-bin" "conan"))
