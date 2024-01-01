#!/bin/bash
# use keychain to pass ssh key when running by the cron job 
#because cron jobs are running on Non-Interactive Sessions

eval $(keychain --eval --agents ssh --quiet id_rsa)

cd /path/to/your/local/repo  # Replace with the path to your local repository opt/apps/myapp
git pull origin master

# --------- for error checking ---------
if git pull origin master; then
    echo "Git pull successful."
else
    echo "Error occurred during git pull."
fi