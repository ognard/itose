#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
WHITE='\033[0;37m'
NC='\033[0m'

echo -e "${WHITE}\n-------------------------------------------------------------------------------\n${NC}"
printf "${WHITE}  Insert directory name: ${NC}"
while [[ -z $dir_name ]]; do
    read -r dir_name
    if [[ -z $dir_name ]]; then
        printf "  ${RED}x${NC} Directory name can't be empty. Please insert a name: "
    fi
done

mkdir -p $dir_name

printf "${WHITE}  Insert file name: ${NC}"
while [[ -z $file_name ]]; do
    read -r file_name
    if [[ -z $file_name ]]; then
        echo -n "  File name can't be empty. Please insert a name: "
    fi
    while true; do
        if [[ -f "$dir_name/$file_name" ]]; then
            printf "  ${RED}x${NC} ${YELLOW}File exists! Overwrite?${NC} [Y/n] "
            read -r overwrite_choice
            if [[ ! $overwrite_choice =~ ^[Yy]$ ]]; then
                printf "${YELLOW}  Insert a new file name: ${NC}"
                read -r file_name
                continue
            fi
        fi
        break
    done
done

printf "${WHITE}  Insert content: ${NC}"
while [[ -z $file_content ]]; do
    read -r file_content
    if [[ -z $file_content ]]; then
        echo -e "  ${RED}x${NC} File content can't be empty. Please insert a content: \n"
    fi
done

echo "$file_content" > "$dir_name/$file_name"

printf "  ${GREEN}\u2713 Process completed. Preview file?${NC} [Y/n] "
read -r preview_choice

if [[ $preview_choice =~ ^[Yy]$ ]]; then
    echo -e "${WHITE}\n-------------------------------------------------------------------------------\n${NC}"
    echo -e "  ${WHITE}File preview:${NC} \n"
    printf "  ${GREEN}\u2192${NC} ${YELLOW}File path${NC}: $(pwd)/$dir_name/$file_name \n"
    printf "  ${GREEN}\u2192${NC} ${YELLOW}File content:${NC} \n"
    cat "$dir_name/$file_name" | fold -w 60 -s | sed 's/^/        /'
    echo -e "\n"
else
    echo -e "\n  ${YELLOW}>>> Preview skipped.${NC} \n"
fi
