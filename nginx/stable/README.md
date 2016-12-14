![](https://img.shields.io/docker/stars/gists/nginx.svg) ![](https://img.shields.io/docker/pulls/gists/nginx.svg) ![](https://img.shields.io/badge/Alpine-3.4-brightgreen.svg)

- ![](https://img.shields.io/badge/NGINX-1.11.7-brightgreen.svg) latest, 1.11.7, mainline ([nginx/basic/Dockerfile](https://github.com/iHavee/dockerfiles/blob/master/nginx/basic/Dockerfile))
- ![](https://img.shields.io/badge/NGINX-1.10.1-brightgreen.svg) stable, 1.10.2 ([nginx/stable/Dockerfile](https://github.com/iHavee/dockerfiles/blob/master/nginx/stable/Dockerfile))


##### the difference

- stable: version 1.10.2, without dynamic module, lightweight
- mainline: version 1.11.7, with useful dynamic module

#### Contain dynamic modules

- ndk_http_module.so
- ngx_http_echo_module.so
- ngx_http_fancyindex_module.so
- ngx_http_geoip_module.so
- ngx_http_headers_more_filter_module.so
- ngx_http_image_filter_module.so
- ngx_http_js_module.so
- ngx_http_lua_module.so
- ngx_http_perl_module.so
- ngx_http_uploadprogress_module.so
- ngx_http_xslt_filter_module.so
- ngx_mail_module.so
- ngx_rtmp_module.so
- ngx_stream_module.so

#### Environment:

| Environment | Variable | Default value |
|-------------|----------|---------------|
| UID         | user id  | 100           |
| GID         | group id | 101           |

#### Volume

- /var/www
- /etc/nginx/conf.d

#### Custom usage:

    docker run \
        -d \
        --name nginx \
        -p 80:80 \
        gists/nginx

#### Compose example:

    nginx:
        image: gists/nginx
        ports:
            - "8080:80"
            - "8443:443"
        volumes:
            - ./path/www:/var/www
            - ./path/conf.d:/etc/nginx/conf.d:ro
        restart: always

#### Nginx + PHP-FPM

##### Compose:

    version: '2'

    services:
        nginx:
            container_name: nginx
            image: gists/nginx
            ports:
                - "8080:80"
            volumes:
                - ./localhost:/var/www
                - ./nginx/conf.d:/etc/nginx/conf.d:ro
            links:
                - phpfpm
            restart: always
        phpfpm:
            container_name: phpfpm
            image: gists/php:latest
            volumes:
                - ./localhost:/var/www
            links:
                - mariadb
            restart: always
        mariadb:
            container_name: mariadb
            image: gists/mariadb
            volumes:
                - ./data:/var/lib/mysql
            restart: always

##### Nginx conf with php-fpm

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
