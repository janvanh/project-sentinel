#!/usr/bin/env bash

for file in bible/chapters/*.tex; do
    cat chapter-template.tex "$file" > "$file.tmp" && mv "$file.tmp" "$file"
done
