USE JB_CS669;
--location for drop tables and drop sequences
Drop Table VIP_airliners;
Drop Table Long_range_jets;
Drop Table Large_jets;
Drop Table Super_mid_size_jets;
Drop Table Mid_size_jets;
Drop Table Light_jets;
Drop Table Very_light_jets;
Drop Table Flight_Distance;
Drop Table Flight_Departure;
Drop Table Flight_Arival;
Drop Table Flight_date;
Drop Table Flight_list;
Drop Table Planes_locations;


Drop Table VIP_airliners_models;
Drop Table Long_range_jets_models;
Drop Table Large_jets_models;
Drop Table Super_mid_size_jets_models;
Drop Table Mid_size_jets_models;
Drop Table Light_jets_models;
Drop Table Very_light_jets_models;
Drop Table Flight_date_change_table;
Drop Table Plane_locaiton_change;
Drop Table Plane_locaiton_change_table;

Drop Table Planes;
Drop Table Airlines;
Drop Table Airline_info;

Drop Sequence airline_id_seq;
Drop Sequence plane_id_seq;
Drop Sequence flight_number_seq;
Drop Sequence Date_change_id_seq;
Drop Sequence Location_change_id_seq;

Drop Index Airlines.AirlinesIdAirlinesIndex;
Drop Index Planes.AirlinesIdPlanesIndex;
Drop Index Plane_locations.PlaneIdPlaneLocationsIndex;
Drop Index Flight_list.PlaneIdFlightListIndex;
Drop Index Flight_date.FlightNumberFlightDateIndex;
Drop Index Flight_arival.FlightNumberFlightArivalIndex;
Drop Index Flight_departure.FlightNumberFlightDepartureIndex;
Drop Index Flight_distance.FlightNumberFlightDistanceIndex;
Drop Index Very_light_jets.PlaneIdVeryLightJetsIndex;
Drop Index Light_jets.PlaneIdLightJetsIndex;
Drop Index Mid_size_jets.PlaneIdMidSizeJetsIndex;
Drop Index Super_mid_size_jets.PlaneIdSuperMidSizedJetsIndex;
Drop Index Large_jets.PlaneIdLargeJetsIndex;
Drop Index Long_range_jets.PlaneIdLongRangeJetsIndex;
Drop Index VIP_airliners.PlaneIdVIPAirlinersIndex;
Drop Index Very_light_jets.PlaneModelVeryLightJetsIndex;
Drop Index Light_jets.PlaneModelLightJetsIndex;
Drop Index Mid_size_jets.PlaneModelMidSizeJetsIndex;
Drop Index Super_mid_size_jets.PlaneModelSuperMidSizedJetsIndex;
Drop Index Large_jets.PlaneModelLargeJetsIndex;
Drop Index Long_range_jets.PlaneModelLongRangeJetsIndex;
Drop Index VIP_airliners.PlaneModelVIPAirlinersIndex;
Drop Index Flight_date_change_table.FlightNUmberFlightDateChangeTableIndex;
Drop Index Plane_locaiton_change.PlaneIdPlaneLocaitonChangeIndex;



--create tables

--below are the tables for the models of private planes
Create Table Very_light_jets_models(
plane_model VARCHAR(54) NOT NULL Primary Key,
plane_range Decimal(4) NOT NULL,
passanger_size Decimal(2) NOT NULL)
;

Create Table Light_jets_models(
plane_model VARCHAR(54) NOT NULL Primary Key,
plane_range Decimal(4) NOT NULL,
passanger_size Decimal(2) NOT NULL)
;

Create Table Mid_size_jets_models(
plane_model VARCHAR(54) NOT NULL Primary Key,
plane_range Decimal(4) NOT NULL,
passanger_size Decimal(2) NOT NULL)
;

Create Table Super_mid_size_jets_models(
plane_model VARCHAR(54) NOT NULL Primary Key,
plane_range Decimal(4) NOT NULL,
passanger_size Decimal(2) NOT NULL)
;

Create Table Large_jets_models(
plane_model VARCHAR(54) NOT NULL Primary Key,
plane_range Decimal(4) NOT NULL,
passanger_size Decimal(2) NOT NULL)
;

Create Table Long_range_jets_models(
plane_model VARCHAR(54) NOT NULL Primary Key,
plane_range Decimal(4) NOT NULL,
passanger_size Decimal(2) NOT NULL)
;

Create Table VIP_airliners_models(
plane_model VARCHAR(54) NOT NULL Primary Key,
plane_range Decimal(4) NOT NULL,
passanger_size Decimal(2) NOT NULL)
;


