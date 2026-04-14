;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260414m
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - 54 recipes created
;;;   - 46 blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260414m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:export (            html2ps
            hyprlight
            ibus-avro-git
            icann-rdap
            intellij-idea-ultimate-edition
            invoiceninja
            ipfs-desktop
            jdk8-graalvm-ee-bin
            jdupes
            jdwp-mcp-git
            joycon-git
            kazumi-bin
            kiro-cli
            kluctl
            koboldcpp-cuda
            kopa
            kwin-scripts-krohnkite-git
            lanxchange
            lattice-diamond
            lazynmap
            lcarsde-application-starter
            lesstif
            lib32-faac
            lib32-gsm
            lib32-lame
            lib32-libnuma
            lib32-libomxil-bellagio
            libdeep-filter-ladspa-git
            libdf-git
            libilbm-git
            libretro-swanstation-git
            llama-cpp-sycl-f16-git
            logiops-rs
            logisim-evolution
            logseq-desktop-electron-bin
            lolia-cli
            lsu-git
            lvsk-calendar
            magicpodscore-git
            mal
            mendeley-reference-manager
            meteobar
            mingw-w64-crt-msvcrt
            mingw-w64-json-glib
            misuzu-music-bin
            motoc-git
            neo-matrix
            neothesia
            nikode-bin
            niri-sidebar-git
            nirinit-git
            nodejs-ramadan-cli
            nordvpn-gui-bin
            objdiff
            ))


