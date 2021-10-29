--1
CREATE DEFINER=`root`@`localhost` FUNCTION `funciones_1`(p_departamentos int (2)) RETURNS int(1)
BEGIN
DECLARE v_departamentos int (2);
DECLARE v_salir,v_ad int default 0;
declare c_cursor CURSOR FOR 
					SELECT numde from departamentos;
					
declare continue handler for not found set v_salir=1;

open c_cursor;
	bucle :LOOP
	fetch c_cursor into v_departamentos;
		IF v_salir=1 then 
		leave bucle;
		END IF;
		
		IF v_departamentos=p_departamentos then
			return 1;
		ELSE
			SET v_ad=1;
		END IF;
	END LOOP bucle;
close c_cursor;
IF v_ad=1 then
	return 0;
END IF;
END

--2
CREATE DEFINER=`root`@`localhost` FUNCTION `funciones_2`(dep int (2)) RETURNS int(11)
begin
declare v_existe int;
declare v_sumasal int (11);
set v_existe=funciones_1(dep);
IF v_existe=0 then 
	return -1;
ELSE
	set v_sumasal=(select sum(salario) from empleados where numde=dep);
    return v_sumasal;
END IF;
END

--3 En este ejercicio he decidido hacerlo en dos partes de manera que no me líe al ejecutar muchas funciones simultáneas.
-- Para ello he creado una funcion llamada funciones_3a que me va a retornar valores enteros dependiendo si el numero de reserva existe o no.
-- Dicho esto:
CREATE DEFINER=`root`@`localhost` FUNCTION `funciones_3a`(p_res int (11)) RETURNS int(1)
BEGIN 
DECLARE v_res int(11);
DECLARE v_salir, v_ad int default 0;
DECLARE c_cursor CURSOR FOR SELECT reserva from reservas;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_salir=1;
open c_cursor;
	bucle:LOOP
		FETCH c_cursor INTO v_res;
		IF v_salir=1 THEN
			leave bucle;
		END IF;
		
		IF v_res=p_res THEN
			RETURN 1;
		ELSE
			SET v_ad=1;
		END IF;
	END LOOP bucle;
CLOSE c_cursor;
IF v_ad=1 THEN
	return 0
END IF;
END;

CREATE DEFINER=`root`@`localhost` FUNCTION `funciones_3`(res int (11)) RETURNS int(7)
BEGIN 
DECLARE v_precio int(3);
DECLARE v_reserva int (11);
DECLARE v_fecha_entrada date;
DECLARE v_fecha_salida date;
DECLARE v_salir int default 0;
DECLARE diasTrans INT (3);
DECLARE precioFinal int (7);
DECLARE v_existe int;
						
DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_salir=1;
SET v_existe=funciones_3a(res);
IF v_existe=0 THEN
	RETURN -1;
ELSE
	SET v_reserva=(select reserva from reservas where reserva=res);
	SET v_fecha_entrada=(select entrada from reservas where reserva=res);
	SET v_fecha_salida=(select salida from reservas where reserva=res);
	SET v_precio=(select p.precio_dia from reservas r 
						join apartamentos a on r.apartamento=a.apartamento
						join precios p on a.grupo_precio=p.grupo 
						where reserva=res);
	SET diasTrans=(select datediff(v_fecha_salida,v_fecha_entrada)+1);
	SET precioFinal=diasTrans*v_precio;
	RETURN precioFinal;
END IF;
END;

--COMPROBAMOS SI FUNCIONA, EJEMPLO CASO HIPOTETICO
--199907002, 16, 4,131, 14 DIAS 