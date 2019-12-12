create table DimCustomer (
	Id int primary key CLUSTERED ,
    FirstName nvarchar(250),
    LastName nvarchar(250),
    CountryFrenchName nvarchar(250),
    CountryEnglishName nvarchar(250),
	CityFrenchName nvarchar(250),
	CItyEnglishName nvarchar(250)
    
);

create table DimSeller (
	Id int primary key CLUSTERED ,
    
    FirstName nvarchar(250),
    LastName nvarchar(250)
);


create table DimProduct (
	Id int primary key CLUSTERED ,
    
	ProductFrenchName nvarchar(250),
    ProductEnglishName nvarchar(250),
    CategoryFrenchName nvarchar(250),
    CategoryEnglishName nvarchar(250)
);

create table DimStore (
	Id int primary key CLUSTERED ,
    
    Name nvarchar(250),
    Size int  /* Superfice : qunatité de ventes ? */
);

create table DimDate (
	Id int primary key CLUSTERED ,
    
    FullDate date,
    Day int,
    Week int,
    Month int,
    Year int,
    
    DayFrenchName nvarchar(250),
    DayEnglishName nvarchar(250),
    MonthFrenchName nvarchar(250),
    MonthEnglishName nvarchar(250)    
);

create table FactSale (
	Id int primary key CLUSTERED ,
    
    UnitPrice decimal(5,2),
    Quantity int,
    Discount decimal(4,2),
    TotalPrice decimal (10,2),
    
	CustomerId int not null references DimCustomer(Id),
    SellerId int not null references DimSeller(Id),
    StoreId int not null references DimStore(Id),
    DateId int not null references DimDate(Id),
    ProductId int not null references DimProduct(Id)
);