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
		E.nombre,
		E.apaterno,
		E.amaterno, 
		I.estatus
    FROM Empleados AS E INNER JOIN Incapacidades AS I On I.idEmpleado = E.idEmpleado
GO

select * from Incapacidades_empleados;

--Otorgamos permiso a RH para que pueda ver la vista
grant select,insert,update,delete on Incapacidades_empleados to RecursosHumanos

-- creamos una nueva vista para anexar el nss y los datos del empleado en horarios 
CREATE VIEW Horarios_empleados
AS  
    SELECT
        H.idHorario,
        H.horaInicio,
		H.horaFin,
		H.dias,
		H.idEmpleado,
		E.nss,
		E.nombre,
		E.apaterno,
		E.amaterno, 
		H.estatus
    FROM Empleados AS E INNER JOIN Horarios  AS H On H.idEmpleado = E.idEmpleado
GO

select * from Horarios_empleados;

--Otorgamos permiso a RH para que pueda ver la vista
grant select,insert,update,delete on Horarios_empleados to RecursosHumanos


--cambiamos los tipos de datos en HoraInicio, HoraFin 
---primero se cambia a datetime, ya que no se puede convertir directamente el tipo date por el tipo time.
---una ves cambiado al tipo datetime, cambiar a time.

ALTER TABLE Horarios alter column horaInicio datetime;
ALTER TABLE Horarios alter column horaFin datetime;
ALTER TABLE Horarios alter column horaFin time;
ALTER TABLE Horarios alter column horaInicio time;
