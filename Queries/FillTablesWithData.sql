INSERT INTO Banks
VALUES
('Alpha-bank'),
('Belarusbank'),
('BNBbank'),
('Paritetbank'),
('Priorbank');

GO

INSERT INTO Cities
VALUES
('Minsk'),
('Gomel'),
('Mozyr'),
('Grodno'),
('Vitebsk');

GO

INSERT INTO Departments(Department_Name, Bank_Id, City_Id)
VALUES
(
	'Num 1',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Belarusbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'Num 2',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Belarusbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Mozyr')
),
(
	'Num 3',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Belarusbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Grodno')
),
(
	'Num 1',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Priorbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'Num 2',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Priorbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Mozyr')
),

(
	'Num 1',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Alpha-bank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'Num 2',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Alpha-bank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Vitebsk')
),
(
	'Num 24',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Paritetbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'Num 8',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Paritetbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Gomel')
),
(
	'Num 5',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Paritetbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Grodno')
),
(
	'Num 11',
	(SELECT Id FROM Banks WHERE Bank_Name = 'BNBbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'Num 6',
	(SELECT Id FROM Banks WHERE Bank_Name = 'BNBbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Gomel')
),
(
	'Num 8',
	(SELECT Id FROM Banks WHERE Bank_Name = 'BNBbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Grodno')
);

GO

INSERT INTO Social_Status(Current_Status)
VALUES
('Student'),
('Employee'),
('Disabled'),
(DEFAULT);

GO

INSERT INTO Clients(FirstName, SecondName, Age, Phone, Email, Bank_Id, Social_Status_Id)
VALUES
(
	'Tom',
	'Cruz',
	56,
	'33-777-77-23',
	'tCruz@gmail.com',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Priorbank'),
	(SELECT Id FROM Social_Status WHERE Current_Status = 'Employee')
),
(
	'Lebron',
	'James',
	38,
	'29-555-55-55',
	'KingJames@gmail.com',
	(SELECT Id FROM Banks WHERE Bank_Name = 'BNBbank'),
	(SELECT Id FROM Social_Status WHERE Current_Status = 'Employee')
),
(
	'Nick',
	'Vuchich',
	33,
	'44-754-92-14',
	'nVuch@gmail.com',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Paritetbank'),
	(SELECT Id FROM Social_Status WHERE Current_Status = 'Disabled')
),
(
	'Vadim',
	'Dontsu',
	18,
	'29-179-04-46',
	'vadim.dontsu@mail.ru',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Belarusbank'),
	(SELECT Id FROM Social_Status WHERE Current_Status = 'Student')
),
(
	'Alisher',
	'Morgenshtern',
	24,
	'29-666-66-66',
	'alikmorgen@mail.ru',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Alpha-bank'),
	(SELECT Id FROM Social_Status WHERE Current_Status = 'Employee')
);

GO

INSERT INTO Users(Client_id, Balance)
VALUES
(	
	(SELECT Id FROM Clients WHERE FirstName = 'Tom' AND SecondName = 'Cruz'),
	564.14
),
(
	(SELECT Id FROM Clients WHERE FirstName = 'Lebron' AND SecondName = 'James'),
	22145.94
),
(
	(SELECT Id FROM Clients WHERE FirstName = 'Nick' AND SecondName = 'Vuchich'),
	617.00
),
(
	(SELECT Id FROM Clients WHERE FirstName = 'Vadim' AND SecondName = 'Dontsu'),
	523.34
),
(
	(SELECT Id FROM Clients WHERE FirstName = 'Alisher' AND SecondName = 'Morgenshtern'),
	5342.12
);

GO

INSERT INTO Cards(Number, Balance, Pincode, CVV, [User_Id])
VALUES
(
	'7647-3586-1894-5789',
	135.00,
	'3955',
	'534',
	(SELECT Id FROM Users WHERE Client_id = (SELECT Id FROM Clients WHERE FirstName = 'Tom' AND SecondName = 'Cruz'))
),
(
	'5746-2467-2936-4565',
	2145.23,
	'7894',
	'406',
	(SELECT Id FROM Users WHERE Client_id = (SELECT Id FROM Clients WHERE FirstName = 'Lebron' AND SecondName = 'James'))
),
(
	'4348-7642-6392-4566',
	342.00,
	'4987',
	'604',
	(SELECT Id FROM Users WHERE Client_id = (SELECT Id FROM Clients WHERE FirstName = 'Nick' AND SecondName = 'Vuchich'))
),
(
	'4000-0012-3456-7899',
	424.56,
	'1111',
	'908',
	(SELECT Id FROM Users WHERE Client_id = (SELECT Id FROM Clients WHERE FirstName = 'Vadim' AND SecondName = 'Dontsu'))
),
(
	'5110-0001-3456-7579',
	667.00,
	'7913',
	'777',
	(SELECT Id FROM Users WHERE Client_id = (SELECT Id FROM Clients WHERE FirstName = 'Alisher' AND SecondName = 'Morgenshtern'))
);
