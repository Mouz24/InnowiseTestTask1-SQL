CREATE TABLE Departments
(
	Id INT IDENTITY(1,1) NOT NULL,
	Department_Name VARCHAR(25) DEFAULT('NoName') NULL,
	Bank_Id INT NOT NULL,
	City_Id INT NOT NULL,
	PRIMARY KEY CLUSTERED ([Id] ASC), 
	CONSTRAINT FK_Departments_To_Banks FOREIGN KEY(Bank_Id) REFERENCES Banks(Id) ON DELETE CASCADE,
	CONSTRAINT FK_Departments_To_Cities FOREIGN KEY(City_Id) REFERENCES Cities(Id) ON DELETE CASCADE
);
