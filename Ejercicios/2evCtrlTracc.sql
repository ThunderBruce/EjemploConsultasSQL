--Primero debemos crear la nueva columna en la tabla empleados llamado estrellas, para ello:
ALTER TABLE empleados ADD COLUMN estrellas VARCHAR(10)

--Hecho esto creamos el procedimiento


CREATE DEFINER=`root`@`localhost` PROCEDURE `ejercicio3_2`()
BEGIN
DECLARE v_salir INT DEFAULT 0;
DECLARE v_numestrella INT;
DECLARE v_numem, v_salario INT (11);
DECLARE v_estrella CHAR;
DECLARE v_columnes VARCHAR(10);
DECLARE c_cursor CURSOR FOR SELECT numem, salario FROM EMPLEADOS;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_salir=1;
OPEN c_cursor;
bucle :LOOP
	FETCH c_cursor INTO v_numem, v_salario;
	IF v_salir=1 THEN 
		LEAVE bucle;
	END IF;
	SET v_estrella='*';
	SET v_numestrella=(SELECT TRUNCATE((v_salario/100),0));
	SET v_columnes=(SELECT RPAD("",v_numestrella,v_estrella));
	UPDATE EMPLEADOS set estrellas=v_columnes WHERE numem=v_numem;
END LOOP;
CLOSE c_cursor;
END

-- Ahora hacemos el procedimiento con controles transaccionales

CREATE DEFINER=`root`@`localhost` PROCEDURE `ejercicio3_2b`()
BEGIN
DECLARE v_salir INT DEFAULT 0; 
DECLARE v_numestrella INT;
DECLARE v_numem, v_salario INT (11);
DECLARE v_estrella CHAR;
DECLARE v_columnes VARCHAR(10);
DECLARE c_cursor CURSOR FOR SELECT numem, salario FROM EMPLEADOS;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_salir=1;
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN
ROLLBACK;
SELECT 'Ocurrio un error. Proceso Terminado' AS MENSAJE ERROR;
END;
OPEN c_cursor;
SET autocommit="OFF";
bucle :LOOP
	FETCH c_cursor INTO v_numem, v_salario;
	IF v_salir=1 THEN 
		LEAVE bucle;
	END IF;
	SET v_estrella='*';
	SET v_numestrella=(SELECT TRUNCATE((v_salario/100),0));
	SET v_columnes=(SELECT RPAD("",v_numestrella,v_estrella));
	UPDATE EMPLEADOS set estrellas=v_columnes WHERE numem=v_numem;
END LOOP;
COMMIT;
CLOSE c_cursor;
END