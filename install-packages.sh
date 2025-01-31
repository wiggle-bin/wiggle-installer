#!/bin/bash

setup_packages() {
  echo "Setting up virtual environment..."
  python3 -m venv --system-site-packages ~/$folder/packages/.venv
  source ~/$folder/packages/.venv/bin/activate
  

  # Packages to install
  # packages="wiggle-api wiggle-dashboard wiggle-settings wiggle-sensors"
  packages="wiggle-api wiggle-camera wiggle-sensors"

  echo "Uninstalling packages..."
  pip uninstall -y $packages

  echo "Updating pip and setuptools..."
  pip install --upgrade pip setuptools

  echo "Installing packages..."
  pip install --upgrade $packages

  echo "Packages installed: $packages"
  deactivate
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  setup_packages
fi