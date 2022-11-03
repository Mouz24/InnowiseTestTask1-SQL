CREATE PROCEDURE AddMoneyFromAccountToCard
	   @CardNumber VARCHAR(19),
	   @Sum DECIMAL(18, 2)
AS 
BEGIN
	IF (@CardNumber != ALL(SELECT Number FROM Cards))
				RAISERROR('Wrong Card Number!', 16, 1)

	IF (0 > ALL(SELECT Users.Balance - CardsTotalBalance.CardsBalance - @Sum
			    FROM Users
							LEFT JOIN (SELECT Cards.[User_Id], SUM(Cards.Balance) AS CardsBalance
									  FROM Cards
									  GROUP BY Cards.[User_Id]) AS CardsTotalBalance ON Users.Id = CardsTotalBalance.[User_Id]
							LEFT JOIN (SELECT Number, [User_Id] FROM Cards) AS CardsNumber ON Users.Id = CardsNumber.[User_Id]
				WHERE CardsNumber.Number = @CardNumber))
				 RAISERROR('No money available for transaction', 16, 1)

	BEGIN TRANSACTION
		UPDATE Cards
		SET Balance = Balance + @Sum
		WHERE 0 <= ALL(SELECT Users.Balance - CardsTotalBalance.CardsBalance - @Sum
					  FROM Users
							LEFT JOIN (SELECT Cards.[User_Id], SUM(Cards.Balance) AS CardsBalance
									  FROM Cards
									  GROUP BY Cards.[User_Id]) AS CardsTotalBalance ON Users.Id = CardsTotalBalance.[User_Id]
							LEFT JOIN (SELECT Number, [User_Id] FROM Cards) AS CardsNumber ON Users.Id = CardsNumber.[User_Id]
					  WHERE CardsNumber.Number = @CardNumber)
		   AND Cards.Id = ALL(SELECT Id FROM Cards
							 WHERE Cards.Number = @CardNumber)

		IF (@@ERROR <> 0)
				ROLLBACK TRANSACTION
	COMMIT TRANSACTION
END
