create database WIPPO;

use WIPPO;

create table if not exists Usuario(
	ID_Usuario varchar(30) not null,
    Correo_Electronico varchar(40) not null,
    Contraseña varchar(40) not null,
	Nombre varchar(15) not null,
    Apellido_Paterno varchar(15) not null,
    Apellido_Materno varchar(15) not null, 
    Telefono varchar(17) not null,
    Fecha_Nacimiento date not null,
    RFC varchar(12),
    primary key(ID_Usuario)
)ENGINE=INNODB;

create table if not exists Productos(
	Modelo varchar(30) not null,
    Nombre varchar(30) not null,
    Precio int not null,
    Cantidad int null,
    Color varchar(20) not null,
    Descripcion varchar(50),
    ID_Usuario varchar(30),
    Primary Key (Modelo),
    Foreign Key (ID_Usuario) references Usuario(ID_Usuario)
)ENGINE=INNODB;

create table if not exists Orden(
	ID_Orden varchar(30) not null,
    Fecha date not null,
    Estatus varchar(20) not null,
    Monto_Total int not null,
    ID_Usuario varchar(30) not null,
    primary key(ID_Orden),
    foreign key (ID_Usuario) references Usuario(ID_Usuario)
);

create table if not exists Solicitar_Devolucion(
	ID_Usuario varchar(40) not null,
    Usuario_ID_Usuario varchar(40) not null,
	Modelo varchar(30) not null,
    Motivo			varchar(50) ,
    Estatus			varchar(20) not null,
    Fecha_Solicitud date not null,
    foreign key(ID_Usuario) references  Usuario(ID_Usuario),
    foreign key(Usuario_ID_Usuario) references Productos (ID_Usuario),
    foreign key(Modelo) references Productos (Modelo)
)ENGINE=INNODB;

create table if not exists Telefonos_Tablets(
	Modelo varchar(30) not null,
    Procesador_Nucleos int not null,
    RAM int not null,
    MPX_Camara int not null,
    ID_Usuario varchar(30) not null,
    Almacenamiento int not null,
	foreign key (Modelo) references Productos (Modelo),
    foreign key (ID_Usuario) references  Usuario(ID_Usuario)
)ENGINE=INNODB;

create table if not exists Computadoras(
	Modelo varchar(30) not null,
    Marcha_Procesador varchar(20) not null,
    RAM int not null,
    Tamano_Pantalla int not null,
    Nucleos_Procesador int not null,
    Almacenamiento_Primario int not null,
    ID_Usuario varchar(30) not null,
    Almacenamiento_Secundario int not null,
    Modelo_Procesador varchar(30),
    foreign key (Modelo) references Productos(Modelo),
	foreign key (ID_Usuario) references Productos(ID_Usuario)
)ENGINE=INNODB;

create table if not exists Califica(
	ID_Usuario varchar(30) not null,
	Modelo varchar(30) not null,
    Productos_ID_Usuario varchar(30) not null,
    Calificacion int not null,
    Comentario varchar(70),
    foreign key (ID_Usuario) references Usuario(ID_Usuario),
    foreign key (Modelo) references Productos(Modelo),
    foreign key (Productos_ID_Usuario) references Productos(ID_Usuario)
)engine=innodb;

create table if not exists Contiene(
	ID_Orden varchar(30) not null,
    Modelo varchar(30) not null,
    ID_Usuario varchar(30) not null,
    Cantidad int not null,
    foreign key (ID_Orden) references Orden(ID_Orden),
    foreign key (Modelo) references Productos(Modelo),
    foreign key (ID_Usuario) references Productos(ID_Usuario)
)engine=innodb; 

create table if not exists Metodo_De_Pago(
	Alias	varchar(30) not null,
    No_Tarjeta varchar(16) not null,
    Mes char(2) not null,
    Año char(2)  not null,
    ID_Usuario varchar(30) not null,
    primary key (No_Tarjeta),
    foreign key (ID_Usuario) references Usuario(ID_Usuario)
)engine=innodb;

create table if not exists Direccion(
	Alias varchar(30) not null,
    Nombre_Calle varchar(30) not null,
    Num_ext int not null,
    Num_int int,
    Colonia varchar(20) not null,
    Municipio varchar(20) not null,
    Estado varchar(15) not null,
    CP char(5) not null,
    ID_Usuario varchar(30) not null,
    
    primary key(Alias),
    foreign key (ID_Usuario) references Usuario(ID_Usuario)
)engine=innodb;
