#!/bin/sh

SOFTWARE_TO_INSTALL="puredata pisound-ctl amidiauto pisound-ctl-scripts-puredata"
sudo apt-get update
sudo apt-get install $SOFTWARE_TO_INSTALL -y
echo "Done! Thank you!"
