SELECT Social_Status.Id AS SocialStatus, Social_Status.Current_Status,
	   (SELECT COUNT(*)
	    FROM Cards, Clients, Users 
	    WHERE Cards.[User_Id] = Users.Id
		  AND Users.Client_Id = Clients.Id
		  AND Clients.Social_Status_Id = Social_Status.Id) AS AmountOfCards
FROM Social_Status
