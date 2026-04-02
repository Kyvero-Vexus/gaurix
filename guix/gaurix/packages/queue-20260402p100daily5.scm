;;; Queue drain 2026-04-02 daily run (batch 5).
;;; Selected 100 TODO entries from todo_general_packages.org.
;;; Status: upstream Guix package re-export batch with target-resolution validation.
(define-module (gaurix packages queue-20260402p100daily5)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:export (
            akonadi-notes
            codeberg-cli-git
            skim-git
            qtractor-git
            mimalloc-git
            python-whenever-git
            ncdu-git
            zathura-cb-git
            imgui-git
            dump1090-git
            pcc-git
            tree-sitter-cli-git
            beancount-git
            corectrl-git
            kirc-git
            brlaser-git
            otf-takao
            hyprpicker-git
            xfce4-i3-workspaces-plugin-git
            otf-bravura
            zynaddsubfx-git
            yoshimi-git
            autotrace-git
            ckb-next-git
            emacs-exwm-git
            emacs-xelb-git
            stumpwm-git
            wabt-git
            sway-git
            redis-bin
            tmux-git
            electrum-appimage
            vim-git
            frei0r-plugins-git
            armagetronad-git
            swaybg-git
            swaylock-git
            swayimg-git
            ppsspp-git
            ytfzf-git
            supercollider-git
            flycast-bin
            sdrangel-bin
            dwl-git
            libnftnl-git
            geany-git
            scenefx-git
            emacs-lsp-booster-git
            rakudo-bin
            clipit-git
            satdump-git
            libbacktrace-git
            tlpui-git
            ttf-scientifica
            strawberry-git
            valkey-git
            jed-git
            python2-bin
            julia-bin
            firejail-git
            nyxt-git
            libmegapixels-git
            audacious-git
            iptables-git
            texmacs-guile3-git
            poop-bin
            hyprsunset-git
            aerc-git
            agate-bin
            kiwix-desktop-git
            goawk-bin
            manuskript-git
            ttf-orbitron
            mblaze-git
            scron-git
            flux-git
            ghex-git
            gtypist-git
            retroarch-git
            jj-bin
            tor-git
            f2fs-tools-git
            tree-sitter-ruby-git
            fastfetch-git
            hledger-web-bin
            xorgproto-git
            wayland-protocols-git
            autojump-git
            grim-git
            wlopm-git
            udevil-git
            fakeroot-git
            wayland-git
            wl-clipboard-git
            swayidle-git
            swappy-git
            zenity-git
            wlr-protocols-git
            ttf-plemoljp-bin
            slurp-git
            ))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

(define-public akonadi-notes
  (gaurix-alias-package "akonadi-notes" "akonadi-notes"))
(define-public codeberg-cli-git
  (gaurix-alias-package "codeberg-cli-git" "codeberg-cli"))
(define-public skim-git
  (gaurix-alias-package "skim-git" "skim"))
(define-public qtractor-git
  (gaurix-alias-package "qtractor-git" "qtractor"))
(define-public mimalloc-git
  (gaurix-alias-package "mimalloc-git" "mimalloc"))
(define-public python-whenever-git
  (gaurix-alias-package "python-whenever-git" "python-whenever"))
(define-public ncdu-git
  (gaurix-alias-package "ncdu-git" "ncdu"))
(define-public zathura-cb-git
  (gaurix-alias-package "zathura-cb-git" "zathura-cb"))
(define-public imgui-git
  (gaurix-alias-package "imgui-git" "imgui"))
(define-public dump1090-git
  (gaurix-alias-package "dump1090-git" "dump1090"))
(define-public pcc-git
  (gaurix-alias-package "pcc-git" "pcc"))
(define-public tree-sitter-cli-git
  (gaurix-alias-package "tree-sitter-cli-git" "tree-sitter-cli"))
(define-public beancount-git
  (gaurix-alias-package "beancount-git" "beancount"))
(define-public corectrl-git
  (gaurix-alias-package "corectrl-git" "corectrl"))
(define-public kirc-git
  (gaurix-alias-package "kirc-git" "kirc"))
(define-public brlaser-git
  (gaurix-alias-package "brlaser-git" "brlaser"))
