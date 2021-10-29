---Todas las consultas se realizan sobre las tablas ARTICULO, ALMACEN, STOCK y PROVEEDOR
--1
---Obtener el nombre y el saldo deudor del proveedor del articulo ‘R3’. 

SELECT nombre,saldo_deudor 'saldo deudor'
from PROVEEDOR P JOIN ARTICULO A
ON P.id_prov=A.PROVEEDOR
WHERE id_art='R3';

--2
--- Obtener la clave y dirección de los almacenes donde esta almacenado el artículo ‘P5’. 

SELECT A.id_alm, A.direccion 
FROM ALMACEN A JOIN STOCK S
ON A.id_alm=S.id_alm
WHERE S.id_art='P5';

--3
---Obtener  las claves de los artículos almacenados en los posibles almacenes de la calle 34.

SELECT distinct(S.id_art)
from STOCK S JOIN ALMACEN A
ON  S.id_alm=A.id_alm
WHERE direccion='CALLE 34,2' OR direccion='CALLE 34,12';


--4
---Obtener la descripción de los artículos almacenados  en el almacén A1. 

SELECT descripcion
FROM ARTICULO JOIN STOCK
ON ARTICULO.id_art=STOCK.id_art
WHERE STOCK.id_alm='A1';

--5
---Obtener  el beneficio total que se obtendría con la venta de todos los artículos P3 almacenados. 

select SUM(S.cant*(A.precio_vent-A.precio_comp))'BENEFICIO TOTAL'
from ARTICULO A JOIN STOCK S
ON A.id_art=S.id_art
WHERE S.id_art='P3';

--6
---Indica las cantidades que hay en stock de aquellos artículos que tienen orden pendiente.

SELECT S.id_art, sum(S.cant)'Cant. en stock'
FROM STOCK S JOIN ARTICULO A
ON S.id_art=A.id_art
WHERE A.ord_pte is not null
group by S.id_art;

--7
---Mostrar por pantalla una tabla similar a la tabla STOCK  sustituyendo las claves ID_ART, ID_ALM por la descripción 
---del artículo y la dirección del almacén respectivamente ordenado por cantidad de mayor a menor 

select A.descripcion,AL.direccion,S.cant
from ARTICULO A JOIN STOCK S
ON A.id_art=S.id_art
JOIN ALMACEN AL 
ON S.id_alm=AL.id_alm
ORDER BY S.cant desc;

--8
---Mostrar los nombres de los proveedores que no suministran ningún artículo.

SELECT P.nombre 
from PROVEEDOR P LEFT JOIN ARTICULO A
ON P.id_prov=A.PROVEEDOR
WHERE A.id_art IS null;






