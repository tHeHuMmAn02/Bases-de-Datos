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
SELECT*
FROM Employee
WHERE ReportsTo IS NULL;

-- 2. Mostrar los empleados que han nacido en la década de los 60. 
SELECT*
FROM Employee
WHERE Birthdate BETWEEN "1961-01-01" AND "1970-12-31";

-- 3. Mostrar los distintos cargos existentes. 
SELECT DISTINCT Title
FROM Employee;

-- 4. Mostrar el número de empleados de cada uno de los cargos existentes
SELECT Title, COUNT(*) AS NumeroEmpleados
FROM Employee
GROUP BY Title;


-- Bloque 3 (sobre la tabla de canciones - track)

-- 1.Mostrar el mayor y el menor precio de una canción
SELECT 
    MAX(UnitPrice) AS PrecioMaximo,
    MIN(UnitPrice) AS PrecioMinimo
FROM Track;

-- 2.Mostrar el tiempo medio de las canciones (en milisegundos)
SELECT 
    AVG(Milliseconds) AS TiempoMedio_ms
FROM Track;

-- 3.Mostrar el tiempo medio en minutos de las canciones
SELECT 
    ROUND(AVG(Milliseconds) / 60000, 2) AS TiempoMedio_minutos
FROM Track;

select distinct nPaisId
FROM teditorial;

SELECT teditorial.cNombre,tlibro.cTitulo
FROM teditorial, tlibro
WHERE teditorial.nEditorialId=tlibro.nEditorialID
	AND teditorial.cNombre LIKE "A%";
    
/*Misma forma de hacerlo
*/
SELECT teditorial.cNombre,Tlibro.ctitulo
from teditorial INNER JOIN tlibro
	ON teditorial.nEditorialID=tlibro.nEditorialID
WHERE teditorial.cNombre LIKE "A%";

/* RECOMENDACIÓN UTILIZAR CON EL INNER JOIN Y ON
*/

/* SI TUVIERA ESTOS DATOS, AL HACER LA PRIMRA DE ARRIBA (136), SALDRÍA ESTO (esto es sin el WHERE)
Tlbiro					TEditorial
1 A 1980	1			1	Ed1		1
2 B 1992	1			2	Ed2		1
3 C 1980	2			

Ed1	A
Ed1	B
Ed1	C
Ed2	A
Ed2 B
Ed2	C
*/



select cSignatura, cTitulo
FROM tejemplar INNER JOIN tlibro
	on tejemplar.nLibroID = tlibro.nLibroID;
    
    
    -- Pagina 109, Actividad Propuesta 5.3
    
    SELECT tLibro.cTitulo, ttema.cNombre
    from tLibro inner join tlibrotema
		on Tlibro.nLibroID=tLibro.nLibroID
        inner join TTema
        on tlibrotema.nTemaId= TTema.nTemaID
WHERE tlibro.nEditorialID=32;


select tautor.cNombre, tautor.cApellidos, COUNT(*)
from tautor inner join tlibroautor
	ON tautor.nAutorID=tlibroautor.nAutorID
group by tautor.nAutorID, tautor.cNombre, tautor.cApellidos;


SELECT tautor.cNombre, tautor.cApellidos, MIN(tlibro.nAnyoPublicacion)
FROM tautor INNER JOIN tlibroautor
	ON tlibroautor.nAutorID=tautor.nAutorID
    inner join tlibro
	on tlibro.nLibroID=tlibroautor.nLibroID
group by tautor.nAutorID;


select tejemplar.CSignatura, tprestamo.dPrestamo, tlibro.cTitulo, 
tsocio.cNombre, tsocio.cApellidos
FROM tsocio INNER JOIN tprestamo
	ON tsocio.cNIF=tprestamo.cNIF
    INNER JOIN tejemplar
    ON tejemplar.CSignatura=tprestamo.cSignatura
    INNER JOIN tlibro
    ON tejemplar.nLibroID=tlibro.nLibroID;

INSERT INTO TSocio (cNIF, cNombre, cApellidos, cDireccion, cTelefono, dNacimiento, dAlta) VALUES
('50687452Y','José Luis', 'García Viñals', 'Joaquin Blume', '555 55 55 55', '2007-10-27', '2022-1-1');











