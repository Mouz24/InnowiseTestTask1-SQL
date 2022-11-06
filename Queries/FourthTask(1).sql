SELECT Social_status.Id AS SocialStatus, Social_Status.Current_Status, COUNT(Cards.Id) AS AmountOfCards
FROM Cards 
	JOIN Users ON Users.Id = Cards.[User_Id]
	
	JOIN Clients ON Clients.Id = Users.Client_Id
	
	RIGHT JOIN Social_Status ON Social_status.Id = Clients.Social_Status_Id
GROUP BY Social_Status.Id, Social_Status.Current_Status 
