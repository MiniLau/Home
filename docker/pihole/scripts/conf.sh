#!/bin/bash

full_path=$(realpath $0)
dir_path=$(dirname $full_path)

# Edit SetupVars file to match wanted installation
python3 $dir_path/setupVars.py

# Restart pihole
pihole restartdns
