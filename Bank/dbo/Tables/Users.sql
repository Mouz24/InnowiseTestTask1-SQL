CREATE TABLE Users
(
	Id INT IDENTITY(1,1) NOT NULL,
	Client_Id INT NOT NULL,
	Balance DECIMAL(18,2) DEFAULT(0.00) CHECK (Balance >= 0.00) NULL,
	PRIMARY KEY CLUSTERED ([Id] ASC), 
	CONSTRAINT FK_Users_To_Clients FOREIGN KEY(Client_Id) REFERENCES Clients(Id) ON DELETE CASCADE
);
