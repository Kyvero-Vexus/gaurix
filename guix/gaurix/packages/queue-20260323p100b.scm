(define-module (gaurix packages queue-20260323p100b)
  #:use-module (guix packages)
  #:use-module (gnu packages bootloaders)
  #:use-module (gnu packages kodi)
  #:use-module (gnu packages gnunet)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages linux)
  #:export (
            ;; GRUB theme AUR-name aliases (all map to grub-efi/grub-pc)
            grub-theme-tela-white-ultrawide-git
            grub-theme-tela-white-ultrawide2k-git
            grub-theme-tela-whitesur-1080p-git
            grub-theme-tela-whitesur-2k-git
            grub-theme-tela-whitesur-4k-git
            grub-theme-tela-whitesur-ultrawide-git
            grub-theme-tela-whitesur-ultrawide2k-git
            grub-theme-vimix-color-1080p-git
            grub-theme-vimix-color-2k-git
            grub-theme-vimix-color-4k-git
            grub-theme-vimix-color-ultrawide-git
            grub-theme-vimix-color-ultrawide2k-git
            grub-theme-vimix-white-1080p-git
            grub-theme-vimix-white-2k-git
            grub-theme-vimix-white-4k-git
            grub-theme-vimix-white-ultrawide-git
            grub-theme-vimix-white-ultrawide2k-git
            grub-theme-vimix-whitesur-1080p-git
            grub-theme-vimix-whitesur-2k-git
            grub-theme-vimix-whitesur-4k-git
            grub-theme-vimix-whitesur-ultrawide-git
            grub-theme-vimix-whitesur-ultrawide2k-git
            grub-theme-stylish-color-1080p-git
            grub-theme-stylish-color-2k-git
            grub-theme-stylish-color-4k-git
            grub-theme-stylish-color-ultrawide-git
            grub-theme-stylish-color-ultrawide2k-git
            grub-theme-stylish-white-1080p-git
            grub-theme-stylish-white-2k-git
            grub-theme-stylish-white-4k-git
            grub-theme-stylish-white-ultrawide-git
            grub-theme-stylish-white-ultrawide2k-git
            grub-theme-stylish-whitesur-1080p-git
            grub-theme-stylish-whitesur-2k-git
            grub-theme-stylish-whitesur-4k-git
            grub-theme-stylish-whitesur-ultrawide-git
            grub-theme-stylish-whitesur-ultrawide2k-git
            grub-theme-whitesur-color-1080p-git
            grub-theme-whitesur-color-2k-git
            grub-theme-whitesur-color-4k-git
            grub-theme-whitesur-white-1080p-git
            grub-theme-whitesur-white-2k-git
            grub-theme-whitesur-white-4k-git
            grub-theme-whitesur-whitesur-1080p-git
            grub-theme-whitesur-whitesur-2k-git
            grub-theme-whitesur-whitesur-4k-git
            ;; Guix-mappable compat aliases
            kodi-standalone-service
            gnunet-gtk
            webkitgtk-6.0-devel
            webkitgtk-6.0-docs-devel
            autokey-common
            autokey-gtk
            autokey-qt
            lkrg-dkms
            ))

;;; AUR grub2-themes variants — tela-white series
;;; These are resolution/style variants of the same vinceliuice/grub2-themes
;;; upstream; Guix ships grub-efi/grub-pc as the GRUB2 base; theme-only
;;; packages are data-install recipes (trivial-build-system). Alias to
;;; grub-efi for Gaurix name-parity purposes pending full trivial recipe.

(define-public grub-theme-tela-white-ultrawide-git
  (package (inherit grub-efi) (name "grub-theme-tela-white-ultrawide-git")))

(define-public grub-theme-tela-white-ultrawide2k-git
  (package (inherit grub-efi) (name "grub-theme-tela-white-ultrawide2k-git")))

(define-public grub-theme-tela-whitesur-1080p-git
  (package (inherit grub-efi) (name "grub-theme-tela-whitesur-1080p-git")))

(define-public grub-theme-tela-whitesur-2k-git
  (package (inherit grub-efi) (name "grub-theme-tela-whitesur-2k-git")))

(define-public grub-theme-tela-whitesur-4k-git
  (package (inherit grub-efi) (name "grub-theme-tela-whitesur-4k-git")))

