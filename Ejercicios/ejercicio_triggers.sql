--Teoria
--	CREATE [DEFINER={cuenta_usuario | CURRENT_USER}] TRIGGER
--nombre_trigger
 --{BEFORE | AFTER}
 --{UPDATE | INSERT | DELETE}
 --ON tabla
 --FOR EACH ROW
 --cuerpo_del_trigger 
 --1
CREATE DEFINER = CURRENT_USER TRIGGER `reservas`.`reservas_BEFORE_INSERT` AFTER INSERT ON `reservas` FOR EACH ROW
BEGIN
DECLARE v_precio int ;
DECLARE v_dias int;
DECLARE v_precioTotal int;
SELECT (DATEDIFF(NEW.SALIDA,NEW.ENTRADA)+1) INTO v_dias FROM reservas where RESERVA=NEW.RESERVA;
SET v_precio=(select p.precio_dia from reservas r 
						join apartamentos a on r.apartamento=a.apartamento
						join precios p on a.grupo_precio=p.grupo 
						where RESERVA=NEW.RESERVA);
SET v_precioTotal=(v_dias*v_precio);
INSERT INTO facturacion VALUES (NEW.RESERVA, v_precioTotal, NULL, "Pendiente de pago");
END

--2 
--PRIMERO DEBEMOS CREAR LA TABLA GUIASAL
CREATE TABLE GUIA_SAL (
DEPARTAMENTO INT (3),
MINSAL INT (3),
MAXSAL INT (3));

INSERT INTO GUIA_SAL (DEPARTAMENTO, MINSAL, MAXSAL) VALUES (100,200,370),(110,150,350),(111,100,200),(112,200,400),(120,300,550),(121,310,560),(122,320,560),(130,300,450);

-- CREACION DEL TRIGGER.
--    =============================BEFORE UPDATE=============================
CREATE DEFINER=`root`@`localhost` TRIGGER `practica1`.`Rev_salario_bu` BEFORE UPDATE ON `empleados` FOR EACH ROW
BEGIN
DECLARE v_mimensaje varchar (70);
DECLARE v_salario int (11);
DECLARE v_departamento, v_minsal, v_maxsal int (3);
DECLARE v_salir, v_valido INT DEFAULT 0;
DECLARE ERR_IDENTIFICADOR_NO_VALIDO CONDITION FOR SQLSTATE '45000';
DECLARE c_cursor CURSOR FOR SELECT * FROM GUIA_SAL; 
declare continue handler for not found set v_salir=1;
OPEN c_cursor;
	bucle: LOOP
		FETCH c_cursor INTO v_departamento, v_minsal, v_maxsal;
		IF v_salir=1 THEN
			leave bucle;
		END IF;
		IF v_departamento=OLD.numde THEN 
			IF NEW.salario>=v_minsal && NEW.salario=<v_maxsal THEN 
				SET v_valido=1;
			END IF;
		END IF;
	END LOOP bucle;
CLOSE c_cursor;
SET v_mimensaje=(SELECT(CONCAT('¡Salario ',NEW.salario,'$ esta fuera de rango de DEPARTAMENTO ',NEW.numde,' para el empleado', NEW.nomem)));
IF v_valido=1 THEN
	SIGNAL ERR_IDENTIFICADOR_NO_VALIDO -- raise an error
	SET MESSAGE_TEXT=v_mimensaje;	
END IF;
END


--    =============================BEFORE INSERT=============================
CREATE DEFINER=`root`@`localhost` TRIGGER `practica1`.`Rev_salario_bi` BEFORE INSERT ON `empleados` FOR EACH ROW
BEGIN
DECLARE v_mimensaje varchar (70);
DECLARE v_salario int (11);
DECLARE v_departamento, v_minsal, v_maxsal int (3);
DECLARE v_salir, v_valido INT DEFAULT 0;
DECLARE ERR_IDENTIFICADOR_NO_VALIDO CONDITION FOR SQLSTATE '45000';
DECLARE c_cursor CURSOR FOR SELECT * FROM GUIA_SAL; 
declare continue handler for not found set v_salir=1;
OPEN c_cursor;
	bucle: LOOP
		FETCH c_cursor INTO v_departamento, v_minsal, v_maxsal;
		IF v_salir=1 THEN
			leave bucle;
		END IF;
		IF v_departamento=NEW.numde THEN 
			IF NEW.salario>=v_minsal && NEW.salario=<v_maxsal THEN 
				SET v_valido=1;
			END IF;
		END IF;
	END LOOP bucle;
CLOSE c_cursor;
SET v_mimensaje=(SELECT(CONCAT('¡Salario ',NEW.salario,'$ esta fuera de rango de DEPARTAMENTO ',NEW.numde,' para el empleado', NEW.nomem)));
IF v_valido=1 THEN
	SIGNAL ERR_IDENTIFICADOR_NO_VALIDO -- raise an error
	SET MESSAGE_TEXT=v_mimensaje;	
END IF;
END

--CLASE CURSORES ANINDADOS
--BEGIN
--DECLARE CURSOR
--DECLARE CONTINUE HANDLER
--OPEN
--LOOP
--FETCH // PRIMER CURSOR
	-- BEGIN 
	--DECLARE
	--DECLARE CURSOR
	--DECLARE CONTINUE
	--OPEN 
	--LOOP
	--FETCH  //SEGUNDO CURSOR
		--...
	--END LOOP
	--CLOSE
	--END
--END LOOP
--CLOSE
--END