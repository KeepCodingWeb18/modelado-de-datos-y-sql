create schema if not exists franciscomoma;

set schema 'franciscomoma';


create table persona(
	id serial primary key,
	dni varchar(10) not null,
	nombre varchar(50) not null,
	apellido_1 varchar(50) not null,
	apellido_2 varchar(50)
);

create table contacto(
	id serial primary key,
	id_persona integer not null,
	telefono varchar(10) not null,
	email varchar(50) not null,
	calle varchar(80) not null,
	numero varchar(10) not null,
	direccion varchar(30) not null,
	constraint contacto_persona_fk foreign key (id_persona) references persona(id)  
);


create table poblacion(
	id serial primary key,
	poblacion varchar(50) not null,
	id_provincia integer not null
);


create table provincia(
	id serial primary key,
	provincia varchar(30) not null
);


alter table poblacion 
add constraint poblacion_provincia_fk
foreign key (id_provincia)
references provincia(id);

