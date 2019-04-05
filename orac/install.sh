#!/bin/sh

SOFTWARE_TO_INSTALL="puredata orac"
sudo apt-get update
sudo apt-get install $SOFTWARE_TO_INSTALL -y
echo "Done! Thank you!"

