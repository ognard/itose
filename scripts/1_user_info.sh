#!/usr/bin/env bash

# Print current user's name, current directory,
# user's home directory and default shell.
echo -e "\n---------------------------------------------------------------------\n"
echo -e "  + Current user's name: $(whoami)"
echo -e "  + Current directory: $(pwd)"
echo -e "  + Home directory for this user: $HOME"
echo -e "  + Default shell: $SHELL\n"
