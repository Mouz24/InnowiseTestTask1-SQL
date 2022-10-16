
SELECT * FROM Client_Data,Bank_Data WHERE Client = ClientID
GO
DECLARE	@Value int

EXEC	@Value = dbo.ADD10DOLLARS
		@StatusID = 2
GO
SELECT * FROM Client_Data,Bank_Data WHERE Client = ClientID


