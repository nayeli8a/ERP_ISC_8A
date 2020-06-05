CREATE PROC sp_EliminarLogicamente(@NombreTabla as varchar(max),@id as varchar(max),@NombreColumna as varchar(max),@TablaRel as varchar(max)) 
AS
BEGIN
    DECLARE @ActualTableName AS varchar(max)
	DECLARE @TablaRelacionada AS varchar(max)
	DECLARE @columnaID AS varchar(max)
	DECLARE @sql AS varchar(MAX)
	DECLARE @sqlaux AS nvarchar(max)
	DECLARE @count AS int

	--OBTENEMOS EL NOMBRE DE LA TABLA
    SELECT @ActualTableName = QUOTENAME( TABLE_NAME ) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @NombreTabla;
	SELECT @TablaRelacionada = QUOTENAME( TABLE_NAME ) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @TablaRel;

	SELECT @sqlaux = 'SELECT COUNT('+@NombreColumna+') FROM '+@TablaRelacionada+' WHERE '+@NombreColumna+' = '''+@id+''' '
	DECLARE @test AS TABLE(object_id int);
	INSERT INTO @test
	EXECUTE sp_executesql @sqlaux;

	set @count = (select * from @test)

	IF(@count > 0)
	BEGIN
		--print('existen registros')
		select -1
	END

	IF(@count = 0)
	BEGIN
		--print('no existen registros')
		SELECT @sql = 'UPDATE '+@ActualTableName+' SET estatus = ''I'' '+' WHERE '+@NombreColumna+' = '''+@id+''''
		EXEC(@SQL)
	END
END

-----Permisos
grant exec on sp_EliminarLogicamente to RecursosHumanos

execute sp_EliminarLogicamente 'Estados','1','idEstado';
select * from Estados