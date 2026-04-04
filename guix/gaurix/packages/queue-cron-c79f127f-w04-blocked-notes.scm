;;; Blocked notes for cron-c79f127f worker w04.
(define-module (gaurix packages queue-cron-c79f127f-w04-blocked-notes)
  #:export (queue-cron-c79f127f-w04-blocked-notes))

(define-public queue-cron-c79f127f-w04-blocked-notes
  '((pgadmin4-server
     (reason . "Not available in current Guix package set; AUR build requires a large Node/Corepack/Yarn + Python venv + SBOM toolchain not packaged as a focused server recipe here.")
     (attempts
      ((A1 . "Exact availability probe: guix package -A '^pgadmin4-server$' -> no matches.")
       (A2 . "Fuzzy availability probe: guix package -A 'pgadmin4|pgadmin' -> no pgadmin packages in this Guix snapshot.")
       (A3 . "AUR recipe audit (pgadmin4-server PKGBUILD): requires nodejs/corepack/npm/yarn/syft and custom linux build helper phases; too broad for this blocked-tree chunk.")))
     (next-steps . "Stage prerequisites first (corepack/yarn workflow and SBOM tooling), then package pgadmin4-server with web asset build split from runtime install."))

    (openvino
     (reason . "No OpenVINO package in current Guix package set, and AUR's recipe is a large multi-repository, multi-output build graph.")
     (attempts
      ((A1 . "Exact availability probe: guix package -A '^openvino$' -> no matches.")
       (A2 . "Fuzzy availability probe: guix package -A 'openvino|open-?vino|one(dnn|api)' -> only oneapi-dnnl/onednn, no OpenVINO package.")
       (A3 . "AUR recipe audit (openvino PKGBUILD): >20 git sources/submodules (openvino + oneDNN + OpenCL + ONNX + protobuf + plugins) plus split outputs and git-lfs workflow.")))
     (next-steps . "Package OpenVINO in stages: core runtime first, then Intel plugin outputs, then python-openvino bindings."))

    (dotnet-targeting-pack-bin
     (reason . "No standalone Guix dotnet-targeting-pack package exists, and AUR provides it only as a split output from the larger dotnet-core-bin family.")
     (attempts
      ((A1 . "Exact availability probe: guix package -A '^dotnet-targeting-pack-bin$' and '^dotnet-targeting-pack-9.0-bin$' -> no matches.")
       (A2 . "AUR RPC search confirms package names exist (dotnet-targeting-pack-bin and versioned variants), but not as independent package bases.")
       (A3 . "Split PKGBUILD audit (dotnet-core-bin): targeting-pack is produced alongside dotnet-host/runtime/sdk with multi-arch SDK tarballs and tightly coupled split-package logic.")))
     (next-steps . "Package dotnet-core-bin family foundations (host/runtime/sdk) in Guix first, then add dotnet-targeting-pack-bin as a derived split package."))))
