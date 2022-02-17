create database if not exists TravelOnTheGo;
use TravelOnTheGo;

drop table if exists passenger;
create table `passenger`(
passenger_id int primary key,
passenger_name varchar(50),
category varchar(10),
gender varchar(10),
boarding_city varchar(20),
destination_city varchar(20),
distance int,
bus_type varchar(10)
);

drop table if exists price;
create table price(
bus_type varchar(10),
distance int,
price int
);