
USE Bank_Sphere
GO
SELECT * FROM Client_Data,Bank_Data,Cards WHERE Client = ClientID AND Client = Client_FK
GO
DECLARE	@Value int

EXEC	@Value = dbo.SAFE_TRANSACTION
        @ClientID = 5,
		@AmountOfMoneyForTransaction = 520.00 ,
		@CardToTransferToID  = 7
		
GO
SELECT * FROM Client_Data,Bank_Data,Cards WHERE Client = ClientID AND Client = Client_FK

