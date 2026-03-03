;;; Package namespace convenience module for Gaurix.
(define-module (gaurix packages)
  #:use-module (gaurix packages hello-gaurix)
  #:use-module (gaurix packages localsend-bin)
  #:use-module (gaurix packages aider-chat)
  #:use-module (gaurix packages lmstudio-bin)
  #:use-module (gaurix packages llama-cpp-cuda)
  #:use-module (gaurix packages visual-studio-code-bin)
  #:use-module (gaurix packages sunshine)
  #:use-module (gaurix packages sunshine-bin)
  #:use-module (gaurix packages fluxer-bin)
  #:use-module (gaurix packages comfyui-cuda)
  #:use-module (gaurix packages general-compat)
  #:use-module (gaurix packages ffglitch)
  #:export (hello-gaurix localsend-bin aider-chat lmstudio-bin
            llama-cpp-cuda visual-studio-code-bin sunshine sunshine-bin fluxer-bin comfyui-cuda
            gtk2 gnu-netcat qt5-webengine python312 openssl-1.1
            yt-dlp-git ripgrep-git fd-git eza-git zoxide-git shellcheck-bin
            xlibre-xserver xlibre-xserver-bootstrap xlibre-xserver-common xlibre-xserver-devel xlibre-xserver-xephyr xlibre-xserver-xnest xlibre-xserver-xvfb qt5-remoteobjects qt5-webchannel qt5-websockets
            dashbinsh libidn11 ncurses5-compat-libs neovim-symlinks neovim-git lib32-libidn11
            gtk-engine-murrine
            python313
            lib32-gtk2 openssl-1.0
            botan2
            piper-tts
            libjpeg6-turbo
            ffglitch))
