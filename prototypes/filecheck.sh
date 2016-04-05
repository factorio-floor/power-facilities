#/bin/bash
# Run From Current Directory
# Querries git for all paths used by this mod
# tests all paths using the 'file' command
git grep -h __power-facilities__ \
    | grep -vPe '-- ' \
    | sed -re 's/^ +//' \
    | sort \
    | uniq \
    | sed -re 's/__power-facilities__/../' \
    | grep -oP '(?<=")[^"]+(?=")' \
    | xargs file
