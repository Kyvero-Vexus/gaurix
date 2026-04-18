;;; Blocked notes for recipe-resolver-260418r
;;; 15 packages evaluated as NEEDS_RECIPE_DESIGN_EXHAUSTED

;;; 16. postman-bin (entry 2056)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY
;;;     API development platform by Postman Inc.
;;;     A1: no open-source license; Postman EULA prohibits redistribution
;;;     A2: no source code available (proprietary SaaS product)
;;;     A3: alternatives: Insomnia (packaged), Hoppscotch, Bruno

;;; 17. kibo-appimage (entry 4921)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY
;;;     Anime streaming app with no public source repository.
;;;     A1: no source code published
;;;     A2: no license declaration; binary-only from proprietary domain
;;;     A3: redistribution rights unknown/likely prohibited

;;; 18. plexamp-appimage (entry 5132)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY
;;;     Plex music player by Plex Inc.
;;;     A1: no source code; proprietary application
;;;     A2: redistribution prohibited by Plex ToS
;;;     A3: alternatives: Finamp (for Jellyfin), Amberol

;;; 19. haproxy-awslc (entry 3522)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEP
;;;     HAProxy built against AWS-LC (Amazon LibCrypto) for QUIC support.
;;;     A1: aws-lc is a large C/C++/assembly crypto library not in Guix
;;;     A2: custom Makefile build with non-standard flags (TARGET=linux-glibc)
;;;     A3: standard HAProxy is already available in Guix; awslc variant adds
;;;         minimal value vs packaging aws-lc from scratch

;;; 20. idescriptor-git (entry 1073)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_BUILD
;;;     Cross-platform iDevice management tool.
;;;     A1: requires cmake + Go + Cargo triple-toolchain build
;;;     A2: 30+ dependencies including libtatsu, qtermwidget (both not in Guix)
;;;     A3: git submodules for Go/Rust components make reproducible build complex

;;; 21. openbuilds-control-bin (entry 3959)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_BUILD
;;;     CNC controller Electron app pinned to obsolete electron23.
;;;     A1: Guix lacks Electron packaging infrastructure
;;;     A2: source build requires full Chromium/Electron stack
;;;     A3: binary .deb requires complex native library chain (nss, gtk3, mesa)

;;; 22. webtorrent-bittorrent-tracker (entry 3020)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: NPM_DEPS
;;;     BitTorrent tracker Node.js library/CLI.
;;;     A1: npm dependency resolution incompatible with Guix functional model
;;;     A2: no pre-built binary available
;;;     A3: Guix node-build-system cannot handle transitive npm deps

;;; 23. nodemcu-tool (entry 4874)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: NPM_DEPS
;;;     NodeMCU serial CLI tool.
;;;     A1: npm package requiring npm install at build time
;;;     A2: depends on deprecated python2 for node-gyp serial bindings
;;;     A3: stale project (last AUR update 2021, unmaintained)

;;; 24. buuf-icon-theme (entry 4852)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: NONFREE_LICENSE
;;;     Buuf hand-drawn icon theme.
;;;     A1: licensed CC-BY-NC-SA (NonCommercial clause = non-free)
;;;     A2: no relicensing available from upstream
;;;     A3: no versioned releases exist (master branch zip only)

;;; 25. dopamine-official (entry 4047)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_BUILD
;;;     Music player built with Electron + Angular.
;;;     A1: source build requires Electron v37 + Angular 16 + full npm stack
;;;     A2: distributed only as AppImage; no source build path exists in Guix
;;;     A3: alternatives: Lollypop, GNOME Music, Amberol (all in Guix)

;;; 26. streamcontroller (entry 4717)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: NO_BUILD_SYSTEM
;;;     Elgato Stream Deck controller for Linux.
;;;     A1: no pyproject.toml/setup.py; uses pip install into virtualenv
;;;     A2: 50+ pinned pip dependencies with no standard packaging
;;;     A3: only beta releases exist (1.5.0-beta.14); no stable release

;;; 27. nautilus-typeahead (entry 676)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEPS
;;;     GNOME Nautilus with type-ahead search patches.
;;;     A1: needs glycin, libcloudproviders, localsearch, tinysparql (none in Guix)
;;;     A2: Nautilus 50.1 version ahead of Guix Nautilus with different dep chain
;;;     A3: estimated 4+ GNOME libraries to package first

;;; 28. maestral (entry 722)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEPS
;;;     Lightweight Dropbox client for Linux.
;;;     A1: needs python-dropbox (with stone/requests dep chain)
;;;     A2: needs python-pyro5 (with serpent serializer), python-desktop-notifier
;;;     A3: needs python-survey, python-fasteners; estimated 10+ packages to add

;;; 29. backup-warden (entry 932)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEPS
;;;     Backup management tool with S3/Slack integration.
;;;     A1: needs python-boto3/python-botocore (large AWS SDK)
;;;     A2: needs fabric (with python-invoke + paramiko chain)
;;;     A3: needs python-slack-sdk, python-simpleeval, python-loguru, python-humanfriendly;
;;;         estimated 15+ packages to add

;;; 30. manim (entry 4771)
;;;     NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEPS
;;;     Math animation engine for explanatory videos.
;;;     A1: needs python-manimpango (C extension wrapping Pango)
;;;     A2: needs python-skia-pathops (wraps Skia C++ library, massive build)
;;;     A3: needs python-moderngl, python-mapbox-earcut, python-isosurfaces,
;;;         python-svgelements; estimated 8+ packages to add
