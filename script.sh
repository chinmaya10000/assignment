#!/bin/bash

# Variables
REPO_URL="https://github.com/chinmaya10000/Django-todo-app.git"
LOCAL_DIR="/var/www/html/myapp"
NGINX_SERVICE="nginx"

# Function to handle errors
error_exit() {
    echo "Error: $1"
    exit 1
}

# Clone the repository or update it
if [[ -d "${LOCAL_DIR}" ]] 
then
    cd "${LOCAL_DIR}" || error_exit "Failed to change directory to ${LOCAL_DIR}."
    git pull origin main || error_exit "Failed to pull the latest code from the repository."
else
    git clone "${REPO_URL}" "${LOCAL_DIR}" || error_exit "Failed to clone the repository."
fi

# Restart NGINX to apply changes
sudo systemctl restart ${NGINX_SERVICE} || error_exit "Failed to restart the NGINX service."

echo "Deployment completed successfully."
