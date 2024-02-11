#!/bin/bash

set -euo pipefail
if [ -n "$(git status --porcelain -u no)" ]; then
    echo "Git is dirty, please commit your changes before running this script."
    exit 1
fi

python clean.py

for i in {0..10}; do
    pandoc -o CH$i.md CH$i.htm
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
    CH0.md \
    CH1.md \
    CH2.md \
    CH3.md \
    CH4.md \
    CH5.md \
    CH6.md \
    CH7.md \
    CH8.md \
    CH9.md \
    CH10.md

pandoc \
    CH0.md \
    CH1.md \
    CH2.md \
    CH3.md \
    CH4.md \
    CH5.md \
    CH6.md \
    CH7.md \
    CH8.md \
    CH9.md \
    CH10.md \
    --template=custom-template.tex \
    -o book.pdf \
    -V indent \
    -V subparagraph \
    -V fontfamily="libertine" \
    -V fontfamilyoptions="oldstyle,proportional" \
    -V papersize=a5 \
    --top-level-division=chapter \
    --pdf-engine=lualatex \
    --table-of-contents

rm CH*.md

git reset --hard HEAD
