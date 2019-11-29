create table DimCustomer (
	Id int primary key auto_increment
    

	
) ENGINE=INNODB;

create table DimSeller (
	Id int primary key auto_increment
    
    

) ENGINE=INNODB;


create table DimProduct (
	Id int primary key auto_increment
    
    
   
)ENGINE=INNODB;

create table DimStore (
	Id int primary key auto_increment
    
    
)ENGINE=INNODB;

create table DimDate (
	Id int primary key auto_increment
    
    
)ENGINE=INNODB;

create table FactSale (
	Id int primary key auto_increment,
    
    
    
	CustomerId int not null references DimCustomer(Id),
    SellerId int not null references DimSeller(Id),
    StoreId int not null references DimStore(Id),
    DateId int not null references DimDate(Id),
    ProductId int not null references DimProduct(Id)
)ENGINE=INNODB;