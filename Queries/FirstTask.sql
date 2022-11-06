SELECT DISTINCT Bank_Name, Department_Name
FROM Banks
JOIN Departments ON Departments.Bank_Id = Banks.Id

JOIN Cities ON Cities.Id = Departments.City_Id
WHERE Cities.City_Name = 'Mozyr'
