--1

--Tabla COMPRADORES

insert into COMPRADORES (Cif_comprador,Nombre_social,Domicilio_social,Localida,Codigo_postal,Telefono)
VALUES('111111-L','TELARES ASUNCION','C. LA RUA 5','ALBACETE',02002,97223141);

insert into COMPRADORES (Cif_comprador,Nombre_social,Domicilio_social,Localida,Codigo_postal,Telefono)
VALUES('222222-J','TEXTIL LAGO' ,'PLAZA MAYOR 2','ALMERIA',04131,95434567); 

--Tabla ARTICULOS 

insert into ARTICULOS(Referencia_articulo,Descripción_articulo,Precio_unidad,IVA,Existencias_actuales)
values('01-LANA','LANA 100% NATURAL',31.09,10,100),
('02-ALGODON','ALGODÓN DE 2 CABOS',18.00,10,155), 
('03-SEDA','SEDA CHINA',55.50,15,190),
('04-LINO','LINO EUROPEO',44.00,12,250);

--Tabla FACTURAS

INSERT INTO FACTURAS(Factura_no,Fecha_factura,CIF_cliente,Cod_oficina)
VALUES(NULL,'2004-05-12','111111-L',1212),
(NULL,'2004-07-18','111111-L',1231),
(NULL,'2004-07-31','222222-J',1406), 
(NULL,'2004-08-10','222222-J',1212);  

--RESETEAR EL AUTO_INCREMENT EN 1

ALTER TABLE n_tabla AUTO_INCREMENT=1;  

--Tabla LINEAS_FACTURAS 

insert into LINEAS_FACTURAS(Factura_no,Referencia_articulo,Unidades)
values(1,'01-LANA',120),
(1,'04-LINO',75),
(2,'01-LANA',20), 
(2,'02-ALGODÓN',50);


--2

INSERT INTO ARTICULOS(Referencia_articulo,Precio_unidad,IVA)
VALUES('06-CUERO',10.99,10); 

--3

UPDATE ARTICULOS
SET IVA=IVA-1;

--4

update ARTICULOS 
set Descripción_articulo="LANA 90% NATURAL 10% ACRILICO" 
where Referencia_articulo="01-LANA";

--5

---5.1
alter table LINEAS_FACTURAS drop 
FOREIGN KEY FK_LINEAS_ARTICULOS;
---5.2
alter table LINEAS_FACTURAS add 
CONSTRAINT FK_LINEAS_ARTICULOS FOREIGN KEY(Referencia_articulo) REFERENCES ARTICULOS(Referencia_articulo) on update cascade;
---5.3
update ARTICULOS set Referencia_articulo="01-LANA90/10" where Referencia_articulo="01-LANA";

--6

delete from FACTURAS where Factura_no="2";












