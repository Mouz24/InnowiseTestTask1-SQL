SELECT Clients.FirstName, Clients.SecondName, Users.Balance, Bank.Bank_Name
FROM Clients
JOIN Users ON Users.Client_Id = Clients.Id

JOIN (SELECT Id, Bank_Name 
		  FROM Banks) AS Bank ON Bank.Id = Clients.Bank_Id

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddTenDollars]
		@Status = 'Disabled'

SELECT	'Return Value' = @return_value

GO

SELECT Clients.FirstName, Clients.SecondName, Users.Balance, Bank.Bank_Name
FROM Clients
JOIN Users ON Users.Client_Id = Clients.Id

JOIN (SELECT Id, Bank_Name 
		  FROM Banks) AS Bank ON Bank.Id = Clients.Bank_Id
