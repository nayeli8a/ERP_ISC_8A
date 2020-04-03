CREATE DATABASE ERP2020
use ERP2020

create table Deducciones(
idDeduccion int IDENTITY(1,1) not null,
nombre varchar(30) not null,
descripcion varchar(80) not null ,
porcentaje float not null,
estatus char not null,
constraint Deducciones_PK primary key (idDeduccion)
);

create table Departamentos(
idDepartamento int not null IDENTITY(1,1),
nombre varchar(50) not null,
estatus char not null,
constraint Departamentos_PK primary key (idDepartamento)
);
create table Puestos(
idPuesto int not null IDENTITY(1,1),
nombre varchar(60) not null,
salarioMinimo float not null,
salarioMaximo float not null,
estatus char not null,
constraint Puestos_PK primary key (idPuesto)
);

create table Estados(
idEstado int not null IDENTITY(1,1),
nombre varchar(60) not null,
siglas varchar(10) not null,
estatus char not null,
constraint Estado_PK primary key (idEstado)
);

create table Ciudades(
idCiudad int not null IDENTITY(1,1),
nombre varchar(80) not null,
idEstado int not null,
estatus char not null,
constraint Ciudades_PK primary key (idCiudad),
constraint Ciudades_Estado_FK foreign key (idEstado) references Estados(idEstado)
);

create table FormasPago(
idFormaPago int not null IDENTITY(1,1),
nombre varchar(50) not null,
estatus char not null ,
constraint FormasPago_PK primary key (idFormaPago)
);


create table Percepciones(
idPercepcion int not null IDENTITY(1,1),
nombre varchar(30) not null,
descripcion varchar(80) not null,
diasPagar int not null,
estatus char not null,
constraint Percepciones_PK primary key (idPercepcion)
);

create table TiposUsuarios(
	ipTipoUsuario int not null IDENTITY(1,1), 
	nombre varchar(80) not null,
	estatus char,
	constraint TiposUsuarios_PK primary key(ipTipoUsuario)
);

CREATE TABLE Cultivos(
	idCultivo INTEGER IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(100),
	costoAsesoria FLOAT,
	estatus CHAR,
	
	CONSTRAINT Cultivos_PK PRIMARY KEY(idCultivo)
);

CREATE TABLE Asociaciones(
	idAsosiacion INTEGER IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(100),
	estatus CHAR,

	CONSTRAINT Asociaciones_PK PRIMARY KEY(idAsosiacion)
);

CREATE TABLE Miembros(
	idCliente INTEGER IDENTITY(1,1) NOT NULL,
	idAsosiacion INTEGER ,
	estatus CHAR,
	fechaIncorporacion DATE,

	CONSTRAINT Miembros_PK PRIMARY KEY (idAsosiacion,idCliente)
);

CREATE TABLE UnidadesTransporte(
	idUnidadTransporte INTEGER IDENTITY(1,1) NOT NULL,
	placas VARCHAR(10),
	marca VARCHAR(80),
	modelo VARCHAR(80),
	anio INTEGER,
	capacidad INTEGER,
	estatus CHAR,

	CONSTRAINT UnidadesTransporte_PK PRIMARY KEY (idUnidadTransporte)
);

CREATE TABLE Sucursales(
idSucursal integer  NOT NULL IDENTITY(1,1),
nombre varchar(50),
telefono varchar(15),
direccion varchar(80),
colonia varchar(50),
codigoPostal varchar(5),
presupuesto float,
estatus char,
idCiudad int,
CONSTRAINT Sucursales_PK PRIMARY KEY (idSucursal),
CONSTRAINT Sucursales_Ciudad_FK FOREIGN KEY(idCiudad) REFERENCES Ciudades(idCiudad)
);

