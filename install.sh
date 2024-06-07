#!/bin/bash

source install-services.sh
source install-packages.sh
source install-development.sh

folder="WiggleBin"

# Function to create directories
create_directories() {
  echo "Creating directories..."
  mkdir -p ~/$folder
  mkdir -p ~/$folder/packages
  mkdir -p ~/$folder/sensor-data
  mkdir -p ~/$folder/pictures
  mkdir -p ~/$folder/zip
  mkdir -p ~/$folder/videos
  echo "Directories created at "~/$folder.""
}

# Run the functions
create_directories

if [ "$environment" = "development" ]; then
  setup_development
else
  setup_packages
fi

setup_services

echo "Installation complete!"