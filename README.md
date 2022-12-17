# java-db-docker-compose
java-db-docker-compose

Итак есть Java приложение с БД. 

https://github.com/shephertz/App42PaaS-Java-MySQL-Sample

Необходимо развернуть его с помощью docker-compose.

1ый докерфайл выкачивает из гита проект и делает сборку 

2ой докерфайл деплоит артефакт в томкате

1. Докерфайлы и докер-компоуз файл выкачать из репо:

git clone https://github.com/summerinstockholm/java-db-docker-compose

2. Перейти в папку с проектом и засетать пароль для рута БД и самой БД.

cd java-db-docker-compose

export ROOT_ACCESS_PASSWORD=<рутовый пароль>

export DATABASE_PASSWORD=<пароль для БД>

3. Запустить проект:

docker-compose up -d