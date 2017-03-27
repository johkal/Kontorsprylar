
--OBS ATT PICTURE NUMERA ÄR VARBINARY!!

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
