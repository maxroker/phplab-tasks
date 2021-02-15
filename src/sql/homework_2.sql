SELECT DISTINCT address, last_name AS 'Distinct families'
FROM guests; 

SELECT tour_name AS 'Tour with start date in first half of July', last_name, first_name
FROM tours
RIGHT JOIN bookings
ON tours.id = bookings.tour_id
JOIN guests
ON bookings.guest_id = guests.id
WHERE start_date BETWEEN '2021-07-01' AND '2021-07-14';

SELECT tour_name AS 'Expencive or long tours', last_name, first_name
FROM tours
JOIN bookings
ON tours.id = bookings.tour_id
JOIN guests
ON bookings.guest_id = guests.id
WHERE price > 5000 OR duration > 10;

SELECT tour_name, last_name, first_name
FROM tours
JOIN bookings
ON tours.id = bookings.tour_id
JOIN guests
ON bookings.guest_id = guests.id
WHERE last_name LIKE "Green";

SELECT count(bookings.id) AS 'Total tours sold', sum(price) AS 'Total revenue, usd'
FROM tours
JOIN bookings
ON tours.id = bookings.tour_id
JOIN guests
ON bookings.guest_id = guests.id;

SELECT location, tour_name
FROM (
	SELECT *
    FROM destinations
	WHERE location LIKE "Italy%"
    ) italian_destinations
LEFT JOIN tour_destinations
ON italian_destinations.id = tour_destinations.destination_id
JOIN tours
ON tours.id = tour_destinations.tour_id
ORDER BY 2 DESC;

SELECT location, tour_name
FROM destinations
JOIN tour_destinations
ON destinations.id = tour_destinations.destination_id
JOIN tours
ON tours.id = tour_destinations.tour_id
WHERE tour_name LIKE "Around Europe"
ORDER BY 1;

SELECT location, tour_name AS 'Tours booked by Collins family'
FROM destinations
JOIN tour_destinations
ON destinations.id = tour_destinations.destination_id
JOIN tours
ON tours.id = tour_destinations.tour_id
JOIN bookings
ON tours.id = bookings.tour_id
JOIN guests
ON bookings.guest_id = guests.id
WHERE last_name LIKE "Colins"
GROUP BY 1;

SELECT tour_name AS 'Tour name', count(bookings.id) AS 'Number of bookings by tour', sum(price) AS 'Revenue by tour'
FROM tours
JOIN bookings
ON tours.id = bookings.tour_id 
GROUP BY 1
HAVING sum(price) > 15000
ORDER BY 3 DESC;

SELECT last_name, first_name
FROM tours
JOIN bookings
ON tours.id = bookings.tour_id
JOIN guests
ON bookings.guest_id = guests.id
WHERE tour_name LIKE 'Around Europe'
UNION
SELECT last_name, first_name 
FROM guides
JOIN tours
ON tours.guide_id = guides.id
WHERE tour_name LIKE 'Around Europe'; 