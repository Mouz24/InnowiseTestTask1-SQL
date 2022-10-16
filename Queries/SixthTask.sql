USE Bank_Sphere
GO
SELECT *, CASE WHEN ((AccountMoney - MoneyOnCards) < 0) THEN 0 ELSE AccountMoney - MoneyOnCards END
AS MoneyAvailableForTransfer FROM Client_Data, Bank_Data
WHERE Client = ClientID

