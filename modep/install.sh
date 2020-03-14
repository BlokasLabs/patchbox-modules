#!/bin/sh -e

SOFTWARE_TO_INSTALL="pisound-ctl modep-ctl-scripts modep-btn-scripts modep-touchosc2midi modep"
sudo apt-get update
sudo apt-get install $SOFTWARE_TO_INSTALL -y
echo "Done! Thank you!"
