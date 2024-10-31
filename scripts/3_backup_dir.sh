#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
WHITE='\033[0;37m'
NC='\033[0m'

# Adding directory name. Empty name validation.
if [[ -z $1 ]]; then
    echo -e "${WHITE}\n-------------------------------------------------------------------------------\n${NC}"
    printf "${WHITE}  Insert directory name: ${NC}"
    while [[ -z $dir_name ]]; do
        read -r dir_name
        if [[ -z $dir_name ]]; then
            printf "  ${RED}x${NC} Directory name can't be empty. Please insert a name: "
        fi
    done
else
    dir_name=$1
fi

# Logic for creating archive file and backing it up with date and time.
if [[ ! -d $dir_name ]]; then
    echo -e "  ${RED}x${NC} ${YELLOW}Directory doesn't exist!${NC} \n"
else
    mkdir -p "$HOME/backups"

    safe_dir_name="${dir_name// /_}"
    tar -czf "$HOME/backups/${safe_dir_name}_$(date +%Y%m%d_%H%M%S).tar.gz" "$dir_name"
    
    echo -e "\n  ${GREEN}\u2713 Process completed. Backup path: ${NC} $HOME/backups/${safe_dir_name}_$(date +%Y%m%d_%H%M%S).tar.gz \n"
fi