--below are the tables for airline information
Create Table Airline_info(
airline_id Decimal(4) NOT NULL Primary Key,
airline_date DATE NOT NULL);

Create Table Airlines(
airline_name VARCHAR(24) NOT NULL Primary Key,
airline_id Decimal(4) NOT NULL,
FOREIGN KEY (airline_id) REFERENCES Airline_info(airline_id))
;


--below are the tables for plane information
Create Table Planes(
plane_id Decimal(8) NOT NULL Primary Key,
airline_id Decimal(4) NOT NULL,
FOREIGN KEY (airline_id) REFERENCES Airline_info(airline_id))
;

Create Table Planes_locations(
plane_id Decimal(8) NOT NULL Primary Key,
current_locations VARCHAR(24) NOT NULL,
FOREIGN KEY (plane_id) REFERENCES Planes(plane_id))
;


--below are the tables for flight information
Create Table Flight_list(
flight_number Decimal(12) NOT NULL Primary Key,
plane_id Decimal(8) NOT NULL,
FOREIGN KEY (plane_id) REFERENCES Planes(plane_id))
;

Create Table Flight_date(
flight_number Decimal(12) NOT NULL Primary Key,
book_date Date NOT NULL,
FOREIGN KEY (flight_number) REFERENCES Flight_list(flight_number))
;

Create Table Flight_Arival(
flight_number Decimal(12) NOT NULL Primary Key,
Arival_location VARCHAR(24) NOT NULL,
FOREIGN KEY (flight_number) REFERENCES Flight_list(flight_number))
;

Create Table Flight_Departure(
flight_number Decimal(12) NOT NULL Primary Key,
Departure_location VARCHAR(24) NOT NULL,
FOREIGN KEY (flight_number) REFERENCES Flight_list(flight_number))
;

Create Table Flight_Distance(
flight_number Decimal(12) NOT NULL Primary Key,
flight_milage Decimal(4) NOT NULL,
FOREIGN KEY (flight_number) REFERENCES Flight_list(flight_number))
;


--below are the tables for more plane information
Create Table Very_light_jets(
plane_id Decimal(8) NOT NULL Primary Key,
plane_model VARCHAR(54) NOT NULL,
FOREIGN KEY (plane_id) REFERENCES Planes(plane_id),
FOREIGN KEY (plane_model) REFERENCES Very_light_jets_models(plane_model))
;

Create Table Light_jets(
plane_id Decimal(8) NOT NULL Primary Key,
plane_model VARCHAR(54) NOT NULL,
FOREIGN KEY (plane_id) REFERENCES Planes(plane_id),
FOREIGN KEY (plane_model) REFERENCES Light_jets_models(plane_model))
;

Create Table Mid_size_jets(
plane_id Decimal(8) NOT NULL Primary Key,
plane_model VARCHAR(54) NOT NULL,
FOREIGN KEY (plane_id) REFERENCES Planes(plane_id),
FOREIGN KEY (plane_model) REFERENCES Mid_size_jets_models(plane_model))
;

Create Table Super_mid_size_jets(
plane_id Decimal(8) NOT NULL Primary Key,
plane_model VARCHAR(54) NOT NULL,
FOREIGN KEY (plane_id) REFERENCES Planes(plane_id),
FOREIGN KEY (plane_model) REFERENCES Super_mid_size_jets_models(plane_model))
;

Create Table Large_jets(
plane_id Decimal(8) NOT NULL Primary Key,
plane_model VARCHAR(54) NOT NULL,
FOREIGN KEY (plane_id) REFERENCES Planes(plane_id),
FOREIGN KEY (plane_model) REFERENCES Large_jets_models(plane_model))
;

Create Table Long_range_jets(
plane_id Decimal(8) NOT NULL Primary Key,
plane_model VARCHAR(54) NOT NULL,
FOREIGN KEY (plane_id) REFERENCES Planes(plane_id),
FOREIGN KEY (plane_model) REFERENCES Long_range_jets_models(plane_model))
;

Create Table VIP_airliners(
plane_id Decimal(8) NOT NULL Primary Key,
plane_model VARCHAR(54) NOT NULL,
FOREIGN KEY (plane_id) REFERENCES Planes(plane_id),
FOREIGN KEY (plane_model) REFERENCES VIP_airliners_models(plane_model))
;

--Create sequences for all of the PK's to go from 1 and so forth
CREATE SEQUENCE airline_id_seq START WITH 1;
CREATE SEQUENCE plane_id_seq START WITH 1;
CREATE SEQUENCE flight_number_seq START WITH 1;