create table Empleados(
idEmpleado int not null IDENTITY(1,1),
nombre varchar(30) not null,
apaterno varchar(30) not null,
amaterno varchar(30) not null,
sexo char not null,
fechaContratacion date not null,
fechaNacimiento date not null,
salario float not null,
nss varchar(10) not null,
estadoCivil varchar(20) not null,
diasVacacionales int not null,
diasPermiso int not null,
fotografia varbinary null,
direccion varchar(80) not null,
colonia varchar(50) not null,
codigoPostal varchar(5) not null,
escolaridad varchar(80) not null,
porcentajeComision float not null,
estatus char not null,
idDepartamento int not null,
idPuesto int not null, 
idCiudad int not null,
idSucursal int not null,
constraint Empleados_PK primary key (idEmpleado),
constraint Empleados_Ciudad_FK foreign key (idCiudad) references Ciudades(idCiudad),
constraint Empleados_Departamentos_FK foreign key (idDepartamento) references Departamentos(idDepartamento),
constraint Empleados_Puestos_FK foreign key (idPuesto) references Puestos(idPuesto),
constraint Empleados_Sucursal_FK foreign key (idSucursal) references Sucursales(idSucursal)
);

create table Horarios(
idHorario int not null IDENTITY(1,1), 
horaInicio date not null,
horaFin date not null,
dias varchar(30) not null,
idEmpleado int not null,
estatus char not null,
constraint Horarios_PK primary key (idHorario),
constraint Horarios_Empleados_FK foreign key (idEmpleado) references Empleados(idEmpleado)
);

create table HistorialPuestos(
idEmpleado int not null IDENTITY(1,1),
idPuesto int not null,
idDepartamento int not null,
fechaInicio date not null,
fechaFin date not null,
salario float not null,
estatus char not null,
constraint HistorialPuestos_PK primary key (fechaInicio,idEmpleado,idPuesto,idDepartamento),
constraint HistorialPuestos_Empleados_FK foreign key (idEmpleado) references Empleados(idEmpleado),
constraint HistorialPuestos_Departamentos_FK foreign key (idDepartamento) references Departamentos(idDepartamento),
constraint HistorialPuestos_Puestos_FK foreign key (idPuesto) references Puestos(idPuesto)
);

create table AusenciaJustificada(
idAusencia int not null IDENTITY(1,1),
fechaSolicitud date not null,
fechaInicio date not null,
fechaFin date not null,
tipo char not null,
idEmpleadoS int not null,
idEmpleadoA int not null,
estatus char not null,
constraint AusenciasJustificadas_PK primary key (idAusencia),
constraint AusenciasJustificadas_EmpleadosA_FK foreign key (idEmpleadoA) references Empleados(idEmpleado),
constraint AusenciasJustificadas_EmpleadosS_FK foreign key (idEmpleadoS) references Empleados(idEmpleado)
);

create table DocumentacionEmpleado(
idDocumento int not null IDENTITY(1,1),
nombreDocumento varchar(80) not null,
fechaEntrega date not null,
documento varbinary ,
idEmpleado int not null,
estatus char not null,
constraint DocumentacionEmpleado_PK primary key (idDocumento),
constraint DocumentacionEmpleado_Empleado_FK foreign key (idEmpleado) references Empleados(idEmpleado)
);

create table Incapacidades(
idIncapacidad int not null IDENTITY(1,1),
fechaInicio date not null,
fechaFin date not null,
enfermedad varchar(150) not null,
evidencia varbinary not null,
idEmpleado int not null,
constraint Incapacidades_PK primary key (idIncapacidad),
constraint Incapacidades_Empleado_FK foreign key (idEmpleado) references Empleados(idEmpleado)
);

create table Nominas(
idNomina int IDENTITY(1,1) not null,
fechaPago date not null,
totalP float not null,
totalD float not null,
cantidadNeta float not null,
diasTrabajados int not null,
faltas int not null,
fechaInicio date not null,
fechaFin date not null,
idEmpleado int not null,
idFormaPago int not null,
estatus char not null,
constraint Nominas_PK primary key (idNomina),
constraint NominasEmpleados_FK foreign key (idEmpleado) references Empleados(idEmpleado),
constraint NominasFormaPago_FK foreign key (idFormaPago) references FormasPago(idFormaPago)
);

create table Usuarios(
	nombre varchar(30) not null, 
	contrasenia varchar(20),
	estatus char,
	idEmpleado int,
	idTipoUsuario int,
	constraint Usuarios_PK primary key (nombre),
	constraint Empleados_FK foreign key (idEmpleado) references Empleados(idEmpleado), 
	constraint Usuarios_TipoUsuario_FK foreign key (idTipoUsuario) references TiposUsuarios(ipTipoUsuario)
);

