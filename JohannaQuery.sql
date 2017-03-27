
--OBS ATT PICTURE NUMERA �R VARBINARY!!

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
--Vi kanske vill kunna l�gga till en helt ny OrdersToProducts? Och hur f�r vi tag p� ID f�r just den tabellen? Eller ska vi s�ka i queryn direkt?
--Ska man kunna �ndra pris eller ska vi h�mta det fr�n andra tabeller?

AS
update OrdersToProducts set PID=@newPID, NetPrice=@NetPrice, VAT=@VAT, ProductAmount=@ProductAmount
from Orders, OrdersToProducts
where Orders.ID=@OID and OrdersToProducts.PID = @oldPID

--Cleanup CustomerToAddress (N�r vi raderar Address s� m�ste vi f�rst radera ContactsToAdress.. ContactsToAddress kommer d�rf�r alltid vara ren.)

--Cleanup ProductToCategory (N�r vi raderar Category s� m�ste vi f�rst radera ProductsToCategory.. ProductsToCategory kommer d�rf�r alltid vara ren.)


--TODO Kolla hur vi f�r en bekr�ftelse i retur till C# fr�n SQL
--TODO En null-parameter i en Stored Procedure borde v�l funka? Slipper vi krav p� att allt ska vara ifyllt..
--TODO Ha en IsActive p� OrdersToProducts eller bara nolla allt om vi vill radera?
