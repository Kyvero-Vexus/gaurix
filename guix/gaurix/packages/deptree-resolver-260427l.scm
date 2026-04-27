;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260427l
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 3 resolved (wayprompt-git, wldash, anyrun-git) + 9 deps packaged.
;;; 97 remain BLOCKED.
;;; Generated: 2026-04-27

(define-module (gaurix packages deptree-resolver-260427l)
  #:use-module (gaurix packages wayprompt)
  #:use-module (gaurix packages wldash)
  #:use-module (gaurix packages anyrun)
  #:re-export (;; wayprompt and Zig dependencies
               zig-wayland-0.2
               zig-pixman-0.2
               zig-xkbcommon-0.2
               zig-fcft
               zig-ini
               zig-spoon
               wayprompt-git
               ;; wldash (Rust/Cargo with vendored crates)
               wldash
               ;; anyrun (Rust/Cargo + GTK4, crates in anyrun-crates)
               anyrun))
