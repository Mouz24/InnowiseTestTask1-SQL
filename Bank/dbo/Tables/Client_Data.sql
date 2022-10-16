CREATE TABLE Client_Data (
    ClientID int not null,
    Name varchar(255) not null,
    Status int not null,
	AccountMoney decimal(18, 2) not null,
    NumberOfCards int,
	MoneyOnCards decimal(18, 2) not null,
	primary key (ClientId),
	unique (ClientID)
);

INSERT INTO Client_Data
    (ClientID, Name, Status, AccountMoney, NumberOfCards, MoneyOnCards) 
VALUES 
    (1, 'John', 1, 1000.00, 2, 500.00),
	(2, 'Ben', 2, 950.00, 1, 200.00),
	(3, 'Ken', 3, 700.00, 1, 300.00),
	(4, 'Ares', 1, 1100.00, 2, 600.00),
	(5, 'John', 2, 600.00, 1, 100.00)
	;
