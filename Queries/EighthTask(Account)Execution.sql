
USE Bank_Sphere
GO
SELECT * FROM Client_Data, Cards WHERE ClientID = Client_FK
UPDATE Client_Data
SET AccountMoney = 400.00 WHERE ClientID = 1
SELECT * FROM Client_Data, Cards WHERE ClientID = Client_FK
