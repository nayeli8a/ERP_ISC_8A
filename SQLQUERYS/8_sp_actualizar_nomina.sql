


--Este procedimiento se encarga de actualizar los valores que seran pagados a los empleados en base a sus 
--dias trabajados en su nomina, se genera el calculo automatico de las percepciones y las deducciones
--solo debe ejecutarse antes de un select a la tabla de nominas
CREATE PROCEDURE sp_actualizar_nomina 
AS
BEGIN
			--Estos son valores que nos ayudaran a ejecutar este procedimiento las veces que hayan nominas en la BD
		DECLARE @min INT;
		DECLARE @max INT;
		select @min = MIN(idNomina) from Nominas;
		select @max = MAX(idNomina) from Nominas;



		WHILE @min <= @max
		BEGIN
		--$$$$$$$$$$$$$$$$$$$$$$$

			--ID DE LA NOMINA
			declare @idNomina int;
			set @idNomina = @min;

			if((select EstatusNomina from Nominas where idNomina = @idNomina) = 'C')
			BEGIN--%%%%%%%%%%%%%%%%%%%
				--//////////////////////////////////////////////////////////////////////////////////////////////////////////////
				--las NominasPercepciones:
				--se multiplica el salario del empleado por DIASPAGAR de la percepcion
				--el valor obtenido se coloca en IMPORTE de la nominapercepcion
				declare @fechaAguinaldo varchar(10);
				set @fechaAguinaldo = CAST( '10-12-'+ cast(YEAR(GETDATE()) as varchar(4)) as varchar);

				CREATE TABLE #TablaTemporalP (importe float,idPercepcion int)

				--la regla de negocio en esta parte es que a los empleados se les pagara su nomina quincenalmente
				INSERT INTO #TablaTemporalP select ROUND((((e.salario*p.diasPagar)/15)*n.diasTrabajados),2) as importetemporal,np.idPercepcion from Percepciones p 
					join NominasPercepciones np on (p.idPercepcion = np.idPercepcion) and (np.idNomina = @idNomina)
					join Nominas n on n.idNomina = @idNomina
					join Empleados e on e.idEmpleado = n.idEmpleado
					and case
						--si la percepcion es el aguinaldo,a menos que sea 15 de diciembre no se sumara al pago de la nomina de los otros meses
						when np.idPercepcion = 4 and ( CAST(getdate() as date) < CAST(@fechaAguinaldo as date) or CAST(getdate() as date) > CAST(@fechaAguinaldo as date))
							then 0--la fecha no es la fecha para pago de aguinaldo
						else 1--la fecha es la del pago del aguinaldo
					end = 1;

				UPDATE NominasPercepciones SET NominasPercepciones.importe = #TablaTemporalP.importe
				FROM NominasPercepciones join #TablaTemporalP ON NominasPercepciones.idPercepcion = #TablaTemporalP.idPercepcion

				drop table #TablaTemporalP;

				declare @totalPerXDia float;
				select @totalPerXDia = SUM(importe) from NominasPercepciones where idNomina = @idNomina;

				--agregamos el totalP en la Nomina
				update Nominas set totalP = @totalPerXDia where idNomina = @idNomina;




				--////////////////////////////////////////////////////////////////////////////////////////////////////////////
				--las NominasDeducciones:
				--calculamos el porcentaje a restar del totalP en base al porcentaje de la deduccion

				CREATE TABLE #TablaTemporalD (importe float,idDeduccion int)

				--debido a que el totalDeducciones es calculado en base a totalP y este valor 
				--ya esta en precio por dia no se debe ajustar
				insert into #TablaTemporalD select ROUND(((d.porcentaje/100)*n.totalP),2) as importe,d.idDeduccion
				from Deducciones d join NominasDeducciones nd on d.idDeduccion = nd.idDeduccion and nd.idNomina = @idNomina
				join Nominas n on n.idNomina = @idNomina;

				UPDATE NominasDeducciones SET NominasDeducciones.importe = #TablaTemporalD.importe
				FROM NominasDeducciones join #TablaTemporalD ON NominasDeducciones.idDeduccion = #TablaTemporalD.idDeduccion

				drop table #TablaTemporalD;

				declare @totalDedXDia float;
				select @totalDedXDia = SUM(importe) from NominasDeducciones where idNomina = @idNomina;

				update Nominas set totalD = @totalDedXDia where idNomina = @idNomina;




				--////////////////////////////////////////////////////////////////////////////////////////////////////////////
				--La CANTIDAD NETA
				--es el valor obtenido al restar totalpercepciones y totaldeducciones
				--este valor corresponde al salario que se le pagara al trabajador por dia trabajado

				update Nominas set cantidadNeta = (totalP-totalD) where idNomina = @idNomina;

				--///////////////////////////////////////////////////////////////////////////////////////////////////////////
				SET @min = @min + 1;
			END--%%%%%%%%%%%%%%%%%%%%%
			
			else
			BEGIN--#####################
			--Como la nomina ya fue pagada, ya no debemos de calcularla mas
				SET @min = @min + 1;
			END--#######################

		--$$$$$$$$$$$$$$$$$$$$$$$4
		   
		END;
END;



-----Permisos
grant exec on sp_actualizar_nomina to RecursosHumanos

--se ejecuta de la siguiente manera
exec sp_actualizar_nomina;


--comprobamos que las nominas hayan sido actualizadas correctamente
select * from Nominas_empleados;