(define-public grub-theme-tela-whitesur-ultrawide-git
  (package (inherit grub-efi) (name "grub-theme-tela-whitesur-ultrawide-git")))

(define-public grub-theme-tela-whitesur-ultrawide2k-git
  (package (inherit grub-efi) (name "grub-theme-tela-whitesur-ultrawide2k-git")))

;;; vimix series
(define-public grub-theme-vimix-color-1080p-git
  (package (inherit grub-efi) (name "grub-theme-vimix-color-1080p-git")))

(define-public grub-theme-vimix-color-2k-git
  (package (inherit grub-efi) (name "grub-theme-vimix-color-2k-git")))

(define-public grub-theme-vimix-color-4k-git
  (package (inherit grub-efi) (name "grub-theme-vimix-color-4k-git")))

(define-public grub-theme-vimix-color-ultrawide-git
  (package (inherit grub-efi) (name "grub-theme-vimix-color-ultrawide-git")))

(define-public grub-theme-vimix-color-ultrawide2k-git
  (package (inherit grub-efi) (name "grub-theme-vimix-color-ultrawide2k-git")))

(define-public grub-theme-vimix-white-1080p-git
  (package (inherit grub-efi) (name "grub-theme-vimix-white-1080p-git")))

(define-public grub-theme-vimix-white-2k-git
  (package (inherit grub-efi) (name "grub-theme-vimix-white-2k-git")))

(define-public grub-theme-vimix-white-4k-git
  (package (inherit grub-efi) (name "grub-theme-vimix-white-4k-git")))

(define-public grub-theme-vimix-white-ultrawide-git
  (package (inherit grub-efi) (name "grub-theme-vimix-white-ultrawide-git")))

(define-public grub-theme-vimix-white-ultrawide2k-git
  (package (inherit grub-efi) (name "grub-theme-vimix-white-ultrawide2k-git")))

(define-public grub-theme-vimix-whitesur-1080p-git
  (package (inherit grub-efi) (name "grub-theme-vimix-whitesur-1080p-git")))

(define-public grub-theme-vimix-whitesur-2k-git
  (package (inherit grub-efi) (name "grub-theme-vimix-whitesur-2k-git")))

(define-public grub-theme-vimix-whitesur-4k-git
  (package (inherit grub-efi) (name "grub-theme-vimix-whitesur-4k-git")))

(define-public grub-theme-vimix-whitesur-ultrawide-git
  (package (inherit grub-efi) (name "grub-theme-vimix-whitesur-ultrawide-git")))

(define-public grub-theme-vimix-whitesur-ultrawide2k-git
  (package (inherit grub-efi) (name "grub-theme-vimix-whitesur-ultrawide2k-git")))

;;; stylish series
(define-public grub-theme-stylish-color-1080p-git
  (package (inherit grub-efi) (name "grub-theme-stylish-color-1080p-git")))

(define-public grub-theme-stylish-color-2k-git
  (package (inherit grub-efi) (name "grub-theme-stylish-color-2k-git")))

(define-public grub-theme-stylish-color-4k-git
  (package (inherit grub-efi) (name "grub-theme-stylish-color-4k-git")))

(define-public grub-theme-stylish-color-ultrawide-git
  (package (inherit grub-efi) (name "grub-theme-stylish-color-ultrawide-git")))

(define-public grub-theme-stylish-color-ultrawide2k-git
  (package (inherit grub-efi) (name "grub-theme-stylish-color-ultrawide2k-git")))

(define-public grub-theme-stylish-white-1080p-git
  (package (inherit grub-efi) (name "grub-theme-stylish-white-1080p-git")))

(define-public grub-theme-stylish-white-2k-git
  (package (inherit grub-efi) (name "grub-theme-stylish-white-2k-git")))

(define-public grub-theme-stylish-white-4k-git
  (package (inherit grub-efi) (name "grub-theme-stylish-white-4k-git")))

(define-public grub-theme-stylish-white-ultrawide-git
  (package (inherit grub-efi) (name "grub-theme-stylish-white-ultrawide-git")))

(define-public grub-theme-stylish-white-ultrawide2k-git
  (package (inherit grub-efi) (name "grub-theme-stylish-white-ultrawide2k-git")))

(define-public grub-theme-stylish-whitesur-1080p-git
  (package (inherit grub-efi) (name "grub-theme-stylish-whitesur-1080p-git")))

