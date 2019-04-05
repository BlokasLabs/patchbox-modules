#!/bin/sh

SOFTWARE_TO_INSTALL="puredata mec orac"
sudo apt-get update
sudo apt-get install $SOFTWARE_TO_INSTALL -y

# Disable the newly installed services, Module Manager will enable them as needed.
sudo systemctl disable mec
sudo systemctl disable orac

echo "Done! Thank you!"

