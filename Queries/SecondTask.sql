SELECT Cards.Number, Client.FirstName, Client.SecondName, Cards.Balance, Bank.Bank_Name
FROM Cards
JOIN Users ON Users.Id = Cards.[User_Id]

JOIN (SELECT Id, Bank_Id, FirstName, SecondName 
	  FROM Clients) AS Client ON Client.Id = Users.Client_Id

JOIN (SELECT Id, Bank_Name 
		  FROM Banks) AS Bank ON Bank.Id = Client.Bank_Id
