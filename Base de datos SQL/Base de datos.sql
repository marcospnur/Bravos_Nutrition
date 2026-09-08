-- Creación de base de datos de bravos nutrition.
CREATE DATABASE Bravos_DB;
USE Bravos_DB;

-- PRIMARY KEY y FOREIGN KEY
-- ------------------------- --
-- Tabla productos
ALTER TABLE productos
MODIFY COLUMN id_producto VARCHAR(50),
add primary key (id_producto);

-- Tabla proveedores
alter table proveedores
modify column id_proveedor varchar(50),
add primary key (id_proveedor);

-- Tabla vendedores
alter table vendedores
modify column id_vendedor varchar(50),
add primary key (id_vendedor);

-- Tabla ventas
ALTER TABLE ventas
MODIFY COLUMN id_venta VARCHAR(50),
ADD PRIMARY KEY (id_venta),
MODIFY COLUMN id_producto VARCHAR(50),
MODIFY COLUMN id_vendedor VARCHAR(50),
ADD CONSTRAINT fk_ventas_productos FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
ADD CONSTRAINT fk_ventas_vendedores FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor);

-- Tabla compras
alter table compras
modify column id_compra varchar(50),
add primary key (id_compra),
modify column id_producto varchar(50),
modify column id_proveedor varchar(50),
add constraint fk_compras_producto foreign key (id_producto) references productos(id_producto),
add constraint fk_compras_proveedor foreign key (id_proveedor) references proveedores(id_proveedor);

-- Tabla panel Ventas
CREATE OR REPLACE VIEW panel_ventas AS
SELECT v.id_venta, v.fecha,YEAR(v.fecha) AS Anio, date_format(v.fecha, '%Y-%m') AS 'anio_mes',  
p.tipo, p.marca, p.características as caracteristica, p.sabor, p.medida, p.valor, 
v.unidades, p.valor*v.unidades as valor_total, ven.Nombre as vendedor, v.id_cliente as cliente 
FROM ventas AS v
INNER JOIN productos as p ON v.id_producto=p.id_producto
INNER JOIN vendedores as ven ON v.id_vendedor=ven.id_vendedor
ORDER BY v.fecha DESC;

select * from panel_ventas
limit 5;


-- Tabla panel Compras
CREATE OR REPLACE VIEW panel_compras AS
SELECT c.id_compra, c.fecha, YEAR(c.fecha) as Anio, date_format(c.fecha, '%Y-%m') as 'anio_mes', 
p.tipo, p.marca, p.características as caracteristica, p.sabor, p.medida, c.unidades, c.costo_unidad, c.unidades*c.costo_unidad as 'costo_total',
prov.Nombre as Proveedor
FROM compras as c
INNER JOIN productos as p ON c.id_producto=p.id_producto
INNER JOIN proveedores as prov ON c.id_proveedor=prov.id_proveedor
ORDER BY c.fecha DESC;

select * from panel_compras
limit 5;

    

