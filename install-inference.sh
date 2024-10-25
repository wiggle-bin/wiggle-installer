#!/bin/bash

setup_inference() {
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo docker pull roboflow/inference-server:cpu

  echo "Inference installed."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  setup_inference
fi