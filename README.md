



# PHP 8.0.1


## Configure required pluggins on PHPStorm
```
PhpStrom -> Preferences -> Pluggins
Search : Symfony
Install Following Pluggins:
1. Symfony Support
2. Php Toolbox
2. Php Annotation
```

### Configure X-Debug on PHPStorm
```
Preference -> PHP -> Servers
    1. + (ADD)
	   Name: Give the project Name
	   
	   Host: alpine3.docker
	   

    2. Check Use path mappings
       
       Select the path of source where it mounted
       host_dir:/container_dir
       www:/app/public
```


#### Adding PHP Remote Debug
```
Run -> Edit Configuration
    1. + (ADD) PHP Remote Debug
	    
	    Name: Give Debugger Name (Project Name Debug)
	   
	    Server: Select project which we have just created
	    
	    Idk key(session id): docker (if you change on x-debug.ini change it.
```   
	    

#Install package using flex
```
composer require annotation
composer require twig
composer require monolog  #Logger
composer require debug --dev
composer require profiler --dev
composer require maker --dev
composer require phpunit --dev
composer require doctrine
composer require sec-checker
composer require security-bundle
composer require --dev orm-fixtures

composer require form validator

composer update
```

#Setting PHPunit
```
composer require phpunit --dev
bin/phpunit

cd /usr/local/bin && ln -sf /app/bin/phpunit phpunit
```


#Set the session path and make sure its writeable

```
#config/packages/framework.yaml
framework:
    session:
        handler_id: session.handler.native_file
        save_path: '%kernel.project_dir%/var/sessions/%kernel.environment%'

```

#Unpack Pack
```
composer unpack debug
```


#Install encore (Install node and yarn)
```
composer require encore --dev
yarn install
#yarn add @symfony/webpack-encore --dev

 yarn add bootstrap@4.*
 yarn add holderjs
 yarn add popper.js
 yarn add jquery@3.*
 yarn add webpack-notifier@^1.6.0 --dev
```


#Installing production package only
```
 composer install --no-dev --optimize-autoloader

 bin/console cache:warmup --env=prod --no-debug
```


#Doctrine Commands

```
 #Database
 bin/console doctrine:database:create
 bin/console doctrine:database:drop --force

#Update entity
 bin/console make:entity
 bin/console doctrine:schema:update --force

 #Adding fixture
 
 bin/console make:fixtures
 bin/console  doctrine:fixtures:load

```

	    
