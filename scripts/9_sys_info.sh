#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
WHITE='\033[0;37m'
NC='\033[0m'

echo -e "${WHITE}\n-------------------------------------------------------------------------------\n${NC}"

echo -e "${GREEN}      GENERAL${NC}"
echo -e "${GREEN}  + ----------------------------------------------------------------------- + ${NC}\n"
echo -e "${YELLOW}$(uname -a)${NC} \n" | fold -w 70 -s | sed 's/^/      /'


echo -e "${GREEN}      DISK USAGE${NC}"
echo -e "${GREEN}  + ----------------------------------------------------------------------- + ${NC}\n"
echo -e "${YELLOW}$(df -h)${NC} \n" | sed 's/^/      /'


echo -e "${GREEN}      PROCESSES (high memory)  ${NC}"
echo -e "${GREEN}  + ----------------------------------------------------------------------- + ${NC}\n"
echo -e "${YELLOW}$(ps aux --sort=-%mem | head -n 10)${NC}\n" | sed 's/^/      /'

echo -e "${GREEN}      PROCESSES (high cpu)  ${NC}"
echo -e "${GREEN}  + ----------------------------------------------------------------------- + ${NC}\n"
echo -e "${YELLOW}$(ps aux --sort=-%mem | head -n 10)${NC}\n" | sed 's/^/      /'