CREATE TABLE Clientes(
	idCliente INTEGER IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(100),
	razonSocial VARCHAR(100),
	limiteCredito FLOAT,
	direccion VARCHAR(80),
	codigoPostal CHAR(5),
	rfc CHAR(13),
	telefono CHAR(12),
	email VARCHAR(100),
	tipo CHAR,
	idCiudad INTEGER,
	estatus CHAR,

	CONSTRAINT Clientes_PK PRIMARY KEY (idCliente),
	constraint Clientes_Ciudad_FK FOREIGN KEY (idCiudad) REFERENCES Ciudades(idCiudad)
);

CREATE TABLE Ventas(
	idVenta INTEGER IDENTITY(1,1) NOT NULL,
	fecha DATE,
	totalPagar FLOAT,
	cantPagada FLOAT,
	comentarios VARCHAR(100),
	estatus CHAR,
	tipo CHAR,
	idCliente INTEGER,
	idSucursal INTEGER,
	idEmpleado INTEGER,

	CONSTRAINT Ventas_PK PRIMARY KEY(idVenta),
	constraint Ventas_Clientes_FK FOREIGN KEY(idCliente) REFERENCES Clientes(idCliente),
	constraint Ventas_Sucursal_FK FOREIGN KEY(idSucursal) REFERENCES Sucursales(idSucursal),
	constraint Ventas_Empleado_FK FOREIGN KEY(idEmpleado) REFERENCES Empleados(idEmpleado)
);

CREATE TABLE ClientesCultivos(
	idClienteCultivo INTEGER IDENTITY(1,1) NOT NULL,
	extension FLOAT,
	ubicacion VARCHAR(100),
	idCliente INTEGER,
	idCultivo INTEGER,
	idCiudad INTEGER,
	estatus CHAR,

	CONSTRAINT ClientesCultivos_PK PRIMARY KEY(idClienteCultivo),
	constraint ClientesCultivos_Clientes_FK FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
	constraint ClientesCultivos_Cultivo_FK FOREIGN KEY (idCultivo) REFERENCES Cultivos(idCultivo),
	constraint ClientesCultivos_Ciudad_FK FOREIGN KEY (idCiudad) REFERENCES Ciudades(idCiudad)
);

CREATE TABLE Facturas(
	Folio CHAR NOT NULL,
	subtotal FLOAT,
	iva FLOAT,
	total FLOAT,
	nombreDocXML VARCHAR(100),
	documentoXML VARBINARY(MAX),
	nombreDocPDF VARCHAR(100),
	documentoPDF VARBINARY(MAX),
	idVenta INTEGER,
	estatus CHAR,

	CONSTRAINT Facturas_PK PRIMARY KEY(Folio),
	constraint Facturas_Venta_FK FOREIGN KEY(idVenta) REFERENCES Ventas(idVenta)
);

CREATE TABLE Envios(
	idEnvio INTEGER IDENTITY(1,1) NOT NULL,
	fechaEntregaPlaneada DATE,
	fechaEntregaReal DATE,
	direccion VARCHAR (100),
	codigoPostal VARCHAR(5),
	idVenta INTEGER,
	idUnidadTransporte INTEGER,
	idCiudad INTEGER,
	estatus CHAR,

	CONSTRAINT EnviosVentas_PK PRIMARY KEY (idEnvio),
	constraint EnviosVentas_Venta_FK FOREIGN KEY (idVenta) REFERENCES Ventas(idVenta),
	constraint EnviosVentas_UnidadTransporte_FK FOREIGN KEY (idUnidadTransporte) REFERENCES UnidadesTransporte(idUnidadTransporte)
);

