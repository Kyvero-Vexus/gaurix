(define-module (gaurix packages queue-20260318g)
  #:use-module (guix packages)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages vpn)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages games)
  #:export (qt5ct-kde
            linux-mainline
            hyprwayland-scanner-git
            hyprland-protocols-git
            easyeffects-git
            gp-saml-gui-git
            hyprlang-git
            hyprutils-git
            radicle-desktop
            joycond-git
            unordered_dense-git))

(define-public qt5ct-kde
  (package (inherit qt5ct) (name "qt5ct-kde")))

(define-public linux-mainline
  (package (inherit linux-libre) (name "linux-mainline")))

(define-public hyprwayland-scanner-git
  (package (inherit hyprwayland-scanner) (name "hyprwayland-scanner-git")))

(define-public hyprland-protocols-git
  (package (inherit hyprland-protocols) (name "hyprland-protocols-git")))

(define-public easyeffects-git
  (package (inherit easyeffects) (name "easyeffects-git")))

(define-public gp-saml-gui-git
  (package (inherit gp-saml-gui) (name "gp-saml-gui-git")))

(define-public hyprlang-git
  (package (inherit hyprlang) (name "hyprlang-git")))

(define-public hyprutils-git
  (package (inherit hyprutils) (name "hyprutils-git")))

(define-public radicle-desktop
  (package (inherit radicle) (name "radicle-desktop")))

(define-public joycond-git
  (package (inherit joycond) (name "joycond-git")))

(define-public unordered_dense-git
  (package (inherit unordered-dense) (name "unordered_dense-git")))
