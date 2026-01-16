#!/bin/bash

# Product Manager Suite - Installation Script
# This script helps install the plugin in various ways

set -e

PLUGIN_NAME="product-manager-suite"
PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🎭 Product Manager Suite Installer"
echo "=================================="
echo ""

# Function to detect Claude Code config location
get_claude_config_dir() {
    if [[ -n "$CLAUDE_CONFIG_DIR" ]]; then
        echo "$CLAUDE_CONFIG_DIR"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "$HOME/.claude"
    else
        echo "$HOME/.config/claude"
    fi
}

# Function to install to local Claude config
install_to_local() {
    echo "📦 Installing plugin to local Claude configuration..."

    local config_dir=$(get_claude_config_dir)
    local plugins_dir="$config_dir/plugins"

    # Create directories
    mkdir -p "$plugins_dir"

    # Copy plugin
    if [[ -d "$plugins_dir/$PLUGIN_NAME" ]]; then
        echo "⚠️  Plugin already exists. Updating..."
        rm -rf "$plugins_dir/$PLUGIN_NAME"
    fi

    cp -r "$PLUGIN_DIR" "$plugins_dir/"
    echo "✅ Plugin installed to $plugins_dir/$PLUGIN_NAME"

    # Enable plugin
    enable_plugin_in_config
}

# Function to enable plugin in global config
enable_plugin_in_config() {
    local config_dir=$(get_claude_config_dir)
    local config_file="$config_dir/settings.json"

    mkdir -p "$config_dir"

    if [[ ! -f "$config_file" ]]; then
        echo '{"plugins": {}}' > "$config_file"
    fi

    # Check if jq is available for JSON manipulation
    if command -v jq >/dev/null 2>&1; then
        # Use jq to update JSON
        if jq --arg name "$PLUGIN_NAME" '.plugins[$name] = {"enabled": true}' "$config_file" > "$config_file.tmp"; then
            mv "$config_file.tmp" "$config_file"
        fi
    else
        # Fallback: use sed (brittle but works for simple cases)
        echo "⚠️  jq not found. Please manually enable the plugin in $config_file"
        echo "   Add: \"$PLUGIN_NAME\": {\"enabled\": true}"
    fi

    echo "✅ Plugin enabled in global configuration"
}

# Function to install to project
install_to_project() {
    local project_dir="${1:-.}"

    if [[ ! -d "$project_dir/.claude" ]]; then
        echo "📁 Creating .claude directory in project..."
        mkdir -p "$project_dir/.claude"
    fi

    # Create or update settings.json
    local settings_file="$project_dir/.claude/settings.json"

    if [[ ! -f "$settings_file" ]]; then
        echo '{"plugins": {}}' > "$settings_file"
    fi

    # Add relative path configuration
    # Calculate relative path from project to plugin
    local relative_path
    if [[ "$project_dir" == "." ]]; then
        relative_path="./$(basename "$PLUGIN_DIR")"
    else
        relative_path="./$(relpath "$PLUGIN_DIR" "$project_dir")"
    fi

    if command -v jq >/dev/null 2>&1; then
        jq --arg name "$PLUGIN_NAME" \
           --arg path "$relative_path" \
           '.plugins[$name] = {"path": $path, "enabled": true}' \
           "$settings_file" > "$settings_file.tmp"
        mv "$settings_file.tmp" "$settings_file"
    else
        cat >> "$settings_file" << EOF
  ,"$PLUGIN_NAME": {
    "path": "$relative_path",
    "enabled": true
  }
}
EOF
    fi

    echo "✅ Plugin configured for project at $project_dir"
    echo "   Configuration: $settings_file"
}

# Function to show usage
show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "OPTIONS:"
    echo "  --local          Install to local Claude config ($HOME/.claude)"
    echo "  --project [DIR]  Install to project (default: current directory)"
    echo "  --help           Show this help message"
    echo ""
    echo "EXAMPLES:"
    echo "  $0 --local                    # Install globally"
    echo "  $0 --project                 # Install to current project"
    echo "  $0 --project ./my-product    # Install to specific project"
    echo ""
}

# Simple relpath implementation
relpath() {
    python3 -c "import os.path, sys; print(os.path.relpath(sys.argv[1], sys.argv[2]))" "$1" "$2" 2>/dev/null || echo ".."
}

# Parse arguments
case "${1:-}" in
    --local)
        install_to_local
        echo ""
        echo "🎉 Installation complete!"
        echo ""
        echo "Next steps:"
        echo "1. Restart Claude Code"
        echo "2. Run: /plugin list  # Verify installation"
        echo "3. Try: /pm-lead      # Start the PM agent"
        ;;

    --project)
        install_to_project "${2:-.}"
        echo ""
        echo "🎉 Installation complete!"
        echo ""
        echo "Next steps:"
        echo "1. The plugin is configured for this project"
        echo "2. Share the .claude/settings.json with your team"
        echo "3. Team members just need the plugin in the same relative location"
        ;;

    --help|-h|h)
        show_usage
        ;;

    "")
        # Interactive mode
        echo "Choose installation method:"
        echo "1) Install to local Claude configuration (all projects)"
        echo "2) Install to current project only"
        echo "3) Show help"
        echo ""
        read -p "Enter your choice (1-3): " choice

        case "$choice" in
            1) install_to_local ;;
            2) install_to_project ;;
            3) show_usage ;;
            *) echo "❌ Invalid choice"; exit 1 ;;
        esac
        ;;

    *)
        echo "❌ Unknown option: $1"
        show_usage
        exit 1
        ;;
esac

echo ""
echo "For more information, see: $(dirname "$0")/README.md"
