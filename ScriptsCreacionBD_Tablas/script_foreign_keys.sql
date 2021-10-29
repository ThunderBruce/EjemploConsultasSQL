
ALTER TABLE detalles_pedido
  ADD CONSTRAINT PedidosDetalles  FOREIGN KEY (IdPedido) REFERENCES pedidos (IdPedido);
ALTER TABLE detalles_pedido
  ADD CONSTRAINT ProductosDetalles  FOREIGN KEY (IdProducto) REFERENCES productos (IdProducto);

ALTER TABLE pedidos
  ADD CONSTRAINT ClientesPedidos FOREIGN KEY (IdCliente) REFERENCES clientes (IdCliente);
ALTER TABLE pedidos  
  ADD CONSTRAINT CompaniasdenviosPedidos FOREIGN KEY (FormaEnvio) REFERENCES empresas_transporte (IdCompaniaEnvios);
 ALTER TABLE pedidos  
  ADD CONSTRAINT EmpleadosPedidos FOREIGN KEY (IdEmpleado) REFERENCES empleados (IdEmpleado);
  
  
  
ALTER TABLE productos
  ADD CONSTRAINT CategoriasProductos FOREIGN KEY (IdCategoria) REFERENCES categorias (IdCategoria);
ALTER TABLE productos  
  ADD CONSTRAINT ProveedoresProductos FOREIGN KEY (IdProveedor) REFERENCES proveedores (IdProveedor);

  
  alter table empleados
  add constraint fkempleadojefe foreign key (Jefe) references empleados(IdEmpleado);