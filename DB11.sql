CREATE DATABASE `web-project-g11`;
drop table `web-project-g11`.user;
drop table `web-project-g11`.store;
drop table `web-project-g11`.item;
drop table `web-project-g11`.userFavorites;

create table `web-project-g11`.store
(
    store_id int not null primary key,
	about varchar(500) null
);

INSERT INTO `web-project-g11`.store (store_id, about) VALUES (1, 'Hi! My name is Brenda, welcome to my store');
INSERT INTO `web-project-g11`.store (store_id, about) VALUES (2, 'Hellooooo! My name is Tom, welcome to you all!');
INSERT INTO `web-project-g11`.store (store_id, about) VALUES (3, 'Hey everyone! Come check my pieces out');
INSERT INTO `web-project-g11`.store (store_id, about) VALUES (4, 'Hey guys!!! Hope you will find something you love :)');

create table `web-project-g11`.user
(
    user_id int not null primary key,
	firstName varchar(500) not null,
    lastName varchar(500) not null,
    email varchar(500) not null,
    pass varchar(500) not null
);

INSERT INTO `web-project-g11`.user (user_id, firstName, lastName, email, pass) VALUES (1, 'Brenda', 'Mills', 'Brenda@gmail.com', '123456');
INSERT INTO `web-project-g11`.user (user_id, firstName, lastName, email, pass) VALUES (2, 'Tom', 'Yanai', 'Tom@gmail.com', '222333');
INSERT INTO `web-project-g11`.user (user_id, firstName, lastName, email, pass) VALUES (3, 'Danit', 'Kiks', 'D@gmail.com', '11A5C');
INSERT INTO `web-project-g11`.user (user_id, firstName, lastName, email, pass) VALUES (4, 'Shay', 'Piram', 'ShayP@gmail.com', 'qweasd');

create table `web-project-g11`.item
(
    item_id int not null primary key,
	name varchar(500) not null,
    style varchar(500) not null,
    price int not null,
    photo longblob not null
);

INSERT INTO `web-project-g11`.item (item_id, name, style, price, photo) VALUES (1, 'Heart neckless', 'Accessories', 50, load_file('C:\Users\shayp\Desktop\web-project-g11\web-project-g11\image\jul4.jpeg'));
INSERT INTO `web-project-g11`.item (item_id, name, style, price, photo, store_id) VALUES (2, 'Colorful fly neckless', 'Accessories', 20, ???, 1);
INSERT INTO `web-project-g11`.item (item_id, name, style, price, photo, store_id) VALUES (3, 'Two circles neckless', 'Accessories', 35, ???, 1);
INSERT INTO `web-project-g11`.item (item_id, name, style, price, photo, store_id) VALUES (4, 'Butterfly neckless', 'Accessories', 45, ???, 1);

create table `web-project-g11`.userFavorites
(
    favorite_id int not null primary key,
	about varchar(500) null
);