----------Agregar el campo estatusAusencia
Alter table ausenciaJustificada add estatusAusencia char;
----Procedimiento almacenado

CREATE PROC sp_Agregar_Ausencia_Justificada(@fechaInicio date, @fechaFin date, @tipo char, @idEmpleadoS int, @idEmpleadoA int ) 
AS
BEGIN
    DECLARE @idAusencia int
	DECLARE @dias int
	DECLARE @verificarId int
	DECLARE @fechaSolicitud date
	DECLARE @diasVacaciones int
	DECLARE @diasPermiso int
	DECLARE @diasRestantes int

	set @fechaSolicitud=GETDATE();
	set @dias = DATEDIFF ( DD, @fechaInicio , @fechaFin );

	
		--------Validar el tipo de permiso
		---vacaciones
		if (@tipo='v')
		begin
			set @diasVacaciones= (select diasVacacionales from Empleados where idEmpleado=@idEmpleadoS);
				if (@dias<=@diasVacaciones)
				begin 
				---Si los dias que pide el empleado son menores o igual a sus dias de vacaciones, entonces se registra la ausencia con estatus pendiente
					insert AusenciaJustificada values(@fechaSolicitud,@fechaInicio,@fechaFin,@tipo,@idEmpleadoS,@idEmpleadoA,'A','P');
				
					
				end 
		end 
		-----permiso
			if (@tipo='p')
		begin
			set @diasPermiso= (select diasPermiso from Empleados where idEmpleado=@idEmpleadoS);
				if (@dias<=@diasPermiso)
				begin 
				---Si los dias que pide el empleado son menores o igual a sus dias de permiso, entonces se registra la ausencia con estatus pendiente
					insert AusenciaJustificada values(@fechaSolicitud,@fechaInicio,@fechaFin,@tipo,@idEmpleadoS,@idEmpleadoA,'A','P');
					
				end 
		end 



END

------Ejecucion 
EXEC sp_Agregar_Ausencia_Justificada '20-05-2020','24-05-2020','v',2,1



-----Permisos
grant exec on sp_Agregar_Ausencia_Justificada to RecursosHumanos


-----Se agrego una vista 
CREATE VIEW Ausencia_empleados
AS  
    SELECT
        A.idAusencia,
        A.fechaSolicitud,
		A.fechaInicio,
		A.fechaFin,
		A.tipo,
		A.estatus,
		A.estatusAusencia,
		DiasDescanso=(DATEDIFF ( DD, A.fechaInicio , A.fechaFin )),
		nssAusente = E.nss,
		NombreAusente= (Concat(E.nombre, '   ', E.apaterno,'   ', E.amaterno)),
		nssJefe=EJEFE.nss,
		NombreJefe=(Concat(EJEFE.nombre,'   ', EJEFE.apaterno,'   ',EJEFE.amaterno))
	 
    FROM Empleados AS E INNER JOIN AusenciaJustificada AS A On A.idEmpleadoS = E.idEmpleado
	INNER JOIN EMPLEADOS AS EJEFE ON A.idEmpleadoA=EJEFE.idEmpleado
	

GO

-----Dar permiso
grant select,insert,update,delete on Ausencia_empleados to RecursosHumanos

