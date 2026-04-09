CREATE Database Zomato;
USE Zomato;
show tables;
select * from zomato_data;
SHOW COLUMNS FROM zomato_data;

-- 1. Total Restaurants
SELECT COUNT(*) AS total_restaurants
FROM zomato_data;

-- 2. Total Cuisines
SELECT COUNT(DISTINCT Cuisines) AS total_cuisines
FROM zomato_data;

-- 3. Total Votes
SELECT 
    CONCAT(ROUND(SUM(Votes) / 1000, 2), 'K') AS total_votes_k
FROM zomato_data;

-- 4. Total Cities
SELECT COUNT(DISTINCT City) AS total_cities
FROM zomato_data;

-- 5. Total Localities
SELECT COUNT(DISTINCT Locality) AS total_localities
FROM zomato_data;

-- 6. Average Cost by Cuisine
SELECT 
    Cuisines,
    CONCAT(ROUND(AVG(Average_Cost_for_two) / 1000, 0), 'K') AS avg_cost_k
FROM zomato_data
GROUP BY Cuisines
ORDER BY AVG(Average_Cost_for_two) DESC;

-- 7. Count of Restaurants by Rating
SELECT Rating,
       COUNT(*) AS restaurant_count
FROM zomato_data
GROUP BY Rating
ORDER BY Rating;

-- 8. Count of Restaurants by City
SELECT City,
       COUNT(*) AS restaurant_count
FROM zomato_data
GROUP BY City
ORDER BY restaurant_count DESC;

-- 9. Top 10 Cuisines by Restaurant Count
SELECT Cuisines,
       COUNT(*) AS restaurant_count
FROM zomato_data
GROUP BY Cuisines
ORDER BY restaurant_count DESC
LIMIT 10;

-- 10. Restaurants Opening Over the Years
SELECT SUBSTRING(Datekey_Opening, 1, 4) AS Opening_Year,
       COUNT(*) AS restaurant_count
FROM zomato_data
GROUP BY Opening_Year
ORDER BY Opening_Year;

-- 11. Online Delivery vs No Delivery
SELECT Has_Online_delivery,
       COUNT(*) AS count_restaurants
FROM zomato_data
GROUP BY Has_Online_delivery;

-- 12. Table Booking Availability
SELECT Has_Table_booking,
       COUNT(*) AS count_restaurants
FROM zomato_data
GROUP BY Has_Table_booking;

-- 13. Restaurants by Price Range
SELECT Price_range,
       COUNT(*) AS restaurant_count
FROM zomato_data
GROUP BY Price_range
ORDER BY Price_range;

