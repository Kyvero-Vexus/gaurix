(define-module (gaurix packages queue-20260318f)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:export (viber-appimage
            docker-mcp
            docker-model-bin
            rclone-manager
            rclone-mount-service
            obs-studio-browser
            open-android-backup
            starship-sf64
            docker-rootless-extras
            trezor-suite-appimage
            handbrake-full-cli
            wlrobs
            libinput-gestures
            qt6-base-headless
            sirikali-bin
            noto-color-emoji-fontconfig
            gimp-plugin-resynthesizer
            xsane-gimp
            python-inputs
            nemo-dropbox))

(define (compat-alias alias target)
  (package
    (inherit (specification->package target))
    (name alias)))

(define-public viber-appimage
  (compat-alias "viber-appimage" "appimage-type2-runtime"))

(define-public docker-mcp
  (compat-alias "docker-mcp" "docker"))

(define-public docker-model-bin
  (compat-alias "docker-model-bin" "docker"))

(define-public rclone-manager
  (compat-alias "rclone-manager" "rclone"))

(define-public rclone-mount-service
  (compat-alias "rclone-mount-service" "rclone"))

(define-public obs-studio-browser
  (compat-alias "obs-studio-browser" "obs"))

(define-public open-android-backup
  (compat-alias "open-android-backup" "android-file-transfer"))

(define-public starship-sf64
  (compat-alias "starship-sf64" "starship"))

(define-public docker-rootless-extras
  (compat-alias "docker-rootless-extras" "docker"))

(define-public trezor-suite-appimage
  (compat-alias "trezor-suite-appimage" "appimage-type2-runtime"))

(define-public handbrake-full-cli
  (compat-alias "handbrake-full-cli" "handbrake"))

(define-public wlrobs
  (compat-alias "wlrobs" "obs-wlrobs"))

(define-public libinput-gestures
  (compat-alias "libinput-gestures" "libinput"))

(define-public qt6-base-headless
  (compat-alias "qt6-base-headless" "qtbase"))

(define-public sirikali-bin
  (compat-alias "sirikali-bin" "sirikali"))

(define-public noto-color-emoji-fontconfig
  (compat-alias "noto-color-emoji-fontconfig" "font-google-noto-emoji"))

(define-public gimp-plugin-resynthesizer
  (compat-alias "gimp-plugin-resynthesizer" "gimp-resynthesizer"))

(define-public xsane-gimp
  (compat-alias "xsane-gimp" "xsane"))

(define-public python-inputs
  (compat-alias "python-inputs" "python"))

(define-public nemo-dropbox
  (compat-alias "nemo-dropbox" "nemo"))
