(define-module (gaurix packages compat-aliases-260408c)
  #:use-module (guix packages)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages video)
  #:use-module (gnu packages gnome-xyz))

;; AUR name -> Guix package compat aliases (260408c batch)

(define-public vulkan-icd-loader-git
  (package
    (inherit vulkan-loader)
    (name "vulkan-icd-loader-git")))

(define-public bdf-unifont
  (package
    (inherit font-gnu-unifont)
    (name "bdf-unifont")))

(define-public fastfetch-gif-git
  (package
    (inherit fastfetch)
    (name "fastfetch-gif-git")))

(define-public libmpv-git
  (package
    (inherit mpv)
    (name "libmpv-git")))

(define-public yaru-sound-theme
  (package
    (inherit yaru-theme)
    (name "yaru-sound-theme")))

(define-public yaru-gtksourceview-theme
  (package
    (inherit yaru-theme)
    (name "yaru-gtksourceview-theme")))

(define-public yaru-gnome-shell-theme
  (package
    (inherit yaru-theme)
    (name "yaru-gnome-shell-theme")))

(define-public yaru-xfwm4-theme
  (package
    (inherit yaru-theme)
    (name "yaru-xfwm4-theme")))

(define-public yaru-unity-theme
  (package
    (inherit yaru-theme)
    (name "yaru-unity-theme")))

(define-public yaru-metacity-theme
  (package
    (inherit yaru-theme)
    (name "yaru-metacity-theme")))

(define-public yaru-session
  (package
    (inherit yaru-theme)
    (name "yaru-session")))
