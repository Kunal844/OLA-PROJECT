--1.Retrieve all successful bookings:
Create view Successful_Bookings as
Select * FROM "Bookings" 
Where Booking_Status='Success' LIMIT 5;


--2. Find the average ride distance for each vehicle type:
Create view Average_Ride_Distance as
Select vehicle_type,Round(AVG(ride_distance),2) as Average_Distance from "Bookings"
Group By vehicle_type;


--3. Get the total number of cancelled rides by customers:
Create view Canceled_Rides as
Select COUNT(*) as Canceled_Bookings from "Bookings"
where booking_status='Canceled by Customer';


--4. List the top 5 customers who booked the highest number of rides:
Create view HighestBooking as
Select Customer_id,COUNT(*)as Frequency from "Bookings"
Group by customer_id 
Order By Frequency Desc
Limit 5 ;


--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create view Canceled_Rides_Personal as
Select COUNT(*) from "Bookings"
where canceled_rides_by_driver='Personal & Car related issue';


--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create view Max_Min_Ratings as
Select max(driver_ratings)as Maximum_rating , 
min(driver_ratings) as Minimum_ratings
From "Bookings"
where vehicle_type='Prime Sedan';


--7. Retrieve all rides where payment was made using UPI:
Create view Upi_payments as
Select customer_id From "Bookings"
where payment_method='UPI';


--8. Find the average customer rating per vehicle type:
Create view Average_Cust_rating as
SELECT vehicle_type,
       AVG(CAST(customer_rating AS numeric)) AS Average_ratings
FROM "Bookings"
GROUP BY vehicle_type;


--9. Calculate the total booking value of rides completed successfully:
Create view Total_Booking as
Select sum(cast(booking_value as numeric))as Total_BookingVal from "Bookings"
where booking_status='Success';


--10. List all incomplete rides along with the reason:
Create view Incomplete_Rides as
Select customer_id,
incomplete_rides,
incomplete_rides_reason 
from "Bookings"
where incomplete_rides ='Yes';

--For Retrieval Of all Query.
--1.Retrieve all successful bookings:
Select * from Successful_Bookings;

--2. Find the average ride distance for each vehicle type:
Select * from Average_Ride_Distance;

--3. Get the total number of cancelled rides by customers:
Select * from Canceled_Rides;

--4. List the top 5 customers who booked the highest number of rides:
Select * from HighestBooking;

--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Select * from Canceled_Rides_Personal;

--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Select * from Max_Min_ratings;

--7. Retrieve all rides where payment was made using UPI:
Select * from Upi_payments;

--8. Find the average customer rating per vehicle type:
Select * from Average_Cust_Rating;

--9. Calculate the total booking value of rides completed successfully:
Select * from Total_Booking;

--10. List all incomplete rides along with the reason:
Select * from Incomplete_Rides;

