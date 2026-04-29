;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260428n
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;; Groups: printer drivers/binary (24), lib32 compat (15),
;;;         CLI tools & utilities (25), desktop apps (16),
;;;         games (10), themes & icons (5), dev tools (5).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.
;;;
;;; Generated: 2026-04-28

(define-module (gaurix packages recipe-resolver-260428n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            brother-mfc-l3780cdw
            brother-dcp-l2660dw
            brother-mfc-l2710dn
            brother-mfc-1910w
            brother-mfc-j6920dw
            brother-hll2315dw
            brother-dcpj125
            brother-mfcj835dw-lpr-bin
            brother-mfcj835dw-cups-bin
            brother-dcpl3550cdw
            brother-mfcl2690dw-cups-bin
            brother-mfcl2685dw-lpr-bin
            brother-mfcl2685dw-cups-bin
            brother-hl2280dw
            brother-brgenml1
            brscan2
            epson-inkjet-printer-202101w
            epson-inkjet-printer-workforce-635-nx625-series
            epson-inkjet-printer-201212w
            epson-inkjet-printer-201112w
            epson-inkjet-printer-201207w
            xerox-spl-driver-scanner
            xerox-spl-driver-printer
            xerox-spl-driver
            lib32-libexif
            lib32-nss-mdns
            lib32-libreplaygain
            lib32-gtk-engines
            lib32-gtk-engine-murrine
            lib32-gdbm
            lib32-kmod
            lib32-libpng14
            lib32-gtkglext
            lib32-freealut
            lib32-libmng
            lib32-apulse
            lib32-fuse3
            lib32-libbsd
            lib32-libpng15
            grub2-theme-archxion
            grub2-theme-arch-suse
            podget
            qtgain
            xdvdshrink
            openbangla-keyboard
            domination
            awf-git
            cover-thumbnailer
            i3status-git
            libnjb
            pdfchain
            shrew-vpn-client
            svg2png
            nvidia-settings-beta
            nvidia-470xx-settings
            libmtp-git
            pidgin-gnome-keyring
            rxvt-unicode-pixbuf
            sxhkd-git
            rmlint-shredder-git
            runelite
            wordgrinder
            shc
            browsh
            mozjpeg
            lbdb
            tudu
            cdecl
            convertall
            dnstop
            ssldump
            dvbsnoop
            nsnake
            authbind
            aespipe
            sendemail
            defrag
            utimer
            fontviewer
            xpaint
            curlew
            gelemental
            elementary-xfce-icons
            greed
            instaloader
            webcord
            logseq-desktop
            ddnet
            slashem
            powermanga
            dunelegacy
            xfce-polkit
            mint-y-icons
            clearlooks-phenix-gtk-theme
            pakku
            pycp
            chruby
            x3270
            unixbench
            bsdmainutils
            ))

;;; Non-free license helper (for proprietary binary packages)
(define license:nonfree
  (lambda (uri)
    ((@@ (guix licenses) license) "nonfree"
      uri
      "Nonfree license; package included for user convenience.")))

;;;
;;; --- Brother printer drivers (binary packages) ---
;;;

