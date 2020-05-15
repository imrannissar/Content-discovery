#!/bin/bash
clear
RED='\033[0;31m'    
GREEN='\033[0;32m' 
NC='\033[0m'
LIGHTPURPLE='\033[1;35m'
YELLOW='\033[1;33m'
echo -e "${YELLOW}||====================================================||
||Script Created by ${RED}Imran-Nissar ${YELLOW}for content discovery||
||====================================================||"
echo -e "${RED}==>Enter Target Domain."
read Target
echo -e "               ${LIGHTPURPLE}====================="
echo -e "${GREEN}               Target Domain is ${RED} $Target \n               ${LIGHTPURPLE}===================== \n"
echo -e "${YELLOW}                   ==>SELECT WORDLIST<==                    "${GREEN}
echo -e "${RED}=========================================================="
options=("content_discovery_all" "Top10000-RobotsDisallowed" "big" "Parameters" "gis" "quickhits" "combined" "raft-large-directories" "Common_PHP_Filenames" "raft-large-files" "Apache" "Quit")
echo -e "${RED}==========================================================${GREEN}"
select opt in "${options[@]}" 
do
    case $opt in
        "content_discovery_all")
            cd ~/go/bin
            ./ffuf -w /home/ec2-user/tools/web-discovery/content_discovery_all.txt -u $Target -c 
            ;;
        "Top10000-RobotsDisallowed")
            cd ~/go/bin
            ./ffuf -w /home/ec2-user/tools/web-discovery/Top10000-RobotsDisallowed.txt -u $Target -c 
            ;;
        "big")
            cd ~/go/bin
            ./ffuf -w /home/ec2-user/tools/web-discovery/big.txt -u $Target -c 
            ;;
        "Parameters")
          cd ~/go/bin
            ./ffuf -w /home/ec2-user/tools/web-discovery/Parameters.txt -u $Target -c 
            ;;
        "gis")
          cd ~/go/bin
            ./ffuf -w /home/ec2-user/tools/web-discovery/gis.txt -u $Target -c 
            ;;
        "quickhits")
          cd ~/go/bin
            ./ffuf -w /home/ec2-user/tools/web-discovery/quickhits.txt -u $Target -c 
            ;;
        "combined")
          cd ~/go/bin
            ./ffuf -w /home/ec2-user/tools/web-discovery/combined.txt -u $Target -c 
            ;;
        "raft-large-directories")
          cd ~/go/bin
            ./ffuf -w /home/ec2-user/tools/web-discovery/raft-large-directories.txt -u $Target -c 
            ;;
        "Common_PHP_Filenames")
          cd ~/go/bin
            ./ffuf -w /home/ec2-user/tools/web-discovery/Common_PHP_Filenames.txt -u $Target -c 
            ;;
        "raft-large-files")
          cd ~/go/bin
            ./ffuf -w /home/ec2-user/tools/web-discovery/raft-large-files.txt -u $Target -c 
            ;;
        "Apache")
          cd ~/go/bin
            ./ffuf -w /home/ec2-user/tools/web-discovery/Apache.txt -u $Target -c 
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done