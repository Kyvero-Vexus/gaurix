;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414ag
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 2 resolved as compat aliases; 28 exhausted (see blocked-notes).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260414ag)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
            alacritty-nox-git
            libpurple-lurch-git
            ))

;;;
;;; --- 1. alacritty-nox-git ---
;;; Alacritty without X11 support (Wayland-only).  Guix alacritty already
;;; supports Wayland natively; this is a compat alias.
;;;

(define-public alacritty-nox-git
  (package
    (inherit (specification->package "alacritty"))
    (name "alacritty-nox-git")))

;;;
;;; --- 2. libpurple-lurch-git ---
;;; OMEMO encryption plugin for libpurple (git variant).
;;; Already in Guix as purple-lurch v0.7.0; compat alias.
;;;

(define-public libpurple-lurch-git
  (package
    (inherit (specification->package "purple-lurch"))
    (name "libpurple-lurch-git")))
