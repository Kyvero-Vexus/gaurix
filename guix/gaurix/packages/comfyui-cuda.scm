(define-module (gaurix packages comfyui-cuda)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages python))

(define-public comfyui-cuda
  (package
    (name "comfyui-cuda")
    (version "0.15.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/comfyanonymous/ComfyUI/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1b4l0dz5119j21g804vjfap1wb8a14wyxg2zdr9qwfrpf0drqxa7"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (inputs (list bash-minimal python))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (bash (search-input-file %build-inputs "/bin/bash"))
                 (python (search-input-file %build-inputs "/bin/python3"))
                 (opt (string-append out "/opt/comfyui"))
                 (bin (string-append out "/bin")))
            ;; Extract source
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (mkdir-p opt)
            (copy-recursively (string-append "ComfyUI-" #$version) opt)

            ;; Create launcher script
            (mkdir-p bin)
            (call-with-output-file (string-append bin "/comfyui")
              (lambda (p)
                (format p "#!~a
COMFYUI_DIR=~a
VENV_DIR=\"${COMFYUI_VENV:-$HOME/.local/share/comfyui/venv}\"

# Create venv on first run
if [ ! -d \"$VENV_DIR\" ]; then
  echo \"[comfyui-cuda] Creating Python venv at $VENV_DIR ...\"
  ~a -m venv \"$VENV_DIR\"
  . \"$VENV_DIR/bin/activate\"
  echo \"[comfyui-cuda] Installing PyTorch (CUDA) and ComfyUI dependencies...\"
  pip install --upgrade pip
  pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
  pip install -r \"$COMFYUI_DIR/requirements.txt\"
else
  . \"$VENV_DIR/bin/activate\"
fi

exec ~a \"$COMFYUI_DIR/main.py\" \"$@\"
" bash opt python python)))
            (chmod (string-append bin "/comfyui") #o755)
            #t))))
    (home-page "https://github.com/comfyanonymous/ComfyUI")
    (synopsis "Modular Stable Diffusion GUI and backend (CUDA-enabled)")
    (description
     "ComfyUI is a powerful and modular GUI and backend for Stable Diffusion
and other diffusion models.  This package provides the CUDA-enabled variant
for NVIDIA GPUs.  On first run, a Python virtual environment is automatically
created with PyTorch CUDA support and all required dependencies.")
    (license license:gpl3)))
