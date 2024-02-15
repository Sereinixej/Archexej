#!/bin/bash

# Check if the user has root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with sudo or as root" 1>&2
    exit 1
fi

# Define the list of packages to install with pacman
pacman_packages=(
    zsh
    base-devel
    git
    bluez
    bluez-utils
    # Add more packages here as needed
)

# Define the list of packages to install with paru
paru_packages=(
    keepassxc
    brave-bin
    visual-studio-code-bin
    spotify
    flameshot
    oh-my-zsh-git
    # Add more packages here as needed
)

# Update package repositories
pacman -Sy

# Install packages with pacman
for package in "${pacman_packages[@]}"; do
    echo "Installing $package with pacman..."
    pacman -S --noconfirm "$package"
done

# Clone paru-bin from AUR and install it using makepkg
echo "Cloning paru-bin from AUR..."
git clone https://aur.archlinux.org/paru-bin.git /tmp/paru-bin
cd /tmp/paru-bin
echo "Building and installing paru-bin..."
makepkg -si --noconfirm

# Install packages with paru
for package in "${paru_packages[@]}"; do
    echo "Installing $package with paru..."
    paru -S --noconfirm "$package"
done

# Clean up temporary directory
rm -rf /tmp/paru-bin

# Post-Configuration
chsh -s /usr/bin/zsh
cp /usr/share/oh-my-zsh/zshrc ~/.zshrc

echo "Package installation complete"
