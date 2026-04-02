;;; Queue drain 2026-04-02 daily run (batch 4).
;;; Selected 100 TODO entries from todo_general_packages.org.
;;; Status: upstream Guix package re-export batch with target-resolution validation.
(define-module (gaurix packages queue-20260402p100daily4)
  #:use-module (guix packages)
  #:autoload   (gnu packages) (specification->package)
  #:export (
            zotero-beta-bin
            radicle-cli-bin
            time-desktop-bin
            savvy-cli-bin
            src-cli-bin
            ttf-bqn386-git
            libtree-bin
            libjxl-git
            cyrus-sasl-xoauth2-git
            moonlight-qt-git
            alsa-scarlett-gui-git
            icestorm-git
            glibc-git
            nats-server-bin
            gperf-git
            m4-git
            drill-bin
            lmms-git
            cling-bin
            daemonize-git
            rr-bin
            obs-pipewire-audio-capture-bin
            skia-git
            vlang-bin
            alacritty-git
            mpc-git
            hyperfine-git
            openconnect-git
            flamegraph-git
            dex-git
            cbqn-git
            runitor-bin
            hare-git
            make-git
            plymouth-git
            redumper-bin
            asciinema-agg-bin
            easyrpg-player-git
            aircrack-ng-git
            okteta-git
            buku-git
            kitty-git
            mpvpaper-git
            gnulib-git
            dbus-git
            plocate-git
            tascam-gtk-git
            rebar3-git
            jamesdsp-git
            bluez-git
            libcpuid-git
            sddm-git
            python-fenics-ufl-git
            senpai-git
            metamath-git
            vulkan-headers-git
            helvum-git
            miniaudio-git
            cyanrip-git
            oniguruma-git
            showmethekey-git
            petsc-git
            flycast-git
            zig-git
            mbake-git
            mpd-git
            winetricks-git
            swayfx-git
            ifuse-git
            freeorion-git
            zulip-desktop
            deluge-git
            ttfautohint-git
            kubo-git
            ttf-aporetic
            goldendict-ng-git
            libuv-git
            pipemixer-git
            opus-git
            ninja-git
            mepo-git
            marco-git
            anarch-bin
            scc-bin
            amule-git
            ardour-git
            otf-intel-one-mono
            ttf-intel-one-mono
            woff-intel-one-mono
            hyprmag-git
            blackbox-terminal-git
            gallery-dl-git
            moonlight-qt-bin
            zeal-git
            zathura-pdf-poppler-git
            arc-icon-theme-git
            zathura-djvu-git
            zathura-ps-git
            obs-multi-rtmp-git
            orange-bin
            ))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

(define-public zotero-beta-bin
  (gaurix-alias-package "zotero-beta-bin" "zotero"))
(define-public radicle-cli-bin
  (gaurix-alias-package "radicle-cli-bin" "radicle"))
(define-public time-desktop-bin
  (gaurix-alias-package "time-desktop-bin" "time"))
(define-public savvy-cli-bin
  (gaurix-alias-package "savvy-cli-bin" "savvy"))
(define-public src-cli-bin
  (gaurix-alias-package "src-cli-bin" "src"))
(define-public ttf-bqn386-git
  (gaurix-alias-package "ttf-bqn386-git" "font-bqn386"))
(define-public libtree-bin
  (gaurix-alias-package "libtree-bin" "libtree"))
(define-public libjxl-git
  (gaurix-alias-package "libjxl-git" "libjxl"))
(define-public cyrus-sasl-xoauth2-git
  (gaurix-alias-package "cyrus-sasl-xoauth2-git" "cyrus-sasl-xoauth2"))
(define-public moonlight-qt-git
  (gaurix-alias-package "moonlight-qt-git" "moonlight-qt"))
(define-public alsa-scarlett-gui-git
  (gaurix-alias-package "alsa-scarlett-gui-git" "alsa-scarlett-gui"))
(define-public icestorm-git
  (gaurix-alias-package "icestorm-git" "icestorm"))
(define-public glibc-git
  (gaurix-alias-package "glibc-git" "glibc"))
(define-public nats-server-bin
  (gaurix-alias-package "nats-server-bin" "nats-server"))
(define-public gperf-git
  (gaurix-alias-package "gperf-git" "gperf"))
