#!/bin/bash

setup_services() {
  echo "Copying files to ~/.config/systemd/user/..."
  if [ ! -d ~/.config/systemd/user/ ]; then
    mkdir -p ~/.config/systemd/user/
  fi
  cp -r services/* ~/.config/systemd/user/
  echo "Files copied."
  echo "Enabling services..."

  systemctl --user daemon-reload
  systemctl --user enable --now wiggle-camera.timer
  systemctl --user enable --now wiggle-camera-light.service
  systemctl --user enable --now wiggle-api.service  
  systemctl --user enable --now wiggle-sensors.timer  
  systemctl --user enable --now wiggle-sensors-gate.service  
  systemctl --user enable --now wiggle-sensors-accelerometer.service

  echo "Services enabled."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  setup_services
fi