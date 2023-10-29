--GROUP MEMBER : BRANDON CHAI-2501999261, MATTHEW JUSUF-2501998946, STEPHAN TJUARSA-2501994185


--1.
SELECT customer.id, customer.name, COUNT(producttransaction.quantity) 
FROM customer JOIN producttransaction 
ON producttransaction.customerid = customer.id  
WHERE YEAR(producttransaction.date) = 2021 
AND YEAR(customer.date) = 2001

--2.
SELECT product.id, product.name, UPPER(category.name) FROM product JOIN category
ON product.categoryid = category.id JOIN producttransaction
ON producttransaction.productid = product.id
WHERE YEAR(producttransaction.date) = 2020

--3.
SELECT product.id, UPPER(product.name), product.price*producttransaction.quantity AS income ,COUNT(producttransaction.quantity) AS totaltransaction
FROM product JOIN category
ON product.categoryid = category.id JOIN producttransaction
ON producttransaction.productid = product.id
WHERE category.name = 'Mouse' OR category.name = 'Keyboard'
AND product.name LIKE "%{gaming}%"
ORDERED BY income DESC

--4.
SELECT staff.id, staff.name, LEFT(staff.email,LOCATE('@',staff.email)-1) AS 'username', COUNT(producttransaction.quantity) AS 'TotalTransaction'
FROM product JOIN category
ON product.categoryid = category.id JOIN producttransaction
ON producttransaction.productid = product.id JOIN staff
ON staff.id = producttransaction.staffid
WHERE staff.gender = 'male'
AND YEAR(producttransaction.date) = 2019

--5.
SELECT RIGTH(vendor.name) AS VendorNameID. vendor.phone, YEAR(vendor.dob) AS YearOfBirth , COUNT(componenttransaction.quantity) AS transactioncount
FROM vendor JOIN componenttransaction
ON vendor.id = componenttransaction.vendorid
WHERE transactioncount > 60 AND vendor.gender = 'female'  
ORDERED BY transactioncount DESC

--6.
SELECT component.id, LEFT(component.description,1) AS ComponentKeyword 
FROM component JOIN componenttransaction
ON component.id = componenttransaction.componentid
WHERE component.prince>AVG(component.price) AND
YEAR(componenttransaction.date)=2020

--7.
SELECT CONCAT(RIGHT(product.id),LEFT(product.name)) AS ProductIdentifier, product.weight, product.price, COUNT(producttransaction.id) AS TransactionCount, COUNT(producttransaction.quantity) AS TotalQty 
FROM product JOIN category
ON product.categoryid = category.id JOIN producttransaction
ON producttransaction.productid = product.id JOIN customer
ON customer.id = producttransaction.customerid
WHERE YEAR(producttransaction.date) > 2019
AND TransactionCount > AVG(TransactionCount)

--8.
SELECT customer.name , LEFT(staff.email,LOCATE('@',customer.email)-1) AS EmailProvider, COUNT(producttransaction.quantity) AS TotalQty
FROM product JOIN category
ON product.categoryid = category.id JOIN producttransaction
ON producttransaction.productid = product.id JOIN customer
ON customer.id = producttransaction.customerid
WHERE customer.gender = 'male'
AND TotalQty = AVG(TotalQty)

--9.
SELECT staff.name, REPLACE(staff.phone,'+62','0') AS StaffPhone, YEAR(staff.dob) AS YearOfBirth, SUM(product.price * product.quantity) AS Earning, COUNT(producttransaction.*) AS TotalTransactions
FROM product JOIN category
ON product.categoryid = category.id JOIN producttransaction
ON producttransaction.productid = product.id JOIN staff
ON staff.id = producttransaction.staffid
WHERE staff.gender = 'female'
AND product.quantity > 0

--10.
SELECT customer.id, LOWER(customer.name) AS CustomerName, (SELECT name FROM students LIMIT 1) AS FirstTransaction, (SELECT name FROM customer LIMIT 1) AS FirstTransaction ,(SELECT name FROM customer ORDER BY date DESC LIMIT 1) AS LastTransaction
FROM product JOIN category
ON product.categoryid = category.id JOIN producttransaction
ON producttransaction.productid = product.id JOIN customer
ON customer.id = producttransaction.customerid JOIN staff
ON staff.id = producttransaction.staffid
WHERE LENGHT(customer.name) > 1
AND staff.salary>7000000
ORDER BY customer.name ASC