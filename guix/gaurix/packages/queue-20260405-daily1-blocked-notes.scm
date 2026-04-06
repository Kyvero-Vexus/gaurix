;;; Blocked notes for queue-20260405-daily1
(define-module (gaurix packages queue-20260405-daily1-blocked-notes))

;;; Blocked notes for queue-20260405-daily1
;;; 48 packages blocked

;;; 25112. masterpassword-gui: NEEDS_RECIPE_DESIGN | Java GUI JAR from https://github.com/Lyndir/MasterPassword; upstream moved to Spectre; AUR download issues | next: find working JAR download URL from spectre-app releases
;;; 25181. svnkit: NEEDS_RECIPE_DESIGN | SVNKit pure-Java Subversion library JAR from https://svnkit.com needs download URL + java wrapper | next: find current SVNKit release download

;;; 25113. mbrola-voices-de5: LICENSE_REVIEW_NEEDED | MBROLA voice data is free for non-commercial use only; license restricts redistribution | next: verify if MBROLA voice license permits Guix channel redistribution
;;; 25114. mcos-shell-theme: NEEDS_RECIPE_DESIGN | GNOME Shell + GTK macOS-inspired theme from https://github.com/paullinuxthemer/Mc-OS-themes needs install path mapping | next: determine which theme files to install and target dirs
;;; 25120. mingw-w64-mariadb-connector-c: SOURCE_UNAVAILABLE | Windows-only mingw-w64 cross-compilation package; not applicable to Guix GNU/Linux | next: skip
;;; 25121. mingw-w64-sqlite: SOURCE_UNAVAILABLE | Windows-only mingw-w64 cross-compilation package; not applicable to Guix GNU/Linux | next: skip
;;; 25123. mm2odt: SOURCE_UNAVAILABLE | FreeMind .mm-to-ODT converter; no standalone upstream repo found; bundled in old FreeMind releases only | next: locate standalone source tarball
;;; 25129. nodejs-express: DEP_RESOLUTION_FAILED | Express.js has deep npm dependency tree; node-build-system cannot resolve ~60 transitive deps | next: would need mass node package imports
;;; 25131. octave-splines: NEEDS_RECIPE_DESIGN | Octave Forge splines package needs octave-build-system support; Guix has octave but not forge add-on packaging infrastructure | next: investigate octave package loading mechanism
;;; 25132. ocztoolbox: SOURCE_UNAVAILABLE | OCZ SSD toolbox is proprietary, discontinued, and no longer downloadable from OCZ/Toshiba | next: skip (abandoned proprietary)
;;; 25133. openbox-arc-git: NEEDS_RECIPE_DESIGN | Arc theme Openbox variant from https://github.com/horst3180/arc-theme needs theme file extraction and install mapping | next: identify which openbox theme files to extract from arc-theme
;;; 25135. openjump-bin: NEEDS_RECIPE_DESIGN | OpenJUMP GIS JAR binary from http://www.openjump.org needs download URL for current release + java wrapper | next: find stable release download URL
;;; 25136. ostorybook: NEEDS_RECIPE_DESIGN | oStoryBook Java novel writing tool from SourceForge needs JAR download URL + java wrapper | next: find current SourceForge release download
;;; 25138. ourico: SOURCE_UNAVAILABLE | ourico taskbar upstream at http://plhk.ru/ourico appears dead (Russian site, no reachable source) | next: skip (dead upstream)
;;; 25139. oysttyer-git: SOURCE_UNAVAILABLE | oysttyer CLI Twitter client is dead since Twitter killed free API access (2023) | next: skip (upstream dead, service unavailable)
;;; 25145. pida-hg: SOURCE_UNAVAILABLE | PIDA Python IDE is dead since ~2011; only Mercurial (hg) source at bitbucket.org/aafshar/pida-main, Bitbucket dropped Hg support | next: skip (dead project, no source)
;;; 25147. psychonauts: SOURCE_UNAVAILABLE | Psychonauts game requires Humble Bundle purchase; binary is non-redistributable | next: skip (non-redistributable game binary)
;;; 25148. pvm: NEEDS_RECIPE_DESIGN | Parallel Virtual Machine v3.4.x from https://www.csm.ornl.gov/pvm needs autotools configure analysis; legacy HPC software | next: verify source tarball availability and build system
;;; 25149. pydio: SOURCE_UNAVAILABLE | Pydio Core (PHP) reached EOL in 2019; superseded by Pydio Cells (Go); PHP version no longer maintained | next: skip (EOL)
;;; 25152. python2-jpype1: SOURCE_UNAVAILABLE | Python 2 only package; Python 2 reached EOL January 2020 | next: skip (Python 2 EOL)
;;; 25153. python2-wxpython3: SOURCE_UNAVAILABLE | Python 2 + wxPython 3 are both EOL; Python 2 reached EOL January 2020 | next: skip (Python 2 EOL)
;;; 25154. python3-xynexdg: SOURCE_UNAVAILABLE | python3-xynexdg author recommends using python-xdg instead; package is obsolete | next: skip (obsolete, use python-xdg)
;;; 25156. qflipper-git: NEEDS_RECIPE_DESIGN | qFlipper from https://github.com/flipperdevices/qFlipper needs Qt6 + libusb deps + protobuf submodule resolution | next: analyze CMakeLists.txt for full dep list
;;; 25157. qtfind: SOURCE_UNAVAILABLE | qtfind has no identifiable upstream repository or release URL outside AUR | next: skip (no upstream source)
;;; 25158. quazip-qt4: SOURCE_UNAVAILABLE | quazip for Qt4 is obsolete; Qt4 reached EOL in 2015; Guix has quazip-qt5 | next: skip (Qt4 EOL)
;;; 25160. remmina-plugin-url: NEEDS_RECIPE_DESIGN | remmina-plugin-url from https://github.com/muflone/remmina-plugin-url needs remmina dev headers as build dep | next: verify cmake build against remmina headers
;;; 25161. rep-gtk: NEEDS_RECIPE_DESIGN | rep-gtk v0.90.8.3 GTK+2 bindings for librep need librep + GTK+2 deps; librep not in Guix | next: package librep first (DEP_RESOLUTION_FAILED)
;;; 25164. rotki-bin: NEEDS_RECIPE_DESIGN | Rotki Electron binary from https://github.com/rotki/rotki needs AppImage/tar.xz extraction + patchelf for Electron runtime | next: determine release artifact format and extraction method
;;; 25167. scrt: SOURCE_UNAVAILABLE | VanDyke SecureCRT is proprietary commercial software requiring purchase; no free redistribution | next: skip (proprietary, non-redistributable)
;;; 25168. sddm-stellar-theme: SOURCE_UNAVAILABLE | SDDM stellar theme has no identifiable upstream repository or stable download URL | next: skip (no upstream)
;;; 25170. sickchill-git: NEEDS_RECIPE_DESIGN | SickChill from https://github.com/SickChill/SickChill is large Python app with ~40 deps | next: audit dependency tree for Guix availability
;;; 25171. sickrage-git: SOURCE_UNAVAILABLE | SickRage is superseded by SickChill; original project forked/renamed | next: skip (superseded by SickChill)
;;; 25172. simgear-git: NEEDS_RECIPE_DESIGN | SimGear from FlightGear project needs cmake + OpenSceneGraph + many deps | next: verify if Guix flightgear already bundles/provides simgear
;;; 25176. spawn-fcgi-php: SOURCE_UNAVAILABLE | spawn-fcgi-php is a trivial wrapper script for spawn-fcgi with PHP; no standalone upstream | next: skip (wrapper script, not a real package)
;;; 25177. spaz-hib: SOURCE_UNAVAILABLE | Space Pirates and Zombies (Humble Bundle version) requires user-owned binary; non-redistributable | next: skip (non-redistributable game binary)
;;; 25183. switchboard-plug-desktop-git: DEP_RESOLUTION_FAILED | elementary OS Pantheon desktop settings plugin needs switchboard + granite + elementary deps not in Guix | next: would need elementary OS stack first
;;; 25186. systemd-zpool-scrub: SOURCE_UNAVAILABLE | systemd-only service/timer unit for ZFS zpool scrubbing; not applicable to Guix (uses shepherd, not systemd) | next: skip
;;; 25190. thunderbird-sieve: NEEDS_RECIPE_DESIGN | Thunderbird Sieve addon from https://github.com/thsmi/sieve needs XPI packaging for icedove | next: determine XPI build and install process for icedove
;;; 25191. tiddlydesktop: NEEDS_RECIPE_DESIGN | TiddlyDesktop from https://github.com/TiddlyWiki/TiddlyDesktop uses NW.js binary runtime; needs AppImage extraction | next: find Linux release artifact and determine extraction method
;;; 25197. truestudio: SOURCE_UNAVAILABLE | Atollic TrueSTUDIO is proprietary IDE requiring email registration; acquired by ST Micro, replaced by STM32CubeIDE | next: skip (proprietary, discontinued)
;;; 25200. udev-browse-git: NEEDS_RECIPE_DESIGN | udev-browse from https://0pointer.net/blog/projects/udev-browse.html is old Vala app; unmaintained since ~2014 | next: verify source availability and Vala/GTK compatibility
;;; 25130. ocaml-camlzip: NEEDS_RECIPE_DESIGN | Guix has camlzip but AUR name ocaml-camlzip differs; alias verification needed | next: verify camlzip export name compatibility
;;; 25174. smartdeblur-git: NEEDS_RECIPE_DESIGN | SmartDeblur Qt+FFTW app from https://github.com/Y-Vladimir/SmartDeblur needs qmake-build-system + FFTW dep | next: analyze Qt version requirements and FFTW linking
;;; 25198. ttf-inconsolata-hellenic: NEEDS_RECIPE_DESIGN | Inconsolata with Greek glyphs; no stable download URL found outside AUR | next: locate upstream font file download
