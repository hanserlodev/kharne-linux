# Kharne-Linux

**An opinionated Arch-based system designed for fragmented environments.**

Kharne-Linux favors modularity over completeness, clarity over comfort, and resilience over illusion.

## Philosophy

Kharne-Linux is built for those who understand that systems fail and want to control them anyway.

Unlike comfort-focused distributions, Kharne eliminates unnecessary conveniences to gain structural clarity. The system assumes the world is fragmented and designs around that reality.

## Key Principles

1. **Nothing is magic** — Every decision is explicit
2. **Everything has layers** — Modular by design
3. **Power with responsibility** — The user controls, the system informs
4. **Assume failure, enable recovery** — Snapshots as states, not safety nets
5. **Function over decoration** — Aesthetic communicates purpose

## System Architecture

```
~/.local/share/kharne/
├── core/        # Immutable system nucleus
├── modules/     # Independent functional regions
├── profiles/    # Module combinations
└── themes/      # Visual states

~/.local/state/kharne/
├── system/      # Migrations, system states
├── modules/     # Per-module state tracking
└── checkpoints/ # User-initiated snapshots

~/.config/kharne/
├── user/        # Full user control
└── override/    # Explicit system overrides
```

## Installation

```bash
curl -sL kharne-linux.org/bootstrap | bash -s -- --profile=core
```

Optional modules:
```bash
curl -sL kharne-linux.org/bootstrap | bash -s -- --modules=dev,ops
```

## System Requirements

- **Architecture**: x86_64 only
- **Base**: Vanilla Arch Linux (no derivatives)
- **RAM**: ≥ 8GB
- **Disk**: ≥ 50GB
- **Boot**: Secure Boot disabled
- **Display**: Wayland only (no X11)

If constraints are not met: `Initialization aborted.`

## Core Stack

- **Compositor**: Hyprland (Wayland)
- **Terminal**: Ghostty
- **Browser**: Firefox
- **Shell**: Bash
- **Display Manager**: SDDM
- **Bootloader**: Limine
- **Snapshots**: Snapper (BTRFS states)

## Modules

Each module is independently installable and removable:

- `core` — Mandatory system nucleus
- `dev` — Systems development (C/C++, Rust, Zig, Python)
- `ops` — Operations and infrastructure tools
- `media` — Multimedia production
- `ai` — Local AI tools (Ollama, llama.cpp)
- `gaming` — Gaming utilities

## Irreversible Decisions

This system makes explicit technical choices:

- ❌ No X11 support (Wayland only)
- ❌ No proprietary password managers
- ❌ No multiple redundant tools
- ❌ No legacy compatibility layers
- ❌ No handholding UX

**Message**: You chose this world. Learn to operate in it.

## Version

Current: `0.1.0-alpha`
Based on: Omarchy `3.3.4` (soft fork)

## License

Kharne-Linux is released under the [MIT License](https://opensource.org/licenses/MIT).

---

> "Systems fail. Control them anyway."
