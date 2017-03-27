use master;

drop Database Dunder;

create Database Dunder;

use Dunder;

--Primära tabeller

create table Customers(
ID int identity(1, 1) primary key,
Username varchar(50) not null,
Firstname varchar(50) not null,
Lastname varchar(50) not null,
Secretword varchar(50) not null,
IsCompany bit not null,
PhoneNr varchar(50),
Email varchar(50) not null,
IsAdmin bit not null,
IsActive bit default 1,
)

create table Addresses(
ID int identity(1, 1) primary key,
Street varchar(50) not null,
FloorNr varchar(50),
DoorCode varchar(50),
City varchar(50) not null,
ZipCode varchar(50) not null,
)

create table FreightForwarders(
ID int identity(1, 1) primary key,
FFName varchar(50) not null,
ShippingCost money not null,
DeliveryTime int not null,
IsActive bit default 1
)

create table VAT(
ID int identity(1, 1) primary key,
Category varchar(50) not null,
Rate money not null,
)

create table Products(
ID int identity(1, 1) primary key,
Name varchar(50) not null,
ItemNumber varchar(50) not null,
NetPrice money not null,
Picture varbinary(max),
ItemInfo varchar(8000),
NrInStock int not null,
VATID int foreign key references VAT(ID) not null,
IsActive bit not null,
)

create table Categories(
ID int identity(1, 1) primary key,
Name varchar(50) not null,
ParentID int,
)

create table Orders(
ID int identity(199, 19) primary key,
CustomerID int foreign key references Customers(ID) not null,
OrderDate date not null,
StatusConfirmed bit default 0,
StatusShipped bit default 0,
StatusDelivered bit default 0,
FreighterID int foreign key references FreightForwarders(ID) not null,
ShippingAddressID int foreign key references Addresses(ID) not null,
InvoiceAddressID int foreign key references Addresses(ID) not null,
)

--Kopplingstabeller:

create table CustomersToAddresses(
ID int identity(1, 1) primary key,
CUID int foreign key references Customers(ID) not null,
AID int foreign key references Addresses(ID) not null,
)

create table OrdersToProducts(
ID int identity(1, 1) primary key,
OID int foreign key references Orders(ID) not null,
PID int foreign key references Products(ID) not null,
NetPrice money not null,
VAT money not null,
ProductAmount int not null,
)

create table ProductsToCategories(
ID int identity(1, 1) primary key,
CAID int foreign key references Categories(ID) not null,
PID int foreign key references Products(ID) not null,
)

--Skapar n姲a random v䲤en

insert into VAT(Category, Rate) values ('Standard', 0.25);
insert into VAT(Category, Rate) values ('Book', 0.06);

insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Stol 1', '123456', 1100, 300, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Stol 2', '123457', 900, 1000, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Stol 3', '123458', 1300, 900, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Stol 4', '123459', 700, 120, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Lampa 1', '123460', 500, 300, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Lampa 2', '123461', 700, 1000, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Lampa 3', '123462', 300, 900, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Gem 1', '123463', 1, 10000, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Gem 2', '123464', 1, 25000, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Gem 3', '123465', 2, 100000, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Gem 4', '123466', 5, 250000, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Sax 1', '123467', 35, 775, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Sax 2', '123468', 75, 355, 1, 1);

insert into Categories(Name) values ('Möbler');
insert into Categories(Name) values ('Belysning');
insert into Categories(Name) values ('Tillbehör');
insert into Categories(Name, ParentID) values ('Stolar', 1);
insert into Categories(Name, ParentID) values ('Bord', 1);
insert into Categories(Name, ParentID) values ('Bordlampor', 2);
insert into Categories(Name, ParentID) values ('Taklampor', 2);
insert into Categories(Name, ParentID) values ('Gem', 3);
insert into Categories(Name, ParentID) values ('Saxar', 3);
insert into Categories(Name, ParentID) values ('Plastgem', 8);
insert into Categories(Name, ParentID) values ('Metallgem', 8);

insert into ProductsToCategories(PID, CAID) values (1, 3);
insert into ProductsToCategories(PID, CAID) values (2, 3);
insert into ProductsToCategories(PID, CAID) values (3, 3);
insert into ProductsToCategories(PID, CAID) values (4, 3);
insert into ProductsToCategories(PID, CAID) values (5, 6);
insert into ProductsToCategories(PID, CAID) values (6, 6);
insert into ProductsToCategories(PID, CAID) values (7, 7);
insert into ProductsToCategories(PID, CAID) values (8, 10);
insert into ProductsToCategories(PID, CAID) values (9, 10);
insert into ProductsToCategories(PID, CAID) values (10, 11);
insert into ProductsToCategories(PID, CAID) values (11, 11);
insert into ProductsToCategories(PID, CAID) values (12, 9);
insert into ProductsToCategories(PID, CAID) values (13, 9);

