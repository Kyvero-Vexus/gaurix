(define-module (gaurix packages queue-20260321p100)
  #:use-module (guix packages)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages games)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages suckless)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xdisorg)
  #:export (
            ioquake3-git
            lyx-bin
            plasma-mobile-git
            gromit-mpx-git
            rofi-calc-git
            bcachefs-tools-git
            pokerth-bin
            wlrctl-git
            matterbridge-git
            tabbed-git
            peek-bin
            ))

(define-public ioquake3-git
  (package
    (inherit ioquake3)
    (name "ioquake3-git")))

(define-public lyx-bin
  (package
    (inherit lyx)
    (name "lyx-bin")))

(define-public plasma-mobile-git
  (package
    (inherit plasma-mobile)
    (name "plasma-mobile-git")))

(define-public gromit-mpx-git
  (package
    (inherit gromit-mpx)
    (name "gromit-mpx-git")))

(define-public rofi-calc-git
  (package
    (inherit rofi-calc)
    (name "rofi-calc-git")))

(define-public bcachefs-tools-git
  (package
    (inherit bcachefs-tools)
    (name "bcachefs-tools-git")))

(define-public pokerth-bin
  (package
    (inherit pokerth)
    (name "pokerth-bin")))

(define-public wlrctl-git
  (package
    (inherit wlrctl)
    (name "wlrctl-git")))

(define-public matterbridge-git
  (package
    (inherit matterbridge)
    (name "matterbridge-git")))

(define-public tabbed-git
  (package
    (inherit tabbed)
    (name "tabbed-git")))

(define-public peek-bin
  (package
    (inherit peek)
    (name "peek-bin")))

