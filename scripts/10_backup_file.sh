#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
WHITE='\033[0;37m'
NC='\033[0m'

# Getting file. Empty name validation. Validation for existing file.
echo -e "${WHITE}\n-------------------------------------------------------------------------------\n${NC}"
printf "${WHITE}  Insert file name: ${NC}"
while true; do
    read -r file_name
    if [[ -z $file_name ]]; then
        printf "  ${RED}x${NC} File name can't be empty. Please insert a name: "
    elif [[ ! -f $file_name ]]; then
        printf "  ${RED}x${NC} File doesn't exist! Please provide a valid file: "
    else
        break  
    fi
done

# Getting directory. Empty name validation.
printf "${WHITE}  Insert backup directory: ${NC}"
while [[ -z $dir_name ]]; do
    read -r dir_name
    if [[ -z $dir_name ]]; then
        printf "  ${RED}x${NC} Directory name can't be empty. Please insert a name: "
    fi
done


# Creating directory if provided directory doesn't exist already.
if [[ ! -d $dir_name ]]; then
    echo -e "\n  ${RED}[!]${NC} ${YELLOW}Backup directory doesn't exist! Creating '$dir_name' directory.${NC}"
    mkdir -p $dir_name
fi

# Copying the file and providing success message.
safe_dir_name="${dir_name// /_}"
cp "$file_name" "$safe_dir_name/$(basename "$file_name").$(date +%Y%m%d_%H%M%S).bak"
echo -e "\n  ${GREEN}\u2713 Process completed. Backup path: ${NC} ${safe_dir_name}/${file_name}_$(date +%Y%m%d_%H%M%S).tar.gz \n"

