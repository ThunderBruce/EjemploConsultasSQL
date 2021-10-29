
--ULTIMO VIDEO
--Se trabaja menos horas de las que trabaja un trabajador a tiempo completo comparable
--Trabajadores con contrato a tiempo parcial de duracion superior a 10 horas semanales
--Un trabajador sustituye, como minimo la jornada dejada de trabajar por un jubilado parcialmente
--Debe estar inscrito en la oficina de empleo como desempleado o con contrato temporal de la empresa
--Jaime y Esther, respuesta de Daniel ,Jaime y Julia
--Es un contrato indefinido que se realiza para actividades de temporada que tienen lugar en fechas no ciertas

CREATE DEFINER=`root`@`localhost` PROCEDURE `informe_contry`(IN p_idpedido int(10))
BEGIN
DECLARE v_nomprod VARCHAR(40);
DECLARE v_idpedido, v_idproducto int(10);
DECLARE v_precio DECIMAL(19,4);
DECLARE v_cantidad SMALLINT (5);
DECLARE v_descuento DOUBLE(7,2);
DECLARE v_existe INT DEFAULT 0;
DECLARE  v_ultima_fila INT DEFAULT 0;
DECLARE  v_ultima INT DEFAULT 0;
DECLARE v_preciofinal INT;
DECLARE c_existe CURSOR FOR
	SELECT  FROM detalles_pedido;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_ultima_fila=1;
OPEN c_pedido;
	bucle:LOOP
		FETCH c_pedido INTO v_idpedido, v_idproducto, v_precio, v_cantidad, v_descuento;
		IF v_idpedido=p_idpedido THEN
			SET v_existe=1;
		END IF;
		IF v_ultima_fila=1 THEN
			LEAVE bucle;
		END IF;
	END LOOP bucle;
CLOSE c_pedido;
SET v_ultima_fila=0;
IF v_existe=1 THEN

****************************** ****** ******** ****** **********

	SELECT ('***********************************************');
	SELECT CONCAT('*********Informe Pedido:',p_code,'****************');
	SELECT ('***********************************************');
	SELECT ('');
	SELECT CONCAT ('Detalles del pedido con Numero: ', p_code);
	SELECT ('');
	
	SELECT CONCAT('Fecha del pedido:  ',FechaPedido) FROM pedidos WHERE IdPedido=p_idpedido;
	SELECT CONCAT('Nombre del Cliente:  ',NombreCompania) FROM clientes WHERE IdCliente IN(SELECT idCliente FROM pedidos WHERE IdPedido=p_idpedido);
	SELECT CONCAT('Empresa de Envio:  ',NombreCompania) FROM  empresas_transporte WHERE IdCompaniaEnvios IN(SELECT FormaEnvio FROM pedidos WHERE IdPedido=p_idpedido);
	SELECT ('');
	SELECT('************** Lineas de pedido ******************');
	SELECT ('');
	SELECT  CONCAT(RPAD("Producto", 31, " "), (" Cant.",7," "), (" Precio", 9," "), ("Desc.",7," "), ("    ",Total,""));						
	SELECT CONCAT(RPAD("*", 31, " "), ("*",7," "), ("*",9," "), ("*",7" "), ("*",10,""); 
	SELECT CONCAT(RPAD(p.NombreProducto, 31, " "), (" ",7,Cantidad), (" ",9,PrecioUnidad), (" ",7,Descuento), (" ",10,ROUND(SUM(Cantidad*PrecioUnidad)-Descuento)  ) FROM city WHERE CountryCode=cod_pais ORDER BY Population DESC LIMIT 10; 
    SELECT ('');
	SELECT ('*********** Idiomas Oficiales y No Oficiales ***************');
    SELECT ('');
	SELECT CONCAT(RPAD("Idioma", 34, " "),	"% Pobl.");						
	SELECT CONCAT(RPAD("*", 29, "*"), "     ", "**********"); 
	OPEN c_lenguaje;
		bucle_lenguaje:LOOP
			FETCH c_lenguaje INTO v_language,v_oficial,v_percentage;
			IF v_ultima_fila=1 THEN
				LEAVE bucle_lenguaje;
			END IF;
			IF v_oficial='T' THEN
				SET v_oficial2="(Oficial)";
			ELSE
				SET v_oficial2="(No Oficial)";
			END IF;
			SELECT CONCAT(RPAD(CONCAT(v_language, v_oficial2), 34, " "),	v_percentage);
		END LOOP bucle_lenguaje;
	CLOSE c_lenguaje;
ELSE
	SELECT ('***********************************************');
	SELECT ('****************Informe Resumen****************');
	SELECT ('***********************************************');
	SELECT ('');
	SELECT ('El codigo de ese pais no esta en la base de datos');
END IF;
END