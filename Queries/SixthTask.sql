SELECT Users.Id, Clients.FirstName, Clients.SecondName, (Users.Balance - SUM(Cards.Balance)) AS MoneyAvailableForTransfer
FROM Users
	 LEFT JOIN Cards ON Cards.[User_id] = Users.Id
	 LEFT JOIN Clients ON Clients.Id = Users.Client_Id
GROUP BY Users.Id, Users.Balance, Clients.FirstName, Clients.SecondName
