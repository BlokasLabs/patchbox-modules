#!/bin/sh

# Copyright (C) 2017-2024 Vilniaus Blokas UAB, https://blokas.io/pimidi/
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

CURDIR=$(dirname $(readlink -f $0))
MODULE_USER="pimidipy"
SCRIPTS_DIR="/var/pimidipy-scripts"
SCRIPTS_REPO="https://github.com/BlokasLabs/pimidipy-scripts.git"
SOFTWARE_TO_INSTALL="python3-pimidipy"

sudo apt-get update
sudo apt-get install $SOFTWARE_TO_INSTALL -y

echo Setting up $MODULE_USER user...
if ! id -u "$MODULE_USER" > /dev/null 2>&1; then
	sudo adduser --no-create-home --system --group "$MODULE_USER"
	sudo adduser "$MODULE_USER" audio --quiet
fi

echo Setting up systemd service...
sudo install -m 644 -o root -g root "$CURDIR/pimidipy.service" "$CURDIR/pimidipy-mon.path" "$CURDIR/pimidipy-mon.service" /etc/systemd/system/
sudo systemctl daemon-reload

echo Setting up $SCRIPTS_DIR...

if [ ! -d "$SCRIPTS_DIR" ]; then
	echo "Cloning pimidipy-scripts repository from $SCRIPTS_REPO..."
	sudo git clone "$SCRIPTS_REPO" "$SCRIPTS_DIR"
else
	echo "Updating pimidipy-scripts repository with latest stuff in "$SCRIPTS_REPO"..."
	cd "$SCRIPTS_DIR" && git -c user.name="patchbox" -c user.email="patch@box" stash && git -c user.name="patchbox" -c user.email="patch@box" pull --rebase
fi

sudo chown -R patch:patch "$SCRIPTS_DIR"

echo "Done! Thank you!"
