#!/bin/bash

folder="WiggleBin"

# Function to create directories
create_directories() {
  echo "Creating directories..."
  mkdir -p "~/$folder"
  mkdir -p "~/$folder/packages"
  mkdir -p "~/$folder/sensor-data"
  mkdir -p "~/$folder/pictures"
  mkdir -p "~/$folder/zip"
  echo "Directories created at "~/$folder.""
}

# Function to create a virtual environment and install packages
setup_virtualenv() {
  packagesSystemWide="wiggle-camera"
  pip install $packagesSystemWide --break-system-packages
  
  echo "Setting up virtual environment..."
  python3 -m venv "~/$folder/packages/venv"
  source "~/$folder/packages/venv/bin/activate"
  
  # Packages to install
  # packagesSystemWide="wiggle-camera wiggle-light"
  # packages="wiggle-api wiggle-dashboard wiggle-settings wiggle-sensors wiggle-services"

  # Install the packages
  pip install --upgrade pip
  # pip install $packages

  wiggle-camera-install
  # wiggle-light-install
  # wiggle-api-install
  # wiggle-gate-install
  # wiggle-motion-install
  # wiggle-settings-install
  # wiggle-soil-temperature-install

  echo "Packages installed: $packages"
  deactivate
}

# Run the functions
create_directories
setup_virtualenv

echo "Installation complete!"