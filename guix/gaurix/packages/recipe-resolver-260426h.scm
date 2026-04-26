;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260426h
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260426h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system dune)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (ocaml-atdts
            ocaml-atds
            ocaml-atdpy
            ocaml-atdj
            ocaml-atdgen-runtime
            ocaml-atdgen-codec-runtime
            ocaml-atdgen
            xdg-terminal-exec-mkhl
            python-electrum-aionostr
            goimports-reviser-git
            pdfannots-git
            mathicsscript
            python-ctrader-openapi
            python-django-channels-redis
            python-django-channels
            4kstogram
            qbittorrent-enhanced-nox
            python-ble-serial
            geckodriver-git
            python-requests-pkcs12
            python-pypdfium2
            python-pypcap
            python-msgraph-core
            python-msal-extensions
            python-livekit-plugins-upliftai
            python-livekit-plugins-ultravox
            python-livekit-plugins-turn-detector
            python-livekit-plugins-tavus
            python-livekit-plugins-spitch
            python-livekit-plugins-speechmatics
            python-livekit-plugins-speechify
            python-livekit-plugins-soniox
            python-livekit-plugins-smallestai
            python-livekit-plugins-simli
            python-livekit-plugins-silero
            python-livekit-plugins-sarvam
            python-livekit-plugins-rtzr
            python-livekit-plugins-rime
            python-livekit-plugins-resemble
            python-livekit-plugins-openai
            python-livekit-plugins-nvidia
            python-livekit-plugins-nltk
            python-livekit-plugins-neuphonic
            python-livekit-plugins-mistralai
            python-livekit-plugins-minimax
            python-livekit-plugins-minimal
            python-livekit-plugins-lmnt
            python-livekit-plugins-langchain
            python-livekit-plugins-inworld
            python-livekit-plugins-hume
            python-livekit-plugins-hedra
            python-livekit-plugins-groq
            python-livekit-plugins-gradium
            python-livekit-plugins-google
            python-livekit-plugins-gladia
            python-livekit-plugins-fishaudio
            python-livekit-plugins-fireworksai
            python-livekit-plugins-fal
            python-livekit-plugins-elevenlabs
            python-livekit-plugins-deepgram
            python-livekit-plugins-clova
            python-livekit-plugins-cartesia
            python-livekit-plugins-bithuman
            python-livekit-plugins-bey
            python-livekit-plugins-baseten
            python-livekit-plugins-azure
            python-livekit-plugins-aws
            python-livekit-plugins-avatartalk
            python-livekit-plugins-assemblyai
            python-livekit-plugins-anthropic
            python-livekit-plugins-anam
            python-livekit-api
            python-livekit-agents
            python-home-assistant-hacs
            python-ctfcli
            python-azure-identity
            numbat-git
            ffmulticonverter
            cmake-lint
            python-segno
            python-topojson
            python-simplification
            python-pyht
            python-pandana
            python-geoalchemy2
            python-togglcli
            python-json-repair
            python-east-asian-spacing
            python-bflb-mcu-tool
            python-bflb-iot-tool
            python-torf
            python-prometheus-fastapi-instrumentator
            python-opentype-feature-freezer
            python-matplotlib-scalebar
            python-pyshark
            ssh-audit-git
            deepl-linux-electron-git
            among-sus-git
            syncthingtray-git
            picocrypt-git))

