#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
WHITE='\033[0;37m'
NC='\033[0m'

# Adding directory name. Empty name validation.
echo -e "${WHITE}\n-------------------------------------------------------------------------------\n${NC}"
printf "${WHITE}  Insert directory name: ${NC}"
while [[ -z $dir_name ]]; do
    read -r dir_name
    if [[ -z $dir_name ]]; then
        printf "  ${RED}x${NC} Directory name can't be empty. Please insert a name: "
    fi
done

# Directory creation.
mkdir -p $dir_name

# Listing directory prompt
printf "${WHITE}  Do you want to list ${dir_name} contents? [Y/n] ${NC}"
read list_choice

# Listing and removing directory and its contents (based on the user's choice).
if [[ $list_choice =~ ^[Yy]$ ]]; then
    ls -al $dir_name | sed 's/^/  /'

    printf "${WHITE}  Do you want to remove the created folder now? [Y/n] ${NC}"
    read removal_choice

    if [[ $removal_choice =~ ^[Yy]$ ]]; then
        echo -e "\n${GREEN}  \u2713${NC} ${YELLOW}Okay. The directory has been removed!${NC}\n"
        rmdir $dir_name
    else
        echo -e "\n${GREEN}  Bye.${NC}\n"
    fi
else
    echo -e "\n${GREEN}  \u2713${NC} ${YELLOW}Okay. The directory has been removed!${NC} \n"
    rmdir $dir_name
fi


