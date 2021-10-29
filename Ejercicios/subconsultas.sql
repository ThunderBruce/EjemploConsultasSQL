--1 
SELECT Name from country 
where GNP>(SELECT GNP FROM country where Name='France');

--2
select Name from city 
where id=(SELECT capital 
from country 
where Continent='Asia' 
order by SurfaceArea  
limit 1);

--3
SELECT Name from country 
where Code in(select CountryCode from countrylanguage
GROUP BY CountryCode
HAVING COUNT(Language) > 10 
) ;

--4 
select Name from city
where CountryCode in(select Code from country where Name = "France") and 
District in(select District from city where Name = "Paris");

--5
select APELLIDO, OFICIO from EMPLEADOS
where DEP_NO in (SELECT DEP_NO from DEPARTAMENTOS WHERE DEP_NO = 10) AND OFICIO IN (SELECT OFICIO FROM EMPLEADOS WHERE DEP_NO=30);

-- OPCION FRANS:
SELECT APELLIDO, OFICIO
FROM EMPLEADOS 
WHERE DEP_NO=10 AND OFICIO IN(SELECT OFICIO
FROM EMPLEADOS
WHERE DEP_NO IN (SELECT DEP_NO 
FROM DEPARTAMENTOS
WHERE DNOMBRE='VENTAS'));

--6 
SELECT descripcion from ARTICULO 
WHERE id_art in (select id_art from STOCK group by id_art HAVING COUNT(id_alm) = 1); 

