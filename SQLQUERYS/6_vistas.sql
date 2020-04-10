-- creamos una nueva vista para anexar el nss a incapacidades
CREATE VIEW Incapacidades_empleados
AS  
    SELECT
        I.idIncapacidad,
        I.fechaInicio,
		I.fechaFin,
		I.enfermedad,
		I.evidencia,
		I.idEmpleado,
		E.nss,
		I.estatus
    FROM Empleados AS E INNER JOIN Incapacidades AS I On I.idEmpleado = E.idEmpleado
GO

select * from Incapacidades_empleados;

--Otorgamos permiso a RH para que pueda ver la vista
grant select,insert,update,delete on Incapacidades_empleados to RecursosHumanos
