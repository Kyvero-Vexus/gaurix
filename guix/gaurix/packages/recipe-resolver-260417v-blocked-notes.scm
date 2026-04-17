;;; Blocked notes for recipe-resolver-260417v
;;;
;;; 26. python-pyvis — BLOCKED: LARGE_SOURCE
;;;     PyPI sdist is not available for pyvis 0.3.2.
;;;     GitHub source tarball is ~100MB (includes embedded vis.js and notebooks).
;;;     A1: PyPI sdist missing — pypi-uri will not work
;;;     A2: GitHub source 100MB — impractical for Guix package store
;;;     A3: No lightweight alternative source available
;;;
;;; 27. gestures — BLOCKED: DEP_MISSING
;;;     libinput-gestures is not packaged in Guix.
;;;     GitLab tag v0.2.6 does not exist.
;;;     A1: Package libinput-gestures first — significant scope, needs
;;;         libinput configuration integration
;;;     A2: No alternative gesture configuration frameworks in Guix
;;;     A3: master branch available but no stable release tag
;;;
;;; 28. terminal-rain-lightning — BLOCKED: SOURCE_UNAVAILABLE
;;;     GitHub repository (rmaake1/terminal-rain-lightning) not accessible.
;;;     No PyPI sdist available.
;;;     A1: PyPI sdist missing
;;;     A2: GitHub archive download fails (404)
;;;     A3: No alternative source found
;;;
;;; 29. opl-synth — BLOCKED: COMPLEX_BUILD
;;;     JUCE 7 framework required for building.
;;;     No tagged releases on GitHub (reales/OPL).
;;;     A1: JUCE not packaged for Guix — complex framework with
;;;         platform-specific build requirements
;;;     A2: No tagged releases — cannot pin reproducible version
;;;     A3: CMake + JUCE build requires extensive audio/graphics
;;;         library configuration
;;;
;;; 30. fake-background-webcam-git — BLOCKED: DEP_CHAIN_TOO_DEEP
;;;     Requires mediapipe for background segmentation.
;;;     mediapipe depends on TensorFlow/Bazel — massive dependency chain.
;;;     A1: mediapipe not in Guix — needs TensorFlow (Bazel build)
;;;     A2: v4l2loopback kernel module needed at runtime — cannot be
;;;         bundled in Guix package
;;;     A3: No lightweight alternative for ML-based background
;;;         segmentation exists
