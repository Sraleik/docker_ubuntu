#!/bin/bash

function version { echo "$@" | gawk -F. '{ printf("%03d%03d%03d\n", $1,$2,$3); }'; }

if [ "$(version "$(sudo --version | head -n1 | cut -d" " -f3)")" -gt "$(version "1.8.0")" ]; then
  
  echo "$(sudo --version | head -n1 | cut -d" " -f3) is greater than 1.8.0 !"
       
fi

sudo --version
git --version
curl --version
vim.tiny --version
exit 1

