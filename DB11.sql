CREATE DATABASE `web-project-g11`;
drop table `web-project-g11`.user;
drop table `web-project-g11`.store;
drop table `web-project-g11`.item;
drop table `web-project-g11`.userFavorites;

create table `web-project-g11`.store
(
    store_id int NOT NULL AUTO_INCREMENT primary key,
	about varchar(500) null
);

create table `web-project-g11`.user
(
    email varchar(500) NOT NULL primary key,
	firstName varchar(500) not null,
    lastName varchar(500) not null,
    pass varchar(500) not null
);

create table `web-project-g11`.item
(
    item_id int NOT NULL AUTO_INCREMENT primary key,
	name varchar(500) not null,
    style varchar(500) not null,
    price int not null,
    size varchar(500) not null,
    brand varchar(500) not null,
    photo longblob not null
);

create table `web-project-g11`.userFavorites
(
    favorite_id int NOT NULL AUTO_INCREMENT primary key,
	about varchar(500) null
);

create table `web-project-g11`.shoppingbag
(
    shoppingbag_id int NOT NULL AUTO_INCREMENT primary key,
	about varchar(500) null
);