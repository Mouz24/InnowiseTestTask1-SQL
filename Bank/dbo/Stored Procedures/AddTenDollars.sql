CREATE PROCEDURE ADD10DOLLARS @StatusID INT
AS 
BEGIN TRY
IF (@StatusID > (SELECT COUNT(ClientID) FROM Client_Data) OR @StatusID = 0)
BEGIN 
 RAISERROR ('There is no such status', 16, 1)
END
UPDATE Client_Data
SET AccountMoney = AccountMoney + 10.00
WHERE Status = @StatusID
END TRY
BEGIN CATCH
 DECLARE @ErrorMsg nvarchar(240)
DECLARE @ErrorSeverity INT
DECLARE @ErrState INT

SELECT @ErrorMsg = ERROR_MESSAGE(),
       @ErrorSeverity = ERROR_SEVERITY(),
	   @ErrState = ERROR_STATE();

RAISERROR (@ErrorMsg, @ErrorSeverity, @ErrState)
END CATCH
