--1
---Selecciona los nombres y localidades de los departamentos de la Organización ordenados por la localidad a la que pertenecen. 

SELECT DNOMBRE, LOCALIDAD FROM DEPARTAMENTOS ORDER BY LOCALIDAD;

--2
---Se pide obtener el nombre de los empleados y el total del sueldo que perciben (salario+comisión) de aquellos cuyo salario anual 
---(sin contar la comisión) supere los 24.000,00€. 

SELECT APELLIDO, SALARIO + IFNULL(COMISION,0) 'Salario total'
FROM EMPLEADOS
where SALARIO*12>24000;

--3
---Se pide obtener los nombres de los empleados contratados antes de mayo del  81 que reciben algún tipo de comisión. 

SELECT APELLIDO FROM EMPLEADOS
WHERE FECHA_ALTA<'1981-05-01' AND COMISION IS NOT NULL;

--4
---Obtén una consulta de una sola columna llamada "Nombre y puesto" donde aparezca el nombre del empleado y a continuación su puesto de ---trabajo separado  únicamente por un espacio.
 
SELECT CONCAT(APELLIDO, ' ' , OFICIO) AS 'Nombre y puesto'
from EMPLEADOS;

--5
---Selecciona el nombre, el puesto, la fecha de alta, el tiempo en la empresa  contado en años y el salario   de los empleados que no
---sean analistas  y que cumplan una de las dos condiciones, un salario mayor de 2500€ al mes o que fueran contratados  
---despues del '30-JUN-81'.

SELECT APELLIDO,OFICIO,FECHA_ALTA, TIMESTAMPDIFF(YEAR,FECHA_ALTA,CURDATE()) AS 'Tiempo empresa', salario from EMPLEADOS
WHERE OFICIO!='ANALISTA' AND (SALARIO>2500 OR FECHA_ALTA>'1981-06-30');


--6
---Escribir los apellidos y fechas de alta de los empleados con el formato día  nombre del mes y año con cuatro cifras. 

SELECT APELLIDO,DATE_FORMAT(FECHA_ALTA, '%d/%M/%Y') FECHA FROM EMPLEADOS;

--7
---Visualizar cada empleado con los meses transcurridos desde su alta hasta hoy

SELECT APELLIDO, TIMESTAMPDIFF(MONTH,FECHA_ALTA,CURDATE()) AS MESES FROM EMPLEADOS;

--8
---Listar todos los empleados con su oficio formado por las tres primeras letras y terminado en "." 

SELECT APELLIDO, INSERT(OFICIO,4,100,'.') OFICIO FROM EMPLEADOS;

--9
---Visualizar los nombres de los departamentos con longitud hasta 36 caracteres, rellenando con "*" por la derecha, y con la inicial
---en mayúscula. 

SELECT rpad(DNOMBRE,36,'*') 'Consulta chunga' from DEPARTAMENTOS;