insert into FreightForwarders(FFName, ShippingCost, DeliveryTime) values ('DB Schenker', 179, 3);
insert into FreightForwarders(FFName, ShippingCost, DeliveryTime) values ('PostNord', 129, 5);

insert into Customers(Username, Firstname, Lastname, Secretword, IsCompany, Email, IsAdmin) values ('pattzor', 'Patrik', 'J��on', 'pussel13', 0, 'patrik@pattzor.se', 0);
insert into Customers(Username, Firstname, Lastname, Secretword, IsCompany, Email, IsAdmin) values ('conny12', 'Conny', 'Socker', 'conny1', 1, 'sockerconny@home.se', 0);
insert into Customers(Username, Firstname, Lastname, Secretword, IsCompany, Email, IsAdmin) values ('Per', 'Per', 'Jenelius', 'killme13', 0, 'per@jenelius.se', 1);

insert into Addresses(Street, FloorNr, city, ZipCode) values ('Storgatan 3', '19', 'Malmö', '41523');
insert into Addresses(Street, city, ZipCode) values ('Kungsgatan 13A', 'Stockholm', '11521');
insert into Addresses(Street, DoorCode, city, ZipCode) values ('Genvägen 1', '1973', 'Kalmar', '21513');

insert into CustomersToAddresses(CUID, AID) values (1, 1);
insert into CustomersToAddresses(CUID, AID) values (2, 2);
insert into CustomersToAddresses(CUID, AID) values (3, 3);
insert into CustomersToAddresses(CUID, AID) values (1, 3);

insert into Orders (CustomerID, OrderDate, FreighterID, ShippingAddressID, InvoiceAddressID) values (1, '2017-03-24', 2, 1, 1)
insert into Orders (CustomerID, OrderDate, FreighterID, ShippingAddressID, InvoiceAddressID) values (2, '2017-03-24', 1, 2, 2)

--saker som tillhör första ordern
insert into OrdersToProducts (OID, PID, NetPrice, VAT, ProductAmount) values (199, 3, 1300, 2, 20)
insert into OrdersToProducts (OID, PID, NetPrice, VAT, ProductAmount) values (199, 1, 1100, 1, 10)

--saker som tillhör andra ordern
insert into OrdersToProducts (OID, PID, NetPrice, VAT, ProductAmount) values (218, 2, 900, 1, 3)


--select * from VAT;
--select * from Products;
--select * from FreightForwarders;
--select * from Customers;
--select * from Categories;
--select * from Addresses;
--select * from CustomersToAddresses;
--select * from ProductsToCategories;
--select * from Orders
--select * from OrdersToProducts;

--Stored procedures:

--Create Customer
GO
Create Procedure CreateCustomer
@Username varchar(50),
@Firstname varchar(50),
@Lastname varchar(50),
@Secretword varchar(50),
@IsCompany bit,
@PhoneNr varchar(50),
@Email varchar(50),
@IsAdmin bit,
@IsActive bit

AS
select * from Customers where Username=@Username;
if (select count(*)) = 0
BEGIN
insert into Customers(Username, Firstname, Lastname, Secretword, IsCompany, PhoneNr, Email, IsAdmin, IsActive) values (@Username, @Firstname, @Lastname, @Secretword, @IsCompany, @PhoneNr, @Email, @IsAdmin, @IsActive)
END

--Read Customer
GO
Create Procedure ReadCustomer
@ID int

AS
select * from Customers where ID=@ID;

--ReadAllCustomers
GO
Create Procedure ReadAllCustomers

AS
select * from Customers;

--Update Customer
GO
Create Procedure UpdateCustomer
@ID int,
@Username varchar(50),
@Firstname varchar(50),
@Lastname varchar(50),
@Secretword varchar(50),
@IsCompany bit,
@PhoneNr varchar(50),
@Email varchar(50),
@IsAdmin bit,
@IsActive bit

