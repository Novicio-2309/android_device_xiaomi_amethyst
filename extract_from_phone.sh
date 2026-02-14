#!/bin/bash
# Script para kumuha ng blobs gamit ang Root Termux

# Saan natin kukunin ang files?
SRC_VENDOR="/vendor"
SRC_SYSTEM="/system"

# Saan ilalagay?
DEST="./prebuilts"

echo "Simula na ang pag-copy ng blobs..."

# Basahin ang bawat line sa proprietary-files.txt
while read -r file; do
    # Laktawan ang mga comments (#) at empty lines
    [[ $file = \#* ]] && continue
    [[ -z $file ]] && continue

    # Linisin ang line (tanggalin ang "-" sa unahan kung meron)
    clean_file=$(echo $file | sed 's/^-//')

    echo "Copying: $clean_file"
    
    # Gumawa ng sub-folder sa destination
    mkdir -p "$DEST/$(dirname $clean_file)"
    
    # Copy gamit ang su (dahil restricted ang /vendor)
    su -c "cp /$clean_file $DEST/$clean_file"
    
done < proprietary-files.txt

echo "Tapos na! Check mo yung prebuilts folder."
