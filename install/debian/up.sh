#!/bin/bash

set -euo pipefail

function PrintAvailableUps() {

  local ups=()
  for file in *; do

    if ! [ -r "$file" ]; then
      # file is not readable - skipping
      continue
    fi

    if ! [ -f "$file" ]; then
      # file is not a regular file - skipping
      continue
    fi

    if ! [ -x "$file" ]; then
      # file is not executable - skipping
      continue
    fi

    # check if file defines a function named "up"
    if ! grep -q "function up()" "$file"; then
      # up function does not exist in the file - skipping 
      continue
    fi

    ups+=($file)
  done

  echo -e "Available up scripts: \n"
  for idx in ${!ups[@]}; do
    up="${ups[$idx]}"
    printf "\t%s. %s\n" "$(expr $idx + 1)" "$up"
  done
}

function ExecuteUps() {

  local installUps=("$@")
  for up in ${installUps[@]}; do
  local file="$up.sh"
  if ! [ -x "$file" ]; then
    echo -e "Error: $file is not an executable script. Aborting."
    exit 1
  fi

  if ! grep -q "function up()" "$file"; then
    echo -e "Error: $file does not define an up function. Aborting."
    exit 1
  fi

  . $file
  up
done

}

if [ $# -eq 0 ]; then
  PrintAvailableUps
  echo -e "\nUsage: up.sh up docker git\t(Will install docker and git)\n"
  read -a installUps -p "Enter everything (comma seperated) you want to "up": "
else
  installUps=($@)
fi

echo -e "\n"

ExecuteUps "${installUps[@]}"
