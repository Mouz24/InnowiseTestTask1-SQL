SELECT Status, SUM(NumberOfCards) AS AmountOFCardsForEachStatus FROM Client_Data 
GROUP BY Status
