/*
Author: Francisco Gomes da Silva Junior
College: Estacio
Database: AdventureWorksLT2025
Date: 13-01-2026, in format Brazil
Version: 1.0
*/

-- Exercise 01: return all products if color "Red" and size "L"
SELECT sp.[Name]
FROM SalesLT.[Product] as sp
WHERE sp.Color = 'Red' AND sp.[Size] = 'L'

-- Exercise 02: Return products is 'Red' OR 'Blue'
SELECT *
FROM SalesLT.[Product] as sp
WHERE sp.Color = 'Red' OR sp.Color = 'Blue'
ORDER BY sp.[Name] ASC
