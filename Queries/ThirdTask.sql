SELECT Users.Id, Users.Balance, CardsTotalBalance.CardsBalance, (Users.Balance - CardsTotalBalance.CardsBalance) AS BalanceDifference
FROM Users
JOIN (SELECT Cards.[User_Id], SUM(Cards.Balance) AS CardsBalance
      FROM Cards
      GROUP BY Cards.[User_Id]) AS CardsTotalBalance ON Users.Id = CardsTotalBalance.[User_Id]
