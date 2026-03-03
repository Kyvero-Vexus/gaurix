(define-module (gaurix packages general-compat)
  #:use-module (gaurix packages llama-cpp-cuda)
  #:use-module (guix packages)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages libidn)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages python)
  #:use-module (gnu packages video)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages xorg)
  #:use-module ((gnu packages tls) #:prefix gnu:)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages image)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages compton)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages games)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gnome-xyz)
  #:use-module (gnu packages hardware)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages language)
  #:use-module (gnu packages mold)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages search)
  #:use-module (gnu packages task-management)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages wm)
  #:export (gtk2 gnu-netcat qt5-webengine python312 openssl-1.1
            yt-dlp-git ripgrep-git fd-git eza-git zoxide-git shellcheck-bin
            xlibre-xserver xlibre-xserver-bootstrap xlibre-xserver-xnest xlibre-xserver-xephyr xlibre-xserver-devel xlibre-xserver-common xlibre-xserver-xvfb qt5-remoteobjects qt5-webchannel qt5-websockets
            dashbinsh libidn11 ncurses5-compat-libs neovim-symlinks neovim-git lib32-libidn11
            gtk-engine-murrine
            python313
            botan2
            piper-tts
            libjpeg6-turbo
            lib32-gtk2 openssl-1.0
            quickshell-git
            openscad-git
            mesa-git
            openrgb-git
            hashcat-git
            mold-git
            picom-git
            papirus-icon-theme-git
            libplasma-git
            qutebrowser-git
            cataclysm-dda-git
            mecab-git
            openttd-jgrpp-git
            dragon-drop-git
            python-protobuf-git
            protobuf-git
            libarchive-git
            dstask-git
            fsearch-git
            procs-git
            zfs-dkms
            lib32-openssl-1.0
            llama.cpp-vulkan))

(define-public gtk2
  (package
    (inherit gtk+-2)
    (name "gtk2")))

(define-public gnu-netcat
  (package
    (inherit netcat)
    (name "gnu-netcat")))

(define-public qt5-webengine
  (package
    (inherit qtwebengine-5)
    (name "qt5-webengine")))

(define-public python312
  (package
    (inherit python-3.12)
    (name "python312")))

(define-public openssl-1.1
  (package
    (inherit gnu:openssl-1.1)
    (name "openssl-1.1")))

(define-public yt-dlp-git
  (package
    (inherit yt-dlp)
    (name "yt-dlp-git")))

(define-public ripgrep-git
  (package
    (inherit ripgrep)
    (name "ripgrep-git")))

(define-public fd-git
  (package
    (inherit fd)
    (name "fd-git")))

(define-public eza-git
  (package
    (inherit eza)
    (name "eza-git")))

(define-public zoxide-git
  (package
    (inherit zoxide)
    (name "zoxide-git")))


(define-public shellcheck-bin
  (package
    (inherit shellcheck)
    (name "shellcheck-bin")))


(define-public xlibre-xserver
  (package
    (inherit xorg-server)
    (name "xlibre-xserver")))

(define-public xlibre-xserver-bootstrap
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-bootstrap")))

(define-public xlibre-xserver-common
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-common")))

(define-public xlibre-xserver-devel
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-devel")))

(define-public xlibre-xserver-xephyr
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-xephyr")))

(define-public xlibre-xserver-xnest
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-xnest")))

(define-public xlibre-xserver-xvfb
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-xvfb")))

(define-public qt5-remoteobjects
  (package
    (inherit qtremoteobjects)
    (name "qt5-remoteobjects")))

(define-public qt5-webchannel
  (package
    (inherit qtwebchannel)
    (name "qt5-webchannel")))

(define-public qt5-websockets
  (package
    (inherit qtwebsockets)
    (name "qt5-websockets")))

(define-public dashbinsh
  (package
    (inherit dash)
    (name "dashbinsh")))

(define-public libidn11
  (package
    (inherit libidn)
    (name "libidn11")))

(define-public ncurses5-compat-libs
  (package
    (inherit ncurses)
    (name "ncurses5-compat-libs")))

(define-public neovim-symlinks
  (package
    (inherit neovim)
    (name "neovim-symlinks")))

(define-public neovim-git
  (package
    (inherit neovim)
    (name "neovim-git")))

(define-public lib32-libidn11
  (package
    (inherit libidn11)
    (name "lib32-libidn11")))

(define-public gtk-engine-murrine
  (package
    (inherit murrine)
    (name "gtk-engine-murrine")))

(define-public botan2
  (package
    (inherit botan)
    (name "botan2")))

(define-public piper-tts
  (package
    (inherit piper)
    (name "piper-tts")))

(define-public libjpeg6-turbo
  (package
    (inherit libjpeg-turbo)
    (name "libjpeg6-turbo")))

(define-public python313
  (package
    (inherit python-next)
    (name "python313")))



(define-public lib32-gtk2
  (package
    (inherit gtk2)
    (name "lib32-gtk2")))


(define-public openssl-1.0
  (package
    (inherit openssl-1.1)
    (name "openssl-1.0")))

(define-public quickshell-git
  (package
    (inherit quickshell)
    (name "quickshell-git")))


(define-public openscad-git
  (package
    (inherit openscad)
    (name "openscad-git")))


(define-public mesa-git
  (package
    (inherit mesa)
    (name "mesa-git")))


(define-public openrgb-git
  (package
    (inherit openrgb)
    (name "openrgb-git")))


(define-public hashcat-git
  (package
    (inherit hashcat)
    (name "hashcat-git")))


(define-public mold-git
  (package
    (inherit mold)
    (name "mold-git")))


(define-public picom-git
  (package
    (inherit picom)
    (name "picom-git")))


(define-public papirus-icon-theme-git
  (package
    (inherit papirus-icon-theme)
    (name "papirus-icon-theme-git")))


(define-public libplasma-git
  (package
    (inherit libplasma)
    (name "libplasma-git")))


(define-public qutebrowser-git
  (package
    (inherit qutebrowser)
    (name "qutebrowser-git")))


(define-public cataclysm-dda-git
  (package
    (inherit cataclysm-dda)
    (name "cataclysm-dda-git")))


(define-public mecab-git
  (package
    (inherit mecab)
    (name "mecab-git")))


(define-public openttd-jgrpp-git
  (package
    (inherit openttd-jgrpp)
    (name "openttd-jgrpp-git")))


(define-public dragon-drop-git
  (package
    (inherit dragon-drop)
    (name "dragon-drop-git")))


(define-public python-protobuf-git
  (package
    (inherit python-protobuf)
    (name "python-protobuf-git")))


(define-public protobuf-git
  (package
    (inherit protobuf)
    (name "protobuf-git")))


(define-public libarchive-git
  (package
    (inherit libarchive)
    (name "libarchive-git")))


(define-public dstask-git
  (package
    (inherit dstask)
    (name "dstask-git")))


(define-public fsearch-git
  (package
    (inherit fsearch)
    (name "fsearch-git")))


(define-public procs-git
  (package
    (inherit procs)
    (name "procs-git")))



(define-public zfs-dkms
  (package
    (inherit zfs)
    (name "zfs-dkms")))

(define-public lib32-openssl-1.0
  (package
    (inherit openssl-1.0)
    (name "lib32-openssl-1.0")))

(define-public llama.cpp-vulkan
  (package
    (inherit llama-cpp-cuda)
    (name "llama.cpp-vulkan")
    (synopsis "Port of Facebook's LLaMA model in C/C++ (Vulkan compatibility alias)")))
