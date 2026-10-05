# Godot 2D Game

A polished 2D game built with Godot 4, featuring multiple levels, enemies, collectibles, save/load system, and cross-platform export support.

## Features

- **Player Mechanics** - Smooth movement, jump, dash, wall-slide, coyote time
- **Enemy Variety** - Multiple enemy types with unique behaviors
- **Collectibles** - Coins, power-ups, secrets with animations
- **Level System** - 10+ levels with JSON level data, progression tracking
- **Save/Load System** - Auto-save, multiple slots, cloud sync ready
- **Audio System** - Adaptive music, SFX, volume controls
- **UI/HUD** - Score, lives, timer, pause menu, settings
- **Settings** - Controls remapping, graphics, audio, language
- **Mobile Export** - Touch controls, adaptive resolution
- **Leaderboards** - Local + online (optional backend)

## Quick Start

### Prerequisites

- Godot Engine 4.2+
- Export templates (for building)

### Installation

```bash
# Clone the repository
git clone https://github.com/kamalesh404/godot-game.git
cd godot-game

# Open in Godot Engine
# Double-click project.godot or open from Godot Project Manager
```

### Running the Game

1. Open project in Godot Editor
2. Press `F5` to run the main scene
2. Or select `Project > Run` from menu

### Exporting

```bash
# Install export templates (Editor > Manage Export Templates)
# Configure export presets in export_presets.cfg

# Export for Windows
godot --headless --export-release "Windows Desktop" builds/game.exe

# Export for Linux
godot --headless --export-release "Linux/X11" builds/game.x86_64

# Export for macOS
godot --headless --export-release "macOS" builds/game.dmg

# Export for Web
godot --headless --export-release "Web" builds/web/index.html

# Export for Android
godot --headless --export-release "Android" builds/game.apk
```

## Project Structure

```
godot-game/
├── project.godot              # Project configuration
├── export_presets.cfg         # Export configuration
├── scenes/
│   ├── main.tscn              # Main menu scene
│   ├── level_01.tscn ... level_10.tscn
│   ├── player.tscn            # Player scene
│   ├── enemies/               # Enemy scenes
│   ├── ui/
│   │   ├── hud.tscn           # Heads-up display
│   │   ├── pause_menu.tscn    # Pause menu
│   │   └── settings.tscn      # Settings menu
│   └── collectibles/
├── scripts/
│   ├── player.gd              # Player controller
│   ├── enemy_base.gd          # Base enemy class
│   ├── enemies/               # Specific enemy types
│   ├── level_manager.gd       # Level loading/progression
│   ├── save_manager.gd        # Save/load system
│   ├── audio_manager.gd       # Music/SFX management
│   └── input_manager.gd       # Input handling
├── levels/
│   ├── level_01.json ... level_10.json
│   └── metadata.json
├── assets/
│   ├── textures/
│   ├── audio/
│   └── fonts/
├── addons/                    # GUT for testing
└── .github/workflows/
    └── export.yml             # CI export for all platforms
```

## Controls

| Action | Keyboard | Gamepad |
|--------|----------|---------|
| Move Left | A / Left Arrow | D-Pad Left |
| Move Right | D / Right Arrow | D-Pad Right |
| Jump | Space / W / Up Arrow | A Button |
| Dash | Shift / L | B Button |
| Pause | Escape | Start Button |

## Development

### Running Tests

```bash
# Install GUT addon (Editor > AssetLib > Search "GUT")
# Run tests from Editor > Project > Tools > GUT
```

### Adding New Levels

1. Create new scene in `scenes/level_XX.tscn`
2. Design level in editor
3. Add entry to `levels/metadata.json`
4. Update `level_manager.gd` level list

### Adding New Enemies

1. Extend `enemy_base.gd`
2. Implement `_process(delta)` for behavior
3. Add to `enemies/` folder
4. Register in level editor

## Export Configuration

### Platform Requirements

| Platform | Requirements |
|----------|--------------|
| Windows | Export template + codesign (optional) |
| Linux | Export template |
| macOS | Export template + notarization |
| Web | Export template (WASM) |
| Android | Export template + keystore |
| iOS | Export template + Xcode + certificates |

### CI/CD Export

```yaml
# .github/workflows/export.yml runs on tag push
# Builds for all platforms automatically
# Uploads artifacts to GitHub Releases
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Commit (`git commit -m 'Add some feature'`)
5. Push to the branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

## Contact

- **GitHub**: [@kamalesh404](https://github.com/kamalesh404)
- **Project**: [godot-game](https://github.com/kamalesh404/godot-game)