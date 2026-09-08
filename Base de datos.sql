#Creación base de datos
drop database bravos_nutrition;

CREATE DATAbase bravos_nutrition;

#Usar base de datos
use bravos_nutrition;

Create table Ventas(
Id_Ventas int not null,
Producto int not null,
Unidades int not null,
Valor_unitario int not null,
Valor_total int not null,
Vendedor int not null,
Cliente varchar(100),
fecha date,
primary key (Id_Ventas)
);

drop table Ventas;

Create table Compras(
id_compra int not null,
Proveedor int not null,
Producto int not null,
Unidades int not null,
Costo_unitario int not null,
Costo_total int not null,
fecha date,
primary key (id_compra)
);





#Crear tabla panel de compras
select C.id_compra, P.Tipo, P.Marca, P.Característica, P.Sabor, C.Unidades, C.Costo_Total, pv.Nombre, C.Fecha
from compras as C
inner join productos as P
on C.Producto = P.id_producto
inner join proveedores as pv
on C.Proveedor = pv.id_proveedor;

#crear tabla de venta de proteínas 
select v.id_ventas, p.Tipo, p.Marca, p.Característica, p.Sabor, v.Unidades, vn.Nombre, v.Fecha
from ventas as v
inner join productos as p
on v.Producto = p.id_producto
inner join vendedores as vn
on v.Vendedor = vn.id_vendedor
where Tipo = "Proteína";

#Tabla de venta de proteínas USN 
select v.id_ventas, p.Tipo, p.Marca, p.Característica, p.Sabor, v.Unidades, vn.Nombre, v.Fecha
from ventas as v
inner join productos as p
on v.Producto = p.id_producto
inner join vendedores as vn
on v.Vendedor = vn.id_vendedor
where Tipo = "Proteína" and Marca = "USN";

select v.Fecha, sum(v.Unidades)
from ventas as v
inner join productos as p
on v.Producto = p.id_producto
inner join vendedores as vn
on v.Vendedor = vn.id_vendedor
where Tipo = "Proteína" and Marca = "USN" and Sabor = "Chocolate" group by Fecha;


select v.Fecha, sum(v.Unidades)
from ventas as v
inner join productos as p
on v.Producto = p.id_producto
inner join vendedores as vn
on v.Vendedor = vn.id_vendedor
where Tipo = "Proteína" and Marca = "USN" and Sabor = "Vainilla" group by Fecha;


select v.Fecha, sum(v.Unidades)
from ventas as v
inner join productos as p
on v.Producto = p.id_producto
inner join vendedores as vn
on v.Vendedor = vn.id_vendedor
where Tipo = "Proteína" and Marca = "USN" and Sabor = "Cookies and Cream" group by Fecha;

#Tabla de venta de proteínas Universal
select v.id_ventas, p.Tipo, p.Marca, p.Característica, p.Sabor, vn.Nombre, v.Fecha,v.Unidades
from ventas as v
inner join productos as p
on v.Producto = p.id_producto
inner join vendedores as vn
on v.Vendedor = vn.id_vendedor
where Tipo = "Proteína" and Marca = "Universal" ; 

