CREATE PROCEDURE AddTenDollars
	   @Status VARCHAR(25)
AS 
BEGIN
    IF (@Status != ALL(SELECT Current_Status FROM Social_Status))
        RAISERROR ('There is no such status', 16, 1)

    UPDATE Users
    SET Balance = Balance + 10.00
    WHERE Users.Id = ANY(SELECT Users.Id
					     FROM Social_Status, Clients, Users
					     WHERE Social_Status.Current_Status = @Status
						    AND Users.Client_Id = Clients.Id
						    AND Social_Status.id = Clients.Social_Status_Id)
END
