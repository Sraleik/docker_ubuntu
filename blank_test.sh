!/bin/bash

sudo_version = sudo --version | head -n1 | cut -d" " -f3
git_version = git --version | head -n1 | cut -d" " -f3
curl_version = git --version | head -n1 | cut -d" " -f2
vim_tiny_version = git --version | head -n1 | cut -d" " -f5

function version3 { echo "$@" | gawk -F. '{ printf("%03d%03d%03d\n", $1,$2,$3); }'; }
function version2 { echo "$@" | gawk -F. '{ printf("%03d%03d\n", $1,$2); }'; }

if [ "$(version "$(sudo --version | head -n1 | cut -d" " -f3)")" -gt "$(version "1.8.0")" ]; then
  
  echo "$(sudo --version | head -n1 | cut -d" " -f3) is greater than 1.8.0 !"
       
fi

