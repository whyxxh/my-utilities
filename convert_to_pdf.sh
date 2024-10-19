#!/bin/bash

source_dir=~/Documents/rubs-vault/main\ notes
target_dir=~/Documents/cours/francais-a-imprimer

mkdir -p "$target_dir"

find "$source_dir" -name "*.md" | while read -r file; do
  if grep -q "#français" "$file"; then
    filename=$(basename "$file" .md)
    pandoc "$file" --pdf-engine=wkhtmltopdf -o "$target_dir/$filename.pdf"
    echo "Converted $file to $target_dir/$filename.pdf"
  fi
done

