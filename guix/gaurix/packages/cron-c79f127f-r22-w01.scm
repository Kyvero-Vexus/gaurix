;;; Round-22 resolution for blocked-tree run cron-c79f127f worker w01.
;;; 3 new recipes: ttf-meslo-nerd-font-powerlevel10k, vpcs, qtutilities-qt6
(define-module (gaurix packages cron-c79f127f-r22-w01)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages ninja)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (ttf-meslo-nerd-font-powerlevel10k
            vpcs
            qtutilities-qt6))

;;;
;;; 1. ttf-meslo-nerd-font-powerlevel10k — Meslo Nerd Font patched for Powerlevel10k
;;;
(define-public ttf-meslo-nerd-font-powerlevel10k
  (package
    (name "ttf-meslo-nerd-font-powerlevel10k")
    (version "2.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/romkatv/powerlevel10k-media/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0ivy63a6w7sywwjldnzgznrwwzl9lb2f7mj1imyi65wqnryylj05"))))
    (build-system copy-build-system)
    (arguments
     '(#:install-plan
       '(("." "share/fonts/truetype/" #:include-regexp ("\\.ttf$")))))
    (home-page "https://github.com/romkatv/powerlevel10k-media")
    (synopsis "Meslo Nerd Font patched for Powerlevel10k")
    (description
     "MesloLGS NF is a patched version of Meslo Nerd Font, recommended for use
with the Powerlevel10k Zsh theme.  It includes all glyphs needed by the theme.")
    (license license:asl2.0)))

;;;
;;; 2. vpcs — Virtual PC Simulator for GNS3
;;;
(define-public vpcs
  (package
    (name "vpcs")
    (version "0.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/GNS3/vpcs/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "19rxlfqf58kqdfgl0kq1xnmvpfmknxxqgx6xfryvv2yv7y98q0bk"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                       ;no test suite
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda _
              (chdir "src")
              (invoke "make" "-f" "Makefile.linux")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (man1 (string-append out "/share/man/man1")))
                (install-file "vpcs" bin)
                (chdir "..")
                (install-file "man/vpcs.1" man1)))))))
    (home-page "https://github.com/GNS3/vpcs")
    (synopsis "Virtual PC simulator for network emulation")
    (description
     "VPCS (Virtual PC Simulator) simulates lightweight PCs for use in network
emulation environments such as GNS3 and Dynamips.  Each virtual PC supports
basic networking commands like ping, traceroute, and DHCP.")
    (license license:bsd-2)))

;;;
;;; 3. qtutilities-qt6 — Qt utilities library (Qt6 build)
;;;
(define-public qtutilities-qt6
  (package
    (name "qtutilities-qt6")
    (version "6.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Martchus/qtutilities/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1lxly6zikikya7ssh37na8ll073pm80c1jddwi4sk0vybcvb42xp"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-DQT_PACKAGE_PREFIX=Qt6"
              (string-append "-Dcpp-utilities_DIR="
                             #$(this-package-input "cpp-utilities")
                             "/lib/cmake/c++utilities"))
      #:tests? #f))                     ;no test suite in source
    (inputs
     (list cpp-utilities qtbase-6 libx11))
    (native-inputs
     (list ninja qttools-6))
    (home-page "https://github.com/Martchus/qtutilities")
    (synopsis "Common Qt-related C++ classes and routines")
    (description
     "The qtutilities library provides common Qt-related C++ classes and
routines used by other projects from Martchus, such as Syncthing Tray and
Tag Editor.  It includes widgets, models, and utility functions.")
    (license license:gpl2+)))
