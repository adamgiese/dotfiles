#!/bin/bash

BACKUP_DIR="$HOME/config_backup_`date +%Y%m%d_%H%M%S`"
mkdir "$BACKUP_DIR"

for cfile in $(find "$HOME/dotfiles/dotfiles" -mindepth 1 -maxdepth 1); do
    existing="$HOME/${cfile##*/}"
    if [[ -f "$existing" || -L "$existing" ]]; then
        mv "$existing" "$BACKUP_DIR";
    elif [[ -e "$existing" ]]; then
        echo "Unexpected file type:" "$existing"
        exit 1
    fi
    ln -s "$cfile" "$existing"
done
