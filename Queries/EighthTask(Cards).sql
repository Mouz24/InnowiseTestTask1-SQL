CREATE TRIGGER CardBalanceUpdateControl
ON Cards
INSTEAD OF UPDATE
AS BEGIN
    DECLARE @UserBalance DECIMAL(18,2), 
		    @CardBalanceBeforeUpdate DECIMAL(18,2), 
		    @CardBalanceAfterUpdate DECIMAL(18,2),
		    @CurrentTotalCardsBalance DECIMAL(18,2), 
		    @ResultTotalCardsBalance DECIMAL(18,2)

    SELECT @UserBalance = (SELECT Balance
						   FROM Users
						   WHERE Users.Id = (SELECT [User_Id] 
										     FROM inserted))

	SELECT @CurrentTotalCardsBalance = (SELECT SUM(Cards.Balance)
										FROM Cards
										WHERE Cards.[User_Id] =	(SELECT [User_Id] 
																 FROM inserted)
										GROUP BY Cards.[User_Id])

	SELECT @CardBalanceAfterUpdate = (SELECT Balance
									  FROM inserted)

	SELECT @CardBalanceBeforeUpdate = (SELECT Balance
									   FROM Cards
									   WHERE Cards.Id = (SELECT Id 
														 FROM inserted))

	SELECT @ResultTotalCardsBalance = @CurrentTotalCardsBalance - @CardBalanceBeforeUpdate + @CardBalanceAfterUpdate

	UPDATE Cards
	SET Balance = @CardBalanceAfterUpdate
	WHERE Cards.Id = (SELECT Id 
					  FROM inserted)
		AND @UserBalance >= @ResultTotalCardsBalance

	IF (@@ROWCOUNT = 0)
		RAISERROR('There is no money available for transaction', 16, 1)
	ELSE
		PRINT 'Card balance was updated successfully'
END

GO

ENABLE TRIGGER CardBalanceUpdateControl ON Cards
