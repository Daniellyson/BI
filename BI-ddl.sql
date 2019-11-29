SET default_storage_engine=InnoDB;

create table DimCustomer (
	Id int primary key auto_increment,
    FirstName varchar(250),
    LastName varchar(250),
    CountryFrenchName varchar(250),
    CountryEnglishName varchar(250),
	CityFrenchName varchar(250),
	CItyEnglishName varchar(250)
    
);

create table DimSeller (
	Id int primary key auto_increment,
    
    FirstName varchar(250),
    LastName varchar(250)
);


create table DimProduct (
	Id int primary key auto_increment,
    
	ProductFrenchName varchar(250),
    ProductEnglishName varchar(250),
    CategoryFrenchName varchar(250),
    CategoryEnglishName varchar(250)
);

create table DimStore (
	Id int primary key auto_increment,
    
    Name varchar(250),
    Size int(10) /* Superfice : qunatité de ventes ? */
);

create table DimDate (
	Id int primary key auto_increment,
    
    FullDate date,
    Day int,
    Week int,
    Month int,
    Year int,
    
    DayFrenchName varchar(250),
    DayEnglishName varchar(250),
    MonthFrenchName varchar(250),
    MonthEnglishName varchar(250)    
);

create table FactSale (
	Id int primary key auto_increment,
    
    UnitPrice decimal(5,2),
    Quantity int(3),
    TotalPrice decimal (10,2),
    
	CustomerId int not null references DimCustomer(Id),
    SellerId int not null references DimSeller(Id),
    StoreId int not null references DimStore(Id),
    DateId int not null references DimDate(Id),
    ProductId int not null references DimProduct(Id)
);