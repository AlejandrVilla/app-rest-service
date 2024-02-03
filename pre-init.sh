#!/bin/bash

# Update system packages
sudo apt update -y

# Install Java, Docker, and Gradle
sudo apt install -y default-jdk docker.io gradle

# Add current user to the Docker group without sudo
sudo usermod -aG docker $USER

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker