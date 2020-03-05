use ERP2020;

insert into Estados (nombre,siglas,estatus) values ('MICHOACAN','MICH','A');
insert into Estados (nombre,siglas,estatus) values ('JALISCO','JAL','A');
insert into Estados (nombre,siglas,estatus) values ('COLIMA','COL','A');
insert into Estados (nombre,siglas,estatus) values ('VERACRUZ','VRZ','A');
insert into Estados (nombre,siglas,estatus) values ('TABASCO','TBC','A');
insert into Estados (nombre,siglas,estatus) values ('EDO MEXICO','EDM','A');
insert into Estados (nombre,siglas,estatus) values ('TAMAULIPAS','TMU','A');
insert into Estados (nombre,siglas,estatus) values ('SINALOA','SIN','A');
insert into Estados (nombre,siglas,estatus) values ('SONORA','SON','A');
insert into Estados (nombre,siglas,estatus) values ('BAJA CALIFORNIA NORTE','BCN','A');
insert into Estados (nombre,siglas,estatus) values ('BAJA CALIFORNIA SUR','BCS','A');
insert into Estados (nombre,siglas,estatus) values ('CHIHUAHUA','CHI','A');
insert into Estados (nombre,siglas,estatus) values ('ZACATECAS','ZAC','A');

GO
-- CANTIDAD DINAMICA DE ROWS POR PAGINA
CREATE PROCEDURE sp_paginaciondinamica (@nombretabla as varchar(max),@orderby as varchar(max),@pagina varchar(max),@cantreg varchar(max))
AS
BEGIN
	DECLARE @ActualTableName AS varchar(max)
	DECLARE @sql AS varchar(MAX)
	--OBTENEMOS EL NOMBRE DE LA TABLA
    SELECT @ActualTableName = QUOTENAME( TABLE_NAME ) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @nombretabla
	SELECT @sql = 'SELECT * FROM '+@ActualTableName+' ORDER BY '+@orderby+' ASC OFFSET ('+@pagina+'+-1)* '+@cantreg+' ROWS FETCH NEXT '+@cantreg+' ROWS ONLY'
	EXEC(@SQL)
END

execute sp_paginaciondinamica 'Ciudades','nombre','1','5';