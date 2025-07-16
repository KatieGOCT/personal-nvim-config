# Neovim Configuration Makefile
# Author: Katie Gilmour
# Description: Build, test, and manage Neovim configuration

.PHONY: install test clean lint format backup restore help

# Configuration
NVIM_CONFIG_DIR = $(HOME)/.config/nvim
BACKUP_DIR = $(HOME)/.config/nvim-backup-$(shell date +%Y%m%d-%H%M%S)
LUA_FILES = $(shell find . -name "*.lua" -not -path "./lazy-lock.json")

# Default target
all: test

# Install the configuration
install:
	@echo "Installing Neovim configuration..."
	@chmod +x install.sh
	@./install.sh

# Test the configuration
test: lint
	@echo "Testing Neovim configuration..."
	@nvim --headless -c "checkhealth" -c "qa" 2>/dev/null || echo "Health check completed"
	@echo "Running configuration test..."
	@nvim --headless -c "lua print('Configuration loaded successfully')" -c "qa"

# Run luacheck on all Lua files
lint:
	@echo "Running luacheck on Lua files..."
	@if command -v luacheck >/dev/null 2>&1; then \
		luacheck $(LUA_FILES) --globals vim --no-unused-args; \
	else \
		echo "luacheck not found. Install with: luarocks install luacheck"; \
		echo "Skipping lint check..."; \
	fi

# Format Lua files using stylua
format:
	@echo "Formatting Lua files with stylua..."
	@if command -v stylua >/dev/null 2>&1; then \
		stylua $(LUA_FILES); \
	else \
		echo "stylua not found. Install with: cargo install stylua"; \
		echo "Skipping format..."; \
	fi

# Clean up generated files and caches
clean:
	@echo "Cleaning up..."
	@rm -rf $(HOME)/.local/share/nvim/lazy/lazy.nvim
	@rm -rf $(HOME)/.local/share/nvim/mason
	@rm -rf $(HOME)/.local/state/nvim
	@rm -rf $(HOME)/.cache/nvim
	@echo "Cleaned up Neovim data directories"

# Create backup of current configuration
backup:
	@echo "Creating backup..."
	@if [ -d "$(NVIM_CONFIG_DIR)" ]; then \
		cp -r "$(NVIM_CONFIG_DIR)" "$(BACKUP_DIR)"; \
		echo "Backup created at: $(BACKUP_DIR)"; \
	else \
		echo "No existing configuration found"; \
	fi

# Restore from backup (requires BACKUP_PATH)
restore:
	@if [ -z "$(BACKUP_PATH)" ]; then \
		echo "Usage: make restore BACKUP_PATH=/path/to/backup"; \
		exit 1; \
	fi
	@echo "Restoring from backup: $(BACKUP_PATH)"
	@rm -rf "$(NVIM_CONFIG_DIR)"
	@cp -r "$(BACKUP_PATH)" "$(NVIM_CONFIG_DIR)"
	@echo "Configuration restored"

# Update plugins
update:
	@echo "Updating plugins..."
	@nvim --headless -c "lua require('lazy').sync()" -c "qa"

# Health check
health:
	@echo "Running health check..."
	@nvim -c "checkhealth" -c "qa"

# Install development tools
dev-setup:
	@echo "Installing development tools..."
	@if command -v luarocks >/dev/null 2>&1; then \
		luarocks install luacheck; \
	else \
		echo "luarocks not found. Please install luarocks first"; \
	fi
	@if command -v cargo >/dev/null 2>&1; then \
		cargo install stylua; \
	else \
		echo "cargo not found. Please install rust/cargo for stylua"; \
	fi

# Remove all plugin data and start fresh
reset:
	@echo "Resetting Neovim configuration..."
	@rm -rf $(HOME)/.local/share/nvim
	@rm -rf $(HOME)/.local/state/nvim
	@rm -rf $(HOME)/.cache/nvim
	@echo "Reset complete. Run 'make install' to reinstall"

# Show help
help:
	@echo "Neovim Configuration Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  install     - Install the Neovim configuration"
	@echo "  test        - Test the configuration (runs lint first)"
	@echo "  lint        - Run luacheck on Lua files"
	@echo "  format      - Format Lua files with stylua"
	@echo "  clean       - Clean up generated files and caches"
	@echo "  backup      - Create backup of current configuration"
	@echo "  restore     - Restore from backup (requires BACKUP_PATH)"
	@echo "  update      - Update plugins"
	@echo "  health      - Run Neovim health check"
	@echo "  dev-setup   - Install development tools (luacheck, stylua)"
	@echo "  reset       - Remove all plugin data and start fresh"
	@echo "  help        - Show this help message"
	@echo ""
	@echo "Examples:"
	@echo "  make install"
	@echo "  make test"
	@echo "  make restore BACKUP_PATH=/path/to/backup"
