#!/usr/bin/env python3
"""Programmatically update packages.scm to import recipe-resolver-260418w.

Deterministic full-file transform: read, compute, write temp, atomic move.
"""

import os
import tempfile
import shutil

PACKAGES_FILE = "/home/slime/projects/gaurix/guix/gaurix/packages.scm"
BATCH_ID = "recipe-resolver-260418w"
COMMENT = ";; recipe-resolver-260418w (19 NRD resolved, 11 EXHAUSTED)"

EXPORTS = [
    "python-dashtable",
    "python-certbot-pkcs12",
    "python-spitch",
    "python-invocation-tree",
    "python-dukpy",
    "python-pyexcel-ezodf",
    "wallman",
    "ttf-piazzolla",
    "stardict-full-eng-rus",
    "xdg-sound",
    "alttab",
    "gekkfetch",
    "jellyfetch",
    "tombl-bin",
    "klog-time-tracker-bin",
    "opkssh-bin",
    "puma-dev-bin",
    "rqlite-bin",
    "wdisplays-persistent",
]


def main():
    with open(PACKAGES_FILE, "r") as f:
        content = f.read()

    exports_str = "\n".join(f"               {e}" for e in EXPORTS)
    block = f"""
{COMMENT}
(define-module (gaurix packages)
  #:use-module (gaurix packages {BATCH_ID})
  #:re-export (
{exports_str}
               ))
"""

    content = content.rstrip("\n") + "\n" + block

    fd, tmp_path = tempfile.mkstemp(
        dir=os.path.dirname(PACKAGES_FILE), suffix=".tmp"
    )
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp_path, PACKAGES_FILE)
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"Updated {PACKAGES_FILE} with {len(EXPORTS)} re-exports for {BATCH_ID}")


if __name__ == "__main__":
    main()
