# 🚀 Modern Neovim Configuration

A clean, modern Neovim configuration focused on productivity and development across multiple languages with a streamlined setup.

## ✨ Features

### 🎨 **Beautiful UI**
- **Tokyo Night** color scheme with storm variant and transparency
- **Lualine** status bar with triangular separators and horizon theme
- **Indent guides** with visual clarity
- **Todo comments** highlighting with custom icons
- **Twilight** dimming for focus
- **Noice.nvim** for enhanced UI messages

### 📁 **File Management**
- **nnn.nvim** - Primary file picker (fast, minimal)
- **nvim-tree** - Alternative tree-style file explorer with search/filter
- **Telescope** - Fuzzy finding and advanced search
- **Intelligent file navigation** with contextual commands

### 📝 **Note-Taking & Organization**
- **Neorg** - Modern note-taking with multiple workspaces
- **Orgmode** integration for task management
- **Journal** system with daily notes
- **Multiple workspaces**: second_brain (default), work, projects, journal
- **Auto-organized notes** - Notes automatically created in `/notes` subfolder
- **Telescope integration** - Search across all notes and tasks

### ⚙️ **Development Tools**
- **Multi-language LSP** support (Lua, Python, TypeScript, Go, Rust, YAML, SQL, Markdown)
- **Mason** for LSP server management
- **Auto-completion** with nvim-cmp
- **Treesitter** for enhanced syntax highlighting and playground
- **Diagnostics** with clear visual indicators
- **SQL support** with completion and formatting
- **Helm charts** for Kubernetes YAML files

### ⚡ **Performance & UX**
- **Lazy loading** for fast startup
- **Which-key** for discoverable keybindings
- **Auto-pairs** and **surround** for efficient editing
- **Streamlined configuration** with minimal complexity

## 📦 Plugin Overview

### Core Plugins
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Plugin manager
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configuration
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Completion engine
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting

