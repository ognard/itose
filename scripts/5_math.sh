#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
WHITE='\033[0;37m'
NC='\033[0m'

echo -e "${WHITE}\n-------------------------------------------------------------------------------\n${NC}"
printf "${WHITE}  Insert value A: ${NC}"
while [[ -z $value_a ]]; do
    read -r value_a
    if [[ -z $value_a ]]; then
        printf "${RED}  x${NC}  ${YELLOW}Value A must be provided.${NC} Insert value: "
    fi
done

printf "${WHITE}  Insert value B: ${NC}"
while [[ -z $value_b ]]; do
    read -r value_b
    if [[ -z $value_b ]]; then
        printf "${RED}  x${NC} ${YELLOW}Value B must be provided.${NC} Insert value: "
    fi
done
while true; do
    printf "${WHITE}  Insert operation${NC} ${GREEN}(add | sub | mul | div): ${NC}"
    read -r operation
    case "$operation" in
        add|"+")
            result=$((value_a + value_b))
            echo -e "\n${GREEN}  \u2713 ${value_a} + ${value_b} = $result${NC} \n"
            break
            ;;
        sub|"-")
            result=$((value_a - value_b))
            echo -e "\n${GREEN}  \u2713 ${value_a} - ${value_b} = $result${NC} \n"
            break
            ;;
        mul|"*")
            result=$((value_a * value_b))
            echo -e "\n${GREEN}  \u2713 ${value_a} * ${value_b} = $result${NC} \n"
            break
            ;;
        div|"/")
            result=$(echo "scale=2; $value_a / $value_b" | bc)
            echo -e "\n${GREEN}  \u2713 ${value_a} / ${value_b} = $result${NC} \n"
            break
            ;;
        *)
            printf "${RED}  x${NC} ${YELLOW}Invalid operation.${NC} \n"
            ;;
    esac
done
