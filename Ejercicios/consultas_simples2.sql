
--1
---Obtener el número total de países

select count(*)'Numero de paises' from country;

--2
---Obtener el numero total de regiones del planeta (columna Region)

select count(DISTINCT Region)'Numero de regiones' from country;


--3
---Obtener el número de idiomas hablados en Estados Unidos (código 'USA')

select count(*) 'Idioma USA'
from countrylanguage WHERE CountryCode='USA';

--4
---Obtener la suma de población de las principales ciudades de Estados Unidos (código 'USA') 

SELECT format(SUM(Population),0) 'Población ciudades USA' FROM city
where CountryCode='USA';

--5
---Obtener la distribución de la población mundial por continentes

select Continent, round(sum(Population/1000000),0)'Mill. habitantes' from country
group by Continent;

--6
---Obtener los códigos de los países que hablan mas de 10 idiomas diferentes

SELECT CountryCode from countrylanguage
group by CountryCode
having count(Language)>10;

--7
---Obtener un listado con las distintas formas de gobierno y cuantos países siguen cada una de ellas

select distinct GovernmentForm, count(name)'Num. paises' from country
group by GovernmentForm 
having count(*)>2;

--8
---Obtener la superficie total de cada continente, el producto interior bruto medio y la esperanza de vida media de la población.

select Continent, round(sum(SurfaceArea/1000000),0)'Ext. Mill. Km2', round(avg(GNP),0)'PIB $ ',format(AVG(LifeExpectancy),0)' Expectativa de vida'from country
group by Continent;

--9
---Obtener un listado los tres idiomas mas hablados en el mundo por países con el numero de países que lo hablan

select Language, count(*) from countrylanguage
group by Language
order by count(*) desc limit 3;
