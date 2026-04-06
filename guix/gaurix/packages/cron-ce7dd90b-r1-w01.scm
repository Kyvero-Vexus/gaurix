;;; Guix compat alias + recipe definitions for cron-ce7dd90b run 1.
;;; Queue drain: 100 packages from todo_general_packages.org
;;; Date: 2026-04-04
(define-module (gaurix packages cron-ce7dd90b-r1-w01)
  #:use-module (guix packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages dotnet)
  #:use-module (gnu packages emulators)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnome-xyz)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages music)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages sync)
  #:use-module (gnu packages syncthing)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages video)
  #:use-module (gnu packages wordnet)
  #:use-module (gnu packages xorg)
  #:export (
            helm-synth
            helm-synth-common
            helm-synth-lv2
            helm-synth-standalone
            helm-synth-vst
            gtk4-git
            xwayland-satellite-nosystemd
            dolphin-emu-nogui-git
            dolphin-emu-tool-git
            lem-editor-git
            lib32-unixodbc
            ddcci-driver-linux-dkms
            radicle-node-bin
            rclone-appmenu
            ffmpeg-cuda
            syncthing-appmenu
            flite-voices
            wordnet-common
            wordnet-progs
            wordnet-dictd
            lib32-faudio
            archivemount-ng
            mono-basic
            gocryptfs-ui
            restic-browser-bin
            python2-gamin
            gpaste-menu
))

(define-public helm-synth helm)

(define-public helm-synth-common helm)

(define-public helm-synth-lv2 helm)

(define-public helm-synth-standalone helm)

(define-public helm-synth-vst helm)

(define-public gtk4-git gtk)

(define-public xwayland-satellite-nosystemd xwayland-satellite)

(define-public dolphin-emu-nogui-git dolphin-emu)

(define-public dolphin-emu-tool-git dolphin-emu)

(define-public lem-editor-git lem)

(define-public lib32-unixodbc unixodbc)

(define-public ddcci-driver-linux-dkms ddcci-driver-linux)

(define-public radicle-node-bin radicle)

(define-public rclone-appmenu rclone)

(define-public ffmpeg-cuda ffmpeg)

(define-public syncthing-appmenu syncthing)

(define-public flite-voices flite)

(define-public wordnet-common wordnet)

(define-public wordnet-progs wordnet)

(define-public wordnet-dictd wordnet)

(define-public lib32-faudio faudio)

(define-public archivemount-ng archivemount)

(define-public mono-basic mono)

(define-public gocryptfs-ui gocryptfs)

(define-public restic-browser-bin restic)

(define-public python2-gamin gamin)

(define-public gpaste-menu gpaste)

