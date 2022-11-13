/* Team 1 
David Huber and Blade Archie 
* ITEC 3200 Section 04
* This database will take in info on airports
* This includes tables of Airport, Employee, Flight,
* Planes, Airline, and Airline_has_Planes. Each Having
* their own of respective variables. 
*/
-- DROP Table Statements
DROP TABLE Airline_has_Planes;
DROP TABLE Flight;
DROP TABLE Employee;
DROP TABLE Airline;
DROP TABLE Planes;
DROP TABLE Airport;

-- Create Table Statement Airport

CREATE TABLE Airport (
Airport_id CHAR(3) NOT NULL,
Airport_Name VARCHAR(50),
State VARCHAR(45),
CONSTRAINT PRIMARY KEY (Airport_id));

-- insert Airport
insert into Airport values ('ATL' , 'Hartsfield – Jackson Atlanta International', 'Georgia');
insert into Airport values ('JFK' , 'John F. Kennedy International' , 'New York');
insert into Airport values ('DFW', 'Dallas-fort Worth International', 'Texas');
insert into Airport values ('SAT', 'San-Antonio International', 'Texas');
insert into Airport values ('LAX', 'Las Angeles International', 'California');
insert into Airport values ('ANC', 'Ted Stevens Anchorage International', 'Alaska');
insert into Airport values ('PMW', 'Portland International', 'Maine');

-- Create Table Statement Planes
CREATE TABLE Planes (
Planes_id CHAR(3) NOT NULL,
Model CHAR(3),
CONSTRAINT PRIMARY KEY (Planes_id));

-- Insert Statements for Planes
insert into Planes values ('P1','737');
insert into Planes values ('P2','636');
insert into Planes values ('P3','535');
insert into Planes values ('P4','434');
insert into Planes values ('P5','323');
insert into Planes values ('P6','212');
insert into Planes values ('P7','121');
-- Create Statement for Airline
CREATE TABLE Airline (
Airline_id CHAR(3) NOT NULL,
Airline_Name VARCHAR(45),
CONSTRAINT PRIMARY KEY (Airline_id));

-- Insert statement for Airline
insert into Airline values ('A1','Virgin');
insert into Airline values ('A2','Southwest');
insert into Airline values ('A3','Delta');
insert into Airline values ('A4','United');
insert into Airline values ('A5','Continental');
insert into Airline values ('A6','Alaska Air');
insert into Airline values ('A7','American Air');
-- Create Table Statement for Employee
CREATE TABLE Employee (
Employee_id CHAR(3) NOT NULL,
Employee_FirstName VARCHAR(45),
Employee_LastName VARCHAR(45),
Employee_Salary VARCHAR(8),
Employee_Job_Title VARCHAR(45),
Hire_Date DATE,
Airport_id CHAR(3) NOT NULL,
CONSTRAINT PRIMARY KEY (Employee_id),
FOREIGN KEY (Airport_id) REFERENCES Airport(Airport_id));

-- Insert Statements for Employee
insert into Employee values ('E1', 'John', 'Anvil', '12345678', 'Janitor', '1999-04-29', 'ATL');
insert into Employee values ('E2', 'Bob', 'Smith', '12345678', 'Luggage', '1998-03-22', 'JFK');
insert into Employee values ('E3', 'Dylan', 'Hunter', '12345678', 'Guard', '1997-12-21', 'DFW');
insert into Employee values ('E4', 'Hunter', 'Archer', '12345678', 'Guard', '1997-11-08', 'SAT');
insert into Employee values ('E5', 'Sam', 'Pepper', '12345678', 'Janitor', '1990-04-23', 'LAX');
insert into Employee values ('E6', 'Richard', 'Kosceoff', '12345678', 'Maintanence', '1999-01-28', 'ANC');
insert into Employee values ('E7', 'Kim', 'Possible', '12345678', 'Front Desk', '2000-01-01', 'PMW');
-- Create Table for Flight

CREATE TABLE Flight (
Flight_id CHAR(3) NOT NULL,
Flight_Number CHAR(3),
Departure_Date_Time DATETIME,
Terminal_Time VARCHAR(45),
Planes_id CHAR(3) NOT NULL,
Airline_id CHAR(3) NOT NULL,
Departure_Airport_id CHAR(3) NOT NULL,
Destination_Airport_id CHAR(3) NOT NULL,
CONSTRAINT PRIMARY KEY (Flight_id),
FOREIGN KEY (Planes_id) REFERENCES Planes(Planes_id),
FOREIGN KEY (Airline_id) REFERENCES Airline(Airline_id),
FOREIGN KEY (Departure_Airport_id) REFERENCES Airport(Airport_id),
FOREIGN KEY (Destination_Airport_id) REFERENCES Airport(Airport_id));

-- Insert Statements Flight
insert into Flight values ('F1','111','20220923', '10:34:09 PM','P1','A1','ATL','JFK');
insert into Flight values ('F2','222','20220923', '10:34:10 PM','P2','A2','JFK','DFW');
insert into Flight values ('F3','333','20220923', '10:34:11 PM','P3','A3','DFW','SAT');
insert into Flight values ('F4','444','20220923', '10:34:12 PM','P4','A4','SAT','LAX');
insert into Flight values ('F5','555','20220923', '10:34:13 PM','P5','A5','LAX','ANC');
insert into Flight values ('F6','666','20220923', '10:34:14 PM','P6','A6','ANC','PMW');
insert into Flight values ('F7','777','20220923', '10:34:15 PM','P7','A7','PMW','ATL');
-- Create Table for Airline has Plane
CREATE TABLE Airline_has_Planes (
Airline_id CHAR(3) NOT NULL,
Planes_id CHAR(3) NOT NULL,
CONSTRAINT PRIMARY KEY (Airline_id, Planes_id),
FOREIGN KEY(Airline_id) REFERENCES Airline(Airline_id),
FOREIGN KEY (Planes_id) REFERENCES Planes(Planes_id));

-- Insert Statements for Airline_has_Planes
insert into Airline_has_Planes values ('A1','P1');
insert into Airline_has_Planes values ('A2','P2');
insert into Airline_has_Planes values ('A3','P3');
insert into Airline_has_Planes values ('A4','P4');
insert into Airline_has_Planes values ('A5','P5');
insert into Airline_has_Planes values ('A6','P6');
insert into Airline_has_Planes values ('A7','P7');
-- Testing
SELECT * FROM Airport;
SELECT * FROM Flight;