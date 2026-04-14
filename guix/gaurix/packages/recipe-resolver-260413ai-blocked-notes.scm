;;; Blocked notes for recipe-resolver-260413ai
;;; 15 packages blocked with reason codes

;;; #12706 python-vllm-rocm
;;;   BLOCKED: DEP_RESOLUTION_FAILED — requires AMD ROCm stack (hip, rocblas, hipblas, MIOpen) not available in Guix; A1: massive GPU toolchain dep tree; next: wait for ROCm Guix packaging

;;; #12729 reflector-pacman-hook-git
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Arch Linux pacman hook, not portable to non-pacman systems; A1: pacman-specific triggers; A2: libalpm dependency; next: needs Guix service design

;;; #12746 magewell-pro-capture-dkms
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — proprietary DKMS kernel module for Magewell capture cards; A1: requires kernel build integration; A2: out-of-tree module; next: needs linux-module-build-system

;;; #12753 fallout1-ce-game
;;;   BLOCKED: LICENSE_REVIEW_NEEDED — community engine requires original Fallout 1 game data assets; A1: MASTER.DAT not redistributable; next: human review of asset redistribution legality

;;; #12764 supermario64-sm64ex-git
;;;   BLOCKED: LICENSE_REVIEW_NEEDED — requires Nintendo copyrighted baserom.z64 ROM; A1: ROM extraction not legal to distribute; next: human review needed for clean-room packaging

;;; #12709 docker-model-plugin
;;;   BLOCKED: DEP_RESOLUTION_FAILED — Docker CLI plugin requiring Docker Engine runtime API; A1: github.com/docker/cli plugin ABI; A2: dockerd socket dep; next: needs Docker packaging in Guix

;;; #12695 quickshell-overview-git
;;;   BLOCKED: DEP_RESOLUTION_FAILED — requires Quickshell framework (Qt6 QML compositor shell); A1: quickshell not in Guix; A2: hyprland IPC dep; next: package quickshell first

;;; #12741 xr-passthrough-layer-git
;;;   BLOCKED: DEP_RESOLUTION_FAILED — requires OpenXR SDK + Monado compositor + GPU-specific driver stack; A1: openxr-loader not fully in Guix; A2: camera HAL dep; next: package OpenXR stack first

;;; #12752 lianli-linux-git
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — USB HID controller for Lian Li hardware (fans, RGB, LCD); A1: requires hidapi + udev rules; A2: Electron GUI + native USB backend; next: split CLI/GUI packaging

;;; #12781 moc-pulse
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — MOC (music on console) rebuild with PulseAudio support; A1: requires patching MOC configure.in for PulseAudio; A2: conflicts with existing moc package; next: add pulseaudio configure flag to upstream moc

;;; #12711 caddy-cloudflare-l4
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Caddy web server with Cloudflare DNS + L4 plugins; A1: requires xcaddy builder for Go plugin injection; A2: go-build-system cannot do plugin merging; next: design xcaddy-based build phase

;;; #12757 mod-maxminddb
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Apache HTTPD module for MaxMind GeoIP; A1: requires apxs (Apache Extension Tool) build integration; A2: httpd-devel headers; next: design apache-module-build-system phase

;;; #12774 pulsemeeter-git
;;;   BLOCKED: DEP_RESOLUTION_FAILED — PulseAudio/PipeWire routing GUI; A1: requires pulsectl + complex Python audio deps; A2: pipewire runtime config; next: package pulsectl and audio Python bindings

;;; #12717 opencl-vanity-gpg
;;;   BLOCKED: DEP_RESOLUTION_FAILED — Rust GPU/OpenCL-powered vanity PGP key generator; A1: requires OpenCL ICD + GPU-specific runtime; A2: cargo-build-system + opencl-headers; next: needs OpenCL ICD packaging

;;; #12692 dvdisaster-speed47-git
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — speed47 fork of dvdisaster with GTK3 UI; A1: complex autotools + GTK3 + codec chain; A2: non-standard build patches needed; next: port autotools build to Guix phases