CREATE TABLE Visitas(
	idVisita INTEGER IDENTITY(1,1) NOT NULL,
	fechaPlaneada DATE,
	fechaReal DATE,
	comentarios VARCHAR(200),
	estatus CHAR,
	costo FLOAT,
	idClienteCultivo INTEGER,
	idEmpleado INTEGER,
	idUnidadTransporte INTEGER

	CONSTRAINT Visitas_PK PRIMARY KEY(idVisita)
	constraint Visitas_ClienteCultivos_FK FOREIGN KEY(idClienteCultivo) REFERENCES ClientesCultivos(idClienteCultivo),
	constraint Visitas_Empleados_FK FOREIGN KEY(idEmpleado) REFERENCES Empleados(idEmpleado),
	constraint Visitas_UnidadTrasnporte_FK FOREIGN KEY(idUnidadTransporte) REFERENCES UnidadesTransporte(idUnidadTransporte)
	
);

CREATE TABLE Tripulacion(
	idEmpleado int NOT NULL,
	idEnvio  int NOT NULL,
	rol VARCHAR(50) NOT NULL,
	estatus CHAR,

	CONSTRAINT Tripulacion_PK PRIMARY KEY(rol,idEmpleado,idEnvio),
	constraint Tripulacion_Empleado_FK FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado),
	constraint Tripulacion_Envio_FK FOREIGN KEY (idEnvio) REFERENCES Envios(idEnvio)
);

CREATE TABLE Cobros(
	idCobro INTEGER IDENTITY(1,1) NOT NULL,
	fecha DATE,
	importe FLOAT,
	idVenta INTEGER,
	idFormaPago INTEGER,
	estatus CHAR,

	CONSTRAINT Cobros_PK PRIMARY KEY(idCobro),
	constraint Cobros_Venta_FK FOREIGN KEY (idVenta) REFERENCES Ventas(idVenta),
	constraint Cobros_FormaPago_FK FOREIGN KEY (idFormaPago) REFERENCES FormasPago(idFormaPago)
);

CREATE TABLE Mantenimientos(
	idMantenimiento INTEGER IDENTITY(1,1) NOT NULL,
	fecha DATE,
	taller VARCHAR(100),
	costo FLOAT,
	comentarios VARCHAR(200),
	tipo VARCHAR(30),
	idUnidadTransporte INTEGER,
	estatus CHAR,

	CONSTRAINT Mantenimientos_PK PRIMARY KEY (idMantenimiento),
	constraint Mantenimientos_UnidadTransporte_FK FOREIGN KEY (idUnidadTransporte) REFERENCES UnidadesTransporte(idUnidadTransporte)
);


CREATE TABLE Laboratorios(
idLaboratorio integer IDENTITY(1,1) not null, -- AUTO_INCREMENTO DE LA LLAVE PRIMARIA 
nombre varchar(50),
origen varchar(30),
estatus char

CONSTRAINT Marcas_PK PRIMARY KEY (idLaboratorio)

);

CREATE TABLE Categorias(
idCategorias integer IDENTITY(1,1) not null,
nombre varchar(30),
estatus char

CONSTRAINT Categorias_PK PRIMARY KEY(idCategorias)

);

CREATE TABLE Productos(
idProducto integer IDENTITY(1,1) not null,
nombre varchar(50),
descripcion varchar(100),
puntoReorden integer,
precioCompra float,
precioVenta float,
ingredienteActivo varchar(100),
bandaToxicologica varchar(80),
aplicacion varchar(200),
uso varchar(200),
idLaboratorio integer not null,
idCategorias integer not null,
estatus char

CONSTRAINT Productos_PK PRIMARY KEY(idProducto),
CONSTRAINT Laboratorio_FK FOREIGN KEY(idLaboratorio) REFERENCES Laboratorios(idLaboratorio),
CONSTRAINT Categorias_FK FOREIGN KEY(idCategorias) REFERENCES Categorias(idCategorias),
);

CREATE TABLE Ofertas(
	idOferta INTEGER IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(50),
	descripcion VARCHAR(100),
	porDescuento FLOAT,
	fechaInicio DAtE,
	fechaFin DATE,
	canMinProducto INTEGER,
	estatus CHAR,
	idProducto INTEGER,

	CONSTRAINT Ofertas_PK PRIMARY KEY(idOferta),
	constraint Ofertas_Producto_FK FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);


