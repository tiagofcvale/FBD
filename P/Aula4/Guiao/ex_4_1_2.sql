CREATE TABLE ReservasVoos_Flight (
    Number VARCHAR(16) NOT NULL PRIMARY KEY,
    Airline VARCHAR(64) NOT NULL,
    Weekdays VARCHAR(16) NOT NULL
);

CREATE TABLE ReservasVoos_Airport (
    Code VARCHAR(16) NOT NULL PRIMARY KEY,
    City VARCHAR(16) NOT NULL,
    [State] VARCHAR(32) NOT NULL
);

CREATE TABLE ReservasVoos_AirplaneType (
    TypeName VARCHAR(32) NOT NULL PRIMARY KEY,
    Company VARCHAR(32) NOT NULL,
    Max_seats INT NOT NULL
);

CREATE TABLE ReservasVoos_Airplane (
    Airplane_ID VARCHAR(16) NOT NULL PRIMARY KEY,
    Total_no_of_seats INT NOT NULL,
    Airplane_type_name VARCHAR(32) NOT NULL,
    FOREIGN KEY (Airplane_type_name)
        REFERENCES ReservasVoos_AirplaneType(TypeName)
);

CREATE TABLE ReservasVoos_FlightLeg (
    Leg_no VARCHAR(16) NOT NULL PRIMARY KEY,
    Flight_Number VARCHAR(16) NOT NULL,
    Departure_Airport VARCHAR(16) NOT NULL,
    Arrival_Airport VARCHAR(16) NOT NULL,
    Schedule_dep_time TIME NOT NULL,
    Schedule_arr_time TIME NOT NULL,
    FOREIGN KEY (Flight_Number) REFERENCES ReservasVoos_Flight(Number),
    FOREIGN KEY (Departure_Airport) REFERENCES ReservasVoos_Airport(Code),
    FOREIGN KEY (Arrival_Airport) REFERENCES ReservasVoos_Airport(Code)
);

CREATE TABLE ReservasVoos_LegInstance (
    Leg_no VARCHAR(16) NOT NULL,
    Flight_Date DATE NOT NULL,
    No_available_seats INT NOT NULL,
    Flight_Number VARCHAR(16) NOT NULL,
    Departure_Airport VARCHAR(16) NOT NULL,
    Arrival_Airport VARCHAR(16) NOT NULL,
    Dep_time TIME NOT NULL,
    Arr_time TIME NOT NULL,
    Airplane_ID VARCHAR(16) NOT NULL,
    PRIMARY KEY (Leg_no, Flight_Date),
    FOREIGN KEY (Leg_no) REFERENCES ReservasVoos_FlightLeg(Leg_no),
    FOREIGN KEY (Departure_Airport) REFERENCES ReservasVoos_Airport(Code),
    FOREIGN KEY (Arrival_Airport) REFERENCES ReservasVoos_Airport(Code),
    FOREIGN KEY (Airplane_ID) REFERENCES ReservasVoos_Airplane(Airplane_ID),
    FOREIGN KEY (Flight_Number) REFERENCES ReservasVoos_Flight(Number)
);

CREATE TABLE ReservasVoos_Seat (
    Seat_no VARCHAR(8) NOT NULL PRIMARY KEY,
    Customer_name VARCHAR(64) NOT NULL,
    Cphone VARCHAR(20) NOT NULL,
    Leg_no VARCHAR(16) NOT NULL,
    Flight_Date DATE NOT NULL,
    FOREIGN KEY (Leg_no, Flight_Date)
        REFERENCES ReservasVoos_LegInstance(Leg_no, Flight_Date)
);

CREATE TABLE ReservasVoos_CanLand (
    Airport_Code VARCHAR(16) NOT NULL,
    Airplane_type_name VARCHAR(32) NOT NULL,
    FOREIGN KEY (Airplane_type_name)
        REFERENCES ReservasVoos_AirplaneType(TypeName),
    FOREIGN KEY (Airport_Code)
        REFERENCES ReservasVoos_Airport(Code)
);

CREATE TABLE ReservasVoos_Fare (
    Code VARCHAR(16) NOT NULL PRIMARY KEY,
    Amount DECIMAL(10,2) NOT NULL,
    Restrictions VARCHAR(64) NOT NULL,
    Flight_Number VARCHAR(16) NOT NULL,
    FOREIGN KEY (Flight_Number) REFERENCES ReservasVoos_Flight(Number)
);
