#!/bin/bash
cd /home/container || exit 1

# Configure colors
LBLUE='\033[38;5;39m'
ORANGE='\033[38;5;214m'
RED='\033[38;5;196m'
GREEN='\033[38;5;46m'
RESET_COLOR='\033[0m'

# Print Current Java Version
java -version

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
# shellcheck disable=SC2086
MODIFIED_STARTUP=$(echo -e "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e "STARTUP /home/container: ${MODIFIED_STARTUP}"

# Run the Server
# shellcheck disable=SC2086
cat << 'EOF'
    ____       _                _   __          __
   / __ \_____(_)________ ___  / | / /___  ____/ /__  _____
  / /_/ / ___/ / ___/ __ `__ \/  |/ / __ \/ __  / _ \/ ___/
 / ____/ /  / (__  ) / / / / / /|  / /_/ / /_/ /  __(__  )
/_/   /_/  /_/____/_/ /_/ /_/_/ |_/\____/\____/\___/____/
EOF
echo -e "========================================================================================================"
echo -e "${LBLUE}Thankyou for choosing PrismNodes! Need help? Reach us on Discord: discord.gg/prismnodes ${RESET_COLOR}"
echo -e "========================================================================================================"
echo -e "${GREEN} booting up your server"
eval "${MODIFIED_STARTUP}"
echo -e "${RED}Your server is now off${RESET_COLOR}"
