DROP TABLE detalles_pedido
/
DROP TABLE pedidos
/
DROP TABLE productos
/
DROP TABLE proveedores
/
DROP TABLE clientes
/
DROP TABLE empleados
/
DROP TABLE categorias
/
DROP TABLE empresas_transporte
/




CREATE TABLE categorias (
  IdCategoria number(10) NOT NULL ,
  NombreCategoria varchar2(15) default NULL,
  Descripcion varchar2(100),
  Imagen clob,
  PRIMARY KEY  (IdCategoria)
  )
/



INSERT INTO categorias VALUES 
(1, 'Bebidas', 'Gaseosas, café, té, cervezas y maltas', '');
INSERT INTO categorias VALUES 
(2, 'Condimentos', 'Salsas dulces y picantes, delicias, comida para untar y aderezos', '');
INSERT INTO categorias VALUES 
(3, 'Repostería', 'Postres, dulces y pan dulce', '');
INSERT INTO categorias VALUES 
(4, 'Lácteos', 'Quesos', '');
INSERT INTO categorias VALUES 
(5, 'Granos/Cereales', 'Pan, galletas, pasta y cereales', '');
INSERT INTO categorias VALUES 
(6, 'Carnes', 'Carnes preparadas', '');
INSERT INTO categorias VALUES 
(7, 'Frutas/Verduras', 'Frutas secas y queso de soja', '');
INSERT INTO categorias VALUES 
(8, 'Pescado/Marisco', 'Pescados, mariscos y algas', '');

CREATE TABLE clientes (
  IdCliente varchar2(5),
  NombreCompania varchar2(40) default NULL,
  NombreContacto varchar2(30) default NULL,
  CargoContacto varchar2(30) default NULL,
  Direccion varchar2(60) default NULL,
  Ciudad varchar2(15) default NULL,
  Region varchar2(15) default NULL,
  CodPostal varchar2(10) default NULL,
  Pais varchar2(15) default NULL,
  Telefono varchar2(24) default NULL,
  Fax varchar2(24) default NULL,
  PRIMARY KEY  (IdCliente)
 )
/


CREATE TABLE  detalles_pedido (
  IdPedido number(10) NOT NULL,
  IdProducto number(10) NOT NULL,
  PrecioUnidad varchar2(30) default NULL,
  Cantidad number(5) default NULL,
  Descuento number(7,2) default NULL,
  PRIMARY KEY  (IdPedido,IdProducto)
  )
/


CREATE TABLE empleados (
  IdEmpleado number(10) NOT NULL,
  Apellidos varchar2(20) default NULL,
  Nombre varchar2(10) default NULL,
  Cargo varchar2(30) default NULL,
  Tratamiento varchar2(25) default NULL,
  FechaNacimiento date default NULL,
  FechaContratacion date default NULL,
  Direccion varchar2(60) default NULL,
  Ciudad varchar2(15) default NULL,
  Region varchar2(15) default NULL,
  CodPostal varchar2(10) default NULL,
  Pais varchar2(15) default NULL,
  TelDomicilio varchar2(24) default NULL,
  Extension varchar2(4) default NULL,
  Foto varchar2(255) default NULL,
  Notas long,
  Jefe number(10) default NULL,
  PRIMARY KEY  (IdEmpleado))
/

CREATE TABLE  empresas_transporte (
  IdCompaniaEnvios number(10),
  NombreCompania varchar2(40) default NULL,
  Telefono varchar2(24) default NULL,
  PRIMARY KEY  (IdCompaniaEnvios)
)
/

INSERT INTO empresas_transporte (IdCompaniaEnvios, NombreCompania, Telefono) VALUES 
(1, 'Speedy Express', '(503) 555-9831');
INSERT INTO empresas_transporte (IdCompaniaEnvios, NombreCompania, Telefono) VALUES 
(2, 'United Package', '(503) 555-3199');
INSERT INTO empresas_transporte (IdCompaniaEnvios, NombreCompania, Telefono) VALUES 
(3, 'Federal Shipping', '(503) 555-9931');

CREATE TABLE  pedidos (
  IdPedido number(10),
  IdCliente varchar2(5) default NULL,
  IdEmpleado number(10) default NULL,
  FechaPedido char(10) default NULL,
  FechaEntrega char(10) default NULL,
  FechaEnvio char(10) default NULL,
  FormaEnvio number(10) default NULL,
  Cargo varchar2(30) default NULL,
  Destinatario varchar2(40) default NULL,
  DireccionDestinatario varchar2(60) default NULL,
  CiudadDestinatario varchar2(15) default NULL,
  RegionDestinatario varchar2(15) default NULL,
  CodPostalDestinatario varchar2(10) default NULL,
  PaisDestinatario varchar2(15) default NULL,
  PRIMARY KEY  (IdPedido)
 )
 /


CREATE TABLE productos (
  IdProducto number(10),
  NombreProducto varchar2(40) default NULL,
  IdProveedor number(10) default NULL,
  IdCategoria number(10) default NULL,
  CantidadPorUnidad varchar2(20) default NULL,
  PrecioUnidad varchar2(30) default NULL,
  UnidadesEnExistencia number(5) default NULL,
  UnidadesEnPedido number(5) default NULL,
  NivelNuevoPedido number(10) default NULL,
  Suspendido number(1) NOT NULL,
  PRIMARY KEY  (IdProducto)
 )
 /



CREATE TABLE  proveedores (
  IdProveedor number(10),
  NombreCompania varchar2(40) default NULL,
  NombreContacto varchar2(30) default NULL,
  CargoContacto varchar2(30) default NULL,
  Direccion varchar2(60) default NULL,
  Ciudad varchar2(15) default NULL,
  Region varchar2(15) default NULL,
  CodPostal varchar2(10) default NULL,
  Pais varchar2(15) default NULL,
  Telefono varchar2(24) default NULL,
  Fax varchar2(24) default NULL,
  PaginaPrincipal long,
  PRIMARY KEY  (IdProveedor)
  );

