#!/bin/sh

# Copyright (C) 2017-2020 Vilniaus Blokas UAB, https://blokas.io/pisound
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

pactl unload-module module-jackdbus-detect
pactl unload-module module-jack-sink
pactl unload-module module-jack-source