(define-public otf-takao
  (gaurix-alias-package "otf-takao" "font-takao"))
(define-public hyprpicker-git
  (gaurix-alias-package "hyprpicker-git" "hyprpicker"))
(define-public xfce4-i3-workspaces-plugin-git
  (gaurix-alias-package "xfce4-i3-workspaces-plugin-git" "xfce4-i3-workspaces-plugin"))
(define-public otf-bravura
  (gaurix-alias-package "otf-bravura" "font-bravura"))
(define-public zynaddsubfx-git
  (gaurix-alias-package "zynaddsubfx-git" "zynaddsubfx"))
(define-public yoshimi-git
  (gaurix-alias-package "yoshimi-git" "yoshimi"))
(define-public autotrace-git
  (gaurix-alias-package "autotrace-git" "autotrace"))
(define-public ckb-next-git
  (gaurix-alias-package "ckb-next-git" "ckb-next"))
(define-public emacs-exwm-git
  (gaurix-alias-package "emacs-exwm-git" "emacs-exwm"))
(define-public emacs-xelb-git
  (gaurix-alias-package "emacs-xelb-git" "emacs-xelb"))
(define-public stumpwm-git
  (gaurix-alias-package "stumpwm-git" "stumpwm"))
(define-public wabt-git
  (gaurix-alias-package "wabt-git" "wabt"))
(define-public sway-git
  (gaurix-alias-package "sway-git" "sway"))
(define-public redis-bin
  (gaurix-alias-package "redis-bin" "redis"))
(define-public tmux-git
  (gaurix-alias-package "tmux-git" "tmux"))
(define-public electrum-appimage
  (gaurix-alias-package "electrum-appimage" "electrum"))
(define-public vim-git
  (gaurix-alias-package "vim-git" "vim"))
(define-public frei0r-plugins-git
  (gaurix-alias-package "frei0r-plugins-git" "frei0r-plugins"))
(define-public armagetronad-git
  (gaurix-alias-package "armagetronad-git" "armagetronad"))
(define-public swaybg-git
  (gaurix-alias-package "swaybg-git" "swaybg"))
(define-public swaylock-git
  (gaurix-alias-package "swaylock-git" "swaylock"))
(define-public swayimg-git
  (gaurix-alias-package "swayimg-git" "swayimg"))
(define-public ppsspp-git
  (gaurix-alias-package "ppsspp-git" "ppsspp"))
(define-public ytfzf-git
  (gaurix-alias-package "ytfzf-git" "ytfzf"))
(define-public supercollider-git
  (gaurix-alias-package "supercollider-git" "supercollider"))
(define-public flycast-bin
  (gaurix-alias-package "flycast-bin" "flycast"))
(define-public sdrangel-bin
  (gaurix-alias-package "sdrangel-bin" "sdrangel"))
(define-public dwl-git
  (gaurix-alias-package "dwl-git" "dwl"))
(define-public libnftnl-git
  (gaurix-alias-package "libnftnl-git" "libnftnl"))
(define-public geany-git
  (gaurix-alias-package "geany-git" "geany"))
(define-public scenefx-git
  (gaurix-alias-package "scenefx-git" "scenefx"))
(define-public emacs-lsp-booster-git
  (gaurix-alias-package "emacs-lsp-booster-git" "emacs-lsp-booster"))
(define-public rakudo-bin
  (gaurix-alias-package "rakudo-bin" "rakudo"))
(define-public clipit-git
  (gaurix-alias-package "clipit-git" "clipit"))
(define-public satdump-git
  (gaurix-alias-package "satdump-git" "satdump"))
(define-public libbacktrace-git
  (gaurix-alias-package "libbacktrace-git" "libbacktrace"))
(define-public tlpui-git
  (gaurix-alias-package "tlpui-git" "tlpui"))
(define-public ttf-scientifica
  (gaurix-alias-package "ttf-scientifica" "font-scientifica"))
(define-public strawberry-git
  (gaurix-alias-package "strawberry-git" "strawberry"))
(define-public valkey-git
  (gaurix-alias-package "valkey-git" "valkey"))
(define-public jed-git
  (gaurix-alias-package "jed-git" "jed"))
