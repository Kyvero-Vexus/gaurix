#!/usr/bin/env python3
"""Add recipe-resolver-260413k module to packages.scm and general-compat.scm."""

import tempfile
import shutil
import os

PACKAGES_SCM = "guix/gaurix/packages.scm"

# New exports to add to packages.scm (from recipe-resolver-260413k)
NEW_EXPORTS = [
    "sigscan-bin",
    "ast-grep-bin",
    "caescript-bin",
    "httptap-bin",
    "music-player-bin",
    "nijiexpose-bin",
    "git-switcher-bin",
    "tidewave-bin",
    "veracrypt-console-bin",
    "logisim-evolution-bin",
    "ledfx-cc-bin",
    "termtosvg",
    "pisek",
    "python-upnpclient",
    "python-backports.shutil-which",
    "snapborg",
    "pam-luks-keyring-unlock",
    "wlr-dpms",
    "wl-gears",
    "xtatusbar",
    "xdgctl",
    "terminalimageviewer",
    "snoop",
]

NEW_MODULES = [
    "(gaurix packages recipe-resolver-260413k)",
    "(gaurix packages recipe-resolver-260413k-blocked-notes)",
]


def update_packages_scm():
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    # Add exports after the comment line
    export_lines = "\n".join(f"            ;; recipe-resolver-260413k\n" + "\n".join(f"            {e}" for e in NEW_EXPORTS))

    # Insert exports right after the first line of define-module
    # Find the position after "(define-module (gaurix packages)\n"
    insert_marker = "(define-module (gaurix packages)\n"
    idx = content.find(insert_marker)
    if idx == -1:
        print("ERROR: Could not find define-module marker")
        return
    insert_pos = idx + len(insert_marker)
    content = content[:insert_pos] + "            ;; recipe-resolver-260413k\n" + \
              "\n".join(f"            {e}" for e in NEW_EXPORTS) + "\n" + \
              content[insert_pos:]

    # Add use-module lines before the closing paren
    close_idx = content.rfind(")")
    module_lines = "\n".join(f"  #:use-module {m}" for m in NEW_MODULES) + "\n"
    content = content[:close_idx] + module_lines + content[close_idx:]

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_SCM), suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as tmp:
            tmp.write(content)
        shutil.move(tmp_path, PACKAGES_SCM)
    except:
        os.unlink(tmp_path)
        raise

    print(f"Updated {PACKAGES_SCM}: added {len(NEW_EXPORTS)} exports and {len(NEW_MODULES)} modules")


if __name__ == "__main__":
    update_packages_scm()
