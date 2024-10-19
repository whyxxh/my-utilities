#!/bin/bash

font_dir="$HOME/.fonts/"
config_file="$HOME/.config/kitty/kitty.conf"

font_files=($(ls "$font_dir" | grep -E 'Regular'))

format_font_name() {
  local font_file="$1"
  local font_name="${font_file%.*}"
  font_name="${font_name//Regular/}"
  font_name="${font_name//Nerd/ Nerd}"
  font_name="${font_name//Mono/ Mono}"
  font_name="${font_name//Font/ Font}"
  font_name="${font_name//-/ }"
  echo "$font_name"
}

fonts=()
for font_file in "${font_files[@]}"; do
    formatted_name=$(format_font_name "$font_file")
    fonts+=("$formatted_name")
done

echo "Please select a new font: "
select font in "${fonts[@]}"; do
  if [[ -n $font ]]; then
    echo "You selected: $font"
    break 
  else
    echo "Invalid selection, try again: "
  fi 
done

sed -i.bak "s/^font_family .*/font_family $font/" "$config_file"

echo "Updated kitty.conf with font: $font"

