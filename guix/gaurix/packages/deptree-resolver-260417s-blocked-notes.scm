;;; deptree-resolver-260417s — blocked notes
;;;
;;; 2 packages resolved with new recipes
;;; 94 packages already resolved in prior passes (marked DONE)
;;; 4 packages remain BLOCKED
;;;
;;; ARCH_SPECIFIC (2 packages):
;;;   yay (#21311): Arch Linux specific package (pacman/AUR tooling); existing recipes: ['queue-20260330p100daily6.scm', 'queue-20260329p100.scm', 'deptree-resolver-260416a.scm', 'deptree-resolver-260413c.scm', 'general-compat.scm', 'deptree-resolver-260415v.scm', 'queue-20260324p100b.scm', 'cron-c79f127f-r22-w03-nrd18-blocked-notes.scm', 'auto-deptree-260406-blocked-notes.scm', 'cron-5a2fb251-r14-w01.scm', 'deptree-resolver-260414c.scm', 'cron-c79f127f-r22-w03-nrd17-blocked-notes.scm']
;;;   archlinux-java-run (#12875): Arch Linux specific package (pacman/AUR tooling); existing recipes: ['deptree-resolver-260414q.scm', 'cron-c79f127f-w02.scm', 'deptree-resolver-260408e.scm', 'cron-c79f127f-r8-w01.scm', 'cron-c79f127f-r13-w03.scm', 'cron-5a2fb251-r14-w01.scm']
;;;
;;; MULTILIB (2 packages):
;;;   lib32-gstreamer (#33315): Guix uses separate i686-linux system builds instead of lib32 overlay
;;;   lib32-libvmaf (#2366): Guix uses separate i686-linux system builds instead of lib32 overlay
;;;
;;; ALREADY_RESOLVED (94 packages, marked DONE):
;;;   nvidia-utils-beta (#2351): Recipe already exists in deptree-resolver-260413n.scm
;;;   auto-auto-complete (#7413): Recipe already exists in queue-20260407-deptree-resolver.scm
;;;   python-questionary (#8095): Recipe already exists in cron-c79f127f-r23-w03.scm
;;;   xlibre-xserver-common-git (#6172): Recipe already exists in deptree-resolver-260414q.scm
;;;   qt5-wayland-decorations (#7434): Recipe already exists in general-compat.scm
;;;   qt5-doc (#11679): Recipe already exists in deptree-resolver-260414q.scm
;;;   gurobi (#8076): Proprietary license but recipe exists in queue-20260401p100daily4.scm (license:non-copyleft)
;;;   libelectron (#5325): Recipe already exists in deptree-resolver-260414q.scm
;;;   mozc-ut-full-common (#6042): Recipe already exists in deptree-resolver-260408e.scm
;;;   wayfire (#466): Recipe already exists in deptree-resolver-260414q.scm
;;;   java-openjfx (#11085): Recipe already exists in deptree-resolver-260413c.scm
;;;   sonic-win (#1915): Recipe already exists in deptree-resolver-260414q.scm
;;;   logmein-hamachi (#1958): Recipe already exists in queue-20260407-deptree-resolver.scm
;;;   samsung-unified-driver-common (#651): Recipe already exists in recipe-design-20260402-chunk5.scm
;;;   deb2targz (#4242): Recipe already exists in deptree-resolver-260414q.scm
;;;   dotnet-targeting-pack-8.0-bin (#15163): Recipe already exists in deptree-resolver-260415i.scm
;;;   owlry-plugin-converter (#13449): Recipe already exists in deptree-resolver-260414q.scm
;;;   xone-dongle-firmware (#12011): Recipe already exists in deptree-resolver-260414q.scm
;;;   android-sdk-build-tools (#991): Recipe already exists in queue-20260404-w05.scm
;;;   mozc (#245): Recipe already exists in recipe-resolver-260413ab.scm
;;;   smpq (#5147): Recipe already exists in deptree-resolver-260414q.scm
;;;   python-opentelemetry-proto (#12075): Recipe already exists in deptree-resolver-260413f.scm
;;;   bms-shell (#6310): Recipe already exists in deptree-resolver-260408e.scm
;;;   dotnet-runtime-8.0-bin (#15165): Recipe already exists in deptree-resolver-260415i.scm
;;;   lcevcdec (#5046): Recipe already exists in deptree-resolver-260414q.scm
;;;   python-inquirerpy (#3882): Recipe already exists in deptree-resolver-260414q.scm
;;;   qtutilities (#10942): Recipe already exists in deptree-260407.scm
;;;   aimp (#11562): Recipe already exists in deptree-resolver-260413b.scm
;;;   gslapper (#6326): Recipe already exists in deptree-resolver-260414q.scm
;;;   gradle8 (#3795): Recipe already exists in deptree-resolver-260414q.scm
;;;   asusctl (#11697): Recipe already exists in deptree-resolver-260414q.scm
;;;   jdk23-openjdk (#13946): Recipe already exists in deptree-resolver-260415h.scm
;;;   ros2-arch-deps (#4822): Recipe already exists in deptree-resolver-260414q.scm
;;;   brother-lpr-drivers-common (#8601): Proprietary license but recipe exists in queue-20260401p100daily7.scm (license:non-copyleft)
;;;   genders (#7422): Recipe already exists in deptree-resolver-260414q.scm
;;;   gst-thumbnailers (#6543): Not in AUR cache but recipe exists in queue-20260330p100daily6.scm
;;;   hyprshot (#62): Not in AUR cache but recipe exists in queue-20260404-daily3.scm
;;;   keychron-link-udev (#4168): Recipe already exists in queue-20260407-deptree-resolver.scm
;;;   libfmod (#7233): Recipe already exists in cron-c79f127f-w09.scm
;;;   tosu (#6382): Recipe already exists in general-compat.scm
;;;   upd72020x-fw (#178): Recipe already exists in recipe-resolver-260413m.scm
;;;   waydroid (#57): Not in AUR cache but recipe exists in queue-20260406-blocked-tree.scm
;;;   aspnet-runtime-preview-bin (#10129): Recipe already exists in deptree-resolver-260408e.scm
;;;   ledger-udev (#951): Recipe already exists in general-compat.scm
;;;   wd719x-firmware (#1900): Recipe already exists in deptree-260407.scm
;;;   elephant-archlinuxpkgs-bin (#3586): Recipe already exists in queue-20260407-deptree-resolver.scm
;;;   elephant-bluetooth-bin (#3587): Recipe already exists in recipe-resolver-260416i.scm
;;;   elephant-desktopapplications-bin (#3583): Recipe already exists in queue-20260407-deptree-resolver.scm
;;;   elephant-menus-bin (#3581): Recipe already exists in queue-20260407-deptree-resolver.scm
;;;   elephant-providerlist-bin (#3580): Recipe already exists in recipe-resolver-260416i.scm
;;;   elephant-runner-bin (#3579): Recipe already exists in queue-20260407-deptree-resolver.scm
;;;   elephant-symbols-bin (#3578): Recipe already exists in queue-20260407-deptree-resolver.scm
;;;   mipsel-linux-gnu-binutils (#11077): Cross-compilation toolchain; recipe exists in deptree-resolver-260408d.scm
;;;   php74-igbinary (#13956): Recipe already exists in deptree-resolver-260415h.scm
;;;   sdrpp-headers-git (#9803): Recipe already exists in deptree-resolver-260408e.scm
;;;   shorewall (#8140): Recipe already exists in deptree-resolver-260414q.scm
;;;   gtk-sharp-2 (#285): Recipe already exists in deptree-resolver-260414q.scm
;;;   python-cmapy (#8056): Recipe already exists in cron-c79f127f-r23-w03.scm
;;;   iscan (#640): Recipe already exists in deptree-resolver-260408j.scm
;;;   libglademm (#11118): Recipe already exists in deptree-resolver-260408d.scm
;;;   nvidia-sync (#13585): Recipe already exists in deptree-resolver-260414v.scm
;;;   chromium-widevine (#5321): Recipe already exists in queue-20260404-w04.scm
;;;   kdesignerplugin (#7324): Recipe already exists in deptree-resolver-260408e.scm
;;;   python-requirements-parser (#8103): Recipe already exists in cron-c79f127f-r23-w03.scm
;;;   icu74 (#10777): Recipe already exists in deptree-resolver-260408a.scm
;;;   ps3toolchain (#5015): Recipe already exists in queue-20260324p100d.scm
;;;   python-myjdapi (#7447): Recipe already exists in deptree-resolver-260414q.scm
;;;   pgadmin4-web (#8302): Recipe already exists in queue-20260401p100daily6.scm
;;;   rvgl-bin (#2379): Recipe already exists in queue-20260402t2015z-blocked-tree-p100-w01.scm
;;;   cosmic-bg-git (#9082): Recipe already exists in queue-20260404-daily3.scm
;;;   intel-graphics-compiler-legacy (#9861): Recipe already exists in general-compat.scm
;;;   kcgroups-dmemcg (#38278): Recipe already exists in deptree-resolver-260415i.scm
;;;   python-opentelemetry-exporter-zipkin-json (#12071): Recipe already exists in deptree-resolver-260414q.scm
;;;   cosmic-files-git (#9085): Recipe already exists in queue-20260404-daily3.scm
;;;   mips64-linux-gnu-gcc-bootstrap (#9045): Cross-compilation toolchain; recipe exists in deptree-resolver-260413c.scm
;;;   pgadmin4-desktop (#11885): Recipe already exists in deptree-resolver-260407d.scm
;;;   radicle-node (#3344): Recipe already exists in recipe-resolver-260414a.scm
;;;   sqlite-utils (#6632): Recipe already exists in deptree-resolver-260414q.scm
;;;   android-sdk (#13270): Recipe already exists in recipe-resolver-260408s.scm
;;;   cvmfs (#12904): Recipe already exists in deptree-resolver-260414q.scm
;;;   element-web-git (#12879): Recipe already exists in deptree-resolver-260408e.scm
;;;   intel-npu-driver (#9886): Recipe already exists in deptree-resolver-260408e.scm
;;;   haskell-filepath (#13872): Recipe already exists in deptree-resolver-260415c.scm
;;;   wangle (#7898): Recipe already exists in queue-20260401p100daily.scm
;;;   cosmic-applets-git (#9081): Recipe already exists in queue-20260404-daily3.scm
;;;   cosmic-greeter-git (#6028): Recipe already exists in deptree-resolver-260408e.scm
;;;   cosmic-osd-git (#9073): Recipe already exists in queue-20260404-daily3.scm
;;;   snapx (#7034): Recipe already exists in deptree-resolver-260408e.scm
;;;   tensorrt (#7025): Recipe already exists in deptree-resolver-260414q.scm
;;;   libastal-meta (#670): Recipe already exists in deptree-resolver-260408e.scm
;;;   python-insightface (#5040): Recipe already exists in deptree-resolver-260408e.scm
;;;   linux-cachyos-cjktty (#19312): Recipe already exists in general-compat.scm
;;;   cosmic-settings-git (#9078): Recipe already exists in deptree-resolver-260413c.scm
;;;   goldendict (#8040): Recipe already exists in queue-20260316d.scm
;;;
;;; RESOLVED with new recipes (2 packages):
;;;   gtk2+extra (#13538): gnu-build-system v3.3.4
;;;   electron-builder (#14623): pyproject-build-system v26.8.1
;;;
