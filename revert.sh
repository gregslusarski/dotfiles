#!/bin/bash

# Get the dir of the current script
script_dir="$( cd "$( dirname "$0" )" && pwd )"

counter=0

# Remove symlinks listed in the `log` file, and remove the `log` file.
if [ -e $script_dir/.log ]; then
  while read link; do
    if [ -h $link ]; then
      rm $link
      backup="$link.backup"
      if [ -e $backup ]; then
        mv $backup ${backup%.*}
      fi
      counter=$(($counter + 1))
    fi
  done <$script_dir/.log

  rm $script_dir/.log
fi

if [ $counter = 1 ]; then
  echo "Done! $counter symlink removed."
else
  echo "Done! $counter symlinks removed."
fi