--triggers & historical tables

--this table will track if the date of a flight has been changed
Create Table Flight_date_change_table(
Date_change_id Decimal(12) NOT NULL Primary Key,
flight_number Decimal(12) NOT NULL,
old_book_date Date NOT NULL,
new_book_date Date NOT NULL,
change_date Date NOT NULL,
FOREIGN KEY (flight_number) REFERENCES Flight_date(flight_number))
;

Create Sequence Date_change_id_seq START WITH 1;

--this is the trigger for my flight date change table
GO
CREATE OR ALTER Trigger DateChangeTrigger
On Flight_date
After Update
As
Begin
	Declare @old_date DATE = (select book_date From Deleted)
	Declare @new_date Date = (select book_date From Inserted)

	If (@old_date <> @new_date)
		Insert Into Flight_date_change_table(Date_change_id,
		flight_number,old_book_date,new_book_date,change_date)
		Values(Next Value For Date_change_id_seq,
		(Select flight_number From Inserted),
		@old_date,
		@new_date,
		GETDATE());
END;

--to test let me add in a flight, change it's dates twice and then check the history table to make sure we are running correctly
Insert into Airline_info(airline_id, airline_date)
	Values(Next Value For airline_id_seq, CAST('1/1/21' AS DATE));

Insert into Planes(plane_id, airline_id)
	Values(Next Value For plane_id_seq, 1);

Insert into Flight_list(flight_number, plane_id)
	Values(Next Value For flight_number_seq, 1);

Insert into Flight_date(flight_number, book_date)
	Values(1, CAST('2/28/21' AS DATE));

Update Flight_date
SET book_date = CAST('2/27/21' AS DATE)
Where flight_number = 1;

Update Flight_date
SET book_date = CAST('2/26/21' AS DATE)
Where flight_number = 1;

Select * 
From Flight_date;

Select * 
From Flight_date_change_table;

Go 
--this table will track when a planes location is changed
Create Table Plane_locaiton_change_table(
Location_change_id Decimal(12) NOT NULL Primary Key,
plane_id Decimal(8) NOT NULL,
old_plane_location VARCHAR(24) NOT NULL,
new_plane_location VARCHAR(24) NOT NULL,
change_date Date NOT NULL,
FOREIGN KEY (plane_id) REFERENCES Planes(plane_id))
;

Create Sequence Location_change_id_seq START WITH 1;
--this is the trigger for my plane location change table
GO
CREATE OR ALTER Trigger PlaneLocationChangeTrigger
On Planes_locations
After Update
As
Begin
	Declare @old_location Varchar(24) = (select current_locations From Deleted)
	Declare @new_location Varchar(24) = (select current_locations From Inserted)

	If (@old_location <> @new_location)
		Insert Into Plane_locaiton_change_table(Location_change_id,plane_id,old_plane_location,new_plane_location,change_date)
		Values(Next Value For Location_change_id_seq,
		(Select plane_id From Inserted),
		@old_location,
		@new_location,
		GETDATE());
END;


--let me now test that changing a plane loaction will appear in the histopry correctly
Select * 
From Planes_locations;

Insert into Planes_locations(plane_id,current_locations)
	Values(1,'Boston');

Update Planes_locations
SET current_locations = 'ATL'
Where plane_id = 1;

Update Planes_locations
SET current_locations = 'LA'
Where plane_id = 1;

Select * 
From Plane_locaiton_change_table;


--indexes
--lets go through and index all of the FK's
Create Unique Index AirlinesIdAirlinesIndex
On airlines (airline_id);

Create Index AirlinesIdPlanesIndex
On planes (airline_id);

Create Unique Index PlaneIdPlaneLocationsIndex
On Planes_locations (plane_id);

Create Index PlaneIdFlightListIndex
On Flight_list (plane_id);

Create Unique Index FlightNumberFlightDateIndex
On Flight_date (flight_number);

Create Unique Index FlightNumberFlightArivalIndex
On Flight_Arival (flight_number);

Create Unique Index FlightNumberFlightDepartureIndex
On Flight_Departure (flight_number);

Create Unique Index FlightNumberFlightDistanceIndex
On Flight_Distance (flight_number);



Create Unique Index PlaneIdVeryLightJetsIndex
On Very_light_jets (plane_id);

Create Unique Index PlaneIdLightJetsIndex
On Light_jets (plane_id);

Create Unique Index PlaneIdMidSizeJetsIndex
On Mid_size_jets (plane_id);

