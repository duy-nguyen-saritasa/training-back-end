#!/usr/bin/with-contenv bash

source /root/.bashrc
echo -e "${BLUE}--- Caching Laravel configuration ---${NC}"

### Update config and routes cache
php artisan config:cache
php artisan route:cache
php artisan api:cache
