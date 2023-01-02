# Flight Booking System Database Design

This project involves the design of a database for a flight booking system. The database will store information about flights, flight classes, airports, airlines, passengers, and tickets.

The database will be designed using MySQL which is an open-source relational database management system and will follow the relational model.

## Entities and Attributes
The following entities and attributes are included in the database:

### Flights

* flight_id INT (Primary Key)
* number VARCHAR(50)
* take_off_date_time DATETIME
* landing_date_time DATETIME
* journey_time TIME
* journey_distance INT
* departure_airport_id INT
* arrival_airport_id INT
* airline_id INT (Foreign Key)
* airport_id INT (Foreign Key)

### Passengers

* passenger_id INT (Primary Key)
* first_name VARCHAR(50)
* last_name VARCHAR(50)

### Tickets

* ticket_id INT (Primary Key)
* ticket_number VARCHAR(50)
* price DECIMAL(4,2)
* confirmation_number VARCHAR(50)
* passenger_id INT (Foreign Key)
* flight_id INT (Foreign Key)
* flight_classes_class_id INT (Foreign Key)

### Airports

* Airport_id INT (Primary Key)
* city VARCHAR(50)
* state VARCHAR(50)
* name VARCHAR(50)
* IATA_code VARCHAR(50)

### Flight_classes

* class_id INT (Primary Key)
* type VARCHAR(45)

### Airline

* airline_id INT (Primary Key)
* name VARCHAR(50)

### Passengers_has_flights

* passenger_id INT (Primary Key) (Foreign Key)
* flight_id INT (Primary Key) (Foreign Key)


## Relationships

The following relationships exist in the database:

* A flight is associated with a single departure airport and a single arrival airport.
* An airport can have multiple flights departing from and arriving at it.
* A flight is operated by a single airline.
* An airline can operate multiple flights.
* A flight uses a single plane.
* A flight can have multiple classes.
* A plane can be used for multiple flights.
* A ticker is made by a single passenger.
* A passenger can make multiple tickets.
* A ticket is for a single flight.
* A flight can have multiple tickets.


