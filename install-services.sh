#!/bin/bash

setup_services() {
  echo "Copying files to ~/.config/systemd/user/..."
  if [ ! -d ~/.config/systemd/user/ ]; then
    mkdir -p ~/.config/systemd/user/
  fi
  cp -r services/* ~/.config/systemd/user/
  echo "Files copied."
  echo "Enabling services..."
  systemctl --user enable wiggle-camera.service
  systemctl --user start wiggle-camera.service
  systemctl --user enable wiggle-camera-light.service
  systemctl --user start wiggle-camera-light.service
  systemctl --user enable wiggle-api.service
  systemctl --user start wiggle-api.service
  systemctl --user enable wiggle-sensors-timer.service
  systemctl --user start wiggle-sensors-timer.service
  systemctl --user enable wiggle-sensors-gate.service
  systemctl --user start wiggle-sensors-gate.service
  systemctl --user enable wiggle-sensors-accelerometer.service
  systemctl --user start wiggle-sensors-accelerometer.service

  echo "Services enabled."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  setup_services
fi