Create Unique Index PlaneIdSuperMidSizedJetsIndex
On Super_mid_size_jets (plane_id);

Create Unique Index PlaneIdLargeJetsIndex
On Large_jets (plane_id);

Create Unique Index PlaneIdLongRangeJetsIndex
On Long_range_jets (plane_id);

Create Unique Index PlaneIdVIPAirlinersIndex
On VIP_airliners (plane_id);


Create Index PlaneModelVeryLightJetsIndex
On Very_light_jets (plane_model);

Create Index PlaneModelLightJetsIndex
On Light_jets (plane_model);

Create Index PlaneModelMidSizeJetsIndex
On Mid_size_jets (plane_model);

Create Index PlaneModelSuperMidSizedJetsIndex
On Super_mid_size_jets (plane_model);

Create Index PlaneModelLargeJetsIndex
On Large_jets (plane_model);

Create Index PlaneModelLongRangeJetsIndex
On Long_range_jets (plane_model);

Create Index PlaneModelVIPAirlinersIndex
On VIP_airliners (plane_model);

Create Index FlightNUmberFlightDateChangeTableIndex
On Flight_date_change_table (Flight_number);

Create Index PlaneIdPlaneLocaitonChangeIndex
On Plane_locaiton_change_table (plane_id);

--now lets go through and index all of the columns that deserve indexing
Create Unique Index AirlineIdAirlinesIndex
On Airlines (airline_id);

Create Index AirlineIdPlanesIndex
On Planes (airline_id);

Create Index CurrentLocationsPlanesLocationsIndex
On Planes_locations (current_locations);

Create Index ArivalLocationFlightArivalIndex
On Flight_arival (arival_location);

Create Index DepartureLocationFlightDepartureIndex
On Flight_departure (departure_location);

Create Index PlaneModelVeryLightJetIndex
On Very_light_jets (plane_model);

Create Index PlaneModelLightJetIndex
On Light_jets (plane_model);

Create Index PlaneModelMidSizeJetIndex
On Mid_size_jets (plane_model);

Create Index PlaneModelSupreMidSizedJetsJetIndex
On Super_mid_size_jets (plane_model);

Create Index PlaneModelLargeJetIndex
On Large_jets (plane_model);

Create Index PlaneModelLongRangeJetIndex
On Long_range_jets (plane_model);

Create Index PlaneModelVIPAirelinersJetIndex
On VIP_airliners (plane_model);

Create Index PlaneIdPlaneLoacitonChangeIndex
On Plane_locaiton_change_table (Plane_id);


--moving on to week 5 needs

--first I will add in business planes to each of the respective tables so that this info is ready for us when needed
INSERT INTO Very_light_jets_models(plane_model, plane_range, passanger_size)
VALUES ('Cirrus SF50 G2',622,7),
('Phenom 100EV',1092,7),
('Citation M2',1183,6),
('HondaJet Elite',1171,6);

INSERT INTO Light_jets_models(plane_model, plane_range, passanger_size)
VALUES ('SyberJet SJ30i',2205,8),
('Citation CJ3+',1825,8),
('Phenom 300E',1936,7),
('Nextant 400XTi',1801,6),
('Citation CJ4',1927,8),
('Pilatus PC-24',2035,8),
('Learjet 70',2045,8);

INSERT INTO Mid_size_jets_models(plane_model, plane_range, passanger_size)
VALUES ('Citation XLS+',1841,9),
('Learjet 75',2026,9),
('Legacy 450',2904,9),
('Praetor 500',3250,9),
('Citation Latitude',2678,9);

INSERT INTO Super_mid_size_jets_models(plane_model, plane_range, passanger_size)
VALUES ('Citation Sovereign+',3069,11),
('Legacy 500',3125,10),
('Praetor 600',4018,11),
('Gulfstream G280',3646,11),
('Challenger 350',3250,11);

INSERT INTO Large_jets_models(plane_model, plane_range, passanger_size)
VALUES ('Embraer Legacy 650E',3919,14),
('Citation Longitude',3500,13),
('Falcon 2000S/EX',3504,14),
('Challenger 650',4011,14),
('Falcon 2000LXS/EX',4065,13),
('Falcon 900LX/EX',5292,13),
('Gulfstream 500',4650,14);

INSERT INTO Long_range_jets_models(plane_model, plane_range, passanger_size)
VALUES ('Global 5000',5475,13),
('Falcon 7X',5760,19),
('Gulfstream G600',6518,18),
('Falcon 8X',6235,16),
('Gulfstream G550',6708,17),
('Global 6000',6124,19),
('Gulfstream G650ER',7437,19),
('Global 7500',7725,12);

