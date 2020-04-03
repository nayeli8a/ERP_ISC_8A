select * from Usuarios;
select * from TiposUsuarios;
select * from Empleados;
select * from Departamentos;
select * from Puestos;
select * from Estados;
select * from Ciudades; 
select * from Sucursales; 

-- DATOS NECESARIOS ANTES DE CREAR EMPLEADOS EN LA BD
insert into Estados values('Michoacan', 'Mich', 'A');
insert into Ciudades values('Zamora', '1', 'A');
insert into Sucursales values('Zam','351-000-00-00', 'Colonia centro', 'Centro','59829', 1000000, 'A',1);
insert into Puestos values ('Gerente', 10000, 19000, 'A');
insert into Departamentos values('Gerencia' ,'A');
insert into TiposUsuarios (nombre,estatus) values ('Gerente de RH','A')
insert into TiposUsuarios (nombre,estatus) values ('Gerente de Ventas','A')
insert into TiposUsuarios (nombre,estatus) values ('Gerente de Compras','A')

-- CREACION DE EMPLEADOS 
insert into Empleados values ('Francisco', 'Cocom', 'Gutierrez', 'M', '2020-01-01','1998-09-16',15000, 'nmol','soltero',10,10,null,'Corregidora','Jardines de Catedral','59600', 'Maestria', 100 , 'A', 1, 1, 1, 1);
insert into Empleados values ('Nayeli Montserrat', 'Ochoa', 'Legorreta', 'F', '2020-01-01','1998-05-26',15000, 'nmol','soltera',10,10,null,'Corregidora','Jardines de Catedral','59600', 'Maestria', 100 , 'A', 1, 1, 1, 1);
insert into Empleados values ('Francisco', 'Cocom', 'Gutierrez', 'F', '01-01-2020','1998-02-14',15000, 'nmol','soltero',10,10,null,'Corregidora','Jardines de Catedral','59600', 'Maestria', 100 , 'A', 1, 1, 1, 1);

-- CREACION DE LOS USUARIOS EN BASE A LOS EMPLEADOS REGISTRADOS ANTES, ESTOS USUARIOS CORRESPONDERAN A LOS LOGINS DE LA BD
insert into Usuarios values('RH' ,'recursos123','A',3,1);
insert into Usuarios values('VENTAS' ,'ventas123','A',4,2);
insert into Usuarios values('COMPRAS' ,'compras123','A',5,3);
select * from Usuarios
select * from Empleados