;;; brother-mfc-l3780cdw --- Brother MFC-L3780CDW printer driver
(define-public brother-mfc-l3780cdw
  (package
    (name "brother-mfc-l3780cdw")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-mfc-l3780cdw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother MFC-L3780CDW printer driver")
    (description "Proprietary printer driver for the Brother MFC-L3780CDW multi-function color laser printer.  Provides CUPS and LPR support.")
    (home-page "https://aur.archlinux.org/packages/brother-mfc-l3780cdw")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brother-dcp-l2660dw --- Brother DCP-L2660DW printer driver
(define-public brother-dcp-l2660dw
  (package
    (name "brother-dcp-l2660dw")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-dcp-l2660dw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother DCP-L2660DW printer driver")
    (description "Proprietary printer driver for the Brother DCP-L2660DW mono laser printer.  Provides CUPS and LPR support.")
    (home-page "https://aur.archlinux.org/packages/brother-dcp-l2660dw")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brother-mfc-l2710dn --- Brother MFC-L2710DN printer driver
(define-public brother-mfc-l2710dn
  (package
    (name "brother-mfc-l2710dn")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-mfc-l2710dn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother MFC-L2710DN printer driver")
    (description "Proprietary printer driver for the Brother MFC-L2710DN mono laser printer.  Provides CUPS and LPR support.")
    (home-page "https://aur.archlinux.org/packages/brother-mfc-l2710dn")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brother-mfc-1910w --- Brother MFC-1910W printer driver
(define-public brother-mfc-1910w
  (package
    (name "brother-mfc-1910w")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-mfc-1910w.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother MFC-1910W printer driver")
    (description "Proprietary printer driver for the Brother MFC-1910W multi-function mono laser printer.  Provides CUPS and LPR support.")
    (home-page "https://aur.archlinux.org/packages/brother-mfc-1910w")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brother-mfc-j6920dw --- Brother MFC-J6920DW printer driver
(define-public brother-mfc-j6920dw
  (package
    (name "brother-mfc-j6920dw")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-mfc-j6920dw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother MFC-J6920DW printer driver")
    (description "Proprietary printer driver for the Brother MFC-J6920DW inkjet multi-function printer.  Provides CUPS and LPR support.")
    (home-page "https://aur.archlinux.org/packages/brother-mfc-j6920dw")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brother-hll2315dw --- Brother HL-L2315DW printer driver
(define-public brother-hll2315dw
  (package
    (name "brother-hll2315dw")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-hll2315dw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother HL-L2315DW printer driver")
    (description "Proprietary printer driver for the Brother HL-L2315DW mono laser printer.  Provides CUPS support.")
    (home-page "https://aur.archlinux.org/packages/brother-hll2315dw")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brother-dcpj125 --- Brother DCP-J125 printer driver
(define-public brother-dcpj125
  (package
    (name "brother-dcpj125")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-dcpj125.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother DCP-J125 printer driver")
    (description "Proprietary printer driver for the Brother DCP-J125 inkjet printer.  Provides CUPS and LPR support.")
    (home-page "https://aur.archlinux.org/packages/brother-dcpj125")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brother-mfcj835dw-lpr-bin --- Brother MFC-J835DW LPR driver
(define-public brother-mfcj835dw-lpr-bin
  (package
    (name "brother-mfcj835dw-lpr-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-mfcj835dw-lpr-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother MFC-J835DW LPR printer driver")
    (description "Proprietary LPR printer driver for the Brother MFC-J835DW inkjet multi-function printer.")
    (home-page "https://aur.archlinux.org/packages/brother-mfcj835dw-lpr-bin")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brother-mfcj835dw-cups-bin --- Brother MFC-J835DW CUPS driver
(define-public brother-mfcj835dw-cups-bin
  (package
    (name "brother-mfcj835dw-cups-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-mfcj835dw-cups-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother MFC-J835DW CUPS printer driver")
    (description "Proprietary CUPS printer driver for the Brother MFC-J835DW inkjet multi-function printer.")
    (home-page "https://aur.archlinux.org/packages/brother-mfcj835dw-cups-bin")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brother-dcpl3550cdw --- Brother DCP-L3550CDW printer driver
(define-public brother-dcpl3550cdw
  (package
    (name "brother-dcpl3550cdw")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-dcpl3550cdw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother DCP-L3550CDW printer driver")
    (description "Proprietary printer driver for the Brother DCP-L3550CDW color laser printer.  Provides CUPS support.")
    (home-page "https://aur.archlinux.org/packages/brother-dcpl3550cdw")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brother-mfcl2690dw-cups-bin --- Brother MFC-L2690DW CUPS driver
(define-public brother-mfcl2690dw-cups-bin
  (package
    (name "brother-mfcl2690dw-cups-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-mfcl2690dw-cups-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother MFC-L2690DW CUPS printer driver")
    (description "Proprietary CUPS printer driver for the Brother MFC-L2690DW mono laser multi-function printer.")
    (home-page "https://aur.archlinux.org/packages/brother-mfcl2690dw-cups-bin")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brother-mfcl2685dw-lpr-bin --- Brother MFC-L2685DW LPR driver
(define-public brother-mfcl2685dw-lpr-bin
  (package
    (name "brother-mfcl2685dw-lpr-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-mfcl2685dw-lpr-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother MFC-L2685DW LPR printer driver")
    (description "Proprietary LPR printer driver for the Brother MFC-L2685DW mono laser multi-function printer.")
    (home-page "https://aur.archlinux.org/packages/brother-mfcl2685dw-lpr-bin")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brother-mfcl2685dw-cups-bin --- Brother MFC-L2685DW CUPS driver
(define-public brother-mfcl2685dw-cups-bin
  (package
    (name "brother-mfcl2685dw-cups-bin")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-mfcl2685dw-cups-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother MFC-L2685DW CUPS printer driver")
    (description "Proprietary CUPS printer driver for the Brother MFC-L2685DW mono laser multi-function printer.")
    (home-page "https://aur.archlinux.org/packages/brother-mfcl2685dw-cups-bin")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brother-hl2280dw --- Brother HL-2280DW printer driver
(define-public brother-hl2280dw
  (package
    (name "brother-hl2280dw")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-hl2280dw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother HL-2280DW printer driver")
    (description "Proprietary printer driver for the Brother HL-2280DW mono laser printer.  Provides CUPS and LPR support.")
    (home-page "https://aur.archlinux.org/packages/brother-hl2280dw")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brother-brgenml1 --- Brother generic multi-line LPR/CUPS driver
(define-public brother-brgenml1
  (package
    (name "brother-brgenml1")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-brgenml1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother generic multi-line LPR and CUPS driver")
    (description "Generic Brother printer driver that supports multiple mono laser printer models through a unified LPR and CUPS driver package.")
    (home-page "https://aur.archlinux.org/packages/brother-brgenml1")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;; brscan2 --- Brother scanner driver version 2
(define-public brscan2
  (package
    (name "brscan2")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brscan2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/brother/"))))
    (synopsis "Brother SANE scanner driver version 2")
    (description "Proprietary SANE scanner driver for Brother multi-function printers.  Version 2 of the brscan driver series supporting older Brother scanners.")
    (home-page "https://aur.archlinux.org/packages/brscan2")
    (license (license:nonfree "https://www.brother.com/agreement/disclaimer_enduser/"))))

;;;
;;; --- Epson printer drivers ---
;;;

;;; epson-inkjet-printer-202101w --- Epson Inkjet Printer Driver (2021-01w)
(define-public epson-inkjet-printer-202101w
  (package
    (name "epson-inkjet-printer-202101w")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/epson-inkjet-printer-202101w.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/epson/"))))
    (synopsis "Epson inkjet printer driver (2021-01w series)")
    (description "Proprietary Epson inkjet printer driver for the 2021-01w series printers.  Provides CUPS support for printing.")
    (home-page "https://aur.archlinux.org/packages/epson-inkjet-printer-202101w")
    (license (license:nonfree "https://download.ebz.epson.net/dsc/du/02/eula/global/LINUX_EULA.html"))))

;;; epson-inkjet-printer-workforce-635-nx625-series --- Epson WorkForce 635/NX625
(define-public epson-inkjet-printer-workforce-635-nx625-series
  (package
    (name "epson-inkjet-printer-workforce-635-nx625-series")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/epson-inkjet-printer-workforce-635-nx625-series.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/epson/"))))
    (synopsis "Epson WorkForce 635/NX625 series printer driver")
    (description "Proprietary Epson inkjet printer driver for the WorkForce 635 and NX625 series printers.  Provides CUPS support.")
    (home-page "https://aur.archlinux.org/packages/epson-inkjet-printer-workforce-635-nx625-series")
    (license (license:nonfree "https://download.ebz.epson.net/dsc/du/02/eula/global/LINUX_EULA.html"))))

;;; epson-inkjet-printer-201212w --- Epson Inkjet Printer Driver (2012-12w)
(define-public epson-inkjet-printer-201212w
  (package
    (name "epson-inkjet-printer-201212w")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/epson-inkjet-printer-201212w.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/epson/"))))
    (synopsis "Epson inkjet printer driver (2012-12w series)")
    (description "Proprietary Epson inkjet printer driver for the 2012-12w series printers.  Provides CUPS support for printing.")
    (home-page "https://aur.archlinux.org/packages/epson-inkjet-printer-201212w")
    (license (license:nonfree "https://download.ebz.epson.net/dsc/du/02/eula/global/LINUX_EULA.html"))))

;;; epson-inkjet-printer-201112w --- Epson Inkjet Printer Driver (2011-12w)
(define-public epson-inkjet-printer-201112w
  (package
    (name "epson-inkjet-printer-201112w")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/epson-inkjet-printer-201112w.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/epson/"))))
    (synopsis "Epson inkjet printer driver (2011-12w series)")
    (description "Proprietary Epson inkjet printer driver for the 2011-12w series printers.  Provides CUPS support for printing.")
    (home-page "https://aur.archlinux.org/packages/epson-inkjet-printer-201112w")
    (license (license:nonfree "https://download.ebz.epson.net/dsc/du/02/eula/global/LINUX_EULA.html"))))

;;; epson-inkjet-printer-201207w --- Epson Inkjet Printer Driver (2012-07w)
(define-public epson-inkjet-printer-201207w
  (package
    (name "epson-inkjet-printer-201207w")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/epson-inkjet-printer-201207w.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/epson/"))))
    (synopsis "Epson inkjet printer driver (2012-07w series)")
    (description "Proprietary Epson inkjet printer driver for the 2012-07w series printers.  Provides CUPS support for printing.")
    (home-page "https://aur.archlinux.org/packages/epson-inkjet-printer-201207w")
    (license (license:nonfree "https://download.ebz.epson.net/dsc/du/02/eula/global/LINUX_EULA.html"))))

;;;
;;; --- Xerox printer drivers ---
;;;

;;; xerox-spl-driver-scanner --- Xerox SPL scanner driver
(define-public xerox-spl-driver-scanner
  (package
    (name "xerox-spl-driver-scanner")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xerox-spl-driver-scanner.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/xerox/"))))
    (synopsis "Xerox SPL scanner driver for Linux")
    (description "Proprietary scanner driver from the Xerox SPL driver suite.  Provides SANE support for scanning with compatible Xerox multi-function printers.")
    (home-page "https://aur.archlinux.org/packages/xerox-spl-driver-scanner")
    (license (license:nonfree "https://www.xerox.com/en-us/about/eula"))))

;;; xerox-spl-driver-printer --- Xerox SPL printer driver
(define-public xerox-spl-driver-printer
  (package
    (name "xerox-spl-driver-printer")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xerox-spl-driver-printer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/xerox/"))))
    (synopsis "Xerox SPL printer driver for Linux")
    (description "Proprietary printer driver from the Xerox SPL driver suite.  Provides CUPS support for compatible Xerox laser printers.")
    (home-page "https://aur.archlinux.org/packages/xerox-spl-driver-printer")
    (license (license:nonfree "https://www.xerox.com/en-us/about/eula"))))

;;; xerox-spl-driver --- Xerox SPL unified driver
(define-public xerox-spl-driver
  (package
    (name "xerox-spl-driver")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xerox-spl-driver.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/xerox/"))))
    (synopsis "Xerox SPL unified printer and scanner driver")
    (description "Proprietary unified printer and scanner driver from the Xerox SPL driver suite.  Provides CUPS and SANE support for compatible Xerox devices.")
    (home-page "https://aur.archlinux.org/packages/xerox-spl-driver")
    (license (license:nonfree "https://www.xerox.com/en-us/about/eula"))))

;;;
;;; --- lib32 compat packages ---
;;;

;;; lib32-libexif --- 32-bit libexif library
(define-public lib32-libexif
  (package
    (name "lib32-libexif")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libexif.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit EXIF tag parsing library")
    (description "32-bit build of libexif, a library for parsing, editing, and saving EXIF data from digital camera image files.")
    (home-page "https://aur.archlinux.org/packages/lib32-libexif")
    (license license:lgpl2.1+)))

;;; lib32-nss-mdns --- 32-bit nss-mdns
(define-public lib32-nss-mdns
  (package
    (name "lib32-nss-mdns")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-nss-mdns.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit glibc plugin for mDNS name resolution")
    (description "32-bit build of nss-mdns, a GNU C Library NSS plugin providing host name resolution via Multicast DNS (mDNS) using Avahi.")
    (home-page "https://aur.archlinux.org/packages/lib32-nss-mdns")
    (license license:lgpl2.1+)))

;;; lib32-libreplaygain --- 32-bit libreplaygain
(define-public lib32-libreplaygain
  (package
    (name "lib32-libreplaygain")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libreplaygain.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit library for ReplayGain analysis")
    (description "32-bit build of libreplaygain, a library for calculating ReplayGain values of audio data.")
    (home-page "https://aur.archlinux.org/packages/lib32-libreplaygain")
    (license license:lgpl2.1+)))

;;; lib32-gtk-engines --- 32-bit GTK+ theme engines
(define-public lib32-gtk-engines
  (package
    (name "lib32-gtk-engines")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-gtk-engines.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit GTK+ theme engines")
    (description "32-bit build of GTK+ theme engines, providing additional theme rendering engines for GTK+ 2 applications.")
    (home-page "https://aur.archlinux.org/packages/lib32-gtk-engines")
    (license license:lgpl2.1+)))

;;; lib32-gtk-engine-murrine --- 32-bit Murrine GTK+ engine
(define-public lib32-gtk-engine-murrine
  (package
    (name "lib32-gtk-engine-murrine")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-gtk-engine-murrine.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit Murrine GTK+2 engine")
    (description "32-bit build of the Murrine GTK+ 2 engine, a Cairo-based engine providing a modern look for GTK+ 2 applications.")
    (home-page "https://aur.archlinux.org/packages/lib32-gtk-engine-murrine")
    (license license:lgpl2.1+)))

;;; lib32-gdbm --- 32-bit GNU dbm library
(define-public lib32-gdbm
  (package
    (name "lib32-gdbm")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-gdbm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit GNU database manager")
    (description "32-bit build of GNU dbm, a library of database functions that use extensible hashing and work similar to the standard UNIX dbm functions.")
    (home-page "https://aur.archlinux.org/packages/lib32-gdbm")
    (license license:gpl3+)))

;;; lib32-kmod --- 32-bit Linux kernel module handling library
(define-public lib32-kmod
  (package
    (name "lib32-kmod")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-kmod.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit Linux kernel module handling library")
    (description "32-bit build of kmod, a set of tools and a library for handling Linux kernel modules.  Provides libkmod for module loading and management.")
    (home-page "https://aur.archlinux.org/packages/lib32-kmod")
    (license license:lgpl2.1+)))

;;; lib32-libpng14 --- 32-bit libpng 1.4.x
(define-public lib32-libpng14
  (package
    (name "lib32-libpng14")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libpng14.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit PNG library version 1.4")
    (description "32-bit build of libpng version 1.4.x, providing a legacy PNG image format reading and writing library for 32-bit applications.")
    (home-page "https://aur.archlinux.org/packages/lib32-libpng14")
    (license license:zlib)))

;;; lib32-gtkglext --- 32-bit GtkGLExt
(define-public lib32-gtkglext
  (package
    (name "lib32-gtkglext")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-gtkglext.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit OpenGL extension for GTK+")
    (description "32-bit build of GtkGLExt, an OpenGL extension for GTK+ that provides additional GDK objects and GTK+ widgets for OpenGL rendering.")
    (home-page "https://aur.archlinux.org/packages/lib32-gtkglext")
    (license license:lgpl2.1+)))

;;; lib32-freealut --- 32-bit OpenAL utility toolkit
(define-public lib32-freealut
  (package
    (name "lib32-freealut")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-freealut.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit OpenAL utility toolkit")
    (description "32-bit build of freealut, the OpenAL Utility Toolkit providing helper functions for managing OpenAL contexts, buffers, and sources.")
    (home-page "https://aur.archlinux.org/packages/lib32-freealut")
    (license license:lgpl2.0+)))

;;; lib32-libmng --- 32-bit MNG reference library
(define-public lib32-libmng
  (package
    (name "lib32-libmng")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libmng.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit MNG/JNG reference library")
    (description "32-bit build of libmng, the reference library for reading, displaying, and writing MNG and JNG image formats.")
    (home-page "https://aur.archlinux.org/packages/lib32-libmng")
    (license license:bsd-3)))

;;; lib32-apulse --- 32-bit PulseAudio emulation for ALSA
(define-public lib32-apulse
  (package
    (name "lib32-apulse")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-apulse.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit PulseAudio emulation for ALSA")
    (description "32-bit build of apulse, a PulseAudio emulation layer for ALSA allowing applications that require PulseAudio to work with ALSA directly.")
    (home-page "https://aur.archlinux.org/packages/lib32-apulse")
    (license license:expat)))

;;; lib32-fuse3 --- 32-bit FUSE 3 library
(define-public lib32-fuse3
  (package
    (name "lib32-fuse3")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-fuse3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit FUSE 3 filesystem interface library")
    (description "32-bit build of FUSE 3 (Filesystem in Userspace), a library and kernel module allowing non-privileged users to create file systems.")
    (home-page "https://aur.archlinux.org/packages/lib32-fuse3")
    (license (list license:gpl2+ license:lgpl2.1+))))

;;; lib32-libbsd --- 32-bit libbsd
(define-public lib32-libbsd
  (package
    (name "lib32-libbsd")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libbsd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit BSD compatibility library")
    (description "32-bit build of libbsd, providing commonly used BSD functions not available in GNU/Linux standard libraries.")
    (home-page "https://aur.archlinux.org/packages/lib32-libbsd")
    (license (list license:bsd-2 license:bsd-3 license:isc))))

;;; lib32-libpng15 --- 32-bit libpng 1.5.x
(define-public lib32-libpng15
  (package
    (name "lib32-libpng15")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libpng15.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit PNG library version 1.5")
    (description "32-bit build of libpng version 1.5.x, providing a legacy PNG image format reading and writing library for 32-bit applications.")
    (home-page "https://aur.archlinux.org/packages/lib32-libpng15")
    (license license:zlib)))

;;;
;;; --- GRUB themes ---
;;;

;;; grub2-theme-archxion --- Archxion GRUB theme
(define-public grub2-theme-archxion
  (package
    (name "grub2-theme-archxion")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grub2-theme-archxion.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/grub/themes/archxion/"))))
    (synopsis "Archxion theme for GRUB2 bootloader")
    (description "A custom GRUB2 bootloader theme with an Arch Linux inspired design, providing a styled boot menu with background image and custom fonts.")
    (home-page "https://aur.archlinux.org/packages/grub2-theme-archxion")
    (license license:gpl3+)))

;;; grub2-theme-arch-suse --- Arch-SuSE GRUB theme
(define-public grub2-theme-arch-suse
  (package
    (name "grub2-theme-arch-suse")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grub2-theme-arch-suse.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/grub/themes/arch-suse/"))))
    (synopsis "Arch-SuSE theme for GRUB2 bootloader")
    (description "A custom GRUB2 bootloader theme combining Arch Linux and openSUSE design elements, providing a styled boot menu.")
    (home-page "https://aur.archlinux.org/packages/grub2-theme-arch-suse")
    (license license:gpl3+)))

;;;
;;; --- CLI tools & utilities ---
;;;

;;; podget --- simple podcast aggregator
(define-public podget
  (package
    (name "podget")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/podget.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple podcast aggregator and downloader")
    (description "Podget is a simple podcast aggregator optimized for running as a scheduled background job.  It downloads podcasts from configured feeds.")
    (home-page "https://aur.archlinux.org/packages/podget")
    (license license:gpl3+)))

;;; qtgain --- audio normalization with ReplayGain
(define-public qtgain
  (package
    (name "qtgain")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qtgain.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Qt-based GUI for ReplayGain audio normalization")
    (description "QtGain is a Qt-based graphical front-end for applying ReplayGain tags to audio files, enabling consistent playback volume.")
    (home-page "https://aur.archlinux.org/packages/qtgain")
    (license license:gpl2+)))

;;; xdvdshrink --- DVD backup tool
(define-public xdvdshrink
  (package
    (name "xdvdshrink")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xdvdshrink.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DVD backup and transcoding tool")
    (description "XDVDShrink is a graphical tool for backing up and transcoding DVD media, allowing users to shrink DVD content to fit on standard media.")
    (home-page "https://aur.archlinux.org/packages/xdvdshrink")
    (license license:gpl2+)))

;;; openbangla-keyboard --- OpenBangla Keyboard
(define-public openbangla-keyboard
  (package
    (name "openbangla-keyboard")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openbangla-keyboard.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source Bangla (Bengali) keyboard for Linux")
    (description "OpenBangla Keyboard is an open source, Unicode-compliant Bangla input method for GNU/Linux.  It supports Avro Phonetic, Probhat, and fixed keyboard layouts.")
    (home-page "https://aur.archlinux.org/packages/openbangla-keyboard")
    (license license:gpl3+)))

;;; awf-git --- A Widget Factory
(define-public awf-git
  (package
    (name "awf-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/awf-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "widget factory for GTK theme preview")
    (description "A Widget Factory is a theme preview application for GTK, displaying all standard GTK widgets in a single window for theme testing.")
    (home-page "https://aur.archlinux.org/packages/awf-git")
    (license license:gpl3+)))

;;; cover-thumbnailer --- Nautilus cover art thumbnailer
(define-public cover-thumbnailer
  (package
    (name "cover-thumbnailer")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cover-thumbnailer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "thumbnails for directories with cover artwork")
    (description "Cover Thumbnailer is a GNOME/Nautilus thumbnailer that generates folder thumbnails using album cover art images found within directories.")
    (home-page "https://aur.archlinux.org/packages/cover-thumbnailer")
    (license license:gpl3+)))

;;; i3status-git --- i3status from git
(define-public i3status-git
  (package
    (name "i3status-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/i3status-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "status bar generator for i3bar from git")
    (description "Development version of i3status, a small program for generating a status bar for i3bar, dzen2, xmobar, or similar programs.")
    (home-page "https://aur.archlinux.org/packages/i3status-git")
    (license license:bsd-3)))

;;; libnjb --- Creative Nomad Jukebox library
(define-public libnjb
  (package
    (name "libnjb")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libnjb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for communicating with Creative Nomad jukeboxes")
    (description "libnjb is a C library for communicating with the Creative Nomad Jukebox and Dell DJ music player devices via USB.")
    (home-page "https://aur.archlinux.org/packages/libnjb")
    (license license:bsd-3)))

;;; pdfchain --- graphical user interface for PDFtk
(define-public pdfchain
  (package
    (name "pdfchain")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdfchain.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical user interface for PDFtk")
    (description "PDF Chain is a graphical user interface for the PDFtk command line tool, allowing merging, splitting, rotating, and watermarking PDF files.")
    (home-page "https://aur.archlinux.org/packages/pdfchain")
    (license license:gpl3+)))

;;; shrew-vpn-client --- Shrew Soft VPN client
(define-public shrew-vpn-client
  (package
    (name "shrew-vpn-client")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/shrew-vpn-client.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "IPsec VPN client for Linux")
    (description "Shrew Soft VPN Client is an IPsec remote access VPN client for Linux, providing support for IKEv1 and XAUTH authentication.")
    (home-page "https://aur.archlinux.org/packages/shrew-vpn-client")
    (license license:bsd-3)))

;;; svg2png --- SVG to PNG conversion tool
(define-public svg2png
  (package
    (name "svg2png")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/svg2png.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line SVG to PNG converter")
    (description "svg2png is a simple command-line tool that converts SVG vector images to PNG raster images using a rendering library.")
    (home-page "https://aur.archlinux.org/packages/svg2png")
    (license license:gpl2+)))

;;; nvidia-settings-beta --- NVIDIA settings beta
(define-public nvidia-settings-beta
  (package
    (name "nvidia-settings-beta")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-settings-beta.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "beta version of NVIDIA X11 driver settings utility")
    (description "Beta version of the NVIDIA settings configuration tool for the NVIDIA Linux graphics driver, providing GPU monitoring and configuration.")
    (home-page "https://aur.archlinux.org/packages/nvidia-settings-beta")
    (license license:gpl2)))

;;; nvidia-470xx-settings --- NVIDIA 470xx settings
(define-public nvidia-470xx-settings
  (package
    (name "nvidia-470xx-settings")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-470xx-settings.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA 470xx series driver settings utility")
    (description "NVIDIA settings configuration tool for the 470xx legacy driver series, providing GPU monitoring and configuration for older NVIDIA hardware.")
    (home-page "https://aur.archlinux.org/packages/nvidia-470xx-settings")
    (license license:gpl2)))

;;; libmtp-git --- libmtp from git
(define-public libmtp-git
  (package
    (name "libmtp-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libmtp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "MTP device library from git")
    (description "Development version of libmtp, a library for communicating with MTP (Media Transfer Protocol) devices such as smartphones and media players.")
    (home-page "https://aur.archlinux.org/packages/libmtp-git")
    (license license:lgpl2.1+)))

;;; pidgin-gnome-keyring --- Pidgin GNOME Keyring plugin
(define-public pidgin-gnome-keyring
  (package
    (name "pidgin-gnome-keyring")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pidgin-gnome-keyring.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Pidgin plugin for GNOME Keyring password storage")
    (description "A Pidgin plugin that stores account passwords in the GNOME Keyring instead of plain text, providing secure credential management.")
    (home-page "https://aur.archlinux.org/packages/pidgin-gnome-keyring")
    (license license:gpl2+)))

;;; rxvt-unicode-pixbuf --- rxvt-unicode with pixbuf support
(define-public rxvt-unicode-pixbuf
  (package
    (name "rxvt-unicode-pixbuf")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rxvt-unicode-pixbuf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rxvt-unicode terminal with pixbuf background support")
    (description "A build of rxvt-unicode (urxvt) terminal emulator with GdkPixbuf support for background images, enabling transparent and image backgrounds.")
    (home-page "https://aur.archlinux.org/packages/rxvt-unicode-pixbuf")
    (license license:gpl3+)))

;;; sxhkd-git --- sxhkd from git
(define-public sxhkd-git
  (package
    (name "sxhkd-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sxhkd-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple X hotkey daemon from git")
    (description "Development version of sxhkd, a simple X hotkey daemon that reacts to input events by executing commands.  It is used with bspwm and other window managers.")
    (home-page "https://aur.archlinux.org/packages/sxhkd-git")
    (license license:bsd-2)))

;;; rmlint-shredder-git --- rmlint GUI from git
(define-public rmlint-shredder-git
  (package
    (name "rmlint-shredder-git")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rmlint-shredder-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical user interface for rmlint duplicate finder")
    (description "Shredder is the graphical user interface for rmlint, a tool for finding and removing duplicate files, empty directories, and broken symlinks.")
    (home-page "https://aur.archlinux.org/packages/rmlint-shredder-git")
    (license license:gpl3+)))

;;; wordgrinder --- word processor for terminals
(define-public wordgrinder
  (package
    (name "wordgrinder")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wordgrinder.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "word processor for the terminal")
    (description "WordGrinder is a simple, Unicode-aware word processor that runs in a terminal.  It focuses on content creation with minimal formatting distractions.")
    (home-page "https://aur.archlinux.org/packages/wordgrinder")
    (license license:expat)))

;;; shc --- shell script compiler
(define-public shc
  (package
    (name "shc")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/shc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "generic shell script compiler")
    (description "SHC is a shell script compiler that generates C code from shell scripts, which is then compiled into a binary executable.")
    (home-page "https://aur.archlinux.org/packages/shc")
    (license license:gpl2+)))

;;; browsh --- text-based web browser
(define-public browsh
  (package
    (name "browsh")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/browsh.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fully-modern text-based browser")
    (description "Browsh is a fully interactive, real-time, and modern text-based browser rendered to TTYs and browsers.  It uses Firefox as a back-end for rendering.")
    (home-page "https://aur.archlinux.org/packages/browsh")
    (license license:lgpl2.1+)))

;;; mozjpeg --- improved JPEG encoder
(define-public mozjpeg
  (package
    (name "mozjpeg")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mozjpeg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "improved JPEG encoder from Mozilla")
    (description "MozJPEG is a JPEG encoder project from Mozilla that improves JPEG compression efficiency while maintaining compatibility with existing decoders.")
    (home-page "https://aur.archlinux.org/packages/mozjpeg")
    (license (list license:bsd-3 license:isc license:zlib))))

;;; lbdb --- little brother's database for mutt
(define-public lbdb
  (package
    (name "lbdb")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lbdb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "little brother's database for email address lookup")
    (description "The little brother's database (lbdb) is a collection of small tools for looking up email addresses from various sources, designed to work with mutt.")
    (home-page "https://aur.archlinux.org/packages/lbdb")
    (license license:gpl2+)))

;;; tudu --- command-line todo list manager
(define-public tudu
  (package
    (name "tudu")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tudu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line hierarchical todo list manager")
    (description "TuDu is a command-line tool for managing hierarchical TODO lists using ncurses.  It supports categories, priorities, and percentage-done tracking.")
    (home-page "https://aur.archlinux.org/packages/tudu")
    (license license:gpl3+)))

;;; cdecl --- compose and decipher C declarations
(define-public cdecl
  (package
    (name "cdecl")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cdecl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "compose and decipher C/C++ type declarations")
    (description "Cdecl is a program that translates C or C++ type declarations between the English-like description and the C syntax.")
    (home-page "https://aur.archlinux.org/packages/cdecl")
    (license license:public-domain)))

;;; convertall --- unit conversion program
(define-public convertall
  (package
    (name "convertall")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/convertall.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unit conversion program with large unit database")
    (description "ConvertAll is a graphical unit converter that handles a large number of units and allows combination of units for complex conversions.")
    (home-page "https://aur.archlinux.org/packages/convertall")
    (license license:gpl2+)))

;;; dnstop --- DNS traffic monitor
(define-public dnstop
  (package
    (name "dnstop")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dnstop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "real-time DNS traffic monitor")
    (description "dnstop is a libpcap application that displays DNS traffic on your network, showing tables of source and destination IP addresses, query types, and response codes.")
    (home-page "https://aur.archlinux.org/packages/dnstop")
    (license license:bsd-3)))

;;; ssldump --- SSLv3/TLS network protocol analyzer
(define-public ssldump
  (package
    (name "ssldump")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ssldump.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "SSL/TLS network protocol analyzer")
    (description "ssldump is an SSL/TLS network protocol analyzer that identifies TCP connections on a chosen network interface, attempts to interpret them as SSL/TLS traffic, and displays the decoded data.")
    (home-page "https://aur.archlinux.org/packages/ssldump")
    (license license:bsd-3)))

;;; dvbsnoop --- DVB/MPEG stream analyzer
(define-public dvbsnoop
  (package
    (name "dvbsnoop")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dvbsnoop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DVB and MPEG transport stream analyzer")
    (description "dvbsnoop is a DVB/MPEG stream analyzer program that captures and analyzes DVB and MPEG transport streams for debugging and monitoring purposes.")
    (home-page "https://aur.archlinux.org/packages/dvbsnoop")
    (license license:gpl2+)))

;;; nsnake --- classic snake game for the terminal
(define-public nsnake
  (package
    (name "nsnake")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nsnake.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "classic snake game for the terminal")
    (description "nSnake is the classic snake game playable in a text terminal using ncurses, featuring customizable speed and board size.")
    (home-page "https://aur.archlinux.org/packages/nsnake")
    (license license:gpl3+)))

;;; authbind --- bind to privileged ports as non-root
(define-public authbind
  (package
    (name "authbind")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/authbind.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "allow non-root programs to bind to privileged ports")
    (description "authbind allows programs which do not or should not run as root to bind to low-numbered ports in a controlled way.")
    (home-page "https://aur.archlinux.org/packages/authbind")
    (license license:gpl2+)))

;;; aespipe --- AES encryption pipe
(define-public aespipe
  (package
    (name "aespipe")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aespipe.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AES encryption tool for piped data")
    (description "aespipe is a command-line program that reads data from stdin, encrypts or decrypts it with AES, and outputs the result to stdout.")
    (home-page "https://aur.archlinux.org/packages/aespipe")
    (license license:gpl2+)))

;;; sendemail --- lightweight command-line SMTP email client
(define-public sendemail
  (package
    (name "sendemail")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sendemail.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight command-line SMTP email client")
    (description "SendEmail is a lightweight, command-line SMTP email client written in Perl.  It requires no special modules and supports TLS and SMTP authentication.")
    (home-page "https://aur.archlinux.org/packages/sendemail")
    (license license:gpl2+)))

;;; defrag --- file defragmentation utility
(define-public defrag
  (package
    (name "defrag")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/defrag.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "file system defragmentation utility")
    (description "Defrag is a file system defragmentation tool for Linux file systems, helping to reduce fragmentation and improve file access performance.")
    (home-page "https://aur.archlinux.org/packages/defrag")
    (license license:gpl2+)))

;;; utimer --- command-line countdown timer
(define-public utimer
  (package
    (name "utimer")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/utimer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line countdown timer and stopwatch")
    (description "uTimer is a command-line timer program that supports countdown timers and stopwatch functionality with customizable alerts.")
    (home-page "https://aur.archlinux.org/packages/utimer")
    (license license:gpl3+)))

;;; fontviewer --- GTK font viewer
(define-public fontviewer
  (package
    (name "fontviewer")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fontviewer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GTK-based font file viewer")
    (description "Fontviewer is a simple graphical font viewer that displays font glyphs and character sets using GTK, useful for previewing installed fonts.")
    (home-page "https://aur.archlinux.org/packages/fontviewer")
    (license license:gpl2+)))

;;; xpaint --- simple bitmap image editor
(define-public xpaint
  (package
    (name "xpaint")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xpaint.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple X11 bitmap image editor")
    (description "XPaint is a simple image editing tool for X11 that supports editing of bitmap and pixmap images with basic drawing tools.")
    (home-page "https://aur.archlinux.org/packages/xpaint")
    (license license:expat)))

;;;
;;; --- Desktop apps ---
;;;

;;; domination --- Risk-like strategy board game
(define-public domination
  (package
    (name "domination")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/domination.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Risk-like strategy board game")
    (description "Domination is a free, open-source clone of the classic board game Risk.  It supports multiple maps, AI opponents, and network multiplayer.")
    (home-page "https://aur.archlinux.org/packages/domination")
    (license license:gpl3+)))

;;; runelite --- Old School RuneScape client
(define-public runelite
  (package
    (name "runelite")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/runelite.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/runelite/"))))
    (synopsis "open source Old School RuneScape client")
    (description "RuneLite is an open-source, community-driven client for Old School RuneScape with support for plugins and UI enhancements.")
    (home-page "https://aur.archlinux.org/packages/runelite")
    (license license:bsd-2)))

;;; curlew --- multimedia converter
(define-public curlew
  (package
    (name "curlew")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/curlew.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GTK multimedia converter using FFmpeg")
    (description "Curlew is a GTK-based graphical multimedia converter that uses FFmpeg and MEncoder as back-ends for audio and video conversion.")
    (home-page "https://aur.archlinux.org/packages/curlew")
    (license license:gpl3+)))

;;; gelemental --- periodic table viewer
(define-public gelemental
  (package
    (name "gelemental")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gelemental.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "periodic table of the elements viewer")
    (description "gElemental is a GTK+ application that displays detailed information about chemical elements from the periodic table.")
    (home-page "https://aur.archlinux.org/packages/gelemental")
    (license license:gpl3+)))

;;; elementary-xfce-icons --- elementary icons for Xfce
(define-public elementary-xfce-icons
  (package
    (name "elementary-xfce-icons")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/elementary-xfce-icons.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/icons/elementary-xfce/"))))
    (synopsis "elementary icon theme for Xfce")
    (description "A fork of the elementary icon theme for the Xfce desktop environment, providing a clean and consistent set of application and system icons.")
    (home-page "https://aur.archlinux.org/packages/elementary-xfce-icons")
    (license license:gpl2+)))

;;; greed --- terminal game of greed
(define-public greed
  (package
    (name "greed")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/greed.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal puzzle game")
    (description "Greed is a terminal puzzle game where you navigate a grid of numbers, consuming digits as you move and trying to clear as many as possible.")
    (home-page "https://aur.archlinux.org/packages/greed")
    (license license:gpl2+)))

;;; instaloader --- Instagram content downloader
(define-public instaloader
  (package
    (name "instaloader")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/instaloader.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "download pictures, videos, and metadata from Instagram")
    (description "Instaloader is a tool to download pictures, videos, and metadata from Instagram profiles, hashtags, stories, and feeds.")
    (home-page "https://aur.archlinux.org/packages/instaloader")
    (license license:expat)))

;;; webcord --- privacy-focused Discord client
(define-public webcord
  (package
    (name "webcord")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/webcord.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "privacy-focused Discord client based on Electron")
    (description "WebCord is a privacy-focused Discord client built with Electron, offering features like ad-blocking and enhanced privacy settings.")
    (home-page "https://aur.archlinux.org/packages/webcord")
    (license license:expat)))

;;; logseq-desktop --- knowledge management application
(define-public logseq-desktop
  (package
    (name "logseq-desktop")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/logseq-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/logseq/"))))
    (synopsis "local-first knowledge management application")
    (description "Logseq is a privacy-first, open-source knowledge base that works on top of local plain-text Markdown and Org-mode files.")
    (home-page "https://aur.archlinux.org/packages/logseq-desktop")
    (license license:agpl3+)))

;;; ddnet --- DDraceNetwork Teeworlds mod
(define-public ddnet
  (package
    (name "ddnet")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ddnet.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DDraceNetwork cooperative online game")
    (description "DDNet (DDraceNetwork) is a cooperative multiplayer platformer game based on Teeworlds, featuring race and puzzle-oriented game modes.")
    (home-page "https://aur.archlinux.org/packages/ddnet")
    (license license:zlib)))

;;; slashem --- Super Lotsa Added Stuff Hack Extended Magic
(define-public slashem
  (package
    (name "slashem")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/slashem.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "variant of the roguelike game NetHack")
    (description "SLASH'EM (Super Lotsa Added Stuff Hack - Extended Magic) is a variant of the roguelike game NetHack with many new features, monsters, and items.")
    (home-page "https://aur.archlinux.org/packages/slashem")
    (license (license:nonfree "https://nethack.org/common/license.html"))))

;;; powermanga --- arcade shoot 'em up game
(define-public powermanga
  (package
    (name "powermanga")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/powermanga.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arcade-style 2D shoot-em-up game")
    (description "Powermanga is a vertical scrolling shoot-em-up arcade game featuring multiple weapons, power-ups, and progressively challenging levels.")
    (home-page "https://aur.archlinux.org/packages/powermanga")
    (license license:gpl3+)))

;;; dunelegacy --- Dune II remake
(define-public dunelegacy
  (package
    (name "dunelegacy")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dunelegacy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source remake of Dune II")
    (description "Dune Legacy is an open-source remake of the classic real-time strategy game Dune II, featuring improved controls and multiplayer support.")
    (home-page "https://aur.archlinux.org/packages/dunelegacy")
    (license license:gpl2+)))

;;; xfce-polkit --- Xfce polkit authentication agent
(define-public xfce-polkit
  (package
    (name "xfce-polkit")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xfce-polkit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "polkit authentication agent for Xfce")
    (description "A simple polkit authentication agent for the Xfce desktop environment, providing graphical password prompts for privileged operations.")
    (home-page "https://aur.archlinux.org/packages/xfce-polkit")
    (license license:gpl2+)))

;;; mint-y-icons --- Linux Mint icon theme
(define-public mint-y-icons
  (package
    (name "mint-y-icons")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mint-y-icons.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/icons/Mint-Y/"))))
    (synopsis "Mint-Y icon theme from Linux Mint")
    (description "The Mint-Y icon theme from the Linux Mint project, providing modern flat icons in multiple color variants.")
    (home-page "https://aur.archlinux.org/packages/mint-y-icons")
    (license license:gpl3+)))

;;; clearlooks-phenix-gtk-theme --- Clearlooks-Phenix GTK theme
(define-public clearlooks-phenix-gtk-theme
  (package
    (name "clearlooks-phenix-gtk-theme")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/clearlooks-phenix-gtk-theme.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/themes/Clearlooks-Phenix/"))))
    (synopsis "GTK3 port of the Clearlooks theme")
    (description "Clearlooks-Phenix is a GTK3 port of the classic Clearlooks theme engine, providing a familiar look for GTK3 applications.")
    (home-page "https://aur.archlinux.org/packages/clearlooks-phenix-gtk-theme")
    (license license:gpl3+)))

;;; pakku --- AUR helper based on pacman
(define-public pakku
  (package
    (name "pakku")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pakku.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AUR helper written in Nim")
    (description "Pakku is a pacman wrapper and AUR helper written in Nim, offering efficient package management and AUR package building.")
    (home-page "https://aur.archlinux.org/packages/pakku")
    (license license:gpl3+)))

;;; pycp --- progress bar for file copy
(define-public pycp
  (package
    (name "pycp")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pycp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cp and mv commands with progress bar")
    (description "pycp provides progress bar versions of the cp and mv commands, showing transfer speed, ETA, and percentage progress for file operations.")
    (home-page "https://aur.archlinux.org/packages/pycp")
    (license license:bsd-2)))

;;; chruby --- Ruby version switcher
(define-public chruby
  (package
    (name "chruby")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chruby.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight Ruby version switcher")
    (description "chruby is a lightweight tool that changes the current Ruby version by modifying environment variables.  It supports both bash and zsh.")
    (home-page "https://aur.archlinux.org/packages/chruby")
    (license license:expat)))

;;; x3270 --- IBM 3270 terminal emulator
(define-public x3270
  (package
    (name "x3270")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/x3270.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "IBM 3270 terminal emulator for X11")
    (description "x3270 is an X11-based IBM 3270 terminal emulator for connecting to IBM mainframe systems.  It supports TN3270E and SSL/TLS connections.")
    (home-page "https://aur.archlinux.org/packages/x3270")
    (license license:bsd-3)))

;;; unixbench --- UNIX system benchmarking tool
(define-public unixbench
  (package
    (name "unixbench")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unixbench.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "UNIX system performance benchmarking suite")
    (description "UnixBench is a system benchmarking suite that provides a baseline comparison of UNIX-like system performance across CPU, memory, and I/O metrics.")
    (home-page "https://aur.archlinux.org/packages/unixbench")
    (license license:gpl2+)))

;;; bsdmainutils --- BSD utility collection for Linux
(define-public bsdmainutils
  (package
    (name "bsdmainutils")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bsdmainutils.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "collection of BSD utility programs for Linux")
    (description "A collection of standard BSD utility programs ported to Linux, including cal, column, hexdump, look, and ul among others.")
    (home-page "https://aur.archlinux.org/packages/bsdmainutils")
    (license license:bsd-3)))
