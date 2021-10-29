CREATE DEFINER=`root`@`localhost` PROCEDURE `repaso_procedimientos`(p_idprod int (10))
BEGIN
DECLARE v_idprod int (10);
DECLARE v_cantidad int (4);
DECLARE c_cursor CURSOR FOR SELECT Cantidad FROM detalles_pedido WHERE IdProducto=p_idprod;
OPEN c_cursor
bucle: LOOP
END