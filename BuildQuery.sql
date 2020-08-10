/* Dominic Hudson - 102983679 */

/* 
CLIENT (ClientID, Surname, GivenName, Gender)
    PK (ClientID)

TOUR (TourName, Description)
    PK (TourName)

EVENT (EventYear, EventMonth, EventDay, Fee, TourName)
    PK (EventYear, EventMonth, EventDay, TourName)
    FK (TourName) references TOUR

BOOKING (DateBooked, Payment, EventYear, EventMonth, EventDay, TourName, ClientID)
    PK (EventYear, EventMonth, EventDay, TourName, ClientID)
    FK (EventYear, EventMonth, EventDay) references EVENT
    FK (TourName) references TOUR
    FK (ClientID) references CLIENT
*/

/*
use BuildQuery;
*/

/* ------------------------------------------------------ Task 1

CREATE TABLE TOUR (
    TourName NVARCHAR(100),
    Description NVARCHAR(500),
    PRIMARY KEY (TourName)
);

CREATE TABLE CLIENT (
    ClientID INT,
    Surname NVARCHAR(100) NOT NULL,
    GivenName NVARCHAR(100) NOT NULL,
    Gender NVARCHAR(1) CHECK (Gender IN ('M', 'F', 'I')),
    PRIMARY KEY (ClientId)
)

CREATE TABLE EVENT (
    TourName NVARCHAR(100),
    EventMonth NVARCHAR(3) CHECK (EventMonth IN ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')),
    EventDay INT CHECK (EventDay >= 1 AND EventDay <= 31),
    EventYear INT CHECK ((EventYear) >= 4),
    EventFee Money NOT NULL CHECK ((EventFee) >= 0),
    PRIMARY KEY (EventMonth, EventDay, EventYear),
    FOREIGN KEY (TourName) REFERENCES TOUR
)

CREATE TABLE BOOKING ( 
    EventMonth NVARCHAR(3) CHECK (EventMonth IN ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')),
    EventDay INT CHECK (EventDay >= 1 AND EventDay <= 31),
    EventYear INT CHECK ((EventYear) >= 4),
    ClientID INT,
    TourName NVARCHAR(100),
    Payment MONEY CHECK ((Payment) > 0),
    DateBooked DATE NOT NULL,
    PRIMARY KEY (ClientID, TourName, EventMonth, EventDay, EventYear),
    FOREIGN KEY (TourName) REFERENCES TOUR,
    FOREIGN KEY (ClientID) REFERENCES CLIENT,
    FOREIGN KEY (EventMonth, EventDay, EventYear) REFERENCES EVENT
)

*/

/* ----------------------------------------------- Task 2

SELECT TourName, Description
FROM Tour;

SELECT ClientId, SurName, GivenName, Gender
FROM Client;

SELECT TourName, EventMonth, EventDay, EventYear, EventFee
FROM Event;

SELECT EventMonth, EventDay, EventYear, ClientID, TourName, Payment, DateBooked
FROM Booking;
*/

/* ------------------------------------------------ Task 3

INSERT INTO TOUR (TourName, Description) VALUES
('North', 'Tour of wineries and outlets of the Bedigo and Castlemaine region'),
('South', 'Tour of wineries and outlets of Mornington Penisulan'),
('West', 'Tour of wineries and outlets of the Geelong and Otways region');

INSERT INTO CLIENT (ClientId, SurName, GivenName, Gender) VALUES
(1, 'Price', 'Taylor', 'M'),
(2, 'Gamble', 'Ellyse', 'F'),
(3, 'Tan', 'Tilly', 'F'),
(102983679, 'Hudson', 'Dominic', 'M');

INSERT INTO EVENT (TourName, EventMonth, EventDay, EventYear, EventFee) VALUES
('North', 'Jan', 9, 2019, 200),
('North', 'Feb', 13, 2016, 225),
('South', 'Jan', 9, 2016, 200),
('South', 'Jan', 16, 2016, 200),
('West', 'Jan', 29, 2016, 225);

INSERT INTO BOOKING (EventMonth, EventDay, EventYear, ClientID, TourName, Payment, DateBooked) VALUES
('Jan', 9, 2016, 1, 'North', 200, '2015-12-10'),
('Jan', 9, 2016, 2, 'North', 200, '2015-12-16'),
('Feb', 13, 2016, 1, 'North', 225, '2016-01-08'),
('Feb', 13, 2016, 2, 'North', 125, '2016-01-14'),
('Feb', 13, 2016, 3, 'North', 225, '2016-02-03'),
('Jan', 9, 2016, 1, 'South', 200, '2015-12-10'),
('Jan', 16, 2016, 2, 'South', 200, '2015-12-18'),
('Jan', 16, 2016, 3, 'South', 200, '2016-01-09'),
('Jan', 29, 2016, 2, 'West', 225, '2015-12-17'),
('Jan', 29, 2016, 3, 'West', 200, '2015-12-18');

*/

