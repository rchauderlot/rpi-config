#!/bin/bash
############
COMMAND=uvcdynctrl
if ! type "$COMMAND" > /dev/null; then
    sudo apt-get install $COMMAND
fi
$COMMAND -f
