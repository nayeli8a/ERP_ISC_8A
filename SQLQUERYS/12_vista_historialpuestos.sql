-- creamos una nueva vista para anexar el nss a incapacidades
CREATE VIEW Historialpuestos_puesto
AS  
    select
	hp.idEmpleado,
	hp.idPuesto,
	hp.idDepartamento,
	hp.fechaInicio,
	hp.fechaFin,
	hp.salario,
	hp.estatus,
	p.nombre
	from HistorialPuestos hp join Puestos p on hp.idPuesto = p.idPuesto;
GO

select * from Historialpuestos_puesto;

--Otorgamos permiso a RH para que pueda ver la vista
grant select,insert,update,delete on Historialpuestos_puesto to RecursosHumanos



-- //insertamos registros en la bd
INSERT INTO [dbo].[HistorialPuestos]
           ([idEmpleado],
		   [idPuesto]
           ,[idDepartamento]
           ,[fechaInicio]
           ,[fechaFin]
           ,[salario]
           ,[estatus])
     VALUES
           (5,2,1,'16-09-2000','16-09-2010',300,'A')
GO

grant select,insert,delete,update on HistorialPuestos to RecursosHumanos;

select * from HistorialPuestos;

