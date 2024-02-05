#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Update and upgrade using apt on Debian/Ubuntu
update_apt() {
    sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
}

# Update and upgrade using flatpak
update_flatpak() {
    flatpak update -y
}

# Update and upgrade using homebrew on macOS
update_homebrew() {
    brew update && brew upgrade
}

# Update npm packages
update_npm() {
    sudo npm update -g
}

# Display menu with colors and get user choice
echo -e "${YELLOW}Choose which package manager to use for update and upgrade:${NC}"
echo -e "1. ${GREEN}apt (Debian/Ubuntu)${NC}"
echo -e "2. ${GREEN}flatpak${NC}"
echo -e "3. ${GREEN}homebrew (Nix Version)${NC}"
echo -e "4. ${GREEN}npm${NC}"
echo -e "5. ${GREEN}All${NC}"

read -p "Enter your choice (1-5): " choice

# Execute chosen option
case $choice in
    1)
        if command_exists apt; then
            echo -e "${YELLOW}Updating and upgrading apt...${NC}"
            update_apt
            echo -e "${GREEN}apt update, upgrade, and autoremove completed.${NC}"
        else
            echo -e "${RED}apt not found. Skipping apt update and upgrade.${NC}"
        fi
        ;;
    2)
        if command_exists flatpak; then
            echo -e "${YELLOW}Updating and upgrading flatpak...${NC}"
            update_flatpak
            echo -e "${GREEN}Flatpak update and upgrade completed.${NC}"
        else
            echo -e "${RED}flatpak not found. Skipping flatpak update and upgrade.${NC}"
        fi
        ;;
    3)
        if command_exists brew; then
            echo -e "${YELLOW}Updating and upgrading homebrew...${NC}"
            update_homebrew
            echo -e "${GREEN}Homebrew update and upgrade completed.${NC}"
        else
            echo -e "${RED}homebrew not found. Skipping homebrew update and upgrade.${NC}"
        fi
        ;;
    4)
        if command_exists npm; then
            echo -e "${YELLOW}Updating npm packages...${NC}"
            update_npm
            echo -e "${GREEN}npm update completed.${NC}"
        else
            echo -e "${RED}npm not found. Skipping npm update.${NC}"
        fi
        ;;
    5)
        if command_exists apt; then
            echo -e "${YELLOW}Updating and upgrading apt...${NC}"
            update_apt
            echo -e "${GREEN}apt update and upgrade completed.${NC}"
        else
            echo -e "${RED}apt not found. Skipping apt update and upgrade.${NC}"
        fi

        if command_exists flatpak; then
            echo -e "${YELLOW}Updating and upgrading flatpak...${NC}"
            update_flatpak
            echo -e "${GREEN}Flatpak update and upgrade completed.${NC}"
        else
            echo -e "${RED}flatpak not found. Skipping flatpak update and upgrade.${NC}"
        fi

        if command_exists brew; then
            echo -e "${YELLOW}Updating and upgrading homebrew...${NC}"
            update_homebrew
            echo -e "${GREEN}Homebrew update and upgrade completed.${NC}"
        else
            echo -e "${RED}homebrew not found. Skipping homebrew update and upgrade.${NC}"
        fi

        if command_exists npm; then
            echo -e "${YELLOW}Updating npm packages...${NC}"
            update_npm
            echo -e "${GREEN}npm update completed.${NC}"
        else
            echo -e "${RED}npm not found. Skipping npm update.${NC}"
        fi
        ;;
    *)
        echo -e "${RED}Invalid choice. Exiting.${NC}"
        ;;
esac

