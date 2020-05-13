CREATE PROC sp_EliminarLogicamente(@NombreTabla as varchar(max),@id as varchar(max),@NombreColumna as varchar(max)) 
AS
BEGIN
    DECLARE @ActualTableName AS varchar(max)
	DECLARE @columnaID AS varchar(max)
	DECLARE @sql AS varchar(MAX)

	--OBTENEMOS EL NOMBRE DE LA TABLA
    SELECT @ActualTableName = QUOTENAME( TABLE_NAME ) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @NombreTabla

    SELECT @sql = 'UPDATE '+@ActualTableName+' SET estatus = ''I'' '+' WHERE '+@NombreColumna+' = '''+@id+''''
	print(@id)
	EXEC(@SQL)
END

-----Permisos
grant exec on sp_EliminarLogicamente to RecursosHumanos

execute sp_EliminarLogicamente 'Estados','1','idEstado';
select * from Estados