

--editamos el tipo de dato de la columna documento
alter table DocumentacionEmpleado alter column documento varbinary(max);


-----Se agrego una vista 
CREATE VIEW Documentacion_empleados
AS  
	select 
	d.idDocumento,
	d.nombreDocumento,
	d.fechaEntrega,
	d.documento,
	d.idEmpleado,
	d.estatus,
	(e.nombre+' '+e.apaterno+' '+e.amaterno) as NombreEmpleado,
	e.nss
	from DocumentacionEmpleado d join
	Empleados e on d.idEmpleado = e.idEmpleado;
GO

-----Dar permiso
grant select,insert,update,delete on Documentacion_empleados to RecursosHumanos

select * from Documentacion_empleados;