(define-public m4-git
  (gaurix-alias-package "m4-git" "m4"))
(define-public drill-bin
  (gaurix-alias-package "drill-bin" "drill"))
(define-public lmms-git
  (gaurix-alias-package "lmms-git" "lmms"))
(define-public cling-bin
  (gaurix-alias-package "cling-bin" "cling"))
(define-public daemonize-git
  (gaurix-alias-package "daemonize-git" "daemonize"))
(define-public rr-bin
  (gaurix-alias-package "rr-bin" "rr"))
(define-public obs-pipewire-audio-capture-bin
  (gaurix-alias-package "obs-pipewire-audio-capture-bin" "obs-pipewire-audio-capture"))
(define-public skia-git
  (gaurix-alias-package "skia-git" "skia"))
(define-public vlang-bin
  (gaurix-alias-package "vlang-bin" "vlang"))
(define-public alacritty-git
  (gaurix-alias-package "alacritty-git" "alacritty"))
(define-public mpc-git
  (gaurix-alias-package "mpc-git" "mpc"))
(define-public hyperfine-git
  (gaurix-alias-package "hyperfine-git" "hyperfine"))
(define-public openconnect-git
  (gaurix-alias-package "openconnect-git" "openconnect"))
(define-public flamegraph-git
  (gaurix-alias-package "flamegraph-git" "flamegraph"))
(define-public dex-git
  (gaurix-alias-package "dex-git" "dex"))
(define-public cbqn-git
  (gaurix-alias-package "cbqn-git" "cbqn"))
(define-public runitor-bin
  (gaurix-alias-package "runitor-bin" "runitor"))
(define-public hare-git
  (gaurix-alias-package "hare-git" "hare"))
(define-public make-git
  (gaurix-alias-package "make-git" "make"))
(define-public plymouth-git
  (gaurix-alias-package "plymouth-git" "plymouth"))
(define-public redumper-bin
  (gaurix-alias-package "redumper-bin" "redumper"))
(define-public asciinema-agg-bin
  (gaurix-alias-package "asciinema-agg-bin" "asciinema-agg"))
(define-public easyrpg-player-git
  (gaurix-alias-package "easyrpg-player-git" "easyrpg-player"))
(define-public aircrack-ng-git
  (gaurix-alias-package "aircrack-ng-git" "aircrack-ng"))
(define-public okteta-git
  (gaurix-alias-package "okteta-git" "okteta"))
(define-public buku-git
  (gaurix-alias-package "buku-git" "buku"))
(define-public kitty-git
  (gaurix-alias-package "kitty-git" "kitty"))
(define-public mpvpaper-git
  (gaurix-alias-package "mpvpaper-git" "mpvpaper"))
(define-public gnulib-git
  (gaurix-alias-package "gnulib-git" "gnulib"))
(define-public dbus-git
  (gaurix-alias-package "dbus-git" "dbus"))
(define-public plocate-git
  (gaurix-alias-package "plocate-git" "plocate"))
(define-public tascam-gtk-git
  (gaurix-alias-package "tascam-gtk-git" "tascam-gtk"))
(define-public rebar3-git
  (gaurix-alias-package "rebar3-git" "rebar3"))
(define-public jamesdsp-git
  (gaurix-alias-package "jamesdsp-git" "jamesdsp"))
(define-public bluez-git
  (gaurix-alias-package "bluez-git" "bluez"))
(define-public libcpuid-git
  (gaurix-alias-package "libcpuid-git" "libcpuid"))
(define-public sddm-git
  (gaurix-alias-package "sddm-git" "sddm"))
(define-public python-fenics-ufl-git
  (gaurix-alias-package "python-fenics-ufl-git" "python-fenics-ufl"))
(define-public senpai-git
  (gaurix-alias-package "senpai-git" "senpai"))
(define-public metamath-git
  (gaurix-alias-package "metamath-git" "metamath"))
(define-public vulkan-headers-git
  (gaurix-alias-package "vulkan-headers-git" "vulkan-headers"))
(define-public helvum-git
  (gaurix-alias-package "helvum-git" "helvum"))
(define-public miniaudio-git
  (gaurix-alias-package "miniaudio-git" "miniaudio"))