INSERT INTO VIP_airliners_models(plane_model, plane_range, passanger_size)
VALUES ('Lineage 1000E',4602,20),
('BBJ MAX-7',7000,19),
('BBJ MAX-8',6640,23),
('ACJ319',6002,15),
('BBJ MAX-9',6515,21);


--procedure that allows us to add in airline names

GO
Create or alter Procedure add_airline 
	@airline_name VARCHAR(24)

	AS
	Begin

	DECLARE @airline_id_seq Decimal(20);

	Set  @airline_id_seq = Next Value For airline_id_seq;

		INSERT INTO Airlines(airline_name,airline_id)
		Values(@airline_name, @airline_id_seq);

		INSERT INTO Airline_info(airline_id,airline_date)
		Values(@airline_id_seq, getdate()); 

END;
GO

BEGIN Transaction add_airline;
Execute add_airline 'James Air';
COMMIT Transaction add_airline;
go
BEGIN Transaction add_airline;
Execute add_airline 'Will Air';
COMMIT Transaction add_airline;

BEGIN Transaction add_airline;
Execute add_airline 'John Air';
COMMIT Transaction add_airline;

BEGIN Transaction add_airline;
Execute add_airline 'Grant Air';
COMMIT Transaction add_airline;

BEGIN Transaction add_airline;
Execute add_airline 'Bill Air';
COMMIT Transaction add_airline;

BEGIN Transaction add_airline;
Execute add_airline 'Chris Air';
COMMIT Transaction add_airline;

BEGIN Transaction add_airline;
Execute add_airline 'Harry Air';
COMMIT Transaction add_airline;

BEGIN Transaction add_airline;
Execute add_airline 'Jasmine Air';
COMMIT Transaction add_airline;

BEGIN Transaction add_airline;
Execute add_airline 'Bika Air';
COMMIT Transaction add_airline;

BEGIN Transaction add_airline;
Execute add_airline 'Jimmy Air';
COMMIT Transaction add_airline;

select *
From Airlines;
select *
From Very_light_jets_models;


--create aircrafts
GO
Create or alter Procedure creat_aircraft_very_light_jets
	@airline_id decimal(24),@plane_model VARCHAR(54)

	AS
	Begin

	DECLARE @plane_id_seq Decimal(20);

	Set  @plane_id_seq = Next Value For plane_id_seq;

		INSERT INTO Planes(plane_id,airline_id)
		Values(@plane_id_seq, @airline_id);

		INSERT INTO Very_light_jets( plane_id,plane_model)
		Values(@plane_id_seq,@plane_model); 

END;
GO

--add in planes for the very light jets
BEGIN Transaction creat_aircraft_very_light_jets;
Execute creat_aircraft_very_light_jets 2, 'Cirrus SF50 G2';
COMMIT Transaction creat_aircraft_very_light_jets;

BEGIN Transaction creat_aircraft_very_light_jets;
Execute creat_aircraft_very_light_jets 3, 'Phenom 100EV';
COMMIT Transaction creat_aircraft_very_light_jets;

BEGIN Transaction creat_aircraft_very_light_jets;
Execute creat_aircraft_very_light_jets 3, 'Phenom 100EV';
COMMIT Transaction creat_aircraft_very_light_jets;

BEGIN Transaction creat_aircraft_very_light_jets;
Execute creat_aircraft_very_light_jets 3, 'Phenom 100EV';
COMMIT Transaction creat_aircraft_very_light_jets;

BEGIN Transaction creat_aircraft_very_light_jets;
Execute creat_aircraft_very_light_jets 4, 'Cirrus SF50 G2';
COMMIT Transaction creat_aircraft_very_light_jets;

BEGIN Transaction creat_aircraft_very_light_jets;
Execute creat_aircraft_very_light_jets 5, 'Phenom 100EV';
COMMIT Transaction creat_aircraft_very_light_jets;

BEGIN Transaction creat_aircraft_very_light_jets;
Execute creat_aircraft_very_light_jets 6, 'Phenom 100EV';
COMMIT Transaction creat_aircraft_very_light_jets;

BEGIN Transaction creat_aircraft_very_light_jets;
Execute creat_aircraft_very_light_jets 7, 'Phenom 100EV';
COMMIT Transaction creat_aircraft_very_light_jets;

BEGIN Transaction creat_aircraft_very_light_jets;
Execute creat_aircraft_very_light_jets 8, 'Citation M2';
COMMIT Transaction creat_aircraft_very_light_jets;

