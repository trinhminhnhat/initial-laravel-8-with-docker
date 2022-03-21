## Docker Environment
Use Docker Compose version 3.8
* nginx 1.20.1
* php 7.4
* mysql 5.7
* phpmyadmin latest
* redis latest

## Run Project
1. CD source code and run command line below
```php
docker-compose up -d
```

```php
docker-compose run php composer install
```
```php
docker-compose run php cp .env.example .env
```
```php
docker-compose run php php artisan key:generate
```
2. in .env file
Edit config to connect to Database
```php
DB_CONNECTION=mysql 
DB_HOST=mysql 
DB_PORT=3306
DB_DATABASE=laravel       
DB_USERNAME=root
DB_PASSWORD=root
```
3. Go to localhost:8000 and see the result
## Author
[**Trịnh Minh Nhật**](https://github.com/trinhminhnhat)
