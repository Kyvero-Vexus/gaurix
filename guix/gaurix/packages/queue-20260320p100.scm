(define-module (gaurix packages queue-20260320p100)
  #:use-module (guix packages)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages games)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages freedesktop)
  #:export (
            xpadneo-dkms
            cmatrix-git
            mksh-bin
            xdg-desktop-portal-hyprland-git
            ))

(define-public xpadneo-dkms
  (package
    (inherit xpadneo)
    (name "xpadneo-dkms")))

(define-public cmatrix-git
  (package
    (inherit cmatrix)
    (name "cmatrix-git")))

(define-public mksh-bin
  (package
    (inherit mksh)
    (name "mksh-bin")))

(define-public xdg-desktop-portal-hyprland-git
  (package
    (inherit xdg-desktop-portal-hyprland)
    (name "xdg-desktop-portal-hyprland-git")))
