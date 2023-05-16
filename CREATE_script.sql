/* since Client is already a MySQL keyword, I had to change the name to Cust_Client */

/* majority of the script runs fine in MS SQL Server except we come across an issue with the ON DELETE CASCADE constraints on table 'BuySell_Contract' */
/* for this, changing the ON DELETE CASCADE to ON DELETE NO ACTION bypasses the error for MS SQL Server */

CREATE TABLE Cust_Client(
	ClientID INT,
    FirstName VARCHAR(16) NOT NULL,
    LastName VARCHAR(16) NOT NULL,
    PhoneNum CHAR(10),
    Address VARCHAR(50) NOT NULL,
    Occupation VARCHAR(16),
    
    PRIMARY KEY (ClientID)
);

CREATE TABLE Cust_Client_Dependents(
	ClientID INT,
    FirstName VARCHAR(16) NOT NULL,
    LastName VARCHAR(16) NOT NULL,
    PhoneNum CHAR(10),
    
    PRIMARY KEY (ClientID, FirstName, LastName),
    FOREIGN KEY (ClientID) REFERENCES Cust_Client (ClientID) ON DELETE CASCADE
);

CREATE TABLE Cust_Client_Buyer(
	ClientID INT,
    
    PRIMARY KEY (ClientID),
    FOREIGN KEY (ClientID) REFERENCES Cust_Client (ClientID) ON DELETE CASCADE
);

CREATE TABLE Cust_Client_Seller(
	ClientID INT,
    
    PRIMARY KEY (ClientID),
    FOREIGN KEY (ClientID) REFERENCES Cust_Client (ClientID) ON DELETE CASCADE
);

CREATE TABLE Cust_Client_Renter(
	ClientID INT,
    RentalLicense INT NOT NULL,
    
    PRIMARY KEY (ClientID),
    FOREIGN KEY (ClientID) REFERENCES Cust_Client (ClientID) ON DELETE CASCADE
);

CREATE TABLE Property(
	PropertyID INT,
    PropertyDescription VARCHAR(50),
    Address VARCHAR(50) NOT NULL,
    Price NUMERIC(10, 2) NOT NULL, /* Properties can be priced up to $99,999,999.99 (10 digits, 2 decimal points) */
    ListedSince DATE NOT NULL,
    OwnerClientID INT NOT NULL,
    
    PRIMARY KEY (PropertyID),
    FOREIGN KEY (OwnerClientID) REFERENCES Cust_Client (ClientID) ON DELETE CASCADE
);

CREATE TABLE Property_Photos(
	PropertyID INT,
    Photos SMALLINT, /* we won't actually upload photos so we can pretend each int is a photo */
    
    PRIMARY KEY (PropertyID, Photos),
    FOREIGN KEY (PropertyID) REFERENCES Property (PropertyID) ON DELETE CASCADE
);

CREATE TABLE Property_Condo(
	PropertyID INT,
    StrataFee NUMERIC(6, 2), /* Fees can be priced up to $9,999.99 (6 digits, 2 decimal points) */
    
    PRIMARY KEY(PropertyID),
    FOREIGN KEY (PropertyID) REFERENCES Property (PropertyID) ON DELETE CASCADE
); 

CREATE TABLE Property_Land(
	PropertyID INT,
    InsuranceFee NUMERIC(6, 2),
    
    PRIMARY KEY(PropertyID),
    FOREIGN KEY (PropertyID) REFERENCES Property (PropertyID) ON DELETE CASCADE
); 

CREATE TABLE Property_Parking(
	PropertyID INT,
    ParkingTaxRate NUMERIC(6, 2),
    
    PRIMARY KEY(PropertyID),
    FOREIGN KEY (PropertyID) REFERENCES Property (PropertyID) ON DELETE CASCADE
);

CREATE TABLE Property_Agriculture(
	PropertyID INT,
    FarmLandFee NUMERIC(6, 2),
    
    PRIMARY KEY(PropertyID),
    FOREIGN KEY (PropertyID) REFERENCES Property (PropertyID) ON DELETE CASCADE
);

