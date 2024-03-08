select * from assembly;
select * from duration;
select * from payment;
select * from trip;
select * from tripdetails;

-- Total trips

select count(distinct tripid) from tripdetails;

select tripid, count(tripid) from tripdetails group by tripid having count(tripid)>1;

-- Total drivers

select count(distinct driverid) from trip;

select count(distinct driverid) from trips;

-- total earnings

select sum(fare) from trip;

-- total Completed trips

select * from trips_details;
select sum(end_ride) from tripdetails;

-- total searches

select sum(searches),sum(searches_got_estimate),sum(searches_for_quotes),sum(searches_got_quotes),
sum(customer_not_cancelled),sum(driver_not_cancelled),sum(otp_entered),sum(end_ride)
from tripdetails;




-- total searches which got estimate


-- total searches for quotes


-- total searches which got quotes


select * from trips;


select * from trips_details;


-- total driver cancelled
select sum(searches) - sum(driver_not_cancelled) from tripdetails;


-- total otp entered
select sum(otp_entered) from tripdetails;

-- total end ride
select sum(end_ride) from tripdetails;


-- cancelled bookings by driver


-- cancelled bookings by customer


-- average distance per trip
select avg(distance) from trip;



-- average fare per trip

select sum(fare)/count(*) from trips;

-- distance travelled
select sum(distance) from trip;




-- which is the most used payment method 
select a.method from payment a inner join

(select  faremethod, count(distinct tripid) from trip group by faremethod
order by count(distinct tripid) desc) b
on a.id=b.faremethod;

-- the highest payment was made through which instrument
select max(fare) from trip;
select * from trip where fare=1500;

-- which two locations had the most trips
select loc_from,loc_to,count(tripid) from trip group by loc_from,loc_to order by count(tripid) desc;

-- top 5 earning drivers
select driverid, sum(fare) from trip group by driverid order by sum(fare) desc;

-- which duration had more trips
select count(tripid), duration from trip group by duration order by count(tripid) desc;

-- which driver , customer pair had more orders
select driverid,custid,count(distinct tripid) from trip group by driverid,custid order by count(distinct tripid) desc;

-- search to estimate rate
select * from tripdetails;
select (sum(searches_got_estimate)/sum(searches))*100 from tripdetails;


-- estimate to search for quote rates


-- quote acceptance rate


-- quote to booking rate


-- booking cancellation rate


-- conversion rate


-- which area got highest trips in which duration
select count(distinct tripid),loc_from,duration from trip group by duration, loc_from order by count(distinct tripid) desc;

-- which area got the highest fares, cancellations,trips,
select loc_from, sum(fare) from trip group by loc_from order by sum(fare) desc;
select loc_from, count(driver_not_cancelled) from tripdetails group by loc_from order by count(driver_not_cancelled) desc;

-- which duration got the highest trips and fares
select * from trip;
select duration,count(tripid), sum(fare) from trip group by duration order by count(tripid) desc;


Conversion_rate = calculate(sum(Merge2[end_ride])/sum(Merge2[searches]))

NOTEPAD 

https://drive.google.com/file/d/1neULQCoX1RKrx2NjK17K-UlaVShy7iP3/view?usp=sharing

EXCEL 

https://docs.google.com/spreadsheets/d/1CyKysHxqhGxdL7OqDm4o6IafJjYrpeO0/edit?usp=sharing&ouid=106801636617927197619&rtpof=true&sd=true
