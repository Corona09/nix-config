#!/bin/bash
set -e

SRC_URL="https://raw.githubusercontent.com/ryanoasis/vim-devicons/master/plugin/webdevicons.vim"

echo "Updating from ${SRC_URL}..."
curl -s ${SRC_URL} | perl -0777ne 'print "# vim: set fileencoding=utf-8\n# autogenerated with gen_icons.sh\n\n"; while(/let s:((file_node_extensions|file_node_exact_matches|file_node_pattern_matches) = {.*?})/gs){$v=$1; $v=~s/\\//g; print "$v\n";}' > icons.py

echo "Testing updated icons.py"
python icons.py

echo "Success!"
