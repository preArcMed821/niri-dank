#!/usr/bin/env bash
set -euo pipefail

# Install dependencies required by Homebrew
sudo rpm-ostree install \
    gcc \
    glibc-devel \
    make \
    curl \
    git

# Install Homebrew (Linuxbrew)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Set Brew environment for all users
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' | sudo tee /etc/profile.d/homebrew.sh

# Apply env vars into rootfs for build-time use
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

