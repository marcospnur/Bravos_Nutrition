SELECT * FROM bravos_nutrition.ventas;

#Crear tabla panel de ventas
select V.id_ventas, P.Tipo, P.Marca, P.Característica, P.Sabor, V.Unidades, V.Valor_Total, Vn.Nombre, V.Fecha
from ventas as V
inner join productos as P
on V.Producto = P.id_producto
inner join vendedores as Vn
on V.Vendedor = Vn.id_vendedor;