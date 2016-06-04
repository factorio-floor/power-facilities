#/bin/bash
# Run From Current Directory
# Querries git for all paths used by this mod
# tests all paths using the 'file' command
export MOD='cargo-containers'
git grep -h __${MOD}__ \
    | grep -vPe '-- ' \
    | sed -re 's/^ +//' \
    | sort \
    | uniq \
    | sed -re "s/__${MOD}__/../" \
    | grep -oP '(?<=")[^"]+(?=")' \
    | xargs file
