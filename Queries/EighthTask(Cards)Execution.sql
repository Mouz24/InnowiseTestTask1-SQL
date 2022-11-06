SELECT Clients.FirstName, Clients.SecondName, Cards.Number, Users.Balance, Cards.Balance AS CardBalance
FROM Clients 
JOIN Users ON Users.Client_Id = Clients.Id

JOIN Cards ON Cards.[User_Id] = Users.Id

GO

UPDATE Cards
SET Balance = 600.00 WHERE Cards.Number = '4000-0012-3456-7899'

GO

SELECT Clients.FirstName, Clients.SecondName, Cards.Number, Users.Balance, Cards.Balance AS CardBalance
FROM Clients 
JOIN Users ON Users.Client_Id = Clients.Id

JOIN Cards ON Cards.[User_Id] = Users.Id
