
SELECT * FROM Client_Data, Cards WHERE ClientID = Client_FK
UPDATE Cards
SET MoneyOnCard = 250.00 WHERE Client_FK = 1 AND Card_ID = 2
SELECT * FROM Client_Data, Cards WHERE ClientID = Client_FK
