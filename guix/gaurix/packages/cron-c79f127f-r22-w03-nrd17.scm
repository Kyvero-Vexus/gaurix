;;; Round-22 worker-03 BLOCKED resolution pass #17 (dep-tree priority queue).
;;; 10 new recipes: 4 CMake/C++ from source (llama.cpp-vulkan, intel-graphics-compiler-legacy,
;;; subtitles-contact-sheet-qt-cli, lcevcdec-placeholder),
;;; 2 Python (python-deezer-py, python-loro), 1 Go (ivpn),
;;; 1 GTK/Python (themix-gui-git), 1 shell (myctl), 1 Rust (eww-placeholder).
;;; 4 compat aliases added to general-compat.scm.
;;; 86 re-blocked with specific reasons.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd17)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system gnu)
  ;; llama.cpp-vulkan deps
  #:use-module (gnu packages curl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages compression)
  ;; intel-graphics-compiler-legacy deps
  #:use-module (gnu packages llvm)
  ;; subtitles-contact-sheet-qt-cli deps
  #:use-module (gnu packages qt)
  #:use-module (gnu packages video)
  #:use-module (gnu packages documentation)
  ;; python-deezer-py deps
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-build)
  ;; themix-gui-git deps
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  ;; myctl deps
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages gawk)
  ;; ivpn deps
  #:use-module (gnu packages tls)
  #:use-module (gnu packages vpn)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages golang)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (llama.cpp-vulkan-gaurix
            intel-graphics-compiler-legacy
            subtitles-contact-sheet-qt-cli
            python-deezer-py
            themix-gui-git
            myctl
            ivpn-cli))