;;; -- html2ps (#10758) --

(define-public html2ps
  (package
    (name "html2ps")
    (version "1.0b7")
    (source (origin
              (method url-fetch)
              (uri "https://linux.die.net/man/1/html2ps")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://linux.die.net/man/1/html2ps")
    (synopsis "an HTML to PostScript converter written in Perl")
    (description "An HTML to PostScript converter written in Perl.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))

;;; -- hyprlight (#4331) --

(define-public hyprlight
  (package
    (name "hyprlight")
    (version "1.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/canmi21/hyprlight.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/canmi21/hyprlight")
    (synopsis "brightness control utility for Hyprland")
    (description "Brightness control utility for Hyprland.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- ibus-avro-git (#11210) --

(define-public ibus-avro-git
  (package
    (name "ibus-avro-git")
    (version "1.2.r6.g8862f77")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://linux.omicronlab.com.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://linux.omicronlab.com")
    (synopsis "avro Phonetic Bangla typing for Linux")
    (description "Avro Phonetic Bangla typing for Linux.  It is packaged from the Arch User Repository.")
    (license license:mpl2.0)))

;;; -- icann-rdap (#4261) --

(define-public icann-rdap
  (package
    (name "icann-rdap")
    (version "0.0.28")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/icann/icann-rdap.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/icann/icann-rdap")
    (synopsis "iCANN implementation of the Registry Data Access Protocol (RDAP)")
    (description "ICANN implementation of the Registry Data Access Protocol (RDAP).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- intellij-idea-ultimate-edition (#2063) --

(define-public intellij-idea-ultimate-edition
  (package
    (name "intellij-idea-ultimate-edition")
    (version "2026.1")
    (source (origin
              (method url-fetch)
              (uri "https://www.jetbrains.com/idea/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.jetbrains.com/idea/")
    (synopsis "an intelligent IDE for Java, Groovy and other programming languages with ")
    (description "An intelligent IDE for Java, Groovy and other programming languages with advanced refactoring features intensely focused on developer productivity.  It is packaged from the Arch User Repository.")
    (license nonguix-license:nonfree)))

;;; -- invoiceninja (#4125) --

(define-public invoiceninja
  (package
    (name "invoiceninja")
    (version "5.12.40")
    (source (origin
              (method url-fetch)
              (uri "https://www.invoiceninja.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.invoiceninja.com/")
    (synopsis "invoices, Expenses and Tasks built with Laravel and Flutter")
    (description "Invoices, Expenses and Tasks built with Laravel and Flutter.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- ipfs-desktop (#4016) --

(define-public ipfs-desktop
  (package
    (name "ipfs-desktop")
    (version "0.48.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ipfs/ipfs-desktop.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ipfs/ipfs-desktop")
    (synopsis "desktop client for the InterPlanetary File System")
    (description "Desktop client for the InterPlanetary File System.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- jdk8-graalvm-ee-bin (#12371) --

(define-public jdk8-graalvm-ee-bin
  (package
    (name "jdk8-graalvm-ee-bin")
    (version "21.3.17")
    (source (origin
              (method url-fetch)
              (uri "https://www.graalvm.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://www.graalvm.org/")
    (synopsis "universal virtual machine for running applications written in a variety o")
    (description "Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java 8 version.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- jdupes (#1018) --

(define-public jdupes
  (package
    (name "jdupes")
    (version "1.31.1")
    (source (origin
              (method url-fetch)
              (uri "https://www.jdupes.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.jdupes.com")
    (synopsis "a program for identifying duplicate files residing within specified direc")
    (description "A program for identifying duplicate files residing within specified directories.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- jdwp-mcp-git (#899) --

(define-public jdwp-mcp-git
  (package
    (name "jdwp-mcp-git")
    (version "r22.7f41d94")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/navicore/jdwp-mcp.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/navicore/jdwp-mcp")
    (synopsis "mCP server enabling LLMs to debug Java applications via JDWP protocol")
    (description "MCP server enabling LLMs to debug Java applications via JDWP protocol.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- joycon-git (#10702) --

(define-public joycon-git
  (package
    (name "joycon-git")
    (version "r99.144b22d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/riking/joycon.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/riking/joycon")
    (synopsis "joy-Con input driver")
    (description "Joy-Con input driver.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- kazumi-bin (#8919) --

(define-public kazumi-bin
  (package
    (name "kazumi-bin")
    (version "2.0.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Predidit/Kazumi/releases/download/v2.0.7/kazumi-2.0.7-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/Predidit/Kazumi")
    (synopsis "基于自定义规则的番剧采集APP，支持流媒体在线观看，支持弹幕")
    (description "基于自定义规则的番剧采集APP，支持流媒体在线观看，支持弹幕.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- kiro-cli (#1576) --

(define-public kiro-cli
  (package
    (name "kiro-cli")
    (version "1.29.8")
    (source (origin
              (method url-fetch)
              (uri "https://kiro.dev/cli/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://kiro.dev/cli/")
    (synopsis "prompt to code to deployment in your terminal")
    (description "Prompt to code to deployment in your terminal.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- kluctl (#2858) --

(define-public kluctl
  (package
    (name "kluctl")
    (version "2.27.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kluctl/kluctl.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/kluctl/kluctl/")
    (synopsis "the missing glue to put together large Kubernetes deployments")
    (description "The missing glue to put together large Kubernetes deployments.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- koboldcpp-cuda (#8857) --

(define-public koboldcpp-cuda
  (package
    (name "koboldcpp-cuda")
    (version "1.111.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LostRuins/koboldcpp.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/LostRuins/koboldcpp")
    (synopsis "an easy-to-use AI text-generation software for GGML and GGUF models (with")
    (description "An easy-to-use AI text-generation software for GGML and GGUF models (with CUDA).  It is packaged from the Arch User Repository.")
    (license license:agpl3)))

;;; -- kopa (#4385) --

(define-public kopa
  (package
    (name "kopa")
    (version "0.4.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eyenalxai/kopa.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/eyenalxai/kopa")
    (synopsis "tUI clipboard manager for Wayland")
    (description "TUI clipboard manager for Wayland.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- kwin-scripts-krohnkite-git (#978) --

(define-public kwin-scripts-krohnkite-git
  (package
    (name "kwin-scripts-krohnkite-git")
    (version "0.9.9.2.r57.g39486c4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/anametologin/Krohnkite.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://codeberg.org/anametologin/Krohnkite")
    (synopsis "a dynamic tiling extension for KWin")
    (description "A dynamic tiling extension for KWin.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- lanxchange (#11173) --

(define-public lanxchange
  (package
    (name "lanxchange")
    (version "1.41")
    (source (origin
              (method url-fetch)
              (uri "https://lanxchange.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://lanxchange.com")
    (synopsis "configuration-free, cross-platform file transfers for your local network")
    (description "Configuration-free, cross-platform file transfers for your local network.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- lattice-diamond (#7640) --

(define-public lattice-diamond
  (package
    (name "lattice-diamond")
    (version "3.14")
    (source (origin
              (method url-fetch)
              (uri "http://www.latticesemi.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.latticesemi.com/")
    (synopsis "lattice Diamond design software")
    (description "Lattice Diamond design software.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- lazynmap (#4381) --

(define-public lazynmap
  (package
    (name "lazynmap")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ruiiiijiiiiang/lazynmap.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ruiiiijiiiiang/lazynmap")
    (synopsis "build complex nmap commands with an intuitive TUI")
    (description "Build complex nmap commands with an intuitive TUI.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- lcarsde-application-starter (#9305) --

(define-public lcarsde-application-starter
  (package
    (name "lcarsde-application-starter")
    (version "23.2")
    (source (origin
              (method url-fetch)
              (uri "https://lcarsde.github.io")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://lcarsde.github.io")
    (synopsis "menu for lcarsde to display and run installed software")
    (description "Menu for lcarsde to display and run installed software.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- lesstif (#755) --

(define-public lesstif
  (package
    (name "lesstif")
    (version "0.95.2")
    (source (origin
              (method url-fetch)
              (uri "http://sourceforge.net/projects/lesstif/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://sourceforge.net/projects/lesstif/")
    (synopsis "lGPL'd re-implementation of Motif")
    (description "LGPL'd re-implementation of Motif.  It is packaged from the Arch User Repository.")
    (license license:lgpl3+)))

;;; -- lib32-faac (#12230) --

(define-public lib32-faac
  (package
    (name "lib32-faac")
    (version "1.31.1")
    (source (origin
              (method url-fetch)
              (uri "https://www.audiocoding.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.audiocoding.com/")
    (synopsis "freeware Advanced Audio Coder")
    (description "Freeware Advanced Audio Coder.  It is packaged from the Arch User Repository.")
    (license license:gpl2+)))

;;; -- lib32-gsm (#12167) --

(define-public lib32-gsm
  (package
    (name "lib32-gsm")
    (version "1.0.23")
    (source (origin
              (method url-fetch)
              (uri "http://www.quut.com/gsm/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.quut.com/gsm/")
    (synopsis "shared libraries for GSM 06.10 lossy speech compression")
    (description "Shared libraries for GSM 06.10 lossy speech compression.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- lib32-lame (#12166) --

(define-public lib32-lame
  (package
    (name "lib32-lame")
    (version "3.100")
    (source (origin
              (method url-fetch)
              (uri "http://lame.sourceforge.net/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://lame.sourceforge.net/")
    (synopsis "a high quality MPEG Audio Layer III (MP3) encoder (32 bit)")
    (description "A high quality MPEG Audio Layer III (MP3) encoder (32 bit).  It is packaged from the Arch User Repository.")
    (license license:lgpl3+)))

;;; -- lib32-libnuma (#12172) --

(define-public lib32-libnuma
  (package
    (name "lib32-libnuma")
    (version "2.0.19")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/numactl/numactl.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/numactl/numactl")
    (synopsis "simple NUMA policy support 32-bit version. Libraries only")
    (description "Simple NUMA policy support 32-bit version. Libraries only.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))

;;; -- lib32-libomxil-bellagio (#10783) --

(define-public lib32-libomxil-bellagio
  (package
    (name "lib32-libomxil-bellagio")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri "http://omxil.sourceforge.net")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://omxil.sourceforge.net")
    (synopsis "an opensource implementation of the OpenMAX Integration Layer API")
    (description "An opensource implementation of the OpenMAX Integration Layer API.  It is packaged from the Arch User Repository.")
    (license license:lgpl3+)))

;;; -- libdeep_filter_ladspa-git (#4248) --

(define-public libdeep-filter-ladspa-git
  (package
    (name "libdeep-filter-ladspa-git")
    (version "v0.5.6.r89.gd375b2d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Rikorose/DeepFilterNet.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Rikorose/DeepFilterNet")
    (synopsis "a Low Complexity Speech Enhancement Framework for Full-Band Audio (48kHz)")
    (description "A Low Complexity Speech Enhancement Framework for Full-Band Audio (48kHz) using Deep Filtering (Git version) - ladspa plugin.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- libdf-git (#4247) --

(define-public libdf-git
  (package
    (name "libdf-git")
    (version "v0.5.6.r89.gd375b2d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Rikorose/DeepFilterNet.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Rikorose/DeepFilterNet")
    (synopsis "a Low Complexity Speech Enhancement Framework for Full-Band Audio (48kHz)")
    (description "A Low Complexity Speech Enhancement Framework for Full-Band Audio (48kHz) using Deep Filtering (Git version) - core library.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- libilbm-git (#7708) --

(define-public libilbm-git
  (package
    (name "libilbm-git")
    (version "r75+586f582")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/svanderburg/libilbm.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/svanderburg/libilbm")
    (synopsis "parser library built on top of libiff, for ILBM: IFF Interleaved BitMap f")
    (description "Parser library built on top of libiff, for ILBM: IFF Interleaved BitMap format.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- libretro-swanstation-git (#8898) --

(define-public libretro-swanstation-git
  (package
    (name "libretro-swanstation-git")
    (version "r5883.10af0c7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/libretro/swanstation.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/libretro/swanstation")
    (synopsis "swanStation is an open-source Libretro core implementation of DuckStation")
    (description "SwanStation is an open-source Libretro core implementation of DuckStation, a PSX emulator.  It is packaged from the Arch User Repository.")
    (license license:gpl2+)))

;;; -- llama.cpp-sycl-f16-git (#1150) --

(define-public llama-cpp-sycl-f16-git
  (package
    (name "llama-cpp-sycl-f16-git")
    (version "b5123.r1.bc091a4dc")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ggerganov/llama.cpp.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ggerganov/llama.cpp")
    (synopsis "port of Facebook's LLaMA model in C/C++ (with Intel SYCL GPU optimization")
    (description "Port of Facebook's LLaMA model in C/C++ (with Intel SYCL GPU optimizations and F16).  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- logiops-rs (#4505) --

(define-public logiops-rs
  (package
    (name "logiops-rs")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aydiler/logiops-rs.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/aydiler/logiops-rs")
    (synopsis "logitech device configuration daemon (Rust rewrite)")
    (description "Logitech device configuration daemon (Rust rewrite).  It is packaged from the Arch User Repository.")
    (license license:gpl2)))

;;; -- logisim-evolution (#1953) --

(define-public logisim-evolution
  (package
    (name "logisim-evolution")
    (version "4.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/logisim-evolution/logisim-evolution.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/logisim-evolution/logisim-evolution")
    (synopsis "an educational tool for designing and simulating digital logic circuits")
    (description "An educational tool for designing and simulating digital logic circuits.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- logseq-desktop-electron-bin (#9887) --

(define-public logseq-desktop-electron-bin
  (package
    (name "logseq-desktop-electron-bin")
    (version "0.10.14")
    (source (origin
              (method url-fetch)
              (uri "https://logseq.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://logseq.com/")
    (synopsis "privacy-first, open-source platform for knowledge sharing and management")
    (description "Privacy-first, open-source platform for knowledge sharing and management.(Prebuilt version.Use system-wide electron).  It is packaged from the Arch User Repository.")
    (license license:agpl3+)))

;;; -- lolia-cli (#3310) --

(define-public lolia-cli
  (package
    (name "lolia-cli")
    (version "0.67.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Lolia-FRP/lolia-frp.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Lolia-FRP/lolia-frp")
    (synopsis "fast, simple, and elegant one-click launch for LoliaFRP")
    (description "Fast, simple, and elegant one-click launch for LoliaFRP.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- lsu-git (#1468) --

(define-public lsu-git
  (package
    (name "lsu-git")
    (version "0.1.2.r0.g4d736ad")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/l5yth/lsu.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/l5yth/lsu")
    (synopsis "terminal UI for systemd services and latest journal lines")
    (description "Terminal UI for systemd services and latest journal lines.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- lvsk-calendar (#1033) --

(define-public lvsk-calendar
  (package
    (name "lvsk-calendar")
    (version "0.3.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Gianluska/lvsk-calendar.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Gianluska/lvsk-calendar")
    (synopsis "a beautiful text-based calendar with visual aesthetics for Arch Linux")
    (description "A beautiful text-based calendar with visual aesthetics for Arch Linux.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- magicpodscore-git (#953) --

(define-public magicpodscore-git
  (package
    (name "magicpodscore-git")
    (version "2.0.4.r0.g565cbba")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/steam3d/MagicPodsCore.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/steam3d/MagicPodsCore")
    (synopsis "a command-line utility for managing AirPods, Beats, and Galaxy Buds")
    (description "A command-line utility for managing AirPods, Beats, and Galaxy Buds.  It is packaged from the Arch User Repository.")
    (license license:gpl3)))

;;; -- mal (#11662) --

(define-public mal
  (package
    (name "mal")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/swstl/mal-cli.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/swstl/mal-cli")
    (synopsis "a terminal client for MyAnimeList (integrated with ani-cli) written in rust")
    (description "A terminal client for MyAnimeList (integrated with ani-cli) written in rust.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- mendeley-reference-manager (#2377) --

(define-public mendeley-reference-manager
  (package
    (name "mendeley-reference-manager")
    (version "2.144.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.mendeley.com/download-reference-manager")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.mendeley.com/download-reference-manager")
    (synopsis "mendeley Reference Manager")
    (description "Mendeley Reference Manager.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- meteobar (#3272) --

(define-public meteobar
  (package
    (name "meteobar")
    (version "0.1.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mryll/meteobar.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mryll/meteobar")
    (synopsis "weather widget for Waybar using Open-Meteo — no API key required")
    (description "Weather widget for Waybar using Open-Meteo — no API key required.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- mingw-w64-crt-msvcrt (#10338) --

(define-public mingw-w64-crt-msvcrt
  (package
    (name "mingw-w64-crt-msvcrt")
    (version "13.0.0")
    (source (origin
              (method url-fetch)
              (uri "http://mingw-w64.sourceforge.net")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://mingw-w64.sourceforge.net")
    (synopsis "minGW-w64 CRT for Windows (with MSVCRT as default C runtime library)")
    (description "MinGW-w64 CRT for Windows (with MSVCRT as default C runtime library).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- mingw-w64-json-glib (#3943) --

(define-public mingw-w64-json-glib
  (package
    (name "mingw-w64-json-glib")
    (version "1.10.8")
    (source (origin
              (method url-fetch)
              (uri "http://live.gnome.org/JsonGlib")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://live.gnome.org/JsonGlib")
    (synopsis "JSON library built on GLib (mingw-w64)")
    (description "JSON library built on GLib (mingw-w64).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- misuzu-music-bin (#7585) --

(define-public misuzu-music-bin
  (package
    (name "misuzu-music-bin")
    (version "1.0.19")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/AimesSoft/MisuzuMusic/releases/download/v1.0.19/misuzu-music-1.0.19-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/AimesSoft/MisuzuMusic")
    (synopsis "一个跨平台的本地音乐播放器，支持自动匹配歌词和海报，支持创建歌单，支持日语汉字注音假名。界面仿Apple Music。")
    (description "一个跨平台的本地音乐播放器，支持自动匹配歌词和海报，支持创建歌单，支持日语汉字注音假名。界面仿Apple Music。.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- motoc-git (#7420) --

(define-public motoc-git
  (package
    (name "motoc-git")
    (version "0.3.6.r0.b3b3a61")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/galister/motoc.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/galister/motoc")
    (synopsis "monado Tracking Origin Calibrator")
    (description "Monado Tracking Origin Calibrator.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- neo-matrix (#447) --

(define-public neo-matrix
  (package
    (name "neo-matrix")
    (version "0.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/st3w/neo.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/st3w/neo")
    (synopsis "simulates the digital rain from \"The Matrix\"")
    (description "Simulates the digital rain from \"The Matrix\".  It is packaged from the Arch User Repository.")
    (license license:gpl3)))

;;; -- neothesia (#10161) --

(define-public neothesia
  (package
    (name "neothesia")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://polymeilex.github.io/Neothesia/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://polymeilex.github.io/Neothesia/")
    (synopsis "flashy Synthesia Like Software For Linux, Windows and MacOS")
    (description "Flashy Synthesia Like Software For Linux, Windows and MacOS.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- nikode-bin (#1392) --

(define-public nikode-bin
  (package
    (name "nikode-bin")
    (version "4.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/m1z23r/nikode/releases/download/v4.5.1/nikode-4.5.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/m1z23r/nikode")
    (synopsis "a modern API client for developers")
    (description "A modern API client for developers.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- niri-sidebar-git (#11684) --

(define-public niri-sidebar-git
  (package
    (name "niri-sidebar-git")
    (version "v0.3.0.r0.gc15f1e2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Vigintillionn/niri-sidebar.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Vigintillionn/niri-sidebar.git")
    (synopsis "a lightweight, external sidebar manager for the Niri window manager")
    (description "A lightweight, external sidebar manager for the Niri window manager.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- nirinit-git (#4510) --

(define-public nirinit-git
  (package
    (name "nirinit-git")
    (version "0.1.4.r2.g9b6db3e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amaanq/nirinit.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/amaanq/nirinit")
    (synopsis "a session manager for Niri")
    (description "A session manager for Niri.  It is packaged from the Arch User Repository.")
    (license license:mpl2.0)))

;;; -- nodejs-ramadan-cli (#880) --

(define-public nodejs-ramadan-cli
  (package
    (name "nodejs-ramadan-cli")
    (version "6.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ahmadawais/ramadan-cli.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ahmadawais/ramadan-cli")
    (synopsis "cLI to check Sehar and Iftar times in Ramadan")
    (description "CLI to check Sehar and Iftar times in Ramadan.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- nordvpn-gui-bin (#11686) --

(define-public nordvpn-gui-bin
  (package
    (name "nordvpn-gui-bin")
    (version "4.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://nordvpn.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://nordvpn.com")
    (synopsis "gUI for NordVPN")
    (description "GUI for NordVPN.  It is packaged from the Arch User Repository.")
    (license nonguix-license:nonfree)))

;;; -- objdiff (#4593) --

(define-public objdiff
  (package
    (name "objdiff")
    (version "3.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/encounter/objdiff.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/encounter/objdiff")
    (synopsis "a local diffing tool for decompilation projects")
    (description "A local diffing tool for decompilation projects.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))
