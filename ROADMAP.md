# Kharne-Linux Development Roadmap

## Phase 0: Foundation (Current)

- [x] Project structure created
- [x] Core module system implemented
- [x] Basic scripts (kharne-core, kharne-module, kharne-state)
- [x] README with philosophy
- [x] Bootstrap installer
- [ ] Test basic installation flow

## Phase 1: Core Identity (Week 1-2)

### Critical Path
- [ ] Create Kharne Core theme (blue/red/grey palette)
- [ ] Design boot splash (Plymouth theme)
- [ ] Implement symlink + warning system for user configs
- [ ] Complete module install/uninstall scripts
- [ ] Create preflight checks (RAM, CPU, disk)

### Nice to Have
- [ ] Custom Waybar theme
- [ ] Hyprland bindings tailored for Kharne
- [ ] Custom neofetch/fastfetch config

## Phase 2: Module Completion (Week 3-4)

### Modules to Complete
- [ ] `dev` module install.sh
- [ ] `ops` module install.sh  
- [ ] `media` module (define packages)
- [ ] `ai` module (Ollama setup)
- [ ] `gaming` module (define packages)

### Testing
- [ ] Test each module independently
- [ ] Test module combinations
- [ ] Verify clean removal

## Phase 3: Migration System (Week 5)

- [ ] Audit all Omarchy migrations
- [ ] Identify which to keep/modify/remove
- [ ] Create Kharne-specific migrations
- [ ] Test migration rollback

## Phase 4: Polish & Documentation (Week 6)

### Documentation
- [ ] Installation guide
- [ ] Module guide
- [ ] Configuration reference
- [ ] Troubleshooting guide
- [ ] Philosophy manifesto (expanded)

### Visual Identity
- [ ] Logo/icon
- [ ] Wallpaper set (industrial/brutalist theme)
- [ ] Color scheme variants
- [ ] SDDM login theme

## Phase 5: Public Alpha (Week 7-8)

- [ ] Public GitHub repository
- [ ] kharne-linux.org landing page
- [ ] Installation testing on fresh Arch
- [ ] Community feedback channel
- [ ] Bug tracking system

## Backlog / Future Considerations

### Technical Debt
- [ ] Full renaming of omarchy-* scripts to kharne-*
- [ ] Remove all Omarchy branding
- [ ] Optimize package lists
- [ ] Create custom AUR packages if needed

### Advanced Features
- [ ] Profile system (workstation, server, minimal)
- [ ] Network install option (PXE boot)
- [ ] Custom ISO builder
- [ ] Remote management tools

### Community
- [ ] Contribution guidelines
- [ ] Code of conduct
- [ ] Discord/Matrix server
- [ ] Example configs repository

## Known Technical Decisions

### To Keep from Omarchy
- ✅ Hyprland as compositor
- ✅ Snapper for snapshots
- ✅ Limine bootloader
- ✅ SDDM display manager
- ✅ Migration system pattern
- ✅ Walker launcher

### To Remove from Omarchy
- ❌ X11 support
- ❌ Multiple terminal emulators
- ❌ Chromium
- ❌ 1Password
- ❌ Ruby-centric tooling

### To Modify from Omarchy
- 🔄 Package lists (more minimal)
- 🔄 Themes (darker, industrial)
- 🔄 Menu system (more technical)
- 🔄 Boot experience (colder, functional)

## Success Metrics (v1.0)

- [ ] Clean install in <30 minutes
- [ ] All modules functional
- [ ] No Omarchy branding visible
- [ ] Unique visual identity
- [ ] 10+ successful user installations
- [ ] Documentation complete

---

**Current Status**: Phase 0 → Phase 1 transition
**Next Milestone**: Complete core theme and module installers
**Version**: 0.1.0-alpha
**Target for 1.0**: ~8 weeks