CREATE TABLE OfertasAsociacion(
	idAsosiacion INTEGER IDENTITY(1,1) NOT NULL,
	idOferta INTEGER,
	estatus CHAR,
	
	CONSTRAINT OfertasAsociacion_PK PRIMARY KEY(idAsosiacion,idOferta),
	constraint OfertasAsociacion_Asociacion_FK FOREIGN KEY (idAsosiacion) REFERENCES Asociaciones(idAsosiacion),
	constraint OfertasAsociacion_Oferta_FK FOREIGN KEY (idOferta) REFERENCES Ofertas(idOferta)
);

create table NominasDeducciones(
idNomina int not null,
idDeduccion int not null,
importe float,
estatus char,
constraint NominasDeducciones_PK primary key (idNomina, idDeduccion),
constraint NominasDeducciones_Deducciones_FK foreign key (idDeduccion) references Deducciones(idDeduccion),
constraint NominasDeducciones_Nominas_FK foreign key (idNomina) references Nominas(idNomina)
);

create table NominasPercepciones(
idNomina int not null,
idPercepcion int not null,
importe float,
estatus char,
constraint NominasPercepciones_PK primary key (idNomina, idPercepcion),
constraint NominasPercepciones_Nomina_FK foreign key (idNomina) references Nominas(idNomina),
constraint NominasPercepciones_Percepcion_FK foreign key (idPercepcion) references Percepciones(idPercepcion)
);


CREATE TABLE ImagenesProducto(
idImagen integer IDENTITY(1,1) not null,
nombreImagen varchar(100),
imagen varbinary(max),
principal char, 
estatus char,
idProducto integer not null

CONSTRAINT ImagenesProducto_PK PRIMARY KEY(idImagen),
CONSTRAINT Productos_FK FOREIGN KEY(idProducto) REFERENCES Productos(idProducto)
);

CREATE TABLE Proveedores(
idProveedor integer IDENTITY(1,1) NOT NULL,
nombre varchar(80),
telefono char(12),
email varchar(100),
direccion varchar(80),
colonia varchar(50),
codigoPostal varchar(5),
idCiudad integer not null,
estatus char

CONSTRAINT Proveedores_PK PRIMARY KEY(idProveedor),
CONSTRAINT Ciudad_FK FOREIGN KEY(idCiudad) REFERENCES Ciudades(idCiudad)

);

CREATE TABLE ContactosProveedor(
idContacto integer IDENTITY(1,1) NOT NULL,
nombre varchar(80),
telefono char(12),
email varchar(100), 
estatus char,
idProveedor integer not null,

CONSTRAINT ContactosProveedor_PK PRIMARY KEY(IdContacto),
CONSTRAINT Proveedor_FK FOREIGN KEY(idProveedor) REFERENCES Proveedores(idProveedor)
);

CREATE TABLE UnidadMedida(
idUnidad integer IDENTITY(1,1) NOT NULL,
nombre varchar(80),
capacidad float,
estatus char,

CONSTRAINT UnidadMedida_PK PRIMARY KEY(idUnidad)

);



CREATE TABLE Empaques(
idEmpaque integer IDENTITY(1,1) NOT NULL,
nombre varchar(80),
capacidad float,
estatus char,
idUnidad integer not null,

CONSTRAINT Presentaciones_PK PRIMARY KEY(idEmpaque),
CONSTRAINT Unidad_FK FOREIGN KEY(idUnidad) REFERENCES UnidadMedida(idUnidad)
);

CREATE TABLE CuentasProveedor(
idCuentaProveedor integer not null IDENTITY(1,1),
idProveedor integer not null,
noCuenta varchar(10),
banco varchar(30),
estatus char
CONSTRAINT CuentasProveedor_PK PRIMARY KEY(idCuentaProveedor),
CONSTRAINT ProveedorCP_FK FOREIGN KEY(idProveedor) REFERENCES Proveedores(idProveedor)
);

CREATE TABLE Pedidos(
idPedido integer not null IDENTITY(1,1),
fechaRegistro date,
fechaRecepcion date,
totalPagar float,
cantidadPagada float,
estatus char,
idProveedor integer not null,
idSucursal integer not null,
idEmpleado integer not null

CONSTRAINT Pedidos_PK PRIMARY KEY(idPedido),
CONSTRAINT ProveedorPe_FK FOREIGN KEY(idProveedor) REFERENCES Proveedores(idProveedor),
CONSTRAINT SucursalPE_FK FOREIGN KEY(idSucursal) REFERENCES Sucursales(idSucursal),
CONSTRAINT EmpleadosPE_FK FOREIGN KEY(idEmpleado) REFERENCES Empleados(idEmpleado)
);

