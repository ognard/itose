#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
WHITE='\033[0;37m'
NC='\033[0m'

# Reading file name.
echo -e "${WHITE}\n-------------------------------------------------------------------------------\n${NC}"
printf "${WHITE}  Insert file name: ${NC}"
read file_name

# Checking if the file exists in the current directory.
if [[ -f $file_name ]]; then
    echo -e "\n  ${GREEN}\u2713 File exists in the current directory!${NC} \n"
else
    echo -e "\n  ${RED}x${NC} ${YELLOW}File doesn't exist in the current directory!${NC} \n"
fi
