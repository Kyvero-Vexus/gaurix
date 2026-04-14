#!/usr/bin/env python3
"""Generate recipe-resolver-260414w.scm — 100 compat-alias packages mapping AUR names to upstream Guix."""

import os
import re

REPO = "/home/slime/projects/gaurix"
PKG_DIR = os.path.join(REPO, "guix/gaurix/packages")
BATCH_ID = "recipe-resolver-260414w"

# ─── 100 packages: (aur_name, entry_number, guix_target, guix_module) ─────────
# Each entry: AUR package name, todo entry #, upstream Guix name, Guix module path
# Module paths verified via `guix show <name> | grep location:`

PACKAGES = [
    # ── Emacs packages (41) ──
    ("emacs-calfw-git", 39278, "emacs-calfw", "gnu packages emacs-xyz"),
    ("emacs-deferred", 39280, "emacs-deferred", "gnu packages emacs-xyz"),
    ("emacs-elpy", 39281, "emacs-elpy", "gnu packages emacs-xyz"),
    ("emacs-f", 39282, "emacs-f", "gnu packages emacs-build"),
    ("emacs-hydra", 39283, "emacs-hydra", "gnu packages emacs-xyz"),
    ("emacs-magit-popup", 39284, "emacs-magit-popup", "gnu packages emacs-xyz"),
    ("emacs-parseclj", 39288, "emacs-parseclj", "gnu packages emacs-xyz"),
    ("emacs-parseedn", 39289, "emacs-parseedn", "gnu packages emacs-xyz"),
    ("emacs-posframe", 39291, "emacs-posframe", "gnu packages emacs-xyz"),
    ("emacs-python-environment", 39293, "emacs-python-environment", "gnu packages emacs-xyz"),
    ("emacs-pyvenv", 39294, "emacs-pyvenv", "gnu packages emacs-xyz"),
    ("emacs-queue", 39295, "emacs-queue", "gnu packages emacs-xyz"),
    ("emacs-s", 39297, "emacs-s", "gnu packages emacs-build"),
    ("emacs-sly-git", 39298, "emacs-sly", "gnu packages emacs-xyz"),
    ("emacs-transient", 39300, "emacs-transient", "gnu packages emacs-xyz"),
    ("emacs-use-package", 39301, "emacs-use-package", "gnu packages emacs-xyz"),
    ("emacs-which-key", 39302, "emacs-which-key", "gnu packages emacs-xyz"),
    ("emacs-with-editor-git", 39303, "emacs-with-editor", "gnu packages emacs-xyz"),
    ("emacs-magit", 37909, "emacs-magit", "gnu packages emacs-xyz"),
    ("emacs-yaml-mode", 37957, "emacs-yaml-mode", "gnu packages emacs-xyz"),
    ("emacs-evil", 38128, "emacs-evil", "gnu packages emacs-xyz"),
    ("emacs-undo-tree", 38129, "emacs-undo-tree", "gnu packages emacs-xyz"),
    ("emacs-auto-complete", 38202, "emacs-auto-complete", "gnu packages emacs-xyz"),
    ("emacs-langtool", 38203, "emacs-langtool", "gnu packages emacs-xyz"),
    ("emacs-xclip", 38205, "emacs-xclip", "gnu packages emacs-xyz"),
    ("emacs-a", 38398, "emacs-a", "gnu packages emacs-xyz"),
    ("emacs-helm", 38399, "emacs-helm", "gnu packages emacs-xyz"),
    ("emacs-julia-mode", 38400, "emacs-julia-mode", "gnu packages emacs-xyz"),
    ("emacs-sesman", 38401, "emacs-sesman", "gnu packages emacs-xyz"),
    ("emacs-yasnippet", 38402, "emacs-yasnippet", "gnu packages emacs-xyz"),
    ("emacs-paredit", 37571, "emacs-paredit", "gnu packages emacs-xyz"),
    ("emacs-dash", 37653, "emacs-dash", "gnu packages emacs-build"),
    ("emacs-mmm-mode", 37654, "emacs-mmm-mode", "gnu packages emacs-xyz"),
    ("emacs-sml-mode", 37713, "emacs-sml-mode", "gnu packages emacs-xyz"),
    ("emacs-markdown-mode", 37740, "emacs-markdown-mode", "gnu packages emacs-xyz"),
    ("emacs-mew", 37811, "emacs-mew", "gnu packages mail"),
    ("emacs-ess", 37438, "emacs-ess", "gnu packages statistics"),
    ("emacs-js2-mode", 37516, "emacs-js2-mode", "gnu packages emacs-xyz"),
    ("emacs-company-mode", 31196, "emacs-company", "gnu packages emacs-xyz"),
    ("emacs-apache-mode", 38070, "emacs-apache-mode", "gnu packages emacs-xyz"),
    ("emacs-d-mode", 38071, "emacs-d-mode", "gnu packages emacs-xyz"),

    # ── R packages (28) ──
    ("r-rcpp", 37805, "r-rcpp", "gnu packages cran"),
    ("r-ggplot2", 37943, "r-ggplot2", "gnu packages cran"),
    ("r-glue", 37944, "r-glue", "gnu packages cran"),
    ("r-magrittr", 37945, "r-magrittr", "gnu packages cran"),
    ("r-r6", 38035, "r-r6", "gnu packages statistics"),
    ("r-catools", 38048, "r-catools", "gnu packages cran"),
    ("r-cli", 38049, "r-cli", "gnu packages cran"),
    ("r-crayon", 38050, "r-crayon", "gnu packages cran"),
    ("r-digest", 38051, "r-digest", "gnu packages cran"),
    ("r-ellipsis", 38052, "r-ellipsis", "gnu packages cran"),
    ("r-evaluate", 38053, "r-evaluate", "gnu packages cran"),
    ("r-fansi", 38054, "r-fansi", "gnu packages cran"),
    ("r-rlang", 38055, "r-rlang", "gnu packages statistics"),
    ("r-stringi", 38056, "r-stringi", "gnu packages cran"),
    ("r-testthat", 38057, "r-testthat", "gnu packages statistics"),
    ("r-mime", 38157, "r-mime", "gnu packages cran"),
    ("r-httr", 38158, "r-httr", "gnu packages cran"),
    ("r-jsonlite", 38159, "r-jsonlite", "gnu packages cran"),
    ("r-tidyverse", 38166, "r-tidyverse", "gnu packages cran"),
    ("r-assertthat", 38169, "r-assertthat", "gnu packages cran"),
    ("r-callr", 38170, "r-callr", "gnu packages cran"),
    ("r-desc", 38171, "r-desc", "gnu packages cran"),
    ("r-e1071", 38172, "r-e1071", "gnu packages cran"),
    ("r-pkgload", 38174, "r-pkgload", "gnu packages cran"),
    ("r-praise", 38175, "r-praise", "gnu packages cran"),
    ("r-processx", 38176, "r-processx", "gnu packages cran"),
    ("r-ps", 38177, "r-ps", "gnu packages cran"),
    ("r-rprojroot", 38178, "r-rprojroot", "gnu packages statistics"),

    # ── Python packages (31) ──
    ("python-ipdb", 38573, "python-ipdb", "gnu packages python-xyz"),
    ("python-simpy", 38560, "python-simpy", "gnu packages simulation"),
    ("python-tablib", 38468, "python-tablib", "gnu packages python-xyz"),
    ("python-flake8-quotes", 38450, "python-flake8-quotes", "gnu packages python-xyz"),
    ("python-croniter", 38531, "python-croniter", "gnu packages python-xyz"),
    ("python-glfw", 38562, "python-glfw", "gnu packages python-graphics"),
    ("python-py4j", 38463, "python-py4j", "gnu packages python-xyz"),
    ("python-plotnine", 38589, "python-plotnine", "gnu packages python-science"),
    ("python-branca", 38521, "python-branca", "gnu packages python-web"),
    ("python-inotify", 38508, "python-inotify", "gnu packages python-xyz"),
    ("python-pytoml", 38584, "python-pytoml", "gnu packages python-build"),
    ("python-scooby", 38590, "python-scooby", "gnu packages python-xyz"),
    ("python-annexremote", 38702, "python-annexremote", "gnu packages python-xyz"),
    ("python-devtools", 38563, "python-devtools", "gnu packages python-xyz"),
    ("python-retry", 38565, "python-retry", "gnu packages python-xyz"),
    ("python-asn1tools", 38575, "python-asn1tools", "gnu packages python-xyz"),
    ("python-bitstruct", 38577, "python-bitstruct", "gnu packages python-xyz"),
    ("python-tatsu", 38581, "python-tatsu", "gnu packages python-xyz"),
    ("python-rst2ansi", 38466, "python-rst2ansi", "gnu packages python-xyz"),
    ("python-pytaglib", 38464, "python-pytaglib", "gnu packages mp3"),
    ("python-skyfield", 38467, "python-skyfield", "gnu packages astronomy"),
    ("python-logzero", 38456, "python-logzero", "gnu packages python-xyz"),
    ("python-lunr", 38457, "python-lunr", "gnu packages python-xyz"),
    ("python-pathos", 38461, "python-pathos", "gnu packages parallel"),
    ("python-ppft", 38462, "python-ppft", "gnu packages parallel"),
    ("python-isbnlib", 38453, "python-isbnlib", "gnu packages python-xyz"),
    ("python-locust", 38455, "python-locust", "gnu packages benchmark"),
    ("python-geventhttpclient", 38451, "python-geventhttpclient", "gnu packages python-web"),
    ("python-gguf", 38532, "python-gguf", "gnu packages machine-learning"),
    ("python-ndeflib", 38547, "python-ndeflib", "gnu packages python-xyz"),
    ("python-docstring-parser", 38549, "python-docstring-parser", "gnu packages python-xyz"),
]

