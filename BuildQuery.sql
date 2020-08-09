/* Dominic Hudson - 102983679 */

use database BuildQuery;

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