#!/bin/bash

setup_development() {
  echo "Setting up virtual environment..."
  python3 -m venv --system-site-packages ~/$folder/packages/.venv
  source ~/$folder/packages/.venv/bin/activate
  
  echo "Cloning repositories..."

  # Repositories to clone
  repositories=("wiggle-camera" "wiggle-api" "wiggle-sensors" "wiggle-settings")

  for repo in "${repositories[@]}"; do
    git clone https://github.com/wiggle-bin/$repo.git ~/$folder/packages/$repo
  done

  echo "Installing packages for each repository..."
  for repo in "${repositories[@]}"; do
    pip install ~/$folder/packages/$repo
    pip install -r ~/$folder/packages/$repo/requirements.txt
  done
  
  echo "Repositories cloned and packages installed"

  deactivate
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  setup_development
fi