#### Volume

- /var/www
- /etc/nginx/conf.d

#### Creating an instance:

    docker run -d --name nginx -p 8080:80 -p 8443:443  registercn/nginx

#### Compose example:

    nginx:
        image: registercn/nginx
        ports:
            - "8080:80"
            - "8443:443"
        volumes:
            - ./path/www:/var/www
            - ./path/www.conf:/etc/nginx/conf.d/www.conf:ro
        restart: always

#### Nginx + PHP-FPM

##### Compose:

    version: '2'

    services:
        nginx:
            container_name: nginx
            image: registercn/nginx
            ports:
                - "8080:80"
            volumes:
                - ./localhost:/var/www
                - ./nginx/default.conf:/etc/nginx/conf.d/default.conf:ro
            links:
                - phpfpm
            restart: always
        phpfpm:
            container_name: phpfpm
            image: registercn/php:latest
            volumes:
                - ./localhost:/var/www
            restart: always
        mariadb:
            container_name: mariadb
            image: registercn/mariadb
            volumes:
                - ./data:/var/lib/mysql
            environment:
                - MYSQL_ROOT_PASSWORD=123456
            restart: always

##### Nginx conf

    server {
    ...

        location ~ \.php$ {
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            fastcgi_pass   phpfpm:9000;
            fastcgi_index  index.php;
            fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include        fastcgi_params;
        }

    ...
    }
