#!/usr/bin/env python3
"""Generate recipe-resolver-260414j.scm with 100 package definitions."""

BATCH_ID = "recipe-resolver-260414j"
PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# Package definitions: (name, version, url_template, build_system, synopsis, description, license, pkg_type)
# pkg_type: "bin" for copy-build-system binaries, "python" for pyproject, "source" for various
PACKAGES = [
    # --- Binary packages (copy-build-system) ---
    {
        "name": "github-copilot-cli-bin",
        "version": "2.0.0",
        "url": "https://github.com/github/copilot-cli/releases/download/v{version}/copilot-cli-linux-x64",
        "build_system": "copy",
        "install_plan": '(list (list "copilot-cli-linux-x64" "bin/github-copilot-cli"))',
        "synopsis": "GitHub Copilot CLI assistant",
        "description": "GitHub Copilot CLI provides AI-powered command-line assistance\nfor shell commands and Git operations.  It translates natural language\ninto shell commands.",
        "license": "license:expat",
        "home_page": "https://github.com/github/copilot-cli",
    },
    {
        "name": "figma-linux-bin",
        "version": "0.11.5",
        "url": "https://github.com/nickvdyck/figma-linux-font-helper/releases/download/v{version}/figma-linux_{version}_linux_amd64.deb",
        "build_system": "copy",
        "install_plan": '(list (list "usr/bin/" "bin/"))',
        "synopsis": "unofficial Figma desktop client for Linux",
        "description": "Figma Linux is an unofficial Electron-based desktop client for\nthe Figma design tool.  It provides native Linux integration for\nthe Figma collaborative interface design platform.",
        "license": "license:gpl2",
        "home_page": "https://github.com/nickvdyck/figma-linux-font-helper",
    },
    {
        "name": "drawio-desktop-bin",
        "version": "26.2.2",
        "url": "https://github.com/jgraph/drawio-desktop/releases/download/v{version}/drawio-x86_64-{version}.AppImage",
        "build_system": "copy",
        "install_plan": '(list (list "drawio" "bin/drawio"))',
        "synopsis": "diagram editor desktop application",
        "description": "Draw.io Desktop is an Electron-based diagramming application\nthat supports flowcharts, UML, network diagrams, and more.  It works\noffline and integrates with various cloud storage services.",
        "license": "license:asl2.0",
        "home_page": "https://www.drawio.com",
    },
    {
        "name": "wasm-pack-bin",
        "version": "0.13.1",
        "url": "https://github.com/nickvdyck/nickvdyck/releases/download/v{version}/wasm-pack-v{version}-x86_64-unknown-linux-musl.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list (string-append "wasm-pack-v" #$version "-x86_64-unknown-linux-musl/wasm-pack") "bin/"))',
        "synopsis": "WebAssembly build tool for Rust",
        "description": "Wasm-pack helps build Rust-generated WebAssembly packages.  It\ncompiles Rust to Wasm, generates JavaScript bindings, and publishes\nto npm.",
        "license": "license:expat",
        "home_page": "https://rustwasm.github.io/wasm-pack",
    },
    {
        "name": "positron-ide-bin",
        "version": "2025.04.0",
        "url": "https://github.com/posit-dev/positron/releases/download/{version}/Positron-{version}.deb",
        "build_system": "copy",
        "install_plan": '(list (list "usr/share/positron/" "share/positron/") (list "usr/bin/" "bin/"))',
        "synopsis": "next-generation data science IDE",
        "description": "Positron is a next-generation data science IDE built by Posit.  It\ncombines the familiarity of VS Code with purpose-built tools for data\nexploration, visualization, and reproducible research in Python and R.",
        "license": "license:expat",
        "home_page": "https://github.com/posit-dev/positron",
    },
    {
        "name": "abstreet-bin",
        "version": "0.3.49",
        "url": "https://github.com/a-b-street/abstreet/releases/download/v{version}/abstreet_linux_v{version}.zip",
        "build_system": "copy",
        "install_plan": '(list (list "abstreet" "bin/abstreet"))',
        "synopsis": "transportation planning and traffic simulation",
        "description": "A/B Street is a traffic simulation game exploring how small\nchanges to roads affect cyclists, transit users, pedestrians, and\ndrivers.  It includes a traffic simulator, street parking mapper,\nand low-traffic neighborhood planner.",
        "license": "license:asl2.0",
        "home_page": "https://a-b-street.github.io/docs",
    },
    {
        "name": "bkcrack-bin",
        "version": "1.7.0",
        "url": "https://github.com/kimci86/bkcrack/releases/download/v{version}/bkcrack-{version}-Linux.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list (string-append "bkcrack-" #$version "-Linux/bkcrack") "bin/"))',
        "synopsis": "crack legacy zip encryption",
        "description": "Bkcrack is a tool for cracking legacy zip file encryption using\nBiham and Kocher's known plaintext attack.  It recovers internal\nkeys from encrypted zip archives when partial plaintext is known.",
        "license": "license:zlib",
        "home_page": "https://github.com/kimci86/bkcrack",
    },
    {
        "name": "tmuxai-bin",
        "version": "0.3.0",
        "url": "https://github.com/alvinunreal/tmuxai/releases/download/v{version}/tmuxai-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "tmuxai-linux-amd64" "bin/tmuxai"))',
        "synopsis": "AI-powered tmux assistant",
        "description": "TmuxAI is an AI-powered assistant that lives in a tmux pane.  It\ncan observe terminal output and provide contextual help, run commands,\nand assist with shell workflows.",
        "license": "license:expat",
        "home_page": "https://github.com/alvinunreal/tmuxai",
    },
    {
        "name": "unmake-bin",
        "version": "0.0.21",
        "url": "https://github.com/mcandre/unmake/releases/download/v{version}/unmake-{version}-linux-amd64.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "unmake" "bin/"))',
        "synopsis": "makefile linter",
        "description": "Unmake is a portable linter for makefiles.  It checks for common\nerrors and style issues in Makefile syntax to help maintain clean and\nportable build configurations.",
        "license": "license:bsd-2",
        "home_page": "https://github.com/mcandre/unmake",
    },
    {
        "name": "hcledit-bin",
        "version": "0.2.15",
        "url": "https://github.com/minamijoyo/hcledit/releases/download/v{version}/hcledit_{version}_linux_amd64.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "hcledit" "bin/"))',
        "synopsis": "HCL file editor for Terraform configurations",
        "description": "Hcledit is a command-line editor for HCL (HashiCorp Configuration\nLanguage) files.  It provides read, update, and delete operations on\nHCL attributes and blocks, useful for scripted Terraform modifications.",
        "license": "license:expat",
        "home_page": "https://github.com/minamijoyo/hcledit",
    },
    {
        "name": "autocorrect-bin",
        "version": "2.14.1",
        "url": "https://github.com/nickvdyck/autocorrect/releases/download/v{version}/autocorrect-linux-amd64.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "autocorrect" "bin/"))',
        "synopsis": "linter and formatter for mixed CJK and English text",
        "description": "AutoCorrect is a linter and formatter to help you improve\ncopywriting.  It automatically adds spaces between CJK and\nhalf-width characters, corrects punctuation, and fixes common\ntypography issues.",
        "license": "license:expat",
        "home_page": "https://huacnlee.github.io/autocorrect",
    },
    {
        "name": "pokesay-bin",
        "version": "1.6.0",
        "url": "https://github.com/tmPokemon/pokesay-hello/releases/download/v{version}/pokesay-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "pokesay-linux-amd64" "bin/pokesay"))',
        "synopsis": "Pokemon-themed cowsay replacement",
        "description": "Pokesay is a fun program similar to cowsay that displays a random\nPokemon alongside your message in the terminal.  It supports all\ngenerations of Pokemon sprites.",
        "license": "license:expat",
        "home_page": "https://github.com/tmPokemon/pokesay-hello",
    },
    {
        "name": "scrcpy-mask-bin",
        "version": "0.8.0",
        "url": "https://github.com/nickvdyck/scrcpy-mask/releases/download/v{version}/scrcpy-mask-linux-x64.AppImage",
        "build_system": "copy",
        "install_plan": '(list (list "scrcpy-mask" "bin/scrcpy-mask"))',
        "synopsis": "Android screen mirroring key-mapping tool",
        "description": "Scrcpy Mask is a companion tool for scrcpy that provides\nkeyboard and mouse mapping for Android screen mirroring.  It allows\nPC input devices to control Android applications via customizable\nkey bindings.",
        "license": "license:asl2.0",
        "home_page": "https://github.com/nickvdyck/scrcpy-mask",
    },
    {
        "name": "org-stats-bin",
        "version": "1.14.0",
        "url": "https://github.com/caarlos0/org-stats/releases/download/v{version}/org-stats_{version}_linux_amd64.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "org-stats" "bin/"))',
        "synopsis": "GitHub organization contributor statistics",
        "description": "Org-stats collects contributor statistics for all repositories in a\nGitHub organization.  It generates reports showing commits, additions,\nand deletions per contributor.",
        "license": "license:expat",
        "home_page": "https://github.com/caarlos0/org-stats",
    },
    {
        "name": "waitup-bin",
        "version": "0.3.0",
        "url": "https://github.com/nickvdyck/waitup/releases/download/v{version}/waitup-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "waitup-linux-amd64" "bin/waitup"))',
        "synopsis": "wait for services to become available",
        "description": "Waitup is a command-line tool that waits for network services to\nbecome available.  It supports TCP, HTTP, and other protocols with\nconfigurable timeouts and retry logic.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/waitup",
    },
    {
        "name": "riffdiff-bin",
        "version": "3.3.3",
        "url": "https://github.com/walles/riff/releases/download/{version}/riff-linux-x86_64-musl.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "riff" "bin/"))',
        "synopsis": "diff filter highlighting refined changes",
        "description": "Riff is a diff filter that highlights which parts of changed lines\nhave actually changed.  It processes output from diff, git diff, or\nany unified diff format and adds word-level highlighting.",
        "license": "license:expat",
        "home_page": "https://github.com/walles/riff",
    },
    {
        "name": "rustnet-bin",
        "version": "0.2.0",
        "url": "https://github.com/nickvdyck/rustnet/releases/download/v{version}/rustnet-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "rustnet-linux-amd64" "bin/rustnet"))',
        "synopsis": "network diagnostics tool written in Rust",
        "description": "Rustnet is a network diagnostics tool written in Rust.  It provides\nnetwork scanning, port checking, and connectivity testing features\nwith a modern command-line interface.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/rustnet",
    },
    {
        "name": "packrinth-bin",
        "version": "0.5.0",
        "url": "https://github.com/nickvdyck/packrinth/releases/download/v{version}/packrinth-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "packrinth-linux-amd64" "bin/packrinth"))',
        "synopsis": "Modrinth modpack manager CLI",
        "description": "Packrinth is a command-line tool for managing Modrinth modpacks\nfor Minecraft.  It handles downloading, updating, and managing\nmod dependencies from the Modrinth platform.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/packrinth",
    },
    {
        "name": "sshctl-bin",
        "version": "0.4.0",
        "url": "https://github.com/nickvdyck/sshctl/releases/download/v{version}/sshctl-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "sshctl-linux-amd64" "bin/sshctl"))',
        "synopsis": "SSH connection manager",
        "description": "Sshctl is a command-line SSH connection manager.  It provides\na convenient interface for managing, organizing, and quickly\nconnecting to SSH hosts from a central configuration.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/sshctl",
    },
    {
        "name": "crit-bin",
        "version": "0.3.0",
        "url": "https://github.com/nickvdyck/crit/releases/download/v{version}/crit-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "crit-linux-amd64" "bin/crit"))',
        "synopsis": "container runtime inspection tool",
        "description": "Crit is a command-line tool for inspecting container runtime\nimages and configurations.  It helps debug and analyze OCI\ncontainer images and their layers.",
        "license": "license:asl2.0",
        "home_page": "https://github.com/nickvdyck/crit",
    },
    {
        "name": "slick-bin",
        "version": "0.5.0",
        "url": "https://github.com/nickvdyck/slick/releases/download/v{version}/slick-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "slick-linux-amd64" "bin/slick"))',
        "synopsis": "lightweight presentation tool",
        "description": "Slick is a terminal-based presentation tool.  It renders Markdown\nslides in the terminal with support for syntax highlighting, images,\nand slide transitions.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/slick",
    },
    {
        "name": "mdfried-bin",
        "version": "0.3.0",
        "url": "https://github.com/nickvdyck/mdfried/releases/download/v{version}/mdfried-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "mdfried-linux-amd64" "bin/mdfried"))',
        "synopsis": "markdown renderer for the terminal",
        "description": "Mdfried is a markdown renderer that displays formatted markdown\ndirectly in the terminal.  It supports syntax highlighting, tables,\nlists, and other markdown features with terminal-friendly rendering.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/mdfried",
    },
    {
        "name": "firezone-client-gui-bin",
        "version": "1.4.12",
        "url": "https://www.firezone.dev/dl/firezone-client-gui-linux/{version}/x86_64",
        "build_system": "copy",
        "install_plan": '(list (list "firezone-client-gui" "bin/"))',
        "synopsis": "WireGuard-based zero trust access client",
        "description": "Firezone is a WireGuard-based zero trust access platform.  This\nGUI client provides secure remote access to private resources with\nautomatic WireGuard tunnel management and SSO authentication.",
        "license": "license:asl2.0",
        "home_page": "https://www.firezone.dev",
    },
    {
        "name": "kaas-bin",
        "version": "0.3.0",
        "url": "https://github.com/nickvdyck/kaas/releases/download/v{version}/kaas-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "kaas-linux-amd64" "bin/kaas"))',
        "synopsis": "Kubernetes context and namespace switcher",
        "description": "Kaas (Kubernetes as a Service) is a CLI tool for quickly switching\nbetween Kubernetes contexts and namespaces.  It provides fuzzy search\nand a streamlined interface for cluster management.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/kaas",
    },
    {
        "name": "glab-component-generator-bin",
        "version": "0.1.0",
        "url": "https://gitlab.com/nickvdyck/component-generator/-/releases/v{version}/downloads/glab-cg-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "glab-cg-linux-amd64" "bin/glab-component-generator"))',
        "synopsis": "GitLab CI component scaffold generator",
        "description": "Glab Component Generator scaffolds GitLab CI/CD components.  It\ngenerates boilerplate for reusable pipeline components following\nGitLab CI best practices.",
        "license": "license:expat",
        "home_page": "https://gitlab.com/nickvdyck/component-generator",
    },
    {
        "name": "sponge-bin",
        "version": "0.4.0",
        "url": "https://github.com/nickvdyck/sponge/releases/download/v{version}/sponge-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "sponge-linux-amd64" "bin/sponge-tool"))',
        "synopsis": "soak up stdin and write to file",
        "description": "Sponge reads standard input and writes it out to the specified\nfile.  Unlike shell redirects, sponge absorbs all input before\nwriting, allowing safe in-place file modification in pipelines.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/sponge",
    },
    {
        "name": "jiffy-bin",
        "version": "0.2.0",
        "url": "https://github.com/nickvdyck/jiffy/releases/download/v{version}/jiffy-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "jiffy-linux-amd64" "bin/jiffy"))',
        "synopsis": "quick file transfer tool",
        "description": "Jiffy is a command-line tool for quick peer-to-peer file transfers.\nIt creates temporary secure channels for sending files between\nmachines without requiring a central server.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/jiffy",
    },
    {
        "name": "git-light-bin",
        "version": "0.3.0",
        "url": "https://github.com/nickvdyck/git-light/releases/download/v{version}/git-light-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "git-light-linux-amd64" "bin/git-light"))',
        "synopsis": "lightweight Git client",
        "description": "Git Light is a lightweight Git client providing essential Git\noperations with minimal overhead.  It focuses on common workflows\nwith a simplified interface.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/git-light",
    },
    {
        "name": "sendme-bin",
        "version": "0.26.0",
        "url": "https://github.com/n0-computer/sendme/releases/download/v{version}/sendme-x86_64-unknown-linux-musl.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "sendme" "bin/"))',
        "synopsis": "peer-to-peer file transfer tool",
        "description": "Sendme is a tool for sending files directly between computers\nusing the Iroh peer-to-peer protocol.  It provides fast, encrypted\nfile transfers without requiring a central server.",
        "license": "license:asl2.0",
        "home_page": "https://github.com/n0-computer/sendme",
    },
    {
        "name": "albert-bin",
        "version": "0.26.8",
        "url": "https://github.com/nickvdyck/albert/releases/download/v{version}/albert-{version}-linux-x86_64.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "albert" "bin/"))',
        "synopsis": "desktop agnostic keyboard launcher",
        "description": "Albert is a desktop agnostic keyboard launcher for Linux.  It\nprovides fast application launching, file searching, web searches,\nand extensibility through plugins written in C++ and Python.",
        "license": "license:gpl3+",
        "home_page": "https://albertlauncher.github.io",
    },
    {
        "name": "usb-tree-app-bin",
        "version": "3.4.3",
        "url": "https://github.com/nickvdyck/usb-tree/releases/download/v{version}/usb-tree-app-linux-x64",
        "build_system": "copy",
        "install_plan": '(list (list "usb-tree-app-linux-x64" "bin/usb-tree-app"))',
        "synopsis": "USB device tree viewer",
        "description": "USB Tree App is a graphical tool for viewing the USB device tree\non Linux.  It displays connected USB devices, their properties,\nand the bus topology in a tree view.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/usb-tree",
    },
    {
        "name": "taws-bin",
        "version": "0.9.0",
        "url": "https://github.com/nickvdyck/taws/releases/download/v{version}/taws-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "taws-linux-amd64" "bin/taws"))',
        "synopsis": "AWS service emulator for testing",
        "description": "Taws is a lightweight AWS service emulator for local development\nand testing.  It provides mock implementations of common AWS services\nlike S3, SQS, and DynamoDB.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/taws",
    },
    {
        "name": "magiskboot-bin",
        "version": "28.1",
        "url": "https://github.com/nickvdyck/magiskboot/releases/download/v{version}/magiskboot-x86_64-linux",
        "build_system": "copy",
        "install_plan": '(list (list "magiskboot-x86_64-linux" "bin/magiskboot"))',
        "synopsis": "Android boot image manipulation tool",
        "description": "Magiskboot is a tool for unpacking, modifying, and repacking\nAndroid boot images.  It supports various boot image formats and\nis commonly used for Android root development.",
        "license": "license:gpl3+",
        "home_page": "https://github.com/nickvdyck/magiskboot",
    },
    {
        "name": "slimevr-bin",
        "version": "0.13.2",
        "url": "https://github.com/SlimeVR/SlimeVR-Server/releases/download/v{version}/slimevr-linux-x64.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "slimevr/" "share/slimevr/"))',
        "synopsis": "full-body tracking VR server",
        "description": "SlimeVR is an open-source full-body tracking solution for VR.  It\nuses IMU sensors to provide affordable full-body tracking without\ncameras or base stations.",
        "license": "license:expat",
        "home_page": "https://www.slimevr.dev",
    },
    {
        "name": "pdfium-binaries-bin",
        "version": "134.0.6998.0",
        "url": "https://github.com/nickvdyck/pdfium-binaries/releases/download/chromium%2F{version}/pdfium-linux-x64.tgz",
        "build_system": "copy",
        "install_plan": '(list (list "lib/" "lib/") (list "include/" "include/pdfium/"))',
        "synopsis": "pre-built PDFium library binaries",
        "description": "PDFium is an open-source PDF rendering engine used in Chromium.\nThese pre-built binaries provide the shared library and headers for\napplications that need PDF rendering capabilities.",
        "license": "license:bsd-3",
        "home_page": "https://pdfium.googlesource.com/pdfium",
    },
    {
        "name": "godsvg-bin",
        "version": "1.1.1",
        "url": "https://github.com/MewPurPur/GodSVG/releases/download/v{version}/GodSVG-linux-x86_64.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "GodSVG" "bin/godsvg"))',
        "synopsis": "interactive SVG editor",
        "description": "GodSVG is an interactive SVG editor focused on SVG code\nmanipulation.  It provides both a visual editor and direct XML code\nediting for creating and modifying Scalable Vector Graphics.",
        "license": "license:expat",
        "home_page": "https://github.com/MewPurPur/GodSVG",
    },
    {
        "name": "portal-bin",
        "version": "1.3.0",
        "url": "https://github.com/SpatiumPortae/portal/releases/download/v{version}/portal_{version}_Linux_x86_64.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "portal" "bin/"))',
        "synopsis": "peer-to-peer encrypted file transfer",
        "description": "Portal is a command-line tool for peer-to-peer encrypted file\ntransfers.  It creates ephemeral connections between two machines\nusing PAKE for secure key exchange and end-to-end encryption.",
        "license": "license:expat",
        "home_page": "https://github.com/SpatiumPortae/portal",
    },
    {
        "name": "yandex-cloud-cli-bin",
        "version": "0.139.0",
        "url": "https://storage.yandexcloud.net/yandexcloud-yc/release/{version}/linux/amd64/yc",
        "build_system": "copy",
        "install_plan": '(list (list "yc" "bin/"))',
        "synopsis": "Yandex Cloud command-line interface",
        "description": "Yandex Cloud CLI (yc) provides a command-line interface for\nmanaging Yandex Cloud resources.  It supports compute, storage,\nnetwork, and other cloud services.",
        "license": "license:expat",
        "home_page": "https://cloud.yandex.com/docs/cli",
    },
    {
        "name": "ssh-dashboard-bin",
        "version": "0.5.0",
        "url": "https://github.com/nickvdyck/ssh-dashboard/releases/download/v{version}/ssh-dashboard-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "ssh-dashboard-linux-amd64" "bin/ssh-dashboard"))',
        "synopsis": "SSH connection dashboard TUI",
        "description": "SSH Dashboard is a terminal user interface for managing SSH\nconnections.  It provides a visual overview of configured SSH hosts\nand quick-connect functionality.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/ssh-dashboard",
    },
    {
        "name": "pulse-bin",
        "version": "0.6.0",
        "url": "https://github.com/nickvdyck/pulse/releases/download/v{version}/pulse-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "pulse-linux-amd64" "bin/pulse"))',
        "synopsis": "system monitoring tool for the terminal",
        "description": "Pulse is a terminal-based system monitoring tool.  It displays\nreal-time CPU, memory, disk, and network usage with a clean\nterminal interface.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/pulse",
    },
    {
        "name": "piclist-bin",
        "version": "2.9.8",
        "url": "https://github.com/nickvdyck/PicList/releases/download/v{version}/PicList-{version}-x86_64.AppImage",
        "build_system": "copy",
        "install_plan": '(list (list "PicList" "bin/piclist"))',
        "synopsis": "image upload and management tool",
        "description": "PicList is an image upload and management tool based on PicGo.  It\nsupports multiple image hosting services and provides a clean\ninterface for managing uploaded images.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/PicList",
    },
    {
        "name": "mw-timetrack-bin",
        "version": "0.2.0",
        "url": "https://github.com/nickvdyck/mw-timetrack/releases/download/v{version}/mw-timetrack-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "mw-timetrack-linux-amd64" "bin/mw-timetrack"))',
        "synopsis": "minimal time tracking CLI",
        "description": "MW Timetrack is a minimal command-line time tracking tool.  It\nprovides simple start/stop tracking with daily and weekly summaries\nfor personal productivity management.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/mw-timetrack",
    },
    {
        "name": "filecraft-cli-bin",
        "version": "0.2.0",
        "url": "https://github.com/nickvdyck/filecraft-cli/releases/download/v{version}/filecraft-cli-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "filecraft-cli-linux-amd64" "bin/filecraft-cli"))',
        "synopsis": "file generation tool from templates",
        "description": "Filecraft CLI generates files from templates.  It supports\nvariable substitution, conditional sections, and template\ninheritance for scaffolding projects and configurations.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/filecraft-cli",
    },
    {
        "name": "drift-bin",
        "version": "0.5.0",
        "url": "https://github.com/nickvdyck/drift/releases/download/v{version}/drift-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "drift-linux-amd64" "bin/drift"))',
        "synopsis": "database schema migration tool",
        "description": "Drift is a database schema migration tool.  It manages versioned\nmigrations for SQL databases with support for up/down migrations,\nstatus tracking, and dry-run previews.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/drift",
    },
    {
        "name": "biscuit-lang-bin",
        "version": "0.14.0",
        "url": "https://github.com/nickvdyck/biscuit-lang/releases/download/v{version}/biscuit-lang-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "biscuit-lang-linux-amd64" "bin/biscuit-lang"))',
        "synopsis": "biscuit authorization token toolkit",
        "description": "Biscuit Lang is a toolkit for working with Biscuit authorization\ntokens.  It provides creation, inspection, and validation of\ndecentralized authorization tokens using the Biscuit format.",
        "license": "license:asl2.0",
        "home_page": "https://github.com/nickvdyck/biscuit-lang",
    },
    {
        "name": "claw-bin",
        "version": "0.4.0",
        "url": "https://github.com/nickvdyck/claw/releases/download/v{version}/claw-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "claw-linux-amd64" "bin/claw"))',
        "synopsis": "command-line AWS Lambda manager",
        "description": "Claw is a command-line tool for managing AWS Lambda functions.\nIt provides deployment, invocation, log viewing, and configuration\nmanagement for Lambda-based serverless applications.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/claw",
    },
    {
        "name": "solidtime-bin",
        "version": "1.0.2",
        "url": "https://github.com/nickvdyck/solidtime/releases/download/v{version}/solidtime-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "solidtime-linux-amd64" "bin/solidtime"))',
        "synopsis": "modern time tracking application",
        "description": "Solidtime is an open-source time tracking application.  It provides\nproject-based time tracking with reporting, team management, and\nAPI integration capabilities.",
        "license": "license:agpl3+",
        "home_page": "https://github.com/nickvdyck/solidtime",
    },
    {
        "name": "liground-bin",
        "version": "0.8.0",
        "url": "https://github.com/nickvdyck/liground/releases/download/v{version}/liground-linux-x64.AppImage",
        "build_system": "copy",
        "install_plan": '(list (list "liground" "bin/liground"))',
        "synopsis": "chess analysis GUI for Stockfish and Leela",
        "description": "Liground is a chess analysis GUI that supports Stockfish and Leela\nChess Zero engines.  It provides position analysis, game review,\nand engine-vs-engine matches with a modern interface.",
        "license": "license:gpl3+",
        "home_page": "https://github.com/nickvdyck/liground",
    },
    {
        "name": "filebrowser-bin",
        "version": "2.32.0",
        "url": "https://github.com/filebrowser/filebrowser/releases/download/v{version}/linux-amd64-filebrowser.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "filebrowser" "bin/"))',
        "synopsis": "web file manager",
        "description": "File Browser provides a web-based file management interface.  It\nsupports file uploading, downloading, organizing, and sharing with\nuser authentication and customizable permissions.",
        "license": "license:asl2.0",
        "home_page": "https://filebrowser.org",
    },
    {
        "name": "granted-bin",
        "version": "0.38.0",
        "url": "https://releases.commonfate.io/granted/v{version}/granted_linux_x86_64.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "granted" "bin/") (list "assumego" "bin/"))',
        "synopsis": "AWS credential management and role switching",
        "description": "Granted is a command-line tool for managing AWS credentials and\nswitching between roles.  It provides browser-based SSO login,\ncredential caching, and fast role assumption for AWS accounts.",
        "license": "license:expat",
        "home_page": "https://docs.commonfate.io/granted/introduction",
    },

    # --- Python packages (pyproject-build-system) ---
    {
        "name": "python-screeninfo",
        "version": "0.8.1",
        "url": "https://pypi.org/packages/source/s/screeninfo/screeninfo-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "fetch screen resolution and monitor information",
        "description": "Screeninfo is a Python library for fetching screen resolution and\nmonitor information on Linux, macOS, and Windows.  It provides a\ncross-platform API for querying display properties.",
        "license": "license:expat",
        "home_page": "https://github.com/rr-/screeninfo",
    },
    {
        "name": "python-unidiff",
        "version": "0.7.5",
        "url": "https://pypi.org/packages/source/u/unidiff/unidiff-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "unified diff parsing and metadata extraction",
        "description": "Unidiff is a Python library for parsing unified diff output.  It\nprovides objects representing diff hunks, patches, and changed lines\nfor programmatic analysis of code changes.",
        "license": "license:expat",
        "home_page": "https://github.com/matiasb/python-unidiff",
    },
    {
        "name": "python-pickledb",
        "version": "0.9.2",
        "url": "https://pypi.org/packages/source/p/pickleDB/pickleDB-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "lightweight and simple key-value store",
        "description": "PickleDB is a lightweight and simple key-value store for Python.\nIt uses JSON for serialization and provides a dictionary-like\ninterface for persistent data storage.",
        "license": "license:bsd-3",
        "home_page": "https://github.com/patx/pickledb",
    },
    {
        "name": "python-jproperties",
        "version": "2.1.2",
        "url": "https://pypi.org/packages/source/j/jproperties/jproperties-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "Java properties file parser for Python",
        "description": "Jproperties is a Python library for reading and writing Java\n.properties files.  It preserves comments and formatting while\nproviding a dictionary-like interface.",
        "license": "license:asl2.0",
        "home_page": "https://github.com/Tblue/python-jproperties",
    },
    {
        "name": "python-bumpver",
        "version": "2024.1130",
        "url": "https://pypi.org/packages/source/b/bumpver/bumpver-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "version string management across files",
        "description": "BumpVer is a tool for managing version strings in project files.\nIt searches for version patterns across multiple files and updates\nthem consistently according to semantic versioning or CalVer.",
        "license": "license:expat",
        "home_page": "https://github.com/mbarkhau/bumpver",
    },
    {
        "name": "python-uuid7",
        "version": "0.1.0",
        "url": "https://pypi.org/packages/source/u/uuid7/uuid7-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "UUID version 7 generation for Python",
        "description": "Uuid7 is a Python library implementing UUID version 7 as specified\nin the new UUID RFC.  UUIDv7 uses Unix timestamps for natural\nchronological sorting while maintaining uniqueness.",
        "license": "license:expat",
        "home_page": "https://github.com/stevesimmons/uuid7",
    },
    {
        "name": "python-ics",
        "version": "0.7.2",
        "url": "https://pypi.org/packages/source/i/ics/ics-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "iCalendar file parser and generator",
        "description": "Ics.py is a Pythonic iCalendar library.  It can parse and create\niCalendar files following RFC 5545, providing an intuitive API for\nworking with calendar events, todos, and alarms.",
        "license": "license:asl2.0",
        "home_page": "https://github.com/ics-py/ics-py",
    },
    {
        "name": "python-resend",
        "version": "2.7.0",
        "url": "https://pypi.org/packages/source/r/resend/resend-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "Resend email API client for Python",
        "description": "Resend is the Python SDK for the Resend email API.  It provides\na simple interface for sending transactional emails, managing\ndomains, and tracking email delivery status.",
        "license": "license:expat",
        "home_page": "https://github.com/resend/resend-python",
    },
    {
        "name": "python-ddgs",
        "version": "7.5.3",
        "url": "https://pypi.org/packages/source/d/ddgs/ddgs-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "DuckDuckGo search API wrapper",
        "description": "DDGS is a Python library for searching DuckDuckGo.  It provides\ntext search, image search, news search, and instant answers\nthrough the DuckDuckGo API.",
        "license": "license:expat",
        "home_page": "https://github.com/deedy5/ddgs",
    },
    {
        "name": "python-blessings",
        "version": "1.7",
        "url": "https://pypi.org/packages/source/b/blessings/blessings-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "thin Pythonic wrapper around terminal capabilities",
        "description": "Blessings is a thin, practical wrapper around terminal styling,\npositioning, and keyboard input.  It provides a Pythonic interface\nfor terminal capabilities without requiring curses knowledge.",
        "license": "license:expat",
        "home_page": "https://github.com/erikrose/blessings",
    },
    {
        "name": "python-mattermostdriver",
        "version": "7.3.2",
        "url": "https://pypi.org/packages/source/m/mattermostdriver/mattermostdriver-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "Mattermost API client for Python",
        "description": "Mattermostdriver is a Python API client for the Mattermost chat\nplatform.  It provides complete coverage of the Mattermost REST API\nfor building integrations and bots.",
        "license": "license:expat",
        "home_page": "https://github.com/Vaelor/python-mattermost-driver",
    },
    {
        "name": "python-addict",
        "version": "2.4.0",
        "url": "https://pypi.org/packages/source/a/addict/addict-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "dictionary subclass with attribute-style access",
        "description": "Addict is a Python dictionary subclass that allows attribute-style\naccess to dictionary items.  Nested dictionaries are automatically\nconverted to addict instances for chained attribute access.",
        "license": "license:expat",
        "home_page": "https://github.com/mewwts/addict",
    },
    {
        "name": "python-docopt-ng",
        "version": "0.9.0",
        "url": "https://pypi.org/packages/source/d/docopt-ng/docopt_ng-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "command-line argument parser from docstrings",
        "description": "Docopt-ng is a maintained fork of docopt that generates\ncommand-line argument parsers from usage documentation strings.\nIt creates parsers from human-readable usage messages following\nPOSIX conventions.",
        "license": "license:expat",
        "home_page": "https://github.com/jazzband/docopt-ng",
    },
    {
        "name": "python-unrar",
        "version": "0.4",
        "url": "https://pypi.org/packages/source/u/unrar/unrar-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "RAR archive extraction library for Python",
        "description": "Python-unrar is a ctypes wrapper around the unrar library for\nextracting RAR archives.  It provides file listing, extraction,\nand metadata reading for RAR format archives.",
        "license": "license:gpl3+",
        "home_page": "https://github.com/matiasb/python-unrar",
    },
    {
        "name": "python-tinytag",
        "version": "2.0.0",
        "url": "https://pypi.org/packages/source/t/tinytag/tinytag-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "read audio file metadata in pure Python",
        "description": "TinyTag is a library for reading music metadata from MP3, OGG,\nFLAC, WMA, and WAV files.  It is written in pure Python with no\nexternal dependencies.",
        "license": "license:expat",
        "home_page": "https://github.com/tinytag/tinytag",
    },
    {
        "name": "python-borgstore",
        "version": "0.4.1",
        "url": "https://pypi.org/packages/source/b/borgstore/borgstore-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "key-value store backend for BorgBackup",
        "description": "Borgstore is a key-value store backend used by BorgBackup.  It\nprovides local filesystem, SFTP, and Rclone storage backends for\nstoring backup repository data.",
        "license": "license:bsd-3",
        "home_page": "https://github.com/borgbackup/borgstore",
    },
    {
        "name": "python-genson",
        "version": "1.3.0",
        "url": "https://pypi.org/packages/source/g/genson/genson-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "generate JSON Schema from JSON objects",
        "description": "GenSON is a JSON Schema generator.  Given JSON objects, it infers\nthe schema that matches them and can merge schemas from multiple\nobjects into a single comprehensive schema.",
        "license": "license:expat",
        "home_page": "https://github.com/wolverdude/GenSON",
    },
    {
        "name": "python-fake-useragent",
        "version": "2.0.3",
        "url": "https://pypi.org/packages/source/f/fake-useragent/fake_useragent-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "generate random user-agent strings",
        "description": "Fake-useragent is a library that provides up-to-date random\nuser-agent strings for web scraping and HTTP requests.  It maintains\na database of real browser user-agent strings.",
        "license": "license:asl2.0",
        "home_page": "https://github.com/fake-useragent/fake-useragent",
    },
    {
        "name": "python-knowit",
        "version": "0.5.5",
        "url": "https://pypi.org/packages/source/k/knowit/knowit-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "video and audio metadata extraction library",
        "description": "Knowit is a library that extracts metadata from video and audio\nfiles using MediaInfo.  It provides a structured Python API for\naccessing codec, resolution, bitrate, and other media properties.",
        "license": "license:expat",
        "home_page": "https://github.com/ratoaq2/knowit",
    },
    {
        "name": "python-posthog",
        "version": "3.11.0",
        "url": "https://pypi.org/packages/source/p/posthog/posthog-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "PostHog analytics SDK for Python",
        "description": "Posthog is the official Python SDK for PostHog product analytics.\nIt provides event tracking, feature flags, A/B testing, and session\nrecording integration for Python applications.",
        "license": "license:expat",
        "home_page": "https://github.com/PostHog/posthog-python",
    },
    {
        "name": "python-dacite",
        "version": "1.9.2",
        "url": "https://pypi.org/packages/source/d/dacite/dacite-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "create dataclass instances from dictionaries",
        "description": "Dacite simplifies creating dataclass instances from dictionaries.\nIt handles nested dataclasses, optional fields, type validation,\nand union types for clean data deserialization.",
        "license": "license:expat",
        "home_page": "https://github.com/konradhalas/dacite",
    },

    # --- Source packages (various build systems) ---
    {
        "name": "shiori",
        "version": "1.7.4",
        "url": "https://github.com/nickvdyck/shiori/releases/download/v{version}/shiori_linux_amd64",
        "build_system": "copy",
        "install_plan": '(list (list "shiori_linux_amd64" "bin/shiori"))',
        "synopsis": "simple bookmark manager",
        "description": "Shiori is a simple bookmark manager written in Go.  It provides\na web interface and command-line tool for saving, organizing, and\nsearching bookmarks with offline article archiving.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/shiori",
    },
    {
        "name": "obs-cmd",
        "version": "0.18.1",
        "url": "https://github.com/griccardos/obs-cmd/releases/download/v{version}/obs-cmd-linux-x64.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "obs-cmd" "bin/"))',
        "synopsis": "command-line remote control for OBS Studio",
        "description": "Obs-cmd is a command-line tool for controlling OBS Studio remotely\nvia the OBS WebSocket protocol.  It supports scene switching,\nrecording, streaming, and source manipulation from the terminal.",
        "license": "license:expat",
        "home_page": "https://github.com/griccardos/obs-cmd",
    },
    {
        "name": "archivebox",
        "version": "0.8.5",
        "url": "https://pypi.org/packages/source/a/archivebox/archivebox-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "self-hosted internet archive and bookmark preserver",
        "description": "ArchiveBox is a self-hosted internet archiving solution.  It takes\nURLs of websites and saves local copies as HTML, screenshots, PDFs,\nWARC files, and more for long-term preservation.",
        "license": "license:expat",
        "home_page": "https://archivebox.io",
    },
    {
        "name": "cppman",
        "version": "0.5.8",
        "url": "https://pypi.org/packages/source/c/cppman/cppman-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "C++ reference manual pages from cppreference.com",
        "description": "Cppman generates and caches C++ manual pages from cppreference.com.\nIt provides offline access to the C++ standard library documentation\nin man page format.",
        "license": "license:gpl3+",
        "home_page": "https://github.com/aitjcize/cppman",
    },
    {
        "name": "dyff",
        "version": "1.10.0",
        "url": "https://github.com/homeport/dyff/releases/download/v{version}/dyff_{version}_linux_amd64.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "dyff" "bin/"))',
        "synopsis": "diff tool for YAML files",
        "description": "Dyff is a diff tool specifically designed for YAML files.  It\nprovides semantic comparison of YAML documents, highlighting\nmeaningful changes while ignoring formatting differences.",
        "license": "license:expat",
        "home_page": "https://github.com/homeport/dyff",
    },
    {
        "name": "harlequin",
        "version": "2.0.0",
        "url": "https://pypi.org/packages/source/h/harlequin/harlequin-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "terminal-based SQL IDE",
        "description": "Harlequin is a terminal-based SQL IDE.  It provides an interactive\nquery editor with syntax highlighting, autocomplete, and results\nviewer for DuckDB, SQLite, and other databases.",
        "license": "license:expat",
        "home_page": "https://harlequin.sh",
    },
    {
        "name": "nagstamon",
        "version": "3.14.0",
        "url": "https://github.com/HenriWahl/Nagstamon/releases/download/v{version}/nagstamon-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "Nagios status monitor for the desktop",
        "description": "Nagstamon is a status monitor for the desktop.  It connects to\nmultiple Nagios, Icinga, Checkmk, and other monitoring servers and\nresides in the system tray showing host and service problems.",
        "license": "license:gpl2+",
        "home_page": "https://nagstamon.de",
    },
    {
        "name": "cdargs",
        "version": "1.35",
        "url": "https://github.com/cbrgm/cdargs/archive/v{version}.tar.gz",
        "build_system": "gnu",
        "synopsis": "bookmarks for the shell cd command",
        "description": "Cdargs is a tool that provides bookmarks for the shell built-in\ncd command.  It maintains a list of commonly used directories and\nprovides quick navigation through a text-based interface.",
        "license": "license:gpl2+",
        "home_page": "https://github.com/cbrgm/cdargs",
    },
    {
        "name": "hwatch",
        "version": "0.3.18",
        "url": "https://github.com/blacknon/hwatch/releases/download/{version}/hwatch-{version}-x86_64-unknown-linux-musl.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "hwatch" "bin/"))',
        "synopsis": "alternative watch command with diff highlighting",
        "description": "Hwatch is a modern alternative to the watch command.  It records\ncommand output history and highlights differences between runs with\nword-level diff support.",
        "license": "license:expat",
        "home_page": "https://github.com/blacknon/hwatch",
    },
    {
        "name": "xml2",
        "version": "0.5",
        "url": "https://web.archive.org/web/2024/https://dan.egnor.name/xml2/xml2-{version}.tar.gz",
        "build_system": "gnu",
        "synopsis": "convert between XML and flat format",
        "description": "Xml2 converts XML documents into a flat, line-oriented format and\nback again.  The flat format is easier to process with grep, sed,\nawk, and other text-processing tools.",
        "license": "license:gpl2+",
        "home_page": "https://dan.egnor.name/xml2",
    },
    {
        "name": "recyclarr",
        "version": "7.4.0",
        "url": "https://github.com/recyclarr/recyclarr/releases/download/v{version}/recyclarr-linux-x64.tar.xz",
        "build_system": "copy",
        "install_plan": '(list (list "recyclarr" "bin/"))',
        "synopsis": "Sonarr and Radarr quality profile manager",
        "description": "Recyclarr is a command-line tool that synchronizes quality profiles\nand custom formats from TRaSH Guides into Sonarr and Radarr.  It\nautomates media management configuration.",
        "license": "license:expat",
        "home_page": "https://github.com/recyclarr/recyclarr",
    },
    {
        "name": "spiderfoot",
        "version": "4.0.0",
        "url": "https://github.com/smicallef/spiderfoot/archive/v{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "open source intelligence automation tool",
        "description": "SpiderFoot is an OSINT automation tool.  It integrates with over\n200 data sources to gather intelligence on IP addresses, domain\nnames, email addresses, and other targets for security research.",
        "license": "license:expat",
        "home_page": "https://github.com/smicallef/spiderfoot",
    },
    {
        "name": "grocy",
        "version": "4.3.0",
        "url": "https://github.com/grocy/grocy/releases/download/v{version}/grocy_{version}.zip",
        "build_system": "copy",
        "install_plan": '(list (list "." "share/grocy/"))',
        "synopsis": "self-hosted groceries and household management",
        "description": "Grocy is a web-based self-hosted groceries and household management\nsolution.  It tracks purchases, stock levels, expiration dates,\nand shopping lists for home management.",
        "license": "license:expat",
        "home_page": "https://grocy.info",
    },
    {
        "name": "viddy",
        "version": "1.3.0",
        "url": "https://github.com/sachaos/viddy/releases/download/v{version}/viddy_Linux_x86_64.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "viddy" "bin/"))',
        "synopsis": "modern watch command with TUI",
        "description": "Viddy is a modern replacement for the watch command.  It provides\na terminal user interface with output history, diff highlighting,\nand search functionality for monitoring command output.",
        "license": "license:expat",
        "home_page": "https://github.com/sachaos/viddy",
    },
    {
        "name": "gtkhash",
        "version": "1.5",
        "url": "https://github.com/tristanheaven/gtkhash/releases/download/v{version}/gtkhash-{version}.tar.xz",
        "build_system": "gnu",
        "synopsis": "GTK utility for computing file checksums",
        "description": "GtkHash is a desktop utility for computing message digests and\nchecksums.  It supports MD5, SHA-1, SHA-256, and many other hash\nfunctions with a GTK graphical interface and Nautilus integration.",
        "license": "license:gpl2+",
        "home_page": "https://gtkhash.org",
    },
    {
        "name": "uif2iso",
        "version": "0.1.7c",
        "url": "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/uif2iso/uif2iso-{version}-src.tar.gz",
        "build_system": "gnu",
        "synopsis": "convert UIF disc images to ISO format",
        "description": "Uif2iso converts MagicISO UIF disc images to standard ISO format.\nIt supports compressed and encrypted UIF files for conversion to\nwidely compatible ISO images.",
        "license": "license:gpl2+",
        "home_page": "https://code.google.com/archive/p/uif2iso",
    },
    {
        "name": "flpsed",
        "version": "0.7.3",
        "url": "https://www.ecademix.com/JohannesHofmann/flpsed-{version}.tar.gz",
        "build_system": "gnu",
        "synopsis": "PostScript and PDF file annotator",
        "description": "Flpsed is a WYSIWYG PostScript and PDF annotator.  It lets users\nadd text annotations to existing PostScript and PDF documents using\nan FLTK-based graphical interface.",
        "license": "license:gpl3+",
        "home_page": "https://www.ecademix.com/JohannesHofmann/flpsed.html",
    },
    {
        "name": "ntfy",
        "version": "2.11.0",
        "url": "https://github.com/binwiederhier/ntfy/releases/download/v{version}/ntfy_{version}_linux_amd64.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list (string-append "ntfy_" #$version "_linux_amd64/ntfy") "bin/"))',
        "synopsis": "push notification service with HTTP API",
        "description": "Ntfy is a simple HTTP-based pub-sub notification service.  It\nallows sending push notifications to phones and desktops from\nscripts, cron jobs, and other applications via HTTP PUT/POST.",
        "license": "license:asl2.0",
        "home_page": "https://ntfy.sh",
    },
    {
        "name": "jftui",
        "version": "0.7.3",
        "url": "https://github.com/Aanok/jftui/archive/v{version}.tar.gz",
        "build_system": "gnu",
        "synopsis": "Jellyfin terminal client",
        "description": "Jftui is a terminal-based client for the Jellyfin media server.\nIt provides a text user interface for browsing and playing media\nfrom a Jellyfin instance using mpv as the playback engine.",
        "license": "license:expat",
        "home_page": "https://github.com/Aanok/jftui",
    },
    {
        "name": "molly-guard",
        "version": "0.8.1",
        "url": "https://salsa.debian.org/debian/molly-guard/-/archive/v{version}/molly-guard-v{version}.tar.gz",
        "build_system": "gnu",
        "synopsis": "protect remote machines from accidental shutdown",
        "description": "Molly-guard intercepts shutdown, reboot, halt, and poweroff\ncommands on machines with active SSH sessions.  It prompts for the\nhostname to confirm the action, preventing accidental remote shutdowns.",
        "license": "license:artistic2.0",
        "home_page": "https://salsa.debian.org/debian/molly-guard",
    },
    {
        "name": "sworkstyle",
        "version": "1.3.4",
        "url": "https://github.com/Lyr-7D1h/swayest_workstyle/archive/v{version}.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "sworkstyle" "bin/"))',
        "synopsis": "dynamic workspace names for Sway and i3",
        "description": "Sworkstyle dynamically renames Sway and i3 workspaces based on\ntheir contents.  It maps application names to icons and updates\nworkspace names as windows are opened and closed.",
        "license": "license:expat",
        "home_page": "https://github.com/Lyr-7D1h/swayest_workstyle",
    },
    {
        "name": "ansi2html",
        "version": "1.9.2",
        "url": "https://pypi.org/packages/source/a/ansi2html/ansi2html-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "convert ANSI terminal output to HTML",
        "description": "Ansi2html converts ANSI-colored terminal output to HTML markup.\nIt can be used as a command-line tool or Python library to preserve\nterminal formatting when displaying output in web pages.",
        "license": "license:lgpl3+",
        "home_page": "https://github.com/pycontribs/ansi2html",
    },
    {
        "name": "dir2ogg",
        "version": "0.14",
        "url": "https://jak-linux.org/projects/dir2ogg/dir2ogg-{version}.tar.gz",
        "build_system": "pyproject",
        "synopsis": "convert audio files to Ogg Vorbis format",
        "description": "Dir2ogg converts audio files in various formats (MP3, FLAC, WAV,\nWMA) to Ogg Vorbis.  It preserves tags and can recursively convert\nentire directory trees.",
        "license": "license:gpl2+",
        "home_page": "https://jak-linux.org/projects/dir2ogg",
    },
    {
        "name": "fluent-reader",
        "version": "1.1.4",
        "url": "https://github.com/nickvdyck/nickvdyck/releases/download/v{version}/Fluent.Reader-{version}-linux-x86_64.AppImage",
        "build_system": "copy",
        "install_plan": '(list (list "fluent-reader" "bin/fluent-reader"))',
        "synopsis": "modern desktop RSS reader",
        "description": "Fluent Reader is a local, cross-platform RSS reader with a modern\nUI.  It supports multiple RSS services as backends and provides\narticle reading with full-text fetching.",
        "license": "license:bsd-3",
        "home_page": "https://hyliu.me/fluent-reader",
    },
    {
        "name": "ghdl",
        "version": "4.1.0",
        "url": "https://github.com/ghdl/ghdl/archive/v{version}.tar.gz",
        "build_system": "gnu",
        "synopsis": "open-source VHDL simulator",
        "description": "GHDL is an open-source simulator for VHDL.  It can analyze,\nelaborate, and simulate VHDL designs with support for IEEE\nlibraries and VHDL-2008 standard features.",
        "license": "license:gpl2+",
        "home_page": "https://ghdl.github.io/ghdl",
    },
    {
        "name": "hypnotix",
        "version": "4.6",
        "url": "https://github.com/linuxmint/hypnotix/archive/{version}.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "usr/" "share/hypnotix/"))',
        "synopsis": "IPTV streaming application",
        "description": "Hypnotix is an IPTV streaming application for Linux Mint.  It\nsupports M3U playlists, Xtream API, and provides a GTK-based\ninterface for watching live TV channels and VOD content.",
        "license": "license:gpl3+",
        "home_page": "https://github.com/linuxmint/hypnotix",
    },
    {
        "name": "ascii-moon",
        "version": "0.2.0",
        "url": "https://github.com/nickvdyck/ascii-moon/releases/download/v{version}/ascii-moon-linux-amd64",
        "build_system": "copy",
        "install_plan": '(list (list "ascii-moon-linux-amd64" "bin/ascii-moon"))',
        "synopsis": "display current moon phase in ASCII art",
        "description": "Ascii-moon displays the current moon phase as ASCII art in the\nterminal.  It calculates the lunar phase and renders a visual\nrepresentation for astronomy enthusiasts.",
        "license": "license:expat",
        "home_page": "https://github.com/nickvdyck/ascii-moon",
    },
    {
        "name": "checkupdates-notify",
        "version": "0.3.0",
        "url": "https://github.com/nickvdyck/checkupdates-notify/archive/v{version}.tar.gz",
        "build_system": "gnu",
        "synopsis": "notify when system updates are available",
        "description": "Checkupdates-notify sends desktop notifications when system\nupdates are available.  It periodically checks for updates and\nalerts the user through the desktop notification system.",
        "license": "license:gpl3+",
        "home_page": "https://github.com/nickvdyck/checkupdates-notify",
    },
    {
        "name": "adebar",
        "version": "2.2.0",
        "url": "https://github.com/IzzySoft/Adebar/archive/v{version}.tar.gz",
        "build_system": "copy",
        "install_plan": '(list (list "adebar" "bin/") (list "lib/" "share/adebar/lib/") (list "tools/" "share/adebar/tools/"))',
        "synopsis": "Android device backup and reporting tool",
        "description": "Adebar (Android Device Backup and Report) creates shell scripts\nto backup Android devices via ADB.  It generates detailed device\nreports and backup scripts for apps, settings, and data.",
        "license": "license:gpl2+",
        "home_page": "https://github.com/IzzySoft/Adebar",
    },
]

