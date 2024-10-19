#!/bin/bash

# Define your source and target directories
source_dir=~/Documents/rubs-vault/main\ notes
target_dir=~/Documents/cours/francais-a-imprimer

# Create the target directory if it doesn't exist
mkdir -p "$target_dir"

# Find all markdown files in the source directory and search for #français
find "$source_dir" -name "*.md" | while read -r file; do
  if grep -q "#français" "$file"; then
    # Extract the filename without extension
    filename=$(basename "$file" .md)

    # Convert the markdown file to PDF using pandoc
    pandoc "$file" --pdf-engine=wkhtmltopdf -o "$target_dir/$filename.pdf"

    echo "Converted $file to $target_dir/$filename.pdf"
  fi
done

