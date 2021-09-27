CREATE DATABASE `web-project-g11`;
drop table `web-project-g11`.user;
drop table `web-project-g11`.store;
drop table `web-project-g11`.item;
drop table `web-project-g11`.userFavorites;
drop table `web-project-g11`.community;
drop table `web-project-g11`.myCommunity;
drop table `web-project-g11`.contactUs;

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

create table `web-project-g11`.community
(
	communityName varchar(500) not null primary key,
	introduction varchar(500) not null,
	stylePhoto binary not null,
	user_id int not null
    CONSTRAINT FK_user_id 
        FOREIGN KEY (user_id) 
        REFERENCES `web-project-g11`.user(user_id)
);

INSERT INTO `web-project-g11`.community (communityName, introduction, stylePhoto, user_id) VALUES ('Boho', 'Welcome to the boho community - where only chic is aloud !', 1, 1);
INSERT INTO `web-project-g11`.community (communityName, introduction, stylePhoto, user_id) VALUES ('Denim', 'This is the denim community - jeans are always in style', 1, 2);
INSERT INTO `web-project-g11`.community (communityName, introduction, stylePhoto, user_id) VALUES ('Black', 'Back to black', 1, 3);
INSERT INTO `web-project-g11`.community (communityName, introduction, stylePhoto, user_id) VALUES ('Casual', 'Casual community - you are better when you are comfortable', 1, 4);

create table `web-project-g11`.myCommunity
(
	comment varchar(500) not null,
	--the person who owns the page
	user_id int not null
    CONSTRAINT FK_user_id2 
        FOREIGN KEY (user_id) 
        REFERENCES `web-project-g11`.user(user_id),
	--myCommunities
	communityName varchar(500) not null
    CONSTRAINT FK_communityName 
        FOREIGN KEY (communityName) 
        REFERENCES `web-project-g11`.community(communityName),
	--suggestedCommunities
	suggestedCommunityName varchar(500) not null
    CONSTRAINT FK_suggestedCommunityName 
        FOREIGN KEY (suggestedCommunityName) 
        REFERENCES `web-project-g11`.community(communityName), 
);

--INSERT INTO `web-project-g11`.myCommunity (user_id, communityName, comment, suggestedcommunityName) VALUES (1, 'Boho', 'OMG this is amazing', 'Goth');
--INSERT INTO `web-project-g11`.myCommunity (user_id, communityName, comment, suggestedcommunityName) VALUES (2, 'Denim', 'i love this style ! show me more !', 'Occasion');
--INSERT INTO `web-project-g11`.myCommunity (user_id, communityName, comment, suggestedcommunityName) VALUES (3, 'Black', 'great sense of fashion !', 'Glitter');
--INSERT INTO `web-project-g11`.myCommunity (user_id, communityName, comment, suggestedcommunityName) VALUES (4, 'Casual', 'you are awesome !', 'Boyfriend');

create table `web-project-g11`.contactUs
(
	phoneNumber int not null primary key,
	fullName varchar(500) not null,
	email varchar(500) not null,
	"description" varchar(500) not null,
	constraint CHK_email CHECK (email like '%@%')
);

INSERT INTO `web-project-g11`.contactUs (phoneNumber, fullName, email, description) VALUES (0543789546, 'Kylie Jenner', 'kylie123@gmail.com', 'i love this website ! i found so many new things');
INSERT INTO `web-project-g11`.contactUs (phoneNumber, fullName, email, description) VALUES (0549877806, 'Danit Greenberg', 'danitush@gmail.com', 'thank you for the initiative website');
INSERT INTO `web-project-g11`.contactUs (phoneNumber, fullName, email, description) VALUES (0522433546, 'Yarden Harel', 'jordih@gmail.com', 'hi, i bought a neckless and it did not arrive yet');
INSERT INTO `web-project-g11`.contactUs (phoneNumber, fullName, email, description) VALUES (0509887685, 'Kim Kardashian', 'kimberlyqueen@gmail.com', 'can you help me find something specific ?');
