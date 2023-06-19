# add all the commands that you need to run in the deployment
php artisan cache:clear
php artisan migrate --force
apache2-foreground
