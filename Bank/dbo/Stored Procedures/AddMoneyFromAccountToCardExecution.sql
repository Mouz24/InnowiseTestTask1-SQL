USE [Bank_Sphere]
GO

SELECT Clients.FirstName, Clients.SecondName, Cards.Number, Users.Balance, Cards.Balance AS CardBalance
FROM Clients 
JOIN Users ON Users.Client_Id = Clients.Id

JOIN Cards ON Cards.[User_Id] = Users.Id

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddMoneyFromAccountToCard]
		@CardNumber = '4000-0012-3456-7899',
		@Sum = 10.00

SELECT	'Return Value' = @return_value

GO

SELECT Clients.FirstName, Clients.SecondName, Cards.Number, Users.Balance, Cards.Balance AS CardBalance
FROM Clients 
JOIN Users ON Users.Client_Id = Clients.Id

JOIN Cards ON Cards.[User_Id] = Users.Id
