#!/bin/sh

# diff is called by git with 7 parameters:
# path old-file old-hex new-file new-hex new-mode

"/usr/bin/opendiff" "$2" "$5" -merge "$1"