(define-public python2-bin
  (gaurix-alias-package "python2-bin" "python2"))
(define-public julia-bin
  (gaurix-alias-package "julia-bin" "julia"))
(define-public firejail-git
  (gaurix-alias-package "firejail-git" "firejail"))
(define-public nyxt-git
  (gaurix-alias-package "nyxt-git" "nyxt"))
(define-public libmegapixels-git
  (gaurix-alias-package "libmegapixels-git" "libmegapixels"))
(define-public audacious-git
  (gaurix-alias-package "audacious-git" "audacious"))
(define-public iptables-git
  (gaurix-alias-package "iptables-git" "iptables"))
(define-public texmacs-guile3-git
  (gaurix-alias-package "texmacs-guile3-git" "texmacs-guile3"))
(define-public poop-bin
  (gaurix-alias-package "poop-bin" "poop"))
(define-public hyprsunset-git
  (gaurix-alias-package "hyprsunset-git" "hyprsunset"))
(define-public aerc-git
  (gaurix-alias-package "aerc-git" "aerc"))
(define-public agate-bin
  (gaurix-alias-package "agate-bin" "agate"))
(define-public kiwix-desktop-git
  (gaurix-alias-package "kiwix-desktop-git" "kiwix-desktop"))
(define-public goawk-bin
  (gaurix-alias-package "goawk-bin" "goawk"))
(define-public manuskript-git
  (gaurix-alias-package "manuskript-git" "manuskript"))
(define-public ttf-orbitron
  (gaurix-alias-package "ttf-orbitron" "font-orbitron"))
(define-public mblaze-git
  (gaurix-alias-package "mblaze-git" "mblaze"))
(define-public scron-git
  (gaurix-alias-package "scron-git" "scron"))
(define-public flux-git
  (gaurix-alias-package "flux-git" "flux"))
(define-public ghex-git
  (gaurix-alias-package "ghex-git" "ghex"))
(define-public gtypist-git
  (gaurix-alias-package "gtypist-git" "gtypist"))
(define-public retroarch-git
  (gaurix-alias-package "retroarch-git" "retroarch"))
(define-public jj-bin
  (gaurix-alias-package "jj-bin" "jj"))
(define-public tor-git
  (gaurix-alias-package "tor-git" "tor"))
(define-public f2fs-tools-git
  (gaurix-alias-package "f2fs-tools-git" "f2fs-tools"))
(define-public tree-sitter-ruby-git
  (gaurix-alias-package "tree-sitter-ruby-git" "tree-sitter-ruby"))
(define-public fastfetch-git
  (gaurix-alias-package "fastfetch-git" "fastfetch"))
(define-public hledger-web-bin
  (gaurix-alias-package "hledger-web-bin" "hledger-web"))
(define-public xorgproto-git
  (gaurix-alias-package "xorgproto-git" "xorgproto"))
(define-public wayland-protocols-git
  (gaurix-alias-package "wayland-protocols-git" "wayland-protocols"))
(define-public autojump-git
  (gaurix-alias-package "autojump-git" "autojump"))
(define-public grim-git
  (gaurix-alias-package "grim-git" "grim"))
(define-public wlopm-git
  (gaurix-alias-package "wlopm-git" "wlopm"))
(define-public udevil-git
  (gaurix-alias-package "udevil-git" "udevil"))
(define-public fakeroot-git
  (gaurix-alias-package "fakeroot-git" "fakeroot"))
(define-public wayland-git
  (gaurix-alias-package "wayland-git" "wayland"))
(define-public wl-clipboard-git
  (gaurix-alias-package "wl-clipboard-git" "wl-clipboard"))
(define-public swayidle-git
  (gaurix-alias-package "swayidle-git" "swayidle"))
(define-public swappy-git
  (gaurix-alias-package "swappy-git" "swappy"))
(define-public zenity-git
  (gaurix-alias-package "zenity-git" "zenity"))
(define-public wlr-protocols-git
  (gaurix-alias-package "wlr-protocols-git" "wlr-protocols"))
(define-public ttf-plemoljp-bin
  (gaurix-alias-package "ttf-plemoljp-bin" "font-plemoljp"))
(define-public slurp-git
  (gaurix-alias-package "slurp-git" "slurp"))