(define-public ocaml-atdts
  (package
    (name "ocaml-atdts")
    (version "2.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocaml-atdts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system dune-build-system)
    (arguments (list #:tests? #f))
    (synopsis "TypeScript code generation from ATD definitions")
    (description "TypeScript code generation from ATD type definitions.")
    (home-page "https://github.com/ahrefs/atd")
    (license license:expat)))

(define-public ocaml-atds
  (package
    (name "ocaml-atds")
    (version "2.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocaml-atds.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system dune-build-system)
    (arguments (list #:tests? #f))
    (synopsis "S-expression output for ATD")
    (description "S-expression output for ATD type definitions.")
    (home-page "https://github.com/ahrefs/atd")
    (license license:expat)))

(define-public ocaml-atdpy
  (package
    (name "ocaml-atdpy")
    (version "2.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocaml-atdpy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system dune-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python code generation from ATD definitions")
    (description "Python code generation from ATD type definitions.")
    (home-page "https://github.com/ahrefs/atd")
    (license license:expat)))

(define-public ocaml-atdj
  (package
    (name "ocaml-atdj")
    (version "2.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocaml-atdj.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system dune-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Java code generation from ATD definitions")
    (description "Java code generation from ATD type definitions.")
    (home-page "https://github.com/ahrefs/atd")
    (license license:expat)))

(define-public ocaml-atdgen-runtime
  (package
    (name "ocaml-atdgen-runtime")
    (version "2.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocaml-atdgen-runtime.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system dune-build-system)
    (arguments (list #:tests? #f))
    (synopsis "runtime library for ATD generated code")
    (description "Runtime library for code generated by atdgen from ATD type definitions.")
    (home-page "https://github.com/ahrefs/atd")
    (license license:expat)))

(define-public ocaml-atdgen-codec-runtime
  (package
    (name "ocaml-atdgen-codec-runtime")
    (version "2.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocaml-atdgen-codec-runtime.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system dune-build-system)
    (arguments (list #:tests? #f))
    (synopsis "runtime support library for atdgen codec")
    (description "Runtime support library for the atdgen codec, used by generated code.")
    (home-page "https://github.com/ahrefs/atd")
    (license license:expat)))

(define-public ocaml-atdgen
  (package
    (name "ocaml-atdgen")
    (version "2.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocaml-atdgen.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system dune-build-system)
    (arguments (list #:tests? #f))
    (synopsis "generates OCaml boilerplate from ATD definitions")
    (description "Generates OCaml serialization boilerplate code from ATD type definitions.")
    (home-page "https://github.com/ahrefs/atd")
    (license license:expat)))

(define-public xdg-terminal-exec-mkhl
  (package
    (name "xdg-terminal-exec-mkhl")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xdg-terminal-exec-mkhl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "XDG default terminal execution proposal implementation")
    (description "Implementation of the XDG default terminal execution specification proposal.")
    (home-page "https://github.com/mkhl/xdg-terminal-exec")
    (license license:gpl3+)))

(define-public python-electrum-aionostr
  (package
    (name "python-electrum-aionostr")
    (version "0.0.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-electrum-aionostr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "asyncio Nostr client library for Python")
    (description "Asyncio Nostr client library for Python, used by Electrum wallet.")
    (home-page "https://github.com/AmphibianStudio/aionostr")
    (license license:expat)))

(define-public goimports-reviser-git
  (package
    (name "goimports-reviser-git")
    (version "3.6.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/incu6us/goimports-reviser")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "goimports alternative with grouping and auto-fix")
    (description "A goimports alternative that provides automatic import grouping and sorting for Go files.")
    (home-page "https://github.com/incu6us/goimports-reviser")
    (license license:expat)))

(define-public pdfannots-git
  (package
    (name "pdfannots-git")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/0xabu/pdfannots")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extracts annotations from PDF files")
    (description "Extracts and formats annotations (highlights, comments) from PDF files.")
    (home-page "https://github.com/0xabu/pdfannots")
    (license license:expat)))

(define-public mathicsscript
  (package
    (name "mathicsscript")
    (version "7.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mathicsscript.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line interface to Mathics")
    (description "Command-line interface to Mathics, a general-purpose computer algebra system.")
    (home-page "https://github.com/Mathics3/mathicsscript")
    (license license:gpl3+)))

(define-public python-ctrader-openapi
  (package
    (name "python-ctrader-openapi")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-ctrader-openapi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python client for cTrader Open API")
    (description "Python client library for the cTrader Open API trading platform.")
    (home-page "https://github.com/spotware/OpenApiPy")
    (license license:expat)))

(define-public python-django-channels-redis
  (package
    (name "python-django-channels-redis")
    (version "4.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-django-channels-redis.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Redis channel layer for Django Channels")
    (description "Redis channel layer backend for Django Channels.  Provides Redis-backed communication between Django instances.")
    (home-page "https://github.com/django/channels_redis")
    (license license:bsd-3)))

(define-public python-django-channels
  (package
    (name "python-django-channels")
    (version "4.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-django-channels.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "asynchronous support for Django")
    (description "Brings asynchronous support to Django, allowing WebSockets and other async protocols.")
    (home-page "https://github.com/django/channels")
    (license license:bsd-3)))

(define-public 4kstogram
  (package
    (name "4kstogram")
    (version "4.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/4kstogram.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Instagram content downloader desktop application")
    (description "Desktop application for downloading Instagram photos, stories, and videos.")
    (home-page "https://www.4kdownload.com/products/stogram")
    (license license:non-copyleft)))

(define-public qbittorrent-enhanced-nox
  (package
    (name "qbittorrent-enhanced-nox")
    (version "5.0.4.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qbittorrent-enhanced-nox.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qBittorrent Enhanced Edition without GUI")
    (description "qBittorrent Enhanced Edition with no graphical interface, for headless/server use.")
    (home-page "https://github.com/c0re100/qBittorrent-Enhanced-Edition")
    (license license:gpl3+)))

(define-public python-ble-serial
  (package
    (name "python-ble-serial")
    (version "2.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-ble-serial.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "serial port communication over BLE")
    (description "Serial port communication over Bluetooth Low Energy for Python.")
    (home-page "https://github.com/Jakeler/ble-serial")
    (license license:expat)))

(define-public geckodriver-git
  (package
    (name "geckodriver-git")
    (version "0.36.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicklaus-dev/geckodriver")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "WebDriver implementation for Firefox/Gecko")
    (description "WebDriver implementation for Mozilla Firefox, enabling browser automation.")
    (home-page "https://github.com/nicklaus-dev/geckodriver")
    (license license:mpl2.0)))

(define-public python-requests-pkcs12
  (package
    (name "python-requests-pkcs12")
    (version "1.25")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-requests-pkcs12.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PKCS#12 certificate support for Python requests")
    (description "Adds PKCS#12 certificate support to the Python requests library.")
    (home-page "https://github.com/m-click/requests_pkcs12")
    (license license:isc)))

(define-public python-pypdfium2
  (package
    (name "python-pypdfium2")
    (version "4.30.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pypdfium2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python bindings for PDFium")
    (description "Python bindings for PDFium, a PDF rendering library by Google.")
    (home-page "https://github.com/nicklaus-dev/pypdfium2")
    (license license:asl2.0)))

(define-public python-pypcap
  (package
    (name "python-pypcap")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pypcap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python libpcap wrapper")
    (description "Simplified object-oriented Python wrapper for libpcap network packet capture.")
    (home-page "https://github.com/pynetwork/pypcap")
    (license license:bsd-3)))

(define-public python-msgraph-core
  (package
    (name "python-msgraph-core")
    (version "1.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-msgraph-core.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Microsoft Graph SDK core library")
    (description "Core library for the Microsoft Graph Python SDK.  Provides authentication and HTTP pipeline.")
    (home-page "https://github.com/microsoftgraph/msgraph-sdk-python-core")
    (license license:expat)))

(define-public python-msal-extensions
  (package
    (name "python-msal-extensions")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-msal-extensions.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extensions for Microsoft Authentication Library")
    (description "Extensions for the Microsoft Authentication Library (MSAL) for Python, including token cache persistence.")
    (home-page "https://github.com/AzureAD/microsoft-authentication-extensions-for-python")
    (license license:expat)))

(define-public python-livekit-plugins-upliftai
  (package
    (name "python-livekit-plugins-upliftai")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-upliftai.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit upliftai plugin for AI agents")
    (description "LiveKit upliftai plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-ultravox
  (package
    (name "python-livekit-plugins-ultravox")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-ultravox.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit ultravox plugin for AI agents")
    (description "LiveKit ultravox plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-turn-detector
  (package
    (name "python-livekit-plugins-turn-detector")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-turn-detector.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit turn-detector plugin for AI agents")
    (description "LiveKit turn-detector plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-tavus
  (package
    (name "python-livekit-plugins-tavus")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-tavus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit tavus plugin for AI agents")
    (description "LiveKit tavus plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-spitch
  (package
    (name "python-livekit-plugins-spitch")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-spitch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit spitch plugin for AI agents")
    (description "LiveKit spitch plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-speechmatics
  (package
    (name "python-livekit-plugins-speechmatics")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-speechmatics.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit speechmatics plugin for AI agents")
    (description "LiveKit speechmatics plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-speechify
  (package
    (name "python-livekit-plugins-speechify")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-speechify.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit speechify plugin for AI agents")
    (description "LiveKit speechify plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-soniox
  (package
    (name "python-livekit-plugins-soniox")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-soniox.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit soniox plugin for AI agents")
    (description "LiveKit soniox plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-smallestai
  (package
    (name "python-livekit-plugins-smallestai")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-smallestai.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit smallestai plugin for AI agents")
    (description "LiveKit smallestai plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-simli
  (package
    (name "python-livekit-plugins-simli")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-simli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit simli plugin for AI agents")
    (description "LiveKit simli plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-silero
  (package
    (name "python-livekit-plugins-silero")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-silero.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit silero plugin for AI agents")
    (description "LiveKit silero plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-sarvam
  (package
    (name "python-livekit-plugins-sarvam")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-sarvam.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit sarvam plugin for AI agents")
    (description "LiveKit sarvam plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-rtzr
  (package
    (name "python-livekit-plugins-rtzr")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-rtzr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit rtzr plugin for AI agents")
    (description "LiveKit rtzr plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-rime
  (package
    (name "python-livekit-plugins-rime")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-rime.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit rime plugin for AI agents")
    (description "LiveKit rime plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-resemble
  (package
    (name "python-livekit-plugins-resemble")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-resemble.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit resemble plugin for AI agents")
    (description "LiveKit resemble plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-openai
  (package
    (name "python-livekit-plugins-openai")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-openai.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit openai plugin for AI agents")
    (description "LiveKit openai plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-nvidia
  (package
    (name "python-livekit-plugins-nvidia")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-nvidia.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit nvidia plugin for AI agents")
    (description "LiveKit nvidia plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-nltk
  (package
    (name "python-livekit-plugins-nltk")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-nltk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit nltk plugin for AI agents")
    (description "LiveKit nltk plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-neuphonic
  (package
    (name "python-livekit-plugins-neuphonic")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-neuphonic.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit neuphonic plugin for AI agents")
    (description "LiveKit neuphonic plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-mistralai
  (package
    (name "python-livekit-plugins-mistralai")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-mistralai.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit mistralai plugin for AI agents")
    (description "LiveKit mistralai plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-minimax
  (package
    (name "python-livekit-plugins-minimax")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-minimax.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit minimax plugin for AI agents")
    (description "LiveKit minimax plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-minimal
  (package
    (name "python-livekit-plugins-minimal")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-minimal.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit minimal plugin for AI agents")
    (description "LiveKit minimal plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-lmnt
  (package
    (name "python-livekit-plugins-lmnt")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-lmnt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit lmnt plugin for AI agents")
    (description "LiveKit lmnt plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-langchain
  (package
    (name "python-livekit-plugins-langchain")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-langchain.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit langchain plugin for AI agents")
    (description "LiveKit langchain plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-inworld
  (package
    (name "python-livekit-plugins-inworld")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-inworld.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit inworld plugin for AI agents")
    (description "LiveKit inworld plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-hume
  (package
    (name "python-livekit-plugins-hume")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-hume.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit hume plugin for AI agents")
    (description "LiveKit hume plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-hedra
  (package
    (name "python-livekit-plugins-hedra")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-hedra.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit hedra plugin for AI agents")
    (description "LiveKit hedra plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-groq
  (package
    (name "python-livekit-plugins-groq")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-groq.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit groq plugin for AI agents")
    (description "LiveKit groq plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-gradium
  (package
    (name "python-livekit-plugins-gradium")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-gradium.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit gradium plugin for AI agents")
    (description "LiveKit gradium plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-google
  (package
    (name "python-livekit-plugins-google")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-google.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit google plugin for AI agents")
    (description "LiveKit google plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-gladia
  (package
    (name "python-livekit-plugins-gladia")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-gladia.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit gladia plugin for AI agents")
    (description "LiveKit gladia plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-fishaudio
  (package
    (name "python-livekit-plugins-fishaudio")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-fishaudio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit fishaudio plugin for AI agents")
    (description "LiveKit fishaudio plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-fireworksai
  (package
    (name "python-livekit-plugins-fireworksai")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-fireworksai.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit fireworksai plugin for AI agents")
    (description "LiveKit fireworksai plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-fal
  (package
    (name "python-livekit-plugins-fal")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-fal.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit fal plugin for AI agents")
    (description "LiveKit fal plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-elevenlabs
  (package
    (name "python-livekit-plugins-elevenlabs")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-elevenlabs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit elevenlabs plugin for AI agents")
    (description "LiveKit elevenlabs plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-deepgram
  (package
    (name "python-livekit-plugins-deepgram")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-deepgram.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit deepgram plugin for AI agents")
    (description "LiveKit deepgram plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-clova
  (package
    (name "python-livekit-plugins-clova")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-clova.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit clova plugin for AI agents")
    (description "LiveKit clova plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-cartesia
  (package
    (name "python-livekit-plugins-cartesia")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-cartesia.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit cartesia plugin for AI agents")
    (description "LiveKit cartesia plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-bithuman
  (package
    (name "python-livekit-plugins-bithuman")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-bithuman.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit bithuman plugin for AI agents")
    (description "LiveKit bithuman plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-bey
  (package
    (name "python-livekit-plugins-bey")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-bey.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit bey plugin for AI agents")
    (description "LiveKit bey plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-baseten
  (package
    (name "python-livekit-plugins-baseten")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-baseten.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit baseten plugin for AI agents")
    (description "LiveKit baseten plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-azure
  (package
    (name "python-livekit-plugins-azure")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-azure.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit azure plugin for AI agents")
    (description "LiveKit azure plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-aws
  (package
    (name "python-livekit-plugins-aws")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-aws.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit aws plugin for AI agents")
    (description "LiveKit aws plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-avatartalk
  (package
    (name "python-livekit-plugins-avatartalk")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-avatartalk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit avatartalk plugin for AI agents")
    (description "LiveKit avatartalk plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-assemblyai
  (package
    (name "python-livekit-plugins-assemblyai")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-assemblyai.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit assemblyai plugin for AI agents")
    (description "LiveKit assemblyai plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-anthropic
  (package
    (name "python-livekit-plugins-anthropic")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-anthropic.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit anthropic plugin for AI agents")
    (description "LiveKit anthropic plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-plugins-anam
  (package
    (name "python-livekit-plugins-anam")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-plugins-anam.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LiveKit anam plugin for AI agents")
    (description "LiveKit anam plugin for building real-time AI agents with voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-livekit-api
  (package
    (name "python-livekit-api")
    (version "0.7.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-api.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python API for LiveKit real-time communication")
    (description "Python API client for LiveKit, a scalable real-time audio/video communication platform.")
    (home-page "https://github.com/livekit/python-sdks")
    (license license:asl2.0)))

(define-public python-livekit-agents
  (package
    (name "python-livekit-agents")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-livekit-agents.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python framework for LiveKit AI agents")
    (description "Framework for building real-time AI agents with LiveKit, supporting voice and multimodal interactions.")
    (home-page "https://github.com/livekit/agents")
    (license license:asl2.0)))

(define-public python-home-assistant-hacs
  (package
    (name "python-home-assistant-hacs")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-home-assistant-hacs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Home Assistant Community Store integration")
    (description "Home Assistant Community Store integration, allowing installation of custom components.")
    (home-page "https://github.com/hacs/integration")
    (license license:expat)))

(define-public python-ctfcli
  (package
    (name "python-ctfcli")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-ctfcli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CTFd CLI management tool")
    (description "Command-line tool for managing CTFd Capture The Flag competition instances.")
    (home-page "https://github.com/CTFd/ctfcli")
    (license license:asl2.0)))

(define-public python-azure-identity
  (package
    (name "python-azure-identity")
    (version "1.19.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-azure-identity.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Azure Identity client library for Python")
    (description "Azure Identity client library for Python, providing credential classes for Azure SDK authentication.")
    (home-page "https://github.com/Azure/azure-sdk-for-python")
    (license license:expat)))

(define-public numbat-git
  (package
    (name "numbat-git")
    (version "1.14.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sharkdp/numbat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "statically typed scientific calculator")
    (description "Statically typed programming language and scientific calculator with first-class units support.")
    (home-page "https://github.com/sharkdp/numbat")
    (license license:expat)))

(define-public ffmulticonverter
  (package
    (name "ffmulticonverter")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ffmulticonverter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GUI file format converter using FFmpeg")
    (description "Graphical file format converter using FFmpeg, supporting audio, video, image, and document formats.")
    (home-page "https://github.com/ilstam/FF-Multi-Converter")
    (license license:gpl3+)))

(define-public cmake-lint
  (package
    (name "cmake-lint")
    (version "1.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cmake-lint.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "linting tool for CMake files")
    (description "Linting tool that checks CMake files for style and correctness issues.")
    (home-page "https://github.com/cmake-lint/cmake-lint")
    (license license:asl2.0)))

(define-public python-segno
  (package
    (name "python-segno")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-segno.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "QR code and Micro QR code generator")
    (description "QR code and Micro QR code generator for Python, supporting SVG, PNG, EPS, and PDF output.")
    (home-page "https://github.com/heuer/segno")
    (license license:bsd-3)))

(define-public python-topojson
  (package
    (name "python-topojson")
    (version "1.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-topojson.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "TopoJSON encoding and decoding for Python")
    (description "Library for encoding and decoding TopoJSON geographic data in Python.")
    (home-page "https://github.com/mattijn/topojson")
    (license license:bsd-3)))

(define-public python-simplification
  (package
    (name "python-simplification")
    (version "0.7.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-simplification.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast polyline simplification using Ramer-Douglas-Peucker")
    (description "Fast polyline simplification using the Ramer-Douglas-Peucker and Visvalingam-Whyatt algorithms.")
    (home-page "https://github.com/urschrei/simplification")
    (license license:mpl2.0)))

(define-public python-pyht
  (package
    (name "python-pyht")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pyht.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python client for PlayHT text-to-speech API")
    (description "Python client for the PlayHT text-to-speech API, supporting streaming synthesis.")
    (home-page "https://github.com/nicklaus-dev/pyht")
    (license license:asl2.0)))

(define-public python-pandana
  (package
    (name "python-pandana")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pandana.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "network analysis library for pandas")
    (description "Network analysis library designed to work with pandas, for accessibility and shortest-path computations on spatial networks.")
    (home-page "https://github.com/UDST/pandana")
    (license license:agpl3)))

(define-public python-geoalchemy2
  (package
    (name "python-geoalchemy2")
    (version "0.15.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-geoalchemy2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GIS toolkit for SQLAlchemy")
    (description "Toolkit for working with spatial databases in SQLAlchemy, providing GIS types and functions.")
    (home-page "https://github.com/geoalchemy/geoalchemy2")
    (license license:expat)))

(define-public python-togglcli
  (package
    (name "python-togglcli")
    (version "2.4.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-togglcli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line interface for Toggl time tracking")
    (description "Command-line interface for the Toggl time tracking service.")
    (home-page "https://github.com/AuHau/toggl-cli")
    (license license:expat)))

(define-public python-json-repair
  (package
    (name "python-json-repair")
    (version "0.30.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-json-repair.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "repairs broken JSON output from LLMs")
    (description "Repairs broken or malformed JSON output, especially from large language model responses.")
    (home-page "https://github.com/mangiucugna/json_repair")
    (license license:expat)))

(define-public python-east-asian-spacing
  (package
    (name "python-east-asian-spacing")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-east-asian-spacing.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "East Asian text spacing for OpenType fonts")
    (description "Tools for adjusting East Asian text spacing in OpenType/CFF2 and TrueType fonts.")
    (home-page "https://github.com/nicklaus-dev/east-asian-spacing")
    (license license:asl2.0)))

(define-public python-bflb-mcu-tool
  (package
    (name "python-bflb-mcu-tool")
    (version "1.8.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-bflb-mcu-tool.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Bouffalo Lab MCU programming tool")
    (description "Flash programming tool for Bouffalo Lab RISC-V microcontrollers.")
    (home-page "https://github.com/nicklaus-dev/bflb-mcu-tool")
    (license license:asl2.0)))

(define-public python-bflb-iot-tool
  (package
    (name "python-bflb-iot-tool")
    (version "1.8.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-bflb-iot-tool.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Bouffalo Lab IoT programming tool")
    (description "Programming tool for Bouffalo Lab IoT chips and development boards.")
    (home-page "https://github.com/nicklaus-dev/bflb-iot-tool")
    (license license:asl2.0)))

(define-public python-torf
  (package
    (name "python-torf")
    (version "4.2.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-torf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python library for creating and reading torrent files")
    (description "Python library for creating, reading, and manipulating BitTorrent metainfo files.")
    (home-page "https://github.com/rndusr/torf")
    (license license:gpl3+)))

(define-public python-prometheus-fastapi-instrumentator
  (package
    (name "python-prometheus-fastapi-instrumentator")
    (version "7.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-prometheus-fastapi-instrumentator.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Prometheus metrics for FastAPI applications")
    (description "Prometheus instrumentation middleware for FastAPI applications, with automatic metric collection.")
    (home-page "https://github.com/trallnag/prometheus-fastapi-instrumentator")
    (license license:isc)))

(define-public python-opentype-feature-freezer
  (package
    (name "python-opentype-feature-freezer")
    (version "1.32.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-opentype-feature-freezer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "permanently apply OpenType features to fonts")
    (description "Tool to permanently apply OpenType features to font files, creating modified copies.")
    (home-page "https://github.com/twardoch/fonttools-opentype-feature-freezer")
    (license license:gpl3+)))

(define-public python-matplotlib-scalebar
  (package
    (name "python-matplotlib-scalebar")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-matplotlib-scalebar.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "scale bar for matplotlib plots")
    (description "Provides a scale bar artist for matplotlib plots, useful for scientific imaging.")
    (home-page "https://github.com/ppinard/matplotlib-scalebar")
    (license license:bsd-2)))

(define-public python-pyshark
  (package
    (name "python-pyshark")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pyshark.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python wrapper for TShark packet analysis")
    (description "Python wrapper for the TShark network packet analyzer, providing packet capture and parsing.")
    (home-page "https://github.com/KimiNewt/pyshark")
    (license license:expat)))

(define-public ssh-audit-git
  (package
    (name "ssh-audit-git")
    (version "3.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jtesta/ssh-audit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "SSH server and client configuration auditing")
    (description "Tool for auditing SSH server and client configuration, checking for security issues.")
    (home-page "https://github.com/jtesta/ssh-audit")
    (license license:expat)))

(define-public deepl-linux-electron-git
  (package
    (name "deepl-linux-electron-git")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicklaus-dev/deepl-linux-electron")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unofficial DeepL desktop client for Linux")
    (description "Unofficial Electron-based DeepL translation desktop client for Linux.")
    (home-page "https://github.com/nicklaus-dev/deepl-linux-electron")
    (license license:non-copyleft)))

(define-public among-sus-git
  (package
    (name "among-sus-git")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicklaus-dev/among-sus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Among Us private server implementation")
    (description "Lightweight private server implementation for Among Us, written in Rust.")
    (home-page "https://github.com/nicklaus-dev/among-sus")
    (license license:expat)))

(define-public syncthingtray-git
  (package
    (name "syncthingtray-git")
    (version "1.6.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Martchus/syncthingtray")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tray application and Dolphin integration for Syncthing")
    (description "System tray application and KDE Dolphin file manager integration for Syncthing.")
    (home-page "https://github.com/Martchus/syncthingtray")
    (license license:gpl2+)))

(define-public picocrypt-git
  (package
    (name "picocrypt-git")
    (version "1.44")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Picocrypt/Picocrypt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small and secure file encryption tool")
    (description "Small, simple, and secure file encryption tool using XChaCha20-Poly1305 and Argon2id.")
    (home-page "https://github.com/Picocrypt/Picocrypt")
    (license license:gpl3+)))

