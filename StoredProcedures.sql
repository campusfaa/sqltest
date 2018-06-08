
--Einfache Stored Procedure
CREATE PROCEDURE mv_GetCompanynames 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Sales.Customers
END
GO


--Ausf�hren einer Stored Procedure ohne Parameter �ber exec

exec mv_GetCompanynames

--Stored Prcedure f�r Alles Customers und Orders (kommt in zwei fenster)

CREATE PROCEDURE mv_GetCompanynamesANDOrders 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Sales.Customers
	Select * from Sales.Orders
END
GO

--Ausf�hren der Stored Procedure
exec mv_GetCompanynamesANDOrders


--Erstellen einer Stored Procedure mit einem Parameter
CREATE PROCEDURE mv_GetCompanynameswParams
	--Direkt nach dem Create die Parameter angeben
	@Country nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Sales.Customers
	Where Country = @Country
END
GO

--Beim Ausf�hren unter dem Exec die Werte f�r Parameter angeben
exec mv_GetCompanynameswParams
@Country = 'Germany'

--Erstellen einer Stored Procedure mit einem Parameter
CREATE PROCEDURE mv_GetCompanynames2Params
	--Direkt nach dem Create die Parameter angeben
	@Country nvarchar(50),
	@City nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Sales.Customers
	Where Country = @Country AND  city = @City
END
GO

--Beim Ausf�hren unter dem Exec die Werte f�r Parameter angeben
exec mv_GetCompanynames2Params
@Country = 'Germany',
@City = 'Berlin'

--Erstellen einer Stored Procedure mit COUNT
Create PROCEDURE mv_CountOrders
	--Direkt nach dem Create die Parameter angeben
	@Kundenummer integer
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @Kundenummer = COUNT(custid) from Sales.Orders 
	return @Kundenummer
END
GO

-- Damit etwas rauskommt muss hier Declared und noch eine variable vergeben werden

DECLARE	@return_value int

EXEC	@return_value = [dbo].[mv_CountOrders]
		@Kundenummer = 14

SELECT	'Return Value' = @return_value

GO
