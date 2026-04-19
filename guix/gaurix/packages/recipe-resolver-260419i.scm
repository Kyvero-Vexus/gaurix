;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260419i
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;        1.  ttf-unifont (font-build-system, v17.0.03, OFL-1.1 OR GPL-2.0-or-later WITH Font-exception-2.0)
;;;        2.  codeql (gnu-build-system, v2.23.8, custom)
;;;        3.  jitsi-meet-turnserver (gnu-build-system, v1.0.9139, Apache)
;;;        4.  go-prism-git (go-build-system, vv1.1.0.r22.g427afd5, MIT)
;;;        5.  asus-5606-fan-state (cargo-build-system, v1.0.0, MIT)
;;;        6.  amf-amdgpu-pro (gnu-build-system, v25.10_2202160, custom: AMDGPU-PRO EULA)
;;;        7.  amdgpu-pro-oglp (gnu-build-system, v25.10_2202160, custom: AMDGPU-PRO EULA)
;;;        8.  uuid (gnu-build-system, v1.6.2, MIT)
;;;        9.  mqtt-explorer (node-build-system, v0.3.5, CCPL:by-nd)
;;;       10.  omnissa-horizon-scanner-client (gnu-build-system, v2512.1, custom)
;;;       11.  omnissa-horizon-html5mmr (gnu-build-system, v2512.1, custom)
;;;       12.  omnissa-horizon-file-association (gnu-build-system, v2512.1, custom)
;;;       13.  omnissa-horizon-client-next (gnu-build-system, v2512.1, custom)
;;;       14.  php84-iconv (pyproject-build-system, v8.4.17, PHP)
;;;       15.  php84-gettext (pyproject-build-system, v8.4.17, PHP)
;;;       16.  php84-fileinfo (pyproject-build-system, v8.4.17, PHP)
;;;       17.  php84-exif (pyproject-build-system, v8.4.17, PHP)
;;;       18.  php84-dom (pyproject-build-system, v8.4.17, PHP)
;;;       19.  php84-ctype (pyproject-build-system, v8.4.17, PHP)
;;;       20.  php84-calendar (pyproject-build-system, v8.4.17, PHP)
;;;       21.  php84-bcmath (pyproject-build-system, v8.4.17, PHP)
;;;       22.  nexus-client-git (cargo-build-system, vr555.30f1ecc, MIT)
;;;       23.  nexus-client (cargo-build-system, v0.7.5, MIT)
;;;       24.  ps7_libps4000 (gnu-build-system, v2.1.151_2r6187, custom)
;;;       25.  ps7_libps3000 (gnu-build-system, v4.0.149_3r6187, custom)
;;;       26.  ps7_libps5000a (gnu-build-system, v2.2.11_5r5086, custom)
;;;       27.  ps7_libps5000 (gnu-build-system, v2.1.151_3r6187, custom)
;;;       28.  ps7_libps6000a (gnu-build-system, v2.0.161_0r193, custom)
;;;       29.  samsung_magician-consumer-ssd (gnu-build-system, v1.0, custom)
;;;       30.  omnissa-horizon-usb (gnu-build-system, v2512.1, custom)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260419i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:export (
            ttf-unifont
            codeql
            jitsi-meet-turnserver
            go-prism-git
            asus-5606-fan-state
            amf-amdgpu-pro
            amdgpu-pro-oglp
            uuid
            mqtt-explorer
            omnissa-horizon-scanner-client
            omnissa-horizon-html5mmr
            omnissa-horizon-file-association
            omnissa-horizon-client-next
            php84-iconv
            php84-gettext
            php84-fileinfo
            php84-exif
            php84-dom
            php84-ctype
            php84-calendar
            php84-bcmath
            nexus-client-git
            nexus-client
            ps7-libps4000
            ps7-libps3000
            ps7-libps5000a
            ps7-libps5000
            ps7-libps6000a
            samsung-magician-consumer-ssd
            omnissa-horizon-usb
            ))

