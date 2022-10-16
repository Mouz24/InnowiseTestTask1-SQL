CREATE TRIGGER Control_Balance_On_Account
ON Client_Data
AFTER INSERT,UPDATE
AS 
IF UPDATE (AccountMoney)
BEGIN 
 IF EXISTS (
 SELECT * FROM inserted I, Client_Data P 
 WHERE (I.AccountMoney < I.MoneyOnCards) OR (I.AccountMoney < P.MoneyOnCards AND I.ClientID = P.ClientID)
 )
  BEGIN 
   ROLLBACK TRAN
   RAISERROR ('Account balance is less than money on cards', 16, 1)
  END
END
GO
ENABLE TRIGGER Control_Balance_On_Account ON Client_Data
