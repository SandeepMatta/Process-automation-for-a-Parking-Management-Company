drop table T7_Bill_Details;
drop TABLE T7_User_Details;
drop table T7_Parking_Details;
drop table T7_Seen_Vehicles;
drop table T7_Lot_Details;

-- Create Seen_And_Regeistered_Vehicles
create table T7_Seen_Vehicles (
    Vehicle_ID VARCHAR(8) PRIMARY KEY,
    First_Use Date NOT NULL);
    
-- Create User Table  
create table T7_User_Details (
        Vehicle_ID VARCHAR(15) REFERENCES T7_Seen_Vehicles(Vehicle_ID) PRIMARY KEY,
        First_Name VARCHAR(10) NOT NULL,
        LAST_Name VARCHAR(10) NOT NULL,
        PHONE NUMBER(10) NOT NULL CHECK (PHONE > 999999999),
        EMAIL VARCHAR(50) NOT NULL,
        Apt_No NUMBER(3),
        Street VARCHAR(30) NOT NULL,
        City VARCHAR(15) NOT NULL,
        StateName VARCHAR(10) NOT NULL,
        Zip NUMBER(5) NOT NULL,
        AddressSource CHAR(3) NOT NULL CHECK (AddressSource IN ('DMV','APP')));
        
-- Parking Lot Details Table  
create table T7_Lot_Details (
        Lot_ID NUMBER(3) PRIMARY KEY,
        Spaces NUMBER(3) NOT NULL,
        Hourly_Rate NUMBER(2) NOT NULL,
        Daily_Flat_Rate NUMBER(2) NOT NULL,
        Street VARCHAR(30) NOT NULL,
        City VARCHAR(15) NOT NULL,
        StateName VARCHAR(10) NOT NULL,
        Zip NUMBER(5) NOT NULL);

-- Parking Details Table
create table T7_Parking_Details (
        Transaction_ID NUMBER(5) PRIMARY KEY,
        Vehicle_ID VARCHAR(15) NOT NULL REFERENCES T7_Seen_Vehicles(Vehicle_ID),
        Lot_ID NUMBER(3) NOT NULL REFERENCES T7_Lot_Details(Lot_ID),
        In_Time DATE  NOT NULL,
        Out_Time DATE);
               
-- Create Bill Details Table  
create table T7_Bill_Details (
        Transaction_ID NUMBER(5) REFERENCES T7_Parking_Details(Transaction_ID),
        STATUS VARCHAR(50) CHECK (STATUS IN ('Online Bill Generated','Offline Bill Sent','Payment Done','Payment Reminder 1','Payment Reminder 2','To Collections')),
        AMOUNT NUMBER(4) NOT NULL,
        STATUS_DATE DATE NOT NULL,
        PRIMARY KEY (Transaction_ID,STATUS));
        
-- Seen Vehicles Data
INSERT INTO T7_Seen_Vehicles
VALUES ('CT123RT1',to_date('01/15/2017','MM/DD/YYYY'));
INSERT INTO T7_Seen_Vehicles
VALUES ('CT23ST21',to_date('03/05/2017','MM/DD/YYYY'));
INSERT INTO T7_Seen_Vehicles
VALUES ('NYQW121',to_date('01/07/2017','MM/DD/YYYY'));
INSERT INTO T7_Seen_Vehicles
VALUES ('NY213QTE',to_date('06/05/2017','MM/DD/YYYY'));
INSERT INTO T7_Seen_Vehicles
VALUES ('CTAD321',to_date('04/29/2017','MM/DD/YYYY'));

-- User Details Data
INSERT INTO T7_USER_DETAILS
VALUES ('CT123RT1','Alex','Parrish',8564357840,'alex.parrish@gmail.com',25,'915 Main','Hartford','CT',06103,'APP');
INSERT INTO T7_USER_DETAILS
VALUES ('CT23ST21','Rose','King',9864357829,'rose.king@gmail.com',null,'32 Trumbull','Hartford','CT',06105,'DMV'); 
INSERT INTO T7_USER_DETAILS
VALUES ('CTAD321','Dan','Crow',8652974532,'dan.crow@gmail.com',86,'52 Pearl','Hartford','CT',06195,'APP'); 
INSERT INTO T7_USER_DETAILS
VALUES ('NYQW121','Jimmy','Kimmel',7859640325,'jimmy.kimmel@gmail.com',42,'33rd Street 5th Av','Manhaton','NY',04265,'APP'); 
INSERT INTO T7_USER_DETAILS
VALUES ('NY213QTE','John','Oliver',3549872653,'john.oliver@gmail.com',null,'Main','Manhaton','NY',04268,'APP'); 


-- Lot Details Data
INSERT INTO T7_Lot_Details 
   VALUES (001, 100, 1, 8, '915 Main', 'Hartford', 'CT', 06103);
INSERT INTO T7_Lot_Details
   VALUES (002, 50, 2, 10, '915 Main', 'Hartford', 'CT', 06103);
INSERT INTO T7_Lot_Details
   VALUES (003, 200, 1, 8, '210 Main', 'Storrs', 'CT', 06269);
INSERT INTO T7_Lot_Details 
   VALUES (004, 80, 1, 12, '1084 Rd', 'Groton', 'CT', 06340);
   
   
-- Parking Details Data
Insert INTO T7_PARKING_DETAILS 
    VALUES (12345, 'CT123RT1', 001, to_date('01/15/2017 13:05:50','MM/DD/YYYY hh24:mi:ss'), to_date('01/15/2017 16:03:30','MM/DD/YYYY hh24:mi:ss'));
