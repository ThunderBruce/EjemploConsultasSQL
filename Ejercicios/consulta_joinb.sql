--1
select nombre, saldo_deudor from PROVEEDOR JOIN ARTICULO 
ON id_prov=PROVEEDOR WHERE id_art="R3";
--2 (como son dos columnas que tienen el mismo nombre le damos un alias a cada columna para luego hacer referencia a dicha columna en la restricción)

SELECT A.id_alm, A.direccion from ALMACEN A join STOCK S
on A.id_alm=S.id_alm
WHERE S.id_art="P5"; 

--3
SELECT S.id_art from STOCK S join ALMACEN A
on S.id_alm=A.id_alm
WHERE A.direccion="CALLE 34,2" OR A.direccion="CALLE 34,12"
group by S.id_art;

--4
SELECT A.descripcion from ARTICULO A join STOCK S
on A.id_art=S.id_art
WHERE S.id_alm="A1";

--5
SELECT SUM((A.precio_vent-A.precio_comp)*S.cant) "Beneficio total" 
from ARTICULO A join STOCK S 
on A.id_art=S.id_art
where S.id_art="P3";

--6
SELECT S.id_art,SUM(S.cant) 'Cant. en stock' from STOCK S join ARTICULO A
on S.id_art=A.id_art
WHERE A.ord_pte is not null
GROUP BY S.id_art;

--7
SELECT A.descripcion, AL.direccion, S.cant 
from STOCK S join ARTICULO A 
on S.id_art=A.id_art
join ALMACEN AL
on S.id_alm=AL.id_alm
ORDER BY S.cant desc;

--8
SELECT nombre from PROVEEDOR left join ARTICULO
on id_prov=PROVEEDOR
WHERE id_art is null;

--9
SELECT APELLIDO 'Nombre Empleado', APELLIDO 'Nombre Jefe' from EMPLEADOS E JOIN DEPARTAMENTOS D
ON E.DEP_NO=D.DEP_NO
WHERE