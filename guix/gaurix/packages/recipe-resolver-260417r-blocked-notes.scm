;;; Blocked notes for recipe-resolver-260417r
;;; 9 packages blocked.
;;;
;;; #14759. deemix-gui-appimage
;;;    SOURCE_UNAVAILABLE: deemix project has been taken down; no stable source URL available; GitHub repos archived/removed; next action: monitor for community forks
;;;
;;; #14769. intel-level-zero-raytracing-support-git
;;;    DEP_RESOLUTION_FAILED: requires Intel Level Zero SDK, OneAPI DPC++ compiler, and proprietary ray tracing libraries not in Guix; next action: package Level Zero SDK first
;;;
;;; #14814. clangd-opt-git
;;;    NEEDS_RECIPE_DESIGN: requires full LLVM/Clang build from git trunk with custom patches; 1h+ build time; 50GB+ build space; next action: evaluate binary packaging or LLVM module reuse
;;;
;;; #14818. ffmpeg-obs
;;;    NEEDS_RECIPE_DESIGN: requires custom FFmpeg build with OBS-specific patches; conflicts with system FFmpeg; complex configure flags; next action: design non-conflicting variant recipe
;;;
;;; #14828. vlc-plugin-luajit
;;;    NEEDS_RECIPE_DESIGN: requires full VLC rebuild with LuaJIT replacing Lua; conflicts with system VLC; complex autotools build with 60+ deps; next action: design non-conflicting variant
;;;
;;; #14829. vlc-luajit
;;;    NEEDS_RECIPE_DESIGN: requires full VLC rebuild with LuaJIT; conflicts with system VLC package; 60+ build dependencies; next action: design as vlc-luajit variant of upstream vlc recipe
;;;
;;; #14830. libvlc-luajit
;;;    NEEDS_RECIPE_DESIGN: same VLC rebuild issue as vlc-luajit; library output of VLC variant package; next action: implement as output of vlc-luajit recipe
;;;
;;; #14846. texlive-full
;;;    NEEDS_RECIPE_DESIGN: 8GB ISO image; Guix has modular texlive packaging; this is an Arch-specific full-install pattern; next action: create meta-package referencing Guix texlive modules
;;;
;;; #14847. nvidia-patch
;;;    LICENSE_REVIEW_NEEDED: patches proprietary Nvidia driver binaries to remove license restrictions; may violate Nvidia EULA; circumvents technical protection measures; next action: legal review
;;;
