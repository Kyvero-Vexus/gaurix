#!/usr/bin/env python3
"""
recipe-resolver-260415w: Update todo_general_packages.org, packages.scm,
and general-compat.scm for the 260415w recipe resolver pass.

Processes 30 TODO queue packages (#14347-#14378) plus
11 existing BLOCKED NEEDS_RECIPE_DESIGN items.
"""
import shutil
import tempfile
import os

PASS_ID = "recipe-resolver-260415w"
BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TODO_FILE = os.path.join(BASE, "todo_general_packages.org")
PACKAGES_FILE = os.path.join(BASE, "guix", "gaurix", "packages.scm")
COMPAT_FILE = os.path.join(BASE, "guix", "gaurix", "packages", "general-compat.scm")

# --- Package status updates for TODO queue items ---
# (line_keyword, org_number, name, status_type, status_text)
# status_type: "done_recipe" | "blocked"

TODO_UPDATES = [
    # Resolved with recipes
    (14347, "python-dm-ollamalib",
     "done_recipe",
     "DONE: NEEDS_RECIPE_DESIGN resolved -- recipe in recipe-resolver-260415w.scm "
     "(python-dm-ollamalib v0.2.0, pyproject-build-system, MIT)"),
    (14349, "proxyguard",
     "done_recipe",
     "DONE: NEEDS_RECIPE_DESIGN resolved -- recipe in recipe-resolver-260415w.scm "
     "(proxyguard v2.0.1, go-build-system, MIT)"),
    (14350, "ollama-cli",
     "done_recipe",
     "DONE: NEEDS_RECIPE_DESIGN resolved -- recipe in recipe-resolver-260415w.scm "
     "(ollama-cli v0.2.0, pyproject-build-system, MIT)"),
    (14352, "bptt",
     "done_recipe",
     "DONE: NEEDS_RECIPE_DESIGN resolved -- recipe in recipe-resolver-260415w.scm "
     "(bptt v1.0.0, go-build-system, MIT)"),
    (14358, "f43-backgrounds",
     "done_recipe",
     "DONE: NEEDS_RECIPE_DESIGN resolved -- recipe in recipe-resolver-260415w.scm "
     "(f43-backgrounds v43.0.4, gnu-build-system, CC-BY-SA-4.0)"),
    (14359, "ttf-medievalsharp",
     "done_recipe",
     "DONE: NEEDS_RECIPE_DESIGN resolved -- recipe in recipe-resolver-260415w.scm "
     "(ttf-medievalsharp v20200401, copy-build-system, OFL-1.1)"),
    (14362, "oplpctools",
     "done_recipe",
     "DONE: NEEDS_RECIPE_DESIGN resolved -- recipe in recipe-resolver-260415w.scm "
     "(oplpctools v3.1, cmake-build-system, GPL-3.0)"),
    (14369, "gnome-tuner",
     "done_recipe",
     "DONE: NEEDS_RECIPE_DESIGN resolved -- recipe in recipe-resolver-260415w.scm "
     "(gnome-tuner v0.6.6, meson-build-system, GPL-3.0+)"),
    (14370, "python-dlt",
     "done_recipe",
     "DONE: NEEDS_RECIPE_DESIGN resolved -- recipe in recipe-resolver-260415w.scm "
     "(python-dlt v1.15.0, pyproject-build-system/hatchling, Apache-2.0)"),
    (14373, "python-meilisearch-sdk",
     "done_recipe",
     "DONE: NEEDS_RECIPE_DESIGN resolved -- recipe in recipe-resolver-260415w.scm "
     "(python-meilisearch-sdk v7.1.2, pyproject-build-system/hatchling, MIT)"),
    (14378, "python-hyperscript",
     "done_recipe",
     "DONE: NEEDS_RECIPE_DESIGN resolved -- recipe in recipe-resolver-260415w.scm "
     "(python-hyperscript v0.3.0, pyproject-build-system, MIT)"),

    # Blocked items
    (14348, "python-databricks-sql-connector",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- HEAVY_PYTHON_DEPS: Poetry build with thrift/pybreaker/pyarrow; "
     "15+ transitive deps with tight version pinning"),
    (14351, "imagot-bin",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- GODOT_ENGINE_REQUIRED: Godot 4.5+ export toolchain not in Guix; "
     "building from source requires full Godot engine"),
    (14353, "linux-git-headers",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- KERNEL_HEADERS_VARIANT: mainline kernel headers; "
     "Guix provides linux-libre-headers; non-libre variant tracking impractical"),
    (14355, "python-scheduler-git",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- NEEDS_PYTHON_DEPS: requires python-tasklib (not in Guix) + "
     "Python 3.13+; runtime needs taskwarrior+timewarrior"),
    (14356, "juicity-server",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- FORKED_GO_DEPS: uses daeuniverse/quic-go custom fork + "
     "30+ indirect Go module deps; each needs separate Guix package"),
    (14357, "juicity-client",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- FORKED_GO_DEPS: same repo as juicity-server; "
     "shares forked QUIC dep tree"),
    (14360, "wl_shimeji-plugin-kwinsupport",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- MISSING_DEPS: requires wl_shimeji-git (unpackaged); "
     "plugin cannot function without host application"),
    (14361, "peep-bin",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- RUST_CRATE_VENDORING: Rust/Cargo needs crate enumeration; "
     "unmaintained since 2022"),
    (14363, "dnspeep-bin",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- RUST_CRATE_VENDORING: Rust/Cargo with libpcap; "
     "unmaintained since 2022"),
    (14364, "ttf-x2",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- COMPLEX_MULTI_SOURCE: 22 separate zip downloads from "
     "dl.irmug.com; unreliable host; no single archive"),
    (14365, "python-redshift-connector",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- PROPRIETARY_CLOUD_SDK: Amazon Redshift connector; "
     "heavy AWS SDK transitive deps"),
    (14366, "gnome-tuner-tweaks",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- NEEDS_GNOME_TUNER: plugin for gnome-tuner; "
     "package gnome-tuner first (done in this pass)"),
    (14367, "gnome-tuner-panel",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- NEEDS_GNOME_TUNER: plugin for gnome-tuner; "
     "package gnome-tuner first"),
    (14368, "gnome-tuner-gdm",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- NEEDS_GNOME_TUNER: plugin for gnome-tuner; "
     "requires GDM integration"),
    (14372, "python-bigframes",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- GOOGLE_CLOUD_DEPS: BigQuery DataFrames; "
     "50+ Google SDK transitive deps"),
    (14374, "askora",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- IMMATURE_PROJECT: v0.0.2 with 11 commits; "
     "needs openai+anthropic Python SDKs"),
    (14375, "pam-parallel",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- UNCLEAR_LICENSE: no LICENSE file in upstream repo; "
     "cannot determine license for Guix inclusion"),
    (14376, "nodejs-percollate",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- NODE_ECOSYSTEM: Node.js CLI with heavy npm deps; "
     "likely requires Puppeteer/Chromium"),
    (14377, "python-sqlmesh",
     "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN -- HEAVY_PYTHON_DEPS: large data framework; "
     "40+ Python deps including SQLGlot and database adapters"),
]

