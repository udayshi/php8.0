1. log inside container
docker exec -it php8_php8_1 bash

composer require monolog --with-all-dependencies
composer require annotations
composer require profiler  --dev
