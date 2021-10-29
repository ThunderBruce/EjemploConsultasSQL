CREATE DEFINER=`root`@`localhost` PROCEDURE `informe_world`(in p_code char(3))
BEGIN
declare v_insert,v_salir int default 0;
declare v_name char(52);
declare v_capital int;
declare v_leng enum('T','F');
declare v_language char(30);
declare v_percentage float(4,1);
declare v_code char(3);
declare v_poblacion int(11);
declare nombre_ciudad char (35);
declare c_pais cursor for select code,name,capital,population from country;
declare c_leng cursor for select Language,IsOfficial,Percentage from countrylanguage;
DECLARE continue HANDLER FOR not found SET v_insert = 1;
declare continue handler for not found set v_salir=1;
OPEN c_pais;
bucle: loop
fetch c_pais into v_code,v_name,v_capital,v_poblacion;

IF v_code=p_code then
	SELECT rpad(('***********************************'),50,'*');
	SELECT rpad(('****************Informe Resumen'),50,'*');
	SELECT rpad(('***********************************'),50,'*');
	SELECT ('');
	SELECT CONCAT('Pais:',v_name);
	set nombre_ciudad=select name from city where ID=v_capital;
	SELECT CONCAT('Capital:',(nombre_ciudad));
	SELECT rpad(('*************10 Principales ciudades'),50,'*');
	select rpad(('Ciudad'),35,' '),rpad(('Población'),10,' ');
	SELECT rpad(('*'),30,'*'),rpad(('       *'),18,'*');
	select  rpad((v_name),35,' ') ,rpad((v_poblacion),10,' ') order by v_poblacion DESC LIMIT 10;
	SELECT ('************Idiomas Oficiales y No Oficiales*************');
	open c_leng;
	fetch c_leng into v_language,v_leng,v_percentage;
	if v_leng='T' then
		set v_leng='Oficial';
		select rpad(v_language,15,' '),rpad(('('v_leng')'),20,' '), rpad((v_percentage),10,' ') order by v_percentage;
	else
		set v_leng='No Oficial';
		select rpad(v_language,15,' '),rpad(('('v_leng')'),20,' '), rpad((v_percentage),10,' ') order by v_percentage;
	end if;
	if v_insert=1 then 
		leave bucle;
close c_leng;
ELSE
bucle2: loop
select('*******************************');
select('********* Informe resumen*******');
select('********************************');
select('El codigo de ese pais no esta en la base de datos');
leave bucle2;
end loop bucle2;
end if;
if v_salir then
leave bucle;
end if;
END LOOP bucle;
CLOSE c_pais;
end
