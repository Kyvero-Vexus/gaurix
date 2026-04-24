;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260423j
;;; Resolves 9 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (9):
;;;      1.  ghidra-git (gnu-build-system, v11.4.3.r1035.ccfea7e4c0, license:asl2.0)
;;;      2.  ntfs2btrfs-git (cmake-build-system, v20250616.r0.g2b4e00a, license:gpl2+)
;;;      3.  python-frida-bin (copy-build-system, v17.9.1, license:non-copyleft)
;;;      4.  project-registry (node-build-system, v0.4.2, license:expat)
;;;      5.  python-frida-tools (pyproject-build-system, v14.5.0, license:non-copyleft)
;;;      6.  dingtalk-wayland-screenshare-git (cmake-build-system, v0.1.0, license:expat)
;;;      7.  vrcx-git (node-build-system, v2026.02.11.r463.g92ae1c5, license:expat)
;;;      8.  tabby (node-build-system, v1.0.230, license:expat)
;;;      9.  wiliwili-wayland (cmake-build-system, v1.5.3, license:gpl3+)
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260423j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (ghidra-git
            ntfs2btrfs-git
            python-frida-bin
            project-registry
            python-frida-tools
            dingtalk-wayland-screenshare-git
            vrcx-git
            tabby
            wiliwili-wayland
))

(define-public ghidra-git
  (package
    (name "ghidra-git")
    (version "11.4.3.r1035.ccfea7e4c0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ghidra-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "software reverse engineering framework (git)")
    (description "Software reverse engineering framework (git).")
    (home-page "https://www.nsa.gov/ghidra")
    (license license:asl2.0)))

(define-public ntfs2btrfs-git
  (package
    (name "ntfs2btrfs-git")
    (version "20250616.r0.g2b4e00a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maharmstone/ntfs2btrfs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "in-place conversion of Microsoft's NTFS filesystem to the open-source files..")
    (description "In-place conversion of Microsoft's NTFS filesystem to the open-source filesystem Btrfs.")
    (home-page "https://github.com/maharmstone/ntfs2btrfs")
    (license license:gpl2+)))

(define-public python-frida-bin
  (package
    (name "python-frida-bin")
    (version "17.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-frida-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and An..")
    (description "Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 binary version from PyPi.")
    (home-page "https://www.frida.re")
    (license license:non-copyleft)))

(define-public project-registry
  (package
    (name "project-registry")
    (version "0.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/HichemTab-tech/project-registry")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a developer CLI that starts projects from named templates backed by shell c..")
    (description "A developer CLI that starts projects from named templates backed by shell commands.")
    (home-page "https://github.com/HichemTab-tech/project-registry")
    (license license:expat)))

(define-public python-frida-tools
  (package
    (name "python-frida-tools")
    (version "14.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-frida-tools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cLI tools for Frida. Python 3 version from PyPi")
    (description "CLI tools for Frida. Python 3 version from PyPi.")
    (home-page "http://www.frida.re")
    (license license:non-copyleft)))

(define-public dingtalk-wayland-screenshare-git
  (package
    (name "dingtalk-wayland-screenshare-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yatli/dingtalk-wayland-screencast")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wayland screen sharing hook for Dingtalk (via xdg-desktop-portal + pipewire)")
    (description "Wayland screen sharing hook for Dingtalk (via xdg-desktop-portal + pipewire).")
    (home-page "https://github.com/yatli/dingtalk-wayland-screencast")
    (license license:expat)))

(define-public vrcx-git
  (package
    (name "vrcx-git")
    (version "2026.02.11.r463.g92ae1c5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vrcx-team/VRCX")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "friendship management tool for VRChat (git version built with Electron)")
    (description "Friendship management tool for VRChat (git version built with Electron).")
    (home-page "https://github.com/vrcx-team/VRCX")
    (license license:expat)))

(define-public tabby
  (package
    (name "tabby")
    (version "1.0.230")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tabby.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a terminal for a more modern age")
    (description "A terminal for a more modern age.")
    (home-page "https://tabby.sh")
    (license license:expat)))

(define-public wiliwili-wayland
  (package
    (name "wiliwili-wayland")
    (version "1.5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xfangfang/wiliwili")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "专为手柄控制设计的第三方跨平台B站客户端, 使用 Wayland 运行并阻止唤醒独显")
    (description "专为手柄控制设计的第三方跨平台B站客户端, 使用 Wayland 运行并阻止唤醒独显.")
    (home-page "https://github.com/xfangfang/wiliwili")
    (license license:gpl3+)))
