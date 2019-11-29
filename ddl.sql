SET default_storage_engine=InnoDB;

create table DimCustomer (
	Id int primary key auto_increment
    

	
);

create table DimSeller (
	Id int primary key auto_increment
    
    

);


create table DimProduct (
	Id int primary key auto_increment
    
    
   
);

create table DimStore (
	Id int primary key auto_increment
    
    
);

create table DimDate (
	Id int primary key auto_increment
    
    
);

create table FactSale (
	Id int primary key auto_increment,
    
    
    
	CustomerId int not null references DimCustomer(Id),
    SellerId int not null references DimSeller(Id),
    StoreId int not null references DimStore(Id),
    DateId int not null references DimDate(Id),
    ProductId int not null references DimProduct(Id)
);