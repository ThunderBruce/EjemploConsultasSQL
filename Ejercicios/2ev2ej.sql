--! Explicacion, si un select devuelve una sola fila y dicho valor se quiere insertar en una variable se puede hacer de esta manera--
--SET V_LOCAL=(SELECT n:columna FROM tabla WHERE condicion);
--SELECT n_columna INTO v_local FROM tabla WHERE condicion;
--SELECT n_col1, n_col2 INTO v_local1,v_local2 FROM tabla ...);

--1 
CREATE DEFINER=`root`@`localhost` PROCEDURE `procalm_4`(in p_cont integer)
BEGIN
DECLARE v_salario, v_numem float (9,2);
DECLARE v_nomem varchar (40);
DECLARE v_cont INT (2) default 0;
DECLARE c_empleados cursor for 
select salario, numem, nomem
from empleados
order by salario desc;
declare continue handler for not found set v_cont=p_cont;
open c_empleados;
emp_cursor: loop
	fetch c_empleados into v_salario, v_numem, v_nomem;
	if v_cont=p_cont then
		leave emp_cursor;
	end if;
	set v_cont=v_cont+1;
	insert into temp values (v_salario, v_numem,v_nomem,'21-1-09');
end loop;
close c_empleados;
END

--2
CREATE TABLE ART_INC (
ID_ART char (2),
INC int (3),
CONSTRAINT PK_ART_INC  PRIMARY KEY (ID_ART));
INSERT INTO ART_INC (ID_ART,INC) VALUES ('P1',20),('P2',15),('P5',5);

CREATE PROCEDURE `procalm_5` ()
BEGIN
DECLARE v_id_art char (2);
DECLARE v_INC INT (3);
DECLARE v_ultima_fila INT DEFAULT 0;
DECLARE c_incremento cursor for
SELECT * FROM ART_INC;
DECLARE CONTINUE handler FOR NOT FOUND SET v_ultima_fila=1;
OPEN c_incremento;
segundo_bucle: loop
fetch c_incremento into v_id_art, v_INC;
	IF v_ultima_fila=1 then
		leave segundo_bucle;
	end if;
	UPDATE stock SET cant=cant+((cant*v_INC)/100) WHERE id_art=v_id_art;
end loop;
END
