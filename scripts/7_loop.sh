#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
WHITE='\033[0;37m'
NC='\033[0m'

echo -e "${WHITE}\n-------------------------------------------------------------------------------\n${NC}"
printf "${GREEN}  The Shady Figure${NC}: [whispering] ${WHITE}Psst... want some cookies? [Y/n] ${NC}"
read loop_choice

if [[ $loop_choice =~ ^[Yy]$ ]]; then
    while true; do
        printf "${GREEN}  \u2192${NC}:${WHITE} How many? "
        read -r choice_number

        if [[ ! $choice_number =~ ^-?[0-9]+$ ]]; then
            printf "${GREEN}  \u2192${NC}:${WHITE} What's this? I need a number: \n"
            continue
        fi
        
        if [[ $choice_number -gt 20 ]]; then
            echo -e "${GREEN}  \u2192${NC}:${WHITE} Are you feeling well? ${choice_number} cookies?! I don't have more than 20. Asking once again..."
        else
            for cookie in $(seq 1 "$choice_number"); do
               printf "${YELLOW}        \u2297 Cookie $cookie ${NC}\n" 
            done
            break
        fi
    done
else
    echo -e "\n${GREEN}  The Shady Figure${NC}:${WHITE} I don't care. Here are 10 cookies for you.${NC}"
    for cookie in {1..10}; do
        printf "${YELLOW}        \u2297 Cookie $cookie ${NC}\n"
    done
fi