CREATE TABLE Property_Recreational(
	PropertyID INT,
    RecPropertyFee NUMERIC(6, 2),
    
    PRIMARY KEY(PropertyID),
    FOREIGN KEY (PropertyID) REFERENCES Property (PropertyID) ON DELETE CASCADE
);

CREATE TABLE Property_DetachedHouse(
	PropertyID INT,
    PropertyTax NUMERIC(6, 2),
    UtilityFee NUMERIC(6, 2),
    
    PRIMARY KEY(PropertyID),
    FOREIGN KEY (PropertyID) REFERENCES Property (PropertyID) ON DELETE CASCADE
);

CREATE TABLE Realty_Company(
	RealtyCompanyName VARCHAR(32),
    PhoneNum CHAR(10),
    Address VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (RealtyCompanyName)
);

CREATE TABLE Agent(
	AgentLicenseNum INT,
    FirstName VARCHAR(16) NOT NULL,
    LastName VARCHAR(16) NOT NULL,
    Email VARCHAR(32),
    PhoneNum CHAR(10),
    Address VARCHAR(50) NOT NULL,
    YearsOfExp SMALLINT,
    RealtyCompanyName VARCHAR(32),
    
    PRIMARY KEY (AgentLicenseNum),
    FOREIGN KEY (RealtyCompanyName) REFERENCES Realty_Company (RealtyCompanyName) ON DELETE CASCADE
);

CREATE TABLE Bank(
	BankName VARCHAR(32),
    Address VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (BankName)
);

CREATE TABLE BuySell_Contract(
	BuySellContractID CHAR(5), /* B0001, B0002, B0003, etc. so we can distinguish between BuySellContractID and RentContractID */
    SignDate DATE NOT NULL,
    PurchaseAmount NUMERIC(10, 2),
    BuyerClientID INT,
    SellerClientID INT,
    AgentLicenseNum INT,
    PropertyID INT,
    
    PRIMARY KEY (BuySellContractID),
    FOREIGN KEY (BuyerClientID) REFERENCES Cust_Client_Buyer (ClientID) ON DELETE CASCADE, 
    FOREIGN KEY (SellerClientID) REFERENCES Cust_Client_Seller (ClientID) ON DELETE CASCADE,
    FOREIGN KEY (AgentLicenseNum) REFERENCES Agent (AgentLicenseNum) ON DELETE CASCADE,
    FOREIGN KEY (PropertyID) REFERENCES Property (PropertyID) ON DELETE CASCADE
);

CREATE TABLE Rental_Contract(
	RentContractID CHAR(5), /* R0001, R0002, R0003 */
    RentAmount NUMERIC(6, 2),
    TenantInfo VARCHAR(50) NOT NULL,
    RentStartDate DATE NOT NULL,
    RentEndDate DATE NOT NULL,
    RenterClientID INT,
    AgentLicenseNum INT,
    PropertyID INT,
    
    PRIMARY KEY (RentContractID),
    FOREIGN KEY (RenterClientID) REFERENCES Cust_Client_Renter (ClientID) ON DELETE CASCADE,
    FOREIGN KEY (AgentLicenseNum) REFERENCES Agent (AgentLicenseNum) ON DELETE CASCADE,
    FOREIGN KEY (PropertyID) REFERENCES Property (PropertyID) ON DELETE CASCADE
);

CREATE TABLE Bank_Mortgages_BuySell_Contract(
	BankName VARCHAR(32),
    BuySellContractID CHAR(5),
    MortgageAmount NUMERIC(10, 2),
    
    PRIMARY KEY (BankName, BuySellContractID),
    FOREIGN KEY (BankName) REFERENCES Bank (BankName) ON DELETE CASCADE,
    FOREIGN KEY (BuySellContractID) REFERENCES BuySell_Contract (BuySellContractID) ON DELETE CASCADE
);