#!/bin/bash

set -euo pipefail
if [ -n "$(git status --porcelain -u no)" ]; then
    echo "Git is dirty, please commit your changes before running this script."
    exit 1
fi

python clean.py

for i in {0..10}; do
    pandoc -o ch$i.md ch$i.html
done

pandoc -o book.epub \
    --css epub.css \
    --toc \
    --toc-depth 2 \
    -V lang=en \
    --epub-cover-image cover.jpg \
    --resource-path=. \
    --metadata author="J. Hershey Longenecker" \
    --metadata title="Memories of Congo" \
    ch0.md \
    ch1.md \
    ch2.md \
    ch3.md \
    ch4.md \
    ch5.md \
    ch6.md \
    ch7.md \
    ch8.md \
    ch9.md \
    ch10.md

rm ch*.md

git reset --hard HEAD