BEGIN Transaction creat_aircraft_very_light_jets;
Execute creat_aircraft_very_light_jets 9, 'HondaJet Elite';
COMMIT Transaction creat_aircraft_very_light_jets;

select *
From Very_light_jets;
select *
From Planes;

-- add in plane inofr for all other tables
INSERT INTO Planes(plane_id, airline_id)
VALUES (NEXT VALUE FOR plane_id_seq,2),(NEXT VALUE FOR plane_id_seq,2),(NEXT VALUE FOR plane_id_seq,2),(NEXT VALUE FOR plane_id_seq,2),(NEXT VALUE FOR plane_id_seq,2),(NEXT VALUE FOR plane_id_seq,2),(NEXT VALUE FOR plane_id_seq,2),(NEXT VALUE FOR plane_id_seq,2),(NEXT VALUE FOR plane_id_seq,2),(NEXT VALUE FOR plane_id_seq,2),
(NEXT VALUE FOR plane_id_seq,3),(NEXT VALUE FOR plane_id_seq,3),(NEXT VALUE FOR plane_id_seq,3),(NEXT VALUE FOR plane_id_seq,3),(NEXT VALUE FOR plane_id_seq,3),(NEXT VALUE FOR plane_id_seq,3),(NEXT VALUE FOR plane_id_seq,3),(NEXT VALUE FOR plane_id_seq,3),(NEXT VALUE FOR plane_id_seq,3),(NEXT VALUE FOR plane_id_seq,3),
(NEXT VALUE FOR plane_id_seq,4),(NEXT VALUE FOR plane_id_seq,4),(NEXT VALUE FOR plane_id_seq,4),(NEXT VALUE FOR plane_id_seq,4),(NEXT VALUE FOR plane_id_seq,4),(NEXT VALUE FOR plane_id_seq,4),(NEXT VALUE FOR plane_id_seq,4),(NEXT VALUE FOR plane_id_seq,4),(NEXT VALUE FOR plane_id_seq,4),(NEXT VALUE FOR plane_id_seq,4),
(NEXT VALUE FOR plane_id_seq,5),(NEXT VALUE FOR plane_id_seq,5),(NEXT VALUE FOR plane_id_seq,5),(NEXT VALUE FOR plane_id_seq,5),(NEXT VALUE FOR plane_id_seq,5),(NEXT VALUE FOR plane_id_seq,5),(NEXT VALUE FOR plane_id_seq,5),(NEXT VALUE FOR plane_id_seq,5),(NEXT VALUE FOR plane_id_seq,5),(NEXT VALUE FOR plane_id_seq,5),
(NEXT VALUE FOR plane_id_seq,6),(NEXT VALUE FOR plane_id_seq,6),(NEXT VALUE FOR plane_id_seq,6),(NEXT VALUE FOR plane_id_seq,6),(NEXT VALUE FOR plane_id_seq,6),(NEXT VALUE FOR plane_id_seq,6),(NEXT VALUE FOR plane_id_seq,6),(NEXT VALUE FOR plane_id_seq,6),(NEXT VALUE FOR plane_id_seq,6),(NEXT VALUE FOR plane_id_seq,6),
(NEXT VALUE FOR plane_id_seq,7),(NEXT VALUE FOR plane_id_seq,7),(NEXT VALUE FOR plane_id_seq,7),(NEXT VALUE FOR plane_id_seq,7),(NEXT VALUE FOR plane_id_seq,7),(NEXT VALUE FOR plane_id_seq,7),(NEXT VALUE FOR plane_id_seq,7),(NEXT VALUE FOR plane_id_seq,7),(NEXT VALUE FOR plane_id_seq,7),(NEXT VALUE FOR plane_id_seq,7),



INSERT INTO Light_jets(plane_id, plane_model)
VALUES (14,'SyberJet SJ30i'),(15,'Citation CJ3+'),(16,'Citation CJ3+'),(17,'Phenom 300E'),(18,'Nextant 400XTi'),(19,'Citation CJ4'),(20,'Pilatus PC-24'),(21,'Learjet 70'),(22,'Learjet 70'),(23,'Learjet 70');

--('SyberJet SJ30i',2205,8),
--('Citation CJ3+',1825,8),
--('Phenom 300E',1936,7),
--('Nextant 400XTi',1801,6),
--('Citation CJ4',1927,8),
--('Pilatus PC-24',2035,8),
--('Learjet 70',2045,8);