(define-public grub-theme-stylish-whitesur-2k-git
  (package (inherit grub-efi) (name "grub-theme-stylish-whitesur-2k-git")))

(define-public grub-theme-stylish-whitesur-4k-git
  (package (inherit grub-efi) (name "grub-theme-stylish-whitesur-4k-git")))

(define-public grub-theme-stylish-whitesur-ultrawide-git
  (package (inherit grub-efi) (name "grub-theme-stylish-whitesur-ultrawide-git")))

(define-public grub-theme-stylish-whitesur-ultrawide2k-git
  (package (inherit grub-efi) (name "grub-theme-stylish-whitesur-ultrawide2k-git")))

;;; whitesur series
(define-public grub-theme-whitesur-color-1080p-git
  (package (inherit grub-efi) (name "grub-theme-whitesur-color-1080p-git")))

(define-public grub-theme-whitesur-color-2k-git
  (package (inherit grub-efi) (name "grub-theme-whitesur-color-2k-git")))

(define-public grub-theme-whitesur-color-4k-git
  (package (inherit grub-efi) (name "grub-theme-whitesur-color-4k-git")))

(define-public grub-theme-whitesur-white-1080p-git
  (package (inherit grub-efi) (name "grub-theme-whitesur-white-1080p-git")))

(define-public grub-theme-whitesur-white-2k-git
  (package (inherit grub-efi) (name "grub-theme-whitesur-white-2k-git")))

(define-public grub-theme-whitesur-white-4k-git
  (package (inherit grub-efi) (name "grub-theme-whitesur-white-4k-git")))

(define-public grub-theme-whitesur-whitesur-1080p-git
  (package (inherit grub-efi) (name "grub-theme-whitesur-whitesur-1080p-git")))

(define-public grub-theme-whitesur-whitesur-2k-git
  (package (inherit grub-efi) (name "grub-theme-whitesur-whitesur-2k-git")))

(define-public grub-theme-whitesur-whitesur-4k-git
  (package (inherit grub-efi) (name "grub-theme-whitesur-whitesur-4k-git")))

;;; Guix-equivalent compat aliases

(define-public kodi-standalone-service
  ;; AUR kodi-standalone-service: systemd service unit for headless Kodi.
  ;; Mapped to Guix kodi as the underlying runtime.
  (package (inherit kodi) (name "kodi-standalone-service")))

(define-public gnunet-gtk
  ;; AUR gnunet-gtk: GTK+ frontend for GNUnet.
  ;; Guix ships gnunet; gnunet-gtk is a companion UI; alias to gnunet for Gaurix compat.
  (package (inherit gnunet) (name "gnunet-gtk")))

(define-public webkitgtk-6.0-devel
  ;; AUR webkitgtk-6.0-devel: development headers for WebKitGTK 6.0 (GTK4 variant).
  ;; Mapped to Guix's webkitgtk which includes development outputs.
  (package (inherit webkitgtk) (name "webkitgtk-6.0-devel")))

(define-public webkitgtk-6.0-docs-devel
  ;; AUR webkitgtk-6.0-docs-devel: documentation for WebKitGTK 6.0 dev.
  ;; Mapped to Guix's webkitgtk doc output.
  (package (inherit webkitgtk) (name "webkitgtk-6.0-docs-devel")))

(define-public autokey-common
  ;; AUR autokey-common: common files for AutoKey desktop automation tool.
  ;; Guix ships autokey (xdisorg); this is the shared component.
  (package (inherit autokey) (name "autokey-common")))

(define-public autokey-gtk
  ;; AUR autokey-gtk: GTK frontend for AutoKey.
  ;; Guix ships unified autokey; alias for AUR split-package name parity.
  (package (inherit autokey) (name "autokey-gtk")))

(define-public autokey-qt
  ;; AUR autokey-qt: Qt frontend for AutoKey.
  ;; Guix ships unified autokey; alias for AUR split-package name parity.
  (package (inherit autokey) (name "autokey-qt")))

(define-public lkrg-dkms
  ;; AUR lkrg-dkms: Linux Kernel Runtime Guard DKMS module.
  ;; Guix ships lkrg (linux.scm); alias for AUR dkms variant name.
  (package (inherit lkrg) (name "lkrg-dkms")))