# --- Existing BLOCKED NEEDS_RECIPE_DESIGN items to update ---
# (line_number, org_number, name, resolution)
BLOCKED_NRD_UPDATES = [
    (100950, 13344, "qbittorrent-enhanced-ua",
     "DONE: NEEDS_RECIPE_DESIGN resolved -- ALREADY_PACKAGED: recipes exist in "
     "recipe-resolver-260414ab.scm and recipe-resolver-260415s.scm"),
    (99710, 13199, "scx-scheds-git",
     "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED -- BPF_KERNEL_SCHED: sched_ext needs "
     "BPF toolchain + 50+ Rust crates + kernel 6.12+; "
     "A1: BPF toolchain not in Guix; A2: 50+ crates; A3: kernel config coupling"),
    (99835, 13214, "zephyr-sdk",
     "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED -- CROSS_COMPILATION_SDK: 12+ target "
     "toolchains; Guix cross-base handles targets natively; "
     "A1: massive SDK; A2: Guix alternative exists; A3: embedded-only audience"),
    (100550, 13304, "organicmaps",
     "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED -- MASSIVE_NATIVE_BUILD: 100+ C++/Qt "
     "deps with custom Boost; mobile-first mapping; "
     "A1: 100+ unpackaged deps; A2: map data pipeline; A3: mobile-first"),
    (100567, 13305, "penpot",
     "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED -- CLOJURE_MULTI_SERVICE: "
     "backend+frontend+exporter needs leiningen+shadow-cljs+PostgreSQL+Redis+S3; "
     "A1: Clojure not in Guix; A2: 4+ ecosystems; A3: multi-service"),
    (100581, 13306, "penpot-exporter",
     "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED -- DEPENDS_ON_PENPOT: tightly coupled "
     "to penpot core; requires Playwright/Chromium; "
     "A1: penpot blocked; A2: Playwright not in Guix; A3: cannot function standalone"),
    (100656, 13314, "collabora-office",
     "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED -- MASSIVE_LIBREOFFICE_FORK: 10M+ LOC; "
     "hours-long build; WebSocket server + Qt6 wrapper; "
     "A1: hours-long build; A2: massive dep chain; A3: use Guix libreoffice"),
    (100684, 13316, "rust-aarch64-musl-git",
     "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED -- GUIX_NATIVE_CROSS: Guix handles "
     "cross-compilation natively via --target; "
     "A1: unnecessary; A2: Arch rustup-specific; A3: musl toolchain out of scope"),
    (100701, 13317, "rust-aarch64-gnu-git",
     "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED -- GUIX_NATIVE_CROSS: same as "
     "rust-aarch64-musl-git; Guix handles cross-compilation natively"),
    (100715, 13318, "lib32-rust-libs-git",
     "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED -- MULTILIB_UNSUPPORTED: Guix does not "
     "use lib32 multilib model; "
     "A1: no multilib support; A2: Arch-specific; A3: Guix builds per-target"),
    (100802, 13328, "sulis-git",
     "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED -- COMPLEX_RUST_GAME: tactical RPG with "
     "custom 2D engine; massive cargo dep tree; "
     "A1: 200+ crates; A2: custom engine; A3: niche game"),
]

