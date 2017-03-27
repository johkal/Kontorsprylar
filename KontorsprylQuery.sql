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
Picture varbinary,
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

--Skapar några random värden

insert into VAT(Category, Rate) values ('Standard', 0.25);
insert into VAT(Category, Rate) values ('Book', 0.06);

insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Stol 1', '123456', 1100, 3, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Stol 2', '123457', 900, 1000, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Stol 3', '123458', 1300, 9, 1, 1);
insert into Products(Name, ItemNumber, NetPrice, NrInStock, VATID, IsActive) values ('Stol 4', '123459', 700, 12, 1, 1);

insert into Categories(Name) values ('stolar');
insert into Categories(Name, ParentID) values ('kontorsstolar', 1);
insert into Categories(Name, ParentID) values ('solstolar', 1);

insert into ProductsToCategories(PID, CAID) values (1, 2);
insert into ProductsToCategories(PID, CAID) values (2, 2);
insert into ProductsToCategories(PID, CAID) values (3, 3);
insert into ProductsToCategories(PID, CAID) values (4, 2);

insert into FreightForwarders(FFName, ShippingCost, DeliveryTime) values ('DB Schenker', 179, 3);
insert into FreightForwarders(FFName, ShippingCost, DeliveryTime) values ('PostNord', 129, 5);

insert into Customers(Username, Firstname, Lastname, Secretword, IsCompany, Email, IsAdmin) values ('pattzor', 'Patrik', 'Jönsson', 'pussel13', 0, 'patrik@pattzor.se', 0);
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

select * from VAT;
select * from Products;
select * from FreightForwarders;
select * from Customers;
select * from Categories;
select * from Addresses;
select * from CustomersToAddresses;
select * from ProductsToCategories;
select * from Orders
select * from OrdersToProducts;

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
--Create Address
	--Must later be added to existing customer (create CustomerToAddress)
--Read Address
	--Read all Addresses
	--Read Address with this ID
--Update Address
--Cleanup Address (När vi raderar Address så måste vi först radera ContactsToAdress.. ContactsToAddress kommer därför alltid vara ren.)

--Johanna: VI MÅSTE LÖSA BILDPROBLEMATIKEN:::::
--Create Product
GO
Create Procedure CreateProduct
(
@Name varchar(50),
@ItemNumber varchar(50),
@NetPrice money,
@Picture varbinary,
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
update Products set NrInStock = NrInStock - OrdersToProducts.ProductAmount
from Products, OrdersToProducts
where OrdersToProducts.OID = 199 and PID = Products.ID

--select OID, PID, ProductAmount, Products.ID, NrInStock from Products, OrdersToProducts
--where OrdersToProducts.OID = 199 and PID = Products.ID

--Per:
--Create Order
	--Also Create OrdersToProducts
--Read Order
	--Also Read matching OrdersToProducts
--Update Order

--Per:
--Create Category
	--Assign parent category if needed (otherwise ParentID = 0)
--Read Category
--Update Category
--Delete Category
	--Dont delete if category is a parent

--Jörgen:
--Create VAT
--Read VAT
--Update VAT
--Delete VAT

--Per:
--Create Freighter
--Read Freighter
--Update Freighter
--Delete Freighter

--Johanna:
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
--Vi kanske vill kunna lägga till en helt ny OrdersToProducts? Och hur får vi tag på ID för just den tabellen? Eller ska vi söka i queryn direkt?
--Ska man kunna ändra pris eller ska vi hämta det från andra tabeller?

AS
update OrdersToProducts set PID=@newPID, NetPrice=@NetPrice, VAT=@VAT, ProductAmount=@ProductAmount
from Orders, OrdersToProducts
where Orders.ID=@OID and OrdersToProducts.PID = @oldPID

--Cleanup CustomerToAddress (När vi raderar Address så måste vi först radera ContactsToAdress.. ContactsToAddress kommer därför alltid vara ren.)

--Cleanup ProductToCategory (När vi raderar Category så måste vi först radera ProductsToCategory.. ProductsToCategory kommer därför alltid vara ren.)


--TODO Kolla hur vi får en bekräftelse i retur till C# från SQL
--TODO En null-parameter i en Stored Procedure borde väl funka? Slipper vi krav på att allt ska vara ifyllt..
--TODO Ha en IsActive på OrdersToProducts eller bara nolla allt om vi vill radera?

GO
Create Table Andreas
(
Kattbild varbinary(max)
)


GO
create Procedure LaddaAndreas
(
@Kattbild varbinary(max)
)

AS
insert into Andreas (Kattbild) values (@Kattbild)

GO
create Procedure ReadAndreas

AS
select * from Andreas
