--1
SELECT E.APELLIDO 
FROM EMPLEADOS E 
WHERE E.SALARIO>(SELECT SALARIO FROM EMPLEADOS
WHERE EMP_NO=E.DIRECTOR);
--2
select direccion from ALMACEN A WHERE EXISTS (SELECT id_alm from STOCK S WHERE S.id_alm=A.id_alm and S.id_art='P2');

--3
SELECT id_art, descripcion FROM ARTICULO A
WHERE EXISTS (SELECT * from STOCK S
WHERE S.id_art=A.id_art
having count(*)> (SELECT count(*)/2 FROM ALMACEN));

--4