AS
update Customers set Username=@Username, Firstname=@Firstname, Lastname=@Lastname, Secretword=@Secretword, IsCompany=@IsCompany, PhoneNr=@PhoneNr, Email=@Email, IsAdmin=@IsAdmin, IsActive=@IsActive
where ID=@ID;

--Activate/Deactivate Customer
GO
Create Procedure ActivateCustomer
@ID int,
@IsActive bit

AS
update Customers set IsActive=@IsActive
where ID=@ID

--Johan:
-- Create Address
GO
create Procedure CreateAddress(
@Street varchar(50),
@FloorNr varchar(50),
@DoorCode varchar(50),
@City varchar(50),
@ZipCode varchar(50),
@CUID int,
@AID int output 
)
AS
insert into Addresses(Street, FloorNr, DoorCode, City, ZipCode) values (@Street, @FloorNr, @DoorCode, @City, @ZipCode)
set @AID = SCOPE_IDENTITY()

insert into CustomersToAddresses(CUID, AID) values (@CUID, @AID)

--Read Addresses
GO
Create Procedure ReadAddresses
@ID int

AS
select * from Addresses where ID=@ID;

-- ReadAllAddresses
GO
create Procedure ReadAllAddresses

AS
select * from Addresses;


-- Update Address
GO
create procedure UpdateAddress
@ID int,
@Street varchar(50),
@FloorNr varchar(50),
@DoorCode varchar(50),
@City varchar(50),
@ZipCode varchar(50)

AS
update Addresses set Street=@Street, FloorNr=@FloorNr, DoorCode=@DoorCode, City=@City, ZipCode=@ZipCode
where ID=@ID;


--Delete Address
GO
Create Procedure DeleteAddress
(
@AID int,
@CUID int
)

AS
delete CustomersToAddresses where AID=@AID and CUID=@CUID
delete Addresses where ID not in (select AID from CustomersToAddresses)


--Create Product
GO
Create Procedure CreateProduct
(
@Name varchar(50),
@ItemNumber varchar(50),
@NetPrice money,
@Picture varbinary(max),
@ItemInfo varchar(8000),
@NrInStock int,
@VATID int,
@IsActive bit
)

AS
insert into Products(Name, ItemNumber, NetPrice, Picture, ItemInfo, NrInStock, VATID, IsActive) values (@Name, @ItemNumber, @NetPrice, @Picture, @ItemInfo, @NrInStock, @VATID, @IsActive);

--Read Product
GO
Create Procedure ReadProduct
(
@ID int
)

AS
select * from Products where ID = @ID

--Read All Products
GO
Create Procedure ReadAllProduct

AS
select * from Products

--Update Product
GO
Create Procedure UpdateProduct
(
@ID int,
@Name varchar(50),
@ItemNumber varchar(50),
@NetPrice money,
@Picture image,
@ItemInfo varchar(8000),
@NrInStock int,
@VATID int,
@IsActive bit
)

AS
update Products set Name=@Name, ItemNumber=@ItemNumber, NetPrice=@NetPrice, Picture=@Picture, ItemInfo=@ItemInfo, NrInStock=@NrInStock, VATID=@VATID, IsActive=@IsActive
where ID=@ID;

--Deactivate/Activate Product
GO
Create Procedure ActivateProduct
(
@ID int,
@IsActive bit
)

AS
update Products set IsActive=@IsActive
where ID=@ID
GO

----On Verification of order, Number in stock must be updated
Go
Create Procedure OrderVerification
(
@OID int
)

AS
update Orders set StatusConfirmed=1
where Orders.ID=@OID
update Products set NrInStock=(NrInStock - OrdersToProducts.ProductAmount)
from Products, OrdersToProducts
where OrdersToProducts.OID = @OID and PID = Products.ID

--Update OrdersToProducts
GO
create Procedure UpdateOrdersToProducts
(
@OID int,
@oldPID int,
@newPID int,
@NetPrice money,
@VAT money,
@ProductAmount int
)

AS
update OrdersToProducts set PID=@newPID, NetPrice=@NetPrice, VAT=@VAT, ProductAmount=@ProductAmount
from Orders, OrdersToProducts
where Orders.ID=@OID and OrdersToProducts.PID = @oldPID


--Per:
--NEW
--Create Order
GO
Create Procedure CreateOrder
@CustomerID int,
@OrderDate date,
@FreighterID int,
@ShippingAddressID int,
@InvoiceAddressID int

