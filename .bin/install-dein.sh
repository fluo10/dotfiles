#!/bin/bash

DEIN_DIR="$HOME/.cache/dein"
if [ ! -e $DEIN_DIR ]; then
	mkdir -p $DEIN_DIR
	curl -L https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s -- $DEIN_DIR
fi
