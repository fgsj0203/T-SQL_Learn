/*
Author: Francisco
College: Universidade Estacio de Sa
Course: Ciencia da Computacao
Date: 22-01-2026, in format Brazil
Database example: AdventureWorksLT2025
*/

-- Exercise 01: Liste todos os produtos com preco de tabela (ListPrice) superior a $1.000. / Return all producst with price bigger $1.000
SELECT *
FROM SalesLT.[Product] as sp
WHERE sp.ListPrice > 1000

-- Exercise 02: Recupere os nomes das empresas que possuem um vendedor (SalesPerson) especifico (ex: 'adventure-works\linda3'). / Return of names companies with have salesPerson specific (ex: 'adventure-works\linda3')
SELECT sc.CompanyName as 'Nome da empresa'
FROM SalesLT.Customer as sc
WHERE sc.SalesPerson = 'adventure-works\linda3'

-- Exercise 03: Selecione produtos que pesam mais de 1.000g e estao na cor 'Black'. / Return products of weight bigger 1000g and color is 'Black'
SELECT *
FROM SalesLT.[Product] as sp
WHERE sp.[Weight] > 1000 AND sp.Color = 'Black'

-- Exercise 04: Filtre clientes que nao possuem um numero de telefone registrado. / Return customer of have not number cellphone.
SELECT *
FROM SalesLT.Customer as sc
WHERE sc.Phone IS NULL

-- Exercise 05: Liste pedidos (SalesOrderHeader) onde o valor total (TotalDue) seja entre $5.000 e $20.000. / Return orders with value total in range 5.000 and 20.000
SELECT *
FROM SalesLT.SalesOrderHeader as ssoh
where ssoh.TotalDue BETWEEN 5000 AND 20000

