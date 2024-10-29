#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
WHITE='\033[0;37m'
NC='\033[0m'

echo -e "${WHITE}\n-------------------------------------------------------------------------------\n${NC}"
printf "${WHITE}  Who dis? ${NC} "
read -r name

echo -e "\n  ${GREEN}Why hello there,${NC} ${YELLOW}$name!${NC} ${GREEN}Welcome onboard!${NC} \U1F600 \n"
