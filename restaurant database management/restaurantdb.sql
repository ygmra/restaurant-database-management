CREATE DATABASE restaurantdb;
USE restaurantdb;

CREATE TABLE Customer(
CustomerID INT AUTO_INCREMENT PRIMARY KEY,
CustomerName VARCHAR(30) NOT NULL,
CustomerSurname VARCHAR(30) NOT NULL,
Gender VARCHAR(30),
Status VARCHAR(30),
WaiterID INT NOT NULL ,
FOREIGN KEY (WaiterID) REFERENCES Waiter(WaiterID),
CHECK(
(Select count(*) from Customer) <= (Select count(*) from Waiter ))


);



Alter Table Waiter
Add constraint Age_check CHECK(Birthyear < 2002 and Birthyear > 1966 );

INSERT INTO Waiter (WaiterName,WaiterSurname,Gender,Birthyear,Salary) VALUES ('Ali','Ford','Male',1964,2000);



CREATE TABLE Waiter(
WaiterID INT AUTO_INCREMENT PRIMARY KEY,
WaiterName VARCHAR(30) NOT NULL,
WaiterSurname VARCHAR(30) NOT NULL,
Gender VARCHAR(30),
Birthyear YEAR,
Salary INT
/*CHECK(
(Select Birthyear from Waiter) < 2002 )*/
);

INSERT INTO Waiter (WaiterName,WaiterSurname,Gender,Birthyear,Salary) VALUES (null,'Ally','Male',1964,1970);

CREATE TABLE Shift(
ShiftID INT AUTO_INCREMENT PRIMARY KEY,
Shift VARCHAR(30)
);

CREATE TABLE RelationShift(
RelationSID INT AUTO_INCREMENT PRIMARY KEY,
WaiterID INT NOT NULL ,
FOREIGN KEY (WaiterID) REFERENCES Waiter(WaiterID),
ShiftID INT,
FOREIGN KEY (ShiftID) REFERENCES Shift(ShiftID)
);

CREATE TABLE FoodType(
TypeID INT AUTO_INCREMENT PRIMARY KEY Check (TypeID IN (select TypeID from FoodNames)), /*value based*/
Type VARCHAR(30)
);

CREATE TABLE FoodNames(
FoodNamesID INT AUTO_INCREMENT PRIMARY KEY Check (FoodNamesID IN (select FoodNamesID from FoodAndBeverage)),
Name VARCHAR(30) NOT NULL,
Price INT NOT NULL,
TypeID INT NOT NULL,
FOREIGN KEY (TypeID) REFERENCES FoodType(TypeID)
);

CREATE TABLE FoodAndBeverage(
FoodAndBeverageID INT AUTO_INCREMENT PRIMARY KEY ,
FoodNamesID INT,
FOREIGN KEY (FoodNamesID) REFERENCES FoodNames(FoodNamesID),
ChefID INT,
FOREIGN KEY (ChefID) REFERENCES Chef(ChefID)

 
);



CREATE TABLE Chef(    
ChefID INT AUTO_INCREMENT PRIMARY KEY,
ChefName VARCHAR(30),
ChefSurname VARCHAR(30),
Gender VARCHAR(30),
Birthyear YEAR,
Salary INT CHECK (Salary > 1500),
CHECK(
(Select max(Salary) from Chef) < 10.000 )
);

CREATE TABLE Tables(
TableID INT AUTO_INCREMENT PRIMARY KEY,
TableCapacity INT CHECK (TableCapacity < 6 and TableCapacity >1)

);

CREATE TABLE	RelationTableCust(
RelationTID INT AUTO_INCREMENT PRIMARY KEY,
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
TableID INT,
FOREIGN KEY (TableID) REFERENCES Tables(TableID)
);

CREATE TABLE Orders(
orderID INT AUTO_INCREMENT PRIMARY KEY,
Orderday VARCHAR(30),
Product_quantity INT CHECK (Product_quantity >0), /*tuple based check */
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)

);