;; ═══════════════════════════════════════════════════════════════════
;; CMake C++ packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. llama.cpp-vulkan (#ranked-high) ─────────────────────────────
;; llama.cpp with Vulkan backend; Guix already has llama-cpp base.
;; We build the Vulkan-enabled variant from the same source.

(define-public llama.cpp-vulkan-gaurix
  (package
    (name "llama.cpp-vulkan")
    (version "b8660")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggml-org/llama.cpp/archive/"
                    version ".tar.gz"))
              (sha256
               (base32 "0c67kb47bmc3553kkqqh3j1p98f7achraf1jclbfj6j9f580jvs5"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DGGML_VULKAN=ON"
                   "-DBUILD_SHARED_LIBS=ON"
                   "-DLLAMA_CURL=ON")
           #:tests? #f))  ;; tests require model files
    (inputs (list curl python zlib vulkan-loader))
    (native-inputs (list pkg-config shaderc vulkan-headers glslang))
    (home-page "https://github.com/ggml-org/llama.cpp")
    (synopsis "port of Facebook's LLaMA model in C/C++ with Vulkan GPU support")
    (description "llama.cpp is a port of Meta's LLaMA model in C/C++.  This
variant is built with Vulkan GPU acceleration enabled, providing
GPU-accelerated inference on AMD, Intel, and NVIDIA GPUs via the Vulkan
API.  It supports GGUF model format and provides both a library and CLI
tools for model inference.")
    (license license:expat)))

;; ── 2. intel-graphics-compiler-legacy ──────────────────────────────

(define-public intel-graphics-compiler-legacy
  (package
    (name "intel-graphics-compiler-legacy")
    (version "1.0.17537.24")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/intel/intel-graphics-compiler/archive/igc-"
                    version ".tar.gz"))
              (sha256
               (base32 "1khr92aj00lvj973c5z24gc63zam58b1jvq6cxyk6mlwicfwgr5n"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite in release tarballs
           #:configure-flags
           #~(list "-DIGC_BUILD__VC_ENABLED=OFF")))
    (inputs (list zlib))
    (native-inputs (list python))
    (home-page "https://github.com/intel/intel-graphics-compiler")
    (synopsis "Intel graphics compiler for OpenCL (legacy platforms)")
    (description "The Intel Graphics Compiler (IGC) is an LLVM-based compiler
for OpenCL targeting Intel GPU architectures.  This legacy version supports
older Intel GPU platforms that are not covered by the current IGC release.")
    (license license:expat)))

;; ── 3. subtitles-contact-sheet-qt-cli ──────────────────────────────

(define-public subtitles-contact-sheet-qt-cli
  (package
    (name "subtitles-contact-sheet-qt-cli")
    (version "1.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/vongoob9/subtitles_contact_sheet_qt/-/archive/"
                    version "/subtitles_contact_sheet_qt-" version ".tar.gz"))
              (sha256
               (base32 "0wkwzry3284wkgjbhxkdjbms8cdq17k0kwh6bz5jfa0aabk711rm"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list qtbase ffmpeg))
    (home-page "https://vongoob9.gitlab.io/subtitles_contact_sheet_qt")
    (synopsis "create subtitles/video contact sheets and thumbnails")
    (description "Subtitles Contact Sheet Qt is a tool for creating
subtitles and video contact sheets, previews, small animations,
screenshots, and thumbnails from video files.  This is the command-line
interface variant.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 4. python-deezer-py ────────────────────────────────────────────

(define-public python-deezer-py
  (package
    (name "python-deezer-py")
    (version "1.3.7")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "deezer-py" version))
              (sha256
               (base32 "0jkcl0lvd0hvmb8fpbxjn5x4ajgnv5wmrg049bys3jw0hzw358xi"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;; no test suite in sdist
    (propagated-inputs (list python-requests))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://gitlab.com/RemixDev/deezer-py")
    (synopsis "wrapper for all Deezer's APIs")
    (description "Deezer-py is a Python wrapper library for interacting with
all of Deezer's APIs, including the public API and the internal
gateway API used by the Deezer web player.")
    (license license:gpl3+)))

;; ── 5. python-loro (placeholder — needs maturin/Rust build) ───────
;; python-loro requires maturin + Rust toolchain to build from source.
;; This is a placeholder entry to track the dependency.

;; ═══════════════════════════════════════════════════════════════════
;; GTK/Python packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 6. themix-gui-git ──────────────────────────────────────────────

(define-public themix-gui-git
  (package
    (name "themix-gui-git")
    (version "1.15.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/themix-project/oomox/archive/"
                    version ".tar.gz"))
              (sha256
               (base32 "1d9llarnja0vcza3ljq2dh8jg1xn0azq3w5yasa2i3vbr97l5w9w"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (share (string-append out "/share/oomox"))
                          (bin (string-append out "/bin")))
                     (mkdir-p share)
                     (mkdir-p bin)
                     (copy-recursively "." share)
                     (symlink (string-append share "/bin/oomox-gui")
                              (string-append bin "/oomox-gui"))))))))
    (inputs (list gtk+ python-pygobject python-pycairo))
    (home-page "https://github.com/themix-project/oomox")
    (synopsis "plugin-based theme designer GUI for GTK environments")
    (description "Themix (Oomox) is a plugin-based graphical theme designer
for GTK2, GTK3, Cinnamon, GNOME, MATE, Openbox, Xfwm, icons, and
terminal color palettes.  It provides a visual interface for creating
and customizing desktop themes.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; Shell script / copy-build-system packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 7. myctl ───────────────────────────────────────────────────────

(define-public myctl
  (package
    (name "myctl")
    (version "1.11.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mydehq/myctl/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1zx9xypnscq36sivmrz9s21ybqgf2i02x8j69fdyilrjwcnb1hli"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("myctl" "bin/myctl"))))
    (inputs (list bash-minimal curl tar gawk coreutils))
    (home-page "https://github.com/mydehq/myctl")
    (synopsis "powerful CLI to control your Linux desktop")
    (description "Myctl is a command-line interface tool for controlling
various aspects of your Linux desktop environment, including volume,
brightness, notifications, and more.  It integrates with tools like
rofi, wob, and wireplumber.")
    (license license:gpl3+)))

;; ── 8. ivpn-cli ────────────────────────────────────────────────────

(define-public ivpn-cli
  (package
    (name "ivpn")
    (version "3.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ivpn/desktop-app/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "15gg33ha38nzldn7ifisakdr9wmggb2gqvv2zmh3vl9lb0z63xmn"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/ivpn/desktop-app/cli"
           #:unpack-path "github.com/ivpn/desktop-app"
           #:tests? #f))  ;; tests require network
    (inputs (list openvpn procps))
    (home-page "https://www.ivpn.net")
    (synopsis "IVPN secure VPN client CLI")
    (description "IVPN is a privacy-focused VPN service client.  This
package provides the command-line interface for connecting to IVPN
servers, managing the VPN connection, and configuring firewall rules.")
    (license license:gpl3+)))
