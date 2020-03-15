use ERP2020
--CREACION DE ROLES
create role RecursosHumanos authorization dbo
create role Ventas authorization dbo
create role Compras authorization dbo

--ASIGNACION DE PERMISOS PARA LOS ROLES CREADOS
--RecursosHumanos
grant select,insert,update,delete on Estados to RecursosHumanos
grant select,insert,update,delete on Ciudades to RecursosHumanos
grant select,insert,update,delete on Incapacidades to RecursosHumanos
grant select,insert,update,delete on Empleados to RecursosHumanos
grant select,insert,update,delete on Departamentos to RecursosHumanos
grant select,insert,update,delete on Horarios to RecursosHumanos
grant select,insert,update,delete on HistorialPuestos to RecursosHumanos
grant select,insert,update,delete on AusenciaJustificada to RecursosHumanos
grant select,insert,update,delete on FormasPago to RecursosHumanos
grant select,insert,update,delete on DocumentacionEmpleado to RecursosHumanos
grant select,insert,update,delete on Puestos to RecursosHumanos
grant select,insert,update,delete on Percepciones to RecursosHumanos
grant select,insert,update,delete on Nominas to RecursosHumanos
grant select,insert,update,delete on NominasPercepciones to RecursosHumanos
grant select,insert,update,delete on Deducciones to RecursosHumanos
grant select,insert,update,delete on NominasDeducciones to RecursosHumanos
grant select,insert,update,delete on Sucursales to RecursosHumanos

grant select,insert,update,delete on Usuarios to RecursosHumanos
grant select,insert,update,delete on TiposUsuarios to RecursosHumanos
grant exec on sp_EliminarLogicamente to RecursosHumanos
grant exec on sp_paginaciondinamica to RecursosHumanos

-- Ventas
grant select,insert,update,delete on OfertasAsociacion to Ventas
grant select,insert,update,delete on Asociaciones to Ventas
grant select,insert,update,delete on Miembros to Ventas
grant select,insert,update,delete on Cultivos to Ventas
grant select,insert,update,delete on VentasDetalle to Ventas
grant select,insert,update,delete on Clientes to Ventas
grant select,insert,update,delete on ClientesCultivos to Ventas
grant select,insert,update,delete on Ventas to Ventas
grant select,insert,update,delete on Facturas to Ventas
grant select,insert,update,delete on Visitas to Ventas
grant select,insert,update,delete on Tripulacion to Ventas
grant select,insert,update,delete on Cobros to Ventas
grant select,insert,update,delete on UnidadesTransporte to Ventas
grant select,insert,update,delete on Envios to Ventas
grant select,insert,update,delete on Mantenimientos to Ventas


grant select,insert,update,delete on Usuarios to Ventas
grant select,insert,update,delete on TiposUsuarios to Ventas
grant exec on sp_EliminarLogicamente to Ventas
grant exec on sp_paginaciondinamica to Ventas

-- Compras
grant select,insert,update,delete on Laboratorios to Compras
grant select,insert,update,delete on Categorias to Compras
grant select,insert,update,delete on Empaques to Compras
grant select,insert,update,delete on UnidadMedida to Compras
grant select,insert,update,delete on Productos to Compras
grant select,insert,update,delete on PresentacionesProductos to Compras
grant select,insert,update,delete on ExistenciasSucursal to Compras
grant select,insert,update,delete on Sucursales to Compras
grant select,insert,update,delete on ImagenesProducto to Compras
grant select,insert,update,delete on ProductosProveedor to Compras
grant select,insert,update,delete on PedidoDetalle to Compras
grant select,insert,update,delete on Pedidos to Compras
grant select,insert,update,delete on ContactosProveedor to Compras
grant select,insert,update,delete on Proveedores to Compras
grant select,insert,update,delete on CuentasProveedor to Compras
grant select,insert,update,delete on Pagos to Compras


grant select,insert,update,delete on Usuarios to Compras
grant select,insert,update,delete on TiposUsuarios to Compras
grant exec on sp_EliminarLogicamente to Compras
grant exec on sp_paginaciondinamica to Compras




--CREACION DE USUARIOS Y ASIGNACION A ROLES

--RH
use master
create login RH
with password= 'recursos123', ---debe cambiar la contrasena la proxima vez que inicie sesion
default_database = ERP2020,
check_expiration = on ---con esto es para que si se vuelve a logear en la bd, compruebe la contrasena cambiada

--ahora creamos el usuario dentro de la bd ERP2020
use ERP2020
create user URecursosHumanos for login RH
exec sp_addrolemember 'RecursosHumanos','URecursosHumanos'

--VENTAS
use master
create login VENTAS
with password= 'ventas123', ---debe cambiar la contrasena la proxima vez que inicie sesion
default_database = ERP2020,
check_expiration = on ---con esto es para que si se vuelve a logear en la bd, compruebe la contrasena cambiada

--ahora creamos el usuario dentro de la bd ERP2020
use ERP2020
create user UVentas for login VENTAS

exec sp_addrolemember 'Ventas', 'UVentas'

--COMPRAS
use master
create login COMPRAS
with password= 'compras123', ---debe cambiar la contrasena la proxima vez que inicie sesion
default_database = ERP2020,
check_expiration = on ---con esto es para que si se vuelve a logear en la bd, compruebe la contrasena cambiada

--ahora creamos el usuario dentro de la bd ERP2020
use ERP2020
create user UCompras for login COMPRAS

exec sp_addrolemember 'Compras', 'UCompras'