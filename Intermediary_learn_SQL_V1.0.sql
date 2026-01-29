/*
Author: Francisco Gomes da Silva Junior
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

-- Exercise 23: Relacione o endereco de entrega (ShipToAddressID) com a tabela de enderecos para mostrar a cidade de cada pedido. / Return address ship and table address for display city order
SELECT * 
FROM SalesLT.[Address] as sa INNER JOIN SalesLT.SalesOrderHeader as ssoh ON sa.AddressID = ssoh.ShipToAddressID

-- Exercise 24: Liste todos os produtos e os nomes de seus modelos (ProductModel). / Return all products and names models product
SELECT *
FROM SalesLT.[Product] as sp INNER JOIN SalesLT.ProductModel as spm ON sp.ProductModelID = spm.ProductModelID

-- Exercise 25: Gere um relatorio com o nome do cliente e o valor total gasto por ele. / Generate report with name customer and value total in month
SELECT sc.[FirstName] as 'Nome', ssoh.TotalDue as 'Gasto total'
FROM SalesLT.Customer as sc INNER JOIN SalesLT.SalesOrderHeader ssoh ON sc.CustomerID = ssoh.CustomerID

-- Exercise 26: Mostre os itens de um pedido (SalesOrderDetail) junto com o nome do produto vendido. / Return Order with name product sales
SELECT sp.[Name] as 'Nome do produto', ssod.SalesOrderDetailID as 'ID do pedido'
FROM SalesLT.SalesOrderDetail as ssod INNER JOIN SalesLT.[Product] as sp ON ssod.ProductID = sp.ProductID

-- Exercise 27: Liste clientes e seus respectivos endereços (usando CustomerAddress e Address). / Return customer and address respectives
SELECT *
FROM SalesLT.Customer as sc INNER JOIN SalesLT.[Address] as sa ON sc.CustomerID = sa.AddressID

-- Exercise 28: Exiba a hierarquia: Nome da Categoria e Nome da Categoria Pai. / Return name category and category father
SELECT spc.ParentProductCategoryID as 'Categoria pai', sp.[Name] as 'Nome da categoria'
FROM SalesLT.ProductCategory as spc INNER JOIN SalesLT.[Product] as sp ON spc.ProductCategoryID = sp.ProductCategoryID

-- Exercise 29: Liste pedidos e o metodo de envio (se disponivel) ou endereco de cobranca. / Return orders and method about ship in address
SELECT ssoh.ShipMethod as 'Metodo de envio', ssod.SalesOrderID as 'ID dos pedidos de venda'
FROM SalesLT.SalesOrderHeader as ssoh INNER JOIN SalesLT.SalesOrderDetail as ssod ON ssoh.SalesOrderID = ssod.SalesOrderID

-- Exercise 30: Mostre o total de itens vendidos por categoria de produto. / Return total of itens sales for category product
SElECT COUNT(spc.[Name]) as 'Quantidade de produtos', spc.[Name] as 'Nome da categoria'
FROM SalesLT.[Product] as sp INNER JOIN SalesLT.ProductCategory as spc ON sp.ProductCategoryID = spc.ProductCategoryID
GROUP BY spc.[Name]

-- Exercise 31: Liste pedidos feitos por clientes que moram no Canada. / Return orders with customers of living in Canada
SELECT *
FROM SalesLT.SalesOrderHeader as ssoh INNER JOIN SalesLT.CustomerAddress as sca ON ssoh.CustomerID = sca.CustomerID
     INNER JOIN SalesLT.[Address] as sa ON sa.AddressID = sca.AddressID
WHERE sa.City = 'Canada'

-- Exercise 32: Liste o nome do produto, categoria e descricao / Return list of name product, category and description Product
SELECT sp.[Name] as 'Nome do produto', spc.Name as 'Categoria do produto', spd.[Description] as 'Descricao do produto'
FROM SalesLT.[Product] as sp INNER JOIN SalesLT.ProductCategory as spc ON sp.ProductCategoryID = spc.ProductCategoryID
     INNER JOIN SalesLT.ProductDescription as spd ON spc.ProductCategoryID = spd.ProductDescriptionID

-- Exercise 33: Exiba o nome do cliente e o detalhe do produto mais caro que ele comprou. / Return customer and details of product with bigger price 
SELECT TOP 1 sc.FirstName + ' ' + sc.LastName as 'Nome completo', ssod.UnitPrice as 'Preco unitario'
FROM SalesLT.Customer as sc INNER JOIN SalesLT.SalesOrderHeader as ssoh ON sc.CustomerID = ssoh.CustomerID
     INNER JOIN SalesLT.SalesOrderDetail as ssod ON ssod.SalesOrderID = ssoh.SalesOrderID
ORDER BY ssod.UnitPrice DESC

-- Exercise 34: Liste enderecos de clientes que possuem o tipo de endereco 'Main Office'. / Return address of customers have address type 'Main office'
SELECT sa.AddressLine1 as 'Endereco principal', sca.AddressType as 'Tipo endereco'
FROM SalesLT.Customer as sc INNER JOIN SalesLT.CustomerAddress as sca ON sc.CustomerID = sca.CustomerID
     INNER JOIN SalesLT.[Address] as sa ON sa.AddressID = sca.AddressID
WHERE sca.AddressType = 'Main Office'

-- Exercise 35: Gere uma lista de modelos de produtos que nao tem descricao associada. / Return list of models is not have description
SELECT *
FROM SalesLT.ProductModelProductDescription as pmpd RIGHT JOIN SalesLT.ProductModel as pm ON pmpd.ProductModelID = pm.ProductModelID
WHERE pm.CatalogDescription IS NULL


/*
Manipulation Strings
Date: 27-01-2026, in format Brazil
*/

