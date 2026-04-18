#!/usr/bin/env python3
"""Deterministic full-file transform: append recipe-resolver-260418h block to packages.scm."""

import os
import tempfile

TARGET = "/home/slime/projects/gaurix/guix/gaurix/packages.scm"

NEW_BLOCK = """\


;; recipe-resolver-260418h: 28 NRD resolved (ttf-symbola, otf-symbola, svxlink-sounds-en-us-heather-16k, ...)
            ;; 2 BLOCKED: gde-creator-bin (NO_LICENSE), rice-switcher (UPSTREAM_DELETED)
(define-module (gaurix packages)
  #:use-module (gaurix packages recipe-resolver-260418h)
  #:re-export (
               ttf-symbola
               otf-symbola
               svxlink-sounds-en-us-heather-16k
               devkit-env
               random
               kak-ansi
               jelly
               fladder-bin
               parm-bin
               opendeck-bin
               vkd3d-proton-bin
               piliplus-bin
               hyprshell-bin
               python-pandas-docs
               desktopius
               nextcloud-app-user-usage-report
               kak-bundle-git
               duperemove-service
               tlp-rdw-systemd
               mii-emu
               sedutil
               motion-git
               nikki-editor
               responder
               libreoffice-extension-h2orestart
               pipewire-module-xrdp
               libnick
               maddy
               ))
"""


def main():
    # 1. Read entire file
    with open(TARGET, "r") as f:
        content = f.read()

    print(f"Read {len(content)} bytes, {content.count(chr(10))} lines")

    # 2. Compute new content: append block at the very end
    new_content = content.rstrip("\n") + "\n" + NEW_BLOCK

    # 3. Write to temp file in same directory (same filesystem for atomic rename)
    dirn = os.path.dirname(TARGET)
    fd, tmp_path = tempfile.mkstemp(dir=dirn, suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as tmp:
            tmp.write(new_content)

        # 4. Atomic rename
        os.rename(tmp_path, TARGET)
        print(f"Atomic rename {tmp_path} -> {TARGET}")
    except Exception:
        # Clean up temp on failure
        if os.path.exists(tmp_path):
            os.unlink(tmp_path)
        raise

    # 5. Verify
    with open(TARGET, "r") as f:
        verify = f.read()

    assert verify.endswith("\n"), "File does not end with newline"
    assert "recipe-resolver-260418h" in verify, "New block not found"
    assert "ttf-symbola" in verify, "First package not found"
    assert "maddy" in verify, "Last package not found"

    new_lines = verify.count("\n")
    print(f"Verification passed: {len(verify)} bytes, {new_lines} lines, ends with newline")
    print("Success.")


if __name__ == "__main__":
    main()
