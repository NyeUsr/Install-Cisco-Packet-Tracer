#!/bin/bash

function print_color {
    COLOR=$1
    MESSAGE=$2
    echo -e "${COLOR}${MESSAGE}\033[0m"
}

BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'

# Update package lists
print_color $BLUE "Updating package lists..."
if sudo apt update -qq 2>/dev/null; then
    print_color $GREEN "Package lists updated successfully."
else
    print_color $RED "Failed to update package lists."
    exit 1
fi

# Fix dpkg interruptions if any
if sudo dpkg --configure -a 2>&1 | grep -q 'dpkg was interrupted'; then
    print_color $YELLOW "Fixing dpkg interruptions..."
    sudo dpkg --configure -a
    print_color $GREEN "dpkg issues resolved."
fi

# Install gdebi
print_color $BLUE "Installing gdebi..."
if sudo apt install -y gdebi -qq; then
    print_color $GREEN "gdebi installed successfully."
else
    print_color $RED "Failed to install gdebi."
    exit 1
fi

# Download libgl1-mesa-glx
print_color $BLUE "\nDownloading libgl1-mesa-glx..."
if wget -q --show-progress http://ftp.us.debian.org/debian/pool/main/m/mesa/libgl1-mesa-glx_20.3.5-1_amd64.deb -O libgl1-mesa-glx.deb; then
    print_color $GREEN "Downloaded libgl1-mesa-glx.deb successfully."
else
    print_color $RED "Failed to download libgl1-mesa-glx.deb."
    exit 1
fi

# Install libgl1-mesa-glx
print_color $BLUE "\nInstalling libgl1-mesa-glx..."
if sudo gdebi -n libgl1-mesa-glx.deb > /dev/null 2>&1; then
    print_color $GREEN "libgl1-mesa-glx installed successfully."
else
    print_color $RED "Failed to install libgl1-mesa-glx."
    rm libgl1-mesa-glx.deb
    exit 1
fi

# Clean up
print_color $BLUE "\nCleaning up..."
rm libgl1-mesa-glx.deb
print_color $GREEN "Cleanup completed."

# Prompt for Cisco Packet Tracer installation
print_color $GREEN "\nCisco Packet Tracer is ready to be installed."
echo -e "${YELLOW}Do you want to open the URL to download it? [y/n/i]"
echo -e "* y = Yes, open the download page"
echo -e "* n = No, exit the script"
echo -e "* i = Install Packet Tracer from an already downloaded .deb file in your Downloads folder"
read -n1 -p "Your choice: " choice
echo

if [[ "$choice" == "y" ]]; then
    xdg-open https://www.netacad.com/resources/lab-downloads
    print_color $YELLOW "\nPlease download the Packet Tracer .deb file and place it in your Downloads folder."
    read -n1 -p "Once done, type 'i' to install: " choice
    echo
fi

if [[ "$choice" == "i" ]]; then
    print_color $BLUE "\nSearching for Packet Tracer .deb file in your Downloads folder..."
    packet_tracer_deb=$(find ~/Downloads -type f -name "Packet_Tracer*.deb" | head -n 1)
    if [[ -z "$packet_tracer_deb" ]]; then
        print_color $RED "Error: Packet Tracer .deb file not found in your Downloads folder."
        exit 1
    fi
    print_color $BLUE "Installing Cisco Packet Tracer..."
    if sudo apt install -y "$packet_tracer_deb" -qq; then
        print_color $GREEN "\nCisco Packet Tracer has been successfully installed!"
    else
        print_color $RED "Failed to install Cisco Packet Tracer."
        exit 1
    fi
else
    print_color $RED "\nInstallation aborted."
    exit 0
fi