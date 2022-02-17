-- 3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?
select case 
when gender = 'F' then 'Female'
when gender = 'M' then 'Male' 
end as Gender,count(gender) from `passenger` 
where distance >= 600 group by gender;

-- 4) Find the minimum ticket price for Sleeper Bus. 
select bus_type,price as min_price from `price`
where bus_type='Sleeper' order by price asc limit 0,1;

-- 5) Select passenger names whose names start with character 'S' 
select passenger_name from passenger
where passenger_name like 'S%';

-- 6) Calculate price charged for each passenger displaying Passenger name, Boarding City, 
-- Destination City, Bus_Type, Price in the output
select passenger_name ,boarding_city, destination_city, passenger.bus_type,price.price from passenger
inner join price
on ((price.bus_type=passenger.bus_type) and (price.distance=passenger.distance));

-- 7) What are the passenger name/s and his/her ticket price who travelled in the Sitting bus 
-- for a distance of 1000 KM s 
select passenger_name ,price.price as ticket_price from passenger
inner join price
on ((price.bus_type=passenger.bus_type) and (price.distance=passenger.distance))
where passenger.bus_type='Sitting' and passenger.distance=1000;

-- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to 
-- Panaji?
select p1.passenger_name, bus_type ,price.price as ticket_price from price
inner join 
(select passenger_name,distance from passenger
where (passenger_name = 'Pallavi' and (boarding_city='Bengaluru' and destination_city='Panaji') or 
((boarding_city='Panaji' and destination_city='Bengaluru')))) as p1
on (p1.distance=price.distance) ;

-- 9) List the distances from the "Passenger" table which are unique (non-repeated 
-- distances) in descending order.
select distinct(distance) from passenger order by distance desc;

-- 10) Display the passenger name and percentage of distance travelled by that passenger 
-- from the total distance travelled by all passengers without using user variables 
select passenger_name, ((distance/sumOfDistance) * 100) as percentage_travelled  from passenger 
inner join
(select sum(distance) as sumOfDistance from passenger) as s;

-- 11) Display the distance, price in three categories in table Price
-- a) Expensive if the cost is more than 1000
-- b) Average Cost if the cost is less than 1000 and greater than 500
-- c) Cheap otherwise
select distance, price, 
case when price>1000 then 'Expensive'
when  (price<=1000) and (price>500) then 'Average'  
else 'Cheap' end as category from price;