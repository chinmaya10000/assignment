#!/bin/bash

# Variables
REPO_URL="https://github.com/chinmaya10000/Django-todo-app.git"
LOCAL_DIR="/var/www/html/myapp"
NGINX_SERVICE="nginx"


# Clone the repository
if [[ -d "$LOCAL_DIR" ]] 
then
    cd "$LOCAL_DIR"
    git pull origin main
else
    git clone "$REPO_URL" "$LOCAL_DIR"
fi

# Restart NGINX to apply changes
sudo systemctl restart $NGINX_SERVICE

echo "Deployment completed successfully."
