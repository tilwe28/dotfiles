#!/bin/bash

# Install Homebrew
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if command -v brew &>dev/null; then
        echo "Success"
    else
        echo "Error: could not install Homebrew"
        exit 1
    fi
else
    echo "Homebrew already installed"
fi
echo ""

# Install formulae
echo "Installing formulae"
brew install $(curl -fsSL https://raw.githubusercontent.com/tilwe28/dotfiles/HEAD/formulae.txt)

# Install casks
echo "Installing casks"
brew install --cask $(curl -fsSL https://raw.githubusercontent.com/tilwe28/dotfiles/HEAD/casks.txt)

# Font
font_options=("fira-code" "hack" "jetbrains-mono" "meslo-lg") # font-<name>-nerd-font
printf "\nChoose a nerd font\n"
printf "Recomended options:\n\t0 - Fira Code (default)\n\t1 - Hack\n\t2 - Jetbrains Mono\n\t3 - Meslo LG\n\t4 - skip and manually install later\n"
read -p "Selection number (empty for default): " font_selection_number
echo ""
if [[ ! $font_selection_number =~ ^[0-4]$ ]]; then
    echo "Invalid entry, choosing Fira Code by default"
    font_selection_number=0
fi
if (( $font_selection_number < 4 )); then
    echo "Installing" ${font_options[$font_selection_number]}
    brew install "font-${font_options[$font_selection_number]}-nerd-font"
fi
echo ""

# Git

#  TODO:
# - ask user for git config values (setup keys as well)
# - clone dotfiles repo into .config directory
# - configure macos settings (finder, dock, etc.)
