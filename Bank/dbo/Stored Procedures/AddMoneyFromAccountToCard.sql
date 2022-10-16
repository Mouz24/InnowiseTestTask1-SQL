CREATE PROCEDURE SAFE_TRANSACTION @ClientID INT, @AmountOfMoneyForTransaction DECIMAL, @CardToTransferToID INT
AS 
SET XACT_ABORT, NOCOUNT ON
BEGIN TRY
IF (@ClientID != (SELECT ClientID FROM Client_Data WHERE ClientID = @ClientID) OR @ClientID = 0)
BEGIN  
 RAISERROR ('There is no such account', 16, 1)
END
IF (@AmountOfMoneyForTransaction > (SELECT (AccountMoney - MoneyOnCards) FROM Client_Data WHERE @ClientID = ClientID))
BEGIN 
 RAISERROR ('No available money for transaction', 16, 1)
END
IF (@CardToTransferToID != Any(SELECT Card_ID FROM Cards))
BEGIN 
 RAISERROR ('WRONG CARD ID', 16, 1)
END
BEGIN TRANSACTION
UPDATE Client_Data
SET MoneyOnCards = MoneyOnCards + @AmountOfMoneyForTransaction WHERE ClientID = @ClientID
UPDATE Cards
SET MoneyOnCard = MoneyOnCard + @AmountOfMoneyForTransaction WHERE Client_FK = @ClientID AND Card_ID = @CardToTransferToID
COMMIT TRANSACTION
END TRY
BEGIN CATCH
DECLARE @ErrorMsg nvarchar(240)
DECLARE @ErrorSeverity INT
DECLARE @ErrState INT

SELECT @ErrorMsg = ERROR_MESSAGE(),
       @ErrorSeverity = ERROR_SEVERITY(),
	   @ErrState = ERROR_STATE();

RAISERROR (@ErrorMsg, @ErrorSeverity, @ErrState)
IF @@trancount > 0 ROLLBACK TRANSACTION
RETURN -4
END CATCH