-- Exercise 01: Concatene o FirstName e LastName para criar o nome completo. / Concatenate Firstname with Lastname and former Name complete
SELECT c.FirstName + ' ' + c.LastName as 'Nome completo'
FROM SalesLT.Customer as c

-- Exercise 02: Transforme todos os nomes de empresas para letras maiusculas. / Transform names of companies in mode Upper Case
SELECT UPPER (c.CompanyName) as 'Nome Empresa'
FROM SalesLT.Customer as c

-- Exercise 03: Extraia os primeiros 3 caracteres do ProductNumber. / Extract a third characters of column 'ProductNumber'
SELECT LEFT(p.ProductNumber, 3) as 'Parte do numero do produto'
FROM SalesLT.[Product] as p

-- Exercise 04: Substitua o sufixo 'Road' por 'Rd.' nos enderecos. / Replace sufix 'Road' for 'Rd' in address
SELECT  REPLACE ('Road','ad','rd')
FROM SalesLT.[Address] as a


-- Exercise 05: Localize a posicao do caractere '-' no ProductNumber. / Tracking position of character '-' in column ProductNumber
SELECT CHARINDEX('-', p.ProductNumber) as 'Posicao do caracter (-)'
FROM SalesLT.[Product] as p

-- Exercise 06: Crie um "Nickname" para o produto usando as 2 primeiras letras do nome e as 2 ultimas. / Return "NickName" for product with first 2 letters and 2 last letters
SELECT LEFT (p.[Name], 2) + ' ' + RIGHT (p.[Name], 2) as 'Nickname - apelido'
FROM SalesLT.[Product] as p

-- Exercise 07: Verifique se o e-mail do cliente contem o caractere '@'. / Verify if e-mail customer exists '@'
SELECT *
FROM SalesLT.Customer as c
WHERE c.EmailAddress LIKE '%@%'

-- Exercise 08: Inverta a string do nome do modelo do produto (para fins de codificacao). / Inverter String of name model product
SELECT REVERSE (pm.[Name]) as 'Nome invertido do Modelo'
FROM SalesLT.ProductModel as pm
ORDER BY pm.[Name] ASC

-- Exercise 09: Gere um codigo de barras ficticio: ProductID + Color. / Generate fake code using: ProductID + Color
SELECT p.ProductID, p.Color, CAST(p.ProductID AS VARCHAR) + ISNULL (p.Color, 'N/A') as 'Code Bar'
FROM SalesLT.[Product] as p

/*
Operation Maths
Date: 29-01-2026, in format Brazil
*/

-- Exercise 01: Calcule a margem de lucro bruta unitaria por produto (ListPrice - StandardCost). / Return edge brute unit price of product
SELECT p.[Name] as 'Nome do produto', (p.StandardCost - p.ListPrice) as 'Margem bruta de preco unitario'
FROM SalesLT.[Product] as p

-- Exercise 02: Aplique um reajuste de 10% em todos os preços de tabela. / Inserting readjustment of 10% in all price products
SELECT p.ListPrice as 'Preco original', p.ListPrice + (p.ListPrice * 0.10) as 'Preco com Reajuste de 10%'
FROM SalesLT.[Product] as p

-- Exercise 03: Calcule o peso total de um pedido (Quantidade x Peso do produto). / Calculate weight total of order (Amount * weight product)
SELECT sod.OrderQty * p.[Weight] as 'Peso total do pedido'
FROM SalesLT.SalesOrderDetail as sod INNER JOIN SalesLT.[Product] as p ON sod.ProductID = p.ProductID

-- Exercise 04: Descubra qual o valor medio das vendas por cliente. / Return value average of sales customer 
SELECT AVG(soh.TotalDue) as 'Media do valor' , COUNT(*) as 'Quantidade por cliente'
FROM SalesLT.SalesOrderHeader as soh INNER JOIN SalesLT.Customer as c ON soh.CustomerID = c.CustomerID
GROUP BY c.CustomerID
-- (!!! Fix in development / Solucao em desenvolvimento !!!) 

-- Exercise 05: Calcule a diferenca entre o preco sugerido (ListPrice) e o preco vendido (UnitPrice). / Calculate difference between (ListPrice) and (UnitPrice)
SELECT p.ListPrice as 'Preco original sugerido', sod.UnitPrice as 'Preco vendido', p.ListPrice - sod.UnitPrice as 'Diferenca entre preco sugerido e vendido'
FROM SalesLT.[Product] as p INNER JOIN SalesLT.SalesOrderDetail as sod ON p.ProductID = sod.ProductID 

-- Exercise 06: Determine o maior e o menor preco de venda por categoria. / Return a bigger and smaller price of sales based in category
SELECT MAX(sod.UnitPrice) as 'Maior preco', MIN(sod.UnitPrice) as 'Menor preco', pc.[Name] as 'Categoria produto'
FROM SalesLT.SalesOrderDetail as sod INNER JOIN SalesLT.[Product] as p ON sod.ProductID = p.ProductID
     INNER JOIN SalesLT.ProductCategory as pc ON p.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.[Name]
