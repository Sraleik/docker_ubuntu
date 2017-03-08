#!/bin/bash

function version2 { echo "$@" | gawk -F. '{ printf("%03d%03d\n", $1,$2); }'; }
function version3 { echo "$@" | gawk -F. '{ printf("%03d%03d%03d\n", $1,$2,$3); }'; }

nvim_version=`nvim --version | head -n1 | cut -d" " -f2`


if [ "$(version3 "$nvim_version")" -gt "$(version3 "0.1.5")" ]; then
  echo "---nvim---"
  echo "$nvim_version is greater than 0.1.5 !"
  echo " "
else
  nvim --version
  exit 1
fi

