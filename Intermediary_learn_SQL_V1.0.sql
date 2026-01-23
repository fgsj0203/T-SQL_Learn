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

-- Exercise 06: Mostre produtos cujo ProductNumber comece com 'BK-'. / Return products of ProductNumber is start 'BK-'
SELECT *
FROM SalesLT.[Product] as sp
WHERE sp.ProductNumber LIKE 'BK-%'

-- Exercise 07: Localize enderecos que estao na cidade de 'Toronto'. / Return all address of in city 'Toronto'
SELECT *
FROM SalesLT.[Address] as sa
WHERE sa.City = 'Toronto'

-- Exercise 08: Selecione modelos de produtos (ProductModel) que contenham a palavra 'Mountain' no nome. / Return models of product of contain word 'Mountain' in name
SELECT *
FROM SalesLT.[ProductModel] as spm
WHERE spm.[Name] LIKE '%Mountain%'

-- Exercise 09: Liste vendas que nao tiveram desconto aplicado (UnitPriceDiscount = 0). / Return orders of not have discount in price
SELECT *
FROM SalesLT.SalesOrderDetail as ssod
WHERE ssod.UnitPriceDiscount = 0

-- Exercise 10: Recupere clientes que tem o titulo 'Ms.' ou 'Mrs.'. / Return customers of title contain "Ms." or "Mrs."
SELECT *
FROM SalesLT.Customer as sc
WHERE sc.Title = 'Ms.' OR sc.Title = 'Mrs.' 

-- Exercise 11: Filtre produtos que possuem uma data de termino de venda (SellEndDate) definida. / Filter product of have date of end sales definied
SELECT *
FROM SalesLT.[Product] as sp
WHERE sp.SellEndDate IS NOT NULL

-- Exercise 12: Mostre pedidos com status 'Shipped' (Status = 5). / Return orders with status = 5
SELECT *
FROM SalesLT.[SalesOrderHeader] as ssoh
WHERE ssoh.[Status] = 5

-- Exercise 13: Liste categorias de produtos que nao possuem uma categoria pai (ParentProductCategoryID e nulo). / Return categories of product of not have father categorie
SELECT *
FROM SalesLT.ProductCategory as spc
WHERE spc.ParentProductCategoryID IS NULL

-- Exercise 14: Selecione clientes cujo dominio de e-mail termina em '@adventure-works.com'. / Return customers of domain email finished in '@adventure-works.com'
SELECT *
FROM SalesLT.Customer as sc
WHERE sc.EmailAddress LIKE '%adventure-works.com'

-- Exercise 15: Localize produtos com StandardCost menor que $50 mas ListPrice maior que $100. / Return products if StandardCost is smaller $50 but ListPrice is bigger $100
SELECT *
FROM SalesLT.[Product] as sp
WHERE sp.StandardCost < 50 AND sp.ListPrice > 100

-- Exercise 16: Liste enderecos que pertencem ao estado ('StateProvince') de 'California'. / Return address of belongs in StateProvince = 'California'
SELECT *
FROM SalesLT.[Address] as sa
WHERE sa.StateProvince IN ('California')

-- Exercise 17: Recupere pedidos feitos atraves de um numero de compra (PurchaseOrderNumber) especifico. / Return orders of realize with number of buy specific
SELECT *
FROM SalesLT.SalesOrderHeader as ssoh
WHERE ssoh.PurchaseOrderNumber = 'PO348186287'

-- Exercise 18: Filtre produtos que ainda estao em linha de producao (sem SellEndDate). / Return producst of not have SellEndDate
SELECT *
FROM SalesLT.[Product] as sp
WHERE sp.SellEndDate IS NULL

-- Exercise 19: Mostre clientes que possuem a palavra 'Bike' no nome da empresa. / Return customers of have word 'Bike' in name company
SELECT *
FROM SalesLT.[Customer] as sc
WHERE sc.CompanyName LIKE '%Bike%'

-- Exercise 20: Selecione vendas onde a quantidade pedida (OrderQty) seja maior que 20 unidades. / Return sales in amount is lost bigger 20 units
SELECT *
FROM SalesLT.SalesOrderDetail as ssod
WHERE ssod.OrderQty > 20


/*
Joins and relationship tables
Date: 23-01-2026, in format Brazil
*/

-- Exercise 21: Liste o nome do cliente e o numero do pedido (SalesOrderNumber) correspondente. / Return name customer and number order correspondent
SELECT sc.FirstName + ' ' + sc.MiddleName as 'Nome completo', ssoh.SalesOrderNumber as 'Numero do pedido'
FROM SalesLT.Customer as sc INNER JOIN SalesLT.SalesOrderHeader as ssoh ON sc.CustomerID = ssoh.CustomerID

-- Exercise 22: Mostre o nome do produto e o nome da sua categoria (ProductCategory).
SELECT sp.[Name] as 'Nome do produto', spc.[Name] as 'Categoria do produto'
FROM SalesLT.[Product] as sp INNER JOIN SalesLT.[ProductCategory] as spc ON sp.ProductCategoryID = spc.ProductCategoryID
