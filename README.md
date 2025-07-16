# 🚀 My Neovim Configuration

A modern, feature-rich Neovim configuration focused on productivity, note-taking, and development across multiple languages.

## ✨ Features

### 🎨 **Beautiful UI**
- **Tokyo Night** color scheme with storm variant
- **Bubble-style Lualine** status bar with rounded segments
- **Indent guides** with clean visual styling
- **Todo comments** highlighting with custom icons
- **Zen mode** for distraction-free writing
- **Twilight** dimming for focus enhancement

### 📝 **Note-Taking & Organization**
- **Neorg** - Modern note-taking with multiple workspaces
- **Orgmode** integration for task management
- **Journal** system with daily notes
- **Multiple workspaces**: Notes, Work, Projects, Journal
- **Export capabilities** to Markdown and other formats
- **Task management** with various todo states

### 🔍 **Search & Navigation**
- **Telescope** with fuzzy finding and advanced search
- **Treesitter** for enhanced syntax highlighting
- **LSP integration** for intelligent code navigation
- **File explorer** with Neo-tree support

### 💻 **Development Tools**
- **Multi-language LSP** support (Lua, Python, TypeScript, Go, Rust, YAML, SQL, Markdown)
- **Auto-completion** with nvim-cmp
- **Diagnostics** with beautiful icons and floating windows
- **Code formatting** and linting
- **Git integration** with branch display

### ⚡ **Performance & UX**
- **Lazy loading** for fast startup
- **Which-key** for discoverable keybindings
- **Auto-pairs** and **surround** for efficient editing
- **Noice** for enhanced command line and notifications
- **Global status line** across all windows

## 📦 Plugin Overview

### Core Plugins
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Plugin manager
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configuration
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Completion engine
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting

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

### Quality of Life
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Keybinding help
- **[mini.pairs](https://github.com/echasnovski/mini.pairs)** - Auto-pairs
- **[mini.surround](https://github.com/echasnovski/mini.surround)** - Surround text objects
- **[noice.nvim](https://github.com/folke/noice.nvim)** - Enhanced UI
- **[nvim-notify](https://github.com/rcarriga/nvim-notify)** - Notification system

## 🔧 Installation

### Prerequisites
- **Neovim 0.8+** (recommended: 0.9+)
- **Git**
- **Node.js** (for LSP servers)
- **Python 3** (for Python LSP)
- **Go** (for Go development)
- **Rust** (for Rust development)

### Setup
1. **Backup your existing configuration**:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Create workspace directories**:
   ```bash
   mkdir -p ~/notes ~/work-notes ~/projects ~/journal ~/orgfiles
   ```

4. **Start Neovim**:
   ```bash
   nvim
   ```

5. **Install plugins** (automatic on first run):
   ```
   :Lazy sync
   ```

6. **Install LSP servers**:
   ```
   :Mason
   ```

## ⌨️ Key Bindings

### Leader Keys
- **Leader**: `<Space>`
- **Local Leader**: `,`

### Core Navigation
| Key | Action |
|-----|--------|
| `<leader>pv` | File explorer |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help tags |

### Neorg & Note-Taking
| Key | Action |
|-----|--------|
| `<leader>nn` | Notes workspace |
| `<leader>nw` | Work workspace |
| `<leader>np` | Projects workspace |
| `<leader>nj` | Journal workspace |
| `<leader>jt` | Today's journal |
| `<leader>jy` | Yesterday's journal |
| `<leader>jm` | Tomorrow's journal |
| `<leader>td` | Mark task done |
| `<leader>tu` | Mark task undone |
| `<leader>tp` | Mark task pending |

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

### UI & Windows
| Key | Action |
|-----|--------|
| `<leader>db` | Dashboard |
| `<leader>nc` | Toggle concealer |
| `<leader>no` | Presenter mode |
| `<C-h/j/k/l>` | Navigate windows |
| `<leader>w` | Save file |
| `<leader>q` | Quit |

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
├── lua/
│   ├── config/
│   │   └── lazy.lua           # Lazy.nvim setup
│   ├── plugins/
│   │   ├── dashboard.lua      # Dashboard configuration
│   │   ├── data.lua           # Data management
│   │   ├── journal.lua        # Journal setup
│   │   ├── lsp.lua            # LSP configuration
│   │   ├── mason.lua          # Mason setup
│   │   ├── neorg.lua          # Neorg configuration
│   │   ├── plugins.lua        # Main plugins
│   │   ├── telescope.lua      # Telescope setup
│   │   └── treesitter.lua     # Treesitter config
│   └── user/
│       ├── lsp.lua            # User LSP settings
│       ├── options.lua        # Vim options
│       └── remap.lua          # Key mappings
└── after/
    └── plugin/
        └── telescope.lua      # Telescope post-config
```

## 🌟 Workflow Examples

### Note-Taking Workflow
1. **Start with dashboard**: `<leader>db`
2. **Open journal**: `<leader>jt`
3. **Create new note**: `<leader>nf`
4. **Search notes**: `<leader>nff`
5. **Link notes**: `<leader>nfi`

### Development Workflow
1. **Open project**: `<leader>ff`
2. **Find symbols**: `<leader>fs`
3. **Go to definition**: `gd`
4. **Find references**: `gr`
5. **Format code**: `<leader>f`

### Task Management
1. **Create tasks** in Neorg files
2. **Mark done**: `<leader>td`
3. **Find tasks**: `<leader>nft`
4. **Export to markdown**: `<leader>ne`

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

**Neorg not loading**:
- Check workspace directories exist
- Verify file extensions are `.norg`

## 📚 Learning Resources

- **[Neovim Documentation](https://neovim.io/doc/)**
- **[Neorg Wiki](https://github.com/nvim-neorg/neorg/wiki)**
- **[Lazy.nvim Documentation](https://lazy.folke.io/)**
- **[Telescope Documentation](https://github.com/nvim-telescope/telescope.nvim#usage)**

## 🤝 Contributing

Feel free to:
- Submit bug reports
- Suggest improvements
- Share your customizations
- Add new features

## 📄 License

This configuration is open source and available under the [MIT License](LICENSE).

---

**Happy coding!** 🎉
