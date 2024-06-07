#!/bin/bash

source install-services.sh
source install-packages.sh

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

# Run the functions
create_directories
setup_virtualenv
setup_services

echo "Installation complete!"