CREATE TABLE Bill(
BillID INT AUTO_INCREMENT PRIMARY KEY,
DayOfBill VARCHAR(30),
OrderID INT,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Languages( 
LanguageID INT AUTO_INCREMENT PRIMARY KEY CHECK (LanguageID IN (select LanguageID from RelationLangWaiter )),/*value*/
Language VARCHAR(30)
);

CREATE TABLE 	RelationLangWaiter( 
RelationLangWaiterID INT AUTO_INCREMENT PRIMARY KEY,
WaiterID INT,
FOREIGN KEY (WaiterID) REFERENCES Waiter(WaiterID),
LanguageID INT,
FOREIGN KEY (LanguageID) REFERENCES Languages(LanguageID)
);


CREATE Trigger raise
before INSERT
ON FoodNames
for each row
SET new.Price=new.Price*(1.1);

INSERT INTO FoodNames(Name,Price,TypeID)VALUES('Kadayıf',12,1);

CREATE Trigger letter
before UPDATE
ON Waiter
for each row
SET new.WaiterSurname=UPPER(new.WaiterSurname);

UPDATE Waiter
SET Salary=3600 Where WaiterID=4;



INSERT INTO Customer (CustomerName,CustomerSurname,Gender,Status,WaiterID)VALUES('Bella','Andy','Female','Student',2);
INSERT INTO RelationLangWaiter(WaiterID,LanguageID)VALUES(1,2);
INSERT INTO Orders (OrderDate,Product_quantity,CustomerID)VALUES('Wednesday',5,8);

SET SQL_SAFE_UPDATES=0;
Update Tables  
Set TableCapacity=5 where TableID<3;

SET SQL_SAFE_UPDATES=0;
Update Waiter
Set Salary=4000 where Salary>3000 and Birthyear<1990;

SET SQL_SAFE_UPDATES=0;
Update FoodNames
Set Price = Price + 5 where TypeID =1 and TypeID =3;



ALTER TABLE FoodNames
ADD size VARCHAR(30);

ALTER TABLE Waiter
MODIFY COLUMN Birthyear DATE;

ALTER TABLE Customer
DROP Column Status;

Select * from restaurantdb.Customer inner join restaurantdb.Waiter on Customer.WaiterID=Waiter.WaiterID order by Customer.CustomerID;


Select * from restaurantdb.Customer left join restaurantdb.Orders on Customer.CustomerID=Orders.OrderID order by Customer.CustomerID;



Select * from restaurantdb.Orders right join restaurantdb.Customer on Customer.CustomerID=Orders.OrderID order by Customer.CustomerID;




Select * from restaurantdb.Customer left join restaurantdb.Orders on Customer.CustomerID=Orders.OrderID 
UNION All
Select * from restaurantdb.Orders right join restaurantdb.Customer on Customer.CustomerID=Orders.OrderID order by Customer.CustomerID;


CREATE INDEX table_cap on Tables(TableID,TableCapacity);
CREATE INDEX cust_table on RelationTableCust(RelationID);
CREATE INDEX cust_sta on Customer(CustomerName,Status);

INSERT INTO Shift(Shift) VALUES ('Morning');
INSERT INTO Shift(Shift) VALUES ('Night');

INSERT INTO RelationShift(WaiterID,ShiftID) VALUES (1,1);
INSERT INTO RelationShift(WaiterID,ShiftID) VALUES (2,2);
INSERT INTO RelationShift(WaiterID,ShiftID) VALUES (3,2);
INSERT INTO RelationShift(WaiterID,ShiftID) VALUES (4,1);
INSERT INTO RelationShift(WaiterID,ShiftID) VALUES (5,1);
INSERT INTO RelationShift(WaiterID,ShiftID) VALUES (6,2);
INSERT INTO RelationShift(WaiterID,ShiftID) VALUES (7,2);
INSERT INTO RelationShift(WaiterID,ShiftID) VALUES (8,1);
INSERT INTO RelationShift(WaiterID,ShiftID) VALUES (9,1);
INSERT INTO RelationShift(WaiterID,ShiftID) VALUES (10,1);

INSERT INTO Languages(Language) VALUES ('English');
INSERT INTO Languages(Language) VALUES ('German');
INSERT INTO Languages(Language) VALUES ('Spanish');
INSERT INTO Languages(Language) VALUES ('Turkish');

INSERT INTO RelationLangWaiter(WaiterID,LanguageID) VALUES (1,1);
INSERT INTO RelationLangWaiter(WaiterID,LanguageID) VALUES (2,3);
INSERT INTO RelationLangWaiter(WaiterID,LanguageID) VALUES (3,1);
INSERT INTO RelationLangWaiter(WaiterID,LanguageID) VALUES (4,3);
INSERT INTO RelationLangWaiter(WaiterID,LanguageID) VALUES (5,1);
INSERT INTO RelationLangWaiter(WaiterID,LanguageID) VALUES (6,2);
INSERT INTO RelationLangWaiter(WaiterID,LanguageID) VALUES (7,3);
INSERT INTO RelationLangWaiter(WaiterID,LanguageID) VALUES (8,3);
INSERT INTO RelationLangWaiter(WaiterID,LanguageID) VALUES (9,1);
INSERT INTO RelationLangWaiter(WaiterID,LanguageID) VALUES (10,2);

INSERT INTO FoodAndBeverage(FoodNamesID,ChefID) VALUES (1,1);
INSERT INTO FoodAndBeverage(FoodNamesID,ChefID) VALUES (2,2);
INSERT INTO FoodAndBeverage(FoodNamesID,ChefID) VALUES (9,3);
INSERT INTO FoodAndBeverage(FoodNamesID,ChefID) VALUES (10,4);
INSERT INTO FoodAndBeverage(FoodNamesID,ChefID) VALUES (5,5);
INSERT INTO FoodAndBeverage(FoodNamesID,ChefID) VALUES (6,6);
INSERT INTO FoodAndBeverage(FoodNamesID,ChefID) VALUES (7,7);
INSERT INTO FoodAndBeverage(FoodNamesID,ChefID) VALUES (8,8);
INSERT INTO FoodAndBeverage(FoodNamesID,ChefID) VALUES (3,9);
INSERT INTO FoodAndBeverage(FoodNamesID,ChefID) VALUES (4,10);

INSERT INTO Orders(OrderDay,Product_quantity,CustomerID)VALUES('Monday',2,1);
INSERT INTO Orders(OrderDay,Product_quantity,CustomerID)VALUES('Wednesday',2,2);
INSERT INTO Orders(OrderDay,Product_quantity,CustomerID)VALUES('Saturday',1,3);
INSERT INTO Orders(OrderDay,Product_quantity,CustomerID)VALUES('Sunday',2,6);
INSERT INTO Orders(OrderDay,Product_quantity,CustomerID)VALUES('Tuesday',3,7);


INSERT INTO Orders(OrderDay,Product_quantity,CustomerID)VALUES('Tuesday',0,7);

INSERT INTO Bill(DayOfBill,OrderID)VALUES('Monday',1);
INSERT INTO Bill(DayOfBill,OrderID)VALUES('Tuesday',5);
INSERT INTO Bill(DayOfBill,OrderID)VALUES('Wednesday',2);
INSERT INTO Bill(DayOfBill,OrderID)VALUES('Saturday',3);
INSERT INTO Bill(DayOfBill,OrderID)VALUES('Sunday',4);




ALTER TABLE Tables
ADD constraint capacity CHECK(TableCapacity <8);

INSERT INTO Tables(TableCapacity)VALUES(10);




INSERT INTO FoodNames(Name,Price,TypeID)VALUES('Supangle',15,1);
INSERT INTO FoodNames(Name,Price,TypeID)VALUES('Magnolia',12,1);
INSERT INTO FoodNames(Name,Price,TypeID)VALUES('Baklava',25,1);
INSERT INTO FoodNames(Name,Price,TypeID)VALUES('Waffle',14,1);
INSERT INTO FoodNames(Name,Price,TypeID)VALUES('Pizza',20,2);
INSERT INTO FoodNames(Name,Price,TypeID)VALUES('Hot Chocolate',7,3);
INSERT INTO FoodNames(Name,Price,TypeID)VALUES('Hamburger',13,2);
INSERT INTO FoodNames(Name,Price,TypeID)VALUES('Water',1.5,3);
INSERT INTO FoodNames(Name,Price,TypeID)VALUES('Cola',3,3);
INSERT INTO FoodNames(Name,Price,TypeID)VALUES('Lemonade',4,3);


INSERT INTO FoodType(Type)VALUES('Dessert');
INSERT INTO FoodType(Type)VALUES('Main Dish');
INSERT INTO FoodType(Type)VALUES('Drinks');

INSERT INTO Tables(TableCapacity)VALUES(4);
INSERT INTO Tables(TableCapacity)VALUES(3);
INSERT INTO Tables(TableCapacity)VALUES(2); /* we have check constraint that table capacity >1 this is not acceptable*/
INSERT INTO Tables(TableCapacity)VALUES(4);
INSERT INTO Tables(TableCapacity)VALUES(2);

INSERT INTO RelationTableCust(CustomerID,TableID)VALUES(1,1);
INSERT INTO RelationTableCust(CustomerID,TableID)VALUES(2,1);
INSERT INTO RelationTableCust(CustomerID,TableID)VALUES(3,2);
INSERT INTO RelationTableCust(CustomerID,TableID)VALUES(4,2);
INSERT INTO RelationTableCust(CustomerID,TableID)VALUES(5,3);
INSERT INTO RelationTableCust(CustomerID,TableID)VALUES(6,4);
INSERT INTO RelationTableCust(CustomerID,TableID)VALUES(7,4);
INSERT INTO RelationTableCust(CustomerID,TableID)VALUES(8,4);
INSERT INTO RelationTableCust(CustomerID,TableID)VALUES(9,5);
INSERT INTO RelationTableCust(CustomerID,TableID)VALUES(10,5);

INSERT INTO Customer (CustomerName,CustomerSurname,Gender,Status,WaiterID) VALUES ('Ali','Anderson','Male','Doctor',1);
INSERT INTO Customer (CustomerName,CustomerSurname,Gender,Status,WaiterID) VALUES ('Emily','Staub','Female','Student',3);
INSERT INTO Customer (CustomerName,CustomerSurname,Gender,Status,WaiterID) VALUES ('Mark','Jonas','Female','Engineer',5);
INSERT INTO Customer (CustomerName,CustomerSurname,Gender,Status,WaiterID) VALUES ('Lily','Jones','Female','Nurse',6);
INSERT INTO Customer (CustomerName,CustomerSurname,Gender,Status,WaiterID) VALUES ('Spencer','Jp','Male','Dentist',7);
INSERT INTO Customer (CustomerName,CustomerSurname,Gender,Status,WaiterID) VALUES ('George','Joe','Male','Policeman',8);
INSERT INTO Customer (CustomerName,CustomerSurname,Gender,Status,WaiterID) VALUES ('Mary','Damon','Female','Artist',9);
INSERT INTO Customer (CustomerName,CustomerSurname,Gender,Status,WaiterID) VALUES ('Anthony','Jack','Male','Fireman',10);
INSERT INTO Customer (CustomerName,CustomerSurname,Gender,Status,WaiterID) VALUES ('Hailey','Smith','Female','Writer',10);
INSERT INTO Customer (CustomerName,CustomerSurname,Gender,Status,WaiterID) VALUES ('Sally','Kally','Female','Teacher',3);

INSERT INTO Waiter (WaiterName,WaiterSurname,Gender,Birthyear,Salary) VALUES ('Mark','Jp','Female',1998,2000);
INSERT INTO Waiter (WaiterName,WaiterSurname,Gender,Birthyear,Salary) VALUES ('Lily','Joe','Female',1990,2500);
INSERT INTO Waiter (WaiterName,WaiterSurname,Gender,Birthyear,Salary) VALUES ('Spencer','Jones','Male',1992,3500);
INSERT INTO Waiter (WaiterName,WaiterSurname,Gender,Birthyear,Salary) VALUES ('George','Anderson','Male',1978,3000);
INSERT INTO Waiter (WaiterName,WaiterSurname,Gender,Birthyear,Salary) VALUES ('Mary','Staub','Female',1991,2600);
INSERT INTO Waiter (WaiterName,WaiterSurname,Gender,Birthyear,Salary) VALUES ('Anthony','Jonas','Male',1989,3800);
INSERT INTO Waiter (WaiterName,WaiterSurname,Gender,Birthyear,Salary) VALUES ('Hailey','Jack','Female',1973,3200);
INSERT INTO Waiter (WaiterName,WaiterSurname,Gender,Birthyear,Salary) VALUES ('Sally','Smith','Female',1988,2200);
INSERT INTO Waiter (WaiterName,WaiterSurname,Gender,Birthyear,Salary) VALUES ('Ali','Kally','Male',2000,2100);
INSERT INTO Waiter (WaiterName,WaiterSurname,Gender,Birthyear,Salary) VALUES ('Emily','Damon','Female',2001,3700);

INSERT INTO Chef (ChefName,ChefSurname,Gender,Birthyear,Salary) VALUES ('Mark','Jp','Male',1998,2500);
INSERT INTO Chef (ChefName,ChefSurname,Gender,Birthyear,Salary) VALUES ('Lily','Joe','Female',1990,3000);
INSERT INTO Chef(ChefName,ChefSurname,Gender,Birthyear,Salary) VALUES ('Spencer','Jones','Male',1992,3200);
INSERT INTO Chef(ChefName,ChefSurname,Gender,Birthyear,Salary) VALUES ('George','Anderson','Male',1978,3300);
INSERT INTO Chef(ChefName,ChefSurname,Gender,Birthyear,Salary) VALUES ('Mary','Staub','Female',1991,3500);
INSERT INTO Chef(ChefName,ChefSurname,Gender,Birthyear,Salary) VALUES ('Anthony','Jp','Male',1989,2550);
INSERT INTO Chef(ChefName,ChefSurname,Gender,Birthyear,Salary) VALUES ('Hailey','Jonas','Female',1973,3400);
INSERT INTO Chef(ChefName,ChefSurname,Gender,Birthyear,Salary) VALUES ('Harry','Jack','Male',1988,3250);
INSERT INTO Chef(ChefName,ChefSurname,Gender,Birthyear,Salary) VALUES ('Sally','Smith','Female',2000,2000);
INSERT INTO Chef(ChefName,ChefSurname,Gender,Birthyear,Salary) VALUES ('Ali','Kally','Male',1998,2100);





INSERT INTO Chef(ChefName,ChefSurname,Gender,Birthyear,Salary) VALUES ('Ali','Kally','Male',1998,1300);

INSERT INTO RelationTableCust(CustomerID,TableID) VALUES (1,1);
INSERT INTO RelationTableCust(CustomerID,TableID) VALUES (2,1);
INSERT INTO RelationTableCust(CustomerID,TableID) VALUES (3,2);
INSERT INTO RelationTableCust(CustomerID,TableID) VALUES (4,2);
INSERT INTO RelationTableCust(CustomerID,TableID) VALUES (5,3);
INSERT INTO RelationTableCust(CustomerID,TableID) VALUES (6,4);
INSERT INTO RelationTableCust(CustomerID,TableID) VALUES (7,4);
INSERT INTO RelationTableCust(CustomerID,TableID) VALUES (8,4);
INSERT INTO RelationTableCust(CustomerID,TableID) VALUES (9,5);
INSERT INTO RelationTableCust(CustomerID,TableID) VALUES (10,5);

Select Gender, count(*) from restaurantdb.Waiter group by Gender;

Select TypeID, sum(Price) as ‘totalPrice’ from restaurantdb.FoodNames group by TypeID;
	Select WaiterID, WaiterName as ‘Waiterinfo’ from restaurantdb.Waiter order by Salary desc;






