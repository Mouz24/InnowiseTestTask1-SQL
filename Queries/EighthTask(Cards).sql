CREATE TRIGGER Card_Balance_Change_Controller
ON Cards 
AFTER INSERT,UPDATE
AS 
IF UPDATE (MoneyOnCard)
BEGIN 
UPDATE Client_Data
SET MoneyOnCards = (SELECT SUM(MoneyOnCard) FROM Cards WHERE ClientID = Client_FK) 
IF EXISTS (SELECT * FROM Client_Data,Cards WHERE ClientID = Client_FK AND AccountMoney < MoneyOnCards)
 BEGIN 
  ROLLBACK TRAN
  RAISERROR ('There is no money available for such a transaction', 16, 1)
 END
END
GO
ENABLE TRIGGER Card_Balance_Change_Controller ON Cards
