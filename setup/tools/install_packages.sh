#!/bin/bash

# Function to check if a line is a comment
check_if_comment() {
    local line=$1
    if [[ "${line:0:1}" == "#" ]]; then
        echo "$line"
        return 0
    fi
    return 1
}

# Function to install a package using pacman
install_package_pacman() {
    local package=$1
    echo -n "Installing package: $package ..."
    sudo pacman -S --noconfirm "$package" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "\e[32m[OK]\e[0m"
    else
        echo -e "\e[31m[Failed]\e[0m"
    fi
}

# Function to install a package using yay
install_package_yay() {
    local package=$1
    echo -n "Installing package: $package ..."
    yay -S --noconfirm "$package" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "\e[32m[OK]\e[0m"
    else
        echo -e "\e[31m[Failed]\e[0m"
    fi
}

# Function to determine which package manager to use
install_package() {
    local package=$1
    if [ "$PACKAGE_MANAGER" == "yay" ]; then
        install_package_yay "$package"
    elif [ "$PACKAGE_MANAGER" == "pacman" ]; then
        install_package_pacman "$package"
    else
        echo "Error: Unsupported package manager '$PACKAGE_MANAGER'"
        exit 1
    fi
}

# Check for correct number of arguments
if [ $# -lt 2 ]; then
    echo "Usage: $0 <pacman|yay> <package-list-file | package-names>"
    exit 1
fi

PACKAGE_MANAGER="$1"
shift  # Shift arguments to process either a file or package list

if [ -f "$1" ]; then
    PACKAGE_LIST="$1"
    while IFS= read -r package; do
        # Ignore empty lines
        if [ -z "$package" ]; then
            continue
        fi

        # Check if it's a comment
        if check_if_comment "$package"; then
            continue
        fi

        # Install the package
        install_package "$package"
    done < "$PACKAGE_LIST"
else
    # Treat remaining arguments as package names
    for package in "$@"; do
        install_package "$package"
    done
fi

