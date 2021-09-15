1. log inside container
docker exec -it php8_php8_1 bash

composer require monolog --with-all-dependencies
composer require annotations
composer require profiler  --dev



### PHP 7.4.3
This php 7.4.3  build is based upon udaysh/alpine3.11.3-php7.4.3. 

  
Build github url is https://github.com/udayshi/docker/tree/master/php7.4



### Configure X-Debug on PHPStorm
#### Preference -> PHP -> Servers
    1. + (ADD)
	   Name: Give the project Name
	   
	   Host: alpine3.docker
	   

    2. Check Use path mappings
       
       Select the path of source where it mounted
       host_dir:/container_dir
       www:/app/public

#### Run -> Edit Configuration
    1. + (ADD) PHP Remote Debug
	    
	    Name: Give Debugger Name (Project Name Debug)
	   
	    Server: Select project which we have just created
	    
	    Idk key(session id): docker (if you change on x-debug.ini change it.
	    
	    
	    
#Composer Prod Build
composer install --no-dev --no-scripts --optimize-autoloader	    
	    