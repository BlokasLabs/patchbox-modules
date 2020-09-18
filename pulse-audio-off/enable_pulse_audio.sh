#!/bin/sh

# Copyright (C) 2017-2020 Vilniaus Blokas UAB, https://blokas.io/pisound
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

pactl load-module module-jackdbus-detect
pactl load-module module-jack-sink
pactl load-module module-jack-source