INSERT INTO Mid_size_jets(plane_id, plane_model)
VALUES (24,'Citation XLS+'),(25,'Citation XLS+'),(26,'Learjet 75'),(27,'Learjet 75'),(28,'Legacy 450'),(29,'Legacy 450'),(30,'Praetor 500'),(31,'Praetor 500'),(32,'Citation Latitude'),(33,'Citation Latitude');
 --('Citation XLS+',1841,9),
--('Learjet 75',2026,9),
--('Legacy 450',2904,9),
--('Praetor 500',3250,9),
--('Citation Latitude',2678,9);

INSERT INTO Super_mid_size_jets(plane_id, plane_model)
VALUES (34,'Citation Sovereign+'),(35,'Citation Sovereign+'),(36,'Legacy 500'),(37,'Legacy 500'),(38,'Praetor 600'),(39,'Praetor 600'),(40,'Gulfstream G280'),(41,'Gulfstream G280'),(42,'Challenger 350'),(43,'Challenger 350');
--('Citation Sovereign+',3069,11),
--('Legacy 500',3125,10),
--('Praetor 600',4018,11),
--('Gulfstream G280',3646,11),
--('Challenger 350',3250,11);

INSERT INTO Large_jets(plane_id, plane_model)
VALUES (44,'Embraer Legacy 650E'),(45,'Citation Longitude'),(46,'Falcon 2000S/EX'),(47,'Falcon 2000S/EX'),(48,'Falcon 2000S/EX'),(49,'Challenger 650'),(50,'Falcon 2000LXS/EX'),(51,'Falcon 900LX/EX'),(52,'Gulfstream 500'),(53,'Gulfstream 500');
--('Embraer Legacy 650E',3919,14),
--('Citation Longitude',3500,13),
--('Falcon 2000S/EX',3504,14),
--('Challenger 650',4011,14),
--('Falcon 2000LXS/EX',4065,13),
--('Falcon 900LX/EX',5292,13),
--('Gulfstream 500',4650,14);

INSERT INTO Long_range_jets(plane_id, plane_model)
VALUES (54,'Global 5000'),(55,'Falcon 7X'),(56,'Gulfstream G600'),(57,'Gulfstream G600'),(58,'Falcon 8X'),(59,'Gulfstream G550'),(60,'Global 6000'),(61,'Gulfstream G650ER'),(62,'Global 7500'),(63,'Global 7500');

--('Global 5000',5475,13),
--('Falcon 7X',5760,19),
--('Gulfstream G600',6518,18),
--('Falcon 8X',6235,16),
--('Gulfstream G550',6708,17),
--('Global 6000',6124,19),
--('Gulfstream G650ER',7437,19),
--('Global 7500',7725,12);

INSERT INTO VIP_airliners(plane_id, plane_model)
VALUES (64,'Lineage 1000E'),(65,'Lineage 1000E'),(66,'BBJ MAX-7'),(67,'BBJ MAX-7'),(68,'BBJ MAX-8'),(69,'BBJ MAX-8'),(70,'ACJ319'),(71,'ACJ319'),(72,'BBJ MAX-9'),(73,'BBJ MAX-9');
--('Lineage 1000E',4602,20),
--('BBJ MAX-7',7000,19),
--('BBJ MAX-8',6640,23),
--('ACJ319',6002,15),
--('BBJ MAX-9',6515,21);


--now we will create a procedure that will creata flight for us
GO
Create or alter Procedure create_flight
	@plane_id decimal(24),@arival_loaction VARCHAR(54), @departure_location VARCHAR(54), @flight_milage decimal(4)
	AS
	Begin
	DECLARE @flight_id_seq Decimal(20);
	Set  @flight_id_seq = Next Value For flight_number_seq;

		INSERT INTO Flight_list(flight_number,plane_id)
		Values(@flight_id_seq, @plane_id);

		INSERT INTO Flight_Arival(flight_number,Arival_location)
		Values(@flight_id_seq, @arival_loaction);

		INSERT INTO Flight_Departure(flight_number,Departure_location)
		Values(@flight_id_seq, @departure_location);

		INSERT INTO Flight_Distance(flight_number,flight_milage)
		Values(@flight_id_seq, @flight_milage);

		INSERT INTO Flight_Date(flight_number,book_date)
		Values(@flight_id_seq, getdate());
END;
GO
---now lets add in some flight
BEGIN Transaction create_flight;
Execute create_flight 2, 'Boston', 'Atlanta', 1000;
COMMIT Transaction create_flight;

BEGIN Transaction create_flight;
Execute create_flight 32, 'Boston', 'Manchester', 40;
COMMIT Transaction create_flight;

