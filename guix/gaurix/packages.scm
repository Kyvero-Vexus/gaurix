;;; Package namespace convenience module for Gaurix.
(define-module (gaurix packages)
  #:use-module (gaurix packages hello-gaurix)
  #:use-module (gaurix packages localsend-bin)
  #:use-module (gaurix packages aider-chat)
  #:export (hello-gaurix localsend-bin aider-chat))
