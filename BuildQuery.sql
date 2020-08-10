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
*/
/*
INSERT INTO TOUR (TourName, Description) VALUES
('North', 'Tour of wineries and outlets of the Bedigo and Castlemaine region'),
('South', 'Tour of wineries and outlets of Mornington Penisulan'),
('West', 'Tour of wineries and outlets of the Geelong and Otways region');
*/


/*
INSERT INTO CLIENT (ClientId, SurName, GivenName, Gender) VALUES
(1, 'Price', 'Taylor', 'M'),
(2, 'Gamble', 'Ellyse', 'F'),
(3, 'Tan', 'Tilly', 'F'),
(102983679, 'Hudson', 'Dominic', 'M');
*/


/*
INSERT INTO EVENT (TourName, EventMonth, EventDay, EventYear, EventFee) VALUES
('North', 'Jan', 9, 2019, 200),
('North', 'Feb', 13, 2016, 225),
('South', 'Jan', 9, 2016, 200),
('South', 'Jan', 16, 2016, 200),
('West', 'Jan', 29, 2016, 225);
*/


/*
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
