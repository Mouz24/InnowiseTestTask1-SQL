CREATE TABLE Bank_Data (
    Client int not null,
    Bank varchar(255) not null,
	Department int not null,
    City varchar(255) not null,
	primary key (Client)
);

INSERT INTO Bank_Data
    (Client, Bank, Department, City) 
VALUES 
    (1, 'Alpha', 1, 'Brest'),
	(2, 'BelarusBank', 1, 'Minsk'),
	(3, 'Alpha', 2, 'Minsk'),
	(4, 'BelarusBank', 2, 'Gomel'),
	(5, 'Alpha', 3, 'Minsk')
	;
