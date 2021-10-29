--1

--Tabla COMPRADORES

create table  COMPRADORES(
CIF_comprador char (11),
Nombre_social varchar(30),
Domicilio_social varchar (30),
Localida varchar (30),
C_postal char (5),
Telefono char (9) NOT NULL,
CONSTRAINT PK_COMPRADORES_CIF PRIMARY KEY (CIF_comprador),
CONSTRAINT UQ_COMPRADORES_NOMBRE_SOCIAL UNIQUE (Nombre_social));

--Tabla ARTICULOS

create table ARTICULOS(
Referencia_articulo varchar(12), 
Descripción_articulo varchar(30),
Precio_unidad float(6,2),        
IVA int(2),                  
Existencias_actuales int(5) DEFAULT "0",
CONSTRAINT PK_ARTICULOS PRIMARY KEY (Referencia_articulo));

--Tabla FACTURAS

create table FACTURAS(
Factura_no int(6) AUTO_INCREMENT,
Fecha_factura date default '2005-01-01',
CIF_cliente char(11),
CONSTRAINT PK_FACTURA PRIMARY KEY (Factura_no));

--Tabla LINEAS_FACTURAS

create table LINEAS_FACTURAS(
Factura_no int(6),
Referencia_articulo varchar(12),
Unidades int(3),
CONSTRAINT PK_LINEAS_FACTURA PRIMARY KEY (Factura_no,Referencia_articulo),
CONSTRAINT FK_LINEAS_FACTURAS FOREIGN KEY (Factura_no) REFERENCES FACTURAS (Factura_no) on DELETE CASCADE,
CONSTRAINT FK_LINEAS_ARTICULOS FOREIGN KEY (Referencia_articulo) REFERENCES ARTICULOS (Referencia_articulo));

--2

ALTER TABLE FACTURAS ADD(cod_oficina INT(4));

ALTER TABLE FACTURAS
CHANGE cod_oficina Cod_oficina INT(4);

--3

ALTER TABLE FACTURAS 
add CONSTRAINT FK_FACTURA_COMPRADORES FOREIGN KEY (CIF_cliente)
REFERENCES COMPRADORES (CIF_comprador)
;

--4

ALTER TABLE COMPRADORES
CHANGE C_postal Codigo_postal char(5);





 


