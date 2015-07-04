#!/bin/sh
for file in "$@"
do
    convert +dither -colors 4 -colorspace gray "$file" "reduced/$file"
    #convert +dither -colors 8 "$file" "reduced/$file"
done