AS
insert into Orders(CustomerID, OrderDate, FreighterID, ShippingAddressID, InvoiceAddressID) values (@CustomerID, @OrderDate, @FreighterID, @ShippingAddressID, @InvoiceAddressID)

--NEW
--Also Create OrdersToProducts
GO
Create Procedure AddProductToOrder
@OID int,
@PID int,
@NetPrice money,
@VAT money,
@ProductAmount int

AS
insert into OrdersToProducts(OID, PID, NetPrice, VAT, ProductAmount) values (@OID, @PID, @NetPrice, @VAT, @ProductAmount)

--NEW
--Read Order
GO
Create Procedure ReadOrder
@ID int

AS
select * from Orders where ID=@ID


--NEW
--Also Read matching OrdersToProducts
GO
Create Procedure ReadProductsForOrder
@OID int

AS
select * from OrdersToProducts where OID=@OID

--NEW
--ReadAllOrders
GO
Create Procedure ReadAllOrders

AS
select * from Orders

--NEW
--Update Order
GO
Create Procedure UpdateOrder
@ID int,
@CustomerID int,
@OrderDate date,
@FreighterID int,
@ShippingAddressID int,
@InvoiceAddressID int

AS
update Orders set CustomerID=@CustomerID, OrderDate=@OrderDate, FreighterID=@FreighterID, ShippingAddressID=@ShippingAddressID, InvoiceAddressID=@InvoiceAddressID
where ID=@ID

--Per:

--NEW
--Create Category
GO
Create Procedure CreateCategory
@Name varchar(50),
@ParentID int

AS
insert into Categories(Name, ParentID) values (@Name, @ParentID)
	--Assign parent category if needed (otherwise ParentID = 0) --Let's fix this in C#

--NEW
--Read Category
GO
Create Procedure ReadCategory
@ID int

AS
select * from Categories where ID=@ID

--NEW
--Read All Categories
GO
Create Procedure ReadAllCategories

AS
select * from Categories

--NEW
--Update Category
GO
Create Procedure UpdateCategory
@ID int,
@Name varchar(50),
@ParentID int

AS
update Categories set Name=@Name, ParentID=@ParentID
where ID=@ID

--NEW
--Delete Category
GO
Create Procedure DeleteCategory
@CAID int

AS
--Don't delete if category is a parent & start with deleting ProductsToCategories
delete ProductsToCategories where CAID=@CAID;
select * from Categories where ParentID=@CAID;
if (select count(*)) = 0
BEGIN
delete from Categories where ID=@CAID
END

--Jörgen:
--CREATE VAT
GO
Create procedure CreateVAT
@Category varchar(50),
@Rate money

AS
Insert into VAT(Category, Rate) values (@Category, @Rate);

--READ VAT
GO
Create procedure ReadAllVAT

AS
Select * from VAT;

--UPDATE VAT
GO
Create procedure UpdateVAT
@ID int,
@Category varchar(50),
@Rate money

AS
Update VAT SET Category=@Category, Rate=@Rate WHERE ID=@ID;

--DELETE VAT
GO
Create procedure DeleteVAT
@ID int

AS
Delete from VAT WHERE ID=@ID;


--Per:

--NEW
--Create Freighter
GO
Create Procedure CreateFreightForwarder
@FFName varchar(50),
@ShippingCost money,
@DeliveryTime int

AS
insert into FreightForwarders(FFName, ShippingCost, DeliveryTime) values (@FFName, @ShippingCost, @DeliveryTime)

--NEW
--Read Freighter
GO
Create Procedure ReadFreightForwarder
@ID int

AS
select * from FreightForwarders where ID=@ID

--NEW
--Read All Freighters
GO
Create Procedure ReadAllFreightForwarders

AS
select * from FreightForwarders

--NEW
--Update Freighter
GO
Create Procedure UpdateFreightForwarder
@ID int,
@FFName varchar(50),
@ShippingCost money,
@DeliveryTime int

AS
update FreightForwarders set FFName=@FFName, ShippingCost=@ShippingCost, DeliveryTime=@DeliveryTime
where ID=@ID

--NEW
--Delete Freighter
GO
Create Procedure DeactivateForwarder
@ID int,
@IsActive bit

AS
update FreightForwarders set IsActive=@IsActive
where ID=@ID

--NEW
--TODO Generera en rekursiv metod i C# för generering av "träd" av kategorier
--TODO Kolla hur vi får en bekräftelse i retur till C# från SQL
--TODO Query för bra sök

select * from ProductsToCategories

