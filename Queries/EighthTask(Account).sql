CREATE TRIGGER UserBalanceChangeControl
ON Users
INSTEAD OF UPDATE
AS BEGIN
	DECLARE @ChangedBalance DECIMAL(18, 2), 
	        @TotalCardsBalance DECIMAL(18, 2)

	SELECT @ChangedBalance = (SELECT Balance 
							  FROM inserted)

	SELECT @TotalCardsBalance = (SELECT SUM(Cards.Balance) AS TotalCardsBalance
								 FROM Cards
								 WHERE Cards.[User_Id] = (SELECT Id 
														  FROM inserted)
								 GROUP BY Cards.[User_Id])
	UPDATE Users
	SET Balance = @ChangedBalance
	WHERE Users.Id = ALL(SELECT Id 
						FROM inserted)
		AND @ChangedBalance >= @TotalCardsBalance

	IF @@ROWCOUNT = 0
		RAISERROR ('Account balance is less than total balance on cards', 16, 1)
	ELSE
		PRINT 'Balance was updated successfully'
END

GO

ENABLE TRIGGER UserBalanceChangeControl ON Users