assert len(PACKAGES) == 100, f"Expected 100 packages, got {len(PACKAGES)}"


def mod_to_prefix(mod_str):
    """Convert 'gnu packages emacs-xyz' to 'emacs-xyz:' prefix."""
    parts = mod_str.split()
    return parts[-1].replace("-", "_") + ":"


def main():
    aur_names = [p[0] for p in PACKAGES]
    # Collect unique Guix modules needed
    modules_needed = sorted(set(p[3] for p in PACKAGES))

    # Create unique prefix for each module
    mod_prefix = {}
    for mod in modules_needed:
        parts = mod.split()
        # Use last segment, replacing hyphens with underscores for valid Scheme identifiers
        prefix = parts[-1].replace("-", "_") + "_"
        # Handle potential conflicts by adding more context
        if prefix in mod_prefix.values():
            prefix = "_".join(parts).replace("-", "_") + "_"
        mod_prefix[mod] = prefix

    # ─── Generate recipe .scm file ───────────────────────────────────
    lines = []
    lines.append(f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- {BATCH_ID}
;;; Resolves 100 packages from general queue:
;;;   - 100 compat aliases mapping AUR package names to upstream Guix packages
;;;   - Categories: 41 Emacs, 28 R/CRAN, 31 Python
;;;
;;; These are AUR-named packages that already exist in upstream GNU Guix
;;; under the same or similar names.  Each alias inherits the upstream
;;; package and overrides only the name field so that
;;; `guix build -L guix <aur-name>` resolves correctly.
;;;
;;; Modules are imported with #:prefix to avoid circular name shadowing
;;; when the AUR name matches the upstream Guix name exactly.

(define-module (gaurix packages {BATCH_ID})
  #:use-module (guix packages)''')

    for mod in modules_needed:
        prefix = mod_prefix[mod]
        lines.append(f"  #:use-module (({mod}) #:prefix {prefix})")

    lines.append(f"  #:export ({aur_names[0]}")
    for name in aur_names[1:]:
        lines.append(f"            {name}")
    lines.append("))\n")

    # Category labels
    categories_emacs = "Emacs packages (compat aliases to upstream Guix emacs-* packages)"
    categories_r = "R/CRAN packages (compat aliases to upstream Guix r-* packages)"
    categories_python = "Python packages (compat aliases to upstream Guix python-* packages)"

    current_section = None
    for aur_name, entry_num, guix_name, guix_mod in PACKAGES:
        # Determine section
        if aur_name.startswith("emacs-"):
            section = categories_emacs
        elif aur_name.startswith("r-"):
            section = categories_r
        elif aur_name.startswith("python-"):
            section = categories_python
        else:
            section = "Other packages"

        if section != current_section:
            current_section = section
            lines.append(f"\n;;; {'─' * 66}")
            lines.append(f";;; {section}")
            lines.append(f";;; {'─' * 66}\n")

        prefix = mod_prefix[guix_mod]
        prefixed_guix = f"{prefix}{guix_name}"
        lines.append(f'(define-public {aur_name}')
        lines.append(f'  (package')
        lines.append(f'    (inherit {prefixed_guix})')
        lines.append(f'    (name "{aur_name}")))')
        lines.append("")

    recipe_content = "\n".join(lines) + "\n"

    # Write recipe file atomically
    recipe_path = os.path.join(PKG_DIR, f"{BATCH_ID}.scm")
    tmpf = recipe_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(recipe_content)
    os.rename(tmpf, recipe_path)
    print(f"[OK] Wrote {recipe_path} ({len(recipe_content)} bytes, {len(PACKAGES)} recipes)")

    # ─── Update general-compat.scm ──────────────────────────────────
    gc_path = os.path.join(PKG_DIR, "general-compat.scm")
    with open(gc_path, "r") as f:
        gc_content = f.read()

    new_use = f"  #:use-module (gaurix packages {BATCH_ID})"
    if new_use not in gc_content:
        last_gaurix_pos = gc_content.rfind("#:use-module (gaurix packages ")
        if last_gaurix_pos != -1:
            eol = gc_content.index("\n", last_gaurix_pos)
            gc_content = gc_content[:eol+1] + new_use + "\n" + gc_content[eol+1:]

    tmpf = gc_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(gc_content)
    os.rename(tmpf, gc_path)
    print(f"[OK] Updated {gc_path}")

    # ─── Update packages.scm ────────────────────────────────────────
    pkg_path = os.path.join(REPO, "guix/gaurix/packages.scm")
    with open(pkg_path, "r") as f:
        pkg_content = f.read()

    marker = f";; {BATCH_ID}"
    if marker not in pkg_content:
        new_block = f"""
{marker}
(define-module (gaurix packages)
  #:use-module (gaurix packages {BATCH_ID})
  #:re-export ({aur_names[0]}
"""
        for name in aur_names[1:]:
            new_block += f"               {name}\n"
        new_block += "))\n"

        pkg_content = pkg_content.rstrip() + "\n" + new_block

    tmpf = pkg_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(pkg_content)
    os.rename(tmpf, pkg_path)
    print(f"[OK] Updated {pkg_path}")

    # ─── Update todo_general_packages.org ────────────────────────────
    todo_path = os.path.join(REPO, "todo_general_packages.org")
    with open(todo_path, "r") as f:
        todo_content = f.read()

    done_set = {p[0]: p[1] for p in PACKAGES}  # aur_name -> entry_num

    lines_list = todo_content.split("\n")
    new_lines = []
    i = 0
    updated_count = 0
    while i < len(lines_list):
        line = lines_list[i]
        m = re.match(r'^(\*\*) TODO (\d+)\. (.+)$', line)
        if m:
            num = int(m.group(2))
            pkg_name = m.group(3).strip()

            matched = False
            if pkg_name in done_set and done_set[pkg_name] == num:
                matched = True
            else:
                for dname, dnum in done_set.items():
                    if dnum == num:
                        matched = True
                        break

            if matched:
                new_lines.append(f"** DONE {num}. {pkg_name}")
                i += 1
                while i < len(lines_list) and not lines_list[i].startswith("** "):
                    new_lines.append(lines_list[i])
                    i += 1
                new_lines.append(f"   - Status: DONE: already packaged as compat alias to upstream Guix (discovered {BATCH_ID})")
                new_lines.append(f"   - TODO Status: DONE")
                updated_count += 1
                continue

        new_lines.append(line)
        i += 1

    todo_new = "\n".join(new_lines)
    tmpf = todo_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(todo_new)
    os.rename(tmpf, todo_path)
    print(f"[OK] Updated {todo_path} ({updated_count} entries marked DONE)")

    # ─── Summary ─────────────────────────────────────────────────────
    print(f"\n=== Summary ===")
    print(f"Recipes created: {len(PACKAGES)}")
    print(f"  Emacs compat aliases: 41")
    print(f"  R/CRAN compat aliases: 28")
    print(f"  Python compat aliases: 31")
    print(f"Blocked: 0")
    print(f"Total attempted: {len(PACKAGES)}")


if __name__ == "__main__":
    main()
