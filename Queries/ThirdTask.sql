SELECT Name, AccountMoney, MoneyOnCards, Bank, AccountMoney - MoneyOnCards as Difference 
FROM Client_Data, Bank_Data WHERE Client = ClientID AND AccountMoney != MoneyOnCards
