# 🚀 Modern Neovim Configuration

A clean, modern Neovim configuration focused on productivity and development across multiple languages with a streamlined setup.

## ✨ Features

### 🎨 **Beautiful UI**
- **Tokyo Night** color scheme with storm variant
- **Lualine** status bar with clean styling
- **Indent guides** with visual clarity
- **Todo comments** highlighting
- **Zen mode** for distraction-free writing
- **Twilight** dimming for focus

### 📁 **File Management**
- **nnn.nvim** - Fast, minimal file explorer with picker mode
- **Telescope** - Fuzzy finding and advanced search
- **Intelligent file navigation** with contextual commands

### 📝 **Note-Taking & Organization**
- **Neorg** - Modern note-taking with multiple workspaces
- **Orgmode** integration for task management
- **Journal** system with daily notes
- **Multiple workspaces**: Notes, Work, Projects, Journal

###  **Development Tools**
- **Multi-language LSP** support (Lua, Python, TypeScript, Go, Rust, YAML, SQL, Markdown)
- **Mason** for LSP server management
- **Auto-completion** with nvim-cmp
- **Treesitter** for enhanced syntax highlighting
- **Diagnostics** with clear visual indicators
- **Basic SQL support** with completion and formatting

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
- **[nnn.nvim](https://github.com/luukvbaal/nnn.nvim)** - File explorer integration

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

### SQL Support
- **[SQLComplete.vim](https://github.com/vim-scripts/SQLComplete.vim)** - SQL completion
- **[vim-uppercase-sql](https://github.com/jsborjesson/vim-uppercase-sql)** - SQL formatting

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
git clone https://github.com/your-username/nvim-config.git ~/.config/nvim

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
- **nnn** file manager (recommended: `brew install nnn` on macOS)
- **Node.js** (for LSP servers)
- **Python 3** (for Python LSP)
- **Go** (for Go development)
- **Rust** (for Rust development)

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
   mkdir -p ~/notes ~/work-notes ~/projects ~/journal ~/orgfiles
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
   ```

## ⌨️ Key Bindings

### Leader Keys
- **Leader**: `<Space>`
- **Local Leader**: `,`

### File Navigation
| Key | Action |
|-----|--------|
| `<leader>pv` | Open nnn file picker |
| `<leader>e` | Open nnn file picker |
| `<leader>ef` | Open nnn in current file's directory |
| `<C-b>` | Open nnn picker (VS Code style) |

### Search & Navigation
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files (global) |
| `<leader>fF` | Find files (current directory) |
| `<leader>fg` | Live grep (global) |
| `<leader>fG` | Live grep (current directory) |

### Neorg & Note-Taking
| Key | Action |
|-----|--------|
| `<leader>nn` | Notes workspace |
| `<leader>nw` | Work workspace |
| `<leader>np` | Projects workspace |
| `<leader>nj` | Journal workspace |
| `<leader>pn` | Create new note |

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

### UI & Windows
| Key | Action |
|-----|--------|
| `<leader>db` | Dashboard |
| `<leader>h` | Home screen |
| `<C-h/j/k/l>` | Navigate windows |
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<leader>cl` | Clear search highlighting |

## 🎨 Customization

### Color Scheme
The configuration uses Tokyo Night with the "storm" variant. To change:
```lua
-- In lua/plugins/plugins.lua
opts = {
  style = "night", -- or "day", "moon"
  -- ... other options
}
```

### Workspaces
Add or modify workspaces in `lua/plugins/neorg.lua`:
```lua
workspaces = {
  notes = "~/notes",
  work = "~/work-notes",
  personal = "~/personal-notes", -- Add new workspace
  -- ...
}
```

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
│   │   ├── nnn.lua            # nnn file explorer
│   │   ├── plugins.lua        # Core plugins
│   │   ├── telescope.lua      # Telescope setup
│   │   └── treesitter.lua     # Treesitter config
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

## 🌟 Workflow Examples

### File Management Workflow
1. **Open file picker**: `<leader>pv` or `<leader>e`
2. **Find files globally**: `<leader>ff`
3. **Find files in current directory**: `<leader>fF`
4. **Search content**: `<leader>fg`
5. **Navigate with splits**: Use `<C-s>` and `<C-v>` in nnn

### Note-Taking Workflow
1. **Start with dashboard**: `<leader>db`
2. **Open notes workspace**: `<leader>nn`
3. **Create new note**: `<leader>pn`
4. **Switch to work notes**: `<leader>nw`
5. **Open journal**: `<leader>nj`

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

**nnn file manager not working**:
- Install nnn: `brew install nnn` (macOS) or your package manager
- Check if nnn is in PATH: `which nnn`

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
