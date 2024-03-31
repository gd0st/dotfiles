#!/usr/bin/env bash
#


CODE_DIR="$HOME/.code"

function error() {
    echo $1
    exit 2
}

function try() {
    $1 || error $2
}

try "mkdir $CODE_DIR" "Failed to make $CODE_DIR"

while IFS= read lang; do
    try "mkdir $CODE_DIR/$lang"
done <<EOF
rust
golang
web
python
EOF


exit 0