/* ------------------------------------------ Task 4
*/

/* Query 1
SELECT c.GivenName, c.SurName, t.TourName, t.Description, e.EventYear, e.EventMonth, e.EventDay, e.EventFee, b.DateBooked, b.Payment
FROM Client c
INNER JOIN Booking b
ON c.ClientId = b.ClientId

INNER JOIN Event e
ON e.EventMonth = b.EventMonth

INNER JOIN Tour t
ON t.TourName = b.TourName
*/

/* Query 2

SELECT b.EventMonth, b.TourName, Count(*) "Num Bookings"
FROM Booking b
GROUP BY b.EventMonth, b.TourName
Order By EventMonth DESC

*/

/* Query 3

Select ClientID, TourName, Payment
FROM BOOKING
WHERE Payment > (Select AVG (Payment) FROM BOOKING)

*/

/* ------------------------------------------ Task 4

CREATE VIEW TASK5 AS

SELECT c.GivenName, c.SurName, t.TourName, t.Description, e.EventYear, e.EventMonth, e.EventDay, e.EventFee, b.DateBooked, b.Payment
FROM Client c
INNER JOIN Booking b
ON c.ClientId = b.ClientId

INNER JOIN Event e
ON e.EventMonth = b.EventMonth

INNER JOIN Tour t
ON t.TourName = b.TourName

*/

/* --------------------------------------------------- Task 6 
 
Select *
FROM Task5

The query above produces 31 rows with details of first and last name, 
Tour name and description 
Event year, month, day 
Event fee, datebooked and payment 

Select Count(*) 
FROM Task5 

This query displays a single row displaying a value of 31. This proves that all the rows 
with the mentioned columns are being collected and counted 

--------------------

Select *
FROM Tour

Select Count(*) 
FROM Tour

This query displays all 3 tour names and their matching description. Count (*) produces
a value of 3 (the number of tours available)

-------------------

Select *
FROM Client
WHERE ClientId <=3

Select * shows the 3 clients input from the excel spreadsheet plus 
myself. Resulting in 4 rows with values. Adding the WHERE ClientId <=3 excludes
me from the selection and only shows the original 3 clients because my student number
does not meet the conditions of the WHERE clause

---------------

Select *
FROM Event
WHERE EventFee = 225

This query only asks for the events with a fee of 225. This should only
return the North tour on Feb 13 2016 and the West tour Jan 29 2016
because the other 3 tours have an EventFee of 200 

--------------------


Select *
FROM Booking b
INNER JOIN TOUR t
ON b.TourName = t.Tourname
WHERE DateBooked = '2015-12-10'

This query only calls for tours that were booked on 2015-12-10. Looking at the excel sheet
This should only return 2 bookings by Taylor Price. And this query only returns 2 bookings. These are the
North and South tours and both are held on Jan 9 2016. Ellyse Gamble has also booked for the North
tour on Jan 9 2016 but was not displayed in the results because she did not book on 2015-12-10
like the WHERE clause called for, proving this query works

*/
