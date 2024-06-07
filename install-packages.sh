#!/bin/bash

setup_packages() {
  echo "Setting up virtual environment..."
  python3 -m venv --system-site-packages ~/$folder/packages/venv
  source ~/$folder/packages/venv/bin/activate
  
  echo "Installing packages..."

  # Packages to install
  # packages="wiggle-api wiggle-dashboard wiggle-settings wiggle-sensors"
  packages="wiggle-api wiggle-camera"

  # Install the packages
  pip install -q --upgrade pip
  pip install -q --upgrade $packages

  echo "Packages installed: $packages"
  deactivate
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  setup_packages
fi