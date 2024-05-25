#!/bin/bash

folder="WiggleBin"

# Function to create directories
create_directories() {
  echo "Creating directories..."
  mkdir -p ~/$folder
  mkdir -p ~/$folder/packages
  mkdir -p ~/$folder/sensor-data
  mkdir -p ~/$folder/pictures
  mkdir -p ~/$folder/zip
  echo "Directories created at "~/$folder.""
}

# Function to create a virtual environment and install packages
setup_virtualenv() {
  echo "Setting up virtual environment..."
  python3 -m venv ~/$folder/packages/venv
  source ~/$folder/packages/venv/bin/activate
  
  # Packages to install
  # packages="wiggle-api wiggle-dashboard wiggle-settings wiggle-sensors"
  packages="wiggle-api wiggle-camera"

  # Install the packages
  pip install --upgrade pip
  pip install $packages

  echo "Packages installed: $packages"
  deactivate
}

setup_services() {
  echo "Copying files to ~/.config/systemd/user/..."
  cp -r services/* ~/.config/systemd/user/
  echo "Files copied."
  echo "Enabling services..."
  systemctl --user enable wiggle-camera.service
  systemctl --user start wiggle-camera.service
  systemctl --user enable wiggle-api.service
  systemctl --user start wiggle-api.service
  # systemctl --user enable wiggle-dashboard.service
  # systemctl --user enable wiggle-settings.service
  # systemctl --user enable wiggle-sensors.service
  echo "Services enabled."
}

# Run the functions
create_directories
setup_virtualenv
setup_services

echo "Installation complete!"