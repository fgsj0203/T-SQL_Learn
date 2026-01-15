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

-- Exercise 03: Return customers is have title 'Ms' and middlename 'Smith'
SELECT *
FROM SalesLT.Customer as sc
WHERE sc.Title = 'Ms' AND sc.MiddleName = 'Smith'

-- Exercise 04: return products with listPrice in range 100, 500 (using signal > and <)
SELECT *
FROM SalesLT.[Product] as sp
WHERE sp.ListPrice > 100 AND sp.ListPrice < 500
ORDER BY sp.[Name] ASC

-- Exercise 05: return products if not 'Black' and 'White'
SELECT *
FROM SalesLT.[Product] as sp
WHERE sp.Color NOT IN ('White', 'Black')
