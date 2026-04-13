;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413k
;;; 7 packages blocked with specific reason codes and attempt details.

(define-module (gaurix packages recipe-resolver-260413k-blocked-notes))

;;; ── exaile ──────────────────────────────────────────────────────────────
;;; Entry #11877, line 73293
;;; AUR: exaile  |  Upstream: https://github.com/exaile/exaile
;;; Status: BLOCKED: MISSING_GUIX_DEPS
;;; Reason: python-bsddb not packaged in Guix.  Exaile's music library
;;;   database backend requires python-bsddb for persistent storage.
;;; A1: Attempted pyproject/python-build-system packaging — blocked on
;;;   python-bsddb which is a C extension wrapping Berkeley DB.
;;; A2: Checked if bsddb is optional — core playlist/library functionality
;;;   depends on it per upstream docs.
;;; A3: Evaluated bundling Berkeley DB — too complex for batch, would need
;;;   python-bsddb + libdb packaging chain.

;;; ── stremio-service-bin ─────────────────────────────────────────────────
;;; Entry #4335, line 29023
;;; AUR: stremio-service-bin  |  Upstream: https://github.com/Stremio/stremio-service
;;; Status: BLOCKED: MISSING_GUIX_DEPS
;;; Reason: libayatana-appindicator not packaged in Guix.  The binary links
;;;   against libayatana-appindicator3.so for system tray integration.
;;; A1: Attempted copy-build-system with patchelf — would need
;;;   libayatana-appindicator + libayatana-indicator + libdbusmenu chain.
;;; A2: Checked if tray icon is optional — binary fails to start without
;;;   libayatana-appindicator3.so.
;;; A3: Evaluated running without tray — not viable, hard dependency in .deb.

;;; ── python-foobeef ──────────────────────────────────────────────────────
;;; Entry #6826, line 44601
;;; AUR: python-foobeef  |  Upstream: https://github.com/Ada-Kru/pyfoobeef
;;; Status: BLOCKED: MISSING_GUIX_DEPS
;;; Reason: python-aiohttp-sse-client (https://pypi.org/project/aiohttp-sse-client/)
;;;   not packaged in Guix.  Required for server-sent events communication.
;;; A1: Attempted packaging without SSE dep — import fails at module level.
;;; A2: Evaluated packaging python-aiohttp-sse-client first — it is a simple
;;;   Python package but adds scope beyond this batch.
;;; A3: Checked for alternative foobar2000 control libs — none found with
;;;   all deps in Guix.

;;; ── radiotray-ng-mpris ──────────────────────────────────────────────────
;;; Entry #4583, line 30568
;;; AUR: radiotray-ng-mpris  |  Upstream: https://github.com/IngoMeyer441/radiotray-ng-mpris
;;; Status: BLOCKED: MISSING_GUIX_DEPS
;;; Reason: Three dependencies not in Guix:
;;;   1. python-mpris_server (MPRIS2 D-Bus server library)
;;;   2. python-yacl (Yet Another Config Library)
;;;   3. radiotray-ng (the radio player itself)
;;; A1: Evaluated packaging all three deps — chain too deep for this batch.
;;; A2: Checked PyPI for mpris_server — exists but has sub-deps (pydbus, etc).
;;; A3: radiotray-ng itself is a C++ application with 20+ deps.

;;; ── fprintd-clients-git ─────────────────────────────────────────────────
;;; Entry #11271, line 69081
;;; AUR: fprintd-clients-git  |  Upstream: https://gitlab.freedesktop.org/uunicorn/fprintd
;;; Status: BLOCKED: COMPLEX_BUILD
;;; Reason: Requires two local patches from AUR not available in this batch:
;;;   1. 0001-disable-systemd-reactivated.diff
;;;   2. 0002-Remove-ignored-positional-arguments.patch
;;; Additionally depends on libsystemd for D-Bus service activation.
;;; A1: Attempted meson-build-system without patches — build fails due to
;;;   systemd reactivation code.
;;; A2: Evaluated using Guix's elogind instead — would need source patches
;;;   specific to the clients-only branch.
;;; A3: Checked if upstream fprintd (non-clients) works — Guix doesn't have
;;;   fprintd packaged either.

;;; ── fcitx5-pinyin-chinese-idiom ─────────────────────────────────────────
;;; Entry #6814, line 44512
;;; AUR: fcitx5-pinyin-chinese-idiom  |  Upstream: https://github.com/Kienyew/fcitx5-pinyin-chinese-idiom
;;; Status: BLOCKED: MISSING_GUIX_DEPS
;;; Reason: Build requires python-pypinyin (pip package 'pypinyin') to convert
;;;   Chinese idiom data to pinyin format.  pypinyin is not in Guix.
;;; A1: Checked if pre-compiled .dict is available — only .raw source and
;;;   conversion script are distributed.
;;; A2: Evaluated packaging pypinyin — it depends on python-phrase-pinyin-data
;;;   which is data-only, feasible but adds scope.
;;; A3: Checked if libime can process without pypinyin — no, the convert.py
;;;   script requires pypinyin to generate the intermediate format.

;;; ── ksnip ───────────────────────────────────────────────────────────────
;;; Entry #6811, line 44491
;;; AUR: ksnip-git  |  Upstream: https://github.com/ksnip/ksnip
;;; Status: BLOCKED: VERSION_MISMATCH
;;; Reason: AUR ksnip v1.8.2 depends on Qt5 (qt5-x11extras, kimageannotator
;;;   Qt5 build).  Guix's kimageannotator v0.7.2 is built against Qt6.
;;; A1: Attempted cmake-build-system with Qt6 kimageannotator — API mismatch
;;;   between ksnip 1.8.2's Qt5 code and Qt6 kimageannotator.
;;; A2: Checked ksnip 1.10.1 (latest) for Qt6 support — upstream migrated
;;;   to Qt6 but requires kColorPicker >= 0.3.1 and kimageannotator >= 0.7.0
;;;   which ARE in Guix, but ksnip 1.10.1 is not on AUR for reference.
;;; A3: Evaluated building ksnip 1.10.1 from git — feasible in principle
;;;   but untested cmake flags and potential Qt6 API changes make this
;;;   risky for batch processing.
