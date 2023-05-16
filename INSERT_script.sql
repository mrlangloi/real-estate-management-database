INSERT INTO Cust_Client VALUES (1000, 'Alex', 'Smith', 6041112222, '1234 No. 1 Road', 'Doctor');
INSERT INTO Cust_Client VALUES (1001, 'Indiana', 'Jones', NULL, '4321 No. 5 Road', 'Archaeologist');
INSERT INTO Cust_Client VALUES (1002, 'Ricky', 'Cheung', 6049998888, 'Unit 20, 5555 This St.', 'Student');
INSERT INTO Cust_Client VALUES (1003, 'Nota', 'Realperson', NULL, '9988 Notareal St.', NULL);
INSERT INTO Cust_Client VALUES (1004, 'John', 'Sequel', 7789871234, 'Unit 1, 1010 My SQ Lane', 'Data Analyst');

INSERT INTO Cust_Client_Dependents VALUES (1000, 'Smith', 'Alex', 7781112222);
INSERT INTO Cust_Client_Dependents VALUES (1003, 'Nota', 'Realdependent', 6043217890);
INSERT INTO Cust_Client_Dependents VALUES (1004, 'John', 'Prequel', 6041234789);

INSERT INTO Cust_Client_Buyer VALUES (1001);
INSERT INTO Cust_Client_Buyer VALUES (1002);
INSERT INTO Cust_Client_Buyer VALUES (1004);

INSERT INTO Cust_Client_Seller VALUES (1000);
INSERT INTO Cust_Client_Seller VALUES (1001);
INSERT INTO Cust_Client_Seller VALUES (1003);

INSERT INTO Cust_Client_Renter VALUES (1000, 100002);
INSERT INTO Cust_Client_Renter VALUES (1004, 100001);

INSERT INTO Property VALUES (2000, '1-Kitchen, Washer-Dryer Combo Studio', '4321 No.3 Road', 729450.00, '2022-05-22', 1000);
INSERT INTO Property_Condo VALUES (2000, 1200.55);
INSERT INTO Property VALUES (2006, '5-Bedroom, 2-Bathroom', '9999 Null Lane', 456789.00, '2018-10-10', 1002);
INSERT INTO Property_Condo VALUES(2006, 1600.00);

INSERT INTO Property VALUES (2001, '1870 Square Feet Riverfront', '1000 Outside Lane', 1700000.00, '2019-10-31', 1001);
INSERT INTO Property_Land VALUES (2001, 449.99);
INSERT INTO Property VALUES (2007, '100 Acre Woods', '1234 Pooh Ave.', 1000000.00, '2000-01-01', 1003);
INSERT INTO Property_Land VALUES (2007, 100.00);

INSERT INTO Property VALUES (2002, '2-Car Private Parking', '2000 This St.', 5555.00, '2020-01-01', 1004);
INSERT INTO Property_Parking VALUES (2002, 82.99);

INSERT INTO Property VALUES (2003, '10-Acre Ranch Farm', '3000 That St.', 75000.00, '2023-03-05', 1003);
INSERT INTO Property_Agriculture VALUES (2003, 350.89);

INSERT INTO Property VALUES (2004, 'Burnaby Recreational Centre', '100 W 49th Ave.', 5000000.00, '2021-12-31', 1004);
INSERT INTO Property_Recreational VALUES (2004, 4325.42);

INSERT INTO Property VALUES (2005, '3-Bedroom, 2-Bath Detached House', '4000 Other St.', 1200100.00, '2023-02-14', 1000);
INSERT INTO Property_DetachedHouse VALUES (2005, 825.29, 250.49);
INSERT INTO Property VALUES (2008, '2-Bedroom, 3-Bath Detached House', '4004 Other St.', 1231231.23, '2023-02-15', 1000);
INSERT INTO Property_DetachedHouse VALUES (2008, 800.00, 250.00);

INSERT INTO Property_Photos VALUES (2000, 1);
INSERT INTO Property_Photos VALUES (2000, 2);
INSERT INTO Property_Photos VALUES (2000, 3);
INSERT INTO Property_Photos VALUES (2000, 4);

INSERT INTO Property_Photos VALUES (2003, 1);
INSERT INTO Property_Photos VALUES (2003, 2);
INSERT INTO Property_Photos VALUES (2003, 3);

INSERT INTO Property_Photos VALUES (2004, 1);
INSERT INTO Property_Photos VALUES (2004, 2);
INSERT INTO Property_Photos VALUES (2004, 3);
INSERT INTO Property_Photos VALUES (2004, 4);
INSERT INTO Property_Photos VALUES (2004, 5);
INSERT INTO Property_Photos VALUES (2004, 6);

INSERT INTO Property_Photos VALUES (2005, 1);

INSERT INTO Realty_Company VALUES ('REMAX', 6042981600, '3096 Hastings St.');
INSERT INTO Realty_Company VALUES ('Century 21', 6046062100, '#500–1285 West Pender St.');
INSERT INTO Realty_Company VALUES ('Royal Lepage', 4163807500, '39 Wynford Drive');

INSERT INTO Agent VALUES (3000, 'John', 'Estate', 'johnestate@remax.com', 7781119999, '9876 House Rd.', 4, 'REMAX');
INSERT INTO Agent VALUES (3001, 'Jane', 'Estate', 'janeestate@remax.com', 6041119999, '6789 Home Ave.', 5, 'REMAX');
INSERT INTO Agent VALUES (3002, 'Foo', 'Bar', 'fbar@c21.ca', 6046046046, '6789 Foo Bar Lane', NULL, 'Century 21');
INSERT INTO Agent VALUES (3003, 'The', 'Champ', NULL, 7787787787, '9999 Champions Road', NULL, 'Royal Lepage');

INSERT INTO Bank VALUES ('TD', '7008 No. 3 Road');
INSERT INTO Bank VALUES ('Coast Capital Savings', '6253 No. 3 Road');
INSERT INTO Bank VALUES ('BMO', '100-6088 No. 3 Road');

INSERT INTO BuySell_Contract VALUES ('B0001', '2021-04-20', 1725000.00, 1002, 1001, 3000, 2001);
INSERT INTO BuySell_Contract VALUES ('B0002', '2022-02-14', 75000.00, 1001, 1003, 3001, 2003);
INSERT INTO BuySell_Contract VALUES ('B0003', '2023-02-15', 1300000.00, 1004, 1000, 3003, 2005);
INSERT INTO BuySell_Contract VALUES ('B0004', '2023-02-16', 800000.00, 1004, 1000, 3003, 2000);

INSERT INTO Rental_Contract VALUES ('R0001', 2300.00, 'Anita Rentee (Tenant)', '2022-06-29', '2022-12-29', 1000, 3003, 2000);
INSERT INTO Rental_Contract VALUES ('R0002', 1800.00, 'Joe Papa (Tenant)', '2023-03-14', '2023-09-14', 1000, 3003, 2005);

INSERT INTO Bank_Mortgages_BuySell_Contract VALUES ('TD', 'B0001', 1500000.00);
INSERT INTO Bank_Mortgages_BuySell_Contract VALUES ('Coast Capital Savings', 'B0002', 75000.00);
INSERT INTO Bank_Mortgages_BuySell_Contract VALUES ('BMO', 'B0003', 1150000.00);