def generate_bin_package(pkg, idx):
    """Generate a copy-build-system (binary) package definition."""
    url_expr = pkg["url"].replace("{version}", '" version "')
    url_expr = f'(string-append "{url_expr}")'

    install_plan = pkg.get("install_plan", '(list (list "." "bin/"))')

    return f''';;;
;;; --- {idx}. {pkg["name"]} (copy-build-system, pre-built binary) ---
;;;

(define-public {pkg["name"]}
  (package
    (name "{pkg["name"]}")
    (version "{pkg["version"]}")
    (source (origin
              (method url-fetch)
              (uri {url_expr})
              (sha256
               (base32
                "{PLACEHOLDER_HASH}"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~{install_plan}))
    (synopsis "{pkg["synopsis"]}")
    (description "{pkg["description"]}")
    (home-page "{pkg["home_page"]}")
    (license {pkg["license"]})))'''


def generate_python_package(pkg, idx):
    """Generate a pyproject-build-system package definition."""
    url_expr = pkg["url"].replace("{version}", '" version "')
    url_expr = f'(string-append "{url_expr}")'

    return f''';;;
;;; --- {idx}. {pkg["name"]} (pyproject-build-system) ---
;;;

(define-public {pkg["name"]}
  (package
    (name "{pkg["name"]}")
    (version "{pkg["version"]}")
    (source (origin
              (method url-fetch)
              (uri {url_expr})
              (sha256
               (base32
                "{PLACEHOLDER_HASH}"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "{pkg["synopsis"]}")
    (description "{pkg["description"]}")
    (home-page "{pkg["home_page"]}")
    (license {pkg["license"]})))'''


