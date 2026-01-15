/*
Author: Francisco Gomes da Silva Junior
College: Estacio
Database: AdventureWorksLT2025
Date: 13-01-2026, in format Brazil
Version: 1.0
*/

-- Exercise 01: return all fields of table Customers
SELECT *
FROM SalesLT.Customer as sc

-- Exercise 02: return name, middle name and company of customer
SELECT sc.FirstName as 'Primeiro nome', sc.MiddleName as 'Sobrenome', sc.CompanyName as 'Empresa do cliente'
FROM SalesLT.Customer as sc

-- Exercise 03: return name of colors exclusives 
SELECT DISTINCT sp.Color as 'Cores únicas'
FROM SalesLT.[Product] as sp 

-- Exercise 04: return products of color is NULL 
SELECT sp.[Name] as 'Nome do produto'
FROM SalesLT.[Product] as sp
WHERE sp.Color is NULL

-- Exercise 05: return of ten products with bigger price
SELECT TOP 10 *
FROM SalesLT.[Product] as sp
ORDER BY sp.ListPrice DESC

-- Exercise 06: return customers if middlename start a letter "S"
SELECT *
FROM SalesLT.Customer as sc
WHERE sc.MiddleName LIKE 'S%'

-- Exercise 07: return products with weight is bigger 1000 and name cor Black
SELECT *
FROM SalesLT.[Product] as sp
WHERE sp.[Weight] > 1000 and sp.Color = 'Black'

-- Exercise 08: return orders sales after 1º january of 2025
SELECT *
FROM SalesLT.SalesOrderHeader as ssoh
WHERE ssoh.OrderDate > YEAR(2025)

-- Exercise 09: return name of product and price product, rename of name columns for 'Nome' and 'Price unit'
SELECT sp.[Name] as 'Nome', sp.ListPrice as 'Preco'
FROM SalesLT.[Product] as sp
ORDER BY sp.[Name] ASC

-- Exercise 10: return products of price in interval (50,100)
SELECT sp.[Name] as 'Nome produto', sp.ListPrice as 'Preco'
FROM SalesLT.[Product] as sp
WHERE sp.ListPrice BETWEEN 50 AND 100
ORDER BY sp.ListPrice ASC

-- Exercise 11: return customers of have cellphone is finished in number 5
SELECT sc.FirstName as 'Primeiro nome', sc.Phone as 'Telefone'
FROM SalesLT.Customer as sc
WHERE sc.Phone LIKE '%5'

-- Exercise 12: return name in alphabet order and product price in order descending
SELECT sp.[Name] as 'Nome do produto', sp.ListPrice as 'Preco unitario'
FROM SalesLT.[Product] as sp
ORDER BY sp.[Name] ASC, sp.ListPrice DESC

-- Exercise 13: return all address in cities (London, Paris)
SELECT sa.AddressLine1 as 'Endereco principal', sa.AddressLine2 as 'Endereco alternativo'
FROM SalesLT.[Address] as sa
WHERE sa.City IN ('London', 'Paris')

-- Exercise 14: return models products without repetition
SELECT DISTINCT (spm.[Name])
FROM SalesLT.ProductModel as spm

-- Exercise 15: return products of have in categories (5,6,7)
SELECT *
FROM SalesLT.[Product] as spc
WHERE spc.ProductCategoryID IN (5,6,7)

-- Exercise 16: return all customers with title 'Mr.'
SELECT *
FROM SalesLT.Customer as sc
WHERE sc.Title = 'Mr.'

-- Exercise 17: return company of person (adventure-works\linda3)
SELECT sc.CompanyName as 'Nome das empresas'
FROM SalesLT.Customer as sc
WHERE sc.SalesPerson = 'adventure-works\linda3'

-- Exercise 18: return name and weight of products with weight bigger 1000
SELECT sp.[Name] as 'Nome do produto', sp.[Weight] as 'Peso do produto'
FROM SalesLT.[Product] as sp
WHERE sp.[Weight] > 1000
ORDER BY sp.[Name] ASC
