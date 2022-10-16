SELECT Bank, Count(Department) AS NumberOfDepartments FROM Bank_Data 
WHERE City = 'Minsk' 
GROUP BY Bank
