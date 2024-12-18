#!/bin/sh

# Copyright (C) 2017-2024 Vilniaus Blokas UAB, https://blokas.io/pimidi/
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

if [ -z "$PIMIDIPY_SCRIPTS_DIR" ]; then
	PIMIDIPY_SCRIPTS_DIR=/var/pimidipy-scripts
fi

for SUBDIR in / /samples/; do
	ls "$PIMIDIPY_SCRIPTS_DIR$SUBDIR" | egrep \(.*\\.py\$\) | while read -r i; do
		echo "$PIMIDIPY_SCRIPTS_DIR$SUBDIR$i"
	done
done
