drop database if exists service_db;

create database service_db;

create user 'django'@'localhost' identified by 'ognajd';

grant all privileges on service_db.* to 'django'@'localhost' with grant option;

flush privileges;