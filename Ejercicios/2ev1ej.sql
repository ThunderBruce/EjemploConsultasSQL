--1

CREATE DEFINER=`root`@`localhost` PROCEDURE `procalm_1`(in pdeptno int)

BEGIN

select * from empleados where numde=pdeptno;

END
 CALL `practica1`.`procalm_1`(112);

--2
CREATE TABLE TEMP (COL1 FLOAT(9,2), COL2 FLOAT(9,2), MSG VARCHAR (40), FECHA DATE);

CREATE DEFINER=`root`@`localhost` PROCEDURE `procalm_2`()
BEGIN
	DECLARE v_col1 float (9,2);
	DECLARE v_col2 float (9,2);
	DECLARE v_msg varchar (40);
	DECLARE v_msg2 varchar (40);
	DECLARE v_fecha DATE DEFAULT '21/9/09';
    SET v_col1=1;
	mibucle: LOOP
		SET v_col2=v_col1*100;
		IF v_col1 = 11 THEN
			LEAVE mibucle;
		END IF;
		IF v_col1%2 = 0 THEN
			SET v_msg2= CONCAT(v_col1,' es par');
			INSERT INTO temp (COL1,COL2,MSG,FECHA) VALUES (v_col1,v_col2,v_msg2,v_fecha);
		ELSE
			SET v_msg= CONCAT(v_col1,' es impar');
			INSERT INTO temp (COL1,COL2,MSG,FECHA) VALUES (v_col1,v_col2,v_msg,v_fecha);
		END IF;
        SET v_col1=v_col1+1;
	END LOOP mibucle;
		
END

--3

create table CAT_EMP(
D_EMP INT(4),
EMPLEADO VARCHAR(10),
CATEG CHAR(1),
CONSTRAINT PK_D_EMP PRIMARY KEY (D_EMP)); 

CREATE DEFINER=`root`@`localhost` PROCEDURE `procalm_3`(in p_cod_emp integer)
BEGIN
	DECLARE V_SALARIO INT;
	declare V_NOMBRE VARCHAR(10);
	DECLARE V_CAT VARCHAR(1);
	SELECT nomem into V_NOMBRE
	FROM empleados
	where p_cod_emp=numem;
	SELECT salario into V_SALARIO
	FROM empleados
	where p_cod_emp=numem;
	if V_SALARIO>=400 then
	SET V_CAT='A';
	elseif 400 >V_SALARIO AND V_SALARIO>= 300 THEN
	SET V_CAT='B';
	ELSE 
	SET V_CAT='C';
	END IF;
	INSERT INTO CAT_EMP VALUES(p_cod_emp,V_NOMBRE,V_CAT);
END