#!/bin/bash
# This script renames all photos (jpg, jpeg, png, gif) in the current directory
# to sequential numbers (1.jpg, 2.png, etc.) while preserving the original file extension.

# Enable nullglob so that the for loop doesn't run with literal patterns if no files match.
shopt -s nullglob

counter=1

# Loop over all image files (case-insensitive for common extensions)
for file in *.[jJ][pP][gG] *.[jJ][pP][eE][gG] *.[pP][nN][gG] *.[gG][iI][fF]; do
  # Check if the item is a file (not a directory)
  if [ -f "$file" ]; then
    # Extract the file extension (everything after the last dot)
    extension="${file##*.}"
    # Build the new filename with the counter and the original extension
    new_name="${counter}.${extension}"
    
    # Rename the file (using -- to safely handle filenames beginning with a dash)
    mv -- "$file" "$new_name"
    echo "Renamed '$file' to '$new_name'"
    
    # Increment the counter
    ((counter++))
  fi
done
