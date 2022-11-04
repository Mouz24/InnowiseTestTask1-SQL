SELECT Clients.FirstName, Clients.SecondName, Cards.Number, Users.Balance, Cards.Balance AS CardBalance
FROM Clients 
JOIN Users ON Users.Client_Id = Clients.Id

JOIN Cards ON Cards.[User_Id] = Users.Id

UPDATE Users
SET Balance = 300.00 WHERE Client_Id = 4

SELECT Clients.FirstName, Clients.SecondName, Cards.Number, Users.Balance, Cards.Balance AS CardBalance
FROM Clients 
JOIN Users ON Users.Client_Id = Clients.Id

JOIN Cards ON Cards.[User_Id] = Users.Id
