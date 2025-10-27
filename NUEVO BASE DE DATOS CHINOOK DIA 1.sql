-- EJERCICIOS SQL CHINOOK (mySQL) 
-- Bloque 1 (sobre la tabla de clientes - customer) 


-- 1. Mostrar el nombre y los apellidos de los clientes. 
SELECT FirstName, LastName
FROM customer;

-- 2.  Mostrar el nombre y los apellidos de los clientes con el formato “apellidos, nombre”. 
SELECT CONCAT(LastName, ', ', FirstName) AS NombreCompleto
FROM Customer;

-- 3. Mostrar los distintos paises de los clientes.
SELECT DISTINCT Country
FROM Customer;

-- 4. Mostrar los distintos paises de los clientes ordenados alfabéticamente. 
SELECT DISTINCT Country
FROM Customer
ORDER BY Country ASC;

-- 5. Mostrar el número de clientes.
SELECT COUNT(*) AS NumeroClientes
FROM Customer;

-- 6. Mostrar el número de clientes que disponen de correo electrónico.
SELECT COUNT(*) AS ClientesConEmail
FROM Customer
WHERE Email IS NOT NULL AND Email <> '';

-- 7. Mostrar el número de clientes que disponen de fax.
SELECT COUNT(*) AS ClientesConFax
FROM Customer
WHERE Fax IS NOT NULL AND Fax <> '';

-- 8. Mostrar los distintos países junto al número de clientes de cada uno de ellos.
SELECT Country, COUNT(*) AS NumeroClientes
FROM Customer
GROUP BY Country;

-- 9. Mostrar los distintos paises junto al numero de clientes de cada uno de ellos ordenados segun el numero de clientes de forma descendente.
SELECT Country, COUNT(*) AS NumeroClientes
FROM Customer
GROUP BY Country
ORDER BY NumeroClientes DESC;

-- 10. Mostrar los distintos países junto al número de clientes de cada uno de ellos ordenados según el número de clientes de forma descendente mostrando únicamente aquellos países con más de un cliente.
SELECT Country, COUNT(*) AS NumeroClientes
FROM Customer
GROUP BY Country
HAVING COUNT(*) > 1
ORDER BY NumeroClientes DESC;

-- 11. Mostrar los códigos postales de los clientes españoles.
SELECT PostalCode
FROM Customer
WHERE Country = 'Spain';


-- Bloque 2 (sobre la tabla de empleados - employee) 
-- 1. Mostrar los empleados que no reportan a nadie -suelen ser los jefes-. 
SELECT EmployeeId, FirstName, LastName, Title
FROM Employee
WHERE ReportsTo IS NULL;






