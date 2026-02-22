;;; Package namespace convenience module for Gaurix.
(define-module (gaurix packages)
  #:use-module (gaurix packages hello-gaurix)
  #:use-module (gaurix packages localsend-bin)
  #:use-module (gaurix packages aider-chat)
  #:use-module (gaurix packages lmstudio-bin)
  #:use-module (gaurix packages llama-cpp-cuda)
  #:use-module (gaurix packages visual-studio-code-bin)
  #:use-module (gaurix packages sunshine)
  #:use-module (gaurix packages sunshine-bin)
  #:use-module (gaurix packages fluxer-bin)
  #:export (hello-gaurix localsend-bin aider-chat lmstudio-bin
            llama-cpp-cuda visual-studio-code-bin sunshine sunshine-bin fluxer-bin))
