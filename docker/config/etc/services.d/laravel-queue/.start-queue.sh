#!/usr/bin/with-contenv bash

cd /home/www/app
php artisan queue:work --sleep=2 --tries=3 --daemon --queue=training-backend-queue-${APP_ENV}
