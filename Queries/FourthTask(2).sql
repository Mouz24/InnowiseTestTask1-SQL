USE Bank_Sphere
SELECT DISTINCT Status,
(
    SELECT SUM(NumberOfCards)
    FROM Client_Data b
    where a.Status = b.Status
) AmountOFCardsForEachStatus
from Client_Data a
