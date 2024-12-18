#!/bin/sh

# Copyright (C) 2017-2024 Vilniaus Blokas UAB, https://blokas.io/pimidi/
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

sudo systemctl start pimidipy-mon.path
echo Launching $1...
sudo systemctl stop pimidipy.service
echo "PIMIDIPY_SCRIPT=$1" | sudo dd status=none of=/var/run/pimidipy.active
sudo systemctl start pimidipy.service
