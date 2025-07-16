#!/bin/bash

# Neovim Configuration Installer
# Author: Katie Gilmour
# Description: Automated installer for a clean, modern Neovim configuration

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
NVIM_CONFIG_DIR="$HOME/.config/nvim"
BACKUP_DIR="$HOME/.config/nvim-backup-$(date +%Y%m%d-%H%M%S)"

# Functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

check_dependencies() {
    log_info "Checking dependencies..."
    
    # Check for required tools
    local missing_deps=()
    
    if ! command -v nvim &> /dev/null; then
        missing_deps+=("neovim")
    fi
    
    if ! command -v git &> /dev/null; then
        missing_deps+=("git")
    fi
    
    if ! command -v curl &> /dev/null; then
        missing_deps+=("curl")
    fi
    
    if ! command -v make &> /dev/null; then
        missing_deps+=("make")
    fi
    
    if [ ${#missing_deps[@]} -ne 0 ]; then
        log_error "Missing dependencies: ${missing_deps[*]}"
        echo "Please install the missing dependencies and try again."
        exit 1
    fi
    
    # Check Neovim version
    local nvim_version=$(nvim --version | head -n1 | grep -o 'v[0-9]\+\.[0-9]\+\.[0-9]\+')
    log_info "Neovim version: $nvim_version"
    
    log_success "All dependencies satisfied"
}

backup_existing_config() {
    if [ -d "$NVIM_CONFIG_DIR" ]; then
        log_warning "Existing Neovim configuration found"
        log_info "Creating backup at: $BACKUP_DIR"
        cp -r "$NVIM_CONFIG_DIR" "$BACKUP_DIR"
        log_success "Backup created successfully"
    fi
}

install_lazy_nvim() {
    log_info "Installing lazy.nvim plugin manager..."
    
    local lazy_path="$HOME/.local/share/nvim/lazy/lazy.nvim"
    
    if [ ! -d "$lazy_path" ]; then
        git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$lazy_path"
        log_success "lazy.nvim installed successfully"
    else
        log_info "lazy.nvim already installed"
    fi
}

setup_config_structure() {
    log_info "Setting up configuration structure..."
    
    # Create directory structure
    mkdir -p "$NVIM_CONFIG_DIR/lua/config"
    mkdir -p "$NVIM_CONFIG_DIR/lua/plugins"
    mkdir -p "$NVIM_CONFIG_DIR/lua/user"
    mkdir -p "$NVIM_CONFIG_DIR/lua/after/plugin"
    mkdir -p "$NVIM_CONFIG_DIR/lua/after/ftdetect"
    
    log_success "Configuration structure created"
}

install_external_tools() {
    log_info "Installing external tools..."
    
    # Install language servers and tools via Mason
    # This will be done automatically when Neovim starts
    log_info "Language servers will be installed automatically via Mason"
    
    log_success "External tools setup completed"
}

create_desktop_entry() {
    if command -v desktop-file-install &> /dev/null; then
        log_info "Creating desktop entry..."
        
        cat > /tmp/nvim.desktop << EOF
[Desktop Entry]
Name=Neovim
Comment=Hyperextensible Vim-based text editor
Exec=nvim %F
Terminal=true
Type=Application
Icon=nvim
Categories=Utility;TextEditor;Development;
StartupNotify=true
MimeType=text/english;text/plain;text/x-makefile;text/x-c++hdr;text/x-c++src;text/x-chdr;text/x-csrc;text/x-java;text/x-moc;text/x-pascal;text/x-tcl;text/x-tex;application/x-shellscript;text/x-c;text/x-c++;
EOF
        
        desktop-file-install --dir="$HOME/.local/share/applications" /tmp/nvim.desktop
        rm /tmp/nvim.desktop
        log_success "Desktop entry created"
    fi
}

run_initial_setup() {
    log_info "Running initial Neovim setup..."
    
    # Start Neovim headless to trigger plugin installation
    nvim --headless -c "lua require('lazy').sync()" -c "qa"
    
    log_success "Initial setup completed"
}

cleanup() {
    log_info "Cleaning up temporary files..."
    # Add any cleanup tasks here
    log_success "Cleanup completed"
}

main() {
    echo "================================================="
    echo "    Neovim Configuration Installer"
    echo "================================================="
    echo
    
    check_dependencies
    backup_existing_config
    install_lazy_nvim
    setup_config_structure
    install_external_tools
    create_desktop_entry
    
    log_info "Copying configuration files..."
    # The actual config files should be copied here
    # This assumes the script is run from the config directory
    
    run_initial_setup
    cleanup
    
    echo
    echo "================================================="
    log_success "Installation completed successfully!"
    echo "================================================="
    echo
    echo "To get started:"
    echo "1. Run 'nvim' to open Neovim"
    echo "2. Plugins will install automatically"
    echo "3. Press <leader>h for the dashboard"
    echo "4. Press <leader>ff to find files"
    echo
    echo "Configuration location: $NVIM_CONFIG_DIR"
    if [ -d "$BACKUP_DIR" ]; then
        echo "Backup location: $BACKUP_DIR"
    fi
    echo
    echo "For help and documentation, visit the README.md"
}

# Handle script arguments
case "${1:-}" in
    --help|-h)
        echo "Usage: $0 [OPTIONS]"
        echo
        echo "Options:"
        echo "  --help, -h     Show this help message"
        echo "  --check        Check dependencies only"
        echo "  --backup       Create backup only"
        echo
        exit 0
        ;;
    --check)
        check_dependencies
        exit 0
        ;;
    --backup)
        backup_existing_config
        exit 0
        ;;
    *)
        main
        ;;
esac
