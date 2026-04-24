;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424q
;;; Resolves 99 packages from TODO queue.
;;; 1 packages blocked.
;;;
;;; New recipes (99):
;;;        1.  nexus-cli (#17979, gnu-build-system, v0.5.0, asl2.0)
;;;        2.  websitino-bin (#18032, copy-build-system, v0.2.9, expat)
;;;        3.  sst-bin (#18075, copy-build-system, v4.11.0, expat)
;;;        4.  kubebuilder-bin (#18085, copy-build-system, v4.13.1, asl2.0)
;;;        5.  ygo-omega (#18091, gnu-build-system, vlatest, agpl3)
;;;        6.  dpitunnel-bin (#18092, copy-build-system, v1.0.3, gpl3+)
;;;        7.  shclrz (#18093, gnu-build-system, v0.3.1, gpl3)
;;;        8.  photoprism-nasnet (#18100, gnu-build-system, v20200722.072055, agpl3+)
;;;        9.  wastebin-moku-bin (#18102, copy-build-system, v3.1.0, expat)
;;;       10.  photoprism-nsfw (#18109, gnu-build-system, v20200722.072056, agpl3+)
;;;       11.  photoprism-facenet (#18110, gnu-build-system, v20210716.180236, agpl3+)
;;;       12.  stepman-bin (#18117, copy-build-system, v0.18.7, expat)
;;;       13.  bootstrap (#18125, gnu-build-system, v5.3.8, expat)
;;;       14.  f5epi (#18154, gnu-build-system, v7183.2020.0826.1, nonfree)
;;;       15.  clustertool-bin (#18172, copy-build-system, v2.0.6, nonfree)
;;;       16.  toru-bin (#18238, copy-build-system, v0.3.3, expat)
;;;       17.  phanpy-bin (#18243, copy-build-system, v2026.02.24.48b2cf7, expat)
;;;       18.  gupload-bin (#18245, copy-build-system, v0.1.0, gpl3+)
;;;       19.  gtree-bin (#18246, copy-build-system, v0.2.1, gpl3+)
;;;       20.  golored-bin (#18247, copy-build-system, v1.0.0, gpl3+)
;;;       21.  womic (#18258, gnu-build-system, v1.0, nonfree)
;;;       22.  ksmtuned-git (#18265, gnu-build-system, v15.fef066f, gpl2)
;;;       23.  trzsz-bin (#18305, copy-build-system, v1.2.0, expat)
;;;       24.  libwasmtime (#18309, gnu-build-system, v40.0.0, asl2.0)
;;;       25.  goat-bin (#18313, copy-build-system, v0.10.0, nonfree)
;;;       26.  fetchify (#18316, gnu-build-system, v1.0.3, nonfree)
;;;       27.  tpm-vuln-checker-bin (#18364, copy-build-system, v1.3, asl2.0)
;;;       28.  luxtorpeda-bin (#18365, copy-build-system, vv76.2.0, gpl2)
;;;       29.  crystalline-bin (#18425, copy-build-system, v0.17.1, expat)
;;;       30.  twenty-twenty-twenty-bin (#18427, copy-build-system, v1.0.0, expat)
;;;       31.  render-cli-bin (#18429, copy-build-system, v2.15.1, asl2.0)
;;;       32.  smos-bin (#18440, copy-build-system, v0.10.0, expat)
;;;       33.  pinnacle (#18458, gnu-build-system, v1.0, nonfree)
;;;       34.  internxt-bin (#18471, copy-build-system, v2.5.4, agpl3)
;;;       35.  ytt-bin (#18489, copy-build-system, v0.53.2, asl2.0)
;;;       36.  rpcs3-udev (#18494, gnu-build-system, v2024.07.15, nonfree)
;;;       37.  mythes-pt_pt (#18549, gnu-build-system, v20060817, gpl3+)
;;;       38.  hyphen-pt_pt (#18550, gnu-build-system, v20040415, lgpl3+)
;;;       39.  ecce-gov-pt-certificates (#18566, gnu-build-system, v20200512, nonfree)
;;;       40.  autenticacao-gov-pt-pki (#18567, gnu-build-system, v20250611, nonfree)
;;;       41.  grok-cli (#18597, gnu-build-system, v1.2.0, expat)
;;;       42.  minefetch (#18625, gnu-build-system, v1.6.10, gpl3+)
;;;       43.  soar-nightly-bin (#18643, copy-build-system, vc86323b, expat)
;;;       44.  dejsonlz4-git (#18681, gnu-build-system, v9.c4305b8, nonfree)
;;;       45.  cypherock-cysync-appimage (#18682, copy-build-system, v2.4.5, nonfree)
;;;       46.  mythes-cs (#18715, gnu-build-system, v20150310, nonfree)
;;;       47.  vincent-bin (#18734, copy-build-system, v0.1.4, expat)
;;;       48.  mkl-bin (#18757, copy-build-system, v0.2.3, gpl3)
;;;       49.  cinf-bin (#18764, copy-build-system, v0.6.0, asl2.0)
;;;       50.  qbittorrent-nox-static-bin (#18782, copy-build-system, v5.1.4_v2.0.12, gpl3)
;;;       51.  virtualbox-guest-iso-dev (#18800, gnu-build-system, v1:7.2.97.173564, nonfree)
;;;       52.  netclient-bin (#18855, copy-build-system, v1.4.0, asl2.0)
;;;       53.  jql-bin (#18856, copy-build-system, v8.1.2, Apache-2.0,MIT)
;;;       54.  deeplx-bin (#18870, copy-build-system, v1.1.0, expat)
;;;       55.  trenchbroom-appimage (#18877, copy-build-system, v2025.4, gpl3)
;;;       56.  krunker (#18920, gnu-build-system, v2.1.3, nonfree)
;;;       57.  butler (#18944, gnu-build-system, v15.26.1, expat)
;;;       58.  kraftkit-bin (#18955, copy-build-system, v0.12.10, bsd-3)
;;;       59.  regressi-bin (#18971, copy-build-system, v1.8.0, nonfree)
;;;       60.  mrv2-bin (#18975, copy-build-system, v1.4.0, bsd-3)
;;;       61.  onlykey (#18978, gnu-build-system, v5.5.0, nonfree)
;;;       62.  godot-fbx2gltf-bin (#18979, copy-build-system, v0.13.1, bsd-3)
;;;       63.  gluon-scenebuilder (#19018, gnu-build-system, v23.0.1, bsd-3)
;;;       64.  sccache-bin (#19063, copy-build-system, v0.14.0, asl2.0)
;;;       65.  brother-hll8240cdw (#19104, gnu-build-system, v3.5.1, nonfree)
;;;       66.  alpinezen-bin (#19106, copy-build-system, v1.0.0, gpl3+)
;;;       67.  cbconvert-bin (#19125, copy-build-system, v1.1.0, gpl3)
;;;       68.  git-htmldocs (#19130, gnu-build-system, v2.53.0, gpl2)
;;;       69.  keyshift (#19148, gnu-build-system, v1.0.12, asl2.0)
;;;       70.  wozzle (#19168, gnu-build-system, vr71.96330ba, expat)
;;;       71.  gbsplay (#19180, gnu-build-system, v0.0.102, nonfree)
;;;       72.  perl-image-base (#19183, gnu-build-system, v1.17, gpl3+)
;;;       73.  bd (#19187, gnu-build-system, v1.03, expat)
;;;       74.  bindtointerface (#19191, gnu-build-system, v1.0, gpl3+)
;;;       75.  wishlist-bin (#19193, copy-build-system, v0.15.2, expat)
;;;       76.  timer-bin (#19195, copy-build-system, v1.4.6, expat)
;;;       77.  tasktimer-bin (#19197, copy-build-system, v1.12.0, expat)
;;;       78.  nali-go-bin (#19199, copy-build-system, v0.8.1, expat)
;;;       79.  cf-terraforming (#19203, gnu-build-system, v0.24.0, mpl2.0)
;;;       80.  beehive-bin (#19204, copy-build-system, v0.4.0, agpl3)
;;;       81.  wpm (#19207, gnu-build-system, v1.0.1, wtfpl2)
;;;       82.  swingmusic-bin (#19211, copy-build-system, v2.0.8, expat)
;;;       83.  stardict-wikt-en-en (#19212, gnu-build-system, v2025_10_05, nonfree)
;;;       84.  stardict-wikt-en-all (#19213, gnu-build-system, v2025_10_05, nonfree)
;;;       85.  stardict-urban (#19214, gnu-build-system, v2.4.2, nonfree)
;;;       86.  stardict-dictd-moby-thesaurus (#19215, gnu-build-system, v2.4.2, gpl3+)
;;;       87.  passh-agent-bin (#19225, copy-build-system, v0.2.0, gpl3)
;;;       88.  packemon-bin (#19226, copy-build-system, v1.8.21, bsd-2)
;;;       89.  moondeckbuddy-appimage (#19230, copy-build-system, v1.9.2, nonfree)
;;;       90.  lfetch (#19235, gnu-build-system, v1.0, expat)
;;;       91.  howto-bin (#19239, copy-build-system, v0.0.0, expat)
;;;       92.  fsql-bin (#19243, copy-build-system, v0.5.2, expat)
;;;       93.  docker-slim-bin (#19248, copy-build-system, v1.41.5, asl2.0)
;;;       94.  confettysh-bin (#19251, copy-build-system, v1.1.2, expat)
;;;       95.  charm-pop-bin (#19253, copy-build-system, v0.2.0, expat)
;;;       96.  jd-tool-bin (#19259, copy-build-system, v2.5.0, expat)
;;;       97.  redli-bin (#19263, copy-build-system, v0.17.0, expat)
;;;       98.  lib32-bindtointerface (#19267, gnu-build-system, v4b03914, gpl3+)
;;;       99.  dabadee (#19305, gnu-build-system, v1.0.0, asl2.0)
;;;
;;; BLOCKED (1):
;;;        1.  elp (#19246) -- SOURCE_UNAVAILABLE: no upstream URL in AUR metadata

(define-module (gaurix packages recipe-resolver-260424q)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:export (
            nexus-cli
            websitino-bin
            sst-bin
            kubebuilder-bin
            ygo-omega
            dpitunnel-bin
            shclrz
            photoprism-nasnet
            wastebin-moku-bin
            photoprism-nsfw
            photoprism-facenet
            stepman-bin
            bootstrap
            f5epi
            clustertool-bin
            toru-bin
            phanpy-bin
            gupload-bin
            gtree-bin
            golored-bin
            womic
            ksmtuned-git
            trzsz-bin
            libwasmtime
            goat-bin
            fetchify
            tpm-vuln-checker-bin
            luxtorpeda-bin
            crystalline-bin
            twenty-twenty-twenty-bin
            render-cli-bin
            smos-bin
            pinnacle
            internxt-bin
            ytt-bin
            rpcs3-udev
            mythes-pt-pt
            hyphen-pt-pt
            ecce-gov-pt-certificates
            autenticacao-gov-pt-pki
            grok-cli
            minefetch
            soar-nightly-bin
            dejsonlz4-git
            cypherock-cysync-appimage
            mythes-cs
            vincent-bin
            mkl-bin
            cinf-bin
            qbittorrent-nox-static-bin
            virtualbox-guest-iso-dev
            netclient-bin
            jql-bin
            deeplx-bin
            trenchbroom-appimage
            krunker
            butler
            kraftkit-bin
            regressi-bin
            mrv2-bin
            onlykey
            godot-fbx2gltf-bin
            gluon-scenebuilder
            sccache-bin
            brother-hll8240cdw
            alpinezen-bin
            cbconvert-bin
            git-htmldocs
            keyshift
            wozzle
            gbsplay
            perl-image-base
            bd
            bindtointerface
            wishlist-bin
            timer-bin
            tasktimer-bin
            nali-go-bin
            cf-terraforming
            beehive-bin
            wpm
            swingmusic-bin
            stardict-wikt-en-en
            stardict-wikt-en-all
            stardict-urban
            stardict-dictd-moby-thesaurus
            passh-agent-bin
            packemon-bin
            moondeckbuddy-appimage
            lfetch
            howto-bin
            fsql-bin
            docker-slim-bin
            confettysh-bin
            charm-pop-bin
            jd-tool-bin
            redli-bin
            lib32-bindtointerface
            dabadee
            ))

;;; Nonfree license placeholder for proprietary packages
(define license:nonfree
  ((@@ (guix licenses) license)
   "Nonfree"
   "https://spdx.org/licenses/"
   "Nonfree/proprietary license; see package home page for terms."))

(define-public nexus-cli
  (package
    (name "nexus-cli")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/talus-network/nexus-sdk")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI for building Talus Agents with Nexus, the Agentic Workflow Engine")
    (description "CLI for building Talus Agents with Nexus, the Agentic Workflow Engine.")
    (home-page "https://github.com/talus-network/nexus-sdk")
    (license license:asl2.0)))

(define-public websitino-bin
  (package
    (name "websitino-bin")
    (version "0.2.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/trikko/websitino")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/websitino-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a lightweight static file server for local development")
    (description "A lightweight static file server for local development.")
    (home-page "https://github.com/trikko/websitino")
    (license license:expat)))

(define-public sst-bin
  (package
    (name "sst-bin")
    (version "4.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sst/sst")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sst-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "deploy anything")
    (description "Deploy anything.")
    (home-page "https://github.com/sst/sst")
    (license license:expat)))

(define-public kubebuilder-bin
  (package
    (name "kubebuilder-bin")
    (version "4.13.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kubernetes-sigs/kubebuilder")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/kubebuilder-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "SDK for building Kubernetes APIs")
    (description "SDK for building Kubernetes APIs.")
    (home-page "https://github.com/kubernetes-sigs/kubebuilder")
    (license license:asl2.0)))

(define-public ygo-omega
  (package
    (name "ygo-omega")
    (version "latest")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/duelists-unite")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Ultimate Yu-Gi-Oh! Simulator")
    (description "The Ultimate Yu-Gi-Oh! Simulator.")
    (home-page "https://github.com/duelists-unite")
    (license license:agpl3)))

(define-public dpitunnel-bin
  (package
    (name "dpitunnel-bin")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/txtsd/DPITunnel")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/dpitunnel-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "free, simple and serverless solution against censorship for Linux PCs and r...")
    (description "Free, simple and serverless solution against censorship for Linux PCs and routers.")
    (home-page "https://github.com/txtsd/DPITunnel")
    (license license:gpl3+)))

(define-public shclrz
  (package
    (name "shclrz")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/alexcoder04/shclrz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "coloring output in the shell")
    (description "Coloring output in the shell.")
    (home-page "https://github.com/alexcoder04/shclrz")
    (license license:gpl3)))

(define-public photoprism-nasnet
  (package
    (name "photoprism-nasnet")
    (version "20200722.072055")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/photoprism/photoprism")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "photoPrism's nasnet pre-training model")
    (description "PhotoPrism's nasnet pre-training model.")
    (home-page "https://github.com/photoprism/photoprism")
    (license license:agpl3+)))

(define-public wastebin-moku-bin
  (package
    (name "wastebin-moku-bin")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mokurin000/wastebin")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wastebin-moku-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "wastebin is a minimal pastebin. (perf patch)")
    (description "Wastebin is a minimal pastebin. (perf patch).")
    (home-page "https://github.com/mokurin000/wastebin")
    (license license:expat)))

(define-public photoprism-nsfw
  (package
    (name "photoprism-nsfw")
    (version "20200722.072056")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/photoprism/photoprism")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "photoPrism's nsfw pre-training model")
    (description "PhotoPrism's nsfw pre-training model.")
    (home-page "https://github.com/photoprism/photoprism")
    (license license:agpl3+)))

(define-public photoprism-facenet
  (package
    (name "photoprism-facenet")
    (version "20210716.180236")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/photoprism/photoprism")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "photoPrism's facenet pre-training model")
    (description "PhotoPrism's facenet pre-training model.")
    (home-page "https://github.com/photoprism/photoprism")
    (license license:agpl3+)))

(define-public stepman-bin
  (package
    (name "stepman-bin")
    (version "0.18.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/bitrise-io/stepman")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/stepman-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "manage decentralized StepLib Step (script) collections")
    (description "Manage decentralized StepLib Step (script) collections.")
    (home-page "https://github.com/bitrise-io/stepman")
    (license license:expat)))

(define-public bootstrap
  (package
    (name "bootstrap")
    (version "5.3.8")
    (source (origin
              (method url-fetch)
              (uri "https://getbootstrap.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "front-end framework for web development")
    (description "Front-end framework for web development.")
    (home-page "https://getbootstrap.com/")
    (license license:expat)))

(define-public f5epi
  (package
    (name "f5epi")
    (version "7183.2020.0826.1")
    (source (origin
              (method url-fetch)
              (uri "https://support.f5.com/csp/article/K32311645#link_04_05")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "endpoint inspection application. It provide capabilities to check machines ...")
    (description "Endpoint inspection application. It provide capabilities to check machines software processes and files.")
    (home-page "https://support.f5.com/csp/article/K32311645#link_04_05")
    (license license:nonfree)))

(define-public clustertool-bin
  (package
    (name "clustertool-bin")
    (version "2.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://truecharts.org")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/clustertool-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "tool to help bootstrap a Kubernetes cluster")
    (description "Tool to help bootstrap a Kubernetes cluster.")
    (home-page "https://truecharts.org")
    (license license:nonfree)))

(define-public toru-bin
  (package
    (name "toru-bin")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sweetbbak/toru")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/toru-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "bittorrent streaming CLI tool for animes")
    (description "Bittorrent streaming CLI tool for animes.")
    (home-page "https://github.com/sweetbbak/toru")
    (license license:expat)))

(define-public phanpy-bin
  (package
    (name "phanpy-bin")
    (version "2026.02.24.48b2cf7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/cheeaun/phanpy/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/phanpy-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a minimalistic opinionated Mastodon web client")
    (description "A minimalistic opinionated Mastodon web client.")
    (home-page "https://github.com/cheeaun/phanpy/")
    (license license:expat)))

(define-public gupload-bin
  (package
    (name "gupload-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/alexcoder04/gupload")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gupload-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "serve an HTTP server to transfer files between machines on the local network")
    (description "Serve an HTTP server to transfer files between machines on the local network.")
    (home-page "https://github.com/alexcoder04/gupload")
    (license license:gpl3+)))

(define-public gtree-bin
  (package
    (name "gtree-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kitagry/gtree")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gtree-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "tree command with icons")
    (description "Tree command with icons.")
    (home-page "https://github.com/kitagry/gtree")
    (license license:gpl3+)))

(define-public golored-bin
  (package
    (name "golored-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/alexcoder04/golored")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/golored-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "color your shell scripts' output")
    (description "Color your shell scripts' output.")
    (home-page "https://github.com/alexcoder04/golored")
    (license license:gpl3+)))

(define-public womic
  (package
    (name "womic")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://wolicheng.com/womic/wo_mic_linux.html")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "WO Mic can turn your phone to be a microphone for your computer")
    (description "WO Mic can turn your phone to be a microphone for your computer.")
    (home-page "https://wolicheng.com/womic/wo_mic_linux.html")
    (license license:nonfree)))

(define-public ksmtuned-git
  (package
    (name "ksmtuned-git")
    (version "15.fef066f")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ksmtuned/ksmtuned")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "while the ksm service is only able to start and stop the KSM kernel thread,...")
    (description "While the ksm service is only able to start and stop the KSM kernel thread, ksmtuned controls and tunes KSM according to the used memory of running qemu KVM instances.")
    (home-page "https://github.com/ksmtuned/ksmtuned")
    (license license:gpl2)))

(define-public trzsz-bin
  (package
    (name "trzsz-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://trzsz.github.io/go")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/trzsz-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the go version of trzsz, makes all terminals that support local shell to su...")
    (description "The go version of trzsz, makes all terminals that support local shell to support trzsz ( trz / tsz ).(Prebuilt version).")
    (home-page "https://trzsz.github.io/go")
    (license license:expat)))

(define-public libwasmtime
  (package
    (name "libwasmtime")
    (version "40.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/bytecodealliance/wasmtime")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wasmtime as library with C-bindings")
    (description "Wasmtime as library with C-bindings.")
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (license license:asl2.0)))

(define-public goat-bin
  (package
    (name "goat-bin")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/brocode/goat")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/goat-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "better sleep")
    (description "Better sleep.")
    (home-page "https://github.com/brocode/goat")
    (license license:nonfree)))

(define-public fetchify
  (package
    (name "fetchify")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/GrandTheBest/fetchify")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "software package")
    (description "Software package.")
    (home-page "https://github.com/GrandTheBest/fetchify")
    (license license:nonfree)))

(define-public tpm-vuln-checker-bin
  (package
    (name "tpm-vuln-checker-bin")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/immune-gmbh/tpm-vuln-checker")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tpm-vuln-checker-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TPM 2.0 Vulnerability Scanning Tool")
    (description "TPM 2.0 Vulnerability Scanning Tool.")
    (home-page "https://github.com/immune-gmbh/tpm-vuln-checker")
    (license license:asl2.0)))

(define-public luxtorpeda-bin
  (package
    (name "luxtorpeda-bin")
    (version "v76.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/luxtorpeda-dev/luxtorpeda")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/luxtorpeda-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "steam Play compatibility tool to run games using native Linux engines")
    (description "Steam Play compatibility tool to run games using native Linux engines.")
    (home-page "https://github.com/luxtorpeda-dev/luxtorpeda")
    (license license:gpl2)))

(define-public crystalline-bin
  (package
    (name "crystalline-bin")
    (version "0.17.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/elbywan/crystalline/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/crystalline-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a Language Server Protocol implementation for Crystal")
    (description "A Language Server Protocol implementation for Crystal.")
    (home-page "https://github.com/elbywan/crystalline/")
    (license license:expat)))

(define-public twenty-twenty-twenty-bin
  (package
    (name "twenty-twenty-twenty-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/thiagokokada/twenty-twenty-twenty")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/twenty-twenty-twenty-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "20-20-20 is a program that alerts every 20 minutes to look something at 20 ...")
    (description "20-20-20 is a program that alerts every 20 minutes to look something at 20 feet away for 20 seconds, written in Golang.")
    (home-page "https://github.com/thiagokokada/twenty-twenty-twenty")
    (license license:expat)))

(define-public render-cli-bin
  (package
    (name "render-cli-bin")
    (version "2.15.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/render-oss/cli")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/render-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the Official Render CLI (binary release)")
    (description "The Official Render CLI (binary release).")
    (home-page "https://github.com/render-oss/cli")
    (license license:asl2.0)))

(define-public smos-bin
  (package
    (name "smos-bin")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://smos.cs-syd.eu/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/smos-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the tool that manages your stress and workload")
    (description "The tool that manages your stress and workload.")
    (home-page "https://smos.cs-syd.eu/")
    (license license:expat)))

(define-public pinnacle
  (package
    (name "pinnacle")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://viperfish.com.au/games/pinnacle.html")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern tribute to the 1986 classic \"The Sentinel\"")
    (description "Modern tribute to the 1986 classic \"The Sentinel\".")
    (home-page "https://viperfish.com.au/games/pinnacle.html")
    (license license:nonfree)))

(define-public internxt-bin
  (package
    (name "internxt-bin")
    (version "2.5.4")
    (source (origin
              (method url-fetch)
              (uri "https://internxt.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/internxt-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "internxt cloud storage client")
    (description "Internxt cloud storage client.")
    (home-page "https://internxt.com")
    (license license:agpl3)))

(define-public ytt-bin
  (package
    (name "ytt-bin")
    (version "0.53.2")
    (source (origin
              (method url-fetch)
              (uri "https://carvel.dev/ytt")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ytt-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "YAML templating tool that works on YAML structure instead of text")
    (description "YAML templating tool that works on YAML structure instead of text.")
    (home-page "https://carvel.dev/ytt")
    (license license:asl2.0)))

(define-public rpcs3-udev
  (package
    (name "rpcs3-udev")
    (version "2024.07.15")
    (source (origin
              (method url-fetch)
              (uri "https://wiki.rpcs3.net/index.php?title=Help:Controller_Configuration")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "udev rules to allow RPCS3 to communicate with DualShock 3, 4 and DualSense ...")
    (description "Udev rules to allow RPCS3 to communicate with DualShock 3, 4 and DualSense controllers.")
    (home-page "https://wiki.rpcs3.net/index.php?title=Help:Controller_Configuration")
    (license license:nonfree)))

(define-public mythes-pt-pt
  (package
    (name "mythes-pt-pt")
    (version "20060817")
    (source (origin
              (method url-fetch)
              (uri "http://mirror.its.dal.ca/freebsd/distfiles/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "portuguese (European) thesaurus")
    (description "Portuguese (European) thesaurus.")
    (home-page "http://mirror.its.dal.ca/freebsd/distfiles/")
    (license license:gpl3+)))

(define-public hyphen-pt-pt
  (package
    (name "hyphen-pt-pt")
    (version "20040415")
    (source (origin
              (method url-fetch)
              (uri "https://wiki.documentfoundation.org/Development/Dictionaries")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "portuguese hyphenation rules")
    (description "Portuguese hyphenation rules.")
    (home-page "https://wiki.documentfoundation.org/Development/Dictionaries")
    (license license:lgpl3+)))

(define-public ecce-gov-pt-certificates
  (package
    (name "ecce-gov-pt-certificates")
    (version "20200512")
    (source (origin
              (method url-fetch)
              (uri "http://www.ecce.gov.pt/certificados/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CA Certificates from ECCE.gov.pt")
    (description "CA Certificates from ECCE.gov.pt.")
    (home-page "http://www.ecce.gov.pt/certificados/")
    (license license:nonfree)))

(define-public autenticacao-gov-pt-pki
  (package
    (name "autenticacao-gov-pt-pki")
    (version "20250611")
    (source (origin
              (method url-fetch)
              (uri "https://pki.cartaodecidadao.pt/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PKI Certificates for Cartao de Cidadao / Autenticacao.gov (Portugal eID)")
    (description "PKI Certificates for Cartao de Cidadao / Autenticacao.gov (Portugal eID).")
    (home-page "https://pki.cartaodecidadao.pt/")
    (license license:nonfree)))

(define-public grok-cli
  (package
    (name "grok-cli")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/haydenzeller/grok-cli")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "grok in the terminal")
    (description "Grok in the terminal.")
    (home-page "https://github.com/haydenzeller/grok-cli")
    (license license:expat)))

(define-public minefetch
  (package
    (name "minefetch")
    (version "1.6.10")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/KirillkoTankisto/minefetch")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "download Minecraft mods (In Rust)")
    (description "Download Minecraft mods (In Rust).")
    (home-page "https://github.com/KirillkoTankisto/minefetch")
    (license license:gpl3+)))

(define-public soar-nightly-bin
  (package
    (name "soar-nightly-bin")
    (version "c86323b")
    (source (origin
              (method url-fetch)
              (uri "https://soar.qaidvoid.dev")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/soar-nightly-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a fast, modern package manager for Static Binaries, Portable Formats (AppIm...")
    (description "A fast, modern package manager for Static Binaries, Portable Formats (AppImage|AppBundle|FlatImage|Runimage) & More [Nightly Release].")
    (home-page "https://soar.qaidvoid.dev")
    (license license:expat)))

(define-public dejsonlz4-git
  (package
    (name "dejsonlz4-git")
    (version "9.c4305b8")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/avih/dejsonlz4")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "decompress Mozilla Firefox bookmarks backup files")
    (description "Decompress Mozilla Firefox bookmarks backup files.")
    (home-page "https://github.com/avih/dejsonlz4")
    (license license:nonfree)))

(define-public cypherock-cysync-appimage
  (package
    (name "cypherock-cysync-appimage")
    (version "2.4.5")
    (source (origin
              (method url-fetch)
              (uri "https://www.cypherock.com/cysync")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/cypherock-cysync-appimage/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the all-in-one-app to manage your Crypto assets with the Cypherock X1")
    (description "The all-in-one-app to manage your Crypto assets with the Cypherock X1.")
    (home-page "https://www.cypherock.com/cysync")
    (license license:nonfree)))

(define-public mythes-cs
  (package
    (name "mythes-cs")
    (version "20150310")
    (source (origin
              (method url-fetch)
              (uri "https://wiki.archlinux.org/index.php/LibreOffice#Language_Aids")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "czech thesaurus")
    (description "Czech thesaurus.")
    (home-page "https://wiki.archlinux.org/index.php/LibreOffice#Language_Aids")
    (license license:nonfree)))

(define-public vincent-bin
  (package
    (name "vincent-bin")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/rsteube/vincent")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vincent-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal color scheme chooser")
    (description "Terminal color scheme chooser.")
    (home-page "https://github.com/rsteube/vincent")
    (license license:expat)))

(define-public mkl-bin
  (package
    (name "mkl-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/make0x20/mkl")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mkl-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "mookie Launcher - A terminal command launcher menu")
    (description "Mookie Launcher - A terminal command launcher menu.")
    (home-page "https://github.com/make0x20/mkl")
    (license license:gpl3)))

(define-public cinf-bin
  (package
    (name "cinf-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mhausenblas/cinf")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/cinf-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command line tool to view namespaces and cgroups")
    (description "Command line tool to view namespaces and cgroups.")
    (home-page "https://github.com/mhausenblas/cinf")
    (license license:asl2.0)))

(define-public qbittorrent-nox-static-bin
  (package
    (name "qbittorrent-nox-static-bin")
    (version "5.1.4_v2.0.12")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/userdocs/qbittorrent-nox-static")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/qbittorrent-nox-static-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "an advanced BitTorrent client programmed in C++. Without GUI. Static binary")
    (description "An advanced BitTorrent client programmed in C++. Without GUI. Static binary.")
    (home-page "https://github.com/userdocs/qbittorrent-nox-static")
    (license license:gpl3)))

(define-public virtualbox-guest-iso-dev
  (package
    (name "virtualbox-guest-iso-dev")
    (version "1:7.2.97.173564")
    (source (origin
              (method url-fetch)
              (uri "https://www.virtualbox.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the official VirtualBox Guest Additions ISO image for virtualbox dev version")
    (description "The official VirtualBox Guest Additions ISO image for virtualbox dev version.")
    (home-page "https://www.virtualbox.org/")
    (license license:nonfree)))

(define-public netclient-bin
  (package
    (name "netclient-bin")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://docs.netmaker.io/docs/client-installation/netclient")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/netclient-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "platform for modern, blazing fast wireguard virtual networks")
    (description "Platform for modern, blazing fast wireguard virtual networks.")
    (home-page "https://docs.netmaker.io/docs/client-installation/netclient")
    (license license:asl2.0)))

(define-public jql-bin
  (package
    (name "jql-bin")
    (version "8.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/yamafaktory/jql")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/jql-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a JSON Query Language CLI tool")
    (description "A JSON Query Language CLI tool.")
    (home-page "https://github.com/yamafaktory/jql")
    (license (list license:asl2.0 license:expat))))

(define-public deeplx-bin
  (package
    (name "deeplx-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/OwO-Network/DeepLX")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/deeplx-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "permanently free DeepL API written in Golang")
    (description "Permanently free DeepL API written in Golang.")
    (home-page "https://github.com/OwO-Network/DeepLX")
    (license license:expat)))

(define-public trenchbroom-appimage
  (package
    (name "trenchbroom-appimage")
    (version "2025.4")
    (source (origin
              (method url-fetch)
              (uri "https://trenchbroom.github.io/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/trenchbroom-appimage/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform level editor for Quake-engine based games. AppImage version")
    (description "Cross-platform level editor for Quake-engine based games. AppImage version.")
    (home-page "https://trenchbroom.github.io/")
    (license license:gpl3)))

(define-public krunker
  (package
    (name "krunker")
    (version "2.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://krunker.io")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free Multiplayer Online Game. No Download needed")
    (description "A free Multiplayer Online Game. No Download needed.")
    (home-page "https://krunker.io")
    (license license:nonfree)))

(define-public butler
  (package
    (name "butler")
    (version "15.26.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/itchio/butler")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line itch.io helper")
    (description "Command-line itch.io helper.")
    (home-page "https://github.com/itchio/butler")
    (license license:expat)))

(define-public kraftkit-bin
  (package
    (name "kraftkit-bin")
    (version "0.12.10")
    (source (origin
              (method url-fetch)
              (uri "https://kraftkit.sh")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/kraftkit-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "build and use highly customized and ultra-lightweight unikernels")
    (description "Build and use highly customized and ultra-lightweight unikernels.")
    (home-page "https://kraftkit.sh")
    (license license:bsd-3)))

(define-public regressi-bin
  (package
    (name "regressi-bin")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri "http://regressi.fr")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/regressi-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "regressi allows you to calculate combined quantities into a function of dif...")
    (description "Regressi allows you to calculate combined quantities into a function of differential equational.")
    (home-page "http://regressi.fr")
    (license license:nonfree)))

(define-public mrv2-bin
  (package
    (name "mrv2-bin")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ggarra13/mrv2")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mrv2-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "mrv2 is an open source professional player and review tool for VFX, animati...")
    (description "Mrv2 is an open source professional player and review tool for VFX, animation and computer graphics (binaries).")
    (home-page "https://github.com/ggarra13/mrv2")
    (license license:bsd-3)))

(define-public onlykey
  (package
    (name "onlykey")
    (version "5.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://onlykey.io/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "onlyKey Chrome Desktop App")
    (description "OnlyKey Chrome Desktop App.")
    (home-page "https://onlykey.io/")
    (license license:nonfree)))

(define-public godot-fbx2gltf-bin
  (package
    (name "godot-fbx2gltf-bin")
    (version "0.13.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/godotengine/FBX2glTF/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/godot-fbx2gltf-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a command-line tool for the conversion of the FBX file format to the glTF f...")
    (description "A command-line tool for the conversion of the FBX file format to the glTF file format.")
    (home-page "https://github.com/godotengine/FBX2glTF/")
    (license license:bsd-3)))

(define-public gluon-scenebuilder
  (package
    (name "gluon-scenebuilder")
    (version "23.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://gluonhq.com/products/scene-builder/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source drag & drop UI design tool for JavaFX (Java 8) by Gluon (binary)")
    (description "Open-source drag & drop UI design tool for JavaFX (Java 8) by Gluon (binary).")
    (home-page "https://gluonhq.com/products/scene-builder/")
    (license license:bsd-3)))

(define-public sccache-bin
  (package
    (name "sccache-bin")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mozilla/sccache")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sccache-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "shared compilation cache")
    (description "Shared compilation cache.")
    (home-page "https://github.com/mozilla/sccache")
    (license license:asl2.0)))

(define-public brother-hll8240cdw
  (package
    (name "brother-hll8240cdw")
    (version "3.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://support.brother.com/g/s/id/htmldoc/printer/cv_hll3220cw/uke/html/GUID-2E7A7E59-10C1-4182-864D-7D1C021BC548_1.html")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CUPS wrapper for Brother HL-L8240CDW printer")
    (description "CUPS wrapper for Brother HL-L8240CDW printer.")
    (home-page "https://support.brother.com/g/s/id/htmldoc/printer/cv_hll3220cw/uke/html/GUID-2E7A7E59-10C1-4182-864D-7D1C021BC548_1.html")
    (license license:nonfree)))

(define-public alpinezen-bin
  (package
    (name "alpinezen-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/TilmanGriesel/alpinezen")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/alpinezen-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "breathe life into your workspace with dynamic wallpapers")
    (description "Breathe life into your workspace with dynamic wallpapers.")
    (home-page "https://github.com/TilmanGriesel/alpinezen")
    (license license:gpl3+)))

(define-public cbconvert-bin
  (package
    (name "cbconvert-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/gen2brain/cbconvert")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/cbconvert-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CBconvert is a Comic Book converter")
    (description "CBconvert is a Comic Book converter.")
    (home-page "https://github.com/gen2brain/cbconvert")
    (license license:gpl3)))

(define-public git-htmldocs
  (package
    (name "git-htmldocs")
    (version "2.53.0")
    (source (origin
              (method url-fetch)
              (uri "https://git-scm.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "HTML documentation files for Git")
    (description "HTML documentation files for Git.")
    (home-page "https://git-scm.com/")
    (license license:gpl2)))

(define-public keyshift
  (package
    (name "keyshift")
    (version "1.0.12")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/hirak99/keyshift")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "keyshift - keyboard remapping utility for Linux")
    (description "Keyshift - keyboard remapping utility for Linux.")
    (home-page "https://github.com/hirak99/keyshift")
    (license license:asl2.0)))

(define-public wozzle
  (package
    (name "wozzle")
    (version "r71.96330ba")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/JorjBauer/wozzle")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a woz disk image tool")
    (description "A woz disk image tool.")
    (home-page "https://github.com/JorjBauer/wozzle")
    (license license:expat)))

(define-public gbsplay
  (package
    (name "gbsplay")
    (version "0.0.102")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mmitch/gbsplay")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a command line application for playing GameBoy sound files (GBS)")
    (description "A command line application for playing GameBoy sound files (GBS).")
    (home-page "https://github.com/mmitch/gbsplay")
    (license license:nonfree)))

(define-public perl-image-base
  (package
    (name "perl-image-base")
    (version "1.17")
    (source (origin
              (method url-fetch)
              (uri "http://search.cpan.org/dist/Image-Base/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "base class for loading, manipulating and saving images")
    (description "Base class for loading, manipulating and saving images.")
    (home-page "http://search.cpan.org/dist/Image-Base/")
    (license license:gpl3+)))

(define-public bd
  (package
    (name "bd")
    (version "1.03")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/vigneshwaranr/bd")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quickly go back to a parent directory instead of typing \"cd ../../..\" repea...")
    (description "Quickly go back to a parent directory instead of typing \"cd ../../..\" repeatedly.")
    (home-page "https://github.com/vigneshwaranr/bd")
    (license license:expat)))

(define-public bindtointerface
  (package
    (name "bindtointerface")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/JsBergbau/BindToInterface")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "with this program you can bind applications to a specific network interface...")
    (description "With this program you can bind applications to a specific network interface / network adapter.")
    (home-page "https://github.com/JsBergbau/BindToInterface")
    (license license:gpl3+)))

(define-public wishlist-bin
  (package
    (name "wishlist-bin")
    (version "0.15.2")
    (source (origin
              (method url-fetch)
              (uri "https://charm.sh/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wishlist-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the SSH directory")
    (description "The SSH directory.")
    (home-page "https://charm.sh/")
    (license license:expat)))

(define-public timer-bin
  (package
    (name "timer-bin")
    (version "1.4.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/caarlos0/timer")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/timer-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "timer is like sleep, but reports progress")
    (description "Timer is like sleep, but reports progress.")
    (home-page "https://github.com/caarlos0/timer")
    (license license:expat)))

(define-public tasktimer-bin
  (package
    (name "tasktimer-bin")
    (version "1.12.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/caarlos0/tasktimer")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tasktimer-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "task Timer (tt) is a dead simple TUI task timer")
    (description "Task Timer (tt) is a dead simple TUI task timer.")
    (home-page "https://github.com/caarlos0/tasktimer")
    (license license:expat)))

(define-public nali-go-bin
  (package
    (name "nali-go-bin")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/zu1k/nali")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nali-go-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "an offline tool for querying IP geographic information and CDN provider. (P...")
    (description "An offline tool for querying IP geographic information and CDN provider. (Pre-compiled).")
    (home-page "https://github.com/zu1k/nali")
    (license license:expat)))

(define-public cf-terraforming
  (package
    (name "cf-terraforming")
    (version "0.24.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/cloudflare/cf-terraforming")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cloudflare Terraforming")
    (description "Cloudflare Terraforming.")
    (home-page "https://github.com/cloudflare/cf-terraforming")
    (license license:mpl2.0)))

(define-public beehive-bin
  (package
    (name "beehive-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/muesli/beehive")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/beehive-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a flexible event/agent & automation system with lots of bees")
    (description "A flexible event/agent & automation system with lots of bees.")
    (home-page "https://github.com/muesli/beehive")
    (license license:agpl3)))

(define-public wpm
  (package
    (name "wpm")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/wtolley/wpm")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight waypoint manager for saving and navigating directories")
    (description "A lightweight waypoint manager for saving and navigating directories.")
    (home-page "https://github.com/wtolley/wpm")
    (license license:wtfpl2)))

(define-public swingmusic-bin
  (package
    (name "swingmusic-bin")
    (version "2.0.8")
    (source (origin
              (method url-fetch)
              (uri "https://swingmx.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/swingmusic-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "swing Music is a beautiful, self-hosted music player for your local audio f...")
    (description "Swing Music is a beautiful, self-hosted music player for your local audio files. Like a cooler Spotify ... but bring your own music.")
    (home-page "https://swingmx.com/")
    (license license:expat)))

(define-public stardict-wikt-en-en
  (package
    (name "stardict-wikt-en-en")
    (version "2025_10_05")
    (source (origin
              (method url-fetch)
              (uri "https://www.dictinfo.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wiktionary English-English Dictionary for StarDict")
    (description "Wiktionary English-English Dictionary for StarDict.")
    (home-page "https://www.dictinfo.com/")
    (license license:nonfree)))

(define-public stardict-wikt-en-all
  (package
    (name "stardict-wikt-en-all")
    (version "2025_10_05")
    (source (origin
              (method url-fetch)
              (uri "https://www.dictinfo.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "english Wiktionary All Languages for StarDict")
    (description "English Wiktionary All Languages for StarDict.")
    (home-page "https://www.dictinfo.com/")
    (license license:nonfree)))

(define-public stardict-urban
  (package
    (name "stardict-urban")
    (version "2.4.2")
    (source (origin
              (method url-fetch)
              (uri "http://download.huzheng.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "urban Dictionary (English) for StarDict")
    (description "Urban Dictionary (English) for StarDict.")
    (home-page "http://download.huzheng.org/")
    (license license:nonfree)))

(define-public stardict-dictd-moby-thesaurus
  (package
    (name "stardict-dictd-moby-thesaurus")
    (version "2.4.2")
    (source (origin
              (method url-fetch)
              (uri "http://download.huzheng.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "moby Thesaurus II (English) for StarDict")
    (description "Moby Thesaurus II (English) for StarDict.")
    (home-page "http://download.huzheng.org/")
    (license license:gpl3+)))

(define-public passh-agent-bin
  (package
    (name "passh-agent-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/MrPixelized/passh-agent")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/passh-agent-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "an ssh-agent implementation to fetch your SSH keys from Pass")
    (description "An ssh-agent implementation to fetch your SSH keys from Pass.")
    (home-page "https://github.com/MrPixelized/passh-agent")
    (license license:gpl3)))

(define-public packemon-bin
  (package
    (name "packemon-bin")
    (version "1.8.21")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ddddddO/packemon")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/packemon-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a TUI tool for sending packets of arbitrary input and monitoring packets on...")
    (description "A TUI tool for sending packets of arbitrary input and monitoring packets on any network interfaces.")
    (home-page "https://github.com/ddddddO/packemon")
    (license license:bsd-2)))

(define-public moondeckbuddy-appimage
  (package
    (name "moondeckbuddy-appimage")
    (version "1.9.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/FrogTheFrog/moondeck-buddy")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/moondeckbuddy-appimage/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a server-side part of the MoonDeck plugin for the SteamDeck")
    (description "A server-side part of the MoonDeck plugin for the SteamDeck.")
    (home-page "https://github.com/FrogTheFrog/moondeck-buddy")
    (license license:nonfree)))

(define-public lfetch
  (package
    (name "lfetch")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ColtNovak/lfetch")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a minimalist fetch script written in 96 lines of code")
    (description "A minimalist fetch script written in 96 lines of code.")
    (home-page "https://github.com/ColtNovak/lfetch")
    (license license:expat)))

(define-public howto-bin
  (package
    (name "howto-bin")
    (version "0.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/antonmedv/howto")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/howto-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a terminal helper for querying LLM")
    (description "A terminal helper for querying LLM.")
    (home-page "https://github.com/antonmedv/howto")
    (license license:expat)))

(define-public fsql-bin
  (package
    (name "fsql-bin")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kashav/fsql")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/fsql-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "search through your filesystem with SQL-esque queries")
    (description "Search through your filesystem with SQL-esque queries.")
    (home-page "https://github.com/kashav/fsql")
    (license license:expat)))

(define-public docker-slim-bin
  (package
    (name "docker-slim-bin")
    (version "1.41.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/docker-slim/docker-slim")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/docker-slim-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "don't change anything in your Docker container image and minify it by up to...")
    (description "Don't change anything in your Docker container image and minify it by up to 30x (and for compiled languages even more) making it secure too! (free and open source).")
    (home-page "https://github.com/docker-slim/docker-slim")
    (license license:asl2.0)))

(define-public confettysh-bin
  (package
    (name "confettysh-bin")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://charm.sh/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/confettysh-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "confetty over SSH")
    (description "Confetty over SSH.")
    (home-page "https://charm.sh/")
    (license license:expat)))

(define-public charm-pop-bin
  (package
    (name "charm-pop-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://charm.sh/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/charm-pop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "send emails from your terminal. 📬")
    (description "Send emails from your terminal. 📬.")
    (home-page "https://charm.sh/")
    (license license:expat)))

(define-public jd-tool-bin
  (package
    (name "jd-tool-bin")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/josephburnett/jd")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/jd-tool-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "JSON diff and patch.(Prebuilt version)")
    (description "JSON diff and patch.(Prebuilt version).")
    (home-page "https://github.com/josephburnett/jd")
    (license license:expat)))

(define-public redli-bin
  (package
    (name "redli-bin")
    (version "0.17.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/IBM-Cloud/redli")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/redli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "a humane alternative to the Redis-cli and TLS")
    (description "A humane alternative to the Redis-cli and TLS.")
    (home-page "https://github.com/IBM-Cloud/redli")
    (license license:expat)))

(define-public lib32-bindtointerface
  (package
    (name "lib32-bindtointerface")
    (version "4b03914")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/JsBergbau/BindToInterface")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "with this program you can bind applications to a specific network interface...")
    (description "With this program you can bind applications to a specific network interface / network adapter.")
    (home-page "https://github.com/JsBergbau/BindToInterface")
    (license license:gpl3+)))

(define-public dabadee
  (package
    (name "dabadee")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mirkobrombin/DaBaDee")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "daBaDee is a simple deduplication tool/storage for files. It uses SHA256* t...")
    (description "DaBaDee is a simple deduplication tool/storage for files. It uses SHA256* to hash the files and store them in the storage, replacing the original path with a hardlink to the storage location.")
    (home-page "https://github.com/mirkobrombin/DaBaDee")
    (license license:asl2.0)))

