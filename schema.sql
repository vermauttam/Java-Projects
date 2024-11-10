create database userfriendlydb;

use userfriendlydb;

create table Users (
    id int auto_increment primary key,
    uname varchar(100) not null,
    email varchar(50) not null unique,
    country varchar(50) not null,
    passwd varchar(20) not null
);


