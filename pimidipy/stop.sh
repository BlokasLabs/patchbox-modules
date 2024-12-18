#!/bin/sh

# Copyright (C) 2017-2024 Vilniaus Blokas UAB, https://blokas.io/pimidi/
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

echo Stopping Pimidipy script...
sudo rm /var/run/pimidipy.active
sudo systemctl stop pimidipy.service
sudo systemctl disable --now pimidipy-mon.path pimidipy-mon.service
