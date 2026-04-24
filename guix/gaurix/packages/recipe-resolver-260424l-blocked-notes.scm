;;; recipe-resolver-260424l -- blocked notes
;;; 15 packages blocked this pass.

;;; 1. arm-linux-gnueabihf-gdb (#17714)
;;;    DEP_RESOLUTION_FAILED: Cross-compilation toolchain package, requires arm-linux-gnueabihf cross-compilation infrastructure not available in Guix

;;; 2. nvidia-bl-dkms (#17755)
;;;    BUILD_FAILED: DKMS kernel module, requires Linux kernel headers and DKMS framework; kernel module packaging complex in Guix

;;; 3. brother-mfc-l2400dw (#17797)
;;;    LICENSE_REVIEW_NEEDED: Brother printer driver, proprietary binary blob with custom license requiring review

;;; 4. guile-git-lib (#17802)
;;;    DEP_RESOLUTION_FAILED: Guile bindings for libgit2; likely already available as guile-git in upstream Guix

;;; 5. plasma6-applets-panon (#17808)
;;;    DEP_RESOLUTION_FAILED: KDE Plasma 6 applet requiring full Plasma 6 framework not yet in Guix

;;; 6. squareline-studio (#17812)
;;;    SOURCE_UNAVAILABLE: Commercial proprietary GUI tool, no public download URL available without account

;;; 7. inkdrop (#17819)
;;;    SOURCE_UNAVAILABLE: Commercial proprietary note-taking app, requires paid license to download

;;; 8. n8n (#17807)
;;;    DEP_RESOLUTION_FAILED: Complex Node.js application with hundreds of npm dependencies; node-build-system cannot handle this dependency tree

;;; 9. heroku-cli (#17796)
;;;    DEP_RESOLUTION_FAILED: Complex Node.js CLI with massive npm dependency tree

;;; 10. euroscope-bin (#17945)
;;;     SOURCE_UNAVAILABLE: Windows-only VATSIM radar scope software, no Linux binary available

;;; 11. lightdm-webkit-theme-aether (#19028)
;;;     DEP_RESOLUTION_FAILED: Requires lightdm-webkit2-greeter which is not in Guix

;;; 12. qtspim-iconfix (#18421)
;;;     BUILD_FAILED: Qt MIPS simulator requiring specific Qt5 patches; complex build with custom icon patches

;;; 13. illogical-impulse-oneui4-icons-git (#18595)
;;;     SOURCE_UNAVAILABLE: Fork from specific dotfiles repo; unstable git-only source with no releases

;;; 14. chromium-material-icons-for-github-bin (#18602)
;;;     NEEDS_RECIPE_DESIGN: Browser extension, packaging model unclear for Guix

;;; 15. ttf-consolas-ligaturized (#20499)
;;;     LICENSE_REVIEW_NEEDED: Based on Microsoft Consolas font which has restrictive licensing; redistribution legality unclear
