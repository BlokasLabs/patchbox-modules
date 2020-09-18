#!/bin/sh

# Copyright (C) 2017-2018 Vilniaus Blokas UAB, https://blokas.io/pisound
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

if [ -z "$PUREDATA_PATCHES_DIR" ]; then
	PUREDATA_PATCHES_DIR=/usr/local/puredata-patches
fi

get_pd_entry() {
	PATCH_DIR=`dirname "$1"`
	echo -n "$PATCH_DIR/"
	cat "$1" | grep "entry:" | sed -e 's/entry:[[:space:]]*//g'
}


find "$PUREDATA_PATCHES_DIR/" | egrep \(main\\.pd\$\|blokas\\.yml\$\) | while read -r i; do
	if echo "$i" | grep -q blokas.yml\$; then
		get_pd_entry "$i"
	else
		# main.pd was found, double check whether there's no blokas.yml available in the patch folder.
		PATCH_DIR=`dirname "$i"`
		if [ ! -e "$PATCH_DIR/blokas.yml" ]; then
			echo "$i"
		fi
	fi
done