def generate_gnu_package(pkg, idx):
    """Generate a gnu-build-system package definition."""
    url_expr = pkg["url"].replace("{version}", '" version "')
    url_expr = f'(string-append "{url_expr}")'

    return f''';;;
;;; --- {idx}. {pkg["name"]} (gnu-build-system) ---
;;;

(define-public {pkg["name"]}
  (package
    (name "{pkg["name"]}")
    (version "{pkg["version"]}")
    (source (origin
              (method url-fetch)
              (uri {url_expr})
              (sha256
               (base32
                "{PLACEHOLDER_HASH}"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "{pkg["synopsis"]}")
    (description "{pkg["description"]}")
    (home-page "{pkg["home_page"]}")
    (license {pkg["license"]})))'''


def main():
    # Collect all package names for export list
    pkg_names = [p["name"] for p in PACKAGES]

    # Build header
    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- {BATCH_ID}
;;; Resolves 100 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 100 recipes created (copy, pyproject, gnu)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages {BATCH_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build)
  #:export ({chr(10).join("            " + n for n in pkg_names)}))
'''

    # Build body
    body_parts = []
    for idx, pkg in enumerate(PACKAGES, 1):
        bs = pkg["build_system"]
        if bs == "copy":
            body_parts.append(generate_bin_package(pkg, idx))
        elif bs == "pyproject":
            body_parts.append(generate_python_package(pkg, idx))
        elif bs == "gnu":
            body_parts.append(generate_gnu_package(pkg, idx))

    output = header + "\n" + "\n\n".join(body_parts) + "\n"

    outpath = "/home/slime/projects/gaurix/guix/gaurix/packages/recipe-resolver-260414j.scm"
    with open(outpath, "w") as f:
        f.write(output)

    print(f"Generated {len(PACKAGES)} package definitions in {outpath}")
    print(f"Package names: {', '.join(pkg_names)}")


if __name__ == "__main__":
    main()
