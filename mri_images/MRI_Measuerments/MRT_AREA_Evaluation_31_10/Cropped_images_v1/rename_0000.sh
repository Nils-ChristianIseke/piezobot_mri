#!/bin/bash

# specify the directory
dir="."

# loop over all files in the directory
for file in "$dir"/*
do
  # get the base name of the file
  base=$(basename "$file")

  # get the file extension
  ext="${base##*.}"

  # get the file name without the extension
  fname="${base%.*}"

  # append _0000 to the file name and add the extension back
  new_base="${fname}_0000.${ext}"

  # rename the file
  mv "$file" "$dir/$new_base"
done