CREATE TABLE Pagos(
idPago integer not null IDENTITY(1,1),
fecha date,
importe float, 
idPedido integer not null,
idFormaPago integer not null,
idCuentaProveedor integer not null,
estatus char,

CONSTRAINT Pagos_PK PRIMARY KEY(idPago),
CONSTRAINT PedidoPa_FK FOREIGN KEY(idPedido) REFERENCES Pedidos(idPedido),
CONSTRAINT FormaPago_FK FOREIGN KEY(idFormaPago) REFERENCES FormasPago(idFormaPago),
CONSTRAINT CuentaProveedor_FK FOREIGN KEY(idCuentaProveedor) REFERENCES CuentasProveedor(idCuentaProveedor)

);


CREATE TABLE PresentacionesProductos(
idPresentacion integer IDENTITY(1,1) not null,
precioCompra float,
precioVenta float,
puntoReorden float, 
idProducto integer not null,
idEmpaque integer not null,
estatus char,

CONSTRAINT PresentacionesProducto_PK PRIMARY KEY(idPresentacion),
CONSTRAINT Producto_FK FOREIGN KEY(idProducto) REFERENCES Productos(idProducto),
CONSTRAINT Empaque_FK FOREIGN KEY(idEmpaque) REFERENCES Empaques(idEmpaque)

);

CREATE TABLE ProductosProveedor(
idProveedor integer NOT NULL,
idPresentacion integer  NOT NULL,
diasRetardo integer,
precioEstandar float,
precioUltimaCompra float,
cantMinPedir integer,
cantMaxPedir integer, 
estatus char

CONSTRAINT ProductosProveedor_PK PRIMARY KEY(idProveedor,idPresentacion),
CONSTRAINT Proveedores_FK FOREIGN KEY(idProveedor) REFERENCES Proveedores(idProveedor),
CONSTRAINT Presentacion_FK FOREIGN KEY(idPresentacion) REFERENCES PresentacionesProductos(idPresentacion)
);


CREATE TABLE PedidoDetalle(
idPedidoDetalle integer not null IDENTITY(1,1),
cantPedida integer,
precioCompra float,
subtotal float,
cantRecibida integer,
cantRechazada integer,
cantAceptada float, 
idPedido integer not null,
idPresentacion integer not null,
estatus char

CONSTRAINT PedidoDetalle_PK PRIMARY KEY(idPedidoDetalle),
CONSTRAINT PedidoDetalle_Pedido_FK FOREIGN KEY(idPedido) REFERENCES Pedidos(idPedido),
CONSTRAINT PedidoDetalle_Presentacion_FK FOREIGN KEY(idPresentacion) REFERENCES PresentacionesProductos(idPresentacion)
);


CREATE TABLE ExistenciasSucursal(
idPresentacion integer IDENTITY(1,1) NOT NULL,
idSucursal integer not null,
cantidad float, 
estatus char,

CONSTRAINT ExistenciasSucursal_PK PRIMARY KEY(idPresentacion, idSucursal),
CONSTRAINT PresentacionES_FK FOREIGN KEY(idPresentacion) REFERENCES PresentacionesProductos(idPresentacion),
CONSTRAINT Sucursal_FK FOREIGN KEY(idSucursal) REFERENCES Sucursales(idSucursal)

);


CREATE TABLE VentasDetalle(
	idVentaDetalle INTEGER IDENTITY(1,1) NOT NULL,
	precioVenta FLOAT,
	cantidad FLOAT,
	subtotal FLOAT,
	idVenta INTEGER,
	idPresentacion INTEGER,
	estatus CHAR,

	CONSTRAINT VentasDetalle_PK PRIMARY KEY (idVentaDetalle),
	constraint VentasDetalle_Venta_FK FOREIGN KEY (idVenta) REFERENCES Ventas(idVenta),
	constraint VentasDetalle_Presentacion_FK FOREIGN KEY (idPresentacion) REFERENCES PresentacionesProductos(idPresentacion)
);

