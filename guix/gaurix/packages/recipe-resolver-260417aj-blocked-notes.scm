;;; Blocked notes for recipe-resolver-260417aj
;;;
;;; 24. localepurge — BLOCKED: DEBIAN_SPECIFIC
;;;     Debian-specific tool that depends on debconf and dpkg internals.
;;;     Guix does not use locale files the same way; irrelevant to Guix model.
;;;     A1: depends on debconf — Debian-only configuration framework
;;;     A2: requires dpkg database to enumerate installed locales
;;;     A3: Guix manages locales declaratively; no equivalent needed
;;;
;;; 25. alsi — BLOCKED: ARCH_SPECIFIC
;;;     Arch Linux system information tool that reads from pacman databases.
;;;     A1: uses libalpm/pacman to query installed packages — Arch-only
;;;     A2: similar tools exist for Guix (guix system describe)
;;;     A3: neofetch/fastfetch provide distro-agnostic alternatives
;;;
;;; 26. kalu — BLOCKED: ARCH_SPECIFIC
;;;     Arch Linux Update Notifier depending on libalpm (pacman library).
;;;     A1: hard dependency on libalpm — Arch pacman internals
;;;     A2: reads pacman sync databases for update checking
;;;     A3: Guix has `guix pull` and channel update mechanisms instead
;;;
;;; 27. hal-info — BLOCKED: DEAD_PROJECT
;;;     HAL (Hardware Abstraction Layer) was deprecated in 2011.
;;;     Replaced by udev/systemd-udevd and udisks2.
;;;     A1: HAL deprecated since 2011 — no upstream maintenance
;;;     A2: all functionality replaced by udev rules and udisks2
;;;     A3: no software depends on HAL anymore
;;;
;;; 28. xcursor-human — BLOCKED: SOURCE_UNAVAILABLE
;;;     Ubuntu's Human cursor theme hosted on Launchpad.
;;;     Source tarball download returns 404 from Launchpad servers.
;;;     A1: launchpad.net download URL returns 404
;;;     A2: no alternative source mirrors found
;;;     A3: Ubuntu PPA source package also unavailable
;;;
;;; 29. perl-gtk2-ex-simple-list — BLOCKED: DEAD_PROJECT
;;;     Ancient Perl module from 2004 for Gtk2 MVC list widget.
;;;     Gtk2 is deprecated; last CPAN update was 2005.
;;;     A1: Gtk2 deprecated — should use Gtk3 equivalents
;;;     A2: no upstream maintenance since 2005
;;;     A3: extremely niche — only used by legacy Gtk2 Perl apps
;;;
;;; 30. fontconfig-ubuntu-docs — BLOCKED: ALREADY_IN_GUIX_VARIANT
;;;     Documentation variant of fontconfig with Ubuntu patches.
;;;     fontconfig is already in Guix (v2.14.0); Ubuntu-specific
;;;     patches are distribution-specific and not needed.
;;;     A1: fontconfig v2.14.0 already in gnu/packages/fontutils.scm
;;;     A2: Ubuntu-specific patches not relevant to Guix
;;;     A3: -docs subpackage is a Debian packaging artifact
;;;
;;; 31. libsvg — BLOCKED: BUILD_FAILURE
;;;     Ancient C library (2005) for SVG parsing, part of cairographics.
;;;     Incompatible with modern libxml2 (>=2.14): SAX.h deprecated,
;;;     xmlParserCtxtPtr type not exposed through default includes.
;;;     Source files contain non-UTF-8 characters preventing substitute*.
;;;     A1: CFLAGS -include stdlib.h -include libxml/parser.h —
;;;         libtool/autotools ignores CFLAGS set in build phase
;;;     A2: substitute* fails on svg.c due to ISO-8859 encoding
;;;     A3: upstream abandoned since 2005; no patches available for
;;;         modern libxml2 compatibility
;;;
;;; 32. w-scan-cpp — BLOCKED: BUILD_FAILURE
;;;     DTV channel scanner that bundles VDR, wirbelscan, and satip sources.
;;;     Build requires downloading VDR from git.tvdr.de and plugins from
;;;     gen2vdr.de during build; VDR is not packaged in Guix.
;;;     A1: gen2vdr.de source tarball (includes bundled deps) behind
;;;         Anubis bot protection — returns HTML instead of tarball
;;;     A2: GitHub tag (20250615) lacks bundled VDR/plugin sources;
;;;         build fails with missing vdr/plugin.h
;;;     A3: GitHub tag (20231015) same issue; wirbelscan plugin also
;;;         hosted on gen2vdr.de (same bot protection); VDR not on GitHub
