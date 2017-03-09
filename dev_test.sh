#!/bin/bash

function version2 { echo "$@" | gawk -F. '{ printf("%03d%03d\n", $1,$2); }'; }
function version3 { echo "$@" | gawk -F. '{ printf("%03d%03d%03d\n", $1,$2,$3); }'; }

nvim_version=`nvim --version | head -n1 | cut -d" " -f2`
fish_version=`fish --version | head -n1 | cut -d" " -f3`
node_version=`node --version | cut -d"v" -f2`
npm_version=`npm --version`


if [ "$(version3 "$nvim_version")" -gt "$(version3 "0.1.5")" ]; then
  echo "---nvim---"
  echo "$nvim_version is greater than 0.1.5 !"
  echo " "
else
  nvim --version
  exit 1
fi

if [ "$(version3 "$fish_version")" -gt "$(version3 "2.4.0")" ]; then
  echo "---fish---"
  echo "$fish_version is greater than 2.4.0 !"
  echo " "
else
  fish --version
  exit 1
fi

if [ "$(version3 "$node_version")" -gt "$(version3 "6.9.0")" ]; then
  echo "---node---"
  echo "$node_version is greater than 6.9.0 !"
  echo " "
else
  node --version
  exit 1
fi

if [ "$(version3 "$npm_version")" -gt "$(version3 "3.10.9")" ]; then
  echo "---npm---"
  echo "$npm_version is greater than 3.10.9 !"
  echo " "
else
  npm --version
  exit 1
fi