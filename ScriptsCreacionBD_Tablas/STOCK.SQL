drop table if exists STOCK;
drop table if exists ARTICULO;
drop table if exists PROVEEDOR;
drop table if exists ALMACEN;

create table ARTICULO(
id_art char(2),
descripcion varchar(10),
precio_comp float(6,2),
precio_vent float(6,2),
PROVEEDOR char(2),
ord_pte int(4),
constraint pk_ARTICULO primary key (id_art))engine=innodb;

create table ALMACEN(
id_alm	char(2),
direccion	varchar(15),
num_max_art	int(6),
constraint pk_ALMACEN primary key (id_alm))engine=innodb;

create table STOCK(
id_art char(2),
id_alm char(2),
cant	int(5),
constraint pk_STOCK primary key (id_art,id_alm))engine=innodb;



insert INTO ARTICULO
values('P1','TUERCA',150.00,170.00,'S1',600);
insert INTO ARTICULO
values('P2','PERNO',120.00,130.00,'S1',NULL);
insert INTO ARTICULO
values('P3','BIRLO',115.00,130.00,'S5',300);
insert INTO ARTICULO
values('P4','BIRLO',120.00,140.00,'S2',NULL);
insert INTO ARTICULO
values('P5','LEVA',70.00,100.00,'S2',500);
insert INTO ARTICULO
values('P6','ENGRANE',60.00,90.00,'S3',900);
insert INTO ARTICULO
values('P7','ARANDELA',1.00,2.00,'S3',NULL);
insert INTO ARTICULO
values('P8','VALVULA',62.00,80.00,'S1',NULL);
insert INTO ARTICULO
values('P9','COJINETE',4.00,7.00,'S1',2000);
insert INTO ARTICULO
values('R1','TORNILLO',1.50,2.20,'S2',1000);
insert INTO ARTICULO
values('R2','ESCARPIA',1.20,1.90,'S5',NULL);
insert INTO ARTICULO
values('R3','PISTON',100.00,140.00,'S3',20);

INSERT INTO ALMACEN
VALUES ('A1','CALLE 34,2',8000);
INSERT INTO ALMACEN
VALUES ('A2','CALLE 34,12',16000);
INSERT INTO ALMACEN
VALUES ('A3','CALLE 26,15',25000);
INSERT INTO ALMACEN
VALUES ('A4','CALLE 22,6',15000);

INSERT INTO STOCK
VALUES ('P1','A1',200);
INSERT INTO STOCK
VALUES ('P1','A2',700);
INSERT INTO STOCK
VALUES ('P3','A1',400);
INSERT INTO STOCK
VALUES ('P4','A1',200);
INSERT INTO STOCK
VALUES ('P2','A3',200);
INSERT INTO STOCK
VALUES ('P3','A4',500);
INSERT INTO STOCK
VALUES ('P3','A2',600);
INSERT INTO STOCK
VALUES ('P3','A3',1200);
INSERT INTO STOCK
VALUES ('P5','A4',800);
INSERT INTO STOCK
VALUES ('P5','A3',100);
INSERT INTO STOCK
VALUES ('P6','A1',1600);
INSERT INTO STOCK
VALUES ('P2','A1',900);
INSERT INTO STOCK
VALUES ('R1','A2',100);
INSERT INTO STOCK
VALUES ('R2','A2',500);
INSERT INTO STOCK
VALUES ('P9','A4',1000);
INSERT INTO STOCK
VALUES ('P8','A4',70);
INSERT INTO STOCK
VALUES ('P9','A3',920);

create table PROVEEDOR(
id_prov char(2),
nombre varchar(10),
saldo_deudor float(7,2),
constraint pk_PROVEEDOR primary key (id_prov))engine=innodb;

insert into PROVEEDOR
values('S1','LOZANO',1000.00);
insert into PROVEEDOR
values('S2','GOMEZ',2500.00);
insert into PROVEEDOR
values('S3','SUAREZ',4000.00);
insert into PROVEEDOR
values('S4','RAMIREZ',0.00);
insert into PROVEEDOR
values('S5','MARTIN',3000.00);

ALTER TABLE ARTICULO
ADD (CONSTRAINT FK_ARTICULO FOREIGN KEY (PROVEEDOR) REFERENCES PROVEEDOR(ID_PROV));

alter table STOCK
add (constraint fk_STOCK1 foreign key (id_art) references ARTICULO(id_art));

alter table STOCK
add (constraint fk_STOCK2 foreign key (id_alm) references ALMACEN(id_alm));