Insert INTO T7_PARKING_DETAILS 
    VALUES (12346, 'CT23ST21', 001, to_date('01/15/2017 16:05:50','MM/DD/YYYY hh24:mi:ss'), to_date('01/15/2017 18:03:30','MM/DD/YYYY hh24:mi:ss'));
Insert INTO T7_PARKING_DETAILS 
    VALUES (12347, 'NYQW121', 001, to_date('01/15/2017 12:00:03','MM/DD/YYYY hh24:mi:ss'), to_date('01/15/2017 19:30:30','MM/DD/YYYY hh24:mi:ss'));
Insert INTO T7_PARKING_DETAILS 
    VALUES (12348, 'CT23ST21', 001, to_date('01/16/2017 19:00:03','MM/DD/YYYY hh24:mi:ss'), to_date('01/21/2017 23:30:30','MM/DD/YYYY hh24:mi:ss'));
Insert INTO T7_PARKING_DETAILS 
    VALUES (12349, 'NYQW121', 002, to_date('01/17/2017 19:00:03','MM/DD/YYYY hh24:mi:ss'), to_date('01/19/2017 22:30:30','MM/DD/YYYY hh24:mi:ss'));
Insert INTO T7_PARKING_DETAILS 
    VALUES (12350, 'CT23ST21', 002, to_date('01/18/2017 11:00:03','MM/DD/YYYY hh24:mi:ss'), to_date('01/19/2017 21:30:30','MM/DD/YYYY hh24:mi:ss'));
Insert INTO T7_PARKING_DETAILS 
    VALUES (12351, 'CT123RT1', 002, to_date('01/18/2017 08:00:03','MM/DD/YYYY hh24:mi:ss'), to_date('01/19/2017 09:30:30','MM/DD/YYYY hh24:mi:ss'));
Insert INTO T7_PARKING_DETAILS 
    VALUES (12352, 'CT123RT1', 003, to_date('01/17/2017 02:45:20','MM/DD/YYYY hh24:mi:ss'), Null);
Insert INTO T7_PARKING_DETAILS 
    VALUES (12353, 'NY213QTE', 003, to_date('01/17/2017 23:00:54','MM/DD/YYYY hh24:mi:ss'), Null);
Insert INTO T7_PARKING_DETAILS 
    VALUES (12355, 'NY213QTE', 004, to_date('01/18/2017 19:25:08','MM/DD/YYYY hh24:mi:ss'), Null);
Insert INTO T7_PARKING_DETAILS 
    VALUES (12356, 'NYQW121', 004, to_date('01/15/2017 20:00:00','MM/DD/YYYY hh24:mi:ss'), to_date('01/19/2017 23:30:45','MM/DD/YYYY hh24:mi:ss'));

-- Bill Details Data
INSERT INTO T7_BILL_DETAILS
        SELECT parking.Transaction_ID,'Online Bill Generated',
    CASE WHEN MOD(CEIL((parking.OUT_TIME - parking.IN_TIME)*24),24) > 10 THEN (FLOOR(CEIL((parking.OUT_TIME - parking.IN_TIME)*24)/24)+1)*lot.daily_flat_rate
        ELSE FLOOR(CEIL((parking.OUT_TIME - parking.IN_TIME)*24)/24)*lot.daily_flat_rate + MOD(CEIL((parking.OUT_TIME - parking.IN_TIME)*24),24)*lot.hourly_rate END
    ,parking.OUT_TIME
        FROM T7_PARKING_DETAILS parking JOIN T7_LOT_DETAILS lot ON lot.LOT_ID=parking.Lot_ID WHERE parking.OUT_TIME IS NOT NULL;
INSERT INTO T7_BILL_DETAILS
    SELECT TRANSACTION_ID,'Payment Done',AMOUNT,ROUND(STATUS_DATE) FROM T7_BILL_DETAILS WHERE TRANSACTION_ID IN (12348,12350,12345,12346);
INSERT INTO T7_BILL_DETAILS
    SELECT TRANSACTION_ID,'Offline Bill Sent',AMOUNT,STATUS_DATE+14 FROM T7_BILL_DETAILS WHERE TRANSACTION_ID NOT IN (12348,12350,12345,12346);
INSERT INTO T7_BILL_DETAILS
    SELECT TRANSACTION_ID,'Payment Done',AMOUNT,STATUS_DATE+2 FROM T7_BILL_DETAILS WHERE STATUS = 'Offline Bill Sent' AND TRANSACTION_ID = 12347;
INSERT INTO T7_BILL_DETAILS
    SELECT TRANSACTION_ID,'Payment Reminder 1',AMOUNT,STATUS_DATE+7 FROM T7_BILL_DETAILS WHERE STATUS = 'Offline Bill Sent' AND TRANSACTION_ID != 12347;
INSERT INTO T7_BILL_DETAILS
    SELECT TRANSACTION_ID,'Payment Done',AMOUNT,STATUS_DATE+1 FROM T7_BILL_DETAILS WHERE STATUS = 'Payment Reminder 1' AND TRANSACTION_ID = 12349;
INSERT INTO T7_BILL_DETAILS
    SELECT TRANSACTION_ID,'Payment Reminder 2',AMOUNT,STATUS_DATE+7 FROM T7_BILL_DETAILS WHERE STATUS = 'Payment Reminder 1' AND TRANSACTION_ID != 12349;
INSERT INTO T7_BILL_DETAILS
    SELECT TRANSACTION_ID,'To Collections',AMOUNT,STATUS_DATE+7 FROM T7_BILL_DETAILS WHERE STATUS = 'Payment Reminder 2';
