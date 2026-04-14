;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260414y
;;; 26 packages marked NEEDS_RECIPE_DESIGN_EXHAUSTED

(define-module (gaurix packages recipe-resolver-260414y-blocked-notes)
  #:export (recipe-resolver-260414y-blocked-notes))

(define recipe-resolver-260414y-blocked-notes
  (list
   (list "linux-show-player" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "DEPS_CHAIN_TOO_DEEP: Python cue player needs 6+ missing Python packages (python-falcon, python-mido, python-jack-client, python-rtmidi, python-pyalsa, python-pyliblo, python-qdigitalmeter); each with C extension deps")
   (list "neovim-later" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "ROLLING_RELEASE: monthly dev branch snapshot with custom version scheme; upstream Guix already has neovim; 14+ tree-sitter grammars pinned; no value over upstream neovim")
   (list "distroav" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "PROPRIETARY_DEP: OBS Studio NDI plugin depends on proprietary libndi SDK (Vizrt/NewTek); OBS Studio also not in Guix; two blockers")
   (list "am" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "ROLLING_RELEASE: no versioned releases; pulls rolling scripts from main branch; AppImage manager downloads at runtime; not reproducible-packageable")
   (list "codex-app-bin" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "ELECTRON_APP + NO_LICENSE: unofficial macOS Codex port; builds with Node.js/pnpm/Electron (not prebuilt); 4 commits, no releases, no license declared; Arch-specific")
   (list "nblood-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "BUILD_SYSTEM_TOO_COMPLEX: Blood/EDuke32 C++ port; custom GNUmakefile with 40+ makedeps; NASM assembly; no cmake alternative; no prebuilt binaries")
   (list "nodejs-nativefier" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "OBSOLETE: nativefier project is archived/deprecated; recommends alternatives (Pake, electron-forge); no maintained source")
   (list "vstax" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "PROPRIETARY: closed-source regional tax software (Canton of Valais, Switzerland); no source code; license unknown")
   (list "shelly-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "ARCH_SPECIFIC + DOTNET_REQUIRED: Arch package manager depending on pacman/ALPM; requires dotnet-sdk-10.0 (.NET) not in Guix; no utility on Guix")
   (list "omnissa-horizon-integrated-printing" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "PROPRIETARY: proprietary VMware/Omnissa binary; no source code; custom license; requires proprietary omnissa-horizon-client")
   (list "winboat" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "BUILD_SYSTEM_TOO_COMPLEX: Go+npm dual ecosystem build with FreeRDP+GTK3; no prebuilt binary; requires both Go and Node.js build chains simultaneously")
   (list "xlibre-video-nouveau" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "DEPS_CHAIN_TOO_DEEP: requires xlibre-xserver>=25.0 not in Guix; XLibre is X.Org fork; upstream Guix already has xf86-video-nouveau for standard X.Org")
   (list "mintsysadm" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "DEPS_CHAIN_TOO_DEEP: Linux Mint system administration tool; depends on xapp, python-xapp, mintcommon (Mint-specific libraries not in Guix)")
   (list "waytermirror-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "ROLLING_RELEASE + SYSTEMD_REQUIRED: no versioned releases (r311.ca32204); depends on systemd-libs (Guix uses elogind); also needs wlroots version compatibility")
   (list "lxqt-panel-tool-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "DEPS_UNAVAILABLE: Python/PyQt6 application; PyQt6 (python-pyqt6) not packaged in Guix; Guix only has PyQt5 (python-pyqt)")
   (list "hyprsettings-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "DEPS_UNAVAILABLE: Python/JS/C++ hybrid using PyWebviewGTK; python-pywebview not in Guix; pywebview needs webkit2gtk Python bindings not packaged")
   (list "cyberdropdownloader" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "DEPS_CHAIN_TOO_DEEP: 29 runtime deps; 7 missing (python-curl-cffi, python-inquirerpy, python-m3u8, python-myjdapi, python-asyncpraw, python-aiolimiter, python-get-video-properties); python-curl-cffi wraps curl-impersonate")
   (list "2s2h-otr-exporter" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "BUILD_SYSTEM_TOO_COMPLEX: OTR exporter from 2Ship2Harkinian game engine; requires git submodules (libultraship, ZAPDTR); must target specific cmake component from large repo")
   (list "lldb-zig-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "ROLLING_RELEASE: git snapshot of LLVM/LLDB fork with Zig debug patches; enormous codebase; upstream Guix already has lldb")
   (list "aegnux" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "PROPRIETARY: Wine-based installer for proprietary Adobe After Effects; also requires pyside6 (not in Guix) and downloads proprietary binaries at install time")
   (list "python-eduvpn-client" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "DEPS_CHAIN_TOO_DEEP: requires python-eduvpn-common which is a Go library compiled via Cgo into shared lib with Python bindings; non-trivial hybrid Go+Python build")
   (list "path-of-building-community-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "BUILD_SYSTEM_TOO_COMPLEX: custom Qt6+LuaJIT frontend (PoBFrontend); git snapshot; missing lua51-utf8; requires packaging custom C++ app + Lua ecosystem")
   (list "staruml" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "PROPRIETARY: commercial software requiring paid license; distributed as prebuilt Electron binary; no source code available")
   (list "linux-lts515" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "KERNEL_BUILD: vanilla Linux 5.15.202 with Arch config; Guix already has linux-libre 5.15.200; non-libre kernel contradicts Guix policy")
   (list "linux-lts515-headers" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "KERNEL_BUILD: headers for linux-lts515; Guix already has linux-libre-headers 5.15.200; tied to blocked kernel package above")
   (list "vapoursynth-tools-genstubs-git" "NEEDS_RECIPE_DESIGN_EXHAUSTED"
         "ROLLING_RELEASE: git snapshot (r459.4176ac7) from vsrepo repo; no versioned releases; VapourSynth stub generator is niche utility with 1 AUR vote")))
