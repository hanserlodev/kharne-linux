# Kharne-Linux Contributing Guide

## Philosophy First

Before contributing, understand that Kharne-Linux is not:
- A feature-complete distribution
- Trying to please everyone
- Focused on ease of use over clarity

Kharne-Linux **is**:
- Opinionated and explicit
- Modular by design
- Designed for users who want control

## How to Contribute

### Reporting Issues

When reporting issues, include:
- System info: `kharne-core status`
- Exact error messages
- Steps to reproduce
- What you expected vs what happened

### Code Contributions

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/your-feature`
3. **Make changes**:
   - Follow existing code style
   - Add comments for non-obvious decisions
   - Keep commits atomic
4. **Test locally**
5. **Submit PR** with clear description

### Naming Conventions

- New core scripts: `kharne-*`
- Modules: lowercase, hyphenated
- Functions: `snake_case`
- Variables: `UPPER_CASE` for exports, `lower_case` for local

### Module Contributions

To create a new module:

```bash
mkdir -p kharne/modules/your-module
```

Required files:
- `description` - One-line description
- `packages.list` - Package list
- `install.sh` - Installation script (optional)
- `uninstall.sh` - Cleanup script (optional)

### Theme Contributions

Themes must include:
- `hyprland.conf` - Hyprland colors
- `colors.toml` - Color palette
- `description` - Brief description

Aesthetic guidelines:
- Industrial/brutalist preferred
- Avoid bright neon colors
- Function communicates through form

### Documentation

- Keep README.md up to date
- Update ROADMAP.md when completing tasks
- Add inline comments for complex logic

## What We're NOT Looking For

- ❌ X11 support
- ❌ GUI configuration tools
- ❌ Proprietary software integrations
- ❌ "Beginner-friendly" changes that hide complexity

## What We ARE Looking For

- ✅ Better error messages
- ✅ Performance improvements
- ✅ Bug fixes
- ✅ Documentation improvements
- ✅ New modules (well-designed)
- ✅ Hardware compatibility fixes

## Code of Conduct

1. **Be direct** - No need for excessive politeness, but don't be rude
2. **Technical merit** - Arguments should be technical, not personal
3. **Assume competence** - Users chose Arch/Kharne for a reason
4. **Document decisions** - Explain *why*, not just *what*

## License

By contributing, you agree your code is released under the MIT License.

---

Questions? Open an issue first before working on large changes.