BEGIN Transaction create_flight;
Execute create_flight 21, 'San Diego', 'Atlanta', 3000;
COMMIT Transaction create_flight;

BEGIN Transaction create_flight;
Execute create_flight 27, 'Atlanta', 'Boston', 1000;
COMMIT Transaction create_flight;

BEGIN Transaction create_flight;
Execute create_flight 12, 'Miami', 'Atlanta', 700;
COMMIT Transaction create_flight;

BEGIN Transaction create_flight;
Execute create_flight 29, 'Denver', 'Atlanta', 1800;
COMMIT Transaction create_flight;

BEGIN Transaction create_flight;
Execute create_flight 14, 'Boston', 'Chicago', 800;
COMMIT Transaction create_flight;

BEGIN Transaction create_flight;
Execute create_flight 23, 'New York City', 'Atlanta', 800;
COMMIT Transaction create_flight;

BEGIN Transaction create_flight;
Execute create_flight 34, 'Boston', 'Jamestown', 750;
COMMIT Transaction create_flight;

BEGIN Transaction create_flight;
Execute create_flight 20, 'Summerville', 'Atlanta', 1010;
COMMIT Transaction create_flight;


--Time to fill data now as needed
--planes locations
INSERT INTO Planes_locations(plane_id, current_locations)
VALUES (14,'Boston'),(15,'Atlanta'),(16,'Denver'),(17,'Miami'),(18,'Dallas'),(19,'San Diego'),(20,'Bronxville'),(21,'New York City'),(22,'Jamestown'),(23,'Manchester');

--plane loaction changes
INSERT INTO Plane_locaiton_change_table(Location_change_id, plane_id, old_plane_location,new_plane_location, change_date)
VALUES 
(Next Value for Location_change_id_seq ,25,'Bronxville','Atlanta',getdate()),
(Next Value for Location_change_id_seq,26,'Dallas','Jamestown',getdate()),
(Next Value for Location_change_id_seq,27,'Manchester','Bronxville',getdate()),
(Next Value for Location_change_id_seq,28,'Atlanta','Manchester',getdate()),
(Next Value for Location_change_id_seq,29,'Dallas','Manchester',getdate()),
(Next Value for Location_change_id_seq,30,'Miami','Atlanta',getdate()),
(Next Value for Location_change_id_seq,31,'Denver','Boston',getdate()),
(Next Value for Location_change_id_seq,32,'San Diego','Boston',getdate()),
(Next Value for Location_change_id_seq,33,'Miami','San Diego',getdate()),
(Next Value for Location_change_id_seq,34,'San Diego','Dallas',getdate());


--qestion 1:look up on what date a plane changed loactions 

Select plane_id,change_date as Current_Lookup_Date from Plane_locaiton_change_table
WHERE CONVERT(DATE, change_date) = CONVERT(DATE, getdate());

--question 2: the FAA needs a list of all the flight that we have record of to make sure our records match one anohter
Select Flight_list.flight_number, Flight_Arival.Arival_location, Flight_Departure.Departure_location
from Flight_list
Join Flight_Arival ON Flight_Arival.flight_number = Flight_list.flight_number
Join Flight_Departure ON Flight_Departure.flight_number = Flight_list.flight_number;

--question 3: pull all the flight data that we have and put it all togteher to make one master file:

Select Airline_info.airline_id, Planes.plane_id,VIP_airliners.plane_model, VIP_airliners_models.passanger_size
from Airline_info
Join Planes ON Planes.airline_id = Airline_info.airline_id
Join VIP_airliners ON VIP_airliners.plane_id = Planes.plane_id
Join VIP_airliners_models ON VIP_airliners_models.plane_model = VIP_airliners.plane_model;

--Question 4: The owner of an airline company wants to know when their planes are currently located
Select Planes_locations.current_locations, Planes.plane_id
FROM Planes_locations
JOIN Planes ON Planes.plane_id = Planes_locations.plane_id
Where 
Exists (select plane_id from Planes where airline_id = 2);



INSERT INTO Planes_locations(plane_id, current_locations)
VALUES (34,'Miami'),(35,'Miami'),(36,'Miami'),(37,'Miami'),(38,'Dallas'),(39,'San Diego'),(30,'Dallas'),(31,'New Manchester City'),(32,'Manchester'),(33,'Manchester');


--Visulizations
--city that has the most planes currently in it
Select Planes_locations.current_locations, count(Planes_locations.current_locations) AS Count_of_planes
from Planes_locations
Group By Planes_locations.current_locations;

--we will use question 4 above to creta a map