### File Management
- **[nnn.nvim](https://github.com/luukvbaal/nnn.nvim)** - Primary file picker (fast, minimal)
- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** - Alternative tree-style file explorer

### UI & Themes
- **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim)** - Color scheme
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Status line
- **[zen-mode.nvim](https://github.com/folke/zen-mode.nvim)** - Distraction-free mode
- **[twilight.nvim](https://github.com/folke/twilight.nvim)** - Code dimming
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)** - Indent guides

### Note-Taking & Organization
- **[neorg](https://github.com/nvim-neorg/neorg)** - Modern note-taking
- **[neorg-telescope](https://github.com/nvim-neorg/neorg-telescope)** - Telescope integration
- **[orgmode](https://github.com/nvim-orgmode/orgmode)** - Org-mode support

### Development
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** - LSP server management
- **[go.nvim](https://github.com/ray-x/go.nvim)** - Go development tools
- **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)** - Todo highlighting
- **[playground](https://github.com/nvim-treesitter/playground)** - Treesitter playground for syntax exploration

### Data & Configuration
- **[SQLComplete.vim](https://github.com/vim-scripts/SQLComplete.vim)** - SQL completion
- **[vim-uppercase-sql](https://github.com/jsborjesson/vim-uppercase-sql)** - SQL formatting
- **[vim-helm](https://github.com/towolf/vim-helm)** - Helm chart support (YAML)

### Quality of Life
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Keybinding help
- **[mini.pairs](https://github.com/echasnovski/mini.pairs)** - Auto-pairs
- **[mini.surround](https://github.com/echasnovski/mini.surround)** - Surround text objects
- **[noice.nvim](https://github.com/folke/noice.nvim)** - Enhanced UI

## 🔧 Installation

### Automated Installation

The easiest way to install this configuration is using the provided install script:

```bash
# Clone the repository
git clone https://github.com/KatieGOCT/personal-nvim-config.git ~/.config/nvim

# Navigate to the directory
cd ~/.config/nvim

# Make the install script executable and run it
chmod +x install.sh
./install.sh
```

### Manual Installation

If you prefer to install manually:

### Prerequisites
- **Neovim 0.8+** (recommended: 0.9+)
- **Git**
- **Node.js** (for LSP servers)
- **Python 3** (for Python LSP)
- **Go** (for Go development)
- **Rust** (for Rust development)
- **nnn** file manager (optional: `brew install nnn` on macOS for additional picker)
- **A Nerd Font** (for icons and separators to display properly)

### Setup Steps
1. **Backup your existing configuration**:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone https://github.com/your-username/nvim-config.git ~/.config/nvim
   ```

3. **Create workspace directories**:
   ```bash
   mkdir -p ~/notes/me_2 ~/work-notes ~/projects ~/journal ~/orgfiles
   ```

4. **Start Neovim and install plugins**:
   ```bash
   nvim
   # Plugins will install automatically
   ```

### Using the Makefile

The configuration includes a Makefile for easy management:

```bash
# Full installation
make install

# Test configuration
make test

# Lint code
make lint

# Format code
make format

# Clean up
make clean

# Create backup
make backup

# Update plugins
make update

# Health check
make health

# Show help
make help

```
## ⌨️ Key Bindings

### Leader Keys
- **Leader**: `<Space>`
- **Local Leader**: `,`

### File Navigation

#### nnn File Picker
| Key | Action |
|-----|--------|
| `<leader>e` | Open nnn picker |
| `<leader>pv` | Open nnn picker in current file directory |
| `<leader>ef` | Find current file in nnn picker |
| `<leader>fp` | Open nnn picker |
| `<leader>fn` | Open nnn picker in current directory |
| `<leader>fe` | Open nnn explorer (sidebar) |
| `<C-b>` | Open nnn picker (VS Code style) |

#### nvim-tree (Alternative)
| Key | Action |
|-----|--------|
| `:NvimTreeToggle` | Toggle nvim-tree file explorer |
| `:NvimTreeFocus` | Focus nvim-tree file explorer |
| `f` | Start live filter in nvim-tree |
| `F` | Clear live filter in nvim-tree |
| `<CR>` or `o` | Open file/folder |
| `v` | Open in vertical split |
| `s` | Open in horizontal split |
| `t` | Open in new tab |

### Search & Navigation
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files (global) |
| `<leader>fF` | Find files (current directory) |
| `<leader>fg` | Live grep (global) |
| `<leader>fG` | Live grep (current directory) |

### Neorg & Note-Taking

#### Workspace Navigation
| Key | Action |
|-----|--------|
| `<leader>nn` | Open notes workspace (second_brain) |
| `<leader>nw` | Open work workspace |
| `<leader>np` | Open projects workspace |
| `<leader>nj` | Open journal workspace |
| `<leader>nI` | Open Neorg index |
| `<leader>nr` | Return from Neorg |

#### Note Creation & Management
| Key | Action |
|-----|--------|
| `<leader>pn` | Create new note |
| `<leader>nn` | Create new note in notes folder (within norg file) |
| `<leader>nl` | Create note at new location |
| `<leader>nf` | Create new file |
| `<leader>nc` | Toggle concealer |
| `<leader>no` | Start presenter mode |

#### Task Management (in .norg files)
| Key | Action |
|-----|--------|
| `<leader>td` | Mark task as done |
| `<leader>tu` | Mark task as undone |
| `<leader>tp` | Mark task as pending |
| `<leader>th` | Mark task as on hold |
| `<leader>tc` | Mark task as cancelled |
| `<leader>tr` | Mark task as recurring |
| `<leader>ti` | Mark task as important |

#### Journal (in .norg files)
| Key | Action |
|-----|--------|
| `<leader>jt` | Open today's journal |
| `<leader>jy` | Open yesterday's journal |
| `<leader>jm` | Open tomorrow's journal |
| `<leader>jj` | Open journal index |

#### Neorg Telescope Integration (in .norg files)
| Key | Action |
|-----|--------|
| `<leader>nw` | Switch workspace |
| `<leader>nff` | Find .norg files |
| `<leader>nfl` | Find linkable items |
| `<leader>nfh` | Search headings |
| `<leader>nfi` | Insert link |
| `<leader>nft` | Find project tasks |
| `<leader>nfa` | Find AOF project tasks |
| `<leader>nfc` | Find context tasks |
| `<leader>nfr` | Find AOF tasks |
| `<leader>ne` | Export document |
| `<leader>nt` | Table of contents |

### LSP & Development
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>f` | Format code |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

### Telescope LSP
| Key | Action |
|-----|--------|
| `<leader>fd` | LSP definitions |
| `<leader>fr` | LSP references |
| `<leader>fi` | LSP implementations |
| `<leader>fs` | Document symbols |
| `<leader>fw` | Workspace symbols |

### SQL Support
| Key | Action |
|-----|--------|
| `<leader>sf` | Set filetype to SQL |
| `<leader>su` | Uppercase SQL keywords |

### Treesitter Playground
| Key | Action |
|-----|--------|
| `<leader>tp` | Toggle Treesitter playground |
| `<leader>th` | Highlight captures under cursor |

### Navigation
| Key | Action |
|-----|--------|
| `<leader>bb` | Go back (jump history) |
| `<leader>bf` | Go forward (jump history) |

### UI & Windows
| Key | Action |
|-----|--------|
| `<leader>db` | Dashboard |
| `<leader>h` | Home screen |
| `<C-h/j/k/l>` | Navigate windows |
| `<C-Up/Down/Left/Right>` | Resize windows |
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<leader>Q` | Force quit |
| `<leader>cl` | Clear search highlighting |

### Toggles & Utilities
| Key | Action |
|-----|--------|
| `<leader>tw` | Toggle line wrap |
| `<leader>ts` | Toggle spell check |
| `<leader>tb` | Toggle blur tint effect |
| `<leader>mr` | Check macro register content |

### Visual Mode
| Key | Action |
|-----|--------|
| `<` | Indent left (stays in visual) |
| `>` | Indent right (stays in visual) |
| `J` | Move text down |
| `K` | Move text up |

## 🎨 Customization

### Lualine Configuration
The statusbar features triangular separators using powerline symbols:
- **Section separators**: `` (left) and `` (right) for major sections
- **Component separators**: `󱎕` and `󰳗` for minor divisions
- **Theme**: Horizon with transparency support
- **Recording indicator**: Shows macro recording status

### Color Scheme
The configuration uses Tokyo Night with the "storm" variant. To change:
```lua
-- In lua/plugins/plugins.lua
opts = {
  style = "night", -- or "day", "moon", "storm"
  transparent = true,
  -- ... other options
}
```

### Blur Tint Effect
A unique feature that toggles between pure transparency and a subtle blur tint:
- **Toggle**: Press `<leader>tb` to switch between modes
- **Pure transparency**: Complete transparency for terminal backgrounds
- **Blur tint**: Adds subtle Tokyo Night colors for better readability
- **Persistent**: The setting persists within your session

### nvim-tree Performance Optimizations
This configuration prioritizes speed over visual features:
```lua
-- Disabled for performance
git = { enable = false },
diagnostics = { enable = false },
filesystem_watchers = { enable = false },
update_focused_file = { enable = false },
```

To re-enable features if desired:
```lua
-- In lua/plugins/plugins.lua, change to:
git = { enable = true },
diagnostics = { enable = true },
```

### Workspaces
Add or modify workspaces in `lua/plugins/neorg.lua`:
```lua
workspaces = {
  second_brain = "~/notes/me_2",  -- Default workspace
  work = "~/work-notes",
  projects = "~/projects",
  journal = "~/journal",
  -- Add your own:
  personal = "~/personal-notes",
}
```

**Special Feature**: The `<leader>nn` keybinding (when inside a .norg file) creates new notes in a `notes/` subfolder within the current workspace. This helps organize your notes automatically:
- In `second_brain`: Creates in `~/notes/me_2/notes/`
- In `work`: Creates in `~/work-notes/notes/`
- In `projects`: Creates in `~/projects/notes/`

### LSP Servers
Add new LSP servers in `lua/plugins/lsp.lua`:
```lua
ensure_installed = {
  "lua_ls",
  "pyright",
  "your_new_server", -- Add here
  -- ...
}
```

## 📁 File Structure

```
~/.config/nvim/
├── init.lua                    # Main configuration entry
├── lazy-lock.json             # Plugin lock file
├── install.sh                 # Installation script
├── Makefile                   # Build and management tasks
├── README.md                  # This file
├── lua/
│   ├── config/
│   │   └── lazy.lua           # Lazy.nvim setup
│   ├── plugins/
│   │   ├── dashboard.lua      # Dashboard configuration
│   │   ├── data.lua           # Basic SQL and data tools
│   │   ├── journal.lua        # Journal setup
│   │   ├── lsp.lua            # LSP configuration
│   │   ├── mason.lua          # Mason setup
│   │   ├── neorg.lua          # Neorg configuration
│   │   ├── nnn.lua            # nnn file picker
│   │   ├── plugins.lua        # Core plugins including nvim-tree
│   │   ├── telescope.lua      # Telescope setup
│   │   ├── treesitter.lua     # Treesitter config
│   │   └── treesitter_play.lua # Treesitter playground
│   ├── user/
│   │   ├── lsp.lua            # User LSP settings
│   │   ├── options.lua        # Vim options
│   │   └── remap.lua          # Key mappings
│   └── after/
│       ├── ftdetect/
│       │   └── sql-jinja.lua  # SQL filetype detection
│       ├── ftplugin/
│       │   └── sql.lua        # SQL plugin settings
│       └── plugin/
│           └── telescope.lua  # Telescope post-config
```

## 🌟 Key Features

### Dual File Management System
- **nnn picker** as primary (ultra-fast, minimal interface)
- **nvim-tree** as alternative (tree view with live search filter)
- **Telescope** for fuzzy finding and advanced search
- Flexible workflow: switch between tools as needed

### Enhanced Statusbar
- **Triangular separators** using powerline symbols
- **Macro recording indicator** 
- **Clean sections** with proper spacing
- **Transparency support** for modern terminals

### Advanced Note-Taking
- **Multiple Neorg workspaces** with easy switching
- **Auto-organized notes folder** for each workspace
- **Comprehensive task management** with visual indicators
- **Telescope integration** for searching notes and tasks
- **Journal system** with daily notes support

### Customizable Transparency
- **Blur tint toggle** (`<leader>tb`) for readability
- Pure transparency or subtle background tint
- Tokyo Night colors optimized for transparency
- Works seamlessly with iTerm2 and other terminals

### Performance First
- **Lazy loading** for all plugins
- **Optimized file explorer** (git/diagnostics disabled in nvim-tree)
- **Fast startup** time
- **Minimal resource usage**

## 🌟 Workflow Examples

### File Management Workflow
1. **Quick file access**: `<leader>e` for nnn picker
2. **Current file directory**: `<leader>pv` opens nnn in current file's directory
3. **Find files globally**: `<leader>ff` (Telescope)
4. **Find files in current directory**: `<leader>fF` (Telescope)
5. **Search content**: `<leader>fg` (Telescope live grep)
6. **Alternative explorer**: `:NvimTreeToggle` for tree view with search (`f` to filter)

### Note-Taking Workflow
1. **Start with dashboard**: `<leader>db`
2. **Open notes workspace**: `<leader>nn` (opens second_brain workspace)
3. **Create new note**: `<leader>pn`
4. **Create note in notes folder**: Inside a .norg file, use `<leader>nn`
5. **Switch workspaces**: `<leader>nw` (work), `<leader>np` (projects), `<leader>nj` (journal)
6. **Journal entry**: `<leader>jt` for today's journal
7. **Find notes**: `<leader>nff` to search all .norg files
8. **Task management**: Use `<leader>td`, `<leader>tu`, `<leader>tp` to manage tasks
9. **Table of contents**: `<leader>nt` to view document structure

### Development Workflow
1. **Open project**: `<leader>ff`
2. **Find symbols**: `<leader>fs`
3. **Go to definition**: `gd`
4. **Find references**: `gr`
5. **Format code**: `<leader>f`
6. **Check diagnostics**: `[d` and `]d`

### SQL Development
1. **Set SQL filetype**: `<leader>sf`
2. **Uppercase SQL keywords**: `<leader>su`
3. **Use LSP features**: `gd`, `gr`, `K` for hover

## 🔧 Troubleshooting

### Common Issues

**LSP not working**:
```
:LspInfo
:Mason
```

**Treesitter issues**:
```
:TSUpdate
:TSInstall <language>
```

**Plugin issues**:
```
:Lazy clean
:Lazy sync
```

**nvim-tree not working**:
- File explorer should load automatically with lazy loading
- Check keybindings: `<leader>e` to toggle, `<leader>o` to focus
- Performance optimized with disabled git integration and diagnostics

**Search/filter not working in nvim-tree**:
- Press `f` to start live filter
- Press `F` to clear filter
- Type to search files and folders

**Configuration errors**:
```bash
# Run health check
make health

# Test configuration
make test

# Clean and reinstall
make clean
make install
```

### Development Tools

**Install linting and formatting tools**:
```bash
make dev-setup
```

**Format code**:
```bash
make format
```

**Lint code**:
```bash
make lint
```

## 📚 Learning Resources

- **[Neovim Documentation](https://neovim.io/doc/)**
- **[Neorg Wiki](https://github.com/nvim-neorg/neorg/wiki)**
- **[Lazy.nvim Documentation](https://lazy.folke.io/)**
- **[Telescope Documentation](https://github.com/nvim-telescope/telescope.nvim#usage)**
- **[nvim-tree Documentation](https://github.com/nvim-tree/nvim-tree.lua)**
- **[nnn Documentation](https://github.com/jarun/nnn)**

## 🤝 Contributing

This configuration is designed to be clean and maintainable. Feel free to:
- Submit bug reports
- Suggest improvements
- Share your customizations
- Add new features

## 📄 License

This configuration is open source and available under the [MIT License](LICENSE).

---

**Happy coding!** 🎉