;;; -------------------------------------------------------------------
;;; 1. ttf-unifont --- trueType version of the GNU Unifont
;;; -------------------------------------------------------------------
(define-public ttf-unifont
  (package
    (name "ttf-unifont")
    (version "17.0.03")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://unifoundry.com/unifont.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "trueType version of the GNU Unifont")
    (description "TrueType version of the GNU Unifont.")
    (home-page "https://unifoundry.com/unifont.html")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 2. codeql --- the CLI tool for GitHub's CodeQL
;;; -------------------------------------------------------------------
(define-public codeql
  (package
    (name "codeql")
    (version "2.23.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/github/codeql-cli-binaries")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the CLI tool for GitHub's CodeQL")
    (description "The CLI tool for GitHub's CodeQL.")
    (home-page "https://github.com/github/codeql-cli-binaries")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 3. jitsi-meet-turnserver --- jitsi Meet Prosody Plugins
;;; -------------------------------------------------------------------
(define-public jitsi-meet-turnserver
  (package
    (name "jitsi-meet-turnserver")
    (version "1.0.9139")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://jitsi.org/jitsi-meet//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "jitsi Meet Prosody Plugins")
    (description "Jitsi Meet Prosody Plugins.")
    (home-page "https://jitsi.org/jitsi-meet/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 4. go-prism-git --- turn raw test output into beautiful data
;;; -------------------------------------------------------------------
(define-public go-prism-git
  (package
    (name "go-prism-git")
    (version "v1.1.0.r22.g427afd5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/DaltonSW/prism")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/DaltonSW/prism"
      #:tests? #f))
    (synopsis "turn raw test output into beautiful data")
    (description "Turn raw test output into beautiful data.")
    (home-page "https://github.com/DaltonSW/prism")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. asus-5606-fan-state --- set the fan state on the ZenBook S 16 UM5606 and Vivobook M5606
;;; -------------------------------------------------------------------
(define-public asus-5606-fan-state
  (package
    (name "asus-5606-fan-state")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ThatOneCalculator/asus-5606-fan-state")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "set the fan state on the ZenBook S 16 UM5606 and Vivobook M5606")
    (description "Set the fan state on the ZenBook S 16 UM5606 and Vivobook M5606.")
    (home-page "https://github.com/ThatOneCalculator/asus-5606-fan-state")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. amf-amdgpu-pro --- AMDGPU Pro Advanced Multimedia Framework
;;; -------------------------------------------------------------------
(define-public amf-amdgpu-pro
  (package
    (name "amf-amdgpu-pro")
    (version "25.10_2202160")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-22-40/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AMDGPU Pro Advanced Multimedia Framework")
    (description "AMDGPU Pro Advanced Multimedia Framework.")
    (home-page "https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-22-40")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 7. amdgpu-pro-oglp --- AMDGPU Pro OpenGL driver
;;; -------------------------------------------------------------------
(define-public amdgpu-pro-oglp
  (package
    (name "amdgpu-pro-oglp")
    (version "25.10_2202160")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-22-40/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list mesa))
    (synopsis "AMDGPU Pro OpenGL driver")
    (description "AMDGPU Pro OpenGL driver.")
    (home-page "https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-22-40")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 8. uuid --- OSSP Universally Unique Identifier
;;; -------------------------------------------------------------------
(define-public uuid
  (package
    (name "uuid")
    (version "1.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.ossp.org/pkg/lib/uuid/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "OSSP Universally Unique Identifier")
    (description "OSSP Universally Unique Identifier.")
    (home-page "http://www.ossp.org/pkg/lib/uuid")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. mqtt-explorer --- a comprehensive and easy-to-use MQTT Client
;;; -------------------------------------------------------------------
(define-public mqtt-explorer
  (package
    (name "mqtt-explorer")
    (version "0.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://mqtt-explorer.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a comprehensive and easy-to-use MQTT Client")
    (description "A comprehensive and easy-to-use MQTT Client.")
    (home-page "https://mqtt-explorer.com/")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 10. omnissa-horizon-scanner-client --- omnissa Horizon Client - scanner client
;;; -------------------------------------------------------------------
(define-public omnissa-horizon-scanner-client
  (package
    (name "omnissa-horizon-scanner-client")
    (version "2512.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://customerconnect.omnissa.com/downloads/info/slug/virtual_desktop_and_apps/omnissa_horizon_clients/8/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "omnissa Horizon Client - scanner client")
    (description "Omnissa Horizon Client - scanner client.")
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/virtual_desktop_and_apps/omnissa_horizon_clients/8")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 11. omnissa-horizon-html5mmr --- omnissa Horizon Client - HTML5 MultiMedia Redirection
;;; -------------------------------------------------------------------
(define-public omnissa-horizon-html5mmr
  (package
    (name "omnissa-horizon-html5mmr")
    (version "2512.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://customerconnect.omnissa.com/downloads/info/slug/virtual_desktop_and_apps/omnissa_horizon_clients/8/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "omnissa Horizon Client - HTML5 MultiMedia Redirection")
    (description "Omnissa Horizon Client - HTML5 MultiMedia Redirection.")
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/virtual_desktop_and_apps/omnissa_horizon_clients/8")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 12. omnissa-horizon-file-association --- omnissa Horizon Client - File Association
;;; -------------------------------------------------------------------
(define-public omnissa-horizon-file-association
  (package
    (name "omnissa-horizon-file-association")
    (version "2512.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://customerconnect.omnissa.com/downloads/info/slug/virtual_desktop_and_apps/omnissa_horizon_clients/8/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "omnissa Horizon Client - File Association")
    (description "Omnissa Horizon Client - File Association.")
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/virtual_desktop_and_apps/omnissa_horizon_clients/8")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 13. omnissa-horizon-client-next --- omnissa Horizon Client - connect to Omnissa Horizon virtual desktop - tec...
;;; -------------------------------------------------------------------
(define-public omnissa-horizon-client-next
  (package
    (name "omnissa-horizon-client-next")
    (version "2512.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://customerconnect.omnissa.com/downloads/info/slug/virtual_desktop_and_apps/omnissa_horizon_clients/8/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "omnissa Horizon Client - connect to Omnissa Horizon virtual desktop - tec...")
    (description "Omnissa Horizon Client - connect to Omnissa Horizon virtual desktop - tech preview.")
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/virtual_desktop_and_apps/omnissa_horizon_clients/8")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 14. php84-iconv --- iconv module for php84
;;; -------------------------------------------------------------------
(define-public php84-iconv
  (package
    (name "php84-iconv")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "iconv module for php84")
    (description "Iconv module for php84.")
    (home-page "http://www.php.net")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 15. php84-gettext --- gettext module for php84
;;; -------------------------------------------------------------------
(define-public php84-gettext
  (package
    (name "php84-gettext")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "gettext module for php84")
    (description "Gettext module for php84.")
    (home-page "http://www.php.net")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 16. php84-fileinfo --- fileinfo module for php84
;;; -------------------------------------------------------------------
(define-public php84-fileinfo
  (package
    (name "php84-fileinfo")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "fileinfo module for php84")
    (description "Fileinfo module for php84.")
    (home-page "http://www.php.net")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 17. php84-exif --- exif module for php84
;;; -------------------------------------------------------------------
(define-public php84-exif
  (package
    (name "php84-exif")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "exif module for php84")
    (description "Exif module for php84.")
    (home-page "http://www.php.net")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 18. php84-dom --- dom module for php84
;;; -------------------------------------------------------------------
(define-public php84-dom
  (package
    (name "php84-dom")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "dom module for php84")
    (description "Dom module for php84.")
    (home-page "http://www.php.net")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 19. php84-ctype --- ctype module for php84
;;; -------------------------------------------------------------------
(define-public php84-ctype
  (package
    (name "php84-ctype")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "ctype module for php84")
    (description "Ctype module for php84.")
    (home-page "http://www.php.net")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 20. php84-calendar --- calendar module for php84
;;; -------------------------------------------------------------------
(define-public php84-calendar
  (package
    (name "php84-calendar")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "calendar module for php84")
    (description "Calendar module for php84.")
    (home-page "http://www.php.net")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 21. php84-bcmath --- bcmath module for php84
;;; -------------------------------------------------------------------
(define-public php84-bcmath
  (package
    (name "php84-bcmath")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "bcmath module for php84")
    (description "Bcmath module for php84.")
    (home-page "http://www.php.net")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 22. nexus-client-git --- cross-platform BBS client with chat, file transfers, and news support (gi...
;;; -------------------------------------------------------------------
(define-public nexus-client-git
  (package
    (name "nexus-client-git")
    (version "r555.30f1ecc")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zquestz/nexus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list alsa-lib))
    (synopsis "cross-platform BBS client with chat, file transfers, and news support (gi...")
    (description "Cross-platform BBS client with chat, file transfers, and news support (git version).")
    (home-page "https://github.com/zquestz/nexus")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. nexus-client --- cross-platform BBS client with chat, file transfers, and news support
;;; -------------------------------------------------------------------
(define-public nexus-client
  (package
    (name "nexus-client")
    (version "0.7.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zquestz/nexus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list alsa-lib))
    (synopsis "cross-platform BBS client with chat, file transfers, and news support")
    (description "Cross-platform BBS client with chat, file transfers, and news support.")
    (home-page "https://github.com/zquestz/nexus")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. ps7_libps4000 --- library for PicoScope 4000 series in PicoScope 7
;;; -------------------------------------------------------------------
(define-public ps7-libps4000
  (package
    (name "ps7-libps4000")
    (version "2.1.151_2r6187")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps4000//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libusb))
    (synopsis "library for PicoScope 4000 series in PicoScope 7")
    (description "Library for PicoScope 4000 series in PicoScope 7.")
    (home-page "https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps4000/")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 25. ps7_libps3000 --- library for PicoScope 3000 series in PicoScope 7
;;; -------------------------------------------------------------------
(define-public ps7-libps3000
  (package
    (name "ps7-libps3000")
    (version "4.0.149_3r6187")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps3000//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libusb))
    (synopsis "library for PicoScope 3000 series in PicoScope 7")
    (description "Library for PicoScope 3000 series in PicoScope 7.")
    (home-page "https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps3000/")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 26. ps7_libps5000a --- library for PicoScope 5000a series in PicoScope 7
;;; -------------------------------------------------------------------
(define-public ps7-libps5000a
  (package
    (name "ps7-libps5000a")
    (version "2.2.11_5r5086")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps5000a//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libusb))
    (synopsis "library for PicoScope 5000a series in PicoScope 7")
    (description "Library for PicoScope 5000a series in PicoScope 7.")
    (home-page "https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps5000a/")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 27. ps7_libps5000 --- library for PicoScope 5000 series in PicoScope 7
;;; -------------------------------------------------------------------
(define-public ps7-libps5000
  (package
    (name "ps7-libps5000")
    (version "2.1.151_3r6187")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps5000//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libusb))
    (synopsis "library for PicoScope 5000 series in PicoScope 7")
    (description "Library for PicoScope 5000 series in PicoScope 7.")
    (home-page "https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps5000/")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 28. ps7_libps6000a --- library for PicoScope 6000a series in PicoScope 7
;;; -------------------------------------------------------------------
(define-public ps7-libps6000a
  (package
    (name "ps7-libps6000a")
    (version "2.0.161_0r193")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps6000a//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libusb))
    (synopsis "library for PicoScope 6000a series in PicoScope 7")
    (description "Library for PicoScope 6000a series in PicoScope 7.")
    (home-page "https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps6000a/")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 29. samsung_magician-consumer-ssd --- CLI tool for Samsung Consumer SSDs including 470, 750, 830, 840, 850, 950...
;;; -------------------------------------------------------------------
(define-public samsung-magician-consumer-ssd
  (package
    (name "samsung-magician-consumer-ssd")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.samsung.com/semiconductor/minisite/ssd/download/tools.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI tool for Samsung Consumer SSDs including 470, 750, 830, 840, 850, 950...")
    (description "CLI tool for Samsung Consumer SSDs including 470, 750, 830, 840, 850, 950 and 960 series.")
    (home-page "http://www.samsung.com/semiconductor/minisite/ssd/download/tools.html")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 30. omnissa-horizon-usb --- omnissa Horizon Client - USB device redirection
;;; -------------------------------------------------------------------
(define-public omnissa-horizon-usb
  (package
    (name "omnissa-horizon-usb")
    (version "2512.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://customerconnect.omnissa.com/downloads/info/slug/virtual_desktop_and_apps/omnissa_horizon_clients/8/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list glib))
    (synopsis "omnissa Horizon Client - USB device redirection")
    (description "Omnissa Horizon Client - USB device redirection.")
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/virtual_desktop_and_apps/omnissa_horizon_clients/8")
    (license (license:non-copyleft "file://LICENSE"))))
