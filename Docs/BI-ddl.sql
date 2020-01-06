
USE [DataWarehouse]
GO



DROP TABLE FactSale
GO

DROP TABLE DimCustomer
GO

DROP TABLE DimDate
GO

DROP TABLE DimProduct
GO

DROP TABLE DimSeller
GO






create table DimCustomer (
	Id int identity,
	Customer nvarchar(255) ,
	CompanyName nvarchar(255),
	ContactName nvarchar(255),
	ContactTitle nvarchar(255),
	Adress nvarchar(255),
	City nvarchar(255),
	Region nvarchar(255),
	PostalCode nvarchar(255),
	Country nvarchar(255),
	Phone nvarchar(255),
	Fax nvarchar(255)
	
    constraint DimCustomer_Id_Pk primary key(Id)
);

create table DimSeller (
	Id int  identity,
    LastName nvarchar(255),
    FirstName nvarchar(255),
	Title nvarchar(255),
	TitleOfCourtesy nvarchar(255),
	Adress nvarchar(255),
	City nvarchar(255),
	Region nvarchar(255),
	PostalCode nvarchar (255),
	Country nvarchar(255),
	ReportsTo int,
	HomePhone nvarchar(255),
	Extension nvarchar(255),
	Notes ntext,
	TerritoryDescription nvarchar(255),
	RegionDescription nvarchar(255),
	PhotoPath nvarchar(255),
	
	
	constraint DimSeller_Id_Pk primary key(Id)

);


create table DimProduct (
	Id int identity,
    Product int,
	Name nvarchar(255),
	SupplierCompanyName nvarchar(255),
	SupplierContactName nvarchar(255),
	SupplierContactTitle nvarchar(255),
	SupplierAdress nvarchar(255),
	SupplierCity nvarchar(255),
	SupplierRegion nvarchar(255),
	SupplierPostal nvarchar(255),
	SupplierCountry nvarchar(255),
	SupplierPhone nvarchar(255),
	SupplierFax nvarchar(255),
	SupplierHomePage ntext,
	CategoryName nvarchar(255),
	CategoryDescription ntext,
	QuantityPerUnit nvarchar(255),
	UnitPrice money,
	UnitsInStock smallInt,
	UnitsOnOrder smallInt,
	ReorderLevel smallInt,
	Discontinued bit,
	
	constraint DimProduct_Id_Pk primary key(Id)

);


create table DimDate (
	Id int  identity,
	Date datetime,
	DayNumber int,
	WeekNumber int,
	MonthNumber int,
	YearNumber int,
	DayFrenchName nvarchar(255),
    DayEnglishName nvarchar(255),
    MonthFrenchName nvarchar(255),
    MonthEnglishName nvarchar(255),
    DayOfWeekNumber nvarchar(255),
    DayOfYearNumber nvarchar(255)
	
	constraint DimDate_Id_Pk primary key(Id)
);

create table FactSale (
	Id int  identity ,
	OrderNum int,
    Product int,
    UnitPrice decimal(5,2),
    Quantity int,
    Discount decimal(4,2),
    TotalPrice decimal (10,2),
	TotalPriceWithDiscount decimal (10,2),
	Mark nvarchar(255),
	ShipperCompanyName nvarchar(255),
	ShipperPhone nvarchar(255),
	Freight  money,
	ShipName nvarchar(255),
	ShipAdress nvarchar(255),
	ShipCity nvarchar (255),
	ShipRegion nvarchar(255),
	ShipPostalCode nvarchar(255),
	ShipCountry nvarchar(255),
	IsOnline bit,
	Customer int,
	DateSale int,
	Seller int,
	
	
	constraint FactSale_Id_Pk primary key(Id)
);

alter table FactSale add constraint Customer_FK
     foreign key (Customer)
     references DimCustomer
	 
alter table FactSale add constraint DateSale_FK
     foreign key (DateSale)
     references DimDate
	 
alter table FactSale add constraint Product_FK
     foreign key (Product)
     references DimProduct
	 
alter table FactSale add constraint Seller_FK
     foreign key (Seller)
     references DimSeller

ALTER TABLE DimSeller  WITH NOCHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([ReportsTo])
REFERENCES DimSeller (Id)