#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
WHITE='\033[0;37m'
NC='\033[0m'

echo -e "\n${GREEN}
   █████ ███████████    ███████     █████████  ██████████
  ░░███ ░█░░░███░░░█  ███░░░░░███  ███░░░░░███░░███░░░░░█
   ░███ ░   ░███  ░  ███     ░░███░███    ░░░  ░███  █ ░ 
   ░███     ░███    ░███      ░███░░█████████  ░██████   
   ░███     ░███    ░███      ░███ ░░░░░░░░███ ░███░░█   
   ░███     ░███    ░░███     ███  ███    ░███ ░███ ░   █
   █████    █████    ░░░███████░  ░░█████████  ██████████
  ░░░░░    ░░░░░       ░░░░░░░     ░░░░░░░░░  ░░░░░░░░░░ 

  IT Operations and Support Engineer Academy @ Qinshift 
        +  www.ognard.com  +  bojan drangovski  +  
${NC}\n"

echo -e "${GREEN}-------------------------------------------------------------------------------${NC}"
echo -e "${GREEN}
  1) User Information
  2) File Operations
  3) Directory Backup
  4) User Input
  5) Arithmetic Operations
  6) Conditional Statements
  7) Loops
  8) Directory & File Management
  9) System Information
 10) File Backup
${NC}"
echo -e "${GREEN}-------------------------------------------------------------------------------\n${NC}"
printf "${GREEN}  What is your selection? [1 - 10] ${NC}"

read -r option

case "$option" in
    1)
        source ./scripts/1_user_info.sh
        ;;
    2)
        source ./scripts/2_file_ops.sh
        ;;
    3)
        source ./scripts/3_backup_dir.sh
        ;;
    4)
        source ./scripts/4_greet.sh
        ;;
    5)
        source ./scripts/5_math.sh
        ;;
    6)
        source ./scripts/6_file_check.sh
        ;;
    7)
        source ./scripts/7_loop.sh
        ;;
    8)
        source ./scripts/8_dir_mgmt.sh
        ;;
    9)
        source ./scripts/9_sys_info.sh
        ;;
    10)
        source ./scripts/10_backup_file.sh
        ;;
    *)
        echo "No valid selection."
        ;;
esac
