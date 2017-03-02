#!/bin/bash

sudo_version=`sudo --version | head -n1 | cut -d" " -f3`
git_version=`git --version | head -n1 | cut -d" " -f3`
curl_version=`curl --version | head -n1 | cut -d" " -f2`
vim_tiny_version=`vim.tiny --version | head -n1 | cut -d" " -f5`

function version2 { echo "$@" | gawk -F. '{ printf("%03d%03d\n", $1,$2); }'; }
function version3 { echo "$@" | gawk -F. '{ printf("%03d%03d%03d\n", $1,$2,$3); }'; }

if [ "$(version3 "$sudo_version")" -gt "$(version3 "1.8.0")" ]; then
  echo "---sudo---"
  echo "$sudo_version is greater than 1.8.0 !"
  echo " "
else
  sudo --version
  exit 1
fi

if [ "$(version3 "$git_version")" -gt "$(version3 "2.7.0")" ]; then
  echo "---git---"
  echo "$git_version is greater than 2.7.0 !"
  echo " "
else
  git --version
  exit 1
fi

if [ "$(version3 "$curl_version")" -gt "$(version3 "7.30.0")" ]; then
  echo "---curl---"
  echo "$curl_version is greater than 7.30.0!"
  echo " "
else
  curl --version
  exit 1
fi

if [ "$(version2 "$vim_tiny_version")" -gt "$(version2 "7.0")" ]; then
  echo "---vim.tiny---"
  echo "$vim_tiny_version is greater than 7.0!"
  echo " "
else
  vim.tiny --version
  exit 1
fi