# New exports for packages.scm
NEW_EXPORTS = [
    "proxyguard",
    "bptt",
    "f43-backgrounds",
    "ttf-medievalsharp",
    "python-hyperscript",
    "python-dm-ollamalib",
    "ollama-cli",
    "gnome-tuner",
    "oplpctools",
    "python-dlt",
    "python-meilisearch-sdk",
]


def update_todo_file():
    """Update todo_general_packages.org with status lines."""
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    # Build a map of org_number -> list of updates
    updates_by_number = {}
    for org_num, name, status_type, status_text in TODO_UPDATES:
        updates_by_number.setdefault(org_num, []).append(
            (name, status_type, status_text)
        )

    # Find and update each TODO entry
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        new_lines.append(line)

        # Check if this is a TODO header line for one of our packages
        for org_num, updates in updates_by_number.items():
            header_pattern = f"** TODO {org_num}."
            if line.startswith(header_pattern):
                # Find the end of this entry (next ** or EOF)
                j = i + 1
                while j < len(lines) and not lines[j].startswith("** "):
                    new_lines.append(lines[j])
                    j += 1

                # Add status update
                name, status_type, status_text = updates[0]
                if status_type == "done_recipe":
                    new_lines.append(f"   - Status: {status_text} ({PASS_ID})\n")
                    new_lines.append(f"   - TODO Status: DONE\n")
                else:
                    new_lines.append(f"   - Status: {status_text} ({PASS_ID})\n")
                    new_lines.append(f"   - TODO Status: BLOCKED\n")

                i = j
                break
        else:
            # Also handle existing BLOCKED NEEDS_RECIPE_DESIGN items
            for start_line, org_num, name, resolution in BLOCKED_NRD_UPDATES:
                header_pattern = f"** BLOCKED {org_num}. {name} [BLOCKED: NEEDS_RECIPE_DESIGN:"
                if line.strip().startswith(header_pattern.lstrip()):
                    # Find end of entry
                    j = i + 1
                    while j < len(lines) and not lines[j].startswith("** "):
                        new_lines.append(lines[j])
                        j += 1
                    # Add resolution
                    if resolution.startswith("DONE:"):
                        new_lines.append(f"   - Status: {resolution} ({PASS_ID})\n")
                        new_lines.append(f"   - TODO Status: DONE\n")
                    else:
                        new_lines.append(f"   - Status: {resolution} ({PASS_ID})\n")
                        new_lines.append(f"   - TODO Status: BLOCKED\n")
                    i = j
                    break
            else:
                i += 1
            continue
        continue

    # Write atomically
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(TODO_FILE))
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(new_lines)
        shutil.move(tmp, TODO_FILE)
    except:
        os.unlink(tmp)
        raise
    print(f"Updated {TODO_FILE}")


def update_packages_scm():
    """Add new exports to packages.scm using deterministic full-file transform."""
    with open(PACKAGES_FILE, "r") as f:
        content = f.read()

    # Find the closing "))" and insert exports before it
    # The file ends with "            android-tv-remote\n))\n"
    insert_marker = "            android-tv-remote\n))"
    if insert_marker not in content:
        # Fallback: find last "))"
        insert_pos = content.rfind("))")
        before = content[:insert_pos]
        after = content[insert_pos:]
    else:
        before = content.split(insert_marker)[0] + "            android-tv-remote\n"
        after = "))" + content.split(insert_marker)[1]

    # Add comment and new exports
    exports_block = f"            ;; {PASS_ID} (30 packages processed, 11 recipes)\n"
    for name in sorted(NEW_EXPORTS):
        exports_block += f"            {name}\n"

    new_content = before + exports_block + after

    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_FILE))
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmp, PACKAGES_FILE)
    except:
        os.unlink(tmp)
        raise
    print(f"Updated {PACKAGES_FILE}")


def update_general_compat():
    """Add module import and compat exports to general-compat.scm."""
    with open(COMPAT_FILE, "r") as f:
        content = f.read()

    # 1. Add #:use-module line after recipe-resolver-260415v
    old_import = "  #:use-module (gaurix packages recipe-resolver-260415v)"
    new_import = (
        old_import + "\n"
        f"  #:use-module (gaurix packages recipe-resolver-260415w)"
    )
    content = content.replace(old_import, new_import, 1)

    # 2. Add compat exports at the end
    compat_block = f"\n;; {PASS_ID}\n"
    for name in sorted(NEW_EXPORTS):
        compat_block += f"(define-public {name}/compat {name})\n"

    content = content.rstrip() + "\n" + compat_block

    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(COMPAT_FILE))
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp, COMPAT_FILE)
    except:
        os.unlink(tmp)
        raise
    print(f"Updated {COMPAT_FILE}")


if __name__ == "__main__":
    update_todo_file()
    update_packages_scm()
    update_general_compat()
    print(f"\nAll files updated for {PASS_ID}")
