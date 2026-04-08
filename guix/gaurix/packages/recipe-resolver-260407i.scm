;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260407i
;;; Resolves 24 packages from queue entries #10653–#10822:
;;;   binary CLI tools, fonts, source builds, firmware, scripts/themes.

(define-module (gaurix packages recipe-resolver-260407i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:export (antidot-bin
            copilot-cli-bin
            homeassistant-osagent-bin
            symfony-cli-bin
            doppler-cli-bin
            pat-bin
            vopono-bin
            ttc-monocraft
            ttf-sil-lateef
            beanstalkd
            fzy
            librelp
            flxmlrpc
            zd1211-firmware
            ebook2cw
            qrq
            demorse
            xdemorse
            bluetooth-headset-battery-level
            edl
            layan-gtk-theme
            numix-frost-themes
            cfs-zen-tweaks
            gpaste-menu))

;;;
;;; ── 1. antidot-bin ───────────────────────────────────────────────────
;;; Cleans up your $HOME from dotfiles
;;;
(define-public antidot-bin
  (package
    (name "antidot-bin")
    (version "0.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/doron-cohen/antidot/releases/download/v"
             version "/antidot_" version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "1p6vwqn1yybrgkc0nhg5x74wnq821axdfrp85gddl7ysw96qxgv9"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("antidot" "bin/antidot"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/doron-cohen/antidot")
    (synopsis "cleans up your $HOME from dotfiles")
    (description
     "Antidot cleans up your @code{$HOME} directory by moving dotfiles
and dotdirs into sensible locations following the XDG Base Directory
specification.")
    (license license:expat)))

;;;
;;; ── 2. copilot-cli-bin ───────────────────────────────────────────────
;;; AWS Copilot CLI for containerized applications
;;;
(define-public copilot-cli-bin
  (package
    (name "copilot-cli-bin")
    (version "1.34.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/aws/copilot-cli/releases/download/v"
             version "/copilot_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "14rxg635v1z2805fpjnhc5d4s8iibhkjzvajd1ysmhmyadsjvgb2"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("copilot" "bin/copilot"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/aws/copilot-cli")
    (synopsis "toolkit for containerized applications on AWS")
    (description
     "AWS Copilot CLI helps developers build, release, and operate
production-ready containerized applications on AWS App Runner,
Amazon ECS, and AWS Fargate.")
    (license license:asl2.0)))

;;;
;;; ── 3. homeassistant-osagent-bin ─────────────────────────────────────
;;; Home Assistant OS Agent
;;;
(define-public homeassistant-osagent-bin
  (package
    (name "homeassistant-osagent-bin")
    (version "1.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/home-assistant/os-agent/releases/download/"
             version "/os-agent_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "1bfdr78qxnrwrqkqq07d5filjj241fnsr65wr1q88ljp4l805i4r"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("os-agent" "bin/os-agent"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/home-assistant/os-agent")
    (synopsis "Home Assistant OS agent for D-Bus communication")
    (description
     "Home Assistant OS Agent provides a D-Bus interface for communication
between the host OS and Home Assistant.  It handles system information,
network management, and OS updates.")
    (license license:asl2.0)))

;;;
;;; ── 4. symfony-cli-bin ───────────────────────────────────────────────
;;; Symfony CLI for managing Symfony applications
;;;
(define-public symfony-cli-bin
  (package
    (name "symfony-cli-bin")
    (version "5.17.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/symfony-cli/symfony-cli/releases/download/v"
             version "/symfony-cli_linux_amd64.tar.gz"))
       (sha256
        (base32 "0kig1ms0b57jjcxs2z03vz3rbv8r46hrhqphfpr98yj257h2cv2j"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("symfony" "bin/symfony"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/symfony-cli/symfony-cli")
    (synopsis "Symfony CLI to create and manage applications")
    (description
     "The Symfony CLI helps developers create, run locally, and deploy
Symfony applications.  It includes a local web server with TLS support
and tight integration with Symfony Cloud.")
    (license license:agpl3)))

;;;
;;; ── 5. doppler-cli-bin ───────────────────────────────────────────────
;;; CLI for Doppler secrets manager
;;;
(define-public doppler-cli-bin
  (package
    (name "doppler-cli-bin")
    (version "3.75.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/DopplerHQ/cli/releases/download/"
             version "/doppler_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "1nyhh804mwsbsp8irwl5nd38347sladm8ac30inz1zyg6bfhr14w"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("doppler" "bin/doppler"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DopplerHQ/cli")
    (synopsis "CLI for Doppler environment and secrets manager")
    (description
     "The Doppler CLI provides access to Doppler's secrets management
platform from the command line.  Inject secrets into applications and
manage configurations across environments.")
    (license license:asl2.0)))

;;;
;;; ── 6. pat-bin ───────────────────────────────────────────────────────
;;; Modern Winlink client for amateur radio
;;;
(define-public pat-bin
  (package
    (name "pat-bin")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/la5nta/pat/releases/download/v"
             version "/pat_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0dg3m5xmihd09fzc0vj5h6f3ca1kch1m7hrfc2imgi9rvc6b8bhr"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("pat" "bin/pat"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://getpat.io")
    (synopsis "modern cross-platform Winlink client for amateur radio")
    (description
     "Pat is a cross-platform Winlink client written in Go.  It supports
multiple transports including telnet, AX.25, ARDOP, VARA, and Pactor
for sending and receiving Winlink email.")
    (license license:expat)))

;;;
;;; ── 7. vopono-bin ────────────────────────────────────────────────────
;;; Run applications through VPN in network namespaces
;;;
(define-public vopono-bin
  (package
    (name "vopono-bin")
    (version "0.10.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jamesmcm/vopono/releases/download/"
             version "/vopono_" version "_linux_x86-64_musl"))
       (sha256
        (base32 "08zjlsaddskxx7dvxz2gx256jccircm2c7rccck9cihmv1amws35"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/vopono"))
            (chmod (string-append bin "/vopono") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jamesmcm/vopono")
    (synopsis "run applications through VPN in network namespaces")
    (description
     "Vopono runs applications through VPN connections in separate network
namespaces.  Supports OpenVPN, Wireguard, and multiple VPN providers
out of the box.")
    (license license:gpl3+)))

;;;
;;; ── 8. ttc-monocraft ─────────────────────────────────────────────────
;;; Minecraft-inspired programming font
;;;
(define-public ttc-monocraft
  (package
    (name "ttc-monocraft")
    (version "4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/IdreesInc/Monocraft/releases/download/v"
             version "/Monocraft.ttc"))
       (sha256
        (base32 "0aqciffy5xnmcwqbdz7ync5g047lpjirc7cff6sylh4ggpyya728"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (dir (string-append out "/share/fonts/truetype"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p dir)
            (copy-file src (string-append dir "/Monocraft.ttc"))
            #t))))
    (home-page "https://github.com/IdreesInc/Monocraft")
    (synopsis "programming font based on Minecraft typeface")
    (description
     "Monocraft is a monospaced programming font inspired by the typeface
used in the Minecraft video game.  Each glyph is designed to feel at home
in a pixel-art aesthetic while remaining readable for coding.")
    (license license:silofl1.1)))

;;;
;;; ── 9. ttf-sil-lateef ────────────────────────────────────────────────
;;; Arabic script font by SIL International
;;;
(define-public ttf-sil-lateef
  (package
    (name "ttf-sil-lateef")
    (version "4.400")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/silnrsi/font-lateef/releases/download/v"
             version "/Lateef-" version ".tar.xz"))
       (sha256
        (base32 "1ck7l6yzjl0yxy2zdz4bgrx0hcqd0cvv4z681w6rwzymbsq9r55j"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype"
           #:include-regexp (".*\\.ttf$")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (home-page "https://software.sil.org/lateef/")
    (synopsis "Arabic script font for Sindhi and related languages")
    (description
     "Lateef is a Unicode font for the Arabic script, designed primarily
for use by languages of southern Asia such as Sindhi and Urdu.  It
provides a Nastaliq-like style of Arabic script.")
    (license license:silofl1.1)))

;;;
;;; ── 10. beanstalkd ───────────────────────────────────────────────────
;;; Fast, simple work queue server
;;;
(define-public beanstalkd
  (package
    (name "beanstalkd")
    (version "1.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/kr/beanstalkd/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0qsjkrgfi6ir2mh8f93jd03yzcnq5hpn2s6ri8pis0d7q36jsa96"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://beanstalkd.github.io/")
    (synopsis "fast, general-purpose work queue server")
    (description
     "Beanstalkd is a simple, fast work queue.  Its interface is generic,
but was originally designed for reducing the latency of page views in
high-volume web applications by running time-consuming tasks
asynchronously.")
    (license license:expat)))

;;;
;;; ── 11. fzy ──────────────────────────────────────────────────────────
;;; Fast fuzzy text selector for the terminal
;;;
(define-public fzy
  (package
    (name "fzy")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jhawthorn/fzy/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0kpz1a4ilga4jp6ii5v07z1rw0jaf2lhhknsdcn3n1n7qvch1lwk"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))
      #:tests? #f))
    (home-page "https://github.com/jhawthorn/fzy")
    (synopsis "fast fuzzy text selector for the terminal")
    (description
     "Fzy is a fast, simple fuzzy text selector for the terminal with an
advanced scoring algorithm.  It is designed as a drop-in replacement
for selecta with significantly better performance.")
    (license license:expat)))

;;;
;;; ── 12. librelp ──────────────────────────────────────────────────────
;;; Reliable Event Logging Protocol library
;;;
(define-public librelp
  (package
    (name "librelp")
    (version "1.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rsyslog/librelp/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0wnxnzyrkq3mh94p6b1zssybjwg7gd83vwanhi9w5ycwvx99x8ca"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'autoreconf
            (lambda _
              (invoke "autoreconf" "-fiv"))))))
    (native-inputs (list autoconf automake libtool pkg-config))
    (home-page "https://github.com/rsyslog/librelp")
    (synopsis "reliable event logging protocol library")
    (description
     "Librelp implements the Reliable Event Logging Protocol (RELP).  RELP
ensures reliable delivery of syslog messages over TCP, making it suitable
for environments where message loss is unacceptable.")
    (license license:gpl3+)))

;;;
;;; ── 13. flxmlrpc ─────────────────────────────────────────────────────
;;; XMLRPC library for fldigi ham radio applications
;;;
(define-public flxmlrpc
  (package
    (name "flxmlrpc")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://sourceforge.net/projects/fldigi/files/flxmlrpc/"
             "flxmlrpc-" version ".tar.gz"))
       (sha256
        (base32 "0z1aymh1jpvw0q76bp206jv4a8z47cz6zi09yyfij8adsmfqp0hz"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.w1hkj.com/")
    (synopsis "XMLRPC library for fldigi suite of ham radio programs")
    (description
     "Flxmlrpc is an XMLRPC library specifically designed for use with the
fldigi suite of amateur radio applications.  It provides the communication
layer for controlling fldigi remotely.")
    (license license:lgpl3+)))

;;;
;;; ── 14. zd1211-firmware ──────────────────────────────────────────────
;;; Firmware for the zd1211rw wireless driver
;;;
(define-public zd1211-firmware
  (package
    (name "zd1211-firmware")
    (version "1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://sourceforge.net/projects/zd1211/files/zd1211-firmware/"
             version "/zd1211-firmware-" version ".tar.bz2"))
       (sha256
        (base32 "04ibs0qw8bh6h6zmm5iz6lddgknwhsjq8ib3gyck6a7psw83h7gi"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/firmware/zd1211"
           #:include-regexp (".*\\.fw$")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (home-page "https://sourceforge.net/projects/zd1211/")
    (synopsis "firmware for the zd1211rw wireless driver")
    (description
     "This package provides firmware files for the in-kernel zd1211rw
wireless LAN driver, which supports USB WLAN devices based on the
ZyDAS ZD1211 and ZD1211B chipsets.")
    (license license:gpl2)))

;;;
;;; ── 15. ebook2cw ─────────────────────────────────────────────────────
;;; Convert text to Morse code audio
;;;
(define-public ebook2cw
  (package
    (name "ebook2cw")
    (version "0.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://fkurz.net/ham/ebook2cw/ebook2cw-" version ".tar.gz"))
       (sha256
        (base32 "1479xc8yh3qg9ianiiz3337plxjlm30sf6jrcmwznw78yxcm6dw5"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://fkurz.net/ham/ebook2cw.html")
    (synopsis "convert text files to Morse code audio")
    (description
     "Ebook2cw converts plain text files into Morse code audio output.
Supports MP3 and OGG Vorbis formats with configurable speed, pitch,
and tone parameters.  Useful for amateur radio CW practice.")
    (license license:gpl2+)))

;;;
;;; ── 16. qrq ──────────────────────────────────────────────────────────
;;; CW trainer for amateur radio
;;;
(define-public qrq
  (package
    (name "qrq")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://fkurz.net/ham/qrq/qrq-" version ".tar.gz"))
       (sha256
        (base32 "0kwdq1z1l287w10xdkpmnqycagv5y49pi354lpf59ch61nb8q1iv"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://fkurz.net/ham/qrq.html")
    (synopsis "CW (Morse code) trainer for Linux")
    (description
     "Qrq is an open-source CW trainer similar to the classic DOS program
RUFZ.  It measures your ability to receive random callsigns in Morse
code, with adjustable speed and built-in statistics.")
    (license license:gpl2+)))

;;;
;;; ── 17. demorse ──────────────────────────────────────────────────────
;;; Console Morse code decoder
;;;
(define-public demorse
  (package
    (name "demorse")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.qsl.net/5b4az/pkg/morse/demorse/demorse-"
             version ".tar.bz2"))
       (sha256
        (base32 "0g640rm6bd5nsx4y719fpj9zjaq28whkdkn7bkvb9i1zzcm9ckyc"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (setenv "PREFIX" (assoc-ref outputs "out")))))))
    (home-page "http://www.qsl.net/5b4az/pkg/morse/demorse/demorse.html")
    (synopsis "console Morse code signal decoder")
    (description
     "Demorse is a console application for decoding Morse code audio signals
into text.  It reads audio input and produces decoded text output on
the terminal.")
    (license license:gpl2+)))

;;;
;;; ── 18. xdemorse ─────────────────────────────────────────────────────
;;; X/GTK+ Morse code decoder
;;;
(define-public xdemorse
  (package
    (name "xdemorse")
    (version "3.6.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.qsl.net/5b4az/pkg/morse/xdemorse/xdemorse-"
             version ".tar.bz2"))
       (sha256
        (base32 "1gxd14pp51nz4x6d9pda7xb8d3favx76hhhlc9f1g0vh0ha2sl9d"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (setenv "PREFIX" (assoc-ref outputs "out")))))))
    (home-page "http://www.qsl.net/5b4az/pkg/morse/xdemorse/xdemorse.html")
    (synopsis "X/GTK+ Morse code decoder application")
    (description
     "Xdemorse is an X/GTK+ application for decoding Morse code signals into
text.  It provides a graphical interface for monitoring and decoding CW
transmissions.")
    (license license:gpl2+)))

;;;
;;; ── 19. bluetooth-headset-battery-level ──────────────────────────────
;;; Python script to check Bluetooth headset battery
;;;
(define-public bluetooth-headset-battery-level
  (package
    (name "bluetooth-headset-battery-level")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/TheWeirdDev/Bluetooth_Headset_Battery_Level"
             "/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0ywyv9zvlclmmf5ls2ca66k1jb5qfyrl9gryd3aa5z7sy7wkgy40"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bluetooth_battery.py" "bin/bluetooth_battery"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                   "/bin/bluetooth_battery")
                     #o755))))))
    (home-page "https://github.com/TheWeirdDev/Bluetooth_Headset_Battery_Level")
    (synopsis "fetch battery level of Bluetooth headsets")
    (description
     "A Python script to fetch the battery charge level of some Bluetooth
headsets.  Supports multiple Bluetooth profiles and reports battery
percentage via the command line.")
    (license license:gpl3)))

;;;
;;; ── 20. edl ──────────────────────────────────────────────────────────
;;; Qualcomm Firehose/Sahara/Streaming tools
;;;
(define-public edl
  (package
    (name "edl")
    (version "3.52.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bkerler/edl/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1rlqgqbgkpv8s5hf5kd0bqwghs9g3gqdz8dpaadid7r1jgjwghwh"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("edl.py" "bin/edl")
          ("." "lib/edl"
           #:include-regexp (".*\\.py$")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                   "/bin/edl")
                     #o755))))))
    (home-page "https://github.com/bkerler/edl")
    (synopsis "Qualcomm Firehose, Sahara, and streaming tools")
    (description
     "EDL provides unofficial Qualcomm Firehose, Sahara, Streaming, and
Diag tools for working with Qualcomm-based devices in Emergency
Download (EDL) mode.")
    (license license:expat)))

;;;
;;; ── 21. layan-gtk-theme ──────────────────────────────────────────────
;;; Flat GTK+ theme based on Material Design
;;;
(define-public layan-gtk-theme
  (package
    (name "layan-gtk-theme")
    (version "2023-05-23")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vinceliuice/Layan-gtk-theme/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0bdkjqzaz7sjril9vf5xnsnmfjsx8145dx26dyxr43bsj8szpbzn"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("src" "share/themes/Layan/gtk-3.0"
           #:include-regexp (".*\\.css$")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (home-page "https://github.com/vinceliuice/Layan-gtk-theme")
    (synopsis "flat GTK+ theme based on Material Design")
    (description
     "Layan is a flat GTK+ theme based on Material Design principles.  It
provides a modern look for GNOME and other GTK-based desktop environments
with light and dark variants.")
    (license license:gpl3)))

;;;
;;; ── 22. numix-frost-themes ───────────────────────────────────────────
;;; Numix Frost GTK themes
;;;
(define-public numix-frost-themes
  (package
    (name "numix-frost-themes")
    (version "3.6.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Antergos/Numix-Frost/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "1lgfxqjw78wsp1bwmhksviasj3mkkxz9741dk705dfxjmsvfnacb"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("Numix-Frost" "share/themes/Numix-Frost")
          ("Numix-Frost-Light" "share/themes/Numix-Frost-Light"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (home-page "https://numixproject.github.io/")
    (synopsis "Numix Frost GTK themes for Linux desktops")
    (description
     "Numix Frost is a modern flat GTK theme that combines light and dark
elements.  Originally created for the Antergos Linux distribution,
it provides both standard and light variants.")
    (license license:gpl3)))

;;;
;;; ── 23. cfs-zen-tweaks ──────────────────────────────────────────────
;;; Script to tweak CFS scheduler for desktop interactivity
;;;
(define-public cfs-zen-tweaks
  (package
    (name "cfs-zen-tweaks")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/igo95862/cfs-zen-tweaks/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1y4aly8k2273bx0399iqgd82yld461sxg89nn7ic1iasnvk18smm"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("set-cfs-tweaks.sh" "bin/set-cfs-tweaks")
          ("cfs-zen-tweaks.service"
           "lib/systemd/system/cfs-zen-tweaks.service"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                   "/bin/set-cfs-tweaks")
                     #o755))))))
    (home-page "https://github.com/igo95862/cfs-zen-tweaks")
    (synopsis "tweak CFS scheduler for desktop interactivity")
    (description
     "CFS Zen Tweaks adjusts Linux CFS scheduler parameters to improve
desktop interactivity.  It applies sysctl settings that reduce latency
for interactive workloads at the cost of throughput.")
    (license license:gpl3)))

;;;
;;; ── 24. gpaste-menu ──────────────────────────────────────────────────
;;; Dmenu interface for GPaste clipboard manager
;;;
(define-public gpaste-menu
  (package
    (name "gpaste-menu")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/subosito/gpaste-menu/archive/master.zip")
       (sha256
        (base32 "192mvmxxc6fndpdhagawv6qp2l6qg03a5ky85qalwabh2vs1cjgw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gpaste-menu" "bin/gpaste-menu"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                   "/bin/gpaste-menu")
                     #o755))))))
    (home-page "https://github.com/subosito/gpaste-menu")
    (synopsis "dmenu interface for GPaste clipboard manager")
    (description
     "Gpaste-menu provides a dmenu-based interface for the GPaste clipboard
manager.  Lets you browse and select clipboard history entries using
dmenu or compatible launchers.")
    (license license:expat)))

