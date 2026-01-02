#!/bin/bash

# Loop through all .deb files in the current directory
for file in *.deb; do
    # Skip if no .deb files exist
    [ -e "$file" ] || continue

    # Extract the package name (everything before the first underscore)
    # Example: hyprland_0.53.0_amd64.deb -> hyprland
    new_name=$(echo "$file" | cut -d'_' -f1)

    # Rename the file
    mv -v "$file" "${new_name}-latest.deb"
done

echo "Renaming complete!"