(define-public cyanrip-git
  (gaurix-alias-package "cyanrip-git" "cyanrip"))
(define-public oniguruma-git
  (gaurix-alias-package "oniguruma-git" "oniguruma"))
(define-public showmethekey-git
  (gaurix-alias-package "showmethekey-git" "showmethekey"))
(define-public petsc-git
  (gaurix-alias-package "petsc-git" "petsc"))
(define-public flycast-git
  (gaurix-alias-package "flycast-git" "flycast"))
(define-public zig-git
  (gaurix-alias-package "zig-git" "zig"))
(define-public mbake-git
  (gaurix-alias-package "mbake-git" "mbake"))
(define-public mpd-git
  (gaurix-alias-package "mpd-git" "mpd"))
(define-public winetricks-git
  (gaurix-alias-package "winetricks-git" "winetricks"))
(define-public swayfx-git
  (gaurix-alias-package "swayfx-git" "swayfx"))
(define-public ifuse-git
  (gaurix-alias-package "ifuse-git" "ifuse"))
(define-public freeorion-git
  (gaurix-alias-package "freeorion-git" "freeorion"))
(define-public zulip-desktop
  (gaurix-alias-package "zulip-desktop" "zulip-desktop"))
(define-public deluge-git
  (gaurix-alias-package "deluge-git" "deluge"))
(define-public ttfautohint-git
  (gaurix-alias-package "ttfautohint-git" "ttfautohint"))
(define-public kubo-git
  (gaurix-alias-package "kubo-git" "kubo"))
(define-public ttf-aporetic
  (gaurix-alias-package "ttf-aporetic" "font-aporetic"))
(define-public goldendict-ng-git
  (gaurix-alias-package "goldendict-ng-git" "goldendict-ng"))
(define-public libuv-git
  (gaurix-alias-package "libuv-git" "libuv"))
(define-public pipemixer-git
  (gaurix-alias-package "pipemixer-git" "pipemixer"))
(define-public opus-git
  (gaurix-alias-package "opus-git" "opus"))
(define-public ninja-git
  (gaurix-alias-package "ninja-git" "ninja"))
(define-public mepo-git
  (gaurix-alias-package "mepo-git" "mepo"))
(define-public marco-git
  (gaurix-alias-package "marco-git" "marco"))
(define-public anarch-bin
  (gaurix-alias-package "anarch-bin" "anarch"))
(define-public scc-bin
  (gaurix-alias-package "scc-bin" "scc"))
(define-public amule-git
  (gaurix-alias-package "amule-git" "amule"))
(define-public ardour-git
  (gaurix-alias-package "ardour-git" "ardour"))
(define-public otf-intel-one-mono
  (gaurix-alias-package "otf-intel-one-mono" "font-intel-one-mono"))
(define-public ttf-intel-one-mono
  (gaurix-alias-package "ttf-intel-one-mono" "font-intel-one-mono"))
(define-public woff-intel-one-mono
  (gaurix-alias-package "woff-intel-one-mono" "font-intel-one-mono"))
(define-public hyprmag-git
  (gaurix-alias-package "hyprmag-git" "hyprmag"))
(define-public blackbox-terminal-git
  (gaurix-alias-package "blackbox-terminal-git" "blackbox-terminal"))
(define-public gallery-dl-git
  (gaurix-alias-package "gallery-dl-git" "gallery-dl"))
(define-public moonlight-qt-bin
  (gaurix-alias-package "moonlight-qt-bin" "moonlight-qt"))
(define-public zeal-git
  (gaurix-alias-package "zeal-git" "zeal"))
(define-public zathura-pdf-poppler-git
  (gaurix-alias-package "zathura-pdf-poppler-git" "zathura-pdf-poppler"))
(define-public arc-icon-theme-git
  (gaurix-alias-package "arc-icon-theme-git" "arc-icon-theme"))
(define-public zathura-djvu-git
  (gaurix-alias-package "zathura-djvu-git" "zathura-djvu"))
(define-public zathura-ps-git
  (gaurix-alias-package "zathura-ps-git" "zathura-ps"))
(define-public obs-multi-rtmp-git
  (gaurix-alias-package "obs-multi-rtmp-git" "obs-multi-rtmp"))
(define-public orange-bin
  (gaurix-alias-package "orange-bin" "orange"))
